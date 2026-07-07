open Smaws_Lib.Json.DeserializeHelpers
open Types

let customer_id_of_yojson = string_of_yojson
let string__of_yojson = string_of_yojson

let worker_block_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = option_of_yojson (value_for_key string__of_yojson "Reason") _list path;
     worker_id = option_of_yojson (value_for_key customer_id_of_yojson "WorkerId") _list path;
   }
    : worker_block)

let worker_block_list_of_yojson tree path = list_of_yojson worker_block_of_yojson tree path
let entity_id_of_yojson = string_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let qualification_type_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Inactive" -> Inactive
    | `String "Active" -> Active
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "QualificationTypeStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "QualificationTypeStatus")
     : qualification_type_status)
    : qualification_type_status)

let long_of_yojson = long_of_yojson
let boolean__of_yojson = bool_of_yojson
let integer_of_yojson = int_of_yojson

let qualification_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_granted_value =
       option_of_yojson (value_for_key integer_of_yojson "AutoGrantedValue") _list path;
     auto_granted = option_of_yojson (value_for_key boolean__of_yojson "AutoGranted") _list path;
     is_requestable = option_of_yojson (value_for_key boolean__of_yojson "IsRequestable") _list path;
     retry_delay_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "RetryDelayInSeconds") _list path;
     answer_key = option_of_yojson (value_for_key string__of_yojson "AnswerKey") _list path;
     test_duration_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "TestDurationInSeconds") _list path;
     test = option_of_yojson (value_for_key string__of_yojson "Test") _list path;
     qualification_type_status =
       option_of_yojson
         (value_for_key qualification_type_status_of_yojson "QualificationTypeStatus")
         _list path;
     keywords = option_of_yojson (value_for_key string__of_yojson "Keywords") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     qualification_type_id =
       option_of_yojson (value_for_key entity_id_of_yojson "QualificationTypeId") _list path;
   }
    : qualification_type)

let update_qualification_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualification_type =
       option_of_yojson (value_for_key qualification_type_of_yojson "QualificationType") _list path;
   }
    : update_qualification_type_response)

let update_qualification_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_granted_value =
       option_of_yojson (value_for_key integer_of_yojson "AutoGrantedValue") _list path;
     auto_granted = option_of_yojson (value_for_key boolean__of_yojson "AutoGranted") _list path;
     retry_delay_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "RetryDelayInSeconds") _list path;
     test_duration_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "TestDurationInSeconds") _list path;
     answer_key = option_of_yojson (value_for_key string__of_yojson "AnswerKey") _list path;
     test = option_of_yojson (value_for_key string__of_yojson "Test") _list path;
     qualification_type_status =
       option_of_yojson
         (value_for_key qualification_type_status_of_yojson "QualificationTypeStatus")
         _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     qualification_type_id = value_for_key entity_id_of_yojson "QualificationTypeId" _list path;
   }
    : update_qualification_type_request)

let exception_message_of_yojson = string_of_yojson
let turk_error_code_of_yojson = string_of_yojson

let service_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     turk_error_code =
       option_of_yojson (value_for_key turk_error_code_of_yojson "TurkErrorCode") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
   }
    : service_fault)

let request_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     turk_error_code =
       option_of_yojson (value_for_key turk_error_code_of_yojson "TurkErrorCode") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
   }
    : request_error)

let update_notification_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let notification_transport_of_yojson (tree : t) path =
  ((match tree with
    | `String "SNS" -> SNS
    | `String "SQS" -> SQS
    | `String "Email" -> Email
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NotificationTransport" value)
    | _ -> raise (deserialize_wrong_type_error path "NotificationTransport")
     : notification_transport)
    : notification_transport)

