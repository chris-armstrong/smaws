open Types

val make_validation_exception_field :
  name:string_ -> message:string_ -> unit -> validation_exception_field

val make_get_routing_control_state_response :
  ?routing_control_name:routing_control_name ->
  routing_control_arn:arn ->
  routing_control_state:routing_control_state ->
  unit ->
  get_routing_control_state_response

val make_get_routing_control_state_request :
  routing_control_arn:arn -> unit -> get_routing_control_state_request

val make_routing_control :
  ?control_panel_arn:arn ->
  ?control_panel_name:control_panel_name ->
  ?routing_control_arn:arn ->
  ?routing_control_name:routing_control_name ->
  ?routing_control_state:routing_control_state ->
  ?owner:owner ->
  unit ->
  routing_control

val make_list_routing_controls_response :
  ?next_token:page_token ->
  routing_controls:routing_controls ->
  unit ->
  list_routing_controls_response

val make_list_routing_controls_request :
  ?control_panel_arn:arn ->
  ?next_token:page_token ->
  ?max_results:max_results ->
  unit ->
  list_routing_controls_request

val make_update_routing_control_states_response : unit -> unit

val make_update_routing_control_state_entry :
  routing_control_arn:arn ->
  routing_control_state:routing_control_state ->
  unit ->
  update_routing_control_state_entry

val make_update_routing_control_states_request :
  ?safety_rules_to_override:arns ->
  update_routing_control_state_entries:update_routing_control_state_entries ->
  unit ->
  update_routing_control_states_request

val make_update_routing_control_state_response : unit -> unit

val make_update_routing_control_state_request :
  ?safety_rules_to_override:arns ->
  routing_control_arn:arn ->
  routing_control_state:routing_control_state ->
  unit ->
  update_routing_control_state_request
