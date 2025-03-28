open Smaws_Lib.CoreTypes
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "transcribe";
      endpointPrefix = "transcribe";
      version = "2017-10-26";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec word = string
type nonrec words = string list option list
type nonrec base_unit = unit
type nonrec vocabulary_state =
  | FAILED 
  | READY 
  | PENDING 
type nonrec vocabulary_name = string
type nonrec language_code =
  | ZU_ZA 
  | WO_SN 
  | UZ_UZ 
  | UK_UA 
  | UG_CN 
  | TT_RU 
  | TL_PH 
  | SW_UG 
  | SW_TZ 
  | SW_RW 
  | SW_KE 
  | SW_BI 
  | SU_ID 
  | SR_RS 
  | SO_SO 
  | SL_SI 
  | SK_SK 
  | SI_LK 
  | RW_RW 
  | RO_RO 
  | PS_AF 
  | PL_PL 
  | PA_IN 
  | OR_IN 
  | NO_NO 
  | MT_MT 
  | MR_IN 
  | MN_MN 
  | ML_IN 
  | MK_MK 
  | MI_NZ 
  | MHR_RU 
  | LV_LV 
  | LT_LT 
  | LG_IN 
  | KY_KG 
  | KN_IN 
  | KK_KZ 
  | KAB_DZ 
  | KA_GE 
  | IS_IS 
  | HY_AM 
  | HU_HU 
  | HR_HR 
  | HA_NG 
  | GU_IN 
  | GL_ES 
  | FI_FI 
  | EU_ES 
  | ET_ET 
  | EL_GR 
  | CY_WL 
  | CS_CZ 
  | CKB_IR 
  | CKB_IQ 
  | CA_ES 
  | BS_BA 
  | BN_IN 
  | BG_BG 
  | BE_BY 
  | BA_RU 
  | AZ_AZ 
  | AST_ES 
  | AB_GE 
  | SV_SE 
  | VI_VN 
  | EN_NZ 
  | EN_ZA 
  | TH_TH 
  | ZH_TW 
  | ZH_CN 
  | TR_TR 
  | TE_IN 
  | TA_IN 
  | RU_RU 
  | PT_PT 
  | PT_BR 
  | NL_NL 
  | MS_MY 
  | KO_KR 
  | JA_JP 
  | IT_IT 
  | ID_ID 
  | HI_IN 
  | HE_IL 
  | FR_FR 
  | FR_CA 
  | FA_IR 
  | ES_US 
  | ES_ES 
  | EN_WL 
  | EN_US 
  | EN_IN 
  | EN_IE 
  | EN_GB 
  | EN_AU 
  | EN_AB 
  | DE_DE 
  | DE_CH 
  | DA_DK 
  | AR_SA 
  | AR_AE 
  | AF_ZA 
type nonrec date_time = Timestamp.t
type nonrec vocabulary_info =
  {
  vocabulary_state: vocabulary_state option ;
  last_modified_time: float option ;
  language_code: language_code option ;
  vocabulary_name: string option }
type nonrec vocabulary_filter_name = string
type nonrec vocabulary_filter_info =
  {
  last_modified_time: float option ;
  language_code: language_code option ;
  vocabulary_filter_name: string option }
type nonrec vocabulary_filters = vocabulary_filter_info list option list
type nonrec vocabulary_filter_method =
  | TAG 
  | MASK 
  | REMOVE 
type nonrec vocabularies = vocabulary_info list option list
type nonrec uri = string
type nonrec update_vocabulary_response =
  {
  vocabulary_state: vocabulary_state option ;
  last_modified_time: float option ;
  language_code: language_code option ;
  vocabulary_name: string option }
type nonrec phrase = string
type nonrec phrases = string list option list
type nonrec data_access_role_arn = string
type nonrec update_vocabulary_request =
  {
  data_access_role_arn: string option ;
  vocabulary_file_uri: string option ;
  phrases: string list option ;
  language_code: language_code ;
  vocabulary_name: string }
type nonrec update_vocabulary_filter_response =
  {
  last_modified_time: float option ;
  language_code: language_code option ;
  vocabulary_filter_name: string option }
type nonrec update_vocabulary_filter_request =
  {
  data_access_role_arn: string option ;
  vocabulary_filter_file_uri: string option ;
  words: string list option ;
  vocabulary_filter_name: string }
