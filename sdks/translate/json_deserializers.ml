open Smaws_Lib.Json.DeserializeHelpers
open Types

let resource_name_of_yojson = string_of_yojson

let parallel_data_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "DELETING" -> DELETING
    | `String "ACTIVE" -> ACTIVE
    | `String "UPDATING" -> UPDATING
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParallelDataStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ParallelDataStatus")
     : parallel_data_status)
    : parallel_data_status)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let update_parallel_data_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     latest_update_attempt_at =
       option_of_yojson (value_for_key timestamp_of_yojson "LatestUpdateAttemptAt") _list path;
     latest_update_attempt_status =
       option_of_yojson
         (value_for_key parallel_data_status_of_yojson "LatestUpdateAttemptStatus")
         _list path;
     status = option_of_yojson (value_for_key parallel_data_status_of_yojson "Status") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
   }
    : update_parallel_data_response)

let description_of_yojson = string_of_yojson
let s3_uri_of_yojson = string_of_yojson

let parallel_data_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "TMX" -> TMX
    | `String "CSV" -> CSV
    | `String "TSV" -> TSV
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParallelDataFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "ParallelDataFormat")
     : parallel_data_format)
    : parallel_data_format)

let parallel_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     format = option_of_yojson (value_for_key parallel_data_format_of_yojson "Format") _list path;
     s3_uri = option_of_yojson (value_for_key s3_uri_of_yojson "S3Uri") _list path;
   }
    : parallel_data_config)

let client_token_string_of_yojson = string_of_yojson

let update_parallel_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = value_for_key client_token_string_of_yojson "ClientToken" _list path;
     parallel_data_config =
       value_for_key parallel_data_config_of_yojson "ParallelDataConfig" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     name = value_for_key resource_name_of_yojson "Name" _list path;
   }
    : update_parallel_data_request)

let string__of_yojson = string_of_yojson

let too_many_requests_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : too_many_requests_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : resource_not_found_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : limit_exceeded_exception)

let invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_request_exception)

let invalid_parameter_value_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_parameter_value_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : internal_server_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : conflict_exception)

let concurrent_modification_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : concurrent_modification_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_arn_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : untag_resource_request)

let language_code_string_of_yojson = string_of_yojson

let unsupported_language_pair_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_language_code =
       option_of_yojson
         (value_for_key language_code_string_of_yojson "TargetLanguageCode")
         _list path;
     source_language_code =
       option_of_yojson
         (value_for_key language_code_string_of_yojson "SourceLanguageCode")
         _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : unsupported_language_pair_exception)

let unsupported_display_language_code_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     display_language_code =
       option_of_yojson
         (value_for_key language_code_string_of_yojson "DisplayLanguageCode")
         _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : unsupported_display_language_code_exception)

let unbounded_length_string_of_yojson = string_of_yojson

let formality_of_yojson (tree : t) path =
  ((match tree with
    | `String "INFORMAL" -> INFORMAL
    | `String "FORMAL" -> FORMAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "Formality" value)
    | _ -> raise (deserialize_wrong_type_error path "Formality")
     : formality)
    : formality)

let profanity_of_yojson (tree : t) path =
  ((match tree with
    | `String "MASK" -> MASK
    | `String value -> raise (deserialize_unknown_enum_value_error path "Profanity" value)
    | _ -> raise (deserialize_wrong_type_error path "Profanity")
     : profanity)
    : profanity)

let brevity_of_yojson (tree : t) path =
  ((match tree with
    | `String "ON" -> ON
    | `String value -> raise (deserialize_unknown_enum_value_error path "Brevity" value)
    | _ -> raise (deserialize_wrong_type_error path "Brevity")
     : brevity)
    : brevity)

let translation_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     brevity = option_of_yojson (value_for_key brevity_of_yojson "Brevity") _list path;
     profanity = option_of_yojson (value_for_key profanity_of_yojson "Profanity") _list path;
     formality = option_of_yojson (value_for_key formality_of_yojson "Formality") _list path;
   }
    : translation_settings)

let translated_text_string_of_yojson = string_of_yojson
let translated_document_content_of_yojson = blob_of_yojson

let translated_document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ content = value_for_key translated_document_content_of_yojson "Content" _list path }
    : translated_document)

let term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_text = option_of_yojson (value_for_key string__of_yojson "TargetText") _list path;
     source_text = option_of_yojson (value_for_key string__of_yojson "SourceText") _list path;
   }
    : term)

let term_list_of_yojson tree path = list_of_yojson term_of_yojson tree path

let applied_terminology_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     terms = option_of_yojson (value_for_key term_list_of_yojson "Terms") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
   }
    : applied_terminology)

