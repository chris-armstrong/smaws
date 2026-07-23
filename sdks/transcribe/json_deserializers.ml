open Smaws_Lib.Json.DeserializeHelpers
open Types

let timestamp_milliseconds_of_yojson = long_of_yojson

let absolute_time_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_time =
       option_of_yojson (value_for_key timestamp_milliseconds_of_yojson "StartTime") _list path;
     end_time =
       option_of_yojson (value_for_key timestamp_milliseconds_of_yojson "EndTime") _list path;
     first = option_of_yojson (value_for_key timestamp_milliseconds_of_yojson "First") _list path;
     last = option_of_yojson (value_for_key timestamp_milliseconds_of_yojson "Last") _list path;
   }
    : absolute_time_range)

let failure_reason_of_yojson = string_of_yojson

let bad_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key failure_reason_of_yojson "Message") _list path }
    : bad_request_exception)

let base_model_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "NarrowBand" -> NARROW_BAND
    | `String "WideBand" -> WIDE_BAND
    | `String value -> raise (deserialize_unknown_enum_value_error path "BaseModelName" value)
    | _ -> raise (deserialize_wrong_type_error path "BaseModelName")
     : base_model_name)
    : base_model_name)

let boolean__of_yojson = bool_of_yojson

let clm_language_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "en-US" -> EN_US
    | `String "hi-IN" -> HI_IN
    | `String "es-US" -> ES_US
    | `String "en-GB" -> EN_GB
    | `String "en-AU" -> EN_AU
    | `String "de-DE" -> DE_DE
    | `String "ja-JP" -> JA_JP
    | `String value -> raise (deserialize_unknown_enum_value_error path "CLMLanguageCode" value)
    | _ -> raise (deserialize_wrong_type_error path "CLMLanguageCode")
     : clm_language_code)
    : clm_language_code)

let call_analytics_feature_of_yojson (tree : t) path =
  ((match tree with
    | `String "GENERATIVE_SUMMARIZATION" -> GENERATIVE_SUMMARIZATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CallAnalyticsFeature" value)
    | _ -> raise (deserialize_wrong_type_error path "CallAnalyticsFeature")
     : call_analytics_feature)
    : call_analytics_feature)

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let participant_role_of_yojson (tree : t) path =
  ((match tree with
    | `String "AGENT" -> AGENT
    | `String "CUSTOMER" -> CUSTOMER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParticipantRole" value)
    | _ -> raise (deserialize_wrong_type_error path "ParticipantRole")
     : participant_role)
    : participant_role)

let channel_id_of_yojson = int_of_yojson

let channel_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     channel_id = option_of_yojson (value_for_key channel_id_of_yojson "ChannelId") _list path;
     participant_role =
       option_of_yojson (value_for_key participant_role_of_yojson "ParticipantRole") _list path;
   }
    : channel_definition)

let channel_definitions_of_yojson tree path = list_of_yojson channel_definition_of_yojson tree path

let summarization_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     generate_abstractive_summary =
       value_for_key boolean__of_yojson "GenerateAbstractiveSummary" _list path;
   }
    : summarization)

let model_name_of_yojson = string_of_yojson
let vocabulary_filter_name_of_yojson = string_of_yojson
let vocabulary_name_of_yojson = string_of_yojson

let language_id_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_name =
       option_of_yojson (value_for_key vocabulary_name_of_yojson "VocabularyName") _list path;
     vocabulary_filter_name =
       option_of_yojson
         (value_for_key vocabulary_filter_name_of_yojson "VocabularyFilterName")
         _list path;
     language_model_name =
       option_of_yojson (value_for_key model_name_of_yojson "LanguageModelName") _list path;
   }
    : language_id_settings)

let language_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "af-ZA" -> AF_ZA
    | `String "ar-AE" -> AR_AE
    | `String "ar-SA" -> AR_SA
    | `String "am-ET" -> AM_ET
    | `String "cy-GB" -> CY_GB
    | `String "da-DK" -> DA_DK
    | `String "de-CH" -> DE_CH
    | `String "de-DE" -> DE_DE
    | `String "en-AB" -> EN_AB
    | `String "en-AU" -> EN_AU
    | `String "en-GB" -> EN_GB
    | `String "en-IE" -> EN_IE
    | `String "en-IN" -> EN_IN
    | `String "en-US" -> EN_US
    | `String "en-WL" -> EN_WL
    | `String "es-ES" -> ES_ES
    | `String "es-MX" -> ES_MX
    | `String "es-US" -> ES_US
    | `String "fa-AF" -> FA_AF
    | `String "fa-IR" -> FA_IR
    | `String "fr-CA" -> FR_CA
    | `String "fr-FR" -> FR_FR
    | `String "ga-IE" -> GA_IE
    | `String "gd-GB" -> GD_GB
    | `String "he-IL" -> HE_IL
    | `String "hi-IN" -> HI_IN
    | `String "ht-HT" -> HT_HT
    | `String "id-ID" -> ID_ID
    | `String "it-IT" -> IT_IT
    | `String "ja-JP" -> JA_JP
    | `String "jv-ID" -> JV_ID
    | `String "km-KH" -> KM_KH
    | `String "ko-KR" -> KO_KR
    | `String "my-MM" -> MY_MM
    | `String "ms-MY" -> MS_MY
    | `String "nl-NL" -> NL_NL
    | `String "pt-BR" -> PT_BR
    | `String "pt-PT" -> PT_PT
    | `String "ru-RU" -> RU_RU
    | `String "ta-IN" -> TA_IN
    | `String "te-IN" -> TE_IN
    | `String "tr-TR" -> TR_TR
    | `String "zh-CN" -> ZH_CN
    | `String "zh-TW" -> ZH_TW
    | `String "th-TH" -> TH_TH
    | `String "en-ZA" -> EN_ZA
    | `String "en-NZ" -> EN_NZ
    | `String "vi-VN" -> VI_VN
    | `String "sv-SE" -> SV_SE
    | `String "ab-GE" -> AB_GE
    | `String "ast-ES" -> AST_ES
    | `String "az-AZ" -> AZ_AZ
    | `String "ba-RU" -> BA_RU
    | `String "be-BY" -> BE_BY
    | `String "bg-BG" -> BG_BG
    | `String "bn-IN" -> BN_IN
    | `String "bs-BA" -> BS_BA
    | `String "ca-ES" -> CA_ES
    | `String "ckb-IQ" -> CKB_IQ
    | `String "ckb-IR" -> CKB_IR
    | `String "cs-CZ" -> CS_CZ
    | `String "cy-WL" -> CY_WL
    | `String "el-GR" -> EL_GR
    | `String "et-EE" -> ET_EE
    | `String "et-ET" -> ET_ET
    | `String "eu-ES" -> EU_ES
    | `String "fi-FI" -> FI_FI
    | `String "gl-ES" -> GL_ES
    | `String "gu-IN" -> GU_IN
    | `String "ha-NG" -> HA_NG
    | `String "hr-HR" -> HR_HR
    | `String "hu-HU" -> HU_HU
    | `String "hy-AM" -> HY_AM
    | `String "is-IS" -> IS_IS
    | `String "ka-GE" -> KA_GE
    | `String "kab-DZ" -> KAB_DZ
    | `String "kk-KZ" -> KK_KZ
    | `String "kn-IN" -> KN_IN
    | `String "ky-KG" -> KY_KG
    | `String "lg-IN" -> LG_IN
    | `String "lt-LT" -> LT_LT
    | `String "lv-LV" -> LV_LV
    | `String "mhr-RU" -> MHR_RU
    | `String "mi-NZ" -> MI_NZ
    | `String "mk-MK" -> MK_MK
    | `String "ml-IN" -> ML_IN
    | `String "mn-MN" -> MN_MN
    | `String "mr-IN" -> MR_IN
    | `String "mt-MT" -> MT_MT
    | `String "no-NO" -> NO_NO
    | `String "ne-NP" -> NE_NP
    | `String "or-IN" -> OR_IN
    | `String "pa-IN" -> PA_IN
    | `String "pl-PL" -> PL_PL
    | `String "ps-AF" -> PS_AF
    | `String "ro-RO" -> RO_RO
    | `String "rw-RW" -> RW_RW
    | `String "si-LK" -> SI_LK
    | `String "sk-SK" -> SK_SK
    | `String "sl-SI" -> SL_SI
    | `String "so-SO" -> SO_SO
    | `String "sq-AL" -> SQ_AL
    | `String "sr-RS" -> SR_RS
    | `String "su-ID" -> SU_ID
    | `String "sw-BI" -> SW_BI
    | `String "sw-KE" -> SW_KE
    | `String "sw-RW" -> SW_RW
    | `String "sw-TZ" -> SW_TZ
    | `String "sw-UG" -> SW_UG
    | `String "tl-PH" -> TL_PH
    | `String "tt-RU" -> TT_RU
    | `String "ug-CN" -> UG_CN
    | `String "uk-UA" -> UK_UA
    | `String "uz-UZ" -> UZ_UZ
    | `String "wo-SN" -> WO_SN
    | `String "zh-HK" -> ZH_HK
    | `String "zu-ZA" -> ZU_ZA
    | `String value -> raise (deserialize_unknown_enum_value_error path "LanguageCode" value)
    | _ -> raise (deserialize_wrong_type_error path "LanguageCode")
     : language_code)
    : language_code)

let language_id_settings_map_of_yojson tree path =
  map_of_yojson language_code_of_yojson language_id_settings_of_yojson tree path

let language_options_of_yojson tree path = list_of_yojson language_code_of_yojson tree path

let pii_entity_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BANK_ACCOUNT_NUMBER" -> BANK_ACCOUNT_NUMBER
    | `String "BANK_ROUTING" -> BANK_ROUTING
    | `String "CREDIT_DEBIT_NUMBER" -> CREDIT_DEBIT_NUMBER
    | `String "CREDIT_DEBIT_CVV" -> CREDIT_DEBIT_CVV
    | `String "CREDIT_DEBIT_EXPIRY" -> CREDIT_DEBIT_EXPIRY
    | `String "PIN" -> PIN
    | `String "EMAIL" -> EMAIL
    | `String "ADDRESS" -> ADDRESS
    | `String "NAME" -> NAME
    | `String "PHONE" -> PHONE
    | `String "SSN" -> SSN
    | `String "ALL" -> ALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "PiiEntityType" value)
    | _ -> raise (deserialize_wrong_type_error path "PiiEntityType")
     : pii_entity_type)
    : pii_entity_type)

