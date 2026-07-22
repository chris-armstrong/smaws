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
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/AllQueryStringTypesInput" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params =
      List.concat
        [
          (match request.query_integer_enum_list with
          | Some v ->
              [
                ( "IntegerEnumList",
                  List.map
                    (fun v ->
                      match v with
                      | Shared.Types.C -> string_of_int 3
                      | Shared.Types.B -> string_of_int 2
                      | Shared.Types.A -> string_of_int 1)
                    v );
              ]
          | None -> []);
          (match request.query_integer_enum with
          | Some v ->
              [
                ( "IntegerEnum",
                  [
                    (fun v ->
                      match v with
                      | Shared.Types.C -> string_of_int 3
                      | Shared.Types.B -> string_of_int 2
                      | Shared.Types.A -> string_of_int 1)
                      v;
                  ] );
              ]
          | None -> []);
          (match request.query_enum_list with
          | Some v ->
              [
                ( "EnumList",
                  List.map
                    (fun v ->
                      match v with
                      | Shared.Types.ZERO -> "0"
                      | Shared.Types.ONE -> "1"
                      | Shared.Types.BAR -> "Bar"
                      | Shared.Types.BAZ -> "Baz"
                      | Shared.Types.FOO -> "Foo")
                    v );
              ]
          | None -> []);
          (match request.query_enum with
          | Some v ->
              [
                ( "Enum",
                  [
                    (fun v ->
                      match v with
                      | Shared.Types.ZERO -> "0"
                      | Shared.Types.ONE -> "1"
                      | Shared.Types.BAR -> "Bar"
                      | Shared.Types.BAZ -> "Baz"
                      | Shared.Types.FOO -> "Foo")
                      v;
                  ] );
              ]
          | None -> []);
          (match request.query_timestamp_list with
          | Some v ->
              [
                ( "TimestampList",
                  List.map
                    (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)
                    v );
              ]
          | None -> []);
          (match request.query_timestamp with
          | Some v ->
              [
                ( "Timestamp",
                  [ (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v) v ]
                );
              ]
          | None -> []);
          (match request.query_boolean_list with
          | Some v -> [ ("BooleanList", List.map (fun v -> string_of_bool v) v) ]
          | None -> []);
          (match request.query_boolean with
          | Some v -> [ ("Boolean", [ (fun v -> string_of_bool v) v ]) ]
          | None -> []);
          (match request.query_double_list with
          | Some v ->
              [
                ( "DoubleList",
                  List.map
                    (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v)
                    v );
              ]
          | None -> []);
          (match request.query_double with
          | Some v ->
              [
                ( "Double",
                  [ (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v) v ] );
              ]
          | None -> []);
          (match request.query_float with
          | Some v ->
              [
                ( "Float",
                  [ (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v) v ] );
              ]
          | None -> []);
          (match request.query_long with
          | Some v -> [ ("Long", [ (fun v -> Smaws_Lib.CoreTypes.Int64.to_string v) v ]) ]
          | None -> []);
          (match request.query_integer_set with
          | Some v -> [ ("IntegerSet", List.map (fun v -> string_of_int v) v) ]
          | None -> []);
          (match request.query_integer_list with
          | Some v -> [ ("IntegerList", List.map (fun v -> string_of_int v) v) ]
          | None -> []);
          (match request.query_integer with
          | Some v -> [ ("Integer", [ (fun v -> string_of_int v) v ]) ]
          | None -> []);
          (match request.query_short with
          | Some v -> [ ("Short", [ (fun v -> string_of_int v) v ]) ]
          | None -> []);
          (match request.query_byte with
          | Some v -> [ ("Byte", [ (fun v -> string_of_int v) v ]) ]
          | None -> []);
          (match request.query_string_set with
          | Some v -> [ ("StringSet", List.map (fun v -> v) v) ]
          | None -> []);
          (match request.query_string_list with
          | Some v -> [ ("StringList", List.map (fun v -> v) v) ]
          | None -> []);
          (match request.query_string with
          | Some v -> [ ("String", [ (fun v -> v) v ]) ]
          | None -> []);
        ]
    in
    let map_params =
      List.concat
        [
          (match request.query_params_map_of_strings with
          | Some v -> List.map (fun (k, v) -> (k, [ (fun v -> v) v ])) v
          | None -> []);
        ]
    in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"AllQueryStringTypes" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~output_deserializer:Xml_deserializers.unit_of_xml
      ~error_deserializer
