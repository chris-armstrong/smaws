open Types

let make_datum ?var_char_value:(var_char_value_ : datum_string option) () =
  ({ var_char_value = var_char_value_ } : datum)

let make_engine_version ?effective_engine_version:(effective_engine_version_ : name_string option)
    ?selected_engine_version:(selected_engine_version_ : name_string option) () =
  ({
     effective_engine_version = effective_engine_version_;
     selected_engine_version = selected_engine_version_;
   }
    : engine_version)

let make_work_group_summary
    ?identity_center_application_arn:
      (identity_center_application_arn_ : identity_center_application_arn option)
    ?engine_version:(engine_version_ : engine_version option)
    ?creation_time:(creation_time_ : date option)
    ?description:(description_ : work_group_description_string option)
    ?state:(state_ : work_group_state option) ?name:(name_ : work_group_name option) () =
  ({
     identity_center_application_arn = identity_center_application_arn_;
     engine_version = engine_version_;
     creation_time = creation_time_;
     description = description_;
     state = state_;
     name = name_;
   }
    : work_group_summary)

let make_encryption_configuration ?kms_key:(kms_key_ : string_ option)
    ~encryption_option:(encryption_option_ : encryption_option) () =
  ({ kms_key = kms_key_; encryption_option = encryption_option_ } : encryption_configuration)

let make_acl_configuration ~s3_acl_option:(s3_acl_option_ : s3_acl_option) () =
  ({ s3_acl_option = s3_acl_option_ } : acl_configuration)

