open Types
let make_vocabulary_info
  ?vocabulary_state:(vocabulary_state_ : vocabulary_state option)
  ?last_modified_time:(last_modified_time_ : date_time option)
  ?language_code:(language_code_ : language_code option)
  ?vocabulary_name:(vocabulary_name_ : vocabulary_name option) () =
  ({
     vocabulary_state = vocabulary_state_;
     last_modified_time = last_modified_time_;
     language_code = language_code_;
     vocabulary_name = vocabulary_name_
   } : vocabulary_info)
let make_vocabulary_filter_info
  ?last_modified_time:(last_modified_time_ : date_time option)
  ?language_code:(language_code_ : language_code option)
  ?vocabulary_filter_name:(vocabulary_filter_name_ :
                            vocabulary_filter_name option)
  () =
  ({
     last_modified_time = last_modified_time_;
     language_code = language_code_;
     vocabulary_filter_name = vocabulary_filter_name_
   } : vocabulary_filter_info)
let make_update_vocabulary_response
  ?vocabulary_state:(vocabulary_state_ : vocabulary_state option)
  ?last_modified_time:(last_modified_time_ : date_time option)
  ?language_code:(language_code_ : language_code option)
  ?vocabulary_name:(vocabulary_name_ : vocabulary_name option) () =
  ({
     vocabulary_state = vocabulary_state_;
     last_modified_time = last_modified_time_;
     language_code = language_code_;
     vocabulary_name = vocabulary_name_
   } : update_vocabulary_response)
let make_update_vocabulary_request
  ?data_access_role_arn:(data_access_role_arn_ : data_access_role_arn option)
  ?vocabulary_file_uri:(vocabulary_file_uri_ : uri option)
  ?phrases:(phrases_ : phrases option)
  ~language_code:(language_code_ : language_code)
  ~vocabulary_name:(vocabulary_name_ : vocabulary_name) () =
  ({
     data_access_role_arn = data_access_role_arn_;
     vocabulary_file_uri = vocabulary_file_uri_;
     phrases = phrases_;
     language_code = language_code_;
     vocabulary_name = vocabulary_name_
   } : update_vocabulary_request)
let make_update_vocabulary_filter_response
  ?last_modified_time:(last_modified_time_ : date_time option)
  ?language_code:(language_code_ : language_code option)
  ?vocabulary_filter_name:(vocabulary_filter_name_ :
                            vocabulary_filter_name option)
  () =
  ({
     last_modified_time = last_modified_time_;
     language_code = language_code_;
     vocabulary_filter_name = vocabulary_filter_name_
   } : update_vocabulary_filter_response)
let make_update_vocabulary_filter_request
  ?data_access_role_arn:(data_access_role_arn_ : data_access_role_arn option)
  ?vocabulary_filter_file_uri:(vocabulary_filter_file_uri_ : uri option)
  ?words:(words_ : words option)
  ~vocabulary_filter_name:(vocabulary_filter_name_ : vocabulary_filter_name)
  () =
  ({
     data_access_role_arn = data_access_role_arn_;
     vocabulary_filter_file_uri = vocabulary_filter_file_uri_;
     words = words_;
     vocabulary_filter_name = vocabulary_filter_name_
   } : update_vocabulary_filter_request)
let make_update_medical_vocabulary_response
  ?vocabulary_state:(vocabulary_state_ : vocabulary_state option)
  ?last_modified_time:(last_modified_time_ : date_time option)
  ?language_code:(language_code_ : language_code option)
  ?vocabulary_name:(vocabulary_name_ : vocabulary_name option) () =
  ({
     vocabulary_state = vocabulary_state_;
     last_modified_time = last_modified_time_;
     language_code = language_code_;
     vocabulary_name = vocabulary_name_
   } : update_medical_vocabulary_response)
let make_update_medical_vocabulary_request
  ~vocabulary_file_uri:(vocabulary_file_uri_ : uri)
  ~language_code:(language_code_ : language_code)
  ~vocabulary_name:(vocabulary_name_ : vocabulary_name) () =
  ({
     vocabulary_file_uri = vocabulary_file_uri_;
     language_code = language_code_;
     vocabulary_name = vocabulary_name_
   } : update_medical_vocabulary_request)
let make_absolute_time_range ?last:(last_ : timestamp_milliseconds option)
  ?first:(first_ : timestamp_milliseconds option)
  ?end_time:(end_time_ : timestamp_milliseconds option)
  ?start_time:(start_time_ : timestamp_milliseconds option) () =
  ({
     last = last_;
     first = first_;
     end_time = end_time_;
     start_time = start_time_
   } : absolute_time_range)
let make_relative_time_range ?last:(last_ : percentage option)
  ?first:(first_ : percentage option)
  ?end_percentage:(end_percentage_ : percentage option)
  ?start_percentage:(start_percentage_ : percentage option) () =
  ({
     last = last_;
     first = first_;
     end_percentage = end_percentage_;
     start_percentage = start_percentage_
   } : relative_time_range)
let make_non_talk_time_filter ?negate:(negate_ : boolean_ option)
  ?relative_time_range:(relative_time_range_ : relative_time_range option)
  ?absolute_time_range:(absolute_time_range_ : absolute_time_range option)
  ?threshold:(threshold_ : timestamp_milliseconds option) () =
  ({
     negate = negate_;
     relative_time_range = relative_time_range_;
     absolute_time_range = absolute_time_range_;
     threshold = threshold_
   } : non_talk_time_filter)
let make_interruption_filter ?negate:(negate_ : boolean_ option)
  ?relative_time_range:(relative_time_range_ : relative_time_range option)
  ?absolute_time_range:(absolute_time_range_ : absolute_time_range option)
  ?participant_role:(participant_role_ : participant_role option)
  ?threshold:(threshold_ : timestamp_milliseconds option) () =
  ({
     negate = negate_;
     relative_time_range = relative_time_range_;
     absolute_time_range = absolute_time_range_;
     participant_role = participant_role_;
     threshold = threshold_
   } : interruption_filter)
let make_transcript_filter ?negate:(negate_ : boolean_ option)
  ?participant_role:(participant_role_ : participant_role option)
  ?relative_time_range:(relative_time_range_ : relative_time_range option)
  ?absolute_time_range:(absolute_time_range_ : absolute_time_range option)
  ~targets:(targets_ : string_target_list)
  ~transcript_filter_type:(transcript_filter_type_ : transcript_filter_type)
  () =
  ({
     targets = targets_;
     negate = negate_;
     participant_role = participant_role_;
     relative_time_range = relative_time_range_;
     absolute_time_range = absolute_time_range_;
     transcript_filter_type = transcript_filter_type_
   } : transcript_filter)
let make_sentiment_filter ?negate:(negate_ : boolean_ option)
  ?participant_role:(participant_role_ : participant_role option)
  ?relative_time_range:(relative_time_range_ : relative_time_range option)
  ?absolute_time_range:(absolute_time_range_ : absolute_time_range option)
  ~sentiments:(sentiments_ : sentiment_value_list) () =
  ({
     negate = negate_;
     participant_role = participant_role_;
     relative_time_range = relative_time_range_;
     absolute_time_range = absolute_time_range_;
     sentiments = sentiments_
   } : sentiment_filter)
