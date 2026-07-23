open Types

let make_activity_type ~name:(name_ : name) ~version:(version_ : version) () =
  ({ name = name_; version = version_ } : activity_type)

let make_workflow_execution ~workflow_id:(workflow_id_ : workflow_id)
    ~run_id:(run_id_ : workflow_run_id) () =
  ({ workflow_id = workflow_id_; run_id = run_id_ } : workflow_execution)

let make_activity_task ?input:(input_ : data option) ~task_token:(task_token_ : task_token)
    ~activity_id:(activity_id_ : activity_id) ~started_event_id:(started_event_id_ : event_id)
    ~workflow_execution:(workflow_execution_ : workflow_execution)
    ~activity_type:(activity_type_ : activity_type) () =
  ({
     task_token = task_token_;
     activity_id = activity_id_;
     started_event_id = started_event_id_;
     workflow_execution = workflow_execution_;
     activity_type = activity_type_;
     input = input_;
   }
    : activity_task)

let make_activity_task_cancel_requested_event_attributes
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id)
    ~activity_id:(activity_id_ : activity_id) () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     activity_id = activity_id_;
   }
    : activity_task_cancel_requested_event_attributes)

let make_activity_task_canceled_event_attributes ?details:(details_ : data option)
    ?latest_cancel_requested_event_id:(latest_cancel_requested_event_id_ : event_id option)
    ~scheduled_event_id:(scheduled_event_id_ : event_id)
    ~started_event_id:(started_event_id_ : event_id) () =
  ({
     details = details_;
     scheduled_event_id = scheduled_event_id_;
     started_event_id = started_event_id_;
     latest_cancel_requested_event_id = latest_cancel_requested_event_id_;
   }
    : activity_task_canceled_event_attributes)

let make_activity_task_completed_event_attributes ?result_:(result__ : data option)
    ~scheduled_event_id:(scheduled_event_id_ : event_id)
    ~started_event_id:(started_event_id_ : event_id) () =
  ({
     result_ = result__;
     scheduled_event_id = scheduled_event_id_;
     started_event_id = started_event_id_;
   }
    : activity_task_completed_event_attributes)

let make_activity_task_failed_event_attributes ?reason:(reason_ : failure_reason option)
    ?details:(details_ : data option) ~scheduled_event_id:(scheduled_event_id_ : event_id)
    ~started_event_id:(started_event_id_ : event_id) () =
  ({
     reason = reason_;
     details = details_;
     scheduled_event_id = scheduled_event_id_;
     started_event_id = started_event_id_;
   }
    : activity_task_failed_event_attributes)

let make_task_list ~name:(name_ : name) () = ({ name = name_ } : task_list)

let make_activity_task_scheduled_event_attributes ?input:(input_ : data option)
    ?control:(control_ : data option)
    ?schedule_to_start_timeout:(schedule_to_start_timeout_ : duration_in_seconds_optional option)
    ?schedule_to_close_timeout:(schedule_to_close_timeout_ : duration_in_seconds_optional option)
    ?start_to_close_timeout:(start_to_close_timeout_ : duration_in_seconds_optional option)
    ?task_priority:(task_priority_ : task_priority option)
    ?heartbeat_timeout:(heartbeat_timeout_ : duration_in_seconds_optional option)
    ~activity_type:(activity_type_ : activity_type) ~activity_id:(activity_id_ : activity_id)
    ~task_list:(task_list_ : task_list)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({
     activity_type = activity_type_;
     activity_id = activity_id_;
     input = input_;
     control = control_;
     schedule_to_start_timeout = schedule_to_start_timeout_;
     schedule_to_close_timeout = schedule_to_close_timeout_;
     start_to_close_timeout = start_to_close_timeout_;
     task_list = task_list_;
     task_priority = task_priority_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     heartbeat_timeout = heartbeat_timeout_;
   }
    : activity_task_scheduled_event_attributes)

let make_activity_task_started_event_attributes ?identity:(identity_ : identity option)
    ~scheduled_event_id:(scheduled_event_id_ : event_id) () =
  ({ identity = identity_; scheduled_event_id = scheduled_event_id_ }
    : activity_task_started_event_attributes)

let make_activity_task_status ~cancel_requested:(cancel_requested_ : canceled) () =
  ({ cancel_requested = cancel_requested_ } : activity_task_status)

let make_activity_task_timed_out_event_attributes ?details:(details_ : limited_data option)
    ~timeout_type:(timeout_type_ : activity_task_timeout_type)
    ~scheduled_event_id:(scheduled_event_id_ : event_id)
    ~started_event_id:(started_event_id_ : event_id) () =
  ({
     timeout_type = timeout_type_;
     scheduled_event_id = scheduled_event_id_;
     started_event_id = started_event_id_;
     details = details_;
   }
    : activity_task_timed_out_event_attributes)

let make_activity_type_configuration
    ?default_task_start_to_close_timeout:
      (default_task_start_to_close_timeout_ : duration_in_seconds_optional option)
    ?default_task_heartbeat_timeout:
      (default_task_heartbeat_timeout_ : duration_in_seconds_optional option)
    ?default_task_list:(default_task_list_ : task_list option)
    ?default_task_priority:(default_task_priority_ : task_priority option)
    ?default_task_schedule_to_start_timeout:
      (default_task_schedule_to_start_timeout_ : duration_in_seconds_optional option)
    ?default_task_schedule_to_close_timeout:
      (default_task_schedule_to_close_timeout_ : duration_in_seconds_optional option) () =
  ({
     default_task_start_to_close_timeout = default_task_start_to_close_timeout_;
     default_task_heartbeat_timeout = default_task_heartbeat_timeout_;
     default_task_list = default_task_list_;
     default_task_priority = default_task_priority_;
     default_task_schedule_to_start_timeout = default_task_schedule_to_start_timeout_;
     default_task_schedule_to_close_timeout = default_task_schedule_to_close_timeout_;
   }
    : activity_type_configuration)

let make_activity_type_info ?description:(description_ : description option)
    ?deprecation_date:(deprecation_date_ : timestamp option)
    ~activity_type:(activity_type_ : activity_type) ~status:(status_ : registration_status)
    ~creation_date:(creation_date_ : timestamp) () =
  ({
     activity_type = activity_type_;
     status = status_;
     description = description_;
     creation_date = creation_date_;
     deprecation_date = deprecation_date_;
   }
    : activity_type_info)

let make_activity_type_detail ~type_info:(type_info_ : activity_type_info)
    ~configuration:(configuration_ : activity_type_configuration) () =
  ({ type_info = type_info_; configuration = configuration_ } : activity_type_detail)

let make_activity_type_infos ?next_page_token:(next_page_token_ : page_token option)
    ~type_infos:(type_infos_ : activity_type_info_list) () =
  ({ type_infos = type_infos_; next_page_token = next_page_token_ } : activity_type_infos)

let make_cancel_timer_decision_attributes ~timer_id:(timer_id_ : timer_id) () =
  ({ timer_id = timer_id_ } : cancel_timer_decision_attributes)

let make_cancel_timer_failed_event_attributes ~timer_id:(timer_id_ : timer_id)
    ~cause:(cause_ : cancel_timer_failed_cause)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({
     timer_id = timer_id_;
     cause = cause_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
   }
    : cancel_timer_failed_event_attributes)

let make_cancel_workflow_execution_decision_attributes ?details:(details_ : data option) () =
  ({ details = details_ } : cancel_workflow_execution_decision_attributes)

let make_cancel_workflow_execution_failed_event_attributes
    ~cause:(cause_ : cancel_workflow_execution_failed_cause)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({ cause = cause_; decision_task_completed_event_id = decision_task_completed_event_id_ }
    : cancel_workflow_execution_failed_event_attributes)

let make_workflow_type ~name:(name_ : name) ~version:(version_ : version) () =
  ({ name = name_; version = version_ } : workflow_type)

let make_child_workflow_execution_canceled_event_attributes ?details:(details_ : data option)
    ~workflow_execution:(workflow_execution_ : workflow_execution)
    ~workflow_type:(workflow_type_ : workflow_type)
    ~initiated_event_id:(initiated_event_id_ : event_id)
    ~started_event_id:(started_event_id_ : event_id) () =
  ({
     workflow_execution = workflow_execution_;
     workflow_type = workflow_type_;
     details = details_;
     initiated_event_id = initiated_event_id_;
     started_event_id = started_event_id_;
   }
    : child_workflow_execution_canceled_event_attributes)

let make_child_workflow_execution_completed_event_attributes ?result_:(result__ : data option)
    ~workflow_execution:(workflow_execution_ : workflow_execution)
    ~workflow_type:(workflow_type_ : workflow_type)
    ~initiated_event_id:(initiated_event_id_ : event_id)
    ~started_event_id:(started_event_id_ : event_id) () =
  ({
     workflow_execution = workflow_execution_;
     workflow_type = workflow_type_;
     result_ = result__;
     initiated_event_id = initiated_event_id_;
     started_event_id = started_event_id_;
   }
    : child_workflow_execution_completed_event_attributes)

let make_child_workflow_execution_failed_event_attributes ?reason:(reason_ : failure_reason option)
    ?details:(details_ : data option) ~workflow_execution:(workflow_execution_ : workflow_execution)
    ~workflow_type:(workflow_type_ : workflow_type)
    ~initiated_event_id:(initiated_event_id_ : event_id)
    ~started_event_id:(started_event_id_ : event_id) () =
  ({
     workflow_execution = workflow_execution_;
     workflow_type = workflow_type_;
     reason = reason_;
     details = details_;
     initiated_event_id = initiated_event_id_;
     started_event_id = started_event_id_;
   }
    : child_workflow_execution_failed_event_attributes)

