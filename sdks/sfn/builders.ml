open Types

let make_validate_state_machine_definition_diagnostic
    ?location:(location_ : validate_state_machine_definition_location option)
    ~severity:(severity_ : validate_state_machine_definition_severity)
    ~code:(code_ : validate_state_machine_definition_code)
    ~message:(message_ : validate_state_machine_definition_message) () =
  ({ severity = severity_; code = code_; message = message_; location = location_ }
    : validate_state_machine_definition_diagnostic)

let make_validate_state_machine_definition_output
    ?truncated:(truncated_ : validate_state_machine_definition_truncated option)
    ~result_:(result__ : validate_state_machine_definition_result_code)
    ~diagnostics:(diagnostics_ : validate_state_machine_definition_diagnostic_list) () =
  ({ result_ = result__; diagnostics = diagnostics_; truncated = truncated_ }
    : validate_state_machine_definition_output)

let make_validate_state_machine_definition_input ?type_:(type__ : state_machine_type option)
    ?severity:(severity_ : validate_state_machine_definition_severity option)
    ?max_results:(max_results_ : validate_state_machine_definition_max_result option)
    ~definition:(definition_ : definition) () =
  ({ definition = definition_; type_ = type__; severity = severity_; max_results = max_results_ }
    : validate_state_machine_definition_input)

let make_update_state_machine_alias_output ~update_date:(update_date_ : timestamp) () =
  ({ update_date = update_date_ } : update_state_machine_alias_output)

let make_routing_configuration_list_item
    ~state_machine_version_arn:(state_machine_version_arn_ : arn) ~weight:(weight_ : version_weight)
    () =
  ({ state_machine_version_arn = state_machine_version_arn_; weight = weight_ }
    : routing_configuration_list_item)

let make_update_state_machine_alias_input ?description:(description_ : alias_description option)
    ?routing_configuration:(routing_configuration_ : routing_configuration_list option)
    ~state_machine_alias_arn:(state_machine_alias_arn_ : arn) () =
  ({
     state_machine_alias_arn = state_machine_alias_arn_;
     description = description_;
     routing_configuration = routing_configuration_;
   }
    : update_state_machine_alias_input)

let make_update_state_machine_output ?revision_id:(revision_id_ : revision_id option)
    ?state_machine_version_arn:(state_machine_version_arn_ : arn option)
    ~update_date:(update_date_ : timestamp) () =
  ({
     update_date = update_date_;
     revision_id = revision_id_;
     state_machine_version_arn = state_machine_version_arn_;
   }
    : update_state_machine_output)

let make_encryption_configuration ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?kms_data_key_reuse_period_seconds:
      (kms_data_key_reuse_period_seconds_ : kms_data_key_reuse_period_seconds option)
    ~type_:(type__ : encryption_type) () =
  ({
     kms_key_id = kms_key_id_;
     kms_data_key_reuse_period_seconds = kms_data_key_reuse_period_seconds_;
     type_ = type__;
   }
    : encryption_configuration)

let make_tracing_configuration ?enabled:(enabled_ : enabled option) () =
  ({ enabled = enabled_ } : tracing_configuration)

let make_cloud_watch_logs_log_group ?log_group_arn:(log_group_arn_ : arn option) () =
  ({ log_group_arn = log_group_arn_ } : cloud_watch_logs_log_group)

let make_log_destination
    ?cloud_watch_logs_log_group:(cloud_watch_logs_log_group_ : cloud_watch_logs_log_group option) ()
    =
  ({ cloud_watch_logs_log_group = cloud_watch_logs_log_group_ } : log_destination)

let make_logging_configuration ?level:(level_ : log_level option)
    ?include_execution_data:(include_execution_data_ : include_execution_data option)
    ?destinations:(destinations_ : log_destination_list option) () =
  ({
     level = level_;
     include_execution_data = include_execution_data_;
     destinations = destinations_;
   }
    : logging_configuration)

