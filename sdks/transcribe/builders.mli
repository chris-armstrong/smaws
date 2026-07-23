open Types

val make_absolute_time_range :
  ?start_time:timestamp_milliseconds ->
  ?end_time:timestamp_milliseconds ->
  ?first:timestamp_milliseconds ->
  ?last:timestamp_milliseconds ->
  unit ->
  absolute_time_range

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_channel_definition :
  ?channel_id:channel_id -> ?participant_role:participant_role -> unit -> channel_definition

val make_summarization : generate_abstractive_summary:boolean_ -> unit -> summarization

val make_language_id_settings :
  ?vocabulary_name:vocabulary_name ->
  ?vocabulary_filter_name:vocabulary_filter_name ->
  ?language_model_name:model_name ->
  unit ->
  language_id_settings

val make_content_redaction :
  ?pii_entity_types:pii_entity_types ->
  redaction_type:redaction_type ->
  redaction_output:redaction_output ->
  unit ->
  content_redaction

val make_call_analytics_job_settings :
  ?vocabulary_name:vocabulary_name ->
  ?vocabulary_filter_name:vocabulary_filter_name ->
  ?vocabulary_filter_method:vocabulary_filter_method ->
  ?language_model_name:model_name ->
  ?content_redaction:content_redaction ->
  ?language_options:language_options ->
  ?language_id_settings:language_id_settings_map ->
  ?summarization:summarization ->
  unit ->
  call_analytics_job_settings

val make_transcript :
  ?transcript_file_uri:uri -> ?redacted_transcript_file_uri:uri -> unit -> transcript

val make_media : ?media_file_uri:uri -> ?redacted_media_file_uri:uri -> unit -> media

val make_call_analytics_skipped_feature :
  ?feature:call_analytics_feature ->
  ?reason_code:call_analytics_skipped_reason_code ->
  ?message:string_ ->
  unit ->
  call_analytics_skipped_feature

val make_call_analytics_job_details :
  ?skipped:call_analytics_skipped_feature_list -> unit -> call_analytics_job_details

val make_call_analytics_job :
  ?call_analytics_job_name:call_analytics_job_name ->
  ?call_analytics_job_status:call_analytics_job_status ->
  ?call_analytics_job_details:call_analytics_job_details ->
  ?language_code:language_code ->
  ?media_sample_rate_hertz:media_sample_rate_hertz ->
  ?media_format:media_format ->
  ?media:media ->
  ?transcript:transcript ->
  ?start_time:date_time ->
  ?creation_time:date_time ->
  ?completion_time:date_time ->
  ?failure_reason:failure_reason ->
  ?data_access_role_arn:data_access_role_arn ->
  ?identified_language_score:identified_language_score ->
  ?settings:call_analytics_job_settings ->
  ?channel_definitions:channel_definitions ->
  ?tags:tag_list ->
  unit ->
  call_analytics_job

val make_call_analytics_job_summary :
  ?call_analytics_job_name:call_analytics_job_name ->
  ?creation_time:date_time ->
  ?start_time:date_time ->
  ?completion_time:date_time ->
  ?language_code:language_code ->
  ?call_analytics_job_status:call_analytics_job_status ->
  ?call_analytics_job_details:call_analytics_job_details ->
  ?failure_reason:failure_reason ->
  unit ->
  call_analytics_job_summary

val make_relative_time_range :
  ?start_percentage:percentage ->
  ?end_percentage:percentage ->
  ?first:percentage ->
  ?last:percentage ->
  unit ->
  relative_time_range

val make_sentiment_filter :
  ?absolute_time_range:absolute_time_range ->
  ?relative_time_range:relative_time_range ->
  ?participant_role:participant_role ->
  ?negate:boolean_ ->
  sentiments:sentiment_value_list ->
  unit ->
  sentiment_filter

val make_transcript_filter :
  ?absolute_time_range:absolute_time_range ->
  ?relative_time_range:relative_time_range ->
  ?participant_role:participant_role ->
  ?negate:boolean_ ->
  transcript_filter_type:transcript_filter_type ->
  targets:string_target_list ->
  unit ->
  transcript_filter

