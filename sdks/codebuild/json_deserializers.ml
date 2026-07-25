open Smaws_Lib.Json.DeserializeHelpers
open Types

let string__of_yojson = string_of_yojson

let account_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : account_limit_exceeded_exception)

let account_suspended_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : account_suspended_exception)

let artifact_namespace_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "BUILD_ID" -> BUILD_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "ArtifactNamespace" value)
    | _ -> raise (deserialize_wrong_type_error path "ArtifactNamespace")
     : artifact_namespace)
    : artifact_namespace)

let artifact_packaging_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "ZIP" -> ZIP
    | `String value -> raise (deserialize_unknown_enum_value_error path "ArtifactPackaging" value)
    | _ -> raise (deserialize_wrong_type_error path "ArtifactPackaging")
     : artifact_packaging)
    : artifact_packaging)

let artifacts_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CODEPIPELINE" -> CODEPIPELINE
    | `String "S3" -> S3
    | `String "NO_ARTIFACTS" -> NO_ARTIFACTS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ArtifactsType" value)
    | _ -> raise (deserialize_wrong_type_error path "ArtifactsType")
     : artifacts_type)
    : artifacts_type)

let auth_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "OAUTH" -> OAUTH
    | `String "BASIC_AUTH" -> BASIC_AUTH
    | `String "PERSONAL_ACCESS_TOKEN" -> PERSONAL_ACCESS_TOKEN
    | `String "CODECONNECTIONS" -> CODECONNECTIONS
    | `String "SECRETS_MANAGER" -> SECRETS_MANAGER
    | `String value -> raise (deserialize_unknown_enum_value_error path "AuthType" value)
    | _ -> raise (deserialize_wrong_type_error path "AuthType")
     : auth_type)
    : auth_type)

let wrapper_int_of_yojson = int_of_yojson

let auto_retry_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_retry_limit =
       option_of_yojson (value_for_key wrapper_int_of_yojson "autoRetryLimit") _list path;
     auto_retry_number =
       option_of_yojson (value_for_key wrapper_int_of_yojson "autoRetryNumber") _list path;
     next_auto_retry = option_of_yojson (value_for_key string__of_yojson "nextAutoRetry") _list path;
     previous_auto_retry =
       option_of_yojson (value_for_key string__of_yojson "previousAutoRetry") _list path;
   }
    : auto_retry_config)

let invalid_input_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_input_exception)

let non_empty_string_of_yojson = string_of_yojson

let build_not_deleted_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key non_empty_string_of_yojson "id") _list path;
     status_code = option_of_yojson (value_for_key string__of_yojson "statusCode") _list path;
   }
    : build_not_deleted)

let builds_not_deleted_of_yojson tree path = list_of_yojson build_not_deleted_of_yojson tree path
let build_ids_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path

let batch_delete_builds_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     builds_deleted =
       option_of_yojson (value_for_key build_ids_of_yojson "buildsDeleted") _list path;
     builds_not_deleted =
       option_of_yojson (value_for_key builds_not_deleted_of_yojson "buildsNotDeleted") _list path;
   }
    : batch_delete_builds_output)

let batch_delete_builds_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ids = value_for_key build_ids_of_yojson "ids" _list path } : batch_delete_builds_input)

let build_batch_ids_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path
let build_report_arns_of_yojson tree path = list_of_yojson string__of_yojson tree path
let wrapper_boolean_of_yojson = bool_of_yojson

let resolved_artifact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key artifacts_type_of_yojson "type") _list path;
     location = option_of_yojson (value_for_key string__of_yojson "location") _list path;
     identifier = option_of_yojson (value_for_key string__of_yojson "identifier") _list path;
   }
    : resolved_artifact)

let resolved_secondary_artifacts_of_yojson tree path =
  list_of_yojson resolved_artifact_of_yojson tree path

let status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String "FAULT" -> FAULT
    | `String "TIMED_OUT" -> TIMED_OUT
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "STOPPED" -> STOPPED
    | `String value -> raise (deserialize_unknown_enum_value_error path "StatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "StatusType")
     : status_type)
    : status_type)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let build_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     requested_on = option_of_yojson (value_for_key timestamp_of_yojson "requestedOn") _list path;
     build_status = option_of_yojson (value_for_key status_type_of_yojson "buildStatus") _list path;
     primary_artifact =
       option_of_yojson (value_for_key resolved_artifact_of_yojson "primaryArtifact") _list path;
     secondary_artifacts =
       option_of_yojson
         (value_for_key resolved_secondary_artifacts_of_yojson "secondaryArtifacts")
         _list path;
   }
    : build_summary)

let build_summaries_of_yojson tree path = list_of_yojson build_summary_of_yojson tree path
let boolean__of_yojson = bool_of_yojson
let identifiers_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path

let build_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identifier = option_of_yojson (value_for_key string__of_yojson "identifier") _list path;
     depends_on = option_of_yojson (value_for_key identifiers_of_yojson "dependsOn") _list path;
     ignore_failure = option_of_yojson (value_for_key boolean__of_yojson "ignoreFailure") _list path;
     current_build_summary =
       option_of_yojson (value_for_key build_summary_of_yojson "currentBuildSummary") _list path;
     prior_build_summary_list =
       option_of_yojson (value_for_key build_summaries_of_yojson "priorBuildSummaryList") _list path;
   }
    : build_group)

let build_groups_of_yojson tree path = list_of_yojson build_group_of_yojson tree path

let batch_report_mode_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "REPORT_INDIVIDUAL_BUILDS" -> REPORT_INDIVIDUAL_BUILDS
    | `String "REPORT_AGGREGATED_BATCH" -> REPORT_AGGREGATED_BATCH
    | `String value -> raise (deserialize_unknown_enum_value_error path "BatchReportModeType" value)
    | _ -> raise (deserialize_wrong_type_error path "BatchReportModeType")
     : batch_report_mode_type)
    : batch_report_mode_type)

let fleets_allowed_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path
let compute_types_allowed_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path

let batch_restrictions_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     maximum_builds_allowed =
       option_of_yojson (value_for_key wrapper_int_of_yojson "maximumBuildsAllowed") _list path;
     compute_types_allowed =
       option_of_yojson
         (value_for_key compute_types_allowed_of_yojson "computeTypesAllowed")
         _list path;
     fleets_allowed =
       option_of_yojson (value_for_key fleets_allowed_of_yojson "fleetsAllowed") _list path;
   }
    : batch_restrictions)

let project_build_batch_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_role =
       option_of_yojson (value_for_key non_empty_string_of_yojson "serviceRole") _list path;
     combine_artifacts =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "combineArtifacts") _list path;
     restrictions =
       option_of_yojson (value_for_key batch_restrictions_of_yojson "restrictions") _list path;
     timeout_in_mins =
       option_of_yojson (value_for_key wrapper_int_of_yojson "timeoutInMins") _list path;
     batch_report_mode =
       option_of_yojson
         (value_for_key batch_report_mode_type_of_yojson "batchReportMode")
         _list path;
   }
    : project_build_batch_config)

let file_system_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EFS" -> EFS
    | `String value -> raise (deserialize_unknown_enum_value_error path "FileSystemType" value)
    | _ -> raise (deserialize_wrong_type_error path "FileSystemType")
     : file_system_type)
    : file_system_type)

let project_file_system_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key file_system_type_of_yojson "type") _list path;
     location = option_of_yojson (value_for_key string__of_yojson "location") _list path;
     mount_point = option_of_yojson (value_for_key string__of_yojson "mountPoint") _list path;
     identifier = option_of_yojson (value_for_key string__of_yojson "identifier") _list path;
     mount_options = option_of_yojson (value_for_key string__of_yojson "mountOptions") _list path;
   }
    : project_file_system_location)

let project_file_system_locations_of_yojson tree path =
  list_of_yojson project_file_system_location_of_yojson tree path

let wrapper_long_of_yojson = long_of_yojson
let security_group_ids_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path
let subnets_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path

let vpc_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_id = option_of_yojson (value_for_key non_empty_string_of_yojson "vpcId") _list path;
     subnets = option_of_yojson (value_for_key subnets_of_yojson "subnets") _list path;
     security_group_ids =
       option_of_yojson (value_for_key security_group_ids_of_yojson "securityGroupIds") _list path;
   }
    : vpc_config)

let bucket_owner_access_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "READ_ONLY" -> READ_ONLY
    | `String "FULL" -> FULL
    | `String value -> raise (deserialize_unknown_enum_value_error path "BucketOwnerAccess" value)
    | _ -> raise (deserialize_wrong_type_error path "BucketOwnerAccess")
     : bucket_owner_access)
    : bucket_owner_access)

let logs_config_status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LogsConfigStatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "LogsConfigStatusType")
     : logs_config_status_type)
    : logs_config_status_type)

let s3_logs_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key logs_config_status_type_of_yojson "status" _list path;
     location = option_of_yojson (value_for_key string__of_yojson "location") _list path;
     encryption_disabled =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "encryptionDisabled") _list path;
     bucket_owner_access =
       option_of_yojson (value_for_key bucket_owner_access_of_yojson "bucketOwnerAccess") _list path;
   }
    : s3_logs_config)

let cloud_watch_logs_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key logs_config_status_type_of_yojson "status" _list path;
     group_name = option_of_yojson (value_for_key string__of_yojson "groupName") _list path;
     stream_name = option_of_yojson (value_for_key string__of_yojson "streamName") _list path;
   }
    : cloud_watch_logs_config)

let logs_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_watch_logs =
       option_of_yojson
         (value_for_key cloud_watch_logs_config_of_yojson "cloudWatchLogs")
         _list path;
     s3_logs = option_of_yojson (value_for_key s3_logs_config_of_yojson "s3Logs") _list path;
   }
    : logs_config)

let host_kernel_of_yojson (tree : t) path =
  ((match tree with
    | `String "LINUX_KERNEL_4" -> LINUX_KERNEL_4
    | `String "LINUX_KERNEL_6" -> LINUX_KERNEL_6
    | `String "LINUX_KERNEL_LATEST" -> LINUX_KERNEL_LATEST
    | `String value -> raise (deserialize_unknown_enum_value_error path "HostKernel" value)
    | _ -> raise (deserialize_wrong_type_error path "HostKernel")
     : host_kernel)
    : host_kernel)

let docker_server_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : docker_server_status)

let compute_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BUILD_GENERAL1_SMALL" -> BUILD_GENERAL1_SMALL
    | `String "BUILD_GENERAL1_MEDIUM" -> BUILD_GENERAL1_MEDIUM
    | `String "BUILD_GENERAL1_LARGE" -> BUILD_GENERAL1_LARGE
    | `String "BUILD_GENERAL1_XLARGE" -> BUILD_GENERAL1_XLARGE
    | `String "BUILD_GENERAL1_2XLARGE" -> BUILD_GENERAL1_2XLARGE
    | `String "BUILD_LAMBDA_1GB" -> BUILD_LAMBDA_1GB
    | `String "BUILD_LAMBDA_2GB" -> BUILD_LAMBDA_2GB
    | `String "BUILD_LAMBDA_4GB" -> BUILD_LAMBDA_4GB
    | `String "BUILD_LAMBDA_8GB" -> BUILD_LAMBDA_8GB
    | `String "BUILD_LAMBDA_10GB" -> BUILD_LAMBDA_10GB
    | `String "ATTRIBUTE_BASED_COMPUTE" -> ATTRIBUTE_BASED_COMPUTE
    | `String "CUSTOM_INSTANCE_TYPE" -> CUSTOM_INSTANCE_TYPE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComputeType" value)
    | _ -> raise (deserialize_wrong_type_error path "ComputeType")
     : compute_type)
    : compute_type)

let docker_server_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compute_type = value_for_key compute_type_of_yojson "computeType" _list path;
     security_group_ids =
       option_of_yojson (value_for_key security_group_ids_of_yojson "securityGroupIds") _list path;
     status = option_of_yojson (value_for_key docker_server_status_of_yojson "status") _list path;
   }
    : docker_server)

