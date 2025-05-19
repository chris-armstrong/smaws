(** 
    Transcribe client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec vocabulary_state =
  | FAILED 
  | READY 
  | PENDING [@@ocaml.doc ""]
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
  | AF_ZA [@@ocaml.doc ""]
type nonrec vocabulary_info =
  {
  vocabulary_state: vocabulary_state option ;
  last_modified_time: CoreTypes.Timestamp.t option ;
  language_code: language_code option ;
  vocabulary_name: string option }[@@ocaml.doc
                                    "Provides information about a custom vocabulary, including the language of the custom vocabulary, when it was last modified, its name, and the processing state.\n"]
type nonrec vocabulary_filter_info =
  {
  last_modified_time: CoreTypes.Timestamp.t option ;
  language_code: language_code option ;
  vocabulary_filter_name: string option }[@@ocaml.doc
                                           "Provides information about a custom vocabulary filter, including the language of the filter, when it was last modified, and its name.\n"]
type nonrec vocabulary_filter_method =
  | TAG 
  | MASK 
  | REMOVE [@@ocaml.doc ""]
type nonrec update_vocabulary_response =
  {
  vocabulary_state: vocabulary_state option ;
  last_modified_time: CoreTypes.Timestamp.t option ;
  language_code: language_code option ;
  vocabulary_name: string option }[@@ocaml.doc ""]
type nonrec update_vocabulary_request =
  {
  data_access_role_arn: string option ;
  vocabulary_file_uri: string option ;
  phrases: string list option ;
  language_code: language_code ;
  vocabulary_name: string }[@@ocaml.doc ""]
type nonrec update_vocabulary_filter_response =
  {
  last_modified_time: CoreTypes.Timestamp.t option ;
  language_code: language_code option ;
  vocabulary_filter_name: string option }[@@ocaml.doc ""]
type nonrec update_vocabulary_filter_request =
  {
  data_access_role_arn: string option ;
  vocabulary_filter_file_uri: string option ;
  words: string list option ;
  vocabulary_filter_name: string }[@@ocaml.doc ""]
type nonrec not_found_exception = {
  message: string option }[@@ocaml.doc
                            "We can't find the requested resource. Check that the specified name is correct and try your request again.\n"]
type nonrec limit_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "You've either sent too many requests or your input file is too long. Wait before retrying your request, or use a smaller file and try your request again.\n"]
type nonrec internal_failure_exception = {
  message: string option }[@@ocaml.doc
                            "There was an internal error. Check the error message, correct the issue, and try your request again.\n"]
type nonrec bad_request_exception = {
  message: string option }[@@ocaml.doc
                            "Your request didn't pass one or more validation tests. This can occur when the entity you're trying to delete doesn't exist or if it's in a non-terminal state (such as [IN PROGRESS]). See the exception message field for more information.\n"]
type nonrec conflict_exception = {
  message: string option }[@@ocaml.doc
                            "A resource already exists with this name. Resource names must be unique within an Amazon Web Services account.\n"]
type nonrec update_medical_vocabulary_response =
  {
  vocabulary_state: vocabulary_state option ;
  last_modified_time: CoreTypes.Timestamp.t option ;
  language_code: language_code option ;
  vocabulary_name: string option }[@@ocaml.doc ""]
type nonrec update_medical_vocabulary_request =
  {
  vocabulary_file_uri: string ;
  language_code: language_code ;
  vocabulary_name: string }[@@ocaml.doc ""]
type nonrec absolute_time_range =
  {
  last: int option ;
  first: int option ;
  end_time: int option ;
  start_time: int option }[@@ocaml.doc
                            "A time range, in milliseconds, between two points in your media file.\n\n You can use [StartTime] and [EndTime] to search a custom segment. For example, setting [StartTime] to 10000 and [EndTime] to 50000 only searches for your specified criteria in the audio contained between the 10,000 millisecond mark and the 50,000 millisecond mark of your media file. You must use [StartTime] and [EndTime] as a set; that is, if you include one, you must include both.\n \n  You can use also [First] to search from the start of the audio until the time that you specify, or [Last] to search from the time that you specify until the end of the audio. For example, setting [First] to 50000 only searches for your specified criteria in the audio contained between the start of the media file to the 50,000 millisecond mark. You can use [First] and [Last] independently of each other.\n  \n   If you prefer to use percentage instead of milliseconds, see .\n   "]
type nonrec relative_time_range =
  {
  last: int option ;
  first: int option ;
  end_percentage: int option ;
  start_percentage: int option }[@@ocaml.doc
                                  "A time range, in percentage, between two points in your media file.\n\n You can use [StartPercentage] and [EndPercentage] to search a custom segment. For example, setting [StartPercentage] to 10 and [EndPercentage] to 50 only searches for your specified criteria in the audio contained between the 10 percent mark and the 50 percent mark of your media file.\n \n  You can use also [First] to search from the start of the media file until the time that you specify. Or use [Last] to search from the time that you specify until the end of the media file. For example, setting [First] to 10 only searches for your specified criteria in the audio contained in the first 10 percent of the media file.\n  \n   If you prefer to use milliseconds instead of percentage, see .\n   "]
type nonrec non_talk_time_filter =
  {
  negate: bool option ;
  relative_time_range: relative_time_range option ;
  absolute_time_range: absolute_time_range option ;
  threshold: int option }[@@ocaml.doc
                           "Flag the presence or absence of periods of silence in your Call Analytics transcription output.\n\n Rules using [NonTalkTimeFilter] are designed to match:\n \n  {ul\n        {-  The presence of silence at specified periods throughout the call\n            \n             }\n        {-  The presence of speech at specified periods throughout the call\n            \n             }\n        }\n   See {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch}Rule criteria for post-call categories} for usage examples.\n   "]
type nonrec participant_role =
  | CUSTOMER 
  | AGENT [@@ocaml.doc ""]
