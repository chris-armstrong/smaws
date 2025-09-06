open Types
let make_web_acl_has_out_of_scope_resources_violation
  ?out_of_scope_resource_list:(out_of_scope_resource_list_ :
                                resource_arn_list option)
  ?web_acl_arn:(web_acl_arn_ : resource_arn option) () =
  ({
     out_of_scope_resource_list = out_of_scope_resource_list_;
     web_acl_arn = web_acl_arn_
   } : web_acl_has_out_of_scope_resources_violation)
let make_web_acl_has_incompatible_configuration_violation
  ?description:(description_ : length_bounded_string option)
  ?web_acl_arn:(web_acl_arn_ : resource_arn option) () =
  ({ description = description_; web_acl_arn = web_acl_arn_ } : web_acl_has_incompatible_configuration_violation)
let make_partial_match
  ?target_violation_reasons:(target_violation_reasons_ :
                              target_violation_reasons option)
  ?reference:(reference_ : reference_rule option) () =
  ({
     target_violation_reasons = target_violation_reasons_;
     reference = reference_
   } : partial_match)
let make_security_group_rule_description
  ?to_port:(to_port_ : ip_port_number option)
  ?from_port:(from_port_ : ip_port_number option)
  ?protocol:(protocol_ : length_bounded_string option)
  ?prefix_list_id:(prefix_list_id_ : resource_id option)
  ?ipv6_range:(ipv6_range_ : cid_r option)
  ?ipv4_range:(ipv4_range_ : cid_r option) () =
  ({
     to_port = to_port_;
     from_port = from_port_;
     protocol = protocol_;
     prefix_list_id = prefix_list_id_;
     ipv6_range = ipv6_range_;
     ipv4_range = ipv4_range_
   } : security_group_rule_description)
let make_security_group_remediation_action
  ?is_default_action:(is_default_action_ : boolean_ option)
  ?remediation_result:(remediation_result_ :
                        security_group_rule_description option)
  ?description:(description_ : remediation_action_description option)
  ?remediation_action_type:(remediation_action_type_ :
                             remediation_action_type option)
  () =
  ({
     is_default_action = is_default_action_;
     remediation_result = remediation_result_;
     description = description_;
     remediation_action_type = remediation_action_type_
   } : security_group_remediation_action)
let make_aws_vpc_security_group_violation
  ?possible_security_group_remediation_actions:(possible_security_group_remediation_actions_
                                                 :
                                                 security_group_remediation_actions
                                                   option)
  ?partial_matches:(partial_matches_ : partial_matches option)
  ?violation_target_description:(violation_target_description_ :
                                  length_bounded_string option)
  ?violation_target:(violation_target_ : violation_target option) () =
  ({
     possible_security_group_remediation_actions =
       possible_security_group_remediation_actions_;
     partial_matches = partial_matches_;
     violation_target_description = violation_target_description_;
     violation_target = violation_target_
   } : aws_vpc_security_group_violation)
let make_aws_ec2_network_interface_violation
  ?violating_security_groups:(violating_security_groups_ :
                               resource_id_list option)
  ?violation_target:(violation_target_ : violation_target option) () =
  ({
     violating_security_groups = violating_security_groups_;
     violation_target = violation_target_
   } : aws_ec2_network_interface_violation)
let make_aws_ec2_instance_violation
  ?aws_ec2_network_interface_violations:(aws_ec2_network_interface_violations_
                                          :
                                          aws_ec2_network_interface_violations
                                            option)
  ?violation_target:(violation_target_ : violation_target option) () =
  ({
     aws_ec2_network_interface_violations =
       aws_ec2_network_interface_violations_;
     violation_target = violation_target_
   } : aws_ec2_instance_violation)
let make_network_firewall_missing_firewall_violation
  ?target_violation_reason:(target_violation_reason_ :
                             target_violation_reason option)
  ?availability_zone:(availability_zone_ : length_bounded_string option)
  ?vp_c:(vp_c_ : resource_id option)
  ?violation_target:(violation_target_ : violation_target option) () =
  ({
     target_violation_reason = target_violation_reason_;
     availability_zone = availability_zone_;
     vp_c = vp_c_;
     violation_target = violation_target_
   } : network_firewall_missing_firewall_violation)
let make_network_firewall_missing_subnet_violation
  ?target_violation_reason:(target_violation_reason_ :
                             target_violation_reason option)
  ?availability_zone:(availability_zone_ : length_bounded_string option)
  ?vp_c:(vp_c_ : resource_id option)
  ?violation_target:(violation_target_ : violation_target option) () =
  ({
     target_violation_reason = target_violation_reason_;
     availability_zone = availability_zone_;
     vp_c = vp_c_;
     violation_target = violation_target_
   } : network_firewall_missing_subnet_violation)
let make_network_firewall_missing_expected_rt_violation
  ?expected_route_table:(expected_route_table_ : resource_id option)
  ?current_route_table:(current_route_table_ : resource_id option)
  ?availability_zone:(availability_zone_ : length_bounded_string option)
  ?vp_c:(vp_c_ : resource_id option)
  ?violation_target:(violation_target_ : violation_target option) () =
  ({
     expected_route_table = expected_route_table_;
     current_route_table = current_route_table_;
     availability_zone = availability_zone_;
     vp_c = vp_c_;
     violation_target = violation_target_
   } : network_firewall_missing_expected_rt_violation)
let make_stateless_rule_group
  ?priority:(priority_ : stateless_rule_group_priority option)
  ?resource_id:(resource_id_ : resource_id option)
  ?rule_group_name:(rule_group_name_ : network_firewall_resource_name option)
  () =
  ({
     priority = priority_;
     resource_id = resource_id_;
     rule_group_name = rule_group_name_
   } : stateless_rule_group)
let make_network_firewall_stateful_rule_group_override
  ?action:(action_ : network_firewall_override_action option) () =
  ({ action = action_ } : network_firewall_stateful_rule_group_override)
let make_stateful_rule_group
  ?override:(override_ :
              network_firewall_stateful_rule_group_override option)
  ?priority:(priority_ : priority_number option)
  ?resource_id:(resource_id_ : resource_id option)
  ?rule_group_name:(rule_group_name_ : network_firewall_resource_name option)
  () =
  ({
     override = override_;
     priority = priority_;
     resource_id = resource_id_;
     rule_group_name = rule_group_name_
   } : stateful_rule_group)
let make_stateful_engine_options
  ?stream_exception_policy:(stream_exception_policy_ :
                             stream_exception_policy option)
  ?rule_order:(rule_order_ : rule_order option) () =
  ({
     stream_exception_policy = stream_exception_policy_;
     rule_order = rule_order_
   } : stateful_engine_options)
let make_network_firewall_policy_description
  ?stateful_engine_options:(stateful_engine_options_ :
                             stateful_engine_options option)
  ?stateful_default_actions:(stateful_default_actions_ :
                              network_firewall_action_list option)
  ?stateful_rule_groups:(stateful_rule_groups_ :
                          stateful_rule_group_list option)
  ?stateless_custom_actions:(stateless_custom_actions_ :
                              network_firewall_action_list option)
  ?stateless_fragment_default_actions:(stateless_fragment_default_actions_ :
                                        network_firewall_action_list option)
  ?stateless_default_actions:(stateless_default_actions_ :
                               network_firewall_action_list option)
  ?stateless_rule_groups:(stateless_rule_groups_ :
                           stateless_rule_group_list option)
  () =
  ({
     stateful_engine_options = stateful_engine_options_;
     stateful_default_actions = stateful_default_actions_;
     stateful_rule_groups = stateful_rule_groups_;
     stateless_custom_actions = stateless_custom_actions_;
     stateless_fragment_default_actions = stateless_fragment_default_actions_;
     stateless_default_actions = stateless_default_actions_;
     stateless_rule_groups = stateless_rule_groups_
   } : network_firewall_policy_description)
let make_network_firewall_policy_modified_violation
  ?expected_policy_description:(expected_policy_description_ :
                                 network_firewall_policy_description option)
  ?current_policy_description:(current_policy_description_ :
                                network_firewall_policy_description option)
  ?violation_target:(violation_target_ : violation_target option) () =
  ({
     expected_policy_description = expected_policy_description_;
     current_policy_description = current_policy_description_;
     violation_target = violation_target_
   } : network_firewall_policy_modified_violation)
let make_route ?target:(target_ : length_bounded_string option)
  ?destination:(destination_ : length_bounded_string option)
  ?target_type:(target_type_ : target_type option)
  ?destination_type:(destination_type_ : destination_type option) () =
  ({
     target = target_;
     destination = destination_;
     target_type = target_type_;
     destination_type = destination_type_
   } : route)
let make_expected_route
  ?route_table_id:(route_table_id_ : resource_id option)
  ?allowed_targets:(allowed_targets_ : length_bounded_string_list option)
  ?contributing_subnets:(contributing_subnets_ : resource_id_list option)
  ?ip_v6_cidr:(ip_v6_cidr_ : cid_r option)
  ?prefix_list_id:(prefix_list_id_ : cid_r option)
  ?ip_v4_cidr:(ip_v4_cidr_ : cid_r option) () =
  ({
     route_table_id = route_table_id_;
     allowed_targets = allowed_targets_;
     contributing_subnets = contributing_subnets_;
     ip_v6_cidr = ip_v6_cidr_;
     prefix_list_id = prefix_list_id_;
     ip_v4_cidr = ip_v4_cidr_
   } : expected_route)
