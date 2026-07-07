open Types

let make_worker_block ?reason:(reason_ : string_ option)
    ?worker_id:(worker_id_ : customer_id option) () =
  ({ reason = reason_; worker_id = worker_id_ } : worker_block)

let make_qualification_type ?auto_granted_value:(auto_granted_value_ : integer option)
    ?auto_granted:(auto_granted_ : boolean_ option)
    ?is_requestable:(is_requestable_ : boolean_ option)
    ?retry_delay_in_seconds:(retry_delay_in_seconds_ : long option)
    ?answer_key:(answer_key_ : string_ option)
    ?test_duration_in_seconds:(test_duration_in_seconds_ : long option)
    ?test:(test_ : string_ option)
    ?qualification_type_status:(qualification_type_status_ : qualification_type_status option)
    ?keywords:(keywords_ : string_ option) ?description:(description_ : string_ option)
    ?name:(name_ : string_ option) ?creation_time:(creation_time_ : timestamp option)
    ?qualification_type_id:(qualification_type_id_ : entity_id option) () =
  ({
     auto_granted_value = auto_granted_value_;
     auto_granted = auto_granted_;
     is_requestable = is_requestable_;
     retry_delay_in_seconds = retry_delay_in_seconds_;
     answer_key = answer_key_;
     test_duration_in_seconds = test_duration_in_seconds_;
     test = test_;
     qualification_type_status = qualification_type_status_;
     keywords = keywords_;
     description = description_;
     name = name_;
     creation_time = creation_time_;
     qualification_type_id = qualification_type_id_;
   }
    : qualification_type)

let make_update_qualification_type_response
    ?qualification_type:(qualification_type_ : qualification_type option) () =
  ({ qualification_type = qualification_type_ } : update_qualification_type_response)

let make_update_qualification_type_request
    ?auto_granted_value:(auto_granted_value_ : integer option)
    ?auto_granted:(auto_granted_ : boolean_ option)
    ?retry_delay_in_seconds:(retry_delay_in_seconds_ : long option)
    ?test_duration_in_seconds:(test_duration_in_seconds_ : long option)
    ?answer_key:(answer_key_ : string_ option) ?test:(test_ : string_ option)
    ?qualification_type_status:(qualification_type_status_ : qualification_type_status option)
    ?description:(description_ : string_ option)
    ~qualification_type_id:(qualification_type_id_ : entity_id) () =
  ({
     auto_granted_value = auto_granted_value_;
     auto_granted = auto_granted_;
     retry_delay_in_seconds = retry_delay_in_seconds_;
     test_duration_in_seconds = test_duration_in_seconds_;
     answer_key = answer_key_;
     test = test_;
     qualification_type_status = qualification_type_status_;
     description = description_;
     qualification_type_id = qualification_type_id_;
   }
    : update_qualification_type_request)

let make_update_notification_settings_response () = (() : unit)

let make_notification_specification ~event_types:(event_types_ : event_type_list)
    ~version:(version_ : string_) ~transport:(transport_ : notification_transport)
    ~destination:(destination_ : string_) () =
  ({
     event_types = event_types_;
     version = version_;
     transport = transport_;
     destination = destination_;
   }
    : notification_specification)

let make_update_notification_settings_request ?active:(active_ : boolean_ option)
    ?notification:(notification_ : notification_specification option)
    ~hit_type_id:(hit_type_id_ : entity_id) () =
  ({ active = active_; notification = notification_; hit_type_id = hit_type_id_ }
    : update_notification_settings_request)

let make_update_hit_type_of_hit_response () = (() : unit)

let make_update_hit_type_of_hit_request ~hit_type_id:(hit_type_id_ : entity_id)
    ~hit_id:(hit_id_ : entity_id) () =
  ({ hit_type_id = hit_type_id_; hit_id = hit_id_ } : update_hit_type_of_hit_request)

let make_update_hit_review_status_response () = (() : unit)

let make_update_hit_review_status_request ?revert:(revert_ : boolean_ option)
    ~hit_id:(hit_id_ : entity_id) () =
  ({ revert = revert_; hit_id = hit_id_ } : update_hit_review_status_request)

let make_update_expiration_for_hit_response () = (() : unit)

