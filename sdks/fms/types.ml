open Smaws_Lib.CoreTypes
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "fms";
      endpointPrefix = "fms";
      version = "2018-01-01";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec violation_target = string
type nonrec base_unit = unit
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
  | WebAclMissingRuleGroup 
type nonrec policy_id = string
type nonrec aws_account_id = string
type nonrec resource_id = string
type nonrec resource_type = string
type nonrec length_bounded_string = string
type nonrec reference_rule = string
type nonrec target_violation_reason = string
type nonrec target_violation_reasons = string list option list
type nonrec partial_match =
  {
  target_violation_reasons: string list option ;
  reference: string option }
type nonrec partial_matches = partial_match list option list
type nonrec remediation_action_type =
  | Modify 
  | Remove 
type nonrec remediation_action_description = string
type nonrec cid_r = string
type nonrec ip_port_number = int
type nonrec security_group_rule_description =
  {
  to_port: int option ;
  from_port: int option ;
  protocol: string option ;
  prefix_list_id: string option ;
  ipv6_range: string option ;
  ipv4_range: string option }
type nonrec boolean_ = bool
type nonrec security_group_remediation_action =
  {
  is_default_action: bool option ;
  remediation_result: security_group_rule_description option ;
  description: string option ;
  remediation_action_type: remediation_action_type option }
type nonrec security_group_remediation_actions =
  security_group_remediation_action list option list
type nonrec aws_vpc_security_group_violation =
  {
  possible_security_group_remediation_actions:
    security_group_remediation_action list option ;
  partial_matches: partial_match list option ;
  violation_target_description: string option ;
  violation_target: string option }
type nonrec resource_id_list = string list option list
type nonrec aws_ec2_network_interface_violation =
  {
  violating_security_groups: string list option ;
  violation_target: string option }
type nonrec aws_ec2_network_interface_violations =
  aws_ec2_network_interface_violation list option list
type nonrec aws_ec2_instance_violation =
  {
  aws_ec2_network_interface_violations:
    aws_ec2_network_interface_violation list option ;
  violation_target: string option }
type nonrec network_firewall_missing_firewall_violation =
  {
  target_violation_reason: string option ;
  availability_zone: string option ;
  vp_c: string option ;
  violation_target: string option }
type nonrec network_firewall_missing_subnet_violation =
  {
  target_violation_reason: string option ;
  availability_zone: string option ;
  vp_c: string option ;
  violation_target: string option }
type nonrec network_firewall_missing_expected_rt_violation =
  {
  expected_route_table: string option ;
  current_route_table: string option ;
  availability_zone: string option ;
  vp_c: string option ;
  violation_target: string option }
type nonrec network_firewall_resource_name = string
type nonrec stateless_rule_group_priority = int
type nonrec stateless_rule_group =
  {
  priority: int option ;
  resource_id: string option ;
  rule_group_name: string option }
type nonrec stateless_rule_group_list = stateless_rule_group list option list
type nonrec network_firewall_action = string
type nonrec network_firewall_action_list = string list option list
type nonrec priority_number = int
type nonrec network_firewall_override_action =
  | DROP_TO_ALERT 
type nonrec network_firewall_stateful_rule_group_override =
  {
  action: network_firewall_override_action option }
type nonrec stateful_rule_group =
  {
  override: network_firewall_stateful_rule_group_override option ;
  priority: int option ;
  resource_id: string option ;
  rule_group_name: string option }
type nonrec stateful_rule_group_list = stateful_rule_group list option list
type nonrec rule_order =
  | DEFAULT_ACTION_ORDER 
  | STRICT_ORDER 
type nonrec stream_exception_policy =
  | FMS_IGNORE 
  | REJECT 
  | CONTINUE 
  | DROP 
type nonrec stateful_engine_options =
  {
  stream_exception_policy: stream_exception_policy option ;
  rule_order: rule_order option }
