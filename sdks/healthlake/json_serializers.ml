open Smaws_Lib.Json.SerializeHelpers
open Types

let validation_level_to_yojson (x : validation_level) =
  match x with
  | MINIMAL -> `String "minimal"
  | STRUCTURE_ONLY -> `String "structure-only"
  | STRICT -> `String "strict"

let string__to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let datastore_id_to_yojson = string_to_yojson
let datastore_arn_to_yojson = string_to_yojson
let datastore_name_to_yojson = string_to_yojson

let datastore_status_to_yojson (x : datastore_status) =
  match x with
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | UPDATING -> `String "UPDATING"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETED -> `String "DELETED"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let fhir_version_to_yojson (x : fhir_version) = match x with R4 -> `String "R4"

let cmk_type_to_yojson (x : cmk_type) =
  match x with
  | AO_CMK -> `String "AWS_OWNED_KMS_KEY"
  | CM_CMK -> `String "CUSTOMER_MANAGED_KMS_KEY"

let encryption_key_i_d_to_yojson = string_to_yojson

let kms_encryption_config_to_yojson (x : kms_encryption_config) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson encryption_key_i_d_to_yojson x.kms_key_id);
      ("CmkType", Some (cmk_type_to_yojson x.cmk_type));
    ]

let sse_configuration_to_yojson (x : sse_configuration) =
  assoc_to_yojson
    [ ("KmsEncryptionConfig", Some (kms_encryption_config_to_yojson x.kms_encryption_config)) ]

let preload_data_type_to_yojson (x : preload_data_type) =
  match x with SYNTHEA -> `String "SYNTHEA"

let preload_data_config_to_yojson (x : preload_data_config) =
  assoc_to_yojson [ ("PreloadDataType", Some (preload_data_type_to_yojson x.preload_data_type)) ]

let authorization_strategy_to_yojson (x : authorization_strategy) =
  match x with
  | AWS_AUTH -> `String "AWS_AUTH"
  | SMART_ON_FHIR -> `String "SMART_ON_FHIR"
  | SMARTV1 -> `String "SMART_ON_FHIR_V1"

let boolean__to_yojson = bool_to_yojson
let configuration_metadata_to_yojson = string_to_yojson
let lambda_arn_to_yojson = string_to_yojson

let identity_provider_configuration_to_yojson (x : identity_provider_configuration) =
  assoc_to_yojson
    [
      ("IdpLambdaArn", option_to_yojson lambda_arn_to_yojson x.idp_lambda_arn);
      ("Metadata", option_to_yojson configuration_metadata_to_yojson x.metadata);
      ( "FineGrainedAuthorizationEnabled",
        option_to_yojson boolean__to_yojson x.fine_grained_authorization_enabled );
      ("AuthorizationStrategy", Some (authorization_strategy_to_yojson x.authorization_strategy));
    ]

let error_message_to_yojson = string_to_yojson

let error_category_to_yojson (x : error_category) =
  match x with
  | NON_RETRYABLE_ERROR -> `String "NON_RETRYABLE_ERROR"
  | RETRYABLE_ERROR -> `String "RETRYABLE_ERROR"