let make_child_workflow_execution_started_event_attributes
    ~workflow_execution:(workflow_execution_ : workflow_execution)
    ~workflow_type:(workflow_type_ : workflow_type)
    ~initiated_event_id:(initiated_event_id_ : event_id) () =
  ({
     workflow_execution = workflow_execution_;
     workflow_type = workflow_type_;
     initiated_event_id = initiated_event_id_;
   }
    : child_workflow_execution_started_event_attributes)

let make_child_workflow_execution_terminated_event_attributes
    ~workflow_execution:(workflow_execution_ : workflow_execution)
    ~workflow_type:(workflow_type_ : workflow_type)
    ~initiated_event_id:(initiated_event_id_ : event_id)
    ~started_event_id:(started_event_id_ : event_id) () =
  ({
     workflow_execution = workflow_execution_;
     workflow_type = workflow_type_;
     initiated_event_id = initiated_event_id_;
     started_event_id = started_event_id_;
   }
    : child_workflow_execution_terminated_event_attributes)

let make_child_workflow_execution_timed_out_event_attributes
    ~workflow_execution:(workflow_execution_ : workflow_execution)
    ~workflow_type:(workflow_type_ : workflow_type)
    ~timeout_type:(timeout_type_ : workflow_execution_timeout_type)
    ~initiated_event_id:(initiated_event_id_ : event_id)
    ~started_event_id:(started_event_id_ : event_id) () =
  ({
     workflow_execution = workflow_execution_;
     workflow_type = workflow_type_;
     timeout_type = timeout_type_;
     initiated_event_id = initiated_event_id_;
     started_event_id = started_event_id_;
   }
    : child_workflow_execution_timed_out_event_attributes)

let make_close_status_filter ~status:(status_ : close_status) () =
  ({ status = status_ } : close_status_filter)

let make_complete_workflow_execution_decision_attributes ?result_:(result__ : data option) () =
  ({ result_ = result__ } : complete_workflow_execution_decision_attributes)

let make_complete_workflow_execution_failed_event_attributes
    ~cause:(cause_ : complete_workflow_execution_failed_cause)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({ cause = cause_; decision_task_completed_event_id = decision_task_completed_event_id_ }
    : complete_workflow_execution_failed_event_attributes)

let make_continue_as_new_workflow_execution_decision_attributes ?input:(input_ : data option)
    ?execution_start_to_close_timeout:
      (execution_start_to_close_timeout_ : duration_in_seconds_optional option)
    ?task_list:(task_list_ : task_list option)
    ?task_priority:(task_priority_ : task_priority option)
    ?task_start_to_close_timeout:
      (task_start_to_close_timeout_ : duration_in_seconds_optional option)
    ?child_policy:(child_policy_ : child_policy option) ?tag_list:(tag_list_ : tag_list option)
    ?workflow_type_version:(workflow_type_version_ : version option)
    ?lambda_role:(lambda_role_ : arn option) () =
  ({
     input = input_;
     execution_start_to_close_timeout = execution_start_to_close_timeout_;
     task_list = task_list_;
     task_priority = task_priority_;
     task_start_to_close_timeout = task_start_to_close_timeout_;
     child_policy = child_policy_;
     tag_list = tag_list_;
     workflow_type_version = workflow_type_version_;
     lambda_role = lambda_role_;
   }
    : continue_as_new_workflow_execution_decision_attributes)

let make_continue_as_new_workflow_execution_failed_event_attributes
    ~cause:(cause_ : continue_as_new_workflow_execution_failed_cause)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({ cause = cause_; decision_task_completed_event_id = decision_task_completed_event_id_ }
    : continue_as_new_workflow_execution_failed_event_attributes)

let make_workflow_execution_count ?truncated:(truncated_ : truncated option) ~count:(count_ : count)
    () =
  ({ count = count_; truncated = truncated_ } : workflow_execution_count)

let make_tag_filter ~tag:(tag_ : tag) () = ({ tag = tag_ } : tag_filter)

let make_workflow_type_filter ?version:(version_ : version_optional option) ~name:(name_ : name) ()
    =
  ({ name = name_; version = version_ } : workflow_type_filter)

let make_workflow_execution_filter ~workflow_id:(workflow_id_ : workflow_id) () =
  ({ workflow_id = workflow_id_ } : workflow_execution_filter)

let make_execution_time_filter ?latest_date:(latest_date_ : timestamp option)
    ~oldest_date:(oldest_date_ : timestamp) () =
  ({ oldest_date = oldest_date_; latest_date = latest_date_ } : execution_time_filter)

let make_count_closed_workflow_executions_input
    ?start_time_filter:(start_time_filter_ : execution_time_filter option)
    ?close_time_filter:(close_time_filter_ : execution_time_filter option)
    ?execution_filter:(execution_filter_ : workflow_execution_filter option)
    ?type_filter:(type_filter_ : workflow_type_filter option)
    ?tag_filter:(tag_filter_ : tag_filter option)
    ?close_status_filter:(close_status_filter_ : close_status_filter option)
    ~domain:(domain_ : domain_name) () =
  ({
     domain = domain_;
     start_time_filter = start_time_filter_;
     close_time_filter = close_time_filter_;
     execution_filter = execution_filter_;
     type_filter = type_filter_;
     tag_filter = tag_filter_;
     close_status_filter = close_status_filter_;
   }
    : count_closed_workflow_executions_input)

let make_count_open_workflow_executions_input
    ?type_filter:(type_filter_ : workflow_type_filter option)
    ?tag_filter:(tag_filter_ : tag_filter option)
    ?execution_filter:(execution_filter_ : workflow_execution_filter option)
    ~domain:(domain_ : domain_name) ~start_time_filter:(start_time_filter_ : execution_time_filter)
    () =
  ({
     domain = domain_;
     start_time_filter = start_time_filter_;
     type_filter = type_filter_;
     tag_filter = tag_filter_;
     execution_filter = execution_filter_;
   }
    : count_open_workflow_executions_input)

let make_pending_task_count ?truncated:(truncated_ : truncated option) ~count:(count_ : count) () =
  ({ count = count_; truncated = truncated_ } : pending_task_count)

let make_count_pending_activity_tasks_input ~domain:(domain_ : domain_name)
    ~task_list:(task_list_ : task_list) () =
  ({ domain = domain_; task_list = task_list_ } : count_pending_activity_tasks_input)

let make_count_pending_decision_tasks_input ~domain:(domain_ : domain_name)
    ~task_list:(task_list_ : task_list) () =
  ({ domain = domain_; task_list = task_list_ } : count_pending_decision_tasks_input)

let make_schedule_lambda_function_decision_attributes ?control:(control_ : data option)
    ?input:(input_ : function_input option)
    ?start_to_close_timeout:(start_to_close_timeout_ : duration_in_seconds_optional option)
    ~id:(id_ : function_id) ~name:(name_ : function_name) () =
  ({
     id = id_;
     name = name_;
     control = control_;
     input = input_;
     start_to_close_timeout = start_to_close_timeout_;
   }
    : schedule_lambda_function_decision_attributes)

let make_start_child_workflow_execution_decision_attributes ?control:(control_ : data option)
    ?input:(input_ : data option)
    ?execution_start_to_close_timeout:
      (execution_start_to_close_timeout_ : duration_in_seconds_optional option)
    ?task_list:(task_list_ : task_list option)
    ?task_priority:(task_priority_ : task_priority option)
    ?task_start_to_close_timeout:
      (task_start_to_close_timeout_ : duration_in_seconds_optional option)
    ?child_policy:(child_policy_ : child_policy option) ?tag_list:(tag_list_ : tag_list option)
    ?lambda_role:(lambda_role_ : arn option) ~workflow_type:(workflow_type_ : workflow_type)
    ~workflow_id:(workflow_id_ : workflow_id) () =
  ({
     workflow_type = workflow_type_;
     workflow_id = workflow_id_;
     control = control_;
     input = input_;
     execution_start_to_close_timeout = execution_start_to_close_timeout_;
     task_list = task_list_;
     task_priority = task_priority_;
     task_start_to_close_timeout = task_start_to_close_timeout_;
     child_policy = child_policy_;
     tag_list = tag_list_;
     lambda_role = lambda_role_;
   }
    : start_child_workflow_execution_decision_attributes)

let make_request_cancel_external_workflow_execution_decision_attributes
    ?run_id:(run_id_ : workflow_run_id_optional option) ?control:(control_ : data option)
    ~workflow_id:(workflow_id_ : workflow_id) () =
  ({ workflow_id = workflow_id_; run_id = run_id_; control = control_ }
    : request_cancel_external_workflow_execution_decision_attributes)

let make_signal_external_workflow_execution_decision_attributes
    ?run_id:(run_id_ : workflow_run_id_optional option) ?input:(input_ : data option)
    ?control:(control_ : data option) ~workflow_id:(workflow_id_ : workflow_id)
    ~signal_name:(signal_name_ : signal_name) () =
  ({
     workflow_id = workflow_id_;
     run_id = run_id_;
     signal_name = signal_name_;
     input = input_;
     control = control_;
   }
    : signal_external_workflow_execution_decision_attributes)

let make_start_timer_decision_attributes ?control:(control_ : data option)
    ~timer_id:(timer_id_ : timer_id)
    ~start_to_fire_timeout:(start_to_fire_timeout_ : duration_in_seconds) () =
  ({ timer_id = timer_id_; control = control_; start_to_fire_timeout = start_to_fire_timeout_ }
    : start_timer_decision_attributes)

let make_record_marker_decision_attributes ?details:(details_ : data option)
    ~marker_name:(marker_name_ : marker_name) () =
  ({ marker_name = marker_name_; details = details_ } : record_marker_decision_attributes)