let make_update_expiration_for_hit_request ~expire_at:(expire_at_ : timestamp)
    ~hit_id:(hit_id_ : entity_id) () =
  ({ expire_at = expire_at_; hit_id = hit_id_ } : update_expiration_for_hit_request)

let make_send_test_event_notification_response () = (() : unit)

let make_send_test_event_notification_request ~test_event_type:(test_event_type_ : event_type)
    ~notification:(notification_ : notification_specification) () =
  ({ test_event_type = test_event_type_; notification = notification_ }
    : send_test_event_notification_request)

let make_send_bonus_response () = (() : unit)

let make_send_bonus_request ?unique_request_token:(unique_request_token_ : idempotency_token option)
    ~reason:(reason_ : string_) ~assignment_id:(assignment_id_ : entity_id)
    ~bonus_amount:(bonus_amount_ : currency_amount) ~worker_id:(worker_id_ : customer_id) () =
  ({
     unique_request_token = unique_request_token_;
     reason = reason_;
     assignment_id = assignment_id_;
     bonus_amount = bonus_amount_;
     worker_id = worker_id_;
   }
    : send_bonus_request)

let make_review_result_detail ?value:(value_ : string_ option) ?key:(key_ : string_ option)
    ?question_id:(question_id_ : entity_id option) ?subject_type:(subject_type_ : string_ option)
    ?subject_id:(subject_id_ : entity_id option) ?action_id:(action_id_ : entity_id option) () =
  ({
     value = value_;
     key = key_;
     question_id = question_id_;
     subject_type = subject_type_;
     subject_id = subject_id_;
     action_id = action_id_;
   }
    : review_result_detail)

let make_review_action_detail ?error_code:(error_code_ : string_ option)
    ?result_:(result__ : string_ option) ?complete_time:(complete_time_ : timestamp option)
    ?status:(status_ : review_action_status option) ?target_type:(target_type_ : string_ option)
    ?target_id:(target_id_ : entity_id option) ?action_name:(action_name_ : string_ option)
    ?action_id:(action_id_ : entity_id option) () =
  ({
     error_code = error_code_;
     result_ = result__;
     complete_time = complete_time_;
     status = status_;
     target_type = target_type_;
     target_id = target_id_;
     action_name = action_name_;
     action_id = action_id_;
   }
    : review_action_detail)

let make_review_report ?review_actions:(review_actions_ : review_action_detail_list option)
    ?review_results:(review_results_ : review_result_detail_list option) () =
  ({ review_actions = review_actions_; review_results = review_results_ } : review_report)

let make_parameter_map_entry ?values:(values_ : string_list option) ?key:(key_ : string_ option) ()
    =
  ({ values = values_; key = key_ } : parameter_map_entry)

let make_policy_parameter ?map_entries:(map_entries_ : parameter_map_entry_list option)
    ?values:(values_ : string_list option) ?key:(key_ : string_ option) () =
  ({ map_entries = map_entries_; values = values_; key = key_ } : policy_parameter)

let make_review_policy ?parameters:(parameters_ : policy_parameter_list option)
    ~policy_name:(policy_name_ : string_) () =
  ({ parameters = parameters_; policy_name = policy_name_ } : review_policy)

let make_reject_qualification_request_response () = (() : unit)

let make_reject_qualification_request_request ?reason:(reason_ : string_ option)
    ~qualification_request_id:(qualification_request_id_ : string_) () =
  ({ reason = reason_; qualification_request_id = qualification_request_id_ }
    : reject_qualification_request_request)

let make_reject_assignment_response () = (() : unit)

let make_reject_assignment_request ~requester_feedback:(requester_feedback_ : string_)
    ~assignment_id:(assignment_id_ : entity_id) () =
  ({ requester_feedback = requester_feedback_; assignment_id = assignment_id_ }
    : reject_assignment_request)

let make_locale ?subdivision:(subdivision_ : country_parameters option)
    ~country:(country_ : country_parameters) () =
  ({ subdivision = subdivision_; country = country_ } : locale)