let image_pull_credentials_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CODEBUILD" -> CODEBUILD
    | `String "SERVICE_ROLE" -> SERVICE_ROLE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ImagePullCredentialsType" value)
    | _ -> raise (deserialize_wrong_type_error path "ImagePullCredentialsType")
     : image_pull_credentials_type)
    : image_pull_credentials_type)

let credential_provider_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SECRETS_MANAGER" -> SECRETS_MANAGER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CredentialProviderType" value)
    | _ -> raise (deserialize_wrong_type_error path "CredentialProviderType")
     : credential_provider_type)
    : credential_provider_type)

let registry_credential_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     credential = value_for_key non_empty_string_of_yojson "credential" _list path;
     credential_provider =
       value_for_key credential_provider_type_of_yojson "credentialProvider" _list path;
   }
    : registry_credential)

let environment_variable_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PLAINTEXT" -> PLAINTEXT
    | `String "PARAMETER_STORE" -> PARAMETER_STORE
    | `String "SECRETS_MANAGER" -> SECRETS_MANAGER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EnvironmentVariableType" value)
    | _ -> raise (deserialize_wrong_type_error path "EnvironmentVariableType")
     : environment_variable_type)
    : environment_variable_type)

let environment_variable_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key non_empty_string_of_yojson "name" _list path;
     value = value_for_key string__of_yojson "value" _list path;
     type_ = option_of_yojson (value_for_key environment_variable_type_of_yojson "type") _list path;
   }
    : environment_variable)

let environment_variables_of_yojson tree path =
  list_of_yojson environment_variable_of_yojson tree path

let project_fleet_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fleet_arn = option_of_yojson (value_for_key string__of_yojson "fleetArn") _list path }
    : project_fleet)

let machine_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "GENERAL" -> GENERAL
    | `String "NVME" -> NVME
    | `String value -> raise (deserialize_unknown_enum_value_error path "MachineType" value)
    | _ -> raise (deserialize_wrong_type_error path "MachineType")
     : machine_type)
    : machine_type)

let compute_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     v_cpu = option_of_yojson (value_for_key wrapper_long_of_yojson "vCpu") _list path;
     memory = option_of_yojson (value_for_key wrapper_long_of_yojson "memory") _list path;
     disk = option_of_yojson (value_for_key wrapper_long_of_yojson "disk") _list path;
     machine_type = option_of_yojson (value_for_key machine_type_of_yojson "machineType") _list path;
     instance_type =
       option_of_yojson (value_for_key non_empty_string_of_yojson "instanceType") _list path;
   }
    : compute_configuration)

let environment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "WINDOWS_CONTAINER" -> WINDOWS_CONTAINER
    | `String "LINUX_CONTAINER" -> LINUX_CONTAINER
    | `String "LINUX_GPU_CONTAINER" -> LINUX_GPU_CONTAINER
    | `String "ARM_CONTAINER" -> ARM_CONTAINER
    | `String "WINDOWS_SERVER_2019_CONTAINER" -> WINDOWS_SERVER_2019_CONTAINER
    | `String "WINDOWS_SERVER_2022_CONTAINER" -> WINDOWS_SERVER_2022_CONTAINER
    | `String "LINUX_LAMBDA_CONTAINER" -> LINUX_LAMBDA_CONTAINER
    | `String "ARM_LAMBDA_CONTAINER" -> ARM_LAMBDA_CONTAINER
    | `String "LINUX_EC2" -> LINUX_EC2
    | `String "ARM_EC2" -> ARM_EC2
    | `String "WINDOWS_EC2" -> WINDOWS_EC2
    | `String "MAC_ARM" -> MAC_ARM
    | `String value -> raise (deserialize_unknown_enum_value_error path "EnvironmentType" value)
    | _ -> raise (deserialize_wrong_type_error path "EnvironmentType")
     : environment_type)
    : environment_type)

let project_environment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key environment_type_of_yojson "type" _list path;
     image = value_for_key non_empty_string_of_yojson "image" _list path;
     compute_type = value_for_key compute_type_of_yojson "computeType" _list path;
     compute_configuration =
       option_of_yojson
         (value_for_key compute_configuration_of_yojson "computeConfiguration")
         _list path;
     fleet = option_of_yojson (value_for_key project_fleet_of_yojson "fleet") _list path;
     environment_variables =
       option_of_yojson
         (value_for_key environment_variables_of_yojson "environmentVariables")
         _list path;
     privileged_mode =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "privilegedMode") _list path;
     certificate = option_of_yojson (value_for_key string__of_yojson "certificate") _list path;
     registry_credential =
       option_of_yojson
         (value_for_key registry_credential_of_yojson "registryCredential")
         _list path;
     image_pull_credentials_type =
       option_of_yojson
         (value_for_key image_pull_credentials_type_of_yojson "imagePullCredentialsType")
         _list path;
     docker_server =
       option_of_yojson (value_for_key docker_server_of_yojson "dockerServer") _list path;
     host_kernel = option_of_yojson (value_for_key host_kernel_of_yojson "hostKernel") _list path;
   }
    : project_environment)

let cache_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "LOCAL_DOCKER_LAYER_CACHE" -> LOCAL_DOCKER_LAYER_CACHE
    | `String "LOCAL_SOURCE_CACHE" -> LOCAL_SOURCE_CACHE
    | `String "LOCAL_CUSTOM_CACHE" -> LOCAL_CUSTOM_CACHE
    | `String value -> raise (deserialize_unknown_enum_value_error path "CacheMode" value)
    | _ -> raise (deserialize_wrong_type_error path "CacheMode")
     : cache_mode)
    : cache_mode)

let project_cache_modes_of_yojson tree path = list_of_yojson cache_mode_of_yojson tree path

let cache_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NO_CACHE" -> NO_CACHE
    | `String "S3" -> S3
    | `String "LOCAL" -> LOCAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "CacheType" value)
    | _ -> raise (deserialize_wrong_type_error path "CacheType")
     : cache_type)
    : cache_type)

let project_cache_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key cache_type_of_yojson "type" _list path;
     location = option_of_yojson (value_for_key string__of_yojson "location") _list path;
     modes = option_of_yojson (value_for_key project_cache_modes_of_yojson "modes") _list path;
     cache_namespace =
       option_of_yojson (value_for_key string__of_yojson "cacheNamespace") _list path;
   }
    : project_cache)

let build_artifacts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location = option_of_yojson (value_for_key string__of_yojson "location") _list path;
     sha256sum = option_of_yojson (value_for_key string__of_yojson "sha256sum") _list path;
     md5sum = option_of_yojson (value_for_key string__of_yojson "md5sum") _list path;
     override_artifact_name =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "overrideArtifactName") _list path;
     encryption_disabled =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "encryptionDisabled") _list path;
     artifact_identifier =
       option_of_yojson (value_for_key string__of_yojson "artifactIdentifier") _list path;
     bucket_owner_access =
       option_of_yojson (value_for_key bucket_owner_access_of_yojson "bucketOwnerAccess") _list path;
   }
    : build_artifacts)

let build_artifacts_list_of_yojson tree path = list_of_yojson build_artifacts_of_yojson tree path

let project_source_version_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_identifier = value_for_key string__of_yojson "sourceIdentifier" _list path;
     source_version = value_for_key string__of_yojson "sourceVersion" _list path;
   }
    : project_source_version)

let project_secondary_source_versions_of_yojson tree path =
  list_of_yojson project_source_version_of_yojson tree path

let build_status_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     context = option_of_yojson (value_for_key string__of_yojson "context") _list path;
     target_url = option_of_yojson (value_for_key string__of_yojson "targetUrl") _list path;
   }
    : build_status_config)

let source_auth_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "OAUTH" -> OAUTH
    | `String "CODECONNECTIONS" -> CODECONNECTIONS
    | `String "SECRETS_MANAGER" -> SECRETS_MANAGER
    | `String value -> raise (deserialize_unknown_enum_value_error path "SourceAuthType" value)
    | _ -> raise (deserialize_wrong_type_error path "SourceAuthType")
     : source_auth_type)
    : source_auth_type)

let source_auth_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key source_auth_type_of_yojson "type" _list path;
     resource = option_of_yojson (value_for_key string__of_yojson "resource") _list path;
   }
    : source_auth)

let git_submodules_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fetch_submodules = value_for_key wrapper_boolean_of_yojson "fetchSubmodules" _list path }
    : git_submodules_config)

let git_clone_depth_of_yojson = int_of_yojson

let source_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CODECOMMIT" -> CODECOMMIT
    | `String "CODEPIPELINE" -> CODEPIPELINE
    | `String "GITHUB" -> GITHUB
    | `String "GITLAB" -> GITLAB
    | `String "GITLAB_SELF_MANAGED" -> GITLAB_SELF_MANAGED
    | `String "S3" -> S3
    | `String "BITBUCKET" -> BITBUCKET
    | `String "GITHUB_ENTERPRISE" -> GITHUB_ENTERPRISE
    | `String "NO_SOURCE" -> NO_SOURCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "SourceType")
     : source_type)
    : source_type)

let project_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key source_type_of_yojson "type" _list path;
     location = option_of_yojson (value_for_key string__of_yojson "location") _list path;
     git_clone_depth =
       option_of_yojson (value_for_key git_clone_depth_of_yojson "gitCloneDepth") _list path;
     git_submodules_config =
       option_of_yojson
         (value_for_key git_submodules_config_of_yojson "gitSubmodulesConfig")
         _list path;
     buildspec = option_of_yojson (value_for_key string__of_yojson "buildspec") _list path;
     auth = option_of_yojson (value_for_key source_auth_of_yojson "auth") _list path;
     report_build_status =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "reportBuildStatus") _list path;
     build_status_config =
       option_of_yojson (value_for_key build_status_config_of_yojson "buildStatusConfig") _list path;
     insecure_ssl =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "insecureSsl") _list path;
     source_identifier =
       option_of_yojson (value_for_key string__of_yojson "sourceIdentifier") _list path;
   }
    : project_source)

let project_sources_of_yojson tree path = list_of_yojson project_source_of_yojson tree path

let phase_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_code = option_of_yojson (value_for_key string__of_yojson "statusCode") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : phase_context)

let phase_contexts_of_yojson tree path = list_of_yojson phase_context_of_yojson tree path

let build_batch_phase_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUBMITTED" -> SUBMITTED
    | `String "DOWNLOAD_BATCHSPEC" -> DOWNLOAD_BATCHSPEC
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "COMBINE_ARTIFACTS" -> COMBINE_ARTIFACTS
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String "STOPPED" -> STOPPED
    | `String value -> raise (deserialize_unknown_enum_value_error path "BuildBatchPhaseType" value)
    | _ -> raise (deserialize_wrong_type_error path "BuildBatchPhaseType")
     : build_batch_phase_type)
    : build_batch_phase_type)

let build_batch_phase_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     phase_type =
       option_of_yojson (value_for_key build_batch_phase_type_of_yojson "phaseType") _list path;
     phase_status = option_of_yojson (value_for_key status_type_of_yojson "phaseStatus") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     duration_in_seconds =
       option_of_yojson (value_for_key wrapper_long_of_yojson "durationInSeconds") _list path;
     contexts = option_of_yojson (value_for_key phase_contexts_of_yojson "contexts") _list path;
   }
    : build_batch_phase)

let build_batch_phases_of_yojson tree path = list_of_yojson build_batch_phase_of_yojson tree path

let build_batch_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key non_empty_string_of_yojson "id") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     current_phase = option_of_yojson (value_for_key string__of_yojson "currentPhase") _list path;
     build_batch_status =
       option_of_yojson (value_for_key status_type_of_yojson "buildBatchStatus") _list path;
     source_version =
       option_of_yojson (value_for_key non_empty_string_of_yojson "sourceVersion") _list path;
     resolved_source_version =
       option_of_yojson
         (value_for_key non_empty_string_of_yojson "resolvedSourceVersion")
         _list path;
     project_name =
       option_of_yojson (value_for_key non_empty_string_of_yojson "projectName") _list path;
     phases = option_of_yojson (value_for_key build_batch_phases_of_yojson "phases") _list path;
     source = option_of_yojson (value_for_key project_source_of_yojson "source") _list path;
     secondary_sources =
       option_of_yojson (value_for_key project_sources_of_yojson "secondarySources") _list path;
     secondary_source_versions =
       option_of_yojson
         (value_for_key project_secondary_source_versions_of_yojson "secondarySourceVersions")
         _list path;
     artifacts = option_of_yojson (value_for_key build_artifacts_of_yojson "artifacts") _list path;
     secondary_artifacts =
       option_of_yojson
         (value_for_key build_artifacts_list_of_yojson "secondaryArtifacts")
         _list path;
     cache = option_of_yojson (value_for_key project_cache_of_yojson "cache") _list path;
     environment =
       option_of_yojson (value_for_key project_environment_of_yojson "environment") _list path;
     service_role =
       option_of_yojson (value_for_key non_empty_string_of_yojson "serviceRole") _list path;
     log_config = option_of_yojson (value_for_key logs_config_of_yojson "logConfig") _list path;
     build_timeout_in_minutes =
       option_of_yojson (value_for_key wrapper_int_of_yojson "buildTimeoutInMinutes") _list path;
     queued_timeout_in_minutes =
       option_of_yojson (value_for_key wrapper_int_of_yojson "queuedTimeoutInMinutes") _list path;
     complete = option_of_yojson (value_for_key boolean__of_yojson "complete") _list path;
     initiator = option_of_yojson (value_for_key string__of_yojson "initiator") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "vpcConfig") _list path;
     encryption_key =
       option_of_yojson (value_for_key non_empty_string_of_yojson "encryptionKey") _list path;
     build_batch_number =
       option_of_yojson (value_for_key wrapper_long_of_yojson "buildBatchNumber") _list path;
     file_system_locations =
       option_of_yojson
         (value_for_key project_file_system_locations_of_yojson "fileSystemLocations")
         _list path;
     build_batch_config =
       option_of_yojson
         (value_for_key project_build_batch_config_of_yojson "buildBatchConfig")
         _list path;
     build_groups = option_of_yojson (value_for_key build_groups_of_yojson "buildGroups") _list path;
     debug_session_enabled =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "debugSessionEnabled") _list path;
     report_arns =
       option_of_yojson (value_for_key build_report_arns_of_yojson "reportArns") _list path;
   }
    : build_batch)

let build_batches_of_yojson tree path = list_of_yojson build_batch_of_yojson tree path

let batch_get_build_batches_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     build_batches =
       option_of_yojson (value_for_key build_batches_of_yojson "buildBatches") _list path;
     build_batches_not_found =
       option_of_yojson (value_for_key build_batch_ids_of_yojson "buildBatchesNotFound") _list path;
   }
    : batch_get_build_batches_output)

let batch_get_build_batches_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ids = value_for_key build_batch_ids_of_yojson "ids" _list path }
    : batch_get_build_batches_input)

let debug_session_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_enabled =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "sessionEnabled") _list path;
     session_target =
       option_of_yojson (value_for_key non_empty_string_of_yojson "sessionTarget") _list path;
   }
    : debug_session)

let exported_environment_variable_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key non_empty_string_of_yojson "name") _list path;
     value = option_of_yojson (value_for_key string__of_yojson "value") _list path;
   }
    : exported_environment_variable)

let exported_environment_variables_of_yojson tree path =
  list_of_yojson exported_environment_variable_of_yojson tree path

let network_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_id = option_of_yojson (value_for_key non_empty_string_of_yojson "subnetId") _list path;
     network_interface_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "networkInterfaceId") _list path;
   }
    : network_interface)

let logs_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_name = option_of_yojson (value_for_key string__of_yojson "groupName") _list path;
     stream_name = option_of_yojson (value_for_key string__of_yojson "streamName") _list path;
     deep_link = option_of_yojson (value_for_key string__of_yojson "deepLink") _list path;
     s3_deep_link = option_of_yojson (value_for_key string__of_yojson "s3DeepLink") _list path;
     cloud_watch_logs_arn =
       option_of_yojson (value_for_key string__of_yojson "cloudWatchLogsArn") _list path;
     s3_logs_arn = option_of_yojson (value_for_key string__of_yojson "s3LogsArn") _list path;
     cloud_watch_logs =
       option_of_yojson
         (value_for_key cloud_watch_logs_config_of_yojson "cloudWatchLogs")
         _list path;
     s3_logs = option_of_yojson (value_for_key s3_logs_config_of_yojson "s3Logs") _list path;
   }
    : logs_location)

let build_phase_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUBMITTED" -> SUBMITTED
    | `String "QUEUED" -> QUEUED
    | `String "PROVISIONING" -> PROVISIONING
    | `String "DOWNLOAD_SOURCE" -> DOWNLOAD_SOURCE
    | `String "INSTALL" -> INSTALL
    | `String "PRE_BUILD" -> PRE_BUILD
    | `String "BUILD" -> BUILD
    | `String "POST_BUILD" -> POST_BUILD
    | `String "UPLOAD_ARTIFACTS" -> UPLOAD_ARTIFACTS
    | `String "FINALIZING" -> FINALIZING
    | `String "COMPLETED" -> COMPLETED
    | `String value -> raise (deserialize_unknown_enum_value_error path "BuildPhaseType" value)
    | _ -> raise (deserialize_wrong_type_error path "BuildPhaseType")
     : build_phase_type)
    : build_phase_type)

