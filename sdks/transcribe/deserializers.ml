open Smaws_Lib.Json.DeserializeHelpers
open Types
let word_of_yojson = string_of_yojson
let words_of_yojson tree path = list_of_yojson word_of_yojson tree path
let base_unit_of_yojson = unit_of_yojson
let vocabulary_state_of_yojson (tree : t) path =
  (match tree with
   | `String "FAILED" -> FAILED
   | `String "READY" -> READY
   | `String "PENDING" -> PENDING
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "VocabularyState" value)
   | _ -> raise (deserialize_wrong_type_error path "VocabularyState") : 
  vocabulary_state)
let vocabulary_name_of_yojson = string_of_yojson
let language_code_of_yojson (tree : t) path =
  (match tree with
   | `String "ZU_ZA" -> ZU_ZA
   | `String "WO_SN" -> WO_SN
   | `String "UZ_UZ" -> UZ_UZ
   | `String "UK_UA" -> UK_UA
   | `String "UG_CN" -> UG_CN
   | `String "TT_RU" -> TT_RU
   | `String "TL_PH" -> TL_PH
   | `String "SW_UG" -> SW_UG
   | `String "SW_TZ" -> SW_TZ
   | `String "SW_RW" -> SW_RW
   | `String "SW_KE" -> SW_KE
   | `String "SW_BI" -> SW_BI
   | `String "SU_ID" -> SU_ID
   | `String "SR_RS" -> SR_RS
   | `String "SO_SO" -> SO_SO
   | `String "SL_SI" -> SL_SI
   | `String "SK_SK" -> SK_SK
   | `String "SI_LK" -> SI_LK
   | `String "RW_RW" -> RW_RW
   | `String "RO_RO" -> RO_RO
   | `String "PS_AF" -> PS_AF
   | `String "PL_PL" -> PL_PL
   | `String "PA_IN" -> PA_IN
   | `String "OR_IN" -> OR_IN
   | `String "NO_NO" -> NO_NO
   | `String "MT_MT" -> MT_MT
   | `String "MR_IN" -> MR_IN
   | `String "MN_MN" -> MN_MN
   | `String "ML_IN" -> ML_IN
   | `String "MK_MK" -> MK_MK
   | `String "MI_NZ" -> MI_NZ
   | `String "MHR_RU" -> MHR_RU
   | `String "LV_LV" -> LV_LV
   | `String "LT_LT" -> LT_LT
   | `String "LG_IN" -> LG_IN
   | `String "KY_KG" -> KY_KG
   | `String "KN_IN" -> KN_IN
   | `String "KK_KZ" -> KK_KZ
   | `String "KAB_DZ" -> KAB_DZ
   | `String "KA_GE" -> KA_GE
   | `String "IS_IS" -> IS_IS
   | `String "HY_AM" -> HY_AM
   | `String "HU_HU" -> HU_HU
   | `String "HR_HR" -> HR_HR
   | `String "HA_NG" -> HA_NG
   | `String "GU_IN" -> GU_IN
   | `String "GL_ES" -> GL_ES
   | `String "FI_FI" -> FI_FI
   | `String "EU_ES" -> EU_ES
   | `String "ET_ET" -> ET_ET
   | `String "EL_GR" -> EL_GR
   | `String "CY_WL" -> CY_WL
   | `String "CS_CZ" -> CS_CZ
   | `String "CKB_IR" -> CKB_IR
   | `String "CKB_IQ" -> CKB_IQ
   | `String "CA_ES" -> CA_ES
   | `String "BS_BA" -> BS_BA
   | `String "BN_IN" -> BN_IN
   | `String "BG_BG" -> BG_BG
   | `String "BE_BY" -> BE_BY
   | `String "BA_RU" -> BA_RU
   | `String "AZ_AZ" -> AZ_AZ
   | `String "AST_ES" -> AST_ES
   | `String "AB_GE" -> AB_GE
   | `String "SV_SE" -> SV_SE
   | `String "VI_VN" -> VI_VN
   | `String "EN_NZ" -> EN_NZ
   | `String "EN_ZA" -> EN_ZA
   | `String "TH_TH" -> TH_TH
   | `String "ZH_TW" -> ZH_TW
   | `String "ZH_CN" -> ZH_CN
   | `String "TR_TR" -> TR_TR
   | `String "TE_IN" -> TE_IN
   | `String "TA_IN" -> TA_IN
   | `String "RU_RU" -> RU_RU
   | `String "PT_PT" -> PT_PT
   | `String "PT_BR" -> PT_BR
   | `String "NL_NL" -> NL_NL
   | `String "MS_MY" -> MS_MY
   | `String "KO_KR" -> KO_KR
   | `String "JA_JP" -> JA_JP
   | `String "IT_IT" -> IT_IT
   | `String "ID_ID" -> ID_ID
   | `String "HI_IN" -> HI_IN
   | `String "HE_IL" -> HE_IL
   | `String "FR_FR" -> FR_FR
   | `String "FR_CA" -> FR_CA
   | `String "FA_IR" -> FA_IR
   | `String "ES_US" -> ES_US
   | `String "ES_ES" -> ES_ES
   | `String "EN_WL" -> EN_WL
   | `String "EN_US" -> EN_US
   | `String "EN_IN" -> EN_IN
   | `String "EN_IE" -> EN_IE
   | `String "EN_GB" -> EN_GB
   | `String "EN_AU" -> EN_AU
   | `String "EN_AB" -> EN_AB
   | `String "DE_DE" -> DE_DE
   | `String "DE_CH" -> DE_CH
   | `String "DA_DK" -> DA_DK
   | `String "AR_SA" -> AR_SA
   | `String "AR_AE" -> AR_AE
   | `String "AF_ZA" -> AF_ZA
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "LanguageCode" value)
   | _ -> raise (deserialize_wrong_type_error path "LanguageCode") : 
  language_code)
let date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let vocabulary_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : vocabulary_info =
    {
      vocabulary_state =
        (option_of_yojson
           (value_for_key vocabulary_state_of_yojson "VocabularyState") _list
           path);
      last_modified_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "LastModifiedTime") _list path);
      language_code =
        (option_of_yojson
           (value_for_key language_code_of_yojson "LanguageCode") _list path);
      vocabulary_name =
        (option_of_yojson
           (value_for_key vocabulary_name_of_yojson "VocabularyName") _list
           path)
    } in
  _res
let vocabulary_filter_name_of_yojson = string_of_yojson
let vocabulary_filter_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : vocabulary_filter_info =
    {
      last_modified_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "LastModifiedTime") _list path);
      language_code =
        (option_of_yojson
           (value_for_key language_code_of_yojson "LanguageCode") _list path);
      vocabulary_filter_name =
        (option_of_yojson
           (value_for_key vocabulary_filter_name_of_yojson
              "VocabularyFilterName") _list path)
    } in
  _res
let vocabulary_filters_of_yojson tree path =
  list_of_yojson vocabulary_filter_info_of_yojson tree path
