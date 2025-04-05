open Smaws_Lib
open Types
let make_workflow_type ~version:(version_ : string)  ~name:(name_ : string) 
  () = ({ version = version_; name = name_ } : workflow_type)
let make_workflow_type_info
  ?deprecation_date:(deprecation_date_ : CoreTypes.Timestamp.t option) 
  ?description:(description_ : string option) 
  ~creation_date:(creation_date_ : CoreTypes.Timestamp.t) 
  ~status:(status_ : registration_status) 
  ~workflow_type:(workflow_type_ : workflow_type)  () =
  ({
     deprecation_date = deprecation_date_;
     creation_date = creation_date_;
     description = description_;
     status = status_;
     workflow_type = workflow_type_
   } : workflow_type_info)
let make_workflow_type_infos
  ?next_page_token:(next_page_token_ : string option) 
  ~type_infos:(type_infos_ : workflow_type_info list)  () =
  ({ next_page_token = next_page_token_; type_infos = type_infos_ } : 
  workflow_type_infos)
let make_workflow_type_filter ?version:(version_ : string option) 
  ~name:(name_ : string)  () =
  ({ version = version_; name = name_ } : workflow_type_filter)
let make_task_list ~name:(name_ : string)  () =
  ({ name = name_ } : task_list)
let make_workflow_type_configuration
  ?default_lambda_role:(default_lambda_role_ : string option) 
  ?default_child_policy:(default_child_policy_ : child_policy option) 
  ?default_task_priority:(default_task_priority_ : string option) 
  ?default_task_list:(default_task_list_ : task_list option) 
  ?default_execution_start_to_close_timeout:(default_execution_start_to_close_timeout_
                                              : string option)
   ?default_task_start_to_close_timeout:(default_task_start_to_close_timeout_
                                          : string option)
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
  ~type_info:(type_info_ : workflow_type_info)  () =
  ({ configuration = configuration_; type_info = type_info_ } : workflow_type_detail)
let make_workflow_execution_timed_out_event_attributes
  ~child_policy:(child_policy_ : child_policy) 
  ~timeout_type:(timeout_type_ : workflow_execution_timeout_type)  () =
  ({ child_policy = child_policy_; timeout_type = timeout_type_ } : workflow_execution_timed_out_event_attributes)
let make_workflow_execution_terminated_event_attributes
  ?cause:(cause_ : workflow_execution_terminated_cause option) 
  ?details:(details_ : string option)  ?reason:(reason_ : string option) 
  ~child_policy:(child_policy_ : child_policy)  () =
  ({
     cause = cause_;
     child_policy = child_policy_;
     details = details_;
     reason = reason_
   } : workflow_execution_terminated_event_attributes)
let make_workflow_execution ~run_id:(run_id_ : string) 
  ~workflow_id:(workflow_id_ : string)  () =
  ({ run_id = run_id_; workflow_id = workflow_id_ } : workflow_execution)
let make_workflow_execution_started_event_attributes
  ?lambda_role:(lambda_role_ : string option) 
  ?parent_initiated_event_id:(parent_initiated_event_id_ : int option) 
  ?parent_workflow_execution:(parent_workflow_execution_ :
                               workflow_execution option)
   ?continued_execution_run_id:(continued_execution_run_id_ : string option) 
  ?tag_list:(tag_list_ : string list option) 
  ?task_priority:(task_priority_ : string option) 
  ?task_start_to_close_timeout:(task_start_to_close_timeout_ : string option)
   ?execution_start_to_close_timeout:(execution_start_to_close_timeout_ :
                                       string option)
   ?input:(input_ : string option) 
  ~workflow_type:(workflow_type_ : workflow_type) 
  ~task_list:(task_list_ : task_list) 
  ~child_policy:(child_policy_ : child_policy)  () =
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
  ?external_initiated_event_id:(external_initiated_event_id_ : int option) 
  ?external_workflow_execution:(external_workflow_execution_ :
                                 workflow_execution option)
   ?input:(input_ : string option)  ~signal_name:(signal_name_ : string)  ()
  =
  ({
     external_initiated_event_id = external_initiated_event_id_;
     external_workflow_execution = external_workflow_execution_;
     input = input_;
     signal_name = signal_name_
   } : workflow_execution_signaled_event_attributes)
let make_workflow_execution_open_counts
  ?open_lambda_functions:(open_lambda_functions_ : int option) 
  ~open_child_workflow_executions:(open_child_workflow_executions_ : int) 
  ~open_timers:(open_timers_ : int) 
  ~open_decision_tasks:(open_decision_tasks_ : int) 
  ~open_activity_tasks:(open_activity_tasks_ : int)  () =
  ({
     open_lambda_functions = open_lambda_functions_;
     open_child_workflow_executions = open_child_workflow_executions_;
     open_timers = open_timers_;
     open_decision_tasks = open_decision_tasks_;
     open_activity_tasks = open_activity_tasks_
   } : workflow_execution_open_counts)
let make_workflow_execution_info
  ?cancel_requested:(cancel_requested_ : bool option) 
  ?tag_list:(tag_list_ : string list option) 
  ?parent:(parent_ : workflow_execution option) 
  ?close_status:(close_status_ : close_status option) 
  ?close_timestamp:(close_timestamp_ : CoreTypes.Timestamp.t option) 
  ~execution_status:(execution_status_ : execution_status) 
  ~start_timestamp:(start_timestamp_ : CoreTypes.Timestamp.t) 
  ~workflow_type:(workflow_type_ : workflow_type) 
  ~execution:(execution_ : workflow_execution)  () =
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
  ?next_page_token:(next_page_token_ : string option) 
  ~execution_infos:(execution_infos_ : workflow_execution_info list)  () =
  ({ next_page_token = next_page_token_; execution_infos = execution_infos_ } : 
  workflow_execution_infos)
let make_workflow_execution_filter ~workflow_id:(workflow_id_ : string)  () =
  ({ workflow_id = workflow_id_ } : workflow_execution_filter)
let make_workflow_execution_failed_event_attributes
  ?details:(details_ : string option)  ?reason:(reason_ : string option) 
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     details = details_;
     reason = reason_
   } : workflow_execution_failed_event_attributes)
