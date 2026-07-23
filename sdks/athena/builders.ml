open Types

let make_acl_configuration ~s3_acl_option:(s3_acl_option_ : s3_acl_option) () =
  ({ s3_acl_option = s3_acl_option_ } : acl_configuration)

let make_update_work_group_output () = (() : unit)

let make_classification ?name:(name_ : name_string option)
    ?properties:(properties_ : parameters_map option) () =
  ({ name = name_; properties = properties_ } : classification)

let make_engine_configuration
    ?coordinator_dpu_size:(coordinator_dpu_size_ : coordinator_dpu_size option)
    ?max_concurrent_dpus:(max_concurrent_dpus_ : max_concurrent_dpus option)
    ?default_executor_dpu_size:(default_executor_dpu_size_ : default_executor_dpu_size option)
    ?additional_configs:(additional_configs_ : parameters_map option)
    ?spark_properties:(spark_properties_ : parameters_map option)
    ?classifications:(classifications_ : classification_list option) () =
  ({
     coordinator_dpu_size = coordinator_dpu_size_;
     max_concurrent_dpus = max_concurrent_dpus_;
     default_executor_dpu_size = default_executor_dpu_size_;
     additional_configs = additional_configs_;
     spark_properties = spark_properties_;
     classifications = classifications_;
   }
    : engine_configuration)

let make_s3_logging_configuration ?kms_key:(kms_key_ : kms_key option)
    ?log_location:(log_location_ : s3_output_location option) ~enabled:(enabled_ : boxed_boolean) ()
    =
  ({ enabled = enabled_; kms_key = kms_key_; log_location = log_location_ }
    : s3_logging_configuration)

let make_managed_logging_configuration ?kms_key:(kms_key_ : kms_key option)
    ~enabled:(enabled_ : boxed_boolean) () =
  ({ enabled = enabled_; kms_key = kms_key_ } : managed_logging_configuration)

let make_cloud_watch_logging_configuration ?log_group:(log_group_ : log_group_name option)
    ?log_stream_name_prefix:(log_stream_name_prefix_ : log_stream_name_prefix option)
    ?log_types:(log_types_ : log_types_map option) ~enabled:(enabled_ : boxed_boolean) () =
  ({
     enabled = enabled_;
     log_group = log_group_;
     log_stream_name_prefix = log_stream_name_prefix_;
     log_types = log_types_;
   }
    : cloud_watch_logging_configuration)

let make_monitoring_configuration
    ?cloud_watch_logging_configuration:
      (cloud_watch_logging_configuration_ : cloud_watch_logging_configuration option)
    ?managed_logging_configuration:
      (managed_logging_configuration_ : managed_logging_configuration option)
    ?s3_logging_configuration:(s3_logging_configuration_ : s3_logging_configuration option) () =
  ({
     cloud_watch_logging_configuration = cloud_watch_logging_configuration_;
     managed_logging_configuration = managed_logging_configuration_;
     s3_logging_configuration = s3_logging_configuration_;
   }
    : monitoring_configuration)

let make_query_results_s3_access_grants_configuration
    ?create_user_level_prefix:(create_user_level_prefix_ : boxed_boolean option)
    ~enable_s3_access_grants:(enable_s3_access_grants_ : boxed_boolean)
    ~authentication_type:(authentication_type_ : authentication_type) () =
  ({
     enable_s3_access_grants = enable_s3_access_grants_;
     create_user_level_prefix = create_user_level_prefix_;
     authentication_type = authentication_type_;
   }
    : query_results_s3_access_grants_configuration)

let make_customer_content_encryption_configuration ~kms_key:(kms_key_ : kms_key) () =
  ({ kms_key = kms_key_ } : customer_content_encryption_configuration)

let make_engine_version ?selected_engine_version:(selected_engine_version_ : name_string option)
    ?effective_engine_version:(effective_engine_version_ : name_string option) () =
  ({
     selected_engine_version = selected_engine_version_;
     effective_engine_version = effective_engine_version_;
   }
    : engine_version)

let make_managed_query_results_encryption_configuration ~kms_key:(kms_key_ : kms_key) () =
  ({ kms_key = kms_key_ } : managed_query_results_encryption_configuration)

let make_managed_query_results_configuration_updates ?enabled:(enabled_ : boxed_boolean option)
    ?encryption_configuration:
      (encryption_configuration_ : managed_query_results_encryption_configuration option)
    ?remove_encryption_configuration:(remove_encryption_configuration_ : boxed_boolean option) () =
  ({
     enabled = enabled_;
     encryption_configuration = encryption_configuration_;
     remove_encryption_configuration = remove_encryption_configuration_;
   }
    : managed_query_results_configuration_updates)

let make_encryption_configuration ?kms_key:(kms_key_ : string_ option)
    ~encryption_option:(encryption_option_ : encryption_option) () =
  ({ encryption_option = encryption_option_; kms_key = kms_key_ } : encryption_configuration)

