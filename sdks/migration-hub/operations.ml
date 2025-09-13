open Types
open Service_metadata

module AssociateCreatedArtifact = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `DryRunOperation _ -> "com.amazonaws.migrationhub#DryRunOperation"
    | `HomeRegionNotSetException _ -> "com.amazonaws.migrationhub#HomeRegionNotSetException"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.migrationhub#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | `UnauthorizedOperation _ -> "com.amazonaws.migrationhub#UnauthorizedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DryRunOperation" ->
          `DryRunOperation (Json_deserializers.dry_run_operation_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnauthorizedOperation" ->
          `UnauthorizedOperation (Json_deserializers.unauthorized_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_created_artifact_request) =
    let input = Json_serializers.associate_created_artifact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.AssociateCreatedArtifact"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_created_artifact_result_of_yojson
      ~error_deserializer
end

module AssociateDiscoveredResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `DryRunOperation _ -> "com.amazonaws.migrationhub#DryRunOperation"
    | `HomeRegionNotSetException _ -> "com.amazonaws.migrationhub#HomeRegionNotSetException"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `PolicyErrorException _ -> "com.amazonaws.migrationhub#PolicyErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.migrationhub#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | `UnauthorizedOperation _ -> "com.amazonaws.migrationhub#UnauthorizedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DryRunOperation" ->
          `DryRunOperation (Json_deserializers.dry_run_operation_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "PolicyErrorException" ->
          `PolicyErrorException (Json_deserializers.policy_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnauthorizedOperation" ->
          `UnauthorizedOperation (Json_deserializers.unauthorized_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_discovered_resource_request) =
    let input = Json_serializers.associate_discovered_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.AssociateDiscoveredResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_discovered_resource_result_of_yojson
      ~error_deserializer
end

module AssociateSourceResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `DryRunOperation _ -> "com.amazonaws.migrationhub#DryRunOperation"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.migrationhub#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | `UnauthorizedOperation _ -> "com.amazonaws.migrationhub#UnauthorizedOperation"
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
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnauthorizedOperation" ->
          `UnauthorizedOperation (Json_deserializers.unauthorized_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_source_resource_request) =
    let input = Json_serializers.associate_source_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.AssociateSourceResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_source_resource_result_of_yojson
      ~error_deserializer
end

module CreateProgressUpdateStream = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `DryRunOperation _ -> "com.amazonaws.migrationhub#DryRunOperation"
    | `HomeRegionNotSetException _ -> "com.amazonaws.migrationhub#HomeRegionNotSetException"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | `UnauthorizedOperation _ -> "com.amazonaws.migrationhub#UnauthorizedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DryRunOperation" ->
          `DryRunOperation (Json_deserializers.dry_run_operation_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnauthorizedOperation" ->
          `UnauthorizedOperation (Json_deserializers.unauthorized_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_progress_update_stream_request) =
    let input = Json_serializers.create_progress_update_stream_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.CreateProgressUpdateStream"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_progress_update_stream_result_of_yojson
      ~error_deserializer
end

module DeleteProgressUpdateStream = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `DryRunOperation _ -> "com.amazonaws.migrationhub#DryRunOperation"
    | `HomeRegionNotSetException _ -> "com.amazonaws.migrationhub#HomeRegionNotSetException"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.migrationhub#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | `UnauthorizedOperation _ -> "com.amazonaws.migrationhub#UnauthorizedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DryRunOperation" ->
          `DryRunOperation (Json_deserializers.dry_run_operation_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnauthorizedOperation" ->
          `UnauthorizedOperation (Json_deserializers.unauthorized_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_progress_update_stream_request) =
    let input = Json_serializers.delete_progress_update_stream_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.DeleteProgressUpdateStream"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_progress_update_stream_result_of_yojson
      ~error_deserializer
end

module DescribeApplicationState = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `HomeRegionNotSetException _ -> "com.amazonaws.migrationhub#HomeRegionNotSetException"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `PolicyErrorException _ -> "com.amazonaws.migrationhub#PolicyErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.migrationhub#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "PolicyErrorException" ->
          `PolicyErrorException (Json_deserializers.policy_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_application_state_request) =
    let input = Json_serializers.describe_application_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.DescribeApplicationState"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_application_state_result_of_yojson
      ~error_deserializer
end

module DescribeMigrationTask = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `HomeRegionNotSetException _ -> "com.amazonaws.migrationhub#HomeRegionNotSetException"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.migrationhub#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_migration_task_request) =
    let input = Json_serializers.describe_migration_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.DescribeMigrationTask" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_migration_task_result_of_yojson
      ~error_deserializer
end

module DisassociateCreatedArtifact = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `DryRunOperation _ -> "com.amazonaws.migrationhub#DryRunOperation"
    | `HomeRegionNotSetException _ -> "com.amazonaws.migrationhub#HomeRegionNotSetException"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.migrationhub#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | `UnauthorizedOperation _ -> "com.amazonaws.migrationhub#UnauthorizedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DryRunOperation" ->
          `DryRunOperation (Json_deserializers.dry_run_operation_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnauthorizedOperation" ->
          `UnauthorizedOperation (Json_deserializers.unauthorized_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_created_artifact_request) =
    let input = Json_serializers.disassociate_created_artifact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.DisassociateCreatedArtifact"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_created_artifact_result_of_yojson
      ~error_deserializer
end

module DisassociateDiscoveredResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `DryRunOperation _ -> "com.amazonaws.migrationhub#DryRunOperation"
    | `HomeRegionNotSetException _ -> "com.amazonaws.migrationhub#HomeRegionNotSetException"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.migrationhub#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | `UnauthorizedOperation _ -> "com.amazonaws.migrationhub#UnauthorizedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DryRunOperation" ->
          `DryRunOperation (Json_deserializers.dry_run_operation_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnauthorizedOperation" ->
          `UnauthorizedOperation (Json_deserializers.unauthorized_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_discovered_resource_request) =
    let input = Json_serializers.disassociate_discovered_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.DisassociateDiscoveredResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_discovered_resource_result_of_yojson
      ~error_deserializer
end

module DisassociateSourceResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `DryRunOperation _ -> "com.amazonaws.migrationhub#DryRunOperation"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.migrationhub#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | `UnauthorizedOperation _ -> "com.amazonaws.migrationhub#UnauthorizedOperation"
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
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnauthorizedOperation" ->
          `UnauthorizedOperation (Json_deserializers.unauthorized_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_source_resource_request) =
    let input = Json_serializers.disassociate_source_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.DisassociateSourceResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_source_resource_result_of_yojson
      ~error_deserializer
end

module ImportMigrationTask = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `DryRunOperation _ -> "com.amazonaws.migrationhub#DryRunOperation"
    | `HomeRegionNotSetException _ -> "com.amazonaws.migrationhub#HomeRegionNotSetException"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.migrationhub#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | `UnauthorizedOperation _ -> "com.amazonaws.migrationhub#UnauthorizedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DryRunOperation" ->
          `DryRunOperation (Json_deserializers.dry_run_operation_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnauthorizedOperation" ->
          `UnauthorizedOperation (Json_deserializers.unauthorized_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_migration_task_request) =
    let input = Json_serializers.import_migration_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.ImportMigrationTask" ~service
      ~context ~input ~output_deserializer:Json_deserializers.import_migration_task_result_of_yojson
      ~error_deserializer
end

module ListApplicationStates = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `HomeRegionNotSetException _ -> "com.amazonaws.migrationhub#HomeRegionNotSetException"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
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

  let request context (request : list_application_states_request) =
    let input = Json_serializers.list_application_states_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.ListApplicationStates" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_application_states_result_of_yojson
      ~error_deserializer
end

module ListCreatedArtifacts = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `HomeRegionNotSetException _ -> "com.amazonaws.migrationhub#HomeRegionNotSetException"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.migrationhub#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_created_artifacts_request) =
    let input = Json_serializers.list_created_artifacts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.ListCreatedArtifacts" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_created_artifacts_result_of_yojson
      ~error_deserializer
end

module ListDiscoveredResources = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `HomeRegionNotSetException _ -> "com.amazonaws.migrationhub#HomeRegionNotSetException"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.migrationhub#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_discovered_resources_request) =
    let input = Json_serializers.list_discovered_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.ListDiscoveredResources"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_discovered_resources_result_of_yojson
      ~error_deserializer
end

module ListMigrationTaskUpdates = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.migrationhub#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_migration_task_updates_request) =
    let input = Json_serializers.list_migration_task_updates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.ListMigrationTaskUpdates"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_migration_task_updates_result_of_yojson
      ~error_deserializer
end

module ListMigrationTasks = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `HomeRegionNotSetException _ -> "com.amazonaws.migrationhub#HomeRegionNotSetException"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `PolicyErrorException _ -> "com.amazonaws.migrationhub#PolicyErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.migrationhub#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "PolicyErrorException" ->
          `PolicyErrorException (Json_deserializers.policy_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_migration_tasks_request) =
    let input = Json_serializers.list_migration_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.ListMigrationTasks" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_migration_tasks_result_of_yojson
      ~error_deserializer
end

module ListProgressUpdateStreams = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `HomeRegionNotSetException _ -> "com.amazonaws.migrationhub#HomeRegionNotSetException"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
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

  let request context (request : list_progress_update_streams_request) =
    let input = Json_serializers.list_progress_update_streams_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.ListProgressUpdateStreams"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_progress_update_streams_result_of_yojson
      ~error_deserializer
end

module ListSourceResources = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.migrationhub#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_source_resources_request) =
    let input = Json_serializers.list_source_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.ListSourceResources" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_source_resources_result_of_yojson
      ~error_deserializer
end

module NotifyApplicationState = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `DryRunOperation _ -> "com.amazonaws.migrationhub#DryRunOperation"
    | `HomeRegionNotSetException _ -> "com.amazonaws.migrationhub#HomeRegionNotSetException"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `PolicyErrorException _ -> "com.amazonaws.migrationhub#PolicyErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.migrationhub#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | `UnauthorizedOperation _ -> "com.amazonaws.migrationhub#UnauthorizedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DryRunOperation" ->
          `DryRunOperation (Json_deserializers.dry_run_operation_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "PolicyErrorException" ->
          `PolicyErrorException (Json_deserializers.policy_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnauthorizedOperation" ->
          `UnauthorizedOperation (Json_deserializers.unauthorized_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : notify_application_state_request) =
    let input = Json_serializers.notify_application_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.NotifyApplicationState"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.notify_application_state_result_of_yojson
      ~error_deserializer
end

module NotifyMigrationTaskState = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `DryRunOperation _ -> "com.amazonaws.migrationhub#DryRunOperation"
    | `HomeRegionNotSetException _ -> "com.amazonaws.migrationhub#HomeRegionNotSetException"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.migrationhub#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | `UnauthorizedOperation _ -> "com.amazonaws.migrationhub#UnauthorizedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DryRunOperation" ->
          `DryRunOperation (Json_deserializers.dry_run_operation_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnauthorizedOperation" ->
          `UnauthorizedOperation (Json_deserializers.unauthorized_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : notify_migration_task_state_request) =
    let input = Json_serializers.notify_migration_task_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.NotifyMigrationTaskState"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.notify_migration_task_state_result_of_yojson
      ~error_deserializer
end

module PutResourceAttributes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.migrationhub#AccessDeniedException"
    | `DryRunOperation _ -> "com.amazonaws.migrationhub#DryRunOperation"
    | `HomeRegionNotSetException _ -> "com.amazonaws.migrationhub#HomeRegionNotSetException"
    | `InternalServerError _ -> "com.amazonaws.migrationhub#InternalServerError"
    | `InvalidInputException _ -> "com.amazonaws.migrationhub#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.migrationhub#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.migrationhub#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.migrationhub#ThrottlingException"
    | `UnauthorizedOperation _ -> "com.amazonaws.migrationhub#UnauthorizedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DryRunOperation" ->
          `DryRunOperation (Json_deserializers.dry_run_operation_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnauthorizedOperation" ->
          `UnauthorizedOperation (Json_deserializers.unauthorized_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_resource_attributes_request) =
    let input = Json_serializers.put_resource_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHub.PutResourceAttributes" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_resource_attributes_result_of_yojson
      ~error_deserializer
end