let build_phase_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     phase_type = option_of_yojson (value_for_key build_phase_type_of_yojson "phaseType") _list path;
     phase_status = option_of_yojson (value_for_key status_type_of_yojson "phaseStatus") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     duration_in_seconds =
       option_of_yojson (value_for_key wrapper_long_of_yojson "durationInSeconds") _list path;
     contexts = option_of_yojson (value_for_key phase_contexts_of_yojson "contexts") _list path;
   }
    : build_phase)

let build_phases_of_yojson tree path = list_of_yojson build_phase_of_yojson tree path

let build_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key non_empty_string_of_yojson "id") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     build_number = option_of_yojson (value_for_key wrapper_long_of_yojson "buildNumber") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     current_phase = option_of_yojson (value_for_key string__of_yojson "currentPhase") _list path;
     build_status = option_of_yojson (value_for_key status_type_of_yojson "buildStatus") _list path;
     source_version =
       option_of_yojson (value_for_key non_empty_string_of_yojson "sourceVersion") _list path;
     resolved_source_version =
       option_of_yojson
         (value_for_key non_empty_string_of_yojson "resolvedSourceVersion")
         _list path;
     project_name =
       option_of_yojson (value_for_key non_empty_string_of_yojson "projectName") _list path;
     phases = option_of_yojson (value_for_key build_phases_of_yojson "phases") _list path;
     source = option_of_yojson (value_for_key project_source_of_yojson "source") _list path;
     secondary_sources =
       option_of_yojson (value_for_key project_sources_of_yojson "secondarySources") _list path;
     secondary_source_versions =
       option_of_yojson
         (value_for_key project_secondary_source_versions_of_yojson "secondarySourceVersions")
         _list path;
     artifacts = option_of_yojson (value_for_key build_artifacts_of_yojson "artifacts") _list path;
     secondary_artifacts =
       option_of_yojson
         (value_for_key build_artifacts_list_of_yojson "secondaryArtifacts")
         _list path;
     cache = option_of_yojson (value_for_key project_cache_of_yojson "cache") _list path;
     environment =
       option_of_yojson (value_for_key project_environment_of_yojson "environment") _list path;
     service_role =
       option_of_yojson (value_for_key non_empty_string_of_yojson "serviceRole") _list path;
     logs = option_of_yojson (value_for_key logs_location_of_yojson "logs") _list path;
     timeout_in_minutes =
       option_of_yojson (value_for_key wrapper_int_of_yojson "timeoutInMinutes") _list path;
     queued_timeout_in_minutes =
       option_of_yojson (value_for_key wrapper_int_of_yojson "queuedTimeoutInMinutes") _list path;
     build_complete = option_of_yojson (value_for_key boolean__of_yojson "buildComplete") _list path;
     initiator = option_of_yojson (value_for_key string__of_yojson "initiator") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "vpcConfig") _list path;
     network_interface =
       option_of_yojson (value_for_key network_interface_of_yojson "networkInterface") _list path;
     encryption_key =
       option_of_yojson (value_for_key non_empty_string_of_yojson "encryptionKey") _list path;
     exported_environment_variables =
       option_of_yojson
         (value_for_key exported_environment_variables_of_yojson "exportedEnvironmentVariables")
         _list path;
     report_arns =
       option_of_yojson (value_for_key build_report_arns_of_yojson "reportArns") _list path;
     file_system_locations =
       option_of_yojson
         (value_for_key project_file_system_locations_of_yojson "fileSystemLocations")
         _list path;
     debug_session =
       option_of_yojson (value_for_key debug_session_of_yojson "debugSession") _list path;
     build_batch_arn = option_of_yojson (value_for_key string__of_yojson "buildBatchArn") _list path;
     auto_retry_config =
       option_of_yojson (value_for_key auto_retry_config_of_yojson "autoRetryConfig") _list path;
   }
    : build)

let builds_of_yojson tree path = list_of_yojson build_of_yojson tree path

let batch_get_builds_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     builds = option_of_yojson (value_for_key builds_of_yojson "builds") _list path;
     builds_not_found =
       option_of_yojson (value_for_key build_ids_of_yojson "buildsNotFound") _list path;
   }
    : batch_get_builds_output)

let batch_get_builds_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ids = value_for_key build_ids_of_yojson "ids" _list path } : batch_get_builds_input)

let command_execution_ids_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path
let sensitive_non_empty_string_of_yojson = string_of_yojson

let command_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SHELL" -> SHELL
    | `String value -> raise (deserialize_unknown_enum_value_error path "CommandType" value)
    | _ -> raise (deserialize_wrong_type_error path "CommandType")
     : command_type)
    : command_type)

let command_execution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key non_empty_string_of_yojson "id") _list path;
     sandbox_id = option_of_yojson (value_for_key non_empty_string_of_yojson "sandboxId") _list path;
     submit_time = option_of_yojson (value_for_key timestamp_of_yojson "submitTime") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     status = option_of_yojson (value_for_key non_empty_string_of_yojson "status") _list path;
     command =
       option_of_yojson (value_for_key sensitive_non_empty_string_of_yojson "command") _list path;
     type_ = option_of_yojson (value_for_key command_type_of_yojson "type") _list path;
     exit_code = option_of_yojson (value_for_key non_empty_string_of_yojson "exitCode") _list path;
     standard_output_content =
       option_of_yojson
         (value_for_key sensitive_non_empty_string_of_yojson "standardOutputContent")
         _list path;
     standard_err_content =
       option_of_yojson
         (value_for_key sensitive_non_empty_string_of_yojson "standardErrContent")
         _list path;
     logs = option_of_yojson (value_for_key logs_location_of_yojson "logs") _list path;
     sandbox_arn =
       option_of_yojson (value_for_key non_empty_string_of_yojson "sandboxArn") _list path;
   }
    : command_execution)

let command_executions_of_yojson tree path = list_of_yojson command_execution_of_yojson tree path

let batch_get_command_executions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     command_executions =
       option_of_yojson (value_for_key command_executions_of_yojson "commandExecutions") _list path;
     command_executions_not_found =
       option_of_yojson
         (value_for_key command_execution_ids_of_yojson "commandExecutionsNotFound")
         _list path;
   }
    : batch_get_command_executions_output)

let batch_get_command_executions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sandbox_id = value_for_key non_empty_string_of_yojson "sandboxId" _list path;
     command_execution_ids =
       value_for_key command_execution_ids_of_yojson "commandExecutionIds" _list path;
   }
    : batch_get_command_executions_input)

let fleet_names_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path
let value_input_of_yojson = string_of_yojson
let key_input_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key key_input_of_yojson "key") _list path;
     value = option_of_yojson (value_for_key value_input_of_yojson "value") _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let fleet_proxy_rule_entities_of_yojson tree path = list_of_yojson string__of_yojson tree path

let fleet_proxy_rule_effect_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALLOW" -> ALLOW
    | `String "DENY" -> DENY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FleetProxyRuleEffectType" value)
    | _ -> raise (deserialize_wrong_type_error path "FleetProxyRuleEffectType")
     : fleet_proxy_rule_effect_type)
    : fleet_proxy_rule_effect_type)

let fleet_proxy_rule_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DOMAIN" -> DOMAIN
    | `String "IP" -> IP
    | `String value -> raise (deserialize_unknown_enum_value_error path "FleetProxyRuleType" value)
    | _ -> raise (deserialize_wrong_type_error path "FleetProxyRuleType")
     : fleet_proxy_rule_type)
    : fleet_proxy_rule_type)

let fleet_proxy_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key fleet_proxy_rule_type_of_yojson "type" _list path;
     effect_ = value_for_key fleet_proxy_rule_effect_type_of_yojson "effect" _list path;
     entities = value_for_key fleet_proxy_rule_entities_of_yojson "entities" _list path;
   }
    : fleet_proxy_rule)

let fleet_proxy_rules_of_yojson tree path = list_of_yojson fleet_proxy_rule_of_yojson tree path

let fleet_proxy_rule_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALLOW_ALL" -> ALLOW_ALL
    | `String "DENY_ALL" -> DENY_ALL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FleetProxyRuleBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "FleetProxyRuleBehavior")
     : fleet_proxy_rule_behavior)
    : fleet_proxy_rule_behavior)

let proxy_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_behavior =
       option_of_yojson
         (value_for_key fleet_proxy_rule_behavior_of_yojson "defaultBehavior")
         _list path;
     ordered_proxy_rules =
       option_of_yojson (value_for_key fleet_proxy_rules_of_yojson "orderedProxyRules") _list path;
   }
    : proxy_configuration)

let fleet_overflow_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "QUEUE" -> QUEUE
    | `String "ON_DEMAND" -> ON_DEMAND
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FleetOverflowBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "FleetOverflowBehavior")
     : fleet_overflow_behavior)
    : fleet_overflow_behavior)

let fleet_capacity_of_yojson = int_of_yojson
let wrapper_double_of_yojson = double_of_yojson

let fleet_scaling_metric_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FLEET_UTILIZATION_RATE" -> FLEET_UTILIZATION_RATE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FleetScalingMetricType" value)
    | _ -> raise (deserialize_wrong_type_error path "FleetScalingMetricType")
     : fleet_scaling_metric_type)
    : fleet_scaling_metric_type)

let target_tracking_scaling_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_type =
       option_of_yojson (value_for_key fleet_scaling_metric_type_of_yojson "metricType") _list path;
     target_value =
       option_of_yojson (value_for_key wrapper_double_of_yojson "targetValue") _list path;
   }
    : target_tracking_scaling_configuration)

let target_tracking_scaling_configurations_of_yojson tree path =
  list_of_yojson target_tracking_scaling_configuration_of_yojson tree path

let fleet_scaling_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TARGET_TRACKING_SCALING" -> TARGET_TRACKING_SCALING
    | `String value -> raise (deserialize_unknown_enum_value_error path "FleetScalingType" value)
    | _ -> raise (deserialize_wrong_type_error path "FleetScalingType")
     : fleet_scaling_type)
    : fleet_scaling_type)

let scaling_configuration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scaling_type =
       option_of_yojson (value_for_key fleet_scaling_type_of_yojson "scalingType") _list path;
     target_tracking_scaling_configs =
       option_of_yojson
         (value_for_key target_tracking_scaling_configurations_of_yojson
            "targetTrackingScalingConfigs")
         _list path;
     max_capacity =
       option_of_yojson (value_for_key fleet_capacity_of_yojson "maxCapacity") _list path;
     desired_capacity =
       option_of_yojson (value_for_key fleet_capacity_of_yojson "desiredCapacity") _list path;
   }
    : scaling_configuration_output)

let fleet_context_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "ACTION_REQUIRED" -> ACTION_REQUIRED
    | `String "PENDING_DELETION" -> PENDING_DELETION
    | `String "INSUFFICIENT_CAPACITY" -> INSUFFICIENT_CAPACITY
    | `String value -> raise (deserialize_unknown_enum_value_error path "FleetContextCode" value)
    | _ -> raise (deserialize_wrong_type_error path "FleetContextCode")
     : fleet_context_code)
    : fleet_context_code)

