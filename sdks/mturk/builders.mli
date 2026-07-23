open Types

val make_accept_qualification_request_response : unit -> unit

val make_accept_qualification_request_request :
  ?integer_value:integer ->
  qualification_request_id:string_ ->
  unit ->
  accept_qualification_request_request

val make_approve_assignment_response : unit -> unit

val make_approve_assignment_request :
  ?requester_feedback:string_ ->
  ?override_rejection:boolean_ ->
  assignment_id:entity_id ->
  unit ->
  approve_assignment_request

val make_assignment :
  ?assignment_id:entity_id ->
  ?worker_id:customer_id ->
  ?hit_id:entity_id ->
  ?assignment_status:assignment_status ->
  ?auto_approval_time:timestamp ->
  ?accept_time:timestamp ->
  ?submit_time:timestamp ->
  ?approval_time:timestamp ->
  ?rejection_time:timestamp ->
  ?deadline:timestamp ->
  ?answer:string_ ->
  ?requester_feedback:string_ ->
  unit ->
  assignment

val make_associate_qualification_with_worker_response : unit -> unit

val make_associate_qualification_with_worker_request :
  ?integer_value:integer ->
  ?send_notification:boolean_ ->
  qualification_type_id:entity_id ->
  worker_id:customer_id ->
  unit ->
  associate_qualification_with_worker_request

val make_bonus_payment :
  ?worker_id:customer_id ->
  ?bonus_amount:currency_amount ->
  ?assignment_id:entity_id ->
  ?reason:string_ ->
  ?grant_time:timestamp ->
  unit ->
  bonus_payment

val make_create_additional_assignments_for_hit_response : unit -> unit

val make_create_additional_assignments_for_hit_request :
  ?unique_request_token:idempotency_token ->
  hit_id:entity_id ->
  number_of_additional_assignments:integer ->
  unit ->
  create_additional_assignments_for_hit_request

val make_locale : ?subdivision:country_parameters -> country:country_parameters -> unit -> locale

val make_qualification_requirement :
  ?integer_values:integer_list ->
  ?locale_values:locale_list ->
  ?required_to_preview:boolean_ ->
  ?actions_guarded:hit_access_actions ->
  qualification_type_id:string_ ->
  comparator:comparator ->
  unit ->
  qualification_requirement

val make_hi_t :
  ?hit_id:entity_id ->
  ?hit_type_id:entity_id ->
  ?hit_group_id:entity_id ->
  ?hit_layout_id:entity_id ->
  ?creation_time:timestamp ->
  ?title:string_ ->
  ?description:string_ ->
  ?question:string_ ->
  ?keywords:string_ ->
  ?hit_status:hit_status ->
  ?max_assignments:integer ->
  ?reward:currency_amount ->
  ?auto_approval_delay_in_seconds:long ->
  ?expiration:timestamp ->
  ?assignment_duration_in_seconds:long ->
  ?requester_annotation:string_ ->
  ?qualification_requirements:qualification_requirement_list ->
  ?hit_review_status:hit_review_status ->
  ?number_of_assignments_pending:integer ->
  ?number_of_assignments_available:integer ->
  ?number_of_assignments_completed:integer ->
  unit ->
  hi_t

val make_create_hit_response : ?hi_t:hi_t -> unit -> create_hit_response
val make_hit_layout_parameter : name:string_ -> value:string_ -> unit -> hit_layout_parameter
val make_parameter_map_entry : ?key:string_ -> ?values:string_list -> unit -> parameter_map_entry

val make_policy_parameter :
  ?key:string_ ->
  ?values:string_list ->
  ?map_entries:parameter_map_entry_list ->
  unit ->
  policy_parameter

val make_review_policy :
  ?parameters:policy_parameter_list -> policy_name:string_ -> unit -> review_policy

val make_create_hit_request :
  ?max_assignments:integer ->
  ?auto_approval_delay_in_seconds:long ->
  ?keywords:string_ ->
  ?question:string_ ->
  ?requester_annotation:string_ ->
  ?qualification_requirements:qualification_requirement_list ->
  ?unique_request_token:idempotency_token ->
  ?assignment_review_policy:review_policy ->
  ?hit_review_policy:review_policy ->
  ?hit_layout_id:entity_id ->
  ?hit_layout_parameters:hit_layout_parameter_list ->
  lifetime_in_seconds:long ->
  assignment_duration_in_seconds:long ->
  reward:currency_amount ->
  title:string_ ->
  description:string_ ->
  unit ->
  create_hit_request