let make_result_configuration_updates
    ?output_location:(output_location_ : result_output_location option)
    ?remove_output_location:(remove_output_location_ : boxed_boolean option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?remove_encryption_configuration:(remove_encryption_configuration_ : boxed_boolean option)
    ?expected_bucket_owner:(expected_bucket_owner_ : aws_account_id option)
    ?remove_expected_bucket_owner:(remove_expected_bucket_owner_ : boxed_boolean option)
    ?acl_configuration:(acl_configuration_ : acl_configuration option)
    ?remove_acl_configuration:(remove_acl_configuration_ : boxed_boolean option) () =
  ({
     output_location = output_location_;
     remove_output_location = remove_output_location_;
     encryption_configuration = encryption_configuration_;
     remove_encryption_configuration = remove_encryption_configuration_;
     expected_bucket_owner = expected_bucket_owner_;
     remove_expected_bucket_owner = remove_expected_bucket_owner_;
     acl_configuration = acl_configuration_;
     remove_acl_configuration = remove_acl_configuration_;
   }
    : result_configuration_updates)

let make_work_group_configuration_updates
    ?enforce_work_group_configuration:(enforce_work_group_configuration_ : boxed_boolean option)
    ?result_configuration_updates:
      (result_configuration_updates_ : result_configuration_updates option)
    ?managed_query_results_configuration_updates:
      (managed_query_results_configuration_updates_ :
         managed_query_results_configuration_updates option)
    ?publish_cloud_watch_metrics_enabled:
      (publish_cloud_watch_metrics_enabled_ : boxed_boolean option)
    ?bytes_scanned_cutoff_per_query:
      (bytes_scanned_cutoff_per_query_ : bytes_scanned_cutoff_value option)
    ?remove_bytes_scanned_cutoff_per_query:
      (remove_bytes_scanned_cutoff_per_query_ : boxed_boolean option)
    ?requester_pays_enabled:(requester_pays_enabled_ : boxed_boolean option)
    ?engine_version:(engine_version_ : engine_version option)
    ?remove_customer_content_encryption_configuration:
      (remove_customer_content_encryption_configuration_ : boxed_boolean option)
    ?additional_configuration:(additional_configuration_ : name_string option)
    ?execution_role:(execution_role_ : role_arn option)
    ?customer_content_encryption_configuration:
      (customer_content_encryption_configuration_ : customer_content_encryption_configuration option)
    ?enable_minimum_encryption_configuration:
      (enable_minimum_encryption_configuration_ : boxed_boolean option)
    ?query_results_s3_access_grants_configuration:
      (query_results_s3_access_grants_configuration_ :
         query_results_s3_access_grants_configuration option)
    ?monitoring_configuration:(monitoring_configuration_ : monitoring_configuration option)
    ?engine_configuration:(engine_configuration_ : engine_configuration option) () =
  ({
     enforce_work_group_configuration = enforce_work_group_configuration_;
     result_configuration_updates = result_configuration_updates_;
     managed_query_results_configuration_updates = managed_query_results_configuration_updates_;
     publish_cloud_watch_metrics_enabled = publish_cloud_watch_metrics_enabled_;
     bytes_scanned_cutoff_per_query = bytes_scanned_cutoff_per_query_;
     remove_bytes_scanned_cutoff_per_query = remove_bytes_scanned_cutoff_per_query_;
     requester_pays_enabled = requester_pays_enabled_;
     engine_version = engine_version_;
     remove_customer_content_encryption_configuration =
       remove_customer_content_encryption_configuration_;
     additional_configuration = additional_configuration_;
     execution_role = execution_role_;
     customer_content_encryption_configuration = customer_content_encryption_configuration_;
     enable_minimum_encryption_configuration = enable_minimum_encryption_configuration_;
     query_results_s3_access_grants_configuration = query_results_s3_access_grants_configuration_;
     monitoring_configuration = monitoring_configuration_;
     engine_configuration = engine_configuration_;
   }
    : work_group_configuration_updates)

let make_update_work_group_input ?description:(description_ : work_group_description_string option)
    ?configuration_updates:(configuration_updates_ : work_group_configuration_updates option)
    ?state:(state_ : work_group_state option) ~work_group:(work_group_ : work_group_name) () =
  ({
     work_group = work_group_;
     description = description_;
     configuration_updates = configuration_updates_;
     state = state_;
   }
    : update_work_group_input)

let make_update_prepared_statement_output () = (() : unit)

let make_update_prepared_statement_input ?description:(description_ : description_string option)
    ~statement_name:(statement_name_ : statement_name) ~work_group:(work_group_ : work_group_name)
    ~query_statement:(query_statement_ : query_string) () =
  ({
     statement_name = statement_name_;
     work_group = work_group_;
     query_statement = query_statement_;
     description = description_;
   }
    : update_prepared_statement_input)

let make_update_notebook_metadata_output () = (() : unit)

let make_update_notebook_metadata_input
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~notebook_id:(notebook_id_ : notebook_id) ~name:(name_ : notebook_name) () =
  ({ notebook_id = notebook_id_; client_request_token = client_request_token_; name = name_ }
    : update_notebook_metadata_input)

let make_update_notebook_output () = (() : unit)

let make_update_notebook_input ?session_id:(session_id_ : session_id option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~notebook_id:(notebook_id_ : notebook_id) ~payload:(payload_ : payload)
    ~type_:(type__ : notebook_type) () =
  ({
     notebook_id = notebook_id_;
     payload = payload_;
     type_ = type__;
     session_id = session_id_;
     client_request_token = client_request_token_;
   }
    : update_notebook_input)

let make_update_named_query_output () = (() : unit)

let make_update_named_query_input
    ?description:(description_ : named_query_description_string option)
    ~named_query_id:(named_query_id_ : named_query_id) ~name:(name_ : name_string)
    ~query_string:(query_string_ : query_string) () =
  ({
     named_query_id = named_query_id_;
     name = name_;
     description = description_;
     query_string = query_string_;
   }
    : update_named_query_input)

let make_update_data_catalog_output () = (() : unit)

let make_update_data_catalog_input ?description:(description_ : description_string option)
    ?parameters:(parameters_ : parameters_map option) ~name:(name_ : catalog_name_string)
    ~type_:(type__ : data_catalog_type) () =
  ({ name = name_; type_ = type__; description = description_; parameters = parameters_ }
    : update_data_catalog_input)

let make_update_capacity_reservation_output () = (() : unit)

let make_update_capacity_reservation_input ~target_dpus:(target_dpus_ : target_dpus_integer)
    ~name:(name_ : capacity_reservation_name) () =
  ({ target_dpus = target_dpus_; name = name_ } : update_capacity_reservation_input)

let make_untag_resource_output () = (() : unit)

let make_untag_resource_input ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_input)

let make_terminate_session_response ?state:(state_ : session_state option) () =
  ({ state = state_ } : terminate_session_response)

let make_terminate_session_request ~session_id:(session_id_ : session_id) () =
  ({ session_id = session_id_ } : terminate_session_request)

let make_tag_resource_output () = (() : unit)

let make_tag ?key:(key_ : tag_key option) ?value:(value_ : tag_value option) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_input ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_input)

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

let make_start_session_response ?session_id:(session_id_ : session_id option)
    ?state:(state_ : session_state option) () =
  ({ session_id = session_id_; state = state_ } : start_session_response)

let make_start_session_request ?description:(description_ : description_string option)
    ?execution_role:(execution_role_ : role_arn option)
    ?monitoring_configuration:(monitoring_configuration_ : monitoring_configuration option)
    ?notebook_version:(notebook_version_ : name_string option)
    ?session_idle_timeout_in_minutes:
      (session_idle_timeout_in_minutes_ : session_idle_timeout_in_minutes option)
    ?client_request_token:(client_request_token_ : idempotency_token option)
    ?tags:(tags_ : tag_list option)
    ?copy_work_group_tags:(copy_work_group_tags_ : boxed_boolean option)
    ~work_group:(work_group_ : work_group_name)
    ~engine_configuration:(engine_configuration_ : engine_configuration) () =
  ({
     description = description_;
     work_group = work_group_;
     engine_configuration = engine_configuration_;
     execution_role = execution_role_;
     monitoring_configuration = monitoring_configuration_;
     notebook_version = notebook_version_;
     session_idle_timeout_in_minutes = session_idle_timeout_in_minutes_;
     client_request_token = client_request_token_;
     tags = tags_;
     copy_work_group_tags = copy_work_group_tags_;
   }
    : start_session_request)

let make_start_query_execution_output
    ?query_execution_id:(query_execution_id_ : query_execution_id option) () =
  ({ query_execution_id = query_execution_id_ } : start_query_execution_output)

let make_result_reuse_by_age_configuration ?max_age_in_minutes:(max_age_in_minutes_ : age option)
    ~enabled:(enabled_ : boolean_) () =
  ({ enabled = enabled_; max_age_in_minutes = max_age_in_minutes_ }
    : result_reuse_by_age_configuration)

let make_result_reuse_configuration
    ?result_reuse_by_age_configuration:
      (result_reuse_by_age_configuration_ : result_reuse_by_age_configuration option) () =
  ({ result_reuse_by_age_configuration = result_reuse_by_age_configuration_ }
    : result_reuse_configuration)

