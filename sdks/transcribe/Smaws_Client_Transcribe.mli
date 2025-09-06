(** 
    Transcribe client library built on EIO.
    
*)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_vocabulary_info :
  ?vocabulary_state:vocabulary_state ->
    ?last_modified_time:date_time ->
      ?language_code:language_code ->
        ?vocabulary_name:vocabulary_name -> unit -> vocabulary_info
val make_vocabulary_filter_info :
  ?last_modified_time:date_time ->
    ?language_code:language_code ->
      ?vocabulary_filter_name:vocabulary_filter_name ->
        unit -> vocabulary_filter_info
val make_update_vocabulary_response :
  ?vocabulary_state:vocabulary_state ->
    ?last_modified_time:date_time ->
      ?language_code:language_code ->
        ?vocabulary_name:vocabulary_name ->
          unit -> update_vocabulary_response
val make_update_vocabulary_request :
  ?data_access_role_arn:data_access_role_arn ->
    ?vocabulary_file_uri:uri ->
      ?phrases:phrases ->
        language_code:language_code ->
          vocabulary_name:vocabulary_name ->
            unit -> update_vocabulary_request
val make_update_vocabulary_filter_response :
  ?last_modified_time:date_time ->
    ?language_code:language_code ->
      ?vocabulary_filter_name:vocabulary_filter_name ->
        unit -> update_vocabulary_filter_response
val make_update_vocabulary_filter_request :
  ?data_access_role_arn:data_access_role_arn ->
    ?vocabulary_filter_file_uri:uri ->
      ?words:words ->
        vocabulary_filter_name:vocabulary_filter_name ->
          unit -> update_vocabulary_filter_request
val make_update_medical_vocabulary_response :
  ?vocabulary_state:vocabulary_state ->
    ?last_modified_time:date_time ->
      ?language_code:language_code ->
        ?vocabulary_name:vocabulary_name ->
          unit -> update_medical_vocabulary_response
val make_update_medical_vocabulary_request :
  vocabulary_file_uri:uri ->
    language_code:language_code ->
      vocabulary_name:vocabulary_name ->
        unit -> update_medical_vocabulary_request
val make_absolute_time_range :
  ?last:timestamp_milliseconds ->
    ?first:timestamp_milliseconds ->
      ?end_time:timestamp_milliseconds ->
        ?start_time:timestamp_milliseconds -> unit -> absolute_time_range
val make_relative_time_range :
  ?last:percentage ->
    ?first:percentage ->
      ?end_percentage:percentage ->
        ?start_percentage:percentage -> unit -> relative_time_range
val make_non_talk_time_filter :
  ?negate:boolean_ ->
    ?relative_time_range:relative_time_range ->
      ?absolute_time_range:absolute_time_range ->
        ?threshold:timestamp_milliseconds -> unit -> non_talk_time_filter
val make_interruption_filter :
  ?negate:boolean_ ->
    ?relative_time_range:relative_time_range ->
      ?absolute_time_range:absolute_time_range ->
        ?participant_role:participant_role ->
          ?threshold:timestamp_milliseconds -> unit -> interruption_filter
val make_transcript_filter :
  ?negate:boolean_ ->
    ?participant_role:participant_role ->
      ?relative_time_range:relative_time_range ->
        ?absolute_time_range:absolute_time_range ->
          targets:string_target_list ->
            transcript_filter_type:transcript_filter_type ->
              unit -> transcript_filter
val make_sentiment_filter :
  ?negate:boolean_ ->
    ?participant_role:participant_role ->
      ?relative_time_range:relative_time_range ->
        ?absolute_time_range:absolute_time_range ->
          sentiments:sentiment_value_list -> unit -> sentiment_filter
val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_category_properties :
  ?input_type:input_type ->
    ?tags:tag_list ->
      ?last_update_time:date_time ->
        ?create_time:date_time ->
          ?rules:rule_list ->
            ?category_name:category_name -> unit -> category_properties
val make_update_call_analytics_category_response :
  ?category_properties:category_properties ->
    unit -> update_call_analytics_category_response
val make_update_call_analytics_category_request :
  ?input_type:input_type ->
    rules:rule_list ->
      category_name:category_name ->
        unit -> update_call_analytics_category_request
val make_untag_resource_response : unit -> unit
val make_untag_resource_request :
  tag_keys:tag_key_list ->
    resource_arn:transcribe_arn -> unit -> untag_resource_request
val make_content_redaction :
  ?pii_entity_types:pii_entity_types ->
    redaction_output:redaction_output ->
      redaction_type:redaction_type -> unit -> content_redaction
val make_model_settings :
  ?language_model_name:model_name -> unit -> model_settings
val make_language_code_item :
  ?duration_in_seconds:duration_in_seconds ->
    ?language_code:language_code -> unit -> language_code_item
val make_toxicity_detection_settings :
  toxicity_categories:toxicity_categories ->
    unit -> toxicity_detection_settings
val make_transcription_job_summary :
  ?toxicity_detection:toxicity_detection ->
    ?language_codes:language_code_list ->
      ?identified_language_score:identified_language_score ->
        ?identify_multiple_languages:boolean_ ->
          ?identify_language:boolean_ ->
            ?model_settings:model_settings ->
              ?content_redaction:content_redaction ->
                ?output_location_type:output_location_type ->
                  ?failure_reason:failure_reason ->
                    ?transcription_job_status:transcription_job_status ->
                      ?language_code:language_code ->
                        ?completion_time:date_time ->
                          ?start_time:date_time ->
                            ?creation_time:date_time ->
                              ?transcription_job_name:transcription_job_name
                                -> unit -> transcription_job_summary
val make_media :
  ?redacted_media_file_uri:uri -> ?media_file_uri:uri -> unit -> media
val make_transcript :
  ?redacted_transcript_file_uri:uri ->
    ?transcript_file_uri:uri -> unit -> transcript
