open Types
let make_workflow_type ~version:(version_ : version) ~name:(name_ : name) ()
  = ({ version = version_; name = name_ } : workflow_type)
let make_workflow_type_info
  ?deprecation_date:(deprecation_date_ : timestamp option)
  ?description:(description_ : description option)
  ~creation_date:(creation_date_ : timestamp)
  ~status:(status_ : registration_status)
  ~workflow_type:(workflow_type_ : workflow_type) () =
  ({
     deprecation_date = deprecation_date_;
     creation_date = creation_date_;
     description = description_;
     status = status_;
     workflow_type = workflow_type_
   } : workflow_type_info)
let make_workflow_type_infos
  ?next_page_token:(next_page_token_ : page_token option)
  ~type_infos:(type_infos_ : workflow_type_info_list) () =
  ({ next_page_token = next_page_token_; type_infos = type_infos_ } : 
  workflow_type_infos)
let make_workflow_type_filter ?version:(version_ : version_optional option)
  ~name:(name_ : name) () =
  ({ version = version_; name = name_ } : workflow_type_filter)
let make_task_list ~name:(name_ : name) () = ({ name = name_ } : task_list)
let make_workflow_type_configuration
  ?default_lambda_role:(default_lambda_role_ : arn option)
  ?default_child_policy:(default_child_policy_ : child_policy option)
  ?default_task_priority:(default_task_priority_ : task_priority option)
  ?default_task_list:(default_task_list_ : task_list option)
  ?default_execution_start_to_close_timeout:(default_execution_start_to_close_timeout_
                                              :
                                              duration_in_seconds_optional
                                                option)
  ?default_task_start_to_close_timeout:(default_task_start_to_close_timeout_
                                         :
                                         duration_in_seconds_optional option)
  () =
  ({
     default_lambda_role = default_lambda_role_;
     default_child_policy = default_child_policy_;
     default_task_priority = default_task_priority_;
     default_task_list = default_task_list_;
     default_execution_start_to_close_timeout =
       default_execution_start_to_close_timeout_;
     default_task_start_to_close_timeout =
       default_task_start_to_close_timeout_
   } : workflow_type_configuration)
let make_workflow_type_detail
  ~configuration:(configuration_ : workflow_type_configuration)
  ~type_info:(type_info_ : workflow_type_info) () =
  ({ configuration = configuration_; type_info = type_info_ } : workflow_type_detail)
let make_workflow_execution_timed_out_event_attributes
  ~child_policy:(child_policy_ : child_policy)
  ~timeout_type:(timeout_type_ : workflow_execution_timeout_type) () =
  ({ child_policy = child_policy_; timeout_type = timeout_type_ } : workflow_execution_timed_out_event_attributes)
let make_workflow_execution_terminated_event_attributes
  ?cause:(cause_ : workflow_execution_terminated_cause option)
  ?details:(details_ : data option)
  ?reason:(reason_ : terminate_reason option)
  ~child_policy:(child_policy_ : child_policy) () =
  ({
     cause = cause_;
     child_policy = child_policy_;
     details = details_;
     reason = reason_
   } : workflow_execution_terminated_event_attributes)
let make_workflow_execution ~run_id:(run_id_ : workflow_run_id)
  ~workflow_id:(workflow_id_ : workflow_id) () =
  ({ run_id = run_id_; workflow_id = workflow_id_ } : workflow_execution)
let make_workflow_execution_started_event_attributes
  ?lambda_role:(lambda_role_ : arn option)
  ?parent_initiated_event_id:(parent_initiated_event_id_ : event_id option)
  ?parent_workflow_execution:(parent_workflow_execution_ :
                               workflow_execution option)
  ?continued_execution_run_id:(continued_execution_run_id_ :
                                workflow_run_id_optional option)
  ?tag_list:(tag_list_ : tag_list option)
  ?task_priority:(task_priority_ : task_priority option)
  ?task_start_to_close_timeout:(task_start_to_close_timeout_ :
                                 duration_in_seconds_optional option)
  ?execution_start_to_close_timeout:(execution_start_to_close_timeout_ :
                                      duration_in_seconds_optional option)
  ?input:(input_ : data option)
  ~workflow_type:(workflow_type_ : workflow_type)
  ~task_list:(task_list_ : task_list)
  ~child_policy:(child_policy_ : child_policy) () =
  ({
     lambda_role = lambda_role_;
     parent_initiated_event_id = parent_initiated_event_id_;
     parent_workflow_execution = parent_workflow_execution_;
     continued_execution_run_id = continued_execution_run_id_;
     tag_list = tag_list_;
     workflow_type = workflow_type_;
     task_priority = task_priority_;
     task_list = task_list_;
     child_policy = child_policy_;
     task_start_to_close_timeout = task_start_to_close_timeout_;
     execution_start_to_close_timeout = execution_start_to_close_timeout_;
     input = input_
   } : workflow_execution_started_event_attributes)
let make_workflow_execution_signaled_event_attributes
  ?external_initiated_event_id:(external_initiated_event_id_ :
                                 event_id option)
  ?external_workflow_execution:(external_workflow_execution_ :
                                 workflow_execution option)
  ?input:(input_ : data option) ~signal_name:(signal_name_ : signal_name) ()
  =
  ({
     external_initiated_event_id = external_initiated_event_id_;
     external_workflow_execution = external_workflow_execution_;
     input = input_;
     signal_name = signal_name_
   } : workflow_execution_signaled_event_attributes)
let make_workflow_execution_open_counts
  ?open_lambda_functions:(open_lambda_functions_ : count option)
  ~open_child_workflow_executions:(open_child_workflow_executions_ : count)
  ~open_timers:(open_timers_ : count)
  ~open_decision_tasks:(open_decision_tasks_ : open_decision_tasks_count)
  ~open_activity_tasks:(open_activity_tasks_ : count) () =
  ({
     open_lambda_functions = open_lambda_functions_;
     open_child_workflow_executions = open_child_workflow_executions_;
     open_timers = open_timers_;
     open_decision_tasks = open_decision_tasks_;
     open_activity_tasks = open_activity_tasks_
   } : workflow_execution_open_counts)
let make_workflow_execution_info
  ?cancel_requested:(cancel_requested_ : canceled option)
  ?tag_list:(tag_list_ : tag_list option)
  ?parent:(parent_ : workflow_execution option)
  ?close_status:(close_status_ : close_status option)
  ?close_timestamp:(close_timestamp_ : timestamp option)
  ~execution_status:(execution_status_ : execution_status)
  ~start_timestamp:(start_timestamp_ : timestamp)
  ~workflow_type:(workflow_type_ : workflow_type)
  ~execution:(execution_ : workflow_execution) () =
  ({
     cancel_requested = cancel_requested_;
     tag_list = tag_list_;
     parent = parent_;
     close_status = close_status_;
     execution_status = execution_status_;
     close_timestamp = close_timestamp_;
     start_timestamp = start_timestamp_;
     workflow_type = workflow_type_;
     execution = execution_
   } : workflow_execution_info)
let make_workflow_execution_infos
  ?next_page_token:(next_page_token_ : page_token option)
  ~execution_infos:(execution_infos_ : workflow_execution_info_list) () =
  ({ next_page_token = next_page_token_; execution_infos = execution_infos_ } : 
  workflow_execution_infos)
let make_workflow_execution_filter ~workflow_id:(workflow_id_ : workflow_id)
  () = ({ workflow_id = workflow_id_ } : workflow_execution_filter)
let make_workflow_execution_failed_event_attributes
  ?details:(details_ : data option) ?reason:(reason_ : failure_reason option)
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     details = details_;
     reason = reason_
   } : workflow_execution_failed_event_attributes)
let make_workflow_execution_configuration
  ?lambda_role:(lambda_role_ : arn option)
  ?task_priority:(task_priority_ : task_priority option)
  ~child_policy:(child_policy_ : child_policy)
  ~task_list:(task_list_ : task_list)
  ~execution_start_to_close_timeout:(execution_start_to_close_timeout_ :
                                      duration_in_seconds)
  ~task_start_to_close_timeout:(task_start_to_close_timeout_ :
                                 duration_in_seconds)
  () =
  ({
     lambda_role = lambda_role_;
     child_policy = child_policy_;
     task_priority = task_priority_;
     task_list = task_list_;
     execution_start_to_close_timeout = execution_start_to_close_timeout_;
     task_start_to_close_timeout = task_start_to_close_timeout_
   } : workflow_execution_configuration)
let make_workflow_execution_detail
  ?latest_execution_context:(latest_execution_context_ : data option)
  ?latest_activity_task_timestamp:(latest_activity_task_timestamp_ :
                                    timestamp option)
  ~open_counts:(open_counts_ : workflow_execution_open_counts)
  ~execution_configuration:(execution_configuration_ :
                             workflow_execution_configuration)
  ~execution_info:(execution_info_ : workflow_execution_info) () =
  ({
     latest_execution_context = latest_execution_context_;
     latest_activity_task_timestamp = latest_activity_task_timestamp_;
     open_counts = open_counts_;
     execution_configuration = execution_configuration_;
     execution_info = execution_info_
   } : workflow_execution_detail)
let make_workflow_execution_count ?truncated:(truncated_ : truncated option)
  ~count:(count_ : count) () =
  ({ truncated = truncated_; count = count_ } : workflow_execution_count)
let make_workflow_execution_continued_as_new_event_attributes
  ?lambda_role:(lambda_role_ : arn option)
  ?tag_list:(tag_list_ : tag_list option)
  ?task_start_to_close_timeout:(task_start_to_close_timeout_ :
                                 duration_in_seconds_optional option)
  ?task_priority:(task_priority_ : task_priority option)
  ?execution_start_to_close_timeout:(execution_start_to_close_timeout_ :
                                      duration_in_seconds_optional option)
  ?input:(input_ : data option)
  ~workflow_type:(workflow_type_ : workflow_type)
  ~child_policy:(child_policy_ : child_policy)
  ~task_list:(task_list_ : task_list)
  ~new_execution_run_id:(new_execution_run_id_ : workflow_run_id)
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  () =
  ({
     lambda_role = lambda_role_;
     workflow_type = workflow_type_;
     tag_list = tag_list_;
     child_policy = child_policy_;
     task_start_to_close_timeout = task_start_to_close_timeout_;
     task_priority = task_priority_;
     task_list = task_list_;
     execution_start_to_close_timeout = execution_start_to_close_timeout_;
     new_execution_run_id = new_execution_run_id_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     input = input_
   } : workflow_execution_continued_as_new_event_attributes)
