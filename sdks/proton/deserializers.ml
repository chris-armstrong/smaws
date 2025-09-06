open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "message" _list path } : validation_exception)

let resource_name_of_yojson = string_of_yojson
let base_unit_of_yojson = unit_of_yojson

let template_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "ENVIRONMENT" -> ENVIRONMENT
    | `String "SERVICE" -> SERVICE
    | `String value -> raise (deserialize_unknown_enum_value_error path "TemplateType" value)
    | _ -> raise (deserialize_wrong_type_error path "TemplateType")
     : template_type)
    : template_type)

let repository_provider_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "GITHUB" -> GITHUB
    | `String "GITHUB_ENTERPRISE" -> GITHUB_ENTERPRISE
    | `String "BITBUCKET" -> BITBUCKET
    | `String value -> raise (deserialize_unknown_enum_value_error path "RepositoryProvider" value)
    | _ -> raise (deserialize_wrong_type_error path "RepositoryProvider")
     : repository_provider)
    : repository_provider)

let repository_name_of_yojson = string_of_yojson
let git_branch_name_of_yojson = string_of_yojson
let subdirectory_of_yojson = string_of_yojson

let template_sync_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subdirectory =
       option_of_yojson (value_for_key subdirectory_of_yojson "subdirectory") _list path;
     branch = value_for_key git_branch_name_of_yojson "branch" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     repository_provider =
       value_for_key repository_provider_of_yojson "repositoryProvider" _list path;
     template_type = value_for_key template_type_of_yojson "templateType" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
   }
    : template_sync_config)

let update_template_sync_config_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template_sync_config =
       option_of_yojson
         (value_for_key template_sync_config_of_yojson "templateSyncConfig")
         _list path;
   }
    : update_template_sync_config_output)

let update_template_sync_config_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subdirectory =
       option_of_yojson (value_for_key subdirectory_of_yojson "subdirectory") _list path;
     branch = value_for_key git_branch_name_of_yojson "branch" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     repository_provider =
       value_for_key repository_provider_of_yojson "repositoryProvider" _list path;
     template_type = value_for_key template_type_of_yojson "templateType" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
   }
    : update_template_sync_config_input)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "message" _list path } : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "message" _list path }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "message" _list path }
    : internal_server_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "message" _list path } : conflict_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "message" _list path }
    : access_denied_exception)

let template_version_part_of_yojson = string_of_yojson

let template_version_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "REGISTRATION_IN_PROGRESS" -> REGISTRATION_IN_PROGRESS
    | `String "REGISTRATION_FAILED" -> REGISTRATION_FAILED
    | `String "DRAFT" -> DRAFT
    | `String "PUBLISHED" -> PUBLISHED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TemplateVersionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TemplateVersionStatus")
     : template_version_status)
    : template_version_status)

let status_message_of_yojson = string_of_yojson
let description_of_yojson = string_of_yojson
let service_template_version_arn_of_yojson = string_of_yojson
let base_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let compatible_environment_template_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     major_version = value_for_key template_version_part_of_yojson "majorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
   }
    : compatible_environment_template)

let compatible_environment_template_list_of_yojson tree path =
  list_of_yojson compatible_environment_template_of_yojson tree path

let template_schema_of_yojson = string_of_yojson

let service_template_supported_component_source_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DIRECTLY_DEFINED" -> DIRECTLY_DEFINED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ServiceTemplateSupportedComponentSourceType"
             value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceTemplateSupportedComponentSourceType")
     : service_template_supported_component_source_type)
    : service_template_supported_component_source_type)

let service_template_supported_component_source_input_list_of_yojson tree path =
  list_of_yojson service_template_supported_component_source_type_of_yojson tree path

let service_template_version_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     supported_component_sources =
       option_of_yojson
         (value_for_key service_template_supported_component_source_input_list_of_yojson
            "supportedComponentSources")
         _list path;
     schema = option_of_yojson (value_for_key template_schema_of_yojson "schema") _list path;
     compatible_environment_templates =
       value_for_key compatible_environment_template_list_of_yojson "compatibleEnvironmentTemplates"
         _list path;
     last_modified_at = value_for_key base_timestamp_of_yojson "lastModifiedAt" _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     arn = value_for_key service_template_version_arn_of_yojson "arn" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "statusMessage") _list path;
     status = value_for_key template_version_status_of_yojson "status" _list path;
     recommended_minor_version =
       option_of_yojson
         (value_for_key template_version_part_of_yojson "recommendedMinorVersion")
         _list path;
     minor_version = value_for_key template_version_part_of_yojson "minorVersion" _list path;
     major_version = value_for_key template_version_part_of_yojson "majorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
   }
    : service_template_version)

let update_service_template_version_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_template_version =
       value_for_key service_template_version_of_yojson "serviceTemplateVersion" _list path;
   }
    : update_service_template_version_output)

let compatible_environment_template_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     major_version = value_for_key template_version_part_of_yojson "majorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
   }
    : compatible_environment_template_input)

let compatible_environment_template_input_list_of_yojson tree path =
  list_of_yojson compatible_environment_template_input_of_yojson tree path

let update_service_template_version_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     supported_component_sources =
       option_of_yojson
         (value_for_key service_template_supported_component_source_input_list_of_yojson
            "supportedComponentSources")
         _list path;
     compatible_environment_templates =
       option_of_yojson
         (value_for_key compatible_environment_template_input_list_of_yojson
            "compatibleEnvironmentTemplates")
         _list path;
     status = option_of_yojson (value_for_key template_version_status_of_yojson "status") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     minor_version = value_for_key template_version_part_of_yojson "minorVersion" _list path;
     major_version = value_for_key template_version_part_of_yojson "majorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
   }
    : update_service_template_version_input)

let service_template_arn_of_yojson = string_of_yojson
let display_name_of_yojson = string_of_yojson
let full_template_version_number_of_yojson = string_of_yojson
let arn_of_yojson = string_of_yojson

let provisioning_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CUSTOMER_MANAGED" -> CUSTOMER_MANAGED
    | `String value -> raise (deserialize_unknown_enum_value_error path "Provisioning" value)
    | _ -> raise (deserialize_wrong_type_error path "Provisioning")
     : provisioning)
    : provisioning)

let service_template_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_provisioning =
       option_of_yojson (value_for_key provisioning_of_yojson "pipelineProvisioning") _list path;
     encryption_key = option_of_yojson (value_for_key arn_of_yojson "encryptionKey") _list path;
     recommended_version =
       option_of_yojson
         (value_for_key full_template_version_number_of_yojson "recommendedVersion")
         _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "displayName") _list path;
     last_modified_at = value_for_key base_timestamp_of_yojson "lastModifiedAt" _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     arn = value_for_key service_template_arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : service_template)

let update_service_template_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_template = value_for_key service_template_of_yojson "serviceTemplate" _list path }
    : update_service_template_output)

let update_service_template_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "displayName") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : update_service_template_input)

let ops_file_path_of_yojson = string_of_yojson

let service_sync_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_path = value_for_key ops_file_path_of_yojson "filePath" _list path;
     branch = value_for_key git_branch_name_of_yojson "branch" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     repository_provider =
       value_for_key repository_provider_of_yojson "repositoryProvider" _list path;
     service_name = value_for_key resource_name_of_yojson "serviceName" _list path;
   }
    : service_sync_config)

let update_service_sync_config_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_sync_config =
       option_of_yojson (value_for_key service_sync_config_of_yojson "serviceSyncConfig") _list path;
   }
    : update_service_sync_config_output)

let update_service_sync_config_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_path = value_for_key ops_file_path_of_yojson "filePath" _list path;
     branch = value_for_key git_branch_name_of_yojson "branch" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     repository_provider =
       value_for_key repository_provider_of_yojson "repositoryProvider" _list path;
     service_name = value_for_key resource_name_of_yojson "serviceName" _list path;
   }
    : update_service_sync_config_input)

let base_string_of_yojson = string_of_yojson

let blocker_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "AUTOMATED" -> AUTOMATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "BlockerType" value)
    | _ -> raise (deserialize_wrong_type_error path "BlockerType")
     : blocker_type)
    : blocker_type)

let blocker_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "RESOLVED" -> RESOLVED
    | `String value -> raise (deserialize_unknown_enum_value_error path "BlockerStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "BlockerStatus")
     : blocker_status)
    : blocker_status)

let sync_blocker_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key base_string_of_yojson "value" _list path;
     key = value_for_key base_string_of_yojson "key" _list path;
   }
    : sync_blocker_context)

let sync_blocker_contexts_of_yojson tree path =
  list_of_yojson sync_blocker_context_of_yojson tree path

let sync_blocker_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolved_at = option_of_yojson (value_for_key base_timestamp_of_yojson "resolvedAt") _list path;
     resolved_reason =
       option_of_yojson (value_for_key base_string_of_yojson "resolvedReason") _list path;
     contexts =
       option_of_yojson (value_for_key sync_blocker_contexts_of_yojson "contexts") _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     created_reason = value_for_key base_string_of_yojson "createdReason" _list path;
     status = value_for_key blocker_status_of_yojson "status" _list path;
     type_ = value_for_key blocker_type_of_yojson "type" _list path;
     id = value_for_key base_string_of_yojson "id" _list path;
   }
    : sync_blocker)

let update_service_sync_blocker_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_sync_blocker = value_for_key sync_blocker_of_yojson "serviceSyncBlocker" _list path;
     service_instance_name =
       option_of_yojson (value_for_key resource_name_of_yojson "serviceInstanceName") _list path;
     service_name = value_for_key resource_name_of_yojson "serviceName" _list path;
   }
    : update_service_sync_blocker_output)

let update_service_sync_blocker_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolved_reason = value_for_key base_string_of_yojson "resolvedReason" _list path;
     id = value_for_key base_string_of_yojson "id" _list path;
   }
    : update_service_sync_blocker_input)

let deployment_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "DELETE_COMPLETE" -> DELETE_COMPLETE
    | `String "CANCELLING" -> CANCELLING
    | `String "CANCELLED" -> CANCELLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeploymentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentStatus")
     : deployment_status)
    : deployment_status)

let spec_contents_of_yojson = string_of_yojson
let deployment_id_of_yojson = string_of_yojson

