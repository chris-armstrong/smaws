open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", Some (error_message_to_yojson x.message)) ]

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("Name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ("Message", Some (error_message_to_yojson x.message));
    ]

let validation_exception_fields_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | UNKNOWN_OPERATION -> `String "unknownOperation"
  | CANNOT_PARSE -> `String "cannotParse"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | OTHER -> `String "other"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("Message", Some (error_message_to_yojson x.message));
      ("Reason", Some (validation_exception_reason_to_yojson x.reason));
      ("FieldList", option_to_yojson validation_exception_fields_to_yojson x.field_list);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("Message", Some (error_message_to_yojson x.message));
      ("ServiceCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code));
      ("QuotaCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code));
      ( "RetryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Message", Some (error_message_to_yojson x.message));
      ("ResourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
    ]

let operation_timeout_exception_to_yojson (x : operation_timeout_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("Message", Some (error_message_to_yojson x.message));
      ( "RetryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let taggable_resource_arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_keys_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson
let tags_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("Tags", Some (tags_to_yojson x.tags));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn)) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("Message", Some (error_message_to_yojson x.message));
      ("ResourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", Some (error_message_to_yojson x.message));
      ("ResourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("ServiceCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code));
      ("QuotaCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code));
    ]

let warning_messages_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let is_latest_version_to_yojson = bool_to_yojson
let workflow_version_to_yojson = string_to_yojson

let workflow_status_to_yojson (x : workflow_status) =
  match x with READY -> `String "READY" | DELETING -> `String "DELETING"

let timestamp_value_to_yojson = timestamp_iso_8601_to_yojson
let workflow_arn_to_yojson = string_to_yojson

let create_workflow_response_to_yojson (x : create_workflow_response) =
  assoc_to_yojson
    [
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
      ("CreatedAt", option_to_yojson timestamp_value_to_yojson x.created_at);
      ( "RevisionId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.revision_id );
      ("WorkflowStatus", option_to_yojson workflow_status_to_yojson x.workflow_status);
      ("WorkflowVersion", option_to_yojson workflow_version_to_yojson x.workflow_version);
      ("IsLatestVersion", option_to_yojson is_latest_version_to_yojson x.is_latest_version);
      ("Warnings", option_to_yojson warning_messages_to_yojson x.warnings);
    ]

let generic_string_to_yojson = string_to_yojson
let subnet_string_to_yojson = string_to_yojson
let subnet_ids_to_yojson tree = list_to_yojson subnet_string_to_yojson tree
let security_group_string_to_yojson = string_to_yojson
let security_group_ids_to_yojson tree = list_to_yojson security_group_string_to_yojson tree

let network_configuration_to_yojson (x : network_configuration) =
  assoc_to_yojson
    [
      ("SecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
    ]

let engine_version_to_yojson (x : engine_version) = match x with ONE -> `Int 1