let fleet_status_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "UPDATING" -> UPDATING
    | `String "ROTATING" -> ROTATING
    | `String "PENDING_DELETION" -> PENDING_DELETION
    | `String "DELETING" -> DELETING
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "UPDATE_ROLLBACK_FAILED" -> UPDATE_ROLLBACK_FAILED
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "FleetStatusCode" value)
    | _ -> raise (deserialize_wrong_type_error path "FleetStatusCode")
     : fleet_status_code)
    : fleet_status_code)

let fleet_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_code =
       option_of_yojson (value_for_key fleet_status_code_of_yojson "statusCode") _list path;
     context = option_of_yojson (value_for_key fleet_context_code_of_yojson "context") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : fleet_status)

let fleet_name_of_yojson = string_of_yojson

let fleet_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key fleet_name_of_yojson "name") _list path;
     id = option_of_yojson (value_for_key non_empty_string_of_yojson "id") _list path;
     created = option_of_yojson (value_for_key timestamp_of_yojson "created") _list path;
     last_modified = option_of_yojson (value_for_key timestamp_of_yojson "lastModified") _list path;
     status = option_of_yojson (value_for_key fleet_status_of_yojson "status") _list path;
     base_capacity =
       option_of_yojson (value_for_key fleet_capacity_of_yojson "baseCapacity") _list path;
     environment_type =
       option_of_yojson (value_for_key environment_type_of_yojson "environmentType") _list path;
     compute_type = option_of_yojson (value_for_key compute_type_of_yojson "computeType") _list path;
     compute_configuration =
       option_of_yojson
         (value_for_key compute_configuration_of_yojson "computeConfiguration")
         _list path;
     scaling_configuration =
       option_of_yojson
         (value_for_key scaling_configuration_output_of_yojson "scalingConfiguration")
         _list path;
     overflow_behavior =
       option_of_yojson
         (value_for_key fleet_overflow_behavior_of_yojson "overflowBehavior")
         _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "vpcConfig") _list path;
     proxy_configuration =
       option_of_yojson
         (value_for_key proxy_configuration_of_yojson "proxyConfiguration")
         _list path;
     image_id = option_of_yojson (value_for_key non_empty_string_of_yojson "imageId") _list path;
     fleet_service_role =
       option_of_yojson (value_for_key non_empty_string_of_yojson "fleetServiceRole") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : fleet)

let fleets_of_yojson tree path = list_of_yojson fleet_of_yojson tree path

let batch_get_fleets_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleets = option_of_yojson (value_for_key fleets_of_yojson "fleets") _list path;
     fleets_not_found =
       option_of_yojson (value_for_key fleet_names_of_yojson "fleetsNotFound") _list path;
   }
    : batch_get_fleets_output)

let batch_get_fleets_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ names = value_for_key fleet_names_of_yojson "names" _list path } : batch_get_fleets_input)

let project_names_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path

let project_visibility_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PUBLIC_READ" -> PUBLIC_READ
    | `String "PRIVATE" -> PRIVATE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProjectVisibilityType" value)
    | _ -> raise (deserialize_wrong_type_error path "ProjectVisibilityType")
     : project_visibility_type)
    : project_visibility_type)

let project_badge_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     badge_enabled = option_of_yojson (value_for_key boolean__of_yojson "badgeEnabled") _list path;
     badge_request_url =
       option_of_yojson (value_for_key string__of_yojson "badgeRequestUrl") _list path;
   }
    : project_badge)

let pull_request_build_approver_role_of_yojson (tree : t) path =
  ((match tree with
    | `String "GITHUB_READ" -> GITHUB_READ
    | `String "GITHUB_TRIAGE" -> GITHUB_TRIAGE
    | `String "GITHUB_WRITE" -> GITHUB_WRITE
    | `String "GITHUB_MAINTAIN" -> GITHUB_MAINTAIN
    | `String "GITHUB_ADMIN" -> GITHUB_ADMIN
    | `String "GITLAB_GUEST" -> GITLAB_GUEST
    | `String "GITLAB_PLANNER" -> GITLAB_PLANNER
    | `String "GITLAB_REPORTER" -> GITLAB_REPORTER
    | `String "GITLAB_DEVELOPER" -> GITLAB_DEVELOPER
    | `String "GITLAB_MAINTAINER" -> GITLAB_MAINTAINER
    | `String "GITLAB_OWNER" -> GITLAB_OWNER
    | `String "BITBUCKET_READ" -> BITBUCKET_READ
    | `String "BITBUCKET_WRITE" -> BITBUCKET_WRITE
    | `String "BITBUCKET_ADMIN" -> BITBUCKET_ADMIN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PullRequestBuildApproverRole" value)
    | _ -> raise (deserialize_wrong_type_error path "PullRequestBuildApproverRole")
     : pull_request_build_approver_role)
    : pull_request_build_approver_role)

let pull_request_build_approver_roles_of_yojson tree path =
  list_of_yojson pull_request_build_approver_role_of_yojson tree path

let pull_request_build_comment_approval_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ALL_PULL_REQUESTS" -> ALL_PULL_REQUESTS
    | `String "FORK_PULL_REQUESTS" -> FORK_PULL_REQUESTS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PullRequestBuildCommentApproval" value)
    | _ -> raise (deserialize_wrong_type_error path "PullRequestBuildCommentApproval")
     : pull_request_build_comment_approval)
    : pull_request_build_comment_approval)

let pull_request_build_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     requires_comment_approval =
       value_for_key pull_request_build_comment_approval_of_yojson "requiresCommentApproval" _list
         path;
     approver_roles =
       option_of_yojson
         (value_for_key pull_request_build_approver_roles_of_yojson "approverRoles")
         _list path;
   }
    : pull_request_build_policy)

let webhook_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETING" -> DELETING
    | `String value -> raise (deserialize_unknown_enum_value_error path "WebhookStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "WebhookStatus")
     : webhook_status)
    : webhook_status)

let webhook_scope_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "GITHUB_ORGANIZATION" -> GITHUB_ORGANIZATION
    | `String "GITHUB_GLOBAL" -> GITHUB_GLOBAL
    | `String "GITLAB_GROUP" -> GITLAB_GROUP
    | `String value -> raise (deserialize_unknown_enum_value_error path "WebhookScopeType" value)
    | _ -> raise (deserialize_wrong_type_error path "WebhookScopeType")
     : webhook_scope_type)
    : webhook_scope_type)

let scope_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key string__of_yojson "name" _list path;
     domain = option_of_yojson (value_for_key string__of_yojson "domain") _list path;
     scope = value_for_key webhook_scope_type_of_yojson "scope" _list path;
   }
    : scope_configuration)

let webhook_build_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BUILD" -> BUILD
    | `String "BUILD_BATCH" -> BUILD_BATCH
    | `String "RUNNER_BUILDKITE_BUILD" -> RUNNER_BUILDKITE_BUILD
    | `String value -> raise (deserialize_unknown_enum_value_error path "WebhookBuildType" value)
    | _ -> raise (deserialize_wrong_type_error path "WebhookBuildType")
     : webhook_build_type)
    : webhook_build_type)

let webhook_filter_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EVENT" -> EVENT
    | `String "BASE_REF" -> BASE_REF
    | `String "HEAD_REF" -> HEAD_REF
    | `String "ACTOR_ACCOUNT_ID" -> ACTOR_ACCOUNT_ID
    | `String "FILE_PATH" -> FILE_PATH
    | `String "COMMIT_MESSAGE" -> COMMIT_MESSAGE
    | `String "WORKFLOW_NAME" -> WORKFLOW_NAME
    | `String "TAG_NAME" -> TAG_NAME
    | `String "RELEASE_NAME" -> RELEASE_NAME
    | `String "REPOSITORY_NAME" -> REPOSITORY_NAME
    | `String "ORGANIZATION_NAME" -> ORGANIZATION_NAME
    | `String value -> raise (deserialize_unknown_enum_value_error path "WebhookFilterType" value)
    | _ -> raise (deserialize_wrong_type_error path "WebhookFilterType")
     : webhook_filter_type)
    : webhook_filter_type)

let webhook_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key webhook_filter_type_of_yojson "type" _list path;
     pattern = value_for_key string__of_yojson "pattern" _list path;
     exclude_matched_pattern =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "excludeMatchedPattern") _list path;
   }
    : webhook_filter)

let filter_group_of_yojson tree path = list_of_yojson webhook_filter_of_yojson tree path
let filter_groups_of_yojson tree path = list_of_yojson filter_group_of_yojson tree path

let webhook_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     url = option_of_yojson (value_for_key non_empty_string_of_yojson "url") _list path;
     payload_url =
       option_of_yojson (value_for_key non_empty_string_of_yojson "payloadUrl") _list path;
     secret = option_of_yojson (value_for_key non_empty_string_of_yojson "secret") _list path;
     branch_filter = option_of_yojson (value_for_key string__of_yojson "branchFilter") _list path;
     filter_groups =
       option_of_yojson (value_for_key filter_groups_of_yojson "filterGroups") _list path;
     build_type =
       option_of_yojson (value_for_key webhook_build_type_of_yojson "buildType") _list path;
     manual_creation =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "manualCreation") _list path;
     last_modified_secret =
       option_of_yojson (value_for_key timestamp_of_yojson "lastModifiedSecret") _list path;
     scope_configuration =
       option_of_yojson
         (value_for_key scope_configuration_of_yojson "scopeConfiguration")
         _list path;
     status = option_of_yojson (value_for_key webhook_status_of_yojson "status") _list path;
     status_message = option_of_yojson (value_for_key string__of_yojson "statusMessage") _list path;
     pull_request_build_policy =
       option_of_yojson
         (value_for_key pull_request_build_policy_of_yojson "pullRequestBuildPolicy")
         _list path;
   }
    : webhook)

let time_out_of_yojson = int_of_yojson
let build_time_out_of_yojson = int_of_yojson

let project_artifacts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key artifacts_type_of_yojson "type" _list path;
     location = option_of_yojson (value_for_key string__of_yojson "location") _list path;
     path = option_of_yojson (value_for_key string__of_yojson "path") _list path;
     namespace_type =
       option_of_yojson (value_for_key artifact_namespace_of_yojson "namespaceType") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     packaging =
       option_of_yojson (value_for_key artifact_packaging_of_yojson "packaging") _list path;
     override_artifact_name =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "overrideArtifactName") _list path;
     encryption_disabled =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "encryptionDisabled") _list path;
     artifact_identifier =
       option_of_yojson (value_for_key string__of_yojson "artifactIdentifier") _list path;
     bucket_owner_access =
       option_of_yojson (value_for_key bucket_owner_access_of_yojson "bucketOwnerAccess") _list path;
   }
    : project_artifacts)

let project_artifacts_list_of_yojson tree path =
  list_of_yojson project_artifacts_of_yojson tree path

let project_description_of_yojson = string_of_yojson
let project_name_of_yojson = string_of_yojson

let project_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key project_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     description =
       option_of_yojson (value_for_key project_description_of_yojson "description") _list path;
     source = option_of_yojson (value_for_key project_source_of_yojson "source") _list path;
     secondary_sources =
       option_of_yojson (value_for_key project_sources_of_yojson "secondarySources") _list path;
     source_version = option_of_yojson (value_for_key string__of_yojson "sourceVersion") _list path;
     secondary_source_versions =
       option_of_yojson
         (value_for_key project_secondary_source_versions_of_yojson "secondarySourceVersions")
         _list path;
     artifacts = option_of_yojson (value_for_key project_artifacts_of_yojson "artifacts") _list path;
     secondary_artifacts =
       option_of_yojson
         (value_for_key project_artifacts_list_of_yojson "secondaryArtifacts")
         _list path;
     cache = option_of_yojson (value_for_key project_cache_of_yojson "cache") _list path;
     environment =
       option_of_yojson (value_for_key project_environment_of_yojson "environment") _list path;
     service_role =
       option_of_yojson (value_for_key non_empty_string_of_yojson "serviceRole") _list path;
     timeout_in_minutes =
       option_of_yojson (value_for_key build_time_out_of_yojson "timeoutInMinutes") _list path;
     queued_timeout_in_minutes =
       option_of_yojson (value_for_key time_out_of_yojson "queuedTimeoutInMinutes") _list path;
     encryption_key =
       option_of_yojson (value_for_key non_empty_string_of_yojson "encryptionKey") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     created = option_of_yojson (value_for_key timestamp_of_yojson "created") _list path;
     last_modified = option_of_yojson (value_for_key timestamp_of_yojson "lastModified") _list path;
     webhook = option_of_yojson (value_for_key webhook_of_yojson "webhook") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "vpcConfig") _list path;
     badge = option_of_yojson (value_for_key project_badge_of_yojson "badge") _list path;
     logs_config = option_of_yojson (value_for_key logs_config_of_yojson "logsConfig") _list path;
     file_system_locations =
       option_of_yojson
         (value_for_key project_file_system_locations_of_yojson "fileSystemLocations")
         _list path;
     build_batch_config =
       option_of_yojson
         (value_for_key project_build_batch_config_of_yojson "buildBatchConfig")
         _list path;
     concurrent_build_limit =
       option_of_yojson (value_for_key wrapper_int_of_yojson "concurrentBuildLimit") _list path;
     project_visibility =
       option_of_yojson
         (value_for_key project_visibility_type_of_yojson "projectVisibility")
         _list path;
     public_project_alias =
       option_of_yojson (value_for_key non_empty_string_of_yojson "publicProjectAlias") _list path;
     resource_access_role =
       option_of_yojson (value_for_key non_empty_string_of_yojson "resourceAccessRole") _list path;
     auto_retry_limit =
       option_of_yojson (value_for_key wrapper_int_of_yojson "autoRetryLimit") _list path;
   }
    : project)

let projects_of_yojson tree path = list_of_yojson project_of_yojson tree path

let batch_get_projects_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     projects = option_of_yojson (value_for_key projects_of_yojson "projects") _list path;
     projects_not_found =
       option_of_yojson (value_for_key project_names_of_yojson "projectsNotFound") _list path;
   }
    : batch_get_projects_output)

let batch_get_projects_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ names = value_for_key project_names_of_yojson "names" _list path } : batch_get_projects_input)

let report_group_arns_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path

let report_group_status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETING" -> DELETING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ReportGroupStatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportGroupStatusType")
     : report_group_status_type)
    : report_group_status_type)

let report_packaging_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ZIP" -> ZIP
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReportPackagingType" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportPackagingType")
     : report_packaging_type)
    : report_packaging_type)

let s3_report_export_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket = option_of_yojson (value_for_key non_empty_string_of_yojson "bucket") _list path;
     bucket_owner = option_of_yojson (value_for_key string__of_yojson "bucketOwner") _list path;
     path = option_of_yojson (value_for_key string__of_yojson "path") _list path;
     packaging =
       option_of_yojson (value_for_key report_packaging_type_of_yojson "packaging") _list path;
     encryption_key =
       option_of_yojson (value_for_key non_empty_string_of_yojson "encryptionKey") _list path;
     encryption_disabled =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "encryptionDisabled") _list path;
   }
    : s3_report_export_config)

let report_export_config_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "S3" -> S3
    | `String "NO_EXPORT" -> NO_EXPORT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ReportExportConfigType" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportExportConfigType")
     : report_export_config_type)
    : report_export_config_type)

