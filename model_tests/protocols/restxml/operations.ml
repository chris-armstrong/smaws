open Types
open Service_metadata
open Xml_deserializers
open Xml_serializers
open Smaws_Lib.Xml.Parse

module AllQueryStringTypes = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : all_query_string_types_input) =
    let w = Smaws_Lib.Xml.Write.make () in
    all_query_string_types_input_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"AllQueryStringTypes" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module BodyWithXmlName = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : body_with_xml_name_input_output) =
    let w = Smaws_Lib.Xml.Write.make () in
    body_with_xml_name_input_output_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"BodyWithXmlName" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:body_with_xml_name_input_output_of_xml ~error_deserializer
end

module ConstantAndVariableQueryString = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : constant_and_variable_query_string_input) =
    let w = Smaws_Lib.Xml.Write.make () in
    constant_and_variable_query_string_input_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ConstantAndVariableQueryString" ~service
      ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module ConstantQueryString = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : constant_query_string_input) =
    let w = Smaws_Lib.Xml.Write.make () in
    constant_query_string_input_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ConstantQueryString" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module ContentTypeParameters = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : content_type_parameters_input) =
    let w = Smaws_Lib.Xml.Write.make () in
    content_type_parameters_input_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ContentTypeParameters" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:content_type_parameters_output_of_xml ~error_deserializer
end

module DatetimeOffsets = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let w = Smaws_Lib.Xml.Write.make () in
    ();
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DatetimeOffsets" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:datetime_offsets_output_of_xml ~error_deserializer
end

module EmptyInputAndEmptyOutput = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : empty_input_and_empty_output_input) =
    let w = Smaws_Lib.Xml.Write.make () in
    empty_input_and_empty_output_input_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"EmptyInputAndEmptyOutput" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:empty_input_and_empty_output_output_of_xml ~error_deserializer
end

module EndpointOperation = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let w = Smaws_Lib.Xml.Write.make () in
    ();
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"EndpointOperation" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module EndpointWithHostLabelHeaderOperation = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : host_label_header_input) =
    let w = Smaws_Lib.Xml.Write.make () in
    host_label_header_input_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"EndpointWithHostLabelHeaderOperation" ~service
      ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module EndpointWithHostLabelOperation = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : endpoint_with_host_label_operation_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    endpoint_with_host_label_operation_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"EndpointWithHostLabelOperation" ~service
      ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module FlattenedXmlMap = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : flattened_xml_map_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    flattened_xml_map_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"FlattenedXmlMap" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:flattened_xml_map_response_of_xml ~error_deserializer
end

module FlattenedXmlMapWithXmlName = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : flattened_xml_map_with_xml_name_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    flattened_xml_map_with_xml_name_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"FlattenedXmlMapWithXmlName" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:flattened_xml_map_with_xml_name_response_of_xml ~error_deserializer
end

module FlattenedXmlMapWithXmlNamespace = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let w = Smaws_Lib.Xml.Write.make () in
    ();
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"FlattenedXmlMapWithXmlNamespace" ~service
      ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:flattened_xml_map_with_xml_namespace_output_of_xml ~error_deserializer
end

module FractionalSeconds = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let w = Smaws_Lib.Xml.Write.make () in
    ();
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"FractionalSeconds" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:fractional_seconds_output_of_xml ~error_deserializer
end

module GreetingWithErrors = struct
  let error_to_string = function
    | `ComplexError _ -> "aws.protocoltests.restxml#ComplexError"
    | `InvalidGreeting _ -> "aws.protocoltests.restxml#InvalidGreeting"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "ComplexError" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~structParser:complex_error_of_xml
        with
        | Ok s -> `ComplexError s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGreeting" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~structParser:invalid_greeting_of_xml
        with
        | Ok s -> `InvalidGreeting s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let w = Smaws_Lib.Xml.Write.make () in
    ();
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GreetingWithErrors" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:greeting_with_errors_output_of_xml ~error_deserializer
end