let make_fail_workflow_execution_decision_attributes ?reason:(reason_ : failure_reason option)
    ?details:(details_ : data option) () =
  ({ reason = reason_; details = details_ } : fail_workflow_execution_decision_attributes)

let make_request_cancel_activity_task_decision_attributes ~activity_id:(activity_id_ : activity_id)
    () =
  ({ activity_id = activity_id_ } : request_cancel_activity_task_decision_attributes)

let make_schedule_activity_task_decision_attributes ?control:(control_ : data option)
    ?input:(input_ : data option)
    ?schedule_to_close_timeout:(schedule_to_close_timeout_ : duration_in_seconds_optional option)
    ?task_list:(task_list_ : task_list option)
    ?task_priority:(task_priority_ : task_priority option)
    ?schedule_to_start_timeout:(schedule_to_start_timeout_ : duration_in_seconds_optional option)
    ?start_to_close_timeout:(start_to_close_timeout_ : duration_in_seconds_optional option)
    ?heartbeat_timeout:(heartbeat_timeout_ : duration_in_seconds_optional option)
    ~activity_type:(activity_type_ : activity_type) ~activity_id:(activity_id_ : activity_id) () =
  ({
     activity_type = activity_type_;
     activity_id = activity_id_;
     control = control_;
     input = input_;
     schedule_to_close_timeout = schedule_to_close_timeout_;
     task_list = task_list_;
     task_priority = task_priority_;
     schedule_to_start_timeout = schedule_to_start_timeout_;
     start_to_close_timeout = start_to_close_timeout_;
     heartbeat_timeout = heartbeat_timeout_;
   }
    : schedule_activity_task_decision_attributes)

let make_decision
    ?schedule_activity_task_decision_attributes:
      (schedule_activity_task_decision_attributes_ :
         schedule_activity_task_decision_attributes option)
    ?request_cancel_activity_task_decision_attributes:
      (request_cancel_activity_task_decision_attributes_ :
         request_cancel_activity_task_decision_attributes option)
    ?complete_workflow_execution_decision_attributes:
      (complete_workflow_execution_decision_attributes_ :
         complete_workflow_execution_decision_attributes option)
    ?fail_workflow_execution_decision_attributes:
      (fail_workflow_execution_decision_attributes_ :
         fail_workflow_execution_decision_attributes option)
    ?cancel_workflow_execution_decision_attributes:
      (cancel_workflow_execution_decision_attributes_ :
         cancel_workflow_execution_decision_attributes option)
    ?continue_as_new_workflow_execution_decision_attributes:
      (continue_as_new_workflow_execution_decision_attributes_ :
         continue_as_new_workflow_execution_decision_attributes option)
    ?record_marker_decision_attributes:
      (record_marker_decision_attributes_ : record_marker_decision_attributes option)
    ?start_timer_decision_attributes:
      (start_timer_decision_attributes_ : start_timer_decision_attributes option)
    ?cancel_timer_decision_attributes:
      (cancel_timer_decision_attributes_ : cancel_timer_decision_attributes option)
    ?signal_external_workflow_execution_decision_attributes:
      (signal_external_workflow_execution_decision_attributes_ :
         signal_external_workflow_execution_decision_attributes option)
    ?request_cancel_external_workflow_execution_decision_attributes:
      (request_cancel_external_workflow_execution_decision_attributes_ :
         request_cancel_external_workflow_execution_decision_attributes option)
    ?start_child_workflow_execution_decision_attributes:
      (start_child_workflow_execution_decision_attributes_ :
         start_child_workflow_execution_decision_attributes option)
    ?schedule_lambda_function_decision_attributes:
      (schedule_lambda_function_decision_attributes_ :
         schedule_lambda_function_decision_attributes option)
    ~decision_type:(decision_type_ : decision_type) () =
  ({
     decision_type = decision_type_;
     schedule_activity_task_decision_attributes = schedule_activity_task_decision_attributes_;
     request_cancel_activity_task_decision_attributes =
       request_cancel_activity_task_decision_attributes_;
     complete_workflow_execution_decision_attributes =
       complete_workflow_execution_decision_attributes_;
     fail_workflow_execution_decision_attributes = fail_workflow_execution_decision_attributes_;
     cancel_workflow_execution_decision_attributes = cancel_workflow_execution_decision_attributes_;
     continue_as_new_workflow_execution_decision_attributes =
       continue_as_new_workflow_execution_decision_attributes_;
     record_marker_decision_attributes = record_marker_decision_attributes_;
     start_timer_decision_attributes = start_timer_decision_attributes_;
     cancel_timer_decision_attributes = cancel_timer_decision_attributes_;
     signal_external_workflow_execution_decision_attributes =
       signal_external_workflow_execution_decision_attributes_;
     request_cancel_external_workflow_execution_decision_attributes =
       request_cancel_external_workflow_execution_decision_attributes_;
     start_child_workflow_execution_decision_attributes =
       start_child_workflow_execution_decision_attributes_;
     schedule_lambda_function_decision_attributes = schedule_lambda_function_decision_attributes_;
   }
    : decision)

let make_start_lambda_function_failed_event_attributes
    ?scheduled_event_id:(scheduled_event_id_ : event_id option)
    ?cause:(cause_ : start_lambda_function_failed_cause option)
    ?message:(message_ : cause_message option) () =
  ({ scheduled_event_id = scheduled_event_id_; cause = cause_; message = message_ }
    : start_lambda_function_failed_event_attributes)

let make_schedule_lambda_function_failed_event_attributes ~id:(id_ : function_id)
    ~name:(name_ : function_name) ~cause:(cause_ : schedule_lambda_function_failed_cause)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({
     id = id_;
     name = name_;
     cause = cause_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
   }
    : schedule_lambda_function_failed_event_attributes)

let make_lambda_function_timed_out_event_attributes
    ?timeout_type:(timeout_type_ : lambda_function_timeout_type option)
    ~scheduled_event_id:(scheduled_event_id_ : event_id)
    ~started_event_id:(started_event_id_ : event_id) () =
  ({
     scheduled_event_id = scheduled_event_id_;
     started_event_id = started_event_id_;
     timeout_type = timeout_type_;
   }
    : lambda_function_timed_out_event_attributes)

let make_lambda_function_failed_event_attributes ?reason:(reason_ : failure_reason option)
    ?details:(details_ : data option) ~scheduled_event_id:(scheduled_event_id_ : event_id)
    ~started_event_id:(started_event_id_ : event_id) () =
  ({
     scheduled_event_id = scheduled_event_id_;
     started_event_id = started_event_id_;
     reason = reason_;
     details = details_;
   }
    : lambda_function_failed_event_attributes)

let make_lambda_function_completed_event_attributes ?result_:(result__ : data option)
    ~scheduled_event_id:(scheduled_event_id_ : event_id)
    ~started_event_id:(started_event_id_ : event_id) () =
  ({
     scheduled_event_id = scheduled_event_id_;
     started_event_id = started_event_id_;
     result_ = result__;
   }
    : lambda_function_completed_event_attributes)

let make_lambda_function_started_event_attributes
    ~scheduled_event_id:(scheduled_event_id_ : event_id) () =
  ({ scheduled_event_id = scheduled_event_id_ } : lambda_function_started_event_attributes)

let make_lambda_function_scheduled_event_attributes ?control:(control_ : data option)
    ?input:(input_ : function_input option)
    ?start_to_close_timeout:(start_to_close_timeout_ : duration_in_seconds_optional option)
    ~id:(id_ : function_id) ~name:(name_ : function_name)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({
     id = id_;
     name = name_;
     control = control_;
     input = input_;
     start_to_close_timeout = start_to_close_timeout_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
   }
    : lambda_function_scheduled_event_attributes)

let make_start_child_workflow_execution_failed_event_attributes ?control:(control_ : data option)
    ~workflow_type:(workflow_type_ : workflow_type)
    ~cause:(cause_ : start_child_workflow_execution_failed_cause)
    ~workflow_id:(workflow_id_ : workflow_id) ~initiated_event_id:(initiated_event_id_ : event_id)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({
     workflow_type = workflow_type_;
     cause = cause_;
     workflow_id = workflow_id_;
     initiated_event_id = initiated_event_id_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     control = control_;
   }
    : start_child_workflow_execution_failed_event_attributes)

let make_start_timer_failed_event_attributes ~timer_id:(timer_id_ : timer_id)
    ~cause:(cause_ : start_timer_failed_cause)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({
     timer_id = timer_id_;
     cause = cause_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
   }
    : start_timer_failed_event_attributes)

let make_request_cancel_activity_task_failed_event_attributes
    ~activity_id:(activity_id_ : activity_id)
    ~cause:(cause_ : request_cancel_activity_task_failed_cause)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({
     activity_id = activity_id_;
     cause = cause_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
   }
    : request_cancel_activity_task_failed_event_attributes)

let make_schedule_activity_task_failed_event_attributes
    ~activity_type:(activity_type_ : activity_type) ~activity_id:(activity_id_ : activity_id)
    ~cause:(cause_ : schedule_activity_task_failed_cause)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({
     activity_type = activity_type_;
     activity_id = activity_id_;
     cause = cause_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
   }
    : schedule_activity_task_failed_event_attributes)

let make_request_cancel_external_workflow_execution_failed_event_attributes
    ?run_id:(run_id_ : workflow_run_id_optional option) ?control:(control_ : data option)
    ~workflow_id:(workflow_id_ : workflow_id)
    ~cause:(cause_ : request_cancel_external_workflow_execution_failed_cause)
    ~initiated_event_id:(initiated_event_id_ : event_id)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({
     workflow_id = workflow_id_;
     run_id = run_id_;
     cause = cause_;
     initiated_event_id = initiated_event_id_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     control = control_;
   }
    : request_cancel_external_workflow_execution_failed_event_attributes)

