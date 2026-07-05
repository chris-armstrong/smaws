open Types
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