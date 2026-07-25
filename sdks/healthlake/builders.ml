open Types

let make_analytics_configuration ?status:(status_ : analytics_status option) () =
  ({ status = status_ } : analytics_configuration)

let make_create_fhir_datastore_response ~datastore_id:(datastore_id_ : datastore_id)
    ~datastore_arn:(datastore_arn_ : datastore_arn)
    ~datastore_status:(datastore_status_ : datastore_status)
    ~datastore_endpoint:(datastore_endpoint_ : bounded_length_string) () =
  ({
     datastore_id = datastore_id_;
     datastore_arn = datastore_arn_;
     datastore_status = datastore_status_;
     datastore_endpoint = datastore_endpoint_;
   }
    : create_fhir_datastore_response)

let make_profile_configuration ?default_profiles:(default_profiles_ : default_profiles option) () =
  ({ default_profiles = default_profiles_ } : profile_configuration)

let make_nlp_configuration ?status:(status_ : nlp_status option) () =
  ({ status = status_ } : nlp_configuration)

let make_identity_provider_configuration
    ?fine_grained_authorization_enabled:(fine_grained_authorization_enabled_ : boolean_ option)
    ?metadata:(metadata_ : configuration_metadata option)
    ?idp_lambda_arn:(idp_lambda_arn_ : lambda_arn option)
    ~authorization_strategy:(authorization_strategy_ : authorization_strategy) () =
  ({
     authorization_strategy = authorization_strategy_;
     fine_grained_authorization_enabled = fine_grained_authorization_enabled_;
     metadata = metadata_;
     idp_lambda_arn = idp_lambda_arn_;
   }
    : identity_provider_configuration)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_preload_data_config ~preload_data_type:(preload_data_type_ : preload_data_type) () =
  ({ preload_data_type = preload_data_type_ } : preload_data_config)

let make_kms_encryption_config ?kms_key_id:(kms_key_id_ : encryption_key_i_d option)
    ~cmk_type:(cmk_type_ : cmk_type) () =
  ({ cmk_type = cmk_type_; kms_key_id = kms_key_id_ } : kms_encryption_config)

let make_sse_configuration ~kms_encryption_config:(kms_encryption_config_ : kms_encryption_config)
    () =
  ({ kms_encryption_config = kms_encryption_config_ } : sse_configuration)

let make_create_fhir_datastore_request ?datastore_name:(datastore_name_ : datastore_name option)
    ?sse_configuration:(sse_configuration_ : sse_configuration option)
    ?preload_data_config:(preload_data_config_ : preload_data_config option)
    ?client_token:(client_token_ : client_token_string option) ?tags:(tags_ : tag_list option)
    ?identity_provider_configuration:
      (identity_provider_configuration_ : identity_provider_configuration option)
    ?analytics_configuration:(analytics_configuration_ : analytics_configuration option)
    ?nlp_configuration:(nlp_configuration_ : nlp_configuration option)
    ?profile_configuration:(profile_configuration_ : profile_configuration option)
    ~datastore_type_version:(datastore_type_version_ : fhir_version) () =
  ({
     datastore_name = datastore_name_;
     datastore_type_version = datastore_type_version_;
     sse_configuration = sse_configuration_;
     preload_data_config = preload_data_config_;
     client_token = client_token_;
     tags = tags_;
     identity_provider_configuration = identity_provider_configuration_;
     analytics_configuration = analytics_configuration_;
     nlp_configuration = nlp_configuration_;
     profile_configuration = profile_configuration_;
   }
    : create_fhir_datastore_request)

let make_datastore_filter ?datastore_name:(datastore_name_ : datastore_name option)
    ?datastore_status:(datastore_status_ : datastore_status option)
    ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option) () =
  ({
     datastore_name = datastore_name_;
     datastore_status = datastore_status_;
     created_before = created_before_;
     created_after = created_after_;
   }
    : datastore_filter)

let make_error_cause ?error_message:(error_message_ : error_message option)
    ?error_category:(error_category_ : error_category option) () =
  ({ error_message = error_message_; error_category = error_category_ } : error_cause)