type nonrec network_firewall_policy_description =
  {
  stateful_engine_options: stateful_engine_options option ;
  stateful_default_actions: string list option ;
  stateful_rule_groups: stateful_rule_group list option ;
  stateless_custom_actions: string list option ;
  stateless_fragment_default_actions: string list option ;
  stateless_default_actions: string list option ;
  stateless_rule_groups: stateless_rule_group list option }
type nonrec network_firewall_policy_modified_violation =
  {
  expected_policy_description: network_firewall_policy_description option ;
  current_policy_description: network_firewall_policy_description option ;
  violation_target: string option }
type nonrec destination_type =
  | PrefixList 
  | IPV6 
  | IPV4 
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
  | Gateway 
type nonrec route =
  {
  target: string option ;
  destination: string option ;
  target_type: target_type option ;
  destination_type: destination_type option }
type nonrec routes = route list option list
type nonrec length_bounded_string_list = string list option list
type nonrec expected_route =
  {
  route_table_id: string option ;
  allowed_targets: string list option ;
  contributing_subnets: string list option ;
  ip_v6_cidr: string option ;
  prefix_list_id: string option ;
  ip_v4_cidr: string option }
type nonrec expected_routes = expected_route list option list
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
  subnet_id: string option }
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
  affected_subnets: string list option }
type nonrec network_firewall_black_hole_route_detected_violation =
  {
  violating_routes: route list option ;
  vpc_id: string option ;
  route_table_id: string option ;
  violation_target: string option }
type nonrec network_firewall_unexpected_firewall_routes_violation =
  {
  vpc_id: string option ;
  firewall_endpoint: string option ;
  route_table_id: string option ;
  violating_routes: route list option ;
  firewall_subnet_id: string option }
type nonrec network_firewall_unexpected_gateway_routes_violation =
  {
  vpc_id: string option ;
  route_table_id: string option ;
  violating_routes: route list option ;
  gateway_id: string option }
type nonrec network_firewall_missing_expected_routes_violation =
  {
  vpc_id: string option ;
  expected_routes: expected_route list option ;
  violation_target: string option }
type nonrec dns_rule_group_priority = int
type nonrec dns_rule_group_priorities = int list option list
type nonrec dns_rule_group_priority_conflict_violation =
  {
  unavailable_priorities: int list option ;
  conflicting_policy_id: string option ;
  conflicting_priority: int option ;
  violation_target_description: string option ;
  violation_target: string option }
type nonrec dns_duplicate_rule_group_violation =
  {
  violation_target_description: string option ;
  violation_target: string option }
type nonrec basic_integer = int
type nonrec dns_rule_group_limit_exceeded_violation =
  {
  number_of_rule_groups_already_associated: int option ;
  violation_target_description: string option ;
  violation_target: string option }
type nonrec firewall_subnet_is_out_of_scope_violation =
  {
  vpc_endpoint_id: string option ;
  subnet_availability_zone_id: string option ;
  subnet_availability_zone: string option ;
  vpc_id: string option ;
  firewall_subnet_id: string option }
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
  subnet_id: string option }
type nonrec third_party_firewall_missing_firewall_violation =
  {
  target_violation_reason: string option ;
  availability_zone: string option ;
  vp_c: string option ;
  violation_target: string option }
type nonrec third_party_firewall_missing_subnet_violation =
  {
  target_violation_reason: string option ;
  availability_zone: string option ;
  vp_c: string option ;
  violation_target: string option }
type nonrec third_party_firewall_missing_expected_route_table_violation =
  {
  expected_route_table: string option ;
  current_route_table: string option ;
  availability_zone: string option ;
  vp_c: string option ;
  violation_target: string option }
type nonrec firewall_subnet_missing_vpc_endpoint_violation =
  {
  subnet_availability_zone_id: string option ;
  subnet_availability_zone: string option ;
  vpc_id: string option ;
  firewall_subnet_id: string option }
type nonrec integer_object = int
type nonrec network_acl_icmp_type_code =
  {
  type_: int option ;
  code: int option }