type nonrec string_ = string
type nonrec not_found_exception = {
  message: string option }
type nonrec limit_exceeded_exception = {
  message: string option }
type nonrec internal_failure_exception = {
  message: string option }
type nonrec failure_reason = string
type nonrec bad_request_exception = {
  message: string option }
type nonrec conflict_exception = {
  message: string option }
type nonrec update_medical_vocabulary_response =
  {
  vocabulary_state: vocabulary_state option ;
  last_modified_time: float option ;
  language_code: language_code option ;
  vocabulary_name: string option }
type nonrec update_medical_vocabulary_request =
  {
  vocabulary_file_uri: string ;
  language_code: language_code ;
  vocabulary_name: string }
type nonrec category_name = string
type nonrec timestamp_milliseconds = int
type nonrec absolute_time_range =
  {
  last: int option ;
  first: int option ;
  end_time: int option ;
  start_time: int option }
type nonrec percentage = int
type nonrec relative_time_range =
  {
  last: int option ;
  first: int option ;
  end_percentage: int option ;
  start_percentage: int option }
type nonrec boolean_ = bool
type nonrec non_talk_time_filter =
  {
  negate: bool option ;
  relative_time_range: relative_time_range option ;
  absolute_time_range: absolute_time_range option ;
  threshold: int option }
type nonrec participant_role =
  | CUSTOMER 
  | AGENT 
type nonrec interruption_filter =
  {
  negate: bool option ;
  relative_time_range: relative_time_range option ;
  absolute_time_range: absolute_time_range option ;
  participant_role: participant_role option ;
  threshold: int option }
type nonrec transcript_filter_type =
  | EXACT 
type nonrec non_empty_string = string
type nonrec string_target_list = string list option list
type nonrec transcript_filter =
  {
  targets: string list ;
  negate: bool option ;
  participant_role: participant_role option ;
  relative_time_range: relative_time_range option ;
  absolute_time_range: absolute_time_range option ;
  transcript_filter_type: transcript_filter_type }
type nonrec sentiment_value =
  | MIXED 
  | NEUTRAL 
  | NEGATIVE 
  | POSITIVE 
type nonrec sentiment_value_list = sentiment_value list option list
type nonrec sentiment_filter =
  {
  negate: bool option ;
  participant_role: participant_role option ;
  relative_time_range: relative_time_range option ;
  absolute_time_range: absolute_time_range option ;
  sentiments: sentiment_value list }
type nonrec rule = unit
type nonrec rule_list = rule list option list
type nonrec input_type =
  | POST_CALL 
  | REAL_TIME 
type nonrec category_properties =
  {
  input_type: input_type option ;
  last_update_time: float option ;
  create_time: float option ;
  rules: rule list option ;
  category_name: string option }
type nonrec update_call_analytics_category_response =
  {
  category_properties: category_properties option }
type nonrec update_call_analytics_category_request =
  {
  input_type: input_type option ;
  rules: rule list ;
  category_name: string }
type nonrec untag_resource_response = unit
type nonrec transcribe_arn = string
type nonrec tag_key = string
type nonrec tag_key_list = string list option list
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_arn: string }
type nonrec type_ =
  | DICTATION 
  | CONVERSATION 
type nonrec transcription_job_name = string
type nonrec transcription_job_status =
  | COMPLETED 
  | FAILED 
  | IN_PROGRESS 
  | QUEUED 
type nonrec output_location_type =
  | SERVICE_BUCKET 
  | CUSTOMER_BUCKET 
type nonrec redaction_type =
  | PII 
type nonrec redaction_output =
  | REDACTED_AND_UNREDACTED 
  | REDACTED 
type nonrec pii_entity_type =
  | ALL 
  | SSN 
  | PHONE 
  | NAME 
  | ADDRESS 
  | EMAIL 
  | PIN 
  | CREDIT_DEBIT_EXPIRY 
  | CREDIT_DEBIT_CVV 
  | CREDIT_DEBIT_NUMBER 
  | BANK_ROUTING 
  | BANK_ACCOUNT_NUMBER 
type nonrec pii_entity_types = pii_entity_type list option list
type nonrec content_redaction =
  {
  pii_entity_types: pii_entity_type list option ;
  redaction_output: redaction_output ;
  redaction_type: redaction_type }
type nonrec model_name = string
type nonrec model_settings = {
  language_model_name: string option }
