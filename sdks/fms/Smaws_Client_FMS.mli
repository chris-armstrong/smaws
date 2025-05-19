(** 
    FMS client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec violation_reason =
  | InvalidNetworkAclEntry 
  | FirewallSubnetMissingVPCEndpoint 
  | RouteHasOutOfScopeEndpoint 
  | ResourceMissingDnsFirewall 
  | BlackHoleRouteDetectedInFirewallSubnet 
  | BlackHoleRouteDetected 
  | InternetTrafficNotInspected 
  | MissingTargetGateway 
  | InvalidRouteConfiguration 
  | TrafficInspectionCrossesAZBoundary 
  | UnexpectedTargetGatewayRoutes 
  | UnexpectedFirewallRoutes 
  | FirewallSubnetMissingExpectedRoute 
  | InternetGatewayMissingExpectedRoute 
  | FirewallSubnetIsOutOfScope 
  | NetworkFirewallPolicyModified 
  | MissingExpectedRouteTable 
  | MissingFirewallSubnetInAZ 
  | MissingFirewall 
  | FMSCreatedSecurityGroupEdited 
  | SecurityGroupRedundant 
  | SecurityGroupUnused 
  | ResourceViolatesAuditSecurityGroup 
  | ResourceMissingSecurityGroup 
  | ResourceMissingWebaclOrShieldProtection 
  | ResourceMissingShieldProtection 
  | ResourceIncorrectWebAcl 
  | ResourceMissingWebAcl 
  | WebAclMissingRuleGroup [@@ocaml.doc ""]
type nonrec partial_match =
  {
  target_violation_reasons: string list option ;
  reference: string option }[@@ocaml.doc
                              "The reference rule that partially matches the [ViolationTarget] rule and violation reason.\n"]
type nonrec remediation_action_type =
  | Modify 
  | Remove [@@ocaml.doc ""]
type nonrec security_group_rule_description =
  {
  to_port: int option ;
  from_port: int option ;
  protocol: string option ;
  prefix_list_id: string option ;
  ipv6_range: string option ;
  ipv4_range: string option }[@@ocaml.doc
                               "Describes a set of permissions for a security group rule.\n"]
type nonrec security_group_remediation_action =
  {
  is_default_action: bool option ;
  remediation_result: security_group_rule_description option ;
  description: string option ;
  remediation_action_type: remediation_action_type option }[@@ocaml.doc
                                                             "Remediation option for the rule specified in the [ViolationTarget].\n"]
type nonrec aws_vpc_security_group_violation =
  {
  possible_security_group_remediation_actions:
    security_group_remediation_action list option ;
  partial_matches: partial_match list option ;
  violation_target_description: string option ;
  violation_target: string option }[@@ocaml.doc
                                     "Violation detail for the rule violation in a security group when compared to the primary security group of the Firewall Manager policy.\n"]
type nonrec aws_ec2_network_interface_violation =
  {
  violating_security_groups: string list option ;
  violation_target: string option }[@@ocaml.doc
                                     "Violation detail for network interfaces associated with an EC2 instance.\n"]
type nonrec aws_ec2_instance_violation =
  {
  aws_ec2_network_interface_violations:
    aws_ec2_network_interface_violation list option ;
  violation_target: string option }[@@ocaml.doc
                                     "Violation detail for an EC2 instance resource.\n"]
type nonrec network_firewall_missing_firewall_violation =
  {
  target_violation_reason: string option ;
  availability_zone: string option ;
  vp_c: string option ;
  violation_target: string option }[@@ocaml.doc
                                     "Violation detail for Network Firewall for a subnet that doesn't have a Firewall Manager managed firewall in its VPC. \n"]
type nonrec network_firewall_missing_subnet_violation =
  {
  target_violation_reason: string option ;
  availability_zone: string option ;
  vp_c: string option ;
  violation_target: string option }[@@ocaml.doc
                                     "Violation detail for Network Firewall for an Availability Zone that's missing the expected Firewall Manager managed subnet.\n"]
type nonrec network_firewall_missing_expected_rt_violation =
  {
  expected_route_table: string option ;
  current_route_table: string option ;
  availability_zone: string option ;
  vp_c: string option ;
  violation_target: string option }[@@ocaml.doc
                                     "Violation detail for Network Firewall for a subnet that's not associated to the expected Firewall Manager managed route table.\n"]
type nonrec stateless_rule_group =
  {
  priority: int option ;
  resource_id: string option ;
  rule_group_name: string option }[@@ocaml.doc
                                    "Network Firewall stateless rule group, used in a [NetworkFirewallPolicyDescription]. \n"]
type nonrec network_firewall_override_action =
  | DROP_TO_ALERT [@@ocaml.doc ""]
type nonrec network_firewall_stateful_rule_group_override =
  {
  action: network_firewall_override_action option }[@@ocaml.doc
                                                     "The setting that allows the policy owner to change the behavior of the rule group within a policy.\n"]
type nonrec stateful_rule_group =
  {
  override: network_firewall_stateful_rule_group_override option ;
  priority: int option ;
  resource_id: string option ;
  rule_group_name: string option }[@@ocaml.doc
                                    "Network Firewall stateful rule group, used in a [NetworkFirewallPolicyDescription]. \n"]
type nonrec rule_order =
  | DEFAULT_ACTION_ORDER 
  | STRICT_ORDER [@@ocaml.doc ""]
type nonrec stream_exception_policy =
  | FMS_IGNORE 
  | REJECT 
  | CONTINUE 
  | DROP [@@ocaml.doc ""]
type nonrec stateful_engine_options =
  {
  stream_exception_policy: stream_exception_policy option ;
  rule_order: rule_order option }[@@ocaml.doc
                                   "Configuration settings for the handling of the stateful rule groups in a Network Firewall firewall policy.\n"]
type nonrec network_firewall_policy_description =
  {
  stateful_engine_options: stateful_engine_options option ;
  stateful_default_actions: string list option ;
  stateful_rule_groups: stateful_rule_group list option ;
  stateless_custom_actions: string list option ;
  stateless_fragment_default_actions: string list option ;
  stateless_default_actions: string list option ;
  stateless_rule_groups: stateless_rule_group list option }[@@ocaml.doc
                                                             "The definition of the Network Firewall firewall policy.\n"]
type nonrec network_firewall_policy_modified_violation =
  {
  expected_policy_description: network_firewall_policy_description option ;
  current_policy_description: network_firewall_policy_description option ;
  violation_target: string option }[@@ocaml.doc
                                     "Violation detail for Network Firewall for a firewall policy that has a different [NetworkFirewallPolicyDescription] than is required by the Firewall Manager policy. \n"]
type nonrec destination_type =
  | PrefixList 
  | IPV6 
  | IPV4 [@@ocaml.doc ""]
type nonrec target_type =
  | TransitGateway 
  | EgressOnlyInternetGateway 
  | VPCPeeringConnection 
  | VPCEndpoint 
  | NetworkInterface 
  | NatGateway 
  | LocalGateway 
  | Instance 
  | CarrierGateway 
  | Gateway [@@ocaml.doc ""]
type nonrec route =
  {
  target: string option ;
  destination: string option ;
  target_type: target_type option ;
  destination_type: destination_type option }[@@ocaml.doc
                                               "Describes a route in a route table.\n"]
type nonrec expected_route =
  {
  route_table_id: string option ;
  allowed_targets: string list option ;
  contributing_subnets: string list option ;
  ip_v6_cidr: string option ;
  prefix_list_id: string option ;
  ip_v4_cidr: string option }[@@ocaml.doc
                               "Information about the expected route in the route table.\n"]
type nonrec network_firewall_internet_traffic_not_inspected_violation =
  {
  vpc_id: string option ;
  actual_internet_gateway_routes: route list option ;
  expected_internet_gateway_routes: expected_route list option ;
  current_internet_gateway_route_table: string option ;
  internet_gateway_id: string option ;
  actual_firewall_subnet_routes: route list option ;
  expected_firewall_subnet_routes: expected_route list option ;
  firewall_subnet_id: string option ;
  expected_firewall_endpoint: string option ;
  current_firewall_subnet_route_table: string option ;
  is_route_table_used_in_different_a_z: bool option ;
  violating_routes: route list option ;
  route_table_id: string option ;
  subnet_availability_zone: string option ;
  subnet_id: string option }[@@ocaml.doc
                              "Violation detail for the subnet for which internet traffic that hasn't been inspected.\n"]
type nonrec network_firewall_invalid_route_configuration_violation =
  {
  vpc_id: string option ;
  actual_internet_gateway_routes: route list option ;
  expected_internet_gateway_routes: expected_route list option ;
  current_internet_gateway_route_table: string option ;
  internet_gateway_id: string option ;
  actual_firewall_subnet_routes: route list option ;
  expected_firewall_subnet_routes: expected_route list option ;
  actual_firewall_subnet_id: string option ;
  expected_firewall_subnet_id: string option ;
  actual_firewall_endpoint: string option ;
  expected_firewall_endpoint: string option ;
  current_firewall_subnet_route_table: string option ;
  violating_route: route option ;
  is_route_table_used_in_different_a_z: bool option ;
  route_table_id: string option ;
  affected_subnets: string list option }[@@ocaml.doc
                                          "Violation detail for the improperly configured subnet route. It's possible there is a missing route table route, or a configuration that causes traffic to cross an Availability Zone boundary.\n"]
type nonrec network_firewall_black_hole_route_detected_violation =
  {
  violating_routes: route list option ;
  vpc_id: string option ;
  route_table_id: string option ;
  violation_target: string option }[@@ocaml.doc
                                     "Violation detail for an internet gateway route with an inactive state in the customer subnet route table or Network Firewall subnet route table.\n"]
type nonrec network_firewall_unexpected_firewall_routes_violation =
  {
  vpc_id: string option ;
  firewall_endpoint: string option ;
  route_table_id: string option ;
  violating_routes: route list option ;
  firewall_subnet_id: string option }[@@ocaml.doc
                                       "Violation detail for an unexpected route that's present in a route table.\n"]
type nonrec network_firewall_unexpected_gateway_routes_violation =
  {
  vpc_id: string option ;
  route_table_id: string option ;
  violating_routes: route list option ;
  gateway_id: string option }[@@ocaml.doc
                               "Violation detail for an unexpected gateway route that\226\128\153s present in a route table.\n"]
type nonrec network_firewall_missing_expected_routes_violation =
  {
  vpc_id: string option ;
  expected_routes: expected_route list option ;
  violation_target: string option }[@@ocaml.doc
                                     "Violation detail for an expected route missing in Network Firewall.\n"]
type nonrec dns_rule_group_priority_conflict_violation =
  {
  unavailable_priorities: int list option ;
  conflicting_policy_id: string option ;
  conflicting_priority: int option ;
  violation_target_description: string option ;
  violation_target: string option }[@@ocaml.doc
                                     "A rule group that Firewall Manager tried to associate with a VPC has the same priority as a rule group that's already associated. \n"]
type nonrec dns_duplicate_rule_group_violation =
  {
  violation_target_description: string option ;
  violation_target: string option }[@@ocaml.doc
                                     "A DNS Firewall rule group that Firewall Manager tried to associate with a VPC is already associated with the VPC and can't be associated again. \n"]
type nonrec dns_rule_group_limit_exceeded_violation =
  {
  number_of_rule_groups_already_associated: int option ;
  violation_target_description: string option ;
  violation_target: string option }[@@ocaml.doc
                                     "The VPC that Firewall Manager was applying a DNS Fireall policy to reached the limit for associated DNS Firewall rule groups. Firewall Manager tried to associate another rule group with the VPC and failed due to the limit. \n"]
type nonrec firewall_subnet_is_out_of_scope_violation =
  {
  vpc_endpoint_id: string option ;
  subnet_availability_zone_id: string option ;
  subnet_availability_zone: string option ;
  vpc_id: string option ;
  firewall_subnet_id: string option }[@@ocaml.doc
                                       "Contains details about the firewall subnet that violates the policy scope.\n"]
type nonrec route_has_out_of_scope_endpoint_violation =
  {
  internet_gateway_routes: route list option ;
  current_internet_gateway_route_table: string option ;
  internet_gateway_id: string option ;
  firewall_subnet_routes: route list option ;
  firewall_subnet_id: string option ;
  current_firewall_subnet_route_table: string option ;
  subnet_availability_zone_id: string option ;
  subnet_availability_zone: string option ;
  violating_routes: route list option ;
  route_table_id: string option ;
  vpc_id: string option ;
  subnet_id: string option }[@@ocaml.doc
                              "Contains details about the route endpoint that violates the policy scope.\n"]
type nonrec third_party_firewall_missing_firewall_violation =
  {
  target_violation_reason: string option ;
  availability_zone: string option ;
  vp_c: string option ;
  violation_target: string option }[@@ocaml.doc
                                     "The violation details about a third-party firewall's subnet that doesn't have a Firewall Manager managed firewall in its VPC.\n"]
type nonrec third_party_firewall_missing_subnet_violation =
  {
  target_violation_reason: string option ;
  availability_zone: string option ;
  vp_c: string option ;
  violation_target: string option }[@@ocaml.doc
                                     "The violation details for a third-party firewall for an Availability Zone that's missing the Firewall Manager managed subnet.\n"]
type nonrec third_party_firewall_missing_expected_route_table_violation =
  {
  expected_route_table: string option ;
  current_route_table: string option ;
  availability_zone: string option ;
  vp_c: string option ;
  violation_target: string option }[@@ocaml.doc
                                     "The violation details for a third-party firewall that's not associated with an Firewall Manager managed route table.\n"]
type nonrec firewall_subnet_missing_vpc_endpoint_violation =
  {
  subnet_availability_zone_id: string option ;
  subnet_availability_zone: string option ;
  vpc_id: string option ;
  firewall_subnet_id: string option }[@@ocaml.doc
                                       "The violation details for a firewall subnet's VPC endpoint that's deleted or missing.\n"]
type nonrec network_acl_icmp_type_code =
  {
  type_: int option ;
  code: int option }[@@ocaml.doc "ICMP protocol: The ICMP type and code.\n"]
type nonrec network_acl_port_range = {
  to_: int option ;
  from_: int option }[@@ocaml.doc
                       "TCP or UDP protocols: The range of ports the rule applies to.\n"]
type nonrec network_acl_rule_action =
  | DENY 
  | ALLOW [@@ocaml.doc ""]
type nonrec network_acl_entry =
  {
  egress: bool ;
  rule_action: network_acl_rule_action ;
  ipv6_cidr_block: string option ;
  cidr_block: string option ;
  port_range: network_acl_port_range option ;
  protocol: string ;
  icmp_type_code: network_acl_icmp_type_code option }[@@ocaml.doc
                                                       "Describes a rule in a network ACL.\n\n Each network ACL has a set of numbered ingress rules and a separate set of numbered egress rules. When determining whether a packet should be allowed in or out of a subnet associated with the network ACL, Amazon Web Services processes the entries in the network ACL according to the rule numbers, in ascending order. \n \n  When you manage an individual network ACL, you explicitly specify the rule numbers. When you specify the network ACL rules in a Firewall Manager policy, you provide the rules to run first, in the order that you want them to run, and the rules to run last, in the order that you want them to run. Firewall Manager assigns the rule numbers for you when you save the network ACL policy specification.\n  "]
type nonrec entry_type =
  | CustomEntry 
  | FMSManagedLastEntry 
  | FMSManagedFirstEntry [@@ocaml.doc ""]
type nonrec entry_description =
  {
  entry_type: entry_type option ;
  entry_rule_number: int option ;
  entry_detail: network_acl_entry option }[@@ocaml.doc
                                            "Describes a single rule in a network ACL.\n"]
type nonrec entry_violation_reason =
  | EntryConflict 
  | IncorrectEntryOrder 
  | MissingExpectedEntry [@@ocaml.doc ""]
type nonrec entry_violation =
  {
  entry_violation_reasons: entry_violation_reason list option ;
  entries_with_conflicts: entry_description list option ;
  entry_at_expected_evaluation_order: entry_description option ;
  actual_evaluation_order: string option ;
  expected_evaluation_order: string option ;
  expected_entry: entry_description option }[@@ocaml.doc
                                              "Detailed information about an entry violation in a network ACL. The violation is against the network ACL specification inside the Firewall Manager network ACL policy. This data object is part of [InvalidNetworkAclEntriesViolation].\n"]
type nonrec invalid_network_acl_entries_violation =
  {
  entry_violations: entry_violation list option ;
  current_associated_network_acl: string option ;
  subnet_availability_zone: string option ;
  subnet: string option ;
  vpc: string option }[@@ocaml.doc
                        "Violation detail for the entries in a network ACL resource.\n"]
type nonrec action_target =
  {
  description: string option ;
  resource_id: string option }[@@ocaml.doc
                                "Describes a remediation action target.\n"]
type nonrec ec2_create_route_action =
  {
  route_table_id: action_target ;
  gateway_id: action_target option ;
  vpc_endpoint_id: action_target option ;
  destination_ipv6_cidr_block: string option ;
  destination_prefix_list_id: string option ;
  destination_cidr_block: string option ;
  description: string option }[@@ocaml.doc
                                "Information about the CreateRoute action in Amazon EC2.\n"]
type nonrec ec2_replace_route_action =
  {
  route_table_id: action_target ;
  gateway_id: action_target option ;
  destination_ipv6_cidr_block: string option ;
  destination_prefix_list_id: string option ;
  destination_cidr_block: string option ;
  description: string option }[@@ocaml.doc
                                "Information about the ReplaceRoute action in Amazon EC2.\n"]
type nonrec ec2_delete_route_action =
  {
  route_table_id: action_target ;
  destination_ipv6_cidr_block: string option ;
  destination_prefix_list_id: string option ;
  destination_cidr_block: string option ;
  description: string option }[@@ocaml.doc
                                "Information about the DeleteRoute action in Amazon EC2.\n"]
type nonrec ec2_copy_route_table_action =
  {
  route_table_id: action_target ;
  vpc_id: action_target ;
  description: string option }[@@ocaml.doc
                                "An action that copies the EC2 route table for use in remediation.\n"]
type nonrec ec2_replace_route_table_association_action =
  {
  route_table_id: action_target ;
  association_id: action_target ;
  description: string option }[@@ocaml.doc
                                "Information about the ReplaceRouteTableAssociation action in Amazon EC2.\n"]
type nonrec ec2_associate_route_table_action =
  {
  gateway_id: action_target option ;
  subnet_id: action_target option ;
  route_table_id: action_target ;
  description: string option }[@@ocaml.doc
                                "The action of associating an EC2 resource, such as a subnet or internet gateway, with a route table.\n"]
type nonrec ec2_create_route_table_action =
  {
  vpc_id: action_target ;
  description: string option }[@@ocaml.doc
                                "Information about the CreateRouteTable action in Amazon EC2.\n"]
type nonrec fms_policy_update_firewall_creation_config_action =
  {
  firewall_creation_config: string option ;
  description: string option }[@@ocaml.doc
                                "Contains information about the actions that you can take to remediate scope violations caused by your policy's [FirewallCreationConfig]. [FirewallCreationConfig] is an optional configuration that you can use to choose which Availability Zones Firewall Manager creates Network Firewall endpoints in.\n"]
type nonrec create_network_acl_action =
  {
  fms_can_remediate: bool option ;
  vpc: action_target option ;
  description: string option }[@@ocaml.doc
                                "Information about the [CreateNetworkAcl] action in Amazon EC2. This is a remediation option in [RemediationAction].\n"]
type nonrec replace_network_acl_association_action =
  {
  fms_can_remediate: bool option ;
  network_acl_id: action_target option ;
  association_id: action_target option ;
  description: string option }[@@ocaml.doc
                                "Information about the [ReplaceNetworkAclAssociation] action in Amazon EC2. This is a remediation option in [RemediationAction].\n"]
type nonrec create_network_acl_entries_action =
  {
  fms_can_remediate: bool option ;
  network_acl_entries_to_be_created: entry_description list option ;
  network_acl_id: action_target option ;
  description: string option }[@@ocaml.doc
                                "Information about the [CreateNetworkAclEntries] action in Amazon EC2. This is a remediation option in [RemediationAction].\n"]
type nonrec delete_network_acl_entries_action =
  {
  fms_can_remediate: bool option ;
  network_acl_entries_to_be_deleted: entry_description list option ;
  network_acl_id: action_target option ;
  description: string option }[@@ocaml.doc
                                "Information about the [DeleteNetworkAclEntries] action in Amazon EC2. This is a remediation option in [RemediationAction]. \n"]
type nonrec remediation_action =
  {
  delete_network_acl_entries_action: delete_network_acl_entries_action option ;
  create_network_acl_entries_action: create_network_acl_entries_action option ;
  replace_network_acl_association_action:
    replace_network_acl_association_action option ;
  create_network_acl_action: create_network_acl_action option ;
  fms_policy_update_firewall_creation_config_action:
    fms_policy_update_firewall_creation_config_action option ;
  ec2_create_route_table_action: ec2_create_route_table_action option ;
  ec2_associate_route_table_action: ec2_associate_route_table_action option ;
  ec2_replace_route_table_association_action:
    ec2_replace_route_table_association_action option ;
  ec2_copy_route_table_action: ec2_copy_route_table_action option ;
  ec2_delete_route_action: ec2_delete_route_action option ;
  ec2_replace_route_action: ec2_replace_route_action option ;
  ec2_create_route_action: ec2_create_route_action option ;
  description: string option }[@@ocaml.doc
                                "Information about an individual action you can take to remediate a violation.\n"]
type nonrec remediation_action_with_order =
  {
  order: int option ;
  remediation_action: remediation_action option }[@@ocaml.doc
                                                   "An ordered list of actions you can take to remediate a violation.\n"]
type nonrec possible_remediation_action =
  {
  is_default_action: bool option ;
  ordered_remediation_actions: remediation_action_with_order list ;
  description: string option }[@@ocaml.doc
                                "A list of remediation actions.\n"]
type nonrec possible_remediation_actions =
  {
  actions: possible_remediation_action list option ;
  description: string option }[@@ocaml.doc
                                "A list of possible remediation action lists. Each individual possible remediation action is a list of individual remediation actions.\n"]
type nonrec resource_violation =
  {
  possible_remediation_actions: possible_remediation_actions option ;
  invalid_network_acl_entries_violation:
    invalid_network_acl_entries_violation option ;
  firewall_subnet_missing_vpc_endpoint_violation:
    firewall_subnet_missing_vpc_endpoint_violation option ;
  third_party_firewall_missing_expected_route_table_violation:
    third_party_firewall_missing_expected_route_table_violation option ;
  third_party_firewall_missing_subnet_violation:
    third_party_firewall_missing_subnet_violation option ;
  third_party_firewall_missing_firewall_violation:
    third_party_firewall_missing_firewall_violation option ;
  route_has_out_of_scope_endpoint_violation:
    route_has_out_of_scope_endpoint_violation option ;
  firewall_subnet_is_out_of_scope_violation:
    firewall_subnet_is_out_of_scope_violation option ;
  dns_rule_group_limit_exceeded_violation:
    dns_rule_group_limit_exceeded_violation option ;
  dns_duplicate_rule_group_violation:
    dns_duplicate_rule_group_violation option ;
  dns_rule_group_priority_conflict_violation:
    dns_rule_group_priority_conflict_violation option ;
  network_firewall_missing_expected_routes_violation:
    network_firewall_missing_expected_routes_violation option ;
  network_firewall_unexpected_gateway_routes_violation:
    network_firewall_unexpected_gateway_routes_violation option ;
  network_firewall_unexpected_firewall_routes_violation:
    network_firewall_unexpected_firewall_routes_violation option ;
  network_firewall_black_hole_route_detected_violation:
    network_firewall_black_hole_route_detected_violation option ;
  network_firewall_invalid_route_configuration_violation:
    network_firewall_invalid_route_configuration_violation option ;
  network_firewall_internet_traffic_not_inspected_violation:
    network_firewall_internet_traffic_not_inspected_violation option ;
  network_firewall_policy_modified_violation:
    network_firewall_policy_modified_violation option ;
  network_firewall_missing_expected_rt_violation:
    network_firewall_missing_expected_rt_violation option ;
  network_firewall_missing_subnet_violation:
    network_firewall_missing_subnet_violation option ;
  network_firewall_missing_firewall_violation:
    network_firewall_missing_firewall_violation option ;
  aws_ec2_instance_violation: aws_ec2_instance_violation option ;
  aws_ec2_network_interface_violation:
    aws_ec2_network_interface_violation option ;
  aws_vpc_security_group_violation: aws_vpc_security_group_violation option }
[@@ocaml.doc "Violation detail based on resource type.\n"]
type nonrec tag = {
  value: string ;
  key: string }[@@ocaml.doc
                 "A collection of key:value pairs associated with an Amazon Web Services resource. The key:value pair can be anything you define. Typically, the tag key represents a category (such as \"environment\") and the tag value represents a specific value within that category (such as \"test,\" \"development,\" or \"production\"). You can add up to 50 tags to each Amazon Web Services resource. \n"]
type nonrec violation_detail =
  {
  resource_description: string option ;
  resource_tags: tag list option ;
  resource_violations: resource_violation list ;
  resource_type: string ;
  resource_id: string ;
  member_account: string ;
  policy_id: string }[@@ocaml.doc
                       "Violations for a resource based on the specified Firewall Manager policy and Amazon Web Services account.\n"]
type nonrec untag_resource_response = unit
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The specified resource was not found.\n"]
type nonrec invalid_operation_exception = {
  message: string option }[@@ocaml.doc
                            "The operation failed because there was nothing to do or the operation wasn't possible. For example, you might have submitted an [AssociateAdminAccount] request for an account ID that was already set as the Firewall Manager administrator. Or you might have tried to access a Region that's disabled by default, and that you need to enable for the Firewall Manager administrator account and for Organizations before you can access it.\n"]
type nonrec invalid_input_exception = {
  message: string option }[@@ocaml.doc
                            "The parameters of the request were invalid.\n"]
type nonrec internal_error_exception = {
  message: string option }[@@ocaml.doc
                            "The operation failed because of a system problem, even though the request was valid. Retry your request.\n"]
type nonrec firewall_deployment_model =
  | DISTRIBUTED 
  | CENTRALIZED [@@ocaml.doc ""]
type nonrec third_party_firewall_policy =
  {
  firewall_deployment_model: firewall_deployment_model option }[@@ocaml.doc
                                                                 "Configures the deployment model for the third-party firewall.\n"]
type nonrec third_party_firewall_firewall_policy =
  {
  firewall_policy_name: string option ;
  firewall_policy_id: string option }[@@ocaml.doc
                                       "Configures the third-party firewall's firewall policy.\n"]
type nonrec third_party_firewall_association_status =
  | NOT_EXIST 
  | OFFBOARD_COMPLETE 
  | OFFBOARDING 
  | ONBOARD_COMPLETE 
  | ONBOARDING [@@ocaml.doc ""]
type nonrec third_party_firewall =
  | FORTIGATE_CLOUD_NATIVE_FIREWALL 
  | PALO_ALTO_NETWORKS_CLOUD_NGFW [@@ocaml.doc ""]
type nonrec tag_resource_response = unit
type nonrec tag_resource_request =
  {
  tag_list: tag list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec limit_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "The operation exceeds a resource limit, for example, the maximum number of [policy] objects that you can create for an Amazon Web Services account. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/fms-limits.html}Firewall Manager Limits} in the {i WAF Developer Guide}.\n"]
type nonrec security_service_type =
  | NETWORK_ACL_COMMON 
  | IMPORT_NETWORK_FIREWALL 
  | THIRD_PARTY_FIREWALL 
  | DNS_FIREWALL 
  | NETWORK_FIREWALL 
  | SECURITY_GROUPS_USAGE_AUDIT 
  | SECURITY_GROUPS_CONTENT_AUDIT 
  | SECURITY_GROUPS_COMMON 
  | SHIELD_ADVANCED 
  | WAFV2 
  | WAF [@@ocaml.doc ""]
type nonrec network_firewall_policy =
  {
  firewall_deployment_model: firewall_deployment_model option }[@@ocaml.doc
                                                                 "Configures the firewall policy deployment model of Network Firewall. For information about Network Firewall deployment models, see {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/architectures.html}Network Firewall example architectures with routing} in the {i Network Firewall Developer Guide}.\n"]
type nonrec network_acl_entry_set =
  {
  force_remediate_for_last_entries: bool ;
  last_entries: network_acl_entry list option ;
  force_remediate_for_first_entries: bool ;
  first_entries: network_acl_entry list option }[@@ocaml.doc
                                                  "The configuration of the first and last rules for the network ACL policy, and the remediation settings for each. \n"]
type nonrec network_acl_common_policy =
  {
  network_acl_entry_set: network_acl_entry_set }[@@ocaml.doc
                                                  "Defines a Firewall Manager network ACL policy. This is used in the [PolicyOption] of a [SecurityServicePolicyData] for a [Policy], when the [SecurityServicePolicyData] type is set to [NETWORK_ACL_COMMON]. \n\n For information about network ACLs, see {{:https://docs.aws.amazon.com/vpc/latest/userguide/vpc-network-acls.html}Control traffic to subnets using network ACLs} in the {i Amazon Virtual Private Cloud User Guide}. \n "]
type nonrec policy_option =
  {
  network_acl_common_policy: network_acl_common_policy option ;
  third_party_firewall_policy: third_party_firewall_policy option ;
  network_firewall_policy: network_firewall_policy option }[@@ocaml.doc
                                                             "Contains the settings to configure a network ACL policy, a Network Firewall firewall policy deployment model, or a third-party firewall policy.\n"]
type nonrec security_service_policy_data =
  {
  policy_option: policy_option option ;
  managed_service_data: string option ;
  type_: security_service_type }[@@ocaml.doc
                                  "Details about the security service that is being used to protect the resources.\n"]
type nonrec resource_tag = {
  value: string option ;
  key: string }[@@ocaml.doc
                 "The resource tags that Firewall Manager uses to determine if a particular resource should be included or excluded from the Firewall Manager policy. Tags enable you to categorize your Amazon Web Services resources in different ways, for example, by purpose, owner, or environment. Each tag consists of a key and an optional value. Firewall Manager combines the tags with \"AND\" so that, if you add more than one tag to a policy scope, a resource must have all the specified tags to be included or excluded. For more information, see {{:https://docs.aws.amazon.com/awsconsolehelpdocs/latest/gsg/tag-editor.html}Working with Tag Editor}.\n\n Every resource tag must have a string value, either a non-empty string or an empty string. If you don't provide a value for a resource tag, Firewall Manager saves the value as an empty string: \"\". When Firewall Manager compares tags, it only matches two tags if they have the same key and the same value. A tag with an empty string value only matches with tags that also have an empty string value. \n "]
type nonrec resource_set_status =
  | OUT_OF_ADMIN_SCOPE 
  | ACTIVE [@@ocaml.doc ""]
type nonrec resource_set_summary =
  {
  resource_set_status: resource_set_status option ;
  last_update_time: CoreTypes.Timestamp.t option ;
  description: string option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Summarizes the resource sets used in a policy.\n"]
type nonrec resource_set =
  {
  resource_set_status: resource_set_status option ;
  last_update_time: CoreTypes.Timestamp.t option ;
  resource_type_list: string list ;
  update_token: string option ;
  description: string option ;
  name: string ;
  id: string option }[@@ocaml.doc
                       "A set of resources to include in a policy.\n"]
type nonrec resource = {
  account_id: string option ;
  ur_i: string }[@@ocaml.doc
                  "Details of a resource that is associated to an Firewall Manager resource set.\n"]
type nonrec region_scope =
  {
  all_regions_enabled: bool option ;
  regions: string list option }[@@ocaml.doc
                                 "Defines the Amazon Web Services Regions that the specified Firewall Manager administrator can manage.\n"]
type nonrec put_resource_set_response =
  {
  resource_set_arn: string ;
  resource_set: resource_set }[@@ocaml.doc ""]
type nonrec put_resource_set_request =
  {
  tag_list: tag list option ;
  resource_set: resource_set }[@@ocaml.doc ""]
type nonrec previous_protocols_list = (string * string list) list[@@ocaml.doc
                                                                   ""]
type nonrec protocols_list_data =
  {
  previous_protocols_list: previous_protocols_list option ;
  protocols_list: string list ;
  last_update_time: CoreTypes.Timestamp.t option ;
  create_time: CoreTypes.Timestamp.t option ;
  list_update_token: string option ;
  list_name: string ;
  list_id: string option }[@@ocaml.doc
                            "An Firewall Manager protocols list.\n"]
type nonrec put_protocols_list_response =
  {
  protocols_list_arn: string option ;
  protocols_list: protocols_list_data option }[@@ocaml.doc ""]
type nonrec put_protocols_list_request =
  {
  tag_list: tag list option ;
  protocols_list: protocols_list_data }[@@ocaml.doc ""]
type nonrec customer_policy_scope_id_type =
  | ORG_UNIT 
  | ACCOUNT [@@ocaml.doc ""]
type nonrec customer_policy_scope_map =
  (customer_policy_scope_id_type * string list) list[@@ocaml.doc ""]
type nonrec customer_policy_status =
  | OUT_OF_ADMIN_SCOPE 
  | ACTIVE [@@ocaml.doc ""]
type nonrec policy =
  {
  policy_status: customer_policy_status option ;
  policy_description: string option ;
  resource_set_ids: string list option ;
  exclude_map: customer_policy_scope_map option ;
  include_map: customer_policy_scope_map option ;
  delete_unused_fm_managed_resources: bool option ;
  remediation_enabled: bool ;
  exclude_resource_tags: bool ;
  resource_tags: resource_tag list option ;
  resource_type_list: string list option ;
  resource_type: string ;
  security_service_policy_data: security_service_policy_data ;
  policy_update_token: string option ;
  policy_name: string ;
  policy_id: string option }[@@ocaml.doc "An Firewall Manager policy.\n"]
type nonrec put_policy_response =
  {
  policy_arn: string option ;
  policy: policy option }[@@ocaml.doc ""]
type nonrec put_policy_request = {
  tag_list: tag list option ;
  policy: policy }[@@ocaml.doc ""]
type nonrec invalid_type_exception = {
  message: string option }[@@ocaml.doc
                            "The value of the [Type] parameter is invalid.\n"]
type nonrec put_notification_channel_request =
  {
  sns_role_name: string ;
  sns_topic_arn: string }[@@ocaml.doc ""]
type nonrec app = {
  port: int ;
  protocol: string ;
  app_name: string }[@@ocaml.doc
                      "An individual Firewall Manager application.\n"]
type nonrec previous_apps_list = (string * app list) list[@@ocaml.doc ""]
type nonrec apps_list_data =
  {
  previous_apps_list: previous_apps_list option ;
  apps_list: app list ;
  last_update_time: CoreTypes.Timestamp.t option ;
  create_time: CoreTypes.Timestamp.t option ;
  list_update_token: string option ;
  list_name: string ;
  list_id: string option }[@@ocaml.doc
                            "An Firewall Manager applications list.\n"]
type nonrec put_apps_list_response =
  {
  apps_list_arn: string option ;
  apps_list: apps_list_data option }[@@ocaml.doc ""]
type nonrec put_apps_list_request =
  {
  tag_list: tag list option ;
  apps_list: apps_list_data }[@@ocaml.doc ""]
type nonrec account_scope =
  {
  exclude_specified_accounts: bool option ;
  all_accounts_enabled: bool option ;
  accounts: string list option }[@@ocaml.doc
                                  "Configures the accounts within the administrator's Organizations organization that the specified Firewall Manager administrator can apply policies to.\n"]
type nonrec organizational_unit_scope =
  {
  exclude_specified_organizational_units: bool option ;
  all_organizational_units_enabled: bool option ;
  organizational_units: string list option }[@@ocaml.doc
                                              "Defines the Organizations organizational units (OUs) that the specified Firewall Manager administrator can apply policies to. For more information about OUs in Organizations, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_ous.html}Managing organizational units (OUs) } in the {i Organizations User Guide}.\n"]
type nonrec policy_type_scope =
  {
  all_policy_types_enabled: bool option ;
  policy_types: security_service_type list option }[@@ocaml.doc
                                                     "Defines the policy types that the specified Firewall Manager administrator can manage.\n"]
type nonrec admin_scope =
  {
  policy_type_scope: policy_type_scope option ;
  region_scope: region_scope option ;
  organizational_unit_scope: organizational_unit_scope option ;
  account_scope: account_scope option }[@@ocaml.doc
                                         "Defines the resources that the Firewall Manager administrator can manage. For more information about administrative scope, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/fms-administrators.html}Managing Firewall Manager administrators} in the {i Firewall Manager Developer Guide}.\n"]
type nonrec put_admin_account_request =
  {
  admin_scope: admin_scope option ;
  admin_account: string }[@@ocaml.doc ""]
type nonrec protocols_list_data_summary =
  {
  protocols_list: string list option ;
  list_name: string option ;
  list_id: string option ;
  list_arn: string option }[@@ocaml.doc
                             "Details of the Firewall Manager protocols list.\n"]
type nonrec policy_summary =
  {
  policy_status: customer_policy_status option ;
  delete_unused_fm_managed_resources: bool option ;
  remediation_enabled: bool option ;
  security_service_type: security_service_type option ;
  resource_type: string option ;
  policy_name: string option ;
  policy_id: string option ;
  policy_arn: string option }[@@ocaml.doc
                               "Details of the Firewall Manager policy. \n"]
type nonrec policy_compliance_status_type =
  | NonCompliant 
  | Compliant [@@ocaml.doc ""]
type nonrec evaluation_result =
  {
  evaluation_limit_exceeded: bool option ;
  violator_count: int option ;
  compliance_status: policy_compliance_status_type option }[@@ocaml.doc
                                                             "Describes the compliance status for the account. An account is considered noncompliant if it includes resources that are not protected by the specified policy or that don't comply with the policy.\n"]
type nonrec dependent_service_name =
  | AWSVirtualPrivateCloud 
  | AWSShieldAdvanced 
  | AWSWAF 
  | AWSConfig [@@ocaml.doc ""]
type nonrec issue_info_map = (dependent_service_name * string) list[@@ocaml.doc
                                                                    ""]
type nonrec policy_compliance_status =
  {
  issue_info_map: issue_info_map option ;
  last_updated: CoreTypes.Timestamp.t option ;
  evaluation_results: evaluation_result list option ;
  member_account: string option ;
  policy_name: string option ;
  policy_id: string option ;
  policy_owner: string option }[@@ocaml.doc
                                 "Indicates whether the account is compliant with the specified policy. An account is considered noncompliant if it includes resources that are not protected by the policy, for WAF and Shield Advanced policies, or that are noncompliant with the policy, for security group policies.\n"]
type nonrec compliance_violator_metadata = (string * string) list[@@ocaml.doc
                                                                   ""]
type nonrec compliance_violator =
  {
  metadata: compliance_violator_metadata option ;
  resource_type: string option ;
  violation_reason: violation_reason option ;
  resource_id: string option }[@@ocaml.doc
                                "Details of the resource that is not protected by the policy.\n"]
type nonrec policy_compliance_detail =
  {
  issue_info_map: issue_info_map option ;
  expired_at: CoreTypes.Timestamp.t option ;
  evaluation_limit_exceeded: bool option ;
  violators: compliance_violator list option ;
  member_account: string option ;
  policy_id: string option ;
  policy_owner: string option }[@@ocaml.doc
                                 "Describes the noncompliant resources in a member account for a specific Firewall Manager policy. A maximum of 100 entries are displayed. If more than 100 resources are noncompliant, [EvaluationLimitExceeded] is set to [True].\n"]
type nonrec organization_status =
  | OffboardingComplete 
  | Offboarding 
  | OnboardingComplete 
  | Onboarding [@@ocaml.doc ""]
type nonrec marketplace_subscription_onboarding_status =
  | COMPLETE 
  | NOT_COMPLETE 
  | NO_SUBSCRIPTION [@@ocaml.doc ""]
type nonrec list_third_party_firewall_firewall_policies_response =
  {
  next_token: string option ;
  third_party_firewall_firewall_policies:
    third_party_firewall_firewall_policy list option }[@@ocaml.doc ""]
type nonrec list_third_party_firewall_firewall_policies_request =
  {
  max_results: int ;
  next_token: string option ;
  third_party_firewall: third_party_firewall }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_response = {
  tag_list: tag list option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec list_resource_sets_response =
  {
  next_token: string option ;
  resource_sets: resource_set_summary list option }[@@ocaml.doc ""]
type nonrec list_resource_sets_request =
  {
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_resource_set_resources_response =
  {
  next_token: string option ;
  items: resource list }[@@ocaml.doc ""]
type nonrec list_resource_set_resources_request =
  {
  next_token: string option ;
  max_results: int option ;
  identifier: string }[@@ocaml.doc ""]
type nonrec list_protocols_lists_response =
  {
  next_token: string option ;
  protocols_lists: protocols_list_data_summary list option }[@@ocaml.doc ""]
type nonrec list_protocols_lists_request =
  {
  max_results: int ;
  next_token: string option ;
  default_lists: bool option }[@@ocaml.doc ""]
type nonrec list_policies_response =
  {
  next_token: string option ;
  policy_list: policy_summary list option }[@@ocaml.doc ""]
type nonrec list_policies_request =
  {
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_member_accounts_response =
  {
  next_token: string option ;
  member_accounts: string list option }[@@ocaml.doc ""]
type nonrec list_member_accounts_request =
  {
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec discovered_resource =
  {
  name: string option ;
  type_: string option ;
  account_id: string option ;
  ur_i: string option }[@@ocaml.doc
                         "A resource in the organization that's available to be associated with a Firewall Manager resource set.\n"]
type nonrec list_discovered_resources_response =
  {
  next_token: string option ;
  items: discovered_resource list option }[@@ocaml.doc ""]
type nonrec list_discovered_resources_request =
  {
  next_token: string option ;
  max_results: int option ;
  resource_type: string ;
  member_account_ids: string list }[@@ocaml.doc ""]
type nonrec list_compliance_status_response =
  {
  next_token: string option ;
  policy_compliance_status_list: policy_compliance_status list option }
[@@ocaml.doc ""]
type nonrec list_compliance_status_request =
  {
  max_results: int option ;
  next_token: string option ;
  policy_id: string }[@@ocaml.doc ""]
type nonrec apps_list_data_summary =
  {
  apps_list: app list option ;
  list_name: string option ;
  list_id: string option ;
  list_arn: string option }[@@ocaml.doc
                             "Details of the Firewall Manager applications list.\n"]
type nonrec list_apps_lists_response =
  {
  next_token: string option ;
  apps_lists: apps_list_data_summary list option }[@@ocaml.doc ""]
type nonrec list_apps_lists_request =
  {
  max_results: int ;
  next_token: string option ;
  default_lists: bool option }[@@ocaml.doc ""]
type nonrec list_admins_managing_account_response =
  {
  next_token: string option ;
  admin_accounts: string list option }[@@ocaml.doc ""]
type nonrec list_admins_managing_account_request =
  {
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec admin_account_summary =
  {
  status: organization_status option ;
  default_admin: bool option ;
  admin_account: string option }[@@ocaml.doc
                                  "Contains high level information about the Firewall Manager administrator account.\n"]
type nonrec list_admin_accounts_for_organization_response =
  {
  next_token: string option ;
  admin_accounts: admin_account_summary list option }[@@ocaml.doc ""]
type nonrec list_admin_accounts_for_organization_request =
  {
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec get_violation_details_response =
  {
  violation_detail: violation_detail option }[@@ocaml.doc ""]
type nonrec get_violation_details_request =
  {
  resource_type: string ;
  resource_id: string ;
  member_account: string ;
  policy_id: string }[@@ocaml.doc ""]
type nonrec get_third_party_firewall_association_status_response =
  {
  marketplace_onboarding_status:
    marketplace_subscription_onboarding_status option ;
  third_party_firewall_status: third_party_firewall_association_status option }
[@@ocaml.doc ""]
type nonrec get_third_party_firewall_association_status_request =
  {
  third_party_firewall: third_party_firewall }[@@ocaml.doc ""]
type nonrec get_resource_set_response =
  {
  resource_set_arn: string ;
  resource_set: resource_set }[@@ocaml.doc ""]
type nonrec get_resource_set_request = {
  identifier: string }[@@ocaml.doc ""]
type nonrec get_protocols_list_response =
  {
  protocols_list_arn: string option ;
  protocols_list: protocols_list_data option }[@@ocaml.doc ""]
type nonrec get_protocols_list_request =
  {
  default_list: bool option ;
  list_id: string }[@@ocaml.doc ""]
type nonrec get_protection_status_response =
  {
  next_token: string option ;
  data: string option ;
  service_type: security_service_type option ;
  admin_account_id: string option }[@@ocaml.doc ""]
type nonrec get_protection_status_request =
  {
  max_results: int option ;
  next_token: string option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  member_account_id: string option ;
  policy_id: string }[@@ocaml.doc ""]
type nonrec get_policy_response =
  {
  policy_arn: string option ;
  policy: policy option }[@@ocaml.doc ""]
type nonrec get_policy_request = {
  policy_id: string }[@@ocaml.doc ""]
type nonrec get_notification_channel_response =
  {
  sns_role_name: string option ;
  sns_topic_arn: string option }[@@ocaml.doc ""]
type nonrec get_notification_channel_request = unit
type nonrec get_compliance_detail_response =
  {
  policy_compliance_detail: policy_compliance_detail option }[@@ocaml.doc ""]
type nonrec get_compliance_detail_request =
  {
  member_account: string ;
  policy_id: string }[@@ocaml.doc ""]
type nonrec get_apps_list_response =
  {
  apps_list_arn: string option ;
  apps_list: apps_list_data option }[@@ocaml.doc ""]
type nonrec get_apps_list_request =
  {
  default_list: bool option ;
  list_id: string }[@@ocaml.doc ""]
type nonrec get_admin_scope_response =
  {
  status: organization_status option ;
  admin_scope: admin_scope option }[@@ocaml.doc ""]
type nonrec get_admin_scope_request = {
  admin_account: string }[@@ocaml.doc ""]
type nonrec account_role_status =
  | Deleted 
  | Deleting 
  | PendingDeletion 
  | Creating 
  | Ready [@@ocaml.doc ""]
type nonrec get_admin_account_response =
  {
  role_status: account_role_status option ;
  admin_account: string option }[@@ocaml.doc ""]
type nonrec get_admin_account_request = unit
type nonrec failed_item_reason =
  | NotValidAccountId 
  | NotValidResourceType 
  | NotValidService 
  | NotValidRegion 
  | NotValidPartition 
  | NotValidArn [@@ocaml.doc ""]
type nonrec failed_item =
  {
  reason: failed_item_reason option ;
  ur_i: string option }[@@ocaml.doc
                         "Details of a resource that failed when trying to update it's association to a resource set.\n"]
type nonrec disassociate_third_party_firewall_response =
  {
  third_party_firewall_status: third_party_firewall_association_status option }
[@@ocaml.doc ""]
type nonrec disassociate_third_party_firewall_request =
  {
  third_party_firewall: third_party_firewall }[@@ocaml.doc ""]
type nonrec disassociate_admin_account_request = unit
type nonrec delete_resource_set_request = {
  identifier: string }[@@ocaml.doc ""]
type nonrec delete_protocols_list_request = {
  list_id: string }[@@ocaml.doc ""]
type nonrec delete_policy_request =
  {
  delete_all_policy_resources: bool option ;
  policy_id: string }[@@ocaml.doc ""]
type nonrec delete_notification_channel_request = unit
type nonrec delete_apps_list_request = {
  list_id: string }[@@ocaml.doc ""]
type nonrec batch_disassociate_resource_response =
  {
  failed_items: failed_item list ;
  resource_set_identifier: string }[@@ocaml.doc ""]
type nonrec batch_disassociate_resource_request =
  {
  items: string list ;
  resource_set_identifier: string }[@@ocaml.doc ""]
type nonrec batch_associate_resource_response =
  {
  failed_items: failed_item list ;
  resource_set_identifier: string }[@@ocaml.doc ""]
type nonrec batch_associate_resource_request =
  {
  items: string list ;
  resource_set_identifier: string }[@@ocaml.doc ""]
type nonrec associate_third_party_firewall_response =
  {
  third_party_firewall_status: third_party_firewall_association_status option }
[@@ocaml.doc ""]
type nonrec associate_third_party_firewall_request =
  {
  third_party_firewall: third_party_firewall }[@@ocaml.doc ""]
type nonrec associate_admin_account_request = {
  admin_account: string }[@@ocaml.doc ""](** {1:builders Builders} *)

val make_partial_match :
  ?target_violation_reasons:string list ->
    ?reference:string -> unit -> partial_match
val make_security_group_rule_description :
  ?to_port:int ->
    ?from_port:int ->
      ?protocol:string ->
        ?prefix_list_id:string ->
          ?ipv6_range:string ->
            ?ipv4_range:string -> unit -> security_group_rule_description
val make_security_group_remediation_action :
  ?is_default_action:bool ->
    ?remediation_result:security_group_rule_description ->
      ?description:string ->
        ?remediation_action_type:remediation_action_type ->
          unit -> security_group_remediation_action
val make_aws_vpc_security_group_violation :
  ?possible_security_group_remediation_actions:security_group_remediation_action
    list ->
    ?partial_matches:partial_match list ->
      ?violation_target_description:string ->
        ?violation_target:string -> unit -> aws_vpc_security_group_violation
val make_aws_ec2_network_interface_violation :
  ?violating_security_groups:string list ->
    ?violation_target:string -> unit -> aws_ec2_network_interface_violation
val make_aws_ec2_instance_violation :
  ?aws_ec2_network_interface_violations:aws_ec2_network_interface_violation
    list -> ?violation_target:string -> unit -> aws_ec2_instance_violation
val make_network_firewall_missing_firewall_violation :
  ?target_violation_reason:string ->
    ?availability_zone:string ->
      ?vp_c:string ->
        ?violation_target:string ->
          unit -> network_firewall_missing_firewall_violation
val make_network_firewall_missing_subnet_violation :
  ?target_violation_reason:string ->
    ?availability_zone:string ->
      ?vp_c:string ->
        ?violation_target:string ->
          unit -> network_firewall_missing_subnet_violation
val make_network_firewall_missing_expected_rt_violation :
  ?expected_route_table:string ->
    ?current_route_table:string ->
      ?availability_zone:string ->
        ?vp_c:string ->
          ?violation_target:string ->
            unit -> network_firewall_missing_expected_rt_violation
val make_stateless_rule_group :
  ?priority:int ->
    ?resource_id:string ->
      ?rule_group_name:string -> unit -> stateless_rule_group
val make_network_firewall_stateful_rule_group_override :
  ?action:network_firewall_override_action ->
    unit -> network_firewall_stateful_rule_group_override
val make_stateful_rule_group :
  ?override:network_firewall_stateful_rule_group_override ->
    ?priority:int ->
      ?resource_id:string ->
        ?rule_group_name:string -> unit -> stateful_rule_group
val make_stateful_engine_options :
  ?stream_exception_policy:stream_exception_policy ->
    ?rule_order:rule_order -> unit -> stateful_engine_options
val make_network_firewall_policy_description :
  ?stateful_engine_options:stateful_engine_options ->
    ?stateful_default_actions:string list ->
      ?stateful_rule_groups:stateful_rule_group list ->
        ?stateless_custom_actions:string list ->
          ?stateless_fragment_default_actions:string list ->
            ?stateless_default_actions:string list ->
              ?stateless_rule_groups:stateless_rule_group list ->
                unit -> network_firewall_policy_description
val make_network_firewall_policy_modified_violation :
  ?expected_policy_description:network_firewall_policy_description ->
    ?current_policy_description:network_firewall_policy_description ->
      ?violation_target:string ->
        unit -> network_firewall_policy_modified_violation
val make_route :
  ?target:string ->
    ?destination:string ->
      ?target_type:target_type ->
        ?destination_type:destination_type -> unit -> route
val make_expected_route :
  ?route_table_id:string ->
    ?allowed_targets:string list ->
      ?contributing_subnets:string list ->
        ?ip_v6_cidr:string ->
          ?prefix_list_id:string ->
            ?ip_v4_cidr:string -> unit -> expected_route
val make_network_firewall_internet_traffic_not_inspected_violation :
  ?vpc_id:string ->
    ?actual_internet_gateway_routes:route list ->
      ?expected_internet_gateway_routes:expected_route list ->
        ?current_internet_gateway_route_table:string ->
          ?internet_gateway_id:string ->
            ?actual_firewall_subnet_routes:route list ->
              ?expected_firewall_subnet_routes:expected_route list ->
                ?firewall_subnet_id:string ->
                  ?expected_firewall_endpoint:string ->
                    ?current_firewall_subnet_route_table:string ->
                      ?is_route_table_used_in_different_a_z:bool ->
                        ?violating_routes:route list ->
                          ?route_table_id:string ->
                            ?subnet_availability_zone:string ->
                              ?subnet_id:string ->
                                unit ->
                                  network_firewall_internet_traffic_not_inspected_violation
val make_network_firewall_invalid_route_configuration_violation :
  ?vpc_id:string ->
    ?actual_internet_gateway_routes:route list ->
      ?expected_internet_gateway_routes:expected_route list ->
        ?current_internet_gateway_route_table:string ->
          ?internet_gateway_id:string ->
            ?actual_firewall_subnet_routes:route list ->
              ?expected_firewall_subnet_routes:expected_route list ->
                ?actual_firewall_subnet_id:string ->
                  ?expected_firewall_subnet_id:string ->
                    ?actual_firewall_endpoint:string ->
                      ?expected_firewall_endpoint:string ->
                        ?current_firewall_subnet_route_table:string ->
                          ?violating_route:route ->
                            ?is_route_table_used_in_different_a_z:bool ->
                              ?route_table_id:string ->
                                ?affected_subnets:string list ->
                                  unit ->
                                    network_firewall_invalid_route_configuration_violation
val make_network_firewall_black_hole_route_detected_violation :
  ?violating_routes:route list ->
    ?vpc_id:string ->
      ?route_table_id:string ->
        ?violation_target:string ->
          unit -> network_firewall_black_hole_route_detected_violation
val make_network_firewall_unexpected_firewall_routes_violation :
  ?vpc_id:string ->
    ?firewall_endpoint:string ->
      ?route_table_id:string ->
        ?violating_routes:route list ->
          ?firewall_subnet_id:string ->
            unit -> network_firewall_unexpected_firewall_routes_violation
val make_network_firewall_unexpected_gateway_routes_violation :
  ?vpc_id:string ->
    ?route_table_id:string ->
      ?violating_routes:route list ->
        ?gateway_id:string ->
          unit -> network_firewall_unexpected_gateway_routes_violation
val make_network_firewall_missing_expected_routes_violation :
  ?vpc_id:string ->
    ?expected_routes:expected_route list ->
      ?violation_target:string ->
        unit -> network_firewall_missing_expected_routes_violation
val make_dns_rule_group_priority_conflict_violation :
  ?unavailable_priorities:int list ->
    ?conflicting_policy_id:string ->
      ?conflicting_priority:int ->
        ?violation_target_description:string ->
          ?violation_target:string ->
            unit -> dns_rule_group_priority_conflict_violation
val make_dns_duplicate_rule_group_violation :
  ?violation_target_description:string ->
    ?violation_target:string -> unit -> dns_duplicate_rule_group_violation
val make_dns_rule_group_limit_exceeded_violation :
  ?number_of_rule_groups_already_associated:int ->
    ?violation_target_description:string ->
      ?violation_target:string ->
        unit -> dns_rule_group_limit_exceeded_violation
val make_firewall_subnet_is_out_of_scope_violation :
  ?vpc_endpoint_id:string ->
    ?subnet_availability_zone_id:string ->
      ?subnet_availability_zone:string ->
        ?vpc_id:string ->
          ?firewall_subnet_id:string ->
            unit -> firewall_subnet_is_out_of_scope_violation
val make_route_has_out_of_scope_endpoint_violation :
  ?internet_gateway_routes:route list ->
    ?current_internet_gateway_route_table:string ->
      ?internet_gateway_id:string ->
        ?firewall_subnet_routes:route list ->
          ?firewall_subnet_id:string ->
            ?current_firewall_subnet_route_table:string ->
              ?subnet_availability_zone_id:string ->
                ?subnet_availability_zone:string ->
                  ?violating_routes:route list ->
                    ?route_table_id:string ->
                      ?vpc_id:string ->
                        ?subnet_id:string ->
                          unit -> route_has_out_of_scope_endpoint_violation
val make_third_party_firewall_missing_firewall_violation :
  ?target_violation_reason:string ->
    ?availability_zone:string ->
      ?vp_c:string ->
        ?violation_target:string ->
          unit -> third_party_firewall_missing_firewall_violation
val make_third_party_firewall_missing_subnet_violation :
  ?target_violation_reason:string ->
    ?availability_zone:string ->
      ?vp_c:string ->
        ?violation_target:string ->
          unit -> third_party_firewall_missing_subnet_violation
val make_third_party_firewall_missing_expected_route_table_violation :
  ?expected_route_table:string ->
    ?current_route_table:string ->
      ?availability_zone:string ->
        ?vp_c:string ->
          ?violation_target:string ->
            unit ->
              third_party_firewall_missing_expected_route_table_violation
val make_firewall_subnet_missing_vpc_endpoint_violation :
  ?subnet_availability_zone_id:string ->
    ?subnet_availability_zone:string ->
      ?vpc_id:string ->
        ?firewall_subnet_id:string ->
          unit -> firewall_subnet_missing_vpc_endpoint_violation
val make_network_acl_icmp_type_code :
  ?type_:int -> ?code:int -> unit -> network_acl_icmp_type_code
val make_network_acl_port_range :
  ?to_:int -> ?from_:int -> unit -> network_acl_port_range
val make_network_acl_entry :
  ?ipv6_cidr_block:string ->
    ?cidr_block:string ->
      ?port_range:network_acl_port_range ->
        ?icmp_type_code:network_acl_icmp_type_code ->
          egress:bool ->
            rule_action:network_acl_rule_action ->
              protocol:string -> unit -> network_acl_entry
val make_entry_description :
  ?entry_type:entry_type ->
    ?entry_rule_number:int ->
      ?entry_detail:network_acl_entry -> unit -> entry_description
val make_entry_violation :
  ?entry_violation_reasons:entry_violation_reason list ->
    ?entries_with_conflicts:entry_description list ->
      ?entry_at_expected_evaluation_order:entry_description ->
        ?actual_evaluation_order:string ->
          ?expected_evaluation_order:string ->
            ?expected_entry:entry_description -> unit -> entry_violation
val make_invalid_network_acl_entries_violation :
  ?entry_violations:entry_violation list ->
    ?current_associated_network_acl:string ->
      ?subnet_availability_zone:string ->
        ?subnet:string ->
          ?vpc:string -> unit -> invalid_network_acl_entries_violation
val make_action_target :
  ?description:string -> ?resource_id:string -> unit -> action_target
val make_ec2_create_route_action :
  ?gateway_id:action_target ->
    ?vpc_endpoint_id:action_target ->
      ?destination_ipv6_cidr_block:string ->
        ?destination_prefix_list_id:string ->
          ?destination_cidr_block:string ->
            ?description:string ->
              route_table_id:action_target -> unit -> ec2_create_route_action
val make_ec2_replace_route_action :
  ?gateway_id:action_target ->
    ?destination_ipv6_cidr_block:string ->
      ?destination_prefix_list_id:string ->
        ?destination_cidr_block:string ->
          ?description:string ->
            route_table_id:action_target -> unit -> ec2_replace_route_action
val make_ec2_delete_route_action :
  ?destination_ipv6_cidr_block:string ->
    ?destination_prefix_list_id:string ->
      ?destination_cidr_block:string ->
        ?description:string ->
          route_table_id:action_target -> unit -> ec2_delete_route_action
val make_ec2_copy_route_table_action :
  ?description:string ->
    route_table_id:action_target ->
      vpc_id:action_target -> unit -> ec2_copy_route_table_action
val make_ec2_replace_route_table_association_action :
  ?description:string ->
    route_table_id:action_target ->
      association_id:action_target ->
        unit -> ec2_replace_route_table_association_action
val make_ec2_associate_route_table_action :
  ?gateway_id:action_target ->
    ?subnet_id:action_target ->
      ?description:string ->
        route_table_id:action_target ->
          unit -> ec2_associate_route_table_action
val make_ec2_create_route_table_action :
  ?description:string ->
    vpc_id:action_target -> unit -> ec2_create_route_table_action
val make_fms_policy_update_firewall_creation_config_action :
  ?firewall_creation_config:string ->
    ?description:string ->
      unit -> fms_policy_update_firewall_creation_config_action
val make_create_network_acl_action :
  ?fms_can_remediate:bool ->
    ?vpc:action_target ->
      ?description:string -> unit -> create_network_acl_action
val make_replace_network_acl_association_action :
  ?fms_can_remediate:bool ->
    ?network_acl_id:action_target ->
      ?association_id:action_target ->
        ?description:string -> unit -> replace_network_acl_association_action
val make_create_network_acl_entries_action :
  ?fms_can_remediate:bool ->
    ?network_acl_entries_to_be_created:entry_description list ->
      ?network_acl_id:action_target ->
        ?description:string -> unit -> create_network_acl_entries_action
val make_delete_network_acl_entries_action :
  ?fms_can_remediate:bool ->
    ?network_acl_entries_to_be_deleted:entry_description list ->
      ?network_acl_id:action_target ->
        ?description:string -> unit -> delete_network_acl_entries_action
val make_remediation_action :
  ?delete_network_acl_entries_action:delete_network_acl_entries_action ->
    ?create_network_acl_entries_action:create_network_acl_entries_action ->
      ?replace_network_acl_association_action:replace_network_acl_association_action
        ->
        ?create_network_acl_action:create_network_acl_action ->
          ?fms_policy_update_firewall_creation_config_action:fms_policy_update_firewall_creation_config_action
            ->
            ?ec2_create_route_table_action:ec2_create_route_table_action ->
              ?ec2_associate_route_table_action:ec2_associate_route_table_action
                ->
                ?ec2_replace_route_table_association_action:ec2_replace_route_table_association_action
                  ->
                  ?ec2_copy_route_table_action:ec2_copy_route_table_action ->
                    ?ec2_delete_route_action:ec2_delete_route_action ->
                      ?ec2_replace_route_action:ec2_replace_route_action ->
                        ?ec2_create_route_action:ec2_create_route_action ->
                          ?description:string -> unit -> remediation_action
val make_remediation_action_with_order :
  ?order:int ->
    ?remediation_action:remediation_action ->
      unit -> remediation_action_with_order
val make_possible_remediation_action :
  ?is_default_action:bool ->
    ?description:string ->
      ordered_remediation_actions:remediation_action_with_order list ->
        unit -> possible_remediation_action
val make_possible_remediation_actions :
  ?actions:possible_remediation_action list ->
    ?description:string -> unit -> possible_remediation_actions
val make_resource_violation :
  ?possible_remediation_actions:possible_remediation_actions ->
    ?invalid_network_acl_entries_violation:invalid_network_acl_entries_violation
      ->
      ?firewall_subnet_missing_vpc_endpoint_violation:firewall_subnet_missing_vpc_endpoint_violation
        ->
        ?third_party_firewall_missing_expected_route_table_violation:third_party_firewall_missing_expected_route_table_violation
          ->
          ?third_party_firewall_missing_subnet_violation:third_party_firewall_missing_subnet_violation
            ->
            ?third_party_firewall_missing_firewall_violation:third_party_firewall_missing_firewall_violation
              ->
              ?route_has_out_of_scope_endpoint_violation:route_has_out_of_scope_endpoint_violation
                ->
                ?firewall_subnet_is_out_of_scope_violation:firewall_subnet_is_out_of_scope_violation
                  ->
                  ?dns_rule_group_limit_exceeded_violation:dns_rule_group_limit_exceeded_violation
                    ->
                    ?dns_duplicate_rule_group_violation:dns_duplicate_rule_group_violation
                      ->
                      ?dns_rule_group_priority_conflict_violation:dns_rule_group_priority_conflict_violation
                        ->
                        ?network_firewall_missing_expected_routes_violation:network_firewall_missing_expected_routes_violation
                          ->
                          ?network_firewall_unexpected_gateway_routes_violation:network_firewall_unexpected_gateway_routes_violation
                            ->
                            ?network_firewall_unexpected_firewall_routes_violation:network_firewall_unexpected_firewall_routes_violation
                              ->
                              ?network_firewall_black_hole_route_detected_violation:network_firewall_black_hole_route_detected_violation
                                ->
                                ?network_firewall_invalid_route_configuration_violation:network_firewall_invalid_route_configuration_violation
                                  ->
                                  ?network_firewall_internet_traffic_not_inspected_violation:network_firewall_internet_traffic_not_inspected_violation
                                    ->
                                    ?network_firewall_policy_modified_violation:network_firewall_policy_modified_violation
                                      ->
                                      ?network_firewall_missing_expected_rt_violation:network_firewall_missing_expected_rt_violation
                                        ->
                                        ?network_firewall_missing_subnet_violation:network_firewall_missing_subnet_violation
                                          ->
                                          ?network_firewall_missing_firewall_violation:network_firewall_missing_firewall_violation
                                            ->
                                            ?aws_ec2_instance_violation:aws_ec2_instance_violation
                                              ->
                                              ?aws_ec2_network_interface_violation:aws_ec2_network_interface_violation
                                                ->
                                                ?aws_vpc_security_group_violation:aws_vpc_security_group_violation
                                                  ->
                                                  unit -> resource_violation
val make_tag : value:string -> key:string -> unit -> tag
val make_violation_detail :
  ?resource_description:string ->
    ?resource_tags:tag list ->
      resource_violations:resource_violation list ->
        resource_type:string ->
          resource_id:string ->
            member_account:string ->
              policy_id:string -> unit -> violation_detail
val make_untag_resource_response : unit -> untag_resource_response
val make_untag_resource_request :
  tag_keys:string list ->
    resource_arn:string -> unit -> untag_resource_request
val make_third_party_firewall_policy :
  ?firewall_deployment_model:firewall_deployment_model ->
    unit -> third_party_firewall_policy
val make_third_party_firewall_firewall_policy :
  ?firewall_policy_name:string ->
    ?firewall_policy_id:string ->
      unit -> third_party_firewall_firewall_policy
val make_tag_resource_response : unit -> tag_resource_response
val make_tag_resource_request :
  tag_list:tag list -> resource_arn:string -> unit -> tag_resource_request
val make_network_firewall_policy :
  ?firewall_deployment_model:firewall_deployment_model ->
    unit -> network_firewall_policy
val make_network_acl_entry_set :
  ?last_entries:network_acl_entry list ->
    ?first_entries:network_acl_entry list ->
      force_remediate_for_last_entries:bool ->
        force_remediate_for_first_entries:bool ->
          unit -> network_acl_entry_set
val make_network_acl_common_policy :
  network_acl_entry_set:network_acl_entry_set ->
    unit -> network_acl_common_policy
val make_policy_option :
  ?network_acl_common_policy:network_acl_common_policy ->
    ?third_party_firewall_policy:third_party_firewall_policy ->
      ?network_firewall_policy:network_firewall_policy ->
        unit -> policy_option
val make_security_service_policy_data :
  ?policy_option:policy_option ->
    ?managed_service_data:string ->
      type_:security_service_type -> unit -> security_service_policy_data
val make_resource_tag : ?value:string -> key:string -> unit -> resource_tag
val make_resource_set_summary :
  ?resource_set_status:resource_set_status ->
    ?last_update_time:CoreTypes.Timestamp.t ->
      ?description:string ->
        ?name:string -> ?id:string -> unit -> resource_set_summary
val make_resource_set :
  ?resource_set_status:resource_set_status ->
    ?last_update_time:CoreTypes.Timestamp.t ->
      ?update_token:string ->
        ?description:string ->
          ?id:string ->
            resource_type_list:string list ->
              name:string -> unit -> resource_set
val make_resource : ?account_id:string -> ur_i:string -> unit -> resource
val make_region_scope :
  ?all_regions_enabled:bool -> ?regions:string list -> unit -> region_scope
val make_put_resource_set_response :
  resource_set_arn:string ->
    resource_set:resource_set -> unit -> put_resource_set_response
val make_put_resource_set_request :
  ?tag_list:tag list ->
    resource_set:resource_set -> unit -> put_resource_set_request
val make_protocols_list_data :
  ?previous_protocols_list:previous_protocols_list ->
    ?last_update_time:CoreTypes.Timestamp.t ->
      ?create_time:CoreTypes.Timestamp.t ->
        ?list_update_token:string ->
          ?list_id:string ->
            protocols_list:string list ->
              list_name:string -> unit -> protocols_list_data
val make_put_protocols_list_response :
  ?protocols_list_arn:string ->
    ?protocols_list:protocols_list_data ->
      unit -> put_protocols_list_response
val make_put_protocols_list_request :
  ?tag_list:tag list ->
    protocols_list:protocols_list_data -> unit -> put_protocols_list_request
val make_policy :
  ?policy_status:customer_policy_status ->
    ?policy_description:string ->
      ?resource_set_ids:string list ->
        ?exclude_map:customer_policy_scope_map ->
          ?include_map:customer_policy_scope_map ->
            ?delete_unused_fm_managed_resources:bool ->
              ?resource_tags:resource_tag list ->
                ?resource_type_list:string list ->
                  ?policy_update_token:string ->
                    ?policy_id:string ->
                      remediation_enabled:bool ->
                        exclude_resource_tags:bool ->
                          resource_type:string ->
                            security_service_policy_data:security_service_policy_data
                              -> policy_name:string -> unit -> policy
val make_put_policy_response :
  ?policy_arn:string -> ?policy:policy -> unit -> put_policy_response
val make_put_policy_request :
  ?tag_list:tag list -> policy:policy -> unit -> put_policy_request
val make_put_notification_channel_request :
  sns_role_name:string ->
    sns_topic_arn:string -> unit -> put_notification_channel_request
val make_app : port:int -> protocol:string -> app_name:string -> unit -> app
val make_apps_list_data :
  ?previous_apps_list:previous_apps_list ->
    ?last_update_time:CoreTypes.Timestamp.t ->
      ?create_time:CoreTypes.Timestamp.t ->
        ?list_update_token:string ->
          ?list_id:string ->
            apps_list:app list -> list_name:string -> unit -> apps_list_data
val make_put_apps_list_response :
  ?apps_list_arn:string ->
    ?apps_list:apps_list_data -> unit -> put_apps_list_response
val make_put_apps_list_request :
  ?tag_list:tag list ->
    apps_list:apps_list_data -> unit -> put_apps_list_request
val make_account_scope :
  ?exclude_specified_accounts:bool ->
    ?all_accounts_enabled:bool ->
      ?accounts:string list -> unit -> account_scope
val make_organizational_unit_scope :
  ?exclude_specified_organizational_units:bool ->
    ?all_organizational_units_enabled:bool ->
      ?organizational_units:string list -> unit -> organizational_unit_scope
val make_policy_type_scope :
  ?all_policy_types_enabled:bool ->
    ?policy_types:security_service_type list -> unit -> policy_type_scope
val make_admin_scope :
  ?policy_type_scope:policy_type_scope ->
    ?region_scope:region_scope ->
      ?organizational_unit_scope:organizational_unit_scope ->
        ?account_scope:account_scope -> unit -> admin_scope
val make_put_admin_account_request :
  ?admin_scope:admin_scope ->
    admin_account:string -> unit -> put_admin_account_request
val make_protocols_list_data_summary :
  ?protocols_list:string list ->
    ?list_name:string ->
      ?list_id:string ->
        ?list_arn:string -> unit -> protocols_list_data_summary
val make_policy_summary :
  ?policy_status:customer_policy_status ->
    ?delete_unused_fm_managed_resources:bool ->
      ?remediation_enabled:bool ->
        ?security_service_type:security_service_type ->
          ?resource_type:string ->
            ?policy_name:string ->
              ?policy_id:string ->
                ?policy_arn:string -> unit -> policy_summary
val make_policy_compliance_status :
  ?issue_info_map:issue_info_map ->
    ?last_updated:CoreTypes.Timestamp.t ->
      ?evaluation_results:evaluation_result list ->
        ?member_account:string ->
          ?policy_name:string ->
            ?policy_id:string ->
              ?policy_owner:string -> unit -> policy_compliance_status
val make_compliance_violator :
  ?metadata:compliance_violator_metadata ->
    ?resource_type:string ->
      ?violation_reason:violation_reason ->
        ?resource_id:string -> unit -> compliance_violator
val make_policy_compliance_detail :
  ?issue_info_map:issue_info_map ->
    ?expired_at:CoreTypes.Timestamp.t ->
      ?evaluation_limit_exceeded:bool ->
        ?violators:compliance_violator list ->
          ?member_account:string ->
            ?policy_id:string ->
              ?policy_owner:string -> unit -> policy_compliance_detail
val make_list_third_party_firewall_firewall_policies_response :
  ?next_token:string ->
    ?third_party_firewall_firewall_policies:third_party_firewall_firewall_policy
      list -> unit -> list_third_party_firewall_firewall_policies_response
val make_list_third_party_firewall_firewall_policies_request :
  ?next_token:string ->
    max_results:int ->
      third_party_firewall:third_party_firewall ->
        unit -> list_third_party_firewall_firewall_policies_request
val make_list_tags_for_resource_response :
  ?tag_list:tag list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_arn:string -> unit -> list_tags_for_resource_request
val make_list_resource_sets_response :
  ?next_token:string ->
    ?resource_sets:resource_set_summary list ->
      unit -> list_resource_sets_response
val make_list_resource_sets_request :
  ?max_results:int ->
    ?next_token:string -> unit -> list_resource_sets_request
val make_list_resource_set_resources_response :
  ?next_token:string ->
    items:resource list -> unit -> list_resource_set_resources_response
val make_list_resource_set_resources_request :
  ?next_token:string ->
    ?max_results:int ->
      identifier:string -> unit -> list_resource_set_resources_request
val make_list_protocols_lists_response :
  ?next_token:string ->
    ?protocols_lists:protocols_list_data_summary list ->
      unit -> list_protocols_lists_response
val make_list_protocols_lists_request :
  ?next_token:string ->
    ?default_lists:bool ->
      max_results:int -> unit -> list_protocols_lists_request
val make_list_policies_response :
  ?next_token:string ->
    ?policy_list:policy_summary list -> unit -> list_policies_response
val make_list_policies_request :
  ?max_results:int -> ?next_token:string -> unit -> list_policies_request
val make_list_member_accounts_response :
  ?next_token:string ->
    ?member_accounts:string list -> unit -> list_member_accounts_response
val make_list_member_accounts_request :
  ?max_results:int ->
    ?next_token:string -> unit -> list_member_accounts_request
val make_discovered_resource :
  ?name:string ->
    ?type_:string ->
      ?account_id:string -> ?ur_i:string -> unit -> discovered_resource
val make_list_discovered_resources_response :
  ?next_token:string ->
    ?items:discovered_resource list ->
      unit -> list_discovered_resources_response
val make_list_discovered_resources_request :
  ?next_token:string ->
    ?max_results:int ->
      resource_type:string ->
        member_account_ids:string list ->
          unit -> list_discovered_resources_request
val make_list_compliance_status_response :
  ?next_token:string ->
    ?policy_compliance_status_list:policy_compliance_status list ->
      unit -> list_compliance_status_response
val make_list_compliance_status_request :
  ?max_results:int ->
    ?next_token:string ->
      policy_id:string -> unit -> list_compliance_status_request
val make_apps_list_data_summary :
  ?apps_list:app list ->
    ?list_name:string ->
      ?list_id:string -> ?list_arn:string -> unit -> apps_list_data_summary
val make_list_apps_lists_response :
  ?next_token:string ->
    ?apps_lists:apps_list_data_summary list ->
      unit -> list_apps_lists_response
val make_list_apps_lists_request :
  ?next_token:string ->
    ?default_lists:bool -> max_results:int -> unit -> list_apps_lists_request
val make_list_admins_managing_account_response :
  ?next_token:string ->
    ?admin_accounts:string list ->
      unit -> list_admins_managing_account_response
val make_list_admins_managing_account_request :
  ?max_results:int ->
    ?next_token:string -> unit -> list_admins_managing_account_request
val make_admin_account_summary :
  ?status:organization_status ->
    ?default_admin:bool ->
      ?admin_account:string -> unit -> admin_account_summary
val make_list_admin_accounts_for_organization_response :
  ?next_token:string ->
    ?admin_accounts:admin_account_summary list ->
      unit -> list_admin_accounts_for_organization_response
val make_list_admin_accounts_for_organization_request :
  ?max_results:int ->
    ?next_token:string ->
      unit -> list_admin_accounts_for_organization_request
val make_get_violation_details_response :
  ?violation_detail:violation_detail ->
    unit -> get_violation_details_response
val make_get_violation_details_request :
  resource_type:string ->
    resource_id:string ->
      member_account:string ->
        policy_id:string -> unit -> get_violation_details_request
val make_get_third_party_firewall_association_status_response :
  ?marketplace_onboarding_status:marketplace_subscription_onboarding_status
    ->
    ?third_party_firewall_status:third_party_firewall_association_status ->
      unit -> get_third_party_firewall_association_status_response
val make_get_third_party_firewall_association_status_request :
  third_party_firewall:third_party_firewall ->
    unit -> get_third_party_firewall_association_status_request
val make_get_resource_set_response :
  resource_set_arn:string ->
    resource_set:resource_set -> unit -> get_resource_set_response
val make_get_resource_set_request :
  identifier:string -> unit -> get_resource_set_request
val make_get_protocols_list_response :
  ?protocols_list_arn:string ->
    ?protocols_list:protocols_list_data ->
      unit -> get_protocols_list_response
val make_get_protocols_list_request :
  ?default_list:bool -> list_id:string -> unit -> get_protocols_list_request
val make_get_protection_status_response :
  ?next_token:string ->
    ?data:string ->
      ?service_type:security_service_type ->
        ?admin_account_id:string -> unit -> get_protection_status_response
val make_get_protection_status_request :
  ?max_results:int ->
    ?next_token:string ->
      ?end_time:CoreTypes.Timestamp.t ->
        ?start_time:CoreTypes.Timestamp.t ->
          ?member_account_id:string ->
            policy_id:string -> unit -> get_protection_status_request
val make_get_policy_response :
  ?policy_arn:string -> ?policy:policy -> unit -> get_policy_response
val make_get_policy_request : policy_id:string -> unit -> get_policy_request
val make_get_notification_channel_response :
  ?sns_role_name:string ->
    ?sns_topic_arn:string -> unit -> get_notification_channel_response
val make_get_notification_channel_request :
  unit -> get_notification_channel_request
val make_get_compliance_detail_response :
  ?policy_compliance_detail:policy_compliance_detail ->
    unit -> get_compliance_detail_response
val make_get_compliance_detail_request :
  member_account:string ->
    policy_id:string -> unit -> get_compliance_detail_request
val make_get_apps_list_response :
  ?apps_list_arn:string ->
    ?apps_list:apps_list_data -> unit -> get_apps_list_response
val make_get_apps_list_request :
  ?default_list:bool -> list_id:string -> unit -> get_apps_list_request
val make_get_admin_scope_response :
  ?status:organization_status ->
    ?admin_scope:admin_scope -> unit -> get_admin_scope_response
val make_get_admin_scope_request :
  admin_account:string -> unit -> get_admin_scope_request
val make_get_admin_account_response :
  ?role_status:account_role_status ->
    ?admin_account:string -> unit -> get_admin_account_response
val make_get_admin_account_request : unit -> get_admin_account_request
val make_failed_item :
  ?reason:failed_item_reason -> ?ur_i:string -> unit -> failed_item
val make_disassociate_third_party_firewall_response :
  ?third_party_firewall_status:third_party_firewall_association_status ->
    unit -> disassociate_third_party_firewall_response
val make_disassociate_third_party_firewall_request :
  third_party_firewall:third_party_firewall ->
    unit -> disassociate_third_party_firewall_request
val make_disassociate_admin_account_request :
  unit -> disassociate_admin_account_request
val make_delete_resource_set_request :
  identifier:string -> unit -> delete_resource_set_request
val make_delete_protocols_list_request :
  list_id:string -> unit -> delete_protocols_list_request
val make_delete_policy_request :
  ?delete_all_policy_resources:bool ->
    policy_id:string -> unit -> delete_policy_request
val make_delete_notification_channel_request :
  unit -> delete_notification_channel_request
val make_delete_apps_list_request :
  list_id:string -> unit -> delete_apps_list_request
val make_batch_disassociate_resource_response :
  failed_items:failed_item list ->
    resource_set_identifier:string ->
      unit -> batch_disassociate_resource_response
val make_batch_disassociate_resource_request :
  items:string list ->
    resource_set_identifier:string ->
      unit -> batch_disassociate_resource_request
val make_batch_associate_resource_response :
  failed_items:failed_item list ->
    resource_set_identifier:string ->
      unit -> batch_associate_resource_response
val make_batch_associate_resource_request :
  items:string list ->
    resource_set_identifier:string ->
      unit -> batch_associate_resource_request
val make_associate_third_party_firewall_response :
  ?third_party_firewall_status:third_party_firewall_association_status ->
    unit -> associate_third_party_firewall_response
val make_associate_third_party_firewall_request :
  third_party_firewall:third_party_firewall ->
    unit -> associate_third_party_firewall_request
val make_associate_admin_account_request :
  admin_account:string -> unit -> associate_admin_account_request(** {1:operations Operations} *)

module AssociateAdminAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_admin_account_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Sets a Firewall Manager default administrator account. The Firewall Manager default administrator account can manage third-party firewalls and has full administrative scope that allows administration of all policy types, accounts, organizational units, and Regions. This account must be a member account of the organization in Organizations whose resources you want to protect.

 For information about working with Firewall Manager administrator accounts, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/fms-administrators.html}Managing Firewall Manager administrators} in the {i Firewall Manager Developer Guide}.
  *)

  
end

module AssociateThirdPartyFirewall : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_third_party_firewall_request ->
        (associate_third_party_firewall_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Sets the Firewall Manager policy administrator as a tenant administrator of a third-party firewall service. A tenant is an instance of the third-party firewall service that's associated with your Amazon Web Services customer account.
 *)

  
end

module BatchAssociateResource : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_associate_resource_request ->
        (batch_associate_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Associate resources to a Firewall Manager resource set.
 *)

  
end

module BatchDisassociateResource : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_disassociate_resource_request ->
        (batch_disassociate_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Disassociates resources from a Firewall Manager resource set.
 *)

  
end

module DeleteAppsList : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_apps_list_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Permanently deletes an Firewall Manager applications list.
 *)

  
end

module DeleteNotificationChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_notification_channel_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Deletes an Firewall Manager association with the IAM role and the Amazon Simple Notification Service (SNS) topic that is used to record Firewall Manager SNS logs.
 *)

  
end

module DeletePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_policy_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Permanently deletes an Firewall Manager policy. 
 *)

  
end

module DeleteProtocolsList : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_protocols_list_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Permanently deletes an Firewall Manager protocols list.
 *)

  
end

module DeleteResourceSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_set_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Deletes the specified [ResourceSet].
 *)

  
