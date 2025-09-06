type nonrec foo_union =
  | Integer of Smaws_Lib.Smithy_api.Types.integer [@ocaml.doc ""]
  | String of Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""][@@ocaml.doc
                                                                  ""]
type nonrec union_set = foo_union list[@@ocaml.doc ""]
type nonrec timestamp_set = Smaws_Lib.Smithy_api.Types.timestamp list
[@@ocaml.doc ""]
type nonrec timestamp_list = Smaws_Lib.Smithy_api.Types.timestamp list
[@@ocaml.doc ""]
type nonrec text_plain_blob = bytes[@@ocaml.doc ""]
type nonrec greeting_struct =
  {
  hi: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                  ""]
type nonrec structure_set = greeting_struct list[@@ocaml.doc ""]
type nonrec string_set = Smaws_Lib.Smithy_api.Types.string_ list[@@ocaml.doc
                                                                  ""]
type nonrec string_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.string_)
    list[@@ocaml.doc ""]
type nonrec string_list = Smaws_Lib.Smithy_api.Types.string_ list[@@ocaml.doc
                                                                   ""]
type nonrec string_list_map =
  (Smaws_Lib.Smithy_api.Types.string_ * string_list) list[@@ocaml.doc ""]
type nonrec sparse_string_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.string_)
    list[@@ocaml.doc ""]
type nonrec sparse_string_list =
  Smaws_Lib.Smithy_api.Types.string_ Smaws_Lib.Smithy_api.Types.nullable list
[@@ocaml.doc ""]
type nonrec sparse_short_list =
  Smaws_Lib.Smithy_api.Types.short Smaws_Lib.Smithy_api.Types.nullable list
[@@ocaml.doc ""]
type nonrec short_set = Smaws_Lib.Smithy_api.Types.short list[@@ocaml.doc ""]
type nonrec short_list = Smaws_Lib.Smithy_api.Types.short list[@@ocaml.doc
                                                                ""]
type nonrec nested_string_list = string_list list[@@ocaml.doc ""]
type nonrec long_set = Smaws_Lib.Smithy_api.Types.long list[@@ocaml.doc ""]
type nonrec long_list = Smaws_Lib.Smithy_api.Types.long list[@@ocaml.doc ""]
type nonrec list_set = string_list list[@@ocaml.doc ""]
type nonrec jpeg_blob = bytes[@@ocaml.doc ""]
type nonrec integer_set = Smaws_Lib.Smithy_api.Types.integer list[@@ocaml.doc
                                                                   ""]
type nonrec integer_list = Smaws_Lib.Smithy_api.Types.integer list[@@ocaml.doc
                                                                    ""]
type nonrec integer_enum =
  | C [@ocaml.doc ""]
  | B [@ocaml.doc ""]
  | A [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec integer_enum_set = integer_enum list[@@ocaml.doc ""]
type nonrec integer_enum_map =
  (Smaws_Lib.Smithy_api.Types.string_ * integer_enum) list[@@ocaml.doc ""]
type nonrec integer_enum_list = integer_enum list[@@ocaml.doc ""]
type nonrec http_date = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec http_date_set = http_date list[@@ocaml.doc ""]
type nonrec greeting_list = greeting_struct list[@@ocaml.doc ""]
type nonrec foo_enum =
  | ZERO [@ocaml.doc ""]
  | ONE [@ocaml.doc ""]
  | BAR [@ocaml.doc ""]
  | BAZ [@ocaml.doc ""]
  | FOO [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec foo_enum_set = foo_enum list[@@ocaml.doc ""]
type nonrec foo_enum_map =
  (Smaws_Lib.Smithy_api.Types.string_ * foo_enum) list[@@ocaml.doc ""]
type nonrec foo_enum_list = foo_enum list[@@ocaml.doc ""]
type nonrec float_list = Smaws_Lib.Smithy_api.Types.float_ list[@@ocaml.doc
                                                                 ""]
type nonrec epoch_seconds = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec double_list = Smaws_Lib.Smithy_api.Types.double list[@@ocaml.doc
                                                                  ""]
type nonrec date_time = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec date_time_set = date_time list[@@ocaml.doc ""]
type nonrec date_time_list = date_time list[@@ocaml.doc ""]
type nonrec byte_set = Smaws_Lib.Smithy_api.Types.byte list[@@ocaml.doc ""]
type nonrec byte_list = Smaws_Lib.Smithy_api.Types.byte list[@@ocaml.doc ""]
type nonrec boolean_set = Smaws_Lib.Smithy_api.Types.boolean_ list[@@ocaml.doc
                                                                    ""]
type nonrec boolean_list = Smaws_Lib.Smithy_api.Types.boolean_ list[@@ocaml.doc
                                                                    ""]
type nonrec blob_set = Smaws_Lib.Smithy_api.Types.blob list[@@ocaml.doc ""]
type nonrec blob_list = Smaws_Lib.Smithy_api.Types.blob list[@@ocaml.doc ""]