let make_result_configuration ?output_location:(output_location_ : result_output_location option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?expected_bucket_owner:(expected_bucket_owner_ : aws_account_id option)
    ?acl_configuration:(acl_configuration_ : acl_configuration option) () =
  ({
     output_location = output_location_;
     encryption_configuration = encryption_configuration_;
     expected_bucket_owner = expected_bucket_owner_;
     acl_configuration = acl_configuration_;
   }
    : result_configuration)

let make_query_execution_context ?database:(database_ : database_string option)
    ?catalog:(catalog_ : catalog_name_string option) () =
  ({ database = database_; catalog = catalog_ } : query_execution_context)

let make_start_query_execution_input
    ?client_request_token:(client_request_token_ : idempotency_token option)
    ?query_execution_context:(query_execution_context_ : query_execution_context option)
    ?result_configuration:(result_configuration_ : result_configuration option)
    ?work_group:(work_group_ : work_group_name option)
    ?execution_parameters:(execution_parameters_ : execution_parameters option)
    ?result_reuse_configuration:(result_reuse_configuration_ : result_reuse_configuration option)
    ?engine_configuration:(engine_configuration_ : engine_configuration option)
    ~query_string:(query_string_ : query_string) () =
  ({
     query_string = query_string_;
     client_request_token = client_request_token_;
     query_execution_context = query_execution_context_;
     result_configuration = result_configuration_;
     work_group = work_group_;
     execution_parameters = execution_parameters_;
     result_reuse_configuration = result_reuse_configuration_;
     engine_configuration = engine_configuration_;
   }
    : start_query_execution_input)

let make_start_calculation_execution_response
    ?calculation_execution_id:(calculation_execution_id_ : calculation_execution_id option)
    ?state:(state_ : calculation_execution_state option) () =
  ({ calculation_execution_id = calculation_execution_id_; state = state_ }
    : start_calculation_execution_response)

let make_calculation_configuration ?code_block:(code_block_ : code_block option) () =
  ({ code_block = code_block_ } : calculation_configuration)

let make_start_calculation_execution_request ?description:(description_ : description_string option)
    ?calculation_configuration:(calculation_configuration_ : calculation_configuration option)
    ?code_block:(code_block_ : code_block option)
    ?client_request_token:(client_request_token_ : idempotency_token option)
    ~session_id:(session_id_ : session_id) () =
  ({
     session_id = session_id_;
     description = description_;
     calculation_configuration = calculation_configuration_;
     code_block = code_block_;
     client_request_token = client_request_token_;
   }
    : start_calculation_execution_request)

let make_put_capacity_assignment_configuration_output () = (() : unit)

let make_capacity_assignment ?work_group_names:(work_group_names_ : work_group_names_list option) ()
    =
  ({ work_group_names = work_group_names_ } : capacity_assignment)

let make_put_capacity_assignment_configuration_input
    ~capacity_reservation_name:(capacity_reservation_name_ : capacity_reservation_name)
    ~capacity_assignments:(capacity_assignments_ : capacity_assignments_list) () =
  ({
     capacity_reservation_name = capacity_reservation_name_;
     capacity_assignments = capacity_assignments_;
   }
    : put_capacity_assignment_configuration_input)

let make_work_group_summary ?name:(name_ : work_group_name option)
    ?state:(state_ : work_group_state option)
    ?description:(description_ : work_group_description_string option)
    ?creation_time:(creation_time_ : date option)
    ?engine_version:(engine_version_ : engine_version option)
    ?identity_center_application_arn:
      (identity_center_application_arn_ : identity_center_application_arn option) () =
  ({
     name = name_;
     state = state_;
     description = description_;
     creation_time = creation_time_;
     engine_version = engine_version_;
     identity_center_application_arn = identity_center_application_arn_;
   }
    : work_group_summary)

let make_list_work_groups_output ?work_groups:(work_groups_ : work_groups_list option)
    ?next_token:(next_token_ : token option) () =
  ({ work_groups = work_groups_; next_token = next_token_ } : list_work_groups_output)

let make_list_work_groups_input ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_work_groups_count option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_work_groups_input)

let make_list_tags_for_resource_output ?tags:(tags_ : tag_list option)
    ?next_token:(next_token_ : token option) () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_tags_count option)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_; next_token = next_token_; max_results = max_results_ }
    : list_tags_for_resource_input)

let make_column ?type_:(type__ : type_string option) ?comment:(comment_ : comment_string option)
    ~name:(name_ : name_string) () =
  ({ name = name_; type_ = type__; comment = comment_ } : column)

let make_table_metadata ?create_time:(create_time_ : timestamp option)
    ?last_access_time:(last_access_time_ : timestamp option)
    ?table_type:(table_type_ : table_type_string option) ?columns:(columns_ : column_list option)
    ?partition_keys:(partition_keys_ : column_list option)
    ?parameters:(parameters_ : parameters_map option) ~name:(name_ : name_string) () =
  ({
     name = name_;
     create_time = create_time_;
     last_access_time = last_access_time_;
     table_type = table_type_;
     columns = columns_;
     partition_keys = partition_keys_;
     parameters = parameters_;
   }
    : table_metadata)

let make_list_table_metadata_output
    ?table_metadata_list:(table_metadata_list_ : table_metadata_list option)
    ?next_token:(next_token_ : token option) () =
  ({ table_metadata_list = table_metadata_list_; next_token = next_token_ }
    : list_table_metadata_output)

let make_list_table_metadata_input ?expression:(expression_ : expression_string option)
    ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_table_metadata_count option)
    ?work_group:(work_group_ : work_group_name option)
    ~catalog_name:(catalog_name_ : catalog_name_string)
    ~database_name:(database_name_ : name_string) () =
  ({
     catalog_name = catalog_name_;
     database_name = database_name_;
     expression = expression_;
     next_token = next_token_;
     max_results = max_results_;
     work_group = work_group_;
   }
    : list_table_metadata_input)

let make_session_status ?start_date_time:(start_date_time_ : date option)
    ?last_modified_date_time:(last_modified_date_time_ : date option)
    ?end_date_time:(end_date_time_ : date option)
    ?idle_since_date_time:(idle_since_date_time_ : date option)
    ?state:(state_ : session_state option)
    ?state_change_reason:(state_change_reason_ : description_string option) () =
  ({
     start_date_time = start_date_time_;
     last_modified_date_time = last_modified_date_time_;
     end_date_time = end_date_time_;
     idle_since_date_time = idle_since_date_time_;
     state = state_;
     state_change_reason = state_change_reason_;
   }
    : session_status)

let make_session_summary ?session_id:(session_id_ : session_id option)
    ?description:(description_ : description_string option)
    ?engine_version:(engine_version_ : engine_version option)
    ?notebook_version:(notebook_version_ : name_string option)
    ?status:(status_ : session_status option) () =
  ({
     session_id = session_id_;
     description = description_;
     engine_version = engine_version_;
     notebook_version = notebook_version_;
     status = status_;
   }
    : session_summary)

let make_list_sessions_response ?next_token:(next_token_ : session_manager_token option)
    ?sessions:(sessions_ : sessions_list option) () =
  ({ next_token = next_token_; sessions = sessions_ } : list_sessions_response)

let make_list_sessions_request ?state_filter:(state_filter_ : session_state option)
    ?max_results:(max_results_ : max_sessions_count option)
    ?next_token:(next_token_ : session_manager_token option)
    ~work_group:(work_group_ : work_group_name) () =
  ({
     work_group = work_group_;
     state_filter = state_filter_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_sessions_request)

let make_list_query_executions_output
    ?query_execution_ids:(query_execution_ids_ : query_execution_id_list option)
    ?next_token:(next_token_ : token option) () =
  ({ query_execution_ids = query_execution_ids_; next_token = next_token_ }
    : list_query_executions_output)

let make_list_query_executions_input ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_query_executions_count option)
    ?work_group:(work_group_ : work_group_name option) () =
  ({ next_token = next_token_; max_results = max_results_; work_group = work_group_ }
    : list_query_executions_input)

let make_prepared_statement_summary ?statement_name:(statement_name_ : statement_name option)
    ?last_modified_time:(last_modified_time_ : date option) () =
  ({ statement_name = statement_name_; last_modified_time = last_modified_time_ }
    : prepared_statement_summary)

let make_list_prepared_statements_output
    ?prepared_statements:(prepared_statements_ : prepared_statements_list option)
    ?next_token:(next_token_ : token option) () =
  ({ prepared_statements = prepared_statements_; next_token = next_token_ }
    : list_prepared_statements_output)

let make_list_prepared_statements_input ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_prepared_statements_count option)
    ~work_group:(work_group_ : work_group_name) () =
  ({ work_group = work_group_; next_token = next_token_; max_results = max_results_ }
    : list_prepared_statements_input)

let make_notebook_session_summary ?session_id:(session_id_ : session_id option)
    ?creation_time:(creation_time_ : date option) () =
  ({ session_id = session_id_; creation_time = creation_time_ } : notebook_session_summary)

let make_list_notebook_sessions_response ?next_token:(next_token_ : token option)
    ~notebook_sessions_list:(notebook_sessions_list_ : notebook_sessions_list) () =
  ({ notebook_sessions_list = notebook_sessions_list_; next_token = next_token_ }
    : list_notebook_sessions_response)

let make_list_notebook_sessions_request ?max_results:(max_results_ : max_sessions_count option)
    ?next_token:(next_token_ : token option) ~notebook_id:(notebook_id_ : notebook_id) () =
  ({ notebook_id = notebook_id_; max_results = max_results_; next_token = next_token_ }
    : list_notebook_sessions_request)

let make_notebook_metadata ?notebook_id:(notebook_id_ : notebook_id option)
    ?name:(name_ : notebook_name option) ?work_group:(work_group_ : work_group_name option)
    ?creation_time:(creation_time_ : date option) ?type_:(type__ : notebook_type option)
    ?last_modified_time:(last_modified_time_ : date option) () =
  ({
     notebook_id = notebook_id_;
     name = name_;
     work_group = work_group_;
     creation_time = creation_time_;
     type_ = type__;
     last_modified_time = last_modified_time_;
   }
    : notebook_metadata)

