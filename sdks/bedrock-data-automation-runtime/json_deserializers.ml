open Smaws_Lib.Json.DeserializeHelpers
open Types

let non_blank_string_of_yojson = string_of_yojson

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_blank_string_of_yojson "message") _list path }
    : access_denied_exception)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_blank_string_of_yojson "message") _list path }
    : validation_exception)

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

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path
let taggable_resource_arn_of_yojson = string_of_yojson

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key taggable_resource_arn_of_yojson "resourceARN" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "tagKeys" _list path;
   }
    : untag_resource_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_blank_string_of_yojson "message") _list path }
    : service_quota_exceeded_exception)

let tag_resource_response_of_yojson tree path =
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

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key taggable_resource_arn_of_yojson "resourceARN" _list path;
     tags = value_for_key tag_list_of_yojson "tags" _list path;
   }
    : tag_resource_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key taggable_resource_arn_of_yojson "resourceARN" _list path }
    : list_tags_for_resource_request)

let service_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_blank_string_of_yojson "message") _list path }
    : service_unavailable_exception)

let custom_output_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "MATCH" -> MATCH
    | `String "NO_MATCH" -> NO_MATCH
    | `String value -> raise (deserialize_unknown_enum_value_error path "CustomOutputStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomOutputStatus")
     : custom_output_status)
    : custom_output_status)

let output_segment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_output_status =
       option_of_yojson
         (value_for_key custom_output_status_of_yojson "customOutputStatus")
         _list path;
     custom_output =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "customOutput")
         _list path;
     standard_output =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "standardOutput")
         _list path;
   }
    : output_segment)

let output_segment_list_of_yojson tree path = list_of_yojson output_segment_of_yojson tree path

let semantic_modality_of_yojson (tree : t) path =
  ((match tree with
    | `String "DOCUMENT" -> DOCUMENT
    | `String "IMAGE" -> IMAGE
    | `String "AUDIO" -> AUDIO
    | `String "VIDEO" -> VIDEO
    | `String value -> raise (deserialize_unknown_enum_value_error path "SemanticModality" value)
    | _ -> raise (deserialize_wrong_type_error path "SemanticModality")
     : semantic_modality)
    : semantic_modality)

let s3_uri_of_yojson = string_of_yojson

let output_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_uri = value_for_key s3_uri_of_yojson "s3Uri" _list path } : output_configuration)

let invoke_data_automation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_configuration =
       option_of_yojson
         (value_for_key output_configuration_of_yojson "outputConfiguration")
         _list path;
     semantic_modality = value_for_key semantic_modality_of_yojson "semanticModality" _list path;
     output_segments =
       option_of_yojson (value_for_key output_segment_list_of_yojson "outputSegments") _list path;
   }
    : invoke_data_automation_response)

let encryption_context_value_of_yojson = string_of_yojson
let encryption_context_key_of_yojson = string_of_yojson

let encryption_context_map_of_yojson tree path =
  map_of_yojson encryption_context_key_of_yojson encryption_context_value_of_yojson tree path

let kms_key_id_of_yojson = string_of_yojson

let encryption_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id = value_for_key kms_key_id_of_yojson "kmsKeyId" _list path;
     kms_encryption_context =
       option_of_yojson
         (value_for_key encryption_context_map_of_yojson "kmsEncryptionContext")
         _list path;
   }
    : encryption_configuration)

let data_automation_profile_arn_of_yojson = string_of_yojson

let blueprint_stage_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEVELOPMENT" -> DEVELOPMENT
    | `String "LIVE" -> LIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "BlueprintStage" value)
    | _ -> raise (deserialize_wrong_type_error path "BlueprintStage")
     : blueprint_stage)
    : blueprint_stage)

let blueprint_version_of_yojson = string_of_yojson
let blueprint_arn_of_yojson = string_of_yojson

let blueprint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blueprint_arn = value_for_key blueprint_arn_of_yojson "blueprintArn" _list path;
     version = option_of_yojson (value_for_key blueprint_version_of_yojson "version") _list path;
     stage = option_of_yojson (value_for_key blueprint_stage_of_yojson "stage") _list path;
   }
    : blueprint)

let blueprint_list_of_yojson tree path = list_of_yojson blueprint_of_yojson tree path

let data_automation_stage_of_yojson (tree : t) path =
  ((match tree with
    | `String "LIVE" -> LIVE
    | `String "DEVELOPMENT" -> DEVELOPMENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataAutomationStage" value)
    | _ -> raise (deserialize_wrong_type_error path "DataAutomationStage")
     : data_automation_stage)
    : data_automation_stage)