let make_result_configuration_updates
    ?remove_acl_configuration:(remove_acl_configuration_ : boxed_boolean option)
    ?acl_configuration:(acl_configuration_ : acl_configuration option)
    ?remove_expected_bucket_owner:(remove_expected_bucket_owner_ : boxed_boolean option)
    ?expected_bucket_owner:(expected_bucket_owner_ : aws_account_id option)
    ?remove_encryption_configuration:(remove_encryption_configuration_ : boxed_boolean option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?remove_output_location:(remove_output_location_ : boxed_boolean option)
    ?output_location:(output_location_ : result_output_location option) () =
  ({
     remove_acl_configuration = remove_acl_configuration_;
     acl_configuration = acl_configuration_;
     remove_expected_bucket_owner = remove_expected_bucket_owner_;
     expected_bucket_owner = expected_bucket_owner_;
     remove_encryption_configuration = remove_encryption_configuration_;
     encryption_configuration = encryption_configuration_;
     remove_output_location = remove_output_location_;
     output_location = output_location_;
   }
    : result_configuration_updates)

let make_managed_query_results_encryption_configuration ~kms_key:(kms_key_ : kms_key) () =
  ({ kms_key = kms_key_ } : managed_query_results_encryption_configuration)

let make_managed_query_results_configuration_updates
    ?remove_encryption_configuration:(remove_encryption_configuration_ : boxed_boolean option)
    ?encryption_configuration:
      (encryption_configuration_ : managed_query_results_encryption_configuration option)
    ?enabled:(enabled_ : boxed_boolean option) () =
  ({
     remove_encryption_configuration = remove_encryption_configuration_;
     encryption_configuration = encryption_configuration_;
     enabled = enabled_;
   }
    : managed_query_results_configuration_updates)

let make_customer_content_encryption_configuration ~kms_key:(kms_key_ : kms_key) () =
  ({ kms_key = kms_key_ } : customer_content_encryption_configuration)

let make_query_results_s3_access_grants_configuration
    ?create_user_level_prefix:(create_user_level_prefix_ : boxed_boolean option)
    ~authentication_type:(authentication_type_ : authentication_type)
    ~enable_s3_access_grants:(enable_s3_access_grants_ : boxed_boolean) () =
  ({
     authentication_type = authentication_type_;
     create_user_level_prefix = create_user_level_prefix_;
     enable_s3_access_grants = enable_s3_access_grants_;
   }
    : query_results_s3_access_grants_configuration)

let make_cloud_watch_logging_configuration ?log_types:(log_types_ : log_types_map option)
    ?log_stream_name_prefix:(log_stream_name_prefix_ : log_stream_name_prefix option)
    ?log_group:(log_group_ : log_group_name option) ~enabled:(enabled_ : boxed_boolean) () =
  ({
     log_types = log_types_;
     log_stream_name_prefix = log_stream_name_prefix_;
     log_group = log_group_;
     enabled = enabled_;
   }
    : cloud_watch_logging_configuration)

let make_managed_logging_configuration ?kms_key:(kms_key_ : kms_key option)
    ~enabled:(enabled_ : boxed_boolean) () =
  ({ kms_key = kms_key_; enabled = enabled_ } : managed_logging_configuration)

let make_s3_logging_configuration ?log_location:(log_location_ : s3_output_location option)
    ?kms_key:(kms_key_ : kms_key option) ~enabled:(enabled_ : boxed_boolean) () =
  ({ log_location = log_location_; kms_key = kms_key_; enabled = enabled_ }
    : s3_logging_configuration)

let make_monitoring_configuration
    ?s3_logging_configuration:(s3_logging_configuration_ : s3_logging_configuration option)
    ?managed_logging_configuration:
      (managed_logging_configuration_ : managed_logging_configuration option)
    ?cloud_watch_logging_configuration:
      (cloud_watch_logging_configuration_ : cloud_watch_logging_configuration option) () =
  ({
     s3_logging_configuration = s3_logging_configuration_;
     managed_logging_configuration = managed_logging_configuration_;
     cloud_watch_logging_configuration = cloud_watch_logging_configuration_;
   }
    : monitoring_configuration)

let make_classification ?properties:(properties_ : parameters_map option)
    ?name:(name_ : name_string option) () =
  ({ properties = properties_; name = name_ } : classification)

let make_engine_configuration ?classifications:(classifications_ : classification_list option)
    ?spark_properties:(spark_properties_ : parameters_map option)
    ?additional_configs:(additional_configs_ : parameters_map option)
    ?default_executor_dpu_size:(default_executor_dpu_size_ : default_executor_dpu_size option)
    ?max_concurrent_dpus:(max_concurrent_dpus_ : max_concurrent_dpus option)
    ?coordinator_dpu_size:(coordinator_dpu_size_ : coordinator_dpu_size option) () =
  ({
     classifications = classifications_;
     spark_properties = spark_properties_;
     additional_configs = additional_configs_;
     default_executor_dpu_size = default_executor_dpu_size_;
     max_concurrent_dpus = max_concurrent_dpus_;
     coordinator_dpu_size = coordinator_dpu_size_;
   }
    : engine_configuration)

let make_work_group_configuration_updates
    ?engine_configuration:(engine_configuration_ : engine_configuration option)
    ?monitoring_configuration:(monitoring_configuration_ : monitoring_configuration option)
    ?query_results_s3_access_grants_configuration:
      (query_results_s3_access_grants_configuration_ :
         query_results_s3_access_grants_configuration option)
    ?enable_minimum_encryption_configuration:
      (enable_minimum_encryption_configuration_ : boxed_boolean option)
    ?customer_content_encryption_configuration:
      (customer_content_encryption_configuration_ : customer_content_encryption_configuration option)
    ?execution_role:(execution_role_ : role_arn option)
    ?additional_configuration:(additional_configuration_ : name_string option)
    ?remove_customer_content_encryption_configuration:
      (remove_customer_content_encryption_configuration_ : boxed_boolean option)
    ?engine_version:(engine_version_ : engine_version option)
    ?requester_pays_enabled:(requester_pays_enabled_ : boxed_boolean option)
    ?remove_bytes_scanned_cutoff_per_query:
      (remove_bytes_scanned_cutoff_per_query_ : boxed_boolean option)
    ?bytes_scanned_cutoff_per_query:
      (bytes_scanned_cutoff_per_query_ : bytes_scanned_cutoff_value option)
    ?publish_cloud_watch_metrics_enabled:
      (publish_cloud_watch_metrics_enabled_ : boxed_boolean option)
    ?managed_query_results_configuration_updates:
      (managed_query_results_configuration_updates_ :
         managed_query_results_configuration_updates option)
    ?result_configuration_updates:
      (result_configuration_updates_ : result_configuration_updates option)
    ?enforce_work_group_configuration:(enforce_work_group_configuration_ : boxed_boolean option) ()
    =
  ({
     engine_configuration = engine_configuration_;
     monitoring_configuration = monitoring_configuration_;
     query_results_s3_access_grants_configuration = query_results_s3_access_grants_configuration_;
     enable_minimum_encryption_configuration = enable_minimum_encryption_configuration_;
     customer_content_encryption_configuration = customer_content_encryption_configuration_;
     execution_role = execution_role_;
     additional_configuration = additional_configuration_;
     remove_customer_content_encryption_configuration =
       remove_customer_content_encryption_configuration_;
     engine_version = engine_version_;
     requester_pays_enabled = requester_pays_enabled_;
     remove_bytes_scanned_cutoff_per_query = remove_bytes_scanned_cutoff_per_query_;
     bytes_scanned_cutoff_per_query = bytes_scanned_cutoff_per_query_;
     publish_cloud_watch_metrics_enabled = publish_cloud_watch_metrics_enabled_;
     managed_query_results_configuration_updates = managed_query_results_configuration_updates_;
     result_configuration_updates = result_configuration_updates_;
     enforce_work_group_configuration = enforce_work_group_configuration_;
   }
    : work_group_configuration_updates)

let make_result_configuration ?acl_configuration:(acl_configuration_ : acl_configuration option)
    ?expected_bucket_owner:(expected_bucket_owner_ : aws_account_id option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?output_location:(output_location_ : result_output_location option) () =
  ({
     acl_configuration = acl_configuration_;
     expected_bucket_owner = expected_bucket_owner_;
     encryption_configuration = encryption_configuration_;
     output_location = output_location_;
   }
    : result_configuration)

let make_managed_query_results_configuration
    ?encryption_configuration:
      (encryption_configuration_ : managed_query_results_encryption_configuration option)
    ~enabled:(enabled_ : boolean_) () =
  ({ encryption_configuration = encryption_configuration_; enabled = enabled_ }
    : managed_query_results_configuration)

let make_identity_center_configuration
    ?identity_center_instance_arn:
      (identity_center_instance_arn_ : identity_center_instance_arn option)
    ?enable_identity_center:(enable_identity_center_ : boxed_boolean option) () =
  ({
     identity_center_instance_arn = identity_center_instance_arn_;
     enable_identity_center = enable_identity_center_;
   }
    : identity_center_configuration)

let make_work_group_configuration
    ?query_results_s3_access_grants_configuration:
      (query_results_s3_access_grants_configuration_ :
         query_results_s3_access_grants_configuration option)
    ?identity_center_configuration:
      (identity_center_configuration_ : identity_center_configuration option)
    ?enable_minimum_encryption_configuration:
      (enable_minimum_encryption_configuration_ : boxed_boolean option)
    ?customer_content_encryption_configuration:
      (customer_content_encryption_configuration_ : customer_content_encryption_configuration option)
    ?engine_configuration:(engine_configuration_ : engine_configuration option)
    ?monitoring_configuration:(monitoring_configuration_ : monitoring_configuration option)
    ?execution_role:(execution_role_ : role_arn option)
    ?additional_configuration:(additional_configuration_ : name_string option)
    ?engine_version:(engine_version_ : engine_version option)
    ?requester_pays_enabled:(requester_pays_enabled_ : boxed_boolean option)
    ?bytes_scanned_cutoff_per_query:
      (bytes_scanned_cutoff_per_query_ : bytes_scanned_cutoff_value option)
    ?publish_cloud_watch_metrics_enabled:
      (publish_cloud_watch_metrics_enabled_ : boxed_boolean option)
    ?enforce_work_group_configuration:(enforce_work_group_configuration_ : boxed_boolean option)
    ?managed_query_results_configuration:
      (managed_query_results_configuration_ : managed_query_results_configuration option)
    ?result_configuration:(result_configuration_ : result_configuration option) () =
  ({
     query_results_s3_access_grants_configuration = query_results_s3_access_grants_configuration_;
     identity_center_configuration = identity_center_configuration_;
     enable_minimum_encryption_configuration = enable_minimum_encryption_configuration_;
     customer_content_encryption_configuration = customer_content_encryption_configuration_;
     engine_configuration = engine_configuration_;
     monitoring_configuration = monitoring_configuration_;
     execution_role = execution_role_;
     additional_configuration = additional_configuration_;
     engine_version = engine_version_;
     requester_pays_enabled = requester_pays_enabled_;
     bytes_scanned_cutoff_per_query = bytes_scanned_cutoff_per_query_;
     publish_cloud_watch_metrics_enabled = publish_cloud_watch_metrics_enabled_;
     enforce_work_group_configuration = enforce_work_group_configuration_;
     managed_query_results_configuration = managed_query_results_configuration_;
     result_configuration = result_configuration_;
   }
    : work_group_configuration)

let make_work_group
    ?identity_center_application_arn:
      (identity_center_application_arn_ : identity_center_application_arn option)
    ?creation_time:(creation_time_ : date option)
    ?description:(description_ : work_group_description_string option)
    ?configuration:(configuration_ : work_group_configuration option)
    ?state:(state_ : work_group_state option) ~name:(name_ : work_group_name) () =
  ({
     identity_center_application_arn = identity_center_application_arn_;
     creation_time = creation_time_;
     description = description_;
     configuration = configuration_;
     state = state_;
     name = name_;
   }
    : work_group)

let make_update_work_group_output () = (() : unit)

let make_update_work_group_input ?state:(state_ : work_group_state option)
    ?configuration_updates:(configuration_updates_ : work_group_configuration_updates option)
    ?description:(description_ : work_group_description_string option)
    ~work_group:(work_group_ : work_group_name) () =
  ({
     state = state_;
     configuration_updates = configuration_updates_;
     description = description_;
     work_group = work_group_;
   }
    : update_work_group_input)

let make_update_prepared_statement_output () = (() : unit)

let make_update_prepared_statement_input ?description:(description_ : description_string option)
    ~query_statement:(query_statement_ : query_string) ~work_group:(work_group_ : work_group_name)
    ~statement_name:(statement_name_ : statement_name) () =
  ({
     description = description_;
     query_statement = query_statement_;
     work_group = work_group_;
     statement_name = statement_name_;
   }
    : update_prepared_statement_input)

let make_update_notebook_output () = (() : unit)
let make_update_notebook_metadata_output () = (() : unit)

let make_update_notebook_metadata_input
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~name:(name_ : notebook_name) ~notebook_id:(notebook_id_ : notebook_id) () =
  ({ name = name_; client_request_token = client_request_token_; notebook_id = notebook_id_ }
    : update_notebook_metadata_input)

let make_update_notebook_input
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?session_id:(session_id_ : session_id option) ~type_:(type__ : notebook_type)
    ~payload:(payload_ : payload) ~notebook_id:(notebook_id_ : notebook_id) () =
  ({
     client_request_token = client_request_token_;
     session_id = session_id_;
     type_ = type__;
     payload = payload_;
     notebook_id = notebook_id_;
   }
    : update_notebook_input)

let make_update_named_query_output () = (() : unit)

let make_update_named_query_input
    ?description:(description_ : named_query_description_string option)
    ~query_string:(query_string_ : query_string) ~name:(name_ : name_string)
    ~named_query_id:(named_query_id_ : named_query_id) () =
  ({
     query_string = query_string_;
     description = description_;
     name = name_;
     named_query_id = named_query_id_;
   }
    : update_named_query_input)

let make_update_data_catalog_output () = (() : unit)

let make_update_data_catalog_input ?parameters:(parameters_ : parameters_map option)
    ?description:(description_ : description_string option) ~type_:(type__ : data_catalog_type)
    ~name:(name_ : catalog_name_string) () =
  ({ parameters = parameters_; description = description_; type_ = type__; name = name_ }
    : update_data_catalog_input)

let make_update_capacity_reservation_output () = (() : unit)

let make_update_capacity_reservation_input ~name:(name_ : capacity_reservation_name)
    ~target_dpus:(target_dpus_ : target_dpus_integer) () =
  ({ name = name_; target_dpus = target_dpus_ } : update_capacity_reservation_input)

let make_untag_resource_output () = (() : unit)

let make_untag_resource_input ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_input)

let make_unprocessed_query_execution_id ?error_message:(error_message_ : error_message option)
    ?error_code:(error_code_ : error_code option)
    ?query_execution_id:(query_execution_id_ : query_execution_id option) () =
  ({
     error_message = error_message_;
     error_code = error_code_;
     query_execution_id = query_execution_id_;
   }
    : unprocessed_query_execution_id)

let make_unprocessed_prepared_statement_name ?error_message:(error_message_ : error_message option)
    ?error_code:(error_code_ : error_code option)
    ?statement_name:(statement_name_ : statement_name option) () =
  ({ error_message = error_message_; error_code = error_code_; statement_name = statement_name_ }
    : unprocessed_prepared_statement_name)

let make_unprocessed_named_query_id ?error_message:(error_message_ : error_message option)
    ?error_code:(error_code_ : error_code option)
    ?named_query_id:(named_query_id_ : named_query_id option) () =
  ({ error_message = error_message_; error_code = error_code_; named_query_id = named_query_id_ }
    : unprocessed_named_query_id)

let make_terminate_session_response ?state:(state_ : session_state option) () =
  ({ state = state_ } : terminate_session_response)

let make_terminate_session_request ~session_id:(session_id_ : session_id) () =
  ({ session_id = session_id_ } : terminate_session_request)

let make_tag_resource_output () = (() : unit)

let make_tag ?value:(value_ : tag_value option) ?key:(key_ : tag_key option) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_input ~tags:(tags_ : tag_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_input)

let make_column ?comment:(comment_ : comment_string option) ?type_:(type__ : type_string option)
    ~name:(name_ : name_string) () =
  ({ comment = comment_; type_ = type__; name = name_ } : column)

let make_table_metadata ?parameters:(parameters_ : parameters_map option)
    ?partition_keys:(partition_keys_ : column_list option) ?columns:(columns_ : column_list option)
    ?table_type:(table_type_ : table_type_string option)
    ?last_access_time:(last_access_time_ : timestamp option)
    ?create_time:(create_time_ : timestamp option) ~name:(name_ : name_string) () =
  ({
     parameters = parameters_;
     partition_keys = partition_keys_;
     columns = columns_;
     table_type = table_type_;
     last_access_time = last_access_time_;
     create_time = create_time_;
     name = name_;
   }
    : table_metadata)

let make_stop_query_execution_output () = (() : unit)

let make_stop_query_execution_input ~query_execution_id:(query_execution_id_ : query_execution_id)
    () =
  ({ query_execution_id = query_execution_id_ } : stop_query_execution_input)

let make_stop_calculation_execution_response ?state:(state_ : calculation_execution_state option) ()
    =
  ({ state = state_ } : stop_calculation_execution_response)

let make_stop_calculation_execution_request
    ~calculation_execution_id:(calculation_execution_id_ : calculation_execution_id) () =
  ({ calculation_execution_id = calculation_execution_id_ } : stop_calculation_execution_request)

let make_start_session_response ?state:(state_ : session_state option)
    ?session_id:(session_id_ : session_id option) () =
  ({ state = state_; session_id = session_id_ } : start_session_response)

let make_start_session_request ?copy_work_group_tags:(copy_work_group_tags_ : boxed_boolean option)
    ?tags:(tags_ : tag_list option)
    ?client_request_token:(client_request_token_ : idempotency_token option)
    ?session_idle_timeout_in_minutes:
      (session_idle_timeout_in_minutes_ : session_idle_timeout_in_minutes option)
    ?notebook_version:(notebook_version_ : name_string option)
    ?monitoring_configuration:(monitoring_configuration_ : monitoring_configuration option)
    ?execution_role:(execution_role_ : role_arn option)
    ?description:(description_ : description_string option)
    ~engine_configuration:(engine_configuration_ : engine_configuration)
    ~work_group:(work_group_ : work_group_name) () =
  ({
     copy_work_group_tags = copy_work_group_tags_;
     tags = tags_;
     client_request_token = client_request_token_;
     session_idle_timeout_in_minutes = session_idle_timeout_in_minutes_;
     notebook_version = notebook_version_;
     monitoring_configuration = monitoring_configuration_;
     execution_role = execution_role_;
     engine_configuration = engine_configuration_;
     work_group = work_group_;
     description = description_;
   }
    : start_session_request)

let make_start_query_execution_output
    ?query_execution_id:(query_execution_id_ : query_execution_id option) () =
  ({ query_execution_id = query_execution_id_ } : start_query_execution_output)

let make_query_execution_context ?catalog:(catalog_ : catalog_name_string option)
    ?database:(database_ : database_string option) () =
  ({ catalog = catalog_; database = database_ } : query_execution_context)

let make_result_reuse_by_age_configuration ?max_age_in_minutes:(max_age_in_minutes_ : age option)
    ~enabled:(enabled_ : boolean_) () =
  ({ max_age_in_minutes = max_age_in_minutes_; enabled = enabled_ }
    : result_reuse_by_age_configuration)

let make_result_reuse_configuration
    ?result_reuse_by_age_configuration:
      (result_reuse_by_age_configuration_ : result_reuse_by_age_configuration option) () =
  ({ result_reuse_by_age_configuration = result_reuse_by_age_configuration_ }
    : result_reuse_configuration)

let make_start_query_execution_input
    ?engine_configuration:(engine_configuration_ : engine_configuration option)
    ?result_reuse_configuration:(result_reuse_configuration_ : result_reuse_configuration option)
    ?execution_parameters:(execution_parameters_ : execution_parameters option)
    ?work_group:(work_group_ : work_group_name option)
    ?result_configuration:(result_configuration_ : result_configuration option)
    ?query_execution_context:(query_execution_context_ : query_execution_context option)
    ?client_request_token:(client_request_token_ : idempotency_token option)
    ~query_string:(query_string_ : query_string) () =
  ({
     engine_configuration = engine_configuration_;
     result_reuse_configuration = result_reuse_configuration_;
     execution_parameters = execution_parameters_;
     work_group = work_group_;
     result_configuration = result_configuration_;
     query_execution_context = query_execution_context_;
     client_request_token = client_request_token_;
     query_string = query_string_;
   }
    : start_query_execution_input)

let make_start_calculation_execution_response ?state:(state_ : calculation_execution_state option)
    ?calculation_execution_id:(calculation_execution_id_ : calculation_execution_id option) () =
  ({ state = state_; calculation_execution_id = calculation_execution_id_ }
    : start_calculation_execution_response)

let make_calculation_configuration ?code_block:(code_block_ : code_block option) () =
  ({ code_block = code_block_ } : calculation_configuration)

let make_start_calculation_execution_request
    ?client_request_token:(client_request_token_ : idempotency_token option)
    ?code_block:(code_block_ : code_block option)
    ?calculation_configuration:(calculation_configuration_ : calculation_configuration option)
    ?description:(description_ : description_string option) ~session_id:(session_id_ : session_id)
    () =
  ({
     client_request_token = client_request_token_;
     code_block = code_block_;
     calculation_configuration = calculation_configuration_;
     description = description_;
     session_id = session_id_;
   }
    : start_calculation_execution_request)

let make_session_status ?state_change_reason:(state_change_reason_ : description_string option)
    ?state:(state_ : session_state option)
    ?idle_since_date_time:(idle_since_date_time_ : date option)
    ?end_date_time:(end_date_time_ : date option)
    ?last_modified_date_time:(last_modified_date_time_ : date option)
    ?start_date_time:(start_date_time_ : date option) () =
  ({
     state_change_reason = state_change_reason_;
     state = state_;
     idle_since_date_time = idle_since_date_time_;
     end_date_time = end_date_time_;
     last_modified_date_time = last_modified_date_time_;
     start_date_time = start_date_time_;
   }
    : session_status)

let make_session_summary ?status:(status_ : session_status option)
    ?notebook_version:(notebook_version_ : name_string option)
    ?engine_version:(engine_version_ : engine_version option)
    ?description:(description_ : description_string option)
    ?session_id:(session_id_ : session_id option) () =
  ({
     status = status_;
     notebook_version = notebook_version_;
     engine_version = engine_version_;
     description = description_;
     session_id = session_id_;
   }
    : session_summary)

let make_session_statistics ?dpu_execution_in_millis:(dpu_execution_in_millis_ : long option) () =
  ({ dpu_execution_in_millis = dpu_execution_in_millis_ } : session_statistics)

let make_session_configuration
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?session_idle_timeout_in_minutes:
      (session_idle_timeout_in_minutes_ : session_idle_timeout_in_minutes option)
    ?idle_timeout_seconds:(idle_timeout_seconds_ : long option)
    ?working_directory:(working_directory_ : result_output_location option)
    ?execution_role:(execution_role_ : role_arn option) () =
  ({
     encryption_configuration = encryption_configuration_;
     session_idle_timeout_in_minutes = session_idle_timeout_in_minutes_;
     idle_timeout_seconds = idle_timeout_seconds_;
     working_directory = working_directory_;
     execution_role = execution_role_;
   }
    : session_configuration)

let make_row ?data:(data_ : datum_list option) () = ({ data = data_ } : row)

let make_column_info ?case_sensitive:(case_sensitive_ : boolean_ option)
    ?nullable:(nullable_ : column_nullable option) ?scale:(scale_ : integer option)
    ?precision:(precision_ : integer option) ?label:(label_ : string_ option)
    ?table_name:(table_name_ : string_ option) ?schema_name:(schema_name_ : string_ option)
    ?catalog_name:(catalog_name_ : string_ option) ~type_:(type__ : string_) ~name:(name_ : string_)
    () =
  ({
     case_sensitive = case_sensitive_;
     nullable = nullable_;
     scale = scale_;
     precision = precision_;
     type_ = type__;
     label = label_;
     name = name_;
     table_name = table_name_;
     schema_name = schema_name_;
     catalog_name = catalog_name_;
   }
    : column_info)

let make_result_set_metadata ?column_info:(column_info_ : column_info_list option) () =
  ({ column_info = column_info_ } : result_set_metadata)

let make_result_set ?result_set_metadata:(result_set_metadata_ : result_set_metadata option)
    ?rows:(rows_ : row_list option) () =
  ({ result_set_metadata = result_set_metadata_; rows = rows_ } : result_set)

let make_result_reuse_information ~reused_previous_result:(reused_previous_result_ : boolean_) () =
  ({ reused_previous_result = reused_previous_result_ } : result_reuse_information)

let make_query_stage_plan_node ?remote_sources:(remote_sources_ : string_list option)
    ?children:(children_ : query_stage_plan_nodes option) ?identifier:(identifier_ : string_ option)
    ?name:(name_ : string_ option) () =
  ({
     remote_sources = remote_sources_;
     children = children_;
     identifier = identifier_;
     name = name_;
   }
    : query_stage_plan_node)

let make_query_stage ?sub_stages:(sub_stages_ : query_stages option)
    ?query_stage_plan:(query_stage_plan_ : query_stage_plan_node option)
    ?execution_time:(execution_time_ : long option) ?input_rows:(input_rows_ : long option)
    ?input_bytes:(input_bytes_ : long option) ?output_rows:(output_rows_ : long option)
    ?output_bytes:(output_bytes_ : long option) ?state:(state_ : string_ option)
    ?stage_id:(stage_id_ : long option) () =
  ({
     sub_stages = sub_stages_;
     query_stage_plan = query_stage_plan_;
     execution_time = execution_time_;
     input_rows = input_rows_;
     input_bytes = input_bytes_;
     output_rows = output_rows_;
     output_bytes = output_bytes_;
     state = state_;
     stage_id = stage_id_;
   }
    : query_stage)

let make_query_runtime_statistics_timeline
    ?total_execution_time_in_millis:(total_execution_time_in_millis_ : long option)
    ?service_processing_time_in_millis:(service_processing_time_in_millis_ : long option)
    ?engine_execution_time_in_millis:(engine_execution_time_in_millis_ : long option)
    ?query_planning_time_in_millis:(query_planning_time_in_millis_ : long option)
    ?service_pre_processing_time_in_millis:(service_pre_processing_time_in_millis_ : long option)
    ?query_queue_time_in_millis:(query_queue_time_in_millis_ : long option) () =
  ({
     total_execution_time_in_millis = total_execution_time_in_millis_;
     service_processing_time_in_millis = service_processing_time_in_millis_;
     engine_execution_time_in_millis = engine_execution_time_in_millis_;
     query_planning_time_in_millis = query_planning_time_in_millis_;
     service_pre_processing_time_in_millis = service_pre_processing_time_in_millis_;
     query_queue_time_in_millis = query_queue_time_in_millis_;
   }
    : query_runtime_statistics_timeline)

let make_query_runtime_statistics_rows ?output_rows:(output_rows_ : long option)
    ?output_bytes:(output_bytes_ : long option) ?input_bytes:(input_bytes_ : long option)
    ?input_rows:(input_rows_ : long option) () =
  ({
     output_rows = output_rows_;
     output_bytes = output_bytes_;
     input_bytes = input_bytes_;
     input_rows = input_rows_;
   }
    : query_runtime_statistics_rows)

let make_query_runtime_statistics ?output_stage:(output_stage_ : query_stage option)
    ?rows:(rows_ : query_runtime_statistics_rows option)
    ?timeline:(timeline_ : query_runtime_statistics_timeline option) () =
  ({ output_stage = output_stage_; rows = rows_; timeline = timeline_ } : query_runtime_statistics)

let make_athena_error ?error_message:(error_message_ : string_ option)
    ?retryable:(retryable_ : boolean_ option) ?error_type:(error_type_ : error_type option)
    ?error_category:(error_category_ : error_category option) () =
  ({
     error_message = error_message_;
     retryable = retryable_;
     error_type = error_type_;
     error_category = error_category_;
   }
    : athena_error)

let make_query_execution_status ?athena_error:(athena_error_ : athena_error option)
    ?completion_date_time:(completion_date_time_ : date option)
    ?submission_date_time:(submission_date_time_ : date option)
    ?state_change_reason:(state_change_reason_ : string_ option)
    ?state:(state_ : query_execution_state option) () =
  ({
     athena_error = athena_error_;
     completion_date_time = completion_date_time_;
     submission_date_time = submission_date_time_;
     state_change_reason = state_change_reason_;
     state = state_;
   }
    : query_execution_status)

let make_query_execution_statistics ?dpu_count:(dpu_count_ : dpu_count option)
    ?result_reuse_information:(result_reuse_information_ : result_reuse_information option)
    ?service_processing_time_in_millis:(service_processing_time_in_millis_ : long option)
    ?query_planning_time_in_millis:(query_planning_time_in_millis_ : long option)
    ?service_pre_processing_time_in_millis:(service_pre_processing_time_in_millis_ : long option)
    ?query_queue_time_in_millis:(query_queue_time_in_millis_ : long option)
    ?total_execution_time_in_millis:(total_execution_time_in_millis_ : long option)
    ?data_manifest_location:(data_manifest_location_ : string_ option)
    ?data_scanned_in_bytes:(data_scanned_in_bytes_ : long option)
    ?engine_execution_time_in_millis:(engine_execution_time_in_millis_ : long option) () =
  ({
     dpu_count = dpu_count_;
     result_reuse_information = result_reuse_information_;
     service_processing_time_in_millis = service_processing_time_in_millis_;
     query_planning_time_in_millis = query_planning_time_in_millis_;
     service_pre_processing_time_in_millis = service_pre_processing_time_in_millis_;
     query_queue_time_in_millis = query_queue_time_in_millis_;
     total_execution_time_in_millis = total_execution_time_in_millis_;
     data_manifest_location = data_manifest_location_;
     data_scanned_in_bytes = data_scanned_in_bytes_;
     engine_execution_time_in_millis = engine_execution_time_in_millis_;
   }
    : query_execution_statistics)

let make_query_execution
    ?query_results_s3_access_grants_configuration:
      (query_results_s3_access_grants_configuration_ :
         query_results_s3_access_grants_configuration option)
    ?substatement_type:(substatement_type_ : string_ option)
    ?execution_parameters:(execution_parameters_ : execution_parameters option)
    ?engine_version:(engine_version_ : engine_version option)
    ?work_group:(work_group_ : work_group_name option)
    ?statistics:(statistics_ : query_execution_statistics option)
    ?status:(status_ : query_execution_status option)
    ?query_execution_context:(query_execution_context_ : query_execution_context option)
    ?result_reuse_configuration:(result_reuse_configuration_ : result_reuse_configuration option)
    ?result_configuration:(result_configuration_ : result_configuration option)
    ?managed_query_results_configuration:
      (managed_query_results_configuration_ : managed_query_results_configuration option)
    ?statement_type:(statement_type_ : statement_type option) ?query:(query_ : query_string option)
    ?query_execution_id:(query_execution_id_ : query_execution_id option) () =
  ({
     query_results_s3_access_grants_configuration = query_results_s3_access_grants_configuration_;
     substatement_type = substatement_type_;
     execution_parameters = execution_parameters_;
     engine_version = engine_version_;
     work_group = work_group_;
     statistics = statistics_;
     status = status_;
     query_execution_context = query_execution_context_;
     result_reuse_configuration = result_reuse_configuration_;
     result_configuration = result_configuration_;
     managed_query_results_configuration = managed_query_results_configuration_;
     statement_type = statement_type_;
     query = query_;
     query_execution_id = query_execution_id_;
   }
    : query_execution)

let make_put_capacity_assignment_configuration_output () = (() : unit)

let make_capacity_assignment ?work_group_names:(work_group_names_ : work_group_names_list option) ()
    =
  ({ work_group_names = work_group_names_ } : capacity_assignment)

let make_put_capacity_assignment_configuration_input
    ~capacity_assignments:(capacity_assignments_ : capacity_assignments_list)
    ~capacity_reservation_name:(capacity_reservation_name_ : capacity_reservation_name) () =
  ({
     capacity_assignments = capacity_assignments_;
     capacity_reservation_name = capacity_reservation_name_;
   }
    : put_capacity_assignment_configuration_input)

let make_prepared_statement_summary ?last_modified_time:(last_modified_time_ : date option)
    ?statement_name:(statement_name_ : statement_name option) () =
  ({ last_modified_time = last_modified_time_; statement_name = statement_name_ }
    : prepared_statement_summary)

let make_prepared_statement ?last_modified_time:(last_modified_time_ : date option)
    ?description:(description_ : description_string option)
    ?work_group_name:(work_group_name_ : work_group_name option)
    ?query_statement:(query_statement_ : query_string option)
    ?statement_name:(statement_name_ : statement_name option) () =
  ({
     last_modified_time = last_modified_time_;
     description = description_;
     work_group_name = work_group_name_;
     query_statement = query_statement_;
     statement_name = statement_name_;
   }
    : prepared_statement)

let make_notebook_session_summary ?creation_time:(creation_time_ : date option)
    ?session_id:(session_id_ : session_id option) () =
  ({ creation_time = creation_time_; session_id = session_id_ } : notebook_session_summary)

let make_notebook_metadata ?last_modified_time:(last_modified_time_ : date option)
    ?type_:(type__ : notebook_type option) ?creation_time:(creation_time_ : date option)
    ?work_group:(work_group_ : work_group_name option) ?name:(name_ : notebook_name option)
    ?notebook_id:(notebook_id_ : notebook_id option) () =
  ({
     last_modified_time = last_modified_time_;
     type_ = type__;
     creation_time = creation_time_;
     work_group = work_group_;
     name = name_;
     notebook_id = notebook_id_;
   }
    : notebook_metadata)

let make_named_query ?work_group:(work_group_ : work_group_name option)
    ?named_query_id:(named_query_id_ : named_query_id option)
    ?description:(description_ : description_string option)
    ~query_string:(query_string_ : query_string) ~database:(database_ : database_string)
    ~name:(name_ : name_string) () =
  ({
     work_group = work_group_;
     named_query_id = named_query_id_;
     query_string = query_string_;
     database = database_;
     description = description_;
     name = name_;
   }
    : named_query)

let make_list_work_groups_output ?next_token:(next_token_ : token option)
    ?work_groups:(work_groups_ : work_groups_list option) () =
  ({ next_token = next_token_; work_groups = work_groups_ } : list_work_groups_output)

let make_list_work_groups_input ?max_results:(max_results_ : max_work_groups_count option)
    ?next_token:(next_token_ : token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_work_groups_input)

let make_list_tags_for_resource_output ?next_token:(next_token_ : token option)
    ?tags:(tags_ : tag_list option) () =
  ({ next_token = next_token_; tags = tags_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ?max_results:(max_results_ : max_tags_count option)
    ?next_token:(next_token_ : token option) ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    () =
  ({ max_results = max_results_; next_token = next_token_; resource_ar_n = resource_ar_n_ }
    : list_tags_for_resource_input)

let make_list_table_metadata_output ?next_token:(next_token_ : token option)
    ?table_metadata_list:(table_metadata_list_ : table_metadata_list option) () =
  ({ next_token = next_token_; table_metadata_list = table_metadata_list_ }
    : list_table_metadata_output)

let make_list_table_metadata_input ?work_group:(work_group_ : work_group_name option)
    ?max_results:(max_results_ : max_table_metadata_count option)
    ?next_token:(next_token_ : token option) ?expression:(expression_ : expression_string option)
    ~database_name:(database_name_ : name_string)
    ~catalog_name:(catalog_name_ : catalog_name_string) () =
  ({
     work_group = work_group_;
     max_results = max_results_;
     next_token = next_token_;
     expression = expression_;
     database_name = database_name_;
     catalog_name = catalog_name_;
   }
    : list_table_metadata_input)

let make_list_sessions_response ?sessions:(sessions_ : sessions_list option)
    ?next_token:(next_token_ : session_manager_token option) () =
  ({ sessions = sessions_; next_token = next_token_ } : list_sessions_response)

let make_list_sessions_request ?next_token:(next_token_ : session_manager_token option)
    ?max_results:(max_results_ : max_sessions_count option)
    ?state_filter:(state_filter_ : session_state option) ~work_group:(work_group_ : work_group_name)
    () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     state_filter = state_filter_;
     work_group = work_group_;
   }
    : list_sessions_request)

let make_list_query_executions_output ?next_token:(next_token_ : token option)
    ?query_execution_ids:(query_execution_ids_ : query_execution_id_list option) () =
  ({ next_token = next_token_; query_execution_ids = query_execution_ids_ }
    : list_query_executions_output)

let make_list_query_executions_input ?work_group:(work_group_ : work_group_name option)
    ?max_results:(max_results_ : max_query_executions_count option)
    ?next_token:(next_token_ : token option) () =
  ({ work_group = work_group_; max_results = max_results_; next_token = next_token_ }
    : list_query_executions_input)

let make_list_prepared_statements_output ?next_token:(next_token_ : token option)
    ?prepared_statements:(prepared_statements_ : prepared_statements_list option) () =
  ({ next_token = next_token_; prepared_statements = prepared_statements_ }
    : list_prepared_statements_output)

let make_list_prepared_statements_input
    ?max_results:(max_results_ : max_prepared_statements_count option)
    ?next_token:(next_token_ : token option) ~work_group:(work_group_ : work_group_name) () =
  ({ max_results = max_results_; next_token = next_token_; work_group = work_group_ }
    : list_prepared_statements_input)

let make_list_notebook_sessions_response ?next_token:(next_token_ : token option)
    ~notebook_sessions_list:(notebook_sessions_list_ : notebook_sessions_list) () =
  ({ next_token = next_token_; notebook_sessions_list = notebook_sessions_list_ }
    : list_notebook_sessions_response)

let make_list_notebook_sessions_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_sessions_count option)
    ~notebook_id:(notebook_id_ : notebook_id) () =
  ({ next_token = next_token_; max_results = max_results_; notebook_id = notebook_id_ }
    : list_notebook_sessions_request)

