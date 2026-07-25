open Smaws_Lib.Json.SerializeHelpers
open Types

let timestamp_milliseconds_to_yojson = long_to_yojson

let absolute_time_range_to_yojson (x : absolute_time_range) =
  assoc_to_yojson
    [
      ("StartTime", option_to_yojson timestamp_milliseconds_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_milliseconds_to_yojson x.end_time);
      ("First", option_to_yojson timestamp_milliseconds_to_yojson x.first);
      ("Last", option_to_yojson timestamp_milliseconds_to_yojson x.last);
    ]

let failure_reason_to_yojson = string_to_yojson

let bad_request_exception_to_yojson (x : bad_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson failure_reason_to_yojson x.message) ]

let base_model_name_to_yojson (x : base_model_name) =
  match x with NARROW_BAND -> `String "NarrowBand" | WIDE_BAND -> `String "WideBand"

let boolean__to_yojson = bool_to_yojson

let clm_language_code_to_yojson (x : clm_language_code) =
  match x with
  | EN_US -> `String "en-US"
  | HI_IN -> `String "hi-IN"
  | ES_US -> `String "es-US"
  | EN_GB -> `String "en-GB"
  | EN_AU -> `String "en-AU"
  | DE_DE -> `String "de-DE"
  | JA_JP -> `String "ja-JP"

let call_analytics_feature_to_yojson (x : call_analytics_feature) =
  match x with GENERATIVE_SUMMARIZATION -> `String "GENERATIVE_SUMMARIZATION"

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let participant_role_to_yojson (x : participant_role) =
  match x with AGENT -> `String "AGENT" | CUSTOMER -> `String "CUSTOMER"

let channel_id_to_yojson = int_to_yojson

let channel_definition_to_yojson (x : channel_definition) =
  assoc_to_yojson
    [
      ("ChannelId", option_to_yojson channel_id_to_yojson x.channel_id);
      ("ParticipantRole", option_to_yojson participant_role_to_yojson x.participant_role);
    ]

let channel_definitions_to_yojson tree = list_to_yojson channel_definition_to_yojson tree

let summarization_to_yojson (x : summarization) =
  assoc_to_yojson
    [ ("GenerateAbstractiveSummary", Some (boolean__to_yojson x.generate_abstractive_summary)) ]

let model_name_to_yojson = string_to_yojson
let vocabulary_filter_name_to_yojson = string_to_yojson
let vocabulary_name_to_yojson = string_to_yojson

let language_id_settings_to_yojson (x : language_id_settings) =
  assoc_to_yojson
    [
      ("VocabularyName", option_to_yojson vocabulary_name_to_yojson x.vocabulary_name);
      ( "VocabularyFilterName",
        option_to_yojson vocabulary_filter_name_to_yojson x.vocabulary_filter_name );
      ("LanguageModelName", option_to_yojson model_name_to_yojson x.language_model_name);
    ]

let language_code_to_yojson (x : language_code) =
  match x with
  | AF_ZA -> `String "af-ZA"
  | AR_AE -> `String "ar-AE"
  | AR_SA -> `String "ar-SA"
  | AM_ET -> `String "am-ET"
  | CY_GB -> `String "cy-GB"
  | DA_DK -> `String "da-DK"
  | DE_CH -> `String "de-CH"
  | DE_DE -> `String "de-DE"
  | EN_AB -> `String "en-AB"
  | EN_AU -> `String "en-AU"
  | EN_GB -> `String "en-GB"
  | EN_IE -> `String "en-IE"
  | EN_IN -> `String "en-IN"
  | EN_US -> `String "en-US"
  | EN_WL -> `String "en-WL"
  | ES_ES -> `String "es-ES"
  | ES_MX -> `String "es-MX"
  | ES_US -> `String "es-US"
  | FA_AF -> `String "fa-AF"
  | FA_IR -> `String "fa-IR"
  | FR_CA -> `String "fr-CA"
  | FR_FR -> `String "fr-FR"
  | GA_IE -> `String "ga-IE"
  | GD_GB -> `String "gd-GB"
  | HE_IL -> `String "he-IL"
  | HI_IN -> `String "hi-IN"
  | HT_HT -> `String "ht-HT"
  | ID_ID -> `String "id-ID"
  | IT_IT -> `String "it-IT"
  | JA_JP -> `String "ja-JP"
  | JV_ID -> `String "jv-ID"
  | KM_KH -> `String "km-KH"
  | KO_KR -> `String "ko-KR"
  | MY_MM -> `String "my-MM"
  | MS_MY -> `String "ms-MY"
  | NL_NL -> `String "nl-NL"
  | PT_BR -> `String "pt-BR"
  | PT_PT -> `String "pt-PT"
  | RU_RU -> `String "ru-RU"
  | TA_IN -> `String "ta-IN"
  | TE_IN -> `String "te-IN"
  | TR_TR -> `String "tr-TR"
  | ZH_CN -> `String "zh-CN"
  | ZH_TW -> `String "zh-TW"
  | TH_TH -> `String "th-TH"
  | EN_ZA -> `String "en-ZA"
  | EN_NZ -> `String "en-NZ"
  | VI_VN -> `String "vi-VN"
  | SV_SE -> `String "sv-SE"
  | AB_GE -> `String "ab-GE"
  | AST_ES -> `String "ast-ES"
  | AZ_AZ -> `String "az-AZ"
  | BA_RU -> `String "ba-RU"
  | BE_BY -> `String "be-BY"
  | BG_BG -> `String "bg-BG"
  | BN_IN -> `String "bn-IN"
  | BS_BA -> `String "bs-BA"
  | CA_ES -> `String "ca-ES"
  | CKB_IQ -> `String "ckb-IQ"
  | CKB_IR -> `String "ckb-IR"
  | CS_CZ -> `String "cs-CZ"
  | CY_WL -> `String "cy-WL"
  | EL_GR -> `String "el-GR"
  | ET_EE -> `String "et-EE"
  | ET_ET -> `String "et-ET"
  | EU_ES -> `String "eu-ES"
  | FI_FI -> `String "fi-FI"
  | GL_ES -> `String "gl-ES"
  | GU_IN -> `String "gu-IN"
  | HA_NG -> `String "ha-NG"
  | HR_HR -> `String "hr-HR"
  | HU_HU -> `String "hu-HU"
  | HY_AM -> `String "hy-AM"
  | IS_IS -> `String "is-IS"
  | KA_GE -> `String "ka-GE"
  | KAB_DZ -> `String "kab-DZ"
  | KK_KZ -> `String "kk-KZ"
  | KN_IN -> `String "kn-IN"
  | KY_KG -> `String "ky-KG"
  | LG_IN -> `String "lg-IN"
  | LT_LT -> `String "lt-LT"
  | LV_LV -> `String "lv-LV"
  | MHR_RU -> `String "mhr-RU"
  | MI_NZ -> `String "mi-NZ"
  | MK_MK -> `String "mk-MK"
  | ML_IN -> `String "ml-IN"
  | MN_MN -> `String "mn-MN"
  | MR_IN -> `String "mr-IN"
  | MT_MT -> `String "mt-MT"
  | NO_NO -> `String "no-NO"
  | NE_NP -> `String "ne-NP"
  | OR_IN -> `String "or-IN"
  | PA_IN -> `String "pa-IN"
  | PL_PL -> `String "pl-PL"
  | PS_AF -> `String "ps-AF"
  | RO_RO -> `String "ro-RO"
  | RW_RW -> `String "rw-RW"
  | SI_LK -> `String "si-LK"
  | SK_SK -> `String "sk-SK"
  | SL_SI -> `String "sl-SI"
  | SO_SO -> `String "so-SO"
  | SQ_AL -> `String "sq-AL"
  | SR_RS -> `String "sr-RS"
  | SU_ID -> `String "su-ID"
  | SW_BI -> `String "sw-BI"
  | SW_KE -> `String "sw-KE"
  | SW_RW -> `String "sw-RW"
  | SW_TZ -> `String "sw-TZ"
  | SW_UG -> `String "sw-UG"
  | TL_PH -> `String "tl-PH"
  | TT_RU -> `String "tt-RU"
  | UG_CN -> `String "ug-CN"
  | UK_UA -> `String "uk-UA"
  | UZ_UZ -> `String "uz-UZ"
  | WO_SN -> `String "wo-SN"
  | ZH_HK -> `String "zh-HK"
  | ZU_ZA -> `String "zu-ZA"

let language_id_settings_map_to_yojson tree =
  map_to_yojson language_code_to_yojson language_id_settings_to_yojson tree

let language_options_to_yojson tree = list_to_yojson language_code_to_yojson tree

let pii_entity_type_to_yojson (x : pii_entity_type) =
  match x with
  | BANK_ACCOUNT_NUMBER -> `String "BANK_ACCOUNT_NUMBER"
  | BANK_ROUTING -> `String "BANK_ROUTING"
  | CREDIT_DEBIT_NUMBER -> `String "CREDIT_DEBIT_NUMBER"
  | CREDIT_DEBIT_CVV -> `String "CREDIT_DEBIT_CVV"
  | CREDIT_DEBIT_EXPIRY -> `String "CREDIT_DEBIT_EXPIRY"
  | PIN -> `String "PIN"
  | EMAIL -> `String "EMAIL"
  | ADDRESS -> `String "ADDRESS"
  | NAME -> `String "NAME"
  | PHONE -> `String "PHONE"
  | SSN -> `String "SSN"
  | ALL -> `String "ALL"

let pii_entity_types_to_yojson tree = list_to_yojson pii_entity_type_to_yojson tree

let redaction_output_to_yojson (x : redaction_output) =
  match x with
  | REDACTED -> `String "redacted"
  | REDACTED_AND_UNREDACTED -> `String "redacted_and_unredacted"

let redaction_type_to_yojson (x : redaction_type) = match x with PII -> `String "PII"

