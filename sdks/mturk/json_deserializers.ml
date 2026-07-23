open Smaws_Lib.Json.DeserializeHelpers
open Types

let turk_error_code_of_yojson = string_of_yojson
let exception_message_of_yojson = string_of_yojson

let service_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     turk_error_code =
       option_of_yojson (value_for_key turk_error_code_of_yojson "TurkErrorCode") _list path;
   }
    : service_fault)

let request_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     turk_error_code =
       option_of_yojson (value_for_key turk_error_code_of_yojson "TurkErrorCode") _list path;
   }
    : request_error)

let accept_qualification_request_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let integer_of_yojson = int_of_yojson
let string__of_yojson = string_of_yojson

let accept_qualification_request_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualification_request_id = value_for_key string__of_yojson "QualificationRequestId" _list path;
     integer_value = option_of_yojson (value_for_key integer_of_yojson "IntegerValue") _list path;
   }
    : accept_qualification_request_request)

let approve_assignment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let boolean__of_yojson = bool_of_yojson
let entity_id_of_yojson = string_of_yojson

let approve_assignment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assignment_id = value_for_key entity_id_of_yojson "AssignmentId" _list path;
     requester_feedback =
       option_of_yojson (value_for_key string__of_yojson "RequesterFeedback") _list path;
     override_rejection =
       option_of_yojson (value_for_key boolean__of_yojson "OverrideRejection") _list path;
   }
    : approve_assignment_request)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let assignment_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Submitted" -> Submitted
    | `String "Approved" -> Approved
    | `String "Rejected" -> Rejected
    | `String value -> raise (deserialize_unknown_enum_value_error path "AssignmentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AssignmentStatus")
     : assignment_status)
    : assignment_status)

let customer_id_of_yojson = string_of_yojson

let assignment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assignment_id = option_of_yojson (value_for_key entity_id_of_yojson "AssignmentId") _list path;
     worker_id = option_of_yojson (value_for_key customer_id_of_yojson "WorkerId") _list path;
     hit_id = option_of_yojson (value_for_key entity_id_of_yojson "HITId") _list path;
     assignment_status =
       option_of_yojson (value_for_key assignment_status_of_yojson "AssignmentStatus") _list path;
     auto_approval_time =
       option_of_yojson (value_for_key timestamp_of_yojson "AutoApprovalTime") _list path;
     accept_time = option_of_yojson (value_for_key timestamp_of_yojson "AcceptTime") _list path;
     submit_time = option_of_yojson (value_for_key timestamp_of_yojson "SubmitTime") _list path;
     approval_time = option_of_yojson (value_for_key timestamp_of_yojson "ApprovalTime") _list path;
     rejection_time =
       option_of_yojson (value_for_key timestamp_of_yojson "RejectionTime") _list path;
     deadline = option_of_yojson (value_for_key timestamp_of_yojson "Deadline") _list path;
     answer = option_of_yojson (value_for_key string__of_yojson "Answer") _list path;
     requester_feedback =
       option_of_yojson (value_for_key string__of_yojson "RequesterFeedback") _list path;
   }
    : assignment)

let assignment_list_of_yojson tree path = list_of_yojson assignment_of_yojson tree path

let assignment_status_list_of_yojson tree path =
  list_of_yojson assignment_status_of_yojson tree path

let associate_qualification_with_worker_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_qualification_with_worker_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualification_type_id = value_for_key entity_id_of_yojson "QualificationTypeId" _list path;
     worker_id = value_for_key customer_id_of_yojson "WorkerId" _list path;
     integer_value = option_of_yojson (value_for_key integer_of_yojson "IntegerValue") _list path;
     send_notification =
       option_of_yojson (value_for_key boolean__of_yojson "SendNotification") _list path;
   }
    : associate_qualification_with_worker_request)

let currency_amount_of_yojson = string_of_yojson

let bonus_payment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     worker_id = option_of_yojson (value_for_key customer_id_of_yojson "WorkerId") _list path;
     bonus_amount =
       option_of_yojson (value_for_key currency_amount_of_yojson "BonusAmount") _list path;
     assignment_id = option_of_yojson (value_for_key entity_id_of_yojson "AssignmentId") _list path;
     reason = option_of_yojson (value_for_key string__of_yojson "Reason") _list path;
     grant_time = option_of_yojson (value_for_key timestamp_of_yojson "GrantTime") _list path;
   }
    : bonus_payment)

let bonus_payment_list_of_yojson tree path = list_of_yojson bonus_payment_of_yojson tree path

let comparator_of_yojson (tree : t) path =
  ((match tree with
    | `String "LessThan" -> LessThan
    | `String "LessThanOrEqualTo" -> LessThanOrEqualTo
    | `String "GreaterThan" -> GreaterThan
    | `String "GreaterThanOrEqualTo" -> GreaterThanOrEqualTo
    | `String "EqualTo" -> EqualTo
    | `String "NotEqualTo" -> NotEqualTo
    | `String "Exists" -> Exists
    | `String "DoesNotExist" -> DoesNotExist
    | `String "In" -> In
    | `String "NotIn" -> NotIn
    | `String value -> raise (deserialize_unknown_enum_value_error path "Comparator" value)
    | _ -> raise (deserialize_wrong_type_error path "Comparator")
     : comparator)
    : comparator)