let make_qualification_requirement ?actions_guarded:(actions_guarded_ : hit_access_actions option)
    ?required_to_preview:(required_to_preview_ : boolean_ option)
    ?locale_values:(locale_values_ : locale_list option)
    ?integer_values:(integer_values_ : integer_list option) ~comparator:(comparator_ : comparator)
    ~qualification_type_id:(qualification_type_id_ : string_) () =
  ({
     actions_guarded = actions_guarded_;
     required_to_preview = required_to_preview_;
     locale_values = locale_values_;
     integer_values = integer_values_;
     comparator = comparator_;
     qualification_type_id = qualification_type_id_;
   }
    : qualification_requirement)

let make_qualification_request ?submit_time:(submit_time_ : timestamp option)
    ?answer:(answer_ : string_ option) ?test:(test_ : string_ option)
    ?worker_id:(worker_id_ : customer_id option)
    ?qualification_type_id:(qualification_type_id_ : entity_id option)
    ?qualification_request_id:(qualification_request_id_ : string_ option) () =
  ({
     submit_time = submit_time_;
     answer = answer_;
     test = test_;
     worker_id = worker_id_;
     qualification_type_id = qualification_type_id_;
     qualification_request_id = qualification_request_id_;
   }
    : qualification_request)

let make_qualification ?status:(status_ : qualification_status option)
    ?locale_value:(locale_value_ : locale option) ?integer_value:(integer_value_ : integer option)
    ?grant_time:(grant_time_ : timestamp option) ?worker_id:(worker_id_ : customer_id option)
    ?qualification_type_id:(qualification_type_id_ : entity_id option) () =
  ({
     status = status_;
     locale_value = locale_value_;
     integer_value = integer_value_;
     grant_time = grant_time_;
     worker_id = worker_id_;
     qualification_type_id = qualification_type_id_;
   }
    : qualification)

let make_notify_workers_failure_status ?worker_id:(worker_id_ : customer_id option)
    ?notify_workers_failure_message:(notify_workers_failure_message_ : string_ option)
    ?notify_workers_failure_code:(notify_workers_failure_code_ : notify_workers_failure_code option)
    () =
  ({
     worker_id = worker_id_;
     notify_workers_failure_message = notify_workers_failure_message_;
     notify_workers_failure_code = notify_workers_failure_code_;
   }
    : notify_workers_failure_status)

let make_notify_workers_response
    ?notify_workers_failure_statuses:
      (notify_workers_failure_statuses_ : notify_workers_failure_status_list option) () =
  ({ notify_workers_failure_statuses = notify_workers_failure_statuses_ } : notify_workers_response)

let make_notify_workers_request ~worker_ids:(worker_ids_ : customer_id_list)
    ~message_text:(message_text_ : string_) ~subject:(subject_ : string_) () =
  ({ worker_ids = worker_ids_; message_text = message_text_; subject = subject_ }
    : notify_workers_request)

let make_list_workers_with_qualification_type_response
    ?qualifications:(qualifications_ : qualification_list option)
    ?num_results:(num_results_ : integer option) ?next_token:(next_token_ : pagination_token option)
    () =
  ({ qualifications = qualifications_; num_results = num_results_; next_token = next_token_ }
    : list_workers_with_qualification_type_response)

let make_list_workers_with_qualification_type_request
    ?max_results:(max_results_ : result_size option)
    ?next_token:(next_token_ : pagination_token option)
    ?status:(status_ : qualification_status option)
    ~qualification_type_id:(qualification_type_id_ : entity_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     status = status_;
     qualification_type_id = qualification_type_id_;
   }
    : list_workers_with_qualification_type_request)

let make_list_worker_blocks_response ?worker_blocks:(worker_blocks_ : worker_block_list option)
    ?num_results:(num_results_ : integer option) ?next_token:(next_token_ : pagination_token option)
    () =
  ({ worker_blocks = worker_blocks_; num_results = num_results_; next_token = next_token_ }
    : list_worker_blocks_response)

let make_list_worker_blocks_request ?max_results:(max_results_ : result_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_worker_blocks_request)

let make_list_review_policy_results_for_hit_response
    ?next_token:(next_token_ : pagination_token option)
    ?hit_review_report:(hit_review_report_ : review_report option)
    ?assignment_review_report:(assignment_review_report_ : review_report option)
    ?hit_review_policy:(hit_review_policy_ : review_policy option)
    ?assignment_review_policy:(assignment_review_policy_ : review_policy option)
    ?hit_id:(hit_id_ : entity_id option) () =
  ({
     next_token = next_token_;
     hit_review_report = hit_review_report_;
     assignment_review_report = assignment_review_report_;
     hit_review_policy = hit_review_policy_;
     assignment_review_policy = assignment_review_policy_;
     hit_id = hit_id_;
   }
    : list_review_policy_results_for_hit_response)

