open Smaws_Lib
open Types
let make_validate_state_machine_definition_diagnostic
  ?location:(location_ : string option) ~message:(message_ : string)
  ~code:(code_ : string)
  ~severity:(severity_ : validate_state_machine_definition_severity) () =
  ({
     location = location_;
     message = message_;
     code = code_;
     severity = severity_
   } : validate_state_machine_definition_diagnostic)
let make_validate_state_machine_definition_output
  ?truncated:(truncated_ : bool option)
  ~diagnostics:(diagnostics_ :
                 validate_state_machine_definition_diagnostic list)
  ~result:(result_ : validate_state_machine_definition_result_code) () =
  ({ truncated = truncated_; diagnostics = diagnostics_; result = result_ } : 
  validate_state_machine_definition_output)
let make_validate_state_machine_definition_input
  ?max_results:(max_results_ : int option)
  ?severity:(severity_ : validate_state_machine_definition_severity option)
  ?type_:(type__ : state_machine_type option)
  ~definition:(definition_ : string) () =
  ({
     max_results = max_results_;
     severity = severity_;
     type_ = type__;
     definition = definition_
   } : validate_state_machine_definition_input)
let make_update_state_machine_output
  ?state_machine_version_arn:(state_machine_version_arn_ : string option)
  ?revision_id:(revision_id_ : string option)
  ~update_date:(update_date_ : CoreTypes.Timestamp.t) () =
  ({
     state_machine_version_arn = state_machine_version_arn_;
     revision_id = revision_id_;
     update_date = update_date_
   } : update_state_machine_output)
let make_cloud_watch_logs_log_group
  ?log_group_arn:(log_group_arn_ : string option) () =
  ({ log_group_arn = log_group_arn_ } : cloud_watch_logs_log_group)
let make_log_destination
  ?cloud_watch_logs_log_group:(cloud_watch_logs_log_group_ :
                                cloud_watch_logs_log_group option)
  () =
  ({ cloud_watch_logs_log_group = cloud_watch_logs_log_group_ } : log_destination)
let make_logging_configuration
  ?destinations:(destinations_ : log_destination list option)
  ?include_execution_data:(include_execution_data_ : bool option)
  ?level:(level_ : log_level option) () =
  ({
     destinations = destinations_;
     include_execution_data = include_execution_data_;
     level = level_
   } : logging_configuration)
let make_tracing_configuration ?enabled:(enabled_ : bool option) () =
  ({ enabled = enabled_ } : tracing_configuration)
let make_encryption_configuration
  ?kms_data_key_reuse_period_seconds:(kms_data_key_reuse_period_seconds_ :
                                       int option)
  ?kms_key_id:(kms_key_id_ : string option) ~type_:(type__ : encryption_type)
  () =
  ({
     type_ = type__;
     kms_data_key_reuse_period_seconds = kms_data_key_reuse_period_seconds_;
     kms_key_id = kms_key_id_
   } : encryption_configuration)
let make_update_state_machine_input
  ?encryption_configuration:(encryption_configuration_ :
                              encryption_configuration option)
  ?version_description:(version_description_ : string option)
  ?publish:(publish_ : bool option)
  ?tracing_configuration:(tracing_configuration_ :
                           tracing_configuration option)
  ?logging_configuration:(logging_configuration_ :
                           logging_configuration option)
  ?role_arn:(role_arn_ : string option)
  ?definition:(definition_ : string option)
  ~state_machine_arn:(state_machine_arn_ : string) () =
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
  ~update_date:(update_date_ : CoreTypes.Timestamp.t) () =
  ({ update_date = update_date_ } : update_state_machine_alias_output)
let make_routing_configuration_list_item ~weight:(weight_ : int)
  ~state_machine_version_arn:(state_machine_version_arn_ : string) () =
  ({ weight = weight_; state_machine_version_arn = state_machine_version_arn_
   } : routing_configuration_list_item)
let make_update_state_machine_alias_input
  ?routing_configuration:(routing_configuration_ :
                           routing_configuration_list_item list option)
  ?description:(description_ : string option)
  ~state_machine_alias_arn:(state_machine_alias_arn_ : string) () =
  ({
     routing_configuration = routing_configuration_;
     description = description_;
     state_machine_alias_arn = state_machine_alias_arn_
   } : update_state_machine_alias_input)
let make_update_map_run_output () = (() : unit)
let make_update_map_run_input
  ?tolerated_failure_count:(tolerated_failure_count_ : int option)
  ?tolerated_failure_percentage:(tolerated_failure_percentage_ :
                                  float option)
  ?max_concurrency:(max_concurrency_ : int option)
  ~map_run_arn:(map_run_arn_ : string) () =
  ({
     tolerated_failure_count = tolerated_failure_count_;
     tolerated_failure_percentage = tolerated_failure_percentage_;
     max_concurrency = max_concurrency_;
     map_run_arn = map_run_arn_
   } : update_map_run_input)
