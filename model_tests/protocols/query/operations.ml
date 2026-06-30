open Types
open Service_metadata
open Query_deserializers
open Query_serializers
module DatetimeOffsets =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"DatetimeOffsets"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:datetime_offsets_output_of_xml
        ~error_deserializer
  end
module EmptyInputAndEmptyOutput =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : empty_input_and_empty_output_input) =
      let fields = empty_input_and_empty_output_input_to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"EmptyInputAndEmptyOutput"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:empty_input_and_empty_output_output_of_xml
        ~error_deserializer
  end
module EndpointOperation =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"EndpointOperation"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
        ~error_deserializer
  end
module EndpointWithHostLabelOperation =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : host_label_input) =
      let fields = host_label_input_to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request
        ~action:"EndpointWithHostLabelOperation"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
        ~error_deserializer
  end
module FlattenedXmlMap =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"FlattenedXmlMap"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:flattened_xml_map_output_of_xml
        ~error_deserializer
  end
module FlattenedXmlMapWithXmlName =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request
        ~action:"FlattenedXmlMapWithXmlName"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:flattened_xml_map_with_xml_name_output_of_xml
        ~error_deserializer
  end
module FlattenedXmlMapWithXmlNamespace =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request
        ~action:"FlattenedXmlMapWithXmlNamespace"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:flattened_xml_map_with_xml_namespace_output_of_xml
        ~error_deserializer
  end
module FractionalSeconds =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"FractionalSeconds"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:fractional_seconds_output_of_xml
        ~error_deserializer
  end
module GreetingWithErrors =
  struct
    let error_to_string =
      function
      | `ComplexError _ -> "aws.protocoltests.query#ComplexError"
      | `CustomCodeError _ -> "aws.protocoltests.query#CustomCodeError"
      | `InvalidGreeting _ -> "aws.protocoltests.query#InvalidGreeting"
      | #Smaws_Lib.Protocols.AwsQuery.error as e ->
          Smaws_Lib.Protocols.AwsQuery.error_to_string e
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
      | "ComplexError" ->
          Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
      | "CustomCodeError" ->
          Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
      | "InvalidGreeting" ->
          Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
      | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"GreetingWithErrors"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:greeting_with_errors_output_of_xml
        ~error_deserializer
  end
module HostWithPathOperation =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"HostWithPathOperation"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
        ~error_deserializer
  end
module IgnoresWrappingXmlName =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"IgnoresWrappingXmlName"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:ignores_wrapping_xml_name_output_of_xml
        ~error_deserializer
  end
module NestedStructures =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : nested_structures_input) =
      let fields = nested_structures_input_to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"NestedStructures"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
        ~error_deserializer
  end
module NoInputAndNoOutput =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"NoInputAndNoOutput"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
        ~error_deserializer
  end
module NoInputAndOutput =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : no_input_and_output_input) =
      let fields = no_input_and_output_input_to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"NoInputAndOutput"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:no_input_and_output_output_of_xml
        ~error_deserializer
  end
module PutWithContentEncoding =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : put_with_content_encoding_input) =
      let fields = put_with_content_encoding_input_to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"PutWithContentEncoding"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
        ~error_deserializer
  end
module QueryIdempotencyTokenAutoFill =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : query_idempotency_token_auto_fill_input) =
      let fields =
        query_idempotency_token_auto_fill_input_to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request
        ~action:"QueryIdempotencyTokenAutoFill"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
        ~error_deserializer
  end
module QueryLists =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : query_lists_input) =
      let fields = query_lists_input_to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"QueryLists"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
        ~error_deserializer
  end
module QueryMaps =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : query_maps_input) =
      let fields = query_maps_input_to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"QueryMaps"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
        ~error_deserializer
  end
module QueryTimestamps =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : query_timestamps_input) =
      let fields = query_timestamps_input_to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"QueryTimestamps"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
        ~error_deserializer
  end
module RecursiveXmlShapes =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"RecursiveXmlShapes"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:recursive_xml_shapes_output_of_xml
        ~error_deserializer
  end
module SimpleInputParams =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : simple_input_params_input) =
      let fields = simple_input_params_input_to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"SimpleInputParams"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
        ~error_deserializer
  end
module SimpleScalarXmlProperties =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request
        ~action:"SimpleScalarXmlProperties"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:simple_scalar_xml_properties_output_of_xml
        ~error_deserializer
  end
module XmlBlobs =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"XmlBlobs"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:xml_blobs_output_of_xml ~error_deserializer
  end
module XmlEmptyBlobs =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"XmlEmptyBlobs"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:xml_blobs_output_of_xml ~error_deserializer
  end
module XmlEmptyLists =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"XmlEmptyLists"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:xml_lists_output_of_xml ~error_deserializer
  end
module XmlEmptyMaps =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"XmlEmptyMaps"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:xml_maps_output_of_xml ~error_deserializer
  end
module XmlEnums =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"XmlEnums"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:xml_enums_output_of_xml ~error_deserializer
  end
module XmlIntEnums =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"XmlIntEnums"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:xml_int_enums_output_of_xml ~error_deserializer
  end
module XmlLists =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"XmlLists"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:xml_lists_output_of_xml ~error_deserializer
  end
module XmlMaps =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"XmlMaps"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:xml_maps_output_of_xml ~error_deserializer
  end
module XmlMapsXmlName =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"XmlMapsXmlName"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:xml_maps_xml_name_output_of_xml
        ~error_deserializer
  end
module XmlNamespaces =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"XmlNamespaces"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:xml_namespaces_output_of_xml ~error_deserializer
  end
module XmlTimestamps =
  struct
    let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string
    let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
      Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
    let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
      let fields =
        Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
      Smaws_Lib.Protocols.AwsQuery.request ~action:"XmlTimestamps"
        ~xmlNamespace:"https://example.com/" ~service ~context ~fields
        ~output_deserializer:xml_timestamps_output_of_xml ~error_deserializer
  end