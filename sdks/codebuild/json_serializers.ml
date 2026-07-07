open Smaws_Lib.Json.SerializeHelpers
open Types

let wrapper_long_to_yojson = long_to_yojson
let wrapper_int_to_yojson = int_to_yojson
let wrapper_double_to_yojson = double_to_yojson
let wrapper_boolean_to_yojson = bool_to_yojson

let webhook_status_to_yojson (x : webhook_status) =
  match x with
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | CREATING -> `String "CREATING"

let webhook_scope_type_to_yojson (x : webhook_scope_type) =
  match x with
  | GITLAB_GROUP -> `String "GITLAB_GROUP"
  | GITHUB_GLOBAL -> `String "GITHUB_GLOBAL"
  | GITHUB_ORGANIZATION -> `String "GITHUB_ORGANIZATION"

let webhook_filter_type_to_yojson (x : webhook_filter_type) =
  match x with
  | ORGANIZATION_NAME -> `String "ORGANIZATION_NAME"
  | REPOSITORY_NAME -> `String "REPOSITORY_NAME"
  | RELEASE_NAME -> `String "RELEASE_NAME"
  | TAG_NAME -> `String "TAG_NAME"
  | WORKFLOW_NAME -> `String "WORKFLOW_NAME"
  | COMMIT_MESSAGE -> `String "COMMIT_MESSAGE"
  | FILE_PATH -> `String "FILE_PATH"
  | ACTOR_ACCOUNT_ID -> `String "ACTOR_ACCOUNT_ID"
  | HEAD_REF -> `String "HEAD_REF"
  | BASE_REF -> `String "BASE_REF"
  | EVENT -> `String "EVENT"

let string__to_yojson = string_to_yojson

let webhook_filter_to_yojson (x : webhook_filter) =
  assoc_to_yojson
    [
      ("excludeMatchedPattern", option_to_yojson wrapper_boolean_to_yojson x.exclude_matched_pattern);
      ("pattern", Some (string__to_yojson x.pattern));
      ("type", Some (webhook_filter_type_to_yojson x.type_));
    ]

let webhook_build_type_to_yojson (x : webhook_build_type) =
  match x with
  | RUNNER_BUILDKITE_BUILD -> `String "RUNNER_BUILDKITE_BUILD"
  | BUILD_BATCH -> `String "BUILD_BATCH"
  | BUILD -> `String "BUILD"

let non_empty_string_to_yojson = string_to_yojson
let filter_group_to_yojson tree = list_to_yojson webhook_filter_to_yojson tree
let filter_groups_to_yojson tree = list_to_yojson filter_group_to_yojson tree
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let scope_configuration_to_yojson (x : scope_configuration) =
  assoc_to_yojson
    [
      ("scope", Some (webhook_scope_type_to_yojson x.scope));
      ("domain", option_to_yojson string__to_yojson x.domain);
      ("name", Some (string__to_yojson x.name));
    ]

let pull_request_build_comment_approval_to_yojson (x : pull_request_build_comment_approval) =
  match x with
  | FORK_PULL_REQUESTS -> `String "FORK_PULL_REQUESTS"
  | ALL_PULL_REQUESTS -> `String "ALL_PULL_REQUESTS"
  | DISABLED -> `String "DISABLED"

let pull_request_build_approver_role_to_yojson (x : pull_request_build_approver_role) =
  match x with
  | BITBUCKET_ADMIN -> `String "BITBUCKET_ADMIN"
  | BITBUCKET_WRITE -> `String "BITBUCKET_WRITE"
  | BITBUCKET_READ -> `String "BITBUCKET_READ"
  | GITLAB_OWNER -> `String "GITLAB_OWNER"
  | GITLAB_MAINTAINER -> `String "GITLAB_MAINTAINER"
  | GITLAB_DEVELOPER -> `String "GITLAB_DEVELOPER"
  | GITLAB_REPORTER -> `String "GITLAB_REPORTER"
  | GITLAB_PLANNER -> `String "GITLAB_PLANNER"
  | GITLAB_GUEST -> `String "GITLAB_GUEST"
  | GITHUB_ADMIN -> `String "GITHUB_ADMIN"
  | GITHUB_MAINTAIN -> `String "GITHUB_MAINTAIN"
  | GITHUB_WRITE -> `String "GITHUB_WRITE"
  | GITHUB_TRIAGE -> `String "GITHUB_TRIAGE"
  | GITHUB_READ -> `String "GITHUB_READ"

let pull_request_build_approver_roles_to_yojson tree =
  list_to_yojson pull_request_build_approver_role_to_yojson tree

let pull_request_build_policy_to_yojson (x : pull_request_build_policy) =
  assoc_to_yojson
    [
      ( "approverRoles",
        option_to_yojson pull_request_build_approver_roles_to_yojson x.approver_roles );
      ( "requiresCommentApproval",
        Some (pull_request_build_comment_approval_to_yojson x.requires_comment_approval) );
    ]

let webhook_to_yojson (x : webhook) =
  assoc_to_yojson
    [
      ( "pullRequestBuildPolicy",
        option_to_yojson pull_request_build_policy_to_yojson x.pull_request_build_policy );
      ("statusMessage", option_to_yojson string__to_yojson x.status_message);
      ("status", option_to_yojson webhook_status_to_yojson x.status);
      ("scopeConfiguration", option_to_yojson scope_configuration_to_yojson x.scope_configuration);
      ("lastModifiedSecret", option_to_yojson timestamp_to_yojson x.last_modified_secret);
      ("manualCreation", option_to_yojson wrapper_boolean_to_yojson x.manual_creation);
      ("buildType", option_to_yojson webhook_build_type_to_yojson x.build_type);
      ("filterGroups", option_to_yojson filter_groups_to_yojson x.filter_groups);
      ("branchFilter", option_to_yojson string__to_yojson x.branch_filter);
      ("secret", option_to_yojson non_empty_string_to_yojson x.secret);
      ("payloadUrl", option_to_yojson non_empty_string_to_yojson x.payload_url);
      ("url", option_to_yojson non_empty_string_to_yojson x.url);
    ]

let subnets_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree
let security_group_ids_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let vpc_config_to_yojson (x : vpc_config) =
  assoc_to_yojson
    [
      ("securityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ("subnets", option_to_yojson subnets_to_yojson x.subnets);
      ("vpcId", option_to_yojson non_empty_string_to_yojson x.vpc_id);
    ]

let value_input_to_yojson = string_to_yojson

let update_webhook_output_to_yojson (x : update_webhook_output) =
  assoc_to_yojson [ ("webhook", option_to_yojson webhook_to_yojson x.webhook) ]

let project_name_to_yojson = string_to_yojson
let boolean__to_yojson = bool_to_yojson

let update_webhook_input_to_yojson (x : update_webhook_input) =
  assoc_to_yojson
    [
      ( "pullRequestBuildPolicy",
        option_to_yojson pull_request_build_policy_to_yojson x.pull_request_build_policy );
      ("buildType", option_to_yojson webhook_build_type_to_yojson x.build_type);
      ("filterGroups", option_to_yojson filter_groups_to_yojson x.filter_groups);
      ("rotateSecret", option_to_yojson boolean__to_yojson x.rotate_secret);
      ("branchFilter", option_to_yojson string__to_yojson x.branch_filter);
      ("projectName", Some (project_name_to_yojson x.project_name));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let o_auth_provider_exception_to_yojson (x : o_auth_provider_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let report_group_name_to_yojson = string_to_yojson

let report_type_to_yojson (x : report_type) =
  match x with CODE_COVERAGE -> `String "CODE_COVERAGE" | TEST -> `String "TEST"

let report_export_config_type_to_yojson (x : report_export_config_type) =
  match x with NO_EXPORT -> `String "NO_EXPORT" | S3 -> `String "S3"

let report_packaging_type_to_yojson (x : report_packaging_type) =
  match x with NONE -> `String "NONE" | ZIP -> `String "ZIP"

let s3_report_export_config_to_yojson (x : s3_report_export_config) =
  assoc_to_yojson
    [
      ("encryptionDisabled", option_to_yojson wrapper_boolean_to_yojson x.encryption_disabled);
      ("encryptionKey", option_to_yojson non_empty_string_to_yojson x.encryption_key);
      ("packaging", option_to_yojson report_packaging_type_to_yojson x.packaging);
      ("path", option_to_yojson string__to_yojson x.path);
      ("bucketOwner", option_to_yojson string__to_yojson x.bucket_owner);
      ("bucket", option_to_yojson non_empty_string_to_yojson x.bucket);
    ]

let report_export_config_to_yojson (x : report_export_config) =
  assoc_to_yojson
    [
      ("s3Destination", option_to_yojson s3_report_export_config_to_yojson x.s3_destination);
      ("exportConfigType", option_to_yojson report_export_config_type_to_yojson x.export_config_type);
    ]

let key_input_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("value", option_to_yojson value_input_to_yojson x.value);
      ("key", option_to_yojson key_input_to_yojson x.key);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let report_group_status_type_to_yojson (x : report_group_status_type) =
  match x with DELETING -> `String "DELETING" | ACTIVE -> `String "ACTIVE"

let report_group_to_yojson (x : report_group) =
  assoc_to_yojson
    [
      ("status", option_to_yojson report_group_status_type_to_yojson x.status);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("lastModified", option_to_yojson timestamp_to_yojson x.last_modified);
      ("created", option_to_yojson timestamp_to_yojson x.created);
      ("exportConfig", option_to_yojson report_export_config_to_yojson x.export_config);
      ("type", option_to_yojson report_type_to_yojson x.type_);
      ("name", option_to_yojson report_group_name_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
    ]

let update_report_group_output_to_yojson (x : update_report_group_output) =
  assoc_to_yojson [ ("reportGroup", option_to_yojson report_group_to_yojson x.report_group) ]

let update_report_group_input_to_yojson (x : update_report_group_input) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("exportConfig", option_to_yojson report_export_config_to_yojson x.export_config);
      ("arn", Some (non_empty_string_to_yojson x.arn));
    ]

let project_visibility_type_to_yojson (x : project_visibility_type) =
  match x with PRIVATE -> `String "PRIVATE" | PUBLIC_READ -> `String "PUBLIC_READ"

let update_project_visibility_output_to_yojson (x : update_project_visibility_output) =
  assoc_to_yojson
    [
      ("projectVisibility", option_to_yojson project_visibility_type_to_yojson x.project_visibility);
      ("publicProjectAlias", option_to_yojson non_empty_string_to_yojson x.public_project_alias);
      ("projectArn", option_to_yojson non_empty_string_to_yojson x.project_arn);
    ]

let update_project_visibility_input_to_yojson (x : update_project_visibility_input) =
  assoc_to_yojson
    [
      ("resourceAccessRole", option_to_yojson non_empty_string_to_yojson x.resource_access_role);
      ("projectVisibility", Some (project_visibility_type_to_yojson x.project_visibility));
      ("projectArn", Some (non_empty_string_to_yojson x.project_arn));
    ]

let project_description_to_yojson = string_to_yojson

let source_type_to_yojson (x : source_type) =
  match x with
  | NO_SOURCE -> `String "NO_SOURCE"
  | GITHUB_ENTERPRISE -> `String "GITHUB_ENTERPRISE"
  | BITBUCKET -> `String "BITBUCKET"
  | S3 -> `String "S3"
  | GITLAB_SELF_MANAGED -> `String "GITLAB_SELF_MANAGED"
  | GITLAB -> `String "GITLAB"
  | GITHUB -> `String "GITHUB"
  | CODEPIPELINE -> `String "CODEPIPELINE"
  | CODECOMMIT -> `String "CODECOMMIT"

let git_clone_depth_to_yojson = int_to_yojson

let git_submodules_config_to_yojson (x : git_submodules_config) =
  assoc_to_yojson [ ("fetchSubmodules", Some (wrapper_boolean_to_yojson x.fetch_submodules)) ]