type nonrec identified_language_score = float
type nonrec duration_in_seconds = float
type nonrec language_code_item =
  {
  duration_in_seconds: float option ;
  language_code: language_code option }
type nonrec language_code_list = language_code_item list option list
type nonrec toxicity_category =
  | ALL 
type nonrec toxicity_categories = toxicity_category list option list
type nonrec toxicity_detection_settings =
  {
  toxicity_categories: toxicity_category list }
type nonrec toxicity_detection = toxicity_detection_settings list option list
type nonrec transcription_job_summary =
  {
  toxicity_detection: toxicity_detection_settings list option ;
  language_codes: language_code_item list option ;
  identified_language_score: float option ;
  identify_multiple_languages: bool option ;
  identify_language: bool option ;
  model_settings: model_settings option ;
  content_redaction: content_redaction option ;
  output_location_type: output_location_type option ;
  failure_reason: string option ;
  transcription_job_status: transcription_job_status option ;
  language_code: language_code option ;
  completion_time: float option ;
  start_time: float option ;
  creation_time: float option ;
  transcription_job_name: string option }
type nonrec transcription_job_summaries =
  transcription_job_summary list option list
type nonrec media_sample_rate_hertz = int
type nonrec media_format =
  | M4A 
  | WEBM 
  | AMR 
  | OGG 
  | FLAC 
  | WAV 
  | MP4 
  | MP3 
type nonrec media =
  {
  redacted_media_file_uri: string option ;
  media_file_uri: string option }
type nonrec transcript =
  {
  redacted_transcript_file_uri: string option ;
  transcript_file_uri: string option }
type nonrec max_speakers = int
type nonrec max_alternatives = int
type nonrec settings =
  {
  vocabulary_filter_method: vocabulary_filter_method option ;
  vocabulary_filter_name: string option ;
  max_alternatives: int option ;
  show_alternatives: bool option ;
  channel_identification: bool option ;
  max_speaker_labels: int option ;
  show_speaker_labels: bool option ;
  vocabulary_name: string option }
type nonrec job_execution_settings =
  {
  data_access_role_arn: string option ;
  allow_deferred_execution: bool option }
type nonrec language_options = language_code list option list
type nonrec tag_value = string
type nonrec tag = {
  value: string ;
  key: string }
type nonrec tag_list = tag list option list
type nonrec subtitle_format =
  | SRT 
  | VTT 
type nonrec subtitle_formats = subtitle_format list option list
type nonrec subtitle_file_uris = string list option list
type nonrec subtitle_output_start_index = int
type nonrec subtitles_output =
  {
  output_start_index: int option ;
  subtitle_file_uris: string list option ;
  formats: subtitle_format list option }
type nonrec language_id_settings =
  {
  language_model_name: string option ;
  vocabulary_filter_name: string option ;
  vocabulary_name: string option }
type nonrec language_id_settings_map =
  (string_ option * language_id_settings option) list
type nonrec transcription_job =
  {
  toxicity_detection: toxicity_detection_settings list option ;
  language_id_settings: (string * language_id_settings) list option ;
  subtitles: subtitles_output option ;
  tags: tag list option ;
  language_codes: language_code_item list option ;
  identified_language_score: float option ;
  language_options: language_code list option ;
  identify_multiple_languages: bool option ;
  identify_language: bool option ;
  content_redaction: content_redaction option ;
  job_execution_settings: job_execution_settings option ;
  model_settings: model_settings option ;
  settings: settings option ;
  failure_reason: string option ;
  completion_time: float option ;
  creation_time: float option ;
  start_time: float option ;
  transcript: transcript option ;
  media: media option ;
  media_format: media_format option ;
  media_sample_rate_hertz: int option ;
  language_code: language_code option ;
  transcription_job_status: transcription_job_status option ;
  transcription_job_name: string option }
type nonrec tag_resource_response = unit
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_arn: string }
type nonrec start_transcription_job_response =
  {
  transcription_job: transcription_job option }
type nonrec output_bucket_name = string
type nonrec output_key = string
type nonrec kms_key_id = string
type nonrec kms_encryption_context_map =
  (string_ option * string_ option) list
type nonrec subtitles =
  {
  output_start_index: int option ;
  formats: subtitle_format list option }