let make_request_cancel_external_workflow_execution_initiated_event_attributes
    ?run_id:(run_id_ : workflow_run_id_optional option) ?control:(control_ : data option)
    ~workflow_id:(workflow_id_ : workflow_id)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({
     workflow_id = workflow_id_;
     run_id = run_id_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     control = control_;
   }
    : request_cancel_external_workflow_execution_initiated_event_attributes)

let make_external_workflow_execution_cancel_requested_event_attributes
    ~workflow_execution:(workflow_execution_ : workflow_execution)
    ~initiated_event_id:(initiated_event_id_ : event_id) () =
  ({ workflow_execution = workflow_execution_; initiated_event_id = initiated_event_id_ }
    : external_workflow_execution_cancel_requested_event_attributes)

let make_signal_external_workflow_execution_failed_event_attributes
    ?run_id:(run_id_ : workflow_run_id_optional option) ?control:(control_ : data option)
    ~workflow_id:(workflow_id_ : workflow_id)
    ~cause:(cause_ : signal_external_workflow_execution_failed_cause)
    ~initiated_event_id:(initiated_event_id_ : event_id)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({
     workflow_id = workflow_id_;
     run_id = run_id_;
     cause = cause_;
     initiated_event_id = initiated_event_id_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     control = control_;
   }
    : signal_external_workflow_execution_failed_event_attributes)

let make_external_workflow_execution_signaled_event_attributes
    ~workflow_execution:(workflow_execution_ : workflow_execution)
    ~initiated_event_id:(initiated_event_id_ : event_id) () =
  ({ workflow_execution = workflow_execution_; initiated_event_id = initiated_event_id_ }
    : external_workflow_execution_signaled_event_attributes)

let make_signal_external_workflow_execution_initiated_event_attributes
    ?run_id:(run_id_ : workflow_run_id_optional option) ?input:(input_ : data option)
    ?control:(control_ : data option) ~workflow_id:(workflow_id_ : workflow_id)
    ~signal_name:(signal_name_ : signal_name)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({
     workflow_id = workflow_id_;
     run_id = run_id_;
     signal_name = signal_name_;
     input = input_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     control = control_;
   }
    : signal_external_workflow_execution_initiated_event_attributes)

let make_start_child_workflow_execution_initiated_event_attributes ?control:(control_ : data option)
    ?input:(input_ : data option)
    ?execution_start_to_close_timeout:
      (execution_start_to_close_timeout_ : duration_in_seconds_optional option)
    ?task_priority:(task_priority_ : task_priority option)
    ?task_start_to_close_timeout:
      (task_start_to_close_timeout_ : duration_in_seconds_optional option)
    ?tag_list:(tag_list_ : tag_list option) ?lambda_role:(lambda_role_ : arn option)
    ~workflow_id:(workflow_id_ : workflow_id) ~workflow_type:(workflow_type_ : workflow_type)
    ~task_list:(task_list_ : task_list)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id)
    ~child_policy:(child_policy_ : child_policy) () =
  ({
     workflow_id = workflow_id_;
     workflow_type = workflow_type_;
     control = control_;
     input = input_;
     execution_start_to_close_timeout = execution_start_to_close_timeout_;
     task_list = task_list_;
     task_priority = task_priority_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     child_policy = child_policy_;
     task_start_to_close_timeout = task_start_to_close_timeout_;
     tag_list = tag_list_;
     lambda_role = lambda_role_;
   }
    : start_child_workflow_execution_initiated_event_attributes)

let make_timer_canceled_event_attributes ~timer_id:(timer_id_ : timer_id)
    ~started_event_id:(started_event_id_ : event_id)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({
     timer_id = timer_id_;
     started_event_id = started_event_id_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
   }
    : timer_canceled_event_attributes)

let make_timer_fired_event_attributes ~timer_id:(timer_id_ : timer_id)
    ~started_event_id:(started_event_id_ : event_id) () =
  ({ timer_id = timer_id_; started_event_id = started_event_id_ } : timer_fired_event_attributes)

let make_timer_started_event_attributes ?control:(control_ : data option)
    ~timer_id:(timer_id_ : timer_id)
    ~start_to_fire_timeout:(start_to_fire_timeout_ : duration_in_seconds)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({
     timer_id = timer_id_;
     control = control_;
     start_to_fire_timeout = start_to_fire_timeout_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
   }
    : timer_started_event_attributes)

let make_record_marker_failed_event_attributes ~marker_name:(marker_name_ : marker_name)
    ~cause:(cause_ : record_marker_failed_cause)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({
     marker_name = marker_name_;
     cause = cause_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
   }
    : record_marker_failed_event_attributes)

let make_marker_recorded_event_attributes ?details:(details_ : data option)
    ~marker_name:(marker_name_ : marker_name)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({
     marker_name = marker_name_;
     details = details_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
   }
    : marker_recorded_event_attributes)

let make_workflow_execution_signaled_event_attributes ?input:(input_ : data option)
    ?external_workflow_execution:(external_workflow_execution_ : workflow_execution option)
    ?external_initiated_event_id:(external_initiated_event_id_ : event_id option)
    ~signal_name:(signal_name_ : signal_name) () =
  ({
     signal_name = signal_name_;
     input = input_;
     external_workflow_execution = external_workflow_execution_;
     external_initiated_event_id = external_initiated_event_id_;
   }
    : workflow_execution_signaled_event_attributes)

let make_decision_task_timed_out_event_attributes
    ~timeout_type:(timeout_type_ : decision_task_timeout_type)
    ~scheduled_event_id:(scheduled_event_id_ : event_id)
    ~started_event_id:(started_event_id_ : event_id) () =
  ({
     timeout_type = timeout_type_;
     scheduled_event_id = scheduled_event_id_;
     started_event_id = started_event_id_;
   }
    : decision_task_timed_out_event_attributes)

let make_decision_task_completed_event_attributes
    ?execution_context:(execution_context_ : data option) ?task_list:(task_list_ : task_list option)
    ?task_list_schedule_to_start_timeout:
      (task_list_schedule_to_start_timeout_ : duration_in_seconds_optional option)
    ~scheduled_event_id:(scheduled_event_id_ : event_id)
    ~started_event_id:(started_event_id_ : event_id) () =
  ({
     execution_context = execution_context_;
     scheduled_event_id = scheduled_event_id_;
     started_event_id = started_event_id_;
     task_list = task_list_;
     task_list_schedule_to_start_timeout = task_list_schedule_to_start_timeout_;
   }
    : decision_task_completed_event_attributes)

let make_decision_task_started_event_attributes ?identity:(identity_ : identity option)
    ~scheduled_event_id:(scheduled_event_id_ : event_id) () =
  ({ identity = identity_; scheduled_event_id = scheduled_event_id_ }
    : decision_task_started_event_attributes)

let make_decision_task_scheduled_event_attributes
    ?task_priority:(task_priority_ : task_priority option)
    ?start_to_close_timeout:(start_to_close_timeout_ : duration_in_seconds_optional option)
    ?schedule_to_start_timeout:(schedule_to_start_timeout_ : duration_in_seconds_optional option)
    ~task_list:(task_list_ : task_list) () =
  ({
     task_list = task_list_;
     task_priority = task_priority_;
     start_to_close_timeout = start_to_close_timeout_;
     schedule_to_start_timeout = schedule_to_start_timeout_;
   }
    : decision_task_scheduled_event_attributes)

let make_workflow_execution_cancel_requested_event_attributes
    ?external_workflow_execution:(external_workflow_execution_ : workflow_execution option)
    ?external_initiated_event_id:(external_initiated_event_id_ : event_id option)
    ?cause:(cause_ : workflow_execution_cancel_requested_cause option) () =
  ({
     external_workflow_execution = external_workflow_execution_;
     external_initiated_event_id = external_initiated_event_id_;
     cause = cause_;
   }
    : workflow_execution_cancel_requested_event_attributes)

let make_workflow_execution_terminated_event_attributes ?reason:(reason_ : terminate_reason option)
    ?details:(details_ : data option) ?cause:(cause_ : workflow_execution_terminated_cause option)
    ~child_policy:(child_policy_ : child_policy) () =
  ({ reason = reason_; details = details_; child_policy = child_policy_; cause = cause_ }
    : workflow_execution_terminated_event_attributes)

let make_workflow_execution_continued_as_new_event_attributes ?input:(input_ : data option)
    ?execution_start_to_close_timeout:
      (execution_start_to_close_timeout_ : duration_in_seconds_optional option)
    ?task_priority:(task_priority_ : task_priority option)
    ?task_start_to_close_timeout:
      (task_start_to_close_timeout_ : duration_in_seconds_optional option)
    ?tag_list:(tag_list_ : tag_list option) ?lambda_role:(lambda_role_ : arn option)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id)
    ~new_execution_run_id:(new_execution_run_id_ : workflow_run_id)
    ~task_list:(task_list_ : task_list) ~child_policy:(child_policy_ : child_policy)
    ~workflow_type:(workflow_type_ : workflow_type) () =
  ({
     input = input_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     new_execution_run_id = new_execution_run_id_;
     execution_start_to_close_timeout = execution_start_to_close_timeout_;
     task_list = task_list_;
     task_priority = task_priority_;
     task_start_to_close_timeout = task_start_to_close_timeout_;
     child_policy = child_policy_;
     tag_list = tag_list_;
     workflow_type = workflow_type_;
     lambda_role = lambda_role_;
   }
    : workflow_execution_continued_as_new_event_attributes)

let make_workflow_execution_canceled_event_attributes ?details:(details_ : data option)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({ details = details_; decision_task_completed_event_id = decision_task_completed_event_id_ }
    : workflow_execution_canceled_event_attributes)