type nonrec ip_port_number_integer = int
type nonrec network_acl_port_range = {
  to_: int option ;
  from_: int option }
type nonrec length_bounded_non_empty_string = string
type nonrec network_acl_rule_action =
  | DENY 
  | ALLOW 
type nonrec boolean_object = bool
type nonrec network_acl_entry =
  {
  egress: bool ;
  rule_action: network_acl_rule_action ;
  ipv6_cidr_block: string option ;
  cidr_block: string option ;
  port_range: network_acl_port_range option ;
  protocol: string ;
  icmp_type_code: network_acl_icmp_type_code option }
type nonrec integer_object_minimum0 = int
type nonrec entry_type =
  | CustomEntry 
  | FMSManagedLastEntry 
  | FMSManagedFirstEntry 
type nonrec entry_description =
  {
  entry_type: entry_type option ;
  entry_rule_number: int option ;
  entry_detail: network_acl_entry option }
type nonrec entries_with_conflicts = entry_description list option list
type nonrec entry_violation_reason =
  | EntryConflict 
  | IncorrectEntryOrder 
  | MissingExpectedEntry 
type nonrec entry_violation_reasons = entry_violation_reason list option list
type nonrec entry_violation =
  {
  entry_violation_reasons: entry_violation_reason list option ;
  entries_with_conflicts: entry_description list option ;
  entry_at_expected_evaluation_order: entry_description option ;
  actual_evaluation_order: string option ;
  expected_evaluation_order: string option ;
  expected_entry: entry_description option }
type nonrec entry_violations = entry_violation list option list
type nonrec invalid_network_acl_entries_violation =
  {
  entry_violations: entry_violation list option ;
  current_associated_network_acl: string option ;
  subnet_availability_zone: string option ;
  subnet: string option ;
  vpc: string option }
type nonrec action_target =
  {
  description: string option ;
  resource_id: string option }
type nonrec ec2_create_route_action =
  {
  route_table_id: action_target ;
  gateway_id: action_target option ;
  vpc_endpoint_id: action_target option ;
  destination_ipv6_cidr_block: string option ;
  destination_prefix_list_id: string option ;
  destination_cidr_block: string option ;
  description: string option }
type nonrec ec2_replace_route_action =
  {
  route_table_id: action_target ;
  gateway_id: action_target option ;
  destination_ipv6_cidr_block: string option ;
  destination_prefix_list_id: string option ;
  destination_cidr_block: string option ;
  description: string option }
type nonrec ec2_delete_route_action =
  {
  route_table_id: action_target ;
  destination_ipv6_cidr_block: string option ;
  destination_prefix_list_id: string option ;
  destination_cidr_block: string option ;
  description: string option }
type nonrec ec2_copy_route_table_action =
  {
  route_table_id: action_target ;
  vpc_id: action_target ;
  description: string option }
type nonrec ec2_replace_route_table_association_action =
  {
  route_table_id: action_target ;
  association_id: action_target ;
  description: string option }
type nonrec ec2_associate_route_table_action =
  {
  gateway_id: action_target option ;
  subnet_id: action_target option ;
  route_table_id: action_target ;
  description: string option }
type nonrec ec2_create_route_table_action =
  {
  vpc_id: action_target ;
  description: string option }
type nonrec managed_service_data = string
type nonrec fms_policy_update_firewall_creation_config_action =
  {
  firewall_creation_config: string option ;
  description: string option }
type nonrec create_network_acl_action =
  {
  fms_can_remediate: bool option ;
  vpc: action_target option ;
  description: string option }
type nonrec replace_network_acl_association_action =
  {
  fms_can_remediate: bool option ;
  network_acl_id: action_target option ;
  association_id: action_target option ;
  description: string option }
type nonrec entries_description = entry_description list option list
type nonrec create_network_acl_entries_action =
  {
  fms_can_remediate: bool option ;
  network_acl_entries_to_be_created: entry_description list option ;
  network_acl_id: action_target option ;
  description: string option }
