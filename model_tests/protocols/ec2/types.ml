type nonrec xml_timestamps_output =
  {
  http_date_on_target: Shared.Types.http_date option [@ocaml.doc ""];
  http_date: Smaws_Lib.Smithy_api.Types.timestamp option [@ocaml.doc ""];
  epoch_seconds_on_target: Shared.Types.epoch_seconds option [@ocaml.doc ""];
  epoch_seconds: Smaws_Lib.Smithy_api.Types.timestamp option [@ocaml.doc ""];
  date_time_on_target: Shared.Types.date_time option [@ocaml.doc ""];
  date_time: Smaws_Lib.Smithy_api.Types.timestamp option [@ocaml.doc ""];
  normal: Smaws_Lib.Smithy_api.Types.timestamp option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec xml_namespaced_list = Smaws_Lib.Smithy_api.Types.string_ list
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec xml_namespace_nested =
  {
  values: xml_namespaced_list option [@ocaml.doc ""];
  foo: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec xml_namespaces_output =
  {
  nested: xml_namespace_nested option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec renamed_list_members = Smaws_Lib.Smithy_api.Types.string_ list
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec list_with_member_namespace =
  Smaws_Lib.Smithy_api.Types.string_ list[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec list_with_namespace = Smaws_Lib.Smithy_api.Types.string_ list
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec structure_list_member =
  {
  b: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""];
  a: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                 ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec structure_list = structure_list_member list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec xml_lists_output =
  {
  structure_list: structure_list option [@ocaml.doc ""];
  flattened_list_with_namespace: list_with_namespace option [@ocaml.doc ""];
  flattened_list_with_member_namespace: list_with_member_namespace option
    [@ocaml.doc ""];
  flattened_list2: renamed_list_members option [@ocaml.doc ""];
  flattened_list: renamed_list_members option [@ocaml.doc ""];
  renamed_list_members: renamed_list_members option [@ocaml.doc ""];
  nested_string_list: Shared.Types.nested_string_list option [@ocaml.doc ""];
  int_enum_list: Shared.Types.integer_enum_list option [@ocaml.doc ""];
  enum_list: Shared.Types.foo_enum_list option [@ocaml.doc ""];
  timestamp_list: Shared.Types.timestamp_list option [@ocaml.doc ""];
  boolean_list: Shared.Types.boolean_list option [@ocaml.doc ""];
  integer_list: Shared.Types.integer_list option [@ocaml.doc ""];
  string_set: Shared.Types.string_set option [@ocaml.doc ""];
  string_list: Shared.Types.string_list option [@ocaml.doc ""]}[@@ocaml.doc
                                                                 ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec xml_int_enums_output =
  {
  int_enum_map: Shared.Types.integer_enum_map option [@ocaml.doc ""];
  int_enum_set: Shared.Types.integer_enum_set option [@ocaml.doc ""];
  int_enum_list: Shared.Types.integer_enum_list option [@ocaml.doc ""];
  int_enum3: Shared.Types.integer_enum option [@ocaml.doc ""];
  int_enum2: Shared.Types.integer_enum option [@ocaml.doc ""];
  int_enum1: Shared.Types.integer_enum option [@ocaml.doc ""]}[@@ocaml.doc
                                                                ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec xml_enums_output =
  {
  foo_enum_map: Shared.Types.foo_enum_map option [@ocaml.doc ""];
  foo_enum_set: Shared.Types.foo_enum_set option [@ocaml.doc ""];
  foo_enum_list: Shared.Types.foo_enum_list option [@ocaml.doc ""];
  foo_enum3: Shared.Types.foo_enum option [@ocaml.doc ""];
  foo_enum2: Shared.Types.foo_enum option [@ocaml.doc ""];
  foo_enum1: Shared.Types.foo_enum option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec xml_blobs_output =
  {
  data: Smaws_Lib.Smithy_api.Types.blob option [@ocaml.doc ""]}[@@ocaml.doc
                                                                 ""][@@deriving
                                                                    show]
[@@deriving eq]
type struct_arg =
  {
  recursive_arg: struct_arg option [@ocaml.doc ""];
  other_arg: Smaws_Lib.Smithy_api.Types.boolean_ option [@ocaml.doc ""];
  string_arg: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec simple_scalar_xml_properties_output =
  {
  double_value: Smaws_Lib.Smithy_api.Types.double option [@ocaml.doc ""];
  float_value: Smaws_Lib.Smithy_api.Types.float_ option [@ocaml.doc ""];
  long_value: Smaws_Lib.Smithy_api.Types.long option [@ocaml.doc ""];
  integer_value: Smaws_Lib.Smithy_api.Types.integer option [@ocaml.doc ""];
  short_value: Smaws_Lib.Smithy_api.Types.short option [@ocaml.doc ""];
  byte_value: Smaws_Lib.Smithy_api.Types.byte option [@ocaml.doc ""];
  false_boolean_value: Smaws_Lib.Smithy_api.Types.boolean_ option
    [@ocaml.doc ""];
  true_boolean_value: Smaws_Lib.Smithy_api.Types.boolean_ option
    [@ocaml.doc ""];
  empty_string_value: Smaws_Lib.Smithy_api.Types.string_ option
    [@ocaml.doc ""];
  string_value: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec simple_input_params_input =
  {
  uses_xml_name: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""];
  has_query_and_xml_name: Smaws_Lib.Smithy_api.Types.string_ option
    [@ocaml.doc ""];
  has_query_name: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""];
  foo_enum: Shared.Types.foo_enum option [@ocaml.doc ""];
  qux: Smaws_Lib.Smithy_api.Types.blob option [@ocaml.doc ""];
  boo: Smaws_Lib.Smithy_api.Types.double option [@ocaml.doc ""];
  float_value: Smaws_Lib.Smithy_api.Types.float_ option [@ocaml.doc ""];
  bam: Smaws_Lib.Smithy_api.Types.integer option [@ocaml.doc ""];
  baz: Smaws_Lib.Smithy_api.Types.boolean_ option [@ocaml.doc ""];
  bar: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""];
  foo: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type recursive_xml_shapes_output_nested1 =
  {
  nested: recursive_xml_shapes_output_nested2 option [@ocaml.doc ""];
  foo: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
and recursive_xml_shapes_output_nested2 =
  {
  recursive_member: recursive_xml_shapes_output_nested1 option
    [@ocaml.doc ""];
  bar: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec recursive_xml_shapes_output =
  {
  nested: recursive_xml_shapes_output_nested1 option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec query_timestamps_input =
  {
  epoch_target: Shared.Types.epoch_seconds option [@ocaml.doc ""];
  epoch_member: Smaws_Lib.Smithy_api.Types.timestamp option [@ocaml.doc ""];
  normal_format: Smaws_Lib.Smithy_api.Types.timestamp option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec list_with_xml_name = Smaws_Lib.Smithy_api.Types.string_ list
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec nested_struct_with_list =
  {
  list_arg: Shared.Types.string_list option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec query_lists_input =
  {
  nested_with_list: nested_struct_with_list option [@ocaml.doc ""];
  list_arg_with_xml_name: list_with_xml_name option [@ocaml.doc ""];
  list_arg_with_xml_name_member: list_with_xml_name option [@ocaml.doc ""];
  complex_list_arg: Shared.Types.greeting_list option [@ocaml.doc ""];
  list_arg: Shared.Types.string_list option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec query_idempotency_token_auto_fill_input =
  {
  token: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec put_with_content_encoding_input =
  {
  data: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""];
  encoding: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec no_input_and_output_output = unit[@@ocaml.doc ""][@@deriving
                                                               show][@@deriving
                                                                    eq]
type nonrec nested_structures_input =
  {
  nested: struct_arg option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec invalid_greeting =
  {
  message: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc
  "This error is thrown when an invalid greeting value is provided."]
[@@deriving show][@@deriving eq]
type nonrec ignores_wrapping_xml_name_output =
  {
  foo: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec host_label_input =
  {
  label: Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec greeting_with_errors_output =
  {
  greeting: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec complex_nested_error_data =
  {
  foo: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec complex_error =
  {
  nested: complex_nested_error_data option [@ocaml.doc ""];
  top_level: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc "This error is thrown when a request is invalid."][@@deriving
                                                                 show]
[@@deriving eq]
type nonrec fractional_seconds_output =
  {
  datetime: Shared.Types.date_time option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec empty_input_and_empty_output_output = unit[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec empty_input_and_empty_output_input = unit[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec datetime_offsets_output =
  {
  datetime: Shared.Types.date_time option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]