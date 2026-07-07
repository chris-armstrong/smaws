open Types

let make_kms_encryption_config ?kms_key_id:(kms_key_id_ : encryption_key_i_d option)
    ~cmk_type:(cmk_type_ : cmk_type) () =
  ({ kms_key_id = kms_key_id_; cmk_type = cmk_type_ } : kms_encryption_config)

let make_sse_configuration ~kms_encryption_config:(kms_encryption_config_ : kms_encryption_config)
    () =
  ({ kms_encryption_config = kms_encryption_config_ } : sse_configuration)

let make_preload_data_config ~preload_data_type:(preload_data_type_ : preload_data_type) () =
  ({ preload_data_type = preload_data_type_ } : preload_data_config)

let make_identity_provider_configuration ?idp_lambda_arn:(idp_lambda_arn_ : lambda_arn option)
    ?metadata:(metadata_ : configuration_metadata option)
    ?fine_grained_authorization_enabled:(fine_grained_authorization_enabled_ : boolean_ option)
    ~authorization_strategy:(authorization_strategy_ : authorization_strategy) () =
  ({
     idp_lambda_arn = idp_lambda_arn_;
     metadata = metadata_;
     fine_grained_authorization_enabled = fine_grained_authorization_enabled_;
     authorization_strategy = authorization_strategy_;
   }
    : identity_provider_configuration)

let make_error_cause ?error_category:(error_category_ : error_category option)
    ?error_message:(error_message_ : error_message option) () =
  ({ error_category = error_category_; error_message = error_message_ } : error_cause)

let make_nlp_configuration ?status:(status_ : nlp_status option) () =
  ({ status = status_ } : nlp_configuration)

let make_analytics_configuration ?status:(status_ : analytics_status option) () =
  ({ status = status_ } : analytics_configuration)

let make_profile_configuration ?default_profiles:(default_profiles_ : default_profiles option) () =
  ({ default_profiles = default_profiles_ } : profile_configuration)

let make_datastore_properties
    ?profile_configuration:(profile_configuration_ : profile_configuration option)
    ?analytics_configuration:(analytics_configuration_ : analytics_configuration option)
    ?nlp_configuration:(nlp_configuration_ : nlp_configuration option)
    ?error_cause:(error_cause_ : error_cause option)
    ?identity_provider_configuration:
      (identity_provider_configuration_ : identity_provider_configuration option)
    ?preload_data_config:(preload_data_config_ : preload_data_config option)
    ?sse_configuration:(sse_configuration_ : sse_configuration option)
    ?created_at:(created_at_ : timestamp option)
    ?datastore_name:(datastore_name_ : datastore_name option)
    ~datastore_endpoint:(datastore_endpoint_ : string_)
    ~datastore_type_version:(datastore_type_version_ : fhir_version)
    ~datastore_status:(datastore_status_ : datastore_status)
    ~datastore_arn:(datastore_arn_ : datastore_arn) ~datastore_id:(datastore_id_ : datastore_id) ()
    =
  ({
     profile_configuration = profile_configuration_;
     analytics_configuration = analytics_configuration_;
     nlp_configuration = nlp_configuration_;
     error_cause = error_cause_;
     identity_provider_configuration = identity_provider_configuration_;
     preload_data_config = preload_data_config_;
     sse_configuration = sse_configuration_;
     datastore_endpoint = datastore_endpoint_;
     datastore_type_version = datastore_type_version_;
     created_at = created_at_;
     datastore_status = datastore_status_;
     datastore_name = datastore_name_;
     datastore_arn = datastore_arn_;
     datastore_id = datastore_id_;
   }
    : datastore_properties)

let make_update_fhir_datastore_response
    ~datastore_properties:(datastore_properties_ : datastore_properties) () =
  ({ datastore_properties = datastore_properties_ } : update_fhir_datastore_response)

