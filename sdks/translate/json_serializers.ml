open Smaws_Lib.Json.SerializeHelpers
open Types

let resource_name_to_yojson = string_to_yojson

let parallel_data_status_to_yojson (x : parallel_data_status) =
  match x with
  | FAILED -> `String "FAILED"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | UPDATING -> `String "UPDATING"
  | CREATING -> `String "CREATING"

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let update_parallel_data_response_to_yojson (x : update_parallel_data_response) =
  assoc_to_yojson
    [
      ("LatestUpdateAttemptAt", option_to_yojson timestamp_to_yojson x.latest_update_attempt_at);
      ( "LatestUpdateAttemptStatus",
        option_to_yojson parallel_data_status_to_yojson x.latest_update_attempt_status );
      ("Status", option_to_yojson parallel_data_status_to_yojson x.status);
      ("Name", option_to_yojson resource_name_to_yojson x.name);
    ]

let description_to_yojson = string_to_yojson
let s3_uri_to_yojson = string_to_yojson

let parallel_data_format_to_yojson (x : parallel_data_format) =
  match x with TMX -> `String "TMX" | CSV -> `String "CSV" | TSV -> `String "TSV"

let parallel_data_config_to_yojson (x : parallel_data_config) =
  assoc_to_yojson
    [
      ("Format", option_to_yojson parallel_data_format_to_yojson x.format);
      ("S3Uri", option_to_yojson s3_uri_to_yojson x.s3_uri);
    ]

let client_token_string_to_yojson = string_to_yojson

let update_parallel_data_request_to_yojson (x : update_parallel_data_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (client_token_string_to_yojson x.client_token));
      ("ParallelDataConfig", Some (parallel_data_config_to_yojson x.parallel_data_config));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Name", Some (resource_name_to_yojson x.name));
    ]

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

let untag_resource_response_to_yojson = unit_to_yojson
let resource_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let language_code_string_to_yojson = string_to_yojson