let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)
let make_category_properties ?input_type:(input_type_ : input_type option)
  ?tags:(tags_ : tag_list option)
  ?last_update_time:(last_update_time_ : date_time option)
  ?create_time:(create_time_ : date_time option)
  ?rules:(rules_ : rule_list option)
  ?category_name:(category_name_ : category_name option) () =
  ({
     input_type = input_type_;
     tags = tags_;
     last_update_time = last_update_time_;
     create_time = create_time_;
     rules = rules_;
     category_name = category_name_
   } : category_properties)
let make_update_call_analytics_category_response
  ?category_properties:(category_properties_ : category_properties option) ()
  =
  ({ category_properties = category_properties_ } : update_call_analytics_category_response)
let make_update_call_analytics_category_request
  ?input_type:(input_type_ : input_type option) ~rules:(rules_ : rule_list)
  ~category_name:(category_name_ : category_name) () =
  ({ input_type = input_type_; rules = rules_; category_name = category_name_
   } : update_call_analytics_category_request)
let make_untag_resource_response () = (() : unit)
let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
  ~resource_arn:(resource_arn_ : transcribe_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)
let make_content_redaction
  ?pii_entity_types:(pii_entity_types_ : pii_entity_types option)
  ~redaction_output:(redaction_output_ : redaction_output)
  ~redaction_type:(redaction_type_ : redaction_type) () =
  ({
     pii_entity_types = pii_entity_types_;
     redaction_output = redaction_output_;
     redaction_type = redaction_type_
   } : content_redaction)
let make_model_settings
  ?language_model_name:(language_model_name_ : model_name option) () =
  ({ language_model_name = language_model_name_ } : model_settings)
let make_language_code_item
  ?duration_in_seconds:(duration_in_seconds_ : duration_in_seconds option)
  ?language_code:(language_code_ : language_code option) () =
  ({
     duration_in_seconds = duration_in_seconds_;
     language_code = language_code_
   } : language_code_item)
let make_toxicity_detection_settings
  ~toxicity_categories:(toxicity_categories_ : toxicity_categories) () =
  ({ toxicity_categories = toxicity_categories_ } : toxicity_detection_settings)
let make_transcription_job_summary
  ?toxicity_detection:(toxicity_detection_ : toxicity_detection option)
  ?language_codes:(language_codes_ : language_code_list option)
  ?identified_language_score:(identified_language_score_ :
                               identified_language_score option)
  ?identify_multiple_languages:(identify_multiple_languages_ :
                                 boolean_ option)
  ?identify_language:(identify_language_ : boolean_ option)
  ?model_settings:(model_settings_ : model_settings option)
  ?content_redaction:(content_redaction_ : content_redaction option)
  ?output_location_type:(output_location_type_ : output_location_type option)
  ?failure_reason:(failure_reason_ : failure_reason option)
  ?transcription_job_status:(transcription_job_status_ :
                              transcription_job_status option)
  ?language_code:(language_code_ : language_code option)
  ?completion_time:(completion_time_ : date_time option)
  ?start_time:(start_time_ : date_time option)
  ?creation_time:(creation_time_ : date_time option)
  ?transcription_job_name:(transcription_job_name_ :
                            transcription_job_name option)
  () =
  ({
     toxicity_detection = toxicity_detection_;
     language_codes = language_codes_;
     identified_language_score = identified_language_score_;
     identify_multiple_languages = identify_multiple_languages_;
     identify_language = identify_language_;
     model_settings = model_settings_;
     content_redaction = content_redaction_;
     output_location_type = output_location_type_;
     failure_reason = failure_reason_;
     transcription_job_status = transcription_job_status_;
     language_code = language_code_;
     completion_time = completion_time_;
     start_time = start_time_;
     creation_time = creation_time_;
     transcription_job_name = transcription_job_name_
   } : transcription_job_summary)
let make_media
  ?redacted_media_file_uri:(redacted_media_file_uri_ : uri option)
  ?media_file_uri:(media_file_uri_ : uri option) () =
  ({
     redacted_media_file_uri = redacted_media_file_uri_;
     media_file_uri = media_file_uri_
   } : media)
let make_transcript
  ?redacted_transcript_file_uri:(redacted_transcript_file_uri_ : uri option)
  ?transcript_file_uri:(transcript_file_uri_ : uri option) () =
  ({
     redacted_transcript_file_uri = redacted_transcript_file_uri_;
     transcript_file_uri = transcript_file_uri_
   } : transcript)
let make_settings
  ?vocabulary_filter_method:(vocabulary_filter_method_ :
                              vocabulary_filter_method option)
  ?vocabulary_filter_name:(vocabulary_filter_name_ :
                            vocabulary_filter_name option)
  ?max_alternatives:(max_alternatives_ : max_alternatives option)
  ?show_alternatives:(show_alternatives_ : boolean_ option)
  ?channel_identification:(channel_identification_ : boolean_ option)
  ?max_speaker_labels:(max_speaker_labels_ : max_speakers option)
  ?show_speaker_labels:(show_speaker_labels_ : boolean_ option)
  ?vocabulary_name:(vocabulary_name_ : vocabulary_name option) () =
  ({
     vocabulary_filter_method = vocabulary_filter_method_;
     vocabulary_filter_name = vocabulary_filter_name_;
     max_alternatives = max_alternatives_;
     show_alternatives = show_alternatives_;
     channel_identification = channel_identification_;
     max_speaker_labels = max_speaker_labels_;
     show_speaker_labels = show_speaker_labels_;
     vocabulary_name = vocabulary_name_
   } : settings)
let make_job_execution_settings
  ?data_access_role_arn:(data_access_role_arn_ : data_access_role_arn option)
  ?allow_deferred_execution:(allow_deferred_execution_ : boolean_ option) ()
  =
  ({
     data_access_role_arn = data_access_role_arn_;
     allow_deferred_execution = allow_deferred_execution_
   } : job_execution_settings)
let make_subtitles_output
  ?output_start_index:(output_start_index_ :
                        subtitle_output_start_index option)
  ?subtitle_file_uris:(subtitle_file_uris_ : subtitle_file_uris option)
  ?formats:(formats_ : subtitle_formats option) () =
  ({
     output_start_index = output_start_index_;
     subtitle_file_uris = subtitle_file_uris_;
     formats = formats_
   } : subtitles_output)
let make_language_id_settings
  ?language_model_name:(language_model_name_ : model_name option)
  ?vocabulary_filter_name:(vocabulary_filter_name_ :
                            vocabulary_filter_name option)
  ?vocabulary_name:(vocabulary_name_ : vocabulary_name option) () =
  ({
     language_model_name = language_model_name_;
     vocabulary_filter_name = vocabulary_filter_name_;
     vocabulary_name = vocabulary_name_
   } : language_id_settings)
