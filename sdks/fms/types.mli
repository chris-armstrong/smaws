open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec violation_reason =
  | InvalidNetworkAclEntry [@ocaml.doc ""]
  | FirewallSubnetMissingVPCEndpoint [@ocaml.doc ""]
  | RouteHasOutOfScopeEndpoint [@ocaml.doc ""]
  | ResourceMissingDnsFirewall [@ocaml.doc ""]
  | BlackHoleRouteDetectedInFirewallSubnet [@ocaml.doc ""]
  | BlackHoleRouteDetected [@ocaml.doc ""]
  | InternetTrafficNotInspected [@ocaml.doc ""]
  | MissingTargetGateway [@ocaml.doc ""]
  | InvalidRouteConfiguration [@ocaml.doc ""]
  | TrafficInspectionCrossesAZBoundary [@ocaml.doc ""]
  | UnexpectedTargetGatewayRoutes [@ocaml.doc ""]
  | UnexpectedFirewallRoutes [@ocaml.doc ""]
  | FirewallSubnetMissingExpectedRoute [@ocaml.doc ""]
  | InternetGatewayMissingExpectedRoute [@ocaml.doc ""]
  | FirewallSubnetIsOutOfScope [@ocaml.doc ""]
  | NetworkFirewallPolicyModified [@ocaml.doc ""]
  | MissingExpectedRouteTable [@ocaml.doc ""]
  | MissingFirewallSubnetInAZ [@ocaml.doc ""]
  | MissingFirewall [@ocaml.doc ""]
  | FMSCreatedSecurityGroupEdited [@ocaml.doc ""]
  | SecurityGroupRedundant [@ocaml.doc ""]
  | SecurityGroupUnused [@ocaml.doc ""]
  | ResourceViolatesAuditSecurityGroup [@ocaml.doc ""]
  | ResourceMissingSecurityGroup [@ocaml.doc ""]
  | ResourceMissingWebaclOrShieldProtection [@ocaml.doc ""]
  | ResourceMissingShieldProtection [@ocaml.doc ""]
  | ResourceIncorrectWebAcl [@ocaml.doc ""]
  | ResourceMissingWebAcl [@ocaml.doc ""]
  | WebAclMissingRuleGroup [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec partial_match =
  {
  target_violation_reasons: string list option
    [@ocaml.doc "The violation reason.\n"];
  reference: string option
    [@ocaml.doc
      "The reference rule from the primary security group of the Firewall Manager policy.\n"]}
[@@ocaml.doc
  "The reference rule that partially matches the [ViolationTarget] rule and violation reason.\n"]
type nonrec remediation_action_type =
  | Modify [@ocaml.doc ""]
  | Remove [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec security_group_rule_description =
  {
  to_port: int option
    [@ocaml.doc
      "The end of the port range for the TCP and UDP protocols, or an ICMP/ICMPv6 code. A value of [-1] indicates all ICMP/ICMPv6 codes.\n"];
  from_port: int option
    [@ocaml.doc
      "The start of the port range for the TCP and UDP protocols, or an ICMP/ICMPv6 type number. A value of [-1] indicates all ICMP/ICMPv6 types.\n"];
  protocol: string option
    [@ocaml.doc
      "The IP protocol name ([tcp], [udp], [icmp], [icmpv6]) or number.\n"];
  prefix_list_id: string option
    [@ocaml.doc "The ID of the prefix list for the security group rule.\n"];
  ipv6_range: string option
    [@ocaml.doc "The IPv6 ranges for the security group rule.\n"];
  ipv4_range: string option
    [@ocaml.doc "The IPv4 ranges for the security group rule.\n"]}[@@ocaml.doc
                                                                    "Describes a set of permissions for a security group rule.\n"]
type nonrec security_group_remediation_action =
  {
  is_default_action: bool option
    [@ocaml.doc "Indicates if the current action is the default action.\n"];
  remediation_result: security_group_rule_description option
    [@ocaml.doc
      "The final state of the rule specified in the [ViolationTarget] after it is remediated.\n"];
  description: string option
    [@ocaml.doc "Brief description of the action that will be performed.\n"];
  remediation_action_type: remediation_action_type option
    [@ocaml.doc "The remediation action that will be performed.\n"]}[@@ocaml.doc
                                                                    "Remediation option for the rule specified in the [ViolationTarget].\n"]
type nonrec aws_vpc_security_group_violation =
  {
  possible_security_group_remediation_actions:
    security_group_remediation_action list option
    [@ocaml.doc
      "Remediation options for the rule specified in the [ViolationTarget].\n"];
  partial_matches: partial_match list option
    [@ocaml.doc
      "List of rules specified in the security group of the Firewall Manager policy that partially match the [ViolationTarget] rule.\n"];
  violation_target_description: string option
    [@ocaml.doc
      "A description of the security group that violates the policy.\n"];
  violation_target: string option
    [@ocaml.doc "The security group rule that is being evaluated.\n"]}
[@@ocaml.doc
  "Violation detail for the rule violation in a security group when compared to the primary security group of the Firewall Manager policy.\n"]
type nonrec aws_ec2_network_interface_violation =
  {
  violating_security_groups: string list option
    [@ocaml.doc
      "List of security groups that violate the rules specified in the primary security group of the Firewall Manager policy.\n"];
  violation_target: string option
    [@ocaml.doc "The resource ID of the network interface.\n"]}[@@ocaml.doc
                                                                 "Violation detail for network interfaces associated with an EC2 instance.\n"]
type nonrec aws_ec2_instance_violation =
  {
  aws_ec2_network_interface_violations:
    aws_ec2_network_interface_violation list option
    [@ocaml.doc
      "Violation detail for network interfaces associated with the EC2 instance.\n"];
  violation_target: string option
    [@ocaml.doc "The resource ID of the EC2 instance.\n"]}[@@ocaml.doc
                                                            "Violation detail for an EC2 instance resource.\n"]
type nonrec network_firewall_missing_firewall_violation =
  {
  target_violation_reason: string option
    [@ocaml.doc
      "The reason the resource has this violation, if one is available. \n"];
  availability_zone: string option
    [@ocaml.doc "The Availability Zone of a violating subnet. \n"];
  vp_c: string option
    [@ocaml.doc
      "The resource ID of the VPC associated with a violating subnet.\n"];
  violation_target: string option
    [@ocaml.doc
      "The ID of the Network Firewall or VPC resource that's in violation.\n"]}
[@@ocaml.doc
  "Violation detail for Network Firewall for a subnet that doesn't have a Firewall Manager managed firewall in its VPC. \n"]
type nonrec network_firewall_missing_subnet_violation =
  {
  target_violation_reason: string option
    [@ocaml.doc
      "The reason the resource has this violation, if one is available. \n"];
  availability_zone: string option
    [@ocaml.doc "The Availability Zone of a violating subnet. \n"];
  vp_c: string option
    [@ocaml.doc
      "The resource ID of the VPC associated with a violating subnet.\n"];
  violation_target: string option
    [@ocaml.doc
      "The ID of the Network Firewall or VPC resource that's in violation.\n"]}
[@@ocaml.doc
  "Violation detail for Network Firewall for an Availability Zone that's missing the expected Firewall Manager managed subnet.\n"]
type nonrec network_firewall_missing_expected_rt_violation =
  {
  expected_route_table: string option
    [@ocaml.doc
      "The resource ID of the route table that should be associated with the subnet.\n"];
  current_route_table: string option
    [@ocaml.doc
      "The resource ID of the current route table that's associated with the subnet, if one is available.\n"];
  availability_zone: string option
    [@ocaml.doc "The Availability Zone of a violating subnet. \n"];
  vp_c: string option
    [@ocaml.doc
      "The resource ID of the VPC associated with a violating subnet.\n"];
  violation_target: string option
    [@ocaml.doc
      "The ID of the Network Firewall or VPC resource that's in violation.\n"]}
[@@ocaml.doc
  "Violation detail for Network Firewall for a subnet that's not associated to the expected Firewall Manager managed route table.\n"]
type nonrec stateless_rule_group =
  {
  priority: int option
    [@ocaml.doc
      "The priority of the rule group. Network Firewall evaluates the stateless rule groups in a firewall policy starting from the lowest priority setting. \n"];
  resource_id: string option
    [@ocaml.doc "The resource ID of the rule group.\n"];
  rule_group_name: string option [@ocaml.doc "The name of the rule group.\n"]}
[@@ocaml.doc
  "Network Firewall stateless rule group, used in a [NetworkFirewallPolicyDescription]. \n"]
type nonrec network_firewall_override_action =
  | DROP_TO_ALERT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec network_firewall_stateful_rule_group_override =
  {
  action: network_firewall_override_action option
    [@ocaml.doc
      "The action that changes the rule group from [DROP] to [ALERT]. This only applies to managed rule groups.\n"]}
[@@ocaml.doc
  "The setting that allows the policy owner to change the behavior of the rule group within a policy.\n"]
type nonrec stateful_rule_group =
  {
  override: network_firewall_stateful_rule_group_override option
    [@ocaml.doc
      "The action that allows the policy owner to override the behavior of the rule group within a policy.\n"];
  priority: int option
    [@ocaml.doc
      "An integer setting that indicates the order in which to run the stateful rule groups in a single Network Firewall firewall policy. This setting only applies to firewall policies that specify the [STRICT_ORDER] rule order in the stateful engine options settings.\n\n  Network Firewall evalutes each stateful rule group against a packet starting with the group that has the lowest priority setting. You must ensure that the priority settings are unique within each policy. For information about \n \n   You can change the priority settings of your rule groups at any time. To make it easier to insert rule groups later, number them so there's a wide range in between, for example use 100, 200, and so on. \n  "];
  resource_id: string option
    [@ocaml.doc "The resource ID of the rule group.\n"];
  rule_group_name: string option [@ocaml.doc "The name of the rule group.\n"]}
[@@ocaml.doc
  "Network Firewall stateful rule group, used in a [NetworkFirewallPolicyDescription]. \n"]
type nonrec rule_order =
  | DEFAULT_ACTION_ORDER [@ocaml.doc ""]
  | STRICT_ORDER [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec stream_exception_policy =
  | FMS_IGNORE [@ocaml.doc ""]
  | REJECT [@ocaml.doc ""]
  | CONTINUE [@ocaml.doc ""]
  | DROP [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec stateful_engine_options =
  {
  stream_exception_policy: stream_exception_policy option
    [@ocaml.doc
      "Indicates how Network Firewall should handle traffic when a network connection breaks midstream.\n\n {ul\n       {-   [DROP] - Fail closed and drop all subsequent traffic going to the firewall.\n           \n            }\n       {-   [CONTINUE] - Continue to apply rules to subsequent traffic without context from traffic before the break. This impacts the behavior of rules that depend on context. For example, with a stateful rule that drops HTTP traffic, Network Firewall won't match subsequent traffic because the it won't have the context from session initialization, which defines the application layer protocol as HTTP. However, a TCP-layer rule using a [flow:stateless] rule would still match, and so would the [aws:drop_strict] default action. \n           \n            }\n       {-   [REJECT] - Fail closed and drop all subsequent traffic going to the firewall. With this option, Network Firewall also sends a TCP reject packet back to the client so the client can immediately establish a new session. With the new session, Network Firewall will have context and will apply rules appropriately.\n           \n            For applications that are reliant on long-lived TCP connections that trigger Gateway Load Balancer idle timeouts, this is the recommended setting. \n            \n             }\n       {-   [FMS_IGNORE] - Firewall Manager doesn't monitor or modify the Network Firewall stream exception policy settings. \n           \n            }\n       }\n   For more information, see {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/stream-exception-policy.html}Stream exception policy in your firewall policy} in the {i Network Firewall Developer Guide}.\n   \n    Default: [FMS_IGNORE] \n    "];
  rule_order: rule_order option
    [@ocaml.doc
      "Indicates how to manage the order of stateful rule evaluation for the policy. Stateful rules are provided to the rule engine as Suricata compatible strings, and Suricata evaluates them based on certain settings. For more information, see {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/suricata-rule-evaluation-order.html}Evaluation order for stateful rules} in the {i Network Firewall Developer Guide}.\n\n Default: [DEFAULT_ACTION_ORDER] \n "]}
[@@ocaml.doc
  "Configuration settings for the handling of the stateful rule groups in a Network Firewall firewall policy.\n"]
type nonrec network_firewall_policy_description =
  {
  stateful_engine_options: stateful_engine_options option
    [@ocaml.doc
      "Additional options governing how Network Firewall handles stateful rules. The stateful rule groups that you use in your policy must have stateful rule options settings that are compatible with these settings.\n"];
  stateful_default_actions: string list option
    [@ocaml.doc
      "The default actions to take on a packet that doesn't match any stateful rules. The stateful default action is optional, and is only valid when using the strict rule order.\n\n  Valid values of the stateful default action: \n \n  {ul\n        {-  aws:drop_strict\n            \n             }\n        {-  aws:drop_established\n            \n             }\n        {-  aws:alert_strict\n            \n             }\n        {-  aws:alert_established\n            \n             }\n        }\n  "];
  stateful_rule_groups: stateful_rule_group list option
    [@ocaml.doc
      "The stateful rule groups that are used in the Network Firewall firewall policy. \n"];
  stateless_custom_actions: string list option
    [@ocaml.doc
      "Names of custom actions that are available for use in the stateless default actions settings.\n"];
  stateless_fragment_default_actions: string list option
    [@ocaml.doc
      "The actions to take on packet fragments that don't match any of the stateless rule groups. \n"];
  stateless_default_actions: string list option
    [@ocaml.doc
      "The actions to take on packets that don't match any of the stateless rule groups. \n"];
  stateless_rule_groups: stateless_rule_group list option
    [@ocaml.doc
      "The stateless rule groups that are used in the Network Firewall firewall policy. \n"]}
[@@ocaml.doc "The definition of the Network Firewall firewall policy.\n"]
type nonrec network_firewall_policy_modified_violation =
  {
  expected_policy_description: network_firewall_policy_description option
    [@ocaml.doc
      "The policy that should be in use in the individual account in order to be compliant. \n"];
  current_policy_description: network_firewall_policy_description option
    [@ocaml.doc
      "The policy that's currently in use in the individual account. \n"];
  violation_target: string option
    [@ocaml.doc
      "The ID of the Network Firewall or VPC resource that's in violation.\n"]}
[@@ocaml.doc
  "Violation detail for Network Firewall for a firewall policy that has a different [NetworkFirewallPolicyDescription] than is required by the Firewall Manager policy. \n"]
type nonrec destination_type =
  | PrefixList [@ocaml.doc ""]
  | IPV6 [@ocaml.doc ""]
  | IPV4 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec target_type =
  | TransitGateway [@ocaml.doc ""]
  | EgressOnlyInternetGateway [@ocaml.doc ""]
  | VPCPeeringConnection [@ocaml.doc ""]
  | VPCEndpoint [@ocaml.doc ""]
  | NetworkInterface [@ocaml.doc ""]
  | NatGateway [@ocaml.doc ""]
  | LocalGateway [@ocaml.doc ""]
  | Instance [@ocaml.doc ""]
  | CarrierGateway [@ocaml.doc ""]
  | Gateway [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec route =
  {
  target: string option [@ocaml.doc "The route's target.\n"];
  destination: string option [@ocaml.doc "The destination of the route.\n"];
  target_type: target_type option
    [@ocaml.doc "The type of target for the route.\n"];
  destination_type: destination_type option
    [@ocaml.doc "The type of destination for the route.\n"]}[@@ocaml.doc
                                                              "Describes a route in a route table.\n"]
type nonrec expected_route =
  {
  route_table_id: string option
    [@ocaml.doc "Information about the route table ID.\n"];
  allowed_targets: string list option
    [@ocaml.doc "Information about the allowed targets.\n"];
  contributing_subnets: string list option
    [@ocaml.doc "Information about the contributing subnets.\n"];
  ip_v6_cidr: string option
    [@ocaml.doc "Information about the IPv6 CIDR block.\n"];
  prefix_list_id: string option
    [@ocaml.doc
      "Information about the ID of the prefix list for the route.\n"];
  ip_v4_cidr: string option
    [@ocaml.doc "Information about the IPv4 CIDR block.\n"]}[@@ocaml.doc
                                                              "Information about the expected route in the route table.\n"]
type nonrec network_firewall_internet_traffic_not_inspected_violation =
  {
  vpc_id: string option [@ocaml.doc "Information about the VPC ID.\n"];
  actual_internet_gateway_routes: route list option
    [@ocaml.doc "The actual internet gateway routes.\n"];
  expected_internet_gateway_routes: expected_route list option
    [@ocaml.doc "The internet gateway routes that are expected.\n"];
  current_internet_gateway_route_table: string option
    [@ocaml.doc "The current route table for the internet gateway.\n"];
  internet_gateway_id: string option
    [@ocaml.doc "The internet gateway ID.\n"];
  actual_firewall_subnet_routes: route list option
    [@ocaml.doc "The actual firewall subnet routes.\n"];
  expected_firewall_subnet_routes: expected_route list option
    [@ocaml.doc "The firewall subnet routes that are expected.\n"];
  firewall_subnet_id: string option [@ocaml.doc "The firewall subnet ID.\n"];
  expected_firewall_endpoint: string option
    [@ocaml.doc "The expected endpoint for the current firewall.\n"];
  current_firewall_subnet_route_table: string option
    [@ocaml.doc
      "Information about the subnet route table for the current firewall.\n"];
  is_route_table_used_in_different_a_z: bool option
    [@ocaml.doc
      "Information about whether the route table is used in another Availability Zone.\n"];
  violating_routes: route list option
    [@ocaml.doc "The route or routes that are in violation.\n"];
  route_table_id: string option
    [@ocaml.doc "Information about the route table ID.\n"];
  subnet_availability_zone: string option
    [@ocaml.doc "The subnet Availability Zone.\n"];
  subnet_id: string option [@ocaml.doc "The subnet ID.\n"]}[@@ocaml.doc
                                                             "Violation detail for the subnet for which internet traffic that hasn't been inspected.\n"]
type nonrec network_firewall_invalid_route_configuration_violation =
  {
  vpc_id: string option [@ocaml.doc "Information about the VPC ID.\n"];
  actual_internet_gateway_routes: route list option
    [@ocaml.doc "The actual internet gateway routes.\n"];
  expected_internet_gateway_routes: expected_route list option
    [@ocaml.doc "The expected routes for the internet gateway.\n"];
  current_internet_gateway_route_table: string option
    [@ocaml.doc "The route table for the current internet gateway.\n"];
  internet_gateway_id: string option
    [@ocaml.doc "The internet gateway ID.\n"];
  actual_firewall_subnet_routes: route list option
    [@ocaml.doc "The actual firewall subnet routes that are expected.\n"];
  expected_firewall_subnet_routes: expected_route list option
    [@ocaml.doc "The firewall subnet routes that are expected.\n"];
  actual_firewall_subnet_id: string option
    [@ocaml.doc "The actual subnet ID for the firewall.\n"];
  expected_firewall_subnet_id: string option
    [@ocaml.doc "The expected subnet ID for the firewall.\n"];
  actual_firewall_endpoint: string option
    [@ocaml.doc "The actual firewall endpoint.\n"];
  expected_firewall_endpoint: string option
    [@ocaml.doc "The firewall endpoint that's expected.\n"];
  current_firewall_subnet_route_table: string option
    [@ocaml.doc "The subnet route table for the current firewall.\n"];
  violating_route: route option
    [@ocaml.doc "The route that's in violation.\n"];
  is_route_table_used_in_different_a_z: bool option
    [@ocaml.doc
      "Information about whether the route table is used in another Availability Zone.\n"];
  route_table_id: string option [@ocaml.doc "The route table ID.\n"];
  affected_subnets: string list option
    [@ocaml.doc "The subnets that are affected.\n"]}[@@ocaml.doc
                                                      "Violation detail for the improperly configured subnet route. It's possible there is a missing route table route, or a configuration that causes traffic to cross an Availability Zone boundary.\n"]
type nonrec network_firewall_black_hole_route_detected_violation =
  {
  violating_routes: route list option
    [@ocaml.doc
      "Information about the route or routes that are in violation.\n"];
  vpc_id: string option [@ocaml.doc "Information about the VPC ID.\n"];
  route_table_id: string option
    [@ocaml.doc "Information about the route table ID.\n"];
  violation_target: string option
    [@ocaml.doc "The subnet that has an inactive state.\n"]}[@@ocaml.doc
                                                              "Violation detail for an internet gateway route with an inactive state in the customer subnet route table or Network Firewall subnet route table.\n"]
type nonrec network_firewall_unexpected_firewall_routes_violation =
  {
  vpc_id: string option [@ocaml.doc "Information about the VPC ID.\n"];
  firewall_endpoint: string option
    [@ocaml.doc "The endpoint of the firewall.\n"];
  route_table_id: string option [@ocaml.doc "The ID of the route table.\n"];
  violating_routes: route list option
    [@ocaml.doc "The routes that are in violation.\n"];
  firewall_subnet_id: string option
    [@ocaml.doc "The subnet ID for the firewall.\n"]}[@@ocaml.doc
                                                       "Violation detail for an unexpected route that's present in a route table.\n"]
type nonrec network_firewall_unexpected_gateway_routes_violation =
  {
  vpc_id: string option [@ocaml.doc "Information about the VPC ID.\n"];
  route_table_id: string option
    [@ocaml.doc "Information about the route table.\n"];
  violating_routes: route list option
    [@ocaml.doc "The routes that are in violation.\n"];
  gateway_id: string option
    [@ocaml.doc "Information about the gateway ID.\n"]}[@@ocaml.doc
                                                         "Violation detail for an unexpected gateway route that\226\128\153s present in a route table.\n"]
type nonrec network_firewall_missing_expected_routes_violation =
  {
  vpc_id: string option [@ocaml.doc "Information about the VPC ID.\n"];
  expected_routes: expected_route list option
    [@ocaml.doc "The expected routes.\n"];
  violation_target: string option
    [@ocaml.doc "The target of the violation.\n"]}[@@ocaml.doc
                                                    "Violation detail for an expected route missing in Network Firewall.\n"]
type nonrec dns_rule_group_priority_conflict_violation =
  {
  unavailable_priorities: int list option
    [@ocaml.doc
      "The priorities of rule groups that are already associated with the VPC. To retry your operation, choose priority settings that aren't in this list for the rule groups in your new DNS Firewall policy. \n"];
  conflicting_policy_id: string option
    [@ocaml.doc
      "The ID of the Firewall Manager DNS Firewall policy that was already applied to the VPC. This policy contains the rule group that's already associated with the VPC. \n"];
  conflicting_priority: int option
    [@ocaml.doc "The priority setting of the two conflicting rule groups.\n"];
  violation_target_description: string option
    [@ocaml.doc
      "A description of the violation that specifies the VPC and the rule group that's already associated with it.\n"];
  violation_target: string option
    [@ocaml.doc "Information about the VPC ID. \n"]}[@@ocaml.doc
                                                      "A rule group that Firewall Manager tried to associate with a VPC has the same priority as a rule group that's already associated. \n"]
type nonrec dns_duplicate_rule_group_violation =
  {
  violation_target_description: string option
    [@ocaml.doc
      "A description of the violation that specifies the rule group and VPC.\n"];
  violation_target: string option
    [@ocaml.doc "Information about the VPC ID. \n"]}[@@ocaml.doc
                                                      "A DNS Firewall rule group that Firewall Manager tried to associate with a VPC is already associated with the VPC and can't be associated again. \n"]
type nonrec dns_rule_group_limit_exceeded_violation =
  {
  number_of_rule_groups_already_associated: int option
    [@ocaml.doc
      "The number of rule groups currently associated with the VPC. \n"];
  violation_target_description: string option
    [@ocaml.doc
      "A description of the violation that specifies the rule group and VPC.\n"];
  violation_target: string option
    [@ocaml.doc "Information about the VPC ID. \n"]}[@@ocaml.doc
                                                      "The VPC that Firewall Manager was applying a DNS Fireall policy to reached the limit for associated DNS Firewall rule groups. Firewall Manager tried to associate another rule group with the VPC and failed due to the limit. \n"]
type nonrec firewall_subnet_is_out_of_scope_violation =
  {
  vpc_endpoint_id: string option
    [@ocaml.doc
      "The VPC endpoint ID of the firewall subnet that violates the policy scope.\n"];
  subnet_availability_zone_id: string option
    [@ocaml.doc
      "The Availability Zone ID of the firewall subnet that violates the policy scope.\n"];
  subnet_availability_zone: string option
    [@ocaml.doc
      "The Availability Zone of the firewall subnet that violates the policy scope.\n"];
  vpc_id: string option
    [@ocaml.doc
      "The VPC ID of the firewall subnet that violates the policy scope.\n"];
  firewall_subnet_id: string option
    [@ocaml.doc
      "The ID of the firewall subnet that violates the policy scope.\n"]}
[@@ocaml.doc
  "Contains details about the firewall subnet that violates the policy scope.\n"]
type nonrec route_has_out_of_scope_endpoint_violation =
  {
  internet_gateway_routes: route list option
    [@ocaml.doc
      "The routes in the route table associated with the Internet Gateway.\n"];
  current_internet_gateway_route_table: string option
    [@ocaml.doc
      "The current route table associated with the Internet Gateway.\n"];
  internet_gateway_id: string option
    [@ocaml.doc "The ID of the Internet Gateway.\n"];
  firewall_subnet_routes: route list option
    [@ocaml.doc "The list of firewall subnet routes.\n"];
  firewall_subnet_id: string option
    [@ocaml.doc "The ID of the firewall subnet.\n"];
  current_firewall_subnet_route_table: string option
    [@ocaml.doc
      "The route table associated with the current firewall subnet.\n"];
  subnet_availability_zone_id: string option
    [@ocaml.doc "The ID of the subnet's Availability Zone.\n"];
  subnet_availability_zone: string option
    [@ocaml.doc "The subnet's Availability Zone.\n"];
  violating_routes: route list option
    [@ocaml.doc "The list of routes that violate the route table.\n"];
  route_table_id: string option [@ocaml.doc "The ID of the route table.\n"];
  vpc_id: string option
    [@ocaml.doc "The VPC ID of the route that violates the policy scope.\n"];
  subnet_id: string option
    [@ocaml.doc
      "The ID of the subnet associated with the route that violates the policy scope.\n"]}
[@@ocaml.doc
  "Contains details about the route endpoint that violates the policy scope.\n"]
type nonrec third_party_firewall_missing_firewall_violation =
  {
  target_violation_reason: string option
    [@ocaml.doc
      "The reason the resource is causing this violation, if a reason is available.\n"];
  availability_zone: string option
    [@ocaml.doc
      "The Availability Zone of the third-party firewall that's causing the violation.\n"];
  vp_c: string option
    [@ocaml.doc
      "The resource ID of the VPC associated with a third-party firewall.\n"];
  violation_target: string option
    [@ocaml.doc
      "The ID of the third-party firewall that's causing the violation.\n"]}
[@@ocaml.doc
  "The violation details about a third-party firewall's subnet that doesn't have a Firewall Manager managed firewall in its VPC.\n"]
type nonrec third_party_firewall_missing_subnet_violation =
  {
  target_violation_reason: string option
    [@ocaml.doc
      "The reason the resource is causing the violation, if a reason is available.\n"];
  availability_zone: string option
    [@ocaml.doc
      "The Availability Zone of a subnet that's causing the violation.\n"];
  vp_c: string option
    [@ocaml.doc
      "The resource ID of the VPC associated with a subnet that's causing the violation.\n"];
  violation_target: string option
    [@ocaml.doc
      "The ID of the third-party firewall or VPC resource that's causing the violation.\n"]}
[@@ocaml.doc
  "The violation details for a third-party firewall for an Availability Zone that's missing the Firewall Manager managed subnet.\n"]
type nonrec third_party_firewall_missing_expected_route_table_violation =
  {
  expected_route_table: string option
    [@ocaml.doc
      "The resource ID of the route table that should be associated with the subnet.\n"];
  current_route_table: string option
    [@ocaml.doc
      "The resource ID of the current route table that's associated with the subnet, if one is available.\n"];
  availability_zone: string option
    [@ocaml.doc
      "The Availability Zone of the firewall subnet that's causing the violation.\n"];
  vp_c: string option
    [@ocaml.doc
      "The resource ID of the VPC associated with a fireawll subnet that's causing the violation.\n"];
  violation_target: string option
    [@ocaml.doc
      "The ID of the third-party firewall or VPC resource that's causing the violation.\n"]}
[@@ocaml.doc
  "The violation details for a third-party firewall that's not associated with an Firewall Manager managed route table.\n"]
type nonrec firewall_subnet_missing_vpc_endpoint_violation =
  {
  subnet_availability_zone_id: string option
    [@ocaml.doc
      "The ID of the Availability Zone of the deleted VPC subnet.\n"];
  subnet_availability_zone: string option
    [@ocaml.doc
      "The name of the Availability Zone of the deleted VPC subnet.\n"];
  vpc_id: string option
    [@ocaml.doc
      "The resource ID of the VPC associated with the deleted VPC subnet.\n"];
  firewall_subnet_id: string option
    [@ocaml.doc
      "The ID of the firewall that this VPC endpoint is associated with.\n"]}
[@@ocaml.doc
  "The violation details for a firewall subnet's VPC endpoint that's deleted or missing.\n"]
type nonrec network_acl_icmp_type_code =
  {
  type_: int option [@ocaml.doc "ICMP type. \n"];
  code: int option [@ocaml.doc "ICMP code. \n"]}[@@ocaml.doc
                                                  "ICMP protocol: The ICMP type and code.\n"]
type nonrec network_acl_port_range =
  {
  to_: int option [@ocaml.doc "The ending port number of the range. \n"];
  from_: int option [@ocaml.doc "The beginning port number of the range. \n"]}
[@@ocaml.doc
  "TCP or UDP protocols: The range of ports the rule applies to.\n"]
type nonrec network_acl_rule_action =
  | DENY [@ocaml.doc ""]
  | ALLOW [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec network_acl_entry =
  {
  egress: bool
    [@ocaml.doc
      "Indicates whether the rule is an egress, or outbound, rule (applied to traffic leaving the subnet). If it's not an egress rule, then it's an ingress, or inbound, rule.\n"];
  rule_action: network_acl_rule_action
    [@ocaml.doc
      "Indicates whether to allow or deny the traffic that matches the rule.\n"];
  ipv6_cidr_block: string option
    [@ocaml.doc
      "The IPv6 network range to allow or deny, in CIDR notation.\n"];
  cidr_block: string option
    [@ocaml.doc
      "The IPv4 network range to allow or deny, in CIDR notation.\n"];
  port_range: network_acl_port_range option
    [@ocaml.doc
      "TCP or UDP protocols: The range of ports the rule applies to.\n"];
  protocol: string
    [@ocaml.doc
      "The protocol number. A value of \"-1\" means all protocols. \n"];
  icmp_type_code: network_acl_icmp_type_code option
    [@ocaml.doc "ICMP protocol: The ICMP type and code.\n"]}[@@ocaml.doc
                                                              "Describes a rule in a network ACL.\n\n Each network ACL has a set of numbered ingress rules and a separate set of numbered egress rules. When determining whether a packet should be allowed in or out of a subnet associated with the network ACL, Amazon Web Services processes the entries in the network ACL according to the rule numbers, in ascending order. \n \n  When you manage an individual network ACL, you explicitly specify the rule numbers. When you specify the network ACL rules in a Firewall Manager policy, you provide the rules to run first, in the order that you want them to run, and the rules to run last, in the order that you want them to run. Firewall Manager assigns the rule numbers for you when you save the network ACL policy specification.\n  "]
type nonrec entry_type =
  | CustomEntry [@ocaml.doc ""]
  | FMSManagedLastEntry [@ocaml.doc ""]
  | FMSManagedFirstEntry [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec entry_description =
  {
  entry_type: entry_type option
    [@ocaml.doc
      "Specifies whether the entry is managed by Firewall Manager or by a user, and, for Firewall Manager-managed entries, specifies whether the entry is among those that run first in the network ACL or those that run last. \n"];
  entry_rule_number: int option
    [@ocaml.doc
      "The rule number for the entry. ACL entries are processed in ascending order by rule number. In a Firewall Manager network ACL policy, Firewall Manager assigns rule numbers. \n"];
  entry_detail: network_acl_entry option
    [@ocaml.doc
      "Describes a rule in a network ACL.\n\n Each network ACL has a set of numbered ingress rules and a separate set of numbered egress rules. When determining whether a packet should be allowed in or out of a subnet associated with the network ACL, Amazon Web Services processes the entries in the network ACL according to the rule numbers, in ascending order. \n \n  When you manage an individual network ACL, you explicitly specify the rule numbers. When you specify the network ACL rules in a Firewall Manager policy, you provide the rules to run first, in the order that you want them to run, and the rules to run last, in the order that you want them to run. Firewall Manager assigns the rule numbers for you when you save the network ACL policy specification.\n  "]}
[@@ocaml.doc "Describes a single rule in a network ACL.\n"]
type nonrec entry_violation_reason =
  | EntryConflict [@ocaml.doc ""]
  | IncorrectEntryOrder [@ocaml.doc ""]
  | MissingExpectedEntry [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec entry_violation =
  {
  entry_violation_reasons: entry_violation_reason list option
    [@ocaml.doc
      "Descriptions of the violations that Firewall Manager found for these entries. \n"];
  entries_with_conflicts: entry_description list option
    [@ocaml.doc
      "The list of entries that are in conflict with [ExpectedEntry]. \n"];
  entry_at_expected_evaluation_order: entry_description option
    [@ocaml.doc
      "The entry that's currently in the [ExpectedEvaluationOrder] location, in place of the expected entry. \n"];
  actual_evaluation_order: string option
    [@ocaml.doc
      "The evaluation location within the ordered list of entries where the [ExpectedEntry] is currently located. \n"];
  expected_evaluation_order: string option
    [@ocaml.doc
      "The evaluation location within the ordered list of entries where the [ExpectedEntry] should be, according to the network ACL policy specifications. \n"];
  expected_entry: entry_description option
    [@ocaml.doc
      "The Firewall Manager-managed network ACL entry that is involved in the entry violation. \n"]}
[@@ocaml.doc
  "Detailed information about an entry violation in a network ACL. The violation is against the network ACL specification inside the Firewall Manager network ACL policy. This data object is part of [InvalidNetworkAclEntriesViolation].\n"]
type nonrec invalid_network_acl_entries_violation =
  {
  entry_violations: entry_violation list option
    [@ocaml.doc
      "Detailed information about the entry violations in the network ACL. \n"];
  current_associated_network_acl: string option
    [@ocaml.doc "The network ACL containing the entry violations. \n"];
  subnet_availability_zone: string option
    [@ocaml.doc "The Availability Zone where the network ACL is in use. \n"];
  subnet: string option
    [@ocaml.doc "The subnet that's associated with the network ACL.\n"];
  vpc: string option [@ocaml.doc "The VPC where the violation was found. \n"]}
[@@ocaml.doc "Violation detail for the entries in a network ACL resource.\n"]
type nonrec action_target =
  {
  description: string option
    [@ocaml.doc "A description of the remediation action target.\n"];
  resource_id: string option
    [@ocaml.doc "The ID of the remediation target.\n"]}[@@ocaml.doc
                                                         "Describes a remediation action target.\n"]
type nonrec ec2_create_route_action =
  {
  route_table_id: action_target
    [@ocaml.doc
      "Information about the ID of the route table for the route.\n"];
  gateway_id: action_target option
    [@ocaml.doc
      "Information about the ID of an internet gateway or virtual private gateway attached to your VPC.\n"];
  vpc_endpoint_id: action_target option
    [@ocaml.doc
      "Information about the ID of a VPC endpoint. Supported for Gateway Load Balancer endpoints only.\n"];
  destination_ipv6_cidr_block: string option
    [@ocaml.doc "Information about the IPv6 CIDR block destination.\n"];
  destination_prefix_list_id: string option
    [@ocaml.doc
      "Information about the ID of a prefix list used for the destination match.\n"];
  destination_cidr_block: string option
    [@ocaml.doc
      "Information about the IPv4 CIDR address block used for the destination match.\n"];
  description: string option
    [@ocaml.doc "A description of CreateRoute action in Amazon EC2.\n"]}
[@@ocaml.doc "Information about the CreateRoute action in Amazon EC2.\n"]
type nonrec ec2_replace_route_action =
  {
  route_table_id: action_target
    [@ocaml.doc "Information about the ID of the route table.\n"];
  gateway_id: action_target option
    [@ocaml.doc
      "Information about the ID of an internet gateway or virtual private gateway.\n"];
  destination_ipv6_cidr_block: string option
    [@ocaml.doc
      "Information about the IPv6 CIDR address block used for the destination match. The value that you provide must match the CIDR of an existing route in the table.\n"];
  destination_prefix_list_id: string option
    [@ocaml.doc
      "Information about the ID of the prefix list for the route.\n"];
  destination_cidr_block: string option
    [@ocaml.doc
      "Information about the IPv4 CIDR address block used for the destination match. The value that you provide must match the CIDR of an existing route in the table.\n"];
  description: string option
    [@ocaml.doc "A description of the ReplaceRoute action in Amazon EC2.\n"]}
[@@ocaml.doc "Information about the ReplaceRoute action in Amazon EC2.\n"]
type nonrec ec2_delete_route_action =
  {
  route_table_id: action_target
    [@ocaml.doc "Information about the ID of the route table.\n"];
  destination_ipv6_cidr_block: string option
    [@ocaml.doc
      "Information about the IPv6 CIDR range for the route. The value you specify must match the CIDR for the route exactly.\n"];
  destination_prefix_list_id: string option
    [@ocaml.doc
      "Information about the ID of the prefix list for the route.\n"];
  destination_cidr_block: string option
    [@ocaml.doc
      "Information about the IPv4 CIDR range for the route. The value you specify must match the CIDR for the route exactly.\n"];
  description: string option
    [@ocaml.doc "A description of the DeleteRoute action.\n"]}[@@ocaml.doc
                                                                "Information about the DeleteRoute action in Amazon EC2.\n"]
type nonrec ec2_copy_route_table_action =
  {
  route_table_id: action_target
    [@ocaml.doc
      "The ID of the copied EC2 route table that is associated with the remediation action.\n"];
  vpc_id: action_target
    [@ocaml.doc
      "The VPC ID of the copied EC2 route table that is associated with the remediation action.\n"];
  description: string option
    [@ocaml.doc
      "A description of the copied EC2 route table that is associated with the remediation action.\n"]}
[@@ocaml.doc
  "An action that copies the EC2 route table for use in remediation.\n"]
type nonrec ec2_replace_route_table_association_action =
  {
  route_table_id: action_target
    [@ocaml.doc
      "Information about the ID of the new route table to associate with the subnet.\n"];
  association_id: action_target
    [@ocaml.doc "Information about the association ID.\n"];
  description: string option
    [@ocaml.doc
      "A description of the ReplaceRouteTableAssociation action in Amazon EC2.\n"]}
[@@ocaml.doc
  "Information about the ReplaceRouteTableAssociation action in Amazon EC2.\n"]
type nonrec ec2_associate_route_table_action =
  {
  gateway_id: action_target option
    [@ocaml.doc
      "The ID of the gateway to be used with the EC2 route table that is associated with the remediation action.\n"];
  subnet_id: action_target option
    [@ocaml.doc
      "The ID of the subnet for the EC2 route table that is associated with the remediation action.\n"];
  route_table_id: action_target
    [@ocaml.doc
      "The ID of the EC2 route table that is associated with the remediation action.\n"];
  description: string option
    [@ocaml.doc
      "A description of the EC2 route table that is associated with the remediation action.\n"]}
[@@ocaml.doc
  "The action of associating an EC2 resource, such as a subnet or internet gateway, with a route table.\n"]
type nonrec ec2_create_route_table_action =
  {
  vpc_id: action_target [@ocaml.doc "Information about the ID of a VPC.\n"];
  description: string option
    [@ocaml.doc "A description of the CreateRouteTable action.\n"]}[@@ocaml.doc
                                                                    "Information about the CreateRouteTable action in Amazon EC2.\n"]
type nonrec fms_policy_update_firewall_creation_config_action =
  {
  firewall_creation_config: string option
    [@ocaml.doc
      "A [FirewallCreationConfig] that you can copy into your current policy's {{:https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_SecurityServicePolicyData.html}SecurityServiceData} in order to remedy scope violations.\n"];
  description: string option [@ocaml.doc "Describes the remedial action.\n"]}
[@@ocaml.doc
  "Contains information about the actions that you can take to remediate scope violations caused by your policy's [FirewallCreationConfig]. [FirewallCreationConfig] is an optional configuration that you can use to choose which Availability Zones Firewall Manager creates Network Firewall endpoints in.\n"]
type nonrec create_network_acl_action =
  {
  fms_can_remediate: bool option
    [@ocaml.doc
      "Indicates whether it is possible for Firewall Manager to perform this remediation action. A false value indicates that auto remediation is disabled or Firewall Manager is unable to perform the action due to a conflict of some kind.\n"];
  vpc: action_target option
    [@ocaml.doc "The VPC that's associated with the remediation action.\n"];
  description: string option
    [@ocaml.doc "Brief description of this remediation action. \n"]}[@@ocaml.doc
                                                                    "Information about the [CreateNetworkAcl] action in Amazon EC2. This is a remediation option in [RemediationAction].\n"]
type nonrec replace_network_acl_association_action =
  {
  fms_can_remediate: bool option
    [@ocaml.doc
      "Indicates whether it is possible for Firewall Manager to perform this remediation action. A false value indicates that auto remediation is disabled or Firewall Manager is unable to perform the action due to a conflict of some kind.\n"];
  network_acl_id: action_target option
    [@ocaml.doc
      "The network ACL that's associated with the remediation action.\n"];
  association_id: action_target option [@ocaml.doc ""];
  description: string option
    [@ocaml.doc "Brief description of this remediation action. \n"]}[@@ocaml.doc
                                                                    "Information about the [ReplaceNetworkAclAssociation] action in Amazon EC2. This is a remediation option in [RemediationAction].\n"]
type nonrec create_network_acl_entries_action =
  {
  fms_can_remediate: bool option
    [@ocaml.doc
      "Indicates whether it is possible for Firewall Manager to perform this remediation action. A false value indicates that auto remediation is disabled or Firewall Manager is unable to perform the action due to a conflict of some kind.\n"];
  network_acl_entries_to_be_created: entry_description list option
    [@ocaml.doc
      "Lists the entries that the remediation action would create.\n"];
  network_acl_id: action_target option
    [@ocaml.doc
      "The network ACL that's associated with the remediation action.\n"];
  description: string option
    [@ocaml.doc "Brief description of this remediation action. \n"]}[@@ocaml.doc
                                                                    "Information about the [CreateNetworkAclEntries] action in Amazon EC2. This is a remediation option in [RemediationAction].\n"]
type nonrec delete_network_acl_entries_action =
  {
  fms_can_remediate: bool option
    [@ocaml.doc
      "Indicates whether it is possible for Firewall Manager to perform this remediation action. A false value indicates that auto remediation is disabled or Firewall Manager is unable to perform the action due to a conflict of some kind.\n"];
  network_acl_entries_to_be_deleted: entry_description list option
    [@ocaml.doc
      "Lists the entries that the remediation action would delete.\n"];
  network_acl_id: action_target option
    [@ocaml.doc
      "The network ACL that's associated with the remediation action.\n"];
  description: string option
    [@ocaml.doc "Brief description of this remediation action. \n"]}[@@ocaml.doc
                                                                    "Information about the [DeleteNetworkAclEntries] action in Amazon EC2. This is a remediation option in [RemediationAction]. \n"]
type nonrec remediation_action =
  {
  delete_network_acl_entries_action: delete_network_acl_entries_action option
    [@ocaml.doc
      "Information about the [DeleteNetworkAclEntries] action in Amazon EC2.\n"];
  create_network_acl_entries_action: create_network_acl_entries_action option
    [@ocaml.doc
      "Information about the [CreateNetworkAclEntries] action in Amazon EC2.\n"];
  replace_network_acl_association_action:
    replace_network_acl_association_action option
    [@ocaml.doc
      "Information about the [ReplaceNetworkAclAssociation] action in Amazon EC2. \n"];
  create_network_acl_action: create_network_acl_action option
    [@ocaml.doc
      "Information about the [CreateNetworkAcl] action in Amazon EC2.\n"];
  fms_policy_update_firewall_creation_config_action:
    fms_policy_update_firewall_creation_config_action option
    [@ocaml.doc
      "The remedial action to take when updating a firewall configuration.\n"];
  ec2_create_route_table_action: ec2_create_route_table_action option
    [@ocaml.doc
      "Information about the CreateRouteTable action in the Amazon EC2 API.\n"];
  ec2_associate_route_table_action: ec2_associate_route_table_action option
    [@ocaml.doc
      "Information about the AssociateRouteTable action in the Amazon EC2 API.\n"];
  ec2_replace_route_table_association_action:
    ec2_replace_route_table_association_action option
    [@ocaml.doc
      "Information about the ReplaceRouteTableAssociation action in the Amazon EC2 API.\n"];
  ec2_copy_route_table_action: ec2_copy_route_table_action option
    [@ocaml.doc
      "Information about the CopyRouteTable action in the Amazon EC2 API.\n"];
  ec2_delete_route_action: ec2_delete_route_action option
    [@ocaml.doc
      "Information about the DeleteRoute action in the Amazon EC2 API.\n"];
  ec2_replace_route_action: ec2_replace_route_action option
    [@ocaml.doc
      "Information about the ReplaceRoute action in the Amazon EC2 API.\n"];
  ec2_create_route_action: ec2_create_route_action option
    [@ocaml.doc
      "Information about the CreateRoute action in the Amazon EC2 API.\n"];
  description: string option
    [@ocaml.doc "A description of a remediation action.\n"]}[@@ocaml.doc
                                                              "Information about an individual action you can take to remediate a violation.\n"]
type nonrec remediation_action_with_order =
  {
  order: int option
    [@ocaml.doc "The order of the remediation actions in the list.\n"];
  remediation_action: remediation_action option
    [@ocaml.doc
      "Information about an action you can take to remediate a violation.\n"]}
[@@ocaml.doc
  "An ordered list of actions you can take to remediate a violation.\n"]
type nonrec possible_remediation_action =
  {
  is_default_action: bool option
    [@ocaml.doc "Information about whether an action is taken by default.\n"];
  ordered_remediation_actions: remediation_action_with_order list
    [@ocaml.doc "The ordered list of remediation actions.\n"];
  description: string option
    [@ocaml.doc "A description of the list of remediation actions.\n"]}
[@@ocaml.doc "A list of remediation actions.\n"]
type nonrec possible_remediation_actions =
  {
  actions: possible_remediation_action list option
    [@ocaml.doc "Information about the actions.\n"];
  description: string option
    [@ocaml.doc "A description of the possible remediation actions list.\n"]}
[@@ocaml.doc
  "A list of possible remediation action lists. Each individual possible remediation action is a list of individual remediation actions.\n"]
type nonrec resource_violation =
  {
  possible_remediation_actions: possible_remediation_actions option
    [@ocaml.doc
      "A list of possible remediation action lists. Each individual possible remediation action is a list of individual remediation actions.\n"];
  invalid_network_acl_entries_violation:
    invalid_network_acl_entries_violation option
    [@ocaml.doc
      "Violation detail for the entries in a network ACL resource.\n"];
  firewall_subnet_missing_vpc_endpoint_violation:
    firewall_subnet_missing_vpc_endpoint_violation option
    [@ocaml.doc
      "The violation details for a third-party firewall's VPC endpoint subnet that was deleted.\n"];
  third_party_firewall_missing_expected_route_table_violation:
    third_party_firewall_missing_expected_route_table_violation option
    [@ocaml.doc
      "The violation details for a third-party firewall that has the Firewall Manager managed route table that was associated with the third-party firewall has been deleted.\n"];
  third_party_firewall_missing_subnet_violation:
    third_party_firewall_missing_subnet_violation option
    [@ocaml.doc
      "The violation details for a third-party firewall's subnet that's been deleted.\n"];
  third_party_firewall_missing_firewall_violation:
    third_party_firewall_missing_firewall_violation option
    [@ocaml.doc
      "The violation details for a third-party firewall that's been deleted.\n"];
  route_has_out_of_scope_endpoint_violation:
    route_has_out_of_scope_endpoint_violation option
    [@ocaml.doc
      "Contains details about the route endpoint that violates the policy scope.\n"];
  firewall_subnet_is_out_of_scope_violation:
    firewall_subnet_is_out_of_scope_violation option
    [@ocaml.doc
      "Contains details about the firewall subnet that violates the policy scope.\n"];
  dns_rule_group_limit_exceeded_violation:
    dns_rule_group_limit_exceeded_violation option
    [@ocaml.doc
      "Violation detail for a DNS Firewall policy that indicates that the VPC reached the limit for associated DNS Firewall rule groups. Firewall Manager tried to associate another rule group with the VPC and failed. \n"];
  dns_duplicate_rule_group_violation:
    dns_duplicate_rule_group_violation option
    [@ocaml.doc
      "Violation detail for a DNS Firewall policy that indicates that a rule group that Firewall Manager tried to associate with a VPC is already associated with the VPC and can't be associated again. \n"];
  dns_rule_group_priority_conflict_violation:
    dns_rule_group_priority_conflict_violation option
    [@ocaml.doc
      "Violation detail for a DNS Firewall policy that indicates that a rule group that Firewall Manager tried to associate with a VPC has the same priority as a rule group that's already associated. \n"];
  network_firewall_missing_expected_routes_violation:
    network_firewall_missing_expected_routes_violation option
    [@ocaml.doc "Expected routes are missing from Network Firewall.\n"];
  network_firewall_unexpected_gateway_routes_violation:
    network_firewall_unexpected_gateway_routes_violation option
    [@ocaml.doc "There's an unexpected gateway route.\n"];
  network_firewall_unexpected_firewall_routes_violation:
    network_firewall_unexpected_firewall_routes_violation option
    [@ocaml.doc "There's an unexpected firewall route.\n"];
  network_firewall_black_hole_route_detected_violation:
    network_firewall_black_hole_route_detected_violation option
    [@ocaml.doc ""];
  network_firewall_invalid_route_configuration_violation:
    network_firewall_invalid_route_configuration_violation option
    [@ocaml.doc "The route configuration is invalid.\n"];
  network_firewall_internet_traffic_not_inspected_violation:
    network_firewall_internet_traffic_not_inspected_violation option
    [@ocaml.doc
      "Violation detail for the subnet for which internet traffic hasn't been inspected.\n"];
  network_firewall_policy_modified_violation:
    network_firewall_policy_modified_violation option
    [@ocaml.doc
      "Violation detail for an Network Firewall policy that indicates that a firewall policy in an individual account has been modified in a way that makes it noncompliant. For example, the individual account owner might have deleted a rule group, changed the priority of a stateless rule group, or changed a policy default action.\n"];
  network_firewall_missing_expected_rt_violation:
    network_firewall_missing_expected_rt_violation option
    [@ocaml.doc
      "Violation detail for an Network Firewall policy that indicates that a subnet is not associated with the expected Firewall Manager managed route table. \n"];
  network_firewall_missing_subnet_violation:
    network_firewall_missing_subnet_violation option
    [@ocaml.doc
      "Violation detail for an Network Firewall policy that indicates that an Availability Zone is missing the expected Firewall Manager managed subnet.\n"];
  network_firewall_missing_firewall_violation:
    network_firewall_missing_firewall_violation option
    [@ocaml.doc
      "Violation detail for an Network Firewall policy that indicates that a subnet has no Firewall Manager managed firewall in its VPC. \n"];
  aws_ec2_instance_violation: aws_ec2_instance_violation option
    [@ocaml.doc "Violation detail for an EC2 instance.\n"];
  aws_ec2_network_interface_violation:
    aws_ec2_network_interface_violation option
    [@ocaml.doc "Violation detail for a network interface.\n"];
  aws_vpc_security_group_violation: aws_vpc_security_group_violation option
    [@ocaml.doc "Violation detail for security groups.\n"]}[@@ocaml.doc
                                                             "Violation detail based on resource type.\n"]
type nonrec tag =
  {
  value: string
    [@ocaml.doc
      "Part of the key:value pair that defines a tag. You can use a tag value to describe a specific value within a category, such as \"companyA\" or \"companyB.\" Tag values are case-sensitive. \n"];
  key: string
    [@ocaml.doc
      "Part of the key:value pair that defines a tag. You can use a tag key to describe a category of information, such as \"customer.\" Tag keys are case-sensitive.\n"]}
[@@ocaml.doc
  "A collection of key:value pairs associated with an Amazon Web Services resource. The key:value pair can be anything you define. Typically, the tag key represents a category (such as \"environment\") and the tag value represents a specific value within that category (such as \"test,\" \"development,\" or \"production\"). You can add up to 50 tags to each Amazon Web Services resource. \n"]
type nonrec violation_detail =
  {
  resource_description: string option
    [@ocaml.doc "Brief description for the requested resource.\n"];
  resource_tags: tag list option
    [@ocaml.doc "The [ResourceTag] objects associated with the resource.\n"];
  resource_violations: resource_violation list
    [@ocaml.doc "List of violations for the requested resource.\n"];
  resource_type: string
    [@ocaml.doc
      "The resource type that the violation details were requested for.\n"];
  resource_id: string
    [@ocaml.doc
      "The resource ID that the violation details were requested for.\n"];
  member_account: string
    [@ocaml.doc
      "The Amazon Web Services account that the violation details were requested for.\n"];
  policy_id: string
    [@ocaml.doc
      "The ID of the Firewall Manager policy that the violation details were requested for.\n"]}
[@@ocaml.doc
  "Violations for a resource based on the specified Firewall Manager policy and Amazon Web Services account.\n"]
type nonrec untag_resource_request =
  {
  tag_keys: string list
    [@ocaml.doc "The keys of the tags to remove from the resource. \n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource to return tags for. The Firewall Manager resources that support tagging are policies, applications lists, and protocols lists. \n"]}
[@@ocaml.doc ""]
type nonrec resource_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified resource was not found.\n"]
type nonrec invalid_operation_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The operation failed because there was nothing to do or the operation wasn't possible. For example, you might have submitted an [AssociateAdminAccount] request for an account ID that was already set as the Firewall Manager administrator. Or you might have tried to access a Region that's disabled by default, and that you need to enable for the Firewall Manager administrator account and for Organizations before you can access it.\n"]
type nonrec invalid_input_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The parameters of the request were invalid.\n"]
type nonrec internal_error_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The operation failed because of a system problem, even though the request was valid. Retry your request.\n"]
type nonrec firewall_deployment_model =
  | DISTRIBUTED [@ocaml.doc ""]
  | CENTRALIZED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec third_party_firewall_policy =
  {
  firewall_deployment_model: firewall_deployment_model option
    [@ocaml.doc
      "Defines the deployment model to use for the third-party firewall policy.\n"]}
[@@ocaml.doc
  "Configures the deployment model for the third-party firewall.\n"]
type nonrec third_party_firewall_firewall_policy =
  {
  firewall_policy_name: string option
    [@ocaml.doc "The name of the specified firewall policy.\n"];
  firewall_policy_id: string option
    [@ocaml.doc "The ID of the specified firewall policy.\n"]}[@@ocaml.doc
                                                                "Configures the third-party firewall's firewall policy.\n"]
type nonrec third_party_firewall_association_status =
  | NOT_EXIST [@ocaml.doc ""]
  | OFFBOARD_COMPLETE [@ocaml.doc ""]
  | OFFBOARDING [@ocaml.doc ""]
  | ONBOARD_COMPLETE [@ocaml.doc ""]
  | ONBOARDING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec third_party_firewall =
  | FORTIGATE_CLOUD_NATIVE_FIREWALL [@ocaml.doc ""]
  | PALO_ALTO_NETWORKS_CLOUD_NGFW [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec tag_resource_request =
  {
  tag_list: tag list [@ocaml.doc "The tags to add to the resource.\n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource to return tags for. The Firewall Manager resources that support tagging are policies, applications lists, and protocols lists. \n"]}
[@@ocaml.doc ""]
type nonrec limit_exceeded_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The operation exceeds a resource limit, for example, the maximum number of [policy] objects that you can create for an Amazon Web Services account. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/fms-limits.html}Firewall Manager Limits} in the {i WAF Developer Guide}.\n"]
type nonrec security_service_type =
  | NETWORK_ACL_COMMON [@ocaml.doc ""]
  | IMPORT_NETWORK_FIREWALL [@ocaml.doc ""]
  | THIRD_PARTY_FIREWALL [@ocaml.doc ""]
  | DNS_FIREWALL [@ocaml.doc ""]
  | NETWORK_FIREWALL [@ocaml.doc ""]
  | SECURITY_GROUPS_USAGE_AUDIT [@ocaml.doc ""]
  | SECURITY_GROUPS_CONTENT_AUDIT [@ocaml.doc ""]
  | SECURITY_GROUPS_COMMON [@ocaml.doc ""]
  | SHIELD_ADVANCED [@ocaml.doc ""]
  | WAFV2 [@ocaml.doc ""]
  | WAF [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec network_firewall_policy =
  {
  firewall_deployment_model: firewall_deployment_model option
    [@ocaml.doc
      "Defines the deployment model to use for the firewall policy. To use a distributed model, set {{:https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_PolicyOption.html}PolicyOption} to [NULL].\n"]}
[@@ocaml.doc
  "Configures the firewall policy deployment model of Network Firewall. For information about Network Firewall deployment models, see {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/architectures.html}Network Firewall example architectures with routing} in the {i Network Firewall Developer Guide}.\n"]
type nonrec network_acl_entry_set =
  {
  force_remediate_for_last_entries: bool
    [@ocaml.doc
      "Applies only when remediation is enabled for the policy as a whole. Firewall Manager uses this setting when it finds policy violations that involve conflicts between the custom entries and the policy entries. \n\n If forced remediation is disabled, Firewall Manager marks the network ACL as noncompliant and does not try to remediate. For more information about the remediation behavior, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/network-acl-policies.html#network-acls-remediation}Remediation for managed network ACLs} in the {i Firewall Manager Developer Guide}.\n "];
  last_entries: network_acl_entry list option
    [@ocaml.doc
      "The rules that you want to run last in the Firewall Manager managed network ACLs. \n\n  Provide these in the order in which you want them to run. Firewall Manager will assign the specific rule numbers for you, in the network ACLs that it creates. \n  \n    You must specify at least one first entry or one last entry in any network ACL policy. \n    "];
  force_remediate_for_first_entries: bool
    [@ocaml.doc
      "Applies only when remediation is enabled for the policy as a whole. Firewall Manager uses this setting when it finds policy violations that involve conflicts between the custom entries and the policy entries. \n\n If forced remediation is disabled, Firewall Manager marks the network ACL as noncompliant and does not try to remediate. For more information about the remediation behavior, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/network-acl-policies.html#network-acls-remediation}Remediation for managed network ACLs} in the {i Firewall Manager Developer Guide}.\n "];
  first_entries: network_acl_entry list option
    [@ocaml.doc
      "The rules that you want to run first in the Firewall Manager managed network ACLs. \n\n  Provide these in the order in which you want them to run. Firewall Manager will assign the specific rule numbers for you, in the network ACLs that it creates. \n  \n    You must specify at least one first entry or one last entry in any network ACL policy. \n    "]}
[@@ocaml.doc
  "The configuration of the first and last rules for the network ACL policy, and the remediation settings for each. \n"]
type nonrec network_acl_common_policy =
  {
  network_acl_entry_set: network_acl_entry_set
    [@ocaml.doc
      "The definition of the first and last rules for the network ACL policy. \n"]}
[@@ocaml.doc
  "Defines a Firewall Manager network ACL policy. This is used in the [PolicyOption] of a [SecurityServicePolicyData] for a [Policy], when the [SecurityServicePolicyData] type is set to [NETWORK_ACL_COMMON]. \n\n For information about network ACLs, see {{:https://docs.aws.amazon.com/vpc/latest/userguide/vpc-network-acls.html}Control traffic to subnets using network ACLs} in the {i Amazon Virtual Private Cloud User Guide}. \n "]
type nonrec policy_option =
  {
  network_acl_common_policy: network_acl_common_policy option
    [@ocaml.doc "Defines a Firewall Manager network ACL policy. \n"];
  third_party_firewall_policy: third_party_firewall_policy option
    [@ocaml.doc
      "Defines the policy options for a third-party firewall policy.\n"];
  network_firewall_policy: network_firewall_policy option
    [@ocaml.doc
      "Defines the deployment model to use for the firewall policy.\n"]}
[@@ocaml.doc
  "Contains the settings to configure a network ACL policy, a Network Firewall firewall policy deployment model, or a third-party firewall policy.\n"]
type nonrec security_service_policy_data =
  {
  policy_option: policy_option option
    [@ocaml.doc
      "Contains the settings to configure a network ACL policy, a Network Firewall firewall policy deployment model, or a third-party firewall policy.\n"];
  managed_service_data: string option
    [@ocaml.doc
      "Details about the service that are specific to the service type, in JSON format. \n\n {ul\n       {-  Example: [DNS_FIREWALL] \n           \n             [\"{\\\"type\\\":\\\"DNS_FIREWALL\\\",\\\"preProcessRuleGroups\\\":\\[{\\\"ruleGroupId\\\":\\\"rslvr-frg-1\\\",\\\"priority\\\":10}\\],\\\"postProcessRuleGroups\\\":\\[{\\\"ruleGroupId\\\":\\\"rslvr-frg-2\\\",\\\"priority\\\":9911}\\]}\"] \n            \n              Valid values for [preProcessRuleGroups] are between 1 and 99. Valid values for [postProcessRuleGroups] are between 9901 and 10000.\n              \n                }\n       {-  Example: [IMPORT_NETWORK_FIREWALL] \n           \n             [\"{\\\"type\\\":\\\"IMPORT_NETWORK_FIREWALL\\\",\\\"awsNetworkFirewallConfig\\\":{\\\"networkFirewallStatelessRuleGroupReferences\\\":\\[{\\\"resourceARN\\\":\\\"arn:aws:network-firewall:us-west-2:000000000000:stateless-rulegroup\\/rg1\\\",\\\"priority\\\":1}\\],\\\"networkFirewallStatelessDefaultActions\\\":\\[\\\"aws:drop\\\"\\],\\\"networkFirewallStatelessFragmentDefaultActions\\\":\\[\\\"aws:pass\\\"\\],\\\"networkFirewallStatelessCustomActions\\\":\\[\\],\\\"networkFirewallStatefulRuleGroupReferences\\\":\\[{\\\"resourceARN\\\":\\\"arn:aws:network-firewall:us-west-2:aws-managed:stateful-rulegroup\\/ThreatSignaturesEmergingEventsStrictOrder\\\",\\\"priority\\\":8}\\],\\\"networkFirewallStatefulEngineOptions\\\":{\\\"ruleOrder\\\":\\\"STRICT_ORDER\\\"},\\\"networkFirewallStatefulDefaultActions\\\":\\[\\\"aws:drop_strict\\\"\\]}}\"] \n            \n              [\"{\\\"type\\\":\\\"DNS_FIREWALL\\\",\\\"preProcessRuleGroups\\\":\\[{\\\"ruleGroupId\\\":\\\"rslvr-frg-1\\\",\\\"priority\\\":10}\\],\\\"postProcessRuleGroups\\\":\\[{\\\"ruleGroupId\\\":\\\"rslvr-frg-2\\\",\\\"priority\\\":9911}\\]}\"] \n             \n               Valid values for [preProcessRuleGroups] are between 1 and 99. Valid values for [postProcessRuleGroups] are between 9901 and 10000.\n               \n                 }\n       {-  Example: [NETWORK_FIREWALL] - Centralized deployment model\n           \n             [\"{\\\"type\\\":\\\"NETWORK_FIREWALL\\\",\\\"awsNetworkFirewallConfig\\\":{\\\"networkFirewallStatelessRuleGroupReferences\\\":\\[{\\\"resourceARN\\\":\\\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\\\",\\\"priority\\\":1}\\],\\\"networkFirewallStatelessDefaultActions\\\":\\[\\\"aws:forward_to_sfe\\\",\\\"customActionName\\\"\\],\\\"networkFirewallStatelessFragmentDefaultActions\\\":\\[\\\"aws:forward_to_sfe\\\",\\\"customActionName\\\"\\],\\\"networkFirewallStatelessCustomActions\\\":\\[{\\\"actionName\\\":\\\"customActionName\\\",\\\"actionDefinition\\\":{\\\"publishMetricAction\\\":{\\\"dimensions\\\":\\[{\\\"value\\\":\\\"metricdimensionvalue\\\"}\\]}}}\\],\\\"networkFirewallStatefulRuleGroupReferences\\\":\\[{\\\"resourceARN\\\":\\\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\\\"}\\],\\\"networkFirewallLoggingConfiguration\\\":{\\\"logDestinationConfigs\\\":\\[{\\\"logDestinationType\\\":\\\"S3\\\",\\\"logType\\\":\\\"ALERT\\\",\\\"logDestination\\\":{\\\"bucketName\\\":\\\"s3-bucket-name\\\"}},{\\\"logDestinationType\\\":\\\"S3\\\",\\\"logType\\\":\\\"FLOW\\\",\\\"logDestination\\\":{\\\"bucketName\\\":\\\"s3-bucket-name\\\"}}\\],\\\"overrideExistingConfig\\\":true}},\\\"firewallDeploymentModel\\\":{\\\"centralizedFirewallDeploymentModel\\\":{\\\"centralizedFirewallOrchestrationConfig\\\":{\\\"inspectionVpcIds\\\":\\[{\\\"resourceId\\\":\\\"vpc-1234\\\",\\\"accountId\\\":\\\"123456789011\\\"}\\],\\\"firewallCreationConfig\\\":{\\\"endpointLocation\\\":{\\\"availabilityZoneConfigList\\\":\\[{\\\"availabilityZoneId\\\":null,\\\"availabilityZoneName\\\":\\\"us-east-1a\\\",\\\"allowedIPV4CidrList\\\":\\[\\\"10.0.0.0/28\\\"\\]}\\]}},\\\"allowedIPV4CidrList\\\":\\[\\]}}}}\"] \n            \n              To use the centralized deployment model, you must set {{:https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_PolicyOption.html}PolicyOption} to [CENTRALIZED]. \n             \n              }\n       {-  Example: [NETWORK_FIREWALL] - Distributed deployment model with automatic Availability Zone configuration\n           \n             [\n                \"{\\\"type\\\":\\\"NETWORK_FIREWALL\\\",\\\"networkFirewallStatelessRuleGroupReferences\\\":\\[{\\\"resourceARN\\\":\\\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\\\",\\\"priority\\\":1}\\],\\\"networkFirewallStatelessDefaultActions\\\":\\[\\\"aws:forward_to_sfe\\\",\\\"customActionName\\\"\\],\\\"networkFirewallStatelessFragmentDefaultActions\\\":\\[\\\"aws:forward_to_sfe\\\",\\\"customActionName\\\"\\],\\\"networkFirewallStatelessCustomActions\\\":\\[{\\\"actionName\\\":\\\"customActionName\\\",\\\"actionDefinition\\\":{\\\"publishMetricAction\\\":{\\\"dimensions\\\":\\[{\\\"value\\\":\\\"metricdimensionvalue\\\"}\\]}}}\\],\\\"networkFirewallStatefulRuleGroupReferences\\\":\\[{\\\"resourceARN\\\":\\\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\\\"}\\],\\\"networkFirewallOrchestrationConfig\\\":{\\\"singleFirewallEndpointPerVPC\\\":false,\\\"allowedIPV4CidrList\\\":\\[\\\"10.0.0.0/28\\\",\\\"192.168.0.0/28\\\"\\],\\\"routeManagementAction\\\":\\\"OFF\\\"},\\\"networkFirewallLoggingConfiguration\\\":{\\\"logDestinationConfigs\\\":\\[{\\\"logDestinationType\\\":\\\"S3\\\",\\\"logType\\\":\\\"ALERT\\\",\\\"logDestination\\\":{\\\"bucketName\\\":\\\"s3-bucket-name\\\"}},{\\\"logDestinationType\\\":\\\"S3\\\",\\\"logType\\\":\\\"FLOW\\\",\\\"logDestination\\\":{\\\"bucketName\\\":\\\"s3-bucket-name\\\"}}\\],\\\"overrideExistingConfig\\\":true}}\"\n              ] \n            \n              With automatic Availbility Zone configuration, Firewall Manager chooses which Availability Zones to create the endpoints in. To use the distributed deployment model, you must set {{:https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_PolicyOption.html}PolicyOption} to [NULL]. \n             \n              }\n       {-  Example: [NETWORK_FIREWALL] - Distributed deployment model with automatic Availability Zone configuration and route management\n           \n             [\n                \"{\\\"type\\\":\\\"NETWORK_FIREWALL\\\",\\\"networkFirewallStatelessRuleGroupReferences\\\":\\[{\\\"resourceARN\\\":\\\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\\\",\\\"priority\\\":1}\\],\\\"networkFirewallStatelessDefaultActions\\\":\\[\\\"aws:forward_to_sfe\\\",\\\"customActionName\\\"\\],\\\"networkFirewallStatelessFragmentDefaultActions\\\":\\[\\\"aws:forward_to_sfe\\\",\\\"customActionName\\\"\\],\\\"networkFirewallStatelessCustomActions\\\":\\[{\\\"actionName\\\":\\\"customActionName\\\",\\\"actionDefinition\\\":{\\\"publishMetricAction\\\":{\\\"dimensions\\\":\\[{\\\"value\\\":\\\"metricdimensionvalue\\\"}\\]}}}\\],\\\"networkFirewallStatefulRuleGroupReferences\\\":\\[{\\\"resourceARN\\\":\\\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\\\"}\\],\\\"networkFirewallOrchestrationConfig\\\":{\\\"singleFirewallEndpointPerVPC\\\":false,\\\"allowedIPV4CidrList\\\":\\[\\\"10.0.0.0/28\\\",\\\"192.168.0.0/28\\\"\\],\\\"routeManagementAction\\\":\\\"MONITOR\\\",\\\"routeManagementTargetTypes\\\":\\[\\\"InternetGateway\\\"\\]},\\\"networkFirewallLoggingConfiguration\\\":{\\\"logDestinationConfigs\\\":\\[{\\\"logDestinationType\\\":\\\"S3\\\",\\\"logType\\\":\\\"ALERT\\\",\\\"logDestination\\\":{\\\"bucketName\\\":\\\"s3-bucket-name\\\"}},{\\\"logDestinationType\\\":\\\"S3\\\",\\\"logType\\\": \\\"FLOW\\\",\\\"logDestination\\\":{\\\"bucketName\\\":\\\"s3-bucket-name\\\"}}\\],\\\"overrideExistingConfig\\\":true}}\"\n              ] \n            \n             To use the distributed deployment model, you must set {{:https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_PolicyOption.html}PolicyOption} to [NULL]. \n             \n              }\n       {-  Example: [NETWORK_FIREWALL] - Distributed deployment model with custom Availability Zone configuration\n           \n             [\"{\\\"type\\\":\\\"NETWORK_FIREWALL\\\",\\\"networkFirewallStatelessRuleGroupReferences\\\":\\[{\\\"resourceARN\\\":\\\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\\\",\\\"priority\\\":1}\\],\\\"networkFirewallStatelessDefaultActions\\\":\\[\\\"aws:forward_to_sfe\\\",\\\"customActionName\\\"\\],\\\"networkFirewallStatelessFragmentDefaultActions\\\":\\[\\\"aws:forward_to_sfe\\\",\\\"fragmentcustomactionname\\\"\\],\\\"networkFirewallStatelessCustomActions\\\":\\[{\\\"actionName\\\":\\\"customActionName\\\", \\\"actionDefinition\\\":{\\\"publishMetricAction\\\":{\\\"dimensions\\\":\\[{\\\"value\\\":\\\"metricdimensionvalue\\\"}\\]}}},{\\\"actionName\\\":\\\"fragmentcustomactionname\\\",\\\"actionDefinition\\\":{\\\"publishMetricAction\\\":{\\\"dimensions\\\":\\[{\\\"value\\\":\\\"fragmentmetricdimensionvalue\\\"}\\]}}}\\],\\\"networkFirewallStatefulRuleGroupReferences\\\":\\[{\\\"resourceARN\\\":\\\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\\\"}\\],\\\"networkFirewallOrchestrationConfig\\\":{\\\"firewallCreationConfig\\\":{ \\\"endpointLocation\\\":{\\\"availabilityZoneConfigList\\\":\\[{\\\"availabilityZoneName\\\":\\\"us-east-1a\\\",\\\"allowedIPV4CidrList\\\":\\[\\\"10.0.0.0/28\\\"\\]},{\\\"availabilityZoneName\\\":\\\"us-east-1b\\\",\\\"allowedIPV4CidrList\\\":\\[ \\\"10.0.0.0/28\\\"\\]}\\]} },\\\"singleFirewallEndpointPerVPC\\\":false,\\\"allowedIPV4CidrList\\\":null,\\\"routeManagementAction\\\":\\\"OFF\\\",\\\"networkFirewallLoggingConfiguration\\\":{\\\"logDestinationConfigs\\\":\\[{\\\"logDestinationType\\\":\\\"S3\\\",\\\"logType\\\":\\\"ALERT\\\",\\\"logDestination\\\":{\\\"bucketName\\\":\\\"s3-bucket-name\\\"}},{\\\"logDestinationType\\\":\\\"S3\\\",\\\"logType\\\":\\\"FLOW\\\",\\\"logDestination\\\":{\\\"bucketName\\\":\\\"s3-bucket-name\\\"}}\\],\\\"overrideExistingConfig\\\":boolean}}\"\n              ] \n            \n              With custom Availability Zone configuration, you define which specific Availability Zones to create endpoints in by configuring [firewallCreationConfig]. To configure the Availability Zones in [firewallCreationConfig], specify either the [availabilityZoneName] or [availabilityZoneId] parameter, not both parameters. \n             \n              To use the distributed deployment model, you must set {{:https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_PolicyOption.html}PolicyOption} to [NULL]. \n              \n               }\n       {-  Example: [NETWORK_FIREWALL] - Distributed deployment model with custom Availability Zone configuration and route management\n           \n             [\"{\\\"type\\\":\\\"NETWORK_FIREWALL\\\",\\\"networkFirewallStatelessRuleGroupReferences\\\":\\[{\\\"resourceARN\\\":\\\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\\\",\\\"priority\\\":1}\\],\\\"networkFirewallStatelessDefaultActions\\\":\\[\\\"aws:forward_to_sfe\\\",\\\"customActionName\\\"\\],\\\"networkFirewallStatelessFragmentDefaultActions\\\":\\[\\\"aws:forward_to_sfe\\\",\\\"fragmentcustomactionname\\\"\\],\\\"networkFirewallStatelessCustomActions\\\":\\[{\\\"actionName\\\":\\\"customActionName\\\",\\\"actionDefinition\\\":{\\\"publishMetricAction\\\":{\\\"dimensions\\\":\\[{\\\"value\\\":\\\"metricdimensionvalue\\\"}\\]}}},{\\\"actionName\\\":\\\"fragmentcustomactionname\\\",\\\"actionDefinition\\\":{\\\"publishMetricAction\\\":{\\\"dimensions\\\":\\[{\\\"value\\\":\\\"fragmentmetricdimensionvalue\\\"}\\]}}}\\],\\\"networkFirewallStatefulRuleGroupReferences\\\":\\[{\\\"resourceARN\\\":\\\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\\\"}\\],\\\"networkFirewallOrchestrationConfig\\\":{\\\"firewallCreationConfig\\\":{\\\"endpointLocation\\\":{\\\"availabilityZoneConfigList\\\":\\[{\\\"availabilityZoneName\\\":\\\"us-east-1a\\\",\\\"allowedIPV4CidrList\\\":\\[\\\"10.0.0.0/28\\\"\\]},{\\\"availabilityZoneName\\\":\\\"us-east-1b\\\",\\\"allowedIPV4CidrList\\\":\\[\\\"10.0.0.0/28\\\"\\]}\\]}},\\\"singleFirewallEndpointPerVPC\\\":false,\\\"allowedIPV4CidrList\\\":null,\\\"routeManagementAction\\\":\\\"MONITOR\\\",\\\"routeManagementTargetTypes\\\":\\[\\\"InternetGateway\\\"\\],\\\"routeManagementConfig\\\":{\\\"allowCrossAZTrafficIfNoEndpoint\\\":true}},\\\"networkFirewallLoggingConfiguration\\\":{\\\"logDestinationConfigs\\\":\\[{\\\"logDestinationType\\\":\\\"S3\\\",\\\"logType\\\":\\\"ALERT\\\",\\\"logDestination\\\":{\\\"bucketName\\\":\\\"s3-bucket-name\\\"}},{\\\"logDestinationType\\\":\\\"S3\\\",\\\"logType\\\":\\\"FLOW\\\",\\\"logDestination\\\":{\\\"bucketName\\\":\\\"s3-bucket-name\\\"}}\\],\\\"overrideExistingConfig\\\":boolean}}\"\n              ] \n            \n             To use the distributed deployment model, you must set {{:https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_PolicyOption.html}PolicyOption} to [NULL]. \n             \n              }\n       {-  Example: [SECURITY_GROUPS_COMMON] \n           \n             [\"{\\\"type\\\":\\\"SECURITY_GROUPS_COMMON\\\",\\\"revertManualSecurityGroupChanges\\\":false,\\\"exclusiveResourceSecurityGroupManagement\\\":false,\n                 \\\"applyToAllEC2InstanceENIs\\\":false,\\\"securityGroups\\\":\\[{\\\"id\\\":\\\"\n                 sg-000e55995d61a06bd\\\"}\\]}\"] \n            \n             }\n       {-  Example: [SECURITY_GROUPS_COMMON] - Security group tag distribution \n           \n             [\"\"{\\\"type\\\":\\\"SECURITY_GROUPS_COMMON\\\",\\\"securityGroups\\\":\\[{\\\"id\\\":\\\"sg-000e55995d61a06bd\\\"}\\],\\\"revertManualSecurityGroupChanges\\\":true,\\\"exclusiveResourceSecurityGroupManagement\\\":false,\\\"applyToAllEC2InstanceENIs\\\":false,\\\"includeSharedVPC\\\":false,\\\"enableTagDistribution\\\":true}\"\"] \n            \n              Firewall Manager automatically distributes tags from the primary group to the security groups created by this policy. To use security group tag distribution, you must also set [revertManualSecurityGroupChanges] to [true], otherwise Firewall Manager won't be able to create the policy. When you enable [revertManualSecurityGroupChanges], Firewall Manager identifies and reports when the security groups created by this policy become non-compliant. \n             \n               Firewall Manager won't distribute system tags added by Amazon Web Services services into the replica security groups. System tags begin with the [aws:] prefix. \n              \n               }\n       {-  Example: Shared VPCs. Apply the preceding policy to resources in shared VPCs as well as to those in VPCs that the account owns \n           \n             [\"{\\\"type\\\":\\\"SECURITY_GROUPS_COMMON\\\",\\\"revertManualSecurityGroupChanges\\\":false,\\\"exclusiveResourceSecurityGroupManagement\\\":false,\n                 \\\"applyToAllEC2InstanceENIs\\\":false,\\\"includeSharedVPC\\\":true,\\\"securityGroups\\\":\\[{\\\"id\\\":\\\"\n                 sg-000e55995d61a06bd\\\"}\\]}\"] \n            \n             }\n       {-  Example: [SECURITY_GROUPS_CONTENT_AUDIT] \n           \n             [\"{\\\"type\\\":\\\"SECURITY_GROUPS_CONTENT_AUDIT\\\",\\\"securityGroups\\\":\\[{\\\"id\\\":\\\"sg-000e55995d61a06bd\\\"}\\],\\\"securityGroupAction\\\":{\\\"type\\\":\\\"ALLOW\\\"}}\"] \n            \n             The security group action for content audit can be [ALLOW] or [DENY]. For [ALLOW], all in-scope security group rules must be within the allowed range of the policy's security group rules. For [DENY], all in-scope security group rules must not contain a value or a range that matches a rule value or range in the policy security group.\n             \n              }\n       {-  Example: [SECURITY_GROUPS_USAGE_AUDIT] \n           \n             [\"{\\\"type\\\":\\\"SECURITY_GROUPS_USAGE_AUDIT\\\",\\\"deleteUnusedSecurityGroups\\\":true,\\\"coalesceRedundantSecurityGroups\\\":true}\"] \n            \n             }\n       {-  Example: [SHIELD_ADVANCED] with web ACL management\n           \n             [\"{\\\"type\\\":\\\"SHIELD_ADVANCED\\\",\\\"optimizeUnassociatedWebACL\\\":true}\"] \n            \n             If you set [optimizeUnassociatedWebACL] to [true], Firewall Manager creates web ACLs in accounts within the policy scope if the web ACLs will be used by at least one resource. Firewall Manager creates web ACLs in the accounts within policy scope only if the web ACLs will be used by at least one resource. If at any time an account comes into policy scope, Firewall Manager automatically creates a web ACL in the account if at least one resource will use the web ACL.\n             \n              Upon enablement, Firewall Manager performs a one-time cleanup of unused web ACLs in your account. The cleanup process can take several hours. If a resource leaves policy scope after Firewall Manager creates a web ACL, Firewall Manager doesn't disassociate the resource from the web ACL. If you want Firewall Manager to clean up the web ACL, you must first manually disassociate the resources from the web ACL, and then enable the manage unused web ACLs option in your policy.\n              \n               If you set [optimizeUnassociatedWebACL] to [false], and Firewall Manager automatically creates an empty web ACL in each account that's within policy scope.\n               \n                }\n       {-  Specification for [SHIELD_ADVANCED] for Amazon CloudFront distributions \n           \n             [\"{\\\"type\\\":\\\"SHIELD_ADVANCED\\\",\\\"automaticResponseConfiguration\\\": {\\\"automaticResponseStatus\\\":\\\"ENABLED|IGNORED|DISABLED\\\", \\\"automaticResponseAction\\\":\\\"BLOCK|COUNT\\\"}, \\\"overrideCustomerWebaclClassic\\\":true|false, \\\"optimizeUnassociatedWebACL\\\":true|false}\"] \n            \n             For example: [\"{\\\"type\\\":\\\"SHIELD_ADVANCED\\\",\\\"automaticResponseConfiguration\\\":\n                 {\\\"automaticResponseStatus\\\":\\\"ENABLED\\\",\n                 \\\"automaticResponseAction\\\":\\\"COUNT\\\"}}\"] \n             \n              The default value for [automaticResponseStatus] is [IGNORED]. The value for [automaticResponseAction] is only required when [automaticResponseStatus] is set to [ENABLED]. The default value for [overrideCustomerWebaclClassic] is [false].\n              \n               For other resource types that you can protect with a Shield Advanced policy, this [ManagedServiceData] configuration is an empty string.\n               \n                }\n       {-  Example: [THIRD_PARTY_FIREWALL] \n           \n            Replace [THIRD_PARTY_FIREWALL_NAME] with the name of the third-party firewall.\n            \n              [\"{\n              \"type\":\"THIRD_PARTY_FIREWALL\",\n              \"thirdPartyFirewall\":\"THIRD_PARTY_FIREWALL_NAME\",\n              \"thirdPartyFirewallConfig\":{\n                \"thirdPartyFirewallPolicyList\":\\[\"global-1\"\\]\n              },\n\t          \"firewallDeploymentModel\":{\n                \"distributedFirewallDeploymentModel\":{\n                  \"distributedFirewallOrchestrationConfig\":{\n                    \"firewallCreationConfig\":{\n                      \"endpointLocation\":{\n                        \"availabilityZoneConfigList\":\\[\n                          {\n                            \"availabilityZoneName\":\"${AvailabilityZone}\"\n                          }\n                        \\]\n                      }\n                    },\n                    \"allowedIPV4CidrList\":\\[\n                    \\]\n                  }\n                }\n              }\n            }\"] \n             \n              }\n       {-  Example: [WAFV2] - Account takeover prevention, Bot Control managed rule groups, optimize unassociated web ACL, and rule action override \n           \n             [\"{\\\"type\\\":\\\"WAFV2\\\",\\\"preProcessRuleGroups\\\":\\[{\\\"ruleGroupArn\\\":null,\\\"overrideAction\\\":{\\\"type\\\":\\\"NONE\\\"},\\\"managedRuleGroupIdentifier\\\":{\\\"versionEnabled\\\":null,\\\"version\\\":null,\\\"vendorName\\\":\\\"AWS\\\",\\\"managedRuleGroupName\\\":\\\"AWSManagedRulesATPRuleSet\\\",\\\"managedRuleGroupConfigs\\\":\\[{\\\"awsmanagedRulesATPRuleSet\\\":{\\\"loginPath\\\":\\\"/loginpath\\\",\\\"requestInspection\\\":{\\\"payloadType\\\":\\\"FORM_ENCODED|JSON\\\",\\\"usernameField\\\":{\\\"identifier\\\":\\\"/form/username\\\"},\\\"passwordField\\\":{\\\"identifier\\\":\\\"/form/password\\\"}}}}\\]},\\\"ruleGroupType\\\":\\\"ManagedRuleGroup\\\",\\\"excludeRules\\\":\\[\\],\\\"sampledRequestsEnabled\\\":true},{\\\"ruleGroupArn\\\":null,\\\"overrideAction\\\":{\\\"type\\\":\\\"NONE\\\"},\\\"managedRuleGroupIdentifier\\\":{\\\"versionEnabled\\\":null,\\\"version\\\":null,\\\"vendorName\\\":\\\"AWS\\\",\\\"managedRuleGroupName\\\":\\\"AWSManagedRulesBotControlRuleSet\\\",\\\"managedRuleGroupConfigs\\\":\\[{\\\"awsmanagedRulesBotControlRuleSet\\\":{\\\"inspectionLevel\\\":\\\"TARGETED|COMMON\\\"}}\\]},\\\"ruleGroupType\\\":\\\"ManagedRuleGroup\\\",\\\"excludeRules\\\":\\[\\],\\\"sampledRequestsEnabled\\\":true,\\\"ruleActionOverrides\\\":\\[{\\\"name\\\":\\\"Rule1\\\",\\\"actionToUse\\\":{\\\"allow|block|count|captcha|challenge\\\":{}}},{\\\"name\\\":\\\"Rule2\\\",\\\"actionToUse\\\":{\\\"allow|block|count|captcha|challenge\\\":{}}}\\]}\\],\\\"postProcessRuleGroups\\\":\\[\\],\\\"defaultAction\\\":{\\\"type\\\":\\\"ALLOW\\\"},\\\"customRequestHandling\\\":null,\\\"customResponse\\\":null,\\\"overrideCustomerWebACLAssociation\\\":false,\\\"loggingConfiguration\\\":null,\\\"sampledRequestsEnabledForDefaultActions\\\":true,\\\"optimizeUnassociatedWebACL\\\":true}\"] \n            \n             {ul\n                   {-  Bot Control - For information about [AWSManagedRulesBotControlRuleSet] managed rule groups, see {{:https://docs.aws.amazon.com/waf/latest/APIReference/API_AWSManagedRulesBotControlRuleSet.html}AWSManagedRulesBotControlRuleSet} in the {i WAF API Reference}.\n                       \n                        }\n                   {-  Fraud Control account takeover prevention (ATP) - For information about the properties available for [AWSManagedRulesATPRuleSet] managed rule groups, see {{:https://docs.aws.amazon.com/waf/latest/APIReference/API_AWSManagedRulesATPRuleSet.html}AWSManagedRulesATPRuleSet} in the {i WAF API Reference}.\n                       \n                        }\n                   {-  Optimize unassociated web ACL - If you set [optimizeUnassociatedWebACL] to [true], Firewall Manager creates web ACLs in accounts within the policy scope if the web ACLs will be used by at least one resource. Firewall Manager creates web ACLs in the accounts within policy scope only if the web ACLs will be used by at least one resource. If at any time an account comes into policy scope, Firewall Manager automatically creates a web ACL in the account if at least one resource will use the web ACL.\n                       \n                        Upon enablement, Firewall Manager performs a one-time cleanup of unused web ACLs in your account. The cleanup process can take several hours. If a resource leaves policy scope after Firewall Manager creates a web ACL, Firewall Manager disassociates the resource from the web ACL, but won't clean up the unused web ACL. Firewall Manager only cleans up unused web ACLs when you first enable management of unused web ACLs in a policy.\n                        \n                         If you set [optimizeUnassociatedWebACL] to [false] Firewall Manager doesn't manage unused web ACLs, and Firewall Manager automatically creates an empty web ACL in each account that's within policy scope.\n                         \n                          }\n                   {-  Rule action overrides - Firewall Manager supports rule action overrides only for managed rule groups. To configure a [RuleActionOverrides] add the [Name] of the rule to override, and [ActionToUse], which is the new action to use for the rule. For information about using rule action override, see {{:https://docs.aws.amazon.com/waf/latest/APIReference/API_RuleActionOverride.html}RuleActionOverride} in the {i WAF API Reference}.\n                       \n                        }\n                   \n        }\n         }\n       {-  Example: [WAFV2] - [CAPTCHA] and [Challenge] configs \n           \n             [\"{\\\"type\\\":\\\"WAFV2\\\",\\\"preProcessRuleGroups\\\":\\[{\\\"ruleGroupArn\\\":null,\\\"overrideAction\\\":{\\\"type\\\":\\\"NONE\\\"},\\\"managedRuleGroupIdentifier\\\":{\\\"versionEnabled\\\":null,\\\"version\\\":null,\\\"vendorName\\\":\\\"AWS\\\",\\\"managedRuleGroupName\\\":\\\"AWSManagedRulesAdminProtectionRuleSet\\\"},\\\"ruleGroupType\\\":\\\"ManagedRuleGroup\\\",\\\"excludeRules\\\":\\[\\],\\\"sampledRequestsEnabled\\\":true}\\],\\\"postProcessRuleGroups\\\":\\[\\],\\\"defaultAction\\\":{\\\"type\\\":\\\"ALLOW\\\"},\\\"customRequestHandling\\\":null,\\\"customResponse\\\":null,\\\"overrideCustomerWebACLAssociation\\\":false,\\\"loggingConfiguration\\\":null,\\\"sampledRequestsEnabledForDefaultActions\\\":true,\\\"captchaConfig\\\":{\\\"immunityTimeProperty\\\":{\\\"immunityTime\\\":500}},\\\"challengeConfig\\\":{\\\"immunityTimeProperty\\\":{\\\"immunityTime\\\":800}},\\\"tokenDomains\\\":\\[\\\"google.com\\\",\\\"amazon.com\\\"\\],\\\"associationConfig\\\":{\\\"requestBody\\\":{\\\"CLOUDFRONT\\\":{\\\"defaultSizeInspectionLimit\\\":\\\"KB_16\\\"}}}}\"] \n            \n             {ul\n                   {-   [CAPTCHA] and [Challenge] configs - If you update the policy's values for [associationConfig], [captchaConfig], [challengeConfig], or [tokenDomains], Firewall Manager will overwrite your local web ACLs to contain the new value(s). However, if you don't update the policy's [associationConfig], [captchaConfig], [challengeConfig], or [tokenDomains] values, the values in your local web ACLs will remain unchanged. For information about association configs, see {{:https://docs.aws.amazon.com/waf/latest/APIReference/API_AssociationConfig.html}AssociationConfig}. For information about CAPTCHA and Challenge configs, see {{:https://docs.aws.amazon.com/waf/latest/APIReference/API_CaptchaConfig.html}CaptchaConfig} and {{:https://docs.aws.amazon.com/waf/latest/APIReference/API_ChallengeConfig.html}ChallengeConfig} in the {i WAF API Reference}.\n                       \n                        }\n                   {-   [defaultSizeInspectionLimit] - Specifies the maximum size of the web request body component that an associated Amazon CloudFront distribution should send to WAF for inspection. For more information, see {{:https://docs.aws.amazon.com/waf/latest/APIReference/API_RequestBodyAssociatedResourceTypeConfig.html#WAF-Type-RequestBodyAssociatedResourceTypeConfig-DefaultSizeInspectionLimit}DefaultSizeInspectionLimit} in the {i WAF API Reference}.\n                       \n                        }\n                   \n        }\n         }\n       {-  Example: [WAFV2] - Firewall Manager support for WAF managed rule group versioning \n           \n             [\"{\\\"type\\\":\\\"WAFV2\\\",\\\"preProcessRuleGroups\\\":\\[{\\\"ruleGroupArn\\\":null,\\\"overrideAction\\\":{\\\"type\\\":\\\"NONE\\\"},\\\"managedRuleGroupIdentifier\\\":{\\\"versionEnabled\\\":true,\\\"version\\\":\\\"Version_2.0\\\",\\\"vendorName\\\":\\\"AWS\\\",\\\"managedRuleGroupName\\\":\\\"AWSManagedRulesCommonRuleSet\\\"},\\\"ruleGroupType\\\":\\\"ManagedRuleGroup\\\",\\\"excludeRules\\\":\\[{\\\"name\\\":\\\"NoUserAgent_HEADER\\\"}\\]}\\],\\\"postProcessRuleGroups\\\":\\[\\],\\\"defaultAction\\\":{\\\"type\\\":\\\"ALLOW\\\"},\\\"overrideCustomerWebACLAssociation\\\":false,\\\"loggingConfiguration\\\":{\\\"logDestinationConfigs\\\":\\[\\\"arn:aws:firehose:us-west-2:12345678912:deliverystream/aws-waf-logs-fms-admin-destination\\\"\\],\\\"redactedFields\\\":\\[{\\\"redactedFieldType\\\":\\\"SingleHeader\\\",\\\"redactedFieldValue\\\":\\\"Cookies\\\"},{\\\"redactedFieldType\\\":\\\"Method\\\"}\\]}}\"] \n            \n              To use a specific version of a WAF managed rule group in your Firewall Manager policy, you must set [versionEnabled] to [true], and set [version] to the version you'd like to use. If you don't set [versionEnabled] to [true], or if you omit [versionEnabled], then Firewall Manager uses the default version of the WAF managed rule group. \n             \n              }\n       {-  Example: [WAFV2] - Logging configurations \n           \n             [\"{\\\"type\\\":\\\"WAFV2\\\",\\\"preProcessRuleGroups\\\":\\[{\\\"ruleGroupArn\\\":null, \\\"overrideAction\\\":{\\\"type\\\":\\\"NONE\\\"},\\\"managedRuleGroupIdentifier\\\": {\\\"versionEnabled\\\":null,\\\"version\\\":null,\\\"vendorName\\\":\\\"AWS\\\", \\\"managedRuleGroupName\\\":\\\"AWSManagedRulesAdminProtectionRuleSet\\\"} ,\\\"ruleGroupType\\\":\\\"ManagedRuleGroup\\\",\\\"excludeRules\\\":\\[\\], \\\"sampledRequestsEnabled\\\":true}\\],\\\"postProcessRuleGroups\\\":\\[\\], \\\"defaultAction\\\":{\\\"type\\\":\\\"ALLOW\\\"},\\\"customRequestHandling\\\" :null,\\\"customResponse\\\":null,\\\"overrideCustomerWebACLAssociation\\\" :false,\\\"loggingConfiguration\\\":{\\\"logDestinationConfigs\\\": \\[\\\"arn:aws:s3:::aws-waf-logs-example-bucket\\\"\\] ,\\\"redactedFields\\\":\\[\\],\\\"loggingFilterConfigs\\\":{\\\"defaultBehavior\\\":\\\"KEEP\\\", \\\"filters\\\":\\[{\\\"behavior\\\":\\\"KEEP\\\",\\\"requirement\\\":\\\"MEETS_ALL\\\", \\\"conditions\\\":\\[{\\\"actionCondition\\\":\\\"CAPTCHA\\\"},{\\\"actionCondition\\\": \\\"CHALLENGE\\\"}, {\\\"actionCondition\\\":\\\"EXCLUDED_AS_COUNT\\\"}\\]}\\]}},\\\"sampledRequestsEnabledForDefaultActions\\\":true}\"] \n            \n             Firewall Manager supports Amazon Kinesis Data Firehose and Amazon S3 as the [logDestinationConfigs] in your [loggingConfiguration]. For information about WAF logging configurations, see {{:https://docs.aws.amazon.com/waf/latest/APIReference/API_LoggingConfiguration.html}LoggingConfiguration} in the {i WAF API Reference} \n             \n              In the [loggingConfiguration], you can specify one [logDestinationConfigs]. Optionally provide as many as 20 [redactedFields]. The [RedactedFieldType] must be one of [URI], [QUERY_STRING], [HEADER], or [METHOD].\n              \n               }\n       {-  Example: [WAF Classic] \n           \n             [\"{\\\"type\\\": \\\"WAF\\\", \\\"ruleGroups\\\":\n                 \\[{\\\"id\\\":\\\"12345678-1bcd-9012-efga-0987654321ab\\\", \\\"overrideAction\\\" : {\\\"type\\\":\n                 \\\"COUNT\\\"}}\\], \\\"defaultAction\\\": {\\\"type\\\": \\\"BLOCK\\\"}}\"] \n            \n             }\n       }\n  "];
  type_: security_service_type
    [@ocaml.doc
      "The service that the policy is using to protect the resources. This specifies the type of policy that is created, either an WAF policy, a Shield Advanced policy, or a security group policy. For security group policies, Firewall Manager supports one security group for each common policy and for each content audit policy. This is an adjustable limit that you can increase by contacting Amazon Web Services Support.\n"]}
[@@ocaml.doc
  "Details about the security service that is being used to protect the resources.\n"]
type nonrec resource_tag =
  {
  value: string option
    [@ocaml.doc
      "The resource tag value. To specify an empty string value, either don't provide this or specify it as \"\". \n"];
  key: string [@ocaml.doc "The resource tag key.\n"]}[@@ocaml.doc
                                                       "The resource tags that Firewall Manager uses to determine if a particular resource should be included or excluded from the Firewall Manager policy. Tags enable you to categorize your Amazon Web Services resources in different ways, for example, by purpose, owner, or environment. Each tag consists of a key and an optional value. Firewall Manager combines the tags with \"AND\" so that, if you add more than one tag to a policy scope, a resource must have all the specified tags to be included or excluded. For more information, see {{:https://docs.aws.amazon.com/awsconsolehelpdocs/latest/gsg/tag-editor.html}Working with Tag Editor}.\n\n Every resource tag must have a string value, either a non-empty string or an empty string. If you don't provide a value for a resource tag, Firewall Manager saves the value as an empty string: \"\". When Firewall Manager compares tags, it only matches two tags if they have the same key and the same value. A tag with an empty string value only matches with tags that also have an empty string value. \n "]
type nonrec resource_set_status =
  | OUT_OF_ADMIN_SCOPE [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec resource_set_summary =
  {
  resource_set_status: resource_set_status option
    [@ocaml.doc
      "Indicates whether the resource set is in or out of an admin's Region scope.\n\n {ul\n       {-   [ACTIVE] - The administrator can manage and delete the resource set.\n           \n            }\n       {-   [OUT_OF_ADMIN_SCOPE] - The administrator can view the resource set, but they can't edit or delete the resource set. Existing protections stay in place. Any new resource that come into scope of the resource set won't be protected.\n           \n            }\n       }\n  "];
  last_update_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The last time that the resource set was changed.\n"];
  description: string option
    [@ocaml.doc "A description of the resource set.\n"];
  name: string option
    [@ocaml.doc
      "The descriptive name of the resource set. You can't change the name of a resource set after you create it.\n"];
  id: string option
    [@ocaml.doc
      "A unique identifier for the resource set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"]}
[@@ocaml.doc "Summarizes the resource sets used in a policy.\n"]
type nonrec resource_set =
  {
  resource_set_status: resource_set_status option
    [@ocaml.doc
      "Indicates whether the resource set is in or out of an admin's Region scope.\n\n {ul\n       {-   [ACTIVE] - The administrator can manage and delete the resource set.\n           \n            }\n       {-   [OUT_OF_ADMIN_SCOPE] - The administrator can view the resource set, but they can't edit or delete the resource set. Existing protections stay in place. Any new resource that come into scope of the resource set won't be protected.\n           \n            }\n       }\n  "];
  last_update_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The last time that the resource set was changed.\n"];
  resource_type_list: string list
    [@ocaml.doc
      "Determines the resources that can be associated to the resource set. Depending on your setting for max results and the number of resource sets, a single call might not return the full list.\n"];
  update_token: string option
    [@ocaml.doc
      "An optional token that you can use for optimistic locking. Firewall Manager returns a token to your requests that access the resource set. The token marks the state of the resource set resource at the time of the request. Update tokens are not allowed when creating a resource set. After creation, each subsequent update call to the resource set requires the update token. \n\n To make an unconditional change to the resource set, omit the token in your update request. Without the token, Firewall Manager performs your updates regardless of whether the resource set has changed since you last retrieved it.\n \n  To make a conditional change to the resource set, provide the token in your update request. Firewall Manager uses the token to ensure that the resource set hasn't changed since you last retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If this happens, retrieve the resource set again to get a current copy of it with a new token. Reapply your changes as needed, then try the operation again using the new token. \n  "];
  description: string option
    [@ocaml.doc "A description of the resource set.\n"];
  name: string
    [@ocaml.doc
      "The descriptive name of the resource set. You can't change the name of a resource set after you create it.\n"];
  id: string option
    [@ocaml.doc
      "A unique identifier for the resource set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"]}
[@@ocaml.doc "A set of resources to include in a policy.\n"]
type nonrec resource =
  {
  account_id: string option
    [@ocaml.doc
      "The Amazon Web Services account ID that the associated resource belongs to.\n"];
  ur_i: string
    [@ocaml.doc "The resource's universal resource indicator (URI).\n"]}
[@@ocaml.doc
  "Details of a resource that is associated to an Firewall Manager resource set.\n"]
type nonrec region_scope =
  {
  all_regions_enabled: bool option
    [@ocaml.doc
      "Allows the specified Firewall Manager administrator to manage all Amazon Web Services Regions.\n"];
  regions: string list option
    [@ocaml.doc
      "The Amazon Web Services Regions that the specified Firewall Manager administrator can perform actions in.\n"]}
[@@ocaml.doc
  "Defines the Amazon Web Services Regions that the specified Firewall Manager administrator can manage.\n"]
type nonrec put_resource_set_response =
  {
  resource_set_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the resource set.\n"];
  resource_set: resource_set [@ocaml.doc "Details about the resource set.\n"]}
[@@ocaml.doc ""]
type nonrec put_resource_set_request =
  {
  tag_list: tag list option
    [@ocaml.doc
      "Retrieves the tags associated with the specified resource set. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to \"customer\" and the value to the customer name or ID. You can specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for a resource.\n"];
  resource_set: resource_set
    [@ocaml.doc
      "Details about the resource set to be created or updated.>\n"]}
[@@ocaml.doc ""]
type nonrec previous_protocols_list = (string * string list) list[@@ocaml.doc
                                                                   ""]
type nonrec protocols_list_data =
  {
  previous_protocols_list: previous_protocols_list option
    [@ocaml.doc
      "A map of previous version numbers to their corresponding protocol arrays.\n"];
  protocols_list: string list
    [@ocaml.doc
      "An array of protocols in the Firewall Manager protocols list.\n"];
  last_update_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time that the Firewall Manager protocols list was last updated.\n"];
  create_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time that the Firewall Manager protocols list was created.\n"];
  list_update_token: string option
    [@ocaml.doc
      "A unique identifier for each update to the list. When you update the list, the update token must match the token of the current version of the application list. You can retrieve the update token by getting the list. \n"];
  list_name: string
    [@ocaml.doc "The name of the Firewall Manager protocols list.\n"];
  list_id: string option
    [@ocaml.doc "The ID of the Firewall Manager protocols list.\n"]}[@@ocaml.doc
                                                                    "An Firewall Manager protocols list.\n"]
type nonrec put_protocols_list_response =
  {
  protocols_list_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the protocols list.\n"];
  protocols_list: protocols_list_data option
    [@ocaml.doc "The details of the Firewall Manager protocols list.\n"]}
[@@ocaml.doc ""]
type nonrec put_protocols_list_request =
  {
  tag_list: tag list option
    [@ocaml.doc "The tags associated with the resource.\n"];
  protocols_list: protocols_list_data
    [@ocaml.doc
      "The details of the Firewall Manager protocols list to be created.\n"]}
[@@ocaml.doc ""]
type nonrec customer_policy_scope_id_type =
  | ORG_UNIT [@ocaml.doc ""]
  | ACCOUNT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec customer_policy_scope_map =
  (customer_policy_scope_id_type * string list) list[@@ocaml.doc ""]
type nonrec customer_policy_status =
  | OUT_OF_ADMIN_SCOPE [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec policy =
  {
  policy_status: customer_policy_status option
    [@ocaml.doc
      "Indicates whether the policy is in or out of an admin's policy or Region scope.\n\n {ul\n       {-   [ACTIVE] - The administrator can manage and delete the policy.\n           \n            }\n       {-   [OUT_OF_ADMIN_SCOPE] - The administrator can view the policy, but they can't edit or delete the policy. Existing policy protections stay in place. Any new resources that come into scope of the policy won't be protected.\n           \n            }\n       }\n  "];
  policy_description: string option
    [@ocaml.doc "Your description of the Firewall Manager policy.\n"];
  resource_set_ids: string list option
    [@ocaml.doc
      "The unique identifiers of the resource sets used by the policy.\n"];
  exclude_map: customer_policy_scope_map option
    [@ocaml.doc
      "Specifies the Amazon Web Services account IDs and Organizations organizational units (OUs) to exclude from the policy. Specifying an OU is the equivalent of specifying all accounts in the OU and in any of its child OUs, including any child OUs and accounts that are added at a later time.\n\n You can specify inclusions or exclusions, but not both. If you specify an [IncludeMap], Firewall Manager applies the policy to all accounts specified by the [IncludeMap], and does not evaluate any [ExcludeMap] specifications. If you do not specify an [IncludeMap], then Firewall Manager applies the policy to all accounts except for those specified by the [ExcludeMap].\n \n  You can specify account IDs, OUs, or a combination: \n  \n   {ul\n         {-  Specify account IDs by setting the key to [ACCOUNT]. For example, the following is a valid map: [{\226\128\156ACCOUNT\226\128\157 : \\[\226\128\156accountID1\226\128\157, \226\128\156accountID2\226\128\157\\]}].\n             \n              }\n         {-  Specify OUs by setting the key to [ORG_UNIT]. For example, the following is a valid map: [{\226\128\156ORG_UNIT\226\128\157 : \\[\226\128\156ouid111\226\128\157, \226\128\156ouid112\226\128\157\\]}].\n             \n              }\n         {-  Specify accounts and OUs together in a single map, separated with a comma. For example, the following is a valid map: [{\226\128\156ACCOUNT\226\128\157 : \\[\226\128\156accountID1\226\128\157, \226\128\156accountID2\226\128\157\\], \226\128\156ORG_UNIT\226\128\157 : \\[\226\128\156ouid111\226\128\157, \226\128\156ouid112\226\128\157\\]}].\n             \n              }\n         }\n  "];
  include_map: customer_policy_scope_map option
    [@ocaml.doc
      "Specifies the Amazon Web Services account IDs and Organizations organizational units (OUs) to include in the policy. Specifying an OU is the equivalent of specifying all accounts in the OU and in any of its child OUs, including any child OUs and accounts that are added at a later time.\n\n You can specify inclusions or exclusions, but not both. If you specify an [IncludeMap], Firewall Manager applies the policy to all accounts specified by the [IncludeMap], and does not evaluate any [ExcludeMap] specifications. If you do not specify an [IncludeMap], then Firewall Manager applies the policy to all accounts except for those specified by the [ExcludeMap].\n \n  You can specify account IDs, OUs, or a combination: \n  \n   {ul\n         {-  Specify account IDs by setting the key to [ACCOUNT]. For example, the following is a valid map: [{\226\128\156ACCOUNT\226\128\157 : \\[\226\128\156accountID1\226\128\157, \226\128\156accountID2\226\128\157\\]}].\n             \n              }\n         {-  Specify OUs by setting the key to [ORG_UNIT]. For example, the following is a valid map: [{\226\128\156ORG_UNIT\226\128\157 : \\[\226\128\156ouid111\226\128\157, \226\128\156ouid112\226\128\157\\]}].\n             \n              }\n         {-  Specify accounts and OUs together in a single map, separated with a comma. For example, the following is a valid map: [{\226\128\156ACCOUNT\226\128\157 : \\[\226\128\156accountID1\226\128\157, \226\128\156accountID2\226\128\157\\], \226\128\156ORG_UNIT\226\128\157 : \\[\226\128\156ouid111\226\128\157, \226\128\156ouid112\226\128\157\\]}].\n             \n              }\n         }\n  "];
  delete_unused_fm_managed_resources: bool option
    [@ocaml.doc
      "Indicates whether Firewall Manager should automatically remove protections from resources that leave the policy scope and clean up resources that Firewall Manager is managing for accounts when those accounts leave policy scope. For example, Firewall Manager will disassociate a Firewall Manager managed web ACL from a protected customer resource when the customer resource leaves policy scope. \n\n By default, Firewall Manager doesn't remove protections or delete Firewall Manager managed resources. \n \n  This option is not available for Shield Advanced or WAF Classic policies.\n  "];
  remediation_enabled: bool
    [@ocaml.doc
      "Indicates if the policy should be automatically applied to new resources.\n"];
  exclude_resource_tags: bool
    [@ocaml.doc
      "If set to [True], resources with the tags that are specified in the [ResourceTag] array are not in scope of the policy. If set to [False], and the [ResourceTag] array is not null, only resources with the specified tags are in scope of the policy.\n"];
  resource_tags: resource_tag list option
    [@ocaml.doc "An array of [ResourceTag] objects.\n"];
  resource_type_list: string list option
    [@ocaml.doc
      "An array of [ResourceType] objects. Use this only to specify multiple resource types. To specify a single resource type, use [ResourceType].\n"];
  resource_type: string
    [@ocaml.doc
      "The type of resource protected by or in scope of the policy. This is in the format shown in the {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon Web Services Resource Types Reference}. To apply this policy to multiple resource types, specify a resource type of [ResourceTypeList] and then specify the resource types in a [ResourceTypeList].\n\n The following are valid resource types for each Firewall Manager policy type:\n \n  {ul\n        {-  Amazon Web Services WAF Classic - [AWS::ApiGateway::Stage], [AWS::CloudFront::Distribution], and [AWS::ElasticLoadBalancingV2::LoadBalancer].\n            \n             }\n        {-  WAF - [AWS::ApiGateway::Stage], [AWS::ElasticLoadBalancingV2::LoadBalancer], and [AWS::CloudFront::Distribution].\n            \n             }\n        {-  Shield Advanced - [AWS::ElasticLoadBalancingV2::LoadBalancer], [AWS::ElasticLoadBalancing::LoadBalancer], [AWS::EC2::EIP], and [AWS::CloudFront::Distribution].\n            \n             }\n        {-  Network ACL - [AWS::EC2::Subnet].\n            \n             }\n        {-  Security group usage audit - [AWS::EC2::SecurityGroup].\n            \n             }\n        {-  Security group content audit - [AWS::EC2::SecurityGroup], [AWS::EC2::NetworkInterface], and [AWS::EC2::Instance].\n            \n             }\n        {-  DNS Firewall, Network Firewall, and third-party firewall - [AWS::EC2::VPC].\n            \n             }\n        }\n  "];
  security_service_policy_data: security_service_policy_data
    [@ocaml.doc
      "Details about the security service that is being used to protect the resources.\n"];
  policy_update_token: string option
    [@ocaml.doc
      "A unique identifier for each update to the policy. When issuing a [PutPolicy] request, the [PolicyUpdateToken] in the request must match the [PolicyUpdateToken] of the current policy version. To get the [PolicyUpdateToken] of the current policy version, use a [GetPolicy] request.\n"];
  policy_name: string
    [@ocaml.doc "The name of the Firewall Manager policy.\n"];
  policy_id: string option
    [@ocaml.doc "The ID of the Firewall Manager policy.\n"]}[@@ocaml.doc
                                                              "An Firewall Manager policy.\n"]
type nonrec put_policy_response =
  {
  policy_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the policy.\n"];
  policy: policy option
    [@ocaml.doc "The details of the Firewall Manager policy.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec put_policy_request =
  {
  tag_list: tag list option
    [@ocaml.doc "The tags to add to the Amazon Web Services resource.\n"];
  policy: policy
    [@ocaml.doc
      "The details of the Firewall Manager policy to be created.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_type_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The value of the [Type] parameter is invalid.\n"]
type nonrec put_notification_channel_request =
  {
  sns_role_name: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM role that allows Amazon SNS to record Firewall Manager activity. \n"];
  sns_topic_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the SNS topic that collects notifications from Firewall Manager.\n"]}
[@@ocaml.doc ""]
type nonrec app =
  {
  port: int [@ocaml.doc "The application's port number, for example [80].\n"];
  protocol: string
    [@ocaml.doc
      "The IP protocol name or number. The name can be one of [tcp], [udp], or [icmp]. For information on possible numbers, see {{:https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml}Protocol Numbers}.\n"];
  app_name: string [@ocaml.doc "The application's name.\n"]}[@@ocaml.doc
                                                              "An individual Firewall Manager application.\n"]
type nonrec previous_apps_list = (string * app list) list[@@ocaml.doc ""]
type nonrec apps_list_data =
  {
  previous_apps_list: previous_apps_list option
    [@ocaml.doc
      "A map of previous version numbers to their corresponding [App] object arrays.\n"];
  apps_list: app list
    [@ocaml.doc
      "An array of applications in the Firewall Manager applications list.\n"];
  last_update_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time that the Firewall Manager applications list was last updated.\n"];
  create_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time that the Firewall Manager applications list was created.\n"];
  list_update_token: string option
    [@ocaml.doc
      "A unique identifier for each update to the list. When you update the list, the update token must match the token of the current version of the application list. You can retrieve the update token by getting the list. \n"];
  list_name: string
    [@ocaml.doc "The name of the Firewall Manager applications list.\n"];
  list_id: string option
    [@ocaml.doc "The ID of the Firewall Manager applications list.\n"]}
[@@ocaml.doc "An Firewall Manager applications list.\n"]
type nonrec put_apps_list_response =
  {
  apps_list_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the applications list.\n"];
  apps_list: apps_list_data option
    [@ocaml.doc "The details of the Firewall Manager applications list.\n"]}
[@@ocaml.doc ""]
type nonrec put_apps_list_request =
  {
  tag_list: tag list option
    [@ocaml.doc "The tags associated with the resource.\n"];
  apps_list: apps_list_data
    [@ocaml.doc
      "The details of the Firewall Manager applications list to be created.\n"]}
[@@ocaml.doc ""]
type nonrec account_scope =
  {
  exclude_specified_accounts: bool option
    [@ocaml.doc
      "A boolean value that excludes the accounts in [AccountScope$Accounts] from the administrator's scope. If true, the Firewall Manager administrator can apply policies to all members of the organization except for the accounts listed in [AccountScope$Accounts]. You can either specify a list of accounts to exclude by [AccountScope$Accounts], or you can enable management of all accounts by [AccountScope$AllAccountsEnabled]. You cannot specify both.\n"];
  all_accounts_enabled: bool option
    [@ocaml.doc
      "A boolean value that indicates if the administrator can apply policies to all accounts within an organization. If true, the administrator can apply policies to all accounts within the organization. You can either enable management of all accounts through this operation, or you can specify a list of accounts to manage in [AccountScope$Accounts]. You cannot specify both.\n"];
  accounts: string list option
    [@ocaml.doc
      "The list of accounts within the organization that the specified Firewall Manager administrator either can or cannot apply policies to, based on the value of [ExcludeSpecifiedAccounts]. If [ExcludeSpecifiedAccounts] is set to [true], then the Firewall Manager administrator can apply policies to all members of the organization except for the accounts in this list. If [ExcludeSpecifiedAccounts] is set to [false], then the Firewall Manager administrator can only apply policies to the accounts in this list.\n"]}
[@@ocaml.doc
  "Configures the accounts within the administrator's Organizations organization that the specified Firewall Manager administrator can apply policies to.\n"]
type nonrec organizational_unit_scope =
  {
  exclude_specified_organizational_units: bool option
    [@ocaml.doc
      "A boolean value that excludes the OUs in [OrganizationalUnitScope$OrganizationalUnits] from the administrator's scope. If true, the Firewall Manager administrator can apply policies to all OUs in the organization except for the OUs listed in [OrganizationalUnitScope$OrganizationalUnits]. You can either specify a list of OUs to exclude by [OrganizationalUnitScope$OrganizationalUnits], or you can enable management of all OUs by [OrganizationalUnitScope$AllOrganizationalUnitsEnabled]. You cannot specify both.\n"];
  all_organizational_units_enabled: bool option
    [@ocaml.doc
      "A boolean value that indicates if the administrator can apply policies to all OUs within an organization. If true, the administrator can manage all OUs within the organization. You can either enable management of all OUs through this operation, or you can specify OUs to manage in [OrganizationalUnitScope$OrganizationalUnits]. You cannot specify both.\n"];
  organizational_units: string list option
    [@ocaml.doc
      "The list of OUs within the organization that the specified Firewall Manager administrator either can or cannot apply policies to, based on the value of [OrganizationalUnitScope$ExcludeSpecifiedOrganizationalUnits]. If [OrganizationalUnitScope$ExcludeSpecifiedOrganizationalUnits] is set to [true], then the Firewall Manager administrator can apply policies to all OUs in the organization except for the OUs in this list. If [OrganizationalUnitScope$ExcludeSpecifiedOrganizationalUnits] is set to [false], then the Firewall Manager administrator can only apply policies to the OUs in this list.\n"]}
[@@ocaml.doc
  "Defines the Organizations organizational units (OUs) that the specified Firewall Manager administrator can apply policies to. For more information about OUs in Organizations, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_ous.html}Managing organizational units (OUs) } in the {i Organizations User Guide}.\n"]
type nonrec policy_type_scope =
  {
  all_policy_types_enabled: bool option
    [@ocaml.doc
      "Allows the specified Firewall Manager administrator to manage all Firewall Manager policy types, except for third-party policy types. Third-party policy types can only be managed by the Firewall Manager default administrator.\n"];
  policy_types: security_service_type list option
    [@ocaml.doc
      "The list of policy types that the specified Firewall Manager administrator can manage.\n"]}
[@@ocaml.doc
  "Defines the policy types that the specified Firewall Manager administrator can manage.\n"]
type nonrec admin_scope =
  {
  policy_type_scope: policy_type_scope option
    [@ocaml.doc
      "Defines the Firewall Manager policy types that the specified Firewall Manager administrator can create and manage.\n"];
  region_scope: region_scope option
    [@ocaml.doc
      "Defines the Amazon Web Services Regions that the specified Firewall Manager administrator can perform actions in.\n"];
  organizational_unit_scope: organizational_unit_scope option
    [@ocaml.doc
      "Defines the Organizations organizational units that the specified Firewall Manager administrator can apply policies to. For more information about OUs in Organizations, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_ous.html}Managing organizational units (OUs) } in the {i Organizations User Guide}.\n"];
  account_scope: account_scope option
    [@ocaml.doc
      "Defines the accounts that the specified Firewall Manager administrator can apply policies to.\n"]}
[@@ocaml.doc
  "Defines the resources that the Firewall Manager administrator can manage. For more information about administrative scope, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/fms-administrators.html}Managing Firewall Manager administrators} in the {i Firewall Manager Developer Guide}.\n"]
type nonrec put_admin_account_request =
  {
  admin_scope: admin_scope option
    [@ocaml.doc
      "Configures the resources that the specified Firewall Manager administrator can manage. As a best practice, set the administrative scope according to the principles of least privilege. Only grant the administrator the specific resources or permissions that they need to perform the duties of their role.\n"];
  admin_account: string
    [@ocaml.doc
      "The Amazon Web Services account ID to add as an Firewall Manager administrator account. The account must be a member of the organization that was onboarded to Firewall Manager by [AssociateAdminAccount]. For more information about Organizations, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts.html}Managing the Amazon Web Services Accounts in Your Organization}.\n"]}
[@@ocaml.doc ""]
type nonrec protocols_list_data_summary =
  {
  protocols_list: string list option
    [@ocaml.doc
      "An array of protocols in the Firewall Manager protocols list.\n"];
  list_name: string option
    [@ocaml.doc "The name of the specified protocols list.\n"];
  list_id: string option
    [@ocaml.doc "The ID of the specified protocols list.\n"];
  list_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the specified protocols list.\n"]}
[@@ocaml.doc "Details of the Firewall Manager protocols list.\n"]
type nonrec policy_summary =
  {
  policy_status: customer_policy_status option
    [@ocaml.doc
      "Indicates whether the policy is in or out of an admin's policy or Region scope.\n\n {ul\n       {-   [ACTIVE] - The administrator can manage and delete the policy.\n           \n            }\n       {-   [OUT_OF_ADMIN_SCOPE] - The administrator can view the policy, but they can't edit or delete the policy. Existing policy protections stay in place. Any new resources that come into scope of the policy won't be protected.\n           \n            }\n       }\n  "];
  delete_unused_fm_managed_resources: bool option
    [@ocaml.doc
      "Indicates whether Firewall Manager should automatically remove protections from resources that leave the policy scope and clean up resources that Firewall Manager is managing for accounts when those accounts leave policy scope. For example, Firewall Manager will disassociate a Firewall Manager managed web ACL from a protected customer resource when the customer resource leaves policy scope. \n\n By default, Firewall Manager doesn't remove protections or delete Firewall Manager managed resources. \n \n  This option is not available for Shield Advanced or WAF Classic policies.\n  "];
  remediation_enabled: bool option
    [@ocaml.doc
      "Indicates if the policy should be automatically applied to new resources.\n"];
  security_service_type: security_service_type option
    [@ocaml.doc
      "The service that the policy is using to protect the resources. This specifies the type of policy that is created, either an WAF policy, a Shield Advanced policy, or a security group policy.\n"];
  resource_type: string option
    [@ocaml.doc
      "The type of resource protected by or in scope of the policy. This is in the format shown in the {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon Web Services Resource Types Reference}. \n"];
  policy_name: string option
    [@ocaml.doc "The name of the specified policy.\n"];
  policy_id: string option [@ocaml.doc "The ID of the specified policy.\n"];
  policy_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the specified policy.\n"]}
[@@ocaml.doc "Details of the Firewall Manager policy. \n"]
type nonrec policy_compliance_status_type =
  | NonCompliant [@ocaml.doc ""]
  | Compliant [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec evaluation_result =
  {
  evaluation_limit_exceeded: bool option
    [@ocaml.doc
      "Indicates that over 100 resources are noncompliant with the Firewall Manager policy.\n"];
  violator_count: int option
    [@ocaml.doc
      "The number of resources that are noncompliant with the specified policy. For WAF and Shield Advanced policies, a resource is considered noncompliant if it is not associated with the policy. For security group policies, a resource is considered noncompliant if it doesn't comply with the rules of the policy and remediation is disabled or not possible.\n"];
  compliance_status: policy_compliance_status_type option
    [@ocaml.doc
      "Describes an Amazon Web Services account's compliance with the Firewall Manager policy.\n"]}
[@@ocaml.doc
  "Describes the compliance status for the account. An account is considered noncompliant if it includes resources that are not protected by the specified policy or that don't comply with the policy.\n"]
type nonrec dependent_service_name =
  | AWSVirtualPrivateCloud [@ocaml.doc ""]
  | AWSShieldAdvanced [@ocaml.doc ""]
  | AWSWAF [@ocaml.doc ""]
  | AWSConfig [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec issue_info_map = (dependent_service_name * string) list[@@ocaml.doc
                                                                    ""]
type nonrec policy_compliance_status =
  {
  issue_info_map: issue_info_map option
    [@ocaml.doc
      "Details about problems with dependent services, such as WAF or Config, and the error message received that indicates the problem with the service.\n"];
  last_updated: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Timestamp of the last update to the [EvaluationResult] objects.\n"];
  evaluation_results: evaluation_result list option
    [@ocaml.doc "An array of [EvaluationResult] objects.\n"];
  member_account: string option [@ocaml.doc "The member account ID.\n"];
  policy_name: string option
    [@ocaml.doc "The name of the Firewall Manager policy.\n"];
  policy_id: string option
    [@ocaml.doc "The ID of the Firewall Manager policy.\n"];
  policy_owner: string option
    [@ocaml.doc
      "The Amazon Web Services account that created the Firewall Manager policy.\n"]}
[@@ocaml.doc
  "Indicates whether the account is compliant with the specified policy. An account is considered noncompliant if it includes resources that are not protected by the policy, for WAF and Shield Advanced policies, or that are noncompliant with the policy, for security group policies.\n"]
type nonrec compliance_violator_metadata = (string * string) list[@@ocaml.doc
                                                                   ""]
type nonrec compliance_violator =
  {
  metadata: compliance_violator_metadata option
    [@ocaml.doc
      "Metadata about the resource that doesn't comply with the policy scope.\n"];
  resource_type: string option
    [@ocaml.doc
      "The resource type. This is in the format shown in the {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon Web Services Resource Types Reference}. For example: [AWS::ElasticLoadBalancingV2::LoadBalancer], [AWS::CloudFront::Distribution], or [AWS::NetworkFirewall::FirewallPolicy].\n"];
  violation_reason: violation_reason option
    [@ocaml.doc
      "The reason that the resource is not protected by the policy.\n"];
  resource_id: string option [@ocaml.doc "The resource ID.\n"]}[@@ocaml.doc
                                                                 "Details of the resource that is not protected by the policy.\n"]
type nonrec policy_compliance_detail =
  {
  issue_info_map: issue_info_map option
    [@ocaml.doc
      "Details about problems with dependent services, such as WAF or Config, and the error message received that indicates the problem with the service.\n"];
  expired_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A timestamp that indicates when the returned information should be considered out of date.\n"];
  evaluation_limit_exceeded: bool option
    [@ocaml.doc
      "Indicates if over 100 resources are noncompliant with the Firewall Manager policy.\n"];
  violators: compliance_violator list option
    [@ocaml.doc
      "An array of resources that aren't protected by the WAF or Shield Advanced policy or that aren't in compliance with the security group policy.\n"];
  member_account: string option
    [@ocaml.doc "The Amazon Web Services account ID.\n"];
  policy_id: string option
    [@ocaml.doc "The ID of the Firewall Manager policy.\n"];
  policy_owner: string option
    [@ocaml.doc
      "The Amazon Web Services account that created the Firewall Manager policy.\n"]}
[@@ocaml.doc
  "Describes the noncompliant resources in a member account for a specific Firewall Manager policy. A maximum of 100 entries are displayed. If more than 100 resources are noncompliant, [EvaluationLimitExceeded] is set to [True].\n"]
type nonrec organization_status =
  | OffboardingComplete [@ocaml.doc ""]
  | Offboarding [@ocaml.doc ""]
  | OnboardingComplete [@ocaml.doc ""]
  | Onboarding [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec marketplace_subscription_onboarding_status =
  | COMPLETE [@ocaml.doc ""]
  | NOT_COMPLETE [@ocaml.doc ""]
  | NO_SUBSCRIPTION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec list_third_party_firewall_firewall_policies_response =
  {
  next_token: string option
    [@ocaml.doc
      "The value that you will use for [NextToken] in the next [ListThirdPartyFirewallFirewallPolicies] request.\n"];
  third_party_firewall_firewall_policies:
    third_party_firewall_firewall_policy list option
    [@ocaml.doc
      "A list that contains one [ThirdPartyFirewallFirewallPolicies] element for each third-party firewall policies that the specified third-party firewall vendor is associated with. Each [ThirdPartyFirewallFirewallPolicies] element contains the firewall policy name and ID.\n"]}
[@@ocaml.doc ""]
type nonrec list_third_party_firewall_firewall_policies_request =
  {
  max_results: int
    [@ocaml.doc
      "The maximum number of third-party firewall policies that you want Firewall Manager to return. If the specified third-party firewall vendor is associated with more than [MaxResults] firewall policies, the response includes a [NextToken] element. [NextToken] contains an encrypted token that identifies the first third-party firewall policies that Firewall Manager will return if you submit another request.\n"];
  next_token: string option
    [@ocaml.doc
      "If the previous response included a [NextToken] element, the specified third-party firewall vendor is associated with more third-party firewall policies. To get more third-party firewall policies, submit another [ListThirdPartyFirewallFirewallPoliciesRequest] request.\n\n  For the value of [NextToken], specify the value of [NextToken] from the previous response. If the previous response didn't include a [NextToken] element, there are no more third-party firewall policies to get. \n "];
  third_party_firewall: third_party_firewall
    [@ocaml.doc "The name of the third-party firewall vendor.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec list_tags_for_resource_response =
  {
  tag_list: tag list option
    [@ocaml.doc "The tags associated with the resource.\n"]}[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource to return tags for. The Firewall Manager resources that support tagging are policies, applications lists, and protocols lists. \n"]}
[@@ocaml.doc ""]
type nonrec list_resource_sets_response =
  {
  next_token: string option
    [@ocaml.doc
      "When you request a list of objects with a [MaxResults] setting, if the number of objects that are still available for retrieval exceeds the maximum you requested, Firewall Manager returns a [NextToken] value in the response. To retrieve the next batch of objects, use the token returned from the prior request in your next request.\n"];
  resource_sets: resource_set_summary list option
    [@ocaml.doc "An array of [ResourceSetSummary] objects.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec list_resource_sets_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of objects that you want Firewall Manager to return for this request. If more objects are available, in the response, Firewall Manager provides a [NextToken] value that you can use in a subsequent call to get the next batch of objects.\n"];
  next_token: string option
    [@ocaml.doc
      "When you request a list of objects with a [MaxResults] setting, if the number of objects that are still available for retrieval exceeds the maximum you requested, Firewall Manager returns a [NextToken] value in the response. To retrieve the next batch of objects, use the token returned from the prior request in your next request.\n"]}
[@@ocaml.doc ""]
type nonrec list_resource_set_resources_response =
  {
  next_token: string option
    [@ocaml.doc
      "When you request a list of objects with a [MaxResults] setting, if the number of objects that are still available for retrieval exceeds the maximum you requested, Firewall Manager returns a [NextToken] value in the response. To retrieve the next batch of objects, use the token returned from the prior request in your next request.\n"];
  items: resource list
    [@ocaml.doc
      "An array of the associated resources' uniform resource identifiers (URI).\n"]}
[@@ocaml.doc ""]
type nonrec list_resource_set_resources_request =
  {
  next_token: string option
    [@ocaml.doc
      "When you request a list of objects with a [MaxResults] setting, if the number of objects that are still available for retrieval exceeds the maximum you requested, Firewall Manager returns a [NextToken] value in the response. To retrieve the next batch of objects, use the token returned from the prior request in your next request.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of objects that you want Firewall Manager to return for this request. If more objects are available, in the response, Firewall Manager provides a [NextToken] value that you can use in a subsequent call to get the next batch of objects.\n"];
  identifier: string
    [@ocaml.doc
      "A unique identifier for the resource set, used in a request to refer to the resource set.\n"]}
[@@ocaml.doc ""]
type nonrec list_protocols_lists_response =
  {
  next_token: string option
    [@ocaml.doc
      "If you specify a value for [MaxResults] in your list request, and you have more objects than the maximum, Firewall Manager returns this token in the response. You can use this token in subsequent requests to retrieve the next batch of objects.\n"];
  protocols_lists: protocols_list_data_summary list option
    [@ocaml.doc "An array of [ProtocolsListDataSummary] objects.\n"]}
[@@ocaml.doc ""]
type nonrec list_protocols_lists_request =
  {
  max_results: int
    [@ocaml.doc
      "The maximum number of objects that you want Firewall Manager to return for this request. If more objects are available, in the response, Firewall Manager provides a [NextToken] value that you can use in a subsequent call to get the next batch of objects.\n\n If you don't specify this, Firewall Manager returns all available objects.\n "];
  next_token: string option
    [@ocaml.doc
      "If you specify a value for [MaxResults] in your list request, and you have more objects than the maximum, Firewall Manager returns this token in the response. For all but the first request, you provide the token returned by the prior request in the request parameters, to retrieve the next batch of objects.\n"];
  default_lists: bool option
    [@ocaml.doc
      "Specifies whether the lists to retrieve are default lists owned by Firewall Manager.\n"]}
[@@ocaml.doc ""]
type nonrec list_policies_response =
  {
  next_token: string option
    [@ocaml.doc
      "If you have more [PolicySummary] objects than the number that you specified for [MaxResults] in the request, the response includes a [NextToken] value. To list more [PolicySummary] objects, submit another [ListPolicies] request, and specify the [NextToken] value from the response in the [NextToken] value in the next request.\n"];
  policy_list: policy_summary list option
    [@ocaml.doc "An array of [PolicySummary] objects.\n"]}[@@ocaml.doc ""]
type nonrec list_policies_request =
  {
  max_results: int option
    [@ocaml.doc
      "Specifies the number of [PolicySummary] objects that you want Firewall Manager to return for this request. If you have more [PolicySummary] objects than the number that you specify for [MaxResults], the response includes a [NextToken] value that you can use to get another batch of [PolicySummary] objects.\n"];
  next_token: string option
    [@ocaml.doc
      "If you specify a value for [MaxResults] and you have more [PolicySummary] objects than the number that you specify for [MaxResults], Firewall Manager returns a [NextToken] value in the response that allows you to list another group of [PolicySummary] objects. For the second and subsequent [ListPolicies] requests, specify the value of [NextToken] from the previous response to get information about another batch of [PolicySummary] objects.\n"]}
[@@ocaml.doc ""]
type nonrec list_member_accounts_response =
  {
  next_token: string option
    [@ocaml.doc
      "If you have more member account IDs than the number that you specified for [MaxResults] in the request, the response includes a [NextToken] value. To list more IDs, submit another [ListMemberAccounts] request, and specify the [NextToken] value from the response in the [NextToken] value in the next request.\n"];
  member_accounts: string list option
    [@ocaml.doc "An array of account IDs.\n"]}[@@ocaml.doc ""]
type nonrec list_member_accounts_request =
  {
  max_results: int option
    [@ocaml.doc
      "Specifies the number of member account IDs that you want Firewall Manager to return for this request. If you have more IDs than the number that you specify for [MaxResults], the response includes a [NextToken] value that you can use to get another batch of member account IDs.\n"];
  next_token: string option
    [@ocaml.doc
      "If you specify a value for [MaxResults] and you have more account IDs than the number that you specify for [MaxResults], Firewall Manager returns a [NextToken] value in the response that allows you to list another group of IDs. For the second and subsequent [ListMemberAccountsRequest] requests, specify the value of [NextToken] from the previous response to get information about another batch of member account IDs.\n"]}
[@@ocaml.doc ""]
type nonrec discovered_resource =
  {
  name: string option [@ocaml.doc "The name of the discovered resource.\n"];
  type_: string option [@ocaml.doc "The type of the discovered resource.\n"];
  account_id: string option
    [@ocaml.doc
      "The Amazon Web Services account ID associated with the discovered resource.\n"];
  ur_i: string option
    [@ocaml.doc
      "The universal resource identifier (URI) of the discovered resource.\n"]}
[@@ocaml.doc
  "A resource in the organization that's available to be associated with a Firewall Manager resource set.\n"]
type nonrec list_discovered_resources_response =
  {
  next_token: string option
    [@ocaml.doc
      "When you request a list of objects with a [MaxResults] setting, if the number of objects that are still available for retrieval exceeds the maximum you requested, Firewall Manager returns a [NextToken] value in the response. To retrieve the next batch of objects, use the token returned from the prior request in your next request.\n"];
  items: discovered_resource list option
    [@ocaml.doc "Details of the resources that were discovered.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec list_discovered_resources_request =
  {
  next_token: string option
    [@ocaml.doc
      "When you request a list of objects with a [MaxResults] setting, if the number of objects that are still available for retrieval exceeds the maximum you requested, Firewall Manager returns a [NextToken] value in the response. To retrieve the next batch of objects, use the token returned from the prior request in your next request.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of objects that you want Firewall Manager to return for this request. If more objects are available, in the response, Firewall Manager provides a [NextToken] value that you can use in a subsequent call to get the next batch of objects.\n"];
  resource_type: string [@ocaml.doc "The type of resources to discover.\n"];
  member_account_ids: string list
    [@ocaml.doc
      "The Amazon Web Services account IDs to discover resources in. Only one account is supported per request. The account must be a member of your organization.\n"]}
[@@ocaml.doc ""]
type nonrec list_compliance_status_response =
  {
  next_token: string option
    [@ocaml.doc
      "If you have more [PolicyComplianceStatus] objects than the number that you specified for [MaxResults] in the request, the response includes a [NextToken] value. To list more [PolicyComplianceStatus] objects, submit another [ListComplianceStatus] request, and specify the [NextToken] value from the response in the [NextToken] value in the next request.\n"];
  policy_compliance_status_list: policy_compliance_status list option
    [@ocaml.doc "An array of [PolicyComplianceStatus] objects.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec list_compliance_status_request =
  {
  max_results: int option
    [@ocaml.doc
      "Specifies the number of [PolicyComplianceStatus] objects that you want Firewall Manager to return for this request. If you have more [PolicyComplianceStatus] objects than the number that you specify for [MaxResults], the response includes a [NextToken] value that you can use to get another batch of [PolicyComplianceStatus] objects.\n"];
  next_token: string option
    [@ocaml.doc
      "If you specify a value for [MaxResults] and you have more [PolicyComplianceStatus] objects than the number that you specify for [MaxResults], Firewall Manager returns a [NextToken] value in the response that allows you to list another group of [PolicyComplianceStatus] objects. For the second and subsequent [ListComplianceStatus] requests, specify the value of [NextToken] from the previous response to get information about another batch of [PolicyComplianceStatus] objects.\n"];
  policy_id: string
    [@ocaml.doc
      "The ID of the Firewall Manager policy that you want the details for.\n"]}
[@@ocaml.doc ""]
type nonrec apps_list_data_summary =
  {
  apps_list: app list option
    [@ocaml.doc
      "An array of [App] objects in the Firewall Manager applications list.\n"];
  list_name: string option
    [@ocaml.doc "The name of the applications list.\n"];
  list_id: string option [@ocaml.doc "The ID of the applications list.\n"];
  list_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the applications list.\n"]}
[@@ocaml.doc "Details of the Firewall Manager applications list.\n"]
type nonrec list_apps_lists_response =
  {
  next_token: string option
    [@ocaml.doc
      "If you specify a value for [MaxResults] in your list request, and you have more objects than the maximum, Firewall Manager returns this token in the response. You can use this token in subsequent requests to retrieve the next batch of objects.\n"];
  apps_lists: apps_list_data_summary list option
    [@ocaml.doc "An array of [AppsListDataSummary] objects.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec list_apps_lists_request =
  {
  max_results: int
    [@ocaml.doc
      "The maximum number of objects that you want Firewall Manager to return for this request. If more objects are available, in the response, Firewall Manager provides a [NextToken] value that you can use in a subsequent call to get the next batch of objects.\n\n If you don't specify this, Firewall Manager returns all available objects.\n "];
  next_token: string option
    [@ocaml.doc
      "If you specify a value for [MaxResults] in your list request, and you have more objects than the maximum, Firewall Manager returns this token in the response. For all but the first request, you provide the token returned by the prior request in the request parameters, to retrieve the next batch of objects.\n"];
  default_lists: bool option
    [@ocaml.doc
      "Specifies whether the lists to retrieve are default lists owned by Firewall Manager.\n"]}
[@@ocaml.doc ""]
type nonrec list_admins_managing_account_response =
  {
  next_token: string option
    [@ocaml.doc
      "When you request a list of objects with a [MaxResults] setting, if the number of objects that are still available for retrieval exceeds the maximum you requested, Firewall Manager returns a [NextToken] value in the response. To retrieve the next batch of objects, use the token returned from the prior request in your next request.\n"];
  admin_accounts: string list option
    [@ocaml.doc
      "The list of accounts who manage member accounts within their [AdminScope].\n"]}
[@@ocaml.doc ""]
type nonrec list_admins_managing_account_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of objects that you want Firewall Manager to return for this request. If more objects are available, in the response, Firewall Manager provides a [NextToken] value that you can use in a subsequent call to get the next batch of objects.\n"];
  next_token: string option
    [@ocaml.doc
      "When you request a list of objects with a [MaxResults] setting, if the number of objects that are still available for retrieval exceeds the maximum you requested, Firewall Manager returns a [NextToken] value in the response. To retrieve the next batch of objects, use the token returned from the prior request in your next request.\n"]}
[@@ocaml.doc ""]
type nonrec admin_account_summary =
  {
  status: organization_status option
    [@ocaml.doc
      "The current status of the request to onboard a member account as an Firewall Manager administrator.\n\n {ul\n       {-   [ONBOARDING] - The account is onboarding to Firewall Manager as an administrator.\n           \n            }\n       {-   [ONBOARDING_COMPLETE] - Firewall Manager The account is onboarded to Firewall Manager as an administrator, and can perform actions on the resources defined in their [AdminScope].\n           \n            }\n       {-   [OFFBOARDING] - The account is being removed as an Firewall Manager administrator.\n           \n            }\n       {-   [OFFBOARDING_COMPLETE] - The account has been removed as an Firewall Manager administrator.\n           \n            }\n       }\n  "];
  default_admin: bool option
    [@ocaml.doc
      "A boolean value that indicates if the administrator is the default administrator. If true, then this is the default administrator account. The default administrator can manage third-party firewalls and has full administrative scope. There is only one default administrator account per organization. For information about Firewall Manager default administrator accounts, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/fms-administrators.html}Managing Firewall Manager administrators} in the {i Firewall Manager Developer Guide}.\n"];
  admin_account: string option
    [@ocaml.doc
      "The Amazon Web Services account ID of the Firewall Manager administrator's account.\n"]}
[@@ocaml.doc
  "Contains high level information about the Firewall Manager administrator account.\n"]
type nonrec list_admin_accounts_for_organization_response =
  {
  next_token: string option
    [@ocaml.doc
      "When you request a list of objects with a [MaxResults] setting, if the number of objects that are still available for retrieval exceeds the maximum you requested, Firewall Manager returns a [NextToken] value in the response. To retrieve the next batch of objects, use the token returned from the prior request in your next request.\n"];
  admin_accounts: admin_account_summary list option
    [@ocaml.doc
      "A list of Firewall Manager administrator accounts within the organization that were onboarded as administrators by [AssociateAdminAccount] or [PutAdminAccount].\n"]}
[@@ocaml.doc ""]
type nonrec list_admin_accounts_for_organization_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of objects that you want Firewall Manager to return for this request. If more objects are available, in the response, Firewall Manager provides a [NextToken] value that you can use in a subsequent call to get the next batch of objects.\n"];
  next_token: string option
    [@ocaml.doc
      "When you request a list of objects with a [MaxResults] setting, if the number of objects that are still available for retrieval exceeds the maximum you requested, Firewall Manager returns a [NextToken] value in the response. To retrieve the next batch of objects, use the token returned from the prior request in your next request.\n"]}
[@@ocaml.doc ""]
type nonrec get_violation_details_response =
  {
  violation_detail: violation_detail option
    [@ocaml.doc "Violation detail for a resource.\n"]}[@@ocaml.doc ""]
type nonrec get_violation_details_request =
  {
  resource_type: string
    [@ocaml.doc
      "The resource type. This is in the format shown in the {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon Web Services Resource Types Reference}. Supported resource types are: [AWS::EC2::Instance], [AWS::EC2::NetworkInterface], [AWS::EC2::SecurityGroup], [AWS::NetworkFirewall::FirewallPolicy], and [AWS::EC2::Subnet]. \n"];
  resource_id: string
    [@ocaml.doc "The ID of the resource that has violations.\n"];
  member_account: string
    [@ocaml.doc
      "The Amazon Web Services account ID that you want the details for.\n"];
  policy_id: string
    [@ocaml.doc
      "The ID of the Firewall Manager policy that you want the details for. You can get violation details for the following policy types:\n\n {ul\n       {-  DNS Firewall\n           \n            }\n       {-  Imported Network Firewall\n           \n            }\n       {-  Network Firewall\n           \n            }\n       {-  Security group content audit\n           \n            }\n       {-  Network ACL\n           \n            }\n       {-  Third-party firewall\n           \n            }\n       }\n  "]}
[@@ocaml.doc ""]
type nonrec get_third_party_firewall_association_status_response =
  {
  marketplace_onboarding_status:
    marketplace_subscription_onboarding_status option
    [@ocaml.doc
      "The status for subscribing to the third-party firewall vendor in the Amazon Web Services Marketplace.\n\n {ul\n       {-   [NO_SUBSCRIPTION] - The Firewall Manager policy administrator isn't subscribed to the third-party firewall service in the Amazon Web Services Marketplace.\n           \n            }\n       {-   [NOT_COMPLETE] - The Firewall Manager policy administrator is in the process of subscribing to the third-party firewall service in the Amazon Web Services Marketplace, but doesn't yet have an active subscription.\n           \n            }\n       {-   [COMPLETE] - The Firewall Manager policy administrator has an active subscription to the third-party firewall service in the Amazon Web Services Marketplace.\n           \n            }\n       }\n  "];
  third_party_firewall_status: third_party_firewall_association_status option
    [@ocaml.doc
      "The current status for setting a Firewall Manager policy administrators account as an administrator of the third-party firewall tenant.\n\n {ul\n       {-   [ONBOARDING] - The Firewall Manager policy administrator is being designated as a tenant administrator.\n           \n            }\n       {-   [ONBOARD_COMPLETE] - The Firewall Manager policy administrator is designated as a tenant administrator.\n           \n            }\n       {-   [OFFBOARDING] - The Firewall Manager policy administrator is being removed as a tenant administrator.\n           \n            }\n       {-   [OFFBOARD_COMPLETE] - The Firewall Manager policy administrator has been removed as a tenant administrator.\n           \n            }\n       {-   [NOT_EXIST] - The Firewall Manager policy administrator doesn't exist as a tenant administrator.\n           \n            }\n       }\n  "]}
[@@ocaml.doc ""]
type nonrec get_third_party_firewall_association_status_request =
  {
  third_party_firewall: third_party_firewall
    [@ocaml.doc "The name of the third-party firewall vendor.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec get_resource_set_response =
  {
  resource_set_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the resource set.\n"];
  resource_set: resource_set
    [@ocaml.doc "Information about the specified resource set.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec get_resource_set_request =
  {
  identifier: string
    [@ocaml.doc
      "A unique identifier for the resource set, used in a request to refer to the resource set.\n"]}
[@@ocaml.doc ""]
type nonrec get_protocols_list_response =
  {
  protocols_list_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the specified protocols list.\n"];
  protocols_list: protocols_list_data option
    [@ocaml.doc
      "Information about the specified Firewall Manager protocols list.\n"]}
[@@ocaml.doc ""]
type nonrec get_protocols_list_request =
  {
  default_list: bool option
    [@ocaml.doc
      "Specifies whether the list to retrieve is a default list owned by Firewall Manager.\n"];
  list_id: string
    [@ocaml.doc
      "The ID of the Firewall Manager protocols list that you want the details for.\n"]}
[@@ocaml.doc ""]
type nonrec get_protection_status_response =
  {
  next_token: string option
    [@ocaml.doc
      "If you have more objects than the number that you specified for [MaxResults] in the request, the response includes a [NextToken] value. To list more objects, submit another [GetProtectionStatus] request, and specify the [NextToken] value from the response in the [NextToken] value in the next request.\n\n Amazon Web Services SDKs provide auto-pagination that identify [NextToken] in a response and make subsequent request calls automatically on your behalf. However, this feature is not supported by [GetProtectionStatus]. You must submit subsequent requests with [NextToken] using your own processes. \n "];
  data: string option
    [@ocaml.doc
      "Details about the attack, including the following:\n\n {ul\n       {-  Attack type\n           \n            }\n       {-  Account ID\n           \n            }\n       {-  ARN of the resource attacked\n           \n            }\n       {-  Start time of the attack\n           \n            }\n       {-  End time of the attack (ongoing attacks will not have an end time)\n           \n            }\n       }\n   The details are in JSON format. \n   "];
  service_type: security_service_type option
    [@ocaml.doc
      "The service type that is protected by the policy. Currently, this is always [SHIELD_ADVANCED].\n"];
  admin_account_id: string option
    [@ocaml.doc
      "The ID of the Firewall Manager administrator account for this policy.\n"]}
[@@ocaml.doc ""]
type nonrec get_protection_status_request =
  {
  max_results: int option
    [@ocaml.doc
      "Specifies the number of objects that you want Firewall Manager to return for this request. If you have more objects than the number that you specify for [MaxResults], the response includes a [NextToken] value that you can use to get another batch of objects.\n"];
  next_token: string option
    [@ocaml.doc
      "If you specify a value for [MaxResults] and you have more objects than the number that you specify for [MaxResults], Firewall Manager returns a [NextToken] value in the response, which you can use to retrieve another group of objects. For the second and subsequent [GetProtectionStatus] requests, specify the value of [NextToken] from the previous response to get information about another batch of objects.\n"];
  end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The end of the time period to query for the attacks. This is a [timestamp] type. The request syntax listing indicates a [number] type because the default used by Firewall Manager is Unix time in seconds. However, any valid [timestamp] format is allowed.\n"];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The start of the time period to query for the attacks. This is a [timestamp] type. The request syntax listing indicates a [number] type because the default used by Firewall Manager is Unix time in seconds. However, any valid [timestamp] format is allowed.\n"];
  member_account_id: string option
    [@ocaml.doc
      "The Amazon Web Services account that is in scope of the policy that you want to get the details for.\n"];
  policy_id: string
    [@ocaml.doc
      "The ID of the policy for which you want to get the attack information.\n"]}
[@@ocaml.doc ""]
type nonrec get_policy_response =
  {
  policy_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the specified policy.\n"];
  policy: policy option
    [@ocaml.doc "Information about the specified Firewall Manager policy.\n"]}
[@@ocaml.doc ""]
type nonrec get_policy_request =
  {
  policy_id: string
    [@ocaml.doc
      "The ID of the Firewall Manager policy that you want the details for.\n"]}
[@@ocaml.doc ""]
type nonrec get_notification_channel_response =
  {
  sns_role_name: string option
    [@ocaml.doc
      "The IAM role that is used by Firewall Manager to record activity to SNS.\n"];
  sns_topic_arn: string option
    [@ocaml.doc "The SNS topic that records Firewall Manager activity. \n"]}
[@@ocaml.doc ""]
type nonrec get_compliance_detail_response =
  {
  policy_compliance_detail: policy_compliance_detail option
    [@ocaml.doc
      "Information about the resources and the policy that you specified in the [GetComplianceDetail] request.\n"]}
[@@ocaml.doc ""]
type nonrec get_compliance_detail_request =
  {
  member_account: string
    [@ocaml.doc
      "The Amazon Web Services account that owns the resources that you want to get the details for.\n"];
  policy_id: string
    [@ocaml.doc
      "The ID of the policy that you want to get the details for. [PolicyId] is returned by [PutPolicy] and by [ListPolicies].\n"]}
[@@ocaml.doc ""]
type nonrec get_apps_list_response =
  {
  apps_list_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the applications list.\n"];
  apps_list: apps_list_data option
    [@ocaml.doc
      "Information about the specified Firewall Manager applications list.\n"]}
[@@ocaml.doc ""]
type nonrec get_apps_list_request =
  {
  default_list: bool option
    [@ocaml.doc
      "Specifies whether the list to retrieve is a default list owned by Firewall Manager.\n"];
  list_id: string
    [@ocaml.doc
      "The ID of the Firewall Manager applications list that you want the details for.\n"]}
[@@ocaml.doc ""]
type nonrec get_admin_scope_response =
  {
  status: organization_status option
    [@ocaml.doc
      "The current status of the request to onboard a member account as an Firewall Manager administrator.\n\n {ul\n       {-   [ONBOARDING] - The account is onboarding to Firewall Manager as an administrator.\n           \n            }\n       {-   [ONBOARDING_COMPLETE] - Firewall Manager The account is onboarded to Firewall Manager as an administrator, and can perform actions on the resources defined in their [AdminScope].\n           \n            }\n       {-   [OFFBOARDING] - The account is being removed as an Firewall Manager administrator.\n           \n            }\n       {-   [OFFBOARDING_COMPLETE] - The account has been removed as an Firewall Manager administrator.\n           \n            }\n       }\n  "];
  admin_scope: admin_scope option
    [@ocaml.doc
      "Contains details about the administrative scope of the requested account.\n"]}
[@@ocaml.doc ""]
type nonrec get_admin_scope_request =
  {
  admin_account: string
    [@ocaml.doc
      "The administrator account that you want to get the details for.\n"]}
[@@ocaml.doc ""]
type nonrec account_role_status =
  | Deleted [@ocaml.doc ""]
  | Deleting [@ocaml.doc ""]
  | PendingDeletion [@ocaml.doc ""]
  | Creating [@ocaml.doc ""]
  | Ready [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec get_admin_account_response =
  {
  role_status: account_role_status option
    [@ocaml.doc
      "The status of the account that you set as the Firewall Manager default administrator.\n"];
  admin_account: string option
    [@ocaml.doc
      "The account that is set as the Firewall Manager default administrator.\n"]}
[@@ocaml.doc ""]
type nonrec failed_item_reason =
  | NotValidAccountId [@ocaml.doc ""]
  | NotValidResourceType [@ocaml.doc ""]
  | NotValidService [@ocaml.doc ""]
  | NotValidRegion [@ocaml.doc ""]
  | NotValidPartition [@ocaml.doc ""]
  | NotValidArn [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec failed_item =
  {
  reason: failed_item_reason option
    [@ocaml.doc
      "The reason the resource's association could not be updated.\n"];
  ur_i: string option
    [@ocaml.doc
      "The univeral resource indicator (URI) of the resource that failed.\n"]}
[@@ocaml.doc
  "Details of a resource that failed when trying to update it's association to a resource set.\n"]
type nonrec disassociate_third_party_firewall_response =
  {
  third_party_firewall_status: third_party_firewall_association_status option
    [@ocaml.doc
      "The current status for the disassociation of a Firewall Manager administrators account with a third-party firewall.\n"]}
[@@ocaml.doc ""]
type nonrec disassociate_third_party_firewall_request =
  {
  third_party_firewall: third_party_firewall
    [@ocaml.doc "The name of the third-party firewall vendor.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec delete_resource_set_request =
  {
  identifier: string
    [@ocaml.doc
      "A unique identifier for the resource set, used in a request to refer to the resource set.\n"]}
[@@ocaml.doc ""]
type nonrec delete_protocols_list_request =
  {
  list_id: string
    [@ocaml.doc
      "The ID of the protocols list that you want to delete. You can retrieve this ID from [PutProtocolsList], [ListProtocolsLists], and [GetProtocolsLost].\n"]}
[@@ocaml.doc ""]
type nonrec delete_policy_request =
  {
  delete_all_policy_resources: bool option
    [@ocaml.doc
      "If [True], the request performs cleanup according to the policy type. \n\n For WAF and Shield Advanced policies, the cleanup does the following:\n \n  {ul\n        {-  Deletes rule groups created by Firewall Manager\n            \n             }\n        {-  Removes web ACLs from in-scope resources\n            \n             }\n        {-  Deletes web ACLs that contain no rules or rule groups\n            \n             }\n        }\n   For security group policies, the cleanup does the following for each security group in the policy:\n   \n    {ul\n          {-  Disassociates the security group from in-scope resources \n              \n               }\n          {-  Deletes the security group if it was created through Firewall Manager and if it's no longer associated with any resources through another policy\n              \n               }\n          }\n    For security group common policies, even if set to [False], Firewall Manager deletes all security groups created by Firewall Manager that aren't associated with any other resources through another policy.\n    \n      After the cleanup, in-scope resources are no longer protected by web ACLs in this policy. Protection of out-of-scope resources remains unchanged. Scope is determined by tags that you create and accounts that you associate with the policy. When creating the policy, if you specify that only resources in specific accounts or with specific tags are in scope of the policy, those accounts and resources are handled by the policy. All others are out of scope. If you don't specify tags or accounts, all resources are in scope. \n      "];
  policy_id: string
    [@ocaml.doc
      "The ID of the policy that you want to delete. You can retrieve this ID from [PutPolicy] and [ListPolicies].\n"]}
[@@ocaml.doc ""]
type nonrec delete_apps_list_request =
  {
  list_id: string
    [@ocaml.doc
      "The ID of the applications list that you want to delete. You can retrieve this ID from [PutAppsList], [ListAppsLists], and [GetAppsList].\n"]}
[@@ocaml.doc ""]
type nonrec batch_disassociate_resource_response =
  {
  failed_items: failed_item list
    [@ocaml.doc
      "The resources that failed to disassociate from the resource set.\n"];
  resource_set_identifier: string
    [@ocaml.doc
      "A unique identifier for the resource set, used in a request to refer to the resource set.\n"]}
[@@ocaml.doc ""]
type nonrec batch_disassociate_resource_request =
  {
  items: string list
    [@ocaml.doc
      "The uniform resource identifiers (URI) of resources that should be disassociated from the resource set. The URIs must be Amazon Resource Names (ARNs).\n"];
  resource_set_identifier: string
    [@ocaml.doc
      "A unique identifier for the resource set, used in a request to refer to the resource set.\n"]}
[@@ocaml.doc ""]
type nonrec batch_associate_resource_response =
  {
  failed_items: failed_item list
    [@ocaml.doc
      "The resources that failed to associate to the resource set.\n"];
  resource_set_identifier: string
    [@ocaml.doc
      "A unique identifier for the resource set, used in a request to refer to the resource set.\n"]}
[@@ocaml.doc ""]
type nonrec batch_associate_resource_request =
  {
  items: string list
    [@ocaml.doc
      "The uniform resource identifiers (URIs) of resources that should be associated to the resource set. The URIs must be Amazon Resource Names (ARNs).\n"];
  resource_set_identifier: string
    [@ocaml.doc
      "A unique identifier for the resource set, used in a request to refer to the resource set.\n"]}
[@@ocaml.doc ""]
type nonrec associate_third_party_firewall_response =
  {
  third_party_firewall_status: third_party_firewall_association_status option
    [@ocaml.doc
      "The current status for setting a Firewall Manager policy administrator's account as an administrator of the third-party firewall tenant.\n\n {ul\n       {-   [ONBOARDING] - The Firewall Manager policy administrator is being designated as a tenant administrator.\n           \n            }\n       {-   [ONBOARD_COMPLETE] - The Firewall Manager policy administrator is designated as a tenant administrator.\n           \n            }\n       {-   [OFFBOARDING] - The Firewall Manager policy administrator is being removed as a tenant administrator.\n           \n            }\n       {-   [OFFBOARD_COMPLETE] - The Firewall Manager policy administrator has been removed as a tenant administrator.\n           \n            }\n       {-   [NOT_EXIST] - The Firewall Manager policy administrator doesn't exist as a tenant administrator.\n           \n            }\n       }\n  "]}
[@@ocaml.doc ""]
type nonrec associate_third_party_firewall_request =
  {
  third_party_firewall: third_party_firewall
    [@ocaml.doc "The name of the third-party firewall vendor.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec associate_admin_account_request =
  {
  admin_account: string
    [@ocaml.doc
      "The Amazon Web Services account ID to associate with Firewall Manager as the Firewall Manager default administrator account. This account must be a member account of the organization in Organizations whose resources you want to protect. For more information about Organizations, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts.html}Managing the Amazon Web Services Accounts in Your Organization}. \n"]}
[@@ocaml.doc ""]