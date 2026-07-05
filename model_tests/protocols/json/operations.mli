open Types

module ContentTypeParameters : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    content_type_parameters_input ->
    (content_type_parameters_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc
  "The example tests how servers must support requests containing a `Content-Type` header with \
   parameters."]

module DatetimeOffsets : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    (datetime_offsets_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc ""]

module EmptyOperation : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc ""]

module EndpointOperation : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc ""]

module EndpointWithHostLabelOperation : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    host_label_input ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc ""]

module FractionalSeconds : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    (fractional_seconds_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc ""]

module GreetingWithErrors : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ComplexError of complex_error
    | `FooError of foo_error
    | `InvalidGreeting of invalid_greeting ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( greeting_with_errors_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ComplexError of complex_error
      | `FooError of foo_error
      | `InvalidGreeting of invalid_greeting ] )
    result
end
[@@ocaml.doc
  "This operation has three possible return values: 1. A successful response in the form of \
   GreetingWithErrorsOutput 2. An InvalidGreeting error. 3. A ComplexError error. Implementations \
   must be able to successfully take a response and properly deserialize successful and error \
   responses."]

module HostWithPathOperation : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc ""]

module JsonEnums : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    json_enums_input_output ->
    (json_enums_input_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc "This example serializes enums as top level properties, in lists, sets, and maps."]

module JsonIntEnums : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    json_int_enums_input_output ->
    (json_int_enums_input_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc "This example serializes intEnums as top level properties, in lists, sets, and maps."]

module JsonUnions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    union_input_output ->
    (union_input_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc "This operation uses unions for inputs and outputs."]

module KitchenSinkOperation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ErrorWithMembers of error_with_members
    | `ErrorWithoutMembers of error_without_members ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    kitchen_sink ->
    ( kitchen_sink,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ErrorWithMembers of error_with_members
      | `ErrorWithoutMembers of error_without_members ] )
    result
end
[@@ocaml.doc ""]

module NullOperation : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    null_operation_input_output ->
    (null_operation_input_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc ""]

module OperationWithOptionalInputOutput : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    operation_with_optional_input_output_input ->
    (operation_with_optional_input_output_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc ""]

module PutAndGetInlineDocuments : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_and_get_inline_documents_input_output ->
    (put_and_get_inline_documents_input_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc "This example serializes an inline document as part of the payload."]

module PutWithContentEncoding : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_with_content_encoding_input ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc ""]

module SimpleScalarProperties : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    simple_scalar_properties_input_output ->
    (simple_scalar_properties_input_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc ""]

module SparseNullsOperation : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    sparse_nulls_operation_input_output ->
    (sparse_nulls_operation_input_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc ""]
