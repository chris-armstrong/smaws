open Smaws_Lib.Json.DeserializeHelpers
open Types

let aws_region_name_of_yojson = string_of_yojson
let session_token_of_yojson = string_of_yojson
let secret_access_key_of_yojson = string_of_yojson
let access_key_id_of_yojson = string_of_yojson

let aws_session_credentials_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_key_id = value_for_key access_key_id_of_yojson "accessKeyId" _list path;
     secret_access_key = value_for_key secret_access_key_of_yojson "secretAccessKey" _list path;
     session_token = value_for_key session_token_of_yojson "sessionToken" _list path;
   }
    : aws_session_credentials)

let account_id_of_yojson = string_of_yojson
let message_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : validation_exception)

let job_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : job_not_found_exception)

let invalid_nonce_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_nonce_exception)

let job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Created" -> Created
    | `String "Queued" -> Queued
    | `String "Dispatched" -> Dispatched
    | `String "InProgress" -> InProgress
    | `String "TimedOut" -> TimedOut
    | `String "Succeeded" -> Succeeded
    | `String "Failed" -> Failed
    | `String value -> raise (deserialize_unknown_enum_value_error path "JobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "JobStatus")
     : job_status)
    : job_status)

let acknowledge_job_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = option_of_yojson (value_for_key job_status_of_yojson "status") _list path }
    : acknowledge_job_output)

let nonce_of_yojson = string_of_yojson
let job_id_of_yojson = string_of_yojson

let acknowledge_job_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "jobId" _list path;
     nonce = value_for_key nonce_of_yojson "nonce" _list path;
   }
    : acknowledge_job_input)

let invalid_client_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_client_token_exception)

let acknowledge_third_party_job_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = option_of_yojson (value_for_key job_status_of_yojson "status") _list path }
    : acknowledge_third_party_job_output)

let client_token_of_yojson = string_of_yojson
let third_party_job_id_of_yojson = string_of_yojson

let acknowledge_third_party_job_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key third_party_job_id_of_yojson "jobId" _list path;
     nonce = value_for_key nonce_of_yojson "nonce" _list path;
     client_token = value_for_key client_token_of_yojson "clientToken" _list path;
   }
    : acknowledge_third_party_job_input)

let action_category_of_yojson (tree : t) path =
  ((match tree with
    | `String "Source" -> Source
    | `String "Build" -> Build
    | `String "Deploy" -> Deploy
    | `String "Test" -> Test
    | `String "Invoke" -> Invoke
    | `String "Approval" -> Approval
    | `String "Compute" -> Compute
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActionCategory" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionCategory")
     : action_category)
    : action_category)

let action_configuration_value_of_yojson = string_of_yojson
let action_configuration_key_of_yojson = string_of_yojson

let action_configuration_map_of_yojson tree path =
  map_of_yojson action_configuration_key_of_yojson action_configuration_value_of_yojson tree path

let action_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key action_configuration_map_of_yojson "configuration")
         _list path;
   }
    : action_configuration)

let action_configuration_property_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "String" -> String
    | `String "Number" -> Number
    | `String "Boolean" -> Boolean
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ActionConfigurationPropertyType" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionConfigurationPropertyType")
     : action_configuration_property_type)
    : action_configuration_property_type)

let description_of_yojson = string_of_yojson
let boolean__of_yojson = bool_of_yojson

let action_configuration_property_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key action_configuration_key_of_yojson "name" _list path;
     required = value_for_key boolean__of_yojson "required" _list path;
     key = value_for_key boolean__of_yojson "key" _list path;
     secret = value_for_key boolean__of_yojson "secret" _list path;
     queryable = option_of_yojson (value_for_key boolean__of_yojson "queryable") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     type_ =
       option_of_yojson
         (value_for_key action_configuration_property_type_of_yojson "type")
         _list path;
   }
    : action_configuration_property)

let action_configuration_property_list_of_yojson tree path =
  list_of_yojson action_configuration_property_of_yojson tree path

let action_configuration_queryable_value_of_yojson = string_of_yojson
let action_execution_id_of_yojson = string_of_yojson
let action_name_of_yojson = string_of_yojson

let action_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key action_name_of_yojson "name") _list path;
     action_execution_id =
       option_of_yojson (value_for_key action_execution_id_of_yojson "actionExecutionId") _list path;
   }
    : action_context)

let environment_variable_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PLAINTEXT" -> PLAINTEXT
    | `String "SECRETS_MANAGER" -> SECRETS_MANAGER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EnvironmentVariableType" value)
    | _ -> raise (deserialize_wrong_type_error path "EnvironmentVariableType")
     : environment_variable_type)
    : environment_variable_type)

let environment_variable_value_of_yojson = string_of_yojson
let environment_variable_name_of_yojson = string_of_yojson

let environment_variable_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key environment_variable_name_of_yojson "name" _list path;
     value = value_for_key environment_variable_value_of_yojson "value" _list path;
     type_ = option_of_yojson (value_for_key environment_variable_type_of_yojson "type") _list path;
   }
    : environment_variable)

let environment_variable_list_of_yojson tree path =
  list_of_yojson environment_variable_of_yojson tree path

let action_timeout_of_yojson = int_of_yojson
let action_namespace_of_yojson = string_of_yojson
let role_arn_of_yojson = string_of_yojson
let output_variable_of_yojson = string_of_yojson
let output_variable_list_of_yojson tree path = list_of_yojson output_variable_of_yojson tree path
let artifact_name_of_yojson = string_of_yojson

let input_artifact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key artifact_name_of_yojson "name" _list path } : input_artifact)

let input_artifact_list_of_yojson tree path = list_of_yojson input_artifact_of_yojson tree path
let file_path_of_yojson = string_of_yojson
let file_path_list_of_yojson tree path = list_of_yojson file_path_of_yojson tree path

let output_artifact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key artifact_name_of_yojson "name" _list path;
     files = option_of_yojson (value_for_key file_path_list_of_yojson "files") _list path;
   }
    : output_artifact)

let output_artifact_list_of_yojson tree path = list_of_yojson output_artifact_of_yojson tree path
let command_of_yojson = string_of_yojson
let command_list_of_yojson tree path = list_of_yojson command_of_yojson tree path
let action_run_order_of_yojson = int_of_yojson
let version_of_yojson = string_of_yojson
let action_provider_of_yojson = string_of_yojson

let action_owner_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS" -> AWS
    | `String "ThirdParty" -> ThirdParty
    | `String "Custom" -> Custom
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActionOwner" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionOwner")
     : action_owner)
    : action_owner)

let action_type_id_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     category = value_for_key action_category_of_yojson "category" _list path;
     owner = value_for_key action_owner_of_yojson "owner" _list path;
     provider = value_for_key action_provider_of_yojson "provider" _list path;
     version = value_for_key version_of_yojson "version" _list path;
   }
    : action_type_id)

let action_declaration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key action_name_of_yojson "name" _list path;
     action_type_id = value_for_key action_type_id_of_yojson "actionTypeId" _list path;
     run_order = option_of_yojson (value_for_key action_run_order_of_yojson "runOrder") _list path;
     configuration =
       option_of_yojson
         (value_for_key action_configuration_map_of_yojson "configuration")
         _list path;
     commands = option_of_yojson (value_for_key command_list_of_yojson "commands") _list path;
     output_artifacts =
       option_of_yojson (value_for_key output_artifact_list_of_yojson "outputArtifacts") _list path;
     input_artifacts =
       option_of_yojson (value_for_key input_artifact_list_of_yojson "inputArtifacts") _list path;
     output_variables =
       option_of_yojson (value_for_key output_variable_list_of_yojson "outputVariables") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "roleArn") _list path;
     region = option_of_yojson (value_for_key aws_region_name_of_yojson "region") _list path;
     namespace = option_of_yojson (value_for_key action_namespace_of_yojson "namespace") _list path;
     timeout_in_minutes =
       option_of_yojson (value_for_key action_timeout_of_yojson "timeoutInMinutes") _list path;
     environment_variables =
       option_of_yojson
         (value_for_key environment_variable_list_of_yojson "environmentVariables")
         _list path;
   }
    : action_declaration)

let log_stream_ar_n_of_yojson = string_of_yojson
let code_of_yojson = string_of_yojson

let error_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code = option_of_yojson (value_for_key code_of_yojson "code") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
   }
    : error_details)

let percentage_of_yojson = int_of_yojson
let url_of_yojson = string_of_yojson
let execution_id_of_yojson = string_of_yojson
let last_updated_by_of_yojson = string_of_yojson
let action_execution_token_of_yojson = string_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let execution_summary_of_yojson = string_of_yojson

let action_execution_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "InProgress" -> InProgress
    | `String "Abandoned" -> Abandoned
    | `String "Succeeded" -> Succeeded
    | `String "Failed" -> Failed
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ActionExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionExecutionStatus")
     : action_execution_status)
    : action_execution_status)

let action_execution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_execution_id =
       option_of_yojson (value_for_key action_execution_id_of_yojson "actionExecutionId") _list path;
     status = option_of_yojson (value_for_key action_execution_status_of_yojson "status") _list path;
     summary = option_of_yojson (value_for_key execution_summary_of_yojson "summary") _list path;
     last_status_change =
       option_of_yojson (value_for_key timestamp_of_yojson "lastStatusChange") _list path;
     token = option_of_yojson (value_for_key action_execution_token_of_yojson "token") _list path;
     last_updated_by =
       option_of_yojson (value_for_key last_updated_by_of_yojson "lastUpdatedBy") _list path;
     external_execution_id =
       option_of_yojson (value_for_key execution_id_of_yojson "externalExecutionId") _list path;
     external_execution_url =
       option_of_yojson (value_for_key url_of_yojson "externalExecutionUrl") _list path;
     percent_complete =
       option_of_yojson (value_for_key percentage_of_yojson "percentComplete") _list path;
     error_details =
       option_of_yojson (value_for_key error_details_of_yojson "errorDetails") _list path;
     log_stream_ar_n =
       option_of_yojson (value_for_key log_stream_ar_n_of_yojson "logStreamARN") _list path;
   }
    : action_execution)

let output_variables_value_of_yojson = string_of_yojson
let output_variables_key_of_yojson = string_of_yojson

let output_variables_map_of_yojson tree path =
  map_of_yojson output_variables_key_of_yojson output_variables_value_of_yojson tree path

let external_execution_summary_of_yojson = string_of_yojson
let external_execution_id_of_yojson = string_of_yojson

let action_execution_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     external_execution_id =
       option_of_yojson
         (value_for_key external_execution_id_of_yojson "externalExecutionId")
         _list path;
     external_execution_summary =
       option_of_yojson
         (value_for_key external_execution_summary_of_yojson "externalExecutionSummary")
         _list path;
     external_execution_url =
       option_of_yojson (value_for_key url_of_yojson "externalExecutionUrl") _list path;
     error_details =
       option_of_yojson (value_for_key error_details_of_yojson "errorDetails") _list path;
     log_stream_ar_n =
       option_of_yojson (value_for_key log_stream_ar_n_of_yojson "logStreamARN") _list path;
   }
    : action_execution_result)