val make_interruption_filter :
  ?threshold:timestamp_milliseconds ->
  ?participant_role:participant_role ->
  ?absolute_time_range:absolute_time_range ->
  ?relative_time_range:relative_time_range ->
  ?negate:boolean_ ->
  unit ->
  interruption_filter

val make_non_talk_time_filter :
  ?threshold:timestamp_milliseconds ->
  ?absolute_time_range:absolute_time_range ->
  ?relative_time_range:relative_time_range ->
  ?negate:boolean_ ->
  unit ->
  non_talk_time_filter

val make_category_properties :
  ?category_name:category_name ->
  ?rules:rule_list ->
  ?create_time:date_time ->
  ?last_update_time:date_time ->
  ?tags:tag_list ->
  ?input_type:input_type ->
  unit ->
  category_properties

val make_clinical_note_generation_settings :
  ?note_template:medical_scribe_note_template -> unit -> clinical_note_generation_settings

val make_create_call_analytics_category_response :
  ?category_properties:category_properties -> unit -> create_call_analytics_category_response

val make_create_call_analytics_category_request :
  ?tags:tag_list ->
  ?input_type:input_type ->
  category_name:category_name ->
  rules:rule_list ->
  unit ->
  create_call_analytics_category_request

val make_input_data_config :
  ?tuning_data_s3_uri:uri ->
  s3_uri:uri ->
  data_access_role_arn:data_access_role_arn ->
  unit ->
  input_data_config

val make_create_language_model_response :
  ?language_code:clm_language_code ->
  ?base_model_name:base_model_name ->
  ?model_name:model_name ->
  ?input_data_config:input_data_config ->
  ?model_status:model_status ->
  unit ->
  create_language_model_response

val make_create_language_model_request :
  ?tags:tag_list ->
  language_code:clm_language_code ->
  base_model_name:base_model_name ->
  model_name:model_name ->
  input_data_config:input_data_config ->
  unit ->
  create_language_model_request

val make_create_medical_vocabulary_response :
  ?vocabulary_name:vocabulary_name ->
  ?language_code:language_code ->
  ?vocabulary_state:vocabulary_state ->
  ?last_modified_time:date_time ->
  ?failure_reason:failure_reason ->
  unit ->
  create_medical_vocabulary_response

val make_create_medical_vocabulary_request :
  ?tags:tag_list ->
  vocabulary_name:vocabulary_name ->
  language_code:language_code ->
  vocabulary_file_uri:uri ->
  unit ->
  create_medical_vocabulary_request

val make_create_vocabulary_response :
  ?vocabulary_name:vocabulary_name ->
  ?language_code:language_code ->
  ?vocabulary_state:vocabulary_state ->
  ?last_modified_time:date_time ->
  ?failure_reason:failure_reason ->
  unit ->
  create_vocabulary_response

val make_create_vocabulary_request :
  ?phrases:phrases ->
  ?vocabulary_file_uri:uri ->
  ?tags:tag_list ->
  ?data_access_role_arn:data_access_role_arn ->
  vocabulary_name:vocabulary_name ->
  language_code:language_code ->
  unit ->
  create_vocabulary_request

val make_create_vocabulary_filter_response :
  ?vocabulary_filter_name:vocabulary_filter_name ->
  ?language_code:language_code ->
  ?last_modified_time:date_time ->
  unit ->
  create_vocabulary_filter_response

val make_create_vocabulary_filter_request :
  ?words:words ->
  ?vocabulary_filter_file_uri:uri ->
  ?tags:tag_list ->
  ?data_access_role_arn:data_access_role_arn ->
  vocabulary_filter_name:vocabulary_filter_name ->
  language_code:language_code ->
  unit ->
  create_vocabulary_filter_request

val make_delete_call_analytics_category_response : unit -> unit

val make_delete_call_analytics_category_request :
  category_name:category_name -> unit -> delete_call_analytics_category_request

val make_delete_call_analytics_job_response : unit -> unit