let report_export_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_config_type =
       option_of_yojson
         (value_for_key report_export_config_type_of_yojson "exportConfigType")
         _list path;
     s3_destination =
       option_of_yojson (value_for_key s3_report_export_config_of_yojson "s3Destination") _list path;
   }
    : report_export_config)

let report_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TEST" -> TEST
    | `String "CODE_COVERAGE" -> CODE_COVERAGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReportType" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportType")
     : report_type)
    : report_type)

let report_group_name_of_yojson = string_of_yojson

let report_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key report_group_name_of_yojson "name") _list path;
     type_ = option_of_yojson (value_for_key report_type_of_yojson "type") _list path;
     export_config =
       option_of_yojson (value_for_key report_export_config_of_yojson "exportConfig") _list path;
     created = option_of_yojson (value_for_key timestamp_of_yojson "created") _list path;
     last_modified = option_of_yojson (value_for_key timestamp_of_yojson "lastModified") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     status =
       option_of_yojson (value_for_key report_group_status_type_of_yojson "status") _list path;
   }
    : report_group)

let report_groups_of_yojson tree path = list_of_yojson report_group_of_yojson tree path

let batch_get_report_groups_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     report_groups =
       option_of_yojson (value_for_key report_groups_of_yojson "reportGroups") _list path;
     report_groups_not_found =
       option_of_yojson
         (value_for_key report_group_arns_of_yojson "reportGroupsNotFound")
         _list path;
   }
    : batch_get_report_groups_output)

let batch_get_report_groups_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ report_group_arns = value_for_key report_group_arns_of_yojson "reportGroupArns" _list path }
    : batch_get_report_groups_input)

let report_arns_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path
let non_negative_int_of_yojson = int_of_yojson
let percentage_of_yojson = double_of_yojson

let code_coverage_report_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     line_coverage_percentage =
       option_of_yojson (value_for_key percentage_of_yojson "lineCoveragePercentage") _list path;
     lines_covered =
       option_of_yojson (value_for_key non_negative_int_of_yojson "linesCovered") _list path;
     lines_missed =
       option_of_yojson (value_for_key non_negative_int_of_yojson "linesMissed") _list path;
     branch_coverage_percentage =
       option_of_yojson (value_for_key percentage_of_yojson "branchCoveragePercentage") _list path;
     branches_covered =
       option_of_yojson (value_for_key non_negative_int_of_yojson "branchesCovered") _list path;
     branches_missed =
       option_of_yojson (value_for_key non_negative_int_of_yojson "branchesMissed") _list path;
   }
    : code_coverage_report_summary)

let report_status_counts_of_yojson tree path =
  map_of_yojson string__of_yojson wrapper_int_of_yojson tree path

let test_report_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total = value_for_key wrapper_int_of_yojson "total" _list path;
     status_counts = value_for_key report_status_counts_of_yojson "statusCounts" _list path;
     duration_in_nano_seconds =
       value_for_key wrapper_long_of_yojson "durationInNanoSeconds" _list path;
   }
    : test_report_summary)

let report_status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "GENERATING" -> GENERATING
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String "INCOMPLETE" -> INCOMPLETE
    | `String "DELETING" -> DELETING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReportStatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportStatusType")
     : report_status_type)
    : report_status_type)

let report_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     type_ = option_of_yojson (value_for_key report_type_of_yojson "type") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     report_group_arn =
       option_of_yojson (value_for_key non_empty_string_of_yojson "reportGroupArn") _list path;
     execution_id = option_of_yojson (value_for_key string__of_yojson "executionId") _list path;
     status = option_of_yojson (value_for_key report_status_type_of_yojson "status") _list path;
     created = option_of_yojson (value_for_key timestamp_of_yojson "created") _list path;
     expired = option_of_yojson (value_for_key timestamp_of_yojson "expired") _list path;
     export_config =
       option_of_yojson (value_for_key report_export_config_of_yojson "exportConfig") _list path;
     truncated = option_of_yojson (value_for_key wrapper_boolean_of_yojson "truncated") _list path;
     test_summary =
       option_of_yojson (value_for_key test_report_summary_of_yojson "testSummary") _list path;
     code_coverage_summary =
       option_of_yojson
         (value_for_key code_coverage_report_summary_of_yojson "codeCoverageSummary")
         _list path;
   }
    : report)

let reports_of_yojson tree path = list_of_yojson report_of_yojson tree path

let batch_get_reports_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reports = option_of_yojson (value_for_key reports_of_yojson "reports") _list path;
     reports_not_found =
       option_of_yojson (value_for_key report_arns_of_yojson "reportsNotFound") _list path;
   }
    : batch_get_reports_output)

let batch_get_reports_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ report_arns = value_for_key report_arns_of_yojson "reportArns" _list path }
    : batch_get_reports_input)

let sandbox_ids_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path

let sandbox_session_phase_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     phase_type = option_of_yojson (value_for_key string__of_yojson "phaseType") _list path;
     phase_status = option_of_yojson (value_for_key status_type_of_yojson "phaseStatus") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     duration_in_seconds =
       option_of_yojson (value_for_key wrapper_long_of_yojson "durationInSeconds") _list path;
     contexts = option_of_yojson (value_for_key phase_contexts_of_yojson "contexts") _list path;
   }
    : sandbox_session_phase)

let sandbox_session_phases_of_yojson tree path =
  list_of_yojson sandbox_session_phase_of_yojson tree path

let sandbox_session_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key non_empty_string_of_yojson "id") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     current_phase = option_of_yojson (value_for_key string__of_yojson "currentPhase") _list path;
     phases = option_of_yojson (value_for_key sandbox_session_phases_of_yojson "phases") _list path;
     resolved_source_version =
       option_of_yojson
         (value_for_key non_empty_string_of_yojson "resolvedSourceVersion")
         _list path;
     logs = option_of_yojson (value_for_key logs_location_of_yojson "logs") _list path;
     network_interface =
       option_of_yojson (value_for_key network_interface_of_yojson "networkInterface") _list path;
   }
    : sandbox_session)

let sandbox_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key non_empty_string_of_yojson "id") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     project_name =
       option_of_yojson (value_for_key non_empty_string_of_yojson "projectName") _list path;
     request_time = option_of_yojson (value_for_key timestamp_of_yojson "requestTime") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     source = option_of_yojson (value_for_key project_source_of_yojson "source") _list path;
     source_version =
       option_of_yojson (value_for_key non_empty_string_of_yojson "sourceVersion") _list path;
     secondary_sources =
       option_of_yojson (value_for_key project_sources_of_yojson "secondarySources") _list path;
     secondary_source_versions =
       option_of_yojson
         (value_for_key project_secondary_source_versions_of_yojson "secondarySourceVersions")
         _list path;
     environment =
       option_of_yojson (value_for_key project_environment_of_yojson "environment") _list path;
     file_system_locations =
       option_of_yojson
         (value_for_key project_file_system_locations_of_yojson "fileSystemLocations")
         _list path;
     timeout_in_minutes =
       option_of_yojson (value_for_key wrapper_int_of_yojson "timeoutInMinutes") _list path;
     queued_timeout_in_minutes =
       option_of_yojson (value_for_key wrapper_int_of_yojson "queuedTimeoutInMinutes") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "vpcConfig") _list path;
     log_config = option_of_yojson (value_for_key logs_config_of_yojson "logConfig") _list path;
     encryption_key =
       option_of_yojson (value_for_key non_empty_string_of_yojson "encryptionKey") _list path;
     service_role =
       option_of_yojson (value_for_key non_empty_string_of_yojson "serviceRole") _list path;
     current_session =
       option_of_yojson (value_for_key sandbox_session_of_yojson "currentSession") _list path;
   }
    : sandbox)

let sandboxes_of_yojson tree path = list_of_yojson sandbox_of_yojson tree path

let batch_get_sandboxes_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sandboxes = option_of_yojson (value_for_key sandboxes_of_yojson "sandboxes") _list path;
     sandboxes_not_found =
       option_of_yojson (value_for_key sandbox_ids_of_yojson "sandboxesNotFound") _list path;
   }
    : batch_get_sandboxes_output)

let batch_get_sandboxes_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ids = value_for_key sandbox_ids_of_yojson "ids" _list path } : batch_get_sandboxes_input)

let build_batch_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = option_of_yojson (value_for_key status_type_of_yojson "status") _list path }
    : build_batch_filter)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : resource_not_found_exception)

let o_auth_provider_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : o_auth_provider_exception)

let update_webhook_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ webhook = option_of_yojson (value_for_key webhook_of_yojson "webhook") _list path }
    : update_webhook_output)

let update_webhook_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_name = value_for_key project_name_of_yojson "projectName" _list path;
     branch_filter = option_of_yojson (value_for_key string__of_yojson "branchFilter") _list path;
     rotate_secret = option_of_yojson (value_for_key boolean__of_yojson "rotateSecret") _list path;
     filter_groups =
       option_of_yojson (value_for_key filter_groups_of_yojson "filterGroups") _list path;
     build_type =
       option_of_yojson (value_for_key webhook_build_type_of_yojson "buildType") _list path;
     pull_request_build_policy =
       option_of_yojson
         (value_for_key pull_request_build_policy_of_yojson "pullRequestBuildPolicy")
         _list path;
   }
    : update_webhook_input)

let update_report_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     report_group = option_of_yojson (value_for_key report_group_of_yojson "reportGroup") _list path;
   }
    : update_report_group_output)

let update_report_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key non_empty_string_of_yojson "arn" _list path;
     export_config =
       option_of_yojson (value_for_key report_export_config_of_yojson "exportConfig") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : update_report_group_input)

let update_project_visibility_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_arn =
       option_of_yojson (value_for_key non_empty_string_of_yojson "projectArn") _list path;
     public_project_alias =
       option_of_yojson (value_for_key non_empty_string_of_yojson "publicProjectAlias") _list path;
     project_visibility =
       option_of_yojson
         (value_for_key project_visibility_type_of_yojson "projectVisibility")
         _list path;
   }
    : update_project_visibility_output)

let update_project_visibility_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_arn = value_for_key non_empty_string_of_yojson "projectArn" _list path;
     project_visibility =
       value_for_key project_visibility_type_of_yojson "projectVisibility" _list path;
     resource_access_role =
       option_of_yojson (value_for_key non_empty_string_of_yojson "resourceAccessRole") _list path;
   }
    : update_project_visibility_input)

let update_project_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ project = option_of_yojson (value_for_key project_of_yojson "project") _list path }
    : update_project_output)