let make_network_firewall_internet_traffic_not_inspected_violation
  ?vpc_id:(vpc_id_ : resource_id option)
  ?actual_internet_gateway_routes:(actual_internet_gateway_routes_ :
                                    routes option)
  ?expected_internet_gateway_routes:(expected_internet_gateway_routes_ :
                                      expected_routes option)
  ?current_internet_gateway_route_table:(current_internet_gateway_route_table_
                                          : resource_id option)
  ?internet_gateway_id:(internet_gateway_id_ : resource_id option)
  ?actual_firewall_subnet_routes:(actual_firewall_subnet_routes_ :
                                   routes option)
  ?expected_firewall_subnet_routes:(expected_firewall_subnet_routes_ :
                                     expected_routes option)
  ?firewall_subnet_id:(firewall_subnet_id_ : resource_id option)
  ?expected_firewall_endpoint:(expected_firewall_endpoint_ :
                                resource_id option)
  ?current_firewall_subnet_route_table:(current_firewall_subnet_route_table_
                                         : resource_id option)
  ?is_route_table_used_in_different_a_z:(is_route_table_used_in_different_a_z_
                                          : boolean_ option)
  ?violating_routes:(violating_routes_ : routes option)
  ?route_table_id:(route_table_id_ : resource_id option)
  ?subnet_availability_zone:(subnet_availability_zone_ :
                              length_bounded_string option)
  ?subnet_id:(subnet_id_ : resource_id option) () =
  ({
     vpc_id = vpc_id_;
     actual_internet_gateway_routes = actual_internet_gateway_routes_;
     expected_internet_gateway_routes = expected_internet_gateway_routes_;
     current_internet_gateway_route_table =
       current_internet_gateway_route_table_;
     internet_gateway_id = internet_gateway_id_;
     actual_firewall_subnet_routes = actual_firewall_subnet_routes_;
     expected_firewall_subnet_routes = expected_firewall_subnet_routes_;
     firewall_subnet_id = firewall_subnet_id_;
     expected_firewall_endpoint = expected_firewall_endpoint_;
     current_firewall_subnet_route_table =
       current_firewall_subnet_route_table_;
     is_route_table_used_in_different_a_z =
       is_route_table_used_in_different_a_z_;
     violating_routes = violating_routes_;
     route_table_id = route_table_id_;
     subnet_availability_zone = subnet_availability_zone_;
     subnet_id = subnet_id_
   } : network_firewall_internet_traffic_not_inspected_violation)
let make_network_firewall_invalid_route_configuration_violation
  ?vpc_id:(vpc_id_ : resource_id option)
  ?actual_internet_gateway_routes:(actual_internet_gateway_routes_ :
                                    routes option)
  ?expected_internet_gateway_routes:(expected_internet_gateway_routes_ :
                                      expected_routes option)
  ?current_internet_gateway_route_table:(current_internet_gateway_route_table_
                                          : resource_id option)
  ?internet_gateway_id:(internet_gateway_id_ : resource_id option)
  ?actual_firewall_subnet_routes:(actual_firewall_subnet_routes_ :
                                   routes option)
  ?expected_firewall_subnet_routes:(expected_firewall_subnet_routes_ :
                                     expected_routes option)
  ?actual_firewall_subnet_id:(actual_firewall_subnet_id_ :
                               resource_id option)
  ?expected_firewall_subnet_id:(expected_firewall_subnet_id_ :
                                 resource_id option)
  ?actual_firewall_endpoint:(actual_firewall_endpoint_ : resource_id option)
  ?expected_firewall_endpoint:(expected_firewall_endpoint_ :
                                resource_id option)
  ?current_firewall_subnet_route_table:(current_firewall_subnet_route_table_
                                         : resource_id option)
  ?violating_route:(violating_route_ : route option)
  ?is_route_table_used_in_different_a_z:(is_route_table_used_in_different_a_z_
                                          : boolean_ option)
  ?route_table_id:(route_table_id_ : resource_id option)
  ?affected_subnets:(affected_subnets_ : resource_id_list option) () =
  ({
     vpc_id = vpc_id_;
     actual_internet_gateway_routes = actual_internet_gateway_routes_;
     expected_internet_gateway_routes = expected_internet_gateway_routes_;
     current_internet_gateway_route_table =
       current_internet_gateway_route_table_;
     internet_gateway_id = internet_gateway_id_;
     actual_firewall_subnet_routes = actual_firewall_subnet_routes_;
     expected_firewall_subnet_routes = expected_firewall_subnet_routes_;
     actual_firewall_subnet_id = actual_firewall_subnet_id_;
     expected_firewall_subnet_id = expected_firewall_subnet_id_;
     actual_firewall_endpoint = actual_firewall_endpoint_;
     expected_firewall_endpoint = expected_firewall_endpoint_;
     current_firewall_subnet_route_table =
       current_firewall_subnet_route_table_;
     violating_route = violating_route_;
     is_route_table_used_in_different_a_z =
       is_route_table_used_in_different_a_z_;
     route_table_id = route_table_id_;
     affected_subnets = affected_subnets_
   } : network_firewall_invalid_route_configuration_violation)
let make_network_firewall_black_hole_route_detected_violation
  ?violating_routes:(violating_routes_ : routes option)
  ?vpc_id:(vpc_id_ : resource_id option)
  ?route_table_id:(route_table_id_ : resource_id option)
  ?violation_target:(violation_target_ : violation_target option) () =
  ({
     violating_routes = violating_routes_;
     vpc_id = vpc_id_;
     route_table_id = route_table_id_;
     violation_target = violation_target_
   } : network_firewall_black_hole_route_detected_violation)
let make_network_firewall_unexpected_firewall_routes_violation
  ?vpc_id:(vpc_id_ : resource_id option)
  ?firewall_endpoint:(firewall_endpoint_ : resource_id option)
  ?route_table_id:(route_table_id_ : resource_id option)
  ?violating_routes:(violating_routes_ : routes option)
  ?firewall_subnet_id:(firewall_subnet_id_ : resource_id option) () =
  ({
     vpc_id = vpc_id_;
     firewall_endpoint = firewall_endpoint_;
     route_table_id = route_table_id_;
     violating_routes = violating_routes_;
     firewall_subnet_id = firewall_subnet_id_
   } : network_firewall_unexpected_firewall_routes_violation)
let make_network_firewall_unexpected_gateway_routes_violation
  ?vpc_id:(vpc_id_ : resource_id option)
  ?route_table_id:(route_table_id_ : resource_id option)
  ?violating_routes:(violating_routes_ : routes option)
  ?gateway_id:(gateway_id_ : resource_id option) () =
  ({
     vpc_id = vpc_id_;
     route_table_id = route_table_id_;
     violating_routes = violating_routes_;
     gateway_id = gateway_id_
   } : network_firewall_unexpected_gateway_routes_violation)
let make_network_firewall_missing_expected_routes_violation
  ?vpc_id:(vpc_id_ : resource_id option)
  ?expected_routes:(expected_routes_ : expected_routes option)
  ?violation_target:(violation_target_ : violation_target option) () =
  ({
     vpc_id = vpc_id_;
     expected_routes = expected_routes_;
     violation_target = violation_target_
   } : network_firewall_missing_expected_routes_violation)
let make_dns_rule_group_priority_conflict_violation
  ?unavailable_priorities:(unavailable_priorities_ :
                            dns_rule_group_priorities option)
  ?conflicting_policy_id:(conflicting_policy_id_ : policy_id option)
  ?conflicting_priority:(conflicting_priority_ :
                          dns_rule_group_priority option)
  ?violation_target_description:(violation_target_description_ :
                                  length_bounded_string option)
  ?violation_target:(violation_target_ : violation_target option) () =
  ({
     unavailable_priorities = unavailable_priorities_;
     conflicting_policy_id = conflicting_policy_id_;
     conflicting_priority = conflicting_priority_;
     violation_target_description = violation_target_description_;
     violation_target = violation_target_
   } : dns_rule_group_priority_conflict_violation)
let make_dns_duplicate_rule_group_violation
  ?violation_target_description:(violation_target_description_ :
                                  length_bounded_string option)
  ?violation_target:(violation_target_ : violation_target option) () =
  ({
     violation_target_description = violation_target_description_;
     violation_target = violation_target_
   } : dns_duplicate_rule_group_violation)
let make_dns_rule_group_limit_exceeded_violation
  ?number_of_rule_groups_already_associated:(number_of_rule_groups_already_associated_
                                              : basic_integer option)
  ?violation_target_description:(violation_target_description_ :
                                  length_bounded_string option)
  ?violation_target:(violation_target_ : violation_target option) () =
  ({
     number_of_rule_groups_already_associated =
       number_of_rule_groups_already_associated_;
     violation_target_description = violation_target_description_;
     violation_target = violation_target_
   } : dns_rule_group_limit_exceeded_violation)
let make_firewall_subnet_is_out_of_scope_violation
  ?vpc_endpoint_id:(vpc_endpoint_id_ : resource_id option)
  ?subnet_availability_zone_id:(subnet_availability_zone_id_ :
                                 length_bounded_string option)
  ?subnet_availability_zone:(subnet_availability_zone_ :
                              length_bounded_string option)
  ?vpc_id:(vpc_id_ : resource_id option)
  ?firewall_subnet_id:(firewall_subnet_id_ : resource_id option) () =
  ({
     vpc_endpoint_id = vpc_endpoint_id_;
     subnet_availability_zone_id = subnet_availability_zone_id_;
     subnet_availability_zone = subnet_availability_zone_;
     vpc_id = vpc_id_;
     firewall_subnet_id = firewall_subnet_id_
   } : firewall_subnet_is_out_of_scope_violation)
