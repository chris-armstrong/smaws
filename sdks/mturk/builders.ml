open Types

let make_accept_qualification_request_response () = (() : unit)

let make_accept_qualification_request_request ?integer_value:(integer_value_ : integer option)
    ~qualification_request_id:(qualification_request_id_ : string_) () =
  ({ qualification_request_id = qualification_request_id_; integer_value = integer_value_ }
    : accept_qualification_request_request)

let make_approve_assignment_response () = (() : unit)

let make_approve_assignment_request ?requester_feedback:(requester_feedback_ : string_ option)
    ?override_rejection:(override_rejection_ : boolean_ option)
    ~assignment_id:(assignment_id_ : entity_id) () =
  ({
     assignment_id = assignment_id_;
     requester_feedback = requester_feedback_;
     override_rejection = override_rejection_;
   }
    : approve_assignment_request)

let make_assignment ?assignment_id:(assignment_id_ : entity_id option)
    ?worker_id:(worker_id_ : customer_id option) ?hit_id:(hit_id_ : entity_id option)
    ?assignment_status:(assignment_status_ : assignment_status option)
    ?auto_approval_time:(auto_approval_time_ : timestamp option)
    ?accept_time:(accept_time_ : timestamp option) ?submit_time:(submit_time_ : timestamp option)
    ?approval_time:(approval_time_ : timestamp option)
    ?rejection_time:(rejection_time_ : timestamp option) ?deadline:(deadline_ : timestamp option)
    ?answer:(answer_ : string_ option) ?requester_feedback:(requester_feedback_ : string_ option) ()
    =
  ({
     assignment_id = assignment_id_;
     worker_id = worker_id_;
     hit_id = hit_id_;
     assignment_status = assignment_status_;
     auto_approval_time = auto_approval_time_;
     accept_time = accept_time_;
     submit_time = submit_time_;
     approval_time = approval_time_;
     rejection_time = rejection_time_;
     deadline = deadline_;
     answer = answer_;
     requester_feedback = requester_feedback_;
   }
    : assignment)

let make_associate_qualification_with_worker_response () = (() : unit)

let make_associate_qualification_with_worker_request
    ?integer_value:(integer_value_ : integer option)
    ?send_notification:(send_notification_ : boolean_ option)
    ~qualification_type_id:(qualification_type_id_ : entity_id)
    ~worker_id:(worker_id_ : customer_id) () =
  ({
     qualification_type_id = qualification_type_id_;
     worker_id = worker_id_;
     integer_value = integer_value_;
     send_notification = send_notification_;
   }
    : associate_qualification_with_worker_request)

let make_bonus_payment ?worker_id:(worker_id_ : customer_id option)
    ?bonus_amount:(bonus_amount_ : currency_amount option)
    ?assignment_id:(assignment_id_ : entity_id option) ?reason:(reason_ : string_ option)
    ?grant_time:(grant_time_ : timestamp option) () =
  ({
     worker_id = worker_id_;
     bonus_amount = bonus_amount_;
     assignment_id = assignment_id_;
     reason = reason_;
     grant_time = grant_time_;
   }
    : bonus_payment)

let make_create_additional_assignments_for_hit_response () = (() : unit)

let make_create_additional_assignments_for_hit_request
    ?unique_request_token:(unique_request_token_ : idempotency_token option)
    ~hit_id:(hit_id_ : entity_id)
    ~number_of_additional_assignments:(number_of_additional_assignments_ : integer) () =
  ({
     hit_id = hit_id_;
     number_of_additional_assignments = number_of_additional_assignments_;
     unique_request_token = unique_request_token_;
   }
    : create_additional_assignments_for_hit_request)

let make_locale ?subdivision:(subdivision_ : country_parameters option)
    ~country:(country_ : country_parameters) () =
  ({ country = country_; subdivision = subdivision_ } : locale)

