open Smaws_Lib.Json.DeserializeHelpers
open Types

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

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let parallel_data_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "UPDATING" -> UPDATING
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETING" -> DELETING
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParallelDataStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ParallelDataStatus")
     : parallel_data_status)
    : parallel_data_status)

let resource_name_of_yojson = string_of_yojson

let update_parallel_data_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key parallel_data_status_of_yojson "Status") _list path;
     latest_update_attempt_status =
       option_of_yojson
         (value_for_key parallel_data_status_of_yojson "LatestUpdateAttemptStatus")
         _list path;
     latest_update_attempt_at =
       option_of_yojson (value_for_key timestamp_of_yojson "LatestUpdateAttemptAt") _list path;
   }
    : update_parallel_data_response)

let client_token_string_of_yojson = string_of_yojson

let parallel_data_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "TSV" -> TSV
    | `String "CSV" -> CSV
    | `String "TMX" -> TMX
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParallelDataFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "ParallelDataFormat")
     : parallel_data_format)
    : parallel_data_format)

let s3_uri_of_yojson = string_of_yojson

let parallel_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_uri = option_of_yojson (value_for_key s3_uri_of_yojson "S3Uri") _list path;
     format = option_of_yojson (value_for_key parallel_data_format_of_yojson "Format") _list path;
   }
    : parallel_data_config)

let description_of_yojson = string_of_yojson

let update_parallel_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "Name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     parallel_data_config =
       value_for_key parallel_data_config_of_yojson "ParallelDataConfig" _list path;
     client_token = value_for_key client_token_string_of_yojson "ClientToken" _list path;
   }
    : update_parallel_data_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path
let resource_arn_of_yojson = string_of_yojson

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let language_code_string_of_yojson = string_of_yojson

let unsupported_language_pair_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     source_language_code =
       option_of_yojson
         (value_for_key language_code_string_of_yojson "SourceLanguageCode")
         _list path;
     target_language_code =
       option_of_yojson
         (value_for_key language_code_string_of_yojson "TargetLanguageCode")
         _list path;
   }
    : unsupported_language_pair_exception)

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
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     detected_language_code =
       option_of_yojson
         (value_for_key language_code_string_of_yojson "DetectedLanguageCode")
         _list path;
   }
    : detected_language_low_confidence_exception)

let brevity_of_yojson (tree : t) path =
  ((match tree with
    | `String "ON" -> ON
    | `String value -> raise (deserialize_unknown_enum_value_error path "Brevity" value)
    | _ -> raise (deserialize_wrong_type_error path "Brevity")
     : brevity)
    : brevity)

let profanity_of_yojson (tree : t) path =
  ((match tree with
    | `String "MASK" -> MASK
    | `String value -> raise (deserialize_unknown_enum_value_error path "Profanity" value)
    | _ -> raise (deserialize_wrong_type_error path "Profanity")
     : profanity)
    : profanity)

let formality_of_yojson (tree : t) path =
  ((match tree with
    | `String "FORMAL" -> FORMAL
    | `String "INFORMAL" -> INFORMAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "Formality" value)
    | _ -> raise (deserialize_wrong_type_error path "Formality")
     : formality)
    : formality)

let translation_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     formality = option_of_yojson (value_for_key formality_of_yojson "Formality") _list path;
     profanity = option_of_yojson (value_for_key profanity_of_yojson "Profanity") _list path;
     brevity = option_of_yojson (value_for_key brevity_of_yojson "Brevity") _list path;
   }
    : translation_settings)

let term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_text = option_of_yojson (value_for_key string__of_yojson "SourceText") _list path;
     target_text = option_of_yojson (value_for_key string__of_yojson "TargetText") _list path;
   }
    : term)

let term_list_of_yojson tree path = list_of_yojson term_of_yojson tree path

let applied_terminology_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     terms = option_of_yojson (value_for_key term_list_of_yojson "Terms") _list path;
   }
    : applied_terminology)

let applied_terminology_list_of_yojson tree path =
  list_of_yojson applied_terminology_of_yojson tree path

let translated_text_string_of_yojson = string_of_yojson