let make_workflow_execution_completed_event_attributes
  ?result:(result_ : data option)
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     result = result_
   } : workflow_execution_completed_event_attributes)
let make_workflow_execution_canceled_event_attributes
  ?details:(details_ : data option)
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     details = details_
   } : workflow_execution_canceled_event_attributes)
let make_workflow_execution_cancel_requested_event_attributes
  ?cause:(cause_ : workflow_execution_cancel_requested_cause option)
  ?external_initiated_event_id:(external_initiated_event_id_ :
                                 event_id option)
  ?external_workflow_execution:(external_workflow_execution_ :
                                 workflow_execution option)
  () =
  ({
     cause = cause_;
     external_initiated_event_id = external_initiated_event_id_;
     external_workflow_execution = external_workflow_execution_
   } : workflow_execution_cancel_requested_event_attributes)
let make_untag_resource_input ~tag_keys:(tag_keys_ : resource_tag_key_list)
  ~resource_arn:(resource_arn_ : arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_input)
let make_undeprecate_workflow_type_input
  ~workflow_type:(workflow_type_ : workflow_type)
  ~domain:(domain_ : domain_name) () =
  ({ workflow_type = workflow_type_; domain = domain_ } : undeprecate_workflow_type_input)
let make_undeprecate_domain_input ~name:(name_ : domain_name) () =
  ({ name = name_ } : undeprecate_domain_input)
let make_activity_type ~version:(version_ : version) ~name:(name_ : name) ()
  = ({ version = version_; name = name_ } : activity_type)
let make_undeprecate_activity_type_input
  ~activity_type:(activity_type_ : activity_type)
  ~domain:(domain_ : domain_name) () =
  ({ activity_type = activity_type_; domain = domain_ } : undeprecate_activity_type_input)
let make_timer_started_event_attributes ?control:(control_ : data option)
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~start_to_fire_timeout:(start_to_fire_timeout_ : duration_in_seconds)
  ~timer_id:(timer_id_ : timer_id) () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     start_to_fire_timeout = start_to_fire_timeout_;
     control = control_;
     timer_id = timer_id_
   } : timer_started_event_attributes)
let make_timer_fired_event_attributes
  ~started_event_id:(started_event_id_ : event_id)
  ~timer_id:(timer_id_ : timer_id) () =
  ({ started_event_id = started_event_id_; timer_id = timer_id_ } : timer_fired_event_attributes)
let make_timer_canceled_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~started_event_id:(started_event_id_ : event_id)
  ~timer_id:(timer_id_ : timer_id) () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     started_event_id = started_event_id_;
     timer_id = timer_id_
   } : timer_canceled_event_attributes)
let make_terminate_workflow_execution_input
  ?child_policy:(child_policy_ : child_policy option)
  ?details:(details_ : data option)
  ?reason:(reason_ : terminate_reason option)
  ?run_id:(run_id_ : workflow_run_id_optional option)
  ~workflow_id:(workflow_id_ : workflow_id) ~domain:(domain_ : domain_name)
  () =
  ({
     child_policy = child_policy_;
     details = details_;
     reason = reason_;
     run_id = run_id_;
     workflow_id = workflow_id_;
     domain = domain_
   } : terminate_workflow_execution_input)
let make_resource_tag ?value:(value_ : resource_tag_value option)
  ~key:(key_ : resource_tag_key) () =
  ({ value = value_; key = key_ } : resource_tag)
let make_tag_resource_input ~tags:(tags_ : resource_tag_list)
  ~resource_arn:(resource_arn_ : arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_input)
let make_tag_filter ~tag:(tag_ : tag) () = ({ tag = tag_ } : tag_filter)
let make_start_workflow_execution_input
  ?lambda_role:(lambda_role_ : arn option)
  ?child_policy:(child_policy_ : child_policy option)
  ?task_start_to_close_timeout:(task_start_to_close_timeout_ :
                                 duration_in_seconds_optional option)
  ?tag_list:(tag_list_ : tag_list option)
  ?execution_start_to_close_timeout:(execution_start_to_close_timeout_ :
                                      duration_in_seconds_optional option)
  ?input:(input_ : data option)
  ?task_priority:(task_priority_ : task_priority option)
  ?task_list:(task_list_ : task_list option)
  ~workflow_type:(workflow_type_ : workflow_type)
  ~workflow_id:(workflow_id_ : workflow_id) ~domain:(domain_ : domain_name)
  () =
  ({
     lambda_role = lambda_role_;
     child_policy = child_policy_;
     task_start_to_close_timeout = task_start_to_close_timeout_;
     tag_list = tag_list_;
     execution_start_to_close_timeout = execution_start_to_close_timeout_;
     input = input_;
     task_priority = task_priority_;
     task_list = task_list_;
     workflow_type = workflow_type_;
     workflow_id = workflow_id_;
     domain = domain_
   } : start_workflow_execution_input)
let make_run ?run_id:(run_id_ : workflow_run_id option) () =
  ({ run_id = run_id_ } : run)
let make_start_timer_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~cause:(cause_ : start_timer_failed_cause) ~timer_id:(timer_id_ : timer_id)
  () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     cause = cause_;
     timer_id = timer_id_
   } : start_timer_failed_event_attributes)
let make_start_timer_decision_attributes ?control:(control_ : data option)
  ~start_to_fire_timeout:(start_to_fire_timeout_ : duration_in_seconds)
  ~timer_id:(timer_id_ : timer_id) () =
  ({
     start_to_fire_timeout = start_to_fire_timeout_;
     control = control_;
     timer_id = timer_id_
   } : start_timer_decision_attributes)
let make_start_lambda_function_failed_event_attributes
  ?message:(message_ : cause_message option)
  ?cause:(cause_ : start_lambda_function_failed_cause option)
  ?scheduled_event_id:(scheduled_event_id_ : event_id option) () =
  ({
     message = message_;
     cause = cause_;
     scheduled_event_id = scheduled_event_id_
   } : start_lambda_function_failed_event_attributes)
let make_start_child_workflow_execution_initiated_event_attributes
  ?lambda_role:(lambda_role_ : arn option)
  ?tag_list:(tag_list_ : tag_list option)
  ?task_start_to_close_timeout:(task_start_to_close_timeout_ :
                                 duration_in_seconds_optional option)
  ?task_priority:(task_priority_ : task_priority option)
  ?execution_start_to_close_timeout:(execution_start_to_close_timeout_ :
                                      duration_in_seconds_optional option)
  ?input:(input_ : data option) ?control:(control_ : data option)
  ~child_policy:(child_policy_ : child_policy)
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~task_list:(task_list_ : task_list)
  ~workflow_type:(workflow_type_ : workflow_type)
  ~workflow_id:(workflow_id_ : workflow_id) () =
  ({
     lambda_role = lambda_role_;
     tag_list = tag_list_;
     task_start_to_close_timeout = task_start_to_close_timeout_;
     child_policy = child_policy_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     task_priority = task_priority_;
     task_list = task_list_;
     execution_start_to_close_timeout = execution_start_to_close_timeout_;
     input = input_;
     control = control_;
     workflow_type = workflow_type_;
     workflow_id = workflow_id_
   } : start_child_workflow_execution_initiated_event_attributes)
let make_start_child_workflow_execution_failed_event_attributes
  ?control:(control_ : data option)
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~initiated_event_id:(initiated_event_id_ : event_id)
  ~workflow_id:(workflow_id_ : workflow_id)
  ~cause:(cause_ : start_child_workflow_execution_failed_cause)
  ~workflow_type:(workflow_type_ : workflow_type) () =
  ({
     control = control_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     initiated_event_id = initiated_event_id_;
     workflow_id = workflow_id_;
     cause = cause_;
     workflow_type = workflow_type_
   } : start_child_workflow_execution_failed_event_attributes)
let make_start_child_workflow_execution_decision_attributes
  ?lambda_role:(lambda_role_ : arn option)
  ?tag_list:(tag_list_ : tag_list option)
  ?child_policy:(child_policy_ : child_policy option)
  ?task_start_to_close_timeout:(task_start_to_close_timeout_ :
                                 duration_in_seconds_optional option)
  ?task_priority:(task_priority_ : task_priority option)
  ?task_list:(task_list_ : task_list option)
  ?execution_start_to_close_timeout:(execution_start_to_close_timeout_ :
                                      duration_in_seconds_optional option)
  ?input:(input_ : data option) ?control:(control_ : data option)
  ~workflow_id:(workflow_id_ : workflow_id)
  ~workflow_type:(workflow_type_ : workflow_type) () =
  ({
     lambda_role = lambda_role_;
     tag_list = tag_list_;
     child_policy = child_policy_;
     task_start_to_close_timeout = task_start_to_close_timeout_;
     task_priority = task_priority_;
     task_list = task_list_;
     execution_start_to_close_timeout = execution_start_to_close_timeout_;
     input = input_;
     control = control_;
     workflow_id = workflow_id_;
     workflow_type = workflow_type_
   } : start_child_workflow_execution_decision_attributes)
let make_signal_workflow_execution_input ?input:(input_ : data option)
  ?run_id:(run_id_ : workflow_run_id_optional option)
  ~signal_name:(signal_name_ : signal_name)
  ~workflow_id:(workflow_id_ : workflow_id) ~domain:(domain_ : domain_name)
  () =
  ({
     input = input_;
     signal_name = signal_name_;
     run_id = run_id_;
     workflow_id = workflow_id_;
     domain = domain_
   } : signal_workflow_execution_input)
