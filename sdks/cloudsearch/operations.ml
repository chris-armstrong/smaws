open Types
open Service_metadata
open Query_deserializers
open Query_serializers

module BuildSuggesters = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.cloudsearch#ValidationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ValidationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:validation_exception_of_xml
        with
        | Ok s -> `ValidationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : build_suggesters_request) =
    let fields = build_suggesters_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"BuildSuggesters"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:build_suggesters_response_of_xml ~error_deserializer

  let request_with_metadata context (request : build_suggesters_request) =
    let fields = build_suggesters_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"BuildSuggesters"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:build_suggesters_response_of_xml ~error_deserializer
end

module CreateDomain = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `LimitExceededException _ -> "com.amazonaws.cloudsearch#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.cloudsearch#ResourceAlreadyExistsException"
    | `ValidationException _ -> "com.amazonaws.cloudsearch#ValidationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_already_exists_exception_of_xml
        with
        | Ok s -> `ResourceAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ValidationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:validation_exception_of_xml
        with
        | Ok s -> `ValidationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_domain_request) =
    let fields = create_domain_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateDomain"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:create_domain_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_domain_request) =
    let fields = create_domain_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateDomain"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:create_domain_response_of_xml ~error_deserializer
end

module DefineAnalysisScheme = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `InvalidTypeException _ -> "com.amazonaws.cloudsearch#InvalidTypeException"
    | `LimitExceededException _ -> "com.amazonaws.cloudsearch#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.cloudsearch#ValidationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidType" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_type_exception_of_xml
        with
        | Ok s -> `InvalidTypeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ValidationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:validation_exception_of_xml
        with
        | Ok s -> `ValidationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : define_analysis_scheme_request) =
    let fields = define_analysis_scheme_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DefineAnalysisScheme"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:define_analysis_scheme_response_of_xml ~error_deserializer

  let request_with_metadata context (request : define_analysis_scheme_request) =
    let fields = define_analysis_scheme_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DefineAnalysisScheme"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:define_analysis_scheme_response_of_xml ~error_deserializer
end

module DefineExpression = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `InvalidTypeException _ -> "com.amazonaws.cloudsearch#InvalidTypeException"
    | `LimitExceededException _ -> "com.amazonaws.cloudsearch#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.cloudsearch#ValidationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidType" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_type_exception_of_xml
        with
        | Ok s -> `InvalidTypeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ValidationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:validation_exception_of_xml
        with
        | Ok s -> `ValidationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : define_expression_request) =
    let fields = define_expression_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DefineExpression"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:define_expression_response_of_xml ~error_deserializer

  let request_with_metadata context (request : define_expression_request) =
    let fields = define_expression_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DefineExpression"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:define_expression_response_of_xml ~error_deserializer
end

module DefineIndexField = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `InvalidTypeException _ -> "com.amazonaws.cloudsearch#InvalidTypeException"
    | `LimitExceededException _ -> "com.amazonaws.cloudsearch#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.cloudsearch#ValidationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidType" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_type_exception_of_xml
        with
        | Ok s -> `InvalidTypeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ValidationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:validation_exception_of_xml
        with
        | Ok s -> `ValidationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : define_index_field_request) =
    let fields = define_index_field_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DefineIndexField"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:define_index_field_response_of_xml ~error_deserializer

  let request_with_metadata context (request : define_index_field_request) =
    let fields = define_index_field_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DefineIndexField"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:define_index_field_response_of_xml ~error_deserializer
end

module DefineSuggester = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `InvalidTypeException _ -> "com.amazonaws.cloudsearch#InvalidTypeException"
    | `LimitExceededException _ -> "com.amazonaws.cloudsearch#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.cloudsearch#ValidationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidType" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_type_exception_of_xml
        with
        | Ok s -> `InvalidTypeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ValidationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:validation_exception_of_xml
        with
        | Ok s -> `ValidationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : define_suggester_request) =
    let fields = define_suggester_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DefineSuggester"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:define_suggester_response_of_xml ~error_deserializer

  let request_with_metadata context (request : define_suggester_request) =
    let fields = define_suggester_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DefineSuggester"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:define_suggester_response_of_xml ~error_deserializer
end

module DeleteAnalysisScheme = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `InvalidTypeException _ -> "com.amazonaws.cloudsearch#InvalidTypeException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.cloudsearch#ValidationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidType" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_type_exception_of_xml
        with
        | Ok s -> `InvalidTypeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ValidationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:validation_exception_of_xml
        with
        | Ok s -> `ValidationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_analysis_scheme_request) =
    let fields = delete_analysis_scheme_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteAnalysisScheme"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:delete_analysis_scheme_response_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_analysis_scheme_request) =
    let fields = delete_analysis_scheme_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteAnalysisScheme"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:delete_analysis_scheme_response_of_xml ~error_deserializer
end

module DeleteDomain = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_domain_request) =
    let fields = delete_domain_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteDomain"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:delete_domain_response_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_domain_request) =
    let fields = delete_domain_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteDomain"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:delete_domain_response_of_xml ~error_deserializer
