open Smaws_Lib.Json.SerializeHelpers
open Types

let customer_id_to_yojson = string_to_yojson
let string__to_yojson = string_to_yojson

let worker_block_to_yojson (x : worker_block) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson string__to_yojson x.reason);
      ("WorkerId", option_to_yojson customer_id_to_yojson x.worker_id);
    ]

let worker_block_list_to_yojson tree = list_to_yojson worker_block_to_yojson tree
let entity_id_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let qualification_type_status_to_yojson (x : qualification_type_status) =
  match x with Inactive -> `String "Inactive" | Active -> `String "Active"

let long_to_yojson = long_to_yojson
let boolean__to_yojson = bool_to_yojson
let integer_to_yojson = int_to_yojson

let qualification_type_to_yojson (x : qualification_type) =
  assoc_to_yojson
    [
      ("AutoGrantedValue", option_to_yojson integer_to_yojson x.auto_granted_value);
      ("AutoGranted", option_to_yojson boolean__to_yojson x.auto_granted);
      ("IsRequestable", option_to_yojson boolean__to_yojson x.is_requestable);
      ("RetryDelayInSeconds", option_to_yojson long_to_yojson x.retry_delay_in_seconds);
      ("AnswerKey", option_to_yojson string__to_yojson x.answer_key);
      ("TestDurationInSeconds", option_to_yojson long_to_yojson x.test_duration_in_seconds);
      ("Test", option_to_yojson string__to_yojson x.test);
      ( "QualificationTypeStatus",
        option_to_yojson qualification_type_status_to_yojson x.qualification_type_status );
      ("Keywords", option_to_yojson string__to_yojson x.keywords);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("QualificationTypeId", option_to_yojson entity_id_to_yojson x.qualification_type_id);
    ]

let update_qualification_type_response_to_yojson (x : update_qualification_type_response) =
  assoc_to_yojson
    [ ("QualificationType", option_to_yojson qualification_type_to_yojson x.qualification_type) ]

let update_qualification_type_request_to_yojson (x : update_qualification_type_request) =
  assoc_to_yojson
    [
      ("AutoGrantedValue", option_to_yojson integer_to_yojson x.auto_granted_value);
      ("AutoGranted", option_to_yojson boolean__to_yojson x.auto_granted);
      ("RetryDelayInSeconds", option_to_yojson long_to_yojson x.retry_delay_in_seconds);
      ("TestDurationInSeconds", option_to_yojson long_to_yojson x.test_duration_in_seconds);
      ("AnswerKey", option_to_yojson string__to_yojson x.answer_key);
      ("Test", option_to_yojson string__to_yojson x.test);
      ( "QualificationTypeStatus",
        option_to_yojson qualification_type_status_to_yojson x.qualification_type_status );
      ("Description", option_to_yojson string__to_yojson x.description);
      ("QualificationTypeId", Some (entity_id_to_yojson x.qualification_type_id));
    ]

let exception_message_to_yojson = string_to_yojson
let turk_error_code_to_yojson = string_to_yojson

let service_fault_to_yojson (x : service_fault) =
  assoc_to_yojson
    [
      ("TurkErrorCode", option_to_yojson turk_error_code_to_yojson x.turk_error_code);
      ("Message", option_to_yojson exception_message_to_yojson x.message);
    ]

let request_error_to_yojson (x : request_error) =
  assoc_to_yojson
    [
      ("TurkErrorCode", option_to_yojson turk_error_code_to_yojson x.turk_error_code);
      ("Message", option_to_yojson exception_message_to_yojson x.message);
    ]

let update_notification_settings_response_to_yojson = unit_to_yojson