type nonrec delete_network_acl_entries_action =
  {
  fms_can_remediate: bool option ;
  network_acl_entries_to_be_deleted: entry_description list option ;
  network_acl_id: action_target option ;
  description: string option }
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
  description: string option }
type nonrec remediation_action_with_order =
  {
  order: int option ;
  remediation_action: remediation_action option }
type nonrec ordered_remediation_actions =
  remediation_action_with_order list option list
type nonrec possible_remediation_action =
  {
  is_default_action: bool option ;
  ordered_remediation_actions: remediation_action_with_order list ;
  description: string option }
type nonrec possible_remediation_action_list =
  possible_remediation_action list option list
type nonrec possible_remediation_actions =
  {
  actions: possible_remediation_action list option ;
  description: string option }
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
type nonrec resource_violations = resource_violation list option list
type nonrec tag_key = string
type nonrec tag_value = string
type nonrec tag = {
  value: string ;
  key: string }
type nonrec tag_list = tag list option list
type nonrec violation_detail =
  {
  resource_description: string option ;
  resource_tags: tag list option ;
  resource_violations: resource_violation list ;
  resource_type: string ;
  resource_id: string ;
  member_account: string ;
  policy_id: string }
type nonrec update_token = string
type nonrec untag_resource_response = unit
type nonrec resource_arn = string
type nonrec tag_key_list = string list option list
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_arn: string }
type nonrec error_message = string
type nonrec resource_not_found_exception = {
  message: string option }
type nonrec invalid_operation_exception = {
  message: string option }
type nonrec invalid_input_exception = {
  message: string option }
type nonrec internal_error_exception = {
  message: string option }
type nonrec time_stamp = Timestamp.t
type nonrec firewall_deployment_model =
  | DISTRIBUTED 
  | CENTRALIZED 
type nonrec third_party_firewall_policy =
  {
  firewall_deployment_model: firewall_deployment_model option }
type nonrec firewall_policy_id = string
type nonrec firewall_policy_name = string
type nonrec third_party_firewall_firewall_policy =
  {
  firewall_policy_name: string option ;
  firewall_policy_id: string option }
type nonrec third_party_firewall_firewall_policies =
  third_party_firewall_firewall_policy list option list
type nonrec third_party_firewall_association_status =
  | NOT_EXIST 
  | OFFBOARD_COMPLETE 
  | OFFBOARDING 
  | ONBOARD_COMPLETE 
  | ONBOARDING 
type nonrec third_party_firewall =
  | FORTIGATE_CLOUD_NATIVE_FIREWALL 
  | PALO_ALTO_NETWORKS_CLOUD_NGFW 
type nonrec tag_resource_response = unit
type nonrec tag_resource_request =
  {
  tag_list: tag list ;
  resource_arn: string }
type nonrec limit_exceeded_exception = {
  message: string option }
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
  | WAF 
type nonrec security_service_type_list =
  security_service_type list option list
type nonrec network_firewall_policy =
  {
  firewall_deployment_model: firewall_deployment_model option }
type nonrec network_acl_entries = network_acl_entry list option list
type nonrec network_acl_entry_set =
  {
  force_remediate_for_last_entries: bool ;
  last_entries: network_acl_entry list option ;
  force_remediate_for_first_entries: bool ;
  first_entries: network_acl_entry list option }
type nonrec network_acl_common_policy =
  {
  network_acl_entry_set: network_acl_entry_set }
type nonrec policy_option =
  {
  network_acl_common_policy: network_acl_common_policy option ;
  third_party_firewall_policy: third_party_firewall_policy option ;
  network_firewall_policy: network_firewall_policy option }
type nonrec security_service_policy_data =
  {
  policy_option: policy_option option ;
  managed_service_data: string option ;
  type_: security_service_type }