let event_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Ping" -> Ping
    | `String "HITDisposed" -> HITDisposed
    | `String "HITExtended" -> HITExtended
    | `String "HITReviewable" -> HITReviewable
    | `String "HITExpired" -> HITExpired
    | `String "HITCreated" -> HITCreated
    | `String "AssignmentApproved" -> AssignmentApproved
    | `String "AssignmentRejected" -> AssignmentRejected
    | `String "AssignmentSubmitted" -> AssignmentSubmitted
    | `String "AssignmentReturned" -> AssignmentReturned
    | `String "AssignmentAbandoned" -> AssignmentAbandoned
    | `String "AssignmentAccepted" -> AssignmentAccepted
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventType" value)
    | _ -> raise (deserialize_wrong_type_error path "EventType")
     : event_type)
    : event_type)

let event_type_list_of_yojson tree path = list_of_yojson event_type_of_yojson tree path

let notification_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_types = value_for_key event_type_list_of_yojson "EventTypes" _list path;
     version = value_for_key string__of_yojson "Version" _list path;
     transport = value_for_key notification_transport_of_yojson "Transport" _list path;
     destination = value_for_key string__of_yojson "Destination" _list path;
   }
    : notification_specification)

let update_notification_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active = option_of_yojson (value_for_key boolean__of_yojson "Active") _list path;
     notification =
       option_of_yojson
         (value_for_key notification_specification_of_yojson "Notification")
         _list path;
     hit_type_id = value_for_key entity_id_of_yojson "HITTypeId" _list path;
   }
    : update_notification_settings_request)

let update_hit_type_of_hit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_hit_type_of_hit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hit_type_id = value_for_key entity_id_of_yojson "HITTypeId" _list path;
     hit_id = value_for_key entity_id_of_yojson "HITId" _list path;
   }
    : update_hit_type_of_hit_request)

let update_hit_review_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_hit_review_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revert = option_of_yojson (value_for_key boolean__of_yojson "Revert") _list path;
     hit_id = value_for_key entity_id_of_yojson "HITId" _list path;
   }
    : update_hit_review_status_request)

let update_expiration_for_hit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_expiration_for_hit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expire_at = value_for_key timestamp_of_yojson "ExpireAt" _list path;
     hit_id = value_for_key entity_id_of_yojson "HITId" _list path;
   }
    : update_expiration_for_hit_request)

let string_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let send_test_event_notification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let send_test_event_notification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     test_event_type = value_for_key event_type_of_yojson "TestEventType" _list path;
     notification = value_for_key notification_specification_of_yojson "Notification" _list path;
   }
    : send_test_event_notification_request)

let send_bonus_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let currency_amount_of_yojson = string_of_yojson
let idempotency_token_of_yojson = string_of_yojson

let send_bonus_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unique_request_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "UniqueRequestToken") _list path;
     reason = value_for_key string__of_yojson "Reason" _list path;
     assignment_id = value_for_key entity_id_of_yojson "AssignmentId" _list path;
     bonus_amount = value_for_key currency_amount_of_yojson "BonusAmount" _list path;
     worker_id = value_for_key customer_id_of_yojson "WorkerId" _list path;
   }
    : send_bonus_request)

let reviewable_hit_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Reviewing" -> Reviewing
    | `String "Reviewable" -> Reviewable
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReviewableHITStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ReviewableHITStatus")
     : reviewable_hit_status)
    : reviewable_hit_status)

let review_result_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key string__of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key string__of_yojson "Key") _list path;
     question_id = option_of_yojson (value_for_key entity_id_of_yojson "QuestionId") _list path;
     subject_type = option_of_yojson (value_for_key string__of_yojson "SubjectType") _list path;
     subject_id = option_of_yojson (value_for_key entity_id_of_yojson "SubjectId") _list path;
     action_id = option_of_yojson (value_for_key entity_id_of_yojson "ActionId") _list path;
   }
    : review_result_detail)

let review_result_detail_list_of_yojson tree path =
  list_of_yojson review_result_detail_of_yojson tree path