type nonrec start_transcription_job_request =
  {
  toxicity_detection: toxicity_detection_settings list option ;
  language_id_settings: (string * language_id_settings) list option ;
  tags: tag list option ;
  subtitles: subtitles option ;
  language_options: language_code list option ;
  identify_multiple_languages: bool option ;
  identify_language: bool option ;
  content_redaction: content_redaction option ;
  job_execution_settings: job_execution_settings option ;
  model_settings: model_settings option ;
  settings: settings option ;
  kms_encryption_context: (string * string) list option ;
  output_encryption_kms_key_id: string option ;
  output_key: string option ;
  output_bucket_name: string option ;
  media: media ;
  media_format: media_format option ;
  media_sample_rate_hertz: int option ;
  language_code: language_code option ;
  transcription_job_name: string }
type nonrec medical_media_sample_rate_hertz = int
type nonrec medical_transcript = {
  transcript_file_uri: string option }
type nonrec medical_transcription_setting =
  {
  vocabulary_name: string option ;
  max_alternatives: int option ;
  show_alternatives: bool option ;
  channel_identification: bool option ;
  max_speaker_labels: int option ;
  show_speaker_labels: bool option }
type nonrec medical_content_identification_type =
  | PHI 
type nonrec specialty =
  | PRIMARYCARE 
type nonrec medical_transcription_job =
  {
  tags: tag list option ;
  type_: type_ option ;
  specialty: specialty option ;
  content_identification_type: medical_content_identification_type option ;
  settings: medical_transcription_setting option ;
  failure_reason: string option ;
  completion_time: float option ;
  creation_time: float option ;
  start_time: float option ;
  transcript: medical_transcript option ;
  media: media option ;
  media_format: media_format option ;
  media_sample_rate_hertz: int option ;
  language_code: language_code option ;
  transcription_job_status: transcription_job_status option ;
  medical_transcription_job_name: string option }
type nonrec start_medical_transcription_job_response =
  {
  medical_transcription_job: medical_transcription_job option }
type nonrec start_medical_transcription_job_request =
  {
  tags: tag list option ;
  type_: type_ ;
  specialty: specialty ;
  content_identification_type: medical_content_identification_type option ;
  settings: medical_transcription_setting option ;
  kms_encryption_context: (string * string) list option ;
  output_encryption_kms_key_id: string option ;
  output_key: string option ;
  output_bucket_name: string ;
  media: media ;
  media_format: media_format option ;
  media_sample_rate_hertz: int option ;
  language_code: language_code ;
  medical_transcription_job_name: string }
type nonrec medical_scribe_job_status =
  | COMPLETED 
  | FAILED 
  | IN_PROGRESS 
  | QUEUED 
type nonrec medical_scribe_language_code =
  | EN_US 
type nonrec medical_scribe_output =
  {
  clinical_document_uri: string ;
  transcript_file_uri: string }
type nonrec medical_scribe_settings =
  {
  vocabulary_filter_method: vocabulary_filter_method option ;
  vocabulary_filter_name: string option ;
  vocabulary_name: string option ;
  channel_identification: bool option ;
  max_speaker_labels: int option ;
  show_speaker_labels: bool option }
type nonrec medical_scribe_channel_id = int
type nonrec medical_scribe_participant_role =
  | CLINICIAN 
  | PATIENT 
type nonrec medical_scribe_channel_definition =
  {
  participant_role: medical_scribe_participant_role ;
  channel_id: int }
type nonrec medical_scribe_channel_definitions =
  medical_scribe_channel_definition list option list
type nonrec medical_scribe_job =
  {
  tags: tag list option ;
  channel_definitions: medical_scribe_channel_definition list option ;
  data_access_role_arn: string option ;
  settings: medical_scribe_settings option ;
  failure_reason: string option ;
  completion_time: float option ;
  creation_time: float option ;
  start_time: float option ;
  medical_scribe_output: medical_scribe_output option ;
  media: media option ;
  language_code: medical_scribe_language_code option ;
  medical_scribe_job_status: medical_scribe_job_status option ;
  medical_scribe_job_name: string option }
type nonrec start_medical_scribe_job_response =
  {
  medical_scribe_job: medical_scribe_job option }
type nonrec start_medical_scribe_job_request =
  {
  tags: tag list option ;
  channel_definitions: medical_scribe_channel_definition list option ;
  settings: medical_scribe_settings ;
  data_access_role_arn: string ;
  kms_encryption_context: (string * string) list option ;
  output_encryption_kms_key_id: string option ;
  output_bucket_name: string ;
  media: media ;
  medical_scribe_job_name: string }