end

module DisassociateAdminAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_admin_account_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Disassociates an Firewall Manager administrator account. To set a different account as an Firewall Manager administrator, submit a [PutAdminAccount] request. To set an account as a default administrator account, you must submit an [AssociateAdminAccount] request.

 Disassociation of the default administrator account follows the first in, last out principle. If you are the default administrator, all Firewall Manager administrators within the organization must first disassociate their accounts before you can disassociate your account.
  *)

  
end

module DisassociateThirdPartyFirewall : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_third_party_firewall_request ->
        (disassociate_third_party_firewall_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Disassociates a Firewall Manager policy administrator from a third-party firewall tenant. When you call [DisassociateThirdPartyFirewall], the third-party firewall vendor deletes all of the firewalls that are associated with the account.
 *)

  
end

module GetAdminAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      get_admin_account_request ->
        (get_admin_account_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns the Organizations account that is associated with Firewall Manager as the Firewall Manager default administrator.
 *)

  
end

module GetAdminScope : sig
  val request :
    Smaws_Lib.Context.t ->
      get_admin_scope_request ->
        (get_admin_scope_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns information about the specified account's administrative scope. The administrative scope defines the resources that an Firewall Manager administrator can manage.
 *)

  
end

module GetAppsList : sig
  val request :
    Smaws_Lib.Context.t ->
      get_apps_list_request ->
        (get_apps_list_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns information about the specified Firewall Manager applications list.
 *)

  