end

module BodyWithXmlName = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : body_with_xml_name_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/BodyWithXmlName" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "Ahoy" (fun w ->
          body_with_xml_name_input_output_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"BodyWithXmlName" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:body_with_xml_name_input_output_of_xml ~error_deserializer
end

module ConstantAndVariableQueryString = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : constant_and_variable_query_string_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/ConstantAndVariableQueryString?foo=bar"
        ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params =
      List.concat
        [
          (match request.maybe_set with
          | Some v -> [ ("maybeSet", [ (fun v -> v) v ]) ]
          | None -> []);
          (match request.baz with Some v -> [ ("baz", [ (fun v -> v) v ]) ] | None -> []);
        ]
    in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ConstantAndVariableQueryString" ~service
      ~context ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module ConstantQueryString = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : constant_query_string_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:"/ConstantQueryString/{hello}?foo=bar&hello"
        ~labels:[ ("hello", (fun v -> v) request.hello, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ConstantQueryString" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~output_deserializer:Xml_deserializers.unit_of_xml
      ~error_deserializer
end

module ContentTypeParameters = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : content_type_parameters_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/ContentTypeParameters" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "ContentTypeParametersInput" (fun w ->
          content_type_parameters_input_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ContentTypeParameters" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:content_type_parameters_output_of_xml ~error_deserializer
end

module DatetimeOffsets = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/DatetimeOffsets" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DatetimeOffsets" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body ~output_deserializer:datetime_offsets_output_of_xml
      ~error_deserializer
end

module EmptyInputAndEmptyOutput = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : empty_input_and_empty_output_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/EmptyInputAndEmptyOutput" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"EmptyInputAndEmptyOutput" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:empty_input_and_empty_output_output_of_xml ~error_deserializer
end

module EndpointOperation = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/EndpointOperation" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = Smaws_Lib.Http_bindings.substitute_host_prefix ~host_prefix:"foo." ~labels:[] uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"EndpointOperation" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body ~output_deserializer:Xml_deserializers.unit_of_xml
      ~error_deserializer
end

module EndpointWithHostLabelHeaderOperation = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : host_label_header_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/EndpointWithHostLabelHeaderOperation"
        ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri =
      Smaws_Lib.Http_bindings.substitute_host_prefix ~host_prefix:"{accountId}."
        ~labels:[ ("accountId", (fun v -> v) request.account_id) ]
        uri
    in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (let v = request.account_id in
           [ ("X-Amz-Account-Id", (fun v -> v) v) ]);
        ]
    in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"EndpointWithHostLabelHeaderOperation" ~service
      ~context ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module EndpointWithHostLabelOperation = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : endpoint_with_host_label_operation_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/EndpointWithHostLabelOperation"
        ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri =
      Smaws_Lib.Http_bindings.substitute_host_prefix ~host_prefix:"foo.{label}."
        ~labels:[ ("label", (fun v -> v) request.label) ]
        uri
    in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"EndpointWithHostLabelOperation" ~service
      ~context ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module FlattenedXmlMap = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : flattened_xml_map_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/FlattenedXmlMap" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "FlattenedXmlMapRequest" (fun w ->
          flattened_xml_map_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"FlattenedXmlMap" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:flattened_xml_map_response_of_xml ~error_deserializer
end

module FlattenedXmlMapWithXmlName = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : flattened_xml_map_with_xml_name_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/FlattenedXmlMapWithXmlName" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "FlattenedXmlMapWithXmlNameRequest" (fun w ->
          flattened_xml_map_with_xml_name_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"FlattenedXmlMapWithXmlName" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:flattened_xml_map_with_xml_name_response_of_xml ~error_deserializer
end

module FlattenedXmlMapWithXmlNamespace = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/FlattenedXmlMapWithXmlNamespace"
        ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"FlattenedXmlMapWithXmlNamespace" ~service
      ~context ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:flattened_xml_map_with_xml_namespace_output_of_xml ~error_deserializer
end

module FractionalSeconds = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/FractionalSeconds" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"FractionalSeconds" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
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
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/GreetingWithErrors" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GreetingWithErrors" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:greeting_with_errors_output_of_xml ~error_deserializer
end

module HttpEmptyPrefixHeaders = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_empty_prefix_headers_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpEmptyPrefixHeaders" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.specific_header with
          | Some v -> [ ("hello", (fun v -> v) v) ]
          | None -> []);
        ]
    in
    let prefix_headers =
      List.concat
        [
          (match request.prefix_headers with
          | Some v -> [ ("", List.map (fun (k, v) -> (k, (fun v -> v) v)) v) ]
          | None -> []);
        ]
    in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpEmptyPrefixHeaders" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:http_empty_prefix_headers_output_of_xml ~error_deserializer
