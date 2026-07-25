open Types

let http_date_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_httpdate_field path v

let epoch_seconds_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_epoch_field path v

let date_time_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let string_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    path xs

let nested_string_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string_list_to_query path xs

let integer_enum_to_query path (x : integer_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with A -> string_of_int 1 | B -> string_of_int 2 | C -> string_of_int 3)

let integer_enum_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" integer_enum_to_query path xs

let foo_enum_to_query path (x : foo_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with FOO -> "Foo" | BAZ -> "Baz" | BAR -> "Bar" | ONE -> "1" | ZERO -> "0")

let foo_enum_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" foo_enum_to_query path xs

let timestamp_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field p v)
    path xs

let boolean_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field p v)
    path xs

let integer_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.int_field p v)
    path xs

let string_set_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    path xs

let integer_enum_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    integer_enum_to_query path pairs

let integer_enum_set_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" integer_enum_to_query path xs

let foo_enum_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    foo_enum_to_query path pairs

let foo_enum_set_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" foo_enum_to_query path xs

let greeting_struct_to_query path (x : greeting_struct) =
  List.concat
    [
      (match x.hi with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "hi" ]) v);
    ]

let greeting_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" greeting_struct_to_query path xs

let sparse_string_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    path pairs

let sparse_string_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    path xs

let string_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    path pairs

let string_list_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    string_list_to_query path pairs

let double_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.float_field p v)
    path xs

let integer_set_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.int_field p v)
    path xs

let text_plain_blob_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.blob_field path v
let jpeg_blob_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.blob_field path v

let sparse_short_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.int_field p v)
    path xs

let foo_union_to_query path (x : foo_union) =
  match x with
  | String v ->
      Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "string" ]) v
  | Integer v -> Smaws_Lib.Protocols.AwsQuery.Serialize.int_field (List.append path [ "integer" ]) v

let union_set_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" foo_union_to_query path xs

let structure_set_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" greeting_struct_to_query path xs

let list_set_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string_list_to_query path xs

let http_date_set_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" http_date_to_query path xs

let date_time_set_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" date_time_to_query path xs

let timestamp_set_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field p v)
    path xs

let long_set_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.long_field p v)
    path xs

let short_set_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.int_field p v)
    path xs

let byte_set_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.int_field p v)
    path xs

let boolean_set_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field p v)
    path xs

let blob_set_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.blob_field p v)
    path xs

let blob_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.blob_field p v)
    path xs

let byte_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.int_field p v)
    path xs

let date_time_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" date_time_to_query path xs

let float_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.float_field p v)
    path xs

let long_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.long_field p v)
    path xs

let short_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.int_field p v)
    path xs