let unsupported_language_pair_exception_to_yojson (x : unsupported_language_pair_exception) =
  assoc_to_yojson
    [
      ("TargetLanguageCode", option_to_yojson language_code_string_to_yojson x.target_language_code);
      ("SourceLanguageCode", option_to_yojson language_code_string_to_yojson x.source_language_code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let unsupported_display_language_code_exception_to_yojson
    (x : unsupported_display_language_code_exception) =
  assoc_to_yojson
    [
      ( "DisplayLanguageCode",
        option_to_yojson language_code_string_to_yojson x.display_language_code );
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let unbounded_length_string_to_yojson = string_to_yojson

let formality_to_yojson (x : formality) =
  match x with INFORMAL -> `String "INFORMAL" | FORMAL -> `String "FORMAL"

let profanity_to_yojson (x : profanity) = match x with MASK -> `String "MASK"
let brevity_to_yojson (x : brevity) = match x with ON -> `String "ON"

let translation_settings_to_yojson (x : translation_settings) =
  assoc_to_yojson
    [
      ("Brevity", option_to_yojson brevity_to_yojson x.brevity);
      ("Profanity", option_to_yojson profanity_to_yojson x.profanity);
      ("Formality", option_to_yojson formality_to_yojson x.formality);
    ]

let translated_text_string_to_yojson = string_to_yojson
let translated_document_content_to_yojson = blob_to_yojson

let translated_document_to_yojson (x : translated_document) =
  assoc_to_yojson [ ("Content", Some (translated_document_content_to_yojson x.content)) ]

let term_to_yojson (x : term) =
  assoc_to_yojson
    [
      ("TargetText", option_to_yojson string__to_yojson x.target_text);
      ("SourceText", option_to_yojson string__to_yojson x.source_text);
    ]

let term_list_to_yojson tree = list_to_yojson term_to_yojson tree

let applied_terminology_to_yojson (x : applied_terminology) =
  assoc_to_yojson
    [
      ("Terms", option_to_yojson term_list_to_yojson x.terms);
      ("Name", option_to_yojson resource_name_to_yojson x.name);
    ]

let applied_terminology_list_to_yojson tree = list_to_yojson applied_terminology_to_yojson tree

let translate_text_response_to_yojson (x : translate_text_response) =
  assoc_to_yojson
    [
      ("AppliedSettings", option_to_yojson translation_settings_to_yojson x.applied_settings);
      ( "AppliedTerminologies",
        option_to_yojson applied_terminology_list_to_yojson x.applied_terminologies );
      ("TargetLanguageCode", Some (language_code_string_to_yojson x.target_language_code));
      ("SourceLanguageCode", Some (language_code_string_to_yojson x.source_language_code));
      ("TranslatedText", Some (translated_text_string_to_yojson x.translated_text));
    ]

let bounded_length_string_to_yojson = string_to_yojson
let resource_name_list_to_yojson tree = list_to_yojson resource_name_to_yojson tree

let translate_text_request_to_yojson (x : translate_text_request) =
  assoc_to_yojson
    [
      ("Settings", option_to_yojson translation_settings_to_yojson x.settings);
      ("TargetLanguageCode", Some (language_code_string_to_yojson x.target_language_code));
      ("SourceLanguageCode", Some (language_code_string_to_yojson x.source_language_code));
      ("TerminologyNames", option_to_yojson resource_name_list_to_yojson x.terminology_names);
      ("Text", Some (bounded_length_string_to_yojson x.text));
    ]

let text_size_limit_exceeded_exception_to_yojson (x : text_size_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let service_unavailable_exception_to_yojson (x : service_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let detected_language_low_confidence_exception_to_yojson
    (x : detected_language_low_confidence_exception) =
  assoc_to_yojson
    [
      ( "DetectedLanguageCode",
        option_to_yojson language_code_string_to_yojson x.detected_language_code );
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let translate_document_response_to_yojson (x : translate_document_response) =
  assoc_to_yojson
    [
      ("AppliedSettings", option_to_yojson translation_settings_to_yojson x.applied_settings);
      ( "AppliedTerminologies",
        option_to_yojson applied_terminology_list_to_yojson x.applied_terminologies );
      ("TargetLanguageCode", Some (language_code_string_to_yojson x.target_language_code));
      ("SourceLanguageCode", Some (language_code_string_to_yojson x.source_language_code));
      ("TranslatedDocument", Some (translated_document_to_yojson x.translated_document));
    ]

let document_content_to_yojson = blob_to_yojson
let content_type_to_yojson = string_to_yojson

let document_to_yojson (x : document) =
  assoc_to_yojson
    [
      ("ContentType", Some (content_type_to_yojson x.content_type));
      ("Content", Some (document_content_to_yojson x.content));
    ]

let translate_document_request_to_yojson (x : translate_document_request) =
  assoc_to_yojson
    [
      ("Settings", option_to_yojson translation_settings_to_yojson x.settings);
      ("TargetLanguageCode", Some (language_code_string_to_yojson x.target_language_code));
      ("SourceLanguageCode", Some (language_code_string_to_yojson x.source_language_code));
      ("TerminologyNames", option_to_yojson resource_name_list_to_yojson x.terminology_names);
      ("Document", Some (document_to_yojson x.document));
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let job_id_to_yojson = string_to_yojson
let job_name_to_yojson = string_to_yojson

let job_status_to_yojson (x : job_status) =
  match x with
  | STOPPED -> `String "STOPPED"
  | STOP_REQUESTED -> `String "STOP_REQUESTED"
  | FAILED -> `String "FAILED"
  | COMPLETED_WITH_ERROR -> `String "COMPLETED_WITH_ERROR"
  | COMPLETED -> `String "COMPLETED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUBMITTED -> `String "SUBMITTED"

let integer_to_yojson = int_to_yojson

let job_details_to_yojson (x : job_details) =
  assoc_to_yojson
    [
      ("InputDocumentsCount", option_to_yojson integer_to_yojson x.input_documents_count);
      ("DocumentsWithErrorsCount", option_to_yojson integer_to_yojson x.documents_with_errors_count);
      ("TranslatedDocumentsCount", option_to_yojson integer_to_yojson x.translated_documents_count);
    ]

let target_language_code_string_list_to_yojson tree =
  list_to_yojson language_code_string_to_yojson tree

let input_data_config_to_yojson (x : input_data_config) =
  assoc_to_yojson
    [
      ("ContentType", Some (content_type_to_yojson x.content_type));
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let encryption_key_type_to_yojson (x : encryption_key_type) = match x with KMS -> `String "KMS"
let encryption_key_i_d_to_yojson = string_to_yojson

let encryption_key_to_yojson (x : encryption_key) =
  assoc_to_yojson
    [
      ("Id", Some (encryption_key_i_d_to_yojson x.id));
      ("Type", Some (encryption_key_type_to_yojson x.type_));
    ]

let output_data_config_to_yojson (x : output_data_config) =
  assoc_to_yojson
    [
      ("EncryptionKey", option_to_yojson encryption_key_to_yojson x.encryption_key);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let iam_role_arn_to_yojson = string_to_yojson

let text_translation_job_properties_to_yojson (x : text_translation_job_properties) =
  assoc_to_yojson
    [
      ("Settings", option_to_yojson translation_settings_to_yojson x.settings);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("SubmittedTime", option_to_yojson timestamp_to_yojson x.submitted_time);
      ("Message", option_to_yojson unbounded_length_string_to_yojson x.message);
      ("ParallelDataNames", option_to_yojson resource_name_list_to_yojson x.parallel_data_names);
      ("TerminologyNames", option_to_yojson resource_name_list_to_yojson x.terminology_names);
      ( "TargetLanguageCodes",
        option_to_yojson target_language_code_string_list_to_yojson x.target_language_codes );
      ("SourceLanguageCode", option_to_yojson language_code_string_to_yojson x.source_language_code);
      ("JobDetails", option_to_yojson job_details_to_yojson x.job_details);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let text_translation_job_properties_list_to_yojson tree =
  list_to_yojson text_translation_job_properties_to_yojson tree

let text_translation_job_filter_to_yojson (x : text_translation_job_filter) =
  assoc_to_yojson
    [
      ("SubmittedAfterTime", option_to_yojson timestamp_to_yojson x.submitted_after_time);
      ("SubmittedBeforeTime", option_to_yojson timestamp_to_yojson x.submitted_before_time);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let terminology_arn_to_yojson = string_to_yojson
let language_code_string_list_to_yojson tree = list_to_yojson language_code_string_to_yojson tree

let directionality_to_yojson (x : directionality) =
  match x with MULTI -> `String "MULTI" | UNI -> `String "UNI"

let terminology_data_format_to_yojson (x : terminology_data_format) =
  match x with TSV -> `String "TSV" | TMX -> `String "TMX" | CSV -> `String "CSV"

let terminology_properties_to_yojson (x : terminology_properties) =
  assoc_to_yojson
    [
      ("Format", option_to_yojson terminology_data_format_to_yojson x.format);
      ("SkippedTermCount", option_to_yojson integer_to_yojson x.skipped_term_count);
      ("Message", option_to_yojson unbounded_length_string_to_yojson x.message);
      ("Directionality", option_to_yojson directionality_to_yojson x.directionality);
      ("LastUpdatedAt", option_to_yojson timestamp_to_yojson x.last_updated_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("TermCount", option_to_yojson integer_to_yojson x.term_count);
      ("SizeBytes", option_to_yojson integer_to_yojson x.size_bytes);
      ("EncryptionKey", option_to_yojson encryption_key_to_yojson x.encryption_key);
      ( "TargetLanguageCodes",
        option_to_yojson language_code_string_list_to_yojson x.target_language_codes );
      ("SourceLanguageCode", option_to_yojson language_code_string_to_yojson x.source_language_code);
      ("Arn", option_to_yojson terminology_arn_to_yojson x.arn);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Name", option_to_yojson resource_name_to_yojson x.name);
    ]

let terminology_properties_list_to_yojson tree =
  list_to_yojson terminology_properties_to_yojson tree

let terminology_file_to_yojson = blob_to_yojson

let terminology_data_location_to_yojson (x : terminology_data_location) =
  assoc_to_yojson
    [
      ("Location", Some (string__to_yojson x.location));
      ("RepositoryType", Some (string__to_yojson x.repository_type));
    ]

let terminology_data_to_yojson (x : terminology_data) =
  assoc_to_yojson
    [
      ("Directionality", option_to_yojson directionality_to_yojson x.directionality);
      ("Format", Some (terminology_data_format_to_yojson x.format));
      ("File", Some (terminology_file_to_yojson x.file));
    ]

let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let stop_text_translation_job_response_to_yojson (x : stop_text_translation_job_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let stop_text_translation_job_request_to_yojson (x : stop_text_translation_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let start_text_translation_job_response_to_yojson (x : start_text_translation_job_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let start_text_translation_job_request_to_yojson (x : start_text_translation_job_request) =
  assoc_to_yojson
    [
      ("Settings", option_to_yojson translation_settings_to_yojson x.settings);
      ("ClientToken", Some (client_token_string_to_yojson x.client_token));
      ("ParallelDataNames", option_to_yojson resource_name_list_to_yojson x.parallel_data_names);
      ("TerminologyNames", option_to_yojson resource_name_list_to_yojson x.terminology_names);
      ( "TargetLanguageCodes",
        Some (target_language_code_string_list_to_yojson x.target_language_codes) );
      ("SourceLanguageCode", Some (language_code_string_to_yojson x.source_language_code));
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let parallel_data_arn_to_yojson = string_to_yojson
let long_to_yojson = long_to_yojson

let parallel_data_properties_to_yojson (x : parallel_data_properties) =
  assoc_to_yojson
    [
      ("LatestUpdateAttemptAt", option_to_yojson timestamp_to_yojson x.latest_update_attempt_at);
      ( "LatestUpdateAttemptStatus",
        option_to_yojson parallel_data_status_to_yojson x.latest_update_attempt_status );
      ("LastUpdatedAt", option_to_yojson timestamp_to_yojson x.last_updated_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("EncryptionKey", option_to_yojson encryption_key_to_yojson x.encryption_key);
      ("SkippedRecordCount", option_to_yojson long_to_yojson x.skipped_record_count);
      ("FailedRecordCount", option_to_yojson long_to_yojson x.failed_record_count);
      ("ImportedRecordCount", option_to_yojson long_to_yojson x.imported_record_count);
      ("ImportedDataSize", option_to_yojson long_to_yojson x.imported_data_size);
      ("Message", option_to_yojson unbounded_length_string_to_yojson x.message);
      ("ParallelDataConfig", option_to_yojson parallel_data_config_to_yojson x.parallel_data_config);
      ( "TargetLanguageCodes",
        option_to_yojson language_code_string_list_to_yojson x.target_language_codes );
      ("SourceLanguageCode", option_to_yojson language_code_string_to_yojson x.source_language_code);
      ("Status", option_to_yojson parallel_data_status_to_yojson x.status);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Arn", option_to_yojson parallel_data_arn_to_yojson x.arn);
      ("Name", option_to_yojson resource_name_to_yojson x.name);
    ]

let parallel_data_properties_list_to_yojson tree =
  list_to_yojson parallel_data_properties_to_yojson tree

let parallel_data_data_location_to_yojson (x : parallel_data_data_location) =
  assoc_to_yojson
    [
      ("Location", Some (string__to_yojson x.location));
      ("RepositoryType", Some (string__to_yojson x.repository_type));
    ]

let next_token_to_yojson = string_to_yojson
let merge_strategy_to_yojson (x : merge_strategy) = match x with OVERWRITE -> `String "OVERWRITE"
let max_results_integer_to_yojson = int_to_yojson
let localized_name_string_to_yojson = string_to_yojson

let list_text_translation_jobs_response_to_yojson (x : list_text_translation_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "TextTranslationJobPropertiesList",
        option_to_yojson text_translation_job_properties_list_to_yojson
          x.text_translation_job_properties_list );
    ]

let list_text_translation_jobs_request_to_yojson (x : list_text_translation_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filter", option_to_yojson text_translation_job_filter_to_yojson x.filter);
    ]

let invalid_filter_exception_to_yojson (x : invalid_filter_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let list_terminologies_response_to_yojson (x : list_terminologies_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "TerminologyPropertiesList",
        option_to_yojson terminology_properties_list_to_yojson x.terminology_properties_list );
    ]

let list_terminologies_request_to_yojson (x : list_terminologies_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let list_parallel_data_response_to_yojson (x : list_parallel_data_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ParallelDataPropertiesList",
        option_to_yojson parallel_data_properties_list_to_yojson x.parallel_data_properties_list );
    ]

let list_parallel_data_request_to_yojson (x : list_parallel_data_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let language_to_yojson (x : language) =
  assoc_to_yojson
    [
      ("LanguageCode", Some (language_code_string_to_yojson x.language_code));
      ("LanguageName", Some (localized_name_string_to_yojson x.language_name));
    ]

let languages_list_to_yojson tree = list_to_yojson language_to_yojson tree

let display_language_code_to_yojson (x : display_language_code) =
  match x with
  | ZH_TW -> `String "zh-TW"
  | ZH -> `String "zh"
  | PT -> `String "pt"
  | KO -> `String "ko"
  | JA -> `String "ja"
  | IT -> `String "it"
  | FR -> `String "fr"
  | ES -> `String "es"
  | EN -> `String "en"
  | DE -> `String "de"

let list_languages_response_to_yojson (x : list_languages_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "DisplayLanguageCode",
        option_to_yojson display_language_code_to_yojson x.display_language_code );
      ("Languages", option_to_yojson languages_list_to_yojson x.languages);
    ]

let list_languages_request_to_yojson (x : list_languages_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "DisplayLanguageCode",
        option_to_yojson display_language_code_to_yojson x.display_language_code );
    ]

let import_terminology_response_to_yojson (x : import_terminology_response) =
  assoc_to_yojson
    [
      ( "AuxiliaryDataLocation",
        option_to_yojson terminology_data_location_to_yojson x.auxiliary_data_location );
      ( "TerminologyProperties",
        option_to_yojson terminology_properties_to_yojson x.terminology_properties );
    ]

let import_terminology_request_to_yojson (x : import_terminology_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("EncryptionKey", option_to_yojson encryption_key_to_yojson x.encryption_key);
      ("TerminologyData", Some (terminology_data_to_yojson x.terminology_data));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("MergeStrategy", Some (merge_strategy_to_yojson x.merge_strategy));
      ("Name", Some (resource_name_to_yojson x.name));
    ]

let get_terminology_response_to_yojson (x : get_terminology_response) =
  assoc_to_yojson
    [
      ( "AuxiliaryDataLocation",
        option_to_yojson terminology_data_location_to_yojson x.auxiliary_data_location );
      ( "TerminologyDataLocation",
        option_to_yojson terminology_data_location_to_yojson x.terminology_data_location );
      ( "TerminologyProperties",
        option_to_yojson terminology_properties_to_yojson x.terminology_properties );
    ]

let get_terminology_request_to_yojson (x : get_terminology_request) =
  assoc_to_yojson
    [
      ( "TerminologyDataFormat",
        option_to_yojson terminology_data_format_to_yojson x.terminology_data_format );
      ("Name", Some (resource_name_to_yojson x.name));
    ]

let get_parallel_data_response_to_yojson (x : get_parallel_data_response) =
  assoc_to_yojson
    [
      ( "LatestUpdateAttemptAuxiliaryDataLocation",
        option_to_yojson parallel_data_data_location_to_yojson
          x.latest_update_attempt_auxiliary_data_location );
      ( "AuxiliaryDataLocation",
        option_to_yojson parallel_data_data_location_to_yojson x.auxiliary_data_location );
      ("DataLocation", option_to_yojson parallel_data_data_location_to_yojson x.data_location);
      ( "ParallelDataProperties",
        option_to_yojson parallel_data_properties_to_yojson x.parallel_data_properties );
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
      ("Status", option_to_yojson parallel_data_status_to_yojson x.status);
      ("Name", option_to_yojson resource_name_to_yojson x.name);
    ]

let delete_parallel_data_request_to_yojson (x : delete_parallel_data_request) =
  assoc_to_yojson [ ("Name", Some (resource_name_to_yojson x.name)) ]

let create_parallel_data_response_to_yojson (x : create_parallel_data_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson parallel_data_status_to_yojson x.status);
      ("Name", option_to_yojson resource_name_to_yojson x.name);
    ]

let create_parallel_data_request_to_yojson (x : create_parallel_data_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ClientToken", Some (client_token_string_to_yojson x.client_token));
      ("EncryptionKey", option_to_yojson encryption_key_to_yojson x.encryption_key);
      ("ParallelDataConfig", Some (parallel_data_config_to_yojson x.parallel_data_config));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Name", Some (resource_name_to_yojson x.name));
    ]