end

module HttpEnumPayload = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : enum_payload_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/EnumPayload" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.payload with
      | Some v -> Some ("text/plain", (fun v -> match v with V -> "enumvalue") v)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpEnumPayload" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body ~output_deserializer:enum_payload_input_of_xml
      ~error_deserializer
end

module HttpPayloadTraits = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_traits_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpPayloadTraits" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [ (match request.foo with Some v -> [ ("X-Foo", (fun v -> v) v) ] | None -> []) ]
    in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.blob with
      | Some v -> Some ("application/octet-stream", Bytes.to_string v)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadTraits" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:http_payload_traits_input_output_of_xml ~error_deserializer
end

module HttpPayloadTraitsWithMediaType = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_traits_with_media_type_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpPayloadTraitsWithMediaType"
        ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [ (match request.foo with Some v -> [ ("X-Foo", (fun v -> v) v) ] | None -> []) ]
    in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.blob with Some v -> Some ("text/plain", Bytes.to_string v) | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadTraitsWithMediaType" ~service
      ~context ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:http_payload_traits_with_media_type_input_output_of_xml
      ~error_deserializer
end

module HttpPayloadWithMemberXmlName = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_with_member_xml_name_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpPayloadWithMemberXmlName" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.nested with
      | Some v ->
          let w = Smaws_Lib.Xml.Write.make () in
          Smaws_Lib.Xml.Write.element w "Hola" (fun w -> payload_with_xml_name_to_xml w v);
          Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadWithMemberXmlName" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:http_payload_with_member_xml_name_input_output_of_xml ~error_deserializer
end

module HttpPayloadWithStructure = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_with_structure_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpPayloadWithStructure" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.nested with
      | Some v ->
          let w = Smaws_Lib.Xml.Write.make () in
          Smaws_Lib.Xml.Write.element w "NestedPayload" (fun w -> nested_payload_to_xml w v);
          Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadWithStructure" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:http_payload_with_structure_input_output_of_xml ~error_deserializer
end

module HttpPayloadWithUnion = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_with_union_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpPayloadWithUnion" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.nested with
      | Some v ->
          let w = Smaws_Lib.Xml.Write.make () in
          Smaws_Lib.Xml.Write.element w "UnionPayload" (fun w -> union_payload_to_xml w v);
          Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadWithUnion" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:http_payload_with_union_input_output_of_xml ~error_deserializer
end

module HttpPayloadWithXmlName = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_with_xml_name_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpPayloadWithXmlName" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.nested with
      | Some v ->
          let w = Smaws_Lib.Xml.Write.make () in
          Smaws_Lib.Xml.Write.element w "Hello" (fun w -> payload_with_xml_name_to_xml w v);
          Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadWithXmlName" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:http_payload_with_xml_name_input_output_of_xml ~error_deserializer
end

module HttpPayloadWithXmlNamespace = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_with_xml_namespace_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpPayloadWithXmlNamespace" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.nested with
      | Some v ->
          let w = Smaws_Lib.Xml.Write.make () in
          Smaws_Lib.Xml.Write.element w "PayloadWithXmlNamespace" ~ns:"http://foo.com" (fun w ->
              payload_with_xml_namespace_to_xml w v);
          Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadWithXmlNamespace" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:http_payload_with_xml_namespace_input_output_of_xml ~error_deserializer
