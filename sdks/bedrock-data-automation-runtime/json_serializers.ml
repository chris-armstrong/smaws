open Smaws_Lib.Json.SerializeHelpers
open Types

let timestamp_segment_to_yojson (x : timestamp_segment) =
  assoc_to_yojson
    [
      ( "endTimeMillis",
        Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.end_time_millis) );
      ( "startTimeMillis",
        Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.start_time_millis) );
    ]

let video_segment_configuration_to_yojson (x : video_segment_configuration) =
  match x with
  | TimestampSegment arg ->
      assoc_to_yojson [ ("timestampSegment", Some (timestamp_segment_to_yojson arg)) ]

let video_asset_processing_configuration_to_yojson (x : video_asset_processing_configuration) =
  assoc_to_yojson
    [
      ( "segmentConfiguration",
        option_to_yojson video_segment_configuration_to_yojson x.segment_configuration );
    ]

let non_blank_string_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson non_blank_string_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let taggable_resource_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("resourceARN", Some (taggable_resource_arn_to_yojson x.resource_ar_n));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", option_to_yojson non_blank_string_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson non_blank_string_to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("message", option_to_yojson non_blank_string_to_yojson x.message) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", option_to_yojson non_blank_string_to_yojson x.message) ]

let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("value", Some (tag_value_to_yojson x.value)); ("key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("tags", Some (tag_list_to_yojson x.tags));
      ("resourceARN", Some (taggable_resource_arn_to_yojson x.resource_ar_n));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson non_blank_string_to_yojson x.message) ]

let s3_uri_to_yojson = string_to_yojson

let sync_input_configuration_to_yojson (x : sync_input_configuration) =
  assoc_to_yojson
    [
      ("s3Uri", option_to_yojson s3_uri_to_yojson x.s3_uri);
      ("bytes", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.blob_to_yojson x.bytes);
    ]

let service_unavailable_exception_to_yojson (x : service_unavailable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson non_blank_string_to_yojson x.message) ]

let semantic_modality_to_yojson (x : semantic_modality) =
  match x with
  | VIDEO -> `String "VIDEO"
  | AUDIO -> `String "AUDIO"
  | IMAGE -> `String "IMAGE"
  | DOCUMENT -> `String "DOCUMENT"

let custom_output_status_to_yojson (x : custom_output_status) =
  match x with NO_MATCH -> `String "NO_MATCH" | MATCH -> `String "MATCH"

let output_segment_to_yojson (x : output_segment) =
  assoc_to_yojson
    [
      ( "standardOutput",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.standard_output
      );
      ( "customOutput",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.custom_output );
      ("customOutputStatus", option_to_yojson custom_output_status_to_yojson x.custom_output_status);
    ]

let output_segment_list_to_yojson tree = list_to_yojson output_segment_to_yojson tree

let output_configuration_to_yojson (x : output_configuration) =
  assoc_to_yojson [ ("s3Uri", Some (s3_uri_to_yojson x.s3_uri)) ]

