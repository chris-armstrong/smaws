open Types
open Service_metadata
module AssociateCreatedArtifact =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "DryRunOperation") ->
              `DryRunOperation (dry_run_operation_of_yojson tree path)
          | (_, "HomeRegionNotSetException") ->
              `HomeRegionNotSetException
                (home_region_not_set_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "UnauthorizedOperation") ->
              `UnauthorizedOperation
                (unauthorized_operation_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : associate_created_artifact_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.associate_created_artifact_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubAssociateCreatedArtifact" ~service
            ~config:context.config ~input
            ~output_deserializer:associate_created_artifact_result_of_yojson
            ~error_deserializer
  end
module AssociateDiscoveredResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "DryRunOperation") ->
              `DryRunOperation (dry_run_operation_of_yojson tree path)
          | (_, "HomeRegionNotSetException") ->
              `HomeRegionNotSetException
                (home_region_not_set_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "PolicyErrorException") ->
              `PolicyErrorException
                (policy_error_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "UnauthorizedOperation") ->
              `UnauthorizedOperation
                (unauthorized_operation_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : associate_discovered_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.associate_discovered_resource_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubAssociateDiscoveredResource" ~service
            ~config:context.config ~input
            ~output_deserializer:associate_discovered_resource_result_of_yojson
            ~error_deserializer
  end
module AssociateSourceResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "DryRunOperation") ->
              `DryRunOperation (dry_run_operation_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "UnauthorizedOperation") ->
              `UnauthorizedOperation
                (unauthorized_operation_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : associate_source_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.associate_source_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubAssociateSourceResource" ~service
            ~config:context.config ~input
            ~output_deserializer:associate_source_resource_result_of_yojson
            ~error_deserializer
  end
module CreateProgressUpdateStream =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "DryRunOperation") ->
              `DryRunOperation (dry_run_operation_of_yojson tree path)
          | (_, "HomeRegionNotSetException") ->
              `HomeRegionNotSetException
                (home_region_not_set_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "UnauthorizedOperation") ->
              `UnauthorizedOperation
                (unauthorized_operation_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_progress_update_stream_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_progress_update_stream_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubCreateProgressUpdateStream" ~service
            ~config:context.config ~input
            ~output_deserializer:create_progress_update_stream_result_of_yojson
            ~error_deserializer
  end
module DeleteProgressUpdateStream =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "DryRunOperation") ->
              `DryRunOperation (dry_run_operation_of_yojson tree path)
          | (_, "HomeRegionNotSetException") ->
              `HomeRegionNotSetException
                (home_region_not_set_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "UnauthorizedOperation") ->
              `UnauthorizedOperation
                (unauthorized_operation_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_progress_update_stream_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_progress_update_stream_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubDeleteProgressUpdateStream" ~service
            ~config:context.config ~input
            ~output_deserializer:delete_progress_update_stream_result_of_yojson
            ~error_deserializer
  end
module DescribeApplicationState =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "HomeRegionNotSetException") ->
              `HomeRegionNotSetException
                (home_region_not_set_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "PolicyErrorException") ->
              `PolicyErrorException
                (policy_error_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_application_state_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_application_state_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubDescribeApplicationState" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_application_state_result_of_yojson
            ~error_deserializer
  end
module DescribeMigrationTask =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "HomeRegionNotSetException") ->
              `HomeRegionNotSetException
                (home_region_not_set_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_migration_task_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_migration_task_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubDescribeMigrationTask" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_migration_task_result_of_yojson
            ~error_deserializer
  end
module DisassociateCreatedArtifact =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "DryRunOperation") ->
              `DryRunOperation (dry_run_operation_of_yojson tree path)
          | (_, "HomeRegionNotSetException") ->
              `HomeRegionNotSetException
                (home_region_not_set_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "UnauthorizedOperation") ->
              `UnauthorizedOperation
                (unauthorized_operation_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : disassociate_created_artifact_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disassociate_created_artifact_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubDisassociateCreatedArtifact" ~service
            ~config:context.config ~input
            ~output_deserializer:disassociate_created_artifact_result_of_yojson
            ~error_deserializer
  end
module DisassociateDiscoveredResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "DryRunOperation") ->
              `DryRunOperation (dry_run_operation_of_yojson tree path)
          | (_, "HomeRegionNotSetException") ->
              `HomeRegionNotSetException
                (home_region_not_set_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "UnauthorizedOperation") ->
              `UnauthorizedOperation
                (unauthorized_operation_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : disassociate_discovered_resource_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disassociate_discovered_resource_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubDisassociateDiscoveredResource"
            ~service ~config:context.config ~input
            ~output_deserializer:disassociate_discovered_resource_result_of_yojson
            ~error_deserializer
  end
module DisassociateSourceResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "DryRunOperation") ->
              `DryRunOperation (dry_run_operation_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "UnauthorizedOperation") ->
              `UnauthorizedOperation
                (unauthorized_operation_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : disassociate_source_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disassociate_source_resource_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubDisassociateSourceResource" ~service
            ~config:context.config ~input
            ~output_deserializer:disassociate_source_resource_result_of_yojson
            ~error_deserializer
  end
module ImportMigrationTask =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "DryRunOperation") ->
              `DryRunOperation (dry_run_operation_of_yojson tree path)
          | (_, "HomeRegionNotSetException") ->
              `HomeRegionNotSetException
                (home_region_not_set_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "UnauthorizedOperation") ->
              `UnauthorizedOperation
                (unauthorized_operation_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : import_migration_task_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.import_migration_task_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubImportMigrationTask" ~service
            ~config:context.config ~input
            ~output_deserializer:import_migration_task_result_of_yojson
            ~error_deserializer
  end
module ListApplicationStates =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "HomeRegionNotSetException") ->
              `HomeRegionNotSetException
                (home_region_not_set_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_application_states_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_application_states_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubListApplicationStates" ~service
            ~config:context.config ~input
            ~output_deserializer:list_application_states_result_of_yojson
            ~error_deserializer
  end
module ListCreatedArtifacts =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "HomeRegionNotSetException") ->
              `HomeRegionNotSetException
                (home_region_not_set_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_created_artifacts_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_created_artifacts_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubListCreatedArtifacts" ~service
            ~config:context.config ~input
            ~output_deserializer:list_created_artifacts_result_of_yojson
            ~error_deserializer
  end
module ListDiscoveredResources =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "HomeRegionNotSetException") ->
              `HomeRegionNotSetException
                (home_region_not_set_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_discovered_resources_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_discovered_resources_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubListDiscoveredResources" ~service
            ~config:context.config ~input
            ~output_deserializer:list_discovered_resources_result_of_yojson
            ~error_deserializer
  end
module ListMigrationTaskUpdates =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_migration_task_updates_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_migration_task_updates_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubListMigrationTaskUpdates" ~service
            ~config:context.config ~input
            ~output_deserializer:list_migration_task_updates_result_of_yojson
            ~error_deserializer
  end
module ListMigrationTasks =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "HomeRegionNotSetException") ->
              `HomeRegionNotSetException
                (home_region_not_set_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "PolicyErrorException") ->
              `PolicyErrorException
                (policy_error_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_migration_tasks_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_migration_tasks_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubListMigrationTasks" ~service
            ~config:context.config ~input
            ~output_deserializer:list_migration_tasks_result_of_yojson
            ~error_deserializer
  end
module ListProgressUpdateStreams =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "HomeRegionNotSetException") ->
              `HomeRegionNotSetException
                (home_region_not_set_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_progress_update_streams_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_progress_update_streams_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubListProgressUpdateStreams" ~service
            ~config:context.config ~input
            ~output_deserializer:list_progress_update_streams_result_of_yojson
            ~error_deserializer
  end
module ListSourceResources =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_source_resources_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_source_resources_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubListSourceResources" ~service
            ~config:context.config ~input
            ~output_deserializer:list_source_resources_result_of_yojson
            ~error_deserializer
  end
module NotifyApplicationState =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "DryRunOperation") ->
              `DryRunOperation (dry_run_operation_of_yojson tree path)
          | (_, "HomeRegionNotSetException") ->
              `HomeRegionNotSetException
                (home_region_not_set_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "PolicyErrorException") ->
              `PolicyErrorException
                (policy_error_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "UnauthorizedOperation") ->
              `UnauthorizedOperation
                (unauthorized_operation_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : notify_application_state_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.notify_application_state_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubNotifyApplicationState" ~service
            ~config:context.config ~input
            ~output_deserializer:notify_application_state_result_of_yojson
            ~error_deserializer
  end
module NotifyMigrationTaskState =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "DryRunOperation") ->
              `DryRunOperation (dry_run_operation_of_yojson tree path)
          | (_, "HomeRegionNotSetException") ->
              `HomeRegionNotSetException
                (home_region_not_set_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "UnauthorizedOperation") ->
              `UnauthorizedOperation
                (unauthorized_operation_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : notify_migration_task_state_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.notify_migration_task_state_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubNotifyMigrationTaskState" ~service
            ~config:context.config ~input
            ~output_deserializer:notify_migration_task_state_result_of_yojson
            ~error_deserializer
  end
module PutResourceAttributes =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "DryRunOperation") ->
              `DryRunOperation (dry_run_operation_of_yojson tree path)
          | (_, "HomeRegionNotSetException") ->
              `HomeRegionNotSetException
                (home_region_not_set_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "UnauthorizedOperation") ->
              `UnauthorizedOperation
                (unauthorized_operation_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_resource_attributes_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_resource_attributes_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSMigrationHubPutResourceAttributes" ~service
            ~config:context.config ~input
            ~output_deserializer:put_resource_attributes_result_of_yojson
            ~error_deserializer
  end