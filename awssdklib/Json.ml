open CoreTypes

type t = Yojson.Basic.t

module SerializeHelpers = struct
  type t = Yojson.Basic.t

  let unit_to_yojson () : t = `Assoc []
  let string_to_yojson (x : string) : t = `String x
  let int_to_yojson (x : int) : t = `Int x
  let byte_to_yojson (x : int) : t = `Int x (* TODO: check number range *)
  let short_to_yojson (x : int) : t = `Int x (* TODO: check number range *)
  let long_to_yojson (x : int) : t = `Int x (* TODO: check number range *)
  let float_to_yojson (x : float) : t = `Float x
  let double_to_yojson (x : float) : t = `Float x
  let list_to_yojson (converter : 'a -> t) (x : 'a list) : t = `List (List.map converter x)
  let big_int_to_yojson (x : int64) : t = `Int (Int64.to_int x)
  let bool_to_yojson (x : bool) : t = `Bool x
  let json_to_yojson (x : t) = x

  let assoc_to_yojson (x : (string * t option) list) : t =
    `Assoc
      (List.filter_map
         (fun (name, value) -> match value with Some value -> Some (name, value) | None -> None)
         x)

  let blob_to_yojson (x : Bytes.t) : t = `String (Base64.encode_exn (Bytes.to_string x))
  let big_decimal_to_yojson (x : string) : t = `String x

  let map_to_yojson (key_converter : 'k -> t) (value_converter : 'v -> t) (x : ('k * 'v) list) : t =
    `Assoc
      (List.map
         (fun (name, value) ->
           ( ( key_converter name |> function
               | `String x -> x
               | _ -> failwith "expecting string compatible map name" ),
             value_converter value ))
         x)

  let timestamp_to_yojson (x : Timestamp.t) : t = `Float (Timestamp.to_float_s x)
  let option_to_yojson (converter : 'a -> t) (x : 'a option) = Option.map converter x

  let nullable_to_yojson (converter : 'a -> t) (x : 'a Nullable.t) : t =
    match x with Null -> `Null | Value v -> converter v
end

module DeserializeHelpers = struct
  type t = Yojson.Basic.t

  open Yojson.Basic

  type jsonParseError =
    | SyntaxError of string
    | WrongTypeError of string * string
    | NoValueError of string
    | RecordParseError of string * string
    | BytesDecodeError of string
    | CustomError of string
    | UnknownEnumValueError of string * string * string
  [@@deriving show, eq]

  exception JsonDeserializeError of jsonParseError

  let jsonParseErrorToString error =
    match error with
    | SyntaxError error -> {js|Syntax Error: |js} ^ error
    | WrongTypeError (path, expected) ->
        (({js|Wrong Type Error: |js} ^ expected) ^ {js| was expected at path |js}) ^ path
    | NoValueError path -> {js|No Value Error: expected a value at |js} ^ path
    | RecordParseError (path, suberror) ->
        (({js|Record parse error: at path |js} ^ path) ^ {js| received record parse error - |js})
        ^ suberror
    | UnknownEnumValueError (path, type_, value) ->
        Fmt.str "Unknown enum value '%s' at path %s for type %s" value path type_
    | BytesDecodeError path -> "Invalid base64 string at path " ^ path
    | CustomError error -> {js|Other parse error: |js} ^ error

  let deserialize_res converter ?(path = [ "$" ]) (tree : t) =
    try Ok (converter tree path) with JsonDeserializeError error -> Error error

  let path_to_string path = path |> List.rev |> String.concat "."

  let deserialize_wrong_type_error path expected =
    JsonDeserializeError (WrongTypeError (path_to_string path, expected))

  let deserialize_unknown_enum_value_error path type_ value =
    JsonDeserializeError (UnknownEnumValueError (path_to_string path, type_, value))

  let unit_of_yojson (tree : t) path = ()

  let string_of_yojson (tree : t) path =
    match tree with `String x -> x | _ -> raise (deserialize_wrong_type_error path "string")

  let byte_of_yojson (tree : t) path =
    match tree with `Int x -> x | _ -> raise (deserialize_wrong_type_error path "byte")

  let short_of_yojson (tree : t) path =
    match tree with `Int x -> x | _ -> raise (deserialize_wrong_type_error path "short")

  let int_of_yojson (tree : t) path =
    match tree with `Int x -> x | _ -> raise (deserialize_wrong_type_error path "int")

  let long_of_yojson (tree : t) path =
    match tree with `Int x -> x | _ -> raise (deserialize_wrong_type_error path "long")

  let float_of_yojson (tree : t) path =
    match tree with `Float x -> x | _ -> raise (deserialize_wrong_type_error path "float")

  let double_of_yojson (tree : t) path =
    match tree with `Float x -> x | _ -> raise (deserialize_wrong_type_error path "double")

  let list_of_yojson parser (tree : t) path =
    match tree with
    | `List x -> List.mapi (fun i e -> parser e (string_of_int i :: path)) x
    | _ -> raise (deserialize_wrong_type_error path "list")

  let big_int_of_yojson (tree : t) path =
    match tree with
    | `Int x -> Int64.of_int x
    | _ -> raise (deserialize_wrong_type_error path "bigint")

  let bool_of_yojson (tree : t) path =
    match tree with `Bool x -> x | _ -> raise (deserialize_wrong_type_error path "bigint")

  let assoc_of_yojson (tree : t) path =
    match tree with `Assoc l -> l | _ -> raise (deserialize_wrong_type_error path "object")

  let map_of_yojson key_converter value_converter (tree : t) path =
    match tree with
    | `Assoc l ->
        List.map (fun (k, v) -> (key_converter (`String k) path, value_converter v path)) l
    | _ -> raise (deserialize_wrong_type_error path "map")

  let json_of_yojson (tree : t) path = tree

  let blob_of_yojson (tree : t) path =
    match tree with
    | `String base64 -> (
        try base64 |> Base64.decode_exn |> Bytes.of_string
        with _ -> raise (JsonDeserializeError (BytesDecodeError (path_to_string path))))
    | _ -> raise (deserialize_wrong_type_error path "bytes")

  let big_decimal_of_yojson (tree : t) path =
    match tree with
    | `String str -> str
    | _ -> raise (deserialize_wrong_type_error path "bigdecimal")

  let timestamp_epoch_seconds_of_yojson (tree : t) path =
    match tree with
    | `Float fl ->
        CoreTypes.Timestamp.of_float_s fl
        |> Option.get_or_exn
             ~exn:
               (JsonDeserializeError
                  (RecordParseError
                     (path_to_string path, "unable to parse POSIX timestamp as number")))
    | _ -> raise (deserialize_wrong_type_error path "timestamp")

  let value_for_key converter key (l : (string * t) list) path =
    match List.assoc_opt key l with
    | Some value -> converter value (key :: path)
    | None -> raise (JsonDeserializeError (NoValueError (path_to_string (key :: path))))

  let option_of_yojson (converter : (string * t) list -> string list -> 'a)
      (tree : (string * t) list) path =
    try Some (converter tree path) with JsonDeserializeError (NoValueError v) -> None

  let nullable_of_yojson (converter : t -> string list -> 'a) (tree : t) path : 'a Nullable.t =
    try Value (converter tree path) with JsonDeserializeError (NoValueError v) -> Null
end