let content_redaction_to_yojson (x : content_redaction) =
  assoc_to_yojson
    [
      ("RedactionType", Some (redaction_type_to_yojson x.redaction_type));
      ("RedactionOutput", Some (redaction_output_to_yojson x.redaction_output));
      ("PiiEntityTypes", option_to_yojson pii_entity_types_to_yojson x.pii_entity_types);
    ]

let vocabulary_filter_method_to_yojson (x : vocabulary_filter_method) =
  match x with REMOVE -> `String "remove" | MASK -> `String "mask" | TAG -> `String "tag"

let call_analytics_job_settings_to_yojson (x : call_analytics_job_settings) =
  assoc_to_yojson
    [
      ("VocabularyName", option_to_yojson vocabulary_name_to_yojson x.vocabulary_name);
      ( "VocabularyFilterName",
        option_to_yojson vocabulary_filter_name_to_yojson x.vocabulary_filter_name );
      ( "VocabularyFilterMethod",
        option_to_yojson vocabulary_filter_method_to_yojson x.vocabulary_filter_method );
      ("LanguageModelName", option_to_yojson model_name_to_yojson x.language_model_name);
      ("ContentRedaction", option_to_yojson content_redaction_to_yojson x.content_redaction);
      ("LanguageOptions", option_to_yojson language_options_to_yojson x.language_options);
      ( "LanguageIdSettings",
        option_to_yojson language_id_settings_map_to_yojson x.language_id_settings );
      ("Summarization", option_to_yojson summarization_to_yojson x.summarization);
    ]

let identified_language_score_to_yojson = float_to_yojson
let data_access_role_arn_to_yojson = string_to_yojson
let date_time_to_yojson = timestamp_epoch_seconds_to_yojson
let uri_to_yojson = string_to_yojson

let transcript_to_yojson (x : transcript) =
  assoc_to_yojson
    [
      ("TranscriptFileUri", option_to_yojson uri_to_yojson x.transcript_file_uri);
      ("RedactedTranscriptFileUri", option_to_yojson uri_to_yojson x.redacted_transcript_file_uri);
    ]

let media_to_yojson (x : media) =
  assoc_to_yojson
    [
      ("MediaFileUri", option_to_yojson uri_to_yojson x.media_file_uri);
      ("RedactedMediaFileUri", option_to_yojson uri_to_yojson x.redacted_media_file_uri);
    ]

let media_format_to_yojson (x : media_format) =
  match x with
  | MP3 -> `String "mp3"
  | MP4 -> `String "mp4"
  | WAV -> `String "wav"
  | FLAC -> `String "flac"
  | OGG -> `String "ogg"
  | AMR -> `String "amr"
  | WEBM -> `String "webm"
  | M4A -> `String "m4a"

let media_sample_rate_hertz_to_yojson = int_to_yojson
let string__to_yojson = string_to_yojson

let call_analytics_skipped_reason_code_to_yojson (x : call_analytics_skipped_reason_code) =
  match x with
  | INSUFFICIENT_CONVERSATION_CONTENT -> `String "INSUFFICIENT_CONVERSATION_CONTENT"
  | FAILED_SAFETY_GUIDELINES -> `String "FAILED_SAFETY_GUIDELINES"

let call_analytics_skipped_feature_to_yojson (x : call_analytics_skipped_feature) =
  assoc_to_yojson
    [
      ("Feature", option_to_yojson call_analytics_feature_to_yojson x.feature);
      ("ReasonCode", option_to_yojson call_analytics_skipped_reason_code_to_yojson x.reason_code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let call_analytics_skipped_feature_list_to_yojson tree =
  list_to_yojson call_analytics_skipped_feature_to_yojson tree

let call_analytics_job_details_to_yojson (x : call_analytics_job_details) =
  assoc_to_yojson
    [ ("Skipped", option_to_yojson call_analytics_skipped_feature_list_to_yojson x.skipped) ]

let call_analytics_job_status_to_yojson (x : call_analytics_job_status) =
  match x with
  | QUEUED -> `String "QUEUED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"

let call_analytics_job_name_to_yojson = string_to_yojson