type nonrec resource_type_list = string list option list
type nonrec resource_tag_key = string
type nonrec resource_tag_value = string
type nonrec resource_tag = {
  value: string option ;
  key: string }
type nonrec resource_tags = resource_tag list option list
type nonrec base62_id = string
type nonrec name = string
type nonrec description = string
type nonrec resource_set_status =
  | OUT_OF_ADMIN_SCOPE 
  | ACTIVE 
type nonrec resource_set_summary =
  {
  resource_set_status: resource_set_status option ;
  last_update_time: float option ;
  description: string option ;
  name: string option ;
  id: string option }
type nonrec resource_set_summary_list = resource_set_summary list option list
type nonrec resource_set_ids = string list option list
type nonrec resource_set =
  {
  resource_set_status: resource_set_status option ;
  last_update_time: float option ;
  resource_type_list: string list ;
  update_token: string option ;
  description: string option ;
  name: string ;
  id: string option }
type nonrec resource_name = string
type nonrec identifier = string
type nonrec resource = {
  account_id: string option ;
  ur_i: string }
type nonrec resource_list = resource list option list
type nonrec resource_description = string
type nonrec resource_count = int
type nonrec aws_region = string
type nonrec aws_region_list = string list option list
type nonrec region_scope =
  {
  all_regions_enabled: bool option ;
  regions: string list option }
type nonrec put_resource_set_response =
  {
  resource_set_arn: string ;
  resource_set: resource_set }
type nonrec put_resource_set_request =
  {
  tag_list: tag list option ;
  resource_set: resource_set }
type nonrec list_id = string
type nonrec protocol = string
type nonrec protocols_list = string list option list
type nonrec previous_list_version = string
type nonrec previous_protocols_list =
  (string_ option * string list option) list
type nonrec protocols_list_data =
  {
  previous_protocols_list: (string * string list) list option ;
  protocols_list: string list ;
  last_update_time: float option ;
  create_time: float option ;
  list_update_token: string option ;
  list_name: string ;
  list_id: string option }
type nonrec put_protocols_list_response =
  {
  protocols_list_arn: string option ;
  protocols_list: protocols_list_data option }
type nonrec put_protocols_list_request =
  {
  tag_list: tag list option ;
  protocols_list: protocols_list_data }
type nonrec policy_update_token = string
type nonrec customer_policy_scope_id = string
type nonrec customer_policy_scope_id_list = string list option list
type nonrec customer_policy_scope_id_type =
  | ORG_UNIT 
  | ACCOUNT 
type nonrec customer_policy_scope_map =
  (string_ option * string list option) list
type nonrec customer_policy_status =
  | OUT_OF_ADMIN_SCOPE 
  | ACTIVE 
type nonrec policy =
  {
  policy_status: customer_policy_status option ;
  policy_description: string option ;
  resource_set_ids: string list option ;
  exclude_map: (string * string list) list option ;
  include_map: (string * string list) list option ;
  delete_unused_fm_managed_resources: bool option ;
  remediation_enabled: bool ;
  exclude_resource_tags: bool ;
  resource_tags: resource_tag list option ;
  resource_type_list: string list option ;
  resource_type: string ;
  security_service_policy_data: security_service_policy_data ;
  policy_update_token: string option ;
  policy_name: string ;
  policy_id: string option }
type nonrec put_policy_response =
  {
  policy_arn: string option ;
  policy: policy option }
type nonrec put_policy_request = {
  tag_list: tag list option ;
  policy: policy }
type nonrec invalid_type_exception = {
  message: string option }
type nonrec put_notification_channel_request =
  {
  sns_role_name: string ;
  sns_topic_arn: string }
type nonrec app = {
  port: int ;
  protocol: string ;
  app_name: string }
type nonrec apps_list = app list option list
type nonrec previous_apps_list = (string_ option * app list option) list
type nonrec apps_list_data =
  {
  previous_apps_list: (string * app list) list option ;
  apps_list: app list ;
  last_update_time: float option ;
  create_time: float option ;
  list_update_token: string option ;
  list_name: string ;
  list_id: string option }
