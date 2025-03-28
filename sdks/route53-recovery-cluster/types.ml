open Smaws_Lib.CoreTypes
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "route53-recovery-cluster";
      endpointPrefix = "route53-recovery-cluster";
      version = "2019-12-02";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }
type nonrec base_unit = unit
type nonrec validation_exception_reason =
  | OTHER 
  | FIELD_VALIDATION_FAILED 
  | CANNOT_PARSE 
  | UNKNOWN_OPERATION 
type nonrec string_ = unit
type nonrec validation_exception_field = {
  message: string ;
  name: string }
type nonrec validation_exception_field_list = unit
type nonrec validation_exception =
  {
  fields: validation_exception_field list option ;
  reason: validation_exception_reason option ;
  message: string }
type nonrec update_routing_control_states_response = unit
type nonrec arn = unit
type nonrec routing_control_state =
  | Off 
  | On 
type nonrec update_routing_control_state_entry =
  {
  routing_control_state: routing_control_state ;
  routing_control_arn: string }
type nonrec update_routing_control_state_entries = unit
type nonrec arns = unit
type nonrec update_routing_control_states_request =
  {
  safety_rules_to_override: string list option ;
  update_routing_control_state_entries:
    update_routing_control_state_entry list }
type nonrec retry_after_seconds = unit
type nonrec throttling_exception =
  {
  retry_after_seconds: int option ;
  message: string }
type nonrec service_limit_exceeded_exception =
  {
  service_code: string ;
  limit_code: string ;
  resource_type: string option ;
  resource_id: string option ;
  message: string }
type nonrec resource_not_found_exception =
  {
  resource_type: string ;
  resource_id: string ;
  message: string }
type nonrec internal_server_exception =
  {
  retry_after_seconds: int option ;
  message: string }
type nonrec endpoint_temporarily_unavailable_exception = {
  message: string }
type nonrec conflict_exception =
  {
  resource_type: string ;
  resource_id: string ;
  message: string }
type nonrec access_denied_exception = {
  message: string }
type nonrec update_routing_control_state_response = unit
type nonrec update_routing_control_state_request =
  {
  safety_rules_to_override: string list option ;
  routing_control_state: routing_control_state ;
  routing_control_arn: string }
type nonrec control_panel_name = unit
type nonrec routing_control_name = unit
type nonrec owner = unit
type nonrec routing_control =
  {
  owner: string option ;
  routing_control_state: routing_control_state option ;
  routing_control_name: string option ;
  routing_control_arn: string option ;
  control_panel_name: string option ;
  control_panel_arn: string option }
type nonrec routing_controls = unit
type nonrec page_token = unit
type nonrec list_routing_controls_response =
  {
  next_token: string option ;
  routing_controls: routing_control list }
type nonrec max_results = unit
type nonrec list_routing_controls_request =
  {
  max_results: int option ;
  next_token: string option ;
  control_panel_arn: string option }
type nonrec get_routing_control_state_response =
  {
  routing_control_name: string option ;
  routing_control_state: routing_control_state ;
  routing_control_arn: string }
type nonrec get_routing_control_state_request =
  {
  routing_control_arn: string }
type nonrec toggle_customer_ap_i = unit
type nonrec base_string = unit
type nonrec base_boolean = unit
type nonrec base_integer = unit
type nonrec base_timestamp = unit
type nonrec base_long = unit
type nonrec base_document = unit