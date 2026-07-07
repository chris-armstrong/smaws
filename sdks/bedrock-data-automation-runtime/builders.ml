open Types

let make_timestamp_segment ~end_time_millis:(end_time_millis_ : Smaws_Lib.Smithy_api.Types.long)
    ~start_time_millis:(start_time_millis_ : Smaws_Lib.Smithy_api.Types.long) () =
  ({ end_time_millis = end_time_millis_; start_time_millis = start_time_millis_ }
    : timestamp_segment)

let make_video_asset_processing_configuration
    ?segment_configuration:(segment_configuration_ : video_segment_configuration option) () =
  ({ segment_configuration = segment_configuration_ } : video_asset_processing_configuration)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : taggable_resource_arn) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_ar_n:(resource_ar_n_ : taggable_resource_arn) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_sync_input_configuration ?s3_uri:(s3_uri_ : s3_uri option)
    ?bytes:(bytes_ : Smaws_Lib.Smithy_api.Types.blob option) () =
  ({ s3_uri = s3_uri_; bytes = bytes_ } : sync_input_configuration)

let make_output_segment
    ?standard_output:(standard_output_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?custom_output:(custom_output_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?custom_output_status:(custom_output_status_ : custom_output_status option) () =
  ({
     standard_output = standard_output_;
     custom_output = custom_output_;
     custom_output_status = custom_output_status_;
   }
    : output_segment)

let make_output_configuration ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ s3_uri = s3_uri_ } : output_configuration)

let make_event_bridge_configuration
    ~event_bridge_enabled:(event_bridge_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_) () =
  ({ event_bridge_enabled = event_bridge_enabled_ } : event_bridge_configuration)

let make_notification_configuration
    ~event_bridge_configuration:(event_bridge_configuration_ : event_bridge_configuration) () =
  ({ event_bridge_configuration = event_bridge_configuration_ } : notification_configuration)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : taggable_resource_arn) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_invoke_data_automation_response
    ?output_segments:(output_segments_ : output_segment_list option)
    ?output_configuration:(output_configuration_ : output_configuration option)
    ~semantic_modality:(semantic_modality_ : semantic_modality) () =
  ({
     output_segments = output_segments_;
     semantic_modality = semantic_modality_;
     output_configuration = output_configuration_;
   }
    : invoke_data_automation_response)

let make_data_automation_configuration ?stage:(stage_ : data_automation_stage option)
    ~data_automation_project_arn:(data_automation_project_arn_ : data_automation_arn) () =
  ({ stage = stage_; data_automation_project_arn = data_automation_project_arn_ }
    : data_automation_configuration)

let make_blueprint ?stage:(stage_ : blueprint_stage option)
    ?version:(version_ : blueprint_version option) ~blueprint_arn:(blueprint_arn_ : blueprint_arn)
    () =
  ({ stage = stage_; version = version_; blueprint_arn = blueprint_arn_ } : blueprint)

let make_encryption_configuration
    ?kms_encryption_context:(kms_encryption_context_ : encryption_context_map option)
    ~kms_key_id:(kms_key_id_ : kms_key_id) () =
  ({ kms_encryption_context = kms_encryption_context_; kms_key_id = kms_key_id_ }
    : encryption_configuration)

let make_invoke_data_automation_request
    ?output_configuration:(output_configuration_ : output_configuration option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?blueprints:(blueprints_ : blueprint_list option)
    ?data_automation_configuration:
      (data_automation_configuration_ : data_automation_configuration option)
    ~data_automation_profile_arn:(data_automation_profile_arn_ : data_automation_profile_arn)
    ~input_configuration:(input_configuration_ : sync_input_configuration) () =
  ({
     output_configuration = output_configuration_;
     encryption_configuration = encryption_configuration_;
     data_automation_profile_arn = data_automation_profile_arn_;
     blueprints = blueprints_;
     data_automation_configuration = data_automation_configuration_;
     input_configuration = input_configuration_;
   }
    : invoke_data_automation_request)

let make_invoke_data_automation_async_response ~invocation_arn:(invocation_arn_ : invocation_arn) ()
    =
  ({ invocation_arn = invocation_arn_ } : invoke_data_automation_async_response)

let make_asset_processing_configuration
    ?video:(video_ : video_asset_processing_configuration option) () =
  ({ video = video_ } : asset_processing_configuration)

let make_input_configuration
    ?asset_processing_configuration:
      (asset_processing_configuration_ : asset_processing_configuration option)
    ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ asset_processing_configuration = asset_processing_configuration_; s3_uri = s3_uri_ }
    : input_configuration)

let make_invoke_data_automation_async_request ?tags:(tags_ : tag_list option)
    ?blueprints:(blueprints_ : blueprint_list option)
    ?notification_configuration:(notification_configuration_ : notification_configuration option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?data_automation_configuration:
      (data_automation_configuration_ : data_automation_configuration option)
    ?client_token:(client_token_ : idempotency_token option)
    ~data_automation_profile_arn:(data_automation_profile_arn_ : data_automation_profile_arn)
    ~output_configuration:(output_configuration_ : output_configuration)
    ~input_configuration:(input_configuration_ : input_configuration) () =
  ({
     tags = tags_;
     data_automation_profile_arn = data_automation_profile_arn_;
     blueprints = blueprints_;
     notification_configuration = notification_configuration_;
     encryption_configuration = encryption_configuration_;
     data_automation_configuration = data_automation_configuration_;
     output_configuration = output_configuration_;
     input_configuration = input_configuration_;
     client_token = client_token_;
   }
    : invoke_data_automation_async_request)

let make_get_data_automation_status_response
    ?job_duration_in_seconds:(job_duration_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?job_completion_time:(job_completion_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?job_submission_time:(job_submission_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?output_configuration:(output_configuration_ : output_configuration option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_type:(error_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : automation_job_status option) () =
  ({
     job_duration_in_seconds = job_duration_in_seconds_;
     job_completion_time = job_completion_time_;
     job_submission_time = job_submission_time_;
     output_configuration = output_configuration_;
     error_message = error_message_;
     error_type = error_type_;
     status = status_;
   }
    : get_data_automation_status_response)

let make_get_data_automation_status_request ~invocation_arn:(invocation_arn_ : invocation_arn) () =
  ({ invocation_arn = invocation_arn_ } : get_data_automation_status_request)
