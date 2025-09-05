open Smaws_Lib
type nonrec my_union =
  | StructureValue of Shared.greeting_struct [@ocaml.doc ""]
  | MapValue of Shared.string_map [@ocaml.doc ""]
  | ListValue of Shared.string_list [@ocaml.doc ""]
  | EnumValue of Shared.foo_enum [@ocaml.doc ""]
  | TimestampValue of Smaws_Lib.Smithy_api.timestamp_ [@ocaml.doc ""]
  | BlobValue of Smaws_Lib.Smithy_api.blob [@ocaml.doc ""]
  | NumberValue of Smaws_Lib.Smithy_api.integer_ [@ocaml.doc ""]
  | BooleanValue of Smaws_Lib.Smithy_api.boolean_ [@ocaml.doc ""]
  | StringValue of Smaws_Lib.Smithy_api.string_ [@ocaml.doc ""][@@ocaml.doc
                                                                 "A union with a representative set of types for members."]
[@@deriving show][@@deriving eq]
type nonrec union_input_output = {
  contents: my_union option [@ocaml.doc ""]}[@@ocaml.doc
                                              "A shared structure that contains a single union member."]
[@@deriving show][@@deriving eq]
type nonrec struct_with_json_name =
  {
  value: Smaws_Lib.Smithy_api.string_ option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec sparse_nulls_operation_input_output =
  {
  sparse_string_map: Shared.sparse_string_map option [@ocaml.doc ""];
  sparse_string_list: Shared.sparse_string_list option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec simple_struct =
  {
  value: Smaws_Lib.Smithy_api.string_ option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec simple_scalar_properties_input_output =
  {
  double_value: Smaws_Lib.Smithy_api.double option [@ocaml.doc ""];
  float_value: Smaws_Lib.Smithy_api.float_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec put_with_content_encoding_input =
  {
  data: Smaws_Lib.Smithy_api.string_ option [@ocaml.doc ""];
  encoding: Smaws_Lib.Smithy_api.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                  ""]
[@@deriving show][@@deriving eq]
type nonrec document = CoreTypes.Document.t[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec put_and_get_inline_documents_input_output =
  {
  inline_document: document option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec operation_with_optional_input_output_output =
  {
  value: Smaws_Lib.Smithy_api.string_ option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec operation_with_optional_input_output_input =
  {
  value: Smaws_Lib.Smithy_api.string_ option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec null_operation_input_output =
  {
  string_: Smaws_Lib.Smithy_api.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                 ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec map_of_structs =
  (Smaws_Lib.Smithy_api.string_ * simple_struct) list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec map_of_strings =
  (Smaws_Lib.Smithy_api.string_ * Smaws_Lib.Smithy_api.string_) list[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec map_of_map_of_strings =
  (Smaws_Lib.Smithy_api.string_ * map_of_strings) list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec list_of_strings = Smaws_Lib.Smithy_api.string_ list[@@ocaml.doc
                                                                 ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec map_of_lists_of_strings =
  (Smaws_Lib.Smithy_api.string_ * list_of_strings) list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec empty_struct = unit[@@ocaml.doc ""][@@deriving show][@@deriving
                                                                  eq]
type nonrec json_value = string[@@ocaml.doc ""][@@deriving show][@@deriving
                                                                  eq]
type nonrec list_of_list_of_strings = list_of_strings list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec list_of_maps_of_strings = map_of_strings list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec list_of_structs = simple_struct list[@@ocaml.doc ""][@@deriving
                                                                  show]
[@@deriving eq]
type kitchen_sink =
  {
  unix_timestamp: Smaws_Lib.Smithy_api.timestamp_ option [@ocaml.doc ""];
  timestamp_: Smaws_Lib.Smithy_api.timestamp_ option [@ocaml.doc ""];
  struct_with_json_name: struct_with_json_name option [@ocaml.doc ""];
  string_: Smaws_Lib.Smithy_api.string_ option [@ocaml.doc ""];
  simple_struct: simple_struct option [@ocaml.doc ""];
  recursive_struct: kitchen_sink option [@ocaml.doc ""];
  recursive_map: map_of_kitchen_sinks option [@ocaml.doc ""];
  recursive_list: list_of_kitchen_sinks option [@ocaml.doc ""];
  map_of_structs: map_of_structs option [@ocaml.doc ""];
  map_of_strings: map_of_strings option [@ocaml.doc ""];
  map_of_maps: map_of_map_of_strings option [@ocaml.doc ""];
  map_of_lists_of_strings: map_of_lists_of_strings option [@ocaml.doc ""];
  long: Smaws_Lib.Smithy_api.long option [@ocaml.doc ""];
  list_of_structs: list_of_structs option [@ocaml.doc ""];
  list_of_strings: list_of_strings option [@ocaml.doc ""];
  list_of_maps_of_strings: list_of_maps_of_strings option [@ocaml.doc ""];
  list_of_lists: list_of_list_of_strings option [@ocaml.doc ""];
  json_value: json_value option [@ocaml.doc ""];
  iso8601_timestamp: Smaws_Lib.Smithy_api.timestamp_ option [@ocaml.doc ""];
  integer_: Smaws_Lib.Smithy_api.integer_ option [@ocaml.doc ""];
  httpdate_timestamp: Smaws_Lib.Smithy_api.timestamp_ option [@ocaml.doc ""];
  float_: Smaws_Lib.Smithy_api.float_ option [@ocaml.doc ""];
  empty_struct: empty_struct option [@ocaml.doc ""];
  double: Smaws_Lib.Smithy_api.double option [@ocaml.doc ""];
  boolean_: Smaws_Lib.Smithy_api.boolean_ option [@ocaml.doc ""];
  blob: Smaws_Lib.Smithy_api.blob option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
and list_of_kitchen_sinks = kitchen_sink list[@@ocaml.doc ""][@@deriving
                                                               show][@@deriving
                                                                    eq]
and map_of_kitchen_sinks = (Smaws_Lib.Smithy_api.string_ * kitchen_sink) list
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec error_without_members = unit[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec error_with_members =
  {
  string_field: Smaws_Lib.Smithy_api.string_ option [@ocaml.doc "abc"];
  message: Smaws_Lib.Smithy_api.string_ option [@ocaml.doc ""];
  map_field: map_of_strings option [@ocaml.doc ""];
  list_field: list_of_strings option [@ocaml.doc ""];
  integer_field: Smaws_Lib.Smithy_api.integer_ option [@ocaml.doc ""];
  complex_data: kitchen_sink option [@ocaml.doc ""];
  code: Smaws_Lib.Smithy_api.string_ option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec json_int_enums_input_output =
  {
  int_enum_map: Shared.integer_enum_map option [@ocaml.doc ""];
  int_enum_set: Shared.integer_enum_set option [@ocaml.doc ""];
  int_enum_list: Shared.integer_enum_list option [@ocaml.doc ""];
  int_enum3: Shared.integer_enum option [@ocaml.doc ""];
  int_enum2: Shared.integer_enum option [@ocaml.doc ""];
  int_enum1: Shared.integer_enum option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec json_enums_input_output =
  {
  foo_enum_map: Shared.foo_enum_map option [@ocaml.doc ""];
  foo_enum_set: Shared.foo_enum_set option [@ocaml.doc ""];
  foo_enum_list: Shared.foo_enum_list option [@ocaml.doc ""];
  foo_enum3: Shared.foo_enum option [@ocaml.doc ""];
  foo_enum2: Shared.foo_enum option [@ocaml.doc ""];
  foo_enum1: Shared.foo_enum option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec invalid_greeting =
  {
  message: Smaws_Lib.Smithy_api.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                 "This error is thrown when an invalid greeting value is provided."]
[@@deriving show][@@deriving eq]
type nonrec foo_error = unit[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec complex_nested_error_data =
  {
  foo: Smaws_Lib.Smithy_api.string_ option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec complex_error =
  {
  nested: complex_nested_error_data option [@ocaml.doc ""];
  top_level: Smaws_Lib.Smithy_api.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   "This error is thrown when a request is invalid."]
[@@deriving show][@@deriving eq]
type nonrec greeting_with_errors_output =
  {
  greeting: Smaws_Lib.Smithy_api.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                  ""]
[@@deriving show][@@deriving eq]
type nonrec fractional_seconds_output =
  {
  datetime: Shared.date_time option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec host_label_input =
  {
  label: Smaws_Lib.Smithy_api.string_ [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec datetime_offsets_output =
  {
  datetime: Shared.date_time option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec content_type_parameters_output = unit[@@ocaml.doc ""][@@deriving
                                                                   show]
[@@deriving eq]
type nonrec content_type_parameters_input =
  {
  value: Smaws_Lib.Smithy_api.integer_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                ""][@@deriving
                                                                    show]
[@@deriving eq]