let make_list_notebook_metadata_output ?next_token:(next_token_ : token option)
    ?notebook_metadata_list:(notebook_metadata_list_ : notebook_metadata_array option) () =
  ({ next_token = next_token_; notebook_metadata_list = notebook_metadata_list_ }
    : list_notebook_metadata_output)

let make_filter_definition ?name:(name_ : notebook_name option) () =
  ({ name = name_ } : filter_definition)

let make_list_notebook_metadata_input ?filters:(filters_ : filter_definition option)
    ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_notebooks_count option)
    ~work_group:(work_group_ : work_group_name) () =
  ({
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
     work_group = work_group_;
   }
    : list_notebook_metadata_input)

let make_list_named_queries_output ?named_query_ids:(named_query_ids_ : named_query_id_list option)
    ?next_token:(next_token_ : token option) () =
  ({ named_query_ids = named_query_ids_; next_token = next_token_ } : list_named_queries_output)

let make_list_named_queries_input ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_named_queries_count option)
    ?work_group:(work_group_ : work_group_name option) () =
  ({ next_token = next_token_; max_results = max_results_; work_group = work_group_ }
    : list_named_queries_input)

let make_executors_summary ?executor_type:(executor_type_ : executor_type option)
    ?start_date_time:(start_date_time_ : long option)
    ?termination_date_time:(termination_date_time_ : long option)
    ?executor_state:(executor_state_ : executor_state option)
    ?executor_size:(executor_size_ : long option) ~executor_id:(executor_id_ : executor_id) () =
  ({
     executor_id = executor_id_;
     executor_type = executor_type_;
     start_date_time = start_date_time_;
     termination_date_time = termination_date_time_;
     executor_state = executor_state_;
     executor_size = executor_size_;
   }
    : executors_summary)

let make_list_executors_response ?next_token:(next_token_ : session_manager_token option)
    ?executors_summary:(executors_summary_ : executors_summary_list option)
    ~session_id:(session_id_ : session_id) () =
  ({ session_id = session_id_; next_token = next_token_; executors_summary = executors_summary_ }
    : list_executors_response)

let make_list_executors_request
    ?executor_state_filter:(executor_state_filter_ : executor_state option)
    ?max_results:(max_results_ : max_list_executors_count option)
    ?next_token:(next_token_ : session_manager_token option) ~session_id:(session_id_ : session_id)
    () =
  ({
     session_id = session_id_;
     executor_state_filter = executor_state_filter_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_executors_request)

let make_list_engine_versions_output
    ?engine_versions:(engine_versions_ : engine_versions_list option)
    ?next_token:(next_token_ : token option) () =
  ({ engine_versions = engine_versions_; next_token = next_token_ } : list_engine_versions_output)

let make_list_engine_versions_input ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_engine_versions_count option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_engine_versions_input)

let make_data_catalog_summary ?catalog_name:(catalog_name_ : catalog_name_string option)
    ?type_:(type__ : data_catalog_type option) ?status:(status_ : data_catalog_status option)
    ?connection_type:(connection_type_ : connection_type option)
    ?error:(error_ : error_message option) () =
  ({
     catalog_name = catalog_name_;
     type_ = type__;
     status = status_;
     connection_type = connection_type_;
     error = error_;
   }
    : data_catalog_summary)

let make_list_data_catalogs_output
    ?data_catalogs_summary:(data_catalogs_summary_ : data_catalog_summary_list option)
    ?next_token:(next_token_ : token option) () =
  ({ data_catalogs_summary = data_catalogs_summary_; next_token = next_token_ }
    : list_data_catalogs_output)

let make_list_data_catalogs_input ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_data_catalogs_count option)
    ?work_group:(work_group_ : work_group_name option) () =
  ({ next_token = next_token_; max_results = max_results_; work_group = work_group_ }
    : list_data_catalogs_input)

let make_database ?description:(description_ : description_string option)
    ?parameters:(parameters_ : parameters_map option) ~name:(name_ : name_string) () =
  ({ name = name_; description = description_; parameters = parameters_ } : database)

let make_list_databases_output ?database_list:(database_list_ : database_list option)
    ?next_token:(next_token_ : token option) () =
  ({ database_list = database_list_; next_token = next_token_ } : list_databases_output)

let make_list_databases_input ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_databases_count option)
    ?work_group:(work_group_ : work_group_name option)
    ~catalog_name:(catalog_name_ : catalog_name_string) () =
  ({
     catalog_name = catalog_name_;
     next_token = next_token_;
     max_results = max_results_;
     work_group = work_group_;
   }
    : list_databases_input)

let make_capacity_allocation ?status_message:(status_message_ : string_ option)
    ?request_completion_time:(request_completion_time_ : timestamp option)
    ~status:(status_ : capacity_allocation_status) ~request_time:(request_time_ : timestamp) () =
  ({
     status = status_;
     status_message = status_message_;
     request_time = request_time_;
     request_completion_time = request_completion_time_;
   }
    : capacity_allocation)

let make_capacity_reservation ?last_allocation:(last_allocation_ : capacity_allocation option)
    ?last_successful_allocation_time:(last_successful_allocation_time_ : timestamp option)
    ~name:(name_ : capacity_reservation_name) ~status:(status_ : capacity_reservation_status)
    ~target_dpus:(target_dpus_ : target_dpus_integer)
    ~allocated_dpus:(allocated_dpus_ : allocated_dpus_integer)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     name = name_;
     status = status_;
     target_dpus = target_dpus_;
     allocated_dpus = allocated_dpus_;
     last_allocation = last_allocation_;
     last_successful_allocation_time = last_successful_allocation_time_;
     creation_time = creation_time_;
   }
    : capacity_reservation)

let make_list_capacity_reservations_output ?next_token:(next_token_ : token option)
    ~capacity_reservations:(capacity_reservations_ : capacity_reservations_list) () =
  ({ next_token = next_token_; capacity_reservations = capacity_reservations_ }
    : list_capacity_reservations_output)

let make_list_capacity_reservations_input ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_capacity_reservations_count option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_capacity_reservations_input)

let make_calculation_status ?submission_date_time:(submission_date_time_ : date option)
    ?completion_date_time:(completion_date_time_ : date option)
    ?state:(state_ : calculation_execution_state option)
    ?state_change_reason:(state_change_reason_ : description_string option) () =
  ({
     submission_date_time = submission_date_time_;
     completion_date_time = completion_date_time_;
     state = state_;
     state_change_reason = state_change_reason_;
   }
    : calculation_status)

let make_calculation_summary
    ?calculation_execution_id:(calculation_execution_id_ : calculation_execution_id option)
    ?description:(description_ : description_string option)
    ?status:(status_ : calculation_status option) () =
  ({
     calculation_execution_id = calculation_execution_id_;
     description = description_;
     status = status_;
   }
    : calculation_summary)

let make_list_calculation_executions_response
    ?next_token:(next_token_ : session_manager_token option)
    ?calculations:(calculations_ : calculations_list option) () =
  ({ next_token = next_token_; calculations = calculations_ }
    : list_calculation_executions_response)