let make_list_review_policy_results_for_hit_request ?max_results:(max_results_ : result_size option)
    ?next_token:(next_token_ : pagination_token option)
    ?retrieve_results:(retrieve_results_ : boolean_ option)
    ?retrieve_actions:(retrieve_actions_ : boolean_ option)
    ?policy_levels:(policy_levels_ : review_policy_level_list option) ~hit_id:(hit_id_ : entity_id)
    () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     retrieve_results = retrieve_results_;
     retrieve_actions = retrieve_actions_;
     policy_levels = policy_levels_;
     hit_id = hit_id_;
   }
    : list_review_policy_results_for_hit_request)

let make_hi_t ?number_of_assignments_completed:(number_of_assignments_completed_ : integer option)
    ?number_of_assignments_available:(number_of_assignments_available_ : integer option)
    ?number_of_assignments_pending:(number_of_assignments_pending_ : integer option)
    ?hit_review_status:(hit_review_status_ : hit_review_status option)
    ?qualification_requirements:
      (qualification_requirements_ : qualification_requirement_list option)
    ?requester_annotation:(requester_annotation_ : string_ option)
    ?assignment_duration_in_seconds:(assignment_duration_in_seconds_ : long option)
    ?expiration:(expiration_ : timestamp option)
    ?auto_approval_delay_in_seconds:(auto_approval_delay_in_seconds_ : long option)
    ?reward:(reward_ : currency_amount option) ?max_assignments:(max_assignments_ : integer option)
    ?hit_status:(hit_status_ : hit_status option) ?keywords:(keywords_ : string_ option)
    ?question:(question_ : string_ option) ?description:(description_ : string_ option)
    ?title:(title_ : string_ option) ?creation_time:(creation_time_ : timestamp option)
    ?hit_layout_id:(hit_layout_id_ : entity_id option)
    ?hit_group_id:(hit_group_id_ : entity_id option) ?hit_type_id:(hit_type_id_ : entity_id option)
    ?hit_id:(hit_id_ : entity_id option) () =
  ({
     number_of_assignments_completed = number_of_assignments_completed_;
     number_of_assignments_available = number_of_assignments_available_;
     number_of_assignments_pending = number_of_assignments_pending_;
     hit_review_status = hit_review_status_;
     qualification_requirements = qualification_requirements_;
     requester_annotation = requester_annotation_;
     assignment_duration_in_seconds = assignment_duration_in_seconds_;
     expiration = expiration_;
     auto_approval_delay_in_seconds = auto_approval_delay_in_seconds_;
     reward = reward_;
     max_assignments = max_assignments_;
     hit_status = hit_status_;
     keywords = keywords_;
     question = question_;
     description = description_;
     title = title_;
     creation_time = creation_time_;
     hit_layout_id = hit_layout_id_;
     hit_group_id = hit_group_id_;
     hit_type_id = hit_type_id_;
     hit_id = hit_id_;
   }
    : hi_t)

let make_list_reviewable_hi_ts_response ?hi_ts:(hi_ts_ : hit_list option)
    ?num_results:(num_results_ : integer option) ?next_token:(next_token_ : pagination_token option)
    () =
  ({ hi_ts = hi_ts_; num_results = num_results_; next_token = next_token_ }
    : list_reviewable_hi_ts_response)

let make_list_reviewable_hi_ts_request ?max_results:(max_results_ : result_size option)
    ?next_token:(next_token_ : pagination_token option)
    ?status:(status_ : reviewable_hit_status option) ?hit_type_id:(hit_type_id_ : entity_id option)
    () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     status = status_;
     hit_type_id = hit_type_id_;
   }
    : list_reviewable_hi_ts_request)

let make_list_qualification_types_response
    ?qualification_types:(qualification_types_ : qualification_type_list option)
    ?next_token:(next_token_ : pagination_token option) ?num_results:(num_results_ : integer option)
    () =
  ({
     qualification_types = qualification_types_;
     next_token = next_token_;
     num_results = num_results_;
   }
    : list_qualification_types_response)