let make_list_notebook_metadata_output
    ?notebook_metadata_list:(notebook_metadata_list_ : notebook_metadata_array option)
    ?next_token:(next_token_ : token option) () =
  ({ notebook_metadata_list = notebook_metadata_list_; next_token = next_token_ }
    : list_notebook_metadata_output)

let make_filter_definition ?name:(name_ : notebook_name option) () =
  ({ name = name_ } : filter_definition)

let make_list_notebook_metadata_input ?max_results:(max_results_ : max_notebooks_count option)
    ?next_token:(next_token_ : token option) ?filters:(filters_ : filter_definition option)
    ~work_group:(work_group_ : work_group_name) () =
  ({
     work_group = work_group_;
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
   }
    : list_notebook_metadata_input)

let make_list_named_queries_output ?next_token:(next_token_ : token option)
    ?named_query_ids:(named_query_ids_ : named_query_id_list option) () =
  ({ next_token = next_token_; named_query_ids = named_query_ids_ } : list_named_queries_output)

let make_list_named_queries_input ?work_group:(work_group_ : work_group_name option)
    ?max_results:(max_results_ : max_named_queries_count option)
    ?next_token:(next_token_ : token option) () =
  ({ work_group = work_group_; max_results = max_results_; next_token = next_token_ }
    : list_named_queries_input)