let error_cause_to_yojson (x : error_cause) =
  assoc_to_yojson
    [
      ("ErrorCategory", option_to_yojson error_category_to_yojson x.error_category);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let nlp_status_to_yojson (x : nlp_status) =
  match x with
  | DISABLING -> `String "DISABLING"
  | ENABLING -> `String "ENABLING"
  | DISABLED -> `String "DISABLED"
  | ENABLED -> `String "ENABLED"

let nlp_configuration_to_yojson (x : nlp_configuration) =
  assoc_to_yojson [ ("Status", option_to_yojson nlp_status_to_yojson x.status) ]

let analytics_status_to_yojson (x : analytics_status) =
  match x with
  | PAUSED -> `String "PAUSED"
  | PAUSING -> `String "PAUSING"
  | DISABLING -> `String "DISABLING"
  | DISABLED -> `String "DISABLED"
  | ENABLING -> `String "ENABLING"
  | ENABLED -> `String "ENABLED"

let analytics_configuration_to_yojson (x : analytics_configuration) =
  assoc_to_yojson [ ("Status", option_to_yojson analytics_status_to_yojson x.status) ]

let default_profiles_to_yojson tree = list_to_yojson string__to_yojson tree

let profile_configuration_to_yojson (x : profile_configuration) =
  assoc_to_yojson
    [ ("DefaultProfiles", option_to_yojson default_profiles_to_yojson x.default_profiles) ]

let datastore_properties_to_yojson (x : datastore_properties) =
  assoc_to_yojson
    [
      ( "ProfileConfiguration",
        option_to_yojson profile_configuration_to_yojson x.profile_configuration );
      ( "AnalyticsConfiguration",
        option_to_yojson analytics_configuration_to_yojson x.analytics_configuration );
      ("NlpConfiguration", option_to_yojson nlp_configuration_to_yojson x.nlp_configuration);
      ("ErrorCause", option_to_yojson error_cause_to_yojson x.error_cause);
      ( "IdentityProviderConfiguration",
        option_to_yojson identity_provider_configuration_to_yojson x.identity_provider_configuration
      );
      ("PreloadDataConfig", option_to_yojson preload_data_config_to_yojson x.preload_data_config);
      ("SseConfiguration", option_to_yojson sse_configuration_to_yojson x.sse_configuration);
      ("DatastoreEndpoint", Some (string__to_yojson x.datastore_endpoint));
      ("DatastoreTypeVersion", Some (fhir_version_to_yojson x.datastore_type_version));
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("DatastoreStatus", Some (datastore_status_to_yojson x.datastore_status));
      ("DatastoreName", option_to_yojson datastore_name_to_yojson x.datastore_name);
      ("DatastoreArn", Some (datastore_arn_to_yojson x.datastore_arn));
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
    ]

let update_fhir_datastore_response_to_yojson (x : update_fhir_datastore_response) =
  assoc_to_yojson
    [ ("DatastoreProperties", Some (datastore_properties_to_yojson x.datastore_properties)) ]

let update_fhir_datastore_request_to_yojson (x : update_fhir_datastore_request) =
  assoc_to_yojson
    [
      ( "IdentityProviderConfiguration",
        option_to_yojson identity_provider_configuration_to_yojson x.identity_provider_configuration
      );
      ( "ProfileConfiguration",
        option_to_yojson profile_configuration_to_yojson x.profile_configuration );
      ( "AnalyticsConfiguration",
        option_to_yojson analytics_configuration_to_yojson x.analytics_configuration );
      ("NlpConfiguration", option_to_yojson nlp_configuration_to_yojson x.nlp_configuration);
      ("DatastoreName", option_to_yojson datastore_name_to_yojson x.datastore_name);
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
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
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let job_id_to_yojson = string_to_yojson

let job_status_to_yojson (x : job_status) =
  match x with
  | CANCEL_FAILED -> `String "CANCEL_FAILED"
  | CANCEL_COMPLETED -> `String "CANCEL_COMPLETED"
  | CANCEL_IN_PROGRESS -> `String "CANCEL_IN_PROGRESS"
  | CANCEL_SUBMITTED -> `String "CANCEL_SUBMITTED"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | COMPLETED_WITH_ERRORS -> `String "COMPLETED_WITH_ERRORS"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | QUEUED -> `String "QUEUED"
  | SUBMITTED -> `String "SUBMITTED"

let start_fhir_import_job_response_to_yojson (x : start_fhir_import_job_response) =
  assoc_to_yojson
    [
      ("DatastoreId", option_to_yojson datastore_id_to_yojson x.datastore_id);
      ("JobStatus", Some (job_status_to_yojson x.job_status));
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let job_name_to_yojson = string_to_yojson
let s3_uri_to_yojson = string_to_yojson

let input_data_config_to_yojson (x : input_data_config) =
  match x with S3Uri arg -> assoc_to_yojson [ ("S3Uri", Some (s3_uri_to_yojson arg)) ]

let s3_configuration_to_yojson (x : s3_configuration) =
  assoc_to_yojson
    [
      ("KmsKeyId", Some (encryption_key_i_d_to_yojson x.kms_key_id));
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let output_data_config_to_yojson (x : output_data_config) =
  match x with
  | S3Configuration arg ->
      assoc_to_yojson [ ("S3Configuration", Some (s3_configuration_to_yojson arg)) ]

let iam_role_arn_to_yojson = string_to_yojson
let client_token_string_to_yojson = string_to_yojson

let start_fhir_import_job_request_to_yojson (x : start_fhir_import_job_request) =
  assoc_to_yojson
    [
      ("ValidationLevel", option_to_yojson validation_level_to_yojson x.validation_level);
      ( "ClientToken",
        Some
          (client_token_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
      ("JobOutputDataConfig", Some (output_data_config_to_yojson x.job_output_data_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let start_fhir_export_job_response_to_yojson (x : start_fhir_export_job_response) =
  assoc_to_yojson
    [
      ("DatastoreId", option_to_yojson datastore_id_to_yojson x.datastore_id);
      ("JobStatus", Some (job_status_to_yojson x.job_status));
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let start_fhir_export_job_request_to_yojson (x : start_fhir_export_job_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let next_token_to_yojson = string_to_yojson
let message_to_yojson = string_to_yojson
let max_results_integer_to_yojson = int_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let generic_long_to_yojson = long_to_yojson
let generic_double_to_yojson = double_to_yojson

let job_progress_report_to_yojson (x : job_progress_report) =
  assoc_to_yojson
    [
      ("Throughput", option_to_yojson generic_double_to_yojson x.throughput);
      ( "TotalNumberOfFilesReadWithCustomerError",
        option_to_yojson generic_long_to_yojson x.total_number_of_files_read_with_customer_error );
      ( "TotalNumberOfResourcesWithCustomerError",
        option_to_yojson generic_long_to_yojson x.total_number_of_resources_with_customer_error );
      ( "TotalNumberOfResourcesImported",
        option_to_yojson generic_long_to_yojson x.total_number_of_resources_imported );
      ( "TotalNumberOfResourcesScanned",
        option_to_yojson generic_long_to_yojson x.total_number_of_resources_scanned );
      ( "TotalNumberOfImportedFiles",
        option_to_yojson generic_long_to_yojson x.total_number_of_imported_files );
      ( "TotalSizeOfScannedFilesInMB",
        option_to_yojson generic_double_to_yojson x.total_size_of_scanned_files_in_m_b );
      ( "TotalNumberOfScannedFiles",
        option_to_yojson generic_long_to_yojson x.total_number_of_scanned_files );
    ]

let import_job_properties_to_yojson (x : import_job_properties) =
  assoc_to_yojson
    [
      ("ValidationLevel", option_to_yojson validation_level_to_yojson x.validation_level);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("JobProgressReport", option_to_yojson job_progress_report_to_yojson x.job_progress_report);
      ("JobOutputDataConfig", option_to_yojson output_data_config_to_yojson x.job_output_data_config);
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("SubmitTime", Some (timestamp_to_yojson x.submit_time));
      ("JobStatus", Some (job_status_to_yojson x.job_status));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let import_job_properties_list_to_yojson tree = list_to_yojson import_job_properties_to_yojson tree

let list_fhir_import_jobs_response_to_yojson (x : list_fhir_import_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ImportJobPropertiesList",
        Some (import_job_properties_list_to_yojson x.import_job_properties_list) );
    ]

let list_fhir_import_jobs_request_to_yojson (x : list_fhir_import_jobs_request) =
  assoc_to_yojson
    [
      ("SubmittedAfter", option_to_yojson timestamp_to_yojson x.submitted_after);
      ("SubmittedBefore", option_to_yojson timestamp_to_yojson x.submitted_before);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
    ]

let export_job_properties_to_yojson (x : export_job_properties) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson message_to_yojson x.message);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("SubmitTime", Some (timestamp_to_yojson x.submit_time));
      ("JobStatus", Some (job_status_to_yojson x.job_status));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let export_job_properties_list_to_yojson tree = list_to_yojson export_job_properties_to_yojson tree

let list_fhir_export_jobs_response_to_yojson (x : list_fhir_export_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ExportJobPropertiesList",
        Some (export_job_properties_list_to_yojson x.export_job_properties_list) );
    ]

let list_fhir_export_jobs_request_to_yojson (x : list_fhir_export_jobs_request) =
  assoc_to_yojson
    [
      ("SubmittedAfter", option_to_yojson timestamp_to_yojson x.submitted_after);
      ("SubmittedBefore", option_to_yojson timestamp_to_yojson x.submitted_before);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
    ]

let datastore_properties_list_to_yojson tree = list_to_yojson datastore_properties_to_yojson tree

let list_fhir_datastores_response_to_yojson (x : list_fhir_datastores_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "DatastorePropertiesList",
        Some (datastore_properties_list_to_yojson x.datastore_properties_list) );
    ]

let datastore_filter_to_yojson (x : datastore_filter) =
  assoc_to_yojson
    [
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("DatastoreStatus", option_to_yojson datastore_status_to_yojson x.datastore_status);
      ("DatastoreName", option_to_yojson datastore_name_to_yojson x.datastore_name);
    ]

let list_fhir_datastores_request_to_yojson (x : list_fhir_datastores_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filter", option_to_yojson datastore_filter_to_yojson x.filter);
    ]

let describe_fhir_import_job_response_to_yojson (x : describe_fhir_import_job_response) =
  assoc_to_yojson
    [ ("ImportJobProperties", Some (import_job_properties_to_yojson x.import_job_properties)) ]

let describe_fhir_import_job_request_to_yojson (x : describe_fhir_import_job_request) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
    ]

let describe_fhir_export_job_response_to_yojson (x : describe_fhir_export_job_response) =
  assoc_to_yojson
    [ ("ExportJobProperties", Some (export_job_properties_to_yojson x.export_job_properties)) ]

let describe_fhir_export_job_request_to_yojson (x : describe_fhir_export_job_request) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
    ]

let describe_fhir_datastore_response_to_yojson (x : describe_fhir_datastore_response) =
  assoc_to_yojson
    [ ("DatastoreProperties", Some (datastore_properties_to_yojson x.datastore_properties)) ]

let describe_fhir_datastore_request_to_yojson (x : describe_fhir_datastore_request) =
  assoc_to_yojson [ ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id)) ]

let bounded_length_string_to_yojson = string_to_yojson

let delete_fhir_datastore_response_to_yojson (x : delete_fhir_datastore_response) =
  assoc_to_yojson
    [
      ("DatastoreEndpoint", Some (bounded_length_string_to_yojson x.datastore_endpoint));
      ("DatastoreStatus", Some (datastore_status_to_yojson x.datastore_status));
      ("DatastoreArn", Some (datastore_arn_to_yojson x.datastore_arn));
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
    ]

let delete_fhir_datastore_request_to_yojson (x : delete_fhir_datastore_request) =
  assoc_to_yojson [ ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id)) ]

let create_fhir_datastore_response_to_yojson (x : create_fhir_datastore_response) =
  assoc_to_yojson
    [
      ("DatastoreEndpoint", Some (bounded_length_string_to_yojson x.datastore_endpoint));
      ("DatastoreStatus", Some (datastore_status_to_yojson x.datastore_status));
      ("DatastoreArn", Some (datastore_arn_to_yojson x.datastore_arn));
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
    ]

let create_fhir_datastore_request_to_yojson (x : create_fhir_datastore_request) =
  assoc_to_yojson
    [
      ( "ProfileConfiguration",
        option_to_yojson profile_configuration_to_yojson x.profile_configuration );
      ("NlpConfiguration", option_to_yojson nlp_configuration_to_yojson x.nlp_configuration);
      ( "AnalyticsConfiguration",
        option_to_yojson analytics_configuration_to_yojson x.analytics_configuration );
      ( "IdentityProviderConfiguration",
        option_to_yojson identity_provider_configuration_to_yojson x.identity_provider_configuration
      );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientToken",
        Some
          (client_token_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("PreloadDataConfig", option_to_yojson preload_data_config_to_yojson x.preload_data_config);
      ("SseConfiguration", option_to_yojson sse_configuration_to_yojson x.sse_configuration);
      ("DatastoreTypeVersion", Some (fhir_version_to_yojson x.datastore_type_version));
      ("DatastoreName", option_to_yojson datastore_name_to_yojson x.datastore_name);
    ]