let service_pipeline_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_succeeded_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastSucceededDeploymentId")
         _list path;
     last_attempted_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastAttemptedDeploymentId")
         _list path;
     spec = option_of_yojson (value_for_key spec_contents_of_yojson "spec") _list path;
     deployment_status_message =
       option_of_yojson
         (value_for_key status_message_of_yojson "deploymentStatusMessage")
         _list path;
     deployment_status = value_for_key deployment_status_of_yojson "deploymentStatus" _list path;
     template_minor_version =
       value_for_key template_version_part_of_yojson "templateMinorVersion" _list path;
     template_major_version =
       value_for_key template_version_part_of_yojson "templateMajorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
     last_deployment_succeeded_at =
       value_for_key base_timestamp_of_yojson "lastDeploymentSucceededAt" _list path;
     last_deployment_attempted_at =
       value_for_key base_timestamp_of_yojson "lastDeploymentAttemptedAt" _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : service_pipeline)

let update_service_pipeline_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pipeline = value_for_key service_pipeline_of_yojson "pipeline" _list path }
    : update_service_pipeline_output)

let deployment_update_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "NONE" -> NONE
    | `String "CURRENT_VERSION" -> CURRENT_VERSION
    | `String "MINOR_VERSION" -> MINOR_VERSION
    | `String "MAJOR_VERSION" -> MAJOR_VERSION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeploymentUpdateType" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentUpdateType")
     : deployment_update_type)
    : deployment_update_type)

let update_service_pipeline_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template_minor_version =
       option_of_yojson
         (value_for_key template_version_part_of_yojson "templateMinorVersion")
         _list path;
     template_major_version =
       option_of_yojson
         (value_for_key template_version_part_of_yojson "templateMajorVersion")
         _list path;
     deployment_type = value_for_key deployment_update_type_of_yojson "deploymentType" _list path;
     spec = value_for_key spec_contents_of_yojson "spec" _list path;
     service_name = value_for_key resource_name_of_yojson "serviceName" _list path;
   }
    : update_service_pipeline_input)

let service_arn_of_yojson = string_of_yojson

let service_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String "CREATE_FAILED_CLEANUP_IN_PROGRESS" -> CREATE_FAILED_CLEANUP_IN_PROGRESS
    | `String "CREATE_FAILED_CLEANUP_COMPLETE" -> CREATE_FAILED_CLEANUP_COMPLETE
    | `String "CREATE_FAILED_CLEANUP_FAILED" -> CREATE_FAILED_CLEANUP_FAILED
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
    | `String "UPDATE_FAILED_CLEANUP_IN_PROGRESS" -> UPDATE_FAILED_CLEANUP_IN_PROGRESS
    | `String "UPDATE_FAILED_CLEANUP_COMPLETE" -> UPDATE_FAILED_CLEANUP_COMPLETE
    | `String "UPDATE_FAILED_CLEANUP_FAILED" -> UPDATE_FAILED_CLEANUP_FAILED
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "UPDATE_COMPLETE_CLEANUP_FAILED" -> UPDATE_COMPLETE_CLEANUP_FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ServiceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceStatus")
     : service_status)
    : service_status)

let repository_id_of_yojson = string_of_yojson

let service_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     branch_name =
       option_of_yojson (value_for_key git_branch_name_of_yojson "branchName") _list path;
     repository_id =
       option_of_yojson (value_for_key repository_id_of_yojson "repositoryId") _list path;
     repository_connection_arn =
       option_of_yojson (value_for_key arn_of_yojson "repositoryConnectionArn") _list path;
     pipeline = option_of_yojson (value_for_key service_pipeline_of_yojson "pipeline") _list path;
     spec = value_for_key spec_contents_of_yojson "spec" _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "statusMessage") _list path;
     status = value_for_key service_status_of_yojson "status" _list path;
     last_modified_at = value_for_key base_timestamp_of_yojson "lastModifiedAt" _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
     arn = value_for_key service_arn_of_yojson "arn" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : service)

let update_service_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service = value_for_key service_of_yojson "service" _list path } : update_service_output)

let service_instance_arn_of_yojson = string_of_yojson

let service_instance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_succeeded_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastSucceededDeploymentId")
         _list path;
     last_attempted_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastAttemptedDeploymentId")
         _list path;
     last_client_request_token =
       option_of_yojson (value_for_key base_string_of_yojson "lastClientRequestToken") _list path;
     spec = option_of_yojson (value_for_key spec_contents_of_yojson "spec") _list path;
     deployment_status_message =
       option_of_yojson
         (value_for_key status_message_of_yojson "deploymentStatusMessage")
         _list path;
     deployment_status = value_for_key deployment_status_of_yojson "deploymentStatus" _list path;
     template_minor_version =
       value_for_key template_version_part_of_yojson "templateMinorVersion" _list path;
     template_major_version =
       value_for_key template_version_part_of_yojson "templateMajorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
     environment_name = value_for_key resource_name_of_yojson "environmentName" _list path;
     service_name = value_for_key resource_name_of_yojson "serviceName" _list path;
     last_deployment_succeeded_at =
       value_for_key base_timestamp_of_yojson "lastDeploymentSucceededAt" _list path;
     last_deployment_attempted_at =
       value_for_key base_timestamp_of_yojson "lastDeploymentAttemptedAt" _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     arn = value_for_key service_instance_arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : service_instance)

let update_service_instance_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_instance = value_for_key service_instance_of_yojson "serviceInstance" _list path }
    : update_service_instance_output)

let client_token_of_yojson = string_of_yojson

let update_service_instance_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     template_minor_version =
       option_of_yojson
         (value_for_key template_version_part_of_yojson "templateMinorVersion")
         _list path;
     template_major_version =
       option_of_yojson
         (value_for_key template_version_part_of_yojson "templateMajorVersion")
         _list path;
     spec = option_of_yojson (value_for_key spec_contents_of_yojson "spec") _list path;
     deployment_type = value_for_key deployment_update_type_of_yojson "deploymentType" _list path;
     service_name = value_for_key resource_name_of_yojson "serviceName" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : update_service_instance_input)

let update_service_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     spec = option_of_yojson (value_for_key spec_contents_of_yojson "spec") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : update_service_input)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "message" _list path }
    : service_quota_exceeded_exception)

let environment_template_version_arn_of_yojson = string_of_yojson

let environment_template_version_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema = option_of_yojson (value_for_key template_schema_of_yojson "schema") _list path;
     last_modified_at = value_for_key base_timestamp_of_yojson "lastModifiedAt" _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     arn = value_for_key environment_template_version_arn_of_yojson "arn" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "statusMessage") _list path;
     status = value_for_key template_version_status_of_yojson "status" _list path;
     recommended_minor_version =
       option_of_yojson
         (value_for_key template_version_part_of_yojson "recommendedMinorVersion")
         _list path;
     minor_version = value_for_key template_version_part_of_yojson "minorVersion" _list path;
     major_version = value_for_key template_version_part_of_yojson "majorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
   }
    : environment_template_version)

let update_environment_template_version_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_template_version =
       value_for_key environment_template_version_of_yojson "environmentTemplateVersion" _list path;
   }
    : update_environment_template_version_output)

let update_environment_template_version_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key template_version_status_of_yojson "status") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     minor_version = value_for_key template_version_part_of_yojson "minorVersion" _list path;
     major_version = value_for_key template_version_part_of_yojson "majorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
   }
    : update_environment_template_version_input)

let environment_template_arn_of_yojson = string_of_yojson

let environment_template_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioning =
       option_of_yojson (value_for_key provisioning_of_yojson "provisioning") _list path;
     encryption_key = option_of_yojson (value_for_key arn_of_yojson "encryptionKey") _list path;
     recommended_version =
       option_of_yojson
         (value_for_key full_template_version_number_of_yojson "recommendedVersion")
         _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "displayName") _list path;
     last_modified_at = value_for_key base_timestamp_of_yojson "lastModifiedAt" _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     arn = value_for_key environment_template_arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : environment_template)

let update_environment_template_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_template =
       value_for_key environment_template_of_yojson "environmentTemplate" _list path;
   }
    : update_environment_template_output)

let update_environment_template_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "displayName") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : update_environment_template_input)

let environment_arn_of_yojson = string_of_yojson
let environment_account_connection_id_of_yojson = string_of_yojson
let aws_account_id_of_yojson = string_of_yojson
let repository_arn_of_yojson = string_of_yojson

let repository_branch_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     branch = value_for_key git_branch_name_of_yojson "branch" _list path;
     name = value_for_key repository_name_of_yojson "name" _list path;
     provider = value_for_key repository_provider_of_yojson "provider" _list path;
     arn = value_for_key repository_arn_of_yojson "arn" _list path;
   }
    : repository_branch)

let role_arn_of_yojson = string_of_yojson

let environment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_succeeded_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastSucceededDeploymentId")
         _list path;
     last_attempted_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastAttemptedDeploymentId")
         _list path;
     codebuild_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "codebuildRoleArn") _list path;
     component_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "componentRoleArn") _list path;
     provisioning_repository =
       option_of_yojson
         (value_for_key repository_branch_of_yojson "provisioningRepository")
         _list path;
     provisioning =
       option_of_yojson (value_for_key provisioning_of_yojson "provisioning") _list path;
     spec = option_of_yojson (value_for_key spec_contents_of_yojson "spec") _list path;
     environment_account_id =
       option_of_yojson (value_for_key aws_account_id_of_yojson "environmentAccountId") _list path;
     environment_account_connection_id =
       option_of_yojson
         (value_for_key environment_account_connection_id_of_yojson "environmentAccountConnectionId")
         _list path;
     proton_service_role_arn =
       option_of_yojson (value_for_key arn_of_yojson "protonServiceRoleArn") _list path;
     deployment_status_message =
       option_of_yojson
         (value_for_key status_message_of_yojson "deploymentStatusMessage")
         _list path;
     deployment_status = value_for_key deployment_status_of_yojson "deploymentStatus" _list path;
     template_minor_version =
       value_for_key template_version_part_of_yojson "templateMinorVersion" _list path;
     template_major_version =
       value_for_key template_version_part_of_yojson "templateMajorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
     arn = value_for_key environment_arn_of_yojson "arn" _list path;
     last_deployment_succeeded_at =
       value_for_key base_timestamp_of_yojson "lastDeploymentSucceededAt" _list path;
     last_deployment_attempted_at =
       value_for_key base_timestamp_of_yojson "lastDeploymentAttemptedAt" _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : environment)

