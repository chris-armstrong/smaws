open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson

let already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : already_exists_exception)

let request_token_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : request_token_not_found_exception)

let concurrent_modification_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : concurrent_modification_exception)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let handler_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "NotUpdatable" -> NOT_UPDATABLE
    | `String "InvalidRequest" -> INVALID_REQUEST
    | `String "AccessDenied" -> ACCESS_DENIED
    | `String "UnauthorizedTaggingOperation" -> UNAUTHORIZED_TAGGING_OPERATION
    | `String "InvalidCredentials" -> INVALID_CREDENTIALS
    | `String "AlreadyExists" -> ALREADY_EXISTS
    | `String "NotFound" -> NOT_FOUND
    | `String "ResourceConflict" -> RESOURCE_CONFLICT
    | `String "Throttling" -> THROTTLING
    | `String "ServiceLimitExceeded" -> SERVICE_LIMIT_EXCEEDED
    | `String "NotStabilized" -> NOT_STABILIZED
    | `String "GeneralServiceException" -> GENERAL_SERVICE_EXCEPTION
    | `String "ServiceInternalError" -> SERVICE_INTERNAL_ERROR
    | `String "ServiceTimeout" -> SERVICE_TIMEOUT
    | `String "NetworkFailure" -> NETWORK_FAILURE
    | `String "InternalFailure" -> INTERNAL_FAILURE
    | `String value -> raise (deserialize_unknown_enum_value_error path "HandlerErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "HandlerErrorCode")
     : handler_error_code)
    : handler_error_code)

let status_message_of_yojson = string_of_yojson
let properties_of_yojson = string_of_yojson