let make_workflow_execution_configuration
  ?lambda_role:(lambda_role_ : string option) 
  ?task_priority:(task_priority_ : string option) 
  ~child_policy:(child_policy_ : child_policy) 
  ~task_list:(task_list_ : task_list) 
  ~execution_start_to_close_timeout:(execution_start_to_close_timeout_ :
                                      string)
   ~task_start_to_close_timeout:(task_start_to_close_timeout_ : string)  () =
  ({
     lambda_role = lambda_role_;
     child_policy = child_policy_;
     task_priority = task_priority_;
     task_list = task_list_;
     execution_start_to_close_timeout = execution_start_to_close_timeout_;
     task_start_to_close_timeout = task_start_to_close_timeout_
   } : workflow_execution_configuration)
let make_workflow_execution_detail
  ?latest_execution_context:(latest_execution_context_ : string option) 
  ?latest_activity_task_timestamp:(latest_activity_task_timestamp_ :
                                    CoreTypes.Timestamp.t option)
   ~open_counts:(open_counts_ : workflow_execution_open_counts) 
  ~execution_configuration:(execution_configuration_ :
                             workflow_execution_configuration)
   ~execution_info:(execution_info_ : workflow_execution_info)  () =
  ({
     latest_execution_context = latest_execution_context_;
     latest_activity_task_timestamp = latest_activity_task_timestamp_;
     open_counts = open_counts_;
     execution_configuration = execution_configuration_;
     execution_info = execution_info_
   } : workflow_execution_detail)
let make_workflow_execution_count ?truncated:(truncated_ : bool option) 
  ~count:(count_ : int)  () =
  ({ truncated = truncated_; count = count_ } : workflow_execution_count)
let make_workflow_execution_continued_as_new_event_attributes
  ?lambda_role:(lambda_role_ : string option) 
  ?tag_list:(tag_list_ : string list option) 
  ?task_start_to_close_timeout:(task_start_to_close_timeout_ : string option)
   ?task_priority:(task_priority_ : string option) 
  ?execution_start_to_close_timeout:(execution_start_to_close_timeout_ :
                                      string option)
   ?input:(input_ : string option) 
  ~workflow_type:(workflow_type_ : workflow_type) 
  ~child_policy:(child_policy_ : child_policy) 
  ~task_list:(task_list_ : task_list) 
  ~new_execution_run_id:(new_execution_run_id_ : string) 
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
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
  ?result:(result_ : string option) 
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     result = result_
   } : workflow_execution_completed_event_attributes)
let make_workflow_execution_canceled_event_attributes
  ?details:(details_ : string option) 
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     details = details_
   } : workflow_execution_canceled_event_attributes)
let make_workflow_execution_cancel_requested_event_attributes
  ?cause:(cause_ : workflow_execution_cancel_requested_cause option) 
  ?external_initiated_event_id:(external_initiated_event_id_ : int option) 
  ?external_workflow_execution:(external_workflow_execution_ :
                                 workflow_execution option)
   () =
  ({
     cause = cause_;
     external_initiated_event_id = external_initiated_event_id_;
     external_workflow_execution = external_workflow_execution_
   } : workflow_execution_cancel_requested_event_attributes)
let make_untag_resource_input ~tag_keys:(tag_keys_ : string list) 
  ~resource_arn:(resource_arn_ : string)  () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_input)
let make_undeprecate_workflow_type_input
  ~workflow_type:(workflow_type_ : workflow_type)  ~domain:(domain_ : string)
   () =
  ({ workflow_type = workflow_type_; domain = domain_ } : undeprecate_workflow_type_input)
let make_undeprecate_domain_input ~name:(name_ : string)  () =
  ({ name = name_ } : undeprecate_domain_input)
let make_activity_type ~version:(version_ : string)  ~name:(name_ : string) 
  () = ({ version = version_; name = name_ } : activity_type)
let make_undeprecate_activity_type_input
  ~activity_type:(activity_type_ : activity_type)  ~domain:(domain_ : string)
   () =
  ({ activity_type = activity_type_; domain = domain_ } : undeprecate_activity_type_input)
let make_timer_started_event_attributes ?control:(control_ : string option) 
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~start_to_fire_timeout:(start_to_fire_timeout_ : string) 
  ~timer_id:(timer_id_ : string)  () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     start_to_fire_timeout = start_to_fire_timeout_;
     control = control_;
     timer_id = timer_id_
   } : timer_started_event_attributes)
let make_timer_fired_event_attributes
  ~started_event_id:(started_event_id_ : int)  ~timer_id:(timer_id_ : string)
   () =
  ({ started_event_id = started_event_id_; timer_id = timer_id_ } : timer_fired_event_attributes)
let make_timer_canceled_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~started_event_id:(started_event_id_ : int) 
  ~timer_id:(timer_id_ : string)  () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     started_event_id = started_event_id_;
     timer_id = timer_id_
   } : timer_canceled_event_attributes)
let make_terminate_workflow_execution_input
  ?child_policy:(child_policy_ : child_policy option) 
  ?details:(details_ : string option)  ?reason:(reason_ : string option) 
  ?run_id:(run_id_ : string option)  ~workflow_id:(workflow_id_ : string) 
  ~domain:(domain_ : string)  () =
  ({
     child_policy = child_policy_;
     details = details_;
     reason = reason_;
     run_id = run_id_;
     workflow_id = workflow_id_;
     domain = domain_
   } : terminate_workflow_execution_input)
let make_resource_tag ?value:(value_ : string option)  ~key:(key_ : string) 
  () = ({ value = value_; key = key_ } : resource_tag)
let make_tag_resource_input ~tags:(tags_ : resource_tag list) 
  ~resource_arn:(resource_arn_ : string)  () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_input)
let make_tag_filter ~tag:(tag_ : string)  () = ({ tag = tag_ } : tag_filter)
let make_start_workflow_execution_input
  ?lambda_role:(lambda_role_ : string option) 
  ?child_policy:(child_policy_ : child_policy option) 
  ?task_start_to_close_timeout:(task_start_to_close_timeout_ : string option)
   ?tag_list:(tag_list_ : string list option) 
  ?execution_start_to_close_timeout:(execution_start_to_close_timeout_ :
                                      string option)
   ?input:(input_ : string option) 
  ?task_priority:(task_priority_ : string option) 
  ?task_list:(task_list_ : task_list option) 
  ~workflow_type:(workflow_type_ : workflow_type) 
  ~workflow_id:(workflow_id_ : string)  ~domain:(domain_ : string)  () =
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
let make_run ?run_id:(run_id_ : string option)  () =
  ({ run_id = run_id_ } : run)