let source_auth_type_to_yojson (x : source_auth_type) =
  match x with
  | SECRETS_MANAGER -> `String "SECRETS_MANAGER"
  | CODECONNECTIONS -> `String "CODECONNECTIONS"
  | OAUTH -> `String "OAUTH"

let source_auth_to_yojson (x : source_auth) =
  assoc_to_yojson
    [
      ("resource", option_to_yojson string__to_yojson x.resource);
      ("type", Some (source_auth_type_to_yojson x.type_));
    ]

let build_status_config_to_yojson (x : build_status_config) =
  assoc_to_yojson
    [
      ("targetUrl", option_to_yojson string__to_yojson x.target_url);
      ("context", option_to_yojson string__to_yojson x.context);
    ]

let project_source_to_yojson (x : project_source) =
  assoc_to_yojson
    [
      ("sourceIdentifier", option_to_yojson string__to_yojson x.source_identifier);
      ("insecureSsl", option_to_yojson wrapper_boolean_to_yojson x.insecure_ssl);
      ("buildStatusConfig", option_to_yojson build_status_config_to_yojson x.build_status_config);
      ("reportBuildStatus", option_to_yojson wrapper_boolean_to_yojson x.report_build_status);
      ("auth", option_to_yojson source_auth_to_yojson x.auth);
      ("buildspec", option_to_yojson string__to_yojson x.buildspec);
      ( "gitSubmodulesConfig",
        option_to_yojson git_submodules_config_to_yojson x.git_submodules_config );
      ("gitCloneDepth", option_to_yojson git_clone_depth_to_yojson x.git_clone_depth);
      ("location", option_to_yojson string__to_yojson x.location);
      ("type", Some (source_type_to_yojson x.type_));
    ]

let project_sources_to_yojson tree = list_to_yojson project_source_to_yojson tree

let project_source_version_to_yojson (x : project_source_version) =
  assoc_to_yojson
    [
      ("sourceVersion", Some (string__to_yojson x.source_version));
      ("sourceIdentifier", Some (string__to_yojson x.source_identifier));
    ]

let project_secondary_source_versions_to_yojson tree =
  list_to_yojson project_source_version_to_yojson tree

let artifacts_type_to_yojson (x : artifacts_type) =
  match x with
  | NO_ARTIFACTS -> `String "NO_ARTIFACTS"
  | S3 -> `String "S3"
  | CODEPIPELINE -> `String "CODEPIPELINE"

let artifact_namespace_to_yojson (x : artifact_namespace) =
  match x with BUILD_ID -> `String "BUILD_ID" | NONE -> `String "NONE"

let artifact_packaging_to_yojson (x : artifact_packaging) =
  match x with ZIP -> `String "ZIP" | NONE -> `String "NONE"

let bucket_owner_access_to_yojson (x : bucket_owner_access) =
  match x with FULL -> `String "FULL" | READ_ONLY -> `String "READ_ONLY" | NONE -> `String "NONE"

let project_artifacts_to_yojson (x : project_artifacts) =
  assoc_to_yojson
    [
      ("bucketOwnerAccess", option_to_yojson bucket_owner_access_to_yojson x.bucket_owner_access);
      ("artifactIdentifier", option_to_yojson string__to_yojson x.artifact_identifier);
      ("encryptionDisabled", option_to_yojson wrapper_boolean_to_yojson x.encryption_disabled);
      ("overrideArtifactName", option_to_yojson wrapper_boolean_to_yojson x.override_artifact_name);
      ("packaging", option_to_yojson artifact_packaging_to_yojson x.packaging);
      ("name", option_to_yojson string__to_yojson x.name);
      ("namespaceType", option_to_yojson artifact_namespace_to_yojson x.namespace_type);
      ("path", option_to_yojson string__to_yojson x.path);
      ("location", option_to_yojson string__to_yojson x.location);
      ("type", Some (artifacts_type_to_yojson x.type_));
    ]

let project_artifacts_list_to_yojson tree = list_to_yojson project_artifacts_to_yojson tree

let cache_type_to_yojson (x : cache_type) =
  match x with LOCAL -> `String "LOCAL" | S3 -> `String "S3" | NO_CACHE -> `String "NO_CACHE"

let cache_mode_to_yojson (x : cache_mode) =
  match x with
  | LOCAL_CUSTOM_CACHE -> `String "LOCAL_CUSTOM_CACHE"
  | LOCAL_SOURCE_CACHE -> `String "LOCAL_SOURCE_CACHE"
  | LOCAL_DOCKER_LAYER_CACHE -> `String "LOCAL_DOCKER_LAYER_CACHE"

let project_cache_modes_to_yojson tree = list_to_yojson cache_mode_to_yojson tree

let project_cache_to_yojson (x : project_cache) =
  assoc_to_yojson
    [
      ("cacheNamespace", option_to_yojson string__to_yojson x.cache_namespace);
      ("modes", option_to_yojson project_cache_modes_to_yojson x.modes);
      ("location", option_to_yojson string__to_yojson x.location);
      ("type", Some (cache_type_to_yojson x.type_));
    ]

let environment_type_to_yojson (x : environment_type) =
  match x with
  | MAC_ARM -> `String "MAC_ARM"
  | WINDOWS_EC2 -> `String "WINDOWS_EC2"
  | ARM_EC2 -> `String "ARM_EC2"
  | LINUX_EC2 -> `String "LINUX_EC2"
  | ARM_LAMBDA_CONTAINER -> `String "ARM_LAMBDA_CONTAINER"
  | LINUX_LAMBDA_CONTAINER -> `String "LINUX_LAMBDA_CONTAINER"
  | WINDOWS_SERVER_2022_CONTAINER -> `String "WINDOWS_SERVER_2022_CONTAINER"
  | WINDOWS_SERVER_2019_CONTAINER -> `String "WINDOWS_SERVER_2019_CONTAINER"
  | ARM_CONTAINER -> `String "ARM_CONTAINER"
  | LINUX_GPU_CONTAINER -> `String "LINUX_GPU_CONTAINER"
  | LINUX_CONTAINER -> `String "LINUX_CONTAINER"
  | WINDOWS_CONTAINER -> `String "WINDOWS_CONTAINER"

let compute_type_to_yojson (x : compute_type) =
  match x with
  | CUSTOM_INSTANCE_TYPE -> `String "CUSTOM_INSTANCE_TYPE"
  | ATTRIBUTE_BASED_COMPUTE -> `String "ATTRIBUTE_BASED_COMPUTE"
  | BUILD_LAMBDA_10GB -> `String "BUILD_LAMBDA_10GB"
  | BUILD_LAMBDA_8GB -> `String "BUILD_LAMBDA_8GB"
  | BUILD_LAMBDA_4GB -> `String "BUILD_LAMBDA_4GB"
  | BUILD_LAMBDA_2GB -> `String "BUILD_LAMBDA_2GB"
  | BUILD_LAMBDA_1GB -> `String "BUILD_LAMBDA_1GB"
  | BUILD_GENERAL1_2XLARGE -> `String "BUILD_GENERAL1_2XLARGE"
  | BUILD_GENERAL1_XLARGE -> `String "BUILD_GENERAL1_XLARGE"
  | BUILD_GENERAL1_LARGE -> `String "BUILD_GENERAL1_LARGE"
  | BUILD_GENERAL1_MEDIUM -> `String "BUILD_GENERAL1_MEDIUM"
  | BUILD_GENERAL1_SMALL -> `String "BUILD_GENERAL1_SMALL"

let machine_type_to_yojson (x : machine_type) =
  match x with NVME -> `String "NVME" | GENERAL -> `String "GENERAL"

let compute_configuration_to_yojson (x : compute_configuration) =
  assoc_to_yojson
    [
      ("instanceType", option_to_yojson non_empty_string_to_yojson x.instance_type);
      ("machineType", option_to_yojson machine_type_to_yojson x.machine_type);
      ("disk", option_to_yojson wrapper_long_to_yojson x.disk);
      ("memory", option_to_yojson wrapper_long_to_yojson x.memory);
      ("vCpu", option_to_yojson wrapper_long_to_yojson x.v_cpu);
    ]

let project_fleet_to_yojson (x : project_fleet) =
  assoc_to_yojson [ ("fleetArn", option_to_yojson string__to_yojson x.fleet_arn) ]

let environment_variable_type_to_yojson (x : environment_variable_type) =
  match x with
  | SECRETS_MANAGER -> `String "SECRETS_MANAGER"
  | PARAMETER_STORE -> `String "PARAMETER_STORE"
  | PLAINTEXT -> `String "PLAINTEXT"

let environment_variable_to_yojson (x : environment_variable) =
  assoc_to_yojson
    [
      ("type", option_to_yojson environment_variable_type_to_yojson x.type_);
      ("value", Some (string__to_yojson x.value));
      ("name", Some (non_empty_string_to_yojson x.name));
    ]

let environment_variables_to_yojson tree = list_to_yojson environment_variable_to_yojson tree

let credential_provider_type_to_yojson (x : credential_provider_type) =
  match x with SECRETS_MANAGER -> `String "SECRETS_MANAGER"

let registry_credential_to_yojson (x : registry_credential) =
  assoc_to_yojson
    [
      ("credentialProvider", Some (credential_provider_type_to_yojson x.credential_provider));
      ("credential", Some (non_empty_string_to_yojson x.credential));
    ]

let image_pull_credentials_type_to_yojson (x : image_pull_credentials_type) =
  match x with SERVICE_ROLE -> `String "SERVICE_ROLE" | CODEBUILD -> `String "CODEBUILD"

let docker_server_status_to_yojson (x : docker_server_status) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("status", option_to_yojson string__to_yojson x.status);
    ]

let docker_server_to_yojson (x : docker_server) =
  assoc_to_yojson
    [
      ("status", option_to_yojson docker_server_status_to_yojson x.status);
      ("securityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ("computeType", Some (compute_type_to_yojson x.compute_type));
    ]

let host_kernel_to_yojson (x : host_kernel) =
  match x with
  | LINUX_KERNEL_LATEST -> `String "LINUX_KERNEL_LATEST"
  | LINUX_KERNEL_6 -> `String "LINUX_KERNEL_6"
  | LINUX_KERNEL_4 -> `String "LINUX_KERNEL_4"

let project_environment_to_yojson (x : project_environment) =
  assoc_to_yojson
    [
      ("hostKernel", option_to_yojson host_kernel_to_yojson x.host_kernel);
      ("dockerServer", option_to_yojson docker_server_to_yojson x.docker_server);
      ( "imagePullCredentialsType",
        option_to_yojson image_pull_credentials_type_to_yojson x.image_pull_credentials_type );
      ("registryCredential", option_to_yojson registry_credential_to_yojson x.registry_credential);
      ("certificate", option_to_yojson string__to_yojson x.certificate);
      ("privilegedMode", option_to_yojson wrapper_boolean_to_yojson x.privileged_mode);
      ( "environmentVariables",
        option_to_yojson environment_variables_to_yojson x.environment_variables );
      ("fleet", option_to_yojson project_fleet_to_yojson x.fleet);
      ( "computeConfiguration",
        option_to_yojson compute_configuration_to_yojson x.compute_configuration );
      ("computeType", Some (compute_type_to_yojson x.compute_type));
      ("image", Some (non_empty_string_to_yojson x.image));
      ("type", Some (environment_type_to_yojson x.type_));
    ]

let build_time_out_to_yojson = int_to_yojson
let time_out_to_yojson = int_to_yojson

let project_badge_to_yojson (x : project_badge) =
  assoc_to_yojson
    [
      ("badgeRequestUrl", option_to_yojson string__to_yojson x.badge_request_url);
      ("badgeEnabled", option_to_yojson boolean__to_yojson x.badge_enabled);
    ]

let logs_config_status_type_to_yojson (x : logs_config_status_type) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let cloud_watch_logs_config_to_yojson (x : cloud_watch_logs_config) =
  assoc_to_yojson
    [
      ("streamName", option_to_yojson string__to_yojson x.stream_name);
      ("groupName", option_to_yojson string__to_yojson x.group_name);
      ("status", Some (logs_config_status_type_to_yojson x.status));
    ]

let s3_logs_config_to_yojson (x : s3_logs_config) =
  assoc_to_yojson
    [
      ("bucketOwnerAccess", option_to_yojson bucket_owner_access_to_yojson x.bucket_owner_access);
      ("encryptionDisabled", option_to_yojson wrapper_boolean_to_yojson x.encryption_disabled);
      ("location", option_to_yojson string__to_yojson x.location);
      ("status", Some (logs_config_status_type_to_yojson x.status));
    ]

