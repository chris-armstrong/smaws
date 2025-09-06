open Types
let make_validate_state_machine_definition_diagnostic
  ?location:(location_ : validate_state_machine_definition_location option)
  ~message:(message_ : validate_state_machine_definition_message)
  ~code:(code_ : validate_state_machine_definition_code)
  ~severity:(severity_ : validate_state_machine_definition_severity) () =
  ({
     location = location_;
     message = message_;
     code = code_;
     severity = severity_
   } : validate_state_machine_definition_diagnostic)
let make_validate_state_machine_definition_output
  ?truncated:(truncated_ :
               validate_state_machine_definition_truncated option)
  ~diagnostics:(diagnostics_ :
                 validate_state_machine_definition_diagnostic_list)
  ~result:(result_ : validate_state_machine_definition_result_code) () =
  ({ truncated = truncated_; diagnostics = diagnostics_; result = result_ } : 
  validate_state_machine_definition_output)
let make_validate_state_machine_definition_input
  ?max_results:(max_results_ :
                 validate_state_machine_definition_max_result option)
  ?severity:(severity_ : validate_state_machine_definition_severity option)
  ?type_:(type__ : state_machine_type option)
  ~definition:(definition_ : definition) () =
  ({
     max_results = max_results_;
     severity = severity_;
     type_ = type__;
     definition = definition_
   } : validate_state_machine_definition_input)
let make_update_state_machine_output
  ?state_machine_version_arn:(state_machine_version_arn_ : arn option)
  ?revision_id:(revision_id_ : revision_id option)
  ~update_date:(update_date_ : timestamp) () =
  ({
     state_machine_version_arn = state_machine_version_arn_;
     revision_id = revision_id_;
     update_date = update_date_
   } : update_state_machine_output)
let make_cloud_watch_logs_log_group
  ?log_group_arn:(log_group_arn_ : arn option) () =
  ({ log_group_arn = log_group_arn_ } : cloud_watch_logs_log_group)
let make_log_destination
  ?cloud_watch_logs_log_group:(cloud_watch_logs_log_group_ :
                                cloud_watch_logs_log_group option)
  () =
  ({ cloud_watch_logs_log_group = cloud_watch_logs_log_group_ } : log_destination)
let make_logging_configuration
  ?destinations:(destinations_ : log_destination_list option)
  ?include_execution_data:(include_execution_data_ :
                            include_execution_data option)
  ?level:(level_ : log_level option) () =
  ({
     destinations = destinations_;
     include_execution_data = include_execution_data_;
     level = level_
   } : logging_configuration)
let make_tracing_configuration ?enabled:(enabled_ : enabled option) () =
  ({ enabled = enabled_ } : tracing_configuration)
let make_encryption_configuration
  ?kms_data_key_reuse_period_seconds:(kms_data_key_reuse_period_seconds_ :
                                       kms_data_key_reuse_period_seconds
                                         option)
  ?kms_key_id:(kms_key_id_ : kms_key_id option)
  ~type_:(type__ : encryption_type) () =
  ({
     type_ = type__;
     kms_data_key_reuse_period_seconds = kms_data_key_reuse_period_seconds_;
     kms_key_id = kms_key_id_
   } : encryption_configuration)
let make_update_state_machine_input
  ?encryption_configuration:(encryption_configuration_ :
                              encryption_configuration option)
  ?version_description:(version_description_ : version_description option)
  ?publish:(publish_ : publish option)
  ?tracing_configuration:(tracing_configuration_ :
                           tracing_configuration option)
  ?logging_configuration:(logging_configuration_ :
                           logging_configuration option)
  ?role_arn:(role_arn_ : arn option)
  ?definition:(definition_ : definition option)
  ~state_machine_arn:(state_machine_arn_ : arn) () =
  ({
     encryption_configuration = encryption_configuration_;
     version_description = version_description_;
     publish = publish_;
     tracing_configuration = tracing_configuration_;
     logging_configuration = logging_configuration_;
     role_arn = role_arn_;
     definition = definition_;
     state_machine_arn = state_machine_arn_
   } : update_state_machine_input)
let make_update_state_machine_alias_output
  ~update_date:(update_date_ : timestamp) () =
  ({ update_date = update_date_ } : update_state_machine_alias_output)
let make_routing_configuration_list_item ~weight:(weight_ : version_weight)
  ~state_machine_version_arn:(state_machine_version_arn_ : arn) () =
  ({ weight = weight_; state_machine_version_arn = state_machine_version_arn_
   } : routing_configuration_list_item)
let make_update_state_machine_alias_input
  ?routing_configuration:(routing_configuration_ :
                           routing_configuration_list option)
  ?description:(description_ : alias_description option)
  ~state_machine_alias_arn:(state_machine_alias_arn_ : arn) () =
  ({
     routing_configuration = routing_configuration_;
     description = description_;
     state_machine_alias_arn = state_machine_alias_arn_
   } : update_state_machine_alias_input)
let make_update_map_run_output () = (() : unit)
let make_update_map_run_input
  ?tolerated_failure_count:(tolerated_failure_count_ :
                             tolerated_failure_count option)
  ?tolerated_failure_percentage:(tolerated_failure_percentage_ :
                                  tolerated_failure_percentage option)
  ?max_concurrency:(max_concurrency_ : max_concurrency option)
  ~map_run_arn:(map_run_arn_ : long_arn) () =
  ({
     tolerated_failure_count = tolerated_failure_count_;
     tolerated_failure_percentage = tolerated_failure_percentage_;
     max_concurrency = max_concurrency_;
     map_run_arn = map_run_arn_
   } : update_map_run_input)
let make_untag_resource_output () = (() : unit)
let make_untag_resource_input ~tag_keys:(tag_keys_ : tag_key_list)
  ~resource_arn:(resource_arn_ : arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_input)
let make_inspection_data_request ?body:(body_ : http_body option)
  ?headers:(headers_ : http_headers option) ?url:(url_ : ur_l option)
  ?method_:(method__ : http_method option)
  ?protocol:(protocol_ : http_protocol option) () =
  ({
     body = body_;
     headers = headers_;
     url = url_;
     method_ = method__;
     protocol = protocol_
   } : inspection_data_request)
let make_inspection_data_response ?body:(body_ : http_body option)
  ?headers:(headers_ : http_headers option)
  ?status_message:(status_message_ : http_status_message option)
  ?status_code:(status_code_ : http_status_code option)
  ?protocol:(protocol_ : http_protocol option) () =
  ({
     body = body_;
     headers = headers_;
     status_message = status_message_;
     status_code = status_code_;
     protocol = protocol_
   } : inspection_data_response)
