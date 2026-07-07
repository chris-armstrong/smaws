open Types
open Service_metadata

module CreateHomeRegionControl = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhubconfig#AccessDeniedException"
    | `DryRunOperation _ -> "com.amazonaws.migrationhubconfig#DryRunOperation"
    | `InternalServerError _ -> "com.amazonaws.migrationhubconfig#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhubconfig#InvalidInputException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.migrationhubconfig#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhubconfig#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DryRunOperation" ->
          `DryRunOperation (Json_deserializers.dry_run_operation_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_home_region_control_request) =
    let input = Json_serializers.create_home_region_control_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMigrationHubMultiAccountService.CreateHomeRegionControl" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_home_region_control_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_home_region_control_request) =
    let input = Json_serializers.create_home_region_control_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMigrationHubMultiAccountService.CreateHomeRegionControl" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_home_region_control_result_of_yojson
      ~error_deserializer
end

module DeleteHomeRegionControl = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhubconfig#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.migrationhubconfig#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhubconfig#InvalidInputException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.migrationhubconfig#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhubconfig#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_home_region_control_request) =
    let input = Json_serializers.delete_home_region_control_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMigrationHubMultiAccountService.DeleteHomeRegionControl" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_home_region_control_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_home_region_control_request) =
    let input = Json_serializers.delete_home_region_control_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMigrationHubMultiAccountService.DeleteHomeRegionControl" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_home_region_control_result_of_yojson
      ~error_deserializer
end

module DescribeHomeRegionControls = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhubconfig#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.migrationhubconfig#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhubconfig#InvalidInputException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.migrationhubconfig#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhubconfig#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_home_region_controls_request) =
    let input = Json_serializers.describe_home_region_controls_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMigrationHubMultiAccountService.DescribeHomeRegionControls" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_home_region_controls_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_home_region_controls_request) =
    let input = Json_serializers.describe_home_region_controls_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMigrationHubMultiAccountService.DescribeHomeRegionControls" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_home_region_controls_result_of_yojson
      ~error_deserializer
end

module GetHomeRegion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhubconfig#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.migrationhubconfig#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhubconfig#InvalidInputException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.migrationhubconfig#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhubconfig#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_home_region_request) =
    let input = Json_serializers.get_home_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMigrationHubMultiAccountService.GetHomeRegion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_home_region_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_home_region_request) =
    let input = Json_serializers.get_home_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMigrationHubMultiAccountService.GetHomeRegion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_home_region_result_of_yojson ~error_deserializer
end
