open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "Message" _list path }
    : access_denied_exception)

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Name" _list path;
     message = value_for_key error_message_of_yojson "Message" _list path;
   }
    : validation_exception_field)

let validation_exception_fields_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "unknownOperation" -> UNKNOWN_OPERATION
    | `String "cannotParse" -> CANNOT_PARSE
    | `String "fieldValidationFailed" -> FIELD_VALIDATION_FAILED
    | `String "other" -> OTHER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key error_message_of_yojson "Message" _list path;
     reason = value_for_key validation_exception_reason_of_yojson "Reason" _list path;
     field_list =
       option_of_yojson (value_for_key validation_exception_fields_of_yojson "FieldList") _list path;
   }
    : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key error_message_of_yojson "Message" _list path;
     service_code =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ServiceCode" _list
         path;
     quota_code =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "QuotaCode" _list
         path;
     retry_after_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "RetryAfterSeconds")
         _list path;
   }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key error_message_of_yojson "Message" _list path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceId" _list
         path;
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceType" _list
         path;
   }
    : resource_not_found_exception)

let operation_timeout_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : operation_timeout_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key error_message_of_yojson "Message" _list path;
     retry_after_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "RetryAfterSeconds")
         _list path;
   }
    : internal_server_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path
let taggable_resource_arn_of_yojson = string_of_yojson

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path;
     tag_keys = value_for_key tag_keys_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_value_of_yojson = string_of_yojson
let tags_of_yojson tree path = map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path;
     tags = value_for_key tags_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key error_message_of_yojson "Message" _list path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceId" _list
         path;
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceType" _list
         path;
   }
    : conflict_exception)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key error_message_of_yojson "Message" _list path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceId" _list
         path;
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceType" _list
         path;
     service_code =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ServiceCode" _list
         path;
     quota_code =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "QuotaCode" _list
         path;
   }
    : service_quota_exceeded_exception)

let warning_messages_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let is_latest_version_of_yojson = bool_of_yojson
let workflow_version_of_yojson = string_of_yojson

let workflow_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "READY" -> READY
    | `String "DELETING" -> DELETING
    | `String value -> raise (deserialize_unknown_enum_value_error path "WorkflowStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkflowStatus")
     : workflow_status)
    : workflow_status)

let timestamp_value_of_yojson = timestamp_iso_8601_of_yojson
let workflow_arn_of_yojson = string_of_yojson

let create_workflow_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_arn = value_for_key workflow_arn_of_yojson "WorkflowArn" _list path;
     created_at = option_of_yojson (value_for_key timestamp_value_of_yojson "CreatedAt") _list path;
     revision_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RevisionId")
         _list path;
     workflow_status =
       option_of_yojson (value_for_key workflow_status_of_yojson "WorkflowStatus") _list path;
     workflow_version =
       option_of_yojson (value_for_key workflow_version_of_yojson "WorkflowVersion") _list path;
     is_latest_version =
       option_of_yojson (value_for_key is_latest_version_of_yojson "IsLatestVersion") _list path;
     warnings = option_of_yojson (value_for_key warning_messages_of_yojson "Warnings") _list path;
   }
    : create_workflow_response)

let generic_string_of_yojson = string_of_yojson
let subnet_string_of_yojson = string_of_yojson
let subnet_ids_of_yojson tree path = list_of_yojson subnet_string_of_yojson tree path
let security_group_string_of_yojson = string_of_yojson

let security_group_ids_of_yojson tree path =
  list_of_yojson security_group_string_of_yojson tree path

let network_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_group_ids =
       option_of_yojson (value_for_key security_group_ids_of_yojson "SecurityGroupIds") _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_ids_of_yojson "SubnetIds") _list path;
   }
    : network_configuration)

let engine_version_of_yojson (tree : t) path =
  ((match tree with
    | `Int 1 -> ONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "EngineVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "EngineVersion")
     : engine_version)
    : engine_version)

let logging_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_group_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "LogGroupName" _list
         path;
   }
    : logging_configuration)

let encryption_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_MANAGED_KEY" -> AWS_MANAGED_KEY
    | `String "CUSTOMER_MANAGED_KEY" -> CUSTOMER_MANAGED_KEY
    | `String value -> raise (deserialize_unknown_enum_value_error path "EncryptionType" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionType")
     : encryption_type)
    : encryption_type)

let encryption_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key encryption_type_of_yojson "Type" _list path;
     kms_key_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "KmsKeyId")
         _list path;
   }
    : encryption_configuration)