let make_transcription_job
  ?toxicity_detection:(toxicity_detection_ : toxicity_detection option)
  ?language_id_settings:(language_id_settings_ :
                          language_id_settings_map option)
  ?subtitles:(subtitles_ : subtitles_output option)
  ?tags:(tags_ : tag_list option)
  ?language_codes:(language_codes_ : language_code_list option)
  ?identified_language_score:(identified_language_score_ :
                               identified_language_score option)
  ?language_options:(language_options_ : language_options option)
  ?identify_multiple_languages:(identify_multiple_languages_ :
                                 boolean_ option)
  ?identify_language:(identify_language_ : boolean_ option)
  ?content_redaction:(content_redaction_ : content_redaction option)
  ?job_execution_settings:(job_execution_settings_ :
                            job_execution_settings option)
  ?model_settings:(model_settings_ : model_settings option)
  ?settings:(settings_ : settings option)
  ?failure_reason:(failure_reason_ : failure_reason option)
  ?completion_time:(completion_time_ : date_time option)
  ?creation_time:(creation_time_ : date_time option)
  ?start_time:(start_time_ : date_time option)
  ?transcript:(transcript_ : transcript option)
  ?media:(media_ : media option)
  ?media_format:(media_format_ : media_format option)
  ?media_sample_rate_hertz:(media_sample_rate_hertz_ :
                             media_sample_rate_hertz option)
  ?language_code:(language_code_ : language_code option)
  ?transcription_job_status:(transcription_job_status_ :
                              transcription_job_status option)
  ?transcription_job_name:(transcription_job_name_ :
                            transcription_job_name option)
  () =
  ({
     toxicity_detection = toxicity_detection_;
     language_id_settings = language_id_settings_;
     subtitles = subtitles_;
     tags = tags_;
     language_codes = language_codes_;
     identified_language_score = identified_language_score_;
     language_options = language_options_;
     identify_multiple_languages = identify_multiple_languages_;
     identify_language = identify_language_;
     content_redaction = content_redaction_;
     job_execution_settings = job_execution_settings_;
     model_settings = model_settings_;
     settings = settings_;
     failure_reason = failure_reason_;
     completion_time = completion_time_;
     creation_time = creation_time_;
     start_time = start_time_;
     transcript = transcript_;
     media = media_;
     media_format = media_format_;
     media_sample_rate_hertz = media_sample_rate_hertz_;
     language_code = language_code_;
     transcription_job_status = transcription_job_status_;
     transcription_job_name = transcription_job_name_
   } : transcription_job)
let make_tag_resource_response () = (() : unit)
let make_tag_resource_request ~tags:(tags_ : tag_list)
  ~resource_arn:(resource_arn_ : transcribe_arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)
let make_start_transcription_job_response
  ?transcription_job:(transcription_job_ : transcription_job option) () =
  ({ transcription_job = transcription_job_ } : start_transcription_job_response)
let make_subtitles
  ?output_start_index:(output_start_index_ :
                        subtitle_output_start_index option)
  ?formats:(formats_ : subtitle_formats option) () =
  ({ output_start_index = output_start_index_; formats = formats_ } : 
  subtitles)
let make_start_transcription_job_request
  ?toxicity_detection:(toxicity_detection_ : toxicity_detection option)
  ?language_id_settings:(language_id_settings_ :
                          language_id_settings_map option)
  ?tags:(tags_ : tag_list option) ?subtitles:(subtitles_ : subtitles option)
  ?language_options:(language_options_ : language_options option)
  ?identify_multiple_languages:(identify_multiple_languages_ :
                                 boolean_ option)
  ?identify_language:(identify_language_ : boolean_ option)
  ?content_redaction:(content_redaction_ : content_redaction option)
  ?job_execution_settings:(job_execution_settings_ :
                            job_execution_settings option)
  ?model_settings:(model_settings_ : model_settings option)
  ?settings:(settings_ : settings option)
  ?kms_encryption_context:(kms_encryption_context_ :
                            kms_encryption_context_map option)
  ?output_encryption_kms_key_id:(output_encryption_kms_key_id_ :
                                  kms_key_id option)
  ?output_key:(output_key_ : output_key option)
  ?output_bucket_name:(output_bucket_name_ : output_bucket_name option)
  ?media_format:(media_format_ : media_format option)
  ?media_sample_rate_hertz:(media_sample_rate_hertz_ :
                             media_sample_rate_hertz option)
  ?language_code:(language_code_ : language_code option)
  ~media:(media_ : media)
  ~transcription_job_name:(transcription_job_name_ : transcription_job_name)
  () =
  ({
     toxicity_detection = toxicity_detection_;
     language_id_settings = language_id_settings_;
     tags = tags_;
     subtitles = subtitles_;
     language_options = language_options_;
     identify_multiple_languages = identify_multiple_languages_;
     identify_language = identify_language_;
     content_redaction = content_redaction_;
     job_execution_settings = job_execution_settings_;
     model_settings = model_settings_;
     settings = settings_;
     kms_encryption_context = kms_encryption_context_;
     output_encryption_kms_key_id = output_encryption_kms_key_id_;
     output_key = output_key_;
     output_bucket_name = output_bucket_name_;
     media = media_;
     media_format = media_format_;
     media_sample_rate_hertz = media_sample_rate_hertz_;
     language_code = language_code_;
     transcription_job_name = transcription_job_name_
   } : start_transcription_job_request)
let make_medical_transcript
  ?transcript_file_uri:(transcript_file_uri_ : uri option) () =
  ({ transcript_file_uri = transcript_file_uri_ } : medical_transcript)
let make_medical_transcription_setting
  ?vocabulary_name:(vocabulary_name_ : vocabulary_name option)
  ?max_alternatives:(max_alternatives_ : max_alternatives option)
  ?show_alternatives:(show_alternatives_ : boolean_ option)
  ?channel_identification:(channel_identification_ : boolean_ option)
  ?max_speaker_labels:(max_speaker_labels_ : max_speakers option)
  ?show_speaker_labels:(show_speaker_labels_ : boolean_ option) () =
  ({
     vocabulary_name = vocabulary_name_;
     max_alternatives = max_alternatives_;
     show_alternatives = show_alternatives_;
     channel_identification = channel_identification_;
     max_speaker_labels = max_speaker_labels_;
     show_speaker_labels = show_speaker_labels_
   } : medical_transcription_setting)