end

module HttpPayloadWithXmlNamespaceAndPrefix = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_with_xml_namespace_and_prefix_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpPayloadWithXmlNamespaceAndPrefix"
        ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.nested with
      | Some v ->
          let w = Smaws_Lib.Xml.Write.make () in
          Smaws_Lib.Xml.Write.element w "PayloadWithXmlNamespaceAndPrefix"
            ~attrs:[ ("xmlns:baz", "http://foo.com", None) ]
            (fun w -> payload_with_xml_namespace_and_prefix_to_xml w v);
          Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadWithXmlNamespaceAndPrefix" ~service
      ~context ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:http_payload_with_xml_namespace_and_prefix_input_output_of_xml
      ~error_deserializer
end

module HttpPrefixHeaders = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_prefix_headers_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpPrefixHeaders" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [ (match request.foo with Some v -> [ ("x-foo", (fun v -> v) v) ] | None -> []) ]
    in
    let prefix_headers =
      List.concat
        [
          (match request.foo_map with
          | Some v -> [ ("x-foo-", List.map (fun (k, v) -> (k, (fun v -> v) v)) v) ]
          | None -> []);
        ]
    in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPrefixHeaders" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:http_prefix_headers_input_output_of_xml ~error_deserializer
end

module HttpRequestWithFloatLabels = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_request_with_float_labels_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/FloatHttpLabels/{float}/{double}"
        ~labels:
          [
            ( "double",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v)
                request.double,
              false );
            ( "float",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v)
                request.float_,
              false );
          ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpRequestWithFloatLabels" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~output_deserializer:Xml_deserializers.unit_of_xml
      ~error_deserializer
end

module HttpRequestWithGreedyLabelInPath = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_request_with_greedy_label_in_path_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:"/HttpRequestWithGreedyLabelInPath/foo/{foo}/baz/{baz+}"
        ~labels:
          [ ("baz", (fun v -> v) request.baz, true); ("foo", (fun v -> v) request.foo, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpRequestWithGreedyLabelInPath" ~service
      ~context ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module HttpRequestWithLabels = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_request_with_labels_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:
          "/HttpRequestWithLabels/{string}/{short}/{integer}/{long}/{float}/{double}/{boolean}/{timestamp}"
        ~labels:
          [
            ( "timestamp",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)
                request.timestamp,
              false );
            ("boolean", (fun v -> string_of_bool v) request.boolean_, false);
            ( "double",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v)
                request.double,
              false );
            ( "float",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v)
                request.float_,
              false );
            ("long", (fun v -> Smaws_Lib.CoreTypes.Int64.to_string v) request.long, false);
            ("integer", (fun v -> string_of_int v) request.integer, false);
            ("short", (fun v -> string_of_int v) request.short, false);
            ("string", (fun v -> v) request.string_, false);
          ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpRequestWithLabels" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~output_deserializer:Xml_deserializers.unit_of_xml
      ~error_deserializer
end

module HttpRequestWithLabelsAndTimestampFormat = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_request_with_labels_and_timestamp_format_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:
          "/HttpRequestWithLabelsAndTimestampFormat/{memberEpochSeconds}/{memberHttpDate}/{memberDateTime}/{defaultFormat}/{targetEpochSeconds}/{targetHttpDate}/{targetDateTime}"
        ~labels:
          [
            ( "targetDateTime",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)
                request.target_date_time,
              false );
            ( "targetHttpDate",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v)
                request.target_http_date,
              false );
            ( "targetEpochSeconds",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_epoch_to_string v)
                request.target_epoch_seconds,
              false );
            ( "defaultFormat",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)
                request.default_format,
              false );
            ( "memberDateTime",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)
                request.member_date_time,
              false );
            ( "memberHttpDate",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v)
                request.member_http_date,
              false );
            ( "memberEpochSeconds",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_epoch_to_string v)
                request.member_epoch_seconds,
              false );
          ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpRequestWithLabelsAndTimestampFormat"
      ~service ~context ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module HttpResponseCode = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpResponseCode" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpResponseCode" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body ~output_deserializer:http_response_code_output_of_xml
      ~error_deserializer
