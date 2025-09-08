type nonrec my_string_key = string[@@ocaml.doc ""][@@deriving show][@@deriving
                                                                    eq]
type nonrec missing_key_structure = {
  hi: my_string_key [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec structure_set_with_no_key = missing_key_structure list[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec sensitive_pattern_string = string[@@ocaml.doc ""][@@deriving
                                                               show][@@deriving
                                                                    eq]
type nonrec sensitive_validation_input =
  {
  string_: sensitive_pattern_string option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec recursive_enum_string =
  | DEF [@ocaml.doc ""]
  | ABC [@ocaml.doc ""][@@ocaml.doc ""][@@deriving show][@@deriving eq]
type recursive_union_one =
  | Union of recursive_union_two [@ocaml.doc ""]
  | String of recursive_enum_string [@ocaml.doc ""][@@ocaml.doc ""][@@deriving
                                                                    show]
[@@deriving eq]
and recursive_union_two =
  | Union of recursive_union_one [@ocaml.doc ""]
  | String of recursive_enum_string [@ocaml.doc ""][@@ocaml.doc ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec recursive_structures_input =
  {
  union: recursive_union_one option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec malformed_unique_items_input =
  {
  union_list: Shared.Types.union_set option [@ocaml.doc ""];
  structure_list_with_no_key: structure_set_with_no_key option
    [@ocaml.doc ""];
  structure_list: Shared.Types.structure_set option [@ocaml.doc ""];
  list_list: Shared.Types.list_set option [@ocaml.doc ""];
  int_enum_list: Shared.Types.integer_enum_set option [@ocaml.doc ""];
  enum_list: Shared.Types.foo_enum_set option [@ocaml.doc ""];
  http_date_list: Shared.Types.http_date_set option [@ocaml.doc ""];
  date_time_list: Shared.Types.date_time_set option [@ocaml.doc ""];
  timestamp_list: Shared.Types.timestamp_set option [@ocaml.doc ""];
  long_list: Shared.Types.long_set option [@ocaml.doc ""];
  integer_list: Shared.Types.integer_set option [@ocaml.doc ""];
  short_list: Shared.Types.short_set option [@ocaml.doc ""];
  byte_list: Shared.Types.byte_set option [@ocaml.doc ""];
  string_list: Shared.Types.string_set option [@ocaml.doc ""];
  boolean_list: Shared.Types.boolean_set option [@ocaml.doc ""];
  blob_list: Shared.Types.blob_set option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec malformed_required_input =
  {
  string_in_header: Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""];
  string_in_query: Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""];
  string_: Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""]}[@@ocaml.doc
                                                                ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec range_byte = int[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec min_byte = int[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec max_byte = int[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec range_short = int[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec min_short = int[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec max_short = int[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec range_integer = int[@@ocaml.doc ""][@@deriving show][@@deriving
                                                                  eq]
type nonrec min_integer = int[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec max_integer = int[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec range_long = int[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec min_long = int[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec max_long = int[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec range_float = float[@@ocaml.doc ""][@@deriving show][@@deriving
                                                                  eq]
type nonrec min_float = float[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec max_float = float[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec malformed_range_override_input =
  {
  max_float: max_float option [@ocaml.doc ""];
  min_float: min_float option [@ocaml.doc ""];
  float_: range_float option [@ocaml.doc ""];
  max_long: max_long option [@ocaml.doc ""];
  min_long: min_long option [@ocaml.doc ""];
  long: range_long option [@ocaml.doc ""];
  max_integer: max_integer option [@ocaml.doc ""];
  min_integer: min_integer option [@ocaml.doc ""];
  integer: range_integer option [@ocaml.doc ""];
  max_short: max_short option [@ocaml.doc ""];
  min_short: min_short option [@ocaml.doc ""];
  short: range_short option [@ocaml.doc ""];
  max_byte: max_byte option [@ocaml.doc ""];
  min_byte: min_byte option [@ocaml.doc ""];
  byte: range_byte option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec malformed_range_input =
  {
  max_float: max_float option [@ocaml.doc ""];
  min_float: min_float option [@ocaml.doc ""];
  float_: range_float option [@ocaml.doc ""];
  max_long: max_long option [@ocaml.doc ""];
  min_long: min_long option [@ocaml.doc ""];
  long: range_long option [@ocaml.doc ""];
  max_integer: max_integer option [@ocaml.doc ""];
  min_integer: min_integer option [@ocaml.doc ""];
  integer: range_integer option [@ocaml.doc ""];
  max_short: max_short option [@ocaml.doc ""];
  min_short: min_short option [@ocaml.doc ""];
  short: range_short option [@ocaml.doc ""];
  max_byte: max_byte option [@ocaml.doc ""];
  min_byte: min_byte option [@ocaml.doc ""];
  byte: range_byte option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec pattern_string = string[@@ocaml.doc ""][@@deriving show][@@deriving
                                                                    eq]
type nonrec pattern_list_override = pattern_string list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec pattern_map_override = (pattern_string * pattern_string) list
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec pattern_union_override =
  | Second of pattern_string [@ocaml.doc ""]
  | First of pattern_string [@ocaml.doc ""][@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec malformed_pattern_override_input =
  {
  union: pattern_union_override option [@ocaml.doc ""];
  map: pattern_map_override option [@ocaml.doc ""];
  list: pattern_list_override option [@ocaml.doc ""];
  string_: pattern_string option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                                   show]
[@@deriving eq]
type nonrec evil_string = string[@@ocaml.doc ""][@@deriving show][@@deriving
                                                                   eq]
type nonrec pattern_list = pattern_string list[@@ocaml.doc ""][@@deriving
                                                                show]
[@@deriving eq]
type nonrec pattern_map = (pattern_string * pattern_string) list[@@ocaml.doc
                                                                  ""]
[@@deriving show][@@deriving eq]
type nonrec pattern_union =
  | Second of pattern_string [@ocaml.doc ""]
  | First of pattern_string [@ocaml.doc ""][@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec malformed_pattern_input =
  {
  union: pattern_union option [@ocaml.doc ""];
  map: pattern_map option [@ocaml.doc ""];
  list: pattern_list option [@ocaml.doc ""];
  evil_string: evil_string option [@ocaml.doc ""];
  string_: pattern_string option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                                   show]
[@@deriving eq]
type nonrec length_string = string[@@ocaml.doc ""][@@deriving show][@@deriving
                                                                    eq]
type nonrec malformed_length_query_string_input =
  {
  string_: length_string option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                                  show]
[@@deriving eq]
type nonrec length_blob = bytes[@@ocaml.doc ""][@@deriving show][@@deriving
                                                                  eq]
type nonrec min_length_string = string[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec max_length_string = string[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec length_list = length_string list[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec length_map = (length_string * length_list) list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec malformed_length_override_input =
  {
  map: length_map option [@ocaml.doc ""];
  list: length_list option [@ocaml.doc ""];
  max_string: max_length_string option [@ocaml.doc ""];
  min_string: min_length_string option [@ocaml.doc ""];
  string_: length_string option [@ocaml.doc ""];
  blob: length_blob option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec malformed_length_input =
  {
  map: length_map option [@ocaml.doc ""];
  list: length_list option [@ocaml.doc ""];
  max_string: max_length_string option [@ocaml.doc ""];
  min_string: min_length_string option [@ocaml.doc ""];
  string_: length_string option [@ocaml.doc ""];
  blob: length_blob option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec enum_string =
  | JKL [@ocaml.doc ""]
  | GHI [@ocaml.doc ""]
  | DEF [@ocaml.doc ""]
  | ABC [@ocaml.doc ""][@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec enum_trait_string =
  | ABC [@ocaml.doc ""]
  | DEF [@ocaml.doc ""]
  | GHI [@ocaml.doc ""][@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec enum_list = enum_string list[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec enum_map = (enum_string * enum_string) list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec enum_union =
  | Second of enum_string [@ocaml.doc ""]
  | First of enum_string [@ocaml.doc ""][@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec malformed_enum_input =
  {
  union: enum_union option [@ocaml.doc ""];
  map: enum_map option [@ocaml.doc ""];
  list: enum_list option [@ocaml.doc ""];
  string_with_enum_trait: enum_trait_string option [@ocaml.doc ""];
  string_: enum_string option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                                show]
[@@deriving eq]