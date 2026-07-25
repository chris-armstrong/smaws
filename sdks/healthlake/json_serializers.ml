open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let amazon_resource_name_to_yojson = string_to_yojson

let analytics_status_to_yojson (x : analytics_status) =
  match x with
  | ENABLED -> `String "ENABLED"
  | ENABLING -> `String "ENABLING"
  | DISABLED -> `String "DISABLED"
  | DISABLING -> `String "DISABLING"
  | PAUSING -> `String "PAUSING"
  | PAUSED -> `String "PAUSED"

let analytics_configuration_to_yojson (x : analytics_configuration) =
  assoc_to_yojson [ ("Status", option_to_yojson analytics_status_to_yojson x.status) ]

let authorization_strategy_to_yojson (x : authorization_strategy) =
  match x with
  | SMARTV1 -> `String "SMART_ON_FHIR_V1"
  | SMART_ON_FHIR -> `String "SMART_ON_FHIR"
  | AWS_AUTH -> `String "AWS_AUTH"

let boolean__to_yojson = bool_to_yojson
let bounded_length_string_to_yojson = string_to_yojson
let client_token_string_to_yojson = string_to_yojson

let cmk_type_to_yojson (x : cmk_type) =
  match x with
  | CM_CMK -> `String "CUSTOMER_MANAGED_KMS_KEY"
  | AO_CMK -> `String "AWS_OWNED_KMS_KEY"

let configuration_metadata_to_yojson = string_to_yojson

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let datastore_status_to_yojson (x : datastore_status) =
  match x with
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"
  | DELETED -> `String "DELETED"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | UPDATING -> `String "UPDATING"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"

let datastore_arn_to_yojson = string_to_yojson
let datastore_id_to_yojson = string_to_yojson

let create_fhir_datastore_response_to_yojson (x : create_fhir_datastore_response) =
  assoc_to_yojson
    [
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
      ("DatastoreArn", Some (datastore_arn_to_yojson x.datastore_arn));
      ("DatastoreStatus", Some (datastore_status_to_yojson x.datastore_status));
      ("DatastoreEndpoint", Some (bounded_length_string_to_yojson x.datastore_endpoint));
    ]

let default_profiles_to_yojson tree = list_to_yojson string__to_yojson tree

let profile_configuration_to_yojson (x : profile_configuration) =
  assoc_to_yojson
    [ ("DefaultProfiles", option_to_yojson default_profiles_to_yojson x.default_profiles) ]

let nlp_status_to_yojson (x : nlp_status) =
  match x with
  | ENABLED -> `String "ENABLED"
  | DISABLED -> `String "DISABLED"
  | ENABLING -> `String "ENABLING"
  | DISABLING -> `String "DISABLING"

let nlp_configuration_to_yojson (x : nlp_configuration) =
  assoc_to_yojson [ ("Status", option_to_yojson nlp_status_to_yojson x.status) ]

let lambda_arn_to_yojson = string_to_yojson

let identity_provider_configuration_to_yojson (x : identity_provider_configuration) =
  assoc_to_yojson
    [
      ("AuthorizationStrategy", Some (authorization_strategy_to_yojson x.authorization_strategy));
      ( "FineGrainedAuthorizationEnabled",
        option_to_yojson boolean__to_yojson x.fine_grained_authorization_enabled );
      ("Metadata", option_to_yojson configuration_metadata_to_yojson x.metadata);
      ("IdpLambdaArn", option_to_yojson lambda_arn_to_yojson x.idp_lambda_arn);
    ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let preload_data_type_to_yojson (x : preload_data_type) =
  match x with SYNTHEA -> `String "SYNTHEA"

let preload_data_config_to_yojson (x : preload_data_config) =
  assoc_to_yojson [ ("PreloadDataType", Some (preload_data_type_to_yojson x.preload_data_type)) ]

let encryption_key_i_d_to_yojson = string_to_yojson

let kms_encryption_config_to_yojson (x : kms_encryption_config) =
  assoc_to_yojson
    [
      ("CmkType", Some (cmk_type_to_yojson x.cmk_type));
      ("KmsKeyId", option_to_yojson encryption_key_i_d_to_yojson x.kms_key_id);
    ]