end

module GetComplianceDetail : sig
  val request :
    Smaws_Lib.Context.t ->
      get_compliance_detail_request ->
        (get_compliance_detail_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns detailed compliance information about the specified member account. Details include resources that are in and out of compliance with the specified policy. 

 The reasons for resources being considered compliant depend on the Firewall Manager policy type. 
  *)

  
end

module GetNotificationChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      get_notification_channel_request ->
        (get_notification_channel_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Information about the Amazon Simple Notification Service (SNS) topic that is used to record Firewall Manager SNS logs.
 *)

  
end

module GetPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_policy_request ->
        (get_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidTypeException of invalid_type_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns information about the specified Firewall Manager policy.
 *)

  
end

module GetProtectionStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_protection_status_request ->
        (get_protection_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** If you created a Shield Advanced policy, returns policy-level attack summary information in the event of a potential DDoS attack. Other policy types are currently unsupported.
 *)

  
end

module GetProtocolsList : sig
  val request :
    Smaws_Lib.Context.t ->
      get_protocols_list_request ->
        (get_protocols_list_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns information about the specified Firewall Manager protocols list.
 *)

  
end

module GetResourceSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_set_request ->
        (get_resource_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Gets information about a specific resource set.
 *)

  
end

module GetThirdPartyFirewallAssociationStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_third_party_firewall_association_status_request ->
        (get_third_party_firewall_association_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** The onboarding status of a Firewall Manager admin account to third-party firewall vendor tenant.
 *)

  