let country_parameters_of_yojson = string_of_yojson

let create_additional_assignments_for_hit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let idempotency_token_of_yojson = string_of_yojson

let create_additional_assignments_for_hit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hit_id = value_for_key entity_id_of_yojson "HITId" _list path;
     number_of_additional_assignments =
       value_for_key integer_of_yojson "NumberOfAdditionalAssignments" _list path;
     unique_request_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "UniqueRequestToken") _list path;
   }
    : create_additional_assignments_for_hit_request)

let hit_review_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "NotReviewed" -> NotReviewed
    | `String "MarkedForReview" -> MarkedForReview
    | `String "ReviewedAppropriate" -> ReviewedAppropriate
    | `String "ReviewedInappropriate" -> ReviewedInappropriate
    | `String value -> raise (deserialize_unknown_enum_value_error path "HITReviewStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "HITReviewStatus")
     : hit_review_status)
    : hit_review_status)

let hit_access_actions_of_yojson (tree : t) path =
  ((match tree with
    | `String "Accept" -> Accept
    | `String "PreviewAndAccept" -> PreviewAndAccept
    | `String "DiscoverPreviewAndAccept" -> DiscoverPreviewAndAccept
    | `String value -> raise (deserialize_unknown_enum_value_error path "HITAccessActions" value)
    | _ -> raise (deserialize_wrong_type_error path "HITAccessActions")
     : hit_access_actions)
    : hit_access_actions)

let locale_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     country = value_for_key country_parameters_of_yojson "Country" _list path;
     subdivision =
       option_of_yojson (value_for_key country_parameters_of_yojson "Subdivision") _list path;
   }
    : locale)

let locale_list_of_yojson tree path = list_of_yojson locale_of_yojson tree path
let integer_list_of_yojson tree path = list_of_yojson integer_of_yojson tree path

let qualification_requirement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualification_type_id = value_for_key string__of_yojson "QualificationTypeId" _list path;
     comparator = value_for_key comparator_of_yojson "Comparator" _list path;
     integer_values =
       option_of_yojson (value_for_key integer_list_of_yojson "IntegerValues") _list path;
     locale_values =
       option_of_yojson (value_for_key locale_list_of_yojson "LocaleValues") _list path;
     required_to_preview =
       option_of_yojson (value_for_key boolean__of_yojson "RequiredToPreview") _list path;
     actions_guarded =
       option_of_yojson (value_for_key hit_access_actions_of_yojson "ActionsGuarded") _list path;
   }
    : qualification_requirement)

let qualification_requirement_list_of_yojson tree path =
  list_of_yojson qualification_requirement_of_yojson tree path

let long_of_yojson = long_of_yojson