let sse_configuration_to_yojson (x : sse_configuration) =
  assoc_to_yojson
    [ ("KmsEncryptionConfig", Some (kms_encryption_config_to_yojson x.kms_encryption_config)) ]

let fhir_version_to_yojson (x : fhir_version) = match x with R4 -> `String "R4"
let datastore_name_to_yojson = string_to_yojson

let create_fhir_datastore_request_to_yojson (x : create_fhir_datastore_request) =
  assoc_to_yojson
    [
      ("DatastoreName", option_to_yojson datastore_name_to_yojson x.datastore_name);
      ("DatastoreTypeVersion", Some (fhir_version_to_yojson x.datastore_type_version));
      ("SseConfiguration", option_to_yojson sse_configuration_to_yojson x.sse_configuration);
      ("PreloadDataConfig", option_to_yojson preload_data_config_to_yojson x.preload_data_config);
      ( "ClientToken",
        Some
          (client_token_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "IdentityProviderConfiguration",
        option_to_yojson identity_provider_configuration_to_yojson x.identity_provider_configuration
      );
      ( "AnalyticsConfiguration",
        option_to_yojson analytics_configuration_to_yojson x.analytics_configuration );
      ("NlpConfiguration", option_to_yojson nlp_configuration_to_yojson x.nlp_configuration);
      ( "ProfileConfiguration",
        option_to_yojson profile_configuration_to_yojson x.profile_configuration );
    ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let datastore_filter_to_yojson (x : datastore_filter) =
  assoc_to_yojson
    [
      ("DatastoreName", option_to_yojson datastore_name_to_yojson x.datastore_name);
      ("DatastoreStatus", option_to_yojson datastore_status_to_yojson x.datastore_status);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
    ]

let error_category_to_yojson (x : error_category) =
  match x with
  | RETRYABLE_ERROR -> `String "RETRYABLE_ERROR"
  | NON_RETRYABLE_ERROR -> `String "NON_RETRYABLE_ERROR"

let error_message_to_yojson = string_to_yojson

let error_cause_to_yojson (x : error_cause) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("ErrorCategory", option_to_yojson error_category_to_yojson x.error_category);
    ]

let datastore_properties_to_yojson (x : datastore_properties) =
  assoc_to_yojson
    [
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
      ("DatastoreArn", Some (datastore_arn_to_yojson x.datastore_arn));
      ("DatastoreName", option_to_yojson datastore_name_to_yojson x.datastore_name);
      ("DatastoreStatus", Some (datastore_status_to_yojson x.datastore_status));
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("DatastoreTypeVersion", Some (fhir_version_to_yojson x.datastore_type_version));
      ("DatastoreEndpoint", Some (string__to_yojson x.datastore_endpoint));
      ("SseConfiguration", option_to_yojson sse_configuration_to_yojson x.sse_configuration);
      ("PreloadDataConfig", option_to_yojson preload_data_config_to_yojson x.preload_data_config);
      ( "IdentityProviderConfiguration",
        option_to_yojson identity_provider_configuration_to_yojson x.identity_provider_configuration
      );
      ("ErrorCause", option_to_yojson error_cause_to_yojson x.error_cause);
      ("NlpConfiguration", option_to_yojson nlp_configuration_to_yojson x.nlp_configuration);
      ( "AnalyticsConfiguration",
        option_to_yojson analytics_configuration_to_yojson x.analytics_configuration );
      ( "ProfileConfiguration",
        option_to_yojson profile_configuration_to_yojson x.profile_configuration );
    ]

let datastore_properties_list_to_yojson tree = list_to_yojson datastore_properties_to_yojson tree

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let delete_fhir_datastore_response_to_yojson (x : delete_fhir_datastore_response) =
  assoc_to_yojson
    [
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
      ("DatastoreArn", Some (datastore_arn_to_yojson x.datastore_arn));
      ("DatastoreStatus", Some (datastore_status_to_yojson x.datastore_status));
      ("DatastoreEndpoint", Some (bounded_length_string_to_yojson x.datastore_endpoint));
    ]

let delete_fhir_datastore_request_to_yojson (x : delete_fhir_datastore_request) =
  assoc_to_yojson [ ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id)) ]

let describe_fhir_datastore_response_to_yojson (x : describe_fhir_datastore_response) =
  assoc_to_yojson
    [ ("DatastoreProperties", Some (datastore_properties_to_yojson x.datastore_properties)) ]

let describe_fhir_datastore_request_to_yojson (x : describe_fhir_datastore_request) =
  assoc_to_yojson [ ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id)) ]

let message_to_yojson = string_to_yojson
let iam_role_arn_to_yojson = string_to_yojson
let s3_uri_to_yojson = string_to_yojson

let s3_configuration_to_yojson (x : s3_configuration) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("KmsKeyId", Some (encryption_key_i_d_to_yojson x.kms_key_id));
    ]

let output_data_config_to_yojson (x : output_data_config) =
  match x with
  | S3Configuration arg ->
      assoc_to_yojson [ ("S3Configuration", Some (s3_configuration_to_yojson arg)) ]

let job_status_to_yojson (x : job_status) =
  match x with
  | SUBMITTED -> `String "SUBMITTED"
  | QUEUED -> `String "QUEUED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED_WITH_ERRORS -> `String "COMPLETED_WITH_ERRORS"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | CANCEL_SUBMITTED -> `String "CANCEL_SUBMITTED"
  | CANCEL_IN_PROGRESS -> `String "CANCEL_IN_PROGRESS"
  | CANCEL_COMPLETED -> `String "CANCEL_COMPLETED"
  | CANCEL_FAILED -> `String "CANCEL_FAILED"