val make_delete_call_analytics_job_request :
  call_analytics_job_name:call_analytics_job_name -> unit -> delete_call_analytics_job_request

val make_delete_language_model_request :
  model_name:model_name -> unit -> delete_language_model_request

val make_delete_medical_scribe_job_request :
  medical_scribe_job_name:transcription_job_name -> unit -> delete_medical_scribe_job_request

val make_delete_medical_transcription_job_request :
  medical_transcription_job_name:transcription_job_name ->
  unit ->
  delete_medical_transcription_job_request

val make_delete_medical_vocabulary_request :
  vocabulary_name:vocabulary_name -> unit -> delete_medical_vocabulary_request

val make_delete_transcription_job_request :
  transcription_job_name:transcription_job_name -> unit -> delete_transcription_job_request

val make_delete_vocabulary_request :
  vocabulary_name:vocabulary_name -> unit -> delete_vocabulary_request

val make_delete_vocabulary_filter_request :
  vocabulary_filter_name:vocabulary_filter_name -> unit -> delete_vocabulary_filter_request

val make_language_model :
  ?model_name:model_name ->
  ?create_time:date_time ->
  ?last_modified_time:date_time ->
  ?language_code:clm_language_code ->
  ?base_model_name:base_model_name ->
  ?model_status:model_status ->
  ?upgrade_availability:boolean_ ->
  ?failure_reason:failure_reason ->
  ?input_data_config:input_data_config ->
  unit ->
  language_model

val make_describe_language_model_response :
  ?language_model:language_model -> unit -> describe_language_model_response

val make_describe_language_model_request :
  model_name:model_name -> unit -> describe_language_model_request

val make_get_call_analytics_category_response :
  ?category_properties:category_properties -> unit -> get_call_analytics_category_response

val make_get_call_analytics_category_request :
  category_name:category_name -> unit -> get_call_analytics_category_request

val make_get_call_analytics_job_response :
  ?call_analytics_job:call_analytics_job -> unit -> get_call_analytics_job_response

val make_get_call_analytics_job_request :
  call_analytics_job_name:call_analytics_job_name -> unit -> get_call_analytics_job_request

val make_medical_scribe_channel_definition :
  channel_id:medical_scribe_channel_id ->
  participant_role:medical_scribe_participant_role ->
  unit ->
  medical_scribe_channel_definition

val make_medical_scribe_settings :
  ?show_speaker_labels:boolean_ ->
  ?max_speaker_labels:max_speakers ->
  ?channel_identification:boolean_ ->
  ?vocabulary_name:vocabulary_name ->
  ?vocabulary_filter_name:vocabulary_filter_name ->
  ?vocabulary_filter_method:vocabulary_filter_method ->
  ?clinical_note_generation_settings:clinical_note_generation_settings ->
  unit ->
  medical_scribe_settings

val make_medical_scribe_output :
  transcript_file_uri:uri -> clinical_document_uri:uri -> unit -> medical_scribe_output

val make_medical_scribe_job :
  ?medical_scribe_job_name:transcription_job_name ->
  ?medical_scribe_job_status:medical_scribe_job_status ->
  ?language_code:medical_scribe_language_code ->
  ?media:media ->
  ?medical_scribe_output:medical_scribe_output ->
  ?start_time:date_time ->
  ?creation_time:date_time ->
  ?completion_time:date_time ->
  ?failure_reason:failure_reason ->
  ?settings:medical_scribe_settings ->
  ?data_access_role_arn:data_access_role_arn ->
  ?channel_definitions:medical_scribe_channel_definitions ->
  ?medical_scribe_context_provided:boolean_ ->
  ?tags:tag_list ->
  unit ->
  medical_scribe_job

val make_get_medical_scribe_job_response :
  ?medical_scribe_job:medical_scribe_job -> unit -> get_medical_scribe_job_response

val make_get_medical_scribe_job_request :
  medical_scribe_job_name:transcription_job_name -> unit -> get_medical_scribe_job_request