type nonrec interruption_filter =
  {
  negate: bool option ;
  relative_time_range: relative_time_range option ;
  absolute_time_range: absolute_time_range option ;
  participant_role: participant_role option ;
  threshold: int option }[@@ocaml.doc
                           "Flag the presence or absence of interruptions in your Call Analytics transcription output.\n\n Rules using [InterruptionFilter] are designed to match:\n \n  {ul\n        {-  Instances where an agent interrupts a customer\n            \n             }\n        {-  Instances where a customer interrupts an agent\n            \n             }\n        {-  Either participant interrupting the other\n            \n             }\n        {-  A lack of interruptions\n            \n             }\n        }\n   See {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch}Rule criteria for post-call categories} for usage examples.\n   "]
type nonrec transcript_filter_type =
  | EXACT [@@ocaml.doc ""]
type nonrec transcript_filter =
  {
  targets: string list ;
  negate: bool option ;
  participant_role: participant_role option ;
  relative_time_range: relative_time_range option ;
  absolute_time_range: absolute_time_range option ;
  transcript_filter_type: transcript_filter_type }[@@ocaml.doc
                                                    "Flag the presence or absence of specific words or phrases detected in your Call Analytics transcription output.\n\n Rules using [TranscriptFilter] are designed to match:\n \n  {ul\n        {-  Custom words or phrases spoken by the agent, the customer, or both\n            \n             }\n        {-  Custom words or phrases {b not} spoken by the agent, the customer, or either\n            \n             }\n        {-  Custom words or phrases that occur at a specific time frame\n            \n             }\n        }\n   See {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch}Rule criteria for post-call categories} and {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html#tca-rules-stream}Rule criteria for streaming categories} for usage examples.\n   "]
type nonrec sentiment_value =
  | MIXED 
  | NEUTRAL 
  | NEGATIVE 
  | POSITIVE [@@ocaml.doc ""]
type nonrec sentiment_filter =
  {
  negate: bool option ;
  participant_role: participant_role option ;
  relative_time_range: relative_time_range option ;
  absolute_time_range: absolute_time_range option ;
  sentiments: sentiment_value list }[@@ocaml.doc
                                      "Flag the presence or absence of specific sentiments detected in your Call Analytics transcription output.\n\n Rules using [SentimentFilter] are designed to match:\n \n  {ul\n        {-  The presence or absence of a positive sentiment felt by the customer, agent, or both at specified points in the call\n            \n             }\n        {-  The presence or absence of a negative sentiment felt by the customer, agent, or both at specified points in the call\n            \n             }\n        {-  The presence or absence of a neutral sentiment felt by the customer, agent, or both at specified points in the call\n            \n             }\n        {-  The presence or absence of a mixed sentiment felt by the customer, the agent, or both at specified points in the call\n            \n             }\n        }\n   See {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch}Rule criteria for post-call categories} for usage examples.\n   "]
type nonrec rule =
  | SentimentFilter of sentiment_filter 
  | TranscriptFilter of transcript_filter 
  | InterruptionFilter of interruption_filter 
  | NonTalkTimeFilter of non_talk_time_filter [@@ocaml.doc
                                                "A rule is a set of criteria that you can specify to flag an attribute in your Call Analytics output. Rules define a Call Analytics category.\n\n Rules can include these parameters: , , , and .\n \n  To learn more about Call Analytics rules and categories, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html}Creating categories for post-call transcriptions} and {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html}Creating categories for real-time transcriptions}.\n  \n   To learn more about Call Analytics, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/call-analytics.html}Analyzing call center audio with Call Analytics}.\n   "]
type nonrec input_type =
  | POST_CALL 
  | REAL_TIME [@@ocaml.doc ""]
type nonrec category_properties =
  {
  input_type: input_type option ;
  last_update_time: CoreTypes.Timestamp.t option ;
  create_time: CoreTypes.Timestamp.t option ;
  rules: rule list option ;
  category_name: string option }[@@ocaml.doc
                                  "Provides you with the properties of the Call Analytics category you specified in your request. This includes the list of rules that define the specified category.\n"]
type nonrec update_call_analytics_category_response =
  {
  category_properties: category_properties option }[@@ocaml.doc ""]
type nonrec update_call_analytics_category_request =
  {
  input_type: input_type option ;
  rules: rule list ;
  category_name: string }[@@ocaml.doc ""]
type nonrec untag_resource_response = unit
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec type_ =
  | DICTATION 
  | CONVERSATION [@@ocaml.doc ""]
type nonrec transcription_job_status =
  | COMPLETED 
  | FAILED 
  | IN_PROGRESS 
  | QUEUED [@@ocaml.doc ""]
type nonrec output_location_type =
  | SERVICE_BUCKET 
  | CUSTOMER_BUCKET [@@ocaml.doc ""]
type nonrec redaction_type =
  | PII [@@ocaml.doc ""]
type nonrec redaction_output =
  | REDACTED_AND_UNREDACTED 
  | REDACTED [@@ocaml.doc ""]
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
  | BANK_ACCOUNT_NUMBER [@@ocaml.doc ""]
type nonrec content_redaction =
  {
  pii_entity_types: pii_entity_type list option ;
  redaction_output: redaction_output ;
  redaction_type: redaction_type }[@@ocaml.doc
                                    "Makes it possible to redact or flag specified personally identifiable information (PII) in your transcript. If you use [ContentRedaction], you must also include the sub-parameters: [RedactionOutput] and [RedactionType]. You can optionally include [PiiEntityTypes] to choose which types of PII you want to redact.\n"]
type nonrec model_settings = {
  language_model_name: string option }[@@ocaml.doc
                                        "Provides the name of the custom language model that was included in the specified transcription job.\n\n Only use [ModelSettings] with the [LanguageModelName] sub-parameter if you're {b not} using automatic language identification (). If using [LanguageIdSettings] in your request, this parameter contains a [LanguageModelName] sub-parameter.\n "]
