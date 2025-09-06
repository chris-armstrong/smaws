open Types
open Service_metadata

module AssociateCreatedArtifact = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.associate_created_artifact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubAssociateCreatedArtifact"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.associate_created_artifact_result_of_yojson
      ~error_deserializer
end

module AssociateDiscoveredResource = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.associate_discovered_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubAssociateDiscoveredResource"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.associate_discovered_resource_result_of_yojson
      ~error_deserializer
end

module AssociateSourceResource = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.associate_source_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubAssociateSourceResource"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.associate_source_resource_result_of_yojson
      ~error_deserializer
end

module CreateProgressUpdateStream = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_progress_update_stream_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubCreateProgressUpdateStream"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_progress_update_stream_result_of_yojson
      ~error_deserializer
end

module DeleteProgressUpdateStream = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_progress_update_stream_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubDeleteProgressUpdateStream"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_progress_update_stream_result_of_yojson
      ~error_deserializer
end

module DescribeApplicationState = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_application_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubDescribeApplicationState"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_application_state_result_of_yojson
      ~error_deserializer
end

module DescribeMigrationTask = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_migration_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubDescribeMigrationTask" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_migration_task_result_of_yojson
      ~error_deserializer
end

module DisassociateCreatedArtifact = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.disassociate_created_artifact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubDisassociateCreatedArtifact"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.disassociate_created_artifact_result_of_yojson
      ~error_deserializer
end

module DisassociateDiscoveredResource = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.disassociate_discovered_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubDisassociateDiscoveredResource"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.disassociate_discovered_resource_result_of_yojson
      ~error_deserializer
end

module DisassociateSourceResource = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.disassociate_source_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubDisassociateSourceResource"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.disassociate_source_resource_result_of_yojson
      ~error_deserializer
end

module ImportMigrationTask = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.import_migration_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubImportMigrationTask" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.import_migration_task_result_of_yojson
      ~error_deserializer
end

module ListApplicationStates = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_application_states_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubListApplicationStates" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_application_states_result_of_yojson
      ~error_deserializer
end

module ListCreatedArtifacts = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_created_artifacts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubListCreatedArtifacts" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_created_artifacts_result_of_yojson
      ~error_deserializer
end

module ListDiscoveredResources = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_discovered_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubListDiscoveredResources"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_discovered_resources_result_of_yojson
      ~error_deserializer
end

module ListMigrationTaskUpdates = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_migration_task_updates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubListMigrationTaskUpdates"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_migration_task_updates_result_of_yojson
      ~error_deserializer
end

module ListMigrationTasks = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_migration_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubListMigrationTasks" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_migration_tasks_result_of_yojson
      ~error_deserializer
end

module ListProgressUpdateStreams = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_progress_update_streams_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubListProgressUpdateStreams"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_progress_update_streams_result_of_yojson
      ~error_deserializer
end

module ListSourceResources = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_source_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubListSourceResources" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_source_resources_result_of_yojson
      ~error_deserializer
end

module NotifyApplicationState = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.notify_application_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubNotifyApplicationState" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.notify_application_state_result_of_yojson
      ~error_deserializer
end

module NotifyMigrationTaskState = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.notify_migration_task_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubNotifyMigrationTaskState"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.notify_migration_task_state_result_of_yojson
      ~error_deserializer
end

module PutResourceAttributes = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.put_resource_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMigrationHubPutResourceAttributes" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.put_resource_attributes_result_of_yojson
      ~error_deserializer
end
