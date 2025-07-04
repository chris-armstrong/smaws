open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "route53-recovery-cluster";
      endpointPrefix = "route53-recovery-cluster";
      version = "2019-12-02";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }
type nonrec validation_exception_reason =
  | OTHER [@ocaml.doc ""]
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | CANNOT_PARSE [@ocaml.doc ""]
  | UNKNOWN_OPERATION [@ocaml.doc ""][@@ocaml.doc
                                       "Reason the request failed validation"]
type nonrec validation_exception_field =
  {
  message: string
    [@ocaml.doc "Information about the validation exception.\n"];
  name: string [@ocaml.doc "The field that had the validation exception.\n"]}
[@@ocaml.doc "There was a validation error on the request.\n"]
type nonrec validation_exception =
  {
  fields: validation_exception_field list option [@ocaml.doc ""];
  reason: validation_exception_reason option [@ocaml.doc ""];
  message: string [@ocaml.doc ""]}[@@ocaml.doc
                                    "There was a validation error on the request.\n"]
type nonrec routing_control_state =
  | Off [@ocaml.doc ""]
  | On [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_routing_control_state_entry =
  {
  routing_control_state: routing_control_state
    [@ocaml.doc
      "The routing control state in a set of routing control state entries.\n"];
  routing_control_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for a routing control state entry.\n"]}
[@@ocaml.doc "A routing control state entry.\n"]
type nonrec update_routing_control_states_request =
  {
  safety_rules_to_override: string list option
    [@ocaml.doc
      "The Amazon Resource Names (ARNs) for the safety rules that you want to override when you're updating routing control states. You can override one safety rule or multiple safety rules by including one or more ARNs, separated by commas.\n\n For more information, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.override-safety-rule.html} Override safety rules to reroute traffic} in the Amazon Route 53 Application Recovery Controller Developer Guide.\n "];
  update_routing_control_state_entries:
    update_routing_control_state_entry list
    [@ocaml.doc
      "A set of routing control entries that you want to update.\n"]}
[@@ocaml.doc ""]
type nonrec throttling_exception =
  {
  retry_after_seconds: int option [@ocaml.doc ""];
  message: string [@ocaml.doc ""]}[@@ocaml.doc
                                    "The request was denied because of request throttling.\n"]
type nonrec service_limit_exceeded_exception =
  {
  service_code: string
    [@ocaml.doc "The service code of the limit that was exceeded.\n"];
  limit_code: string
    [@ocaml.doc "The code of the limit that was exceeded.\n"];
  resource_type: string option
    [@ocaml.doc "The resource type of the limit that was exceeded.\n"];
  resource_id: string option
    [@ocaml.doc "The resource identifier of the limit that was exceeded.\n"];
  message: string [@ocaml.doc ""]}[@@ocaml.doc
                                    "The request can't update that many routing control states at the same time. Try again with fewer routing control states.\n"]
type nonrec resource_not_found_exception =
  {
  resource_type: string
    [@ocaml.doc "Hypothetical resource type that was not found"];
  resource_id: string
    [@ocaml.doc "Hypothetical resource identifier that was not found"];
  message: string [@ocaml.doc ""]}[@@ocaml.doc
                                    "The request references a routing control or control panel that was not found.\n"]
type nonrec internal_server_exception =
  {
  retry_after_seconds: int option [@ocaml.doc ""];
  message: string [@ocaml.doc ""]}[@@ocaml.doc
                                    "There was an unexpected error during processing of the request.\n"]
type nonrec endpoint_temporarily_unavailable_exception =
  {
  message: string [@ocaml.doc ""]}[@@ocaml.doc
                                    "The cluster endpoint isn't available. Try another cluster endpoint.\n"]
type nonrec conflict_exception =
  {
  resource_type: string [@ocaml.doc "Type of the resource in use"];
  resource_id: string [@ocaml.doc "Identifier of the resource in use"];
  message: string [@ocaml.doc "Description of the ConflictException error"]}
[@@ocaml.doc "There was a conflict with this request. Try again.\n"]
type nonrec access_denied_exception = {
  message: string [@ocaml.doc ""]}[@@ocaml.doc
                                    "You don't have sufficient permissions to perform this action.\n"]
type nonrec update_routing_control_state_request =
  {
  safety_rules_to_override: string list option
    [@ocaml.doc
      "The Amazon Resource Names (ARNs) for the safety rules that you want to override when you're updating the state of a routing control. You can override one safety rule or multiple safety rules by including one or more ARNs, separated by commas.\n\n For more information, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.override-safety-rule.html} Override safety rules to reroute traffic} in the Amazon Route 53 Application Recovery Controller Developer Guide.\n "];
  routing_control_state: routing_control_state
    [@ocaml.doc
      "The state of the routing control. You can set the value to ON or OFF.\n"];
  routing_control_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for the routing control that you want to update the state for.\n"]}
[@@ocaml.doc ""]
type nonrec routing_control =
  {
  owner: string option
    [@ocaml.doc
      "The Amazon Web Services account ID of the routing control owner.\n"];
  routing_control_state: routing_control_state option
    [@ocaml.doc
      "The current state of the routing control. When a routing control state is set to ON, traffic flows to a cell. When the state is set to OFF, traffic does not flow. \n"];
  routing_control_name: string option
    [@ocaml.doc "The name of the routing control.\n"];
  routing_control_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the routing control.\n"];
  control_panel_name: string option
    [@ocaml.doc
      "The name of the control panel where the routing control is located. Only ASCII characters are supported for control panel names.\n"];
  control_panel_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the control panel where the routing control is located.\n"]}
[@@ocaml.doc
  "A routing control, which is a simple on/off switch that you can use to route traffic to cells. When a routing control state is set to ON, traffic flows to a cell. When the state is set to OFF, traffic does not flow. \n"]
type nonrec list_routing_controls_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token for the next set of results. You receive this token from a previous call.\n"];
  routing_controls: routing_control list
    [@ocaml.doc "The list of routing controls.\n"]}[@@ocaml.doc ""]
type nonrec list_routing_controls_request =
  {
  max_results: int option
    [@ocaml.doc
      "The number of routing controls objects that you want to return with this call. The default value is 500.\n"];
  next_token: string option
    [@ocaml.doc
      "The token for the next set of results. You receive this token from a previous call.\n"];
  control_panel_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the control panel of the routing controls to list.\n"]}
[@@ocaml.doc ""]
type nonrec get_routing_control_state_response =
  {
  routing_control_name: string option
    [@ocaml.doc "The routing control name.\n"];
  routing_control_state: routing_control_state
    [@ocaml.doc "The state of the routing control.\n"];
  routing_control_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the response.\n"]}
[@@ocaml.doc ""]
type nonrec get_routing_control_state_request =
  {
  routing_control_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for the routing control that you want to get the state for.\n"]}
[@@ocaml.doc ""]