let translate_text_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     translated_text = value_for_key translated_text_string_of_yojson "TranslatedText" _list path;
     source_language_code =
       value_for_key language_code_string_of_yojson "SourceLanguageCode" _list path;
     target_language_code =
       value_for_key language_code_string_of_yojson "TargetLanguageCode" _list path;
     applied_terminologies =
       option_of_yojson
         (value_for_key applied_terminology_list_of_yojson "AppliedTerminologies")
         _list path;
     applied_settings =
       option_of_yojson (value_for_key translation_settings_of_yojson "AppliedSettings") _list path;
   }
    : translate_text_response)

let resource_name_list_of_yojson tree path = list_of_yojson resource_name_of_yojson tree path
let bounded_length_string_of_yojson = string_of_yojson

let translate_text_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = value_for_key bounded_length_string_of_yojson "Text" _list path;
     terminology_names =
       option_of_yojson (value_for_key resource_name_list_of_yojson "TerminologyNames") _list path;
     source_language_code =
       value_for_key language_code_string_of_yojson "SourceLanguageCode" _list path;
     target_language_code =
       value_for_key language_code_string_of_yojson "TargetLanguageCode" _list path;
     settings =
       option_of_yojson (value_for_key translation_settings_of_yojson "Settings") _list path;
   }
    : translate_text_request)

let translated_document_content_of_yojson = blob_of_yojson

let translated_document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ content = value_for_key translated_document_content_of_yojson "Content" _list path }
    : translated_document)

let translate_document_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     translated_document =
       value_for_key translated_document_of_yojson "TranslatedDocument" _list path;
     source_language_code =
       value_for_key language_code_string_of_yojson "SourceLanguageCode" _list path;
     target_language_code =
       value_for_key language_code_string_of_yojson "TargetLanguageCode" _list path;
     applied_terminologies =
       option_of_yojson
         (value_for_key applied_terminology_list_of_yojson "AppliedTerminologies")
         _list path;
     applied_settings =
       option_of_yojson (value_for_key translation_settings_of_yojson "AppliedSettings") _list path;
   }
    : translate_document_response)

let content_type_of_yojson = string_of_yojson
let document_content_of_yojson = blob_of_yojson

let document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     content = value_for_key document_content_of_yojson "Content" _list path;
     content_type = value_for_key content_type_of_yojson "ContentType" _list path;
   }
    : document)

let translate_document_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document = value_for_key document_of_yojson "Document" _list path;
     terminology_names =
       option_of_yojson (value_for_key resource_name_list_of_yojson "TerminologyNames") _list path;
     source_language_code =
       value_for_key language_code_string_of_yojson "SourceLanguageCode" _list path;
     target_language_code =
       value_for_key language_code_string_of_yojson "TargetLanguageCode" _list path;
     settings =
       option_of_yojson (value_for_key translation_settings_of_yojson "Settings") _list path;
   }
    : translate_document_request)

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "ResourceArn") _list path;
   }
    : too_many_tags_exception)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUBMITTED" -> SUBMITTED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "COMPLETED" -> COMPLETED
    | `String "COMPLETED_WITH_ERROR" -> COMPLETED_WITH_ERROR
    | `String "FAILED" -> FAILED
    | `String "STOP_REQUESTED" -> STOP_REQUESTED
    | `String "STOPPED" -> STOPPED
    | `String value -> raise (deserialize_unknown_enum_value_error path "JobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "JobStatus")
     : job_status)
    : job_status)

let job_id_of_yojson = string_of_yojson

let stop_text_translation_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
   }
    : stop_text_translation_job_response)

let stop_text_translation_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : stop_text_translation_job_request)

let start_text_translation_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
   }
    : start_text_translation_job_response)

let target_language_code_string_list_of_yojson tree path =
  list_of_yojson language_code_string_of_yojson tree path

let iam_role_arn_of_yojson = string_of_yojson
let encryption_key_i_d_of_yojson = string_of_yojson

let encryption_key_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "KMS" -> KMS
    | `String value -> raise (deserialize_unknown_enum_value_error path "EncryptionKeyType" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionKeyType")
     : encryption_key_type)
    : encryption_key_type)

let encryption_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key encryption_key_type_of_yojson "Type" _list path;
     id = value_for_key encryption_key_i_d_of_yojson "Id" _list path;
   }
    : encryption_key)

let output_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path;
     encryption_key =
       option_of_yojson (value_for_key encryption_key_of_yojson "EncryptionKey") _list path;
   }
    : output_data_config)