let make_executors_summary ?executor_size:(executor_size_ : long option)
    ?executor_state:(executor_state_ : executor_state option)
    ?termination_date_time:(termination_date_time_ : long option)
    ?start_date_time:(start_date_time_ : long option)
    ?executor_type:(executor_type_ : executor_type option) ~executor_id:(executor_id_ : executor_id)
    () =
  ({
     executor_size = executor_size_;
     executor_state = executor_state_;
     termination_date_time = termination_date_time_;
     start_date_time = start_date_time_;
     executor_type = executor_type_;
     executor_id = executor_id_;
   }
    : executors_summary)

let make_list_executors_response
    ?executors_summary:(executors_summary_ : executors_summary_list option)
    ?next_token:(next_token_ : session_manager_token option) ~session_id:(session_id_ : session_id)
    () =
  ({ executors_summary = executors_summary_; next_token = next_token_; session_id = session_id_ }
    : list_executors_response)

let make_list_executors_request ?next_token:(next_token_ : session_manager_token option)
    ?max_results:(max_results_ : max_list_executors_count option)
    ?executor_state_filter:(executor_state_filter_ : executor_state option)
    ~session_id:(session_id_ : session_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     executor_state_filter = executor_state_filter_;
     session_id = session_id_;
   }
    : list_executors_request)