let pii_entity_types_of_yojson tree path = list_of_yojson pii_entity_type_of_yojson tree path

let redaction_output_of_yojson (tree : t) path =
  ((match tree with
    | `String "redacted" -> REDACTED
    | `String "redacted_and_unredacted" -> REDACTED_AND_UNREDACTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RedactionOutput" value)
    | _ -> raise (deserialize_wrong_type_error path "RedactionOutput")
     : redaction_output)
    : redaction_output)

let redaction_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PII" -> PII
    | `String value -> raise (deserialize_unknown_enum_value_error path "RedactionType" value)
    | _ -> raise (deserialize_wrong_type_error path "RedactionType")
     : redaction_type)
    : redaction_type)

let content_redaction_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     redaction_type = value_for_key redaction_type_of_yojson "RedactionType" _list path;
     redaction_output = value_for_key redaction_output_of_yojson "RedactionOutput" _list path;
     pii_entity_types =
       option_of_yojson (value_for_key pii_entity_types_of_yojson "PiiEntityTypes") _list path;
   }
    : content_redaction)

let vocabulary_filter_method_of_yojson (tree : t) path =
  ((match tree with
    | `String "remove" -> REMOVE
    | `String "mask" -> MASK
    | `String "tag" -> TAG
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "VocabularyFilterMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "VocabularyFilterMethod")
     : vocabulary_filter_method)
    : vocabulary_filter_method)

let call_analytics_job_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_name =
       option_of_yojson (value_for_key vocabulary_name_of_yojson "VocabularyName") _list path;
     vocabulary_filter_name =
       option_of_yojson
         (value_for_key vocabulary_filter_name_of_yojson "VocabularyFilterName")
         _list path;
     vocabulary_filter_method =
       option_of_yojson
         (value_for_key vocabulary_filter_method_of_yojson "VocabularyFilterMethod")
         _list path;
     language_model_name =
       option_of_yojson (value_for_key model_name_of_yojson "LanguageModelName") _list path;
     content_redaction =
       option_of_yojson (value_for_key content_redaction_of_yojson "ContentRedaction") _list path;
     language_options =
       option_of_yojson (value_for_key language_options_of_yojson "LanguageOptions") _list path;
     language_id_settings =
       option_of_yojson
         (value_for_key language_id_settings_map_of_yojson "LanguageIdSettings")
         _list path;
     summarization =
       option_of_yojson (value_for_key summarization_of_yojson "Summarization") _list path;
   }
    : call_analytics_job_settings)

let identified_language_score_of_yojson = float_of_yojson
let data_access_role_arn_of_yojson = string_of_yojson
let date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let uri_of_yojson = string_of_yojson

let transcript_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transcript_file_uri =
       option_of_yojson (value_for_key uri_of_yojson "TranscriptFileUri") _list path;
     redacted_transcript_file_uri =
       option_of_yojson (value_for_key uri_of_yojson "RedactedTranscriptFileUri") _list path;
   }
    : transcript)

let media_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     media_file_uri = option_of_yojson (value_for_key uri_of_yojson "MediaFileUri") _list path;
     redacted_media_file_uri =
       option_of_yojson (value_for_key uri_of_yojson "RedactedMediaFileUri") _list path;
   }
    : media)

let media_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "mp3" -> MP3
    | `String "mp4" -> MP4
    | `String "wav" -> WAV
    | `String "flac" -> FLAC
    | `String "ogg" -> OGG
    | `String "amr" -> AMR
    | `String "webm" -> WEBM
    | `String "m4a" -> M4A
    | `String value -> raise (deserialize_unknown_enum_value_error path "MediaFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "MediaFormat")
     : media_format)
    : media_format)

let media_sample_rate_hertz_of_yojson = int_of_yojson
let string__of_yojson = string_of_yojson

let call_analytics_skipped_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INSUFFICIENT_CONVERSATION_CONTENT" -> INSUFFICIENT_CONVERSATION_CONTENT
    | `String "FAILED_SAFETY_GUIDELINES" -> FAILED_SAFETY_GUIDELINES
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CallAnalyticsSkippedReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "CallAnalyticsSkippedReasonCode")
     : call_analytics_skipped_reason_code)
    : call_analytics_skipped_reason_code)

let call_analytics_skipped_feature_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     feature =
       option_of_yojson (value_for_key call_analytics_feature_of_yojson "Feature") _list path;
     reason_code =
       option_of_yojson
         (value_for_key call_analytics_skipped_reason_code_of_yojson "ReasonCode")
         _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : call_analytics_skipped_feature)

let call_analytics_skipped_feature_list_of_yojson tree path =
  list_of_yojson call_analytics_skipped_feature_of_yojson tree path

let call_analytics_job_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     skipped =
       option_of_yojson
         (value_for_key call_analytics_skipped_feature_list_of_yojson "Skipped")
         _list path;
   }
    : call_analytics_job_details)

let call_analytics_job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "QUEUED" -> QUEUED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CallAnalyticsJobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CallAnalyticsJobStatus")
     : call_analytics_job_status)
    : call_analytics_job_status)

let call_analytics_job_name_of_yojson = string_of_yojson

let call_analytics_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     call_analytics_job_name =
       option_of_yojson
         (value_for_key call_analytics_job_name_of_yojson "CallAnalyticsJobName")
         _list path;
     call_analytics_job_status =
       option_of_yojson
         (value_for_key call_analytics_job_status_of_yojson "CallAnalyticsJobStatus")
         _list path;
     call_analytics_job_details =
       option_of_yojson
         (value_for_key call_analytics_job_details_of_yojson "CallAnalyticsJobDetails")
         _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     media_sample_rate_hertz =
       option_of_yojson
         (value_for_key media_sample_rate_hertz_of_yojson "MediaSampleRateHertz")
         _list path;
     media_format = option_of_yojson (value_for_key media_format_of_yojson "MediaFormat") _list path;
     media = option_of_yojson (value_for_key media_of_yojson "Media") _list path;
     transcript = option_of_yojson (value_for_key transcript_of_yojson "Transcript") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     creation_time = option_of_yojson (value_for_key date_time_of_yojson "CreationTime") _list path;
     completion_time =
       option_of_yojson (value_for_key date_time_of_yojson "CompletionTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
     data_access_role_arn =
       option_of_yojson
         (value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn")
         _list path;
     identified_language_score =
       option_of_yojson
         (value_for_key identified_language_score_of_yojson "IdentifiedLanguageScore")
         _list path;
     settings =
       option_of_yojson (value_for_key call_analytics_job_settings_of_yojson "Settings") _list path;
     channel_definitions =
       option_of_yojson
         (value_for_key channel_definitions_of_yojson "ChannelDefinitions")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : call_analytics_job)

let call_analytics_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     call_analytics_job_name =
       option_of_yojson
         (value_for_key call_analytics_job_name_of_yojson "CallAnalyticsJobName")
         _list path;
     creation_time = option_of_yojson (value_for_key date_time_of_yojson "CreationTime") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     completion_time =
       option_of_yojson (value_for_key date_time_of_yojson "CompletionTime") _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     call_analytics_job_status =
       option_of_yojson
         (value_for_key call_analytics_job_status_of_yojson "CallAnalyticsJobStatus")
         _list path;
     call_analytics_job_details =
       option_of_yojson
         (value_for_key call_analytics_job_details_of_yojson "CallAnalyticsJobDetails")
         _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
   }
    : call_analytics_job_summary)

let call_analytics_job_summaries_of_yojson tree path =
  list_of_yojson call_analytics_job_summary_of_yojson tree path

let category_name_of_yojson = string_of_yojson

let input_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "REAL_TIME" -> REAL_TIME
    | `String "POST_CALL" -> POST_CALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "InputType" value)
    | _ -> raise (deserialize_wrong_type_error path "InputType")
     : input_type)
    : input_type)

