open Types

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : taggable_resource_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : taggable_resource_arn)
    ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : taggable_resource_arn) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_output_segment ?custom_output_status:(custom_output_status_ : custom_output_status option)
    ?custom_output:(custom_output_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?standard_output:(standard_output_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     custom_output_status = custom_output_status_;
     custom_output = custom_output_;
     standard_output = standard_output_;
   }
    : output_segment)

let make_output_configuration ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ s3_uri = s3_uri_ } : output_configuration)

let make_invoke_data_automation_response
    ?output_configuration:(output_configuration_ : output_configuration option)
    ?output_segments:(output_segments_ : output_segment_list option)
    ~semantic_modality:(semantic_modality_ : semantic_modality) () =
  ({
     output_configuration = output_configuration_;
     semantic_modality = semantic_modality_;
     output_segments = output_segments_;
   }
    : invoke_data_automation_response)

let make_encryption_configuration
    ?kms_encryption_context:(kms_encryption_context_ : encryption_context_map option)
    ~kms_key_id:(kms_key_id_ : kms_key_id) () =
  ({ kms_key_id = kms_key_id_; kms_encryption_context = kms_encryption_context_ }
    : encryption_configuration)

let make_blueprint ?version:(version_ : blueprint_version option)
    ?stage:(stage_ : blueprint_stage option) ~blueprint_arn:(blueprint_arn_ : blueprint_arn) () =
  ({ blueprint_arn = blueprint_arn_; version = version_; stage = stage_ } : blueprint)

let make_data_automation_configuration ?stage:(stage_ : data_automation_stage option)
    ~data_automation_project_arn:(data_automation_project_arn_ : data_automation_arn) () =
  ({ data_automation_project_arn = data_automation_project_arn_; stage = stage_ }
    : data_automation_configuration)

let make_sync_input_configuration ?bytes:(bytes_ : Smaws_Lib.Smithy_api.Types.blob option)
    ?s3_uri:(s3_uri_ : s3_uri option) () =
  ({ bytes = bytes_; s3_uri = s3_uri_ } : sync_input_configuration)

let make_invoke_data_automation_request
    ?data_automation_configuration:
      (data_automation_configuration_ : data_automation_configuration option)
    ?blueprints:(blueprints_ : blueprint_list option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?output_configuration:(output_configuration_ : output_configuration option)
    ~input_configuration:(input_configuration_ : sync_input_configuration)
    ~data_automation_profile_arn:(data_automation_profile_arn_ : data_automation_profile_arn) () =
  ({
     input_configuration = input_configuration_;
     data_automation_configuration = data_automation_configuration_;
     blueprints = blueprints_;
     data_automation_profile_arn = data_automation_profile_arn_;
     encryption_configuration = encryption_configuration_;
     output_configuration = output_configuration_;
   }
    : invoke_data_automation_request)

let make_timestamp_segment ~start_time_millis:(start_time_millis_ : Smaws_Lib.Smithy_api.Types.long)
    ~end_time_millis:(end_time_millis_ : Smaws_Lib.Smithy_api.Types.long) () =
  ({ start_time_millis = start_time_millis_; end_time_millis = end_time_millis_ }
    : timestamp_segment)

let make_video_asset_processing_configuration
    ?segment_configuration:(segment_configuration_ : video_segment_configuration option) () =
  ({ segment_configuration = segment_configuration_ } : video_asset_processing_configuration)

let make_asset_processing_configuration
    ?video:(video_ : video_asset_processing_configuration option) () =
  ({ video = video_ } : asset_processing_configuration)

let make_event_bridge_configuration
    ~event_bridge_enabled:(event_bridge_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_) () =
  ({ event_bridge_enabled = event_bridge_enabled_ } : event_bridge_configuration)

let make_get_data_automation_status_response ?status:(status_ : automation_job_status option)
    ?error_type:(error_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?output_configuration:(output_configuration_ : output_configuration option)
    ?job_submission_time:(job_submission_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?job_completion_time:(job_completion_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?job_duration_in_seconds:(job_duration_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    () =
  ({
     status = status_;
     error_type = error_type_;
     error_message = error_message_;
     output_configuration = output_configuration_;
     job_submission_time = job_submission_time_;
     job_completion_time = job_completion_time_;
     job_duration_in_seconds = job_duration_in_seconds_;
   }
    : get_data_automation_status_response)

let make_get_data_automation_status_request ~invocation_arn:(invocation_arn_ : invocation_arn) () =
  ({ invocation_arn = invocation_arn_ } : get_data_automation_status_request)

let make_input_configuration
    ?asset_processing_configuration:
      (asset_processing_configuration_ : asset_processing_configuration option)
    ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ s3_uri = s3_uri_; asset_processing_configuration = asset_processing_configuration_ }
    : input_configuration)

let make_invoke_data_automation_async_response ~invocation_arn:(invocation_arn_ : invocation_arn) ()
    =
  ({ invocation_arn = invocation_arn_ } : invoke_data_automation_async_response)

let make_notification_configuration
    ~event_bridge_configuration:(event_bridge_configuration_ : event_bridge_configuration) () =
  ({ event_bridge_configuration = event_bridge_configuration_ } : notification_configuration)

let make_invoke_data_automation_async_request
    ?client_token:(client_token_ : idempotency_token option)
    ?data_automation_configuration:
      (data_automation_configuration_ : data_automation_configuration option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?notification_configuration:(notification_configuration_ : notification_configuration option)
    ?blueprints:(blueprints_ : blueprint_list option) ?tags:(tags_ : tag_list option)
    ~input_configuration:(input_configuration_ : input_configuration)
    ~output_configuration:(output_configuration_ : output_configuration)
    ~data_automation_profile_arn:(data_automation_profile_arn_ : data_automation_profile_arn) () =
  ({
     client_token = client_token_;
     input_configuration = input_configuration_;
     output_configuration = output_configuration_;
     data_automation_configuration = data_automation_configuration_;
     encryption_configuration = encryption_configuration_;
     notification_configuration = notification_configuration_;
     blueprints = blueprints_;
     data_automation_profile_arn = data_automation_profile_arn_;
     tags = tags_;
   }
    : invoke_data_automation_async_request)