let make_update_fhir_datastore_request
    ?identity_provider_configuration:
      (identity_provider_configuration_ : identity_provider_configuration option)
    ?profile_configuration:(profile_configuration_ : profile_configuration option)
    ?analytics_configuration:(analytics_configuration_ : analytics_configuration option)
    ?nlp_configuration:(nlp_configuration_ : nlp_configuration option)
    ?datastore_name:(datastore_name_ : datastore_name option)
    ~datastore_id:(datastore_id_ : datastore_id) () =
  ({
     identity_provider_configuration = identity_provider_configuration_;
     profile_configuration = profile_configuration_;
     analytics_configuration = analytics_configuration_;
     nlp_configuration = nlp_configuration_;
     datastore_name = datastore_name_;
     datastore_id = datastore_id_;
   }
    : update_fhir_datastore_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_start_fhir_import_job_response ?datastore_id:(datastore_id_ : datastore_id option)
    ~job_status:(job_status_ : job_status) ~job_id:(job_id_ : job_id) () =
  ({ datastore_id = datastore_id_; job_status = job_status_; job_id = job_id_ }
    : start_fhir_import_job_response)

let make_s3_configuration ~kms_key_id:(kms_key_id_ : encryption_key_i_d) ~s3_uri:(s3_uri_ : s3_uri)
    () =
  ({ kms_key_id = kms_key_id_; s3_uri = s3_uri_ } : s3_configuration)

let make_start_fhir_import_job_request
    ?validation_level:(validation_level_ : validation_level option)
    ?client_token:(client_token_ : client_token_string option)
    ?job_name:(job_name_ : job_name option)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~datastore_id:(datastore_id_ : datastore_id)
    ~job_output_data_config:(job_output_data_config_ : output_data_config)
    ~input_data_config:(input_data_config_ : input_data_config) () =
  ({
     validation_level = validation_level_;
     client_token = client_token_;
     data_access_role_arn = data_access_role_arn_;
     datastore_id = datastore_id_;
     job_output_data_config = job_output_data_config_;
     input_data_config = input_data_config_;
     job_name = job_name_;
   }
    : start_fhir_import_job_request)

let make_start_fhir_export_job_response ?datastore_id:(datastore_id_ : datastore_id option)
    ~job_status:(job_status_ : job_status) ~job_id:(job_id_ : job_id) () =
  ({ datastore_id = datastore_id_; job_status = job_status_; job_id = job_id_ }
    : start_fhir_export_job_response)

let make_start_fhir_export_job_request ?client_token:(client_token_ : client_token_string option)
    ?job_name:(job_name_ : job_name option)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~datastore_id:(datastore_id_ : datastore_id)
    ~output_data_config:(output_data_config_ : output_data_config) () =
  ({
     client_token = client_token_;
     data_access_role_arn = data_access_role_arn_;
     datastore_id = datastore_id_;
     output_data_config = output_data_config_;
     job_name = job_name_;
   }
    : start_fhir_export_job_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_job_progress_report ?throughput:(throughput_ : generic_double option)
    ?total_number_of_files_read_with_customer_error:
      (total_number_of_files_read_with_customer_error_ : generic_long option)
    ?total_number_of_resources_with_customer_error:
      (total_number_of_resources_with_customer_error_ : generic_long option)
    ?total_number_of_resources_imported:(total_number_of_resources_imported_ : generic_long option)
    ?total_number_of_resources_scanned:(total_number_of_resources_scanned_ : generic_long option)
    ?total_number_of_imported_files:(total_number_of_imported_files_ : generic_long option)
    ?total_size_of_scanned_files_in_m_b:
      (total_size_of_scanned_files_in_m_b_ : generic_double option)
    ?total_number_of_scanned_files:(total_number_of_scanned_files_ : generic_long option) () =
  ({
     throughput = throughput_;
     total_number_of_files_read_with_customer_error =
       total_number_of_files_read_with_customer_error_;
     total_number_of_resources_with_customer_error = total_number_of_resources_with_customer_error_;
     total_number_of_resources_imported = total_number_of_resources_imported_;
     total_number_of_resources_scanned = total_number_of_resources_scanned_;
     total_number_of_imported_files = total_number_of_imported_files_;
     total_size_of_scanned_files_in_m_b = total_size_of_scanned_files_in_m_b_;
     total_number_of_scanned_files = total_number_of_scanned_files_;
   }
    : job_progress_report)

let make_import_job_properties ?validation_level:(validation_level_ : validation_level option)
    ?message:(message_ : message option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?job_progress_report:(job_progress_report_ : job_progress_report option)
    ?job_output_data_config:(job_output_data_config_ : output_data_config option)
    ?end_time:(end_time_ : timestamp option) ?job_name:(job_name_ : job_name option)
    ~input_data_config:(input_data_config_ : input_data_config)
    ~datastore_id:(datastore_id_ : datastore_id) ~submit_time:(submit_time_ : timestamp)
    ~job_status:(job_status_ : job_status) ~job_id:(job_id_ : job_id) () =
  ({
     validation_level = validation_level_;
     message = message_;
     data_access_role_arn = data_access_role_arn_;
     job_progress_report = job_progress_report_;
     job_output_data_config = job_output_data_config_;
     input_data_config = input_data_config_;
     datastore_id = datastore_id_;
     end_time = end_time_;
     submit_time = submit_time_;
     job_status = job_status_;
     job_name = job_name_;
     job_id = job_id_;
   }
    : import_job_properties)

let make_list_fhir_import_jobs_response ?next_token:(next_token_ : next_token option)
    ~import_job_properties_list:(import_job_properties_list_ : import_job_properties_list) () =
  ({ next_token = next_token_; import_job_properties_list = import_job_properties_list_ }
    : list_fhir_import_jobs_response)

let make_list_fhir_import_jobs_request ?submitted_after:(submitted_after_ : timestamp option)
    ?submitted_before:(submitted_before_ : timestamp option)
    ?job_status:(job_status_ : job_status option) ?job_name:(job_name_ : job_name option)
    ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : next_token option) ~datastore_id:(datastore_id_ : datastore_id) () =
  ({
     submitted_after = submitted_after_;
     submitted_before = submitted_before_;
     job_status = job_status_;
     job_name = job_name_;
     max_results = max_results_;
     next_token = next_token_;
     datastore_id = datastore_id_;
   }
    : list_fhir_import_jobs_request)

let make_export_job_properties ?message:(message_ : message option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?end_time:(end_time_ : timestamp option) ?job_name:(job_name_ : job_name option)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~datastore_id:(datastore_id_ : datastore_id) ~submit_time:(submit_time_ : timestamp)
    ~job_status:(job_status_ : job_status) ~job_id:(job_id_ : job_id) () =
  ({
     message = message_;
     data_access_role_arn = data_access_role_arn_;
     output_data_config = output_data_config_;
     datastore_id = datastore_id_;
     end_time = end_time_;
     submit_time = submit_time_;
     job_status = job_status_;
     job_name = job_name_;
     job_id = job_id_;
   }
    : export_job_properties)

let make_list_fhir_export_jobs_response ?next_token:(next_token_ : next_token option)
    ~export_job_properties_list:(export_job_properties_list_ : export_job_properties_list) () =
  ({ next_token = next_token_; export_job_properties_list = export_job_properties_list_ }
    : list_fhir_export_jobs_response)

let make_list_fhir_export_jobs_request ?submitted_after:(submitted_after_ : timestamp option)
    ?submitted_before:(submitted_before_ : timestamp option)
    ?job_status:(job_status_ : job_status option) ?job_name:(job_name_ : job_name option)
    ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : next_token option) ~datastore_id:(datastore_id_ : datastore_id) () =
  ({
     submitted_after = submitted_after_;
     submitted_before = submitted_before_;
     job_status = job_status_;
     job_name = job_name_;
     max_results = max_results_;
     next_token = next_token_;
     datastore_id = datastore_id_;
   }
    : list_fhir_export_jobs_request)

let make_list_fhir_datastores_response ?next_token:(next_token_ : next_token option)
    ~datastore_properties_list:(datastore_properties_list_ : datastore_properties_list) () =
  ({ next_token = next_token_; datastore_properties_list = datastore_properties_list_ }
    : list_fhir_datastores_response)

let make_datastore_filter ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option)
    ?datastore_status:(datastore_status_ : datastore_status option)
    ?datastore_name:(datastore_name_ : datastore_name option) () =
  ({
     created_after = created_after_;
     created_before = created_before_;
     datastore_status = datastore_status_;
     datastore_name = datastore_name_;
   }
    : datastore_filter)

let make_list_fhir_datastores_request ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : next_token option) ?filter:(filter_ : datastore_filter option) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_fhir_datastores_request)