let s3_key_of_yojson = string_of_yojson
let s3_bucket_of_yojson = string_of_yojson

let s3_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket = option_of_yojson (value_for_key s3_bucket_of_yojson "bucket") _list path;
     key = option_of_yojson (value_for_key s3_key_of_yojson "key") _list path;
   }
    : s3_location)

let artifact_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key artifact_name_of_yojson "name") _list path;
     s3location = option_of_yojson (value_for_key s3_location_of_yojson "s3location") _list path;
   }
    : artifact_detail)

let artifact_detail_list_of_yojson tree path = list_of_yojson artifact_detail_of_yojson tree path

let action_execution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_artifacts =
       option_of_yojson (value_for_key artifact_detail_list_of_yojson "outputArtifacts") _list path;
     execution_result =
       option_of_yojson
         (value_for_key action_execution_result_of_yojson "executionResult")
         _list path;
     output_variables =
       option_of_yojson (value_for_key output_variables_map_of_yojson "outputVariables") _list path;
   }
    : action_execution_output)

let string__of_yojson = string_of_yojson

let resolved_action_configuration_map_of_yojson tree path =
  map_of_yojson string__of_yojson string__of_yojson tree path

let action_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_type_id =
       option_of_yojson (value_for_key action_type_id_of_yojson "actionTypeId") _list path;
     configuration =
       option_of_yojson
         (value_for_key action_configuration_map_of_yojson "configuration")
         _list path;
     resolved_configuration =
       option_of_yojson
         (value_for_key resolved_action_configuration_map_of_yojson "resolvedConfiguration")
         _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "roleArn") _list path;
     region = option_of_yojson (value_for_key aws_region_name_of_yojson "region") _list path;
     input_artifacts =
       option_of_yojson (value_for_key artifact_detail_list_of_yojson "inputArtifacts") _list path;
     namespace = option_of_yojson (value_for_key action_namespace_of_yojson "namespace") _list path;
   }
    : action_execution_input)

let stage_name_of_yojson = string_of_yojson
let pipeline_version_of_yojson = int_of_yojson
let pipeline_execution_id_of_yojson = string_of_yojson

let action_execution_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_execution_id =
       option_of_yojson
         (value_for_key pipeline_execution_id_of_yojson "pipelineExecutionId")
         _list path;
     action_execution_id =
       option_of_yojson (value_for_key action_execution_id_of_yojson "actionExecutionId") _list path;
     pipeline_version =
       option_of_yojson (value_for_key pipeline_version_of_yojson "pipelineVersion") _list path;
     stage_name = option_of_yojson (value_for_key stage_name_of_yojson "stageName") _list path;
     action_name = option_of_yojson (value_for_key action_name_of_yojson "actionName") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     last_update_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdateTime") _list path;
     updated_by = option_of_yojson (value_for_key last_updated_by_of_yojson "updatedBy") _list path;
     status = option_of_yojson (value_for_key action_execution_status_of_yojson "status") _list path;
     input = option_of_yojson (value_for_key action_execution_input_of_yojson "input") _list path;
     output = option_of_yojson (value_for_key action_execution_output_of_yojson "output") _list path;
   }
    : action_execution_detail)

let action_execution_detail_list_of_yojson tree path =
  list_of_yojson action_execution_detail_of_yojson tree path

let start_time_range_of_yojson (tree : t) path =
  ((match tree with
    | `String "Latest" -> Latest
    | `String "All" -> All
    | `String value -> raise (deserialize_unknown_enum_value_error path "StartTimeRange" value)
    | _ -> raise (deserialize_wrong_type_error path "StartTimeRange")
     : start_time_range)
    : start_time_range)

let latest_in_pipeline_execution_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_execution_id =
       value_for_key pipeline_execution_id_of_yojson "pipelineExecutionId" _list path;
     start_time_range = value_for_key start_time_range_of_yojson "startTimeRange" _list path;
   }
    : latest_in_pipeline_execution_filter)

let action_execution_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_execution_id =
       option_of_yojson
         (value_for_key pipeline_execution_id_of_yojson "pipelineExecutionId")
         _list path;
     latest_in_pipeline_execution =
       option_of_yojson
         (value_for_key latest_in_pipeline_execution_filter_of_yojson "latestInPipelineExecution")
         _list path;
   }
    : action_execution_filter)

let action_execution_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : action_execution_not_found_exception)

let action_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : action_not_found_exception)

let revision_change_identifier_of_yojson = string_of_yojson
let revision_of_yojson = string_of_yojson

let action_revision_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revision_id = value_for_key revision_of_yojson "revisionId" _list path;
     revision_change_id =
       value_for_key revision_change_identifier_of_yojson "revisionChangeId" _list path;
     created = value_for_key timestamp_of_yojson "created" _list path;
   }
    : action_revision)

let action_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_name = option_of_yojson (value_for_key action_name_of_yojson "actionName") _list path;
     current_revision =
       option_of_yojson (value_for_key action_revision_of_yojson "currentRevision") _list path;
     latest_execution =
       option_of_yojson (value_for_key action_execution_of_yojson "latestExecution") _list path;
     entity_url = option_of_yojson (value_for_key url_of_yojson "entityUrl") _list path;
     revision_url = option_of_yojson (value_for_key url_of_yojson "revisionUrl") _list path;
   }
    : action_state)

let action_state_list_of_yojson tree path = list_of_yojson action_state_of_yojson tree path
let maximum_artifact_count_of_yojson = int_of_yojson
let minimum_artifact_count_of_yojson = int_of_yojson

let artifact_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     minimum_count = value_for_key minimum_artifact_count_of_yojson "minimumCount" _list path;
     maximum_count = value_for_key maximum_artifact_count_of_yojson "maximumCount" _list path;
   }
    : artifact_details)

let url_template_of_yojson = string_of_yojson

let action_type_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     third_party_configuration_url =
       option_of_yojson (value_for_key url_of_yojson "thirdPartyConfigurationUrl") _list path;
     entity_url_template =
       option_of_yojson (value_for_key url_template_of_yojson "entityUrlTemplate") _list path;
     execution_url_template =
       option_of_yojson (value_for_key url_template_of_yojson "executionUrlTemplate") _list path;
     revision_url_template =
       option_of_yojson (value_for_key url_template_of_yojson "revisionUrlTemplate") _list path;
   }
    : action_type_settings)

let action_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key action_type_id_of_yojson "id" _list path;
     settings =
       option_of_yojson (value_for_key action_type_settings_of_yojson "settings") _list path;
     action_configuration_properties =
       option_of_yojson
         (value_for_key action_configuration_property_list_of_yojson "actionConfigurationProperties")
         _list path;
     input_artifact_details =
       value_for_key artifact_details_of_yojson "inputArtifactDetails" _list path;
     output_artifact_details =
       value_for_key artifact_details_of_yojson "outputArtifactDetails" _list path;
   }
    : action_type)

let maximum_action_type_artifact_count_of_yojson = int_of_yojson
let minimum_action_type_artifact_count_of_yojson = int_of_yojson

let action_type_artifact_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     minimum_count =
       value_for_key minimum_action_type_artifact_count_of_yojson "minimumCount" _list path;
     maximum_count =
       value_for_key maximum_action_type_artifact_count_of_yojson "maximumCount" _list path;
   }
    : action_type_artifact_details)

let action_type_urls_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_url =
       option_of_yojson (value_for_key url_of_yojson "configurationUrl") _list path;
     entity_url_template =
       option_of_yojson (value_for_key url_template_of_yojson "entityUrlTemplate") _list path;
     execution_url_template =
       option_of_yojson (value_for_key url_template_of_yojson "executionUrlTemplate") _list path;
     revision_url_template =
       option_of_yojson (value_for_key url_template_of_yojson "revisionUrlTemplate") _list path;
   }
    : action_type_urls)

let property_description_of_yojson = string_of_yojson

let action_type_property_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key action_configuration_key_of_yojson "name" _list path;
     optional = value_for_key boolean__of_yojson "optional" _list path;
     key = value_for_key boolean__of_yojson "key" _list path;
     no_echo = value_for_key boolean__of_yojson "noEcho" _list path;
     queryable = option_of_yojson (value_for_key boolean__of_yojson "queryable") _list path;
     description =
       option_of_yojson (value_for_key property_description_of_yojson "description") _list path;
   }
    : action_type_property)

let action_type_properties_of_yojson tree path =
  list_of_yojson action_type_property_of_yojson tree path

let allowed_account_of_yojson = string_of_yojson
let allowed_accounts_of_yojson tree path = list_of_yojson allowed_account_of_yojson tree path

let action_type_permissions_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ allowed_accounts = value_for_key allowed_accounts_of_yojson "allowedAccounts" _list path }
    : action_type_permissions)

let action_type_owner_of_yojson = string_of_yojson

let action_type_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     category = value_for_key action_category_of_yojson "category" _list path;
     owner = value_for_key action_type_owner_of_yojson "owner" _list path;
     provider = value_for_key action_provider_of_yojson "provider" _list path;
     version = value_for_key version_of_yojson "version" _list path;
   }
    : action_type_identifier)

let job_timeout_of_yojson = int_of_yojson
let policy_statements_template_of_yojson = string_of_yojson

let executor_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "JobWorker" -> JobWorker
    | `String "Lambda" -> Lambda
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutorType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutorType")
     : executor_type)
    : executor_type)

let service_principal_of_yojson = string_of_yojson

let polling_service_principal_list_of_yojson tree path =
  list_of_yojson service_principal_of_yojson tree path

let polling_account_list_of_yojson tree path = list_of_yojson account_id_of_yojson tree path

let job_worker_executor_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     polling_accounts =
       option_of_yojson (value_for_key polling_account_list_of_yojson "pollingAccounts") _list path;
     polling_service_principals =
       option_of_yojson
         (value_for_key polling_service_principal_list_of_yojson "pollingServicePrincipals")
         _list path;
   }
    : job_worker_executor_configuration)

let lambda_function_arn_of_yojson = string_of_yojson

let lambda_executor_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lambda_function_arn =
       value_for_key lambda_function_arn_of_yojson "lambdaFunctionArn" _list path;
   }
    : lambda_executor_configuration)

let executor_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lambda_executor_configuration =
       option_of_yojson
         (value_for_key lambda_executor_configuration_of_yojson "lambdaExecutorConfiguration")
         _list path;
     job_worker_executor_configuration =
       option_of_yojson
         (value_for_key job_worker_executor_configuration_of_yojson "jobWorkerExecutorConfiguration")
         _list path;
   }
    : executor_configuration)

let action_type_executor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration = value_for_key executor_configuration_of_yojson "configuration" _list path;
     type_ = value_for_key executor_type_of_yojson "type" _list path;
     policy_statements_template =
       option_of_yojson
         (value_for_key policy_statements_template_of_yojson "policyStatementsTemplate")
         _list path;
     job_timeout = option_of_yojson (value_for_key job_timeout_of_yojson "jobTimeout") _list path;
   }
    : action_type_executor)

let action_type_description_of_yojson = string_of_yojson