let logs_config_to_yojson (x : logs_config) =
  assoc_to_yojson
    [
      ("s3Logs", option_to_yojson s3_logs_config_to_yojson x.s3_logs);
      ("cloudWatchLogs", option_to_yojson cloud_watch_logs_config_to_yojson x.cloud_watch_logs);
    ]

let file_system_type_to_yojson (x : file_system_type) = match x with EFS -> `String "EFS"

let project_file_system_location_to_yojson (x : project_file_system_location) =
  assoc_to_yojson
    [
      ("mountOptions", option_to_yojson string__to_yojson x.mount_options);
      ("identifier", option_to_yojson string__to_yojson x.identifier);
      ("mountPoint", option_to_yojson string__to_yojson x.mount_point);
      ("location", option_to_yojson string__to_yojson x.location);
      ("type", option_to_yojson file_system_type_to_yojson x.type_);
    ]

let project_file_system_locations_to_yojson tree =
  list_to_yojson project_file_system_location_to_yojson tree

let compute_types_allowed_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree
let fleets_allowed_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let batch_restrictions_to_yojson (x : batch_restrictions) =
  assoc_to_yojson
    [
      ("fleetsAllowed", option_to_yojson fleets_allowed_to_yojson x.fleets_allowed);
      ( "computeTypesAllowed",
        option_to_yojson compute_types_allowed_to_yojson x.compute_types_allowed );
      ("maximumBuildsAllowed", option_to_yojson wrapper_int_to_yojson x.maximum_builds_allowed);
    ]

let batch_report_mode_type_to_yojson (x : batch_report_mode_type) =
  match x with
  | REPORT_AGGREGATED_BATCH -> `String "REPORT_AGGREGATED_BATCH"
  | REPORT_INDIVIDUAL_BUILDS -> `String "REPORT_INDIVIDUAL_BUILDS"

let project_build_batch_config_to_yojson (x : project_build_batch_config) =
  assoc_to_yojson
    [
      ("batchReportMode", option_to_yojson batch_report_mode_type_to_yojson x.batch_report_mode);
      ("timeoutInMins", option_to_yojson wrapper_int_to_yojson x.timeout_in_mins);
      ("restrictions", option_to_yojson batch_restrictions_to_yojson x.restrictions);
      ("combineArtifacts", option_to_yojson wrapper_boolean_to_yojson x.combine_artifacts);
      ("serviceRole", option_to_yojson non_empty_string_to_yojson x.service_role);
    ]

let project_to_yojson (x : project) =
  assoc_to_yojson
    [
      ("autoRetryLimit", option_to_yojson wrapper_int_to_yojson x.auto_retry_limit);
      ("resourceAccessRole", option_to_yojson non_empty_string_to_yojson x.resource_access_role);
      ("publicProjectAlias", option_to_yojson non_empty_string_to_yojson x.public_project_alias);
      ("projectVisibility", option_to_yojson project_visibility_type_to_yojson x.project_visibility);
      ("concurrentBuildLimit", option_to_yojson wrapper_int_to_yojson x.concurrent_build_limit);
      ( "buildBatchConfig",
        option_to_yojson project_build_batch_config_to_yojson x.build_batch_config );
      ( "fileSystemLocations",
        option_to_yojson project_file_system_locations_to_yojson x.file_system_locations );
      ("logsConfig", option_to_yojson logs_config_to_yojson x.logs_config);
      ("badge", option_to_yojson project_badge_to_yojson x.badge);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("webhook", option_to_yojson webhook_to_yojson x.webhook);
      ("lastModified", option_to_yojson timestamp_to_yojson x.last_modified);
      ("created", option_to_yojson timestamp_to_yojson x.created);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("encryptionKey", option_to_yojson non_empty_string_to_yojson x.encryption_key);
      ("queuedTimeoutInMinutes", option_to_yojson time_out_to_yojson x.queued_timeout_in_minutes);
      ("timeoutInMinutes", option_to_yojson build_time_out_to_yojson x.timeout_in_minutes);
      ("serviceRole", option_to_yojson non_empty_string_to_yojson x.service_role);
      ("environment", option_to_yojson project_environment_to_yojson x.environment);
      ("cache", option_to_yojson project_cache_to_yojson x.cache);
      ("secondaryArtifacts", option_to_yojson project_artifacts_list_to_yojson x.secondary_artifacts);
      ("artifacts", option_to_yojson project_artifacts_to_yojson x.artifacts);
      ( "secondarySourceVersions",
        option_to_yojson project_secondary_source_versions_to_yojson x.secondary_source_versions );
      ("sourceVersion", option_to_yojson string__to_yojson x.source_version);
      ("secondarySources", option_to_yojson project_sources_to_yojson x.secondary_sources);
      ("source", option_to_yojson project_source_to_yojson x.source);
      ("description", option_to_yojson project_description_to_yojson x.description);
      ("arn", option_to_yojson string__to_yojson x.arn);
      ("name", option_to_yojson project_name_to_yojson x.name);
    ]

let update_project_output_to_yojson (x : update_project_output) =
  assoc_to_yojson [ ("project", option_to_yojson project_to_yojson x.project) ]

let update_project_input_to_yojson (x : update_project_input) =
  assoc_to_yojson
    [
      ("autoRetryLimit", option_to_yojson wrapper_int_to_yojson x.auto_retry_limit);
      ("concurrentBuildLimit", option_to_yojson wrapper_int_to_yojson x.concurrent_build_limit);
      ( "buildBatchConfig",
        option_to_yojson project_build_batch_config_to_yojson x.build_batch_config );
      ( "fileSystemLocations",
        option_to_yojson project_file_system_locations_to_yojson x.file_system_locations );
      ("logsConfig", option_to_yojson logs_config_to_yojson x.logs_config);
      ("badgeEnabled", option_to_yojson wrapper_boolean_to_yojson x.badge_enabled);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("encryptionKey", option_to_yojson non_empty_string_to_yojson x.encryption_key);
      ("queuedTimeoutInMinutes", option_to_yojson time_out_to_yojson x.queued_timeout_in_minutes);
      ("timeoutInMinutes", option_to_yojson build_time_out_to_yojson x.timeout_in_minutes);
      ("serviceRole", option_to_yojson non_empty_string_to_yojson x.service_role);
      ("environment", option_to_yojson project_environment_to_yojson x.environment);
      ("cache", option_to_yojson project_cache_to_yojson x.cache);
      ("secondaryArtifacts", option_to_yojson project_artifacts_list_to_yojson x.secondary_artifacts);
      ("artifacts", option_to_yojson project_artifacts_to_yojson x.artifacts);
      ( "secondarySourceVersions",
        option_to_yojson project_secondary_source_versions_to_yojson x.secondary_source_versions );
      ("sourceVersion", option_to_yojson string__to_yojson x.source_version);
      ("secondarySources", option_to_yojson project_sources_to_yojson x.secondary_sources);
      ("source", option_to_yojson project_source_to_yojson x.source);
      ("description", option_to_yojson project_description_to_yojson x.description);
      ("name", Some (non_empty_string_to_yojson x.name));
    ]

let fleet_name_to_yojson = string_to_yojson

let fleet_status_code_to_yojson (x : fleet_status_code) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | UPDATE_ROLLBACK_FAILED -> `String "UPDATE_ROLLBACK_FAILED"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETING -> `String "DELETING"
  | PENDING_DELETION -> `String "PENDING_DELETION"
  | ROTATING -> `String "ROTATING"
  | UPDATING -> `String "UPDATING"
  | CREATING -> `String "CREATING"

let fleet_context_code_to_yojson (x : fleet_context_code) =
  match x with
  | INSUFFICIENT_CAPACITY -> `String "INSUFFICIENT_CAPACITY"
  | PENDING_DELETION -> `String "PENDING_DELETION"
  | ACTION_REQUIRED -> `String "ACTION_REQUIRED"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | CREATE_FAILED -> `String "CREATE_FAILED"

let fleet_status_to_yojson (x : fleet_status) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("context", option_to_yojson fleet_context_code_to_yojson x.context);
      ("statusCode", option_to_yojson fleet_status_code_to_yojson x.status_code);
    ]

let fleet_capacity_to_yojson = int_to_yojson

let fleet_scaling_type_to_yojson (x : fleet_scaling_type) =
  match x with TARGET_TRACKING_SCALING -> `String "TARGET_TRACKING_SCALING"