let applied_terminology_list_of_yojson tree path =
  list_of_yojson applied_terminology_of_yojson tree path

let translate_text_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     applied_settings =
       option_of_yojson (value_for_key translation_settings_of_yojson "AppliedSettings") _list path;
     applied_terminologies =
       option_of_yojson
         (value_for_key applied_terminology_list_of_yojson "AppliedTerminologies")
         _list path;
     target_language_code =
       value_for_key language_code_string_of_yojson "TargetLanguageCode" _list path;
     source_language_code =
       value_for_key language_code_string_of_yojson "SourceLanguageCode" _list path;
     translated_text = value_for_key translated_text_string_of_yojson "TranslatedText" _list path;
   }
    : translate_text_response)

let bounded_length_string_of_yojson = string_of_yojson
let resource_name_list_of_yojson tree path = list_of_yojson resource_name_of_yojson tree path

let translate_text_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     settings =
       option_of_yojson (value_for_key translation_settings_of_yojson "Settings") _list path;
     target_language_code =
       value_for_key language_code_string_of_yojson "TargetLanguageCode" _list path;
     source_language_code =
       value_for_key language_code_string_of_yojson "SourceLanguageCode" _list path;
     terminology_names =
       option_of_yojson (value_for_key resource_name_list_of_yojson "TerminologyNames") _list path;
     text = value_for_key bounded_length_string_of_yojson "Text" _list path;
   }
    : translate_text_request)

let text_size_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : text_size_limit_exceeded_exception)

let service_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : service_unavailable_exception)

let detected_language_low_confidence_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     detected_language_code =
       option_of_yojson
         (value_for_key language_code_string_of_yojson "DetectedLanguageCode")
         _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : detected_language_low_confidence_exception)

let translate_document_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     applied_settings =
       option_of_yojson (value_for_key translation_settings_of_yojson "AppliedSettings") _list path;
     applied_terminologies =
       option_of_yojson
         (value_for_key applied_terminology_list_of_yojson "AppliedTerminologies")
         _list path;
     target_language_code =
       value_for_key language_code_string_of_yojson "TargetLanguageCode" _list path;
     source_language_code =
       value_for_key language_code_string_of_yojson "SourceLanguageCode" _list path;
     translated_document =
       value_for_key translated_document_of_yojson "TranslatedDocument" _list path;
   }
    : translate_document_response)

let document_content_of_yojson = blob_of_yojson
let content_type_of_yojson = string_of_yojson

let document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     content_type = value_for_key content_type_of_yojson "ContentType" _list path;
     content = value_for_key document_content_of_yojson "Content" _list path;
   }
    : document)

let translate_document_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     settings =
       option_of_yojson (value_for_key translation_settings_of_yojson "Settings") _list path;
     target_language_code =
       value_for_key language_code_string_of_yojson "TargetLanguageCode" _list path;
     source_language_code =
       value_for_key language_code_string_of_yojson "SourceLanguageCode" _list path;
     terminology_names =
       option_of_yojson (value_for_key resource_name_list_of_yojson "TerminologyNames") _list path;
     document = value_for_key document_of_yojson "Document" _list path;
   }
    : translate_document_request)

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "ResourceArn") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : too_many_tags_exception)

let job_id_of_yojson = string_of_yojson
let job_name_of_yojson = string_of_yojson

let job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "STOPPED" -> STOPPED
    | `String "STOP_REQUESTED" -> STOP_REQUESTED
    | `String "FAILED" -> FAILED
    | `String "COMPLETED_WITH_ERROR" -> COMPLETED_WITH_ERROR
    | `String "COMPLETED" -> COMPLETED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "SUBMITTED" -> SUBMITTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "JobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "JobStatus")
     : job_status)
    : job_status)

let integer_of_yojson = int_of_yojson

let job_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_documents_count =
       option_of_yojson (value_for_key integer_of_yojson "InputDocumentsCount") _list path;
     documents_with_errors_count =
       option_of_yojson (value_for_key integer_of_yojson "DocumentsWithErrorsCount") _list path;
     translated_documents_count =
       option_of_yojson (value_for_key integer_of_yojson "TranslatedDocumentsCount") _list path;
   }
    : job_details)

let target_language_code_string_list_of_yojson tree path =
  list_of_yojson language_code_string_of_yojson tree path

let input_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     content_type = value_for_key content_type_of_yojson "ContentType" _list path;
     s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path;
   }
    : input_data_config)