end

module GetViolationDetails : sig
  val request :
    Smaws_Lib.Context.t ->
      get_violation_details_request ->
        (get_violation_details_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Retrieves violations for a resource based on the specified Firewall Manager policy and Amazon Web Services account.
 *)

  
end

module ListAdminAccountsForOrganization : sig
  val request :
    Smaws_Lib.Context.t ->
      list_admin_accounts_for_organization_request ->
        (list_admin_accounts_for_organization_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns a [AdminAccounts] object that lists the Firewall Manager administrators within the organization that are onboarded to Firewall Manager by [AssociateAdminAccount].

 This operation can be called only from the organization's management account.
  *)

  
end

module ListAdminsManagingAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      list_admins_managing_account_request ->
        (list_admins_managing_account_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Lists the accounts that are managing the specified Organizations member account. This is useful for any member account so that they can view the accounts who are managing their account. This operation only returns the managing administrators that have the requested account within their [AdminScope].
 *)

  
end

module ListAppsLists : sig
  val request :
    Smaws_Lib.Context.t ->
      list_apps_lists_request ->
        (list_apps_lists_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns an array of [AppsListDataSummary] objects.
 *)

  
end

module ListComplianceStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      list_compliance_status_request ->
        (list_compliance_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns an array of [PolicyComplianceStatus] objects. Use [PolicyComplianceStatus] to get a summary of which member accounts are protected by the specified policy. 
 *)

  