let review_action_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Cancelled" -> Cancelled
    | `String "Failed" -> Failed
    | `String "Succeeded" -> Succeeded
    | `String "Intended" -> Intended
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReviewActionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ReviewActionStatus")
     : review_action_status)
    : review_action_status)

let review_action_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code = option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list path;
     result_ = option_of_yojson (value_for_key string__of_yojson "Result") _list path;
     complete_time = option_of_yojson (value_for_key timestamp_of_yojson "CompleteTime") _list path;
     status = option_of_yojson (value_for_key review_action_status_of_yojson "Status") _list path;
     target_type = option_of_yojson (value_for_key string__of_yojson "TargetType") _list path;
     target_id = option_of_yojson (value_for_key entity_id_of_yojson "TargetId") _list path;
     action_name = option_of_yojson (value_for_key string__of_yojson "ActionName") _list path;
     action_id = option_of_yojson (value_for_key entity_id_of_yojson "ActionId") _list path;
   }
    : review_action_detail)

let review_action_detail_list_of_yojson tree path =
  list_of_yojson review_action_detail_of_yojson tree path

let review_report_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     review_actions =
       option_of_yojson
         (value_for_key review_action_detail_list_of_yojson "ReviewActions")
         _list path;
     review_results =
       option_of_yojson
         (value_for_key review_result_detail_list_of_yojson "ReviewResults")
         _list path;
   }
    : review_report)

let review_policy_level_of_yojson (tree : t) path =
  ((match tree with
    | `String "HIT" -> HIT
    | `String "Assignment" -> Assignment
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReviewPolicyLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "ReviewPolicyLevel")
     : review_policy_level)
    : review_policy_level)

let review_policy_level_list_of_yojson tree path =
  list_of_yojson review_policy_level_of_yojson tree path

let parameter_map_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = option_of_yojson (value_for_key string_list_of_yojson "Values") _list path;
     key = option_of_yojson (value_for_key string__of_yojson "Key") _list path;
   }
    : parameter_map_entry)

let parameter_map_entry_list_of_yojson tree path =
  list_of_yojson parameter_map_entry_of_yojson tree path

let policy_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     map_entries =
       option_of_yojson (value_for_key parameter_map_entry_list_of_yojson "MapEntries") _list path;
     values = option_of_yojson (value_for_key string_list_of_yojson "Values") _list path;
     key = option_of_yojson (value_for_key string__of_yojson "Key") _list path;
   }
    : policy_parameter)

let policy_parameter_list_of_yojson tree path = list_of_yojson policy_parameter_of_yojson tree path

let review_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters =
       option_of_yojson (value_for_key policy_parameter_list_of_yojson "Parameters") _list path;
     policy_name = value_for_key string__of_yojson "PolicyName" _list path;
   }
    : review_policy)

let result_size_of_yojson = int_of_yojson

let reject_qualification_request_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let reject_qualification_request_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = option_of_yojson (value_for_key string__of_yojson "Reason") _list path;
     qualification_request_id = value_for_key string__of_yojson "QualificationRequestId" _list path;
   }
    : reject_qualification_request_request)

let reject_assignment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let reject_assignment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     requester_feedback = value_for_key string__of_yojson "RequesterFeedback" _list path;
     assignment_id = value_for_key entity_id_of_yojson "AssignmentId" _list path;
   }
    : reject_assignment_request)

let qualification_type_list_of_yojson tree path =
  list_of_yojson qualification_type_of_yojson tree path

let qualification_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Revoked" -> Revoked
    | `String "Granted" -> Granted
    | `String value -> raise (deserialize_unknown_enum_value_error path "QualificationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "QualificationStatus")
     : qualification_status)
    : qualification_status)

let comparator_of_yojson (tree : t) path =
  ((match tree with
    | `String "NotIn" -> NotIn
    | `String "In" -> In
    | `String "DoesNotExist" -> DoesNotExist
    | `String "Exists" -> Exists
    | `String "NotEqualTo" -> NotEqualTo
    | `String "EqualTo" -> EqualTo
    | `String "GreaterThanOrEqualTo" -> GreaterThanOrEqualTo
    | `String "GreaterThan" -> GreaterThan
    | `String "LessThanOrEqualTo" -> LessThanOrEqualTo
    | `String "LessThan" -> LessThan
    | `String value -> raise (deserialize_unknown_enum_value_error path "Comparator" value)
    | _ -> raise (deserialize_wrong_type_error path "Comparator")
     : comparator)
    : comparator)

let integer_list_of_yojson tree path = list_of_yojson integer_of_yojson tree path
let country_parameters_of_yojson = string_of_yojson

let locale_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subdivision =
       option_of_yojson (value_for_key country_parameters_of_yojson "Subdivision") _list path;
     country = value_for_key country_parameters_of_yojson "Country" _list path;
   }
    : locale)

let locale_list_of_yojson tree path = list_of_yojson locale_of_yojson tree path

let hit_access_actions_of_yojson (tree : t) path =
  ((match tree with
    | `String "DiscoverPreviewAndAccept" -> DiscoverPreviewAndAccept
    | `String "PreviewAndAccept" -> PreviewAndAccept
    | `String "Accept" -> Accept
    | `String value -> raise (deserialize_unknown_enum_value_error path "HITAccessActions" value)
    | _ -> raise (deserialize_wrong_type_error path "HITAccessActions")
     : hit_access_actions)
    : hit_access_actions)

let qualification_requirement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     actions_guarded =
       option_of_yojson (value_for_key hit_access_actions_of_yojson "ActionsGuarded") _list path;
     required_to_preview =
       option_of_yojson (value_for_key boolean__of_yojson "RequiredToPreview") _list path;
     locale_values =
       option_of_yojson (value_for_key locale_list_of_yojson "LocaleValues") _list path;
     integer_values =
       option_of_yojson (value_for_key integer_list_of_yojson "IntegerValues") _list path;
     comparator = value_for_key comparator_of_yojson "Comparator" _list path;
     qualification_type_id = value_for_key string__of_yojson "QualificationTypeId" _list path;
   }
    : qualification_requirement)

let qualification_requirement_list_of_yojson tree path =
  list_of_yojson qualification_requirement_of_yojson tree path

let qualification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     submit_time = option_of_yojson (value_for_key timestamp_of_yojson "SubmitTime") _list path;
     answer = option_of_yojson (value_for_key string__of_yojson "Answer") _list path;
     test = option_of_yojson (value_for_key string__of_yojson "Test") _list path;
     worker_id = option_of_yojson (value_for_key customer_id_of_yojson "WorkerId") _list path;
     qualification_type_id =
       option_of_yojson (value_for_key entity_id_of_yojson "QualificationTypeId") _list path;
     qualification_request_id =
       option_of_yojson (value_for_key string__of_yojson "QualificationRequestId") _list path;
   }
    : qualification_request)

