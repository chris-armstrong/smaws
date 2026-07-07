open Smaws_Lib.Json.DeserializeHelpers
open Types

let validation_level_of_yojson (tree : t) path =
  ((match tree with
    | `String "minimal" -> MINIMAL
    | `String "structure-only" -> STRUCTURE_ONLY
    | `String "strict" -> STRICT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ValidationLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationLevel")
     : validation_level)
    : validation_level)

let string__of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : validation_exception)

let datastore_id_of_yojson = string_of_yojson
let datastore_arn_of_yojson = string_of_yojson
let datastore_name_of_yojson = string_of_yojson

let datastore_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "UPDATING" -> UPDATING
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "DELETED" -> DELETED
    | `String "DELETING" -> DELETING
    | `String "ACTIVE" -> ACTIVE
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "DatastoreStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DatastoreStatus")
     : datastore_status)
    : datastore_status)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let fhir_version_of_yojson (tree : t) path =
  ((match tree with
    | `String "R4" -> R4
    | `String value -> raise (deserialize_unknown_enum_value_error path "FHIRVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "FHIRVersion")
     : fhir_version)
    : fhir_version)

let cmk_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_OWNED_KMS_KEY" -> AO_CMK
    | `String "CUSTOMER_MANAGED_KMS_KEY" -> CM_CMK
    | `String value -> raise (deserialize_unknown_enum_value_error path "CmkType" value)
    | _ -> raise (deserialize_wrong_type_error path "CmkType")
     : cmk_type)
    : cmk_type)

let encryption_key_i_d_of_yojson = string_of_yojson

let kms_encryption_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id =
       option_of_yojson (value_for_key encryption_key_i_d_of_yojson "KmsKeyId") _list path;
     cmk_type = value_for_key cmk_type_of_yojson "CmkType" _list path;
   }
    : kms_encryption_config)

let sse_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_encryption_config =
       value_for_key kms_encryption_config_of_yojson "KmsEncryptionConfig" _list path;
   }
    : sse_configuration)

let preload_data_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SYNTHEA" -> SYNTHEA
    | `String value -> raise (deserialize_unknown_enum_value_error path "PreloadDataType" value)
    | _ -> raise (deserialize_wrong_type_error path "PreloadDataType")
     : preload_data_type)
    : preload_data_type)

let preload_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ preload_data_type = value_for_key preload_data_type_of_yojson "PreloadDataType" _list path }
    : preload_data_config)

let authorization_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_AUTH" -> AWS_AUTH
    | `String "SMART_ON_FHIR" -> SMART_ON_FHIR
    | `String "SMART_ON_FHIR_V1" -> SMARTV1
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AuthorizationStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "AuthorizationStrategy")
     : authorization_strategy)
    : authorization_strategy)

let boolean__of_yojson = bool_of_yojson
let configuration_metadata_of_yojson = string_of_yojson
let lambda_arn_of_yojson = string_of_yojson

let identity_provider_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idp_lambda_arn =
       option_of_yojson (value_for_key lambda_arn_of_yojson "IdpLambdaArn") _list path;
     metadata =
       option_of_yojson (value_for_key configuration_metadata_of_yojson "Metadata") _list path;
     fine_grained_authorization_enabled =
       option_of_yojson
         (value_for_key boolean__of_yojson "FineGrainedAuthorizationEnabled")
         _list path;
     authorization_strategy =
       value_for_key authorization_strategy_of_yojson "AuthorizationStrategy" _list path;
   }
    : identity_provider_configuration)

let error_message_of_yojson = string_of_yojson

let error_category_of_yojson (tree : t) path =
  ((match tree with
    | `String "NON_RETRYABLE_ERROR" -> NON_RETRYABLE_ERROR
    | `String "RETRYABLE_ERROR" -> RETRYABLE_ERROR
    | `String value -> raise (deserialize_unknown_enum_value_error path "ErrorCategory" value)
    | _ -> raise (deserialize_wrong_type_error path "ErrorCategory")
     : error_category)
    : error_category)

let error_cause_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_category =
       option_of_yojson (value_for_key error_category_of_yojson "ErrorCategory") _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "ErrorMessage") _list path;
   }
    : error_cause)

let nlp_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLING" -> DISABLING
    | `String "ENABLING" -> ENABLING
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "NlpStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "NlpStatus")
     : nlp_status)
    : nlp_status)

let nlp_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = option_of_yojson (value_for_key nlp_status_of_yojson "Status") _list path }
    : nlp_configuration)

let analytics_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PAUSED" -> PAUSED
    | `String "PAUSING" -> PAUSING
    | `String "DISABLING" -> DISABLING
    | `String "DISABLED" -> DISABLED
    | `String "ENABLING" -> ENABLING
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AnalyticsStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AnalyticsStatus")
     : analytics_status)
    : analytics_status)