let vocabulary_filter_method_of_yojson (tree : t) path =
  (match tree with
   | `String "TAG" -> TAG
   | `String "MASK" -> MASK
   | `String "REMOVE" -> REMOVE
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "VocabularyFilterMethod"
            value)
   | _ -> raise (deserialize_wrong_type_error path "VocabularyFilterMethod") : 
  vocabulary_filter_method)
let vocabularies_of_yojson tree path =
  list_of_yojson vocabulary_info_of_yojson tree path
let uri_of_yojson = string_of_yojson
let update_vocabulary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : update_vocabulary_response =
    {
      vocabulary_state =
        (option_of_yojson
           (value_for_key vocabulary_state_of_yojson "VocabularyState") _list
           path);
      last_modified_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "LastModifiedTime") _list path);
      language_code =
        (option_of_yojson
           (value_for_key language_code_of_yojson "LanguageCode") _list path);
      vocabulary_name =
        (option_of_yojson
           (value_for_key vocabulary_name_of_yojson "VocabularyName") _list
           path)
    } in
  _res
let phrase_of_yojson = string_of_yojson
let phrases_of_yojson tree path = list_of_yojson phrase_of_yojson tree path
let data_access_role_arn_of_yojson = string_of_yojson
let update_vocabulary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : update_vocabulary_request =
    {
      data_access_role_arn =
        (option_of_yojson
           (value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn")
           _list path);
      vocabulary_file_uri =
        (option_of_yojson (value_for_key uri_of_yojson "VocabularyFileUri")
           _list path);
      phrases =
        (option_of_yojson (value_for_key phrases_of_yojson "Phrases") _list
           path);
      language_code =
        (value_for_key language_code_of_yojson "LanguageCode" _list path);
      vocabulary_name =
        (value_for_key vocabulary_name_of_yojson "VocabularyName" _list path)
    } in
  _res
let update_vocabulary_filter_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : update_vocabulary_filter_response =
    {
      last_modified_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "LastModifiedTime") _list path);
      language_code =
        (option_of_yojson
           (value_for_key language_code_of_yojson "LanguageCode") _list path);
      vocabulary_filter_name =
        (option_of_yojson
           (value_for_key vocabulary_filter_name_of_yojson
              "VocabularyFilterName") _list path)
    } in
  _res
let update_vocabulary_filter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : update_vocabulary_filter_request =
    {
      data_access_role_arn =
        (option_of_yojson
           (value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn")
           _list path);
      vocabulary_filter_file_uri =
        (option_of_yojson
           (value_for_key uri_of_yojson "VocabularyFilterFileUri") _list path);
      words =
        (option_of_yojson (value_for_key words_of_yojson "Words") _list path);
      vocabulary_filter_name =
        (value_for_key vocabulary_filter_name_of_yojson
           "VocabularyFilterName" _list path)
    } in
  _res
let string__of_yojson = string_of_yojson
let not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : not_found_exception =
    {
      message =
        (option_of_yojson (value_for_key string__of_yojson "Message") _list
           path)
    } in
  _res
let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : limit_exceeded_exception =
    {
      message =
        (option_of_yojson (value_for_key string__of_yojson "Message") _list
           path)
    } in
  _res
let internal_failure_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : internal_failure_exception =
    {
      message =
        (option_of_yojson (value_for_key string__of_yojson "Message") _list
           path)
    } in
  _res
let failure_reason_of_yojson = string_of_yojson
let bad_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : bad_request_exception =
    {
      message =
        (option_of_yojson (value_for_key failure_reason_of_yojson "Message")
           _list path)
    } in
  _res
let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : conflict_exception =
    {
      message =
        (option_of_yojson (value_for_key string__of_yojson "Message") _list
           path)
    } in
  _res
let update_medical_vocabulary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : update_medical_vocabulary_response =
    {
      vocabulary_state =
        (option_of_yojson
           (value_for_key vocabulary_state_of_yojson "VocabularyState") _list
           path);
      last_modified_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "LastModifiedTime") _list path);
      language_code =
        (option_of_yojson
           (value_for_key language_code_of_yojson "LanguageCode") _list path);
      vocabulary_name =
        (option_of_yojson
           (value_for_key vocabulary_name_of_yojson "VocabularyName") _list
           path)
    } in
  _res
let update_medical_vocabulary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : update_medical_vocabulary_request =
    {
      vocabulary_file_uri =
        (value_for_key uri_of_yojson "VocabularyFileUri" _list path);
      language_code =
        (value_for_key language_code_of_yojson "LanguageCode" _list path);
      vocabulary_name =
        (value_for_key vocabulary_name_of_yojson "VocabularyName" _list path)
    } in
  _res
let category_name_of_yojson = string_of_yojson
let timestamp_milliseconds_of_yojson = long_of_yojson
let absolute_time_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : absolute_time_range =
    {
      last =
        (option_of_yojson
           (value_for_key timestamp_milliseconds_of_yojson "Last") _list path);
      first =
        (option_of_yojson
           (value_for_key timestamp_milliseconds_of_yojson "First") _list
           path);
      end_time =
        (option_of_yojson
           (value_for_key timestamp_milliseconds_of_yojson "EndTime") _list
           path);
      start_time =
        (option_of_yojson
           (value_for_key timestamp_milliseconds_of_yojson "StartTime") _list
           path)
    } in
  _res
let percentage_of_yojson = int_of_yojson
let relative_time_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : relative_time_range =
    {
      last =
        (option_of_yojson (value_for_key percentage_of_yojson "Last") _list
           path);
      first =
        (option_of_yojson (value_for_key percentage_of_yojson "First") _list
           path);
      end_percentage =
        (option_of_yojson
           (value_for_key percentage_of_yojson "EndPercentage") _list path);
      start_percentage =
        (option_of_yojson
           (value_for_key percentage_of_yojson "StartPercentage") _list path)
    } in
  _res
let boolean__of_yojson = bool_of_yojson
let non_talk_time_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : non_talk_time_filter =
    {
      negate =
        (option_of_yojson (value_for_key boolean__of_yojson "Negate") _list
           path);
      relative_time_range =
        (option_of_yojson
           (value_for_key relative_time_range_of_yojson "RelativeTimeRange")
           _list path);
      absolute_time_range =
        (option_of_yojson
           (value_for_key absolute_time_range_of_yojson "AbsoluteTimeRange")
           _list path);
      threshold =
        (option_of_yojson
           (value_for_key timestamp_milliseconds_of_yojson "Threshold") _list
           path)
    } in
  _res
let participant_role_of_yojson (tree : t) path =
  (match tree with
   | `String "CUSTOMER" -> CUSTOMER
   | `String "AGENT" -> AGENT
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "ParticipantRole" value)
   | _ -> raise (deserialize_wrong_type_error path "ParticipantRole") : 
  participant_role)
let interruption_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : interruption_filter =
    {
      negate =
        (option_of_yojson (value_for_key boolean__of_yojson "Negate") _list
           path);
      relative_time_range =
        (option_of_yojson
           (value_for_key relative_time_range_of_yojson "RelativeTimeRange")
           _list path);
      absolute_time_range =
        (option_of_yojson
           (value_for_key absolute_time_range_of_yojson "AbsoluteTimeRange")
           _list path);
      participant_role =
        (option_of_yojson
           (value_for_key participant_role_of_yojson "ParticipantRole") _list
           path);
      threshold =
        (option_of_yojson
           (value_for_key timestamp_milliseconds_of_yojson "Threshold") _list
           path)
    } in
  _res
let transcript_filter_type_of_yojson (tree : t) path =
  (match tree with
   | `String "EXACT" -> EXACT
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "TranscriptFilterType"
            value)
   | _ -> raise (deserialize_wrong_type_error path "TranscriptFilterType") : 
  transcript_filter_type)
let non_empty_string_of_yojson = string_of_yojson
let string_target_list_of_yojson tree path =
  list_of_yojson non_empty_string_of_yojson tree path
let transcript_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : transcript_filter =
    {
      targets =
        (value_for_key string_target_list_of_yojson "Targets" _list path);
      negate =
        (option_of_yojson (value_for_key boolean__of_yojson "Negate") _list
           path);
      participant_role =
        (option_of_yojson
           (value_for_key participant_role_of_yojson "ParticipantRole") _list
           path);
      relative_time_range =
        (option_of_yojson
           (value_for_key relative_time_range_of_yojson "RelativeTimeRange")
           _list path);
      absolute_time_range =
        (option_of_yojson
           (value_for_key absolute_time_range_of_yojson "AbsoluteTimeRange")
           _list path);
      transcript_filter_type =
        (value_for_key transcript_filter_type_of_yojson
           "TranscriptFilterType" _list path)
    } in
  _res
let sentiment_value_of_yojson (tree : t) path =
  (match tree with
   | `String "MIXED" -> MIXED
   | `String "NEUTRAL" -> NEUTRAL
   | `String "NEGATIVE" -> NEGATIVE
   | `String "POSITIVE" -> POSITIVE
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "SentimentValue" value)
   | _ -> raise (deserialize_wrong_type_error path "SentimentValue") : 
  sentiment_value)
let sentiment_value_list_of_yojson tree path =
  list_of_yojson sentiment_value_of_yojson tree path
let sentiment_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : sentiment_filter =
    {
      negate =
        (option_of_yojson (value_for_key boolean__of_yojson "Negate") _list
           path);
      participant_role =
        (option_of_yojson
           (value_for_key participant_role_of_yojson "ParticipantRole") _list
           path);
      relative_time_range =
        (option_of_yojson
           (value_for_key relative_time_range_of_yojson "RelativeTimeRange")
           _list path);
      absolute_time_range =
        (option_of_yojson
           (value_for_key absolute_time_range_of_yojson "AbsoluteTimeRange")
           _list path);
      sentiments =
        (value_for_key sentiment_value_list_of_yojson "Sentiments" _list path)
    } in
  _res
let rule_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let (key, value_) =
    match _list with
    | (key, value_)::_ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union") in
  match key with
  | "SentimentFilter" ->
      SentimentFilter (sentiment_filter_of_yojson value_ path)
  | "TranscriptFilter" ->
      TranscriptFilter (transcript_filter_of_yojson value_ path)
  | "InterruptionFilter" ->
      InterruptionFilter (interruption_filter_of_yojson value_ path)
  | "NonTalkTimeFilter" ->
      NonTalkTimeFilter (non_talk_time_filter_of_yojson value_ path)
  | _ as unknown ->
      raise (deserialize_unknown_enum_value_error path "Rule" unknown)
let rule_list_of_yojson tree path = list_of_yojson rule_of_yojson tree path
let input_type_of_yojson (tree : t) path =
  (match tree with
   | `String "POST_CALL" -> POST_CALL
   | `String "REAL_TIME" -> REAL_TIME
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "InputType" value)
   | _ -> raise (deserialize_wrong_type_error path "InputType") : input_type)
let category_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : category_properties =
    {
      input_type =
        (option_of_yojson (value_for_key input_type_of_yojson "InputType")
           _list path);
      last_update_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "LastUpdateTime") _list path);
      create_time =
        (option_of_yojson (value_for_key date_time_of_yojson "CreateTime")
           _list path);
      rules =
        (option_of_yojson (value_for_key rule_list_of_yojson "Rules") _list
           path);
      category_name =
        (option_of_yojson
           (value_for_key category_name_of_yojson "CategoryName") _list path)
    } in
  _res
let update_call_analytics_category_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : update_call_analytics_category_response =
    {
      category_properties =
        (option_of_yojson
           (value_for_key category_properties_of_yojson "CategoryProperties")
           _list path)
    } in
  _res
let update_call_analytics_category_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : update_call_analytics_category_request =
    {
      input_type =
        (option_of_yojson (value_for_key input_type_of_yojson "InputType")
           _list path);
      rules = (value_for_key rule_list_of_yojson "Rules" _list path);
      category_name =
        (value_for_key category_name_of_yojson "CategoryName" _list path)
    } in
  _res
let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in let _res : unit = () in _res
let transcribe_arn_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path =
  list_of_yojson tag_key_of_yojson tree path
let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_request =
    {
      tag_keys = (value_for_key tag_key_list_of_yojson "TagKeys" _list path);
      resource_arn =
        (value_for_key transcribe_arn_of_yojson "ResourceArn" _list path)
    } in
  _res
let type__of_yojson (tree : t) path =
  (match tree with
   | `String "DICTATION" -> DICTATION
   | `String "CONVERSATION" -> CONVERSATION
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "Type" value)
   | _ -> raise (deserialize_wrong_type_error path "Type") : type_)
let transcription_job_name_of_yojson = string_of_yojson
let transcription_job_status_of_yojson (tree : t) path =
  (match tree with
   | `String "COMPLETED" -> COMPLETED
   | `String "FAILED" -> FAILED
   | `String "IN_PROGRESS" -> IN_PROGRESS
   | `String "QUEUED" -> QUEUED
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "TranscriptionJobStatus"
            value)
   | _ -> raise (deserialize_wrong_type_error path "TranscriptionJobStatus") : 
  transcription_job_status)
let output_location_type_of_yojson (tree : t) path =
  (match tree with
   | `String "SERVICE_BUCKET" -> SERVICE_BUCKET
   | `String "CUSTOMER_BUCKET" -> CUSTOMER_BUCKET
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "OutputLocationType"
            value)
   | _ -> raise (deserialize_wrong_type_error path "OutputLocationType") : 
  output_location_type)