let make_schedule_activity_task_decision_attributes
  ?heartbeat_timeout:(heartbeat_timeout_ :
                       duration_in_seconds_optional option)
  ?start_to_close_timeout:(start_to_close_timeout_ :
                            duration_in_seconds_optional option)
  ?schedule_to_start_timeout:(schedule_to_start_timeout_ :
                               duration_in_seconds_optional option)
  ?task_priority:(task_priority_ : task_priority option)
  ?task_list:(task_list_ : task_list option)
  ?schedule_to_close_timeout:(schedule_to_close_timeout_ :
                               duration_in_seconds_optional option)
  ?input:(input_ : data option) ?control:(control_ : data option)
  ~activity_id:(activity_id_ : activity_id)
  ~activity_type:(activity_type_ : activity_type) () =
  ({
     heartbeat_timeout = heartbeat_timeout_;
     start_to_close_timeout = start_to_close_timeout_;
     schedule_to_start_timeout = schedule_to_start_timeout_;
     task_priority = task_priority_;
     task_list = task_list_;
     schedule_to_close_timeout = schedule_to_close_timeout_;
     input = input_;
     control = control_;
     activity_id = activity_id_;
     activity_type = activity_type_
   } : schedule_activity_task_decision_attributes)
let make_request_cancel_activity_task_decision_attributes
  ~activity_id:(activity_id_ : activity_id) () =
  ({ activity_id = activity_id_ } : request_cancel_activity_task_decision_attributes)
let make_complete_workflow_execution_decision_attributes
  ?result:(result_ : data option) () =
  ({ result = result_ } : complete_workflow_execution_decision_attributes)
let make_fail_workflow_execution_decision_attributes
  ?details:(details_ : data option) ?reason:(reason_ : failure_reason option)
  () =
  ({ details = details_; reason = reason_ } : fail_workflow_execution_decision_attributes)
let make_cancel_workflow_execution_decision_attributes
  ?details:(details_ : data option) () =
  ({ details = details_ } : cancel_workflow_execution_decision_attributes)
let make_continue_as_new_workflow_execution_decision_attributes
  ?lambda_role:(lambda_role_ : arn option)
  ?workflow_type_version:(workflow_type_version_ : version option)
  ?tag_list:(tag_list_ : tag_list option)
  ?child_policy:(child_policy_ : child_policy option)
  ?task_start_to_close_timeout:(task_start_to_close_timeout_ :
                                 duration_in_seconds_optional option)
  ?task_priority:(task_priority_ : task_priority option)
  ?task_list:(task_list_ : task_list option)
  ?execution_start_to_close_timeout:(execution_start_to_close_timeout_ :
                                      duration_in_seconds_optional option)
  ?input:(input_ : data option) () =
  ({
     lambda_role = lambda_role_;
     workflow_type_version = workflow_type_version_;
     tag_list = tag_list_;
     child_policy = child_policy_;
     task_start_to_close_timeout = task_start_to_close_timeout_;
     task_priority = task_priority_;
     task_list = task_list_;
     execution_start_to_close_timeout = execution_start_to_close_timeout_;
     input = input_
   } : continue_as_new_workflow_execution_decision_attributes)
let make_record_marker_decision_attributes ?details:(details_ : data option)
  ~marker_name:(marker_name_ : marker_name) () =
  ({ details = details_; marker_name = marker_name_ } : record_marker_decision_attributes)
let make_cancel_timer_decision_attributes ~timer_id:(timer_id_ : timer_id) ()
  = ({ timer_id = timer_id_ } : cancel_timer_decision_attributes)
let make_signal_external_workflow_execution_decision_attributes
  ?control:(control_ : data option) ?input:(input_ : data option)
  ?run_id:(run_id_ : workflow_run_id_optional option)
  ~signal_name:(signal_name_ : signal_name)
  ~workflow_id:(workflow_id_ : workflow_id) () =
  ({
     control = control_;
     input = input_;
     signal_name = signal_name_;
     run_id = run_id_;
     workflow_id = workflow_id_
   } : signal_external_workflow_execution_decision_attributes)
let make_request_cancel_external_workflow_execution_decision_attributes
  ?control:(control_ : data option)
  ?run_id:(run_id_ : workflow_run_id_optional option)
  ~workflow_id:(workflow_id_ : workflow_id) () =
  ({ control = control_; run_id = run_id_; workflow_id = workflow_id_ } : 
  request_cancel_external_workflow_execution_decision_attributes)
let make_schedule_lambda_function_decision_attributes
  ?start_to_close_timeout:(start_to_close_timeout_ :
                            duration_in_seconds_optional option)
  ?input:(input_ : function_input option) ?control:(control_ : data option)
  ~name:(name_ : function_name) ~id:(id_ : function_id) () =
  ({
     start_to_close_timeout = start_to_close_timeout_;
     input = input_;
     control = control_;
     name = name_;
     id = id_
   } : schedule_lambda_function_decision_attributes)
let make_decision
  ?schedule_lambda_function_decision_attributes:(schedule_lambda_function_decision_attributes_
                                                  :
                                                  schedule_lambda_function_decision_attributes
                                                    option)
  ?start_child_workflow_execution_decision_attributes:(start_child_workflow_execution_decision_attributes_
                                                        :
                                                        start_child_workflow_execution_decision_attributes
                                                          option)
  ?request_cancel_external_workflow_execution_decision_attributes:(request_cancel_external_workflow_execution_decision_attributes_
                                                                    :
                                                                    request_cancel_external_workflow_execution_decision_attributes
                                                                    option)
  ?signal_external_workflow_execution_decision_attributes:(signal_external_workflow_execution_decision_attributes_
                                                            :
                                                            signal_external_workflow_execution_decision_attributes
                                                              option)
  ?cancel_timer_decision_attributes:(cancel_timer_decision_attributes_ :
                                      cancel_timer_decision_attributes option)
  ?start_timer_decision_attributes:(start_timer_decision_attributes_ :
                                     start_timer_decision_attributes option)
  ?record_marker_decision_attributes:(record_marker_decision_attributes_ :
                                       record_marker_decision_attributes
                                         option)
  ?continue_as_new_workflow_execution_decision_attributes:(continue_as_new_workflow_execution_decision_attributes_
                                                            :
                                                            continue_as_new_workflow_execution_decision_attributes
                                                              option)
  ?cancel_workflow_execution_decision_attributes:(cancel_workflow_execution_decision_attributes_
                                                   :
                                                   cancel_workflow_execution_decision_attributes
                                                     option)
  ?fail_workflow_execution_decision_attributes:(fail_workflow_execution_decision_attributes_
                                                 :
                                                 fail_workflow_execution_decision_attributes
                                                   option)
  ?complete_workflow_execution_decision_attributes:(complete_workflow_execution_decision_attributes_
                                                     :
                                                     complete_workflow_execution_decision_attributes
                                                       option)
  ?request_cancel_activity_task_decision_attributes:(request_cancel_activity_task_decision_attributes_
                                                      :
                                                      request_cancel_activity_task_decision_attributes
                                                        option)
  ?schedule_activity_task_decision_attributes:(schedule_activity_task_decision_attributes_
                                                :
                                                schedule_activity_task_decision_attributes
                                                  option)
  ~decision_type:(decision_type_ : decision_type) () =
  ({
     schedule_lambda_function_decision_attributes =
       schedule_lambda_function_decision_attributes_;
     start_child_workflow_execution_decision_attributes =
       start_child_workflow_execution_decision_attributes_;
     request_cancel_external_workflow_execution_decision_attributes =
       request_cancel_external_workflow_execution_decision_attributes_;
     signal_external_workflow_execution_decision_attributes =
       signal_external_workflow_execution_decision_attributes_;
     cancel_timer_decision_attributes = cancel_timer_decision_attributes_;
     start_timer_decision_attributes = start_timer_decision_attributes_;
     record_marker_decision_attributes = record_marker_decision_attributes_;
     continue_as_new_workflow_execution_decision_attributes =
       continue_as_new_workflow_execution_decision_attributes_;
     cancel_workflow_execution_decision_attributes =
       cancel_workflow_execution_decision_attributes_;
     fail_workflow_execution_decision_attributes =
       fail_workflow_execution_decision_attributes_;
     complete_workflow_execution_decision_attributes =
       complete_workflow_execution_decision_attributes_;
     request_cancel_activity_task_decision_attributes =
       request_cancel_activity_task_decision_attributes_;
     schedule_activity_task_decision_attributes =
       schedule_activity_task_decision_attributes_;
     decision_type = decision_type_
   } : decision)
let make_respond_decision_task_completed_input
  ?task_list_schedule_to_start_timeout:(task_list_schedule_to_start_timeout_
                                         :
                                         duration_in_seconds_optional option)
  ?task_list:(task_list_ : task_list option)
  ?execution_context:(execution_context_ : data option)
  ?decisions:(decisions_ : decision_list option)
  ~task_token:(task_token_ : task_token) () =
  ({
     task_list_schedule_to_start_timeout =
       task_list_schedule_to_start_timeout_;
     task_list = task_list_;
     execution_context = execution_context_;
     decisions = decisions_;
     task_token = task_token_
   } : respond_decision_task_completed_input)
let make_respond_activity_task_failed_input ?details:(details_ : data option)
  ?reason:(reason_ : failure_reason option)
  ~task_token:(task_token_ : task_token) () =
  ({ details = details_; reason = reason_; task_token = task_token_ } : 
  respond_activity_task_failed_input)
let make_respond_activity_task_completed_input
  ?result:(result_ : data option) ~task_token:(task_token_ : task_token) () =
  ({ result = result_; task_token = task_token_ } : respond_activity_task_completed_input)
let make_respond_activity_task_canceled_input
  ?details:(details_ : data option) ~task_token:(task_token_ : task_token) ()
  =
  ({ details = details_; task_token = task_token_ } : respond_activity_task_canceled_input)