let analytics_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = option_of_yojson (value_for_key analytics_status_of_yojson "Status") _list path }
    : analytics_configuration)

let default_profiles_of_yojson tree path = list_of_yojson string__of_yojson tree path

let profile_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_profiles =
       option_of_yojson (value_for_key default_profiles_of_yojson "DefaultProfiles") _list path;
   }
    : profile_configuration)

let datastore_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profile_configuration =
       option_of_yojson
         (value_for_key profile_configuration_of_yojson "ProfileConfiguration")
         _list path;
     analytics_configuration =
       option_of_yojson
         (value_for_key analytics_configuration_of_yojson "AnalyticsConfiguration")
         _list path;
     nlp_configuration =
       option_of_yojson (value_for_key nlp_configuration_of_yojson "NlpConfiguration") _list path;
     error_cause = option_of_yojson (value_for_key error_cause_of_yojson "ErrorCause") _list path;
     identity_provider_configuration =
       option_of_yojson
         (value_for_key identity_provider_configuration_of_yojson "IdentityProviderConfiguration")
         _list path;
     preload_data_config =
       option_of_yojson (value_for_key preload_data_config_of_yojson "PreloadDataConfig") _list path;
     sse_configuration =
       option_of_yojson (value_for_key sse_configuration_of_yojson "SseConfiguration") _list path;
     datastore_endpoint = value_for_key string__of_yojson "DatastoreEndpoint" _list path;
     datastore_type_version = value_for_key fhir_version_of_yojson "DatastoreTypeVersion" _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     datastore_status = value_for_key datastore_status_of_yojson "DatastoreStatus" _list path;
     datastore_name =
       option_of_yojson (value_for_key datastore_name_of_yojson "DatastoreName") _list path;
     datastore_arn = value_for_key datastore_arn_of_yojson "DatastoreArn" _list path;
     datastore_id = value_for_key datastore_id_of_yojson "DatastoreId" _list path;
   }
    : datastore_properties)

let update_fhir_datastore_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     datastore_properties =
       value_for_key datastore_properties_of_yojson "DatastoreProperties" _list path;
   }
    : update_fhir_datastore_response)

let update_fhir_datastore_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_provider_configuration =
       option_of_yojson
         (value_for_key identity_provider_configuration_of_yojson "IdentityProviderConfiguration")
         _list path;
     profile_configuration =
       option_of_yojson
         (value_for_key profile_configuration_of_yojson "ProfileConfiguration")
         _list path;
     analytics_configuration =
       option_of_yojson
         (value_for_key analytics_configuration_of_yojson "AnalyticsConfiguration")
         _list path;
     nlp_configuration =
       option_of_yojson (value_for_key nlp_configuration_of_yojson "NlpConfiguration") _list path;
     datastore_name =
       option_of_yojson (value_for_key datastore_name_of_yojson "DatastoreName") _list path;
     datastore_id = value_for_key datastore_id_of_yojson "DatastoreId" _list path;
   }
    : update_fhir_datastore_request)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : internal_server_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : conflict_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : access_denied_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let amazon_resource_name_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : untag_resource_request)

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
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : tag_resource_request)

let job_id_of_yojson = string_of_yojson

let job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CANCEL_FAILED" -> CANCEL_FAILED
    | `String "CANCEL_COMPLETED" -> CANCEL_COMPLETED
    | `String "CANCEL_IN_PROGRESS" -> CANCEL_IN_PROGRESS
    | `String "CANCEL_SUBMITTED" -> CANCEL_SUBMITTED
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String "COMPLETED_WITH_ERRORS" -> COMPLETED_WITH_ERRORS
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "QUEUED" -> QUEUED
    | `String "SUBMITTED" -> SUBMITTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "JobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "JobStatus")
     : job_status)
    : job_status)

let start_fhir_import_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     datastore_id = option_of_yojson (value_for_key datastore_id_of_yojson "DatastoreId") _list path;
     job_status = value_for_key job_status_of_yojson "JobStatus" _list path;
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
   }
    : start_fhir_import_job_response)

let job_name_of_yojson = string_of_yojson
let s3_uri_of_yojson = string_of_yojson

let input_data_config_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "S3Uri" -> S3Uri (s3_uri_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "InputDataConfig" unknown)
    : input_data_config)

let s3_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id = value_for_key encryption_key_i_d_of_yojson "KmsKeyId" _list path;
     s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path;
   }
    : s3_configuration)

let output_data_config_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "S3Configuration" -> S3Configuration (s3_configuration_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "OutputDataConfig" unknown)
    : output_data_config)