let redaction_type_of_yojson (tree : t) path =
  (match tree with
   | `String "PII" -> PII
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "RedactionType" value)
   | _ -> raise (deserialize_wrong_type_error path "RedactionType") : 
  redaction_type)
let redaction_output_of_yojson (tree : t) path =
  (match tree with
   | `String "REDACTED_AND_UNREDACTED" -> REDACTED_AND_UNREDACTED
   | `String "REDACTED" -> REDACTED
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "RedactionOutput" value)
   | _ -> raise (deserialize_wrong_type_error path "RedactionOutput") : 
  redaction_output)
let pii_entity_type_of_yojson (tree : t) path =
  (match tree with
   | `String "ALL" -> ALL
   | `String "SSN" -> SSN
   | `String "PHONE" -> PHONE
   | `String "NAME" -> NAME
   | `String "ADDRESS" -> ADDRESS
   | `String "EMAIL" -> EMAIL
   | `String "PIN" -> PIN
   | `String "CREDIT_DEBIT_EXPIRY" -> CREDIT_DEBIT_EXPIRY
   | `String "CREDIT_DEBIT_CVV" -> CREDIT_DEBIT_CVV
   | `String "CREDIT_DEBIT_NUMBER" -> CREDIT_DEBIT_NUMBER
   | `String "BANK_ROUTING" -> BANK_ROUTING
   | `String "BANK_ACCOUNT_NUMBER" -> BANK_ACCOUNT_NUMBER
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "PiiEntityType" value)
   | _ -> raise (deserialize_wrong_type_error path "PiiEntityType") : 
  pii_entity_type)
let pii_entity_types_of_yojson tree path =
  list_of_yojson pii_entity_type_of_yojson tree path
let content_redaction_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : content_redaction =
    {
      pii_entity_types =
        (option_of_yojson
           (value_for_key pii_entity_types_of_yojson "PiiEntityTypes") _list
           path);
      redaction_output =
        (value_for_key redaction_output_of_yojson "RedactionOutput" _list
           path);
      redaction_type =
        (value_for_key redaction_type_of_yojson "RedactionType" _list path)
    } in
  _res
let model_name_of_yojson = string_of_yojson
let model_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : model_settings =
    {
      language_model_name =
        (option_of_yojson
           (value_for_key model_name_of_yojson "LanguageModelName") _list
           path)
    } in
  _res
let identified_language_score_of_yojson = float_of_yojson
let duration_in_seconds_of_yojson = float_of_yojson
let language_code_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : language_code_item =
    {
      duration_in_seconds =
        (option_of_yojson
           (value_for_key duration_in_seconds_of_yojson "DurationInSeconds")
           _list path);
      language_code =
        (option_of_yojson
           (value_for_key language_code_of_yojson "LanguageCode") _list path)
    } in
  _res
let language_code_list_of_yojson tree path =
  list_of_yojson language_code_item_of_yojson tree path
let toxicity_category_of_yojson (tree : t) path =
  (match tree with
   | `String "ALL" -> ALL
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "ToxicityCategory" value)
   | _ -> raise (deserialize_wrong_type_error path "ToxicityCategory") : 
  toxicity_category)
let toxicity_categories_of_yojson tree path =
  list_of_yojson toxicity_category_of_yojson tree path
let toxicity_detection_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : toxicity_detection_settings =
    {
      toxicity_categories =
        (value_for_key toxicity_categories_of_yojson "ToxicityCategories"
           _list path)
    } in
  _res
let toxicity_detection_of_yojson tree path =
  list_of_yojson toxicity_detection_settings_of_yojson tree path
let transcription_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : transcription_job_summary =
    {
      toxicity_detection =
        (option_of_yojson
           (value_for_key toxicity_detection_of_yojson "ToxicityDetection")
           _list path);
      language_codes =
        (option_of_yojson
           (value_for_key language_code_list_of_yojson "LanguageCodes") _list
           path);
      identified_language_score =
        (option_of_yojson
           (value_for_key identified_language_score_of_yojson
              "IdentifiedLanguageScore") _list path);
      identify_multiple_languages =
        (option_of_yojson
           (value_for_key boolean__of_yojson "IdentifyMultipleLanguages")
           _list path);
      identify_language =
        (option_of_yojson
           (value_for_key boolean__of_yojson "IdentifyLanguage") _list path);
      model_settings =
        (option_of_yojson
           (value_for_key model_settings_of_yojson "ModelSettings") _list
           path);
      content_redaction =
        (option_of_yojson
           (value_for_key content_redaction_of_yojson "ContentRedaction")
           _list path);
      output_location_type =
        (option_of_yojson
           (value_for_key output_location_type_of_yojson "OutputLocationType")
           _list path);
      failure_reason =
        (option_of_yojson
           (value_for_key failure_reason_of_yojson "FailureReason") _list
           path);
      transcription_job_status =
        (option_of_yojson
           (value_for_key transcription_job_status_of_yojson
              "TranscriptionJobStatus") _list path);
      language_code =
        (option_of_yojson
           (value_for_key language_code_of_yojson "LanguageCode") _list path);
      completion_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "CompletionTime") _list path);
      start_time =
        (option_of_yojson (value_for_key date_time_of_yojson "StartTime")
           _list path);
      creation_time =
        (option_of_yojson (value_for_key date_time_of_yojson "CreationTime")
           _list path);
      transcription_job_name =
        (option_of_yojson
           (value_for_key transcription_job_name_of_yojson
              "TranscriptionJobName") _list path)
    } in
  _res
let transcription_job_summaries_of_yojson tree path =
  list_of_yojson transcription_job_summary_of_yojson tree path
let media_sample_rate_hertz_of_yojson = int_of_yojson
let media_format_of_yojson (tree : t) path =
  (match tree with
   | `String "M4A" -> M4A
   | `String "WEBM" -> WEBM
   | `String "AMR" -> AMR
   | `String "OGG" -> OGG
   | `String "FLAC" -> FLAC
   | `String "WAV" -> WAV
   | `String "MP4" -> MP4
   | `String "MP3" -> MP3
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "MediaFormat" value)
   | _ -> raise (deserialize_wrong_type_error path "MediaFormat") : media_format)
let media_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : media =
    {
      redacted_media_file_uri =
        (option_of_yojson
           (value_for_key uri_of_yojson "RedactedMediaFileUri") _list path);
      media_file_uri =
        (option_of_yojson (value_for_key uri_of_yojson "MediaFileUri") _list
           path)
    } in
  _res
let transcript_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : transcript =
    {
      redacted_transcript_file_uri =
        (option_of_yojson
           (value_for_key uri_of_yojson "RedactedTranscriptFileUri") _list
           path);
      transcript_file_uri =
        (option_of_yojson (value_for_key uri_of_yojson "TranscriptFileUri")
           _list path)
    } in
  _res
let max_speakers_of_yojson = int_of_yojson
let max_alternatives_of_yojson = int_of_yojson
let settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : settings =
    {
      vocabulary_filter_method =
        (option_of_yojson
           (value_for_key vocabulary_filter_method_of_yojson
              "VocabularyFilterMethod") _list path);
      vocabulary_filter_name =
        (option_of_yojson
           (value_for_key vocabulary_filter_name_of_yojson
              "VocabularyFilterName") _list path);
      max_alternatives =
        (option_of_yojson
           (value_for_key max_alternatives_of_yojson "MaxAlternatives") _list
           path);
      show_alternatives =
        (option_of_yojson
           (value_for_key boolean__of_yojson "ShowAlternatives") _list path);
      channel_identification =
        (option_of_yojson
           (value_for_key boolean__of_yojson "ChannelIdentification") _list
           path);
      max_speaker_labels =
        (option_of_yojson
           (value_for_key max_speakers_of_yojson "MaxSpeakerLabels") _list
           path);
      show_speaker_labels =
        (option_of_yojson
           (value_for_key boolean__of_yojson "ShowSpeakerLabels") _list path);
      vocabulary_name =
        (option_of_yojson
           (value_for_key vocabulary_name_of_yojson "VocabularyName") _list
           path)
    } in
  _res
let job_execution_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : job_execution_settings =
    {
      data_access_role_arn =
        (option_of_yojson
           (value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn")
           _list path);
      allow_deferred_execution =
        (option_of_yojson
           (value_for_key boolean__of_yojson "AllowDeferredExecution") _list
           path)
    } in
  _res
let language_options_of_yojson tree path =
  list_of_yojson language_code_of_yojson tree path
let tag_value_of_yojson = string_of_yojson
let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : tag =
    {
      value = (value_for_key tag_value_of_yojson "Value" _list path);
      key = (value_for_key tag_key_of_yojson "Key" _list path)
    } in
  _res
let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let subtitle_format_of_yojson (tree : t) path =
  (match tree with
   | `String "SRT" -> SRT
   | `String "VTT" -> VTT
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "SubtitleFormat" value)
   | _ -> raise (deserialize_wrong_type_error path "SubtitleFormat") : 
  subtitle_format)
let subtitle_formats_of_yojson tree path =
  list_of_yojson subtitle_format_of_yojson tree path
let subtitle_file_uris_of_yojson tree path =
  list_of_yojson uri_of_yojson tree path
let subtitle_output_start_index_of_yojson = int_of_yojson
let subtitles_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : subtitles_output =
    {
      output_start_index =
        (option_of_yojson
           (value_for_key subtitle_output_start_index_of_yojson
              "OutputStartIndex") _list path);
      subtitle_file_uris =
        (option_of_yojson
           (value_for_key subtitle_file_uris_of_yojson "SubtitleFileUris")
           _list path);
      formats =
        (option_of_yojson
           (value_for_key subtitle_formats_of_yojson "Formats") _list path)
    } in
  _res
let language_id_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : language_id_settings =
    {
      language_model_name =
        (option_of_yojson
           (value_for_key model_name_of_yojson "LanguageModelName") _list
           path);
      vocabulary_filter_name =
        (option_of_yojson
           (value_for_key vocabulary_filter_name_of_yojson
              "VocabularyFilterName") _list path);
      vocabulary_name =
        (option_of_yojson
           (value_for_key vocabulary_name_of_yojson "VocabularyName") _list
           path)
    } in
  _res