val make_settings :
  ?vocabulary_filter_method:vocabulary_filter_method ->
    ?vocabulary_filter_name:vocabulary_filter_name ->
      ?max_alternatives:max_alternatives ->
        ?show_alternatives:boolean_ ->
          ?channel_identification:boolean_ ->
            ?max_speaker_labels:max_speakers ->
              ?show_speaker_labels:boolean_ ->
                ?vocabulary_name:vocabulary_name -> unit -> settings
val make_job_execution_settings :
  ?data_access_role_arn:data_access_role_arn ->
    ?allow_deferred_execution:boolean_ -> unit -> job_execution_settings
val make_subtitles_output :
  ?output_start_index:subtitle_output_start_index ->
    ?subtitle_file_uris:subtitle_file_uris ->
      ?formats:subtitle_formats -> unit -> subtitles_output
val make_language_id_settings :
  ?language_model_name:model_name ->
    ?vocabulary_filter_name:vocabulary_filter_name ->
      ?vocabulary_name:vocabulary_name -> unit -> language_id_settings
val make_transcription_job :
  ?toxicity_detection:toxicity_detection ->
    ?language_id_settings:language_id_settings_map ->
      ?subtitles:subtitles_output ->
        ?tags:tag_list ->
          ?language_codes:language_code_list ->
            ?identified_language_score:identified_language_score ->
              ?language_options:language_options ->
                ?identify_multiple_languages:boolean_ ->
                  ?identify_language:boolean_ ->
                    ?content_redaction:content_redaction ->
                      ?job_execution_settings:job_execution_settings ->
                        ?model_settings:model_settings ->
                          ?settings:settings ->
                            ?failure_reason:failure_reason ->
                              ?completion_time:date_time ->
                                ?creation_time:date_time ->
                                  ?start_time:date_time ->
                                    ?transcript:transcript ->
                                      ?media:media ->
                                        ?media_format:media_format ->
                                          ?media_sample_rate_hertz:media_sample_rate_hertz
                                            ->
                                            ?language_code:language_code ->
                                              ?transcription_job_status:transcription_job_status
                                                ->
                                                ?transcription_job_name:transcription_job_name
                                                  ->
                                                  unit -> transcription_job
val make_tag_resource_response : unit -> unit
val make_tag_resource_request :
  tags:tag_list ->
    resource_arn:transcribe_arn -> unit -> tag_resource_request
val make_start_transcription_job_response :
  ?transcription_job:transcription_job ->
    unit -> start_transcription_job_response
val make_subtitles :
  ?output_start_index:subtitle_output_start_index ->
    ?formats:subtitle_formats -> unit -> subtitles
val make_start_transcription_job_request :
  ?toxicity_detection:toxicity_detection ->
    ?language_id_settings:language_id_settings_map ->
      ?tags:tag_list ->
        ?subtitles:subtitles ->
          ?language_options:language_options ->
            ?identify_multiple_languages:boolean_ ->
              ?identify_language:boolean_ ->
                ?content_redaction:content_redaction ->
                  ?job_execution_settings:job_execution_settings ->
                    ?model_settings:model_settings ->
                      ?settings:settings ->
                        ?kms_encryption_context:kms_encryption_context_map ->
                          ?output_encryption_kms_key_id:kms_key_id ->
                            ?output_key:output_key ->
                              ?output_bucket_name:output_bucket_name ->
                                ?media_format:media_format ->
                                  ?media_sample_rate_hertz:media_sample_rate_hertz
                                    ->
                                    ?language_code:language_code ->
                                      media:media ->
                                        transcription_job_name:transcription_job_name
                                          ->
                                          unit ->
                                            start_transcription_job_request
val make_medical_transcript :
  ?transcript_file_uri:uri -> unit -> medical_transcript
val make_medical_transcription_setting :
  ?vocabulary_name:vocabulary_name ->
    ?max_alternatives:max_alternatives ->
      ?show_alternatives:boolean_ ->
        ?channel_identification:boolean_ ->
          ?max_speaker_labels:max_speakers ->
            ?show_speaker_labels:boolean_ ->
              unit -> medical_transcription_setting
val make_medical_transcription_job :
  ?tags:tag_list ->
    ?type_:type_ ->
      ?specialty:specialty ->
        ?content_identification_type:medical_content_identification_type ->
          ?settings:medical_transcription_setting ->
            ?failure_reason:failure_reason ->
              ?completion_time:date_time ->
                ?creation_time:date_time ->
                  ?start_time:date_time ->
                    ?transcript:medical_transcript ->
                      ?media:media ->
                        ?media_format:media_format ->
                          ?media_sample_rate_hertz:medical_media_sample_rate_hertz
                            ->
                            ?language_code:language_code ->
                              ?transcription_job_status:transcription_job_status
                                ->
                                ?medical_transcription_job_name:transcription_job_name
                                  -> unit -> medical_transcription_job
val make_start_medical_transcription_job_response :
  ?medical_transcription_job:medical_transcription_job ->
    unit -> start_medical_transcription_job_response
val make_start_medical_transcription_job_request :
  ?tags:tag_list ->
    ?content_identification_type:medical_content_identification_type ->
      ?settings:medical_transcription_setting ->
        ?kms_encryption_context:kms_encryption_context_map ->
          ?output_encryption_kms_key_id:kms_key_id ->
            ?output_key:output_key ->
              ?media_format:media_format ->
                ?media_sample_rate_hertz:medical_media_sample_rate_hertz ->
                  type_:type_ ->
                    specialty:specialty ->
                      output_bucket_name:output_bucket_name ->
                        media:media ->
                          language_code:language_code ->
                            medical_transcription_job_name:transcription_job_name
                              ->
                              unit -> start_medical_transcription_job_request
val make_medical_scribe_output :
  clinical_document_uri:uri ->
    transcript_file_uri:uri -> unit -> medical_scribe_output
val make_clinical_note_generation_settings :
  ?note_template:medical_scribe_note_template ->
    unit -> clinical_note_generation_settings
