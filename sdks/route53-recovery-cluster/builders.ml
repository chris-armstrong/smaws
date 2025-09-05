open Types
let make_validation_exception_field ~message:(message_ : string_)
  ~name:(name_ : string_) () =
  ({ message = message_; name = name_ } : validation_exception_field)
let make_update_routing_control_states_response () = (() : unit)
let make_update_routing_control_state_entry
  ~routing_control_state:(routing_control_state_ : routing_control_state)
  ~routing_control_arn:(routing_control_arn_ : arn) () =
  ({
     routing_control_state = routing_control_state_;
     routing_control_arn = routing_control_arn_
   } : update_routing_control_state_entry)
let make_update_routing_control_states_request
  ?safety_rules_to_override:(safety_rules_to_override_ : arns option)
  ~update_routing_control_state_entries:(update_routing_control_state_entries_
                                          :
                                          update_routing_control_state_entries)
  () =
  ({
     safety_rules_to_override = safety_rules_to_override_;
     update_routing_control_state_entries =
       update_routing_control_state_entries_
   } : update_routing_control_states_request)
let make_update_routing_control_state_response () = (() : unit)
let make_update_routing_control_state_request
  ?safety_rules_to_override:(safety_rules_to_override_ : arns option)
  ~routing_control_state:(routing_control_state_ : routing_control_state)
  ~routing_control_arn:(routing_control_arn_ : arn) () =
  ({
     safety_rules_to_override = safety_rules_to_override_;
     routing_control_state = routing_control_state_;
     routing_control_arn = routing_control_arn_
   } : update_routing_control_state_request)
let make_routing_control ?owner:(owner_ : owner option)
  ?routing_control_state:(routing_control_state_ :
                           routing_control_state option)
  ?routing_control_name:(routing_control_name_ : routing_control_name option)
  ?routing_control_arn:(routing_control_arn_ : arn option)
  ?control_panel_name:(control_panel_name_ : control_panel_name option)
  ?control_panel_arn:(control_panel_arn_ : arn option) () =
  ({
     owner = owner_;
     routing_control_state = routing_control_state_;
     routing_control_name = routing_control_name_;
     routing_control_arn = routing_control_arn_;
     control_panel_name = control_panel_name_;
     control_panel_arn = control_panel_arn_
   } : routing_control)
let make_list_routing_controls_response
  ?next_token:(next_token_ : page_token option)
  ~routing_controls:(routing_controls_ : routing_controls) () =
  ({ next_token = next_token_; routing_controls = routing_controls_ } : 
  list_routing_controls_response)
let make_list_routing_controls_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : page_token option)
  ?control_panel_arn:(control_panel_arn_ : arn option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     control_panel_arn = control_panel_arn_
   } : list_routing_controls_request)
let make_get_routing_control_state_response
  ?routing_control_name:(routing_control_name_ : routing_control_name option)
  ~routing_control_state:(routing_control_state_ : routing_control_state)
  ~routing_control_arn:(routing_control_arn_ : arn) () =
  ({
     routing_control_name = routing_control_name_;
     routing_control_state = routing_control_state_;
     routing_control_arn = routing_control_arn_
   } : get_routing_control_state_response)
let make_get_routing_control_state_request
  ~routing_control_arn:(routing_control_arn_ : arn) () =
  ({ routing_control_arn = routing_control_arn_ } : get_routing_control_state_request)