end

module ListDiscoveredResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_discovered_resources_request ->
        (list_discovered_resources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            
        ]
      ) result
  (** Returns an array of resources in the organization's accounts that are available to be associated with a resource set.
 *)

  
end

module ListMemberAccounts : sig
  val request :
    Smaws_Lib.Context.t ->
      list_member_accounts_request ->
        (list_member_accounts_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns a [MemberAccounts] object that lists the member accounts in the administrator's Amazon Web Services organization.

 Either an Firewall Manager administrator or the organization's management account can make this request.
  *)

  
end

module ListPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_policies_request ->
        (list_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns an array of [PolicySummary] objects.
 *)

  
end

module ListProtocolsLists : sig
  val request :
    Smaws_Lib.Context.t ->
      list_protocols_lists_request ->
        (list_protocols_lists_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns an array of [ProtocolsListDataSummary] objects.
 *)

  
end

module ListResourceSetResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_set_resources_request ->
        (list_resource_set_resources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns an array of resources that are currently associated to a resource set.
 *)

  
end

module ListResourceSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_sets_request ->
        (list_resource_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            
        ]
      ) result
  (** Returns an array of [ResourceSetSummary] objects.
 *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Retrieves the list of tags for the specified Amazon Web Services resource. 
 *)

  
