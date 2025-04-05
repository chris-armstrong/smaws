(** 
    Transcribe client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec vocabulary_state =
  | FAILED 
  | READY 
  | PENDING 
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
type nonrec vocabulary_info =
  {
  vocabulary_state: vocabulary_state option ;
  last_modified_time: CoreTypes.Timestamp.t option ;
  language_code: language_code option ;
  vocabulary_name: string option }
type nonrec vocabulary_filter_info =
  {
  last_modified_time: CoreTypes.Timestamp.t option ;
  language_code: language_code option ;
  vocabulary_filter_name: string option }
type nonrec vocabulary_filter_method =
  | TAG 
  | MASK 
  | REMOVE 
type nonrec update_vocabulary_response =
  {
  vocabulary_state: vocabulary_state option ;
  last_modified_time: CoreTypes.Timestamp.t option ;
  language_code: language_code option ;
  vocabulary_name: string option }
type nonrec update_vocabulary_request =
  {
  data_access_role_arn: string option ;
  vocabulary_file_uri: string option ;
  phrases: string list option ;
  language_code: language_code ;
  vocabulary_name: string }
type nonrec update_vocabulary_filter_response =
  {
  last_modified_time: CoreTypes.Timestamp.t option ;
  language_code: language_code option ;
  vocabulary_filter_name: string option }
type nonrec update_vocabulary_filter_request =
  {
  data_access_role_arn: string option ;
  vocabulary_filter_file_uri: string option ;
  words: string list option ;
  vocabulary_filter_name: string }
type nonrec not_found_exception = {
  message: string option }
type nonrec limit_exceeded_exception = {
  message: string option }
type nonrec internal_failure_exception = {
  message: string option }
type nonrec bad_request_exception = {
  message: string option }
type nonrec conflict_exception = {
  message: string option }
type nonrec update_medical_vocabulary_response =
  {
  vocabulary_state: vocabulary_state option ;
  last_modified_time: CoreTypes.Timestamp.t option ;
  language_code: language_code option ;
  vocabulary_name: string option }
type nonrec update_medical_vocabulary_request =
  {
  vocabulary_file_uri: string ;
  language_code: language_code ;
  vocabulary_name: string }
type nonrec absolute_time_range =
  {
  last: int option ;
  first: int option ;
  end_time: int option ;
  start_time: int option }
type nonrec relative_time_range =
  {
  last: int option ;
  first: int option ;
  end_percentage: int option ;
  start_percentage: int option }
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
type nonrec sentiment_filter =
  {
  negate: bool option ;
  participant_role: participant_role option ;
  relative_time_range: relative_time_range option ;
  absolute_time_range: absolute_time_range option ;
  sentiments: sentiment_value list }
type nonrec rule =
  | SentimentFilter of sentiment_filter 
  | TranscriptFilter of transcript_filter 
  | InterruptionFilter of interruption_filter 
  | NonTalkTimeFilter of non_talk_time_filter 
type nonrec input_type =
  | POST_CALL 
  | REAL_TIME 
type nonrec category_properties =
  {
  input_type: input_type option ;
  last_update_time: CoreTypes.Timestamp.t option ;
  create_time: CoreTypes.Timestamp.t option ;
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
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_arn: string }
type nonrec type_ =
  | DICTATION 
  | CONVERSATION 
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
type nonrec content_redaction =
  {
  pii_entity_types: pii_entity_type list option ;
  redaction_output: redaction_output ;
  redaction_type: redaction_type }
type nonrec model_settings = {
  language_model_name: string option }
type nonrec language_code_item =
  {
  duration_in_seconds: float option ;
  language_code: language_code option }
type nonrec toxicity_category =
  | ALL 
type nonrec toxicity_detection_settings =
  {
  toxicity_categories: toxicity_category list }
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
  completion_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  creation_time: CoreTypes.Timestamp.t option ;
  transcription_job_name: string option }
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
type nonrec tag = {
  value: string ;
  key: string }
type nonrec subtitle_format =
  | SRT 
  | VTT 
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
  (language_code * language_id_settings) list
type nonrec transcription_job =
  {
  toxicity_detection: toxicity_detection_settings list option ;
  language_id_settings: language_id_settings_map option ;
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
  completion_time: CoreTypes.Timestamp.t option ;
  creation_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
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
type nonrec kms_encryption_context_map = (string * string) list
type nonrec subtitles =
  {
  output_start_index: int option ;
  formats: subtitle_format list option }
type nonrec start_transcription_job_request =
  {
  toxicity_detection: toxicity_detection_settings list option ;
  language_id_settings: language_id_settings_map option ;
  tags: tag list option ;
  subtitles: subtitles option ;
  language_options: language_code list option ;
  identify_multiple_languages: bool option ;
  identify_language: bool option ;
  content_redaction: content_redaction option ;
  job_execution_settings: job_execution_settings option ;
  model_settings: model_settings option ;
  settings: settings option ;
  kms_encryption_context: kms_encryption_context_map option ;
  output_encryption_kms_key_id: string option ;
  output_key: string option ;
  output_bucket_name: string option ;
  media: media ;
  media_format: media_format option ;
  media_sample_rate_hertz: int option ;
  language_code: language_code option ;
  transcription_job_name: string }
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
  completion_time: CoreTypes.Timestamp.t option ;
  creation_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
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
  kms_encryption_context: kms_encryption_context_map option ;
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
type nonrec medical_scribe_participant_role =
  | CLINICIAN 
  | PATIENT 
type nonrec medical_scribe_channel_definition =
  {
  participant_role: medical_scribe_participant_role ;
  channel_id: int }
type nonrec medical_scribe_job =
  {
  tags: tag list option ;
  channel_definitions: medical_scribe_channel_definition list option ;
  data_access_role_arn: string option ;
  settings: medical_scribe_settings option ;
  failure_reason: string option ;
  completion_time: CoreTypes.Timestamp.t option ;
  creation_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
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
  kms_encryption_context: kms_encryption_context_map option ;
  output_encryption_kms_key_id: string option ;
  output_bucket_name: string ;
  media: media ;
  medical_scribe_job_name: string }
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
type nonrec call_analytics_job_details =
  {
  skipped: call_analytics_skipped_feature list option }
type nonrec summarization = {
  generate_abstractive_summary: bool }
type nonrec call_analytics_job_settings =
  {
  summarization: summarization option ;
  language_id_settings: language_id_settings_map option ;
  language_options: language_code list option ;
  content_redaction: content_redaction option ;
  language_model_name: string option ;
  vocabulary_filter_method: vocabulary_filter_method option ;
  vocabulary_filter_name: string option ;
  vocabulary_name: string option }
type nonrec channel_definition =
  {
  participant_role: participant_role option ;
  channel_id: int option }
type nonrec call_analytics_job =
  {
  channel_definitions: channel_definition list option ;
  settings: call_analytics_job_settings option ;
  identified_language_score: float option ;
  data_access_role_arn: string option ;
  failure_reason: string option ;
  completion_time: CoreTypes.Timestamp.t option ;
  creation_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
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
type nonrec list_vocabulary_filters_response =
  {
  vocabulary_filters: vocabulary_filter_info list option ;
  next_token: string option }
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
  completion_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  creation_time: CoreTypes.Timestamp.t option ;
  medical_transcription_job_name: string option }
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
  completion_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  creation_time: CoreTypes.Timestamp.t option ;
  medical_scribe_job_name: string option }
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
  last_modified_time: CoreTypes.Timestamp.t option ;
  create_time: CoreTypes.Timestamp.t option ;
  model_name: string option }
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
  completion_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  creation_time: CoreTypes.Timestamp.t option ;
  call_analytics_job_name: string option }
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
  last_modified_time: CoreTypes.Timestamp.t option ;
  language_code: language_code option ;
  vocabulary_filter_name: string option }