type nonrec call_analytics_job_name = string
type nonrec call_analytics_job_status =
  | COMPLETED 
  | FAILED 
  | IN_PROGRESS 
  | QUEUED 
type nonrec call_analytics_feature =
  | GENERATIVE_SUMMARIZATION 
type nonrec call_analytics_skipped_reason_code =
  | FAILED_SAFETY_GUIDELINES 
  | INSUFFICIENT_CONVERSATION_CONTENT 
type nonrec call_analytics_skipped_feature =
  {
  message: string option ;
  reason_code: call_analytics_skipped_reason_code option ;
  feature: call_analytics_feature option }
type nonrec call_analytics_skipped_feature_list =
  call_analytics_skipped_feature list option list
type nonrec call_analytics_job_details =
  {
  skipped: call_analytics_skipped_feature list option }
type nonrec summarization = {
  generate_abstractive_summary: bool }
type nonrec call_analytics_job_settings =
  {
  summarization: summarization option ;
  language_id_settings: (string * language_id_settings) list option ;
  language_options: language_code list option ;
  content_redaction: content_redaction option ;
  language_model_name: string option ;
  vocabulary_filter_method: vocabulary_filter_method option ;
  vocabulary_filter_name: string option ;
  vocabulary_name: string option }
type nonrec channel_id = int
type nonrec channel_definition =
  {
  participant_role: participant_role option ;
  channel_id: int option }
type nonrec channel_definitions = channel_definition list option list
type nonrec call_analytics_job =
  {
  channel_definitions: channel_definition list option ;
  settings: call_analytics_job_settings option ;
  identified_language_score: float option ;
  data_access_role_arn: string option ;
  failure_reason: string option ;
  completion_time: float option ;
  creation_time: float option ;
  start_time: float option ;
  transcript: transcript option ;
  media: media option ;
  media_format: media_format option ;
  media_sample_rate_hertz: int option ;
  language_code: language_code option ;
  call_analytics_job_details: call_analytics_job_details option ;
  call_analytics_job_status: call_analytics_job_status option ;
  call_analytics_job_name: string option }
type nonrec start_call_analytics_job_response =
  {
  call_analytics_job: call_analytics_job option }
type nonrec start_call_analytics_job_request =
  {
  channel_definitions: channel_definition list option ;
  settings: call_analytics_job_settings option ;
  data_access_role_arn: string option ;
  output_encryption_kms_key_id: string option ;
  output_location: string option ;
  media: media ;
  call_analytics_job_name: string }
type nonrec next_token = string
type nonrec list_vocabulary_filters_response =
  {
  vocabulary_filters: vocabulary_filter_info list option ;
  next_token: string option }
type nonrec max_results = int
type nonrec list_vocabulary_filters_request =
  {
  name_contains: string option ;
  max_results: int option ;
  next_token: string option }
type nonrec list_vocabularies_response =
  {
  vocabularies: vocabulary_info list option ;
  next_token: string option ;
  status: vocabulary_state option }
type nonrec list_vocabularies_request =
  {
  name_contains: string option ;
  state_equals: vocabulary_state option ;
  max_results: int option ;
  next_token: string option }
type nonrec list_transcription_jobs_response =
  {
  transcription_job_summaries: transcription_job_summary list option ;
  next_token: string option ;
  status: transcription_job_status option }
type nonrec list_transcription_jobs_request =
  {
  max_results: int option ;
  next_token: string option ;
  job_name_contains: string option ;
  status: transcription_job_status option }
type nonrec list_tags_for_resource_response =
  {
  tags: tag list option ;
  resource_arn: string option }
type nonrec list_tags_for_resource_request = {
  resource_arn: string }
type nonrec list_medical_vocabularies_response =
  {
  vocabularies: vocabulary_info list option ;
  next_token: string option ;
  status: vocabulary_state option }
type nonrec list_medical_vocabularies_request =
  {
  name_contains: string option ;
  state_equals: vocabulary_state option ;
  max_results: int option ;
  next_token: string option }
