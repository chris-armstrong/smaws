type nonrec validation_level =
  | MINIMAL [@ocaml.doc ""]
  | STRUCTURE_ONLY [@ocaml.doc ""]
  | STRICT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec validation_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The user input parameter was invalid.\n"]

type nonrec datastore_id = string [@@ocaml.doc ""]

type nonrec datastore_arn = string [@@ocaml.doc ""]

type nonrec datastore_name = string [@@ocaml.doc ""]

type nonrec datastore_status =
  | UPDATE_FAILED [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec fhir_version = R4 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec cmk_type = AO_CMK [@ocaml.doc ""] | CM_CMK [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec encryption_key_i_d = string [@@ocaml.doc ""]

type nonrec kms_encryption_config = {
  kms_key_id : encryption_key_i_d option;
      [@ocaml.doc
        "The Key Management Service (KMS) encryption key id/alias used to encrypt the data store \
         contents at rest.\n"]
  cmk_type : cmk_type; [@ocaml.doc "The type of customer-managed-key (CMK) used for encryption.\n"]
}
[@@ocaml.doc
  "The customer-managed-key (CMK) used when creating a data store. If a customer-owned key is not \
   specified, an AWS-owned key is used for encryption. \n"]

type nonrec sse_configuration = {
  kms_encryption_config : kms_encryption_config;
      [@ocaml.doc
        "The Key Management Service (KMS) encryption configuration used to provide details for \
         data encryption.\n"]
}
[@@ocaml.doc
  "The server-side encryption key configuration for a customer-provided encryption key.\n"]

type nonrec preload_data_type = SYNTHEA [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec preload_data_config = {
  preload_data_type : preload_data_type;
      [@ocaml.doc "The type of preloaded data. Only Synthea preloaded data is supported.\n"]
}
[@@ocaml.doc "The input properties for the preloaded (Synthea) data store.\n"]

type nonrec authorization_strategy =
  | AWS_AUTH [@ocaml.doc ""]
  | SMART_ON_FHIR [@ocaml.doc ""]
  | SMARTV1 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec configuration_metadata = string [@@ocaml.doc ""]

type nonrec lambda_arn = string [@@ocaml.doc ""]

type nonrec identity_provider_configuration = {
  idp_lambda_arn : lambda_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Lambda function to use to decode the access token \
         created by the authorization server.\n"]
  metadata : configuration_metadata option;
      [@ocaml.doc
        "The JSON metadata elements to use in your identity provider configuration. Required \
         elements are listed based on the launch specification of the SMART application. For more \
         information on all possible elements, see \
         {{:https://build.fhir.org/ig/HL7/smart-app-launch/conformance.html#metadata}Metadata} in \
         SMART's App Launch specification.\n\n\
        \  [authorization_endpoint]: The URL to the OAuth2 authorization endpoint.\n\
        \ \n\
        \   [grant_types_supported]: An array of grant types that are supported at the token \
         endpoint. You must provide at least one grant type option. Valid options are \
         [authorization_code] and [client_credentials].\n\
        \  \n\
        \    [token_endpoint]: The URL to the OAuth2 token endpoint.\n\
        \   \n\
        \     [capabilities]: An array of strings of the SMART capabilities that the authorization \
         server supports.\n\
        \    \n\
        \      [code_challenge_methods_supported]: An array of strings of supported PKCE code \
         challenge methods. You must include the [S256] method in the array of PKCE code challenge \
         methods.\n\
        \     "]
  fine_grained_authorization_enabled : boolean_ option;
      [@ocaml.doc
        "The parameter to enable SMART on FHIR fine-grained authorization for the data store.\n"]
  authorization_strategy : authorization_strategy;
      [@ocaml.doc
        "The authorization strategy selected when the HealthLake data store is created.\n\n\
        \  HealthLake provides support for both SMART on FHIR V1 and V2 as described below.\n\
        \  \n\
        \   {ul\n\
        \         {-   [SMART_ON_FHIR_V1] \226\128\147 Support for only SMART on FHIR V1, which \
         includes [read] (read/search) and [write] (create/update/delete) permissions.\n\
        \             \n\
        \              }\n\
        \         {-   [SMART_ON_FHIR] \226\128\147 Support for both SMART on FHIR V1 and V2, \
         which includes [create], [read], [update], [delete], and [search] permissions.\n\
        \             \n\
        \              }\n\
        \         {-   [AWS_AUTH] \226\128\147 The default HealthLake authorization strategy; not \
         affiliated with SMART on FHIR.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   "]
}
[@@ocaml.doc "The identity provider configuration selected when the data store was created.\n"]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec error_category = NON_RETRYABLE_ERROR [@ocaml.doc ""] | RETRYABLE_ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec error_cause = {
  error_category : error_category option; [@ocaml.doc "The error category for [ErrorCause].\n"]
  error_message : error_message option; [@ocaml.doc "The error message text for [ErrorCause].\n"]
}
[@@ocaml.doc "The error information for [CreateFHIRDatastore] and [DeleteFHIRDatastore] actions.\n"]

type nonrec nlp_status =
  | DISABLING [@ocaml.doc ""]
  | ENABLING [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec nlp_configuration = {
  status : nlp_status option; [@ocaml.doc "The status of the NLP configuration.\n"]
}
[@@ocaml.doc "The natural language processing (NLP) configuration for a data store.\n"]

type nonrec analytics_status =
  | PAUSED [@ocaml.doc ""]
  | PAUSING [@ocaml.doc ""]
  | DISABLING [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | ENABLING [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec analytics_configuration = {
  status : analytics_status option; [@ocaml.doc "The status of the analytics configuration.\n"]
}
[@@ocaml.doc "The analytics configuration for a data store.\n"]

type nonrec default_profiles = string_ list [@@ocaml.doc ""]

type nonrec profile_configuration = {
  default_profiles : default_profiles option;
      [@ocaml.doc "The list of default profiles for the data store.\n"]
}
[@@ocaml.doc "The profile configuration for a data store.\n"]

type nonrec datastore_properties = {
  profile_configuration : profile_configuration option;
      [@ocaml.doc "The profile configuration for the data store.\n"]
  analytics_configuration : analytics_configuration option;
      [@ocaml.doc "The analytics configuration for the data store.\n"]
  nlp_configuration : nlp_configuration option;
      [@ocaml.doc "The natural language processing (NLP) configuration for the data store.\n"]
  error_cause : error_cause option;
      [@ocaml.doc "The error cause for the current data store operation.\n"]
  identity_provider_configuration : identity_provider_configuration option;
      [@ocaml.doc "The identity provider selected during data store creation.\n"]
  preload_data_config : preload_data_config option;
      [@ocaml.doc "The preloaded Synthea data configuration for the data store.\n"]
  sse_configuration : sse_configuration option;
      [@ocaml.doc
        " The server-side encryption key configuration for a customer provided encryption key.\n"]
  datastore_endpoint : string_; [@ocaml.doc "The AWS endpoint for the data store.\n"]
  datastore_type_version : fhir_version;
      [@ocaml.doc
        "The FHIR release version supported by the data store. Current support is for version [R4].\n"]
  created_at : timestamp option; [@ocaml.doc "The time the data store was created. \n"]
  datastore_status : datastore_status; [@ocaml.doc "The data store status.\n"]
  datastore_name : datastore_name option; [@ocaml.doc "The data store name.\n"]
  datastore_arn : datastore_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) used in the creation of the data store.\n"]
  datastore_id : datastore_id; [@ocaml.doc "The data store identifier.\n"]
}
[@@ocaml.doc "The data store properties.\n"]

type nonrec update_fhir_datastore_response = {
  datastore_properties : datastore_properties; [@ocaml.doc "The data store properties.\n"]
}
[@@ocaml.doc ""]

type nonrec update_fhir_datastore_request = {
  identity_provider_configuration : identity_provider_configuration option;
      [@ocaml.doc "The identity provider configuration for the data store.\n"]
  profile_configuration : profile_configuration option;
      [@ocaml.doc "The profile configuration for the data store.\n"]
  analytics_configuration : analytics_configuration option;
      [@ocaml.doc "The analytics configuration for the data store.\n"]
  nlp_configuration : nlp_configuration option;
      [@ocaml.doc "The natural language processing (NLP) configuration for the data store.\n"]
  datastore_name : datastore_name option; [@ocaml.doc "The data store name.\n"]
  datastore_id : datastore_id; [@ocaml.doc "The data store identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The user has exceeded their maximum number of allowed calls to the given API. \n"]

type nonrec resource_not_found_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The requested data store was not found.\n"]

type nonrec internal_server_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "An unknown internal error occurred in the service.\n"]

type nonrec conflict_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The data store is in a transition state and the user requested action cannot be performed.\n"]

type nonrec access_denied_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "Access is denied. Your account is not authorized to perform this operation.\n"]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list; [@ocaml.doc "The keys for the tags to be removed from the data store.\n"]
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the data store from which tags are being removed.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value; [@ocaml.doc " The value portion of a tag. Tag values are case-sensitive.\n"]
  key : tag_key; [@ocaml.doc "The key portion of a tag. Tag keys are case sensitive. \n"]
}
[@@ocaml.doc
  "A label consisting of a user-defined key and value. The form for tags is \\{\"Key\", \"Value\"\\}\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_list;
      [@ocaml.doc "The user-specified key and value pair tags being added to a data store.\n"]
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that grants access to the data store tags are being added \
         to.\n"]
}
[@@ocaml.doc ""]

type nonrec job_id = string [@@ocaml.doc ""]

type nonrec job_status =
  | CANCEL_FAILED [@ocaml.doc ""]
  | CANCEL_COMPLETED [@ocaml.doc ""]
  | CANCEL_IN_PROGRESS [@ocaml.doc ""]
  | CANCEL_SUBMITTED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | COMPLETED_WITH_ERRORS [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | QUEUED [@ocaml.doc ""]
  | SUBMITTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec start_fhir_import_job_response = {
  datastore_id : datastore_id option; [@ocaml.doc "The data store identifier.\n"]
  job_status : job_status; [@ocaml.doc "The import job status.\n"]
  job_id : job_id; [@ocaml.doc "The import job identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec job_name = string [@@ocaml.doc ""]

type nonrec s3_uri = string [@@ocaml.doc ""]

type nonrec input_data_config =
  | S3Uri of s3_uri
      [@ocaml.doc
        "The [S3Uri] is the user-specified S3 location of the FHIR data to be imported into AWS \
         HealthLake.\n"]
[@@ocaml.doc " The import job input properties.\n"]

type nonrec s3_configuration = {
  kms_key_id : encryption_key_i_d;
      [@ocaml.doc "The Key Management Service (KMS) key ID used to access the S3 bucket. \n"]
  s3_uri : s3_uri;
      [@ocaml.doc
        "The [S3Uri] is the user-specified S3 location of the FHIR data to be imported into AWS \
         HealthLake.\n"]
}
[@@ocaml.doc
  "The configuration of the S3 bucket for either an import or export job. This includes assigning \
   access permissions.\n"]

type nonrec output_data_config =
  | S3Configuration of s3_configuration
      [@ocaml.doc "The output data configuration supplied when the export job was created. \n"]
[@@ocaml.doc "The output data configuration supplied when the export job was created.\n"]

type nonrec iam_role_arn = string [@@ocaml.doc ""]

type nonrec client_token_string = string [@@ocaml.doc ""]

type nonrec start_fhir_import_job_request = {
  validation_level : validation_level option;
      [@ocaml.doc "The validation level of the import job.\n"]
  client_token : client_token_string option;
      [@ocaml.doc "The optional user-provided token used for ensuring API idempotency.\n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that grants access permission to AWS HealthLake.\n"]
  datastore_id : datastore_id; [@ocaml.doc "The data store identifier.\n"]
  job_output_data_config : output_data_config; [@ocaml.doc ""]
  input_data_config : input_data_config;
      [@ocaml.doc "The input properties for the import job request.\n"]
  job_name : job_name option; [@ocaml.doc "The import job name.\n"]
}
[@@ocaml.doc ""]

type nonrec start_fhir_export_job_response = {
  datastore_id : datastore_id option;
      [@ocaml.doc "The data store identifier from which files are being exported.\n"]
  job_status : job_status; [@ocaml.doc "The export job status.\n"]
  job_id : job_id; [@ocaml.doc "The export job identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec start_fhir_export_job_request = {
  client_token : client_token_string option;
      [@ocaml.doc "An optional user provided token used for ensuring API idempotency.\n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) used during initiation of the export job.\n"]
  datastore_id : datastore_id;
      [@ocaml.doc "The data store identifier from which files are being exported.\n"]
  output_data_config : output_data_config;
      [@ocaml.doc "The output data configuration supplied when the export job was started.\n"]
  job_name : job_name option; [@ocaml.doc "The export job name.\n"]
}
[@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec message = string [@@ocaml.doc ""]

type nonrec max_results_integer = int [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc "Returns a list of tags associated with a data store. \n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the data store to which tags are being added.\n"]
}
[@@ocaml.doc ""]

type nonrec generic_long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec generic_double = float [@@ocaml.doc ""]

type nonrec job_progress_report = {
  throughput : generic_double option;
      [@ocaml.doc "The transaction rate the import job is processed at.\n"]
  total_number_of_files_read_with_customer_error : generic_long option;
      [@ocaml.doc
        "The number of files that failed to be read from the S3 input bucket due to customer error.\n"]
  total_number_of_resources_with_customer_error : generic_long option;
      [@ocaml.doc "The number of resources that failed due to customer error.\n"]
  total_number_of_resources_imported : generic_long option;
      [@ocaml.doc "The number of resources imported.\n"]
  total_number_of_resources_scanned : generic_long option;
      [@ocaml.doc "The number of resources scanned from the S3 input bucket.\n"]
  total_number_of_imported_files : generic_long option;
      [@ocaml.doc "The number of files imported.\n"]
  total_size_of_scanned_files_in_m_b : generic_double option;
      [@ocaml.doc "The size (in MB) of files scanned from the S3 input bucket.\n"]
  total_number_of_scanned_files : generic_long option;
      [@ocaml.doc "The number of files scanned from the S3 input bucket.\n"]
}
[@@ocaml.doc "The progress report for the import job.\n"]

type nonrec import_job_properties = {
  validation_level : validation_level option;
      [@ocaml.doc "The validation level of the import job.\n"]
  message : message option;
      [@ocaml.doc
        "An explanation of any errors that might have occurred during the FHIR import job.\n"]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that grants AWS HealthLake access to the input data.\n"]
  job_progress_report : job_progress_report option;
      [@ocaml.doc
        "Displays the progress of the import job, including total resources scanned, total \
         resources imported, and total size of data imported.\n"]
  job_output_data_config : output_data_config option; [@ocaml.doc ""]
  input_data_config : input_data_config;
      [@ocaml.doc "The input data configuration supplied when the import job was created.\n"]
  datastore_id : datastore_id; [@ocaml.doc "The data store identifier. \n"]
  end_time : timestamp option; [@ocaml.doc "The time the import job was completed.\n"]
  submit_time : timestamp; [@ocaml.doc "The time the import job was submitted for processing.\n"]
  job_status : job_status; [@ocaml.doc "The import job status.\n"]
  job_name : job_name option; [@ocaml.doc "The import job name.\n"]
  job_id : job_id; [@ocaml.doc "The import job identifier.\n"]
}
[@@ocaml.doc "The import job properties.\n"]

type nonrec import_job_properties_list = import_job_properties list [@@ocaml.doc ""]

type nonrec list_fhir_import_jobs_response = {
  next_token : next_token option;
      [@ocaml.doc "The pagination token used to identify the next page of results to return.\n"]
  import_job_properties_list : import_job_properties_list;
      [@ocaml.doc "The properties for listed import jobs.\n"]
}
[@@ocaml.doc ""]

type nonrec list_fhir_import_jobs_request = {
  submitted_after : timestamp option;
      [@ocaml.doc
        "Limits the response to FHIR import jobs submitted after a user-specified date.\n"]
  submitted_before : timestamp option;
      [@ocaml.doc
        "Limits the response to FHIR import jobs submitted before a user- specified date. \n"]
  job_status : job_status option;
      [@ocaml.doc "Limits the response to the import job with the specified job status. \n"]
  job_name : job_name option;
      [@ocaml.doc "Limits the response to the import job with the specified job name. \n"]
  max_results : max_results_integer option;
      [@ocaml.doc
        "Limits the number of results returned for [ListFHIRImportJobs] to a maximum quantity \
         specified by the user.\n"]
  next_token : next_token option;
      [@ocaml.doc "The pagination token used to identify the next page of results to return.\n"]
  datastore_id : datastore_id;
      [@ocaml.doc "Limits the response to the import job with the specified data store ID. \n"]
}
[@@ocaml.doc ""]

type nonrec export_job_properties = {
  message : message option;
      [@ocaml.doc "An explanation of any errors that might have occurred during the export job.\n"]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) used during the initiation of the export job.\n"]
  output_data_config : output_data_config;
      [@ocaml.doc "The output data configuration supplied when the export job was created.\n"]
  datastore_id : datastore_id;
      [@ocaml.doc "The data store identifier from which files are being exported.\n"]
  end_time : timestamp option; [@ocaml.doc "The time the export job completed.\n"]
  submit_time : timestamp; [@ocaml.doc "The time the export job was initiated.\n"]
  job_status : job_status; [@ocaml.doc "The export job status.\n"]
  job_name : job_name option; [@ocaml.doc "The export job name.\n"]
  job_id : job_id; [@ocaml.doc "The export job identifier.\n"]
}
[@@ocaml.doc "The properties of a FHIR export job.\n"]

type nonrec export_job_properties_list = export_job_properties list [@@ocaml.doc ""]

type nonrec list_fhir_export_jobs_response = {
  next_token : next_token option;
      [@ocaml.doc "The pagination token used to identify the next page of results to return.\n"]
  export_job_properties_list : export_job_properties_list;
      [@ocaml.doc "The properties of listed FHIR export jobs.\n"]
}
[@@ocaml.doc ""]

type nonrec list_fhir_export_jobs_request = {
  submitted_after : timestamp option;
      [@ocaml.doc
        "Limits the response to FHIR export jobs submitted after a user-specified date.\n"]
  submitted_before : timestamp option;
      [@ocaml.doc
        "Limits the response to FHIR export jobs submitted before a user- specified date.\n"]
  job_status : job_status option;
      [@ocaml.doc "Limits the response to export jobs with the specified job status. \n"]
  job_name : job_name option;
      [@ocaml.doc "Limits the response to the export job with the specified job name. \n"]
  max_results : max_results_integer option;
      [@ocaml.doc
        "Limits the number of results returned for a ListFHIRExportJobs to a maximum quantity \
         specified by the user.\n"]
  next_token : next_token option;
      [@ocaml.doc "A pagination token used to identify the next page of results to return.\n"]
  datastore_id : datastore_id;
      [@ocaml.doc "Limits the response to the export job with the specified data store ID. \n"]
}
[@@ocaml.doc ""]

type nonrec datastore_properties_list = datastore_properties list [@@ocaml.doc ""]

type nonrec list_fhir_datastores_response = {
  next_token : next_token option;
      [@ocaml.doc "The pagination token used to retrieve the next page of results.\n"]
  datastore_properties_list : datastore_properties_list;
      [@ocaml.doc "The properties associated with all listed data stores.\n"]
}
[@@ocaml.doc ""]

type nonrec datastore_filter = {
  created_after : timestamp option;
      [@ocaml.doc
        "Filter to set cutoff dates for records. All data stores created after the specified date \
         are included in the results.\n"]
  created_before : timestamp option;
      [@ocaml.doc
        "Filter to set cutoff dates for records. All data stores created before the specified date \
         are included in the results. \n"]
  datastore_status : datastore_status option; [@ocaml.doc "Filter data store results by status.\n"]
  datastore_name : datastore_name option; [@ocaml.doc "Filter data store results by name.\n"]
}
[@@ocaml.doc "The filters applied to a data store query.\n"]

type nonrec list_fhir_datastores_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of data stores returned on a page.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token used to retrieve the next page of data stores when results are paginated.\n"]
  filter : datastore_filter option;
      [@ocaml.doc "List all filters associated with a FHIR data store request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fhir_import_job_response = {
  import_job_properties : import_job_properties; [@ocaml.doc "The import job properties.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fhir_import_job_request = {
  job_id : job_id; [@ocaml.doc "The import job identifier.\n"]
  datastore_id : datastore_id; [@ocaml.doc "The data store identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fhir_export_job_response = {
  export_job_properties : export_job_properties; [@ocaml.doc "The export job properties.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fhir_export_job_request = {
  job_id : job_id; [@ocaml.doc "The export job identifier.\n"]
  datastore_id : datastore_id;
      [@ocaml.doc "The data store identifier from which FHIR data is being exported from.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fhir_datastore_response = {
  datastore_properties : datastore_properties; [@ocaml.doc "The data store properties.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fhir_datastore_request = {
  datastore_id : datastore_id; [@ocaml.doc "The data store identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec bounded_length_string = string [@@ocaml.doc ""]

type nonrec delete_fhir_datastore_response = {
  datastore_endpoint : bounded_length_string;
      [@ocaml.doc "The AWS endpoint of the data store to be deleted.\n"]
  datastore_status : datastore_status; [@ocaml.doc "The data store status.\n"]
  datastore_arn : datastore_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that grants access permission to AWS HealthLake.\n"]
  datastore_id : datastore_id; [@ocaml.doc "The AWS-generated ID for the deleted data store.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_fhir_datastore_request = {
  datastore_id : datastore_id;
      [@ocaml.doc " The AWS-generated identifier for the data store to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec create_fhir_datastore_response = {
  datastore_endpoint : bounded_length_string;
      [@ocaml.doc "The AWS endpoint created for the data store.\n"]
  datastore_status : datastore_status; [@ocaml.doc "The data store status.\n"]
  datastore_arn : datastore_arn; [@ocaml.doc "The Amazon Resource Name (ARN) for the data store.\n"]
  datastore_id : datastore_id; [@ocaml.doc "The data store identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec create_fhir_datastore_request = {
  profile_configuration : profile_configuration option;
      [@ocaml.doc "The profile configuration for the data store.\n"]
  nlp_configuration : nlp_configuration option;
      [@ocaml.doc "The natural language processing (NLP) configuration for the data store.\n"]
  analytics_configuration : analytics_configuration option;
      [@ocaml.doc "The analytics configuration for the data store.\n"]
  identity_provider_configuration : identity_provider_configuration option;
      [@ocaml.doc "The identity provider configuration to use for the data store.\n"]
  tags : tag_list option;
      [@ocaml.doc "The resource tags applied to a data store when it is created.\n"]
  client_token : client_token_string option;
      [@ocaml.doc "An optional user-provided token to ensure API idempotency.\n"]
  preload_data_config : preload_data_config option;
      [@ocaml.doc
        "An optional parameter to preload (import) open source Synthea FHIR data upon creation of \
         the data store.\n"]
  sse_configuration : sse_configuration option;
      [@ocaml.doc
        "The server-side encryption key configuration for a customer-provided encryption key \
         specified for creating a data store. \n"]
  datastore_type_version : fhir_version;
      [@ocaml.doc
        "The FHIR release version supported by the data store. Current support is for version [R4].\n"]
  datastore_name : datastore_name option; [@ocaml.doc "The data store name (user-generated).\n"]
}
[@@ocaml.doc ""]
