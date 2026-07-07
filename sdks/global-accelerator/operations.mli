open Types

module AddCustomRoutingEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `EndpointAlreadyExistsException of endpoint_already_exists_exception
    | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_custom_routing_endpoints_request ->
    ( add_custom_routing_endpoints_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EndpointAlreadyExistsException of endpoint_already_exists_exception
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_custom_routing_endpoints_request ->
    ( add_custom_routing_endpoints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EndpointAlreadyExistsException of endpoint_already_exists_exception
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associate a virtual private cloud (VPC) subnet endpoint with your custom routing accelerator.\n\n\
  \ The listener port range must be large enough to support the number of IP addresses that can be \
   specified in your subnet. The number of ports required is: subnet size times the number of \
   ports per destination EC2 instances. For example, a subnet defined as /24 requires a listener \
   port range of at least 255 ports. \n\
  \ \n\
  \  Note: You must have enough remaining listener ports available to map to the subnet ports, or \
   the call will fail with a LimitExceededException.\n\
  \  \n\
  \   By default, all destinations in a subnet in a custom routing accelerator cannot receive \
   traffic. To enable all destinations to receive traffic, or to specify individual port mappings \
   that can receive traffic, see the \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/api/API_AllowCustomRoutingTraffic.html} \
   AllowCustomRoutingTraffic} operation.\n\
  \   "]

module AddEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TransactionInProgressException of transaction_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_endpoints_request ->
    ( add_endpoints_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TransactionInProgressException of transaction_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_endpoints_request ->
    ( add_endpoints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TransactionInProgressException of transaction_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Add endpoints to an endpoint group. The [AddEndpoints] API operation is the recommended option \
   for adding endpoints. The alternative options are to add endpoints when you create an endpoint \
   group (with the \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/api/API_CreateEndpointGroup.html}CreateEndpointGroup} \
   API) or when you update an endpoint group (with the \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/api/API_UpdateEndpointGroup.html}UpdateEndpointGroup} \
   API). \n\n\
  \ There are two advantages to using [AddEndpoints] to add endpoints in Global Accelerator:\n\
  \ \n\
  \  {ul\n\
  \        {-  It's faster, because Global Accelerator only has to resolve the new endpoints that \
   you're adding, rather than resolving new and existing endpoints.\n\
  \            \n\
  \             }\n\
  \        {-  It's more convenient, because you don't need to specify the current endpoints that \
   are already in the endpoint group, in addition to the new endpoints that you want to add.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For information about endpoint types and requirements for endpoints that you can add to \
   Global Accelerator, see \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/about-endpoints.html} Endpoints for \
   standard accelerators} in the {i Global Accelerator Developer Guide}.\n\
  \   "]

module AdvertiseByoipCidr : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ByoipCidrNotFoundException of byoip_cidr_not_found_exception
    | `IncorrectCidrStateException of incorrect_cidr_state_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    advertise_byoip_cidr_request ->
    ( advertise_byoip_cidr_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ByoipCidrNotFoundException of byoip_cidr_not_found_exception
      | `IncorrectCidrStateException of incorrect_cidr_state_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    advertise_byoip_cidr_request ->
    ( advertise_byoip_cidr_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ByoipCidrNotFoundException of byoip_cidr_not_found_exception
      | `IncorrectCidrStateException of incorrect_cidr_state_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Advertises an IPv4 address range that is provisioned for use with your Amazon Web Services \
   resources through bring your own IP addresses (BYOIP). It can take a few minutes before traffic \
   to the specified addresses starts routing to Amazon Web Services because of propagation delays. \
   \n\n\
  \ To stop advertising the BYOIP address range, use \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/api/WithdrawByoipCidr.html} \
   WithdrawByoipCidr}.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html}Bring your own IP \
   addresses (BYOIP)} in the {i Global Accelerator Developer Guide}.\n\
  \  "]

module AllowCustomRoutingTraffic : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    allow_custom_routing_traffic_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    allow_custom_routing_traffic_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Specify the Amazon EC2 instance (destination) IP addresses and ports for a VPC subnet endpoint \
   that can receive traffic for a custom routing accelerator. You can allow traffic to all \
   destinations in the subnet endpoint, or allow traffic to a specified list of destination IP \
   addresses and ports in the subnet. Note that you cannot specify IP addresses or ports outside \
   of the range that you configured for the endpoint group.\n\n\
  \ After you make changes, you can verify that the updates are complete by checking the status of \
   your accelerator: the status changes from IN_PROGRESS to DEPLOYED.\n\
  \ "]