let hit_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Assignable" -> Assignable
    | `String "Unassignable" -> Unassignable
    | `String "Reviewable" -> Reviewable
    | `String "Reviewing" -> Reviewing
    | `String "Disposed" -> Disposed
    | `String value -> raise (deserialize_unknown_enum_value_error path "HITStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "HITStatus")
     : hit_status)
    : hit_status)

let hi_t_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hit_id = option_of_yojson (value_for_key entity_id_of_yojson "HITId") _list path;
     hit_type_id = option_of_yojson (value_for_key entity_id_of_yojson "HITTypeId") _list path;
     hit_group_id = option_of_yojson (value_for_key entity_id_of_yojson "HITGroupId") _list path;
     hit_layout_id = option_of_yojson (value_for_key entity_id_of_yojson "HITLayoutId") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     title = option_of_yojson (value_for_key string__of_yojson "Title") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     question = option_of_yojson (value_for_key string__of_yojson "Question") _list path;
     keywords = option_of_yojson (value_for_key string__of_yojson "Keywords") _list path;
     hit_status = option_of_yojson (value_for_key hit_status_of_yojson "HITStatus") _list path;
     max_assignments =
       option_of_yojson (value_for_key integer_of_yojson "MaxAssignments") _list path;
     reward = option_of_yojson (value_for_key currency_amount_of_yojson "Reward") _list path;
     auto_approval_delay_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "AutoApprovalDelayInSeconds") _list path;
     expiration = option_of_yojson (value_for_key timestamp_of_yojson "Expiration") _list path;
     assignment_duration_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "AssignmentDurationInSeconds") _list path;
     requester_annotation =
       option_of_yojson (value_for_key string__of_yojson "RequesterAnnotation") _list path;
     qualification_requirements =
       option_of_yojson
         (value_for_key qualification_requirement_list_of_yojson "QualificationRequirements")
         _list path;
     hit_review_status =
       option_of_yojson (value_for_key hit_review_status_of_yojson "HITReviewStatus") _list path;
     number_of_assignments_pending =
       option_of_yojson (value_for_key integer_of_yojson "NumberOfAssignmentsPending") _list path;
     number_of_assignments_available =
       option_of_yojson (value_for_key integer_of_yojson "NumberOfAssignmentsAvailable") _list path;
     number_of_assignments_completed =
       option_of_yojson (value_for_key integer_of_yojson "NumberOfAssignmentsCompleted") _list path;
   }
    : hi_t)

let create_hit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hi_t = option_of_yojson (value_for_key hi_t_of_yojson "HIT") _list path }
    : create_hit_response)

let hit_layout_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key string__of_yojson "Name" _list path;
     value = value_for_key string__of_yojson "Value" _list path;
   }
    : hit_layout_parameter)

let hit_layout_parameter_list_of_yojson tree path =
  list_of_yojson hit_layout_parameter_of_yojson tree path

let string_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let parameter_map_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key string__of_yojson "Key") _list path;
     values = option_of_yojson (value_for_key string_list_of_yojson "Values") _list path;
   }
    : parameter_map_entry)

let parameter_map_entry_list_of_yojson tree path =
  list_of_yojson parameter_map_entry_of_yojson tree path

let policy_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key string__of_yojson "Key") _list path;
     values = option_of_yojson (value_for_key string_list_of_yojson "Values") _list path;
     map_entries =
       option_of_yojson (value_for_key parameter_map_entry_list_of_yojson "MapEntries") _list path;
   }
    : policy_parameter)

let policy_parameter_list_of_yojson tree path = list_of_yojson policy_parameter_of_yojson tree path

let review_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_name = value_for_key string__of_yojson "PolicyName" _list path;
     parameters =
       option_of_yojson (value_for_key policy_parameter_list_of_yojson "Parameters") _list path;
   }
    : review_policy)

let create_hit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_assignments =
       option_of_yojson (value_for_key integer_of_yojson "MaxAssignments") _list path;
     auto_approval_delay_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "AutoApprovalDelayInSeconds") _list path;
     lifetime_in_seconds = value_for_key long_of_yojson "LifetimeInSeconds" _list path;
     assignment_duration_in_seconds =
       value_for_key long_of_yojson "AssignmentDurationInSeconds" _list path;
     reward = value_for_key currency_amount_of_yojson "Reward" _list path;
     title = value_for_key string__of_yojson "Title" _list path;
     keywords = option_of_yojson (value_for_key string__of_yojson "Keywords") _list path;
     description = value_for_key string__of_yojson "Description" _list path;
     question = option_of_yojson (value_for_key string__of_yojson "Question") _list path;
     requester_annotation =
       option_of_yojson (value_for_key string__of_yojson "RequesterAnnotation") _list path;
     qualification_requirements =
       option_of_yojson
         (value_for_key qualification_requirement_list_of_yojson "QualificationRequirements")
         _list path;
     unique_request_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "UniqueRequestToken") _list path;
     assignment_review_policy =
       option_of_yojson (value_for_key review_policy_of_yojson "AssignmentReviewPolicy") _list path;
     hit_review_policy =
       option_of_yojson (value_for_key review_policy_of_yojson "HITReviewPolicy") _list path;
     hit_layout_id = option_of_yojson (value_for_key entity_id_of_yojson "HITLayoutId") _list path;
     hit_layout_parameters =
       option_of_yojson
         (value_for_key hit_layout_parameter_list_of_yojson "HITLayoutParameters")
         _list path;
   }
    : create_hit_request)

let create_hit_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hit_type_id = option_of_yojson (value_for_key entity_id_of_yojson "HITTypeId") _list path }
    : create_hit_type_response)

let create_hit_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_approval_delay_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "AutoApprovalDelayInSeconds") _list path;
     assignment_duration_in_seconds =
       value_for_key long_of_yojson "AssignmentDurationInSeconds" _list path;
     reward = value_for_key currency_amount_of_yojson "Reward" _list path;
     title = value_for_key string__of_yojson "Title" _list path;
     keywords = option_of_yojson (value_for_key string__of_yojson "Keywords") _list path;
     description = value_for_key string__of_yojson "Description" _list path;
     qualification_requirements =
       option_of_yojson
         (value_for_key qualification_requirement_list_of_yojson "QualificationRequirements")
         _list path;
   }
    : create_hit_type_request)

let create_hit_with_hit_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hi_t = option_of_yojson (value_for_key hi_t_of_yojson "HIT") _list path }
    : create_hit_with_hit_type_response)

let create_hit_with_hit_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hit_type_id = value_for_key entity_id_of_yojson "HITTypeId" _list path;
     max_assignments =
       option_of_yojson (value_for_key integer_of_yojson "MaxAssignments") _list path;
     lifetime_in_seconds = value_for_key long_of_yojson "LifetimeInSeconds" _list path;
     question = option_of_yojson (value_for_key string__of_yojson "Question") _list path;
     requester_annotation =
       option_of_yojson (value_for_key string__of_yojson "RequesterAnnotation") _list path;
     unique_request_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "UniqueRequestToken") _list path;
     assignment_review_policy =
       option_of_yojson (value_for_key review_policy_of_yojson "AssignmentReviewPolicy") _list path;
     hit_review_policy =
       option_of_yojson (value_for_key review_policy_of_yojson "HITReviewPolicy") _list path;
     hit_layout_id = option_of_yojson (value_for_key entity_id_of_yojson "HITLayoutId") _list path;
     hit_layout_parameters =
       option_of_yojson
         (value_for_key hit_layout_parameter_list_of_yojson "HITLayoutParameters")
         _list path;
   }
    : create_hit_with_hit_type_request)

let qualification_type_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Active" -> Active
    | `String "Inactive" -> Inactive
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "QualificationTypeStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "QualificationTypeStatus")
     : qualification_type_status)
    : qualification_type_status)