let language_id_settings_map_of_yojson tree path =
  map_of_yojson language_code_of_yojson language_id_settings_of_yojson tree
    path
let transcription_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : transcription_job =
    {
      toxicity_detection =
        (option_of_yojson
           (value_for_key toxicity_detection_of_yojson "ToxicityDetection")
           _list path);
      language_id_settings =
        (option_of_yojson
           (value_for_key language_id_settings_map_of_yojson
              "LanguageIdSettings") _list path);
      subtitles =
        (option_of_yojson
           (value_for_key subtitles_output_of_yojson "Subtitles") _list path);
      tags =
        (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list
           path);
      language_codes =
        (option_of_yojson
           (value_for_key language_code_list_of_yojson "LanguageCodes") _list
           path);
      identified_language_score =
        (option_of_yojson
           (value_for_key identified_language_score_of_yojson
              "IdentifiedLanguageScore") _list path);
      language_options =
        (option_of_yojson
           (value_for_key language_options_of_yojson "LanguageOptions") _list
           path);
      identify_multiple_languages =
        (option_of_yojson
           (value_for_key boolean__of_yojson "IdentifyMultipleLanguages")
           _list path);
      identify_language =
        (option_of_yojson
           (value_for_key boolean__of_yojson "IdentifyLanguage") _list path);
      content_redaction =
        (option_of_yojson
           (value_for_key content_redaction_of_yojson "ContentRedaction")
           _list path);
      job_execution_settings =
        (option_of_yojson
           (value_for_key job_execution_settings_of_yojson
              "JobExecutionSettings") _list path);
      model_settings =
        (option_of_yojson
           (value_for_key model_settings_of_yojson "ModelSettings") _list
           path);
      settings =
        (option_of_yojson (value_for_key settings_of_yojson "Settings") _list
           path);
      failure_reason =
        (option_of_yojson
           (value_for_key failure_reason_of_yojson "FailureReason") _list
           path);
      completion_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "CompletionTime") _list path);
      creation_time =
        (option_of_yojson (value_for_key date_time_of_yojson "CreationTime")
           _list path);
      start_time =
        (option_of_yojson (value_for_key date_time_of_yojson "StartTime")
           _list path);
      transcript =
        (option_of_yojson (value_for_key transcript_of_yojson "Transcript")
           _list path);
      media =
        (option_of_yojson (value_for_key media_of_yojson "Media") _list path);
      media_format =
        (option_of_yojson
           (value_for_key media_format_of_yojson "MediaFormat") _list path);
      media_sample_rate_hertz =
        (option_of_yojson
           (value_for_key media_sample_rate_hertz_of_yojson
              "MediaSampleRateHertz") _list path);
      language_code =
        (option_of_yojson
           (value_for_key language_code_of_yojson "LanguageCode") _list path);
      transcription_job_status =
        (option_of_yojson
           (value_for_key transcription_job_status_of_yojson
              "TranscriptionJobStatus") _list path);
      transcription_job_name =
        (option_of_yojson
           (value_for_key transcription_job_name_of_yojson
              "TranscriptionJobName") _list path)
    } in
  _res
let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in let _res : unit = () in _res
let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_request =
    {
      tags = (value_for_key tag_list_of_yojson "Tags" _list path);
      resource_arn =
        (value_for_key transcribe_arn_of_yojson "ResourceArn" _list path)
    } in
  _res
let start_transcription_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : start_transcription_job_response =
    {
      transcription_job =
        (option_of_yojson
           (value_for_key transcription_job_of_yojson "TranscriptionJob")
           _list path)
    } in
  _res
let output_bucket_name_of_yojson = string_of_yojson
let output_key_of_yojson = string_of_yojson
let kms_key_id_of_yojson = string_of_yojson
let kms_encryption_context_map_of_yojson tree path =
  map_of_yojson non_empty_string_of_yojson non_empty_string_of_yojson tree
    path
let subtitles_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : subtitles =
    {
      output_start_index =
        (option_of_yojson
           (value_for_key subtitle_output_start_index_of_yojson
              "OutputStartIndex") _list path);
      formats =
        (option_of_yojson
           (value_for_key subtitle_formats_of_yojson "Formats") _list path)
    } in
  _res
let start_transcription_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : start_transcription_job_request =
    {
      toxicity_detection =
        (option_of_yojson
           (value_for_key toxicity_detection_of_yojson "ToxicityDetection")
           _list path);
      language_id_settings =
        (option_of_yojson
           (value_for_key language_id_settings_map_of_yojson
              "LanguageIdSettings") _list path);
      tags =
        (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list
           path);
      subtitles =
        (option_of_yojson (value_for_key subtitles_of_yojson "Subtitles")
           _list path);
      language_options =
        (option_of_yojson
           (value_for_key language_options_of_yojson "LanguageOptions") _list
           path);
      identify_multiple_languages =
        (option_of_yojson
           (value_for_key boolean__of_yojson "IdentifyMultipleLanguages")
           _list path);
      identify_language =
        (option_of_yojson
           (value_for_key boolean__of_yojson "IdentifyLanguage") _list path);
      content_redaction =
        (option_of_yojson
           (value_for_key content_redaction_of_yojson "ContentRedaction")
           _list path);
      job_execution_settings =
        (option_of_yojson
           (value_for_key job_execution_settings_of_yojson
              "JobExecutionSettings") _list path);
      model_settings =
        (option_of_yojson
           (value_for_key model_settings_of_yojson "ModelSettings") _list
           path);
      settings =
        (option_of_yojson (value_for_key settings_of_yojson "Settings") _list
           path);
      kms_encryption_context =
        (option_of_yojson
           (value_for_key kms_encryption_context_map_of_yojson
              "KMSEncryptionContext") _list path);
      output_encryption_kms_key_id =
        (option_of_yojson
           (value_for_key kms_key_id_of_yojson "OutputEncryptionKMSKeyId")
           _list path);
      output_key =
        (option_of_yojson (value_for_key output_key_of_yojson "OutputKey")
           _list path);
      output_bucket_name =
        (option_of_yojson
           (value_for_key output_bucket_name_of_yojson "OutputBucketName")
           _list path);
      media = (value_for_key media_of_yojson "Media" _list path);
      media_format =
        (option_of_yojson
           (value_for_key media_format_of_yojson "MediaFormat") _list path);
      media_sample_rate_hertz =
        (option_of_yojson
           (value_for_key media_sample_rate_hertz_of_yojson
              "MediaSampleRateHertz") _list path);
      language_code =
        (option_of_yojson
           (value_for_key language_code_of_yojson "LanguageCode") _list path);
      transcription_job_name =
        (value_for_key transcription_job_name_of_yojson
           "TranscriptionJobName" _list path)
    } in
  _res
let medical_media_sample_rate_hertz_of_yojson = int_of_yojson
let medical_transcript_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : medical_transcript =
    {
      transcript_file_uri =
        (option_of_yojson (value_for_key uri_of_yojson "TranscriptFileUri")
           _list path)
    } in
  _res
let medical_transcription_setting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : medical_transcription_setting =
    {
      vocabulary_name =
        (option_of_yojson
           (value_for_key vocabulary_name_of_yojson "VocabularyName") _list
           path);
      max_alternatives =
        (option_of_yojson
           (value_for_key max_alternatives_of_yojson "MaxAlternatives") _list
           path);
      show_alternatives =
        (option_of_yojson
           (value_for_key boolean__of_yojson "ShowAlternatives") _list path);
      channel_identification =
        (option_of_yojson
           (value_for_key boolean__of_yojson "ChannelIdentification") _list
           path);
      max_speaker_labels =
        (option_of_yojson
           (value_for_key max_speakers_of_yojson "MaxSpeakerLabels") _list
           path);
      show_speaker_labels =
        (option_of_yojson
           (value_for_key boolean__of_yojson "ShowSpeakerLabels") _list path)
    } in
  _res
let medical_content_identification_type_of_yojson (tree : t) path =
  (match tree with
   | `String "PHI" -> PHI
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "MedicalContentIdentificationType" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path
            "MedicalContentIdentificationType") : medical_content_identification_type)
let specialty_of_yojson (tree : t) path =
  (match tree with
   | `String "PRIMARYCARE" -> PRIMARYCARE
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "Specialty" value)
   | _ -> raise (deserialize_wrong_type_error path "Specialty") : specialty)
let medical_transcription_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : medical_transcription_job =
    {
      tags =
        (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list
           path);
      type_ =
        (option_of_yojson (value_for_key type__of_yojson "Type") _list path);
      specialty =
        (option_of_yojson (value_for_key specialty_of_yojson "Specialty")
           _list path);
      content_identification_type =
        (option_of_yojson
           (value_for_key medical_content_identification_type_of_yojson
              "ContentIdentificationType") _list path);
      settings =
        (option_of_yojson
           (value_for_key medical_transcription_setting_of_yojson "Settings")
           _list path);
      failure_reason =
        (option_of_yojson
           (value_for_key failure_reason_of_yojson "FailureReason") _list
           path);
      completion_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "CompletionTime") _list path);
      creation_time =
        (option_of_yojson (value_for_key date_time_of_yojson "CreationTime")
           _list path);
      start_time =
        (option_of_yojson (value_for_key date_time_of_yojson "StartTime")
           _list path);
      transcript =
        (option_of_yojson
           (value_for_key medical_transcript_of_yojson "Transcript") _list
           path);
      media =
        (option_of_yojson (value_for_key media_of_yojson "Media") _list path);
      media_format =
        (option_of_yojson
           (value_for_key media_format_of_yojson "MediaFormat") _list path);
      media_sample_rate_hertz =
        (option_of_yojson
           (value_for_key medical_media_sample_rate_hertz_of_yojson
              "MediaSampleRateHertz") _list path);
      language_code =
        (option_of_yojson
           (value_for_key language_code_of_yojson "LanguageCode") _list path);
      transcription_job_status =
        (option_of_yojson
           (value_for_key transcription_job_status_of_yojson
              "TranscriptionJobStatus") _list path);
      medical_transcription_job_name =
        (option_of_yojson
           (value_for_key transcription_job_name_of_yojson
              "MedicalTranscriptionJobName") _list path)
    } in
  _res
