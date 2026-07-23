open Smaws_Lib.Json.SerializeHelpers
open Types

let turk_error_code_to_yojson = string_to_yojson
let exception_message_to_yojson = string_to_yojson

let service_fault_to_yojson (x : service_fault) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("TurkErrorCode", option_to_yojson turk_error_code_to_yojson x.turk_error_code);
    ]

let request_error_to_yojson (x : request_error) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("TurkErrorCode", option_to_yojson turk_error_code_to_yojson x.turk_error_code);
    ]

let accept_qualification_request_response_to_yojson = unit_to_yojson
let integer_to_yojson = int_to_yojson
let string__to_yojson = string_to_yojson

let accept_qualification_request_request_to_yojson (x : accept_qualification_request_request) =
  assoc_to_yojson
    [
      ("QualificationRequestId", Some (string__to_yojson x.qualification_request_id));
      ("IntegerValue", option_to_yojson integer_to_yojson x.integer_value);
    ]

let approve_assignment_response_to_yojson = unit_to_yojson
let boolean__to_yojson = bool_to_yojson
let entity_id_to_yojson = string_to_yojson

let approve_assignment_request_to_yojson (x : approve_assignment_request) =
  assoc_to_yojson
    [
      ("AssignmentId", Some (entity_id_to_yojson x.assignment_id));
      ("RequesterFeedback", option_to_yojson string__to_yojson x.requester_feedback);
      ("OverrideRejection", option_to_yojson boolean__to_yojson x.override_rejection);
    ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let assignment_status_to_yojson (x : assignment_status) =
  match x with
  | Submitted -> `String "Submitted"
  | Approved -> `String "Approved"
  | Rejected -> `String "Rejected"

let customer_id_to_yojson = string_to_yojson

let assignment_to_yojson (x : assignment) =
  assoc_to_yojson
    [
      ("AssignmentId", option_to_yojson entity_id_to_yojson x.assignment_id);
      ("WorkerId", option_to_yojson customer_id_to_yojson x.worker_id);
      ("HITId", option_to_yojson entity_id_to_yojson x.hit_id);
      ("AssignmentStatus", option_to_yojson assignment_status_to_yojson x.assignment_status);
      ("AutoApprovalTime", option_to_yojson timestamp_to_yojson x.auto_approval_time);
      ("AcceptTime", option_to_yojson timestamp_to_yojson x.accept_time);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("ApprovalTime", option_to_yojson timestamp_to_yojson x.approval_time);
      ("RejectionTime", option_to_yojson timestamp_to_yojson x.rejection_time);
      ("Deadline", option_to_yojson timestamp_to_yojson x.deadline);
      ("Answer", option_to_yojson string__to_yojson x.answer);
      ("RequesterFeedback", option_to_yojson string__to_yojson x.requester_feedback);
    ]

let assignment_list_to_yojson tree = list_to_yojson assignment_to_yojson tree
let assignment_status_list_to_yojson tree = list_to_yojson assignment_status_to_yojson tree
let associate_qualification_with_worker_response_to_yojson = unit_to_yojson

let associate_qualification_with_worker_request_to_yojson
    (x : associate_qualification_with_worker_request) =
  assoc_to_yojson
    [
      ("QualificationTypeId", Some (entity_id_to_yojson x.qualification_type_id));
      ("WorkerId", Some (customer_id_to_yojson x.worker_id));
      ("IntegerValue", option_to_yojson integer_to_yojson x.integer_value);
      ("SendNotification", option_to_yojson boolean__to_yojson x.send_notification);
    ]

let currency_amount_to_yojson = string_to_yojson

let bonus_payment_to_yojson (x : bonus_payment) =
  assoc_to_yojson
    [
      ("WorkerId", option_to_yojson customer_id_to_yojson x.worker_id);
      ("BonusAmount", option_to_yojson currency_amount_to_yojson x.bonus_amount);
      ("AssignmentId", option_to_yojson entity_id_to_yojson x.assignment_id);
      ("Reason", option_to_yojson string__to_yojson x.reason);
      ("GrantTime", option_to_yojson timestamp_to_yojson x.grant_time);
    ]

let bonus_payment_list_to_yojson tree = list_to_yojson bonus_payment_to_yojson tree

let comparator_to_yojson (x : comparator) =
  match x with
  | LessThan -> `String "LessThan"
  | LessThanOrEqualTo -> `String "LessThanOrEqualTo"
  | GreaterThan -> `String "GreaterThan"
  | GreaterThanOrEqualTo -> `String "GreaterThanOrEqualTo"
  | EqualTo -> `String "EqualTo"
  | NotEqualTo -> `String "NotEqualTo"
  | Exists -> `String "Exists"
  | DoesNotExist -> `String "DoesNotExist"
  | In -> `String "In"
  | NotIn -> `String "NotIn"

let country_parameters_to_yojson = string_to_yojson
let create_additional_assignments_for_hit_response_to_yojson = unit_to_yojson
let idempotency_token_to_yojson = string_to_yojson

let create_additional_assignments_for_hit_request_to_yojson
    (x : create_additional_assignments_for_hit_request) =
  assoc_to_yojson
    [
      ("HITId", Some (entity_id_to_yojson x.hit_id));
      ("NumberOfAdditionalAssignments", Some (integer_to_yojson x.number_of_additional_assignments));
      ("UniqueRequestToken", option_to_yojson idempotency_token_to_yojson x.unique_request_token);
    ]

let hit_review_status_to_yojson (x : hit_review_status) =
  match x with
  | NotReviewed -> `String "NotReviewed"
  | MarkedForReview -> `String "MarkedForReview"
  | ReviewedAppropriate -> `String "ReviewedAppropriate"
  | ReviewedInappropriate -> `String "ReviewedInappropriate"

let hit_access_actions_to_yojson (x : hit_access_actions) =
  match x with
  | Accept -> `String "Accept"
  | PreviewAndAccept -> `String "PreviewAndAccept"
  | DiscoverPreviewAndAccept -> `String "DiscoverPreviewAndAccept"

let locale_to_yojson (x : locale) =
  assoc_to_yojson
    [
      ("Country", Some (country_parameters_to_yojson x.country));
      ("Subdivision", option_to_yojson country_parameters_to_yojson x.subdivision);
    ]

let locale_list_to_yojson tree = list_to_yojson locale_to_yojson tree
let integer_list_to_yojson tree = list_to_yojson integer_to_yojson tree

let qualification_requirement_to_yojson (x : qualification_requirement) =
  assoc_to_yojson
    [
      ("QualificationTypeId", Some (string__to_yojson x.qualification_type_id));
      ("Comparator", Some (comparator_to_yojson x.comparator));
      ("IntegerValues", option_to_yojson integer_list_to_yojson x.integer_values);
      ("LocaleValues", option_to_yojson locale_list_to_yojson x.locale_values);
      ("RequiredToPreview", option_to_yojson boolean__to_yojson x.required_to_preview);
      ("ActionsGuarded", option_to_yojson hit_access_actions_to_yojson x.actions_guarded);
    ]

let qualification_requirement_list_to_yojson tree =
  list_to_yojson qualification_requirement_to_yojson tree

let long_to_yojson = long_to_yojson

let hit_status_to_yojson (x : hit_status) =
  match x with
  | Assignable -> `String "Assignable"
  | Unassignable -> `String "Unassignable"
  | Reviewable -> `String "Reviewable"
  | Reviewing -> `String "Reviewing"
  | Disposed -> `String "Disposed"

let hi_t_to_yojson (x : hi_t) =
  assoc_to_yojson
    [
      ("HITId", option_to_yojson entity_id_to_yojson x.hit_id);
      ("HITTypeId", option_to_yojson entity_id_to_yojson x.hit_type_id);
      ("HITGroupId", option_to_yojson entity_id_to_yojson x.hit_group_id);
      ("HITLayoutId", option_to_yojson entity_id_to_yojson x.hit_layout_id);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Title", option_to_yojson string__to_yojson x.title);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Question", option_to_yojson string__to_yojson x.question);
      ("Keywords", option_to_yojson string__to_yojson x.keywords);
      ("HITStatus", option_to_yojson hit_status_to_yojson x.hit_status);
      ("MaxAssignments", option_to_yojson integer_to_yojson x.max_assignments);
      ("Reward", option_to_yojson currency_amount_to_yojson x.reward);
      ( "AutoApprovalDelayInSeconds",
        option_to_yojson long_to_yojson x.auto_approval_delay_in_seconds );
      ("Expiration", option_to_yojson timestamp_to_yojson x.expiration);
      ( "AssignmentDurationInSeconds",
        option_to_yojson long_to_yojson x.assignment_duration_in_seconds );
      ("RequesterAnnotation", option_to_yojson string__to_yojson x.requester_annotation);
      ( "QualificationRequirements",
        option_to_yojson qualification_requirement_list_to_yojson x.qualification_requirements );
      ("HITReviewStatus", option_to_yojson hit_review_status_to_yojson x.hit_review_status);
      ( "NumberOfAssignmentsPending",
        option_to_yojson integer_to_yojson x.number_of_assignments_pending );
      ( "NumberOfAssignmentsAvailable",
        option_to_yojson integer_to_yojson x.number_of_assignments_available );
      ( "NumberOfAssignmentsCompleted",
        option_to_yojson integer_to_yojson x.number_of_assignments_completed );
    ]

let create_hit_response_to_yojson (x : create_hit_response) =
  assoc_to_yojson [ ("HIT", option_to_yojson hi_t_to_yojson x.hi_t) ]

let hit_layout_parameter_to_yojson (x : hit_layout_parameter) =
  assoc_to_yojson
    [ ("Name", Some (string__to_yojson x.name)); ("Value", Some (string__to_yojson x.value)) ]

let hit_layout_parameter_list_to_yojson tree = list_to_yojson hit_layout_parameter_to_yojson tree
let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let parameter_map_entry_to_yojson (x : parameter_map_entry) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson string__to_yojson x.key);
      ("Values", option_to_yojson string_list_to_yojson x.values);
    ]

let parameter_map_entry_list_to_yojson tree = list_to_yojson parameter_map_entry_to_yojson tree

let policy_parameter_to_yojson (x : policy_parameter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson string__to_yojson x.key);
      ("Values", option_to_yojson string_list_to_yojson x.values);
      ("MapEntries", option_to_yojson parameter_map_entry_list_to_yojson x.map_entries);
    ]

let policy_parameter_list_to_yojson tree = list_to_yojson policy_parameter_to_yojson tree

let review_policy_to_yojson (x : review_policy) =
  assoc_to_yojson
    [
      ("PolicyName", Some (string__to_yojson x.policy_name));
      ("Parameters", option_to_yojson policy_parameter_list_to_yojson x.parameters);
    ]

let create_hit_request_to_yojson (x : create_hit_request) =
  assoc_to_yojson
    [
      ("MaxAssignments", option_to_yojson integer_to_yojson x.max_assignments);
      ( "AutoApprovalDelayInSeconds",
        option_to_yojson long_to_yojson x.auto_approval_delay_in_seconds );
      ("LifetimeInSeconds", Some (long_to_yojson x.lifetime_in_seconds));
      ("AssignmentDurationInSeconds", Some (long_to_yojson x.assignment_duration_in_seconds));
      ("Reward", Some (currency_amount_to_yojson x.reward));
      ("Title", Some (string__to_yojson x.title));
      ("Keywords", option_to_yojson string__to_yojson x.keywords);
      ("Description", Some (string__to_yojson x.description));
      ("Question", option_to_yojson string__to_yojson x.question);
      ("RequesterAnnotation", option_to_yojson string__to_yojson x.requester_annotation);
      ( "QualificationRequirements",
        option_to_yojson qualification_requirement_list_to_yojson x.qualification_requirements );
      ("UniqueRequestToken", option_to_yojson idempotency_token_to_yojson x.unique_request_token);
      ("AssignmentReviewPolicy", option_to_yojson review_policy_to_yojson x.assignment_review_policy);
      ("HITReviewPolicy", option_to_yojson review_policy_to_yojson x.hit_review_policy);
      ("HITLayoutId", option_to_yojson entity_id_to_yojson x.hit_layout_id);
      ( "HITLayoutParameters",
        option_to_yojson hit_layout_parameter_list_to_yojson x.hit_layout_parameters );
    ]

let create_hit_type_response_to_yojson (x : create_hit_type_response) =
  assoc_to_yojson [ ("HITTypeId", option_to_yojson entity_id_to_yojson x.hit_type_id) ]

let create_hit_type_request_to_yojson (x : create_hit_type_request) =
  assoc_to_yojson
    [
      ( "AutoApprovalDelayInSeconds",
        option_to_yojson long_to_yojson x.auto_approval_delay_in_seconds );
      ("AssignmentDurationInSeconds", Some (long_to_yojson x.assignment_duration_in_seconds));
      ("Reward", Some (currency_amount_to_yojson x.reward));
      ("Title", Some (string__to_yojson x.title));
      ("Keywords", option_to_yojson string__to_yojson x.keywords);
      ("Description", Some (string__to_yojson x.description));
      ( "QualificationRequirements",
        option_to_yojson qualification_requirement_list_to_yojson x.qualification_requirements );
    ]

let create_hit_with_hit_type_response_to_yojson (x : create_hit_with_hit_type_response) =
  assoc_to_yojson [ ("HIT", option_to_yojson hi_t_to_yojson x.hi_t) ]

let create_hit_with_hit_type_request_to_yojson (x : create_hit_with_hit_type_request) =
  assoc_to_yojson
    [
      ("HITTypeId", Some (entity_id_to_yojson x.hit_type_id));
      ("MaxAssignments", option_to_yojson integer_to_yojson x.max_assignments);
      ("LifetimeInSeconds", Some (long_to_yojson x.lifetime_in_seconds));
      ("Question", option_to_yojson string__to_yojson x.question);
      ("RequesterAnnotation", option_to_yojson string__to_yojson x.requester_annotation);
      ("UniqueRequestToken", option_to_yojson idempotency_token_to_yojson x.unique_request_token);
      ("AssignmentReviewPolicy", option_to_yojson review_policy_to_yojson x.assignment_review_policy);
      ("HITReviewPolicy", option_to_yojson review_policy_to_yojson x.hit_review_policy);
      ("HITLayoutId", option_to_yojson entity_id_to_yojson x.hit_layout_id);
      ( "HITLayoutParameters",
        option_to_yojson hit_layout_parameter_list_to_yojson x.hit_layout_parameters );
    ]

let qualification_type_status_to_yojson (x : qualification_type_status) =
  match x with Active -> `String "Active" | Inactive -> `String "Inactive"

let qualification_type_to_yojson (x : qualification_type) =
  assoc_to_yojson
    [
      ("QualificationTypeId", option_to_yojson entity_id_to_yojson x.qualification_type_id);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Keywords", option_to_yojson string__to_yojson x.keywords);
      ( "QualificationTypeStatus",
        option_to_yojson qualification_type_status_to_yojson x.qualification_type_status );
      ("Test", option_to_yojson string__to_yojson x.test);
      ("TestDurationInSeconds", option_to_yojson long_to_yojson x.test_duration_in_seconds);
      ("AnswerKey", option_to_yojson string__to_yojson x.answer_key);
      ("RetryDelayInSeconds", option_to_yojson long_to_yojson x.retry_delay_in_seconds);
      ("IsRequestable", option_to_yojson boolean__to_yojson x.is_requestable);
      ("AutoGranted", option_to_yojson boolean__to_yojson x.auto_granted);
      ("AutoGrantedValue", option_to_yojson integer_to_yojson x.auto_granted_value);
    ]

let create_qualification_type_response_to_yojson (x : create_qualification_type_response) =
  assoc_to_yojson
    [ ("QualificationType", option_to_yojson qualification_type_to_yojson x.qualification_type) ]

let create_qualification_type_request_to_yojson (x : create_qualification_type_request) =
  assoc_to_yojson
    [
      ("Name", Some (string__to_yojson x.name));
      ("Keywords", option_to_yojson string__to_yojson x.keywords);
      ("Description", Some (string__to_yojson x.description));
      ( "QualificationTypeStatus",
        Some (qualification_type_status_to_yojson x.qualification_type_status) );
      ("RetryDelayInSeconds", option_to_yojson long_to_yojson x.retry_delay_in_seconds);
      ("Test", option_to_yojson string__to_yojson x.test);
      ("AnswerKey", option_to_yojson string__to_yojson x.answer_key);
      ("TestDurationInSeconds", option_to_yojson long_to_yojson x.test_duration_in_seconds);
      ("AutoGranted", option_to_yojson boolean__to_yojson x.auto_granted);
      ("AutoGrantedValue", option_to_yojson integer_to_yojson x.auto_granted_value);
    ]

let create_worker_block_response_to_yojson = unit_to_yojson

let create_worker_block_request_to_yojson (x : create_worker_block_request) =
  assoc_to_yojson
    [
      ("WorkerId", Some (customer_id_to_yojson x.worker_id));
      ("Reason", Some (string__to_yojson x.reason));
    ]

let customer_id_list_to_yojson tree = list_to_yojson customer_id_to_yojson tree
let delete_hit_response_to_yojson = unit_to_yojson

let delete_hit_request_to_yojson (x : delete_hit_request) =
  assoc_to_yojson [ ("HITId", Some (entity_id_to_yojson x.hit_id)) ]

let delete_qualification_type_response_to_yojson = unit_to_yojson

let delete_qualification_type_request_to_yojson (x : delete_qualification_type_request) =
  assoc_to_yojson [ ("QualificationTypeId", Some (entity_id_to_yojson x.qualification_type_id)) ]

let delete_worker_block_response_to_yojson = unit_to_yojson

let delete_worker_block_request_to_yojson (x : delete_worker_block_request) =
  assoc_to_yojson
    [
      ("WorkerId", Some (customer_id_to_yojson x.worker_id));
      ("Reason", option_to_yojson string__to_yojson x.reason);
    ]

let disassociate_qualification_from_worker_response_to_yojson = unit_to_yojson

let disassociate_qualification_from_worker_request_to_yojson
    (x : disassociate_qualification_from_worker_request) =
  assoc_to_yojson
    [
      ("WorkerId", Some (customer_id_to_yojson x.worker_id));
      ("QualificationTypeId", Some (entity_id_to_yojson x.qualification_type_id));
      ("Reason", option_to_yojson string__to_yojson x.reason);
    ]

let event_type_to_yojson (x : event_type) =
  match x with
  | AssignmentAccepted -> `String "AssignmentAccepted"
  | AssignmentAbandoned -> `String "AssignmentAbandoned"
  | AssignmentReturned -> `String "AssignmentReturned"
  | AssignmentSubmitted -> `String "AssignmentSubmitted"
  | AssignmentRejected -> `String "AssignmentRejected"
  | AssignmentApproved -> `String "AssignmentApproved"
  | HITCreated -> `String "HITCreated"
  | HITExpired -> `String "HITExpired"
  | HITReviewable -> `String "HITReviewable"
  | HITExtended -> `String "HITExtended"
  | HITDisposed -> `String "HITDisposed"
  | Ping -> `String "Ping"

let event_type_list_to_yojson tree = list_to_yojson event_type_to_yojson tree

let get_account_balance_response_to_yojson (x : get_account_balance_response) =
  assoc_to_yojson
    [
      ("AvailableBalance", option_to_yojson currency_amount_to_yojson x.available_balance);
      ("OnHoldBalance", option_to_yojson currency_amount_to_yojson x.on_hold_balance);
    ]

let get_account_balance_request_to_yojson = unit_to_yojson

let get_assignment_response_to_yojson (x : get_assignment_response) =
  assoc_to_yojson
    [
      ("Assignment", option_to_yojson assignment_to_yojson x.assignment);
      ("HIT", option_to_yojson hi_t_to_yojson x.hi_t);
    ]

let get_assignment_request_to_yojson (x : get_assignment_request) =
  assoc_to_yojson [ ("AssignmentId", Some (entity_id_to_yojson x.assignment_id)) ]

let get_file_upload_url_response_to_yojson (x : get_file_upload_url_response) =
  assoc_to_yojson [ ("FileUploadURL", option_to_yojson string__to_yojson x.file_upload_ur_l) ]

let get_file_upload_url_request_to_yojson (x : get_file_upload_url_request) =
  assoc_to_yojson
    [
      ("AssignmentId", Some (entity_id_to_yojson x.assignment_id));
      ("QuestionIdentifier", Some (string__to_yojson x.question_identifier));
    ]

let get_hit_response_to_yojson (x : get_hit_response) =
  assoc_to_yojson [ ("HIT", option_to_yojson hi_t_to_yojson x.hi_t) ]

let get_hit_request_to_yojson (x : get_hit_request) =
  assoc_to_yojson [ ("HITId", Some (entity_id_to_yojson x.hit_id)) ]

let qualification_status_to_yojson (x : qualification_status) =
  match x with Granted -> `String "Granted" | Revoked -> `String "Revoked"

let qualification_to_yojson (x : qualification) =
  assoc_to_yojson
    [
      ("QualificationTypeId", option_to_yojson entity_id_to_yojson x.qualification_type_id);
      ("WorkerId", option_to_yojson customer_id_to_yojson x.worker_id);
      ("GrantTime", option_to_yojson timestamp_to_yojson x.grant_time);
      ("IntegerValue", option_to_yojson integer_to_yojson x.integer_value);
      ("LocaleValue", option_to_yojson locale_to_yojson x.locale_value);
      ("Status", option_to_yojson qualification_status_to_yojson x.status);
    ]

let get_qualification_score_response_to_yojson (x : get_qualification_score_response) =
  assoc_to_yojson [ ("Qualification", option_to_yojson qualification_to_yojson x.qualification) ]

let get_qualification_score_request_to_yojson (x : get_qualification_score_request) =
  assoc_to_yojson
    [
      ("QualificationTypeId", Some (entity_id_to_yojson x.qualification_type_id));
      ("WorkerId", Some (customer_id_to_yojson x.worker_id));
    ]

let get_qualification_type_response_to_yojson (x : get_qualification_type_response) =
  assoc_to_yojson
    [ ("QualificationType", option_to_yojson qualification_type_to_yojson x.qualification_type) ]

let get_qualification_type_request_to_yojson (x : get_qualification_type_request) =
  assoc_to_yojson [ ("QualificationTypeId", Some (entity_id_to_yojson x.qualification_type_id)) ]

let hit_list_to_yojson tree = list_to_yojson hi_t_to_yojson tree
let pagination_token_to_yojson = string_to_yojson

let list_assignments_for_hit_response_to_yojson (x : list_assignments_for_hit_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("NumResults", option_to_yojson integer_to_yojson x.num_results);
      ("Assignments", option_to_yojson assignment_list_to_yojson x.assignments);
    ]

let result_size_to_yojson = int_to_yojson

let list_assignments_for_hit_request_to_yojson (x : list_assignments_for_hit_request) =
  assoc_to_yojson
    [
      ("HITId", Some (entity_id_to_yojson x.hit_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
      ("AssignmentStatuses", option_to_yojson assignment_status_list_to_yojson x.assignment_statuses);
    ]

let list_bonus_payments_response_to_yojson (x : list_bonus_payments_response) =
  assoc_to_yojson
    [
      ("NumResults", option_to_yojson integer_to_yojson x.num_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("BonusPayments", option_to_yojson bonus_payment_list_to_yojson x.bonus_payments);
    ]

let list_bonus_payments_request_to_yojson (x : list_bonus_payments_request) =
  assoc_to_yojson
    [
      ("HITId", option_to_yojson entity_id_to_yojson x.hit_id);
      ("AssignmentId", option_to_yojson entity_id_to_yojson x.assignment_id);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
    ]

let list_hi_ts_response_to_yojson (x : list_hi_ts_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("NumResults", option_to_yojson integer_to_yojson x.num_results);
      ("HITs", option_to_yojson hit_list_to_yojson x.hi_ts);
    ]

let list_hi_ts_request_to_yojson (x : list_hi_ts_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
    ]

let list_hi_ts_for_qualification_type_response_to_yojson
    (x : list_hi_ts_for_qualification_type_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("NumResults", option_to_yojson integer_to_yojson x.num_results);
      ("HITs", option_to_yojson hit_list_to_yojson x.hi_ts);
    ]

let list_hi_ts_for_qualification_type_request_to_yojson
    (x : list_hi_ts_for_qualification_type_request) =
  assoc_to_yojson
    [
      ("QualificationTypeId", Some (entity_id_to_yojson x.qualification_type_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
    ]

let qualification_request_to_yojson (x : qualification_request) =
  assoc_to_yojson
    [
      ("QualificationRequestId", option_to_yojson string__to_yojson x.qualification_request_id);
      ("QualificationTypeId", option_to_yojson entity_id_to_yojson x.qualification_type_id);
      ("WorkerId", option_to_yojson customer_id_to_yojson x.worker_id);
      ("Test", option_to_yojson string__to_yojson x.test);
      ("Answer", option_to_yojson string__to_yojson x.answer);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
    ]

let qualification_request_list_to_yojson tree = list_to_yojson qualification_request_to_yojson tree

let list_qualification_requests_response_to_yojson (x : list_qualification_requests_response) =
  assoc_to_yojson
    [
      ("NumResults", option_to_yojson integer_to_yojson x.num_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "QualificationRequests",
        option_to_yojson qualification_request_list_to_yojson x.qualification_requests );
    ]

let list_qualification_requests_request_to_yojson (x : list_qualification_requests_request) =
  assoc_to_yojson
    [
      ("QualificationTypeId", option_to_yojson entity_id_to_yojson x.qualification_type_id);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
    ]

let qualification_type_list_to_yojson tree = list_to_yojson qualification_type_to_yojson tree

let list_qualification_types_response_to_yojson (x : list_qualification_types_response) =
  assoc_to_yojson
    [
      ("NumResults", option_to_yojson integer_to_yojson x.num_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "QualificationTypes",
        option_to_yojson qualification_type_list_to_yojson x.qualification_types );
    ]

let list_qualification_types_request_to_yojson (x : list_qualification_types_request) =
  assoc_to_yojson
    [
      ("Query", option_to_yojson string__to_yojson x.query);
      ("MustBeRequestable", Some (boolean__to_yojson x.must_be_requestable));
      ("MustBeOwnedByCaller", option_to_yojson boolean__to_yojson x.must_be_owned_by_caller);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
    ]

let review_action_status_to_yojson (x : review_action_status) =
  match x with
  | Intended -> `String "Intended"
  | Succeeded -> `String "Succeeded"
  | Failed -> `String "Failed"
  | Cancelled -> `String "Cancelled"

let review_action_detail_to_yojson (x : review_action_detail) =
  assoc_to_yojson
    [
      ("ActionId", option_to_yojson entity_id_to_yojson x.action_id);
      ("ActionName", option_to_yojson string__to_yojson x.action_name);
      ("TargetId", option_to_yojson entity_id_to_yojson x.target_id);
      ("TargetType", option_to_yojson string__to_yojson x.target_type);
      ("Status", option_to_yojson review_action_status_to_yojson x.status);
      ("CompleteTime", option_to_yojson timestamp_to_yojson x.complete_time);
      ("Result", option_to_yojson string__to_yojson x.result_);
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
    ]

let review_action_detail_list_to_yojson tree = list_to_yojson review_action_detail_to_yojson tree

let review_result_detail_to_yojson (x : review_result_detail) =
  assoc_to_yojson
    [
      ("ActionId", option_to_yojson entity_id_to_yojson x.action_id);
      ("SubjectId", option_to_yojson entity_id_to_yojson x.subject_id);
      ("SubjectType", option_to_yojson string__to_yojson x.subject_type);
      ("QuestionId", option_to_yojson entity_id_to_yojson x.question_id);
      ("Key", option_to_yojson string__to_yojson x.key);
      ("Value", option_to_yojson string__to_yojson x.value);
    ]

let review_result_detail_list_to_yojson tree = list_to_yojson review_result_detail_to_yojson tree

let review_report_to_yojson (x : review_report) =
  assoc_to_yojson
    [
      ("ReviewResults", option_to_yojson review_result_detail_list_to_yojson x.review_results);
      ("ReviewActions", option_to_yojson review_action_detail_list_to_yojson x.review_actions);
    ]

let list_review_policy_results_for_hit_response_to_yojson
    (x : list_review_policy_results_for_hit_response) =
  assoc_to_yojson
    [
      ("HITId", option_to_yojson entity_id_to_yojson x.hit_id);
      ("AssignmentReviewPolicy", option_to_yojson review_policy_to_yojson x.assignment_review_policy);
      ("HITReviewPolicy", option_to_yojson review_policy_to_yojson x.hit_review_policy);
      ("AssignmentReviewReport", option_to_yojson review_report_to_yojson x.assignment_review_report);
      ("HITReviewReport", option_to_yojson review_report_to_yojson x.hit_review_report);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let review_policy_level_to_yojson (x : review_policy_level) =
  match x with Assignment -> `String "Assignment" | HIT -> `String "HIT"

let review_policy_level_list_to_yojson tree = list_to_yojson review_policy_level_to_yojson tree

let list_review_policy_results_for_hit_request_to_yojson
    (x : list_review_policy_results_for_hit_request) =
  assoc_to_yojson
    [
      ("HITId", Some (entity_id_to_yojson x.hit_id));
      ("PolicyLevels", option_to_yojson review_policy_level_list_to_yojson x.policy_levels);
      ("RetrieveActions", option_to_yojson boolean__to_yojson x.retrieve_actions);
      ("RetrieveResults", option_to_yojson boolean__to_yojson x.retrieve_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
    ]

let list_reviewable_hi_ts_response_to_yojson (x : list_reviewable_hi_ts_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("NumResults", option_to_yojson integer_to_yojson x.num_results);
      ("HITs", option_to_yojson hit_list_to_yojson x.hi_ts);
    ]

let reviewable_hit_status_to_yojson (x : reviewable_hit_status) =
  match x with Reviewable -> `String "Reviewable" | Reviewing -> `String "Reviewing"

let list_reviewable_hi_ts_request_to_yojson (x : list_reviewable_hi_ts_request) =
  assoc_to_yojson
    [
      ("HITTypeId", option_to_yojson entity_id_to_yojson x.hit_type_id);
      ("Status", option_to_yojson reviewable_hit_status_to_yojson x.status);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
    ]

let worker_block_to_yojson (x : worker_block) =
  assoc_to_yojson
    [
      ("WorkerId", option_to_yojson customer_id_to_yojson x.worker_id);
      ("Reason", option_to_yojson string__to_yojson x.reason);
    ]

let worker_block_list_to_yojson tree = list_to_yojson worker_block_to_yojson tree

let list_worker_blocks_response_to_yojson (x : list_worker_blocks_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("NumResults", option_to_yojson integer_to_yojson x.num_results);
      ("WorkerBlocks", option_to_yojson worker_block_list_to_yojson x.worker_blocks);
    ]

let list_worker_blocks_request_to_yojson (x : list_worker_blocks_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
    ]

let qualification_list_to_yojson tree = list_to_yojson qualification_to_yojson tree

let list_workers_with_qualification_type_response_to_yojson
    (x : list_workers_with_qualification_type_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("NumResults", option_to_yojson integer_to_yojson x.num_results);
      ("Qualifications", option_to_yojson qualification_list_to_yojson x.qualifications);
    ]

let list_workers_with_qualification_type_request_to_yojson
    (x : list_workers_with_qualification_type_request) =
  assoc_to_yojson
    [
      ("QualificationTypeId", Some (entity_id_to_yojson x.qualification_type_id));
      ("Status", option_to_yojson qualification_status_to_yojson x.status);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
    ]

let update_qualification_type_response_to_yojson (x : update_qualification_type_response) =
  assoc_to_yojson
    [ ("QualificationType", option_to_yojson qualification_type_to_yojson x.qualification_type) ]

let update_qualification_type_request_to_yojson (x : update_qualification_type_request) =
  assoc_to_yojson
    [
      ("QualificationTypeId", Some (entity_id_to_yojson x.qualification_type_id));
      ("Description", option_to_yojson string__to_yojson x.description);
      ( "QualificationTypeStatus",
        option_to_yojson qualification_type_status_to_yojson x.qualification_type_status );
      ("Test", option_to_yojson string__to_yojson x.test);
      ("AnswerKey", option_to_yojson string__to_yojson x.answer_key);
      ("TestDurationInSeconds", option_to_yojson long_to_yojson x.test_duration_in_seconds);
      ("RetryDelayInSeconds", option_to_yojson long_to_yojson x.retry_delay_in_seconds);
      ("AutoGranted", option_to_yojson boolean__to_yojson x.auto_granted);
      ("AutoGrantedValue", option_to_yojson integer_to_yojson x.auto_granted_value);
    ]

let update_notification_settings_response_to_yojson = unit_to_yojson

let notification_transport_to_yojson (x : notification_transport) =
  match x with Email -> `String "Email" | SQS -> `String "SQS" | SNS -> `String "SNS"

let notification_specification_to_yojson (x : notification_specification) =
  assoc_to_yojson
    [
      ("Destination", Some (string__to_yojson x.destination));
      ("Transport", Some (notification_transport_to_yojson x.transport));
      ("Version", Some (string__to_yojson x.version));
      ("EventTypes", Some (event_type_list_to_yojson x.event_types));
    ]

let update_notification_settings_request_to_yojson (x : update_notification_settings_request) =
  assoc_to_yojson
    [
      ("HITTypeId", Some (entity_id_to_yojson x.hit_type_id));
      ("Notification", option_to_yojson notification_specification_to_yojson x.notification);
      ("Active", option_to_yojson boolean__to_yojson x.active);
    ]

let update_hit_type_of_hit_response_to_yojson = unit_to_yojson

let update_hit_type_of_hit_request_to_yojson (x : update_hit_type_of_hit_request) =
  assoc_to_yojson
    [
      ("HITId", Some (entity_id_to_yojson x.hit_id));
      ("HITTypeId", Some (entity_id_to_yojson x.hit_type_id));
    ]

let update_hit_review_status_response_to_yojson = unit_to_yojson

let update_hit_review_status_request_to_yojson (x : update_hit_review_status_request) =
  assoc_to_yojson
    [
      ("HITId", Some (entity_id_to_yojson x.hit_id));
      ("Revert", option_to_yojson boolean__to_yojson x.revert);
    ]

let update_expiration_for_hit_response_to_yojson = unit_to_yojson

let update_expiration_for_hit_request_to_yojson (x : update_expiration_for_hit_request) =
  assoc_to_yojson
    [
      ("HITId", Some (entity_id_to_yojson x.hit_id));
      ("ExpireAt", Some (timestamp_to_yojson x.expire_at));
    ]

let send_test_event_notification_response_to_yojson = unit_to_yojson

let send_test_event_notification_request_to_yojson (x : send_test_event_notification_request) =
  assoc_to_yojson
    [
      ("Notification", Some (notification_specification_to_yojson x.notification));
      ("TestEventType", Some (event_type_to_yojson x.test_event_type));
    ]

let send_bonus_response_to_yojson = unit_to_yojson

let send_bonus_request_to_yojson (x : send_bonus_request) =
  assoc_to_yojson
    [
      ("WorkerId", Some (customer_id_to_yojson x.worker_id));
      ("BonusAmount", Some (currency_amount_to_yojson x.bonus_amount));
      ("AssignmentId", Some (entity_id_to_yojson x.assignment_id));
      ("Reason", Some (string__to_yojson x.reason));
      ("UniqueRequestToken", option_to_yojson idempotency_token_to_yojson x.unique_request_token);
    ]

let reject_qualification_request_response_to_yojson = unit_to_yojson

let reject_qualification_request_request_to_yojson (x : reject_qualification_request_request) =
  assoc_to_yojson
    [
      ("QualificationRequestId", Some (string__to_yojson x.qualification_request_id));
      ("Reason", option_to_yojson string__to_yojson x.reason);
    ]

let reject_assignment_response_to_yojson = unit_to_yojson

let reject_assignment_request_to_yojson (x : reject_assignment_request) =
  assoc_to_yojson
    [
      ("AssignmentId", Some (entity_id_to_yojson x.assignment_id));
      ("RequesterFeedback", Some (string__to_yojson x.requester_feedback));
    ]

let notify_workers_failure_code_to_yojson (x : notify_workers_failure_code) =
  match x with SoftFailure -> `String "SoftFailure" | HardFailure -> `String "HardFailure"

let notify_workers_failure_status_to_yojson (x : notify_workers_failure_status) =
  assoc_to_yojson
    [
      ( "NotifyWorkersFailureCode",
        option_to_yojson notify_workers_failure_code_to_yojson x.notify_workers_failure_code );
      ( "NotifyWorkersFailureMessage",
        option_to_yojson string__to_yojson x.notify_workers_failure_message );
      ("WorkerId", option_to_yojson customer_id_to_yojson x.worker_id);
    ]

let notify_workers_failure_status_list_to_yojson tree =
  list_to_yojson notify_workers_failure_status_to_yojson tree

let notify_workers_response_to_yojson (x : notify_workers_response) =
  assoc_to_yojson
    [
      ( "NotifyWorkersFailureStatuses",
        option_to_yojson notify_workers_failure_status_list_to_yojson
          x.notify_workers_failure_statuses );
    ]

let notify_workers_request_to_yojson (x : notify_workers_request) =
  assoc_to_yojson
    [
      ("Subject", Some (string__to_yojson x.subject));
      ("MessageText", Some (string__to_yojson x.message_text));
      ("WorkerIds", Some (customer_id_list_to_yojson x.worker_ids));
    ]