let qualification_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualification_type_id =
       option_of_yojson (value_for_key entity_id_of_yojson "QualificationTypeId") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     keywords = option_of_yojson (value_for_key string__of_yojson "Keywords") _list path;
     qualification_type_status =
       option_of_yojson
         (value_for_key qualification_type_status_of_yojson "QualificationTypeStatus")
         _list path;
     test = option_of_yojson (value_for_key string__of_yojson "Test") _list path;
     test_duration_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "TestDurationInSeconds") _list path;
     answer_key = option_of_yojson (value_for_key string__of_yojson "AnswerKey") _list path;
     retry_delay_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "RetryDelayInSeconds") _list path;
     is_requestable = option_of_yojson (value_for_key boolean__of_yojson "IsRequestable") _list path;
     auto_granted = option_of_yojson (value_for_key boolean__of_yojson "AutoGranted") _list path;
     auto_granted_value =
       option_of_yojson (value_for_key integer_of_yojson "AutoGrantedValue") _list path;
   }
    : qualification_type)

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
     name = value_for_key string__of_yojson "Name" _list path;
     keywords = option_of_yojson (value_for_key string__of_yojson "Keywords") _list path;
     description = value_for_key string__of_yojson "Description" _list path;
     qualification_type_status =
       value_for_key qualification_type_status_of_yojson "QualificationTypeStatus" _list path;
     retry_delay_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "RetryDelayInSeconds") _list path;
     test = option_of_yojson (value_for_key string__of_yojson "Test") _list path;
     answer_key = option_of_yojson (value_for_key string__of_yojson "AnswerKey") _list path;
     test_duration_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "TestDurationInSeconds") _list path;
     auto_granted = option_of_yojson (value_for_key boolean__of_yojson "AutoGranted") _list path;
     auto_granted_value =
       option_of_yojson (value_for_key integer_of_yojson "AutoGrantedValue") _list path;
   }
    : create_qualification_type_request)

let create_worker_block_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_worker_block_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     worker_id = value_for_key customer_id_of_yojson "WorkerId" _list path;
     reason = value_for_key string__of_yojson "Reason" _list path;
   }
    : create_worker_block_request)

let customer_id_list_of_yojson tree path = list_of_yojson customer_id_of_yojson tree path

let delete_hit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_hit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hit_id = value_for_key entity_id_of_yojson "HITId" _list path } : delete_hit_request)

let delete_qualification_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_qualification_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ qualification_type_id = value_for_key entity_id_of_yojson "QualificationTypeId" _list path }
    : delete_qualification_type_request)

let delete_worker_block_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_worker_block_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     worker_id = value_for_key customer_id_of_yojson "WorkerId" _list path;
     reason = option_of_yojson (value_for_key string__of_yojson "Reason") _list path;
   }
    : delete_worker_block_request)