val make_medical_scribe_settings :
  ?clinical_note_generation_settings:clinical_note_generation_settings ->
    ?vocabulary_filter_method:vocabulary_filter_method ->
      ?vocabulary_filter_name:vocabulary_filter_name ->
        ?vocabulary_name:vocabulary_name ->
          ?channel_identification:boolean_ ->
            ?max_speaker_labels:max_speakers ->
              ?show_speaker_labels:boolean_ ->
                unit -> medical_scribe_settings
val make_medical_scribe_channel_definition :
  participant_role:medical_scribe_participant_role ->
    channel_id:medical_scribe_channel_id ->
      unit -> medical_scribe_channel_definition
val make_medical_scribe_job :
  ?tags:tag_list ->
    ?channel_definitions:medical_scribe_channel_definitions ->
      ?data_access_role_arn:data_access_role_arn ->
        ?settings:medical_scribe_settings ->
          ?failure_reason:failure_reason ->
            ?completion_time:date_time ->
              ?creation_time:date_time ->
                ?start_time:date_time ->
                  ?medical_scribe_output:medical_scribe_output ->
                    ?media:media ->
                      ?language_code:medical_scribe_language_code ->
                        ?medical_scribe_job_status:medical_scribe_job_status
                          ->
                          ?medical_scribe_job_name:transcription_job_name ->
                            unit -> medical_scribe_job
val make_start_medical_scribe_job_response :
  ?medical_scribe_job:medical_scribe_job ->
    unit -> start_medical_scribe_job_response
val make_start_medical_scribe_job_request :
  ?tags:tag_list ->
    ?channel_definitions:medical_scribe_channel_definitions ->
      ?kms_encryption_context:kms_encryption_context_map ->
        ?output_encryption_kms_key_id:kms_key_id ->
          settings:medical_scribe_settings ->
            data_access_role_arn:data_access_role_arn ->
              output_bucket_name:output_bucket_name ->
                media:media ->
                  medical_scribe_job_name:transcription_job_name ->
                    unit -> start_medical_scribe_job_request
val make_call_analytics_skipped_feature :
  ?message:string_ ->
    ?reason_code:call_analytics_skipped_reason_code ->
      ?feature:call_analytics_feature ->
        unit -> call_analytics_skipped_feature
val make_call_analytics_job_details :
  ?skipped:call_analytics_skipped_feature_list ->
    unit -> call_analytics_job_details
val make_summarization :
  generate_abstractive_summary:boolean_ -> unit -> summarization
val make_call_analytics_job_settings :
  ?summarization:summarization ->
    ?language_id_settings:language_id_settings_map ->
      ?language_options:language_options ->
        ?content_redaction:content_redaction ->
          ?language_model_name:model_name ->
            ?vocabulary_filter_method:vocabulary_filter_method ->
              ?vocabulary_filter_name:vocabulary_filter_name ->
                ?vocabulary_name:vocabulary_name ->
                  unit -> call_analytics_job_settings
val make_channel_definition :
  ?participant_role:participant_role ->
    ?channel_id:channel_id -> unit -> channel_definition
val make_call_analytics_job :
  ?tags:tag_list ->
    ?channel_definitions:channel_definitions ->
      ?settings:call_analytics_job_settings ->
        ?identified_language_score:identified_language_score ->
          ?data_access_role_arn:data_access_role_arn ->
            ?failure_reason:failure_reason ->
              ?completion_time:date_time ->
                ?creation_time:date_time ->
                  ?start_time:date_time ->
                    ?transcript:transcript ->
                      ?media:media ->
                        ?media_format:media_format ->
                          ?media_sample_rate_hertz:media_sample_rate_hertz ->
                            ?language_code:language_code ->
                              ?call_analytics_job_details:call_analytics_job_details
                                ->
                                ?call_analytics_job_status:call_analytics_job_status
                                  ->
                                  ?call_analytics_job_name:call_analytics_job_name
                                    -> unit -> call_analytics_job
val make_start_call_analytics_job_response :
  ?call_analytics_job:call_analytics_job ->
    unit -> start_call_analytics_job_response
val make_start_call_analytics_job_request :
  ?channel_definitions:channel_definitions ->
    ?tags:tag_list ->
      ?settings:call_analytics_job_settings ->
        ?data_access_role_arn:data_access_role_arn ->
          ?output_encryption_kms_key_id:kms_key_id ->
            ?output_location:uri ->
              media:media ->
                call_analytics_job_name:call_analytics_job_name ->
                  unit -> start_call_analytics_job_request
val make_list_vocabulary_filters_response :
  ?vocabulary_filters:vocabulary_filters ->
    ?next_token:next_token -> unit -> list_vocabulary_filters_response
val make_list_vocabulary_filters_request :
  ?name_contains:vocabulary_filter_name ->
    ?max_results:max_results ->
      ?next_token:next_token -> unit -> list_vocabulary_filters_request
val make_list_vocabularies_response :
  ?vocabularies:vocabularies ->
    ?next_token:next_token ->
      ?status:vocabulary_state -> unit -> list_vocabularies_response
val make_list_vocabularies_request :
  ?name_contains:vocabulary_name ->
    ?state_equals:vocabulary_state ->
      ?max_results:max_results ->
        ?next_token:next_token -> unit -> list_vocabularies_request
val make_list_transcription_jobs_response :
  ?transcription_job_summaries:transcription_job_summaries ->
    ?next_token:next_token ->
      ?status:transcription_job_status ->
        unit -> list_transcription_jobs_response
val make_list_transcription_jobs_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?job_name_contains:transcription_job_name ->
        ?status:transcription_job_status ->
          unit -> list_transcription_jobs_request
val make_list_tags_for_resource_response :
  ?tags:tag_list ->
    ?resource_arn:transcribe_arn -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_arn:transcribe_arn -> unit -> list_tags_for_resource_request
val make_list_medical_vocabularies_response :
  ?vocabularies:vocabularies ->
    ?next_token:next_token ->
      ?status:vocabulary_state -> unit -> list_medical_vocabularies_response