let make_untag_resource_output () = (() : unit)
let make_untag_resource_input ~tag_keys:(tag_keys_ : string list)
  ~resource_arn:(resource_arn_ : string) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_input)
let make_inspection_data_request ?body:(body_ : string option)
  ?headers:(headers_ : string option) ?url:(url_ : string option)
  ?method_:(method__ : string option) ?protocol:(protocol_ : string option)
  () =
  ({
     body = body_;
     headers = headers_;
     url = url_;
     method_ = method__;
     protocol = protocol_
   } : inspection_data_request)
let make_inspection_data_response ?body:(body_ : string option)
  ?headers:(headers_ : string option)
  ?status_message:(status_message_ : string option)
  ?status_code:(status_code_ : string option)
  ?protocol:(protocol_ : string option) () =
  ({
     body = body_;
     headers = headers_;
     status_message = status_message_;
     status_code = status_code_;
     protocol = protocol_
   } : inspection_data_response)
let make_inspection_data ?variables:(variables_ : string option)
  ?response:(response_ : inspection_data_response option)
  ?request:(request_ : inspection_data_request option)
  ?after_result_path:(after_result_path_ : string option)
  ?after_result_selector:(after_result_selector_ : string option)
  ?result:(result_ : string option)
  ?after_parameters:(after_parameters_ : string option)
  ?after_input_path:(after_input_path_ : string option)
  ?after_arguments:(after_arguments_ : string option)
  ?input:(input_ : string option) () =
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
  ?next_state:(next_state_ : string option)
  ?inspection_data:(inspection_data_ : inspection_data option)
  ?cause:(cause_ : string option) ?error:(error_ : string option)
  ?output:(output_ : string option) () =
  ({
     status = status_;
     next_state = next_state_;
     inspection_data = inspection_data_;
     cause = cause_;
     error = error_;
     output = output_
   } : test_state_output)
let make_test_state_input ?variables:(variables_ : string option)
  ?reveal_secrets:(reveal_secrets_ : bool option)
  ?inspection_level:(inspection_level_ : inspection_level option)
  ?input:(input_ : string option) ?role_arn:(role_arn_ : string option)
  ~definition:(definition_ : string) () =
  ({
     variables = variables_;
     reveal_secrets = reveal_secrets_;
     inspection_level = inspection_level_;
     input = input_;
     role_arn = role_arn_;
     definition = definition_
   } : test_state_input)
let make_task_timed_out_event_details ?cause:(cause_ : string option)
  ?error:(error_ : string option) ~resource:(resource_ : string)
  ~resource_type:(resource_type_ : string) () =
  ({
     cause = cause_;
     error = error_;
     resource = resource_;
     resource_type = resource_type_
   } : task_timed_out_event_details)
let make_history_event_execution_data_details
  ?truncated:(truncated_ : bool option) () =
  ({ truncated = truncated_ } : history_event_execution_data_details)
let make_task_succeeded_event_details
  ?output_details:(output_details_ :
                    history_event_execution_data_details option)
  ?output:(output_ : string option) ~resource:(resource_ : string)
  ~resource_type:(resource_type_ : string) () =
  ({
     output_details = output_details_;
     output = output_;
     resource = resource_;
     resource_type = resource_type_
   } : task_succeeded_event_details)
let make_task_submitted_event_details
  ?output_details:(output_details_ :
                    history_event_execution_data_details option)
  ?output:(output_ : string option) ~resource:(resource_ : string)
  ~resource_type:(resource_type_ : string) () =
  ({
     output_details = output_details_;
     output = output_;
     resource = resource_;
     resource_type = resource_type_
   } : task_submitted_event_details)
let make_task_submit_failed_event_details ?cause:(cause_ : string option)
  ?error:(error_ : string option) ~resource:(resource_ : string)
  ~resource_type:(resource_type_ : string) () =
  ({
     cause = cause_;
     error = error_;
     resource = resource_;
     resource_type = resource_type_
   } : task_submit_failed_event_details)
let make_task_started_event_details ~resource:(resource_ : string)
  ~resource_type:(resource_type_ : string) () =
  ({ resource = resource_; resource_type = resource_type_ } : task_started_event_details)
let make_task_start_failed_event_details ?cause:(cause_ : string option)
  ?error:(error_ : string option) ~resource:(resource_ : string)
  ~resource_type:(resource_type_ : string) () =
  ({
     cause = cause_;
     error = error_;
     resource = resource_;
     resource_type = resource_type_
   } : task_start_failed_event_details)
let make_task_credentials ?role_arn:(role_arn_ : string option) () =
  ({ role_arn = role_arn_ } : task_credentials)