let action_type_declaration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key action_type_description_of_yojson "description") _list path;
     executor = value_for_key action_type_executor_of_yojson "executor" _list path;
     id = value_for_key action_type_identifier_of_yojson "id" _list path;
     input_artifact_details =
       value_for_key action_type_artifact_details_of_yojson "inputArtifactDetails" _list path;
     output_artifact_details =
       value_for_key action_type_artifact_details_of_yojson "outputArtifactDetails" _list path;
     permissions =
       option_of_yojson (value_for_key action_type_permissions_of_yojson "permissions") _list path;
     properties =
       option_of_yojson (value_for_key action_type_properties_of_yojson "properties") _list path;
     urls = option_of_yojson (value_for_key action_type_urls_of_yojson "urls") _list path;
   }
    : action_type_declaration)

let action_type_list_of_yojson tree path = list_of_yojson action_type_of_yojson tree path

let action_type_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : action_type_not_found_exception)

let approval_already_completed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : approval_already_completed_exception)

let approval_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Approved" -> Approved
    | `String "Rejected" -> Rejected
    | `String value -> raise (deserialize_unknown_enum_value_error path "ApprovalStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ApprovalStatus")
     : approval_status)
    : approval_status)

let approval_summary_of_yojson = string_of_yojson

let approval_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary = value_for_key approval_summary_of_yojson "summary" _list path;
     status = value_for_key approval_status_of_yojson "status" _list path;
   }
    : approval_result)

let approval_token_of_yojson = string_of_yojson
let s3_object_key_of_yojson = string_of_yojson
let s3_bucket_name_of_yojson = string_of_yojson

let s3_artifact_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket_name = value_for_key s3_bucket_name_of_yojson "bucketName" _list path;
     object_key = value_for_key s3_object_key_of_yojson "objectKey" _list path;
   }
    : s3_artifact_location)

let artifact_location_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "S3" -> S3
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ArtifactLocationType" value)
    | _ -> raise (deserialize_wrong_type_error path "ArtifactLocationType")
     : artifact_location_type)
    : artifact_location_type)

let artifact_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key artifact_location_type_of_yojson "type") _list path;
     s3_location =
       option_of_yojson (value_for_key s3_artifact_location_of_yojson "s3Location") _list path;
   }
    : artifact_location)

let artifact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key artifact_name_of_yojson "name") _list path;
     revision = option_of_yojson (value_for_key revision_of_yojson "revision") _list path;
     location = option_of_yojson (value_for_key artifact_location_of_yojson "location") _list path;
   }
    : artifact)

let artifact_list_of_yojson tree path = list_of_yojson artifact_of_yojson tree path
let revision_summary_of_yojson = string_of_yojson

let artifact_revision_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key artifact_name_of_yojson "name") _list path;
     revision_id = option_of_yojson (value_for_key revision_of_yojson "revisionId") _list path;
     revision_change_identifier =
       option_of_yojson
         (value_for_key revision_change_identifier_of_yojson "revisionChangeIdentifier")
         _list path;
     revision_summary =
       option_of_yojson (value_for_key revision_summary_of_yojson "revisionSummary") _list path;
     created = option_of_yojson (value_for_key timestamp_of_yojson "created") _list path;
     revision_url = option_of_yojson (value_for_key url_of_yojson "revisionUrl") _list path;
   }
    : artifact_revision)

let artifact_revision_list_of_yojson tree path =
  list_of_yojson artifact_revision_of_yojson tree path

let encryption_key_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "KMS" -> KMS
    | `String value -> raise (deserialize_unknown_enum_value_error path "EncryptionKeyType" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionKeyType")
     : encryption_key_type)
    : encryption_key_type)

let encryption_key_id_of_yojson = string_of_yojson

let encryption_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key encryption_key_id_of_yojson "id" _list path;
     type_ = value_for_key encryption_key_type_of_yojson "type" _list path;
   }
    : encryption_key)

let artifact_store_location_of_yojson = string_of_yojson

let artifact_store_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "S3" -> S3
    | `String value -> raise (deserialize_unknown_enum_value_error path "ArtifactStoreType" value)
    | _ -> raise (deserialize_wrong_type_error path "ArtifactStoreType")
     : artifact_store_type)
    : artifact_store_type)

let artifact_store_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key artifact_store_type_of_yojson "type" _list path;
     location = value_for_key artifact_store_location_of_yojson "location" _list path;
     encryption_key =
       option_of_yojson (value_for_key encryption_key_of_yojson "encryptionKey") _list path;
   }
    : artifact_store)

let artifact_store_map_of_yojson tree path =
  map_of_yojson aws_region_name_of_yojson artifact_store_of_yojson tree path

let rule_timeout_of_yojson = int_of_yojson
let rule_configuration_value_of_yojson = string_of_yojson
let rule_configuration_key_of_yojson = string_of_yojson

let rule_configuration_map_of_yojson tree path =
  map_of_yojson rule_configuration_key_of_yojson rule_configuration_value_of_yojson tree path

let rule_provider_of_yojson = string_of_yojson

let rule_owner_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS" -> AWS
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleOwner" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleOwner")
     : rule_owner)
    : rule_owner)

let rule_category_of_yojson (tree : t) path =
  ((match tree with
    | `String "Rule" -> Rule
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleCategory" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleCategory")
     : rule_category)
    : rule_category)

let rule_type_id_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     category = value_for_key rule_category_of_yojson "category" _list path;
     owner = option_of_yojson (value_for_key rule_owner_of_yojson "owner") _list path;
     provider = value_for_key rule_provider_of_yojson "provider" _list path;
     version = option_of_yojson (value_for_key version_of_yojson "version") _list path;
   }
    : rule_type_id)

let rule_name_of_yojson = string_of_yojson

let rule_declaration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key rule_name_of_yojson "name" _list path;
     rule_type_id = value_for_key rule_type_id_of_yojson "ruleTypeId" _list path;
     configuration =
       option_of_yojson (value_for_key rule_configuration_map_of_yojson "configuration") _list path;
     commands = option_of_yojson (value_for_key command_list_of_yojson "commands") _list path;
     input_artifacts =
       option_of_yojson (value_for_key input_artifact_list_of_yojson "inputArtifacts") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "roleArn") _list path;
     region = option_of_yojson (value_for_key aws_region_name_of_yojson "region") _list path;
     timeout_in_minutes =
       option_of_yojson (value_for_key rule_timeout_of_yojson "timeoutInMinutes") _list path;
   }
    : rule_declaration)

let rule_declaration_list_of_yojson tree path = list_of_yojson rule_declaration_of_yojson tree path

let result__of_yojson (tree : t) path =
  ((match tree with
    | `String "ROLLBACK" -> ROLLBACK
    | `String "FAIL" -> FAIL
    | `String "RETRY" -> RETRY
    | `String "SKIP" -> SKIP
    | `String value -> raise (deserialize_unknown_enum_value_error path "Result" value)
    | _ -> raise (deserialize_wrong_type_error path "Result")
     : result_)
    : result_)

let condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     result_ = option_of_yojson (value_for_key result__of_yojson "result") _list path;
     rules = option_of_yojson (value_for_key rule_declaration_list_of_yojson "rules") _list path;
   }
    : condition)

let condition_list_of_yojson tree path = list_of_yojson condition_of_yojson tree path

let before_entry_conditions_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ conditions = value_for_key condition_list_of_yojson "conditions" _list path }
    : before_entry_conditions)