type nonrec get_vocabulary_filter_request = {
  vocabulary_filter_name: string }
type nonrec get_vocabulary_response =
  {
  download_uri: string option ;
  failure_reason: string option ;
  last_modified_time: CoreTypes.Timestamp.t option ;
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
  last_modified_time: CoreTypes.Timestamp.t option ;
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
  last_modified_time: CoreTypes.Timestamp.t option ;
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
  last_modified_time: CoreTypes.Timestamp.t option ;
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
  last_modified_time: CoreTypes.Timestamp.t option ;
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
  category_name: string }(** {1:builders Builders} *)

val make_vocabulary_info :
  ?vocabulary_state:vocabulary_state ->
    ?last_modified_time:CoreTypes.Timestamp.t ->
      ?language_code:language_code ->
        ?vocabulary_name:string -> unit -> vocabulary_info
val make_vocabulary_filter_info :
  ?last_modified_time:CoreTypes.Timestamp.t ->
    ?language_code:language_code ->
      ?vocabulary_filter_name:string -> unit -> vocabulary_filter_info
val make_update_vocabulary_response :
  ?vocabulary_state:vocabulary_state ->
    ?last_modified_time:CoreTypes.Timestamp.t ->
      ?language_code:language_code ->
        ?vocabulary_name:string -> unit -> update_vocabulary_response
val make_update_vocabulary_request :
  ?data_access_role_arn:string ->
    ?vocabulary_file_uri:string ->
      ?phrases:string list ->
        language_code:language_code ->
          vocabulary_name:string -> unit -> update_vocabulary_request
val make_update_vocabulary_filter_response :
  ?last_modified_time:CoreTypes.Timestamp.t ->
    ?language_code:language_code ->
      ?vocabulary_filter_name:string ->
        unit -> update_vocabulary_filter_response
val make_update_vocabulary_filter_request :
  ?data_access_role_arn:string ->
    ?vocabulary_filter_file_uri:string ->
      ?words:string list ->
        vocabulary_filter_name:string ->
          unit -> update_vocabulary_filter_request
val make_update_medical_vocabulary_response :
  ?vocabulary_state:vocabulary_state ->
    ?last_modified_time:CoreTypes.Timestamp.t ->
      ?language_code:language_code ->
        ?vocabulary_name:string -> unit -> update_medical_vocabulary_response
val make_update_medical_vocabulary_request :
  vocabulary_file_uri:string ->
    language_code:language_code ->
      vocabulary_name:string -> unit -> update_medical_vocabulary_request
val make_absolute_time_range :
  ?last:int ->
    ?first:int ->
      ?end_time:int -> ?start_time:int -> unit -> absolute_time_range
val make_relative_time_range :
  ?last:int ->
    ?first:int ->
      ?end_percentage:int ->
        ?start_percentage:int -> unit -> relative_time_range
val make_non_talk_time_filter :
  ?negate:bool ->
    ?relative_time_range:relative_time_range ->
      ?absolute_time_range:absolute_time_range ->
        ?threshold:int -> unit -> non_talk_time_filter
val make_interruption_filter :
  ?negate:bool ->
    ?relative_time_range:relative_time_range ->
      ?absolute_time_range:absolute_time_range ->
        ?participant_role:participant_role ->
          ?threshold:int -> unit -> interruption_filter
val make_transcript_filter :
  ?negate:bool ->
    ?participant_role:participant_role ->
      ?relative_time_range:relative_time_range ->
        ?absolute_time_range:absolute_time_range ->
          targets:string list ->
            transcript_filter_type:transcript_filter_type ->
              unit -> transcript_filter
val make_sentiment_filter :
  ?negate:bool ->
    ?participant_role:participant_role ->
      ?relative_time_range:relative_time_range ->
        ?absolute_time_range:absolute_time_range ->
          sentiments:sentiment_value list -> unit -> sentiment_filter
val make_category_properties :
  ?input_type:input_type ->
    ?last_update_time:CoreTypes.Timestamp.t ->
      ?create_time:CoreTypes.Timestamp.t ->
        ?rules:rule list ->
          ?category_name:string -> unit -> category_properties
val make_update_call_analytics_category_response :
  ?category_properties:category_properties ->
    unit -> update_call_analytics_category_response
val make_update_call_analytics_category_request :
  ?input_type:input_type ->
    rules:rule list ->
      category_name:string -> unit -> update_call_analytics_category_request
val make_untag_resource_response : unit -> untag_resource_response
val make_untag_resource_request :
  tag_keys:string list ->
    resource_arn:string -> unit -> untag_resource_request
val make_content_redaction :
  ?pii_entity_types:pii_entity_type list ->
    redaction_output:redaction_output ->
      redaction_type:redaction_type -> unit -> content_redaction
val make_model_settings :
  ?language_model_name:string -> unit -> model_settings
val make_language_code_item :
  ?duration_in_seconds:float ->
    ?language_code:language_code -> unit -> language_code_item
val make_toxicity_detection_settings :
  toxicity_categories:toxicity_category list ->
    unit -> toxicity_detection_settings
val make_transcription_job_summary :
  ?toxicity_detection:toxicity_detection_settings list ->
    ?language_codes:language_code_item list ->
      ?identified_language_score:float ->
        ?identify_multiple_languages:bool ->
          ?identify_language:bool ->
            ?model_settings:model_settings ->
              ?content_redaction:content_redaction ->
                ?output_location_type:output_location_type ->
                  ?failure_reason:string ->
                    ?transcription_job_status:transcription_job_status ->
                      ?language_code:language_code ->
                        ?completion_time:CoreTypes.Timestamp.t ->
                          ?start_time:CoreTypes.Timestamp.t ->
                            ?creation_time:CoreTypes.Timestamp.t ->
                              ?transcription_job_name:string ->
                                unit -> transcription_job_summary
val make_media :
  ?redacted_media_file_uri:string -> ?media_file_uri:string -> unit -> media
val make_transcript :
  ?redacted_transcript_file_uri:string ->
    ?transcript_file_uri:string -> unit -> transcript
