(** 
    Route53 Recovery Cluster client library built on EIO.
    
*)

(** {1:types Types} *)

type nonrec validation_exception_reason =
  | OTHER [@ocaml.doc ""]
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | CANNOT_PARSE [@ocaml.doc ""]
  | UNKNOWN_OPERATION [@ocaml.doc ""][@@ocaml.doc
                                       "Reason the request failed validation"]
type nonrec string_ = string[@@ocaml.doc ""]
type nonrec validation_exception_field =
  {
  message: string_
    [@ocaml.doc "Information about the validation exception.\n"];
  name: string_ [@ocaml.doc "The field that had the validation exception.\n"]}
[@@ocaml.doc "There was a validation error on the request.\n"]
type nonrec validation_exception_field_list = validation_exception_field list
[@@ocaml.doc ""]
type nonrec validation_exception =
  {
  fields: validation_exception_field_list option [@ocaml.doc ""];
  reason: validation_exception_reason option [@ocaml.doc ""];
  message: string_ [@ocaml.doc ""]}[@@ocaml.doc
                                     "There was a validation error on the request.\n"]
type nonrec update_routing_control_states_response = unit[@@ocaml.doc ""]
type nonrec arn = string[@@ocaml.doc ""]
type nonrec routing_control_state =
  | Off [@ocaml.doc ""]
  | On [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_routing_control_state_entry =
  {
  routing_control_state: routing_control_state
    [@ocaml.doc
      "The routing control state in a set of routing control state entries.\n"];
  routing_control_arn: arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for a routing control state entry.\n"]}
[@@ocaml.doc "A routing control state entry.\n"]
type nonrec update_routing_control_state_entries =
  update_routing_control_state_entry list[@@ocaml.doc ""]
type nonrec arns = arn list[@@ocaml.doc ""]
type nonrec update_routing_control_states_request =
  {
  safety_rules_to_override: arns option
    [@ocaml.doc
      "The Amazon Resource Names (ARNs) for the safety rules that you want to override when you're updating routing control states. You can override one safety rule or multiple safety rules by including one or more ARNs, separated by commas.\n\n For more information, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.override-safety-rule.html} Override safety rules to reroute traffic} in the Amazon Route 53 Application Recovery Controller Developer Guide.\n "];
  update_routing_control_state_entries: update_routing_control_state_entries
    [@ocaml.doc
      "A set of routing control entries that you want to update.\n"]}
[@@ocaml.doc ""]
type nonrec retry_after_seconds = int[@@ocaml.doc ""]
type nonrec throttling_exception =
  {
  retry_after_seconds: retry_after_seconds option [@ocaml.doc ""];
  message: string_ [@ocaml.doc ""]}[@@ocaml.doc
                                     "The request was denied because of request throttling.\n"]
type nonrec service_limit_exceeded_exception =
  {
  service_code: string_
    [@ocaml.doc "The service code of the limit that was exceeded.\n"];
  limit_code: string_
    [@ocaml.doc "The code of the limit that was exceeded.\n"];
  resource_type: string_ option
    [@ocaml.doc "The resource type of the limit that was exceeded.\n"];
  resource_id: string_ option
    [@ocaml.doc "The resource identifier of the limit that was exceeded.\n"];
  message: string_ [@ocaml.doc ""]}[@@ocaml.doc
                                     "The request can't update that many routing control states at the same time. Try again with fewer routing control states.\n"]
type nonrec resource_not_found_exception =
  {
  resource_type: string_
    [@ocaml.doc "Hypothetical resource type that was not found"];
  resource_id: string_
    [@ocaml.doc "Hypothetical resource identifier that was not found"];
  message: string_ [@ocaml.doc ""]}[@@ocaml.doc
                                     "The request references a routing control or control panel that was not found.\n"]
type nonrec internal_server_exception =
  {
  retry_after_seconds: retry_after_seconds option [@ocaml.doc ""];
  message: string_ [@ocaml.doc ""]}[@@ocaml.doc
                                     "There was an unexpected error during processing of the request.\n"]
type nonrec endpoint_temporarily_unavailable_exception =
  {
  message: string_ [@ocaml.doc ""]}[@@ocaml.doc
                                     "The cluster endpoint isn't available. Try another cluster endpoint.\n"]
type nonrec conflict_exception =
  {
  resource_type: string_ [@ocaml.doc "Type of the resource in use"];
  resource_id: string_ [@ocaml.doc "Identifier of the resource in use"];
  message: string_ [@ocaml.doc "Description of the ConflictException error"]}
[@@ocaml.doc "There was a conflict with this request. Try again.\n"]
type nonrec access_denied_exception = {
  message: string_ [@ocaml.doc ""]}[@@ocaml.doc
                                     "You don't have sufficient permissions to perform this action.\n"]
type nonrec update_routing_control_state_response = unit[@@ocaml.doc ""]
type nonrec update_routing_control_state_request =
  {
  safety_rules_to_override: arns option
    [@ocaml.doc
      "The Amazon Resource Names (ARNs) for the safety rules that you want to override when you're updating the state of a routing control. You can override one safety rule or multiple safety rules by including one or more ARNs, separated by commas.\n\n For more information, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.override-safety-rule.html} Override safety rules to reroute traffic} in the Amazon Route 53 Application Recovery Controller Developer Guide.\n "];
  routing_control_state: routing_control_state
    [@ocaml.doc
      "The state of the routing control. You can set the value to ON or OFF.\n"];
  routing_control_arn: arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for the routing control that you want to update the state for.\n"]}
[@@ocaml.doc ""]
type nonrec control_panel_name = string[@@ocaml.doc ""]
type nonrec routing_control_name = string[@@ocaml.doc ""]
type nonrec owner = string[@@ocaml.doc ""]
type nonrec routing_control =
  {
  owner: owner option
    [@ocaml.doc
      "The Amazon Web Services account ID of the routing control owner.\n"];
  routing_control_state: routing_control_state option
    [@ocaml.doc
      "The current state of the routing control. When a routing control state is set to ON, traffic flows to a cell. When the state is set to OFF, traffic does not flow. \n"];
  routing_control_name: routing_control_name option
    [@ocaml.doc "The name of the routing control.\n"];
  routing_control_arn: arn option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the routing control.\n"];
  control_panel_name: control_panel_name option
    [@ocaml.doc
      "The name of the control panel where the routing control is located. Only ASCII characters are supported for control panel names.\n"];
  control_panel_arn: arn option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the control panel where the routing control is located.\n"]}
[@@ocaml.doc
  "A routing control, which is a simple on/off switch that you can use to route traffic to cells. When a routing control state is set to ON, traffic flows to a cell. When the state is set to OFF, traffic does not flow. \n"]
type nonrec routing_controls = routing_control list[@@ocaml.doc ""]
type nonrec page_token = string[@@ocaml.doc ""]
type nonrec list_routing_controls_response =
  {
  next_token: page_token option
    [@ocaml.doc
      "The token for the next set of results. You receive this token from a previous call.\n"];
  routing_controls: routing_controls
    [@ocaml.doc "The list of routing controls.\n"]}[@@ocaml.doc ""]
type nonrec max_results = int[@@ocaml.doc ""]
type nonrec list_routing_controls_request =
  {
  max_results: max_results option
    [@ocaml.doc
      "The number of routing controls objects that you want to return with this call. The default value is 500.\n"];
  next_token: page_token option
    [@ocaml.doc
      "The token for the next set of results. You receive this token from a previous call.\n"];
  control_panel_arn: arn option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the control panel of the routing controls to list.\n"]}
[@@ocaml.doc ""]
type nonrec get_routing_control_state_response =
  {
  routing_control_name: routing_control_name option
    [@ocaml.doc "The routing control name.\n"];
  routing_control_state: routing_control_state
    [@ocaml.doc "The state of the routing control.\n"];
  routing_control_arn: arn
    [@ocaml.doc "The Amazon Resource Name (ARN) of the response.\n"]}
[@@ocaml.doc ""]
type nonrec get_routing_control_state_request =
  {
  routing_control_arn: arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for the routing control that you want to get the state for.\n"]}
[@@ocaml.doc ""](** {1:builders Builders} *)

val make_validation_exception_field :
  message:string_ -> name:string_ -> unit -> validation_exception_field
val make_update_routing_control_states_response : unit -> unit
val make_update_routing_control_state_entry :
  routing_control_state:routing_control_state ->
    routing_control_arn:arn -> unit -> update_routing_control_state_entry
val make_update_routing_control_states_request :
  ?safety_rules_to_override:arns ->
    update_routing_control_state_entries:update_routing_control_state_entries
      -> unit -> update_routing_control_states_request
val make_update_routing_control_state_response : unit -> unit
val make_update_routing_control_state_request :
  ?safety_rules_to_override:arns ->
    routing_control_state:routing_control_state ->
      routing_control_arn:arn -> unit -> update_routing_control_state_request
val make_routing_control :
  ?owner:owner ->
    ?routing_control_state:routing_control_state ->
      ?routing_control_name:routing_control_name ->
        ?routing_control_arn:arn ->
          ?control_panel_name:control_panel_name ->
            ?control_panel_arn:arn -> unit -> routing_control
val make_list_routing_controls_response :
  ?next_token:page_token ->
    routing_controls:routing_controls ->
      unit -> list_routing_controls_response
val make_list_routing_controls_request :
  ?max_results:max_results ->
    ?next_token:page_token ->
      ?control_panel_arn:arn -> unit -> list_routing_controls_request
val make_get_routing_control_state_response :
  ?routing_control_name:routing_control_name ->
    routing_control_state:routing_control_state ->
      routing_control_arn:arn -> unit -> get_routing_control_state_response
val make_get_routing_control_state_request :
  routing_control_arn:arn -> unit -> get_routing_control_state_request(** {1:operations Operations} *)

module GetRoutingControlState :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_routing_control_state_request ->
        (get_routing_control_state_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `EndpointTemporarilyUnavailableException of
              endpoint_temporarily_unavailable_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Get the state for a routing control. A routing control is a simple on/off switch that you can use to route traffic to cells. When a routing control state is set to ON, traffic flows to a cell. When the state is set to OFF, traffic does not flow. \n\n Before you can create a routing control, you must first create a cluster, and then host the control in a control panel on the cluster. For more information, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.create.html} Create routing control structures} in the Amazon Route 53 Application Recovery Controller Developer Guide. You access one of the endpoints for the cluster to get or update the routing control state to redirect traffic for your application. \n \n   {i You must specify Regional endpoints when you work with API cluster operations to get or update routing control states in Route 53 ARC.} \n  \n   To see a code example for getting a routing control state, including accessing Regional cluster endpoints in sequence, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/service_code_examples_actions.html}API examples} in the Amazon Route 53 Application Recovery Controller Developer Guide.\n   \n    Learn more about working with routing controls in the following topics in the Amazon Route 53 Application Recovery Controller Developer Guide:\n    \n     {ul\n           {-   {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.update.html} Viewing and updating routing control states} \n               \n                }\n           {-   {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.html}Working with routing controls in Route 53 ARC} \n               \n                }\n           }\n  "]
module ListRoutingControls :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_routing_controls_request ->
        (list_routing_controls_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `EndpointTemporarilyUnavailableException of
              endpoint_temporarily_unavailable_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "List routing control names and Amazon Resource Names (ARNs), as well as the routing control state for each routing control, along with the control panel name and control panel ARN for the routing controls. If you specify a control panel ARN, this call lists the routing controls in the control panel. Otherwise, it lists all the routing controls in the cluster.\n\n A routing control is a simple on/off switch in Route 53 ARC that you can use to route traffic to cells. When a routing control state is set to ON, traffic flows to a cell. When the state is set to OFF, traffic does not flow.\n \n  Before you can create a routing control, you must first create a cluster, and then host the control in a control panel on the cluster. For more information, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.create.html} Create routing control structures} in the Amazon Route 53 Application Recovery Controller Developer Guide. You access one of the endpoints for the cluster to get or update the routing control state to redirect traffic for your application. \n  \n    {i You must specify Regional endpoints when you work with API cluster operations to use this API operation to list routing controls in Route 53 ARC.} \n   \n    Learn more about working with routing controls in the following topics in the Amazon Route 53 Application Recovery Controller Developer Guide:\n    \n     {ul\n           {-   {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.update.html} Viewing and updating routing control states} \n               \n                }\n           {-   {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.html}Working with routing controls in Route 53 ARC} \n               \n                }\n           }\n  "]
module UpdateRoutingControlState :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_routing_control_state_request ->
        (update_routing_control_state_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `EndpointTemporarilyUnavailableException of
              endpoint_temporarily_unavailable_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Set the state of the routing control to reroute traffic. You can set the value to ON or OFF. When the state is ON, traffic flows to a cell. When the state is OFF, traffic does not flow.\n\n With Route 53 ARC, you can add safety rules for routing controls, which are safeguards for routing control state updates that help prevent unexpected outcomes, like fail open traffic routing. However, there are scenarios when you might want to bypass the routing control safeguards that are enforced with safety rules that you've configured. For example, you might want to fail over quickly for disaster recovery, and one or more safety rules might be unexpectedly preventing you from updating a routing control state to reroute traffic. In a \"break glass\" scenario like this, you can override one or more safety rules to change a routing control state and fail over your application.\n \n  The [SafetyRulesToOverride] property enables you override one or more safety rules and update routing control states. For more information, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.override-safety-rule.html} Override safety rules to reroute traffic} in the Amazon Route 53 Application Recovery Controller Developer Guide.\n  \n    {i You must specify Regional endpoints when you work with API cluster operations to get or update routing control states in Route 53 ARC.} \n   \n    To see a code example for getting a routing control state, including accessing Regional cluster endpoints in sequence, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/service_code_examples_actions.html}API examples} in the Amazon Route 53 Application Recovery Controller Developer Guide.\n    \n     {ul\n           {-   {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.update.html} Viewing and updating routing control states} \n               \n                }\n           {-   {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.html}Working with routing controls overall} \n               \n                }\n           }\n  "]
module UpdateRoutingControlStates :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_routing_control_states_request ->
        (update_routing_control_states_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `EndpointTemporarilyUnavailableException of
              endpoint_temporarily_unavailable_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceLimitExceededException of
              service_limit_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Set multiple routing control states. You can set the value for each state to be ON or OFF. When the state is ON, traffic flows to a cell. When it's OFF, traffic does not flow.\n\n With Route 53 ARC, you can add safety rules for routing controls, which are safeguards for routing control state updates that help prevent unexpected outcomes, like fail open traffic routing. However, there are scenarios when you might want to bypass the routing control safeguards that are enforced with safety rules that you've configured. For example, you might want to fail over quickly for disaster recovery, and one or more safety rules might be unexpectedly preventing you from updating a routing control state to reroute traffic. In a \"break glass\" scenario like this, you can override one or more safety rules to change a routing control state and fail over your application.\n \n  The [SafetyRulesToOverride] property enables you override one or more safety rules and update routing control states. For more information, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.override-safety-rule.html} Override safety rules to reroute traffic} in the Amazon Route 53 Application Recovery Controller Developer Guide.\n  \n    {i You must specify Regional endpoints when you work with API cluster operations to get or update routing control states in Route 53 ARC.} \n   \n    To see a code example for getting a routing control state, including accessing Regional cluster endpoints in sequence, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/service_code_examples_actions.html}API examples} in the Amazon Route 53 Application Recovery Controller Developer Guide.\n    \n     {ul\n           {-   {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.update.html} Viewing and updating routing control states} \n               \n                }\n           {-   {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.html}Working with routing controls overall} \n               \n                }\n           }\n  "]