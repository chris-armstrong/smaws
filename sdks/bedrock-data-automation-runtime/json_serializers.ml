open Smaws_Lib.Json.SerializeHelpers
open Types

let non_blank_string_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", option_to_yojson non_blank_string_to_yojson x.message) ]

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson non_blank_string_to_yojson x.message) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", option_to_yojson non_blank_string_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson non_blank_string_to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("message", option_to_yojson non_blank_string_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let taggable_resource_arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceARN", Some (taggable_resource_arn_to_yojson x.resource_ar_n));
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson non_blank_string_to_yojson x.message) ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("key", Some (tag_key_to_yojson x.key)); ("value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceARN", Some (taggable_resource_arn_to_yojson x.resource_ar_n));
      ("tags", Some (tag_list_to_yojson x.tags));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceARN", Some (taggable_resource_arn_to_yojson x.resource_ar_n)) ]

let service_unavailable_exception_to_yojson (x : service_unavailable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson non_blank_string_to_yojson x.message) ]

let custom_output_status_to_yojson (x : custom_output_status) =
  match x with MATCH -> `String "MATCH" | NO_MATCH -> `String "NO_MATCH"

let output_segment_to_yojson (x : output_segment) =
  assoc_to_yojson
    [
      ("customOutputStatus", option_to_yojson custom_output_status_to_yojson x.custom_output_status);
      ( "customOutput",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.custom_output );
      ( "standardOutput",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.standard_output
      );
    ]

let output_segment_list_to_yojson tree = list_to_yojson output_segment_to_yojson tree

let semantic_modality_to_yojson (x : semantic_modality) =
  match x with
  | DOCUMENT -> `String "DOCUMENT"
  | IMAGE -> `String "IMAGE"
  | AUDIO -> `String "AUDIO"
  | VIDEO -> `String "VIDEO"

let s3_uri_to_yojson = string_to_yojson

let output_configuration_to_yojson (x : output_configuration) =
  assoc_to_yojson [ ("s3Uri", Some (s3_uri_to_yojson x.s3_uri)) ]

let invoke_data_automation_response_to_yojson (x : invoke_data_automation_response) =
  assoc_to_yojson
    [
      ("outputConfiguration", option_to_yojson output_configuration_to_yojson x.output_configuration);
      ("semanticModality", Some (semantic_modality_to_yojson x.semantic_modality));
      ("outputSegments", option_to_yojson output_segment_list_to_yojson x.output_segments);
    ]

let encryption_context_value_to_yojson = string_to_yojson
let encryption_context_key_to_yojson = string_to_yojson

let encryption_context_map_to_yojson tree =
  map_to_yojson encryption_context_key_to_yojson encryption_context_value_to_yojson tree

let kms_key_id_to_yojson = string_to_yojson

let encryption_configuration_to_yojson (x : encryption_configuration) =
  assoc_to_yojson
    [
      ("kmsKeyId", Some (kms_key_id_to_yojson x.kms_key_id));
      ( "kmsEncryptionContext",
        option_to_yojson encryption_context_map_to_yojson x.kms_encryption_context );
    ]

let data_automation_profile_arn_to_yojson = string_to_yojson

let blueprint_stage_to_yojson (x : blueprint_stage) =
  match x with DEVELOPMENT -> `String "DEVELOPMENT" | LIVE -> `String "LIVE"

let blueprint_version_to_yojson = string_to_yojson
let blueprint_arn_to_yojson = string_to_yojson

let blueprint_to_yojson (x : blueprint) =
  assoc_to_yojson
    [
      ("blueprintArn", Some (blueprint_arn_to_yojson x.blueprint_arn));
      ("version", option_to_yojson blueprint_version_to_yojson x.version);
      ("stage", option_to_yojson blueprint_stage_to_yojson x.stage);
    ]

let blueprint_list_to_yojson tree = list_to_yojson blueprint_to_yojson tree

let data_automation_stage_to_yojson (x : data_automation_stage) =
  match x with LIVE -> `String "LIVE" | DEVELOPMENT -> `String "DEVELOPMENT"

let data_automation_arn_to_yojson = string_to_yojson

