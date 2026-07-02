open Types

let unit_of_xml _ = ()
let foo_union_of_xml _i = failwith "union xml deserialization not implemented"

let union_set_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> foo_union_of_xml i) ()

let timestamp_set_of_xml i =
  List.map
    (fun s ->
      let ts, _, _ = Result.get_ok (Ptime.of_rfc3339 s) in
      ts)
    (Smaws_Lib.Xml.Parse.Read.elements i "member" ())

let timestamp_list_of_xml i =
  List.map
    (fun s ->
      let ts, _, _ = Result.get_ok (Ptime.of_rfc3339 s) in
      ts)
    (Smaws_Lib.Xml.Parse.Read.elements i "member" ())

let text_plain_blob_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.blob_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let greeting_struct_of_xml i =
  let r_hi = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "hi" ] (fun tag _ ->
      match tag with
      | "hi" -> r_hi := Some (Smaws_Lib.Xml.Parse.Read.element i "hi" ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ hi = ( ! ) r_hi } : greeting_struct)

let structure_set_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> greeting_struct_of_xml i) ()

let string_set_of_xml i = Smaws_Lib.Xml.Parse.Read.elements i "member" ()

let string_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.element i "key" () in
      let v = Smaws_Lib.Xml.Parse.Read.element i "value" () in
      (k, v))
    ()

let string_list_of_xml i = Smaws_Lib.Xml.Parse.Read.elements i "member" ()

let string_list_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.element i "key" () in
      let v = Smaws_Lib.Xml.Parse.Read.sequence i "value" (fun i _ -> string_list_of_xml i) () in
      (k, v))
    ()

let sparse_string_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.element i "key" () in
      let v = Smaws_Lib.Xml.Parse.Read.element i "value" () in
      (k, v))
    ()

let sparse_string_list_of_xml i = Smaws_Lib.Xml.Parse.Read.elements i "member" ()

let sparse_short_list_of_xml i =
  List.map (fun s -> int_of_string s) (Smaws_Lib.Xml.Parse.Read.elements i "member" ())

let short_set_of_xml i =
  List.map (fun s -> int_of_string s) (Smaws_Lib.Xml.Parse.Read.elements i "member" ())

let short_list_of_xml i =
  List.map (fun s -> int_of_string s) (Smaws_Lib.Xml.Parse.Read.elements i "member" ())

let nested_string_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string_list_of_xml i) ()

let long_set_of_xml i =
  List.map (fun s -> int_of_string s) (Smaws_Lib.Xml.Parse.Read.elements i "member" ())

let long_list_of_xml i =
  List.map (fun s -> int_of_string s) (Smaws_Lib.Xml.Parse.Read.elements i "member" ())

let list_set_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string_list_of_xml i) ()

let jpeg_blob_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.blob_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let integer_set_of_xml i =
  List.map (fun s -> int_of_string s) (Smaws_Lib.Xml.Parse.Read.elements i "member" ())

let integer_list_of_xml i =
  List.map (fun s -> int_of_string s) (Smaws_Lib.Xml.Parse.Read.elements i "member" ())

let integer_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "3" -> C | "2" -> B | "1" -> A | _ -> failwith "unknown enum value"
    : integer_enum)

let integer_enum_set_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> integer_enum_of_xml i) ()

let integer_enum_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.element i "key" () in
      let v = Smaws_Lib.Xml.Parse.Read.sequence i "value" (fun i _ -> integer_enum_of_xml i) () in
      (k, v))
    ()

let integer_enum_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> integer_enum_of_xml i) ()

let http_date_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_httpdate_of_string
    (Smaws_Lib.Xml.Parse.Read.data i)

let http_date_set_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> http_date_of_xml i) ()

let greeting_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> greeting_struct_of_xml i) ()

let foo_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "0" -> ZERO
   | "1" -> ONE
   | "Bar" -> BAR
   | "Baz" -> BAZ
   | "Foo" -> FOO
   | _ -> failwith "unknown enum value"
    : foo_enum)

let foo_enum_set_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> foo_enum_of_xml i) ()

let foo_enum_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.element i "key" () in
      let v = Smaws_Lib.Xml.Parse.Read.sequence i "value" (fun i _ -> foo_enum_of_xml i) () in
      (k, v))
    ()

let foo_enum_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> foo_enum_of_xml i) ()

let float_list_of_xml i =
  List.map (fun s -> float_of_string s) (Smaws_Lib.Xml.Parse.Read.elements i "member" ())

let epoch_seconds_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_epoch_of_string
    (Smaws_Lib.Xml.Parse.Read.data i)

let double_list_of_xml i =
  List.map (fun s -> float_of_string s) (Smaws_Lib.Xml.Parse.Read.elements i "member" ())

let date_time_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let date_time_set_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> date_time_of_xml i) ()

let date_time_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> date_time_of_xml i) ()

let byte_set_of_xml i =
  List.map (fun s -> int_of_string s) (Smaws_Lib.Xml.Parse.Read.elements i "member" ())

let byte_list_of_xml i =
  List.map (fun s -> int_of_string s) (Smaws_Lib.Xml.Parse.Read.elements i "member" ())

let boolean_set_of_xml i =
  List.map (fun s -> bool_of_string s) (Smaws_Lib.Xml.Parse.Read.elements i "member" ())

let boolean_list_of_xml i =
  List.map (fun s -> bool_of_string s) (Smaws_Lib.Xml.Parse.Read.elements i "member" ())

let blob_set_of_xml i =
  List.map
    (fun s -> Bytes.of_string (Base64.decode_exn s))
    (Smaws_Lib.Xml.Parse.Read.elements i "member" ())

let blob_list_of_xml i =
  List.map
    (fun s -> Bytes.of_string (Base64.decode_exn s))
    (Smaws_Lib.Xml.Parse.Read.elements i "member" ())