let iam_role_arn_of_yojson = string_of_yojson
let client_token_string_of_yojson = string_of_yojson

let start_fhir_import_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     validation_level =
       option_of_yojson (value_for_key validation_level_of_yojson "ValidationLevel") _list path;
     client_token =
       option_of_yojson (value_for_key client_token_string_of_yojson "ClientToken") _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     datastore_id = value_for_key datastore_id_of_yojson "DatastoreId" _list path;
     job_output_data_config =
       value_for_key output_data_config_of_yojson "JobOutputDataConfig" _list path;
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
   }
    : start_fhir_import_job_request)

let start_fhir_export_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     datastore_id = option_of_yojson (value_for_key datastore_id_of_yojson "DatastoreId") _list path;
     job_status = value_for_key job_status_of_yojson "JobStatus" _list path;
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
   }
    : start_fhir_export_job_response)

let start_fhir_export_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       option_of_yojson (value_for_key client_token_string_of_yojson "ClientToken") _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     datastore_id = value_for_key datastore_id_of_yojson "DatastoreId" _list path;
     output_data_config = value_for_key output_data_config_of_yojson "OutputDataConfig" _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
   }
    : start_fhir_export_job_request)

let next_token_of_yojson = string_of_yojson
let message_of_yojson = string_of_yojson
let max_results_integer_of_yojson = int_of_yojson

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path }
    : list_tags_for_resource_request)

let generic_long_of_yojson = long_of_yojson
let generic_double_of_yojson = double_of_yojson

let job_progress_report_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     throughput = option_of_yojson (value_for_key generic_double_of_yojson "Throughput") _list path;
     total_number_of_files_read_with_customer_error =
       option_of_yojson
         (value_for_key generic_long_of_yojson "TotalNumberOfFilesReadWithCustomerError")
         _list path;
     total_number_of_resources_with_customer_error =
       option_of_yojson
         (value_for_key generic_long_of_yojson "TotalNumberOfResourcesWithCustomerError")
         _list path;
     total_number_of_resources_imported =
       option_of_yojson
         (value_for_key generic_long_of_yojson "TotalNumberOfResourcesImported")
         _list path;
     total_number_of_resources_scanned =
       option_of_yojson
         (value_for_key generic_long_of_yojson "TotalNumberOfResourcesScanned")
         _list path;
     total_number_of_imported_files =
       option_of_yojson
         (value_for_key generic_long_of_yojson "TotalNumberOfImportedFiles")
         _list path;
     total_size_of_scanned_files_in_m_b =
       option_of_yojson
         (value_for_key generic_double_of_yojson "TotalSizeOfScannedFilesInMB")
         _list path;
     total_number_of_scanned_files =
       option_of_yojson
         (value_for_key generic_long_of_yojson "TotalNumberOfScannedFiles")
         _list path;
   }
    : job_progress_report)

let import_job_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     validation_level =
       option_of_yojson (value_for_key validation_level_of_yojson "ValidationLevel") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     job_progress_report =
       option_of_yojson (value_for_key job_progress_report_of_yojson "JobProgressReport") _list path;
     job_output_data_config =
       option_of_yojson
         (value_for_key output_data_config_of_yojson "JobOutputDataConfig")
         _list path;
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     datastore_id = value_for_key datastore_id_of_yojson "DatastoreId" _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     submit_time = value_for_key timestamp_of_yojson "SubmitTime" _list path;
     job_status = value_for_key job_status_of_yojson "JobStatus" _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
   }
    : import_job_properties)

let import_job_properties_list_of_yojson tree path =
  list_of_yojson import_job_properties_of_yojson tree path

let list_fhir_import_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     import_job_properties_list =
       value_for_key import_job_properties_list_of_yojson "ImportJobPropertiesList" _list path;
   }
    : list_fhir_import_jobs_response)

let list_fhir_import_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     submitted_after =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmittedAfter") _list path;
     submitted_before =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmittedBefore") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     datastore_id = value_for_key datastore_id_of_yojson "DatastoreId" _list path;
   }
    : list_fhir_import_jobs_request)

let export_job_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     output_data_config = value_for_key output_data_config_of_yojson "OutputDataConfig" _list path;
     datastore_id = value_for_key datastore_id_of_yojson "DatastoreId" _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     submit_time = value_for_key timestamp_of_yojson "SubmitTime" _list path;
     job_status = value_for_key job_status_of_yojson "JobStatus" _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
   }
    : export_job_properties)

let export_job_properties_list_of_yojson tree path =
  list_of_yojson export_job_properties_of_yojson tree path

let list_fhir_export_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     export_job_properties_list =
       value_for_key export_job_properties_list_of_yojson "ExportJobPropertiesList" _list path;
   }
    : list_fhir_export_jobs_response)