type nonrec language_code_item =
  {
  duration_in_seconds: float option ;
  language_code: language_code option }[@@ocaml.doc
                                         "Provides information on the speech contained in a discreet utterance when multi-language identification is enabled in your request. This utterance represents a block of speech consisting of one language, preceded or followed by a block of speech in a different language.\n"]
type nonrec toxicity_category =
  | ALL [@@ocaml.doc ""]
type nonrec toxicity_detection_settings =
  {
  toxicity_categories: toxicity_category list }[@@ocaml.doc
                                                 "Contains [ToxicityCategories], which is a required parameter if you want to enable toxicity detection ([ToxicityDetection]) in your transcription request.\n"]
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
  transcription_job_name: string option }[@@ocaml.doc
                                           "Provides detailed information about a specific transcription job.\n"]
type nonrec media_format =
  | M4A 
  | WEBM 
  | AMR 
  | OGG 
  | FLAC 
  | WAV 
  | MP4 
  | MP3 [@@ocaml.doc ""]
type nonrec media =
  {
  redacted_media_file_uri: string option ;
  media_file_uri: string option }[@@ocaml.doc
                                   "Describes the Amazon S3 location of the media file you want to use in your request.\n\n For information on supported media formats, refer to the [MediaFormat] parameter or the {{:https://docs.aws.amazon.com/transcribe/latest/dg/how-input.html#how-input-audio}Media formats} section in the Amazon S3 Developer Guide.\n "]
type nonrec transcript =
  {
  redacted_transcript_file_uri: string option ;
  transcript_file_uri: string option }[@@ocaml.doc
                                        "Provides you with the Amazon S3 URI you can use to access your transcript.\n"]
type nonrec settings =
  {
  vocabulary_filter_method: vocabulary_filter_method option ;
  vocabulary_filter_name: string option ;
  max_alternatives: int option ;
  show_alternatives: bool option ;
  channel_identification: bool option ;
  max_speaker_labels: int option ;
  show_speaker_labels: bool option ;
  vocabulary_name: string option }[@@ocaml.doc
                                    "Allows additional optional settings in your request, including channel identification, alternative transcriptions, and speaker partitioning. You can use that to apply custom vocabularies to your transcription job.\n"]
type nonrec job_execution_settings =
  {
  data_access_role_arn: string option ;
  allow_deferred_execution: bool option }[@@ocaml.doc
                                           "Makes it possible to control how your transcription job is processed. Currently, the only [JobExecutionSettings] modification you can choose is enabling job queueing using the [AllowDeferredExecution] sub-parameter.\n\n If you include [JobExecutionSettings] in your request, you must also include the sub-parameters: [AllowDeferredExecution] and [DataAccessRoleArn].\n "]
type nonrec tag = {
  value: string ;
  key: string }[@@ocaml.doc
                 "Adds metadata, in the form of a key:value pair, to the specified resource.\n\n For example, you could add the tag [Department:Sales] to a resource to indicate that it pertains to your organization's sales department. You can also use tags for tag-based access control.\n \n  To learn more about tagging, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html}Tagging resources}.\n  "]
type nonrec subtitle_format =
  | SRT 
  | VTT [@@ocaml.doc ""]
type nonrec subtitles_output =
  {
  output_start_index: int option ;
  subtitle_file_uris: string list option ;
  formats: subtitle_format list option }[@@ocaml.doc
                                          "Provides information about your subtitle file, including format, start index, and Amazon S3 location.\n"]
type nonrec language_id_settings =
  {
  language_model_name: string option ;
  vocabulary_filter_name: string option ;
  vocabulary_name: string option }[@@ocaml.doc
                                    "If using automatic language identification in your request and you want to apply a custom language model, a custom vocabulary, or a custom vocabulary filter, include [LanguageIdSettings] with the relevant sub-parameters ([VocabularyName], [LanguageModelName], and [VocabularyFilterName]). Note that multi-language identification ([IdentifyMultipleLanguages]) doesn't support custom language models.\n\n  [LanguageIdSettings] supports two to five language codes. Each language code you include can have an associated custom language model, custom vocabulary, and custom vocabulary filter. The language codes that you specify must match the languages of the associated custom language models, custom vocabularies, and custom vocabulary filters.\n \n  It's recommended that you include [LanguageOptions] when using [LanguageIdSettings] to ensure that the correct language dialect is identified. For example, if you specify a custom vocabulary that is in [en-US] but Amazon Transcribe determines that the language spoken in your media is [en-AU], your custom vocabulary {i is not} applied to your transcription. If you include [LanguageOptions] and include [en-US] as the only English language dialect, your custom vocabulary {i is} applied to your transcription.\n  \n   If you want to include a custom language model with your request but {b do not} want to use automatic language identification, use instead the  parameter with the [LanguageModelName] sub-parameter. If you want to include a custom vocabulary or a custom vocabulary filter (or both) with your request but {b do not} want to use automatic language identification, use instead the  parameter with the [VocabularyName] or [VocabularyFilterName] (or both) sub-parameter.\n   "]
type nonrec language_id_settings_map =
  (language_code * language_id_settings) list[@@ocaml.doc ""]
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
  transcription_job_name: string option }[@@ocaml.doc
                                           "Provides detailed information about a transcription job.\n\n To view the status of the specified transcription job, check the [TranscriptionJobStatus] field. If the status is [COMPLETED], the job is finished and you can find the results at the location specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.\n \n  If you enabled content redaction, the redacted transcript can be found at the location specified in [RedactedTranscriptFileUri].\n  "]
type nonrec tag_resource_response = unit
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec start_transcription_job_response =
  {
  transcription_job: transcription_job option }[@@ocaml.doc ""]