let percentage_of_yojson = int_of_yojson

let relative_time_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_percentage =
       option_of_yojson (value_for_key percentage_of_yojson "StartPercentage") _list path;
     end_percentage =
       option_of_yojson (value_for_key percentage_of_yojson "EndPercentage") _list path;
     first = option_of_yojson (value_for_key percentage_of_yojson "First") _list path;
     last = option_of_yojson (value_for_key percentage_of_yojson "Last") _list path;
   }
    : relative_time_range)

let sentiment_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "POSITIVE" -> POSITIVE
    | `String "NEGATIVE" -> NEGATIVE
    | `String "NEUTRAL" -> NEUTRAL
    | `String "MIXED" -> MIXED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SentimentValue" value)
    | _ -> raise (deserialize_wrong_type_error path "SentimentValue")
     : sentiment_value)
    : sentiment_value)

let sentiment_value_list_of_yojson tree path = list_of_yojson sentiment_value_of_yojson tree path

let sentiment_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sentiments = value_for_key sentiment_value_list_of_yojson "Sentiments" _list path;
     absolute_time_range =
       option_of_yojson (value_for_key absolute_time_range_of_yojson "AbsoluteTimeRange") _list path;
     relative_time_range =
       option_of_yojson (value_for_key relative_time_range_of_yojson "RelativeTimeRange") _list path;
     participant_role =
       option_of_yojson (value_for_key participant_role_of_yojson "ParticipantRole") _list path;
     negate = option_of_yojson (value_for_key boolean__of_yojson "Negate") _list path;
   }
    : sentiment_filter)

let non_empty_string_of_yojson = string_of_yojson
let string_target_list_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path

let transcript_filter_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXACT" -> EXACT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TranscriptFilterType" value)
    | _ -> raise (deserialize_wrong_type_error path "TranscriptFilterType")
     : transcript_filter_type)
    : transcript_filter_type)

let transcript_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transcript_filter_type =
       value_for_key transcript_filter_type_of_yojson "TranscriptFilterType" _list path;
     absolute_time_range =
       option_of_yojson (value_for_key absolute_time_range_of_yojson "AbsoluteTimeRange") _list path;
     relative_time_range =
       option_of_yojson (value_for_key relative_time_range_of_yojson "RelativeTimeRange") _list path;
     participant_role =
       option_of_yojson (value_for_key participant_role_of_yojson "ParticipantRole") _list path;
     negate = option_of_yojson (value_for_key boolean__of_yojson "Negate") _list path;
     targets = value_for_key string_target_list_of_yojson "Targets" _list path;
   }
    : transcript_filter)

let interruption_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     threshold =
       option_of_yojson (value_for_key timestamp_milliseconds_of_yojson "Threshold") _list path;
     participant_role =
       option_of_yojson (value_for_key participant_role_of_yojson "ParticipantRole") _list path;
     absolute_time_range =
       option_of_yojson (value_for_key absolute_time_range_of_yojson "AbsoluteTimeRange") _list path;
     relative_time_range =
       option_of_yojson (value_for_key relative_time_range_of_yojson "RelativeTimeRange") _list path;
     negate = option_of_yojson (value_for_key boolean__of_yojson "Negate") _list path;
   }
    : interruption_filter)

let non_talk_time_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     threshold =
       option_of_yojson (value_for_key timestamp_milliseconds_of_yojson "Threshold") _list path;
     absolute_time_range =
       option_of_yojson (value_for_key absolute_time_range_of_yojson "AbsoluteTimeRange") _list path;
     relative_time_range =
       option_of_yojson (value_for_key relative_time_range_of_yojson "RelativeTimeRange") _list path;
     negate = option_of_yojson (value_for_key boolean__of_yojson "Negate") _list path;
   }
    : non_talk_time_filter)

let rule_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "NonTalkTimeFilter" -> NonTalkTimeFilter (non_talk_time_filter_of_yojson value_ path)
   | "InterruptionFilter" -> InterruptionFilter (interruption_filter_of_yojson value_ path)
   | "TranscriptFilter" -> TranscriptFilter (transcript_filter_of_yojson value_ path)
   | "SentimentFilter" -> SentimentFilter (sentiment_filter_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "Rule" unknown)
    : rule)

let rule_list_of_yojson tree path = list_of_yojson rule_of_yojson tree path

let category_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     category_name =
       option_of_yojson (value_for_key category_name_of_yojson "CategoryName") _list path;
     rules = option_of_yojson (value_for_key rule_list_of_yojson "Rules") _list path;
     create_time = option_of_yojson (value_for_key date_time_of_yojson "CreateTime") _list path;
     last_update_time =
       option_of_yojson (value_for_key date_time_of_yojson "LastUpdateTime") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     input_type = option_of_yojson (value_for_key input_type_of_yojson "InputType") _list path;
   }
    : category_properties)

let category_properties_list_of_yojson tree path =
  list_of_yojson category_properties_of_yojson tree path

let medical_scribe_note_template_of_yojson (tree : t) path =
  ((match tree with
    | `String "HISTORY_AND_PHYSICAL" -> HISTORY_AND_PHYSICAL
    | `String "GIRPP" -> GIRPP
    | `String "BIRP" -> BIRP
    | `String "SIRP" -> SIRP
    | `String "DAP" -> DAP
    | `String "BEHAVIORAL_SOAP" -> BEHAVIORAL_SOAP
    | `String "PHYSICAL_SOAP" -> PHYSICAL_SOAP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MedicalScribeNoteTemplate" value)
    | _ -> raise (deserialize_wrong_type_error path "MedicalScribeNoteTemplate")
     : medical_scribe_note_template)
    : medical_scribe_note_template)

let clinical_note_generation_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     note_template =
       option_of_yojson
         (value_for_key medical_scribe_note_template_of_yojson "NoteTemplate")
         _list path;
   }
    : clinical_note_generation_settings)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : conflict_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : limit_exceeded_exception)

let internal_failure_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : internal_failure_exception)

let create_call_analytics_category_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     category_properties =
       option_of_yojson
         (value_for_key category_properties_of_yojson "CategoryProperties")
         _list path;
   }
    : create_call_analytics_category_response)

let create_call_analytics_category_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     category_name = value_for_key category_name_of_yojson "CategoryName" _list path;
     rules = value_for_key rule_list_of_yojson "Rules" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     input_type = option_of_yojson (value_for_key input_type_of_yojson "InputType") _list path;
   }
    : create_call_analytics_category_request)

let model_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ModelStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ModelStatus")
     : model_status)
    : model_status)

let input_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_uri = value_for_key uri_of_yojson "S3Uri" _list path;
     tuning_data_s3_uri =
       option_of_yojson (value_for_key uri_of_yojson "TuningDataS3Uri") _list path;
     data_access_role_arn =
       value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn" _list path;
   }
    : input_data_config)