let disassociate_qualification_from_worker_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_qualification_from_worker_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     worker_id = value_for_key customer_id_of_yojson "WorkerId" _list path;
     qualification_type_id = value_for_key entity_id_of_yojson "QualificationTypeId" _list path;
     reason = option_of_yojson (value_for_key string__of_yojson "Reason") _list path;
   }
    : disassociate_qualification_from_worker_request)

let event_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AssignmentAccepted" -> AssignmentAccepted
    | `String "AssignmentAbandoned" -> AssignmentAbandoned
    | `String "AssignmentReturned" -> AssignmentReturned
    | `String "AssignmentSubmitted" -> AssignmentSubmitted
    | `String "AssignmentRejected" -> AssignmentRejected
    | `String "AssignmentApproved" -> AssignmentApproved
    | `String "HITCreated" -> HITCreated
    | `String "HITExpired" -> HITExpired
    | `String "HITReviewable" -> HITReviewable
    | `String "HITExtended" -> HITExtended
    | `String "HITDisposed" -> HITDisposed
    | `String "Ping" -> Ping
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventType" value)
    | _ -> raise (deserialize_wrong_type_error path "EventType")
     : event_type)
    : event_type)

let event_type_list_of_yojson tree path = list_of_yojson event_type_of_yojson tree path

let get_account_balance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     available_balance =
       option_of_yojson (value_for_key currency_amount_of_yojson "AvailableBalance") _list path;
     on_hold_balance =
       option_of_yojson (value_for_key currency_amount_of_yojson "OnHoldBalance") _list path;
   }
    : get_account_balance_response)

let get_account_balance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let get_assignment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assignment = option_of_yojson (value_for_key assignment_of_yojson "Assignment") _list path;
     hi_t = option_of_yojson (value_for_key hi_t_of_yojson "HIT") _list path;
   }
    : get_assignment_response)

let get_assignment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ assignment_id = value_for_key entity_id_of_yojson "AssignmentId" _list path }
    : get_assignment_request)

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
     assignment_id = value_for_key entity_id_of_yojson "AssignmentId" _list path;
     question_identifier = value_for_key string__of_yojson "QuestionIdentifier" _list path;
   }
    : get_file_upload_url_request)

let get_hit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hi_t = option_of_yojson (value_for_key hi_t_of_yojson "HIT") _list path } : get_hit_response)

let get_hit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hit_id = value_for_key entity_id_of_yojson "HITId" _list path } : get_hit_request)

let qualification_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Granted" -> Granted
    | `String "Revoked" -> Revoked
    | `String value -> raise (deserialize_unknown_enum_value_error path "QualificationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "QualificationStatus")
     : qualification_status)
    : qualification_status)

let qualification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualification_type_id =
       option_of_yojson (value_for_key entity_id_of_yojson "QualificationTypeId") _list path;
     worker_id = option_of_yojson (value_for_key customer_id_of_yojson "WorkerId") _list path;
     grant_time = option_of_yojson (value_for_key timestamp_of_yojson "GrantTime") _list path;
     integer_value = option_of_yojson (value_for_key integer_of_yojson "IntegerValue") _list path;
     locale_value = option_of_yojson (value_for_key locale_of_yojson "LocaleValue") _list path;
     status = option_of_yojson (value_for_key qualification_status_of_yojson "Status") _list path;
   }
    : qualification)

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
     qualification_type_id = value_for_key entity_id_of_yojson "QualificationTypeId" _list path;
     worker_id = value_for_key customer_id_of_yojson "WorkerId" _list path;
   }
    : get_qualification_score_request)

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

let hit_list_of_yojson tree path = list_of_yojson hi_t_of_yojson tree path
let pagination_token_of_yojson = string_of_yojson

let list_assignments_for_hit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     num_results = option_of_yojson (value_for_key integer_of_yojson "NumResults") _list path;
     assignments =
       option_of_yojson (value_for_key assignment_list_of_yojson "Assignments") _list path;
   }
    : list_assignments_for_hit_response)

let result_size_of_yojson = int_of_yojson

let list_assignments_for_hit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hit_id = value_for_key entity_id_of_yojson "HITId" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
     assignment_statuses =
       option_of_yojson
         (value_for_key assignment_status_list_of_yojson "AssignmentStatuses")
         _list path;
   }
    : list_assignments_for_hit_request)

let list_bonus_payments_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     num_results = option_of_yojson (value_for_key integer_of_yojson "NumResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     bonus_payments =
       option_of_yojson (value_for_key bonus_payment_list_of_yojson "BonusPayments") _list path;
   }
    : list_bonus_payments_response)

let list_bonus_payments_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hit_id = option_of_yojson (value_for_key entity_id_of_yojson "HITId") _list path;
     assignment_id = option_of_yojson (value_for_key entity_id_of_yojson "AssignmentId") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
   }
    : list_bonus_payments_request)

let list_hi_ts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     num_results = option_of_yojson (value_for_key integer_of_yojson "NumResults") _list path;
     hi_ts = option_of_yojson (value_for_key hit_list_of_yojson "HITs") _list path;
   }
    : list_hi_ts_response)

let list_hi_ts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
   }
    : list_hi_ts_request)

let list_hi_ts_for_qualification_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     num_results = option_of_yojson (value_for_key integer_of_yojson "NumResults") _list path;
     hi_ts = option_of_yojson (value_for_key hit_list_of_yojson "HITs") _list path;
   }
    : list_hi_ts_for_qualification_type_response)

let list_hi_ts_for_qualification_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualification_type_id = value_for_key entity_id_of_yojson "QualificationTypeId" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
   }
    : list_hi_ts_for_qualification_type_request)

let qualification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualification_request_id =
       option_of_yojson (value_for_key string__of_yojson "QualificationRequestId") _list path;
     qualification_type_id =
       option_of_yojson (value_for_key entity_id_of_yojson "QualificationTypeId") _list path;
     worker_id = option_of_yojson (value_for_key customer_id_of_yojson "WorkerId") _list path;
     test = option_of_yojson (value_for_key string__of_yojson "Test") _list path;
     answer = option_of_yojson (value_for_key string__of_yojson "Answer") _list path;
     submit_time = option_of_yojson (value_for_key timestamp_of_yojson "SubmitTime") _list path;
   }
    : qualification_request)

let qualification_request_list_of_yojson tree path =
  list_of_yojson qualification_request_of_yojson tree path

let list_qualification_requests_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     num_results = option_of_yojson (value_for_key integer_of_yojson "NumResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     qualification_requests =
       option_of_yojson
         (value_for_key qualification_request_list_of_yojson "QualificationRequests")
         _list path;
   }
    : list_qualification_requests_response)

let list_qualification_requests_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualification_type_id =
       option_of_yojson (value_for_key entity_id_of_yojson "QualificationTypeId") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
   }
    : list_qualification_requests_request)

let qualification_type_list_of_yojson tree path =
  list_of_yojson qualification_type_of_yojson tree path

let list_qualification_types_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     num_results = option_of_yojson (value_for_key integer_of_yojson "NumResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     qualification_types =
       option_of_yojson
         (value_for_key qualification_type_list_of_yojson "QualificationTypes")
         _list path;
   }
    : list_qualification_types_response)

let list_qualification_types_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query = option_of_yojson (value_for_key string__of_yojson "Query") _list path;
     must_be_requestable = value_for_key boolean__of_yojson "MustBeRequestable" _list path;
     must_be_owned_by_caller =
       option_of_yojson (value_for_key boolean__of_yojson "MustBeOwnedByCaller") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
   }
    : list_qualification_types_request)

let review_action_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Intended" -> Intended
    | `String "Succeeded" -> Succeeded
    | `String "Failed" -> Failed
    | `String "Cancelled" -> Cancelled
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReviewActionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ReviewActionStatus")
     : review_action_status)
    : review_action_status)