type nonrec kms_encryption_context_map = (string * string) list[@@ocaml.doc
                                                                 ""]
type nonrec subtitles =
  {
  output_start_index: int option ;
  formats: subtitle_format list option }[@@ocaml.doc
                                          "Generate subtitles for your media file with your transcription request.\n\n You can choose a start index of 0 or 1, and you can specify either WebVTT or SubRip (or both) as your output format.\n \n  Note that your subtitle files are placed in the same location as your transcription output.\n  "]
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
  transcription_job_name: string }[@@ocaml.doc ""]
type nonrec medical_transcript = {
  transcript_file_uri: string option }[@@ocaml.doc
                                        "Provides you with the Amazon S3 URI you can use to access your transcript.\n"]
type nonrec medical_transcription_setting =
  {
  vocabulary_name: string option ;
  max_alternatives: int option ;
  show_alternatives: bool option ;
  channel_identification: bool option ;
  max_speaker_labels: int option ;
  show_speaker_labels: bool option }[@@ocaml.doc
                                      "Allows additional optional settings in your request, including channel identification, alternative transcriptions, and speaker partitioning. You can use that to apply custom vocabularies to your medical transcription job.\n"]
type nonrec medical_content_identification_type =
  | PHI [@@ocaml.doc ""]
type nonrec specialty =
  | PRIMARYCARE [@@ocaml.doc ""]
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
  medical_transcription_job_name: string option }[@@ocaml.doc
                                                   "Provides detailed information about a medical transcription job.\n\n To view the status of the specified medical transcription job, check the [TranscriptionJobStatus] field. If the status is [COMPLETED], the job is finished and you can find the results at the location specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.\n "]
type nonrec start_medical_transcription_job_response =
  {
  medical_transcription_job: medical_transcription_job option }[@@ocaml.doc
                                                                 ""]
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
  medical_transcription_job_name: string }[@@ocaml.doc ""]
type nonrec medical_scribe_job_status =
  | COMPLETED 
  | FAILED 
  | IN_PROGRESS 
  | QUEUED [@@ocaml.doc ""]
type nonrec medical_scribe_language_code =
  | EN_US [@@ocaml.doc ""]
type nonrec medical_scribe_output =
  {
  clinical_document_uri: string ;
  transcript_file_uri: string }[@@ocaml.doc
                                 "The location of the output of your Medical Scribe job. [ClinicalDocumentUri] holds the Amazon S3 URI for the Clinical Document and [TranscriptFileUri] holds the Amazon S3 URI for the Transcript.\n"]
type nonrec medical_scribe_settings =
  {
  vocabulary_filter_method: vocabulary_filter_method option ;
  vocabulary_filter_name: string option ;
  vocabulary_name: string option ;
  channel_identification: bool option ;
  max_speaker_labels: int option ;
  show_speaker_labels: bool option }[@@ocaml.doc
                                      "Makes it possible to control how your Medical Scribe job is processed using a [MedicalScribeSettings] object. Specify [ChannelIdentification] if [ChannelDefinitions] are set. Enabled [ShowSpeakerLabels] if [ChannelIdentification] and [ChannelDefinitions] are not set. One and only one of [ChannelIdentification] and [ShowSpeakerLabels] must be set. If [ShowSpeakerLabels] is set, [MaxSpeakerLabels] must also be set. Use [Settings] to specify a vocabulary or vocabulary filter or both using [VocabularyName], [VocabularyFilterName]. [VocabularyFilterMethod] must be specified if [VocabularyFilterName] is set. \n"]
type nonrec medical_scribe_participant_role =
  | CLINICIAN 
  | PATIENT [@@ocaml.doc ""]
type nonrec medical_scribe_channel_definition =
  {
  participant_role: medical_scribe_participant_role ;
  channel_id: int }[@@ocaml.doc
                     "Indicates which speaker is on which channel. The options are [CLINICIAN] and [PATIENT] \n"]
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
  medical_scribe_job_name: string option }[@@ocaml.doc
                                            "Provides detailed information about a Medical Scribe job.\n\n To view the status of the specified Medical Scribe job, check the [MedicalScribeJobStatus] field. If the status is [COMPLETED], the job is finished and you can find the results at the locations specified in [MedicalScribeOutput]. If the status is [FAILED], [FailureReason] provides details on why your Medical Scribe job failed.\n "]
type nonrec start_medical_scribe_job_response =
  {
  medical_scribe_job: medical_scribe_job option }[@@ocaml.doc ""]
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
  medical_scribe_job_name: string }[@@ocaml.doc ""]
type nonrec call_analytics_job_status =
  | COMPLETED 
  | FAILED 
  | IN_PROGRESS 
  | QUEUED [@@ocaml.doc ""]
type nonrec call_analytics_feature =
  | GENERATIVE_SUMMARIZATION [@@ocaml.doc ""]
type nonrec call_analytics_skipped_reason_code =
  | FAILED_SAFETY_GUIDELINES 
  | INSUFFICIENT_CONVERSATION_CONTENT [@@ocaml.doc ""]
type nonrec call_analytics_skipped_feature =
  {
  message: string option ;
  reason_code: call_analytics_skipped_reason_code option ;
  feature: call_analytics_feature option }[@@ocaml.doc
                                            "Represents a skipped analytics feature during the analysis of a call analytics job.\n\n The [Feature] field indicates the type of analytics feature that was skipped.\n \n  The [Message] field contains additional information or a message explaining why the analytics feature was skipped.\n  \n   The [ReasonCode] field provides a code indicating the reason why the analytics feature was skipped.\n   "]
type nonrec call_analytics_job_details =
  {
  skipped: call_analytics_skipped_feature list option }[@@ocaml.doc
                                                         "Contains details about a call analytics job, including information about skipped analytics features.\n"]