let make_list_qualification_types_request ?max_results:(max_results_ : result_size option)
    ?next_token:(next_token_ : pagination_token option)
    ?must_be_owned_by_caller:(must_be_owned_by_caller_ : boolean_ option)
    ?query:(query_ : string_ option) ~must_be_requestable:(must_be_requestable_ : boolean_) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     must_be_owned_by_caller = must_be_owned_by_caller_;
     must_be_requestable = must_be_requestable_;
     query = query_;
   }
    : list_qualification_types_request)

let make_list_qualification_requests_response
    ?qualification_requests:(qualification_requests_ : qualification_request_list option)
    ?next_token:(next_token_ : pagination_token option) ?num_results:(num_results_ : integer option)
    () =
  ({
     qualification_requests = qualification_requests_;
     next_token = next_token_;
     num_results = num_results_;
   }
    : list_qualification_requests_response)

let make_list_qualification_requests_request ?max_results:(max_results_ : result_size option)
    ?next_token:(next_token_ : pagination_token option)
    ?qualification_type_id:(qualification_type_id_ : entity_id option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     qualification_type_id = qualification_type_id_;
   }
    : list_qualification_requests_request)

let make_list_hi_ts_for_qualification_type_response ?hi_ts:(hi_ts_ : hit_list option)
    ?num_results:(num_results_ : integer option) ?next_token:(next_token_ : pagination_token option)
    () =
  ({ hi_ts = hi_ts_; num_results = num_results_; next_token = next_token_ }
    : list_hi_ts_for_qualification_type_response)

let make_list_hi_ts_for_qualification_type_request ?max_results:(max_results_ : result_size option)
    ?next_token:(next_token_ : pagination_token option)
    ~qualification_type_id:(qualification_type_id_ : entity_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     qualification_type_id = qualification_type_id_;
   }
    : list_hi_ts_for_qualification_type_request)

let make_list_hi_ts_response ?hi_ts:(hi_ts_ : hit_list option)
    ?num_results:(num_results_ : integer option) ?next_token:(next_token_ : pagination_token option)
    () =
  ({ hi_ts = hi_ts_; num_results = num_results_; next_token = next_token_ } : list_hi_ts_response)

let make_list_hi_ts_request ?max_results:(max_results_ : result_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_hi_ts_request)

let make_bonus_payment ?grant_time:(grant_time_ : timestamp option)
    ?reason:(reason_ : string_ option) ?assignment_id:(assignment_id_ : entity_id option)
    ?bonus_amount:(bonus_amount_ : currency_amount option)
    ?worker_id:(worker_id_ : customer_id option) () =
  ({
     grant_time = grant_time_;
     reason = reason_;
     assignment_id = assignment_id_;
     bonus_amount = bonus_amount_;
     worker_id = worker_id_;
   }
    : bonus_payment)

let make_list_bonus_payments_response ?bonus_payments:(bonus_payments_ : bonus_payment_list option)
    ?next_token:(next_token_ : pagination_token option) ?num_results:(num_results_ : integer option)
    () =
  ({ bonus_payments = bonus_payments_; next_token = next_token_; num_results = num_results_ }
    : list_bonus_payments_response)

let make_list_bonus_payments_request ?max_results:(max_results_ : result_size option)
    ?next_token:(next_token_ : pagination_token option)
    ?assignment_id:(assignment_id_ : entity_id option) ?hit_id:(hit_id_ : entity_id option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     assignment_id = assignment_id_;
     hit_id = hit_id_;
   }
    : list_bonus_payments_request)

let make_assignment ?requester_feedback:(requester_feedback_ : string_ option)
    ?answer:(answer_ : string_ option) ?deadline:(deadline_ : timestamp option)
    ?rejection_time:(rejection_time_ : timestamp option)
    ?approval_time:(approval_time_ : timestamp option)
    ?submit_time:(submit_time_ : timestamp option) ?accept_time:(accept_time_ : timestamp option)
    ?auto_approval_time:(auto_approval_time_ : timestamp option)
    ?assignment_status:(assignment_status_ : assignment_status option)
    ?hit_id:(hit_id_ : entity_id option) ?worker_id:(worker_id_ : customer_id option)
    ?assignment_id:(assignment_id_ : entity_id option) () =
  ({
     requester_feedback = requester_feedback_;
     answer = answer_;
     deadline = deadline_;
     rejection_time = rejection_time_;
     approval_time = approval_time_;
     submit_time = submit_time_;
     accept_time = accept_time_;
     auto_approval_time = auto_approval_time_;
     assignment_status = assignment_status_;
     hit_id = hit_id_;
     worker_id = worker_id_;
     assignment_id = assignment_id_;
   }
    : assignment)