type nonrec put_apps_list_response =
  {
  apps_list_arn: string option ;
  apps_list: apps_list_data option }
type nonrec put_apps_list_request =
  {
  tag_list: tag list option ;
  apps_list: apps_list_data }
type nonrec account_id_list = string list option list
type nonrec account_scope =
  {
  exclude_specified_accounts: bool option ;
  all_accounts_enabled: bool option ;
  accounts: string list option }
type nonrec organizational_unit_id = string
type nonrec organizational_unit_id_list = string list option list
type nonrec organizational_unit_scope =
  {
  exclude_specified_organizational_units: bool option ;
  all_organizational_units_enabled: bool option ;
  organizational_units: string list option }
type nonrec policy_type_scope =
  {
  all_policy_types_enabled: bool option ;
  policy_types: security_service_type list option }
type nonrec admin_scope =
  {
  policy_type_scope: policy_type_scope option ;
  region_scope: region_scope option ;
  organizational_unit_scope: organizational_unit_scope option ;
  account_scope: account_scope option }
type nonrec put_admin_account_request =
  {
  admin_scope: admin_scope option ;
  admin_account: string }
type nonrec protocols_list_data_summary =
  {
  protocols_list: string list option ;
  list_name: string option ;
  list_id: string option ;
  list_arn: string option }
type nonrec protocols_lists_data =
  protocols_list_data_summary list option list
type nonrec protection_data = string
type nonrec policy_summary =
  {
  policy_status: customer_policy_status option ;
  delete_unused_fm_managed_resources: bool option ;
  remediation_enabled: bool option ;
  security_service_type: security_service_type option ;
  resource_type: string option ;
  policy_name: string option ;
  policy_id: string option ;
  policy_arn: string option }
type nonrec policy_summary_list = policy_summary list option list
type nonrec policy_compliance_status_type =
  | NonCompliant 
  | Compliant 
type nonrec evaluation_result =
  {
  evaluation_limit_exceeded: bool option ;
  violator_count: int option ;
  compliance_status: policy_compliance_status_type option }
type nonrec evaluation_results = evaluation_result list option list
type nonrec detailed_info = string
type nonrec dependent_service_name =
  | AWSVirtualPrivateCloud 
  | AWSShieldAdvanced 
  | AWSWAF 
  | AWSConfig 
type nonrec issue_info_map = (string_ option * string_ option) list
type nonrec policy_compliance_status =
  {
  issue_info_map: (string * string) list option ;
  last_updated: float option ;
  evaluation_results: evaluation_result list option ;
  member_account: string option ;
  policy_name: string option ;
  policy_id: string option ;
  policy_owner: string option }
type nonrec policy_compliance_status_list =
  policy_compliance_status list option list
type nonrec compliance_violator_metadata =
  (string_ option * string_ option) list
type nonrec compliance_violator =
  {
  metadata: (string * string) list option ;
  resource_type: string option ;
  violation_reason: violation_reason option ;
  resource_id: string option }
type nonrec compliance_violators = compliance_violator list option list
type nonrec policy_compliance_detail =
  {
  issue_info_map: (string * string) list option ;
  expired_at: float option ;
  evaluation_limit_exceeded: bool option ;
  violators: compliance_violator list option ;
  member_account: string option ;
  policy_id: string option ;
  policy_owner: string option }
type nonrec pagination_token = string
type nonrec pagination_max_results = int
type nonrec organization_status =
  | OffboardingComplete 
  | Offboarding 
  | OnboardingComplete 
  | Onboarding 
type nonrec member_accounts = string list option list
type nonrec marketplace_subscription_onboarding_status =
  | COMPLETE 
  | NOT_COMPLETE 
  | NO_SUBSCRIPTION 
type nonrec list_third_party_firewall_firewall_policies_response =
  {
  next_token: string option ;
  third_party_firewall_firewall_policies:
    third_party_firewall_firewall_policy list option }
