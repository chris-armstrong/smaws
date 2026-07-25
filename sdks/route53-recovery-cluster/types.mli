type nonrec string_ = string [@@ocaml.doc ""]

type nonrec access_denied_exception = { message : string_ [@ocaml.doc ""] }
[@@ocaml.doc "You don't have sufficient permissions to perform this action.\n"]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec arns = arn list [@@ocaml.doc ""]

type nonrec conflict_exception = {
  message : string_; [@ocaml.doc "Description of the ConflictException error"]
  resource_id : string_; [@ocaml.doc "Identifier of the resource in use"]
  resource_type : string_; [@ocaml.doc "Type of the resource in use"]
}
[@@ocaml.doc "There was a conflict with this request. Try again.\n"]

type nonrec control_panel_name = string [@@ocaml.doc ""]

type nonrec endpoint_temporarily_unavailable_exception = { message : string_ [@ocaml.doc ""] }
[@@ocaml.doc "The cluster endpoint isn't available. Try another cluster endpoint.\n"]

type nonrec validation_exception_field = {
  name : string_; [@ocaml.doc "The field that had the validation exception.\n"]
  message : string_; [@ocaml.doc "Information about the validation exception.\n"]
}
[@@ocaml.doc "There was a validation error on the request.\n"]

type nonrec validation_exception_field_list = validation_exception_field list [@@ocaml.doc ""]

type nonrec validation_exception_reason =
  | UNKNOWN_OPERATION [@ocaml.doc ""]
  | CANNOT_PARSE [@ocaml.doc ""]
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
[@@ocaml.doc "Reason the request failed validation"]

type nonrec validation_exception = {
  message : string_; [@ocaml.doc ""]
  reason : validation_exception_reason option; [@ocaml.doc ""]
  fields : validation_exception_field_list option; [@ocaml.doc ""]
}
[@@ocaml.doc "There was a validation error on the request.\n"]

type nonrec retry_after_seconds = int [@@ocaml.doc ""]

type nonrec throttling_exception = {
  message : string_; [@ocaml.doc ""]
  retry_after_seconds : retry_after_seconds option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was denied because of request throttling.\n"]

type nonrec resource_not_found_exception = {
  message : string_; [@ocaml.doc ""]
  resource_id : string_; [@ocaml.doc "Hypothetical resource identifier that was not found"]
  resource_type : string_; [@ocaml.doc "Hypothetical resource type that was not found"]
}
[@@ocaml.doc "The request references a routing control or control panel that was not found.\n"]

type nonrec internal_server_exception = {
  message : string_; [@ocaml.doc ""]
  retry_after_seconds : retry_after_seconds option; [@ocaml.doc ""]
}
[@@ocaml.doc "There was an unexpected error during processing of the request.\n"]

type nonrec routing_control_name = string [@@ocaml.doc ""]

type nonrec routing_control_state = On [@ocaml.doc ""] | Off [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec get_routing_control_state_response = {
  routing_control_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the response.\n"]
  routing_control_state : routing_control_state; [@ocaml.doc "The state of the routing control.\n"]
  routing_control_name : routing_control_name option; [@ocaml.doc "The routing control name.\n"]
}
[@@ocaml.doc ""]

type nonrec get_routing_control_state_request = {
  routing_control_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the routing control that you want to get the state for.\n"]
}
[@@ocaml.doc ""]

type nonrec page_token = string [@@ocaml.doc ""]

type nonrec owner = string [@@ocaml.doc ""]

type nonrec routing_control = {
  control_panel_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the control panel where the routing control is located.\n"]
  control_panel_name : control_panel_name option;
      [@ocaml.doc
        "The name of the control panel where the routing control is located. Only ASCII characters \
         are supported for control panel names.\n"]
  routing_control_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the routing control.\n"]
  routing_control_name : routing_control_name option;
      [@ocaml.doc "The name of the routing control.\n"]
  routing_control_state : routing_control_state option;
      [@ocaml.doc
        "The current state of the routing control. When a routing control state is set to ON, \
         traffic flows to a cell. When the state is set to OFF, traffic does not flow. \n"]
  owner : owner option;
      [@ocaml.doc "The Amazon Web Services account ID of the routing control owner.\n"]
}
[@@ocaml.doc
  "A routing control, which is a simple on/off switch that you can use to route traffic to cells. \
   When a routing control state is set to ON, traffic flows to a cell. When the state is set to \
   OFF, traffic does not flow. \n"]

type nonrec routing_controls = routing_control list [@@ocaml.doc ""]

type nonrec list_routing_controls_response = {
  routing_controls : routing_controls; [@ocaml.doc "The list of routing controls.\n"]
  next_token : page_token option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_routing_controls_request = {
  control_panel_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the control panel of the routing controls to list.\n"]
  next_token : page_token option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The number of routing controls objects that you want to return with this call. The \
         default value is 500.\n"]
}
[@@ocaml.doc ""]

type nonrec service_limit_exceeded_exception = {
  message : string_; [@ocaml.doc ""]
  resource_id : string_ option;
      [@ocaml.doc "The resource identifier of the limit that was exceeded.\n"]
  resource_type : string_ option; [@ocaml.doc "The resource type of the limit that was exceeded.\n"]
  limit_code : string_; [@ocaml.doc "The code of the limit that was exceeded.\n"]
  service_code : string_; [@ocaml.doc "The service code of the limit that was exceeded.\n"]
}
[@@ocaml.doc
  "The request can't update that many routing control states at the same time. Try again with \
   fewer routing control states.\n"]

type nonrec update_routing_control_states_response = unit [@@ocaml.doc ""]

type nonrec update_routing_control_state_entry = {
  routing_control_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) for a routing control state entry.\n"]
  routing_control_state : routing_control_state;
      [@ocaml.doc "The routing control state in a set of routing control state entries.\n"]
}
[@@ocaml.doc "A routing control state entry.\n"]

type nonrec update_routing_control_state_entries = update_routing_control_state_entry list
[@@ocaml.doc ""]

type nonrec update_routing_control_states_request = {
  update_routing_control_state_entries : update_routing_control_state_entries;
      [@ocaml.doc "A set of routing control entries that you want to update.\n"]
  safety_rules_to_override : arns option;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) for the safety rules that you want to override when \
         you're updating routing control states. You can override one safety rule or multiple \
         safety rules by including one or more ARNs, separated by commas.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.override-safety-rule.html} \
         Override safety rules to reroute traffic} in the Amazon Route 53 Application Recovery \
         Controller Developer Guide.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_routing_control_state_response = unit [@@ocaml.doc ""]

type nonrec update_routing_control_state_request = {
  routing_control_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the routing control that you want to update the state \
         for.\n"]
  routing_control_state : routing_control_state;
      [@ocaml.doc "The state of the routing control. You can set the value to ON or OFF.\n"]
  safety_rules_to_override : arns option;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) for the safety rules that you want to override when \
         you're updating the state of a routing control. You can override one safety rule or \
         multiple safety rules by including one or more ARNs, separated by commas.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.override-safety-rule.html} \
         Override safety rules to reroute traffic} in the Amazon Route 53 Application Recovery \
         Controller Developer Guide.\n\
        \ "]
}
[@@ocaml.doc ""]