let call_analytics_job_to_yojson (x : call_analytics_job) =
  assoc_to_yojson
    [
      ( "CallAnalyticsJobName",
        option_to_yojson call_analytics_job_name_to_yojson x.call_analytics_job_name );
      ( "CallAnalyticsJobStatus",
        option_to_yojson call_analytics_job_status_to_yojson x.call_analytics_job_status );
      ( "CallAnalyticsJobDetails",
        option_to_yojson call_analytics_job_details_to_yojson x.call_analytics_job_details );
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ( "MediaSampleRateHertz",
        option_to_yojson media_sample_rate_hertz_to_yojson x.media_sample_rate_hertz );
      ("MediaFormat", option_to_yojson media_format_to_yojson x.media_format);
      ("Media", option_to_yojson media_to_yojson x.media);
      ("Transcript", option_to_yojson transcript_to_yojson x.transcript);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("CreationTime", option_to_yojson date_time_to_yojson x.creation_time);
      ("CompletionTime", option_to_yojson date_time_to_yojson x.completion_time);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("DataAccessRoleArn", option_to_yojson data_access_role_arn_to_yojson x.data_access_role_arn);
      ( "IdentifiedLanguageScore",
        option_to_yojson identified_language_score_to_yojson x.identified_language_score );
      ("Settings", option_to_yojson call_analytics_job_settings_to_yojson x.settings);
      ("ChannelDefinitions", option_to_yojson channel_definitions_to_yojson x.channel_definitions);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let call_analytics_job_summary_to_yojson (x : call_analytics_job_summary) =
  assoc_to_yojson
    [
      ( "CallAnalyticsJobName",
        option_to_yojson call_analytics_job_name_to_yojson x.call_analytics_job_name );
      ("CreationTime", option_to_yojson date_time_to_yojson x.creation_time);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("CompletionTime", option_to_yojson date_time_to_yojson x.completion_time);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ( "CallAnalyticsJobStatus",
        option_to_yojson call_analytics_job_status_to_yojson x.call_analytics_job_status );
      ( "CallAnalyticsJobDetails",
        option_to_yojson call_analytics_job_details_to_yojson x.call_analytics_job_details );
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let call_analytics_job_summaries_to_yojson tree =
  list_to_yojson call_analytics_job_summary_to_yojson tree

let category_name_to_yojson = string_to_yojson

let input_type_to_yojson (x : input_type) =
  match x with REAL_TIME -> `String "REAL_TIME" | POST_CALL -> `String "POST_CALL"

let percentage_to_yojson = int_to_yojson

let relative_time_range_to_yojson (x : relative_time_range) =
  assoc_to_yojson
    [
      ("StartPercentage", option_to_yojson percentage_to_yojson x.start_percentage);
      ("EndPercentage", option_to_yojson percentage_to_yojson x.end_percentage);
      ("First", option_to_yojson percentage_to_yojson x.first);
      ("Last", option_to_yojson percentage_to_yojson x.last);
    ]

let sentiment_value_to_yojson (x : sentiment_value) =
  match x with
  | POSITIVE -> `String "POSITIVE"
  | NEGATIVE -> `String "NEGATIVE"
  | NEUTRAL -> `String "NEUTRAL"
  | MIXED -> `String "MIXED"

let sentiment_value_list_to_yojson tree = list_to_yojson sentiment_value_to_yojson tree

let sentiment_filter_to_yojson (x : sentiment_filter) =
  assoc_to_yojson
    [
      ("Sentiments", Some (sentiment_value_list_to_yojson x.sentiments));
      ("AbsoluteTimeRange", option_to_yojson absolute_time_range_to_yojson x.absolute_time_range);
      ("RelativeTimeRange", option_to_yojson relative_time_range_to_yojson x.relative_time_range);
      ("ParticipantRole", option_to_yojson participant_role_to_yojson x.participant_role);
      ("Negate", option_to_yojson boolean__to_yojson x.negate);
    ]

let non_empty_string_to_yojson = string_to_yojson
let string_target_list_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let transcript_filter_type_to_yojson (x : transcript_filter_type) =
  match x with EXACT -> `String "EXACT"

let transcript_filter_to_yojson (x : transcript_filter) =
  assoc_to_yojson
    [
      ("TranscriptFilterType", Some (transcript_filter_type_to_yojson x.transcript_filter_type));
      ("AbsoluteTimeRange", option_to_yojson absolute_time_range_to_yojson x.absolute_time_range);
      ("RelativeTimeRange", option_to_yojson relative_time_range_to_yojson x.relative_time_range);
      ("ParticipantRole", option_to_yojson participant_role_to_yojson x.participant_role);
      ("Negate", option_to_yojson boolean__to_yojson x.negate);
      ("Targets", Some (string_target_list_to_yojson x.targets));
    ]

let interruption_filter_to_yojson (x : interruption_filter) =
  assoc_to_yojson
    [
      ("Threshold", option_to_yojson timestamp_milliseconds_to_yojson x.threshold);
      ("ParticipantRole", option_to_yojson participant_role_to_yojson x.participant_role);
      ("AbsoluteTimeRange", option_to_yojson absolute_time_range_to_yojson x.absolute_time_range);
      ("RelativeTimeRange", option_to_yojson relative_time_range_to_yojson x.relative_time_range);
      ("Negate", option_to_yojson boolean__to_yojson x.negate);
    ]

let non_talk_time_filter_to_yojson (x : non_talk_time_filter) =
  assoc_to_yojson
    [
      ("Threshold", option_to_yojson timestamp_milliseconds_to_yojson x.threshold);
      ("AbsoluteTimeRange", option_to_yojson absolute_time_range_to_yojson x.absolute_time_range);
      ("RelativeTimeRange", option_to_yojson relative_time_range_to_yojson x.relative_time_range);
      ("Negate", option_to_yojson boolean__to_yojson x.negate);
    ]

let rule_to_yojson (x : rule) =
  match x with
  | NonTalkTimeFilter arg ->
      assoc_to_yojson [ ("NonTalkTimeFilter", Some (non_talk_time_filter_to_yojson arg)) ]
  | InterruptionFilter arg ->
      assoc_to_yojson [ ("InterruptionFilter", Some (interruption_filter_to_yojson arg)) ]
  | TranscriptFilter arg ->
      assoc_to_yojson [ ("TranscriptFilter", Some (transcript_filter_to_yojson arg)) ]
  | SentimentFilter arg ->
      assoc_to_yojson [ ("SentimentFilter", Some (sentiment_filter_to_yojson arg)) ]

let rule_list_to_yojson tree = list_to_yojson rule_to_yojson tree

let category_properties_to_yojson (x : category_properties) =
  assoc_to_yojson
    [
      ("CategoryName", option_to_yojson category_name_to_yojson x.category_name);
      ("Rules", option_to_yojson rule_list_to_yojson x.rules);
      ("CreateTime", option_to_yojson date_time_to_yojson x.create_time);
      ("LastUpdateTime", option_to_yojson date_time_to_yojson x.last_update_time);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("InputType", option_to_yojson input_type_to_yojson x.input_type);
    ]

let category_properties_list_to_yojson tree = list_to_yojson category_properties_to_yojson tree

let medical_scribe_note_template_to_yojson (x : medical_scribe_note_template) =
  match x with
  | HISTORY_AND_PHYSICAL -> `String "HISTORY_AND_PHYSICAL"
  | GIRPP -> `String "GIRPP"
  | BIRP -> `String "BIRP"
  | SIRP -> `String "SIRP"
  | DAP -> `String "DAP"
  | BEHAVIORAL_SOAP -> `String "BEHAVIORAL_SOAP"
  | PHYSICAL_SOAP -> `String "PHYSICAL_SOAP"

let clinical_note_generation_settings_to_yojson (x : clinical_note_generation_settings) =
  assoc_to_yojson
    [ ("NoteTemplate", option_to_yojson medical_scribe_note_template_to_yojson x.note_template) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let internal_failure_exception_to_yojson (x : internal_failure_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let create_call_analytics_category_response_to_yojson (x : create_call_analytics_category_response)
    =
  assoc_to_yojson
    [ ("CategoryProperties", option_to_yojson category_properties_to_yojson x.category_properties) ]

let create_call_analytics_category_request_to_yojson (x : create_call_analytics_category_request) =
  assoc_to_yojson
    [
      ("CategoryName", Some (category_name_to_yojson x.category_name));
      ("Rules", Some (rule_list_to_yojson x.rules));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("InputType", option_to_yojson input_type_to_yojson x.input_type);
    ]

let model_status_to_yojson (x : model_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"

let input_data_config_to_yojson (x : input_data_config) =
  assoc_to_yojson
    [
      ("S3Uri", Some (uri_to_yojson x.s3_uri));
      ("TuningDataS3Uri", option_to_yojson uri_to_yojson x.tuning_data_s3_uri);
      ("DataAccessRoleArn", Some (data_access_role_arn_to_yojson x.data_access_role_arn));
    ]

let create_language_model_response_to_yojson (x : create_language_model_response) =
  assoc_to_yojson
    [
      ("LanguageCode", option_to_yojson clm_language_code_to_yojson x.language_code);
      ("BaseModelName", option_to_yojson base_model_name_to_yojson x.base_model_name);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("ModelStatus", option_to_yojson model_status_to_yojson x.model_status);
    ]

let create_language_model_request_to_yojson (x : create_language_model_request) =
  assoc_to_yojson
    [
      ("LanguageCode", Some (clm_language_code_to_yojson x.language_code));
      ("BaseModelName", Some (base_model_name_to_yojson x.base_model_name));
      ("ModelName", Some (model_name_to_yojson x.model_name));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let vocabulary_state_to_yojson (x : vocabulary_state) =
  match x with
  | PENDING -> `String "PENDING"
  | READY -> `String "READY"
  | FAILED -> `String "FAILED"

let create_medical_vocabulary_response_to_yojson (x : create_medical_vocabulary_response) =
  assoc_to_yojson
    [
      ("VocabularyName", option_to_yojson vocabulary_name_to_yojson x.vocabulary_name);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("VocabularyState", option_to_yojson vocabulary_state_to_yojson x.vocabulary_state);
      ("LastModifiedTime", option_to_yojson date_time_to_yojson x.last_modified_time);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let create_medical_vocabulary_request_to_yojson (x : create_medical_vocabulary_request) =
  assoc_to_yojson
    [
      ("VocabularyName", Some (vocabulary_name_to_yojson x.vocabulary_name));
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("VocabularyFileUri", Some (uri_to_yojson x.vocabulary_file_uri));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_vocabulary_response_to_yojson (x : create_vocabulary_response) =
  assoc_to_yojson
    [
      ("VocabularyName", option_to_yojson vocabulary_name_to_yojson x.vocabulary_name);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("VocabularyState", option_to_yojson vocabulary_state_to_yojson x.vocabulary_state);
      ("LastModifiedTime", option_to_yojson date_time_to_yojson x.last_modified_time);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let phrase_to_yojson = string_to_yojson
let phrases_to_yojson tree = list_to_yojson phrase_to_yojson tree

let create_vocabulary_request_to_yojson (x : create_vocabulary_request) =
  assoc_to_yojson
    [
      ("VocabularyName", Some (vocabulary_name_to_yojson x.vocabulary_name));
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("Phrases", option_to_yojson phrases_to_yojson x.phrases);
      ("VocabularyFileUri", option_to_yojson uri_to_yojson x.vocabulary_file_uri);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("DataAccessRoleArn", option_to_yojson data_access_role_arn_to_yojson x.data_access_role_arn);
    ]

let create_vocabulary_filter_response_to_yojson (x : create_vocabulary_filter_response) =
  assoc_to_yojson
    [
      ( "VocabularyFilterName",
        option_to_yojson vocabulary_filter_name_to_yojson x.vocabulary_filter_name );
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("LastModifiedTime", option_to_yojson date_time_to_yojson x.last_modified_time);
    ]

let word_to_yojson = string_to_yojson
let words_to_yojson tree = list_to_yojson word_to_yojson tree

let create_vocabulary_filter_request_to_yojson (x : create_vocabulary_filter_request) =
  assoc_to_yojson
    [
      ("VocabularyFilterName", Some (vocabulary_filter_name_to_yojson x.vocabulary_filter_name));
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("Words", option_to_yojson words_to_yojson x.words);
      ("VocabularyFilterFileUri", option_to_yojson uri_to_yojson x.vocabulary_filter_file_uri);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("DataAccessRoleArn", option_to_yojson data_access_role_arn_to_yojson x.data_access_role_arn);
    ]

let not_found_exception_to_yojson (x : not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let delete_call_analytics_category_response_to_yojson = unit_to_yojson

let delete_call_analytics_category_request_to_yojson (x : delete_call_analytics_category_request) =
  assoc_to_yojson [ ("CategoryName", Some (category_name_to_yojson x.category_name)) ]

let delete_call_analytics_job_response_to_yojson = unit_to_yojson

let delete_call_analytics_job_request_to_yojson (x : delete_call_analytics_job_request) =
  assoc_to_yojson
    [ ("CallAnalyticsJobName", Some (call_analytics_job_name_to_yojson x.call_analytics_job_name)) ]

let delete_language_model_request_to_yojson (x : delete_language_model_request) =
  assoc_to_yojson [ ("ModelName", Some (model_name_to_yojson x.model_name)) ]

let transcription_job_name_to_yojson = string_to_yojson

let delete_medical_scribe_job_request_to_yojson (x : delete_medical_scribe_job_request) =
  assoc_to_yojson
    [ ("MedicalScribeJobName", Some (transcription_job_name_to_yojson x.medical_scribe_job_name)) ]

let delete_medical_transcription_job_request_to_yojson
    (x : delete_medical_transcription_job_request) =
  assoc_to_yojson
    [
      ( "MedicalTranscriptionJobName",
        Some (transcription_job_name_to_yojson x.medical_transcription_job_name) );
    ]

let delete_medical_vocabulary_request_to_yojson (x : delete_medical_vocabulary_request) =
  assoc_to_yojson [ ("VocabularyName", Some (vocabulary_name_to_yojson x.vocabulary_name)) ]

let delete_transcription_job_request_to_yojson (x : delete_transcription_job_request) =
  assoc_to_yojson
    [ ("TranscriptionJobName", Some (transcription_job_name_to_yojson x.transcription_job_name)) ]

let delete_vocabulary_request_to_yojson (x : delete_vocabulary_request) =
  assoc_to_yojson [ ("VocabularyName", Some (vocabulary_name_to_yojson x.vocabulary_name)) ]

let delete_vocabulary_filter_request_to_yojson (x : delete_vocabulary_filter_request) =
  assoc_to_yojson
    [ ("VocabularyFilterName", Some (vocabulary_filter_name_to_yojson x.vocabulary_filter_name)) ]

let language_model_to_yojson (x : language_model) =
  assoc_to_yojson
    [
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("CreateTime", option_to_yojson date_time_to_yojson x.create_time);
      ("LastModifiedTime", option_to_yojson date_time_to_yojson x.last_modified_time);
      ("LanguageCode", option_to_yojson clm_language_code_to_yojson x.language_code);
      ("BaseModelName", option_to_yojson base_model_name_to_yojson x.base_model_name);
      ("ModelStatus", option_to_yojson model_status_to_yojson x.model_status);
      ("UpgradeAvailability", option_to_yojson boolean__to_yojson x.upgrade_availability);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
    ]

let describe_language_model_response_to_yojson (x : describe_language_model_response) =
  assoc_to_yojson [ ("LanguageModel", option_to_yojson language_model_to_yojson x.language_model) ]

let describe_language_model_request_to_yojson (x : describe_language_model_request) =
  assoc_to_yojson [ ("ModelName", Some (model_name_to_yojson x.model_name)) ]

let duration_in_seconds_to_yojson = float_to_yojson

let get_call_analytics_category_response_to_yojson (x : get_call_analytics_category_response) =
  assoc_to_yojson
    [ ("CategoryProperties", option_to_yojson category_properties_to_yojson x.category_properties) ]

let get_call_analytics_category_request_to_yojson (x : get_call_analytics_category_request) =
  assoc_to_yojson [ ("CategoryName", Some (category_name_to_yojson x.category_name)) ]

let get_call_analytics_job_response_to_yojson (x : get_call_analytics_job_response) =
  assoc_to_yojson
    [ ("CallAnalyticsJob", option_to_yojson call_analytics_job_to_yojson x.call_analytics_job) ]

let get_call_analytics_job_request_to_yojson (x : get_call_analytics_job_request) =
  assoc_to_yojson
    [ ("CallAnalyticsJobName", Some (call_analytics_job_name_to_yojson x.call_analytics_job_name)) ]

let medical_scribe_participant_role_to_yojson (x : medical_scribe_participant_role) =
  match x with PATIENT -> `String "PATIENT" | CLINICIAN -> `String "CLINICIAN"

let medical_scribe_channel_id_to_yojson = int_to_yojson

let medical_scribe_channel_definition_to_yojson (x : medical_scribe_channel_definition) =
  assoc_to_yojson
    [
      ("ChannelId", Some (medical_scribe_channel_id_to_yojson x.channel_id));
      ("ParticipantRole", Some (medical_scribe_participant_role_to_yojson x.participant_role));
    ]

let medical_scribe_channel_definitions_to_yojson tree =
  list_to_yojson medical_scribe_channel_definition_to_yojson tree

let max_speakers_to_yojson = int_to_yojson

let medical_scribe_settings_to_yojson (x : medical_scribe_settings) =
  assoc_to_yojson
    [
      ("ShowSpeakerLabels", option_to_yojson boolean__to_yojson x.show_speaker_labels);
      ("MaxSpeakerLabels", option_to_yojson max_speakers_to_yojson x.max_speaker_labels);
      ("ChannelIdentification", option_to_yojson boolean__to_yojson x.channel_identification);
      ("VocabularyName", option_to_yojson vocabulary_name_to_yojson x.vocabulary_name);
      ( "VocabularyFilterName",
        option_to_yojson vocabulary_filter_name_to_yojson x.vocabulary_filter_name );
      ( "VocabularyFilterMethod",
        option_to_yojson vocabulary_filter_method_to_yojson x.vocabulary_filter_method );
      ( "ClinicalNoteGenerationSettings",
        option_to_yojson clinical_note_generation_settings_to_yojson
          x.clinical_note_generation_settings );
    ]

let medical_scribe_output_to_yojson (x : medical_scribe_output) =
  assoc_to_yojson
    [
      ("TranscriptFileUri", Some (uri_to_yojson x.transcript_file_uri));
      ("ClinicalDocumentUri", Some (uri_to_yojson x.clinical_document_uri));
    ]

let medical_scribe_language_code_to_yojson (x : medical_scribe_language_code) =
  match x with EN_US -> `String "en-US"

let medical_scribe_job_status_to_yojson (x : medical_scribe_job_status) =
  match x with
  | QUEUED -> `String "QUEUED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"

let medical_scribe_job_to_yojson (x : medical_scribe_job) =
  assoc_to_yojson
    [
      ( "MedicalScribeJobName",
        option_to_yojson transcription_job_name_to_yojson x.medical_scribe_job_name );
      ( "MedicalScribeJobStatus",
        option_to_yojson medical_scribe_job_status_to_yojson x.medical_scribe_job_status );
      ("LanguageCode", option_to_yojson medical_scribe_language_code_to_yojson x.language_code);
      ("Media", option_to_yojson media_to_yojson x.media);
      ( "MedicalScribeOutput",
        option_to_yojson medical_scribe_output_to_yojson x.medical_scribe_output );
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("CreationTime", option_to_yojson date_time_to_yojson x.creation_time);
      ("CompletionTime", option_to_yojson date_time_to_yojson x.completion_time);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("Settings", option_to_yojson medical_scribe_settings_to_yojson x.settings);
      ("DataAccessRoleArn", option_to_yojson data_access_role_arn_to_yojson x.data_access_role_arn);
      ( "ChannelDefinitions",
        option_to_yojson medical_scribe_channel_definitions_to_yojson x.channel_definitions );
      ( "MedicalScribeContextProvided",
        option_to_yojson boolean__to_yojson x.medical_scribe_context_provided );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let get_medical_scribe_job_response_to_yojson (x : get_medical_scribe_job_response) =
  assoc_to_yojson
    [ ("MedicalScribeJob", option_to_yojson medical_scribe_job_to_yojson x.medical_scribe_job) ]

let get_medical_scribe_job_request_to_yojson (x : get_medical_scribe_job_request) =
  assoc_to_yojson
    [ ("MedicalScribeJobName", Some (transcription_job_name_to_yojson x.medical_scribe_job_name)) ]

let type__to_yojson (x : type_) =
  match x with CONVERSATION -> `String "CONVERSATION" | DICTATION -> `String "DICTATION"

let specialty_to_yojson (x : specialty) = match x with PRIMARYCARE -> `String "PRIMARYCARE"

let medical_content_identification_type_to_yojson (x : medical_content_identification_type) =
  match x with PHI -> `String "PHI"

let max_alternatives_to_yojson = int_to_yojson

let medical_transcription_setting_to_yojson (x : medical_transcription_setting) =
  assoc_to_yojson
    [
      ("ShowSpeakerLabels", option_to_yojson boolean__to_yojson x.show_speaker_labels);
      ("MaxSpeakerLabels", option_to_yojson max_speakers_to_yojson x.max_speaker_labels);
      ("ChannelIdentification", option_to_yojson boolean__to_yojson x.channel_identification);
      ("ShowAlternatives", option_to_yojson boolean__to_yojson x.show_alternatives);
      ("MaxAlternatives", option_to_yojson max_alternatives_to_yojson x.max_alternatives);
      ("VocabularyName", option_to_yojson vocabulary_name_to_yojson x.vocabulary_name);
    ]

let medical_transcript_to_yojson (x : medical_transcript) =
  assoc_to_yojson [ ("TranscriptFileUri", option_to_yojson uri_to_yojson x.transcript_file_uri) ]

let medical_media_sample_rate_hertz_to_yojson = int_to_yojson

let transcription_job_status_to_yojson (x : transcription_job_status) =
  match x with
  | QUEUED -> `String "QUEUED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"

let medical_transcription_job_to_yojson (x : medical_transcription_job) =
  assoc_to_yojson
    [
      ( "MedicalTranscriptionJobName",
        option_to_yojson transcription_job_name_to_yojson x.medical_transcription_job_name );
      ( "TranscriptionJobStatus",
        option_to_yojson transcription_job_status_to_yojson x.transcription_job_status );
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ( "MediaSampleRateHertz",
        option_to_yojson medical_media_sample_rate_hertz_to_yojson x.media_sample_rate_hertz );
      ("MediaFormat", option_to_yojson media_format_to_yojson x.media_format);
      ("Media", option_to_yojson media_to_yojson x.media);
      ("Transcript", option_to_yojson medical_transcript_to_yojson x.transcript);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("CreationTime", option_to_yojson date_time_to_yojson x.creation_time);
      ("CompletionTime", option_to_yojson date_time_to_yojson x.completion_time);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("Settings", option_to_yojson medical_transcription_setting_to_yojson x.settings);
      ( "ContentIdentificationType",
        option_to_yojson medical_content_identification_type_to_yojson x.content_identification_type
      );
      ("Specialty", option_to_yojson specialty_to_yojson x.specialty);
      ("Type", option_to_yojson type__to_yojson x.type_);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let get_medical_transcription_job_response_to_yojson (x : get_medical_transcription_job_response) =
  assoc_to_yojson
    [
      ( "MedicalTranscriptionJob",
        option_to_yojson medical_transcription_job_to_yojson x.medical_transcription_job );
    ]

let get_medical_transcription_job_request_to_yojson (x : get_medical_transcription_job_request) =
  assoc_to_yojson
    [
      ( "MedicalTranscriptionJobName",
        Some (transcription_job_name_to_yojson x.medical_transcription_job_name) );
    ]

let get_medical_vocabulary_response_to_yojson (x : get_medical_vocabulary_response) =
  assoc_to_yojson
    [
      ("VocabularyName", option_to_yojson vocabulary_name_to_yojson x.vocabulary_name);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("VocabularyState", option_to_yojson vocabulary_state_to_yojson x.vocabulary_state);
      ("LastModifiedTime", option_to_yojson date_time_to_yojson x.last_modified_time);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("DownloadUri", option_to_yojson uri_to_yojson x.download_uri);
    ]

let get_medical_vocabulary_request_to_yojson (x : get_medical_vocabulary_request) =
  assoc_to_yojson [ ("VocabularyName", Some (vocabulary_name_to_yojson x.vocabulary_name)) ]

let toxicity_category_to_yojson (x : toxicity_category) = match x with ALL -> `String "ALL"
let toxicity_categories_to_yojson tree = list_to_yojson toxicity_category_to_yojson tree

let toxicity_detection_settings_to_yojson (x : toxicity_detection_settings) =
  assoc_to_yojson
    [ ("ToxicityCategories", Some (toxicity_categories_to_yojson x.toxicity_categories)) ]

let toxicity_detection_to_yojson tree = list_to_yojson toxicity_detection_settings_to_yojson tree
let subtitle_output_start_index_to_yojson = int_to_yojson
let subtitle_file_uris_to_yojson tree = list_to_yojson uri_to_yojson tree

let subtitle_format_to_yojson (x : subtitle_format) =
  match x with VTT -> `String "vtt" | SRT -> `String "srt"

let subtitle_formats_to_yojson tree = list_to_yojson subtitle_format_to_yojson tree

let subtitles_output_to_yojson (x : subtitles_output) =
  assoc_to_yojson
    [
      ("Formats", option_to_yojson subtitle_formats_to_yojson x.formats);
      ("SubtitleFileUris", option_to_yojson subtitle_file_uris_to_yojson x.subtitle_file_uris);
      ( "OutputStartIndex",
        option_to_yojson subtitle_output_start_index_to_yojson x.output_start_index );
    ]

let language_code_item_to_yojson (x : language_code_item) =
  assoc_to_yojson
    [
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("DurationInSeconds", option_to_yojson duration_in_seconds_to_yojson x.duration_in_seconds);
    ]

let language_code_list_to_yojson tree = list_to_yojson language_code_item_to_yojson tree

let job_execution_settings_to_yojson (x : job_execution_settings) =
  assoc_to_yojson
    [
      ("AllowDeferredExecution", option_to_yojson boolean__to_yojson x.allow_deferred_execution);
      ("DataAccessRoleArn", option_to_yojson data_access_role_arn_to_yojson x.data_access_role_arn);
    ]

let model_settings_to_yojson (x : model_settings) =
  assoc_to_yojson
    [ ("LanguageModelName", option_to_yojson model_name_to_yojson x.language_model_name) ]

let settings_to_yojson (x : settings) =
  assoc_to_yojson
    [
      ("VocabularyName", option_to_yojson vocabulary_name_to_yojson x.vocabulary_name);
      ("ShowSpeakerLabels", option_to_yojson boolean__to_yojson x.show_speaker_labels);
      ("MaxSpeakerLabels", option_to_yojson max_speakers_to_yojson x.max_speaker_labels);
      ("ChannelIdentification", option_to_yojson boolean__to_yojson x.channel_identification);
      ("ShowAlternatives", option_to_yojson boolean__to_yojson x.show_alternatives);
      ("MaxAlternatives", option_to_yojson max_alternatives_to_yojson x.max_alternatives);
      ( "VocabularyFilterName",
        option_to_yojson vocabulary_filter_name_to_yojson x.vocabulary_filter_name );
      ( "VocabularyFilterMethod",
        option_to_yojson vocabulary_filter_method_to_yojson x.vocabulary_filter_method );
    ]

let transcription_job_to_yojson (x : transcription_job) =
  assoc_to_yojson
    [
      ( "TranscriptionJobName",
        option_to_yojson transcription_job_name_to_yojson x.transcription_job_name );
      ( "TranscriptionJobStatus",
        option_to_yojson transcription_job_status_to_yojson x.transcription_job_status );
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ( "MediaSampleRateHertz",
        option_to_yojson media_sample_rate_hertz_to_yojson x.media_sample_rate_hertz );
      ("MediaFormat", option_to_yojson media_format_to_yojson x.media_format);
      ("Media", option_to_yojson media_to_yojson x.media);
      ("Transcript", option_to_yojson transcript_to_yojson x.transcript);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("CreationTime", option_to_yojson date_time_to_yojson x.creation_time);
      ("CompletionTime", option_to_yojson date_time_to_yojson x.completion_time);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("Settings", option_to_yojson settings_to_yojson x.settings);
      ("ModelSettings", option_to_yojson model_settings_to_yojson x.model_settings);
      ( "JobExecutionSettings",
        option_to_yojson job_execution_settings_to_yojson x.job_execution_settings );
      ("ContentRedaction", option_to_yojson content_redaction_to_yojson x.content_redaction);
      ("IdentifyLanguage", option_to_yojson boolean__to_yojson x.identify_language);
      ( "IdentifyMultipleLanguages",
        option_to_yojson boolean__to_yojson x.identify_multiple_languages );
      ("LanguageOptions", option_to_yojson language_options_to_yojson x.language_options);
      ( "IdentifiedLanguageScore",
        option_to_yojson identified_language_score_to_yojson x.identified_language_score );
      ("LanguageCodes", option_to_yojson language_code_list_to_yojson x.language_codes);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Subtitles", option_to_yojson subtitles_output_to_yojson x.subtitles);
      ( "LanguageIdSettings",
        option_to_yojson language_id_settings_map_to_yojson x.language_id_settings );
      ("ToxicityDetection", option_to_yojson toxicity_detection_to_yojson x.toxicity_detection);
    ]

let get_transcription_job_response_to_yojson (x : get_transcription_job_response) =
  assoc_to_yojson
    [ ("TranscriptionJob", option_to_yojson transcription_job_to_yojson x.transcription_job) ]

let get_transcription_job_request_to_yojson (x : get_transcription_job_request) =
  assoc_to_yojson
    [ ("TranscriptionJobName", Some (transcription_job_name_to_yojson x.transcription_job_name)) ]

let get_vocabulary_response_to_yojson (x : get_vocabulary_response) =
  assoc_to_yojson
    [
      ("VocabularyName", option_to_yojson vocabulary_name_to_yojson x.vocabulary_name);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("VocabularyState", option_to_yojson vocabulary_state_to_yojson x.vocabulary_state);
      ("LastModifiedTime", option_to_yojson date_time_to_yojson x.last_modified_time);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("DownloadUri", option_to_yojson uri_to_yojson x.download_uri);
    ]

let get_vocabulary_request_to_yojson (x : get_vocabulary_request) =
  assoc_to_yojson [ ("VocabularyName", Some (vocabulary_name_to_yojson x.vocabulary_name)) ]

let get_vocabulary_filter_response_to_yojson (x : get_vocabulary_filter_response) =
  assoc_to_yojson
    [
      ( "VocabularyFilterName",
        option_to_yojson vocabulary_filter_name_to_yojson x.vocabulary_filter_name );
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("LastModifiedTime", option_to_yojson date_time_to_yojson x.last_modified_time);
      ("DownloadUri", option_to_yojson uri_to_yojson x.download_uri);
    ]

let get_vocabulary_filter_request_to_yojson (x : get_vocabulary_filter_request) =
  assoc_to_yojson
    [ ("VocabularyFilterName", Some (vocabulary_filter_name_to_yojson x.vocabulary_filter_name)) ]

let kms_encryption_context_map_to_yojson tree =
  map_to_yojson non_empty_string_to_yojson non_empty_string_to_yojson tree

let kms_key_id_to_yojson = string_to_yojson
let next_token_to_yojson = string_to_yojson

let list_call_analytics_categories_response_to_yojson (x : list_call_analytics_categories_response)
    =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Categories", option_to_yojson category_properties_list_to_yojson x.categories);
    ]

let max_results_to_yojson = int_to_yojson

let list_call_analytics_categories_request_to_yojson (x : list_call_analytics_categories_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_call_analytics_jobs_response_to_yojson (x : list_call_analytics_jobs_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson call_analytics_job_status_to_yojson x.status);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "CallAnalyticsJobSummaries",
        option_to_yojson call_analytics_job_summaries_to_yojson x.call_analytics_job_summaries );
    ]

let list_call_analytics_jobs_request_to_yojson (x : list_call_analytics_jobs_request) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson call_analytics_job_status_to_yojson x.status);
      ("JobNameContains", option_to_yojson call_analytics_job_name_to_yojson x.job_name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let models_to_yojson tree = list_to_yojson language_model_to_yojson tree

let list_language_models_response_to_yojson (x : list_language_models_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Models", option_to_yojson models_to_yojson x.models);
    ]

let list_language_models_request_to_yojson (x : list_language_models_request) =
  assoc_to_yojson
    [
      ("StatusEquals", option_to_yojson model_status_to_yojson x.status_equals);
      ("NameContains", option_to_yojson model_name_to_yojson x.name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let medical_scribe_job_summary_to_yojson (x : medical_scribe_job_summary) =
  assoc_to_yojson
    [
      ( "MedicalScribeJobName",
        option_to_yojson transcription_job_name_to_yojson x.medical_scribe_job_name );
      ("CreationTime", option_to_yojson date_time_to_yojson x.creation_time);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("CompletionTime", option_to_yojson date_time_to_yojson x.completion_time);
      ("LanguageCode", option_to_yojson medical_scribe_language_code_to_yojson x.language_code);
      ( "MedicalScribeJobStatus",
        option_to_yojson medical_scribe_job_status_to_yojson x.medical_scribe_job_status );
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let medical_scribe_job_summaries_to_yojson tree =
  list_to_yojson medical_scribe_job_summary_to_yojson tree

let list_medical_scribe_jobs_response_to_yojson (x : list_medical_scribe_jobs_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson medical_scribe_job_status_to_yojson x.status);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "MedicalScribeJobSummaries",
        option_to_yojson medical_scribe_job_summaries_to_yojson x.medical_scribe_job_summaries );
    ]

let list_medical_scribe_jobs_request_to_yojson (x : list_medical_scribe_jobs_request) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson medical_scribe_job_status_to_yojson x.status);
      ("JobNameContains", option_to_yojson transcription_job_name_to_yojson x.job_name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let output_location_type_to_yojson (x : output_location_type) =
  match x with
  | CUSTOMER_BUCKET -> `String "CUSTOMER_BUCKET"
  | SERVICE_BUCKET -> `String "SERVICE_BUCKET"

let medical_transcription_job_summary_to_yojson (x : medical_transcription_job_summary) =
  assoc_to_yojson
    [
      ( "MedicalTranscriptionJobName",
        option_to_yojson transcription_job_name_to_yojson x.medical_transcription_job_name );
      ("CreationTime", option_to_yojson date_time_to_yojson x.creation_time);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("CompletionTime", option_to_yojson date_time_to_yojson x.completion_time);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ( "TranscriptionJobStatus",
        option_to_yojson transcription_job_status_to_yojson x.transcription_job_status );
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("OutputLocationType", option_to_yojson output_location_type_to_yojson x.output_location_type);
      ("Specialty", option_to_yojson specialty_to_yojson x.specialty);
      ( "ContentIdentificationType",
        option_to_yojson medical_content_identification_type_to_yojson x.content_identification_type
      );
      ("Type", option_to_yojson type__to_yojson x.type_);
    ]

let medical_transcription_job_summaries_to_yojson tree =
  list_to_yojson medical_transcription_job_summary_to_yojson tree

let list_medical_transcription_jobs_response_to_yojson
    (x : list_medical_transcription_jobs_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson transcription_job_status_to_yojson x.status);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "MedicalTranscriptionJobSummaries",
        option_to_yojson medical_transcription_job_summaries_to_yojson
          x.medical_transcription_job_summaries );
    ]

let list_medical_transcription_jobs_request_to_yojson (x : list_medical_transcription_jobs_request)
    =
  assoc_to_yojson
    [
      ("Status", option_to_yojson transcription_job_status_to_yojson x.status);
      ("JobNameContains", option_to_yojson transcription_job_name_to_yojson x.job_name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let vocabulary_info_to_yojson (x : vocabulary_info) =
  assoc_to_yojson
    [
      ("VocabularyName", option_to_yojson vocabulary_name_to_yojson x.vocabulary_name);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("LastModifiedTime", option_to_yojson date_time_to_yojson x.last_modified_time);
      ("VocabularyState", option_to_yojson vocabulary_state_to_yojson x.vocabulary_state);
    ]

let vocabularies_to_yojson tree = list_to_yojson vocabulary_info_to_yojson tree

let list_medical_vocabularies_response_to_yojson (x : list_medical_vocabularies_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson vocabulary_state_to_yojson x.status);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Vocabularies", option_to_yojson vocabularies_to_yojson x.vocabularies);
    ]

let list_medical_vocabularies_request_to_yojson (x : list_medical_vocabularies_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("StateEquals", option_to_yojson vocabulary_state_to_yojson x.state_equals);
      ("NameContains", option_to_yojson vocabulary_name_to_yojson x.name_contains);
    ]

let transcribe_arn_to_yojson = string_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson transcribe_arn_to_yojson x.resource_arn);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (transcribe_arn_to_yojson x.resource_arn)) ]

let transcription_job_summary_to_yojson (x : transcription_job_summary) =
  assoc_to_yojson
    [
      ( "TranscriptionJobName",
        option_to_yojson transcription_job_name_to_yojson x.transcription_job_name );
      ("CreationTime", option_to_yojson date_time_to_yojson x.creation_time);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("CompletionTime", option_to_yojson date_time_to_yojson x.completion_time);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ( "TranscriptionJobStatus",
        option_to_yojson transcription_job_status_to_yojson x.transcription_job_status );
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("OutputLocationType", option_to_yojson output_location_type_to_yojson x.output_location_type);
      ("ContentRedaction", option_to_yojson content_redaction_to_yojson x.content_redaction);
      ("ModelSettings", option_to_yojson model_settings_to_yojson x.model_settings);
      ("IdentifyLanguage", option_to_yojson boolean__to_yojson x.identify_language);
      ( "IdentifyMultipleLanguages",
        option_to_yojson boolean__to_yojson x.identify_multiple_languages );
      ( "IdentifiedLanguageScore",
        option_to_yojson identified_language_score_to_yojson x.identified_language_score );
      ("LanguageCodes", option_to_yojson language_code_list_to_yojson x.language_codes);
      ("ToxicityDetection", option_to_yojson toxicity_detection_to_yojson x.toxicity_detection);
    ]

let transcription_job_summaries_to_yojson tree =
  list_to_yojson transcription_job_summary_to_yojson tree

let list_transcription_jobs_response_to_yojson (x : list_transcription_jobs_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson transcription_job_status_to_yojson x.status);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "TranscriptionJobSummaries",
        option_to_yojson transcription_job_summaries_to_yojson x.transcription_job_summaries );
    ]

let list_transcription_jobs_request_to_yojson (x : list_transcription_jobs_request) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson transcription_job_status_to_yojson x.status);
      ("JobNameContains", option_to_yojson transcription_job_name_to_yojson x.job_name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_vocabularies_response_to_yojson (x : list_vocabularies_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson vocabulary_state_to_yojson x.status);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Vocabularies", option_to_yojson vocabularies_to_yojson x.vocabularies);
    ]

let list_vocabularies_request_to_yojson (x : list_vocabularies_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("StateEquals", option_to_yojson vocabulary_state_to_yojson x.state_equals);
      ("NameContains", option_to_yojson vocabulary_name_to_yojson x.name_contains);
    ]

let vocabulary_filter_info_to_yojson (x : vocabulary_filter_info) =
  assoc_to_yojson
    [
      ( "VocabularyFilterName",
        option_to_yojson vocabulary_filter_name_to_yojson x.vocabulary_filter_name );
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("LastModifiedTime", option_to_yojson date_time_to_yojson x.last_modified_time);
    ]

let vocabulary_filters_to_yojson tree = list_to_yojson vocabulary_filter_info_to_yojson tree

let list_vocabulary_filters_response_to_yojson (x : list_vocabulary_filters_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("VocabularyFilters", option_to_yojson vocabulary_filters_to_yojson x.vocabulary_filters);
    ]

let list_vocabulary_filters_request_to_yojson (x : list_vocabulary_filters_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NameContains", option_to_yojson vocabulary_filter_name_to_yojson x.name_contains);
    ]

let pronouns_to_yojson (x : pronouns) =
  match x with
  | HE_HIM -> `String "HE_HIM"
  | SHE_HER -> `String "SHE_HER"
  | THEY_THEM -> `String "THEY_THEM"

let medical_scribe_patient_context_to_yojson (x : medical_scribe_patient_context) =
  assoc_to_yojson [ ("Pronouns", option_to_yojson pronouns_to_yojson x.pronouns) ]

let medical_scribe_context_to_yojson (x : medical_scribe_context) =
  assoc_to_yojson
    [
      ("PatientContext", option_to_yojson medical_scribe_patient_context_to_yojson x.patient_context);
    ]

let output_bucket_name_to_yojson = string_to_yojson
let output_key_to_yojson = string_to_yojson

let start_call_analytics_job_response_to_yojson (x : start_call_analytics_job_response) =
  assoc_to_yojson
    [ ("CallAnalyticsJob", option_to_yojson call_analytics_job_to_yojson x.call_analytics_job) ]

let start_call_analytics_job_request_to_yojson (x : start_call_analytics_job_request) =
  assoc_to_yojson
    [
      ("CallAnalyticsJobName", Some (call_analytics_job_name_to_yojson x.call_analytics_job_name));
      ("Media", Some (media_to_yojson x.media));
      ("OutputLocation", option_to_yojson uri_to_yojson x.output_location);
      ( "OutputEncryptionKMSKeyId",
        option_to_yojson kms_key_id_to_yojson x.output_encryption_kms_key_id );
      ("DataAccessRoleArn", option_to_yojson data_access_role_arn_to_yojson x.data_access_role_arn);
      ("Settings", option_to_yojson call_analytics_job_settings_to_yojson x.settings);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ChannelDefinitions", option_to_yojson channel_definitions_to_yojson x.channel_definitions);
    ]

let start_medical_scribe_job_response_to_yojson (x : start_medical_scribe_job_response) =
  assoc_to_yojson
    [ ("MedicalScribeJob", option_to_yojson medical_scribe_job_to_yojson x.medical_scribe_job) ]

let start_medical_scribe_job_request_to_yojson (x : start_medical_scribe_job_request) =
  assoc_to_yojson
    [
      ("MedicalScribeJobName", Some (transcription_job_name_to_yojson x.medical_scribe_job_name));
      ("Media", Some (media_to_yojson x.media));
      ("OutputBucketName", Some (output_bucket_name_to_yojson x.output_bucket_name));
      ( "OutputEncryptionKMSKeyId",
        option_to_yojson kms_key_id_to_yojson x.output_encryption_kms_key_id );
      ( "KMSEncryptionContext",
        option_to_yojson kms_encryption_context_map_to_yojson x.kms_encryption_context );
      ("DataAccessRoleArn", Some (data_access_role_arn_to_yojson x.data_access_role_arn));
      ("Settings", Some (medical_scribe_settings_to_yojson x.settings));
      ( "ChannelDefinitions",
        option_to_yojson medical_scribe_channel_definitions_to_yojson x.channel_definitions );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "MedicalScribeContext",
        option_to_yojson medical_scribe_context_to_yojson x.medical_scribe_context );
    ]

let start_medical_transcription_job_response_to_yojson
    (x : start_medical_transcription_job_response) =
  assoc_to_yojson
    [
      ( "MedicalTranscriptionJob",
        option_to_yojson medical_transcription_job_to_yojson x.medical_transcription_job );
    ]

let start_medical_transcription_job_request_to_yojson (x : start_medical_transcription_job_request)
    =
  assoc_to_yojson
    [
      ( "MedicalTranscriptionJobName",
        Some (transcription_job_name_to_yojson x.medical_transcription_job_name) );
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ( "MediaSampleRateHertz",
        option_to_yojson medical_media_sample_rate_hertz_to_yojson x.media_sample_rate_hertz );
      ("MediaFormat", option_to_yojson media_format_to_yojson x.media_format);
      ("Media", Some (media_to_yojson x.media));
      ("OutputBucketName", Some (output_bucket_name_to_yojson x.output_bucket_name));
      ("OutputKey", option_to_yojson output_key_to_yojson x.output_key);
      ( "OutputEncryptionKMSKeyId",
        option_to_yojson kms_key_id_to_yojson x.output_encryption_kms_key_id );
      ( "KMSEncryptionContext",
        option_to_yojson kms_encryption_context_map_to_yojson x.kms_encryption_context );
      ("Settings", option_to_yojson medical_transcription_setting_to_yojson x.settings);
      ( "ContentIdentificationType",
        option_to_yojson medical_content_identification_type_to_yojson x.content_identification_type
      );
      ("Specialty", Some (specialty_to_yojson x.specialty));
      ("Type", Some (type__to_yojson x.type_));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let start_transcription_job_response_to_yojson (x : start_transcription_job_response) =
  assoc_to_yojson
    [ ("TranscriptionJob", option_to_yojson transcription_job_to_yojson x.transcription_job) ]

let subtitles_to_yojson (x : subtitles) =
  assoc_to_yojson
    [
      ("Formats", option_to_yojson subtitle_formats_to_yojson x.formats);
      ( "OutputStartIndex",
        option_to_yojson subtitle_output_start_index_to_yojson x.output_start_index );
    ]

let start_transcription_job_request_to_yojson (x : start_transcription_job_request) =
  assoc_to_yojson
    [
      ("TranscriptionJobName", Some (transcription_job_name_to_yojson x.transcription_job_name));
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ( "MediaSampleRateHertz",
        option_to_yojson media_sample_rate_hertz_to_yojson x.media_sample_rate_hertz );
      ("MediaFormat", option_to_yojson media_format_to_yojson x.media_format);
      ("Media", Some (media_to_yojson x.media));
      ("OutputBucketName", option_to_yojson output_bucket_name_to_yojson x.output_bucket_name);
      ("OutputKey", option_to_yojson output_key_to_yojson x.output_key);
      ( "OutputEncryptionKMSKeyId",
        option_to_yojson kms_key_id_to_yojson x.output_encryption_kms_key_id );
      ( "KMSEncryptionContext",
        option_to_yojson kms_encryption_context_map_to_yojson x.kms_encryption_context );
      ("Settings", option_to_yojson settings_to_yojson x.settings);
      ("ModelSettings", option_to_yojson model_settings_to_yojson x.model_settings);
      ( "JobExecutionSettings",
        option_to_yojson job_execution_settings_to_yojson x.job_execution_settings );
      ("ContentRedaction", option_to_yojson content_redaction_to_yojson x.content_redaction);
      ("IdentifyLanguage", option_to_yojson boolean__to_yojson x.identify_language);
      ( "IdentifyMultipleLanguages",
        option_to_yojson boolean__to_yojson x.identify_multiple_languages );
      ("LanguageOptions", option_to_yojson language_options_to_yojson x.language_options);
      ("Subtitles", option_to_yojson subtitles_to_yojson x.subtitles);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "LanguageIdSettings",
        option_to_yojson language_id_settings_map_to_yojson x.language_id_settings );
      ("ToxicityDetection", option_to_yojson toxicity_detection_to_yojson x.toxicity_detection);
    ]

let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (transcribe_arn_to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let update_vocabulary_filter_response_to_yojson (x : update_vocabulary_filter_response) =
  assoc_to_yojson
    [
      ( "VocabularyFilterName",
        option_to_yojson vocabulary_filter_name_to_yojson x.vocabulary_filter_name );
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("LastModifiedTime", option_to_yojson date_time_to_yojson x.last_modified_time);
    ]

let update_vocabulary_filter_request_to_yojson (x : update_vocabulary_filter_request) =
  assoc_to_yojson
    [
      ("VocabularyFilterName", Some (vocabulary_filter_name_to_yojson x.vocabulary_filter_name));
      ("Words", option_to_yojson words_to_yojson x.words);
      ("VocabularyFilterFileUri", option_to_yojson uri_to_yojson x.vocabulary_filter_file_uri);
      ("DataAccessRoleArn", option_to_yojson data_access_role_arn_to_yojson x.data_access_role_arn);
    ]

let update_vocabulary_response_to_yojson (x : update_vocabulary_response) =
  assoc_to_yojson
    [
      ("VocabularyName", option_to_yojson vocabulary_name_to_yojson x.vocabulary_name);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("LastModifiedTime", option_to_yojson date_time_to_yojson x.last_modified_time);
      ("VocabularyState", option_to_yojson vocabulary_state_to_yojson x.vocabulary_state);
    ]

let update_vocabulary_request_to_yojson (x : update_vocabulary_request) =
  assoc_to_yojson
    [
      ("VocabularyName", Some (vocabulary_name_to_yojson x.vocabulary_name));
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("Phrases", option_to_yojson phrases_to_yojson x.phrases);
      ("VocabularyFileUri", option_to_yojson uri_to_yojson x.vocabulary_file_uri);
      ("DataAccessRoleArn", option_to_yojson data_access_role_arn_to_yojson x.data_access_role_arn);
    ]

let update_medical_vocabulary_response_to_yojson (x : update_medical_vocabulary_response) =
  assoc_to_yojson
    [
      ("VocabularyName", option_to_yojson vocabulary_name_to_yojson x.vocabulary_name);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("LastModifiedTime", option_to_yojson date_time_to_yojson x.last_modified_time);
      ("VocabularyState", option_to_yojson vocabulary_state_to_yojson x.vocabulary_state);
    ]

let update_medical_vocabulary_request_to_yojson (x : update_medical_vocabulary_request) =
  assoc_to_yojson
    [
      ("VocabularyName", Some (vocabulary_name_to_yojson x.vocabulary_name));
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("VocabularyFileUri", Some (uri_to_yojson x.vocabulary_file_uri));
    ]

let update_call_analytics_category_response_to_yojson (x : update_call_analytics_category_response)
    =
  assoc_to_yojson
    [ ("CategoryProperties", option_to_yojson category_properties_to_yojson x.category_properties) ]

let update_call_analytics_category_request_to_yojson (x : update_call_analytics_category_request) =
  assoc_to_yojson
    [
      ("CategoryName", Some (category_name_to_yojson x.category_name));
      ("Rules", Some (rule_list_to_yojson x.rules));
      ("InputType", option_to_yojson input_type_to_yojson x.input_type);
    ]

let untag_resource_response_to_yojson = unit_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (transcribe_arn_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]