let make_describe_fhir_import_job_response
    ~import_job_properties:(import_job_properties_ : import_job_properties) () =
  ({ import_job_properties = import_job_properties_ } : describe_fhir_import_job_response)

let make_describe_fhir_import_job_request ~job_id:(job_id_ : job_id)
    ~datastore_id:(datastore_id_ : datastore_id) () =
  ({ job_id = job_id_; datastore_id = datastore_id_ } : describe_fhir_import_job_request)

let make_describe_fhir_export_job_response
    ~export_job_properties:(export_job_properties_ : export_job_properties) () =
  ({ export_job_properties = export_job_properties_ } : describe_fhir_export_job_response)

let make_describe_fhir_export_job_request ~job_id:(job_id_ : job_id)
    ~datastore_id:(datastore_id_ : datastore_id) () =
  ({ job_id = job_id_; datastore_id = datastore_id_ } : describe_fhir_export_job_request)

let make_describe_fhir_datastore_response
    ~datastore_properties:(datastore_properties_ : datastore_properties) () =
  ({ datastore_properties = datastore_properties_ } : describe_fhir_datastore_response)

let make_describe_fhir_datastore_request ~datastore_id:(datastore_id_ : datastore_id) () =
  ({ datastore_id = datastore_id_ } : describe_fhir_datastore_request)