let update_environment_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ environment = value_for_key environment_of_yojson "environment" _list path }
    : update_environment_output)

let repository_branch_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     branch = value_for_key git_branch_name_of_yojson "branch" _list path;
     name = value_for_key repository_name_of_yojson "name" _list path;
     provider = value_for_key repository_provider_of_yojson "provider" _list path;
   }
    : repository_branch_input)

let update_environment_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     codebuild_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "codebuildRoleArn") _list path;
     component_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "componentRoleArn") _list path;
     provisioning_repository =
       option_of_yojson
         (value_for_key repository_branch_input_of_yojson "provisioningRepository")
         _list path;
     environment_account_connection_id =
       option_of_yojson
         (value_for_key environment_account_connection_id_of_yojson "environmentAccountConnectionId")
         _list path;
     deployment_type = value_for_key deployment_update_type_of_yojson "deploymentType" _list path;
     proton_service_role_arn =
       option_of_yojson (value_for_key arn_of_yojson "protonServiceRoleArn") _list path;
     template_minor_version =
       option_of_yojson
         (value_for_key template_version_part_of_yojson "templateMinorVersion")
         _list path;
     template_major_version =
       option_of_yojson
         (value_for_key template_version_part_of_yojson "templateMajorVersion")
         _list path;
     spec = option_of_yojson (value_for_key spec_contents_of_yojson "spec") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : update_environment_input)

let environment_account_connection_arn_of_yojson = string_of_yojson

let environment_account_connection_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "PENDING" -> PENDING
    | `String "CONNECTED" -> CONNECTED
    | `String "REJECTED" -> REJECTED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EnvironmentAccountConnectionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "EnvironmentAccountConnectionStatus")
     : environment_account_connection_status)
    : environment_account_connection_status)

let environment_account_connection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     codebuild_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "codebuildRoleArn") _list path;
     component_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "componentRoleArn") _list path;
     status = value_for_key environment_account_connection_status_of_yojson "status" _list path;
     last_modified_at = value_for_key base_timestamp_of_yojson "lastModifiedAt" _list path;
     requested_at = value_for_key base_timestamp_of_yojson "requestedAt" _list path;
     environment_name = value_for_key resource_name_of_yojson "environmentName" _list path;
     role_arn = value_for_key arn_of_yojson "roleArn" _list path;
     environment_account_id =
       value_for_key aws_account_id_of_yojson "environmentAccountId" _list path;
     management_account_id = value_for_key aws_account_id_of_yojson "managementAccountId" _list path;
     arn = value_for_key environment_account_connection_arn_of_yojson "arn" _list path;
     id = value_for_key environment_account_connection_id_of_yojson "id" _list path;
   }
    : environment_account_connection)

let update_environment_account_connection_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_account_connection =
       value_for_key environment_account_connection_of_yojson "environmentAccountConnection" _list
         path;
   }
    : update_environment_account_connection_output)

let update_environment_account_connection_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     codebuild_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "codebuildRoleArn") _list path;
     component_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "componentRoleArn") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "roleArn") _list path;
     id = value_for_key environment_account_connection_id_of_yojson "id" _list path;
   }
    : update_environment_account_connection_input)

let component_arn_of_yojson = string_of_yojson

let component_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_succeeded_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastSucceededDeploymentId")
         _list path;
     last_attempted_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastAttemptedDeploymentId")
         _list path;
     last_client_request_token =
       option_of_yojson (value_for_key base_string_of_yojson "lastClientRequestToken") _list path;
     service_spec =
       option_of_yojson (value_for_key spec_contents_of_yojson "serviceSpec") _list path;
     deployment_status_message =
       option_of_yojson
         (value_for_key status_message_of_yojson "deploymentStatusMessage")
         _list path;
     deployment_status = value_for_key deployment_status_of_yojson "deploymentStatus" _list path;
     last_deployment_succeeded_at =
       option_of_yojson
         (value_for_key base_timestamp_of_yojson "lastDeploymentSucceededAt")
         _list path;
     last_deployment_attempted_at =
       option_of_yojson
         (value_for_key base_timestamp_of_yojson "lastDeploymentAttemptedAt")
         _list path;
     last_modified_at = value_for_key base_timestamp_of_yojson "lastModifiedAt" _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     service_instance_name =
       option_of_yojson (value_for_key resource_name_of_yojson "serviceInstanceName") _list path;
     service_name =
       option_of_yojson (value_for_key resource_name_of_yojson "serviceName") _list path;
     environment_name = value_for_key resource_name_of_yojson "environmentName" _list path;
     arn = value_for_key component_arn_of_yojson "arn" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : component)

let update_component_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ component = value_for_key component_of_yojson "component" _list path }
    : update_component_output)

let component_deployment_update_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "NONE" -> NONE
    | `String "CURRENT_VERSION" -> CURRENT_VERSION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ComponentDeploymentUpdateType" value)
    | _ -> raise (deserialize_wrong_type_error path "ComponentDeploymentUpdateType")
     : component_deployment_update_type)
    : component_deployment_update_type)

let resource_name_or_empty_of_yojson = string_of_yojson
let template_file_contents_of_yojson = string_of_yojson

let update_component_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     template_file =
       option_of_yojson (value_for_key template_file_contents_of_yojson "templateFile") _list path;
     service_spec =
       option_of_yojson (value_for_key spec_contents_of_yojson "serviceSpec") _list path;
     service_instance_name =
       option_of_yojson
         (value_for_key resource_name_or_empty_of_yojson "serviceInstanceName")
         _list path;
     service_name =
       option_of_yojson (value_for_key resource_name_or_empty_of_yojson "serviceName") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     deployment_type =
       value_for_key component_deployment_update_type_of_yojson "deploymentType" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : update_component_input)

let role_arn_or_empty_string_of_yojson = string_of_yojson

let account_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_codebuild_role_arn =
       option_of_yojson
         (value_for_key role_arn_or_empty_string_of_yojson "pipelineCodebuildRoleArn")
         _list path;
     pipeline_provisioning_repository =
       option_of_yojson
         (value_for_key repository_branch_of_yojson "pipelineProvisioningRepository")
         _list path;
     pipeline_service_role_arn =
       option_of_yojson
         (value_for_key role_arn_or_empty_string_of_yojson "pipelineServiceRoleArn")
         _list path;
   }
    : account_settings)

let update_account_settings_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ account_settings = value_for_key account_settings_of_yojson "accountSettings" _list path }
    : update_account_settings_output)

let base_boolean_of_yojson = bool_of_yojson

let update_account_settings_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_codebuild_role_arn =
       option_of_yojson
         (value_for_key role_arn_or_empty_string_of_yojson "pipelineCodebuildRoleArn")
         _list path;
     delete_pipeline_provisioning_repository =
       option_of_yojson
         (value_for_key base_boolean_of_yojson "deletePipelineProvisioningRepository")
         _list path;
     pipeline_provisioning_repository =
       option_of_yojson
         (value_for_key repository_branch_input_of_yojson "pipelineProvisioningRepository")
         _list path;
     pipeline_service_role_arn =
       option_of_yojson
         (value_for_key role_arn_or_empty_string_of_yojson "pipelineServiceRoleArn")
         _list path;
   }
    : update_account_settings_input)

let untag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "tagKeys" _list path;
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
   }
    : untag_resource_input)

let s3_bucket_of_yojson = string_of_yojson
let s3_key_of_yojson = string_of_yojson

let s3_object_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key s3_key_of_yojson "key" _list path;
     bucket = value_for_key s3_bucket_of_yojson "bucket" _list path;
   }
    : s3_object_source)

let template_version_source_input_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "s3" -> S3 (s3_object_source_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "TemplateVersionSourceInput" unknown)
    : template_version_source_input)

let template_manifest_contents_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson

let tag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "value" _list path;
     key = value_for_key tag_key_of_yojson "key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "tags" _list path;
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
   }
    : tag_resource_input)

let sync_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "TEMPLATE_SYNC" -> TEMPLATE_SYNC
    | `String "SERVICE_SYNC" -> SERVICE_SYNC
    | `String value -> raise (deserialize_unknown_enum_value_error path "SyncType" value)
    | _ -> raise (deserialize_wrong_type_error path "SyncType")
     : sync_type)
    : sync_type)

let sort_order_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "ASCENDING" -> ASCENDING
    | `String "DESCENDING" -> DESCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")
     : sort_order)
    : sort_order)

let service_template_version_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_at = value_for_key base_timestamp_of_yojson "lastModifiedAt" _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     arn = value_for_key service_template_version_arn_of_yojson "arn" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "statusMessage") _list path;
     status = value_for_key template_version_status_of_yojson "status" _list path;
     recommended_minor_version =
       option_of_yojson
         (value_for_key template_version_part_of_yojson "recommendedMinorVersion")
         _list path;
     minor_version = value_for_key template_version_part_of_yojson "minorVersion" _list path;
     major_version = value_for_key template_version_part_of_yojson "majorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
   }
    : service_template_version_summary)

let service_template_version_summary_list_of_yojson tree path =
  list_of_yojson service_template_version_summary_of_yojson tree path

let service_template_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_provisioning =
       option_of_yojson (value_for_key provisioning_of_yojson "pipelineProvisioning") _list path;
     recommended_version =
       option_of_yojson
         (value_for_key full_template_version_number_of_yojson "recommendedVersion")
         _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "displayName") _list path;
     last_modified_at = value_for_key base_timestamp_of_yojson "lastModifiedAt" _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     arn = value_for_key service_template_arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : service_template_summary)

let service_template_summary_list_of_yojson tree path =
  list_of_yojson service_template_summary_of_yojson tree path

let latest_sync_blockers_of_yojson tree path = list_of_yojson sync_blocker_of_yojson tree path

let service_sync_blocker_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     latest_blockers =
       option_of_yojson (value_for_key latest_sync_blockers_of_yojson "latestBlockers") _list path;
     service_instance_name =
       option_of_yojson (value_for_key base_string_of_yojson "serviceInstanceName") _list path;
     service_name = value_for_key base_string_of_yojson "serviceName" _list path;
   }
    : service_sync_blocker_summary)

