open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", Some (string__to_yojson x.message)) ]

let arn_to_yojson = string_to_yojson
let arns_to_yojson tree = list_to_yojson arn_to_yojson tree

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("message", Some (string__to_yojson x.message));
      ("resourceId", Some (string__to_yojson x.resource_id));
      ("resourceType", Some (string__to_yojson x.resource_type));
    ]

let control_panel_name_to_yojson = string_to_yojson

let endpoint_temporarily_unavailable_exception_to_yojson
    (x : endpoint_temporarily_unavailable_exception) =
  assoc_to_yojson [ ("message", Some (string__to_yojson x.message)) ]

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [ ("name", Some (string__to_yojson x.name)); ("message", Some (string__to_yojson x.message)) ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | UNKNOWN_OPERATION -> `String "unknownOperation"
  | CANNOT_PARSE -> `String "cannotParse"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | OTHER -> `String "other"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("message", Some (string__to_yojson x.message));
      ("reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("fields", option_to_yojson validation_exception_field_list_to_yojson x.fields);
    ]

let retry_after_seconds_to_yojson = int_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("message", Some (string__to_yojson x.message));
      ("retryAfterSeconds", option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds);
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", Some (string__to_yojson x.message));
      ("resourceId", Some (string__to_yojson x.resource_id));
      ("resourceType", Some (string__to_yojson x.resource_type));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("message", Some (string__to_yojson x.message));
      ("retryAfterSeconds", option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds);
    ]

let routing_control_name_to_yojson = string_to_yojson

let routing_control_state_to_yojson (x : routing_control_state) =
  match x with On -> `String "On" | Off -> `String "Off"

let get_routing_control_state_response_to_yojson (x : get_routing_control_state_response) =
  assoc_to_yojson
    [
      ("RoutingControlArn", Some (arn_to_yojson x.routing_control_arn));
      ("RoutingControlState", Some (routing_control_state_to_yojson x.routing_control_state));
      ("RoutingControlName", option_to_yojson routing_control_name_to_yojson x.routing_control_name);
    ]

let get_routing_control_state_request_to_yojson (x : get_routing_control_state_request) =
  assoc_to_yojson [ ("RoutingControlArn", Some (arn_to_yojson x.routing_control_arn)) ]

let page_token_to_yojson = string_to_yojson
let owner_to_yojson = string_to_yojson

let routing_control_to_yojson (x : routing_control) =
  assoc_to_yojson
    [
      ("ControlPanelArn", option_to_yojson arn_to_yojson x.control_panel_arn);
      ("ControlPanelName", option_to_yojson control_panel_name_to_yojson x.control_panel_name);
      ("RoutingControlArn", option_to_yojson arn_to_yojson x.routing_control_arn);
      ("RoutingControlName", option_to_yojson routing_control_name_to_yojson x.routing_control_name);
      ( "RoutingControlState",
        option_to_yojson routing_control_state_to_yojson x.routing_control_state );
      ("Owner", option_to_yojson owner_to_yojson x.owner);
    ]

let routing_controls_to_yojson tree = list_to_yojson routing_control_to_yojson tree

let list_routing_controls_response_to_yojson (x : list_routing_controls_response) =
  assoc_to_yojson
    [
      ("RoutingControls", Some (routing_controls_to_yojson x.routing_controls));
      ("NextToken", option_to_yojson page_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_routing_controls_request_to_yojson (x : list_routing_controls_request) =
  assoc_to_yojson
    [
      ("ControlPanelArn", option_to_yojson arn_to_yojson x.control_panel_arn);
      ("NextToken", option_to_yojson page_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let service_limit_exceeded_exception_to_yojson (x : service_limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("message", Some (string__to_yojson x.message));
      ("resourceId", option_to_yojson string__to_yojson x.resource_id);
      ("resourceType", option_to_yojson string__to_yojson x.resource_type);
      ("limitCode", Some (string__to_yojson x.limit_code));
      ("serviceCode", Some (string__to_yojson x.service_code));
    ]

let update_routing_control_states_response_to_yojson = unit_to_yojson

let update_routing_control_state_entry_to_yojson (x : update_routing_control_state_entry) =
  assoc_to_yojson
    [
      ("RoutingControlArn", Some (arn_to_yojson x.routing_control_arn));
      ("RoutingControlState", Some (routing_control_state_to_yojson x.routing_control_state));
    ]

let update_routing_control_state_entries_to_yojson tree =
  list_to_yojson update_routing_control_state_entry_to_yojson tree

let update_routing_control_states_request_to_yojson (x : update_routing_control_states_request) =
  assoc_to_yojson
    [
      ( "UpdateRoutingControlStateEntries",
        Some (update_routing_control_state_entries_to_yojson x.update_routing_control_state_entries)
      );
      ("SafetyRulesToOverride", option_to_yojson arns_to_yojson x.safety_rules_to_override);
    ]

let update_routing_control_state_response_to_yojson = unit_to_yojson

let update_routing_control_state_request_to_yojson (x : update_routing_control_state_request) =
  assoc_to_yojson
    [
      ("RoutingControlArn", Some (arn_to_yojson x.routing_control_arn));
      ("RoutingControlState", Some (routing_control_state_to_yojson x.routing_control_state));
      ("SafetyRulesToOverride", option_to_yojson arns_to_yojson x.safety_rules_to_override);
    ]