let make_inspection_data ?variables:(variables_ : sensitive_data option)
  ?response:(response_ : inspection_data_response option)
  ?request:(request_ : inspection_data_request option)
  ?after_result_path:(after_result_path_ : sensitive_data option)
  ?after_result_selector:(after_result_selector_ : sensitive_data option)
  ?result:(result_ : sensitive_data option)
  ?after_parameters:(after_parameters_ : sensitive_data option)
  ?after_input_path:(after_input_path_ : sensitive_data option)
  ?after_arguments:(after_arguments_ : sensitive_data option)
  ?input:(input_ : sensitive_data option) () =
  ({
     variables = variables_;
     response = response_;
     request = request_;
     after_result_path = after_result_path_;
     after_result_selector = after_result_selector_;
     result = result_;
     after_parameters = after_parameters_;
     after_input_path = after_input_path_;
     after_arguments = after_arguments_;
     input = input_
   } : inspection_data)
let make_test_state_output ?status:(status_ : test_execution_status option)
  ?next_state:(next_state_ : state_name option)
  ?inspection_data:(inspection_data_ : inspection_data option)
  ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option)
  ?output:(output_ : sensitive_data option) () =
  ({
     status = status_;
     next_state = next_state_;
     inspection_data = inspection_data_;
     cause = cause_;
     error = error_;
     output = output_
   } : test_state_output)
let make_test_state_input ?variables:(variables_ : sensitive_data option)
  ?reveal_secrets:(reveal_secrets_ : reveal_secrets option)
  ?inspection_level:(inspection_level_ : inspection_level option)
  ?input:(input_ : sensitive_data option) ?role_arn:(role_arn_ : arn option)
  ~definition:(definition_ : definition) () =
  ({
     variables = variables_;
     reveal_secrets = reveal_secrets_;
     inspection_level = inspection_level_;
     input = input_;
     role_arn = role_arn_;
     definition = definition_
   } : test_state_input)
let make_task_timed_out_event_details
  ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option) ~resource:(resource_ : name)
  ~resource_type:(resource_type_ : name) () =
  ({
     cause = cause_;
     error = error_;
     resource = resource_;
     resource_type = resource_type_
   } : task_timed_out_event_details)
let make_history_event_execution_data_details
  ?truncated:(truncated_ : truncated option) () =
  ({ truncated = truncated_ } : history_event_execution_data_details)
let make_task_succeeded_event_details
  ?output_details:(output_details_ :
                    history_event_execution_data_details option)
  ?output:(output_ : sensitive_data option) ~resource:(resource_ : name)
  ~resource_type:(resource_type_ : name) () =
  ({
     output_details = output_details_;
     output = output_;
     resource = resource_;
     resource_type = resource_type_
   } : task_succeeded_event_details)
let make_task_submitted_event_details
  ?output_details:(output_details_ :
                    history_event_execution_data_details option)
  ?output:(output_ : sensitive_data option) ~resource:(resource_ : name)
  ~resource_type:(resource_type_ : name) () =
  ({
     output_details = output_details_;
     output = output_;
     resource = resource_;
     resource_type = resource_type_
   } : task_submitted_event_details)
let make_task_submit_failed_event_details
  ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option) ~resource:(resource_ : name)
  ~resource_type:(resource_type_ : name) () =
  ({
     cause = cause_;
     error = error_;
     resource = resource_;
     resource_type = resource_type_
   } : task_submit_failed_event_details)
let make_task_started_event_details ~resource:(resource_ : name)
  ~resource_type:(resource_type_ : name) () =
  ({ resource = resource_; resource_type = resource_type_ } : task_started_event_details)
let make_task_start_failed_event_details
  ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option) ~resource:(resource_ : name)
  ~resource_type:(resource_type_ : name) () =
  ({
     cause = cause_;
     error = error_;
     resource = resource_;
     resource_type = resource_type_
   } : task_start_failed_event_details)
let make_task_credentials ?role_arn:(role_arn_ : long_arn option) () =
  ({ role_arn = role_arn_ } : task_credentials)
let make_task_scheduled_event_details
  ?task_credentials:(task_credentials_ : task_credentials option)
  ?heartbeat_in_seconds:(heartbeat_in_seconds_ : timeout_in_seconds option)
  ?timeout_in_seconds:(timeout_in_seconds_ : timeout_in_seconds option)
  ~parameters:(parameters_ : connector_parameters) ~region:(region_ : name)
  ~resource:(resource_ : name) ~resource_type:(resource_type_ : name) () =
  ({
     task_credentials = task_credentials_;
     heartbeat_in_seconds = heartbeat_in_seconds_;
     timeout_in_seconds = timeout_in_seconds_;
     parameters = parameters_;
     region = region_;
     resource = resource_;
     resource_type = resource_type_
   } : task_scheduled_event_details)
let make_task_failed_event_details ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option) ~resource:(resource_ : name)
  ~resource_type:(resource_type_ : name) () =
  ({
     cause = cause_;
     error = error_;
     resource = resource_;
     resource_type = resource_type_
   } : task_failed_event_details)
let make_tag_resource_output () = (() : unit)
let make_tag ?value:(value_ : tag_value option) ?key:(key_ : tag_key option)
  () = ({ value = value_; key = key_ } : tag)
let make_tag_resource_input ~tags:(tags_ : tag_list)
  ~resource_arn:(resource_arn_ : arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_input)
let make_stop_execution_output ~stop_date:(stop_date_ : timestamp) () =
  ({ stop_date = stop_date_ } : stop_execution_output)
let make_stop_execution_input ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option)
  ~execution_arn:(execution_arn_ : arn) () =
  ({ cause = cause_; error = error_; execution_arn = execution_arn_ } : 
  stop_execution_input)
let make_state_machine_version_list_item
  ~creation_date:(creation_date_ : timestamp)
  ~state_machine_version_arn:(state_machine_version_arn_ : long_arn) () =
  ({
     creation_date = creation_date_;
     state_machine_version_arn = state_machine_version_arn_
   } : state_machine_version_list_item)
let make_state_machine_list_item ~creation_date:(creation_date_ : timestamp)
  ~type_:(type__ : state_machine_type) ~name:(name_ : name)
  ~state_machine_arn:(state_machine_arn_ : arn) () =
  ({
     creation_date = creation_date_;
     type_ = type__;
     name = name_;
     state_machine_arn = state_machine_arn_
   } : state_machine_list_item)
