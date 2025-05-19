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
  | OTHER 
  | FIELD_VALIDATION_FAILED 
  | CANNOT_PARSE 
  | UNKNOWN_OPERATION [@@ocaml.doc "Reason the request failed validation"]
type nonrec validation_exception_field = {
  message: string ;
  name: string }[@@ocaml.doc
                  "There was a validation error on the request.\n"]
type nonrec validation_exception =
  {
  fields: validation_exception_field list option ;
  reason: validation_exception_reason option ;
  message: string }[@@ocaml.doc
                     "There was a validation error on the request.\n"]
type nonrec update_routing_control_states_response = unit
type nonrec routing_control_state =
  | Off 
  | On [@@ocaml.doc ""]
type nonrec update_routing_control_state_entry =
  {
  routing_control_state: routing_control_state ;
  routing_control_arn: string }[@@ocaml.doc
                                 "A routing control state entry.\n"]
type nonrec update_routing_control_states_request =
  {
  safety_rules_to_override: string list option ;
  update_routing_control_state_entries:
    update_routing_control_state_entry list }[@@ocaml.doc ""]
type nonrec throttling_exception =
  {
  retry_after_seconds: int option ;
  message: string }[@@ocaml.doc
                     "The request was denied because of request throttling.\n"]
type nonrec service_limit_exceeded_exception =
  {
  service_code: string ;
  limit_code: string ;
  resource_type: string option ;
  resource_id: string option ;
  message: string }[@@ocaml.doc
                     "The request can't update that many routing control states at the same time. Try again with fewer routing control states.\n"]
type nonrec resource_not_found_exception =
  {
  resource_type: string ;
  resource_id: string ;
  message: string }[@@ocaml.doc
                     "The request references a routing control or control panel that was not found.\n"]
type nonrec internal_server_exception =
  {
  retry_after_seconds: int option ;
  message: string }[@@ocaml.doc
                     "There was an unexpected error during processing of the request.\n"]
type nonrec endpoint_temporarily_unavailable_exception = {
  message: string }[@@ocaml.doc
                     "The cluster endpoint isn't available. Try another cluster endpoint.\n"]
type nonrec conflict_exception =
  {
  resource_type: string ;
  resource_id: string ;
  message: string }[@@ocaml.doc
                     "There was a conflict with this request. Try again.\n"]
type nonrec access_denied_exception = {
  message: string }[@@ocaml.doc
                     "You don't have sufficient permissions to perform this action.\n"]
type nonrec update_routing_control_state_response = unit
type nonrec update_routing_control_state_request =
  {
  safety_rules_to_override: string list option ;
  routing_control_state: routing_control_state ;
  routing_control_arn: string }[@@ocaml.doc ""]
type nonrec routing_control =
  {
  owner: string option ;
  routing_control_state: routing_control_state option ;
  routing_control_name: string option ;
  routing_control_arn: string option ;
  control_panel_name: string option ;
  control_panel_arn: string option }[@@ocaml.doc
                                      "A routing control, which is a simple on/off switch that you can use to route traffic to cells. When a routing control state is set to ON, traffic flows to a cell. When the state is set to OFF, traffic does not flow. \n"]
type nonrec list_routing_controls_response =
  {
  next_token: string option ;
  routing_controls: routing_control list }[@@ocaml.doc ""]
type nonrec list_routing_controls_request =
  {
  max_results: int option ;
  next_token: string option ;
  control_panel_arn: string option }[@@ocaml.doc ""]
type nonrec get_routing_control_state_response =
  {
  routing_control_name: string option ;
  routing_control_state: routing_control_state ;
  routing_control_arn: string }[@@ocaml.doc ""]
type nonrec get_routing_control_state_request =
  {
  routing_control_arn: string }[@@ocaml.doc ""]