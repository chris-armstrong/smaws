open Types

let make_absolute_time_range ?start_time:(start_time_ : timestamp_milliseconds option)
    ?end_time:(end_time_ : timestamp_milliseconds option)
    ?first:(first_ : timestamp_milliseconds option) ?last:(last_ : timestamp_milliseconds option) ()
    =
  ({ start_time = start_time_; end_time = end_time_; first = first_; last = last_ }
    : absolute_time_range)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_channel_definition ?channel_id:(channel_id_ : channel_id option)
    ?participant_role:(participant_role_ : participant_role option) () =
  ({ channel_id = channel_id_; participant_role = participant_role_ } : channel_definition)

let make_summarization ~generate_abstractive_summary:(generate_abstractive_summary_ : boolean_) () =
  ({ generate_abstractive_summary = generate_abstractive_summary_ } : summarization)

let make_language_id_settings ?vocabulary_name:(vocabulary_name_ : vocabulary_name option)
    ?vocabulary_filter_name:(vocabulary_filter_name_ : vocabulary_filter_name option)
    ?language_model_name:(language_model_name_ : model_name option) () =
  ({
     vocabulary_name = vocabulary_name_;
     vocabulary_filter_name = vocabulary_filter_name_;
     language_model_name = language_model_name_;
   }
    : language_id_settings)

let make_content_redaction ?pii_entity_types:(pii_entity_types_ : pii_entity_types option)
    ~redaction_type:(redaction_type_ : redaction_type)
    ~redaction_output:(redaction_output_ : redaction_output) () =
  ({
     redaction_type = redaction_type_;
     redaction_output = redaction_output_;
     pii_entity_types = pii_entity_types_;
   }
    : content_redaction)

let make_call_analytics_job_settings ?vocabulary_name:(vocabulary_name_ : vocabulary_name option)
    ?vocabulary_filter_name:(vocabulary_filter_name_ : vocabulary_filter_name option)
    ?vocabulary_filter_method:(vocabulary_filter_method_ : vocabulary_filter_method option)
    ?language_model_name:(language_model_name_ : model_name option)
    ?content_redaction:(content_redaction_ : content_redaction option)
    ?language_options:(language_options_ : language_options option)
    ?language_id_settings:(language_id_settings_ : language_id_settings_map option)
    ?summarization:(summarization_ : summarization option) () =
  ({
     vocabulary_name = vocabulary_name_;
     vocabulary_filter_name = vocabulary_filter_name_;
     vocabulary_filter_method = vocabulary_filter_method_;
     language_model_name = language_model_name_;
     content_redaction = content_redaction_;
     language_options = language_options_;
     language_id_settings = language_id_settings_;
     summarization = summarization_;
   }
    : call_analytics_job_settings)

let make_transcript ?transcript_file_uri:(transcript_file_uri_ : uri option)
    ?redacted_transcript_file_uri:(redacted_transcript_file_uri_ : uri option) () =
  ({
     transcript_file_uri = transcript_file_uri_;
     redacted_transcript_file_uri = redacted_transcript_file_uri_;
   }
    : transcript)

let make_media ?media_file_uri:(media_file_uri_ : uri option)
    ?redacted_media_file_uri:(redacted_media_file_uri_ : uri option) () =
  ({ media_file_uri = media_file_uri_; redacted_media_file_uri = redacted_media_file_uri_ } : media)

let make_call_analytics_skipped_feature ?feature:(feature_ : call_analytics_feature option)
    ?reason_code:(reason_code_ : call_analytics_skipped_reason_code option)
    ?message:(message_ : string_ option) () =
  ({ feature = feature_; reason_code = reason_code_; message = message_ }
    : call_analytics_skipped_feature)

let make_call_analytics_job_details ?skipped:(skipped_ : call_analytics_skipped_feature_list option)
    () =
  ({ skipped = skipped_ } : call_analytics_job_details)