let make_list_calculation_executions_request
    ?state_filter:(state_filter_ : calculation_execution_state option)
    ?max_results:(max_results_ : max_calculations_count option)
    ?next_token:(next_token_ : session_manager_token option) ~session_id:(session_id_ : session_id)
    () =
  ({
     session_id = session_id_;
     state_filter = state_filter_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_calculation_executions_request)

let make_application_dpu_sizes
    ?application_runtime_id:(application_runtime_id_ : name_string option)
    ?supported_dpu_sizes:(supported_dpu_sizes_ : supported_dpu_size_list option) () =
  ({ application_runtime_id = application_runtime_id_; supported_dpu_sizes = supported_dpu_sizes_ }
    : application_dpu_sizes)

let make_list_application_dpu_sizes_output
    ?application_dpu_sizes:(application_dpu_sizes_ : application_dpu_sizes_list option)
    ?next_token:(next_token_ : token option) () =
  ({ application_dpu_sizes = application_dpu_sizes_; next_token = next_token_ }
    : list_application_dpu_sizes_output)

let make_list_application_dpu_sizes_input
    ?max_results:(max_results_ : max_application_dpu_sizes_count option)
    ?next_token:(next_token_ : token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_application_dpu_sizes_input)

let make_import_notebook_output ?notebook_id:(notebook_id_ : notebook_id option) () =
  ({ notebook_id = notebook_id_ } : import_notebook_output)

let make_import_notebook_input ?payload:(payload_ : payload option)
    ?notebook_s3_location_uri:(notebook_s3_location_uri_ : s3_uri option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~work_group:(work_group_ : work_group_name) ~name:(name_ : notebook_name)
    ~type_:(type__ : notebook_type) () =
  ({
     work_group = work_group_;
     name = name_;
     payload = payload_;
     type_ = type__;
     notebook_s3_location_uri = notebook_s3_location_uri_;
     client_request_token = client_request_token_;
   }
    : import_notebook_input)

let make_identity_center_configuration
    ?enable_identity_center:(enable_identity_center_ : boxed_boolean option)
    ?identity_center_instance_arn:
      (identity_center_instance_arn_ : identity_center_instance_arn option) () =
  ({
     enable_identity_center = enable_identity_center_;
     identity_center_instance_arn = identity_center_instance_arn_;
   }
    : identity_center_configuration)

let make_managed_query_results_configuration
    ?encryption_configuration:
      (encryption_configuration_ : managed_query_results_encryption_configuration option)
    ~enabled:(enabled_ : boolean_) () =
  ({ enabled = enabled_; encryption_configuration = encryption_configuration_ }
    : managed_query_results_configuration)

let make_work_group_configuration
    ?result_configuration:(result_configuration_ : result_configuration option)
    ?managed_query_results_configuration:
      (managed_query_results_configuration_ : managed_query_results_configuration option)
    ?enforce_work_group_configuration:(enforce_work_group_configuration_ : boxed_boolean option)
    ?publish_cloud_watch_metrics_enabled:
      (publish_cloud_watch_metrics_enabled_ : boxed_boolean option)
    ?bytes_scanned_cutoff_per_query:
      (bytes_scanned_cutoff_per_query_ : bytes_scanned_cutoff_value option)
    ?requester_pays_enabled:(requester_pays_enabled_ : boxed_boolean option)
    ?engine_version:(engine_version_ : engine_version option)
    ?additional_configuration:(additional_configuration_ : name_string option)
    ?execution_role:(execution_role_ : role_arn option)
    ?monitoring_configuration:(monitoring_configuration_ : monitoring_configuration option)
    ?engine_configuration:(engine_configuration_ : engine_configuration option)
    ?customer_content_encryption_configuration:
      (customer_content_encryption_configuration_ : customer_content_encryption_configuration option)
    ?enable_minimum_encryption_configuration:
      (enable_minimum_encryption_configuration_ : boxed_boolean option)
    ?identity_center_configuration:
      (identity_center_configuration_ : identity_center_configuration option)
    ?query_results_s3_access_grants_configuration:
      (query_results_s3_access_grants_configuration_ :
         query_results_s3_access_grants_configuration option) () =
  ({
     result_configuration = result_configuration_;
     managed_query_results_configuration = managed_query_results_configuration_;
     enforce_work_group_configuration = enforce_work_group_configuration_;
     publish_cloud_watch_metrics_enabled = publish_cloud_watch_metrics_enabled_;
     bytes_scanned_cutoff_per_query = bytes_scanned_cutoff_per_query_;
     requester_pays_enabled = requester_pays_enabled_;
     engine_version = engine_version_;
     additional_configuration = additional_configuration_;
     execution_role = execution_role_;
     monitoring_configuration = monitoring_configuration_;
     engine_configuration = engine_configuration_;
     customer_content_encryption_configuration = customer_content_encryption_configuration_;
     enable_minimum_encryption_configuration = enable_minimum_encryption_configuration_;
     identity_center_configuration = identity_center_configuration_;
     query_results_s3_access_grants_configuration = query_results_s3_access_grants_configuration_;
   }
    : work_group_configuration)

let make_work_group ?state:(state_ : work_group_state option)
    ?configuration:(configuration_ : work_group_configuration option)
    ?description:(description_ : work_group_description_string option)
    ?creation_time:(creation_time_ : date option)
    ?identity_center_application_arn:
      (identity_center_application_arn_ : identity_center_application_arn option)
    ~name:(name_ : work_group_name) () =
  ({
     name = name_;
     state = state_;
     configuration = configuration_;
     description = description_;
     creation_time = creation_time_;
     identity_center_application_arn = identity_center_application_arn_;
   }
    : work_group)

let make_get_work_group_output ?work_group:(work_group_ : work_group option) () =
  ({ work_group = work_group_ } : get_work_group_output)

let make_get_work_group_input ~work_group:(work_group_ : work_group_name) () =
  ({ work_group = work_group_ } : get_work_group_input)

let make_get_table_metadata_output ?table_metadata:(table_metadata_ : table_metadata option) () =
  ({ table_metadata = table_metadata_ } : get_table_metadata_output)

let make_get_table_metadata_input ?work_group:(work_group_ : work_group_name option)
    ~catalog_name:(catalog_name_ : catalog_name_string)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string) () =
  ({
     catalog_name = catalog_name_;
     database_name = database_name_;
     table_name = table_name_;
     work_group = work_group_;
   }
    : get_table_metadata_input)

let make_get_session_status_response ?session_id:(session_id_ : session_id option)
    ?status:(status_ : session_status option) () =
  ({ session_id = session_id_; status = status_ } : get_session_status_response)

let make_get_session_status_request ~session_id:(session_id_ : session_id) () =
  ({ session_id = session_id_ } : get_session_status_request)

let make_get_session_endpoint_response ~endpoint_url:(endpoint_url_ : string_)
    ~auth_token:(auth_token_ : string_)
    ~auth_token_expiration_time:(auth_token_expiration_time_ : timestamp) () =
  ({
     endpoint_url = endpoint_url_;
     auth_token = auth_token_;
     auth_token_expiration_time = auth_token_expiration_time_;
   }
    : get_session_endpoint_response)

let make_get_session_endpoint_request ~session_id:(session_id_ : session_id) () =
  ({ session_id = session_id_ } : get_session_endpoint_request)

let make_session_statistics ?dpu_execution_in_millis:(dpu_execution_in_millis_ : long option) () =
  ({ dpu_execution_in_millis = dpu_execution_in_millis_ } : session_statistics)

let make_session_configuration ?execution_role:(execution_role_ : role_arn option)
    ?working_directory:(working_directory_ : result_output_location option)
    ?idle_timeout_seconds:(idle_timeout_seconds_ : long option)
    ?session_idle_timeout_in_minutes:
      (session_idle_timeout_in_minutes_ : session_idle_timeout_in_minutes option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option) () =
  ({
     execution_role = execution_role_;
     working_directory = working_directory_;
     idle_timeout_seconds = idle_timeout_seconds_;
     session_idle_timeout_in_minutes = session_idle_timeout_in_minutes_;
     encryption_configuration = encryption_configuration_;
   }
    : session_configuration)

let make_get_session_response ?session_id:(session_id_ : session_id option)
    ?description:(description_ : description_string option)
    ?work_group:(work_group_ : work_group_name option)
    ?engine_version:(engine_version_ : name_string option)
    ?engine_configuration:(engine_configuration_ : engine_configuration option)
    ?notebook_version:(notebook_version_ : name_string option)
    ?monitoring_configuration:(monitoring_configuration_ : monitoring_configuration option)
    ?session_configuration:(session_configuration_ : session_configuration option)
    ?status:(status_ : session_status option) ?statistics:(statistics_ : session_statistics option)
    () =
  ({
     session_id = session_id_;
     description = description_;
     work_group = work_group_;
     engine_version = engine_version_;
     engine_configuration = engine_configuration_;
     notebook_version = notebook_version_;
     monitoring_configuration = monitoring_configuration_;
     session_configuration = session_configuration_;
     status = status_;
     statistics = statistics_;
   }
    : get_session_response)

let make_get_session_request ~session_id:(session_id_ : session_id) () =
  ({ session_id = session_id_ } : get_session_request)

let make_get_resource_dashboard_response ~url:(url_ : string_) () =
  ({ url = url_ } : get_resource_dashboard_response)

let make_get_resource_dashboard_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : get_resource_dashboard_request)