let make_start_timer_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~cause:(cause_ : start_timer_failed_cause)  ~timer_id:(timer_id_ : string)
   () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     cause = cause_;
     timer_id = timer_id_
   } : start_timer_failed_event_attributes)
let make_start_timer_decision_attributes ?control:(control_ : string option) 
  ~start_to_fire_timeout:(start_to_fire_timeout_ : string) 
  ~timer_id:(timer_id_ : string)  () =
  ({
     start_to_fire_timeout = start_to_fire_timeout_;
     control = control_;
     timer_id = timer_id_
   } : start_timer_decision_attributes)
let make_start_lambda_function_failed_event_attributes
  ?message:(message_ : string option) 
  ?cause:(cause_ : start_lambda_function_failed_cause option) 
  ?scheduled_event_id:(scheduled_event_id_ : int option)  () =
  ({
     message = message_;
     cause = cause_;
     scheduled_event_id = scheduled_event_id_
   } : start_lambda_function_failed_event_attributes)
let make_start_child_workflow_execution_initiated_event_attributes
  ?lambda_role:(lambda_role_ : string option) 
  ?tag_list:(tag_list_ : string list option) 
  ?task_start_to_close_timeout:(task_start_to_close_timeout_ : string option)
   ?task_priority:(task_priority_ : string option) 
  ?execution_start_to_close_timeout:(execution_start_to_close_timeout_ :
                                      string option)
   ?input:(input_ : string option)  ?control:(control_ : string option) 
  ~child_policy:(child_policy_ : child_policy) 
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~task_list:(task_list_ : task_list) 
  ~workflow_type:(workflow_type_ : workflow_type) 
  ~workflow_id:(workflow_id_ : string)  () =
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
  ?control:(control_ : string option) 
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~initiated_event_id:(initiated_event_id_ : int) 
  ~workflow_id:(workflow_id_ : string) 
  ~cause:(cause_ : start_child_workflow_execution_failed_cause) 
  ~workflow_type:(workflow_type_ : workflow_type)  () =
  ({
     control = control_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     initiated_event_id = initiated_event_id_;
     workflow_id = workflow_id_;
     cause = cause_;
     workflow_type = workflow_type_
   } : start_child_workflow_execution_failed_event_attributes)
let make_start_child_workflow_execution_decision_attributes
  ?lambda_role:(lambda_role_ : string option) 
  ?tag_list:(tag_list_ : string list option) 
  ?child_policy:(child_policy_ : child_policy option) 
  ?task_start_to_close_timeout:(task_start_to_close_timeout_ : string option)
   ?task_priority:(task_priority_ : string option) 
  ?task_list:(task_list_ : task_list option) 
  ?execution_start_to_close_timeout:(execution_start_to_close_timeout_ :
                                      string option)
   ?input:(input_ : string option)  ?control:(control_ : string option) 
  ~workflow_id:(workflow_id_ : string) 
  ~workflow_type:(workflow_type_ : workflow_type)  () =
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
let make_signal_workflow_execution_input ?input:(input_ : string option) 
  ?run_id:(run_id_ : string option)  ~signal_name:(signal_name_ : string) 
  ~workflow_id:(workflow_id_ : string)  ~domain:(domain_ : string)  () =
  ({
     input = input_;
     signal_name = signal_name_;
     run_id = run_id_;
     workflow_id = workflow_id_;
     domain = domain_
   } : signal_workflow_execution_input)
let make_schedule_activity_task_decision_attributes
  ?heartbeat_timeout:(heartbeat_timeout_ : string option) 
  ?start_to_close_timeout:(start_to_close_timeout_ : string option) 
  ?schedule_to_start_timeout:(schedule_to_start_timeout_ : string option) 
  ?task_priority:(task_priority_ : string option) 
  ?task_list:(task_list_ : task_list option) 
  ?schedule_to_close_timeout:(schedule_to_close_timeout_ : string option) 
  ?input:(input_ : string option)  ?control:(control_ : string option) 
  ~activity_id:(activity_id_ : string) 
  ~activity_type:(activity_type_ : activity_type)  () =
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
  ~activity_id:(activity_id_ : string)  () =
  ({ activity_id = activity_id_ } : request_cancel_activity_task_decision_attributes)
let make_complete_workflow_execution_decision_attributes
  ?result:(result_ : string option)  () =
  ({ result = result_ } : complete_workflow_execution_decision_attributes)
let make_fail_workflow_execution_decision_attributes
  ?details:(details_ : string option)  ?reason:(reason_ : string option)  ()
  =
  ({ details = details_; reason = reason_ } : fail_workflow_execution_decision_attributes)
let make_cancel_workflow_execution_decision_attributes
  ?details:(details_ : string option)  () =
  ({ details = details_ } : cancel_workflow_execution_decision_attributes)
let make_continue_as_new_workflow_execution_decision_attributes
  ?lambda_role:(lambda_role_ : string option) 
  ?workflow_type_version:(workflow_type_version_ : string option) 
  ?tag_list:(tag_list_ : string list option) 
  ?child_policy:(child_policy_ : child_policy option) 
  ?task_start_to_close_timeout:(task_start_to_close_timeout_ : string option)
   ?task_priority:(task_priority_ : string option) 
  ?task_list:(task_list_ : task_list option) 
  ?execution_start_to_close_timeout:(execution_start_to_close_timeout_ :
                                      string option)
   ?input:(input_ : string option)  () =
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
let make_record_marker_decision_attributes
  ?details:(details_ : string option)  ~marker_name:(marker_name_ : string) 
  () =
  ({ details = details_; marker_name = marker_name_ } : record_marker_decision_attributes)
let make_cancel_timer_decision_attributes ~timer_id:(timer_id_ : string)  ()
  = ({ timer_id = timer_id_ } : cancel_timer_decision_attributes)
let make_signal_external_workflow_execution_decision_attributes
  ?control:(control_ : string option)  ?input:(input_ : string option) 
  ?run_id:(run_id_ : string option)  ~signal_name:(signal_name_ : string) 
  ~workflow_id:(workflow_id_ : string)  () =
  ({
     control = control_;
     input = input_;
     signal_name = signal_name_;
     run_id = run_id_;
     workflow_id = workflow_id_
   } : signal_external_workflow_execution_decision_attributes)
let make_request_cancel_external_workflow_execution_decision_attributes
  ?control:(control_ : string option)  ?run_id:(run_id_ : string option) 
  ~workflow_id:(workflow_id_ : string)  () =
  ({ control = control_; run_id = run_id_; workflow_id = workflow_id_ } : 
  request_cancel_external_workflow_execution_decision_attributes)