end

module DeleteExpression = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `InvalidTypeException _ -> "com.amazonaws.cloudsearch#InvalidTypeException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.cloudsearch#ValidationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidType" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_type_exception_of_xml
        with
        | Ok s -> `InvalidTypeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ValidationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:validation_exception_of_xml
        with
        | Ok s -> `ValidationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_expression_request) =
    let fields = delete_expression_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteExpression"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:delete_expression_response_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_expression_request) =
    let fields = delete_expression_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteExpression"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:delete_expression_response_of_xml ~error_deserializer
end

module DeleteIndexField = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `InvalidTypeException _ -> "com.amazonaws.cloudsearch#InvalidTypeException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.cloudsearch#ValidationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidType" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_type_exception_of_xml
        with
        | Ok s -> `InvalidTypeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ValidationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:validation_exception_of_xml
        with
        | Ok s -> `ValidationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_index_field_request) =
    let fields = delete_index_field_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteIndexField"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:delete_index_field_response_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_index_field_request) =
    let fields = delete_index_field_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteIndexField"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:delete_index_field_response_of_xml ~error_deserializer
end

module DeleteSuggester = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `InvalidTypeException _ -> "com.amazonaws.cloudsearch#InvalidTypeException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.cloudsearch#ValidationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidType" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_type_exception_of_xml
        with
        | Ok s -> `InvalidTypeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ValidationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:validation_exception_of_xml
        with
        | Ok s -> `ValidationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_suggester_request) =
    let fields = delete_suggester_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteSuggester"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:delete_suggester_response_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_suggester_request) =
    let fields = delete_suggester_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteSuggester"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:delete_suggester_response_of_xml ~error_deserializer
end

module DescribeAnalysisSchemes = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_analysis_schemes_request) =
    let fields = describe_analysis_schemes_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeAnalysisSchemes"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_analysis_schemes_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_analysis_schemes_request) =
    let fields = describe_analysis_schemes_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeAnalysisSchemes"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_analysis_schemes_response_of_xml ~error_deserializer
end

module DescribeAvailabilityOptions = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `DisabledOperationException _ -> "com.amazonaws.cloudsearch#DisabledOperationException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `InvalidTypeException _ -> "com.amazonaws.cloudsearch#InvalidTypeException"
    | `LimitExceededException _ -> "com.amazonaws.cloudsearch#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DisabledAction" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:disabled_operation_exception_of_xml
        with
        | Ok s -> `DisabledOperationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidType" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_type_exception_of_xml
        with
        | Ok s -> `InvalidTypeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_availability_options_request) =
    let fields = describe_availability_options_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeAvailabilityOptions"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_availability_options_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_availability_options_request) =
    let fields = describe_availability_options_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeAvailabilityOptions"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_availability_options_response_of_xml ~error_deserializer
end

module DescribeDomainEndpointOptions = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `DisabledOperationException _ -> "com.amazonaws.cloudsearch#DisabledOperationException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `LimitExceededException _ -> "com.amazonaws.cloudsearch#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DisabledAction" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:disabled_operation_exception_of_xml
        with
        | Ok s -> `DisabledOperationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_domain_endpoint_options_request) =
    let fields = describe_domain_endpoint_options_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDomainEndpointOptions"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_domain_endpoint_options_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_domain_endpoint_options_request) =
    let fields = describe_domain_endpoint_options_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDomainEndpointOptions"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_domain_endpoint_options_response_of_xml ~error_deserializer
end

module DescribeDomains = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_domains_request) =
    let fields = describe_domains_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDomains"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_domains_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_domains_request) =
    let fields = describe_domains_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDomains"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_domains_response_of_xml ~error_deserializer
end

module DescribeExpressions = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_expressions_request) =
    let fields = describe_expressions_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeExpressions"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_expressions_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_expressions_request) =
    let fields = describe_expressions_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeExpressions"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_expressions_response_of_xml ~error_deserializer
end

module DescribeIndexFields = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_index_fields_request) =
    let fields = describe_index_fields_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeIndexFields"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_index_fields_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_index_fields_request) =
    let fields = describe_index_fields_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeIndexFields"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_index_fields_response_of_xml ~error_deserializer
end

module DescribeScalingParameters = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_scaling_parameters_request) =
    let fields = describe_scaling_parameters_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeScalingParameters"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_scaling_parameters_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_scaling_parameters_request) =
    let fields = describe_scaling_parameters_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeScalingParameters"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_scaling_parameters_response_of_xml ~error_deserializer
end

module DescribeServiceAccessPolicies = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_service_access_policies_request) =
    let fields = describe_service_access_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeServiceAccessPolicies"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_service_access_policies_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_service_access_policies_request) =
    let fields = describe_service_access_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeServiceAccessPolicies"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_service_access_policies_response_of_xml ~error_deserializer
end

module DescribeSuggesters = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_suggesters_request) =
    let fields = describe_suggesters_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeSuggesters"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_suggesters_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_suggesters_request) =
    let fields = describe_suggesters_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeSuggesters"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_suggesters_response_of_xml ~error_deserializer
end

module IndexDocuments = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.cloudsearch#ValidationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ValidationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:validation_exception_of_xml
        with
        | Ok s -> `ValidationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : index_documents_request) =
    let fields = index_documents_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"IndexDocuments"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:index_documents_response_of_xml ~error_deserializer

  let request_with_metadata context (request : index_documents_request) =
    let fields = index_documents_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"IndexDocuments"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:index_documents_response_of_xml ~error_deserializer