let make_query_stage_plan_node ?name:(name_ : string_ option)
    ?identifier:(identifier_ : string_ option) ?children:(children_ : query_stage_plan_nodes option)
    ?remote_sources:(remote_sources_ : string_list option) () =
  ({
     name = name_;
     identifier = identifier_;
     children = children_;
     remote_sources = remote_sources_;
   }
    : query_stage_plan_node)

let make_query_stage ?stage_id:(stage_id_ : long option) ?state:(state_ : string_ option)
    ?output_bytes:(output_bytes_ : long option) ?output_rows:(output_rows_ : long option)
    ?input_bytes:(input_bytes_ : long option) ?input_rows:(input_rows_ : long option)
    ?execution_time:(execution_time_ : long option)
    ?query_stage_plan:(query_stage_plan_ : query_stage_plan_node option)
    ?sub_stages:(sub_stages_ : query_stages option) () =
  ({
     stage_id = stage_id_;
     state = state_;
     output_bytes = output_bytes_;
     output_rows = output_rows_;
     input_bytes = input_bytes_;
     input_rows = input_rows_;
     execution_time = execution_time_;
     query_stage_plan = query_stage_plan_;
     sub_stages = sub_stages_;
   }
    : query_stage)

let make_query_runtime_statistics_rows ?input_rows:(input_rows_ : long option)
    ?input_bytes:(input_bytes_ : long option) ?output_bytes:(output_bytes_ : long option)
    ?output_rows:(output_rows_ : long option) () =
  ({
     input_rows = input_rows_;
     input_bytes = input_bytes_;
     output_bytes = output_bytes_;
     output_rows = output_rows_;
   }
    : query_runtime_statistics_rows)

let make_query_runtime_statistics_timeline
    ?query_queue_time_in_millis:(query_queue_time_in_millis_ : long option)
    ?service_pre_processing_time_in_millis:(service_pre_processing_time_in_millis_ : long option)
    ?query_planning_time_in_millis:(query_planning_time_in_millis_ : long option)
    ?engine_execution_time_in_millis:(engine_execution_time_in_millis_ : long option)
    ?service_processing_time_in_millis:(service_processing_time_in_millis_ : long option)
    ?total_execution_time_in_millis:(total_execution_time_in_millis_ : long option) () =
  ({
     query_queue_time_in_millis = query_queue_time_in_millis_;
     service_pre_processing_time_in_millis = service_pre_processing_time_in_millis_;
     query_planning_time_in_millis = query_planning_time_in_millis_;
     engine_execution_time_in_millis = engine_execution_time_in_millis_;
     service_processing_time_in_millis = service_processing_time_in_millis_;
     total_execution_time_in_millis = total_execution_time_in_millis_;
   }
    : query_runtime_statistics_timeline)

let make_query_runtime_statistics ?timeline:(timeline_ : query_runtime_statistics_timeline option)
    ?rows:(rows_ : query_runtime_statistics_rows option)
    ?output_stage:(output_stage_ : query_stage option) () =
  ({ timeline = timeline_; rows = rows_; output_stage = output_stage_ } : query_runtime_statistics)

let make_get_query_runtime_statistics_output
    ?query_runtime_statistics:(query_runtime_statistics_ : query_runtime_statistics option) () =
  ({ query_runtime_statistics = query_runtime_statistics_ } : get_query_runtime_statistics_output)

let make_get_query_runtime_statistics_input
    ~query_execution_id:(query_execution_id_ : query_execution_id) () =
  ({ query_execution_id = query_execution_id_ } : get_query_runtime_statistics_input)

let make_column_info ?catalog_name:(catalog_name_ : string_ option)
    ?schema_name:(schema_name_ : string_ option) ?table_name:(table_name_ : string_ option)
    ?label:(label_ : string_ option) ?precision:(precision_ : integer option)
    ?scale:(scale_ : integer option) ?nullable:(nullable_ : column_nullable option)
    ?case_sensitive:(case_sensitive_ : boolean_ option) ~name:(name_ : string_)
    ~type_:(type__ : string_) () =
  ({
     catalog_name = catalog_name_;
     schema_name = schema_name_;
     table_name = table_name_;
     name = name_;
     label = label_;
     type_ = type__;
     precision = precision_;
     scale = scale_;
     nullable = nullable_;
     case_sensitive = case_sensitive_;
   }
    : column_info)

let make_result_set_metadata ?column_info:(column_info_ : column_info_list option) () =
  ({ column_info = column_info_ } : result_set_metadata)

let make_datum ?var_char_value:(var_char_value_ : datum_string option) () =
  ({ var_char_value = var_char_value_ } : datum)

let make_row ?data:(data_ : datum_list option) () = ({ data = data_ } : row)

let make_result_set ?rows:(rows_ : row_list option)
    ?result_set_metadata:(result_set_metadata_ : result_set_metadata option) () =
  ({ rows = rows_; result_set_metadata = result_set_metadata_ } : result_set)

let make_get_query_results_output ?update_count:(update_count_ : long option)
    ?result_set:(result_set_ : result_set option) ?next_token:(next_token_ : token option) () =
  ({ update_count = update_count_; result_set = result_set_; next_token = next_token_ }
    : get_query_results_output)

let make_get_query_results_input ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_query_results option)
    ?query_result_type:(query_result_type_ : query_result_type option)
    ~query_execution_id:(query_execution_id_ : query_execution_id) () =
  ({
     query_execution_id = query_execution_id_;
     next_token = next_token_;
     max_results = max_results_;
     query_result_type = query_result_type_;
   }
    : get_query_results_input)

let make_result_reuse_information ~reused_previous_result:(reused_previous_result_ : boolean_) () =
  ({ reused_previous_result = reused_previous_result_ } : result_reuse_information)

let make_query_execution_statistics
    ?engine_execution_time_in_millis:(engine_execution_time_in_millis_ : long option)
    ?data_scanned_in_bytes:(data_scanned_in_bytes_ : long option)
    ?data_manifest_location:(data_manifest_location_ : string_ option)
    ?total_execution_time_in_millis:(total_execution_time_in_millis_ : long option)
    ?query_queue_time_in_millis:(query_queue_time_in_millis_ : long option)
    ?service_pre_processing_time_in_millis:(service_pre_processing_time_in_millis_ : long option)
    ?query_planning_time_in_millis:(query_planning_time_in_millis_ : long option)
    ?service_processing_time_in_millis:(service_processing_time_in_millis_ : long option)
    ?result_reuse_information:(result_reuse_information_ : result_reuse_information option)
    ?dpu_count:(dpu_count_ : dpu_count option) () =
  ({
     engine_execution_time_in_millis = engine_execution_time_in_millis_;
     data_scanned_in_bytes = data_scanned_in_bytes_;
     data_manifest_location = data_manifest_location_;
     total_execution_time_in_millis = total_execution_time_in_millis_;
     query_queue_time_in_millis = query_queue_time_in_millis_;
     service_pre_processing_time_in_millis = service_pre_processing_time_in_millis_;
     query_planning_time_in_millis = query_planning_time_in_millis_;
     service_processing_time_in_millis = service_processing_time_in_millis_;
     result_reuse_information = result_reuse_information_;
     dpu_count = dpu_count_;
   }
    : query_execution_statistics)

let make_athena_error ?error_category:(error_category_ : error_category option)
    ?error_type:(error_type_ : error_type option) ?retryable:(retryable_ : boolean_ option)
    ?error_message:(error_message_ : string_ option) () =
  ({
     error_category = error_category_;
     error_type = error_type_;
     retryable = retryable_;
     error_message = error_message_;
   }
    : athena_error)