val make_medical_transcription_setting :
  ?show_speaker_labels:boolean_ ->
  ?max_speaker_labels:max_speakers ->
  ?channel_identification:boolean_ ->
  ?show_alternatives:boolean_ ->
  ?max_alternatives:max_alternatives ->
  ?vocabulary_name:vocabulary_name ->
  unit ->
  medical_transcription_setting

val make_medical_transcript : ?transcript_file_uri:uri -> unit -> medical_transcript

val make_medical_transcription_job :
  ?medical_transcription_job_name:transcription_job_name ->
  ?transcription_job_status:transcription_job_status ->
  ?language_code:language_code ->
  ?media_sample_rate_hertz:medical_media_sample_rate_hertz ->
  ?media_format:media_format ->
  ?media:media ->
  ?transcript:medical_transcript ->
  ?start_time:date_time ->
  ?creation_time:date_time ->
  ?completion_time:date_time ->
  ?failure_reason:failure_reason ->
  ?settings:medical_transcription_setting ->
  ?content_identification_type:medical_content_identification_type ->
  ?specialty:specialty ->
  ?type_:type_ ->
  ?tags:tag_list ->
  unit ->
  medical_transcription_job

val make_get_medical_transcription_job_response :
  ?medical_transcription_job:medical_transcription_job ->
  unit ->
  get_medical_transcription_job_response

val make_get_medical_transcription_job_request :
  medical_transcription_job_name:transcription_job_name ->
  unit ->
  get_medical_transcription_job_request

val make_get_medical_vocabulary_response :
  ?vocabulary_name:vocabulary_name ->
  ?language_code:language_code ->
  ?vocabulary_state:vocabulary_state ->
  ?last_modified_time:date_time ->
  ?failure_reason:failure_reason ->
  ?download_uri:uri ->
  unit ->
  get_medical_vocabulary_response

val make_get_medical_vocabulary_request :
  vocabulary_name:vocabulary_name -> unit -> get_medical_vocabulary_request

val make_toxicity_detection_settings :
  toxicity_categories:toxicity_categories -> unit -> toxicity_detection_settings

val make_subtitles_output :
  ?formats:subtitle_formats ->
  ?subtitle_file_uris:subtitle_file_uris ->
  ?output_start_index:subtitle_output_start_index ->
  unit ->
  subtitles_output

val make_language_code_item :
  ?language_code:language_code ->
  ?duration_in_seconds:duration_in_seconds ->
  unit ->
  language_code_item

val make_job_execution_settings :
  ?allow_deferred_execution:boolean_ ->
  ?data_access_role_arn:data_access_role_arn ->
  unit ->
  job_execution_settings

val make_model_settings : ?language_model_name:model_name -> unit -> model_settings

val make_settings :
  ?vocabulary_name:vocabulary_name ->
  ?show_speaker_labels:boolean_ ->
  ?max_speaker_labels:max_speakers ->
  ?channel_identification:boolean_ ->
  ?show_alternatives:boolean_ ->
  ?max_alternatives:max_alternatives ->
  ?vocabulary_filter_name:vocabulary_filter_name ->
  ?vocabulary_filter_method:vocabulary_filter_method ->
  unit ->
  settings

val make_transcription_job :
  ?transcription_job_name:transcription_job_name ->
  ?transcription_job_status:transcription_job_status ->
  ?language_code:language_code ->
  ?media_sample_rate_hertz:media_sample_rate_hertz ->
  ?media_format:media_format ->
  ?media:media ->
  ?transcript:transcript ->
  ?start_time:date_time ->
  ?creation_time:date_time ->
  ?completion_time:date_time ->
  ?failure_reason:failure_reason ->
  ?settings:settings ->
  ?model_settings:model_settings ->
  ?job_execution_settings:job_execution_settings ->
  ?content_redaction:content_redaction ->
  ?identify_language:boolean_ ->
  ?identify_multiple_languages:boolean_ ->
  ?language_options:language_options ->
  ?identified_language_score:identified_language_score ->
  ?language_codes:language_code_list ->
  ?tags:tag_list ->
  ?subtitles:subtitles_output ->
  ?language_id_settings:language_id_settings_map ->
  ?toxicity_detection:toxicity_detection ->
  unit ->
  transcription_job