let input_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path;
     content_type = value_for_key content_type_of_yojson "ContentType" _list path;
   }
    : input_data_config)

let job_name_of_yojson = string_of_yojson

let start_text_translation_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     output_data_config = value_for_key output_data_config_of_yojson "OutputDataConfig" _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     source_language_code =
       value_for_key language_code_string_of_yojson "SourceLanguageCode" _list path;
     target_language_codes =
       value_for_key target_language_code_string_list_of_yojson "TargetLanguageCodes" _list path;
     terminology_names =
       option_of_yojson (value_for_key resource_name_list_of_yojson "TerminologyNames") _list path;
     parallel_data_names =
       option_of_yojson (value_for_key resource_name_list_of_yojson "ParallelDataNames") _list path;
     client_token = value_for_key client_token_string_of_yojson "ClientToken" _list path;
     settings =
       option_of_yojson (value_for_key translation_settings_of_yojson "Settings") _list path;
   }
    : start_text_translation_job_request)

let invalid_filter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_filter_exception)

let next_token_of_yojson = string_of_yojson
let unbounded_length_string_of_yojson = string_of_yojson
let integer_of_yojson = int_of_yojson

let job_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     translated_documents_count =
       option_of_yojson (value_for_key integer_of_yojson "TranslatedDocumentsCount") _list path;
     documents_with_errors_count =
       option_of_yojson (value_for_key integer_of_yojson "DocumentsWithErrorsCount") _list path;
     input_documents_count =
       option_of_yojson (value_for_key integer_of_yojson "InputDocumentsCount") _list path;
   }
    : job_details)

let text_translation_job_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     job_details = option_of_yojson (value_for_key job_details_of_yojson "JobDetails") _list path;
     source_language_code =
       option_of_yojson
         (value_for_key language_code_string_of_yojson "SourceLanguageCode")
         _list path;
     target_language_codes =
       option_of_yojson
         (value_for_key target_language_code_string_list_of_yojson "TargetLanguageCodes")
         _list path;
     terminology_names =
       option_of_yojson (value_for_key resource_name_list_of_yojson "TerminologyNames") _list path;
     parallel_data_names =
       option_of_yojson (value_for_key resource_name_list_of_yojson "ParallelDataNames") _list path;
     message =
       option_of_yojson (value_for_key unbounded_length_string_of_yojson "Message") _list path;
     submitted_time =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmittedTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     input_data_config =
       option_of_yojson (value_for_key input_data_config_of_yojson "InputDataConfig") _list path;
     output_data_config =
       option_of_yojson (value_for_key output_data_config_of_yojson "OutputDataConfig") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     settings =
       option_of_yojson (value_for_key translation_settings_of_yojson "Settings") _list path;
   }
    : text_translation_job_properties)

let text_translation_job_properties_list_of_yojson tree path =
  list_of_yojson text_translation_job_properties_of_yojson tree path

let list_text_translation_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_translation_job_properties_list =
       option_of_yojson
         (value_for_key text_translation_job_properties_list_of_yojson
            "TextTranslationJobPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_text_translation_jobs_response)

let max_results_integer_of_yojson = int_of_yojson

let text_translation_job_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     submitted_before_time =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmittedBeforeTime") _list path;
     submitted_after_time =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmittedAfterTime") _list path;
   }
    : text_translation_job_filter)

let list_text_translation_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson (value_for_key text_translation_job_filter_of_yojson "Filter") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_text_translation_jobs_request)

let terminology_data_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "CSV" -> CSV
    | `String "TMX" -> TMX
    | `String "TSV" -> TSV
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TerminologyDataFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "TerminologyDataFormat")
     : terminology_data_format)
    : terminology_data_format)

let directionality_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNI" -> UNI
    | `String "MULTI" -> MULTI
    | `String value -> raise (deserialize_unknown_enum_value_error path "Directionality" value)
    | _ -> raise (deserialize_wrong_type_error path "Directionality")
     : directionality)
    : directionality)

let language_code_string_list_of_yojson tree path =
  list_of_yojson language_code_string_of_yojson tree path

let terminology_arn_of_yojson = string_of_yojson