type nonrec list_third_party_firewall_firewall_policies_request =
  {
  max_results: int ;
  next_token: string option ;
  third_party_firewall: third_party_firewall }
type nonrec list_tags_for_resource_response = {
  tag_list: tag list option }
type nonrec list_tags_for_resource_request = {
  resource_arn: string }
type nonrec list_resource_sets_response =
  {
  next_token: string option ;
  resource_sets: resource_set_summary list option }
type nonrec list_resource_sets_request =
  {
  max_results: int option ;
  next_token: string option }
type nonrec list_resource_set_resources_response =
  {
  next_token: string option ;
  items: resource list }
type nonrec list_resource_set_resources_request =
  {
  next_token: string option ;
  max_results: int option ;
  identifier: string }
type nonrec list_protocols_lists_response =
  {
  next_token: string option ;
  protocols_lists: protocols_list_data_summary list option }
type nonrec list_protocols_lists_request =
  {
  max_results: int ;
  next_token: string option ;
  default_lists: bool option }
type nonrec list_policies_response =
  {
  next_token: string option ;
  policy_list: policy_summary list option }
type nonrec list_policies_request =
  {
  max_results: int option ;
  next_token: string option }
type nonrec list_member_accounts_response =
  {
  next_token: string option ;
  member_accounts: string list option }
type nonrec list_member_accounts_request =
  {
  max_results: int option ;
  next_token: string option }
type nonrec discovered_resource =
  {
  name: string option ;
  type_: string option ;
  account_id: string option ;
  ur_i: string option }
type nonrec discovered_resource_list = discovered_resource list option list
type nonrec list_discovered_resources_response =
  {
  next_token: string option ;
  items: discovered_resource list option }
type nonrec aws_account_id_list = string list option list
type nonrec list_discovered_resources_request =
  {
  next_token: string option ;
  max_results: int option ;
  resource_type: string ;
  member_account_ids: string list }
type nonrec list_compliance_status_response =
  {
  next_token: string option ;
  policy_compliance_status_list: policy_compliance_status list option }
type nonrec list_compliance_status_request =
  {
  max_results: int option ;
  next_token: string option ;
  policy_id: string }
type nonrec apps_list_data_summary =
  {
  apps_list: app list option ;
  list_name: string option ;
  list_id: string option ;
  list_arn: string option }
type nonrec apps_lists_data = apps_list_data_summary list option list
type nonrec list_apps_lists_response =
  {
  next_token: string option ;
  apps_lists: apps_list_data_summary list option }
type nonrec list_apps_lists_request =
  {
  max_results: int ;
  next_token: string option ;
  default_lists: bool option }
type nonrec list_admins_managing_account_response =
  {
  next_token: string option ;
  admin_accounts: string list option }
type nonrec list_admins_managing_account_request =
  {
  max_results: int option ;
  next_token: string option }
type nonrec admin_account_summary =
  {
  status: organization_status option ;
  default_admin: bool option ;
  admin_account: string option }
type nonrec admin_account_summary_list =
  admin_account_summary list option list
type nonrec list_admin_accounts_for_organization_response =
  {
  next_token: string option ;
  admin_accounts: admin_account_summary list option }
type nonrec list_admin_accounts_for_organization_request =
  {
  max_results: int option ;
  next_token: string option }
type nonrec identifier_list = string list option list
type nonrec get_violation_details_response =
  {
  violation_detail: violation_detail option }
type nonrec get_violation_details_request =
  {
  resource_type: string ;
  resource_id: string ;
  member_account: string ;
  policy_id: string }
type nonrec get_third_party_firewall_association_status_response =
  {
  marketplace_onboarding_status:
    marketplace_subscription_onboarding_status option ;
  third_party_firewall_status: third_party_firewall_association_status option }
type nonrec get_third_party_firewall_association_status_request =
  {
  third_party_firewall: third_party_firewall }