let make_request_cancel_workflow_execution_input
  ?run_id:(run_id_ : workflow_run_id_optional option)
  ~workflow_id:(workflow_id_ : workflow_id) ~domain:(domain_ : domain_name)
  () =
  ({ run_id = run_id_; workflow_id = workflow_id_; domain = domain_ } : 
  request_cancel_workflow_execution_input)
let make_register_workflow_type_input
  ?default_lambda_role:(default_lambda_role_ : arn option)
  ?default_child_policy:(default_child_policy_ : child_policy option)
  ?default_task_priority:(default_task_priority_ : task_priority option)
  ?default_task_list:(default_task_list_ : task_list option)
  ?default_execution_start_to_close_timeout:(default_execution_start_to_close_timeout_
                                              :
                                              duration_in_seconds_optional
                                                option)
  ?default_task_start_to_close_timeout:(default_task_start_to_close_timeout_
                                         :
                                         duration_in_seconds_optional option)
  ?description:(description_ : description option)
  ~version:(version_ : version) ~name:(name_ : name)
  ~domain:(domain_ : domain_name) () =
  ({
     default_lambda_role = default_lambda_role_;
     default_child_policy = default_child_policy_;
     default_task_priority = default_task_priority_;
     default_task_list = default_task_list_;
     default_execution_start_to_close_timeout =
       default_execution_start_to_close_timeout_;
     default_task_start_to_close_timeout =
       default_task_start_to_close_timeout_;
     description = description_;
     version = version_;
     name = name_;
     domain = domain_
   } : register_workflow_type_input)
let make_register_domain_input ?tags:(tags_ : resource_tag_list option)
  ?description:(description_ : description option)
  ~workflow_execution_retention_period_in_days:(workflow_execution_retention_period_in_days_
                                                 : duration_in_days)
  ~name:(name_ : domain_name) () =
  ({
     tags = tags_;
     workflow_execution_retention_period_in_days =
       workflow_execution_retention_period_in_days_;
     description = description_;
     name = name_
   } : register_domain_input)
let make_register_activity_type_input
  ?default_task_schedule_to_close_timeout:(default_task_schedule_to_close_timeout_
                                            :
                                            duration_in_seconds_optional
                                              option)
  ?default_task_schedule_to_start_timeout:(default_task_schedule_to_start_timeout_
                                            :
                                            duration_in_seconds_optional
                                              option)
  ?default_task_priority:(default_task_priority_ : task_priority option)
  ?default_task_list:(default_task_list_ : task_list option)
  ?default_task_heartbeat_timeout:(default_task_heartbeat_timeout_ :
                                    duration_in_seconds_optional option)
  ?default_task_start_to_close_timeout:(default_task_start_to_close_timeout_
                                         :
                                         duration_in_seconds_optional option)
  ?description:(description_ : description option)
  ~version:(version_ : version) ~name:(name_ : name)
  ~domain:(domain_ : domain_name) () =
  ({
     default_task_schedule_to_close_timeout =
       default_task_schedule_to_close_timeout_;
     default_task_schedule_to_start_timeout =
       default_task_schedule_to_start_timeout_;
     default_task_priority = default_task_priority_;
     default_task_list = default_task_list_;
     default_task_heartbeat_timeout = default_task_heartbeat_timeout_;
     default_task_start_to_close_timeout =
       default_task_start_to_close_timeout_;
     description = description_;
     version = version_;
     name = name_;
     domain = domain_
   } : register_activity_type_input)
let make_activity_task_status
  ~cancel_requested:(cancel_requested_ : canceled) () =
  ({ cancel_requested = cancel_requested_ } : activity_task_status)
let make_record_activity_task_heartbeat_input
  ?details:(details_ : limited_data option)
  ~task_token:(task_token_ : task_token) () =
  ({ details = details_; task_token = task_token_ } : record_activity_task_heartbeat_input)
let make_complete_workflow_execution_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~cause:(cause_ : complete_workflow_execution_failed_cause) () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     cause = cause_
   } : complete_workflow_execution_failed_event_attributes)
let make_fail_workflow_execution_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~cause:(cause_ : fail_workflow_execution_failed_cause) () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     cause = cause_
   } : fail_workflow_execution_failed_event_attributes)
let make_cancel_workflow_execution_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~cause:(cause_ : cancel_workflow_execution_failed_cause) () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     cause = cause_
   } : cancel_workflow_execution_failed_event_attributes)
let make_continue_as_new_workflow_execution_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~cause:(cause_ : continue_as_new_workflow_execution_failed_cause) () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     cause = cause_
   } : continue_as_new_workflow_execution_failed_event_attributes)
let make_decision_task_scheduled_event_attributes
  ?schedule_to_start_timeout:(schedule_to_start_timeout_ :
                               duration_in_seconds_optional option)
  ?start_to_close_timeout:(start_to_close_timeout_ :
                            duration_in_seconds_optional option)
  ?task_priority:(task_priority_ : task_priority option)
  ~task_list:(task_list_ : task_list) () =
  ({
     schedule_to_start_timeout = schedule_to_start_timeout_;
     start_to_close_timeout = start_to_close_timeout_;
     task_priority = task_priority_;
     task_list = task_list_
   } : decision_task_scheduled_event_attributes)
let make_decision_task_started_event_attributes
  ?identity:(identity_ : identity option)
  ~scheduled_event_id:(scheduled_event_id_ : event_id) () =
  ({ scheduled_event_id = scheduled_event_id_; identity = identity_ } : 
  decision_task_started_event_attributes)
let make_decision_task_completed_event_attributes
  ?task_list_schedule_to_start_timeout:(task_list_schedule_to_start_timeout_
                                         :
                                         duration_in_seconds_optional option)
  ?task_list:(task_list_ : task_list option)
  ?execution_context:(execution_context_ : data option)
  ~started_event_id:(started_event_id_ : event_id)
  ~scheduled_event_id:(scheduled_event_id_ : event_id) () =
  ({
     task_list_schedule_to_start_timeout =
       task_list_schedule_to_start_timeout_;
     task_list = task_list_;
     started_event_id = started_event_id_;
     scheduled_event_id = scheduled_event_id_;
     execution_context = execution_context_
   } : decision_task_completed_event_attributes)
let make_decision_task_timed_out_event_attributes
  ~started_event_id:(started_event_id_ : event_id)
  ~scheduled_event_id:(scheduled_event_id_ : event_id)
  ~timeout_type:(timeout_type_ : decision_task_timeout_type) () =
  ({
     started_event_id = started_event_id_;
     scheduled_event_id = scheduled_event_id_;
     timeout_type = timeout_type_
   } : decision_task_timed_out_event_attributes)
let make_activity_task_scheduled_event_attributes
  ?heartbeat_timeout:(heartbeat_timeout_ :
                       duration_in_seconds_optional option)
  ?task_priority:(task_priority_ : task_priority option)
  ?start_to_close_timeout:(start_to_close_timeout_ :
                            duration_in_seconds_optional option)
  ?schedule_to_close_timeout:(schedule_to_close_timeout_ :
                               duration_in_seconds_optional option)
  ?schedule_to_start_timeout:(schedule_to_start_timeout_ :
                               duration_in_seconds_optional option)
  ?control:(control_ : data option) ?input:(input_ : data option)
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~task_list:(task_list_ : task_list)
  ~activity_id:(activity_id_ : activity_id)
  ~activity_type:(activity_type_ : activity_type) () =
  ({
     heartbeat_timeout = heartbeat_timeout_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     task_priority = task_priority_;
     task_list = task_list_;
     start_to_close_timeout = start_to_close_timeout_;
     schedule_to_close_timeout = schedule_to_close_timeout_;
     schedule_to_start_timeout = schedule_to_start_timeout_;
     control = control_;
     input = input_;
     activity_id = activity_id_;
     activity_type = activity_type_
   } : activity_task_scheduled_event_attributes)
let make_activity_task_started_event_attributes
  ?identity:(identity_ : identity option)
  ~scheduled_event_id:(scheduled_event_id_ : event_id) () =
  ({ scheduled_event_id = scheduled_event_id_; identity = identity_ } : 
  activity_task_started_event_attributes)
let make_activity_task_completed_event_attributes
  ?result:(result_ : data option)
  ~started_event_id:(started_event_id_ : event_id)
  ~scheduled_event_id:(scheduled_event_id_ : event_id) () =
  ({
     started_event_id = started_event_id_;
     scheduled_event_id = scheduled_event_id_;
     result = result_
   } : activity_task_completed_event_attributes)
let make_activity_task_failed_event_attributes
  ?details:(details_ : data option) ?reason:(reason_ : failure_reason option)
  ~started_event_id:(started_event_id_ : event_id)
  ~scheduled_event_id:(scheduled_event_id_ : event_id) () =
  ({
     started_event_id = started_event_id_;
     scheduled_event_id = scheduled_event_id_;
     details = details_;
     reason = reason_
   } : activity_task_failed_event_attributes)
let make_activity_task_timed_out_event_attributes
  ?details:(details_ : limited_data option)
  ~started_event_id:(started_event_id_ : event_id)
  ~scheduled_event_id:(scheduled_event_id_ : event_id)
  ~timeout_type:(timeout_type_ : activity_task_timeout_type) () =
  ({
     details = details_;
     started_event_id = started_event_id_;
     scheduled_event_id = scheduled_event_id_;
     timeout_type = timeout_type_
   } : activity_task_timed_out_event_attributes)
let make_activity_task_canceled_event_attributes
  ?latest_cancel_requested_event_id:(latest_cancel_requested_event_id_ :
                                      event_id option)
  ?details:(details_ : data option)
  ~started_event_id:(started_event_id_ : event_id)
  ~scheduled_event_id:(scheduled_event_id_ : event_id) () =
  ({
     latest_cancel_requested_event_id = latest_cancel_requested_event_id_;
     started_event_id = started_event_id_;
     scheduled_event_id = scheduled_event_id_;
     details = details_
   } : activity_task_canceled_event_attributes)