type nonrec summarization = {
  generate_abstractive_summary: bool }[@@ocaml.doc
                                        "Contains [GenerateAbstractiveSummary], which is a required parameter if you want to enable Generative call summarization in your Call Analytics request.\n"]
type nonrec call_analytics_job_settings =
  {
  summarization: summarization option ;
  language_id_settings: language_id_settings_map option ;
  language_options: language_code list option ;
  content_redaction: content_redaction option ;
  language_model_name: string option ;
  vocabulary_filter_method: vocabulary_filter_method option ;
  vocabulary_filter_name: string option ;
  vocabulary_name: string option }[@@ocaml.doc
                                    "Provides additional optional settings for your request, including content redaction, automatic language identification; allows you to apply custom language models, custom vocabulary filters, and custom vocabularies.\n"]
type nonrec channel_definition =
  {
  participant_role: participant_role option ;
  channel_id: int option }[@@ocaml.doc
                            "Makes it possible to specify which speaker is on which channel. For example, if your agent is the first participant to speak, you would set [ChannelId] to [0] (to indicate the first channel) and [ParticipantRole] to [AGENT] (to indicate that it's the agent speaking).\n"]
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
  call_analytics_job_name: string option }[@@ocaml.doc
                                            "Provides detailed information about a Call Analytics job.\n\n To view the job's status, refer to [CallAnalyticsJobStatus]. If the status is [COMPLETED], the job is finished. You can find your completed transcript at the URI specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.\n \n  If you enabled personally identifiable information (PII) redaction, the redacted transcript appears at the location specified in [RedactedTranscriptFileUri].\n  \n   If you chose to redact the audio in your media file, you can find your redacted media file at the location specified in the [RedactedMediaFileUri] field of your response.\n   "]
type nonrec start_call_analytics_job_response =
  {
  call_analytics_job: call_analytics_job option }[@@ocaml.doc ""]
type nonrec start_call_analytics_job_request =
  {
  channel_definitions: channel_definition list option ;
  settings: call_analytics_job_settings option ;
  data_access_role_arn: string option ;
  output_encryption_kms_key_id: string option ;
  output_location: string option ;
  media: media ;
  call_analytics_job_name: string }[@@ocaml.doc ""]