let service_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "statusMessage") _list path;
     status = value_for_key service_status_of_yojson "status" _list path;
     last_modified_at = value_for_key base_timestamp_of_yojson "lastModifiedAt" _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
     arn = value_for_key service_arn_of_yojson "arn" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : service_summary)

let service_summary_list_of_yojson tree path = list_of_yojson service_summary_of_yojson tree path

let service_pipeline_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template_minor_version =
       value_for_key template_version_part_of_yojson "templateMinorVersion" _list path;
     template_major_version =
       value_for_key template_version_part_of_yojson "templateMajorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
     spec = option_of_yojson (value_for_key spec_contents_of_yojson "spec") _list path;
   }
    : service_pipeline_state)

let service_instance_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_succeeded_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastSucceededDeploymentId")
         _list path;
     last_attempted_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastAttemptedDeploymentId")
         _list path;
     deployment_status_message =
       option_of_yojson
         (value_for_key status_message_of_yojson "deploymentStatusMessage")
         _list path;
     deployment_status = value_for_key deployment_status_of_yojson "deploymentStatus" _list path;
     template_minor_version =
       value_for_key template_version_part_of_yojson "templateMinorVersion" _list path;
     template_major_version =
       value_for_key template_version_part_of_yojson "templateMajorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
     environment_name = value_for_key resource_name_of_yojson "environmentName" _list path;
     service_name = value_for_key resource_name_of_yojson "serviceName" _list path;
     last_deployment_succeeded_at =
       value_for_key base_timestamp_of_yojson "lastDeploymentSucceededAt" _list path;
     last_deployment_attempted_at =
       value_for_key base_timestamp_of_yojson "lastDeploymentAttemptedAt" _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     arn = value_for_key service_instance_arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : service_instance_summary)

let service_instance_summary_list_of_yojson tree path =
  list_of_yojson service_instance_summary_of_yojson tree path

let component_deployment_id_list_of_yojson tree path =
  list_of_yojson deployment_id_of_yojson tree path

let service_instance_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_successful_service_pipeline_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastSuccessfulServicePipelineDeploymentId")
         _list path;
     last_successful_environment_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastSuccessfulEnvironmentDeploymentId")
         _list path;
     last_successful_component_deployment_ids =
       option_of_yojson
         (value_for_key component_deployment_id_list_of_yojson
            "lastSuccessfulComponentDeploymentIds")
         _list path;
     template_minor_version =
       value_for_key template_version_part_of_yojson "templateMinorVersion" _list path;
     template_major_version =
       value_for_key template_version_part_of_yojson "templateMajorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
     spec = value_for_key spec_contents_of_yojson "spec" _list path;
   }
    : service_instance_state)

let sh_a_of_yojson = string_of_yojson

let revision_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     branch = value_for_key git_branch_name_of_yojson "branch" _list path;
     directory = value_for_key base_string_of_yojson "directory" _list path;
     sha = value_for_key sh_a_of_yojson "sha" _list path;
     repository_provider =
       value_for_key repository_provider_of_yojson "repositoryProvider" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
   }
    : revision)

let resource_sync_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "INITIATED" -> INITIATED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceSyncStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceSyncStatus")
     : resource_sync_status)
    : resource_sync_status)

let resource_sync_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event = value_for_key base_string_of_yojson "event" _list path;
     time = value_for_key base_timestamp_of_yojson "time" _list path;
     external_id = option_of_yojson (value_for_key base_string_of_yojson "externalId") _list path;
     type_ = value_for_key base_string_of_yojson "type" _list path;
   }
    : resource_sync_event)

let resource_sync_events_of_yojson tree path =
  list_of_yojson resource_sync_event_of_yojson tree path

let resource_sync_attempt_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     events = value_for_key resource_sync_events_of_yojson "events" _list path;
     status = value_for_key resource_sync_status_of_yojson "status" _list path;
     started_at = value_for_key base_timestamp_of_yojson "startedAt" _list path;
     target = value_for_key base_string_of_yojson "target" _list path;
     target_revision = value_for_key revision_of_yojson "targetRevision" _list path;
     initial_revision = value_for_key revision_of_yojson "initialRevision" _list path;
   }
    : resource_sync_attempt)

let resource_deployment_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResourceDeploymentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceDeploymentStatus")
     : resource_deployment_status)
    : resource_deployment_status)

let base_integer_of_yojson = int_of_yojson

let resource_counts_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     behind_minor = option_of_yojson (value_for_key base_integer_of_yojson "behindMinor") _list path;
     behind_major = option_of_yojson (value_for_key base_integer_of_yojson "behindMajor") _list path;
     up_to_date = option_of_yojson (value_for_key base_integer_of_yojson "upToDate") _list path;
     failed = option_of_yojson (value_for_key base_integer_of_yojson "failed") _list path;
     total = value_for_key base_integer_of_yojson "total" _list path;
   }
    : resource_counts_summary)

let repository_sync_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "INITIATED" -> INITIATED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String "QUEUED" -> QUEUED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RepositorySyncStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RepositorySyncStatus")
     : repository_sync_status)
    : repository_sync_status)

let repository_sync_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event = value_for_key base_string_of_yojson "event" _list path;
     time = value_for_key base_timestamp_of_yojson "time" _list path;
     external_id = option_of_yojson (value_for_key base_string_of_yojson "externalId") _list path;
     type_ = value_for_key base_string_of_yojson "type" _list path;
   }
    : repository_sync_event)

let repository_sync_events_of_yojson tree path =
  list_of_yojson repository_sync_event_of_yojson tree path

let repository_sync_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory = value_for_key base_string_of_yojson "directory" _list path;
     branch = value_for_key git_branch_name_of_yojson "branch" _list path;
     parent = value_for_key base_string_of_yojson "parent" _list path;
     target = value_for_key base_string_of_yojson "target" _list path;
   }
    : repository_sync_definition)

let repository_sync_definition_list_of_yojson tree path =
  list_of_yojson repository_sync_definition_of_yojson tree path

let repository_sync_attempt_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     events = value_for_key repository_sync_events_of_yojson "events" _list path;
     status = value_for_key repository_sync_status_of_yojson "status" _list path;
     started_at = value_for_key base_timestamp_of_yojson "startedAt" _list path;
   }
    : repository_sync_attempt)

let repository_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_arn = value_for_key arn_of_yojson "connectionArn" _list path;
     name = value_for_key repository_name_of_yojson "name" _list path;
     provider = value_for_key repository_provider_of_yojson "provider" _list path;
     arn = value_for_key repository_arn_of_yojson "arn" _list path;
   }
    : repository_summary)

let repository_summary_list_of_yojson tree path =
  list_of_yojson repository_summary_of_yojson tree path

let repository_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_key = option_of_yojson (value_for_key arn_of_yojson "encryptionKey") _list path;
     connection_arn = value_for_key arn_of_yojson "connectionArn" _list path;
     name = value_for_key repository_name_of_yojson "name" _list path;
     provider = value_for_key repository_provider_of_yojson "provider" _list path;
     arn = value_for_key repository_arn_of_yojson "arn" _list path;
   }
    : repository)

let reject_environment_account_connection_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_account_connection =
       value_for_key environment_account_connection_of_yojson "environmentAccountConnection" _list
         path;
   }
    : reject_environment_account_connection_output)

let reject_environment_account_connection_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key environment_account_connection_id_of_yojson "id" _list path }
    : reject_environment_account_connection_input)

let provisioned_resource_name_of_yojson = string_of_yojson
let provisioned_resource_identifier_of_yojson = string_of_yojson