type nonrec medical_transcription_job_summary =
  {
  type_: type_ option ;
  content_identification_type: medical_content_identification_type option ;
  specialty: specialty option ;
  output_location_type: output_location_type option ;
  failure_reason: string option ;
  transcription_job_status: transcription_job_status option ;
  language_code: language_code option ;
  completion_time: float option ;
  start_time: float option ;
  creation_time: float option ;
  medical_transcription_job_name: string option }
type nonrec medical_transcription_job_summaries =
  medical_transcription_job_summary list option list
type nonrec list_medical_transcription_jobs_response =
  {
  medical_transcription_job_summaries:
    medical_transcription_job_summary list option ;
  next_token: string option ;
  status: transcription_job_status option }
type nonrec list_medical_transcription_jobs_request =
  {
  max_results: int option ;
  next_token: string option ;
  job_name_contains: string option ;
  status: transcription_job_status option }
type nonrec medical_scribe_job_summary =
  {
  failure_reason: string option ;
  medical_scribe_job_status: medical_scribe_job_status option ;
  language_code: medical_scribe_language_code option ;
  completion_time: float option ;
  start_time: float option ;
  creation_time: float option ;
  medical_scribe_job_name: string option }
type nonrec medical_scribe_job_summaries =
  medical_scribe_job_summary list option list
type nonrec list_medical_scribe_jobs_response =
  {
  medical_scribe_job_summaries: medical_scribe_job_summary list option ;
  next_token: string option ;
  status: medical_scribe_job_status option }
type nonrec list_medical_scribe_jobs_request =
  {
  max_results: int option ;
  next_token: string option ;
  job_name_contains: string option ;
  status: medical_scribe_job_status option }
type nonrec clm_language_code =
  | JA_JP 
  | DE_DE 
  | EN_AU 
  | EN_GB 
  | ES_US 
  | HI_IN 
  | EN_US 
type nonrec base_model_name =
  | WIDE_BAND 
  | NARROW_BAND 
type nonrec model_status =
  | COMPLETED 
  | FAILED 
  | IN_PROGRESS 
type nonrec input_data_config =
  {
  data_access_role_arn: string ;
  tuning_data_s3_uri: string option ;
  s3_uri: string }
type nonrec language_model =
  {
  input_data_config: input_data_config option ;
  failure_reason: string option ;
  upgrade_availability: bool option ;
  model_status: model_status option ;
  base_model_name: base_model_name option ;
  language_code: clm_language_code option ;
  last_modified_time: float option ;
  create_time: float option ;
  model_name: string option }
type nonrec models = language_model list option list
type nonrec list_language_models_response =
  {
  models: language_model list option ;
  next_token: string option }
type nonrec list_language_models_request =
  {
  max_results: int option ;
  next_token: string option ;
  name_contains: string option ;
  status_equals: model_status option }
type nonrec call_analytics_job_summary =
  {
  failure_reason: string option ;
  call_analytics_job_details: call_analytics_job_details option ;
  call_analytics_job_status: call_analytics_job_status option ;
  language_code: language_code option ;
  completion_time: float option ;
  start_time: float option ;
  creation_time: float option ;
  call_analytics_job_name: string option }
type nonrec call_analytics_job_summaries =
  call_analytics_job_summary list option list
type nonrec list_call_analytics_jobs_response =
  {
  call_analytics_job_summaries: call_analytics_job_summary list option ;
  next_token: string option ;
  status: call_analytics_job_status option }
type nonrec list_call_analytics_jobs_request =
  {
  max_results: int option ;
  next_token: string option ;
  job_name_contains: string option ;
  status: call_analytics_job_status option }
type nonrec category_properties_list = category_properties list option list
type nonrec list_call_analytics_categories_response =
  {
  categories: category_properties list option ;
  next_token: string option }
type nonrec list_call_analytics_categories_request =
  {
  max_results: int option ;
  next_token: string option }
type nonrec get_vocabulary_filter_response =
  {
  download_uri: string option ;
  last_modified_time: float option ;
  language_code: language_code option ;
  vocabulary_filter_name: string option }
type nonrec get_vocabulary_filter_request = {
  vocabulary_filter_name: string }
type nonrec get_vocabulary_response =
  {
  download_uri: string option ;
  failure_reason: string option ;
  last_modified_time: float option ;
  vocabulary_state: vocabulary_state option ;
  language_code: language_code option ;
  vocabulary_name: string option }
type nonrec get_vocabulary_request = {
  vocabulary_name: string }
type nonrec get_transcription_job_response =
  {
  transcription_job: transcription_job option }
