open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let role_arn_to_yojson = string_to_yojson

let environment_account_connection_status_to_yojson (x : environment_account_connection_status) =
  match x with
  | PENDING -> `String "PENDING"
  | CONNECTED -> `String "CONNECTED"
  | REJECTED -> `String "REJECTED"

let resource_name_to_yojson = string_to_yojson
let arn_to_yojson = string_to_yojson
let aws_account_id_to_yojson = string_to_yojson
let environment_account_connection_arn_to_yojson = string_to_yojson
let environment_account_connection_id_to_yojson = string_to_yojson

let environment_account_connection_to_yojson (x : environment_account_connection) =
  assoc_to_yojson
    [
      ("id", Some (environment_account_connection_id_to_yojson x.id));
      ("arn", Some (environment_account_connection_arn_to_yojson x.arn));
      ("managementAccountId", Some (aws_account_id_to_yojson x.management_account_id));
      ("environmentAccountId", Some (aws_account_id_to_yojson x.environment_account_id));
      ("roleArn", Some (arn_to_yojson x.role_arn));
      ("environmentName", Some (resource_name_to_yojson x.environment_name));
      ( "requestedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.requested_at)
      );
      ( "lastModifiedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_modified_at) );
      ("status", Some (environment_account_connection_status_to_yojson x.status));
      ("componentRoleArn", option_to_yojson role_arn_to_yojson x.component_role_arn);
      ("codebuildRoleArn", option_to_yojson role_arn_to_yojson x.codebuild_role_arn);
    ]

let accept_environment_account_connection_output_to_yojson
    (x : accept_environment_account_connection_output) =
  assoc_to_yojson
    [
      ( "environmentAccountConnection",
        Some (environment_account_connection_to_yojson x.environment_account_connection) );
    ]

let accept_environment_account_connection_input_to_yojson
    (x : accept_environment_account_connection_input) =
  assoc_to_yojson [ ("id", Some (environment_account_connection_id_to_yojson x.id)) ]

let role_arn_or_empty_string_to_yojson = string_to_yojson
let git_branch_name_to_yojson = string_to_yojson
let repository_name_to_yojson = string_to_yojson

let repository_provider_to_yojson (x : repository_provider) =
  match x with
  | GITHUB -> `String "GITHUB"
  | GITHUB_ENTERPRISE -> `String "GITHUB_ENTERPRISE"
  | BITBUCKET -> `String "BITBUCKET"

let repository_arn_to_yojson = string_to_yojson

let repository_branch_to_yojson (x : repository_branch) =
  assoc_to_yojson
    [
      ("arn", Some (repository_arn_to_yojson x.arn));
      ("provider", Some (repository_provider_to_yojson x.provider));
      ("name", Some (repository_name_to_yojson x.name));
      ("branch", Some (git_branch_name_to_yojson x.branch));
    ]

let account_settings_to_yojson (x : account_settings) =
  assoc_to_yojson
    [
      ( "pipelineServiceRoleArn",
        option_to_yojson role_arn_or_empty_string_to_yojson x.pipeline_service_role_arn );
      ( "pipelineProvisioningRepository",
        option_to_yojson repository_branch_to_yojson x.pipeline_provisioning_repository );
      ( "pipelineCodebuildRoleArn",
        option_to_yojson role_arn_or_empty_string_to_yojson x.pipeline_codebuild_role_arn );
    ]

let untag_resource_output_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_input_to_yojson (x : untag_resource_input) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_output_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("key", Some (tag_key_to_yojson x.key)); ("value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_input_to_yojson (x : tag_resource_input) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("tags", Some (tag_list_to_yojson x.tags));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let notify_resource_deployment_status_change_output_to_yojson = unit_to_yojson
let status_message_to_yojson = string_to_yojson
let deployment_id_to_yojson = string_to_yojson
let output_value_string_to_yojson = string_to_yojson
let output_key_to_yojson = string_to_yojson

let output_to_yojson (x : output) =
  assoc_to_yojson
    [
      ("key", option_to_yojson output_key_to_yojson x.key);
      ("valueString", option_to_yojson output_value_string_to_yojson x.value_string);
    ]

let outputs_list_to_yojson tree = list_to_yojson output_to_yojson tree

let resource_deployment_status_to_yojson (x : resource_deployment_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"

let notify_resource_deployment_status_change_input_to_yojson
    (x : notify_resource_deployment_status_change_input) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("status", option_to_yojson resource_deployment_status_to_yojson x.status);
      ("outputs", option_to_yojson outputs_list_to_yojson x.outputs);
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
      ("statusMessage", option_to_yojson status_message_to_yojson x.status_message);
    ]

let list_tags_for_resource_output_to_yojson (x : list_tags_for_resource_output) =
  assoc_to_yojson
    [
      ("tags", Some (tag_list_to_yojson x.tags));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let max_page_results_to_yojson = int_to_yojson

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("maxResults", option_to_yojson max_page_results_to_yojson x.max_results);
    ]

let repository_sync_definition_to_yojson (x : repository_sync_definition) =
  assoc_to_yojson
    [
      ("target", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.target));
      ("parent", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.parent));
      ("branch", Some (git_branch_name_to_yojson x.branch));
      ("directory", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.directory));
    ]

let repository_sync_definition_list_to_yojson tree =
  list_to_yojson repository_sync_definition_to_yojson tree

let empty_next_token_to_yojson = string_to_yojson

let list_repository_sync_definitions_output_to_yojson (x : list_repository_sync_definitions_output)
    =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson empty_next_token_to_yojson x.next_token);
      ("syncDefinitions", Some (repository_sync_definition_list_to_yojson x.sync_definitions));
    ]

let sync_type_to_yojson (x : sync_type) =
  match x with TEMPLATE_SYNC -> `String "TEMPLATE_SYNC" | SERVICE_SYNC -> `String "SERVICE_SYNC"

let list_repository_sync_definitions_input_to_yojson (x : list_repository_sync_definitions_input) =
  assoc_to_yojson
    [
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("repositoryProvider", Some (repository_provider_to_yojson x.repository_provider));
      ("syncType", Some (sync_type_to_yojson x.sync_type));
      ("nextToken", option_to_yojson empty_next_token_to_yojson x.next_token);
    ]

let sh_a_to_yojson = string_to_yojson

let revision_to_yojson (x : revision) =
  assoc_to_yojson
    [
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("repositoryProvider", Some (repository_provider_to_yojson x.repository_provider));
      ("sha", Some (sh_a_to_yojson x.sha));
      ("directory", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.directory));
      ("branch", Some (git_branch_name_to_yojson x.branch));
    ]

let resource_sync_event_to_yojson (x : resource_sync_event) =
  assoc_to_yojson
    [
      ("type", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.type_));
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("time", Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.time));
      ("event", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.event));
    ]

let resource_sync_events_to_yojson tree = list_to_yojson resource_sync_event_to_yojson tree

let resource_sync_status_to_yojson (x : resource_sync_status) =
  match x with
  | INITIATED -> `String "INITIATED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"

let resource_sync_attempt_to_yojson (x : resource_sync_attempt) =
  assoc_to_yojson
    [
      ("initialRevision", Some (revision_to_yojson x.initial_revision));
      ("targetRevision", Some (revision_to_yojson x.target_revision));
      ("target", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.target));
      ( "startedAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.started_at)
      );
      ("status", Some (resource_sync_status_to_yojson x.status));
      ("events", Some (resource_sync_events_to_yojson x.events));
    ]

let get_template_sync_status_output_to_yojson (x : get_template_sync_status_output) =
  assoc_to_yojson
    [
      ("latestSync", option_to_yojson resource_sync_attempt_to_yojson x.latest_sync);
      ( "latestSuccessfulSync",
        option_to_yojson resource_sync_attempt_to_yojson x.latest_successful_sync );
      ("desiredState", option_to_yojson revision_to_yojson x.desired_state);
    ]

let template_version_part_to_yojson = string_to_yojson

let template_type_to_yojson (x : template_type) =
  match x with ENVIRONMENT -> `String "ENVIRONMENT" | SERVICE -> `String "SERVICE"

let get_template_sync_status_input_to_yojson (x : get_template_sync_status_input) =
  assoc_to_yojson
    [
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("templateType", Some (template_type_to_yojson x.template_type));
      ("templateVersion", Some (template_version_part_to_yojson x.template_version));
    ]

let get_service_instance_sync_status_output_to_yojson (x : get_service_instance_sync_status_output)
    =
  assoc_to_yojson
    [
      ("latestSync", option_to_yojson resource_sync_attempt_to_yojson x.latest_sync);
      ( "latestSuccessfulSync",
        option_to_yojson resource_sync_attempt_to_yojson x.latest_successful_sync );
      ("desiredState", option_to_yojson revision_to_yojson x.desired_state);
    ]

let get_service_instance_sync_status_input_to_yojson (x : get_service_instance_sync_status_input) =
  assoc_to_yojson
    [
      ("serviceName", Some (resource_name_to_yojson x.service_name));
      ("serviceInstanceName", Some (resource_name_to_yojson x.service_instance_name));
    ]

let resource_counts_summary_to_yojson (x : resource_counts_summary) =
  assoc_to_yojson
    [
      ("total", Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.total));
      ("failed", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.failed);
      ( "upToDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.up_to_date );
      ( "behindMajor",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.behind_major );
      ( "behindMinor",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.behind_minor );
    ]

let counts_summary_to_yojson (x : counts_summary) =
  assoc_to_yojson
    [
      ("components", option_to_yojson resource_counts_summary_to_yojson x.components);
      ("environments", option_to_yojson resource_counts_summary_to_yojson x.environments);
      ( "environmentTemplates",
        option_to_yojson resource_counts_summary_to_yojson x.environment_templates );
      ("serviceInstances", option_to_yojson resource_counts_summary_to_yojson x.service_instances);
      ("services", option_to_yojson resource_counts_summary_to_yojson x.services);
      ("serviceTemplates", option_to_yojson resource_counts_summary_to_yojson x.service_templates);
      ("pipelines", option_to_yojson resource_counts_summary_to_yojson x.pipelines);
    ]

let get_resources_summary_output_to_yojson (x : get_resources_summary_output) =
  assoc_to_yojson [ ("counts", Some (counts_summary_to_yojson x.counts)) ]

let get_resources_summary_input_to_yojson = unit_to_yojson

let repository_sync_event_to_yojson (x : repository_sync_event) =
  assoc_to_yojson
    [
      ("type", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.type_));
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("time", Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.time));
      ("event", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.event));
    ]

let repository_sync_events_to_yojson tree = list_to_yojson repository_sync_event_to_yojson tree

let repository_sync_status_to_yojson (x : repository_sync_status) =
  match x with
  | INITIATED -> `String "INITIATED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | QUEUED -> `String "QUEUED"