let make_schedule_lambda_function_decision_attributes
  ?start_to_close_timeout:(start_to_close_timeout_ : string option) 
  ?input:(input_ : string option)  ?control:(control_ : string option) 
  ~name:(name_ : string)  ~id:(id_ : string)  () =
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
                                       cancel_timer_decision_attributes
                                         option)
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
   ~decision_type:(decision_type_ : decision_type)  () =
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
                                         : string option)
   ?task_list:(task_list_ : task_list option) 
  ?execution_context:(execution_context_ : string option) 
  ?decisions:(decisions_ : decision list option) 
  ~task_token:(task_token_ : string)  () =
  ({
     task_list_schedule_to_start_timeout =
       task_list_schedule_to_start_timeout_;
     task_list = task_list_;
     execution_context = execution_context_;
     decisions = decisions_;
     task_token = task_token_
   } : respond_decision_task_completed_input)
let make_respond_activity_task_failed_input
  ?details:(details_ : string option)  ?reason:(reason_ : string option) 
  ~task_token:(task_token_ : string)  () =
  ({ details = details_; reason = reason_; task_token = task_token_ } : 
  respond_activity_task_failed_input)
let make_respond_activity_task_completed_input
  ?result:(result_ : string option)  ~task_token:(task_token_ : string)  () =
  ({ result = result_; task_token = task_token_ } : respond_activity_task_completed_input)
let make_respond_activity_task_canceled_input
  ?details:(details_ : string option)  ~task_token:(task_token_ : string)  ()
  =
  ({ details = details_; task_token = task_token_ } : respond_activity_task_canceled_input)
let make_request_cancel_workflow_execution_input
  ?run_id:(run_id_ : string option)  ~workflow_id:(workflow_id_ : string) 
  ~domain:(domain_ : string)  () =
  ({ run_id = run_id_; workflow_id = workflow_id_; domain = domain_ } : 
  request_cancel_workflow_execution_input)
let make_register_workflow_type_input
  ?default_lambda_role:(default_lambda_role_ : string option) 
  ?default_child_policy:(default_child_policy_ : child_policy option) 
  ?default_task_priority:(default_task_priority_ : string option) 
  ?default_task_list:(default_task_list_ : task_list option) 
  ?default_execution_start_to_close_timeout:(default_execution_start_to_close_timeout_
                                              : string option)
   ?default_task_start_to_close_timeout:(default_task_start_to_close_timeout_
                                          : string option)
   ?description:(description_ : string option)  ~version:(version_ : string) 
  ~name:(name_ : string)  ~domain:(domain_ : string)  () =
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
let make_register_domain_input ?tags:(tags_ : resource_tag list option) 
  ?description:(description_ : string option) 
  ~workflow_execution_retention_period_in_days:(workflow_execution_retention_period_in_days_
                                                 : string)
   ~name:(name_ : string)  () =
  ({
     tags = tags_;
     workflow_execution_retention_period_in_days =
       workflow_execution_retention_period_in_days_;
     description = description_;
     name = name_
   } : register_domain_input)
let make_register_activity_type_input
  ?default_task_schedule_to_close_timeout:(default_task_schedule_to_close_timeout_
                                            : string option)
   ?default_task_schedule_to_start_timeout:(default_task_schedule_to_start_timeout_
                                             : string option)
   ?default_task_priority:(default_task_priority_ : string option) 
  ?default_task_list:(default_task_list_ : task_list option) 
  ?default_task_heartbeat_timeout:(default_task_heartbeat_timeout_ :
                                    string option)
   ?default_task_start_to_close_timeout:(default_task_start_to_close_timeout_
                                          : string option)
   ?description:(description_ : string option)  ~version:(version_ : string) 
  ~name:(name_ : string)  ~domain:(domain_ : string)  () =
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
let make_activity_task_status ~cancel_requested:(cancel_requested_ : bool) 
  () = ({ cancel_requested = cancel_requested_ } : activity_task_status)
let make_record_activity_task_heartbeat_input
  ?details:(details_ : string option)  ~task_token:(task_token_ : string)  ()
  =
  ({ details = details_; task_token = task_token_ } : record_activity_task_heartbeat_input)
let make_complete_workflow_execution_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~cause:(cause_ : complete_workflow_execution_failed_cause)  () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     cause = cause_
   } : complete_workflow_execution_failed_event_attributes)
let make_fail_workflow_execution_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~cause:(cause_ : fail_workflow_execution_failed_cause)  () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     cause = cause_
   } : fail_workflow_execution_failed_event_attributes)
let make_cancel_workflow_execution_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~cause:(cause_ : cancel_workflow_execution_failed_cause)  () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     cause = cause_
   } : cancel_workflow_execution_failed_event_attributes)
let make_continue_as_new_workflow_execution_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~cause:(cause_ : continue_as_new_workflow_execution_failed_cause)  () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     cause = cause_
   } : continue_as_new_workflow_execution_failed_event_attributes)
let make_decision_task_scheduled_event_attributes
  ?schedule_to_start_timeout:(schedule_to_start_timeout_ : string option) 
  ?start_to_close_timeout:(start_to_close_timeout_ : string option) 
  ?task_priority:(task_priority_ : string option) 
  ~task_list:(task_list_ : task_list)  () =
  ({
     schedule_to_start_timeout = schedule_to_start_timeout_;
     start_to_close_timeout = start_to_close_timeout_;
     task_priority = task_priority_;
     task_list = task_list_
   } : decision_task_scheduled_event_attributes)
let make_decision_task_started_event_attributes
  ?identity:(identity_ : string option) 
  ~scheduled_event_id:(scheduled_event_id_ : int)  () =
  ({ scheduled_event_id = scheduled_event_id_; identity = identity_ } : 
  decision_task_started_event_attributes)
let make_decision_task_completed_event_attributes
  ?task_list_schedule_to_start_timeout:(task_list_schedule_to_start_timeout_
                                         : string option)
   ?task_list:(task_list_ : task_list option) 
  ?execution_context:(execution_context_ : string option) 
  ~started_event_id:(started_event_id_ : int) 
  ~scheduled_event_id:(scheduled_event_id_ : int)  () =
  ({
     task_list_schedule_to_start_timeout =
       task_list_schedule_to_start_timeout_;
     task_list = task_list_;
     started_event_id = started_event_id_;
     scheduled_event_id = scheduled_event_id_;
     execution_context = execution_context_
   } : decision_task_completed_event_attributes)