module HttpEmptyPrefixHeaders = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_empty_prefix_headers_input) =
    let w = Smaws_Lib.Xml.Write.make () in
    http_empty_prefix_headers_input_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpEmptyPrefixHeaders" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:http_empty_prefix_headers_output_of_xml ~error_deserializer
end

module HttpEnumPayload = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : enum_payload_input) =
    let w = Smaws_Lib.Xml.Write.make () in
    enum_payload_input_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpEnumPayload" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:enum_payload_input_of_xml ~error_deserializer
end

module HttpPayloadTraits = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_traits_input_output) =
    let w = Smaws_Lib.Xml.Write.make () in
    http_payload_traits_input_output_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadTraits" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:http_payload_traits_input_output_of_xml ~error_deserializer
end

module HttpPayloadTraitsWithMediaType = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_traits_with_media_type_input_output) =
    let w = Smaws_Lib.Xml.Write.make () in
    http_payload_traits_with_media_type_input_output_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadTraitsWithMediaType" ~service
      ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:http_payload_traits_with_media_type_input_output_of_xml
      ~error_deserializer
end

module HttpPayloadWithMemberXmlName = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_with_member_xml_name_input_output) =
    let w = Smaws_Lib.Xml.Write.make () in
    http_payload_with_member_xml_name_input_output_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadWithMemberXmlName" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:http_payload_with_member_xml_name_input_output_of_xml ~error_deserializer
end

module HttpPayloadWithStructure = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_with_structure_input_output) =
    let w = Smaws_Lib.Xml.Write.make () in
    http_payload_with_structure_input_output_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadWithStructure" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:http_payload_with_structure_input_output_of_xml ~error_deserializer
end

module HttpPayloadWithUnion = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_with_union_input_output) =
    let w = Smaws_Lib.Xml.Write.make () in
    http_payload_with_union_input_output_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadWithUnion" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:http_payload_with_union_input_output_of_xml ~error_deserializer
end

module HttpPayloadWithXmlName = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_with_xml_name_input_output) =
    let w = Smaws_Lib.Xml.Write.make () in
    http_payload_with_xml_name_input_output_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadWithXmlName" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:http_payload_with_xml_name_input_output_of_xml ~error_deserializer
end

module HttpPayloadWithXmlNamespace = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_with_xml_namespace_input_output) =
    let w = Smaws_Lib.Xml.Write.make () in
    http_payload_with_xml_namespace_input_output_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadWithXmlNamespace" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:http_payload_with_xml_namespace_input_output_of_xml ~error_deserializer
end

module HttpPayloadWithXmlNamespaceAndPrefix = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_with_xml_namespace_and_prefix_input_output) =
    let w = Smaws_Lib.Xml.Write.make () in
    http_payload_with_xml_namespace_and_prefix_input_output_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadWithXmlNamespaceAndPrefix" ~service
      ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:http_payload_with_xml_namespace_and_prefix_input_output_of_xml
      ~error_deserializer
end

module HttpPrefixHeaders = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_prefix_headers_input_output) =
    let w = Smaws_Lib.Xml.Write.make () in
    http_prefix_headers_input_output_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPrefixHeaders" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:http_prefix_headers_input_output_of_xml ~error_deserializer
end

module HttpRequestWithFloatLabels = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_request_with_float_labels_input) =
    let w = Smaws_Lib.Xml.Write.make () in
    http_request_with_float_labels_input_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpRequestWithFloatLabels" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module HttpRequestWithGreedyLabelInPath = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_request_with_greedy_label_in_path_input) =
    let w = Smaws_Lib.Xml.Write.make () in
    http_request_with_greedy_label_in_path_input_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpRequestWithGreedyLabelInPath" ~service
      ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module HttpRequestWithLabels = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_request_with_labels_input) =
    let w = Smaws_Lib.Xml.Write.make () in
    http_request_with_labels_input_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpRequestWithLabels" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module HttpRequestWithLabelsAndTimestampFormat = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_request_with_labels_and_timestamp_format_input) =
    let w = Smaws_Lib.Xml.Write.make () in
    http_request_with_labels_and_timestamp_format_input_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpRequestWithLabelsAndTimestampFormat"
      ~service ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module HttpResponseCode = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let w = Smaws_Lib.Xml.Write.make () in
    ();
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpResponseCode" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:http_response_code_output_of_xml ~error_deserializer
end