end

module ListThirdPartyFirewallFirewallPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_third_party_firewall_firewall_policies_request ->
        (list_third_party_firewall_firewall_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Retrieves a list of all of the third-party firewall policies that are associated with the third-party firewall administrator's account.
 *)

  
end

module PutAdminAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      put_admin_account_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** Creates or updates an Firewall Manager administrator account. The account must be a member of the organization that was onboarded to Firewall Manager by [AssociateAdminAccount]. Only the organization's management account can create an Firewall Manager administrator account. When you create an Firewall Manager administrator account, the service checks to see if the account is already a delegated administrator within Organizations. If the account isn't a delegated administrator, Firewall Manager calls Organizations to delegate the account within Organizations. For more information about administrator accounts within Organizations, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts.html}Managing the Amazon Web Services Accounts in Your Organization}.
 *)

  
end

module PutAppsList : sig
  val request :
    Smaws_Lib.Context.t ->
      put_apps_list_request ->
        (put_apps_list_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Creates an Firewall Manager applications list.
 *)

  
end

module PutNotificationChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      put_notification_channel_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Designates the IAM role and Amazon Simple Notification Service (SNS) topic that Firewall Manager uses to record SNS logs.

 To perform this action outside of the console, you must first configure the SNS topic's access policy to allow the [SnsRoleName] to publish SNS logs. If the [SnsRoleName] provided is a role other than the [AWSServiceRoleForFMS] service-linked role, this role must have a trust relationship configured to allow the Firewall Manager service principal [fms.amazonaws.com] to assume this role. For information about configuring an SNS access policy, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/fms-security_iam_service-with-iam.html#fms-security_iam_service-with-iam-roles-service}Service roles for Firewall Manager} in the {i Firewall Manager Developer Guide}.
  *)

  