let qualification_request_list_of_yojson tree path =
  list_of_yojson qualification_request_of_yojson tree path

let qualification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key qualification_status_of_yojson "Status") _list path;
     locale_value = option_of_yojson (value_for_key locale_of_yojson "LocaleValue") _list path;
     integer_value = option_of_yojson (value_for_key integer_of_yojson "IntegerValue") _list path;
     grant_time = option_of_yojson (value_for_key timestamp_of_yojson "GrantTime") _list path;
     worker_id = option_of_yojson (value_for_key customer_id_of_yojson "WorkerId") _list path;
     qualification_type_id =
       option_of_yojson (value_for_key entity_id_of_yojson "QualificationTypeId") _list path;
   }
    : qualification)

let qualification_list_of_yojson tree path = list_of_yojson qualification_of_yojson tree path
let pagination_token_of_yojson = string_of_yojson

let notify_workers_failure_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "HardFailure" -> HardFailure
    | `String "SoftFailure" -> SoftFailure
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NotifyWorkersFailureCode" value)
    | _ -> raise (deserialize_wrong_type_error path "NotifyWorkersFailureCode")
     : notify_workers_failure_code)
    : notify_workers_failure_code)

let notify_workers_failure_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     worker_id = option_of_yojson (value_for_key customer_id_of_yojson "WorkerId") _list path;
     notify_workers_failure_message =
       option_of_yojson (value_for_key string__of_yojson "NotifyWorkersFailureMessage") _list path;
     notify_workers_failure_code =
       option_of_yojson
         (value_for_key notify_workers_failure_code_of_yojson "NotifyWorkersFailureCode")
         _list path;
   }
    : notify_workers_failure_status)

let notify_workers_failure_status_list_of_yojson tree path =
  list_of_yojson notify_workers_failure_status_of_yojson tree path

let notify_workers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notify_workers_failure_statuses =
       option_of_yojson
         (value_for_key notify_workers_failure_status_list_of_yojson "NotifyWorkersFailureStatuses")
         _list path;
   }
    : notify_workers_response)

let customer_id_list_of_yojson tree path = list_of_yojson customer_id_of_yojson tree path

let notify_workers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     worker_ids = value_for_key customer_id_list_of_yojson "WorkerIds" _list path;
     message_text = value_for_key string__of_yojson "MessageText" _list path;
     subject = value_for_key string__of_yojson "Subject" _list path;
   }
    : notify_workers_request)

let list_workers_with_qualification_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualifications =
       option_of_yojson (value_for_key qualification_list_of_yojson "Qualifications") _list path;
     num_results = option_of_yojson (value_for_key integer_of_yojson "NumResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_workers_with_qualification_type_response)

let list_workers_with_qualification_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     status = option_of_yojson (value_for_key qualification_status_of_yojson "Status") _list path;
     qualification_type_id = value_for_key entity_id_of_yojson "QualificationTypeId" _list path;
   }
    : list_workers_with_qualification_type_request)

let list_worker_blocks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     worker_blocks =
       option_of_yojson (value_for_key worker_block_list_of_yojson "WorkerBlocks") _list path;
     num_results = option_of_yojson (value_for_key integer_of_yojson "NumResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_worker_blocks_response)

let list_worker_blocks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_worker_blocks_request)

let list_review_policy_results_for_hit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     hit_review_report =
       option_of_yojson (value_for_key review_report_of_yojson "HITReviewReport") _list path;
     assignment_review_report =
       option_of_yojson (value_for_key review_report_of_yojson "AssignmentReviewReport") _list path;
     hit_review_policy =
       option_of_yojson (value_for_key review_policy_of_yojson "HITReviewPolicy") _list path;
     assignment_review_policy =
       option_of_yojson (value_for_key review_policy_of_yojson "AssignmentReviewPolicy") _list path;
     hit_id = option_of_yojson (value_for_key entity_id_of_yojson "HITId") _list path;
   }
    : list_review_policy_results_for_hit_response)

let list_review_policy_results_for_hit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     retrieve_results =
       option_of_yojson (value_for_key boolean__of_yojson "RetrieveResults") _list path;
     retrieve_actions =
       option_of_yojson (value_for_key boolean__of_yojson "RetrieveActions") _list path;
     policy_levels =
       option_of_yojson (value_for_key review_policy_level_list_of_yojson "PolicyLevels") _list path;
     hit_id = value_for_key entity_id_of_yojson "HITId" _list path;
   }
    : list_review_policy_results_for_hit_request)

let hit_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Disposed" -> Disposed
    | `String "Reviewing" -> Reviewing
    | `String "Reviewable" -> Reviewable
    | `String "Unassignable" -> Unassignable
    | `String "Assignable" -> Assignable
    | `String value -> raise (deserialize_unknown_enum_value_error path "HITStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "HITStatus")
     : hit_status)
    : hit_status)