let update_project_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key non_empty_string_of_yojson "name" _list path;
     description =
       option_of_yojson (value_for_key project_description_of_yojson "description") _list path;
     source = option_of_yojson (value_for_key project_source_of_yojson "source") _list path;
     secondary_sources =
       option_of_yojson (value_for_key project_sources_of_yojson "secondarySources") _list path;
     source_version = option_of_yojson (value_for_key string__of_yojson "sourceVersion") _list path;
     secondary_source_versions =
       option_of_yojson
         (value_for_key project_secondary_source_versions_of_yojson "secondarySourceVersions")
         _list path;
     artifacts = option_of_yojson (value_for_key project_artifacts_of_yojson "artifacts") _list path;
     secondary_artifacts =
       option_of_yojson
         (value_for_key project_artifacts_list_of_yojson "secondaryArtifacts")
         _list path;
     cache = option_of_yojson (value_for_key project_cache_of_yojson "cache") _list path;
     environment =
       option_of_yojson (value_for_key project_environment_of_yojson "environment") _list path;
     service_role =
       option_of_yojson (value_for_key non_empty_string_of_yojson "serviceRole") _list path;
     timeout_in_minutes =
       option_of_yojson (value_for_key build_time_out_of_yojson "timeoutInMinutes") _list path;
     queued_timeout_in_minutes =
       option_of_yojson (value_for_key time_out_of_yojson "queuedTimeoutInMinutes") _list path;
     encryption_key =
       option_of_yojson (value_for_key non_empty_string_of_yojson "encryptionKey") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "vpcConfig") _list path;
     badge_enabled =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "badgeEnabled") _list path;
     logs_config = option_of_yojson (value_for_key logs_config_of_yojson "logsConfig") _list path;
     file_system_locations =
       option_of_yojson
         (value_for_key project_file_system_locations_of_yojson "fileSystemLocations")
         _list path;
     build_batch_config =
       option_of_yojson
         (value_for_key project_build_batch_config_of_yojson "buildBatchConfig")
         _list path;
     concurrent_build_limit =
       option_of_yojson (value_for_key wrapper_int_of_yojson "concurrentBuildLimit") _list path;
     auto_retry_limit =
       option_of_yojson (value_for_key wrapper_int_of_yojson "autoRetryLimit") _list path;
   }
    : update_project_input)

let update_fleet_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fleet = option_of_yojson (value_for_key fleet_of_yojson "fleet") _list path }
    : update_fleet_output)

let scaling_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scaling_type =
       option_of_yojson (value_for_key fleet_scaling_type_of_yojson "scalingType") _list path;
     target_tracking_scaling_configs =
       option_of_yojson
         (value_for_key target_tracking_scaling_configurations_of_yojson
            "targetTrackingScalingConfigs")
         _list path;
     max_capacity =
       option_of_yojson (value_for_key fleet_capacity_of_yojson "maxCapacity") _list path;
   }
    : scaling_configuration_input)

let update_fleet_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key non_empty_string_of_yojson "arn" _list path;
     base_capacity =
       option_of_yojson (value_for_key fleet_capacity_of_yojson "baseCapacity") _list path;
     environment_type =
       option_of_yojson (value_for_key environment_type_of_yojson "environmentType") _list path;
     compute_type = option_of_yojson (value_for_key compute_type_of_yojson "computeType") _list path;
     compute_configuration =
       option_of_yojson
         (value_for_key compute_configuration_of_yojson "computeConfiguration")
         _list path;
     scaling_configuration =
       option_of_yojson
         (value_for_key scaling_configuration_input_of_yojson "scalingConfiguration")
         _list path;
     overflow_behavior =
       option_of_yojson
         (value_for_key fleet_overflow_behavior_of_yojson "overflowBehavior")
         _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "vpcConfig") _list path;
     proxy_configuration =
       option_of_yojson
         (value_for_key proxy_configuration_of_yojson "proxyConfiguration")
         _list path;
     image_id = option_of_yojson (value_for_key non_empty_string_of_yojson "imageId") _list path;
     fleet_service_role =
       option_of_yojson (value_for_key non_empty_string_of_yojson "fleetServiceRole") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : update_fleet_input)

let stop_sandbox_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ sandbox = option_of_yojson (value_for_key sandbox_of_yojson "sandbox") _list path }
    : stop_sandbox_output)

let stop_sandbox_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key non_empty_string_of_yojson "id" _list path } : stop_sandbox_input)

let stop_build_batch_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ build_batch = option_of_yojson (value_for_key build_batch_of_yojson "buildBatch") _list path }
    : stop_build_batch_output)

let stop_build_batch_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key non_empty_string_of_yojson "id" _list path } : stop_build_batch_input)

let stop_build_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ build = option_of_yojson (value_for_key build_of_yojson "build") _list path }
    : stop_build_output)

let stop_build_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key non_empty_string_of_yojson "id" _list path } : stop_build_input)

let ssm_session_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_id = option_of_yojson (value_for_key string__of_yojson "sessionId") _list path;
     token_value = option_of_yojson (value_for_key string__of_yojson "tokenValue") _list path;
     stream_url = option_of_yojson (value_for_key string__of_yojson "streamUrl") _list path;
   }
    : ssm_session)

let start_sandbox_connection_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ssm_session = option_of_yojson (value_for_key ssm_session_of_yojson "ssmSession") _list path }
    : start_sandbox_connection_output)

let start_sandbox_connection_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ sandbox_id = value_for_key non_empty_string_of_yojson "sandboxId" _list path }
    : start_sandbox_connection_input)

let start_sandbox_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ sandbox = option_of_yojson (value_for_key sandbox_of_yojson "sandbox") _list path }
    : start_sandbox_output)

let sensitive_string_of_yojson = string_of_yojson

let start_sandbox_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_name =
       option_of_yojson (value_for_key non_empty_string_of_yojson "projectName") _list path;
     idempotency_token =
       option_of_yojson (value_for_key sensitive_string_of_yojson "idempotencyToken") _list path;
   }
    : start_sandbox_input)

let start_command_execution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     command_execution =
       option_of_yojson (value_for_key command_execution_of_yojson "commandExecution") _list path;
   }
    : start_command_execution_output)

let start_command_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sandbox_id = value_for_key non_empty_string_of_yojson "sandboxId" _list path;
     command = value_for_key sensitive_non_empty_string_of_yojson "command" _list path;
     type_ = option_of_yojson (value_for_key command_type_of_yojson "type") _list path;
   }
    : start_command_execution_input)

let start_build_batch_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ build_batch = option_of_yojson (value_for_key build_batch_of_yojson "buildBatch") _list path }
    : start_build_batch_output)

let start_build_batch_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_name = value_for_key non_empty_string_of_yojson "projectName" _list path;
     secondary_sources_override =
       option_of_yojson
         (value_for_key project_sources_of_yojson "secondarySourcesOverride")
         _list path;
     secondary_sources_version_override =
       option_of_yojson
         (value_for_key project_secondary_source_versions_of_yojson
            "secondarySourcesVersionOverride")
         _list path;
     source_version = option_of_yojson (value_for_key string__of_yojson "sourceVersion") _list path;
     artifacts_override =
       option_of_yojson (value_for_key project_artifacts_of_yojson "artifactsOverride") _list path;
     secondary_artifacts_override =
       option_of_yojson
         (value_for_key project_artifacts_list_of_yojson "secondaryArtifactsOverride")
         _list path;
     environment_variables_override =
       option_of_yojson
         (value_for_key environment_variables_of_yojson "environmentVariablesOverride")
         _list path;
     source_type_override =
       option_of_yojson (value_for_key source_type_of_yojson "sourceTypeOverride") _list path;
     source_location_override =
       option_of_yojson (value_for_key string__of_yojson "sourceLocationOverride") _list path;
     source_auth_override =
       option_of_yojson (value_for_key source_auth_of_yojson "sourceAuthOverride") _list path;
     git_clone_depth_override =
       option_of_yojson (value_for_key git_clone_depth_of_yojson "gitCloneDepthOverride") _list path;
     git_submodules_config_override =
       option_of_yojson
         (value_for_key git_submodules_config_of_yojson "gitSubmodulesConfigOverride")
         _list path;
     buildspec_override =
       option_of_yojson (value_for_key string__of_yojson "buildspecOverride") _list path;
     insecure_ssl_override =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "insecureSslOverride") _list path;
     report_build_batch_status_override =
       option_of_yojson
         (value_for_key wrapper_boolean_of_yojson "reportBuildBatchStatusOverride")
         _list path;
     environment_type_override =
       option_of_yojson
         (value_for_key environment_type_of_yojson "environmentTypeOverride")
         _list path;
     image_override =
       option_of_yojson (value_for_key non_empty_string_of_yojson "imageOverride") _list path;
     compute_type_override =
       option_of_yojson (value_for_key compute_type_of_yojson "computeTypeOverride") _list path;
     certificate_override =
       option_of_yojson (value_for_key string__of_yojson "certificateOverride") _list path;
     cache_override =
       option_of_yojson (value_for_key project_cache_of_yojson "cacheOverride") _list path;
     service_role_override =
       option_of_yojson (value_for_key non_empty_string_of_yojson "serviceRoleOverride") _list path;
     privileged_mode_override =
       option_of_yojson
         (value_for_key wrapper_boolean_of_yojson "privilegedModeOverride")
         _list path;
     build_timeout_in_minutes_override =
       option_of_yojson
         (value_for_key build_time_out_of_yojson "buildTimeoutInMinutesOverride")
         _list path;
     queued_timeout_in_minutes_override =
       option_of_yojson
         (value_for_key time_out_of_yojson "queuedTimeoutInMinutesOverride")
         _list path;
     encryption_key_override =
       option_of_yojson
         (value_for_key non_empty_string_of_yojson "encryptionKeyOverride")
         _list path;
     idempotency_token =
       option_of_yojson (value_for_key string__of_yojson "idempotencyToken") _list path;
     logs_config_override =
       option_of_yojson (value_for_key logs_config_of_yojson "logsConfigOverride") _list path;
     registry_credential_override =
       option_of_yojson
         (value_for_key registry_credential_of_yojson "registryCredentialOverride")
         _list path;
     image_pull_credentials_type_override =
       option_of_yojson
         (value_for_key image_pull_credentials_type_of_yojson "imagePullCredentialsTypeOverride")
         _list path;
     build_batch_config_override =
       option_of_yojson
         (value_for_key project_build_batch_config_of_yojson "buildBatchConfigOverride")
         _list path;
     debug_session_enabled =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "debugSessionEnabled") _list path;
   }
    : start_build_batch_input)

let start_build_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ build = option_of_yojson (value_for_key build_of_yojson "build") _list path }
    : start_build_output)

let start_build_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_name = value_for_key non_empty_string_of_yojson "projectName" _list path;
     secondary_sources_override =
       option_of_yojson
         (value_for_key project_sources_of_yojson "secondarySourcesOverride")
         _list path;
     secondary_sources_version_override =
       option_of_yojson
         (value_for_key project_secondary_source_versions_of_yojson
            "secondarySourcesVersionOverride")
         _list path;
     source_version = option_of_yojson (value_for_key string__of_yojson "sourceVersion") _list path;
     artifacts_override =
       option_of_yojson (value_for_key project_artifacts_of_yojson "artifactsOverride") _list path;
     secondary_artifacts_override =
       option_of_yojson
         (value_for_key project_artifacts_list_of_yojson "secondaryArtifactsOverride")
         _list path;
     environment_variables_override =
       option_of_yojson
         (value_for_key environment_variables_of_yojson "environmentVariablesOverride")
         _list path;
     source_type_override =
       option_of_yojson (value_for_key source_type_of_yojson "sourceTypeOverride") _list path;
     source_location_override =
       option_of_yojson (value_for_key string__of_yojson "sourceLocationOverride") _list path;
     source_auth_override =
       option_of_yojson (value_for_key source_auth_of_yojson "sourceAuthOverride") _list path;
     git_clone_depth_override =
       option_of_yojson (value_for_key git_clone_depth_of_yojson "gitCloneDepthOverride") _list path;
     git_submodules_config_override =
       option_of_yojson
         (value_for_key git_submodules_config_of_yojson "gitSubmodulesConfigOverride")
         _list path;
     buildspec_override =
       option_of_yojson (value_for_key string__of_yojson "buildspecOverride") _list path;
     insecure_ssl_override =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "insecureSslOverride") _list path;
     report_build_status_override =
       option_of_yojson
         (value_for_key wrapper_boolean_of_yojson "reportBuildStatusOverride")
         _list path;
     build_status_config_override =
       option_of_yojson
         (value_for_key build_status_config_of_yojson "buildStatusConfigOverride")
         _list path;
     environment_type_override =
       option_of_yojson
         (value_for_key environment_type_of_yojson "environmentTypeOverride")
         _list path;
     image_override =
       option_of_yojson (value_for_key non_empty_string_of_yojson "imageOverride") _list path;
     compute_type_override =
       option_of_yojson (value_for_key compute_type_of_yojson "computeTypeOverride") _list path;
     certificate_override =
       option_of_yojson (value_for_key string__of_yojson "certificateOverride") _list path;
     cache_override =
       option_of_yojson (value_for_key project_cache_of_yojson "cacheOverride") _list path;
     service_role_override =
       option_of_yojson (value_for_key non_empty_string_of_yojson "serviceRoleOverride") _list path;
     privileged_mode_override =
       option_of_yojson
         (value_for_key wrapper_boolean_of_yojson "privilegedModeOverride")
         _list path;
     timeout_in_minutes_override =
       option_of_yojson
         (value_for_key build_time_out_of_yojson "timeoutInMinutesOverride")
         _list path;
     queued_timeout_in_minutes_override =
       option_of_yojson
         (value_for_key time_out_of_yojson "queuedTimeoutInMinutesOverride")
         _list path;
     encryption_key_override =
       option_of_yojson
         (value_for_key non_empty_string_of_yojson "encryptionKeyOverride")
         _list path;
     idempotency_token =
       option_of_yojson (value_for_key string__of_yojson "idempotencyToken") _list path;
     logs_config_override =
       option_of_yojson (value_for_key logs_config_of_yojson "logsConfigOverride") _list path;
     registry_credential_override =
       option_of_yojson
         (value_for_key registry_credential_of_yojson "registryCredentialOverride")
         _list path;
     image_pull_credentials_type_override =
       option_of_yojson
         (value_for_key image_pull_credentials_type_of_yojson "imagePullCredentialsTypeOverride")
         _list path;
     debug_session_enabled =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "debugSessionEnabled") _list path;
     fleet_override =
       option_of_yojson (value_for_key project_fleet_of_yojson "fleetOverride") _list path;
     auto_retry_limit_override =
       option_of_yojson (value_for_key wrapper_int_of_yojson "autoRetryLimitOverride") _list path;
     host_kernel_override =
       option_of_yojson (value_for_key host_kernel_of_yojson "hostKernelOverride") _list path;
   }
    : start_build_input)