let notification_transport_to_yojson (x : notification_transport) =
  match x with SNS -> `String "SNS" | SQS -> `String "SQS" | Email -> `String "Email"

let event_type_to_yojson (x : event_type) =
  match x with
  | Ping -> `String "Ping"
  | HITDisposed -> `String "HITDisposed"
  | HITExtended -> `String "HITExtended"
  | HITReviewable -> `String "HITReviewable"
  | HITExpired -> `String "HITExpired"
  | HITCreated -> `String "HITCreated"
  | AssignmentApproved -> `String "AssignmentApproved"
  | AssignmentRejected -> `String "AssignmentRejected"
  | AssignmentSubmitted -> `String "AssignmentSubmitted"
  | AssignmentReturned -> `String "AssignmentReturned"
  | AssignmentAbandoned -> `String "AssignmentAbandoned"
  | AssignmentAccepted -> `String "AssignmentAccepted"

let event_type_list_to_yojson tree = list_to_yojson event_type_to_yojson tree

let notification_specification_to_yojson (x : notification_specification) =
  assoc_to_yojson
    [
      ("EventTypes", Some (event_type_list_to_yojson x.event_types));
      ("Version", Some (string__to_yojson x.version));
      ("Transport", Some (notification_transport_to_yojson x.transport));
      ("Destination", Some (string__to_yojson x.destination));
    ]

let update_notification_settings_request_to_yojson (x : update_notification_settings_request) =
  assoc_to_yojson
    [
      ("Active", option_to_yojson boolean__to_yojson x.active);
      ("Notification", option_to_yojson notification_specification_to_yojson x.notification);
      ("HITTypeId", Some (entity_id_to_yojson x.hit_type_id));
    ]

let update_hit_type_of_hit_response_to_yojson = unit_to_yojson

let update_hit_type_of_hit_request_to_yojson (x : update_hit_type_of_hit_request) =
  assoc_to_yojson
    [
      ("HITTypeId", Some (entity_id_to_yojson x.hit_type_id));
      ("HITId", Some (entity_id_to_yojson x.hit_id));
    ]

let update_hit_review_status_response_to_yojson = unit_to_yojson

let update_hit_review_status_request_to_yojson (x : update_hit_review_status_request) =
  assoc_to_yojson
    [
      ("Revert", option_to_yojson boolean__to_yojson x.revert);
      ("HITId", Some (entity_id_to_yojson x.hit_id));
    ]

let update_expiration_for_hit_response_to_yojson = unit_to_yojson

let update_expiration_for_hit_request_to_yojson (x : update_expiration_for_hit_request) =
  assoc_to_yojson
    [
      ("ExpireAt", Some (timestamp_to_yojson x.expire_at));
      ("HITId", Some (entity_id_to_yojson x.hit_id));
    ]

let string_list_to_yojson tree = list_to_yojson string__to_yojson tree
let send_test_event_notification_response_to_yojson = unit_to_yojson

let send_test_event_notification_request_to_yojson (x : send_test_event_notification_request) =
  assoc_to_yojson
    [
      ("TestEventType", Some (event_type_to_yojson x.test_event_type));
      ("Notification", Some (notification_specification_to_yojson x.notification));
    ]

let send_bonus_response_to_yojson = unit_to_yojson
let currency_amount_to_yojson = string_to_yojson
let idempotency_token_to_yojson = string_to_yojson

let send_bonus_request_to_yojson (x : send_bonus_request) =
  assoc_to_yojson
    [
      ("UniqueRequestToken", option_to_yojson idempotency_token_to_yojson x.unique_request_token);
      ("Reason", Some (string__to_yojson x.reason));
      ("AssignmentId", Some (entity_id_to_yojson x.assignment_id));
      ("BonusAmount", Some (currency_amount_to_yojson x.bonus_amount));
      ("WorkerId", Some (customer_id_to_yojson x.worker_id));
    ]

let reviewable_hit_status_to_yojson (x : reviewable_hit_status) =
  match x with Reviewing -> `String "Reviewing" | Reviewable -> `String "Reviewable"

let review_result_detail_to_yojson (x : review_result_detail) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson string__to_yojson x.value);
      ("Key", option_to_yojson string__to_yojson x.key);
      ("QuestionId", option_to_yojson entity_id_to_yojson x.question_id);
      ("SubjectType", option_to_yojson string__to_yojson x.subject_type);
      ("SubjectId", option_to_yojson entity_id_to_yojson x.subject_id);
      ("ActionId", option_to_yojson entity_id_to_yojson x.action_id);
    ]

let review_result_detail_list_to_yojson tree = list_to_yojson review_result_detail_to_yojson tree

let review_action_status_to_yojson (x : review_action_status) =
  match x with
  | Cancelled -> `String "Cancelled"
  | Failed -> `String "Failed"
  | Succeeded -> `String "Succeeded"
  | Intended -> `String "Intended"

let review_action_detail_to_yojson (x : review_action_detail) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
      ("Result", option_to_yojson string__to_yojson x.result_);
      ("CompleteTime", option_to_yojson timestamp_to_yojson x.complete_time);
      ("Status", option_to_yojson review_action_status_to_yojson x.status);
      ("TargetType", option_to_yojson string__to_yojson x.target_type);
      ("TargetId", option_to_yojson entity_id_to_yojson x.target_id);
      ("ActionName", option_to_yojson string__to_yojson x.action_name);
      ("ActionId", option_to_yojson entity_id_to_yojson x.action_id);
    ]

let review_action_detail_list_to_yojson tree = list_to_yojson review_action_detail_to_yojson tree

let review_report_to_yojson (x : review_report) =
  assoc_to_yojson
    [
      ("ReviewActions", option_to_yojson review_action_detail_list_to_yojson x.review_actions);
      ("ReviewResults", option_to_yojson review_result_detail_list_to_yojson x.review_results);
    ]

let review_policy_level_to_yojson (x : review_policy_level) =
  match x with HIT -> `String "HIT" | Assignment -> `String "Assignment"

let review_policy_level_list_to_yojson tree = list_to_yojson review_policy_level_to_yojson tree

let parameter_map_entry_to_yojson (x : parameter_map_entry) =
  assoc_to_yojson
    [
      ("Values", option_to_yojson string_list_to_yojson x.values);
      ("Key", option_to_yojson string__to_yojson x.key);
    ]

let parameter_map_entry_list_to_yojson tree = list_to_yojson parameter_map_entry_to_yojson tree

let policy_parameter_to_yojson (x : policy_parameter) =
  assoc_to_yojson
    [
      ("MapEntries", option_to_yojson parameter_map_entry_list_to_yojson x.map_entries);
      ("Values", option_to_yojson string_list_to_yojson x.values);
      ("Key", option_to_yojson string__to_yojson x.key);
    ]

let policy_parameter_list_to_yojson tree = list_to_yojson policy_parameter_to_yojson tree

let review_policy_to_yojson (x : review_policy) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson policy_parameter_list_to_yojson x.parameters);
      ("PolicyName", Some (string__to_yojson x.policy_name));
    ]

let result_size_to_yojson = int_to_yojson
let reject_qualification_request_response_to_yojson = unit_to_yojson

let reject_qualification_request_request_to_yojson (x : reject_qualification_request_request) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson string__to_yojson x.reason);
      ("QualificationRequestId", Some (string__to_yojson x.qualification_request_id));
    ]

let reject_assignment_response_to_yojson = unit_to_yojson

let reject_assignment_request_to_yojson (x : reject_assignment_request) =
  assoc_to_yojson
    [
      ("RequesterFeedback", Some (string__to_yojson x.requester_feedback));
      ("AssignmentId", Some (entity_id_to_yojson x.assignment_id));
    ]

let qualification_type_list_to_yojson tree = list_to_yojson qualification_type_to_yojson tree

let qualification_status_to_yojson (x : qualification_status) =
  match x with Revoked -> `String "Revoked" | Granted -> `String "Granted"

let comparator_to_yojson (x : comparator) =
  match x with
  | NotIn -> `String "NotIn"
  | In -> `String "In"
  | DoesNotExist -> `String "DoesNotExist"
  | Exists -> `String "Exists"
  | NotEqualTo -> `String "NotEqualTo"
  | EqualTo -> `String "EqualTo"
  | GreaterThanOrEqualTo -> `String "GreaterThanOrEqualTo"
  | GreaterThan -> `String "GreaterThan"
  | LessThanOrEqualTo -> `String "LessThanOrEqualTo"
  | LessThan -> `String "LessThan"

let integer_list_to_yojson tree = list_to_yojson integer_to_yojson tree
let country_parameters_to_yojson = string_to_yojson

let locale_to_yojson (x : locale) =
  assoc_to_yojson
    [
      ("Subdivision", option_to_yojson country_parameters_to_yojson x.subdivision);
      ("Country", Some (country_parameters_to_yojson x.country));
    ]

let locale_list_to_yojson tree = list_to_yojson locale_to_yojson tree

let hit_access_actions_to_yojson (x : hit_access_actions) =
  match x with
  | DiscoverPreviewAndAccept -> `String "DiscoverPreviewAndAccept"
  | PreviewAndAccept -> `String "PreviewAndAccept"
  | Accept -> `String "Accept"