let make_activity_task_cancel_requested_event_attributes
  ~activity_id:(activity_id_ : activity_id)
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  () =
  ({
     activity_id = activity_id_;
     decision_task_completed_event_id = decision_task_completed_event_id_
   } : activity_task_cancel_requested_event_attributes)
let make_marker_recorded_event_attributes ?details:(details_ : data option)
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~marker_name:(marker_name_ : marker_name) () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     details = details_;
     marker_name = marker_name_
   } : marker_recorded_event_attributes)
let make_record_marker_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~cause:(cause_ : record_marker_failed_cause)
  ~marker_name:(marker_name_ : marker_name) () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     cause = cause_;
     marker_name = marker_name_
   } : record_marker_failed_event_attributes)
let make_child_workflow_execution_started_event_attributes
  ~initiated_event_id:(initiated_event_id_ : event_id)
  ~workflow_type:(workflow_type_ : workflow_type)
  ~workflow_execution:(workflow_execution_ : workflow_execution) () =
  ({
     initiated_event_id = initiated_event_id_;
     workflow_type = workflow_type_;
     workflow_execution = workflow_execution_
   } : child_workflow_execution_started_event_attributes)
let make_child_workflow_execution_completed_event_attributes
  ?result:(result_ : data option)
  ~started_event_id:(started_event_id_ : event_id)
  ~initiated_event_id:(initiated_event_id_ : event_id)
  ~workflow_type:(workflow_type_ : workflow_type)
  ~workflow_execution:(workflow_execution_ : workflow_execution) () =
  ({
     started_event_id = started_event_id_;
     initiated_event_id = initiated_event_id_;
     result = result_;
     workflow_type = workflow_type_;
     workflow_execution = workflow_execution_
   } : child_workflow_execution_completed_event_attributes)
let make_child_workflow_execution_failed_event_attributes
  ?details:(details_ : data option) ?reason:(reason_ : failure_reason option)
  ~started_event_id:(started_event_id_ : event_id)
  ~initiated_event_id:(initiated_event_id_ : event_id)
  ~workflow_type:(workflow_type_ : workflow_type)
  ~workflow_execution:(workflow_execution_ : workflow_execution) () =
  ({
     started_event_id = started_event_id_;
     initiated_event_id = initiated_event_id_;
     details = details_;
     reason = reason_;
     workflow_type = workflow_type_;
     workflow_execution = workflow_execution_
   } : child_workflow_execution_failed_event_attributes)
let make_child_workflow_execution_timed_out_event_attributes
  ~started_event_id:(started_event_id_ : event_id)
  ~initiated_event_id:(initiated_event_id_ : event_id)
  ~timeout_type:(timeout_type_ : workflow_execution_timeout_type)
  ~workflow_type:(workflow_type_ : workflow_type)
  ~workflow_execution:(workflow_execution_ : workflow_execution) () =
  ({
     started_event_id = started_event_id_;
     initiated_event_id = initiated_event_id_;
     timeout_type = timeout_type_;
     workflow_type = workflow_type_;
     workflow_execution = workflow_execution_
   } : child_workflow_execution_timed_out_event_attributes)
let make_child_workflow_execution_canceled_event_attributes
  ?details:(details_ : data option)
  ~started_event_id:(started_event_id_ : event_id)
  ~initiated_event_id:(initiated_event_id_ : event_id)
  ~workflow_type:(workflow_type_ : workflow_type)
  ~workflow_execution:(workflow_execution_ : workflow_execution) () =
  ({
     started_event_id = started_event_id_;
     initiated_event_id = initiated_event_id_;
     details = details_;
     workflow_type = workflow_type_;
     workflow_execution = workflow_execution_
   } : child_workflow_execution_canceled_event_attributes)
let make_child_workflow_execution_terminated_event_attributes
  ~started_event_id:(started_event_id_ : event_id)
  ~initiated_event_id:(initiated_event_id_ : event_id)
  ~workflow_type:(workflow_type_ : workflow_type)
  ~workflow_execution:(workflow_execution_ : workflow_execution) () =
  ({
     started_event_id = started_event_id_;
     initiated_event_id = initiated_event_id_;
     workflow_type = workflow_type_;
     workflow_execution = workflow_execution_
   } : child_workflow_execution_terminated_event_attributes)
let make_signal_external_workflow_execution_initiated_event_attributes
  ?control:(control_ : data option) ?input:(input_ : data option)
  ?run_id:(run_id_ : workflow_run_id_optional option)
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~signal_name:(signal_name_ : signal_name)
  ~workflow_id:(workflow_id_ : workflow_id) () =
  ({
     control = control_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     input = input_;
     signal_name = signal_name_;
     run_id = run_id_;
     workflow_id = workflow_id_
   } : signal_external_workflow_execution_initiated_event_attributes)
let make_external_workflow_execution_signaled_event_attributes
  ~initiated_event_id:(initiated_event_id_ : event_id)
  ~workflow_execution:(workflow_execution_ : workflow_execution) () =
  ({
     initiated_event_id = initiated_event_id_;
     workflow_execution = workflow_execution_
   } : external_workflow_execution_signaled_event_attributes)
let make_signal_external_workflow_execution_failed_event_attributes
  ?control:(control_ : data option)
  ?run_id:(run_id_ : workflow_run_id_optional option)
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~initiated_event_id:(initiated_event_id_ : event_id)
  ~cause:(cause_ : signal_external_workflow_execution_failed_cause)
  ~workflow_id:(workflow_id_ : workflow_id) () =
  ({
     control = control_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     initiated_event_id = initiated_event_id_;
     cause = cause_;
     run_id = run_id_;
     workflow_id = workflow_id_
   } : signal_external_workflow_execution_failed_event_attributes)
let make_external_workflow_execution_cancel_requested_event_attributes
  ~initiated_event_id:(initiated_event_id_ : event_id)
  ~workflow_execution:(workflow_execution_ : workflow_execution) () =
  ({
     initiated_event_id = initiated_event_id_;
     workflow_execution = workflow_execution_
   } : external_workflow_execution_cancel_requested_event_attributes)
let make_request_cancel_external_workflow_execution_initiated_event_attributes
  ?control:(control_ : data option)
  ?run_id:(run_id_ : workflow_run_id_optional option)
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~workflow_id:(workflow_id_ : workflow_id) () =
  ({
     control = control_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     run_id = run_id_;
     workflow_id = workflow_id_
   } : request_cancel_external_workflow_execution_initiated_event_attributes)
let make_request_cancel_external_workflow_execution_failed_event_attributes
  ?control:(control_ : data option)
  ?run_id:(run_id_ : workflow_run_id_optional option)
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~initiated_event_id:(initiated_event_id_ : event_id)
  ~cause:(cause_ : request_cancel_external_workflow_execution_failed_cause)
  ~workflow_id:(workflow_id_ : workflow_id) () =
  ({
     control = control_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     initiated_event_id = initiated_event_id_;
     cause = cause_;
     run_id = run_id_;
     workflow_id = workflow_id_
   } : request_cancel_external_workflow_execution_failed_event_attributes)
let make_schedule_activity_task_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~cause:(cause_ : schedule_activity_task_failed_cause)
  ~activity_id:(activity_id_ : activity_id)
  ~activity_type:(activity_type_ : activity_type) () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     cause = cause_;
     activity_id = activity_id_;
     activity_type = activity_type_
   } : schedule_activity_task_failed_event_attributes)
let make_request_cancel_activity_task_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~cause:(cause_ : request_cancel_activity_task_failed_cause)
  ~activity_id:(activity_id_ : activity_id) () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     cause = cause_;
     activity_id = activity_id_
   } : request_cancel_activity_task_failed_event_attributes)
let make_cancel_timer_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~cause:(cause_ : cancel_timer_failed_cause)
  ~timer_id:(timer_id_ : timer_id) () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     cause = cause_;
     timer_id = timer_id_
   } : cancel_timer_failed_event_attributes)
let make_lambda_function_scheduled_event_attributes
  ?start_to_close_timeout:(start_to_close_timeout_ :
                            duration_in_seconds_optional option)
  ?input:(input_ : function_input option) ?control:(control_ : data option)
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~name:(name_ : function_name) ~id:(id_ : function_id) () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     start_to_close_timeout = start_to_close_timeout_;
     input = input_;
     control = control_;
     name = name_;
     id = id_
   } : lambda_function_scheduled_event_attributes)
let make_lambda_function_started_event_attributes
  ~scheduled_event_id:(scheduled_event_id_ : event_id) () =
  ({ scheduled_event_id = scheduled_event_id_ } : lambda_function_started_event_attributes)
let make_lambda_function_completed_event_attributes
  ?result:(result_ : data option)
  ~started_event_id:(started_event_id_ : event_id)
  ~scheduled_event_id:(scheduled_event_id_ : event_id) () =
  ({
     result = result_;
     started_event_id = started_event_id_;
     scheduled_event_id = scheduled_event_id_
   } : lambda_function_completed_event_attributes)
let make_lambda_function_failed_event_attributes
  ?details:(details_ : data option) ?reason:(reason_ : failure_reason option)
  ~started_event_id:(started_event_id_ : event_id)
  ~scheduled_event_id:(scheduled_event_id_ : event_id) () =
  ({
     details = details_;
     reason = reason_;
     started_event_id = started_event_id_;
     scheduled_event_id = scheduled_event_id_
   } : lambda_function_failed_event_attributes)
let make_lambda_function_timed_out_event_attributes
  ?timeout_type:(timeout_type_ : lambda_function_timeout_type option)
  ~started_event_id:(started_event_id_ : event_id)
  ~scheduled_event_id:(scheduled_event_id_ : event_id) () =
  ({
     timeout_type = timeout_type_;
     started_event_id = started_event_id_;
     scheduled_event_id = scheduled_event_id_
   } : lambda_function_timed_out_event_attributes)