let blocker_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Schedule" -> Schedule
    | `String value -> raise (deserialize_unknown_enum_value_error path "BlockerType" value)
    | _ -> raise (deserialize_wrong_type_error path "BlockerType")
     : blocker_type)
    : blocker_type)

let blocker_name_of_yojson = string_of_yojson

let blocker_declaration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key blocker_name_of_yojson "name" _list path;
     type_ = value_for_key blocker_type_of_yojson "type" _list path;
   }
    : blocker_declaration)

let client_id_of_yojson = string_of_yojson
let client_request_token_of_yojson = string_of_yojson

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : limit_exceeded_exception)

let invalid_structure_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_structure_exception)

let invalid_stage_declaration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_stage_declaration_exception)

let invalid_blocker_declaration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_blocker_declaration_exception)

let invalid_action_declaration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_action_declaration_exception)

let git_file_path_pattern_of_yojson = string_of_yojson

let git_file_path_pattern_list_of_yojson tree path =
  list_of_yojson git_file_path_pattern_of_yojson tree path

let git_file_path_filter_criteria_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     includes =
       option_of_yojson (value_for_key git_file_path_pattern_list_of_yojson "includes") _list path;
     excludes =
       option_of_yojson (value_for_key git_file_path_pattern_list_of_yojson "excludes") _list path;
   }
    : git_file_path_filter_criteria)

let git_branch_name_pattern_of_yojson = string_of_yojson

let git_branch_pattern_list_of_yojson tree path =
  list_of_yojson git_branch_name_pattern_of_yojson tree path

let git_branch_filter_criteria_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     includes =
       option_of_yojson (value_for_key git_branch_pattern_list_of_yojson "includes") _list path;
     excludes =
       option_of_yojson (value_for_key git_branch_pattern_list_of_yojson "excludes") _list path;
   }
    : git_branch_filter_criteria)

let git_pull_request_event_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "OPEN" -> OPEN
    | `String "UPDATED" -> UPDATED
    | `String "CLOSED" -> CLOSED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GitPullRequestEventType" value)
    | _ -> raise (deserialize_wrong_type_error path "GitPullRequestEventType")
     : git_pull_request_event_type)
    : git_pull_request_event_type)

let git_pull_request_event_type_list_of_yojson tree path =
  list_of_yojson git_pull_request_event_type_of_yojson tree path

let git_pull_request_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     events =
       option_of_yojson
         (value_for_key git_pull_request_event_type_list_of_yojson "events")
         _list path;
     branches =
       option_of_yojson (value_for_key git_branch_filter_criteria_of_yojson "branches") _list path;
     file_paths =
       option_of_yojson
         (value_for_key git_file_path_filter_criteria_of_yojson "filePaths")
         _list path;
   }
    : git_pull_request_filter)

let git_pull_request_filter_list_of_yojson tree path =
  list_of_yojson git_pull_request_filter_of_yojson tree path

let git_tag_name_pattern_of_yojson = string_of_yojson

let git_tag_pattern_list_of_yojson tree path =
  list_of_yojson git_tag_name_pattern_of_yojson tree path

let git_tag_filter_criteria_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     includes =
       option_of_yojson (value_for_key git_tag_pattern_list_of_yojson "includes") _list path;
     excludes =
       option_of_yojson (value_for_key git_tag_pattern_list_of_yojson "excludes") _list path;
   }
    : git_tag_filter_criteria)

let git_push_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key git_tag_filter_criteria_of_yojson "tags") _list path;
     branches =
       option_of_yojson (value_for_key git_branch_filter_criteria_of_yojson "branches") _list path;
     file_paths =
       option_of_yojson
         (value_for_key git_file_path_filter_criteria_of_yojson "filePaths")
         _list path;
   }
    : git_push_filter)

let git_push_filter_list_of_yojson tree path = list_of_yojson git_push_filter_of_yojson tree path

let git_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_action_name = value_for_key action_name_of_yojson "sourceActionName" _list path;
     push = option_of_yojson (value_for_key git_push_filter_list_of_yojson "push") _list path;
     pull_request =
       option_of_yojson
         (value_for_key git_pull_request_filter_list_of_yojson "pullRequest")
         _list path;
   }
    : git_configuration)

let pipeline_trigger_provider_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CodeStarSourceConnection" -> CodeStarSourceConnection
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PipelineTriggerProviderType" value)
    | _ -> raise (deserialize_wrong_type_error path "PipelineTriggerProviderType")
     : pipeline_trigger_provider_type)
    : pipeline_trigger_provider_type)

let pipeline_trigger_declaration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provider_type =
       value_for_key pipeline_trigger_provider_type_of_yojson "providerType" _list path;
     git_configuration = value_for_key git_configuration_of_yojson "gitConfiguration" _list path;
   }
    : pipeline_trigger_declaration)

let pipeline_trigger_declaration_list_of_yojson tree path =
  list_of_yojson pipeline_trigger_declaration_of_yojson tree path

let pipeline_variable_description_of_yojson = string_of_yojson
let pipeline_variable_value_of_yojson = string_of_yojson
let pipeline_variable_name_of_yojson = string_of_yojson

let pipeline_variable_declaration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key pipeline_variable_name_of_yojson "name" _list path;
     default_value =
       option_of_yojson (value_for_key pipeline_variable_value_of_yojson "defaultValue") _list path;
     description =
       option_of_yojson
         (value_for_key pipeline_variable_description_of_yojson "description")
         _list path;
   }
    : pipeline_variable_declaration)

let pipeline_variable_declaration_list_of_yojson tree path =
  list_of_yojson pipeline_variable_declaration_of_yojson tree path

let pipeline_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "V1" -> V1
    | `String "V2" -> V2
    | `String value -> raise (deserialize_unknown_enum_value_error path "PipelineType" value)
    | _ -> raise (deserialize_wrong_type_error path "PipelineType")
     : pipeline_type)
    : pipeline_type)

let execution_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "QUEUED" -> QUEUED
    | `String "SUPERSEDED" -> SUPERSEDED
    | `String "PARALLEL" -> PARALLEL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionMode" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionMode")
     : execution_mode)
    : execution_mode)

let success_conditions_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ conditions = value_for_key condition_list_of_yojson "conditions" _list path }
    : success_conditions)

let stage_retry_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED_ACTIONS" -> FAILED_ACTIONS
    | `String "ALL_ACTIONS" -> ALL_ACTIONS
    | `String value -> raise (deserialize_unknown_enum_value_error path "StageRetryMode" value)
    | _ -> raise (deserialize_wrong_type_error path "StageRetryMode")
     : stage_retry_mode)
    : stage_retry_mode)

let retry_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_mode = option_of_yojson (value_for_key stage_retry_mode_of_yojson "retryMode") _list path;
   }
    : retry_configuration)

let failure_conditions_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     result_ = option_of_yojson (value_for_key result__of_yojson "result") _list path;
     retry_configuration =
       option_of_yojson
         (value_for_key retry_configuration_of_yojson "retryConfiguration")
         _list path;
     conditions = option_of_yojson (value_for_key condition_list_of_yojson "conditions") _list path;
   }
    : failure_conditions)

let stage_action_declaration_list_of_yojson tree path =
  list_of_yojson action_declaration_of_yojson tree path

let stage_blocker_declaration_list_of_yojson tree path =
  list_of_yojson blocker_declaration_of_yojson tree path

let stage_declaration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key stage_name_of_yojson "name" _list path;
     blockers =
       option_of_yojson
         (value_for_key stage_blocker_declaration_list_of_yojson "blockers")
         _list path;
     actions = value_for_key stage_action_declaration_list_of_yojson "actions" _list path;
     on_failure =
       option_of_yojson (value_for_key failure_conditions_of_yojson "onFailure") _list path;
     on_success =
       option_of_yojson (value_for_key success_conditions_of_yojson "onSuccess") _list path;
     before_entry =
       option_of_yojson (value_for_key before_entry_conditions_of_yojson "beforeEntry") _list path;
   }
    : stage_declaration)

let pipeline_stage_declaration_list_of_yojson tree path =
  list_of_yojson stage_declaration_of_yojson tree path

let pipeline_name_of_yojson = string_of_yojson

let pipeline_declaration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key pipeline_name_of_yojson "name" _list path;
     role_arn = value_for_key role_arn_of_yojson "roleArn" _list path;
     artifact_store =
       option_of_yojson (value_for_key artifact_store_of_yojson "artifactStore") _list path;
     artifact_stores =
       option_of_yojson (value_for_key artifact_store_map_of_yojson "artifactStores") _list path;
     stages = value_for_key pipeline_stage_declaration_list_of_yojson "stages" _list path;
     version = option_of_yojson (value_for_key pipeline_version_of_yojson "version") _list path;
     execution_mode =
       option_of_yojson (value_for_key execution_mode_of_yojson "executionMode") _list path;
     pipeline_type =
       option_of_yojson (value_for_key pipeline_type_of_yojson "pipelineType") _list path;
     variables =
       option_of_yojson
         (value_for_key pipeline_variable_declaration_list_of_yojson "variables")
         _list path;
     triggers =
       option_of_yojson
         (value_for_key pipeline_trigger_declaration_list_of_yojson "triggers")
         _list path;
   }
    : pipeline_declaration)

let update_pipeline_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline =
       option_of_yojson (value_for_key pipeline_declaration_of_yojson "pipeline") _list path;
   }
    : update_pipeline_output)

let update_pipeline_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pipeline = value_for_key pipeline_declaration_of_yojson "pipeline" _list path }
    : update_pipeline_input)

let request_failed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : request_failed_exception)

let update_action_type_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ action_type = value_for_key action_type_declaration_of_yojson "actionType" _list path }
    : update_action_type_input)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : resource_not_found_exception)

let invalid_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_tags_exception)

let invalid_arn_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_arn_exception)

let concurrent_modification_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : concurrent_modification_exception)

let untag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path
let resource_arn_of_yojson = string_of_yojson

let untag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "tagKeys" _list path;
   }
    : untag_resource_input)

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : too_many_tags_exception)

let tag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "key" _list path;
     value = value_for_key tag_value_of_yojson "value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
     tags = value_for_key tag_list_of_yojson "tags" _list path;
   }
    : tag_resource_input)

let pipeline_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : pipeline_not_found_exception)

let pipeline_execution_not_stoppable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : pipeline_execution_not_stoppable_exception)

let duplicated_stop_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : duplicated_stop_request_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : conflict_exception)

let stop_pipeline_execution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_execution_id =
       option_of_yojson
         (value_for_key pipeline_execution_id_of_yojson "pipelineExecutionId")
         _list path;
   }
    : stop_pipeline_execution_output)

let stop_pipeline_execution_reason_of_yojson = string_of_yojson

let stop_pipeline_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_name = value_for_key pipeline_name_of_yojson "pipelineName" _list path;
     pipeline_execution_id =
       value_for_key pipeline_execution_id_of_yojson "pipelineExecutionId" _list path;
     abandon = option_of_yojson (value_for_key boolean__of_yojson "abandon") _list path;
     reason =
       option_of_yojson (value_for_key stop_pipeline_execution_reason_of_yojson "reason") _list path;
   }
    : stop_pipeline_execution_input)

let concurrent_pipeline_executions_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : concurrent_pipeline_executions_limit_exceeded_exception)

let start_pipeline_execution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_execution_id =
       option_of_yojson
         (value_for_key pipeline_execution_id_of_yojson "pipelineExecutionId")
         _list path;
   }
    : start_pipeline_execution_output)

let source_revision_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMMIT_ID" -> COMMIT_ID
    | `String "IMAGE_DIGEST" -> IMAGE_DIGEST
    | `String "S3_OBJECT_VERSION_ID" -> S3_OBJECT_VERSION_ID
    | `String "S3_OBJECT_KEY" -> S3_OBJECT_KEY
    | `String value -> raise (deserialize_unknown_enum_value_error path "SourceRevisionType" value)
    | _ -> raise (deserialize_wrong_type_error path "SourceRevisionType")
     : source_revision_type)
    : source_revision_type)

let source_revision_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_name = value_for_key action_name_of_yojson "actionName" _list path;
     revision_type = value_for_key source_revision_type_of_yojson "revisionType" _list path;
     revision_value = value_for_key revision_of_yojson "revisionValue" _list path;
   }
    : source_revision_override)

let source_revision_override_list_of_yojson tree path =
  list_of_yojson source_revision_override_of_yojson tree path

let pipeline_variable_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key pipeline_variable_name_of_yojson "name" _list path;
     value = value_for_key pipeline_variable_value_of_yojson "value" _list path;
   }
    : pipeline_variable)

let pipeline_variable_list_of_yojson tree path =
  list_of_yojson pipeline_variable_of_yojson tree path

let start_pipeline_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key pipeline_name_of_yojson "name" _list path;
     variables =
       option_of_yojson (value_for_key pipeline_variable_list_of_yojson "variables") _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "clientRequestToken")
         _list path;
     source_revisions =
       option_of_yojson
         (value_for_key source_revision_override_list_of_yojson "sourceRevisions")
         _list path;
   }
    : start_pipeline_execution_input)

let unable_to_rollback_stage_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : unable_to_rollback_stage_exception)

let stage_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : stage_not_found_exception)

let pipeline_execution_outdated_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : pipeline_execution_outdated_exception)

let pipeline_execution_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : pipeline_execution_not_found_exception)

let rollback_stage_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_execution_id =
       value_for_key pipeline_execution_id_of_yojson "pipelineExecutionId" _list path;
   }
    : rollback_stage_output)

let rollback_stage_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_name = value_for_key pipeline_name_of_yojson "pipelineName" _list path;
     stage_name = value_for_key stage_name_of_yojson "stageName" _list path;
     target_pipeline_execution_id =
       value_for_key pipeline_execution_id_of_yojson "targetPipelineExecutionId" _list path;
   }
    : rollback_stage_input)

let stage_not_retryable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : stage_not_retryable_exception)

let not_latest_pipeline_execution_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : not_latest_pipeline_execution_exception)

let retry_stage_execution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_execution_id =
       option_of_yojson
         (value_for_key pipeline_execution_id_of_yojson "pipelineExecutionId")
         _list path;
   }
    : retry_stage_execution_output)

let retry_stage_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_name = value_for_key pipeline_name_of_yojson "pipelineName" _list path;
     stage_name = value_for_key stage_name_of_yojson "stageName" _list path;
     pipeline_execution_id =
       value_for_key pipeline_execution_id_of_yojson "pipelineExecutionId" _list path;
     retry_mode = value_for_key stage_retry_mode_of_yojson "retryMode" _list path;
   }
    : retry_stage_execution_input)

let webhook_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let register_webhook_with_third_party_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let webhook_name_of_yojson = string_of_yojson

let register_webhook_with_third_party_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     webhook_name = option_of_yojson (value_for_key webhook_name_of_yojson "webhookName") _list path;
   }
    : register_webhook_with_third_party_input)

let invalid_webhook_filter_pattern_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_webhook_filter_pattern_exception)

let invalid_webhook_authentication_parameters_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_webhook_authentication_parameters_exception)

let webhook_arn_of_yojson = string_of_yojson
let webhook_last_triggered_of_yojson = timestamp_epoch_seconds_of_yojson
let webhook_error_code_of_yojson = string_of_yojson
let webhook_error_message_of_yojson = string_of_yojson
let webhook_url_of_yojson = string_of_yojson
let webhook_auth_configuration_secret_token_of_yojson = string_of_yojson
let webhook_auth_configuration_allowed_ip_range_of_yojson = string_of_yojson

let webhook_auth_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     allowed_ip_range =
       option_of_yojson
         (value_for_key webhook_auth_configuration_allowed_ip_range_of_yojson "AllowedIPRange")
         _list path;
     secret_token =
       option_of_yojson
         (value_for_key webhook_auth_configuration_secret_token_of_yojson "SecretToken")
         _list path;
   }
    : webhook_auth_configuration)

let webhook_authentication_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "GITHUB_HMAC" -> GITHUB_HMAC
    | `String "IP" -> IP
    | `String "UNAUTHENTICATED" -> UNAUTHENTICATED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WebhookAuthenticationType" value)
    | _ -> raise (deserialize_wrong_type_error path "WebhookAuthenticationType")
     : webhook_authentication_type)
    : webhook_authentication_type)

let match_equals_of_yojson = string_of_yojson
let json_path_of_yojson = string_of_yojson

let webhook_filter_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     json_path = value_for_key json_path_of_yojson "jsonPath" _list path;
     match_equals = option_of_yojson (value_for_key match_equals_of_yojson "matchEquals") _list path;
   }
    : webhook_filter_rule)

let webhook_filters_of_yojson tree path = list_of_yojson webhook_filter_rule_of_yojson tree path

let webhook_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key webhook_name_of_yojson "name" _list path;
     target_pipeline = value_for_key pipeline_name_of_yojson "targetPipeline" _list path;
     target_action = value_for_key action_name_of_yojson "targetAction" _list path;
     filters = value_for_key webhook_filters_of_yojson "filters" _list path;
     authentication =
       value_for_key webhook_authentication_type_of_yojson "authentication" _list path;
     authentication_configuration =
       value_for_key webhook_auth_configuration_of_yojson "authenticationConfiguration" _list path;
   }
    : webhook_definition)

let list_webhook_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     definition = value_for_key webhook_definition_of_yojson "definition" _list path;
     url = value_for_key webhook_url_of_yojson "url" _list path;
     error_message =
       option_of_yojson (value_for_key webhook_error_message_of_yojson "errorMessage") _list path;
     error_code =
       option_of_yojson (value_for_key webhook_error_code_of_yojson "errorCode") _list path;
     last_triggered =
       option_of_yojson (value_for_key webhook_last_triggered_of_yojson "lastTriggered") _list path;
     arn = option_of_yojson (value_for_key webhook_arn_of_yojson "arn") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : list_webhook_item)

let put_webhook_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ webhook = option_of_yojson (value_for_key list_webhook_item_of_yojson "webhook") _list path }
    : put_webhook_output)

let put_webhook_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     webhook = value_for_key webhook_definition_of_yojson "webhook" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : put_webhook_input)

let invalid_job_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_job_state_exception)

let execution_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary = option_of_yojson (value_for_key execution_summary_of_yojson "summary") _list path;
     external_execution_id =
       option_of_yojson (value_for_key execution_id_of_yojson "externalExecutionId") _list path;
     percent_complete =
       option_of_yojson (value_for_key percentage_of_yojson "percentComplete") _list path;
   }
    : execution_details)

let continuation_token_of_yojson = string_of_yojson
let time_of_yojson = timestamp_epoch_seconds_of_yojson

let current_revision_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revision = value_for_key revision_of_yojson "revision" _list path;
     change_identifier =
       value_for_key revision_change_identifier_of_yojson "changeIdentifier" _list path;
     created = option_of_yojson (value_for_key time_of_yojson "created") _list path;
     revision_summary =
       option_of_yojson (value_for_key revision_summary_of_yojson "revisionSummary") _list path;
   }
    : current_revision)

let put_third_party_job_success_result_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key third_party_job_id_of_yojson "jobId" _list path;
     client_token = value_for_key client_token_of_yojson "clientToken" _list path;
     current_revision =
       option_of_yojson (value_for_key current_revision_of_yojson "currentRevision") _list path;
     continuation_token =
       option_of_yojson (value_for_key continuation_token_of_yojson "continuationToken") _list path;
     execution_details =
       option_of_yojson (value_for_key execution_details_of_yojson "executionDetails") _list path;
   }
    : put_third_party_job_success_result_input)

let failure_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "JobFailed" -> JobFailed
    | `String "ConfigurationError" -> ConfigurationError
    | `String "PermissionError" -> PermissionError
    | `String "RevisionOutOfSync" -> RevisionOutOfSync
    | `String "RevisionUnavailable" -> RevisionUnavailable
    | `String "SystemUnavailable" -> SystemUnavailable
    | `String value -> raise (deserialize_unknown_enum_value_error path "FailureType" value)
    | _ -> raise (deserialize_wrong_type_error path "FailureType")
     : failure_type)
    : failure_type)

let failure_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key failure_type_of_yojson "type" _list path;
     message = value_for_key message_of_yojson "message" _list path;
     external_execution_id =
       option_of_yojson (value_for_key execution_id_of_yojson "externalExecutionId") _list path;
   }
    : failure_details)

let put_third_party_job_failure_result_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key third_party_job_id_of_yojson "jobId" _list path;
     client_token = value_for_key client_token_of_yojson "clientToken" _list path;
     failure_details = value_for_key failure_details_of_yojson "failureDetails" _list path;
   }
    : put_third_party_job_failure_result_input)

let output_variables_size_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : output_variables_size_exceeded_exception)

let put_job_success_result_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "jobId" _list path;
     current_revision =
       option_of_yojson (value_for_key current_revision_of_yojson "currentRevision") _list path;
     continuation_token =
       option_of_yojson (value_for_key continuation_token_of_yojson "continuationToken") _list path;
     execution_details =
       option_of_yojson (value_for_key execution_details_of_yojson "executionDetails") _list path;
     output_variables =
       option_of_yojson (value_for_key output_variables_map_of_yojson "outputVariables") _list path;
   }
    : put_job_success_result_input)

let put_job_failure_result_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "jobId" _list path;
     failure_details = value_for_key failure_details_of_yojson "failureDetails" _list path;
   }
    : put_job_failure_result_input)

let invalid_approval_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_approval_token_exception)

let put_approval_result_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ approved_at = option_of_yojson (value_for_key timestamp_of_yojson "approvedAt") _list path }
    : put_approval_result_output)

let put_approval_result_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_name = value_for_key pipeline_name_of_yojson "pipelineName" _list path;
     stage_name = value_for_key stage_name_of_yojson "stageName" _list path;
     action_name = value_for_key action_name_of_yojson "actionName" _list path;
     result_ = value_for_key approval_result_of_yojson "result" _list path;
     token = value_for_key approval_token_of_yojson "token" _list path;
   }
    : put_approval_result_input)

let put_action_revision_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     new_revision = option_of_yojson (value_for_key boolean__of_yojson "newRevision") _list path;
     pipeline_execution_id =
       option_of_yojson
         (value_for_key pipeline_execution_id_of_yojson "pipelineExecutionId")
         _list path;
   }
    : put_action_revision_output)

let put_action_revision_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_name = value_for_key pipeline_name_of_yojson "pipelineName" _list path;
     stage_name = value_for_key stage_name_of_yojson "stageName" _list path;
     action_name = value_for_key action_name_of_yojson "actionName" _list path;
     action_revision = value_for_key action_revision_of_yojson "actionRevision" _list path;
   }
    : put_action_revision_input)

let third_party_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_id = option_of_yojson (value_for_key client_id_of_yojson "clientId") _list path;
     job_id = option_of_yojson (value_for_key job_id_of_yojson "jobId") _list path;
   }
    : third_party_job)

let third_party_job_list_of_yojson tree path = list_of_yojson third_party_job_of_yojson tree path

let poll_for_third_party_jobs_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ jobs = option_of_yojson (value_for_key third_party_job_list_of_yojson "jobs") _list path }
    : poll_for_third_party_jobs_output)

let max_batch_size_of_yojson = int_of_yojson

let poll_for_third_party_jobs_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_type_id = value_for_key action_type_id_of_yojson "actionTypeId" _list path;
     max_batch_size =
       option_of_yojson (value_for_key max_batch_size_of_yojson "maxBatchSize") _list path;
   }
    : poll_for_third_party_jobs_input)

let pipeline_arn_of_yojson = string_of_yojson

let stage_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key stage_name_of_yojson "name") _list path }
    : stage_context)

let pipeline_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_name =
       option_of_yojson (value_for_key pipeline_name_of_yojson "pipelineName") _list path;
     stage = option_of_yojson (value_for_key stage_context_of_yojson "stage") _list path;
     action = option_of_yojson (value_for_key action_context_of_yojson "action") _list path;
     pipeline_arn = option_of_yojson (value_for_key pipeline_arn_of_yojson "pipelineArn") _list path;
     pipeline_execution_id =
       option_of_yojson
         (value_for_key pipeline_execution_id_of_yojson "pipelineExecutionId")
         _list path;
   }
    : pipeline_context)

let job_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_type_id =
       option_of_yojson (value_for_key action_type_id_of_yojson "actionTypeId") _list path;
     action_configuration =
       option_of_yojson
         (value_for_key action_configuration_of_yojson "actionConfiguration")
         _list path;
     pipeline_context =
       option_of_yojson (value_for_key pipeline_context_of_yojson "pipelineContext") _list path;
     input_artifacts =
       option_of_yojson (value_for_key artifact_list_of_yojson "inputArtifacts") _list path;
     output_artifacts =
       option_of_yojson (value_for_key artifact_list_of_yojson "outputArtifacts") _list path;
     artifact_credentials =
       option_of_yojson
         (value_for_key aws_session_credentials_of_yojson "artifactCredentials")
         _list path;
     continuation_token =
       option_of_yojson (value_for_key continuation_token_of_yojson "continuationToken") _list path;
     encryption_key =
       option_of_yojson (value_for_key encryption_key_of_yojson "encryptionKey") _list path;
   }
    : job_data)

let job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key job_id_of_yojson "id") _list path;
     data = option_of_yojson (value_for_key job_data_of_yojson "data") _list path;
     nonce = option_of_yojson (value_for_key nonce_of_yojson "nonce") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
   }
    : job)

let job_list_of_yojson tree path = list_of_yojson job_of_yojson tree path

let poll_for_jobs_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ jobs = option_of_yojson (value_for_key job_list_of_yojson "jobs") _list path }
    : poll_for_jobs_output)

let query_param_map_of_yojson tree path =
  map_of_yojson action_configuration_key_of_yojson action_configuration_queryable_value_of_yojson
    tree path

let poll_for_jobs_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_type_id = value_for_key action_type_id_of_yojson "actionTypeId" _list path;
     max_batch_size =
       option_of_yojson (value_for_key max_batch_size_of_yojson "maxBatchSize") _list path;
     query_param =
       option_of_yojson (value_for_key query_param_map_of_yojson "queryParam") _list path;
   }
    : poll_for_jobs_input)

let condition_not_overridable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : condition_not_overridable_exception)

let condition_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BEFORE_ENTRY" -> BEFORE_ENTRY
    | `String "ON_SUCCESS" -> ON_SUCCESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConditionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConditionType")
     : condition_type)
    : condition_type)