let make_medical_transcription_job ?tags:(tags_ : tag_list option)
  ?type_:(type__ : type_ option) ?specialty:(specialty_ : specialty option)
  ?content_identification_type:(content_identification_type_ :
                                 medical_content_identification_type option)
  ?settings:(settings_ : medical_transcription_setting option)
  ?failure_reason:(failure_reason_ : failure_reason option)
  ?completion_time:(completion_time_ : date_time option)
  ?creation_time:(creation_time_ : date_time option)
  ?start_time:(start_time_ : date_time option)
  ?transcript:(transcript_ : medical_transcript option)
  ?media:(media_ : media option)
  ?media_format:(media_format_ : media_format option)
  ?media_sample_rate_hertz:(media_sample_rate_hertz_ :
                             medical_media_sample_rate_hertz option)
  ?language_code:(language_code_ : language_code option)
  ?transcription_job_status:(transcription_job_status_ :
                              transcription_job_status option)
  ?medical_transcription_job_name:(medical_transcription_job_name_ :
                                    transcription_job_name option)
  () =
  ({
     tags = tags_;
     type_ = type__;
     specialty = specialty_;
     content_identification_type = content_identification_type_;
     settings = settings_;
     failure_reason = failure_reason_;
     completion_time = completion_time_;
     creation_time = creation_time_;
     start_time = start_time_;
     transcript = transcript_;
     media = media_;
     media_format = media_format_;
     media_sample_rate_hertz = media_sample_rate_hertz_;
     language_code = language_code_;
     transcription_job_status = transcription_job_status_;
     medical_transcription_job_name = medical_transcription_job_name_
   } : medical_transcription_job)
let make_start_medical_transcription_job_response
  ?medical_transcription_job:(medical_transcription_job_ :
                               medical_transcription_job option)
  () =
  ({ medical_transcription_job = medical_transcription_job_ } : start_medical_transcription_job_response)
let make_start_medical_transcription_job_request
  ?tags:(tags_ : tag_list option)
  ?content_identification_type:(content_identification_type_ :
                                 medical_content_identification_type option)
  ?settings:(settings_ : medical_transcription_setting option)
  ?kms_encryption_context:(kms_encryption_context_ :
                            kms_encryption_context_map option)
  ?output_encryption_kms_key_id:(output_encryption_kms_key_id_ :
                                  kms_key_id option)
  ?output_key:(output_key_ : output_key option)
  ?media_format:(media_format_ : media_format option)
  ?media_sample_rate_hertz:(media_sample_rate_hertz_ :
                             medical_media_sample_rate_hertz option)
  ~type_:(type__ : type_) ~specialty:(specialty_ : specialty)
  ~output_bucket_name:(output_bucket_name_ : output_bucket_name)
  ~media:(media_ : media) ~language_code:(language_code_ : language_code)
  ~medical_transcription_job_name:(medical_transcription_job_name_ :
                                    transcription_job_name)
  () =
  ({
     tags = tags_;
     type_ = type__;
     specialty = specialty_;
     content_identification_type = content_identification_type_;
     settings = settings_;
     kms_encryption_context = kms_encryption_context_;
     output_encryption_kms_key_id = output_encryption_kms_key_id_;
     output_key = output_key_;
     output_bucket_name = output_bucket_name_;
     media = media_;
     media_format = media_format_;
     media_sample_rate_hertz = media_sample_rate_hertz_;
     language_code = language_code_;
     medical_transcription_job_name = medical_transcription_job_name_
   } : start_medical_transcription_job_request)
let make_medical_scribe_output
  ~clinical_document_uri:(clinical_document_uri_ : uri)
  ~transcript_file_uri:(transcript_file_uri_ : uri) () =
  ({
     clinical_document_uri = clinical_document_uri_;
     transcript_file_uri = transcript_file_uri_
   } : medical_scribe_output)
let make_clinical_note_generation_settings
  ?note_template:(note_template_ : medical_scribe_note_template option) () =
  ({ note_template = note_template_ } : clinical_note_generation_settings)
let make_medical_scribe_settings
  ?clinical_note_generation_settings:(clinical_note_generation_settings_ :
                                       clinical_note_generation_settings
                                         option)
  ?vocabulary_filter_method:(vocabulary_filter_method_ :
                              vocabulary_filter_method option)
  ?vocabulary_filter_name:(vocabulary_filter_name_ :
                            vocabulary_filter_name option)
  ?vocabulary_name:(vocabulary_name_ : vocabulary_name option)
  ?channel_identification:(channel_identification_ : boolean_ option)
  ?max_speaker_labels:(max_speaker_labels_ : max_speakers option)
  ?show_speaker_labels:(show_speaker_labels_ : boolean_ option) () =
  ({
     clinical_note_generation_settings = clinical_note_generation_settings_;
     vocabulary_filter_method = vocabulary_filter_method_;
     vocabulary_filter_name = vocabulary_filter_name_;
     vocabulary_name = vocabulary_name_;
     channel_identification = channel_identification_;
     max_speaker_labels = max_speaker_labels_;
     show_speaker_labels = show_speaker_labels_
   } : medical_scribe_settings)
let make_medical_scribe_channel_definition
  ~participant_role:(participant_role_ : medical_scribe_participant_role)
  ~channel_id:(channel_id_ : medical_scribe_channel_id) () =
  ({ participant_role = participant_role_; channel_id = channel_id_ } : 
  medical_scribe_channel_definition)
let make_medical_scribe_job ?tags:(tags_ : tag_list option)
  ?channel_definitions:(channel_definitions_ :
                         medical_scribe_channel_definitions option)
  ?data_access_role_arn:(data_access_role_arn_ : data_access_role_arn option)
  ?settings:(settings_ : medical_scribe_settings option)
  ?failure_reason:(failure_reason_ : failure_reason option)
  ?completion_time:(completion_time_ : date_time option)
  ?creation_time:(creation_time_ : date_time option)
  ?start_time:(start_time_ : date_time option)
  ?medical_scribe_output:(medical_scribe_output_ :
                           medical_scribe_output option)
  ?media:(media_ : media option)
  ?language_code:(language_code_ : medical_scribe_language_code option)
  ?medical_scribe_job_status:(medical_scribe_job_status_ :
                               medical_scribe_job_status option)
  ?medical_scribe_job_name:(medical_scribe_job_name_ :
                             transcription_job_name option)
  () =
  ({
     tags = tags_;
     channel_definitions = channel_definitions_;
     data_access_role_arn = data_access_role_arn_;
     settings = settings_;
     failure_reason = failure_reason_;
     completion_time = completion_time_;
     creation_time = creation_time_;
     start_time = start_time_;
     medical_scribe_output = medical_scribe_output_;
     media = media_;
     language_code = language_code_;
     medical_scribe_job_status = medical_scribe_job_status_;
     medical_scribe_job_name = medical_scribe_job_name_
   } : medical_scribe_job)
let make_start_medical_scribe_job_response
  ?medical_scribe_job:(medical_scribe_job_ : medical_scribe_job option) () =
  ({ medical_scribe_job = medical_scribe_job_ } : start_medical_scribe_job_response)
let make_start_medical_scribe_job_request ?tags:(tags_ : tag_list option)
  ?channel_definitions:(channel_definitions_ :
                         medical_scribe_channel_definitions option)
  ?kms_encryption_context:(kms_encryption_context_ :
                            kms_encryption_context_map option)
  ?output_encryption_kms_key_id:(output_encryption_kms_key_id_ :
                                  kms_key_id option)
  ~settings:(settings_ : medical_scribe_settings)
  ~data_access_role_arn:(data_access_role_arn_ : data_access_role_arn)
  ~output_bucket_name:(output_bucket_name_ : output_bucket_name)
  ~media:(media_ : media)
  ~medical_scribe_job_name:(medical_scribe_job_name_ :
                             transcription_job_name)
  () =
  ({
     tags = tags_;
     channel_definitions = channel_definitions_;
     settings = settings_;
     data_access_role_arn = data_access_role_arn_;
     kms_encryption_context = kms_encryption_context_;
     output_encryption_kms_key_id = output_encryption_kms_key_id_;
     output_bucket_name = output_bucket_name_;
     media = media_;
     medical_scribe_job_name = medical_scribe_job_name_
   } : start_medical_scribe_job_request)