let make_decision_task_timed_out_event_attributes
  ~started_event_id:(started_event_id_ : int) 
  ~scheduled_event_id:(scheduled_event_id_ : int) 
  ~timeout_type:(timeout_type_ : decision_task_timeout_type)  () =
  ({
     started_event_id = started_event_id_;
     scheduled_event_id = scheduled_event_id_;
     timeout_type = timeout_type_
   } : decision_task_timed_out_event_attributes)
let make_activity_task_scheduled_event_attributes
  ?heartbeat_timeout:(heartbeat_timeout_ : string option) 
  ?task_priority:(task_priority_ : string option) 
  ?start_to_close_timeout:(start_to_close_timeout_ : string option) 
  ?schedule_to_close_timeout:(schedule_to_close_timeout_ : string option) 
  ?schedule_to_start_timeout:(schedule_to_start_timeout_ : string option) 
  ?control:(control_ : string option)  ?input:(input_ : string option) 
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~task_list:(task_list_ : task_list)  ~activity_id:(activity_id_ : string) 
  ~activity_type:(activity_type_ : activity_type)  () =
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
  ?identity:(identity_ : string option) 
  ~scheduled_event_id:(scheduled_event_id_ : int)  () =
  ({ scheduled_event_id = scheduled_event_id_; identity = identity_ } : 
  activity_task_started_event_attributes)
let make_activity_task_completed_event_attributes
  ?result:(result_ : string option) 
  ~started_event_id:(started_event_id_ : int) 
  ~scheduled_event_id:(scheduled_event_id_ : int)  () =
  ({
     started_event_id = started_event_id_;
     scheduled_event_id = scheduled_event_id_;
     result = result_
   } : activity_task_completed_event_attributes)
let make_activity_task_failed_event_attributes
  ?details:(details_ : string option)  ?reason:(reason_ : string option) 
  ~started_event_id:(started_event_id_ : int) 
  ~scheduled_event_id:(scheduled_event_id_ : int)  () =
  ({
     started_event_id = started_event_id_;
     scheduled_event_id = scheduled_event_id_;
     details = details_;
     reason = reason_
   } : activity_task_failed_event_attributes)
let make_activity_task_timed_out_event_attributes
  ?details:(details_ : string option) 
  ~started_event_id:(started_event_id_ : int) 
  ~scheduled_event_id:(scheduled_event_id_ : int) 
  ~timeout_type:(timeout_type_ : activity_task_timeout_type)  () =
  ({
     details = details_;
     started_event_id = started_event_id_;
     scheduled_event_id = scheduled_event_id_;
     timeout_type = timeout_type_
   } : activity_task_timed_out_event_attributes)
let make_activity_task_canceled_event_attributes
  ?latest_cancel_requested_event_id:(latest_cancel_requested_event_id_ :
                                      int option)
   ?details:(details_ : string option) 
  ~started_event_id:(started_event_id_ : int) 
  ~scheduled_event_id:(scheduled_event_id_ : int)  () =
  ({
     latest_cancel_requested_event_id = latest_cancel_requested_event_id_;
     started_event_id = started_event_id_;
     scheduled_event_id = scheduled_event_id_;
     details = details_
   } : activity_task_canceled_event_attributes)
let make_activity_task_cancel_requested_event_attributes
  ~activity_id:(activity_id_ : string) 
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   () =
  ({
     activity_id = activity_id_;
     decision_task_completed_event_id = decision_task_completed_event_id_
   } : activity_task_cancel_requested_event_attributes)
let make_marker_recorded_event_attributes ?details:(details_ : string option)
   ~decision_task_completed_event_id:(decision_task_completed_event_id_ :
                                       int)
   ~marker_name:(marker_name_ : string)  () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     details = details_;
     marker_name = marker_name_
   } : marker_recorded_event_attributes)
let make_record_marker_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~cause:(cause_ : record_marker_failed_cause) 
  ~marker_name:(marker_name_ : string)  () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     cause = cause_;
     marker_name = marker_name_
   } : record_marker_failed_event_attributes)
let make_child_workflow_execution_started_event_attributes
  ~initiated_event_id:(initiated_event_id_ : int) 
  ~workflow_type:(workflow_type_ : workflow_type) 
  ~workflow_execution:(workflow_execution_ : workflow_execution)  () =
  ({
     initiated_event_id = initiated_event_id_;
     workflow_type = workflow_type_;
     workflow_execution = workflow_execution_
   } : child_workflow_execution_started_event_attributes)
let make_child_workflow_execution_completed_event_attributes
  ?result:(result_ : string option) 
  ~started_event_id:(started_event_id_ : int) 
  ~initiated_event_id:(initiated_event_id_ : int) 
  ~workflow_type:(workflow_type_ : workflow_type) 
  ~workflow_execution:(workflow_execution_ : workflow_execution)  () =
  ({
     started_event_id = started_event_id_;
     initiated_event_id = initiated_event_id_;
     result = result_;
     workflow_type = workflow_type_;
     workflow_execution = workflow_execution_
   } : child_workflow_execution_completed_event_attributes)
let make_child_workflow_execution_failed_event_attributes
  ?details:(details_ : string option)  ?reason:(reason_ : string option) 
  ~started_event_id:(started_event_id_ : int) 
  ~initiated_event_id:(initiated_event_id_ : int) 
  ~workflow_type:(workflow_type_ : workflow_type) 
  ~workflow_execution:(workflow_execution_ : workflow_execution)  () =
  ({
     started_event_id = started_event_id_;
     initiated_event_id = initiated_event_id_;
     details = details_;
     reason = reason_;
     workflow_type = workflow_type_;
     workflow_execution = workflow_execution_
   } : child_workflow_execution_failed_event_attributes)
let make_child_workflow_execution_timed_out_event_attributes
  ~started_event_id:(started_event_id_ : int) 
  ~initiated_event_id:(initiated_event_id_ : int) 
  ~timeout_type:(timeout_type_ : workflow_execution_timeout_type) 
  ~workflow_type:(workflow_type_ : workflow_type) 
  ~workflow_execution:(workflow_execution_ : workflow_execution)  () =
  ({
     started_event_id = started_event_id_;
     initiated_event_id = initiated_event_id_;
     timeout_type = timeout_type_;
     workflow_type = workflow_type_;
     workflow_execution = workflow_execution_
   } : child_workflow_execution_timed_out_event_attributes)
