open Xmlm

module Write = struct
  type t = { output : output; buf : Buffer.t; mutable started : bool }

  let make ?(decl = false) ?(indent = None) ?ns_prefix () =
    let buf = Buffer.create 1024 in
    let ns_prefix = match ns_prefix with Some f -> f | None -> fun _ -> None in
    let output = make_output ~decl ~indent ~nl:false ~ns_prefix (`Buffer buf) in
    { output; buf; started = false }

  let to_string t = Buffer.contents t.buf
  let emit t signal = Xmlm.output t.output signal

  let ensure_started t =
    if not t.started then (
      emit t (`Dtd None);
      t.started <- true)

  let element ?(ns = "") ?(attrs : (string * string * string option) list = []) t name body =
    ensure_started t;
    let xml_attrs =
      List.filter_map
        (fun (local, value, prefix_opt) ->
          match prefix_opt with
          | Some prefix -> Some (("", prefix ^ ":" ^ local), value)
          | None -> Some (("", local), value))
        attrs
    in
    (* Emit the element name as a literal ["", name] (no xmlm namespace
       tracking) and declare the namespace via an [xmlns] attribute. This keeps
       [element] usable without a pre-registered [ns_prefix] (the generated
       serializers call [Write.make ()] with no [ns_prefix] and still emit
       correct default-namespace XML like [<values xmlns="http://qux.com">]). *)
    let xml_ns_attrs = if ns <> "" then [ (("", "xmlns"), ns) ] else [] in
    emit t (`El_start (("", name), xml_ns_attrs @ xml_attrs));
    body t;
    emit t `El_end

  let element_with_ns ?(attrs : (string * string * string option) list = []) t ns_uri prefix name
      body =
    ensure_started t;
    let xml_attrs =
      List.filter_map
        (fun (local, value, prefix_opt) ->
          match prefix_opt with
          | Some p -> Some (("", p ^ ":" ^ local), value)
          | None -> Some (("", local), value))
        attrs
    in
    (* Literal prefixed name ["", "prefix:name"] (no xmlm namespace tracking)
       plus an [xmlns:prefix] declaration - robust to a missing [ns_prefix] on
       [make]. Produces e.g. [<baz:foo xmlns:baz="http://baz.com">]. *)
    let ns_decl =
      match prefix with
      | Some p -> [ (("", "xmlns:" ^ p), ns_uri) ]
      | None -> [ (("", "xmlns"), ns_uri) ]
    in
    let xml_name = match prefix with Some p -> ("", p ^ ":" ^ name) | None -> ("", name) in
    emit t (`El_start (xml_name, ns_decl @ xml_attrs));
    body t;
    emit t `El_end

  let text t s = emit t (`Data s)
  let null t = ()
end

module Parse = struct
  let source_with_encoding ~src ~encoding =
    let enc =
      Option.bind encoding (fun encoding ->
          match String.lowercase_ascii encoding with "utf-8" -> Some `UTF_8 | _ -> None)
    in
    make_input ~enc ~strip:true (`String (0, src))

  type expected =
    | XmlStartSequence of string * string option
    | XmlEndSequence of string * string option
    | XmlStartElement of string * string option
    | XmlElementData of string * string option
    | XmlEndElement of string * string option
    | XmlDtd
    | XmlOneOfElement of string list
  [@@deriving show, eq]

  type pos = int * int

  exception XmlParse of Xmlm.error
  exception XmlUnexpectedConstruct of expected * signal * pos
  exception XmlMissingElement of string * pos

  (* Raised by the [Primitive] leaf parsers when a value cannot be parsed. [path]
     is the chain of enclosing element names, outermost first; it starts empty
     and is prepended by [Read.sequence]/[Read.sequences]/[Read.element_value]/
     [Read.elements_value] as the exception unwinds, so the [run] boundary can
     report the full element chain. This is the allocation-free analogue of
     [Json.DeserializeHelpers] threading a [path] list: no per-descent consing
     on the happy path, the path is reconstructed only on failure. *)
  type deserialize_error = { path : string list; kind : string; value : string }

  exception XmlDeserializeError of deserialize_error

  let path_to_string p = String.concat "/" p

  (* Unified error for the public, result-returning interface. The internal
     [Read]/[Structure] functions raise [XmlParse]/[XmlUnexpectedConstruct]/
     [XmlMissingElement] (and primitive parsers raise [Failure]/
     [Invalid_argument]); [run] catches them into this type so nothing escapes
     the [request] boundary. Mirrors [Json.DeserializeHelpers.jsonParseError] /
     [deserialize_res]. *)
  type error = XmlParseError of string

  let error_to_string = function XmlParseError s -> s
  let pos_to_string (line, col) = Fmt.str "line %d, col %d" line col

  let signal_to_string = function
    | `El_start _ -> "El_start"
    | `El_end -> "El_end"
    | `Data _ -> "Data"
    | `Dtd _ -> "Dtd"

  module Accept = struct
    let startTag i tag ~ns ~expected =
      let next = input i in
      match next with
      | `El_start ((nns, nname), attributes)
        when (Option.is_none ns || String.equal nns ""
             || String.equal nns (Option.value ns ~default:""))
             && String.equal nname tag ->
          (nns, nname, attributes)
      | _ -> raise (XmlUnexpectedConstruct (expected, next, Xmlm.pos i))

    let endTag i ~expected =
      let next = input i in
      match next with
      | `El_end -> ()
      | _ -> raise (XmlUnexpectedConstruct (expected, next, Xmlm.pos i))

    let data i ~expected =
      let next = input i in
      match next with
      | `Data data -> data
      | _ -> raise (XmlUnexpectedConstruct (expected, next, Xmlm.pos i))

    let dtd i =
      match Xmlm.input i with
      | `Dtd _ -> ()
      | _ as va -> raise (XmlUnexpectedConstruct (XmlDtd, va, Xmlm.pos i))
  end

  let tag_equal name ns ((nns, nname), _) =
    String.equal name nname
    && (Option.is_none ns || String.equal nns "" || String.equal nns (Option.value ns ~default:""))

  module Read = struct
    type 'a reader = input -> attribute list -> 'a

    let sequence i tag (reader : 'a reader) ?ns () =
      let _, _, attributes = Accept.startTag i tag ~ns ~expected:(XmlStartSequence (tag, ns)) in
      (* Decorate any [XmlDeserializeError] raised by the reader with this
         element's tag as it unwinds. Other exceptions (which already carry a
         position) propagate unchanged. *)
      let res =
        try reader i attributes
        with XmlDeserializeError e -> raise (XmlDeserializeError { e with path = tag :: e.path })
      in
      let _ = Accept.endTag i ~expected:(XmlEndSequence (tag, ns)) in
      res

    let element i tag ?ns () =
      let _, _, _ = Accept.startTag i tag ~ns ~expected:(XmlStartElement (tag, ns)) in
      (* Xmlm emits no `Data signal for empty/self-closing elements (<x/>), so
         accept an immediate `El_end as an empty string value. *)
      let data =
        match Xmlm.peek i with
        | `El_end -> ""
        | _ -> Accept.data i ~expected:(XmlElementData (tag, ns))
      in
      let _ = Accept.endTag i ~expected:(XmlEndElement (tag, ns)) in
      data

    (** [element_value i tag conv] reads the text of [<tag>] and runs [conv] on it, decorating a
        parse failure with [tag]. [conv] is a function value (e.g. [Primitive.float_of_string]), so
        no closure is allocated per call. *)
    let element_value i tag conv ?ns () =
      let s = element i tag ?ns () in
      try conv s
      with XmlDeserializeError e -> raise (XmlDeserializeError { e with path = tag :: e.path })

    let elements i tag ?ns () =
      let rec readList ~items =
        match Xmlm.peek i with
        | `El_start el when tag_equal tag ns el ->
            let next = element i tag ?ns () in
            readList ~items:(next :: items)
        | _ -> items
      in
      readList ~items:[] |> List.rev

    (** [elements_value i tag conv] reads every [<tag>] child's text and maps [conv] across them,
        decorating each parse failure with [tag]. The per-element closure is allocated once for the
        whole list, not per item. *)
    let elements_value i tag conv ?ns () =
      let xs = elements i tag ?ns () in
      List.map
        (fun s ->
          try conv s
          with XmlDeserializeError e ->
            raise (XmlDeserializeError { e with path = tag :: e.path }))
        xs

    let sequences i tag reader ?ns () =
      let rec readList ~items =
        match Xmlm.peek i with
        | `El_start el when tag_equal tag ns el ->
            let next = sequence i tag reader ?ns () in
            readList ~items:(next :: items)
        | _ -> items
      in
      readList ~items:[] |> List.rev

    let optionalElements i tag ?ns () =
      let elements = elements i tag ?ns () in
      match List.is_empty elements with true -> None | false -> Some elements

    let optionalElement i tag ?ns () =
      match Xmlm.peek i with
      | `El_start el when tag_equal tag ns el -> Some (element i tag ?ns ())
      | _ -> None

    let dtd i = Accept.dtd i

    let skip_element i =
      ignore (Xmlm.input i);
      let depth = ref 1 in
      while !depth > 0 do
        match Xmlm.input i with `El_start _ -> incr depth | `El_end -> decr depth | _ -> ()
      done

    (** Consume remaining sibling elements and whitespace until the enclosing element's end tag is
        reached. The end tag itself is left unconsumed so the caller's [Accept.endTag] can read it.
        Used to skip protocol envelope siblings such as awsQuery's <ResponseMetadata>. *)
    let skip_to_end i =
      let rec loop () =
        match Xmlm.peek i with
        | `El_end -> ()
        | `El_start _ ->
            skip_element i;
            loop ()
        | _ ->
            ignore (Xmlm.input i);
            loop ()
      in
      loop ()

    let data i = Accept.data i ~expected:(XmlElementData ("", None))
  end

  module Structure = struct
    type 'returnType inputType =
      | InputStringElement : string inputType
      | InputStringElements : string list inputType
      | InputStructureElement : 'returnType Read.reader -> 'returnType inputType
      | InputStructuresElement : 'returnType Read.reader -> 'returnType list inputType

    type 'a inputItem = { tag : string; type_ : 'a inputType }

    exception InputUnordered of string
    exception MissingElement of string * Xmlm.pos

    let item1 : type a. input -> a inputItem -> a option =
     fun i t1 ->
      match t1.type_ with
      | InputStringElement -> Read.optionalElement i t1.tag ()
      | InputStringElements -> Some (Read.elements i t1.tag ())
      | InputStructureElement reader -> Some (Read.sequence i t1.tag reader ())
      | InputStructuresElement reader -> Some (Read.sequences i t1.tag reader ())

    let scanSequence i expectedTags reader =
      let break = ref false in
      while not break.contents do
        let next = Xmlm.peek i in
        match next with
        | `El_start ((_, tag), _) -> reader tag next
        | `El_end -> break := true
        | `Dtd _ | `Data _ ->
            raise (XmlUnexpectedConstruct (XmlOneOfElement expectedTags, next, Xmlm.pos i))
      done

    let item2 : type a b. input -> a inputItem -> b inputItem -> a option * b option =
     fun i t1 t2 ->
      let r1 = ref None in
      let r2 = ref None in
      scanSequence i [ t1.tag; t2.tag ] (fun tag next ->
          if String.equal t1.tag tag then r1 := item1 i t1
          else if String.equal t2.tag tag then r2 := item1 i t2
          else raise (XmlUnexpectedConstruct (XmlOneOfElement [ t1.tag; t2.tag ], next, Xmlm.pos i)));
      (!r1, !r2)

    let item3 : type a b c.
        input -> a inputItem -> b inputItem -> c inputItem -> a option * b option * c option =
     fun i t1 t2 t3 ->
      let r1 = ref None in
      let r2 = ref None in
      let r3 = ref None in
      scanSequence i [ t1.tag; t2.tag; t3.tag ] (fun tag next ->
          match tag with
          | _ when String.equal t1.tag tag -> r1 := item1 i t1
          | _ when String.equal t2.tag tag -> r2 := item1 i t2
          | _ when String.equal t3.tag tag -> r3 := item1 i t3
          | _ ->
              raise
                (XmlUnexpectedConstruct
                   (XmlOneOfElement [ t1.tag; t2.tag; t3.tag ], next, Xmlm.pos i)));
      (!r1, !r2, !r3)

    let item4 : type a b c d.
        input ->
        a inputItem ->
        b inputItem ->
        c inputItem ->
        d inputItem ->
        a option * b option * c option * d option =
     fun i t1 t2 t3 t4 ->
      let r1 = ref None in
      let r2 = ref None in
      let r3 = ref None in
      let r4 = ref None in
      scanSequence i [ t1.tag; t2.tag; t3.tag; t4.tag ] (fun tag next ->
          match tag with
          | _ when String.equal t1.tag tag -> r1 := item1 i t1
          | _ when String.equal t2.tag tag -> r2 := item1 i t2
          | _ when String.equal t3.tag tag -> r3 := item1 i t3
          | _ when String.equal t4.tag tag -> r4 := item1 i t4
          | _ ->
              raise
                (XmlUnexpectedConstruct
                   (XmlOneOfElement [ t1.tag; t2.tag; t3.tag; t4.tag ], next, Xmlm.pos i)));
      (!r1, !r2, !r3, !r4)

    let item5 : type a b c d e.
        input ->
        a inputItem ->
        b inputItem ->
        c inputItem ->
        d inputItem ->
        e inputItem ->
        a option * b option * c option * d option * e option =
     fun i t1 t2 t3 t4 t5 ->
      let r1 = ref None in
      let r2 = ref None in
      let r3 = ref None in
      let r4 = ref None in
      let r5 = ref None in
      scanSequence i [ t1.tag; t2.tag; t3.tag; t4.tag; t5.tag ] (fun tag next ->
          match tag with
          | _ when String.equal t1.tag tag -> r1 := item1 i t1
          | _ when String.equal t2.tag tag -> r2 := item1 i t2
          | _ when String.equal t3.tag tag -> r3 := item1 i t3
          | _ when String.equal t4.tag tag -> r4 := item1 i t4
          | _ when String.equal t5.tag tag -> r5 := item1 i t5
          | _ ->
              raise
                (XmlUnexpectedConstruct
                   (XmlOneOfElement [ t1.tag; t2.tag; t3.tag; t4.tag; t5.tag ], next, Xmlm.pos i)));
      (!r1, !r2, !r3, !r4, !r5)

    let item6 : type a b c d e f.
        input ->
        a inputItem ->
        b inputItem ->
        c inputItem ->
        d inputItem ->
        e inputItem ->
        f inputItem ->
        a option * b option * c option * d option * e option * f option =
     fun i t1 t2 t3 t4 t5 t6 ->
      let r1 = ref None in
      let r2 = ref None in
      let r3 = ref None in
      let r4 = ref None in
      let r5 = ref None in
      let r6 = ref None in
      scanSequence i [ t1.tag; t2.tag; t3.tag; t4.tag; t5.tag; t6.tag ] (fun tag next ->
          match tag with
          | _ when String.equal t1.tag tag -> r1 := item1 i t1
          | _ when String.equal t2.tag tag -> r2 := item1 i t2
          | _ when String.equal t3.tag tag -> r3 := item1 i t3
          | _ when String.equal t4.tag tag -> r4 := item1 i t4
          | _ when String.equal t5.tag tag -> r5 := item1 i t5
          | _ when String.equal t6.tag tag -> r6 := item1 i t6
          | _ ->
              raise
                (XmlUnexpectedConstruct
                   ( XmlOneOfElement [ t1.tag; t2.tag; t3.tag; t4.tag; t5.tag; t6.tag ],
                     next,
                     Xmlm.pos i )));
      (!r1, !r2, !r3, !r4, !r5, !r6)

    let item7 : type a b c d e f g.
        input ->
        a inputItem ->
        b inputItem ->
        c inputItem ->
        d inputItem ->
        e inputItem ->
        f inputItem ->
        g inputItem ->
        a option * b option * c option * d option * e option * f option * g option =
     fun i t1 t2 t3 t4 t5 t6 t7 ->
      let r1 = ref None in
      let r2 = ref None in
      let r3 = ref None in
      let r4 = ref None in
      let r5 = ref None in
      let r6 = ref None in
      let r7 = ref None in
      scanSequence i [ t1.tag; t2.tag; t3.tag; t4.tag; t5.tag; t6.tag; t7.tag ] (fun tag next ->
          match tag with
          | _ when String.equal t1.tag tag -> r1 := item1 i t1
          | _ when String.equal t2.tag tag -> r2 := item1 i t2
          | _ when String.equal t3.tag tag -> r3 := item1 i t3
          | _ when String.equal t4.tag tag -> r4 := item1 i t4
          | _ when String.equal t5.tag tag -> r5 := item1 i t5
          | _ when String.equal t6.tag tag -> r6 := item1 i t6
          | _ when String.equal t7.tag tag -> r7 := item1 i t7
          | _ ->
              raise
                (XmlUnexpectedConstruct
                   ( XmlOneOfElement [ t1.tag; t2.tag; t3.tag; t4.tag; t5.tag; t6.tag; t7.tag ],
                     next,
                     Xmlm.pos i )));
      (!r1, !r2, !r3, !r4, !r5, !r6, !r7)
  end

  let required tag value i =
    match value with Some value -> value | None -> raise (XmlMissingElement (tag, Xmlm.pos i))

  (** Leaf-value parsers used by generated restXml deserialisers. Each parses a primitive from its
      XML text and raises [XmlDeserializeError] (with an empty path) on failure; the enclosing
      [Read.sequence]/[Read.element_value] /etc. prepend their element tags as the exception
      unwinds, so [run] can report the full element chain. These replace bare
      [Stdlib.int_of_string]/ [float_of_string]/etc., which raised [Failure] with no element
      context. *)
  module Primitive = struct
    let fail ~kind ~value = raise (XmlDeserializeError { path = []; kind; value })

    let int_of_string s =
      try Stdlib.int_of_string s with Failure _ -> fail ~kind:"integer" ~value:s

    let long_of_string s = try CoreTypes.Int64.of_string s with _ -> fail ~kind:"long" ~value:s

    let big_int_of_string s =
      try CoreTypes.BigInt.of_string s with _ -> fail ~kind:"bigint" ~value:s

    let big_decimal_of_string s =
      try CoreTypes.BigDecimal.of_string s with _ -> fail ~kind:"bigdecimal" ~value:s

    let bool_of_string s =
      try Stdlib.bool_of_string s with Failure _ -> fail ~kind:"boolean" ~value:s

    let float_of_string s =
      try Stdlib.float_of_string s with Failure _ -> fail ~kind:"float" ~value:s

    let double_of_string s =
      try Stdlib.float_of_string s with Failure _ -> fail ~kind:"double" ~value:s

    let blob_of_string s =
      try Bytes.of_string (Base64.decode_exn s) with _ -> fail ~kind:"blob" ~value:s

    let timestamp_iso_of_string s =
      match Ptime.of_rfc3339 s with
      | Ok (ts, _, _) -> ts
      | Error _ -> fail ~kind:"timestamp(rfc3339)" ~value:s

    let timestamp_epoch_of_string s =
      let f =
        try Stdlib.float_of_string s
        with Failure _ -> fail ~kind:"timestamp(epoch-seconds)" ~value:s
      in
      match Ptime.of_float_s f with
      | Some t -> t
      | None -> fail ~kind:"timestamp(epoch-seconds)" ~value:s

    let timestamp_httpdate_of_string s =
      let parse () =
        Scanf.sscanf s "%s@, %d %s %d %d:%d:%d GMT"
          (fun _weekday day month_str year hour minute second ->
            let month =
              match month_str with
              | "Jan" -> 1
              | "Feb" -> 2
              | "Mar" -> 3
              | "Apr" -> 4
              | "May" -> 5
              | "Jun" -> 6
              | "Jul" -> 7
              | "Aug" -> 8
              | "Sep" -> 9
              | "Oct" -> 10
              | "Nov" -> 11
              | _ -> 12
            in
            match Ptime.of_date_time ((year, month, day), ((hour, minute, second), 0)) with
            | Some t -> t
            | None -> fail ~kind:"timestamp(http-date)" ~value:s)
      in
      try parse () with _ -> fail ~kind:"timestamp(http-date)" ~value:s
  end

  (* Run a direct-style parser [f] (which may raise any of the internal XML
     exceptions or a primitive-parser [Failure]/[Invalid_argument]) and catch
     every failure into [error]. This is the result-returning boundary that
     keeps exceptions internal - mirrors [Json.DeserializeHelpers.deserialize_res]. *)
  let run f =
    try Ok (f ()) with
    | XmlParse e -> Error (XmlParseError (Xmlm.error_message e))
    | XmlUnexpectedConstruct (_, signal, pos) ->
        Error
          (XmlParseError
             (Fmt.str "unexpected XML construct (%s) at %s" (signal_to_string signal)
                (pos_to_string pos)))
    | XmlMissingElement (tag, pos) ->
        Error (XmlParseError (Fmt.str "missing element %S at %s" tag (pos_to_string pos)))
    | Structure.MissingElement (tag, pos) ->
        Error (XmlParseError (Fmt.str "missing element %S at %s" tag (pos_to_string pos)))
    | Structure.InputUnordered msg -> Error (XmlParseError msg)
    | XmlDeserializeError e ->
        Error
          (XmlParseError (Fmt.str "invalid %s at %s: %S" e.kind (path_to_string e.path) e.value))
    | Failure msg | Invalid_argument msg -> Error (XmlParseError msg)
    | exn -> Error (XmlParseError (Printexc.to_string exn))
end