let repository_sync_attempt_to_yojson (x : repository_sync_attempt) =
  assoc_to_yojson
    [
      ( "startedAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.started_at)
      );
      ("status", Some (repository_sync_status_to_yojson x.status));
      ("events", Some (repository_sync_events_to_yojson x.events));
    ]

let get_repository_sync_status_output_to_yojson (x : get_repository_sync_status_output) =
  assoc_to_yojson
    [ ("latestSync", option_to_yojson repository_sync_attempt_to_yojson x.latest_sync) ]

let get_repository_sync_status_input_to_yojson (x : get_repository_sync_status_input) =
  assoc_to_yojson
    [
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("repositoryProvider", Some (repository_provider_to_yojson x.repository_provider));
      ("branch", Some (git_branch_name_to_yojson x.branch));
      ("syncType", Some (sync_type_to_yojson x.sync_type));
    ]

let spec_contents_to_yojson = string_to_yojson

let deployment_status_to_yojson (x : deployment_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETE_COMPLETE -> `String "DELETE_COMPLETE"
  | CANCELLING -> `String "CANCELLING"
  | CANCELLED -> `String "CANCELLED"

let service_pipeline_to_yojson (x : service_pipeline) =
  assoc_to_yojson
    [
      ("arn", Some (arn_to_yojson x.arn));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ( "lastDeploymentAttemptedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_deployment_attempted_at) );
      ( "lastDeploymentSucceededAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_deployment_succeeded_at) );
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("templateMajorVersion", Some (template_version_part_to_yojson x.template_major_version));
      ("templateMinorVersion", Some (template_version_part_to_yojson x.template_minor_version));
      ("deploymentStatus", Some (deployment_status_to_yojson x.deployment_status));
      ( "deploymentStatusMessage",
        option_to_yojson status_message_to_yojson x.deployment_status_message );
      ("spec", option_to_yojson spec_contents_to_yojson x.spec);
      ( "lastAttemptedDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_attempted_deployment_id );
      ( "lastSucceededDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_succeeded_deployment_id );
    ]

let cancel_service_pipeline_deployment_output_to_yojson
    (x : cancel_service_pipeline_deployment_output) =
  assoc_to_yojson [ ("pipeline", Some (service_pipeline_to_yojson x.pipeline)) ]

let cancel_service_pipeline_deployment_input_to_yojson
    (x : cancel_service_pipeline_deployment_input) =
  assoc_to_yojson [ ("serviceName", Some (resource_name_to_yojson x.service_name)) ]

let service_instance_arn_to_yojson = string_to_yojson

let service_instance_to_yojson (x : service_instance) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("arn", Some (service_instance_arn_to_yojson x.arn));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ( "lastDeploymentAttemptedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_deployment_attempted_at) );
      ( "lastDeploymentSucceededAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_deployment_succeeded_at) );
      ("serviceName", Some (resource_name_to_yojson x.service_name));
      ("environmentName", Some (resource_name_to_yojson x.environment_name));
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("templateMajorVersion", Some (template_version_part_to_yojson x.template_major_version));
      ("templateMinorVersion", Some (template_version_part_to_yojson x.template_minor_version));
      ("deploymentStatus", Some (deployment_status_to_yojson x.deployment_status));
      ( "deploymentStatusMessage",
        option_to_yojson status_message_to_yojson x.deployment_status_message );
      ("spec", option_to_yojson spec_contents_to_yojson x.spec);
      ( "lastClientRequestToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.last_client_request_token );
      ( "lastAttemptedDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_attempted_deployment_id );
      ( "lastSucceededDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_succeeded_deployment_id );
    ]

let cancel_service_instance_deployment_output_to_yojson
    (x : cancel_service_instance_deployment_output) =
  assoc_to_yojson [ ("serviceInstance", Some (service_instance_to_yojson x.service_instance)) ]

let cancel_service_instance_deployment_input_to_yojson
    (x : cancel_service_instance_deployment_input) =
  assoc_to_yojson
    [
      ("serviceInstanceName", Some (resource_name_to_yojson x.service_instance_name));
      ("serviceName", Some (resource_name_to_yojson x.service_name));
    ]

let provisioning_to_yojson (x : provisioning) =
  match x with CUSTOMER_MANAGED -> `String "CUSTOMER_MANAGED"

let environment_arn_to_yojson = string_to_yojson
let description_to_yojson = string_to_yojson

let environment_to_yojson (x : environment) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ( "lastDeploymentAttemptedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_deployment_attempted_at) );
      ( "lastDeploymentSucceededAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_deployment_succeeded_at) );
      ("arn", Some (environment_arn_to_yojson x.arn));
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("templateMajorVersion", Some (template_version_part_to_yojson x.template_major_version));
      ("templateMinorVersion", Some (template_version_part_to_yojson x.template_minor_version));
      ("deploymentStatus", Some (deployment_status_to_yojson x.deployment_status));
      ( "deploymentStatusMessage",
        option_to_yojson status_message_to_yojson x.deployment_status_message );
      ("protonServiceRoleArn", option_to_yojson arn_to_yojson x.proton_service_role_arn);
      ( "environmentAccountConnectionId",
        option_to_yojson environment_account_connection_id_to_yojson
          x.environment_account_connection_id );
      ("environmentAccountId", option_to_yojson aws_account_id_to_yojson x.environment_account_id);
      ("spec", option_to_yojson spec_contents_to_yojson x.spec);
      ("provisioning", option_to_yojson provisioning_to_yojson x.provisioning);
      ( "provisioningRepository",
        option_to_yojson repository_branch_to_yojson x.provisioning_repository );
      ("componentRoleArn", option_to_yojson role_arn_to_yojson x.component_role_arn);
      ("codebuildRoleArn", option_to_yojson role_arn_to_yojson x.codebuild_role_arn);
      ( "lastAttemptedDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_attempted_deployment_id );
      ( "lastSucceededDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_succeeded_deployment_id );
    ]

let cancel_environment_deployment_output_to_yojson (x : cancel_environment_deployment_output) =
  assoc_to_yojson [ ("environment", Some (environment_to_yojson x.environment)) ]

let cancel_environment_deployment_input_to_yojson (x : cancel_environment_deployment_input) =
  assoc_to_yojson [ ("environmentName", Some (resource_name_to_yojson x.environment_name)) ]

let component_arn_to_yojson = string_to_yojson

let component_to_yojson (x : component) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("arn", Some (component_arn_to_yojson x.arn));
      ("environmentName", Some (resource_name_to_yojson x.environment_name));
      ("serviceName", option_to_yojson resource_name_to_yojson x.service_name);
      ("serviceInstanceName", option_to_yojson resource_name_to_yojson x.service_instance_name);
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ( "lastModifiedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_modified_at) );
      ( "lastDeploymentAttemptedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_deployment_attempted_at );
      ( "lastDeploymentSucceededAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_deployment_succeeded_at );
      ("deploymentStatus", Some (deployment_status_to_yojson x.deployment_status));
      ( "deploymentStatusMessage",
        option_to_yojson status_message_to_yojson x.deployment_status_message );
      ("serviceSpec", option_to_yojson spec_contents_to_yojson x.service_spec);
      ( "lastClientRequestToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.last_client_request_token );
      ( "lastAttemptedDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_attempted_deployment_id );
      ( "lastSucceededDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_succeeded_deployment_id );
    ]

let cancel_component_deployment_output_to_yojson (x : cancel_component_deployment_output) =
  assoc_to_yojson [ ("component", Some (component_to_yojson x.component)) ]

let cancel_component_deployment_input_to_yojson (x : cancel_component_deployment_input) =
  assoc_to_yojson [ ("componentName", Some (resource_name_to_yojson x.component_name)) ]

let blocker_status_to_yojson (x : blocker_status) =
  match x with ACTIVE -> `String "ACTIVE" | RESOLVED -> `String "RESOLVED"

let blocker_type_to_yojson (x : blocker_type) = match x with AUTOMATED -> `String "AUTOMATED"
let client_token_to_yojson = string_to_yojson

let compatible_environment_template_to_yojson (x : compatible_environment_template) =
  assoc_to_yojson
    [
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("majorVersion", Some (template_version_part_to_yojson x.major_version));
    ]

let compatible_environment_template_input_to_yojson (x : compatible_environment_template_input) =
  assoc_to_yojson
    [
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("majorVersion", Some (template_version_part_to_yojson x.major_version));
    ]

let compatible_environment_template_input_list_to_yojson tree =
  list_to_yojson compatible_environment_template_input_to_yojson tree

let compatible_environment_template_list_to_yojson tree =
  list_to_yojson compatible_environment_template_to_yojson tree

let component_deployment_id_list_to_yojson tree = list_to_yojson deployment_id_to_yojson tree

let component_deployment_update_type_to_yojson (x : component_deployment_update_type) =
  match x with NONE -> `String "NONE" | CURRENT_VERSION -> `String "CURRENT_VERSION"

let template_file_contents_to_yojson = string_to_yojson
let resource_name_or_empty_to_yojson = string_to_yojson

let component_state_to_yojson (x : component_state) =
  assoc_to_yojson
    [
      ("serviceName", option_to_yojson resource_name_or_empty_to_yojson x.service_name);
      ( "serviceInstanceName",
        option_to_yojson resource_name_or_empty_to_yojson x.service_instance_name );
      ("serviceSpec", option_to_yojson spec_contents_to_yojson x.service_spec);
      ("templateFile", option_to_yojson template_file_contents_to_yojson x.template_file);
    ]

let component_summary_to_yojson (x : component_summary) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("arn", Some (component_arn_to_yojson x.arn));
      ("environmentName", Some (resource_name_to_yojson x.environment_name));
      ("serviceName", option_to_yojson resource_name_to_yojson x.service_name);
      ("serviceInstanceName", option_to_yojson resource_name_to_yojson x.service_instance_name);
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ( "lastModifiedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_modified_at) );
      ( "lastDeploymentAttemptedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_deployment_attempted_at );
      ( "lastDeploymentSucceededAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_deployment_succeeded_at );
      ("deploymentStatus", Some (deployment_status_to_yojson x.deployment_status));
      ( "deploymentStatusMessage",
        option_to_yojson status_message_to_yojson x.deployment_status_message );
      ( "lastAttemptedDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_attempted_deployment_id );
      ( "lastSucceededDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_succeeded_deployment_id );
    ]

let component_summary_list_to_yojson tree = list_to_yojson component_summary_to_yojson tree

let create_component_output_to_yojson (x : create_component_output) =
  assoc_to_yojson [ ("component", Some (component_to_yojson x.component)) ]

let template_manifest_contents_to_yojson = string_to_yojson

let create_component_input_to_yojson (x : create_component_input) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("serviceName", option_to_yojson resource_name_to_yojson x.service_name);
      ("serviceInstanceName", option_to_yojson resource_name_to_yojson x.service_instance_name);
      ("environmentName", option_to_yojson resource_name_to_yojson x.environment_name);
      ("templateFile", Some (template_file_contents_to_yojson x.template_file));
      ("manifest", Some (template_manifest_contents_to_yojson x.manifest));
      ("serviceSpec", option_to_yojson spec_contents_to_yojson x.service_spec);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_environment_output_to_yojson (x : create_environment_output) =
  assoc_to_yojson [ ("environment", Some (environment_to_yojson x.environment)) ]

let repository_branch_input_to_yojson (x : repository_branch_input) =
  assoc_to_yojson
    [
      ("provider", Some (repository_provider_to_yojson x.provider));
      ("name", Some (repository_name_to_yojson x.name));
      ("branch", Some (git_branch_name_to_yojson x.branch));
    ]

let create_environment_input_to_yojson (x : create_environment_input) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("templateMajorVersion", Some (template_version_part_to_yojson x.template_major_version));
      ( "templateMinorVersion",
        option_to_yojson template_version_part_to_yojson x.template_minor_version );
      ("description", option_to_yojson description_to_yojson x.description);
      ("spec", Some (spec_contents_to_yojson x.spec));
      ("protonServiceRoleArn", option_to_yojson arn_to_yojson x.proton_service_role_arn);
      ( "environmentAccountConnectionId",
        option_to_yojson environment_account_connection_id_to_yojson
          x.environment_account_connection_id );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "provisioningRepository",
        option_to_yojson repository_branch_input_to_yojson x.provisioning_repository );
      ("componentRoleArn", option_to_yojson role_arn_to_yojson x.component_role_arn);
      ("codebuildRoleArn", option_to_yojson role_arn_to_yojson x.codebuild_role_arn);
    ]

let create_environment_account_connection_output_to_yojson
    (x : create_environment_account_connection_output) =
  assoc_to_yojson
    [
      ( "environmentAccountConnection",
        Some (environment_account_connection_to_yojson x.environment_account_connection) );
    ]

let create_environment_account_connection_input_to_yojson
    (x : create_environment_account_connection_input) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("managementAccountId", Some (aws_account_id_to_yojson x.management_account_id));
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("environmentName", Some (resource_name_to_yojson x.environment_name));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("componentRoleArn", option_to_yojson role_arn_to_yojson x.component_role_arn);
      ("codebuildRoleArn", option_to_yojson role_arn_to_yojson x.codebuild_role_arn);
    ]

let full_template_version_number_to_yojson = string_to_yojson
let display_name_to_yojson = string_to_yojson
let environment_template_arn_to_yojson = string_to_yojson

let environment_template_to_yojson (x : environment_template) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("arn", Some (environment_template_arn_to_yojson x.arn));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ( "lastModifiedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_modified_at) );
      ("displayName", option_to_yojson display_name_to_yojson x.display_name);
      ("description", option_to_yojson description_to_yojson x.description);
      ( "recommendedVersion",
        option_to_yojson full_template_version_number_to_yojson x.recommended_version );
      ("encryptionKey", option_to_yojson arn_to_yojson x.encryption_key);
      ("provisioning", option_to_yojson provisioning_to_yojson x.provisioning);
    ]

let create_environment_template_output_to_yojson (x : create_environment_template_output) =
  assoc_to_yojson
    [ ("environmentTemplate", Some (environment_template_to_yojson x.environment_template)) ]

let create_environment_template_input_to_yojson (x : create_environment_template_input) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("displayName", option_to_yojson display_name_to_yojson x.display_name);
      ("description", option_to_yojson description_to_yojson x.description);
      ("encryptionKey", option_to_yojson arn_to_yojson x.encryption_key);
      ("provisioning", option_to_yojson provisioning_to_yojson x.provisioning);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let template_schema_to_yojson = string_to_yojson
let environment_template_version_arn_to_yojson = string_to_yojson

let template_version_status_to_yojson (x : template_version_status) =
  match x with
  | REGISTRATION_IN_PROGRESS -> `String "REGISTRATION_IN_PROGRESS"
  | REGISTRATION_FAILED -> `String "REGISTRATION_FAILED"
  | DRAFT -> `String "DRAFT"
  | PUBLISHED -> `String "PUBLISHED"

let environment_template_version_to_yojson (x : environment_template_version) =
  assoc_to_yojson
    [
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("majorVersion", Some (template_version_part_to_yojson x.major_version));
      ("minorVersion", Some (template_version_part_to_yojson x.minor_version));
      ( "recommendedMinorVersion",
        option_to_yojson template_version_part_to_yojson x.recommended_minor_version );
      ("status", Some (template_version_status_to_yojson x.status));
      ("statusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("description", option_to_yojson description_to_yojson x.description);
      ("arn", Some (environment_template_version_arn_to_yojson x.arn));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ( "lastModifiedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_modified_at) );
      ("schema", option_to_yojson template_schema_to_yojson x.schema);
    ]

let create_environment_template_version_output_to_yojson
    (x : create_environment_template_version_output) =
  assoc_to_yojson
    [
      ( "environmentTemplateVersion",
        Some (environment_template_version_to_yojson x.environment_template_version) );
    ]

let s3_key_to_yojson = string_to_yojson
let s3_bucket_to_yojson = string_to_yojson

let s3_object_source_to_yojson (x : s3_object_source) =
  assoc_to_yojson
    [ ("bucket", Some (s3_bucket_to_yojson x.bucket)); ("key", Some (s3_key_to_yojson x.key)) ]

let template_version_source_input_to_yojson (x : template_version_source_input) =
  match x with S3 arg -> assoc_to_yojson [ ("s3", Some (s3_object_source_to_yojson arg)) ]

let create_environment_template_version_input_to_yojson
    (x : create_environment_template_version_input) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("majorVersion", option_to_yojson template_version_part_to_yojson x.major_version);
      ("source", Some (template_version_source_input_to_yojson x.source));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let repository_to_yojson (x : repository) =
  assoc_to_yojson
    [
      ("arn", Some (repository_arn_to_yojson x.arn));
      ("provider", Some (repository_provider_to_yojson x.provider));
      ("name", Some (repository_name_to_yojson x.name));
      ("connectionArn", Some (arn_to_yojson x.connection_arn));
      ("encryptionKey", option_to_yojson arn_to_yojson x.encryption_key);
    ]

let create_repository_output_to_yojson (x : create_repository_output) =
  assoc_to_yojson [ ("repository", Some (repository_to_yojson x.repository)) ]

let create_repository_input_to_yojson (x : create_repository_input) =
  assoc_to_yojson
    [
      ("provider", Some (repository_provider_to_yojson x.provider));
      ("name", Some (repository_name_to_yojson x.name));
      ("connectionArn", Some (arn_to_yojson x.connection_arn));
      ("encryptionKey", option_to_yojson arn_to_yojson x.encryption_key);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let repository_id_to_yojson = string_to_yojson

let service_status_to_yojson (x : service_status) =
  match x with
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | CREATE_FAILED_CLEANUP_IN_PROGRESS -> `String "CREATE_FAILED_CLEANUP_IN_PROGRESS"
  | CREATE_FAILED_CLEANUP_COMPLETE -> `String "CREATE_FAILED_CLEANUP_COMPLETE"
  | CREATE_FAILED_CLEANUP_FAILED -> `String "CREATE_FAILED_CLEANUP_FAILED"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | ACTIVE -> `String "ACTIVE"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | UPDATE_IN_PROGRESS -> `String "UPDATE_IN_PROGRESS"
  | UPDATE_FAILED_CLEANUP_IN_PROGRESS -> `String "UPDATE_FAILED_CLEANUP_IN_PROGRESS"
  | UPDATE_FAILED_CLEANUP_COMPLETE -> `String "UPDATE_FAILED_CLEANUP_COMPLETE"
  | UPDATE_FAILED_CLEANUP_FAILED -> `String "UPDATE_FAILED_CLEANUP_FAILED"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | UPDATE_COMPLETE_CLEANUP_FAILED -> `String "UPDATE_COMPLETE_CLEANUP_FAILED"

let service_arn_to_yojson = string_to_yojson

let service_to_yojson (x : service) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("arn", Some (service_arn_to_yojson x.arn));
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ( "lastModifiedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_modified_at) );
      ("status", Some (service_status_to_yojson x.status));
      ("statusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("spec", Some (spec_contents_to_yojson x.spec));
      ("pipeline", option_to_yojson service_pipeline_to_yojson x.pipeline);
      ("repositoryConnectionArn", option_to_yojson arn_to_yojson x.repository_connection_arn);
      ("repositoryId", option_to_yojson repository_id_to_yojson x.repository_id);
      ("branchName", option_to_yojson git_branch_name_to_yojson x.branch_name);
    ]

let create_service_output_to_yojson (x : create_service_output) =
  assoc_to_yojson [ ("service", Some (service_to_yojson x.service)) ]

let create_service_input_to_yojson (x : create_service_input) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("templateMajorVersion", Some (template_version_part_to_yojson x.template_major_version));
      ( "templateMinorVersion",
        option_to_yojson template_version_part_to_yojson x.template_minor_version );
      ("spec", Some (spec_contents_to_yojson x.spec));
      ("repositoryConnectionArn", option_to_yojson arn_to_yojson x.repository_connection_arn);
      ("repositoryId", option_to_yojson repository_id_to_yojson x.repository_id);
      ("branchName", option_to_yojson git_branch_name_to_yojson x.branch_name);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_service_instance_output_to_yojson (x : create_service_instance_output) =
  assoc_to_yojson [ ("serviceInstance", Some (service_instance_to_yojson x.service_instance)) ]

let create_service_instance_input_to_yojson (x : create_service_instance_input) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("serviceName", Some (resource_name_to_yojson x.service_name));
      ("spec", Some (spec_contents_to_yojson x.spec));
      ( "templateMajorVersion",
        option_to_yojson template_version_part_to_yojson x.template_major_version );
      ( "templateMinorVersion",
        option_to_yojson template_version_part_to_yojson x.template_minor_version );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let ops_file_path_to_yojson = string_to_yojson

let service_sync_config_to_yojson (x : service_sync_config) =
  assoc_to_yojson
    [
      ("serviceName", Some (resource_name_to_yojson x.service_name));
      ("repositoryProvider", Some (repository_provider_to_yojson x.repository_provider));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("branch", Some (git_branch_name_to_yojson x.branch));
      ("filePath", Some (ops_file_path_to_yojson x.file_path));
    ]

let create_service_sync_config_output_to_yojson (x : create_service_sync_config_output) =
  assoc_to_yojson
    [ ("serviceSyncConfig", option_to_yojson service_sync_config_to_yojson x.service_sync_config) ]

let create_service_sync_config_input_to_yojson (x : create_service_sync_config_input) =
  assoc_to_yojson
    [
      ("serviceName", Some (resource_name_to_yojson x.service_name));
      ("repositoryProvider", Some (repository_provider_to_yojson x.repository_provider));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("branch", Some (git_branch_name_to_yojson x.branch));
      ("filePath", Some (ops_file_path_to_yojson x.file_path));
    ]

let service_template_arn_to_yojson = string_to_yojson

let service_template_to_yojson (x : service_template) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("arn", Some (service_template_arn_to_yojson x.arn));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ( "lastModifiedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_modified_at) );
      ("displayName", option_to_yojson display_name_to_yojson x.display_name);
      ("description", option_to_yojson description_to_yojson x.description);
      ( "recommendedVersion",
        option_to_yojson full_template_version_number_to_yojson x.recommended_version );
      ("encryptionKey", option_to_yojson arn_to_yojson x.encryption_key);
      ("pipelineProvisioning", option_to_yojson provisioning_to_yojson x.pipeline_provisioning);
    ]

let create_service_template_output_to_yojson (x : create_service_template_output) =
  assoc_to_yojson [ ("serviceTemplate", Some (service_template_to_yojson x.service_template)) ]

let create_service_template_input_to_yojson (x : create_service_template_input) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("displayName", option_to_yojson display_name_to_yojson x.display_name);
      ("description", option_to_yojson description_to_yojson x.description);
      ("encryptionKey", option_to_yojson arn_to_yojson x.encryption_key);
      ("pipelineProvisioning", option_to_yojson provisioning_to_yojson x.pipeline_provisioning);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let service_template_supported_component_source_type_to_yojson
    (x : service_template_supported_component_source_type) =
  match x with DIRECTLY_DEFINED -> `String "DIRECTLY_DEFINED"

let service_template_supported_component_source_input_list_to_yojson tree =
  list_to_yojson service_template_supported_component_source_type_to_yojson tree

let service_template_version_arn_to_yojson = string_to_yojson

let service_template_version_to_yojson (x : service_template_version) =
  assoc_to_yojson
    [
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("majorVersion", Some (template_version_part_to_yojson x.major_version));
      ("minorVersion", Some (template_version_part_to_yojson x.minor_version));
      ( "recommendedMinorVersion",
        option_to_yojson template_version_part_to_yojson x.recommended_minor_version );
      ("status", Some (template_version_status_to_yojson x.status));
      ("statusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("description", option_to_yojson description_to_yojson x.description);
      ("arn", Some (service_template_version_arn_to_yojson x.arn));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ( "lastModifiedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_modified_at) );
      ( "compatibleEnvironmentTemplates",
        Some (compatible_environment_template_list_to_yojson x.compatible_environment_templates) );
      ("schema", option_to_yojson template_schema_to_yojson x.schema);
      ( "supportedComponentSources",
        option_to_yojson service_template_supported_component_source_input_list_to_yojson
          x.supported_component_sources );
    ]

let create_service_template_version_output_to_yojson (x : create_service_template_version_output) =
  assoc_to_yojson
    [
      ( "serviceTemplateVersion",
        Some (service_template_version_to_yojson x.service_template_version) );
    ]

let create_service_template_version_input_to_yojson (x : create_service_template_version_input) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("majorVersion", option_to_yojson template_version_part_to_yojson x.major_version);
      ("source", Some (template_version_source_input_to_yojson x.source));
      ( "compatibleEnvironmentTemplates",
        Some
          (compatible_environment_template_input_list_to_yojson x.compatible_environment_templates)
      );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "supportedComponentSources",
        option_to_yojson service_template_supported_component_source_input_list_to_yojson
          x.supported_component_sources );
    ]

let subdirectory_to_yojson = string_to_yojson

let template_sync_config_to_yojson (x : template_sync_config) =
  assoc_to_yojson
    [
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("templateType", Some (template_type_to_yojson x.template_type));
      ("repositoryProvider", Some (repository_provider_to_yojson x.repository_provider));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("branch", Some (git_branch_name_to_yojson x.branch));
      ("subdirectory", option_to_yojson subdirectory_to_yojson x.subdirectory);
    ]

let create_template_sync_config_output_to_yojson (x : create_template_sync_config_output) =
  assoc_to_yojson
    [
      ("templateSyncConfig", option_to_yojson template_sync_config_to_yojson x.template_sync_config);
    ]

let create_template_sync_config_input_to_yojson (x : create_template_sync_config_input) =
  assoc_to_yojson
    [
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("templateType", Some (template_type_to_yojson x.template_type));
      ("repositoryProvider", Some (repository_provider_to_yojson x.repository_provider));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("branch", Some (git_branch_name_to_yojson x.branch));
      ("subdirectory", option_to_yojson subdirectory_to_yojson x.subdirectory);
    ]

let delete_component_output_to_yojson (x : delete_component_output) =
  assoc_to_yojson [ ("component", option_to_yojson component_to_yojson x.component) ]

let delete_component_input_to_yojson (x : delete_component_input) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let service_pipeline_state_to_yojson (x : service_pipeline_state) =
  assoc_to_yojson
    [
      ("spec", option_to_yojson spec_contents_to_yojson x.spec);
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("templateMajorVersion", Some (template_version_part_to_yojson x.template_major_version));
      ("templateMinorVersion", Some (template_version_part_to_yojson x.template_minor_version));
    ]

let environment_state_to_yojson (x : environment_state) =
  assoc_to_yojson
    [
      ("spec", option_to_yojson spec_contents_to_yojson x.spec);
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("templateMajorVersion", Some (template_version_part_to_yojson x.template_major_version));
      ("templateMinorVersion", Some (template_version_part_to_yojson x.template_minor_version));
    ]

let service_instance_state_to_yojson (x : service_instance_state) =
  assoc_to_yojson
    [
      ("spec", Some (spec_contents_to_yojson x.spec));
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("templateMajorVersion", Some (template_version_part_to_yojson x.template_major_version));
      ("templateMinorVersion", Some (template_version_part_to_yojson x.template_minor_version));
      ( "lastSuccessfulComponentDeploymentIds",
        option_to_yojson component_deployment_id_list_to_yojson
          x.last_successful_component_deployment_ids );
      ( "lastSuccessfulEnvironmentDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_successful_environment_deployment_id );
      ( "lastSuccessfulServicePipelineDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_successful_service_pipeline_deployment_id );
    ]

let deployment_state_to_yojson (x : deployment_state) =
  match x with
  | ServiceInstance arg ->
      assoc_to_yojson [ ("serviceInstance", Some (service_instance_state_to_yojson arg)) ]
  | Environment arg -> assoc_to_yojson [ ("environment", Some (environment_state_to_yojson arg)) ]
  | ServicePipeline arg ->
      assoc_to_yojson [ ("servicePipeline", Some (service_pipeline_state_to_yojson arg)) ]
  | Component arg -> assoc_to_yojson [ ("component", Some (component_state_to_yojson arg)) ]

let deployment_target_resource_type_to_yojson (x : deployment_target_resource_type) =
  match x with
  | ENVIRONMENT -> `String "ENVIRONMENT"
  | SERVICE_PIPELINE -> `String "SERVICE_PIPELINE"
  | SERVICE_INSTANCE -> `String "SERVICE_INSTANCE"
  | COMPONENT -> `String "COMPONENT"

let deployment_arn_to_yojson = string_to_yojson

let deployment_to_yojson (x : deployment) =
  assoc_to_yojson
    [
      ("id", Some (deployment_id_to_yojson x.id));
      ("arn", Some (deployment_arn_to_yojson x.arn));
      ("targetArn", Some (arn_to_yojson x.target_arn));
      ( "targetResourceCreatedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.target_resource_created_at) );
      ("targetResourceType", Some (deployment_target_resource_type_to_yojson x.target_resource_type));
      ("environmentName", Some (resource_name_to_yojson x.environment_name));
      ("serviceName", option_to_yojson resource_name_to_yojson x.service_name);
      ("serviceInstanceName", option_to_yojson resource_name_to_yojson x.service_instance_name);
      ("componentName", option_to_yojson resource_name_to_yojson x.component_name);
      ("deploymentStatus", Some (deployment_status_to_yojson x.deployment_status));
      ( "deploymentStatusMessage",
        option_to_yojson status_message_to_yojson x.deployment_status_message );
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ( "lastModifiedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_modified_at) );
      ( "completedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.completed_at );
      ( "lastAttemptedDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_attempted_deployment_id );
      ( "lastSucceededDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_succeeded_deployment_id );
      ("initialState", option_to_yojson deployment_state_to_yojson x.initial_state);
      ("targetState", option_to_yojson deployment_state_to_yojson x.target_state);
    ]

let delete_deployment_output_to_yojson (x : delete_deployment_output) =
  assoc_to_yojson [ ("deployment", option_to_yojson deployment_to_yojson x.deployment) ]

let delete_deployment_input_to_yojson (x : delete_deployment_input) =
  assoc_to_yojson [ ("id", Some (deployment_id_to_yojson x.id)) ]

let delete_environment_output_to_yojson (x : delete_environment_output) =
  assoc_to_yojson [ ("environment", option_to_yojson environment_to_yojson x.environment) ]

let delete_environment_input_to_yojson (x : delete_environment_input) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let delete_environment_account_connection_output_to_yojson
    (x : delete_environment_account_connection_output) =
  assoc_to_yojson
    [
      ( "environmentAccountConnection",
        option_to_yojson environment_account_connection_to_yojson x.environment_account_connection
      );
    ]

let delete_environment_account_connection_input_to_yojson
    (x : delete_environment_account_connection_input) =
  assoc_to_yojson [ ("id", Some (environment_account_connection_id_to_yojson x.id)) ]

let delete_environment_template_output_to_yojson (x : delete_environment_template_output) =
  assoc_to_yojson
    [
      ("environmentTemplate", option_to_yojson environment_template_to_yojson x.environment_template);
    ]

let delete_environment_template_input_to_yojson (x : delete_environment_template_input) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let delete_environment_template_version_output_to_yojson
    (x : delete_environment_template_version_output) =
  assoc_to_yojson
    [
      ( "environmentTemplateVersion",
        option_to_yojson environment_template_version_to_yojson x.environment_template_version );
    ]

let delete_environment_template_version_input_to_yojson
    (x : delete_environment_template_version_input) =
  assoc_to_yojson
    [
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("majorVersion", Some (template_version_part_to_yojson x.major_version));
      ("minorVersion", Some (template_version_part_to_yojson x.minor_version));
    ]

let delete_repository_output_to_yojson (x : delete_repository_output) =
  assoc_to_yojson [ ("repository", option_to_yojson repository_to_yojson x.repository) ]

let delete_repository_input_to_yojson (x : delete_repository_input) =
  assoc_to_yojson
    [
      ("provider", Some (repository_provider_to_yojson x.provider));
      ("name", Some (repository_name_to_yojson x.name));
    ]

let delete_service_output_to_yojson (x : delete_service_output) =
  assoc_to_yojson [ ("service", option_to_yojson service_to_yojson x.service) ]

let delete_service_input_to_yojson (x : delete_service_input) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let delete_service_sync_config_output_to_yojson (x : delete_service_sync_config_output) =
  assoc_to_yojson
    [ ("serviceSyncConfig", option_to_yojson service_sync_config_to_yojson x.service_sync_config) ]

let delete_service_sync_config_input_to_yojson (x : delete_service_sync_config_input) =
  assoc_to_yojson [ ("serviceName", Some (resource_name_to_yojson x.service_name)) ]

let delete_service_template_output_to_yojson (x : delete_service_template_output) =
  assoc_to_yojson
    [ ("serviceTemplate", option_to_yojson service_template_to_yojson x.service_template) ]

let delete_service_template_input_to_yojson (x : delete_service_template_input) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let delete_service_template_version_output_to_yojson (x : delete_service_template_version_output) =
  assoc_to_yojson
    [
      ( "serviceTemplateVersion",
        option_to_yojson service_template_version_to_yojson x.service_template_version );
    ]

let delete_service_template_version_input_to_yojson (x : delete_service_template_version_input) =
  assoc_to_yojson
    [
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("majorVersion", Some (template_version_part_to_yojson x.major_version));
      ("minorVersion", Some (template_version_part_to_yojson x.minor_version));
    ]

let delete_template_sync_config_output_to_yojson (x : delete_template_sync_config_output) =
  assoc_to_yojson
    [
      ("templateSyncConfig", option_to_yojson template_sync_config_to_yojson x.template_sync_config);
    ]

let delete_template_sync_config_input_to_yojson (x : delete_template_sync_config_input) =
  assoc_to_yojson
    [
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("templateType", Some (template_type_to_yojson x.template_type));
    ]

let deployment_summary_to_yojson (x : deployment_summary) =
  assoc_to_yojson
    [
      ("id", Some (deployment_id_to_yojson x.id));
      ("arn", Some (deployment_arn_to_yojson x.arn));
      ("targetArn", Some (arn_to_yojson x.target_arn));
      ( "targetResourceCreatedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.target_resource_created_at) );
      ("targetResourceType", Some (deployment_target_resource_type_to_yojson x.target_resource_type));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ( "lastModifiedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_modified_at) );
      ( "completedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.completed_at );
      ("environmentName", Some (resource_name_to_yojson x.environment_name));
      ("serviceName", option_to_yojson resource_name_to_yojson x.service_name);
      ("serviceInstanceName", option_to_yojson resource_name_to_yojson x.service_instance_name);
      ("componentName", option_to_yojson resource_name_to_yojson x.component_name);
      ( "lastAttemptedDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_attempted_deployment_id );
      ( "lastSucceededDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_succeeded_deployment_id );
      ("deploymentStatus", Some (deployment_status_to_yojson x.deployment_status));
    ]

let deployment_summary_list_to_yojson tree = list_to_yojson deployment_summary_to_yojson tree

let deployment_update_type_to_yojson (x : deployment_update_type) =
  match x with
  | NONE -> `String "NONE"
  | CURRENT_VERSION -> `String "CURRENT_VERSION"
  | MINOR_VERSION -> `String "MINOR_VERSION"
  | MAJOR_VERSION -> `String "MAJOR_VERSION"

let environment_account_connection_requester_account_type_to_yojson
    (x : environment_account_connection_requester_account_type) =
  match x with
  | MANAGEMENT_ACCOUNT -> `String "MANAGEMENT_ACCOUNT"
  | ENVIRONMENT_ACCOUNT -> `String "ENVIRONMENT_ACCOUNT"

let environment_account_connection_status_list_to_yojson tree =
  list_to_yojson environment_account_connection_status_to_yojson tree

let environment_account_connection_summary_to_yojson (x : environment_account_connection_summary) =
  assoc_to_yojson
    [
      ("id", Some (environment_account_connection_id_to_yojson x.id));
      ("arn", Some (environment_account_connection_arn_to_yojson x.arn));
      ("managementAccountId", Some (aws_account_id_to_yojson x.management_account_id));
      ("environmentAccountId", Some (aws_account_id_to_yojson x.environment_account_id));
      ("roleArn", Some (arn_to_yojson x.role_arn));
      ("environmentName", Some (resource_name_to_yojson x.environment_name));
      ( "requestedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.requested_at)
      );
      ( "lastModifiedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_modified_at) );
      ("status", Some (environment_account_connection_status_to_yojson x.status));
      ("componentRoleArn", option_to_yojson arn_to_yojson x.component_role_arn);
    ]

let environment_account_connection_summary_list_to_yojson tree =
  list_to_yojson environment_account_connection_summary_to_yojson tree

let environment_summary_to_yojson (x : environment_summary) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ( "lastDeploymentAttemptedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_deployment_attempted_at) );
      ( "lastDeploymentSucceededAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_deployment_succeeded_at) );
      ("arn", Some (environment_arn_to_yojson x.arn));
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("templateMajorVersion", Some (template_version_part_to_yojson x.template_major_version));
      ("templateMinorVersion", Some (template_version_part_to_yojson x.template_minor_version));
      ("deploymentStatus", Some (deployment_status_to_yojson x.deployment_status));
      ( "deploymentStatusMessage",
        option_to_yojson status_message_to_yojson x.deployment_status_message );
      ("protonServiceRoleArn", option_to_yojson arn_to_yojson x.proton_service_role_arn);
      ( "environmentAccountConnectionId",
        option_to_yojson environment_account_connection_id_to_yojson
          x.environment_account_connection_id );
      ("environmentAccountId", option_to_yojson aws_account_id_to_yojson x.environment_account_id);
      ("provisioning", option_to_yojson provisioning_to_yojson x.provisioning);
      ("componentRoleArn", option_to_yojson arn_to_yojson x.component_role_arn);
      ( "lastAttemptedDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_attempted_deployment_id );
      ( "lastSucceededDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_succeeded_deployment_id );
    ]

let environment_summary_list_to_yojson tree = list_to_yojson environment_summary_to_yojson tree

let environment_template_filter_to_yojson (x : environment_template_filter) =
  assoc_to_yojson
    [
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("majorVersion", Some (template_version_part_to_yojson x.major_version));
    ]

let environment_template_filter_list_to_yojson tree =
  list_to_yojson environment_template_filter_to_yojson tree

let environment_template_summary_to_yojson (x : environment_template_summary) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("arn", Some (environment_template_arn_to_yojson x.arn));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ( "lastModifiedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_modified_at) );
      ("displayName", option_to_yojson display_name_to_yojson x.display_name);
      ("description", option_to_yojson description_to_yojson x.description);
      ( "recommendedVersion",
        option_to_yojson full_template_version_number_to_yojson x.recommended_version );
      ("provisioning", option_to_yojson provisioning_to_yojson x.provisioning);
    ]

let environment_template_summary_list_to_yojson tree =
  list_to_yojson environment_template_summary_to_yojson tree

let environment_template_version_summary_to_yojson (x : environment_template_version_summary) =
  assoc_to_yojson
    [
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("majorVersion", Some (template_version_part_to_yojson x.major_version));
      ("minorVersion", Some (template_version_part_to_yojson x.minor_version));
      ( "recommendedMinorVersion",
        option_to_yojson template_version_part_to_yojson x.recommended_minor_version );
      ("status", Some (template_version_status_to_yojson x.status));
      ("statusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("description", option_to_yojson description_to_yojson x.description);
      ("arn", Some (environment_template_version_arn_to_yojson x.arn));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ( "lastModifiedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_modified_at) );
    ]

let environment_template_version_summary_list_to_yojson tree =
  list_to_yojson environment_template_version_summary_to_yojson tree

let get_account_settings_output_to_yojson (x : get_account_settings_output) =
  assoc_to_yojson
    [ ("accountSettings", option_to_yojson account_settings_to_yojson x.account_settings) ]

let get_account_settings_input_to_yojson = unit_to_yojson

let get_component_output_to_yojson (x : get_component_output) =
  assoc_to_yojson [ ("component", option_to_yojson component_to_yojson x.component) ]

let get_component_input_to_yojson (x : get_component_input) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let get_deployment_output_to_yojson (x : get_deployment_output) =
  assoc_to_yojson [ ("deployment", option_to_yojson deployment_to_yojson x.deployment) ]

let get_deployment_input_to_yojson (x : get_deployment_input) =
  assoc_to_yojson
    [
      ("id", Some (deployment_id_to_yojson x.id));
      ("environmentName", option_to_yojson resource_name_to_yojson x.environment_name);
      ("serviceName", option_to_yojson resource_name_to_yojson x.service_name);
      ("serviceInstanceName", option_to_yojson resource_name_to_yojson x.service_instance_name);
      ("componentName", option_to_yojson resource_name_to_yojson x.component_name);
    ]

let get_environment_output_to_yojson (x : get_environment_output) =
  assoc_to_yojson [ ("environment", Some (environment_to_yojson x.environment)) ]

let get_environment_input_to_yojson (x : get_environment_input) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let get_environment_account_connection_output_to_yojson
    (x : get_environment_account_connection_output) =
  assoc_to_yojson
    [
      ( "environmentAccountConnection",
        Some (environment_account_connection_to_yojson x.environment_account_connection) );
    ]

let get_environment_account_connection_input_to_yojson
    (x : get_environment_account_connection_input) =
  assoc_to_yojson [ ("id", Some (environment_account_connection_id_to_yojson x.id)) ]

let get_environment_template_output_to_yojson (x : get_environment_template_output) =
  assoc_to_yojson
    [ ("environmentTemplate", Some (environment_template_to_yojson x.environment_template)) ]

let get_environment_template_input_to_yojson (x : get_environment_template_input) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let get_environment_template_version_output_to_yojson (x : get_environment_template_version_output)
    =
  assoc_to_yojson
    [
      ( "environmentTemplateVersion",
        Some (environment_template_version_to_yojson x.environment_template_version) );
    ]

let get_environment_template_version_input_to_yojson (x : get_environment_template_version_input) =
  assoc_to_yojson
    [
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("majorVersion", Some (template_version_part_to_yojson x.major_version));
      ("minorVersion", Some (template_version_part_to_yojson x.minor_version));
    ]

let get_repository_output_to_yojson (x : get_repository_output) =
  assoc_to_yojson [ ("repository", Some (repository_to_yojson x.repository)) ]

let get_repository_input_to_yojson (x : get_repository_input) =
  assoc_to_yojson
    [
      ("provider", Some (repository_provider_to_yojson x.provider));
      ("name", Some (repository_name_to_yojson x.name));
    ]

let get_service_output_to_yojson (x : get_service_output) =
  assoc_to_yojson [ ("service", option_to_yojson service_to_yojson x.service) ]

let get_service_input_to_yojson (x : get_service_input) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let get_service_instance_output_to_yojson (x : get_service_instance_output) =
  assoc_to_yojson [ ("serviceInstance", Some (service_instance_to_yojson x.service_instance)) ]

let get_service_instance_input_to_yojson (x : get_service_instance_input) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("serviceName", Some (resource_name_to_yojson x.service_name));
    ]

let sync_blocker_context_to_yojson (x : sync_blocker_context) =
  assoc_to_yojson
    [
      ("key", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key));
      ("value", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value));
    ]

let sync_blocker_contexts_to_yojson tree = list_to_yojson sync_blocker_context_to_yojson tree

let sync_blocker_to_yojson (x : sync_blocker) =
  assoc_to_yojson
    [
      ("id", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id));
      ("type", Some (blocker_type_to_yojson x.type_));
      ("status", Some (blocker_status_to_yojson x.status));
      ( "createdReason",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.created_reason) );
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ("contexts", option_to_yojson sync_blocker_contexts_to_yojson x.contexts);
      ( "resolvedReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resolved_reason
      );
      ( "resolvedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.resolved_at );
    ]

let latest_sync_blockers_to_yojson tree = list_to_yojson sync_blocker_to_yojson tree

let service_sync_blocker_summary_to_yojson (x : service_sync_blocker_summary) =
  assoc_to_yojson
    [
      ("serviceName", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_name));
      ( "serviceInstanceName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.service_instance_name );
      ("latestBlockers", option_to_yojson latest_sync_blockers_to_yojson x.latest_blockers);
    ]

let get_service_sync_blocker_summary_output_to_yojson (x : get_service_sync_blocker_summary_output)
    =
  assoc_to_yojson
    [
      ( "serviceSyncBlockerSummary",
        option_to_yojson service_sync_blocker_summary_to_yojson x.service_sync_blocker_summary );
    ]

let get_service_sync_blocker_summary_input_to_yojson (x : get_service_sync_blocker_summary_input) =
  assoc_to_yojson
    [
      ("serviceName", Some (resource_name_to_yojson x.service_name));
      ("serviceInstanceName", option_to_yojson resource_name_to_yojson x.service_instance_name);
    ]

let get_service_sync_config_output_to_yojson (x : get_service_sync_config_output) =
  assoc_to_yojson
    [ ("serviceSyncConfig", option_to_yojson service_sync_config_to_yojson x.service_sync_config) ]

let get_service_sync_config_input_to_yojson (x : get_service_sync_config_input) =
  assoc_to_yojson [ ("serviceName", Some (resource_name_to_yojson x.service_name)) ]

let get_service_template_output_to_yojson (x : get_service_template_output) =
  assoc_to_yojson [ ("serviceTemplate", Some (service_template_to_yojson x.service_template)) ]

let get_service_template_input_to_yojson (x : get_service_template_input) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let get_service_template_version_output_to_yojson (x : get_service_template_version_output) =
  assoc_to_yojson
    [
      ( "serviceTemplateVersion",
        Some (service_template_version_to_yojson x.service_template_version) );
    ]

let get_service_template_version_input_to_yojson (x : get_service_template_version_input) =
  assoc_to_yojson
    [
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("majorVersion", Some (template_version_part_to_yojson x.major_version));
      ("minorVersion", Some (template_version_part_to_yojson x.minor_version));
    ]

let get_template_sync_config_output_to_yojson (x : get_template_sync_config_output) =
  assoc_to_yojson
    [
      ("templateSyncConfig", option_to_yojson template_sync_config_to_yojson x.template_sync_config);
    ]

let get_template_sync_config_input_to_yojson (x : get_template_sync_config_input) =
  assoc_to_yojson
    [
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("templateType", Some (template_type_to_yojson x.template_type));
    ]

let list_component_outputs_output_to_yojson (x : list_component_outputs_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson empty_next_token_to_yojson x.next_token);
      ("outputs", Some (outputs_list_to_yojson x.outputs));
    ]

let list_component_outputs_input_to_yojson (x : list_component_outputs_input) =
  assoc_to_yojson
    [
      ("componentName", Some (resource_name_to_yojson x.component_name));
      ("nextToken", option_to_yojson empty_next_token_to_yojson x.next_token);
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
    ]

let provisioned_resource_engine_to_yojson (x : provisioned_resource_engine) =
  match x with CLOUDFORMATION -> `String "CLOUDFORMATION" | TERRAFORM -> `String "TERRAFORM"

let provisioned_resource_identifier_to_yojson = string_to_yojson
let provisioned_resource_name_to_yojson = string_to_yojson

let provisioned_resource_to_yojson (x : provisioned_resource) =
  assoc_to_yojson
    [
      ("name", option_to_yojson provisioned_resource_name_to_yojson x.name);
      ("identifier", option_to_yojson provisioned_resource_identifier_to_yojson x.identifier);
      ( "provisioningEngine",
        option_to_yojson provisioned_resource_engine_to_yojson x.provisioning_engine );
    ]

let provisioned_resource_list_to_yojson tree = list_to_yojson provisioned_resource_to_yojson tree

let list_component_provisioned_resources_output_to_yojson
    (x : list_component_provisioned_resources_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson empty_next_token_to_yojson x.next_token);
      ("provisionedResources", Some (provisioned_resource_list_to_yojson x.provisioned_resources));
    ]

let list_component_provisioned_resources_input_to_yojson
    (x : list_component_provisioned_resources_input) =
  assoc_to_yojson
    [
      ("componentName", Some (resource_name_to_yojson x.component_name));
      ("nextToken", option_to_yojson empty_next_token_to_yojson x.next_token);
    ]

let next_token_to_yojson = string_to_yojson

let list_components_output_to_yojson (x : list_components_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("components", Some (component_summary_list_to_yojson x.components));
    ]

let list_components_input_to_yojson (x : list_components_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("environmentName", option_to_yojson resource_name_to_yojson x.environment_name);
      ("serviceName", option_to_yojson resource_name_to_yojson x.service_name);
      ("serviceInstanceName", option_to_yojson resource_name_to_yojson x.service_instance_name);
      ("maxResults", option_to_yojson max_page_results_to_yojson x.max_results);
    ]

let list_deployments_output_to_yojson (x : list_deployments_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("deployments", Some (deployment_summary_list_to_yojson x.deployments));
    ]

let list_deployments_input_to_yojson (x : list_deployments_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("environmentName", option_to_yojson resource_name_to_yojson x.environment_name);
      ("serviceName", option_to_yojson resource_name_to_yojson x.service_name);
      ("serviceInstanceName", option_to_yojson resource_name_to_yojson x.service_instance_name);
      ("componentName", option_to_yojson resource_name_to_yojson x.component_name);
      ("maxResults", option_to_yojson max_page_results_to_yojson x.max_results);
    ]

let list_environment_account_connections_output_to_yojson
    (x : list_environment_account_connections_output) =
  assoc_to_yojson
    [
      ( "environmentAccountConnections",
        Some
          (environment_account_connection_summary_list_to_yojson x.environment_account_connections)
      );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_environment_account_connections_input_to_yojson
    (x : list_environment_account_connections_input) =
  assoc_to_yojson
    [
      ( "requestedBy",
        Some (environment_account_connection_requester_account_type_to_yojson x.requested_by) );
      ("environmentName", option_to_yojson resource_name_to_yojson x.environment_name);
      ("statuses", option_to_yojson environment_account_connection_status_list_to_yojson x.statuses);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_page_results_to_yojson x.max_results);
    ]

let list_environment_outputs_output_to_yojson (x : list_environment_outputs_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson empty_next_token_to_yojson x.next_token);
      ("outputs", Some (outputs_list_to_yojson x.outputs));
    ]

let list_environment_outputs_input_to_yojson (x : list_environment_outputs_input) =
  assoc_to_yojson
    [
      ("environmentName", Some (resource_name_to_yojson x.environment_name));
      ("nextToken", option_to_yojson empty_next_token_to_yojson x.next_token);
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
    ]

let list_environment_provisioned_resources_output_to_yojson
    (x : list_environment_provisioned_resources_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson empty_next_token_to_yojson x.next_token);
      ("provisionedResources", Some (provisioned_resource_list_to_yojson x.provisioned_resources));
    ]

let list_environment_provisioned_resources_input_to_yojson
    (x : list_environment_provisioned_resources_input) =
  assoc_to_yojson
    [
      ("environmentName", Some (resource_name_to_yojson x.environment_name));
      ("nextToken", option_to_yojson empty_next_token_to_yojson x.next_token);
    ]

let list_environment_template_versions_output_to_yojson
    (x : list_environment_template_versions_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "templateVersions",
        Some (environment_template_version_summary_list_to_yojson x.template_versions) );
    ]

let list_environment_template_versions_input_to_yojson
    (x : list_environment_template_versions_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_page_results_to_yojson x.max_results);
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("majorVersion", option_to_yojson template_version_part_to_yojson x.major_version);
    ]

let list_environment_templates_output_to_yojson (x : list_environment_templates_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("templates", Some (environment_template_summary_list_to_yojson x.templates));
    ]

let list_environment_templates_input_to_yojson (x : list_environment_templates_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_page_results_to_yojson x.max_results);
    ]

let list_environments_output_to_yojson (x : list_environments_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("environments", Some (environment_summary_list_to_yojson x.environments));
    ]

let list_environments_input_to_yojson (x : list_environments_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_page_results_to_yojson x.max_results);
      ( "environmentTemplates",
        option_to_yojson environment_template_filter_list_to_yojson x.environment_templates );
    ]

let repository_summary_to_yojson (x : repository_summary) =
  assoc_to_yojson
    [
      ("arn", Some (repository_arn_to_yojson x.arn));
      ("provider", Some (repository_provider_to_yojson x.provider));
      ("name", Some (repository_name_to_yojson x.name));
      ("connectionArn", Some (arn_to_yojson x.connection_arn));
    ]

let repository_summary_list_to_yojson tree = list_to_yojson repository_summary_to_yojson tree

let list_repositories_output_to_yojson (x : list_repositories_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("repositories", Some (repository_summary_list_to_yojson x.repositories));
    ]

let list_repositories_input_to_yojson (x : list_repositories_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_page_results_to_yojson x.max_results);
    ]

let list_service_instance_outputs_output_to_yojson (x : list_service_instance_outputs_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson empty_next_token_to_yojson x.next_token);
      ("outputs", Some (outputs_list_to_yojson x.outputs));
    ]

let list_service_instance_outputs_input_to_yojson (x : list_service_instance_outputs_input) =
  assoc_to_yojson
    [
      ("serviceInstanceName", Some (resource_name_to_yojson x.service_instance_name));
      ("serviceName", Some (resource_name_to_yojson x.service_name));
      ("nextToken", option_to_yojson empty_next_token_to_yojson x.next_token);
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
    ]

let list_service_instance_provisioned_resources_output_to_yojson
    (x : list_service_instance_provisioned_resources_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson empty_next_token_to_yojson x.next_token);
      ("provisionedResources", Some (provisioned_resource_list_to_yojson x.provisioned_resources));
    ]

let list_service_instance_provisioned_resources_input_to_yojson
    (x : list_service_instance_provisioned_resources_input) =
  assoc_to_yojson
    [
      ("serviceName", Some (resource_name_to_yojson x.service_name));
      ("serviceInstanceName", Some (resource_name_to_yojson x.service_instance_name));
      ("nextToken", option_to_yojson empty_next_token_to_yojson x.next_token);
    ]

let service_instance_summary_to_yojson (x : service_instance_summary) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("arn", Some (service_instance_arn_to_yojson x.arn));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ( "lastDeploymentAttemptedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_deployment_attempted_at) );
      ( "lastDeploymentSucceededAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_deployment_succeeded_at) );
      ("serviceName", Some (resource_name_to_yojson x.service_name));
      ("environmentName", Some (resource_name_to_yojson x.environment_name));
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("templateMajorVersion", Some (template_version_part_to_yojson x.template_major_version));
      ("templateMinorVersion", Some (template_version_part_to_yojson x.template_minor_version));
      ("deploymentStatus", Some (deployment_status_to_yojson x.deployment_status));
      ( "deploymentStatusMessage",
        option_to_yojson status_message_to_yojson x.deployment_status_message );
      ( "lastAttemptedDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_attempted_deployment_id );
      ( "lastSucceededDeploymentId",
        option_to_yojson deployment_id_to_yojson x.last_succeeded_deployment_id );
    ]

let service_instance_summary_list_to_yojson tree =
  list_to_yojson service_instance_summary_to_yojson tree

let list_service_instances_output_to_yojson (x : list_service_instances_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("serviceInstances", Some (service_instance_summary_list_to_yojson x.service_instances));
    ]

let sort_order_to_yojson (x : sort_order) =
  match x with ASCENDING -> `String "ASCENDING" | DESCENDING -> `String "DESCENDING"

let list_service_instances_sort_by_to_yojson (x : list_service_instances_sort_by) =
  match x with
  | NAME -> `String "name"
  | DEPLOYMENT_STATUS -> `String "deploymentStatus"
  | TEMPLATE_NAME -> `String "templateName"
  | SERVICE_NAME -> `String "serviceName"
  | ENVIRONMENT_NAME -> `String "environmentName"
  | LAST_DEPLOYMENT_ATTEMPTED_AT -> `String "lastDeploymentAttemptedAt"
  | CREATED_AT -> `String "createdAt"

let list_service_instances_filter_value_to_yojson = string_to_yojson

let list_service_instances_filter_by_to_yojson (x : list_service_instances_filter_by) =
  match x with
  | NAME -> `String "name"
  | DEPLOYMENT_STATUS -> `String "deploymentStatus"
  | TEMPLATE_NAME -> `String "templateName"
  | SERVICE_NAME -> `String "serviceName"
  | DEPLOYED_TEMPLATE_VERSION_STATUS -> `String "deployedTemplateVersionStatus"
  | ENVIRONMENT_NAME -> `String "environmentName"
  | LAST_DEPLOYMENT_ATTEMPTED_AT_BEFORE -> `String "lastDeploymentAttemptedAtBefore"
  | LAST_DEPLOYMENT_ATTEMPTED_AT_AFTER -> `String "lastDeploymentAttemptedAtAfter"
  | CREATED_AT_BEFORE -> `String "createdAtBefore"
  | CREATED_AT_AFTER -> `String "createdAtAfter"

let list_service_instances_filter_to_yojson (x : list_service_instances_filter) =
  assoc_to_yojson
    [
      ("key", option_to_yojson list_service_instances_filter_by_to_yojson x.key);
      ("value", option_to_yojson list_service_instances_filter_value_to_yojson x.value);
    ]

let list_service_instances_filter_list_to_yojson tree =
  list_to_yojson list_service_instances_filter_to_yojson tree

let list_service_instances_input_to_yojson (x : list_service_instances_input) =
  assoc_to_yojson
    [
      ("serviceName", option_to_yojson resource_name_to_yojson x.service_name);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_page_results_to_yojson x.max_results);
      ("filters", option_to_yojson list_service_instances_filter_list_to_yojson x.filters);
      ("sortBy", option_to_yojson list_service_instances_sort_by_to_yojson x.sort_by);
      ("sortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let list_service_pipeline_outputs_output_to_yojson (x : list_service_pipeline_outputs_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson empty_next_token_to_yojson x.next_token);
      ("outputs", Some (outputs_list_to_yojson x.outputs));
    ]

let list_service_pipeline_outputs_input_to_yojson (x : list_service_pipeline_outputs_input) =
  assoc_to_yojson
    [
      ("serviceName", Some (resource_name_to_yojson x.service_name));
      ("nextToken", option_to_yojson empty_next_token_to_yojson x.next_token);
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
    ]

let list_service_pipeline_provisioned_resources_output_to_yojson
    (x : list_service_pipeline_provisioned_resources_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson empty_next_token_to_yojson x.next_token);
      ("provisionedResources", Some (provisioned_resource_list_to_yojson x.provisioned_resources));
    ]

let list_service_pipeline_provisioned_resources_input_to_yojson
    (x : list_service_pipeline_provisioned_resources_input) =
  assoc_to_yojson
    [
      ("serviceName", Some (resource_name_to_yojson x.service_name));
      ("nextToken", option_to_yojson empty_next_token_to_yojson x.next_token);
    ]

let service_template_version_summary_to_yojson (x : service_template_version_summary) =
  assoc_to_yojson
    [
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("majorVersion", Some (template_version_part_to_yojson x.major_version));
      ("minorVersion", Some (template_version_part_to_yojson x.minor_version));
      ( "recommendedMinorVersion",
        option_to_yojson template_version_part_to_yojson x.recommended_minor_version );
      ("status", Some (template_version_status_to_yojson x.status));
      ("statusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("description", option_to_yojson description_to_yojson x.description);
      ("arn", Some (service_template_version_arn_to_yojson x.arn));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ( "lastModifiedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_modified_at) );
    ]

let service_template_version_summary_list_to_yojson tree =
  list_to_yojson service_template_version_summary_to_yojson tree

let list_service_template_versions_output_to_yojson (x : list_service_template_versions_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "templateVersions",
        Some (service_template_version_summary_list_to_yojson x.template_versions) );
    ]

let list_service_template_versions_input_to_yojson (x : list_service_template_versions_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_page_results_to_yojson x.max_results);
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("majorVersion", option_to_yojson template_version_part_to_yojson x.major_version);
    ]

let service_template_summary_to_yojson (x : service_template_summary) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("arn", Some (service_template_arn_to_yojson x.arn));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ( "lastModifiedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_modified_at) );
      ("displayName", option_to_yojson display_name_to_yojson x.display_name);
      ("description", option_to_yojson description_to_yojson x.description);
      ( "recommendedVersion",
        option_to_yojson full_template_version_number_to_yojson x.recommended_version );
      ("pipelineProvisioning", option_to_yojson provisioning_to_yojson x.pipeline_provisioning);
    ]

let service_template_summary_list_to_yojson tree =
  list_to_yojson service_template_summary_to_yojson tree

let list_service_templates_output_to_yojson (x : list_service_templates_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("templates", Some (service_template_summary_list_to_yojson x.templates));
    ]

let list_service_templates_input_to_yojson (x : list_service_templates_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_page_results_to_yojson x.max_results);
    ]

let service_summary_to_yojson (x : service_summary) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("arn", Some (service_arn_to_yojson x.arn));
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.created_at)
      );
      ( "lastModifiedAt",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_modified_at) );
      ("status", Some (service_status_to_yojson x.status));
      ("statusMessage", option_to_yojson status_message_to_yojson x.status_message);
    ]

let service_summary_list_to_yojson tree = list_to_yojson service_summary_to_yojson tree

let list_services_output_to_yojson (x : list_services_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("services", Some (service_summary_list_to_yojson x.services));
    ]

let list_services_input_to_yojson (x : list_services_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_page_results_to_yojson x.max_results);
    ]

let reject_environment_account_connection_output_to_yojson
    (x : reject_environment_account_connection_output) =
  assoc_to_yojson
    [
      ( "environmentAccountConnection",
        Some (environment_account_connection_to_yojson x.environment_account_connection) );
    ]

let reject_environment_account_connection_input_to_yojson
    (x : reject_environment_account_connection_input) =
  assoc_to_yojson [ ("id", Some (environment_account_connection_id_to_yojson x.id)) ]

let update_account_settings_output_to_yojson (x : update_account_settings_output) =
  assoc_to_yojson [ ("accountSettings", Some (account_settings_to_yojson x.account_settings)) ]

let update_account_settings_input_to_yojson (x : update_account_settings_input) =
  assoc_to_yojson
    [
      ( "pipelineServiceRoleArn",
        option_to_yojson role_arn_or_empty_string_to_yojson x.pipeline_service_role_arn );
      ( "pipelineProvisioningRepository",
        option_to_yojson repository_branch_input_to_yojson x.pipeline_provisioning_repository );
      ( "deletePipelineProvisioningRepository",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.delete_pipeline_provisioning_repository );
      ( "pipelineCodebuildRoleArn",
        option_to_yojson role_arn_or_empty_string_to_yojson x.pipeline_codebuild_role_arn );
    ]

let update_component_output_to_yojson (x : update_component_output) =
  assoc_to_yojson [ ("component", Some (component_to_yojson x.component)) ]

let update_component_input_to_yojson (x : update_component_input) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("deploymentType", Some (component_deployment_update_type_to_yojson x.deployment_type));
      ("description", option_to_yojson description_to_yojson x.description);
      ("serviceName", option_to_yojson resource_name_or_empty_to_yojson x.service_name);
      ( "serviceInstanceName",
        option_to_yojson resource_name_or_empty_to_yojson x.service_instance_name );
      ("serviceSpec", option_to_yojson spec_contents_to_yojson x.service_spec);
      ("templateFile", option_to_yojson template_file_contents_to_yojson x.template_file);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let update_environment_output_to_yojson (x : update_environment_output) =
  assoc_to_yojson [ ("environment", Some (environment_to_yojson x.environment)) ]

let update_environment_input_to_yojson (x : update_environment_input) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("spec", option_to_yojson spec_contents_to_yojson x.spec);
      ( "templateMajorVersion",
        option_to_yojson template_version_part_to_yojson x.template_major_version );
      ( "templateMinorVersion",
        option_to_yojson template_version_part_to_yojson x.template_minor_version );
      ("protonServiceRoleArn", option_to_yojson arn_to_yojson x.proton_service_role_arn);
      ("deploymentType", Some (deployment_update_type_to_yojson x.deployment_type));
      ( "environmentAccountConnectionId",
        option_to_yojson environment_account_connection_id_to_yojson
          x.environment_account_connection_id );
      ( "provisioningRepository",
        option_to_yojson repository_branch_input_to_yojson x.provisioning_repository );
      ("componentRoleArn", option_to_yojson role_arn_to_yojson x.component_role_arn);
      ("codebuildRoleArn", option_to_yojson role_arn_to_yojson x.codebuild_role_arn);
    ]

let update_environment_account_connection_output_to_yojson
    (x : update_environment_account_connection_output) =
  assoc_to_yojson
    [
      ( "environmentAccountConnection",
        Some (environment_account_connection_to_yojson x.environment_account_connection) );
    ]

let update_environment_account_connection_input_to_yojson
    (x : update_environment_account_connection_input) =
  assoc_to_yojson
    [
      ("id", Some (environment_account_connection_id_to_yojson x.id));
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("componentRoleArn", option_to_yojson role_arn_to_yojson x.component_role_arn);
      ("codebuildRoleArn", option_to_yojson role_arn_to_yojson x.codebuild_role_arn);
    ]

let update_environment_template_output_to_yojson (x : update_environment_template_output) =
  assoc_to_yojson
    [ ("environmentTemplate", Some (environment_template_to_yojson x.environment_template)) ]

let update_environment_template_input_to_yojson (x : update_environment_template_input) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("displayName", option_to_yojson display_name_to_yojson x.display_name);
      ("description", option_to_yojson description_to_yojson x.description);
    ]

let update_environment_template_version_output_to_yojson
    (x : update_environment_template_version_output) =
  assoc_to_yojson
    [
      ( "environmentTemplateVersion",
        Some (environment_template_version_to_yojson x.environment_template_version) );
    ]

let update_environment_template_version_input_to_yojson
    (x : update_environment_template_version_input) =
  assoc_to_yojson
    [
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("majorVersion", Some (template_version_part_to_yojson x.major_version));
      ("minorVersion", Some (template_version_part_to_yojson x.minor_version));
      ("description", option_to_yojson description_to_yojson x.description);
      ("status", option_to_yojson template_version_status_to_yojson x.status);
    ]

let update_service_output_to_yojson (x : update_service_output) =
  assoc_to_yojson [ ("service", Some (service_to_yojson x.service)) ]

let update_service_input_to_yojson (x : update_service_input) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("spec", option_to_yojson spec_contents_to_yojson x.spec);
    ]