let make_list_assignments_for_hit_response ?assignments:(assignments_ : assignment_list option)
    ?num_results:(num_results_ : integer option) ?next_token:(next_token_ : pagination_token option)
    () =
  ({ assignments = assignments_; num_results = num_results_; next_token = next_token_ }
    : list_assignments_for_hit_response)

let make_list_assignments_for_hit_request
    ?assignment_statuses:(assignment_statuses_ : assignment_status_list option)
    ?max_results:(max_results_ : result_size option)
    ?next_token:(next_token_ : pagination_token option) ~hit_id:(hit_id_ : entity_id) () =
  ({
     assignment_statuses = assignment_statuses_;
     max_results = max_results_;
     next_token = next_token_;
     hit_id = hit_id_;
   }
    : list_assignments_for_hit_request)

let make_get_qualification_type_response
    ?qualification_type:(qualification_type_ : qualification_type option) () =
  ({ qualification_type = qualification_type_ } : get_qualification_type_response)

let make_get_qualification_type_request ~qualification_type_id:(qualification_type_id_ : entity_id)
    () =
  ({ qualification_type_id = qualification_type_id_ } : get_qualification_type_request)

let make_get_qualification_score_response ?qualification:(qualification_ : qualification option) ()
    =
  ({ qualification = qualification_ } : get_qualification_score_response)

let make_get_qualification_score_request ~worker_id:(worker_id_ : customer_id)
    ~qualification_type_id:(qualification_type_id_ : entity_id) () =
  ({ worker_id = worker_id_; qualification_type_id = qualification_type_id_ }
    : get_qualification_score_request)

let make_get_hit_response ?hi_t:(hi_t_ : hi_t option) () = ({ hi_t = hi_t_ } : get_hit_response)
let make_get_hit_request ~hit_id:(hit_id_ : entity_id) () = ({ hit_id = hit_id_ } : get_hit_request)

let make_get_file_upload_url_response ?file_upload_ur_l:(file_upload_ur_l_ : string_ option) () =
  ({ file_upload_ur_l = file_upload_ur_l_ } : get_file_upload_url_response)

let make_get_file_upload_url_request ~question_identifier:(question_identifier_ : string_)
    ~assignment_id:(assignment_id_ : entity_id) () =
  ({ question_identifier = question_identifier_; assignment_id = assignment_id_ }
    : get_file_upload_url_request)

let make_get_assignment_response ?hi_t:(hi_t_ : hi_t option)
    ?assignment:(assignment_ : assignment option) () =
  ({ hi_t = hi_t_; assignment = assignment_ } : get_assignment_response)

let make_get_assignment_request ~assignment_id:(assignment_id_ : entity_id) () =
  ({ assignment_id = assignment_id_ } : get_assignment_request)

let make_get_account_balance_response ?on_hold_balance:(on_hold_balance_ : currency_amount option)
    ?available_balance:(available_balance_ : currency_amount option) () =
  ({ on_hold_balance = on_hold_balance_; available_balance = available_balance_ }
    : get_account_balance_response)

let make_get_account_balance_request () = (() : unit)
let make_disassociate_qualification_from_worker_response () = (() : unit)

let make_disassociate_qualification_from_worker_request ?reason:(reason_ : string_ option)
    ~qualification_type_id:(qualification_type_id_ : entity_id)
    ~worker_id:(worker_id_ : customer_id) () =
  ({ reason = reason_; qualification_type_id = qualification_type_id_; worker_id = worker_id_ }
    : disassociate_qualification_from_worker_request)

let make_delete_worker_block_response () = (() : unit)

let make_delete_worker_block_request ?reason:(reason_ : string_ option)
    ~worker_id:(worker_id_ : customer_id) () =
  ({ reason = reason_; worker_id = worker_id_ } : delete_worker_block_request)