let make_schedule_lambda_function_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                      event_id)
  ~cause:(cause_ : schedule_lambda_function_failed_cause)
  ~name:(name_ : function_name) ~id:(id_ : function_id) () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     cause = cause_;
     name = name_;
     id = id_
   } : schedule_lambda_function_failed_event_attributes)
let make_history_event
  ?start_lambda_function_failed_event_attributes:(start_lambda_function_failed_event_attributes_
                                                   :
                                                   start_lambda_function_failed_event_attributes
                                                     option)
  ?schedule_lambda_function_failed_event_attributes:(schedule_lambda_function_failed_event_attributes_
                                                      :
                                                      schedule_lambda_function_failed_event_attributes
                                                        option)
  ?lambda_function_timed_out_event_attributes:(lambda_function_timed_out_event_attributes_
                                                :
                                                lambda_function_timed_out_event_attributes
                                                  option)
  ?lambda_function_failed_event_attributes:(lambda_function_failed_event_attributes_
                                             :
                                             lambda_function_failed_event_attributes
                                               option)
  ?lambda_function_completed_event_attributes:(lambda_function_completed_event_attributes_
                                                :
                                                lambda_function_completed_event_attributes
                                                  option)
  ?lambda_function_started_event_attributes:(lambda_function_started_event_attributes_
                                              :
                                              lambda_function_started_event_attributes
                                                option)
  ?lambda_function_scheduled_event_attributes:(lambda_function_scheduled_event_attributes_
                                                :
                                                lambda_function_scheduled_event_attributes
                                                  option)
  ?start_child_workflow_execution_failed_event_attributes:(start_child_workflow_execution_failed_event_attributes_
                                                            :
                                                            start_child_workflow_execution_failed_event_attributes
                                                              option)
  ?cancel_timer_failed_event_attributes:(cancel_timer_failed_event_attributes_
                                          :
                                          cancel_timer_failed_event_attributes
                                            option)
  ?start_timer_failed_event_attributes:(start_timer_failed_event_attributes_
                                         :
                                         start_timer_failed_event_attributes
                                           option)
  ?request_cancel_activity_task_failed_event_attributes:(request_cancel_activity_task_failed_event_attributes_
                                                          :
                                                          request_cancel_activity_task_failed_event_attributes
                                                            option)
  ?schedule_activity_task_failed_event_attributes:(schedule_activity_task_failed_event_attributes_
                                                    :
                                                    schedule_activity_task_failed_event_attributes
                                                      option)
  ?request_cancel_external_workflow_execution_failed_event_attributes:
  (request_cancel_external_workflow_execution_failed_event_attributes_ :
    request_cancel_external_workflow_execution_failed_event_attributes option)
  ?request_cancel_external_workflow_execution_initiated_event_attributes:
  (request_cancel_external_workflow_execution_initiated_event_attributes_ :
    request_cancel_external_workflow_execution_initiated_event_attributes
      option)
  ?external_workflow_execution_cancel_requested_event_attributes:(external_workflow_execution_cancel_requested_event_attributes_
                                                                   :
                                                                   external_workflow_execution_cancel_requested_event_attributes
                                                                    option)
  ?signal_external_workflow_execution_failed_event_attributes:(signal_external_workflow_execution_failed_event_attributes_
                                                                :
                                                                signal_external_workflow_execution_failed_event_attributes
                                                                  option)
  ?external_workflow_execution_signaled_event_attributes:(external_workflow_execution_signaled_event_attributes_
                                                           :
                                                           external_workflow_execution_signaled_event_attributes
                                                             option)
  ?signal_external_workflow_execution_initiated_event_attributes:(signal_external_workflow_execution_initiated_event_attributes_
                                                                   :
                                                                   signal_external_workflow_execution_initiated_event_attributes
                                                                    option)
  ?child_workflow_execution_terminated_event_attributes:(child_workflow_execution_terminated_event_attributes_
                                                          :
                                                          child_workflow_execution_terminated_event_attributes
                                                            option)
  ?child_workflow_execution_canceled_event_attributes:(child_workflow_execution_canceled_event_attributes_
                                                        :
                                                        child_workflow_execution_canceled_event_attributes
                                                          option)
  ?child_workflow_execution_timed_out_event_attributes:(child_workflow_execution_timed_out_event_attributes_
                                                         :
                                                         child_workflow_execution_timed_out_event_attributes
                                                           option)
  ?child_workflow_execution_failed_event_attributes:(child_workflow_execution_failed_event_attributes_
                                                      :
                                                      child_workflow_execution_failed_event_attributes
                                                        option)
  ?child_workflow_execution_completed_event_attributes:(child_workflow_execution_completed_event_attributes_
                                                         :
                                                         child_workflow_execution_completed_event_attributes
                                                           option)
  ?child_workflow_execution_started_event_attributes:(child_workflow_execution_started_event_attributes_
                                                       :
                                                       child_workflow_execution_started_event_attributes
                                                         option)
  ?start_child_workflow_execution_initiated_event_attributes:(start_child_workflow_execution_initiated_event_attributes_
                                                               :
                                                               start_child_workflow_execution_initiated_event_attributes
                                                                 option)
  ?timer_canceled_event_attributes:(timer_canceled_event_attributes_ :
                                     timer_canceled_event_attributes option)
  ?timer_fired_event_attributes:(timer_fired_event_attributes_ :
                                  timer_fired_event_attributes option)
  ?timer_started_event_attributes:(timer_started_event_attributes_ :
                                    timer_started_event_attributes option)
  ?record_marker_failed_event_attributes:(record_marker_failed_event_attributes_
                                           :
                                           record_marker_failed_event_attributes
                                             option)
  ?marker_recorded_event_attributes:(marker_recorded_event_attributes_ :
                                      marker_recorded_event_attributes option)
  ?workflow_execution_signaled_event_attributes:(workflow_execution_signaled_event_attributes_
                                                  :
                                                  workflow_execution_signaled_event_attributes
                                                    option)
  ?activity_task_cancel_requested_event_attributes:(activity_task_cancel_requested_event_attributes_
                                                     :
                                                     activity_task_cancel_requested_event_attributes
                                                       option)
  ?activity_task_canceled_event_attributes:(activity_task_canceled_event_attributes_
                                             :
                                             activity_task_canceled_event_attributes
                                               option)
  ?activity_task_timed_out_event_attributes:(activity_task_timed_out_event_attributes_
                                              :
                                              activity_task_timed_out_event_attributes
                                                option)
  ?activity_task_failed_event_attributes:(activity_task_failed_event_attributes_
                                           :
                                           activity_task_failed_event_attributes
                                             option)
  ?activity_task_completed_event_attributes:(activity_task_completed_event_attributes_
                                              :
                                              activity_task_completed_event_attributes
                                                option)
  ?activity_task_started_event_attributes:(activity_task_started_event_attributes_
                                            :
                                            activity_task_started_event_attributes
                                              option)
  ?activity_task_scheduled_event_attributes:(activity_task_scheduled_event_attributes_
                                              :
                                              activity_task_scheduled_event_attributes
                                                option)
  ?decision_task_timed_out_event_attributes:(decision_task_timed_out_event_attributes_
                                              :
                                              decision_task_timed_out_event_attributes
                                                option)
  ?decision_task_completed_event_attributes:(decision_task_completed_event_attributes_
                                              :
                                              decision_task_completed_event_attributes
                                                option)
  ?decision_task_started_event_attributes:(decision_task_started_event_attributes_
                                            :
                                            decision_task_started_event_attributes
                                              option)
  ?decision_task_scheduled_event_attributes:(decision_task_scheduled_event_attributes_
                                              :
                                              decision_task_scheduled_event_attributes
                                                option)
  ?workflow_execution_cancel_requested_event_attributes:(workflow_execution_cancel_requested_event_attributes_
                                                          :
                                                          workflow_execution_cancel_requested_event_attributes
                                                            option)
  ?workflow_execution_terminated_event_attributes:(workflow_execution_terminated_event_attributes_
                                                    :
                                                    workflow_execution_terminated_event_attributes
                                                      option)
  ?continue_as_new_workflow_execution_failed_event_attributes:(continue_as_new_workflow_execution_failed_event_attributes_
                                                                :
                                                                continue_as_new_workflow_execution_failed_event_attributes
                                                                  option)
  ?workflow_execution_continued_as_new_event_attributes:(workflow_execution_continued_as_new_event_attributes_
                                                          :
                                                          workflow_execution_continued_as_new_event_attributes
                                                            option)
  ?cancel_workflow_execution_failed_event_attributes:(cancel_workflow_execution_failed_event_attributes_
                                                       :
                                                       cancel_workflow_execution_failed_event_attributes
                                                         option)
  ?workflow_execution_canceled_event_attributes:(workflow_execution_canceled_event_attributes_
                                                  :
                                                  workflow_execution_canceled_event_attributes
                                                    option)
  ?workflow_execution_timed_out_event_attributes:(workflow_execution_timed_out_event_attributes_
                                                   :
                                                   workflow_execution_timed_out_event_attributes
                                                     option)
  ?fail_workflow_execution_failed_event_attributes:(fail_workflow_execution_failed_event_attributes_
                                                     :
                                                     fail_workflow_execution_failed_event_attributes
                                                       option)
  ?workflow_execution_failed_event_attributes:(workflow_execution_failed_event_attributes_
                                                :
                                                workflow_execution_failed_event_attributes
                                                  option)
  ?complete_workflow_execution_failed_event_attributes:(complete_workflow_execution_failed_event_attributes_
                                                         :
                                                         complete_workflow_execution_failed_event_attributes
                                                           option)
  ?workflow_execution_completed_event_attributes:(workflow_execution_completed_event_attributes_
                                                   :
                                                   workflow_execution_completed_event_attributes
                                                     option)
  ?workflow_execution_started_event_attributes:(workflow_execution_started_event_attributes_
                                                 :
                                                 workflow_execution_started_event_attributes
                                                   option)
  ~event_id:(event_id_ : event_id) ~event_type:(event_type_ : event_type)
  ~event_timestamp:(event_timestamp_ : timestamp) () =
  ({
     start_lambda_function_failed_event_attributes =
       start_lambda_function_failed_event_attributes_;
     schedule_lambda_function_failed_event_attributes =
       schedule_lambda_function_failed_event_attributes_;
     lambda_function_timed_out_event_attributes =
       lambda_function_timed_out_event_attributes_;
     lambda_function_failed_event_attributes =
       lambda_function_failed_event_attributes_;
     lambda_function_completed_event_attributes =
       lambda_function_completed_event_attributes_;
     lambda_function_started_event_attributes =
       lambda_function_started_event_attributes_;
     lambda_function_scheduled_event_attributes =
       lambda_function_scheduled_event_attributes_;
     start_child_workflow_execution_failed_event_attributes =
       start_child_workflow_execution_failed_event_attributes_;
     cancel_timer_failed_event_attributes =
       cancel_timer_failed_event_attributes_;
     start_timer_failed_event_attributes =
       start_timer_failed_event_attributes_;
     request_cancel_activity_task_failed_event_attributes =
       request_cancel_activity_task_failed_event_attributes_;
     schedule_activity_task_failed_event_attributes =
       schedule_activity_task_failed_event_attributes_;
     request_cancel_external_workflow_execution_failed_event_attributes =
       request_cancel_external_workflow_execution_failed_event_attributes_;
     request_cancel_external_workflow_execution_initiated_event_attributes =
       request_cancel_external_workflow_execution_initiated_event_attributes_;
     external_workflow_execution_cancel_requested_event_attributes =
       external_workflow_execution_cancel_requested_event_attributes_;
     signal_external_workflow_execution_failed_event_attributes =
       signal_external_workflow_execution_failed_event_attributes_;
     external_workflow_execution_signaled_event_attributes =
       external_workflow_execution_signaled_event_attributes_;
     signal_external_workflow_execution_initiated_event_attributes =
       signal_external_workflow_execution_initiated_event_attributes_;
     child_workflow_execution_terminated_event_attributes =
       child_workflow_execution_terminated_event_attributes_;
     child_workflow_execution_canceled_event_attributes =
       child_workflow_execution_canceled_event_attributes_;
     child_workflow_execution_timed_out_event_attributes =
       child_workflow_execution_timed_out_event_attributes_;
     child_workflow_execution_failed_event_attributes =
       child_workflow_execution_failed_event_attributes_;
     child_workflow_execution_completed_event_attributes =
       child_workflow_execution_completed_event_attributes_;
     child_workflow_execution_started_event_attributes =
       child_workflow_execution_started_event_attributes_;
     start_child_workflow_execution_initiated_event_attributes =
       start_child_workflow_execution_initiated_event_attributes_;
     timer_canceled_event_attributes = timer_canceled_event_attributes_;
     timer_fired_event_attributes = timer_fired_event_attributes_;
     timer_started_event_attributes = timer_started_event_attributes_;
     record_marker_failed_event_attributes =
       record_marker_failed_event_attributes_;
     marker_recorded_event_attributes = marker_recorded_event_attributes_;
     workflow_execution_signaled_event_attributes =
       workflow_execution_signaled_event_attributes_;
     activity_task_cancel_requested_event_attributes =
       activity_task_cancel_requested_event_attributes_;
     activity_task_canceled_event_attributes =
       activity_task_canceled_event_attributes_;
     activity_task_timed_out_event_attributes =
       activity_task_timed_out_event_attributes_;
     activity_task_failed_event_attributes =
       activity_task_failed_event_attributes_;
     activity_task_completed_event_attributes =
       activity_task_completed_event_attributes_;
     activity_task_started_event_attributes =
       activity_task_started_event_attributes_;
     activity_task_scheduled_event_attributes =
       activity_task_scheduled_event_attributes_;
     decision_task_timed_out_event_attributes =
       decision_task_timed_out_event_attributes_;
     decision_task_completed_event_attributes =
       decision_task_completed_event_attributes_;
     decision_task_started_event_attributes =
       decision_task_started_event_attributes_;
     decision_task_scheduled_event_attributes =
       decision_task_scheduled_event_attributes_;
     workflow_execution_cancel_requested_event_attributes =
       workflow_execution_cancel_requested_event_attributes_;
     workflow_execution_terminated_event_attributes =
       workflow_execution_terminated_event_attributes_;
     continue_as_new_workflow_execution_failed_event_attributes =
       continue_as_new_workflow_execution_failed_event_attributes_;
     workflow_execution_continued_as_new_event_attributes =
       workflow_execution_continued_as_new_event_attributes_;
     cancel_workflow_execution_failed_event_attributes =
       cancel_workflow_execution_failed_event_attributes_;
     workflow_execution_canceled_event_attributes =
       workflow_execution_canceled_event_attributes_;
     workflow_execution_timed_out_event_attributes =
       workflow_execution_timed_out_event_attributes_;
     fail_workflow_execution_failed_event_attributes =
       fail_workflow_execution_failed_event_attributes_;
     workflow_execution_failed_event_attributes =
       workflow_execution_failed_event_attributes_;
     complete_workflow_execution_failed_event_attributes =
       complete_workflow_execution_failed_event_attributes_;
     workflow_execution_completed_event_attributes =
       workflow_execution_completed_event_attributes_;
     workflow_execution_started_event_attributes =
       workflow_execution_started_event_attributes_;
     event_id = event_id_;
     event_type = event_type_;
     event_timestamp = event_timestamp_
   } : history_event)