let make_list_engine_versions_output ?next_token:(next_token_ : token option)
    ?engine_versions:(engine_versions_ : engine_versions_list option) () =
  ({ next_token = next_token_; engine_versions = engine_versions_ } : list_engine_versions_output)

let make_list_engine_versions_input ?max_results:(max_results_ : max_engine_versions_count option)
    ?next_token:(next_token_ : token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_engine_versions_input)

let make_database ?parameters:(parameters_ : parameters_map option)
    ?description:(description_ : description_string option) ~name:(name_ : name_string) () =
  ({ parameters = parameters_; description = description_; name = name_ } : database)

let make_list_databases_output ?next_token:(next_token_ : token option)
    ?database_list:(database_list_ : database_list option) () =
  ({ next_token = next_token_; database_list = database_list_ } : list_databases_output)

let make_list_databases_input ?work_group:(work_group_ : work_group_name option)
    ?max_results:(max_results_ : max_databases_count option)
    ?next_token:(next_token_ : token option) ~catalog_name:(catalog_name_ : catalog_name_string) ()
    =
  ({
     work_group = work_group_;
     max_results = max_results_;
     next_token = next_token_;
     catalog_name = catalog_name_;
   }
    : list_databases_input)

let make_data_catalog_summary ?error:(error_ : error_message option)
    ?connection_type:(connection_type_ : connection_type option)
    ?status:(status_ : data_catalog_status option) ?type_:(type__ : data_catalog_type option)
    ?catalog_name:(catalog_name_ : catalog_name_string option) () =
  ({
     error = error_;
     connection_type = connection_type_;
     status = status_;
     type_ = type__;
     catalog_name = catalog_name_;
   }
    : data_catalog_summary)