let description_string_of_yojson = string_of_yojson
let role_ar_n_of_yojson = string_of_yojson

let definition_s3_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Bucket" _list path;
     object_key =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ObjectKey" _list
         path;
     version_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "VersionId")
         _list path;
   }
    : definition_s3_location)

let idempotency_token_string_of_yojson = string_of_yojson
let name_string_of_yojson = string_of_yojson

let create_workflow_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_string_of_yojson "Name" _list path;
     client_token =
       option_of_yojson (value_for_key idempotency_token_string_of_yojson "ClientToken") _list path;
     definition_s3_location =
       value_for_key definition_s3_location_of_yojson "DefinitionS3Location" _list path;
     role_arn = value_for_key role_ar_n_of_yojson "RoleArn" _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     logging_configuration =
       option_of_yojson
         (value_for_key logging_configuration_of_yojson "LoggingConfiguration")
         _list path;
     engine_version =
       option_of_yojson (value_for_key engine_version_of_yojson "EngineVersion") _list path;
     network_configuration =
       option_of_yojson
         (value_for_key network_configuration_of_yojson "NetworkConfiguration")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     trigger_mode =
       option_of_yojson (value_for_key generic_string_of_yojson "TriggerMode") _list path;
   }
    : create_workflow_request)

let delete_workflow_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_arn = value_for_key workflow_arn_of_yojson "WorkflowArn" _list path;
     workflow_version =
       option_of_yojson (value_for_key workflow_version_of_yojson "WorkflowVersion") _list path;
   }
    : delete_workflow_response)

let delete_workflow_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_arn = value_for_key workflow_arn_of_yojson "WorkflowArn" _list path;
     workflow_version =
       option_of_yojson (value_for_key workflow_version_of_yojson "WorkflowVersion") _list path;
   }
    : delete_workflow_request)

let generic_map_of_yojson tree path =
  map_of_yojson generic_string_of_yojson generic_string_of_yojson tree path

let id_string_of_yojson = string_of_yojson

let task_instance_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "QUEUED" -> QUEUED
    | `String "FAILED" -> FAILED
    | `String "SCHEDULED" -> SCHEDULED
    | `String "RUNNING" -> RUNNING
    | `String "SUCCESS" -> SUCCESS
    | `String "UP_FOR_RESCHEDULE" -> UP_FOR_RESCHEDULE
    | `String "UP_FOR_RETRY" -> UP_FOR_RETRY
    | `String "UPSTREAM_FAILED" -> UPSTREAM_FAILED
    | `String "REMOVED" -> REMOVED
    | `String "RESTARTING" -> RESTARTING
    | `String "DEFERRED" -> DEFERRED
    | `String "NONE" -> NONE
    | `String "CANCELLED" -> CANCELLED
    | `String "TIMEOUT" -> TIMEOUT
    | `String value -> raise (deserialize_unknown_enum_value_error path "TaskInstanceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskInstanceStatus")
     : task_instance_status)
    : task_instance_status)

let version_id_of_yojson = string_of_yojson

let get_task_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_arn = value_for_key workflow_arn_of_yojson "WorkflowArn" _list path;
     run_id = value_for_key id_string_of_yojson "RunId" _list path;
     task_instance_id = value_for_key id_string_of_yojson "TaskInstanceId" _list path;
     workflow_version =
       option_of_yojson (value_for_key version_id_of_yojson "WorkflowVersion") _list path;
     status = option_of_yojson (value_for_key task_instance_status_of_yojson "Status") _list path;
     duration_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "DurationInSeconds")
         _list path;
     operator_name =
       option_of_yojson (value_for_key generic_string_of_yojson "OperatorName") _list path;
     modified_at =
       option_of_yojson (value_for_key timestamp_value_of_yojson "ModifiedAt") _list path;
     ended_at = option_of_yojson (value_for_key timestamp_value_of_yojson "EndedAt") _list path;
     started_at = option_of_yojson (value_for_key timestamp_value_of_yojson "StartedAt") _list path;
     attempt_number =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "AttemptNumber")
         _list path;
     error_message =
       option_of_yojson (value_for_key generic_string_of_yojson "ErrorMessage") _list path;
     task_id = option_of_yojson (value_for_key id_string_of_yojson "TaskId") _list path;
     log_stream = option_of_yojson (value_for_key id_string_of_yojson "LogStream") _list path;
     xcom = option_of_yojson (value_for_key generic_map_of_yojson "Xcom") _list path;
   }
    : get_task_instance_response)