let make_state_machine_alias_list_item
  ~creation_date:(creation_date_ : timestamp)
  ~state_machine_alias_arn:(state_machine_alias_arn_ : long_arn) () =
  ({
     creation_date = creation_date_;
     state_machine_alias_arn = state_machine_alias_arn_
   } : state_machine_alias_list_item)
let make_assigned_variables_details
  ?truncated:(truncated_ : truncated option) () =
  ({ truncated = truncated_ } : assigned_variables_details)
let make_state_exited_event_details
  ?assigned_variables_details:(assigned_variables_details_ :
                                assigned_variables_details option)
  ?assigned_variables:(assigned_variables_ : assigned_variables option)
  ?output_details:(output_details_ :
                    history_event_execution_data_details option)
  ?output:(output_ : sensitive_data option) ~name:(name_ : name) () =
  ({
     assigned_variables_details = assigned_variables_details_;
     assigned_variables = assigned_variables_;
     output_details = output_details_;
     output = output_;
     name = name_
   } : state_exited_event_details)
let make_state_entered_event_details
  ?input_details:(input_details_ :
                   history_event_execution_data_details option)
  ?input:(input_ : sensitive_data option) ~name:(name_ : name) () =
  ({ input_details = input_details_; input = input_; name = name_ } : 
  state_entered_event_details)
let make_cloud_watch_events_execution_data_details
  ?included:(included_ : included_details option) () =
  ({ included = included_ } : cloud_watch_events_execution_data_details)
let make_billing_details
  ?billed_duration_in_milliseconds:(billed_duration_in_milliseconds_ :
                                     billed_duration option)
  ?billed_memory_used_in_m_b:(billed_memory_used_in_m_b_ :
                               billed_memory_used option)
  () =
  ({
     billed_duration_in_milliseconds = billed_duration_in_milliseconds_;
     billed_memory_used_in_m_b = billed_memory_used_in_m_b_
   } : billing_details)
let make_start_sync_execution_output
  ?billing_details:(billing_details_ : billing_details option)
  ?trace_header:(trace_header_ : trace_header option)
  ?output_details:(output_details_ :
                    cloud_watch_events_execution_data_details option)
  ?output:(output_ : sensitive_data option)
  ?input_details:(input_details_ :
                   cloud_watch_events_execution_data_details option)
  ?input:(input_ : sensitive_data option)
  ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option) ?name:(name_ : name option)
  ?state_machine_arn:(state_machine_arn_ : arn option)
  ~status:(status_ : sync_execution_status)
  ~stop_date:(stop_date_ : timestamp) ~start_date:(start_date_ : timestamp)
  ~execution_arn:(execution_arn_ : arn) () =
  ({
     billing_details = billing_details_;
     trace_header = trace_header_;
     output_details = output_details_;
     output = output_;
     input_details = input_details_;
     input = input_;
     cause = cause_;
     error = error_;
     status = status_;
     stop_date = stop_date_;
     start_date = start_date_;
     name = name_;
     state_machine_arn = state_machine_arn_;
     execution_arn = execution_arn_
   } : start_sync_execution_output)
let make_start_sync_execution_input
  ?included_data:(included_data_ : included_data option)
  ?trace_header:(trace_header_ : trace_header option)
  ?input:(input_ : sensitive_data option) ?name:(name_ : name option)
  ~state_machine_arn:(state_machine_arn_ : arn) () =
  ({
     included_data = included_data_;
     trace_header = trace_header_;
     input = input_;
     name = name_;
     state_machine_arn = state_machine_arn_
   } : start_sync_execution_input)
let make_start_execution_output ~start_date:(start_date_ : timestamp)
  ~execution_arn:(execution_arn_ : arn) () =
  ({ start_date = start_date_; execution_arn = execution_arn_ } : start_execution_output)
let make_start_execution_input
  ?trace_header:(trace_header_ : trace_header option)
  ?input:(input_ : sensitive_data option) ?name:(name_ : name option)
  ~state_machine_arn:(state_machine_arn_ : arn) () =
  ({
     trace_header = trace_header_;
     input = input_;
     name = name_;
     state_machine_arn = state_machine_arn_
   } : start_execution_input)
let make_send_task_success_output () = (() : unit)
let make_send_task_success_input ~output:(output_ : sensitive_data)
  ~task_token:(task_token_ : task_token) () =
  ({ output = output_; task_token = task_token_ } : send_task_success_input)
let make_send_task_heartbeat_output () = (() : unit)
let make_send_task_heartbeat_input ~task_token:(task_token_ : task_token) ()
  = ({ task_token = task_token_ } : send_task_heartbeat_input)
let make_send_task_failure_output () = (() : unit)
let make_send_task_failure_input ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option)
  ~task_token:(task_token_ : task_token) () =
  ({ cause = cause_; error = error_; task_token = task_token_ } : send_task_failure_input)
let make_redrive_execution_output ~redrive_date:(redrive_date_ : timestamp)
  () = ({ redrive_date = redrive_date_ } : redrive_execution_output)
let make_redrive_execution_input
  ?client_token:(client_token_ : client_token option)
  ~execution_arn:(execution_arn_ : arn) () =
  ({ client_token = client_token_; execution_arn = execution_arn_ } : 
  redrive_execution_input)
let make_publish_state_machine_version_output
  ~state_machine_version_arn:(state_machine_version_arn_ : arn)
  ~creation_date:(creation_date_ : timestamp) () =
  ({
     state_machine_version_arn = state_machine_version_arn_;
     creation_date = creation_date_
   } : publish_state_machine_version_output)
let make_publish_state_machine_version_input
  ?description:(description_ : version_description option)
  ?revision_id:(revision_id_ : revision_id option)
  ~state_machine_arn:(state_machine_arn_ : arn) () =
  ({
     description = description_;
     revision_id = revision_id_;
     state_machine_arn = state_machine_arn_
   } : publish_state_machine_version_input)
let make_map_state_started_event_details
  ?length:(length_ : unsigned_integer option) () =
  ({ length = length_ } : map_state_started_event_details)
let make_map_run_started_event_details
  ?map_run_arn:(map_run_arn_ : long_arn option) () =
  ({ map_run_arn = map_run_arn_ } : map_run_started_event_details)
let make_map_run_redriven_event_details
  ?redrive_count:(redrive_count_ : redrive_count option)
  ?map_run_arn:(map_run_arn_ : long_arn option) () =
  ({ redrive_count = redrive_count_; map_run_arn = map_run_arn_ } : map_run_redriven_event_details)