let make_qualification_requirement ?integer_values:(integer_values_ : integer_list option)
    ?locale_values:(locale_values_ : locale_list option)
    ?required_to_preview:(required_to_preview_ : boolean_ option)
    ?actions_guarded:(actions_guarded_ : hit_access_actions option)
    ~qualification_type_id:(qualification_type_id_ : string_) ~comparator:(comparator_ : comparator)
    () =
  ({
     qualification_type_id = qualification_type_id_;
     comparator = comparator_;
     integer_values = integer_values_;
     locale_values = locale_values_;
     required_to_preview = required_to_preview_;
     actions_guarded = actions_guarded_;
   }
    : qualification_requirement)

let make_hi_t ?hit_id:(hit_id_ : entity_id option) ?hit_type_id:(hit_type_id_ : entity_id option)
    ?hit_group_id:(hit_group_id_ : entity_id option)
    ?hit_layout_id:(hit_layout_id_ : entity_id option)
    ?creation_time:(creation_time_ : timestamp option) ?title:(title_ : string_ option)
    ?description:(description_ : string_ option) ?question:(question_ : string_ option)
    ?keywords:(keywords_ : string_ option) ?hit_status:(hit_status_ : hit_status option)
    ?max_assignments:(max_assignments_ : integer option) ?reward:(reward_ : currency_amount option)
    ?auto_approval_delay_in_seconds:(auto_approval_delay_in_seconds_ : long option)
    ?expiration:(expiration_ : timestamp option)
    ?assignment_duration_in_seconds:(assignment_duration_in_seconds_ : long option)
    ?requester_annotation:(requester_annotation_ : string_ option)
    ?qualification_requirements:
      (qualification_requirements_ : qualification_requirement_list option)
    ?hit_review_status:(hit_review_status_ : hit_review_status option)
    ?number_of_assignments_pending:(number_of_assignments_pending_ : integer option)
    ?number_of_assignments_available:(number_of_assignments_available_ : integer option)
    ?number_of_assignments_completed:(number_of_assignments_completed_ : integer option) () =
  ({
     hit_id = hit_id_;
     hit_type_id = hit_type_id_;
     hit_group_id = hit_group_id_;
     hit_layout_id = hit_layout_id_;
     creation_time = creation_time_;
     title = title_;
     description = description_;
     question = question_;
     keywords = keywords_;
     hit_status = hit_status_;
     max_assignments = max_assignments_;
     reward = reward_;
     auto_approval_delay_in_seconds = auto_approval_delay_in_seconds_;
     expiration = expiration_;
     assignment_duration_in_seconds = assignment_duration_in_seconds_;
     requester_annotation = requester_annotation_;
     qualification_requirements = qualification_requirements_;
     hit_review_status = hit_review_status_;
     number_of_assignments_pending = number_of_assignments_pending_;
     number_of_assignments_available = number_of_assignments_available_;
     number_of_assignments_completed = number_of_assignments_completed_;
   }
    : hi_t)

let make_create_hit_response ?hi_t:(hi_t_ : hi_t option) () =
  ({ hi_t = hi_t_ } : create_hit_response)

let make_hit_layout_parameter ~name:(name_ : string_) ~value:(value_ : string_) () =
  ({ name = name_; value = value_ } : hit_layout_parameter)

let make_parameter_map_entry ?key:(key_ : string_ option) ?values:(values_ : string_list option) ()
    =
  ({ key = key_; values = values_ } : parameter_map_entry)

let make_policy_parameter ?key:(key_ : string_ option) ?values:(values_ : string_list option)
    ?map_entries:(map_entries_ : parameter_map_entry_list option) () =
  ({ key = key_; values = values_; map_entries = map_entries_ } : policy_parameter)

let make_review_policy ?parameters:(parameters_ : policy_parameter_list option)
    ~policy_name:(policy_name_ : string_) () =
  ({ policy_name = policy_name_; parameters = parameters_ } : review_policy)