let fleet_scaling_metric_type_to_yojson (x : fleet_scaling_metric_type) =
  match x with FLEET_UTILIZATION_RATE -> `String "FLEET_UTILIZATION_RATE"

let target_tracking_scaling_configuration_to_yojson (x : target_tracking_scaling_configuration) =
  assoc_to_yojson
    [
      ("targetValue", option_to_yojson wrapper_double_to_yojson x.target_value);
      ("metricType", option_to_yojson fleet_scaling_metric_type_to_yojson x.metric_type);
    ]

let target_tracking_scaling_configurations_to_yojson tree =
  list_to_yojson target_tracking_scaling_configuration_to_yojson tree

let scaling_configuration_output_to_yojson (x : scaling_configuration_output) =
  assoc_to_yojson
    [
      ("desiredCapacity", option_to_yojson fleet_capacity_to_yojson x.desired_capacity);
      ("maxCapacity", option_to_yojson fleet_capacity_to_yojson x.max_capacity);
      ( "targetTrackingScalingConfigs",
        option_to_yojson target_tracking_scaling_configurations_to_yojson
          x.target_tracking_scaling_configs );
      ("scalingType", option_to_yojson fleet_scaling_type_to_yojson x.scaling_type);
    ]

let fleet_overflow_behavior_to_yojson (x : fleet_overflow_behavior) =
  match x with ON_DEMAND -> `String "ON_DEMAND" | QUEUE -> `String "QUEUE"

let fleet_proxy_rule_behavior_to_yojson (x : fleet_proxy_rule_behavior) =
  match x with DENY_ALL -> `String "DENY_ALL" | ALLOW_ALL -> `String "ALLOW_ALL"

let fleet_proxy_rule_type_to_yojson (x : fleet_proxy_rule_type) =
  match x with IP -> `String "IP" | DOMAIN -> `String "DOMAIN"

let fleet_proxy_rule_effect_type_to_yojson (x : fleet_proxy_rule_effect_type) =
  match x with DENY -> `String "DENY" | ALLOW -> `String "ALLOW"

let fleet_proxy_rule_entities_to_yojson tree = list_to_yojson string__to_yojson tree

let fleet_proxy_rule_to_yojson (x : fleet_proxy_rule) =
  assoc_to_yojson
    [
      ("entities", Some (fleet_proxy_rule_entities_to_yojson x.entities));
      ("effect", Some (fleet_proxy_rule_effect_type_to_yojson x.effect_));
      ("type", Some (fleet_proxy_rule_type_to_yojson x.type_));
    ]

let fleet_proxy_rules_to_yojson tree = list_to_yojson fleet_proxy_rule_to_yojson tree

let proxy_configuration_to_yojson (x : proxy_configuration) =
  assoc_to_yojson
    [
      ("orderedProxyRules", option_to_yojson fleet_proxy_rules_to_yojson x.ordered_proxy_rules);
      ("defaultBehavior", option_to_yojson fleet_proxy_rule_behavior_to_yojson x.default_behavior);
    ]

let fleet_to_yojson (x : fleet) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("fleetServiceRole", option_to_yojson non_empty_string_to_yojson x.fleet_service_role);
      ("imageId", option_to_yojson non_empty_string_to_yojson x.image_id);
      ("proxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("overflowBehavior", option_to_yojson fleet_overflow_behavior_to_yojson x.overflow_behavior);
      ( "scalingConfiguration",
        option_to_yojson scaling_configuration_output_to_yojson x.scaling_configuration );
      ( "computeConfiguration",
        option_to_yojson compute_configuration_to_yojson x.compute_configuration );
      ("computeType", option_to_yojson compute_type_to_yojson x.compute_type);
      ("environmentType", option_to_yojson environment_type_to_yojson x.environment_type);
      ("baseCapacity", option_to_yojson fleet_capacity_to_yojson x.base_capacity);
      ("status", option_to_yojson fleet_status_to_yojson x.status);
      ("lastModified", option_to_yojson timestamp_to_yojson x.last_modified);
      ("created", option_to_yojson timestamp_to_yojson x.created);
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
      ("name", option_to_yojson fleet_name_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
    ]

let update_fleet_output_to_yojson (x : update_fleet_output) =
  assoc_to_yojson [ ("fleet", option_to_yojson fleet_to_yojson x.fleet) ]

let scaling_configuration_input_to_yojson (x : scaling_configuration_input) =
  assoc_to_yojson
    [
      ("maxCapacity", option_to_yojson fleet_capacity_to_yojson x.max_capacity);
      ( "targetTrackingScalingConfigs",
        option_to_yojson target_tracking_scaling_configurations_to_yojson
          x.target_tracking_scaling_configs );
      ("scalingType", option_to_yojson fleet_scaling_type_to_yojson x.scaling_type);
    ]

let update_fleet_input_to_yojson (x : update_fleet_input) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("fleetServiceRole", option_to_yojson non_empty_string_to_yojson x.fleet_service_role);
      ("imageId", option_to_yojson non_empty_string_to_yojson x.image_id);
      ("proxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("overflowBehavior", option_to_yojson fleet_overflow_behavior_to_yojson x.overflow_behavior);
      ( "scalingConfiguration",
        option_to_yojson scaling_configuration_input_to_yojson x.scaling_configuration );
      ( "computeConfiguration",
        option_to_yojson compute_configuration_to_yojson x.compute_configuration );
      ("computeType", option_to_yojson compute_type_to_yojson x.compute_type);
      ("environmentType", option_to_yojson environment_type_to_yojson x.environment_type);
      ("baseCapacity", option_to_yojson fleet_capacity_to_yojson x.base_capacity);
      ("arn", Some (non_empty_string_to_yojson x.arn));
    ]

let account_limit_exceeded_exception_to_yojson (x : account_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let report_status_counts_to_yojson tree = map_to_yojson string__to_yojson wrapper_int_to_yojson tree

let test_report_summary_to_yojson (x : test_report_summary) =
  assoc_to_yojson
    [
      ("durationInNanoSeconds", Some (wrapper_long_to_yojson x.duration_in_nano_seconds));
      ("statusCounts", Some (report_status_counts_to_yojson x.status_counts));
      ("total", Some (wrapper_int_to_yojson x.total));
    ]

let test_case_to_yojson (x : test_case) =
  assoc_to_yojson
    [
      ("testSuiteName", option_to_yojson string__to_yojson x.test_suite_name);
      ("expired", option_to_yojson timestamp_to_yojson x.expired);
      ("message", option_to_yojson string__to_yojson x.message);
      ("durationInNanoSeconds", option_to_yojson wrapper_long_to_yojson x.duration_in_nano_seconds);
      ("status", option_to_yojson string__to_yojson x.status);
      ("name", option_to_yojson string__to_yojson x.name);
      ("prefix", option_to_yojson string__to_yojson x.prefix);
      ("testRawDataPath", option_to_yojson string__to_yojson x.test_raw_data_path);
      ("reportArn", option_to_yojson non_empty_string_to_yojson x.report_arn);
    ]

let test_cases_to_yojson tree = list_to_yojson test_case_to_yojson tree

let test_case_filter_to_yojson (x : test_case_filter) =
  assoc_to_yojson
    [
      ("keyword", option_to_yojson string__to_yojson x.keyword);
      ("status", option_to_yojson string__to_yojson x.status);
    ]

let status_type_to_yojson (x : status_type) =
  match x with
  | STOPPED -> `String "STOPPED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | TIMED_OUT -> `String "TIMED_OUT"
  | FAULT -> `String "FAULT"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"

let phase_context_to_yojson (x : phase_context) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("statusCode", option_to_yojson string__to_yojson x.status_code);
    ]

let phase_contexts_to_yojson tree = list_to_yojson phase_context_to_yojson tree

let sandbox_session_phase_to_yojson (x : sandbox_session_phase) =
  assoc_to_yojson
    [
      ("contexts", option_to_yojson phase_contexts_to_yojson x.contexts);
      ("durationInSeconds", option_to_yojson wrapper_long_to_yojson x.duration_in_seconds);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("phaseStatus", option_to_yojson status_type_to_yojson x.phase_status);
      ("phaseType", option_to_yojson string__to_yojson x.phase_type);
    ]

let sandbox_session_phases_to_yojson tree = list_to_yojson sandbox_session_phase_to_yojson tree

let logs_location_to_yojson (x : logs_location) =
  assoc_to_yojson
    [
      ("s3Logs", option_to_yojson s3_logs_config_to_yojson x.s3_logs);
      ("cloudWatchLogs", option_to_yojson cloud_watch_logs_config_to_yojson x.cloud_watch_logs);
      ("s3LogsArn", option_to_yojson string__to_yojson x.s3_logs_arn);
      ("cloudWatchLogsArn", option_to_yojson string__to_yojson x.cloud_watch_logs_arn);
      ("s3DeepLink", option_to_yojson string__to_yojson x.s3_deep_link);
      ("deepLink", option_to_yojson string__to_yojson x.deep_link);
      ("streamName", option_to_yojson string__to_yojson x.stream_name);
      ("groupName", option_to_yojson string__to_yojson x.group_name);
    ]

let network_interface_to_yojson (x : network_interface) =
  assoc_to_yojson
    [
      ("networkInterfaceId", option_to_yojson non_empty_string_to_yojson x.network_interface_id);
      ("subnetId", option_to_yojson non_empty_string_to_yojson x.subnet_id);
    ]

let sandbox_session_to_yojson (x : sandbox_session) =
  assoc_to_yojson
    [
      ("networkInterface", option_to_yojson network_interface_to_yojson x.network_interface);
      ("logs", option_to_yojson logs_location_to_yojson x.logs);
      ( "resolvedSourceVersion",
        option_to_yojson non_empty_string_to_yojson x.resolved_source_version );
      ("phases", option_to_yojson sandbox_session_phases_to_yojson x.phases);
      ("currentPhase", option_to_yojson string__to_yojson x.current_phase);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("status", option_to_yojson string__to_yojson x.status);
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
    ]

let sandbox_to_yojson (x : sandbox) =
  assoc_to_yojson
    [
      ("currentSession", option_to_yojson sandbox_session_to_yojson x.current_session);
      ("serviceRole", option_to_yojson non_empty_string_to_yojson x.service_role);
      ("encryptionKey", option_to_yojson non_empty_string_to_yojson x.encryption_key);
      ("logConfig", option_to_yojson logs_config_to_yojson x.log_config);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("queuedTimeoutInMinutes", option_to_yojson wrapper_int_to_yojson x.queued_timeout_in_minutes);
      ("timeoutInMinutes", option_to_yojson wrapper_int_to_yojson x.timeout_in_minutes);
      ( "fileSystemLocations",
        option_to_yojson project_file_system_locations_to_yojson x.file_system_locations );
      ("environment", option_to_yojson project_environment_to_yojson x.environment);
      ( "secondarySourceVersions",
        option_to_yojson project_secondary_source_versions_to_yojson x.secondary_source_versions );
      ("secondarySources", option_to_yojson project_sources_to_yojson x.secondary_sources);
      ("sourceVersion", option_to_yojson non_empty_string_to_yojson x.source_version);
      ("source", option_to_yojson project_source_to_yojson x.source);
      ("status", option_to_yojson string__to_yojson x.status);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("requestTime", option_to_yojson timestamp_to_yojson x.request_time);
      ("projectName", option_to_yojson non_empty_string_to_yojson x.project_name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
    ]

let stop_sandbox_output_to_yojson (x : stop_sandbox_output) =
  assoc_to_yojson [ ("sandbox", option_to_yojson sandbox_to_yojson x.sandbox) ]

let stop_sandbox_input_to_yojson (x : stop_sandbox_input) =
  assoc_to_yojson [ ("id", Some (non_empty_string_to_yojson x.id)) ]

let build_phase_type_to_yojson (x : build_phase_type) =
  match x with
  | COMPLETED -> `String "COMPLETED"
  | FINALIZING -> `String "FINALIZING"
  | UPLOAD_ARTIFACTS -> `String "UPLOAD_ARTIFACTS"
  | POST_BUILD -> `String "POST_BUILD"
  | BUILD -> `String "BUILD"
  | PRE_BUILD -> `String "PRE_BUILD"
  | INSTALL -> `String "INSTALL"
  | DOWNLOAD_SOURCE -> `String "DOWNLOAD_SOURCE"
  | PROVISIONING -> `String "PROVISIONING"
  | QUEUED -> `String "QUEUED"
  | SUBMITTED -> `String "SUBMITTED"

let build_phase_to_yojson (x : build_phase) =
  assoc_to_yojson
    [
      ("contexts", option_to_yojson phase_contexts_to_yojson x.contexts);
      ("durationInSeconds", option_to_yojson wrapper_long_to_yojson x.duration_in_seconds);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("phaseStatus", option_to_yojson status_type_to_yojson x.phase_status);
      ("phaseType", option_to_yojson build_phase_type_to_yojson x.phase_type);
    ]

let build_phases_to_yojson tree = list_to_yojson build_phase_to_yojson tree

let build_artifacts_to_yojson (x : build_artifacts) =
  assoc_to_yojson
    [
      ("bucketOwnerAccess", option_to_yojson bucket_owner_access_to_yojson x.bucket_owner_access);
      ("artifactIdentifier", option_to_yojson string__to_yojson x.artifact_identifier);
      ("encryptionDisabled", option_to_yojson wrapper_boolean_to_yojson x.encryption_disabled);
      ("overrideArtifactName", option_to_yojson wrapper_boolean_to_yojson x.override_artifact_name);
      ("md5sum", option_to_yojson string__to_yojson x.md5sum);
      ("sha256sum", option_to_yojson string__to_yojson x.sha256sum);
      ("location", option_to_yojson string__to_yojson x.location);
    ]

let build_artifacts_list_to_yojson tree = list_to_yojson build_artifacts_to_yojson tree

let exported_environment_variable_to_yojson (x : exported_environment_variable) =
  assoc_to_yojson
    [
      ("value", option_to_yojson string__to_yojson x.value);
      ("name", option_to_yojson non_empty_string_to_yojson x.name);
    ]

let exported_environment_variables_to_yojson tree =
  list_to_yojson exported_environment_variable_to_yojson tree

let build_report_arns_to_yojson tree = list_to_yojson string__to_yojson tree

let debug_session_to_yojson (x : debug_session) =
  assoc_to_yojson
    [
      ("sessionTarget", option_to_yojson non_empty_string_to_yojson x.session_target);
      ("sessionEnabled", option_to_yojson wrapper_boolean_to_yojson x.session_enabled);
    ]

let auto_retry_config_to_yojson (x : auto_retry_config) =
  assoc_to_yojson
    [
      ("previousAutoRetry", option_to_yojson string__to_yojson x.previous_auto_retry);
      ("nextAutoRetry", option_to_yojson string__to_yojson x.next_auto_retry);
      ("autoRetryNumber", option_to_yojson wrapper_int_to_yojson x.auto_retry_number);
      ("autoRetryLimit", option_to_yojson wrapper_int_to_yojson x.auto_retry_limit);
    ]