val make_get_transcription_job_response :
  ?transcription_job:transcription_job -> unit -> get_transcription_job_response

val make_get_transcription_job_request :
  transcription_job_name:transcription_job_name -> unit -> get_transcription_job_request

val make_get_vocabulary_response :
  ?vocabulary_name:vocabulary_name ->
  ?language_code:language_code ->
  ?vocabulary_state:vocabulary_state ->
  ?last_modified_time:date_time ->
  ?failure_reason:failure_reason ->
  ?download_uri:uri ->
  unit ->
  get_vocabulary_response

val make_get_vocabulary_request : vocabulary_name:vocabulary_name -> unit -> get_vocabulary_request

val make_get_vocabulary_filter_response :
  ?vocabulary_filter_name:vocabulary_filter_name ->
  ?language_code:language_code ->
  ?last_modified_time:date_time ->
  ?download_uri:uri ->
  unit ->
  get_vocabulary_filter_response

val make_get_vocabulary_filter_request :
  vocabulary_filter_name:vocabulary_filter_name -> unit -> get_vocabulary_filter_request

val make_list_call_analytics_categories_response :
  ?next_token:next_token ->
  ?categories:category_properties_list ->
  unit ->
  list_call_analytics_categories_response

val make_list_call_analytics_categories_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_call_analytics_categories_request

val make_list_call_analytics_jobs_response :
  ?status:call_analytics_job_status ->
  ?next_token:next_token ->
  ?call_analytics_job_summaries:call_analytics_job_summaries ->
  unit ->
  list_call_analytics_jobs_response

val make_list_call_analytics_jobs_request :
  ?status:call_analytics_job_status ->
  ?job_name_contains:call_analytics_job_name ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_call_analytics_jobs_request

val make_list_language_models_response :
  ?next_token:next_token -> ?models:models -> unit -> list_language_models_response

val make_list_language_models_request :
  ?status_equals:model_status ->
  ?name_contains:model_name ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_language_models_request

val make_medical_scribe_job_summary :
  ?medical_scribe_job_name:transcription_job_name ->
  ?creation_time:date_time ->
  ?start_time:date_time ->
  ?completion_time:date_time ->
  ?language_code:medical_scribe_language_code ->
  ?medical_scribe_job_status:medical_scribe_job_status ->
  ?failure_reason:failure_reason ->
  unit ->
  medical_scribe_job_summary

val make_list_medical_scribe_jobs_response :
  ?status:medical_scribe_job_status ->
  ?next_token:next_token ->
  ?medical_scribe_job_summaries:medical_scribe_job_summaries ->
  unit ->
  list_medical_scribe_jobs_response

val make_list_medical_scribe_jobs_request :
  ?status:medical_scribe_job_status ->
  ?job_name_contains:transcription_job_name ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_medical_scribe_jobs_request

val make_medical_transcription_job_summary :
  ?medical_transcription_job_name:transcription_job_name ->
  ?creation_time:date_time ->
  ?start_time:date_time ->
  ?completion_time:date_time ->
  ?language_code:language_code ->
  ?transcription_job_status:transcription_job_status ->
  ?failure_reason:failure_reason ->
  ?output_location_type:output_location_type ->
  ?specialty:specialty ->
  ?content_identification_type:medical_content_identification_type ->
  ?type_:type_ ->
  unit ->
  medical_transcription_job_summary

val make_list_medical_transcription_jobs_response :
  ?status:transcription_job_status ->
  ?next_token:next_token ->
  ?medical_transcription_job_summaries:medical_transcription_job_summaries ->
  unit ->
  list_medical_transcription_jobs_response

val make_list_medical_transcription_jobs_request :
  ?status:transcription_job_status ->
  ?job_name_contains:transcription_job_name ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_medical_transcription_jobs_request

val make_vocabulary_info :
  ?vocabulary_name:vocabulary_name ->
  ?language_code:language_code ->
  ?last_modified_time:date_time ->
  ?vocabulary_state:vocabulary_state ->
  unit ->
  vocabulary_info

