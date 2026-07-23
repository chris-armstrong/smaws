(** MTurk client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module NotifyWorkers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    notify_workers_request ->
    ( notify_workers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    notify_workers_request ->
    ( notify_workers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [NotifyWorkers] operation sends an email to one or more Workers that you specify with the \
   Worker ID. You can specify up to 100 Worker IDs to send the same message with a single call to \
   the NotifyWorkers operation. The NotifyWorkers operation will send a notification email to a \
   Worker only if you have previously approved or rejected work from the Worker. \n"]

module RejectAssignment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reject_assignment_request ->
    ( reject_assignment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reject_assignment_request ->
    ( reject_assignment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [RejectAssignment] operation rejects the results of a completed assignment. \n\n\
  \  You can include an optional feedback message with the rejection, which the Worker can see in \
   the Status section of the web site. When you include a feedback message with the rejection, it \
   helps the Worker understand why the assignment was rejected, and can improve the quality of the \
   results the Worker submits in the future. \n\
  \ \n\
  \   Only the Requester who created the HIT can reject an assignment for the HIT. \n\
  \  "]

module RejectQualificationRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reject_qualification_request_request ->
    ( reject_qualification_request_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reject_qualification_request_request ->
    ( reject_qualification_request_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [RejectQualificationRequest] operation rejects a user's request for a Qualification. \n\n\
  \  You can provide a text message explaining why the request was rejected. The Worker who made \
   the request can see this message.\n\
  \ "]

module SendBonus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_bonus_request ->
    ( send_bonus_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_bonus_request ->
    ( send_bonus_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [SendBonus] operation issues a payment of money from your account to a Worker. This \
   payment happens separately from the reward you pay to the Worker when you approve the Worker's \
   assignment. The SendBonus operation requires the Worker's ID and the assignment ID as \
   parameters to initiate payment of the bonus. You must include a message that explains the \
   reason for the bonus payment, as the Worker may not be expecting the payment. Amazon Mechanical \
   Turk collects a fee for bonus payments, similar to the HIT listing fee. This operation fails if \
   your account does not have enough funds to pay for both the bonus and the fees. \n"]

module SendTestEventNotification : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_test_event_notification_request ->
    ( send_test_event_notification_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_test_event_notification_request ->
    ( send_test_event_notification_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [SendTestEventNotification] operation causes Amazon Mechanical Turk to send a notification \
   message as if a HIT event occurred, according to the provided notification specification. This \
   allows you to test notifications without setting up notifications for a real HIT type and \
   trying to trigger them using the website. When you call this operation, the service attempts to \
   send the test notification immediately. \n"]

module UpdateExpirationForHIT : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_expiration_for_hit_request ->
    ( update_expiration_for_hit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_expiration_for_hit_request ->
    ( update_expiration_for_hit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [UpdateExpirationForHIT] operation allows you update the expiration time of a HIT. If you \
   update it to a time in the past, the HIT will be immediately expired. \n"]

module UpdateHITReviewStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_hit_review_status_request ->
    ( update_hit_review_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_hit_review_status_request ->
    ( update_hit_review_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [UpdateHITReviewStatus] operation updates the status of a HIT. If the status is \
   Reviewable, this operation can update the status to Reviewing, or it can revert a Reviewing HIT \
   back to the Reviewable status. \n"]

module UpdateHITTypeOfHIT : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_hit_type_of_hit_request ->
    ( update_hit_type_of_hit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_hit_type_of_hit_request ->
    ( update_hit_type_of_hit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [UpdateHITTypeOfHIT] operation allows you to change the HITType properties of a HIT. This \
   operation disassociates the HIT from its old HITType properties and associates it with the new \
   HITType properties. The HIT takes on the properties of the new HITType in place of the old \
   ones. \n"]

module UpdateNotificationSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_notification_settings_request ->
    ( update_notification_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_notification_settings_request ->
    ( update_notification_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [UpdateNotificationSettings] operation creates, updates, disables or re-enables \
   notifications for a HIT type. If you call the UpdateNotificationSettings operation for a HIT \
   type that already has a notification specification, the operation replaces the old \
   specification with a new one. You can call the UpdateNotificationSettings operation to enable \
   or disable notifications for the HIT type, without having to modify the notification \
   specification itself by providing updates to the Active status without specifying a new \
   notification specification. To change the Active status of a HIT type's notifications, the HIT \
   type must already have a notification specification, or one must be provided in the same call \
   to [UpdateNotificationSettings]. \n"]

module UpdateQualificationType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_qualification_type_request ->
    ( update_qualification_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_qualification_type_request ->
    ( update_qualification_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [UpdateQualificationType] operation modifies the attributes of an existing Qualification \
   type, which is represented by a QualificationType data structure. Only the owner of a \
   Qualification type can modify its attributes. \n\n\
  \  Most attributes of a Qualification type can be changed after the type has been created. \
   However, the Name and Keywords fields cannot be modified. The RetryDelayInSeconds parameter can \
   be modified or added to change the delay or to enable retries, but RetryDelayInSeconds cannot \
   be used to disable retries. \n\
  \ \n\
  \   You can use this operation to update the test for a Qualification type. The test is updated \
   based on the values specified for the Test, TestDurationInSeconds and AnswerKey parameters. All \
   three parameters specify the updated test. If you are updating the test for a type, you must \
   specify the Test and TestDurationInSeconds parameters. The AnswerKey parameter is optional; \
   omitting it specifies that the updated test does not have an answer key. \n\
  \  \n\
  \    If you omit the Test parameter, the test for the Qualification type is unchanged. There is \
   no way to remove a test from a Qualification type that has one. If the type already has a test, \
   you cannot update it to be AutoGranted. If the Qualification type does not have a test and one \
   is provided by an update, the type will henceforth have a test. \n\
  \   \n\
  \     If you want to update the test duration or answer key for an existing test without \
   changing the questions, you must specify a Test parameter with the original questions, along \
   with the updated values. \n\
  \    \n\
  \      If you provide an updated Test but no AnswerKey, the new test will not have an answer \
   key. Requests for such Qualifications must be granted manually. \n\
  \     \n\
  \       You can also update the AutoGranted and AutoGrantedValue attributes of the Qualification \
   type.\n\
  \      "]

module ListWorkersWithQualificationType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_workers_with_qualification_type_request ->
    ( list_workers_with_qualification_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_workers_with_qualification_type_request ->
    ( list_workers_with_qualification_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [ListWorkersWithQualificationType] operation returns all of the Workers that have been \
   associated with a given Qualification type. \n"]

module ListWorkerBlocks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_worker_blocks_request ->
    ( list_worker_blocks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_worker_blocks_request ->
    ( list_worker_blocks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "The [ListWorkersBlocks] operation retrieves a list of Workers who are blocked from working on \
   your HITs.\n"]

module ListReviewableHITs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_reviewable_hi_ts_request ->
    ( list_reviewable_hi_ts_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_reviewable_hi_ts_request ->
    ( list_reviewable_hi_ts_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [ListReviewableHITs] operation retrieves the HITs with Status equal to Reviewable or \
   Status equal to Reviewing that belong to the Requester calling the operation. \n"]

module ListReviewPolicyResultsForHIT : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_review_policy_results_for_hit_request ->
    ( list_review_policy_results_for_hit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_review_policy_results_for_hit_request ->
    ( list_review_policy_results_for_hit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [ListReviewPolicyResultsForHIT] operation retrieves the computed results and the actions \
   taken in the course of executing your Review Policies for a given HIT. For information about \
   how to specify Review Policies when you call CreateHIT, see Review Policies. The \
   ListReviewPolicyResultsForHIT operation can return results for both Assignment-level and \
   HIT-level review results. \n"]

module ListQualificationTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_qualification_types_request ->
    ( list_qualification_types_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_qualification_types_request ->
    ( list_qualification_types_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [ListQualificationTypes] operation returns a list of Qualification types, filtered by an \
   optional search term. \n"]

module ListQualificationRequests : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_qualification_requests_request ->
    ( list_qualification_requests_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_qualification_requests_request ->
    ( list_qualification_requests_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [ListQualificationRequests] operation retrieves requests for Qualifications of a \
   particular Qualification type. The owner of the Qualification type calls this operation to poll \
   for pending requests, and accepts them using the AcceptQualification operation. \n"]

module ListHITsForQualificationType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_hi_ts_for_qualification_type_request ->
    ( list_hi_ts_for_qualification_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_hi_ts_for_qualification_type_request ->
    ( list_hi_ts_for_qualification_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [ListHITsForQualificationType] operation returns the HITs that use the given Qualification \
   type for a Qualification requirement. The operation returns HITs of any status, except for HITs \
   that have been deleted with the [DeleteHIT] operation or that have been auto-deleted. \n"]

module ListHITs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_hi_ts_request ->
    ( list_hi_ts_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_hi_ts_request ->
    ( list_hi_ts_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [ListHITs] operation returns all of a Requester's HITs. The operation returns HITs of any \
   status, except for HITs that have been deleted of with the DeleteHIT operation or that have \
   been auto-deleted. \n"]

module ListBonusPayments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_bonus_payments_request ->
    ( list_bonus_payments_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_bonus_payments_request ->
    ( list_bonus_payments_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [ListBonusPayments] operation retrieves the amounts of bonuses you have paid to Workers \
   for a given HIT or assignment. \n"]

module ListAssignmentsForHIT : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_assignments_for_hit_request ->
    ( list_assignments_for_hit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_assignments_for_hit_request ->
    ( list_assignments_for_hit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [ListAssignmentsForHIT] operation retrieves completed assignments for a HIT. You can use \
   this operation to retrieve the results for a HIT. \n\n\
  \  You can get assignments for a HIT at any time, even if the HIT is not yet Reviewable. If a \
   HIT requested multiple assignments, and has received some results but has not yet become \
   Reviewable, you can still retrieve the partial results with this operation. \n\
  \ \n\
  \   Use the AssignmentStatus parameter to control which set of assignments for a HIT are \
   returned. The ListAssignmentsForHIT operation can return submitted assignments awaiting \
   approval, or it can return assignments that have already been approved or rejected. You can set \
   AssignmentStatus=Approved,Rejected to get assignments that have already been approved and \
   rejected together in one result set. \n\
  \  \n\
  \    Only the Requester who created the HIT can retrieve the assignments for that HIT. \n\
  \   \n\
  \     Results are sorted and divided into numbered pages and the operation returns a single page \
   of results. You can use the parameters of the operation to control sorting and pagination. \n\
  \    "]

module GetQualificationType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_qualification_type_request ->
    ( get_qualification_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_qualification_type_request ->
    ( get_qualification_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [GetQualificationType]operation retrieves information about a Qualification type using its \
   ID. \n"]

module GetQualificationScore : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_qualification_score_request ->
    ( get_qualification_score_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_qualification_score_request ->
    ( get_qualification_score_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [GetQualificationScore] operation returns the value of a Worker's Qualification for a \
   given Qualification type. \n\n\
  \  To get a Worker's Qualification, you must know the Worker's ID. The Worker's ID is included \
   in the assignment data returned by the [ListAssignmentsForHIT] operation. \n\
  \ \n\
  \  Only the owner of a Qualification type can query the value of a Worker's Qualification of \
   that type.\n\
  \  "]

module GetHIT : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_hit_request ->
    ( get_hit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_hit_request ->
    ( get_hit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " The [GetHIT] operation retrieves the details of the specified HIT. \n"]

module GetFileUploadURL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_file_upload_url_request ->
    ( get_file_upload_url_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_file_upload_url_request ->
    ( get_file_upload_url_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [GetFileUploadURL] operation generates and returns a temporary URL. You use the temporary \
   URL to retrieve a file uploaded by a Worker as an answer to a FileUploadAnswer question for a \
   HIT. The temporary URL is generated the instant the GetFileUploadURL operation is called, and \
   is valid for 60 seconds. You can get a temporary file upload URL any time until the HIT is \
   disposed. After the HIT is disposed, any uploaded files are deleted, and cannot be retrieved. \
   Pending Deprecation on December 12, 2017. The Answer Specification structure will no longer \
   support the [FileUploadAnswer] element to be used for the QuestionForm data structure. Instead, \
   we recommend that Requesters who want to create HITs asking Workers to upload files to use \
   Amazon S3. \n"]

module GetAssignment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_assignment_request ->
    ( get_assignment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_assignment_request ->
    ( get_assignment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " The [GetAssignment] operation retrieves the details of the specified Assignment. \n"]

module GetAccountBalance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_account_balance_request ->
    ( get_account_balance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_account_balance_request ->
    ( get_account_balance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "The [GetAccountBalance] operation retrieves the Prepaid HITs balance in your Amazon Mechanical \
   Turk account if you are a Prepaid Requester. Alternatively, this operation will retrieve the \
   remaining available AWS Billing usage if you have enabled AWS Billing. Note: If you have \
   enabled AWS Billing and still have a remaining Prepaid HITs balance, this balance can be viewed \
   on the My Account page in the Requester console.\n"]

module DisassociateQualificationFromWorker : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_qualification_from_worker_request ->
    ( disassociate_qualification_from_worker_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_qualification_from_worker_request ->
    ( disassociate_qualification_from_worker_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [DisassociateQualificationFromWorker] revokes a previously granted Qualification from a \
   user. \n\n\
  \  You can provide a text message explaining why the Qualification was revoked. The user who had \
   the Qualification can see this message. \n\
  \ "]

module DeleteWorkerBlock : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_worker_block_request ->
    ( delete_worker_block_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_worker_block_request ->
    ( delete_worker_block_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "The [DeleteWorkerBlock] operation allows you to reinstate a blocked Worker to work on your \
   HITs. This operation reverses the effects of the CreateWorkerBlock operation. You need the \
   Worker ID to use this operation. If the Worker ID is missing or invalid, this operation fails \
   and returns the message \226\128\156WorkerId is invalid.\226\128\157 If the specified Worker is \
   not blocked, this operation returns successfully.\n"]

module DeleteQualificationType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_qualification_type_request ->
    ( delete_qualification_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_qualification_type_request ->
    ( delete_qualification_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [DeleteQualificationType] deletes a Qualification type and deletes any HIT types that are \
   associated with the Qualification type. \n\n\
  \ This operation does not revoke Qualifications already assigned to Workers because the \
   Qualifications might be needed for active HITs. If there are any pending requests for the \
   Qualification type, Amazon Mechanical Turk rejects those requests. After you delete a \
   Qualification type, you can no longer use it to create HITs or HIT types.\n\
  \ \n\
  \   DeleteQualificationType must wait for all the HITs that use the deleted Qualification type \
   to be deleted before completing. It may take up to 48 hours before DeleteQualificationType \
   completes and the unique name of the Qualification type is available for reuse with \
   CreateQualificationType.\n\
  \   \n\
  \    "]

module DeleteHIT : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_hit_request ->
    ( delete_hit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_hit_request ->
    ( delete_hit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [DeleteHIT] operation is used to delete HIT that is no longer needed. Only the Requester \
   who created the HIT can delete it. \n\n\
  \  You can only dispose of HITs that are in the [Reviewable] state, with all of their submitted \
   assignments already either approved or rejected. If you call the DeleteHIT operation on a HIT \
   that is not in the [Reviewable] state (for example, that has not expired, or still has active \
   assignments), or on a HIT that is Reviewable but without all of its submitted assignments \
   already approved or rejected, the service will return an error. \n\
  \ \n\
  \   {ul\n\
  \         {-   HITs are automatically disposed of after 120 days. \n\
  \             \n\
  \              }\n\
  \         {-   After you dispose of a HIT, you can no longer approve the HIT's rejected \
   assignments. \n\
  \             \n\
  \              }\n\
  \         {-   Disposed HITs are not returned in results for the ListHITs operation. \n\
  \             \n\
  \              }\n\
  \         {-   Disposing HITs can improve the performance of operations such as \
   ListReviewableHITs and ListHITs. \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   "]

module CreateWorkerBlock : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_worker_block_request ->
    ( create_worker_block_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_worker_block_request ->
    ( create_worker_block_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "The [CreateWorkerBlock] operation allows you to prevent a Worker from working on your HITs. For \
   example, you can block a Worker who is producing poor quality work. You can block up to 100,000 \
   Workers.\n"]

module CreateQualificationType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_qualification_type_request ->
    ( create_qualification_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_qualification_type_request ->
    ( create_qualification_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [CreateQualificationType] operation creates a new Qualification type, which is represented \
   by a [QualificationType] data structure. \n"]

module CreateHITWithHITType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_hit_with_hit_type_request ->
    ( create_hit_with_hit_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_hit_with_hit_type_request ->
    ( create_hit_with_hit_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [CreateHITWithHITType] operation creates a new Human Intelligence Task (HIT) using an \
   existing HITTypeID generated by the [CreateHITType] operation. \n\n\
  \  This is an alternative way to create HITs from the [CreateHIT] operation. This is the \
   recommended best practice for Requesters who are creating large numbers of HITs. \n\
  \ \n\
  \  CreateHITWithHITType also supports several ways to provide question data: by providing a \
   value for the [Question] parameter that fully specifies the contents of the HIT, or by \
   providing a [HitLayoutId] and associated [HitLayoutParameters]. \n\
  \  \n\
  \     If a HIT is created with 10 or more maximum assignments, there is an additional fee. For \
   more information, see {{:https://requester.mturk.com/pricing}Amazon Mechanical Turk Pricing}. \n\
  \    \n\
  \     "]

module CreateHITType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_hit_type_request ->
    ( create_hit_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_hit_type_request ->
    ( create_hit_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [CreateHITType] operation creates a new HIT type. This operation allows you to define a \
   standard set of HIT properties to use when creating HITs. If you register a HIT type with \
   values that match an existing HIT type, the HIT type ID of the existing type will be returned. \n"]

module CreateHIT : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_hit_request ->
    ( create_hit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_hit_request ->
    ( create_hit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "The [CreateHIT] operation creates a new Human Intelligence Task (HIT). The new HIT is made \
   available for Workers to find and accept on the Amazon Mechanical Turk website. \n\n\
  \  This operation allows you to specify a new HIT by passing in values for the properties of the \
   HIT, such as its title, reward amount and number of assignments. When you pass these values to \
   [CreateHIT], a new HIT is created for you, with a new [HITTypeID]. The HITTypeID can be used to \
   create additional HITs in the future without needing to specify common parameters such as the \
   title, description and reward amount each time.\n\
  \ \n\
  \   An alternative way to create HITs is to first generate a HITTypeID using the [CreateHITType] \
   operation and then call the [CreateHITWithHITType] operation. This is the recommended best \
   practice for Requesters who are creating large numbers of HITs. \n\
  \  \n\
  \   CreateHIT also supports several ways to provide question data: by providing a value for the \
   [Question] parameter that fully specifies the contents of the HIT, or by providing a \
   [HitLayoutId] and associated [HitLayoutParameters]. \n\
  \   \n\
  \      If a HIT is created with 10 or more maximum assignments, there is an additional fee. For \
   more information, see {{:https://requester.mturk.com/pricing}Amazon Mechanical Turk Pricing}.\n\
  \     \n\
  \      "]

module CreateAdditionalAssignmentsForHIT : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_additional_assignments_for_hit_request ->
    ( create_additional_assignments_for_hit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_additional_assignments_for_hit_request ->
    ( create_additional_assignments_for_hit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [CreateAdditionalAssignmentsForHIT] operation increases the maximum number of assignments \
   of an existing HIT. \n\n\
  \  To extend the maximum number of assignments, specify the number of additional assignments.\n\
  \ \n\
  \   {ul\n\
  \         {-  HITs created with fewer than 10 assignments cannot be extended to have 10 or more \
   assignments. Attempting to add assignments in a way that brings the total number of assignments \
   for a HIT from fewer than 10 assignments to 10 or more assignments will result in an \
   [AWS.MechanicalTurk.InvalidMaximumAssignmentsIncrease] exception.\n\
  \             \n\
  \              }\n\
  \         {-  HITs that were created before July 22, 2015 cannot be extended. Attempting to \
   extend HITs that were created before July 22, 2015 will result in an \
   [AWS.MechanicalTurk.HITTooOldForExtension] exception. \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   "]

module AssociateQualificationWithWorker : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_qualification_with_worker_request ->
    ( associate_qualification_with_worker_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_qualification_with_worker_request ->
    ( associate_qualification_with_worker_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [AssociateQualificationWithWorker] operation gives a Worker a Qualification. \
   [AssociateQualificationWithWorker] does not require that the Worker submit a Qualification \
   request. It gives the Qualification directly to the Worker. \n\n\
  \  You can only assign a Qualification of a Qualification type that you created (using the \
   [CreateQualificationType] operation). \n\
  \ \n\
  \    Note: [AssociateQualificationWithWorker] does not affect any pending Qualification requests \
   for the Qualification by the Worker. If you assign a Qualification to a Worker, then later \
   grant a Qualification request made by the Worker, the granting of the request may modify the \
   Qualification score. To resolve a pending Qualification request without affecting the \
   Qualification the Worker already has, reject the request with the [RejectQualificationRequest] \
   operation. \n\
  \   \n\
  \    "]

module ApproveAssignment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    approve_assignment_request ->
    ( approve_assignment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    approve_assignment_request ->
    ( approve_assignment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [ApproveAssignment] operation approves the results of a completed assignment. \n\n\
  \  Approving an assignment initiates two payments from the Requester's Amazon.com account \n\
  \ \n\
  \  {ul\n\
  \        {-   The Worker who submitted the results is paid the reward specified in the HIT. \n\
  \            \n\
  \             }\n\
  \        {-   Amazon Mechanical Turk fees are debited. \n\
  \            \n\
  \             }\n\
  \        }\n\
  \    If the Requester's account does not have adequate funds for these payments, the call to \
   ApproveAssignment returns an exception, and the approval is not processed. You can include an \
   optional feedback message with the approval, which the Worker can see in the Status section of \
   the web site. \n\
  \   \n\
  \     You can also call this operation for assignments that were previous rejected and approve \
   them by explicitly overriding the previous rejection. This only works on rejected assignments \
   that were submitted within the previous 30 days and only if the assignment's related HIT has \
   not been deleted. \n\
  \    "]

(** {1:Serialization and Deserialization} *)
module AcceptQualificationRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestError of request_error
    | `ServiceFault of service_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_qualification_request_request ->
    ( accept_qualification_request_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_qualification_request_request ->
    ( accept_qualification_request_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestError of request_error
      | `ServiceFault of service_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [AcceptQualificationRequest] operation approves a Worker's request for a Qualification. \n\n\
  \  Only the owner of the Qualification type can grant a Qualification request for that type. \n\
  \ \n\
  \   A successful request for the [AcceptQualificationRequest] operation returns with no errors \
   and an empty body. \n\
  \  "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