val make_create_hit_type_response : ?hit_type_id:entity_id -> unit -> create_hit_type_response

val make_create_hit_type_request :
  ?auto_approval_delay_in_seconds:long ->
  ?keywords:string_ ->
  ?qualification_requirements:qualification_requirement_list ->
  assignment_duration_in_seconds:long ->
  reward:currency_amount ->
  title:string_ ->
  description:string_ ->
  unit ->
  create_hit_type_request

val make_create_hit_with_hit_type_response : ?hi_t:hi_t -> unit -> create_hit_with_hit_type_response

val make_create_hit_with_hit_type_request :
  ?max_assignments:integer ->
  ?question:string_ ->
  ?requester_annotation:string_ ->
  ?unique_request_token:idempotency_token ->
  ?assignment_review_policy:review_policy ->
  ?hit_review_policy:review_policy ->
  ?hit_layout_id:entity_id ->
  ?hit_layout_parameters:hit_layout_parameter_list ->
  hit_type_id:entity_id ->
  lifetime_in_seconds:long ->
  unit ->
  create_hit_with_hit_type_request

val make_qualification_type :
  ?qualification_type_id:entity_id ->
  ?creation_time:timestamp ->
  ?name:string_ ->
  ?description:string_ ->
  ?keywords:string_ ->
  ?qualification_type_status:qualification_type_status ->
  ?test:string_ ->
  ?test_duration_in_seconds:long ->
  ?answer_key:string_ ->
  ?retry_delay_in_seconds:long ->
  ?is_requestable:boolean_ ->
  ?auto_granted:boolean_ ->
  ?auto_granted_value:integer ->
  unit ->
  qualification_type

val make_create_qualification_type_response :
  ?qualification_type:qualification_type -> unit -> create_qualification_type_response

val make_create_qualification_type_request :
  ?keywords:string_ ->
  ?retry_delay_in_seconds:long ->
  ?test:string_ ->
  ?answer_key:string_ ->
  ?test_duration_in_seconds:long ->
  ?auto_granted:boolean_ ->
  ?auto_granted_value:integer ->
  name:string_ ->
  description:string_ ->
  qualification_type_status:qualification_type_status ->
  unit ->
  create_qualification_type_request

val make_create_worker_block_response : unit -> unit

val make_create_worker_block_request :
  worker_id:customer_id -> reason:string_ -> unit -> create_worker_block_request

val make_delete_hit_response : unit -> unit
val make_delete_hit_request : hit_id:entity_id -> unit -> delete_hit_request
val make_delete_qualification_type_response : unit -> unit

val make_delete_qualification_type_request :
  qualification_type_id:entity_id -> unit -> delete_qualification_type_request

val make_delete_worker_block_response : unit -> unit

val make_delete_worker_block_request :
  ?reason:string_ -> worker_id:customer_id -> unit -> delete_worker_block_request

val make_disassociate_qualification_from_worker_response : unit -> unit

val make_disassociate_qualification_from_worker_request :
  ?reason:string_ ->
  worker_id:customer_id ->
  qualification_type_id:entity_id ->
  unit ->
  disassociate_qualification_from_worker_request

val make_get_account_balance_response :
  ?available_balance:currency_amount ->
  ?on_hold_balance:currency_amount ->
  unit ->
  get_account_balance_response

val make_get_account_balance_request : unit -> unit

val make_get_assignment_response :
  ?assignment:assignment -> ?hi_t:hi_t -> unit -> get_assignment_response

val make_get_assignment_request : assignment_id:entity_id -> unit -> get_assignment_request

val make_get_file_upload_url_response :
  ?file_upload_ur_l:string_ -> unit -> get_file_upload_url_response

val make_get_file_upload_url_request :
  assignment_id:entity_id -> question_identifier:string_ -> unit -> get_file_upload_url_request

val make_get_hit_response : ?hi_t:hi_t -> unit -> get_hit_response
val make_get_hit_request : hit_id:entity_id -> unit -> get_hit_request

val make_qualification :
  ?qualification_type_id:entity_id ->
  ?worker_id:customer_id ->
  ?grant_time:timestamp ->
  ?integer_value:integer ->
  ?locale_value:locale ->
  ?status:qualification_status ->
  unit ->
  qualification

val make_get_qualification_score_response :
  ?qualification:qualification -> unit -> get_qualification_score_response