val make_list_medical_vocabularies_request :
  ?name_contains:vocabulary_name ->
    ?state_equals:vocabulary_state ->
      ?max_results:max_results ->
        ?next_token:next_token -> unit -> list_medical_vocabularies_request
val make_medical_transcription_job_summary :
  ?type_:type_ ->
    ?content_identification_type:medical_content_identification_type ->
      ?specialty:specialty ->
        ?output_location_type:output_location_type ->
          ?failure_reason:failure_reason ->
            ?transcription_job_status:transcription_job_status ->
              ?language_code:language_code ->
                ?completion_time:date_time ->
                  ?start_time:date_time ->
                    ?creation_time:date_time ->
                      ?medical_transcription_job_name:transcription_job_name
                        -> unit -> medical_transcription_job_summary
val make_list_medical_transcription_jobs_response :
  ?medical_transcription_job_summaries:medical_transcription_job_summaries ->
    ?next_token:next_token ->
      ?status:transcription_job_status ->
        unit -> list_medical_transcription_jobs_response
val make_list_medical_transcription_jobs_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?job_name_contains:transcription_job_name ->
        ?status:transcription_job_status ->
          unit -> list_medical_transcription_jobs_request
val make_medical_scribe_job_summary :
  ?failure_reason:failure_reason ->
    ?medical_scribe_job_status:medical_scribe_job_status ->
      ?language_code:medical_scribe_language_code ->
        ?completion_time:date_time ->
          ?start_time:date_time ->
            ?creation_time:date_time ->
              ?medical_scribe_job_name:transcription_job_name ->
                unit -> medical_scribe_job_summary
val make_list_medical_scribe_jobs_response :
  ?medical_scribe_job_summaries:medical_scribe_job_summaries ->
    ?next_token:next_token ->
      ?status:medical_scribe_job_status ->
        unit -> list_medical_scribe_jobs_response
val make_list_medical_scribe_jobs_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?job_name_contains:transcription_job_name ->
        ?status:medical_scribe_job_status ->
          unit -> list_medical_scribe_jobs_request
val make_input_data_config :
  ?tuning_data_s3_uri:uri ->
    data_access_role_arn:data_access_role_arn ->
      s3_uri:uri -> unit -> input_data_config
val make_language_model :
  ?input_data_config:input_data_config ->
    ?failure_reason:failure_reason ->
      ?upgrade_availability:boolean_ ->
        ?model_status:model_status ->
          ?base_model_name:base_model_name ->
            ?language_code:clm_language_code ->
              ?last_modified_time:date_time ->
                ?create_time:date_time ->
                  ?model_name:model_name -> unit -> language_model
val make_list_language_models_response :
  ?models:models ->
    ?next_token:next_token -> unit -> list_language_models_response
val make_list_language_models_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?name_contains:model_name ->
        ?status_equals:model_status -> unit -> list_language_models_request
val make_call_analytics_job_summary :
  ?failure_reason:failure_reason ->
    ?call_analytics_job_details:call_analytics_job_details ->
      ?call_analytics_job_status:call_analytics_job_status ->
        ?language_code:language_code ->
          ?completion_time:date_time ->
            ?start_time:date_time ->
              ?creation_time:date_time ->
                ?call_analytics_job_name:call_analytics_job_name ->
                  unit -> call_analytics_job_summary
val make_list_call_analytics_jobs_response :
  ?call_analytics_job_summaries:call_analytics_job_summaries ->
    ?next_token:next_token ->
      ?status:call_analytics_job_status ->
        unit -> list_call_analytics_jobs_response
val make_list_call_analytics_jobs_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?job_name_contains:call_analytics_job_name ->
        ?status:call_analytics_job_status ->
          unit -> list_call_analytics_jobs_request
val make_list_call_analytics_categories_response :
  ?categories:category_properties_list ->
    ?next_token:next_token -> unit -> list_call_analytics_categories_response
val make_list_call_analytics_categories_request :
  ?max_results:max_results ->
    ?next_token:next_token -> unit -> list_call_analytics_categories_request
val make_get_vocabulary_filter_response :
  ?download_uri:uri ->
    ?last_modified_time:date_time ->
      ?language_code:language_code ->
        ?vocabulary_filter_name:vocabulary_filter_name ->
          unit -> get_vocabulary_filter_response
val make_get_vocabulary_filter_request :
  vocabulary_filter_name:vocabulary_filter_name ->
    unit -> get_vocabulary_filter_request
val make_get_vocabulary_response :
  ?download_uri:uri ->
    ?failure_reason:failure_reason ->
      ?last_modified_time:date_time ->
        ?vocabulary_state:vocabulary_state ->
          ?language_code:language_code ->
            ?vocabulary_name:vocabulary_name ->
              unit -> get_vocabulary_response
val make_get_vocabulary_request :
  vocabulary_name:vocabulary_name -> unit -> get_vocabulary_request
val make_get_transcription_job_response :
  ?transcription_job:transcription_job ->
    unit -> get_transcription_job_response
val make_get_transcription_job_request :
  transcription_job_name:transcription_job_name ->
    unit -> get_transcription_job_request
val make_get_medical_vocabulary_response :
  ?download_uri:uri ->
    ?failure_reason:failure_reason ->
      ?last_modified_time:date_time ->
        ?vocabulary_state:vocabulary_state ->
          ?language_code:language_code ->
            ?vocabulary_name:vocabulary_name ->
              unit -> get_medical_vocabulary_response
val make_get_medical_vocabulary_request :
  vocabulary_name:vocabulary_name -> unit -> get_medical_vocabulary_request
val make_get_medical_transcription_job_response :
  ?medical_transcription_job:medical_transcription_job ->
    unit -> get_medical_transcription_job_response
val make_get_medical_transcription_job_request :
  medical_transcription_job_name:transcription_job_name ->
    unit -> get_medical_transcription_job_request
val make_get_medical_scribe_job_response :
  ?medical_scribe_job:medical_scribe_job ->
    unit -> get_medical_scribe_job_response
val make_get_medical_scribe_job_request :
  medical_scribe_job_name:transcription_job_name ->
    unit -> get_medical_scribe_job_request