let make_route_has_out_of_scope_endpoint_violation
  ?internet_gateway_routes:(internet_gateway_routes_ : routes option)
  ?current_internet_gateway_route_table:(current_internet_gateway_route_table_
                                          : resource_id option)
  ?internet_gateway_id:(internet_gateway_id_ : resource_id option)
  ?firewall_subnet_routes:(firewall_subnet_routes_ : routes option)
  ?firewall_subnet_id:(firewall_subnet_id_ : resource_id option)
  ?current_firewall_subnet_route_table:(current_firewall_subnet_route_table_
                                         : resource_id option)
  ?subnet_availability_zone_id:(subnet_availability_zone_id_ :
                                 length_bounded_string option)
  ?subnet_availability_zone:(subnet_availability_zone_ :
                              length_bounded_string option)
  ?violating_routes:(violating_routes_ : routes option)
  ?route_table_id:(route_table_id_ : resource_id option)
  ?vpc_id:(vpc_id_ : resource_id option)
  ?subnet_id:(subnet_id_ : resource_id option) () =
  ({
     internet_gateway_routes = internet_gateway_routes_;
     current_internet_gateway_route_table =
       current_internet_gateway_route_table_;
     internet_gateway_id = internet_gateway_id_;
     firewall_subnet_routes = firewall_subnet_routes_;
     firewall_subnet_id = firewall_subnet_id_;
     current_firewall_subnet_route_table =
       current_firewall_subnet_route_table_;
     subnet_availability_zone_id = subnet_availability_zone_id_;
     subnet_availability_zone = subnet_availability_zone_;
     violating_routes = violating_routes_;
     route_table_id = route_table_id_;
     vpc_id = vpc_id_;
     subnet_id = subnet_id_
   } : route_has_out_of_scope_endpoint_violation)
let make_third_party_firewall_missing_firewall_violation
  ?target_violation_reason:(target_violation_reason_ :
                             target_violation_reason option)
  ?availability_zone:(availability_zone_ : length_bounded_string option)
  ?vp_c:(vp_c_ : resource_id option)
  ?violation_target:(violation_target_ : violation_target option) () =
  ({
     target_violation_reason = target_violation_reason_;
     availability_zone = availability_zone_;
     vp_c = vp_c_;
     violation_target = violation_target_
   } : third_party_firewall_missing_firewall_violation)
let make_third_party_firewall_missing_subnet_violation
  ?target_violation_reason:(target_violation_reason_ :
                             target_violation_reason option)
  ?availability_zone:(availability_zone_ : length_bounded_string option)
  ?vp_c:(vp_c_ : resource_id option)
  ?violation_target:(violation_target_ : violation_target option) () =
  ({
     target_violation_reason = target_violation_reason_;
     availability_zone = availability_zone_;
     vp_c = vp_c_;
     violation_target = violation_target_
   } : third_party_firewall_missing_subnet_violation)
let make_third_party_firewall_missing_expected_route_table_violation
  ?expected_route_table:(expected_route_table_ : resource_id option)
  ?current_route_table:(current_route_table_ : resource_id option)
  ?availability_zone:(availability_zone_ : length_bounded_string option)
  ?vp_c:(vp_c_ : resource_id option)
  ?violation_target:(violation_target_ : violation_target option) () =
  ({
     expected_route_table = expected_route_table_;
     current_route_table = current_route_table_;
     availability_zone = availability_zone_;
     vp_c = vp_c_;
     violation_target = violation_target_
   } : third_party_firewall_missing_expected_route_table_violation)
let make_firewall_subnet_missing_vpc_endpoint_violation
  ?subnet_availability_zone_id:(subnet_availability_zone_id_ :
                                 length_bounded_string option)
  ?subnet_availability_zone:(subnet_availability_zone_ :
                              length_bounded_string option)
  ?vpc_id:(vpc_id_ : resource_id option)
  ?firewall_subnet_id:(firewall_subnet_id_ : resource_id option) () =
  ({
     subnet_availability_zone_id = subnet_availability_zone_id_;
     subnet_availability_zone = subnet_availability_zone_;
     vpc_id = vpc_id_;
     firewall_subnet_id = firewall_subnet_id_
   } : firewall_subnet_missing_vpc_endpoint_violation)
let make_network_acl_icmp_type_code ?type_:(type__ : integer_object option)
  ?code:(code_ : integer_object option) () =
  ({ type_ = type__; code = code_ } : network_acl_icmp_type_code)
let make_network_acl_port_range ?to_:(to__ : ip_port_number_integer option)
  ?from_:(from__ : ip_port_number_integer option) () =
  ({ to_ = to__; from_ = from__ } : network_acl_port_range)
let make_network_acl_entry
  ?ipv6_cidr_block:(ipv6_cidr_block_ :
                     length_bounded_non_empty_string option)
  ?cidr_block:(cidr_block_ : length_bounded_non_empty_string option)
  ?port_range:(port_range_ : network_acl_port_range option)
  ?icmp_type_code:(icmp_type_code_ : network_acl_icmp_type_code option)
  ~egress:(egress_ : boolean_object)
  ~rule_action:(rule_action_ : network_acl_rule_action)
  ~protocol:(protocol_ : length_bounded_string) () =
  ({
     egress = egress_;
     rule_action = rule_action_;
     ipv6_cidr_block = ipv6_cidr_block_;
     cidr_block = cidr_block_;
     port_range = port_range_;
     protocol = protocol_;
     icmp_type_code = icmp_type_code_
   } : network_acl_entry)
let make_entry_description ?entry_type:(entry_type_ : entry_type option)
  ?entry_rule_number:(entry_rule_number_ : integer_object_minimum0 option)
  ?entry_detail:(entry_detail_ : network_acl_entry option) () =
  ({
     entry_type = entry_type_;
     entry_rule_number = entry_rule_number_;
     entry_detail = entry_detail_
   } : entry_description)
let make_entry_violation
  ?entry_violation_reasons:(entry_violation_reasons_ :
                             entry_violation_reasons option)
  ?entries_with_conflicts:(entries_with_conflicts_ :
                            entries_with_conflicts option)
  ?entry_at_expected_evaluation_order:(entry_at_expected_evaluation_order_ :
                                        entry_description option)
  ?actual_evaluation_order:(actual_evaluation_order_ :
                             length_bounded_string option)
  ?expected_evaluation_order:(expected_evaluation_order_ :
                               length_bounded_string option)
  ?expected_entry:(expected_entry_ : entry_description option) () =
  ({
     entry_violation_reasons = entry_violation_reasons_;
     entries_with_conflicts = entries_with_conflicts_;
     entry_at_expected_evaluation_order = entry_at_expected_evaluation_order_;
     actual_evaluation_order = actual_evaluation_order_;
     expected_evaluation_order = expected_evaluation_order_;
     expected_entry = expected_entry_
   } : entry_violation)
let make_invalid_network_acl_entries_violation
  ?entry_violations:(entry_violations_ : entry_violations option)
  ?current_associated_network_acl:(current_associated_network_acl_ :
                                    resource_id option)
  ?subnet_availability_zone:(subnet_availability_zone_ :
                              length_bounded_string option)
  ?subnet:(subnet_ : resource_id option) ?vpc:(vpc_ : resource_id option) ()
  =
  ({
     entry_violations = entry_violations_;
     current_associated_network_acl = current_associated_network_acl_;
     subnet_availability_zone = subnet_availability_zone_;
     subnet = subnet_;
     vpc = vpc_
   } : invalid_network_acl_entries_violation)
let make_action_target
  ?description:(description_ : length_bounded_string option)
  ?resource_id:(resource_id_ : resource_id option) () =
  ({ description = description_; resource_id = resource_id_ } : action_target)
let make_ec2_create_route_action
  ?gateway_id:(gateway_id_ : action_target option)
  ?vpc_endpoint_id:(vpc_endpoint_id_ : action_target option)
  ?destination_ipv6_cidr_block:(destination_ipv6_cidr_block_ : cid_r option)
  ?destination_prefix_list_id:(destination_prefix_list_id_ :
                                resource_id option)
  ?destination_cidr_block:(destination_cidr_block_ : cid_r option)
  ?description:(description_ : length_bounded_string option)
  ~route_table_id:(route_table_id_ : action_target) () =
  ({
     route_table_id = route_table_id_;
     gateway_id = gateway_id_;
     vpc_endpoint_id = vpc_endpoint_id_;
     destination_ipv6_cidr_block = destination_ipv6_cidr_block_;
     destination_prefix_list_id = destination_prefix_list_id_;
     destination_cidr_block = destination_cidr_block_;
     description = description_
   } : ec2_create_route_action)
let make_ec2_replace_route_action
  ?gateway_id:(gateway_id_ : action_target option)
  ?destination_ipv6_cidr_block:(destination_ipv6_cidr_block_ : cid_r option)
  ?destination_prefix_list_id:(destination_prefix_list_id_ :
                                resource_id option)
  ?destination_cidr_block:(destination_cidr_block_ : cid_r option)
  ?description:(description_ : length_bounded_string option)
  ~route_table_id:(route_table_id_ : action_target) () =
  ({
     route_table_id = route_table_id_;
     gateway_id = gateway_id_;
     destination_ipv6_cidr_block = destination_ipv6_cidr_block_;
     destination_prefix_list_id = destination_prefix_list_id_;
     destination_cidr_block = destination_cidr_block_;
     description = description_
   } : ec2_replace_route_action)