let update_service_instance_output_to_yojson (x : update_service_instance_output) =
  assoc_to_yojson [ ("serviceInstance", Some (service_instance_to_yojson x.service_instance)) ]

let update_service_instance_input_to_yojson (x : update_service_instance_input) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("serviceName", Some (resource_name_to_yojson x.service_name));
      ("deploymentType", Some (deployment_update_type_to_yojson x.deployment_type));
      ("spec", option_to_yojson spec_contents_to_yojson x.spec);
      ( "templateMajorVersion",
        option_to_yojson template_version_part_to_yojson x.template_major_version );
      ( "templateMinorVersion",
        option_to_yojson template_version_part_to_yojson x.template_minor_version );
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let update_service_pipeline_output_to_yojson (x : update_service_pipeline_output) =
  assoc_to_yojson [ ("pipeline", Some (service_pipeline_to_yojson x.pipeline)) ]

let update_service_pipeline_input_to_yojson (x : update_service_pipeline_input) =
  assoc_to_yojson
    [
      ("serviceName", Some (resource_name_to_yojson x.service_name));
      ("spec", Some (spec_contents_to_yojson x.spec));
      ("deploymentType", Some (deployment_update_type_to_yojson x.deployment_type));
      ( "templateMajorVersion",
        option_to_yojson template_version_part_to_yojson x.template_major_version );
      ( "templateMinorVersion",
        option_to_yojson template_version_part_to_yojson x.template_minor_version );
    ]