module CreateAccelerator : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TransactionInProgressException of transaction_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_accelerator_request ->
    ( create_accelerator_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TransactionInProgressException of transaction_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_accelerator_request ->
    ( create_accelerator_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TransactionInProgressException of transaction_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Create an accelerator. An accelerator includes one or more listeners that process inbound \
   connections and direct traffic to one or more endpoint groups, each of which includes \
   endpoints, such as Network Load Balancers. \n\n\
  \  Global Accelerator is a global service that supports endpoints in multiple Amazon Web \
   Services Regions but you must specify the US West (Oregon) Region to create, update, or \
   otherwise work with accelerators. That is, for example, specify [--region us-west-2] on Amazon \
   Web Services CLI commands.\n\
  \  \n\
  \   "]

module CreateCrossAccountAttachment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TransactionInProgressException of transaction_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cross_account_attachment_request ->
    ( create_cross_account_attachment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TransactionInProgressException of transaction_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cross_account_attachment_request ->
    ( create_cross_account_attachment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TransactionInProgressException of transaction_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Create a cross-account attachment in Global Accelerator. You create a cross-account attachment \
   to specify the {i principals} who have permission to work with {i resources} in accelerators in \
   their own account. You specify, in the same attachment, the resources that are shared.\n\n\
  \ A principal can be an Amazon Web Services account number or the Amazon Resource Name (ARN) for \
   an accelerator. For account numbers that are listed as principals, to work with a resource \
   listed in the attachment, you must sign in to an account specified as a principal. Then, you \
   can work with resources that are listed, with any of your accelerators. If an accelerator ARN \
   is listed in the cross-account attachment as a principal, anyone with permission to make \
   updates to the accelerator can work with resources that are listed in the attachment. \n\
  \ \n\
  \  Specify each principal and resource separately. To specify two CIDR address pools, list them \
   individually under [Resources], and so on. For a command line operation, for example, you might \
   use a statement like the following:\n\
  \  \n\
  \    [ \"Resources\": \\[{\"Cidr\": \"169.254.60.0/24\"},{\"Cidr\": \"169.254.59.0/24\"}\\]] \n\
  \   \n\
  \    For more information, see \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/cross-account-resources.html} \
   Working with cross-account attachments and resources in Global Accelerator} in the {i  Global \
   Accelerator Developer Guide}.\n\
  \    "]

module CreateCustomRoutingAccelerator : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TransactionInProgressException of transaction_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_custom_routing_accelerator_request ->
    ( create_custom_routing_accelerator_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TransactionInProgressException of transaction_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_custom_routing_accelerator_request ->
    ( create_custom_routing_accelerator_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TransactionInProgressException of transaction_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Create a custom routing accelerator. A custom routing accelerator directs traffic to one of \
   possibly thousands of Amazon EC2 instance destinations running in a single or multiple virtual \
   private clouds (VPC) subnet endpoints.\n\n\
  \ Be aware that, by default, all destination EC2 instances in a VPC subnet endpoint cannot \
   receive traffic. To enable all destinations to receive traffic, or to specify individual port \
   mappings that can receive traffic, see the \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/api/API_AllowCustomRoutingTraffic.html} \
   AllowCustomRoutingTraffic} operation.\n\
  \ \n\
  \   Global Accelerator is a global service that supports endpoints in multiple Amazon Web \
   Services Regions but you must specify the US West (Oregon) Region to create, update, or \
   otherwise work with accelerators. That is, for example, specify [--region us-west-2] on Amazon \
   Web Services CLI commands.\n\
  \   \n\
  \    "]

module CreateCustomRoutingEndpointGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `AccessDeniedException of access_denied_exception
    | `EndpointGroupAlreadyExistsException of endpoint_group_already_exists_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidPortRangeException of invalid_port_range_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ListenerNotFoundException of listener_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_custom_routing_endpoint_group_request ->
    ( create_custom_routing_endpoint_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `AccessDeniedException of access_denied_exception
      | `EndpointGroupAlreadyExistsException of endpoint_group_already_exists_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidPortRangeException of invalid_port_range_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ListenerNotFoundException of listener_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_custom_routing_endpoint_group_request ->
    ( create_custom_routing_endpoint_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `AccessDeniedException of access_denied_exception
      | `EndpointGroupAlreadyExistsException of endpoint_group_already_exists_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidPortRangeException of invalid_port_range_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ListenerNotFoundException of listener_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Create an endpoint group for the specified listener for a custom routing accelerator. An \
   endpoint group is a collection of endpoints in one Amazon Web Services Region. \n"]

module CreateCustomRoutingListener : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidPortRangeException of invalid_port_range_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_custom_routing_listener_request ->
    ( create_custom_routing_listener_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidPortRangeException of invalid_port_range_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_custom_routing_listener_request ->
    ( create_custom_routing_listener_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidPortRangeException of invalid_port_range_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Create a listener to process inbound connections from clients to a custom routing accelerator. \
   Connections arrive to assigned static IP addresses on the port range that you specify. \n"]

module CreateEndpointGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `AccessDeniedException of access_denied_exception
    | `EndpointGroupAlreadyExistsException of endpoint_group_already_exists_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ListenerNotFoundException of listener_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_endpoint_group_request ->
    ( create_endpoint_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `AccessDeniedException of access_denied_exception
      | `EndpointGroupAlreadyExistsException of endpoint_group_already_exists_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ListenerNotFoundException of listener_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_endpoint_group_request ->
    ( create_endpoint_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `AccessDeniedException of access_denied_exception
      | `EndpointGroupAlreadyExistsException of endpoint_group_already_exists_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ListenerNotFoundException of listener_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Create an endpoint group for the specified listener. An endpoint group is a collection of \
   endpoints in one Amazon Web Services Region. A resource must be valid and active when you add \
   it as an endpoint.\n\n\
  \ For more information about endpoint types and requirements for endpoints that you can add to \
   Global Accelerator, see \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/about-endpoints.html} Endpoints for \
   standard accelerators} in the {i Global Accelerator Developer Guide}.\n\
  \ "]

module CreateListener : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidPortRangeException of invalid_port_range_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_listener_request ->
    ( create_listener_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidPortRangeException of invalid_port_range_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_listener_request ->
    ( create_listener_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidPortRangeException of invalid_port_range_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Create a listener to process inbound connections from clients to an accelerator. Connections \
   arrive to assigned static IP addresses on a port, port range, or list of port ranges that you \
   specify. \n"]

module DeleteAccelerator : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotDisabledException of accelerator_not_disabled_exception
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `AssociatedListenerFoundException of associated_listener_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `TransactionInProgressException of transaction_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_accelerator_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotDisabledException of accelerator_not_disabled_exception
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `AssociatedListenerFoundException of associated_listener_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `TransactionInProgressException of transaction_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_accelerator_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotDisabledException of accelerator_not_disabled_exception
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `AssociatedListenerFoundException of associated_listener_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `TransactionInProgressException of transaction_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Delete an accelerator. Before you can delete an accelerator, you must disable it and remove all \
   dependent resources (listeners and endpoint groups). To disable the accelerator, update the \
   accelerator to set [Enabled] to false.\n\n\
  \  When you create an accelerator, by default, Global Accelerator provides you with a set of two \
   static IP addresses. Alternatively, you can bring your own IP address ranges to Global \
   Accelerator and assign IP addresses from those ranges. \n\
  \  \n\
  \   The IP addresses are assigned to your accelerator for as long as it exists, even if you \
   disable the accelerator and it no longer accepts or routes traffic. However, when you {i \
   delete} an accelerator, you lose the static IP addresses that are assigned to the accelerator, \
   so you can no longer route traffic by using them. As a best practice, ensure that you have \
   permissions in place to avoid inadvertently deleting accelerators. You can use IAM policies \
   with Global Accelerator to limit the users who have permissions to delete an accelerator. For \
   more information, see \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/auth-and-access-control.html}Identity \
   and access management} in the {i Global Accelerator Developer Guide}.\n\
  \   \n\
  \    "]

module DeleteCrossAccountAttachment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AttachmentNotFoundException of attachment_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `TransactionInProgressException of transaction_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cross_account_attachment_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AttachmentNotFoundException of attachment_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `TransactionInProgressException of transaction_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cross_account_attachment_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AttachmentNotFoundException of attachment_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `TransactionInProgressException of transaction_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Delete a cross-account attachment. When you delete an attachment, Global Accelerator revokes \
   the permission to use the resources in the attachment from all principals in the list of \
   principals. Global Accelerator revokes the permission for specific resources.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/cross-account-resources.html} \
   Working with cross-account attachments and resources in Global Accelerator} in the {i  Global \
   Accelerator Developer Guide}.\n\
  \ "]

module DeleteCustomRoutingAccelerator : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotDisabledException of accelerator_not_disabled_exception
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `AssociatedListenerFoundException of associated_listener_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `TransactionInProgressException of transaction_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_routing_accelerator_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotDisabledException of accelerator_not_disabled_exception
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `AssociatedListenerFoundException of associated_listener_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `TransactionInProgressException of transaction_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_routing_accelerator_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotDisabledException of accelerator_not_disabled_exception
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `AssociatedListenerFoundException of associated_listener_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `TransactionInProgressException of transaction_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Delete a custom routing accelerator. Before you can delete an accelerator, you must disable it \
   and remove all dependent resources (listeners and endpoint groups). To disable the accelerator, \
   update the accelerator to set [Enabled] to false.\n\n\
  \  When you create a custom routing accelerator, by default, Global Accelerator provides you \
   with a set of two static IP addresses. \n\
  \  \n\
  \   The IP addresses are assigned to your accelerator for as long as it exists, even if you \
   disable the accelerator and it no longer accepts or routes traffic. However, when you {i \
   delete} an accelerator, you lose the static IP addresses that are assigned to the accelerator, \
   so you can no longer route traffic by using them. As a best practice, ensure that you have \
   permissions in place to avoid inadvertently deleting accelerators. You can use IAM policies \
   with Global Accelerator to limit the users who have permissions to delete an accelerator. For \
   more information, see \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/auth-and-access-control.html}Identity \
   and access management} in the {i Global Accelerator Developer Guide}.\n\
  \   \n\
  \    "]

module DeleteCustomRoutingEndpointGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_routing_endpoint_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_routing_endpoint_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Delete an endpoint group from a listener for a custom routing accelerator.\n"]

module DeleteCustomRoutingListener : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AssociatedEndpointGroupFoundException of associated_endpoint_group_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ListenerNotFoundException of listener_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_routing_listener_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociatedEndpointGroupFoundException of associated_endpoint_group_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ListenerNotFoundException of listener_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_routing_listener_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociatedEndpointGroupFoundException of associated_endpoint_group_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ListenerNotFoundException of listener_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Delete a listener for a custom routing accelerator.\n"]

module DeleteEndpointGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_endpoint_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_endpoint_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Delete an endpoint group from a listener.\n"]

module DeleteListener : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AssociatedEndpointGroupFoundException of associated_endpoint_group_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ListenerNotFoundException of listener_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_listener_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociatedEndpointGroupFoundException of associated_endpoint_group_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ListenerNotFoundException of listener_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_listener_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociatedEndpointGroupFoundException of associated_endpoint_group_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ListenerNotFoundException of listener_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Delete a listener from an accelerator.\n"]

module DenyCustomRoutingTraffic : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deny_custom_routing_traffic_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deny_custom_routing_traffic_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Specify the Amazon EC2 instance (destination) IP addresses and ports for a VPC subnet endpoint \
   that cannot receive traffic for a custom routing accelerator. You can deny traffic to all \
   destinations in the VPC endpoint, or deny traffic to a specified list of destination IP \
   addresses and ports. Note that you cannot specify IP addresses or ports outside of the range \
   that you configured for the endpoint group.\n\n\
  \ After you make changes, you can verify that the updates are complete by checking the status of \
   your accelerator: the status changes from IN_PROGRESS to DEPLOYED.\n\
  \ "]

module DeprovisionByoipCidr : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ByoipCidrNotFoundException of byoip_cidr_not_found_exception
    | `IncorrectCidrStateException of incorrect_cidr_state_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deprovision_byoip_cidr_request ->
    ( deprovision_byoip_cidr_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ByoipCidrNotFoundException of byoip_cidr_not_found_exception
      | `IncorrectCidrStateException of incorrect_cidr_state_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deprovision_byoip_cidr_request ->
    ( deprovision_byoip_cidr_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ByoipCidrNotFoundException of byoip_cidr_not_found_exception
      | `IncorrectCidrStateException of incorrect_cidr_state_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Releases the specified address range that you provisioned to use with your Amazon Web Services \
   resources through bring your own IP addresses (BYOIP) and deletes the corresponding address \
   pool. \n\n\
  \ Before you can release an address range, you must stop advertising it by using \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/api/WithdrawByoipCidr.html}WithdrawByoipCidr} \
   and you must not have any accelerators that are using static IP addresses allocated from its \
   address range. \n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html}Bring your own IP \
   addresses (BYOIP)} in the {i Global Accelerator Developer Guide}.\n\
  \  "]

module DescribeAccelerator : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_accelerator_request ->
    ( describe_accelerator_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_accelerator_request ->
    ( describe_accelerator_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describe an accelerator. \n"]

module DescribeAcceleratorAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_accelerator_attributes_request ->
    ( describe_accelerator_attributes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_accelerator_attributes_request ->
    ( describe_accelerator_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describe the attributes of an accelerator. \n"]

module DescribeCrossAccountAttachment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AttachmentNotFoundException of attachment_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cross_account_attachment_request ->
    ( describe_cross_account_attachment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AttachmentNotFoundException of attachment_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cross_account_attachment_request ->
    ( describe_cross_account_attachment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AttachmentNotFoundException of attachment_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets configuration information about a cross-account attachment.\n"]

module DescribeCustomRoutingAccelerator : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_custom_routing_accelerator_request ->
    ( describe_custom_routing_accelerator_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_custom_routing_accelerator_request ->
    ( describe_custom_routing_accelerator_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describe a custom routing accelerator. \n"]

module DescribeCustomRoutingAcceleratorAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_custom_routing_accelerator_attributes_request ->
    ( describe_custom_routing_accelerator_attributes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_custom_routing_accelerator_attributes_request ->
    ( describe_custom_routing_accelerator_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describe the attributes of a custom routing accelerator. \n"]

module DescribeCustomRoutingEndpointGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_custom_routing_endpoint_group_request ->
    ( describe_custom_routing_endpoint_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_custom_routing_endpoint_group_request ->
    ( describe_custom_routing_endpoint_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describe an endpoint group for a custom routing accelerator. \n"]

module DescribeCustomRoutingListener : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ListenerNotFoundException of listener_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_custom_routing_listener_request ->
    ( describe_custom_routing_listener_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ListenerNotFoundException of listener_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_custom_routing_listener_request ->
    ( describe_custom_routing_listener_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ListenerNotFoundException of listener_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "The description of a listener for a custom routing accelerator.\n"]

module DescribeEndpointGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoint_group_request ->
    ( describe_endpoint_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoint_group_request ->
    ( describe_endpoint_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describe an endpoint group. \n"]

module DescribeListener : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ListenerNotFoundException of listener_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_listener_request ->
    ( describe_listener_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ListenerNotFoundException of listener_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_listener_request ->
    ( describe_listener_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ListenerNotFoundException of listener_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describe a listener. \n"]

module ListAccelerators : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_accelerators_request ->
    ( list_accelerators_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_accelerators_request ->
    ( list_accelerators_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the accelerators for an Amazon Web Services account. \n"]

module ListByoipCidrs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_byoip_cidrs_request ->
    ( list_byoip_cidrs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_byoip_cidrs_request ->
    ( list_byoip_cidrs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the IP address ranges that were specified in calls to \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/api/ProvisionByoipCidr.html}ProvisionByoipCidr}, \
   including the current state and a history of state changes.\n"]

module ListCrossAccountAttachments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_cross_account_attachments_request ->
    ( list_cross_account_attachments_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_cross_account_attachments_request ->
    ( list_cross_account_attachments_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the cross-account attachments that have been created in Global Accelerator.\n"]

module ListCrossAccountResourceAccounts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_cross_account_resource_accounts_request ->
    ( list_cross_account_resource_accounts_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_cross_account_resource_accounts_request ->
    ( list_cross_account_resource_accounts_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List the accounts that have cross-account resources.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/cross-account-resources.html} \
   Working with cross-account attachments and resources in Global Accelerator} in the {i  Global \
   Accelerator Developer Guide}.\n\
  \ "]

module ListCrossAccountResources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_cross_account_resources_request ->
    ( list_cross_account_resources_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_cross_account_resources_request ->
    ( list_cross_account_resources_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the cross-account resources available to work with.\n"]

module ListCustomRoutingAccelerators : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_custom_routing_accelerators_request ->
    ( list_custom_routing_accelerators_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_custom_routing_accelerators_request ->
    ( list_custom_routing_accelerators_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the custom routing accelerators for an Amazon Web Services account. \n"]

module ListCustomRoutingEndpointGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ListenerNotFoundException of listener_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_custom_routing_endpoint_groups_request ->
    ( list_custom_routing_endpoint_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ListenerNotFoundException of listener_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_custom_routing_endpoint_groups_request ->
    ( list_custom_routing_endpoint_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ListenerNotFoundException of listener_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List the endpoint groups that are associated with a listener for a custom routing accelerator. \n"]

module ListCustomRoutingListeners : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_custom_routing_listeners_request ->
    ( list_custom_routing_listeners_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_custom_routing_listeners_request ->
    ( list_custom_routing_listeners_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the listeners for a custom routing accelerator. \n"]

module ListCustomRoutingPortMappings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_custom_routing_port_mappings_request ->
    ( list_custom_routing_port_mappings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_custom_routing_port_mappings_request ->
    ( list_custom_routing_port_mappings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides a complete mapping from the public accelerator IP address and port to destination EC2 \
   instance IP addresses and ports in the virtual public cloud (VPC) subnet endpoint for a custom \
   routing accelerator. For each subnet endpoint that you add, Global Accelerator creates a new \
   static port mapping for the accelerator. The port mappings don't change after Global \
   Accelerator generates them, so you can retrieve and cache the full mapping on your servers. \n\n\
  \ If you remove a subnet from your accelerator, Global Accelerator removes (reclaims) the port \
   mappings. If you add a subnet to your accelerator, Global Accelerator creates new port mappings \
   (the existing ones don't change). If you add or remove EC2 instances in your subnet, the port \
   mappings don't change, because the mappings are created when you add the subnet to Global \
   Accelerator.\n\
  \ \n\
  \  The mappings also include a flag for each destination denoting which destination IP addresses \
   and ports are allowed or denied traffic.\n\
  \  "]

module ListCustomRoutingPortMappingsByDestination : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EndpointNotFoundException of endpoint_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_custom_routing_port_mappings_by_destination_request ->
    ( list_custom_routing_port_mappings_by_destination_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EndpointNotFoundException of endpoint_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_custom_routing_port_mappings_by_destination_request ->
    ( list_custom_routing_port_mappings_by_destination_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EndpointNotFoundException of endpoint_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List the port mappings for a specific EC2 instance (destination) in a VPC subnet endpoint. The \
   response is the mappings for one destination IP address. This is useful when your subnet \
   endpoint has mappings that span multiple custom routing accelerators in your account, or for \
   scenarios where you only want to list the port mappings for a specific destination instance.\n"]

module ListEndpointGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ListenerNotFoundException of listener_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_endpoint_groups_request ->
    ( list_endpoint_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ListenerNotFoundException of listener_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_endpoint_groups_request ->
    ( list_endpoint_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ListenerNotFoundException of listener_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the endpoint groups that are associated with a listener. \n"]

module ListListeners : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_listeners_request ->
    ( list_listeners_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_listeners_request ->
    ( list_listeners_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the listeners for an accelerator. \n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `AttachmentNotFoundException of attachment_not_found_exception
    | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ListenerNotFoundException of listener_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `AttachmentNotFoundException of attachment_not_found_exception
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ListenerNotFoundException of listener_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `AttachmentNotFoundException of attachment_not_found_exception
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ListenerNotFoundException of listener_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List all tags for an accelerator. \n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/tagging-in-global-accelerator.html}Tagging \
   in Global Accelerator} in the {i Global Accelerator Developer Guide}. \n\
  \ "]

module ProvisionByoipCidr : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IncorrectCidrStateException of incorrect_cidr_state_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    provision_byoip_cidr_request ->
    ( provision_byoip_cidr_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IncorrectCidrStateException of incorrect_cidr_state_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    provision_byoip_cidr_request ->
    ( provision_byoip_cidr_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IncorrectCidrStateException of incorrect_cidr_state_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provisions an IP address range to use with your Amazon Web Services resources through bring \
   your own IP addresses (BYOIP) and creates a corresponding address pool. After the address range \
   is provisioned, it is ready to be advertised using \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/api/AdvertiseByoipCidr.html} \
   AdvertiseByoipCidr}.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html}Bring your own IP \
   addresses (BYOIP)} in the {i Global Accelerator Developer Guide}.\n\
  \ "]

module RemoveCustomRoutingEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
    | `EndpointNotFoundException of endpoint_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_custom_routing_endpoints_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `EndpointNotFoundException of endpoint_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_custom_routing_endpoints_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `EndpointNotFoundException of endpoint_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Remove endpoints from a custom routing accelerator.\n"]

module RemoveEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `TransactionInProgressException of transaction_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_endpoints_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `TransactionInProgressException of transaction_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_endpoints_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `TransactionInProgressException of transaction_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Remove endpoints from an endpoint group. \n\n\
  \ The [RemoveEndpoints] API operation is the recommended option for removing endpoints. The \
   alternative is to remove endpoints by updating an endpoint group by using the \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/api/API_UpdateEndpointGroup.html}UpdateEndpointGroup} \
   API operation. There are two advantages to using [AddEndpoints] to remove endpoints instead:\n\
  \ \n\
  \  {ul\n\
  \        {-  It's more convenient, because you only need to specify the endpoints that you want \
   to remove. With the [UpdateEndpointGroup] API operation, you must specify all of the endpoints \
   in the endpoint group except the ones that you want to remove from the group.\n\
  \            \n\
  \             }\n\
  \        {-  It's faster, because Global Accelerator doesn't need to resolve any endpoints. With \
   the [UpdateEndpointGroup] API operation, Global Accelerator must resolve all of the endpoints \
   that remain in the group.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Add tags to an accelerator resource. \n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/tagging-in-global-accelerator.html}Tagging \
   in Global Accelerator} in the {i Global Accelerator Developer Guide}. \n\
  \ "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Remove tags from a Global Accelerator resource. When you specify a tag key, the action removes \
   both that key and its associated value. The operation succeeds even if you attempt to remove \
   tags from an accelerator that was already removed.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/tagging-in-global-accelerator.html}Tagging \
   in Global Accelerator} in the {i Global Accelerator Developer Guide}.\n\
  \ "]

module UpdateAccelerator : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `TransactionInProgressException of transaction_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_accelerator_request ->
    ( update_accelerator_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `TransactionInProgressException of transaction_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_accelerator_request ->
    ( update_accelerator_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `TransactionInProgressException of transaction_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Update an accelerator to make changes, such as the following: \n\n\
  \ {ul\n\
  \       {-  Change the name of the accelerator.\n\
  \           \n\
  \            }\n\
  \       {-  Disable the accelerator so that it no longer accepts or routes traffic, or so that \
   you can delete it.\n\
  \           \n\
  \            }\n\
  \       {-  Enable the accelerator, if it is disabled.\n\
  \           \n\
  \            }\n\
  \       {-  Change the IP address type to dual-stack if it is IPv4, or change the IP address \
   type to IPv4 if it's dual-stack.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   Be aware that static IP addresses remain assigned to your accelerator for as long as it \
   exists, even if you disable the accelerator and it no longer accepts or routes traffic. \
   However, when you delete the accelerator, you lose the static IP addresses that are assigned to \
   it, so you can no longer route traffic by using them.\n\
  \   \n\
  \     Global Accelerator is a global service that supports endpoints in multiple Amazon Web \
   Services Regions but you must specify the US West (Oregon) Region to create, update, or \
   otherwise work with accelerators. That is, for example, specify [--region us-west-2] on Amazon \
   Web Services CLI commands.\n\
  \     \n\
  \      "]

module UpdateAcceleratorAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `TransactionInProgressException of transaction_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_accelerator_attributes_request ->
    ( update_accelerator_attributes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `TransactionInProgressException of transaction_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_accelerator_attributes_request ->
    ( update_accelerator_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `TransactionInProgressException of transaction_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update the attributes for an accelerator. \n"]

module UpdateCrossAccountAttachment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AttachmentNotFoundException of attachment_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TransactionInProgressException of transaction_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_cross_account_attachment_request ->
    ( update_cross_account_attachment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AttachmentNotFoundException of attachment_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TransactionInProgressException of transaction_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_cross_account_attachment_request ->
    ( update_cross_account_attachment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AttachmentNotFoundException of attachment_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TransactionInProgressException of transaction_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Update a cross-account attachment to add or remove principals or resources. When you update an \
   attachment to remove a principal (account ID or accelerator) or a resource, Global Accelerator \
   revokes the permission for specific resources. \n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/cross-account-resources.html} \
   Working with cross-account attachments and resources in Global Accelerator} in the {i  Global \
   Accelerator Developer Guide}.\n\
  \ "]

module UpdateCustomRoutingAccelerator : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `ConflictException of conflict_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `TransactionInProgressException of transaction_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_custom_routing_accelerator_request ->
    ( update_custom_routing_accelerator_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `TransactionInProgressException of transaction_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_custom_routing_accelerator_request ->
    ( update_custom_routing_accelerator_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `TransactionInProgressException of transaction_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update a custom routing accelerator. \n"]

module UpdateCustomRoutingAcceleratorAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AcceleratorNotFoundException of accelerator_not_found_exception
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `TransactionInProgressException of transaction_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_custom_routing_accelerator_attributes_request ->
    ( update_custom_routing_accelerator_attributes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `TransactionInProgressException of transaction_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_custom_routing_accelerator_attributes_request ->
    ( update_custom_routing_accelerator_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AcceleratorNotFoundException of accelerator_not_found_exception
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `TransactionInProgressException of transaction_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update the attributes for a custom routing accelerator. \n"]

module UpdateCustomRoutingListener : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidPortRangeException of invalid_port_range_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ListenerNotFoundException of listener_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_custom_routing_listener_request ->
    ( update_custom_routing_listener_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidPortRangeException of invalid_port_range_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ListenerNotFoundException of listener_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_custom_routing_listener_request ->
    ( update_custom_routing_listener_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidPortRangeException of invalid_port_range_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ListenerNotFoundException of listener_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update a listener for a custom routing accelerator. \n"]

module UpdateEndpointGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_endpoint_group_request ->
    ( update_endpoint_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_endpoint_group_request ->
    ( update_endpoint_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EndpointGroupNotFoundException of endpoint_group_not_found_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Update an endpoint group. A resource must be valid and active when you add it as an endpoint.\n"]

module UpdateListener : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidPortRangeException of invalid_port_range_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ListenerNotFoundException of listener_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_listener_request ->
    ( update_listener_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidPortRangeException of invalid_port_range_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ListenerNotFoundException of listener_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_listener_request ->
    ( update_listener_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidPortRangeException of invalid_port_range_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ListenerNotFoundException of listener_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update a listener. \n"]

module WithdrawByoipCidr : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ByoipCidrNotFoundException of byoip_cidr_not_found_exception
    | `IncorrectCidrStateException of incorrect_cidr_state_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidArgumentException of invalid_argument_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    withdraw_byoip_cidr_request ->
    ( withdraw_byoip_cidr_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ByoipCidrNotFoundException of byoip_cidr_not_found_exception
      | `IncorrectCidrStateException of incorrect_cidr_state_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    withdraw_byoip_cidr_request ->
    ( withdraw_byoip_cidr_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ByoipCidrNotFoundException of byoip_cidr_not_found_exception
      | `IncorrectCidrStateException of incorrect_cidr_state_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidArgumentException of invalid_argument_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops advertising an address range that is provisioned as an address pool. You can perform this \
   operation at most once every 10 seconds, even if you specify different address ranges each \
   time.\n\n\
  \ It can take a few minutes before traffic to the specified addresses stops routing to Amazon \
   Web Services because of propagation delays.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html}Bring your own IP \
   addresses (BYOIP)} in the {i Global Accelerator Developer Guide}.\n\
  \  "]