let make_ec2_delete_route_action
  ?destination_ipv6_cidr_block:(destination_ipv6_cidr_block_ : cid_r option)
  ?destination_prefix_list_id:(destination_prefix_list_id_ :
                                resource_id option)
  ?destination_cidr_block:(destination_cidr_block_ : cid_r option)
  ?description:(description_ : length_bounded_string option)
  ~route_table_id:(route_table_id_ : action_target) () =
  ({
     route_table_id = route_table_id_;
     destination_ipv6_cidr_block = destination_ipv6_cidr_block_;
     destination_prefix_list_id = destination_prefix_list_id_;
     destination_cidr_block = destination_cidr_block_;
     description = description_
   } : ec2_delete_route_action)
let make_ec2_copy_route_table_action
  ?description:(description_ : length_bounded_string option)
  ~route_table_id:(route_table_id_ : action_target)
  ~vpc_id:(vpc_id_ : action_target) () =
  ({
     route_table_id = route_table_id_;
     vpc_id = vpc_id_;
     description = description_
   } : ec2_copy_route_table_action)
let make_ec2_replace_route_table_association_action
  ?description:(description_ : length_bounded_string option)
  ~route_table_id:(route_table_id_ : action_target)
  ~association_id:(association_id_ : action_target) () =
  ({
     route_table_id = route_table_id_;
     association_id = association_id_;
     description = description_
   } : ec2_replace_route_table_association_action)
let make_ec2_associate_route_table_action
  ?gateway_id:(gateway_id_ : action_target option)
  ?subnet_id:(subnet_id_ : action_target option)
  ?description:(description_ : length_bounded_string option)
  ~route_table_id:(route_table_id_ : action_target) () =
  ({
     gateway_id = gateway_id_;
     subnet_id = subnet_id_;
     route_table_id = route_table_id_;
     description = description_
   } : ec2_associate_route_table_action)
let make_ec2_create_route_table_action
  ?description:(description_ : length_bounded_string option)
  ~vpc_id:(vpc_id_ : action_target) () =
  ({ vpc_id = vpc_id_; description = description_ } : ec2_create_route_table_action)
let make_fms_policy_update_firewall_creation_config_action
  ?firewall_creation_config:(firewall_creation_config_ :
                              managed_service_data option)
  ?description:(description_ : length_bounded_string option) () =
  ({
     firewall_creation_config = firewall_creation_config_;
     description = description_
   } : fms_policy_update_firewall_creation_config_action)
let make_create_network_acl_action
  ?fms_can_remediate:(fms_can_remediate_ : boolean_ option)
  ?vpc:(vpc_ : action_target option)
  ?description:(description_ : length_bounded_string option) () =
  ({
     fms_can_remediate = fms_can_remediate_;
     vpc = vpc_;
     description = description_
   } : create_network_acl_action)
let make_replace_network_acl_association_action
  ?fms_can_remediate:(fms_can_remediate_ : boolean_ option)
  ?network_acl_id:(network_acl_id_ : action_target option)
  ?association_id:(association_id_ : action_target option)
  ?description:(description_ : length_bounded_string option) () =
  ({
     fms_can_remediate = fms_can_remediate_;
     network_acl_id = network_acl_id_;
     association_id = association_id_;
     description = description_
   } : replace_network_acl_association_action)
let make_create_network_acl_entries_action
  ?fms_can_remediate:(fms_can_remediate_ : boolean_ option)
  ?network_acl_entries_to_be_created:(network_acl_entries_to_be_created_ :
                                       entries_description option)
  ?network_acl_id:(network_acl_id_ : action_target option)
  ?description:(description_ : length_bounded_string option) () =
  ({
     fms_can_remediate = fms_can_remediate_;
     network_acl_entries_to_be_created = network_acl_entries_to_be_created_;
     network_acl_id = network_acl_id_;
     description = description_
   } : create_network_acl_entries_action)
let make_delete_network_acl_entries_action
  ?fms_can_remediate:(fms_can_remediate_ : boolean_ option)
  ?network_acl_entries_to_be_deleted:(network_acl_entries_to_be_deleted_ :
                                       entries_description option)
  ?network_acl_id:(network_acl_id_ : action_target option)
  ?description:(description_ : length_bounded_string option) () =
  ({
     fms_can_remediate = fms_can_remediate_;
     network_acl_entries_to_be_deleted = network_acl_entries_to_be_deleted_;
     network_acl_id = network_acl_id_;
     description = description_
   } : delete_network_acl_entries_action)
let make_remediation_action
  ?delete_network_acl_entries_action:(delete_network_acl_entries_action_ :
                                       delete_network_acl_entries_action
                                         option)
  ?create_network_acl_entries_action:(create_network_acl_entries_action_ :
                                       create_network_acl_entries_action
                                         option)
  ?replace_network_acl_association_action:(replace_network_acl_association_action_
                                            :
                                            replace_network_acl_association_action
                                              option)
  ?create_network_acl_action:(create_network_acl_action_ :
                               create_network_acl_action option)
  ?fms_policy_update_firewall_creation_config_action:(fms_policy_update_firewall_creation_config_action_
                                                       :
                                                       fms_policy_update_firewall_creation_config_action
                                                         option)
  ?ec2_create_route_table_action:(ec2_create_route_table_action_ :
                                   ec2_create_route_table_action option)
  ?ec2_associate_route_table_action:(ec2_associate_route_table_action_ :
                                      ec2_associate_route_table_action option)
  ?ec2_replace_route_table_association_action:(ec2_replace_route_table_association_action_
                                                :
                                                ec2_replace_route_table_association_action
                                                  option)
  ?ec2_copy_route_table_action:(ec2_copy_route_table_action_ :
                                 ec2_copy_route_table_action option)
  ?ec2_delete_route_action:(ec2_delete_route_action_ :
                             ec2_delete_route_action option)
  ?ec2_replace_route_action:(ec2_replace_route_action_ :
                              ec2_replace_route_action option)
  ?ec2_create_route_action:(ec2_create_route_action_ :
                             ec2_create_route_action option)
  ?description:(description_ : length_bounded_string option) () =
  ({
     delete_network_acl_entries_action = delete_network_acl_entries_action_;
     create_network_acl_entries_action = create_network_acl_entries_action_;
     replace_network_acl_association_action =
       replace_network_acl_association_action_;
     create_network_acl_action = create_network_acl_action_;
     fms_policy_update_firewall_creation_config_action =
       fms_policy_update_firewall_creation_config_action_;
     ec2_create_route_table_action = ec2_create_route_table_action_;
     ec2_associate_route_table_action = ec2_associate_route_table_action_;
     ec2_replace_route_table_association_action =
       ec2_replace_route_table_association_action_;
     ec2_copy_route_table_action = ec2_copy_route_table_action_;
     ec2_delete_route_action = ec2_delete_route_action_;
     ec2_replace_route_action = ec2_replace_route_action_;
     ec2_create_route_action = ec2_create_route_action_;
     description = description_
   } : remediation_action)
let make_remediation_action_with_order ?order:(order_ : basic_integer option)
  ?remediation_action:(remediation_action_ : remediation_action option) () =
  ({ order = order_; remediation_action = remediation_action_ } : remediation_action_with_order)
let make_possible_remediation_action
  ?is_default_action:(is_default_action_ : boolean_ option)
  ?description:(description_ : length_bounded_string option)
  ~ordered_remediation_actions:(ordered_remediation_actions_ :
                                 ordered_remediation_actions)
  () =
  ({
     is_default_action = is_default_action_;
     ordered_remediation_actions = ordered_remediation_actions_;
     description = description_
   } : possible_remediation_action)
let make_possible_remediation_actions
  ?actions:(actions_ : possible_remediation_action_list option)
  ?description:(description_ : length_bounded_string option) () =
  ({ actions = actions_; description = description_ } : possible_remediation_actions)