let make_workflow_execution_timed_out_event_attributes
    ~timeout_type:(timeout_type_ : workflow_execution_timeout_type)
    ~child_policy:(child_policy_ : child_policy) () =
  ({ timeout_type = timeout_type_; child_policy = child_policy_ }
    : workflow_execution_timed_out_event_attributes)

let make_fail_workflow_execution_failed_event_attributes
    ~cause:(cause_ : fail_workflow_execution_failed_cause)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({ cause = cause_; decision_task_completed_event_id = decision_task_completed_event_id_ }
    : fail_workflow_execution_failed_event_attributes)

let make_workflow_execution_failed_event_attributes ?reason:(reason_ : failure_reason option)
    ?details:(details_ : data option)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({
     reason = reason_;
     details = details_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
   }
    : workflow_execution_failed_event_attributes)

let make_workflow_execution_completed_event_attributes ?result_:(result__ : data option)
    ~decision_task_completed_event_id:(decision_task_completed_event_id_ : event_id) () =
  ({ result_ = result__; decision_task_completed_event_id = decision_task_completed_event_id_ }
    : workflow_execution_completed_event_attributes)

let make_workflow_execution_started_event_attributes ?input:(input_ : data option)
    ?execution_start_to_close_timeout:
      (execution_start_to_close_timeout_ : duration_in_seconds_optional option)
    ?task_start_to_close_timeout:
      (task_start_to_close_timeout_ : duration_in_seconds_optional option)
    ?task_priority:(task_priority_ : task_priority option) ?tag_list:(tag_list_ : tag_list option)
    ?continued_execution_run_id:(continued_execution_run_id_ : workflow_run_id_optional option)
    ?parent_workflow_execution:(parent_workflow_execution_ : workflow_execution option)
    ?parent_initiated_event_id:(parent_initiated_event_id_ : event_id option)
    ?lambda_role:(lambda_role_ : arn option) ~child_policy:(child_policy_ : child_policy)
    ~task_list:(task_list_ : task_list) ~workflow_type:(workflow_type_ : workflow_type) () =
  ({
     input = input_;
     execution_start_to_close_timeout = execution_start_to_close_timeout_;
     task_start_to_close_timeout = task_start_to_close_timeout_;
     child_policy = child_policy_;
     task_list = task_list_;
     task_priority = task_priority_;
     workflow_type = workflow_type_;
     tag_list = tag_list_;
     continued_execution_run_id = continued_execution_run_id_;
     parent_workflow_execution = parent_workflow_execution_;
     parent_initiated_event_id = parent_initiated_event_id_;
     lambda_role = lambda_role_;
   }
    : workflow_execution_started_event_attributes)

let make_history_event
    ?workflow_execution_started_event_attributes:
      (workflow_execution_started_event_attributes_ :
         workflow_execution_started_event_attributes option)
    ?workflow_execution_completed_event_attributes:
      (workflow_execution_completed_event_attributes_ :
         workflow_execution_completed_event_attributes option)
    ?complete_workflow_execution_failed_event_attributes:
      (complete_workflow_execution_failed_event_attributes_ :
         complete_workflow_execution_failed_event_attributes option)
    ?workflow_execution_failed_event_attributes:
      (workflow_execution_failed_event_attributes_ :
         workflow_execution_failed_event_attributes option)
    ?fail_workflow_execution_failed_event_attributes:
      (fail_workflow_execution_failed_event_attributes_ :
         fail_workflow_execution_failed_event_attributes option)
    ?workflow_execution_timed_out_event_attributes:
      (workflow_execution_timed_out_event_attributes_ :
         workflow_execution_timed_out_event_attributes option)
    ?workflow_execution_canceled_event_attributes:
      (workflow_execution_canceled_event_attributes_ :
         workflow_execution_canceled_event_attributes option)
    ?cancel_workflow_execution_failed_event_attributes:
      (cancel_workflow_execution_failed_event_attributes_ :
         cancel_workflow_execution_failed_event_attributes option)
    ?workflow_execution_continued_as_new_event_attributes:
      (workflow_execution_continued_as_new_event_attributes_ :
         workflow_execution_continued_as_new_event_attributes option)
    ?continue_as_new_workflow_execution_failed_event_attributes:
      (continue_as_new_workflow_execution_failed_event_attributes_ :
         continue_as_new_workflow_execution_failed_event_attributes option)
    ?workflow_execution_terminated_event_attributes:
      (workflow_execution_terminated_event_attributes_ :
         workflow_execution_terminated_event_attributes option)
    ?workflow_execution_cancel_requested_event_attributes:
      (workflow_execution_cancel_requested_event_attributes_ :
         workflow_execution_cancel_requested_event_attributes option)
    ?decision_task_scheduled_event_attributes:
      (decision_task_scheduled_event_attributes_ : decision_task_scheduled_event_attributes option)
    ?decision_task_started_event_attributes:
      (decision_task_started_event_attributes_ : decision_task_started_event_attributes option)
    ?decision_task_completed_event_attributes:
      (decision_task_completed_event_attributes_ : decision_task_completed_event_attributes option)
    ?decision_task_timed_out_event_attributes:
      (decision_task_timed_out_event_attributes_ : decision_task_timed_out_event_attributes option)
    ?activity_task_scheduled_event_attributes:
      (activity_task_scheduled_event_attributes_ : activity_task_scheduled_event_attributes option)
    ?activity_task_started_event_attributes:
      (activity_task_started_event_attributes_ : activity_task_started_event_attributes option)
    ?activity_task_completed_event_attributes:
      (activity_task_completed_event_attributes_ : activity_task_completed_event_attributes option)
    ?activity_task_failed_event_attributes:
      (activity_task_failed_event_attributes_ : activity_task_failed_event_attributes option)
    ?activity_task_timed_out_event_attributes:
      (activity_task_timed_out_event_attributes_ : activity_task_timed_out_event_attributes option)
    ?activity_task_canceled_event_attributes:
      (activity_task_canceled_event_attributes_ : activity_task_canceled_event_attributes option)
    ?activity_task_cancel_requested_event_attributes:
      (activity_task_cancel_requested_event_attributes_ :
         activity_task_cancel_requested_event_attributes option)
    ?workflow_execution_signaled_event_attributes:
      (workflow_execution_signaled_event_attributes_ :
         workflow_execution_signaled_event_attributes option)
    ?marker_recorded_event_attributes:
      (marker_recorded_event_attributes_ : marker_recorded_event_attributes option)
    ?record_marker_failed_event_attributes:
      (record_marker_failed_event_attributes_ : record_marker_failed_event_attributes option)
    ?timer_started_event_attributes:
      (timer_started_event_attributes_ : timer_started_event_attributes option)
    ?timer_fired_event_attributes:
      (timer_fired_event_attributes_ : timer_fired_event_attributes option)
    ?timer_canceled_event_attributes:
      (timer_canceled_event_attributes_ : timer_canceled_event_attributes option)
    ?start_child_workflow_execution_initiated_event_attributes:
      (start_child_workflow_execution_initiated_event_attributes_ :
         start_child_workflow_execution_initiated_event_attributes option)
    ?child_workflow_execution_started_event_attributes:
      (child_workflow_execution_started_event_attributes_ :
         child_workflow_execution_started_event_attributes option)
    ?child_workflow_execution_completed_event_attributes:
      (child_workflow_execution_completed_event_attributes_ :
         child_workflow_execution_completed_event_attributes option)
    ?child_workflow_execution_failed_event_attributes:
      (child_workflow_execution_failed_event_attributes_ :
         child_workflow_execution_failed_event_attributes option)
    ?child_workflow_execution_timed_out_event_attributes:
      (child_workflow_execution_timed_out_event_attributes_ :
         child_workflow_execution_timed_out_event_attributes option)
    ?child_workflow_execution_canceled_event_attributes:
      (child_workflow_execution_canceled_event_attributes_ :
         child_workflow_execution_canceled_event_attributes option)
    ?child_workflow_execution_terminated_event_attributes:
      (child_workflow_execution_terminated_event_attributes_ :
         child_workflow_execution_terminated_event_attributes option)
    ?signal_external_workflow_execution_initiated_event_attributes:
      (signal_external_workflow_execution_initiated_event_attributes_ :
         signal_external_workflow_execution_initiated_event_attributes option)
    ?external_workflow_execution_signaled_event_attributes:
      (external_workflow_execution_signaled_event_attributes_ :
         external_workflow_execution_signaled_event_attributes option)
    ?signal_external_workflow_execution_failed_event_attributes:
      (signal_external_workflow_execution_failed_event_attributes_ :
         signal_external_workflow_execution_failed_event_attributes option)
    ?external_workflow_execution_cancel_requested_event_attributes:
      (external_workflow_execution_cancel_requested_event_attributes_ :
         external_workflow_execution_cancel_requested_event_attributes option)
    ?request_cancel_external_workflow_execution_initiated_event_attributes:
      (request_cancel_external_workflow_execution_initiated_event_attributes_ :
         request_cancel_external_workflow_execution_initiated_event_attributes option)
    ?request_cancel_external_workflow_execution_failed_event_attributes:
      (request_cancel_external_workflow_execution_failed_event_attributes_ :
         request_cancel_external_workflow_execution_failed_event_attributes option)
    ?schedule_activity_task_failed_event_attributes:
      (schedule_activity_task_failed_event_attributes_ :
         schedule_activity_task_failed_event_attributes option)
    ?request_cancel_activity_task_failed_event_attributes:
      (request_cancel_activity_task_failed_event_attributes_ :
         request_cancel_activity_task_failed_event_attributes option)
    ?start_timer_failed_event_attributes:
      (start_timer_failed_event_attributes_ : start_timer_failed_event_attributes option)
    ?cancel_timer_failed_event_attributes:
      (cancel_timer_failed_event_attributes_ : cancel_timer_failed_event_attributes option)
    ?start_child_workflow_execution_failed_event_attributes:
      (start_child_workflow_execution_failed_event_attributes_ :
         start_child_workflow_execution_failed_event_attributes option)
    ?lambda_function_scheduled_event_attributes:
      (lambda_function_scheduled_event_attributes_ :
         lambda_function_scheduled_event_attributes option)
    ?lambda_function_started_event_attributes:
      (lambda_function_started_event_attributes_ : lambda_function_started_event_attributes option)
    ?lambda_function_completed_event_attributes:
      (lambda_function_completed_event_attributes_ :
         lambda_function_completed_event_attributes option)
    ?lambda_function_failed_event_attributes:
      (lambda_function_failed_event_attributes_ : lambda_function_failed_event_attributes option)
    ?lambda_function_timed_out_event_attributes:
      (lambda_function_timed_out_event_attributes_ :
         lambda_function_timed_out_event_attributes option)
    ?schedule_lambda_function_failed_event_attributes:
      (schedule_lambda_function_failed_event_attributes_ :
         schedule_lambda_function_failed_event_attributes option)
    ?start_lambda_function_failed_event_attributes:
      (start_lambda_function_failed_event_attributes_ :
         start_lambda_function_failed_event_attributes option)
    ~event_timestamp:(event_timestamp_ : timestamp) ~event_type:(event_type_ : event_type)
    ~event_id:(event_id_ : event_id) () =
  ({
     event_timestamp = event_timestamp_;
     event_type = event_type_;
     event_id = event_id_;
     workflow_execution_started_event_attributes = workflow_execution_started_event_attributes_;
     workflow_execution_completed_event_attributes = workflow_execution_completed_event_attributes_;
     complete_workflow_execution_failed_event_attributes =
       complete_workflow_execution_failed_event_attributes_;
     workflow_execution_failed_event_attributes = workflow_execution_failed_event_attributes_;
     fail_workflow_execution_failed_event_attributes =
       fail_workflow_execution_failed_event_attributes_;
     workflow_execution_timed_out_event_attributes = workflow_execution_timed_out_event_attributes_;
     workflow_execution_canceled_event_attributes = workflow_execution_canceled_event_attributes_;
     cancel_workflow_execution_failed_event_attributes =
       cancel_workflow_execution_failed_event_attributes_;
     workflow_execution_continued_as_new_event_attributes =
       workflow_execution_continued_as_new_event_attributes_;
     continue_as_new_workflow_execution_failed_event_attributes =
       continue_as_new_workflow_execution_failed_event_attributes_;
     workflow_execution_terminated_event_attributes =
       workflow_execution_terminated_event_attributes_;
     workflow_execution_cancel_requested_event_attributes =
       workflow_execution_cancel_requested_event_attributes_;
     decision_task_scheduled_event_attributes = decision_task_scheduled_event_attributes_;
     decision_task_started_event_attributes = decision_task_started_event_attributes_;
     decision_task_completed_event_attributes = decision_task_completed_event_attributes_;
     decision_task_timed_out_event_attributes = decision_task_timed_out_event_attributes_;
     activity_task_scheduled_event_attributes = activity_task_scheduled_event_attributes_;
     activity_task_started_event_attributes = activity_task_started_event_attributes_;
     activity_task_completed_event_attributes = activity_task_completed_event_attributes_;
     activity_task_failed_event_attributes = activity_task_failed_event_attributes_;
     activity_task_timed_out_event_attributes = activity_task_timed_out_event_attributes_;
     activity_task_canceled_event_attributes = activity_task_canceled_event_attributes_;
     activity_task_cancel_requested_event_attributes =
       activity_task_cancel_requested_event_attributes_;
     workflow_execution_signaled_event_attributes = workflow_execution_signaled_event_attributes_;
     marker_recorded_event_attributes = marker_recorded_event_attributes_;
     record_marker_failed_event_attributes = record_marker_failed_event_attributes_;
     timer_started_event_attributes = timer_started_event_attributes_;
     timer_fired_event_attributes = timer_fired_event_attributes_;
     timer_canceled_event_attributes = timer_canceled_event_attributes_;
     start_child_workflow_execution_initiated_event_attributes =
       start_child_workflow_execution_initiated_event_attributes_;
     child_workflow_execution_started_event_attributes =
       child_workflow_execution_started_event_attributes_;
     child_workflow_execution_completed_event_attributes =
       child_workflow_execution_completed_event_attributes_;
     child_workflow_execution_failed_event_attributes =
       child_workflow_execution_failed_event_attributes_;
     child_workflow_execution_timed_out_event_attributes =
       child_workflow_execution_timed_out_event_attributes_;
     child_workflow_execution_canceled_event_attributes =
       child_workflow_execution_canceled_event_attributes_;
     child_workflow_execution_terminated_event_attributes =
       child_workflow_execution_terminated_event_attributes_;
     signal_external_workflow_execution_initiated_event_attributes =
       signal_external_workflow_execution_initiated_event_attributes_;
     external_workflow_execution_signaled_event_attributes =
       external_workflow_execution_signaled_event_attributes_;
     signal_external_workflow_execution_failed_event_attributes =
       signal_external_workflow_execution_failed_event_attributes_;
     external_workflow_execution_cancel_requested_event_attributes =
       external_workflow_execution_cancel_requested_event_attributes_;
     request_cancel_external_workflow_execution_initiated_event_attributes =
       request_cancel_external_workflow_execution_initiated_event_attributes_;
     request_cancel_external_workflow_execution_failed_event_attributes =
       request_cancel_external_workflow_execution_failed_event_attributes_;
     schedule_activity_task_failed_event_attributes =
       schedule_activity_task_failed_event_attributes_;
     request_cancel_activity_task_failed_event_attributes =
       request_cancel_activity_task_failed_event_attributes_;
     start_timer_failed_event_attributes = start_timer_failed_event_attributes_;
     cancel_timer_failed_event_attributes = cancel_timer_failed_event_attributes_;
     start_child_workflow_execution_failed_event_attributes =
       start_child_workflow_execution_failed_event_attributes_;
     lambda_function_scheduled_event_attributes = lambda_function_scheduled_event_attributes_;
     lambda_function_started_event_attributes = lambda_function_started_event_attributes_;
     lambda_function_completed_event_attributes = lambda_function_completed_event_attributes_;
     lambda_function_failed_event_attributes = lambda_function_failed_event_attributes_;
     lambda_function_timed_out_event_attributes = lambda_function_timed_out_event_attributes_;
     schedule_lambda_function_failed_event_attributes =
       schedule_lambda_function_failed_event_attributes_;
     start_lambda_function_failed_event_attributes = start_lambda_function_failed_event_attributes_;
   }
    : history_event)