let logging_configuration_to_yojson (x : logging_configuration) =
  assoc_to_yojson
    [
      ( "LogGroupName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.log_group_name) );
    ]

let encryption_type_to_yojson (x : encryption_type) =
  match x with
  | AWS_MANAGED_KEY -> `String "AWS_MANAGED_KEY"
  | CUSTOMER_MANAGED_KEY -> `String "CUSTOMER_MANAGED_KEY"

let encryption_configuration_to_yojson (x : encryption_configuration) =
  assoc_to_yojson
    [
      ("Type", Some (encryption_type_to_yojson x.type_));
      ( "KmsKeyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id );
    ]

let description_string_to_yojson = string_to_yojson
let role_ar_n_to_yojson = string_to_yojson

let definition_s3_location_to_yojson (x : definition_s3_location) =
  assoc_to_yojson
    [
      ("Bucket", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.bucket));
      ("ObjectKey", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.object_key));
      ( "VersionId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version_id );
    ]

let idempotency_token_string_to_yojson = string_to_yojson
let name_string_to_yojson = string_to_yojson

let create_workflow_request_to_yojson (x : create_workflow_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ( "ClientToken",
        Some
          (idempotency_token_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("DefinitionS3Location", Some (definition_s3_location_to_yojson x.definition_s3_location));
      ("RoleArn", Some (role_ar_n_to_yojson x.role_arn));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "LoggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
      ("EngineVersion", option_to_yojson engine_version_to_yojson x.engine_version);
      ( "NetworkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("TriggerMode", option_to_yojson generic_string_to_yojson x.trigger_mode);
    ]

let delete_workflow_response_to_yojson (x : delete_workflow_response) =
  assoc_to_yojson
    [
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
      ("WorkflowVersion", option_to_yojson workflow_version_to_yojson x.workflow_version);
    ]

let delete_workflow_request_to_yojson (x : delete_workflow_request) =
  assoc_to_yojson
    [
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
      ("WorkflowVersion", option_to_yojson workflow_version_to_yojson x.workflow_version);
    ]

let generic_map_to_yojson tree =
  map_to_yojson generic_string_to_yojson generic_string_to_yojson tree

let id_string_to_yojson = string_to_yojson

let task_instance_status_to_yojson (x : task_instance_status) =
  match x with
  | QUEUED -> `String "QUEUED"
  | FAILED -> `String "FAILED"
  | SCHEDULED -> `String "SCHEDULED"
  | RUNNING -> `String "RUNNING"
  | SUCCESS -> `String "SUCCESS"
  | UP_FOR_RESCHEDULE -> `String "UP_FOR_RESCHEDULE"
  | UP_FOR_RETRY -> `String "UP_FOR_RETRY"
  | UPSTREAM_FAILED -> `String "UPSTREAM_FAILED"
  | REMOVED -> `String "REMOVED"
  | RESTARTING -> `String "RESTARTING"
  | DEFERRED -> `String "DEFERRED"
  | NONE -> `String "NONE"
  | CANCELLED -> `String "CANCELLED"
  | TIMEOUT -> `String "TIMEOUT"

let version_id_to_yojson = string_to_yojson

let get_task_instance_response_to_yojson (x : get_task_instance_response) =
  assoc_to_yojson
    [
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
      ("RunId", Some (id_string_to_yojson x.run_id));
      ("TaskInstanceId", Some (id_string_to_yojson x.task_instance_id));
      ("WorkflowVersion", option_to_yojson version_id_to_yojson x.workflow_version);
      ("Status", option_to_yojson task_instance_status_to_yojson x.status);
      ( "DurationInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.duration_in_seconds );
      ("OperatorName", option_to_yojson generic_string_to_yojson x.operator_name);
      ("ModifiedAt", option_to_yojson timestamp_value_to_yojson x.modified_at);
      ("EndedAt", option_to_yojson timestamp_value_to_yojson x.ended_at);
      ("StartedAt", option_to_yojson timestamp_value_to_yojson x.started_at);
      ( "AttemptNumber",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.attempt_number );
      ("ErrorMessage", option_to_yojson generic_string_to_yojson x.error_message);
      ("TaskId", option_to_yojson id_string_to_yojson x.task_id);
      ("LogStream", option_to_yojson id_string_to_yojson x.log_stream);
      ("Xcom", option_to_yojson generic_map_to_yojson x.xcom);
    ]

let get_task_instance_request_to_yojson (x : get_task_instance_request) =
  assoc_to_yojson
    [
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
      ("TaskInstanceId", Some (id_string_to_yojson x.task_instance_id));
      ("RunId", Some (id_string_to_yojson x.run_id));
    ]

let schedule_configuration_to_yojson (x : schedule_configuration) =
  assoc_to_yojson
    [
      ( "CronExpression",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cron_expression
      );
    ]

let get_workflow_response_to_yojson (x : get_workflow_response) =
  assoc_to_yojson
    [
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
      ("WorkflowVersion", option_to_yojson workflow_version_to_yojson x.workflow_version);
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("CreatedAt", option_to_yojson timestamp_value_to_yojson x.created_at);
      ("ModifiedAt", option_to_yojson timestamp_value_to_yojson x.modified_at);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "LoggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
      ("EngineVersion", option_to_yojson engine_version_to_yojson x.engine_version);
      ("WorkflowStatus", option_to_yojson workflow_status_to_yojson x.workflow_status);
      ( "DefinitionS3Location",
        option_to_yojson definition_s3_location_to_yojson x.definition_s3_location );
      ( "ScheduleConfiguration",
        option_to_yojson schedule_configuration_to_yojson x.schedule_configuration );
      ("RoleArn", option_to_yojson role_ar_n_to_yojson x.role_arn);
      ( "NetworkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("TriggerMode", option_to_yojson generic_string_to_yojson x.trigger_mode);
      ("WorkflowDefinition", option_to_yojson generic_string_to_yojson x.workflow_definition);
    ]

let get_workflow_request_to_yojson (x : get_workflow_request) =
  assoc_to_yojson
    [
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
      ("WorkflowVersion", option_to_yojson workflow_version_to_yojson x.workflow_version);
    ]

let workflow_run_status_to_yojson (x : workflow_run_status) =
  match x with
  | STARTING -> `String "STARTING"
  | QUEUED -> `String "QUEUED"
  | RUNNING -> `String "RUNNING"
  | SUCCESS -> `String "SUCCESS"
  | FAILED -> `String "FAILED"
  | TIMEOUT -> `String "TIMEOUT"
  | STOPPING -> `String "STOPPING"
  | STOPPED -> `String "STOPPED"

let task_instance_ids_to_yojson tree = list_to_yojson id_string_to_yojson tree

let run_type_to_yojson (x : run_type) =
  match x with ON_DEMAND -> `String "ON_DEMAND" | SCHEDULED -> `String "SCHEDULED"

let workflow_run_detail_to_yojson (x : workflow_run_detail) =
  assoc_to_yojson
    [
      ("WorkflowArn", option_to_yojson workflow_arn_to_yojson x.workflow_arn);
      ("WorkflowVersion", option_to_yojson version_id_to_yojson x.workflow_version);
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
      ("RunType", option_to_yojson run_type_to_yojson x.run_type);
      ("StartedOn", option_to_yojson timestamp_value_to_yojson x.started_on);
      ("CreatedAt", option_to_yojson timestamp_value_to_yojson x.created_at);
      ("CompletedOn", option_to_yojson timestamp_value_to_yojson x.completed_on);
      ("ModifiedAt", option_to_yojson timestamp_value_to_yojson x.modified_at);
      ( "Duration",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.duration );
      ("ErrorMessage", option_to_yojson generic_string_to_yojson x.error_message);
      ("TaskInstances", option_to_yojson task_instance_ids_to_yojson x.task_instances);
      ("RunState", option_to_yojson workflow_run_status_to_yojson x.run_state);
    ]

let object_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.document_to_yojson tree

let get_workflow_run_response_to_yojson (x : get_workflow_run_response) =
  assoc_to_yojson
    [
      ("WorkflowArn", option_to_yojson workflow_arn_to_yojson x.workflow_arn);
      ("WorkflowVersion", option_to_yojson version_id_to_yojson x.workflow_version);
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
      ("RunType", option_to_yojson run_type_to_yojson x.run_type);
      ("OverrideParameters", option_to_yojson object_map_to_yojson x.override_parameters);
      ("RunDetail", option_to_yojson workflow_run_detail_to_yojson x.run_detail);
    ]

let get_workflow_run_request_to_yojson (x : get_workflow_run_request) =
  assoc_to_yojson
    [
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
      ("RunId", Some (id_string_to_yojson x.run_id));
    ]

let task_instance_summary_to_yojson (x : task_instance_summary) =
  assoc_to_yojson
    [
      ("WorkflowArn", option_to_yojson workflow_arn_to_yojson x.workflow_arn);
      ("WorkflowVersion", option_to_yojson version_id_to_yojson x.workflow_version);
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
      ("TaskInstanceId", option_to_yojson id_string_to_yojson x.task_instance_id);
      ("Status", option_to_yojson task_instance_status_to_yojson x.status);
      ( "DurationInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.duration_in_seconds );
      ("OperatorName", option_to_yojson generic_string_to_yojson x.operator_name);
    ]

let task_instance_summaries_to_yojson tree = list_to_yojson task_instance_summary_to_yojson tree

let list_task_instances_response_to_yojson (x : list_task_instances_response) =
  assoc_to_yojson
    [
      ("TaskInstances", option_to_yojson task_instance_summaries_to_yojson x.task_instances);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_task_instances_request_to_yojson (x : list_task_instances_request) =
  assoc_to_yojson
    [
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
      ("RunId", Some (id_string_to_yojson x.run_id));
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let run_detail_summary_to_yojson (x : run_detail_summary) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson workflow_run_status_to_yojson x.status);
      ("CreatedOn", option_to_yojson timestamp_value_to_yojson x.created_on);
      ("StartedAt", option_to_yojson timestamp_value_to_yojson x.started_at);
      ("EndedAt", option_to_yojson timestamp_value_to_yojson x.ended_at);
    ]

let workflow_run_summary_to_yojson (x : workflow_run_summary) =
  assoc_to_yojson
    [
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
      ("WorkflowArn", option_to_yojson workflow_arn_to_yojson x.workflow_arn);
      ("WorkflowVersion", option_to_yojson version_id_to_yojson x.workflow_version);
      ("RunType", option_to_yojson run_type_to_yojson x.run_type);
      ("RunDetailSummary", option_to_yojson run_detail_summary_to_yojson x.run_detail_summary);
    ]

let workflow_run_summaries_to_yojson tree = list_to_yojson workflow_run_summary_to_yojson tree

let list_workflow_runs_response_to_yojson (x : list_workflow_runs_response) =
  assoc_to_yojson
    [
      ("WorkflowRuns", option_to_yojson workflow_run_summaries_to_yojson x.workflow_runs);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_workflow_runs_request_to_yojson (x : list_workflow_runs_request) =
  assoc_to_yojson
    [
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
      ("WorkflowVersion", option_to_yojson version_id_to_yojson x.workflow_version);
    ]

let workflow_version_summary_to_yojson (x : workflow_version_summary) =
  assoc_to_yojson
    [
      ("WorkflowVersion", Some (workflow_version_to_yojson x.workflow_version));
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
      ("IsLatestVersion", option_to_yojson is_latest_version_to_yojson x.is_latest_version);
      ("CreatedAt", option_to_yojson timestamp_value_to_yojson x.created_at);
      ("ModifiedAt", option_to_yojson timestamp_value_to_yojson x.modified_at);
      ( "DefinitionS3Location",
        option_to_yojson definition_s3_location_to_yojson x.definition_s3_location );
      ( "ScheduleConfiguration",
        option_to_yojson schedule_configuration_to_yojson x.schedule_configuration );
      ("TriggerMode", option_to_yojson generic_string_to_yojson x.trigger_mode);
    ]

let workflow_version_summaries_to_yojson tree =
  list_to_yojson workflow_version_summary_to_yojson tree

let list_workflow_versions_response_to_yojson (x : list_workflow_versions_response) =
  assoc_to_yojson
    [
      ("WorkflowVersions", option_to_yojson workflow_version_summaries_to_yojson x.workflow_versions);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_workflow_versions_request_to_yojson (x : list_workflow_versions_request) =
  assoc_to_yojson
    [
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
    ]

let workflow_summary_to_yojson (x : workflow_summary) =
  assoc_to_yojson
    [
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
      ("WorkflowVersion", option_to_yojson workflow_version_to_yojson x.workflow_version);
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("CreatedAt", option_to_yojson timestamp_value_to_yojson x.created_at);
      ("ModifiedAt", option_to_yojson timestamp_value_to_yojson x.modified_at);
      ("WorkflowStatus", option_to_yojson workflow_status_to_yojson x.workflow_status);
      ("TriggerMode", option_to_yojson generic_string_to_yojson x.trigger_mode);
    ]

let workflow_summaries_to_yojson tree = list_to_yojson workflow_summary_to_yojson tree

let list_workflows_response_to_yojson (x : list_workflows_response) =
  assoc_to_yojson
    [
      ("Workflows", Some (workflow_summaries_to_yojson x.workflows));
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_workflows_request_to_yojson (x : list_workflows_request) =
  assoc_to_yojson
    [
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let start_workflow_run_response_to_yojson (x : start_workflow_run_response) =
  assoc_to_yojson
    [
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
      ("Status", option_to_yojson workflow_run_status_to_yojson x.status);
      ("StartedAt", option_to_yojson timestamp_value_to_yojson x.started_at);
    ]

let start_workflow_run_request_to_yojson (x : start_workflow_run_request) =
  assoc_to_yojson
    [
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
      ( "ClientToken",
        Some
          (idempotency_token_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("OverrideParameters", option_to_yojson object_map_to_yojson x.override_parameters);
      ("WorkflowVersion", option_to_yojson version_id_to_yojson x.workflow_version);
    ]

let stop_workflow_run_response_to_yojson (x : stop_workflow_run_response) =
  assoc_to_yojson
    [
      ("WorkflowArn", option_to_yojson workflow_arn_to_yojson x.workflow_arn);
      ("WorkflowVersion", option_to_yojson version_id_to_yojson x.workflow_version);
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
      ("Status", option_to_yojson workflow_run_status_to_yojson x.status);
    ]

let stop_workflow_run_request_to_yojson (x : stop_workflow_run_request) =
  assoc_to_yojson
    [
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
      ("RunId", Some (id_string_to_yojson x.run_id));
    ]

let update_workflow_response_to_yojson (x : update_workflow_response) =
  assoc_to_yojson
    [
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
      ("ModifiedAt", option_to_yojson timestamp_value_to_yojson x.modified_at);
      ("WorkflowVersion", option_to_yojson workflow_version_to_yojson x.workflow_version);
      ("Warnings", option_to_yojson warning_messages_to_yojson x.warnings);
    ]

let update_workflow_request_to_yojson (x : update_workflow_request) =
  assoc_to_yojson
    [
      ("WorkflowArn", Some (workflow_arn_to_yojson x.workflow_arn));
      ("DefinitionS3Location", Some (definition_s3_location_to_yojson x.definition_s3_location));
      ("RoleArn", Some (role_ar_n_to_yojson x.role_arn));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ( "LoggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
      ("EngineVersion", option_to_yojson engine_version_to_yojson x.engine_version);
      ( "NetworkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("TriggerMode", option_to_yojson generic_string_to_yojson x.trigger_mode);
    ]

let workflow_version_arn_to_yojson = string_to_yojson
