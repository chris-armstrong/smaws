open Smaws_Lib.Json.DeserializeHelpers
open Types

let timestamp_segment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time_millis =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "endTimeMillis" _list
         path;
     start_time_millis =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "startTimeMillis" _list
         path;
   }
    : timestamp_segment)

let video_segment_configuration_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "timestampSegment" -> TimestampSegment (timestamp_segment_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "VideoSegmentConfiguration" unknown)
    : video_segment_configuration)

let video_asset_processing_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     segment_configuration =
       option_of_yojson
         (value_for_key video_segment_configuration_of_yojson "segmentConfiguration")
         _list path;
   }
    : video_asset_processing_configuration)

let non_blank_string_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_blank_string_of_yojson "message") _list path }
    : validation_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let taggable_resource_arn_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "tagKeys" _list path;
     resource_ar_n = value_for_key taggable_resource_arn_of_yojson "resourceARN" _list path;
   }
    : untag_resource_request)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_blank_string_of_yojson "message") _list path }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_blank_string_of_yojson "message") _list path }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_blank_string_of_yojson "message") _list path }
    : internal_server_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_blank_string_of_yojson "message") _list path }
    : access_denied_exception)

let tag_value_of_yojson = string_of_yojson

let tag_resource_response_of_yojson tree path =
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

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "tags" _list path;
     resource_ar_n = value_for_key taggable_resource_arn_of_yojson "resourceARN" _list path;
   }
    : tag_resource_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_blank_string_of_yojson "message") _list path }
    : service_quota_exceeded_exception)

let s3_uri_of_yojson = string_of_yojson

let sync_input_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_uri = option_of_yojson (value_for_key s3_uri_of_yojson "s3Uri") _list path;
     bytes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.blob_of_yojson "bytes")
         _list path;
   }
    : sync_input_configuration)

let service_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_blank_string_of_yojson "message") _list path }
    : service_unavailable_exception)

let semantic_modality_of_yojson (tree : t) path =
  ((match tree with
    | `String "VIDEO" -> VIDEO
    | `String "AUDIO" -> AUDIO
    | `String "IMAGE" -> IMAGE
    | `String "DOCUMENT" -> DOCUMENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "SemanticModality" value)
    | _ -> raise (deserialize_wrong_type_error path "SemanticModality")
     : semantic_modality)
    : semantic_modality)

let custom_output_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "NO_MATCH" -> NO_MATCH
    | `String "MATCH" -> MATCH
    | `String value -> raise (deserialize_unknown_enum_value_error path "CustomOutputStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomOutputStatus")
     : custom_output_status)
    : custom_output_status)

let output_segment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     standard_output =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "standardOutput")
         _list path;
     custom_output =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "customOutput")
         _list path;
     custom_output_status =
       option_of_yojson
         (value_for_key custom_output_status_of_yojson "customOutputStatus")
         _list path;
   }
    : output_segment)

let output_segment_list_of_yojson tree path = list_of_yojson output_segment_of_yojson tree path

let output_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_uri = value_for_key s3_uri_of_yojson "s3Uri" _list path } : output_configuration)

let event_bridge_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_bridge_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "eventBridgeEnabled"
         _list path;
   }
    : event_bridge_configuration)

let notification_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_bridge_configuration =
       value_for_key event_bridge_configuration_of_yojson "eventBridgeConfiguration" _list path;
   }
    : notification_configuration)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key taggable_resource_arn_of_yojson "resourceARN" _list path }
    : list_tags_for_resource_request)

let kms_key_id_of_yojson = string_of_yojson

let invoke_data_automation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_segments =
       option_of_yojson (value_for_key output_segment_list_of_yojson "outputSegments") _list path;
     semantic_modality = value_for_key semantic_modality_of_yojson "semanticModality" _list path;
     output_configuration =
       option_of_yojson
         (value_for_key output_configuration_of_yojson "outputConfiguration")
         _list path;
   }
    : invoke_data_automation_response)

let data_automation_arn_of_yojson = string_of_yojson