let make_query_execution_status ?state:(state_ : query_execution_state option)
    ?state_change_reason:(state_change_reason_ : string_ option)
    ?submission_date_time:(submission_date_time_ : date option)
    ?completion_date_time:(completion_date_time_ : date option)
    ?athena_error:(athena_error_ : athena_error option) () =
  ({
     state = state_;
     state_change_reason = state_change_reason_;
     submission_date_time = submission_date_time_;
     completion_date_time = completion_date_time_;
     athena_error = athena_error_;
   }
    : query_execution_status)

let make_query_execution ?query_execution_id:(query_execution_id_ : query_execution_id option)
    ?query:(query_ : query_string option) ?statement_type:(statement_type_ : statement_type option)
    ?managed_query_results_configuration:
      (managed_query_results_configuration_ : managed_query_results_configuration option)
    ?result_configuration:(result_configuration_ : result_configuration option)
    ?result_reuse_configuration:(result_reuse_configuration_ : result_reuse_configuration option)
    ?query_execution_context:(query_execution_context_ : query_execution_context option)
    ?status:(status_ : query_execution_status option)
    ?statistics:(statistics_ : query_execution_statistics option)
    ?work_group:(work_group_ : work_group_name option)
    ?engine_version:(engine_version_ : engine_version option)
    ?execution_parameters:(execution_parameters_ : execution_parameters option)
    ?substatement_type:(substatement_type_ : string_ option)
    ?query_results_s3_access_grants_configuration:
      (query_results_s3_access_grants_configuration_ :
         query_results_s3_access_grants_configuration option) () =
  ({
     query_execution_id = query_execution_id_;
     query = query_;
     statement_type = statement_type_;
     managed_query_results_configuration = managed_query_results_configuration_;
     result_configuration = result_configuration_;
     result_reuse_configuration = result_reuse_configuration_;
     query_execution_context = query_execution_context_;
     status = status_;
     statistics = statistics_;
     work_group = work_group_;
     engine_version = engine_version_;
     execution_parameters = execution_parameters_;
     substatement_type = substatement_type_;
     query_results_s3_access_grants_configuration = query_results_s3_access_grants_configuration_;
   }
    : query_execution)

let make_get_query_execution_output ?query_execution:(query_execution_ : query_execution option) ()
    =
  ({ query_execution = query_execution_ } : get_query_execution_output)

let make_get_query_execution_input ~query_execution_id:(query_execution_id_ : query_execution_id) ()
    =
  ({ query_execution_id = query_execution_id_ } : get_query_execution_input)

let make_prepared_statement ?statement_name:(statement_name_ : statement_name option)
    ?query_statement:(query_statement_ : query_string option)
    ?work_group_name:(work_group_name_ : work_group_name option)
    ?description:(description_ : description_string option)
    ?last_modified_time:(last_modified_time_ : date option) () =
  ({
     statement_name = statement_name_;
     query_statement = query_statement_;
     work_group_name = work_group_name_;
     description = description_;
     last_modified_time = last_modified_time_;
   }
    : prepared_statement)

let make_get_prepared_statement_output
    ?prepared_statement:(prepared_statement_ : prepared_statement option) () =
  ({ prepared_statement = prepared_statement_ } : get_prepared_statement_output)

let make_get_prepared_statement_input ~statement_name:(statement_name_ : statement_name)
    ~work_group:(work_group_ : work_group_name) () =
  ({ statement_name = statement_name_; work_group = work_group_ } : get_prepared_statement_input)

let make_get_notebook_metadata_output
    ?notebook_metadata:(notebook_metadata_ : notebook_metadata option) () =
  ({ notebook_metadata = notebook_metadata_ } : get_notebook_metadata_output)

let make_get_notebook_metadata_input ~notebook_id:(notebook_id_ : notebook_id) () =
  ({ notebook_id = notebook_id_ } : get_notebook_metadata_input)

let make_named_query ?description:(description_ : description_string option)
    ?named_query_id:(named_query_id_ : named_query_id option)
    ?work_group:(work_group_ : work_group_name option) ~name:(name_ : name_string)
    ~database:(database_ : database_string) ~query_string:(query_string_ : query_string) () =
  ({
     name = name_;
     description = description_;
     database = database_;
     query_string = query_string_;
     named_query_id = named_query_id_;
     work_group = work_group_;
   }
    : named_query)

let make_get_named_query_output ?named_query:(named_query_ : named_query option) () =
  ({ named_query = named_query_ } : get_named_query_output)

let make_get_named_query_input ~named_query_id:(named_query_id_ : named_query_id) () =
  ({ named_query_id = named_query_id_ } : get_named_query_input)

let make_data_catalog ?description:(description_ : description_string option)
    ?parameters:(parameters_ : parameters_map option) ?status:(status_ : data_catalog_status option)
    ?connection_type:(connection_type_ : connection_type option)
    ?error:(error_ : error_message option) ~name:(name_ : catalog_name_string)
    ~type_:(type__ : data_catalog_type) () =
  ({
     name = name_;
     description = description_;
     type_ = type__;
     parameters = parameters_;
     status = status_;
     connection_type = connection_type_;
     error = error_;
   }
    : data_catalog)

let make_get_data_catalog_output ?data_catalog:(data_catalog_ : data_catalog option) () =
  ({ data_catalog = data_catalog_ } : get_data_catalog_output)

let make_get_data_catalog_input ?work_group:(work_group_ : work_group_name option)
    ~name:(name_ : catalog_name_string) () =
  ({ name = name_; work_group = work_group_ } : get_data_catalog_input)

let make_get_database_output ?database:(database_ : database option) () =
  ({ database = database_ } : get_database_output)

let make_get_database_input ?work_group:(work_group_ : work_group_name option)
    ~catalog_name:(catalog_name_ : catalog_name_string)
    ~database_name:(database_name_ : name_string) () =
  ({ catalog_name = catalog_name_; database_name = database_name_; work_group = work_group_ }
    : get_database_input)

let make_get_capacity_reservation_output
    ~capacity_reservation:(capacity_reservation_ : capacity_reservation) () =
  ({ capacity_reservation = capacity_reservation_ } : get_capacity_reservation_output)

let make_get_capacity_reservation_input ~name:(name_ : capacity_reservation_name) () =
  ({ name = name_ } : get_capacity_reservation_input)

