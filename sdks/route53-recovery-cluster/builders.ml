open Types

let make_validation_exception_field ~name:(name_ : string_) ~message:(message_ : string_) () =
  ({ name = name_; message = message_ } : validation_exception_field)

let make_get_routing_control_state_response
    ?routing_control_name:(routing_control_name_ : routing_control_name option)
    ~routing_control_arn:(routing_control_arn_ : arn)
    ~routing_control_state:(routing_control_state_ : routing_control_state) () =
  ({
     routing_control_arn = routing_control_arn_;
     routing_control_state = routing_control_state_;
     routing_control_name = routing_control_name_;
   }
    : get_routing_control_state_response)

let make_get_routing_control_state_request ~routing_control_arn:(routing_control_arn_ : arn) () =
  ({ routing_control_arn = routing_control_arn_ } : get_routing_control_state_request)

let make_routing_control ?control_panel_arn:(control_panel_arn_ : arn option)
    ?control_panel_name:(control_panel_name_ : control_panel_name option)
    ?routing_control_arn:(routing_control_arn_ : arn option)
    ?routing_control_name:(routing_control_name_ : routing_control_name option)
    ?routing_control_state:(routing_control_state_ : routing_control_state option)
    ?owner:(owner_ : owner option) () =
  ({
     control_panel_arn = control_panel_arn_;
     control_panel_name = control_panel_name_;
     routing_control_arn = routing_control_arn_;
     routing_control_name = routing_control_name_;
     routing_control_state = routing_control_state_;
     owner = owner_;
   }
    : routing_control)

let make_list_routing_controls_response ?next_token:(next_token_ : page_token option)
    ~routing_controls:(routing_controls_ : routing_controls) () =
  ({ routing_controls = routing_controls_; next_token = next_token_ }
    : list_routing_controls_response)

let make_list_routing_controls_request ?control_panel_arn:(control_panel_arn_ : arn option)
    ?next_token:(next_token_ : page_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ control_panel_arn = control_panel_arn_; next_token = next_token_; max_results = max_results_ }
    : list_routing_controls_request)

let make_update_routing_control_states_response () = (() : unit)

let make_update_routing_control_state_entry ~routing_control_arn:(routing_control_arn_ : arn)
    ~routing_control_state:(routing_control_state_ : routing_control_state) () =
  ({ routing_control_arn = routing_control_arn_; routing_control_state = routing_control_state_ }
    : update_routing_control_state_entry)

let make_update_routing_control_states_request
    ?safety_rules_to_override:(safety_rules_to_override_ : arns option)
    ~update_routing_control_state_entries:
      (update_routing_control_state_entries_ : update_routing_control_state_entries) () =
  ({
     update_routing_control_state_entries = update_routing_control_state_entries_;
     safety_rules_to_override = safety_rules_to_override_;
   }
    : update_routing_control_states_request)

let make_update_routing_control_state_response () = (() : unit)

let make_update_routing_control_state_request
    ?safety_rules_to_override:(safety_rules_to_override_ : arns option)
    ~routing_control_arn:(routing_control_arn_ : arn)
    ~routing_control_state:(routing_control_state_ : routing_control_state) () =
  ({
     routing_control_arn = routing_control_arn_;
     routing_control_state = routing_control_state_;
     safety_rules_to_override = safety_rules_to_override_;
   }
    : update_routing_control_state_request)