let event_bridge_configuration_to_yojson (x : event_bridge_configuration) =
  assoc_to_yojson
    [
      ( "eventBridgeEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.event_bridge_enabled) );
    ]

let notification_configuration_to_yojson (x : notification_configuration) =
  assoc_to_yojson
    [
      ( "eventBridgeConfiguration",
        Some (event_bridge_configuration_to_yojson x.event_bridge_configuration) );
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceARN", Some (taggable_resource_arn_to_yojson x.resource_ar_n)) ]

let kms_key_id_to_yojson = string_to_yojson

let invoke_data_automation_response_to_yojson (x : invoke_data_automation_response) =
  assoc_to_yojson
    [
      ("outputSegments", option_to_yojson output_segment_list_to_yojson x.output_segments);
      ("semanticModality", Some (semantic_modality_to_yojson x.semantic_modality));
      ("outputConfiguration", option_to_yojson output_configuration_to_yojson x.output_configuration);
    ]

let data_automation_arn_to_yojson = string_to_yojson

let data_automation_stage_to_yojson (x : data_automation_stage) =
  match x with DEVELOPMENT -> `String "DEVELOPMENT" | LIVE -> `String "LIVE"

let data_automation_configuration_to_yojson (x : data_automation_configuration) =
  assoc_to_yojson
    [
      ("stage", option_to_yojson data_automation_stage_to_yojson x.stage);
      ( "dataAutomationProjectArn",
        Some (data_automation_arn_to_yojson x.data_automation_project_arn) );
    ]

let blueprint_arn_to_yojson = string_to_yojson
let blueprint_version_to_yojson = string_to_yojson

let blueprint_stage_to_yojson (x : blueprint_stage) =
  match x with LIVE -> `String "LIVE" | DEVELOPMENT -> `String "DEVELOPMENT"

let blueprint_to_yojson (x : blueprint) =
  assoc_to_yojson
    [
      ("stage", option_to_yojson blueprint_stage_to_yojson x.stage);
      ("version", option_to_yojson blueprint_version_to_yojson x.version);
      ("blueprintArn", Some (blueprint_arn_to_yojson x.blueprint_arn));
    ]

let blueprint_list_to_yojson tree = list_to_yojson blueprint_to_yojson tree
let data_automation_profile_arn_to_yojson = string_to_yojson
let encryption_context_value_to_yojson = string_to_yojson
let encryption_context_key_to_yojson = string_to_yojson

let encryption_context_map_to_yojson tree =
  map_to_yojson encryption_context_key_to_yojson encryption_context_value_to_yojson tree

let encryption_configuration_to_yojson (x : encryption_configuration) =
  assoc_to_yojson
    [
      ( "kmsEncryptionContext",
        option_to_yojson encryption_context_map_to_yojson x.kms_encryption_context );
      ("kmsKeyId", Some (kms_key_id_to_yojson x.kms_key_id));
    ]

let invoke_data_automation_request_to_yojson (x : invoke_data_automation_request) =
  assoc_to_yojson
    [
      ("outputConfiguration", option_to_yojson output_configuration_to_yojson x.output_configuration);
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "dataAutomationProfileArn",
        Some (data_automation_profile_arn_to_yojson x.data_automation_profile_arn) );
      ("blueprints", option_to_yojson blueprint_list_to_yojson x.blueprints);
      ( "dataAutomationConfiguration",
        option_to_yojson data_automation_configuration_to_yojson x.data_automation_configuration );
      ("inputConfiguration", Some (sync_input_configuration_to_yojson x.input_configuration));
    ]

let invocation_arn_to_yojson = string_to_yojson

let invoke_data_automation_async_response_to_yojson (x : invoke_data_automation_async_response) =
  assoc_to_yojson [ ("invocationArn", Some (invocation_arn_to_yojson x.invocation_arn)) ]

let idempotency_token_to_yojson = string_to_yojson

let asset_processing_configuration_to_yojson (x : asset_processing_configuration) =
  assoc_to_yojson
    [ ("video", option_to_yojson video_asset_processing_configuration_to_yojson x.video) ]

let input_configuration_to_yojson (x : input_configuration) =
  assoc_to_yojson
    [
      ( "assetProcessingConfiguration",
        option_to_yojson asset_processing_configuration_to_yojson x.asset_processing_configuration
      );
      ("s3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let invoke_data_automation_async_request_to_yojson (x : invoke_data_automation_async_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "dataAutomationProfileArn",
        Some (data_automation_profile_arn_to_yojson x.data_automation_profile_arn) );
      ("blueprints", option_to_yojson blueprint_list_to_yojson x.blueprints);
      ( "notificationConfiguration",
        option_to_yojson notification_configuration_to_yojson x.notification_configuration );
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "dataAutomationConfiguration",
        option_to_yojson data_automation_configuration_to_yojson x.data_automation_configuration );
      ("outputConfiguration", Some (output_configuration_to_yojson x.output_configuration));
      ("inputConfiguration", Some (input_configuration_to_yojson x.input_configuration));
      ( "clientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let automation_job_status_to_yojson (x : automation_job_status) =
  match x with
  | CLIENT_ERROR -> `String "ClientError"
  | SERVICE_ERROR -> `String "ServiceError"
  | SUCCESS -> `String "Success"
  | IN_PROGRESS -> `String "InProgress"
  | CREATED -> `String "Created"

let get_data_automation_status_response_to_yojson (x : get_data_automation_status_response) =
  assoc_to_yojson
    [
      ( "jobDurationInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.job_duration_in_seconds );
      ( "jobCompletionTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.job_completion_time );
      ( "jobSubmissionTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.job_submission_time );
      ("outputConfiguration", option_to_yojson output_configuration_to_yojson x.output_configuration);
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ( "errorType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_type );
      ("status", option_to_yojson automation_job_status_to_yojson x.status);
    ]

let get_data_automation_status_request_to_yojson (x : get_data_automation_status_request) =
  assoc_to_yojson [ ("invocationArn", Some (invocation_arn_to_yojson x.invocation_arn)) ]