let make_decision_task ?next_page_token:(next_page_token_ : page_token option)
    ?previous_started_event_id:(previous_started_event_id_ : event_id option)
    ~task_token:(task_token_ : task_token) ~started_event_id:(started_event_id_ : event_id)
    ~workflow_execution:(workflow_execution_ : workflow_execution)
    ~workflow_type:(workflow_type_ : workflow_type) ~events:(events_ : history_event_list) () =
  ({
     task_token = task_token_;
     started_event_id = started_event_id_;
     workflow_execution = workflow_execution_;
     workflow_type = workflow_type_;
     events = events_;
     next_page_token = next_page_token_;
     previous_started_event_id = previous_started_event_id_;
   }
    : decision_task)

let make_delete_activity_type_input ~domain:(domain_ : domain_name)
    ~activity_type:(activity_type_ : activity_type) () =
  ({ domain = domain_; activity_type = activity_type_ } : delete_activity_type_input)

let make_delete_workflow_type_input ~domain:(domain_ : domain_name)
    ~workflow_type:(workflow_type_ : workflow_type) () =
  ({ domain = domain_; workflow_type = workflow_type_ } : delete_workflow_type_input)

let make_deprecate_activity_type_input ~domain:(domain_ : domain_name)
    ~activity_type:(activity_type_ : activity_type) () =
  ({ domain = domain_; activity_type = activity_type_ } : deprecate_activity_type_input)

let make_deprecate_domain_input ~name:(name_ : domain_name) () =
  ({ name = name_ } : deprecate_domain_input)

let make_deprecate_workflow_type_input ~domain:(domain_ : domain_name)
    ~workflow_type:(workflow_type_ : workflow_type) () =
  ({ domain = domain_; workflow_type = workflow_type_ } : deprecate_workflow_type_input)

let make_describe_activity_type_input ~domain:(domain_ : domain_name)
    ~activity_type:(activity_type_ : activity_type) () =
  ({ domain = domain_; activity_type = activity_type_ } : describe_activity_type_input)

let make_domain_configuration
    ~workflow_execution_retention_period_in_days:
      (workflow_execution_retention_period_in_days_ : duration_in_days) () =
  ({ workflow_execution_retention_period_in_days = workflow_execution_retention_period_in_days_ }
    : domain_configuration)

let make_domain_info ?description:(description_ : description option) ?arn:(arn_ : arn option)
    ~name:(name_ : domain_name) ~status:(status_ : registration_status) () =
  ({ name = name_; status = status_; description = description_; arn = arn_ } : domain_info)

let make_domain_detail ~domain_info:(domain_info_ : domain_info)
    ~configuration:(configuration_ : domain_configuration) () =
  ({ domain_info = domain_info_; configuration = configuration_ } : domain_detail)

let make_describe_domain_input ~name:(name_ : domain_name) () =
  ({ name = name_ } : describe_domain_input)