let make_map_run_list_item ?stop_date:(stop_date_ : timestamp option)
  ~start_date:(start_date_ : timestamp)
  ~state_machine_arn:(state_machine_arn_ : arn)
  ~map_run_arn:(map_run_arn_ : long_arn)
  ~execution_arn:(execution_arn_ : arn) () =
  ({
     stop_date = stop_date_;
     start_date = start_date_;
     state_machine_arn = state_machine_arn_;
     map_run_arn = map_run_arn_;
     execution_arn = execution_arn_
   } : map_run_list_item)
let make_map_run_item_counts
  ?pending_redrive:(pending_redrive_ : long_object option)
  ?failures_not_redrivable:(failures_not_redrivable_ : long_object option)
  ~results_written:(results_written_ : unsigned_long)
  ~total:(total_ : unsigned_long) ~aborted:(aborted_ : unsigned_long)
  ~timed_out:(timed_out_ : unsigned_long) ~failed:(failed_ : unsigned_long)
  ~succeeded:(succeeded_ : unsigned_long) ~running:(running_ : unsigned_long)
  ~pending:(pending_ : unsigned_long) () =
  ({
     pending_redrive = pending_redrive_;
     failures_not_redrivable = failures_not_redrivable_;
     results_written = results_written_;
     total = total_;
     aborted = aborted_;
     timed_out = timed_out_;
     failed = failed_;
     succeeded = succeeded_;
     running = running_;
     pending = pending_
   } : map_run_item_counts)
let make_map_run_failed_event_details
  ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option) () =
  ({ cause = cause_; error = error_ } : map_run_failed_event_details)
let make_map_run_execution_counts
  ?pending_redrive:(pending_redrive_ : long_object option)
  ?failures_not_redrivable:(failures_not_redrivable_ : long_object option)
  ~results_written:(results_written_ : unsigned_long)
  ~total:(total_ : unsigned_long) ~aborted:(aborted_ : unsigned_long)
  ~timed_out:(timed_out_ : unsigned_long) ~failed:(failed_ : unsigned_long)
  ~succeeded:(succeeded_ : unsigned_long) ~running:(running_ : unsigned_long)
  ~pending:(pending_ : unsigned_long) () =
  ({
     pending_redrive = pending_redrive_;
     failures_not_redrivable = failures_not_redrivable_;
     results_written = results_written_;
     total = total_;
     aborted = aborted_;
     timed_out = timed_out_;
     failed = failed_;
     succeeded = succeeded_;
     running = running_;
     pending = pending_
   } : map_run_execution_counts)
let make_map_iteration_event_details
  ?index:(index_ : unsigned_integer option) ?name:(name_ : name option) () =
  ({ index = index_; name = name_ } : map_iteration_event_details)
let make_list_tags_for_resource_output ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_output)
let make_list_tags_for_resource_input ~resource_arn:(resource_arn_ : arn) ()
  = ({ resource_arn = resource_arn_ } : list_tags_for_resource_input)
let make_list_state_machines_output
  ?next_token:(next_token_ : page_token option)
  ~state_machines:(state_machines_ : state_machine_list) () =
  ({ next_token = next_token_; state_machines = state_machines_ } : list_state_machines_output)
let make_list_state_machines_input
  ?next_token:(next_token_ : page_token option)
  ?max_results:(max_results_ : page_size option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_state_machines_input)
let make_list_state_machine_versions_output
  ?next_token:(next_token_ : page_token option)
  ~state_machine_versions:(state_machine_versions_ :
                            state_machine_version_list)
  () =
  ({
     next_token = next_token_;
     state_machine_versions = state_machine_versions_
   } : list_state_machine_versions_output)
let make_list_state_machine_versions_input
  ?max_results:(max_results_ : page_size option)
  ?next_token:(next_token_ : page_token option)
  ~state_machine_arn:(state_machine_arn_ : arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     state_machine_arn = state_machine_arn_
   } : list_state_machine_versions_input)
let make_list_state_machine_aliases_output
  ?next_token:(next_token_ : page_token option)
  ~state_machine_aliases:(state_machine_aliases_ : state_machine_alias_list)
  () =
  ({ next_token = next_token_; state_machine_aliases = state_machine_aliases_
   } : list_state_machine_aliases_output)
let make_list_state_machine_aliases_input
  ?max_results:(max_results_ : page_size option)
  ?next_token:(next_token_ : page_token option)
  ~state_machine_arn:(state_machine_arn_ : arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     state_machine_arn = state_machine_arn_
   } : list_state_machine_aliases_input)
let make_list_map_runs_output ?next_token:(next_token_ : page_token option)
  ~map_runs:(map_runs_ : map_run_list) () =
  ({ next_token = next_token_; map_runs = map_runs_ } : list_map_runs_output)
let make_list_map_runs_input ?next_token:(next_token_ : page_token option)
  ?max_results:(max_results_ : page_size option)
  ~execution_arn:(execution_arn_ : arn) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     execution_arn = execution_arn_
   } : list_map_runs_input)
let make_execution_list_item ?redrive_date:(redrive_date_ : timestamp option)
  ?redrive_count:(redrive_count_ : redrive_count option)
  ?state_machine_alias_arn:(state_machine_alias_arn_ : arn option)
  ?state_machine_version_arn:(state_machine_version_arn_ : arn option)
  ?item_count:(item_count_ : unsigned_integer option)
  ?map_run_arn:(map_run_arn_ : long_arn option)
  ?stop_date:(stop_date_ : timestamp option)
  ~start_date:(start_date_ : timestamp) ~status:(status_ : execution_status)
  ~name:(name_ : name) ~state_machine_arn:(state_machine_arn_ : arn)
  ~execution_arn:(execution_arn_ : arn) () =
  ({
     redrive_date = redrive_date_;
     redrive_count = redrive_count_;
     state_machine_alias_arn = state_machine_alias_arn_;
     state_machine_version_arn = state_machine_version_arn_;
     item_count = item_count_;
     map_run_arn = map_run_arn_;
     stop_date = stop_date_;
     start_date = start_date_;
     status = status_;
     name = name_;
     state_machine_arn = state_machine_arn_;
     execution_arn = execution_arn_
   } : execution_list_item)
let make_list_executions_output
  ?next_token:(next_token_ : list_executions_page_token option)
  ~executions:(executions_ : execution_list) () =
  ({ next_token = next_token_; executions = executions_ } : list_executions_output)