val make_get_call_analytics_job_response :
  ?call_analytics_job:call_analytics_job ->
    unit -> get_call_analytics_job_response
val make_get_call_analytics_job_request :
  call_analytics_job_name:call_analytics_job_name ->
    unit -> get_call_analytics_job_request
val make_get_call_analytics_category_response :
  ?category_properties:category_properties ->
    unit -> get_call_analytics_category_response
val make_get_call_analytics_category_request :
  category_name:category_name -> unit -> get_call_analytics_category_request
val make_describe_language_model_response :
  ?language_model:language_model -> unit -> describe_language_model_response
val make_describe_language_model_request :
  model_name:model_name -> unit -> describe_language_model_request
val make_delete_vocabulary_filter_request :
  vocabulary_filter_name:vocabulary_filter_name ->
    unit -> delete_vocabulary_filter_request
val make_delete_vocabulary_request :
  vocabulary_name:vocabulary_name -> unit -> delete_vocabulary_request
val make_delete_transcription_job_request :
  transcription_job_name:transcription_job_name ->
    unit -> delete_transcription_job_request
val make_delete_medical_vocabulary_request :
  vocabulary_name:vocabulary_name ->
    unit -> delete_medical_vocabulary_request
val make_delete_medical_transcription_job_request :
  medical_transcription_job_name:transcription_job_name ->
    unit -> delete_medical_transcription_job_request
val make_delete_medical_scribe_job_request :
  medical_scribe_job_name:transcription_job_name ->
    unit -> delete_medical_scribe_job_request
val make_delete_language_model_request :
  model_name:model_name -> unit -> delete_language_model_request
val make_delete_call_analytics_job_response : unit -> unit
val make_delete_call_analytics_job_request :
  call_analytics_job_name:call_analytics_job_name ->
    unit -> delete_call_analytics_job_request
val make_delete_call_analytics_category_response : unit -> unit
val make_delete_call_analytics_category_request :
  category_name:category_name ->
    unit -> delete_call_analytics_category_request
val make_create_vocabulary_filter_response :
  ?last_modified_time:date_time ->
    ?language_code:language_code ->
      ?vocabulary_filter_name:vocabulary_filter_name ->
        unit -> create_vocabulary_filter_response
val make_create_vocabulary_filter_request :
  ?data_access_role_arn:data_access_role_arn ->
    ?tags:tag_list ->
      ?vocabulary_filter_file_uri:uri ->
        ?words:words ->
          language_code:language_code ->
            vocabulary_filter_name:vocabulary_filter_name ->
              unit -> create_vocabulary_filter_request
val make_create_vocabulary_response :
  ?failure_reason:failure_reason ->
    ?last_modified_time:date_time ->
      ?vocabulary_state:vocabulary_state ->
        ?language_code:language_code ->
          ?vocabulary_name:vocabulary_name ->
            unit -> create_vocabulary_response
val make_create_vocabulary_request :
  ?data_access_role_arn:data_access_role_arn ->
    ?tags:tag_list ->
      ?vocabulary_file_uri:uri ->
        ?phrases:phrases ->
          language_code:language_code ->
            vocabulary_name:vocabulary_name ->
              unit -> create_vocabulary_request
val make_create_medical_vocabulary_response :
  ?failure_reason:failure_reason ->
    ?last_modified_time:date_time ->
      ?vocabulary_state:vocabulary_state ->
        ?language_code:language_code ->
          ?vocabulary_name:vocabulary_name ->
            unit -> create_medical_vocabulary_response
val make_create_medical_vocabulary_request :
  ?tags:tag_list ->
    vocabulary_file_uri:uri ->
      language_code:language_code ->
        vocabulary_name:vocabulary_name ->
          unit -> create_medical_vocabulary_request
val make_create_language_model_response :
  ?model_status:model_status ->
    ?input_data_config:input_data_config ->
      ?model_name:model_name ->
        ?base_model_name:base_model_name ->
          ?language_code:clm_language_code ->
            unit -> create_language_model_response
val make_create_language_model_request :
  ?tags:tag_list ->
    input_data_config:input_data_config ->
      model_name:model_name ->
        base_model_name:base_model_name ->
          language_code:clm_language_code ->
            unit -> create_language_model_request
val make_create_call_analytics_category_response :
  ?category_properties:category_properties ->
    unit -> create_call_analytics_category_response
val make_create_call_analytics_category_request :
  ?input_type:input_type ->
    ?tags:tag_list ->
      rules:rule_list ->
        category_name:category_name ->
          unit -> create_call_analytics_category_request
(** {1:operations Operations} *)

module CreateCallAnalyticsCategory :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_call_analytics_category_request ->
        (create_call_analytics_category_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Creates a new Call Analytics category.\n\n All categories are automatically applied to your Call Analytics transcriptions. Note that in order to apply categories to your transcriptions, you must create them before submitting your transcription request, as categories cannot be applied retroactively.\n \n  When creating a new category, you can use the [InputType] parameter to label the category as a [POST_CALL] or a [REAL_TIME] category. [POST_CALL] categories can only be applied to post-call transcriptions and [REAL_TIME] categories can only be applied to real-time transcriptions. If you do not include [InputType], your category is created as a [POST_CALL] category by default.\n  \n   Call Analytics categories are composed of rules. For each category, you must create between 1 and 20 rules. Rules can include these parameters: , , , and .\n   \n    To update an existing category, see .\n    \n     To learn more about Call Analytics categories, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html}Creating categories for post-call transcriptions} and {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html}Creating categories for real-time transcriptions}.\n     "]