let make_workflow_execution_open_counts
    ?open_lambda_functions:(open_lambda_functions_ : count option)
    ~open_activity_tasks:(open_activity_tasks_ : count)
    ~open_decision_tasks:(open_decision_tasks_ : open_decision_tasks_count)
    ~open_timers:(open_timers_ : count)
    ~open_child_workflow_executions:(open_child_workflow_executions_ : count) () =
  ({
     open_activity_tasks = open_activity_tasks_;
     open_decision_tasks = open_decision_tasks_;
     open_timers = open_timers_;
     open_child_workflow_executions = open_child_workflow_executions_;
     open_lambda_functions = open_lambda_functions_;
   }
    : workflow_execution_open_counts)

let make_workflow_execution_configuration ?task_priority:(task_priority_ : task_priority option)
    ?lambda_role:(lambda_role_ : arn option)
    ~task_start_to_close_timeout:(task_start_to_close_timeout_ : duration_in_seconds)
    ~execution_start_to_close_timeout:(execution_start_to_close_timeout_ : duration_in_seconds)
    ~task_list:(task_list_ : task_list) ~child_policy:(child_policy_ : child_policy) () =
  ({
     task_start_to_close_timeout = task_start_to_close_timeout_;
     execution_start_to_close_timeout = execution_start_to_close_timeout_;
     task_list = task_list_;
     task_priority = task_priority_;
     child_policy = child_policy_;
     lambda_role = lambda_role_;
   }
    : workflow_execution_configuration)

let make_workflow_execution_info ?close_timestamp:(close_timestamp_ : timestamp option)
    ?close_status:(close_status_ : close_status option)
    ?parent:(parent_ : workflow_execution option) ?tag_list:(tag_list_ : tag_list option)
    ?cancel_requested:(cancel_requested_ : canceled option)
    ~execution:(execution_ : workflow_execution) ~workflow_type:(workflow_type_ : workflow_type)
    ~start_timestamp:(start_timestamp_ : timestamp)
    ~execution_status:(execution_status_ : execution_status) () =
  ({
     execution = execution_;
     workflow_type = workflow_type_;
     start_timestamp = start_timestamp_;
     close_timestamp = close_timestamp_;
     execution_status = execution_status_;
     close_status = close_status_;
     parent = parent_;
     tag_list = tag_list_;
     cancel_requested = cancel_requested_;
   }
    : workflow_execution_info)

let make_workflow_execution_detail
    ?latest_activity_task_timestamp:(latest_activity_task_timestamp_ : timestamp option)
    ?latest_execution_context:(latest_execution_context_ : data option)
    ~execution_info:(execution_info_ : workflow_execution_info)
    ~execution_configuration:(execution_configuration_ : workflow_execution_configuration)
    ~open_counts:(open_counts_ : workflow_execution_open_counts) () =
  ({
     execution_info = execution_info_;
     execution_configuration = execution_configuration_;
     open_counts = open_counts_;
     latest_activity_task_timestamp = latest_activity_task_timestamp_;
     latest_execution_context = latest_execution_context_;
   }
    : workflow_execution_detail)

let make_describe_workflow_execution_input ~domain:(domain_ : domain_name)
    ~execution:(execution_ : workflow_execution) () =
  ({ domain = domain_; execution = execution_ } : describe_workflow_execution_input)

let make_workflow_type_configuration
    ?default_task_start_to_close_timeout:
      (default_task_start_to_close_timeout_ : duration_in_seconds_optional option)
    ?default_execution_start_to_close_timeout:
      (default_execution_start_to_close_timeout_ : duration_in_seconds_optional option)
    ?default_task_list:(default_task_list_ : task_list option)
    ?default_task_priority:(default_task_priority_ : task_priority option)
    ?default_child_policy:(default_child_policy_ : child_policy option)
    ?default_lambda_role:(default_lambda_role_ : arn option) () =
  ({
     default_task_start_to_close_timeout = default_task_start_to_close_timeout_;
     default_execution_start_to_close_timeout = default_execution_start_to_close_timeout_;
     default_task_list = default_task_list_;
     default_task_priority = default_task_priority_;
     default_child_policy = default_child_policy_;
     default_lambda_role = default_lambda_role_;
   }
    : workflow_type_configuration)

let make_workflow_type_info ?description:(description_ : description option)
    ?deprecation_date:(deprecation_date_ : timestamp option)
    ~workflow_type:(workflow_type_ : workflow_type) ~status:(status_ : registration_status)
    ~creation_date:(creation_date_ : timestamp) () =
  ({
     workflow_type = workflow_type_;
     status = status_;
     description = description_;
     creation_date = creation_date_;
     deprecation_date = deprecation_date_;
   }
    : workflow_type_info)

let make_workflow_type_detail ~type_info:(type_info_ : workflow_type_info)
    ~configuration:(configuration_ : workflow_type_configuration) () =
  ({ type_info = type_info_; configuration = configuration_ } : workflow_type_detail)

let make_describe_workflow_type_input ~domain:(domain_ : domain_name)
    ~workflow_type:(workflow_type_ : workflow_type) () =
  ({ domain = domain_; workflow_type = workflow_type_ } : describe_workflow_type_input)

let make_domain_infos ?next_page_token:(next_page_token_ : page_token option)
    ~domain_infos:(domain_infos_ : domain_info_list) () =
  ({ domain_infos = domain_infos_; next_page_token = next_page_token_ } : domain_infos)

let make_history ?next_page_token:(next_page_token_ : page_token option)
    ~events:(events_ : history_event_list) () =
  ({ events = events_; next_page_token = next_page_token_ } : history)

let make_get_workflow_execution_history_input
    ?next_page_token:(next_page_token_ : page_token option)
    ?maximum_page_size:(maximum_page_size_ : page_size option)
    ?reverse_order:(reverse_order_ : reverse_order option) ~domain:(domain_ : domain_name)
    ~execution:(execution_ : workflow_execution) () =
  ({
     domain = domain_;
     execution = execution_;
     next_page_token = next_page_token_;
     maximum_page_size = maximum_page_size_;
     reverse_order = reverse_order_;
   }
    : get_workflow_execution_history_input)

let make_list_activity_types_input ?name:(name_ : name option)
    ?next_page_token:(next_page_token_ : page_token option)
    ?maximum_page_size:(maximum_page_size_ : page_size option)
    ?reverse_order:(reverse_order_ : reverse_order option) ~domain:(domain_ : domain_name)
    ~registration_status:(registration_status_ : registration_status) () =
  ({
     domain = domain_;
     name = name_;
     registration_status = registration_status_;
     next_page_token = next_page_token_;
     maximum_page_size = maximum_page_size_;
     reverse_order = reverse_order_;
   }
    : list_activity_types_input)

let make_workflow_execution_infos ?next_page_token:(next_page_token_ : page_token option)
    ~execution_infos:(execution_infos_ : workflow_execution_info_list) () =
  ({ execution_infos = execution_infos_; next_page_token = next_page_token_ }
    : workflow_execution_infos)

let make_list_closed_workflow_executions_input
    ?start_time_filter:(start_time_filter_ : execution_time_filter option)
    ?close_time_filter:(close_time_filter_ : execution_time_filter option)
    ?execution_filter:(execution_filter_ : workflow_execution_filter option)
    ?close_status_filter:(close_status_filter_ : close_status_filter option)
    ?type_filter:(type_filter_ : workflow_type_filter option)
    ?tag_filter:(tag_filter_ : tag_filter option)
    ?next_page_token:(next_page_token_ : page_token option)
    ?maximum_page_size:(maximum_page_size_ : page_size option)
    ?reverse_order:(reverse_order_ : reverse_order option) ~domain:(domain_ : domain_name) () =
  ({
     domain = domain_;
     start_time_filter = start_time_filter_;
     close_time_filter = close_time_filter_;
     execution_filter = execution_filter_;
     close_status_filter = close_status_filter_;
     type_filter = type_filter_;
     tag_filter = tag_filter_;
     next_page_token = next_page_token_;
     maximum_page_size = maximum_page_size_;
     reverse_order = reverse_order_;
   }
    : list_closed_workflow_executions_input)

let make_list_domains_input ?next_page_token:(next_page_token_ : page_token option)
    ?maximum_page_size:(maximum_page_size_ : page_size option)
    ?reverse_order:(reverse_order_ : reverse_order option)
    ~registration_status:(registration_status_ : registration_status) () =
  ({
     next_page_token = next_page_token_;
     registration_status = registration_status_;
     maximum_page_size = maximum_page_size_;
     reverse_order = reverse_order_;
   }
    : list_domains_input)

let make_list_open_workflow_executions_input
    ?type_filter:(type_filter_ : workflow_type_filter option)
    ?tag_filter:(tag_filter_ : tag_filter option)
    ?next_page_token:(next_page_token_ : page_token option)
    ?maximum_page_size:(maximum_page_size_ : page_size option)
    ?reverse_order:(reverse_order_ : reverse_order option)
    ?execution_filter:(execution_filter_ : workflow_execution_filter option)
    ~domain:(domain_ : domain_name) ~start_time_filter:(start_time_filter_ : execution_time_filter)
    () =
  ({
     domain = domain_;
     start_time_filter = start_time_filter_;
     type_filter = type_filter_;
     tag_filter = tag_filter_;
     next_page_token = next_page_token_;
     maximum_page_size = maximum_page_size_;
     reverse_order = reverse_order_;
     execution_filter = execution_filter_;
   }
    : list_open_workflow_executions_input)

let make_resource_tag ?value:(value_ : resource_tag_value option) ~key:(key_ : resource_tag_key) ()
    =
  ({ key = key_; value = value_ } : resource_tag)

let make_list_tags_for_resource_output ?tags:(tags_ : resource_tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_input)

let make_workflow_type_infos ?next_page_token:(next_page_token_ : page_token option)
    ~type_infos:(type_infos_ : workflow_type_info_list) () =
  ({ type_infos = type_infos_; next_page_token = next_page_token_ } : workflow_type_infos)