let make_child_workflow_execution_canceled_event_attributes
  ?details:(details_ : string option) 
  ~started_event_id:(started_event_id_ : int) 
  ~initiated_event_id:(initiated_event_id_ : int) 
  ~workflow_type:(workflow_type_ : workflow_type) 
  ~workflow_execution:(workflow_execution_ : workflow_execution)  () =
  ({
     started_event_id = started_event_id_;
     initiated_event_id = initiated_event_id_;
     details = details_;
     workflow_type = workflow_type_;
     workflow_execution = workflow_execution_
   } : child_workflow_execution_canceled_event_attributes)
let make_child_workflow_execution_terminated_event_attributes
  ~started_event_id:(started_event_id_ : int) 
  ~initiated_event_id:(initiated_event_id_ : int) 
  ~workflow_type:(workflow_type_ : workflow_type) 
  ~workflow_execution:(workflow_execution_ : workflow_execution)  () =
  ({
     started_event_id = started_event_id_;
     initiated_event_id = initiated_event_id_;
     workflow_type = workflow_type_;
     workflow_execution = workflow_execution_
   } : child_workflow_execution_terminated_event_attributes)
let make_signal_external_workflow_execution_initiated_event_attributes
  ?control:(control_ : string option)  ?input:(input_ : string option) 
  ?run_id:(run_id_ : string option) 
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~signal_name:(signal_name_ : string)  ~workflow_id:(workflow_id_ : string)
   () =
  ({
     control = control_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     input = input_;
     signal_name = signal_name_;
     run_id = run_id_;
     workflow_id = workflow_id_
   } : signal_external_workflow_execution_initiated_event_attributes)
let make_external_workflow_execution_signaled_event_attributes
  ~initiated_event_id:(initiated_event_id_ : int) 
  ~workflow_execution:(workflow_execution_ : workflow_execution)  () =
  ({
     initiated_event_id = initiated_event_id_;
     workflow_execution = workflow_execution_
   } : external_workflow_execution_signaled_event_attributes)
let make_signal_external_workflow_execution_failed_event_attributes
  ?control:(control_ : string option)  ?run_id:(run_id_ : string option) 
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~initiated_event_id:(initiated_event_id_ : int) 
  ~cause:(cause_ : signal_external_workflow_execution_failed_cause) 
  ~workflow_id:(workflow_id_ : string)  () =
  ({
     control = control_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     initiated_event_id = initiated_event_id_;
     cause = cause_;
     run_id = run_id_;
     workflow_id = workflow_id_
   } : signal_external_workflow_execution_failed_event_attributes)
let make_external_workflow_execution_cancel_requested_event_attributes
  ~initiated_event_id:(initiated_event_id_ : int) 
  ~workflow_execution:(workflow_execution_ : workflow_execution)  () =
  ({
     initiated_event_id = initiated_event_id_;
     workflow_execution = workflow_execution_
   } : external_workflow_execution_cancel_requested_event_attributes)
let make_request_cancel_external_workflow_execution_initiated_event_attributes
  ?control:(control_ : string option)  ?run_id:(run_id_ : string option) 
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~workflow_id:(workflow_id_ : string)  () =
  ({
     control = control_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     run_id = run_id_;
     workflow_id = workflow_id_
   } : request_cancel_external_workflow_execution_initiated_event_attributes)
let make_request_cancel_external_workflow_execution_failed_event_attributes
  ?control:(control_ : string option)  ?run_id:(run_id_ : string option) 
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~initiated_event_id:(initiated_event_id_ : int) 
  ~cause:(cause_ : request_cancel_external_workflow_execution_failed_cause) 
  ~workflow_id:(workflow_id_ : string)  () =
  ({
     control = control_;
     decision_task_completed_event_id = decision_task_completed_event_id_;
     initiated_event_id = initiated_event_id_;
     cause = cause_;
     run_id = run_id_;
     workflow_id = workflow_id_
   } : request_cancel_external_workflow_execution_failed_event_attributes)
let make_schedule_activity_task_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~cause:(cause_ : schedule_activity_task_failed_cause) 
  ~activity_id:(activity_id_ : string) 
  ~activity_type:(activity_type_ : activity_type)  () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     cause = cause_;
     activity_id = activity_id_;
     activity_type = activity_type_
   } : schedule_activity_task_failed_event_attributes)
let make_request_cancel_activity_task_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~cause:(cause_ : request_cancel_activity_task_failed_cause) 
  ~activity_id:(activity_id_ : string)  () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     cause = cause_;
     activity_id = activity_id_
   } : request_cancel_activity_task_failed_event_attributes)
let make_cancel_timer_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~cause:(cause_ : cancel_timer_failed_cause) 
  ~timer_id:(timer_id_ : string)  () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     cause = cause_;
     timer_id = timer_id_
   } : cancel_timer_failed_event_attributes)
let make_lambda_function_scheduled_event_attributes
  ?start_to_close_timeout:(start_to_close_timeout_ : string option) 
  ?input:(input_ : string option)  ?control:(control_ : string option) 
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~name:(name_ : string)  ~id:(id_ : string)  () =
  ({
     decision_task_completed_event_id = decision_task_completed_event_id_;
     start_to_close_timeout = start_to_close_timeout_;
     input = input_;
     control = control_;
     name = name_;
     id = id_
   } : lambda_function_scheduled_event_attributes)
let make_lambda_function_started_event_attributes
  ~scheduled_event_id:(scheduled_event_id_ : int)  () =
  ({ scheduled_event_id = scheduled_event_id_ } : lambda_function_started_event_attributes)
let make_lambda_function_completed_event_attributes
  ?result:(result_ : string option) 
  ~started_event_id:(started_event_id_ : int) 
  ~scheduled_event_id:(scheduled_event_id_ : int)  () =
  ({
     result = result_;
     started_event_id = started_event_id_;
     scheduled_event_id = scheduled_event_id_
   } : lambda_function_completed_event_attributes)
let make_lambda_function_failed_event_attributes
  ?details:(details_ : string option)  ?reason:(reason_ : string option) 
  ~started_event_id:(started_event_id_ : int) 
  ~scheduled_event_id:(scheduled_event_id_ : int)  () =
  ({
     details = details_;
     reason = reason_;
     started_event_id = started_event_id_;
     scheduled_event_id = scheduled_event_id_
   } : lambda_function_failed_event_attributes)