module HttpStringPayload = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : string_payload_input) =
    let w = Smaws_Lib.Xml.Write.make () in
    string_payload_input_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpStringPayload" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:string_payload_input_of_xml ~error_deserializer
end

module IgnoreQueryParamsInResponse = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let w = Smaws_Lib.Xml.Write.make () in
    ();
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"IgnoreQueryParamsInResponse" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:ignore_query_params_in_response_output_of_xml ~error_deserializer
end

module InputAndOutputWithHeaders = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : input_and_output_with_headers_i_o) =
    let w = Smaws_Lib.Xml.Write.make () in
    input_and_output_with_headers_i_o_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"InputAndOutputWithHeaders" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:input_and_output_with_headers_i_o_of_xml ~error_deserializer
end

module NestedXmlMaps = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : nested_xml_maps_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    nested_xml_maps_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"NestedXmlMaps" ~service ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:nested_xml_maps_response_of_xml ~error_deserializer
end

module NestedXmlMapWithXmlName = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : nested_xml_map_with_xml_name_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    nested_xml_map_with_xml_name_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"NestedXmlMapWithXmlName" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:nested_xml_map_with_xml_name_response_of_xml ~error_deserializer
end

module NoInputAndNoOutput = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let w = Smaws_Lib.Xml.Write.make () in
    ();
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"NoInputAndNoOutput" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module NoInputAndOutput = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let w = Smaws_Lib.Xml.Write.make () in
    ();
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"NoInputAndOutput" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:no_input_and_output_output_of_xml ~error_deserializer
end

module NullAndEmptyHeadersClient = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : null_and_empty_headers_i_o) =
    let w = Smaws_Lib.Xml.Write.make () in
    null_and_empty_headers_i_o_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"NullAndEmptyHeadersClient" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:null_and_empty_headers_i_o_of_xml ~error_deserializer
end

module NullAndEmptyHeadersServer = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : null_and_empty_headers_i_o) =
    let w = Smaws_Lib.Xml.Write.make () in
    null_and_empty_headers_i_o_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"NullAndEmptyHeadersServer" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:null_and_empty_headers_i_o_of_xml ~error_deserializer
end

module OmitsNullSerializesEmptyString = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : omits_null_serializes_empty_string_input) =
    let w = Smaws_Lib.Xml.Write.make () in
    omits_null_serializes_empty_string_input_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"OmitsNullSerializesEmptyString" ~service
      ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module PutWithContentEncoding = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : put_with_content_encoding_input) =
    let w = Smaws_Lib.Xml.Write.make () in
    put_with_content_encoding_input_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutWithContentEncoding" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module QueryIdempotencyTokenAutoFill = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : query_idempotency_token_auto_fill_input) =
    let w = Smaws_Lib.Xml.Write.make () in
    query_idempotency_token_auto_fill_input_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"QueryIdempotencyTokenAutoFill" ~service
      ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module QueryParamsAsStringListMap = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : query_params_as_string_list_map_input) =
    let w = Smaws_Lib.Xml.Write.make () in
    query_params_as_string_list_map_input_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"QueryParamsAsStringListMap" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module QueryPrecedence = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : query_precedence_input) =
    let w = Smaws_Lib.Xml.Write.make () in
    query_precedence_input_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"QueryPrecedence" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module RecursiveShapes = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : recursive_shapes_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    recursive_shapes_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"RecursiveShapes" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:recursive_shapes_response_of_xml ~error_deserializer