let update_service_sync_blocker_output_to_yojson (x : update_service_sync_blocker_output) =
  assoc_to_yojson
    [
      ("serviceName", Some (resource_name_to_yojson x.service_name));
      ("serviceInstanceName", option_to_yojson resource_name_to_yojson x.service_instance_name);
      ("serviceSyncBlocker", Some (sync_blocker_to_yojson x.service_sync_blocker));
    ]

let update_service_sync_blocker_input_to_yojson (x : update_service_sync_blocker_input) =
  assoc_to_yojson
    [
      ("id", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id));
      ( "resolvedReason",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resolved_reason) );
    ]

let update_service_sync_config_output_to_yojson (x : update_service_sync_config_output) =
  assoc_to_yojson
    [ ("serviceSyncConfig", option_to_yojson service_sync_config_to_yojson x.service_sync_config) ]

let update_service_sync_config_input_to_yojson (x : update_service_sync_config_input) =
  assoc_to_yojson
    [
      ("serviceName", Some (resource_name_to_yojson x.service_name));
      ("repositoryProvider", Some (repository_provider_to_yojson x.repository_provider));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("branch", Some (git_branch_name_to_yojson x.branch));
      ("filePath", Some (ops_file_path_to_yojson x.file_path));
    ]

let update_service_template_output_to_yojson (x : update_service_template_output) =
  assoc_to_yojson [ ("serviceTemplate", Some (service_template_to_yojson x.service_template)) ]