let make_call_analytics_skipped_feature ?message:(message_ : string_ option)
  ?reason_code:(reason_code_ : call_analytics_skipped_reason_code option)
  ?feature:(feature_ : call_analytics_feature option) () =
  ({ message = message_; reason_code = reason_code_; feature = feature_ } : 
  call_analytics_skipped_feature)
let make_call_analytics_job_details
  ?skipped:(skipped_ : call_analytics_skipped_feature_list option) () =
  ({ skipped = skipped_ } : call_analytics_job_details)
let make_summarization
  ~generate_abstractive_summary:(generate_abstractive_summary_ : boolean_) ()
  =
  ({ generate_abstractive_summary = generate_abstractive_summary_ } : 
  summarization)
let make_call_analytics_job_settings
  ?summarization:(summarization_ : summarization option)
  ?language_id_settings:(language_id_settings_ :
                          language_id_settings_map option)
  ?language_options:(language_options_ : language_options option)
  ?content_redaction:(content_redaction_ : content_redaction option)
  ?language_model_name:(language_model_name_ : model_name option)
  ?vocabulary_filter_method:(vocabulary_filter_method_ :
                              vocabulary_filter_method option)
  ?vocabulary_filter_name:(vocabulary_filter_name_ :
                            vocabulary_filter_name option)
  ?vocabulary_name:(vocabulary_name_ : vocabulary_name option) () =
  ({
     summarization = summarization_;
     language_id_settings = language_id_settings_;
     language_options = language_options_;
     content_redaction = content_redaction_;
     language_model_name = language_model_name_;
     vocabulary_filter_method = vocabulary_filter_method_;
     vocabulary_filter_name = vocabulary_filter_name_;
     vocabulary_name = vocabulary_name_
   } : call_analytics_job_settings)
let make_channel_definition
  ?participant_role:(participant_role_ : participant_role option)
  ?channel_id:(channel_id_ : channel_id option) () =
  ({ participant_role = participant_role_; channel_id = channel_id_ } : 
  channel_definition)
let make_call_analytics_job ?tags:(tags_ : tag_list option)
  ?channel_definitions:(channel_definitions_ : channel_definitions option)
  ?settings:(settings_ : call_analytics_job_settings option)
  ?identified_language_score:(identified_language_score_ :
                               identified_language_score option)
  ?data_access_role_arn:(data_access_role_arn_ : data_access_role_arn option)
  ?failure_reason:(failure_reason_ : failure_reason option)
  ?completion_time:(completion_time_ : date_time option)
  ?creation_time:(creation_time_ : date_time option)
  ?start_time:(start_time_ : date_time option)
  ?transcript:(transcript_ : transcript option)
  ?media:(media_ : media option)
  ?media_format:(media_format_ : media_format option)
  ?media_sample_rate_hertz:(media_sample_rate_hertz_ :
                             media_sample_rate_hertz option)
  ?language_code:(language_code_ : language_code option)
  ?call_analytics_job_details:(call_analytics_job_details_ :
                                call_analytics_job_details option)
  ?call_analytics_job_status:(call_analytics_job_status_ :
                               call_analytics_job_status option)
  ?call_analytics_job_name:(call_analytics_job_name_ :
                             call_analytics_job_name option)
  () =
  ({
     tags = tags_;
     channel_definitions = channel_definitions_;
     settings = settings_;
     identified_language_score = identified_language_score_;
     data_access_role_arn = data_access_role_arn_;
     failure_reason = failure_reason_;
     completion_time = completion_time_;
     creation_time = creation_time_;
     start_time = start_time_;
     transcript = transcript_;
     media = media_;
     media_format = media_format_;
     media_sample_rate_hertz = media_sample_rate_hertz_;
     language_code = language_code_;
     call_analytics_job_details = call_analytics_job_details_;
     call_analytics_job_status = call_analytics_job_status_;
     call_analytics_job_name = call_analytics_job_name_
   } : call_analytics_job)
let make_start_call_analytics_job_response
  ?call_analytics_job:(call_analytics_job_ : call_analytics_job option) () =
  ({ call_analytics_job = call_analytics_job_ } : start_call_analytics_job_response)
let make_start_call_analytics_job_request
  ?channel_definitions:(channel_definitions_ : channel_definitions option)
  ?tags:(tags_ : tag_list option)
  ?settings:(settings_ : call_analytics_job_settings option)
  ?data_access_role_arn:(data_access_role_arn_ : data_access_role_arn option)
  ?output_encryption_kms_key_id:(output_encryption_kms_key_id_ :
                                  kms_key_id option)
  ?output_location:(output_location_ : uri option) ~media:(media_ : media)
  ~call_analytics_job_name:(call_analytics_job_name_ :
                             call_analytics_job_name)
  () =
  ({
     channel_definitions = channel_definitions_;
     tags = tags_;
     settings = settings_;
     data_access_role_arn = data_access_role_arn_;
     output_encryption_kms_key_id = output_encryption_kms_key_id_;
     output_location = output_location_;
     media = media_;
     call_analytics_job_name = call_analytics_job_name_
   } : start_call_analytics_job_request)
let make_list_vocabulary_filters_response
  ?vocabulary_filters:(vocabulary_filters_ : vocabulary_filters option)
  ?next_token:(next_token_ : next_token option) () =
  ({ vocabulary_filters = vocabulary_filters_; next_token = next_token_ } : 
  list_vocabulary_filters_response)
let make_list_vocabulary_filters_request
  ?name_contains:(name_contains_ : vocabulary_filter_name option)
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option) () =
  ({
     name_contains = name_contains_;
     max_results = max_results_;
     next_token = next_token_
   } : list_vocabulary_filters_request)
let make_list_vocabularies_response
  ?vocabularies:(vocabularies_ : vocabularies option)
  ?next_token:(next_token_ : next_token option)
  ?status:(status_ : vocabulary_state option) () =
  ({ vocabularies = vocabularies_; next_token = next_token_; status = status_
   } : list_vocabularies_response)
let make_list_vocabularies_request
  ?name_contains:(name_contains_ : vocabulary_name option)
  ?state_equals:(state_equals_ : vocabulary_state option)
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option) () =
  ({
     name_contains = name_contains_;
     state_equals = state_equals_;
     max_results = max_results_;
     next_token = next_token_
   } : list_vocabularies_request)
let make_list_transcription_jobs_response
  ?transcription_job_summaries:(transcription_job_summaries_ :
                                 transcription_job_summaries option)
  ?next_token:(next_token_ : next_token option)
  ?status:(status_ : transcription_job_status option) () =
  ({
     transcription_job_summaries = transcription_job_summaries_;
     next_token = next_token_;
     status = status_
   } : list_transcription_jobs_response)