let create_language_model_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     language_code =
       option_of_yojson (value_for_key clm_language_code_of_yojson "LanguageCode") _list path;
     base_model_name =
       option_of_yojson (value_for_key base_model_name_of_yojson "BaseModelName") _list path;
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
     input_data_config =
       option_of_yojson (value_for_key input_data_config_of_yojson "InputDataConfig") _list path;
     model_status = option_of_yojson (value_for_key model_status_of_yojson "ModelStatus") _list path;
   }
    : create_language_model_response)

let create_language_model_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     language_code = value_for_key clm_language_code_of_yojson "LanguageCode" _list path;
     base_model_name = value_for_key base_model_name_of_yojson "BaseModelName" _list path;
     model_name = value_for_key model_name_of_yojson "ModelName" _list path;
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_language_model_request)

let vocabulary_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "READY" -> READY
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "VocabularyState" value)
    | _ -> raise (deserialize_wrong_type_error path "VocabularyState")
     : vocabulary_state)
    : vocabulary_state)

let create_medical_vocabulary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_name =
       option_of_yojson (value_for_key vocabulary_name_of_yojson "VocabularyName") _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     vocabulary_state =
       option_of_yojson (value_for_key vocabulary_state_of_yojson "VocabularyState") _list path;
     last_modified_time =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
   }
    : create_medical_vocabulary_response)

let create_medical_vocabulary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_name = value_for_key vocabulary_name_of_yojson "VocabularyName" _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
     vocabulary_file_uri = value_for_key uri_of_yojson "VocabularyFileUri" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_medical_vocabulary_request)

let create_vocabulary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_name =
       option_of_yojson (value_for_key vocabulary_name_of_yojson "VocabularyName") _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     vocabulary_state =
       option_of_yojson (value_for_key vocabulary_state_of_yojson "VocabularyState") _list path;
     last_modified_time =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
   }
    : create_vocabulary_response)

let phrase_of_yojson = string_of_yojson
let phrases_of_yojson tree path = list_of_yojson phrase_of_yojson tree path

let create_vocabulary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_name = value_for_key vocabulary_name_of_yojson "VocabularyName" _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
     phrases = option_of_yojson (value_for_key phrases_of_yojson "Phrases") _list path;
     vocabulary_file_uri =
       option_of_yojson (value_for_key uri_of_yojson "VocabularyFileUri") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     data_access_role_arn =
       option_of_yojson
         (value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn")
         _list path;
   }
    : create_vocabulary_request)

let create_vocabulary_filter_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_filter_name =
       option_of_yojson
         (value_for_key vocabulary_filter_name_of_yojson "VocabularyFilterName")
         _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     last_modified_time =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedTime") _list path;
   }
    : create_vocabulary_filter_response)

let word_of_yojson = string_of_yojson
let words_of_yojson tree path = list_of_yojson word_of_yojson tree path

let create_vocabulary_filter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_filter_name =
       value_for_key vocabulary_filter_name_of_yojson "VocabularyFilterName" _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
     words = option_of_yojson (value_for_key words_of_yojson "Words") _list path;
     vocabulary_filter_file_uri =
       option_of_yojson (value_for_key uri_of_yojson "VocabularyFilterFileUri") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     data_access_role_arn =
       option_of_yojson
         (value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn")
         _list path;
   }
    : create_vocabulary_filter_request)

let not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : not_found_exception)

let delete_call_analytics_category_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_call_analytics_category_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ category_name = value_for_key category_name_of_yojson "CategoryName" _list path }
    : delete_call_analytics_category_request)

let delete_call_analytics_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_call_analytics_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     call_analytics_job_name =
       value_for_key call_analytics_job_name_of_yojson "CallAnalyticsJobName" _list path;
   }
    : delete_call_analytics_job_request)

let delete_language_model_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ model_name = value_for_key model_name_of_yojson "ModelName" _list path }
    : delete_language_model_request)

let transcription_job_name_of_yojson = string_of_yojson

let delete_medical_scribe_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     medical_scribe_job_name =
       value_for_key transcription_job_name_of_yojson "MedicalScribeJobName" _list path;
   }
    : delete_medical_scribe_job_request)

let delete_medical_transcription_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     medical_transcription_job_name =
       value_for_key transcription_job_name_of_yojson "MedicalTranscriptionJobName" _list path;
   }
    : delete_medical_transcription_job_request)

let delete_medical_vocabulary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vocabulary_name = value_for_key vocabulary_name_of_yojson "VocabularyName" _list path }
    : delete_medical_vocabulary_request)

let delete_transcription_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transcription_job_name =
       value_for_key transcription_job_name_of_yojson "TranscriptionJobName" _list path;
   }
    : delete_transcription_job_request)

let delete_vocabulary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vocabulary_name = value_for_key vocabulary_name_of_yojson "VocabularyName" _list path }
    : delete_vocabulary_request)

let delete_vocabulary_filter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_filter_name =
       value_for_key vocabulary_filter_name_of_yojson "VocabularyFilterName" _list path;
   }
    : delete_vocabulary_filter_request)

let language_model_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
     create_time = option_of_yojson (value_for_key date_time_of_yojson "CreateTime") _list path;
     last_modified_time =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedTime") _list path;
     language_code =
       option_of_yojson (value_for_key clm_language_code_of_yojson "LanguageCode") _list path;
     base_model_name =
       option_of_yojson (value_for_key base_model_name_of_yojson "BaseModelName") _list path;
     model_status = option_of_yojson (value_for_key model_status_of_yojson "ModelStatus") _list path;
     upgrade_availability =
       option_of_yojson (value_for_key boolean__of_yojson "UpgradeAvailability") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
     input_data_config =
       option_of_yojson (value_for_key input_data_config_of_yojson "InputDataConfig") _list path;
   }
    : language_model)

let describe_language_model_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     language_model =
       option_of_yojson (value_for_key language_model_of_yojson "LanguageModel") _list path;
   }
    : describe_language_model_response)

let describe_language_model_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ model_name = value_for_key model_name_of_yojson "ModelName" _list path }
    : describe_language_model_request)

let duration_in_seconds_of_yojson = float_of_yojson

let get_call_analytics_category_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     category_properties =
       option_of_yojson
         (value_for_key category_properties_of_yojson "CategoryProperties")
         _list path;
   }
    : get_call_analytics_category_response)

let get_call_analytics_category_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ category_name = value_for_key category_name_of_yojson "CategoryName" _list path }
    : get_call_analytics_category_request)

let get_call_analytics_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     call_analytics_job =
       option_of_yojson (value_for_key call_analytics_job_of_yojson "CallAnalyticsJob") _list path;
   }
    : get_call_analytics_job_response)

let get_call_analytics_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     call_analytics_job_name =
       value_for_key call_analytics_job_name_of_yojson "CallAnalyticsJobName" _list path;
   }
    : get_call_analytics_job_request)

let medical_scribe_participant_role_of_yojson (tree : t) path =
  ((match tree with
    | `String "PATIENT" -> PATIENT
    | `String "CLINICIAN" -> CLINICIAN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MedicalScribeParticipantRole" value)
    | _ -> raise (deserialize_wrong_type_error path "MedicalScribeParticipantRole")
     : medical_scribe_participant_role)
    : medical_scribe_participant_role)

let medical_scribe_channel_id_of_yojson = int_of_yojson

let medical_scribe_channel_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     channel_id = value_for_key medical_scribe_channel_id_of_yojson "ChannelId" _list path;
     participant_role =
       value_for_key medical_scribe_participant_role_of_yojson "ParticipantRole" _list path;
   }
    : medical_scribe_channel_definition)

let medical_scribe_channel_definitions_of_yojson tree path =
  list_of_yojson medical_scribe_channel_definition_of_yojson tree path

let max_speakers_of_yojson = int_of_yojson

let medical_scribe_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     show_speaker_labels =
       option_of_yojson (value_for_key boolean__of_yojson "ShowSpeakerLabels") _list path;
     max_speaker_labels =
       option_of_yojson (value_for_key max_speakers_of_yojson "MaxSpeakerLabels") _list path;
     channel_identification =
       option_of_yojson (value_for_key boolean__of_yojson "ChannelIdentification") _list path;
     vocabulary_name =
       option_of_yojson (value_for_key vocabulary_name_of_yojson "VocabularyName") _list path;
     vocabulary_filter_name =
       option_of_yojson
         (value_for_key vocabulary_filter_name_of_yojson "VocabularyFilterName")
         _list path;
     vocabulary_filter_method =
       option_of_yojson
         (value_for_key vocabulary_filter_method_of_yojson "VocabularyFilterMethod")
         _list path;
     clinical_note_generation_settings =
       option_of_yojson
         (value_for_key clinical_note_generation_settings_of_yojson "ClinicalNoteGenerationSettings")
         _list path;
   }
    : medical_scribe_settings)