let list_fhir_export_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     submitted_after =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmittedAfter") _list path;
     submitted_before =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmittedBefore") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     datastore_id = value_for_key datastore_id_of_yojson "DatastoreId" _list path;
   }
    : list_fhir_export_jobs_request)

let datastore_properties_list_of_yojson tree path =
  list_of_yojson datastore_properties_of_yojson tree path

let list_fhir_datastores_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     datastore_properties_list =
       value_for_key datastore_properties_list_of_yojson "DatastorePropertiesList" _list path;
   }
    : list_fhir_datastores_response)

let datastore_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_after = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAfter") _list path;
     created_before =
       option_of_yojson (value_for_key timestamp_of_yojson "CreatedBefore") _list path;
     datastore_status =
       option_of_yojson (value_for_key datastore_status_of_yojson "DatastoreStatus") _list path;
     datastore_name =
       option_of_yojson (value_for_key datastore_name_of_yojson "DatastoreName") _list path;
   }
    : datastore_filter)

let list_fhir_datastores_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     filter = option_of_yojson (value_for_key datastore_filter_of_yojson "Filter") _list path;
   }
    : list_fhir_datastores_request)

let describe_fhir_import_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     import_job_properties =
       value_for_key import_job_properties_of_yojson "ImportJobProperties" _list path;
   }
    : describe_fhir_import_job_response)

let describe_fhir_import_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     datastore_id = value_for_key datastore_id_of_yojson "DatastoreId" _list path;
   }
    : describe_fhir_import_job_request)

let describe_fhir_export_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_job_properties =
       value_for_key export_job_properties_of_yojson "ExportJobProperties" _list path;
   }
    : describe_fhir_export_job_response)

let describe_fhir_export_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     datastore_id = value_for_key datastore_id_of_yojson "DatastoreId" _list path;
   }
    : describe_fhir_export_job_request)

let describe_fhir_datastore_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     datastore_properties =
       value_for_key datastore_properties_of_yojson "DatastoreProperties" _list path;
   }
    : describe_fhir_datastore_response)

let describe_fhir_datastore_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ datastore_id = value_for_key datastore_id_of_yojson "DatastoreId" _list path }
    : describe_fhir_datastore_request)

let bounded_length_string_of_yojson = string_of_yojson

let delete_fhir_datastore_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     datastore_endpoint =
       value_for_key bounded_length_string_of_yojson "DatastoreEndpoint" _list path;
     datastore_status = value_for_key datastore_status_of_yojson "DatastoreStatus" _list path;
     datastore_arn = value_for_key datastore_arn_of_yojson "DatastoreArn" _list path;
     datastore_id = value_for_key datastore_id_of_yojson "DatastoreId" _list path;
   }
    : delete_fhir_datastore_response)

let delete_fhir_datastore_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ datastore_id = value_for_key datastore_id_of_yojson "DatastoreId" _list path }
    : delete_fhir_datastore_request)

let create_fhir_datastore_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     datastore_endpoint =
       value_for_key bounded_length_string_of_yojson "DatastoreEndpoint" _list path;
     datastore_status = value_for_key datastore_status_of_yojson "DatastoreStatus" _list path;
     datastore_arn = value_for_key datastore_arn_of_yojson "DatastoreArn" _list path;
     datastore_id = value_for_key datastore_id_of_yojson "DatastoreId" _list path;
   }
    : create_fhir_datastore_response)

let create_fhir_datastore_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profile_configuration =
       option_of_yojson
         (value_for_key profile_configuration_of_yojson "ProfileConfiguration")
         _list path;
     nlp_configuration =
       option_of_yojson (value_for_key nlp_configuration_of_yojson "NlpConfiguration") _list path;
     analytics_configuration =
       option_of_yojson
         (value_for_key analytics_configuration_of_yojson "AnalyticsConfiguration")
         _list path;
     identity_provider_configuration =
       option_of_yojson
         (value_for_key identity_provider_configuration_of_yojson "IdentityProviderConfiguration")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_token =
       option_of_yojson (value_for_key client_token_string_of_yojson "ClientToken") _list path;
     preload_data_config =
       option_of_yojson (value_for_key preload_data_config_of_yojson "PreloadDataConfig") _list path;
     sse_configuration =
       option_of_yojson (value_for_key sse_configuration_of_yojson "SseConfiguration") _list path;
     datastore_type_version = value_for_key fhir_version_of_yojson "DatastoreTypeVersion" _list path;
     datastore_name =
       option_of_yojson (value_for_key datastore_name_of_yojson "DatastoreName") _list path;
   }
    : create_fhir_datastore_request)