let make_list_transcription_jobs_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ?job_name_contains:(job_name_contains_ : transcription_job_name option)
  ?status:(status_ : transcription_job_status option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     job_name_contains = job_name_contains_;
     status = status_
   } : list_transcription_jobs_request)
let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option)
  ?resource_arn:(resource_arn_ : transcribe_arn option) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : list_tags_for_resource_response)
let make_list_tags_for_resource_request
  ~resource_arn:(resource_arn_ : transcribe_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)
let make_list_medical_vocabularies_response
  ?vocabularies:(vocabularies_ : vocabularies option)
  ?next_token:(next_token_ : next_token option)
  ?status:(status_ : vocabulary_state option) () =
  ({ vocabularies = vocabularies_; next_token = next_token_; status = status_
   } : list_medical_vocabularies_response)
let make_list_medical_vocabularies_request
  ?name_contains:(name_contains_ : vocabulary_name option)
  ?state_equals:(state_equals_ : vocabulary_state option)
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option) () =
  ({
     name_contains = name_contains_;
     state_equals = state_equals_;
     max_results = max_results_;
     next_token = next_token_
   } : list_medical_vocabularies_request)
let make_medical_transcription_job_summary ?type_:(type__ : type_ option)
  ?content_identification_type:(content_identification_type_ :
                                 medical_content_identification_type option)
  ?specialty:(specialty_ : specialty option)
  ?output_location_type:(output_location_type_ : output_location_type option)
  ?failure_reason:(failure_reason_ : failure_reason option)
  ?transcription_job_status:(transcription_job_status_ :
                              transcription_job_status option)
  ?language_code:(language_code_ : language_code option)
  ?completion_time:(completion_time_ : date_time option)
  ?start_time:(start_time_ : date_time option)
  ?creation_time:(creation_time_ : date_time option)
  ?medical_transcription_job_name:(medical_transcription_job_name_ :
                                    transcription_job_name option)
  () =
  ({
     type_ = type__;
     content_identification_type = content_identification_type_;
     specialty = specialty_;
     output_location_type = output_location_type_;
     failure_reason = failure_reason_;
     transcription_job_status = transcription_job_status_;
     language_code = language_code_;
     completion_time = completion_time_;
     start_time = start_time_;
     creation_time = creation_time_;
     medical_transcription_job_name = medical_transcription_job_name_
   } : medical_transcription_job_summary)
let make_list_medical_transcription_jobs_response
  ?medical_transcription_job_summaries:(medical_transcription_job_summaries_
                                         :
                                         medical_transcription_job_summaries
                                           option)
  ?next_token:(next_token_ : next_token option)
  ?status:(status_ : transcription_job_status option) () =
  ({
     medical_transcription_job_summaries =
       medical_transcription_job_summaries_;
     next_token = next_token_;
     status = status_
   } : list_medical_transcription_jobs_response)
let make_list_medical_transcription_jobs_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ?job_name_contains:(job_name_contains_ : transcription_job_name option)
  ?status:(status_ : transcription_job_status option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     job_name_contains = job_name_contains_;
     status = status_
   } : list_medical_transcription_jobs_request)
let make_medical_scribe_job_summary
  ?failure_reason:(failure_reason_ : failure_reason option)
  ?medical_scribe_job_status:(medical_scribe_job_status_ :
                               medical_scribe_job_status option)
  ?language_code:(language_code_ : medical_scribe_language_code option)
  ?completion_time:(completion_time_ : date_time option)
  ?start_time:(start_time_ : date_time option)
  ?creation_time:(creation_time_ : date_time option)
  ?medical_scribe_job_name:(medical_scribe_job_name_ :
                             transcription_job_name option)
  () =
  ({
     failure_reason = failure_reason_;
     medical_scribe_job_status = medical_scribe_job_status_;
     language_code = language_code_;
     completion_time = completion_time_;
     start_time = start_time_;
     creation_time = creation_time_;
     medical_scribe_job_name = medical_scribe_job_name_
   } : medical_scribe_job_summary)
let make_list_medical_scribe_jobs_response
  ?medical_scribe_job_summaries:(medical_scribe_job_summaries_ :
                                  medical_scribe_job_summaries option)
  ?next_token:(next_token_ : next_token option)
  ?status:(status_ : medical_scribe_job_status option) () =
  ({
     medical_scribe_job_summaries = medical_scribe_job_summaries_;
     next_token = next_token_;
     status = status_
   } : list_medical_scribe_jobs_response)
let make_list_medical_scribe_jobs_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ?job_name_contains:(job_name_contains_ : transcription_job_name option)
  ?status:(status_ : medical_scribe_job_status option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     job_name_contains = job_name_contains_;
     status = status_
   } : list_medical_scribe_jobs_request)
let make_input_data_config
  ?tuning_data_s3_uri:(tuning_data_s3_uri_ : uri option)
  ~data_access_role_arn:(data_access_role_arn_ : data_access_role_arn)
  ~s3_uri:(s3_uri_ : uri) () =
  ({
     data_access_role_arn = data_access_role_arn_;
     tuning_data_s3_uri = tuning_data_s3_uri_;
     s3_uri = s3_uri_
   } : input_data_config)
let make_language_model
  ?input_data_config:(input_data_config_ : input_data_config option)
  ?failure_reason:(failure_reason_ : failure_reason option)
  ?upgrade_availability:(upgrade_availability_ : boolean_ option)
  ?model_status:(model_status_ : model_status option)
  ?base_model_name:(base_model_name_ : base_model_name option)
  ?language_code:(language_code_ : clm_language_code option)
  ?last_modified_time:(last_modified_time_ : date_time option)
  ?create_time:(create_time_ : date_time option)
  ?model_name:(model_name_ : model_name option) () =
  ({
     input_data_config = input_data_config_;
     failure_reason = failure_reason_;
     upgrade_availability = upgrade_availability_;
     model_status = model_status_;
     base_model_name = base_model_name_;
     language_code = language_code_;
     last_modified_time = last_modified_time_;
     create_time = create_time_;
     model_name = model_name_
   } : language_model)
let make_list_language_models_response ?models:(models_ : models option)
  ?next_token:(next_token_ : next_token option) () =
  ({ models = models_; next_token = next_token_ } : list_language_models_response)
let make_list_language_models_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ?name_contains:(name_contains_ : model_name option)
  ?status_equals:(status_equals_ : model_status option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     name_contains = name_contains_;
     status_equals = status_equals_
   } : list_language_models_request)
