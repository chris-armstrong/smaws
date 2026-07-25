open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let too_many_requests_exception_to_yojson (x : too_many_requests_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_parameter_value_exception_to_yojson (x : invalid_parameter_value_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let parallel_data_status_to_yojson (x : parallel_data_status) =
  match x with
  | CREATING -> `String "CREATING"
  | UPDATING -> `String "UPDATING"
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"
  | FAILED -> `String "FAILED"

let resource_name_to_yojson = string_to_yojson

let update_parallel_data_response_to_yojson (x : update_parallel_data_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("Status", option_to_yojson parallel_data_status_to_yojson x.status);
      ( "LatestUpdateAttemptStatus",
        option_to_yojson parallel_data_status_to_yojson x.latest_update_attempt_status );
      ("LatestUpdateAttemptAt", option_to_yojson timestamp_to_yojson x.latest_update_attempt_at);
    ]

let client_token_string_to_yojson = string_to_yojson

let parallel_data_format_to_yojson (x : parallel_data_format) =
  match x with TSV -> `String "TSV" | CSV -> `String "CSV" | TMX -> `String "TMX"

let s3_uri_to_yojson = string_to_yojson

let parallel_data_config_to_yojson (x : parallel_data_config) =
  assoc_to_yojson
    [
      ("S3Uri", option_to_yojson s3_uri_to_yojson x.s3_uri);
      ("Format", option_to_yojson parallel_data_format_to_yojson x.format);
    ]

let description_to_yojson = string_to_yojson

let update_parallel_data_request_to_yojson (x : update_parallel_data_request) =
  assoc_to_yojson
    [
      ("Name", Some (resource_name_to_yojson x.name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("ParallelDataConfig", Some (parallel_data_config_to_yojson x.parallel_data_config));
      ("ClientToken", Some (client_token_string_to_yojson x.client_token));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let resource_arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let language_code_string_to_yojson = string_to_yojson

let unsupported_language_pair_exception_to_yojson (x : unsupported_language_pair_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("SourceLanguageCode", option_to_yojson language_code_string_to_yojson x.source_language_code);
      ("TargetLanguageCode", option_to_yojson language_code_string_to_yojson x.target_language_code);
    ]

let text_size_limit_exceeded_exception_to_yojson (x : text_size_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let service_unavailable_exception_to_yojson (x : service_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let detected_language_low_confidence_exception_to_yojson
    (x : detected_language_low_confidence_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ( "DetectedLanguageCode",
        option_to_yojson language_code_string_to_yojson x.detected_language_code );
    ]

let brevity_to_yojson (x : brevity) = match x with ON -> `String "ON"
let profanity_to_yojson (x : profanity) = match x with MASK -> `String "MASK"

let formality_to_yojson (x : formality) =
  match x with FORMAL -> `String "FORMAL" | INFORMAL -> `String "INFORMAL"

let translation_settings_to_yojson (x : translation_settings) =
  assoc_to_yojson
    [
      ("Formality", option_to_yojson formality_to_yojson x.formality);
      ("Profanity", option_to_yojson profanity_to_yojson x.profanity);
      ("Brevity", option_to_yojson brevity_to_yojson x.brevity);
    ]

let term_to_yojson (x : term) =
  assoc_to_yojson
    [
      ("SourceText", option_to_yojson string__to_yojson x.source_text);
      ("TargetText", option_to_yojson string__to_yojson x.target_text);
    ]

let term_list_to_yojson tree = list_to_yojson term_to_yojson tree

let applied_terminology_to_yojson (x : applied_terminology) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("Terms", option_to_yojson term_list_to_yojson x.terms);
    ]

let applied_terminology_list_to_yojson tree = list_to_yojson applied_terminology_to_yojson tree
let translated_text_string_to_yojson = string_to_yojson

let translate_text_response_to_yojson (x : translate_text_response) =
  assoc_to_yojson
    [
      ("TranslatedText", Some (translated_text_string_to_yojson x.translated_text));
      ("SourceLanguageCode", Some (language_code_string_to_yojson x.source_language_code));
      ("TargetLanguageCode", Some (language_code_string_to_yojson x.target_language_code));
      ( "AppliedTerminologies",
        option_to_yojson applied_terminology_list_to_yojson x.applied_terminologies );
      ("AppliedSettings", option_to_yojson translation_settings_to_yojson x.applied_settings);
    ]

let resource_name_list_to_yojson tree = list_to_yojson resource_name_to_yojson tree
let bounded_length_string_to_yojson = string_to_yojson

let translate_text_request_to_yojson (x : translate_text_request) =
  assoc_to_yojson
    [
      ("Text", Some (bounded_length_string_to_yojson x.text));
      ("TerminologyNames", option_to_yojson resource_name_list_to_yojson x.terminology_names);
      ("SourceLanguageCode", Some (language_code_string_to_yojson x.source_language_code));
      ("TargetLanguageCode", Some (language_code_string_to_yojson x.target_language_code));
      ("Settings", option_to_yojson translation_settings_to_yojson x.settings);
    ]

let translated_document_content_to_yojson = blob_to_yojson

let translated_document_to_yojson (x : translated_document) =
  assoc_to_yojson [ ("Content", Some (translated_document_content_to_yojson x.content)) ]

let translate_document_response_to_yojson (x : translate_document_response) =
  assoc_to_yojson
    [
      ("TranslatedDocument", Some (translated_document_to_yojson x.translated_document));
      ("SourceLanguageCode", Some (language_code_string_to_yojson x.source_language_code));
      ("TargetLanguageCode", Some (language_code_string_to_yojson x.target_language_code));
      ( "AppliedTerminologies",
        option_to_yojson applied_terminology_list_to_yojson x.applied_terminologies );
      ("AppliedSettings", option_to_yojson translation_settings_to_yojson x.applied_settings);
    ]

let content_type_to_yojson = string_to_yojson
let document_content_to_yojson = blob_to_yojson

let document_to_yojson (x : document) =
  assoc_to_yojson
    [
      ("Content", Some (document_content_to_yojson x.content));
      ("ContentType", Some (content_type_to_yojson x.content_type));
    ]

let translate_document_request_to_yojson (x : translate_document_request) =
  assoc_to_yojson
    [
      ("Document", Some (document_to_yojson x.document));
      ("TerminologyNames", option_to_yojson resource_name_list_to_yojson x.terminology_names);
      ("SourceLanguageCode", Some (language_code_string_to_yojson x.source_language_code));
      ("TargetLanguageCode", Some (language_code_string_to_yojson x.target_language_code));
      ("Settings", option_to_yojson translation_settings_to_yojson x.settings);
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("ResourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let job_status_to_yojson (x : job_status) =
  match x with
  | SUBMITTED -> `String "SUBMITTED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | COMPLETED_WITH_ERROR -> `String "COMPLETED_WITH_ERROR"
  | FAILED -> `String "FAILED"
  | STOP_REQUESTED -> `String "STOP_REQUESTED"
  | STOPPED -> `String "STOPPED"

let job_id_to_yojson = string_to_yojson

let stop_text_translation_job_response_to_yojson (x : stop_text_translation_job_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
    ]

let stop_text_translation_job_request_to_yojson (x : stop_text_translation_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let start_text_translation_job_response_to_yojson (x : start_text_translation_job_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
    ]

let target_language_code_string_list_to_yojson tree =
  list_to_yojson language_code_string_to_yojson tree

let iam_role_arn_to_yojson = string_to_yojson
let encryption_key_i_d_to_yojson = string_to_yojson
let encryption_key_type_to_yojson (x : encryption_key_type) = match x with KMS -> `String "KMS"

let encryption_key_to_yojson (x : encryption_key) =
  assoc_to_yojson
    [
      ("Type", Some (encryption_key_type_to_yojson x.type_));
      ("Id", Some (encryption_key_i_d_to_yojson x.id));
    ]

let output_data_config_to_yojson (x : output_data_config) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("EncryptionKey", option_to_yojson encryption_key_to_yojson x.encryption_key);
    ]

let input_data_config_to_yojson (x : input_data_config) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("ContentType", Some (content_type_to_yojson x.content_type));
    ]

let job_name_to_yojson = string_to_yojson

let start_text_translation_job_request_to_yojson (x : start_text_translation_job_request) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("SourceLanguageCode", Some (language_code_string_to_yojson x.source_language_code));
      ( "TargetLanguageCodes",
        Some (target_language_code_string_list_to_yojson x.target_language_codes) );
      ("TerminologyNames", option_to_yojson resource_name_list_to_yojson x.terminology_names);
      ("ParallelDataNames", option_to_yojson resource_name_list_to_yojson x.parallel_data_names);
      ("ClientToken", Some (client_token_string_to_yojson x.client_token));
      ("Settings", option_to_yojson translation_settings_to_yojson x.settings);
    ]

let invalid_filter_exception_to_yojson (x : invalid_filter_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let next_token_to_yojson = string_to_yojson
let unbounded_length_string_to_yojson = string_to_yojson
let integer_to_yojson = int_to_yojson

let job_details_to_yojson (x : job_details) =
  assoc_to_yojson
    [
      ("TranslatedDocumentsCount", option_to_yojson integer_to_yojson x.translated_documents_count);
      ("DocumentsWithErrorsCount", option_to_yojson integer_to_yojson x.documents_with_errors_count);
      ("InputDocumentsCount", option_to_yojson integer_to_yojson x.input_documents_count);
    ]

let text_translation_job_properties_to_yojson (x : text_translation_job_properties) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobDetails", option_to_yojson job_details_to_yojson x.job_details);
      ("SourceLanguageCode", option_to_yojson language_code_string_to_yojson x.source_language_code);
      ( "TargetLanguageCodes",
        option_to_yojson target_language_code_string_list_to_yojson x.target_language_codes );
      ("TerminologyNames", option_to_yojson resource_name_list_to_yojson x.terminology_names);
      ("ParallelDataNames", option_to_yojson resource_name_list_to_yojson x.parallel_data_names);
      ("Message", option_to_yojson unbounded_length_string_to_yojson x.message);
      ("SubmittedTime", option_to_yojson timestamp_to_yojson x.submitted_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("Settings", option_to_yojson translation_settings_to_yojson x.settings);
    ]

let text_translation_job_properties_list_to_yojson tree =
  list_to_yojson text_translation_job_properties_to_yojson tree

let list_text_translation_jobs_response_to_yojson (x : list_text_translation_jobs_response) =
  assoc_to_yojson
    [
      ( "TextTranslationJobPropertiesList",
        option_to_yojson text_translation_job_properties_list_to_yojson
          x.text_translation_job_properties_list );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_integer_to_yojson = int_to_yojson

let text_translation_job_filter_to_yojson (x : text_translation_job_filter) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("SubmittedBeforeTime", option_to_yojson timestamp_to_yojson x.submitted_before_time);
      ("SubmittedAfterTime", option_to_yojson timestamp_to_yojson x.submitted_after_time);
    ]

let list_text_translation_jobs_request_to_yojson (x : list_text_translation_jobs_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson text_translation_job_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let terminology_data_format_to_yojson (x : terminology_data_format) =
  match x with CSV -> `String "CSV" | TMX -> `String "TMX" | TSV -> `String "TSV"

let directionality_to_yojson (x : directionality) =
  match x with UNI -> `String "UNI" | MULTI -> `String "MULTI"

let language_code_string_list_to_yojson tree = list_to_yojson language_code_string_to_yojson tree
let terminology_arn_to_yojson = string_to_yojson

let terminology_properties_to_yojson (x : terminology_properties) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Arn", option_to_yojson terminology_arn_to_yojson x.arn);
      ("SourceLanguageCode", option_to_yojson language_code_string_to_yojson x.source_language_code);
      ( "TargetLanguageCodes",
        option_to_yojson language_code_string_list_to_yojson x.target_language_codes );
      ("EncryptionKey", option_to_yojson encryption_key_to_yojson x.encryption_key);
      ("SizeBytes", option_to_yojson integer_to_yojson x.size_bytes);
      ("TermCount", option_to_yojson integer_to_yojson x.term_count);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("LastUpdatedAt", option_to_yojson timestamp_to_yojson x.last_updated_at);
      ("Directionality", option_to_yojson directionality_to_yojson x.directionality);
      ("Message", option_to_yojson unbounded_length_string_to_yojson x.message);
      ("SkippedTermCount", option_to_yojson integer_to_yojson x.skipped_term_count);
      ("Format", option_to_yojson terminology_data_format_to_yojson x.format);
    ]

let terminology_properties_list_to_yojson tree =
  list_to_yojson terminology_properties_to_yojson tree

let list_terminologies_response_to_yojson (x : list_terminologies_response) =
  assoc_to_yojson
    [
      ( "TerminologyPropertiesList",
        option_to_yojson terminology_properties_list_to_yojson x.terminology_properties_list );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_terminologies_request_to_yojson (x : list_terminologies_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let long_to_yojson = long_to_yojson
let parallel_data_arn_to_yojson = string_to_yojson

let parallel_data_properties_to_yojson (x : parallel_data_properties) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("Arn", option_to_yojson parallel_data_arn_to_yojson x.arn);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Status", option_to_yojson parallel_data_status_to_yojson x.status);
      ("SourceLanguageCode", option_to_yojson language_code_string_to_yojson x.source_language_code);
      ( "TargetLanguageCodes",
        option_to_yojson language_code_string_list_to_yojson x.target_language_codes );
      ("ParallelDataConfig", option_to_yojson parallel_data_config_to_yojson x.parallel_data_config);
      ("Message", option_to_yojson unbounded_length_string_to_yojson x.message);
      ("ImportedDataSize", option_to_yojson long_to_yojson x.imported_data_size);
      ("ImportedRecordCount", option_to_yojson long_to_yojson x.imported_record_count);
      ("FailedRecordCount", option_to_yojson long_to_yojson x.failed_record_count);
      ("SkippedRecordCount", option_to_yojson long_to_yojson x.skipped_record_count);
      ("EncryptionKey", option_to_yojson encryption_key_to_yojson x.encryption_key);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("LastUpdatedAt", option_to_yojson timestamp_to_yojson x.last_updated_at);
      ( "LatestUpdateAttemptStatus",
        option_to_yojson parallel_data_status_to_yojson x.latest_update_attempt_status );
      ("LatestUpdateAttemptAt", option_to_yojson timestamp_to_yojson x.latest_update_attempt_at);
    ]

let parallel_data_properties_list_to_yojson tree =
  list_to_yojson parallel_data_properties_to_yojson tree

let list_parallel_data_response_to_yojson (x : list_parallel_data_response) =
  assoc_to_yojson
    [
      ( "ParallelDataPropertiesList",
        option_to_yojson parallel_data_properties_list_to_yojson x.parallel_data_properties_list );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_parallel_data_request_to_yojson (x : list_parallel_data_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let unsupported_display_language_code_exception_to_yojson
    (x : unsupported_display_language_code_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ( "DisplayLanguageCode",
        option_to_yojson language_code_string_to_yojson x.display_language_code );
    ]

let display_language_code_to_yojson (x : display_language_code) =
  match x with
  | DE -> `String "de"
  | EN -> `String "en"
  | ES -> `String "es"
  | FR -> `String "fr"
  | IT -> `String "it"
  | JA -> `String "ja"
  | KO -> `String "ko"
  | PT -> `String "pt"
  | ZH -> `String "zh"
  | ZH_TW -> `String "zh-TW"

let localized_name_string_to_yojson = string_to_yojson

let language_to_yojson (x : language) =
  assoc_to_yojson
    [
      ("LanguageName", Some (localized_name_string_to_yojson x.language_name));
      ("LanguageCode", Some (language_code_string_to_yojson x.language_code));
    ]

let languages_list_to_yojson tree = list_to_yojson language_to_yojson tree

let list_languages_response_to_yojson (x : list_languages_response) =
  assoc_to_yojson
    [
      ("Languages", option_to_yojson languages_list_to_yojson x.languages);
      ( "DisplayLanguageCode",
        option_to_yojson display_language_code_to_yojson x.display_language_code );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_languages_request_to_yojson (x : list_languages_request) =
  assoc_to_yojson
    [
      ( "DisplayLanguageCode",
        option_to_yojson display_language_code_to_yojson x.display_language_code );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let terminology_data_location_to_yojson (x : terminology_data_location) =
  assoc_to_yojson
    [
      ("RepositoryType", Some (string__to_yojson x.repository_type));
      ("Location", Some (string__to_yojson x.location));
    ]

let import_terminology_response_to_yojson (x : import_terminology_response) =
  assoc_to_yojson
    [
      ( "TerminologyProperties",
        option_to_yojson terminology_properties_to_yojson x.terminology_properties );
      ( "AuxiliaryDataLocation",
        option_to_yojson terminology_data_location_to_yojson x.auxiliary_data_location );
    ]

let terminology_file_to_yojson = blob_to_yojson

let terminology_data_to_yojson (x : terminology_data) =
  assoc_to_yojson
    [
      ("File", Some (terminology_file_to_yojson x.file));
      ("Format", Some (terminology_data_format_to_yojson x.format));
      ("Directionality", option_to_yojson directionality_to_yojson x.directionality);
    ]

let merge_strategy_to_yojson (x : merge_strategy) = match x with OVERWRITE -> `String "OVERWRITE"

let import_terminology_request_to_yojson (x : import_terminology_request) =
  assoc_to_yojson
    [
      ("Name", Some (resource_name_to_yojson x.name));
      ("MergeStrategy", Some (merge_strategy_to_yojson x.merge_strategy));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("TerminologyData", Some (terminology_data_to_yojson x.terminology_data));
      ("EncryptionKey", option_to_yojson encryption_key_to_yojson x.encryption_key);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let get_terminology_response_to_yojson (x : get_terminology_response) =
  assoc_to_yojson
    [
      ( "TerminologyProperties",
        option_to_yojson terminology_properties_to_yojson x.terminology_properties );
      ( "TerminologyDataLocation",
        option_to_yojson terminology_data_location_to_yojson x.terminology_data_location );
      ( "AuxiliaryDataLocation",
        option_to_yojson terminology_data_location_to_yojson x.auxiliary_data_location );
    ]

let get_terminology_request_to_yojson (x : get_terminology_request) =
  assoc_to_yojson
    [
      ("Name", Some (resource_name_to_yojson x.name));
      ( "TerminologyDataFormat",
        option_to_yojson terminology_data_format_to_yojson x.terminology_data_format );
    ]

let parallel_data_data_location_to_yojson (x : parallel_data_data_location) =
  assoc_to_yojson
    [
      ("RepositoryType", Some (string__to_yojson x.repository_type));
      ("Location", Some (string__to_yojson x.location));
    ]

let get_parallel_data_response_to_yojson (x : get_parallel_data_response) =
  assoc_to_yojson
    [
      ( "ParallelDataProperties",
        option_to_yojson parallel_data_properties_to_yojson x.parallel_data_properties );
      ("DataLocation", option_to_yojson parallel_data_data_location_to_yojson x.data_location);
      ( "AuxiliaryDataLocation",
        option_to_yojson parallel_data_data_location_to_yojson x.auxiliary_data_location );
      ( "LatestUpdateAttemptAuxiliaryDataLocation",
        option_to_yojson parallel_data_data_location_to_yojson
          x.latest_update_attempt_auxiliary_data_location );
    ]

let get_parallel_data_request_to_yojson (x : get_parallel_data_request) =
  assoc_to_yojson [ ("Name", Some (resource_name_to_yojson x.name)) ]

let describe_text_translation_job_response_to_yojson (x : describe_text_translation_job_response) =
  assoc_to_yojson
    [
      ( "TextTranslationJobProperties",
        option_to_yojson text_translation_job_properties_to_yojson x.text_translation_job_properties
      );
    ]

let describe_text_translation_job_request_to_yojson (x : describe_text_translation_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let delete_terminology_request_to_yojson (x : delete_terminology_request) =
  assoc_to_yojson [ ("Name", Some (resource_name_to_yojson x.name)) ]

let delete_parallel_data_response_to_yojson (x : delete_parallel_data_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("Status", option_to_yojson parallel_data_status_to_yojson x.status);
    ]

let delete_parallel_data_request_to_yojson (x : delete_parallel_data_request) =
  assoc_to_yojson [ ("Name", Some (resource_name_to_yojson x.name)) ]

let create_parallel_data_response_to_yojson (x : create_parallel_data_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("Status", option_to_yojson parallel_data_status_to_yojson x.status);
    ]

let create_parallel_data_request_to_yojson (x : create_parallel_data_request) =
  assoc_to_yojson
    [
      ("Name", Some (resource_name_to_yojson x.name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("ParallelDataConfig", Some (parallel_data_config_to_yojson x.parallel_data_config));
      ("EncryptionKey", option_to_yojson encryption_key_to_yojson x.encryption_key);
      ("ClientToken", Some (client_token_string_to_yojson x.client_token));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]