let make_resource_violation
  ?web_acl_has_out_of_scope_resources_violation:(web_acl_has_out_of_scope_resources_violation_
                                                  :
                                                  web_acl_has_out_of_scope_resources_violation
                                                    option)
  ?web_acl_has_incompatible_configuration_violation:(web_acl_has_incompatible_configuration_violation_
                                                      :
                                                      web_acl_has_incompatible_configuration_violation
                                                        option)
  ?possible_remediation_actions:(possible_remediation_actions_ :
                                  possible_remediation_actions option)
  ?invalid_network_acl_entries_violation:(invalid_network_acl_entries_violation_
                                           :
                                           invalid_network_acl_entries_violation
                                             option)
  ?firewall_subnet_missing_vpc_endpoint_violation:(firewall_subnet_missing_vpc_endpoint_violation_
                                                    :
                                                    firewall_subnet_missing_vpc_endpoint_violation
                                                      option)
  ?third_party_firewall_missing_expected_route_table_violation:(third_party_firewall_missing_expected_route_table_violation_
                                                                 :
                                                                 third_party_firewall_missing_expected_route_table_violation
                                                                   option)
  ?third_party_firewall_missing_subnet_violation:(third_party_firewall_missing_subnet_violation_
                                                   :
                                                   third_party_firewall_missing_subnet_violation
                                                     option)
  ?third_party_firewall_missing_firewall_violation:(third_party_firewall_missing_firewall_violation_
                                                     :
                                                     third_party_firewall_missing_firewall_violation
                                                       option)
  ?route_has_out_of_scope_endpoint_violation:(route_has_out_of_scope_endpoint_violation_
                                               :
                                               route_has_out_of_scope_endpoint_violation
                                                 option)
  ?firewall_subnet_is_out_of_scope_violation:(firewall_subnet_is_out_of_scope_violation_
                                               :
                                               firewall_subnet_is_out_of_scope_violation
                                                 option)
  ?dns_rule_group_limit_exceeded_violation:(dns_rule_group_limit_exceeded_violation_
                                             :
                                             dns_rule_group_limit_exceeded_violation
                                               option)
  ?dns_duplicate_rule_group_violation:(dns_duplicate_rule_group_violation_ :
                                        dns_duplicate_rule_group_violation
                                          option)
  ?dns_rule_group_priority_conflict_violation:(dns_rule_group_priority_conflict_violation_
                                                :
                                                dns_rule_group_priority_conflict_violation
                                                  option)
  ?network_firewall_missing_expected_routes_violation:(network_firewall_missing_expected_routes_violation_
                                                        :
                                                        network_firewall_missing_expected_routes_violation
                                                          option)
  ?network_firewall_unexpected_gateway_routes_violation:(network_firewall_unexpected_gateway_routes_violation_
                                                          :
                                                          network_firewall_unexpected_gateway_routes_violation
                                                            option)
  ?network_firewall_unexpected_firewall_routes_violation:(network_firewall_unexpected_firewall_routes_violation_
                                                           :
                                                           network_firewall_unexpected_firewall_routes_violation
                                                             option)
  ?network_firewall_black_hole_route_detected_violation:(network_firewall_black_hole_route_detected_violation_
                                                          :
                                                          network_firewall_black_hole_route_detected_violation
                                                            option)
  ?network_firewall_invalid_route_configuration_violation:(network_firewall_invalid_route_configuration_violation_
                                                            :
                                                            network_firewall_invalid_route_configuration_violation
                                                              option)
  ?network_firewall_internet_traffic_not_inspected_violation:(network_firewall_internet_traffic_not_inspected_violation_
                                                               :
                                                               network_firewall_internet_traffic_not_inspected_violation
                                                                 option)
  ?network_firewall_policy_modified_violation:(network_firewall_policy_modified_violation_
                                                :
                                                network_firewall_policy_modified_violation
                                                  option)
  ?network_firewall_missing_expected_rt_violation:(network_firewall_missing_expected_rt_violation_
                                                    :
                                                    network_firewall_missing_expected_rt_violation
                                                      option)
  ?network_firewall_missing_subnet_violation:(network_firewall_missing_subnet_violation_
                                               :
                                               network_firewall_missing_subnet_violation
                                                 option)
  ?network_firewall_missing_firewall_violation:(network_firewall_missing_firewall_violation_
                                                 :
                                                 network_firewall_missing_firewall_violation
                                                   option)
  ?aws_ec2_instance_violation:(aws_ec2_instance_violation_ :
                                aws_ec2_instance_violation option)
  ?aws_ec2_network_interface_violation:(aws_ec2_network_interface_violation_
                                         :
                                         aws_ec2_network_interface_violation
                                           option)
  ?aws_vpc_security_group_violation:(aws_vpc_security_group_violation_ :
                                      aws_vpc_security_group_violation option)
  () =
  ({
     web_acl_has_out_of_scope_resources_violation =
       web_acl_has_out_of_scope_resources_violation_;
     web_acl_has_incompatible_configuration_violation =
       web_acl_has_incompatible_configuration_violation_;
     possible_remediation_actions = possible_remediation_actions_;
     invalid_network_acl_entries_violation =
       invalid_network_acl_entries_violation_;
     firewall_subnet_missing_vpc_endpoint_violation =
       firewall_subnet_missing_vpc_endpoint_violation_;
     third_party_firewall_missing_expected_route_table_violation =
       third_party_firewall_missing_expected_route_table_violation_;
     third_party_firewall_missing_subnet_violation =
       third_party_firewall_missing_subnet_violation_;
     third_party_firewall_missing_firewall_violation =
       third_party_firewall_missing_firewall_violation_;
     route_has_out_of_scope_endpoint_violation =
       route_has_out_of_scope_endpoint_violation_;
     firewall_subnet_is_out_of_scope_violation =
       firewall_subnet_is_out_of_scope_violation_;
     dns_rule_group_limit_exceeded_violation =
       dns_rule_group_limit_exceeded_violation_;
     dns_duplicate_rule_group_violation = dns_duplicate_rule_group_violation_;
     dns_rule_group_priority_conflict_violation =
       dns_rule_group_priority_conflict_violation_;
     network_firewall_missing_expected_routes_violation =
       network_firewall_missing_expected_routes_violation_;
     network_firewall_unexpected_gateway_routes_violation =
       network_firewall_unexpected_gateway_routes_violation_;
     network_firewall_unexpected_firewall_routes_violation =
       network_firewall_unexpected_firewall_routes_violation_;
     network_firewall_black_hole_route_detected_violation =
       network_firewall_black_hole_route_detected_violation_;
     network_firewall_invalid_route_configuration_violation =
       network_firewall_invalid_route_configuration_violation_;
     network_firewall_internet_traffic_not_inspected_violation =
       network_firewall_internet_traffic_not_inspected_violation_;
     network_firewall_policy_modified_violation =
       network_firewall_policy_modified_violation_;
     network_firewall_missing_expected_rt_violation =
       network_firewall_missing_expected_rt_violation_;
     network_firewall_missing_subnet_violation =
       network_firewall_missing_subnet_violation_;
     network_firewall_missing_firewall_violation =
       network_firewall_missing_firewall_violation_;
     aws_ec2_instance_violation = aws_ec2_instance_violation_;
     aws_ec2_network_interface_violation =
       aws_ec2_network_interface_violation_;
     aws_vpc_security_group_violation = aws_vpc_security_group_violation_
   } : resource_violation)
let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)
let make_violation_detail
  ?resource_description:(resource_description_ :
                          length_bounded_string option)
  ?resource_tags:(resource_tags_ : tag_list option)
  ~resource_violations:(resource_violations_ : resource_violations)
  ~resource_type:(resource_type_ : resource_type)
  ~resource_id:(resource_id_ : resource_id)
  ~member_account:(member_account_ : aws_account_id)
  ~policy_id:(policy_id_ : policy_id) () =
  ({
     resource_description = resource_description_;
     resource_tags = resource_tags_;
     resource_violations = resource_violations_;
     resource_type = resource_type_;
     resource_id = resource_id_;
     member_account = member_account_;
     policy_id = policy_id_
   } : violation_detail)
let make_untag_resource_response () = (() : unit)
let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
  ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)
let make_third_party_firewall_policy
  ?firewall_deployment_model:(firewall_deployment_model_ :
                               firewall_deployment_model option)
  () =
  ({ firewall_deployment_model = firewall_deployment_model_ } : third_party_firewall_policy)
let make_third_party_firewall_firewall_policy
  ?firewall_policy_name:(firewall_policy_name_ : firewall_policy_name option)
  ?firewall_policy_id:(firewall_policy_id_ : firewall_policy_id option) () =
  ({
     firewall_policy_name = firewall_policy_name_;
     firewall_policy_id = firewall_policy_id_
   } : third_party_firewall_firewall_policy)
let make_tag_resource_response () = (() : unit)
let make_tag_resource_request ~tag_list:(tag_list_ : tag_list)
  ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ tag_list = tag_list_; resource_arn = resource_arn_ } : tag_resource_request)
let make_network_firewall_policy
  ?firewall_deployment_model:(firewall_deployment_model_ :
                               firewall_deployment_model option)
  () =
  ({ firewall_deployment_model = firewall_deployment_model_ } : network_firewall_policy)
let make_network_acl_entry_set
  ?last_entries:(last_entries_ : network_acl_entries option)
  ?first_entries:(first_entries_ : network_acl_entries option)
  ~force_remediate_for_last_entries:(force_remediate_for_last_entries_ :
                                      boolean_object)
  ~force_remediate_for_first_entries:(force_remediate_for_first_entries_ :
                                       boolean_object)
  () =
  ({
     force_remediate_for_last_entries = force_remediate_for_last_entries_;
     last_entries = last_entries_;
     force_remediate_for_first_entries = force_remediate_for_first_entries_;
     first_entries = first_entries_
   } : network_acl_entry_set)
let make_network_acl_common_policy
  ~network_acl_entry_set:(network_acl_entry_set_ : network_acl_entry_set) ()
  =
  ({ network_acl_entry_set = network_acl_entry_set_ } : network_acl_common_policy)
let make_policy_option
  ?network_acl_common_policy:(network_acl_common_policy_ :
                               network_acl_common_policy option)
  ?third_party_firewall_policy:(third_party_firewall_policy_ :
                                 third_party_firewall_policy option)
  ?network_firewall_policy:(network_firewall_policy_ :
                             network_firewall_policy option)
  () =
  ({
     network_acl_common_policy = network_acl_common_policy_;
     third_party_firewall_policy = third_party_firewall_policy_;
     network_firewall_policy = network_firewall_policy_
   } : policy_option)
let make_security_service_policy_data
  ?policy_option:(policy_option_ : policy_option option)
  ?managed_service_data:(managed_service_data_ : managed_service_data option)
  ~type_:(type__ : security_service_type) () =
  ({
     policy_option = policy_option_;
     managed_service_data = managed_service_data_;
     type_ = type__
   } : security_service_policy_data)
let make_resource_tag ?value:(value_ : resource_tag_value option)
  ~key:(key_ : resource_tag_key) () =
  ({ value = value_; key = key_ } : resource_tag)
