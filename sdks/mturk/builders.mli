open Types

val make_worker_block : ?reason:string_ -> ?worker_id:customer_id -> unit -> worker_block

val make_qualification_type :
  ?auto_granted_value:integer ->
  ?auto_granted:boolean_ ->
  ?is_requestable:boolean_ ->
  ?retry_delay_in_seconds:long ->
  ?answer_key:string_ ->
  ?test_duration_in_seconds:long ->
  ?test:string_ ->
  ?qualification_type_status:qualification_type_status ->
  ?keywords:string_ ->
  ?description:string_ ->
  ?name:string_ ->
  ?creation_time:timestamp ->
  ?qualification_type_id:entity_id ->
  unit ->
  qualification_type

val make_update_qualification_type_response :
  ?qualification_type:qualification_type -> unit -> update_qualification_type_response

val make_update_qualification_type_request :
  ?auto_granted_value:integer ->
  ?auto_granted:boolean_ ->
  ?retry_delay_in_seconds:long ->
  ?test_duration_in_seconds:long ->
  ?answer_key:string_ ->
  ?test:string_ ->
  ?qualification_type_status:qualification_type_status ->
  ?description:string_ ->
  qualification_type_id:entity_id ->
  unit ->
  update_qualification_type_request

val make_update_notification_settings_response : unit -> unit

val make_notification_specification :
  event_types:event_type_list ->
  version:string_ ->
  transport:notification_transport ->
  destination:string_ ->
  unit ->
  notification_specification

val make_update_notification_settings_request :
  ?active:boolean_ ->
  ?notification:notification_specification ->
  hit_type_id:entity_id ->
  unit ->
  update_notification_settings_request

val make_update_hit_type_of_hit_response : unit -> unit

val make_update_hit_type_of_hit_request :
  hit_type_id:entity_id -> hit_id:entity_id -> unit -> update_hit_type_of_hit_request

val make_update_hit_review_status_response : unit -> unit

val make_update_hit_review_status_request :
  ?revert:boolean_ -> hit_id:entity_id -> unit -> update_hit_review_status_request

val make_update_expiration_for_hit_response : unit -> unit

val make_update_expiration_for_hit_request :
  expire_at:timestamp -> hit_id:entity_id -> unit -> update_expiration_for_hit_request

val make_send_test_event_notification_response : unit -> unit

val make_send_test_event_notification_request :
  test_event_type:event_type ->
  notification:notification_specification ->
  unit ->
  send_test_event_notification_request

val make_send_bonus_response : unit -> unit

val make_send_bonus_request :
  ?unique_request_token:idempotency_token ->
  reason:string_ ->
  assignment_id:entity_id ->
  bonus_amount:currency_amount ->
  worker_id:customer_id ->
  unit ->
  send_bonus_request

val make_review_result_detail :
  ?value:string_ ->
  ?key:string_ ->
  ?question_id:entity_id ->
  ?subject_type:string_ ->
  ?subject_id:entity_id ->
  ?action_id:entity_id ->
  unit ->
  review_result_detail

val make_review_action_detail :
  ?error_code:string_ ->
  ?result_:string_ ->
  ?complete_time:timestamp ->
  ?status:review_action_status ->
  ?target_type:string_ ->
  ?target_id:entity_id ->
  ?action_name:string_ ->
  ?action_id:entity_id ->
  unit ->
  review_action_detail

val make_review_report :
  ?review_actions:review_action_detail_list ->
  ?review_results:review_result_detail_list ->
  unit ->
  review_report

val make_parameter_map_entry : ?values:string_list -> ?key:string_ -> unit -> parameter_map_entry

val make_policy_parameter :
  ?map_entries:parameter_map_entry_list ->
  ?values:string_list ->
  ?key:string_ ->
  unit ->
  policy_parameter

val make_review_policy :
  ?parameters:policy_parameter_list -> policy_name:string_ -> unit -> review_policy

val make_reject_qualification_request_response : unit -> unit

val make_reject_qualification_request_request :
  ?reason:string_ ->
  qualification_request_id:string_ ->
  unit ->
  reject_qualification_request_request

val make_reject_assignment_response : unit -> unit

val make_reject_assignment_request :
  requester_feedback:string_ -> assignment_id:entity_id -> unit -> reject_assignment_request

val make_locale : ?subdivision:country_parameters -> country:country_parameters -> unit -> locale