let override_stage_condition_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_name = value_for_key pipeline_name_of_yojson "pipelineName" _list path;
     stage_name = value_for_key stage_name_of_yojson "stageName" _list path;
     pipeline_execution_id =
       value_for_key pipeline_execution_id_of_yojson "pipelineExecutionId" _list path;
     condition_type = value_for_key condition_type_of_yojson "conditionType" _list path;
   }
    : override_stage_condition_input)

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_next_token_exception)

let next_token_of_yojson = string_of_yojson
let webhook_list_of_yojson tree path = list_of_yojson list_webhook_item_of_yojson tree path

let list_webhooks_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     webhooks = option_of_yojson (value_for_key webhook_list_of_yojson "webhooks") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_webhooks_output)

let max_results_of_yojson = int_of_yojson

let list_webhooks_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_webhooks_input)

let list_tags_for_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_tags_for_resource_output)

let list_tags_for_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_tags_for_resource_input)

let rule_configuration_property_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "String" -> String
    | `String "Number" -> Number
    | `String "Boolean" -> Boolean
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RuleConfigurationPropertyType" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleConfigurationPropertyType")
     : rule_configuration_property_type)
    : rule_configuration_property_type)

let rule_configuration_property_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key rule_configuration_key_of_yojson "name" _list path;
     required = value_for_key boolean__of_yojson "required" _list path;
     key = value_for_key boolean__of_yojson "key" _list path;
     secret = value_for_key boolean__of_yojson "secret" _list path;
     queryable = option_of_yojson (value_for_key boolean__of_yojson "queryable") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     type_ =
       option_of_yojson (value_for_key rule_configuration_property_type_of_yojson "type") _list path;
   }
    : rule_configuration_property)