let data_automation_stage_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEVELOPMENT" -> DEVELOPMENT
    | `String "LIVE" -> LIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataAutomationStage" value)
    | _ -> raise (deserialize_wrong_type_error path "DataAutomationStage")
     : data_automation_stage)
    : data_automation_stage)

let data_automation_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stage = option_of_yojson (value_for_key data_automation_stage_of_yojson "stage") _list path;
     data_automation_project_arn =
       value_for_key data_automation_arn_of_yojson "dataAutomationProjectArn" _list path;
   }
    : data_automation_configuration)

let blueprint_arn_of_yojson = string_of_yojson
let blueprint_version_of_yojson = string_of_yojson

let blueprint_stage_of_yojson (tree : t) path =
  ((match tree with
    | `String "LIVE" -> LIVE
    | `String "DEVELOPMENT" -> DEVELOPMENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "BlueprintStage" value)
    | _ -> raise (deserialize_wrong_type_error path "BlueprintStage")
     : blueprint_stage)
    : blueprint_stage)

let blueprint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stage = option_of_yojson (value_for_key blueprint_stage_of_yojson "stage") _list path;
     version = option_of_yojson (value_for_key blueprint_version_of_yojson "version") _list path;
     blueprint_arn = value_for_key blueprint_arn_of_yojson "blueprintArn" _list path;
   }
    : blueprint)

let blueprint_list_of_yojson tree path = list_of_yojson blueprint_of_yojson tree path
let data_automation_profile_arn_of_yojson = string_of_yojson
let encryption_context_value_of_yojson = string_of_yojson
let encryption_context_key_of_yojson = string_of_yojson

let encryption_context_map_of_yojson tree path =
  map_of_yojson encryption_context_key_of_yojson encryption_context_value_of_yojson tree path

let encryption_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_encryption_context =
       option_of_yojson
         (value_for_key encryption_context_map_of_yojson "kmsEncryptionContext")
         _list path;
     kms_key_id = value_for_key kms_key_id_of_yojson "kmsKeyId" _list path;
   }
    : encryption_configuration)

let invoke_data_automation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_configuration =
       option_of_yojson
         (value_for_key output_configuration_of_yojson "outputConfiguration")
         _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "encryptionConfiguration")
         _list path;
     data_automation_profile_arn =
       value_for_key data_automation_profile_arn_of_yojson "dataAutomationProfileArn" _list path;
     blueprints = option_of_yojson (value_for_key blueprint_list_of_yojson "blueprints") _list path;
     data_automation_configuration =
       option_of_yojson
         (value_for_key data_automation_configuration_of_yojson "dataAutomationConfiguration")
         _list path;
     input_configuration =
       value_for_key sync_input_configuration_of_yojson "inputConfiguration" _list path;
   }
    : invoke_data_automation_request)

let invocation_arn_of_yojson = string_of_yojson

let invoke_data_automation_async_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ invocation_arn = value_for_key invocation_arn_of_yojson "invocationArn" _list path }
    : invoke_data_automation_async_response)

let idempotency_token_of_yojson = string_of_yojson

let asset_processing_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     video =
       option_of_yojson
         (value_for_key video_asset_processing_configuration_of_yojson "video")
         _list path;
   }
    : asset_processing_configuration)

let input_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     asset_processing_configuration =
       option_of_yojson
         (value_for_key asset_processing_configuration_of_yojson "assetProcessingConfiguration")
         _list path;
     s3_uri = value_for_key s3_uri_of_yojson "s3Uri" _list path;
   }
    : input_configuration)

let invoke_data_automation_async_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     data_automation_profile_arn =
       value_for_key data_automation_profile_arn_of_yojson "dataAutomationProfileArn" _list path;
     blueprints = option_of_yojson (value_for_key blueprint_list_of_yojson "blueprints") _list path;
     notification_configuration =
       option_of_yojson
         (value_for_key notification_configuration_of_yojson "notificationConfiguration")
         _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "encryptionConfiguration")
         _list path;
     data_automation_configuration =
       option_of_yojson
         (value_for_key data_automation_configuration_of_yojson "dataAutomationConfiguration")
         _list path;
     output_configuration =
       value_for_key output_configuration_of_yojson "outputConfiguration" _list path;
     input_configuration =
       value_for_key input_configuration_of_yojson "inputConfiguration" _list path;
     client_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "clientToken") _list path;
   }
    : invoke_data_automation_async_request)

let automation_job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ClientError" -> CLIENT_ERROR
    | `String "ServiceError" -> SERVICE_ERROR
    | `String "Success" -> SUCCESS
    | `String "InProgress" -> IN_PROGRESS
    | `String "Created" -> CREATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AutomationJobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AutomationJobStatus")
     : automation_job_status)
    : automation_job_status)

let get_data_automation_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_duration_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "jobDurationInSeconds")
         _list path;
     job_completion_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "jobCompletionTime")
         _list path;
     job_submission_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "jobSubmissionTime")
         _list path;
     output_configuration =
       option_of_yojson
         (value_for_key output_configuration_of_yojson "outputConfiguration")
         _list path;
     error_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorMessage")
         _list path;
     error_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorType")
         _list path;
     status = option_of_yojson (value_for_key automation_job_status_of_yojson "status") _list path;
   }
    : get_data_automation_status_response)

let get_data_automation_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ invocation_arn = value_for_key invocation_arn_of_yojson "invocationArn" _list path }
    : get_data_automation_status_request)