let build_to_yojson (x : build) =
  assoc_to_yojson
    [
      ("autoRetryConfig", option_to_yojson auto_retry_config_to_yojson x.auto_retry_config);
      ("buildBatchArn", option_to_yojson string__to_yojson x.build_batch_arn);
      ("debugSession", option_to_yojson debug_session_to_yojson x.debug_session);
      ( "fileSystemLocations",
        option_to_yojson project_file_system_locations_to_yojson x.file_system_locations );
      ("reportArns", option_to_yojson build_report_arns_to_yojson x.report_arns);
      ( "exportedEnvironmentVariables",
        option_to_yojson exported_environment_variables_to_yojson x.exported_environment_variables
      );
      ("encryptionKey", option_to_yojson non_empty_string_to_yojson x.encryption_key);
      ("networkInterface", option_to_yojson network_interface_to_yojson x.network_interface);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("initiator", option_to_yojson string__to_yojson x.initiator);
      ("buildComplete", option_to_yojson boolean__to_yojson x.build_complete);
      ("queuedTimeoutInMinutes", option_to_yojson wrapper_int_to_yojson x.queued_timeout_in_minutes);
      ("timeoutInMinutes", option_to_yojson wrapper_int_to_yojson x.timeout_in_minutes);
      ("logs", option_to_yojson logs_location_to_yojson x.logs);
      ("serviceRole", option_to_yojson non_empty_string_to_yojson x.service_role);
      ("environment", option_to_yojson project_environment_to_yojson x.environment);
      ("cache", option_to_yojson project_cache_to_yojson x.cache);
      ("secondaryArtifacts", option_to_yojson build_artifacts_list_to_yojson x.secondary_artifacts);
      ("artifacts", option_to_yojson build_artifacts_to_yojson x.artifacts);
      ( "secondarySourceVersions",
        option_to_yojson project_secondary_source_versions_to_yojson x.secondary_source_versions );
      ("secondarySources", option_to_yojson project_sources_to_yojson x.secondary_sources);
      ("source", option_to_yojson project_source_to_yojson x.source);
      ("phases", option_to_yojson build_phases_to_yojson x.phases);
      ("projectName", option_to_yojson non_empty_string_to_yojson x.project_name);
      ( "resolvedSourceVersion",
        option_to_yojson non_empty_string_to_yojson x.resolved_source_version );
      ("sourceVersion", option_to_yojson non_empty_string_to_yojson x.source_version);
      ("buildStatus", option_to_yojson status_type_to_yojson x.build_status);
      ("currentPhase", option_to_yojson string__to_yojson x.current_phase);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("buildNumber", option_to_yojson wrapper_long_to_yojson x.build_number);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
    ]

let stop_build_output_to_yojson (x : stop_build_output) =
  assoc_to_yojson [ ("build", option_to_yojson build_to_yojson x.build) ]

let stop_build_input_to_yojson (x : stop_build_input) =
  assoc_to_yojson [ ("id", Some (non_empty_string_to_yojson x.id)) ]

let build_batch_phase_type_to_yojson (x : build_batch_phase_type) =
  match x with
  | STOPPED -> `String "STOPPED"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | COMBINE_ARTIFACTS -> `String "COMBINE_ARTIFACTS"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | DOWNLOAD_BATCHSPEC -> `String "DOWNLOAD_BATCHSPEC"
  | SUBMITTED -> `String "SUBMITTED"

let build_batch_phase_to_yojson (x : build_batch_phase) =
  assoc_to_yojson
    [
      ("contexts", option_to_yojson phase_contexts_to_yojson x.contexts);
      ("durationInSeconds", option_to_yojson wrapper_long_to_yojson x.duration_in_seconds);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("phaseStatus", option_to_yojson status_type_to_yojson x.phase_status);
      ("phaseType", option_to_yojson build_batch_phase_type_to_yojson x.phase_type);
    ]

let build_batch_phases_to_yojson tree = list_to_yojson build_batch_phase_to_yojson tree
let identifiers_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let resolved_artifact_to_yojson (x : resolved_artifact) =
  assoc_to_yojson
    [
      ("identifier", option_to_yojson string__to_yojson x.identifier);
      ("location", option_to_yojson string__to_yojson x.location);
      ("type", option_to_yojson artifacts_type_to_yojson x.type_);
    ]

let resolved_secondary_artifacts_to_yojson tree = list_to_yojson resolved_artifact_to_yojson tree

let build_summary_to_yojson (x : build_summary) =
  assoc_to_yojson
    [
      ( "secondaryArtifacts",
        option_to_yojson resolved_secondary_artifacts_to_yojson x.secondary_artifacts );
      ("primaryArtifact", option_to_yojson resolved_artifact_to_yojson x.primary_artifact);
      ("buildStatus", option_to_yojson status_type_to_yojson x.build_status);
      ("requestedOn", option_to_yojson timestamp_to_yojson x.requested_on);
      ("arn", option_to_yojson string__to_yojson x.arn);
    ]

let build_summaries_to_yojson tree = list_to_yojson build_summary_to_yojson tree

let build_group_to_yojson (x : build_group) =
  assoc_to_yojson
    [
      ( "priorBuildSummaryList",
        option_to_yojson build_summaries_to_yojson x.prior_build_summary_list );
      ("currentBuildSummary", option_to_yojson build_summary_to_yojson x.current_build_summary);
      ("ignoreFailure", option_to_yojson boolean__to_yojson x.ignore_failure);
      ("dependsOn", option_to_yojson identifiers_to_yojson x.depends_on);
      ("identifier", option_to_yojson string__to_yojson x.identifier);
    ]

let build_groups_to_yojson tree = list_to_yojson build_group_to_yojson tree

let build_batch_to_yojson (x : build_batch) =
  assoc_to_yojson
    [
      ("reportArns", option_to_yojson build_report_arns_to_yojson x.report_arns);
      ("debugSessionEnabled", option_to_yojson wrapper_boolean_to_yojson x.debug_session_enabled);
      ("buildGroups", option_to_yojson build_groups_to_yojson x.build_groups);
      ( "buildBatchConfig",
        option_to_yojson project_build_batch_config_to_yojson x.build_batch_config );
      ( "fileSystemLocations",
        option_to_yojson project_file_system_locations_to_yojson x.file_system_locations );
      ("buildBatchNumber", option_to_yojson wrapper_long_to_yojson x.build_batch_number);
      ("encryptionKey", option_to_yojson non_empty_string_to_yojson x.encryption_key);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("initiator", option_to_yojson string__to_yojson x.initiator);
      ("complete", option_to_yojson boolean__to_yojson x.complete);
      ("queuedTimeoutInMinutes", option_to_yojson wrapper_int_to_yojson x.queued_timeout_in_minutes);
      ("buildTimeoutInMinutes", option_to_yojson wrapper_int_to_yojson x.build_timeout_in_minutes);
      ("logConfig", option_to_yojson logs_config_to_yojson x.log_config);
      ("serviceRole", option_to_yojson non_empty_string_to_yojson x.service_role);
      ("environment", option_to_yojson project_environment_to_yojson x.environment);
      ("cache", option_to_yojson project_cache_to_yojson x.cache);
      ("secondaryArtifacts", option_to_yojson build_artifacts_list_to_yojson x.secondary_artifacts);
      ("artifacts", option_to_yojson build_artifacts_to_yojson x.artifacts);
      ( "secondarySourceVersions",
        option_to_yojson project_secondary_source_versions_to_yojson x.secondary_source_versions );
      ("secondarySources", option_to_yojson project_sources_to_yojson x.secondary_sources);
      ("source", option_to_yojson project_source_to_yojson x.source);
      ("phases", option_to_yojson build_batch_phases_to_yojson x.phases);
      ("projectName", option_to_yojson non_empty_string_to_yojson x.project_name);
      ( "resolvedSourceVersion",
        option_to_yojson non_empty_string_to_yojson x.resolved_source_version );
      ("sourceVersion", option_to_yojson non_empty_string_to_yojson x.source_version);
      ("buildBatchStatus", option_to_yojson status_type_to_yojson x.build_batch_status);
      ("currentPhase", option_to_yojson string__to_yojson x.current_phase);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
    ]

let stop_build_batch_output_to_yojson (x : stop_build_batch_output) =
  assoc_to_yojson [ ("buildBatch", option_to_yojson build_batch_to_yojson x.build_batch) ]

let stop_build_batch_input_to_yojson (x : stop_build_batch_input) =
  assoc_to_yojson [ ("id", Some (non_empty_string_to_yojson x.id)) ]

let start_sandbox_output_to_yojson (x : start_sandbox_output) =
  assoc_to_yojson [ ("sandbox", option_to_yojson sandbox_to_yojson x.sandbox) ]

let sensitive_string_to_yojson = string_to_yojson

let start_sandbox_input_to_yojson (x : start_sandbox_input) =
  assoc_to_yojson
    [
      ("idempotencyToken", option_to_yojson sensitive_string_to_yojson x.idempotency_token);
      ("projectName", option_to_yojson non_empty_string_to_yojson x.project_name);
    ]

let ssm_session_to_yojson (x : ssm_session) =
  assoc_to_yojson
    [
      ("streamUrl", option_to_yojson string__to_yojson x.stream_url);
      ("tokenValue", option_to_yojson string__to_yojson x.token_value);
      ("sessionId", option_to_yojson string__to_yojson x.session_id);
    ]

let start_sandbox_connection_output_to_yojson (x : start_sandbox_connection_output) =
  assoc_to_yojson [ ("ssmSession", option_to_yojson ssm_session_to_yojson x.ssm_session) ]

let start_sandbox_connection_input_to_yojson (x : start_sandbox_connection_input) =
  assoc_to_yojson [ ("sandboxId", Some (non_empty_string_to_yojson x.sandbox_id)) ]