end

module SimpleScalarProperties = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : simple_scalar_properties_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    simple_scalar_properties_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"SimpleScalarProperties" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:simple_scalar_properties_response_of_xml ~error_deserializer
end

module TimestampFormatHeaders = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : timestamp_format_headers_i_o) =
    let w = Smaws_Lib.Xml.Write.make () in
    timestamp_format_headers_i_o_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"TimestampFormatHeaders" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:timestamp_format_headers_i_o_of_xml ~error_deserializer
end

module XmlAttributes = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_attributes_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    xml_attributes_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlAttributes" ~service ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:xml_attributes_response_of_xml ~error_deserializer
end

module XmlAttributesInMiddle = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_attributes_in_middle_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    xml_attributes_in_middle_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlAttributesInMiddle" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:xml_attributes_in_middle_response_of_xml ~error_deserializer
end

module XmlAttributesOnPayload = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_attributes_on_payload_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    xml_attributes_on_payload_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlAttributesOnPayload" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:xml_attributes_on_payload_response_of_xml ~error_deserializer
end

module XmlBlobs = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_blobs_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    xml_blobs_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlBlobs" ~service ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:xml_blobs_response_of_xml ~error_deserializer
end

module XmlEmptyBlobs = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_empty_blobs_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    xml_empty_blobs_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlEmptyBlobs" ~service ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:xml_empty_blobs_response_of_xml ~error_deserializer
end

module XmlEmptyLists = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_empty_lists_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    xml_empty_lists_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlEmptyLists" ~service ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:xml_empty_lists_response_of_xml ~error_deserializer
end

module XmlEmptyMaps = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_empty_maps_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    xml_empty_maps_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlEmptyMaps" ~service ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:xml_empty_maps_response_of_xml ~error_deserializer
end

module XmlEmptyStrings = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_empty_strings_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    xml_empty_strings_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlEmptyStrings" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:xml_empty_strings_response_of_xml ~error_deserializer
end

module XmlEnums = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_enums_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    xml_enums_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlEnums" ~service ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:xml_enums_response_of_xml ~error_deserializer
end

module XmlIntEnums = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_int_enums_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    xml_int_enums_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlIntEnums" ~service ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:xml_int_enums_response_of_xml ~error_deserializer
end

module XmlLists = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_lists_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    xml_lists_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlLists" ~service ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:xml_lists_response_of_xml ~error_deserializer
end

module XmlMapWithXmlNamespace = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_map_with_xml_namespace_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    xml_map_with_xml_namespace_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlMapWithXmlNamespace" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:xml_map_with_xml_namespace_response_of_xml ~error_deserializer
end

module XmlMaps = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_maps_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    xml_maps_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlMaps" ~service ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:xml_maps_response_of_xml ~error_deserializer
end

module XmlMapsXmlName = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_maps_xml_name_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    xml_maps_xml_name_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlMapsXmlName" ~service ~context
      ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:xml_maps_xml_name_response_of_xml ~error_deserializer
end

module XmlNamespaces = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_namespaces_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    xml_namespaces_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlNamespaces" ~service ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:xml_namespaces_response_of_xml ~error_deserializer
end

module XmlTimestamps = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_timestamps_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    xml_timestamps_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlTimestamps" ~service ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:xml_timestamps_response_of_xml ~error_deserializer
end

module XmlUnions = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_unions_request) =
    let w = Smaws_Lib.Xml.Write.make () in
    xml_unions_request_to_xml w request;
    let body_str = Smaws_Lib.Xml.Write.to_string w in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlUnions" ~service ~context ~method_:`POST
      ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
      ~query:[] ~headers:[]
      ~body:(Some ("application/xml", body_str))
      ~output_deserializer:xml_unions_response_of_xml ~error_deserializer
end