let review_action_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_id = option_of_yojson (value_for_key entity_id_of_yojson "ActionId") _list path;
     action_name = option_of_yojson (value_for_key string__of_yojson "ActionName") _list path;
     target_id = option_of_yojson (value_for_key entity_id_of_yojson "TargetId") _list path;
     target_type = option_of_yojson (value_for_key string__of_yojson "TargetType") _list path;
     status = option_of_yojson (value_for_key review_action_status_of_yojson "Status") _list path;
     complete_time = option_of_yojson (value_for_key timestamp_of_yojson "CompleteTime") _list path;
     result_ = option_of_yojson (value_for_key string__of_yojson "Result") _list path;
     error_code = option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list path;
   }
    : review_action_detail)

let review_action_detail_list_of_yojson tree path =
  list_of_yojson review_action_detail_of_yojson tree path

let review_result_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_id = option_of_yojson (value_for_key entity_id_of_yojson "ActionId") _list path;
     subject_id = option_of_yojson (value_for_key entity_id_of_yojson "SubjectId") _list path;
     subject_type = option_of_yojson (value_for_key string__of_yojson "SubjectType") _list path;
     question_id = option_of_yojson (value_for_key entity_id_of_yojson "QuestionId") _list path;
     key = option_of_yojson (value_for_key string__of_yojson "Key") _list path;
     value = option_of_yojson (value_for_key string__of_yojson "Value") _list path;
   }
    : review_result_detail)