val make_qualification_requirement :
  ?actions_guarded:hit_access_actions ->
  ?required_to_preview:boolean_ ->
  ?locale_values:locale_list ->
  ?integer_values:integer_list ->
  comparator:comparator ->
  qualification_type_id:string_ ->
  unit ->
  qualification_requirement

val make_qualification_request :
  ?submit_time:timestamp ->
  ?answer:string_ ->
  ?test:string_ ->
  ?worker_id:customer_id ->
  ?qualification_type_id:entity_id ->
  ?qualification_request_id:string_ ->
  unit ->
  qualification_request

val make_qualification :
  ?status:qualification_status ->
  ?locale_value:locale ->
  ?integer_value:integer ->
  ?grant_time:timestamp ->
  ?worker_id:customer_id ->
  ?qualification_type_id:entity_id ->
  unit ->
  qualification

val make_notify_workers_failure_status :
  ?worker_id:customer_id ->
  ?notify_workers_failure_message:string_ ->
  ?notify_workers_failure_code:notify_workers_failure_code ->
  unit ->
  notify_workers_failure_status

val make_notify_workers_response :
  ?notify_workers_failure_statuses:notify_workers_failure_status_list ->
  unit ->
  notify_workers_response

val make_notify_workers_request :
  worker_ids:customer_id_list ->
  message_text:string_ ->
  subject:string_ ->
  unit ->
  notify_workers_request

val make_list_workers_with_qualification_type_response :
  ?qualifications:qualification_list ->
  ?num_results:integer ->
  ?next_token:pagination_token ->
  unit ->
  list_workers_with_qualification_type_response

val make_list_workers_with_qualification_type_request :
  ?max_results:result_size ->
  ?next_token:pagination_token ->
  ?status:qualification_status ->
  qualification_type_id:entity_id ->
  unit ->
  list_workers_with_qualification_type_request

val make_list_worker_blocks_response :
  ?worker_blocks:worker_block_list ->
  ?num_results:integer ->
  ?next_token:pagination_token ->
  unit ->
  list_worker_blocks_response

val make_list_worker_blocks_request :
  ?max_results:result_size -> ?next_token:pagination_token -> unit -> list_worker_blocks_request

val make_list_review_policy_results_for_hit_response :
  ?next_token:pagination_token ->
  ?hit_review_report:review_report ->
  ?assignment_review_report:review_report ->
  ?hit_review_policy:review_policy ->
  ?assignment_review_policy:review_policy ->
  ?hit_id:entity_id ->
  unit ->
  list_review_policy_results_for_hit_response

val make_list_review_policy_results_for_hit_request :
  ?max_results:result_size ->
  ?next_token:pagination_token ->
  ?retrieve_results:boolean_ ->
  ?retrieve_actions:boolean_ ->
  ?policy_levels:review_policy_level_list ->
  hit_id:entity_id ->
  unit ->
  list_review_policy_results_for_hit_request

val make_hi_t :
  ?number_of_assignments_completed:integer ->
  ?number_of_assignments_available:integer ->
  ?number_of_assignments_pending:integer ->
  ?hit_review_status:hit_review_status ->
  ?qualification_requirements:qualification_requirement_list ->
  ?requester_annotation:string_ ->
  ?assignment_duration_in_seconds:long ->
  ?expiration:timestamp ->
  ?auto_approval_delay_in_seconds:long ->
  ?reward:currency_amount ->
  ?max_assignments:integer ->
  ?hit_status:hit_status ->
  ?keywords:string_ ->
  ?question:string_ ->
  ?description:string_ ->
  ?title:string_ ->
  ?creation_time:timestamp ->
  ?hit_layout_id:entity_id ->
  ?hit_group_id:entity_id ->
  ?hit_type_id:entity_id ->
  ?hit_id:entity_id ->
  unit ->
  hi_t

val make_list_reviewable_hi_ts_response :
  ?hi_ts:hit_list ->
  ?num_results:integer ->
  ?next_token:pagination_token ->
  unit ->
  list_reviewable_hi_ts_response

val make_list_reviewable_hi_ts_request :
  ?max_results:result_size ->
  ?next_token:pagination_token ->
  ?status:reviewable_hit_status ->
  ?hit_type_id:entity_id ->
  unit ->
  list_reviewable_hi_ts_request

val make_list_qualification_types_response :
  ?qualification_types:qualification_type_list ->
  ?next_token:pagination_token ->
  ?num_results:integer ->
  unit ->
  list_qualification_types_response