let make_task_scheduled_event_details
  ?task_credentials:(task_credentials_ : task_credentials option)
  ?heartbeat_in_seconds:(heartbeat_in_seconds_ : int option)
  ?timeout_in_seconds:(timeout_in_seconds_ : int option)
  ~parameters:(parameters_ : string) ~region:(region_ : string)
  ~resource:(resource_ : string) ~resource_type:(resource_type_ : string) ()
  =
  ({
     task_credentials = task_credentials_;
     heartbeat_in_seconds = heartbeat_in_seconds_;
     timeout_in_seconds = timeout_in_seconds_;
     parameters = parameters_;
     region = region_;
     resource = resource_;
     resource_type = resource_type_
   } : task_scheduled_event_details)
let make_task_failed_event_details ?cause:(cause_ : string option)
  ?error:(error_ : string option) ~resource:(resource_ : string)
  ~resource_type:(resource_type_ : string) () =
  ({
     cause = cause_;
     error = error_;
     resource = resource_;
     resource_type = resource_type_
   } : task_failed_event_details)
let make_tag_resource_output () = (() : unit)
let make_tag ?value:(value_ : string option) ?key:(key_ : string option) () =
  ({ value = value_; key = key_ } : tag)
let make_tag_resource_input ~tags:(tags_ : tag list)
  ~resource_arn:(resource_arn_ : string) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_input)
let make_stop_execution_output
  ~stop_date:(stop_date_ : CoreTypes.Timestamp.t) () =
  ({ stop_date = stop_date_ } : stop_execution_output)
let make_stop_execution_input ?cause:(cause_ : string option)
  ?error:(error_ : string option) ~execution_arn:(execution_arn_ : string) ()
  =
  ({ cause = cause_; error = error_; execution_arn = execution_arn_ } : 
  stop_execution_input)
let make_state_machine_version_list_item
  ~creation_date:(creation_date_ : CoreTypes.Timestamp.t)
  ~state_machine_version_arn:(state_machine_version_arn_ : string) () =
  ({
     creation_date = creation_date_;
     state_machine_version_arn = state_machine_version_arn_
   } : state_machine_version_list_item)
let make_state_machine_list_item
  ~creation_date:(creation_date_ : CoreTypes.Timestamp.t)
  ~type_:(type__ : state_machine_type) ~name:(name_ : string)
  ~state_machine_arn:(state_machine_arn_ : string) () =
  ({
     creation_date = creation_date_;
     type_ = type__;
     name = name_;
     state_machine_arn = state_machine_arn_
   } : state_machine_list_item)
let make_state_machine_alias_list_item
  ~creation_date:(creation_date_ : CoreTypes.Timestamp.t)
  ~state_machine_alias_arn:(state_machine_alias_arn_ : string) () =
  ({
     creation_date = creation_date_;
     state_machine_alias_arn = state_machine_alias_arn_
   } : state_machine_alias_list_item)
let make_assigned_variables_details ?truncated:(truncated_ : bool option) ()
  = ({ truncated = truncated_ } : assigned_variables_details)
let make_state_exited_event_details
  ?assigned_variables_details:(assigned_variables_details_ :
                                assigned_variables_details option)
  ?assigned_variables:(assigned_variables_ : assigned_variables option)
  ?output_details:(output_details_ :
                    history_event_execution_data_details option)
  ?output:(output_ : string option) ~name:(name_ : string) () =
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
  ?input:(input_ : string option) ~name:(name_ : string) () =
  ({ input_details = input_details_; input = input_; name = name_ } : 
  state_entered_event_details)
let make_cloud_watch_events_execution_data_details
  ?included:(included_ : bool option) () =
  ({ included = included_ } : cloud_watch_events_execution_data_details)
let make_billing_details
  ?billed_duration_in_milliseconds:(billed_duration_in_milliseconds_ :
                                     int option)
  ?billed_memory_used_in_m_b:(billed_memory_used_in_m_b_ : int option) () =
  ({
     billed_duration_in_milliseconds = billed_duration_in_milliseconds_;
     billed_memory_used_in_m_b = billed_memory_used_in_m_b_
   } : billing_details)
let make_start_sync_execution_output
  ?billing_details:(billing_details_ : billing_details option)
  ?trace_header:(trace_header_ : string option)
  ?output_details:(output_details_ :
                    cloud_watch_events_execution_data_details option)
  ?output:(output_ : string option)
  ?input_details:(input_details_ :
                   cloud_watch_events_execution_data_details option)
  ?input:(input_ : string option) ?cause:(cause_ : string option)
  ?error:(error_ : string option) ?name:(name_ : string option)
  ?state_machine_arn:(state_machine_arn_ : string option)
  ~status:(status_ : sync_execution_status)
  ~stop_date:(stop_date_ : CoreTypes.Timestamp.t)
  ~start_date:(start_date_ : CoreTypes.Timestamp.t)
  ~execution_arn:(execution_arn_ : string) () =
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
  ?trace_header:(trace_header_ : string option)
  ?input:(input_ : string option) ?name:(name_ : string option)
  ~state_machine_arn:(state_machine_arn_ : string) () =
  ({
     included_data = included_data_;
     trace_header = trace_header_;
     input = input_;
     name = name_;
     state_machine_arn = state_machine_arn_
   } : start_sync_execution_input)