let make_datastore_properties ?datastore_name:(datastore_name_ : datastore_name option)
    ?created_at:(created_at_ : timestamp option)
    ?sse_configuration:(sse_configuration_ : sse_configuration option)
    ?preload_data_config:(preload_data_config_ : preload_data_config option)
    ?identity_provider_configuration:
      (identity_provider_configuration_ : identity_provider_configuration option)
    ?error_cause:(error_cause_ : error_cause option)
    ?nlp_configuration:(nlp_configuration_ : nlp_configuration option)
    ?analytics_configuration:(analytics_configuration_ : analytics_configuration option)
    ?profile_configuration:(profile_configuration_ : profile_configuration option)
    ~datastore_id:(datastore_id_ : datastore_id) ~datastore_arn:(datastore_arn_ : datastore_arn)
    ~datastore_status:(datastore_status_ : datastore_status)
    ~datastore_type_version:(datastore_type_version_ : fhir_version)
    ~datastore_endpoint:(datastore_endpoint_ : string_) () =
  ({
     datastore_id = datastore_id_;
     datastore_arn = datastore_arn_;
     datastore_name = datastore_name_;
     datastore_status = datastore_status_;
     created_at = created_at_;
     datastore_type_version = datastore_type_version_;
     datastore_endpoint = datastore_endpoint_;
     sse_configuration = sse_configuration_;
     preload_data_config = preload_data_config_;
     identity_provider_configuration = identity_provider_configuration_;
     error_cause = error_cause_;
     nlp_configuration = nlp_configuration_;
     analytics_configuration = analytics_configuration_;
     profile_configuration = profile_configuration_;
   }
    : datastore_properties)

let make_delete_fhir_datastore_response ~datastore_id:(datastore_id_ : datastore_id)
    ~datastore_arn:(datastore_arn_ : datastore_arn)
    ~datastore_status:(datastore_status_ : datastore_status)
    ~datastore_endpoint:(datastore_endpoint_ : bounded_length_string) () =
  ({
     datastore_id = datastore_id_;
     datastore_arn = datastore_arn_;
     datastore_status = datastore_status_;
     datastore_endpoint = datastore_endpoint_;
   }
    : delete_fhir_datastore_response)

let make_delete_fhir_datastore_request ~datastore_id:(datastore_id_ : datastore_id) () =
  ({ datastore_id = datastore_id_ } : delete_fhir_datastore_request)

let make_describe_fhir_datastore_response
    ~datastore_properties:(datastore_properties_ : datastore_properties) () =
  ({ datastore_properties = datastore_properties_ } : describe_fhir_datastore_response)

let make_describe_fhir_datastore_request ~datastore_id:(datastore_id_ : datastore_id) () =
  ({ datastore_id = datastore_id_ } : describe_fhir_datastore_request)

let make_s3_configuration ~s3_uri:(s3_uri_ : s3_uri) ~kms_key_id:(kms_key_id_ : encryption_key_i_d)
    () =
  ({ s3_uri = s3_uri_; kms_key_id = kms_key_id_ } : s3_configuration)