end

module HttpStringPayload = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : string_payload_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/StringPayload" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = match request.payload with Some v -> Some ("text/plain", v) | None -> None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpStringPayload" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body ~output_deserializer:string_payload_input_of_xml
      ~error_deserializer
end

module IgnoreQueryParamsInResponse = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/IgnoreQueryParamsInResponse" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"IgnoreQueryParamsInResponse" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:ignore_query_params_in_response_output_of_xml ~error_deserializer
end

module InputAndOutputWithHeaders = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : input_and_output_with_headers_i_o) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/InputAndOutputWithHeaders" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.header_enum_list with
          | Some v ->
              [
                ( "X-EnumList",
                  String.concat ", "
                    (List.map
                       (fun v ->
                         match v with
                         | Shared.Types.ZERO -> "0"
                         | Shared.Types.ONE -> "1"
                         | Shared.Types.BAR -> "Bar"
                         | Shared.Types.BAZ -> "Baz"
                         | Shared.Types.FOO -> "Foo")
                       v) );
              ]
          | None -> []);
          (match request.header_enum with
          | Some v ->
              [
                ( "X-Enum",
                  (fun v ->
                    match v with
                    | Shared.Types.ZERO -> "0"
                    | Shared.Types.ONE -> "1"
                    | Shared.Types.BAR -> "Bar"
                    | Shared.Types.BAZ -> "Baz"
                    | Shared.Types.FOO -> "Foo")
                    v );
              ]
          | None -> []);
          (match request.header_timestamp_list with
          | Some v ->
              [
                ( "X-TimestampList",
                  String.concat ", "
                    (List.map
                       (fun v ->
                         Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v)
                       v) );
              ]
          | None -> []);
          (match request.header_boolean_list with
          | Some v ->
              [ ("X-BooleanList", String.concat ", " (List.map (fun v -> string_of_bool v) v)) ]
          | None -> []);
          (match request.header_integer_list with
          | Some v ->
              [ ("X-IntegerList", String.concat ", " (List.map (fun v -> string_of_int v) v)) ]
          | None -> []);
          (match request.header_string_set with
          | Some v -> [ ("X-StringSet", String.concat ", " (List.map (fun v -> v) v)) ]
          | None -> []);
          (match request.header_string_list with
          | Some v -> [ ("X-StringList", String.concat ", " (List.map (fun v -> v) v)) ]
          | None -> []);
          (match request.header_false_bool with
          | Some v -> [ ("X-Boolean2", (fun v -> string_of_bool v) v) ]
          | None -> []);
          (match request.header_true_bool with
          | Some v -> [ ("X-Boolean1", (fun v -> string_of_bool v) v) ]
          | None -> []);
          (match request.header_double with
          | Some v ->
              [
                ( "X-Double",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v) v );
              ]
          | None -> []);
          (match request.header_float with
          | Some v ->
              [
                ( "X-Float",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v) v );
              ]
          | None -> []);
          (match request.header_long with
          | Some v -> [ ("X-Long", (fun v -> Smaws_Lib.CoreTypes.Int64.to_string v) v) ]
          | None -> []);
          (match request.header_integer with
          | Some v -> [ ("X-Integer", (fun v -> string_of_int v) v) ]
          | None -> []);
          (match request.header_short with
          | Some v -> [ ("X-Short", (fun v -> string_of_int v) v) ]
          | None -> []);
          (match request.header_byte with
          | Some v -> [ ("X-Byte", (fun v -> string_of_int v) v) ]
          | None -> []);
          (match request.header_string with
          | Some v -> [ ("X-String", (fun v -> v) v) ]
          | None -> []);
        ]
    in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"InputAndOutputWithHeaders" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:input_and_output_with_headers_i_o_of_xml ~error_deserializer
end