let make_start_execution_output
  ~start_date:(start_date_ : CoreTypes.Timestamp.t)
  ~execution_arn:(execution_arn_ : string) () =
  ({ start_date = start_date_; execution_arn = execution_arn_ } : start_execution_output)
let make_start_execution_input ?trace_header:(trace_header_ : string option)
  ?input:(input_ : string option) ?name:(name_ : string option)
  ~state_machine_arn:(state_machine_arn_ : string) () =
  ({
     trace_header = trace_header_;
     input = input_;
     name = name_;
     state_machine_arn = state_machine_arn_
   } : start_execution_input)
let make_send_task_success_output () = (() : unit)
let make_send_task_success_input ~output:(output_ : string)
  ~task_token:(task_token_ : string) () =
  ({ output = output_; task_token = task_token_ } : send_task_success_input)
let make_send_task_heartbeat_output () = (() : unit)
let make_send_task_heartbeat_input ~task_token:(task_token_ : string) () =
  ({ task_token = task_token_ } : send_task_heartbeat_input)
let make_send_task_failure_output () = (() : unit)
let make_send_task_failure_input ?cause:(cause_ : string option)
  ?error:(error_ : string option) ~task_token:(task_token_ : string) () =
  ({ cause = cause_; error = error_; task_token = task_token_ } : send_task_failure_input)
let make_redrive_execution_output
  ~redrive_date:(redrive_date_ : CoreTypes.Timestamp.t) () =
  ({ redrive_date = redrive_date_ } : redrive_execution_output)
let make_redrive_execution_input
  ?client_token:(client_token_ : string option)
  ~execution_arn:(execution_arn_ : string) () =
  ({ client_token = client_token_; execution_arn = execution_arn_ } : 
  redrive_execution_input)
let make_publish_state_machine_version_output
  ~state_machine_version_arn:(state_machine_version_arn_ : string)
  ~creation_date:(creation_date_ : CoreTypes.Timestamp.t) () =
  ({
     state_machine_version_arn = state_machine_version_arn_;
     creation_date = creation_date_
   } : publish_state_machine_version_output)
let make_publish_state_machine_version_input
  ?description:(description_ : string option)
  ?revision_id:(revision_id_ : string option)
  ~state_machine_arn:(state_machine_arn_ : string) () =
  ({
     description = description_;
     revision_id = revision_id_;
     state_machine_arn = state_machine_arn_
   } : publish_state_machine_version_input)
let make_map_state_started_event_details ?length:(length_ : int option) () =
  ({ length = length_ } : map_state_started_event_details)
let make_map_run_started_event_details
  ?map_run_arn:(map_run_arn_ : string option) () =
  ({ map_run_arn = map_run_arn_ } : map_run_started_event_details)
let make_map_run_redriven_event_details
  ?redrive_count:(redrive_count_ : int option)
  ?map_run_arn:(map_run_arn_ : string option) () =
  ({ redrive_count = redrive_count_; map_run_arn = map_run_arn_ } : map_run_redriven_event_details)
let make_map_run_list_item
  ?stop_date:(stop_date_ : CoreTypes.Timestamp.t option)
  ~start_date:(start_date_ : CoreTypes.Timestamp.t)
  ~state_machine_arn:(state_machine_arn_ : string)
  ~map_run_arn:(map_run_arn_ : string)
  ~execution_arn:(execution_arn_ : string) () =
  ({
     stop_date = stop_date_;
     start_date = start_date_;
     state_machine_arn = state_machine_arn_;
     map_run_arn = map_run_arn_;
     execution_arn = execution_arn_
   } : map_run_list_item)
let make_map_run_item_counts ?pending_redrive:(pending_redrive_ : int option)
  ?failures_not_redrivable:(failures_not_redrivable_ : int option)
  ~results_written:(results_written_ : int) ~total:(total_ : int)
  ~aborted:(aborted_ : int) ~timed_out:(timed_out_ : int)
  ~failed:(failed_ : int) ~succeeded:(succeeded_ : int)
  ~running:(running_ : int) ~pending:(pending_ : int) () =
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
let make_map_run_failed_event_details ?cause:(cause_ : string option)
  ?error:(error_ : string option) () =
  ({ cause = cause_; error = error_ } : map_run_failed_event_details)
let make_map_run_execution_counts
  ?pending_redrive:(pending_redrive_ : int option)
  ?failures_not_redrivable:(failures_not_redrivable_ : int option)
  ~results_written:(results_written_ : int) ~total:(total_ : int)
  ~aborted:(aborted_ : int) ~timed_out:(timed_out_ : int)
  ~failed:(failed_ : int) ~succeeded:(succeeded_ : int)
  ~running:(running_ : int) ~pending:(pending_ : int) () =
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
let make_map_iteration_event_details ?index:(index_ : int option)
  ?name:(name_ : string option) () =
  ({ index = index_; name = name_ } : map_iteration_event_details)