module CreateLanguageModel :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_language_model_request ->
        (create_language_model_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Creates a new custom language model.\n\n When creating a new custom language model, you must specify:\n \n  {ul\n        {-  If you want a Wideband (audio sample rates over 16,000 Hz) or Narrowband (audio sample rates under 16,000 Hz) base model\n            \n             }\n        {-  The location of your training and tuning files (this must be an Amazon S3 URI)\n            \n             }\n        {-  The language of your model\n            \n             }\n        {-  A unique name for your model\n            \n             }\n        }\n  "]
module CreateMedicalVocabulary :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_medical_vocabulary_request ->
        (create_medical_vocabulary_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Creates a new custom medical vocabulary.\n\n Before creating a new custom medical vocabulary, you must first upload a text file that contains your vocabulary table into an Amazon S3 bucket. Note that this differs from , where you can include a list of terms within your request using the [Phrases] flag; [CreateMedicalVocabulary] does not support the [Phrases] flag and only accepts vocabularies in table format.\n \n  Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary request fails. Refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html}Character Sets for Custom Vocabularies} to get the character set for your language.\n  \n   For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html}Custom vocabularies}.\n   "]
module CreateVocabulary :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_vocabulary_request ->
        (create_vocabulary_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Creates a new custom vocabulary.\n\n When creating a new custom vocabulary, you can either upload a text file that contains your new entries, phrases, and terms into an Amazon S3 bucket and include the URI in your request. Or you can include a list of terms directly in your request using the [Phrases] flag.\n \n  Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary request fails. Refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html}Character Sets for Custom Vocabularies} to get the character set for your language.\n  \n   For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html}Custom vocabularies}.\n   "]
module CreateVocabularyFilter :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_vocabulary_filter_request ->
        (create_vocabulary_filter_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Creates a new custom vocabulary filter.\n\n You can use custom vocabulary filters to mask, delete, or flag specific words from your transcript. Custom vocabulary filters are commonly used to mask profanity in transcripts.\n \n  Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary filter request fails. Refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html}Character Sets for Custom Vocabularies} to get the character set for your language.\n  \n   For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/vocabulary-filtering.html}Vocabulary filtering}.\n   "]