let hit_review_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ReviewedInappropriate" -> ReviewedInappropriate
    | `String "ReviewedAppropriate" -> ReviewedAppropriate
    | `String "MarkedForReview" -> MarkedForReview
    | `String "NotReviewed" -> NotReviewed
    | `String value -> raise (deserialize_unknown_enum_value_error path "HITReviewStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "HITReviewStatus")
     : hit_review_status)
    : hit_review_status)

let hi_t_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     number_of_assignments_completed =
       option_of_yojson (value_for_key integer_of_yojson "NumberOfAssignmentsCompleted") _list path;
     number_of_assignments_available =
       option_of_yojson (value_for_key integer_of_yojson "NumberOfAssignmentsAvailable") _list path;
     number_of_assignments_pending =
       option_of_yojson (value_for_key integer_of_yojson "NumberOfAssignmentsPending") _list path;
     hit_review_status =
       option_of_yojson (value_for_key hit_review_status_of_yojson "HITReviewStatus") _list path;
     qualification_requirements =
       option_of_yojson
         (value_for_key qualification_requirement_list_of_yojson "QualificationRequirements")
         _list path;
     requester_annotation =
       option_of_yojson (value_for_key string__of_yojson "RequesterAnnotation") _list path;
     assignment_duration_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "AssignmentDurationInSeconds") _list path;
     expiration = option_of_yojson (value_for_key timestamp_of_yojson "Expiration") _list path;
     auto_approval_delay_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "AutoApprovalDelayInSeconds") _list path;
     reward = option_of_yojson (value_for_key currency_amount_of_yojson "Reward") _list path;
     max_assignments =
       option_of_yojson (value_for_key integer_of_yojson "MaxAssignments") _list path;
     hit_status = option_of_yojson (value_for_key hit_status_of_yojson "HITStatus") _list path;
     keywords = option_of_yojson (value_for_key string__of_yojson "Keywords") _list path;
     question = option_of_yojson (value_for_key string__of_yojson "Question") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     title = option_of_yojson (value_for_key string__of_yojson "Title") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     hit_layout_id = option_of_yojson (value_for_key entity_id_of_yojson "HITLayoutId") _list path;
     hit_group_id = option_of_yojson (value_for_key entity_id_of_yojson "HITGroupId") _list path;
     hit_type_id = option_of_yojson (value_for_key entity_id_of_yojson "HITTypeId") _list path;
     hit_id = option_of_yojson (value_for_key entity_id_of_yojson "HITId") _list path;
   }
    : hi_t)

let hit_list_of_yojson tree path = list_of_yojson hi_t_of_yojson tree path

let list_reviewable_hi_ts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hi_ts = option_of_yojson (value_for_key hit_list_of_yojson "HITs") _list path;
     num_results = option_of_yojson (value_for_key integer_of_yojson "NumResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_reviewable_hi_ts_response)

let list_reviewable_hi_ts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     status = option_of_yojson (value_for_key reviewable_hit_status_of_yojson "Status") _list path;
     hit_type_id = option_of_yojson (value_for_key entity_id_of_yojson "HITTypeId") _list path;
   }
    : list_reviewable_hi_ts_request)

let list_qualification_types_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualification_types =
       option_of_yojson
         (value_for_key qualification_type_list_of_yojson "QualificationTypes")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     num_results = option_of_yojson (value_for_key integer_of_yojson "NumResults") _list path;
   }
    : list_qualification_types_response)

let list_qualification_types_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     must_be_owned_by_caller =
       option_of_yojson (value_for_key boolean__of_yojson "MustBeOwnedByCaller") _list path;
     must_be_requestable = value_for_key boolean__of_yojson "MustBeRequestable" _list path;
     query = option_of_yojson (value_for_key string__of_yojson "Query") _list path;
   }
    : list_qualification_types_request)

let list_qualification_requests_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualification_requests =
       option_of_yojson
         (value_for_key qualification_request_list_of_yojson "QualificationRequests")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     num_results = option_of_yojson (value_for_key integer_of_yojson "NumResults") _list path;
   }
    : list_qualification_requests_response)

let list_qualification_requests_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     qualification_type_id =
       option_of_yojson (value_for_key entity_id_of_yojson "QualificationTypeId") _list path;
   }
    : list_qualification_requests_request)