let make_list_tags_for_resource_output ?tags:(tags_ : tag list option) () =
  ({ tags = tags_ } : list_tags_for_resource_output)
let make_list_tags_for_resource_input ~resource_arn:(resource_arn_ : string)
  () = ({ resource_arn = resource_arn_ } : list_tags_for_resource_input)
let make_list_state_machines_output ?next_token:(next_token_ : string option)
  ~state_machines:(state_machines_ : state_machine_list_item list) () =
  ({ next_token = next_token_; state_machines = state_machines_ } : list_state_machines_output)
let make_list_state_machines_input ?next_token:(next_token_ : string option)
  ?max_results:(max_results_ : int option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_state_machines_input)
let make_list_state_machine_versions_output
  ?next_token:(next_token_ : string option)
  ~state_machine_versions:(state_machine_versions_ :
                            state_machine_version_list_item list)
  () =
  ({
     next_token = next_token_;
     state_machine_versions = state_machine_versions_
   } : list_state_machine_versions_output)
let make_list_state_machine_versions_input
  ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option)
  ~state_machine_arn:(state_machine_arn_ : string) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     state_machine_arn = state_machine_arn_
   } : list_state_machine_versions_input)
let make_list_state_machine_aliases_output
  ?next_token:(next_token_ : string option)
  ~state_machine_aliases:(state_machine_aliases_ :
                           state_machine_alias_list_item list)
  () =
  ({ next_token = next_token_; state_machine_aliases = state_machine_aliases_
   } : list_state_machine_aliases_output)
let make_list_state_machine_aliases_input
  ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option)
  ~state_machine_arn:(state_machine_arn_ : string) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     state_machine_arn = state_machine_arn_
   } : list_state_machine_aliases_input)
let make_list_map_runs_output ?next_token:(next_token_ : string option)
  ~map_runs:(map_runs_ : map_run_list_item list) () =
  ({ next_token = next_token_; map_runs = map_runs_ } : list_map_runs_output)
let make_list_map_runs_input ?next_token:(next_token_ : string option)
  ?max_results:(max_results_ : int option)
  ~execution_arn:(execution_arn_ : string) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     execution_arn = execution_arn_
   } : list_map_runs_input)
let make_execution_list_item
  ?redrive_date:(redrive_date_ : CoreTypes.Timestamp.t option)
  ?redrive_count:(redrive_count_ : int option)
  ?state_machine_alias_arn:(state_machine_alias_arn_ : string option)
  ?state_machine_version_arn:(state_machine_version_arn_ : string option)
  ?item_count:(item_count_ : int option)
  ?map_run_arn:(map_run_arn_ : string option)
  ?stop_date:(stop_date_ : CoreTypes.Timestamp.t option)
  ~start_date:(start_date_ : CoreTypes.Timestamp.t)
  ~status:(status_ : execution_status) ~name:(name_ : string)
  ~state_machine_arn:(state_machine_arn_ : string)
  ~execution_arn:(execution_arn_ : string) () =
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
let make_list_executions_output ?next_token:(next_token_ : string option)
  ~executions:(executions_ : execution_list_item list) () =
  ({ next_token = next_token_; executions = executions_ } : list_executions_output)
let make_list_executions_input
  ?redrive_filter:(redrive_filter_ : execution_redrive_filter option)
  ?map_run_arn:(map_run_arn_ : string option)
  ?next_token:(next_token_ : string option)
  ?max_results:(max_results_ : int option)
  ?status_filter:(status_filter_ : execution_status option)
  ?state_machine_arn:(state_machine_arn_ : string option) () =
  ({
     redrive_filter = redrive_filter_;
     map_run_arn = map_run_arn_;
     next_token = next_token_;
     max_results = max_results_;
     status_filter = status_filter_;
     state_machine_arn = state_machine_arn_
   } : list_executions_input)
let make_activity_list_item
  ~creation_date:(creation_date_ : CoreTypes.Timestamp.t)
  ~name:(name_ : string) ~activity_arn:(activity_arn_ : string) () =
  ({
     creation_date = creation_date_;
     name = name_;
     activity_arn = activity_arn_
   } : activity_list_item)
let make_list_activities_output ?next_token:(next_token_ : string option)
  ~activities:(activities_ : activity_list_item list) () =
  ({ next_token = next_token_; activities = activities_ } : list_activities_output)
let make_list_activities_input ?next_token:(next_token_ : string option)
  ?max_results:(max_results_ : int option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_activities_input)
let make_lambda_function_timed_out_event_details
  ?cause:(cause_ : string option) ?error:(error_ : string option) () =
  ({ cause = cause_; error = error_ } : lambda_function_timed_out_event_details)
let make_lambda_function_succeeded_event_details
  ?output_details:(output_details_ :
                    history_event_execution_data_details option)
  ?output:(output_ : string option) () =
  ({ output_details = output_details_; output = output_ } : lambda_function_succeeded_event_details)
