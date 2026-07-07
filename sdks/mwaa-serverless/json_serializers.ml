open Smaws_Lib.Json.SerializeHelpers
open Types

let workflow_version_to_yojson = string_to_yojson
let workflow_arn_to_yojson = string_to_yojson
let is_latest_version_to_yojson = bool_to_yojson
let timestamp_value_to_yojson = timestamp_iso_8601_to_yojson

let definition_s3_location_to_yojson (x : definition_s3_location) =
  assoc_to_yojson
    [
      ( "VersionId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version_id );
      ("ObjectKey", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.object_key));
      ("Bucket", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.bucket));
    ]

let schedule_configuration_to_yojson (x : schedule_configuration) =
  assoc_to_yojson
    [
      ( "CronExpression",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cron_expression
      );
    ]

let generic_string_to_yojson = string_to_yojson

let workflow_version_summary_to_yojson (x : workflow_version_summary) =
  assoc_to_yojson
    [
      ("TriggerMode", option_to_yojson generic_string_to_yojson x.trigger_mode);
      ( "ScheduleConfiguration",
        option_to_yojson schedule_configuration_to_yojson x.schedule_configuration );
      ( "DefinitionS3Location",
        option_to_yojson definition_s3_location_to_yojson x.definition_s3_location );
      ("ModifiedAt", option_to_yojson timestamp_value_to_yojson x.modified_at);
      ("CreatedAt", option_to_yojson timestamp_value_to_yojson x.created_at);
      ("IsLatestVersion", option_to_yojson is_latest_version_to_yojson x.is_latest_version);
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
      ("WorkflowVersion", Some (workflow_version_to_yojson x.workflow_version));
    ]

let workflow_version_summaries_to_yojson tree =
  list_to_yojson workflow_version_summary_to_yojson tree

let workflow_version_arn_to_yojson = string_to_yojson
let name_string_to_yojson = string_to_yojson
let description_string_to_yojson = string_to_yojson

let workflow_status_to_yojson (x : workflow_status) =
  match x with DELETING -> `String "DELETING" | READY -> `String "READY"

let workflow_summary_to_yojson (x : workflow_summary) =
  assoc_to_yojson
    [
      ("TriggerMode", option_to_yojson generic_string_to_yojson x.trigger_mode);
      ("WorkflowStatus", option_to_yojson workflow_status_to_yojson x.workflow_status);
      ("ModifiedAt", option_to_yojson timestamp_value_to_yojson x.modified_at);
      ("CreatedAt", option_to_yojson timestamp_value_to_yojson x.created_at);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("WorkflowVersion", option_to_yojson workflow_version_to_yojson x.workflow_version);
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
    ]

let workflow_summaries_to_yojson tree = list_to_yojson workflow_summary_to_yojson tree
let id_string_to_yojson = string_to_yojson
let version_id_to_yojson = string_to_yojson

let run_type_to_yojson (x : run_type) =
  match x with SCHEDULED -> `String "SCHEDULED" | ON_DEMAND -> `String "ON_DEMAND"

let workflow_run_status_to_yojson (x : workflow_run_status) =
  match x with
  | STOPPED -> `String "STOPPED"
  | STOPPING -> `String "STOPPING"
  | TIMEOUT -> `String "TIMEOUT"
  | FAILED -> `String "FAILED"
  | SUCCESS -> `String "SUCCESS"
  | RUNNING -> `String "RUNNING"
  | QUEUED -> `String "QUEUED"
  | STARTING -> `String "STARTING"

let run_detail_summary_to_yojson (x : run_detail_summary) =
  assoc_to_yojson
    [
      ("EndedAt", option_to_yojson timestamp_value_to_yojson x.ended_at);
      ("StartedAt", option_to_yojson timestamp_value_to_yojson x.started_at);
      ("CreatedOn", option_to_yojson timestamp_value_to_yojson x.created_on);
      ("Status", option_to_yojson workflow_run_status_to_yojson x.status);
    ]

let workflow_run_summary_to_yojson (x : workflow_run_summary) =
  assoc_to_yojson
    [
      ("RunDetailSummary", option_to_yojson run_detail_summary_to_yojson x.run_detail_summary);
      ("RunType", option_to_yojson run_type_to_yojson x.run_type);
      ("WorkflowVersion", option_to_yojson version_id_to_yojson x.workflow_version);
      ("WorkflowArn", option_to_yojson workflow_arn_to_yojson x.workflow_arn);
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
    ]

let workflow_run_summaries_to_yojson tree = list_to_yojson workflow_run_summary_to_yojson tree
let task_instance_ids_to_yojson tree = list_to_yojson id_string_to_yojson tree