let qualification_requirement_to_yojson (x : qualification_requirement) =
  assoc_to_yojson
    [
      ("ActionsGuarded", option_to_yojson hit_access_actions_to_yojson x.actions_guarded);
      ("RequiredToPreview", option_to_yojson boolean__to_yojson x.required_to_preview);
      ("LocaleValues", option_to_yojson locale_list_to_yojson x.locale_values);
      ("IntegerValues", option_to_yojson integer_list_to_yojson x.integer_values);
      ("Comparator", Some (comparator_to_yojson x.comparator));
      ("QualificationTypeId", Some (string__to_yojson x.qualification_type_id));
    ]

let qualification_requirement_list_to_yojson tree =
  list_to_yojson qualification_requirement_to_yojson tree

let qualification_request_to_yojson (x : qualification_request) =
  assoc_to_yojson
    [
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("Answer", option_to_yojson string__to_yojson x.answer);
      ("Test", option_to_yojson string__to_yojson x.test);
      ("WorkerId", option_to_yojson customer_id_to_yojson x.worker_id);
      ("QualificationTypeId", option_to_yojson entity_id_to_yojson x.qualification_type_id);
      ("QualificationRequestId", option_to_yojson string__to_yojson x.qualification_request_id);
    ]

let qualification_request_list_to_yojson tree = list_to_yojson qualification_request_to_yojson tree