let operation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "SUCCESS" -> SUCCESS
    | `String "FAILED" -> FAILED
    | `String "CANCEL_IN_PROGRESS" -> CANCEL_IN_PROGRESS
    | `String "CANCEL_COMPLETE" -> CANCEL_COMPLETE
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationStatus")
     : operation_status)
    : operation_status)

let operation_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE" -> CREATE
    | `String "DELETE" -> DELETE
    | `String "UPDATE" -> UPDATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Operation" value)
    | _ -> raise (deserialize_wrong_type_error path "Operation")
     : operation)
    : operation)

let request_token_of_yojson = string_of_yojson
let identifier_of_yojson = string_of_yojson
let type_name_of_yojson = string_of_yojson

let progress_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_name = option_of_yojson (value_for_key type_name_of_yojson "TypeName") _list path;
     identifier = option_of_yojson (value_for_key identifier_of_yojson "Identifier") _list path;
     request_token =
       option_of_yojson (value_for_key request_token_of_yojson "RequestToken") _list path;
     hooks_request_token =
       option_of_yojson (value_for_key request_token_of_yojson "HooksRequestToken") _list path;
     operation = option_of_yojson (value_for_key operation_of_yojson "Operation") _list path;
     operation_status =
       option_of_yojson (value_for_key operation_status_of_yojson "OperationStatus") _list path;
     event_time = option_of_yojson (value_for_key timestamp_of_yojson "EventTime") _list path;
     resource_model =
       option_of_yojson (value_for_key properties_of_yojson "ResourceModel") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     error_code =
       option_of_yojson (value_for_key handler_error_code_of_yojson "ErrorCode") _list path;
     retry_after = option_of_yojson (value_for_key timestamp_of_yojson "RetryAfter") _list path;
   }
    : progress_event)

let cancel_resource_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     progress_event =
       option_of_yojson (value_for_key progress_event_of_yojson "ProgressEvent") _list path;
   }
    : cancel_resource_request_output)

let cancel_resource_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ request_token = value_for_key request_token_of_yojson "RequestToken" _list path }
    : cancel_resource_request_input)

let client_token_of_yojson = string_of_yojson

let client_token_conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : client_token_conflict_exception)

let unsupported_action_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : unsupported_action_exception)

let type_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : type_not_found_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : throttling_exception)

let service_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : service_limit_exceeded_exception)

let service_internal_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : service_internal_error_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_not_found_exception)

let resource_conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_conflict_exception)

let private_type_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : private_type_exception)

let not_updatable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : not_updatable_exception)

let not_stabilized_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : not_stabilized_exception)

let network_failure_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : network_failure_exception)

let invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_request_exception)

let invalid_credentials_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_credentials_exception)

let handler_internal_failure_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : handler_internal_failure_exception)

let handler_failure_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : handler_failure_exception)

let general_service_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : general_service_exception)

let concurrent_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : concurrent_operation_exception)

let update_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     progress_event =
       option_of_yojson (value_for_key progress_event_of_yojson "ProgressEvent") _list path;
   }
    : update_resource_output)

let patch_document_of_yojson = string_of_yojson
let role_arn_of_yojson = string_of_yojson
let type_version_id_of_yojson = string_of_yojson

let update_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_name = value_for_key type_name_of_yojson "TypeName" _list path;
     type_version_id =
       option_of_yojson (value_for_key type_version_id_of_yojson "TypeVersionId") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     identifier = value_for_key identifier_of_yojson "Identifier" _list path;
     patch_document = value_for_key patch_document_of_yojson "PatchDocument" _list path;
   }
    : update_resource_input)

let handler_next_token_of_yojson = string_of_yojson

let resource_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identifier = option_of_yojson (value_for_key identifier_of_yojson "Identifier") _list path;
     properties = option_of_yojson (value_for_key properties_of_yojson "Properties") _list path;
   }
    : resource_description)

let resource_descriptions_of_yojson tree path =
  list_of_yojson resource_description_of_yojson tree path

let list_resources_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_name = option_of_yojson (value_for_key type_name_of_yojson "TypeName") _list path;
     resource_descriptions =
       option_of_yojson
         (value_for_key resource_descriptions_of_yojson "ResourceDescriptions")
         _list path;
     next_token =
       option_of_yojson (value_for_key handler_next_token_of_yojson "NextToken") _list path;
   }
    : list_resources_output)

let max_results_of_yojson = int_of_yojson

let list_resources_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_name = value_for_key type_name_of_yojson "TypeName" _list path;
     type_version_id =
       option_of_yojson (value_for_key type_version_id_of_yojson "TypeVersionId") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list path;
     next_token =
       option_of_yojson (value_for_key handler_next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     resource_model =
       option_of_yojson (value_for_key properties_of_yojson "ResourceModel") _list path;
   }
    : list_resources_input)

let next_token_of_yojson = string_of_yojson

let resource_request_status_summaries_of_yojson tree path =
  list_of_yojson progress_event_of_yojson tree path

let list_resource_requests_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_request_status_summaries =
       option_of_yojson
         (value_for_key resource_request_status_summaries_of_yojson "ResourceRequestStatusSummaries")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_resource_requests_output)

let operation_statuses_of_yojson tree path = list_of_yojson operation_status_of_yojson tree path
let operations_of_yojson tree path = list_of_yojson operation_of_yojson tree path

let resource_request_status_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operations_of_yojson "Operations") _list path;
     operation_statuses =
       option_of_yojson (value_for_key operation_statuses_of_yojson "OperationStatuses") _list path;
   }
    : resource_request_status_filter)

let list_resource_requests_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     resource_request_status_filter =
       option_of_yojson
         (value_for_key resource_request_status_filter_of_yojson "ResourceRequestStatusFilter")
         _list path;
   }
    : list_resource_requests_input)

let hook_failure_mode_of_yojson = string_of_yojson
let hook_status_of_yojson = string_of_yojson
let hook_invocation_point_of_yojson = string_of_yojson
let hook_type_arn_of_yojson = string_of_yojson

let hook_progress_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hook_type_name = option_of_yojson (value_for_key type_name_of_yojson "HookTypeName") _list path;
     hook_type_version_id =
       option_of_yojson (value_for_key type_version_id_of_yojson "HookTypeVersionId") _list path;
     hook_type_arn =
       option_of_yojson (value_for_key hook_type_arn_of_yojson "HookTypeArn") _list path;
     invocation_point =
       option_of_yojson (value_for_key hook_invocation_point_of_yojson "InvocationPoint") _list path;
     hook_status = option_of_yojson (value_for_key hook_status_of_yojson "HookStatus") _list path;
     hook_event_time =
       option_of_yojson (value_for_key timestamp_of_yojson "HookEventTime") _list path;
     hook_status_message =
       option_of_yojson (value_for_key status_message_of_yojson "HookStatusMessage") _list path;
     failure_mode =
       option_of_yojson (value_for_key hook_failure_mode_of_yojson "FailureMode") _list path;
   }
    : hook_progress_event)

let hooks_progress_event_of_yojson tree path =
  list_of_yojson hook_progress_event_of_yojson tree path

let get_resource_request_status_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     progress_event =
       option_of_yojson (value_for_key progress_event_of_yojson "ProgressEvent") _list path;
     hooks_progress_event =
       option_of_yojson
         (value_for_key hooks_progress_event_of_yojson "HooksProgressEvent")
         _list path;
   }
    : get_resource_request_status_output)

let get_resource_request_status_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ request_token = value_for_key request_token_of_yojson "RequestToken" _list path }
    : get_resource_request_status_input)

let get_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_name = option_of_yojson (value_for_key type_name_of_yojson "TypeName") _list path;
     resource_description =
       option_of_yojson
         (value_for_key resource_description_of_yojson "ResourceDescription")
         _list path;
   }
    : get_resource_output)

let get_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_name = value_for_key type_name_of_yojson "TypeName" _list path;
     type_version_id =
       option_of_yojson (value_for_key type_version_id_of_yojson "TypeVersionId") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list path;
     identifier = value_for_key identifier_of_yojson "Identifier" _list path;
   }
    : get_resource_input)

let delete_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     progress_event =
       option_of_yojson (value_for_key progress_event_of_yojson "ProgressEvent") _list path;
   }
    : delete_resource_output)

let delete_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_name = value_for_key type_name_of_yojson "TypeName" _list path;
     type_version_id =
       option_of_yojson (value_for_key type_version_id_of_yojson "TypeVersionId") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     identifier = value_for_key identifier_of_yojson "Identifier" _list path;
   }
    : delete_resource_input)

let create_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     progress_event =
       option_of_yojson (value_for_key progress_event_of_yojson "ProgressEvent") _list path;
   }
    : create_resource_output)

let create_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_name = value_for_key type_name_of_yojson "TypeName" _list path;
     type_version_id =
       option_of_yojson (value_for_key type_version_id_of_yojson "TypeVersionId") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     desired_state = value_for_key properties_of_yojson "DesiredState" _list path;
   }
    : create_resource_input)