val make_settings :
  ?vocabulary_filter_method:vocabulary_filter_method ->
    ?vocabulary_filter_name:string ->
      ?max_alternatives:int ->
        ?show_alternatives:bool ->
          ?channel_identification:bool ->
            ?max_speaker_labels:int ->
              ?show_speaker_labels:bool ->
                ?vocabulary_name:string -> unit -> settings
val make_job_execution_settings :
  ?data_access_role_arn:string ->
    ?allow_deferred_execution:bool -> unit -> job_execution_settings
val make_tag : value:string -> key:string -> unit -> tag
val make_subtitles_output :
  ?output_start_index:int ->
    ?subtitle_file_uris:string list ->
      ?formats:subtitle_format list -> unit -> subtitles_output
val make_language_id_settings :
  ?language_model_name:string ->
    ?vocabulary_filter_name:string ->
      ?vocabulary_name:string -> unit -> language_id_settings
val make_transcription_job :
  ?toxicity_detection:toxicity_detection_settings list ->
    ?language_id_settings:language_id_settings_map ->
      ?subtitles:subtitles_output ->
        ?tags:tag list ->
          ?language_codes:language_code_item list ->
            ?identified_language_score:float ->
              ?language_options:language_code list ->
                ?identify_multiple_languages:bool ->
                  ?identify_language:bool ->
                    ?content_redaction:content_redaction ->
                      ?job_execution_settings:job_execution_settings ->
                        ?model_settings:model_settings ->
                          ?settings:settings ->
                            ?failure_reason:string ->
                              ?completion_time:CoreTypes.Timestamp.t ->
                                ?creation_time:CoreTypes.Timestamp.t ->
                                  ?start_time:CoreTypes.Timestamp.t ->
                                    ?transcript:transcript ->
                                      ?media:media ->
                                        ?media_format:media_format ->
                                          ?media_sample_rate_hertz:int ->
                                            ?language_code:language_code ->
                                              ?transcription_job_status:transcription_job_status
                                                ->
                                                ?transcription_job_name:string
                                                  ->
                                                  unit -> transcription_job
val make_tag_resource_response : unit -> tag_resource_response
val make_tag_resource_request :
  tags:tag list -> resource_arn:string -> unit -> tag_resource_request
val make_start_transcription_job_response :
  ?transcription_job:transcription_job ->
    unit -> start_transcription_job_response
val make_subtitles :
  ?output_start_index:int ->
    ?formats:subtitle_format list -> unit -> subtitles
val make_start_transcription_job_request :
  ?toxicity_detection:toxicity_detection_settings list ->
    ?language_id_settings:language_id_settings_map ->
      ?tags:tag list ->
        ?subtitles:subtitles ->
          ?language_options:language_code list ->
            ?identify_multiple_languages:bool ->
              ?identify_language:bool ->
                ?content_redaction:content_redaction ->
                  ?job_execution_settings:job_execution_settings ->
                    ?model_settings:model_settings ->
                      ?settings:settings ->
                        ?kms_encryption_context:kms_encryption_context_map ->
                          ?output_encryption_kms_key_id:string ->
                            ?output_key:string ->
                              ?output_bucket_name:string ->
                                ?media_format:media_format ->
                                  ?media_sample_rate_hertz:int ->
                                    ?language_code:language_code ->
                                      media:media ->
                                        transcription_job_name:string ->
                                          unit ->
                                            start_transcription_job_request
val make_medical_transcript :
  ?transcript_file_uri:string -> unit -> medical_transcript
val make_medical_transcription_setting :
  ?vocabulary_name:string ->
    ?max_alternatives:int ->
      ?show_alternatives:bool ->
        ?channel_identification:bool ->
          ?max_speaker_labels:int ->
            ?show_speaker_labels:bool ->
              unit -> medical_transcription_setting
val make_medical_transcription_job :
  ?tags:tag list ->
    ?type_:type_ ->
      ?specialty:specialty ->
        ?content_identification_type:medical_content_identification_type ->
          ?settings:medical_transcription_setting ->
            ?failure_reason:string ->
              ?completion_time:CoreTypes.Timestamp.t ->
                ?creation_time:CoreTypes.Timestamp.t ->
                  ?start_time:CoreTypes.Timestamp.t ->
                    ?transcript:medical_transcript ->
                      ?media:media ->
                        ?media_format:media_format ->
                          ?media_sample_rate_hertz:int ->
                            ?language_code:language_code ->
                              ?transcription_job_status:transcription_job_status
                                ->
                                ?medical_transcription_job_name:string ->
                                  unit -> medical_transcription_job
val make_start_medical_transcription_job_response :
  ?medical_transcription_job:medical_transcription_job ->
    unit -> start_medical_transcription_job_response
val make_start_medical_transcription_job_request :
  ?tags:tag list ->
    ?content_identification_type:medical_content_identification_type ->
      ?settings:medical_transcription_setting ->
        ?kms_encryption_context:kms_encryption_context_map ->
          ?output_encryption_kms_key_id:string ->
            ?output_key:string ->
              ?media_format:media_format ->
                ?media_sample_rate_hertz:int ->
                  type_:type_ ->
                    specialty:specialty ->
                      output_bucket_name:string ->
                        media:media ->
                          language_code:language_code ->
                            medical_transcription_job_name:string ->
                              unit -> start_medical_transcription_job_request
val make_medical_scribe_output :
  clinical_document_uri:string ->
    transcript_file_uri:string -> unit -> medical_scribe_output
val make_medical_scribe_settings :
  ?vocabulary_filter_method:vocabulary_filter_method ->
    ?vocabulary_filter_name:string ->
      ?vocabulary_name:string ->
        ?channel_identification:bool ->
          ?max_speaker_labels:int ->
            ?show_speaker_labels:bool -> unit -> medical_scribe_settings
val make_medical_scribe_channel_definition :
  participant_role:medical_scribe_participant_role ->
    channel_id:int -> unit -> medical_scribe_channel_definition
val make_medical_scribe_job :
  ?tags:tag list ->
    ?channel_definitions:medical_scribe_channel_definition list ->
      ?data_access_role_arn:string ->
        ?settings:medical_scribe_settings ->
          ?failure_reason:string ->
            ?completion_time:CoreTypes.Timestamp.t ->
              ?creation_time:CoreTypes.Timestamp.t ->
                ?start_time:CoreTypes.Timestamp.t ->
                  ?medical_scribe_output:medical_scribe_output ->
                    ?media:media ->
                      ?language_code:medical_scribe_language_code ->
                        ?medical_scribe_job_status:medical_scribe_job_status
                          ->
                          ?medical_scribe_job_name:string ->
                            unit -> medical_scribe_job
val make_start_medical_scribe_job_response :
  ?medical_scribe_job:medical_scribe_job ->
    unit -> start_medical_scribe_job_response
val make_start_medical_scribe_job_request :
  ?tags:tag list ->
    ?channel_definitions:medical_scribe_channel_definition list ->
      ?kms_encryption_context:kms_encryption_context_map ->
        ?output_encryption_kms_key_id:string ->
          settings:medical_scribe_settings ->
            data_access_role_arn:string ->
              output_bucket_name:string ->
                media:media ->
                  medical_scribe_job_name:string ->
                    unit -> start_medical_scribe_job_request