let make_resource_set_summary
  ?resource_set_status:(resource_set_status_ : resource_set_status option)
  ?last_update_time:(last_update_time_ : time_stamp option)
  ?description:(description_ : description option)
  ?name:(name_ : name option) ?id:(id_ : base62_id option) () =
  ({
     resource_set_status = resource_set_status_;
     last_update_time = last_update_time_;
     description = description_;
     name = name_;
     id = id_
   } : resource_set_summary)
let make_resource_set
  ?resource_set_status:(resource_set_status_ : resource_set_status option)
  ?last_update_time:(last_update_time_ : time_stamp option)
  ?update_token:(update_token_ : update_token option)
  ?description:(description_ : description option)
  ?id:(id_ : base62_id option)
  ~resource_type_list:(resource_type_list_ : resource_type_list)
  ~name:(name_ : name) () =
  ({
     resource_set_status = resource_set_status_;
     last_update_time = last_update_time_;
     resource_type_list = resource_type_list_;
     update_token = update_token_;
     description = description_;
     name = name_;
     id = id_
   } : resource_set)
let make_resource ?account_id:(account_id_ : aws_account_id option)
  ~ur_i:(ur_i_ : identifier) () =
  ({ account_id = account_id_; ur_i = ur_i_ } : resource)
let make_region_scope
  ?all_regions_enabled:(all_regions_enabled_ : boolean_ option)
  ?regions:(regions_ : aws_region_list option) () =
  ({ all_regions_enabled = all_regions_enabled_; regions = regions_ } : 
  region_scope)
let make_put_resource_set_response
  ~resource_set_arn:(resource_set_arn_ : resource_arn)
  ~resource_set:(resource_set_ : resource_set) () =
  ({ resource_set_arn = resource_set_arn_; resource_set = resource_set_ } : 
  put_resource_set_response)
let make_put_resource_set_request ?tag_list:(tag_list_ : tag_list option)
  ~resource_set:(resource_set_ : resource_set) () =
  ({ tag_list = tag_list_; resource_set = resource_set_ } : put_resource_set_request)
let make_protocols_list_data
  ?previous_protocols_list:(previous_protocols_list_ :
                             previous_protocols_list option)
  ?last_update_time:(last_update_time_ : time_stamp option)
  ?create_time:(create_time_ : time_stamp option)
  ?list_update_token:(list_update_token_ : update_token option)
  ?list_id:(list_id_ : list_id option)
  ~protocols_list:(protocols_list_ : protocols_list)
  ~list_name:(list_name_ : resource_name) () =
  ({
     previous_protocols_list = previous_protocols_list_;
     protocols_list = protocols_list_;
     last_update_time = last_update_time_;
     create_time = create_time_;
     list_update_token = list_update_token_;
     list_name = list_name_;
     list_id = list_id_
   } : protocols_list_data)
let make_put_protocols_list_response
  ?protocols_list_arn:(protocols_list_arn_ : resource_arn option)
  ?protocols_list:(protocols_list_ : protocols_list_data option) () =
  ({
     protocols_list_arn = protocols_list_arn_;
     protocols_list = protocols_list_
   } : put_protocols_list_response)
let make_put_protocols_list_request ?tag_list:(tag_list_ : tag_list option)
  ~protocols_list:(protocols_list_ : protocols_list_data) () =
  ({ tag_list = tag_list_; protocols_list = protocols_list_ } : put_protocols_list_request)
let make_policy
  ?resource_tag_logical_operator:(resource_tag_logical_operator_ :
                                   resource_tag_logical_operator option)
  ?policy_status:(policy_status_ : customer_policy_status option)
  ?policy_description:(policy_description_ : resource_description option)
  ?resource_set_ids:(resource_set_ids_ : resource_set_ids option)
  ?exclude_map:(exclude_map_ : customer_policy_scope_map option)
  ?include_map:(include_map_ : customer_policy_scope_map option)
  ?delete_unused_fm_managed_resources:(delete_unused_fm_managed_resources_ :
                                        boolean_ option)
  ?resource_tags:(resource_tags_ : resource_tags option)
  ?resource_type_list:(resource_type_list_ : resource_type_list option)
  ?policy_update_token:(policy_update_token_ : policy_update_token option)
  ?policy_id:(policy_id_ : policy_id option)
  ~remediation_enabled:(remediation_enabled_ : boolean_)
  ~exclude_resource_tags:(exclude_resource_tags_ : boolean_)
  ~resource_type:(resource_type_ : resource_type)
  ~security_service_policy_data:(security_service_policy_data_ :
                                  security_service_policy_data)
  ~policy_name:(policy_name_ : resource_name) () =
  ({
     resource_tag_logical_operator = resource_tag_logical_operator_;
     policy_status = policy_status_;
     policy_description = policy_description_;
     resource_set_ids = resource_set_ids_;
     exclude_map = exclude_map_;
     include_map = include_map_;
     delete_unused_fm_managed_resources = delete_unused_fm_managed_resources_;
     remediation_enabled = remediation_enabled_;
     exclude_resource_tags = exclude_resource_tags_;
     resource_tags = resource_tags_;
     resource_type_list = resource_type_list_;
     resource_type = resource_type_;
     security_service_policy_data = security_service_policy_data_;
     policy_update_token = policy_update_token_;
     policy_name = policy_name_;
     policy_id = policy_id_
   } : policy)
let make_put_policy_response ?policy_arn:(policy_arn_ : resource_arn option)
  ?policy:(policy_ : policy option) () =
  ({ policy_arn = policy_arn_; policy = policy_ } : put_policy_response)
let make_put_policy_request ?tag_list:(tag_list_ : tag_list option)
  ~policy:(policy_ : policy) () =
  ({ tag_list = tag_list_; policy = policy_ } : put_policy_request)
let make_put_notification_channel_request
  ~sns_role_name:(sns_role_name_ : resource_arn)
  ~sns_topic_arn:(sns_topic_arn_ : resource_arn) () =
  ({ sns_role_name = sns_role_name_; sns_topic_arn = sns_topic_arn_ } : 
  put_notification_channel_request)
let make_app ~port:(port_ : ip_port_number) ~protocol:(protocol_ : protocol)
  ~app_name:(app_name_ : resource_name) () =
  ({ port = port_; protocol = protocol_; app_name = app_name_ } : app)
let make_apps_list_data
  ?previous_apps_list:(previous_apps_list_ : previous_apps_list option)
  ?last_update_time:(last_update_time_ : time_stamp option)
  ?create_time:(create_time_ : time_stamp option)
  ?list_update_token:(list_update_token_ : update_token option)
  ?list_id:(list_id_ : list_id option) ~apps_list:(apps_list_ : apps_list)
  ~list_name:(list_name_ : resource_name) () =
  ({
     previous_apps_list = previous_apps_list_;
     apps_list = apps_list_;
     last_update_time = last_update_time_;
     create_time = create_time_;
     list_update_token = list_update_token_;
     list_name = list_name_;
     list_id = list_id_
   } : apps_list_data)
let make_put_apps_list_response
  ?apps_list_arn:(apps_list_arn_ : resource_arn option)
  ?apps_list:(apps_list_ : apps_list_data option) () =
  ({ apps_list_arn = apps_list_arn_; apps_list = apps_list_ } : put_apps_list_response)
let make_put_apps_list_request ?tag_list:(tag_list_ : tag_list option)
  ~apps_list:(apps_list_ : apps_list_data) () =
  ({ tag_list = tag_list_; apps_list = apps_list_ } : put_apps_list_request)
let make_account_scope
  ?exclude_specified_accounts:(exclude_specified_accounts_ : boolean_ option)
  ?all_accounts_enabled:(all_accounts_enabled_ : boolean_ option)
  ?accounts:(accounts_ : account_id_list option) () =
  ({
     exclude_specified_accounts = exclude_specified_accounts_;
     all_accounts_enabled = all_accounts_enabled_;
     accounts = accounts_
   } : account_scope)
let make_organizational_unit_scope
  ?exclude_specified_organizational_units:(exclude_specified_organizational_units_
                                            : boolean_ option)
  ?all_organizational_units_enabled:(all_organizational_units_enabled_ :
                                      boolean_ option)
  ?organizational_units:(organizational_units_ :
                          organizational_unit_id_list option)
  () =
  ({
     exclude_specified_organizational_units =
       exclude_specified_organizational_units_;
     all_organizational_units_enabled = all_organizational_units_enabled_;
     organizational_units = organizational_units_
   } : organizational_unit_scope)
let make_policy_type_scope
  ?all_policy_types_enabled:(all_policy_types_enabled_ : boolean_ option)
  ?policy_types:(policy_types_ : security_service_type_list option) () =
  ({
     all_policy_types_enabled = all_policy_types_enabled_;
     policy_types = policy_types_
   } : policy_type_scope)
let make_admin_scope
  ?policy_type_scope:(policy_type_scope_ : policy_type_scope option)
  ?region_scope:(region_scope_ : region_scope option)
  ?organizational_unit_scope:(organizational_unit_scope_ :
                               organizational_unit_scope option)
  ?account_scope:(account_scope_ : account_scope option) () =
  ({
     policy_type_scope = policy_type_scope_;
     region_scope = region_scope_;
     organizational_unit_scope = organizational_unit_scope_;
     account_scope = account_scope_
   } : admin_scope)
let make_put_admin_account_request
  ?admin_scope:(admin_scope_ : admin_scope option)
  ~admin_account:(admin_account_ : aws_account_id) () =
  ({ admin_scope = admin_scope_; admin_account = admin_account_ } : put_admin_account_request)