let make_call_analytics_job
    ?call_analytics_job_name:(call_analytics_job_name_ : call_analytics_job_name option)
    ?call_analytics_job_status:(call_analytics_job_status_ : call_analytics_job_status option)
    ?call_analytics_job_details:(call_analytics_job_details_ : call_analytics_job_details option)
    ?language_code:(language_code_ : language_code option)
    ?media_sample_rate_hertz:(media_sample_rate_hertz_ : media_sample_rate_hertz option)
    ?media_format:(media_format_ : media_format option) ?media:(media_ : media option)
    ?transcript:(transcript_ : transcript option) ?start_time:(start_time_ : date_time option)
    ?creation_time:(creation_time_ : date_time option)
    ?completion_time:(completion_time_ : date_time option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?data_access_role_arn:(data_access_role_arn_ : data_access_role_arn option)
    ?identified_language_score:(identified_language_score_ : identified_language_score option)
    ?settings:(settings_ : call_analytics_job_settings option)
    ?channel_definitions:(channel_definitions_ : channel_definitions option)
    ?tags:(tags_ : tag_list option) () =
  ({
     call_analytics_job_name = call_analytics_job_name_;
     call_analytics_job_status = call_analytics_job_status_;
     call_analytics_job_details = call_analytics_job_details_;
     language_code = language_code_;
     media_sample_rate_hertz = media_sample_rate_hertz_;
     media_format = media_format_;
     media = media_;
     transcript = transcript_;
     start_time = start_time_;
     creation_time = creation_time_;
     completion_time = completion_time_;
     failure_reason = failure_reason_;
     data_access_role_arn = data_access_role_arn_;
     identified_language_score = identified_language_score_;
     settings = settings_;
     channel_definitions = channel_definitions_;
     tags = tags_;
   }
    : call_analytics_job)

let make_call_analytics_job_summary
    ?call_analytics_job_name:(call_analytics_job_name_ : call_analytics_job_name option)
    ?creation_time:(creation_time_ : date_time option) ?start_time:(start_time_ : date_time option)
    ?completion_time:(completion_time_ : date_time option)
    ?language_code:(language_code_ : language_code option)
    ?call_analytics_job_status:(call_analytics_job_status_ : call_analytics_job_status option)
    ?call_analytics_job_details:(call_analytics_job_details_ : call_analytics_job_details option)
    ?failure_reason:(failure_reason_ : failure_reason option) () =
  ({
     call_analytics_job_name = call_analytics_job_name_;
     creation_time = creation_time_;
     start_time = start_time_;
     completion_time = completion_time_;
     language_code = language_code_;
     call_analytics_job_status = call_analytics_job_status_;
     call_analytics_job_details = call_analytics_job_details_;
     failure_reason = failure_reason_;
   }
    : call_analytics_job_summary)

let make_relative_time_range ?start_percentage:(start_percentage_ : percentage option)
    ?end_percentage:(end_percentage_ : percentage option) ?first:(first_ : percentage option)
    ?last:(last_ : percentage option) () =
  ({
     start_percentage = start_percentage_;
     end_percentage = end_percentage_;
     first = first_;
     last = last_;
   }
    : relative_time_range)

let make_sentiment_filter ?absolute_time_range:(absolute_time_range_ : absolute_time_range option)
    ?relative_time_range:(relative_time_range_ : relative_time_range option)
    ?participant_role:(participant_role_ : participant_role option)
    ?negate:(negate_ : boolean_ option) ~sentiments:(sentiments_ : sentiment_value_list) () =
  ({
     sentiments = sentiments_;
     absolute_time_range = absolute_time_range_;
     relative_time_range = relative_time_range_;
     participant_role = participant_role_;
     negate = negate_;
   }
    : sentiment_filter)

let make_transcript_filter ?absolute_time_range:(absolute_time_range_ : absolute_time_range option)
    ?relative_time_range:(relative_time_range_ : relative_time_range option)
    ?participant_role:(participant_role_ : participant_role option)
    ?negate:(negate_ : boolean_ option)
    ~transcript_filter_type:(transcript_filter_type_ : transcript_filter_type)
    ~targets:(targets_ : string_target_list) () =
  ({
     transcript_filter_type = transcript_filter_type_;
     absolute_time_range = absolute_time_range_;
     relative_time_range = relative_time_range_;
     participant_role = participant_role_;
     negate = negate_;
     targets = targets_;
   }
    : transcript_filter)

let make_interruption_filter ?threshold:(threshold_ : timestamp_milliseconds option)
    ?participant_role:(participant_role_ : participant_role option)
    ?absolute_time_range:(absolute_time_range_ : absolute_time_range option)
    ?relative_time_range:(relative_time_range_ : relative_time_range option)
    ?negate:(negate_ : boolean_ option) () =
  ({
     threshold = threshold_;
     participant_role = participant_role_;
     absolute_time_range = absolute_time_range_;
     relative_time_range = relative_time_range_;
     negate = negate_;
   }
    : interruption_filter)

let make_non_talk_time_filter ?threshold:(threshold_ : timestamp_milliseconds option)
    ?absolute_time_range:(absolute_time_range_ : absolute_time_range option)
    ?relative_time_range:(relative_time_range_ : relative_time_range option)
    ?negate:(negate_ : boolean_ option) () =
  ({
     threshold = threshold_;
     absolute_time_range = absolute_time_range_;
     relative_time_range = relative_time_range_;
     negate = negate_;
   }
    : non_talk_time_filter)

let make_category_properties ?category_name:(category_name_ : category_name option)
    ?rules:(rules_ : rule_list option) ?create_time:(create_time_ : date_time option)
    ?last_update_time:(last_update_time_ : date_time option) ?tags:(tags_ : tag_list option)
    ?input_type:(input_type_ : input_type option) () =
  ({
     category_name = category_name_;
     rules = rules_;
     create_time = create_time_;
     last_update_time = last_update_time_;
     tags = tags_;
     input_type = input_type_;
   }
    : category_properties)

let make_clinical_note_generation_settings
    ?note_template:(note_template_ : medical_scribe_note_template option) () =
  ({ note_template = note_template_ } : clinical_note_generation_settings)

let make_create_call_analytics_category_response
    ?category_properties:(category_properties_ : category_properties option) () =
  ({ category_properties = category_properties_ } : create_call_analytics_category_response)

let make_create_call_analytics_category_request ?tags:(tags_ : tag_list option)
    ?input_type:(input_type_ : input_type option) ~category_name:(category_name_ : category_name)
    ~rules:(rules_ : rule_list) () =
  ({ category_name = category_name_; rules = rules_; tags = tags_; input_type = input_type_ }
    : create_call_analytics_category_request)

let make_input_data_config ?tuning_data_s3_uri:(tuning_data_s3_uri_ : uri option)
    ~s3_uri:(s3_uri_ : uri) ~data_access_role_arn:(data_access_role_arn_ : data_access_role_arn) ()
    =
  ({
     s3_uri = s3_uri_;
     tuning_data_s3_uri = tuning_data_s3_uri_;
     data_access_role_arn = data_access_role_arn_;
   }
    : input_data_config)

let make_create_language_model_response ?language_code:(language_code_ : clm_language_code option)
    ?base_model_name:(base_model_name_ : base_model_name option)
    ?model_name:(model_name_ : model_name option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?model_status:(model_status_ : model_status option) () =
  ({
     language_code = language_code_;
     base_model_name = base_model_name_;
     model_name = model_name_;
     input_data_config = input_data_config_;
     model_status = model_status_;
   }
    : create_language_model_response)

let make_create_language_model_request ?tags:(tags_ : tag_list option)
    ~language_code:(language_code_ : clm_language_code)
    ~base_model_name:(base_model_name_ : base_model_name) ~model_name:(model_name_ : model_name)
    ~input_data_config:(input_data_config_ : input_data_config) () =
  ({
     language_code = language_code_;
     base_model_name = base_model_name_;
     model_name = model_name_;
     input_data_config = input_data_config_;
     tags = tags_;
   }
    : create_language_model_request)

let make_create_medical_vocabulary_response
    ?vocabulary_name:(vocabulary_name_ : vocabulary_name option)
    ?language_code:(language_code_ : language_code option)
    ?vocabulary_state:(vocabulary_state_ : vocabulary_state option)
    ?last_modified_time:(last_modified_time_ : date_time option)
    ?failure_reason:(failure_reason_ : failure_reason option) () =
  ({
     vocabulary_name = vocabulary_name_;
     language_code = language_code_;
     vocabulary_state = vocabulary_state_;
     last_modified_time = last_modified_time_;
     failure_reason = failure_reason_;
   }
    : create_medical_vocabulary_response)

let make_create_medical_vocabulary_request ?tags:(tags_ : tag_list option)
    ~vocabulary_name:(vocabulary_name_ : vocabulary_name)
    ~language_code:(language_code_ : language_code)
    ~vocabulary_file_uri:(vocabulary_file_uri_ : uri) () =
  ({
     vocabulary_name = vocabulary_name_;
     language_code = language_code_;
     vocabulary_file_uri = vocabulary_file_uri_;
     tags = tags_;
   }
    : create_medical_vocabulary_request)

let make_create_vocabulary_response ?vocabulary_name:(vocabulary_name_ : vocabulary_name option)
    ?language_code:(language_code_ : language_code option)
    ?vocabulary_state:(vocabulary_state_ : vocabulary_state option)
    ?last_modified_time:(last_modified_time_ : date_time option)
    ?failure_reason:(failure_reason_ : failure_reason option) () =
  ({
     vocabulary_name = vocabulary_name_;
     language_code = language_code_;
     vocabulary_state = vocabulary_state_;
     last_modified_time = last_modified_time_;
     failure_reason = failure_reason_;
   }
    : create_vocabulary_response)

let make_create_vocabulary_request ?phrases:(phrases_ : phrases option)
    ?vocabulary_file_uri:(vocabulary_file_uri_ : uri option) ?tags:(tags_ : tag_list option)
    ?data_access_role_arn:(data_access_role_arn_ : data_access_role_arn option)
    ~vocabulary_name:(vocabulary_name_ : vocabulary_name)
    ~language_code:(language_code_ : language_code) () =
  ({
     vocabulary_name = vocabulary_name_;
     language_code = language_code_;
     phrases = phrases_;
     vocabulary_file_uri = vocabulary_file_uri_;
     tags = tags_;
     data_access_role_arn = data_access_role_arn_;
   }
    : create_vocabulary_request)

let make_create_vocabulary_filter_response
    ?vocabulary_filter_name:(vocabulary_filter_name_ : vocabulary_filter_name option)
    ?language_code:(language_code_ : language_code option)
    ?last_modified_time:(last_modified_time_ : date_time option) () =
  ({
     vocabulary_filter_name = vocabulary_filter_name_;
     language_code = language_code_;
     last_modified_time = last_modified_time_;
   }
    : create_vocabulary_filter_response)

let make_create_vocabulary_filter_request ?words:(words_ : words option)
    ?vocabulary_filter_file_uri:(vocabulary_filter_file_uri_ : uri option)
    ?tags:(tags_ : tag_list option)
    ?data_access_role_arn:(data_access_role_arn_ : data_access_role_arn option)
    ~vocabulary_filter_name:(vocabulary_filter_name_ : vocabulary_filter_name)
    ~language_code:(language_code_ : language_code) () =
  ({
     vocabulary_filter_name = vocabulary_filter_name_;
     language_code = language_code_;
     words = words_;
     vocabulary_filter_file_uri = vocabulary_filter_file_uri_;
     tags = tags_;
     data_access_role_arn = data_access_role_arn_;
   }
    : create_vocabulary_filter_request)

let make_delete_call_analytics_category_response () = (() : unit)

let make_delete_call_analytics_category_request ~category_name:(category_name_ : category_name) () =
  ({ category_name = category_name_ } : delete_call_analytics_category_request)

let make_delete_call_analytics_job_response () = (() : unit)

let make_delete_call_analytics_job_request
    ~call_analytics_job_name:(call_analytics_job_name_ : call_analytics_job_name) () =
  ({ call_analytics_job_name = call_analytics_job_name_ } : delete_call_analytics_job_request)

let make_delete_language_model_request ~model_name:(model_name_ : model_name) () =
  ({ model_name = model_name_ } : delete_language_model_request)

let make_delete_medical_scribe_job_request
    ~medical_scribe_job_name:(medical_scribe_job_name_ : transcription_job_name) () =
  ({ medical_scribe_job_name = medical_scribe_job_name_ } : delete_medical_scribe_job_request)

let make_delete_medical_transcription_job_request
    ~medical_transcription_job_name:(medical_transcription_job_name_ : transcription_job_name) () =
  ({ medical_transcription_job_name = medical_transcription_job_name_ }
    : delete_medical_transcription_job_request)

let make_delete_medical_vocabulary_request ~vocabulary_name:(vocabulary_name_ : vocabulary_name) ()
    =
  ({ vocabulary_name = vocabulary_name_ } : delete_medical_vocabulary_request)

let make_delete_transcription_job_request
    ~transcription_job_name:(transcription_job_name_ : transcription_job_name) () =
  ({ transcription_job_name = transcription_job_name_ } : delete_transcription_job_request)

let make_delete_vocabulary_request ~vocabulary_name:(vocabulary_name_ : vocabulary_name) () =
  ({ vocabulary_name = vocabulary_name_ } : delete_vocabulary_request)

let make_delete_vocabulary_filter_request
    ~vocabulary_filter_name:(vocabulary_filter_name_ : vocabulary_filter_name) () =
  ({ vocabulary_filter_name = vocabulary_filter_name_ } : delete_vocabulary_filter_request)

let make_language_model ?model_name:(model_name_ : model_name option)
    ?create_time:(create_time_ : date_time option)
    ?last_modified_time:(last_modified_time_ : date_time option)
    ?language_code:(language_code_ : clm_language_code option)
    ?base_model_name:(base_model_name_ : base_model_name option)
    ?model_status:(model_status_ : model_status option)
    ?upgrade_availability:(upgrade_availability_ : boolean_ option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?input_data_config:(input_data_config_ : input_data_config option) () =
  ({
     model_name = model_name_;
     create_time = create_time_;
     last_modified_time = last_modified_time_;
     language_code = language_code_;
     base_model_name = base_model_name_;
     model_status = model_status_;
     upgrade_availability = upgrade_availability_;
     failure_reason = failure_reason_;
     input_data_config = input_data_config_;
   }
    : language_model)

let make_describe_language_model_response ?language_model:(language_model_ : language_model option)
    () =
  ({ language_model = language_model_ } : describe_language_model_response)

let make_describe_language_model_request ~model_name:(model_name_ : model_name) () =
  ({ model_name = model_name_ } : describe_language_model_request)

let make_get_call_analytics_category_response
    ?category_properties:(category_properties_ : category_properties option) () =
  ({ category_properties = category_properties_ } : get_call_analytics_category_response)

let make_get_call_analytics_category_request ~category_name:(category_name_ : category_name) () =
  ({ category_name = category_name_ } : get_call_analytics_category_request)

let make_get_call_analytics_job_response
    ?call_analytics_job:(call_analytics_job_ : call_analytics_job option) () =
  ({ call_analytics_job = call_analytics_job_ } : get_call_analytics_job_response)

let make_get_call_analytics_job_request
    ~call_analytics_job_name:(call_analytics_job_name_ : call_analytics_job_name) () =
  ({ call_analytics_job_name = call_analytics_job_name_ } : get_call_analytics_job_request)

let make_medical_scribe_channel_definition ~channel_id:(channel_id_ : medical_scribe_channel_id)
    ~participant_role:(participant_role_ : medical_scribe_participant_role) () =
  ({ channel_id = channel_id_; participant_role = participant_role_ }
    : medical_scribe_channel_definition)

let make_medical_scribe_settings ?show_speaker_labels:(show_speaker_labels_ : boolean_ option)
    ?max_speaker_labels:(max_speaker_labels_ : max_speakers option)
    ?channel_identification:(channel_identification_ : boolean_ option)
    ?vocabulary_name:(vocabulary_name_ : vocabulary_name option)
    ?vocabulary_filter_name:(vocabulary_filter_name_ : vocabulary_filter_name option)
    ?vocabulary_filter_method:(vocabulary_filter_method_ : vocabulary_filter_method option)
    ?clinical_note_generation_settings:
      (clinical_note_generation_settings_ : clinical_note_generation_settings option) () =
  ({
     show_speaker_labels = show_speaker_labels_;
     max_speaker_labels = max_speaker_labels_;
     channel_identification = channel_identification_;
     vocabulary_name = vocabulary_name_;
     vocabulary_filter_name = vocabulary_filter_name_;
     vocabulary_filter_method = vocabulary_filter_method_;
     clinical_note_generation_settings = clinical_note_generation_settings_;
   }
    : medical_scribe_settings)

let make_medical_scribe_output ~transcript_file_uri:(transcript_file_uri_ : uri)
    ~clinical_document_uri:(clinical_document_uri_ : uri) () =
  ({ transcript_file_uri = transcript_file_uri_; clinical_document_uri = clinical_document_uri_ }
    : medical_scribe_output)

let make_medical_scribe_job
    ?medical_scribe_job_name:(medical_scribe_job_name_ : transcription_job_name option)
    ?medical_scribe_job_status:(medical_scribe_job_status_ : medical_scribe_job_status option)
    ?language_code:(language_code_ : medical_scribe_language_code option)
    ?media:(media_ : media option)
    ?medical_scribe_output:(medical_scribe_output_ : medical_scribe_output option)
    ?start_time:(start_time_ : date_time option) ?creation_time:(creation_time_ : date_time option)
    ?completion_time:(completion_time_ : date_time option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?settings:(settings_ : medical_scribe_settings option)
    ?data_access_role_arn:(data_access_role_arn_ : data_access_role_arn option)
    ?channel_definitions:(channel_definitions_ : medical_scribe_channel_definitions option)
    ?medical_scribe_context_provided:(medical_scribe_context_provided_ : boolean_ option)
    ?tags:(tags_ : tag_list option) () =
  ({
     medical_scribe_job_name = medical_scribe_job_name_;
     medical_scribe_job_status = medical_scribe_job_status_;
     language_code = language_code_;
     media = media_;
     medical_scribe_output = medical_scribe_output_;
     start_time = start_time_;
     creation_time = creation_time_;
     completion_time = completion_time_;
     failure_reason = failure_reason_;
     settings = settings_;
     data_access_role_arn = data_access_role_arn_;
     channel_definitions = channel_definitions_;
     medical_scribe_context_provided = medical_scribe_context_provided_;
     tags = tags_;
   }
    : medical_scribe_job)

let make_get_medical_scribe_job_response
    ?medical_scribe_job:(medical_scribe_job_ : medical_scribe_job option) () =
  ({ medical_scribe_job = medical_scribe_job_ } : get_medical_scribe_job_response)

let make_get_medical_scribe_job_request
    ~medical_scribe_job_name:(medical_scribe_job_name_ : transcription_job_name) () =
  ({ medical_scribe_job_name = medical_scribe_job_name_ } : get_medical_scribe_job_request)

let make_medical_transcription_setting ?show_speaker_labels:(show_speaker_labels_ : boolean_ option)
    ?max_speaker_labels:(max_speaker_labels_ : max_speakers option)
    ?channel_identification:(channel_identification_ : boolean_ option)
    ?show_alternatives:(show_alternatives_ : boolean_ option)
    ?max_alternatives:(max_alternatives_ : max_alternatives option)
    ?vocabulary_name:(vocabulary_name_ : vocabulary_name option) () =
  ({
     show_speaker_labels = show_speaker_labels_;
     max_speaker_labels = max_speaker_labels_;
     channel_identification = channel_identification_;
     show_alternatives = show_alternatives_;
     max_alternatives = max_alternatives_;
     vocabulary_name = vocabulary_name_;
   }
    : medical_transcription_setting)

let make_medical_transcript ?transcript_file_uri:(transcript_file_uri_ : uri option) () =
  ({ transcript_file_uri = transcript_file_uri_ } : medical_transcript)

let make_medical_transcription_job
    ?medical_transcription_job_name:
      (medical_transcription_job_name_ : transcription_job_name option)
    ?transcription_job_status:(transcription_job_status_ : transcription_job_status option)
    ?language_code:(language_code_ : language_code option)
    ?media_sample_rate_hertz:(media_sample_rate_hertz_ : medical_media_sample_rate_hertz option)
    ?media_format:(media_format_ : media_format option) ?media:(media_ : media option)
    ?transcript:(transcript_ : medical_transcript option)
    ?start_time:(start_time_ : date_time option) ?creation_time:(creation_time_ : date_time option)
    ?completion_time:(completion_time_ : date_time option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?settings:(settings_ : medical_transcription_setting option)
    ?content_identification_type:
      (content_identification_type_ : medical_content_identification_type option)
    ?specialty:(specialty_ : specialty option) ?type_:(type__ : type_ option)
    ?tags:(tags_ : tag_list option) () =
  ({
     medical_transcription_job_name = medical_transcription_job_name_;
     transcription_job_status = transcription_job_status_;
     language_code = language_code_;
     media_sample_rate_hertz = media_sample_rate_hertz_;
     media_format = media_format_;
     media = media_;
     transcript = transcript_;
     start_time = start_time_;
     creation_time = creation_time_;
     completion_time = completion_time_;
     failure_reason = failure_reason_;
     settings = settings_;
     content_identification_type = content_identification_type_;
     specialty = specialty_;
     type_ = type__;
     tags = tags_;
   }
    : medical_transcription_job)

let make_get_medical_transcription_job_response
    ?medical_transcription_job:(medical_transcription_job_ : medical_transcription_job option) () =
  ({ medical_transcription_job = medical_transcription_job_ }
    : get_medical_transcription_job_response)

let make_get_medical_transcription_job_request
    ~medical_transcription_job_name:(medical_transcription_job_name_ : transcription_job_name) () =
  ({ medical_transcription_job_name = medical_transcription_job_name_ }
    : get_medical_transcription_job_request)

let make_get_medical_vocabulary_response
    ?vocabulary_name:(vocabulary_name_ : vocabulary_name option)
    ?language_code:(language_code_ : language_code option)
    ?vocabulary_state:(vocabulary_state_ : vocabulary_state option)
    ?last_modified_time:(last_modified_time_ : date_time option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?download_uri:(download_uri_ : uri option) () =
  ({
     vocabulary_name = vocabulary_name_;
     language_code = language_code_;
     vocabulary_state = vocabulary_state_;
     last_modified_time = last_modified_time_;
     failure_reason = failure_reason_;
     download_uri = download_uri_;
   }
    : get_medical_vocabulary_response)

let make_get_medical_vocabulary_request ~vocabulary_name:(vocabulary_name_ : vocabulary_name) () =
  ({ vocabulary_name = vocabulary_name_ } : get_medical_vocabulary_request)

let make_toxicity_detection_settings
    ~toxicity_categories:(toxicity_categories_ : toxicity_categories) () =
  ({ toxicity_categories = toxicity_categories_ } : toxicity_detection_settings)

let make_subtitles_output ?formats:(formats_ : subtitle_formats option)
    ?subtitle_file_uris:(subtitle_file_uris_ : subtitle_file_uris option)
    ?output_start_index:(output_start_index_ : subtitle_output_start_index option) () =
  ({
     formats = formats_;
     subtitle_file_uris = subtitle_file_uris_;
     output_start_index = output_start_index_;
   }
    : subtitles_output)

let make_language_code_item ?language_code:(language_code_ : language_code option)
    ?duration_in_seconds:(duration_in_seconds_ : duration_in_seconds option) () =
  ({ language_code = language_code_; duration_in_seconds = duration_in_seconds_ }
    : language_code_item)

let make_job_execution_settings
    ?allow_deferred_execution:(allow_deferred_execution_ : boolean_ option)
    ?data_access_role_arn:(data_access_role_arn_ : data_access_role_arn option) () =
  ({
     allow_deferred_execution = allow_deferred_execution_;
     data_access_role_arn = data_access_role_arn_;
   }
    : job_execution_settings)

let make_model_settings ?language_model_name:(language_model_name_ : model_name option) () =
  ({ language_model_name = language_model_name_ } : model_settings)

let make_settings ?vocabulary_name:(vocabulary_name_ : vocabulary_name option)
    ?show_speaker_labels:(show_speaker_labels_ : boolean_ option)
    ?max_speaker_labels:(max_speaker_labels_ : max_speakers option)
    ?channel_identification:(channel_identification_ : boolean_ option)
    ?show_alternatives:(show_alternatives_ : boolean_ option)
    ?max_alternatives:(max_alternatives_ : max_alternatives option)
    ?vocabulary_filter_name:(vocabulary_filter_name_ : vocabulary_filter_name option)
    ?vocabulary_filter_method:(vocabulary_filter_method_ : vocabulary_filter_method option) () =
  ({
     vocabulary_name = vocabulary_name_;
     show_speaker_labels = show_speaker_labels_;
     max_speaker_labels = max_speaker_labels_;
     channel_identification = channel_identification_;
     show_alternatives = show_alternatives_;
     max_alternatives = max_alternatives_;
     vocabulary_filter_name = vocabulary_filter_name_;
     vocabulary_filter_method = vocabulary_filter_method_;
   }
    : settings)

let make_transcription_job
    ?transcription_job_name:(transcription_job_name_ : transcription_job_name option)
    ?transcription_job_status:(transcription_job_status_ : transcription_job_status option)
    ?language_code:(language_code_ : language_code option)
    ?media_sample_rate_hertz:(media_sample_rate_hertz_ : media_sample_rate_hertz option)
    ?media_format:(media_format_ : media_format option) ?media:(media_ : media option)
    ?transcript:(transcript_ : transcript option) ?start_time:(start_time_ : date_time option)
    ?creation_time:(creation_time_ : date_time option)
    ?completion_time:(completion_time_ : date_time option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?settings:(settings_ : settings option)
    ?model_settings:(model_settings_ : model_settings option)
    ?job_execution_settings:(job_execution_settings_ : job_execution_settings option)
    ?content_redaction:(content_redaction_ : content_redaction option)
    ?identify_language:(identify_language_ : boolean_ option)
    ?identify_multiple_languages:(identify_multiple_languages_ : boolean_ option)
    ?language_options:(language_options_ : language_options option)
    ?identified_language_score:(identified_language_score_ : identified_language_score option)
    ?language_codes:(language_codes_ : language_code_list option) ?tags:(tags_ : tag_list option)
    ?subtitles:(subtitles_ : subtitles_output option)
    ?language_id_settings:(language_id_settings_ : language_id_settings_map option)
    ?toxicity_detection:(toxicity_detection_ : toxicity_detection option) () =
  ({
     transcription_job_name = transcription_job_name_;
     transcription_job_status = transcription_job_status_;
     language_code = language_code_;
     media_sample_rate_hertz = media_sample_rate_hertz_;
     media_format = media_format_;
     media = media_;
     transcript = transcript_;
     start_time = start_time_;
     creation_time = creation_time_;
     completion_time = completion_time_;
     failure_reason = failure_reason_;
     settings = settings_;
     model_settings = model_settings_;
     job_execution_settings = job_execution_settings_;
     content_redaction = content_redaction_;
     identify_language = identify_language_;
     identify_multiple_languages = identify_multiple_languages_;
     language_options = language_options_;
     identified_language_score = identified_language_score_;
     language_codes = language_codes_;
     tags = tags_;
     subtitles = subtitles_;
     language_id_settings = language_id_settings_;
     toxicity_detection = toxicity_detection_;
   }
    : transcription_job)

let make_get_transcription_job_response
    ?transcription_job:(transcription_job_ : transcription_job option) () =
  ({ transcription_job = transcription_job_ } : get_transcription_job_response)

let make_get_transcription_job_request
    ~transcription_job_name:(transcription_job_name_ : transcription_job_name) () =
  ({ transcription_job_name = transcription_job_name_ } : get_transcription_job_request)

let make_get_vocabulary_response ?vocabulary_name:(vocabulary_name_ : vocabulary_name option)
    ?language_code:(language_code_ : language_code option)
    ?vocabulary_state:(vocabulary_state_ : vocabulary_state option)
    ?last_modified_time:(last_modified_time_ : date_time option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?download_uri:(download_uri_ : uri option) () =
  ({
     vocabulary_name = vocabulary_name_;
     language_code = language_code_;
     vocabulary_state = vocabulary_state_;
     last_modified_time = last_modified_time_;
     failure_reason = failure_reason_;
     download_uri = download_uri_;
   }
    : get_vocabulary_response)

let make_get_vocabulary_request ~vocabulary_name:(vocabulary_name_ : vocabulary_name) () =
  ({ vocabulary_name = vocabulary_name_ } : get_vocabulary_request)

let make_get_vocabulary_filter_response
    ?vocabulary_filter_name:(vocabulary_filter_name_ : vocabulary_filter_name option)
    ?language_code:(language_code_ : language_code option)
    ?last_modified_time:(last_modified_time_ : date_time option)
    ?download_uri:(download_uri_ : uri option) () =
  ({
     vocabulary_filter_name = vocabulary_filter_name_;
     language_code = language_code_;
     last_modified_time = last_modified_time_;
     download_uri = download_uri_;
   }
    : get_vocabulary_filter_response)

let make_get_vocabulary_filter_request
    ~vocabulary_filter_name:(vocabulary_filter_name_ : vocabulary_filter_name) () =
  ({ vocabulary_filter_name = vocabulary_filter_name_ } : get_vocabulary_filter_request)

let make_list_call_analytics_categories_response ?next_token:(next_token_ : next_token option)
    ?categories:(categories_ : category_properties_list option) () =
  ({ next_token = next_token_; categories = categories_ } : list_call_analytics_categories_response)

let make_list_call_analytics_categories_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ }
    : list_call_analytics_categories_request)

let make_list_call_analytics_jobs_response ?status:(status_ : call_analytics_job_status option)
    ?next_token:(next_token_ : next_token option)
    ?call_analytics_job_summaries:
      (call_analytics_job_summaries_ : call_analytics_job_summaries option) () =
  ({
     status = status_;
     next_token = next_token_;
     call_analytics_job_summaries = call_analytics_job_summaries_;
   }
    : list_call_analytics_jobs_response)

let make_list_call_analytics_jobs_request ?status:(status_ : call_analytics_job_status option)
    ?job_name_contains:(job_name_contains_ : call_analytics_job_name option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     status = status_;
     job_name_contains = job_name_contains_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_call_analytics_jobs_request)

let make_list_language_models_response ?next_token:(next_token_ : next_token option)
    ?models:(models_ : models option) () =
  ({ next_token = next_token_; models = models_ } : list_language_models_response)

let make_list_language_models_request ?status_equals:(status_equals_ : model_status option)
    ?name_contains:(name_contains_ : model_name option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     status_equals = status_equals_;
     name_contains = name_contains_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_language_models_request)

let make_medical_scribe_job_summary
    ?medical_scribe_job_name:(medical_scribe_job_name_ : transcription_job_name option)
    ?creation_time:(creation_time_ : date_time option) ?start_time:(start_time_ : date_time option)
    ?completion_time:(completion_time_ : date_time option)
    ?language_code:(language_code_ : medical_scribe_language_code option)
    ?medical_scribe_job_status:(medical_scribe_job_status_ : medical_scribe_job_status option)
    ?failure_reason:(failure_reason_ : failure_reason option) () =
  ({
     medical_scribe_job_name = medical_scribe_job_name_;
     creation_time = creation_time_;
     start_time = start_time_;
     completion_time = completion_time_;
     language_code = language_code_;
     medical_scribe_job_status = medical_scribe_job_status_;
     failure_reason = failure_reason_;
   }
    : medical_scribe_job_summary)

let make_list_medical_scribe_jobs_response ?status:(status_ : medical_scribe_job_status option)
    ?next_token:(next_token_ : next_token option)
    ?medical_scribe_job_summaries:
      (medical_scribe_job_summaries_ : medical_scribe_job_summaries option) () =
  ({
     status = status_;
     next_token = next_token_;
     medical_scribe_job_summaries = medical_scribe_job_summaries_;
   }
    : list_medical_scribe_jobs_response)

let make_list_medical_scribe_jobs_request ?status:(status_ : medical_scribe_job_status option)
    ?job_name_contains:(job_name_contains_ : transcription_job_name option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     status = status_;
     job_name_contains = job_name_contains_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_medical_scribe_jobs_request)

let make_medical_transcription_job_summary
    ?medical_transcription_job_name:
      (medical_transcription_job_name_ : transcription_job_name option)
    ?creation_time:(creation_time_ : date_time option) ?start_time:(start_time_ : date_time option)
    ?completion_time:(completion_time_ : date_time option)
    ?language_code:(language_code_ : language_code option)
    ?transcription_job_status:(transcription_job_status_ : transcription_job_status option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?output_location_type:(output_location_type_ : output_location_type option)
    ?specialty:(specialty_ : specialty option)
    ?content_identification_type:
      (content_identification_type_ : medical_content_identification_type option)
    ?type_:(type__ : type_ option) () =
  ({
     medical_transcription_job_name = medical_transcription_job_name_;
     creation_time = creation_time_;
     start_time = start_time_;
     completion_time = completion_time_;
     language_code = language_code_;
     transcription_job_status = transcription_job_status_;
     failure_reason = failure_reason_;
     output_location_type = output_location_type_;
     specialty = specialty_;
     content_identification_type = content_identification_type_;
     type_ = type__;
   }
    : medical_transcription_job_summary)

let make_list_medical_transcription_jobs_response
    ?status:(status_ : transcription_job_status option)
    ?next_token:(next_token_ : next_token option)
    ?medical_transcription_job_summaries:
      (medical_transcription_job_summaries_ : medical_transcription_job_summaries option) () =
  ({
     status = status_;
     next_token = next_token_;
     medical_transcription_job_summaries = medical_transcription_job_summaries_;
   }
    : list_medical_transcription_jobs_response)

let make_list_medical_transcription_jobs_request ?status:(status_ : transcription_job_status option)
    ?job_name_contains:(job_name_contains_ : transcription_job_name option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     status = status_;
     job_name_contains = job_name_contains_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_medical_transcription_jobs_request)

let make_vocabulary_info ?vocabulary_name:(vocabulary_name_ : vocabulary_name option)
    ?language_code:(language_code_ : language_code option)
    ?last_modified_time:(last_modified_time_ : date_time option)
    ?vocabulary_state:(vocabulary_state_ : vocabulary_state option) () =
  ({
     vocabulary_name = vocabulary_name_;
     language_code = language_code_;
     last_modified_time = last_modified_time_;
     vocabulary_state = vocabulary_state_;
   }
    : vocabulary_info)

let make_list_medical_vocabularies_response ?status:(status_ : vocabulary_state option)
    ?next_token:(next_token_ : next_token option)
    ?vocabularies:(vocabularies_ : vocabularies option) () =
  ({ status = status_; next_token = next_token_; vocabularies = vocabularies_ }
    : list_medical_vocabularies_response)

let make_list_medical_vocabularies_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?state_equals:(state_equals_ : vocabulary_state option)
    ?name_contains:(name_contains_ : vocabulary_name option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     state_equals = state_equals_;
     name_contains = name_contains_;
   }
    : list_medical_vocabularies_request)

let make_list_tags_for_resource_response ?resource_arn:(resource_arn_ : transcribe_arn option)
    ?tags:(tags_ : tag_list option) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : transcribe_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_transcription_job_summary
    ?transcription_job_name:(transcription_job_name_ : transcription_job_name option)
    ?creation_time:(creation_time_ : date_time option) ?start_time:(start_time_ : date_time option)
    ?completion_time:(completion_time_ : date_time option)
    ?language_code:(language_code_ : language_code option)
    ?transcription_job_status:(transcription_job_status_ : transcription_job_status option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?output_location_type:(output_location_type_ : output_location_type option)
    ?content_redaction:(content_redaction_ : content_redaction option)
    ?model_settings:(model_settings_ : model_settings option)
    ?identify_language:(identify_language_ : boolean_ option)
    ?identify_multiple_languages:(identify_multiple_languages_ : boolean_ option)
    ?identified_language_score:(identified_language_score_ : identified_language_score option)
    ?language_codes:(language_codes_ : language_code_list option)
    ?toxicity_detection:(toxicity_detection_ : toxicity_detection option) () =
  ({
     transcription_job_name = transcription_job_name_;
     creation_time = creation_time_;
     start_time = start_time_;
     completion_time = completion_time_;
     language_code = language_code_;
     transcription_job_status = transcription_job_status_;
     failure_reason = failure_reason_;
     output_location_type = output_location_type_;
     content_redaction = content_redaction_;
     model_settings = model_settings_;
     identify_language = identify_language_;
     identify_multiple_languages = identify_multiple_languages_;
     identified_language_score = identified_language_score_;
     language_codes = language_codes_;
     toxicity_detection = toxicity_detection_;
   }
    : transcription_job_summary)

let make_list_transcription_jobs_response ?status:(status_ : transcription_job_status option)
    ?next_token:(next_token_ : next_token option)
    ?transcription_job_summaries:(transcription_job_summaries_ : transcription_job_summaries option)
    () =
  ({
     status = status_;
     next_token = next_token_;
     transcription_job_summaries = transcription_job_summaries_;
   }
    : list_transcription_jobs_response)

let make_list_transcription_jobs_request ?status:(status_ : transcription_job_status option)
    ?job_name_contains:(job_name_contains_ : transcription_job_name option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     status = status_;
     job_name_contains = job_name_contains_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_transcription_jobs_request)

let make_list_vocabularies_response ?status:(status_ : vocabulary_state option)
    ?next_token:(next_token_ : next_token option)
    ?vocabularies:(vocabularies_ : vocabularies option) () =
  ({ status = status_; next_token = next_token_; vocabularies = vocabularies_ }
    : list_vocabularies_response)

let make_list_vocabularies_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?state_equals:(state_equals_ : vocabulary_state option)
    ?name_contains:(name_contains_ : vocabulary_name option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     state_equals = state_equals_;
     name_contains = name_contains_;
   }
    : list_vocabularies_request)

let make_vocabulary_filter_info
    ?vocabulary_filter_name:(vocabulary_filter_name_ : vocabulary_filter_name option)
    ?language_code:(language_code_ : language_code option)
    ?last_modified_time:(last_modified_time_ : date_time option) () =
  ({
     vocabulary_filter_name = vocabulary_filter_name_;
     language_code = language_code_;
     last_modified_time = last_modified_time_;
   }
    : vocabulary_filter_info)

let make_list_vocabulary_filters_response ?next_token:(next_token_ : next_token option)
    ?vocabulary_filters:(vocabulary_filters_ : vocabulary_filters option) () =
  ({ next_token = next_token_; vocabulary_filters = vocabulary_filters_ }
    : list_vocabulary_filters_response)

let make_list_vocabulary_filters_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?name_contains:(name_contains_ : vocabulary_filter_name option) () =
  ({ next_token = next_token_; max_results = max_results_; name_contains = name_contains_ }
    : list_vocabulary_filters_request)

let make_medical_scribe_patient_context ?pronouns:(pronouns_ : pronouns option) () =
  ({ pronouns = pronouns_ } : medical_scribe_patient_context)

let make_medical_scribe_context
    ?patient_context:(patient_context_ : medical_scribe_patient_context option) () =
  ({ patient_context = patient_context_ } : medical_scribe_context)

let make_start_call_analytics_job_response
    ?call_analytics_job:(call_analytics_job_ : call_analytics_job option) () =
  ({ call_analytics_job = call_analytics_job_ } : start_call_analytics_job_response)

let make_start_call_analytics_job_request ?output_location:(output_location_ : uri option)
    ?output_encryption_kms_key_id:(output_encryption_kms_key_id_ : kms_key_id option)
    ?data_access_role_arn:(data_access_role_arn_ : data_access_role_arn option)
    ?settings:(settings_ : call_analytics_job_settings option) ?tags:(tags_ : tag_list option)
    ?channel_definitions:(channel_definitions_ : channel_definitions option)
    ~call_analytics_job_name:(call_analytics_job_name_ : call_analytics_job_name)
    ~media:(media_ : media) () =
  ({
     call_analytics_job_name = call_analytics_job_name_;
     media = media_;
     output_location = output_location_;
     output_encryption_kms_key_id = output_encryption_kms_key_id_;
     data_access_role_arn = data_access_role_arn_;
     settings = settings_;
     tags = tags_;
     channel_definitions = channel_definitions_;
   }
    : start_call_analytics_job_request)

let make_start_medical_scribe_job_response
    ?medical_scribe_job:(medical_scribe_job_ : medical_scribe_job option) () =
  ({ medical_scribe_job = medical_scribe_job_ } : start_medical_scribe_job_response)

let make_start_medical_scribe_job_request
    ?output_encryption_kms_key_id:(output_encryption_kms_key_id_ : kms_key_id option)
    ?kms_encryption_context:(kms_encryption_context_ : kms_encryption_context_map option)
    ?channel_definitions:(channel_definitions_ : medical_scribe_channel_definitions option)
    ?tags:(tags_ : tag_list option)
    ?medical_scribe_context:(medical_scribe_context_ : medical_scribe_context option)
    ~medical_scribe_job_name:(medical_scribe_job_name_ : transcription_job_name)
    ~media:(media_ : media) ~output_bucket_name:(output_bucket_name_ : output_bucket_name)
    ~data_access_role_arn:(data_access_role_arn_ : data_access_role_arn)
    ~settings:(settings_ : medical_scribe_settings) () =
  ({
     medical_scribe_job_name = medical_scribe_job_name_;
     media = media_;
     output_bucket_name = output_bucket_name_;
     output_encryption_kms_key_id = output_encryption_kms_key_id_;
     kms_encryption_context = kms_encryption_context_;
     data_access_role_arn = data_access_role_arn_;
     settings = settings_;
     channel_definitions = channel_definitions_;
     tags = tags_;
     medical_scribe_context = medical_scribe_context_;
   }
    : start_medical_scribe_job_request)

let make_start_medical_transcription_job_response
    ?medical_transcription_job:(medical_transcription_job_ : medical_transcription_job option) () =
  ({ medical_transcription_job = medical_transcription_job_ }
    : start_medical_transcription_job_response)

let make_start_medical_transcription_job_request
    ?media_sample_rate_hertz:(media_sample_rate_hertz_ : medical_media_sample_rate_hertz option)
    ?media_format:(media_format_ : media_format option)
    ?output_key:(output_key_ : output_key option)
    ?output_encryption_kms_key_id:(output_encryption_kms_key_id_ : kms_key_id option)
    ?kms_encryption_context:(kms_encryption_context_ : kms_encryption_context_map option)
    ?settings:(settings_ : medical_transcription_setting option)
    ?content_identification_type:
      (content_identification_type_ : medical_content_identification_type option)
    ?tags:(tags_ : tag_list option)
    ~medical_transcription_job_name:(medical_transcription_job_name_ : transcription_job_name)
    ~language_code:(language_code_ : language_code) ~media:(media_ : media)
    ~output_bucket_name:(output_bucket_name_ : output_bucket_name)
    ~specialty:(specialty_ : specialty) ~type_:(type__ : type_) () =
  ({
     medical_transcription_job_name = medical_transcription_job_name_;
     language_code = language_code_;
     media_sample_rate_hertz = media_sample_rate_hertz_;
     media_format = media_format_;
     media = media_;
     output_bucket_name = output_bucket_name_;
     output_key = output_key_;
     output_encryption_kms_key_id = output_encryption_kms_key_id_;
     kms_encryption_context = kms_encryption_context_;
     settings = settings_;
     content_identification_type = content_identification_type_;
     specialty = specialty_;
     type_ = type__;
     tags = tags_;
   }
    : start_medical_transcription_job_request)

let make_start_transcription_job_response
    ?transcription_job:(transcription_job_ : transcription_job option) () =
  ({ transcription_job = transcription_job_ } : start_transcription_job_response)

let make_subtitles ?formats:(formats_ : subtitle_formats option)
    ?output_start_index:(output_start_index_ : subtitle_output_start_index option) () =
  ({ formats = formats_; output_start_index = output_start_index_ } : subtitles)

let make_start_transcription_job_request ?language_code:(language_code_ : language_code option)
    ?media_sample_rate_hertz:(media_sample_rate_hertz_ : media_sample_rate_hertz option)
    ?media_format:(media_format_ : media_format option)
    ?output_bucket_name:(output_bucket_name_ : output_bucket_name option)
    ?output_key:(output_key_ : output_key option)
    ?output_encryption_kms_key_id:(output_encryption_kms_key_id_ : kms_key_id option)
    ?kms_encryption_context:(kms_encryption_context_ : kms_encryption_context_map option)
    ?settings:(settings_ : settings option)
    ?model_settings:(model_settings_ : model_settings option)
    ?job_execution_settings:(job_execution_settings_ : job_execution_settings option)
    ?content_redaction:(content_redaction_ : content_redaction option)
    ?identify_language:(identify_language_ : boolean_ option)
    ?identify_multiple_languages:(identify_multiple_languages_ : boolean_ option)
    ?language_options:(language_options_ : language_options option)
    ?subtitles:(subtitles_ : subtitles option) ?tags:(tags_ : tag_list option)
    ?language_id_settings:(language_id_settings_ : language_id_settings_map option)
    ?toxicity_detection:(toxicity_detection_ : toxicity_detection option)
    ~transcription_job_name:(transcription_job_name_ : transcription_job_name)
    ~media:(media_ : media) () =
  ({
     transcription_job_name = transcription_job_name_;
     language_code = language_code_;
     media_sample_rate_hertz = media_sample_rate_hertz_;
     media_format = media_format_;
     media = media_;
     output_bucket_name = output_bucket_name_;
     output_key = output_key_;
     output_encryption_kms_key_id = output_encryption_kms_key_id_;
     kms_encryption_context = kms_encryption_context_;
     settings = settings_;
     model_settings = model_settings_;
     job_execution_settings = job_execution_settings_;
     content_redaction = content_redaction_;
     identify_language = identify_language_;
     identify_multiple_languages = identify_multiple_languages_;
     language_options = language_options_;
     subtitles = subtitles_;
     tags = tags_;
     language_id_settings = language_id_settings_;
     toxicity_detection = toxicity_detection_;
   }
    : start_transcription_job_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : transcribe_arn)
    ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_update_vocabulary_filter_response
    ?vocabulary_filter_name:(vocabulary_filter_name_ : vocabulary_filter_name option)
    ?language_code:(language_code_ : language_code option)
    ?last_modified_time:(last_modified_time_ : date_time option) () =
  ({
     vocabulary_filter_name = vocabulary_filter_name_;
     language_code = language_code_;
     last_modified_time = last_modified_time_;
   }
    : update_vocabulary_filter_response)

let make_update_vocabulary_filter_request ?words:(words_ : words option)
    ?vocabulary_filter_file_uri:(vocabulary_filter_file_uri_ : uri option)
    ?data_access_role_arn:(data_access_role_arn_ : data_access_role_arn option)
    ~vocabulary_filter_name:(vocabulary_filter_name_ : vocabulary_filter_name) () =
  ({
     vocabulary_filter_name = vocabulary_filter_name_;
     words = words_;
     vocabulary_filter_file_uri = vocabulary_filter_file_uri_;
     data_access_role_arn = data_access_role_arn_;
   }
    : update_vocabulary_filter_request)

let make_update_vocabulary_response ?vocabulary_name:(vocabulary_name_ : vocabulary_name option)
    ?language_code:(language_code_ : language_code option)
    ?last_modified_time:(last_modified_time_ : date_time option)
    ?vocabulary_state:(vocabulary_state_ : vocabulary_state option) () =
  ({
     vocabulary_name = vocabulary_name_;
     language_code = language_code_;
     last_modified_time = last_modified_time_;
     vocabulary_state = vocabulary_state_;
   }
    : update_vocabulary_response)

let make_update_vocabulary_request ?phrases:(phrases_ : phrases option)
    ?vocabulary_file_uri:(vocabulary_file_uri_ : uri option)
    ?data_access_role_arn:(data_access_role_arn_ : data_access_role_arn option)
    ~vocabulary_name:(vocabulary_name_ : vocabulary_name)
    ~language_code:(language_code_ : language_code) () =
  ({
     vocabulary_name = vocabulary_name_;
     language_code = language_code_;
     phrases = phrases_;
     vocabulary_file_uri = vocabulary_file_uri_;
     data_access_role_arn = data_access_role_arn_;
   }
    : update_vocabulary_request)

let make_update_medical_vocabulary_response
    ?vocabulary_name:(vocabulary_name_ : vocabulary_name option)
    ?language_code:(language_code_ : language_code option)
    ?last_modified_time:(last_modified_time_ : date_time option)
    ?vocabulary_state:(vocabulary_state_ : vocabulary_state option) () =
  ({
     vocabulary_name = vocabulary_name_;
     language_code = language_code_;
     last_modified_time = last_modified_time_;
     vocabulary_state = vocabulary_state_;
   }
    : update_medical_vocabulary_response)

let make_update_medical_vocabulary_request ~vocabulary_name:(vocabulary_name_ : vocabulary_name)
    ~language_code:(language_code_ : language_code)
    ~vocabulary_file_uri:(vocabulary_file_uri_ : uri) () =
  ({
     vocabulary_name = vocabulary_name_;
     language_code = language_code_;
     vocabulary_file_uri = vocabulary_file_uri_;
   }
    : update_medical_vocabulary_request)

let make_update_call_analytics_category_response
    ?category_properties:(category_properties_ : category_properties option) () =
  ({ category_properties = category_properties_ } : update_call_analytics_category_response)

let make_update_call_analytics_category_request ?input_type:(input_type_ : input_type option)
    ~category_name:(category_name_ : category_name) ~rules:(rules_ : rule_list) () =
  ({ category_name = category_name_; rules = rules_; input_type = input_type_ }
    : update_call_analytics_category_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : transcribe_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)