let make_update_state_machine_input ?definition:(definition_ : definition option)
    ?role_arn:(role_arn_ : arn option)
    ?logging_configuration:(logging_configuration_ : logging_configuration option)
    ?tracing_configuration:(tracing_configuration_ : tracing_configuration option)
    ?publish:(publish_ : publish option)
    ?version_description:(version_description_ : version_description option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ~state_machine_arn:(state_machine_arn_ : arn) () =
  ({
     state_machine_arn = state_machine_arn_;
     definition = definition_;
     role_arn = role_arn_;
     logging_configuration = logging_configuration_;
     tracing_configuration = tracing_configuration_;
     publish = publish_;
     version_description = version_description_;
     encryption_configuration = encryption_configuration_;
   }
    : update_state_machine_input)

let make_update_map_run_output () = (() : unit)

let make_update_map_run_input ?max_concurrency:(max_concurrency_ : max_concurrency option)
    ?tolerated_failure_percentage:
      (tolerated_failure_percentage_ : tolerated_failure_percentage option)
    ?tolerated_failure_count:(tolerated_failure_count_ : tolerated_failure_count option)
    ~map_run_arn:(map_run_arn_ : long_arn) () =
  ({
     map_run_arn = map_run_arn_;
     max_concurrency = max_concurrency_;
     tolerated_failure_percentage = tolerated_failure_percentage_;
     tolerated_failure_count = tolerated_failure_count_;
   }
    : update_map_run_input)

let make_untag_resource_output () = (() : unit)

let make_untag_resource_input ~resource_arn:(resource_arn_ : arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_input)

let make_inspection_error_details ?catch_index:(catch_index_ : exception_handler_index option)
    ?retry_index:(retry_index_ : exception_handler_index option)
    ?retry_backoff_interval_seconds:
      (retry_backoff_interval_seconds_ : retry_backoff_interval_seconds option) () =
  ({
     catch_index = catch_index_;
     retry_index = retry_index_;
     retry_backoff_interval_seconds = retry_backoff_interval_seconds_;
   }
    : inspection_error_details)

let make_inspection_data_response ?protocol:(protocol_ : http_protocol option)
    ?status_code:(status_code_ : http_status_code option)
    ?status_message:(status_message_ : http_status_message option)
    ?headers:(headers_ : http_headers option) ?body:(body_ : http_body option) () =
  ({
     protocol = protocol_;
     status_code = status_code_;
     status_message = status_message_;
     headers = headers_;
     body = body_;
   }
    : inspection_data_response)

let make_inspection_data_request ?protocol:(protocol_ : http_protocol option)
    ?method_:(method__ : http_method option) ?url:(url_ : ur_l option)
    ?headers:(headers_ : http_headers option) ?body:(body_ : http_body option) () =
  ({ protocol = protocol_; method_ = method__; url = url_; headers = headers_; body = body_ }
    : inspection_data_request)

let make_inspection_data ?input:(input_ : sensitive_data option)
    ?after_arguments:(after_arguments_ : sensitive_data option)
    ?after_input_path:(after_input_path_ : sensitive_data option)
    ?after_parameters:(after_parameters_ : sensitive_data option)
    ?result_:(result__ : sensitive_data option)
    ?after_result_selector:(after_result_selector_ : sensitive_data option)
    ?after_result_path:(after_result_path_ : sensitive_data option)
    ?request:(request_ : inspection_data_request option)
    ?response:(response_ : inspection_data_response option)
    ?variables:(variables_ : sensitive_data option)
    ?error_details:(error_details_ : inspection_error_details option)
    ?after_items_path:(after_items_path_ : sensitive_data option)
    ?after_item_selector:(after_item_selector_ : sensitive_data option)
    ?after_item_batcher:(after_item_batcher_ : sensitive_data option)
    ?after_items_pointer:(after_items_pointer_ : sensitive_data option)
    ?tolerated_failure_count:(tolerated_failure_count_ : inspection_tolerated_failure_count option)
    ?tolerated_failure_percentage:
      (tolerated_failure_percentage_ : inspection_tolerated_failure_percentage option)
    ?max_concurrency:(max_concurrency_ : inspection_max_concurrency option) () =
  ({
     input = input_;
     after_arguments = after_arguments_;
     after_input_path = after_input_path_;
     after_parameters = after_parameters_;
     result_ = result__;
     after_result_selector = after_result_selector_;
     after_result_path = after_result_path_;
     request = request_;
     response = response_;
     variables = variables_;
     error_details = error_details_;
     after_items_path = after_items_path_;
     after_item_selector = after_item_selector_;
     after_item_batcher = after_item_batcher_;
     after_items_pointer = after_items_pointer_;
     tolerated_failure_count = tolerated_failure_count_;
     tolerated_failure_percentage = tolerated_failure_percentage_;
     max_concurrency = max_concurrency_;
   }
    : inspection_data)

let make_test_state_output ?output:(output_ : sensitive_data option)
    ?error:(error_ : sensitive_error option) ?cause:(cause_ : sensitive_cause option)
    ?inspection_data:(inspection_data_ : inspection_data option)
    ?next_state:(next_state_ : state_name option) ?status:(status_ : test_execution_status option)
    () =
  ({
     output = output_;
     error = error_;
     cause = cause_;
     inspection_data = inspection_data_;
     next_state = next_state_;
     status = status_;
   }
    : test_state_output)

let make_test_state_configuration
    ?retrier_retry_count:(retrier_retry_count_ : retrier_retry_count option)
    ?error_caused_by_state:(error_caused_by_state_ : test_state_state_name option)
    ?map_iteration_failure_count:(map_iteration_failure_count_ : map_iteration_failure_count option)
    ?map_item_reader_data:(map_item_reader_data_ : sensitive_data option) () =
  ({
     retrier_retry_count = retrier_retry_count_;
     error_caused_by_state = error_caused_by_state_;
     map_iteration_failure_count = map_iteration_failure_count_;
     map_item_reader_data = map_item_reader_data_;
   }
    : test_state_configuration)

let make_mock_error_output ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option) () =
  ({ error = error_; cause = cause_ } : mock_error_output)

let make_mock_input ?result_:(result__ : sensitive_data option)
    ?error_output:(error_output_ : mock_error_output option)
    ?field_validation_mode:(field_validation_mode_ : mock_response_validation_mode option) () =
  ({
     result_ = result__;
     error_output = error_output_;
     field_validation_mode = field_validation_mode_;
   }
    : mock_input)

let make_test_state_input ?role_arn:(role_arn_ : arn option) ?input:(input_ : sensitive_data option)
    ?inspection_level:(inspection_level_ : inspection_level option)
    ?reveal_secrets:(reveal_secrets_ : reveal_secrets option)
    ?variables:(variables_ : sensitive_data option)
    ?state_name:(state_name_ : test_state_state_name option) ?mock:(mock_ : mock_input option)
    ?context:(context_ : sensitive_data option)
    ?state_configuration:(state_configuration_ : test_state_configuration option)
    ~definition:(definition_ : definition) () =
  ({
     definition = definition_;
     role_arn = role_arn_;
     input = input_;
     inspection_level = inspection_level_;
     reveal_secrets = reveal_secrets_;
     variables = variables_;
     state_name = state_name_;
     mock = mock_;
     context = context_;
     state_configuration = state_configuration_;
   }
    : test_state_input)

let make_tag_resource_output () = (() : unit)

let make_tag ?key:(key_ : tag_key option) ?value:(value_ : tag_value option) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_input ~resource_arn:(resource_arn_ : arn) ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_input)

let make_stop_execution_output ~stop_date:(stop_date_ : timestamp) () =
  ({ stop_date = stop_date_ } : stop_execution_output)

let make_stop_execution_input ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option) ~execution_arn:(execution_arn_ : arn) () =
  ({ execution_arn = execution_arn_; error = error_; cause = cause_ } : stop_execution_input)

let make_billing_details
    ?billed_memory_used_in_m_b:(billed_memory_used_in_m_b_ : billed_memory_used option)
    ?billed_duration_in_milliseconds:(billed_duration_in_milliseconds_ : billed_duration option) ()
    =
  ({
     billed_memory_used_in_m_b = billed_memory_used_in_m_b_;
     billed_duration_in_milliseconds = billed_duration_in_milliseconds_;
   }
    : billing_details)

let make_cloud_watch_events_execution_data_details ?included:(included_ : included_details option)
    () =
  ({ included = included_ } : cloud_watch_events_execution_data_details)

let make_start_sync_execution_output ?state_machine_arn:(state_machine_arn_ : arn option)
    ?name:(name_ : name option) ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option) ?input:(input_ : sensitive_data option)
    ?input_details:(input_details_ : cloud_watch_events_execution_data_details option)
    ?output:(output_ : sensitive_data option)
    ?output_details:(output_details_ : cloud_watch_events_execution_data_details option)
    ?trace_header:(trace_header_ : trace_header option)
    ?billing_details:(billing_details_ : billing_details option)
    ~execution_arn:(execution_arn_ : arn) ~start_date:(start_date_ : timestamp)
    ~stop_date:(stop_date_ : timestamp) ~status:(status_ : sync_execution_status) () =
  ({
     execution_arn = execution_arn_;
     state_machine_arn = state_machine_arn_;
     name = name_;
     start_date = start_date_;
     stop_date = stop_date_;
     status = status_;
     error = error_;
     cause = cause_;
     input = input_;
     input_details = input_details_;
     output = output_;
     output_details = output_details_;
     trace_header = trace_header_;
     billing_details = billing_details_;
   }
    : start_sync_execution_output)

