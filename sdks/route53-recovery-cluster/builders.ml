open Smaws_Lib
open Types
let make_validation_exception_field ~message:(message_ : string)
  ~name:(name_ : string) () =
  ({ message = message_; name = name_ } : validation_exception_field)
let make_update_routing_control_states_response () = (() : unit)
let make_update_routing_control_state_entry
  ~routing_control_state:(routing_control_state_ : routing_control_state)
  ~routing_control_arn:(routing_control_arn_ : string) () =
  ({
     routing_control_state = routing_control_state_;
     routing_control_arn = routing_control_arn_
   } : update_routing_control_state_entry)
let make_update_routing_control_states_request
  ?safety_rules_to_override:(safety_rules_to_override_ : string list option)
  ~update_routing_control_state_entries:(update_routing_control_state_entries_
                                          :
                                          update_routing_control_state_entry
                                            list)
  () =
  ({
     safety_rules_to_override = safety_rules_to_override_;
     update_routing_control_state_entries =
       update_routing_control_state_entries_
   } : update_routing_control_states_request)
let make_update_routing_control_state_response () = (() : unit)
let make_update_routing_control_state_request
  ?safety_rules_to_override:(safety_rules_to_override_ : string list option)
  ~routing_control_state:(routing_control_state_ : routing_control_state)
  ~routing_control_arn:(routing_control_arn_ : string) () =
  ({
     safety_rules_to_override = safety_rules_to_override_;
     routing_control_state = routing_control_state_;
     routing_control_arn = routing_control_arn_
   } : update_routing_control_state_request)
let make_routing_control ?owner:(owner_ : string option)
  ?routing_control_state:(routing_control_state_ :
                           routing_control_state option)
  ?routing_control_name:(routing_control_name_ : string option)
  ?routing_control_arn:(routing_control_arn_ : string option)
  ?control_panel_name:(control_panel_name_ : string option)
  ?control_panel_arn:(control_panel_arn_ : string option) () =
  ({
     owner = owner_;
     routing_control_state = routing_control_state_;
     routing_control_name = routing_control_name_;
     routing_control_arn = routing_control_arn_;
     control_panel_name = control_panel_name_;
     control_panel_arn = control_panel_arn_
   } : routing_control)
let make_list_routing_controls_response
  ?next_token:(next_token_ : string option)
  ~routing_controls:(routing_controls_ : routing_control list) () =
  ({ next_token = next_token_; routing_controls = routing_controls_ } : 
  list_routing_controls_response)
let make_list_routing_controls_request
  ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option)
  ?control_panel_arn:(control_panel_arn_ : string option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     control_panel_arn = control_panel_arn_
   } : list_routing_controls_request)
let make_get_routing_control_state_response
  ?routing_control_name:(routing_control_name_ : string option)
  ~routing_control_state:(routing_control_state_ : routing_control_state)
  ~routing_control_arn:(routing_control_arn_ : string) () =
  ({
     routing_control_name = routing_control_name_;
     routing_control_state = routing_control_state_;
     routing_control_arn = routing_control_arn_
   } : get_routing_control_state_response)
let make_get_routing_control_state_request
  ~routing_control_arn:(routing_control_arn_ : string) () =
  ({ routing_control_arn = routing_control_arn_ } : get_routing_control_state_request)