let account_suspended_exception_to_yojson (x : account_suspended_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let sensitive_non_empty_string_to_yojson = string_to_yojson
let command_type_to_yojson (x : command_type) = match x with SHELL -> `String "SHELL"

let command_execution_to_yojson (x : command_execution) =
  assoc_to_yojson
    [
      ("sandboxArn", option_to_yojson non_empty_string_to_yojson x.sandbox_arn);
      ("logs", option_to_yojson logs_location_to_yojson x.logs);
      ( "standardErrContent",
        option_to_yojson sensitive_non_empty_string_to_yojson x.standard_err_content );
      ( "standardOutputContent",
        option_to_yojson sensitive_non_empty_string_to_yojson x.standard_output_content );
      ("exitCode", option_to_yojson non_empty_string_to_yojson x.exit_code);
      ("type", option_to_yojson command_type_to_yojson x.type_);
      ("command", option_to_yojson sensitive_non_empty_string_to_yojson x.command);
      ("status", option_to_yojson non_empty_string_to_yojson x.status);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("submitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("sandboxId", option_to_yojson non_empty_string_to_yojson x.sandbox_id);
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
    ]

let start_command_execution_output_to_yojson (x : start_command_execution_output) =
  assoc_to_yojson
    [ ("commandExecution", option_to_yojson command_execution_to_yojson x.command_execution) ]

let start_command_execution_input_to_yojson (x : start_command_execution_input) =
  assoc_to_yojson
    [
      ("type", option_to_yojson command_type_to_yojson x.type_);
      ("command", Some (sensitive_non_empty_string_to_yojson x.command));
      ("sandboxId", Some (non_empty_string_to_yojson x.sandbox_id));
    ]

let start_build_output_to_yojson (x : start_build_output) =
  assoc_to_yojson [ ("build", option_to_yojson build_to_yojson x.build) ]

let start_build_input_to_yojson (x : start_build_input) =
  assoc_to_yojson
    [
      ("hostKernelOverride", option_to_yojson host_kernel_to_yojson x.host_kernel_override);
      ("autoRetryLimitOverride", option_to_yojson wrapper_int_to_yojson x.auto_retry_limit_override);
      ("fleetOverride", option_to_yojson project_fleet_to_yojson x.fleet_override);
      ("debugSessionEnabled", option_to_yojson wrapper_boolean_to_yojson x.debug_session_enabled);
      ( "imagePullCredentialsTypeOverride",
        option_to_yojson image_pull_credentials_type_to_yojson
          x.image_pull_credentials_type_override );
      ( "registryCredentialOverride",
        option_to_yojson registry_credential_to_yojson x.registry_credential_override );
      ("logsConfigOverride", option_to_yojson logs_config_to_yojson x.logs_config_override);
      ("idempotencyToken", option_to_yojson string__to_yojson x.idempotency_token);
      ( "encryptionKeyOverride",
        option_to_yojson non_empty_string_to_yojson x.encryption_key_override );
      ( "queuedTimeoutInMinutesOverride",
        option_to_yojson time_out_to_yojson x.queued_timeout_in_minutes_override );
      ( "timeoutInMinutesOverride",
        option_to_yojson build_time_out_to_yojson x.timeout_in_minutes_override );
      ( "privilegedModeOverride",
        option_to_yojson wrapper_boolean_to_yojson x.privileged_mode_override );
      ("serviceRoleOverride", option_to_yojson non_empty_string_to_yojson x.service_role_override);
      ("cacheOverride", option_to_yojson project_cache_to_yojson x.cache_override);
      ("certificateOverride", option_to_yojson string__to_yojson x.certificate_override);
      ("computeTypeOverride", option_to_yojson compute_type_to_yojson x.compute_type_override);
      ("imageOverride", option_to_yojson non_empty_string_to_yojson x.image_override);
      ( "environmentTypeOverride",
        option_to_yojson environment_type_to_yojson x.environment_type_override );
      ( "buildStatusConfigOverride",
        option_to_yojson build_status_config_to_yojson x.build_status_config_override );
      ( "reportBuildStatusOverride",
        option_to_yojson wrapper_boolean_to_yojson x.report_build_status_override );
      ("insecureSslOverride", option_to_yojson wrapper_boolean_to_yojson x.insecure_ssl_override);
      ("buildspecOverride", option_to_yojson string__to_yojson x.buildspec_override);
      ( "gitSubmodulesConfigOverride",
        option_to_yojson git_submodules_config_to_yojson x.git_submodules_config_override );
      ( "gitCloneDepthOverride",
        option_to_yojson git_clone_depth_to_yojson x.git_clone_depth_override );
      ("sourceAuthOverride", option_to_yojson source_auth_to_yojson x.source_auth_override);
      ("sourceLocationOverride", option_to_yojson string__to_yojson x.source_location_override);
      ("sourceTypeOverride", option_to_yojson source_type_to_yojson x.source_type_override);
      ( "environmentVariablesOverride",
        option_to_yojson environment_variables_to_yojson x.environment_variables_override );
      ( "secondaryArtifactsOverride",
        option_to_yojson project_artifacts_list_to_yojson x.secondary_artifacts_override );
      ("artifactsOverride", option_to_yojson project_artifacts_to_yojson x.artifacts_override);
      ("sourceVersion", option_to_yojson string__to_yojson x.source_version);
      ( "secondarySourcesVersionOverride",
        option_to_yojson project_secondary_source_versions_to_yojson
          x.secondary_sources_version_override );
      ( "secondarySourcesOverride",
        option_to_yojson project_sources_to_yojson x.secondary_sources_override );
      ("projectName", Some (non_empty_string_to_yojson x.project_name));
    ]

let start_build_batch_output_to_yojson (x : start_build_batch_output) =
  assoc_to_yojson [ ("buildBatch", option_to_yojson build_batch_to_yojson x.build_batch) ]

let start_build_batch_input_to_yojson (x : start_build_batch_input) =
  assoc_to_yojson
    [
      ("debugSessionEnabled", option_to_yojson wrapper_boolean_to_yojson x.debug_session_enabled);
      ( "buildBatchConfigOverride",
        option_to_yojson project_build_batch_config_to_yojson x.build_batch_config_override );
      ( "imagePullCredentialsTypeOverride",
        option_to_yojson image_pull_credentials_type_to_yojson
          x.image_pull_credentials_type_override );
      ( "registryCredentialOverride",
        option_to_yojson registry_credential_to_yojson x.registry_credential_override );
      ("logsConfigOverride", option_to_yojson logs_config_to_yojson x.logs_config_override);
      ("idempotencyToken", option_to_yojson string__to_yojson x.idempotency_token);
      ( "encryptionKeyOverride",
        option_to_yojson non_empty_string_to_yojson x.encryption_key_override );
      ( "queuedTimeoutInMinutesOverride",
        option_to_yojson time_out_to_yojson x.queued_timeout_in_minutes_override );
      ( "buildTimeoutInMinutesOverride",
        option_to_yojson build_time_out_to_yojson x.build_timeout_in_minutes_override );
      ( "privilegedModeOverride",
        option_to_yojson wrapper_boolean_to_yojson x.privileged_mode_override );
      ("serviceRoleOverride", option_to_yojson non_empty_string_to_yojson x.service_role_override);
      ("cacheOverride", option_to_yojson project_cache_to_yojson x.cache_override);
      ("certificateOverride", option_to_yojson string__to_yojson x.certificate_override);
      ("computeTypeOverride", option_to_yojson compute_type_to_yojson x.compute_type_override);
      ("imageOverride", option_to_yojson non_empty_string_to_yojson x.image_override);
      ( "environmentTypeOverride",
        option_to_yojson environment_type_to_yojson x.environment_type_override );
      ( "reportBuildBatchStatusOverride",
        option_to_yojson wrapper_boolean_to_yojson x.report_build_batch_status_override );
      ("insecureSslOverride", option_to_yojson wrapper_boolean_to_yojson x.insecure_ssl_override);
      ("buildspecOverride", option_to_yojson string__to_yojson x.buildspec_override);
      ( "gitSubmodulesConfigOverride",
        option_to_yojson git_submodules_config_to_yojson x.git_submodules_config_override );
      ( "gitCloneDepthOverride",
        option_to_yojson git_clone_depth_to_yojson x.git_clone_depth_override );
      ("sourceAuthOverride", option_to_yojson source_auth_to_yojson x.source_auth_override);
      ("sourceLocationOverride", option_to_yojson string__to_yojson x.source_location_override);
      ("sourceTypeOverride", option_to_yojson source_type_to_yojson x.source_type_override);
      ( "environmentVariablesOverride",
        option_to_yojson environment_variables_to_yojson x.environment_variables_override );
      ( "secondaryArtifactsOverride",
        option_to_yojson project_artifacts_list_to_yojson x.secondary_artifacts_override );
      ("artifactsOverride", option_to_yojson project_artifacts_to_yojson x.artifacts_override);
      ("sourceVersion", option_to_yojson string__to_yojson x.source_version);
      ( "secondarySourcesVersionOverride",
        option_to_yojson project_secondary_source_versions_to_yojson
          x.secondary_sources_version_override );
      ( "secondarySourcesOverride",
        option_to_yojson project_sources_to_yojson x.secondary_sources_override );
      ("projectName", Some (non_empty_string_to_yojson x.project_name));
    ]

let server_type_to_yojson (x : server_type) =
  match x with
  | GITLAB_SELF_MANAGED -> `String "GITLAB_SELF_MANAGED"
  | GITLAB -> `String "GITLAB"
  | GITHUB_ENTERPRISE -> `String "GITHUB_ENTERPRISE"
  | BITBUCKET -> `String "BITBUCKET"
  | GITHUB -> `String "GITHUB"

let auth_type_to_yojson (x : auth_type) =
  match x with
  | SECRETS_MANAGER -> `String "SECRETS_MANAGER"
  | CODECONNECTIONS -> `String "CODECONNECTIONS"
  | PERSONAL_ACCESS_TOKEN -> `String "PERSONAL_ACCESS_TOKEN"
  | BASIC_AUTH -> `String "BASIC_AUTH"
  | OAUTH -> `String "OAUTH"

let source_credentials_info_to_yojson (x : source_credentials_info) =
  assoc_to_yojson
    [
      ("resource", option_to_yojson string__to_yojson x.resource);
      ("authType", option_to_yojson auth_type_to_yojson x.auth_type);
      ("serverType", option_to_yojson server_type_to_yojson x.server_type);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
    ]

let source_credentials_infos_to_yojson tree = list_to_yojson source_credentials_info_to_yojson tree

let sort_order_type_to_yojson (x : sort_order_type) =
  match x with DESCENDING -> `String "DESCENDING" | ASCENDING -> `String "ASCENDING"

let shared_resource_sort_by_type_to_yojson (x : shared_resource_sort_by_type) =
  match x with MODIFIED_TIME -> `String "MODIFIED_TIME" | ARN -> `String "ARN"

let sandboxes_to_yojson tree = list_to_yojson sandbox_to_yojson tree
let sandbox_ids_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let retry_build_output_to_yojson (x : retry_build_output) =
  assoc_to_yojson [ ("build", option_to_yojson build_to_yojson x.build) ]

let retry_build_input_to_yojson (x : retry_build_input) =
  assoc_to_yojson
    [
      ("idempotencyToken", option_to_yojson string__to_yojson x.idempotency_token);
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
    ]

let retry_build_batch_type_to_yojson (x : retry_build_batch_type) =
  match x with
  | RETRY_FAILED_BUILDS -> `String "RETRY_FAILED_BUILDS"
  | RETRY_ALL_BUILDS -> `String "RETRY_ALL_BUILDS"

let retry_build_batch_output_to_yojson (x : retry_build_batch_output) =
  assoc_to_yojson [ ("buildBatch", option_to_yojson build_batch_to_yojson x.build_batch) ]

let retry_build_batch_input_to_yojson (x : retry_build_batch_input) =
  assoc_to_yojson
    [
      ("retryType", option_to_yojson retry_build_batch_type_to_yojson x.retry_type);
      ("idempotencyToken", option_to_yojson string__to_yojson x.idempotency_token);
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
    ]

let resource_already_exists_exception_to_yojson (x : resource_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let report_status_type_to_yojson (x : report_status_type) =
  match x with
  | DELETING -> `String "DELETING"
  | INCOMPLETE -> `String "INCOMPLETE"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | GENERATING -> `String "GENERATING"

let percentage_to_yojson = double_to_yojson
let non_negative_int_to_yojson = int_to_yojson

let code_coverage_report_summary_to_yojson (x : code_coverage_report_summary) =
  assoc_to_yojson
    [
      ("branchesMissed", option_to_yojson non_negative_int_to_yojson x.branches_missed);
      ("branchesCovered", option_to_yojson non_negative_int_to_yojson x.branches_covered);
      ( "branchCoveragePercentage",
        option_to_yojson percentage_to_yojson x.branch_coverage_percentage );
      ("linesMissed", option_to_yojson non_negative_int_to_yojson x.lines_missed);
      ("linesCovered", option_to_yojson non_negative_int_to_yojson x.lines_covered);
      ("lineCoveragePercentage", option_to_yojson percentage_to_yojson x.line_coverage_percentage);
    ]

let report_to_yojson (x : report) =
  assoc_to_yojson
    [
      ( "codeCoverageSummary",
        option_to_yojson code_coverage_report_summary_to_yojson x.code_coverage_summary );
      ("testSummary", option_to_yojson test_report_summary_to_yojson x.test_summary);
      ("truncated", option_to_yojson wrapper_boolean_to_yojson x.truncated);
      ("exportConfig", option_to_yojson report_export_config_to_yojson x.export_config);
      ("expired", option_to_yojson timestamp_to_yojson x.expired);
      ("created", option_to_yojson timestamp_to_yojson x.created);
      ("status", option_to_yojson report_status_type_to_yojson x.status);
      ("executionId", option_to_yojson string__to_yojson x.execution_id);
      ("reportGroupArn", option_to_yojson non_empty_string_to_yojson x.report_group_arn);
      ("name", option_to_yojson string__to_yojson x.name);
      ("type", option_to_yojson report_type_to_yojson x.type_);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
    ]

let reports_to_yojson tree = list_to_yojson report_to_yojson tree

let report_with_raw_data_to_yojson (x : report_with_raw_data) =
  assoc_to_yojson
    [
      ("data", option_to_yojson string__to_yojson x.data);
      ("reportArn", option_to_yojson non_empty_string_to_yojson x.report_arn);
    ]

let report_groups_to_yojson tree = list_to_yojson report_group_to_yojson tree

let report_group_trend_stats_to_yojson (x : report_group_trend_stats) =
  assoc_to_yojson
    [
      ("min", option_to_yojson string__to_yojson x.min);
      ("max", option_to_yojson string__to_yojson x.max);
      ("average", option_to_yojson string__to_yojson x.average);
    ]

let report_group_trend_raw_data_list_to_yojson tree =
  list_to_yojson report_with_raw_data_to_yojson tree

let report_group_trend_field_type_to_yojson (x : report_group_trend_field_type) =
  match x with
  | BRANCHES_MISSED -> `String "BRANCHES_MISSED"
  | BRANCHES_COVERED -> `String "BRANCHES_COVERED"
  | BRANCH_COVERAGE -> `String "BRANCH_COVERAGE"
  | LINES_MISSED -> `String "LINES_MISSED"
  | LINES_COVERED -> `String "LINES_COVERED"
  | LINE_COVERAGE -> `String "LINE_COVERAGE"
  | TOTAL -> `String "TOTAL"
  | DURATION -> `String "DURATION"
  | PASS_RATE -> `String "PASS_RATE"

let report_group_sort_by_type_to_yojson (x : report_group_sort_by_type) =
  match x with
  | LAST_MODIFIED_TIME -> `String "LAST_MODIFIED_TIME"
  | CREATED_TIME -> `String "CREATED_TIME"
  | NAME -> `String "NAME"

let report_group_arns_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let report_filter_to_yojson (x : report_filter) =
  assoc_to_yojson [ ("status", option_to_yojson report_status_type_to_yojson x.status) ]

let report_code_coverage_sort_by_type_to_yojson (x : report_code_coverage_sort_by_type) =
  match x with
  | FILE_PATH -> `String "FILE_PATH"
  | LINE_COVERAGE_PERCENTAGE -> `String "LINE_COVERAGE_PERCENTAGE"

let report_arns_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let put_resource_policy_output_to_yojson (x : put_resource_policy_output) =
  assoc_to_yojson [ ("resourceArn", option_to_yojson non_empty_string_to_yojson x.resource_arn) ]

let put_resource_policy_input_to_yojson (x : put_resource_policy_input) =
  assoc_to_yojson
    [
      ("resourceArn", Some (non_empty_string_to_yojson x.resource_arn));
      ("policy", Some (non_empty_string_to_yojson x.policy));
    ]

let projects_to_yojson tree = list_to_yojson project_to_yojson tree

let project_sort_by_type_to_yojson (x : project_sort_by_type) =
  match x with
  | LAST_MODIFIED_TIME -> `String "LAST_MODIFIED_TIME"
  | CREATED_TIME -> `String "CREATED_TIME"
  | NAME -> `String "NAME"

let project_names_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree
let project_arns_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let platform_type_to_yojson (x : platform_type) =
  match x with
  | WINDOWS_SERVER -> `String "WINDOWS_SERVER"
  | UBUNTU -> `String "UBUNTU"
  | AMAZON_LINUX -> `String "AMAZON_LINUX"
  | DEBIAN -> `String "DEBIAN"

let page_size_to_yojson = int_to_yojson

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
      ("reportGroups", option_to_yojson report_group_arns_to_yojson x.report_groups);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_shared_report_groups_input_to_yojson (x : list_shared_report_groups_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("sortBy", option_to_yojson shared_resource_sort_by_type_to_yojson x.sort_by);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
    ]

let list_shared_projects_output_to_yojson (x : list_shared_projects_output) =
  assoc_to_yojson
    [
      ("projects", option_to_yojson project_arns_to_yojson x.projects);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_shared_projects_input_to_yojson (x : list_shared_projects_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson non_empty_string_to_yojson x.next_token);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("sortBy", option_to_yojson shared_resource_sort_by_type_to_yojson x.sort_by);
    ]

let list_sandboxes_output_to_yojson (x : list_sandboxes_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("ids", option_to_yojson sandbox_ids_to_yojson x.ids);
    ]

let list_sandboxes_input_to_yojson (x : list_sandboxes_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let list_sandboxes_for_project_output_to_yojson (x : list_sandboxes_for_project_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("ids", option_to_yojson sandbox_ids_to_yojson x.ids);
    ]

let list_sandboxes_for_project_input_to_yojson (x : list_sandboxes_for_project_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson sensitive_string_to_yojson x.next_token);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("projectName", Some (non_empty_string_to_yojson x.project_name));
    ]

let list_reports_output_to_yojson (x : list_reports_output) =
  assoc_to_yojson
    [
      ("reports", option_to_yojson report_arns_to_yojson x.reports);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_reports_input_to_yojson (x : list_reports_input) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson report_filter_to_yojson x.filter);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
    ]

let list_reports_for_report_group_output_to_yojson (x : list_reports_for_report_group_output) =
  assoc_to_yojson
    [
      ("reports", option_to_yojson report_arns_to_yojson x.reports);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_reports_for_report_group_input_to_yojson (x : list_reports_for_report_group_input) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson report_filter_to_yojson x.filter);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("reportGroupArn", Some (string__to_yojson x.report_group_arn));
    ]

let list_report_groups_output_to_yojson (x : list_report_groups_output) =
  assoc_to_yojson
    [
      ("reportGroups", option_to_yojson report_group_arns_to_yojson x.report_groups);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_report_groups_input_to_yojson (x : list_report_groups_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("sortBy", option_to_yojson report_group_sort_by_type_to_yojson x.sort_by);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
    ]

let list_projects_output_to_yojson (x : list_projects_output) =
  assoc_to_yojson
    [
      ("projects", option_to_yojson project_names_to_yojson x.projects);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_projects_input_to_yojson (x : list_projects_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson non_empty_string_to_yojson x.next_token);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("sortBy", option_to_yojson project_sort_by_type_to_yojson x.sort_by);
    ]

let fleet_arns_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let list_fleets_output_to_yojson (x : list_fleets_output) =
  assoc_to_yojson
    [
      ("fleets", option_to_yojson fleet_arns_to_yojson x.fleets);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let fleet_sort_by_type_to_yojson (x : fleet_sort_by_type) =
  match x with
  | LAST_MODIFIED_TIME -> `String "LAST_MODIFIED_TIME"
  | CREATED_TIME -> `String "CREATED_TIME"
  | NAME -> `String "NAME"

let list_fleets_input_to_yojson (x : list_fleets_input) =
  assoc_to_yojson
    [
      ("sortBy", option_to_yojson fleet_sort_by_type_to_yojson x.sort_by);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson sensitive_string_to_yojson x.next_token);
    ]