let make_create_hit_request ?max_assignments:(max_assignments_ : integer option)
    ?auto_approval_delay_in_seconds:(auto_approval_delay_in_seconds_ : long option)
    ?keywords:(keywords_ : string_ option) ?question:(question_ : string_ option)
    ?requester_annotation:(requester_annotation_ : string_ option)
    ?qualification_requirements:
      (qualification_requirements_ : qualification_requirement_list option)
    ?unique_request_token:(unique_request_token_ : idempotency_token option)
    ?assignment_review_policy:(assignment_review_policy_ : review_policy option)
    ?hit_review_policy:(hit_review_policy_ : review_policy option)
    ?hit_layout_id:(hit_layout_id_ : entity_id option)
    ?hit_layout_parameters:(hit_layout_parameters_ : hit_layout_parameter_list option)
    ~lifetime_in_seconds:(lifetime_in_seconds_ : long)
    ~assignment_duration_in_seconds:(assignment_duration_in_seconds_ : long)
    ~reward:(reward_ : currency_amount) ~title:(title_ : string_)
    ~description:(description_ : string_) () =
  ({
     max_assignments = max_assignments_;
     auto_approval_delay_in_seconds = auto_approval_delay_in_seconds_;
     lifetime_in_seconds = lifetime_in_seconds_;
     assignment_duration_in_seconds = assignment_duration_in_seconds_;
     reward = reward_;
     title = title_;
     keywords = keywords_;
     description = description_;
     question = question_;
     requester_annotation = requester_annotation_;
     qualification_requirements = qualification_requirements_;
     unique_request_token = unique_request_token_;
     assignment_review_policy = assignment_review_policy_;
     hit_review_policy = hit_review_policy_;
     hit_layout_id = hit_layout_id_;
     hit_layout_parameters = hit_layout_parameters_;
   }
    : create_hit_request)

let make_create_hit_type_response ?hit_type_id:(hit_type_id_ : entity_id option) () =
  ({ hit_type_id = hit_type_id_ } : create_hit_type_response)

let make_create_hit_type_request
    ?auto_approval_delay_in_seconds:(auto_approval_delay_in_seconds_ : long option)
    ?keywords:(keywords_ : string_ option)
    ?qualification_requirements:
      (qualification_requirements_ : qualification_requirement_list option)
    ~assignment_duration_in_seconds:(assignment_duration_in_seconds_ : long)
    ~reward:(reward_ : currency_amount) ~title:(title_ : string_)
    ~description:(description_ : string_) () =
  ({
     auto_approval_delay_in_seconds = auto_approval_delay_in_seconds_;
     assignment_duration_in_seconds = assignment_duration_in_seconds_;
     reward = reward_;
     title = title_;
     keywords = keywords_;
     description = description_;
     qualification_requirements = qualification_requirements_;
   }
    : create_hit_type_request)

let make_create_hit_with_hit_type_response ?hi_t:(hi_t_ : hi_t option) () =
  ({ hi_t = hi_t_ } : create_hit_with_hit_type_response)

let make_create_hit_with_hit_type_request ?max_assignments:(max_assignments_ : integer option)
    ?question:(question_ : string_ option)
    ?requester_annotation:(requester_annotation_ : string_ option)
    ?unique_request_token:(unique_request_token_ : idempotency_token option)
    ?assignment_review_policy:(assignment_review_policy_ : review_policy option)
    ?hit_review_policy:(hit_review_policy_ : review_policy option)
    ?hit_layout_id:(hit_layout_id_ : entity_id option)
    ?hit_layout_parameters:(hit_layout_parameters_ : hit_layout_parameter_list option)
    ~hit_type_id:(hit_type_id_ : entity_id) ~lifetime_in_seconds:(lifetime_in_seconds_ : long) () =
  ({
     hit_type_id = hit_type_id_;
     max_assignments = max_assignments_;
     lifetime_in_seconds = lifetime_in_seconds_;
     question = question_;
     requester_annotation = requester_annotation_;
     unique_request_token = unique_request_token_;
     assignment_review_policy = assignment_review_policy_;
     hit_review_policy = hit_review_policy_;
     hit_layout_id = hit_layout_id_;
     hit_layout_parameters = hit_layout_parameters_;
   }
    : create_hit_with_hit_type_request)