val make_call_analytics_skipped_feature :
  ?message:string ->
    ?reason_code:call_analytics_skipped_reason_code ->
      ?feature:call_analytics_feature ->
        unit -> call_analytics_skipped_feature
val make_call_analytics_job_details :
  ?skipped:call_analytics_skipped_feature list ->
    unit -> call_analytics_job_details
val make_summarization :
  generate_abstractive_summary:bool -> unit -> summarization
val make_call_analytics_job_settings :
  ?summarization:summarization ->
    ?language_id_settings:language_id_settings_map ->
      ?language_options:language_code list ->
        ?content_redaction:content_redaction ->
          ?language_model_name:string ->
            ?vocabulary_filter_method:vocabulary_filter_method ->
              ?vocabulary_filter_name:string ->
                ?vocabulary_name:string ->
                  unit -> call_analytics_job_settings
val make_channel_definition :
  ?participant_role:participant_role ->
    ?channel_id:int -> unit -> channel_definition
val make_call_analytics_job :
  ?channel_definitions:channel_definition list ->
    ?settings:call_analytics_job_settings ->
      ?identified_language_score:float ->
        ?data_access_role_arn:string ->
          ?failure_reason:string ->
            ?completion_time:CoreTypes.Timestamp.t ->
              ?creation_time:CoreTypes.Timestamp.t ->
                ?start_time:CoreTypes.Timestamp.t ->
                  ?transcript:transcript ->
                    ?media:media ->
                      ?media_format:media_format ->
                        ?media_sample_rate_hertz:int ->
                          ?language_code:language_code ->
                            ?call_analytics_job_details:call_analytics_job_details
                              ->
                              ?call_analytics_job_status:call_analytics_job_status
                                ->
                                ?call_analytics_job_name:string ->
                                  unit -> call_analytics_job
val make_start_call_analytics_job_response :
  ?call_analytics_job:call_analytics_job ->
    unit -> start_call_analytics_job_response
val make_start_call_analytics_job_request :
  ?channel_definitions:channel_definition list ->
    ?settings:call_analytics_job_settings ->
      ?data_access_role_arn:string ->
        ?output_encryption_kms_key_id:string ->
          ?output_location:string ->
            media:media ->
              call_analytics_job_name:string ->
                unit -> start_call_analytics_job_request
val make_list_vocabulary_filters_response :
  ?vocabulary_filters:vocabulary_filter_info list ->
    ?next_token:string -> unit -> list_vocabulary_filters_response
val make_list_vocabulary_filters_request :
  ?name_contains:string ->
    ?max_results:int ->
      ?next_token:string -> unit -> list_vocabulary_filters_request
val make_list_vocabularies_response :
  ?vocabularies:vocabulary_info list ->
    ?next_token:string ->
      ?status:vocabulary_state -> unit -> list_vocabularies_response
val make_list_vocabularies_request :
  ?name_contains:string ->
    ?state_equals:vocabulary_state ->
      ?max_results:int ->
        ?next_token:string -> unit -> list_vocabularies_request
val make_list_transcription_jobs_response :
  ?transcription_job_summaries:transcription_job_summary list ->
    ?next_token:string ->
      ?status:transcription_job_status ->
        unit -> list_transcription_jobs_response
val make_list_transcription_jobs_request :
  ?max_results:int ->
    ?next_token:string ->
      ?job_name_contains:string ->
        ?status:transcription_job_status ->
          unit -> list_transcription_jobs_request
val make_list_tags_for_resource_response :
  ?tags:tag list ->
    ?resource_arn:string -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_arn:string -> unit -> list_tags_for_resource_request
val make_list_medical_vocabularies_response :
  ?vocabularies:vocabulary_info list ->
    ?next_token:string ->
      ?status:vocabulary_state -> unit -> list_medical_vocabularies_response
val make_list_medical_vocabularies_request :
  ?name_contains:string ->
    ?state_equals:vocabulary_state ->
      ?max_results:int ->
        ?next_token:string -> unit -> list_medical_vocabularies_request
val make_medical_transcription_job_summary :
  ?type_:type_ ->
    ?content_identification_type:medical_content_identification_type ->
      ?specialty:specialty ->
        ?output_location_type:output_location_type ->
          ?failure_reason:string ->
            ?transcription_job_status:transcription_job_status ->
              ?language_code:language_code ->
                ?completion_time:CoreTypes.Timestamp.t ->
                  ?start_time:CoreTypes.Timestamp.t ->
                    ?creation_time:CoreTypes.Timestamp.t ->
                      ?medical_transcription_job_name:string ->
                        unit -> medical_transcription_job_summary
val make_list_medical_transcription_jobs_response :
  ?medical_transcription_job_summaries:medical_transcription_job_summary list
    ->
    ?next_token:string ->
      ?status:transcription_job_status ->
        unit -> list_medical_transcription_jobs_response
val make_list_medical_transcription_jobs_request :
  ?max_results:int ->
    ?next_token:string ->
      ?job_name_contains:string ->
        ?status:transcription_job_status ->
          unit -> list_medical_transcription_jobs_request
val make_medical_scribe_job_summary :
  ?failure_reason:string ->
    ?medical_scribe_job_status:medical_scribe_job_status ->
      ?language_code:medical_scribe_language_code ->
        ?completion_time:CoreTypes.Timestamp.t ->
          ?start_time:CoreTypes.Timestamp.t ->
            ?creation_time:CoreTypes.Timestamp.t ->
              ?medical_scribe_job_name:string ->
                unit -> medical_scribe_job_summary
val make_list_medical_scribe_jobs_response :
  ?medical_scribe_job_summaries:medical_scribe_job_summary list ->
    ?next_token:string ->
      ?status:medical_scribe_job_status ->
        unit -> list_medical_scribe_jobs_response
val make_list_medical_scribe_jobs_request :
  ?max_results:int ->
    ?next_token:string ->
      ?job_name_contains:string ->
        ?status:medical_scribe_job_status ->
          unit -> list_medical_scribe_jobs_request
val make_input_data_config :
  ?tuning_data_s3_uri:string ->
    data_access_role_arn:string -> s3_uri:string -> unit -> input_data_config
val make_language_model :
  ?input_data_config:input_data_config ->
    ?failure_reason:string ->
      ?upgrade_availability:bool ->
        ?model_status:model_status ->
          ?base_model_name:base_model_name ->
            ?language_code:clm_language_code ->
              ?last_modified_time:CoreTypes.Timestamp.t ->
                ?create_time:CoreTypes.Timestamp.t ->
                  ?model_name:string -> unit -> language_model
val make_list_language_models_response :
  ?models:language_model list ->
    ?next_token:string -> unit -> list_language_models_response
val make_list_language_models_request :
  ?max_results:int ->
    ?next_token:string ->
      ?name_contains:string ->
        ?status_equals:model_status -> unit -> list_language_models_request