let make_delete_qualification_type_response () = (() : unit)

let make_delete_qualification_type_request
    ~qualification_type_id:(qualification_type_id_ : entity_id) () =
  ({ qualification_type_id = qualification_type_id_ } : delete_qualification_type_request)

let make_delete_hit_response () = (() : unit)

let make_delete_hit_request ~hit_id:(hit_id_ : entity_id) () =
  ({ hit_id = hit_id_ } : delete_hit_request)

let make_create_worker_block_response () = (() : unit)

let make_create_worker_block_request ~reason:(reason_ : string_)
    ~worker_id:(worker_id_ : customer_id) () =
  ({ reason = reason_; worker_id = worker_id_ } : create_worker_block_request)

let make_create_qualification_type_response
    ?qualification_type:(qualification_type_ : qualification_type option) () =
  ({ qualification_type = qualification_type_ } : create_qualification_type_response)

let make_create_qualification_type_request
    ?auto_granted_value:(auto_granted_value_ : integer option)
    ?auto_granted:(auto_granted_ : boolean_ option)
    ?test_duration_in_seconds:(test_duration_in_seconds_ : long option)
    ?answer_key:(answer_key_ : string_ option) ?test:(test_ : string_ option)
    ?retry_delay_in_seconds:(retry_delay_in_seconds_ : long option)
    ?keywords:(keywords_ : string_ option)
    ~qualification_type_status:(qualification_type_status_ : qualification_type_status)
    ~description:(description_ : string_) ~name:(name_ : string_) () =
  ({
     auto_granted_value = auto_granted_value_;
     auto_granted = auto_granted_;
     test_duration_in_seconds = test_duration_in_seconds_;
     answer_key = answer_key_;
     test = test_;
     retry_delay_in_seconds = retry_delay_in_seconds_;
     qualification_type_status = qualification_type_status_;
     description = description_;
     keywords = keywords_;
     name = name_;
   }
    : create_qualification_type_request)

let make_create_hit_with_hit_type_response ?hi_t:(hi_t_ : hi_t option) () =
  ({ hi_t = hi_t_ } : create_hit_with_hit_type_response)

let make_hit_layout_parameter ~value:(value_ : string_) ~name:(name_ : string_) () =
  ({ value = value_; name = name_ } : hit_layout_parameter)

let make_create_hit_with_hit_type_request
    ?hit_layout_parameters:(hit_layout_parameters_ : hit_layout_parameter_list option)
    ?hit_layout_id:(hit_layout_id_ : entity_id option)
    ?hit_review_policy:(hit_review_policy_ : review_policy option)
    ?assignment_review_policy:(assignment_review_policy_ : review_policy option)
    ?unique_request_token:(unique_request_token_ : idempotency_token option)
    ?requester_annotation:(requester_annotation_ : string_ option)
    ?question:(question_ : string_ option) ?max_assignments:(max_assignments_ : integer option)
    ~lifetime_in_seconds:(lifetime_in_seconds_ : long) ~hit_type_id:(hit_type_id_ : entity_id) () =
  ({
     hit_layout_parameters = hit_layout_parameters_;
     hit_layout_id = hit_layout_id_;
     hit_review_policy = hit_review_policy_;
     assignment_review_policy = assignment_review_policy_;
     unique_request_token = unique_request_token_;
     requester_annotation = requester_annotation_;
     question = question_;
     lifetime_in_seconds = lifetime_in_seconds_;
     max_assignments = max_assignments_;
     hit_type_id = hit_type_id_;
   }
    : create_hit_with_hit_type_request)

let make_create_hit_type_response ?hit_type_id:(hit_type_id_ : entity_id option) () =
  ({ hit_type_id = hit_type_id_ } : create_hit_type_response)

let make_create_hit_type_request
    ?qualification_requirements:
      (qualification_requirements_ : qualification_requirement_list option)
    ?keywords:(keywords_ : string_ option)
    ?auto_approval_delay_in_seconds:(auto_approval_delay_in_seconds_ : long option)
    ~description:(description_ : string_) ~title:(title_ : string_)
    ~reward:(reward_ : currency_amount)
    ~assignment_duration_in_seconds:(assignment_duration_in_seconds_ : long) () =
  ({
     qualification_requirements = qualification_requirements_;
     description = description_;
     keywords = keywords_;
     title = title_;
     reward = reward_;
     assignment_duration_in_seconds = assignment_duration_in_seconds_;
     auto_approval_delay_in_seconds = auto_approval_delay_in_seconds_;
   }
    : create_hit_type_request)

