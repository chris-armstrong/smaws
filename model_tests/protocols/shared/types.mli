type foo_union =
  | Integer of Smaws_Lib.Smithy_api.Types.integer [@ocaml.doc ""]
  | String of Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""][@@ocaml.doc
                                                                  ""]
[@@deriving (show, eq)]
type union_set = foo_union list[@@ocaml.doc ""][@@deriving (show, eq)]
type timestamp_set = Smaws_Lib.Smithy_api.Types.timestamp list[@@ocaml.doc
                                                                ""][@@deriving
                                                                    (show,
                                                                    eq)]
type timestamp_list = Smaws_Lib.Smithy_api.Types.timestamp list[@@ocaml.doc
                                                                 ""][@@deriving
                                                                    (show,
                                                                    eq)]
type text_plain_blob = bytes[@@ocaml.doc ""][@@deriving (show, eq)]
type greeting_struct =
  {
  hi: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                  ""]
[@@deriving (show, eq)]
type structure_set = greeting_struct list[@@ocaml.doc ""][@@deriving
                                                           (show, eq)]
type string_set = Smaws_Lib.Smithy_api.Types.string_ list[@@ocaml.doc ""]
[@@deriving (show, eq)]
type string_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.string_)
    list[@@ocaml.doc ""][@@deriving (show, eq)]
type string_list = Smaws_Lib.Smithy_api.Types.string_ list[@@ocaml.doc ""]
[@@deriving (show, eq)]
type string_list_map =
  (Smaws_Lib.Smithy_api.Types.string_ * string_list) list[@@ocaml.doc ""]
[@@deriving (show, eq)]
type sparse_string_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.string_)
    list[@@ocaml.doc ""][@@deriving (show, eq)]
type sparse_string_list =
  Smaws_Lib.Smithy_api.Types.string_ Smaws_Lib.Smithy_api.Types.nullable list
[@@ocaml.doc ""][@@deriving (show, eq)]
type sparse_short_list =
  Smaws_Lib.Smithy_api.Types.short Smaws_Lib.Smithy_api.Types.nullable list
[@@ocaml.doc ""][@@deriving (show, eq)]
type short_set = Smaws_Lib.Smithy_api.Types.short list[@@ocaml.doc ""]
[@@deriving (show, eq)]
type short_list = Smaws_Lib.Smithy_api.Types.short list[@@ocaml.doc ""]
[@@deriving (show, eq)]
type nested_string_list = string_list list[@@ocaml.doc ""][@@deriving
                                                            (show, eq)]
type long_set = Smaws_Lib.Smithy_api.Types.long list[@@ocaml.doc ""][@@deriving
                                                                    (show,
                                                                    eq)]
type long_list = Smaws_Lib.Smithy_api.Types.long list[@@ocaml.doc ""]
[@@deriving (show, eq)]
type list_set = string_list list[@@ocaml.doc ""][@@deriving (show, eq)]
type jpeg_blob = bytes[@@ocaml.doc ""][@@deriving (show, eq)]
type integer_set = Smaws_Lib.Smithy_api.Types.integer list[@@ocaml.doc ""]
[@@deriving (show, eq)]
type integer_list = Smaws_Lib.Smithy_api.Types.integer list[@@ocaml.doc ""]
[@@deriving (show, eq)]
type integer_enum =
  | C [@ocaml.doc ""]
  | B [@ocaml.doc ""]
  | A [@ocaml.doc ""][@@ocaml.doc ""][@@deriving (show, eq)]
type integer_enum_set = integer_enum list[@@ocaml.doc ""][@@deriving
                                                           (show, eq)]
type integer_enum_map =
  (Smaws_Lib.Smithy_api.Types.string_ * integer_enum) list[@@ocaml.doc ""]
[@@deriving (show, eq)]
type integer_enum_list = integer_enum list[@@ocaml.doc ""][@@deriving
                                                            (show, eq)]
type http_date = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""][@@deriving
                                                                  (show, eq)]
type http_date_set = http_date list[@@ocaml.doc ""][@@deriving (show, eq)]
type greeting_list = greeting_struct list[@@ocaml.doc ""][@@deriving
                                                           (show, eq)]
type foo_enum =
  | ZERO [@ocaml.doc ""]
  | ONE [@ocaml.doc ""]
  | BAR [@ocaml.doc ""]
  | BAZ [@ocaml.doc ""]
  | FOO [@ocaml.doc ""][@@ocaml.doc ""][@@deriving (show, eq)]
type foo_enum_set = foo_enum list[@@ocaml.doc ""][@@deriving (show, eq)]
type foo_enum_map = (Smaws_Lib.Smithy_api.Types.string_ * foo_enum) list
[@@ocaml.doc ""][@@deriving (show, eq)]
type foo_enum_list = foo_enum list[@@ocaml.doc ""][@@deriving (show, eq)]
type float_list = Smaws_Lib.Smithy_api.Types.float_ list[@@ocaml.doc ""]
[@@deriving (show, eq)]
type epoch_seconds = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""][@@deriving
                                                                    (show,
                                                                    eq)]
type double_list = Smaws_Lib.Smithy_api.Types.double list[@@ocaml.doc ""]
[@@deriving (show, eq)]
type date_time = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""][@@deriving
                                                                  (show, eq)]
type date_time_set = date_time list[@@ocaml.doc ""][@@deriving (show, eq)]
type date_time_list = date_time list[@@ocaml.doc ""][@@deriving (show, eq)]
type byte_set = Smaws_Lib.Smithy_api.Types.byte list[@@ocaml.doc ""][@@deriving
                                                                    (show,
                                                                    eq)]
type byte_list = Smaws_Lib.Smithy_api.Types.byte list[@@ocaml.doc ""]
[@@deriving (show, eq)]
type boolean_set = Smaws_Lib.Smithy_api.Types.boolean_ list[@@ocaml.doc ""]
[@@deriving (show, eq)]
type boolean_list = Smaws_Lib.Smithy_api.Types.boolean_ list[@@ocaml.doc ""]
[@@deriving (show, eq)]
type blob_set = Smaws_Lib.Smithy_api.Types.blob list[@@ocaml.doc ""][@@deriving
                                                                    (show,
                                                                    eq)]
type blob_list = Smaws_Lib.Smithy_api.Types.blob list[@@ocaml.doc ""]
[@@deriving (show, eq)]