let make_lambda_function_start_failed_event_details
  ?cause:(cause_ : string option) ?error:(error_ : string option) () =
  ({ cause = cause_; error = error_ } : lambda_function_start_failed_event_details)
let make_lambda_function_scheduled_event_details
  ?task_credentials:(task_credentials_ : task_credentials option)
  ?timeout_in_seconds:(timeout_in_seconds_ : int option)
  ?input_details:(input_details_ :
                   history_event_execution_data_details option)
  ?input:(input_ : string option) ~resource:(resource_ : string) () =
  ({
     task_credentials = task_credentials_;
     timeout_in_seconds = timeout_in_seconds_;
     input_details = input_details_;
     input = input_;
     resource = resource_
   } : lambda_function_scheduled_event_details)
let make_lambda_function_schedule_failed_event_details
  ?cause:(cause_ : string option) ?error:(error_ : string option) () =
  ({ cause = cause_; error = error_ } : lambda_function_schedule_failed_event_details)
let make_lambda_function_failed_event_details ?cause:(cause_ : string option)
  ?error:(error_ : string option) () =
  ({ cause = cause_; error = error_ } : lambda_function_failed_event_details)
let make_activity_failed_event_details ?cause:(cause_ : string option)
  ?error:(error_ : string option) () =
  ({ cause = cause_; error = error_ } : activity_failed_event_details)
let make_activity_schedule_failed_event_details
  ?cause:(cause_ : string option) ?error:(error_ : string option) () =
  ({ cause = cause_; error = error_ } : activity_schedule_failed_event_details)
let make_activity_scheduled_event_details
  ?heartbeat_in_seconds:(heartbeat_in_seconds_ : int option)
  ?timeout_in_seconds:(timeout_in_seconds_ : int option)
  ?input_details:(input_details_ :
                   history_event_execution_data_details option)
  ?input:(input_ : string option) ~resource:(resource_ : string) () =
  ({
     heartbeat_in_seconds = heartbeat_in_seconds_;
     timeout_in_seconds = timeout_in_seconds_;
     input_details = input_details_;
     input = input_;
     resource = resource_
   } : activity_scheduled_event_details)
let make_activity_started_event_details
  ?worker_name:(worker_name_ : string option) () =
  ({ worker_name = worker_name_ } : activity_started_event_details)
let make_activity_succeeded_event_details
  ?output_details:(output_details_ :
                    history_event_execution_data_details option)
  ?output:(output_ : string option) () =
  ({ output_details = output_details_; output = output_ } : activity_succeeded_event_details)
let make_activity_timed_out_event_details ?cause:(cause_ : string option)
  ?error:(error_ : string option) () =
  ({ cause = cause_; error = error_ } : activity_timed_out_event_details)
let make_execution_failed_event_details ?cause:(cause_ : string option)
  ?error:(error_ : string option) () =
  ({ cause = cause_; error = error_ } : execution_failed_event_details)
let make_execution_started_event_details
  ?state_machine_version_arn:(state_machine_version_arn_ : string option)
  ?state_machine_alias_arn:(state_machine_alias_arn_ : string option)
  ?role_arn:(role_arn_ : string option)
  ?input_details:(input_details_ :
                   history_event_execution_data_details option)
  ?input:(input_ : string option) () =
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
  ?output:(output_ : string option) () =
  ({ output_details = output_details_; output = output_ } : execution_succeeded_event_details)
let make_execution_aborted_event_details ?cause:(cause_ : string option)
  ?error:(error_ : string option) () =
  ({ cause = cause_; error = error_ } : execution_aborted_event_details)
let make_execution_timed_out_event_details ?cause:(cause_ : string option)
  ?error:(error_ : string option) () =
  ({ cause = cause_; error = error_ } : execution_timed_out_event_details)
let make_execution_redriven_event_details
  ?redrive_count:(redrive_count_ : int option) () =
  ({ redrive_count = redrive_count_ } : execution_redriven_event_details)
let make_evaluation_failed_event_details
  ?location:(location_ : string option) ?cause:(cause_ : string option)
  ?error:(error_ : string option) ~state:(state_ : string) () =
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
  ?previous_event_id:(previous_event_id_ : int option) ~id:(id_ : int)
  ~type_:(type__ : history_event_type)
  ~timestamp_:(timestamp__ : CoreTypes.Timestamp.t) () =
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
     timestamp_ = timestamp__
   } : history_event)
let make_get_execution_history_output
  ?next_token:(next_token_ : string option)
  ~events:(events_ : history_event list) () =
  ({ next_token = next_token_; events = events_ } : get_execution_history_output)