let workflow_run_detail_to_yojson (x : workflow_run_detail) =
  assoc_to_yojson
    [
      ("RunState", option_to_yojson workflow_run_status_to_yojson x.run_state);
      ("TaskInstances", option_to_yojson task_instance_ids_to_yojson x.task_instances);
      ("ErrorMessage", option_to_yojson generic_string_to_yojson x.error_message);
      ( "Duration",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.duration );
      ("ModifiedAt", option_to_yojson timestamp_value_to_yojson x.modified_at);
      ("CompletedOn", option_to_yojson timestamp_value_to_yojson x.completed_on);
      ("CreatedAt", option_to_yojson timestamp_value_to_yojson x.created_at);
      ("StartedOn", option_to_yojson timestamp_value_to_yojson x.started_on);
      ("RunType", option_to_yojson run_type_to_yojson x.run_type);
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
      ("WorkflowVersion", option_to_yojson version_id_to_yojson x.workflow_version);
      ("WorkflowArn", option_to_yojson workflow_arn_to_yojson x.workflow_arn);
    ]

let warning_messages_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | OTHER -> `String "other"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | CANNOT_PARSE -> `String "cannotParse"
  | UNKNOWN_OPERATION -> `String "unknownOperation"

let error_message_to_yojson = string_to_yojson

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("Message", Some (error_message_to_yojson x.message));
      ("Name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
    ]

let validation_exception_fields_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("FieldList", option_to_yojson validation_exception_fields_to_yojson x.field_list);
      ("Reason", Some (validation_exception_reason_to_yojson x.reason));
      ("Message", Some (error_message_to_yojson x.message));
    ]

let update_workflow_response_to_yojson (x : update_workflow_response) =
  assoc_to_yojson
    [
      ("Warnings", option_to_yojson warning_messages_to_yojson x.warnings);
      ("WorkflowVersion", option_to_yojson workflow_version_to_yojson x.workflow_version);
      ("ModifiedAt", option_to_yojson timestamp_value_to_yojson x.modified_at);
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
    ]

let role_ar_n_to_yojson = string_to_yojson

let logging_configuration_to_yojson (x : logging_configuration) =
  assoc_to_yojson
    [
      ( "LogGroupName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.log_group_name) );
    ]

let engine_version_to_yojson (x : engine_version) = match x with ONE -> `Int 1
let security_group_string_to_yojson = string_to_yojson
let security_group_ids_to_yojson tree = list_to_yojson security_group_string_to_yojson tree
let subnet_string_to_yojson = string_to_yojson
let subnet_ids_to_yojson tree = list_to_yojson subnet_string_to_yojson tree