let start_medical_transcription_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : start_medical_transcription_job_response =
    {
      medical_transcription_job =
        (option_of_yojson
           (value_for_key medical_transcription_job_of_yojson
              "MedicalTranscriptionJob") _list path)
    } in
  _res
let start_medical_transcription_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : start_medical_transcription_job_request =
    {
      tags =
        (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list
           path);
      type_ = (value_for_key type__of_yojson "Type" _list path);
      specialty = (value_for_key specialty_of_yojson "Specialty" _list path);
      content_identification_type =
        (option_of_yojson
           (value_for_key medical_content_identification_type_of_yojson
              "ContentIdentificationType") _list path);
      settings =
        (option_of_yojson
           (value_for_key medical_transcription_setting_of_yojson "Settings")
           _list path);
      kms_encryption_context =
        (option_of_yojson
           (value_for_key kms_encryption_context_map_of_yojson
              "KMSEncryptionContext") _list path);
      output_encryption_kms_key_id =
        (option_of_yojson
           (value_for_key kms_key_id_of_yojson "OutputEncryptionKMSKeyId")
           _list path);
      output_key =
        (option_of_yojson (value_for_key output_key_of_yojson "OutputKey")
           _list path);
      output_bucket_name =
        (value_for_key output_bucket_name_of_yojson "OutputBucketName" _list
           path);
      media = (value_for_key media_of_yojson "Media" _list path);
      media_format =
        (option_of_yojson
           (value_for_key media_format_of_yojson "MediaFormat") _list path);
      media_sample_rate_hertz =
        (option_of_yojson
           (value_for_key medical_media_sample_rate_hertz_of_yojson
              "MediaSampleRateHertz") _list path);
      language_code =
        (value_for_key language_code_of_yojson "LanguageCode" _list path);
      medical_transcription_job_name =
        (value_for_key transcription_job_name_of_yojson
           "MedicalTranscriptionJobName" _list path)
    } in
  _res
let medical_scribe_job_status_of_yojson (tree : t) path =
  (match tree with
   | `String "COMPLETED" -> COMPLETED
   | `String "FAILED" -> FAILED
   | `String "IN_PROGRESS" -> IN_PROGRESS
   | `String "QUEUED" -> QUEUED
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "MedicalScribeJobStatus"
            value)
   | _ -> raise (deserialize_wrong_type_error path "MedicalScribeJobStatus") : 
  medical_scribe_job_status)
let medical_scribe_language_code_of_yojson (tree : t) path =
  (match tree with
   | `String "EN_US" -> EN_US
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "MedicalScribeLanguageCode" value)
   | _ ->
       raise (deserialize_wrong_type_error path "MedicalScribeLanguageCode") : 
  medical_scribe_language_code)
let medical_scribe_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : medical_scribe_output =
    {
      clinical_document_uri =
        (value_for_key uri_of_yojson "ClinicalDocumentUri" _list path);
      transcript_file_uri =
        (value_for_key uri_of_yojson "TranscriptFileUri" _list path)
    } in
  _res
let medical_scribe_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : medical_scribe_settings =
    {
      vocabulary_filter_method =
        (option_of_yojson
           (value_for_key vocabulary_filter_method_of_yojson
              "VocabularyFilterMethod") _list path);
      vocabulary_filter_name =
        (option_of_yojson
           (value_for_key vocabulary_filter_name_of_yojson
              "VocabularyFilterName") _list path);
      vocabulary_name =
        (option_of_yojson
           (value_for_key vocabulary_name_of_yojson "VocabularyName") _list
           path);
      channel_identification =
        (option_of_yojson
           (value_for_key boolean__of_yojson "ChannelIdentification") _list
           path);
      max_speaker_labels =
        (option_of_yojson
           (value_for_key max_speakers_of_yojson "MaxSpeakerLabels") _list
           path);
      show_speaker_labels =
        (option_of_yojson
           (value_for_key boolean__of_yojson "ShowSpeakerLabels") _list path)
    } in
  _res
let medical_scribe_channel_id_of_yojson = int_of_yojson
let medical_scribe_participant_role_of_yojson (tree : t) path =
  (match tree with
   | `String "CLINICIAN" -> CLINICIAN
   | `String "PATIENT" -> PATIENT
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "MedicalScribeParticipantRole" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path "MedicalScribeParticipantRole") : 
  medical_scribe_participant_role)
let medical_scribe_channel_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : medical_scribe_channel_definition =
    {
      participant_role =
        (value_for_key medical_scribe_participant_role_of_yojson
           "ParticipantRole" _list path);
      channel_id =
        (value_for_key medical_scribe_channel_id_of_yojson "ChannelId" _list
           path)
    } in
  _res
let medical_scribe_channel_definitions_of_yojson tree path =
  list_of_yojson medical_scribe_channel_definition_of_yojson tree path
let medical_scribe_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : medical_scribe_job =
    {
      tags =
        (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list
           path);
      channel_definitions =
        (option_of_yojson
           (value_for_key medical_scribe_channel_definitions_of_yojson
              "ChannelDefinitions") _list path);
      data_access_role_arn =
        (option_of_yojson
           (value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn")
           _list path);
      settings =
        (option_of_yojson
           (value_for_key medical_scribe_settings_of_yojson "Settings") _list
           path);
      failure_reason =
        (option_of_yojson
           (value_for_key failure_reason_of_yojson "FailureReason") _list
           path);
      completion_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "CompletionTime") _list path);
      creation_time =
        (option_of_yojson (value_for_key date_time_of_yojson "CreationTime")
           _list path);
      start_time =
        (option_of_yojson (value_for_key date_time_of_yojson "StartTime")
           _list path);
      medical_scribe_output =
        (option_of_yojson
           (value_for_key medical_scribe_output_of_yojson
              "MedicalScribeOutput") _list path);
      media =
        (option_of_yojson (value_for_key media_of_yojson "Media") _list path);
      language_code =
        (option_of_yojson
           (value_for_key medical_scribe_language_code_of_yojson
              "LanguageCode") _list path);
      medical_scribe_job_status =
        (option_of_yojson
           (value_for_key medical_scribe_job_status_of_yojson
              "MedicalScribeJobStatus") _list path);
      medical_scribe_job_name =
        (option_of_yojson
           (value_for_key transcription_job_name_of_yojson
              "MedicalScribeJobName") _list path)
    } in
  _res
let start_medical_scribe_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : start_medical_scribe_job_response =
    {
      medical_scribe_job =
        (option_of_yojson
           (value_for_key medical_scribe_job_of_yojson "MedicalScribeJob")
           _list path)
    } in
  _res
let start_medical_scribe_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : start_medical_scribe_job_request =
    {
      tags =
        (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list
           path);
      channel_definitions =
        (option_of_yojson
           (value_for_key medical_scribe_channel_definitions_of_yojson
              "ChannelDefinitions") _list path);
      settings =
        (value_for_key medical_scribe_settings_of_yojson "Settings" _list
           path);
      data_access_role_arn =
        (value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn"
           _list path);
      kms_encryption_context =
        (option_of_yojson
           (value_for_key kms_encryption_context_map_of_yojson
              "KMSEncryptionContext") _list path);
      output_encryption_kms_key_id =
        (option_of_yojson
           (value_for_key kms_key_id_of_yojson "OutputEncryptionKMSKeyId")
           _list path);
      output_bucket_name =
        (value_for_key output_bucket_name_of_yojson "OutputBucketName" _list
           path);
      media = (value_for_key media_of_yojson "Media" _list path);
      medical_scribe_job_name =
        (value_for_key transcription_job_name_of_yojson
           "MedicalScribeJobName" _list path)
    } in
  _res
let call_analytics_job_name_of_yojson = string_of_yojson
let call_analytics_job_status_of_yojson (tree : t) path =
  (match tree with
   | `String "COMPLETED" -> COMPLETED
   | `String "FAILED" -> FAILED
   | `String "IN_PROGRESS" -> IN_PROGRESS
   | `String "QUEUED" -> QUEUED
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "CallAnalyticsJobStatus"
            value)
   | _ -> raise (deserialize_wrong_type_error path "CallAnalyticsJobStatus") : 
  call_analytics_job_status)
let call_analytics_feature_of_yojson (tree : t) path =
  (match tree with
   | `String "GENERATIVE_SUMMARIZATION" -> GENERATIVE_SUMMARIZATION
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "CallAnalyticsFeature"
            value)
   | _ -> raise (deserialize_wrong_type_error path "CallAnalyticsFeature") : 
  call_analytics_feature)
let call_analytics_skipped_reason_code_of_yojson (tree : t) path =
  (match tree with
   | `String "FAILED_SAFETY_GUIDELINES" -> FAILED_SAFETY_GUIDELINES
   | `String "INSUFFICIENT_CONVERSATION_CONTENT" ->
       INSUFFICIENT_CONVERSATION_CONTENT
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "CallAnalyticsSkippedReasonCode" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path "CallAnalyticsSkippedReasonCode") : 
  call_analytics_skipped_reason_code)
let call_analytics_skipped_feature_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : call_analytics_skipped_feature =
    {
      message =
        (option_of_yojson (value_for_key string__of_yojson "Message") _list
           path);
      reason_code =
        (option_of_yojson
           (value_for_key call_analytics_skipped_reason_code_of_yojson
              "ReasonCode") _list path);
      feature =
        (option_of_yojson
           (value_for_key call_analytics_feature_of_yojson "Feature") _list
           path)
    } in
  _res
let call_analytics_skipped_feature_list_of_yojson tree path =
  list_of_yojson call_analytics_skipped_feature_of_yojson tree path
let call_analytics_job_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : call_analytics_job_details =
    {
      skipped =
        (option_of_yojson
           (value_for_key call_analytics_skipped_feature_list_of_yojson
              "Skipped") _list path)
    } in
  _res
let summarization_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : summarization =
    {
      generate_abstractive_summary =
        (value_for_key boolean__of_yojson "GenerateAbstractiveSummary" _list
           path)
    } in
  _res