let make_start_sync_execution_input ?name:(name_ : name option)
    ?input:(input_ : sensitive_data option) ?trace_header:(trace_header_ : trace_header option)
    ?included_data:(included_data_ : included_data option)
    ~state_machine_arn:(state_machine_arn_ : arn) () =
  ({
     state_machine_arn = state_machine_arn_;
     name = name_;
     input = input_;
     trace_header = trace_header_;
     included_data = included_data_;
   }
    : start_sync_execution_input)

let make_start_execution_output ~execution_arn:(execution_arn_ : arn)
    ~start_date:(start_date_ : timestamp) () =
  ({ execution_arn = execution_arn_; start_date = start_date_ } : start_execution_output)

let make_start_execution_input ?name:(name_ : name option) ?input:(input_ : sensitive_data option)
    ?trace_header:(trace_header_ : trace_header option)
    ~state_machine_arn:(state_machine_arn_ : arn) () =
  ({
     state_machine_arn = state_machine_arn_;
     name = name_;
     input = input_;
     trace_header = trace_header_;
   }
    : start_execution_input)

let make_send_task_success_output () = (() : unit)

let make_send_task_success_input ~task_token:(task_token_ : task_token)
    ~output:(output_ : sensitive_data) () =
  ({ task_token = task_token_; output = output_ } : send_task_success_input)

let make_send_task_heartbeat_output () = (() : unit)

let make_send_task_heartbeat_input ~task_token:(task_token_ : task_token) () =
  ({ task_token = task_token_ } : send_task_heartbeat_input)

let make_send_task_failure_output () = (() : unit)

let make_send_task_failure_input ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option) ~task_token:(task_token_ : task_token) () =
  ({ task_token = task_token_; error = error_; cause = cause_ } : send_task_failure_input)

let make_redrive_execution_output ~redrive_date:(redrive_date_ : timestamp) () =
  ({ redrive_date = redrive_date_ } : redrive_execution_output)

let make_redrive_execution_input ?client_token:(client_token_ : client_token option)
    ~execution_arn:(execution_arn_ : arn) () =
  ({ execution_arn = execution_arn_; client_token = client_token_ } : redrive_execution_input)

let make_publish_state_machine_version_output ~creation_date:(creation_date_ : timestamp)
    ~state_machine_version_arn:(state_machine_version_arn_ : arn) () =
  ({ creation_date = creation_date_; state_machine_version_arn = state_machine_version_arn_ }
    : publish_state_machine_version_output)

let make_publish_state_machine_version_input ?revision_id:(revision_id_ : revision_id option)
    ?description:(description_ : version_description option)
    ~state_machine_arn:(state_machine_arn_ : arn) () =
  ({
     state_machine_arn = state_machine_arn_;
     revision_id = revision_id_;
     description = description_;
   }
    : publish_state_machine_version_input)

let make_list_tags_for_resource_output ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_input)

let make_state_machine_version_list_item
    ~state_machine_version_arn:(state_machine_version_arn_ : long_arn)
    ~creation_date:(creation_date_ : timestamp) () =
  ({ state_machine_version_arn = state_machine_version_arn_; creation_date = creation_date_ }
    : state_machine_version_list_item)

let make_list_state_machine_versions_output ?next_token:(next_token_ : page_token option)
    ~state_machine_versions:(state_machine_versions_ : state_machine_version_list) () =
  ({ state_machine_versions = state_machine_versions_; next_token = next_token_ }
    : list_state_machine_versions_output)

let make_list_state_machine_versions_input ?next_token:(next_token_ : page_token option)
    ?max_results:(max_results_ : page_size option) ~state_machine_arn:(state_machine_arn_ : arn) ()
    =
  ({ state_machine_arn = state_machine_arn_; next_token = next_token_; max_results = max_results_ }
    : list_state_machine_versions_input)

let make_state_machine_list_item ~state_machine_arn:(state_machine_arn_ : arn) ~name:(name_ : name)
    ~type_:(type__ : state_machine_type) ~creation_date:(creation_date_ : timestamp) () =
  ({
     state_machine_arn = state_machine_arn_;
     name = name_;
     type_ = type__;
     creation_date = creation_date_;
   }
    : state_machine_list_item)

let make_list_state_machines_output ?next_token:(next_token_ : page_token option)
    ~state_machines:(state_machines_ : state_machine_list) () =
  ({ state_machines = state_machines_; next_token = next_token_ } : list_state_machines_output)

let make_list_state_machines_input ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : page_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_state_machines_input)

let make_state_machine_alias_list_item
    ~state_machine_alias_arn:(state_machine_alias_arn_ : long_arn)
    ~creation_date:(creation_date_ : timestamp) () =
  ({ state_machine_alias_arn = state_machine_alias_arn_; creation_date = creation_date_ }
    : state_machine_alias_list_item)

let make_list_state_machine_aliases_output ?next_token:(next_token_ : page_token option)
    ~state_machine_aliases:(state_machine_aliases_ : state_machine_alias_list) () =
  ({ state_machine_aliases = state_machine_aliases_; next_token = next_token_ }
    : list_state_machine_aliases_output)

let make_list_state_machine_aliases_input ?next_token:(next_token_ : page_token option)
    ?max_results:(max_results_ : page_size option) ~state_machine_arn:(state_machine_arn_ : arn) ()
    =
  ({ state_machine_arn = state_machine_arn_; next_token = next_token_; max_results = max_results_ }
    : list_state_machine_aliases_input)

let make_map_run_list_item ?stop_date:(stop_date_ : timestamp option)
    ~execution_arn:(execution_arn_ : arn) ~map_run_arn:(map_run_arn_ : long_arn)
    ~state_machine_arn:(state_machine_arn_ : arn) ~start_date:(start_date_ : timestamp) () =
  ({
     execution_arn = execution_arn_;
     map_run_arn = map_run_arn_;
     state_machine_arn = state_machine_arn_;
     start_date = start_date_;
     stop_date = stop_date_;
   }
    : map_run_list_item)

let make_list_map_runs_output ?next_token:(next_token_ : page_token option)
    ~map_runs:(map_runs_ : map_run_list) () =
  ({ map_runs = map_runs_; next_token = next_token_ } : list_map_runs_output)

let make_list_map_runs_input ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : page_token option) ~execution_arn:(execution_arn_ : arn) () =
  ({ execution_arn = execution_arn_; max_results = max_results_; next_token = next_token_ }
    : list_map_runs_input)