let make_list_executions_input
  ?redrive_filter:(redrive_filter_ : execution_redrive_filter option)
  ?map_run_arn:(map_run_arn_ : long_arn option)
  ?next_token:(next_token_ : list_executions_page_token option)
  ?max_results:(max_results_ : page_size option)
  ?status_filter:(status_filter_ : execution_status option)
  ?state_machine_arn:(state_machine_arn_ : arn option) () =
  ({
     redrive_filter = redrive_filter_;
     map_run_arn = map_run_arn_;
     next_token = next_token_;
     max_results = max_results_;
     status_filter = status_filter_;
     state_machine_arn = state_machine_arn_
   } : list_executions_input)
let make_activity_list_item ~creation_date:(creation_date_ : timestamp)
  ~name:(name_ : name) ~activity_arn:(activity_arn_ : arn) () =
  ({
     creation_date = creation_date_;
     name = name_;
     activity_arn = activity_arn_
   } : activity_list_item)
let make_list_activities_output ?next_token:(next_token_ : page_token option)
  ~activities:(activities_ : activity_list) () =
  ({ next_token = next_token_; activities = activities_ } : list_activities_output)
let make_list_activities_input ?next_token:(next_token_ : page_token option)
  ?max_results:(max_results_ : page_size option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_activities_input)
let make_lambda_function_timed_out_event_details
  ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option) () =
  ({ cause = cause_; error = error_ } : lambda_function_timed_out_event_details)
let make_lambda_function_succeeded_event_details
  ?output_details:(output_details_ :
                    history_event_execution_data_details option)
  ?output:(output_ : sensitive_data option) () =
  ({ output_details = output_details_; output = output_ } : lambda_function_succeeded_event_details)
let make_lambda_function_start_failed_event_details
  ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option) () =
  ({ cause = cause_; error = error_ } : lambda_function_start_failed_event_details)
let make_lambda_function_scheduled_event_details
  ?task_credentials:(task_credentials_ : task_credentials option)
  ?timeout_in_seconds:(timeout_in_seconds_ : timeout_in_seconds option)
  ?input_details:(input_details_ :
                   history_event_execution_data_details option)
  ?input:(input_ : sensitive_data option) ~resource:(resource_ : arn) () =
  ({
     task_credentials = task_credentials_;
     timeout_in_seconds = timeout_in_seconds_;
     input_details = input_details_;
     input = input_;
     resource = resource_
   } : lambda_function_scheduled_event_details)
let make_lambda_function_schedule_failed_event_details
  ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option) () =
  ({ cause = cause_; error = error_ } : lambda_function_schedule_failed_event_details)
let make_lambda_function_failed_event_details
  ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option) () =
  ({ cause = cause_; error = error_ } : lambda_function_failed_event_details)
let make_activity_failed_event_details
  ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option) () =
  ({ cause = cause_; error = error_ } : activity_failed_event_details)
let make_activity_schedule_failed_event_details
  ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option) () =
  ({ cause = cause_; error = error_ } : activity_schedule_failed_event_details)
let make_activity_scheduled_event_details
  ?heartbeat_in_seconds:(heartbeat_in_seconds_ : timeout_in_seconds option)
  ?timeout_in_seconds:(timeout_in_seconds_ : timeout_in_seconds option)
  ?input_details:(input_details_ :
                   history_event_execution_data_details option)
  ?input:(input_ : sensitive_data option) ~resource:(resource_ : arn) () =
  ({
     heartbeat_in_seconds = heartbeat_in_seconds_;
     timeout_in_seconds = timeout_in_seconds_;
     input_details = input_details_;
     input = input_;
     resource = resource_
   } : activity_scheduled_event_details)
let make_activity_started_event_details
  ?worker_name:(worker_name_ : identity option) () =
  ({ worker_name = worker_name_ } : activity_started_event_details)
let make_activity_succeeded_event_details
  ?output_details:(output_details_ :
                    history_event_execution_data_details option)
  ?output:(output_ : sensitive_data option) () =
  ({ output_details = output_details_; output = output_ } : activity_succeeded_event_details)
let make_activity_timed_out_event_details
  ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option) () =
  ({ cause = cause_; error = error_ } : activity_timed_out_event_details)
let make_execution_failed_event_details
  ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option) () =
  ({ cause = cause_; error = error_ } : execution_failed_event_details)
let make_execution_started_event_details
  ?state_machine_version_arn:(state_machine_version_arn_ : arn option)
  ?state_machine_alias_arn:(state_machine_alias_arn_ : arn option)
  ?role_arn:(role_arn_ : arn option)
  ?input_details:(input_details_ :
                   history_event_execution_data_details option)
  ?input:(input_ : sensitive_data option) () =
  ({
     state_machine_version_arn = state_machine_version_arn_;
     state_machine_alias_arn = state_machine_alias_arn_;
     role_arn = role_arn_;
     input_details = input_details_;
     input = input_
   } : execution_started_event_details)
let make_execution_succeeded_event_details
  ?output_details:(output_details_ :
                    history_event_execution_data_details option)
  ?output:(output_ : sensitive_data option) () =
  ({ output_details = output_details_; output = output_ } : execution_succeeded_event_details)
let make_execution_aborted_event_details
  ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option) () =
  ({ cause = cause_; error = error_ } : execution_aborted_event_details)
let make_execution_timed_out_event_details
  ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option) () =
  ({ cause = cause_; error = error_ } : execution_timed_out_event_details)
let make_execution_redriven_event_details
  ?redrive_count:(redrive_count_ : redrive_count option) () =
  ({ redrive_count = redrive_count_ } : execution_redriven_event_details)
let make_evaluation_failed_event_details
  ?location:(location_ : evaluation_failure_location option)
  ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option) ~state:(state_ : state_name) () =
  ({ state = state_; location = location_; cause = cause_; error = error_ } : 
  evaluation_failed_event_details)