let make_export_job_properties ?job_name:(job_name_ : job_name option)
    ?end_time:(end_time_ : timestamp option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?message:(message_ : message option) ~job_id:(job_id_ : job_id)
    ~job_status:(job_status_ : job_status) ~submit_time:(submit_time_ : timestamp)
    ~datastore_id:(datastore_id_ : datastore_id)
    ~output_data_config:(output_data_config_ : output_data_config) () =
  ({
     job_id = job_id_;
     job_name = job_name_;
     job_status = job_status_;
     submit_time = submit_time_;
     end_time = end_time_;
     datastore_id = datastore_id_;
     output_data_config = output_data_config_;
     data_access_role_arn = data_access_role_arn_;
     message = message_;
   }
    : export_job_properties)

let make_describe_fhir_export_job_response
    ~export_job_properties:(export_job_properties_ : export_job_properties) () =
  ({ export_job_properties = export_job_properties_ } : describe_fhir_export_job_response)

let make_describe_fhir_export_job_request ~datastore_id:(datastore_id_ : datastore_id)
    ~job_id:(job_id_ : job_id) () =
  ({ datastore_id = datastore_id_; job_id = job_id_ } : describe_fhir_export_job_request)

let make_job_progress_report
    ?total_number_of_scanned_files:(total_number_of_scanned_files_ : generic_long option)
    ?total_size_of_scanned_files_in_m_b:
      (total_size_of_scanned_files_in_m_b_ : generic_double option)
    ?total_number_of_imported_files:(total_number_of_imported_files_ : generic_long option)
    ?total_number_of_resources_scanned:(total_number_of_resources_scanned_ : generic_long option)
    ?total_number_of_resources_imported:(total_number_of_resources_imported_ : generic_long option)
    ?total_number_of_resources_with_customer_error:
      (total_number_of_resources_with_customer_error_ : generic_long option)
    ?total_number_of_files_read_with_customer_error:
      (total_number_of_files_read_with_customer_error_ : generic_long option)
    ?throughput:(throughput_ : generic_double option) () =
  ({
     total_number_of_scanned_files = total_number_of_scanned_files_;
     total_size_of_scanned_files_in_m_b = total_size_of_scanned_files_in_m_b_;
     total_number_of_imported_files = total_number_of_imported_files_;
     total_number_of_resources_scanned = total_number_of_resources_scanned_;
     total_number_of_resources_imported = total_number_of_resources_imported_;
     total_number_of_resources_with_customer_error = total_number_of_resources_with_customer_error_;
     total_number_of_files_read_with_customer_error =
       total_number_of_files_read_with_customer_error_;
     throughput = throughput_;
   }
    : job_progress_report)

let make_import_job_properties ?job_name:(job_name_ : job_name option)
    ?end_time:(end_time_ : timestamp option)
    ?job_output_data_config:(job_output_data_config_ : output_data_config option)
    ?job_progress_report:(job_progress_report_ : job_progress_report option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?message:(message_ : message option)
    ?validation_level:(validation_level_ : validation_level option) ~job_id:(job_id_ : job_id)
    ~job_status:(job_status_ : job_status) ~submit_time:(submit_time_ : timestamp)
    ~datastore_id:(datastore_id_ : datastore_id)
    ~input_data_config:(input_data_config_ : input_data_config) () =
  ({
     job_id = job_id_;
     job_name = job_name_;
     job_status = job_status_;
     submit_time = submit_time_;
     end_time = end_time_;
     datastore_id = datastore_id_;
     input_data_config = input_data_config_;
     job_output_data_config = job_output_data_config_;
     job_progress_report = job_progress_report_;
     data_access_role_arn = data_access_role_arn_;
     message = message_;
     validation_level = validation_level_;
   }
    : import_job_properties)

let make_describe_fhir_import_job_response
    ~import_job_properties:(import_job_properties_ : import_job_properties) () =
  ({ import_job_properties = import_job_properties_ } : describe_fhir_import_job_response)

let make_describe_fhir_import_job_request ~datastore_id:(datastore_id_ : datastore_id)
    ~job_id:(job_id_ : job_id) () =
  ({ datastore_id = datastore_id_; job_id = job_id_ } : describe_fhir_import_job_request)

let make_update_fhir_datastore_response
    ~datastore_properties:(datastore_properties_ : datastore_properties) () =
  ({ datastore_properties = datastore_properties_ } : update_fhir_datastore_response)

let make_update_fhir_datastore_request ?datastore_name:(datastore_name_ : datastore_name option)
    ?nlp_configuration:(nlp_configuration_ : nlp_configuration option)
    ?analytics_configuration:(analytics_configuration_ : analytics_configuration option)
    ?profile_configuration:(profile_configuration_ : profile_configuration option)
    ?identity_provider_configuration:
      (identity_provider_configuration_ : identity_provider_configuration option)
    ~datastore_id:(datastore_id_ : datastore_id) () =
  ({
     datastore_id = datastore_id_;
     datastore_name = datastore_name_;
     nlp_configuration = nlp_configuration_;
     analytics_configuration = analytics_configuration_;
     profile_configuration = profile_configuration_;
     identity_provider_configuration = identity_provider_configuration_;
   }
    : update_fhir_datastore_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_start_fhir_import_job_response ?datastore_id:(datastore_id_ : datastore_id option)
    ~job_id:(job_id_ : job_id) ~job_status:(job_status_ : job_status) () =
  ({ job_id = job_id_; job_status = job_status_; datastore_id = datastore_id_ }
    : start_fhir_import_job_response)

let make_start_fhir_import_job_request ?job_name:(job_name_ : job_name option)
    ?client_token:(client_token_ : client_token_string option)
    ?validation_level:(validation_level_ : validation_level option)
    ~input_data_config:(input_data_config_ : input_data_config)
    ~job_output_data_config:(job_output_data_config_ : output_data_config)
    ~datastore_id:(datastore_id_ : datastore_id)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn) () =
  ({
     job_name = job_name_;
     input_data_config = input_data_config_;
     job_output_data_config = job_output_data_config_;
     datastore_id = datastore_id_;
     data_access_role_arn = data_access_role_arn_;
     client_token = client_token_;
     validation_level = validation_level_;
   }
    : start_fhir_import_job_request)

let make_start_fhir_export_job_response ?datastore_id:(datastore_id_ : datastore_id option)
    ~job_id:(job_id_ : job_id) ~job_status:(job_status_ : job_status) () =
  ({ job_id = job_id_; job_status = job_status_; datastore_id = datastore_id_ }
    : start_fhir_export_job_response)

let make_start_fhir_export_job_request ?job_name:(job_name_ : job_name option)
    ?client_token:(client_token_ : client_token_string option)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~datastore_id:(datastore_id_ : datastore_id)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn) () =
  ({
     job_name = job_name_;
     output_data_config = output_data_config_;
     datastore_id = datastore_id_;
     data_access_role_arn = data_access_role_arn_;
     client_token = client_token_;
   }
    : start_fhir_export_job_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_list_fhir_import_jobs_response ?next_token:(next_token_ : next_token option)
    ~import_job_properties_list:(import_job_properties_list_ : import_job_properties_list) () =
  ({ import_job_properties_list = import_job_properties_list_; next_token = next_token_ }
    : list_fhir_import_jobs_response)

let make_list_fhir_import_jobs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_integer option) ?job_name:(job_name_ : job_name option)
    ?job_status:(job_status_ : job_status option)
    ?submitted_before:(submitted_before_ : timestamp option)
    ?submitted_after:(submitted_after_ : timestamp option)
    ~datastore_id:(datastore_id_ : datastore_id) () =
  ({
     datastore_id = datastore_id_;
     next_token = next_token_;
     max_results = max_results_;
     job_name = job_name_;
     job_status = job_status_;
     submitted_before = submitted_before_;
     submitted_after = submitted_after_;
   }
    : list_fhir_import_jobs_request)

let make_list_fhir_export_jobs_response ?next_token:(next_token_ : next_token option)
    ~export_job_properties_list:(export_job_properties_list_ : export_job_properties_list) () =
  ({ export_job_properties_list = export_job_properties_list_; next_token = next_token_ }
    : list_fhir_export_jobs_response)

let make_list_fhir_export_jobs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_integer option) ?job_name:(job_name_ : job_name option)
    ?job_status:(job_status_ : job_status option)
    ?submitted_before:(submitted_before_ : timestamp option)
    ?submitted_after:(submitted_after_ : timestamp option)
    ~datastore_id:(datastore_id_ : datastore_id) () =
  ({
     datastore_id = datastore_id_;
     next_token = next_token_;
     max_results = max_results_;
     job_name = job_name_;
     job_status = job_status_;
     submitted_before = submitted_before_;
     submitted_after = submitted_after_;
   }
    : list_fhir_export_jobs_request)

let make_list_fhir_datastores_response ?next_token:(next_token_ : next_token option)
    ~datastore_properties_list:(datastore_properties_list_ : datastore_properties_list) () =
  ({ datastore_properties_list = datastore_properties_list_; next_token = next_token_ }
    : list_fhir_datastores_response)

let make_list_fhir_datastores_request ?filter:(filter_ : datastore_filter option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_integer option) () =
  ({ filter = filter_; next_token = next_token_; max_results = max_results_ }
    : list_fhir_datastores_request)