let make_execution_list_item ?stop_date:(stop_date_ : timestamp option)
    ?map_run_arn:(map_run_arn_ : long_arn option)
    ?item_count:(item_count_ : unsigned_integer option)
    ?state_machine_version_arn:(state_machine_version_arn_ : arn option)
    ?state_machine_alias_arn:(state_machine_alias_arn_ : arn option)
    ?redrive_count:(redrive_count_ : redrive_count option)
    ?redrive_date:(redrive_date_ : timestamp option) ~execution_arn:(execution_arn_ : arn)
    ~state_machine_arn:(state_machine_arn_ : arn) ~name:(name_ : name)
    ~status:(status_ : execution_status) ~start_date:(start_date_ : timestamp) () =
  ({
     execution_arn = execution_arn_;
     state_machine_arn = state_machine_arn_;
     name = name_;
     status = status_;
     start_date = start_date_;
     stop_date = stop_date_;
     map_run_arn = map_run_arn_;
     item_count = item_count_;
     state_machine_version_arn = state_machine_version_arn_;
     state_machine_alias_arn = state_machine_alias_arn_;
     redrive_count = redrive_count_;
     redrive_date = redrive_date_;
   }
    : execution_list_item)

let make_list_executions_output ?next_token:(next_token_ : list_executions_page_token option)
    ~executions:(executions_ : execution_list) () =
  ({ executions = executions_; next_token = next_token_ } : list_executions_output)

let make_list_executions_input ?state_machine_arn:(state_machine_arn_ : arn option)
    ?status_filter:(status_filter_ : execution_status option)
    ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : list_executions_page_token option)
    ?map_run_arn:(map_run_arn_ : long_arn option)
    ?redrive_filter:(redrive_filter_ : execution_redrive_filter option) () =
  ({
     state_machine_arn = state_machine_arn_;
     status_filter = status_filter_;
     max_results = max_results_;
     next_token = next_token_;
     map_run_arn = map_run_arn_;
     redrive_filter = redrive_filter_;
   }
    : list_executions_input)

let make_activity_list_item ~activity_arn:(activity_arn_ : arn) ~name:(name_ : name)
    ~creation_date:(creation_date_ : timestamp) () =
  ({ activity_arn = activity_arn_; name = name_; creation_date = creation_date_ }
    : activity_list_item)

let make_list_activities_output ?next_token:(next_token_ : page_token option)
    ~activities:(activities_ : activity_list) () =
  ({ activities = activities_; next_token = next_token_ } : list_activities_output)

let make_list_activities_input ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : page_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_activities_input)

let make_evaluation_failed_event_details ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option)
    ?location:(location_ : evaluation_failure_location option) ~state:(state_ : state_name) () =
  ({ error = error_; cause = cause_; location = location_; state = state_ }
    : evaluation_failed_event_details)

let make_map_run_redriven_event_details ?map_run_arn:(map_run_arn_ : long_arn option)
    ?redrive_count:(redrive_count_ : redrive_count option) () =
  ({ map_run_arn = map_run_arn_; redrive_count = redrive_count_ } : map_run_redriven_event_details)

let make_map_run_failed_event_details ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option) () =
  ({ error = error_; cause = cause_ } : map_run_failed_event_details)

let make_map_run_started_event_details ?map_run_arn:(map_run_arn_ : long_arn option) () =
  ({ map_run_arn = map_run_arn_ } : map_run_started_event_details)

let make_assigned_variables_details ?truncated:(truncated_ : truncated option) () =
  ({ truncated = truncated_ } : assigned_variables_details)

let make_history_event_execution_data_details ?truncated:(truncated_ : truncated option) () =
  ({ truncated = truncated_ } : history_event_execution_data_details)

let make_state_exited_event_details ?output:(output_ : sensitive_data option)
    ?output_details:(output_details_ : history_event_execution_data_details option)
    ?assigned_variables:(assigned_variables_ : assigned_variables option)
    ?assigned_variables_details:(assigned_variables_details_ : assigned_variables_details option)
    ~name:(name_ : name) () =
  ({
     name = name_;
     output = output_;
     output_details = output_details_;
     assigned_variables = assigned_variables_;
     assigned_variables_details = assigned_variables_details_;
   }
    : state_exited_event_details)

let make_state_entered_event_details ?input:(input_ : sensitive_data option)
    ?input_details:(input_details_ : history_event_execution_data_details option)
    ~name:(name_ : name) () =
  ({ name = name_; input = input_; input_details = input_details_ } : state_entered_event_details)

let make_lambda_function_timed_out_event_details ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option) () =
  ({ error = error_; cause = cause_ } : lambda_function_timed_out_event_details)

let make_lambda_function_succeeded_event_details ?output:(output_ : sensitive_data option)
    ?output_details:(output_details_ : history_event_execution_data_details option) () =
  ({ output = output_; output_details = output_details_ } : lambda_function_succeeded_event_details)

let make_lambda_function_start_failed_event_details ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option) () =
  ({ error = error_; cause = cause_ } : lambda_function_start_failed_event_details)

let make_task_credentials ?role_arn:(role_arn_ : long_arn option) () =
  ({ role_arn = role_arn_ } : task_credentials)

let make_lambda_function_scheduled_event_details ?input:(input_ : sensitive_data option)
    ?input_details:(input_details_ : history_event_execution_data_details option)
    ?timeout_in_seconds:(timeout_in_seconds_ : timeout_in_seconds option)
    ?task_credentials:(task_credentials_ : task_credentials option) ~resource:(resource_ : arn) () =
  ({
     resource = resource_;
     input = input_;
     input_details = input_details_;
     timeout_in_seconds = timeout_in_seconds_;
     task_credentials = task_credentials_;
   }
    : lambda_function_scheduled_event_details)

let make_lambda_function_schedule_failed_event_details ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option) () =
  ({ error = error_; cause = cause_ } : lambda_function_schedule_failed_event_details)

let make_lambda_function_failed_event_details ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option) () =
  ({ error = error_; cause = cause_ } : lambda_function_failed_event_details)

let make_map_iteration_event_details ?name:(name_ : name option)
    ?index:(index_ : unsigned_integer option) () =
  ({ name = name_; index = index_ } : map_iteration_event_details)

let make_map_state_started_event_details ?length:(length_ : unsigned_integer option) () =
  ({ length = length_ } : map_state_started_event_details)

let make_execution_redriven_event_details ?redrive_count:(redrive_count_ : redrive_count option) ()
    =
  ({ redrive_count = redrive_count_ } : execution_redriven_event_details)