let data_automation_arn_of_yojson = string_of_yojson

let data_automation_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_automation_project_arn =
       value_for_key data_automation_arn_of_yojson "dataAutomationProjectArn" _list path;
     stage = option_of_yojson (value_for_key data_automation_stage_of_yojson "stage") _list path;
   }
    : data_automation_configuration)

let sync_input_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bytes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.blob_of_yojson "bytes")
         _list path;
     s3_uri = option_of_yojson (value_for_key s3_uri_of_yojson "s3Uri") _list path;
   }
    : sync_input_configuration)

let invoke_data_automation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_configuration =
       value_for_key sync_input_configuration_of_yojson "inputConfiguration" _list path;
     data_automation_configuration =
       option_of_yojson
         (value_for_key data_automation_configuration_of_yojson "dataAutomationConfiguration")
         _list path;
     blueprints = option_of_yojson (value_for_key blueprint_list_of_yojson "blueprints") _list path;
     data_automation_profile_arn =
       value_for_key data_automation_profile_arn_of_yojson "dataAutomationProfileArn" _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "encryptionConfiguration")
         _list path;
     output_configuration =
       option_of_yojson
         (value_for_key output_configuration_of_yojson "outputConfiguration")
         _list path;
   }
    : invoke_data_automation_request)

let timestamp_segment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_time_millis =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "startTimeMillis" _list
         path;
     end_time_millis =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "endTimeMillis" _list
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

let asset_processing_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     video =
       option_of_yojson
         (value_for_key video_asset_processing_configuration_of_yojson "video")
         _list path;
   }
    : asset_processing_configuration)

let automation_job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Created" -> CREATED
    | `String "InProgress" -> IN_PROGRESS
    | `String "Success" -> SUCCESS
    | `String "ServiceError" -> SERVICE_ERROR
    | `String "ClientError" -> CLIENT_ERROR
    | `String value -> raise (deserialize_unknown_enum_value_error path "AutomationJobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AutomationJobStatus")
     : automation_job_status)
    : automation_job_status)

let event_bridge_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_bridge_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "eventBridgeEnabled"
         _list path;
   }
    : event_bridge_configuration)

let get_data_automation_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key automation_job_status_of_yojson "status") _list path;
     error_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorType")
         _list path;
     error_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorMessage")
         _list path;
     output_configuration =
       option_of_yojson
         (value_for_key output_configuration_of_yojson "outputConfiguration")
         _list path;
     job_submission_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "jobSubmissionTime")
         _list path;
     job_completion_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "jobCompletionTime")
         _list path;
     job_duration_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "jobDurationInSeconds")
         _list path;
   }
    : get_data_automation_status_response)

let invocation_arn_of_yojson = string_of_yojson

let get_data_automation_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ invocation_arn = value_for_key invocation_arn_of_yojson "invocationArn" _list path }
    : get_data_automation_status_request)

let idempotency_token_of_yojson = string_of_yojson

let input_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_uri = value_for_key s3_uri_of_yojson "s3Uri" _list path;
     asset_processing_configuration =
       option_of_yojson
         (value_for_key asset_processing_configuration_of_yojson "assetProcessingConfiguration")
         _list path;
   }
    : input_configuration)

let invoke_data_automation_async_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ invocation_arn = value_for_key invocation_arn_of_yojson "invocationArn" _list path }
    : invoke_data_automation_async_response)

let notification_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_bridge_configuration =
       value_for_key event_bridge_configuration_of_yojson "eventBridgeConfiguration" _list path;
   }
    : notification_configuration)

let invoke_data_automation_async_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "clientToken") _list path;
     input_configuration =
       value_for_key input_configuration_of_yojson "inputConfiguration" _list path;
     output_configuration =
       value_for_key output_configuration_of_yojson "outputConfiguration" _list path;
     data_automation_configuration =
       option_of_yojson
         (value_for_key data_automation_configuration_of_yojson "dataAutomationConfiguration")
         _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "encryptionConfiguration")
         _list path;
     notification_configuration =
       option_of_yojson
         (value_for_key notification_configuration_of_yojson "notificationConfiguration")
         _list path;
     blueprints = option_of_yojson (value_for_key blueprint_list_of_yojson "blueprints") _list path;
     data_automation_profile_arn =
       value_for_key data_automation_profile_arn_of_yojson "dataAutomationProfileArn" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : invoke_data_automation_async_request)