val make_list_medical_vocabularies_response :
  ?status:vocabulary_state ->
  ?next_token:next_token ->
  ?vocabularies:vocabularies ->
  unit ->
  list_medical_vocabularies_response

val make_list_medical_vocabularies_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?state_equals:vocabulary_state ->
  ?name_contains:vocabulary_name ->
  unit ->
  list_medical_vocabularies_request

val make_list_tags_for_resource_response :
  ?resource_arn:transcribe_arn -> ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:transcribe_arn -> unit -> list_tags_for_resource_request

val make_transcription_job_summary :
  ?transcription_job_name:transcription_job_name ->
  ?creation_time:date_time ->
  ?start_time:date_time ->
  ?completion_time:date_time ->
  ?language_code:language_code ->
  ?transcription_job_status:transcription_job_status ->
  ?failure_reason:failure_reason ->
  ?output_location_type:output_location_type ->
  ?content_redaction:content_redaction ->
  ?model_settings:model_settings ->
  ?identify_language:boolean_ ->
  ?identify_multiple_languages:boolean_ ->
  ?identified_language_score:identified_language_score ->
  ?language_codes:language_code_list ->
  ?toxicity_detection:toxicity_detection ->
  unit ->
  transcription_job_summary

val make_list_transcription_jobs_response :
  ?status:transcription_job_status ->
  ?next_token:next_token ->
  ?transcription_job_summaries:transcription_job_summaries ->
  unit ->
  list_transcription_jobs_response

val make_list_transcription_jobs_request :
  ?status:transcription_job_status ->
  ?job_name_contains:transcription_job_name ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_transcription_jobs_request

val make_list_vocabularies_response :
  ?status:vocabulary_state ->
  ?next_token:next_token ->
  ?vocabularies:vocabularies ->
  unit ->
  list_vocabularies_response

val make_list_vocabularies_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?state_equals:vocabulary_state ->
  ?name_contains:vocabulary_name ->
  unit ->
  list_vocabularies_request

val make_vocabulary_filter_info :
  ?vocabulary_filter_name:vocabulary_filter_name ->
  ?language_code:language_code ->
  ?last_modified_time:date_time ->
  unit ->
  vocabulary_filter_info

val make_list_vocabulary_filters_response :
  ?next_token:next_token ->
  ?vocabulary_filters:vocabulary_filters ->
  unit ->
  list_vocabulary_filters_response

val make_list_vocabulary_filters_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?name_contains:vocabulary_filter_name ->
  unit ->
  list_vocabulary_filters_request

val make_medical_scribe_patient_context :
  ?pronouns:pronouns -> unit -> medical_scribe_patient_context

val make_medical_scribe_context :
  ?patient_context:medical_scribe_patient_context -> unit -> medical_scribe_context

val make_start_call_analytics_job_response :
  ?call_analytics_job:call_analytics_job -> unit -> start_call_analytics_job_response

val make_start_call_analytics_job_request :
  ?output_location:uri ->
  ?output_encryption_kms_key_id:kms_key_id ->
  ?data_access_role_arn:data_access_role_arn ->
  ?settings:call_analytics_job_settings ->
  ?tags:tag_list ->
  ?channel_definitions:channel_definitions ->
  call_analytics_job_name:call_analytics_job_name ->
  media:media ->
  unit ->
  start_call_analytics_job_request

val make_start_medical_scribe_job_response :
  ?medical_scribe_job:medical_scribe_job -> unit -> start_medical_scribe_job_response

val make_start_medical_scribe_job_request :
  ?output_encryption_kms_key_id:kms_key_id ->
  ?kms_encryption_context:kms_encryption_context_map ->
  ?channel_definitions:medical_scribe_channel_definitions ->
  ?tags:tag_list ->
  ?medical_scribe_context:medical_scribe_context ->
  medical_scribe_job_name:transcription_job_name ->
  media:media ->
  output_bucket_name:output_bucket_name ->
  data_access_role_arn:data_access_role_arn ->
  settings:medical_scribe_settings ->
  unit ->
  start_medical_scribe_job_request

