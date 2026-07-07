open Types

module AcceptNetworkFirewallTransitGatewayAttachment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_network_firewall_transit_gateway_attachment_request ->
    ( accept_network_firewall_transit_gateway_attachment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_network_firewall_transit_gateway_attachment_request ->
    ( accept_network_firewall_transit_gateway_attachment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Accepts a transit gateway attachment request for Network Firewall. When you accept the \
   attachment request, Network Firewall creates the necessary routing components to enable traffic \
   flow between the transit gateway and firewall endpoints.\n\n\
  \ You must accept a transit gateway attachment to complete the creation of a transit \
   gateway-attached firewall, unless auto-accept is enabled on the transit gateway. After \
   acceptance, use [DescribeFirewall] to verify the firewall status.\n\
  \ \n\
  \  To reject an attachment instead of accepting it, use \
   [RejectNetworkFirewallTransitGatewayAttachment].\n\
  \  \n\
  \    It can take several minutes for the attachment acceptance to complete and the firewall to \
   become available.\n\
  \    \n\
  \     "]

module AssociateAvailabilityZones : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_availability_zones_request ->
    ( associate_availability_zones_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_availability_zones_request ->
    ( associate_availability_zones_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified Availability Zones with a transit gateway-attached firewall. For each \
   Availability Zone, Network Firewall creates a firewall endpoint to process traffic. You can \
   specify one or more Availability Zones where you want to deploy the firewall.\n\n\
  \ After adding Availability Zones, you must update your transit gateway route tables to direct \
   traffic through the new firewall endpoints. Use [DescribeFirewall] to monitor the status of the \
   new endpoints.\n\
  \ "]

module AssociateFirewallPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_firewall_policy_request ->
    ( associate_firewall_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_firewall_policy_request ->
    ( associate_firewall_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a [FirewallPolicy] to a [Firewall]. \n\n\
  \ A firewall policy defines how to monitor and manage your VPC network traffic, using a \
   collection of inspection rule groups and other settings. Each firewall requires one firewall \
   policy association, and you can use the same firewall policy for multiple firewalls. \n\
  \ "]

module AssociateSubnets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_subnets_request ->
    ( associate_subnets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_subnets_request ->
    ( associate_subnets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified subnets in the Amazon VPC to the firewall. You can specify one subnet \
   for each of the Availability Zones that the VPC spans. \n\n\
  \ This request creates an Network Firewall firewall endpoint in each of the subnets. To enable \
   the firewall's protections, you must also modify the VPC's route tables for each subnet's \
   Availability Zone, to redirect the traffic that's coming into and going out of the zone through \
   the firewall endpoint. \n\
  \ "]

module AttachRuleGroupsToProxyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    attach_rule_groups_to_proxy_configuration_request ->
    ( attach_rule_groups_to_proxy_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    attach_rule_groups_to_proxy_configuration_request ->
    ( attach_rule_groups_to_proxy_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches [ProxyRuleGroup] resources to a [ProxyConfiguration] \n\n\
  \ A Proxy Configuration defines the monitoring and protection behavior for a Proxy. The details \
   of the behavior are defined in the rule groups that you add to your configuration. \n\
  \ "]

module CreateContainerAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_container_association_request ->
    ( create_container_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_container_association_request ->
    ( create_container_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a container association for Network Firewall. A container association links container \
   clusters (ECS or EKS) to Network Firewall, enabling dynamic IP resolution for firewall rules \
   based on container attributes.\n\n\
  \ To manage a container association's tags, use the standard Amazon Web Services resource \
   tagging operations, [ListTagsForResource], [TagResource], and [UntagResource].\n\
  \ \n\
  \  To retrieve information about container associations, use [ListContainerAssociations] and \
   [DescribeContainerAssociation].\n\
  \  "]

module CreateFirewall : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_firewall_request ->
    ( create_firewall_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_firewall_request ->
    ( create_firewall_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Network Firewall [Firewall] and accompanying [FirewallStatus] for a VPC. \n\n\
  \ The firewall defines the configuration settings for an Network Firewall firewall. The settings \
   that you can define at creation include the firewall policy, the subnets in your VPC to use for \
   the firewall endpoints, and any tags that are attached to the firewall Amazon Web Services \
   resource. \n\
  \ \n\
  \  After you create a firewall, you can provide additional settings, like the logging \
   configuration. \n\
  \  \n\
  \   To update the settings for a firewall, you use the operations that apply to the settings \
   themselves, for example [UpdateLoggingConfiguration], [AssociateSubnets], and \
   [UpdateFirewallDeleteProtection]. \n\
  \   \n\
  \    To manage a firewall's tags, use the standard Amazon Web Services resource tagging \
   operations, [ListTagsForResource], [TagResource], and [UntagResource].\n\
  \    \n\
  \     To retrieve information about firewalls, use [ListFirewalls] and [DescribeFirewall].\n\
  \     \n\
  \      To generate a report on the last 30 days of traffic monitored by a firewall, use \
   [StartAnalysisReport].\n\
  \      "]

module CreateFirewallPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_firewall_policy_request ->
    ( create_firewall_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_firewall_policy_request ->
    ( create_firewall_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates the firewall policy for the firewall according to the specifications. \n\n\
  \ An Network Firewall firewall policy defines the behavior of a firewall, in a collection of \
   stateless and stateful rule groups and other settings. You can use one firewall policy for \
   multiple firewalls. \n\
  \ "]

module CreateProxy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_proxy_request ->
    ( create_proxy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_proxy_request ->
    ( create_proxy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Network Firewall [Proxy] \n\n\
  \ Attaches a Proxy configuration to a NAT Gateway. \n\
  \ \n\
  \  To manage a proxy's tags, use the standard Amazon Web Services resource tagging operations, \
   [ListTagsForResource], [TagResource], and [UntagResource].\n\
  \  \n\
  \   To retrieve information about proxies, use [ListProxies] and [DescribeProxy].\n\
  \   "]

module CreateProxyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_proxy_configuration_request ->
    ( create_proxy_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_proxy_configuration_request ->
    ( create_proxy_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Network Firewall [ProxyConfiguration] \n\n\
  \ A Proxy Configuration defines the monitoring and protection behavior for a Proxy. The details \
   of the behavior are defined in the rule groups that you add to your configuration. \n\
  \ \n\
  \  To manage a proxy configuration's tags, use the standard Amazon Web Services resource tagging \
   operations, [ListTagsForResource], [TagResource], and [UntagResource].\n\
  \  \n\
  \   To retrieve information about proxies, use [ListProxyConfigurations] and \
   [DescribeProxyConfiguration].\n\
  \   "]

module CreateProxyRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_proxy_rule_group_request ->
    ( create_proxy_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_proxy_rule_group_request ->
    ( create_proxy_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Network Firewall [ProxyRuleGroup] \n\n\
  \ Collections of related proxy filtering rules. Rule groups help you manage and reuse sets of \
   rules across multiple proxy configurations. \n\
  \ \n\
  \  To manage a proxy rule group's tags, use the standard Amazon Web Services resource tagging \
   operations, [ListTagsForResource], [TagResource], and [UntagResource].\n\
  \  \n\
  \   To retrieve information about proxy rule groups, use [ListProxyRuleGroups] and \
   [DescribeProxyRuleGroup].\n\
  \   \n\
  \    To retrieve information about individual proxy rules, use [DescribeProxyRuleGroup] and \
   [DescribeProxyRule].\n\
  \    "]

module CreateProxyRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_proxy_rules_request ->
    ( create_proxy_rules_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_proxy_rules_request ->
    ( create_proxy_rules_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates Network Firewall [ProxyRule] resources. \n\n\
  \ Attaches new proxy rule(s) to an existing proxy rule group. \n\
  \ \n\
  \  To retrieve information about individual proxy rules, use [DescribeProxyRuleGroup] and \
   [DescribeProxyRule].\n\
  \  "]

module CreateRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_rule_group_request ->
    ( create_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_rule_group_request ->
    ( create_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates the specified stateless or stateful rule group, which includes the rules for network \
   traffic inspection, a capacity setting, and tags. \n\n\
  \ You provide your rule group specification in your request using either [RuleGroup] or [Rules].\n\
  \ "]

module CreateTLSInspectionConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_tls_inspection_configuration_request ->
    ( create_tls_inspection_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_tls_inspection_configuration_request ->
    ( create_tls_inspection_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Network Firewall TLS inspection configuration. Network Firewall uses TLS inspection \
   configurations to decrypt your firewall's inbound and outbound SSL/TLS traffic. After \
   decryption, Network Firewall inspects the traffic according to your firewall policy's stateful \
   rules, and then re-encrypts it before sending it to its destination. You can enable inspection \
   of your firewall's inbound traffic, outbound traffic, or both. To use TLS inspection with your \
   firewall, you must first import or provision certificates using ACM, create a TLS inspection \
   configuration, add that configuration to a new firewall policy, and then associate that policy \
   with your firewall.\n\n\
  \ To update the settings for a TLS inspection configuration, use \
   [UpdateTLSInspectionConfiguration].\n\
  \ \n\
  \  To manage a TLS inspection configuration's tags, use the standard Amazon Web Services \
   resource tagging operations, [ListTagsForResource], [TagResource], and [UntagResource].\n\
  \  \n\
  \   To retrieve information about TLS inspection configurations, use \
   [ListTLSInspectionConfigurations] and [DescribeTLSInspectionConfiguration].\n\
  \   \n\
  \     For more information about TLS inspection configurations, see \
   {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/tls-inspection.html}Inspecting \
   SSL/TLS traffic with TLS inspection configurations} in the {i Network Firewall Developer \
   Guide}. \n\
  \    "]

module CreateVpcEndpointAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_vpc_endpoint_association_request ->
    ( create_vpc_endpoint_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_vpc_endpoint_association_request ->
    ( create_vpc_endpoint_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a firewall endpoint for an Network Firewall firewall. This type of firewall endpoint is \
   independent of the firewall endpoints that you specify in the [Firewall] itself, and you define \
   it in addition to those endpoints after the firewall has been created. You can define a VPC \
   endpoint association using a different VPC than the one you used in the firewall \
   specifications. \n"]

module DeleteContainerAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_container_association_request ->
    ( delete_container_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_container_association_request ->
    ( delete_container_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified container association. When you delete a container association, Network \
   Firewall stops monitoring the associated container clusters and removes the resolved IP \
   addresses from firewall rules.\n"]

module DeleteFirewall : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_firewall_request ->
    ( delete_firewall_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_firewall_request ->
    ( delete_firewall_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified [Firewall] and its [FirewallStatus]. This operation requires the \
   firewall's [DeleteProtection] flag to be [FALSE]. You can't revert this operation. \n\n\
  \ You can check whether a firewall is in use by reviewing the route tables for the Availability \
   Zones where you have firewall subnet mappings. Retrieve the subnet mappings by calling \
   [DescribeFirewall]. You define and update the route tables through Amazon VPC. As needed, \
   update the route tables for the zones to remove the firewall endpoints. When the route tables \
   no longer use the firewall endpoints, you can remove the firewall safely.\n\
  \ \n\
  \  To delete a firewall, remove the delete protection if you need to using \
   [UpdateFirewallDeleteProtection], then delete the firewall by calling [DeleteFirewall]. \n\
  \  "]

module DeleteFirewallPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_firewall_policy_request ->
    ( delete_firewall_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_firewall_policy_request ->
    ( delete_firewall_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified [FirewallPolicy]. \n"]

module DeleteNetworkFirewallTransitGatewayAttachment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_network_firewall_transit_gateway_attachment_request ->
    ( delete_network_firewall_transit_gateway_attachment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_network_firewall_transit_gateway_attachment_request ->
    ( delete_network_firewall_transit_gateway_attachment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a transit gateway attachment from a Network Firewall. Either the firewall owner or the \
   transit gateway owner can delete the attachment.\n\n\
  \  After you delete a transit gateway attachment, traffic will no longer flow through the \
   firewall endpoints.\n\
  \  \n\
  \    After you initiate the delete operation, use [DescribeFirewall] to monitor the deletion \
   status.\n\
  \    "]

module DeleteProxy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_proxy_request ->
    ( delete_proxy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_proxy_request ->
    ( delete_proxy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified [Proxy]. \n\n Detaches a Proxy configuration from a NAT Gateway. \n "]

module DeleteProxyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_proxy_configuration_request ->
    ( delete_proxy_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_proxy_configuration_request ->
    ( delete_proxy_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified [ProxyConfiguration]. \n"]

module DeleteProxyRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_proxy_rule_group_request ->
    ( delete_proxy_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_proxy_rule_group_request ->
    ( delete_proxy_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified [ProxyRuleGroup]. \n"]

module DeleteProxyRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_proxy_rules_request ->
    ( delete_proxy_rules_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_proxy_rules_request ->
    ( delete_proxy_rules_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified [ProxyRule](s). currently attached to a [ProxyRuleGroup] \n"]

module DeleteResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidResourcePolicyException of invalid_resource_policy_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidResourcePolicyException of invalid_resource_policy_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidResourcePolicyException of invalid_resource_policy_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a resource policy that you created in a [PutResourcePolicy] request. \n"]

module DeleteRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_rule_group_request ->
    ( delete_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_rule_group_request ->
    ( delete_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified [RuleGroup]. \n"]

module DeleteTLSInspectionConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_tls_inspection_configuration_request ->
    ( delete_tls_inspection_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_tls_inspection_configuration_request ->
    ( delete_tls_inspection_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified [TLSInspectionConfiguration].\n"]

module DeleteVpcEndpointAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_vpc_endpoint_association_request ->
    ( delete_vpc_endpoint_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_vpc_endpoint_association_request ->
    ( delete_vpc_endpoint_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified [VpcEndpointAssociation].\n\n\
  \ You can check whether an endpoint association is in use by reviewing the route tables for the \
   Availability Zones where you have the endpoint subnet mapping. You can retrieve the subnet \
   mapping by calling [DescribeVpcEndpointAssociation]. You define and update the route tables \
   through Amazon VPC. As needed, update the route tables for the Availability Zone to remove the \
   firewall endpoint for the association. When the route tables no longer use the firewall \
   endpoint, you can remove the endpoint association safely.\n\
  \ "]

module DescribeContainerAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_container_association_request ->
    ( describe_container_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_container_association_request ->
    ( describe_container_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the properties of a container association.\n"]

module DescribeFirewall : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_firewall_request ->
    ( describe_firewall_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_firewall_request ->
    ( describe_firewall_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the data objects for the specified firewall. \n"]

module DescribeFirewallMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_firewall_metadata_request ->
    ( describe_firewall_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_firewall_metadata_request ->
    ( describe_firewall_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the high-level information about a firewall, including the Availability Zones where the \
   Firewall is currently in use. \n"]

module DescribeFirewallPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_firewall_policy_request ->
    ( describe_firewall_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_firewall_policy_request ->
    ( describe_firewall_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the data objects for the specified firewall policy. \n"]

module DescribeFlowOperation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_flow_operation_request ->
    ( describe_flow_operation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_flow_operation_request ->
    ( describe_flow_operation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns key information about a specific flow operation.\n"]

module DescribeLoggingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_logging_configuration_request ->
    ( describe_logging_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_logging_configuration_request ->
    ( describe_logging_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the logging configuration for the specified firewall. \n"]

module DescribeProxy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_proxy_request ->
    ( describe_proxy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_proxy_request ->
    ( describe_proxy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the data objects for the specified proxy. \n"]

module DescribeProxyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_proxy_configuration_request ->
    ( describe_proxy_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_proxy_configuration_request ->
    ( describe_proxy_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the data objects for the specified proxy configuration. \n"]

module DescribeProxyRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_proxy_rule_request ->
    ( describe_proxy_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_proxy_rule_request ->
    ( describe_proxy_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the data objects for the specified proxy configuration for the specified proxy rule \
   group.\n"]

module DescribeProxyRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_proxy_rule_group_request ->
    ( describe_proxy_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_proxy_rule_group_request ->
    ( describe_proxy_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the data objects for the specified proxy rule group. \n"]

module DescribeResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_resource_policy_request ->
    ( describe_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_resource_policy_request ->
    ( describe_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a resource policy that you created in a [PutResourcePolicy] request. \n"]

module DescribeRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_rule_group_request ->
    ( describe_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_rule_group_request ->
    ( describe_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the data objects for the specified rule group. \n"]

module DescribeRuleGroupMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_rule_group_metadata_request ->
    ( describe_rule_group_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_rule_group_metadata_request ->
    ( describe_rule_group_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "High-level information about a rule group, returned by operations like create and describe. You \
   can use the information provided in the metadata to retrieve and manage a rule group. You can \
   retrieve all objects for a rule group by calling [DescribeRuleGroup]. \n"]

module DescribeRuleGroupSummary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_rule_group_summary_request ->
    ( describe_rule_group_summary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_rule_group_summary_request ->
    ( describe_rule_group_summary_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns detailed information for a stateful rule group.\n\n\
  \ For active threat defense Amazon Web Services managed rule groups, this operation provides \
   insight into the protections enabled by the rule group, based on Suricata rule metadata fields. \
   Summaries are available for rule groups you manage and for active threat defense Amazon Web \
   Services managed rule groups.\n\
  \ \n\
  \  To modify how threat information appears in summaries, use the [SummaryConfiguration] \
   parameter in [UpdateRuleGroup].\n\
  \  "]

module DescribeTLSInspectionConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tls_inspection_configuration_request ->
    ( describe_tls_inspection_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tls_inspection_configuration_request ->
    ( describe_tls_inspection_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the data objects for the specified TLS inspection configuration.\n"]

module DescribeVpcEndpointAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_vpc_endpoint_association_request ->
    ( describe_vpc_endpoint_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_vpc_endpoint_association_request ->
    ( describe_vpc_endpoint_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the data object for the specified VPC endpoint association. \n"]

module DetachRuleGroupsFromProxyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detach_rule_groups_from_proxy_configuration_request ->
    ( detach_rule_groups_from_proxy_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detach_rule_groups_from_proxy_configuration_request ->
    ( detach_rule_groups_from_proxy_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detaches [ProxyRuleGroup] resources from a [ProxyConfiguration] \n\n\
  \ A Proxy Configuration defines the monitoring and protection behavior for a Proxy. The details \
   of the behavior are defined in the rule groups that you add to your configuration. \n\
  \ "]

module DisassociateAvailabilityZones : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_availability_zones_request ->
    ( disassociate_availability_zones_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_availability_zones_request ->
    ( disassociate_availability_zones_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified Availability Zone associations from a transit gateway-attached firewall. \
   This removes the firewall endpoints from these Availability Zones and stops traffic filtering \
   in those zones. Before removing an Availability Zone, ensure you've updated your transit \
   gateway route tables to redirect traffic appropriately.\n\n\
  \  If [AvailabilityZoneChangeProtection] is enabled, you must first disable it using \
   [UpdateAvailabilityZoneChangeProtection].\n\
  \  \n\
  \    To verify the status of your Availability Zone changes, use [DescribeFirewall].\n\
  \    "]

module DisassociateSubnets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_subnets_request ->
    ( disassociate_subnets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_subnets_request ->
    ( disassociate_subnets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified subnet associations from the firewall. This removes the firewall \
   endpoints from the subnets and removes any network filtering protections that the endpoints \
   were providing. \n"]

module GetAnalysisReportResults : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_analysis_report_results_request ->
    ( get_analysis_report_results_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_analysis_report_results_request ->
    ( get_analysis_report_results_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "The results of a [COMPLETED] analysis report generated with [StartAnalysisReport].\n\n\
  \ For more information, see [AnalysisTypeReportResult]. \n\
  \ "]

module ListAnalysisReports : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_analysis_reports_request ->
    ( list_analysis_reports_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_analysis_reports_request ->
    ( list_analysis_reports_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of all traffic analysis reports generated within the last 30 days.\n"]

module ListContainerAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_container_associations_request ->
    ( list_container_associations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_container_associations_request ->
    ( list_container_associations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for the container associations that you have defined. You can optionally \
   page through results.\n"]

module ListFirewallPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_firewall_policies_request ->
    ( list_firewall_policies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_firewall_policies_request ->
    ( list_firewall_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for the firewall policies that you have defined. Depending on your \
   setting for max results and the number of firewall policies, a single call might not return the \
   full list. \n"]

module ListFirewalls : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_firewalls_request ->
    ( list_firewalls_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_firewalls_request ->
    ( list_firewalls_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for the firewalls that you have defined. If you provide VPC identifiers \
   in your request, this returns only the firewalls for those VPCs.\n\n\
  \ Depending on your setting for max results and the number of firewalls, a single call might not \
   return the full list. \n\
  \ "]

module ListFlowOperationResults : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_flow_operation_results_request ->
    ( list_flow_operation_results_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_flow_operation_results_request ->
    ( list_flow_operation_results_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the results of a specific flow operation. \n\n\
  \ Flow operations let you manage the flows tracked in the flow table, also known as the firewall \
   table.\n\
  \ \n\
  \  A flow is network traffic that is monitored by a firewall, either by stateful or stateless \
   rules. For traffic to be considered part of a flow, it must share Destination, DestinationPort, \
   Direction, Protocol, Source, and SourcePort. \n\
  \  "]

module ListFlowOperations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_flow_operations_request ->
    ( list_flow_operations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_flow_operations_request ->
    ( list_flow_operations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of all flow operations ran in a specific firewall. You can optionally narrow the \
   request scope by specifying the operation type or Availability Zone associated with a \
   firewall's flow operations. \n\n\
  \ Flow operations let you manage the flows tracked in the flow table, also known as the firewall \
   table.\n\
  \ \n\
  \  A flow is network traffic that is monitored by a firewall, either by stateful or stateless \
   rules. For traffic to be considered part of a flow, it must share Destination, DestinationPort, \
   Direction, Protocol, Source, and SourcePort. \n\
  \  "]

module ListProxies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_proxies_request ->
    ( list_proxies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_proxies_request ->
    ( list_proxies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for the proxies that you have defined. Depending on your setting for max \
   results and the number of proxies, a single call might not return the full list. \n"]

module ListProxyConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_proxy_configurations_request ->
    ( list_proxy_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_proxy_configurations_request ->
    ( list_proxy_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for the proxy configuration that you have defined. Depending on your \
   setting for max results and the number of proxy configurations, a single call might not return \
   the full list. \n"]

module ListProxyRuleGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_proxy_rule_groups_request ->
    ( list_proxy_rule_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_proxy_rule_groups_request ->
    ( list_proxy_rule_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for the proxy rule groups that you have defined. Depending on your \
   setting for max results and the number of proxy rule groups, a single call might not return the \
   full list. \n"]

module ListRuleGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_rule_groups_request ->
    ( list_rule_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_rule_groups_request ->
    ( list_rule_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for the rule groups that you have defined. Depending on your setting for \
   max results and the number of rule groups, a single call might not return the full list. \n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the tags associated with the specified resource. Tags are key:value pairs that you \
   can use to categorize and manage your resources, for purposes like billing. For example, you \
   might set the tag key to \"customer\" and the value to the customer name or ID. You can specify \
   one or more tags to add to each Amazon Web Services resource, up to 50 tags for a resource.\n\n\
  \ You can tag the Amazon Web Services resources that you manage through Network Firewall: \
   firewalls, firewall policies, and rule groups. \n\
  \ "]

module ListTLSInspectionConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tls_inspection_configurations_request ->
    ( list_tls_inspection_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tls_inspection_configurations_request ->
    ( list_tls_inspection_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for the TLS inspection configurations that you have defined. Depending \
   on your setting for max results and the number of TLS inspection configurations, a single call \
   might not return the full list.\n"]

module ListVpcEndpointAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_vpc_endpoint_associations_request ->
    ( list_vpc_endpoint_associations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_vpc_endpoint_associations_request ->
    ( list_vpc_endpoint_associations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for the VPC endpoint associations that you have defined. If you specify \
   a fireawll, this returns only the endpoint associations for that firewall. \n\n\
  \ Depending on your setting for max results and the number of associations, a single call might \
   not return the full list. \n\
  \ "]

module PutResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidResourcePolicyException of invalid_resource_policy_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidResourcePolicyException of invalid_resource_policy_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidResourcePolicyException of invalid_resource_policy_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates an IAM policy for your rule group, firewall policy, or firewall. Use this to \
   share these resources between accounts. This operation works in conjunction with the Amazon Web \
   Services Resource Access Manager (RAM) service to manage resource sharing for Network Firewall. \
   \n\n\
  \ For information about using sharing with Network Firewall resources, see \
   {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/sharing.html}Sharing \
   Network Firewall resources} in the {i Network Firewall Developer Guide}.\n\
  \ \n\
  \  Use this operation to create or update a resource policy for your Network Firewall rule \
   group, firewall policy, or firewall. In the resource policy, you specify the accounts that you \
   want to share the Network Firewall resource with and the operations that you want the accounts \
   to be able to perform. \n\
  \  \n\
  \   When you add an account in the resource policy, you then run the following Resource Access \
   Manager (RAM) operations to access and accept the shared resource. \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/ram/latest/APIReference/API_GetResourceShareInvitations.html}GetResourceShareInvitations} \
   - Returns the Amazon Resource Names (ARNs) of the resource share invitations. \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/ram/latest/APIReference/API_AcceptResourceShareInvitation.html}AcceptResourceShareInvitation} \
   - Accepts the share invitation for a specified resource share. \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   For additional information about resource sharing using RAM, see \
   {{:https://docs.aws.amazon.com/ram/latest/userguide/what-is.html}Resource Access Manager User \
   Guide}.\n\
  \   "]

module RejectNetworkFirewallTransitGatewayAttachment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reject_network_firewall_transit_gateway_attachment_request ->
    ( reject_network_firewall_transit_gateway_attachment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reject_network_firewall_transit_gateway_attachment_request ->
    ( reject_network_firewall_transit_gateway_attachment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Rejects a transit gateway attachment request for Network Firewall. When you reject the \
   attachment request, Network Firewall cancels the creation of routing components between the \
   transit gateway and firewall endpoints.\n\n\
  \ Only the transit gateway owner can reject the attachment. After rejection, no traffic will \
   flow through the firewall endpoints for this attachment.\n\
  \ \n\
  \  Use [DescribeFirewall] to monitor the rejection status. To accept the attachment instead of \
   rejecting it, use [AcceptNetworkFirewallTransitGatewayAttachment].\n\
  \  \n\
  \    Once rejected, you cannot reverse this action. To establish connectivity, you must create a \
   new transit gateway-attached firewall.\n\
  \    \n\
  \     "]

module StartAnalysisReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_analysis_report_request ->
    ( start_analysis_report_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_analysis_report_request ->
    ( start_analysis_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Generates a traffic analysis report for the timeframe and traffic type you specify.\n\n\
  \ For information on the contents of a traffic analysis report, see [AnalysisReport].\n\
  \ "]

module StartFlowCapture : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_flow_capture_request ->
    ( start_flow_capture_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_flow_capture_request ->
    ( start_flow_capture_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Begins capturing the flows in a firewall, according to the filters you define. Captures are \
   similar, but not identical to snapshots. Capture operations provide visibility into flows that \
   are not closed and are tracked by a firewall's flow table. Unlike snapshots, captures are a \
   time-boxed view. \n\n\
  \ A flow is network traffic that is monitored by a firewall, either by stateful or stateless \
   rules. For traffic to be considered part of a flow, it must share Destination, DestinationPort, \
   Direction, Protocol, Source, and SourcePort. \n\
  \ \n\
  \   To avoid encountering operation limits, you should avoid starting captures with broad \
   filters, like wide IP ranges. Instead, we recommend you define more specific criteria with \
   [FlowFilters], like narrow IP ranges, ports, or protocols.\n\
  \   \n\
  \    "]

module StartFlowFlush : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_flow_flush_request ->
    ( start_flow_flush_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_flow_flush_request ->
    ( start_flow_flush_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Begins the flushing of traffic from the firewall, according to the filters you define. When the \
   operation starts, impacted flows are temporarily marked as timed out before the Suricata engine \
   prunes, or flushes, the flows from the firewall table.\n\n\
  \  While the flush completes, impacted flows are processed as midstream traffic. This may result \
   in a temporary increase in midstream traffic metrics. We recommend that you double check your \
   stream exception policy before you perform a flush operation.\n\
  \  \n\
  \   "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds the specified tags to the specified resource. Tags are key:value pairs that you can use to \
   categorize and manage your resources, for purposes like billing. For example, you might set the \
   tag key to \"customer\" and the value to the customer name or ID. You can specify one or more \
   tags to add to each Amazon Web Services resource, up to 50 tags for a resource.\n\n\
  \ You can tag the Amazon Web Services resources that you manage through Network Firewall: \
   firewalls, firewall policies, and rule groups. \n\
  \ "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the tags with the specified keys from the specified resource. Tags are key:value pairs \
   that you can use to categorize and manage your resources, for purposes like billing. For \
   example, you might set the tag key to \"customer\" and the value to the customer name or ID. \
   You can specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for \
   a resource.\n\n\
  \ You can manage tags for the Amazon Web Services resources that you manage through Network \
   Firewall: firewalls, firewall policies, and rule groups. \n\
  \ "]

module UpdateAvailabilityZoneChangeProtection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceOwnerCheckException of resource_owner_check_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_availability_zone_change_protection_request ->
    ( update_availability_zone_change_protection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_availability_zone_change_protection_request ->
    ( update_availability_zone_change_protection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the [AvailabilityZoneChangeProtection] setting for a transit gateway-attached \
   firewall. When enabled, this setting prevents accidental changes to the firewall's Availability \
   Zone configuration. This helps protect against disrupting traffic flow in production \
   environments.\n\n\
  \ When enabled, you must disable this protection before using [AssociateAvailabilityZones] or \
   [DisassociateAvailabilityZones] to modify the firewall's Availability Zone configuration.\n\
  \ "]

module UpdateContainerAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_container_association_request ->
    ( update_container_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_container_association_request ->
    ( update_container_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the properties of an existing container association. Use this to modify the container \
   monitoring configurations or description.\n"]

module UpdateFirewallAnalysisSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_analysis_settings_request ->
    ( update_firewall_analysis_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_analysis_settings_request ->
    ( update_firewall_analysis_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Enables specific types of firewall analysis on a specific firewall you define.\n"]

module UpdateFirewallDeleteProtection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceOwnerCheckException of resource_owner_check_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_delete_protection_request ->
    ( update_firewall_delete_protection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_delete_protection_request ->
    ( update_firewall_delete_protection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the flag, [DeleteProtection], which indicates whether it is possible to delete the \
   firewall. If the flag is set to [TRUE], the firewall is protected against deletion. This \
   setting helps protect against accidentally deleting a firewall that's in use. \n"]

module UpdateFirewallDescription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_description_request ->
    ( update_firewall_description_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_description_request ->
    ( update_firewall_description_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the description for the specified firewall. Use the description to help you identify \
   the firewall when you're working with it. \n"]

module UpdateFirewallEncryptionConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceOwnerCheckException of resource_owner_check_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_encryption_configuration_request ->
    ( update_firewall_encryption_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_encryption_configuration_request ->
    ( update_firewall_encryption_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "A complex type that contains settings for encryption of your firewall resources.\n"]

module UpdateFirewallPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_policy_request ->
    ( update_firewall_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_policy_request ->
    ( update_firewall_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the properties of the specified firewall policy.\n"]

module UpdateFirewallPolicyChangeProtection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceOwnerCheckException of resource_owner_check_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_policy_change_protection_request ->
    ( update_firewall_policy_change_protection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_policy_change_protection_request ->
    ( update_firewall_policy_change_protection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the flag, [ChangeProtection], which indicates whether it is possible to change the \
   firewall. If the flag is set to [TRUE], the firewall is protected from changes. This setting \
   helps protect against accidentally changing a firewall that's in use.\n"]

module UpdateLoggingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `LogDestinationPermissionException of log_destination_permission_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_logging_configuration_request ->
    ( update_logging_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `LogDestinationPermissionException of log_destination_permission_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_logging_configuration_request ->
    ( update_logging_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `LogDestinationPermissionException of log_destination_permission_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the logging configuration for the specified firewall. \n\n\
  \ To change the logging configuration, retrieve the [LoggingConfiguration] by calling \
   [DescribeLoggingConfiguration], then change it and provide the modified object to this update \
   call. You must change the logging configuration one [LogDestinationConfig] at a time inside the \
   retrieved [LoggingConfiguration] object. \n\
  \ \n\
  \  You can perform only one of the following actions in any call to [UpdateLoggingConfiguration]: \n\
  \  \n\
  \   {ul\n\
  \         {-  Create a new log destination object by adding a single [LogDestinationConfig] \
   array element to [LogDestinationConfigs].\n\
  \             \n\
  \              }\n\
  \         {-  Delete a log destination object by removing a single [LogDestinationConfig] array \
   element from [LogDestinationConfigs].\n\
  \             \n\
  \              }\n\
  \         {-  Change the [LogDestination] setting in a single [LogDestinationConfig] array \
   element.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   You can't change the [LogDestinationType] or [LogType] in a [LogDestinationConfig]. To \
   change these settings, delete the existing [LogDestinationConfig] object and create a new one, \
   using two separate calls to this update operation.\n\
  \   "]

module UpdateProxy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_request ->
    ( update_proxy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_request ->
    ( update_proxy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the properties of the specified proxy.\n"]

module UpdateProxyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_configuration_request ->
    ( update_proxy_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_configuration_request ->
    ( update_proxy_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the properties of the specified proxy configuration.\n"]

module UpdateProxyRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_rule_request ->
    ( update_proxy_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_rule_request ->
    ( update_proxy_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the properties of the specified proxy rule.\n"]

module UpdateProxyRuleGroupPriorities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_rule_group_priorities_request ->
    ( update_proxy_rule_group_priorities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_rule_group_priorities_request ->
    ( update_proxy_rule_group_priorities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates proxy rule group priorities within a proxy configuration.\n"]

module UpdateProxyRulePriorities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_rule_priorities_request ->
    ( update_proxy_rule_priorities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_proxy_rule_priorities_request ->
    ( update_proxy_rule_priorities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates proxy rule priorities within a proxy rule group.\n"]

module UpdateRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_rule_group_request ->
    ( update_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_rule_group_request ->
    ( update_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the rule settings for the specified rule group. You use a rule group by reference in \
   one or more firewall policies. When you modify a rule group, you modify all firewall policies \
   that use the rule group. \n\n\
  \ To update a rule group, first call [DescribeRuleGroup] to retrieve the current [RuleGroup] \
   object, update the object as needed, and then provide the updated object to this call. \n\
  \ "]

module UpdateSubnetChangeProtection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceOwnerCheckException of resource_owner_check_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_subnet_change_protection_request ->
    ( update_subnet_change_protection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_subnet_change_protection_request ->
    ( update_subnet_change_protection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceOwnerCheckException of resource_owner_check_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "\n"]

module UpdateTLSInspectionConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTokenException of invalid_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_tls_inspection_configuration_request ->
    ( update_tls_inspection_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_tls_inspection_configuration_request ->
    ( update_tls_inspection_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTokenException of invalid_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the TLS inspection configuration settings for the specified TLS inspection \
   configuration. You use a TLS inspection configuration by referencing it in one or more firewall \
   policies. When you modify a TLS inspection configuration, you modify all firewall policies that \
   use the TLS inspection configuration. \n\n\
  \ To update a TLS inspection configuration, first call [DescribeTLSInspectionConfiguration] to \
   retrieve the current [TLSInspectionConfiguration] object, update the object as needed, and then \
   provide the updated object to this call. \n\
  \ "]