let call_analytics_job_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : call_analytics_job_settings =
    {
      summarization =
        (option_of_yojson
           (value_for_key summarization_of_yojson "Summarization") _list path);
      language_id_settings =
        (option_of_yojson
           (value_for_key language_id_settings_map_of_yojson
              "LanguageIdSettings") _list path);
      language_options =
        (option_of_yojson
           (value_for_key language_options_of_yojson "LanguageOptions") _list
           path);
      content_redaction =
        (option_of_yojson
           (value_for_key content_redaction_of_yojson "ContentRedaction")
           _list path);
      language_model_name =
        (option_of_yojson
           (value_for_key model_name_of_yojson "LanguageModelName") _list
           path);
      vocabulary_filter_method =
        (option_of_yojson
           (value_for_key vocabulary_filter_method_of_yojson
              "VocabularyFilterMethod") _list path);
      vocabulary_filter_name =
        (option_of_yojson
           (value_for_key vocabulary_filter_name_of_yojson
              "VocabularyFilterName") _list path);
      vocabulary_name =
        (option_of_yojson
           (value_for_key vocabulary_name_of_yojson "VocabularyName") _list
           path)
    } in
  _res
let channel_id_of_yojson = int_of_yojson
let channel_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : channel_definition =
    {
      participant_role =
        (option_of_yojson
           (value_for_key participant_role_of_yojson "ParticipantRole") _list
           path);
      channel_id =
        (option_of_yojson (value_for_key channel_id_of_yojson "ChannelId")
           _list path)
    } in
  _res
let channel_definitions_of_yojson tree path =
  list_of_yojson channel_definition_of_yojson tree path
let call_analytics_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : call_analytics_job =
    {
      channel_definitions =
        (option_of_yojson
           (value_for_key channel_definitions_of_yojson "ChannelDefinitions")
           _list path);
      settings =
        (option_of_yojson
           (value_for_key call_analytics_job_settings_of_yojson "Settings")
           _list path);
      identified_language_score =
        (option_of_yojson
           (value_for_key identified_language_score_of_yojson
              "IdentifiedLanguageScore") _list path);
      data_access_role_arn =
        (option_of_yojson
           (value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn")
           _list path);
      failure_reason =
        (option_of_yojson
           (value_for_key failure_reason_of_yojson "FailureReason") _list
           path);
      completion_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "CompletionTime") _list path);
      creation_time =
        (option_of_yojson (value_for_key date_time_of_yojson "CreationTime")
           _list path);
      start_time =
        (option_of_yojson (value_for_key date_time_of_yojson "StartTime")
           _list path);
      transcript =
        (option_of_yojson (value_for_key transcript_of_yojson "Transcript")
           _list path);
      media =
        (option_of_yojson (value_for_key media_of_yojson "Media") _list path);
      media_format =
        (option_of_yojson
           (value_for_key media_format_of_yojson "MediaFormat") _list path);
      media_sample_rate_hertz =
        (option_of_yojson
           (value_for_key media_sample_rate_hertz_of_yojson
              "MediaSampleRateHertz") _list path);
      language_code =
        (option_of_yojson
           (value_for_key language_code_of_yojson "LanguageCode") _list path);
      call_analytics_job_details =
        (option_of_yojson
           (value_for_key call_analytics_job_details_of_yojson
              "CallAnalyticsJobDetails") _list path);
      call_analytics_job_status =
        (option_of_yojson
           (value_for_key call_analytics_job_status_of_yojson
              "CallAnalyticsJobStatus") _list path);
      call_analytics_job_name =
        (option_of_yojson
           (value_for_key call_analytics_job_name_of_yojson
              "CallAnalyticsJobName") _list path)
    } in
  _res
let start_call_analytics_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : start_call_analytics_job_response =
    {
      call_analytics_job =
        (option_of_yojson
           (value_for_key call_analytics_job_of_yojson "CallAnalyticsJob")
           _list path)
    } in
  _res
let start_call_analytics_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : start_call_analytics_job_request =
    {
      channel_definitions =
        (option_of_yojson
           (value_for_key channel_definitions_of_yojson "ChannelDefinitions")
           _list path);
      settings =
        (option_of_yojson
           (value_for_key call_analytics_job_settings_of_yojson "Settings")
           _list path);
      data_access_role_arn =
        (option_of_yojson
           (value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn")
           _list path);
      output_encryption_kms_key_id =
        (option_of_yojson
           (value_for_key kms_key_id_of_yojson "OutputEncryptionKMSKeyId")
           _list path);
      output_location =
        (option_of_yojson (value_for_key uri_of_yojson "OutputLocation")
           _list path);
      media = (value_for_key media_of_yojson "Media" _list path);
      call_analytics_job_name =
        (value_for_key call_analytics_job_name_of_yojson
           "CallAnalyticsJobName" _list path)
    } in
  _res
let next_token_of_yojson = string_of_yojson
let list_vocabulary_filters_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_vocabulary_filters_response =
    {
      vocabulary_filters =
        (option_of_yojson
           (value_for_key vocabulary_filters_of_yojson "VocabularyFilters")
           _list path);
      next_token =
        (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
           _list path)
    } in
  _res
let max_results_of_yojson = int_of_yojson
let list_vocabulary_filters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_vocabulary_filters_request =
    {
      name_contains =
        (option_of_yojson
           (value_for_key vocabulary_filter_name_of_yojson "NameContains")
           _list path);
      max_results =
        (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
           _list path);
      next_token =
        (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
           _list path)
    } in
  _res
let list_vocabularies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_vocabularies_response =
    {
      vocabularies =
        (option_of_yojson
           (value_for_key vocabularies_of_yojson "Vocabularies") _list path);
      next_token =
        (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
           _list path);
      status =
        (option_of_yojson (value_for_key vocabulary_state_of_yojson "Status")
           _list path)
    } in
  _res
let list_vocabularies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_vocabularies_request =
    {
      name_contains =
        (option_of_yojson
           (value_for_key vocabulary_name_of_yojson "NameContains") _list
           path);
      state_equals =
        (option_of_yojson
           (value_for_key vocabulary_state_of_yojson "StateEquals") _list
           path);
      max_results =
        (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
           _list path);
      next_token =
        (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
           _list path)
    } in
  _res
let list_transcription_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_transcription_jobs_response =
    {
      transcription_job_summaries =
        (option_of_yojson
           (value_for_key transcription_job_summaries_of_yojson
              "TranscriptionJobSummaries") _list path);
      next_token =
        (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
           _list path);
      status =
        (option_of_yojson
           (value_for_key transcription_job_status_of_yojson "Status") _list
           path)
    } in
  _res
let list_transcription_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_transcription_jobs_request =
    {
      max_results =
        (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
           _list path);
      next_token =
        (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
           _list path);
      job_name_contains =
        (option_of_yojson
           (value_for_key transcription_job_name_of_yojson "JobNameContains")
           _list path);
      status =
        (option_of_yojson
           (value_for_key transcription_job_status_of_yojson "Status") _list
           path)
    } in
  _res
let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_response =
    {
      tags =
        (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list
           path);
      resource_arn =
        (option_of_yojson
           (value_for_key transcribe_arn_of_yojson "ResourceArn") _list path)
    } in
  _res
let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_request =
    {
      resource_arn =
        (value_for_key transcribe_arn_of_yojson "ResourceArn" _list path)
    } in
  _res
let list_medical_vocabularies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_medical_vocabularies_response =
    {
      vocabularies =
        (option_of_yojson
           (value_for_key vocabularies_of_yojson "Vocabularies") _list path);
      next_token =
        (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
           _list path);
      status =
        (option_of_yojson (value_for_key vocabulary_state_of_yojson "Status")
           _list path)
    } in
  _res
let list_medical_vocabularies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_medical_vocabularies_request =
    {
      name_contains =
        (option_of_yojson
           (value_for_key vocabulary_name_of_yojson "NameContains") _list
           path);
      state_equals =
        (option_of_yojson
           (value_for_key vocabulary_state_of_yojson "StateEquals") _list
           path);
      max_results =
        (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
           _list path);
      next_token =
        (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
           _list path)
    } in
  _res
let medical_transcription_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : medical_transcription_job_summary =
    {
      type_ =
        (option_of_yojson (value_for_key type__of_yojson "Type") _list path);
      content_identification_type =
        (option_of_yojson
           (value_for_key medical_content_identification_type_of_yojson
              "ContentIdentificationType") _list path);
      specialty =
        (option_of_yojson (value_for_key specialty_of_yojson "Specialty")
           _list path);
      output_location_type =
        (option_of_yojson
           (value_for_key output_location_type_of_yojson "OutputLocationType")
           _list path);
      failure_reason =
        (option_of_yojson
           (value_for_key failure_reason_of_yojson "FailureReason") _list
           path);
      transcription_job_status =
        (option_of_yojson
           (value_for_key transcription_job_status_of_yojson
              "TranscriptionJobStatus") _list path);
      language_code =
        (option_of_yojson
           (value_for_key language_code_of_yojson "LanguageCode") _list path);
      completion_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "CompletionTime") _list path);
      start_time =
        (option_of_yojson (value_for_key date_time_of_yojson "StartTime")
           _list path);
      creation_time =
        (option_of_yojson (value_for_key date_time_of_yojson "CreationTime")
           _list path);
      medical_transcription_job_name =
        (option_of_yojson
           (value_for_key transcription_job_name_of_yojson
              "MedicalTranscriptionJobName") _list path)
    } in
  _res
let medical_transcription_job_summaries_of_yojson tree path =
  list_of_yojson medical_transcription_job_summary_of_yojson tree path
let list_medical_transcription_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_medical_transcription_jobs_response =
    {
      medical_transcription_job_summaries =
        (option_of_yojson
           (value_for_key medical_transcription_job_summaries_of_yojson
              "MedicalTranscriptionJobSummaries") _list path);
      next_token =
        (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
           _list path);
      status =
        (option_of_yojson
           (value_for_key transcription_job_status_of_yojson "Status") _list
           path)
    } in
  _res
let list_medical_transcription_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_medical_transcription_jobs_request =
    {
      max_results =
        (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
           _list path);
      next_token =
        (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
           _list path);
      job_name_contains =
        (option_of_yojson
           (value_for_key transcription_job_name_of_yojson "JobNameContains")
           _list path);
      status =
        (option_of_yojson
           (value_for_key transcription_job_status_of_yojson "Status") _list
           path)
    } in
  _res
