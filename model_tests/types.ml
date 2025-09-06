open Smaws_Lib
type nonrec my_union =
  | StructureValue of protocol_tests_shared._greeting_struct [@ocaml.doc ""]
  | MapValue of protocol_tests_shared._string_map [@ocaml.doc ""]
  | ListValue of protocol_tests_shared._string_list [@ocaml.doc ""]
  | EnumValue of protocol_tests_shared._foo_enum [@ocaml.doc ""]
  | TimestampValue of float_ [@ocaml.doc ""]
  | BlobValue of string_ [@ocaml.doc ""]
  | NumberValue of int_ [@ocaml.doc ""]
  | BooleanValue of bool_ [@ocaml.doc ""]
  | StringValue of string_ [@ocaml.doc ""][@@ocaml.doc
                                            "A union with a representative set of types for members."]
[@@deriving show][@@deriving eq]
type nonrec union_input_output = {
  contents: my_union option [@ocaml.doc ""]}[@@ocaml.doc
                                              "A shared structure that contains a single union member."]
[@@deriving show][@@deriving eq]
type nonrec struct_with_json_name = {
  value: string_ option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec sparse_nulls_operation_input_output =
  {
  sparse_string_map: protocol_tests_shared._sparse_string_map option
    [@ocaml.doc ""];
  sparse_string_list: protocol_tests_shared._sparse_string_list option
    [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec simple_struct = {
  value: string_ option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec simple_scalar_properties_input_output =
  {
  double_value: float_ option [@ocaml.doc ""];
  float_value: float_ option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                               show][@@deriving
                                                                    eq]
type nonrec put_with_content_encoding_input =
  {
  data: string_ option [@ocaml.doc ""];
  encoding: string_ option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec put_and_get_inline_documents_input_output =
  {
  inline_document: CoreTypes.Document.t option [@ocaml.doc ""]}[@@ocaml.doc
                                                                 ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec operation_with_optional_input_output_output =
  {
  value: string_ option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec operation_with_optional_input_output_input =
  {
  value: string_ option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec null_operation_input_output =
  {
  string_: string_ option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec map_of_structs = (string_ * simple_struct) list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec map_of_strings = (string_ * string_) list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec map_of_map_of_strings = (string_ * map_of_strings) list[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec map_of_lists_of_strings = (string_ * string_ list) list[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type kitchen_sink =
  {
  unix_timestamp: float_ option [@ocaml.doc ""];
  timestamp_: float_ option [@ocaml.doc ""];
  struct_with_json_name: struct_with_json_name option [@ocaml.doc ""];
  string_: string_ option [@ocaml.doc ""];
  simple_struct: simple_struct option [@ocaml.doc ""];
  recursive_struct: kitchen_sink option [@ocaml.doc ""];
  recursive_map: map_of_kitchen_sinks option [@ocaml.doc ""];
  recursive_list: kitchen_sink list option [@ocaml.doc ""];
  map_of_structs: map_of_structs option [@ocaml.doc ""];
  map_of_strings: map_of_strings option [@ocaml.doc ""];
  map_of_maps: map_of_map_of_strings option [@ocaml.doc ""];
  map_of_lists_of_strings: map_of_lists_of_strings option [@ocaml.doc ""];
  long: int_ option [@ocaml.doc ""];
  list_of_structs: simple_struct list option [@ocaml.doc ""];
  list_of_strings: string_ list option [@ocaml.doc ""];
  list_of_maps_of_strings: map_of_strings list option [@ocaml.doc ""];
  list_of_lists: string_ list list option [@ocaml.doc ""];
  json_value: string option [@ocaml.doc ""];
  iso8601_timestamp: float_ option [@ocaml.doc ""];
  integer_: int_ option [@ocaml.doc ""];
  httpdate_timestamp: float_ option [@ocaml.doc ""];
  float_: float_ option [@ocaml.doc ""];
  empty_struct: unit option [@ocaml.doc ""];
  double: float_ option [@ocaml.doc ""];
  boolean_: bool_ option [@ocaml.doc ""];
  blob: string_ option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
and map_of_kitchen_sinks = (string_ * kitchen_sink) list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec error_with_members =
  {
  string_field: string_ option [@ocaml.doc "abc"];
  message: string_ option [@ocaml.doc ""];
  map_field: map_of_strings option [@ocaml.doc ""];
  list_field: string_ list option [@ocaml.doc ""];
  integer_field: int_ option [@ocaml.doc ""];
  complex_data: kitchen_sink option [@ocaml.doc ""];
  code: string_ option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec json_int_enums_input_output =
  {
  int_enum_map: protocol_tests_shared._integer_enum_map option
    [@ocaml.doc ""];
  int_enum_set: protocol_tests_shared._integer_enum_set option
    [@ocaml.doc ""];
  int_enum_list: protocol_tests_shared._integer_enum_list option
    [@ocaml.doc ""];
  int_enum3: protocol_tests_shared._integer_enum option [@ocaml.doc ""];
  int_enum2: protocol_tests_shared._integer_enum option [@ocaml.doc ""];
  int_enum1: protocol_tests_shared._integer_enum option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec json_enums_input_output =
  {
  foo_enum_map: protocol_tests_shared._foo_enum_map option [@ocaml.doc ""];
  foo_enum_set: protocol_tests_shared._foo_enum_set option [@ocaml.doc ""];
  foo_enum_list: protocol_tests_shared._foo_enum_list option [@ocaml.doc ""];
  foo_enum3: protocol_tests_shared._foo_enum option [@ocaml.doc ""];
  foo_enum2: protocol_tests_shared._foo_enum option [@ocaml.doc ""];
  foo_enum1: protocol_tests_shared._foo_enum option [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec invalid_greeting = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "This error is thrown when an invalid greeting value is provided."]
[@@deriving show][@@deriving eq]
type nonrec complex_nested_error_data = {
  foo: string_ option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec complex_error =
  {
  nested: complex_nested_error_data option [@ocaml.doc ""];
  top_level: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                              "This error is thrown when a request is invalid."]
[@@deriving show][@@deriving eq]
type nonrec greeting_with_errors_output =
  {
  greeting: string_ option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec fractional_seconds_output =
  {
  datetime: protocol_tests_shared._date_time option [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec host_label_input = {
  label: string_ [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show][@@deriving
                                                                    eq]
type nonrec datetime_offsets_output =
  {
  datetime: protocol_tests_shared._date_time option [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec content_type_parameters_input =
  {
  value: int_ option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]