let make_execution_timed_out_event_details ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option) () =
  ({ error = error_; cause = cause_ } : execution_timed_out_event_details)

let make_execution_aborted_event_details ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option) () =
  ({ error = error_; cause = cause_ } : execution_aborted_event_details)

let make_execution_succeeded_event_details ?output:(output_ : sensitive_data option)
    ?output_details:(output_details_ : history_event_execution_data_details option) () =
  ({ output = output_; output_details = output_details_ } : execution_succeeded_event_details)

let make_execution_started_event_details ?input:(input_ : sensitive_data option)
    ?input_details:(input_details_ : history_event_execution_data_details option)
    ?role_arn:(role_arn_ : arn option)
    ?state_machine_alias_arn:(state_machine_alias_arn_ : arn option)
    ?state_machine_version_arn:(state_machine_version_arn_ : arn option) () =
  ({
     input = input_;
     input_details = input_details_;
     role_arn = role_arn_;
     state_machine_alias_arn = state_machine_alias_arn_;
     state_machine_version_arn = state_machine_version_arn_;
   }
    : execution_started_event_details)

let make_execution_failed_event_details ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option) () =
  ({ error = error_; cause = cause_ } : execution_failed_event_details)

let make_task_timed_out_event_details ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option) ~resource_type:(resource_type_ : name)
    ~resource:(resource_ : name) () =
  ({ resource_type = resource_type_; resource = resource_; error = error_; cause = cause_ }
    : task_timed_out_event_details)

let make_task_succeeded_event_details ?output:(output_ : sensitive_data option)
    ?output_details:(output_details_ : history_event_execution_data_details option)
    ~resource_type:(resource_type_ : name) ~resource:(resource_ : name) () =
  ({
     resource_type = resource_type_;
     resource = resource_;
     output = output_;
     output_details = output_details_;
   }
    : task_succeeded_event_details)

let make_task_submitted_event_details ?output:(output_ : sensitive_data option)
    ?output_details:(output_details_ : history_event_execution_data_details option)
    ~resource_type:(resource_type_ : name) ~resource:(resource_ : name) () =
  ({
     resource_type = resource_type_;
     resource = resource_;
     output = output_;
     output_details = output_details_;
   }
    : task_submitted_event_details)

let make_task_submit_failed_event_details ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option) ~resource_type:(resource_type_ : name)
    ~resource:(resource_ : name) () =
  ({ resource_type = resource_type_; resource = resource_; error = error_; cause = cause_ }
    : task_submit_failed_event_details)

let make_task_started_event_details ~resource_type:(resource_type_ : name)
    ~resource:(resource_ : name) () =
  ({ resource_type = resource_type_; resource = resource_ } : task_started_event_details)

let make_task_start_failed_event_details ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option) ~resource_type:(resource_type_ : name)
    ~resource:(resource_ : name) () =
  ({ resource_type = resource_type_; resource = resource_; error = error_; cause = cause_ }
    : task_start_failed_event_details)

let make_task_scheduled_event_details
    ?timeout_in_seconds:(timeout_in_seconds_ : timeout_in_seconds option)
    ?heartbeat_in_seconds:(heartbeat_in_seconds_ : timeout_in_seconds option)
    ?task_credentials:(task_credentials_ : task_credentials option)
    ~resource_type:(resource_type_ : name) ~resource:(resource_ : name) ~region:(region_ : name)
    ~parameters:(parameters_ : connector_parameters) () =
  ({
     resource_type = resource_type_;
     resource = resource_;
     region = region_;
     parameters = parameters_;
     timeout_in_seconds = timeout_in_seconds_;
     heartbeat_in_seconds = heartbeat_in_seconds_;
     task_credentials = task_credentials_;
   }
    : task_scheduled_event_details)

let make_task_failed_event_details ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option) ~resource_type:(resource_type_ : name)
    ~resource:(resource_ : name) () =
  ({ resource_type = resource_type_; resource = resource_; error = error_; cause = cause_ }
    : task_failed_event_details)

let make_activity_timed_out_event_details ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option) () =
  ({ error = error_; cause = cause_ } : activity_timed_out_event_details)

let make_activity_succeeded_event_details ?output:(output_ : sensitive_data option)
    ?output_details:(output_details_ : history_event_execution_data_details option) () =
  ({ output = output_; output_details = output_details_ } : activity_succeeded_event_details)

let make_activity_started_event_details ?worker_name:(worker_name_ : identity option) () =
  ({ worker_name = worker_name_ } : activity_started_event_details)

let make_activity_scheduled_event_details ?input:(input_ : sensitive_data option)
    ?input_details:(input_details_ : history_event_execution_data_details option)
    ?timeout_in_seconds:(timeout_in_seconds_ : timeout_in_seconds option)
    ?heartbeat_in_seconds:(heartbeat_in_seconds_ : timeout_in_seconds option)
    ~resource:(resource_ : arn) () =
  ({
     resource = resource_;
     input = input_;
     input_details = input_details_;
     timeout_in_seconds = timeout_in_seconds_;
     heartbeat_in_seconds = heartbeat_in_seconds_;
   }
    : activity_scheduled_event_details)

let make_activity_schedule_failed_event_details ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option) () =
  ({ error = error_; cause = cause_ } : activity_schedule_failed_event_details)

let make_activity_failed_event_details ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option) () =
  ({ error = error_; cause = cause_ } : activity_failed_event_details)