val make_call_analytics_job_summary :
  ?failure_reason:string ->
    ?call_analytics_job_details:call_analytics_job_details ->
      ?call_analytics_job_status:call_analytics_job_status ->
        ?language_code:language_code ->
          ?completion_time:CoreTypes.Timestamp.t ->
            ?start_time:CoreTypes.Timestamp.t ->
              ?creation_time:CoreTypes.Timestamp.t ->
                ?call_analytics_job_name:string ->
                  unit -> call_analytics_job_summary
val make_list_call_analytics_jobs_response :
  ?call_analytics_job_summaries:call_analytics_job_summary list ->
    ?next_token:string ->
      ?status:call_analytics_job_status ->
        unit -> list_call_analytics_jobs_response
val make_list_call_analytics_jobs_request :
  ?max_results:int ->
    ?next_token:string ->
      ?job_name_contains:string ->
        ?status:call_analytics_job_status ->
          unit -> list_call_analytics_jobs_request
val make_list_call_analytics_categories_response :
  ?categories:category_properties list ->
    ?next_token:string -> unit -> list_call_analytics_categories_response
val make_list_call_analytics_categories_request :
  ?max_results:int ->
    ?next_token:string -> unit -> list_call_analytics_categories_request
val make_get_vocabulary_filter_response :
  ?download_uri:string ->
    ?last_modified_time:CoreTypes.Timestamp.t ->
      ?language_code:language_code ->
        ?vocabulary_filter_name:string ->
          unit -> get_vocabulary_filter_response
val make_get_vocabulary_filter_request :
  vocabulary_filter_name:string -> unit -> get_vocabulary_filter_request
val make_get_vocabulary_response :
  ?download_uri:string ->
    ?failure_reason:string ->
      ?last_modified_time:CoreTypes.Timestamp.t ->
        ?vocabulary_state:vocabulary_state ->
          ?language_code:language_code ->
            ?vocabulary_name:string -> unit -> get_vocabulary_response
val make_get_vocabulary_request :
  vocabulary_name:string -> unit -> get_vocabulary_request
val make_get_transcription_job_response :
  ?transcription_job:transcription_job ->
    unit -> get_transcription_job_response
val make_get_transcription_job_request :
  transcription_job_name:string -> unit -> get_transcription_job_request
val make_get_medical_vocabulary_response :
  ?download_uri:string ->
    ?failure_reason:string ->
      ?last_modified_time:CoreTypes.Timestamp.t ->
        ?vocabulary_state:vocabulary_state ->
          ?language_code:language_code ->
            ?vocabulary_name:string ->
              unit -> get_medical_vocabulary_response
val make_get_medical_vocabulary_request :
  vocabulary_name:string -> unit -> get_medical_vocabulary_request
val make_get_medical_transcription_job_response :
  ?medical_transcription_job:medical_transcription_job ->
    unit -> get_medical_transcription_job_response
val make_get_medical_transcription_job_request :
  medical_transcription_job_name:string ->
    unit -> get_medical_transcription_job_request
val make_get_medical_scribe_job_response :
  ?medical_scribe_job:medical_scribe_job ->
    unit -> get_medical_scribe_job_response
val make_get_medical_scribe_job_request :
  medical_scribe_job_name:string -> unit -> get_medical_scribe_job_request
val make_get_call_analytics_job_response :
  ?call_analytics_job:call_analytics_job ->
    unit -> get_call_analytics_job_response
val make_get_call_analytics_job_request :
  call_analytics_job_name:string -> unit -> get_call_analytics_job_request
val make_get_call_analytics_category_response :
  ?category_properties:category_properties ->
    unit -> get_call_analytics_category_response
val make_get_call_analytics_category_request :
  category_name:string -> unit -> get_call_analytics_category_request
val make_describe_language_model_response :
  ?language_model:language_model -> unit -> describe_language_model_response
val make_describe_language_model_request :
  model_name:string -> unit -> describe_language_model_request
val make_delete_vocabulary_filter_request :
  vocabulary_filter_name:string -> unit -> delete_vocabulary_filter_request
val make_delete_vocabulary_request :
  vocabulary_name:string -> unit -> delete_vocabulary_request
val make_delete_transcription_job_request :
  transcription_job_name:string -> unit -> delete_transcription_job_request
val make_delete_medical_vocabulary_request :
  vocabulary_name:string -> unit -> delete_medical_vocabulary_request
val make_delete_medical_transcription_job_request :
  medical_transcription_job_name:string ->
    unit -> delete_medical_transcription_job_request
val make_delete_medical_scribe_job_request :
  medical_scribe_job_name:string -> unit -> delete_medical_scribe_job_request
val make_delete_language_model_request :
  model_name:string -> unit -> delete_language_model_request
val make_delete_call_analytics_job_response :
  unit -> delete_call_analytics_job_response
val make_delete_call_analytics_job_request :
  call_analytics_job_name:string -> unit -> delete_call_analytics_job_request
val make_delete_call_analytics_category_response :
  unit -> delete_call_analytics_category_response
val make_delete_call_analytics_category_request :
  category_name:string -> unit -> delete_call_analytics_category_request
val make_create_vocabulary_filter_response :
  ?last_modified_time:CoreTypes.Timestamp.t ->
    ?language_code:language_code ->
      ?vocabulary_filter_name:string ->
        unit -> create_vocabulary_filter_response
val make_create_vocabulary_filter_request :
  ?data_access_role_arn:string ->
    ?tags:tag list ->
      ?vocabulary_filter_file_uri:string ->
        ?words:string list ->
          language_code:language_code ->
            vocabulary_filter_name:string ->
              unit -> create_vocabulary_filter_request
val make_create_vocabulary_response :
  ?failure_reason:string ->
    ?last_modified_time:CoreTypes.Timestamp.t ->
      ?vocabulary_state:vocabulary_state ->
        ?language_code:language_code ->
          ?vocabulary_name:string -> unit -> create_vocabulary_response
val make_create_vocabulary_request :
  ?data_access_role_arn:string ->
    ?tags:tag list ->
      ?vocabulary_file_uri:string ->
        ?phrases:string list ->
          language_code:language_code ->
            vocabulary_name:string -> unit -> create_vocabulary_request
val make_create_medical_vocabulary_response :
  ?failure_reason:string ->
    ?last_modified_time:CoreTypes.Timestamp.t ->
      ?vocabulary_state:vocabulary_state ->
        ?language_code:language_code ->
          ?vocabulary_name:string ->
            unit -> create_medical_vocabulary_response
val make_create_medical_vocabulary_request :
  ?tags:tag list ->
    vocabulary_file_uri:string ->
      language_code:language_code ->
        vocabulary_name:string -> unit -> create_medical_vocabulary_request
val make_create_language_model_response :
  ?model_status:model_status ->
    ?input_data_config:input_data_config ->
      ?model_name:string ->
        ?base_model_name:base_model_name ->
          ?language_code:clm_language_code ->
            unit -> create_language_model_response