val make_get_qualification_score_request :
  qualification_type_id:entity_id ->
  worker_id:customer_id ->
  unit ->
  get_qualification_score_request

val make_get_qualification_type_response :
  ?qualification_type:qualification_type -> unit -> get_qualification_type_response

val make_get_qualification_type_request :
  qualification_type_id:entity_id -> unit -> get_qualification_type_request

val make_list_assignments_for_hit_response :
  ?next_token:pagination_token ->
  ?num_results:integer ->
  ?assignments:assignment_list ->
  unit ->
  list_assignments_for_hit_response

val make_list_assignments_for_hit_request :
  ?next_token:pagination_token ->
  ?max_results:result_size ->
  ?assignment_statuses:assignment_status_list ->
  hit_id:entity_id ->
  unit ->
  list_assignments_for_hit_request

val make_list_bonus_payments_response :
  ?num_results:integer ->
  ?next_token:pagination_token ->
  ?bonus_payments:bonus_payment_list ->
  unit ->
  list_bonus_payments_response

val make_list_bonus_payments_request :
  ?hit_id:entity_id ->
  ?assignment_id:entity_id ->
  ?next_token:pagination_token ->
  ?max_results:result_size ->
  unit ->
  list_bonus_payments_request

val make_list_hi_ts_response :
  ?next_token:pagination_token ->
  ?num_results:integer ->
  ?hi_ts:hit_list ->
  unit ->
  list_hi_ts_response

val make_list_hi_ts_request :
  ?next_token:pagination_token -> ?max_results:result_size -> unit -> list_hi_ts_request

val make_list_hi_ts_for_qualification_type_response :
  ?next_token:pagination_token ->
  ?num_results:integer ->
  ?hi_ts:hit_list ->
  unit ->
  list_hi_ts_for_qualification_type_response

val make_list_hi_ts_for_qualification_type_request :
  ?next_token:pagination_token ->
  ?max_results:result_size ->
  qualification_type_id:entity_id ->
  unit ->
  list_hi_ts_for_qualification_type_request

val make_qualification_request :
  ?qualification_request_id:string_ ->
  ?qualification_type_id:entity_id ->
  ?worker_id:customer_id ->
  ?test:string_ ->
  ?answer:string_ ->
  ?submit_time:timestamp ->
  unit ->
  qualification_request

val make_list_qualification_requests_response :
  ?num_results:integer ->
  ?next_token:pagination_token ->
  ?qualification_requests:qualification_request_list ->
  unit ->
  list_qualification_requests_response

val make_list_qualification_requests_request :
  ?qualification_type_id:entity_id ->
  ?next_token:pagination_token ->
  ?max_results:result_size ->
  unit ->
  list_qualification_requests_request

val make_list_qualification_types_response :
  ?num_results:integer ->
  ?next_token:pagination_token ->
  ?qualification_types:qualification_type_list ->
  unit ->
  list_qualification_types_response

val make_list_qualification_types_request :
  ?query:string_ ->
  ?must_be_owned_by_caller:boolean_ ->
  ?next_token:pagination_token ->
  ?max_results:result_size ->
  must_be_requestable:boolean_ ->
  unit ->
  list_qualification_types_request

val make_review_action_detail :
  ?action_id:entity_id ->
  ?action_name:string_ ->
  ?target_id:entity_id ->
  ?target_type:string_ ->
  ?status:review_action_status ->
  ?complete_time:timestamp ->
  ?result_:string_ ->
  ?error_code:string_ ->
  unit ->
  review_action_detail

val make_review_result_detail :
  ?action_id:entity_id ->
  ?subject_id:entity_id ->
  ?subject_type:string_ ->
  ?question_id:entity_id ->
  ?key:string_ ->
  ?value:string_ ->
  unit ->
  review_result_detail

val make_review_report :
  ?review_results:review_result_detail_list ->
  ?review_actions:review_action_detail_list ->
  unit ->
  review_report

val make_list_review_policy_results_for_hit_response :
  ?hit_id:entity_id ->
  ?assignment_review_policy:review_policy ->
  ?hit_review_policy:review_policy ->
  ?assignment_review_report:review_report ->
  ?hit_review_report:review_report ->
  ?next_token:pagination_token ->
  unit ->
  list_review_policy_results_for_hit_response

val make_list_review_policy_results_for_hit_request :
  ?policy_levels:review_policy_level_list ->
  ?retrieve_actions:boolean_ ->
  ?retrieve_results:boolean_ ->
  ?next_token:pagination_token ->
  ?max_results:result_size ->
  hit_id:entity_id ->
  unit ->
  list_review_policy_results_for_hit_request