let make_list_data_catalogs_output ?next_token:(next_token_ : token option)
    ?data_catalogs_summary:(data_catalogs_summary_ : data_catalog_summary_list option) () =
  ({ next_token = next_token_; data_catalogs_summary = data_catalogs_summary_ }
    : list_data_catalogs_output)

let make_list_data_catalogs_input ?work_group:(work_group_ : work_group_name option)
    ?max_results:(max_results_ : max_data_catalogs_count option)
    ?next_token:(next_token_ : token option) () =
  ({ work_group = work_group_; max_results = max_results_; next_token = next_token_ }
    : list_data_catalogs_input)

let make_capacity_allocation ?request_completion_time:(request_completion_time_ : timestamp option)
    ?status_message:(status_message_ : string_ option) ~request_time:(request_time_ : timestamp)
    ~status:(status_ : capacity_allocation_status) () =
  ({
     request_completion_time = request_completion_time_;
     request_time = request_time_;
     status_message = status_message_;
     status = status_;
   }
    : capacity_allocation)

let make_capacity_reservation
    ?last_successful_allocation_time:(last_successful_allocation_time_ : timestamp option)
    ?last_allocation:(last_allocation_ : capacity_allocation option)
    ~creation_time:(creation_time_ : timestamp)
    ~allocated_dpus:(allocated_dpus_ : allocated_dpus_integer)
    ~target_dpus:(target_dpus_ : target_dpus_integer)
    ~status:(status_ : capacity_reservation_status) ~name:(name_ : capacity_reservation_name) () =
  ({
     creation_time = creation_time_;
     last_successful_allocation_time = last_successful_allocation_time_;
     last_allocation = last_allocation_;
     allocated_dpus = allocated_dpus_;
     target_dpus = target_dpus_;
     status = status_;
     name = name_;
   }
    : capacity_reservation)

let make_list_capacity_reservations_output ?next_token:(next_token_ : token option)
    ~capacity_reservations:(capacity_reservations_ : capacity_reservations_list) () =
  ({ capacity_reservations = capacity_reservations_; next_token = next_token_ }
    : list_capacity_reservations_output)

let make_list_capacity_reservations_input
    ?max_results:(max_results_ : max_capacity_reservations_count option)
    ?next_token:(next_token_ : token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_capacity_reservations_input)

let make_calculation_status ?state_change_reason:(state_change_reason_ : description_string option)
    ?state:(state_ : calculation_execution_state option)
    ?completion_date_time:(completion_date_time_ : date option)
    ?submission_date_time:(submission_date_time_ : date option) () =
  ({
     state_change_reason = state_change_reason_;
     state = state_;
     completion_date_time = completion_date_time_;
     submission_date_time = submission_date_time_;
   }
    : calculation_status)

let make_calculation_summary ?status:(status_ : calculation_status option)
    ?description:(description_ : description_string option)
    ?calculation_execution_id:(calculation_execution_id_ : calculation_execution_id option) () =
  ({
     status = status_;
     description = description_;
     calculation_execution_id = calculation_execution_id_;
   }
    : calculation_summary)

let make_list_calculation_executions_response
    ?calculations:(calculations_ : calculations_list option)
    ?next_token:(next_token_ : session_manager_token option) () =
  ({ calculations = calculations_; next_token = next_token_ }
    : list_calculation_executions_response)

let make_list_calculation_executions_request
    ?next_token:(next_token_ : session_manager_token option)
    ?max_results:(max_results_ : max_calculations_count option)
    ?state_filter:(state_filter_ : calculation_execution_state option)
    ~session_id:(session_id_ : session_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     state_filter = state_filter_;
     session_id = session_id_;
   }
    : list_calculation_executions_request)

let make_application_dpu_sizes
    ?supported_dpu_sizes:(supported_dpu_sizes_ : supported_dpu_size_list option)
    ?application_runtime_id:(application_runtime_id_ : name_string option) () =
  ({ supported_dpu_sizes = supported_dpu_sizes_; application_runtime_id = application_runtime_id_ }
    : application_dpu_sizes)

let make_list_application_dpu_sizes_output ?next_token:(next_token_ : token option)
    ?application_dpu_sizes:(application_dpu_sizes_ : application_dpu_sizes_list option) () =
  ({ next_token = next_token_; application_dpu_sizes = application_dpu_sizes_ }
    : list_application_dpu_sizes_output)

let make_list_application_dpu_sizes_input ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_application_dpu_sizes_count option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_application_dpu_sizes_input)

let make_import_notebook_output ?notebook_id:(notebook_id_ : notebook_id option) () =
  ({ notebook_id = notebook_id_ } : import_notebook_output)

let make_import_notebook_input
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?notebook_s3_location_uri:(notebook_s3_location_uri_ : s3_uri option)
    ?payload:(payload_ : payload option) ~type_:(type__ : notebook_type)
    ~name:(name_ : notebook_name) ~work_group:(work_group_ : work_group_name) () =
  ({
     client_request_token = client_request_token_;
     notebook_s3_location_uri = notebook_s3_location_uri_;
     type_ = type__;
     payload = payload_;
     name = name_;
     work_group = work_group_;
   }
    : import_notebook_input)

let make_get_work_group_output ?work_group:(work_group_ : work_group option) () =
  ({ work_group = work_group_ } : get_work_group_output)

let make_get_work_group_input ~work_group:(work_group_ : work_group_name) () =
  ({ work_group = work_group_ } : get_work_group_input)

let make_get_table_metadata_output ?table_metadata:(table_metadata_ : table_metadata option) () =
  ({ table_metadata = table_metadata_ } : get_table_metadata_output)

let make_get_table_metadata_input ?work_group:(work_group_ : work_group_name option)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string)
    ~catalog_name:(catalog_name_ : catalog_name_string) () =
  ({
     work_group = work_group_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_name = catalog_name_;
   }
    : get_table_metadata_input)

let make_get_session_status_response ?status:(status_ : session_status option)
    ?session_id:(session_id_ : session_id option) () =
  ({ status = status_; session_id = session_id_ } : get_session_status_response)

