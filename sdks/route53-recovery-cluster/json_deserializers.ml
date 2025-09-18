open Smaws_Lib.Json.DeserializeHelpers
open Types

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "other" -> OTHER
    | `String "fieldValidationFailed" -> FIELD_VALIDATION_FAILED
    | `String "cannotParse" -> CANNOT_PARSE
    | `String "unknownOperation" -> UNKNOWN_OPERATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let string__of_yojson = string_of_yojson

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key string__of_yojson "message" _list path;
     name = value_for_key string__of_yojson "name" _list path;
   }
    : validation_exception_field)

let validation_exception_field_list_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fields =
       option_of_yojson
         (value_for_key validation_exception_field_list_of_yojson "fields")
         _list path;
     reason =
       option_of_yojson (value_for_key validation_exception_reason_of_yojson "reason") _list path;
     message = value_for_key string__of_yojson "message" _list path;
   }
    : validation_exception)

let update_routing_control_states_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let arn_of_yojson = string_of_yojson

let routing_control_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "Off" -> Off
    | `String "On" -> On
    | `String value -> raise (deserialize_unknown_enum_value_error path "RoutingControlState" value)
    | _ -> raise (deserialize_wrong_type_error path "RoutingControlState")
     : routing_control_state)
    : routing_control_state)

let update_routing_control_state_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     routing_control_state =
       value_for_key routing_control_state_of_yojson "RoutingControlState" _list path;
     routing_control_arn = value_for_key arn_of_yojson "RoutingControlArn" _list path;
   }
    : update_routing_control_state_entry)

let update_routing_control_state_entries_of_yojson tree path =
  list_of_yojson update_routing_control_state_entry_of_yojson tree path

let arns_of_yojson tree path = list_of_yojson arn_of_yojson tree path

let update_routing_control_states_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     safety_rules_to_override =
       option_of_yojson (value_for_key arns_of_yojson "SafetyRulesToOverride") _list path;
     update_routing_control_state_entries =
       value_for_key update_routing_control_state_entries_of_yojson
         "UpdateRoutingControlStateEntries" _list path;
   }
    : update_routing_control_states_request)

let retry_after_seconds_of_yojson = int_of_yojson

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_after_seconds =
       option_of_yojson (value_for_key retry_after_seconds_of_yojson "retryAfterSeconds") _list path;
     message = value_for_key string__of_yojson "message" _list path;
   }
    : throttling_exception)

let service_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_code = value_for_key string__of_yojson "serviceCode" _list path;
     limit_code = value_for_key string__of_yojson "limitCode" _list path;
     resource_type = option_of_yojson (value_for_key string__of_yojson "resourceType") _list path;
     resource_id = option_of_yojson (value_for_key string__of_yojson "resourceId") _list path;
     message = value_for_key string__of_yojson "message" _list path;
   }
    : service_limit_exceeded_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key string__of_yojson "resourceType" _list path;
     resource_id = value_for_key string__of_yojson "resourceId" _list path;
     message = value_for_key string__of_yojson "message" _list path;
   }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_after_seconds =
       option_of_yojson (value_for_key retry_after_seconds_of_yojson "retryAfterSeconds") _list path;
     message = value_for_key string__of_yojson "message" _list path;
   }
    : internal_server_exception)

let endpoint_temporarily_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key string__of_yojson "message" _list path }
    : endpoint_temporarily_unavailable_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key string__of_yojson "resourceType" _list path;
     resource_id = value_for_key string__of_yojson "resourceId" _list path;
     message = value_for_key string__of_yojson "message" _list path;
   }
    : conflict_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key string__of_yojson "message" _list path } : access_denied_exception)

let update_routing_control_state_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_routing_control_state_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     safety_rules_to_override =
       option_of_yojson (value_for_key arns_of_yojson "SafetyRulesToOverride") _list path;
     routing_control_state =
       value_for_key routing_control_state_of_yojson "RoutingControlState" _list path;
     routing_control_arn = value_for_key arn_of_yojson "RoutingControlArn" _list path;
   }
    : update_routing_control_state_request)

let control_panel_name_of_yojson = string_of_yojson
let routing_control_name_of_yojson = string_of_yojson
let owner_of_yojson = string_of_yojson

let routing_control_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     owner = option_of_yojson (value_for_key owner_of_yojson "Owner") _list path;
     routing_control_state =
       option_of_yojson
         (value_for_key routing_control_state_of_yojson "RoutingControlState")
         _list path;
     routing_control_name =
       option_of_yojson
         (value_for_key routing_control_name_of_yojson "RoutingControlName")
         _list path;
     routing_control_arn =
       option_of_yojson (value_for_key arn_of_yojson "RoutingControlArn") _list path;
     control_panel_name =
       option_of_yojson (value_for_key control_panel_name_of_yojson "ControlPanelName") _list path;
     control_panel_arn = option_of_yojson (value_for_key arn_of_yojson "ControlPanelArn") _list path;
   }
    : routing_control)

let routing_controls_of_yojson tree path = list_of_yojson routing_control_of_yojson tree path
let page_token_of_yojson = string_of_yojson

let list_routing_controls_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key page_token_of_yojson "NextToken") _list path;
     routing_controls = value_for_key routing_controls_of_yojson "RoutingControls" _list path;
   }
    : list_routing_controls_response)

let max_results_of_yojson = int_of_yojson

let list_routing_controls_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key page_token_of_yojson "NextToken") _list path;
     control_panel_arn = option_of_yojson (value_for_key arn_of_yojson "ControlPanelArn") _list path;
   }
    : list_routing_controls_request)

let get_routing_control_state_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     routing_control_name =
       option_of_yojson
         (value_for_key routing_control_name_of_yojson "RoutingControlName")
         _list path;
     routing_control_state =
       value_for_key routing_control_state_of_yojson "RoutingControlState" _list path;
     routing_control_arn = value_for_key arn_of_yojson "RoutingControlArn" _list path;
   }
    : get_routing_control_state_response)

let get_routing_control_state_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ routing_control_arn = value_for_key arn_of_yojson "RoutingControlArn" _list path }
    : get_routing_control_state_request)