val make_create_language_model_request :
  ?tags:tag list ->
    input_data_config:input_data_config ->
      model_name:string ->
        base_model_name:base_model_name ->
          language_code:clm_language_code ->
            unit -> create_language_model_request
val make_create_call_analytics_category_response :
  ?category_properties:category_properties ->
    unit -> create_call_analytics_category_response
val make_create_call_analytics_category_request :
  ?input_type:input_type ->
    rules:rule list ->
      category_name:string -> unit -> create_call_analytics_category_request(** {1:operations Operations} *)

module CreateCallAnalyticsCategory : sig
  val request :
    Smaws_Lib.Context.t ->
      create_call_analytics_category_request ->
        (create_call_analytics_category_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Creates a new Call Analytics category.
    
     All categories are automatically applied to your Call Analytics transcriptions. Note that in order to apply categories to your transcriptions, you must create them before submitting your transcription request, as categories cannot be applied retroactively.
     
      When creating a new category, you can use the [InputType] parameter to label the category as a [POST_CALL] or a [REAL_TIME] category. [POST_CALL] categories can only be applied to post-call transcriptions and [REAL_TIME] categories can only be applied to real-time transcriptions. If you do not include [InputType], your category is created as a [POST_CALL] category by default.
      
       Call Analytics categories are composed of rules. For each category, you must create between 1 and 20 rules. Rules can include these parameters: , , , and .
       
        To update an existing category, see .
        
         To learn more about Call Analytics categories, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html}Creating categories for post-call transcriptions} and {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html}Creating categories for real-time transcriptions}.
          *)

  
end

module CreateLanguageModel : sig
  val request :
    Smaws_Lib.Context.t ->
      create_language_model_request ->
        (create_language_model_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Creates a new custom language model.
    
     When creating a new custom language model, you must specify:
     
      {ul
           {- If you want a Wideband (audio sample rates over 16,000 Hz) or Narrowband (audio sample rates under 16,000 Hz) base model
              
              }
            {- The location of your training and tuning files (this must be an Amazon S3 URI)
               
               }
            {- The language of your model
               
               }
            {- A unique name for your model
               
               }
           
      }
       *)

  
end

module CreateMedicalVocabulary : sig
  val request :
    Smaws_Lib.Context.t ->
      create_medical_vocabulary_request ->
        (create_medical_vocabulary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Creates a new custom medical vocabulary.
    
     Before creating a new custom medical vocabulary, you must first upload a text file that contains your vocabulary table into an Amazon S3 bucket. Note that this differs from , where you can include a list of terms within your request using the [Phrases] flag; [CreateMedicalVocabulary] does not support the [Phrases] flag and only accepts vocabularies in table format.
     
      Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary request fails. Refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html}Character Sets for Custom Vocabularies} to get the character set for your language.
      
       For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html}Custom vocabularies}.
        *)

  
end

module CreateVocabulary : sig
  val request :
    Smaws_Lib.Context.t ->
      create_vocabulary_request ->
        (create_vocabulary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Creates a new custom vocabulary.
    
     When creating a new custom vocabulary, you can either upload a text file that contains your new entries, phrases, and terms into an Amazon S3 bucket and include the URI in your request. Or you can include a list of terms directly in your request using the [Phrases] flag.
     
      Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary request fails. Refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html}Character Sets for Custom Vocabularies} to get the character set for your language.
      
       For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html}Custom vocabularies}.
        *)

  
end

module CreateVocabularyFilter : sig
  val request :
    Smaws_Lib.Context.t ->
      create_vocabulary_filter_request ->
        (create_vocabulary_filter_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Creates a new custom vocabulary filter.
    
     You can use custom vocabulary filters to mask, delete, or flag specific words from your transcript. Custom vocabulary filters are commonly used to mask profanity in transcripts.
     
      Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary filter request fails. Refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html}Character Sets for Custom Vocabularies} to get the character set for your language.
      
       For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/vocabulary-filtering.html}Vocabulary filtering}.
        *)

  
end

module DeleteCallAnalyticsCategory : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_call_analytics_category_request ->
        (delete_call_analytics_category_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Deletes a Call Analytics category. To use this operation, specify the name of the category you want to delete using [CategoryName]. Category names are case sensitive.
     *)

  
end

module DeleteCallAnalyticsJob : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_call_analytics_job_request ->
        (delete_call_analytics_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Deletes a Call Analytics job. To use this operation, specify the name of the job you want to delete using [CallAnalyticsJobName]. Job names are case sensitive.
     *)

  
end

module DeleteLanguageModel : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_language_model_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Deletes a custom language model. To use this operation, specify the name of the language model you want to delete using [ModelName]. custom language model names are case sensitive.
     *)

  
end

module DeleteMedicalScribeJob : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_medical_scribe_job_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Deletes a Medical Scribe job. To use this operation, specify the name of the job you want to delete using [MedicalScribeJobName]. Job names are case sensitive.
     *)

  
end

module DeleteMedicalTranscriptionJob : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_medical_transcription_job_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Deletes a medical transcription job. To use this operation, specify the name of the job you want to delete using [MedicalTranscriptionJobName]. Job names are case sensitive.
     *)

  
end

module DeleteMedicalVocabulary : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_medical_vocabulary_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Deletes a custom medical vocabulary. To use this operation, specify the name of the custom vocabulary you want to delete using [VocabularyName]. Custom vocabulary names are case sensitive.
     *)

  
end

module DeleteTranscriptionJob : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_transcription_job_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Deletes a transcription job. To use this operation, specify the name of the job you want to delete using [TranscriptionJobName]. Job names are case sensitive.
     *)

  
end

module DeleteVocabulary : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_vocabulary_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Deletes a custom vocabulary. To use this operation, specify the name of the custom vocabulary you want to delete using [VocabularyName]. Custom vocabulary names are case sensitive.
     *)

  
end

module DeleteVocabularyFilter : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_vocabulary_filter_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Deletes a custom vocabulary filter. To use this operation, specify the name of the custom vocabulary filter you want to delete using [VocabularyFilterName]. Custom vocabulary filter names are case sensitive.
     *)

  
end

module DescribeLanguageModel : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_language_model_request ->
        (describe_language_model_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Provides information about the specified custom language model.
    
     This operation also shows if the base language model that you used to create your custom language model has been updated. If Amazon Transcribe has updated the base model, you can create a new custom language model using the updated base model.
     
      If you tried to create a new custom language model and the request wasn't successful, you can use [DescribeLanguageModel] to help identify the reason for this failure.
       *)

  
end

module GetCallAnalyticsCategory : sig
  val request :
    Smaws_Lib.Context.t ->
      get_call_analytics_category_request ->
        (get_call_analytics_category_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Provides information about the specified Call Analytics category.
    
     To get a list of your Call Analytics categories, use the operation.
      *)

  
end