let provisioned_resource_engine_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CLOUDFORMATION" -> CLOUDFORMATION
    | `String "TERRAFORM" -> TERRAFORM
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProvisionedResourceEngine" value)
    | _ -> raise (deserialize_wrong_type_error path "ProvisionedResourceEngine")
     : provisioned_resource_engine)
    : provisioned_resource_engine)

let provisioned_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioning_engine =
       option_of_yojson
         (value_for_key provisioned_resource_engine_of_yojson "provisioningEngine")
         _list path;
     identifier =
       option_of_yojson
         (value_for_key provisioned_resource_identifier_of_yojson "identifier")
         _list path;
     name = option_of_yojson (value_for_key provisioned_resource_name_of_yojson "name") _list path;
   }
    : provisioned_resource)

let provisioned_resource_list_of_yojson tree path =
  list_of_yojson provisioned_resource_of_yojson tree path

let output_key_of_yojson = string_of_yojson
let output_value_string_of_yojson = string_of_yojson

let output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value_string =
       option_of_yojson (value_for_key output_value_string_of_yojson "valueString") _list path;
     key = option_of_yojson (value_for_key output_key_of_yojson "key") _list path;
   }
    : output)

let outputs_list_of_yojson tree path = list_of_yojson output_of_yojson tree path

let notify_resource_deployment_status_change_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let notify_resource_deployment_status_change_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "statusMessage") _list path;
     deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "deploymentId") _list path;
     outputs = option_of_yojson (value_for_key outputs_list_of_yojson "outputs") _list path;
     status =
       option_of_yojson (value_for_key resource_deployment_status_of_yojson "status") _list path;
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
   }
    : notify_resource_deployment_status_change_input)

let next_token_of_yojson = string_of_yojson
let max_page_results_of_yojson = int_of_yojson

let list_tags_for_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key base_string_of_yojson "nextToken") _list path;
     tags = value_for_key tag_list_of_yojson "tags" _list path;
   }
    : list_tags_for_resource_output)

let list_tags_for_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key max_page_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key base_string_of_yojson "nextToken") _list path;
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
   }
    : list_tags_for_resource_input)

let list_services_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     services = value_for_key service_summary_list_of_yojson "services" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_services_output)

let list_services_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key max_page_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_services_input)

let list_service_templates_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     templates = value_for_key service_template_summary_list_of_yojson "templates" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_service_templates_output)

let list_service_templates_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key max_page_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_service_templates_input)

let list_service_template_versions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template_versions =
       value_for_key service_template_version_summary_list_of_yojson "templateVersions" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_service_template_versions_output)

let list_service_template_versions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     major_version =
       option_of_yojson (value_for_key template_version_part_of_yojson "majorVersion") _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
     max_results =
       option_of_yojson (value_for_key max_page_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_service_template_versions_input)

let empty_next_token_of_yojson = string_of_yojson

let list_service_pipeline_provisioned_resources_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioned_resources =
       value_for_key provisioned_resource_list_of_yojson "provisionedResources" _list path;
     next_token = option_of_yojson (value_for_key empty_next_token_of_yojson "nextToken") _list path;
   }
    : list_service_pipeline_provisioned_resources_output)

let list_service_pipeline_provisioned_resources_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key empty_next_token_of_yojson "nextToken") _list path;
     service_name = value_for_key resource_name_of_yojson "serviceName" _list path;
   }
    : list_service_pipeline_provisioned_resources_input)

let list_service_pipeline_outputs_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     outputs = value_for_key outputs_list_of_yojson "outputs" _list path;
     next_token = option_of_yojson (value_for_key empty_next_token_of_yojson "nextToken") _list path;
   }
    : list_service_pipeline_outputs_output)

let list_service_pipeline_outputs_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "deploymentId") _list path;
     next_token = option_of_yojson (value_for_key empty_next_token_of_yojson "nextToken") _list path;
     service_name = value_for_key resource_name_of_yojson "serviceName" _list path;
   }
    : list_service_pipeline_outputs_input)

let list_service_instances_sort_by_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "name" -> NAME
    | `String "deploymentStatus" -> DEPLOYMENT_STATUS
    | `String "templateName" -> TEMPLATE_NAME
    | `String "serviceName" -> SERVICE_NAME
    | `String "environmentName" -> ENVIRONMENT_NAME
    | `String "lastDeploymentAttemptedAt" -> LAST_DEPLOYMENT_ATTEMPTED_AT
    | `String "createdAt" -> CREATED_AT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ListServiceInstancesSortBy" value)
    | _ -> raise (deserialize_wrong_type_error path "ListServiceInstancesSortBy")
     : list_service_instances_sort_by)
    : list_service_instances_sort_by)

let list_service_instances_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_instances =
       value_for_key service_instance_summary_list_of_yojson "serviceInstances" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_service_instances_output)

let list_service_instances_filter_by_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "name" -> NAME
    | `String "deploymentStatus" -> DEPLOYMENT_STATUS
    | `String "templateName" -> TEMPLATE_NAME
    | `String "serviceName" -> SERVICE_NAME
    | `String "deployedTemplateVersionStatus" -> DEPLOYED_TEMPLATE_VERSION_STATUS
    | `String "environmentName" -> ENVIRONMENT_NAME
    | `String "lastDeploymentAttemptedAtBefore" -> LAST_DEPLOYMENT_ATTEMPTED_AT_BEFORE
    | `String "lastDeploymentAttemptedAtAfter" -> LAST_DEPLOYMENT_ATTEMPTED_AT_AFTER
    | `String "createdAtBefore" -> CREATED_AT_BEFORE
    | `String "createdAtAfter" -> CREATED_AT_AFTER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ListServiceInstancesFilterBy" value)
    | _ -> raise (deserialize_wrong_type_error path "ListServiceInstancesFilterBy")
     : list_service_instances_filter_by)
    : list_service_instances_filter_by)

let list_service_instances_filter_value_of_yojson = string_of_yojson

let list_service_instances_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       option_of_yojson
         (value_for_key list_service_instances_filter_value_of_yojson "value")
         _list path;
     key =
       option_of_yojson (value_for_key list_service_instances_filter_by_of_yojson "key") _list path;
   }
    : list_service_instances_filter)

let list_service_instances_filter_list_of_yojson tree path =
  list_of_yojson list_service_instances_filter_of_yojson tree path

let list_service_instances_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "sortOrder") _list path;
     sort_by =
       option_of_yojson (value_for_key list_service_instances_sort_by_of_yojson "sortBy") _list path;
     filters =
       option_of_yojson
         (value_for_key list_service_instances_filter_list_of_yojson "filters")
         _list path;
     max_results =
       option_of_yojson (value_for_key max_page_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     service_name =
       option_of_yojson (value_for_key resource_name_of_yojson "serviceName") _list path;
   }
    : list_service_instances_input)

let list_service_instance_provisioned_resources_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioned_resources =
       value_for_key provisioned_resource_list_of_yojson "provisionedResources" _list path;
     next_token = option_of_yojson (value_for_key empty_next_token_of_yojson "nextToken") _list path;
   }
    : list_service_instance_provisioned_resources_output)

let list_service_instance_provisioned_resources_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key empty_next_token_of_yojson "nextToken") _list path;
     service_instance_name = value_for_key resource_name_of_yojson "serviceInstanceName" _list path;
     service_name = value_for_key resource_name_of_yojson "serviceName" _list path;
   }
    : list_service_instance_provisioned_resources_input)

let list_service_instance_outputs_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     outputs = value_for_key outputs_list_of_yojson "outputs" _list path;
     next_token = option_of_yojson (value_for_key empty_next_token_of_yojson "nextToken") _list path;
   }
    : list_service_instance_outputs_output)

let list_service_instance_outputs_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "deploymentId") _list path;
     next_token = option_of_yojson (value_for_key empty_next_token_of_yojson "nextToken") _list path;
     service_name = value_for_key resource_name_of_yojson "serviceName" _list path;
     service_instance_name = value_for_key resource_name_of_yojson "serviceInstanceName" _list path;
   }
    : list_service_instance_outputs_input)

let list_repository_sync_definitions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_definitions =
       value_for_key repository_sync_definition_list_of_yojson "syncDefinitions" _list path;
     next_token = option_of_yojson (value_for_key empty_next_token_of_yojson "nextToken") _list path;
   }
    : list_repository_sync_definitions_output)

let list_repository_sync_definitions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key empty_next_token_of_yojson "nextToken") _list path;
     sync_type = value_for_key sync_type_of_yojson "syncType" _list path;
     repository_provider =
       value_for_key repository_provider_of_yojson "repositoryProvider" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
   }
    : list_repository_sync_definitions_input)

let list_repositories_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repositories = value_for_key repository_summary_list_of_yojson "repositories" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_repositories_output)

let list_repositories_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key max_page_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_repositories_input)

let environment_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_succeeded_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastSucceededDeploymentId")
         _list path;
     last_attempted_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastAttemptedDeploymentId")
         _list path;
     component_role_arn =
       option_of_yojson (value_for_key arn_of_yojson "componentRoleArn") _list path;
     provisioning =
       option_of_yojson (value_for_key provisioning_of_yojson "provisioning") _list path;
     environment_account_id =
       option_of_yojson (value_for_key aws_account_id_of_yojson "environmentAccountId") _list path;
     environment_account_connection_id =
       option_of_yojson
         (value_for_key environment_account_connection_id_of_yojson "environmentAccountConnectionId")
         _list path;
     proton_service_role_arn =
       option_of_yojson (value_for_key arn_of_yojson "protonServiceRoleArn") _list path;
     deployment_status_message =
       option_of_yojson
         (value_for_key status_message_of_yojson "deploymentStatusMessage")
         _list path;
     deployment_status = value_for_key deployment_status_of_yojson "deploymentStatus" _list path;
     template_minor_version =
       value_for_key template_version_part_of_yojson "templateMinorVersion" _list path;
     template_major_version =
       value_for_key template_version_part_of_yojson "templateMajorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
     arn = value_for_key environment_arn_of_yojson "arn" _list path;
     last_deployment_succeeded_at =
       value_for_key base_timestamp_of_yojson "lastDeploymentSucceededAt" _list path;
     last_deployment_attempted_at =
       value_for_key base_timestamp_of_yojson "lastDeploymentAttemptedAt" _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : environment_summary)

let environment_summary_list_of_yojson tree path =
  list_of_yojson environment_summary_of_yojson tree path

let list_environments_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environments = value_for_key environment_summary_list_of_yojson "environments" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_environments_output)

let environment_template_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     major_version = value_for_key template_version_part_of_yojson "majorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
   }
    : environment_template_filter)

let environment_template_filter_list_of_yojson tree path =
  list_of_yojson environment_template_filter_of_yojson tree path

let list_environments_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_templates =
       option_of_yojson
         (value_for_key environment_template_filter_list_of_yojson "environmentTemplates")
         _list path;
     max_results =
       option_of_yojson (value_for_key max_page_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_environments_input)

let environment_template_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioning =
       option_of_yojson (value_for_key provisioning_of_yojson "provisioning") _list path;
     recommended_version =
       option_of_yojson
         (value_for_key full_template_version_number_of_yojson "recommendedVersion")
         _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "displayName") _list path;
     last_modified_at = value_for_key base_timestamp_of_yojson "lastModifiedAt" _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     arn = value_for_key environment_template_arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : environment_template_summary)

let environment_template_summary_list_of_yojson tree path =
  list_of_yojson environment_template_summary_of_yojson tree path

let list_environment_templates_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     templates = value_for_key environment_template_summary_list_of_yojson "templates" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_environment_templates_output)

let list_environment_templates_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key max_page_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_environment_templates_input)

let environment_template_version_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_at = value_for_key base_timestamp_of_yojson "lastModifiedAt" _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     arn = value_for_key environment_template_version_arn_of_yojson "arn" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "statusMessage") _list path;
     status = value_for_key template_version_status_of_yojson "status" _list path;
     recommended_minor_version =
       option_of_yojson
         (value_for_key template_version_part_of_yojson "recommendedMinorVersion")
         _list path;
     minor_version = value_for_key template_version_part_of_yojson "minorVersion" _list path;
     major_version = value_for_key template_version_part_of_yojson "majorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
   }
    : environment_template_version_summary)

let environment_template_version_summary_list_of_yojson tree path =
  list_of_yojson environment_template_version_summary_of_yojson tree path

let list_environment_template_versions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template_versions =
       value_for_key environment_template_version_summary_list_of_yojson "templateVersions" _list
         path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_environment_template_versions_output)

let list_environment_template_versions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     major_version =
       option_of_yojson (value_for_key template_version_part_of_yojson "majorVersion") _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
     max_results =
       option_of_yojson (value_for_key max_page_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_environment_template_versions_input)

let list_environment_provisioned_resources_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioned_resources =
       value_for_key provisioned_resource_list_of_yojson "provisionedResources" _list path;
     next_token = option_of_yojson (value_for_key empty_next_token_of_yojson "nextToken") _list path;
   }
    : list_environment_provisioned_resources_output)

let list_environment_provisioned_resources_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key empty_next_token_of_yojson "nextToken") _list path;
     environment_name = value_for_key resource_name_of_yojson "environmentName" _list path;
   }
    : list_environment_provisioned_resources_input)