let make_protocols_list_data_summary
  ?protocols_list:(protocols_list_ : protocols_list option)
  ?list_name:(list_name_ : resource_name option)
  ?list_id:(list_id_ : list_id option)
  ?list_arn:(list_arn_ : resource_arn option) () =
  ({
     protocols_list = protocols_list_;
     list_name = list_name_;
     list_id = list_id_;
     list_arn = list_arn_
   } : protocols_list_data_summary)
let make_policy_summary
  ?policy_status:(policy_status_ : customer_policy_status option)
  ?delete_unused_fm_managed_resources:(delete_unused_fm_managed_resources_ :
                                        boolean_ option)
  ?remediation_enabled:(remediation_enabled_ : boolean_ option)
  ?security_service_type:(security_service_type_ :
                           security_service_type option)
  ?resource_type:(resource_type_ : resource_type option)
  ?policy_name:(policy_name_ : resource_name option)
  ?policy_id:(policy_id_ : policy_id option)
  ?policy_arn:(policy_arn_ : resource_arn option) () =
  ({
     policy_status = policy_status_;
     delete_unused_fm_managed_resources = delete_unused_fm_managed_resources_;
     remediation_enabled = remediation_enabled_;
     security_service_type = security_service_type_;
     resource_type = resource_type_;
     policy_name = policy_name_;
     policy_id = policy_id_;
     policy_arn = policy_arn_
   } : policy_summary)
let make_policy_compliance_status
  ?issue_info_map:(issue_info_map_ : issue_info_map option)
  ?last_updated:(last_updated_ : time_stamp option)
  ?evaluation_results:(evaluation_results_ : evaluation_results option)
  ?member_account:(member_account_ : aws_account_id option)
  ?policy_name:(policy_name_ : resource_name option)
  ?policy_id:(policy_id_ : policy_id option)
  ?policy_owner:(policy_owner_ : aws_account_id option) () =
  ({
     issue_info_map = issue_info_map_;
     last_updated = last_updated_;
     evaluation_results = evaluation_results_;
     member_account = member_account_;
     policy_name = policy_name_;
     policy_id = policy_id_;
     policy_owner = policy_owner_
   } : policy_compliance_status)
let make_compliance_violator
  ?metadata:(metadata_ : compliance_violator_metadata option)
  ?resource_type:(resource_type_ : resource_type option)
  ?violation_reason:(violation_reason_ : violation_reason option)
  ?resource_id:(resource_id_ : resource_id option) () =
  ({
     metadata = metadata_;
     resource_type = resource_type_;
     violation_reason = violation_reason_;
     resource_id = resource_id_
   } : compliance_violator)
let make_policy_compliance_detail
  ?issue_info_map:(issue_info_map_ : issue_info_map option)
  ?expired_at:(expired_at_ : time_stamp option)
  ?evaluation_limit_exceeded:(evaluation_limit_exceeded_ : boolean_ option)
  ?violators:(violators_ : compliance_violators option)
  ?member_account:(member_account_ : aws_account_id option)
  ?policy_id:(policy_id_ : policy_id option)
  ?policy_owner:(policy_owner_ : aws_account_id option) () =
  ({
     issue_info_map = issue_info_map_;
     expired_at = expired_at_;
     evaluation_limit_exceeded = evaluation_limit_exceeded_;
     violators = violators_;
     member_account = member_account_;
     policy_id = policy_id_;
     policy_owner = policy_owner_
   } : policy_compliance_detail)
let make_list_third_party_firewall_firewall_policies_response
  ?next_token:(next_token_ : pagination_token option)
  ?third_party_firewall_firewall_policies:(third_party_firewall_firewall_policies_
                                            :
                                            third_party_firewall_firewall_policies
                                              option)
  () =
  ({
     next_token = next_token_;
     third_party_firewall_firewall_policies =
       third_party_firewall_firewall_policies_
   } : list_third_party_firewall_firewall_policies_response)
let make_list_third_party_firewall_firewall_policies_request
  ?next_token:(next_token_ : pagination_token option)
  ~max_results:(max_results_ : pagination_max_results)
  ~third_party_firewall:(third_party_firewall_ : third_party_firewall) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     third_party_firewall = third_party_firewall_
   } : list_third_party_firewall_firewall_policies_request)
let make_list_tags_for_resource_response
  ?tag_list:(tag_list_ : tag_list option) () =
  ({ tag_list = tag_list_ } : list_tags_for_resource_response)
let make_list_tags_for_resource_request
  ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)
let make_list_resource_sets_response
  ?next_token:(next_token_ : pagination_token option)
  ?resource_sets:(resource_sets_ : resource_set_summary_list option) () =
  ({ next_token = next_token_; resource_sets = resource_sets_ } : list_resource_sets_response)
let make_list_resource_sets_request
  ?max_results:(max_results_ : pagination_max_results option)
  ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_resource_sets_request)
let make_list_resource_set_resources_response
  ?next_token:(next_token_ : pagination_token option)
  ~items:(items_ : resource_list) () =
  ({ next_token = next_token_; items = items_ } : list_resource_set_resources_response)
let make_list_resource_set_resources_request
  ?next_token:(next_token_ : pagination_token option)
  ?max_results:(max_results_ : pagination_max_results option)
  ~identifier:(identifier_ : resource_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     identifier = identifier_
   } : list_resource_set_resources_request)
let make_list_protocols_lists_response
  ?next_token:(next_token_ : pagination_token option)
  ?protocols_lists:(protocols_lists_ : protocols_lists_data option) () =
  ({ next_token = next_token_; protocols_lists = protocols_lists_ } : 
  list_protocols_lists_response)
let make_list_protocols_lists_request
  ?next_token:(next_token_ : pagination_token option)
  ?default_lists:(default_lists_ : boolean_ option)
  ~max_results:(max_results_ : pagination_max_results) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     default_lists = default_lists_
   } : list_protocols_lists_request)
let make_list_policies_response
  ?next_token:(next_token_ : pagination_token option)
  ?policy_list:(policy_list_ : policy_summary_list option) () =
  ({ next_token = next_token_; policy_list = policy_list_ } : list_policies_response)
let make_list_policies_request
  ?max_results:(max_results_ : pagination_max_results option)
  ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_policies_request)
let make_list_member_accounts_response
  ?next_token:(next_token_ : pagination_token option)
  ?member_accounts:(member_accounts_ : member_accounts option) () =
  ({ next_token = next_token_; member_accounts = member_accounts_ } : 
  list_member_accounts_response)
let make_list_member_accounts_request
  ?max_results:(max_results_ : pagination_max_results option)
  ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_member_accounts_request)
let make_discovered_resource ?name:(name_ : resource_name option)
  ?type_:(type__ : resource_type option)
  ?account_id:(account_id_ : aws_account_id option)
  ?ur_i:(ur_i_ : identifier option) () =
  ({ name = name_; type_ = type__; account_id = account_id_; ur_i = ur_i_ } : 
  discovered_resource)
let make_list_discovered_resources_response
  ?next_token:(next_token_ : pagination_token option)
  ?items:(items_ : discovered_resource_list option) () =
  ({ next_token = next_token_; items = items_ } : list_discovered_resources_response)
let make_list_discovered_resources_request
  ?next_token:(next_token_ : pagination_token option)
  ?max_results:(max_results_ : pagination_max_results option)
  ~resource_type:(resource_type_ : resource_type)
  ~member_account_ids:(member_account_ids_ : aws_account_id_list) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     resource_type = resource_type_;
     member_account_ids = member_account_ids_
   } : list_discovered_resources_request)
let make_list_compliance_status_response
  ?next_token:(next_token_ : pagination_token option)
  ?policy_compliance_status_list:(policy_compliance_status_list_ :
                                   policy_compliance_status_list option)
  () =
  ({
     next_token = next_token_;
     policy_compliance_status_list = policy_compliance_status_list_
   } : list_compliance_status_response)
let make_list_compliance_status_request
  ?max_results:(max_results_ : pagination_max_results option)
  ?next_token:(next_token_ : pagination_token option)
  ~policy_id:(policy_id_ : policy_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     policy_id = policy_id_
   } : list_compliance_status_request)
let make_apps_list_data_summary ?apps_list:(apps_list_ : apps_list option)
  ?list_name:(list_name_ : resource_name option)
  ?list_id:(list_id_ : list_id option)
  ?list_arn:(list_arn_ : resource_arn option) () =
  ({
     apps_list = apps_list_;
     list_name = list_name_;
     list_id = list_id_;
     list_arn = list_arn_
   } : apps_list_data_summary)
let make_list_apps_lists_response
  ?next_token:(next_token_ : pagination_token option)
  ?apps_lists:(apps_lists_ : apps_lists_data option) () =
  ({ next_token = next_token_; apps_lists = apps_lists_ } : list_apps_lists_response)
let make_list_apps_lists_request
  ?next_token:(next_token_ : pagination_token option)
  ?default_lists:(default_lists_ : boolean_ option)
  ~max_results:(max_results_ : pagination_max_results) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     default_lists = default_lists_
   } : list_apps_lists_request)
let make_list_admins_managing_account_response
  ?next_token:(next_token_ : pagination_token option)
  ?admin_accounts:(admin_accounts_ : account_id_list option) () =
  ({ next_token = next_token_; admin_accounts = admin_accounts_ } : list_admins_managing_account_response)
let make_list_admins_managing_account_request
  ?max_results:(max_results_ : pagination_max_results option)
  ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_admins_managing_account_request)
let make_admin_account_summary ?status:(status_ : organization_status option)
  ?default_admin:(default_admin_ : boolean_ option)
  ?admin_account:(admin_account_ : aws_account_id option) () =
  ({
     status = status_;
     default_admin = default_admin_;
     admin_account = admin_account_
   } : admin_account_summary)