let make_qualification_type ?qualification_type_id:(qualification_type_id_ : entity_id option)
    ?creation_time:(creation_time_ : timestamp option) ?name:(name_ : string_ option)
    ?description:(description_ : string_ option) ?keywords:(keywords_ : string_ option)
    ?qualification_type_status:(qualification_type_status_ : qualification_type_status option)
    ?test:(test_ : string_ option)
    ?test_duration_in_seconds:(test_duration_in_seconds_ : long option)
    ?answer_key:(answer_key_ : string_ option)
    ?retry_delay_in_seconds:(retry_delay_in_seconds_ : long option)
    ?is_requestable:(is_requestable_ : boolean_ option)
    ?auto_granted:(auto_granted_ : boolean_ option)
    ?auto_granted_value:(auto_granted_value_ : integer option) () =
  ({
     qualification_type_id = qualification_type_id_;
     creation_time = creation_time_;
     name = name_;
     description = description_;
     keywords = keywords_;
     qualification_type_status = qualification_type_status_;
     test = test_;
     test_duration_in_seconds = test_duration_in_seconds_;
     answer_key = answer_key_;
     retry_delay_in_seconds = retry_delay_in_seconds_;
     is_requestable = is_requestable_;
     auto_granted = auto_granted_;
     auto_granted_value = auto_granted_value_;
   }
    : qualification_type)

let make_create_qualification_type_response
    ?qualification_type:(qualification_type_ : qualification_type option) () =
  ({ qualification_type = qualification_type_ } : create_qualification_type_response)

let make_create_qualification_type_request ?keywords:(keywords_ : string_ option)
    ?retry_delay_in_seconds:(retry_delay_in_seconds_ : long option) ?test:(test_ : string_ option)
    ?answer_key:(answer_key_ : string_ option)
    ?test_duration_in_seconds:(test_duration_in_seconds_ : long option)
    ?auto_granted:(auto_granted_ : boolean_ option)
    ?auto_granted_value:(auto_granted_value_ : integer option) ~name:(name_ : string_)
    ~description:(description_ : string_)
    ~qualification_type_status:(qualification_type_status_ : qualification_type_status) () =
  ({
     name = name_;
     keywords = keywords_;
     description = description_;
     qualification_type_status = qualification_type_status_;
     retry_delay_in_seconds = retry_delay_in_seconds_;
     test = test_;
     answer_key = answer_key_;
     test_duration_in_seconds = test_duration_in_seconds_;
     auto_granted = auto_granted_;
     auto_granted_value = auto_granted_value_;
   }
    : create_qualification_type_request)

let make_create_worker_block_response () = (() : unit)

let make_create_worker_block_request ~worker_id:(worker_id_ : customer_id)
    ~reason:(reason_ : string_) () =
  ({ worker_id = worker_id_; reason = reason_ } : create_worker_block_request)

let make_delete_hit_response () = (() : unit)

let make_delete_hit_request ~hit_id:(hit_id_ : entity_id) () =
  ({ hit_id = hit_id_ } : delete_hit_request)

let make_delete_qualification_type_response () = (() : unit)

let make_delete_qualification_type_request
    ~qualification_type_id:(qualification_type_id_ : entity_id) () =
  ({ qualification_type_id = qualification_type_id_ } : delete_qualification_type_request)

let make_delete_worker_block_response () = (() : unit)

let make_delete_worker_block_request ?reason:(reason_ : string_ option)
    ~worker_id:(worker_id_ : customer_id) () =
  ({ worker_id = worker_id_; reason = reason_ } : delete_worker_block_request)

let make_disassociate_qualification_from_worker_response () = (() : unit)

let make_disassociate_qualification_from_worker_request ?reason:(reason_ : string_ option)
    ~worker_id:(worker_id_ : customer_id)
    ~qualification_type_id:(qualification_type_id_ : entity_id) () =
  ({ worker_id = worker_id_; qualification_type_id = qualification_type_id_; reason = reason_ }
    : disassociate_qualification_from_worker_request)

let make_get_account_balance_response
    ?available_balance:(available_balance_ : currency_amount option)
    ?on_hold_balance:(on_hold_balance_ : currency_amount option) () =
  ({ available_balance = available_balance_; on_hold_balance = on_hold_balance_ }
    : get_account_balance_response)

let make_get_account_balance_request () = (() : unit)

let make_get_assignment_response ?assignment:(assignment_ : assignment option)
    ?hi_t:(hi_t_ : hi_t option) () =
  ({ assignment = assignment_; hi_t = hi_t_ } : get_assignment_response)