module GetCallAnalyticsJob : sig
  val request :
    Smaws_Lib.Context.t ->
      get_call_analytics_job_request ->
        (get_call_analytics_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Provides information about the specified Call Analytics job.
    
     To view the job's status, refer to [CallAnalyticsJobStatus]. If the status is [COMPLETED], the job is finished. You can find your completed transcript at the URI specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.
     
      If you enabled personally identifiable information (PII) redaction, the redacted transcript appears at the location specified in [RedactedTranscriptFileUri].
      
       If you chose to redact the audio in your media file, you can find your redacted media file at the location specified in [RedactedMediaFileUri].
       
        To get a list of your Call Analytics jobs, use the operation.
         *)

  
end

module GetMedicalScribeJob : sig
  val request :
    Smaws_Lib.Context.t ->
      get_medical_scribe_job_request ->
        (get_medical_scribe_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Provides information about the specified Medical Scribe job.
    
     To view the status of the specified medical transcription job, check the [MedicalScribeJobStatus] field. If the status is [COMPLETED], the job is finished. You can find the results at the location specified in [MedicalScribeOutput]. If the status is [FAILED], [FailureReason] provides details on why your Medical Scribe job failed.
     
      To get a list of your Medical Scribe jobs, use the operation.
       *)

  
end

module GetMedicalTranscriptionJob : sig
  val request :
    Smaws_Lib.Context.t ->
      get_medical_transcription_job_request ->
        (get_medical_transcription_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Provides information about the specified medical transcription job.
    
     To view the status of the specified medical transcription job, check the [TranscriptionJobStatus] field. If the status is [COMPLETED], the job is finished. You can find the results at the location specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.
     
      To get a list of your medical transcription jobs, use the operation.
       *)

  
end

module GetMedicalVocabulary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_medical_vocabulary_request ->
        (get_medical_vocabulary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Provides information about the specified custom medical vocabulary.
    
     To view the status of the specified custom medical vocabulary, check the [VocabularyState] field. If the status is [READY], your custom vocabulary is available to use. If the status is [FAILED], [FailureReason] provides details on why your vocabulary failed.
     
      To get a list of your custom medical vocabularies, use the operation.
       *)

  
end

module GetTranscriptionJob : sig
  val request :
    Smaws_Lib.Context.t ->
      get_transcription_job_request ->
        (get_transcription_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Provides information about the specified transcription job.
    
     To view the status of the specified transcription job, check the [TranscriptionJobStatus] field. If the status is [COMPLETED], the job is finished. You can find the results at the location specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.
     
      If you enabled content redaction, the redacted transcript can be found at the location specified in [RedactedTranscriptFileUri].
      
       To get a list of your transcription jobs, use the operation.
        *)

  
end

module GetVocabulary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_vocabulary_request ->
        (get_vocabulary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Provides information about the specified custom vocabulary.
    
     To view the status of the specified custom vocabulary, check the [VocabularyState] field. If the status is [READY], your custom vocabulary is available to use. If the status is [FAILED], [FailureReason] provides details on why your custom vocabulary failed.
     
      To get a list of your custom vocabularies, use the operation.
       *)

  
end

module GetVocabularyFilter : sig
  val request :
    Smaws_Lib.Context.t ->
      get_vocabulary_filter_request ->
        (get_vocabulary_filter_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Provides information about the specified custom vocabulary filter.
    
     To get a list of your custom vocabulary filters, use the operation.
      *)

  
end

module ListCallAnalyticsCategories : sig
  val request :
    Smaws_Lib.Context.t ->
      list_call_analytics_categories_request ->
        (list_call_analytics_categories_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Provides a list of Call Analytics categories, including all rules that make up each category.
    
     To get detailed information about a specific Call Analytics category, use the operation.
      *)

  
end

module ListCallAnalyticsJobs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_call_analytics_jobs_request ->
        (list_call_analytics_jobs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Provides a list of Call Analytics jobs that match the specified criteria. If no criteria are specified, all Call Analytics jobs are returned.
    
     To get detailed information about a specific Call Analytics job, use the operation.
      *)

  
end

module ListLanguageModels : sig
  val request :
    Smaws_Lib.Context.t ->
      list_language_models_request ->
        (list_language_models_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Provides a list of custom language models that match the specified criteria. If no criteria are specified, all custom language models are returned.
    
     To get detailed information about a specific custom language model, use the operation.
      *)

  
end

module ListMedicalScribeJobs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_medical_scribe_jobs_request ->
        (list_medical_scribe_jobs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Provides a list of Medical Scribe jobs that match the specified criteria. If no criteria are specified, all Medical Scribe jobs are returned.
    
     To get detailed information about a specific Medical Scribe job, use the operation.
      *)

  
end

module ListMedicalTranscriptionJobs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_medical_transcription_jobs_request ->
        (list_medical_transcription_jobs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Provides a list of medical transcription jobs that match the specified criteria. If no criteria are specified, all medical transcription jobs are returned.
    
     To get detailed information about a specific medical transcription job, use the operation.
      *)

  
end

module ListMedicalVocabularies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_medical_vocabularies_request ->
        (list_medical_vocabularies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Provides a list of custom medical vocabularies that match the specified criteria. If no criteria are specified, all custom medical vocabularies are returned.
    
     To get detailed information about a specific custom medical vocabulary, use the operation.
      *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Lists all tags associated with the specified transcription job, vocabulary, model, or resource.
    
     To learn more about using tags with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html}Tagging resources}.
      *)

  
end

module ListTranscriptionJobs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_transcription_jobs_request ->
        (list_transcription_jobs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Provides a list of transcription jobs that match the specified criteria. If no criteria are specified, all transcription jobs are returned.
    
     To get detailed information about a specific transcription job, use the operation.
      *)

  
end

module ListVocabularies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_vocabularies_request ->
        (list_vocabularies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Provides a list of custom vocabularies that match the specified criteria. If no criteria are specified, all custom vocabularies are returned.
    
     To get detailed information about a specific custom vocabulary, use the operation.
      *)

  
end

module ListVocabularyFilters : sig
  val request :
    Smaws_Lib.Context.t ->
      list_vocabulary_filters_request ->
        (list_vocabulary_filters_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Provides a list of custom vocabulary filters that match the specified criteria. If no criteria are specified, all custom vocabularies are returned.
    
     To get detailed information about a specific custom vocabulary filter, use the operation.
      *)

  
end

module StartCallAnalyticsJob : sig
  val request :
    Smaws_Lib.Context.t ->
      start_call_analytics_job_request ->
        (start_call_analytics_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Transcribes the audio from a customer service call and applies any additional Request Parameters you choose to include in your request.
    
     In addition to many standard transcription features, Call Analytics provides you with call characteristics, call summarization, speaker sentiment, and optional redaction of your text transcript and your audio file. You can also apply custom categories to flag specified conditions. To learn more about these features and insights, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/call-analytics.html}Analyzing call center audio with Call Analytics}.
     
      If you want to apply categories to your Call Analytics job, you must create them before submitting your job request. Categories cannot be retroactively applied to a job. To create a new category, use the operation. To learn more about Call Analytics categories, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html}Creating categories for post-call transcriptions} and {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html}Creating categories for real-time transcriptions}.
      
       To make a [StartCallAnalyticsJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.
       
        Note that job queuing is enabled by default for Call Analytics jobs.
        
         You must include the following parameters in your [StartCallAnalyticsJob] request:
         
          {ul
               {- [region]: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html}Amazon Transcribe endpoints and quotas}.
                  
                  }
                {- [CallAnalyticsJobName]: A custom name that you create for your transcription job that's unique within your Amazon Web Services account.
                   
                   }
                {- [DataAccessRoleArn]: The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files.
                   
                   }
                {- [Media] ([MediaFileUri] or [RedactedMediaFileUri]): The Amazon S3 location of your media file.
                   
                   }
               
      }
       With Call Analytics, you can redact the audio contained in your media file by including [RedactedMediaFileUri], instead of [MediaFileUri], to specify the location of your input audio. If you choose to redact your audio, you can find your redacted media at the location specified in the [RedactedMediaFileUri] field of your response.
       
        *)

  