let make_get_execution_history_input
  ?include_execution_data:(include_execution_data_ : bool option)
  ?next_token:(next_token_ : string option)
  ?reverse_order:(reverse_order_ : bool option)
  ?max_results:(max_results_ : int option)
  ~execution_arn:(execution_arn_ : string) () =
  ({
     include_execution_data = include_execution_data_;
     next_token = next_token_;
     reverse_order = reverse_order_;
     max_results = max_results_;
     execution_arn = execution_arn_
   } : get_execution_history_input)
let make_get_activity_task_output ?input:(input_ : string option)
  ?task_token:(task_token_ : string option) () =
  ({ input = input_; task_token = task_token_ } : get_activity_task_output)
let make_get_activity_task_input ?worker_name:(worker_name_ : string option)
  ~activity_arn:(activity_arn_ : string) () =
  ({ worker_name = worker_name_; activity_arn = activity_arn_ } : get_activity_task_input)
let make_describe_state_machine_output
  ?variable_references:(variable_references_ : variable_references option)
  ?encryption_configuration:(encryption_configuration_ :
                              encryption_configuration option)
  ?description:(description_ : string option)
  ?revision_id:(revision_id_ : string option) ?label:(label_ : string option)
  ?tracing_configuration:(tracing_configuration_ :
                           tracing_configuration option)
  ?logging_configuration:(logging_configuration_ :
                           logging_configuration option)
  ?status:(status_ : state_machine_status option)
  ~creation_date:(creation_date_ : CoreTypes.Timestamp.t)
  ~type_:(type__ : state_machine_type) ~role_arn:(role_arn_ : string)
  ~definition:(definition_ : string) ~name:(name_ : string)
  ~state_machine_arn:(state_machine_arn_ : string) () =
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
  ~state_machine_arn:(state_machine_arn_ : string) () =
  ({ included_data = included_data_; state_machine_arn = state_machine_arn_ } : 
  describe_state_machine_input)
let make_describe_state_machine_for_execution_output
  ?variable_references:(variable_references_ : variable_references option)
  ?encryption_configuration:(encryption_configuration_ :
                              encryption_configuration option)
  ?revision_id:(revision_id_ : string option) ?label:(label_ : string option)
  ?map_run_arn:(map_run_arn_ : string option)
  ?tracing_configuration:(tracing_configuration_ :
                           tracing_configuration option)
  ?logging_configuration:(logging_configuration_ :
                           logging_configuration option)
  ~update_date:(update_date_ : CoreTypes.Timestamp.t)
  ~role_arn:(role_arn_ : string) ~definition:(definition_ : string)
  ~name:(name_ : string) ~state_machine_arn:(state_machine_arn_ : string) ()
  =
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
  ~execution_arn:(execution_arn_ : string) () =
  ({ included_data = included_data_; execution_arn = execution_arn_ } : 
  describe_state_machine_for_execution_input)
let make_describe_state_machine_alias_output
  ?update_date:(update_date_ : CoreTypes.Timestamp.t option)
  ?creation_date:(creation_date_ : CoreTypes.Timestamp.t option)
  ?routing_configuration:(routing_configuration_ :
                           routing_configuration_list_item list option)
  ?description:(description_ : string option) ?name:(name_ : string option)
  ?state_machine_alias_arn:(state_machine_alias_arn_ : string option) () =
  ({
     update_date = update_date_;
     creation_date = creation_date_;
     routing_configuration = routing_configuration_;
     description = description_;
     name = name_;
     state_machine_alias_arn = state_machine_alias_arn_
   } : describe_state_machine_alias_output)
let make_describe_state_machine_alias_input
  ~state_machine_alias_arn:(state_machine_alias_arn_ : string) () =
  ({ state_machine_alias_arn = state_machine_alias_arn_ } : describe_state_machine_alias_input)
let make_describe_map_run_output
  ?redrive_date:(redrive_date_ : CoreTypes.Timestamp.t option)
  ?redrive_count:(redrive_count_ : int option)
  ?stop_date:(stop_date_ : CoreTypes.Timestamp.t option)
  ~execution_counts:(execution_counts_ : map_run_execution_counts)
  ~item_counts:(item_counts_ : map_run_item_counts)
  ~tolerated_failure_count:(tolerated_failure_count_ : int)
  ~tolerated_failure_percentage:(tolerated_failure_percentage_ : float)
  ~max_concurrency:(max_concurrency_ : int)
  ~start_date:(start_date_ : CoreTypes.Timestamp.t)
  ~status:(status_ : map_run_status) ~execution_arn:(execution_arn_ : string)
  ~map_run_arn:(map_run_arn_ : string) () =
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
let make_describe_map_run_input ~map_run_arn:(map_run_arn_ : string) () =
  ({ map_run_arn = map_run_arn_ } : describe_map_run_input)