let retry_build_batch_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ build_batch = option_of_yojson (value_for_key build_batch_of_yojson "buildBatch") _list path }
    : retry_build_batch_output)

let retry_build_batch_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RETRY_ALL_BUILDS" -> RETRY_ALL_BUILDS
    | `String "RETRY_FAILED_BUILDS" -> RETRY_FAILED_BUILDS
    | `String value -> raise (deserialize_unknown_enum_value_error path "RetryBuildBatchType" value)
    | _ -> raise (deserialize_wrong_type_error path "RetryBuildBatchType")
     : retry_build_batch_type)
    : retry_build_batch_type)

let retry_build_batch_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key non_empty_string_of_yojson "id") _list path;
     idempotency_token =
       option_of_yojson (value_for_key string__of_yojson "idempotencyToken") _list path;
     retry_type =
       option_of_yojson (value_for_key retry_build_batch_type_of_yojson "retryType") _list path;
   }
    : retry_build_batch_input)

let retry_build_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ build = option_of_yojson (value_for_key build_of_yojson "build") _list path }
    : retry_build_output)

let retry_build_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key non_empty_string_of_yojson "id") _list path;
     idempotency_token =
       option_of_yojson (value_for_key string__of_yojson "idempotencyToken") _list path;
   }
    : retry_build_input)

let put_resource_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       option_of_yojson (value_for_key non_empty_string_of_yojson "resourceArn") _list path;
   }
    : put_resource_policy_output)

let put_resource_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy = value_for_key non_empty_string_of_yojson "policy" _list path;
     resource_arn = value_for_key non_empty_string_of_yojson "resourceArn" _list path;
   }
    : put_resource_policy_input)

let server_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "GITHUB" -> GITHUB
    | `String "BITBUCKET" -> BITBUCKET
    | `String "GITHUB_ENTERPRISE" -> GITHUB_ENTERPRISE
    | `String "GITLAB" -> GITLAB
    | `String "GITLAB_SELF_MANAGED" -> GITLAB_SELF_MANAGED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ServerType" value)
    | _ -> raise (deserialize_wrong_type_error path "ServerType")
     : server_type)
    : server_type)

let source_credentials_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     server_type = option_of_yojson (value_for_key server_type_of_yojson "serverType") _list path;
     auth_type = option_of_yojson (value_for_key auth_type_of_yojson "authType") _list path;
     resource = option_of_yojson (value_for_key string__of_yojson "resource") _list path;
   }
    : source_credentials_info)

let source_credentials_infos_of_yojson tree path =
  list_of_yojson source_credentials_info_of_yojson tree path

let list_source_credentials_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_credentials_infos =
       option_of_yojson
         (value_for_key source_credentials_infos_of_yojson "sourceCredentialsInfos")
         _list path;
   }
    : list_source_credentials_output)

let list_source_credentials_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let list_shared_report_groups_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     report_groups =
       option_of_yojson (value_for_key report_group_arns_of_yojson "reportGroups") _list path;
   }
    : list_shared_report_groups_output)

let page_size_of_yojson = int_of_yojson

let shared_resource_sort_by_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ARN" -> ARN
    | `String "MODIFIED_TIME" -> MODIFIED_TIME
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SharedResourceSortByType" value)
    | _ -> raise (deserialize_wrong_type_error path "SharedResourceSortByType")
     : shared_resource_sort_by_type)
    : shared_resource_sort_by_type)

let sort_order_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASCENDING" -> ASCENDING
    | `String "DESCENDING" -> DESCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrderType" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrderType")
     : sort_order_type)
    : sort_order_type)

let list_shared_report_groups_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = option_of_yojson (value_for_key sort_order_type_of_yojson "sortOrder") _list path;
     sort_by =
       option_of_yojson (value_for_key shared_resource_sort_by_type_of_yojson "sortBy") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "maxResults") _list path;
   }
    : list_shared_report_groups_input)

let project_arns_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path

let list_shared_projects_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     projects = option_of_yojson (value_for_key project_arns_of_yojson "projects") _list path;
   }
    : list_shared_projects_output)

let list_shared_projects_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_by =
       option_of_yojson (value_for_key shared_resource_sort_by_type_of_yojson "sortBy") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_type_of_yojson "sortOrder") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key non_empty_string_of_yojson "nextToken") _list path;
   }
    : list_shared_projects_input)

let list_sandboxes_for_project_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ids = option_of_yojson (value_for_key sandbox_ids_of_yojson "ids") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_sandboxes_for_project_output)

let list_sandboxes_for_project_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_name = value_for_key non_empty_string_of_yojson "projectName" _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "maxResults") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_type_of_yojson "sortOrder") _list path;
     next_token = option_of_yojson (value_for_key sensitive_string_of_yojson "nextToken") _list path;
   }
    : list_sandboxes_for_project_input)

let list_sandboxes_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ids = option_of_yojson (value_for_key sandbox_ids_of_yojson "ids") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_sandboxes_output)

let list_sandboxes_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key page_size_of_yojson "maxResults") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_type_of_yojson "sortOrder") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_sandboxes_input)

let list_reports_for_report_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     reports = option_of_yojson (value_for_key report_arns_of_yojson "reports") _list path;
   }
    : list_reports_for_report_group_output)

let report_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = option_of_yojson (value_for_key report_status_type_of_yojson "status") _list path }
    : report_filter)

let list_reports_for_report_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     report_group_arn = value_for_key string__of_yojson "reportGroupArn" _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_type_of_yojson "sortOrder") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "maxResults") _list path;
     filter = option_of_yojson (value_for_key report_filter_of_yojson "filter") _list path;
   }
    : list_reports_for_report_group_input)

let list_reports_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     reports = option_of_yojson (value_for_key report_arns_of_yojson "reports") _list path;
   }
    : list_reports_output)

let list_reports_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = option_of_yojson (value_for_key sort_order_type_of_yojson "sortOrder") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "maxResults") _list path;
     filter = option_of_yojson (value_for_key report_filter_of_yojson "filter") _list path;
   }
    : list_reports_input)

let list_report_groups_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     report_groups =
       option_of_yojson (value_for_key report_group_arns_of_yojson "reportGroups") _list path;
   }
    : list_report_groups_output)

let report_group_sort_by_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NAME" -> NAME
    | `String "CREATED_TIME" -> CREATED_TIME
    | `String "LAST_MODIFIED_TIME" -> LAST_MODIFIED_TIME
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ReportGroupSortByType" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportGroupSortByType")
     : report_group_sort_by_type)
    : report_group_sort_by_type)

let list_report_groups_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = option_of_yojson (value_for_key sort_order_type_of_yojson "sortOrder") _list path;
     sort_by =
       option_of_yojson (value_for_key report_group_sort_by_type_of_yojson "sortBy") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "maxResults") _list path;
   }
    : list_report_groups_input)

let list_projects_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     projects = option_of_yojson (value_for_key project_names_of_yojson "projects") _list path;
   }
    : list_projects_output)

let project_sort_by_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NAME" -> NAME
    | `String "CREATED_TIME" -> CREATED_TIME
    | `String "LAST_MODIFIED_TIME" -> LAST_MODIFIED_TIME
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProjectSortByType" value)
    | _ -> raise (deserialize_wrong_type_error path "ProjectSortByType")
     : project_sort_by_type)
    : project_sort_by_type)

let list_projects_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_by = option_of_yojson (value_for_key project_sort_by_type_of_yojson "sortBy") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_type_of_yojson "sortOrder") _list path;
     next_token = option_of_yojson (value_for_key non_empty_string_of_yojson "nextToken") _list path;
   }
    : list_projects_input)

let fleet_arns_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path

let list_fleets_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     fleets = option_of_yojson (value_for_key fleet_arns_of_yojson "fleets") _list path;
   }
    : list_fleets_output)