end

module StartMedicalScribeJob : sig
  val request :
    Smaws_Lib.Context.t ->
      start_medical_scribe_job_request ->
        (start_medical_scribe_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Transcribes patient-clinician conversations and generates clinical notes.
    
     Amazon Web Services HealthScribe automatically provides rich conversation transcripts, identifies speaker roles, classifies dialogues, extracts medical terms, and generates preliminary clinical notes. To learn more about these features, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/health-scribe.html}Amazon Web Services HealthScribe}.
     
      To make a [StartMedicalScribeJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.
      
       You must include the following parameters in your [StartMedicalTranscriptionJob] request:
       
        {ul
             {- [DataAccessRoleArn]: The ARN of an IAM role with the these minimum permissions: read permission on input file Amazon S3 bucket specified in [Media], write permission on the Amazon S3 bucket specified in [OutputBucketName], and full permissions on the KMS key specified in [OutputEncryptionKMSKeyId] (if set). The role should also allow [transcribe.amazonaws.com] to assume it.
                
                }
              {- [Media] ([MediaFileUri]): The Amazon S3 location of your media file.
                 
                 }
              {- [MedicalScribeJobName]: A custom name you create for your MedicalScribe job that is unique within your Amazon Web Services account.
                 
                 }
              {- [OutputBucketName]: The Amazon S3 bucket where you want your output files stored.
                 
                 }
              {- [Settings]: A [MedicalScribeSettings] obect that must set exactly one of [ShowSpeakerLabels] or [ChannelIdentification] to true. If [ShowSpeakerLabels] is true, [MaxSpeakerLabels] must also be set.
                 
                 }
              {- [ChannelDefinitions]: A [MedicalScribeChannelDefinitions] array should be set if and only if the [ChannelIdentification] value of [Settings] is set to true.
                 
                 }
             
      }
       *)

  
end

module StartMedicalTranscriptionJob : sig
  val request :
    Smaws_Lib.Context.t ->
      start_medical_transcription_job_request ->
        (start_medical_transcription_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Transcribes the audio from a medical dictation or conversation and applies any additional Request Parameters you choose to include in your request.
    
     In addition to many standard transcription features, Amazon Transcribe Medical provides you with a robust medical vocabulary and, optionally, content identification, which adds flags to personal health information (PHI). To learn more about these features, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/how-it-works-med.html}How Amazon Transcribe Medical works}.
     
      To make a [StartMedicalTranscriptionJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.
      
       You must include the following parameters in your [StartMedicalTranscriptionJob] request:
       
        {ul
             {- [region]: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html}Amazon Transcribe endpoints and quotas}.
                
                }
              {- [MedicalTranscriptionJobName]: A custom name you create for your transcription job that is unique within your Amazon Web Services account.
                 
                 }
              {- [Media] ([MediaFileUri]): The Amazon S3 location of your media file.
                 
                 }
              {- [LanguageCode]: This must be [en-US].
                 
                 }
              {- [OutputBucketName]: The Amazon S3 bucket where you want your transcript stored. If you want your output stored in a sub-folder of this bucket, you must also include [OutputKey].
                 
                 }
              {- [Specialty]: This must be [PRIMARYCARE].
                 
                 }
              {- [Type]: Choose whether your audio is a conversation or a dictation.
                 
                 }
             
      }
       *)

  
end

module StartTranscriptionJob : sig
  val request :
    Smaws_Lib.Context.t ->
      start_transcription_job_request ->
        (start_transcription_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Transcribes the audio from a media file and applies any additional Request Parameters you choose to include in your request.
    
     To make a [StartTranscriptionJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.
     
      You must include the following parameters in your [StartTranscriptionJob] request:
      
       {ul
            {- [region]: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html}Amazon Transcribe endpoints and quotas}.
               
               }
             {- [TranscriptionJobName]: A custom name you create for your transcription job that is unique within your Amazon Web Services account.
                
                }
             {- [Media] ([MediaFileUri]): The Amazon S3 location of your media file.
                
                }
             {- One of [LanguageCode], [IdentifyLanguage], or [IdentifyMultipleLanguages]: If you know the language of your media file, specify it using the [LanguageCode] parameter; you can find all valid language codes in the {{:https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html}Supported languages} table. If you do not know the languages spoken in your media, use either [IdentifyLanguage] or [IdentifyMultipleLanguages] and let Amazon Transcribe identify the languages for you.
                
                }
            
      }
       *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Adds one or more custom tags, each in the form of a key:value pair, to the specified resource.
    
     To learn more about using tags with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html}Tagging resources}.
      *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Removes the specified tags from the specified Amazon Transcribe resource.
    
     If you include [UntagResource] in your request, you must also include [ResourceArn] and [TagKeys].
      *)

  
end

module UpdateCallAnalyticsCategory : sig
  val request :
    Smaws_Lib.Context.t ->
      update_call_analytics_category_request ->
        (update_call_analytics_category_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Updates the specified Call Analytics category with new rules. Note that the [UpdateCallAnalyticsCategory] operation overwrites all existing rules contained in the specified category. You cannot append additional rules onto an existing category.
    
     To create a new category, see .
      *)

  
end

module UpdateMedicalVocabulary : sig
  val request :
    Smaws_Lib.Context.t ->
      update_medical_vocabulary_request ->
        (update_medical_vocabulary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Updates an existing custom medical vocabulary with new values. This operation overwrites all existing information with your new values; you cannot append new terms onto an existing custom vocabulary.
     *)

  
end

module UpdateVocabulary : sig
  val request :
    Smaws_Lib.Context.t ->
      update_vocabulary_request ->
        (update_vocabulary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Updates an existing custom vocabulary with new values. This operation overwrites all existing information with your new values; you cannot append new terms onto an existing custom vocabulary.
     *)

  
end

module UpdateVocabularyFilter : sig
  val request :
    Smaws_Lib.Context.t ->
      update_vocabulary_filter_request ->
        (update_vocabulary_filter_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
  (** 
    Updates an existing custom vocabulary filter with a new list of words. The new list you provide overwrites all previous entries; you cannot append new terms onto an existing custom vocabulary filter.
     *)

  
end