let medical_scribe_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transcript_file_uri = value_for_key uri_of_yojson "TranscriptFileUri" _list path;
     clinical_document_uri = value_for_key uri_of_yojson "ClinicalDocumentUri" _list path;
   }
    : medical_scribe_output)

let medical_scribe_language_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "en-US" -> EN_US
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MedicalScribeLanguageCode" value)
    | _ -> raise (deserialize_wrong_type_error path "MedicalScribeLanguageCode")
     : medical_scribe_language_code)
    : medical_scribe_language_code)

let medical_scribe_job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "QUEUED" -> QUEUED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MedicalScribeJobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "MedicalScribeJobStatus")
     : medical_scribe_job_status)
    : medical_scribe_job_status)

let medical_scribe_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     medical_scribe_job_name =
       option_of_yojson
         (value_for_key transcription_job_name_of_yojson "MedicalScribeJobName")
         _list path;
     medical_scribe_job_status =
       option_of_yojson
         (value_for_key medical_scribe_job_status_of_yojson "MedicalScribeJobStatus")
         _list path;
     language_code =
       option_of_yojson
         (value_for_key medical_scribe_language_code_of_yojson "LanguageCode")
         _list path;
     media = option_of_yojson (value_for_key media_of_yojson "Media") _list path;
     medical_scribe_output =
       option_of_yojson
         (value_for_key medical_scribe_output_of_yojson "MedicalScribeOutput")
         _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     creation_time = option_of_yojson (value_for_key date_time_of_yojson "CreationTime") _list path;
     completion_time =
       option_of_yojson (value_for_key date_time_of_yojson "CompletionTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
     settings =
       option_of_yojson (value_for_key medical_scribe_settings_of_yojson "Settings") _list path;
     data_access_role_arn =
       option_of_yojson
         (value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn")
         _list path;
     channel_definitions =
       option_of_yojson
         (value_for_key medical_scribe_channel_definitions_of_yojson "ChannelDefinitions")
         _list path;
     medical_scribe_context_provided =
       option_of_yojson (value_for_key boolean__of_yojson "MedicalScribeContextProvided") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : medical_scribe_job)

let get_medical_scribe_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     medical_scribe_job =
       option_of_yojson (value_for_key medical_scribe_job_of_yojson "MedicalScribeJob") _list path;
   }
    : get_medical_scribe_job_response)

let get_medical_scribe_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     medical_scribe_job_name =
       value_for_key transcription_job_name_of_yojson "MedicalScribeJobName" _list path;
   }
    : get_medical_scribe_job_request)

let type__of_yojson (tree : t) path =
  ((match tree with
    | `String "CONVERSATION" -> CONVERSATION
    | `String "DICTATION" -> DICTATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "Type" value)
    | _ -> raise (deserialize_wrong_type_error path "Type")
     : type_)
    : type_)

