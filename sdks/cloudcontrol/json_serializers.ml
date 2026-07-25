open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let already_exists_exception_to_yojson (x : already_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let request_token_not_found_exception_to_yojson (x : request_token_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let handler_error_code_to_yojson (x : handler_error_code) =
  match x with
  | NOT_UPDATABLE -> `String "NotUpdatable"
  | INVALID_REQUEST -> `String "InvalidRequest"
  | ACCESS_DENIED -> `String "AccessDenied"
  | UNAUTHORIZED_TAGGING_OPERATION -> `String "UnauthorizedTaggingOperation"
  | INVALID_CREDENTIALS -> `String "InvalidCredentials"
  | ALREADY_EXISTS -> `String "AlreadyExists"
  | NOT_FOUND -> `String "NotFound"
  | RESOURCE_CONFLICT -> `String "ResourceConflict"
  | THROTTLING -> `String "Throttling"
  | SERVICE_LIMIT_EXCEEDED -> `String "ServiceLimitExceeded"
  | NOT_STABILIZED -> `String "NotStabilized"
  | GENERAL_SERVICE_EXCEPTION -> `String "GeneralServiceException"
  | SERVICE_INTERNAL_ERROR -> `String "ServiceInternalError"
  | SERVICE_TIMEOUT -> `String "ServiceTimeout"
  | NETWORK_FAILURE -> `String "NetworkFailure"
  | INTERNAL_FAILURE -> `String "InternalFailure"

let status_message_to_yojson = string_to_yojson
let properties_to_yojson = string_to_yojson

let operation_status_to_yojson (x : operation_status) =
  match x with
  | PENDING -> `String "PENDING"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCESS -> `String "SUCCESS"
  | FAILED -> `String "FAILED"
  | CANCEL_IN_PROGRESS -> `String "CANCEL_IN_PROGRESS"
  | CANCEL_COMPLETE -> `String "CANCEL_COMPLETE"

let operation_to_yojson (x : operation) =
  match x with
  | CREATE -> `String "CREATE"
  | DELETE -> `String "DELETE"
  | UPDATE -> `String "UPDATE"

let request_token_to_yojson = string_to_yojson
let identifier_to_yojson = string_to_yojson
let type_name_to_yojson = string_to_yojson

let progress_event_to_yojson (x : progress_event) =
  assoc_to_yojson
    [
      ("TypeName", option_to_yojson type_name_to_yojson x.type_name);
      ("Identifier", option_to_yojson identifier_to_yojson x.identifier);
      ("RequestToken", option_to_yojson request_token_to_yojson x.request_token);
      ("HooksRequestToken", option_to_yojson request_token_to_yojson x.hooks_request_token);
      ("Operation", option_to_yojson operation_to_yojson x.operation);
      ("OperationStatus", option_to_yojson operation_status_to_yojson x.operation_status);
      ("EventTime", option_to_yojson timestamp_to_yojson x.event_time);
      ("ResourceModel", option_to_yojson properties_to_yojson x.resource_model);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("ErrorCode", option_to_yojson handler_error_code_to_yojson x.error_code);
      ("RetryAfter", option_to_yojson timestamp_to_yojson x.retry_after);
    ]

let cancel_resource_request_output_to_yojson (x : cancel_resource_request_output) =
  assoc_to_yojson [ ("ProgressEvent", option_to_yojson progress_event_to_yojson x.progress_event) ]

let cancel_resource_request_input_to_yojson (x : cancel_resource_request_input) =
  assoc_to_yojson [ ("RequestToken", Some (request_token_to_yojson x.request_token)) ]

let client_token_to_yojson = string_to_yojson

let client_token_conflict_exception_to_yojson (x : client_token_conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let unsupported_action_exception_to_yojson (x : unsupported_action_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let type_not_found_exception_to_yojson (x : type_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let service_limit_exceeded_exception_to_yojson (x : service_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let service_internal_error_exception_to_yojson (x : service_internal_error_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_conflict_exception_to_yojson (x : resource_conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let private_type_exception_to_yojson (x : private_type_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let not_updatable_exception_to_yojson (x : not_updatable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let not_stabilized_exception_to_yojson (x : not_stabilized_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let network_failure_exception_to_yojson (x : network_failure_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_credentials_exception_to_yojson (x : invalid_credentials_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let handler_internal_failure_exception_to_yojson (x : handler_internal_failure_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let handler_failure_exception_to_yojson (x : handler_failure_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let general_service_exception_to_yojson (x : general_service_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let concurrent_operation_exception_to_yojson (x : concurrent_operation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_resource_output_to_yojson (x : update_resource_output) =
  assoc_to_yojson [ ("ProgressEvent", option_to_yojson progress_event_to_yojson x.progress_event) ]

let patch_document_to_yojson = string_to_yojson
let role_arn_to_yojson = string_to_yojson
let type_version_id_to_yojson = string_to_yojson

let update_resource_input_to_yojson (x : update_resource_input) =
  assoc_to_yojson
    [
      ("TypeName", Some (type_name_to_yojson x.type_name));
      ("TypeVersionId", option_to_yojson type_version_id_to_yojson x.type_version_id);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Identifier", Some (identifier_to_yojson x.identifier));
      ("PatchDocument", Some (patch_document_to_yojson x.patch_document));
    ]

let handler_next_token_to_yojson = string_to_yojson

let resource_description_to_yojson (x : resource_description) =
  assoc_to_yojson
    [
      ("Identifier", option_to_yojson identifier_to_yojson x.identifier);
      ("Properties", option_to_yojson properties_to_yojson x.properties);
    ]

let resource_descriptions_to_yojson tree = list_to_yojson resource_description_to_yojson tree

let list_resources_output_to_yojson (x : list_resources_output) =
  assoc_to_yojson
    [
      ("TypeName", option_to_yojson type_name_to_yojson x.type_name);
      ( "ResourceDescriptions",
        option_to_yojson resource_descriptions_to_yojson x.resource_descriptions );
      ("NextToken", option_to_yojson handler_next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_resources_input_to_yojson (x : list_resources_input) =
  assoc_to_yojson
    [
      ("TypeName", Some (type_name_to_yojson x.type_name));
      ("TypeVersionId", option_to_yojson type_version_id_to_yojson x.type_version_id);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("NextToken", option_to_yojson handler_next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ResourceModel", option_to_yojson properties_to_yojson x.resource_model);
    ]

let next_token_to_yojson = string_to_yojson
let resource_request_status_summaries_to_yojson tree = list_to_yojson progress_event_to_yojson tree

let list_resource_requests_output_to_yojson (x : list_resource_requests_output) =
  assoc_to_yojson
    [
      ( "ResourceRequestStatusSummaries",
        option_to_yojson resource_request_status_summaries_to_yojson
          x.resource_request_status_summaries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let operation_statuses_to_yojson tree = list_to_yojson operation_status_to_yojson tree
let operations_to_yojson tree = list_to_yojson operation_to_yojson tree

let resource_request_status_filter_to_yojson (x : resource_request_status_filter) =
  assoc_to_yojson
    [
      ("Operations", option_to_yojson operations_to_yojson x.operations);
      ("OperationStatuses", option_to_yojson operation_statuses_to_yojson x.operation_statuses);
    ]

let list_resource_requests_input_to_yojson (x : list_resource_requests_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ResourceRequestStatusFilter",
        option_to_yojson resource_request_status_filter_to_yojson x.resource_request_status_filter
      );
    ]

let hook_failure_mode_to_yojson = string_to_yojson
let hook_status_to_yojson = string_to_yojson
let hook_invocation_point_to_yojson = string_to_yojson
let hook_type_arn_to_yojson = string_to_yojson

let hook_progress_event_to_yojson (x : hook_progress_event) =
  assoc_to_yojson
    [
      ("HookTypeName", option_to_yojson type_name_to_yojson x.hook_type_name);
      ("HookTypeVersionId", option_to_yojson type_version_id_to_yojson x.hook_type_version_id);
      ("HookTypeArn", option_to_yojson hook_type_arn_to_yojson x.hook_type_arn);
      ("InvocationPoint", option_to_yojson hook_invocation_point_to_yojson x.invocation_point);
      ("HookStatus", option_to_yojson hook_status_to_yojson x.hook_status);
      ("HookEventTime", option_to_yojson timestamp_to_yojson x.hook_event_time);
      ("HookStatusMessage", option_to_yojson status_message_to_yojson x.hook_status_message);
      ("FailureMode", option_to_yojson hook_failure_mode_to_yojson x.failure_mode);
    ]

let hooks_progress_event_to_yojson tree = list_to_yojson hook_progress_event_to_yojson tree

let get_resource_request_status_output_to_yojson (x : get_resource_request_status_output) =
  assoc_to_yojson
    [
      ("ProgressEvent", option_to_yojson progress_event_to_yojson x.progress_event);
      ("HooksProgressEvent", option_to_yojson hooks_progress_event_to_yojson x.hooks_progress_event);
    ]

let get_resource_request_status_input_to_yojson (x : get_resource_request_status_input) =
  assoc_to_yojson [ ("RequestToken", Some (request_token_to_yojson x.request_token)) ]

let get_resource_output_to_yojson (x : get_resource_output) =
  assoc_to_yojson
    [
      ("TypeName", option_to_yojson type_name_to_yojson x.type_name);
      ("ResourceDescription", option_to_yojson resource_description_to_yojson x.resource_description);
    ]

let get_resource_input_to_yojson (x : get_resource_input) =
  assoc_to_yojson
    [
      ("TypeName", Some (type_name_to_yojson x.type_name));
      ("TypeVersionId", option_to_yojson type_version_id_to_yojson x.type_version_id);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("Identifier", Some (identifier_to_yojson x.identifier));
    ]

let delete_resource_output_to_yojson (x : delete_resource_output) =
  assoc_to_yojson [ ("ProgressEvent", option_to_yojson progress_event_to_yojson x.progress_event) ]

let delete_resource_input_to_yojson (x : delete_resource_input) =
  assoc_to_yojson
    [
      ("TypeName", Some (type_name_to_yojson x.type_name));
      ("TypeVersionId", option_to_yojson type_version_id_to_yojson x.type_version_id);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Identifier", Some (identifier_to_yojson x.identifier));
    ]

let create_resource_output_to_yojson (x : create_resource_output) =
  assoc_to_yojson [ ("ProgressEvent", option_to_yojson progress_event_to_yojson x.progress_event) ]

let create_resource_input_to_yojson (x : create_resource_input) =
  assoc_to_yojson
    [
      ("TypeName", Some (type_name_to_yojson x.type_name));
      ("TypeVersionId", option_to_yojson type_version_id_to_yojson x.type_version_id);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("DesiredState", Some (properties_to_yojson x.desired_state));
    ]