type nonrec list_vocabulary_filters_response =
  {
  vocabulary_filters: vocabulary_filter_info list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_vocabulary_filters_request =
  {
  name_contains: string option ;
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_vocabularies_response =
  {
  vocabularies: vocabulary_info list option ;
  next_token: string option ;
  status: vocabulary_state option }[@@ocaml.doc ""]
type nonrec list_vocabularies_request =
  {
  name_contains: string option ;
  state_equals: vocabulary_state option ;
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_transcription_jobs_response =
  {
  transcription_job_summaries: transcription_job_summary list option ;
  next_token: string option ;
  status: transcription_job_status option }[@@ocaml.doc ""]
type nonrec list_transcription_jobs_request =
  {
  max_results: int option ;
  next_token: string option ;
  job_name_contains: string option ;
  status: transcription_job_status option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_response =
  {
  tags: tag list option ;
  resource_arn: string option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec list_medical_vocabularies_response =
  {
  vocabularies: vocabulary_info list option ;
  next_token: string option ;
  status: vocabulary_state option }[@@ocaml.doc ""]
type nonrec list_medical_vocabularies_request =
  {
  name_contains: string option ;
  state_equals: vocabulary_state option ;
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
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
  medical_transcription_job_name: string option }[@@ocaml.doc
                                                   "Provides detailed information about a specific medical transcription job.\n"]
type nonrec list_medical_transcription_jobs_response =
  {
  medical_transcription_job_summaries:
    medical_transcription_job_summary list option ;
  next_token: string option ;
  status: transcription_job_status option }[@@ocaml.doc ""]
type nonrec list_medical_transcription_jobs_request =
  {
  max_results: int option ;
  next_token: string option ;
  job_name_contains: string option ;
  status: transcription_job_status option }[@@ocaml.doc ""]
type nonrec medical_scribe_job_summary =
  {
  failure_reason: string option ;
  medical_scribe_job_status: medical_scribe_job_status option ;
  language_code: medical_scribe_language_code option ;
  completion_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  creation_time: CoreTypes.Timestamp.t option ;
  medical_scribe_job_name: string option }[@@ocaml.doc
                                            "Provides detailed information about a specific Medical Scribe job.\n"]
type nonrec list_medical_scribe_jobs_response =
  {
  medical_scribe_job_summaries: medical_scribe_job_summary list option ;
  next_token: string option ;
  status: medical_scribe_job_status option }[@@ocaml.doc ""]
type nonrec list_medical_scribe_jobs_request =
  {
  max_results: int option ;
  next_token: string option ;
  job_name_contains: string option ;
  status: medical_scribe_job_status option }[@@ocaml.doc ""]
type nonrec clm_language_code =
  | JA_JP 
  | DE_DE 
  | EN_AU 
  | EN_GB 
  | ES_US 
  | HI_IN 
  | EN_US [@@ocaml.doc ""]
type nonrec base_model_name =
  | WIDE_BAND 
  | NARROW_BAND [@@ocaml.doc ""]
type nonrec model_status =
  | COMPLETED 
  | FAILED 
  | IN_PROGRESS [@@ocaml.doc ""]
type nonrec input_data_config =
  {
  data_access_role_arn: string ;
  tuning_data_s3_uri: string option ;
  s3_uri: string }[@@ocaml.doc
                    "Contains the Amazon S3 location of the training data you want to use to create a new custom language model, and permissions to access this location.\n\n When using [InputDataConfig], you must include these sub-parameters: [S3Uri] and [DataAccessRoleArn]. You can optionally include [TuningDataS3Uri].\n "]
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
  model_name: string option }[@@ocaml.doc
                               "Provides information about a custom language model, including:\n\n {ul\n       {-  The base model name\n           \n            }\n       {-  When the model was created\n           \n            }\n       {-  The location of the files used to train the model\n           \n            }\n       {-  When the model was last modified\n           \n            }\n       {-  The name you chose for the model\n           \n            }\n       {-  The model's language\n           \n            }\n       {-  The model's processing state\n           \n            }\n       {-  Any available upgrades for the base model\n           \n            }\n       }\n  "]
type nonrec list_language_models_response =
  {
  models: language_model list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_language_models_request =
  {
  max_results: int option ;
  next_token: string option ;
  name_contains: string option ;
  status_equals: model_status option }[@@ocaml.doc ""]
type nonrec call_analytics_job_summary =
  {
  failure_reason: string option ;
  call_analytics_job_details: call_analytics_job_details option ;
  call_analytics_job_status: call_analytics_job_status option ;
  language_code: language_code option ;
  completion_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  creation_time: CoreTypes.Timestamp.t option ;
  call_analytics_job_name: string option }[@@ocaml.doc
                                            "Provides detailed information about a specific Call Analytics job.\n"]
type nonrec list_call_analytics_jobs_response =
  {
  call_analytics_job_summaries: call_analytics_job_summary list option ;
  next_token: string option ;
  status: call_analytics_job_status option }[@@ocaml.doc ""]
type nonrec list_call_analytics_jobs_request =
  {
  max_results: int option ;
  next_token: string option ;
  job_name_contains: string option ;
  status: call_analytics_job_status option }[@@ocaml.doc ""]
type nonrec list_call_analytics_categories_response =
  {
  categories: category_properties list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_call_analytics_categories_request =
  {
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec get_vocabulary_filter_response =
  {
  download_uri: string option ;
  last_modified_time: CoreTypes.Timestamp.t option ;
  language_code: language_code option ;
  vocabulary_filter_name: string option }[@@ocaml.doc ""]
type nonrec get_vocabulary_filter_request = {
  vocabulary_filter_name: string }[@@ocaml.doc ""]
type nonrec get_vocabulary_response =
  {
  download_uri: string option ;
  failure_reason: string option ;
  last_modified_time: CoreTypes.Timestamp.t option ;
  vocabulary_state: vocabulary_state option ;
  language_code: language_code option ;
  vocabulary_name: string option }[@@ocaml.doc ""]
type nonrec get_vocabulary_request = {
  vocabulary_name: string }[@@ocaml.doc ""]
type nonrec get_transcription_job_response =
  {
  transcription_job: transcription_job option }[@@ocaml.doc ""]
type nonrec get_transcription_job_request = {
  transcription_job_name: string }[@@ocaml.doc ""]
type nonrec get_medical_vocabulary_response =
  {
  download_uri: string option ;
  failure_reason: string option ;
  last_modified_time: CoreTypes.Timestamp.t option ;
  vocabulary_state: vocabulary_state option ;
  language_code: language_code option ;
  vocabulary_name: string option }[@@ocaml.doc ""]
type nonrec get_medical_vocabulary_request = {
  vocabulary_name: string }[@@ocaml.doc ""]
type nonrec get_medical_transcription_job_response =
  {
  medical_transcription_job: medical_transcription_job option }[@@ocaml.doc
                                                                 ""]
type nonrec get_medical_transcription_job_request =
  {
  medical_transcription_job_name: string }[@@ocaml.doc ""]
type nonrec get_medical_scribe_job_response =
  {
  medical_scribe_job: medical_scribe_job option }[@@ocaml.doc ""]
type nonrec get_medical_scribe_job_request =
  {
  medical_scribe_job_name: string }[@@ocaml.doc ""]
type nonrec get_call_analytics_job_response =
  {
  call_analytics_job: call_analytics_job option }[@@ocaml.doc ""]
type nonrec get_call_analytics_job_request =
  {
  call_analytics_job_name: string }[@@ocaml.doc ""]
type nonrec get_call_analytics_category_response =
  {
  category_properties: category_properties option }[@@ocaml.doc ""]
type nonrec get_call_analytics_category_request = {
  category_name: string }[@@ocaml.doc ""]
type nonrec describe_language_model_response =
  {
  language_model: language_model option }[@@ocaml.doc ""]
type nonrec describe_language_model_request = {
  model_name: string }[@@ocaml.doc ""]
type nonrec delete_vocabulary_filter_request =
  {
  vocabulary_filter_name: string }[@@ocaml.doc ""]
type nonrec delete_vocabulary_request = {
  vocabulary_name: string }[@@ocaml.doc ""]
type nonrec delete_transcription_job_request =
  {
  transcription_job_name: string }[@@ocaml.doc ""]
type nonrec delete_medical_vocabulary_request = {
  vocabulary_name: string }[@@ocaml.doc ""]
type nonrec delete_medical_transcription_job_request =
  {
  medical_transcription_job_name: string }[@@ocaml.doc ""]
type nonrec delete_medical_scribe_job_request =
  {
  medical_scribe_job_name: string }[@@ocaml.doc ""]
type nonrec delete_language_model_request = {
  model_name: string }[@@ocaml.doc ""]
type nonrec delete_call_analytics_job_response = unit
type nonrec delete_call_analytics_job_request =
  {
  call_analytics_job_name: string }[@@ocaml.doc ""]
type nonrec delete_call_analytics_category_response = unit
type nonrec delete_call_analytics_category_request = {
  category_name: string }[@@ocaml.doc ""]
type nonrec create_vocabulary_filter_response =
  {
  last_modified_time: CoreTypes.Timestamp.t option ;
  language_code: language_code option ;
  vocabulary_filter_name: string option }[@@ocaml.doc ""]
type nonrec create_vocabulary_filter_request =
  {
  data_access_role_arn: string option ;
  tags: tag list option ;
  vocabulary_filter_file_uri: string option ;
  words: string list option ;
  language_code: language_code ;
  vocabulary_filter_name: string }[@@ocaml.doc ""]
type nonrec create_vocabulary_response =
  {
  failure_reason: string option ;
  last_modified_time: CoreTypes.Timestamp.t option ;
  vocabulary_state: vocabulary_state option ;
  language_code: language_code option ;
  vocabulary_name: string option }[@@ocaml.doc ""]
type nonrec create_vocabulary_request =
  {
  data_access_role_arn: string option ;
  tags: tag list option ;
  vocabulary_file_uri: string option ;
  phrases: string list option ;
  language_code: language_code ;
  vocabulary_name: string }[@@ocaml.doc ""]
type nonrec create_medical_vocabulary_response =
  {
  failure_reason: string option ;
  last_modified_time: CoreTypes.Timestamp.t option ;
  vocabulary_state: vocabulary_state option ;
  language_code: language_code option ;
  vocabulary_name: string option }[@@ocaml.doc ""]
type nonrec create_medical_vocabulary_request =
  {
  tags: tag list option ;
  vocabulary_file_uri: string ;
  language_code: language_code ;
  vocabulary_name: string }[@@ocaml.doc ""]
type nonrec create_language_model_response =
  {
  model_status: model_status option ;
  input_data_config: input_data_config option ;
  model_name: string option ;
  base_model_name: base_model_name option ;
  language_code: clm_language_code option }[@@ocaml.doc ""]
type nonrec create_language_model_request =
  {
  tags: tag list option ;
  input_data_config: input_data_config ;
  model_name: string ;
  base_model_name: base_model_name ;
  language_code: clm_language_code }[@@ocaml.doc ""]
type nonrec create_call_analytics_category_response =
  {
  category_properties: category_properties option }[@@ocaml.doc ""]
type nonrec create_call_analytics_category_request =
  {
  input_type: input_type option ;
  rules: rule list ;
  category_name: string }[@@ocaml.doc ""](** {1:builders Builders} *)

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
  (** Creates a new Call Analytics category.

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
  (** Creates a new custom language model.

 When creating a new custom language model, you must specify:
 
  {ul
        {-  If you want a Wideband (audio sample rates over 16,000 Hz) or Narrowband (audio sample rates under 16,000 Hz) base model
            
             }
        {-  The location of your training and tuning files (this must be an Amazon S3 URI)
            
             }
        {-  The language of your model
            
             }
        {-  A unique name for your model
            
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
  (** Creates a new custom medical vocabulary.

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
  (** Creates a new custom vocabulary.

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
  (** Creates a new custom vocabulary filter.

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
  (** Deletes a Call Analytics category. To use this operation, specify the name of the category you want to delete using [CategoryName]. Category names are case sensitive.
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
  (** Deletes a Call Analytics job. To use this operation, specify the name of the job you want to delete using [CallAnalyticsJobName]. Job names are case sensitive.
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
  (** Deletes a custom language model. To use this operation, specify the name of the language model you want to delete using [ModelName]. custom language model names are case sensitive.
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
  (** Deletes a Medical Scribe job. To use this operation, specify the name of the job you want to delete using [MedicalScribeJobName]. Job names are case sensitive.
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
  (** Deletes a medical transcription job. To use this operation, specify the name of the job you want to delete using [MedicalTranscriptionJobName]. Job names are case sensitive.
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
  (** Deletes a custom medical vocabulary. To use this operation, specify the name of the custom vocabulary you want to delete using [VocabularyName]. Custom vocabulary names are case sensitive.
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
  (** Deletes a transcription job. To use this operation, specify the name of the job you want to delete using [TranscriptionJobName]. Job names are case sensitive.
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
  (** Deletes a custom vocabulary. To use this operation, specify the name of the custom vocabulary you want to delete using [VocabularyName]. Custom vocabulary names are case sensitive.
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
  (** Deletes a custom vocabulary filter. To use this operation, specify the name of the custom vocabulary filter you want to delete using [VocabularyFilterName]. Custom vocabulary filter names are case sensitive.
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
  (** Provides information about the specified custom language model.

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
  (** Provides information about the specified Call Analytics category.

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
  (** Provides information about the specified Call Analytics job.

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
  (** Provides information about the specified Medical Scribe job.

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
  (** Provides information about the specified medical transcription job.

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
  (** Provides information about the specified custom medical vocabulary.

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
  (** Provides information about the specified transcription job.

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
  (** Provides information about the specified custom vocabulary.

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
  (** Provides information about the specified custom vocabulary filter.

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
  (** Provides a list of Call Analytics categories, including all rules that make up each category.

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
  (** Provides a list of Call Analytics jobs that match the specified criteria. If no criteria are specified, all Call Analytics jobs are returned.

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
  (** Provides a list of custom language models that match the specified criteria. If no criteria are specified, all custom language models are returned.

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
  (** Provides a list of Medical Scribe jobs that match the specified criteria. If no criteria are specified, all Medical Scribe jobs are returned.

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
  (** Provides a list of medical transcription jobs that match the specified criteria. If no criteria are specified, all medical transcription jobs are returned.

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
  (** Provides a list of custom medical vocabularies that match the specified criteria. If no criteria are specified, all custom medical vocabularies are returned.

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
  (** Lists all tags associated with the specified transcription job, vocabulary, model, or resource.

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
  (** Provides a list of transcription jobs that match the specified criteria. If no criteria are specified, all transcription jobs are returned.

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
  (** Provides a list of custom vocabularies that match the specified criteria. If no criteria are specified, all custom vocabularies are returned.

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
  (** Provides a list of custom vocabulary filters that match the specified criteria. If no criteria are specified, all custom vocabularies are returned.

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
  (** Transcribes the audio from a customer service call and applies any additional Request Parameters you choose to include in your request.

 In addition to many standard transcription features, Call Analytics provides you with call characteristics, call summarization, speaker sentiment, and optional redaction of your text transcript and your audio file. You can also apply custom categories to flag specified conditions. To learn more about these features and insights, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/call-analytics.html}Analyzing call center audio with Call Analytics}.
 
  If you want to apply categories to your Call Analytics job, you must create them before submitting your job request. Categories cannot be retroactively applied to a job. To create a new category, use the operation. To learn more about Call Analytics categories, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html}Creating categories for post-call transcriptions} and {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html}Creating categories for real-time transcriptions}.
  
   To make a [StartCallAnalyticsJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.
   
    Note that job queuing is enabled by default for Call Analytics jobs.
    
     You must include the following parameters in your [StartCallAnalyticsJob] request:
     
      {ul
            {-   [region]: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html}Amazon Transcribe endpoints and quotas}.
                
                 }
            {-   [CallAnalyticsJobName]: A custom name that you create for your transcription job that's unique within your Amazon Web Services account.
                
                 }
            {-   [DataAccessRoleArn]: The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files.
                
                 }
            {-   [Media] ([MediaFileUri] or [RedactedMediaFileUri]): The Amazon S3 location of your media file.
                
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
  (** Transcribes patient-clinician conversations and generates clinical notes. 

 Amazon Web Services HealthScribe automatically provides rich conversation transcripts, identifies speaker roles, classifies dialogues, extracts medical terms, and generates preliminary clinical notes. To learn more about these features, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/health-scribe.html}Amazon Web Services HealthScribe}.
 
  To make a [StartMedicalScribeJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.
  
   You must include the following parameters in your [StartMedicalTranscriptionJob] request:
   
    {ul
          {-   [DataAccessRoleArn]: The ARN of an IAM role with the these minimum permissions: read permission on input file Amazon S3 bucket specified in [Media], write permission on the Amazon S3 bucket specified in [OutputBucketName], and full permissions on the KMS key specified in [OutputEncryptionKMSKeyId] (if set). The role should also allow [transcribe.amazonaws.com] to assume it. 
              
               }
          {-   [Media] ([MediaFileUri]): The Amazon S3 location of your media file.
              
               }
          {-   [MedicalScribeJobName]: A custom name you create for your MedicalScribe job that is unique within your Amazon Web Services account.
              
               }
          {-   [OutputBucketName]: The Amazon S3 bucket where you want your output files stored.
              
               }
          {-   [Settings]: A [MedicalScribeSettings] obect that must set exactly one of [ShowSpeakerLabels] or [ChannelIdentification] to true. If [ShowSpeakerLabels] is true, [MaxSpeakerLabels] must also be set. 
              
               }
          {-   [ChannelDefinitions]: A [MedicalScribeChannelDefinitions] array should be set if and only if the [ChannelIdentification] value of [Settings] is set to true. 
              
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
  (** Transcribes the audio from a medical dictation or conversation and applies any additional Request Parameters you choose to include in your request.

 In addition to many standard transcription features, Amazon Transcribe Medical provides you with a robust medical vocabulary and, optionally, content identification, which adds flags to personal health information (PHI). To learn more about these features, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/how-it-works-med.html}How Amazon Transcribe Medical works}.
 
  To make a [StartMedicalTranscriptionJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.
  
   You must include the following parameters in your [StartMedicalTranscriptionJob] request:
   
    {ul
          {-   [region]: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html}Amazon Transcribe endpoints and quotas}.
              
               }
          {-   [MedicalTranscriptionJobName]: A custom name you create for your transcription job that is unique within your Amazon Web Services account.
              
               }
          {-   [Media] ([MediaFileUri]): The Amazon S3 location of your media file.
              
               }
          {-   [LanguageCode]: This must be [en-US].
              
               }
          {-   [OutputBucketName]: The Amazon S3 bucket where you want your transcript stored. If you want your output stored in a sub-folder of this bucket, you must also include [OutputKey].
              
               }
          {-   [Specialty]: This must be [PRIMARYCARE].
              
               }
          {-   [Type]: Choose whether your audio is a conversation or a dictation.
              
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
  (** Transcribes the audio from a media file and applies any additional Request Parameters you choose to include in your request.

 To make a [StartTranscriptionJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.
 
  You must include the following parameters in your [StartTranscriptionJob] request:
  
   {ul
         {-   [region]: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html}Amazon Transcribe endpoints and quotas}.
             
              }
         {-   [TranscriptionJobName]: A custom name you create for your transcription job that is unique within your Amazon Web Services account.
             
              }
         {-   [Media] ([MediaFileUri]): The Amazon S3 location of your media file.
             
              }
         {-  One of [LanguageCode], [IdentifyLanguage], or [IdentifyMultipleLanguages]: If you know the language of your media file, specify it using the [LanguageCode] parameter; you can find all valid language codes in the {{:https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html}Supported languages} table. If you do not know the languages spoken in your media, use either [IdentifyLanguage] or [IdentifyMultipleLanguages] and let Amazon Transcribe identify the languages for you.
             
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
  (** Adds one or more custom tags, each in the form of a key:value pair, to the specified resource.

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
  (** Removes the specified tags from the specified Amazon Transcribe resource.

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
  (** Updates the specified Call Analytics category with new rules. Note that the [UpdateCallAnalyticsCategory] operation overwrites all existing rules contained in the specified category. You cannot append additional rules onto an existing category.

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
  (** Updates an existing custom medical vocabulary with new values. This operation overwrites all existing information with your new values; you cannot append new terms onto an existing custom vocabulary.
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
  (** Updates an existing custom vocabulary with new values. This operation overwrites all existing information with your new values; you cannot append new terms onto an existing custom vocabulary.
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
  (** Updates an existing custom vocabulary filter with a new list of words. The new list you provide overwrites all previous entries; you cannot append new terms onto an existing custom vocabulary filter.
 *)

  
end