val make_list_reviewable_hi_ts_response :
  ?next_token:pagination_token ->
  ?num_results:integer ->
  ?hi_ts:hit_list ->
  unit ->
  list_reviewable_hi_ts_response

val make_list_reviewable_hi_ts_request :
  ?hit_type_id:entity_id ->
  ?status:reviewable_hit_status ->
  ?next_token:pagination_token ->
  ?max_results:result_size ->
  unit ->
  list_reviewable_hi_ts_request

val make_worker_block : ?worker_id:customer_id -> ?reason:string_ -> unit -> worker_block

val make_list_worker_blocks_response :
  ?next_token:pagination_token ->
  ?num_results:integer ->
  ?worker_blocks:worker_block_list ->
  unit ->
  list_worker_blocks_response

val make_list_worker_blocks_request :
  ?next_token:pagination_token -> ?max_results:result_size -> unit -> list_worker_blocks_request

val make_list_workers_with_qualification_type_response :
  ?next_token:pagination_token ->
  ?num_results:integer ->
  ?qualifications:qualification_list ->
  unit ->
  list_workers_with_qualification_type_response

val make_list_workers_with_qualification_type_request :
  ?status:qualification_status ->
  ?next_token:pagination_token ->
  ?max_results:result_size ->
  qualification_type_id:entity_id ->
  unit ->
  list_workers_with_qualification_type_request

val make_update_qualification_type_response :
  ?qualification_type:qualification_type -> unit -> update_qualification_type_response

val make_update_qualification_type_request :
  ?description:string_ ->
  ?qualification_type_status:qualification_type_status ->
  ?test:string_ ->
  ?answer_key:string_ ->
  ?test_duration_in_seconds:long ->
  ?retry_delay_in_seconds:long ->
  ?auto_granted:boolean_ ->
  ?auto_granted_value:integer ->
  qualification_type_id:entity_id ->
  unit ->
  update_qualification_type_request

val make_update_notification_settings_response : unit -> unit

val make_notification_specification :
  destination:string_ ->
  transport:notification_transport ->
  version:string_ ->
  event_types:event_type_list ->
  unit ->
  notification_specification

val make_update_notification_settings_request :
  ?notification:notification_specification ->
  ?active:boolean_ ->
  hit_type_id:entity_id ->
  unit ->
  update_notification_settings_request

val make_update_hit_type_of_hit_response : unit -> unit

val make_update_hit_type_of_hit_request :
  hit_id:entity_id -> hit_type_id:entity_id -> unit -> update_hit_type_of_hit_request

val make_update_hit_review_status_response : unit -> unit

val make_update_hit_review_status_request :
  ?revert:boolean_ -> hit_id:entity_id -> unit -> update_hit_review_status_request

val make_update_expiration_for_hit_response : unit -> unit

val make_update_expiration_for_hit_request :
  hit_id:entity_id -> expire_at:timestamp -> unit -> update_expiration_for_hit_request

val make_send_test_event_notification_response : unit -> unit

val make_send_test_event_notification_request :
  notification:notification_specification ->
  test_event_type:event_type ->
  unit ->
  send_test_event_notification_request

val make_send_bonus_response : unit -> unit

val make_send_bonus_request :
  ?unique_request_token:idempotency_token ->
  worker_id:customer_id ->
  bonus_amount:currency_amount ->
  assignment_id:entity_id ->
  reason:string_ ->
  unit ->
  send_bonus_request

val make_reject_qualification_request_response : unit -> unit

val make_reject_qualification_request_request :
  ?reason:string_ ->
  qualification_request_id:string_ ->
  unit ->
  reject_qualification_request_request

val make_reject_assignment_response : unit -> unit

val make_reject_assignment_request :
  assignment_id:entity_id -> requester_feedback:string_ -> unit -> reject_assignment_request

val make_notify_workers_failure_status :
  ?notify_workers_failure_code:notify_workers_failure_code ->
  ?notify_workers_failure_message:string_ ->
  ?worker_id:customer_id ->
  unit ->
  notify_workers_failure_status

val make_notify_workers_response :
  ?notify_workers_failure_statuses:notify_workers_failure_status_list ->
  unit ->
  notify_workers_response

val make_notify_workers_request :
  subject:string_ ->
  message_text:string_ ->
  worker_ids:customer_id_list ->
  unit ->
  notify_workers_request