let make_describe_execution_output
  ?redrive_status_reason:(redrive_status_reason_ : string option)
  ?redrive_status:(redrive_status_ : execution_redrive_status option)
  ?redrive_date:(redrive_date_ : CoreTypes.Timestamp.t option)
  ?redrive_count:(redrive_count_ : int option)
  ?state_machine_alias_arn:(state_machine_alias_arn_ : string option)
  ?state_machine_version_arn:(state_machine_version_arn_ : string option)
  ?cause:(cause_ : string option) ?error:(error_ : string option)
  ?map_run_arn:(map_run_arn_ : string option)
  ?trace_header:(trace_header_ : string option)
  ?output_details:(output_details_ :
                    cloud_watch_events_execution_data_details option)
  ?output:(output_ : string option)
  ?input_details:(input_details_ :
                   cloud_watch_events_execution_data_details option)
  ?input:(input_ : string option)
  ?stop_date:(stop_date_ : CoreTypes.Timestamp.t option)
  ?name:(name_ : string option)
  ~start_date:(start_date_ : CoreTypes.Timestamp.t)
  ~status:(status_ : execution_status)
  ~state_machine_arn:(state_machine_arn_ : string)
  ~execution_arn:(execution_arn_ : string) () =
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
  ~execution_arn:(execution_arn_ : string) () =
  ({ included_data = included_data_; execution_arn = execution_arn_ } : 
  describe_execution_input)
let make_describe_activity_output
  ?encryption_configuration:(encryption_configuration_ :
                              encryption_configuration option)
  ~creation_date:(creation_date_ : CoreTypes.Timestamp.t)
  ~name:(name_ : string) ~activity_arn:(activity_arn_ : string) () =
  ({
     encryption_configuration = encryption_configuration_;
     creation_date = creation_date_;
     name = name_;
     activity_arn = activity_arn_
   } : describe_activity_output)
let make_describe_activity_input ~activity_arn:(activity_arn_ : string) () =
  ({ activity_arn = activity_arn_ } : describe_activity_input)
let make_delete_state_machine_version_output () = (() : unit)
let make_delete_state_machine_version_input
  ~state_machine_version_arn:(state_machine_version_arn_ : string) () =
  ({ state_machine_version_arn = state_machine_version_arn_ } : delete_state_machine_version_input)
let make_delete_state_machine_output () = (() : unit)
let make_delete_state_machine_input
  ~state_machine_arn:(state_machine_arn_ : string) () =
  ({ state_machine_arn = state_machine_arn_ } : delete_state_machine_input)
let make_delete_state_machine_alias_output () = (() : unit)
let make_delete_state_machine_alias_input
  ~state_machine_alias_arn:(state_machine_alias_arn_ : string) () =
  ({ state_machine_alias_arn = state_machine_alias_arn_ } : delete_state_machine_alias_input)
let make_delete_activity_output () = (() : unit)
let make_delete_activity_input ~activity_arn:(activity_arn_ : string) () =
  ({ activity_arn = activity_arn_ } : delete_activity_input)
let make_create_state_machine_output
  ?state_machine_version_arn:(state_machine_version_arn_ : string option)
  ~creation_date:(creation_date_ : CoreTypes.Timestamp.t)
  ~state_machine_arn:(state_machine_arn_ : string) () =
  ({
     state_machine_version_arn = state_machine_version_arn_;
     creation_date = creation_date_;
     state_machine_arn = state_machine_arn_
   } : create_state_machine_output)
let make_create_state_machine_input
  ?encryption_configuration:(encryption_configuration_ :
                              encryption_configuration option)
  ?version_description:(version_description_ : string option)
  ?publish:(publish_ : bool option)
  ?tracing_configuration:(tracing_configuration_ :
                           tracing_configuration option)
  ?tags:(tags_ : tag list option)
  ?logging_configuration:(logging_configuration_ :
                           logging_configuration option)
  ?type_:(type__ : state_machine_type option) ~role_arn:(role_arn_ : string)
  ~definition:(definition_ : string) ~name:(name_ : string) () =
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
  ~creation_date:(creation_date_ : CoreTypes.Timestamp.t)
  ~state_machine_alias_arn:(state_machine_alias_arn_ : string) () =
  ({
     creation_date = creation_date_;
     state_machine_alias_arn = state_machine_alias_arn_
   } : create_state_machine_alias_output)
let make_create_state_machine_alias_input
  ?description:(description_ : string option)
  ~routing_configuration:(routing_configuration_ :
                           routing_configuration_list_item list)
  ~name:(name_ : string) () =
  ({
     routing_configuration = routing_configuration_;
     name = name_;
     description = description_
   } : create_state_machine_alias_input)
let make_create_activity_output
  ~creation_date:(creation_date_ : CoreTypes.Timestamp.t)
  ~activity_arn:(activity_arn_ : string) () =
  ({ creation_date = creation_date_; activity_arn = activity_arn_ } : 
  create_activity_output)
let make_create_activity_input
  ?encryption_configuration:(encryption_configuration_ :
                              encryption_configuration option)
  ?tags:(tags_ : tag list option) ~name:(name_ : string) () =
  ({
     encryption_configuration = encryption_configuration_;
     tags = tags_;
     name = name_
   } : create_activity_input)