let data_automation_configuration_to_yojson (x : data_automation_configuration) =
  assoc_to_yojson
    [
      ( "dataAutomationProjectArn",
        Some (data_automation_arn_to_yojson x.data_automation_project_arn) );
      ("stage", option_to_yojson data_automation_stage_to_yojson x.stage);
    ]

let sync_input_configuration_to_yojson (x : sync_input_configuration) =
  assoc_to_yojson
    [
      ("bytes", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.blob_to_yojson x.bytes);
      ("s3Uri", option_to_yojson s3_uri_to_yojson x.s3_uri);
    ]

let invoke_data_automation_request_to_yojson (x : invoke_data_automation_request) =
  assoc_to_yojson
    [
      ("inputConfiguration", Some (sync_input_configuration_to_yojson x.input_configuration));
      ( "dataAutomationConfiguration",
        option_to_yojson data_automation_configuration_to_yojson x.data_automation_configuration );
      ("blueprints", option_to_yojson blueprint_list_to_yojson x.blueprints);
      ( "dataAutomationProfileArn",
        Some (data_automation_profile_arn_to_yojson x.data_automation_profile_arn) );
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("outputConfiguration", option_to_yojson output_configuration_to_yojson x.output_configuration);
    ]

let timestamp_segment_to_yojson (x : timestamp_segment) =
  assoc_to_yojson
    [
      ( "startTimeMillis",
        Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.start_time_millis) );
      ( "endTimeMillis",
        Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.end_time_millis) );
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

let asset_processing_configuration_to_yojson (x : asset_processing_configuration) =
  assoc_to_yojson
    [ ("video", option_to_yojson video_asset_processing_configuration_to_yojson x.video) ]

let automation_job_status_to_yojson (x : automation_job_status) =
  match x with
  | CREATED -> `String "Created"
  | IN_PROGRESS -> `String "InProgress"
  | SUCCESS -> `String "Success"
  | SERVICE_ERROR -> `String "ServiceError"
  | CLIENT_ERROR -> `String "ClientError"

let event_bridge_configuration_to_yojson (x : event_bridge_configuration) =
  assoc_to_yojson
    [
      ( "eventBridgeEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.event_bridge_enabled) );
    ]

let get_data_automation_status_response_to_yojson (x : get_data_automation_status_response) =
  assoc_to_yojson
    [
      ("status", option_to_yojson automation_job_status_to_yojson x.status);
      ( "errorType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_type );
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ("outputConfiguration", option_to_yojson output_configuration_to_yojson x.output_configuration);
      ( "jobSubmissionTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.job_submission_time );
      ( "jobCompletionTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.job_completion_time );
      ( "jobDurationInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.job_duration_in_seconds );
    ]

let invocation_arn_to_yojson = string_to_yojson

let get_data_automation_status_request_to_yojson (x : get_data_automation_status_request) =
  assoc_to_yojson [ ("invocationArn", Some (invocation_arn_to_yojson x.invocation_arn)) ]

let idempotency_token_to_yojson = string_to_yojson

let input_configuration_to_yojson (x : input_configuration) =
  assoc_to_yojson
    [
      ("s3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ( "assetProcessingConfiguration",
        option_to_yojson asset_processing_configuration_to_yojson x.asset_processing_configuration
      );
    ]

let invoke_data_automation_async_response_to_yojson (x : invoke_data_automation_async_response) =
  assoc_to_yojson [ ("invocationArn", Some (invocation_arn_to_yojson x.invocation_arn)) ]

let notification_configuration_to_yojson (x : notification_configuration) =
  assoc_to_yojson
    [
      ( "eventBridgeConfiguration",
        Some (event_bridge_configuration_to_yojson x.event_bridge_configuration) );
    ]

let invoke_data_automation_async_request_to_yojson (x : invoke_data_automation_async_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("inputConfiguration", Some (input_configuration_to_yojson x.input_configuration));
      ("outputConfiguration", Some (output_configuration_to_yojson x.output_configuration));
      ( "dataAutomationConfiguration",
        option_to_yojson data_automation_configuration_to_yojson x.data_automation_configuration );
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "notificationConfiguration",
        option_to_yojson notification_configuration_to_yojson x.notification_configuration );
      ("blueprints", option_to_yojson blueprint_list_to_yojson x.blueprints);
      ( "dataAutomationProfileArn",
        Some (data_automation_profile_arn_to_yojson x.data_automation_profile_arn) );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]