let make_decision_task
  ?previous_started_event_id:(previous_started_event_id_ : event_id option)
  ?next_page_token:(next_page_token_ : page_token option)
  ~events:(events_ : history_event_list)
  ~workflow_type:(workflow_type_ : workflow_type)
  ~workflow_execution:(workflow_execution_ : workflow_execution)
  ~started_event_id:(started_event_id_ : event_id)
  ~task_token:(task_token_ : task_token) () =
  ({
     previous_started_event_id = previous_started_event_id_;
     next_page_token = next_page_token_;
     events = events_;
     workflow_type = workflow_type_;
     workflow_execution = workflow_execution_;
     started_event_id = started_event_id_;
     task_token = task_token_
   } : decision_task)
let make_poll_for_decision_task_input
  ?start_at_previous_started_event:(start_at_previous_started_event_ :
                                     start_at_previous_started_event option)
  ?reverse_order:(reverse_order_ : reverse_order option)
  ?maximum_page_size:(maximum_page_size_ : page_size option)
  ?next_page_token:(next_page_token_ : page_token option)
  ?identity:(identity_ : identity option) ~task_list:(task_list_ : task_list)
  ~domain:(domain_ : domain_name) () =
  ({
     start_at_previous_started_event = start_at_previous_started_event_;
     reverse_order = reverse_order_;
     maximum_page_size = maximum_page_size_;
     next_page_token = next_page_token_;
     identity = identity_;
     task_list = task_list_;
     domain = domain_
   } : poll_for_decision_task_input)
let make_activity_task ?input:(input_ : data option)
  ~activity_type:(activity_type_ : activity_type)
  ~workflow_execution:(workflow_execution_ : workflow_execution)
  ~started_event_id:(started_event_id_ : event_id)
  ~activity_id:(activity_id_ : activity_id)
  ~task_token:(task_token_ : task_token) () =
  ({
     input = input_;
     activity_type = activity_type_;
     workflow_execution = workflow_execution_;
     started_event_id = started_event_id_;
     activity_id = activity_id_;
     task_token = task_token_
   } : activity_task)
let make_poll_for_activity_task_input ?identity:(identity_ : identity option)
  ~task_list:(task_list_ : task_list) ~domain:(domain_ : domain_name) () =
  ({ identity = identity_; task_list = task_list_; domain = domain_ } : 
  poll_for_activity_task_input)
let make_list_workflow_types_input
  ?reverse_order:(reverse_order_ : reverse_order option)
  ?maximum_page_size:(maximum_page_size_ : page_size option)
  ?next_page_token:(next_page_token_ : page_token option)
  ?name:(name_ : name option)
  ~registration_status:(registration_status_ : registration_status)
  ~domain:(domain_ : domain_name) () =
  ({
     reverse_order = reverse_order_;
     maximum_page_size = maximum_page_size_;
     next_page_token = next_page_token_;
     registration_status = registration_status_;
     name = name_;
     domain = domain_
   } : list_workflow_types_input)
let make_list_tags_for_resource_output
  ?tags:(tags_ : resource_tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_output)
let make_list_tags_for_resource_input ~resource_arn:(resource_arn_ : arn) ()
  = ({ resource_arn = resource_arn_ } : list_tags_for_resource_input)
let make_execution_time_filter ?latest_date:(latest_date_ : timestamp option)
  ~oldest_date:(oldest_date_ : timestamp) () =
  ({ latest_date = latest_date_; oldest_date = oldest_date_ } : execution_time_filter)
let make_list_open_workflow_executions_input
  ?execution_filter:(execution_filter_ : workflow_execution_filter option)
  ?reverse_order:(reverse_order_ : reverse_order option)
  ?maximum_page_size:(maximum_page_size_ : page_size option)
  ?next_page_token:(next_page_token_ : page_token option)
  ?tag_filter:(tag_filter_ : tag_filter option)
  ?type_filter:(type_filter_ : workflow_type_filter option)
  ~start_time_filter:(start_time_filter_ : execution_time_filter)
  ~domain:(domain_ : domain_name) () =
  ({
     execution_filter = execution_filter_;
     reverse_order = reverse_order_;
     maximum_page_size = maximum_page_size_;
     next_page_token = next_page_token_;
     tag_filter = tag_filter_;
     type_filter = type_filter_;
     start_time_filter = start_time_filter_;
     domain = domain_
   } : list_open_workflow_executions_input)
let make_domain_info ?arn:(arn_ : arn option)
  ?description:(description_ : description option)
  ~status:(status_ : registration_status) ~name:(name_ : domain_name) () =
  ({ arn = arn_; description = description_; status = status_; name = name_ } : 
  domain_info)