let list_environment_outputs_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     outputs = value_for_key outputs_list_of_yojson "outputs" _list path;
     next_token = option_of_yojson (value_for_key empty_next_token_of_yojson "nextToken") _list path;
   }
    : list_environment_outputs_output)

let list_environment_outputs_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "deploymentId") _list path;
     next_token = option_of_yojson (value_for_key empty_next_token_of_yojson "nextToken") _list path;
     environment_name = value_for_key resource_name_of_yojson "environmentName" _list path;
   }
    : list_environment_outputs_input)

let environment_account_connection_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     component_role_arn =
       option_of_yojson (value_for_key arn_of_yojson "componentRoleArn") _list path;
     status = value_for_key environment_account_connection_status_of_yojson "status" _list path;
     last_modified_at = value_for_key base_timestamp_of_yojson "lastModifiedAt" _list path;
     requested_at = value_for_key base_timestamp_of_yojson "requestedAt" _list path;
     environment_name = value_for_key resource_name_of_yojson "environmentName" _list path;
     role_arn = value_for_key arn_of_yojson "roleArn" _list path;
     environment_account_id =
       value_for_key aws_account_id_of_yojson "environmentAccountId" _list path;
     management_account_id = value_for_key aws_account_id_of_yojson "managementAccountId" _list path;
     arn = value_for_key environment_account_connection_arn_of_yojson "arn" _list path;
     id = value_for_key environment_account_connection_id_of_yojson "id" _list path;
   }
    : environment_account_connection_summary)

let environment_account_connection_summary_list_of_yojson tree path =
  list_of_yojson environment_account_connection_summary_of_yojson tree path

let list_environment_account_connections_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     environment_account_connections =
       value_for_key environment_account_connection_summary_list_of_yojson
         "environmentAccountConnections" _list path;
   }
    : list_environment_account_connections_output)

let environment_account_connection_requester_account_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "MANAGEMENT_ACCOUNT" -> MANAGEMENT_ACCOUNT
    | `String "ENVIRONMENT_ACCOUNT" -> ENVIRONMENT_ACCOUNT
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "EnvironmentAccountConnectionRequesterAccountType" value)
    | _ ->
        raise (deserialize_wrong_type_error path "EnvironmentAccountConnectionRequesterAccountType")
     : environment_account_connection_requester_account_type)
    : environment_account_connection_requester_account_type)

let environment_account_connection_status_list_of_yojson tree path =
  list_of_yojson environment_account_connection_status_of_yojson tree path

let list_environment_account_connections_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key max_page_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     statuses =
       option_of_yojson
         (value_for_key environment_account_connection_status_list_of_yojson "statuses")
         _list path;
     environment_name =
       option_of_yojson (value_for_key resource_name_of_yojson "environmentName") _list path;
     requested_by =
       value_for_key environment_account_connection_requester_account_type_of_yojson "requestedBy"
         _list path;
   }
    : list_environment_account_connections_input)

let deployment_arn_of_yojson = string_of_yojson

let deployment_target_resource_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "ENVIRONMENT" -> ENVIRONMENT
    | `String "SERVICE_PIPELINE" -> SERVICE_PIPELINE
    | `String "SERVICE_INSTANCE" -> SERVICE_INSTANCE
    | `String "COMPONENT" -> COMPONENT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeploymentTargetResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentTargetResourceType")
     : deployment_target_resource_type)
    : deployment_target_resource_type)

let deployment_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_status = value_for_key deployment_status_of_yojson "deploymentStatus" _list path;
     last_succeeded_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastSucceededDeploymentId")
         _list path;
     last_attempted_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastAttemptedDeploymentId")
         _list path;
     component_name =
       option_of_yojson (value_for_key resource_name_of_yojson "componentName") _list path;
     service_instance_name =
       option_of_yojson (value_for_key resource_name_of_yojson "serviceInstanceName") _list path;
     service_name =
       option_of_yojson (value_for_key resource_name_of_yojson "serviceName") _list path;
     environment_name = value_for_key resource_name_of_yojson "environmentName" _list path;
     completed_at =
       option_of_yojson (value_for_key base_timestamp_of_yojson "completedAt") _list path;
     last_modified_at = value_for_key base_timestamp_of_yojson "lastModifiedAt" _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     target_resource_type =
       value_for_key deployment_target_resource_type_of_yojson "targetResourceType" _list path;
     target_resource_created_at =
       value_for_key base_timestamp_of_yojson "targetResourceCreatedAt" _list path;
     target_arn = value_for_key arn_of_yojson "targetArn" _list path;
     arn = value_for_key deployment_arn_of_yojson "arn" _list path;
     id = value_for_key deployment_id_of_yojson "id" _list path;
   }
    : deployment_summary)

let deployment_summary_list_of_yojson tree path =
  list_of_yojson deployment_summary_of_yojson tree path

let list_deployments_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployments = value_for_key deployment_summary_list_of_yojson "deployments" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_deployments_output)

let list_deployments_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key max_page_results_of_yojson "maxResults") _list path;
     component_name =
       option_of_yojson (value_for_key resource_name_of_yojson "componentName") _list path;
     service_instance_name =
       option_of_yojson (value_for_key resource_name_of_yojson "serviceInstanceName") _list path;
     service_name =
       option_of_yojson (value_for_key resource_name_of_yojson "serviceName") _list path;
     environment_name =
       option_of_yojson (value_for_key resource_name_of_yojson "environmentName") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_deployments_input)

let component_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_succeeded_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastSucceededDeploymentId")
         _list path;
     last_attempted_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastAttemptedDeploymentId")
         _list path;
     deployment_status_message =
       option_of_yojson
         (value_for_key status_message_of_yojson "deploymentStatusMessage")
         _list path;
     deployment_status = value_for_key deployment_status_of_yojson "deploymentStatus" _list path;
     last_deployment_succeeded_at =
       option_of_yojson
         (value_for_key base_timestamp_of_yojson "lastDeploymentSucceededAt")
         _list path;
     last_deployment_attempted_at =
       option_of_yojson
         (value_for_key base_timestamp_of_yojson "lastDeploymentAttemptedAt")
         _list path;
     last_modified_at = value_for_key base_timestamp_of_yojson "lastModifiedAt" _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     service_instance_name =
       option_of_yojson (value_for_key resource_name_of_yojson "serviceInstanceName") _list path;
     service_name =
       option_of_yojson (value_for_key resource_name_of_yojson "serviceName") _list path;
     environment_name = value_for_key resource_name_of_yojson "environmentName" _list path;
     arn = value_for_key component_arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : component_summary)

let component_summary_list_of_yojson tree path =
  list_of_yojson component_summary_of_yojson tree path

let list_components_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     components = value_for_key component_summary_list_of_yojson "components" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_components_output)

let list_components_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key max_page_results_of_yojson "maxResults") _list path;
     service_instance_name =
       option_of_yojson (value_for_key resource_name_of_yojson "serviceInstanceName") _list path;
     service_name =
       option_of_yojson (value_for_key resource_name_of_yojson "serviceName") _list path;
     environment_name =
       option_of_yojson (value_for_key resource_name_of_yojson "environmentName") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_components_input)

let list_component_provisioned_resources_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioned_resources =
       value_for_key provisioned_resource_list_of_yojson "provisionedResources" _list path;
     next_token = option_of_yojson (value_for_key empty_next_token_of_yojson "nextToken") _list path;
   }
    : list_component_provisioned_resources_output)

let list_component_provisioned_resources_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key empty_next_token_of_yojson "nextToken") _list path;
     component_name = value_for_key resource_name_of_yojson "componentName" _list path;
   }
    : list_component_provisioned_resources_input)

let list_component_outputs_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     outputs = value_for_key outputs_list_of_yojson "outputs" _list path;
     next_token = option_of_yojson (value_for_key empty_next_token_of_yojson "nextToken") _list path;
   }
    : list_component_outputs_output)

let list_component_outputs_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "deploymentId") _list path;
     next_token = option_of_yojson (value_for_key empty_next_token_of_yojson "nextToken") _list path;
     component_name = value_for_key resource_name_of_yojson "componentName" _list path;
   }
    : list_component_outputs_input)

let get_template_sync_status_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     desired_state = option_of_yojson (value_for_key revision_of_yojson "desiredState") _list path;
     latest_successful_sync =
       option_of_yojson
         (value_for_key resource_sync_attempt_of_yojson "latestSuccessfulSync")
         _list path;
     latest_sync =
       option_of_yojson (value_for_key resource_sync_attempt_of_yojson "latestSync") _list path;
   }
    : get_template_sync_status_output)

let get_template_sync_status_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template_version = value_for_key template_version_part_of_yojson "templateVersion" _list path;
     template_type = value_for_key template_type_of_yojson "templateType" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
   }
    : get_template_sync_status_input)

let get_template_sync_config_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template_sync_config =
       option_of_yojson
         (value_for_key template_sync_config_of_yojson "templateSyncConfig")
         _list path;
   }
    : get_template_sync_config_output)

let get_template_sync_config_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template_type = value_for_key template_type_of_yojson "templateType" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
   }
    : get_template_sync_config_input)

let get_service_template_version_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_template_version =
       value_for_key service_template_version_of_yojson "serviceTemplateVersion" _list path;
   }
    : get_service_template_version_output)

let get_service_template_version_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     minor_version = value_for_key template_version_part_of_yojson "minorVersion" _list path;
     major_version = value_for_key template_version_part_of_yojson "majorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
   }
    : get_service_template_version_input)

let get_service_template_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_template = value_for_key service_template_of_yojson "serviceTemplate" _list path }
    : get_service_template_output)

let get_service_template_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path } : get_service_template_input)

let get_service_sync_config_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_sync_config =
       option_of_yojson (value_for_key service_sync_config_of_yojson "serviceSyncConfig") _list path;
   }
    : get_service_sync_config_output)

let get_service_sync_config_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_name = value_for_key resource_name_of_yojson "serviceName" _list path }
    : get_service_sync_config_input)

let get_service_sync_blocker_summary_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_sync_blocker_summary =
       option_of_yojson
         (value_for_key service_sync_blocker_summary_of_yojson "serviceSyncBlockerSummary")
         _list path;
   }
    : get_service_sync_blocker_summary_output)

