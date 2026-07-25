type nested_with_namespace = {
  attr_field : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type simple_scalar_properties_response = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  string_value : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  true_boolean_value : Smaws_Lib.Smithy_api.Types.boolean_ option; [@ocaml.doc ""]
  false_boolean_value : Smaws_Lib.Smithy_api.Types.boolean_ option; [@ocaml.doc ""]
  byte_value : Smaws_Lib.Smithy_api.Types.byte option; [@ocaml.doc ""]
  short_value : Smaws_Lib.Smithy_api.Types.short option; [@ocaml.doc ""]
  integer_value : Smaws_Lib.Smithy_api.Types.integer option; [@ocaml.doc ""]
  long_value : Smaws_Lib.Smithy_api.Types.long option; [@ocaml.doc ""]
  float_value : Smaws_Lib.Smithy_api.Types.float_ option; [@ocaml.doc ""]
  nested : nested_with_namespace option; [@ocaml.doc ""]
  double_value : Smaws_Lib.Smithy_api.Types.double option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type simple_scalar_properties_request = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  string_value : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  true_boolean_value : Smaws_Lib.Smithy_api.Types.boolean_ option; [@ocaml.doc ""]
  false_boolean_value : Smaws_Lib.Smithy_api.Types.boolean_ option; [@ocaml.doc ""]
  byte_value : Smaws_Lib.Smithy_api.Types.byte option; [@ocaml.doc ""]
  short_value : Smaws_Lib.Smithy_api.Types.short option; [@ocaml.doc ""]
  integer_value : Smaws_Lib.Smithy_api.Types.integer option; [@ocaml.doc ""]
  long_value : Smaws_Lib.Smithy_api.Types.long option; [@ocaml.doc ""]
  float_value : Smaws_Lib.Smithy_api.Types.float_ option; [@ocaml.doc ""]
  nested : nested_with_namespace option; [@ocaml.doc ""]
  double_value : Smaws_Lib.Smithy_api.Types.double option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type simple_scalar_properties_input_output = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  string_value : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  true_boolean_value : Smaws_Lib.Smithy_api.Types.boolean_ option; [@ocaml.doc ""]
  false_boolean_value : Smaws_Lib.Smithy_api.Types.boolean_ option; [@ocaml.doc ""]
  byte_value : Smaws_Lib.Smithy_api.Types.byte option; [@ocaml.doc ""]
  short_value : Smaws_Lib.Smithy_api.Types.short option; [@ocaml.doc ""]
  integer_value : Smaws_Lib.Smithy_api.Types.integer option; [@ocaml.doc ""]
  long_value : Smaws_Lib.Smithy_api.Types.long option; [@ocaml.doc ""]
  float_value : Smaws_Lib.Smithy_api.Types.float_ option; [@ocaml.doc ""]
  nested : nested_with_namespace option; [@ocaml.doc ""]
  double_value : Smaws_Lib.Smithy_api.Types.double option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]