let make_history_event ?previous_event_id:(previous_event_id_ : event_id option)
    ?activity_failed_event_details:
      (activity_failed_event_details_ : activity_failed_event_details option)
    ?activity_schedule_failed_event_details:
      (activity_schedule_failed_event_details_ : activity_schedule_failed_event_details option)
    ?activity_scheduled_event_details:
      (activity_scheduled_event_details_ : activity_scheduled_event_details option)
    ?activity_started_event_details:
      (activity_started_event_details_ : activity_started_event_details option)
    ?activity_succeeded_event_details:
      (activity_succeeded_event_details_ : activity_succeeded_event_details option)
    ?activity_timed_out_event_details:
      (activity_timed_out_event_details_ : activity_timed_out_event_details option)
    ?task_failed_event_details:(task_failed_event_details_ : task_failed_event_details option)
    ?task_scheduled_event_details:
      (task_scheduled_event_details_ : task_scheduled_event_details option)
    ?task_start_failed_event_details:
      (task_start_failed_event_details_ : task_start_failed_event_details option)
    ?task_started_event_details:(task_started_event_details_ : task_started_event_details option)
    ?task_submit_failed_event_details:
      (task_submit_failed_event_details_ : task_submit_failed_event_details option)
    ?task_submitted_event_details:
      (task_submitted_event_details_ : task_submitted_event_details option)
    ?task_succeeded_event_details:
      (task_succeeded_event_details_ : task_succeeded_event_details option)
    ?task_timed_out_event_details:
      (task_timed_out_event_details_ : task_timed_out_event_details option)
    ?execution_failed_event_details:
      (execution_failed_event_details_ : execution_failed_event_details option)
    ?execution_started_event_details:
      (execution_started_event_details_ : execution_started_event_details option)
    ?execution_succeeded_event_details:
      (execution_succeeded_event_details_ : execution_succeeded_event_details option)
    ?execution_aborted_event_details:
      (execution_aborted_event_details_ : execution_aborted_event_details option)
    ?execution_timed_out_event_details:
      (execution_timed_out_event_details_ : execution_timed_out_event_details option)
    ?execution_redriven_event_details:
      (execution_redriven_event_details_ : execution_redriven_event_details option)
    ?map_state_started_event_details:
      (map_state_started_event_details_ : map_state_started_event_details option)
    ?map_iteration_started_event_details:
      (map_iteration_started_event_details_ : map_iteration_event_details option)
    ?map_iteration_succeeded_event_details:
      (map_iteration_succeeded_event_details_ : map_iteration_event_details option)
    ?map_iteration_failed_event_details:
      (map_iteration_failed_event_details_ : map_iteration_event_details option)
    ?map_iteration_aborted_event_details:
      (map_iteration_aborted_event_details_ : map_iteration_event_details option)
    ?lambda_function_failed_event_details:
      (lambda_function_failed_event_details_ : lambda_function_failed_event_details option)
    ?lambda_function_schedule_failed_event_details:
      (lambda_function_schedule_failed_event_details_ :
         lambda_function_schedule_failed_event_details option)
    ?lambda_function_scheduled_event_details:
      (lambda_function_scheduled_event_details_ : lambda_function_scheduled_event_details option)
    ?lambda_function_start_failed_event_details:
      (lambda_function_start_failed_event_details_ :
         lambda_function_start_failed_event_details option)
    ?lambda_function_succeeded_event_details:
      (lambda_function_succeeded_event_details_ : lambda_function_succeeded_event_details option)
    ?lambda_function_timed_out_event_details:
      (lambda_function_timed_out_event_details_ : lambda_function_timed_out_event_details option)
    ?state_entered_event_details:(state_entered_event_details_ : state_entered_event_details option)
    ?state_exited_event_details:(state_exited_event_details_ : state_exited_event_details option)
    ?map_run_started_event_details:
      (map_run_started_event_details_ : map_run_started_event_details option)
    ?map_run_failed_event_details:
      (map_run_failed_event_details_ : map_run_failed_event_details option)
    ?map_run_redriven_event_details:
      (map_run_redriven_event_details_ : map_run_redriven_event_details option)
    ?evaluation_failed_event_details:
      (evaluation_failed_event_details_ : evaluation_failed_event_details option)
    ~timestamp:(timestamp_ : timestamp) ~type_:(type__ : history_event_type) ~id:(id_ : event_id) ()
    =
  ({
     timestamp = timestamp_;
     type_ = type__;
     id = id_;
     previous_event_id = previous_event_id_;
     activity_failed_event_details = activity_failed_event_details_;
     activity_schedule_failed_event_details = activity_schedule_failed_event_details_;
     activity_scheduled_event_details = activity_scheduled_event_details_;
     activity_started_event_details = activity_started_event_details_;
     activity_succeeded_event_details = activity_succeeded_event_details_;
     activity_timed_out_event_details = activity_timed_out_event_details_;
     task_failed_event_details = task_failed_event_details_;
     task_scheduled_event_details = task_scheduled_event_details_;
     task_start_failed_event_details = task_start_failed_event_details_;
     task_started_event_details = task_started_event_details_;
     task_submit_failed_event_details = task_submit_failed_event_details_;
     task_submitted_event_details = task_submitted_event_details_;
     task_succeeded_event_details = task_succeeded_event_details_;
     task_timed_out_event_details = task_timed_out_event_details_;
     execution_failed_event_details = execution_failed_event_details_;
     execution_started_event_details = execution_started_event_details_;
     execution_succeeded_event_details = execution_succeeded_event_details_;
     execution_aborted_event_details = execution_aborted_event_details_;
     execution_timed_out_event_details = execution_timed_out_event_details_;
     execution_redriven_event_details = execution_redriven_event_details_;
     map_state_started_event_details = map_state_started_event_details_;
     map_iteration_started_event_details = map_iteration_started_event_details_;
     map_iteration_succeeded_event_details = map_iteration_succeeded_event_details_;
     map_iteration_failed_event_details = map_iteration_failed_event_details_;
     map_iteration_aborted_event_details = map_iteration_aborted_event_details_;
     lambda_function_failed_event_details = lambda_function_failed_event_details_;
     lambda_function_schedule_failed_event_details = lambda_function_schedule_failed_event_details_;
     lambda_function_scheduled_event_details = lambda_function_scheduled_event_details_;
     lambda_function_start_failed_event_details = lambda_function_start_failed_event_details_;
     lambda_function_succeeded_event_details = lambda_function_succeeded_event_details_;
     lambda_function_timed_out_event_details = lambda_function_timed_out_event_details_;
     state_entered_event_details = state_entered_event_details_;
     state_exited_event_details = state_exited_event_details_;
     map_run_started_event_details = map_run_started_event_details_;
     map_run_failed_event_details = map_run_failed_event_details_;
     map_run_redriven_event_details = map_run_redriven_event_details_;
     evaluation_failed_event_details = evaluation_failed_event_details_;
   }
    : history_event)

let make_get_execution_history_output ?next_token:(next_token_ : page_token option)
    ~events:(events_ : history_event_list) () =
  ({ events = events_; next_token = next_token_ } : get_execution_history_output)

let make_get_execution_history_input ?max_results:(max_results_ : page_size option)
    ?reverse_order:(reverse_order_ : reverse_order option)
    ?next_token:(next_token_ : page_token option)
    ?include_execution_data:
      (include_execution_data_ : include_execution_data_get_execution_history option)
    ~execution_arn:(execution_arn_ : arn) () =
  ({
     execution_arn = execution_arn_;
     max_results = max_results_;
     reverse_order = reverse_order_;
     next_token = next_token_;
     include_execution_data = include_execution_data_;
   }
    : get_execution_history_input)

let make_get_activity_task_output ?task_token:(task_token_ : task_token option)
    ?input:(input_ : sensitive_data_job_input option) () =
  ({ task_token = task_token_; input = input_ } : get_activity_task_output)