let make_capacity_assignment_configuration
    ?capacity_reservation_name:(capacity_reservation_name_ : capacity_reservation_name option)
    ?capacity_assignments:(capacity_assignments_ : capacity_assignments_list option) () =
  ({
     capacity_reservation_name = capacity_reservation_name_;
     capacity_assignments = capacity_assignments_;
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

let make_calculation_statistics ?dpu_execution_in_millis:(dpu_execution_in_millis_ : long option)
    ?progress:(progress_ : description_string option) () =
  ({ dpu_execution_in_millis = dpu_execution_in_millis_; progress = progress_ }
    : calculation_statistics)

let make_get_calculation_execution_status_response ?status:(status_ : calculation_status option)
    ?statistics:(statistics_ : calculation_statistics option) () =
  ({ status = status_; statistics = statistics_ } : get_calculation_execution_status_response)

let make_get_calculation_execution_status_request
    ~calculation_execution_id:(calculation_execution_id_ : calculation_execution_id) () =
  ({ calculation_execution_id = calculation_execution_id_ }
    : get_calculation_execution_status_request)

let make_get_calculation_execution_code_response ?code_block:(code_block_ : code_block option) () =
  ({ code_block = code_block_ } : get_calculation_execution_code_response)

let make_get_calculation_execution_code_request
    ~calculation_execution_id:(calculation_execution_id_ : calculation_execution_id) () =
  ({ calculation_execution_id = calculation_execution_id_ }
    : get_calculation_execution_code_request)

let make_get_calculation_execution_response
    ?calculation_execution_id:(calculation_execution_id_ : calculation_execution_id option)
    ?session_id:(session_id_ : session_id option)
    ?description:(description_ : description_string option)
    ?working_directory:(working_directory_ : s3_uri option)
    ?status:(status_ : calculation_status option)
    ?statistics:(statistics_ : calculation_statistics option)
    ?result_:(result__ : calculation_result option) () =
  ({
     calculation_execution_id = calculation_execution_id_;
     session_id = session_id_;
     description = description_;
     working_directory = working_directory_;
     status = status_;
     statistics = statistics_;
     result_ = result__;
   }
    : get_calculation_execution_response)

let make_get_calculation_execution_request
    ~calculation_execution_id:(calculation_execution_id_ : calculation_execution_id) () =
  ({ calculation_execution_id = calculation_execution_id_ } : get_calculation_execution_request)

let make_export_notebook_output ?notebook_metadata:(notebook_metadata_ : notebook_metadata option)
    ?payload:(payload_ : payload option) () =
  ({ notebook_metadata = notebook_metadata_; payload = payload_ } : export_notebook_output)

let make_export_notebook_input ~notebook_id:(notebook_id_ : notebook_id) () =
  ({ notebook_id = notebook_id_ } : export_notebook_input)

let make_delete_work_group_output () = (() : unit)

let make_delete_work_group_input
    ?recursive_delete_option:(recursive_delete_option_ : boxed_boolean option)
    ~work_group:(work_group_ : work_group_name) () =
  ({ work_group = work_group_; recursive_delete_option = recursive_delete_option_ }
    : delete_work_group_input)

let make_delete_prepared_statement_output () = (() : unit)

let make_delete_prepared_statement_input ~statement_name:(statement_name_ : statement_name)
    ~work_group:(work_group_ : work_group_name) () =
  ({ statement_name = statement_name_; work_group = work_group_ } : delete_prepared_statement_input)

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
  ({ name = name_; delete_catalog_only = delete_catalog_only_ } : delete_data_catalog_input)

let make_delete_capacity_reservation_output () = (() : unit)

let make_delete_capacity_reservation_input ~name:(name_ : capacity_reservation_name) () =
  ({ name = name_ } : delete_capacity_reservation_input)

let make_create_work_group_output () = (() : unit)

let make_create_work_group_input ?configuration:(configuration_ : work_group_configuration option)
    ?description:(description_ : work_group_description_string option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : work_group_name) () =
  ({ name = name_; configuration = configuration_; description = description_; tags = tags_ }
    : create_work_group_input)

let make_create_presigned_notebook_url_response ~notebook_url:(notebook_url_ : string_)
    ~auth_token:(auth_token_ : auth_token)
    ~auth_token_expiration_time:(auth_token_expiration_time_ : long) () =
  ({
     notebook_url = notebook_url_;
     auth_token = auth_token_;
     auth_token_expiration_time = auth_token_expiration_time_;
   }
    : create_presigned_notebook_url_response)

let make_create_presigned_notebook_url_request ~session_id:(session_id_ : session_id) () =
  ({ session_id = session_id_ } : create_presigned_notebook_url_request)

let make_create_prepared_statement_output () = (() : unit)

let make_create_prepared_statement_input ?description:(description_ : description_string option)
    ~statement_name:(statement_name_ : statement_name) ~work_group:(work_group_ : work_group_name)
    ~query_statement:(query_statement_ : query_string) () =
  ({
     statement_name = statement_name_;
     work_group = work_group_;
     query_statement = query_statement_;
     description = description_;
   }
    : create_prepared_statement_input)

let make_create_notebook_output ?notebook_id:(notebook_id_ : notebook_id option) () =
  ({ notebook_id = notebook_id_ } : create_notebook_output)

let make_create_notebook_input
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~work_group:(work_group_ : work_group_name) ~name:(name_ : notebook_name) () =
  ({ work_group = work_group_; name = name_; client_request_token = client_request_token_ }
    : create_notebook_input)

let make_create_named_query_output ?named_query_id:(named_query_id_ : named_query_id option) () =
  ({ named_query_id = named_query_id_ } : create_named_query_output)

let make_create_named_query_input ?description:(description_ : description_string option)
    ?client_request_token:(client_request_token_ : idempotency_token option)
    ?work_group:(work_group_ : work_group_name option) ~name:(name_ : name_string)
    ~database:(database_ : database_string) ~query_string:(query_string_ : query_string) () =
  ({
     name = name_;
     description = description_;
     database = database_;
     query_string = query_string_;
     client_request_token = client_request_token_;
     work_group = work_group_;
   }
    : create_named_query_input)

let make_create_data_catalog_output ?data_catalog:(data_catalog_ : data_catalog option) () =
  ({ data_catalog = data_catalog_ } : create_data_catalog_output)

let make_create_data_catalog_input ?description:(description_ : description_string option)
    ?parameters:(parameters_ : parameters_map option) ?tags:(tags_ : tag_list option)
    ~name:(name_ : catalog_name_string) ~type_:(type__ : data_catalog_type) () =
  ({
     name = name_;
     type_ = type__;
     description = description_;
     parameters = parameters_;
     tags = tags_;
   }
    : create_data_catalog_input)

let make_create_capacity_reservation_output () = (() : unit)

let make_create_capacity_reservation_input ?tags:(tags_ : tag_list option)
    ~target_dpus:(target_dpus_ : target_dpus_integer) ~name:(name_ : capacity_reservation_name) () =
  ({ target_dpus = target_dpus_; name = name_; tags = tags_ } : create_capacity_reservation_input)

let make_cancel_capacity_reservation_output () = (() : unit)

let make_cancel_capacity_reservation_input ~name:(name_ : capacity_reservation_name) () =
  ({ name = name_ } : cancel_capacity_reservation_input)

let make_unprocessed_query_execution_id
    ?query_execution_id:(query_execution_id_ : query_execution_id option)
    ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({
     query_execution_id = query_execution_id_;
     error_code = error_code_;
     error_message = error_message_;
   }
    : unprocessed_query_execution_id)

let make_batch_get_query_execution_output
    ?query_executions:(query_executions_ : query_execution_list option)
    ?unprocessed_query_execution_ids:
      (unprocessed_query_execution_ids_ : unprocessed_query_execution_id_list option) () =
  ({
     query_executions = query_executions_;
     unprocessed_query_execution_ids = unprocessed_query_execution_ids_;
   }
    : batch_get_query_execution_output)

let make_batch_get_query_execution_input
    ~query_execution_ids:(query_execution_ids_ : query_execution_id_list) () =
  ({ query_execution_ids = query_execution_ids_ } : batch_get_query_execution_input)

let make_unprocessed_prepared_statement_name
    ?statement_name:(statement_name_ : statement_name option)
    ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({ statement_name = statement_name_; error_code = error_code_; error_message = error_message_ }
    : unprocessed_prepared_statement_name)

let make_batch_get_prepared_statement_output
    ?prepared_statements:(prepared_statements_ : prepared_statement_details_list option)
    ?unprocessed_prepared_statement_names:
      (unprocessed_prepared_statement_names_ : unprocessed_prepared_statement_name_list option) () =
  ({
     prepared_statements = prepared_statements_;
     unprocessed_prepared_statement_names = unprocessed_prepared_statement_names_;
   }
    : batch_get_prepared_statement_output)

let make_batch_get_prepared_statement_input
    ~prepared_statement_names:(prepared_statement_names_ : prepared_statement_name_list)
    ~work_group:(work_group_ : work_group_name) () =
  ({ prepared_statement_names = prepared_statement_names_; work_group = work_group_ }
    : batch_get_prepared_statement_input)

let make_unprocessed_named_query_id ?named_query_id:(named_query_id_ : named_query_id option)
    ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({ named_query_id = named_query_id_; error_code = error_code_; error_message = error_message_ }
    : unprocessed_named_query_id)

let make_batch_get_named_query_output ?named_queries:(named_queries_ : named_query_list option)
    ?unprocessed_named_query_ids:
      (unprocessed_named_query_ids_ : unprocessed_named_query_id_list option) () =
  ({ named_queries = named_queries_; unprocessed_named_query_ids = unprocessed_named_query_ids_ }
    : batch_get_named_query_output)

let make_batch_get_named_query_input ~named_query_ids:(named_query_ids_ : named_query_id_list) () =
  ({ named_query_ids = named_query_ids_ } : batch_get_named_query_input)