type nonrec get_resource_set_response =
  {
  resource_set_arn: string ;
  resource_set: resource_set }
type nonrec get_resource_set_request = {
  identifier: string }
type nonrec get_protocols_list_response =
  {
  protocols_list_arn: string option ;
  protocols_list: protocols_list_data option }
type nonrec get_protocols_list_request =
  {
  default_list: bool option ;
  list_id: string }
type nonrec get_protection_status_response =
  {
  next_token: string option ;
  data: string option ;
  service_type: security_service_type option ;
  admin_account_id: string option }
type nonrec get_protection_status_request =
  {
  max_results: int option ;
  next_token: string option ;
  end_time: float option ;
  start_time: float option ;
  member_account_id: string option ;
  policy_id: string }
type nonrec get_policy_response =
  {
  policy_arn: string option ;
  policy: policy option }
type nonrec get_policy_request = {
  policy_id: string }
type nonrec get_notification_channel_response =
  {
  sns_role_name: string option ;
  sns_topic_arn: string option }
type nonrec get_notification_channel_request = unit
type nonrec get_compliance_detail_response =
  {
  policy_compliance_detail: policy_compliance_detail option }
type nonrec get_compliance_detail_request =
  {
  member_account: string ;
  policy_id: string }
type nonrec get_apps_list_response =
  {
  apps_list_arn: string option ;
  apps_list: apps_list_data option }
type nonrec get_apps_list_request =
  {
  default_list: bool option ;
  list_id: string }
type nonrec get_admin_scope_response =
  {
  status: organization_status option ;
  admin_scope: admin_scope option }
type nonrec get_admin_scope_request = {
  admin_account: string }
type nonrec account_role_status =
  | Deleted 
  | Deleting 
  | PendingDeletion 
  | Creating 
  | Ready 
type nonrec get_admin_account_response =
  {
  role_status: account_role_status option ;
  admin_account: string option }
type nonrec get_admin_account_request = unit
type nonrec failed_item_reason =
  | NotValidAccountId 
  | NotValidResourceType 
  | NotValidService 
  | NotValidRegion 
  | NotValidPartition 
  | NotValidArn 
type nonrec failed_item =
  {
  reason: failed_item_reason option ;
  ur_i: string option }
type nonrec failed_item_list = failed_item list option list
type nonrec disassociate_third_party_firewall_response =
  {
  third_party_firewall_status: third_party_firewall_association_status option }
type nonrec disassociate_third_party_firewall_request =
  {
  third_party_firewall: third_party_firewall }
type nonrec disassociate_admin_account_request = unit
type nonrec delete_resource_set_request = {
  identifier: string }
type nonrec delete_protocols_list_request = {
  list_id: string }
type nonrec delete_policy_request =
  {
  delete_all_policy_resources: bool option ;
  policy_id: string }
type nonrec delete_notification_channel_request = unit
type nonrec delete_apps_list_request = {
  list_id: string }
type nonrec batch_disassociate_resource_response =
  {
  failed_items: failed_item list ;
  resource_set_identifier: string }
type nonrec batch_disassociate_resource_request =
  {
  items: string list ;
  resource_set_identifier: string }
type nonrec batch_associate_resource_response =
  {
  failed_items: failed_item list ;
  resource_set_identifier: string }
type nonrec batch_associate_resource_request =
  {
  items: string list ;
  resource_set_identifier: string }
type nonrec associate_third_party_firewall_response =
  {
  third_party_firewall_status: third_party_firewall_association_status option }
type nonrec associate_third_party_firewall_request =
  {
  third_party_firewall: third_party_firewall }
type nonrec associate_admin_account_request = {
  admin_account: string }
type nonrec awsfm_s_20180101 = unit
type nonrec base_string = string
type nonrec base_boolean = bool
type nonrec base_integer = int
type nonrec base_timestamp = Timestamp.t
type nonrec base_long = int
type nonrec base_document = Document.t