let get_task_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_arn = value_for_key workflow_arn_of_yojson "WorkflowArn" _list path;
     task_instance_id = value_for_key id_string_of_yojson "TaskInstanceId" _list path;
     run_id = value_for_key id_string_of_yojson "RunId" _list path;
   }
    : get_task_instance_request)

let schedule_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cron_expression =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "CronExpression")
         _list path;
   }
    : schedule_configuration)

let get_workflow_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_arn = value_for_key workflow_arn_of_yojson "WorkflowArn" _list path;
     workflow_version =
       option_of_yojson (value_for_key workflow_version_of_yojson "WorkflowVersion") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     created_at = option_of_yojson (value_for_key timestamp_value_of_yojson "CreatedAt") _list path;
     modified_at =
       option_of_yojson (value_for_key timestamp_value_of_yojson "ModifiedAt") _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     logging_configuration =
       option_of_yojson
         (value_for_key logging_configuration_of_yojson "LoggingConfiguration")
         _list path;
     engine_version =
       option_of_yojson (value_for_key engine_version_of_yojson "EngineVersion") _list path;
     workflow_status =
       option_of_yojson (value_for_key workflow_status_of_yojson "WorkflowStatus") _list path;
     definition_s3_location =
       option_of_yojson
         (value_for_key definition_s3_location_of_yojson "DefinitionS3Location")
         _list path;
     schedule_configuration =
       option_of_yojson
         (value_for_key schedule_configuration_of_yojson "ScheduleConfiguration")
         _list path;
     role_arn = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleArn") _list path;
     network_configuration =
       option_of_yojson
         (value_for_key network_configuration_of_yojson "NetworkConfiguration")
         _list path;
     trigger_mode =
       option_of_yojson (value_for_key generic_string_of_yojson "TriggerMode") _list path;
     workflow_definition =
       option_of_yojson (value_for_key generic_string_of_yojson "WorkflowDefinition") _list path;
   }
    : get_workflow_response)

let get_workflow_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_arn = value_for_key workflow_arn_of_yojson "WorkflowArn" _list path;
     workflow_version =
       option_of_yojson (value_for_key workflow_version_of_yojson "WorkflowVersion") _list path;
   }
    : get_workflow_request)

let workflow_run_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "STARTING" -> STARTING
    | `String "QUEUED" -> QUEUED
    | `String "RUNNING" -> RUNNING
    | `String "SUCCESS" -> SUCCESS
    | `String "FAILED" -> FAILED
    | `String "TIMEOUT" -> TIMEOUT
    | `String "STOPPING" -> STOPPING
    | `String "STOPPED" -> STOPPED
    | `String value -> raise (deserialize_unknown_enum_value_error path "WorkflowRunStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkflowRunStatus")
     : workflow_run_status)
    : workflow_run_status)

let task_instance_ids_of_yojson tree path = list_of_yojson id_string_of_yojson tree path