let job_name_to_yojson = string_to_yojson
let job_id_to_yojson = string_to_yojson

let export_job_properties_to_yojson (x : export_job_properties) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", Some (job_status_to_yojson x.job_status));
      ("SubmitTime", Some (timestamp_to_yojson x.submit_time));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("Message", option_to_yojson message_to_yojson x.message);
    ]

let describe_fhir_export_job_response_to_yojson (x : describe_fhir_export_job_response) =
  assoc_to_yojson
    [ ("ExportJobProperties", Some (export_job_properties_to_yojson x.export_job_properties)) ]

let describe_fhir_export_job_request_to_yojson (x : describe_fhir_export_job_request) =
  assoc_to_yojson
    [
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let validation_level_to_yojson (x : validation_level) =
  match x with
  | STRICT -> `String "strict"
  | STRUCTURE_ONLY -> `String "structure-only"
  | MINIMAL -> `String "minimal"

let generic_double_to_yojson = double_to_yojson
let generic_long_to_yojson = long_to_yojson

let job_progress_report_to_yojson (x : job_progress_report) =
  assoc_to_yojson
    [
      ( "TotalNumberOfScannedFiles",
        option_to_yojson generic_long_to_yojson x.total_number_of_scanned_files );
      ( "TotalSizeOfScannedFilesInMB",
        option_to_yojson generic_double_to_yojson x.total_size_of_scanned_files_in_m_b );
      ( "TotalNumberOfImportedFiles",
        option_to_yojson generic_long_to_yojson x.total_number_of_imported_files );
      ( "TotalNumberOfResourcesScanned",
        option_to_yojson generic_long_to_yojson x.total_number_of_resources_scanned );
      ( "TotalNumberOfResourcesImported",
        option_to_yojson generic_long_to_yojson x.total_number_of_resources_imported );
      ( "TotalNumberOfResourcesWithCustomerError",
        option_to_yojson generic_long_to_yojson x.total_number_of_resources_with_customer_error );
      ( "TotalNumberOfFilesReadWithCustomerError",
        option_to_yojson generic_long_to_yojson x.total_number_of_files_read_with_customer_error );
      ("Throughput", option_to_yojson generic_double_to_yojson x.throughput);
    ]

let input_data_config_to_yojson (x : input_data_config) =
  match x with S3Uri arg -> assoc_to_yojson [ ("S3Uri", Some (s3_uri_to_yojson arg)) ]

let import_job_properties_to_yojson (x : import_job_properties) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", Some (job_status_to_yojson x.job_status));
      ("SubmitTime", Some (timestamp_to_yojson x.submit_time));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("JobOutputDataConfig", option_to_yojson output_data_config_to_yojson x.job_output_data_config);
      ("JobProgressReport", option_to_yojson job_progress_report_to_yojson x.job_progress_report);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("ValidationLevel", option_to_yojson validation_level_to_yojson x.validation_level);
    ]

let describe_fhir_import_job_response_to_yojson (x : describe_fhir_import_job_response) =
  assoc_to_yojson
    [ ("ImportJobProperties", Some (import_job_properties_to_yojson x.import_job_properties)) ]

let describe_fhir_import_job_request_to_yojson (x : describe_fhir_import_job_request) =
  assoc_to_yojson
    [
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let export_job_properties_list_to_yojson tree = list_to_yojson export_job_properties_to_yojson tree

let update_fhir_datastore_response_to_yojson (x : update_fhir_datastore_response) =
  assoc_to_yojson
    [ ("DatastoreProperties", Some (datastore_properties_to_yojson x.datastore_properties)) ]

let update_fhir_datastore_request_to_yojson (x : update_fhir_datastore_request) =
  assoc_to_yojson
    [
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
      ("DatastoreName", option_to_yojson datastore_name_to_yojson x.datastore_name);
      ("NlpConfiguration", option_to_yojson nlp_configuration_to_yojson x.nlp_configuration);
      ( "AnalyticsConfiguration",
        option_to_yojson analytics_configuration_to_yojson x.analytics_configuration );
      ( "ProfileConfiguration",
        option_to_yojson profile_configuration_to_yojson x.profile_configuration );
      ( "IdentityProviderConfiguration",
        option_to_yojson identity_provider_configuration_to_yojson x.identity_provider_configuration
      );
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let start_fhir_import_job_response_to_yojson (x : start_fhir_import_job_response) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("JobStatus", Some (job_status_to_yojson x.job_status));
      ("DatastoreId", option_to_yojson datastore_id_to_yojson x.datastore_id);
    ]

let start_fhir_import_job_request_to_yojson (x : start_fhir_import_job_request) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("JobOutputDataConfig", Some (output_data_config_to_yojson x.job_output_data_config));
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ( "ClientToken",
        Some
          (client_token_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("ValidationLevel", option_to_yojson validation_level_to_yojson x.validation_level);
    ]

let start_fhir_export_job_response_to_yojson (x : start_fhir_export_job_response) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("JobStatus", Some (job_status_to_yojson x.job_status));
      ("DatastoreId", option_to_yojson datastore_id_to_yojson x.datastore_id);
    ]

let start_fhir_export_job_request_to_yojson (x : start_fhir_export_job_request) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ( "ClientToken",
        Some
          (client_token_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let next_token_to_yojson = string_to_yojson
let import_job_properties_list_to_yojson tree = list_to_yojson import_job_properties_to_yojson tree

let list_fhir_import_jobs_response_to_yojson (x : list_fhir_import_jobs_response) =
  assoc_to_yojson
    [
      ( "ImportJobPropertiesList",
        Some (import_job_properties_list_to_yojson x.import_job_properties_list) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_integer_to_yojson = int_to_yojson

let list_fhir_import_jobs_request_to_yojson (x : list_fhir_import_jobs_request) =
  assoc_to_yojson
    [
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("SubmittedBefore", option_to_yojson timestamp_to_yojson x.submitted_before);
      ("SubmittedAfter", option_to_yojson timestamp_to_yojson x.submitted_after);
    ]

let list_fhir_export_jobs_response_to_yojson (x : list_fhir_export_jobs_response) =
  assoc_to_yojson
    [
      ( "ExportJobPropertiesList",
        Some (export_job_properties_list_to_yojson x.export_job_properties_list) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_fhir_export_jobs_request_to_yojson (x : list_fhir_export_jobs_request) =
  assoc_to_yojson
    [
      ("DatastoreId", Some (datastore_id_to_yojson x.datastore_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("SubmittedBefore", option_to_yojson timestamp_to_yojson x.submitted_before);
      ("SubmittedAfter", option_to_yojson timestamp_to_yojson x.submitted_after);
    ]

let list_fhir_datastores_response_to_yojson (x : list_fhir_datastores_response) =
  assoc_to_yojson
    [
      ( "DatastorePropertiesList",
        Some (datastore_properties_list_to_yojson x.datastore_properties_list) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_fhir_datastores_request_to_yojson (x : list_fhir_datastores_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson datastore_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]