let list_hi_ts_for_qualification_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hi_ts = option_of_yojson (value_for_key hit_list_of_yojson "HITs") _list path;
     num_results = option_of_yojson (value_for_key integer_of_yojson "NumResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_hi_ts_for_qualification_type_response)

let list_hi_ts_for_qualification_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     qualification_type_id = value_for_key entity_id_of_yojson "QualificationTypeId" _list path;
   }
    : list_hi_ts_for_qualification_type_request)

let list_hi_ts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hi_ts = option_of_yojson (value_for_key hit_list_of_yojson "HITs") _list path;
     num_results = option_of_yojson (value_for_key integer_of_yojson "NumResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_hi_ts_response)

let list_hi_ts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_hi_ts_request)

let bonus_payment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     grant_time = option_of_yojson (value_for_key timestamp_of_yojson "GrantTime") _list path;
     reason = option_of_yojson (value_for_key string__of_yojson "Reason") _list path;
     assignment_id = option_of_yojson (value_for_key entity_id_of_yojson "AssignmentId") _list path;
     bonus_amount =
       option_of_yojson (value_for_key currency_amount_of_yojson "BonusAmount") _list path;
     worker_id = option_of_yojson (value_for_key customer_id_of_yojson "WorkerId") _list path;
   }
    : bonus_payment)

let bonus_payment_list_of_yojson tree path = list_of_yojson bonus_payment_of_yojson tree path

let list_bonus_payments_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bonus_payments =
       option_of_yojson (value_for_key bonus_payment_list_of_yojson "BonusPayments") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     num_results = option_of_yojson (value_for_key integer_of_yojson "NumResults") _list path;
   }
    : list_bonus_payments_response)

let list_bonus_payments_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     assignment_id = option_of_yojson (value_for_key entity_id_of_yojson "AssignmentId") _list path;
     hit_id = option_of_yojson (value_for_key entity_id_of_yojson "HITId") _list path;
   }
    : list_bonus_payments_request)