let make_get_session_status_request ~session_id:(session_id_ : session_id) () =
  ({ session_id = session_id_ } : get_session_status_request)

let make_get_session_response ?statistics:(statistics_ : session_statistics option)
    ?status:(status_ : session_status option)
    ?session_configuration:(session_configuration_ : session_configuration option)
    ?monitoring_configuration:(monitoring_configuration_ : monitoring_configuration option)
    ?notebook_version:(notebook_version_ : name_string option)
    ?engine_configuration:(engine_configuration_ : engine_configuration option)
    ?engine_version:(engine_version_ : name_string option)
    ?work_group:(work_group_ : work_group_name option)
    ?description:(description_ : description_string option)
    ?session_id:(session_id_ : session_id option) () =
  ({
     statistics = statistics_;
     status = status_;
     session_configuration = session_configuration_;
     monitoring_configuration = monitoring_configuration_;
     notebook_version = notebook_version_;
     engine_configuration = engine_configuration_;
     engine_version = engine_version_;
     work_group = work_group_;
     description = description_;
     session_id = session_id_;
   }
    : get_session_response)

let make_get_session_request ~session_id:(session_id_ : session_id) () =
  ({ session_id = session_id_ } : get_session_request)

let make_get_session_endpoint_response
    ~auth_token_expiration_time:(auth_token_expiration_time_ : timestamp)
    ~auth_token:(auth_token_ : string_) ~endpoint_url:(endpoint_url_ : string_) () =
  ({
     auth_token_expiration_time = auth_token_expiration_time_;
     auth_token = auth_token_;
     endpoint_url = endpoint_url_;
   }
    : get_session_endpoint_response)

let make_get_session_endpoint_request ~session_id:(session_id_ : session_id) () =
  ({ session_id = session_id_ } : get_session_endpoint_request)

let make_get_resource_dashboard_response ~url:(url_ : string_) () =
  ({ url = url_ } : get_resource_dashboard_response)

let make_get_resource_dashboard_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : get_resource_dashboard_request)

let make_get_query_runtime_statistics_output
    ?query_runtime_statistics:(query_runtime_statistics_ : query_runtime_statistics option) () =
  ({ query_runtime_statistics = query_runtime_statistics_ } : get_query_runtime_statistics_output)

let make_get_query_runtime_statistics_input
    ~query_execution_id:(query_execution_id_ : query_execution_id) () =
  ({ query_execution_id = query_execution_id_ } : get_query_runtime_statistics_input)

let make_get_query_results_output ?next_token:(next_token_ : token option)
    ?result_set:(result_set_ : result_set option) ?update_count:(update_count_ : long option) () =
  ({ next_token = next_token_; result_set = result_set_; update_count = update_count_ }
    : get_query_results_output)

let make_get_query_results_input ?query_result_type:(query_result_type_ : query_result_type option)
    ?max_results:(max_results_ : max_query_results option) ?next_token:(next_token_ : token option)
    ~query_execution_id:(query_execution_id_ : query_execution_id) () =
  ({
     query_result_type = query_result_type_;
     max_results = max_results_;
     next_token = next_token_;
     query_execution_id = query_execution_id_;
   }
    : get_query_results_input)

let make_get_query_execution_output ?query_execution:(query_execution_ : query_execution option) ()
    =
  ({ query_execution = query_execution_ } : get_query_execution_output)

let make_get_query_execution_input ~query_execution_id:(query_execution_id_ : query_execution_id) ()
    =
  ({ query_execution_id = query_execution_id_ } : get_query_execution_input)

let make_get_prepared_statement_output
    ?prepared_statement:(prepared_statement_ : prepared_statement option) () =
  ({ prepared_statement = prepared_statement_ } : get_prepared_statement_output)

let make_get_prepared_statement_input ~work_group:(work_group_ : work_group_name)
    ~statement_name:(statement_name_ : statement_name) () =
  ({ work_group = work_group_; statement_name = statement_name_ } : get_prepared_statement_input)

let make_get_notebook_metadata_output
    ?notebook_metadata:(notebook_metadata_ : notebook_metadata option) () =
  ({ notebook_metadata = notebook_metadata_ } : get_notebook_metadata_output)

let make_get_notebook_metadata_input ~notebook_id:(notebook_id_ : notebook_id) () =
  ({ notebook_id = notebook_id_ } : get_notebook_metadata_input)

let make_get_named_query_output ?named_query:(named_query_ : named_query option) () =
  ({ named_query = named_query_ } : get_named_query_output)

let make_get_named_query_input ~named_query_id:(named_query_id_ : named_query_id) () =
  ({ named_query_id = named_query_id_ } : get_named_query_input)

let make_get_database_output ?database:(database_ : database option) () =
  ({ database = database_ } : get_database_output)

let make_get_database_input ?work_group:(work_group_ : work_group_name option)
    ~database_name:(database_name_ : name_string)
    ~catalog_name:(catalog_name_ : catalog_name_string) () =
  ({ work_group = work_group_; database_name = database_name_; catalog_name = catalog_name_ }
    : get_database_input)

let make_data_catalog ?error:(error_ : error_message option)
    ?connection_type:(connection_type_ : connection_type option)
    ?status:(status_ : data_catalog_status option) ?parameters:(parameters_ : parameters_map option)
    ?description:(description_ : description_string option) ~type_:(type__ : data_catalog_type)
    ~name:(name_ : catalog_name_string) () =
  ({
     error = error_;
     connection_type = connection_type_;
     status = status_;
     parameters = parameters_;
     type_ = type__;
     description = description_;
     name = name_;
   }
    : data_catalog)

let make_get_data_catalog_output ?data_catalog:(data_catalog_ : data_catalog option) () =
  ({ data_catalog = data_catalog_ } : get_data_catalog_output)

let make_get_data_catalog_input ?work_group:(work_group_ : work_group_name option)
    ~name:(name_ : catalog_name_string) () =
  ({ work_group = work_group_; name = name_ } : get_data_catalog_input)

let make_get_capacity_reservation_output
    ~capacity_reservation:(capacity_reservation_ : capacity_reservation) () =
  ({ capacity_reservation = capacity_reservation_ } : get_capacity_reservation_output)

let make_get_capacity_reservation_input ~name:(name_ : capacity_reservation_name) () =
  ({ name = name_ } : get_capacity_reservation_input)

let make_capacity_assignment_configuration
    ?capacity_assignments:(capacity_assignments_ : capacity_assignments_list option)
    ?capacity_reservation_name:(capacity_reservation_name_ : capacity_reservation_name option) () =
  ({
     capacity_assignments = capacity_assignments_;
     capacity_reservation_name = capacity_reservation_name_;
   }
    : capacity_assignment_configuration)

let make_get_capacity_assignment_configuration_output
    ~capacity_assignment_configuration:
      (capacity_assignment_configuration_ : capacity_assignment_configuration) () =
  ({ capacity_assignment_configuration = capacity_assignment_configuration_ }
    : get_capacity_assignment_configuration_output)

let make_get_capacity_assignment_configuration_input
    ~capacity_reservation_name:(capacity_reservation_name_ : capacity_reservation_name) () =
  ({ capacity_reservation_name = capacity_reservation_name_ }
    : get_capacity_assignment_configuration_input)

let make_calculation_statistics ?progress:(progress_ : description_string option)
    ?dpu_execution_in_millis:(dpu_execution_in_millis_ : long option) () =
  ({ progress = progress_; dpu_execution_in_millis = dpu_execution_in_millis_ }
    : calculation_statistics)

let make_get_calculation_execution_status_response
    ?statistics:(statistics_ : calculation_statistics option)
    ?status:(status_ : calculation_status option) () =
  ({ statistics = statistics_; status = status_ } : get_calculation_execution_status_response)

let make_get_calculation_execution_status_request
    ~calculation_execution_id:(calculation_execution_id_ : calculation_execution_id) () =
  ({ calculation_execution_id = calculation_execution_id_ }
    : get_calculation_execution_status_request)

let make_get_calculation_execution_response ?result_:(result__ : calculation_result option)
    ?statistics:(statistics_ : calculation_statistics option)
    ?status:(status_ : calculation_status option)
    ?working_directory:(working_directory_ : s3_uri option)
    ?description:(description_ : description_string option)
    ?session_id:(session_id_ : session_id option)
    ?calculation_execution_id:(calculation_execution_id_ : calculation_execution_id option) () =
  ({
     result_ = result__;
     statistics = statistics_;
     status = status_;
     working_directory = working_directory_;
     description = description_;
     session_id = session_id_;
     calculation_execution_id = calculation_execution_id_;
   }
    : get_calculation_execution_response)