let medical_scribe_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : medical_scribe_job_summary =
    {
      failure_reason =
        (option_of_yojson
           (value_for_key failure_reason_of_yojson "FailureReason") _list
           path);
      medical_scribe_job_status =
        (option_of_yojson
           (value_for_key medical_scribe_job_status_of_yojson
              "MedicalScribeJobStatus") _list path);
      language_code =
        (option_of_yojson
           (value_for_key medical_scribe_language_code_of_yojson
              "LanguageCode") _list path);
      completion_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "CompletionTime") _list path);
      start_time =
        (option_of_yojson (value_for_key date_time_of_yojson "StartTime")
           _list path);
      creation_time =
        (option_of_yojson (value_for_key date_time_of_yojson "CreationTime")
           _list path);
      medical_scribe_job_name =
        (option_of_yojson
           (value_for_key transcription_job_name_of_yojson
              "MedicalScribeJobName") _list path)
    } in
  _res
let medical_scribe_job_summaries_of_yojson tree path =
  list_of_yojson medical_scribe_job_summary_of_yojson tree path
let list_medical_scribe_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_medical_scribe_jobs_response =
    {
      medical_scribe_job_summaries =
        (option_of_yojson
           (value_for_key medical_scribe_job_summaries_of_yojson
              "MedicalScribeJobSummaries") _list path);
      next_token =
        (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
           _list path);
      status =
        (option_of_yojson
           (value_for_key medical_scribe_job_status_of_yojson "Status") _list
           path)
    } in
  _res
let list_medical_scribe_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_medical_scribe_jobs_request =
    {
      max_results =
        (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
           _list path);
      next_token =
        (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
           _list path);
      job_name_contains =
        (option_of_yojson
           (value_for_key transcription_job_name_of_yojson "JobNameContains")
           _list path);
      status =
        (option_of_yojson
           (value_for_key medical_scribe_job_status_of_yojson "Status") _list
           path)
    } in
  _res
let clm_language_code_of_yojson (tree : t) path =
  (match tree with
   | `String "JA_JP" -> JA_JP
   | `String "DE_DE" -> DE_DE
   | `String "EN_AU" -> EN_AU
   | `String "EN_GB" -> EN_GB
   | `String "ES_US" -> ES_US
   | `String "HI_IN" -> HI_IN
   | `String "EN_US" -> EN_US
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "CLMLanguageCode" value)
   | _ -> raise (deserialize_wrong_type_error path "CLMLanguageCode") : 
  clm_language_code)
let base_model_name_of_yojson (tree : t) path =
  (match tree with
   | `String "WIDE_BAND" -> WIDE_BAND
   | `String "NARROW_BAND" -> NARROW_BAND
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "BaseModelName" value)
   | _ -> raise (deserialize_wrong_type_error path "BaseModelName") : 
  base_model_name)
let model_status_of_yojson (tree : t) path =
  (match tree with
   | `String "COMPLETED" -> COMPLETED
   | `String "FAILED" -> FAILED
   | `String "IN_PROGRESS" -> IN_PROGRESS
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "ModelStatus" value)
   | _ -> raise (deserialize_wrong_type_error path "ModelStatus") : model_status)
let input_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : input_data_config =
    {
      data_access_role_arn =
        (value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn"
           _list path);
      tuning_data_s3_uri =
        (option_of_yojson (value_for_key uri_of_yojson "TuningDataS3Uri")
           _list path);
      s3_uri = (value_for_key uri_of_yojson "S3Uri" _list path)
    } in
  _res
let language_model_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : language_model =
    {
      input_data_config =
        (option_of_yojson
           (value_for_key input_data_config_of_yojson "InputDataConfig")
           _list path);
      failure_reason =
        (option_of_yojson
           (value_for_key failure_reason_of_yojson "FailureReason") _list
           path);
      upgrade_availability =
        (option_of_yojson
           (value_for_key boolean__of_yojson "UpgradeAvailability") _list
           path);
      model_status =
        (option_of_yojson
           (value_for_key model_status_of_yojson "ModelStatus") _list path);
      base_model_name =
        (option_of_yojson
           (value_for_key base_model_name_of_yojson "BaseModelName") _list
           path);
      language_code =
        (option_of_yojson
           (value_for_key clm_language_code_of_yojson "LanguageCode") _list
           path);
      last_modified_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "LastModifiedTime") _list path);
      create_time =
        (option_of_yojson (value_for_key date_time_of_yojson "CreateTime")
           _list path);
      model_name =
        (option_of_yojson (value_for_key model_name_of_yojson "ModelName")
           _list path)
    } in
  _res
let models_of_yojson tree path =
  list_of_yojson language_model_of_yojson tree path
let list_language_models_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_language_models_response =
    {
      models =
        (option_of_yojson (value_for_key models_of_yojson "Models") _list
           path);
      next_token =
        (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
           _list path)
    } in
  _res
let list_language_models_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_language_models_request =
    {
      max_results =
        (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
           _list path);
      next_token =
        (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
           _list path);
      name_contains =
        (option_of_yojson (value_for_key model_name_of_yojson "NameContains")
           _list path);
      status_equals =
        (option_of_yojson
           (value_for_key model_status_of_yojson "StatusEquals") _list path)
    } in
  _res
let call_analytics_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : call_analytics_job_summary =
    {
      failure_reason =
        (option_of_yojson
           (value_for_key failure_reason_of_yojson "FailureReason") _list
           path);
      call_analytics_job_details =
        (option_of_yojson
           (value_for_key call_analytics_job_details_of_yojson
              "CallAnalyticsJobDetails") _list path);
      call_analytics_job_status =
        (option_of_yojson
           (value_for_key call_analytics_job_status_of_yojson
              "CallAnalyticsJobStatus") _list path);
      language_code =
        (option_of_yojson
           (value_for_key language_code_of_yojson "LanguageCode") _list path);
      completion_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "CompletionTime") _list path);
      start_time =
        (option_of_yojson (value_for_key date_time_of_yojson "StartTime")
           _list path);
      creation_time =
        (option_of_yojson (value_for_key date_time_of_yojson "CreationTime")
           _list path);
      call_analytics_job_name =
        (option_of_yojson
           (value_for_key call_analytics_job_name_of_yojson
              "CallAnalyticsJobName") _list path)
    } in
  _res
let call_analytics_job_summaries_of_yojson tree path =
  list_of_yojson call_analytics_job_summary_of_yojson tree path
let list_call_analytics_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_call_analytics_jobs_response =
    {
      call_analytics_job_summaries =
        (option_of_yojson
           (value_for_key call_analytics_job_summaries_of_yojson
              "CallAnalyticsJobSummaries") _list path);
      next_token =
        (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
           _list path);
      status =
        (option_of_yojson
           (value_for_key call_analytics_job_status_of_yojson "Status") _list
           path)
    } in
  _res
let list_call_analytics_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_call_analytics_jobs_request =
    {
      max_results =
        (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
           _list path);
      next_token =
        (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
           _list path);
      job_name_contains =
        (option_of_yojson
           (value_for_key call_analytics_job_name_of_yojson "JobNameContains")
           _list path);
      status =
        (option_of_yojson
           (value_for_key call_analytics_job_status_of_yojson "Status") _list
           path)
    } in
  _res
let category_properties_list_of_yojson tree path =
  list_of_yojson category_properties_of_yojson tree path
let list_call_analytics_categories_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_call_analytics_categories_response =
    {
      categories =
        (option_of_yojson
           (value_for_key category_properties_list_of_yojson "Categories")
           _list path);
      next_token =
        (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
           _list path)
    } in
  _res
let list_call_analytics_categories_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : list_call_analytics_categories_request =
    {
      max_results =
        (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
           _list path);
      next_token =
        (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
           _list path)
    } in
  _res
let get_vocabulary_filter_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : get_vocabulary_filter_response =
    {
      download_uri =
        (option_of_yojson (value_for_key uri_of_yojson "DownloadUri") _list
           path);
      last_modified_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "LastModifiedTime") _list path);
      language_code =
        (option_of_yojson
           (value_for_key language_code_of_yojson "LanguageCode") _list path);
      vocabulary_filter_name =
        (option_of_yojson
           (value_for_key vocabulary_filter_name_of_yojson
              "VocabularyFilterName") _list path)
    } in
  _res
let get_vocabulary_filter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : get_vocabulary_filter_request =
    {
      vocabulary_filter_name =
        (value_for_key vocabulary_filter_name_of_yojson
           "VocabularyFilterName" _list path)
    } in
  _res
let get_vocabulary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : get_vocabulary_response =
    {
      download_uri =
        (option_of_yojson (value_for_key uri_of_yojson "DownloadUri") _list
           path);
      failure_reason =
        (option_of_yojson
           (value_for_key failure_reason_of_yojson "FailureReason") _list
           path);
      last_modified_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "LastModifiedTime") _list path);
      vocabulary_state =
        (option_of_yojson
           (value_for_key vocabulary_state_of_yojson "VocabularyState") _list
           path);
      language_code =
        (option_of_yojson
           (value_for_key language_code_of_yojson "LanguageCode") _list path);
      vocabulary_name =
        (option_of_yojson
           (value_for_key vocabulary_name_of_yojson "VocabularyName") _list
           path)
    } in
  _res
let get_vocabulary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : get_vocabulary_request =
    {
      vocabulary_name =
        (value_for_key vocabulary_name_of_yojson "VocabularyName" _list path)
    } in
  _res
let get_transcription_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : get_transcription_job_response =
    {
      transcription_job =
        (option_of_yojson
           (value_for_key transcription_job_of_yojson "TranscriptionJob")
           _list path)
    } in
  _res
let get_transcription_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : get_transcription_job_request =
    {
      transcription_job_name =
        (value_for_key transcription_job_name_of_yojson
           "TranscriptionJobName" _list path)
    } in
  _res
let get_medical_vocabulary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : get_medical_vocabulary_response =
    {
      download_uri =
        (option_of_yojson (value_for_key uri_of_yojson "DownloadUri") _list
           path);
      failure_reason =
        (option_of_yojson
           (value_for_key failure_reason_of_yojson "FailureReason") _list
           path);
      last_modified_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "LastModifiedTime") _list path);
      vocabulary_state =
        (option_of_yojson
           (value_for_key vocabulary_state_of_yojson "VocabularyState") _list
           path);
      language_code =
        (option_of_yojson
           (value_for_key language_code_of_yojson "LanguageCode") _list path);
      vocabulary_name =
        (option_of_yojson
           (value_for_key vocabulary_name_of_yojson "VocabularyName") _list
           path)
    } in
  _res