let make_list_workflow_types_input ?name:(name_ : name option)
    ?next_page_token:(next_page_token_ : page_token option)
    ?maximum_page_size:(maximum_page_size_ : page_size option)
    ?reverse_order:(reverse_order_ : reverse_order option) ~domain:(domain_ : domain_name)
    ~registration_status:(registration_status_ : registration_status) () =
  ({
     domain = domain_;
     name = name_;
     registration_status = registration_status_;
     next_page_token = next_page_token_;
     maximum_page_size = maximum_page_size_;
     reverse_order = reverse_order_;
   }
    : list_workflow_types_input)

let make_poll_for_activity_task_input ?identity:(identity_ : identity option)
    ~domain:(domain_ : domain_name) ~task_list:(task_list_ : task_list) () =
  ({ domain = domain_; task_list = task_list_; identity = identity_ }
    : poll_for_activity_task_input)

let make_poll_for_decision_task_input ?identity:(identity_ : identity option)
    ?next_page_token:(next_page_token_ : page_token option)
    ?maximum_page_size:(maximum_page_size_ : page_size option)
    ?reverse_order:(reverse_order_ : reverse_order option)
    ?start_at_previous_started_event:
      (start_at_previous_started_event_ : start_at_previous_started_event option)
    ~domain:(domain_ : domain_name) ~task_list:(task_list_ : task_list) () =
  ({
     domain = domain_;
     task_list = task_list_;
     identity = identity_;
     next_page_token = next_page_token_;
     maximum_page_size = maximum_page_size_;
     reverse_order = reverse_order_;
     start_at_previous_started_event = start_at_previous_started_event_;
   }
    : poll_for_decision_task_input)

let make_record_activity_task_heartbeat_input ?details:(details_ : limited_data option)
    ~task_token:(task_token_ : task_token) () =
  ({ task_token = task_token_; details = details_ } : record_activity_task_heartbeat_input)

let make_register_activity_type_input ?description:(description_ : description option)
    ?default_task_start_to_close_timeout:
      (default_task_start_to_close_timeout_ : duration_in_seconds_optional option)
    ?default_task_heartbeat_timeout:
      (default_task_heartbeat_timeout_ : duration_in_seconds_optional option)
    ?default_task_list:(default_task_list_ : task_list option)
    ?default_task_priority:(default_task_priority_ : task_priority option)
    ?default_task_schedule_to_start_timeout:
      (default_task_schedule_to_start_timeout_ : duration_in_seconds_optional option)
    ?default_task_schedule_to_close_timeout:
      (default_task_schedule_to_close_timeout_ : duration_in_seconds_optional option)
    ~domain:(domain_ : domain_name) ~name:(name_ : name) ~version:(version_ : version) () =
  ({
     domain = domain_;
     name = name_;
     version = version_;
     description = description_;
     default_task_start_to_close_timeout = default_task_start_to_close_timeout_;
     default_task_heartbeat_timeout = default_task_heartbeat_timeout_;
     default_task_list = default_task_list_;
     default_task_priority = default_task_priority_;
     default_task_schedule_to_start_timeout = default_task_schedule_to_start_timeout_;
     default_task_schedule_to_close_timeout = default_task_schedule_to_close_timeout_;
   }
    : register_activity_type_input)

let make_register_domain_input ?description:(description_ : description option)
    ?tags:(tags_ : resource_tag_list option) ~name:(name_ : domain_name)
    ~workflow_execution_retention_period_in_days:
      (workflow_execution_retention_period_in_days_ : duration_in_days) () =
  ({
     name = name_;
     description = description_;
     workflow_execution_retention_period_in_days = workflow_execution_retention_period_in_days_;
     tags = tags_;
   }
    : register_domain_input)

let make_register_workflow_type_input ?description:(description_ : description option)
    ?default_task_start_to_close_timeout:
      (default_task_start_to_close_timeout_ : duration_in_seconds_optional option)
    ?default_execution_start_to_close_timeout:
      (default_execution_start_to_close_timeout_ : duration_in_seconds_optional option)
    ?default_task_list:(default_task_list_ : task_list option)
    ?default_task_priority:(default_task_priority_ : task_priority option)
    ?default_child_policy:(default_child_policy_ : child_policy option)
    ?default_lambda_role:(default_lambda_role_ : arn option) ~domain:(domain_ : domain_name)
    ~name:(name_ : name) ~version:(version_ : version) () =
  ({
     domain = domain_;
     name = name_;
     version = version_;
     description = description_;
     default_task_start_to_close_timeout = default_task_start_to_close_timeout_;
     default_execution_start_to_close_timeout = default_execution_start_to_close_timeout_;
     default_task_list = default_task_list_;
     default_task_priority = default_task_priority_;
     default_child_policy = default_child_policy_;
     default_lambda_role = default_lambda_role_;
   }
    : register_workflow_type_input)

let make_request_cancel_workflow_execution_input ?run_id:(run_id_ : workflow_run_id_optional option)
    ~domain:(domain_ : domain_name) ~workflow_id:(workflow_id_ : workflow_id) () =
  ({ domain = domain_; workflow_id = workflow_id_; run_id = run_id_ }
    : request_cancel_workflow_execution_input)

let make_respond_activity_task_canceled_input ?details:(details_ : data option)
    ~task_token:(task_token_ : task_token) () =
  ({ task_token = task_token_; details = details_ } : respond_activity_task_canceled_input)

let make_respond_activity_task_completed_input ?result_:(result__ : data option)
    ~task_token:(task_token_ : task_token) () =
  ({ task_token = task_token_; result_ = result__ } : respond_activity_task_completed_input)

let make_respond_activity_task_failed_input ?reason:(reason_ : failure_reason option)
    ?details:(details_ : data option) ~task_token:(task_token_ : task_token) () =
  ({ task_token = task_token_; reason = reason_; details = details_ }
    : respond_activity_task_failed_input)

let make_respond_decision_task_completed_input ?decisions:(decisions_ : decision_list option)
    ?execution_context:(execution_context_ : data option) ?task_list:(task_list_ : task_list option)
    ?task_list_schedule_to_start_timeout:
      (task_list_schedule_to_start_timeout_ : duration_in_seconds_optional option)
    ~task_token:(task_token_ : task_token) () =
  ({
     task_token = task_token_;
     decisions = decisions_;
     execution_context = execution_context_;
     task_list = task_list_;
     task_list_schedule_to_start_timeout = task_list_schedule_to_start_timeout_;
   }
    : respond_decision_task_completed_input)

let make_run ?run_id:(run_id_ : workflow_run_id option) () = ({ run_id = run_id_ } : run)

let make_signal_workflow_execution_input ?run_id:(run_id_ : workflow_run_id_optional option)
    ?input:(input_ : data option) ~domain:(domain_ : domain_name)
    ~workflow_id:(workflow_id_ : workflow_id) ~signal_name:(signal_name_ : signal_name) () =
  ({
     domain = domain_;
     workflow_id = workflow_id_;
     run_id = run_id_;
     signal_name = signal_name_;
     input = input_;
   }
    : signal_workflow_execution_input)

let make_untag_resource_input ~resource_arn:(resource_arn_ : arn)
    ~tag_keys:(tag_keys_ : resource_tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_input)

let make_undeprecate_workflow_type_input ~domain:(domain_ : domain_name)
    ~workflow_type:(workflow_type_ : workflow_type) () =
  ({ domain = domain_; workflow_type = workflow_type_ } : undeprecate_workflow_type_input)

let make_undeprecate_domain_input ~name:(name_ : domain_name) () =
  ({ name = name_ } : undeprecate_domain_input)

let make_undeprecate_activity_type_input ~domain:(domain_ : domain_name)
    ~activity_type:(activity_type_ : activity_type) () =
  ({ domain = domain_; activity_type = activity_type_ } : undeprecate_activity_type_input)

let make_terminate_workflow_execution_input ?run_id:(run_id_ : workflow_run_id_optional option)
    ?reason:(reason_ : terminate_reason option) ?details:(details_ : data option)
    ?child_policy:(child_policy_ : child_policy option) ~domain:(domain_ : domain_name)
    ~workflow_id:(workflow_id_ : workflow_id) () =
  ({
     domain = domain_;
     workflow_id = workflow_id_;
     run_id = run_id_;
     reason = reason_;
     details = details_;
     child_policy = child_policy_;
   }
    : terminate_workflow_execution_input)

let make_tag_resource_input ~resource_arn:(resource_arn_ : arn) ~tags:(tags_ : resource_tag_list) ()
    =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_input)

let make_start_workflow_execution_input ?task_list:(task_list_ : task_list option)
    ?task_priority:(task_priority_ : task_priority option) ?input:(input_ : data option)
    ?execution_start_to_close_timeout:
      (execution_start_to_close_timeout_ : duration_in_seconds_optional option)
    ?tag_list:(tag_list_ : tag_list option)
    ?task_start_to_close_timeout:
      (task_start_to_close_timeout_ : duration_in_seconds_optional option)
    ?child_policy:(child_policy_ : child_policy option) ?lambda_role:(lambda_role_ : arn option)
    ~domain:(domain_ : domain_name) ~workflow_id:(workflow_id_ : workflow_id)
    ~workflow_type:(workflow_type_ : workflow_type) () =
  ({
     domain = domain_;
     workflow_id = workflow_id_;
     workflow_type = workflow_type_;
     task_list = task_list_;
     task_priority = task_priority_;
     input = input_;
     execution_start_to_close_timeout = execution_start_to_close_timeout_;
     tag_list = tag_list_;
     task_start_to_close_timeout = task_start_to_close_timeout_;
     child_policy = child_policy_;
     lambda_role = lambda_role_;
   }
    : start_workflow_execution_input)