let rule_configuration_property_list_of_yojson tree path =
  list_of_yojson rule_configuration_property_of_yojson tree path

let rule_type_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     third_party_configuration_url =
       option_of_yojson (value_for_key url_of_yojson "thirdPartyConfigurationUrl") _list path;
     entity_url_template =
       option_of_yojson (value_for_key url_template_of_yojson "entityUrlTemplate") _list path;
     execution_url_template =
       option_of_yojson (value_for_key url_template_of_yojson "executionUrlTemplate") _list path;
     revision_url_template =
       option_of_yojson (value_for_key url_template_of_yojson "revisionUrlTemplate") _list path;
   }
    : rule_type_settings)

let rule_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key rule_type_id_of_yojson "id" _list path;
     settings = option_of_yojson (value_for_key rule_type_settings_of_yojson "settings") _list path;
     rule_configuration_properties =
       option_of_yojson
         (value_for_key rule_configuration_property_list_of_yojson "ruleConfigurationProperties")
         _list path;
     input_artifact_details =
       value_for_key artifact_details_of_yojson "inputArtifactDetails" _list path;
   }
    : rule_type)

let rule_type_list_of_yojson tree path = list_of_yojson rule_type_of_yojson tree path

let list_rule_types_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule_types = value_for_key rule_type_list_of_yojson "ruleTypes" _list path }
    : list_rule_types_output)

let list_rule_types_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_owner_filter =
       option_of_yojson (value_for_key rule_owner_of_yojson "ruleOwnerFilter") _list path;
     region_filter =
       option_of_yojson (value_for_key aws_region_name_of_yojson "regionFilter") _list path;
   }
    : list_rule_types_input)

let rule_execution_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     external_execution_id =
       option_of_yojson
         (value_for_key external_execution_id_of_yojson "externalExecutionId")
         _list path;
     external_execution_summary =
       option_of_yojson
         (value_for_key external_execution_summary_of_yojson "externalExecutionSummary")
         _list path;
     external_execution_url =
       option_of_yojson (value_for_key url_of_yojson "externalExecutionUrl") _list path;
     error_details =
       option_of_yojson (value_for_key error_details_of_yojson "errorDetails") _list path;
   }
    : rule_execution_result)

let rule_execution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_result =
       option_of_yojson (value_for_key rule_execution_result_of_yojson "executionResult") _list path;
   }
    : rule_execution_output)

let resolved_rule_configuration_map_of_yojson tree path =
  map_of_yojson string__of_yojson string__of_yojson tree path

let rule_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_type_id = option_of_yojson (value_for_key rule_type_id_of_yojson "ruleTypeId") _list path;
     configuration =
       option_of_yojson (value_for_key rule_configuration_map_of_yojson "configuration") _list path;
     resolved_configuration =
       option_of_yojson
         (value_for_key resolved_rule_configuration_map_of_yojson "resolvedConfiguration")
         _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "roleArn") _list path;
     region = option_of_yojson (value_for_key aws_region_name_of_yojson "region") _list path;
     input_artifacts =
       option_of_yojson (value_for_key artifact_detail_list_of_yojson "inputArtifacts") _list path;
   }
    : rule_execution_input)

let rule_execution_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "InProgress" -> InProgress
    | `String "Abandoned" -> Abandoned
    | `String "Succeeded" -> Succeeded
    | `String "Failed" -> Failed
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleExecutionStatus")
     : rule_execution_status)
    : rule_execution_status)

let rule_execution_id_of_yojson = string_of_yojson

let rule_execution_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_execution_id =
       option_of_yojson
         (value_for_key pipeline_execution_id_of_yojson "pipelineExecutionId")
         _list path;
     rule_execution_id =
       option_of_yojson (value_for_key rule_execution_id_of_yojson "ruleExecutionId") _list path;
     pipeline_version =
       option_of_yojson (value_for_key pipeline_version_of_yojson "pipelineVersion") _list path;
     stage_name = option_of_yojson (value_for_key stage_name_of_yojson "stageName") _list path;
     rule_name = option_of_yojson (value_for_key rule_name_of_yojson "ruleName") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     last_update_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdateTime") _list path;
     updated_by = option_of_yojson (value_for_key last_updated_by_of_yojson "updatedBy") _list path;
     status = option_of_yojson (value_for_key rule_execution_status_of_yojson "status") _list path;
     input = option_of_yojson (value_for_key rule_execution_input_of_yojson "input") _list path;
     output = option_of_yojson (value_for_key rule_execution_output_of_yojson "output") _list path;
   }
    : rule_execution_detail)

let rule_execution_detail_list_of_yojson tree path =
  list_of_yojson rule_execution_detail_of_yojson tree path

let list_rule_executions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_execution_details =
       option_of_yojson
         (value_for_key rule_execution_detail_list_of_yojson "ruleExecutionDetails")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_rule_executions_output)

let rule_execution_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_execution_id =
       option_of_yojson
         (value_for_key pipeline_execution_id_of_yojson "pipelineExecutionId")
         _list path;
     latest_in_pipeline_execution =
       option_of_yojson
         (value_for_key latest_in_pipeline_execution_filter_of_yojson "latestInPipelineExecution")
         _list path;
   }
    : rule_execution_filter)

let list_rule_executions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_name = value_for_key pipeline_name_of_yojson "pipelineName" _list path;
     filter = option_of_yojson (value_for_key rule_execution_filter_of_yojson "filter") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_rule_executions_input)

let pipeline_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key pipeline_name_of_yojson "name") _list path;
     version = option_of_yojson (value_for_key pipeline_version_of_yojson "version") _list path;
     pipeline_type =
       option_of_yojson (value_for_key pipeline_type_of_yojson "pipelineType") _list path;
     execution_mode =
       option_of_yojson (value_for_key execution_mode_of_yojson "executionMode") _list path;
     created = option_of_yojson (value_for_key timestamp_of_yojson "created") _list path;
     updated = option_of_yojson (value_for_key timestamp_of_yojson "updated") _list path;
   }
    : pipeline_summary)

let pipeline_list_of_yojson tree path = list_of_yojson pipeline_summary_of_yojson tree path

let list_pipelines_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipelines = option_of_yojson (value_for_key pipeline_list_of_yojson "pipelines") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_pipelines_output)

let max_pipelines_of_yojson = int_of_yojson

let list_pipelines_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_pipelines_of_yojson "maxResults") _list path;
   }
    : list_pipelines_input)

let pipeline_rollback_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rollback_target_pipeline_execution_id =
       option_of_yojson
         (value_for_key pipeline_execution_id_of_yojson "rollbackTargetPipelineExecutionId")
         _list path;
   }
    : pipeline_rollback_metadata)

let execution_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "STANDARD" -> STANDARD
    | `String "ROLLBACK" -> ROLLBACK
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionType")
     : execution_type)
    : execution_type)

let stop_execution_trigger_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason =
       option_of_yojson (value_for_key stop_pipeline_execution_reason_of_yojson "reason") _list path;
   }
    : stop_execution_trigger)

let trigger_detail_of_yojson = string_of_yojson