let make_history_event
  ?evaluation_failed_event_details:(evaluation_failed_event_details_ :
                                     evaluation_failed_event_details option)
  ?map_run_redriven_event_details:(map_run_redriven_event_details_ :
                                    map_run_redriven_event_details option)
  ?map_run_failed_event_details:(map_run_failed_event_details_ :
                                  map_run_failed_event_details option)
  ?map_run_started_event_details:(map_run_started_event_details_ :
                                   map_run_started_event_details option)
  ?state_exited_event_details:(state_exited_event_details_ :
                                state_exited_event_details option)
  ?state_entered_event_details:(state_entered_event_details_ :
                                 state_entered_event_details option)
  ?lambda_function_timed_out_event_details:(lambda_function_timed_out_event_details_
                                             :
                                             lambda_function_timed_out_event_details
                                               option)
  ?lambda_function_succeeded_event_details:(lambda_function_succeeded_event_details_
                                             :
                                             lambda_function_succeeded_event_details
                                               option)
  ?lambda_function_start_failed_event_details:(lambda_function_start_failed_event_details_
                                                :
                                                lambda_function_start_failed_event_details
                                                  option)
  ?lambda_function_scheduled_event_details:(lambda_function_scheduled_event_details_
                                             :
                                             lambda_function_scheduled_event_details
                                               option)
  ?lambda_function_schedule_failed_event_details:(lambda_function_schedule_failed_event_details_
                                                   :
                                                   lambda_function_schedule_failed_event_details
                                                     option)
  ?lambda_function_failed_event_details:(lambda_function_failed_event_details_
                                          :
                                          lambda_function_failed_event_details
                                            option)
  ?map_iteration_aborted_event_details:(map_iteration_aborted_event_details_
                                         :
                                         map_iteration_event_details option)
  ?map_iteration_failed_event_details:(map_iteration_failed_event_details_ :
                                        map_iteration_event_details option)
  ?map_iteration_succeeded_event_details:(map_iteration_succeeded_event_details_
                                           :
                                           map_iteration_event_details option)
  ?map_iteration_started_event_details:(map_iteration_started_event_details_
                                         :
                                         map_iteration_event_details option)
  ?map_state_started_event_details:(map_state_started_event_details_ :
                                     map_state_started_event_details option)
  ?execution_redriven_event_details:(execution_redriven_event_details_ :
                                      execution_redriven_event_details option)
  ?execution_timed_out_event_details:(execution_timed_out_event_details_ :
                                       execution_timed_out_event_details
                                         option)
  ?execution_aborted_event_details:(execution_aborted_event_details_ :
                                     execution_aborted_event_details option)
  ?execution_succeeded_event_details:(execution_succeeded_event_details_ :
                                       execution_succeeded_event_details
                                         option)
  ?execution_started_event_details:(execution_started_event_details_ :
                                     execution_started_event_details option)
  ?execution_failed_event_details:(execution_failed_event_details_ :
                                    execution_failed_event_details option)
  ?task_timed_out_event_details:(task_timed_out_event_details_ :
                                  task_timed_out_event_details option)
  ?task_succeeded_event_details:(task_succeeded_event_details_ :
                                  task_succeeded_event_details option)
  ?task_submitted_event_details:(task_submitted_event_details_ :
                                  task_submitted_event_details option)
  ?task_submit_failed_event_details:(task_submit_failed_event_details_ :
                                      task_submit_failed_event_details option)
  ?task_started_event_details:(task_started_event_details_ :
                                task_started_event_details option)
  ?task_start_failed_event_details:(task_start_failed_event_details_ :
                                     task_start_failed_event_details option)
  ?task_scheduled_event_details:(task_scheduled_event_details_ :
                                  task_scheduled_event_details option)
  ?task_failed_event_details:(task_failed_event_details_ :
                               task_failed_event_details option)
  ?activity_timed_out_event_details:(activity_timed_out_event_details_ :
                                      activity_timed_out_event_details option)
  ?activity_succeeded_event_details:(activity_succeeded_event_details_ :
                                      activity_succeeded_event_details option)
  ?activity_started_event_details:(activity_started_event_details_ :
                                    activity_started_event_details option)
  ?activity_scheduled_event_details:(activity_scheduled_event_details_ :
                                      activity_scheduled_event_details option)
  ?activity_schedule_failed_event_details:(activity_schedule_failed_event_details_
                                            :
                                            activity_schedule_failed_event_details
                                              option)
  ?activity_failed_event_details:(activity_failed_event_details_ :
                                   activity_failed_event_details option)
  ?previous_event_id:(previous_event_id_ : event_id option)
  ~id:(id_ : event_id) ~type_:(type__ : history_event_type)
  ~timestamp:(timestamp_ : timestamp) () =
  ({
     evaluation_failed_event_details = evaluation_failed_event_details_;
     map_run_redriven_event_details = map_run_redriven_event_details_;
     map_run_failed_event_details = map_run_failed_event_details_;
     map_run_started_event_details = map_run_started_event_details_;
     state_exited_event_details = state_exited_event_details_;
     state_entered_event_details = state_entered_event_details_;
     lambda_function_timed_out_event_details =
       lambda_function_timed_out_event_details_;
     lambda_function_succeeded_event_details =
       lambda_function_succeeded_event_details_;
     lambda_function_start_failed_event_details =
       lambda_function_start_failed_event_details_;
     lambda_function_scheduled_event_details =
       lambda_function_scheduled_event_details_;
     lambda_function_schedule_failed_event_details =
       lambda_function_schedule_failed_event_details_;
     lambda_function_failed_event_details =
       lambda_function_failed_event_details_;
     map_iteration_aborted_event_details =
       map_iteration_aborted_event_details_;
     map_iteration_failed_event_details = map_iteration_failed_event_details_;
     map_iteration_succeeded_event_details =
       map_iteration_succeeded_event_details_;
     map_iteration_started_event_details =
       map_iteration_started_event_details_;
     map_state_started_event_details = map_state_started_event_details_;
     execution_redriven_event_details = execution_redriven_event_details_;
     execution_timed_out_event_details = execution_timed_out_event_details_;
     execution_aborted_event_details = execution_aborted_event_details_;
     execution_succeeded_event_details = execution_succeeded_event_details_;
     execution_started_event_details = execution_started_event_details_;
     execution_failed_event_details = execution_failed_event_details_;
     task_timed_out_event_details = task_timed_out_event_details_;
     task_succeeded_event_details = task_succeeded_event_details_;
     task_submitted_event_details = task_submitted_event_details_;
     task_submit_failed_event_details = task_submit_failed_event_details_;
     task_started_event_details = task_started_event_details_;
     task_start_failed_event_details = task_start_failed_event_details_;
     task_scheduled_event_details = task_scheduled_event_details_;
     task_failed_event_details = task_failed_event_details_;
     activity_timed_out_event_details = activity_timed_out_event_details_;
     activity_succeeded_event_details = activity_succeeded_event_details_;
     activity_started_event_details = activity_started_event_details_;
     activity_scheduled_event_details = activity_scheduled_event_details_;
     activity_schedule_failed_event_details =
       activity_schedule_failed_event_details_;
     activity_failed_event_details = activity_failed_event_details_;
     previous_event_id = previous_event_id_;
     id = id_;
     type_ = type__;
     timestamp = timestamp_
   } : history_event)