let language_type_to_yojson (x : language_type) =
  match x with
  | PHP -> `String "PHP"
  | BASE -> `String "BASE"
  | DOTNET -> `String "DOTNET"
  | ANDROID -> `String "ANDROID"
  | DOCKER -> `String "DOCKER"
  | GOLANG -> `String "GOLANG"
  | RUBY -> `String "RUBY"
  | NODE_JS -> `String "NODE_JS"
  | PYTHON -> `String "PYTHON"
  | JAVA -> `String "JAVA"

let image_versions_to_yojson tree = list_to_yojson string__to_yojson tree

let environment_image_to_yojson (x : environment_image) =
  assoc_to_yojson
    [
      ("versions", option_to_yojson image_versions_to_yojson x.versions);
      ("description", option_to_yojson string__to_yojson x.description);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let environment_images_to_yojson tree = list_to_yojson environment_image_to_yojson tree

let environment_language_to_yojson (x : environment_language) =
  assoc_to_yojson
    [
      ("images", option_to_yojson environment_images_to_yojson x.images);
      ("language", option_to_yojson language_type_to_yojson x.language);
    ]

let environment_languages_to_yojson tree = list_to_yojson environment_language_to_yojson tree

let environment_platform_to_yojson (x : environment_platform) =
  assoc_to_yojson
    [
      ("languages", option_to_yojson environment_languages_to_yojson x.languages);
      ("platform", option_to_yojson platform_type_to_yojson x.platform);
    ]

let environment_platforms_to_yojson tree = list_to_yojson environment_platform_to_yojson tree

let list_curated_environment_images_output_to_yojson (x : list_curated_environment_images_output) =
  assoc_to_yojson [ ("platforms", option_to_yojson environment_platforms_to_yojson x.platforms) ]

let list_curated_environment_images_input_to_yojson = unit_to_yojson
let command_executions_to_yojson tree = list_to_yojson command_execution_to_yojson tree

let list_command_executions_for_sandbox_output_to_yojson
    (x : list_command_executions_for_sandbox_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("commandExecutions", option_to_yojson command_executions_to_yojson x.command_executions);
    ]

let list_command_executions_for_sandbox_input_to_yojson
    (x : list_command_executions_for_sandbox_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson sensitive_string_to_yojson x.next_token);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("sandboxId", Some (non_empty_string_to_yojson x.sandbox_id));
    ]

let build_ids_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let list_builds_output_to_yojson (x : list_builds_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("ids", option_to_yojson build_ids_to_yojson x.ids);
    ]

let list_builds_input_to_yojson (x : list_builds_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
    ]

let list_builds_for_project_output_to_yojson (x : list_builds_for_project_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("ids", option_to_yojson build_ids_to_yojson x.ids);
    ]

let list_builds_for_project_input_to_yojson (x : list_builds_for_project_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("projectName", Some (non_empty_string_to_yojson x.project_name));
    ]

let build_batch_ids_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let list_build_batches_output_to_yojson (x : list_build_batches_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("ids", option_to_yojson build_batch_ids_to_yojson x.ids);
    ]

let build_batch_filter_to_yojson (x : build_batch_filter) =
  assoc_to_yojson [ ("status", option_to_yojson status_type_to_yojson x.status) ]

let list_build_batches_input_to_yojson (x : list_build_batches_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("filter", option_to_yojson build_batch_filter_to_yojson x.filter);
    ]

let list_build_batches_for_project_output_to_yojson (x : list_build_batches_for_project_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("ids", option_to_yojson build_batch_ids_to_yojson x.ids);
    ]

let list_build_batches_for_project_input_to_yojson (x : list_build_batches_for_project_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("filter", option_to_yojson build_batch_filter_to_yojson x.filter);
      ("projectName", option_to_yojson non_empty_string_to_yojson x.project_name);
    ]

let invalidate_project_cache_output_to_yojson = unit_to_yojson

let invalidate_project_cache_input_to_yojson (x : invalidate_project_cache_input) =
  assoc_to_yojson [ ("projectName", Some (non_empty_string_to_yojson x.project_name)) ]

let import_source_credentials_output_to_yojson (x : import_source_credentials_output) =
  assoc_to_yojson [ ("arn", option_to_yojson non_empty_string_to_yojson x.arn) ]

let import_source_credentials_input_to_yojson (x : import_source_credentials_input) =
  assoc_to_yojson
    [
      ("shouldOverwrite", option_to_yojson wrapper_boolean_to_yojson x.should_overwrite);
      ("authType", Some (auth_type_to_yojson x.auth_type));
      ("serverType", Some (server_type_to_yojson x.server_type));
      ("token", Some (sensitive_non_empty_string_to_yojson x.token));
      ("username", option_to_yojson non_empty_string_to_yojson x.username);
    ]

let get_resource_policy_output_to_yojson (x : get_resource_policy_output) =
  assoc_to_yojson [ ("policy", option_to_yojson non_empty_string_to_yojson x.policy) ]

let get_resource_policy_input_to_yojson (x : get_resource_policy_input) =
  assoc_to_yojson [ ("resourceArn", Some (non_empty_string_to_yojson x.resource_arn)) ]

let get_report_group_trend_output_to_yojson (x : get_report_group_trend_output) =
  assoc_to_yojson
    [
      ("rawData", option_to_yojson report_group_trend_raw_data_list_to_yojson x.raw_data);
      ("stats", option_to_yojson report_group_trend_stats_to_yojson x.stats);
    ]

let get_report_group_trend_input_to_yojson (x : get_report_group_trend_input) =
  assoc_to_yojson
    [
      ("trendField", Some (report_group_trend_field_type_to_yojson x.trend_field));
      ("numOfReports", option_to_yojson page_size_to_yojson x.num_of_reports);
      ("reportGroupArn", Some (non_empty_string_to_yojson x.report_group_arn));
    ]

let fleets_to_yojson tree = list_to_yojson fleet_to_yojson tree
let fleet_names_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let describe_test_cases_output_to_yojson (x : describe_test_cases_output) =
  assoc_to_yojson
    [
      ("testCases", option_to_yojson test_cases_to_yojson x.test_cases);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_test_cases_input_to_yojson (x : describe_test_cases_input) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson test_case_filter_to_yojson x.filter);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("reportArn", Some (string__to_yojson x.report_arn));
    ]

let code_coverage_to_yojson (x : code_coverage) =
  assoc_to_yojson
    [
      ("expired", option_to_yojson timestamp_to_yojson x.expired);
      ("branchesMissed", option_to_yojson non_negative_int_to_yojson x.branches_missed);
      ("branchesCovered", option_to_yojson non_negative_int_to_yojson x.branches_covered);
      ( "branchCoveragePercentage",
        option_to_yojson percentage_to_yojson x.branch_coverage_percentage );
      ("linesMissed", option_to_yojson non_negative_int_to_yojson x.lines_missed);
      ("linesCovered", option_to_yojson non_negative_int_to_yojson x.lines_covered);
      ("lineCoveragePercentage", option_to_yojson percentage_to_yojson x.line_coverage_percentage);
      ("filePath", option_to_yojson non_empty_string_to_yojson x.file_path);
      ("reportARN", option_to_yojson non_empty_string_to_yojson x.report_ar_n);
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
    ]