let get_medical_vocabulary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : get_medical_vocabulary_request =
    {
      vocabulary_name =
        (value_for_key vocabulary_name_of_yojson "VocabularyName" _list path)
    } in
  _res
let get_medical_transcription_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : get_medical_transcription_job_response =
    {
      medical_transcription_job =
        (option_of_yojson
           (value_for_key medical_transcription_job_of_yojson
              "MedicalTranscriptionJob") _list path)
    } in
  _res
let get_medical_transcription_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : get_medical_transcription_job_request =
    {
      medical_transcription_job_name =
        (value_for_key transcription_job_name_of_yojson
           "MedicalTranscriptionJobName" _list path)
    } in
  _res
let get_medical_scribe_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : get_medical_scribe_job_response =
    {
      medical_scribe_job =
        (option_of_yojson
           (value_for_key medical_scribe_job_of_yojson "MedicalScribeJob")
           _list path)
    } in
  _res
let get_medical_scribe_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : get_medical_scribe_job_request =
    {
      medical_scribe_job_name =
        (value_for_key transcription_job_name_of_yojson
           "MedicalScribeJobName" _list path)
    } in
  _res
let get_call_analytics_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : get_call_analytics_job_response =
    {
      call_analytics_job =
        (option_of_yojson
           (value_for_key call_analytics_job_of_yojson "CallAnalyticsJob")
           _list path)
    } in
  _res
let get_call_analytics_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : get_call_analytics_job_request =
    {
      call_analytics_job_name =
        (value_for_key call_analytics_job_name_of_yojson
           "CallAnalyticsJobName" _list path)
    } in
  _res
let get_call_analytics_category_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : get_call_analytics_category_response =
    {
      category_properties =
        (option_of_yojson
           (value_for_key category_properties_of_yojson "CategoryProperties")
           _list path)
    } in
  _res
let get_call_analytics_category_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : get_call_analytics_category_request =
    {
      category_name =
        (value_for_key category_name_of_yojson "CategoryName" _list path)
    } in
  _res
let describe_language_model_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : describe_language_model_response =
    {
      language_model =
        (option_of_yojson
           (value_for_key language_model_of_yojson "LanguageModel") _list
           path)
    } in
  _res
let describe_language_model_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : describe_language_model_request =
    {
      model_name =
        (value_for_key model_name_of_yojson "ModelName" _list path)
    } in
  _res
let delete_vocabulary_filter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : delete_vocabulary_filter_request =
    {
      vocabulary_filter_name =
        (value_for_key vocabulary_filter_name_of_yojson
           "VocabularyFilterName" _list path)
    } in
  _res
let delete_vocabulary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : delete_vocabulary_request =
    {
      vocabulary_name =
        (value_for_key vocabulary_name_of_yojson "VocabularyName" _list path)
    } in
  _res
let delete_transcription_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : delete_transcription_job_request =
    {
      transcription_job_name =
        (value_for_key transcription_job_name_of_yojson
           "TranscriptionJobName" _list path)
    } in
  _res
let delete_medical_vocabulary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : delete_medical_vocabulary_request =
    {
      vocabulary_name =
        (value_for_key vocabulary_name_of_yojson "VocabularyName" _list path)
    } in
  _res
let delete_medical_transcription_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : delete_medical_transcription_job_request =
    {
      medical_transcription_job_name =
        (value_for_key transcription_job_name_of_yojson
           "MedicalTranscriptionJobName" _list path)
    } in
  _res
let delete_medical_scribe_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : delete_medical_scribe_job_request =
    {
      medical_scribe_job_name =
        (value_for_key transcription_job_name_of_yojson
           "MedicalScribeJobName" _list path)
    } in
  _res
let delete_language_model_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : delete_language_model_request =
    {
      model_name =
        (value_for_key model_name_of_yojson "ModelName" _list path)
    } in
  _res
let delete_call_analytics_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in let _res : unit = () in _res
let delete_call_analytics_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : delete_call_analytics_job_request =
    {
      call_analytics_job_name =
        (value_for_key call_analytics_job_name_of_yojson
           "CallAnalyticsJobName" _list path)
    } in
  _res
let delete_call_analytics_category_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in let _res : unit = () in _res
let delete_call_analytics_category_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : delete_call_analytics_category_request =
    {
      category_name =
        (value_for_key category_name_of_yojson "CategoryName" _list path)
    } in
  _res
let create_vocabulary_filter_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : create_vocabulary_filter_response =
    {
      last_modified_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "LastModifiedTime") _list path);
      language_code =
        (option_of_yojson
           (value_for_key language_code_of_yojson "LanguageCode") _list path);
      vocabulary_filter_name =
        (option_of_yojson
           (value_for_key vocabulary_filter_name_of_yojson
              "VocabularyFilterName") _list path)
    } in
  _res
let create_vocabulary_filter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : create_vocabulary_filter_request =
    {
      data_access_role_arn =
        (option_of_yojson
           (value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn")
           _list path);
      tags =
        (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list
           path);
      vocabulary_filter_file_uri =
        (option_of_yojson
           (value_for_key uri_of_yojson "VocabularyFilterFileUri") _list path);
      words =
        (option_of_yojson (value_for_key words_of_yojson "Words") _list path);
      language_code =
        (value_for_key language_code_of_yojson "LanguageCode" _list path);
      vocabulary_filter_name =
        (value_for_key vocabulary_filter_name_of_yojson
           "VocabularyFilterName" _list path)
    } in
  _res
let create_vocabulary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : create_vocabulary_response =
    {
      failure_reason =
        (option_of_yojson
           (value_for_key failure_reason_of_yojson "FailureReason") _list
           path);
      last_modified_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "LastModifiedTime") _list path);
      vocabulary_state =
        (option_of_yojson
           (value_for_key vocabulary_state_of_yojson "VocabularyState") _list
           path);
      language_code =
        (option_of_yojson
           (value_for_key language_code_of_yojson "LanguageCode") _list path);
      vocabulary_name =
        (option_of_yojson
           (value_for_key vocabulary_name_of_yojson "VocabularyName") _list
           path)
    } in
  _res
let create_vocabulary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : create_vocabulary_request =
    {
      data_access_role_arn =
        (option_of_yojson
           (value_for_key data_access_role_arn_of_yojson "DataAccessRoleArn")
           _list path);
      tags =
        (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list
           path);
      vocabulary_file_uri =
        (option_of_yojson (value_for_key uri_of_yojson "VocabularyFileUri")
           _list path);
      phrases =
        (option_of_yojson (value_for_key phrases_of_yojson "Phrases") _list
           path);
      language_code =
        (value_for_key language_code_of_yojson "LanguageCode" _list path);
      vocabulary_name =
        (value_for_key vocabulary_name_of_yojson "VocabularyName" _list path)
    } in
  _res
let create_medical_vocabulary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : create_medical_vocabulary_response =
    {
      failure_reason =
        (option_of_yojson
           (value_for_key failure_reason_of_yojson "FailureReason") _list
           path);
      last_modified_time =
        (option_of_yojson
           (value_for_key date_time_of_yojson "LastModifiedTime") _list path);
      vocabulary_state =
        (option_of_yojson
           (value_for_key vocabulary_state_of_yojson "VocabularyState") _list
           path);
      language_code =
        (option_of_yojson
           (value_for_key language_code_of_yojson "LanguageCode") _list path);
      vocabulary_name =
        (option_of_yojson
           (value_for_key vocabulary_name_of_yojson "VocabularyName") _list
           path)
    } in
  _res
let create_medical_vocabulary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : create_medical_vocabulary_request =
    {
      tags =
        (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list
           path);
      vocabulary_file_uri =
        (value_for_key uri_of_yojson "VocabularyFileUri" _list path);
      language_code =
        (value_for_key language_code_of_yojson "LanguageCode" _list path);
      vocabulary_name =
        (value_for_key vocabulary_name_of_yojson "VocabularyName" _list path)
    } in
  _res
let create_language_model_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : create_language_model_response =
    {
      model_status =
        (option_of_yojson
           (value_for_key model_status_of_yojson "ModelStatus") _list path);
      input_data_config =
        (option_of_yojson
           (value_for_key input_data_config_of_yojson "InputDataConfig")
           _list path);
      model_name =
        (option_of_yojson (value_for_key model_name_of_yojson "ModelName")
           _list path);
      base_model_name =
        (option_of_yojson
           (value_for_key base_model_name_of_yojson "BaseModelName") _list
           path);
      language_code =
        (option_of_yojson
           (value_for_key clm_language_code_of_yojson "LanguageCode") _list
           path)
    } in
  _res
let create_language_model_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : create_language_model_request =
    {
      tags =
        (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list
           path);
      input_data_config =
        (value_for_key input_data_config_of_yojson "InputDataConfig" _list
           path);
      model_name =
        (value_for_key model_name_of_yojson "ModelName" _list path);
      base_model_name =
        (value_for_key base_model_name_of_yojson "BaseModelName" _list path);
      language_code =
        (value_for_key clm_language_code_of_yojson "LanguageCode" _list path)
    } in
  _res
let create_call_analytics_category_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : create_call_analytics_category_response =
    {
      category_properties =
        (option_of_yojson
           (value_for_key category_properties_of_yojson "CategoryProperties")
           _list path)
    } in
  _res
let create_call_analytics_category_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  let _res : create_call_analytics_category_request =
    {
      input_type =
        (option_of_yojson (value_for_key input_type_of_yojson "InputType")
           _list path);
      rules = (value_for_key rule_list_of_yojson "Rules" _list path);
      category_name =
        (value_for_key category_name_of_yojson "CategoryName" _list path)
    } in
  _res
let base_string_of_yojson = string_of_yojson
let base_boolean_of_yojson = bool_of_yojson
let base_integer_of_yojson = int_of_yojson
let base_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let base_long_of_yojson = long_of_yojson
let base_document_of_yojson = json_of_yojson