let network_configuration_to_yojson (x : network_configuration) =
  assoc_to_yojson
    [
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
      ("SecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
    ]

let update_workflow_request_to_yojson (x : update_workflow_request) =
  assoc_to_yojson
    [
      ("TriggerMode", option_to_yojson generic_string_to_yojson x.trigger_mode);
      ( "NetworkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("EngineVersion", option_to_yojson engine_version_to_yojson x.engine_version);
      ( "LoggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("RoleArn", Some (role_ar_n_to_yojson x.role_arn));
      ("DefinitionS3Location", Some (definition_s3_location_to_yojson x.definition_s3_location));
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ( "RetryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
      ("QuotaCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code));
      ("ServiceCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code));
      ("Message", Some (error_message_to_yojson x.message));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("QuotaCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code));
      ("ServiceCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code));
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("ResourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("Message", Some (error_message_to_yojson x.message));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("ResourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("Message", Some (error_message_to_yojson x.message));
    ]

let operation_timeout_exception_to_yojson (x : operation_timeout_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ( "RetryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
      ("Message", Some (error_message_to_yojson x.message));
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("ResourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("Message", Some (error_message_to_yojson x.message));
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", Some (error_message_to_yojson x.message)) ]

let untag_resource_response_to_yojson = unit_to_yojson
let taggable_resource_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_keys_to_yojson x.tag_keys));
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
    ]

let task_instance_status_to_yojson (x : task_instance_status) =
  match x with
  | TIMEOUT -> `String "TIMEOUT"
  | CANCELLED -> `String "CANCELLED"
  | NONE -> `String "NONE"
  | DEFERRED -> `String "DEFERRED"
  | RESTARTING -> `String "RESTARTING"
  | REMOVED -> `String "REMOVED"
  | UPSTREAM_FAILED -> `String "UPSTREAM_FAILED"
  | UP_FOR_RETRY -> `String "UP_FOR_RETRY"
  | UP_FOR_RESCHEDULE -> `String "UP_FOR_RESCHEDULE"
  | SUCCESS -> `String "SUCCESS"
  | RUNNING -> `String "RUNNING"
  | SCHEDULED -> `String "SCHEDULED"
  | FAILED -> `String "FAILED"
  | QUEUED -> `String "QUEUED"

let task_instance_summary_to_yojson (x : task_instance_summary) =
  assoc_to_yojson
    [
      ("OperatorName", option_to_yojson generic_string_to_yojson x.operator_name);
      ( "DurationInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.duration_in_seconds );
      ("Status", option_to_yojson task_instance_status_to_yojson x.status);
      ("TaskInstanceId", option_to_yojson id_string_to_yojson x.task_instance_id);
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
      ("WorkflowVersion", option_to_yojson version_id_to_yojson x.workflow_version);
      ("WorkflowArn", option_to_yojson workflow_arn_to_yojson x.workflow_arn);
    ]

let task_instance_summaries_to_yojson tree = list_to_yojson task_instance_summary_to_yojson tree
let tag_value_to_yojson = string_to_yojson
let tags_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree
let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tags_to_yojson x.tags));
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
    ]

let stop_workflow_run_response_to_yojson (x : stop_workflow_run_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson workflow_run_status_to_yojson x.status);
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
      ("WorkflowVersion", option_to_yojson version_id_to_yojson x.workflow_version);
      ("WorkflowArn", option_to_yojson workflow_arn_to_yojson x.workflow_arn);
    ]

let stop_workflow_run_request_to_yojson (x : stop_workflow_run_request) =
  assoc_to_yojson
    [
      ("RunId", Some (id_string_to_yojson x.run_id));
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
    ]

let start_workflow_run_response_to_yojson (x : start_workflow_run_response) =
  assoc_to_yojson
    [
      ("StartedAt", option_to_yojson timestamp_value_to_yojson x.started_at);
      ("Status", option_to_yojson workflow_run_status_to_yojson x.status);
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
    ]

let idempotency_token_string_to_yojson = string_to_yojson

let object_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.document_to_yojson tree

let start_workflow_run_request_to_yojson (x : start_workflow_run_request) =
  assoc_to_yojson
    [
      ("WorkflowVersion", option_to_yojson version_id_to_yojson x.workflow_version);
      ("OverrideParameters", option_to_yojson object_map_to_yojson x.override_parameters);
      ( "ClientToken",
        Some
          (idempotency_token_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
    ]

let list_workflows_response_to_yojson (x : list_workflows_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("Workflows", Some (workflow_summaries_to_yojson x.workflows));
    ]

let list_workflows_request_to_yojson (x : list_workflows_request) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let list_workflow_versions_response_to_yojson (x : list_workflow_versions_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("WorkflowVersions", option_to_yojson workflow_version_summaries_to_yojson x.workflow_versions);
    ]

let list_workflow_versions_request_to_yojson (x : list_workflow_versions_request) =
  assoc_to_yojson
    [
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let list_workflow_runs_response_to_yojson (x : list_workflow_runs_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("WorkflowRuns", option_to_yojson workflow_run_summaries_to_yojson x.workflow_runs);
    ]

let list_workflow_runs_request_to_yojson (x : list_workflow_runs_request) =
  assoc_to_yojson
    [
      ("WorkflowVersion", option_to_yojson version_id_to_yojson x.workflow_version);
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let list_task_instances_response_to_yojson (x : list_task_instances_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("TaskInstances", option_to_yojson task_instance_summaries_to_yojson x.task_instances);
    ]

let list_task_instances_request_to_yojson (x : list_task_instances_request) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("RunId", Some (id_string_to_yojson x.run_id));
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn)) ]

let get_workflow_run_response_to_yojson (x : get_workflow_run_response) =
  assoc_to_yojson
    [
      ("RunDetail", option_to_yojson workflow_run_detail_to_yojson x.run_detail);
      ("OverrideParameters", option_to_yojson object_map_to_yojson x.override_parameters);
      ("RunType", option_to_yojson run_type_to_yojson x.run_type);
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
      ("WorkflowVersion", option_to_yojson version_id_to_yojson x.workflow_version);
      ("WorkflowArn", option_to_yojson workflow_arn_to_yojson x.workflow_arn);
    ]

let get_workflow_run_request_to_yojson (x : get_workflow_run_request) =
  assoc_to_yojson
    [
      ("RunId", Some (id_string_to_yojson x.run_id));
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
    ]

let encryption_type_to_yojson (x : encryption_type) =
  match x with
  | CUSTOMER_MANAGED_KEY -> `String "CUSTOMER_MANAGED_KEY"
  | AWS_MANAGED_KEY -> `String "AWS_MANAGED_KEY"

let encryption_configuration_to_yojson (x : encryption_configuration) =
  assoc_to_yojson
    [
      ( "KmsKeyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id );
      ("Type", Some (encryption_type_to_yojson x.type_));
    ]

let get_workflow_response_to_yojson (x : get_workflow_response) =
  assoc_to_yojson
    [
      ("WorkflowDefinition", option_to_yojson generic_string_to_yojson x.workflow_definition);
      ("TriggerMode", option_to_yojson generic_string_to_yojson x.trigger_mode);
      ( "NetworkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("RoleArn", option_to_yojson role_ar_n_to_yojson x.role_arn);
      ( "ScheduleConfiguration",
        option_to_yojson schedule_configuration_to_yojson x.schedule_configuration );
      ( "DefinitionS3Location",
        option_to_yojson definition_s3_location_to_yojson x.definition_s3_location );
      ("WorkflowStatus", option_to_yojson workflow_status_to_yojson x.workflow_status);
      ("EngineVersion", option_to_yojson engine_version_to_yojson x.engine_version);
      ( "LoggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("ModifiedAt", option_to_yojson timestamp_value_to_yojson x.modified_at);
      ("CreatedAt", option_to_yojson timestamp_value_to_yojson x.created_at);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("WorkflowVersion", option_to_yojson workflow_version_to_yojson x.workflow_version);
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
    ]

let get_workflow_request_to_yojson (x : get_workflow_request) =
  assoc_to_yojson
    [
      ("WorkflowVersion", option_to_yojson workflow_version_to_yojson x.workflow_version);
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
    ]

let generic_map_to_yojson tree =
  map_to_yojson generic_string_to_yojson generic_string_to_yojson tree

let get_task_instance_response_to_yojson (x : get_task_instance_response) =
  assoc_to_yojson
    [
      ("Xcom", option_to_yojson generic_map_to_yojson x.xcom);
      ("LogStream", option_to_yojson id_string_to_yojson x.log_stream);
      ("TaskId", option_to_yojson id_string_to_yojson x.task_id);
      ("ErrorMessage", option_to_yojson generic_string_to_yojson x.error_message);
      ( "AttemptNumber",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.attempt_number );
      ("StartedAt", option_to_yojson timestamp_value_to_yojson x.started_at);
      ("EndedAt", option_to_yojson timestamp_value_to_yojson x.ended_at);
      ("ModifiedAt", option_to_yojson timestamp_value_to_yojson x.modified_at);
      ("OperatorName", option_to_yojson generic_string_to_yojson x.operator_name);
      ( "DurationInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.duration_in_seconds );
      ("Status", option_to_yojson task_instance_status_to_yojson x.status);
      ("WorkflowVersion", option_to_yojson version_id_to_yojson x.workflow_version);
      ("TaskInstanceId", Some (id_string_to_yojson x.task_instance_id));
      ("RunId", Some (id_string_to_yojson x.run_id));
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
    ]

let get_task_instance_request_to_yojson (x : get_task_instance_request) =
  assoc_to_yojson
    [
      ("RunId", Some (id_string_to_yojson x.run_id));
      ("TaskInstanceId", Some (id_string_to_yojson x.task_instance_id));
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
    ]

let delete_workflow_response_to_yojson (x : delete_workflow_response) =
  assoc_to_yojson
    [
      ("WorkflowVersion", option_to_yojson workflow_version_to_yojson x.workflow_version);
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
    ]

let delete_workflow_request_to_yojson (x : delete_workflow_request) =
  assoc_to_yojson
    [
      ("WorkflowVersion", option_to_yojson workflow_version_to_yojson x.workflow_version);
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
    ]

let create_workflow_response_to_yojson (x : create_workflow_response) =
  assoc_to_yojson
    [
      ("Warnings", option_to_yojson warning_messages_to_yojson x.warnings);
      ("IsLatestVersion", option_to_yojson is_latest_version_to_yojson x.is_latest_version);
      ("WorkflowVersion", option_to_yojson workflow_version_to_yojson x.workflow_version);
      ("WorkflowStatus", option_to_yojson workflow_status_to_yojson x.workflow_status);
      ( "RevisionId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.revision_id );
      ("CreatedAt", option_to_yojson timestamp_value_to_yojson x.created_at);
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
    ]

let create_workflow_request_to_yojson (x : create_workflow_request) =
  assoc_to_yojson
    [
      ("TriggerMode", option_to_yojson generic_string_to_yojson x.trigger_mode);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "NetworkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("EngineVersion", option_to_yojson engine_version_to_yojson x.engine_version);
      ( "LoggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("RoleArn", Some (role_ar_n_to_yojson x.role_arn));
      ("DefinitionS3Location", Some (definition_s3_location_to_yojson x.definition_s3_location));
      ( "ClientToken",
        Some
          (idempotency_token_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Name", Some (name_string_to_yojson x.name));
    ]