let qualification_to_yojson (x : qualification) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson qualification_status_to_yojson x.status);
      ("LocaleValue", option_to_yojson locale_to_yojson x.locale_value);
      ("IntegerValue", option_to_yojson integer_to_yojson x.integer_value);
      ("GrantTime", option_to_yojson timestamp_to_yojson x.grant_time);
      ("WorkerId", option_to_yojson customer_id_to_yojson x.worker_id);
      ("QualificationTypeId", option_to_yojson entity_id_to_yojson x.qualification_type_id);
    ]

let qualification_list_to_yojson tree = list_to_yojson qualification_to_yojson tree
let pagination_token_to_yojson = string_to_yojson

let notify_workers_failure_code_to_yojson (x : notify_workers_failure_code) =
  match x with HardFailure -> `String "HardFailure" | SoftFailure -> `String "SoftFailure"

let notify_workers_failure_status_to_yojson (x : notify_workers_failure_status) =
  assoc_to_yojson
    [
      ("WorkerId", option_to_yojson customer_id_to_yojson x.worker_id);
      ( "NotifyWorkersFailureMessage",
        option_to_yojson string__to_yojson x.notify_workers_failure_message );
      ( "NotifyWorkersFailureCode",
        option_to_yojson notify_workers_failure_code_to_yojson x.notify_workers_failure_code );
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

let customer_id_list_to_yojson tree = list_to_yojson customer_id_to_yojson tree

let notify_workers_request_to_yojson (x : notify_workers_request) =
  assoc_to_yojson
    [
      ("WorkerIds", Some (customer_id_list_to_yojson x.worker_ids));
      ("MessageText", Some (string__to_yojson x.message_text));
      ("Subject", Some (string__to_yojson x.subject));
    ]

let list_workers_with_qualification_type_response_to_yojson
    (x : list_workers_with_qualification_type_response) =
  assoc_to_yojson
    [
      ("Qualifications", option_to_yojson qualification_list_to_yojson x.qualifications);
      ("NumResults", option_to_yojson integer_to_yojson x.num_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_workers_with_qualification_type_request_to_yojson
    (x : list_workers_with_qualification_type_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Status", option_to_yojson qualification_status_to_yojson x.status);
      ("QualificationTypeId", Some (entity_id_to_yojson x.qualification_type_id));
    ]

let list_worker_blocks_response_to_yojson (x : list_worker_blocks_response) =
  assoc_to_yojson
    [
      ("WorkerBlocks", option_to_yojson worker_block_list_to_yojson x.worker_blocks);
      ("NumResults", option_to_yojson integer_to_yojson x.num_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_worker_blocks_request_to_yojson (x : list_worker_blocks_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_review_policy_results_for_hit_response_to_yojson
    (x : list_review_policy_results_for_hit_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("HITReviewReport", option_to_yojson review_report_to_yojson x.hit_review_report);
      ("AssignmentReviewReport", option_to_yojson review_report_to_yojson x.assignment_review_report);
      ("HITReviewPolicy", option_to_yojson review_policy_to_yojson x.hit_review_policy);
      ("AssignmentReviewPolicy", option_to_yojson review_policy_to_yojson x.assignment_review_policy);
      ("HITId", option_to_yojson entity_id_to_yojson x.hit_id);
    ]

let list_review_policy_results_for_hit_request_to_yojson
    (x : list_review_policy_results_for_hit_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("RetrieveResults", option_to_yojson boolean__to_yojson x.retrieve_results);
      ("RetrieveActions", option_to_yojson boolean__to_yojson x.retrieve_actions);
      ("PolicyLevels", option_to_yojson review_policy_level_list_to_yojson x.policy_levels);
      ("HITId", Some (entity_id_to_yojson x.hit_id));
    ]

let hit_status_to_yojson (x : hit_status) =
  match x with
  | Disposed -> `String "Disposed"
  | Reviewing -> `String "Reviewing"
  | Reviewable -> `String "Reviewable"
  | Unassignable -> `String "Unassignable"
  | Assignable -> `String "Assignable"

let hit_review_status_to_yojson (x : hit_review_status) =
  match x with
  | ReviewedInappropriate -> `String "ReviewedInappropriate"
  | ReviewedAppropriate -> `String "ReviewedAppropriate"
  | MarkedForReview -> `String "MarkedForReview"
  | NotReviewed -> `String "NotReviewed"

let hi_t_to_yojson (x : hi_t) =
  assoc_to_yojson
    [
      ( "NumberOfAssignmentsCompleted",
        option_to_yojson integer_to_yojson x.number_of_assignments_completed );
      ( "NumberOfAssignmentsAvailable",
        option_to_yojson integer_to_yojson x.number_of_assignments_available );
      ( "NumberOfAssignmentsPending",
        option_to_yojson integer_to_yojson x.number_of_assignments_pending );
      ("HITReviewStatus", option_to_yojson hit_review_status_to_yojson x.hit_review_status);
      ( "QualificationRequirements",
        option_to_yojson qualification_requirement_list_to_yojson x.qualification_requirements );
      ("RequesterAnnotation", option_to_yojson string__to_yojson x.requester_annotation);
      ( "AssignmentDurationInSeconds",
        option_to_yojson long_to_yojson x.assignment_duration_in_seconds );
      ("Expiration", option_to_yojson timestamp_to_yojson x.expiration);
      ( "AutoApprovalDelayInSeconds",
        option_to_yojson long_to_yojson x.auto_approval_delay_in_seconds );
      ("Reward", option_to_yojson currency_amount_to_yojson x.reward);
      ("MaxAssignments", option_to_yojson integer_to_yojson x.max_assignments);
      ("HITStatus", option_to_yojson hit_status_to_yojson x.hit_status);
      ("Keywords", option_to_yojson string__to_yojson x.keywords);
      ("Question", option_to_yojson string__to_yojson x.question);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Title", option_to_yojson string__to_yojson x.title);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("HITLayoutId", option_to_yojson entity_id_to_yojson x.hit_layout_id);
      ("HITGroupId", option_to_yojson entity_id_to_yojson x.hit_group_id);
      ("HITTypeId", option_to_yojson entity_id_to_yojson x.hit_type_id);
      ("HITId", option_to_yojson entity_id_to_yojson x.hit_id);
    ]

let hit_list_to_yojson tree = list_to_yojson hi_t_to_yojson tree

let list_reviewable_hi_ts_response_to_yojson (x : list_reviewable_hi_ts_response) =
  assoc_to_yojson
    [
      ("HITs", option_to_yojson hit_list_to_yojson x.hi_ts);
      ("NumResults", option_to_yojson integer_to_yojson x.num_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_reviewable_hi_ts_request_to_yojson (x : list_reviewable_hi_ts_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Status", option_to_yojson reviewable_hit_status_to_yojson x.status);
      ("HITTypeId", option_to_yojson entity_id_to_yojson x.hit_type_id);
    ]

let list_qualification_types_response_to_yojson (x : list_qualification_types_response) =
  assoc_to_yojson
    [
      ( "QualificationTypes",
        option_to_yojson qualification_type_list_to_yojson x.qualification_types );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("NumResults", option_to_yojson integer_to_yojson x.num_results);
    ]

let list_qualification_types_request_to_yojson (x : list_qualification_types_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MustBeOwnedByCaller", option_to_yojson boolean__to_yojson x.must_be_owned_by_caller);
      ("MustBeRequestable", Some (boolean__to_yojson x.must_be_requestable));
      ("Query", option_to_yojson string__to_yojson x.query);
    ]

let list_qualification_requests_response_to_yojson (x : list_qualification_requests_response) =
  assoc_to_yojson
    [
      ( "QualificationRequests",
        option_to_yojson qualification_request_list_to_yojson x.qualification_requests );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("NumResults", option_to_yojson integer_to_yojson x.num_results);
    ]

let list_qualification_requests_request_to_yojson (x : list_qualification_requests_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("QualificationTypeId", option_to_yojson entity_id_to_yojson x.qualification_type_id);
    ]

let list_hi_ts_for_qualification_type_response_to_yojson
    (x : list_hi_ts_for_qualification_type_response) =
  assoc_to_yojson
    [
      ("HITs", option_to_yojson hit_list_to_yojson x.hi_ts);
      ("NumResults", option_to_yojson integer_to_yojson x.num_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_hi_ts_for_qualification_type_request_to_yojson
    (x : list_hi_ts_for_qualification_type_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("QualificationTypeId", Some (entity_id_to_yojson x.qualification_type_id));
    ]

let list_hi_ts_response_to_yojson (x : list_hi_ts_response) =
  assoc_to_yojson
    [
      ("HITs", option_to_yojson hit_list_to_yojson x.hi_ts);
      ("NumResults", option_to_yojson integer_to_yojson x.num_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_hi_ts_request_to_yojson (x : list_hi_ts_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let bonus_payment_to_yojson (x : bonus_payment) =
  assoc_to_yojson
    [
      ("GrantTime", option_to_yojson timestamp_to_yojson x.grant_time);
      ("Reason", option_to_yojson string__to_yojson x.reason);
      ("AssignmentId", option_to_yojson entity_id_to_yojson x.assignment_id);
      ("BonusAmount", option_to_yojson currency_amount_to_yojson x.bonus_amount);
      ("WorkerId", option_to_yojson customer_id_to_yojson x.worker_id);
    ]

let bonus_payment_list_to_yojson tree = list_to_yojson bonus_payment_to_yojson tree

let list_bonus_payments_response_to_yojson (x : list_bonus_payments_response) =
  assoc_to_yojson
    [
      ("BonusPayments", option_to_yojson bonus_payment_list_to_yojson x.bonus_payments);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("NumResults", option_to_yojson integer_to_yojson x.num_results);
    ]

let list_bonus_payments_request_to_yojson (x : list_bonus_payments_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("AssignmentId", option_to_yojson entity_id_to_yojson x.assignment_id);
      ("HITId", option_to_yojson entity_id_to_yojson x.hit_id);
    ]

let assignment_status_to_yojson (x : assignment_status) =
  match x with
  | Rejected -> `String "Rejected"
  | Approved -> `String "Approved"
  | Submitted -> `String "Submitted"

let assignment_to_yojson (x : assignment) =
  assoc_to_yojson
    [
      ("RequesterFeedback", option_to_yojson string__to_yojson x.requester_feedback);
      ("Answer", option_to_yojson string__to_yojson x.answer);
      ("Deadline", option_to_yojson timestamp_to_yojson x.deadline);
      ("RejectionTime", option_to_yojson timestamp_to_yojson x.rejection_time);
      ("ApprovalTime", option_to_yojson timestamp_to_yojson x.approval_time);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("AcceptTime", option_to_yojson timestamp_to_yojson x.accept_time);
      ("AutoApprovalTime", option_to_yojson timestamp_to_yojson x.auto_approval_time);
      ("AssignmentStatus", option_to_yojson assignment_status_to_yojson x.assignment_status);
      ("HITId", option_to_yojson entity_id_to_yojson x.hit_id);
      ("WorkerId", option_to_yojson customer_id_to_yojson x.worker_id);
      ("AssignmentId", option_to_yojson entity_id_to_yojson x.assignment_id);
    ]

let assignment_list_to_yojson tree = list_to_yojson assignment_to_yojson tree

let list_assignments_for_hit_response_to_yojson (x : list_assignments_for_hit_response) =
  assoc_to_yojson
    [
      ("Assignments", option_to_yojson assignment_list_to_yojson x.assignments);
      ("NumResults", option_to_yojson integer_to_yojson x.num_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let assignment_status_list_to_yojson tree = list_to_yojson assignment_status_to_yojson tree

let list_assignments_for_hit_request_to_yojson (x : list_assignments_for_hit_request) =
  assoc_to_yojson
    [
      ("AssignmentStatuses", option_to_yojson assignment_status_list_to_yojson x.assignment_statuses);
      ("MaxResults", option_to_yojson result_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("HITId", Some (entity_id_to_yojson x.hit_id));
    ]

let get_qualification_type_response_to_yojson (x : get_qualification_type_response) =
  assoc_to_yojson
    [ ("QualificationType", option_to_yojson qualification_type_to_yojson x.qualification_type) ]

let get_qualification_type_request_to_yojson (x : get_qualification_type_request) =
  assoc_to_yojson [ ("QualificationTypeId", Some (entity_id_to_yojson x.qualification_type_id)) ]

let get_qualification_score_response_to_yojson (x : get_qualification_score_response) =
  assoc_to_yojson [ ("Qualification", option_to_yojson qualification_to_yojson x.qualification) ]

let get_qualification_score_request_to_yojson (x : get_qualification_score_request) =
  assoc_to_yojson
    [
      ("WorkerId", Some (customer_id_to_yojson x.worker_id));
      ("QualificationTypeId", Some (entity_id_to_yojson x.qualification_type_id));
    ]

let get_hit_response_to_yojson (x : get_hit_response) =
  assoc_to_yojson [ ("HIT", option_to_yojson hi_t_to_yojson x.hi_t) ]

let get_hit_request_to_yojson (x : get_hit_request) =
  assoc_to_yojson [ ("HITId", Some (entity_id_to_yojson x.hit_id)) ]

let get_file_upload_url_response_to_yojson (x : get_file_upload_url_response) =
  assoc_to_yojson [ ("FileUploadURL", option_to_yojson string__to_yojson x.file_upload_ur_l) ]

let get_file_upload_url_request_to_yojson (x : get_file_upload_url_request) =
  assoc_to_yojson
    [
      ("QuestionIdentifier", Some (string__to_yojson x.question_identifier));
      ("AssignmentId", Some (entity_id_to_yojson x.assignment_id));
    ]

let get_assignment_response_to_yojson (x : get_assignment_response) =
  assoc_to_yojson
    [
      ("HIT", option_to_yojson hi_t_to_yojson x.hi_t);
      ("Assignment", option_to_yojson assignment_to_yojson x.assignment);
    ]

let get_assignment_request_to_yojson (x : get_assignment_request) =
  assoc_to_yojson [ ("AssignmentId", Some (entity_id_to_yojson x.assignment_id)) ]

let get_account_balance_response_to_yojson (x : get_account_balance_response) =
  assoc_to_yojson
    [
      ("OnHoldBalance", option_to_yojson currency_amount_to_yojson x.on_hold_balance);
      ("AvailableBalance", option_to_yojson currency_amount_to_yojson x.available_balance);
    ]

let get_account_balance_request_to_yojson = unit_to_yojson
let disassociate_qualification_from_worker_response_to_yojson = unit_to_yojson

let disassociate_qualification_from_worker_request_to_yojson
    (x : disassociate_qualification_from_worker_request) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson string__to_yojson x.reason);
      ("QualificationTypeId", Some (entity_id_to_yojson x.qualification_type_id));
      ("WorkerId", Some (customer_id_to_yojson x.worker_id));
    ]

let delete_worker_block_response_to_yojson = unit_to_yojson

let delete_worker_block_request_to_yojson (x : delete_worker_block_request) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson string__to_yojson x.reason);
      ("WorkerId", Some (customer_id_to_yojson x.worker_id));
    ]

let delete_qualification_type_response_to_yojson = unit_to_yojson

let delete_qualification_type_request_to_yojson (x : delete_qualification_type_request) =
  assoc_to_yojson [ ("QualificationTypeId", Some (entity_id_to_yojson x.qualification_type_id)) ]

let delete_hit_response_to_yojson = unit_to_yojson

let delete_hit_request_to_yojson (x : delete_hit_request) =
  assoc_to_yojson [ ("HITId", Some (entity_id_to_yojson x.hit_id)) ]

let create_worker_block_response_to_yojson = unit_to_yojson

let create_worker_block_request_to_yojson (x : create_worker_block_request) =
  assoc_to_yojson
    [
      ("Reason", Some (string__to_yojson x.reason));
      ("WorkerId", Some (customer_id_to_yojson x.worker_id));
    ]

let create_qualification_type_response_to_yojson (x : create_qualification_type_response) =
  assoc_to_yojson
    [ ("QualificationType", option_to_yojson qualification_type_to_yojson x.qualification_type) ]

let create_qualification_type_request_to_yojson (x : create_qualification_type_request) =
  assoc_to_yojson
    [
      ("AutoGrantedValue", option_to_yojson integer_to_yojson x.auto_granted_value);
      ("AutoGranted", option_to_yojson boolean__to_yojson x.auto_granted);
      ("TestDurationInSeconds", option_to_yojson long_to_yojson x.test_duration_in_seconds);
      ("AnswerKey", option_to_yojson string__to_yojson x.answer_key);
      ("Test", option_to_yojson string__to_yojson x.test);
      ("RetryDelayInSeconds", option_to_yojson long_to_yojson x.retry_delay_in_seconds);
      ( "QualificationTypeStatus",
        Some (qualification_type_status_to_yojson x.qualification_type_status) );
      ("Description", Some (string__to_yojson x.description));
      ("Keywords", option_to_yojson string__to_yojson x.keywords);
      ("Name", Some (string__to_yojson x.name));
    ]

let create_hit_with_hit_type_response_to_yojson (x : create_hit_with_hit_type_response) =
  assoc_to_yojson [ ("HIT", option_to_yojson hi_t_to_yojson x.hi_t) ]

let hit_layout_parameter_to_yojson (x : hit_layout_parameter) =
  assoc_to_yojson
    [ ("Value", Some (string__to_yojson x.value)); ("Name", Some (string__to_yojson x.name)) ]

let hit_layout_parameter_list_to_yojson tree = list_to_yojson hit_layout_parameter_to_yojson tree

let create_hit_with_hit_type_request_to_yojson (x : create_hit_with_hit_type_request) =
  assoc_to_yojson
    [
      ( "HITLayoutParameters",
        option_to_yojson hit_layout_parameter_list_to_yojson x.hit_layout_parameters );
      ("HITLayoutId", option_to_yojson entity_id_to_yojson x.hit_layout_id);
      ("HITReviewPolicy", option_to_yojson review_policy_to_yojson x.hit_review_policy);
      ("AssignmentReviewPolicy", option_to_yojson review_policy_to_yojson x.assignment_review_policy);
      ("UniqueRequestToken", option_to_yojson idempotency_token_to_yojson x.unique_request_token);
      ("RequesterAnnotation", option_to_yojson string__to_yojson x.requester_annotation);
      ("Question", option_to_yojson string__to_yojson x.question);
      ("LifetimeInSeconds", Some (long_to_yojson x.lifetime_in_seconds));
      ("MaxAssignments", option_to_yojson integer_to_yojson x.max_assignments);
      ("HITTypeId", Some (entity_id_to_yojson x.hit_type_id));
    ]

let create_hit_type_response_to_yojson (x : create_hit_type_response) =
  assoc_to_yojson [ ("HITTypeId", option_to_yojson entity_id_to_yojson x.hit_type_id) ]

let create_hit_type_request_to_yojson (x : create_hit_type_request) =
  assoc_to_yojson
    [
      ( "QualificationRequirements",
        option_to_yojson qualification_requirement_list_to_yojson x.qualification_requirements );
      ("Description", Some (string__to_yojson x.description));
      ("Keywords", option_to_yojson string__to_yojson x.keywords);
      ("Title", Some (string__to_yojson x.title));
      ("Reward", Some (currency_amount_to_yojson x.reward));
      ("AssignmentDurationInSeconds", Some (long_to_yojson x.assignment_duration_in_seconds));
      ( "AutoApprovalDelayInSeconds",
        option_to_yojson long_to_yojson x.auto_approval_delay_in_seconds );
    ]

let create_hit_response_to_yojson (x : create_hit_response) =
  assoc_to_yojson [ ("HIT", option_to_yojson hi_t_to_yojson x.hi_t) ]

let create_hit_request_to_yojson (x : create_hit_request) =
  assoc_to_yojson
    [
      ( "HITLayoutParameters",
        option_to_yojson hit_layout_parameter_list_to_yojson x.hit_layout_parameters );
      ("HITLayoutId", option_to_yojson entity_id_to_yojson x.hit_layout_id);
      ("HITReviewPolicy", option_to_yojson review_policy_to_yojson x.hit_review_policy);
      ("AssignmentReviewPolicy", option_to_yojson review_policy_to_yojson x.assignment_review_policy);
      ("UniqueRequestToken", option_to_yojson idempotency_token_to_yojson x.unique_request_token);
      ( "QualificationRequirements",
        option_to_yojson qualification_requirement_list_to_yojson x.qualification_requirements );
      ("RequesterAnnotation", option_to_yojson string__to_yojson x.requester_annotation);
      ("Question", option_to_yojson string__to_yojson x.question);
      ("Description", Some (string__to_yojson x.description));
      ("Keywords", option_to_yojson string__to_yojson x.keywords);
      ("Title", Some (string__to_yojson x.title));
      ("Reward", Some (currency_amount_to_yojson x.reward));
      ("AssignmentDurationInSeconds", Some (long_to_yojson x.assignment_duration_in_seconds));
      ("LifetimeInSeconds", Some (long_to_yojson x.lifetime_in_seconds));
      ( "AutoApprovalDelayInSeconds",
        option_to_yojson long_to_yojson x.auto_approval_delay_in_seconds );
      ("MaxAssignments", option_to_yojson integer_to_yojson x.max_assignments);
    ]

let create_additional_assignments_for_hit_response_to_yojson = unit_to_yojson

let create_additional_assignments_for_hit_request_to_yojson
    (x : create_additional_assignments_for_hit_request) =
  assoc_to_yojson
    [
      ("UniqueRequestToken", option_to_yojson idempotency_token_to_yojson x.unique_request_token);
      ("NumberOfAdditionalAssignments", Some (integer_to_yojson x.number_of_additional_assignments));
      ("HITId", Some (entity_id_to_yojson x.hit_id));
    ]

let associate_qualification_with_worker_response_to_yojson = unit_to_yojson

let associate_qualification_with_worker_request_to_yojson
    (x : associate_qualification_with_worker_request) =
  assoc_to_yojson
    [
      ("SendNotification", option_to_yojson boolean__to_yojson x.send_notification);
      ("IntegerValue", option_to_yojson integer_to_yojson x.integer_value);
      ("WorkerId", Some (customer_id_to_yojson x.worker_id));
      ("QualificationTypeId", Some (entity_id_to_yojson x.qualification_type_id));
    ]

let approve_assignment_response_to_yojson = unit_to_yojson

let approve_assignment_request_to_yojson (x : approve_assignment_request) =
  assoc_to_yojson
    [
      ("OverrideRejection", option_to_yojson boolean__to_yojson x.override_rejection);
      ("RequesterFeedback", option_to_yojson string__to_yojson x.requester_feedback);
      ("AssignmentId", Some (entity_id_to_yojson x.assignment_id));
    ]

let accept_qualification_request_response_to_yojson = unit_to_yojson

let accept_qualification_request_request_to_yojson (x : accept_qualification_request_request) =
  assoc_to_yojson
    [
      ("IntegerValue", option_to_yojson integer_to_yojson x.integer_value);
      ("QualificationRequestId", Some (string__to_yojson x.qualification_request_id));
    ]