val make_list_qualification_types_request :
  ?max_results:result_size ->
  ?next_token:pagination_token ->
  ?must_be_owned_by_caller:boolean_ ->
  ?query:string_ ->
  must_be_requestable:boolean_ ->
  unit ->
  list_qualification_types_request

val make_list_qualification_requests_response :
  ?qualification_requests:qualification_request_list ->
  ?next_token:pagination_token ->
  ?num_results:integer ->
  unit ->
  list_qualification_requests_response

val make_list_qualification_requests_request :
  ?max_results:result_size ->
  ?next_token:pagination_token ->
  ?qualification_type_id:entity_id ->
  unit ->
  list_qualification_requests_request

val make_list_hi_ts_for_qualification_type_response :
  ?hi_ts:hit_list ->
  ?num_results:integer ->
  ?next_token:pagination_token ->
  unit ->
  list_hi_ts_for_qualification_type_response

val make_list_hi_ts_for_qualification_type_request :
  ?max_results:result_size ->
  ?next_token:pagination_token ->
  qualification_type_id:entity_id ->
  unit ->
  list_hi_ts_for_qualification_type_request

val make_list_hi_ts_response :
  ?hi_ts:hit_list ->
  ?num_results:integer ->
  ?next_token:pagination_token ->
  unit ->
  list_hi_ts_response

val make_list_hi_ts_request :
  ?max_results:result_size -> ?next_token:pagination_token -> unit -> list_hi_ts_request

val make_bonus_payment :
  ?grant_time:timestamp ->
  ?reason:string_ ->
  ?assignment_id:entity_id ->
  ?bonus_amount:currency_amount ->
  ?worker_id:customer_id ->
  unit ->
  bonus_payment

val make_list_bonus_payments_response :
  ?bonus_payments:bonus_payment_list ->
  ?next_token:pagination_token ->
  ?num_results:integer ->
  unit ->
  list_bonus_payments_response

val make_list_bonus_payments_request :
  ?max_results:result_size ->
  ?next_token:pagination_token ->
  ?assignment_id:entity_id ->
  ?hit_id:entity_id ->
  unit ->
  list_bonus_payments_request

val make_assignment :
  ?requester_feedback:string_ ->
  ?answer:string_ ->
  ?deadline:timestamp ->
  ?rejection_time:timestamp ->
  ?approval_time:timestamp ->
  ?submit_time:timestamp ->
  ?accept_time:timestamp ->
  ?auto_approval_time:timestamp ->
  ?assignment_status:assignment_status ->
  ?hit_id:entity_id ->
  ?worker_id:customer_id ->
  ?assignment_id:entity_id ->
  unit ->
  assignment

val make_list_assignments_for_hit_response :
  ?assignments:assignment_list ->
  ?num_results:integer ->
  ?next_token:pagination_token ->
  unit ->
  list_assignments_for_hit_response

val make_list_assignments_for_hit_request :
  ?assignment_statuses:assignment_status_list ->
  ?max_results:result_size ->
  ?next_token:pagination_token ->
  hit_id:entity_id ->
  unit ->
  list_assignments_for_hit_request

val make_get_qualification_type_response :
  ?qualification_type:qualification_type -> unit -> get_qualification_type_response

val make_get_qualification_type_request :
  qualification_type_id:entity_id -> unit -> get_qualification_type_request

val make_get_qualification_score_response :
  ?qualification:qualification -> unit -> get_qualification_score_response

val make_get_qualification_score_request :
  worker_id:customer_id ->
  qualification_type_id:entity_id ->
  unit ->
  get_qualification_score_request

val make_get_hit_response : ?hi_t:hi_t -> unit -> get_hit_response
val make_get_hit_request : hit_id:entity_id -> unit -> get_hit_request

val make_get_file_upload_url_response :
  ?file_upload_ur_l:string_ -> unit -> get_file_upload_url_response

val make_get_file_upload_url_request :
  question_identifier:string_ -> assignment_id:entity_id -> unit -> get_file_upload_url_request

val make_get_assignment_response :
  ?hi_t:hi_t -> ?assignment:assignment -> unit -> get_assignment_response

val make_get_assignment_request : assignment_id:entity_id -> unit -> get_assignment_request

val make_get_account_balance_response :
  ?on_hold_balance:currency_amount ->
  ?available_balance:currency_amount ->
  unit ->
  get_account_balance_response

val make_get_account_balance_request : unit -> unit
val make_disassociate_qualification_from_worker_response : unit -> unit