let trigger_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CreatePipeline" -> CreatePipeline
    | `String "StartPipelineExecution" -> StartPipelineExecution
    | `String "PollForSourceChanges" -> PollForSourceChanges
    | `String "Webhook" -> Webhook
    | `String "CloudWatchEvent" -> CloudWatchEvent
    | `String "PutActionRevision" -> PutActionRevision
    | `String "WebhookV2" -> WebhookV2
    | `String "ManualRollback" -> ManualRollback
    | `String "AutomatedRollback" -> AutomatedRollback
    | `String value -> raise (deserialize_unknown_enum_value_error path "TriggerType" value)
    | _ -> raise (deserialize_wrong_type_error path "TriggerType")
     : trigger_type)
    : trigger_type)

let execution_trigger_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trigger_type = option_of_yojson (value_for_key trigger_type_of_yojson "triggerType") _list path;
     trigger_detail =
       option_of_yojson (value_for_key trigger_detail_of_yojson "triggerDetail") _list path;
   }
    : execution_trigger)

let source_revision_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_name = value_for_key action_name_of_yojson "actionName" _list path;
     revision_id = option_of_yojson (value_for_key revision_of_yojson "revisionId") _list path;
     revision_summary =
       option_of_yojson (value_for_key revision_summary_of_yojson "revisionSummary") _list path;
     revision_url = option_of_yojson (value_for_key url_of_yojson "revisionUrl") _list path;
   }
    : source_revision)

let source_revision_list_of_yojson tree path = list_of_yojson source_revision_of_yojson tree path
let pipeline_execution_status_summary_of_yojson = string_of_yojson

let pipeline_execution_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Cancelled" -> Cancelled
    | `String "InProgress" -> InProgress
    | `String "Stopped" -> Stopped
    | `String "Stopping" -> Stopping
    | `String "Succeeded" -> Succeeded
    | `String "Superseded" -> Superseded
    | `String "Failed" -> Failed
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PipelineExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PipelineExecutionStatus")
     : pipeline_execution_status)
    : pipeline_execution_status)

let pipeline_execution_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_execution_id =
       option_of_yojson
         (value_for_key pipeline_execution_id_of_yojson "pipelineExecutionId")
         _list path;
     status =
       option_of_yojson (value_for_key pipeline_execution_status_of_yojson "status") _list path;
     status_summary =
       option_of_yojson
         (value_for_key pipeline_execution_status_summary_of_yojson "statusSummary")
         _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     last_update_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdateTime") _list path;
     source_revisions =
       option_of_yojson (value_for_key source_revision_list_of_yojson "sourceRevisions") _list path;
     trigger = option_of_yojson (value_for_key execution_trigger_of_yojson "trigger") _list path;
     stop_trigger =
       option_of_yojson (value_for_key stop_execution_trigger_of_yojson "stopTrigger") _list path;
     execution_mode =
       option_of_yojson (value_for_key execution_mode_of_yojson "executionMode") _list path;
     execution_type =
       option_of_yojson (value_for_key execution_type_of_yojson "executionType") _list path;
     rollback_metadata =
       option_of_yojson
         (value_for_key pipeline_rollback_metadata_of_yojson "rollbackMetadata")
         _list path;
   }
    : pipeline_execution_summary)

let pipeline_execution_summary_list_of_yojson tree path =
  list_of_yojson pipeline_execution_summary_of_yojson tree path

let list_pipeline_executions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_execution_summaries =
       option_of_yojson
         (value_for_key pipeline_execution_summary_list_of_yojson "pipelineExecutionSummaries")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_pipeline_executions_output)

let succeeded_in_stage_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ stage_name = option_of_yojson (value_for_key stage_name_of_yojson "stageName") _list path }
    : succeeded_in_stage_filter)

let pipeline_execution_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     succeeded_in_stage =
       option_of_yojson
         (value_for_key succeeded_in_stage_filter_of_yojson "succeededInStage")
         _list path;
   }
    : pipeline_execution_filter)

let list_pipeline_executions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_name = value_for_key pipeline_name_of_yojson "pipelineName" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     filter =
       option_of_yojson (value_for_key pipeline_execution_filter_of_yojson "filter") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_pipeline_executions_input)

let deploy_target_event_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ssm_command_id = option_of_yojson (value_for_key string__of_yojson "ssmCommandId") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : deploy_target_event_context)

let deploy_target_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     context =
       option_of_yojson (value_for_key deploy_target_event_context_of_yojson "context") _list path;
   }
    : deploy_target_event)

let deploy_target_event_list_of_yojson tree path =
  list_of_yojson deploy_target_event_of_yojson tree path

let deploy_action_execution_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_id = option_of_yojson (value_for_key string__of_yojson "targetId") _list path;
     target_type = option_of_yojson (value_for_key string__of_yojson "targetType") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     events =
       option_of_yojson (value_for_key deploy_target_event_list_of_yojson "events") _list path;
   }
    : deploy_action_execution_target)

let deploy_action_execution_target_list_of_yojson tree path =
  list_of_yojson deploy_action_execution_target_of_yojson tree path

let list_deploy_action_execution_targets_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     targets =
       option_of_yojson
         (value_for_key deploy_action_execution_target_list_of_yojson "targets")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_deploy_action_execution_targets_output)

let target_filter_value_of_yojson = string_of_yojson

let target_filter_value_list_of_yojson tree path =
  list_of_yojson target_filter_value_of_yojson tree path

let target_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "TARGET_STATUS" -> TARGET_STATUS
    | `String value -> raise (deserialize_unknown_enum_value_error path "TargetFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetFilterName")
     : target_filter_name)
    : target_filter_name)

let target_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key target_filter_name_of_yojson "name") _list path;
     values =
       option_of_yojson (value_for_key target_filter_value_list_of_yojson "values") _list path;
   }
    : target_filter)

let target_filter_list_of_yojson tree path = list_of_yojson target_filter_of_yojson tree path

let list_deploy_action_execution_targets_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_name =
       option_of_yojson (value_for_key pipeline_name_of_yojson "pipelineName") _list path;
     action_execution_id =
       value_for_key action_execution_id_of_yojson "actionExecutionId" _list path;
     filters = option_of_yojson (value_for_key target_filter_list_of_yojson "filters") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_deploy_action_execution_targets_input)

let list_action_types_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_types = value_for_key action_type_list_of_yojson "actionTypes" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_action_types_output)

let list_action_types_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_owner_filter =
       option_of_yojson (value_for_key action_owner_of_yojson "actionOwnerFilter") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     region_filter =
       option_of_yojson (value_for_key aws_region_name_of_yojson "regionFilter") _list path;
   }
    : list_action_types_input)

let list_action_executions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_execution_details =
       option_of_yojson
         (value_for_key action_execution_detail_list_of_yojson "actionExecutionDetails")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_action_executions_output)

let list_action_executions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_name = value_for_key pipeline_name_of_yojson "pipelineName" _list path;
     filter = option_of_yojson (value_for_key action_execution_filter_of_yojson "filter") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_action_executions_input)

let invalid_job_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_job_exception)

let third_party_job_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_type_id =
       option_of_yojson (value_for_key action_type_id_of_yojson "actionTypeId") _list path;
     action_configuration =
       option_of_yojson
         (value_for_key action_configuration_of_yojson "actionConfiguration")
         _list path;
     pipeline_context =
       option_of_yojson (value_for_key pipeline_context_of_yojson "pipelineContext") _list path;
     input_artifacts =
       option_of_yojson (value_for_key artifact_list_of_yojson "inputArtifacts") _list path;
     output_artifacts =
       option_of_yojson (value_for_key artifact_list_of_yojson "outputArtifacts") _list path;
     artifact_credentials =
       option_of_yojson
         (value_for_key aws_session_credentials_of_yojson "artifactCredentials")
         _list path;
     continuation_token =
       option_of_yojson (value_for_key continuation_token_of_yojson "continuationToken") _list path;
     encryption_key =
       option_of_yojson (value_for_key encryption_key_of_yojson "encryptionKey") _list path;
   }
    : third_party_job_data)

let third_party_job_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key third_party_job_id_of_yojson "id") _list path;
     data = option_of_yojson (value_for_key third_party_job_data_of_yojson "data") _list path;
     nonce = option_of_yojson (value_for_key nonce_of_yojson "nonce") _list path;
   }
    : third_party_job_details)

let get_third_party_job_details_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_details =
       option_of_yojson (value_for_key third_party_job_details_of_yojson "jobDetails") _list path;
   }
    : get_third_party_job_details_output)

let get_third_party_job_details_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key third_party_job_id_of_yojson "jobId" _list path;
     client_token = value_for_key client_token_of_yojson "clientToken" _list path;
   }
    : get_third_party_job_details_input)