let make_get_assignment_request ~assignment_id:(assignment_id_ : entity_id) () =
  ({ assignment_id = assignment_id_ } : get_assignment_request)

let make_get_file_upload_url_response ?file_upload_ur_l:(file_upload_ur_l_ : string_ option) () =
  ({ file_upload_ur_l = file_upload_ur_l_ } : get_file_upload_url_response)

let make_get_file_upload_url_request ~assignment_id:(assignment_id_ : entity_id)
    ~question_identifier:(question_identifier_ : string_) () =
  ({ assignment_id = assignment_id_; question_identifier = question_identifier_ }
    : get_file_upload_url_request)

let make_get_hit_response ?hi_t:(hi_t_ : hi_t option) () = ({ hi_t = hi_t_ } : get_hit_response)
let make_get_hit_request ~hit_id:(hit_id_ : entity_id) () = ({ hit_id = hit_id_ } : get_hit_request)

let make_qualification ?qualification_type_id:(qualification_type_id_ : entity_id option)
    ?worker_id:(worker_id_ : customer_id option) ?grant_time:(grant_time_ : timestamp option)
    ?integer_value:(integer_value_ : integer option) ?locale_value:(locale_value_ : locale option)
    ?status:(status_ : qualification_status option) () =
  ({
     qualification_type_id = qualification_type_id_;
     worker_id = worker_id_;
     grant_time = grant_time_;
     integer_value = integer_value_;
     locale_value = locale_value_;
     status = status_;
   }
    : qualification)

let make_get_qualification_score_response ?qualification:(qualification_ : qualification option) ()
    =
  ({ qualification = qualification_ } : get_qualification_score_response)

let make_get_qualification_score_request ~qualification_type_id:(qualification_type_id_ : entity_id)
    ~worker_id:(worker_id_ : customer_id) () =
  ({ qualification_type_id = qualification_type_id_; worker_id = worker_id_ }
    : get_qualification_score_request)

let make_get_qualification_type_response
    ?qualification_type:(qualification_type_ : qualification_type option) () =
  ({ qualification_type = qualification_type_ } : get_qualification_type_response)

let make_get_qualification_type_request ~qualification_type_id:(qualification_type_id_ : entity_id)
    () =
  ({ qualification_type_id = qualification_type_id_ } : get_qualification_type_request)

let make_list_assignments_for_hit_response ?next_token:(next_token_ : pagination_token option)
    ?num_results:(num_results_ : integer option)
    ?assignments:(assignments_ : assignment_list option) () =
  ({ next_token = next_token_; num_results = num_results_; assignments = assignments_ }
    : list_assignments_for_hit_response)

let make_list_assignments_for_hit_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : result_size option)
    ?assignment_statuses:(assignment_statuses_ : assignment_status_list option)
    ~hit_id:(hit_id_ : entity_id) () =
  ({
     hit_id = hit_id_;
     next_token = next_token_;
     max_results = max_results_;
     assignment_statuses = assignment_statuses_;
   }
    : list_assignments_for_hit_request)

let make_list_bonus_payments_response ?num_results:(num_results_ : integer option)
    ?next_token:(next_token_ : pagination_token option)
    ?bonus_payments:(bonus_payments_ : bonus_payment_list option) () =
  ({ num_results = num_results_; next_token = next_token_; bonus_payments = bonus_payments_ }
    : list_bonus_payments_response)

let make_list_bonus_payments_request ?hit_id:(hit_id_ : entity_id option)
    ?assignment_id:(assignment_id_ : entity_id option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : result_size option) () =
  ({
     hit_id = hit_id_;
     assignment_id = assignment_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_bonus_payments_request)

let make_list_hi_ts_response ?next_token:(next_token_ : pagination_token option)
    ?num_results:(num_results_ : integer option) ?hi_ts:(hi_ts_ : hit_list option) () =
  ({ next_token = next_token_; num_results = num_results_; hi_ts = hi_ts_ } : list_hi_ts_response)

let make_list_hi_ts_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : result_size option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_hi_ts_request)