let encryption_key_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "KMS" -> KMS
    | `String value -> raise (deserialize_unknown_enum_value_error path "EncryptionKeyType" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionKeyType")
     : encryption_key_type)
    : encryption_key_type)

let encryption_key_i_d_of_yojson = string_of_yojson

let encryption_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key encryption_key_i_d_of_yojson "Id" _list path;
     type_ = value_for_key encryption_key_type_of_yojson "Type" _list path;
   }
    : encryption_key)

let output_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_key =
       option_of_yojson (value_for_key encryption_key_of_yojson "EncryptionKey") _list path;
     s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path;
   }
    : output_data_config)

let iam_role_arn_of_yojson = string_of_yojson

let text_translation_job_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     settings =
       option_of_yojson (value_for_key translation_settings_of_yojson "Settings") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     output_data_config =
       option_of_yojson (value_for_key output_data_config_of_yojson "OutputDataConfig") _list path;
     input_data_config =
       option_of_yojson (value_for_key input_data_config_of_yojson "InputDataConfig") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     submitted_time =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmittedTime") _list path;
     message =
       option_of_yojson (value_for_key unbounded_length_string_of_yojson "Message") _list path;
     parallel_data_names =
       option_of_yojson (value_for_key resource_name_list_of_yojson "ParallelDataNames") _list path;
     terminology_names =
       option_of_yojson (value_for_key resource_name_list_of_yojson "TerminologyNames") _list path;
     target_language_codes =
       option_of_yojson
         (value_for_key target_language_code_string_list_of_yojson "TargetLanguageCodes")
         _list path;
     source_language_code =
       option_of_yojson
         (value_for_key language_code_string_of_yojson "SourceLanguageCode")
         _list path;
     job_details = option_of_yojson (value_for_key job_details_of_yojson "JobDetails") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
   }
    : text_translation_job_properties)

let text_translation_job_properties_list_of_yojson tree path =
  list_of_yojson text_translation_job_properties_of_yojson tree path

let text_translation_job_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     submitted_after_time =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmittedAfterTime") _list path;
     submitted_before_time =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmittedBeforeTime") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
   }
    : text_translation_job_filter)

let terminology_arn_of_yojson = string_of_yojson

let language_code_string_list_of_yojson tree path =
  list_of_yojson language_code_string_of_yojson tree path

let directionality_of_yojson (tree : t) path =
  ((match tree with
    | `String "MULTI" -> MULTI
    | `String "UNI" -> UNI
    | `String value -> raise (deserialize_unknown_enum_value_error path "Directionality" value)
    | _ -> raise (deserialize_wrong_type_error path "Directionality")
     : directionality)
    : directionality)

let terminology_data_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "TSV" -> TSV
    | `String "TMX" -> TMX
    | `String "CSV" -> CSV
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TerminologyDataFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "TerminologyDataFormat")
     : terminology_data_format)
    : terminology_data_format)

let terminology_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     format = option_of_yojson (value_for_key terminology_data_format_of_yojson "Format") _list path;
     skipped_term_count =
       option_of_yojson (value_for_key integer_of_yojson "SkippedTermCount") _list path;
     message =
       option_of_yojson (value_for_key unbounded_length_string_of_yojson "Message") _list path;
     directionality =
       option_of_yojson (value_for_key directionality_of_yojson "Directionality") _list path;
     last_updated_at =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     term_count = option_of_yojson (value_for_key integer_of_yojson "TermCount") _list path;
     size_bytes = option_of_yojson (value_for_key integer_of_yojson "SizeBytes") _list path;
     encryption_key =
       option_of_yojson (value_for_key encryption_key_of_yojson "EncryptionKey") _list path;
     target_language_codes =
       option_of_yojson
         (value_for_key language_code_string_list_of_yojson "TargetLanguageCodes")
         _list path;
     source_language_code =
       option_of_yojson
         (value_for_key language_code_string_of_yojson "SourceLanguageCode")
         _list path;
     arn = option_of_yojson (value_for_key terminology_arn_of_yojson "Arn") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
   }
    : terminology_properties)

let terminology_properties_list_of_yojson tree path =
  list_of_yojson terminology_properties_of_yojson tree path

let terminology_file_of_yojson = blob_of_yojson

let terminology_data_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location = value_for_key string__of_yojson "Location" _list path;
     repository_type = value_for_key string__of_yojson "RepositoryType" _list path;
   }
    : terminology_data_location)

let terminology_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directionality =
       option_of_yojson (value_for_key directionality_of_yojson "Directionality") _list path;
     format = value_for_key terminology_data_format_of_yojson "Format" _list path;
     file = value_for_key terminology_file_of_yojson "File" _list path;
   }
    : terminology_data)