module NestedXmlMaps = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : nested_xml_maps_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/NestedXmlMaps" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "NestedXmlMapsRequest" (fun w ->
          nested_xml_maps_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"NestedXmlMaps" ~service ~context ~method_:`POST
      ~uri ~query ~headers ~body ~output_deserializer:nested_xml_maps_response_of_xml
      ~error_deserializer
end

module NestedXmlMapWithXmlName = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : nested_xml_map_with_xml_name_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/NestedXmlMapWithXmlName" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "NestedXmlMapWithXmlNameRequest" (fun w ->
          nested_xml_map_with_xml_name_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"NestedXmlMapWithXmlName" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:nested_xml_map_with_xml_name_response_of_xml ~error_deserializer
end

module NoInputAndNoOutput = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/NoInputAndNoOutput" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"NoInputAndNoOutput" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body ~output_deserializer:Xml_deserializers.unit_of_xml
      ~error_deserializer
end

module NoInputAndOutput = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/NoInputAndOutputOutput" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"NoInputAndOutput" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:no_input_and_output_output_of_xml ~error_deserializer
end

module NullAndEmptyHeadersClient = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : null_and_empty_headers_i_o) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/NullAndEmptyHeadersClient" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.c with
          | Some v -> [ ("X-C", String.concat ", " (List.map (fun v -> v) v)) ]
          | None -> []);
          (match request.b with Some v -> [ ("X-B", (fun v -> v) v) ] | None -> []);
          (match request.a with Some v -> [ ("X-A", (fun v -> v) v) ] | None -> []);
        ]
    in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"NullAndEmptyHeadersClient" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:null_and_empty_headers_i_o_of_xml ~error_deserializer
end

module NullAndEmptyHeadersServer = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : null_and_empty_headers_i_o) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/NullAndEmptyHeadersServer" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.c with
          | Some v -> [ ("X-C", String.concat ", " (List.map (fun v -> v) v)) ]
          | None -> []);
          (match request.b with Some v -> [ ("X-B", (fun v -> v) v) ] | None -> []);
          (match request.a with Some v -> [ ("X-A", (fun v -> v) v) ] | None -> []);
        ]
    in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"NullAndEmptyHeadersServer" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:null_and_empty_headers_i_o_of_xml ~error_deserializer
end

module OmitsNullSerializesEmptyString = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : omits_null_serializes_empty_string_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/OmitsNullSerializesEmptyString"
        ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params =
      List.concat
        [
          (match request.empty_string with
          | Some v -> [ ("Empty", [ (fun v -> v) v ]) ]
          | None -> []);
          (match request.null_value with Some v -> [ ("Null", [ (fun v -> v) v ]) ] | None -> []);
        ]
    in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"OmitsNullSerializesEmptyString" ~service
      ~context ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module PutWithContentEncoding = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : put_with_content_encoding_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:"/requestcompression/putcontentwithencoding" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.encoding with
          | Some v -> [ ("Content-Encoding", (fun v -> v) v) ]
          | None -> []);
        ]
    in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "PutWithContentEncodingInput" (fun w ->
          put_with_content_encoding_input_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutWithContentEncoding" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body ~output_deserializer:Xml_deserializers.unit_of_xml
      ~error_deserializer
end

module QueryIdempotencyTokenAutoFill = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : query_idempotency_token_auto_fill_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/QueryIdempotencyTokenAutoFill"
        ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let request =
      {
        token =
          (match request.token with Some t -> Some t | None -> Some (Smaws_Lib.Uuid.generate ()));
      }
    in
    let named_params =
      List.concat
        [ (match request.token with Some v -> [ ("token", [ (fun v -> v) v ]) ] | None -> []) ]
    in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"QueryIdempotencyTokenAutoFill" ~service
      ~context ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:Xml_deserializers.unit_of_xml ~error_deserializer
end

module QueryParamsAsStringListMap = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : query_params_as_string_list_map_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/StringListMap" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params =
      List.concat
        [ (match request.qux with Some v -> [ ("corge", [ (fun v -> v) v ]) ] | None -> []) ]
    in
    let map_params =
      List.concat
        [
          (match request.foo with
          | Some v -> List.map (fun (k, vs) -> (k, List.map (fun v -> v) vs)) v
          | None -> []);
        ]
    in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"QueryParamsAsStringListMap" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body ~output_deserializer:Xml_deserializers.unit_of_xml
      ~error_deserializer
end

module QueryPrecedence = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : query_precedence_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/Precedence" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params =
      List.concat
        [ (match request.foo with Some v -> [ ("bar", [ (fun v -> v) v ]) ] | None -> []) ]
    in
    let map_params =
      List.concat
        [
          (match request.baz with
          | Some v -> List.map (fun (k, v) -> (k, [ (fun v -> v) v ])) v
          | None -> []);
        ]
    in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"QueryPrecedence" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body ~output_deserializer:Xml_deserializers.unit_of_xml
      ~error_deserializer
end

module RecursiveShapes = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : recursive_shapes_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/RecursiveShapes" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "RecursiveShapesRequest" (fun w ->
          recursive_shapes_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"RecursiveShapes" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body ~output_deserializer:recursive_shapes_response_of_xml
      ~error_deserializer
end

module SimpleScalarProperties = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : simple_scalar_properties_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/SimpleScalarProperties" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [ (match request.foo with Some v -> [ ("X-Foo", (fun v -> v) v) ] | None -> []) ]
    in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "SimpleScalarPropertiesRequest" (fun w ->
          simple_scalar_properties_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"SimpleScalarProperties" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:simple_scalar_properties_response_of_xml ~error_deserializer
end

module TimestampFormatHeaders = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : timestamp_format_headers_i_o) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/TimestampFormatHeaders" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.target_date_time with
          | Some v ->
              [
                ( "X-targetDateTime",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v) v );
              ]
          | None -> []);
          (match request.target_http_date with
          | Some v ->
              [
                ( "X-targetHttpDate",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.target_epoch_seconds with
          | Some v ->
              [
                ( "X-targetEpochSeconds",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_epoch_to_string v) v );
              ]
          | None -> []);
          (match request.default_format with
          | Some v ->
              [
                ( "X-defaultFormat",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.member_date_time with
          | Some v ->
              [
                ( "X-memberDateTime",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v) v );
              ]
          | None -> []);
          (match request.member_http_date with
          | Some v ->
              [
                ( "X-memberHttpDate",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.member_epoch_seconds with
          | Some v ->
              [
                ( "X-memberEpochSeconds",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_epoch_to_string v) v );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"TimestampFormatHeaders" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:timestamp_format_headers_i_o_of_xml ~error_deserializer
end

module XmlAttributes = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_attributes_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlAttributes" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlAttributesRequest"
        ~attrs:
          (List.concat [ (match request.attr with Some s -> [ ("test", s, None) ] | None -> []) ])
        (fun w -> xml_attributes_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlAttributes" ~service ~context ~method_:`PUT
      ~uri ~query ~headers ~body ~output_deserializer:xml_attributes_response_of_xml
      ~error_deserializer