let make_get_execution_history_output
  ?next_token:(next_token_ : page_token option)
  ~events:(events_ : history_event_list) () =
  ({ next_token = next_token_; events = events_ } : get_execution_history_output)
let make_get_execution_history_input
  ?include_execution_data:(include_execution_data_ :
                            include_execution_data_get_execution_history
                              option)
  ?next_token:(next_token_ : page_token option)
  ?reverse_order:(reverse_order_ : reverse_order option)
  ?max_results:(max_results_ : page_size option)
  ~execution_arn:(execution_arn_ : arn) () =
  ({
     include_execution_data = include_execution_data_;
     next_token = next_token_;
     reverse_order = reverse_order_;
     max_results = max_results_;
     execution_arn = execution_arn_
   } : get_execution_history_input)
let make_get_activity_task_output
  ?input:(input_ : sensitive_data_job_input option)
  ?task_token:(task_token_ : task_token option) () =
  ({ input = input_; task_token = task_token_ } : get_activity_task_output)
let make_get_activity_task_input ?worker_name:(worker_name_ : name option)
  ~activity_arn:(activity_arn_ : arn) () =
  ({ worker_name = worker_name_; activity_arn = activity_arn_ } : get_activity_task_input)
let make_describe_state_machine_output
  ?variable_references:(variable_references_ : variable_references option)
  ?encryption_configuration:(encryption_configuration_ :
                              encryption_configuration option)
  ?description:(description_ : version_description option)
  ?revision_id:(revision_id_ : revision_id option)
  ?label:(label_ : map_run_label option)
  ?tracing_configuration:(tracing_configuration_ :
                           tracing_configuration option)
  ?logging_configuration:(logging_configuration_ :
                           logging_configuration option)
  ?status:(status_ : state_machine_status option)
  ~creation_date:(creation_date_ : timestamp)
  ~type_:(type__ : state_machine_type) ~role_arn:(role_arn_ : arn)
  ~definition:(definition_ : definition) ~name:(name_ : name)
  ~state_machine_arn:(state_machine_arn_ : arn) () =
  ({
     variable_references = variable_references_;
     encryption_configuration = encryption_configuration_;
     description = description_;
     revision_id = revision_id_;
     label = label_;
     tracing_configuration = tracing_configuration_;
     logging_configuration = logging_configuration_;
     creation_date = creation_date_;
     type_ = type__;
     role_arn = role_arn_;
     definition = definition_;
     status = status_;
     name = name_;
     state_machine_arn = state_machine_arn_
   } : describe_state_machine_output)
let make_describe_state_machine_input
  ?included_data:(included_data_ : included_data option)
  ~state_machine_arn:(state_machine_arn_ : arn) () =
  ({ included_data = included_data_; state_machine_arn = state_machine_arn_ } : 
  describe_state_machine_input)
let make_describe_state_machine_for_execution_output
  ?variable_references:(variable_references_ : variable_references option)
  ?encryption_configuration:(encryption_configuration_ :
                              encryption_configuration option)
  ?revision_id:(revision_id_ : revision_id option)
  ?label:(label_ : map_run_label option)
  ?map_run_arn:(map_run_arn_ : long_arn option)
  ?tracing_configuration:(tracing_configuration_ :
                           tracing_configuration option)
  ?logging_configuration:(logging_configuration_ :
                           logging_configuration option)
  ~update_date:(update_date_ : timestamp) ~role_arn:(role_arn_ : arn)
  ~definition:(definition_ : definition) ~name:(name_ : name)
  ~state_machine_arn:(state_machine_arn_ : arn) () =
  ({
     variable_references = variable_references_;
     encryption_configuration = encryption_configuration_;
     revision_id = revision_id_;
     label = label_;
     map_run_arn = map_run_arn_;
     tracing_configuration = tracing_configuration_;
     logging_configuration = logging_configuration_;
     update_date = update_date_;
     role_arn = role_arn_;
     definition = definition_;
     name = name_;
     state_machine_arn = state_machine_arn_
   } : describe_state_machine_for_execution_output)
let make_describe_state_machine_for_execution_input
  ?included_data:(included_data_ : included_data option)
  ~execution_arn:(execution_arn_ : arn) () =
  ({ included_data = included_data_; execution_arn = execution_arn_ } : 
  describe_state_machine_for_execution_input)
let make_describe_state_machine_alias_output
  ?update_date:(update_date_ : timestamp option)
  ?creation_date:(creation_date_ : timestamp option)
  ?routing_configuration:(routing_configuration_ :
                           routing_configuration_list option)
  ?description:(description_ : alias_description option)
  ?name:(name_ : name option)
  ?state_machine_alias_arn:(state_machine_alias_arn_ : arn option) () =
  ({
     update_date = update_date_;
     creation_date = creation_date_;
     routing_configuration = routing_configuration_;
     description = description_;
     name = name_;
     state_machine_alias_arn = state_machine_alias_arn_
   } : describe_state_machine_alias_output)
let make_describe_state_machine_alias_input
  ~state_machine_alias_arn:(state_machine_alias_arn_ : arn) () =
  ({ state_machine_alias_arn = state_machine_alias_arn_ } : describe_state_machine_alias_input)
let make_describe_map_run_output
  ?redrive_date:(redrive_date_ : timestamp option)
  ?redrive_count:(redrive_count_ : redrive_count option)
  ?stop_date:(stop_date_ : timestamp option)
  ~execution_counts:(execution_counts_ : map_run_execution_counts)
  ~item_counts:(item_counts_ : map_run_item_counts)
  ~tolerated_failure_count:(tolerated_failure_count_ :
                             tolerated_failure_count)
  ~tolerated_failure_percentage:(tolerated_failure_percentage_ :
                                  tolerated_failure_percentage)
  ~max_concurrency:(max_concurrency_ : max_concurrency)
  ~start_date:(start_date_ : timestamp) ~status:(status_ : map_run_status)
  ~execution_arn:(execution_arn_ : arn)
  ~map_run_arn:(map_run_arn_ : long_arn) () =
  ({
     redrive_date = redrive_date_;
     redrive_count = redrive_count_;
     execution_counts = execution_counts_;
     item_counts = item_counts_;
     tolerated_failure_count = tolerated_failure_count_;
     tolerated_failure_percentage = tolerated_failure_percentage_;
     max_concurrency = max_concurrency_;
     stop_date = stop_date_;
     start_date = start_date_;
     status = status_;
     execution_arn = execution_arn_;
     map_run_arn = map_run_arn_
   } : describe_map_run_output)