end

module PutPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      put_policy_request ->
        (put_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidTypeException of invalid_type_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Creates an Firewall Manager policy.

 A Firewall Manager policy is specific to the individual policy type. If you want to enforce multiple policy types across accounts, you can create multiple policies. You can create more than one policy for each type. 
 
  If you add a new account to an organization that you created with Organizations, Firewall Manager automatically applies the policy to the resources in that account that are within scope of the policy. 
  
   Firewall Manager provides the following types of policies: 
   
    {ul
          {-   {b WAF policy} - This policy applies WAF web ACL protections to specified accounts and resources. 
              
               }
          {-   {b Shield Advanced policy} - This policy applies Shield Advanced protection to specified accounts and resources. 
              
               }
          {-   {b Security Groups policy} - This type of policy gives you control over security groups that are in use throughout your organization in Organizations and lets you enforce a baseline set of rules across your organization. 
              
               }
          {-   {b Network ACL policy} - This type of policy gives you control over the network ACLs that are in use throughout your organization in Organizations and lets you enforce a baseline set of first and last network ACL rules across your organization. 
              
               }
          {-   {b Network Firewall policy} - This policy applies Network Firewall protection to your organization's VPCs. 
              
               }
          {-   {b DNS Firewall policy} - This policy applies Amazon Route 53 Resolver DNS Firewall protections to your organization's VPCs. 
              
               }
          {-   {b Third-party firewall policy} - This policy applies third-party firewall protections. Third-party firewalls are available by subscription through the Amazon Web Services Marketplace console at {{:http://aws.amazon.com/marketplace}Amazon Web Services Marketplace}.
              
               {ul
                     {-   {b Palo Alto Networks Cloud NGFW policy} - This policy applies Palo Alto Networks Cloud Next Generation Firewall (NGFW) protections and Palo Alto Networks Cloud NGFW rulestacks to your organization's VPCs.
                         
                          }
                     {-   {b Fortigate CNF policy} - This policy applies Fortigate Cloud Native Firewall (CNF) protections. Fortigate CNF is a cloud-centered solution that blocks Zero-Day threats and secures cloud infrastructures with industry-leading advanced threat prevention, smart web application firewalls (WAF), and API protection.
                         
                          }
                     
           }
            }
          }
   *)

  
end

module PutProtocolsList : sig
  val request :
    Smaws_Lib.Context.t ->
      put_protocols_list_request ->
        (put_protocols_list_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Creates an Firewall Manager protocols list.
 *)

  
end

module PutResourceSet : sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_set_request ->
        (put_resource_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** Creates the resource set.

 An Firewall Manager resource set defines the resources to import into an Firewall Manager policy from another Amazon Web Services service.
  *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Adds one or more tags to an Amazon Web Services resource.
 *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Removes one or more tags from an Amazon Web Services resource.
 *)

  
end