type nonrec get_transcription_job_request = {
  transcription_job_name: string }
type nonrec get_medical_vocabulary_response =
  {
  download_uri: string option ;
  failure_reason: string option ;
  last_modified_time: float option ;
  vocabulary_state: vocabulary_state option ;
  language_code: language_code option ;
  vocabulary_name: string option }
type nonrec get_medical_vocabulary_request = {
  vocabulary_name: string }
type nonrec get_medical_transcription_job_response =
  {
  medical_transcription_job: medical_transcription_job option }
type nonrec get_medical_transcription_job_request =
  {
  medical_transcription_job_name: string }
type nonrec get_medical_scribe_job_response =
  {
  medical_scribe_job: medical_scribe_job option }
type nonrec get_medical_scribe_job_request =
  {
  medical_scribe_job_name: string }
type nonrec get_call_analytics_job_response =
  {
  call_analytics_job: call_analytics_job option }
type nonrec get_call_analytics_job_request =
  {
  call_analytics_job_name: string }
type nonrec get_call_analytics_category_response =
  {
  category_properties: category_properties option }
type nonrec get_call_analytics_category_request = {
  category_name: string }
type nonrec describe_language_model_response =
  {
  language_model: language_model option }
type nonrec describe_language_model_request = {
  model_name: string }
type nonrec delete_vocabulary_filter_request =
  {
  vocabulary_filter_name: string }
type nonrec delete_vocabulary_request = {
  vocabulary_name: string }
type nonrec delete_transcription_job_request =
  {
  transcription_job_name: string }
type nonrec delete_medical_vocabulary_request = {
  vocabulary_name: string }
type nonrec delete_medical_transcription_job_request =
  {
  medical_transcription_job_name: string }
type nonrec delete_medical_scribe_job_request =
  {
  medical_scribe_job_name: string }
type nonrec delete_language_model_request = {
  model_name: string }
type nonrec delete_call_analytics_job_response = unit
type nonrec delete_call_analytics_job_request =
  {
  call_analytics_job_name: string }
type nonrec delete_call_analytics_category_response = unit
type nonrec delete_call_analytics_category_request = {
  category_name: string }
type nonrec create_vocabulary_filter_response =
  {
  last_modified_time: float option ;
  language_code: language_code option ;
  vocabulary_filter_name: string option }
type nonrec create_vocabulary_filter_request =
  {
  data_access_role_arn: string option ;
  tags: tag list option ;
  vocabulary_filter_file_uri: string option ;
  words: string list option ;
  language_code: language_code ;
  vocabulary_filter_name: string }
type nonrec create_vocabulary_response =
  {
  failure_reason: string option ;
  last_modified_time: float option ;
  vocabulary_state: vocabulary_state option ;
  language_code: language_code option ;
  vocabulary_name: string option }
type nonrec create_vocabulary_request =
  {
  data_access_role_arn: string option ;
  tags: tag list option ;
  vocabulary_file_uri: string option ;
  phrases: string list option ;
  language_code: language_code ;
  vocabulary_name: string }
type nonrec create_medical_vocabulary_response =
  {
  failure_reason: string option ;
  last_modified_time: float option ;
  vocabulary_state: vocabulary_state option ;
  language_code: language_code option ;
  vocabulary_name: string option }
type nonrec create_medical_vocabulary_request =
  {
  tags: tag list option ;
  vocabulary_file_uri: string ;
  language_code: language_code ;
  vocabulary_name: string }
type nonrec create_language_model_response =
  {
  model_status: model_status option ;
  input_data_config: input_data_config option ;
  model_name: string option ;
  base_model_name: base_model_name option ;
  language_code: clm_language_code option }
type nonrec create_language_model_request =
  {
  tags: tag list option ;
  input_data_config: input_data_config ;
  model_name: string ;
  base_model_name: base_model_name ;
  language_code: clm_language_code }
type nonrec create_call_analytics_category_response =
  {
  category_properties: category_properties option }
type nonrec create_call_analytics_category_request =
  {
  input_type: input_type option ;
  rules: rule list ;
  category_name: string }
type nonrec transcribe = unit
type nonrec base_string = string
type nonrec base_boolean = bool
type nonrec base_integer = int
type nonrec base_timestamp = Timestamp.t
type nonrec base_long = int
type nonrec base_document = Document.t