end

module ListDomainNames = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListDomainNames"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:list_domain_names_response_of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListDomainNames"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:list_domain_names_response_of_xml ~error_deserializer
end

module UpdateAvailabilityOptions = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `DisabledOperationException _ -> "com.amazonaws.cloudsearch#DisabledOperationException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `InvalidTypeException _ -> "com.amazonaws.cloudsearch#InvalidTypeException"
    | `LimitExceededException _ -> "com.amazonaws.cloudsearch#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.cloudsearch#ValidationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DisabledAction" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:disabled_operation_exception_of_xml
        with
        | Ok s -> `DisabledOperationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidType" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_type_exception_of_xml
        with
        | Ok s -> `InvalidTypeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ValidationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:validation_exception_of_xml
        with
        | Ok s -> `ValidationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_availability_options_request) =
    let fields = update_availability_options_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateAvailabilityOptions"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:update_availability_options_response_of_xml ~error_deserializer

  let request_with_metadata context (request : update_availability_options_request) =
    let fields = update_availability_options_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateAvailabilityOptions"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:update_availability_options_response_of_xml ~error_deserializer
end

module UpdateDomainEndpointOptions = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `DisabledOperationException _ -> "com.amazonaws.cloudsearch#DisabledOperationException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `InvalidTypeException _ -> "com.amazonaws.cloudsearch#InvalidTypeException"
    | `LimitExceededException _ -> "com.amazonaws.cloudsearch#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.cloudsearch#ValidationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DisabledAction" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:disabled_operation_exception_of_xml
        with
        | Ok s -> `DisabledOperationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidType" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_type_exception_of_xml
        with
        | Ok s -> `InvalidTypeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ValidationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:validation_exception_of_xml
        with
        | Ok s -> `ValidationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_domain_endpoint_options_request) =
    let fields = update_domain_endpoint_options_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateDomainEndpointOptions"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:update_domain_endpoint_options_response_of_xml ~error_deserializer

  let request_with_metadata context (request : update_domain_endpoint_options_request) =
    let fields = update_domain_endpoint_options_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateDomainEndpointOptions"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:update_domain_endpoint_options_response_of_xml ~error_deserializer
end

module UpdateScalingParameters = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `InvalidTypeException _ -> "com.amazonaws.cloudsearch#InvalidTypeException"
    | `LimitExceededException _ -> "com.amazonaws.cloudsearch#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.cloudsearch#ValidationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidType" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_type_exception_of_xml
        with
        | Ok s -> `InvalidTypeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ValidationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:validation_exception_of_xml
        with
        | Ok s -> `ValidationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_scaling_parameters_request) =
    let fields = update_scaling_parameters_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateScalingParameters"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:update_scaling_parameters_response_of_xml ~error_deserializer

  let request_with_metadata context (request : update_scaling_parameters_request) =
    let fields = update_scaling_parameters_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateScalingParameters"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:update_scaling_parameters_response_of_xml ~error_deserializer
end

module UpdateServiceAccessPolicies = struct
  let error_to_string = function
    | `BaseException _ -> "com.amazonaws.cloudsearch#BaseException"
    | `InternalException _ -> "com.amazonaws.cloudsearch#InternalException"
    | `InvalidTypeException _ -> "com.amazonaws.cloudsearch#InvalidTypeException"
    | `LimitExceededException _ -> "com.amazonaws.cloudsearch#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudsearch#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.cloudsearch#ValidationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BaseException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:base_exception_of_xml
        with
        | Ok s -> `BaseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_exception_of_xml
        with
        | Ok s -> `InternalException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidType" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_type_exception_of_xml
        with
        | Ok s -> `InvalidTypeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ValidationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:validation_exception_of_xml
        with
        | Ok s -> `ValidationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_service_access_policies_request) =
    let fields = update_service_access_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateServiceAccessPolicies"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:update_service_access_policies_response_of_xml ~error_deserializer

  let request_with_metadata context (request : update_service_access_policies_request) =
    let fields = update_service_access_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateServiceAccessPolicies"
      ~xmlNamespace:"http://cloudsearch.amazonaws.com/doc/2013-01-01/" ~service ~context ~fields
      ~output_deserializer:update_service_access_policies_response_of_xml ~error_deserializer
end
