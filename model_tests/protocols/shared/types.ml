type nonrec foo_union =
  | Integer of Smaws_Lib.Smithy_api.integer [@ocaml.doc ""]
  | String of Smaws_Lib.Smithy_api.string_ [@ocaml.doc ""][@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec union_set = foo_union list[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec timestamp_set = Smaws_Lib.Smithy_api.timestamp list[@@ocaml.doc
                                                                 ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec timestamp_list = Smaws_Lib.Smithy_api.timestamp list[@@ocaml.doc
                                                                  ""]
[@@deriving show][@@deriving eq]
type nonrec text_plain_blob = bytes[@@ocaml.doc ""][@@deriving show][@@deriving
                                                                    eq]
type nonrec greeting_struct =
  {
  hi: Smaws_Lib.Smithy_api.string_ option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec structure_set = greeting_struct list[@@ocaml.doc ""][@@deriving
                                                                  show]
[@@deriving eq]
type nonrec string_set = Smaws_Lib.Smithy_api.string_ list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec string_map =
  (Smaws_Lib.Smithy_api.string_ * Smaws_Lib.Smithy_api.string_) list[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec string_list = Smaws_Lib.Smithy_api.string_ list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec string_list_map =
  (Smaws_Lib.Smithy_api.string_ * string_list) list[@@ocaml.doc ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec sparse_string_map =
  (Smaws_Lib.Smithy_api.string_ * Smaws_Lib.Smithy_api.string_) list[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec sparse_string_list = Smaws_Lib.Smithy_api.string_ option list
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec sparse_short_list = Smaws_Lib.Smithy_api.short option list
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec short_set = Smaws_Lib.Smithy_api.short list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec short_list = Smaws_Lib.Smithy_api.short list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec nested_string_list = string_list list[@@ocaml.doc ""][@@deriving
                                                                   show]
[@@deriving eq]
type nonrec long_set = Smaws_Lib.Smithy_api.long list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec long_list = Smaws_Lib.Smithy_api.long list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec list_set = string_list list[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec jpeg_blob = bytes[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec integer_set = Smaws_Lib.Smithy_api.integer list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec integer_list = Smaws_Lib.Smithy_api.integer list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec integer_enum =
  | C [@ocaml.doc ""]
  | B [@ocaml.doc ""]
  | A [@ocaml.doc ""][@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec integer_enum_set = integer_enum list[@@ocaml.doc ""][@@deriving
                                                                  show]
[@@deriving eq]
type nonrec integer_enum_map =
  (Smaws_Lib.Smithy_api.string_ * integer_enum) list[@@ocaml.doc ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec integer_enum_list = integer_enum list[@@ocaml.doc ""][@@deriving
                                                                   show]
[@@deriving eq]
type nonrec http_date = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec http_date_set = http_date list[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec greeting_list = greeting_struct list[@@ocaml.doc ""][@@deriving
                                                                  show]
[@@deriving eq]
type nonrec foo_enum =
  | ZERO [@ocaml.doc ""]
  | ONE [@ocaml.doc ""]
  | BAR [@ocaml.doc ""]
  | BAZ [@ocaml.doc ""]
  | FOO [@ocaml.doc ""][@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec foo_enum_set = foo_enum list[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec foo_enum_map = (Smaws_Lib.Smithy_api.string_ * foo_enum) list
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec foo_enum_list = foo_enum list[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec float_list = Smaws_Lib.Smithy_api.float_ list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec epoch_seconds = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec double_list = Smaws_Lib.Smithy_api.double list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec date_time = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec date_time_set = date_time list[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec date_time_list = date_time list[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec byte_set = Smaws_Lib.Smithy_api.byte list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec byte_list = Smaws_Lib.Smithy_api.byte list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec boolean_set = Smaws_Lib.Smithy_api.boolean_ list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec boolean_list = Smaws_Lib.Smithy_api.boolean_ list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec blob_set = Smaws_Lib.Smithy_api.blob list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec blob_list = Smaws_Lib.Smithy_api.blob list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]