let review_result_detail_list_of_yojson tree path =
  list_of_yojson review_result_detail_of_yojson tree path

let review_report_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     review_results =
       option_of_yojson
         (value_for_key review_result_detail_list_of_yojson "ReviewResults")
         _list path;
     review_actions =
       option_of_yojson
         (value_for_key review_action_detail_list_of_yojson "ReviewActions")
         _list path;
   }
    : review_report)

let list_review_policy_results_for_hit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hit_id = option_of_yojson (value_for_key entity_id_of_yojson "HITId") _list path;
     assignment_review_policy =
       option_of_yojson (value_for_key review_policy_of_yojson "AssignmentReviewPolicy") _list path;
     hit_review_policy =
       option_of_yojson (value_for_key review_policy_of_yojson "HITReviewPolicy") _list path;
     assignment_review_report =
       option_of_yojson (value_for_key review_report_of_yojson "AssignmentReviewReport") _list path;
     hit_review_report =
       option_of_yojson (value_for_key review_report_of_yojson "HITReviewReport") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_review_policy_results_for_hit_response)

let review_policy_level_of_yojson (tree : t) path =
  ((match tree with
    | `String "Assignment" -> Assignment
    | `String "HIT" -> HIT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReviewPolicyLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "ReviewPolicyLevel")
     : review_policy_level)
    : review_policy_level)

let review_policy_level_list_of_yojson tree path =
  list_of_yojson review_policy_level_of_yojson tree path

let list_review_policy_results_for_hit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hit_id = value_for_key entity_id_of_yojson "HITId" _list path;
     policy_levels =
       option_of_yojson (value_for_key review_policy_level_list_of_yojson "PolicyLevels") _list path;
     retrieve_actions =
       option_of_yojson (value_for_key boolean__of_yojson "RetrieveActions") _list path;
     retrieve_results =
       option_of_yojson (value_for_key boolean__of_yojson "RetrieveResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
   }
    : list_review_policy_results_for_hit_request)

let list_reviewable_hi_ts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     num_results = option_of_yojson (value_for_key integer_of_yojson "NumResults") _list path;
     hi_ts = option_of_yojson (value_for_key hit_list_of_yojson "HITs") _list path;
   }
    : list_reviewable_hi_ts_response)

let reviewable_hit_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Reviewable" -> Reviewable
    | `String "Reviewing" -> Reviewing
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReviewableHITStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ReviewableHITStatus")
     : reviewable_hit_status)
    : reviewable_hit_status)

let list_reviewable_hi_ts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hit_type_id = option_of_yojson (value_for_key entity_id_of_yojson "HITTypeId") _list path;
     status = option_of_yojson (value_for_key reviewable_hit_status_of_yojson "Status") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
   }
    : list_reviewable_hi_ts_request)

let worker_block_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     worker_id = option_of_yojson (value_for_key customer_id_of_yojson "WorkerId") _list path;
     reason = option_of_yojson (value_for_key string__of_yojson "Reason") _list path;
   }
    : worker_block)

let worker_block_list_of_yojson tree path = list_of_yojson worker_block_of_yojson tree path

let list_worker_blocks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     num_results = option_of_yojson (value_for_key integer_of_yojson "NumResults") _list path;
     worker_blocks =
       option_of_yojson (value_for_key worker_block_list_of_yojson "WorkerBlocks") _list path;
   }
    : list_worker_blocks_response)

let list_worker_blocks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
   }
    : list_worker_blocks_request)

let qualification_list_of_yojson tree path = list_of_yojson qualification_of_yojson tree path

let list_workers_with_qualification_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     num_results = option_of_yojson (value_for_key integer_of_yojson "NumResults") _list path;
     qualifications =
       option_of_yojson (value_for_key qualification_list_of_yojson "Qualifications") _list path;
   }
    : list_workers_with_qualification_type_response)

let list_workers_with_qualification_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualification_type_id = value_for_key entity_id_of_yojson "QualificationTypeId" _list path;
     status = option_of_yojson (value_for_key qualification_status_of_yojson "Status") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key result_size_of_yojson "MaxResults") _list path;
   }
    : list_workers_with_qualification_type_request)

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
     qualification_type_id = value_for_key entity_id_of_yojson "QualificationTypeId" _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     qualification_type_status =
       option_of_yojson
         (value_for_key qualification_type_status_of_yojson "QualificationTypeStatus")
         _list path;
     test = option_of_yojson (value_for_key string__of_yojson "Test") _list path;
     answer_key = option_of_yojson (value_for_key string__of_yojson "AnswerKey") _list path;
     test_duration_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "TestDurationInSeconds") _list path;
     retry_delay_in_seconds =
       option_of_yojson (value_for_key long_of_yojson "RetryDelayInSeconds") _list path;
     auto_granted = option_of_yojson (value_for_key boolean__of_yojson "AutoGranted") _list path;
     auto_granted_value =
       option_of_yojson (value_for_key integer_of_yojson "AutoGrantedValue") _list path;
   }
    : update_qualification_type_request)

let update_notification_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let notification_transport_of_yojson (tree : t) path =
  ((match tree with
    | `String "Email" -> Email
    | `String "SQS" -> SQS
    | `String "SNS" -> SNS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NotificationTransport" value)
    | _ -> raise (deserialize_wrong_type_error path "NotificationTransport")
     : notification_transport)
    : notification_transport)