let update_service_template_input_to_yojson (x : update_service_template_input) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("displayName", option_to_yojson display_name_to_yojson x.display_name);
      ("description", option_to_yojson description_to_yojson x.description);
    ]

let update_service_template_version_output_to_yojson (x : update_service_template_version_output) =
  assoc_to_yojson
    [
      ( "serviceTemplateVersion",
        Some (service_template_version_to_yojson x.service_template_version) );
    ]

let update_service_template_version_input_to_yojson (x : update_service_template_version_input) =
  assoc_to_yojson
    [
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("majorVersion", Some (template_version_part_to_yojson x.major_version));
      ("minorVersion", Some (template_version_part_to_yojson x.minor_version));
      ("description", option_to_yojson description_to_yojson x.description);
      ("status", option_to_yojson template_version_status_to_yojson x.status);
      ( "compatibleEnvironmentTemplates",
        option_to_yojson compatible_environment_template_input_list_to_yojson
          x.compatible_environment_templates );
      ( "supportedComponentSources",
        option_to_yojson service_template_supported_component_source_input_list_to_yojson
          x.supported_component_sources );
    ]

let update_template_sync_config_output_to_yojson (x : update_template_sync_config_output) =
  assoc_to_yojson
    [
      ("templateSyncConfig", option_to_yojson template_sync_config_to_yojson x.template_sync_config);
    ]

let update_template_sync_config_input_to_yojson (x : update_template_sync_config_input) =
  assoc_to_yojson
    [
      ("templateName", Some (resource_name_to_yojson x.template_name));
      ("templateType", Some (template_type_to_yojson x.template_type));
      ("repositoryProvider", Some (repository_provider_to_yojson x.repository_provider));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("branch", Some (git_branch_name_to_yojson x.branch));
      ("subdirectory", option_to_yojson subdirectory_to_yojson x.subdirectory);
    ]