module DeleteCallAnalyticsCategory :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_call_analytics_category_request ->
        (delete_call_analytics_category_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Deletes a Call Analytics category. To use this operation, specify the name of the category you want to delete using [CategoryName]. Category names are case sensitive.\n"]
module DeleteCallAnalyticsJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_call_analytics_job_request ->
        (delete_call_analytics_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Deletes a Call Analytics job. To use this operation, specify the name of the job you want to delete using [CallAnalyticsJobName]. Job names are case sensitive.\n"]
module DeleteLanguageModel :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_language_model_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Deletes a custom language model. To use this operation, specify the name of the language model you want to delete using [ModelName]. custom language model names are case sensitive.\n"]
module DeleteMedicalScribeJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_medical_scribe_job_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Deletes a Medical Scribe job. To use this operation, specify the name of the job you want to delete using [MedicalScribeJobName]. Job names are case sensitive.\n"]
module DeleteMedicalTranscriptionJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_medical_transcription_job_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Deletes a medical transcription job. To use this operation, specify the name of the job you want to delete using [MedicalTranscriptionJobName]. Job names are case sensitive.\n"]
module DeleteMedicalVocabulary :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_medical_vocabulary_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Deletes a custom medical vocabulary. To use this operation, specify the name of the custom vocabulary you want to delete using [VocabularyName]. Custom vocabulary names are case sensitive.\n"]
module DeleteTranscriptionJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_transcription_job_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Deletes a transcription job. To use this operation, specify the name of the job you want to delete using [TranscriptionJobName]. Job names are case sensitive.\n"]
module DeleteVocabulary :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_vocabulary_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Deletes a custom vocabulary. To use this operation, specify the name of the custom vocabulary you want to delete using [VocabularyName]. Custom vocabulary names are case sensitive.\n"]
module DeleteVocabularyFilter :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_vocabulary_filter_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Deletes a custom vocabulary filter. To use this operation, specify the name of the custom vocabulary filter you want to delete using [VocabularyFilterName]. Custom vocabulary filter names are case sensitive.\n"]
module DescribeLanguageModel :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_language_model_request ->
        (describe_language_model_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Provides information about the specified custom language model.\n\n This operation also shows if the base language model that you used to create your custom language model has been updated. If Amazon Transcribe has updated the base model, you can create a new custom language model using the updated base model.\n \n  If you tried to create a new custom language model and the request wasn't successful, you can use [DescribeLanguageModel] to help identify the reason for this failure.\n  "]
module GetCallAnalyticsCategory :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_call_analytics_category_request ->
        (get_call_analytics_category_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Provides information about the specified Call Analytics category.\n\n To get a list of your Call Analytics categories, use the operation.\n "]
module GetCallAnalyticsJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_call_analytics_job_request ->
        (get_call_analytics_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Provides information about the specified Call Analytics job.\n\n To view the job's status, refer to [CallAnalyticsJobStatus]. If the status is [COMPLETED], the job is finished. You can find your completed transcript at the URI specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.\n \n  If you enabled personally identifiable information (PII) redaction, the redacted transcript appears at the location specified in [RedactedTranscriptFileUri].\n  \n   If you chose to redact the audio in your media file, you can find your redacted media file at the location specified in [RedactedMediaFileUri].\n   \n    To get a list of your Call Analytics jobs, use the operation.\n    "]
module GetMedicalScribeJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_medical_scribe_job_request ->
        (get_medical_scribe_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Provides information about the specified Medical Scribe job.\n\n To view the status of the specified medical transcription job, check the [MedicalScribeJobStatus] field. If the status is [COMPLETED], the job is finished. You can find the results at the location specified in [MedicalScribeOutput]. If the status is [FAILED], [FailureReason] provides details on why your Medical Scribe job failed.\n \n  To get a list of your Medical Scribe jobs, use the operation.\n  "]
module GetMedicalTranscriptionJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_medical_transcription_job_request ->
        (get_medical_transcription_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Provides information about the specified medical transcription job.\n\n To view the status of the specified medical transcription job, check the [TranscriptionJobStatus] field. If the status is [COMPLETED], the job is finished. You can find the results at the location specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.\n \n  To get a list of your medical transcription jobs, use the operation.\n  "]
module GetMedicalVocabulary :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_medical_vocabulary_request ->
        (get_medical_vocabulary_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Provides information about the specified custom medical vocabulary.\n\n To view the status of the specified custom medical vocabulary, check the [VocabularyState] field. If the status is [READY], your custom vocabulary is available to use. If the status is [FAILED], [FailureReason] provides details on why your vocabulary failed.\n \n  To get a list of your custom medical vocabularies, use the operation.\n  "]
module GetTranscriptionJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_transcription_job_request ->
        (get_transcription_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Provides information about the specified transcription job.\n\n To view the status of the specified transcription job, check the [TranscriptionJobStatus] field. If the status is [COMPLETED], the job is finished. You can find the results at the location specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.\n \n  If you enabled content redaction, the redacted transcript can be found at the location specified in [RedactedTranscriptFileUri].\n  \n   To get a list of your transcription jobs, use the operation.\n   "]
module GetVocabulary :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_vocabulary_request ->
        (get_vocabulary_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Provides information about the specified custom vocabulary.\n\n To view the status of the specified custom vocabulary, check the [VocabularyState] field. If the status is [READY], your custom vocabulary is available to use. If the status is [FAILED], [FailureReason] provides details on why your custom vocabulary failed.\n \n  To get a list of your custom vocabularies, use the operation.\n  "]
module GetVocabularyFilter :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_vocabulary_filter_request ->
        (get_vocabulary_filter_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Provides information about the specified custom vocabulary filter.\n\n To get a list of your custom vocabulary filters, use the operation.\n "]
module ListCallAnalyticsCategories :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_call_analytics_categories_request ->
        (list_call_analytics_categories_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Provides a list of Call Analytics categories, including all rules that make up each category.\n\n To get detailed information about a specific Call Analytics category, use the operation.\n "]
module ListCallAnalyticsJobs :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_call_analytics_jobs_request ->
        (list_call_analytics_jobs_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Provides a list of Call Analytics jobs that match the specified criteria. If no criteria are specified, all Call Analytics jobs are returned.\n\n To get detailed information about a specific Call Analytics job, use the operation.\n "]
module ListLanguageModels :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_language_models_request ->
        (list_language_models_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Provides a list of custom language models that match the specified criteria. If no criteria are specified, all custom language models are returned.\n\n To get detailed information about a specific custom language model, use the operation.\n "]
module ListMedicalScribeJobs :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_medical_scribe_jobs_request ->
        (list_medical_scribe_jobs_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Provides a list of Medical Scribe jobs that match the specified criteria. If no criteria are specified, all Medical Scribe jobs are returned.\n\n To get detailed information about a specific Medical Scribe job, use the operation.\n "]
module ListMedicalTranscriptionJobs :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_medical_transcription_jobs_request ->
        (list_medical_transcription_jobs_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Provides a list of medical transcription jobs that match the specified criteria. If no criteria are specified, all medical transcription jobs are returned.\n\n To get detailed information about a specific medical transcription job, use the operation.\n "]
module ListMedicalVocabularies :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_medical_vocabularies_request ->
        (list_medical_vocabularies_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Provides a list of custom medical vocabularies that match the specified criteria. If no criteria are specified, all custom medical vocabularies are returned.\n\n To get detailed information about a specific custom medical vocabulary, use the operation.\n "]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Lists all tags associated with the specified transcription job, vocabulary, model, or resource.\n\n To learn more about using tags with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html}Tagging resources}.\n "]
module ListTranscriptionJobs :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_transcription_jobs_request ->
        (list_transcription_jobs_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Provides a list of transcription jobs that match the specified criteria. If no criteria are specified, all transcription jobs are returned.\n\n To get detailed information about a specific transcription job, use the operation.\n "]
module ListVocabularies :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_vocabularies_request ->
        (list_vocabularies_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Provides a list of custom vocabularies that match the specified criteria. If no criteria are specified, all custom vocabularies are returned.\n\n To get detailed information about a specific custom vocabulary, use the operation.\n "]
module ListVocabularyFilters :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_vocabulary_filters_request ->
        (list_vocabulary_filters_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Provides a list of custom vocabulary filters that match the specified criteria. If no criteria are specified, all custom vocabularies are returned.\n\n To get detailed information about a specific custom vocabulary filter, use the operation.\n "]
module StartCallAnalyticsJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_call_analytics_job_request ->
        (start_call_analytics_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Transcribes the audio from a customer service call and applies any additional Request Parameters you choose to include in your request.\n\n In addition to many standard transcription features, Call Analytics provides you with call characteristics, call summarization, speaker sentiment, and optional redaction of your text transcript and your audio file. You can also apply custom categories to flag specified conditions. To learn more about these features and insights, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/call-analytics.html}Analyzing call center audio with Call Analytics}.\n \n  If you want to apply categories to your Call Analytics job, you must create them before submitting your job request. Categories cannot be retroactively applied to a job. To create a new category, use the operation. To learn more about Call Analytics categories, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html}Creating categories for post-call transcriptions} and {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html}Creating categories for real-time transcriptions}.\n  \n   To make a [StartCallAnalyticsJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.\n   \n    Job queuing is available for Call Analytics jobs. If you pass a [DataAccessRoleArn] in your request and you exceed your Concurrent Job Limit, your job will automatically be added to a queue to be processed once your concurrent job count is below the limit.\n    \n     You must include the following parameters in your [StartCallAnalyticsJob] request:\n     \n      {ul\n            {-   [region]: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html}Amazon Transcribe endpoints and quotas}.\n                \n                 }\n            {-   [CallAnalyticsJobName]: A custom name that you create for your transcription job that's unique within your Amazon Web Services account.\n                \n                 }\n            {-   [Media] ([MediaFileUri] or [RedactedMediaFileUri]): The Amazon S3 location of your media file.\n                \n                 }\n            }\n    With Call Analytics, you can redact the audio contained in your media file by including [RedactedMediaFileUri], instead of [MediaFileUri], to specify the location of your input audio. If you choose to redact your audio, you can find your redacted media at the location specified in the [RedactedMediaFileUri] field of your response.\n    \n     "]
module StartMedicalScribeJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_medical_scribe_job_request ->
        (start_medical_scribe_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Transcribes patient-clinician conversations and generates clinical notes. \n\n Amazon Web Services HealthScribe automatically provides rich conversation transcripts, identifies speaker roles, classifies dialogues, extracts medical terms, and generates preliminary clinical notes. To learn more about these features, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/health-scribe.html}Amazon Web Services HealthScribe}.\n \n  To make a [StartMedicalScribeJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.\n  \n   You must include the following parameters in your [StartMedicalTranscriptionJob] request:\n   \n    {ul\n          {-   [DataAccessRoleArn]: The ARN of an IAM role with the these minimum permissions: read permission on input file Amazon S3 bucket specified in [Media], write permission on the Amazon S3 bucket specified in [OutputBucketName], and full permissions on the KMS key specified in [OutputEncryptionKMSKeyId] (if set). The role should also allow [transcribe.amazonaws.com] to assume it. \n              \n               }\n          {-   [Media] ([MediaFileUri]): The Amazon S3 location of your media file.\n              \n               }\n          {-   [MedicalScribeJobName]: A custom name you create for your MedicalScribe job that is unique within your Amazon Web Services account.\n              \n               }\n          {-   [OutputBucketName]: The Amazon S3 bucket where you want your output files stored.\n              \n               }\n          {-   [Settings]: A [MedicalScribeSettings] obect that must set exactly one of [ShowSpeakerLabels] or [ChannelIdentification] to true. If [ShowSpeakerLabels] is true, [MaxSpeakerLabels] must also be set. \n              \n               }\n          {-   [ChannelDefinitions]: A [MedicalScribeChannelDefinitions] array should be set if and only if the [ChannelIdentification] value of [Settings] is set to true. \n              \n               }\n          }\n  "]
module StartMedicalTranscriptionJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_medical_transcription_job_request ->
        (start_medical_transcription_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Transcribes the audio from a medical dictation or conversation and applies any additional Request Parameters you choose to include in your request.\n\n In addition to many standard transcription features, Amazon Transcribe Medical provides you with a robust medical vocabulary and, optionally, content identification, which adds flags to personal health information (PHI). To learn more about these features, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/how-it-works-med.html}How Amazon Transcribe Medical works}.\n \n  To make a [StartMedicalTranscriptionJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.\n  \n   You must include the following parameters in your [StartMedicalTranscriptionJob] request:\n   \n    {ul\n          {-   [region]: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html}Amazon Transcribe endpoints and quotas}.\n              \n               }\n          {-   [MedicalTranscriptionJobName]: A custom name you create for your transcription job that is unique within your Amazon Web Services account.\n              \n               }\n          {-   [Media] ([MediaFileUri]): The Amazon S3 location of your media file.\n              \n               }\n          {-   [LanguageCode]: This must be [en-US].\n              \n               }\n          {-   [OutputBucketName]: The Amazon S3 bucket where you want your transcript stored. If you want your output stored in a sub-folder of this bucket, you must also include [OutputKey].\n              \n               }\n          {-   [Specialty]: This must be [PRIMARYCARE].\n              \n               }\n          {-   [Type]: Choose whether your audio is a conversation or a dictation.\n              \n               }\n          }\n  "]
module StartTranscriptionJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_transcription_job_request ->
        (start_transcription_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Transcribes the audio from a media file and applies any additional Request Parameters you choose to include in your request.\n\n To make a [StartTranscriptionJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.\n \n  You must include the following parameters in your [StartTranscriptionJob] request:\n  \n   {ul\n         {-   [region]: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html}Amazon Transcribe endpoints and quotas}.\n             \n              }\n         {-   [TranscriptionJobName]: A custom name you create for your transcription job that is unique within your Amazon Web Services account.\n             \n              }\n         {-   [Media] ([MediaFileUri]): The Amazon S3 location of your media file.\n             \n              }\n         {-  One of [LanguageCode], [IdentifyLanguage], or [IdentifyMultipleLanguages]: If you know the language of your media file, specify it using the [LanguageCode] parameter; you can find all valid language codes in the {{:https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html}Supported languages} table. If you do not know the languages spoken in your media, use either [IdentifyLanguage] or [IdentifyMultipleLanguages] and let Amazon Transcribe identify the languages for you.\n             \n              }\n         }\n  "]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Adds one or more custom tags, each in the form of a key:value pair, to the specified resource.\n\n To learn more about using tags with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html}Tagging resources}.\n "]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Removes the specified tags from the specified Amazon Transcribe resource.\n\n If you include [UntagResource] in your request, you must also include [ResourceArn] and [TagKeys].\n "]
module UpdateCallAnalyticsCategory :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_call_analytics_category_request ->
        (update_call_analytics_category_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Updates the specified Call Analytics category with new rules. Note that the [UpdateCallAnalyticsCategory] operation overwrites all existing rules contained in the specified category. You cannot append additional rules onto an existing category.\n\n To create a new category, see .\n "]
module UpdateMedicalVocabulary :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_medical_vocabulary_request ->
        (update_medical_vocabulary_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Updates an existing custom medical vocabulary with new values. This operation overwrites all existing information with your new values; you cannot append new terms onto an existing custom vocabulary.\n"]
module UpdateVocabulary :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_vocabulary_request ->
        (update_vocabulary_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `ConflictException of conflict_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Updates an existing custom vocabulary with new values. This operation overwrites all existing information with your new values; you cannot append new terms onto an existing custom vocabulary.\n"]
module UpdateVocabularyFilter :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_vocabulary_filter_request ->
        (update_vocabulary_filter_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BadRequestException of bad_request_exception 
          | `InternalFailureException of internal_failure_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Updates an existing custom vocabulary filter with a new list of words. The new list you provide overwrites all previous entries; you cannot append new terms onto an existing custom vocabulary filter.\n"](** {1:Serialization and Deserialization} *)

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