let make_call_analytics_job_summary
  ?failure_reason:(failure_reason_ : failure_reason option)
  ?call_analytics_job_details:(call_analytics_job_details_ :
                                call_analytics_job_details option)
  ?call_analytics_job_status:(call_analytics_job_status_ :
                               call_analytics_job_status option)
  ?language_code:(language_code_ : language_code option)
  ?completion_time:(completion_time_ : date_time option)
  ?start_time:(start_time_ : date_time option)
  ?creation_time:(creation_time_ : date_time option)
  ?call_analytics_job_name:(call_analytics_job_name_ :
                             call_analytics_job_name option)
  () =
  ({
     failure_reason = failure_reason_;
     call_analytics_job_details = call_analytics_job_details_;
     call_analytics_job_status = call_analytics_job_status_;
     language_code = language_code_;
     completion_time = completion_time_;
     start_time = start_time_;
     creation_time = creation_time_;
     call_analytics_job_name = call_analytics_job_name_
   } : call_analytics_job_summary)
let make_list_call_analytics_jobs_response
  ?call_analytics_job_summaries:(call_analytics_job_summaries_ :
                                  call_analytics_job_summaries option)
  ?next_token:(next_token_ : next_token option)
  ?status:(status_ : call_analytics_job_status option) () =
  ({
     call_analytics_job_summaries = call_analytics_job_summaries_;
     next_token = next_token_;
     status = status_
   } : list_call_analytics_jobs_response)
let make_list_call_analytics_jobs_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ?job_name_contains:(job_name_contains_ : call_analytics_job_name option)
  ?status:(status_ : call_analytics_job_status option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     job_name_contains = job_name_contains_;
     status = status_
   } : list_call_analytics_jobs_request)
let make_list_call_analytics_categories_response
  ?categories:(categories_ : category_properties_list option)
  ?next_token:(next_token_ : next_token option) () =
  ({ categories = categories_; next_token = next_token_ } : list_call_analytics_categories_response)
let make_list_call_analytics_categories_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_call_analytics_categories_request)
let make_get_vocabulary_filter_response
  ?download_uri:(download_uri_ : uri option)
  ?last_modified_time:(last_modified_time_ : date_time option)
  ?language_code:(language_code_ : language_code option)
  ?vocabulary_filter_name:(vocabulary_filter_name_ :
                            vocabulary_filter_name option)
  () =
  ({
     download_uri = download_uri_;
     last_modified_time = last_modified_time_;
     language_code = language_code_;
     vocabulary_filter_name = vocabulary_filter_name_
   } : get_vocabulary_filter_response)
let make_get_vocabulary_filter_request
  ~vocabulary_filter_name:(vocabulary_filter_name_ : vocabulary_filter_name)
  () =
  ({ vocabulary_filter_name = vocabulary_filter_name_ } : get_vocabulary_filter_request)
let make_get_vocabulary_response ?download_uri:(download_uri_ : uri option)
  ?failure_reason:(failure_reason_ : failure_reason option)
  ?last_modified_time:(last_modified_time_ : date_time option)
  ?vocabulary_state:(vocabulary_state_ : vocabulary_state option)
  ?language_code:(language_code_ : language_code option)
  ?vocabulary_name:(vocabulary_name_ : vocabulary_name option) () =
  ({
     download_uri = download_uri_;
     failure_reason = failure_reason_;
     last_modified_time = last_modified_time_;
     vocabulary_state = vocabulary_state_;
     language_code = language_code_;
     vocabulary_name = vocabulary_name_
   } : get_vocabulary_response)
let make_get_vocabulary_request
  ~vocabulary_name:(vocabulary_name_ : vocabulary_name) () =
  ({ vocabulary_name = vocabulary_name_ } : get_vocabulary_request)
let make_get_transcription_job_response
  ?transcription_job:(transcription_job_ : transcription_job option) () =
  ({ transcription_job = transcription_job_ } : get_transcription_job_response)
let make_get_transcription_job_request
  ~transcription_job_name:(transcription_job_name_ : transcription_job_name)
  () =
  ({ transcription_job_name = transcription_job_name_ } : get_transcription_job_request)
let make_get_medical_vocabulary_response
  ?download_uri:(download_uri_ : uri option)
  ?failure_reason:(failure_reason_ : failure_reason option)
  ?last_modified_time:(last_modified_time_ : date_time option)
  ?vocabulary_state:(vocabulary_state_ : vocabulary_state option)
  ?language_code:(language_code_ : language_code option)
  ?vocabulary_name:(vocabulary_name_ : vocabulary_name option) () =
  ({
     download_uri = download_uri_;
     failure_reason = failure_reason_;
     last_modified_time = last_modified_time_;
     vocabulary_state = vocabulary_state_;
     language_code = language_code_;
     vocabulary_name = vocabulary_name_
   } : get_medical_vocabulary_response)
let make_get_medical_vocabulary_request
  ~vocabulary_name:(vocabulary_name_ : vocabulary_name) () =
  ({ vocabulary_name = vocabulary_name_ } : get_medical_vocabulary_request)
let make_get_medical_transcription_job_response
  ?medical_transcription_job:(medical_transcription_job_ :
                               medical_transcription_job option)
  () =
  ({ medical_transcription_job = medical_transcription_job_ } : get_medical_transcription_job_response)
let make_get_medical_transcription_job_request
  ~medical_transcription_job_name:(medical_transcription_job_name_ :
                                    transcription_job_name)
  () =
  ({ medical_transcription_job_name = medical_transcription_job_name_ } : 
  get_medical_transcription_job_request)
let make_get_medical_scribe_job_response
  ?medical_scribe_job:(medical_scribe_job_ : medical_scribe_job option) () =
  ({ medical_scribe_job = medical_scribe_job_ } : get_medical_scribe_job_response)
let make_get_medical_scribe_job_request
  ~medical_scribe_job_name:(medical_scribe_job_name_ :
                             transcription_job_name)
  () =
  ({ medical_scribe_job_name = medical_scribe_job_name_ } : get_medical_scribe_job_request)
let make_get_call_analytics_job_response
  ?call_analytics_job:(call_analytics_job_ : call_analytics_job option) () =
  ({ call_analytics_job = call_analytics_job_ } : get_call_analytics_job_response)
let make_get_call_analytics_job_request
  ~call_analytics_job_name:(call_analytics_job_name_ :
                             call_analytics_job_name)
  () =
  ({ call_analytics_job_name = call_analytics_job_name_ } : get_call_analytics_job_request)
let make_get_call_analytics_category_response
  ?category_properties:(category_properties_ : category_properties option) ()
  =
  ({ category_properties = category_properties_ } : get_call_analytics_category_response)
let make_get_call_analytics_category_request
  ~category_name:(category_name_ : category_name) () =
  ({ category_name = category_name_ } : get_call_analytics_category_request)
let make_describe_language_model_response
  ?language_model:(language_model_ : language_model option) () =
  ({ language_model = language_model_ } : describe_language_model_response)
let make_describe_language_model_request
  ~model_name:(model_name_ : model_name) () =
  ({ model_name = model_name_ } : describe_language_model_request)
let make_delete_vocabulary_filter_request
  ~vocabulary_filter_name:(vocabulary_filter_name_ : vocabulary_filter_name)
  () =
  ({ vocabulary_filter_name = vocabulary_filter_name_ } : delete_vocabulary_filter_request)