let make_lambda_function_timed_out_event_attributes
  ?timeout_type:(timeout_type_ : lambda_function_timeout_type option) 
  ~started_event_id:(started_event_id_ : int) 
  ~scheduled_event_id:(scheduled_event_id_ : int)  () =
  ({
     timeout_type = timeout_type_;
     started_event_id = started_event_id_;
     scheduled_event_id = scheduled_event_id_
   } : lambda_function_timed_out_event_attributes)
let make_schedule_lambda_function_failed_event_attributes
  ~decision_task_completed_event_id:(decision_task_completed_event_id_ : int)
   ~cause:(cause_ : schedule_lambda_function_failed_cause) 
  ~name:(name_ : string)  ~id:(id_ : string)  () =
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
                                       marker_recorded_event_attributes
                                         option)
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
   ~event_id:(event_id_ : int)  ~event_type:(event_type_ : event_type) 
  ~event_timestamp:(event_timestamp_ : CoreTypes.Timestamp.t)  () =
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
  ?previous_started_event_id:(previous_started_event_id_ : int option) 
  ?next_page_token:(next_page_token_ : string option) 
  ~events:(events_ : history_event list) 
  ~workflow_type:(workflow_type_ : workflow_type) 
  ~workflow_execution:(workflow_execution_ : workflow_execution) 
  ~started_event_id:(started_event_id_ : int) 
  ~task_token:(task_token_ : string)  () =
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
                                     bool option)
   ?reverse_order:(reverse_order_ : bool option) 
  ?maximum_page_size:(maximum_page_size_ : int option) 
  ?next_page_token:(next_page_token_ : string option) 
  ?identity:(identity_ : string option)  ~task_list:(task_list_ : task_list) 
  ~domain:(domain_ : string)  () =
  ({
     start_at_previous_started_event = start_at_previous_started_event_;
     reverse_order = reverse_order_;
     maximum_page_size = maximum_page_size_;
     next_page_token = next_page_token_;
     identity = identity_;
     task_list = task_list_;
     domain = domain_
   } : poll_for_decision_task_input)
let make_activity_task ?input:(input_ : string option) 
  ~activity_type:(activity_type_ : activity_type) 
  ~workflow_execution:(workflow_execution_ : workflow_execution) 
  ~started_event_id:(started_event_id_ : int) 
  ~activity_id:(activity_id_ : string)  ~task_token:(task_token_ : string) 
  () =
  ({
     input = input_;
     activity_type = activity_type_;
     workflow_execution = workflow_execution_;
     started_event_id = started_event_id_;
     activity_id = activity_id_;
     task_token = task_token_
   } : activity_task)
let make_poll_for_activity_task_input ?identity:(identity_ : string option) 
  ~task_list:(task_list_ : task_list)  ~domain:(domain_ : string)  () =
  ({ identity = identity_; task_list = task_list_; domain = domain_ } : 
  poll_for_activity_task_input)
let make_list_workflow_types_input
  ?reverse_order:(reverse_order_ : bool option) 
  ?maximum_page_size:(maximum_page_size_ : int option) 
  ?next_page_token:(next_page_token_ : string option) 
  ?name:(name_ : string option) 
  ~registration_status:(registration_status_ : registration_status) 
  ~domain:(domain_ : string)  () =
  ({
     reverse_order = reverse_order_;
     maximum_page_size = maximum_page_size_;
     next_page_token = next_page_token_;
     registration_status = registration_status_;
     name = name_;
     domain = domain_
   } : list_workflow_types_input)
let make_list_tags_for_resource_output
  ?tags:(tags_ : resource_tag list option)  () =
  ({ tags = tags_ } : list_tags_for_resource_output)
let make_list_tags_for_resource_input ~resource_arn:(resource_arn_ : string) 
  () = ({ resource_arn = resource_arn_ } : list_tags_for_resource_input)
let make_execution_time_filter
  ?latest_date:(latest_date_ : CoreTypes.Timestamp.t option) 
  ~oldest_date:(oldest_date_ : CoreTypes.Timestamp.t)  () =
  ({ latest_date = latest_date_; oldest_date = oldest_date_ } : execution_time_filter)
let make_list_open_workflow_executions_input
  ?execution_filter:(execution_filter_ : workflow_execution_filter option) 
  ?reverse_order:(reverse_order_ : bool option) 
  ?maximum_page_size:(maximum_page_size_ : int option) 
  ?next_page_token:(next_page_token_ : string option) 
  ?tag_filter:(tag_filter_ : tag_filter option) 
  ?type_filter:(type_filter_ : workflow_type_filter option) 
  ~start_time_filter:(start_time_filter_ : execution_time_filter) 
  ~domain:(domain_ : string)  () =
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
let make_domain_info ?arn:(arn_ : string option) 
  ?description:(description_ : string option) 
  ~status:(status_ : registration_status)  ~name:(name_ : string)  () =
  ({ arn = arn_; description = description_; status = status_; name = name_ } : 
  domain_info)
let make_domain_infos ?next_page_token:(next_page_token_ : string option) 
  ~domain_infos:(domain_infos_ : domain_info list)  () =
  ({ next_page_token = next_page_token_; domain_infos = domain_infos_ } : 
  domain_infos)
let make_list_domains_input ?reverse_order:(reverse_order_ : bool option) 
  ?maximum_page_size:(maximum_page_size_ : int option) 
  ?next_page_token:(next_page_token_ : string option) 
  ~registration_status:(registration_status_ : registration_status)  () =
  ({
     reverse_order = reverse_order_;
     maximum_page_size = maximum_page_size_;
     registration_status = registration_status_;
     next_page_token = next_page_token_
   } : list_domains_input)
let make_close_status_filter ~status:(status_ : close_status)  () =
  ({ status = status_ } : close_status_filter)
let make_list_closed_workflow_executions_input
  ?reverse_order:(reverse_order_ : bool option) 
  ?maximum_page_size:(maximum_page_size_ : int option) 
  ?next_page_token:(next_page_token_ : string option) 
  ?tag_filter:(tag_filter_ : tag_filter option) 
  ?type_filter:(type_filter_ : workflow_type_filter option) 
  ?close_status_filter:(close_status_filter_ : close_status_filter option) 
  ?execution_filter:(execution_filter_ : workflow_execution_filter option) 
  ?close_time_filter:(close_time_filter_ : execution_time_filter option) 
  ?start_time_filter:(start_time_filter_ : execution_time_filter option) 
  ~domain:(domain_ : string)  () =
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
  ?deprecation_date:(deprecation_date_ : CoreTypes.Timestamp.t option) 
  ?description:(description_ : string option) 
  ~creation_date:(creation_date_ : CoreTypes.Timestamp.t) 
  ~status:(status_ : registration_status) 
  ~activity_type:(activity_type_ : activity_type)  () =
  ({
     deprecation_date = deprecation_date_;
     creation_date = creation_date_;
     description = description_;
     status = status_;
     activity_type = activity_type_
   } : activity_type_info)
