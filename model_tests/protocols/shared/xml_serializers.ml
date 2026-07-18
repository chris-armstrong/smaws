open Types
let foo_union_to_xml w (x : foo_union) =
  match x with
  | Integer v ->
      Smaws_Lib.Xml.Write.element w "integer"
        (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int v))
  | String v ->
      Smaws_Lib.Xml.Write.element w "string"
        (fun w -> Smaws_Lib.Xml.Write.text w v)
let union_set_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w -> foo_union_to_xml w item)) xs
let timestamp_set_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w ->
            (fun w v ->
               Smaws_Lib.Xml.Write.text w
                 (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string
                    v)) w item)) xs
let timestamp_list_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w ->
            (fun w v ->
               Smaws_Lib.Xml.Write.text w
                 (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string
                    v)) w item)) xs
let text_plain_blob_to_xml w v =
  Smaws_Lib.Xml.Write.text w (Base64.encode_exn (Bytes.to_string v))
let greeting_struct_to_xml w (x : greeting_struct) =
  ignore
    [(match x.hi with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "hi"
            (fun w -> Smaws_Lib.Xml.Write.text w v))]
let structure_set_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w -> greeting_struct_to_xml w item)) xs
let string_set_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w item)) xs
let string_map_to_xml w pairs =
  List.iter
    (fun (k, v) ->
       Smaws_Lib.Xml.Write.element w "entry"
         (fun w ->
            Smaws_Lib.Xml.Write.element w "key"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
            Smaws_Lib.Xml.Write.element w "value"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w v)))
    pairs
let string_list_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w item)) xs
let string_list_map_to_xml w pairs =
  List.iter
    (fun (k, v) ->
       Smaws_Lib.Xml.Write.element w "entry"
         (fun w ->
            Smaws_Lib.Xml.Write.element w "key"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
            Smaws_Lib.Xml.Write.element w "value"
              (fun w -> string_list_to_xml w v))) pairs
let sparse_string_map_to_xml w pairs =
  List.iter
    (fun (k, v) ->
       Smaws_Lib.Xml.Write.element w "entry"
         (fun w ->
            Smaws_Lib.Xml.Write.element w "key"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
            Smaws_Lib.Xml.Write.element w "value"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w v)))
    pairs
let sparse_string_list_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w item)) xs
let sparse_short_list_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w ->
            (fun w v -> Smaws_Lib.Xml.Write.text w (string_of_int v)) w item))
    xs
let short_set_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w ->
            (fun w v -> Smaws_Lib.Xml.Write.text w (string_of_int v)) w item))
    xs
let short_list_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w ->
            (fun w v -> Smaws_Lib.Xml.Write.text w (string_of_int v)) w item))
    xs
let nested_string_list_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w -> string_list_to_xml w item)) xs
let long_set_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w ->
            (fun w v ->
               Smaws_Lib.Xml.Write.text w
                 (Smaws_Lib.CoreTypes.Int64.to_string v)) w item)) xs
let long_list_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w ->
            (fun w v ->
               Smaws_Lib.Xml.Write.text w
                 (Smaws_Lib.CoreTypes.Int64.to_string v)) w item)) xs
let list_set_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w -> string_list_to_xml w item)) xs
let jpeg_blob_to_xml w v =
  Smaws_Lib.Xml.Write.text w (Base64.encode_exn (Bytes.to_string v))
let integer_set_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w ->
            (fun w v -> Smaws_Lib.Xml.Write.text w (string_of_int v)) w item))
    xs
let integer_list_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w ->
            (fun w v -> Smaws_Lib.Xml.Write.text w (string_of_int v)) w item))
    xs
let integer_enum_to_xml w (x : integer_enum) =
  Smaws_Lib.Xml.Write.text w
    (match x with
     | C -> string_of_int 3
     | B -> string_of_int 2
     | A -> string_of_int 1)
let integer_enum_set_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w -> integer_enum_to_xml w item)) xs
let integer_enum_map_to_xml w pairs =
  List.iter
    (fun (k, v) ->
       Smaws_Lib.Xml.Write.element w "entry"
         (fun w ->
            Smaws_Lib.Xml.Write.element w "key"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
            Smaws_Lib.Xml.Write.element w "value"
              (fun w -> integer_enum_to_xml w v))) pairs
let integer_enum_list_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w -> integer_enum_to_xml w item)) xs
let http_date_to_xml w v =
  Smaws_Lib.Xml.Write.text w
    (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v)
let http_date_set_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w -> http_date_to_xml w item)) xs
let greeting_list_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w -> greeting_struct_to_xml w item)) xs
let foo_enum_to_xml w (x : foo_enum) =
  Smaws_Lib.Xml.Write.text w
    (match x with
     | ZERO -> "0"
     | ONE -> "1"
     | BAR -> "Bar"
     | BAZ -> "Baz"
     | FOO -> "Foo")
let foo_enum_set_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w -> foo_enum_to_xml w item)) xs
let foo_enum_map_to_xml w pairs =
  List.iter
    (fun (k, v) ->
       Smaws_Lib.Xml.Write.element w "entry"
         (fun w ->
            Smaws_Lib.Xml.Write.element w "key"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
            Smaws_Lib.Xml.Write.element w "value"
              (fun w -> foo_enum_to_xml w v))) pairs
let foo_enum_list_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w -> foo_enum_to_xml w item)) xs
let float_list_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w ->
            (fun w v ->
               Smaws_Lib.Xml.Write.text w
                 (Smaws_Lib.Protocols.AwsQuery.Serialize.float_to_string v))
              w item)) xs
let epoch_seconds_to_xml w v =
  Smaws_Lib.Xml.Write.text w
    (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_epoch_to_string v)
let double_list_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w ->
            (fun w v ->
               Smaws_Lib.Xml.Write.text w
                 (Smaws_Lib.Protocols.AwsQuery.Serialize.float_to_string v))
              w item)) xs
let date_time_to_xml w v =
  Smaws_Lib.Xml.Write.text w
    (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)
let date_time_set_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w -> date_time_to_xml w item)) xs
let date_time_list_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w -> date_time_to_xml w item)) xs
let byte_set_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w ->
            (fun w v -> Smaws_Lib.Xml.Write.text w (string_of_int v)) w item))
    xs
let byte_list_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w ->
            (fun w v -> Smaws_Lib.Xml.Write.text w (string_of_int v)) w item))
    xs
let boolean_set_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w ->
            (fun w v -> Smaws_Lib.Xml.Write.text w (string_of_bool v)) w item))
    xs
let boolean_list_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w ->
            (fun w v -> Smaws_Lib.Xml.Write.text w (string_of_bool v)) w item))
    xs
let blob_set_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w ->
            (fun w v ->
               Smaws_Lib.Xml.Write.text w
                 (Base64.encode_exn (Bytes.to_string v))) w item)) xs
let blob_list_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w ->
            (fun w v ->
               Smaws_Lib.Xml.Write.text w
                 (Base64.encode_exn (Bytes.to_string v))) w item)) xs