let make_domain_infos ?next_page_token:(next_page_token_ : page_token option)
  ~domain_infos:(domain_infos_ : domain_info_list) () =
  ({ next_page_token = next_page_token_; domain_infos = domain_infos_ } : 
  domain_infos)
let make_list_domains_input
  ?reverse_order:(reverse_order_ : reverse_order option)
  ?maximum_page_size:(maximum_page_size_ : page_size option)
  ?next_page_token:(next_page_token_ : page_token option)
  ~registration_status:(registration_status_ : registration_status) () =
  ({
     reverse_order = reverse_order_;
     maximum_page_size = maximum_page_size_;
     registration_status = registration_status_;
     next_page_token = next_page_token_
   } : list_domains_input)
let make_close_status_filter ~status:(status_ : close_status) () =
  ({ status = status_ } : close_status_filter)
let make_list_closed_workflow_executions_input
  ?reverse_order:(reverse_order_ : reverse_order option)
  ?maximum_page_size:(maximum_page_size_ : page_size option)
  ?next_page_token:(next_page_token_ : page_token option)
  ?tag_filter:(tag_filter_ : tag_filter option)
  ?type_filter:(type_filter_ : workflow_type_filter option)
  ?close_status_filter:(close_status_filter_ : close_status_filter option)
  ?execution_filter:(execution_filter_ : workflow_execution_filter option)
  ?close_time_filter:(close_time_filter_ : execution_time_filter option)
  ?start_time_filter:(start_time_filter_ : execution_time_filter option)
  ~domain:(domain_ : domain_name) () =
  ({
     reverse_order = reverse_order_;
     maximum_page_size = maximum_page_size_;
     next_page_token = next_page_token_;
     tag_filter = tag_filter_;
     type_filter = type_filter_;
     close_status_filter = close_status_filter_;
     execution_filter = execution_filter_;
     close_time_filter = close_time_filter_;
     start_time_filter = start_time_filter_;
     domain = domain_
   } : list_closed_workflow_executions_input)
let make_activity_type_info
  ?deprecation_date:(deprecation_date_ : timestamp option)
  ?description:(description_ : description option)
  ~creation_date:(creation_date_ : timestamp)
  ~status:(status_ : registration_status)
  ~activity_type:(activity_type_ : activity_type) () =
  ({
     deprecation_date = deprecation_date_;
     creation_date = creation_date_;
     description = description_;
     status = status_;
     activity_type = activity_type_
   } : activity_type_info)
let make_activity_type_infos
  ?next_page_token:(next_page_token_ : page_token option)
  ~type_infos:(type_infos_ : activity_type_info_list) () =
  ({ next_page_token = next_page_token_; type_infos = type_infos_ } : 
  activity_type_infos)
let make_list_activity_types_input
  ?reverse_order:(reverse_order_ : reverse_order option)
  ?maximum_page_size:(maximum_page_size_ : page_size option)
  ?next_page_token:(next_page_token_ : page_token option)
  ?name:(name_ : name option)
  ~registration_status:(registration_status_ : registration_status)
  ~domain:(domain_ : domain_name) () =
  ({
     reverse_order = reverse_order_;
     maximum_page_size = maximum_page_size_;
     next_page_token = next_page_token_;
     registration_status = registration_status_;
     name = name_;
     domain = domain_
   } : list_activity_types_input)
let make_history ?next_page_token:(next_page_token_ : page_token option)
  ~events:(events_ : history_event_list) () =
  ({ next_page_token = next_page_token_; events = events_ } : history)
let make_get_workflow_execution_history_input
  ?reverse_order:(reverse_order_ : reverse_order option)
  ?maximum_page_size:(maximum_page_size_ : page_size option)
  ?next_page_token:(next_page_token_ : page_token option)
  ~execution:(execution_ : workflow_execution)
  ~domain:(domain_ : domain_name) () =
  ({
     reverse_order = reverse_order_;
     maximum_page_size = maximum_page_size_;
     next_page_token = next_page_token_;
     execution = execution_;
     domain = domain_
   } : get_workflow_execution_history_input)
let make_describe_workflow_type_input
  ~workflow_type:(workflow_type_ : workflow_type)
  ~domain:(domain_ : domain_name) () =
  ({ workflow_type = workflow_type_; domain = domain_ } : describe_workflow_type_input)
let make_describe_workflow_execution_input
  ~execution:(execution_ : workflow_execution)
  ~domain:(domain_ : domain_name) () =
  ({ execution = execution_; domain = domain_ } : describe_workflow_execution_input)
let make_domain_configuration
  ~workflow_execution_retention_period_in_days:(workflow_execution_retention_period_in_days_
                                                 : duration_in_days)
  () =
  ({
     workflow_execution_retention_period_in_days =
       workflow_execution_retention_period_in_days_
   } : domain_configuration)
let make_domain_detail ~configuration:(configuration_ : domain_configuration)
  ~domain_info:(domain_info_ : domain_info) () =
  ({ configuration = configuration_; domain_info = domain_info_ } : domain_detail)
let make_describe_domain_input ~name:(name_ : domain_name) () =
  ({ name = name_ } : describe_domain_input)
let make_activity_type_configuration
  ?default_task_schedule_to_close_timeout:(default_task_schedule_to_close_timeout_
                                            :
                                            duration_in_seconds_optional
                                              option)
  ?default_task_schedule_to_start_timeout:(default_task_schedule_to_start_timeout_
                                            :
                                            duration_in_seconds_optional
                                              option)
  ?default_task_priority:(default_task_priority_ : task_priority option)
  ?default_task_list:(default_task_list_ : task_list option)
  ?default_task_heartbeat_timeout:(default_task_heartbeat_timeout_ :
                                    duration_in_seconds_optional option)
  ?default_task_start_to_close_timeout:(default_task_start_to_close_timeout_
                                         :
                                         duration_in_seconds_optional option)
  () =
  ({
     default_task_schedule_to_close_timeout =
       default_task_schedule_to_close_timeout_;
     default_task_schedule_to_start_timeout =
       default_task_schedule_to_start_timeout_;
     default_task_priority = default_task_priority_;
     default_task_list = default_task_list_;
     default_task_heartbeat_timeout = default_task_heartbeat_timeout_;
     default_task_start_to_close_timeout =
       default_task_start_to_close_timeout_
   } : activity_type_configuration)
let make_activity_type_detail
  ~configuration:(configuration_ : activity_type_configuration)
  ~type_info:(type_info_ : activity_type_info) () =
  ({ configuration = configuration_; type_info = type_info_ } : activity_type_detail)
let make_describe_activity_type_input
  ~activity_type:(activity_type_ : activity_type)
  ~domain:(domain_ : domain_name) () =
  ({ activity_type = activity_type_; domain = domain_ } : describe_activity_type_input)
let make_deprecate_workflow_type_input
  ~workflow_type:(workflow_type_ : workflow_type)
  ~domain:(domain_ : domain_name) () =
  ({ workflow_type = workflow_type_; domain = domain_ } : deprecate_workflow_type_input)
let make_deprecate_domain_input ~name:(name_ : domain_name) () =
  ({ name = name_ } : deprecate_domain_input)
let make_deprecate_activity_type_input
  ~activity_type:(activity_type_ : activity_type)
  ~domain:(domain_ : domain_name) () =
  ({ activity_type = activity_type_; domain = domain_ } : deprecate_activity_type_input)
let make_delete_workflow_type_input
  ~workflow_type:(workflow_type_ : workflow_type)
  ~domain:(domain_ : domain_name) () =
  ({ workflow_type = workflow_type_; domain = domain_ } : delete_workflow_type_input)
let make_delete_activity_type_input
  ~activity_type:(activity_type_ : activity_type)
  ~domain:(domain_ : domain_name) () =
  ({ activity_type = activity_type_; domain = domain_ } : delete_activity_type_input)
let make_pending_task_count ?truncated:(truncated_ : truncated option)
  ~count:(count_ : count) () =
  ({ truncated = truncated_; count = count_ } : pending_task_count)
let make_count_pending_decision_tasks_input
  ~task_list:(task_list_ : task_list) ~domain:(domain_ : domain_name) () =
  ({ task_list = task_list_; domain = domain_ } : count_pending_decision_tasks_input)
let make_count_pending_activity_tasks_input
  ~task_list:(task_list_ : task_list) ~domain:(domain_ : domain_name) () =
  ({ task_list = task_list_; domain = domain_ } : count_pending_activity_tasks_input)
let make_count_open_workflow_executions_input
  ?execution_filter:(execution_filter_ : workflow_execution_filter option)
  ?tag_filter:(tag_filter_ : tag_filter option)
  ?type_filter:(type_filter_ : workflow_type_filter option)
  ~start_time_filter:(start_time_filter_ : execution_time_filter)
  ~domain:(domain_ : domain_name) () =
  ({
     execution_filter = execution_filter_;
     tag_filter = tag_filter_;
     type_filter = type_filter_;
     start_time_filter = start_time_filter_;
     domain = domain_
   } : count_open_workflow_executions_input)
let make_count_closed_workflow_executions_input
  ?close_status_filter:(close_status_filter_ : close_status_filter option)
  ?tag_filter:(tag_filter_ : tag_filter option)
  ?type_filter:(type_filter_ : workflow_type_filter option)
  ?execution_filter:(execution_filter_ : workflow_execution_filter option)
  ?close_time_filter:(close_time_filter_ : execution_time_filter option)
  ?start_time_filter:(start_time_filter_ : execution_time_filter option)
  ~domain:(domain_ : domain_name) () =
  ({
     close_status_filter = close_status_filter_;
     tag_filter = tag_filter_;
     type_filter = type_filter_;
     execution_filter = execution_filter_;
     close_time_filter = close_time_filter_;
     start_time_filter = start_time_filter_;
     domain = domain_
   } : count_closed_workflow_executions_input)