let fleet_sort_by_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NAME" -> NAME
    | `String "CREATED_TIME" -> CREATED_TIME
    | `String "LAST_MODIFIED_TIME" -> LAST_MODIFIED_TIME
    | `String value -> raise (deserialize_unknown_enum_value_error path "FleetSortByType" value)
    | _ -> raise (deserialize_wrong_type_error path "FleetSortByType")
     : fleet_sort_by_type)
    : fleet_sort_by_type)

let list_fleets_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key sensitive_string_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "maxResults") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_type_of_yojson "sortOrder") _list path;
     sort_by = option_of_yojson (value_for_key fleet_sort_by_type_of_yojson "sortBy") _list path;
   }
    : list_fleets_input)

let image_versions_of_yojson tree path = list_of_yojson string__of_yojson tree path

let environment_image_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "description") _list path;
     versions = option_of_yojson (value_for_key image_versions_of_yojson "versions") _list path;
   }
    : environment_image)

let environment_images_of_yojson tree path = list_of_yojson environment_image_of_yojson tree path

let language_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "JAVA" -> JAVA
    | `String "PYTHON" -> PYTHON
    | `String "NODE_JS" -> NODE_JS
    | `String "RUBY" -> RUBY
    | `String "GOLANG" -> GOLANG
    | `String "DOCKER" -> DOCKER
    | `String "ANDROID" -> ANDROID
    | `String "DOTNET" -> DOTNET
    | `String "BASE" -> BASE
    | `String "PHP" -> PHP
    | `String value -> raise (deserialize_unknown_enum_value_error path "LanguageType" value)
    | _ -> raise (deserialize_wrong_type_error path "LanguageType")
     : language_type)
    : language_type)

let environment_language_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     language = option_of_yojson (value_for_key language_type_of_yojson "language") _list path;
     images = option_of_yojson (value_for_key environment_images_of_yojson "images") _list path;
   }
    : environment_language)

let environment_languages_of_yojson tree path =
  list_of_yojson environment_language_of_yojson tree path

let platform_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEBIAN" -> DEBIAN
    | `String "AMAZON_LINUX" -> AMAZON_LINUX
    | `String "UBUNTU" -> UBUNTU
    | `String "WINDOWS_SERVER" -> WINDOWS_SERVER
    | `String value -> raise (deserialize_unknown_enum_value_error path "PlatformType" value)
    | _ -> raise (deserialize_wrong_type_error path "PlatformType")
     : platform_type)
    : platform_type)

let environment_platform_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     platform = option_of_yojson (value_for_key platform_type_of_yojson "platform") _list path;
     languages =
       option_of_yojson (value_for_key environment_languages_of_yojson "languages") _list path;
   }
    : environment_platform)

let environment_platforms_of_yojson tree path =
  list_of_yojson environment_platform_of_yojson tree path

let list_curated_environment_images_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     platforms =
       option_of_yojson (value_for_key environment_platforms_of_yojson "platforms") _list path;
   }
    : list_curated_environment_images_output)

let list_curated_environment_images_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let list_command_executions_for_sandbox_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     command_executions =
       option_of_yojson (value_for_key command_executions_of_yojson "commandExecutions") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_command_executions_for_sandbox_output)

let list_command_executions_for_sandbox_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sandbox_id = value_for_key non_empty_string_of_yojson "sandboxId" _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "maxResults") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_type_of_yojson "sortOrder") _list path;
     next_token = option_of_yojson (value_for_key sensitive_string_of_yojson "nextToken") _list path;
   }
    : list_command_executions_for_sandbox_input)

let list_builds_for_project_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ids = option_of_yojson (value_for_key build_ids_of_yojson "ids") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_builds_for_project_output)

let list_builds_for_project_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_name = value_for_key non_empty_string_of_yojson "projectName" _list path;
     sort_order = option_of_yojson (value_for_key sort_order_type_of_yojson "sortOrder") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_builds_for_project_input)

let list_builds_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ids = option_of_yojson (value_for_key build_ids_of_yojson "ids") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_builds_output)

let list_builds_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = option_of_yojson (value_for_key sort_order_type_of_yojson "sortOrder") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_builds_input)

let list_build_batches_for_project_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ids = option_of_yojson (value_for_key build_batch_ids_of_yojson "ids") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_build_batches_for_project_output)

let list_build_batches_for_project_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_name =
       option_of_yojson (value_for_key non_empty_string_of_yojson "projectName") _list path;
     filter = option_of_yojson (value_for_key build_batch_filter_of_yojson "filter") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "maxResults") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_type_of_yojson "sortOrder") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_build_batches_for_project_input)

let list_build_batches_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ids = option_of_yojson (value_for_key build_batch_ids_of_yojson "ids") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_build_batches_output)

let list_build_batches_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key build_batch_filter_of_yojson "filter") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "maxResults") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_type_of_yojson "sortOrder") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_build_batches_input)

let invalidate_project_cache_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let invalidate_project_cache_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ project_name = value_for_key non_empty_string_of_yojson "projectName" _list path }
    : invalidate_project_cache_input)

let resource_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : resource_already_exists_exception)

let import_source_credentials_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path }
    : import_source_credentials_output)

let import_source_credentials_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     username = option_of_yojson (value_for_key non_empty_string_of_yojson "username") _list path;
     token = value_for_key sensitive_non_empty_string_of_yojson "token" _list path;
     server_type = value_for_key server_type_of_yojson "serverType" _list path;
     auth_type = value_for_key auth_type_of_yojson "authType" _list path;
     should_overwrite =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "shouldOverwrite") _list path;
   }
    : import_source_credentials_input)

let get_resource_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy = option_of_yojson (value_for_key non_empty_string_of_yojson "policy") _list path }
    : get_resource_policy_output)

let get_resource_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key non_empty_string_of_yojson "resourceArn" _list path }
    : get_resource_policy_input)

let report_with_raw_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     report_arn = option_of_yojson (value_for_key non_empty_string_of_yojson "reportArn") _list path;
     data = option_of_yojson (value_for_key string__of_yojson "data") _list path;
   }
    : report_with_raw_data)

let report_group_trend_raw_data_list_of_yojson tree path =
  list_of_yojson report_with_raw_data_of_yojson tree path

let report_group_trend_stats_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     average = option_of_yojson (value_for_key string__of_yojson "average") _list path;
     max = option_of_yojson (value_for_key string__of_yojson "max") _list path;
     min = option_of_yojson (value_for_key string__of_yojson "min") _list path;
   }
    : report_group_trend_stats)

let get_report_group_trend_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stats = option_of_yojson (value_for_key report_group_trend_stats_of_yojson "stats") _list path;
     raw_data =
       option_of_yojson
         (value_for_key report_group_trend_raw_data_list_of_yojson "rawData")
         _list path;
   }
    : get_report_group_trend_output)

let report_group_trend_field_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PASS_RATE" -> PASS_RATE
    | `String "DURATION" -> DURATION
    | `String "TOTAL" -> TOTAL
    | `String "LINE_COVERAGE" -> LINE_COVERAGE
    | `String "LINES_COVERED" -> LINES_COVERED
    | `String "LINES_MISSED" -> LINES_MISSED
    | `String "BRANCH_COVERAGE" -> BRANCH_COVERAGE
    | `String "BRANCHES_COVERED" -> BRANCHES_COVERED
    | `String "BRANCHES_MISSED" -> BRANCHES_MISSED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ReportGroupTrendFieldType" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportGroupTrendFieldType")
     : report_group_trend_field_type)
    : report_group_trend_field_type)

let get_report_group_trend_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     report_group_arn = value_for_key non_empty_string_of_yojson "reportGroupArn" _list path;
     num_of_reports = option_of_yojson (value_for_key page_size_of_yojson "numOfReports") _list path;
     trend_field = value_for_key report_group_trend_field_type_of_yojson "trendField" _list path;
   }
    : get_report_group_trend_input)

let test_case_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     report_arn = option_of_yojson (value_for_key non_empty_string_of_yojson "reportArn") _list path;
     test_raw_data_path =
       option_of_yojson (value_for_key string__of_yojson "testRawDataPath") _list path;
     prefix = option_of_yojson (value_for_key string__of_yojson "prefix") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     duration_in_nano_seconds =
       option_of_yojson (value_for_key wrapper_long_of_yojson "durationInNanoSeconds") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     expired = option_of_yojson (value_for_key timestamp_of_yojson "expired") _list path;
     test_suite_name = option_of_yojson (value_for_key string__of_yojson "testSuiteName") _list path;
   }
    : test_case)

let test_cases_of_yojson tree path = list_of_yojson test_case_of_yojson tree path

let describe_test_cases_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     test_cases = option_of_yojson (value_for_key test_cases_of_yojson "testCases") _list path;
   }
    : describe_test_cases_output)

let test_case_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     keyword = option_of_yojson (value_for_key string__of_yojson "keyword") _list path;
   }
    : test_case_filter)

let describe_test_cases_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     report_arn = value_for_key string__of_yojson "reportArn" _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "maxResults") _list path;
     filter = option_of_yojson (value_for_key test_case_filter_of_yojson "filter") _list path;
   }
    : describe_test_cases_input)

let code_coverage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key non_empty_string_of_yojson "id") _list path;
     report_ar_n =
       option_of_yojson (value_for_key non_empty_string_of_yojson "reportARN") _list path;
     file_path = option_of_yojson (value_for_key non_empty_string_of_yojson "filePath") _list path;
     line_coverage_percentage =
       option_of_yojson (value_for_key percentage_of_yojson "lineCoveragePercentage") _list path;
     lines_covered =
       option_of_yojson (value_for_key non_negative_int_of_yojson "linesCovered") _list path;
     lines_missed =
       option_of_yojson (value_for_key non_negative_int_of_yojson "linesMissed") _list path;
     branch_coverage_percentage =
       option_of_yojson (value_for_key percentage_of_yojson "branchCoveragePercentage") _list path;
     branches_covered =
       option_of_yojson (value_for_key non_negative_int_of_yojson "branchesCovered") _list path;
     branches_missed =
       option_of_yojson (value_for_key non_negative_int_of_yojson "branchesMissed") _list path;
     expired = option_of_yojson (value_for_key timestamp_of_yojson "expired") _list path;
   }
    : code_coverage)

let code_coverages_of_yojson tree path = list_of_yojson code_coverage_of_yojson tree path

let describe_code_coverages_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     code_coverages =
       option_of_yojson (value_for_key code_coverages_of_yojson "codeCoverages") _list path;
   }
    : describe_code_coverages_output)

let report_code_coverage_sort_by_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "LINE_COVERAGE_PERCENTAGE" -> LINE_COVERAGE_PERCENTAGE
    | `String "FILE_PATH" -> FILE_PATH
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ReportCodeCoverageSortByType" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportCodeCoverageSortByType")
     : report_code_coverage_sort_by_type)
    : report_code_coverage_sort_by_type)

let describe_code_coverages_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     report_arn = value_for_key non_empty_string_of_yojson "reportArn" _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "maxResults") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_type_of_yojson "sortOrder") _list path;
     sort_by =
       option_of_yojson
         (value_for_key report_code_coverage_sort_by_type_of_yojson "sortBy")
         _list path;
     min_line_coverage_percentage =
       option_of_yojson (value_for_key percentage_of_yojson "minLineCoveragePercentage") _list path;
     max_line_coverage_percentage =
       option_of_yojson (value_for_key percentage_of_yojson "maxLineCoveragePercentage") _list path;
   }
    : describe_code_coverages_input)

let delete_webhook_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_webhook_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ project_name = value_for_key project_name_of_yojson "projectName" _list path }
    : delete_webhook_input)

let delete_source_credentials_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path }
    : delete_source_credentials_output)

let delete_source_credentials_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key non_empty_string_of_yojson "arn" _list path }
    : delete_source_credentials_input)

let delete_resource_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_resource_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key non_empty_string_of_yojson "resourceArn" _list path }
    : delete_resource_policy_input)

let delete_report_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_report_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key non_empty_string_of_yojson "arn" _list path;
     delete_reports = option_of_yojson (value_for_key boolean__of_yojson "deleteReports") _list path;
   }
    : delete_report_group_input)

let delete_report_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_report_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key non_empty_string_of_yojson "arn" _list path } : delete_report_input)

let delete_project_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_project_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key non_empty_string_of_yojson "name" _list path } : delete_project_input)

let delete_fleet_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_fleet_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key non_empty_string_of_yojson "arn" _list path } : delete_fleet_input)

let delete_build_batch_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_code = option_of_yojson (value_for_key string__of_yojson "statusCode") _list path;
     builds_deleted =
       option_of_yojson (value_for_key build_ids_of_yojson "buildsDeleted") _list path;
     builds_not_deleted =
       option_of_yojson (value_for_key builds_not_deleted_of_yojson "buildsNotDeleted") _list path;
   }
    : delete_build_batch_output)

let delete_build_batch_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key non_empty_string_of_yojson "id" _list path } : delete_build_batch_input)

let create_webhook_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ webhook = option_of_yojson (value_for_key webhook_of_yojson "webhook") _list path }
    : create_webhook_output)

let create_webhook_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_name = value_for_key project_name_of_yojson "projectName" _list path;
     branch_filter = option_of_yojson (value_for_key string__of_yojson "branchFilter") _list path;
     filter_groups =
       option_of_yojson (value_for_key filter_groups_of_yojson "filterGroups") _list path;
     build_type =
       option_of_yojson (value_for_key webhook_build_type_of_yojson "buildType") _list path;
     manual_creation =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "manualCreation") _list path;
     scope_configuration =
       option_of_yojson
         (value_for_key scope_configuration_of_yojson "scopeConfiguration")
         _list path;
     pull_request_build_policy =
       option_of_yojson
         (value_for_key pull_request_build_policy_of_yojson "pullRequestBuildPolicy")
         _list path;
   }
    : create_webhook_input)

let create_report_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     report_group = option_of_yojson (value_for_key report_group_of_yojson "reportGroup") _list path;
   }
    : create_report_group_output)

let create_report_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key report_group_name_of_yojson "name" _list path;
     type_ = value_for_key report_type_of_yojson "type" _list path;
     export_config = value_for_key report_export_config_of_yojson "exportConfig" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_report_group_input)

let create_project_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ project = option_of_yojson (value_for_key project_of_yojson "project") _list path }
    : create_project_output)

let create_project_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key project_name_of_yojson "name" _list path;
     description =
       option_of_yojson (value_for_key project_description_of_yojson "description") _list path;
     source = value_for_key project_source_of_yojson "source" _list path;
     secondary_sources =
       option_of_yojson (value_for_key project_sources_of_yojson "secondarySources") _list path;
     source_version = option_of_yojson (value_for_key string__of_yojson "sourceVersion") _list path;
     secondary_source_versions =
       option_of_yojson
         (value_for_key project_secondary_source_versions_of_yojson "secondarySourceVersions")
         _list path;
     artifacts = value_for_key project_artifacts_of_yojson "artifacts" _list path;
     secondary_artifacts =
       option_of_yojson
         (value_for_key project_artifacts_list_of_yojson "secondaryArtifacts")
         _list path;
     cache = option_of_yojson (value_for_key project_cache_of_yojson "cache") _list path;
     environment = value_for_key project_environment_of_yojson "environment" _list path;
     service_role = value_for_key non_empty_string_of_yojson "serviceRole" _list path;
     timeout_in_minutes =
       option_of_yojson (value_for_key build_time_out_of_yojson "timeoutInMinutes") _list path;
     queued_timeout_in_minutes =
       option_of_yojson (value_for_key time_out_of_yojson "queuedTimeoutInMinutes") _list path;
     encryption_key =
       option_of_yojson (value_for_key non_empty_string_of_yojson "encryptionKey") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "vpcConfig") _list path;
     badge_enabled =
       option_of_yojson (value_for_key wrapper_boolean_of_yojson "badgeEnabled") _list path;
     logs_config = option_of_yojson (value_for_key logs_config_of_yojson "logsConfig") _list path;
     file_system_locations =
       option_of_yojson
         (value_for_key project_file_system_locations_of_yojson "fileSystemLocations")
         _list path;
     build_batch_config =
       option_of_yojson
         (value_for_key project_build_batch_config_of_yojson "buildBatchConfig")
         _list path;
     concurrent_build_limit =
       option_of_yojson (value_for_key wrapper_int_of_yojson "concurrentBuildLimit") _list path;
     auto_retry_limit =
       option_of_yojson (value_for_key wrapper_int_of_yojson "autoRetryLimit") _list path;
   }
    : create_project_input)

let create_fleet_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fleet = option_of_yojson (value_for_key fleet_of_yojson "fleet") _list path }
    : create_fleet_output)

let create_fleet_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key fleet_name_of_yojson "name" _list path;
     base_capacity = value_for_key fleet_capacity_of_yojson "baseCapacity" _list path;
     environment_type = value_for_key environment_type_of_yojson "environmentType" _list path;
     compute_type = value_for_key compute_type_of_yojson "computeType" _list path;
     compute_configuration =
       option_of_yojson
         (value_for_key compute_configuration_of_yojson "computeConfiguration")
         _list path;
     scaling_configuration =
       option_of_yojson
         (value_for_key scaling_configuration_input_of_yojson "scalingConfiguration")
         _list path;
     overflow_behavior =
       option_of_yojson
         (value_for_key fleet_overflow_behavior_of_yojson "overflowBehavior")
         _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "vpcConfig") _list path;
     proxy_configuration =
       option_of_yojson
         (value_for_key proxy_configuration_of_yojson "proxyConfiguration")
         _list path;
     image_id = option_of_yojson (value_for_key non_empty_string_of_yojson "imageId") _list path;
     fleet_service_role =
       option_of_yojson (value_for_key non_empty_string_of_yojson "fleetServiceRole") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_fleet_input)