let notification_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination = value_for_key string__of_yojson "Destination" _list path;
     transport = value_for_key notification_transport_of_yojson "Transport" _list path;
     version = value_for_key string__of_yojson "Version" _list path;
     event_types = value_for_key event_type_list_of_yojson "EventTypes" _list path;
   }
    : notification_specification)

let update_notification_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hit_type_id = value_for_key entity_id_of_yojson "HITTypeId" _list path;
     notification =
       option_of_yojson
         (value_for_key notification_specification_of_yojson "Notification")
         _list path;
     active = option_of_yojson (value_for_key boolean__of_yojson "Active") _list path;
   }
    : update_notification_settings_request)

let update_hit_type_of_hit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_hit_type_of_hit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hit_id = value_for_key entity_id_of_yojson "HITId" _list path;
     hit_type_id = value_for_key entity_id_of_yojson "HITTypeId" _list path;
   }
    : update_hit_type_of_hit_request)

let update_hit_review_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_hit_review_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hit_id = value_for_key entity_id_of_yojson "HITId" _list path;
     revert = option_of_yojson (value_for_key boolean__of_yojson "Revert") _list path;
   }
    : update_hit_review_status_request)

let update_expiration_for_hit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_expiration_for_hit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hit_id = value_for_key entity_id_of_yojson "HITId" _list path;
     expire_at = value_for_key timestamp_of_yojson "ExpireAt" _list path;
   }
    : update_expiration_for_hit_request)

let send_test_event_notification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let send_test_event_notification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notification = value_for_key notification_specification_of_yojson "Notification" _list path;
     test_event_type = value_for_key event_type_of_yojson "TestEventType" _list path;
   }
    : send_test_event_notification_request)

let send_bonus_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let send_bonus_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     worker_id = value_for_key customer_id_of_yojson "WorkerId" _list path;
     bonus_amount = value_for_key currency_amount_of_yojson "BonusAmount" _list path;
     assignment_id = value_for_key entity_id_of_yojson "AssignmentId" _list path;
     reason = value_for_key string__of_yojson "Reason" _list path;
     unique_request_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "UniqueRequestToken") _list path;
   }
    : send_bonus_request)

let reject_qualification_request_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let reject_qualification_request_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualification_request_id = value_for_key string__of_yojson "QualificationRequestId" _list path;
     reason = option_of_yojson (value_for_key string__of_yojson "Reason") _list path;
   }
    : reject_qualification_request_request)

let reject_assignment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let reject_assignment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assignment_id = value_for_key entity_id_of_yojson "AssignmentId" _list path;
     requester_feedback = value_for_key string__of_yojson "RequesterFeedback" _list path;
   }
    : reject_assignment_request)

let notify_workers_failure_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "SoftFailure" -> SoftFailure
    | `String "HardFailure" -> HardFailure
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NotifyWorkersFailureCode" value)
    | _ -> raise (deserialize_wrong_type_error path "NotifyWorkersFailureCode")
     : notify_workers_failure_code)
    : notify_workers_failure_code)

let notify_workers_failure_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notify_workers_failure_code =
       option_of_yojson
         (value_for_key notify_workers_failure_code_of_yojson "NotifyWorkersFailureCode")
         _list path;
     notify_workers_failure_message =
       option_of_yojson (value_for_key string__of_yojson "NotifyWorkersFailureMessage") _list path;
     worker_id = option_of_yojson (value_for_key customer_id_of_yojson "WorkerId") _list path;
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

let notify_workers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subject = value_for_key string__of_yojson "Subject" _list path;
     message_text = value_for_key string__of_yojson "MessageText" _list path;
     worker_ids = value_for_key customer_id_list_of_yojson "WorkerIds" _list path;
   }
    : notify_workers_request)