let tag_value_of_yojson = string_of_yojson

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "Value" _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : tag_resource_request)

let stop_text_translation_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
   }
    : stop_text_translation_job_response)

let stop_text_translation_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : stop_text_translation_job_request)

let start_text_translation_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
   }
    : start_text_translation_job_response)

let start_text_translation_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     settings =
       option_of_yojson (value_for_key translation_settings_of_yojson "Settings") _list path;
     client_token = value_for_key client_token_string_of_yojson "ClientToken" _list path;
     parallel_data_names =
       option_of_yojson (value_for_key resource_name_list_of_yojson "ParallelDataNames") _list path;
     terminology_names =
       option_of_yojson (value_for_key resource_name_list_of_yojson "TerminologyNames") _list path;
     target_language_codes =
       value_for_key target_language_code_string_list_of_yojson "TargetLanguageCodes" _list path;
     source_language_code =
       value_for_key language_code_string_of_yojson "SourceLanguageCode" _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     output_data_config = value_for_key output_data_config_of_yojson "OutputDataConfig" _list path;
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
   }
    : start_text_translation_job_request)

let parallel_data_arn_of_yojson = string_of_yojson
let long_of_yojson = long_of_yojson

let parallel_data_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     latest_update_attempt_at =
       option_of_yojson (value_for_key timestamp_of_yojson "LatestUpdateAttemptAt") _list path;
     latest_update_attempt_status =
       option_of_yojson
         (value_for_key parallel_data_status_of_yojson "LatestUpdateAttemptStatus")
         _list path;
     last_updated_at =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     encryption_key =
       option_of_yojson (value_for_key encryption_key_of_yojson "EncryptionKey") _list path;
     skipped_record_count =
       option_of_yojson (value_for_key long_of_yojson "SkippedRecordCount") _list path;
     failed_record_count =
       option_of_yojson (value_for_key long_of_yojson "FailedRecordCount") _list path;
     imported_record_count =
       option_of_yojson (value_for_key long_of_yojson "ImportedRecordCount") _list path;
     imported_data_size =
       option_of_yojson (value_for_key long_of_yojson "ImportedDataSize") _list path;
     message =
       option_of_yojson (value_for_key unbounded_length_string_of_yojson "Message") _list path;
     parallel_data_config =
       option_of_yojson
         (value_for_key parallel_data_config_of_yojson "ParallelDataConfig")
         _list path;
     target_language_codes =
       option_of_yojson
         (value_for_key language_code_string_list_of_yojson "TargetLanguageCodes")
         _list path;
     source_language_code =
       option_of_yojson
         (value_for_key language_code_string_of_yojson "SourceLanguageCode")
         _list path;
     status = option_of_yojson (value_for_key parallel_data_status_of_yojson "Status") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     arn = option_of_yojson (value_for_key parallel_data_arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
   }
    : parallel_data_properties)

let parallel_data_properties_list_of_yojson tree path =
  list_of_yojson parallel_data_properties_of_yojson tree path

let parallel_data_data_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location = value_for_key string__of_yojson "Location" _list path;
     repository_type = value_for_key string__of_yojson "RepositoryType" _list path;
   }
    : parallel_data_data_location)

let next_token_of_yojson = string_of_yojson

let merge_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "OVERWRITE" -> OVERWRITE
    | `String value -> raise (deserialize_unknown_enum_value_error path "MergeStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "MergeStrategy")
     : merge_strategy)
    : merge_strategy)

let max_results_integer_of_yojson = int_of_yojson
let localized_name_string_of_yojson = string_of_yojson

let list_text_translation_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     text_translation_job_properties_list =
       option_of_yojson
         (value_for_key text_translation_job_properties_list_of_yojson
            "TextTranslationJobPropertiesList")
         _list path;
   }
    : list_text_translation_jobs_response)

let list_text_translation_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     filter =
       option_of_yojson (value_for_key text_translation_job_filter_of_yojson "Filter") _list path;
   }
    : list_text_translation_jobs_request)

let invalid_filter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_filter_exception)

let list_terminologies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     terminology_properties_list =
       option_of_yojson
         (value_for_key terminology_properties_list_of_yojson "TerminologyPropertiesList")
         _list path;
   }
    : list_terminologies_response)

let list_terminologies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_terminologies_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let list_parallel_data_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     parallel_data_properties_list =
       option_of_yojson
         (value_for_key parallel_data_properties_list_of_yojson "ParallelDataPropertiesList")
         _list path;
   }
    : list_parallel_data_response)

let list_parallel_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_parallel_data_request)

let language_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     language_code = value_for_key language_code_string_of_yojson "LanguageCode" _list path;
     language_name = value_for_key localized_name_string_of_yojson "LanguageName" _list path;
   }
    : language)

let languages_list_of_yojson tree path = list_of_yojson language_of_yojson tree path

let display_language_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "zh-TW" -> ZH_TW
    | `String "zh" -> ZH
    | `String "pt" -> PT
    | `String "ko" -> KO
    | `String "ja" -> JA
    | `String "it" -> IT
    | `String "fr" -> FR
    | `String "es" -> ES
    | `String "en" -> EN
    | `String "de" -> DE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DisplayLanguageCode" value)
    | _ -> raise (deserialize_wrong_type_error path "DisplayLanguageCode")
     : display_language_code)
    : display_language_code)