let make_delete_fhir_datastore_response
    ~datastore_endpoint:(datastore_endpoint_ : bounded_length_string)
    ~datastore_status:(datastore_status_ : datastore_status)
    ~datastore_arn:(datastore_arn_ : datastore_arn) ~datastore_id:(datastore_id_ : datastore_id) ()
    =
  ({
     datastore_endpoint = datastore_endpoint_;
     datastore_status = datastore_status_;
     datastore_arn = datastore_arn_;
     datastore_id = datastore_id_;
   }
    : delete_fhir_datastore_response)

let make_delete_fhir_datastore_request ~datastore_id:(datastore_id_ : datastore_id) () =
  ({ datastore_id = datastore_id_ } : delete_fhir_datastore_request)

let make_create_fhir_datastore_response
    ~datastore_endpoint:(datastore_endpoint_ : bounded_length_string)
    ~datastore_status:(datastore_status_ : datastore_status)
    ~datastore_arn:(datastore_arn_ : datastore_arn) ~datastore_id:(datastore_id_ : datastore_id) ()
    =
  ({
     datastore_endpoint = datastore_endpoint_;
     datastore_status = datastore_status_;
     datastore_arn = datastore_arn_;
     datastore_id = datastore_id_;
   }
    : create_fhir_datastore_response)

let make_create_fhir_datastore_request
    ?profile_configuration:(profile_configuration_ : profile_configuration option)
    ?nlp_configuration:(nlp_configuration_ : nlp_configuration option)
    ?analytics_configuration:(analytics_configuration_ : analytics_configuration option)
    ?identity_provider_configuration:
      (identity_provider_configuration_ : identity_provider_configuration option)
    ?tags:(tags_ : tag_list option) ?client_token:(client_token_ : client_token_string option)
    ?preload_data_config:(preload_data_config_ : preload_data_config option)
    ?sse_configuration:(sse_configuration_ : sse_configuration option)
    ?datastore_name:(datastore_name_ : datastore_name option)
    ~datastore_type_version:(datastore_type_version_ : fhir_version) () =
  ({
     profile_configuration = profile_configuration_;
     nlp_configuration = nlp_configuration_;
     analytics_configuration = analytics_configuration_;
     identity_provider_configuration = identity_provider_configuration_;
     tags = tags_;
     client_token = client_token_;
     preload_data_config = preload_data_config_;
     sse_configuration = sse_configuration_;
     datastore_type_version = datastore_type_version_;
     datastore_name = datastore_name_;
   }
    : create_fhir_datastore_request)