let code_coverages_to_yojson tree = list_to_yojson code_coverage_to_yojson tree

let describe_code_coverages_output_to_yojson (x : describe_code_coverages_output) =
  assoc_to_yojson
    [
      ("codeCoverages", option_to_yojson code_coverages_to_yojson x.code_coverages);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_code_coverages_input_to_yojson (x : describe_code_coverages_input) =
  assoc_to_yojson
    [
      ( "maxLineCoveragePercentage",
        option_to_yojson percentage_to_yojson x.max_line_coverage_percentage );
      ( "minLineCoveragePercentage",
        option_to_yojson percentage_to_yojson x.min_line_coverage_percentage );
      ("sortBy", option_to_yojson report_code_coverage_sort_by_type_to_yojson x.sort_by);
      ("sortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("reportArn", Some (non_empty_string_to_yojson x.report_arn));
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

let delete_report_output_to_yojson = unit_to_yojson

let delete_report_input_to_yojson (x : delete_report_input) =
  assoc_to_yojson [ ("arn", Some (non_empty_string_to_yojson x.arn)) ]

let delete_report_group_output_to_yojson = unit_to_yojson

let delete_report_group_input_to_yojson (x : delete_report_group_input) =
  assoc_to_yojson
    [
      ("deleteReports", option_to_yojson boolean__to_yojson x.delete_reports);
      ("arn", Some (non_empty_string_to_yojson x.arn));
    ]

let delete_project_output_to_yojson = unit_to_yojson

let delete_project_input_to_yojson (x : delete_project_input) =
  assoc_to_yojson [ ("name", Some (non_empty_string_to_yojson x.name)) ]

let delete_fleet_output_to_yojson = unit_to_yojson

let delete_fleet_input_to_yojson (x : delete_fleet_input) =
  assoc_to_yojson [ ("arn", Some (non_empty_string_to_yojson x.arn)) ]

let build_not_deleted_to_yojson (x : build_not_deleted) =
  assoc_to_yojson
    [
      ("statusCode", option_to_yojson string__to_yojson x.status_code);
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
    ]

let builds_not_deleted_to_yojson tree = list_to_yojson build_not_deleted_to_yojson tree

let delete_build_batch_output_to_yojson (x : delete_build_batch_output) =
  assoc_to_yojson
    [
      ("buildsNotDeleted", option_to_yojson builds_not_deleted_to_yojson x.builds_not_deleted);
      ("buildsDeleted", option_to_yojson build_ids_to_yojson x.builds_deleted);
      ("statusCode", option_to_yojson string__to_yojson x.status_code);
    ]

let delete_build_batch_input_to_yojson (x : delete_build_batch_input) =
  assoc_to_yojson [ ("id", Some (non_empty_string_to_yojson x.id)) ]

let create_webhook_output_to_yojson (x : create_webhook_output) =
  assoc_to_yojson [ ("webhook", option_to_yojson webhook_to_yojson x.webhook) ]

let create_webhook_input_to_yojson (x : create_webhook_input) =
  assoc_to_yojson
    [
      ( "pullRequestBuildPolicy",
        option_to_yojson pull_request_build_policy_to_yojson x.pull_request_build_policy );
      ("scopeConfiguration", option_to_yojson scope_configuration_to_yojson x.scope_configuration);
      ("manualCreation", option_to_yojson wrapper_boolean_to_yojson x.manual_creation);
      ("buildType", option_to_yojson webhook_build_type_to_yojson x.build_type);
      ("filterGroups", option_to_yojson filter_groups_to_yojson x.filter_groups);
      ("branchFilter", option_to_yojson string__to_yojson x.branch_filter);
      ("projectName", Some (project_name_to_yojson x.project_name));
    ]

let create_report_group_output_to_yojson (x : create_report_group_output) =
  assoc_to_yojson [ ("reportGroup", option_to_yojson report_group_to_yojson x.report_group) ]

let create_report_group_input_to_yojson (x : create_report_group_input) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("exportConfig", Some (report_export_config_to_yojson x.export_config));
      ("type", Some (report_type_to_yojson x.type_));
      ("name", Some (report_group_name_to_yojson x.name));
    ]

let create_project_output_to_yojson (x : create_project_output) =
  assoc_to_yojson [ ("project", option_to_yojson project_to_yojson x.project) ]

let create_project_input_to_yojson (x : create_project_input) =
  assoc_to_yojson
    [
      ("autoRetryLimit", option_to_yojson wrapper_int_to_yojson x.auto_retry_limit);
      ("concurrentBuildLimit", option_to_yojson wrapper_int_to_yojson x.concurrent_build_limit);
      ( "buildBatchConfig",
        option_to_yojson project_build_batch_config_to_yojson x.build_batch_config );
      ( "fileSystemLocations",
        option_to_yojson project_file_system_locations_to_yojson x.file_system_locations );
      ("logsConfig", option_to_yojson logs_config_to_yojson x.logs_config);
      ("badgeEnabled", option_to_yojson wrapper_boolean_to_yojson x.badge_enabled);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("encryptionKey", option_to_yojson non_empty_string_to_yojson x.encryption_key);
      ("queuedTimeoutInMinutes", option_to_yojson time_out_to_yojson x.queued_timeout_in_minutes);
      ("timeoutInMinutes", option_to_yojson build_time_out_to_yojson x.timeout_in_minutes);
      ("serviceRole", Some (non_empty_string_to_yojson x.service_role));
      ("environment", Some (project_environment_to_yojson x.environment));
      ("cache", option_to_yojson project_cache_to_yojson x.cache);
      ("secondaryArtifacts", option_to_yojson project_artifacts_list_to_yojson x.secondary_artifacts);
      ("artifacts", Some (project_artifacts_to_yojson x.artifacts));
      ( "secondarySourceVersions",
        option_to_yojson project_secondary_source_versions_to_yojson x.secondary_source_versions );
      ("sourceVersion", option_to_yojson string__to_yojson x.source_version);
      ("secondarySources", option_to_yojson project_sources_to_yojson x.secondary_sources);
      ("source", Some (project_source_to_yojson x.source));
      ("description", option_to_yojson project_description_to_yojson x.description);
      ("name", Some (project_name_to_yojson x.name));
    ]

let create_fleet_output_to_yojson (x : create_fleet_output) =
  assoc_to_yojson [ ("fleet", option_to_yojson fleet_to_yojson x.fleet) ]

let create_fleet_input_to_yojson (x : create_fleet_input) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("fleetServiceRole", option_to_yojson non_empty_string_to_yojson x.fleet_service_role);
      ("imageId", option_to_yojson non_empty_string_to_yojson x.image_id);
      ("proxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("overflowBehavior", option_to_yojson fleet_overflow_behavior_to_yojson x.overflow_behavior);
      ( "scalingConfiguration",
        option_to_yojson scaling_configuration_input_to_yojson x.scaling_configuration );
      ( "computeConfiguration",
        option_to_yojson compute_configuration_to_yojson x.compute_configuration );
      ("computeType", Some (compute_type_to_yojson x.compute_type));
      ("environmentType", Some (environment_type_to_yojson x.environment_type));
      ("baseCapacity", Some (fleet_capacity_to_yojson x.base_capacity));
      ("name", Some (fleet_name_to_yojson x.name));
    ]

let command_execution_ids_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let batch_get_sandboxes_output_to_yojson (x : batch_get_sandboxes_output) =
  assoc_to_yojson
    [
      ("sandboxesNotFound", option_to_yojson sandbox_ids_to_yojson x.sandboxes_not_found);
      ("sandboxes", option_to_yojson sandboxes_to_yojson x.sandboxes);
    ]

let batch_get_sandboxes_input_to_yojson (x : batch_get_sandboxes_input) =
  assoc_to_yojson [ ("ids", Some (sandbox_ids_to_yojson x.ids)) ]

let batch_get_reports_output_to_yojson (x : batch_get_reports_output) =
  assoc_to_yojson
    [
      ("reportsNotFound", option_to_yojson report_arns_to_yojson x.reports_not_found);
      ("reports", option_to_yojson reports_to_yojson x.reports);
    ]

let batch_get_reports_input_to_yojson (x : batch_get_reports_input) =
  assoc_to_yojson [ ("reportArns", Some (report_arns_to_yojson x.report_arns)) ]

let batch_get_report_groups_output_to_yojson (x : batch_get_report_groups_output) =
  assoc_to_yojson
    [
      ( "reportGroupsNotFound",
        option_to_yojson report_group_arns_to_yojson x.report_groups_not_found );
      ("reportGroups", option_to_yojson report_groups_to_yojson x.report_groups);
    ]

let batch_get_report_groups_input_to_yojson (x : batch_get_report_groups_input) =
  assoc_to_yojson [ ("reportGroupArns", Some (report_group_arns_to_yojson x.report_group_arns)) ]

let batch_get_projects_output_to_yojson (x : batch_get_projects_output) =
  assoc_to_yojson
    [
      ("projectsNotFound", option_to_yojson project_names_to_yojson x.projects_not_found);
      ("projects", option_to_yojson projects_to_yojson x.projects);
    ]

let batch_get_projects_input_to_yojson (x : batch_get_projects_input) =
  assoc_to_yojson [ ("names", Some (project_names_to_yojson x.names)) ]

let batch_get_fleets_output_to_yojson (x : batch_get_fleets_output) =
  assoc_to_yojson
    [
      ("fleetsNotFound", option_to_yojson fleet_names_to_yojson x.fleets_not_found);
      ("fleets", option_to_yojson fleets_to_yojson x.fleets);
    ]

let batch_get_fleets_input_to_yojson (x : batch_get_fleets_input) =
  assoc_to_yojson [ ("names", Some (fleet_names_to_yojson x.names)) ]

let batch_get_command_executions_output_to_yojson (x : batch_get_command_executions_output) =
  assoc_to_yojson
    [
      ( "commandExecutionsNotFound",
        option_to_yojson command_execution_ids_to_yojson x.command_executions_not_found );
      ("commandExecutions", option_to_yojson command_executions_to_yojson x.command_executions);
    ]

let batch_get_command_executions_input_to_yojson (x : batch_get_command_executions_input) =
  assoc_to_yojson
    [
      ("commandExecutionIds", Some (command_execution_ids_to_yojson x.command_execution_ids));
      ("sandboxId", Some (non_empty_string_to_yojson x.sandbox_id));
    ]

let builds_to_yojson tree = list_to_yojson build_to_yojson tree

let batch_get_builds_output_to_yojson (x : batch_get_builds_output) =
  assoc_to_yojson
    [
      ("buildsNotFound", option_to_yojson build_ids_to_yojson x.builds_not_found);
      ("builds", option_to_yojson builds_to_yojson x.builds);
    ]

let batch_get_builds_input_to_yojson (x : batch_get_builds_input) =
  assoc_to_yojson [ ("ids", Some (build_ids_to_yojson x.ids)) ]

let build_batches_to_yojson tree = list_to_yojson build_batch_to_yojson tree

let batch_get_build_batches_output_to_yojson (x : batch_get_build_batches_output) =
  assoc_to_yojson
    [
      ("buildBatchesNotFound", option_to_yojson build_batch_ids_to_yojson x.build_batches_not_found);
      ("buildBatches", option_to_yojson build_batches_to_yojson x.build_batches);
    ]

let batch_get_build_batches_input_to_yojson (x : batch_get_build_batches_input) =
  assoc_to_yojson [ ("ids", Some (build_batch_ids_to_yojson x.ids)) ]

let batch_delete_builds_output_to_yojson (x : batch_delete_builds_output) =
  assoc_to_yojson
    [
      ("buildsNotDeleted", option_to_yojson builds_not_deleted_to_yojson x.builds_not_deleted);
      ("buildsDeleted", option_to_yojson build_ids_to_yojson x.builds_deleted);
    ]

let batch_delete_builds_input_to_yojson (x : batch_delete_builds_input) =
  assoc_to_yojson [ ("ids", Some (build_ids_to_yojson x.ids)) ]