let make_get_activity_task_input ?worker_name:(worker_name_ : name option)
    ~activity_arn:(activity_arn_ : arn) () =
  ({ activity_arn = activity_arn_; worker_name = worker_name_ } : get_activity_task_input)

let make_describe_state_machine_for_execution_output
    ?logging_configuration:(logging_configuration_ : logging_configuration option)
    ?tracing_configuration:(tracing_configuration_ : tracing_configuration option)
    ?map_run_arn:(map_run_arn_ : long_arn option) ?label:(label_ : map_run_label option)
    ?revision_id:(revision_id_ : revision_id option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?variable_references:(variable_references_ : variable_references option)
    ~state_machine_arn:(state_machine_arn_ : arn) ~name:(name_ : name)
    ~definition:(definition_ : definition) ~role_arn:(role_arn_ : arn)
    ~update_date:(update_date_ : timestamp) () =
  ({
     state_machine_arn = state_machine_arn_;
     name = name_;
     definition = definition_;
     role_arn = role_arn_;
     update_date = update_date_;
     logging_configuration = logging_configuration_;
     tracing_configuration = tracing_configuration_;
     map_run_arn = map_run_arn_;
     label = label_;
     revision_id = revision_id_;
     encryption_configuration = encryption_configuration_;
     variable_references = variable_references_;
   }
    : describe_state_machine_for_execution_output)

let make_describe_state_machine_for_execution_input
    ?included_data:(included_data_ : included_data option) ~execution_arn:(execution_arn_ : arn) ()
    =
  ({ execution_arn = execution_arn_; included_data = included_data_ }
    : describe_state_machine_for_execution_input)

let make_describe_state_machine_alias_output
    ?state_machine_alias_arn:(state_machine_alias_arn_ : arn option) ?name:(name_ : name option)
    ?description:(description_ : alias_description option)
    ?routing_configuration:(routing_configuration_ : routing_configuration_list option)
    ?creation_date:(creation_date_ : timestamp option)
    ?update_date:(update_date_ : timestamp option) () =
  ({
     state_machine_alias_arn = state_machine_alias_arn_;
     name = name_;
     description = description_;
     routing_configuration = routing_configuration_;
     creation_date = creation_date_;
     update_date = update_date_;
   }
    : describe_state_machine_alias_output)

let make_describe_state_machine_alias_input
    ~state_machine_alias_arn:(state_machine_alias_arn_ : arn) () =
  ({ state_machine_alias_arn = state_machine_alias_arn_ } : describe_state_machine_alias_input)

let make_describe_state_machine_output ?status:(status_ : state_machine_status option)
    ?logging_configuration:(logging_configuration_ : logging_configuration option)
    ?tracing_configuration:(tracing_configuration_ : tracing_configuration option)
    ?label:(label_ : map_run_label option) ?revision_id:(revision_id_ : revision_id option)
    ?description:(description_ : version_description option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?variable_references:(variable_references_ : variable_references option)
    ~state_machine_arn:(state_machine_arn_ : arn) ~name:(name_ : name)
    ~definition:(definition_ : definition) ~role_arn:(role_arn_ : arn)
    ~type_:(type__ : state_machine_type) ~creation_date:(creation_date_ : timestamp) () =
  ({
     state_machine_arn = state_machine_arn_;
     name = name_;
     status = status_;
     definition = definition_;
     role_arn = role_arn_;
     type_ = type__;
     creation_date = creation_date_;
     logging_configuration = logging_configuration_;
     tracing_configuration = tracing_configuration_;
     label = label_;
     revision_id = revision_id_;
     description = description_;
     encryption_configuration = encryption_configuration_;
     variable_references = variable_references_;
   }
    : describe_state_machine_output)

let make_describe_state_machine_input ?included_data:(included_data_ : included_data option)
    ~state_machine_arn:(state_machine_arn_ : arn) () =
  ({ state_machine_arn = state_machine_arn_; included_data = included_data_ }
    : describe_state_machine_input)

let make_map_run_execution_counts
    ?failures_not_redrivable:(failures_not_redrivable_ : long_object option)
    ?pending_redrive:(pending_redrive_ : long_object option) ~pending:(pending_ : unsigned_long)
    ~running:(running_ : unsigned_long) ~succeeded:(succeeded_ : unsigned_long)
    ~failed:(failed_ : unsigned_long) ~timed_out:(timed_out_ : unsigned_long)
    ~aborted:(aborted_ : unsigned_long) ~total:(total_ : unsigned_long)
    ~results_written:(results_written_ : unsigned_long) () =
  ({
     pending = pending_;
     running = running_;
     succeeded = succeeded_;
     failed = failed_;
     timed_out = timed_out_;
     aborted = aborted_;
     total = total_;
     results_written = results_written_;
     failures_not_redrivable = failures_not_redrivable_;
     pending_redrive = pending_redrive_;
   }
    : map_run_execution_counts)

let make_map_run_item_counts
    ?failures_not_redrivable:(failures_not_redrivable_ : long_object option)
    ?pending_redrive:(pending_redrive_ : long_object option) ~pending:(pending_ : unsigned_long)
    ~running:(running_ : unsigned_long) ~succeeded:(succeeded_ : unsigned_long)
    ~failed:(failed_ : unsigned_long) ~timed_out:(timed_out_ : unsigned_long)
    ~aborted:(aborted_ : unsigned_long) ~total:(total_ : unsigned_long)
    ~results_written:(results_written_ : unsigned_long) () =
  ({
     pending = pending_;
     running = running_;
     succeeded = succeeded_;
     failed = failed_;
     timed_out = timed_out_;
     aborted = aborted_;
     total = total_;
     results_written = results_written_;
     failures_not_redrivable = failures_not_redrivable_;
     pending_redrive = pending_redrive_;
   }
    : map_run_item_counts)

let make_describe_map_run_output ?stop_date:(stop_date_ : timestamp option)
    ?redrive_count:(redrive_count_ : redrive_count option)
    ?redrive_date:(redrive_date_ : timestamp option) ~map_run_arn:(map_run_arn_ : long_arn)
    ~execution_arn:(execution_arn_ : arn) ~status:(status_ : map_run_status)
    ~start_date:(start_date_ : timestamp) ~max_concurrency:(max_concurrency_ : max_concurrency)
    ~tolerated_failure_percentage:(tolerated_failure_percentage_ : tolerated_failure_percentage)
    ~tolerated_failure_count:(tolerated_failure_count_ : tolerated_failure_count)
    ~item_counts:(item_counts_ : map_run_item_counts)
    ~execution_counts:(execution_counts_ : map_run_execution_counts) () =
  ({
     map_run_arn = map_run_arn_;
     execution_arn = execution_arn_;
     status = status_;
     start_date = start_date_;
     stop_date = stop_date_;
     max_concurrency = max_concurrency_;
     tolerated_failure_percentage = tolerated_failure_percentage_;
     tolerated_failure_count = tolerated_failure_count_;
     item_counts = item_counts_;
     execution_counts = execution_counts_;
     redrive_count = redrive_count_;
     redrive_date = redrive_date_;
   }
    : describe_map_run_output)

let make_describe_map_run_input ~map_run_arn:(map_run_arn_ : long_arn) () =
  ({ map_run_arn = map_run_arn_ } : describe_map_run_input)

let make_describe_execution_output ?name:(name_ : name option)
    ?stop_date:(stop_date_ : timestamp option) ?input:(input_ : sensitive_data option)
    ?input_details:(input_details_ : cloud_watch_events_execution_data_details option)
    ?output:(output_ : sensitive_data option)
    ?output_details:(output_details_ : cloud_watch_events_execution_data_details option)
    ?trace_header:(trace_header_ : trace_header option)
    ?map_run_arn:(map_run_arn_ : long_arn option) ?error:(error_ : sensitive_error option)
    ?cause:(cause_ : sensitive_cause option)
    ?state_machine_version_arn:(state_machine_version_arn_ : arn option)
    ?state_machine_alias_arn:(state_machine_alias_arn_ : arn option)
    ?redrive_count:(redrive_count_ : redrive_count option)
    ?redrive_date:(redrive_date_ : timestamp option)
    ?redrive_status:(redrive_status_ : execution_redrive_status option)
    ?redrive_status_reason:(redrive_status_reason_ : sensitive_data option)
    ~execution_arn:(execution_arn_ : arn) ~state_machine_arn:(state_machine_arn_ : arn)
    ~status:(status_ : execution_status) ~start_date:(start_date_ : timestamp) () =
  ({
     execution_arn = execution_arn_;
     state_machine_arn = state_machine_arn_;
     name = name_;
     status = status_;
     start_date = start_date_;
     stop_date = stop_date_;
     input = input_;
     input_details = input_details_;
     output = output_;
     output_details = output_details_;
     trace_header = trace_header_;
     map_run_arn = map_run_arn_;
     error = error_;
     cause = cause_;
     state_machine_version_arn = state_machine_version_arn_;
     state_machine_alias_arn = state_machine_alias_arn_;
     redrive_count = redrive_count_;
     redrive_date = redrive_date_;
     redrive_status = redrive_status_;
     redrive_status_reason = redrive_status_reason_;
   }
    : describe_execution_output)

let make_describe_execution_input ?included_data:(included_data_ : included_data option)
    ~execution_arn:(execution_arn_ : arn) () =
  ({ execution_arn = execution_arn_; included_data = included_data_ } : describe_execution_input)

let make_describe_activity_output
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ~activity_arn:(activity_arn_ : arn) ~name:(name_ : name)
    ~creation_date:(creation_date_ : timestamp) () =
  ({
     activity_arn = activity_arn_;
     name = name_;
     creation_date = creation_date_;
     encryption_configuration = encryption_configuration_;
   }
    : describe_activity_output)

let make_describe_activity_input ~activity_arn:(activity_arn_ : arn) () =
  ({ activity_arn = activity_arn_ } : describe_activity_input)

let make_delete_state_machine_version_output () = (() : unit)

let make_delete_state_machine_version_input
    ~state_machine_version_arn:(state_machine_version_arn_ : long_arn) () =
  ({ state_machine_version_arn = state_machine_version_arn_ } : delete_state_machine_version_input)

let make_delete_state_machine_alias_output () = (() : unit)

let make_delete_state_machine_alias_input ~state_machine_alias_arn:(state_machine_alias_arn_ : arn)
    () =
  ({ state_machine_alias_arn = state_machine_alias_arn_ } : delete_state_machine_alias_input)

let make_delete_state_machine_output () = (() : unit)

let make_delete_state_machine_input ~state_machine_arn:(state_machine_arn_ : arn) () =
  ({ state_machine_arn = state_machine_arn_ } : delete_state_machine_input)

let make_delete_activity_output () = (() : unit)

let make_delete_activity_input ~activity_arn:(activity_arn_ : arn) () =
  ({ activity_arn = activity_arn_ } : delete_activity_input)

let make_create_state_machine_alias_output ~state_machine_alias_arn:(state_machine_alias_arn_ : arn)
    ~creation_date:(creation_date_ : timestamp) () =
  ({ state_machine_alias_arn = state_machine_alias_arn_; creation_date = creation_date_ }
    : create_state_machine_alias_output)

let make_create_state_machine_alias_input ?description:(description_ : alias_description option)
    ~name:(name_ : character_restricted_name)
    ~routing_configuration:(routing_configuration_ : routing_configuration_list) () =
  ({ description = description_; name = name_; routing_configuration = routing_configuration_ }
    : create_state_machine_alias_input)

let make_create_state_machine_output
    ?state_machine_version_arn:(state_machine_version_arn_ : arn option)
    ~state_machine_arn:(state_machine_arn_ : arn) ~creation_date:(creation_date_ : timestamp) () =
  ({
     state_machine_arn = state_machine_arn_;
     creation_date = creation_date_;
     state_machine_version_arn = state_machine_version_arn_;
   }
    : create_state_machine_output)

let make_create_state_machine_input ?type_:(type__ : state_machine_type option)
    ?logging_configuration:(logging_configuration_ : logging_configuration option)
    ?tags:(tags_ : tag_list option)
    ?tracing_configuration:(tracing_configuration_ : tracing_configuration option)
    ?publish:(publish_ : publish option)
    ?version_description:(version_description_ : version_description option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ~name:(name_ : name) ~definition:(definition_ : definition) ~role_arn:(role_arn_ : arn) () =
  ({
     name = name_;
     definition = definition_;
     role_arn = role_arn_;
     type_ = type__;
     logging_configuration = logging_configuration_;
     tags = tags_;
     tracing_configuration = tracing_configuration_;
     publish = publish_;
     version_description = version_description_;
     encryption_configuration = encryption_configuration_;
   }
    : create_state_machine_input)

let make_create_activity_output ~activity_arn:(activity_arn_ : arn)
    ~creation_date:(creation_date_ : timestamp) () =
  ({ activity_arn = activity_arn_; creation_date = creation_date_ } : create_activity_output)

let make_create_activity_input ?tags:(tags_ : tag_list option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ~name:(name_ : name) () =
  ({ name = name_; tags = tags_; encryption_configuration = encryption_configuration_ }
    : create_activity_input)