let make_delete_vocabulary_request
  ~vocabulary_name:(vocabulary_name_ : vocabulary_name) () =
  ({ vocabulary_name = vocabulary_name_ } : delete_vocabulary_request)
let make_delete_transcription_job_request
  ~transcription_job_name:(transcription_job_name_ : transcription_job_name)
  () =
  ({ transcription_job_name = transcription_job_name_ } : delete_transcription_job_request)
let make_delete_medical_vocabulary_request
  ~vocabulary_name:(vocabulary_name_ : vocabulary_name) () =
  ({ vocabulary_name = vocabulary_name_ } : delete_medical_vocabulary_request)
let make_delete_medical_transcription_job_request
  ~medical_transcription_job_name:(medical_transcription_job_name_ :
                                    transcription_job_name)
  () =
  ({ medical_transcription_job_name = medical_transcription_job_name_ } : 
  delete_medical_transcription_job_request)
let make_delete_medical_scribe_job_request
  ~medical_scribe_job_name:(medical_scribe_job_name_ :
                             transcription_job_name)
  () =
  ({ medical_scribe_job_name = medical_scribe_job_name_ } : delete_medical_scribe_job_request)
let make_delete_language_model_request ~model_name:(model_name_ : model_name)
  () = ({ model_name = model_name_ } : delete_language_model_request)
let make_delete_call_analytics_job_response () = (() : unit)
let make_delete_call_analytics_job_request
  ~call_analytics_job_name:(call_analytics_job_name_ :
                             call_analytics_job_name)
  () =
  ({ call_analytics_job_name = call_analytics_job_name_ } : delete_call_analytics_job_request)
let make_delete_call_analytics_category_response () = (() : unit)
let make_delete_call_analytics_category_request
  ~category_name:(category_name_ : category_name) () =
  ({ category_name = category_name_ } : delete_call_analytics_category_request)
let make_create_vocabulary_filter_response
  ?last_modified_time:(last_modified_time_ : date_time option)
  ?language_code:(language_code_ : language_code option)
  ?vocabulary_filter_name:(vocabulary_filter_name_ :
                            vocabulary_filter_name option)
  () =
  ({
     last_modified_time = last_modified_time_;
     language_code = language_code_;
     vocabulary_filter_name = vocabulary_filter_name_
   } : create_vocabulary_filter_response)
let make_create_vocabulary_filter_request
  ?data_access_role_arn:(data_access_role_arn_ : data_access_role_arn option)
  ?tags:(tags_ : tag_list option)
  ?vocabulary_filter_file_uri:(vocabulary_filter_file_uri_ : uri option)
  ?words:(words_ : words option)
  ~language_code:(language_code_ : language_code)
  ~vocabulary_filter_name:(vocabulary_filter_name_ : vocabulary_filter_name)
  () =
  ({
     data_access_role_arn = data_access_role_arn_;
     tags = tags_;
     vocabulary_filter_file_uri = vocabulary_filter_file_uri_;
     words = words_;
     language_code = language_code_;
     vocabulary_filter_name = vocabulary_filter_name_
   } : create_vocabulary_filter_request)
let make_create_vocabulary_response
  ?failure_reason:(failure_reason_ : failure_reason option)
  ?last_modified_time:(last_modified_time_ : date_time option)
  ?vocabulary_state:(vocabulary_state_ : vocabulary_state option)
  ?language_code:(language_code_ : language_code option)
  ?vocabulary_name:(vocabulary_name_ : vocabulary_name option) () =
  ({
     failure_reason = failure_reason_;
     last_modified_time = last_modified_time_;
     vocabulary_state = vocabulary_state_;
     language_code = language_code_;
     vocabulary_name = vocabulary_name_
   } : create_vocabulary_response)
let make_create_vocabulary_request
  ?data_access_role_arn:(data_access_role_arn_ : data_access_role_arn option)
  ?tags:(tags_ : tag_list option)
  ?vocabulary_file_uri:(vocabulary_file_uri_ : uri option)
  ?phrases:(phrases_ : phrases option)
  ~language_code:(language_code_ : language_code)
  ~vocabulary_name:(vocabulary_name_ : vocabulary_name) () =
  ({
     data_access_role_arn = data_access_role_arn_;
     tags = tags_;
     vocabulary_file_uri = vocabulary_file_uri_;
     phrases = phrases_;
     language_code = language_code_;
     vocabulary_name = vocabulary_name_
   } : create_vocabulary_request)
let make_create_medical_vocabulary_response
  ?failure_reason:(failure_reason_ : failure_reason option)
  ?last_modified_time:(last_modified_time_ : date_time option)
  ?vocabulary_state:(vocabulary_state_ : vocabulary_state option)
  ?language_code:(language_code_ : language_code option)
  ?vocabulary_name:(vocabulary_name_ : vocabulary_name option) () =
  ({
     failure_reason = failure_reason_;
     last_modified_time = last_modified_time_;
     vocabulary_state = vocabulary_state_;
     language_code = language_code_;
     vocabulary_name = vocabulary_name_
   } : create_medical_vocabulary_response)
let make_create_medical_vocabulary_request ?tags:(tags_ : tag_list option)
  ~vocabulary_file_uri:(vocabulary_file_uri_ : uri)
  ~language_code:(language_code_ : language_code)
  ~vocabulary_name:(vocabulary_name_ : vocabulary_name) () =
  ({
     tags = tags_;
     vocabulary_file_uri = vocabulary_file_uri_;
     language_code = language_code_;
     vocabulary_name = vocabulary_name_
   } : create_medical_vocabulary_request)
let make_create_language_model_response
  ?model_status:(model_status_ : model_status option)
  ?input_data_config:(input_data_config_ : input_data_config option)
  ?model_name:(model_name_ : model_name option)
  ?base_model_name:(base_model_name_ : base_model_name option)
  ?language_code:(language_code_ : clm_language_code option) () =
  ({
     model_status = model_status_;
     input_data_config = input_data_config_;
     model_name = model_name_;
     base_model_name = base_model_name_;
     language_code = language_code_
   } : create_language_model_response)
let make_create_language_model_request ?tags:(tags_ : tag_list option)
  ~input_data_config:(input_data_config_ : input_data_config)
  ~model_name:(model_name_ : model_name)
  ~base_model_name:(base_model_name_ : base_model_name)
  ~language_code:(language_code_ : clm_language_code) () =
  ({
     tags = tags_;
     input_data_config = input_data_config_;
     model_name = model_name_;
     base_model_name = base_model_name_;
     language_code = language_code_
   } : create_language_model_request)
let make_create_call_analytics_category_response
  ?category_properties:(category_properties_ : category_properties option) ()
  =
  ({ category_properties = category_properties_ } : create_call_analytics_category_response)
let make_create_call_analytics_category_request
  ?input_type:(input_type_ : input_type option)
  ?tags:(tags_ : tag_list option) ~rules:(rules_ : rule_list)
  ~category_name:(category_name_ : category_name) () =
  ({
     input_type = input_type_;
     tags = tags_;
     rules = rules_;
     category_name = category_name_
   } : create_call_analytics_category_request)