let terminology_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     arn = option_of_yojson (value_for_key terminology_arn_of_yojson "Arn") _list path;
     source_language_code =
       option_of_yojson
         (value_for_key language_code_string_of_yojson "SourceLanguageCode")
         _list path;
     target_language_codes =
       option_of_yojson
         (value_for_key language_code_string_list_of_yojson "TargetLanguageCodes")
         _list path;
     encryption_key =
       option_of_yojson (value_for_key encryption_key_of_yojson "EncryptionKey") _list path;
     size_bytes = option_of_yojson (value_for_key integer_of_yojson "SizeBytes") _list path;
     term_count = option_of_yojson (value_for_key integer_of_yojson "TermCount") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     last_updated_at =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedAt") _list path;
     directionality =
       option_of_yojson (value_for_key directionality_of_yojson "Directionality") _list path;
     message =
       option_of_yojson (value_for_key unbounded_length_string_of_yojson "Message") _list path;
     skipped_term_count =
       option_of_yojson (value_for_key integer_of_yojson "SkippedTermCount") _list path;
     format = option_of_yojson (value_for_key terminology_data_format_of_yojson "Format") _list path;
   }
    : terminology_properties)

let terminology_properties_list_of_yojson tree path =
  list_of_yojson terminology_properties_of_yojson tree path

let list_terminologies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     terminology_properties_list =
       option_of_yojson
         (value_for_key terminology_properties_list_of_yojson "TerminologyPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_terminologies_response)

let list_terminologies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
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

let long_of_yojson = long_of_yojson
let parallel_data_arn_of_yojson = string_of_yojson

let parallel_data_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     arn = option_of_yojson (value_for_key parallel_data_arn_of_yojson "Arn") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     status = option_of_yojson (value_for_key parallel_data_status_of_yojson "Status") _list path;
     source_language_code =
       option_of_yojson
         (value_for_key language_code_string_of_yojson "SourceLanguageCode")
         _list path;
     target_language_codes =
       option_of_yojson
         (value_for_key language_code_string_list_of_yojson "TargetLanguageCodes")
         _list path;
     parallel_data_config =
       option_of_yojson
         (value_for_key parallel_data_config_of_yojson "ParallelDataConfig")
         _list path;
     message =
       option_of_yojson (value_for_key unbounded_length_string_of_yojson "Message") _list path;
     imported_data_size =
       option_of_yojson (value_for_key long_of_yojson "ImportedDataSize") _list path;
     imported_record_count =
       option_of_yojson (value_for_key long_of_yojson "ImportedRecordCount") _list path;
     failed_record_count =
       option_of_yojson (value_for_key long_of_yojson "FailedRecordCount") _list path;
     skipped_record_count =
       option_of_yojson (value_for_key long_of_yojson "SkippedRecordCount") _list path;
     encryption_key =
       option_of_yojson (value_for_key encryption_key_of_yojson "EncryptionKey") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     last_updated_at =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedAt") _list path;
     latest_update_attempt_status =
       option_of_yojson
         (value_for_key parallel_data_status_of_yojson "LatestUpdateAttemptStatus")
         _list path;
     latest_update_attempt_at =
       option_of_yojson (value_for_key timestamp_of_yojson "LatestUpdateAttemptAt") _list path;
   }
    : parallel_data_properties)

let parallel_data_properties_list_of_yojson tree path =
  list_of_yojson parallel_data_properties_of_yojson tree path

let list_parallel_data_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parallel_data_properties_list =
       option_of_yojson
         (value_for_key parallel_data_properties_list_of_yojson "ParallelDataPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_parallel_data_response)

let list_parallel_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_parallel_data_request)

let unsupported_display_language_code_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     display_language_code =
       option_of_yojson
         (value_for_key language_code_string_of_yojson "DisplayLanguageCode")
         _list path;
   }
    : unsupported_display_language_code_exception)

let display_language_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "de" -> DE
    | `String "en" -> EN
    | `String "es" -> ES
    | `String "fr" -> FR
    | `String "it" -> IT
    | `String "ja" -> JA
    | `String "ko" -> KO
    | `String "pt" -> PT
    | `String "zh" -> ZH
    | `String "zh-TW" -> ZH_TW
    | `String value -> raise (deserialize_unknown_enum_value_error path "DisplayLanguageCode" value)
    | _ -> raise (deserialize_wrong_type_error path "DisplayLanguageCode")
     : display_language_code)
    : display_language_code)

let localized_name_string_of_yojson = string_of_yojson