let get_service_sync_blocker_summary_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_instance_name =
       option_of_yojson (value_for_key resource_name_of_yojson "serviceInstanceName") _list path;
     service_name = value_for_key resource_name_of_yojson "serviceName" _list path;
   }
    : get_service_sync_blocker_summary_input)

let get_service_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service = option_of_yojson (value_for_key service_of_yojson "service") _list path }
    : get_service_output)

let get_service_instance_sync_status_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     desired_state = option_of_yojson (value_for_key revision_of_yojson "desiredState") _list path;
     latest_successful_sync =
       option_of_yojson
         (value_for_key resource_sync_attempt_of_yojson "latestSuccessfulSync")
         _list path;
     latest_sync =
       option_of_yojson (value_for_key resource_sync_attempt_of_yojson "latestSync") _list path;
   }
    : get_service_instance_sync_status_output)

let get_service_instance_sync_status_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_instance_name = value_for_key resource_name_of_yojson "serviceInstanceName" _list path;
     service_name = value_for_key resource_name_of_yojson "serviceName" _list path;
   }
    : get_service_instance_sync_status_input)

let get_service_instance_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_instance = value_for_key service_instance_of_yojson "serviceInstance" _list path }
    : get_service_instance_output)

let get_service_instance_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_name = value_for_key resource_name_of_yojson "serviceName" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : get_service_instance_input)

let get_service_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path } : get_service_input)

let counts_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipelines =
       option_of_yojson (value_for_key resource_counts_summary_of_yojson "pipelines") _list path;
     service_templates =
       option_of_yojson
         (value_for_key resource_counts_summary_of_yojson "serviceTemplates")
         _list path;
     services =
       option_of_yojson (value_for_key resource_counts_summary_of_yojson "services") _list path;
     service_instances =
       option_of_yojson
         (value_for_key resource_counts_summary_of_yojson "serviceInstances")
         _list path;
     environment_templates =
       option_of_yojson
         (value_for_key resource_counts_summary_of_yojson "environmentTemplates")
         _list path;
     environments =
       option_of_yojson (value_for_key resource_counts_summary_of_yojson "environments") _list path;
     components =
       option_of_yojson (value_for_key resource_counts_summary_of_yojson "components") _list path;
   }
    : counts_summary)

let get_resources_summary_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ counts = value_for_key counts_summary_of_yojson "counts" _list path }
    : get_resources_summary_output)

let get_resources_summary_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let get_repository_sync_status_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     latest_sync =
       option_of_yojson (value_for_key repository_sync_attempt_of_yojson "latestSync") _list path;
   }
    : get_repository_sync_status_output)

let get_repository_sync_status_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_type = value_for_key sync_type_of_yojson "syncType" _list path;
     branch = value_for_key git_branch_name_of_yojson "branch" _list path;
     repository_provider =
       value_for_key repository_provider_of_yojson "repositoryProvider" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
   }
    : get_repository_sync_status_input)

let get_repository_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ repository = value_for_key repository_of_yojson "repository" _list path }
    : get_repository_output)

let get_repository_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key repository_name_of_yojson "name" _list path;
     provider = value_for_key repository_provider_of_yojson "provider" _list path;
   }
    : get_repository_input)

let get_environment_template_version_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_template_version =
       value_for_key environment_template_version_of_yojson "environmentTemplateVersion" _list path;
   }
    : get_environment_template_version_output)

let get_environment_template_version_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     minor_version = value_for_key template_version_part_of_yojson "minorVersion" _list path;
     major_version = value_for_key template_version_part_of_yojson "majorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
   }
    : get_environment_template_version_input)

let get_environment_template_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_template =
       value_for_key environment_template_of_yojson "environmentTemplate" _list path;
   }
    : get_environment_template_output)

let get_environment_template_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path }
    : get_environment_template_input)

let get_environment_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ environment = value_for_key environment_of_yojson "environment" _list path }
    : get_environment_output)

let get_environment_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path } : get_environment_input)

let get_environment_account_connection_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_account_connection =
       value_for_key environment_account_connection_of_yojson "environmentAccountConnection" _list
         path;
   }
    : get_environment_account_connection_output)

let get_environment_account_connection_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key environment_account_connection_id_of_yojson "id" _list path }
    : get_environment_account_connection_input)

let environment_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template_minor_version =
       value_for_key template_version_part_of_yojson "templateMinorVersion" _list path;
     template_major_version =
       value_for_key template_version_part_of_yojson "templateMajorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
     spec = option_of_yojson (value_for_key spec_contents_of_yojson "spec") _list path;
   }
    : environment_state)

let component_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template_file =
       option_of_yojson (value_for_key template_file_contents_of_yojson "templateFile") _list path;
     service_spec =
       option_of_yojson (value_for_key spec_contents_of_yojson "serviceSpec") _list path;
     service_instance_name =
       option_of_yojson
         (value_for_key resource_name_or_empty_of_yojson "serviceInstanceName")
         _list path;
     service_name =
       option_of_yojson (value_for_key resource_name_or_empty_of_yojson "serviceName") _list path;
   }
    : component_state)

let deployment_state_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "component" -> Component (component_state_of_yojson value_ path)
   | "servicePipeline" -> ServicePipeline (service_pipeline_state_of_yojson value_ path)
   | "environment" -> Environment (environment_state_of_yojson value_ path)
   | "serviceInstance" -> ServiceInstance (service_instance_state_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "DeploymentState" unknown)
    : deployment_state)

let deployment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_state =
       option_of_yojson (value_for_key deployment_state_of_yojson "targetState") _list path;
     initial_state =
       option_of_yojson (value_for_key deployment_state_of_yojson "initialState") _list path;
     last_succeeded_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastSucceededDeploymentId")
         _list path;
     last_attempted_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "lastAttemptedDeploymentId")
         _list path;
     completed_at =
       option_of_yojson (value_for_key base_timestamp_of_yojson "completedAt") _list path;
     last_modified_at = value_for_key base_timestamp_of_yojson "lastModifiedAt" _list path;
     created_at = value_for_key base_timestamp_of_yojson "createdAt" _list path;
     deployment_status_message =
       option_of_yojson
         (value_for_key status_message_of_yojson "deploymentStatusMessage")
         _list path;
     deployment_status = value_for_key deployment_status_of_yojson "deploymentStatus" _list path;
     component_name =
       option_of_yojson (value_for_key resource_name_of_yojson "componentName") _list path;
     service_instance_name =
       option_of_yojson (value_for_key resource_name_of_yojson "serviceInstanceName") _list path;
     service_name =
       option_of_yojson (value_for_key resource_name_of_yojson "serviceName") _list path;
     environment_name = value_for_key resource_name_of_yojson "environmentName" _list path;
     target_resource_type =
       value_for_key deployment_target_resource_type_of_yojson "targetResourceType" _list path;
     target_resource_created_at =
       value_for_key base_timestamp_of_yojson "targetResourceCreatedAt" _list path;
     target_arn = value_for_key arn_of_yojson "targetArn" _list path;
     arn = value_for_key deployment_arn_of_yojson "arn" _list path;
     id = value_for_key deployment_id_of_yojson "id" _list path;
   }
    : deployment)

let get_deployment_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ deployment = option_of_yojson (value_for_key deployment_of_yojson "deployment") _list path }
    : get_deployment_output)

let get_deployment_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     component_name =
       option_of_yojson (value_for_key resource_name_of_yojson "componentName") _list path;
     service_instance_name =
       option_of_yojson (value_for_key resource_name_of_yojson "serviceInstanceName") _list path;
     service_name =
       option_of_yojson (value_for_key resource_name_of_yojson "serviceName") _list path;
     environment_name =
       option_of_yojson (value_for_key resource_name_of_yojson "environmentName") _list path;
     id = value_for_key deployment_id_of_yojson "id" _list path;
   }
    : get_deployment_input)

let get_component_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ component = option_of_yojson (value_for_key component_of_yojson "component") _list path }
    : get_component_output)

let get_component_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path } : get_component_input)

let get_account_settings_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_settings =
       option_of_yojson (value_for_key account_settings_of_yojson "accountSettings") _list path;
   }
    : get_account_settings_output)

let get_account_settings_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_template_sync_config_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template_sync_config =
       option_of_yojson
         (value_for_key template_sync_config_of_yojson "templateSyncConfig")
         _list path;
   }
    : delete_template_sync_config_output)

let delete_template_sync_config_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template_type = value_for_key template_type_of_yojson "templateType" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
   }
    : delete_template_sync_config_input)

let delete_service_template_version_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_template_version =
       option_of_yojson
         (value_for_key service_template_version_of_yojson "serviceTemplateVersion")
         _list path;
   }
    : delete_service_template_version_output)

let delete_service_template_version_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     minor_version = value_for_key template_version_part_of_yojson "minorVersion" _list path;
     major_version = value_for_key template_version_part_of_yojson "majorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
   }
    : delete_service_template_version_input)

let delete_service_template_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_template =
       option_of_yojson (value_for_key service_template_of_yojson "serviceTemplate") _list path;
   }
    : delete_service_template_output)

let delete_service_template_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path }
    : delete_service_template_input)

let delete_service_sync_config_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_sync_config =
       option_of_yojson (value_for_key service_sync_config_of_yojson "serviceSyncConfig") _list path;
   }
    : delete_service_sync_config_output)

let delete_service_sync_config_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_name = value_for_key resource_name_of_yojson "serviceName" _list path }
    : delete_service_sync_config_input)

let delete_service_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service = option_of_yojson (value_for_key service_of_yojson "service") _list path }
    : delete_service_output)

let delete_service_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path } : delete_service_input)

let delete_repository_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ repository = option_of_yojson (value_for_key repository_of_yojson "repository") _list path }
    : delete_repository_output)

let delete_repository_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key repository_name_of_yojson "name" _list path;
     provider = value_for_key repository_provider_of_yojson "provider" _list path;
   }
    : delete_repository_input)

let delete_environment_template_version_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_template_version =
       option_of_yojson
         (value_for_key environment_template_version_of_yojson "environmentTemplateVersion")
         _list path;
   }
    : delete_environment_template_version_output)

let delete_environment_template_version_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     minor_version = value_for_key template_version_part_of_yojson "minorVersion" _list path;
     major_version = value_for_key template_version_part_of_yojson "majorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
   }
    : delete_environment_template_version_input)

