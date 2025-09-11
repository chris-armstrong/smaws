open Types
open Service_metadata
module ContentTypeParameters =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : content_type_parameters_input) =
      let input =
        Json_serializers.content_type_parameters_input_to_yojson request in
      Smaws_Lib.Protocols.AwsJson.request
        ~shape_name:"JsonProtocol.ContentTypeParameters" ~service ~context
        ~input
        ~output_deserializer:Json_deserializers.content_type_parameters_output_of_yojson
        ~error_deserializer
  end
module DatetimeOffsets =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let input =
        Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
      Smaws_Lib.Protocols.AwsJson.request
        ~shape_name:"JsonProtocol.DatetimeOffsets" ~service ~context ~input
        ~output_deserializer:Json_deserializers.datetime_offsets_output_of_yojson
        ~error_deserializer
  end
module EmptyOperation =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let input =
        Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
      Smaws_Lib.Protocols.AwsJson.request
        ~shape_name:"JsonProtocol.EmptyOperation" ~service ~context ~input
        ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
        ~error_deserializer
  end
module EndpointOperation =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let input =
        Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
      Smaws_Lib.Protocols.AwsJson.request
        ~shape_name:"JsonProtocol.EndpointOperation" ~service ~context ~input
        ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
        ~error_deserializer
  end
module EndpointWithHostLabelOperation =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : host_label_input) =
      let input = Json_serializers.host_label_input_to_yojson request in
      Smaws_Lib.Protocols.AwsJson.request
        ~shape_name:"JsonProtocol.EndpointWithHostLabelOperation" ~service
        ~context ~input
        ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
        ~error_deserializer
  end
module FractionalSeconds =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let input =
        Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
      Smaws_Lib.Protocols.AwsJson.request
        ~shape_name:"JsonProtocol.FractionalSeconds" ~service ~context ~input
        ~output_deserializer:Json_deserializers.fractional_seconds_output_of_yojson
        ~error_deserializer
  end
module GreetingWithErrors =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ComplexError") ->
            `ComplexError
              (Json_deserializers.complex_error_of_yojson tree path)
        | (_, "FooError") ->
            `FooError (Json_deserializers.foo_error_of_yojson tree path)
        | (_, "InvalidGreeting") ->
            `InvalidGreeting
              (Json_deserializers.invalid_greeting_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let input =
        Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
      Smaws_Lib.Protocols.AwsJson.request
        ~shape_name:"JsonProtocol.GreetingWithErrors" ~service ~context
        ~input
        ~output_deserializer:Json_deserializers.greeting_with_errors_output_of_yojson
        ~error_deserializer
  end
module HostWithPathOperation =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let input =
        Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
      Smaws_Lib.Protocols.AwsJson.request
        ~shape_name:"JsonProtocol.HostWithPathOperation" ~service ~context
        ~input
        ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
        ~error_deserializer
  end
module JsonEnums =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : json_enums_input_output) =
      let input = Json_serializers.json_enums_input_output_to_yojson request in
      Smaws_Lib.Protocols.AwsJson.request
        ~shape_name:"JsonProtocol.JsonEnums" ~service ~context ~input
        ~output_deserializer:Json_deserializers.json_enums_input_output_of_yojson
        ~error_deserializer
  end
module JsonIntEnums =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : json_int_enums_input_output) =
      let input =
        Json_serializers.json_int_enums_input_output_to_yojson request in
      Smaws_Lib.Protocols.AwsJson.request
        ~shape_name:"JsonProtocol.JsonIntEnums" ~service ~context ~input
        ~output_deserializer:Json_deserializers.json_int_enums_input_output_of_yojson
        ~error_deserializer
  end
module JsonUnions =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : union_input_output) =
      let input = Json_serializers.union_input_output_to_yojson request in
      Smaws_Lib.Protocols.AwsJson.request
        ~shape_name:"JsonProtocol.JsonUnions" ~service ~context ~input
        ~output_deserializer:Json_deserializers.union_input_output_of_yojson
        ~error_deserializer
  end
module KitchenSinkOperation =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ErrorWithMembers") ->
            `ErrorWithMembers
              (Json_deserializers.error_with_members_of_yojson tree path)
        | (_, "ErrorWithoutMembers") ->
            `ErrorWithoutMembers
              (Json_deserializers.error_without_members_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : kitchen_sink) =
      let input = Json_serializers.kitchen_sink_to_yojson request in
      Smaws_Lib.Protocols.AwsJson.request
        ~shape_name:"JsonProtocol.KitchenSinkOperation" ~service ~context
        ~input ~output_deserializer:Json_deserializers.kitchen_sink_of_yojson
        ~error_deserializer
  end
module NullOperation =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : null_operation_input_output) =
      let input =
        Json_serializers.null_operation_input_output_to_yojson request in
      Smaws_Lib.Protocols.AwsJson.request
        ~shape_name:"JsonProtocol.NullOperation" ~service ~context ~input
        ~output_deserializer:Json_deserializers.null_operation_input_output_of_yojson
        ~error_deserializer
  end
module OperationWithOptionalInputOutput =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : operation_with_optional_input_output_input) =
      let input =
        Json_serializers.operation_with_optional_input_output_input_to_yojson
          request in
      Smaws_Lib.Protocols.AwsJson.request
        ~shape_name:"JsonProtocol.OperationWithOptionalInputOutput" ~service
        ~context ~input
        ~output_deserializer:Json_deserializers.operation_with_optional_input_output_output_of_yojson
        ~error_deserializer
  end
module PutAndGetInlineDocuments =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : put_and_get_inline_documents_input_output)
      =
      let input =
        Json_serializers.put_and_get_inline_documents_input_output_to_yojson
          request in
      Smaws_Lib.Protocols.AwsJson.request
        ~shape_name:"JsonProtocol.PutAndGetInlineDocuments" ~service ~context
        ~input
        ~output_deserializer:Json_deserializers.put_and_get_inline_documents_input_output_of_yojson
        ~error_deserializer
  end
module PutWithContentEncoding =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : put_with_content_encoding_input) =
      let input =
        Json_serializers.put_with_content_encoding_input_to_yojson request in
      Smaws_Lib.Protocols.AwsJson.request
        ~shape_name:"JsonProtocol.PutWithContentEncoding" ~service ~context
        ~input
        ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
        ~error_deserializer
  end
module SimpleScalarProperties =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : simple_scalar_properties_input_output) =
      let input =
        Json_serializers.simple_scalar_properties_input_output_to_yojson
          request in
      Smaws_Lib.Protocols.AwsJson.request
        ~shape_name:"JsonProtocol.SimpleScalarProperties" ~service ~context
        ~input
        ~output_deserializer:Json_deserializers.simple_scalar_properties_input_output_of_yojson
        ~error_deserializer
  end
module SparseNullsOperation =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : sparse_nulls_operation_input_output) =
      let input =
        Json_serializers.sparse_nulls_operation_input_output_to_yojson
          request in
      Smaws_Lib.Protocols.AwsJson.request
        ~shape_name:"JsonProtocol.SparseNullsOperation" ~service ~context
        ~input
        ~output_deserializer:Json_deserializers.sparse_nulls_operation_input_output_of_yojson
        ~error_deserializer
  end