let retry_trigger_of_yojson (tree : t) path =
  ((match tree with
    | `String "AutomatedStageRetry" -> AutomatedStageRetry
    | `String "ManualStageRetry" -> ManualStageRetry
    | `String value -> raise (deserialize_unknown_enum_value_error path "RetryTrigger" value)
    | _ -> raise (deserialize_wrong_type_error path "RetryTrigger")
     : retry_trigger)
    : retry_trigger)

let retry_attempt_of_yojson = int_of_yojson

let retry_stage_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_stage_retry_attempt =
       option_of_yojson (value_for_key retry_attempt_of_yojson "autoStageRetryAttempt") _list path;
     manual_stage_retry_attempt =
       option_of_yojson (value_for_key retry_attempt_of_yojson "manualStageRetryAttempt") _list path;
     latest_retry_trigger =
       option_of_yojson (value_for_key retry_trigger_of_yojson "latestRetryTrigger") _list path;
   }
    : retry_stage_metadata)

let rule_execution_token_of_yojson = string_of_yojson

let rule_execution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_execution_id =
       option_of_yojson (value_for_key rule_execution_id_of_yojson "ruleExecutionId") _list path;
     status = option_of_yojson (value_for_key rule_execution_status_of_yojson "status") _list path;
     summary = option_of_yojson (value_for_key execution_summary_of_yojson "summary") _list path;
     last_status_change =
       option_of_yojson (value_for_key timestamp_of_yojson "lastStatusChange") _list path;
     token = option_of_yojson (value_for_key rule_execution_token_of_yojson "token") _list path;
     last_updated_by =
       option_of_yojson (value_for_key last_updated_by_of_yojson "lastUpdatedBy") _list path;
     external_execution_id =
       option_of_yojson (value_for_key execution_id_of_yojson "externalExecutionId") _list path;
     external_execution_url =
       option_of_yojson (value_for_key url_of_yojson "externalExecutionUrl") _list path;
     error_details =
       option_of_yojson (value_for_key error_details_of_yojson "errorDetails") _list path;
   }
    : rule_execution)

let rule_revision_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revision_id = value_for_key revision_of_yojson "revisionId" _list path;
     revision_change_id =
       value_for_key revision_change_identifier_of_yojson "revisionChangeId" _list path;
     created = value_for_key timestamp_of_yojson "created" _list path;
   }
    : rule_revision)

let rule_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_name = option_of_yojson (value_for_key rule_name_of_yojson "ruleName") _list path;
     current_revision =
       option_of_yojson (value_for_key rule_revision_of_yojson "currentRevision") _list path;
     latest_execution =
       option_of_yojson (value_for_key rule_execution_of_yojson "latestExecution") _list path;
     entity_url = option_of_yojson (value_for_key url_of_yojson "entityUrl") _list path;
     revision_url = option_of_yojson (value_for_key url_of_yojson "revisionUrl") _list path;
   }
    : rule_state)

let rule_state_list_of_yojson tree path = list_of_yojson rule_state_of_yojson tree path

let condition_execution_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "InProgress" -> InProgress
    | `String "Failed" -> Failed
    | `String "Errored" -> Errored
    | `String "Succeeded" -> Succeeded
    | `String "Cancelled" -> Cancelled
    | `String "Abandoned" -> Abandoned
    | `String "Overridden" -> Overridden
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConditionExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ConditionExecutionStatus")
     : condition_execution_status)
    : condition_execution_status)

let condition_execution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key condition_execution_status_of_yojson "status") _list path;
     summary = option_of_yojson (value_for_key execution_summary_of_yojson "summary") _list path;
     last_status_change =
       option_of_yojson (value_for_key timestamp_of_yojson "lastStatusChange") _list path;
   }
    : condition_execution)

let condition_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     latest_execution =
       option_of_yojson (value_for_key condition_execution_of_yojson "latestExecution") _list path;
     rule_states =
       option_of_yojson (value_for_key rule_state_list_of_yojson "ruleStates") _list path;
   }
    : condition_state)

let condition_state_list_of_yojson tree path = list_of_yojson condition_state_of_yojson tree path

let stage_conditions_execution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key condition_execution_status_of_yojson "status") _list path;
     summary = option_of_yojson (value_for_key execution_summary_of_yojson "summary") _list path;
   }
    : stage_conditions_execution)

let stage_condition_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     latest_execution =
       option_of_yojson
         (value_for_key stage_conditions_execution_of_yojson "latestExecution")
         _list path;
     condition_states =
       option_of_yojson (value_for_key condition_state_list_of_yojson "conditionStates") _list path;
   }
    : stage_condition_state)

let stage_execution_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Cancelled" -> Cancelled
    | `String "InProgress" -> InProgress
    | `String "Failed" -> Failed
    | `String "Stopped" -> Stopped
    | `String "Stopping" -> Stopping
    | `String "Succeeded" -> Succeeded
    | `String "Skipped" -> Skipped
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StageExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "StageExecutionStatus")
     : stage_execution_status)
    : stage_execution_status)

let stage_execution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_execution_id =
       value_for_key pipeline_execution_id_of_yojson "pipelineExecutionId" _list path;
     status = value_for_key stage_execution_status_of_yojson "status" _list path;
     type_ = option_of_yojson (value_for_key execution_type_of_yojson "type") _list path;
   }
    : stage_execution)

let disabled_reason_of_yojson = string_of_yojson
let last_changed_at_of_yojson = timestamp_epoch_seconds_of_yojson
let last_changed_by_of_yojson = string_of_yojson
let enabled_of_yojson = bool_of_yojson

let transition_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled = option_of_yojson (value_for_key enabled_of_yojson "enabled") _list path;
     last_changed_by =
       option_of_yojson (value_for_key last_changed_by_of_yojson "lastChangedBy") _list path;
     last_changed_at =
       option_of_yojson (value_for_key last_changed_at_of_yojson "lastChangedAt") _list path;
     disabled_reason =
       option_of_yojson (value_for_key disabled_reason_of_yojson "disabledReason") _list path;
   }
    : transition_state)

let stage_execution_list_of_yojson tree path = list_of_yojson stage_execution_of_yojson tree path

let stage_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stage_name = option_of_yojson (value_for_key stage_name_of_yojson "stageName") _list path;
     inbound_execution =
       option_of_yojson (value_for_key stage_execution_of_yojson "inboundExecution") _list path;
     inbound_executions =
       option_of_yojson
         (value_for_key stage_execution_list_of_yojson "inboundExecutions")
         _list path;
     inbound_transition_state =
       option_of_yojson
         (value_for_key transition_state_of_yojson "inboundTransitionState")
         _list path;
     action_states =
       option_of_yojson (value_for_key action_state_list_of_yojson "actionStates") _list path;
     latest_execution =
       option_of_yojson (value_for_key stage_execution_of_yojson "latestExecution") _list path;
     before_entry_condition_state =
       option_of_yojson
         (value_for_key stage_condition_state_of_yojson "beforeEntryConditionState")
         _list path;
     on_success_condition_state =
       option_of_yojson
         (value_for_key stage_condition_state_of_yojson "onSuccessConditionState")
         _list path;
     on_failure_condition_state =
       option_of_yojson
         (value_for_key stage_condition_state_of_yojson "onFailureConditionState")
         _list path;
     retry_stage_metadata =
       option_of_yojson
         (value_for_key retry_stage_metadata_of_yojson "retryStageMetadata")
         _list path;
   }
    : stage_state)

let stage_state_list_of_yojson tree path = list_of_yojson stage_state_of_yojson tree path

let get_pipeline_state_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_name =
       option_of_yojson (value_for_key pipeline_name_of_yojson "pipelineName") _list path;
     pipeline_version =
       option_of_yojson (value_for_key pipeline_version_of_yojson "pipelineVersion") _list path;
     stage_states =
       option_of_yojson (value_for_key stage_state_list_of_yojson "stageStates") _list path;
     created = option_of_yojson (value_for_key timestamp_of_yojson "created") _list path;
     updated = option_of_yojson (value_for_key timestamp_of_yojson "updated") _list path;
   }
    : get_pipeline_state_output)

let get_pipeline_state_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key pipeline_name_of_yojson "name" _list path } : get_pipeline_state_input)

let resolved_pipeline_variable_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     resolved_value = option_of_yojson (value_for_key string__of_yojson "resolvedValue") _list path;
   }
    : resolved_pipeline_variable)

let resolved_pipeline_variable_list_of_yojson tree path =
  list_of_yojson resolved_pipeline_variable_of_yojson tree path

let pipeline_execution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_name =
       option_of_yojson (value_for_key pipeline_name_of_yojson "pipelineName") _list path;
     pipeline_version =
       option_of_yojson (value_for_key pipeline_version_of_yojson "pipelineVersion") _list path;
     pipeline_execution_id =
       option_of_yojson
         (value_for_key pipeline_execution_id_of_yojson "pipelineExecutionId")
         _list path;
     status =
       option_of_yojson (value_for_key pipeline_execution_status_of_yojson "status") _list path;
     status_summary =
       option_of_yojson
         (value_for_key pipeline_execution_status_summary_of_yojson "statusSummary")
         _list path;
     artifact_revisions =
       option_of_yojson
         (value_for_key artifact_revision_list_of_yojson "artifactRevisions")
         _list path;
     variables =
       option_of_yojson
         (value_for_key resolved_pipeline_variable_list_of_yojson "variables")
         _list path;
     trigger = option_of_yojson (value_for_key execution_trigger_of_yojson "trigger") _list path;
     execution_mode =
       option_of_yojson (value_for_key execution_mode_of_yojson "executionMode") _list path;
     execution_type =
       option_of_yojson (value_for_key execution_type_of_yojson "executionType") _list path;
     rollback_metadata =
       option_of_yojson
         (value_for_key pipeline_rollback_metadata_of_yojson "rollbackMetadata")
         _list path;
   }
    : pipeline_execution)

let get_pipeline_execution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_execution =
       option_of_yojson (value_for_key pipeline_execution_of_yojson "pipelineExecution") _list path;
   }
    : get_pipeline_execution_output)

let get_pipeline_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_name = value_for_key pipeline_name_of_yojson "pipelineName" _list path;
     pipeline_execution_id =
       value_for_key pipeline_execution_id_of_yojson "pipelineExecutionId" _list path;
   }
    : get_pipeline_execution_input)

let pipeline_version_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : pipeline_version_not_found_exception)

let pipeline_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_arn = option_of_yojson (value_for_key pipeline_arn_of_yojson "pipelineArn") _list path;
     created = option_of_yojson (value_for_key timestamp_of_yojson "created") _list path;
     updated = option_of_yojson (value_for_key timestamp_of_yojson "updated") _list path;
     polling_disabled_at =
       option_of_yojson (value_for_key timestamp_of_yojson "pollingDisabledAt") _list path;
   }
    : pipeline_metadata)

let get_pipeline_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline =
       option_of_yojson (value_for_key pipeline_declaration_of_yojson "pipeline") _list path;
     metadata = option_of_yojson (value_for_key pipeline_metadata_of_yojson "metadata") _list path;
   }
    : get_pipeline_output)

let get_pipeline_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key pipeline_name_of_yojson "name" _list path;
     version = option_of_yojson (value_for_key pipeline_version_of_yojson "version") _list path;
   }
    : get_pipeline_input)

let job_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key job_id_of_yojson "id") _list path;
     data = option_of_yojson (value_for_key job_data_of_yojson "data") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
   }
    : job_details)

let get_job_details_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_details = option_of_yojson (value_for_key job_details_of_yojson "jobDetails") _list path }
    : get_job_details_output)

let get_job_details_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "jobId" _list path } : get_job_details_input)

let get_action_type_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_type =
       option_of_yojson (value_for_key action_type_declaration_of_yojson "actionType") _list path;
   }
    : get_action_type_output)

let get_action_type_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     category = value_for_key action_category_of_yojson "category" _list path;
     owner = value_for_key action_type_owner_of_yojson "owner" _list path;
     provider = value_for_key action_provider_of_yojson "provider" _list path;
     version = value_for_key version_of_yojson "version" _list path;
   }
    : get_action_type_input)

let stage_transition_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Inbound" -> Inbound
    | `String "Outbound" -> Outbound
    | `String value -> raise (deserialize_unknown_enum_value_error path "StageTransitionType" value)
    | _ -> raise (deserialize_wrong_type_error path "StageTransitionType")
     : stage_transition_type)
    : stage_transition_type)

let enable_stage_transition_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_name = value_for_key pipeline_name_of_yojson "pipelineName" _list path;
     stage_name = value_for_key stage_name_of_yojson "stageName" _list path;
     transition_type = value_for_key stage_transition_type_of_yojson "transitionType" _list path;
   }
    : enable_stage_transition_input)

let disable_stage_transition_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_name = value_for_key pipeline_name_of_yojson "pipelineName" _list path;
     stage_name = value_for_key stage_name_of_yojson "stageName" _list path;
     transition_type = value_for_key stage_transition_type_of_yojson "transitionType" _list path;
     reason = value_for_key disabled_reason_of_yojson "reason" _list path;
   }
    : disable_stage_transition_input)

let deregister_webhook_with_third_party_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let deregister_webhook_with_third_party_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     webhook_name = option_of_yojson (value_for_key webhook_name_of_yojson "webhookName") _list path;
   }
    : deregister_webhook_with_third_party_input)

let delete_webhook_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_webhook_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key webhook_name_of_yojson "name" _list path } : delete_webhook_input)

let delete_pipeline_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key pipeline_name_of_yojson "name" _list path } : delete_pipeline_input)

let delete_custom_action_type_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     category = value_for_key action_category_of_yojson "category" _list path;
     provider = value_for_key action_provider_of_yojson "provider" _list path;
     version = value_for_key version_of_yojson "version" _list path;
   }
    : delete_custom_action_type_input)

let pipeline_name_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : pipeline_name_in_use_exception)

let create_pipeline_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline =
       option_of_yojson (value_for_key pipeline_declaration_of_yojson "pipeline") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_pipeline_output)

let create_pipeline_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline = value_for_key pipeline_declaration_of_yojson "pipeline" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_pipeline_input)

let create_custom_action_type_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_type = value_for_key action_type_of_yojson "actionType" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_custom_action_type_output)

let create_custom_action_type_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     category = value_for_key action_category_of_yojson "category" _list path;
     provider = value_for_key action_provider_of_yojson "provider" _list path;
     version = value_for_key version_of_yojson "version" _list path;
     settings =
       option_of_yojson (value_for_key action_type_settings_of_yojson "settings") _list path;
     configuration_properties =
       option_of_yojson
         (value_for_key action_configuration_property_list_of_yojson "configurationProperties")
         _list path;
     input_artifact_details =
       value_for_key artifact_details_of_yojson "inputArtifactDetails" _list path;
     output_artifact_details =
       value_for_key artifact_details_of_yojson "outputArtifactDetails" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_custom_action_type_input)