end

module XmlAttributesInMiddle = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_attributes_in_middle_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlAttributesInMiddle" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.payload with
      | Some v ->
          let w = Smaws_Lib.Xml.Write.make () in
          Smaws_Lib.Xml.Write.element w "XmlAttributesInMiddlePayloadRequest"
            ~attrs:
              (List.concat [ (match v.attr with Some s -> [ ("test", s, None) ] | None -> []) ])
            (fun w -> xml_attributes_in_middle_payload_request_to_xml w v);
          Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlAttributesInMiddle" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:xml_attributes_in_middle_response_of_xml ~error_deserializer
end

module XmlAttributesOnPayload = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_attributes_on_payload_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlAttributesOnPayload" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.payload with
      | Some v ->
          let w = Smaws_Lib.Xml.Write.make () in
          Smaws_Lib.Xml.Write.element w "XmlAttributesPayloadRequest"
            ~attrs:
              (List.concat [ (match v.attr with Some s -> [ ("test", s, None) ] | None -> []) ])
            (fun w -> xml_attributes_payload_request_to_xml w v);
          Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlAttributesOnPayload" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:xml_attributes_on_payload_response_of_xml ~error_deserializer
end

module XmlBlobs = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_blobs_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlBlobs" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlBlobsRequest" (fun w -> xml_blobs_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlBlobs" ~service ~context ~method_:`POST ~uri
      ~query ~headers ~body ~output_deserializer:xml_blobs_response_of_xml ~error_deserializer
end

module XmlEmptyBlobs = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_empty_blobs_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlEmptyBlobs" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlEmptyBlobsRequest" (fun w ->
          xml_empty_blobs_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlEmptyBlobs" ~service ~context ~method_:`POST
      ~uri ~query ~headers ~body ~output_deserializer:xml_empty_blobs_response_of_xml
      ~error_deserializer
end

module XmlEmptyLists = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_empty_lists_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlEmptyLists" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlEmptyListsRequest" (fun w ->
          xml_empty_lists_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlEmptyLists" ~service ~context ~method_:`PUT
      ~uri ~query ~headers ~body ~output_deserializer:xml_empty_lists_response_of_xml
      ~error_deserializer
end

module XmlEmptyMaps = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_empty_maps_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlEmptyMaps" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlEmptyMapsRequest" (fun w ->
          xml_empty_maps_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlEmptyMaps" ~service ~context ~method_:`POST
      ~uri ~query ~headers ~body ~output_deserializer:xml_empty_maps_response_of_xml
      ~error_deserializer
end

module XmlEmptyStrings = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_empty_strings_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlEmptyStrings" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlEmptyStringsRequest" (fun w ->
          xml_empty_strings_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlEmptyStrings" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:xml_empty_strings_response_of_xml ~error_deserializer
end

module XmlEnums = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_enums_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlEnums" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlEnumsRequest" (fun w -> xml_enums_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlEnums" ~service ~context ~method_:`PUT ~uri
      ~query ~headers ~body ~output_deserializer:xml_enums_response_of_xml ~error_deserializer
end

module XmlIntEnums = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_int_enums_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlIntEnums" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlIntEnumsRequest" (fun w ->
          xml_int_enums_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlIntEnums" ~service ~context ~method_:`PUT
      ~uri ~query ~headers ~body ~output_deserializer:xml_int_enums_response_of_xml
      ~error_deserializer
end

module XmlLists = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_lists_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlLists" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlListsRequest" (fun w -> xml_lists_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlLists" ~service ~context ~method_:`PUT ~uri
      ~query ~headers ~body ~output_deserializer:xml_lists_response_of_xml ~error_deserializer
end

module XmlMapWithXmlNamespace = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_map_with_xml_namespace_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlMapWithXmlNamespace" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlMapWithXmlNamespaceRequest" (fun w ->
          xml_map_with_xml_namespace_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlMapWithXmlNamespace" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:xml_map_with_xml_namespace_response_of_xml ~error_deserializer
end

module XmlMaps = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_maps_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlMaps" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlMapsRequest" (fun w -> xml_maps_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlMaps" ~service ~context ~method_:`POST ~uri
      ~query ~headers ~body ~output_deserializer:xml_maps_response_of_xml ~error_deserializer
end

module XmlMapsXmlName = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_maps_xml_name_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlMapsXmlName" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlMapsXmlNameRequest" (fun w ->
          xml_maps_xml_name_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlMapsXmlName" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:xml_maps_xml_name_response_of_xml ~error_deserializer
end

module XmlNamespaces = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_namespaces_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlNamespaces" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlNamespacesRequest" ~ns:"http://foo.com" (fun w ->
          xml_namespaces_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlNamespaces" ~service ~context ~method_:`POST
      ~uri ~query ~headers ~body ~output_deserializer:xml_namespaces_response_of_xml
      ~error_deserializer
end

module XmlTimestamps = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_timestamps_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlTimestamps" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlTimestampsRequest" (fun w ->
          xml_timestamps_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlTimestamps" ~service ~context ~method_:`POST
      ~uri ~query ~headers ~body ~output_deserializer:xml_timestamps_response_of_xml
      ~error_deserializer
end

module XmlUnions = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_unions_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlUnions" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlUnionsRequest" (fun w ->
          xml_unions_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlUnions" ~service ~context ~method_:`PUT ~uri
      ~query ~headers ~body ~output_deserializer:xml_unions_response_of_xml ~error_deserializer
end