let specialty_of_yojson (tree : t) path =
  ((match tree with
    | `String "PRIMARYCARE" -> PRIMARYCARE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Specialty" value)
    | _ -> raise (deserialize_wrong_type_error path "Specialty")
     : specialty)
    : specialty)

let medical_content_identification_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PHI" -> PHI
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MedicalContentIdentificationType" value)
    | _ -> raise (deserialize_wrong_type_error path "MedicalContentIdentificationType")
     : medical_content_identification_type)
    : medical_content_identification_type)

let max_alternatives_of_yojson = int_of_yojson

let medical_transcription_setting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     show_speaker_labels =
       option_of_yojson (value_for_key boolean__of_yojson "ShowSpeakerLabels") _list path;
     max_speaker_labels =
       option_of_yojson (value_for_key max_speakers_of_yojson "MaxSpeakerLabels") _list path;
     channel_identification =
       option_of_yojson (value_for_key boolean__of_yojson "ChannelIdentification") _list path;
     show_alternatives =
       option_of_yojson (value_for_key boolean__of_yojson "ShowAlternatives") _list path;
     max_alternatives =
       option_of_yojson (value_for_key max_alternatives_of_yojson "MaxAlternatives") _list path;
     vocabulary_name =
       option_of_yojson (value_for_key vocabulary_name_of_yojson "VocabularyName") _list path;
   }
    : medical_transcription_setting)

let medical_transcript_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transcript_file_uri =
       option_of_yojson (value_for_key uri_of_yojson "TranscriptFileUri") _list path;
   }
    : medical_transcript)

let medical_media_sample_rate_hertz_of_yojson = int_of_yojson

let transcription_job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "QUEUED" -> QUEUED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TranscriptionJobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TranscriptionJobStatus")
     : transcription_job_status)
    : transcription_job_status)

let medical_transcription_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     medical_transcription_job_name =
       option_of_yojson
         (value_for_key transcription_job_name_of_yojson "MedicalTranscriptionJobName")
         _list path;
     transcription_job_status =
       option_of_yojson
         (value_for_key transcription_job_status_of_yojson "TranscriptionJobStatus")
         _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     media_sample_rate_hertz =
       option_of_yojson
         (value_for_key medical_media_sample_rate_hertz_of_yojson "MediaSampleRateHertz")
         _list path;
     media_format = option_of_yojson (value_for_key media_format_of_yojson "MediaFormat") _list path;
     media = option_of_yojson (value_for_key media_of_yojson "Media") _list path;
     transcript =
       option_of_yojson (value_for_key medical_transcript_of_yojson "Transcript") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     creation_time = option_of_yojson (value_for_key date_time_of_yojson "CreationTime") _list path;
     completion_time =
       option_of_yojson (value_for_key date_time_of_yojson "CompletionTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
     settings =
       option_of_yojson
         (value_for_key medical_transcription_setting_of_yojson "Settings")
         _list path;
     content_identification_type =
       option_of_yojson
         (value_for_key medical_content_identification_type_of_yojson "ContentIdentificationType")
         _list path;
     specialty = option_of_yojson (value_for_key specialty_of_yojson "Specialty") _list path;
     type_ = option_of_yojson (value_for_key type__of_yojson "Type") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : medical_transcription_job)

let get_medical_transcription_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     medical_transcription_job =
       option_of_yojson
         (value_for_key medical_transcription_job_of_yojson "MedicalTranscriptionJob")
         _list path;
   }
    : get_medical_transcription_job_response)

let get_medical_transcription_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     medical_transcription_job_name =
       value_for_key transcription_job_name_of_yojson "MedicalTranscriptionJobName" _list path;
   }
    : get_medical_transcription_job_request)

let get_medical_vocabulary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_name =
       option_of_yojson (value_for_key vocabulary_name_of_yojson "VocabularyName") _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     vocabulary_state =
       option_of_yojson (value_for_key vocabulary_state_of_yojson "VocabularyState") _list path;
     last_modified_time =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
     download_uri = option_of_yojson (value_for_key uri_of_yojson "DownloadUri") _list path;
   }
    : get_medical_vocabulary_response)

let get_medical_vocabulary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vocabulary_name = value_for_key vocabulary_name_of_yojson "VocabularyName" _list path }
    : get_medical_vocabulary_request)

let toxicity_category_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL" -> ALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ToxicityCategory" value)
    | _ -> raise (deserialize_wrong_type_error path "ToxicityCategory")
     : toxicity_category)
    : toxicity_category)

let toxicity_categories_of_yojson tree path = list_of_yojson toxicity_category_of_yojson tree path

let toxicity_detection_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     toxicity_categories =
       value_for_key toxicity_categories_of_yojson "ToxicityCategories" _list path;
   }
    : toxicity_detection_settings)

let toxicity_detection_of_yojson tree path =
  list_of_yojson toxicity_detection_settings_of_yojson tree path

let subtitle_output_start_index_of_yojson = int_of_yojson
let subtitle_file_uris_of_yojson tree path = list_of_yojson uri_of_yojson tree path

let subtitle_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "vtt" -> VTT
    | `String "srt" -> SRT
    | `String value -> raise (deserialize_unknown_enum_value_error path "SubtitleFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "SubtitleFormat")
     : subtitle_format)
    : subtitle_format)

let subtitle_formats_of_yojson tree path = list_of_yojson subtitle_format_of_yojson tree path

let subtitles_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     formats = option_of_yojson (value_for_key subtitle_formats_of_yojson "Formats") _list path;
     subtitle_file_uris =
       option_of_yojson (value_for_key subtitle_file_uris_of_yojson "SubtitleFileUris") _list path;
     output_start_index =
       option_of_yojson
         (value_for_key subtitle_output_start_index_of_yojson "OutputStartIndex")
         _list path;
   }
    : subtitles_output)

let language_code_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     duration_in_seconds =
       option_of_yojson (value_for_key duration_in_seconds_of_yojson "DurationInSeconds") _list path;
   }
    : language_code_item)

let language_code_list_of_yojson tree path = list_of_yojson language_code_item_of_yojson tree path

let job_execution_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     allow_deferred_execution =
       option_of_yojson (value_for_key boolean__of_yojson "AllowDeferredExecution") _list path;
     data_access_role_arn =
       option_of_yojson
         (value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn")
         _list path;
   }
    : job_execution_settings)

let model_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     language_model_name =
       option_of_yojson (value_for_key model_name_of_yojson "LanguageModelName") _list path;
   }
    : model_settings)

let settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_name =
       option_of_yojson (value_for_key vocabulary_name_of_yojson "VocabularyName") _list path;
     show_speaker_labels =
       option_of_yojson (value_for_key boolean__of_yojson "ShowSpeakerLabels") _list path;
     max_speaker_labels =
       option_of_yojson (value_for_key max_speakers_of_yojson "MaxSpeakerLabels") _list path;
     channel_identification =
       option_of_yojson (value_for_key boolean__of_yojson "ChannelIdentification") _list path;
     show_alternatives =
       option_of_yojson (value_for_key boolean__of_yojson "ShowAlternatives") _list path;
     max_alternatives =
       option_of_yojson (value_for_key max_alternatives_of_yojson "MaxAlternatives") _list path;
     vocabulary_filter_name =
       option_of_yojson
         (value_for_key vocabulary_filter_name_of_yojson "VocabularyFilterName")
         _list path;
     vocabulary_filter_method =
       option_of_yojson
         (value_for_key vocabulary_filter_method_of_yojson "VocabularyFilterMethod")
         _list path;
   }
    : settings)

let transcription_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transcription_job_name =
       option_of_yojson
         (value_for_key transcription_job_name_of_yojson "TranscriptionJobName")
         _list path;
     transcription_job_status =
       option_of_yojson
         (value_for_key transcription_job_status_of_yojson "TranscriptionJobStatus")
         _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     media_sample_rate_hertz =
       option_of_yojson
         (value_for_key media_sample_rate_hertz_of_yojson "MediaSampleRateHertz")
         _list path;
     media_format = option_of_yojson (value_for_key media_format_of_yojson "MediaFormat") _list path;
     media = option_of_yojson (value_for_key media_of_yojson "Media") _list path;
     transcript = option_of_yojson (value_for_key transcript_of_yojson "Transcript") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     creation_time = option_of_yojson (value_for_key date_time_of_yojson "CreationTime") _list path;
     completion_time =
       option_of_yojson (value_for_key date_time_of_yojson "CompletionTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
     settings = option_of_yojson (value_for_key settings_of_yojson "Settings") _list path;
     model_settings =
       option_of_yojson (value_for_key model_settings_of_yojson "ModelSettings") _list path;
     job_execution_settings =
       option_of_yojson
         (value_for_key job_execution_settings_of_yojson "JobExecutionSettings")
         _list path;
     content_redaction =
       option_of_yojson (value_for_key content_redaction_of_yojson "ContentRedaction") _list path;
     identify_language =
       option_of_yojson (value_for_key boolean__of_yojson "IdentifyLanguage") _list path;
     identify_multiple_languages =
       option_of_yojson (value_for_key boolean__of_yojson "IdentifyMultipleLanguages") _list path;
     language_options =
       option_of_yojson (value_for_key language_options_of_yojson "LanguageOptions") _list path;
     identified_language_score =
       option_of_yojson
         (value_for_key identified_language_score_of_yojson "IdentifiedLanguageScore")
         _list path;
     language_codes =
       option_of_yojson (value_for_key language_code_list_of_yojson "LanguageCodes") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     subtitles = option_of_yojson (value_for_key subtitles_output_of_yojson "Subtitles") _list path;
     language_id_settings =
       option_of_yojson
         (value_for_key language_id_settings_map_of_yojson "LanguageIdSettings")
         _list path;
     toxicity_detection =
       option_of_yojson (value_for_key toxicity_detection_of_yojson "ToxicityDetection") _list path;
   }
    : transcription_job)

let get_transcription_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transcription_job =
       option_of_yojson (value_for_key transcription_job_of_yojson "TranscriptionJob") _list path;
   }
    : get_transcription_job_response)

let get_transcription_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transcription_job_name =
       value_for_key transcription_job_name_of_yojson "TranscriptionJobName" _list path;
   }
    : get_transcription_job_request)

let get_vocabulary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_name =
       option_of_yojson (value_for_key vocabulary_name_of_yojson "VocabularyName") _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     vocabulary_state =
       option_of_yojson (value_for_key vocabulary_state_of_yojson "VocabularyState") _list path;
     last_modified_time =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
     download_uri = option_of_yojson (value_for_key uri_of_yojson "DownloadUri") _list path;
   }
    : get_vocabulary_response)

let get_vocabulary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vocabulary_name = value_for_key vocabulary_name_of_yojson "VocabularyName" _list path }
    : get_vocabulary_request)

let get_vocabulary_filter_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_filter_name =
       option_of_yojson
         (value_for_key vocabulary_filter_name_of_yojson "VocabularyFilterName")
         _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     last_modified_time =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedTime") _list path;
     download_uri = option_of_yojson (value_for_key uri_of_yojson "DownloadUri") _list path;
   }
    : get_vocabulary_filter_response)

let get_vocabulary_filter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_filter_name =
       value_for_key vocabulary_filter_name_of_yojson "VocabularyFilterName" _list path;
   }
    : get_vocabulary_filter_request)

let kms_encryption_context_map_of_yojson tree path =
  map_of_yojson non_empty_string_of_yojson non_empty_string_of_yojson tree path

let kms_key_id_of_yojson = string_of_yojson
let next_token_of_yojson = string_of_yojson

let list_call_analytics_categories_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     categories =
       option_of_yojson (value_for_key category_properties_list_of_yojson "Categories") _list path;
   }
    : list_call_analytics_categories_response)

let max_results_of_yojson = int_of_yojson

let list_call_analytics_categories_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_call_analytics_categories_request)

let list_call_analytics_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key call_analytics_job_status_of_yojson "Status") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     call_analytics_job_summaries =
       option_of_yojson
         (value_for_key call_analytics_job_summaries_of_yojson "CallAnalyticsJobSummaries")
         _list path;
   }
    : list_call_analytics_jobs_response)

let list_call_analytics_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key call_analytics_job_status_of_yojson "Status") _list path;
     job_name_contains =
       option_of_yojson
         (value_for_key call_analytics_job_name_of_yojson "JobNameContains")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_call_analytics_jobs_request)

let models_of_yojson tree path = list_of_yojson language_model_of_yojson tree path

let list_language_models_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     models = option_of_yojson (value_for_key models_of_yojson "Models") _list path;
   }
    : list_language_models_response)

let list_language_models_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_equals =
       option_of_yojson (value_for_key model_status_of_yojson "StatusEquals") _list path;
     name_contains = option_of_yojson (value_for_key model_name_of_yojson "NameContains") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_language_models_request)

let medical_scribe_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     medical_scribe_job_name =
       option_of_yojson
         (value_for_key transcription_job_name_of_yojson "MedicalScribeJobName")
         _list path;
     creation_time = option_of_yojson (value_for_key date_time_of_yojson "CreationTime") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     completion_time =
       option_of_yojson (value_for_key date_time_of_yojson "CompletionTime") _list path;
     language_code =
       option_of_yojson
         (value_for_key medical_scribe_language_code_of_yojson "LanguageCode")
         _list path;
     medical_scribe_job_status =
       option_of_yojson
         (value_for_key medical_scribe_job_status_of_yojson "MedicalScribeJobStatus")
         _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
   }
    : medical_scribe_job_summary)

let medical_scribe_job_summaries_of_yojson tree path =
  list_of_yojson medical_scribe_job_summary_of_yojson tree path

let list_medical_scribe_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key medical_scribe_job_status_of_yojson "Status") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     medical_scribe_job_summaries =
       option_of_yojson
         (value_for_key medical_scribe_job_summaries_of_yojson "MedicalScribeJobSummaries")
         _list path;
   }
    : list_medical_scribe_jobs_response)

let list_medical_scribe_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key medical_scribe_job_status_of_yojson "Status") _list path;
     job_name_contains =
       option_of_yojson
         (value_for_key transcription_job_name_of_yojson "JobNameContains")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_medical_scribe_jobs_request)

let output_location_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUSTOMER_BUCKET" -> CUSTOMER_BUCKET
    | `String "SERVICE_BUCKET" -> SERVICE_BUCKET
    | `String value -> raise (deserialize_unknown_enum_value_error path "OutputLocationType" value)
    | _ -> raise (deserialize_wrong_type_error path "OutputLocationType")
     : output_location_type)
    : output_location_type)

let medical_transcription_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     medical_transcription_job_name =
       option_of_yojson
         (value_for_key transcription_job_name_of_yojson "MedicalTranscriptionJobName")
         _list path;
     creation_time = option_of_yojson (value_for_key date_time_of_yojson "CreationTime") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     completion_time =
       option_of_yojson (value_for_key date_time_of_yojson "CompletionTime") _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     transcription_job_status =
       option_of_yojson
         (value_for_key transcription_job_status_of_yojson "TranscriptionJobStatus")
         _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
     output_location_type =
       option_of_yojson
         (value_for_key output_location_type_of_yojson "OutputLocationType")
         _list path;
     specialty = option_of_yojson (value_for_key specialty_of_yojson "Specialty") _list path;
     content_identification_type =
       option_of_yojson
         (value_for_key medical_content_identification_type_of_yojson "ContentIdentificationType")
         _list path;
     type_ = option_of_yojson (value_for_key type__of_yojson "Type") _list path;
   }
    : medical_transcription_job_summary)

let medical_transcription_job_summaries_of_yojson tree path =
  list_of_yojson medical_transcription_job_summary_of_yojson tree path

let list_medical_transcription_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key transcription_job_status_of_yojson "Status") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     medical_transcription_job_summaries =
       option_of_yojson
         (value_for_key medical_transcription_job_summaries_of_yojson
            "MedicalTranscriptionJobSummaries")
         _list path;
   }
    : list_medical_transcription_jobs_response)

let list_medical_transcription_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key transcription_job_status_of_yojson "Status") _list path;
     job_name_contains =
       option_of_yojson
         (value_for_key transcription_job_name_of_yojson "JobNameContains")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_medical_transcription_jobs_request)

let vocabulary_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_name =
       option_of_yojson (value_for_key vocabulary_name_of_yojson "VocabularyName") _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     last_modified_time =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedTime") _list path;
     vocabulary_state =
       option_of_yojson (value_for_key vocabulary_state_of_yojson "VocabularyState") _list path;
   }
    : vocabulary_info)

let vocabularies_of_yojson tree path = list_of_yojson vocabulary_info_of_yojson tree path

let list_medical_vocabularies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key vocabulary_state_of_yojson "Status") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     vocabularies =
       option_of_yojson (value_for_key vocabularies_of_yojson "Vocabularies") _list path;
   }
    : list_medical_vocabularies_response)

let list_medical_vocabularies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     state_equals =
       option_of_yojson (value_for_key vocabulary_state_of_yojson "StateEquals") _list path;
     name_contains =
       option_of_yojson (value_for_key vocabulary_name_of_yojson "NameContains") _list path;
   }
    : list_medical_vocabularies_request)

let transcribe_arn_of_yojson = string_of_yojson

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       option_of_yojson (value_for_key transcribe_arn_of_yojson "ResourceArn") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key transcribe_arn_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let transcription_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transcription_job_name =
       option_of_yojson
         (value_for_key transcription_job_name_of_yojson "TranscriptionJobName")
         _list path;
     creation_time = option_of_yojson (value_for_key date_time_of_yojson "CreationTime") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     completion_time =
       option_of_yojson (value_for_key date_time_of_yojson "CompletionTime") _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     transcription_job_status =
       option_of_yojson
         (value_for_key transcription_job_status_of_yojson "TranscriptionJobStatus")
         _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
     output_location_type =
       option_of_yojson
         (value_for_key output_location_type_of_yojson "OutputLocationType")
         _list path;
     content_redaction =
       option_of_yojson (value_for_key content_redaction_of_yojson "ContentRedaction") _list path;
     model_settings =
       option_of_yojson (value_for_key model_settings_of_yojson "ModelSettings") _list path;
     identify_language =
       option_of_yojson (value_for_key boolean__of_yojson "IdentifyLanguage") _list path;
     identify_multiple_languages =
       option_of_yojson (value_for_key boolean__of_yojson "IdentifyMultipleLanguages") _list path;
     identified_language_score =
       option_of_yojson
         (value_for_key identified_language_score_of_yojson "IdentifiedLanguageScore")
         _list path;
     language_codes =
       option_of_yojson (value_for_key language_code_list_of_yojson "LanguageCodes") _list path;
     toxicity_detection =
       option_of_yojson (value_for_key toxicity_detection_of_yojson "ToxicityDetection") _list path;
   }
    : transcription_job_summary)

let transcription_job_summaries_of_yojson tree path =
  list_of_yojson transcription_job_summary_of_yojson tree path

let list_transcription_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key transcription_job_status_of_yojson "Status") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     transcription_job_summaries =
       option_of_yojson
         (value_for_key transcription_job_summaries_of_yojson "TranscriptionJobSummaries")
         _list path;
   }
    : list_transcription_jobs_response)

let list_transcription_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key transcription_job_status_of_yojson "Status") _list path;
     job_name_contains =
       option_of_yojson
         (value_for_key transcription_job_name_of_yojson "JobNameContains")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_transcription_jobs_request)

let list_vocabularies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key vocabulary_state_of_yojson "Status") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     vocabularies =
       option_of_yojson (value_for_key vocabularies_of_yojson "Vocabularies") _list path;
   }
    : list_vocabularies_response)

let list_vocabularies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     state_equals =
       option_of_yojson (value_for_key vocabulary_state_of_yojson "StateEquals") _list path;
     name_contains =
       option_of_yojson (value_for_key vocabulary_name_of_yojson "NameContains") _list path;
   }
    : list_vocabularies_request)

let vocabulary_filter_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_filter_name =
       option_of_yojson
         (value_for_key vocabulary_filter_name_of_yojson "VocabularyFilterName")
         _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     last_modified_time =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedTime") _list path;
   }
    : vocabulary_filter_info)

let vocabulary_filters_of_yojson tree path =
  list_of_yojson vocabulary_filter_info_of_yojson tree path

let list_vocabulary_filters_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     vocabulary_filters =
       option_of_yojson (value_for_key vocabulary_filters_of_yojson "VocabularyFilters") _list path;
   }
    : list_vocabulary_filters_response)

let list_vocabulary_filters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     name_contains =
       option_of_yojson (value_for_key vocabulary_filter_name_of_yojson "NameContains") _list path;
   }
    : list_vocabulary_filters_request)

let pronouns_of_yojson (tree : t) path =
  ((match tree with
    | `String "HE_HIM" -> HE_HIM
    | `String "SHE_HER" -> SHE_HER
    | `String "THEY_THEM" -> THEY_THEM
    | `String value -> raise (deserialize_unknown_enum_value_error path "Pronouns" value)
    | _ -> raise (deserialize_wrong_type_error path "Pronouns")
     : pronouns)
    : pronouns)

let medical_scribe_patient_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pronouns = option_of_yojson (value_for_key pronouns_of_yojson "Pronouns") _list path }
    : medical_scribe_patient_context)

let medical_scribe_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     patient_context =
       option_of_yojson
         (value_for_key medical_scribe_patient_context_of_yojson "PatientContext")
         _list path;
   }
    : medical_scribe_context)

let output_bucket_name_of_yojson = string_of_yojson
let output_key_of_yojson = string_of_yojson

let start_call_analytics_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     call_analytics_job =
       option_of_yojson (value_for_key call_analytics_job_of_yojson "CallAnalyticsJob") _list path;
   }
    : start_call_analytics_job_response)

let start_call_analytics_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     call_analytics_job_name =
       value_for_key call_analytics_job_name_of_yojson "CallAnalyticsJobName" _list path;
     media = value_for_key media_of_yojson "Media" _list path;
     output_location = option_of_yojson (value_for_key uri_of_yojson "OutputLocation") _list path;
     output_encryption_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "OutputEncryptionKMSKeyId") _list path;
     data_access_role_arn =
       option_of_yojson
         (value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn")
         _list path;
     settings =
       option_of_yojson (value_for_key call_analytics_job_settings_of_yojson "Settings") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     channel_definitions =
       option_of_yojson
         (value_for_key channel_definitions_of_yojson "ChannelDefinitions")
         _list path;
   }
    : start_call_analytics_job_request)

let start_medical_scribe_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     medical_scribe_job =
       option_of_yojson (value_for_key medical_scribe_job_of_yojson "MedicalScribeJob") _list path;
   }
    : start_medical_scribe_job_response)

let start_medical_scribe_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     medical_scribe_job_name =
       value_for_key transcription_job_name_of_yojson "MedicalScribeJobName" _list path;
     media = value_for_key media_of_yojson "Media" _list path;
     output_bucket_name = value_for_key output_bucket_name_of_yojson "OutputBucketName" _list path;
     output_encryption_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "OutputEncryptionKMSKeyId") _list path;
     kms_encryption_context =
       option_of_yojson
         (value_for_key kms_encryption_context_map_of_yojson "KMSEncryptionContext")
         _list path;
     data_access_role_arn =
       value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn" _list path;
     settings = value_for_key medical_scribe_settings_of_yojson "Settings" _list path;
     channel_definitions =
       option_of_yojson
         (value_for_key medical_scribe_channel_definitions_of_yojson "ChannelDefinitions")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     medical_scribe_context =
       option_of_yojson
         (value_for_key medical_scribe_context_of_yojson "MedicalScribeContext")
         _list path;
   }
    : start_medical_scribe_job_request)

let start_medical_transcription_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     medical_transcription_job =
       option_of_yojson
         (value_for_key medical_transcription_job_of_yojson "MedicalTranscriptionJob")
         _list path;
   }
    : start_medical_transcription_job_response)

let start_medical_transcription_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     medical_transcription_job_name =
       value_for_key transcription_job_name_of_yojson "MedicalTranscriptionJobName" _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
     media_sample_rate_hertz =
       option_of_yojson
         (value_for_key medical_media_sample_rate_hertz_of_yojson "MediaSampleRateHertz")
         _list path;
     media_format = option_of_yojson (value_for_key media_format_of_yojson "MediaFormat") _list path;
     media = value_for_key media_of_yojson "Media" _list path;
     output_bucket_name = value_for_key output_bucket_name_of_yojson "OutputBucketName" _list path;
     output_key = option_of_yojson (value_for_key output_key_of_yojson "OutputKey") _list path;
     output_encryption_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "OutputEncryptionKMSKeyId") _list path;
     kms_encryption_context =
       option_of_yojson
         (value_for_key kms_encryption_context_map_of_yojson "KMSEncryptionContext")
         _list path;
     settings =
       option_of_yojson
         (value_for_key medical_transcription_setting_of_yojson "Settings")
         _list path;
     content_identification_type =
       option_of_yojson
         (value_for_key medical_content_identification_type_of_yojson "ContentIdentificationType")
         _list path;
     specialty = value_for_key specialty_of_yojson "Specialty" _list path;
     type_ = value_for_key type__of_yojson "Type" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : start_medical_transcription_job_request)

let start_transcription_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transcription_job =
       option_of_yojson (value_for_key transcription_job_of_yojson "TranscriptionJob") _list path;
   }
    : start_transcription_job_response)

let subtitles_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     formats = option_of_yojson (value_for_key subtitle_formats_of_yojson "Formats") _list path;
     output_start_index =
       option_of_yojson
         (value_for_key subtitle_output_start_index_of_yojson "OutputStartIndex")
         _list path;
   }
    : subtitles)

let start_transcription_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transcription_job_name =
       value_for_key transcription_job_name_of_yojson "TranscriptionJobName" _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     media_sample_rate_hertz =
       option_of_yojson
         (value_for_key media_sample_rate_hertz_of_yojson "MediaSampleRateHertz")
         _list path;
     media_format = option_of_yojson (value_for_key media_format_of_yojson "MediaFormat") _list path;
     media = value_for_key media_of_yojson "Media" _list path;
     output_bucket_name =
       option_of_yojson (value_for_key output_bucket_name_of_yojson "OutputBucketName") _list path;
     output_key = option_of_yojson (value_for_key output_key_of_yojson "OutputKey") _list path;
     output_encryption_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "OutputEncryptionKMSKeyId") _list path;
     kms_encryption_context =
       option_of_yojson
         (value_for_key kms_encryption_context_map_of_yojson "KMSEncryptionContext")
         _list path;
     settings = option_of_yojson (value_for_key settings_of_yojson "Settings") _list path;
     model_settings =
       option_of_yojson (value_for_key model_settings_of_yojson "ModelSettings") _list path;
     job_execution_settings =
       option_of_yojson
         (value_for_key job_execution_settings_of_yojson "JobExecutionSettings")
         _list path;
     content_redaction =
       option_of_yojson (value_for_key content_redaction_of_yojson "ContentRedaction") _list path;
     identify_language =
       option_of_yojson (value_for_key boolean__of_yojson "IdentifyLanguage") _list path;
     identify_multiple_languages =
       option_of_yojson (value_for_key boolean__of_yojson "IdentifyMultipleLanguages") _list path;
     language_options =
       option_of_yojson (value_for_key language_options_of_yojson "LanguageOptions") _list path;
     subtitles = option_of_yojson (value_for_key subtitles_of_yojson "Subtitles") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     language_id_settings =
       option_of_yojson
         (value_for_key language_id_settings_map_of_yojson "LanguageIdSettings")
         _list path;
     toxicity_detection =
       option_of_yojson (value_for_key toxicity_detection_of_yojson "ToxicityDetection") _list path;
   }
    : start_transcription_job_request)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key transcribe_arn_of_yojson "ResourceArn" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let update_vocabulary_filter_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_filter_name =
       option_of_yojson
         (value_for_key vocabulary_filter_name_of_yojson "VocabularyFilterName")
         _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     last_modified_time =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedTime") _list path;
   }
    : update_vocabulary_filter_response)

let update_vocabulary_filter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_filter_name =
       value_for_key vocabulary_filter_name_of_yojson "VocabularyFilterName" _list path;
     words = option_of_yojson (value_for_key words_of_yojson "Words") _list path;
     vocabulary_filter_file_uri =
       option_of_yojson (value_for_key uri_of_yojson "VocabularyFilterFileUri") _list path;
     data_access_role_arn =
       option_of_yojson
         (value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn")
         _list path;
   }
    : update_vocabulary_filter_request)

let update_vocabulary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_name =
       option_of_yojson (value_for_key vocabulary_name_of_yojson "VocabularyName") _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     last_modified_time =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedTime") _list path;
     vocabulary_state =
       option_of_yojson (value_for_key vocabulary_state_of_yojson "VocabularyState") _list path;
   }
    : update_vocabulary_response)

let update_vocabulary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_name = value_for_key vocabulary_name_of_yojson "VocabularyName" _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
     phrases = option_of_yojson (value_for_key phrases_of_yojson "Phrases") _list path;
     vocabulary_file_uri =
       option_of_yojson (value_for_key uri_of_yojson "VocabularyFileUri") _list path;
     data_access_role_arn =
       option_of_yojson
         (value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn")
         _list path;
   }
    : update_vocabulary_request)

let update_medical_vocabulary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_name =
       option_of_yojson (value_for_key vocabulary_name_of_yojson "VocabularyName") _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     last_modified_time =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedTime") _list path;
     vocabulary_state =
       option_of_yojson (value_for_key vocabulary_state_of_yojson "VocabularyState") _list path;
   }
    : update_medical_vocabulary_response)

let update_medical_vocabulary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vocabulary_name = value_for_key vocabulary_name_of_yojson "VocabularyName" _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
     vocabulary_file_uri = value_for_key uri_of_yojson "VocabularyFileUri" _list path;
   }
    : update_medical_vocabulary_request)

let update_call_analytics_category_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     category_properties =
       option_of_yojson
         (value_for_key category_properties_of_yojson "CategoryProperties")
         _list path;
   }
    : update_call_analytics_category_response)

let update_call_analytics_category_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     category_name = value_for_key category_name_of_yojson "CategoryName" _list path;
     rules = value_for_key rule_list_of_yojson "Rules" _list path;
     input_type = option_of_yojson (value_for_key input_type_of_yojson "InputType") _list path;
   }
    : update_call_analytics_category_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key transcribe_arn_of_yojson "ResourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)