let make_create_hit_response ?hi_t:(hi_t_ : hi_t option) () =
  ({ hi_t = hi_t_ } : create_hit_response)

let make_create_hit_request
    ?hit_layout_parameters:(hit_layout_parameters_ : hit_layout_parameter_list option)
    ?hit_layout_id:(hit_layout_id_ : entity_id option)
    ?hit_review_policy:(hit_review_policy_ : review_policy option)
    ?assignment_review_policy:(assignment_review_policy_ : review_policy option)
    ?unique_request_token:(unique_request_token_ : idempotency_token option)
    ?qualification_requirements:
      (qualification_requirements_ : qualification_requirement_list option)
    ?requester_annotation:(requester_annotation_ : string_ option)
    ?question:(question_ : string_ option) ?keywords:(keywords_ : string_ option)
    ?auto_approval_delay_in_seconds:(auto_approval_delay_in_seconds_ : long option)
    ?max_assignments:(max_assignments_ : integer option) ~description:(description_ : string_)
    ~title:(title_ : string_) ~reward:(reward_ : currency_amount)
    ~assignment_duration_in_seconds:(assignment_duration_in_seconds_ : long)
    ~lifetime_in_seconds:(lifetime_in_seconds_ : long) () =
  ({
     hit_layout_parameters = hit_layout_parameters_;
     hit_layout_id = hit_layout_id_;
     hit_review_policy = hit_review_policy_;
     assignment_review_policy = assignment_review_policy_;
     unique_request_token = unique_request_token_;
     qualification_requirements = qualification_requirements_;
     requester_annotation = requester_annotation_;
     question = question_;
     description = description_;
     keywords = keywords_;
     title = title_;
     reward = reward_;
     assignment_duration_in_seconds = assignment_duration_in_seconds_;
     lifetime_in_seconds = lifetime_in_seconds_;
     auto_approval_delay_in_seconds = auto_approval_delay_in_seconds_;
     max_assignments = max_assignments_;
   }
    : create_hit_request)

let make_create_additional_assignments_for_hit_response () = (() : unit)

let make_create_additional_assignments_for_hit_request
    ?unique_request_token:(unique_request_token_ : idempotency_token option)
    ~number_of_additional_assignments:(number_of_additional_assignments_ : integer)
    ~hit_id:(hit_id_ : entity_id) () =
  ({
     unique_request_token = unique_request_token_;
     number_of_additional_assignments = number_of_additional_assignments_;
     hit_id = hit_id_;
   }
    : create_additional_assignments_for_hit_request)

let make_associate_qualification_with_worker_response () = (() : unit)

let make_associate_qualification_with_worker_request
    ?send_notification:(send_notification_ : boolean_ option)
    ?integer_value:(integer_value_ : integer option) ~worker_id:(worker_id_ : customer_id)
    ~qualification_type_id:(qualification_type_id_ : entity_id) () =
  ({
     send_notification = send_notification_;
     integer_value = integer_value_;
     worker_id = worker_id_;
     qualification_type_id = qualification_type_id_;
   }
    : associate_qualification_with_worker_request)

let make_approve_assignment_response () = (() : unit)

let make_approve_assignment_request ?override_rejection:(override_rejection_ : boolean_ option)
    ?requester_feedback:(requester_feedback_ : string_ option)
    ~assignment_id:(assignment_id_ : entity_id) () =
  ({
     override_rejection = override_rejection_;
     requester_feedback = requester_feedback_;
     assignment_id = assignment_id_;
   }
    : approve_assignment_request)

let make_accept_qualification_request_response () = (() : unit)

let make_accept_qualification_request_request ?integer_value:(integer_value_ : integer option)
    ~qualification_request_id:(qualification_request_id_ : string_) () =
  ({ integer_value = integer_value_; qualification_request_id = qualification_request_id_ }
    : accept_qualification_request_request)