let make_get_calculation_execution_request
    ~calculation_execution_id:(calculation_execution_id_ : calculation_execution_id) () =
  ({ calculation_execution_id = calculation_execution_id_ } : get_calculation_execution_request)

let make_get_calculation_execution_code_response ?code_block:(code_block_ : code_block option) () =
  ({ code_block = code_block_ } : get_calculation_execution_code_response)

let make_get_calculation_execution_code_request
    ~calculation_execution_id:(calculation_execution_id_ : calculation_execution_id) () =
  ({ calculation_execution_id = calculation_execution_id_ }
    : get_calculation_execution_code_request)

let make_export_notebook_output ?payload:(payload_ : payload option)
    ?notebook_metadata:(notebook_metadata_ : notebook_metadata option) () =
  ({ payload = payload_; notebook_metadata = notebook_metadata_ } : export_notebook_output)

let make_export_notebook_input ~notebook_id:(notebook_id_ : notebook_id) () =
  ({ notebook_id = notebook_id_ } : export_notebook_input)

let make_delete_work_group_output () = (() : unit)

let make_delete_work_group_input
    ?recursive_delete_option:(recursive_delete_option_ : boxed_boolean option)
    ~work_group:(work_group_ : work_group_name) () =
  ({ recursive_delete_option = recursive_delete_option_; work_group = work_group_ }
    : delete_work_group_input)

let make_delete_prepared_statement_output () = (() : unit)

let make_delete_prepared_statement_input ~work_group:(work_group_ : work_group_name)
    ~statement_name:(statement_name_ : statement_name) () =
  ({ work_group = work_group_; statement_name = statement_name_ } : delete_prepared_statement_input)

let make_delete_notebook_output () = (() : unit)

let make_delete_notebook_input ~notebook_id:(notebook_id_ : notebook_id) () =
  ({ notebook_id = notebook_id_ } : delete_notebook_input)

let make_delete_named_query_output () = (() : unit)

let make_delete_named_query_input ~named_query_id:(named_query_id_ : named_query_id) () =
  ({ named_query_id = named_query_id_ } : delete_named_query_input)

let make_delete_data_catalog_output ?data_catalog:(data_catalog_ : data_catalog option) () =
  ({ data_catalog = data_catalog_ } : delete_data_catalog_output)

let make_delete_data_catalog_input ?delete_catalog_only:(delete_catalog_only_ : boolean_ option)
    ~name:(name_ : catalog_name_string) () =
  ({ delete_catalog_only = delete_catalog_only_; name = name_ } : delete_data_catalog_input)

let make_delete_capacity_reservation_output () = (() : unit)

let make_delete_capacity_reservation_input ~name:(name_ : capacity_reservation_name) () =
  ({ name = name_ } : delete_capacity_reservation_input)

let make_create_work_group_output () = (() : unit)

let make_create_work_group_input ?tags:(tags_ : tag_list option)
    ?description:(description_ : work_group_description_string option)
    ?configuration:(configuration_ : work_group_configuration option)
    ~name:(name_ : work_group_name) () =
  ({ tags = tags_; description = description_; configuration = configuration_; name = name_ }
    : create_work_group_input)

let make_create_presigned_notebook_url_response
    ~auth_token_expiration_time:(auth_token_expiration_time_ : long)
    ~auth_token:(auth_token_ : auth_token) ~notebook_url:(notebook_url_ : string_) () =
  ({
     auth_token_expiration_time = auth_token_expiration_time_;
     auth_token = auth_token_;
     notebook_url = notebook_url_;
   }
    : create_presigned_notebook_url_response)

let make_create_presigned_notebook_url_request ~session_id:(session_id_ : session_id) () =
  ({ session_id = session_id_ } : create_presigned_notebook_url_request)

let make_create_prepared_statement_output () = (() : unit)

let make_create_prepared_statement_input ?description:(description_ : description_string option)
    ~query_statement:(query_statement_ : query_string) ~work_group:(work_group_ : work_group_name)
    ~statement_name:(statement_name_ : statement_name) () =
  ({
     description = description_;
     query_statement = query_statement_;
     work_group = work_group_;
     statement_name = statement_name_;
   }
    : create_prepared_statement_input)

let make_create_notebook_output ?notebook_id:(notebook_id_ : notebook_id option) () =
  ({ notebook_id = notebook_id_ } : create_notebook_output)

let make_create_notebook_input
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~name:(name_ : notebook_name) ~work_group:(work_group_ : work_group_name) () =
  ({ client_request_token = client_request_token_; name = name_; work_group = work_group_ }
    : create_notebook_input)

let make_create_named_query_output ?named_query_id:(named_query_id_ : named_query_id option) () =
  ({ named_query_id = named_query_id_ } : create_named_query_output)

let make_create_named_query_input ?work_group:(work_group_ : work_group_name option)
    ?client_request_token:(client_request_token_ : idempotency_token option)
    ?description:(description_ : description_string option)
    ~query_string:(query_string_ : query_string) ~database:(database_ : database_string)
    ~name:(name_ : name_string) () =
  ({
     work_group = work_group_;
     client_request_token = client_request_token_;
     query_string = query_string_;
     database = database_;
     description = description_;
     name = name_;
   }
    : create_named_query_input)

let make_create_data_catalog_output ?data_catalog:(data_catalog_ : data_catalog option) () =
  ({ data_catalog = data_catalog_ } : create_data_catalog_output)

let make_create_data_catalog_input ?tags:(tags_ : tag_list option)
    ?parameters:(parameters_ : parameters_map option)
    ?description:(description_ : description_string option) ~type_:(type__ : data_catalog_type)
    ~name:(name_ : catalog_name_string) () =
  ({
     tags = tags_;
     parameters = parameters_;
     description = description_;
     type_ = type__;
     name = name_;
   }
    : create_data_catalog_input)

let make_create_capacity_reservation_output () = (() : unit)

let make_create_capacity_reservation_input ?tags:(tags_ : tag_list option)
    ~name:(name_ : capacity_reservation_name) ~target_dpus:(target_dpus_ : target_dpus_integer) () =
  ({ tags = tags_; name = name_; target_dpus = target_dpus_ } : create_capacity_reservation_input)

let make_cancel_capacity_reservation_output () = (() : unit)

let make_cancel_capacity_reservation_input ~name:(name_ : capacity_reservation_name) () =
  ({ name = name_ } : cancel_capacity_reservation_input)

let make_batch_get_query_execution_output
    ?unprocessed_query_execution_ids:
      (unprocessed_query_execution_ids_ : unprocessed_query_execution_id_list option)
    ?query_executions:(query_executions_ : query_execution_list option) () =
  ({
     unprocessed_query_execution_ids = unprocessed_query_execution_ids_;
     query_executions = query_executions_;
   }
    : batch_get_query_execution_output)

let make_batch_get_query_execution_input
    ~query_execution_ids:(query_execution_ids_ : query_execution_id_list) () =
  ({ query_execution_ids = query_execution_ids_ } : batch_get_query_execution_input)

let make_batch_get_prepared_statement_output
    ?unprocessed_prepared_statement_names:
      (unprocessed_prepared_statement_names_ : unprocessed_prepared_statement_name_list option)
    ?prepared_statements:(prepared_statements_ : prepared_statement_details_list option) () =
  ({
     unprocessed_prepared_statement_names = unprocessed_prepared_statement_names_;
     prepared_statements = prepared_statements_;
   }
    : batch_get_prepared_statement_output)

let make_batch_get_prepared_statement_input ~work_group:(work_group_ : work_group_name)
    ~prepared_statement_names:(prepared_statement_names_ : prepared_statement_name_list) () =
  ({ work_group = work_group_; prepared_statement_names = prepared_statement_names_ }
    : batch_get_prepared_statement_input)

let make_batch_get_named_query_output
    ?unprocessed_named_query_ids:
      (unprocessed_named_query_ids_ : unprocessed_named_query_id_list option)
    ?named_queries:(named_queries_ : named_query_list option) () =
  ({ unprocessed_named_query_ids = unprocessed_named_query_ids_; named_queries = named_queries_ }
    : batch_get_named_query_output)

let make_batch_get_named_query_input ~named_query_ids:(named_query_ids_ : named_query_id_list) () =
  ({ named_query_ids = named_query_ids_ } : batch_get_named_query_input)