val make_start_medical_transcription_job_response :
  ?medical_transcription_job:medical_transcription_job ->
  unit ->
  start_medical_transcription_job_response

val make_start_medical_transcription_job_request :
  ?media_sample_rate_hertz:medical_media_sample_rate_hertz ->
  ?media_format:media_format ->
  ?output_key:output_key ->
  ?output_encryption_kms_key_id:kms_key_id ->
  ?kms_encryption_context:kms_encryption_context_map ->
  ?settings:medical_transcription_setting ->
  ?content_identification_type:medical_content_identification_type ->
  ?tags:tag_list ->
  medical_transcription_job_name:transcription_job_name ->
  language_code:language_code ->
  media:media ->
  output_bucket_name:output_bucket_name ->
  specialty:specialty ->
  type_:type_ ->
  unit ->
  start_medical_transcription_job_request

val make_start_transcription_job_response :
  ?transcription_job:transcription_job -> unit -> start_transcription_job_response

val make_subtitles :
  ?formats:subtitle_formats -> ?output_start_index:subtitle_output_start_index -> unit -> subtitles

val make_start_transcription_job_request :
  ?language_code:language_code ->
  ?media_sample_rate_hertz:media_sample_rate_hertz ->
  ?media_format:media_format ->
  ?output_bucket_name:output_bucket_name ->
  ?output_key:output_key ->
  ?output_encryption_kms_key_id:kms_key_id ->
  ?kms_encryption_context:kms_encryption_context_map ->
  ?settings:settings ->
  ?model_settings:model_settings ->
  ?job_execution_settings:job_execution_settings ->
  ?content_redaction:content_redaction ->
  ?identify_language:boolean_ ->
  ?identify_multiple_languages:boolean_ ->
  ?language_options:language_options ->
  ?subtitles:subtitles ->
  ?tags:tag_list ->
  ?language_id_settings:language_id_settings_map ->
  ?toxicity_detection:toxicity_detection ->
  transcription_job_name:transcription_job_name ->
  media:media ->
  unit ->
  start_transcription_job_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:transcribe_arn -> tags:tag_list -> unit -> tag_resource_request

val make_update_vocabulary_filter_response :
  ?vocabulary_filter_name:vocabulary_filter_name ->
  ?language_code:language_code ->
  ?last_modified_time:date_time ->
  unit ->
  update_vocabulary_filter_response

val make_update_vocabulary_filter_request :
  ?words:words ->
  ?vocabulary_filter_file_uri:uri ->
  ?data_access_role_arn:data_access_role_arn ->
  vocabulary_filter_name:vocabulary_filter_name ->
  unit ->
  update_vocabulary_filter_request

val make_update_vocabulary_response :
  ?vocabulary_name:vocabulary_name ->
  ?language_code:language_code ->
  ?last_modified_time:date_time ->
  ?vocabulary_state:vocabulary_state ->
  unit ->
  update_vocabulary_response

val make_update_vocabulary_request :
  ?phrases:phrases ->
  ?vocabulary_file_uri:uri ->
  ?data_access_role_arn:data_access_role_arn ->
  vocabulary_name:vocabulary_name ->
  language_code:language_code ->
  unit ->
  update_vocabulary_request

val make_update_medical_vocabulary_response :
  ?vocabulary_name:vocabulary_name ->
  ?language_code:language_code ->
  ?last_modified_time:date_time ->
  ?vocabulary_state:vocabulary_state ->
  unit ->
  update_medical_vocabulary_response

val make_update_medical_vocabulary_request :
  vocabulary_name:vocabulary_name ->
  language_code:language_code ->
  vocabulary_file_uri:uri ->
  unit ->
  update_medical_vocabulary_request

val make_update_call_analytics_category_response :
  ?category_properties:category_properties -> unit -> update_call_analytics_category_response

val make_update_call_analytics_category_request :
  ?input_type:input_type ->
  category_name:category_name ->
  rules:rule_list ->
  unit ->
  update_call_analytics_category_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:transcribe_arn -> tag_keys:tag_key_list -> unit -> untag_resource_request