let make_list_hi_ts_for_qualification_type_response
    ?next_token:(next_token_ : pagination_token option) ?num_results:(num_results_ : integer option)
    ?hi_ts:(hi_ts_ : hit_list option) () =
  ({ next_token = next_token_; num_results = num_results_; hi_ts = hi_ts_ }
    : list_hi_ts_for_qualification_type_response)

let make_list_hi_ts_for_qualification_type_request
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : result_size option)
    ~qualification_type_id:(qualification_type_id_ : entity_id) () =
  ({
     qualification_type_id = qualification_type_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_hi_ts_for_qualification_type_request)

let make_qualification_request
    ?qualification_request_id:(qualification_request_id_ : string_ option)
    ?qualification_type_id:(qualification_type_id_ : entity_id option)
    ?worker_id:(worker_id_ : customer_id option) ?test:(test_ : string_ option)
    ?answer:(answer_ : string_ option) ?submit_time:(submit_time_ : timestamp option) () =
  ({
     qualification_request_id = qualification_request_id_;
     qualification_type_id = qualification_type_id_;
     worker_id = worker_id_;
     test = test_;
     answer = answer_;
     submit_time = submit_time_;
   }
    : qualification_request)

let make_list_qualification_requests_response ?num_results:(num_results_ : integer option)
    ?next_token:(next_token_ : pagination_token option)
    ?qualification_requests:(qualification_requests_ : qualification_request_list option) () =
  ({
     num_results = num_results_;
     next_token = next_token_;
     qualification_requests = qualification_requests_;
   }
    : list_qualification_requests_response)

let make_list_qualification_requests_request
    ?qualification_type_id:(qualification_type_id_ : entity_id option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : result_size option) () =
  ({
     qualification_type_id = qualification_type_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_qualification_requests_request)

let make_list_qualification_types_response ?num_results:(num_results_ : integer option)
    ?next_token:(next_token_ : pagination_token option)
    ?qualification_types:(qualification_types_ : qualification_type_list option) () =
  ({
     num_results = num_results_;
     next_token = next_token_;
     qualification_types = qualification_types_;
   }
    : list_qualification_types_response)

let make_list_qualification_types_request ?query:(query_ : string_ option)
    ?must_be_owned_by_caller:(must_be_owned_by_caller_ : boolean_ option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : result_size option)
    ~must_be_requestable:(must_be_requestable_ : boolean_) () =
  ({
     query = query_;
     must_be_requestable = must_be_requestable_;
     must_be_owned_by_caller = must_be_owned_by_caller_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_qualification_types_request)

let make_review_action_detail ?action_id:(action_id_ : entity_id option)
    ?action_name:(action_name_ : string_ option) ?target_id:(target_id_ : entity_id option)
    ?target_type:(target_type_ : string_ option) ?status:(status_ : review_action_status option)
    ?complete_time:(complete_time_ : timestamp option) ?result_:(result__ : string_ option)
    ?error_code:(error_code_ : string_ option) () =
  ({
     action_id = action_id_;
     action_name = action_name_;
     target_id = target_id_;
     target_type = target_type_;
     status = status_;
     complete_time = complete_time_;
     result_ = result__;
     error_code = error_code_;
   }
    : review_action_detail)

let make_review_result_detail ?action_id:(action_id_ : entity_id option)
    ?subject_id:(subject_id_ : entity_id option) ?subject_type:(subject_type_ : string_ option)
    ?question_id:(question_id_ : entity_id option) ?key:(key_ : string_ option)
    ?value:(value_ : string_ option) () =
  ({
     action_id = action_id_;
     subject_id = subject_id_;
     subject_type = subject_type_;
     question_id = question_id_;
     key = key_;
     value = value_;
   }
    : review_result_detail)

let make_review_report ?review_results:(review_results_ : review_result_detail_list option)
    ?review_actions:(review_actions_ : review_action_detail_list option) () =
  ({ review_results = review_results_; review_actions = review_actions_ } : review_report)

let make_list_review_policy_results_for_hit_response ?hit_id:(hit_id_ : entity_id option)
    ?assignment_review_policy:(assignment_review_policy_ : review_policy option)
    ?hit_review_policy:(hit_review_policy_ : review_policy option)
    ?assignment_review_report:(assignment_review_report_ : review_report option)
    ?hit_review_report:(hit_review_report_ : review_report option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({
     hit_id = hit_id_;
     assignment_review_policy = assignment_review_policy_;
     hit_review_policy = hit_review_policy_;
     assignment_review_report = assignment_review_report_;
     hit_review_report = hit_review_report_;
     next_token = next_token_;
   }
    : list_review_policy_results_for_hit_response)

let make_list_review_policy_results_for_hit_request
    ?policy_levels:(policy_levels_ : review_policy_level_list option)
    ?retrieve_actions:(retrieve_actions_ : boolean_ option)
    ?retrieve_results:(retrieve_results_ : boolean_ option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : result_size option) ~hit_id:(hit_id_ : entity_id) () =
  ({
     hit_id = hit_id_;
     policy_levels = policy_levels_;
     retrieve_actions = retrieve_actions_;
     retrieve_results = retrieve_results_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_review_policy_results_for_hit_request)

let make_list_reviewable_hi_ts_response ?next_token:(next_token_ : pagination_token option)
    ?num_results:(num_results_ : integer option) ?hi_ts:(hi_ts_ : hit_list option) () =
  ({ next_token = next_token_; num_results = num_results_; hi_ts = hi_ts_ }
    : list_reviewable_hi_ts_response)

let make_list_reviewable_hi_ts_request ?hit_type_id:(hit_type_id_ : entity_id option)
    ?status:(status_ : reviewable_hit_status option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : result_size option) () =
  ({
     hit_type_id = hit_type_id_;
     status = status_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_reviewable_hi_ts_request)

let make_worker_block ?worker_id:(worker_id_ : customer_id option)
    ?reason:(reason_ : string_ option) () =
  ({ worker_id = worker_id_; reason = reason_ } : worker_block)

let make_list_worker_blocks_response ?next_token:(next_token_ : pagination_token option)
    ?num_results:(num_results_ : integer option)
    ?worker_blocks:(worker_blocks_ : worker_block_list option) () =
  ({ next_token = next_token_; num_results = num_results_; worker_blocks = worker_blocks_ }
    : list_worker_blocks_response)

let make_list_worker_blocks_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : result_size option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_worker_blocks_request)

let make_list_workers_with_qualification_type_response
    ?next_token:(next_token_ : pagination_token option) ?num_results:(num_results_ : integer option)
    ?qualifications:(qualifications_ : qualification_list option) () =
  ({ next_token = next_token_; num_results = num_results_; qualifications = qualifications_ }
    : list_workers_with_qualification_type_response)

let make_list_workers_with_qualification_type_request
    ?status:(status_ : qualification_status option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : result_size option)
    ~qualification_type_id:(qualification_type_id_ : entity_id) () =
  ({
     qualification_type_id = qualification_type_id_;
     status = status_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_workers_with_qualification_type_request)

let make_update_qualification_type_response
    ?qualification_type:(qualification_type_ : qualification_type option) () =
  ({ qualification_type = qualification_type_ } : update_qualification_type_response)

let make_update_qualification_type_request ?description:(description_ : string_ option)
    ?qualification_type_status:(qualification_type_status_ : qualification_type_status option)
    ?test:(test_ : string_ option) ?answer_key:(answer_key_ : string_ option)
    ?test_duration_in_seconds:(test_duration_in_seconds_ : long option)
    ?retry_delay_in_seconds:(retry_delay_in_seconds_ : long option)
    ?auto_granted:(auto_granted_ : boolean_ option)
    ?auto_granted_value:(auto_granted_value_ : integer option)
    ~qualification_type_id:(qualification_type_id_ : entity_id) () =
  ({
     qualification_type_id = qualification_type_id_;
     description = description_;
     qualification_type_status = qualification_type_status_;
     test = test_;
     answer_key = answer_key_;
     test_duration_in_seconds = test_duration_in_seconds_;
     retry_delay_in_seconds = retry_delay_in_seconds_;
     auto_granted = auto_granted_;
     auto_granted_value = auto_granted_value_;
   }
    : update_qualification_type_request)

let make_update_notification_settings_response () = (() : unit)

let make_notification_specification ~destination:(destination_ : string_)
    ~transport:(transport_ : notification_transport) ~version:(version_ : string_)
    ~event_types:(event_types_ : event_type_list) () =
  ({
     destination = destination_;
     transport = transport_;
     version = version_;
     event_types = event_types_;
   }
    : notification_specification)

let make_update_notification_settings_request
    ?notification:(notification_ : notification_specification option)
    ?active:(active_ : boolean_ option) ~hit_type_id:(hit_type_id_ : entity_id) () =
  ({ hit_type_id = hit_type_id_; notification = notification_; active = active_ }
    : update_notification_settings_request)

let make_update_hit_type_of_hit_response () = (() : unit)

let make_update_hit_type_of_hit_request ~hit_id:(hit_id_ : entity_id)
    ~hit_type_id:(hit_type_id_ : entity_id) () =
  ({ hit_id = hit_id_; hit_type_id = hit_type_id_ } : update_hit_type_of_hit_request)

let make_update_hit_review_status_response () = (() : unit)

let make_update_hit_review_status_request ?revert:(revert_ : boolean_ option)
    ~hit_id:(hit_id_ : entity_id) () =
  ({ hit_id = hit_id_; revert = revert_ } : update_hit_review_status_request)

let make_update_expiration_for_hit_response () = (() : unit)

let make_update_expiration_for_hit_request ~hit_id:(hit_id_ : entity_id)
    ~expire_at:(expire_at_ : timestamp) () =
  ({ hit_id = hit_id_; expire_at = expire_at_ } : update_expiration_for_hit_request)

let make_send_test_event_notification_response () = (() : unit)

let make_send_test_event_notification_request
    ~notification:(notification_ : notification_specification)
    ~test_event_type:(test_event_type_ : event_type) () =
  ({ notification = notification_; test_event_type = test_event_type_ }
    : send_test_event_notification_request)

let make_send_bonus_response () = (() : unit)

let make_send_bonus_request ?unique_request_token:(unique_request_token_ : idempotency_token option)
    ~worker_id:(worker_id_ : customer_id) ~bonus_amount:(bonus_amount_ : currency_amount)
    ~assignment_id:(assignment_id_ : entity_id) ~reason:(reason_ : string_) () =
  ({
     worker_id = worker_id_;
     bonus_amount = bonus_amount_;
     assignment_id = assignment_id_;
     reason = reason_;
     unique_request_token = unique_request_token_;
   }
    : send_bonus_request)

let make_reject_qualification_request_response () = (() : unit)

let make_reject_qualification_request_request ?reason:(reason_ : string_ option)
    ~qualification_request_id:(qualification_request_id_ : string_) () =
  ({ qualification_request_id = qualification_request_id_; reason = reason_ }
    : reject_qualification_request_request)

let make_reject_assignment_response () = (() : unit)

let make_reject_assignment_request ~assignment_id:(assignment_id_ : entity_id)
    ~requester_feedback:(requester_feedback_ : string_) () =
  ({ assignment_id = assignment_id_; requester_feedback = requester_feedback_ }
    : reject_assignment_request)

let make_notify_workers_failure_status
    ?notify_workers_failure_code:(notify_workers_failure_code_ : notify_workers_failure_code option)
    ?notify_workers_failure_message:(notify_workers_failure_message_ : string_ option)
    ?worker_id:(worker_id_ : customer_id option) () =
  ({
     notify_workers_failure_code = notify_workers_failure_code_;
     notify_workers_failure_message = notify_workers_failure_message_;
     worker_id = worker_id_;
   }
    : notify_workers_failure_status)

let make_notify_workers_response
    ?notify_workers_failure_statuses:
      (notify_workers_failure_statuses_ : notify_workers_failure_status_list option) () =
  ({ notify_workers_failure_statuses = notify_workers_failure_statuses_ } : notify_workers_response)

let make_notify_workers_request ~subject:(subject_ : string_)
    ~message_text:(message_text_ : string_) ~worker_ids:(worker_ids_ : customer_id_list) () =
  ({ subject = subject_; message_text = message_text_; worker_ids = worker_ids_ }
    : notify_workers_request)