let language_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     language_name = value_for_key localized_name_string_of_yojson "LanguageName" _list path;
     language_code = value_for_key language_code_string_of_yojson "LanguageCode" _list path;
   }
    : language)

let languages_list_of_yojson tree path = list_of_yojson language_of_yojson tree path

let list_languages_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     languages = option_of_yojson (value_for_key languages_list_of_yojson "Languages") _list path;
     display_language_code =
       option_of_yojson
         (value_for_key display_language_code_of_yojson "DisplayLanguageCode")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_languages_response)

let list_languages_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     display_language_code =
       option_of_yojson
         (value_for_key display_language_code_of_yojson "DisplayLanguageCode")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_languages_request)

let terminology_data_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_type = value_for_key string__of_yojson "RepositoryType" _list path;
     location = value_for_key string__of_yojson "Location" _list path;
   }
    : terminology_data_location)

let import_terminology_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     terminology_properties =
       option_of_yojson
         (value_for_key terminology_properties_of_yojson "TerminologyProperties")
         _list path;
     auxiliary_data_location =
       option_of_yojson
         (value_for_key terminology_data_location_of_yojson "AuxiliaryDataLocation")
         _list path;
   }
    : import_terminology_response)

let terminology_file_of_yojson = blob_of_yojson

let terminology_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file = value_for_key terminology_file_of_yojson "File" _list path;
     format = value_for_key terminology_data_format_of_yojson "Format" _list path;
     directionality =
       option_of_yojson (value_for_key directionality_of_yojson "Directionality") _list path;
   }
    : terminology_data)

let merge_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "OVERWRITE" -> OVERWRITE
    | `String value -> raise (deserialize_unknown_enum_value_error path "MergeStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "MergeStrategy")
     : merge_strategy)
    : merge_strategy)

let import_terminology_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "Name" _list path;
     merge_strategy = value_for_key merge_strategy_of_yojson "MergeStrategy" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     terminology_data = value_for_key terminology_data_of_yojson "TerminologyData" _list path;
     encryption_key =
       option_of_yojson (value_for_key encryption_key_of_yojson "EncryptionKey") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : import_terminology_request)

let get_terminology_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     terminology_properties =
       option_of_yojson
         (value_for_key terminology_properties_of_yojson "TerminologyProperties")
         _list path;
     terminology_data_location =
       option_of_yojson
         (value_for_key terminology_data_location_of_yojson "TerminologyDataLocation")
         _list path;
     auxiliary_data_location =
       option_of_yojson
         (value_for_key terminology_data_location_of_yojson "AuxiliaryDataLocation")
         _list path;
   }
    : get_terminology_response)

let get_terminology_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "Name" _list path;
     terminology_data_format =
       option_of_yojson
         (value_for_key terminology_data_format_of_yojson "TerminologyDataFormat")
         _list path;
   }
    : get_terminology_request)

let parallel_data_data_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_type = value_for_key string__of_yojson "RepositoryType" _list path;
     location = value_for_key string__of_yojson "Location" _list path;
   }
    : parallel_data_data_location)

let get_parallel_data_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parallel_data_properties =
       option_of_yojson
         (value_for_key parallel_data_properties_of_yojson "ParallelDataProperties")
         _list path;
     data_location =
       option_of_yojson
         (value_for_key parallel_data_data_location_of_yojson "DataLocation")
         _list path;
     auxiliary_data_location =
       option_of_yojson
         (value_for_key parallel_data_data_location_of_yojson "AuxiliaryDataLocation")
         _list path;
     latest_update_attempt_auxiliary_data_location =
       option_of_yojson
         (value_for_key parallel_data_data_location_of_yojson
            "LatestUpdateAttemptAuxiliaryDataLocation")
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
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key parallel_data_status_of_yojson "Status") _list path;
   }
    : delete_parallel_data_response)

let delete_parallel_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "Name" _list path }
    : delete_parallel_data_request)

let create_parallel_data_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key parallel_data_status_of_yojson "Status") _list path;
   }
    : create_parallel_data_response)

let create_parallel_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "Name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     parallel_data_config =
       value_for_key parallel_data_config_of_yojson "ParallelDataConfig" _list path;
     encryption_key =
       option_of_yojson (value_for_key encryption_key_of_yojson "EncryptionKey") _list path;
     client_token = value_for_key client_token_string_of_yojson "ClientToken" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_parallel_data_request)