let make_describe_map_run_input ~map_run_arn:(map_run_arn_ : long_arn) () =
  ({ map_run_arn = map_run_arn_ } : describe_map_run_input)
let make_describe_execution_output
  ?redrive_status_reason:(redrive_status_reason_ : sensitive_data option)
  ?redrive_status:(redrive_status_ : execution_redrive_status option)
  ?redrive_date:(redrive_date_ : timestamp option)
  ?redrive_count:(redrive_count_ : redrive_count option)
  ?state_machine_alias_arn:(state_machine_alias_arn_ : arn option)
  ?state_machine_version_arn:(state_machine_version_arn_ : arn option)
  ?cause:(cause_ : sensitive_cause option)
  ?error:(error_ : sensitive_error option)
  ?map_run_arn:(map_run_arn_ : long_arn option)
  ?trace_header:(trace_header_ : trace_header option)
  ?output_details:(output_details_ :
                    cloud_watch_events_execution_data_details option)
  ?output:(output_ : sensitive_data option)
  ?input_details:(input_details_ :
                   cloud_watch_events_execution_data_details option)
  ?input:(input_ : sensitive_data option)
  ?stop_date:(stop_date_ : timestamp option) ?name:(name_ : name option)
  ~start_date:(start_date_ : timestamp) ~status:(status_ : execution_status)
  ~state_machine_arn:(state_machine_arn_ : arn)
  ~execution_arn:(execution_arn_ : arn) () =
  ({
     redrive_status_reason = redrive_status_reason_;
     redrive_status = redrive_status_;
     redrive_date = redrive_date_;
     redrive_count = redrive_count_;
     state_machine_alias_arn = state_machine_alias_arn_;
     state_machine_version_arn = state_machine_version_arn_;
     cause = cause_;
     error = error_;
     map_run_arn = map_run_arn_;
     trace_header = trace_header_;
     output_details = output_details_;
     output = output_;
     input_details = input_details_;
     input = input_;
     stop_date = stop_date_;
     start_date = start_date_;
     status = status_;
     name = name_;
     state_machine_arn = state_machine_arn_;
     execution_arn = execution_arn_
   } : describe_execution_output)
let make_describe_execution_input
  ?included_data:(included_data_ : included_data option)
  ~execution_arn:(execution_arn_ : arn) () =
  ({ included_data = included_data_; execution_arn = execution_arn_ } : 
  describe_execution_input)
let make_describe_activity_output
  ?encryption_configuration:(encryption_configuration_ :
                              encryption_configuration option)
  ~creation_date:(creation_date_ : timestamp) ~name:(name_ : name)
  ~activity_arn:(activity_arn_ : arn) () =
  ({
     encryption_configuration = encryption_configuration_;
     creation_date = creation_date_;
     name = name_;
     activity_arn = activity_arn_
   } : describe_activity_output)
let make_describe_activity_input ~activity_arn:(activity_arn_ : arn) () =
  ({ activity_arn = activity_arn_ } : describe_activity_input)
let make_delete_state_machine_version_output () = (() : unit)
let make_delete_state_machine_version_input
  ~state_machine_version_arn:(state_machine_version_arn_ : long_arn) () =
  ({ state_machine_version_arn = state_machine_version_arn_ } : delete_state_machine_version_input)
let make_delete_state_machine_output () = (() : unit)
let make_delete_state_machine_input
  ~state_machine_arn:(state_machine_arn_ : arn) () =
  ({ state_machine_arn = state_machine_arn_ } : delete_state_machine_input)
let make_delete_state_machine_alias_output () = (() : unit)
let make_delete_state_machine_alias_input
  ~state_machine_alias_arn:(state_machine_alias_arn_ : arn) () =
  ({ state_machine_alias_arn = state_machine_alias_arn_ } : delete_state_machine_alias_input)
let make_delete_activity_output () = (() : unit)
let make_delete_activity_input ~activity_arn:(activity_arn_ : arn) () =
  ({ activity_arn = activity_arn_ } : delete_activity_input)
let make_create_state_machine_output
  ?state_machine_version_arn:(state_machine_version_arn_ : arn option)
  ~creation_date:(creation_date_ : timestamp)
  ~state_machine_arn:(state_machine_arn_ : arn) () =
  ({
     state_machine_version_arn = state_machine_version_arn_;
     creation_date = creation_date_;
     state_machine_arn = state_machine_arn_
   } : create_state_machine_output)
let make_create_state_machine_input
  ?encryption_configuration:(encryption_configuration_ :
                              encryption_configuration option)
  ?version_description:(version_description_ : version_description option)
  ?publish:(publish_ : publish option)
  ?tracing_configuration:(tracing_configuration_ :
                           tracing_configuration option)
  ?tags:(tags_ : tag_list option)
  ?logging_configuration:(logging_configuration_ :
                           logging_configuration option)
  ?type_:(type__ : state_machine_type option) ~role_arn:(role_arn_ : arn)
  ~definition:(definition_ : definition) ~name:(name_ : name) () =
  ({
     encryption_configuration = encryption_configuration_;
     version_description = version_description_;
     publish = publish_;
     tracing_configuration = tracing_configuration_;
     tags = tags_;
     logging_configuration = logging_configuration_;
     type_ = type__;
     role_arn = role_arn_;
     definition = definition_;
     name = name_
   } : create_state_machine_input)
let make_create_state_machine_alias_output
  ~creation_date:(creation_date_ : timestamp)
  ~state_machine_alias_arn:(state_machine_alias_arn_ : arn) () =
  ({
     creation_date = creation_date_;
     state_machine_alias_arn = state_machine_alias_arn_
   } : create_state_machine_alias_output)
let make_create_state_machine_alias_input
  ?description:(description_ : alias_description option)
  ~routing_configuration:(routing_configuration_ :
                           routing_configuration_list)
  ~name:(name_ : character_restricted_name) () =
  ({
     routing_configuration = routing_configuration_;
     name = name_;
     description = description_
   } : create_state_machine_alias_input)
let make_create_activity_output ~creation_date:(creation_date_ : timestamp)
  ~activity_arn:(activity_arn_ : arn) () =
  ({ creation_date = creation_date_; activity_arn = activity_arn_ } : 
  create_activity_output)
let make_create_activity_input
  ?encryption_configuration:(encryption_configuration_ :
                              encryption_configuration option)
  ?tags:(tags_ : tag_list option) ~name:(name_ : name) () =
  ({
     encryption_configuration = encryption_configuration_;
     tags = tags_;
     name = name_
   } : create_activity_input)