let delete_environment_template_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_template =
       option_of_yojson
         (value_for_key environment_template_of_yojson "environmentTemplate")
         _list path;
   }
    : delete_environment_template_output)

let delete_environment_template_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path }
    : delete_environment_template_input)

let delete_environment_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ environment = option_of_yojson (value_for_key environment_of_yojson "environment") _list path }
    : delete_environment_output)

let delete_environment_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path } : delete_environment_input)

let delete_environment_account_connection_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_account_connection =
       option_of_yojson
         (value_for_key environment_account_connection_of_yojson "environmentAccountConnection")
         _list path;
   }
    : delete_environment_account_connection_output)

let delete_environment_account_connection_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key environment_account_connection_id_of_yojson "id" _list path }
    : delete_environment_account_connection_input)

let delete_deployment_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ deployment = option_of_yojson (value_for_key deployment_of_yojson "deployment") _list path }
    : delete_deployment_output)

let delete_deployment_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key deployment_id_of_yojson "id" _list path } : delete_deployment_input)

let delete_component_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ component = option_of_yojson (value_for_key component_of_yojson "component") _list path }
    : delete_component_output)

let delete_component_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path } : delete_component_input)

let create_template_sync_config_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template_sync_config =
       option_of_yojson
         (value_for_key template_sync_config_of_yojson "templateSyncConfig")
         _list path;
   }
    : create_template_sync_config_output)

let create_template_sync_config_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subdirectory =
       option_of_yojson (value_for_key subdirectory_of_yojson "subdirectory") _list path;
     branch = value_for_key git_branch_name_of_yojson "branch" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     repository_provider =
       value_for_key repository_provider_of_yojson "repositoryProvider" _list path;
     template_type = value_for_key template_type_of_yojson "templateType" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
   }
    : create_template_sync_config_input)

let create_service_template_version_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_template_version =
       value_for_key service_template_version_of_yojson "serviceTemplateVersion" _list path;
   }
    : create_service_template_version_output)

let create_service_template_version_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     supported_component_sources =
       option_of_yojson
         (value_for_key service_template_supported_component_source_input_list_of_yojson
            "supportedComponentSources")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     compatible_environment_templates =
       value_for_key compatible_environment_template_input_list_of_yojson
         "compatibleEnvironmentTemplates" _list path;
     source = value_for_key template_version_source_input_of_yojson "source" _list path;
     major_version =
       option_of_yojson (value_for_key template_version_part_of_yojson "majorVersion") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : create_service_template_version_input)

let create_service_template_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_template = value_for_key service_template_of_yojson "serviceTemplate" _list path }
    : create_service_template_output)

let create_service_template_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     pipeline_provisioning =
       option_of_yojson (value_for_key provisioning_of_yojson "pipelineProvisioning") _list path;
     encryption_key = option_of_yojson (value_for_key arn_of_yojson "encryptionKey") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "displayName") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : create_service_template_input)

let create_service_sync_config_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_sync_config =
       option_of_yojson (value_for_key service_sync_config_of_yojson "serviceSyncConfig") _list path;
   }
    : create_service_sync_config_output)

let create_service_sync_config_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_path = value_for_key ops_file_path_of_yojson "filePath" _list path;
     branch = value_for_key git_branch_name_of_yojson "branch" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     repository_provider =
       value_for_key repository_provider_of_yojson "repositoryProvider" _list path;
     service_name = value_for_key resource_name_of_yojson "serviceName" _list path;
   }
    : create_service_sync_config_input)

let create_service_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service = value_for_key service_of_yojson "service" _list path } : create_service_output)

let create_service_instance_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_instance = value_for_key service_instance_of_yojson "serviceInstance" _list path }
    : create_service_instance_output)

let create_service_instance_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     template_minor_version =
       option_of_yojson
         (value_for_key template_version_part_of_yojson "templateMinorVersion")
         _list path;
     template_major_version =
       option_of_yojson
         (value_for_key template_version_part_of_yojson "templateMajorVersion")
         _list path;
     spec = value_for_key spec_contents_of_yojson "spec" _list path;
     service_name = value_for_key resource_name_of_yojson "serviceName" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : create_service_instance_input)

let create_service_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     branch_name =
       option_of_yojson (value_for_key git_branch_name_of_yojson "branchName") _list path;
     repository_id =
       option_of_yojson (value_for_key repository_id_of_yojson "repositoryId") _list path;
     repository_connection_arn =
       option_of_yojson (value_for_key arn_of_yojson "repositoryConnectionArn") _list path;
     spec = value_for_key spec_contents_of_yojson "spec" _list path;
     template_minor_version =
       option_of_yojson
         (value_for_key template_version_part_of_yojson "templateMinorVersion")
         _list path;
     template_major_version =
       value_for_key template_version_part_of_yojson "templateMajorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : create_service_input)

let create_repository_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ repository = value_for_key repository_of_yojson "repository" _list path }
    : create_repository_output)

let create_repository_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     encryption_key = option_of_yojson (value_for_key arn_of_yojson "encryptionKey") _list path;
     connection_arn = value_for_key arn_of_yojson "connectionArn" _list path;
     name = value_for_key repository_name_of_yojson "name" _list path;
     provider = value_for_key repository_provider_of_yojson "provider" _list path;
   }
    : create_repository_input)

let create_environment_template_version_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_template_version =
       value_for_key environment_template_version_of_yojson "environmentTemplateVersion" _list path;
   }
    : create_environment_template_version_output)

let create_environment_template_version_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     source = value_for_key template_version_source_input_of_yojson "source" _list path;
     major_version =
       option_of_yojson (value_for_key template_version_part_of_yojson "majorVersion") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : create_environment_template_version_input)

let create_environment_template_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_template =
       value_for_key environment_template_of_yojson "environmentTemplate" _list path;
   }
    : create_environment_template_output)

let create_environment_template_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     provisioning =
       option_of_yojson (value_for_key provisioning_of_yojson "provisioning") _list path;
     encryption_key = option_of_yojson (value_for_key arn_of_yojson "encryptionKey") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "displayName") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : create_environment_template_input)

let create_environment_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ environment = value_for_key environment_of_yojson "environment" _list path }
    : create_environment_output)

let create_environment_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     codebuild_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "codebuildRoleArn") _list path;
     component_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "componentRoleArn") _list path;
     provisioning_repository =
       option_of_yojson
         (value_for_key repository_branch_input_of_yojson "provisioningRepository")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     environment_account_connection_id =
       option_of_yojson
         (value_for_key environment_account_connection_id_of_yojson "environmentAccountConnectionId")
         _list path;
     proton_service_role_arn =
       option_of_yojson (value_for_key arn_of_yojson "protonServiceRoleArn") _list path;
     spec = value_for_key spec_contents_of_yojson "spec" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     template_minor_version =
       option_of_yojson
         (value_for_key template_version_part_of_yojson "templateMinorVersion")
         _list path;
     template_major_version =
       value_for_key template_version_part_of_yojson "templateMajorVersion" _list path;
     template_name = value_for_key resource_name_of_yojson "templateName" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : create_environment_input)

let create_environment_account_connection_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_account_connection =
       value_for_key environment_account_connection_of_yojson "environmentAccountConnection" _list
         path;
   }
    : create_environment_account_connection_output)

let create_environment_account_connection_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     codebuild_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "codebuildRoleArn") _list path;
     component_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "componentRoleArn") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     environment_name = value_for_key resource_name_of_yojson "environmentName" _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "roleArn") _list path;
     management_account_id = value_for_key aws_account_id_of_yojson "managementAccountId" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : create_environment_account_connection_input)

let create_component_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ component = value_for_key component_of_yojson "component" _list path }
    : create_component_output)

let create_component_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     service_spec =
       option_of_yojson (value_for_key spec_contents_of_yojson "serviceSpec") _list path;
     manifest = value_for_key template_manifest_contents_of_yojson "manifest" _list path;
     template_file = value_for_key template_file_contents_of_yojson "templateFile" _list path;
     environment_name =
       option_of_yojson (value_for_key resource_name_of_yojson "environmentName") _list path;
     service_instance_name =
       option_of_yojson (value_for_key resource_name_of_yojson "serviceInstanceName") _list path;
     service_name =
       option_of_yojson (value_for_key resource_name_of_yojson "serviceName") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : create_component_input)

let cancel_service_pipeline_deployment_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pipeline = value_for_key service_pipeline_of_yojson "pipeline" _list path }
    : cancel_service_pipeline_deployment_output)

let cancel_service_pipeline_deployment_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_name = value_for_key resource_name_of_yojson "serviceName" _list path }
    : cancel_service_pipeline_deployment_input)

let cancel_service_instance_deployment_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_instance = value_for_key service_instance_of_yojson "serviceInstance" _list path }
    : cancel_service_instance_deployment_output)

let cancel_service_instance_deployment_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_name = value_for_key resource_name_of_yojson "serviceName" _list path;
     service_instance_name = value_for_key resource_name_of_yojson "serviceInstanceName" _list path;
   }
    : cancel_service_instance_deployment_input)

let cancel_environment_deployment_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ environment = value_for_key environment_of_yojson "environment" _list path }
    : cancel_environment_deployment_output)

let cancel_environment_deployment_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ environment_name = value_for_key resource_name_of_yojson "environmentName" _list path }
    : cancel_environment_deployment_input)

let cancel_component_deployment_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ component = value_for_key component_of_yojson "component" _list path }
    : cancel_component_deployment_output)

let cancel_component_deployment_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ component_name = value_for_key resource_name_of_yojson "componentName" _list path }
    : cancel_component_deployment_input)

let accept_environment_account_connection_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_account_connection =
       value_for_key environment_account_connection_of_yojson "environmentAccountConnection" _list
         path;
   }
    : accept_environment_account_connection_output)

let accept_environment_account_connection_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key environment_account_connection_id_of_yojson "id" _list path }
    : accept_environment_account_connection_input)

let base_long_of_yojson = long_of_yojson
let base_document_of_yojson = json_of_yojson
let base_float_of_yojson = float_of_yojson
let base_double_of_yojson = double_of_yojson
let base_short_of_yojson = short_of_yojson
let base_blob_of_yojson = blob_of_yojson
let base_byte_of_yojson = byte_of_yojson