val make_disassociate_qualification_from_worker_request :
  ?reason:string_ ->
  qualification_type_id:entity_id ->
  worker_id:customer_id ->
  unit ->
  disassociate_qualification_from_worker_request

val make_delete_worker_block_response : unit -> unit

val make_delete_worker_block_request :
  ?reason:string_ -> worker_id:customer_id -> unit -> delete_worker_block_request

val make_delete_qualification_type_response : unit -> unit

val make_delete_qualification_type_request :
  qualification_type_id:entity_id -> unit -> delete_qualification_type_request

val make_delete_hit_response : unit -> unit
val make_delete_hit_request : hit_id:entity_id -> unit -> delete_hit_request
val make_create_worker_block_response : unit -> unit

val make_create_worker_block_request :
  reason:string_ -> worker_id:customer_id -> unit -> create_worker_block_request

val make_create_qualification_type_response :
  ?qualification_type:qualification_type -> unit -> create_qualification_type_response

val make_create_qualification_type_request :
  ?auto_granted_value:integer ->
  ?auto_granted:boolean_ ->
  ?test_duration_in_seconds:long ->
  ?answer_key:string_ ->
  ?test:string_ ->
  ?retry_delay_in_seconds:long ->
  ?keywords:string_ ->
  qualification_type_status:qualification_type_status ->
  description:string_ ->
  name:string_ ->
  unit ->
  create_qualification_type_request

val make_create_hit_with_hit_type_response : ?hi_t:hi_t -> unit -> create_hit_with_hit_type_response
val make_hit_layout_parameter : value:string_ -> name:string_ -> unit -> hit_layout_parameter

val make_create_hit_with_hit_type_request :
  ?hit_layout_parameters:hit_layout_parameter_list ->
  ?hit_layout_id:entity_id ->
  ?hit_review_policy:review_policy ->
  ?assignment_review_policy:review_policy ->
  ?unique_request_token:idempotency_token ->
  ?requester_annotation:string_ ->
  ?question:string_ ->
  ?max_assignments:integer ->
  lifetime_in_seconds:long ->
  hit_type_id:entity_id ->
  unit ->
  create_hit_with_hit_type_request

val make_create_hit_type_response : ?hit_type_id:entity_id -> unit -> create_hit_type_response

val make_create_hit_type_request :
  ?qualification_requirements:qualification_requirement_list ->
  ?keywords:string_ ->
  ?auto_approval_delay_in_seconds:long ->
  description:string_ ->
  title:string_ ->
  reward:currency_amount ->
  assignment_duration_in_seconds:long ->
  unit ->
  create_hit_type_request

val make_create_hit_response : ?hi_t:hi_t -> unit -> create_hit_response

val make_create_hit_request :
  ?hit_layout_parameters:hit_layout_parameter_list ->
  ?hit_layout_id:entity_id ->
  ?hit_review_policy:review_policy ->
  ?assignment_review_policy:review_policy ->
  ?unique_request_token:idempotency_token ->
  ?qualification_requirements:qualification_requirement_list ->
  ?requester_annotation:string_ ->
  ?question:string_ ->
  ?keywords:string_ ->
  ?auto_approval_delay_in_seconds:long ->
  ?max_assignments:integer ->
  description:string_ ->
  title:string_ ->
  reward:currency_amount ->
  assignment_duration_in_seconds:long ->
  lifetime_in_seconds:long ->
  unit ->
  create_hit_request

val make_create_additional_assignments_for_hit_response : unit -> unit

val make_create_additional_assignments_for_hit_request :
  ?unique_request_token:idempotency_token ->
  number_of_additional_assignments:integer ->
  hit_id:entity_id ->
  unit ->
  create_additional_assignments_for_hit_request

val make_associate_qualification_with_worker_response : unit -> unit

val make_associate_qualification_with_worker_request :
  ?send_notification:boolean_ ->
  ?integer_value:integer ->
  worker_id:customer_id ->
  qualification_type_id:entity_id ->
  unit ->
  associate_qualification_with_worker_request

val make_approve_assignment_response : unit -> unit

val make_approve_assignment_request :
  ?override_rejection:boolean_ ->
  ?requester_feedback:string_ ->
  assignment_id:entity_id ->
  unit ->
  approve_assignment_request

val make_accept_qualification_request_response : unit -> unit

val make_accept_qualification_request_request :
  ?integer_value:integer ->
  qualification_request_id:string_ ->
  unit ->
  accept_qualification_request_request