let assignment_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Rejected" -> Rejected
    | `String "Approved" -> Approved
    | `String "Submitted" -> Submitted
    | `String value -> raise (deserialize_unknown_enum_value_error path "AssignmentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AssignmentStatus")
     : assignment_status)
    : assignment_status)

let assignment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     requester_feedback =
       option_of_yojson (value_for_key string__of_yojson "RequesterFeedback") _list path;
     answer = option_of_yojson (value_for_key string__of_yojson "Answer") _list path;
     deadline = option_of_yojson (value_for_key timestamp_of_yojson "Deadline") _list path;
     rejection_time =
       option_of_yojson (value_for_key timestamp_of_yojson "RejectionTime") _list path;
     approval_time = option_of_yojson (value_for_key timestamp_of_yojson "ApprovalTime") _list path;
     submit_time = option_of_yojson (value_for_key timestamp_of_yojson "SubmitTime") _list path;
     accept_time = option_of_yojson (value_for_key timestamp_of_yojson "AcceptTime") _list path;
     auto_approval_time =
       option_of_yojson (value_for_key timestamp_of_yojson "AutoApprovalTime") _list path;
     assignment_status =
       option_of_yojson (value_for_key assignment_status_of_yojson "AssignmentStatus") _list path;
     hit_id = option_of_yojson (value_for_key entity_id_of_yojson "HITId") _list path;
     worker_id = option_of_yojson (value_for_key customer_id_of_yojson "WorkerId") _list path;
     assignment_id = option_of_yojson (value_for_key entity_id_of_yojson "AssignmentId") _list path;
   }
    : assignment)

let assignment_list_of_yojson tree path = list_of_yojson assignment_of_yojson tree path

let list_assignments_for_hit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assignments =
       option_of_yojson (value_for_key assignment_list_of_yojson "Assignments") _list path;
     num_results = option_of_yojson (value_for_key integer_of_yojson "NumResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_assignments_for_hit_response)

let assignment_status_list_of_yojson tree path =
  list_of_yojson assignment_status_of_yojson tree path

let list_assignments_for_hit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assignment_statuses =
       option_of_yojson
         (value_for_key assignment_status_list_of_yojson "AssignmentStatuses")
         _list path;
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     hit_id = value_for_key entity_id_of_yojson "HITId" _list path;
   }
    : list_assignments_for_hit_request)

let get_qualification_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualification_type =
       option_of_yojson (value_for_key qualification_type_of_yojson "QualificationType") _list path;
   }
    : get_qualification_type_response)

let get_qualification_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ qualification_type_id = value_for_key entity_id_of_yojson "QualificationTypeId" _list path }
    : get_qualification_type_request)

let get_qualification_score_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualification =
       option_of_yojson (value_for_key qualification_of_yojson "Qualification") _list path;
   }
    : get_qualification_score_response)

let get_qualification_score_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     worker_id = value_for_key customer_id_of_yojson "WorkerId" _list path;
     qualification_type_id = value_for_key entity_id_of_yojson "QualificationTypeId" _list path;
   }
    : get_qualification_score_request)

let get_hit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hi_t = option_of_yojson (value_for_key hi_t_of_yojson "HIT") _list path } : get_hit_response)

let get_hit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hit_id = value_for_key entity_id_of_yojson "HITId" _list path } : get_hit_request)

let get_file_upload_url_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_upload_ur_l =
       option_of_yojson (value_for_key string__of_yojson "FileUploadURL") _list path;
   }
    : get_file_upload_url_response)

let get_file_upload_url_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     question_identifier = value_for_key string__of_yojson "QuestionIdentifier" _list path;
     assignment_id = value_for_key entity_id_of_yojson "AssignmentId" _list path;
   }
    : get_file_upload_url_request)

let get_assignment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hi_t = option_of_yojson (value_for_key hi_t_of_yojson "HIT") _list path;
     assignment = option_of_yojson (value_for_key assignment_of_yojson "Assignment") _list path;
   }
    : get_assignment_response)

let get_assignment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ assignment_id = value_for_key entity_id_of_yojson "AssignmentId" _list path }
    : get_assignment_request)

let get_account_balance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     on_hold_balance =
       option_of_yojson (value_for_key currency_amount_of_yojson "OnHoldBalance") _list path;
     available_balance =
       option_of_yojson (value_for_key currency_amount_of_yojson "AvailableBalance") _list path;
   }
    : get_account_balance_response)

let get_account_balance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_qualification_from_worker_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_qualification_from_worker_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = option_of_yojson (value_for_key string__of_yojson "Reason") _list path;
     qualification_type_id = value_for_key entity_id_of_yojson "QualificationTypeId" _list path;
     worker_id = value_for_key customer_id_of_yojson "WorkerId" _list path;
   }
    : disassociate_qualification_from_worker_request)

let delete_worker_block_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_worker_block_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = option_of_yojson (value_for_key string__of_yojson "Reason") _list path;
     worker_id = value_for_key customer_id_of_yojson "WorkerId" _list path;
   }
    : delete_worker_block_request)

let delete_qualification_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_qualification_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ qualification_type_id = value_for_key entity_id_of_yojson "QualificationTypeId" _list path }
    : delete_qualification_type_request)

let delete_hit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_hit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hit_id = value_for_key entity_id_of_yojson "HITId" _list path } : delete_hit_request)

let create_worker_block_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_worker_block_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = value_for_key string__of_yojson "Reason" _list path;
     worker_id = value_for_key customer_id_of_yojson "WorkerId" _list path;
   }
    : create_worker_block_request)

let create_qualification_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualification_type =
       option_of_yojson (value_for_key qualification_type_of_yojson "QualificationType") _list path;
   }
    : create_qualification_type_response)

let create_qualification_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_granted_value =
       option_of_yojson (value_for_key integer_of_yojson "AutoGrantedValue") _list path;
     auto_granted = option_of_yojson (value_for_key boolean__of_yojson "AutoGranted") _list path;
     test_duration_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "TestDurationInSeconds") _list path;
     answer_key = option_of_yojson (value_for_key string__of_yojson "AnswerKey") _list path;
     test = option_of_yojson (value_for_key string__of_yojson "Test") _list path;
     retry_delay_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "RetryDelayInSeconds") _list path;
     qualification_type_status =
       value_for_key qualification_type_status_of_yojson "QualificationTypeStatus" _list path;
     description = value_for_key string__of_yojson "Description" _list path;
     keywords = option_of_yojson (value_for_key string__of_yojson "Keywords") _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : create_qualification_type_request)

let create_hit_with_hit_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hi_t = option_of_yojson (value_for_key hi_t_of_yojson "HIT") _list path }
    : create_hit_with_hit_type_response)

let hit_layout_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key string__of_yojson "Value" _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : hit_layout_parameter)

let hit_layout_parameter_list_of_yojson tree path =
  list_of_yojson hit_layout_parameter_of_yojson tree path

let create_hit_with_hit_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hit_layout_parameters =
       option_of_yojson
         (value_for_key hit_layout_parameter_list_of_yojson "HITLayoutParameters")
         _list path;
     hit_layout_id = option_of_yojson (value_for_key entity_id_of_yojson "HITLayoutId") _list path;
     hit_review_policy =
       option_of_yojson (value_for_key review_policy_of_yojson "HITReviewPolicy") _list path;
     assignment_review_policy =
       option_of_yojson (value_for_key review_policy_of_yojson "AssignmentReviewPolicy") _list path;
     unique_request_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "UniqueRequestToken") _list path;
     requester_annotation =
       option_of_yojson (value_for_key string__of_yojson "RequesterAnnotation") _list path;
     question = option_of_yojson (value_for_key string__of_yojson "Question") _list path;
     lifetime_in_seconds = value_for_key long_of_yojson "LifetimeInSeconds" _list path;
     max_assignments =
       option_of_yojson (value_for_key integer_of_yojson "MaxAssignments") _list path;
     hit_type_id = value_for_key entity_id_of_yojson "HITTypeId" _list path;
   }
    : create_hit_with_hit_type_request)

let create_hit_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hit_type_id = option_of_yojson (value_for_key entity_id_of_yojson "HITTypeId") _list path }
    : create_hit_type_response)

let create_hit_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualification_requirements =
       option_of_yojson
         (value_for_key qualification_requirement_list_of_yojson "QualificationRequirements")
         _list path;
     description = value_for_key string__of_yojson "Description" _list path;
     keywords = option_of_yojson (value_for_key string__of_yojson "Keywords") _list path;
     title = value_for_key string__of_yojson "Title" _list path;
     reward = value_for_key currency_amount_of_yojson "Reward" _list path;
     assignment_duration_in_seconds =
       value_for_key long_of_yojson "AssignmentDurationInSeconds" _list path;
     auto_approval_delay_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "AutoApprovalDelayInSeconds") _list path;
   }
    : create_hit_type_request)

let create_hit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hi_t = option_of_yojson (value_for_key hi_t_of_yojson "HIT") _list path }
    : create_hit_response)

let create_hit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hit_layout_parameters =
       option_of_yojson
         (value_for_key hit_layout_parameter_list_of_yojson "HITLayoutParameters")
         _list path;
     hit_layout_id = option_of_yojson (value_for_key entity_id_of_yojson "HITLayoutId") _list path;
     hit_review_policy =
       option_of_yojson (value_for_key review_policy_of_yojson "HITReviewPolicy") _list path;
     assignment_review_policy =
       option_of_yojson (value_for_key review_policy_of_yojson "AssignmentReviewPolicy") _list path;
     unique_request_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "UniqueRequestToken") _list path;
     qualification_requirements =
       option_of_yojson
         (value_for_key qualification_requirement_list_of_yojson "QualificationRequirements")
         _list path;
     requester_annotation =
       option_of_yojson (value_for_key string__of_yojson "RequesterAnnotation") _list path;
     question = option_of_yojson (value_for_key string__of_yojson "Question") _list path;
     description = value_for_key string__of_yojson "Description" _list path;
     keywords = option_of_yojson (value_for_key string__of_yojson "Keywords") _list path;
     title = value_for_key string__of_yojson "Title" _list path;
     reward = value_for_key currency_amount_of_yojson "Reward" _list path;
     assignment_duration_in_seconds =
       value_for_key long_of_yojson "AssignmentDurationInSeconds" _list path;
     lifetime_in_seconds = value_for_key long_of_yojson "LifetimeInSeconds" _list path;
     auto_approval_delay_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "AutoApprovalDelayInSeconds") _list path;
     max_assignments =
       option_of_yojson (value_for_key integer_of_yojson "MaxAssignments") _list path;
   }
    : create_hit_request)

let create_additional_assignments_for_hit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_additional_assignments_for_hit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unique_request_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "UniqueRequestToken") _list path;
     number_of_additional_assignments =
       value_for_key integer_of_yojson "NumberOfAdditionalAssignments" _list path;
     hit_id = value_for_key entity_id_of_yojson "HITId" _list path;
   }
    : create_additional_assignments_for_hit_request)

let associate_qualification_with_worker_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_qualification_with_worker_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     send_notification =
       option_of_yojson (value_for_key boolean__of_yojson "SendNotification") _list path;
     integer_value = option_of_yojson (value_for_key integer_of_yojson "IntegerValue") _list path;
     worker_id = value_for_key customer_id_of_yojson "WorkerId" _list path;
     qualification_type_id = value_for_key entity_id_of_yojson "QualificationTypeId" _list path;
   }
    : associate_qualification_with_worker_request)

let approve_assignment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let approve_assignment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     override_rejection =
       option_of_yojson (value_for_key boolean__of_yojson "OverrideRejection") _list path;
     requester_feedback =
       option_of_yojson (value_for_key string__of_yojson "RequesterFeedback") _list path;
     assignment_id = value_for_key entity_id_of_yojson "AssignmentId" _list path;
   }
    : approve_assignment_request)

let accept_qualification_request_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let accept_qualification_request_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     integer_value = option_of_yojson (value_for_key integer_of_yojson "IntegerValue") _list path;
     qualification_request_id = value_for_key string__of_yojson "QualificationRequestId" _list path;
   }
    : accept_qualification_request_request)