let list_languages_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     display_language_code =
       option_of_yojson
         (value_for_key display_language_code_of_yojson "DisplayLanguageCode")
         _list path;
     languages = option_of_yojson (value_for_key languages_list_of_yojson "Languages") _list path;
   }
    : list_languages_response)

let list_languages_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     display_language_code =
       option_of_yojson
         (value_for_key display_language_code_of_yojson "DisplayLanguageCode")
         _list path;
   }
    : list_languages_request)

let import_terminology_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auxiliary_data_location =
       option_of_yojson
         (value_for_key terminology_data_location_of_yojson "AuxiliaryDataLocation")
         _list path;
     terminology_properties =
       option_of_yojson
         (value_for_key terminology_properties_of_yojson "TerminologyProperties")
         _list path;
   }
    : import_terminology_response)

let import_terminology_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     encryption_key =
       option_of_yojson (value_for_key encryption_key_of_yojson "EncryptionKey") _list path;
     terminology_data = value_for_key terminology_data_of_yojson "TerminologyData" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     merge_strategy = value_for_key merge_strategy_of_yojson "MergeStrategy" _list path;
     name = value_for_key resource_name_of_yojson "Name" _list path;
   }
    : import_terminology_request)

let get_terminology_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auxiliary_data_location =
       option_of_yojson
         (value_for_key terminology_data_location_of_yojson "AuxiliaryDataLocation")
         _list path;
     terminology_data_location =
       option_of_yojson
         (value_for_key terminology_data_location_of_yojson "TerminologyDataLocation")
         _list path;
     terminology_properties =
       option_of_yojson
         (value_for_key terminology_properties_of_yojson "TerminologyProperties")
         _list path;
   }
    : get_terminology_response)

let get_terminology_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     terminology_data_format =
       option_of_yojson
         (value_for_key terminology_data_format_of_yojson "TerminologyDataFormat")
         _list path;
     name = value_for_key resource_name_of_yojson "Name" _list path;
   }
    : get_terminology_request)

let get_parallel_data_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     latest_update_attempt_auxiliary_data_location =
       option_of_yojson
         (value_for_key parallel_data_data_location_of_yojson
            "LatestUpdateAttemptAuxiliaryDataLocation")
         _list path;
     auxiliary_data_location =
       option_of_yojson
         (value_for_key parallel_data_data_location_of_yojson "AuxiliaryDataLocation")
         _list path;
     data_location =
       option_of_yojson
         (value_for_key parallel_data_data_location_of_yojson "DataLocation")
         _list path;
     parallel_data_properties =
       option_of_yojson
         (value_for_key parallel_data_properties_of_yojson "ParallelDataProperties")
         _list path;
   }
    : get_parallel_data_response)

let get_parallel_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "Name" _list path } : get_parallel_data_request)

let describe_text_translation_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_translation_job_properties =
       option_of_yojson
         (value_for_key text_translation_job_properties_of_yojson "TextTranslationJobProperties")
         _list path;
   }
    : describe_text_translation_job_response)

let describe_text_translation_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : describe_text_translation_job_request)

let delete_terminology_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "Name" _list path } : delete_terminology_request)

let delete_parallel_data_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key parallel_data_status_of_yojson "Status") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
   }
    : delete_parallel_data_response)

let delete_parallel_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "Name" _list path }
    : delete_parallel_data_request)

let create_parallel_data_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key parallel_data_status_of_yojson "Status") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
   }
    : create_parallel_data_response)

let create_parallel_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_token = value_for_key client_token_string_of_yojson "ClientToken" _list path;
     encryption_key =
       option_of_yojson (value_for_key encryption_key_of_yojson "EncryptionKey") _list path;
     parallel_data_config =
       value_for_key parallel_data_config_of_yojson "ParallelDataConfig" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     name = value_for_key resource_name_of_yojson "Name" _list path;
   }
    : create_parallel_data_request)
