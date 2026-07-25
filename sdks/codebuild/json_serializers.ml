open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let account_limit_exceeded_exception_to_yojson (x : account_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let account_suspended_exception_to_yojson (x : account_suspended_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let artifact_namespace_to_yojson (x : artifact_namespace) =
  match x with NONE -> `String "NONE" | BUILD_ID -> `String "BUILD_ID"

let artifact_packaging_to_yojson (x : artifact_packaging) =
  match x with NONE -> `String "NONE" | ZIP -> `String "ZIP"

let artifacts_type_to_yojson (x : artifacts_type) =
  match x with
  | CODEPIPELINE -> `String "CODEPIPELINE"
  | S3 -> `String "S3"
  | NO_ARTIFACTS -> `String "NO_ARTIFACTS"

let auth_type_to_yojson (x : auth_type) =
  match x with
  | OAUTH -> `String "OAUTH"
  | BASIC_AUTH -> `String "BASIC_AUTH"
  | PERSONAL_ACCESS_TOKEN -> `String "PERSONAL_ACCESS_TOKEN"
  | CODECONNECTIONS -> `String "CODECONNECTIONS"
  | SECRETS_MANAGER -> `String "SECRETS_MANAGER"

let wrapper_int_to_yojson = int_to_yojson

let auto_retry_config_to_yojson (x : auto_retry_config) =
  assoc_to_yojson
    [
      ("autoRetryLimit", option_to_yojson wrapper_int_to_yojson x.auto_retry_limit);
      ("autoRetryNumber", option_to_yojson wrapper_int_to_yojson x.auto_retry_number);
      ("nextAutoRetry", option_to_yojson string__to_yojson x.next_auto_retry);
      ("previousAutoRetry", option_to_yojson string__to_yojson x.previous_auto_retry);
    ]

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let non_empty_string_to_yojson = string_to_yojson

let build_not_deleted_to_yojson (x : build_not_deleted) =
  assoc_to_yojson
    [
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
      ("statusCode", option_to_yojson string__to_yojson x.status_code);
    ]

let builds_not_deleted_to_yojson tree = list_to_yojson build_not_deleted_to_yojson tree
let build_ids_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let batch_delete_builds_output_to_yojson (x : batch_delete_builds_output) =
  assoc_to_yojson
    [
      ("buildsDeleted", option_to_yojson build_ids_to_yojson x.builds_deleted);
      ("buildsNotDeleted", option_to_yojson builds_not_deleted_to_yojson x.builds_not_deleted);
    ]

let batch_delete_builds_input_to_yojson (x : batch_delete_builds_input) =
  assoc_to_yojson [ ("ids", Some (build_ids_to_yojson x.ids)) ]

let build_batch_ids_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree
let build_report_arns_to_yojson tree = list_to_yojson string__to_yojson tree
let wrapper_boolean_to_yojson = bool_to_yojson

let resolved_artifact_to_yojson (x : resolved_artifact) =
  assoc_to_yojson
    [
      ("type", option_to_yojson artifacts_type_to_yojson x.type_);
      ("location", option_to_yojson string__to_yojson x.location);
      ("identifier", option_to_yojson string__to_yojson x.identifier);
    ]

let resolved_secondary_artifacts_to_yojson tree = list_to_yojson resolved_artifact_to_yojson tree

let status_type_to_yojson (x : status_type) =
  match x with
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | FAULT -> `String "FAULT"
  | TIMED_OUT -> `String "TIMED_OUT"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | STOPPED -> `String "STOPPED"

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let build_summary_to_yojson (x : build_summary) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson string__to_yojson x.arn);
      ("requestedOn", option_to_yojson timestamp_to_yojson x.requested_on);
      ("buildStatus", option_to_yojson status_type_to_yojson x.build_status);
      ("primaryArtifact", option_to_yojson resolved_artifact_to_yojson x.primary_artifact);
      ( "secondaryArtifacts",
        option_to_yojson resolved_secondary_artifacts_to_yojson x.secondary_artifacts );
    ]

let build_summaries_to_yojson tree = list_to_yojson build_summary_to_yojson tree
let boolean__to_yojson = bool_to_yojson
let identifiers_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let build_group_to_yojson (x : build_group) =
  assoc_to_yojson
    [
      ("identifier", option_to_yojson string__to_yojson x.identifier);
      ("dependsOn", option_to_yojson identifiers_to_yojson x.depends_on);
      ("ignoreFailure", option_to_yojson boolean__to_yojson x.ignore_failure);
      ("currentBuildSummary", option_to_yojson build_summary_to_yojson x.current_build_summary);
      ( "priorBuildSummaryList",
        option_to_yojson build_summaries_to_yojson x.prior_build_summary_list );
    ]

let build_groups_to_yojson tree = list_to_yojson build_group_to_yojson tree

let batch_report_mode_type_to_yojson (x : batch_report_mode_type) =
  match x with
  | REPORT_INDIVIDUAL_BUILDS -> `String "REPORT_INDIVIDUAL_BUILDS"
  | REPORT_AGGREGATED_BATCH -> `String "REPORT_AGGREGATED_BATCH"

let fleets_allowed_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree
let compute_types_allowed_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let batch_restrictions_to_yojson (x : batch_restrictions) =
  assoc_to_yojson
    [
      ("maximumBuildsAllowed", option_to_yojson wrapper_int_to_yojson x.maximum_builds_allowed);
      ( "computeTypesAllowed",
        option_to_yojson compute_types_allowed_to_yojson x.compute_types_allowed );
      ("fleetsAllowed", option_to_yojson fleets_allowed_to_yojson x.fleets_allowed);
    ]

let project_build_batch_config_to_yojson (x : project_build_batch_config) =
  assoc_to_yojson
    [
      ("serviceRole", option_to_yojson non_empty_string_to_yojson x.service_role);
      ("combineArtifacts", option_to_yojson wrapper_boolean_to_yojson x.combine_artifacts);
      ("restrictions", option_to_yojson batch_restrictions_to_yojson x.restrictions);
      ("timeoutInMins", option_to_yojson wrapper_int_to_yojson x.timeout_in_mins);
      ("batchReportMode", option_to_yojson batch_report_mode_type_to_yojson x.batch_report_mode);
    ]

let file_system_type_to_yojson (x : file_system_type) = match x with EFS -> `String "EFS"

let project_file_system_location_to_yojson (x : project_file_system_location) =
  assoc_to_yojson
    [
      ("type", option_to_yojson file_system_type_to_yojson x.type_);
      ("location", option_to_yojson string__to_yojson x.location);
      ("mountPoint", option_to_yojson string__to_yojson x.mount_point);
      ("identifier", option_to_yojson string__to_yojson x.identifier);
      ("mountOptions", option_to_yojson string__to_yojson x.mount_options);
    ]

let project_file_system_locations_to_yojson tree =
  list_to_yojson project_file_system_location_to_yojson tree

let wrapper_long_to_yojson = long_to_yojson
let security_group_ids_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree
let subnets_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let vpc_config_to_yojson (x : vpc_config) =
  assoc_to_yojson
    [
      ("vpcId", option_to_yojson non_empty_string_to_yojson x.vpc_id);
      ("subnets", option_to_yojson subnets_to_yojson x.subnets);
      ("securityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
    ]

let bucket_owner_access_to_yojson (x : bucket_owner_access) =
  match x with NONE -> `String "NONE" | READ_ONLY -> `String "READ_ONLY" | FULL -> `String "FULL"

let logs_config_status_type_to_yojson (x : logs_config_status_type) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let s3_logs_config_to_yojson (x : s3_logs_config) =
  assoc_to_yojson
    [
      ("status", Some (logs_config_status_type_to_yojson x.status));
      ("location", option_to_yojson string__to_yojson x.location);
      ("encryptionDisabled", option_to_yojson wrapper_boolean_to_yojson x.encryption_disabled);
      ("bucketOwnerAccess", option_to_yojson bucket_owner_access_to_yojson x.bucket_owner_access);
    ]

let cloud_watch_logs_config_to_yojson (x : cloud_watch_logs_config) =
  assoc_to_yojson
    [
      ("status", Some (logs_config_status_type_to_yojson x.status));
      ("groupName", option_to_yojson string__to_yojson x.group_name);
      ("streamName", option_to_yojson string__to_yojson x.stream_name);
    ]

let logs_config_to_yojson (x : logs_config) =
  assoc_to_yojson
    [
      ("cloudWatchLogs", option_to_yojson cloud_watch_logs_config_to_yojson x.cloud_watch_logs);
      ("s3Logs", option_to_yojson s3_logs_config_to_yojson x.s3_logs);
    ]

let host_kernel_to_yojson (x : host_kernel) =
  match x with
  | LINUX_KERNEL_4 -> `String "LINUX_KERNEL_4"
  | LINUX_KERNEL_6 -> `String "LINUX_KERNEL_6"
  | LINUX_KERNEL_LATEST -> `String "LINUX_KERNEL_LATEST"

let docker_server_status_to_yojson (x : docker_server_status) =
  assoc_to_yojson
    [
      ("status", option_to_yojson string__to_yojson x.status);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let compute_type_to_yojson (x : compute_type) =
  match x with
  | BUILD_GENERAL1_SMALL -> `String "BUILD_GENERAL1_SMALL"
  | BUILD_GENERAL1_MEDIUM -> `String "BUILD_GENERAL1_MEDIUM"
  | BUILD_GENERAL1_LARGE -> `String "BUILD_GENERAL1_LARGE"
  | BUILD_GENERAL1_XLARGE -> `String "BUILD_GENERAL1_XLARGE"
  | BUILD_GENERAL1_2XLARGE -> `String "BUILD_GENERAL1_2XLARGE"
  | BUILD_LAMBDA_1GB -> `String "BUILD_LAMBDA_1GB"
  | BUILD_LAMBDA_2GB -> `String "BUILD_LAMBDA_2GB"
  | BUILD_LAMBDA_4GB -> `String "BUILD_LAMBDA_4GB"
  | BUILD_LAMBDA_8GB -> `String "BUILD_LAMBDA_8GB"
  | BUILD_LAMBDA_10GB -> `String "BUILD_LAMBDA_10GB"
  | ATTRIBUTE_BASED_COMPUTE -> `String "ATTRIBUTE_BASED_COMPUTE"
  | CUSTOM_INSTANCE_TYPE -> `String "CUSTOM_INSTANCE_TYPE"

let docker_server_to_yojson (x : docker_server) =
  assoc_to_yojson
    [
      ("computeType", Some (compute_type_to_yojson x.compute_type));
      ("securityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ("status", option_to_yojson docker_server_status_to_yojson x.status);
    ]

let image_pull_credentials_type_to_yojson (x : image_pull_credentials_type) =
  match x with CODEBUILD -> `String "CODEBUILD" | SERVICE_ROLE -> `String "SERVICE_ROLE"

let credential_provider_type_to_yojson (x : credential_provider_type) =
  match x with SECRETS_MANAGER -> `String "SECRETS_MANAGER"

let registry_credential_to_yojson (x : registry_credential) =
  assoc_to_yojson
    [
      ("credential", Some (non_empty_string_to_yojson x.credential));
      ("credentialProvider", Some (credential_provider_type_to_yojson x.credential_provider));
    ]

let environment_variable_type_to_yojson (x : environment_variable_type) =
  match x with
  | PLAINTEXT -> `String "PLAINTEXT"
  | PARAMETER_STORE -> `String "PARAMETER_STORE"
  | SECRETS_MANAGER -> `String "SECRETS_MANAGER"

let environment_variable_to_yojson (x : environment_variable) =
  assoc_to_yojson
    [
      ("name", Some (non_empty_string_to_yojson x.name));
      ("value", Some (string__to_yojson x.value));
      ("type", option_to_yojson environment_variable_type_to_yojson x.type_);
    ]

let environment_variables_to_yojson tree = list_to_yojson environment_variable_to_yojson tree

let project_fleet_to_yojson (x : project_fleet) =
  assoc_to_yojson [ ("fleetArn", option_to_yojson string__to_yojson x.fleet_arn) ]

let machine_type_to_yojson (x : machine_type) =
  match x with GENERAL -> `String "GENERAL" | NVME -> `String "NVME"

let compute_configuration_to_yojson (x : compute_configuration) =
  assoc_to_yojson
    [
      ("vCpu", option_to_yojson wrapper_long_to_yojson x.v_cpu);
      ("memory", option_to_yojson wrapper_long_to_yojson x.memory);
      ("disk", option_to_yojson wrapper_long_to_yojson x.disk);
      ("machineType", option_to_yojson machine_type_to_yojson x.machine_type);
      ("instanceType", option_to_yojson non_empty_string_to_yojson x.instance_type);
    ]

let environment_type_to_yojson (x : environment_type) =
  match x with
  | WINDOWS_CONTAINER -> `String "WINDOWS_CONTAINER"
  | LINUX_CONTAINER -> `String "LINUX_CONTAINER"
  | LINUX_GPU_CONTAINER -> `String "LINUX_GPU_CONTAINER"
  | ARM_CONTAINER -> `String "ARM_CONTAINER"
  | WINDOWS_SERVER_2019_CONTAINER -> `String "WINDOWS_SERVER_2019_CONTAINER"
  | WINDOWS_SERVER_2022_CONTAINER -> `String "WINDOWS_SERVER_2022_CONTAINER"
  | LINUX_LAMBDA_CONTAINER -> `String "LINUX_LAMBDA_CONTAINER"
  | ARM_LAMBDA_CONTAINER -> `String "ARM_LAMBDA_CONTAINER"
  | LINUX_EC2 -> `String "LINUX_EC2"
  | ARM_EC2 -> `String "ARM_EC2"
  | WINDOWS_EC2 -> `String "WINDOWS_EC2"
  | MAC_ARM -> `String "MAC_ARM"

let project_environment_to_yojson (x : project_environment) =
  assoc_to_yojson
    [
      ("type", Some (environment_type_to_yojson x.type_));
      ("image", Some (non_empty_string_to_yojson x.image));
      ("computeType", Some (compute_type_to_yojson x.compute_type));
      ( "computeConfiguration",
        option_to_yojson compute_configuration_to_yojson x.compute_configuration );
      ("fleet", option_to_yojson project_fleet_to_yojson x.fleet);
      ( "environmentVariables",
        option_to_yojson environment_variables_to_yojson x.environment_variables );
      ("privilegedMode", option_to_yojson wrapper_boolean_to_yojson x.privileged_mode);
      ("certificate", option_to_yojson string__to_yojson x.certificate);
      ("registryCredential", option_to_yojson registry_credential_to_yojson x.registry_credential);
      ( "imagePullCredentialsType",
        option_to_yojson image_pull_credentials_type_to_yojson x.image_pull_credentials_type );
      ("dockerServer", option_to_yojson docker_server_to_yojson x.docker_server);
      ("hostKernel", option_to_yojson host_kernel_to_yojson x.host_kernel);
    ]

let cache_mode_to_yojson (x : cache_mode) =
  match x with
  | LOCAL_DOCKER_LAYER_CACHE -> `String "LOCAL_DOCKER_LAYER_CACHE"
  | LOCAL_SOURCE_CACHE -> `String "LOCAL_SOURCE_CACHE"
  | LOCAL_CUSTOM_CACHE -> `String "LOCAL_CUSTOM_CACHE"

let project_cache_modes_to_yojson tree = list_to_yojson cache_mode_to_yojson tree

let cache_type_to_yojson (x : cache_type) =
  match x with NO_CACHE -> `String "NO_CACHE" | S3 -> `String "S3" | LOCAL -> `String "LOCAL"

let project_cache_to_yojson (x : project_cache) =
  assoc_to_yojson
    [
      ("type", Some (cache_type_to_yojson x.type_));
      ("location", option_to_yojson string__to_yojson x.location);
      ("modes", option_to_yojson project_cache_modes_to_yojson x.modes);
      ("cacheNamespace", option_to_yojson string__to_yojson x.cache_namespace);
    ]

let build_artifacts_to_yojson (x : build_artifacts) =
  assoc_to_yojson
    [
      ("location", option_to_yojson string__to_yojson x.location);
      ("sha256sum", option_to_yojson string__to_yojson x.sha256sum);
      ("md5sum", option_to_yojson string__to_yojson x.md5sum);
      ("overrideArtifactName", option_to_yojson wrapper_boolean_to_yojson x.override_artifact_name);
      ("encryptionDisabled", option_to_yojson wrapper_boolean_to_yojson x.encryption_disabled);
      ("artifactIdentifier", option_to_yojson string__to_yojson x.artifact_identifier);
      ("bucketOwnerAccess", option_to_yojson bucket_owner_access_to_yojson x.bucket_owner_access);
    ]

let build_artifacts_list_to_yojson tree = list_to_yojson build_artifacts_to_yojson tree

let project_source_version_to_yojson (x : project_source_version) =
  assoc_to_yojson
    [
      ("sourceIdentifier", Some (string__to_yojson x.source_identifier));
      ("sourceVersion", Some (string__to_yojson x.source_version));
    ]

let project_secondary_source_versions_to_yojson tree =
  list_to_yojson project_source_version_to_yojson tree

let build_status_config_to_yojson (x : build_status_config) =
  assoc_to_yojson
    [
      ("context", option_to_yojson string__to_yojson x.context);
      ("targetUrl", option_to_yojson string__to_yojson x.target_url);
    ]

let source_auth_type_to_yojson (x : source_auth_type) =
  match x with
  | OAUTH -> `String "OAUTH"
  | CODECONNECTIONS -> `String "CODECONNECTIONS"
  | SECRETS_MANAGER -> `String "SECRETS_MANAGER"

let source_auth_to_yojson (x : source_auth) =
  assoc_to_yojson
    [
      ("type", Some (source_auth_type_to_yojson x.type_));
      ("resource", option_to_yojson string__to_yojson x.resource);
    ]

let git_submodules_config_to_yojson (x : git_submodules_config) =
  assoc_to_yojson [ ("fetchSubmodules", Some (wrapper_boolean_to_yojson x.fetch_submodules)) ]

let git_clone_depth_to_yojson = int_to_yojson

let source_type_to_yojson (x : source_type) =
  match x with
  | CODECOMMIT -> `String "CODECOMMIT"
  | CODEPIPELINE -> `String "CODEPIPELINE"
  | GITHUB -> `String "GITHUB"
  | GITLAB -> `String "GITLAB"
  | GITLAB_SELF_MANAGED -> `String "GITLAB_SELF_MANAGED"
  | S3 -> `String "S3"
  | BITBUCKET -> `String "BITBUCKET"
  | GITHUB_ENTERPRISE -> `String "GITHUB_ENTERPRISE"
  | NO_SOURCE -> `String "NO_SOURCE"

let project_source_to_yojson (x : project_source) =
  assoc_to_yojson
    [
      ("type", Some (source_type_to_yojson x.type_));
      ("location", option_to_yojson string__to_yojson x.location);
      ("gitCloneDepth", option_to_yojson git_clone_depth_to_yojson x.git_clone_depth);
      ( "gitSubmodulesConfig",
        option_to_yojson git_submodules_config_to_yojson x.git_submodules_config );
      ("buildspec", option_to_yojson string__to_yojson x.buildspec);
      ("auth", option_to_yojson source_auth_to_yojson x.auth);
      ("reportBuildStatus", option_to_yojson wrapper_boolean_to_yojson x.report_build_status);
      ("buildStatusConfig", option_to_yojson build_status_config_to_yojson x.build_status_config);
      ("insecureSsl", option_to_yojson wrapper_boolean_to_yojson x.insecure_ssl);
      ("sourceIdentifier", option_to_yojson string__to_yojson x.source_identifier);
    ]

let project_sources_to_yojson tree = list_to_yojson project_source_to_yojson tree

let phase_context_to_yojson (x : phase_context) =
  assoc_to_yojson
    [
      ("statusCode", option_to_yojson string__to_yojson x.status_code);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let phase_contexts_to_yojson tree = list_to_yojson phase_context_to_yojson tree

let build_batch_phase_type_to_yojson (x : build_batch_phase_type) =
  match x with
  | SUBMITTED -> `String "SUBMITTED"
  | DOWNLOAD_BATCHSPEC -> `String "DOWNLOAD_BATCHSPEC"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMBINE_ARTIFACTS -> `String "COMBINE_ARTIFACTS"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | STOPPED -> `String "STOPPED"

let build_batch_phase_to_yojson (x : build_batch_phase) =
  assoc_to_yojson
    [
      ("phaseType", option_to_yojson build_batch_phase_type_to_yojson x.phase_type);
      ("phaseStatus", option_to_yojson status_type_to_yojson x.phase_status);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("durationInSeconds", option_to_yojson wrapper_long_to_yojson x.duration_in_seconds);
      ("contexts", option_to_yojson phase_contexts_to_yojson x.contexts);
    ]

let build_batch_phases_to_yojson tree = list_to_yojson build_batch_phase_to_yojson tree

let build_batch_to_yojson (x : build_batch) =
  assoc_to_yojson
    [
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("currentPhase", option_to_yojson string__to_yojson x.current_phase);
      ("buildBatchStatus", option_to_yojson status_type_to_yojson x.build_batch_status);
      ("sourceVersion", option_to_yojson non_empty_string_to_yojson x.source_version);
      ( "resolvedSourceVersion",
        option_to_yojson non_empty_string_to_yojson x.resolved_source_version );
      ("projectName", option_to_yojson non_empty_string_to_yojson x.project_name);
      ("phases", option_to_yojson build_batch_phases_to_yojson x.phases);
      ("source", option_to_yojson project_source_to_yojson x.source);
      ("secondarySources", option_to_yojson project_sources_to_yojson x.secondary_sources);
      ( "secondarySourceVersions",
        option_to_yojson project_secondary_source_versions_to_yojson x.secondary_source_versions );
      ("artifacts", option_to_yojson build_artifacts_to_yojson x.artifacts);
      ("secondaryArtifacts", option_to_yojson build_artifacts_list_to_yojson x.secondary_artifacts);
      ("cache", option_to_yojson project_cache_to_yojson x.cache);
      ("environment", option_to_yojson project_environment_to_yojson x.environment);
      ("serviceRole", option_to_yojson non_empty_string_to_yojson x.service_role);
      ("logConfig", option_to_yojson logs_config_to_yojson x.log_config);
      ("buildTimeoutInMinutes", option_to_yojson wrapper_int_to_yojson x.build_timeout_in_minutes);
      ("queuedTimeoutInMinutes", option_to_yojson wrapper_int_to_yojson x.queued_timeout_in_minutes);
      ("complete", option_to_yojson boolean__to_yojson x.complete);
      ("initiator", option_to_yojson string__to_yojson x.initiator);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("encryptionKey", option_to_yojson non_empty_string_to_yojson x.encryption_key);
      ("buildBatchNumber", option_to_yojson wrapper_long_to_yojson x.build_batch_number);
      ( "fileSystemLocations",
        option_to_yojson project_file_system_locations_to_yojson x.file_system_locations );
      ( "buildBatchConfig",
        option_to_yojson project_build_batch_config_to_yojson x.build_batch_config );
      ("buildGroups", option_to_yojson build_groups_to_yojson x.build_groups);
      ("debugSessionEnabled", option_to_yojson wrapper_boolean_to_yojson x.debug_session_enabled);
      ("reportArns", option_to_yojson build_report_arns_to_yojson x.report_arns);
    ]

let build_batches_to_yojson tree = list_to_yojson build_batch_to_yojson tree

let batch_get_build_batches_output_to_yojson (x : batch_get_build_batches_output) =
  assoc_to_yojson
    [
      ("buildBatches", option_to_yojson build_batches_to_yojson x.build_batches);
      ("buildBatchesNotFound", option_to_yojson build_batch_ids_to_yojson x.build_batches_not_found);
    ]

let batch_get_build_batches_input_to_yojson (x : batch_get_build_batches_input) =
  assoc_to_yojson [ ("ids", Some (build_batch_ids_to_yojson x.ids)) ]

let debug_session_to_yojson (x : debug_session) =
  assoc_to_yojson
    [
      ("sessionEnabled", option_to_yojson wrapper_boolean_to_yojson x.session_enabled);
      ("sessionTarget", option_to_yojson non_empty_string_to_yojson x.session_target);
    ]

let exported_environment_variable_to_yojson (x : exported_environment_variable) =
  assoc_to_yojson
    [
      ("name", option_to_yojson non_empty_string_to_yojson x.name);
      ("value", option_to_yojson string__to_yojson x.value);
    ]

let exported_environment_variables_to_yojson tree =
  list_to_yojson exported_environment_variable_to_yojson tree

let network_interface_to_yojson (x : network_interface) =
  assoc_to_yojson
    [
      ("subnetId", option_to_yojson non_empty_string_to_yojson x.subnet_id);
      ("networkInterfaceId", option_to_yojson non_empty_string_to_yojson x.network_interface_id);
    ]

let logs_location_to_yojson (x : logs_location) =
  assoc_to_yojson
    [
      ("groupName", option_to_yojson string__to_yojson x.group_name);
      ("streamName", option_to_yojson string__to_yojson x.stream_name);
      ("deepLink", option_to_yojson string__to_yojson x.deep_link);
      ("s3DeepLink", option_to_yojson string__to_yojson x.s3_deep_link);
      ("cloudWatchLogsArn", option_to_yojson string__to_yojson x.cloud_watch_logs_arn);
      ("s3LogsArn", option_to_yojson string__to_yojson x.s3_logs_arn);
      ("cloudWatchLogs", option_to_yojson cloud_watch_logs_config_to_yojson x.cloud_watch_logs);
      ("s3Logs", option_to_yojson s3_logs_config_to_yojson x.s3_logs);
    ]

let build_phase_type_to_yojson (x : build_phase_type) =
  match x with
  | SUBMITTED -> `String "SUBMITTED"
  | QUEUED -> `String "QUEUED"
  | PROVISIONING -> `String "PROVISIONING"
  | DOWNLOAD_SOURCE -> `String "DOWNLOAD_SOURCE"
  | INSTALL -> `String "INSTALL"
  | PRE_BUILD -> `String "PRE_BUILD"
  | BUILD -> `String "BUILD"
  | POST_BUILD -> `String "POST_BUILD"
  | UPLOAD_ARTIFACTS -> `String "UPLOAD_ARTIFACTS"
  | FINALIZING -> `String "FINALIZING"
  | COMPLETED -> `String "COMPLETED"

let build_phase_to_yojson (x : build_phase) =
  assoc_to_yojson
    [
      ("phaseType", option_to_yojson build_phase_type_to_yojson x.phase_type);
      ("phaseStatus", option_to_yojson status_type_to_yojson x.phase_status);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("durationInSeconds", option_to_yojson wrapper_long_to_yojson x.duration_in_seconds);
      ("contexts", option_to_yojson phase_contexts_to_yojson x.contexts);
    ]

let build_phases_to_yojson tree = list_to_yojson build_phase_to_yojson tree

let build_to_yojson (x : build) =
  assoc_to_yojson
    [
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("buildNumber", option_to_yojson wrapper_long_to_yojson x.build_number);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("currentPhase", option_to_yojson string__to_yojson x.current_phase);
      ("buildStatus", option_to_yojson status_type_to_yojson x.build_status);
      ("sourceVersion", option_to_yojson non_empty_string_to_yojson x.source_version);
      ( "resolvedSourceVersion",
        option_to_yojson non_empty_string_to_yojson x.resolved_source_version );
      ("projectName", option_to_yojson non_empty_string_to_yojson x.project_name);
      ("phases", option_to_yojson build_phases_to_yojson x.phases);
      ("source", option_to_yojson project_source_to_yojson x.source);
      ("secondarySources", option_to_yojson project_sources_to_yojson x.secondary_sources);
      ( "secondarySourceVersions",
        option_to_yojson project_secondary_source_versions_to_yojson x.secondary_source_versions );
      ("artifacts", option_to_yojson build_artifacts_to_yojson x.artifacts);
      ("secondaryArtifacts", option_to_yojson build_artifacts_list_to_yojson x.secondary_artifacts);
      ("cache", option_to_yojson project_cache_to_yojson x.cache);
      ("environment", option_to_yojson project_environment_to_yojson x.environment);
      ("serviceRole", option_to_yojson non_empty_string_to_yojson x.service_role);
      ("logs", option_to_yojson logs_location_to_yojson x.logs);
      ("timeoutInMinutes", option_to_yojson wrapper_int_to_yojson x.timeout_in_minutes);
      ("queuedTimeoutInMinutes", option_to_yojson wrapper_int_to_yojson x.queued_timeout_in_minutes);
      ("buildComplete", option_to_yojson boolean__to_yojson x.build_complete);
      ("initiator", option_to_yojson string__to_yojson x.initiator);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("networkInterface", option_to_yojson network_interface_to_yojson x.network_interface);
      ("encryptionKey", option_to_yojson non_empty_string_to_yojson x.encryption_key);
      ( "exportedEnvironmentVariables",
        option_to_yojson exported_environment_variables_to_yojson x.exported_environment_variables
      );
      ("reportArns", option_to_yojson build_report_arns_to_yojson x.report_arns);
      ( "fileSystemLocations",
        option_to_yojson project_file_system_locations_to_yojson x.file_system_locations );
      ("debugSession", option_to_yojson debug_session_to_yojson x.debug_session);
      ("buildBatchArn", option_to_yojson string__to_yojson x.build_batch_arn);
      ("autoRetryConfig", option_to_yojson auto_retry_config_to_yojson x.auto_retry_config);
    ]

let builds_to_yojson tree = list_to_yojson build_to_yojson tree

let batch_get_builds_output_to_yojson (x : batch_get_builds_output) =
  assoc_to_yojson
    [
      ("builds", option_to_yojson builds_to_yojson x.builds);
      ("buildsNotFound", option_to_yojson build_ids_to_yojson x.builds_not_found);
    ]

let batch_get_builds_input_to_yojson (x : batch_get_builds_input) =
  assoc_to_yojson [ ("ids", Some (build_ids_to_yojson x.ids)) ]

let command_execution_ids_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree
let sensitive_non_empty_string_to_yojson = string_to_yojson
let command_type_to_yojson (x : command_type) = match x with SHELL -> `String "SHELL"

let command_execution_to_yojson (x : command_execution) =
  assoc_to_yojson
    [
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
      ("sandboxId", option_to_yojson non_empty_string_to_yojson x.sandbox_id);
      ("submitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("status", option_to_yojson non_empty_string_to_yojson x.status);
      ("command", option_to_yojson sensitive_non_empty_string_to_yojson x.command);
      ("type", option_to_yojson command_type_to_yojson x.type_);
      ("exitCode", option_to_yojson non_empty_string_to_yojson x.exit_code);
      ( "standardOutputContent",
        option_to_yojson sensitive_non_empty_string_to_yojson x.standard_output_content );
      ( "standardErrContent",
        option_to_yojson sensitive_non_empty_string_to_yojson x.standard_err_content );
      ("logs", option_to_yojson logs_location_to_yojson x.logs);
      ("sandboxArn", option_to_yojson non_empty_string_to_yojson x.sandbox_arn);
    ]

let command_executions_to_yojson tree = list_to_yojson command_execution_to_yojson tree

let batch_get_command_executions_output_to_yojson (x : batch_get_command_executions_output) =
  assoc_to_yojson
    [
      ("commandExecutions", option_to_yojson command_executions_to_yojson x.command_executions);
      ( "commandExecutionsNotFound",
        option_to_yojson command_execution_ids_to_yojson x.command_executions_not_found );
    ]

let batch_get_command_executions_input_to_yojson (x : batch_get_command_executions_input) =
  assoc_to_yojson
    [
      ("sandboxId", Some (non_empty_string_to_yojson x.sandbox_id));
      ("commandExecutionIds", Some (command_execution_ids_to_yojson x.command_execution_ids));
    ]

let fleet_names_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree
let value_input_to_yojson = string_to_yojson
let key_input_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("key", option_to_yojson key_input_to_yojson x.key);
      ("value", option_to_yojson value_input_to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let fleet_proxy_rule_entities_to_yojson tree = list_to_yojson string__to_yojson tree

let fleet_proxy_rule_effect_type_to_yojson (x : fleet_proxy_rule_effect_type) =
  match x with ALLOW -> `String "ALLOW" | DENY -> `String "DENY"

let fleet_proxy_rule_type_to_yojson (x : fleet_proxy_rule_type) =
  match x with DOMAIN -> `String "DOMAIN" | IP -> `String "IP"

let fleet_proxy_rule_to_yojson (x : fleet_proxy_rule) =
  assoc_to_yojson
    [
      ("type", Some (fleet_proxy_rule_type_to_yojson x.type_));
      ("effect", Some (fleet_proxy_rule_effect_type_to_yojson x.effect_));
      ("entities", Some (fleet_proxy_rule_entities_to_yojson x.entities));
    ]

let fleet_proxy_rules_to_yojson tree = list_to_yojson fleet_proxy_rule_to_yojson tree

let fleet_proxy_rule_behavior_to_yojson (x : fleet_proxy_rule_behavior) =
  match x with ALLOW_ALL -> `String "ALLOW_ALL" | DENY_ALL -> `String "DENY_ALL"

let proxy_configuration_to_yojson (x : proxy_configuration) =
  assoc_to_yojson
    [
      ("defaultBehavior", option_to_yojson fleet_proxy_rule_behavior_to_yojson x.default_behavior);
      ("orderedProxyRules", option_to_yojson fleet_proxy_rules_to_yojson x.ordered_proxy_rules);
    ]

let fleet_overflow_behavior_to_yojson (x : fleet_overflow_behavior) =
  match x with QUEUE -> `String "QUEUE" | ON_DEMAND -> `String "ON_DEMAND"

let fleet_capacity_to_yojson = int_to_yojson
let wrapper_double_to_yojson = double_to_yojson

let fleet_scaling_metric_type_to_yojson (x : fleet_scaling_metric_type) =
  match x with FLEET_UTILIZATION_RATE -> `String "FLEET_UTILIZATION_RATE"

let target_tracking_scaling_configuration_to_yojson (x : target_tracking_scaling_configuration) =
  assoc_to_yojson
    [
      ("metricType", option_to_yojson fleet_scaling_metric_type_to_yojson x.metric_type);
      ("targetValue", option_to_yojson wrapper_double_to_yojson x.target_value);
    ]

let target_tracking_scaling_configurations_to_yojson tree =
  list_to_yojson target_tracking_scaling_configuration_to_yojson tree

let fleet_scaling_type_to_yojson (x : fleet_scaling_type) =
  match x with TARGET_TRACKING_SCALING -> `String "TARGET_TRACKING_SCALING"

let scaling_configuration_output_to_yojson (x : scaling_configuration_output) =
  assoc_to_yojson
    [
      ("scalingType", option_to_yojson fleet_scaling_type_to_yojson x.scaling_type);
      ( "targetTrackingScalingConfigs",
        option_to_yojson target_tracking_scaling_configurations_to_yojson
          x.target_tracking_scaling_configs );
      ("maxCapacity", option_to_yojson fleet_capacity_to_yojson x.max_capacity);
      ("desiredCapacity", option_to_yojson fleet_capacity_to_yojson x.desired_capacity);
    ]

let fleet_context_code_to_yojson (x : fleet_context_code) =
  match x with
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | ACTION_REQUIRED -> `String "ACTION_REQUIRED"
  | PENDING_DELETION -> `String "PENDING_DELETION"
  | INSUFFICIENT_CAPACITY -> `String "INSUFFICIENT_CAPACITY"

let fleet_status_code_to_yojson (x : fleet_status_code) =
  match x with
  | CREATING -> `String "CREATING"
  | UPDATING -> `String "UPDATING"
  | ROTATING -> `String "ROTATING"
  | PENDING_DELETION -> `String "PENDING_DELETION"
  | DELETING -> `String "DELETING"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | UPDATE_ROLLBACK_FAILED -> `String "UPDATE_ROLLBACK_FAILED"
  | ACTIVE -> `String "ACTIVE"

let fleet_status_to_yojson (x : fleet_status) =
  assoc_to_yojson
    [
      ("statusCode", option_to_yojson fleet_status_code_to_yojson x.status_code);
      ("context", option_to_yojson fleet_context_code_to_yojson x.context);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let fleet_name_to_yojson = string_to_yojson

let fleet_to_yojson (x : fleet) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("name", option_to_yojson fleet_name_to_yojson x.name);
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
      ("created", option_to_yojson timestamp_to_yojson x.created);
      ("lastModified", option_to_yojson timestamp_to_yojson x.last_modified);
      ("status", option_to_yojson fleet_status_to_yojson x.status);
      ("baseCapacity", option_to_yojson fleet_capacity_to_yojson x.base_capacity);
      ("environmentType", option_to_yojson environment_type_to_yojson x.environment_type);
      ("computeType", option_to_yojson compute_type_to_yojson x.compute_type);
      ( "computeConfiguration",
        option_to_yojson compute_configuration_to_yojson x.compute_configuration );
      ( "scalingConfiguration",
        option_to_yojson scaling_configuration_output_to_yojson x.scaling_configuration );
      ("overflowBehavior", option_to_yojson fleet_overflow_behavior_to_yojson x.overflow_behavior);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("proxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
      ("imageId", option_to_yojson non_empty_string_to_yojson x.image_id);
      ("fleetServiceRole", option_to_yojson non_empty_string_to_yojson x.fleet_service_role);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let fleets_to_yojson tree = list_to_yojson fleet_to_yojson tree

let batch_get_fleets_output_to_yojson (x : batch_get_fleets_output) =
  assoc_to_yojson
    [
      ("fleets", option_to_yojson fleets_to_yojson x.fleets);
      ("fleetsNotFound", option_to_yojson fleet_names_to_yojson x.fleets_not_found);
    ]

let batch_get_fleets_input_to_yojson (x : batch_get_fleets_input) =
  assoc_to_yojson [ ("names", Some (fleet_names_to_yojson x.names)) ]

let project_names_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let project_visibility_type_to_yojson (x : project_visibility_type) =
  match x with PUBLIC_READ -> `String "PUBLIC_READ" | PRIVATE -> `String "PRIVATE"

let project_badge_to_yojson (x : project_badge) =
  assoc_to_yojson
    [
      ("badgeEnabled", option_to_yojson boolean__to_yojson x.badge_enabled);
      ("badgeRequestUrl", option_to_yojson string__to_yojson x.badge_request_url);
    ]

let pull_request_build_approver_role_to_yojson (x : pull_request_build_approver_role) =
  match x with
  | GITHUB_READ -> `String "GITHUB_READ"
  | GITHUB_TRIAGE -> `String "GITHUB_TRIAGE"
  | GITHUB_WRITE -> `String "GITHUB_WRITE"
  | GITHUB_MAINTAIN -> `String "GITHUB_MAINTAIN"
  | GITHUB_ADMIN -> `String "GITHUB_ADMIN"
  | GITLAB_GUEST -> `String "GITLAB_GUEST"
  | GITLAB_PLANNER -> `String "GITLAB_PLANNER"
  | GITLAB_REPORTER -> `String "GITLAB_REPORTER"
  | GITLAB_DEVELOPER -> `String "GITLAB_DEVELOPER"
  | GITLAB_MAINTAINER -> `String "GITLAB_MAINTAINER"
  | GITLAB_OWNER -> `String "GITLAB_OWNER"
  | BITBUCKET_READ -> `String "BITBUCKET_READ"
  | BITBUCKET_WRITE -> `String "BITBUCKET_WRITE"
  | BITBUCKET_ADMIN -> `String "BITBUCKET_ADMIN"

let pull_request_build_approver_roles_to_yojson tree =
  list_to_yojson pull_request_build_approver_role_to_yojson tree

let pull_request_build_comment_approval_to_yojson (x : pull_request_build_comment_approval) =
  match x with
  | DISABLED -> `String "DISABLED"
  | ALL_PULL_REQUESTS -> `String "ALL_PULL_REQUESTS"
  | FORK_PULL_REQUESTS -> `String "FORK_PULL_REQUESTS"

let pull_request_build_policy_to_yojson (x : pull_request_build_policy) =
  assoc_to_yojson
    [
      ( "requiresCommentApproval",
        Some (pull_request_build_comment_approval_to_yojson x.requires_comment_approval) );
      ( "approverRoles",
        option_to_yojson pull_request_build_approver_roles_to_yojson x.approver_roles );
    ]

let webhook_status_to_yojson (x : webhook_status) =
  match x with
  | CREATING -> `String "CREATING"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"

let webhook_scope_type_to_yojson (x : webhook_scope_type) =
  match x with
  | GITHUB_ORGANIZATION -> `String "GITHUB_ORGANIZATION"
  | GITHUB_GLOBAL -> `String "GITHUB_GLOBAL"
  | GITLAB_GROUP -> `String "GITLAB_GROUP"

let scope_configuration_to_yojson (x : scope_configuration) =
  assoc_to_yojson
    [
      ("name", Some (string__to_yojson x.name));
      ("domain", option_to_yojson string__to_yojson x.domain);
      ("scope", Some (webhook_scope_type_to_yojson x.scope));
    ]

let webhook_build_type_to_yojson (x : webhook_build_type) =
  match x with
  | BUILD -> `String "BUILD"
  | BUILD_BATCH -> `String "BUILD_BATCH"
  | RUNNER_BUILDKITE_BUILD -> `String "RUNNER_BUILDKITE_BUILD"

let webhook_filter_type_to_yojson (x : webhook_filter_type) =
  match x with
  | EVENT -> `String "EVENT"
  | BASE_REF -> `String "BASE_REF"
  | HEAD_REF -> `String "HEAD_REF"
  | ACTOR_ACCOUNT_ID -> `String "ACTOR_ACCOUNT_ID"
  | FILE_PATH -> `String "FILE_PATH"
  | COMMIT_MESSAGE -> `String "COMMIT_MESSAGE"
  | WORKFLOW_NAME -> `String "WORKFLOW_NAME"
  | TAG_NAME -> `String "TAG_NAME"
  | RELEASE_NAME -> `String "RELEASE_NAME"
  | REPOSITORY_NAME -> `String "REPOSITORY_NAME"
  | ORGANIZATION_NAME -> `String "ORGANIZATION_NAME"

let webhook_filter_to_yojson (x : webhook_filter) =
  assoc_to_yojson
    [
      ("type", Some (webhook_filter_type_to_yojson x.type_));
      ("pattern", Some (string__to_yojson x.pattern));
      ("excludeMatchedPattern", option_to_yojson wrapper_boolean_to_yojson x.exclude_matched_pattern);
    ]

let filter_group_to_yojson tree = list_to_yojson webhook_filter_to_yojson tree
let filter_groups_to_yojson tree = list_to_yojson filter_group_to_yojson tree

let webhook_to_yojson (x : webhook) =
  assoc_to_yojson
    [
      ("url", option_to_yojson non_empty_string_to_yojson x.url);
      ("payloadUrl", option_to_yojson non_empty_string_to_yojson x.payload_url);
      ("secret", option_to_yojson non_empty_string_to_yojson x.secret);
      ("branchFilter", option_to_yojson string__to_yojson x.branch_filter);
      ("filterGroups", option_to_yojson filter_groups_to_yojson x.filter_groups);
      ("buildType", option_to_yojson webhook_build_type_to_yojson x.build_type);
      ("manualCreation", option_to_yojson wrapper_boolean_to_yojson x.manual_creation);
      ("lastModifiedSecret", option_to_yojson timestamp_to_yojson x.last_modified_secret);
      ("scopeConfiguration", option_to_yojson scope_configuration_to_yojson x.scope_configuration);
      ("status", option_to_yojson webhook_status_to_yojson x.status);
      ("statusMessage", option_to_yojson string__to_yojson x.status_message);
      ( "pullRequestBuildPolicy",
        option_to_yojson pull_request_build_policy_to_yojson x.pull_request_build_policy );
    ]

let time_out_to_yojson = int_to_yojson
let build_time_out_to_yojson = int_to_yojson

let project_artifacts_to_yojson (x : project_artifacts) =
  assoc_to_yojson
    [
      ("type", Some (artifacts_type_to_yojson x.type_));
      ("location", option_to_yojson string__to_yojson x.location);
      ("path", option_to_yojson string__to_yojson x.path);
      ("namespaceType", option_to_yojson artifact_namespace_to_yojson x.namespace_type);
      ("name", option_to_yojson string__to_yojson x.name);
      ("packaging", option_to_yojson artifact_packaging_to_yojson x.packaging);
      ("overrideArtifactName", option_to_yojson wrapper_boolean_to_yojson x.override_artifact_name);
      ("encryptionDisabled", option_to_yojson wrapper_boolean_to_yojson x.encryption_disabled);
      ("artifactIdentifier", option_to_yojson string__to_yojson x.artifact_identifier);
      ("bucketOwnerAccess", option_to_yojson bucket_owner_access_to_yojson x.bucket_owner_access);
    ]

let project_artifacts_list_to_yojson tree = list_to_yojson project_artifacts_to_yojson tree
let project_description_to_yojson = string_to_yojson
let project_name_to_yojson = string_to_yojson

let project_to_yojson (x : project) =
  assoc_to_yojson
    [
      ("name", option_to_yojson project_name_to_yojson x.name);
      ("arn", option_to_yojson string__to_yojson x.arn);
      ("description", option_to_yojson project_description_to_yojson x.description);
      ("source", option_to_yojson project_source_to_yojson x.source);
      ("secondarySources", option_to_yojson project_sources_to_yojson x.secondary_sources);
      ("sourceVersion", option_to_yojson string__to_yojson x.source_version);
      ( "secondarySourceVersions",
        option_to_yojson project_secondary_source_versions_to_yojson x.secondary_source_versions );
      ("artifacts", option_to_yojson project_artifacts_to_yojson x.artifacts);
      ("secondaryArtifacts", option_to_yojson project_artifacts_list_to_yojson x.secondary_artifacts);
      ("cache", option_to_yojson project_cache_to_yojson x.cache);
      ("environment", option_to_yojson project_environment_to_yojson x.environment);
      ("serviceRole", option_to_yojson non_empty_string_to_yojson x.service_role);
      ("timeoutInMinutes", option_to_yojson build_time_out_to_yojson x.timeout_in_minutes);
      ("queuedTimeoutInMinutes", option_to_yojson time_out_to_yojson x.queued_timeout_in_minutes);
      ("encryptionKey", option_to_yojson non_empty_string_to_yojson x.encryption_key);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("created", option_to_yojson timestamp_to_yojson x.created);
      ("lastModified", option_to_yojson timestamp_to_yojson x.last_modified);
      ("webhook", option_to_yojson webhook_to_yojson x.webhook);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("badge", option_to_yojson project_badge_to_yojson x.badge);
      ("logsConfig", option_to_yojson logs_config_to_yojson x.logs_config);
      ( "fileSystemLocations",
        option_to_yojson project_file_system_locations_to_yojson x.file_system_locations );
      ( "buildBatchConfig",
        option_to_yojson project_build_batch_config_to_yojson x.build_batch_config );
      ("concurrentBuildLimit", option_to_yojson wrapper_int_to_yojson x.concurrent_build_limit);
      ("projectVisibility", option_to_yojson project_visibility_type_to_yojson x.project_visibility);
      ("publicProjectAlias", option_to_yojson non_empty_string_to_yojson x.public_project_alias);
      ("resourceAccessRole", option_to_yojson non_empty_string_to_yojson x.resource_access_role);
      ("autoRetryLimit", option_to_yojson wrapper_int_to_yojson x.auto_retry_limit);
    ]

let projects_to_yojson tree = list_to_yojson project_to_yojson tree

let batch_get_projects_output_to_yojson (x : batch_get_projects_output) =
  assoc_to_yojson
    [
      ("projects", option_to_yojson projects_to_yojson x.projects);
      ("projectsNotFound", option_to_yojson project_names_to_yojson x.projects_not_found);
    ]

let batch_get_projects_input_to_yojson (x : batch_get_projects_input) =
  assoc_to_yojson [ ("names", Some (project_names_to_yojson x.names)) ]

let report_group_arns_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let report_group_status_type_to_yojson (x : report_group_status_type) =
  match x with ACTIVE -> `String "ACTIVE" | DELETING -> `String "DELETING"

let report_packaging_type_to_yojson (x : report_packaging_type) =
  match x with ZIP -> `String "ZIP" | NONE -> `String "NONE"

let s3_report_export_config_to_yojson (x : s3_report_export_config) =
  assoc_to_yojson
    [
      ("bucket", option_to_yojson non_empty_string_to_yojson x.bucket);
      ("bucketOwner", option_to_yojson string__to_yojson x.bucket_owner);
      ("path", option_to_yojson string__to_yojson x.path);
      ("packaging", option_to_yojson report_packaging_type_to_yojson x.packaging);
      ("encryptionKey", option_to_yojson non_empty_string_to_yojson x.encryption_key);
      ("encryptionDisabled", option_to_yojson wrapper_boolean_to_yojson x.encryption_disabled);
    ]

let report_export_config_type_to_yojson (x : report_export_config_type) =
  match x with S3 -> `String "S3" | NO_EXPORT -> `String "NO_EXPORT"

let report_export_config_to_yojson (x : report_export_config) =
  assoc_to_yojson
    [
      ("exportConfigType", option_to_yojson report_export_config_type_to_yojson x.export_config_type);
      ("s3Destination", option_to_yojson s3_report_export_config_to_yojson x.s3_destination);
    ]

let report_type_to_yojson (x : report_type) =
  match x with TEST -> `String "TEST" | CODE_COVERAGE -> `String "CODE_COVERAGE"

let report_group_name_to_yojson = string_to_yojson

let report_group_to_yojson (x : report_group) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("name", option_to_yojson report_group_name_to_yojson x.name);
      ("type", option_to_yojson report_type_to_yojson x.type_);
      ("exportConfig", option_to_yojson report_export_config_to_yojson x.export_config);
      ("created", option_to_yojson timestamp_to_yojson x.created);
      ("lastModified", option_to_yojson timestamp_to_yojson x.last_modified);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("status", option_to_yojson report_group_status_type_to_yojson x.status);
    ]

let report_groups_to_yojson tree = list_to_yojson report_group_to_yojson tree

let batch_get_report_groups_output_to_yojson (x : batch_get_report_groups_output) =
  assoc_to_yojson
    [
      ("reportGroups", option_to_yojson report_groups_to_yojson x.report_groups);
      ( "reportGroupsNotFound",
        option_to_yojson report_group_arns_to_yojson x.report_groups_not_found );
    ]

let batch_get_report_groups_input_to_yojson (x : batch_get_report_groups_input) =
  assoc_to_yojson [ ("reportGroupArns", Some (report_group_arns_to_yojson x.report_group_arns)) ]

let report_arns_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree
let non_negative_int_to_yojson = int_to_yojson
let percentage_to_yojson = double_to_yojson

let code_coverage_report_summary_to_yojson (x : code_coverage_report_summary) =
  assoc_to_yojson
    [
      ("lineCoveragePercentage", option_to_yojson percentage_to_yojson x.line_coverage_percentage);
      ("linesCovered", option_to_yojson non_negative_int_to_yojson x.lines_covered);
      ("linesMissed", option_to_yojson non_negative_int_to_yojson x.lines_missed);
      ( "branchCoveragePercentage",
        option_to_yojson percentage_to_yojson x.branch_coverage_percentage );
      ("branchesCovered", option_to_yojson non_negative_int_to_yojson x.branches_covered);
      ("branchesMissed", option_to_yojson non_negative_int_to_yojson x.branches_missed);
    ]

let report_status_counts_to_yojson tree = map_to_yojson string__to_yojson wrapper_int_to_yojson tree

let test_report_summary_to_yojson (x : test_report_summary) =
  assoc_to_yojson
    [
      ("total", Some (wrapper_int_to_yojson x.total));
      ("statusCounts", Some (report_status_counts_to_yojson x.status_counts));
      ("durationInNanoSeconds", Some (wrapper_long_to_yojson x.duration_in_nano_seconds));
    ]

let report_status_type_to_yojson (x : report_status_type) =
  match x with
  | GENERATING -> `String "GENERATING"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | INCOMPLETE -> `String "INCOMPLETE"
  | DELETING -> `String "DELETING"

let report_to_yojson (x : report) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("type", option_to_yojson report_type_to_yojson x.type_);
      ("name", option_to_yojson string__to_yojson x.name);
      ("reportGroupArn", option_to_yojson non_empty_string_to_yojson x.report_group_arn);
      ("executionId", option_to_yojson string__to_yojson x.execution_id);
      ("status", option_to_yojson report_status_type_to_yojson x.status);
      ("created", option_to_yojson timestamp_to_yojson x.created);
      ("expired", option_to_yojson timestamp_to_yojson x.expired);
      ("exportConfig", option_to_yojson report_export_config_to_yojson x.export_config);
      ("truncated", option_to_yojson wrapper_boolean_to_yojson x.truncated);
      ("testSummary", option_to_yojson test_report_summary_to_yojson x.test_summary);
      ( "codeCoverageSummary",
        option_to_yojson code_coverage_report_summary_to_yojson x.code_coverage_summary );
    ]

let reports_to_yojson tree = list_to_yojson report_to_yojson tree

let batch_get_reports_output_to_yojson (x : batch_get_reports_output) =
  assoc_to_yojson
    [
      ("reports", option_to_yojson reports_to_yojson x.reports);
      ("reportsNotFound", option_to_yojson report_arns_to_yojson x.reports_not_found);
    ]

let batch_get_reports_input_to_yojson (x : batch_get_reports_input) =
  assoc_to_yojson [ ("reportArns", Some (report_arns_to_yojson x.report_arns)) ]

let sandbox_ids_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let sandbox_session_phase_to_yojson (x : sandbox_session_phase) =
  assoc_to_yojson
    [
      ("phaseType", option_to_yojson string__to_yojson x.phase_type);
      ("phaseStatus", option_to_yojson status_type_to_yojson x.phase_status);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("durationInSeconds", option_to_yojson wrapper_long_to_yojson x.duration_in_seconds);
      ("contexts", option_to_yojson phase_contexts_to_yojson x.contexts);
    ]

let sandbox_session_phases_to_yojson tree = list_to_yojson sandbox_session_phase_to_yojson tree

let sandbox_session_to_yojson (x : sandbox_session) =
  assoc_to_yojson
    [
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
      ("status", option_to_yojson string__to_yojson x.status);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("currentPhase", option_to_yojson string__to_yojson x.current_phase);
      ("phases", option_to_yojson sandbox_session_phases_to_yojson x.phases);
      ( "resolvedSourceVersion",
        option_to_yojson non_empty_string_to_yojson x.resolved_source_version );
      ("logs", option_to_yojson logs_location_to_yojson x.logs);
      ("networkInterface", option_to_yojson network_interface_to_yojson x.network_interface);
    ]

let sandbox_to_yojson (x : sandbox) =
  assoc_to_yojson
    [
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("projectName", option_to_yojson non_empty_string_to_yojson x.project_name);
      ("requestTime", option_to_yojson timestamp_to_yojson x.request_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("status", option_to_yojson string__to_yojson x.status);
      ("source", option_to_yojson project_source_to_yojson x.source);
      ("sourceVersion", option_to_yojson non_empty_string_to_yojson x.source_version);
      ("secondarySources", option_to_yojson project_sources_to_yojson x.secondary_sources);
      ( "secondarySourceVersions",
        option_to_yojson project_secondary_source_versions_to_yojson x.secondary_source_versions );
      ("environment", option_to_yojson project_environment_to_yojson x.environment);
      ( "fileSystemLocations",
        option_to_yojson project_file_system_locations_to_yojson x.file_system_locations );
      ("timeoutInMinutes", option_to_yojson wrapper_int_to_yojson x.timeout_in_minutes);
      ("queuedTimeoutInMinutes", option_to_yojson wrapper_int_to_yojson x.queued_timeout_in_minutes);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("logConfig", option_to_yojson logs_config_to_yojson x.log_config);
      ("encryptionKey", option_to_yojson non_empty_string_to_yojson x.encryption_key);
      ("serviceRole", option_to_yojson non_empty_string_to_yojson x.service_role);
      ("currentSession", option_to_yojson sandbox_session_to_yojson x.current_session);
    ]

let sandboxes_to_yojson tree = list_to_yojson sandbox_to_yojson tree

let batch_get_sandboxes_output_to_yojson (x : batch_get_sandboxes_output) =
  assoc_to_yojson
    [
      ("sandboxes", option_to_yojson sandboxes_to_yojson x.sandboxes);
      ("sandboxesNotFound", option_to_yojson sandbox_ids_to_yojson x.sandboxes_not_found);
    ]

let batch_get_sandboxes_input_to_yojson (x : batch_get_sandboxes_input) =
  assoc_to_yojson [ ("ids", Some (sandbox_ids_to_yojson x.ids)) ]

let build_batch_filter_to_yojson (x : build_batch_filter) =
  assoc_to_yojson [ ("status", option_to_yojson status_type_to_yojson x.status) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let o_auth_provider_exception_to_yojson (x : o_auth_provider_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let update_webhook_output_to_yojson (x : update_webhook_output) =
  assoc_to_yojson [ ("webhook", option_to_yojson webhook_to_yojson x.webhook) ]

let update_webhook_input_to_yojson (x : update_webhook_input) =
  assoc_to_yojson
    [
      ("projectName", Some (project_name_to_yojson x.project_name));
      ("branchFilter", option_to_yojson string__to_yojson x.branch_filter);
      ("rotateSecret", option_to_yojson boolean__to_yojson x.rotate_secret);
      ("filterGroups", option_to_yojson filter_groups_to_yojson x.filter_groups);
      ("buildType", option_to_yojson webhook_build_type_to_yojson x.build_type);
      ( "pullRequestBuildPolicy",
        option_to_yojson pull_request_build_policy_to_yojson x.pull_request_build_policy );
    ]

let update_report_group_output_to_yojson (x : update_report_group_output) =
  assoc_to_yojson [ ("reportGroup", option_to_yojson report_group_to_yojson x.report_group) ]

let update_report_group_input_to_yojson (x : update_report_group_input) =
  assoc_to_yojson
    [
      ("arn", Some (non_empty_string_to_yojson x.arn));
      ("exportConfig", option_to_yojson report_export_config_to_yojson x.export_config);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let update_project_visibility_output_to_yojson (x : update_project_visibility_output) =
  assoc_to_yojson
    [
      ("projectArn", option_to_yojson non_empty_string_to_yojson x.project_arn);
      ("publicProjectAlias", option_to_yojson non_empty_string_to_yojson x.public_project_alias);
      ("projectVisibility", option_to_yojson project_visibility_type_to_yojson x.project_visibility);
    ]

let update_project_visibility_input_to_yojson (x : update_project_visibility_input) =
  assoc_to_yojson
    [
      ("projectArn", Some (non_empty_string_to_yojson x.project_arn));
      ("projectVisibility", Some (project_visibility_type_to_yojson x.project_visibility));
      ("resourceAccessRole", option_to_yojson non_empty_string_to_yojson x.resource_access_role);
    ]

let update_project_output_to_yojson (x : update_project_output) =
  assoc_to_yojson [ ("project", option_to_yojson project_to_yojson x.project) ]

let update_project_input_to_yojson (x : update_project_input) =
  assoc_to_yojson
    [
      ("name", Some (non_empty_string_to_yojson x.name));
      ("description", option_to_yojson project_description_to_yojson x.description);
      ("source", option_to_yojson project_source_to_yojson x.source);
      ("secondarySources", option_to_yojson project_sources_to_yojson x.secondary_sources);
      ("sourceVersion", option_to_yojson string__to_yojson x.source_version);
      ( "secondarySourceVersions",
        option_to_yojson project_secondary_source_versions_to_yojson x.secondary_source_versions );
      ("artifacts", option_to_yojson project_artifacts_to_yojson x.artifacts);
      ("secondaryArtifacts", option_to_yojson project_artifacts_list_to_yojson x.secondary_artifacts);
      ("cache", option_to_yojson project_cache_to_yojson x.cache);
      ("environment", option_to_yojson project_environment_to_yojson x.environment);
      ("serviceRole", option_to_yojson non_empty_string_to_yojson x.service_role);
      ("timeoutInMinutes", option_to_yojson build_time_out_to_yojson x.timeout_in_minutes);
      ("queuedTimeoutInMinutes", option_to_yojson time_out_to_yojson x.queued_timeout_in_minutes);
      ("encryptionKey", option_to_yojson non_empty_string_to_yojson x.encryption_key);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("badgeEnabled", option_to_yojson wrapper_boolean_to_yojson x.badge_enabled);
      ("logsConfig", option_to_yojson logs_config_to_yojson x.logs_config);
      ( "fileSystemLocations",
        option_to_yojson project_file_system_locations_to_yojson x.file_system_locations );
      ( "buildBatchConfig",
        option_to_yojson project_build_batch_config_to_yojson x.build_batch_config );
      ("concurrentBuildLimit", option_to_yojson wrapper_int_to_yojson x.concurrent_build_limit);
      ("autoRetryLimit", option_to_yojson wrapper_int_to_yojson x.auto_retry_limit);
    ]

let update_fleet_output_to_yojson (x : update_fleet_output) =
  assoc_to_yojson [ ("fleet", option_to_yojson fleet_to_yojson x.fleet) ]

let scaling_configuration_input_to_yojson (x : scaling_configuration_input) =
  assoc_to_yojson
    [
      ("scalingType", option_to_yojson fleet_scaling_type_to_yojson x.scaling_type);
      ( "targetTrackingScalingConfigs",
        option_to_yojson target_tracking_scaling_configurations_to_yojson
          x.target_tracking_scaling_configs );
      ("maxCapacity", option_to_yojson fleet_capacity_to_yojson x.max_capacity);
    ]

let update_fleet_input_to_yojson (x : update_fleet_input) =
  assoc_to_yojson
    [
      ("arn", Some (non_empty_string_to_yojson x.arn));
      ("baseCapacity", option_to_yojson fleet_capacity_to_yojson x.base_capacity);
      ("environmentType", option_to_yojson environment_type_to_yojson x.environment_type);
      ("computeType", option_to_yojson compute_type_to_yojson x.compute_type);
      ( "computeConfiguration",
        option_to_yojson compute_configuration_to_yojson x.compute_configuration );
      ( "scalingConfiguration",
        option_to_yojson scaling_configuration_input_to_yojson x.scaling_configuration );
      ("overflowBehavior", option_to_yojson fleet_overflow_behavior_to_yojson x.overflow_behavior);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("proxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
      ("imageId", option_to_yojson non_empty_string_to_yojson x.image_id);
      ("fleetServiceRole", option_to_yojson non_empty_string_to_yojson x.fleet_service_role);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let stop_sandbox_output_to_yojson (x : stop_sandbox_output) =
  assoc_to_yojson [ ("sandbox", option_to_yojson sandbox_to_yojson x.sandbox) ]

let stop_sandbox_input_to_yojson (x : stop_sandbox_input) =
  assoc_to_yojson [ ("id", Some (non_empty_string_to_yojson x.id)) ]

let stop_build_batch_output_to_yojson (x : stop_build_batch_output) =
  assoc_to_yojson [ ("buildBatch", option_to_yojson build_batch_to_yojson x.build_batch) ]

let stop_build_batch_input_to_yojson (x : stop_build_batch_input) =
  assoc_to_yojson [ ("id", Some (non_empty_string_to_yojson x.id)) ]

let stop_build_output_to_yojson (x : stop_build_output) =
  assoc_to_yojson [ ("build", option_to_yojson build_to_yojson x.build) ]

let stop_build_input_to_yojson (x : stop_build_input) =
  assoc_to_yojson [ ("id", Some (non_empty_string_to_yojson x.id)) ]

let ssm_session_to_yojson (x : ssm_session) =
  assoc_to_yojson
    [
      ("sessionId", option_to_yojson string__to_yojson x.session_id);
      ("tokenValue", option_to_yojson string__to_yojson x.token_value);
      ("streamUrl", option_to_yojson string__to_yojson x.stream_url);
    ]

let start_sandbox_connection_output_to_yojson (x : start_sandbox_connection_output) =
  assoc_to_yojson [ ("ssmSession", option_to_yojson ssm_session_to_yojson x.ssm_session) ]

let start_sandbox_connection_input_to_yojson (x : start_sandbox_connection_input) =
  assoc_to_yojson [ ("sandboxId", Some (non_empty_string_to_yojson x.sandbox_id)) ]

let start_sandbox_output_to_yojson (x : start_sandbox_output) =
  assoc_to_yojson [ ("sandbox", option_to_yojson sandbox_to_yojson x.sandbox) ]

let sensitive_string_to_yojson = string_to_yojson

let start_sandbox_input_to_yojson (x : start_sandbox_input) =
  assoc_to_yojson
    [
      ("projectName", option_to_yojson non_empty_string_to_yojson x.project_name);
      ("idempotencyToken", option_to_yojson sensitive_string_to_yojson x.idempotency_token);
    ]

let start_command_execution_output_to_yojson (x : start_command_execution_output) =
  assoc_to_yojson
    [ ("commandExecution", option_to_yojson command_execution_to_yojson x.command_execution) ]

let start_command_execution_input_to_yojson (x : start_command_execution_input) =
  assoc_to_yojson
    [
      ("sandboxId", Some (non_empty_string_to_yojson x.sandbox_id));
      ("command", Some (sensitive_non_empty_string_to_yojson x.command));
      ("type", option_to_yojson command_type_to_yojson x.type_);
    ]

let start_build_batch_output_to_yojson (x : start_build_batch_output) =
  assoc_to_yojson [ ("buildBatch", option_to_yojson build_batch_to_yojson x.build_batch) ]

let start_build_batch_input_to_yojson (x : start_build_batch_input) =
  assoc_to_yojson
    [
      ("projectName", Some (non_empty_string_to_yojson x.project_name));
      ( "secondarySourcesOverride",
        option_to_yojson project_sources_to_yojson x.secondary_sources_override );
      ( "secondarySourcesVersionOverride",
        option_to_yojson project_secondary_source_versions_to_yojson
          x.secondary_sources_version_override );
      ("sourceVersion", option_to_yojson string__to_yojson x.source_version);
      ("artifactsOverride", option_to_yojson project_artifacts_to_yojson x.artifacts_override);
      ( "secondaryArtifactsOverride",
        option_to_yojson project_artifacts_list_to_yojson x.secondary_artifacts_override );
      ( "environmentVariablesOverride",
        option_to_yojson environment_variables_to_yojson x.environment_variables_override );
      ("sourceTypeOverride", option_to_yojson source_type_to_yojson x.source_type_override);
      ("sourceLocationOverride", option_to_yojson string__to_yojson x.source_location_override);
      ("sourceAuthOverride", option_to_yojson source_auth_to_yojson x.source_auth_override);
      ( "gitCloneDepthOverride",
        option_to_yojson git_clone_depth_to_yojson x.git_clone_depth_override );
      ( "gitSubmodulesConfigOverride",
        option_to_yojson git_submodules_config_to_yojson x.git_submodules_config_override );
      ("buildspecOverride", option_to_yojson string__to_yojson x.buildspec_override);
      ("insecureSslOverride", option_to_yojson wrapper_boolean_to_yojson x.insecure_ssl_override);
      ( "reportBuildBatchStatusOverride",
        option_to_yojson wrapper_boolean_to_yojson x.report_build_batch_status_override );
      ( "environmentTypeOverride",
        option_to_yojson environment_type_to_yojson x.environment_type_override );
      ("imageOverride", option_to_yojson non_empty_string_to_yojson x.image_override);
      ("computeTypeOverride", option_to_yojson compute_type_to_yojson x.compute_type_override);
      ("certificateOverride", option_to_yojson string__to_yojson x.certificate_override);
      ("cacheOverride", option_to_yojson project_cache_to_yojson x.cache_override);
      ("serviceRoleOverride", option_to_yojson non_empty_string_to_yojson x.service_role_override);
      ( "privilegedModeOverride",
        option_to_yojson wrapper_boolean_to_yojson x.privileged_mode_override );
      ( "buildTimeoutInMinutesOverride",
        option_to_yojson build_time_out_to_yojson x.build_timeout_in_minutes_override );
      ( "queuedTimeoutInMinutesOverride",
        option_to_yojson time_out_to_yojson x.queued_timeout_in_minutes_override );
      ( "encryptionKeyOverride",
        option_to_yojson non_empty_string_to_yojson x.encryption_key_override );
      ("idempotencyToken", option_to_yojson string__to_yojson x.idempotency_token);
      ("logsConfigOverride", option_to_yojson logs_config_to_yojson x.logs_config_override);
      ( "registryCredentialOverride",
        option_to_yojson registry_credential_to_yojson x.registry_credential_override );
      ( "imagePullCredentialsTypeOverride",
        option_to_yojson image_pull_credentials_type_to_yojson
          x.image_pull_credentials_type_override );
      ( "buildBatchConfigOverride",
        option_to_yojson project_build_batch_config_to_yojson x.build_batch_config_override );
      ("debugSessionEnabled", option_to_yojson wrapper_boolean_to_yojson x.debug_session_enabled);
    ]

let start_build_output_to_yojson (x : start_build_output) =
  assoc_to_yojson [ ("build", option_to_yojson build_to_yojson x.build) ]

let start_build_input_to_yojson (x : start_build_input) =
  assoc_to_yojson
    [
      ("projectName", Some (non_empty_string_to_yojson x.project_name));
      ( "secondarySourcesOverride",
        option_to_yojson project_sources_to_yojson x.secondary_sources_override );
      ( "secondarySourcesVersionOverride",
        option_to_yojson project_secondary_source_versions_to_yojson
          x.secondary_sources_version_override );
      ("sourceVersion", option_to_yojson string__to_yojson x.source_version);
      ("artifactsOverride", option_to_yojson project_artifacts_to_yojson x.artifacts_override);
      ( "secondaryArtifactsOverride",
        option_to_yojson project_artifacts_list_to_yojson x.secondary_artifacts_override );
      ( "environmentVariablesOverride",
        option_to_yojson environment_variables_to_yojson x.environment_variables_override );
      ("sourceTypeOverride", option_to_yojson source_type_to_yojson x.source_type_override);
      ("sourceLocationOverride", option_to_yojson string__to_yojson x.source_location_override);
      ("sourceAuthOverride", option_to_yojson source_auth_to_yojson x.source_auth_override);
      ( "gitCloneDepthOverride",
        option_to_yojson git_clone_depth_to_yojson x.git_clone_depth_override );
      ( "gitSubmodulesConfigOverride",
        option_to_yojson git_submodules_config_to_yojson x.git_submodules_config_override );
      ("buildspecOverride", option_to_yojson string__to_yojson x.buildspec_override);
      ("insecureSslOverride", option_to_yojson wrapper_boolean_to_yojson x.insecure_ssl_override);
      ( "reportBuildStatusOverride",
        option_to_yojson wrapper_boolean_to_yojson x.report_build_status_override );
      ( "buildStatusConfigOverride",
        option_to_yojson build_status_config_to_yojson x.build_status_config_override );
      ( "environmentTypeOverride",
        option_to_yojson environment_type_to_yojson x.environment_type_override );
      ("imageOverride", option_to_yojson non_empty_string_to_yojson x.image_override);
      ("computeTypeOverride", option_to_yojson compute_type_to_yojson x.compute_type_override);
      ("certificateOverride", option_to_yojson string__to_yojson x.certificate_override);
      ("cacheOverride", option_to_yojson project_cache_to_yojson x.cache_override);
      ("serviceRoleOverride", option_to_yojson non_empty_string_to_yojson x.service_role_override);
      ( "privilegedModeOverride",
        option_to_yojson wrapper_boolean_to_yojson x.privileged_mode_override );
      ( "timeoutInMinutesOverride",
        option_to_yojson build_time_out_to_yojson x.timeout_in_minutes_override );
      ( "queuedTimeoutInMinutesOverride",
        option_to_yojson time_out_to_yojson x.queued_timeout_in_minutes_override );
      ( "encryptionKeyOverride",
        option_to_yojson non_empty_string_to_yojson x.encryption_key_override );
      ("idempotencyToken", option_to_yojson string__to_yojson x.idempotency_token);
      ("logsConfigOverride", option_to_yojson logs_config_to_yojson x.logs_config_override);
      ( "registryCredentialOverride",
        option_to_yojson registry_credential_to_yojson x.registry_credential_override );
      ( "imagePullCredentialsTypeOverride",
        option_to_yojson image_pull_credentials_type_to_yojson
          x.image_pull_credentials_type_override );
      ("debugSessionEnabled", option_to_yojson wrapper_boolean_to_yojson x.debug_session_enabled);
      ("fleetOverride", option_to_yojson project_fleet_to_yojson x.fleet_override);
      ("autoRetryLimitOverride", option_to_yojson wrapper_int_to_yojson x.auto_retry_limit_override);
      ("hostKernelOverride", option_to_yojson host_kernel_to_yojson x.host_kernel_override);
    ]

let retry_build_batch_output_to_yojson (x : retry_build_batch_output) =
  assoc_to_yojson [ ("buildBatch", option_to_yojson build_batch_to_yojson x.build_batch) ]

let retry_build_batch_type_to_yojson (x : retry_build_batch_type) =
  match x with
  | RETRY_ALL_BUILDS -> `String "RETRY_ALL_BUILDS"
  | RETRY_FAILED_BUILDS -> `String "RETRY_FAILED_BUILDS"

let retry_build_batch_input_to_yojson (x : retry_build_batch_input) =
  assoc_to_yojson
    [
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
      ("idempotencyToken", option_to_yojson string__to_yojson x.idempotency_token);
      ("retryType", option_to_yojson retry_build_batch_type_to_yojson x.retry_type);
    ]

let retry_build_output_to_yojson (x : retry_build_output) =
  assoc_to_yojson [ ("build", option_to_yojson build_to_yojson x.build) ]

let retry_build_input_to_yojson (x : retry_build_input) =
  assoc_to_yojson
    [
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
      ("idempotencyToken", option_to_yojson string__to_yojson x.idempotency_token);
    ]

let put_resource_policy_output_to_yojson (x : put_resource_policy_output) =
  assoc_to_yojson [ ("resourceArn", option_to_yojson non_empty_string_to_yojson x.resource_arn) ]

let put_resource_policy_input_to_yojson (x : put_resource_policy_input) =
  assoc_to_yojson
    [
      ("policy", Some (non_empty_string_to_yojson x.policy));
      ("resourceArn", Some (non_empty_string_to_yojson x.resource_arn));
    ]

let server_type_to_yojson (x : server_type) =
  match x with
  | GITHUB -> `String "GITHUB"
  | BITBUCKET -> `String "BITBUCKET"
  | GITHUB_ENTERPRISE -> `String "GITHUB_ENTERPRISE"
  | GITLAB -> `String "GITLAB"
  | GITLAB_SELF_MANAGED -> `String "GITLAB_SELF_MANAGED"

let source_credentials_info_to_yojson (x : source_credentials_info) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("serverType", option_to_yojson server_type_to_yojson x.server_type);
      ("authType", option_to_yojson auth_type_to_yojson x.auth_type);
      ("resource", option_to_yojson string__to_yojson x.resource);
    ]

let source_credentials_infos_to_yojson tree = list_to_yojson source_credentials_info_to_yojson tree

let list_source_credentials_output_to_yojson (x : list_source_credentials_output) =
  assoc_to_yojson
    [
      ( "sourceCredentialsInfos",
        option_to_yojson source_credentials_infos_to_yojson x.source_credentials_infos );
    ]

let list_source_credentials_input_to_yojson = unit_to_yojson

let list_shared_report_groups_output_to_yojson (x : list_shared_report_groups_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("reportGroups", option_to_yojson report_group_arns_to_yojson x.report_groups);
    ]

let page_size_to_yojson = int_to_yojson

let shared_resource_sort_by_type_to_yojson (x : shared_resource_sort_by_type) =
  match x with ARN -> `String "ARN" | MODIFIED_TIME -> `String "MODIFIED_TIME"

let sort_order_type_to_yojson (x : sort_order_type) =
  match x with ASCENDING -> `String "ASCENDING" | DESCENDING -> `String "DESCENDING"

let list_shared_report_groups_input_to_yojson (x : list_shared_report_groups_input) =
  assoc_to_yojson
    [
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("sortBy", option_to_yojson shared_resource_sort_by_type_to_yojson x.sort_by);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let project_arns_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let list_shared_projects_output_to_yojson (x : list_shared_projects_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("projects", option_to_yojson project_arns_to_yojson x.projects);
    ]

let list_shared_projects_input_to_yojson (x : list_shared_projects_input) =
  assoc_to_yojson
    [
      ("sortBy", option_to_yojson shared_resource_sort_by_type_to_yojson x.sort_by);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson non_empty_string_to_yojson x.next_token);
    ]

let list_sandboxes_for_project_output_to_yojson (x : list_sandboxes_for_project_output) =
  assoc_to_yojson
    [
      ("ids", option_to_yojson sandbox_ids_to_yojson x.ids);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_sandboxes_for_project_input_to_yojson (x : list_sandboxes_for_project_input) =
  assoc_to_yojson
    [
      ("projectName", Some (non_empty_string_to_yojson x.project_name));
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("nextToken", option_to_yojson sensitive_string_to_yojson x.next_token);
    ]

let list_sandboxes_output_to_yojson (x : list_sandboxes_output) =
  assoc_to_yojson
    [
      ("ids", option_to_yojson sandbox_ids_to_yojson x.ids);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_sandboxes_input_to_yojson (x : list_sandboxes_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_reports_for_report_group_output_to_yojson (x : list_reports_for_report_group_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("reports", option_to_yojson report_arns_to_yojson x.reports);
    ]

let report_filter_to_yojson (x : report_filter) =
  assoc_to_yojson [ ("status", option_to_yojson report_status_type_to_yojson x.status) ]

let list_reports_for_report_group_input_to_yojson (x : list_reports_for_report_group_input) =
  assoc_to_yojson
    [
      ("reportGroupArn", Some (string__to_yojson x.report_group_arn));
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("filter", option_to_yojson report_filter_to_yojson x.filter);
    ]

let list_reports_output_to_yojson (x : list_reports_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("reports", option_to_yojson report_arns_to_yojson x.reports);
    ]

let list_reports_input_to_yojson (x : list_reports_input) =
  assoc_to_yojson
    [
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("filter", option_to_yojson report_filter_to_yojson x.filter);
    ]

let list_report_groups_output_to_yojson (x : list_report_groups_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("reportGroups", option_to_yojson report_group_arns_to_yojson x.report_groups);
    ]

let report_group_sort_by_type_to_yojson (x : report_group_sort_by_type) =
  match x with
  | NAME -> `String "NAME"
  | CREATED_TIME -> `String "CREATED_TIME"
  | LAST_MODIFIED_TIME -> `String "LAST_MODIFIED_TIME"

let list_report_groups_input_to_yojson (x : list_report_groups_input) =
  assoc_to_yojson
    [
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("sortBy", option_to_yojson report_group_sort_by_type_to_yojson x.sort_by);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let list_projects_output_to_yojson (x : list_projects_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("projects", option_to_yojson project_names_to_yojson x.projects);
    ]

let project_sort_by_type_to_yojson (x : project_sort_by_type) =
  match x with
  | NAME -> `String "NAME"
  | CREATED_TIME -> `String "CREATED_TIME"
  | LAST_MODIFIED_TIME -> `String "LAST_MODIFIED_TIME"

let list_projects_input_to_yojson (x : list_projects_input) =
  assoc_to_yojson
    [
      ("sortBy", option_to_yojson project_sort_by_type_to_yojson x.sort_by);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("nextToken", option_to_yojson non_empty_string_to_yojson x.next_token);
    ]

let fleet_arns_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let list_fleets_output_to_yojson (x : list_fleets_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("fleets", option_to_yojson fleet_arns_to_yojson x.fleets);
    ]

let fleet_sort_by_type_to_yojson (x : fleet_sort_by_type) =
  match x with
  | NAME -> `String "NAME"
  | CREATED_TIME -> `String "CREATED_TIME"
  | LAST_MODIFIED_TIME -> `String "LAST_MODIFIED_TIME"

let list_fleets_input_to_yojson (x : list_fleets_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson sensitive_string_to_yojson x.next_token);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("sortBy", option_to_yojson fleet_sort_by_type_to_yojson x.sort_by);
    ]

let image_versions_to_yojson tree = list_to_yojson string__to_yojson tree

let environment_image_to_yojson (x : environment_image) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("description", option_to_yojson string__to_yojson x.description);
      ("versions", option_to_yojson image_versions_to_yojson x.versions);
    ]

let environment_images_to_yojson tree = list_to_yojson environment_image_to_yojson tree

let language_type_to_yojson (x : language_type) =
  match x with
  | JAVA -> `String "JAVA"
  | PYTHON -> `String "PYTHON"
  | NODE_JS -> `String "NODE_JS"
  | RUBY -> `String "RUBY"
  | GOLANG -> `String "GOLANG"
  | DOCKER -> `String "DOCKER"
  | ANDROID -> `String "ANDROID"
  | DOTNET -> `String "DOTNET"
  | BASE -> `String "BASE"
  | PHP -> `String "PHP"

let environment_language_to_yojson (x : environment_language) =
  assoc_to_yojson
    [
      ("language", option_to_yojson language_type_to_yojson x.language);
      ("images", option_to_yojson environment_images_to_yojson x.images);
    ]

let environment_languages_to_yojson tree = list_to_yojson environment_language_to_yojson tree

let platform_type_to_yojson (x : platform_type) =
  match x with
  | DEBIAN -> `String "DEBIAN"
  | AMAZON_LINUX -> `String "AMAZON_LINUX"
  | UBUNTU -> `String "UBUNTU"
  | WINDOWS_SERVER -> `String "WINDOWS_SERVER"

let environment_platform_to_yojson (x : environment_platform) =
  assoc_to_yojson
    [
      ("platform", option_to_yojson platform_type_to_yojson x.platform);
      ("languages", option_to_yojson environment_languages_to_yojson x.languages);
    ]

let environment_platforms_to_yojson tree = list_to_yojson environment_platform_to_yojson tree

let list_curated_environment_images_output_to_yojson (x : list_curated_environment_images_output) =
  assoc_to_yojson [ ("platforms", option_to_yojson environment_platforms_to_yojson x.platforms) ]

let list_curated_environment_images_input_to_yojson = unit_to_yojson

let list_command_executions_for_sandbox_output_to_yojson
    (x : list_command_executions_for_sandbox_output) =
  assoc_to_yojson
    [
      ("commandExecutions", option_to_yojson command_executions_to_yojson x.command_executions);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_command_executions_for_sandbox_input_to_yojson
    (x : list_command_executions_for_sandbox_input) =
  assoc_to_yojson
    [
      ("sandboxId", Some (non_empty_string_to_yojson x.sandbox_id));
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("nextToken", option_to_yojson sensitive_string_to_yojson x.next_token);
    ]

let list_builds_for_project_output_to_yojson (x : list_builds_for_project_output) =
  assoc_to_yojson
    [
      ("ids", option_to_yojson build_ids_to_yojson x.ids);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_builds_for_project_input_to_yojson (x : list_builds_for_project_input) =
  assoc_to_yojson
    [
      ("projectName", Some (non_empty_string_to_yojson x.project_name));
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_builds_output_to_yojson (x : list_builds_output) =
  assoc_to_yojson
    [
      ("ids", option_to_yojson build_ids_to_yojson x.ids);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_builds_input_to_yojson (x : list_builds_input) =
  assoc_to_yojson
    [
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_build_batches_for_project_output_to_yojson (x : list_build_batches_for_project_output) =
  assoc_to_yojson
    [
      ("ids", option_to_yojson build_batch_ids_to_yojson x.ids);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_build_batches_for_project_input_to_yojson (x : list_build_batches_for_project_input) =
  assoc_to_yojson
    [
      ("projectName", option_to_yojson non_empty_string_to_yojson x.project_name);
      ("filter", option_to_yojson build_batch_filter_to_yojson x.filter);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_build_batches_output_to_yojson (x : list_build_batches_output) =
  assoc_to_yojson
    [
      ("ids", option_to_yojson build_batch_ids_to_yojson x.ids);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_build_batches_input_to_yojson (x : list_build_batches_input) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson build_batch_filter_to_yojson x.filter);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let invalidate_project_cache_output_to_yojson = unit_to_yojson

let invalidate_project_cache_input_to_yojson (x : invalidate_project_cache_input) =
  assoc_to_yojson [ ("projectName", Some (non_empty_string_to_yojson x.project_name)) ]

let resource_already_exists_exception_to_yojson (x : resource_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let import_source_credentials_output_to_yojson (x : import_source_credentials_output) =
  assoc_to_yojson [ ("arn", option_to_yojson non_empty_string_to_yojson x.arn) ]

let import_source_credentials_input_to_yojson (x : import_source_credentials_input) =
  assoc_to_yojson
    [
      ("username", option_to_yojson non_empty_string_to_yojson x.username);
      ("token", Some (sensitive_non_empty_string_to_yojson x.token));
      ("serverType", Some (server_type_to_yojson x.server_type));
      ("authType", Some (auth_type_to_yojson x.auth_type));
      ("shouldOverwrite", option_to_yojson wrapper_boolean_to_yojson x.should_overwrite);
    ]

let get_resource_policy_output_to_yojson (x : get_resource_policy_output) =
  assoc_to_yojson [ ("policy", option_to_yojson non_empty_string_to_yojson x.policy) ]

let get_resource_policy_input_to_yojson (x : get_resource_policy_input) =
  assoc_to_yojson [ ("resourceArn", Some (non_empty_string_to_yojson x.resource_arn)) ]

let report_with_raw_data_to_yojson (x : report_with_raw_data) =
  assoc_to_yojson
    [
      ("reportArn", option_to_yojson non_empty_string_to_yojson x.report_arn);
      ("data", option_to_yojson string__to_yojson x.data);
    ]

let report_group_trend_raw_data_list_to_yojson tree =
  list_to_yojson report_with_raw_data_to_yojson tree

let report_group_trend_stats_to_yojson (x : report_group_trend_stats) =
  assoc_to_yojson
    [
      ("average", option_to_yojson string__to_yojson x.average);
      ("max", option_to_yojson string__to_yojson x.max);
      ("min", option_to_yojson string__to_yojson x.min);
    ]

let get_report_group_trend_output_to_yojson (x : get_report_group_trend_output) =
  assoc_to_yojson
    [
      ("stats", option_to_yojson report_group_trend_stats_to_yojson x.stats);
      ("rawData", option_to_yojson report_group_trend_raw_data_list_to_yojson x.raw_data);
    ]

let report_group_trend_field_type_to_yojson (x : report_group_trend_field_type) =
  match x with
  | PASS_RATE -> `String "PASS_RATE"
  | DURATION -> `String "DURATION"
  | TOTAL -> `String "TOTAL"
  | LINE_COVERAGE -> `String "LINE_COVERAGE"
  | LINES_COVERED -> `String "LINES_COVERED"
  | LINES_MISSED -> `String "LINES_MISSED"
  | BRANCH_COVERAGE -> `String "BRANCH_COVERAGE"
  | BRANCHES_COVERED -> `String "BRANCHES_COVERED"
  | BRANCHES_MISSED -> `String "BRANCHES_MISSED"

let get_report_group_trend_input_to_yojson (x : get_report_group_trend_input) =
  assoc_to_yojson
    [
      ("reportGroupArn", Some (non_empty_string_to_yojson x.report_group_arn));
      ("numOfReports", option_to_yojson page_size_to_yojson x.num_of_reports);
      ("trendField", Some (report_group_trend_field_type_to_yojson x.trend_field));
    ]

let test_case_to_yojson (x : test_case) =
  assoc_to_yojson
    [
      ("reportArn", option_to_yojson non_empty_string_to_yojson x.report_arn);
      ("testRawDataPath", option_to_yojson string__to_yojson x.test_raw_data_path);
      ("prefix", option_to_yojson string__to_yojson x.prefix);
      ("name", option_to_yojson string__to_yojson x.name);
      ("status", option_to_yojson string__to_yojson x.status);
      ("durationInNanoSeconds", option_to_yojson wrapper_long_to_yojson x.duration_in_nano_seconds);
      ("message", option_to_yojson string__to_yojson x.message);
      ("expired", option_to_yojson timestamp_to_yojson x.expired);
      ("testSuiteName", option_to_yojson string__to_yojson x.test_suite_name);
    ]

let test_cases_to_yojson tree = list_to_yojson test_case_to_yojson tree

let describe_test_cases_output_to_yojson (x : describe_test_cases_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("testCases", option_to_yojson test_cases_to_yojson x.test_cases);
    ]

let test_case_filter_to_yojson (x : test_case_filter) =
  assoc_to_yojson
    [
      ("status", option_to_yojson string__to_yojson x.status);
      ("keyword", option_to_yojson string__to_yojson x.keyword);
    ]

let describe_test_cases_input_to_yojson (x : describe_test_cases_input) =
  assoc_to_yojson
    [
      ("reportArn", Some (string__to_yojson x.report_arn));
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("filter", option_to_yojson test_case_filter_to_yojson x.filter);
    ]

let code_coverage_to_yojson (x : code_coverage) =
  assoc_to_yojson
    [
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
      ("reportARN", option_to_yojson non_empty_string_to_yojson x.report_ar_n);
      ("filePath", option_to_yojson non_empty_string_to_yojson x.file_path);
      ("lineCoveragePercentage", option_to_yojson percentage_to_yojson x.line_coverage_percentage);
      ("linesCovered", option_to_yojson non_negative_int_to_yojson x.lines_covered);
      ("linesMissed", option_to_yojson non_negative_int_to_yojson x.lines_missed);
      ( "branchCoveragePercentage",
        option_to_yojson percentage_to_yojson x.branch_coverage_percentage );
      ("branchesCovered", option_to_yojson non_negative_int_to_yojson x.branches_covered);
      ("branchesMissed", option_to_yojson non_negative_int_to_yojson x.branches_missed);
      ("expired", option_to_yojson timestamp_to_yojson x.expired);
    ]

let code_coverages_to_yojson tree = list_to_yojson code_coverage_to_yojson tree

let describe_code_coverages_output_to_yojson (x : describe_code_coverages_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("codeCoverages", option_to_yojson code_coverages_to_yojson x.code_coverages);
    ]

let report_code_coverage_sort_by_type_to_yojson (x : report_code_coverage_sort_by_type) =
  match x with
  | LINE_COVERAGE_PERCENTAGE -> `String "LINE_COVERAGE_PERCENTAGE"
  | FILE_PATH -> `String "FILE_PATH"

let describe_code_coverages_input_to_yojson (x : describe_code_coverages_input) =
  assoc_to_yojson
    [
      ("reportArn", Some (non_empty_string_to_yojson x.report_arn));
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("sortBy", option_to_yojson report_code_coverage_sort_by_type_to_yojson x.sort_by);
      ( "minLineCoveragePercentage",
        option_to_yojson percentage_to_yojson x.min_line_coverage_percentage );
      ( "maxLineCoveragePercentage",
        option_to_yojson percentage_to_yojson x.max_line_coverage_percentage );
    ]

let delete_webhook_output_to_yojson = unit_to_yojson

let delete_webhook_input_to_yojson (x : delete_webhook_input) =
  assoc_to_yojson [ ("projectName", Some (project_name_to_yojson x.project_name)) ]

let delete_source_credentials_output_to_yojson (x : delete_source_credentials_output) =
  assoc_to_yojson [ ("arn", option_to_yojson non_empty_string_to_yojson x.arn) ]

let delete_source_credentials_input_to_yojson (x : delete_source_credentials_input) =
  assoc_to_yojson [ ("arn", Some (non_empty_string_to_yojson x.arn)) ]

let delete_resource_policy_output_to_yojson = unit_to_yojson

let delete_resource_policy_input_to_yojson (x : delete_resource_policy_input) =
  assoc_to_yojson [ ("resourceArn", Some (non_empty_string_to_yojson x.resource_arn)) ]

let delete_report_group_output_to_yojson = unit_to_yojson

let delete_report_group_input_to_yojson (x : delete_report_group_input) =
  assoc_to_yojson
    [
      ("arn", Some (non_empty_string_to_yojson x.arn));
      ("deleteReports", option_to_yojson boolean__to_yojson x.delete_reports);
    ]

let delete_report_output_to_yojson = unit_to_yojson

let delete_report_input_to_yojson (x : delete_report_input) =
  assoc_to_yojson [ ("arn", Some (non_empty_string_to_yojson x.arn)) ]

let delete_project_output_to_yojson = unit_to_yojson

let delete_project_input_to_yojson (x : delete_project_input) =
  assoc_to_yojson [ ("name", Some (non_empty_string_to_yojson x.name)) ]

let delete_fleet_output_to_yojson = unit_to_yojson

let delete_fleet_input_to_yojson (x : delete_fleet_input) =
  assoc_to_yojson [ ("arn", Some (non_empty_string_to_yojson x.arn)) ]

let delete_build_batch_output_to_yojson (x : delete_build_batch_output) =
  assoc_to_yojson
    [
      ("statusCode", option_to_yojson string__to_yojson x.status_code);
      ("buildsDeleted", option_to_yojson build_ids_to_yojson x.builds_deleted);
      ("buildsNotDeleted", option_to_yojson builds_not_deleted_to_yojson x.builds_not_deleted);
    ]

let delete_build_batch_input_to_yojson (x : delete_build_batch_input) =
  assoc_to_yojson [ ("id", Some (non_empty_string_to_yojson x.id)) ]

let create_webhook_output_to_yojson (x : create_webhook_output) =
  assoc_to_yojson [ ("webhook", option_to_yojson webhook_to_yojson x.webhook) ]

let create_webhook_input_to_yojson (x : create_webhook_input) =
  assoc_to_yojson
    [
      ("projectName", Some (project_name_to_yojson x.project_name));
      ("branchFilter", option_to_yojson string__to_yojson x.branch_filter);
      ("filterGroups", option_to_yojson filter_groups_to_yojson x.filter_groups);
      ("buildType", option_to_yojson webhook_build_type_to_yojson x.build_type);
      ("manualCreation", option_to_yojson wrapper_boolean_to_yojson x.manual_creation);
      ("scopeConfiguration", option_to_yojson scope_configuration_to_yojson x.scope_configuration);
      ( "pullRequestBuildPolicy",
        option_to_yojson pull_request_build_policy_to_yojson x.pull_request_build_policy );
    ]

let create_report_group_output_to_yojson (x : create_report_group_output) =
  assoc_to_yojson [ ("reportGroup", option_to_yojson report_group_to_yojson x.report_group) ]

let create_report_group_input_to_yojson (x : create_report_group_input) =
  assoc_to_yojson
    [
      ("name", Some (report_group_name_to_yojson x.name));
      ("type", Some (report_type_to_yojson x.type_));
      ("exportConfig", Some (report_export_config_to_yojson x.export_config));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_project_output_to_yojson (x : create_project_output) =
  assoc_to_yojson [ ("project", option_to_yojson project_to_yojson x.project) ]

let create_project_input_to_yojson (x : create_project_input) =
  assoc_to_yojson
    [
      ("name", Some (project_name_to_yojson x.name));
      ("description", option_to_yojson project_description_to_yojson x.description);
      ("source", Some (project_source_to_yojson x.source));
      ("secondarySources", option_to_yojson project_sources_to_yojson x.secondary_sources);
      ("sourceVersion", option_to_yojson string__to_yojson x.source_version);
      ( "secondarySourceVersions",
        option_to_yojson project_secondary_source_versions_to_yojson x.secondary_source_versions );
      ("artifacts", Some (project_artifacts_to_yojson x.artifacts));
      ("secondaryArtifacts", option_to_yojson project_artifacts_list_to_yojson x.secondary_artifacts);
      ("cache", option_to_yojson project_cache_to_yojson x.cache);
      ("environment", Some (project_environment_to_yojson x.environment));
      ("serviceRole", Some (non_empty_string_to_yojson x.service_role));
      ("timeoutInMinutes", option_to_yojson build_time_out_to_yojson x.timeout_in_minutes);
      ("queuedTimeoutInMinutes", option_to_yojson time_out_to_yojson x.queued_timeout_in_minutes);
      ("encryptionKey", option_to_yojson non_empty_string_to_yojson x.encryption_key);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("badgeEnabled", option_to_yojson wrapper_boolean_to_yojson x.badge_enabled);
      ("logsConfig", option_to_yojson logs_config_to_yojson x.logs_config);
      ( "fileSystemLocations",
        option_to_yojson project_file_system_locations_to_yojson x.file_system_locations );
      ( "buildBatchConfig",
        option_to_yojson project_build_batch_config_to_yojson x.build_batch_config );
      ("concurrentBuildLimit", option_to_yojson wrapper_int_to_yojson x.concurrent_build_limit);
      ("autoRetryLimit", option_to_yojson wrapper_int_to_yojson x.auto_retry_limit);
    ]

let create_fleet_output_to_yojson (x : create_fleet_output) =
  assoc_to_yojson [ ("fleet", option_to_yojson fleet_to_yojson x.fleet) ]

let create_fleet_input_to_yojson (x : create_fleet_input) =
  assoc_to_yojson
    [
      ("name", Some (fleet_name_to_yojson x.name));
      ("baseCapacity", Some (fleet_capacity_to_yojson x.base_capacity));
      ("environmentType", Some (environment_type_to_yojson x.environment_type));
      ("computeType", Some (compute_type_to_yojson x.compute_type));
      ( "computeConfiguration",
        option_to_yojson compute_configuration_to_yojson x.compute_configuration );
      ( "scalingConfiguration",
        option_to_yojson scaling_configuration_input_to_yojson x.scaling_configuration );
      ("overflowBehavior", option_to_yojson fleet_overflow_behavior_to_yojson x.overflow_behavior);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("proxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
      ("imageId", option_to_yojson non_empty_string_to_yojson x.image_id);
      ("fleetServiceRole", option_to_yojson non_empty_string_to_yojson x.fleet_service_role);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]