let make_activity_type_infos
  ?next_page_token:(next_page_token_ : string option) 
  ~type_infos:(type_infos_ : activity_type_info list)  () =
  ({ next_page_token = next_page_token_; type_infos = type_infos_ } : 
  activity_type_infos)
let make_list_activity_types_input
  ?reverse_order:(reverse_order_ : bool option) 
  ?maximum_page_size:(maximum_page_size_ : int option) 
  ?next_page_token:(next_page_token_ : string option) 
  ?name:(name_ : string option) 
  ~registration_status:(registration_status_ : registration_status) 
  ~domain:(domain_ : string)  () =
  ({
     reverse_order = reverse_order_;
     maximum_page_size = maximum_page_size_;
     next_page_token = next_page_token_;
     registration_status = registration_status_;
     name = name_;
     domain = domain_
   } : list_activity_types_input)
let make_history ?next_page_token:(next_page_token_ : string option) 
  ~events:(events_ : history_event list)  () =
  ({ next_page_token = next_page_token_; events = events_ } : history)
let make_get_workflow_execution_history_input
  ?reverse_order:(reverse_order_ : bool option) 
  ?maximum_page_size:(maximum_page_size_ : int option) 
  ?next_page_token:(next_page_token_ : string option) 
  ~execution:(execution_ : workflow_execution)  ~domain:(domain_ : string) 
  () =
  ({
     reverse_order = reverse_order_;
     maximum_page_size = maximum_page_size_;
     next_page_token = next_page_token_;
     execution = execution_;
     domain = domain_
   } : get_workflow_execution_history_input)
let make_describe_workflow_type_input
  ~workflow_type:(workflow_type_ : workflow_type)  ~domain:(domain_ : string)
   () =
  ({ workflow_type = workflow_type_; domain = domain_ } : describe_workflow_type_input)
let make_describe_workflow_execution_input
  ~execution:(execution_ : workflow_execution)  ~domain:(domain_ : string) 
  () =
  ({ execution = execution_; domain = domain_ } : describe_workflow_execution_input)
let make_domain_configuration
  ~workflow_execution_retention_period_in_days:(workflow_execution_retention_period_in_days_
                                                 : string)
   () =
  ({
     workflow_execution_retention_period_in_days =
       workflow_execution_retention_period_in_days_
   } : domain_configuration)
let make_domain_detail ~configuration:(configuration_ : domain_configuration)
   ~domain_info:(domain_info_ : domain_info)  () =
  ({ configuration = configuration_; domain_info = domain_info_ } : domain_detail)
let make_describe_domain_input ~name:(name_ : string)  () =
  ({ name = name_ } : describe_domain_input)
let make_activity_type_configuration
  ?default_task_schedule_to_close_timeout:(default_task_schedule_to_close_timeout_
                                            : string option)
   ?default_task_schedule_to_start_timeout:(default_task_schedule_to_start_timeout_
                                             : string option)
   ?default_task_priority:(default_task_priority_ : string option) 
  ?default_task_list:(default_task_list_ : task_list option) 
  ?default_task_heartbeat_timeout:(default_task_heartbeat_timeout_ :
                                    string option)
   ?default_task_start_to_close_timeout:(default_task_start_to_close_timeout_
                                          : string option)
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
  ~type_info:(type_info_ : activity_type_info)  () =
  ({ configuration = configuration_; type_info = type_info_ } : activity_type_detail)
let make_describe_activity_type_input
  ~activity_type:(activity_type_ : activity_type)  ~domain:(domain_ : string)
   () =
  ({ activity_type = activity_type_; domain = domain_ } : describe_activity_type_input)
let make_deprecate_workflow_type_input
  ~workflow_type:(workflow_type_ : workflow_type)  ~domain:(domain_ : string)
   () =
  ({ workflow_type = workflow_type_; domain = domain_ } : deprecate_workflow_type_input)
let make_deprecate_domain_input ~name:(name_ : string)  () =
  ({ name = name_ } : deprecate_domain_input)
let make_deprecate_activity_type_input
  ~activity_type:(activity_type_ : activity_type)  ~domain:(domain_ : string)
   () =
  ({ activity_type = activity_type_; domain = domain_ } : deprecate_activity_type_input)
let make_delete_workflow_type_input
  ~workflow_type:(workflow_type_ : workflow_type)  ~domain:(domain_ : string)
   () =
  ({ workflow_type = workflow_type_; domain = domain_ } : delete_workflow_type_input)
let make_delete_activity_type_input
  ~activity_type:(activity_type_ : activity_type)  ~domain:(domain_ : string)
   () =
  ({ activity_type = activity_type_; domain = domain_ } : delete_activity_type_input)
let make_pending_task_count ?truncated:(truncated_ : bool option) 
  ~count:(count_ : int)  () =
  ({ truncated = truncated_; count = count_ } : pending_task_count)
let make_count_pending_decision_tasks_input
  ~task_list:(task_list_ : task_list)  ~domain:(domain_ : string)  () =
  ({ task_list = task_list_; domain = domain_ } : count_pending_decision_tasks_input)
let make_count_pending_activity_tasks_input
  ~task_list:(task_list_ : task_list)  ~domain:(domain_ : string)  () =
  ({ task_list = task_list_; domain = domain_ } : count_pending_activity_tasks_input)
let make_count_open_workflow_executions_input
  ?execution_filter:(execution_filter_ : workflow_execution_filter option) 
  ?tag_filter:(tag_filter_ : tag_filter option) 
  ?type_filter:(type_filter_ : workflow_type_filter option) 
  ~start_time_filter:(start_time_filter_ : execution_time_filter) 
  ~domain:(domain_ : string)  () =
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
  ~domain:(domain_ : string)  () =
  ({
     close_status_filter = close_status_filter_;
     tag_filter = tag_filter_;
     type_filter = type_filter_;
     execution_filter = execution_filter_;
     close_time_filter = close_time_filter_;
     start_time_filter = start_time_filter_;
     domain = domain_
   } : count_closed_workflow_executions_input)