let run_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ON_DEMAND" -> ON_DEMAND
    | `String "SCHEDULED" -> SCHEDULED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RunType" value)
    | _ -> raise (deserialize_wrong_type_error path "RunType")
     : run_type)
    : run_type)

let workflow_run_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_arn = option_of_yojson (value_for_key workflow_arn_of_yojson "WorkflowArn") _list path;
     workflow_version =
       option_of_yojson (value_for_key version_id_of_yojson "WorkflowVersion") _list path;
     run_id = option_of_yojson (value_for_key id_string_of_yojson "RunId") _list path;
     run_type = option_of_yojson (value_for_key run_type_of_yojson "RunType") _list path;
     started_on = option_of_yojson (value_for_key timestamp_value_of_yojson "StartedOn") _list path;
     created_at = option_of_yojson (value_for_key timestamp_value_of_yojson "CreatedAt") _list path;
     completed_on =
       option_of_yojson (value_for_key timestamp_value_of_yojson "CompletedOn") _list path;
     modified_at =
       option_of_yojson (value_for_key timestamp_value_of_yojson "ModifiedAt") _list path;
     duration =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "Duration")
         _list path;
     error_message =
       option_of_yojson (value_for_key generic_string_of_yojson "ErrorMessage") _list path;
     task_instances =
       option_of_yojson (value_for_key task_instance_ids_of_yojson "TaskInstances") _list path;
     run_state =
       option_of_yojson (value_for_key workflow_run_status_of_yojson "RunState") _list path;
   }
    : workflow_run_detail)

let object_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.document_of_yojson tree path

let get_workflow_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_arn = option_of_yojson (value_for_key workflow_arn_of_yojson "WorkflowArn") _list path;
     workflow_version =
       option_of_yojson (value_for_key version_id_of_yojson "WorkflowVersion") _list path;
     run_id = option_of_yojson (value_for_key id_string_of_yojson "RunId") _list path;
     run_type = option_of_yojson (value_for_key run_type_of_yojson "RunType") _list path;
     override_parameters =
       option_of_yojson (value_for_key object_map_of_yojson "OverrideParameters") _list path;
     run_detail =
       option_of_yojson (value_for_key workflow_run_detail_of_yojson "RunDetail") _list path;
   }
    : get_workflow_run_response)

let get_workflow_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_arn = value_for_key workflow_arn_of_yojson "WorkflowArn" _list path;
     run_id = value_for_key id_string_of_yojson "RunId" _list path;
   }
    : get_workflow_run_request)

let task_instance_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_arn = option_of_yojson (value_for_key workflow_arn_of_yojson "WorkflowArn") _list path;
     workflow_version =
       option_of_yojson (value_for_key version_id_of_yojson "WorkflowVersion") _list path;
     run_id = option_of_yojson (value_for_key id_string_of_yojson "RunId") _list path;
     task_instance_id =
       option_of_yojson (value_for_key id_string_of_yojson "TaskInstanceId") _list path;
     status = option_of_yojson (value_for_key task_instance_status_of_yojson "Status") _list path;
     duration_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "DurationInSeconds")
         _list path;
     operator_name =
       option_of_yojson (value_for_key generic_string_of_yojson "OperatorName") _list path;
   }
    : task_instance_summary)

let task_instance_summaries_of_yojson tree path =
  list_of_yojson task_instance_summary_of_yojson tree path

let list_task_instances_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_instances =
       option_of_yojson (value_for_key task_instance_summaries_of_yojson "TaskInstances") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_task_instances_response)

let list_task_instances_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_arn = value_for_key workflow_arn_of_yojson "WorkflowArn" _list path;
     run_id = value_for_key id_string_of_yojson "RunId" _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_task_instances_request)

let run_detail_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key workflow_run_status_of_yojson "Status") _list path;
     created_on = option_of_yojson (value_for_key timestamp_value_of_yojson "CreatedOn") _list path;
     started_at = option_of_yojson (value_for_key timestamp_value_of_yojson "StartedAt") _list path;
     ended_at = option_of_yojson (value_for_key timestamp_value_of_yojson "EndedAt") _list path;
   }
    : run_detail_summary)

let workflow_run_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     run_id = option_of_yojson (value_for_key id_string_of_yojson "RunId") _list path;
     workflow_arn = option_of_yojson (value_for_key workflow_arn_of_yojson "WorkflowArn") _list path;
     workflow_version =
       option_of_yojson (value_for_key version_id_of_yojson "WorkflowVersion") _list path;
     run_type = option_of_yojson (value_for_key run_type_of_yojson "RunType") _list path;
     run_detail_summary =
       option_of_yojson (value_for_key run_detail_summary_of_yojson "RunDetailSummary") _list path;
   }
    : workflow_run_summary)

let workflow_run_summaries_of_yojson tree path =
  list_of_yojson workflow_run_summary_of_yojson tree path

let list_workflow_runs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_runs =
       option_of_yojson (value_for_key workflow_run_summaries_of_yojson "WorkflowRuns") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_workflow_runs_response)

let list_workflow_runs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     workflow_arn = value_for_key workflow_arn_of_yojson "WorkflowArn" _list path;
     workflow_version =
       option_of_yojson (value_for_key version_id_of_yojson "WorkflowVersion") _list path;
   }
    : list_workflow_runs_request)

let workflow_version_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_version = value_for_key workflow_version_of_yojson "WorkflowVersion" _list path;
     workflow_arn = value_for_key workflow_arn_of_yojson "WorkflowArn" _list path;
     is_latest_version =
       option_of_yojson (value_for_key is_latest_version_of_yojson "IsLatestVersion") _list path;
     created_at = option_of_yojson (value_for_key timestamp_value_of_yojson "CreatedAt") _list path;
     modified_at =
       option_of_yojson (value_for_key timestamp_value_of_yojson "ModifiedAt") _list path;
     definition_s3_location =
       option_of_yojson
         (value_for_key definition_s3_location_of_yojson "DefinitionS3Location")
         _list path;
     schedule_configuration =
       option_of_yojson
         (value_for_key schedule_configuration_of_yojson "ScheduleConfiguration")
         _list path;
     trigger_mode =
       option_of_yojson (value_for_key generic_string_of_yojson "TriggerMode") _list path;
   }
    : workflow_version_summary)

let workflow_version_summaries_of_yojson tree path =
  list_of_yojson workflow_version_summary_of_yojson tree path

let list_workflow_versions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_versions =
       option_of_yojson
         (value_for_key workflow_version_summaries_of_yojson "WorkflowVersions")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_workflow_versions_response)

let list_workflow_versions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     workflow_arn = value_for_key workflow_arn_of_yojson "WorkflowArn" _list path;
   }
    : list_workflow_versions_request)

let workflow_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_arn = value_for_key workflow_arn_of_yojson "WorkflowArn" _list path;
     workflow_version =
       option_of_yojson (value_for_key workflow_version_of_yojson "WorkflowVersion") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     created_at = option_of_yojson (value_for_key timestamp_value_of_yojson "CreatedAt") _list path;
     modified_at =
       option_of_yojson (value_for_key timestamp_value_of_yojson "ModifiedAt") _list path;
     workflow_status =
       option_of_yojson (value_for_key workflow_status_of_yojson "WorkflowStatus") _list path;
     trigger_mode =
       option_of_yojson (value_for_key generic_string_of_yojson "TriggerMode") _list path;
   }
    : workflow_summary)

let workflow_summaries_of_yojson tree path = list_of_yojson workflow_summary_of_yojson tree path

let list_workflows_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflows = value_for_key workflow_summaries_of_yojson "Workflows" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_workflows_response)

let list_workflows_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_workflows_request)

let start_workflow_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     run_id = option_of_yojson (value_for_key id_string_of_yojson "RunId") _list path;
     status = option_of_yojson (value_for_key workflow_run_status_of_yojson "Status") _list path;
     started_at = option_of_yojson (value_for_key timestamp_value_of_yojson "StartedAt") _list path;
   }
    : start_workflow_run_response)

let start_workflow_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_arn = value_for_key workflow_arn_of_yojson "WorkflowArn" _list path;
     client_token =
       option_of_yojson (value_for_key idempotency_token_string_of_yojson "ClientToken") _list path;
     override_parameters =
       option_of_yojson (value_for_key object_map_of_yojson "OverrideParameters") _list path;
     workflow_version =
       option_of_yojson (value_for_key version_id_of_yojson "WorkflowVersion") _list path;
   }
    : start_workflow_run_request)

let stop_workflow_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_arn = option_of_yojson (value_for_key workflow_arn_of_yojson "WorkflowArn") _list path;
     workflow_version =
       option_of_yojson (value_for_key version_id_of_yojson "WorkflowVersion") _list path;
     run_id = option_of_yojson (value_for_key id_string_of_yojson "RunId") _list path;
     status = option_of_yojson (value_for_key workflow_run_status_of_yojson "Status") _list path;
   }
    : stop_workflow_run_response)

let stop_workflow_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_arn = value_for_key workflow_arn_of_yojson "WorkflowArn" _list path;
     run_id = value_for_key id_string_of_yojson "RunId" _list path;
   }
    : stop_workflow_run_request)

let update_workflow_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_arn = value_for_key workflow_arn_of_yojson "WorkflowArn" _list path;
     modified_at =
       option_of_yojson (value_for_key timestamp_value_of_yojson "ModifiedAt") _list path;
     workflow_version =
       option_of_yojson (value_for_key workflow_version_of_yojson "WorkflowVersion") _list path;
     warnings = option_of_yojson (value_for_key warning_messages_of_yojson "Warnings") _list path;
   }
    : update_workflow_response)

let update_workflow_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_arn = value_for_key workflow_arn_of_yojson "WorkflowArn" _list path;
     definition_s3_location =
       value_for_key definition_s3_location_of_yojson "DefinitionS3Location" _list path;
     role_arn = value_for_key role_ar_n_of_yojson "RoleArn" _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     logging_configuration =
       option_of_yojson
         (value_for_key logging_configuration_of_yojson "LoggingConfiguration")
         _list path;
     engine_version =
       option_of_yojson (value_for_key engine_version_of_yojson "EngineVersion") _list path;
     network_configuration =
       option_of_yojson
         (value_for_key network_configuration_of_yojson "NetworkConfiguration")
         _list path;
     trigger_mode =
       option_of_yojson (value_for_key generic_string_of_yojson "TriggerMode") _list path;
   }
    : update_workflow_request)

let workflow_version_arn_of_yojson = string_of_yojson