let make_list_admin_accounts_for_organization_response
  ?next_token:(next_token_ : pagination_token option)
  ?admin_accounts:(admin_accounts_ : admin_account_summary_list option) () =
  ({ next_token = next_token_; admin_accounts = admin_accounts_ } : list_admin_accounts_for_organization_response)
let make_list_admin_accounts_for_organization_request
  ?max_results:(max_results_ : pagination_max_results option)
  ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_admin_accounts_for_organization_request)
let make_get_violation_details_response
  ?violation_detail:(violation_detail_ : violation_detail option) () =
  ({ violation_detail = violation_detail_ } : get_violation_details_response)
let make_get_violation_details_request
  ~resource_type:(resource_type_ : resource_type)
  ~resource_id:(resource_id_ : resource_id)
  ~member_account:(member_account_ : aws_account_id)
  ~policy_id:(policy_id_ : policy_id) () =
  ({
     resource_type = resource_type_;
     resource_id = resource_id_;
     member_account = member_account_;
     policy_id = policy_id_
   } : get_violation_details_request)
let make_get_third_party_firewall_association_status_response
  ?marketplace_onboarding_status:(marketplace_onboarding_status_ :
                                   marketplace_subscription_onboarding_status
                                     option)
  ?third_party_firewall_status:(third_party_firewall_status_ :
                                 third_party_firewall_association_status
                                   option)
  () =
  ({
     marketplace_onboarding_status = marketplace_onboarding_status_;
     third_party_firewall_status = third_party_firewall_status_
   } : get_third_party_firewall_association_status_response)
let make_get_third_party_firewall_association_status_request
  ~third_party_firewall:(third_party_firewall_ : third_party_firewall) () =
  ({ third_party_firewall = third_party_firewall_ } : get_third_party_firewall_association_status_request)
let make_get_resource_set_response
  ~resource_set_arn:(resource_set_arn_ : resource_arn)
  ~resource_set:(resource_set_ : resource_set) () =
  ({ resource_set_arn = resource_set_arn_; resource_set = resource_set_ } : 
  get_resource_set_response)
let make_get_resource_set_request ~identifier:(identifier_ : base62_id) () =
  ({ identifier = identifier_ } : get_resource_set_request)
let make_get_protocols_list_response
  ?protocols_list_arn:(protocols_list_arn_ : resource_arn option)
  ?protocols_list:(protocols_list_ : protocols_list_data option) () =
  ({
     protocols_list_arn = protocols_list_arn_;
     protocols_list = protocols_list_
   } : get_protocols_list_response)
let make_get_protocols_list_request
  ?default_list:(default_list_ : boolean_ option)
  ~list_id:(list_id_ : list_id) () =
  ({ default_list = default_list_; list_id = list_id_ } : get_protocols_list_request)
let make_get_protection_status_response
  ?next_token:(next_token_ : pagination_token option)
  ?data:(data_ : protection_data option)
  ?service_type:(service_type_ : security_service_type option)
  ?admin_account_id:(admin_account_id_ : aws_account_id option) () =
  ({
     next_token = next_token_;
     data = data_;
     service_type = service_type_;
     admin_account_id = admin_account_id_
   } : get_protection_status_response)
let make_get_protection_status_request
  ?max_results:(max_results_ : pagination_max_results option)
  ?next_token:(next_token_ : pagination_token option)
  ?end_time:(end_time_ : time_stamp option)
  ?start_time:(start_time_ : time_stamp option)
  ?member_account_id:(member_account_id_ : aws_account_id option)
  ~policy_id:(policy_id_ : policy_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     end_time = end_time_;
     start_time = start_time_;
     member_account_id = member_account_id_;
     policy_id = policy_id_
   } : get_protection_status_request)
let make_get_policy_response ?policy_arn:(policy_arn_ : resource_arn option)
  ?policy:(policy_ : policy option) () =
  ({ policy_arn = policy_arn_; policy = policy_ } : get_policy_response)
let make_get_policy_request ~policy_id:(policy_id_ : policy_id) () =
  ({ policy_id = policy_id_ } : get_policy_request)
let make_get_notification_channel_response
  ?sns_role_name:(sns_role_name_ : resource_arn option)
  ?sns_topic_arn:(sns_topic_arn_ : resource_arn option) () =
  ({ sns_role_name = sns_role_name_; sns_topic_arn = sns_topic_arn_ } : 
  get_notification_channel_response)
let make_get_notification_channel_request () = (() : unit)
let make_get_compliance_detail_response
  ?policy_compliance_detail:(policy_compliance_detail_ :
                              policy_compliance_detail option)
  () =
  ({ policy_compliance_detail = policy_compliance_detail_ } : get_compliance_detail_response)
let make_get_compliance_detail_request
  ~member_account:(member_account_ : aws_account_id)
  ~policy_id:(policy_id_ : policy_id) () =
  ({ member_account = member_account_; policy_id = policy_id_ } : get_compliance_detail_request)
let make_get_apps_list_response
  ?apps_list_arn:(apps_list_arn_ : resource_arn option)
  ?apps_list:(apps_list_ : apps_list_data option) () =
  ({ apps_list_arn = apps_list_arn_; apps_list = apps_list_ } : get_apps_list_response)
let make_get_apps_list_request
  ?default_list:(default_list_ : boolean_ option)
  ~list_id:(list_id_ : list_id) () =
  ({ default_list = default_list_; list_id = list_id_ } : get_apps_list_request)
let make_get_admin_scope_response
  ?status:(status_ : organization_status option)
  ?admin_scope:(admin_scope_ : admin_scope option) () =
  ({ status = status_; admin_scope = admin_scope_ } : get_admin_scope_response)
let make_get_admin_scope_request
  ~admin_account:(admin_account_ : aws_account_id) () =
  ({ admin_account = admin_account_ } : get_admin_scope_request)
let make_get_admin_account_response
  ?role_status:(role_status_ : account_role_status option)
  ?admin_account:(admin_account_ : aws_account_id option) () =
  ({ role_status = role_status_; admin_account = admin_account_ } : get_admin_account_response)
let make_get_admin_account_request () = (() : unit)
let make_failed_item ?reason:(reason_ : failed_item_reason option)
  ?ur_i:(ur_i_ : identifier option) () =
  ({ reason = reason_; ur_i = ur_i_ } : failed_item)
let make_disassociate_third_party_firewall_response
  ?third_party_firewall_status:(third_party_firewall_status_ :
                                 third_party_firewall_association_status
                                   option)
  () =
  ({ third_party_firewall_status = third_party_firewall_status_ } : disassociate_third_party_firewall_response)
let make_disassociate_third_party_firewall_request
  ~third_party_firewall:(third_party_firewall_ : third_party_firewall) () =
  ({ third_party_firewall = third_party_firewall_ } : disassociate_third_party_firewall_request)
let make_disassociate_admin_account_request () = (() : unit)
let make_delete_resource_set_request ~identifier:(identifier_ : base62_id) ()
  = ({ identifier = identifier_ } : delete_resource_set_request)
let make_delete_protocols_list_request ~list_id:(list_id_ : list_id) () =
  ({ list_id = list_id_ } : delete_protocols_list_request)
let make_delete_policy_request
  ?delete_all_policy_resources:(delete_all_policy_resources_ :
                                 boolean_ option)
  ~policy_id:(policy_id_ : policy_id) () =
  ({
     delete_all_policy_resources = delete_all_policy_resources_;
     policy_id = policy_id_
   } : delete_policy_request)
let make_delete_notification_channel_request () = (() : unit)
let make_delete_apps_list_request ~list_id:(list_id_ : list_id) () =
  ({ list_id = list_id_ } : delete_apps_list_request)
let make_batch_disassociate_resource_response
  ~failed_items:(failed_items_ : failed_item_list)
  ~resource_set_identifier:(resource_set_identifier_ : identifier) () =
  ({
     failed_items = failed_items_;
     resource_set_identifier = resource_set_identifier_
   } : batch_disassociate_resource_response)
let make_batch_disassociate_resource_request
  ~items:(items_ : identifier_list)
  ~resource_set_identifier:(resource_set_identifier_ : identifier) () =
  ({ items = items_; resource_set_identifier = resource_set_identifier_ } : 
  batch_disassociate_resource_request)
let make_batch_associate_resource_response
  ~failed_items:(failed_items_ : failed_item_list)
  ~resource_set_identifier:(resource_set_identifier_ : identifier) () =
  ({
     failed_items = failed_items_;
     resource_set_identifier = resource_set_identifier_
   } : batch_associate_resource_response)
let make_batch_associate_resource_request ~items:(items_ : identifier_list)
  ~resource_set_identifier:(resource_set_identifier_ : identifier) () =
  ({ items = items_; resource_set_identifier = resource_set_identifier_ } : 
  batch_associate_resource_request)
let make_associate_third_party_firewall_response
  ?third_party_firewall_status:(third_party_firewall_status_ :
                                 third_party_firewall_association_status
                                   option)
  () =
  ({ third_party_firewall_status = third_party_firewall_status_ } : associate_third_party_firewall_response)
let make_associate_third_party_firewall_request
  ~third_party_firewall:(third_party_firewall_ : third_party_firewall) () =
  ({ third_party_firewall = third_party_firewall_ } : associate_third_party_firewall_request)
let make_associate_admin_account_request
  ~admin_account:(admin_account_ : aws_account_id) () =
  ({ admin_account = admin_account_ } : associate_admin_account_request)