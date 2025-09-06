open Smaws_Lib.Json.DeserializeHelpers
open Types

let resource_arn_of_yojson = string_of_yojson
let resource_arn_list_of_yojson tree path = list_of_yojson resource_arn_of_yojson tree path

let web_acl_has_out_of_scope_resources_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     out_of_scope_resource_list =
       option_of_yojson
         (value_for_key resource_arn_list_of_yojson "OutOfScopeResourceList")
         _list path;
     web_acl_arn = option_of_yojson (value_for_key resource_arn_of_yojson "WebACLArn") _list path;
   }
    : web_acl_has_out_of_scope_resources_violation)

let length_bounded_string_of_yojson = string_of_yojson

let web_acl_has_incompatible_configuration_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key length_bounded_string_of_yojson "Description") _list path;
     web_acl_arn = option_of_yojson (value_for_key resource_arn_of_yojson "WebACLArn") _list path;
   }
    : web_acl_has_incompatible_configuration_violation)

let violation_target_of_yojson = string_of_yojson

let violation_reason_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "WEB_ACL_CONFIGURATION_OR_SCOPE_OF_USE" -> WebACLConfigurationOrScopeOfUse
    | `String "INVALID_NETWORK_ACL_ENTRY" -> InvalidNetworkAclEntry
    | `String "FIREWALL_SUBNET_MISSING_VPCE_ENDPOINT" -> FirewallSubnetMissingVPCEndpoint
    | `String "ROUTE_HAS_OUT_OF_SCOPE_ENDPOINT" -> RouteHasOutOfScopeEndpoint
    | `String "RESOURCE_MISSING_DNS_FIREWALL" -> ResourceMissingDnsFirewall
    | `String "BLACK_HOLE_ROUTE_DETECTED_IN_FIREWALL_SUBNET" ->
        BlackHoleRouteDetectedInFirewallSubnet
    | `String "BLACK_HOLE_ROUTE_DETECTED" -> BlackHoleRouteDetected
    | `String "INTERNET_TRAFFIC_NOT_INSPECTED" -> InternetTrafficNotInspected
    | `String "MISSING_TARGET_GATEWAY" -> MissingTargetGateway
    | `String "INVALID_ROUTE_CONFIGURATION" -> InvalidRouteConfiguration
    | `String "TRAFFIC_INSPECTION_CROSSES_AZ_BOUNDARY" -> TrafficInspectionCrossesAZBoundary
    | `String "UNEXPECTED_TARGET_GATEWAY_ROUTES" -> UnexpectedTargetGatewayRoutes
    | `String "UNEXPECTED_FIREWALL_ROUTES" -> UnexpectedFirewallRoutes
    | `String "FIREWALL_SUBNET_MISSING_EXPECTED_ROUTE" -> FirewallSubnetMissingExpectedRoute
    | `String "INTERNET_GATEWAY_MISSING_EXPECTED_ROUTE" -> InternetGatewayMissingExpectedRoute
    | `String "FIREWALL_SUBNET_IS_OUT_OF_SCOPE" -> FirewallSubnetIsOutOfScope
    | `String "NETWORK_FIREWALL_POLICY_MODIFIED" -> NetworkFirewallPolicyModified
    | `String "MISSING_EXPECTED_ROUTE_TABLE" -> MissingExpectedRouteTable
    | `String "MISSING_FIREWALL_SUBNET_IN_AZ" -> MissingFirewallSubnetInAZ
    | `String "MISSING_FIREWALL" -> MissingFirewall
    | `String "FMS_CREATED_SECURITY_GROUP_EDITED" -> FMSCreatedSecurityGroupEdited
    | `String "SECURITY_GROUP_REDUNDANT" -> SecurityGroupRedundant
    | `String "SECURITY_GROUP_UNUSED" -> SecurityGroupUnused
    | `String "RESOURCE_VIOLATES_AUDIT_SECURITY_GROUP" -> ResourceViolatesAuditSecurityGroup
    | `String "RESOURCE_MISSING_SECURITY_GROUP" -> ResourceMissingSecurityGroup
    | `String "RESOURCE_MISSING_WEB_ACL_OR_SHIELD_PROTECTION" ->
        ResourceMissingWebaclOrShieldProtection
    | `String "RESOURCE_MISSING_SHIELD_PROTECTION" -> ResourceMissingShieldProtection
    | `String "RESOURCE_INCORRECT_WEB_ACL" -> ResourceIncorrectWebAcl
    | `String "RESOURCE_MISSING_WEB_ACL" -> ResourceMissingWebAcl
    | `String "WEB_ACL_MISSING_RULE_GROUP" -> WebAclMissingRuleGroup
    | `String value -> raise (deserialize_unknown_enum_value_error path "ViolationReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ViolationReason")
     : violation_reason)
    : violation_reason)

let policy_id_of_yojson = string_of_yojson
let aws_account_id_of_yojson = string_of_yojson
let resource_id_of_yojson = string_of_yojson
let resource_type_of_yojson = string_of_yojson
let reference_rule_of_yojson = string_of_yojson
let target_violation_reason_of_yojson = string_of_yojson

let target_violation_reasons_of_yojson tree path =
  list_of_yojson target_violation_reason_of_yojson tree path

let partial_match_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_violation_reasons =
       option_of_yojson
         (value_for_key target_violation_reasons_of_yojson "TargetViolationReasons")
         _list path;
     reference = option_of_yojson (value_for_key reference_rule_of_yojson "Reference") _list path;
   }
    : partial_match)

let partial_matches_of_yojson tree path = list_of_yojson partial_match_of_yojson tree path

let remediation_action_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "MODIFY" -> Modify
    | `String "REMOVE" -> Remove
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RemediationActionType" value)
    | _ -> raise (deserialize_wrong_type_error path "RemediationActionType")
     : remediation_action_type)
    : remediation_action_type)

let remediation_action_description_of_yojson = string_of_yojson
let cid_r_of_yojson = string_of_yojson
let ip_port_number_of_yojson = long_of_yojson

let security_group_rule_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     to_port = option_of_yojson (value_for_key ip_port_number_of_yojson "ToPort") _list path;
     from_port = option_of_yojson (value_for_key ip_port_number_of_yojson "FromPort") _list path;
     protocol =
       option_of_yojson (value_for_key length_bounded_string_of_yojson "Protocol") _list path;
     prefix_list_id =
       option_of_yojson (value_for_key resource_id_of_yojson "PrefixListId") _list path;
     ipv6_range = option_of_yojson (value_for_key cid_r_of_yojson "IPV6Range") _list path;
     ipv4_range = option_of_yojson (value_for_key cid_r_of_yojson "IPV4Range") _list path;
   }
    : security_group_rule_description)

let boolean__of_yojson = bool_of_yojson

let security_group_remediation_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_default_action =
       option_of_yojson (value_for_key boolean__of_yojson "IsDefaultAction") _list path;
     remediation_result =
       option_of_yojson
         (value_for_key security_group_rule_description_of_yojson "RemediationResult")
         _list path;
     description =
       option_of_yojson
         (value_for_key remediation_action_description_of_yojson "Description")
         _list path;
     remediation_action_type =
       option_of_yojson
         (value_for_key remediation_action_type_of_yojson "RemediationActionType")
         _list path;
   }
    : security_group_remediation_action)

let security_group_remediation_actions_of_yojson tree path =
  list_of_yojson security_group_remediation_action_of_yojson tree path

let aws_vpc_security_group_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     possible_security_group_remediation_actions =
       option_of_yojson
         (value_for_key security_group_remediation_actions_of_yojson
            "PossibleSecurityGroupRemediationActions")
         _list path;
     partial_matches =
       option_of_yojson (value_for_key partial_matches_of_yojson "PartialMatches") _list path;
     violation_target_description =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "ViolationTargetDescription")
         _list path;
     violation_target =
       option_of_yojson (value_for_key violation_target_of_yojson "ViolationTarget") _list path;
   }
    : aws_vpc_security_group_violation)

let resource_id_list_of_yojson tree path = list_of_yojson resource_id_of_yojson tree path

let aws_ec2_network_interface_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     violating_security_groups =
       option_of_yojson
         (value_for_key resource_id_list_of_yojson "ViolatingSecurityGroups")
         _list path;
     violation_target =
       option_of_yojson (value_for_key violation_target_of_yojson "ViolationTarget") _list path;
   }
    : aws_ec2_network_interface_violation)

let aws_ec2_network_interface_violations_of_yojson tree path =
  list_of_yojson aws_ec2_network_interface_violation_of_yojson tree path

let aws_ec2_instance_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_ec2_network_interface_violations =
       option_of_yojson
         (value_for_key aws_ec2_network_interface_violations_of_yojson
            "AwsEc2NetworkInterfaceViolations")
         _list path;
     violation_target =
       option_of_yojson (value_for_key violation_target_of_yojson "ViolationTarget") _list path;
   }
    : aws_ec2_instance_violation)

let network_firewall_missing_firewall_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_violation_reason =
       option_of_yojson
         (value_for_key target_violation_reason_of_yojson "TargetViolationReason")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "AvailabilityZone")
         _list path;
     vp_c = option_of_yojson (value_for_key resource_id_of_yojson "VPC") _list path;
     violation_target =
       option_of_yojson (value_for_key violation_target_of_yojson "ViolationTarget") _list path;
   }
    : network_firewall_missing_firewall_violation)

let network_firewall_missing_subnet_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_violation_reason =
       option_of_yojson
         (value_for_key target_violation_reason_of_yojson "TargetViolationReason")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "AvailabilityZone")
         _list path;
     vp_c = option_of_yojson (value_for_key resource_id_of_yojson "VPC") _list path;
     violation_target =
       option_of_yojson (value_for_key violation_target_of_yojson "ViolationTarget") _list path;
   }
    : network_firewall_missing_subnet_violation)

let network_firewall_missing_expected_rt_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expected_route_table =
       option_of_yojson (value_for_key resource_id_of_yojson "ExpectedRouteTable") _list path;
     current_route_table =
       option_of_yojson (value_for_key resource_id_of_yojson "CurrentRouteTable") _list path;
     availability_zone =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "AvailabilityZone")
         _list path;
     vp_c = option_of_yojson (value_for_key resource_id_of_yojson "VPC") _list path;
     violation_target =
       option_of_yojson (value_for_key violation_target_of_yojson "ViolationTarget") _list path;
   }
    : network_firewall_missing_expected_rt_violation)

let network_firewall_resource_name_of_yojson = string_of_yojson
let stateless_rule_group_priority_of_yojson = int_of_yojson

let stateless_rule_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     priority =
       option_of_yojson
         (value_for_key stateless_rule_group_priority_of_yojson "Priority")
         _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "ResourceId") _list path;
     rule_group_name =
       option_of_yojson
         (value_for_key network_firewall_resource_name_of_yojson "RuleGroupName")
         _list path;
   }
    : stateless_rule_group)

let stateless_rule_group_list_of_yojson tree path =
  list_of_yojson stateless_rule_group_of_yojson tree path

let network_firewall_action_of_yojson = string_of_yojson

let network_firewall_action_list_of_yojson tree path =
  list_of_yojson network_firewall_action_of_yojson tree path

let priority_number_of_yojson = int_of_yojson

let network_firewall_override_action_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DROP_TO_ALERT" -> DROP_TO_ALERT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NetworkFirewallOverrideAction" value)
    | _ -> raise (deserialize_wrong_type_error path "NetworkFirewallOverrideAction")
     : network_firewall_override_action)
    : network_firewall_override_action)

let network_firewall_stateful_rule_group_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action =
       option_of_yojson
         (value_for_key network_firewall_override_action_of_yojson "Action")
         _list path;
   }
    : network_firewall_stateful_rule_group_override)

let stateful_rule_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     override =
       option_of_yojson
         (value_for_key network_firewall_stateful_rule_group_override_of_yojson "Override")
         _list path;
     priority = option_of_yojson (value_for_key priority_number_of_yojson "Priority") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "ResourceId") _list path;
     rule_group_name =
       option_of_yojson
         (value_for_key network_firewall_resource_name_of_yojson "RuleGroupName")
         _list path;
   }
    : stateful_rule_group)

let stateful_rule_group_list_of_yojson tree path =
  list_of_yojson stateful_rule_group_of_yojson tree path

let rule_order_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DEFAULT_ACTION_ORDER" -> DEFAULT_ACTION_ORDER
    | `String "STRICT_ORDER" -> STRICT_ORDER
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleOrder")
     : rule_order)
    : rule_order)

let stream_exception_policy_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "FMS_IGNORE" -> FMS_IGNORE
    | `String "REJECT" -> REJECT
    | `String "CONTINUE" -> CONTINUE
    | `String "DROP" -> DROP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StreamExceptionPolicy" value)
    | _ -> raise (deserialize_wrong_type_error path "StreamExceptionPolicy")
     : stream_exception_policy)
    : stream_exception_policy)

let stateful_engine_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stream_exception_policy =
       option_of_yojson
         (value_for_key stream_exception_policy_of_yojson "StreamExceptionPolicy")
         _list path;
     rule_order = option_of_yojson (value_for_key rule_order_of_yojson "RuleOrder") _list path;
   }
    : stateful_engine_options)

let network_firewall_policy_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stateful_engine_options =
       option_of_yojson
         (value_for_key stateful_engine_options_of_yojson "StatefulEngineOptions")
         _list path;
     stateful_default_actions =
       option_of_yojson
         (value_for_key network_firewall_action_list_of_yojson "StatefulDefaultActions")
         _list path;
     stateful_rule_groups =
       option_of_yojson
         (value_for_key stateful_rule_group_list_of_yojson "StatefulRuleGroups")
         _list path;
     stateless_custom_actions =
       option_of_yojson
         (value_for_key network_firewall_action_list_of_yojson "StatelessCustomActions")
         _list path;
     stateless_fragment_default_actions =
       option_of_yojson
         (value_for_key network_firewall_action_list_of_yojson "StatelessFragmentDefaultActions")
         _list path;
     stateless_default_actions =
       option_of_yojson
         (value_for_key network_firewall_action_list_of_yojson "StatelessDefaultActions")
         _list path;
     stateless_rule_groups =
       option_of_yojson
         (value_for_key stateless_rule_group_list_of_yojson "StatelessRuleGroups")
         _list path;
   }
    : network_firewall_policy_description)

let network_firewall_policy_modified_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expected_policy_description =
       option_of_yojson
         (value_for_key network_firewall_policy_description_of_yojson "ExpectedPolicyDescription")
         _list path;
     current_policy_description =
       option_of_yojson
         (value_for_key network_firewall_policy_description_of_yojson "CurrentPolicyDescription")
         _list path;
     violation_target =
       option_of_yojson (value_for_key violation_target_of_yojson "ViolationTarget") _list path;
   }
    : network_firewall_policy_modified_violation)

let destination_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "PREFIX_LIST" -> PrefixList
    | `String "IPV6" -> IPV6
    | `String "IPV4" -> IPV4
    | `String value -> raise (deserialize_unknown_enum_value_error path "DestinationType" value)
    | _ -> raise (deserialize_wrong_type_error path "DestinationType")
     : destination_type)
    : destination_type)

let target_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "TRANSIT_GATEWAY" -> TransitGateway
    | `String "EGRESS_ONLY_INTERNET_GATEWAY" -> EgressOnlyInternetGateway
    | `String "VPC_PEERING_CONNECTION" -> VPCPeeringConnection
    | `String "VPC_ENDPOINT" -> VPCEndpoint
    | `String "NETWORK_INTERFACE" -> NetworkInterface
    | `String "NAT_GATEWAY" -> NatGateway
    | `String "LOCAL_GATEWAY" -> LocalGateway
    | `String "INSTANCE" -> Instance
    | `String "CARRIER_GATEWAY" -> CarrierGateway
    | `String "GATEWAY" -> Gateway
    | `String value -> raise (deserialize_unknown_enum_value_error path "TargetType" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetType")
     : target_type)
    : target_type)

let route_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target = option_of_yojson (value_for_key length_bounded_string_of_yojson "Target") _list path;
     destination =
       option_of_yojson (value_for_key length_bounded_string_of_yojson "Destination") _list path;
     target_type = option_of_yojson (value_for_key target_type_of_yojson "TargetType") _list path;
     destination_type =
       option_of_yojson (value_for_key destination_type_of_yojson "DestinationType") _list path;
   }
    : route)

let routes_of_yojson tree path = list_of_yojson route_of_yojson tree path

let length_bounded_string_list_of_yojson tree path =
  list_of_yojson length_bounded_string_of_yojson tree path

let expected_route_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     route_table_id =
       option_of_yojson (value_for_key resource_id_of_yojson "RouteTableId") _list path;
     allowed_targets =
       option_of_yojson
         (value_for_key length_bounded_string_list_of_yojson "AllowedTargets")
         _list path;
     contributing_subnets =
       option_of_yojson (value_for_key resource_id_list_of_yojson "ContributingSubnets") _list path;
     ip_v6_cidr = option_of_yojson (value_for_key cid_r_of_yojson "IpV6Cidr") _list path;
     prefix_list_id = option_of_yojson (value_for_key cid_r_of_yojson "PrefixListId") _list path;
     ip_v4_cidr = option_of_yojson (value_for_key cid_r_of_yojson "IpV4Cidr") _list path;
   }
    : expected_route)

let expected_routes_of_yojson tree path = list_of_yojson expected_route_of_yojson tree path

let network_firewall_internet_traffic_not_inspected_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_id = option_of_yojson (value_for_key resource_id_of_yojson "VpcId") _list path;
     actual_internet_gateway_routes =
       option_of_yojson (value_for_key routes_of_yojson "ActualInternetGatewayRoutes") _list path;
     expected_internet_gateway_routes =
       option_of_yojson
         (value_for_key expected_routes_of_yojson "ExpectedInternetGatewayRoutes")
         _list path;
     current_internet_gateway_route_table =
       option_of_yojson
         (value_for_key resource_id_of_yojson "CurrentInternetGatewayRouteTable")
         _list path;
     internet_gateway_id =
       option_of_yojson (value_for_key resource_id_of_yojson "InternetGatewayId") _list path;
     actual_firewall_subnet_routes =
       option_of_yojson (value_for_key routes_of_yojson "ActualFirewallSubnetRoutes") _list path;
     expected_firewall_subnet_routes =
       option_of_yojson
         (value_for_key expected_routes_of_yojson "ExpectedFirewallSubnetRoutes")
         _list path;
     firewall_subnet_id =
       option_of_yojson (value_for_key resource_id_of_yojson "FirewallSubnetId") _list path;
     expected_firewall_endpoint =
       option_of_yojson (value_for_key resource_id_of_yojson "ExpectedFirewallEndpoint") _list path;
     current_firewall_subnet_route_table =
       option_of_yojson
         (value_for_key resource_id_of_yojson "CurrentFirewallSubnetRouteTable")
         _list path;
     is_route_table_used_in_different_a_z =
       option_of_yojson
         (value_for_key boolean__of_yojson "IsRouteTableUsedInDifferentAZ")
         _list path;
     violating_routes =
       option_of_yojson (value_for_key routes_of_yojson "ViolatingRoutes") _list path;
     route_table_id =
       option_of_yojson (value_for_key resource_id_of_yojson "RouteTableId") _list path;
     subnet_availability_zone =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "SubnetAvailabilityZone")
         _list path;
     subnet_id = option_of_yojson (value_for_key resource_id_of_yojson "SubnetId") _list path;
   }
    : network_firewall_internet_traffic_not_inspected_violation)

let network_firewall_invalid_route_configuration_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_id = option_of_yojson (value_for_key resource_id_of_yojson "VpcId") _list path;
     actual_internet_gateway_routes =
       option_of_yojson (value_for_key routes_of_yojson "ActualInternetGatewayRoutes") _list path;
     expected_internet_gateway_routes =
       option_of_yojson
         (value_for_key expected_routes_of_yojson "ExpectedInternetGatewayRoutes")
         _list path;
     current_internet_gateway_route_table =
       option_of_yojson
         (value_for_key resource_id_of_yojson "CurrentInternetGatewayRouteTable")
         _list path;
     internet_gateway_id =
       option_of_yojson (value_for_key resource_id_of_yojson "InternetGatewayId") _list path;
     actual_firewall_subnet_routes =
       option_of_yojson (value_for_key routes_of_yojson "ActualFirewallSubnetRoutes") _list path;
     expected_firewall_subnet_routes =
       option_of_yojson
         (value_for_key expected_routes_of_yojson "ExpectedFirewallSubnetRoutes")
         _list path;
     actual_firewall_subnet_id =
       option_of_yojson (value_for_key resource_id_of_yojson "ActualFirewallSubnetId") _list path;
     expected_firewall_subnet_id =
       option_of_yojson (value_for_key resource_id_of_yojson "ExpectedFirewallSubnetId") _list path;
     actual_firewall_endpoint =
       option_of_yojson (value_for_key resource_id_of_yojson "ActualFirewallEndpoint") _list path;
     expected_firewall_endpoint =
       option_of_yojson (value_for_key resource_id_of_yojson "ExpectedFirewallEndpoint") _list path;
     current_firewall_subnet_route_table =
       option_of_yojson
         (value_for_key resource_id_of_yojson "CurrentFirewallSubnetRouteTable")
         _list path;
     violating_route = option_of_yojson (value_for_key route_of_yojson "ViolatingRoute") _list path;
     is_route_table_used_in_different_a_z =
       option_of_yojson
         (value_for_key boolean__of_yojson "IsRouteTableUsedInDifferentAZ")
         _list path;
     route_table_id =
       option_of_yojson (value_for_key resource_id_of_yojson "RouteTableId") _list path;
     affected_subnets =
       option_of_yojson (value_for_key resource_id_list_of_yojson "AffectedSubnets") _list path;
   }
    : network_firewall_invalid_route_configuration_violation)

let network_firewall_black_hole_route_detected_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     violating_routes =
       option_of_yojson (value_for_key routes_of_yojson "ViolatingRoutes") _list path;
     vpc_id = option_of_yojson (value_for_key resource_id_of_yojson "VpcId") _list path;
     route_table_id =
       option_of_yojson (value_for_key resource_id_of_yojson "RouteTableId") _list path;
     violation_target =
       option_of_yojson (value_for_key violation_target_of_yojson "ViolationTarget") _list path;
   }
    : network_firewall_black_hole_route_detected_violation)

let network_firewall_unexpected_firewall_routes_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_id = option_of_yojson (value_for_key resource_id_of_yojson "VpcId") _list path;
     firewall_endpoint =
       option_of_yojson (value_for_key resource_id_of_yojson "FirewallEndpoint") _list path;
     route_table_id =
       option_of_yojson (value_for_key resource_id_of_yojson "RouteTableId") _list path;
     violating_routes =
       option_of_yojson (value_for_key routes_of_yojson "ViolatingRoutes") _list path;
     firewall_subnet_id =
       option_of_yojson (value_for_key resource_id_of_yojson "FirewallSubnetId") _list path;
   }
    : network_firewall_unexpected_firewall_routes_violation)

let network_firewall_unexpected_gateway_routes_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_id = option_of_yojson (value_for_key resource_id_of_yojson "VpcId") _list path;
     route_table_id =
       option_of_yojson (value_for_key resource_id_of_yojson "RouteTableId") _list path;
     violating_routes =
       option_of_yojson (value_for_key routes_of_yojson "ViolatingRoutes") _list path;
     gateway_id = option_of_yojson (value_for_key resource_id_of_yojson "GatewayId") _list path;
   }
    : network_firewall_unexpected_gateway_routes_violation)

let network_firewall_missing_expected_routes_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_id = option_of_yojson (value_for_key resource_id_of_yojson "VpcId") _list path;
     expected_routes =
       option_of_yojson (value_for_key expected_routes_of_yojson "ExpectedRoutes") _list path;
     violation_target =
       option_of_yojson (value_for_key violation_target_of_yojson "ViolationTarget") _list path;
   }
    : network_firewall_missing_expected_routes_violation)

let dns_rule_group_priority_of_yojson = int_of_yojson

let dns_rule_group_priorities_of_yojson tree path =
  list_of_yojson dns_rule_group_priority_of_yojson tree path

let dns_rule_group_priority_conflict_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unavailable_priorities =
       option_of_yojson
         (value_for_key dns_rule_group_priorities_of_yojson "UnavailablePriorities")
         _list path;
     conflicting_policy_id =
       option_of_yojson (value_for_key policy_id_of_yojson "ConflictingPolicyId") _list path;
     conflicting_priority =
       option_of_yojson
         (value_for_key dns_rule_group_priority_of_yojson "ConflictingPriority")
         _list path;
     violation_target_description =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "ViolationTargetDescription")
         _list path;
     violation_target =
       option_of_yojson (value_for_key violation_target_of_yojson "ViolationTarget") _list path;
   }
    : dns_rule_group_priority_conflict_violation)

let dns_duplicate_rule_group_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     violation_target_description =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "ViolationTargetDescription")
         _list path;
     violation_target =
       option_of_yojson (value_for_key violation_target_of_yojson "ViolationTarget") _list path;
   }
    : dns_duplicate_rule_group_violation)

let basic_integer_of_yojson = int_of_yojson

let dns_rule_group_limit_exceeded_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     number_of_rule_groups_already_associated =
       option_of_yojson
         (value_for_key basic_integer_of_yojson "NumberOfRuleGroupsAlreadyAssociated")
         _list path;
     violation_target_description =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "ViolationTargetDescription")
         _list path;
     violation_target =
       option_of_yojson (value_for_key violation_target_of_yojson "ViolationTarget") _list path;
   }
    : dns_rule_group_limit_exceeded_violation)

let firewall_subnet_is_out_of_scope_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoint_id =
       option_of_yojson (value_for_key resource_id_of_yojson "VpcEndpointId") _list path;
     subnet_availability_zone_id =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "SubnetAvailabilityZoneId")
         _list path;
     subnet_availability_zone =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "SubnetAvailabilityZone")
         _list path;
     vpc_id = option_of_yojson (value_for_key resource_id_of_yojson "VpcId") _list path;
     firewall_subnet_id =
       option_of_yojson (value_for_key resource_id_of_yojson "FirewallSubnetId") _list path;
   }
    : firewall_subnet_is_out_of_scope_violation)

let route_has_out_of_scope_endpoint_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     internet_gateway_routes =
       option_of_yojson (value_for_key routes_of_yojson "InternetGatewayRoutes") _list path;
     current_internet_gateway_route_table =
       option_of_yojson
         (value_for_key resource_id_of_yojson "CurrentInternetGatewayRouteTable")
         _list path;
     internet_gateway_id =
       option_of_yojson (value_for_key resource_id_of_yojson "InternetGatewayId") _list path;
     firewall_subnet_routes =
       option_of_yojson (value_for_key routes_of_yojson "FirewallSubnetRoutes") _list path;
     firewall_subnet_id =
       option_of_yojson (value_for_key resource_id_of_yojson "FirewallSubnetId") _list path;
     current_firewall_subnet_route_table =
       option_of_yojson
         (value_for_key resource_id_of_yojson "CurrentFirewallSubnetRouteTable")
         _list path;
     subnet_availability_zone_id =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "SubnetAvailabilityZoneId")
         _list path;
     subnet_availability_zone =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "SubnetAvailabilityZone")
         _list path;
     violating_routes =
       option_of_yojson (value_for_key routes_of_yojson "ViolatingRoutes") _list path;
     route_table_id =
       option_of_yojson (value_for_key resource_id_of_yojson "RouteTableId") _list path;
     vpc_id = option_of_yojson (value_for_key resource_id_of_yojson "VpcId") _list path;
     subnet_id = option_of_yojson (value_for_key resource_id_of_yojson "SubnetId") _list path;
   }
    : route_has_out_of_scope_endpoint_violation)

let third_party_firewall_missing_firewall_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_violation_reason =
       option_of_yojson
         (value_for_key target_violation_reason_of_yojson "TargetViolationReason")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "AvailabilityZone")
         _list path;
     vp_c = option_of_yojson (value_for_key resource_id_of_yojson "VPC") _list path;
     violation_target =
       option_of_yojson (value_for_key violation_target_of_yojson "ViolationTarget") _list path;
   }
    : third_party_firewall_missing_firewall_violation)

let third_party_firewall_missing_subnet_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_violation_reason =
       option_of_yojson
         (value_for_key target_violation_reason_of_yojson "TargetViolationReason")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "AvailabilityZone")
         _list path;
     vp_c = option_of_yojson (value_for_key resource_id_of_yojson "VPC") _list path;
     violation_target =
       option_of_yojson (value_for_key violation_target_of_yojson "ViolationTarget") _list path;
   }
    : third_party_firewall_missing_subnet_violation)

let third_party_firewall_missing_expected_route_table_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expected_route_table =
       option_of_yojson (value_for_key resource_id_of_yojson "ExpectedRouteTable") _list path;
     current_route_table =
       option_of_yojson (value_for_key resource_id_of_yojson "CurrentRouteTable") _list path;
     availability_zone =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "AvailabilityZone")
         _list path;
     vp_c = option_of_yojson (value_for_key resource_id_of_yojson "VPC") _list path;
     violation_target =
       option_of_yojson (value_for_key violation_target_of_yojson "ViolationTarget") _list path;
   }
    : third_party_firewall_missing_expected_route_table_violation)

let firewall_subnet_missing_vpc_endpoint_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_availability_zone_id =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "SubnetAvailabilityZoneId")
         _list path;
     subnet_availability_zone =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "SubnetAvailabilityZone")
         _list path;
     vpc_id = option_of_yojson (value_for_key resource_id_of_yojson "VpcId") _list path;
     firewall_subnet_id =
       option_of_yojson (value_for_key resource_id_of_yojson "FirewallSubnetId") _list path;
   }
    : firewall_subnet_missing_vpc_endpoint_violation)

let integer_object_of_yojson = int_of_yojson

let network_acl_icmp_type_code_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key integer_object_of_yojson "Type") _list path;
     code = option_of_yojson (value_for_key integer_object_of_yojson "Code") _list path;
   }
    : network_acl_icmp_type_code)

let ip_port_number_integer_of_yojson = int_of_yojson

let network_acl_port_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     to_ = option_of_yojson (value_for_key ip_port_number_integer_of_yojson "To") _list path;
     from_ = option_of_yojson (value_for_key ip_port_number_integer_of_yojson "From") _list path;
   }
    : network_acl_port_range)

let length_bounded_non_empty_string_of_yojson = string_of_yojson

let network_acl_rule_action_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "deny" -> DENY
    | `String "allow" -> ALLOW
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NetworkAclRuleAction" value)
    | _ -> raise (deserialize_wrong_type_error path "NetworkAclRuleAction")
     : network_acl_rule_action)
    : network_acl_rule_action)

let boolean_object_of_yojson = bool_of_yojson

let network_acl_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     egress = value_for_key boolean_object_of_yojson "Egress" _list path;
     rule_action = value_for_key network_acl_rule_action_of_yojson "RuleAction" _list path;
     ipv6_cidr_block =
       option_of_yojson
         (value_for_key length_bounded_non_empty_string_of_yojson "Ipv6CidrBlock")
         _list path;
     cidr_block =
       option_of_yojson
         (value_for_key length_bounded_non_empty_string_of_yojson "CidrBlock")
         _list path;
     port_range =
       option_of_yojson (value_for_key network_acl_port_range_of_yojson "PortRange") _list path;
     protocol = value_for_key length_bounded_string_of_yojson "Protocol" _list path;
     icmp_type_code =
       option_of_yojson
         (value_for_key network_acl_icmp_type_code_of_yojson "IcmpTypeCode")
         _list path;
   }
    : network_acl_entry)

let integer_object_minimum0_of_yojson = int_of_yojson

let entry_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CUSTOM_ENTRY" -> CustomEntry
    | `String "FMS_MANAGED_LAST_ENTRY" -> FMSManagedLastEntry
    | `String "FMS_MANAGED_FIRST_ENTRY" -> FMSManagedFirstEntry
    | `String value -> raise (deserialize_unknown_enum_value_error path "EntryType" value)
    | _ -> raise (deserialize_wrong_type_error path "EntryType")
     : entry_type)
    : entry_type)

let entry_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entry_type = option_of_yojson (value_for_key entry_type_of_yojson "EntryType") _list path;
     entry_rule_number =
       option_of_yojson
         (value_for_key integer_object_minimum0_of_yojson "EntryRuleNumber")
         _list path;
     entry_detail =
       option_of_yojson (value_for_key network_acl_entry_of_yojson "EntryDetail") _list path;
   }
    : entry_description)

let entries_with_conflicts_of_yojson tree path =
  list_of_yojson entry_description_of_yojson tree path

let entry_violation_reason_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "ENTRY_CONFLICT" -> EntryConflict
    | `String "INCORRECT_ENTRY_ORDER" -> IncorrectEntryOrder
    | `String "MISSING_EXPECTED_ENTRY" -> MissingExpectedEntry
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EntryViolationReason" value)
    | _ -> raise (deserialize_wrong_type_error path "EntryViolationReason")
     : entry_violation_reason)
    : entry_violation_reason)

let entry_violation_reasons_of_yojson tree path =
  list_of_yojson entry_violation_reason_of_yojson tree path

let entry_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entry_violation_reasons =
       option_of_yojson
         (value_for_key entry_violation_reasons_of_yojson "EntryViolationReasons")
         _list path;
     entries_with_conflicts =
       option_of_yojson
         (value_for_key entries_with_conflicts_of_yojson "EntriesWithConflicts")
         _list path;
     entry_at_expected_evaluation_order =
       option_of_yojson
         (value_for_key entry_description_of_yojson "EntryAtExpectedEvaluationOrder")
         _list path;
     actual_evaluation_order =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "ActualEvaluationOrder")
         _list path;
     expected_evaluation_order =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "ExpectedEvaluationOrder")
         _list path;
     expected_entry =
       option_of_yojson (value_for_key entry_description_of_yojson "ExpectedEntry") _list path;
   }
    : entry_violation)

let entry_violations_of_yojson tree path = list_of_yojson entry_violation_of_yojson tree path

let invalid_network_acl_entries_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entry_violations =
       option_of_yojson (value_for_key entry_violations_of_yojson "EntryViolations") _list path;
     current_associated_network_acl =
       option_of_yojson
         (value_for_key resource_id_of_yojson "CurrentAssociatedNetworkAcl")
         _list path;
     subnet_availability_zone =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "SubnetAvailabilityZone")
         _list path;
     subnet = option_of_yojson (value_for_key resource_id_of_yojson "Subnet") _list path;
     vpc = option_of_yojson (value_for_key resource_id_of_yojson "Vpc") _list path;
   }
    : invalid_network_acl_entries_violation)

let action_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key length_bounded_string_of_yojson "Description") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "ResourceId") _list path;
   }
    : action_target)

let ec2_create_route_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     route_table_id = value_for_key action_target_of_yojson "RouteTableId" _list path;
     gateway_id = option_of_yojson (value_for_key action_target_of_yojson "GatewayId") _list path;
     vpc_endpoint_id =
       option_of_yojson (value_for_key action_target_of_yojson "VpcEndpointId") _list path;
     destination_ipv6_cidr_block =
       option_of_yojson (value_for_key cid_r_of_yojson "DestinationIpv6CidrBlock") _list path;
     destination_prefix_list_id =
       option_of_yojson (value_for_key resource_id_of_yojson "DestinationPrefixListId") _list path;
     destination_cidr_block =
       option_of_yojson (value_for_key cid_r_of_yojson "DestinationCidrBlock") _list path;
     description =
       option_of_yojson (value_for_key length_bounded_string_of_yojson "Description") _list path;
   }
    : ec2_create_route_action)

let ec2_replace_route_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     route_table_id = value_for_key action_target_of_yojson "RouteTableId" _list path;
     gateway_id = option_of_yojson (value_for_key action_target_of_yojson "GatewayId") _list path;
     destination_ipv6_cidr_block =
       option_of_yojson (value_for_key cid_r_of_yojson "DestinationIpv6CidrBlock") _list path;
     destination_prefix_list_id =
       option_of_yojson (value_for_key resource_id_of_yojson "DestinationPrefixListId") _list path;
     destination_cidr_block =
       option_of_yojson (value_for_key cid_r_of_yojson "DestinationCidrBlock") _list path;
     description =
       option_of_yojson (value_for_key length_bounded_string_of_yojson "Description") _list path;
   }
    : ec2_replace_route_action)

let ec2_delete_route_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     route_table_id = value_for_key action_target_of_yojson "RouteTableId" _list path;
     destination_ipv6_cidr_block =
       option_of_yojson (value_for_key cid_r_of_yojson "DestinationIpv6CidrBlock") _list path;
     destination_prefix_list_id =
       option_of_yojson (value_for_key resource_id_of_yojson "DestinationPrefixListId") _list path;
     destination_cidr_block =
       option_of_yojson (value_for_key cid_r_of_yojson "DestinationCidrBlock") _list path;
     description =
       option_of_yojson (value_for_key length_bounded_string_of_yojson "Description") _list path;
   }
    : ec2_delete_route_action)

let ec2_copy_route_table_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     route_table_id = value_for_key action_target_of_yojson "RouteTableId" _list path;
     vpc_id = value_for_key action_target_of_yojson "VpcId" _list path;
     description =
       option_of_yojson (value_for_key length_bounded_string_of_yojson "Description") _list path;
   }
    : ec2_copy_route_table_action)

let ec2_replace_route_table_association_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     route_table_id = value_for_key action_target_of_yojson "RouteTableId" _list path;
     association_id = value_for_key action_target_of_yojson "AssociationId" _list path;
     description =
       option_of_yojson (value_for_key length_bounded_string_of_yojson "Description") _list path;
   }
    : ec2_replace_route_table_association_action)

let ec2_associate_route_table_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_id = option_of_yojson (value_for_key action_target_of_yojson "GatewayId") _list path;
     subnet_id = option_of_yojson (value_for_key action_target_of_yojson "SubnetId") _list path;
     route_table_id = value_for_key action_target_of_yojson "RouteTableId" _list path;
     description =
       option_of_yojson (value_for_key length_bounded_string_of_yojson "Description") _list path;
   }
    : ec2_associate_route_table_action)

let ec2_create_route_table_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_id = value_for_key action_target_of_yojson "VpcId" _list path;
     description =
       option_of_yojson (value_for_key length_bounded_string_of_yojson "Description") _list path;
   }
    : ec2_create_route_table_action)

let managed_service_data_of_yojson = string_of_yojson

let fms_policy_update_firewall_creation_config_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_creation_config =
       option_of_yojson
         (value_for_key managed_service_data_of_yojson "FirewallCreationConfig")
         _list path;
     description =
       option_of_yojson (value_for_key length_bounded_string_of_yojson "Description") _list path;
   }
    : fms_policy_update_firewall_creation_config_action)

let create_network_acl_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fms_can_remediate =
       option_of_yojson (value_for_key boolean__of_yojson "FMSCanRemediate") _list path;
     vpc = option_of_yojson (value_for_key action_target_of_yojson "Vpc") _list path;
     description =
       option_of_yojson (value_for_key length_bounded_string_of_yojson "Description") _list path;
   }
    : create_network_acl_action)

let replace_network_acl_association_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fms_can_remediate =
       option_of_yojson (value_for_key boolean__of_yojson "FMSCanRemediate") _list path;
     network_acl_id =
       option_of_yojson (value_for_key action_target_of_yojson "NetworkAclId") _list path;
     association_id =
       option_of_yojson (value_for_key action_target_of_yojson "AssociationId") _list path;
     description =
       option_of_yojson (value_for_key length_bounded_string_of_yojson "Description") _list path;
   }
    : replace_network_acl_association_action)

let entries_description_of_yojson tree path = list_of_yojson entry_description_of_yojson tree path

let create_network_acl_entries_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fms_can_remediate =
       option_of_yojson (value_for_key boolean__of_yojson "FMSCanRemediate") _list path;
     network_acl_entries_to_be_created =
       option_of_yojson
         (value_for_key entries_description_of_yojson "NetworkAclEntriesToBeCreated")
         _list path;
     network_acl_id =
       option_of_yojson (value_for_key action_target_of_yojson "NetworkAclId") _list path;
     description =
       option_of_yojson (value_for_key length_bounded_string_of_yojson "Description") _list path;
   }
    : create_network_acl_entries_action)

let delete_network_acl_entries_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fms_can_remediate =
       option_of_yojson (value_for_key boolean__of_yojson "FMSCanRemediate") _list path;
     network_acl_entries_to_be_deleted =
       option_of_yojson
         (value_for_key entries_description_of_yojson "NetworkAclEntriesToBeDeleted")
         _list path;
     network_acl_id =
       option_of_yojson (value_for_key action_target_of_yojson "NetworkAclId") _list path;
     description =
       option_of_yojson (value_for_key length_bounded_string_of_yojson "Description") _list path;
   }
    : delete_network_acl_entries_action)

let remediation_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete_network_acl_entries_action =
       option_of_yojson
         (value_for_key delete_network_acl_entries_action_of_yojson "DeleteNetworkAclEntriesAction")
         _list path;
     create_network_acl_entries_action =
       option_of_yojson
         (value_for_key create_network_acl_entries_action_of_yojson "CreateNetworkAclEntriesAction")
         _list path;
     replace_network_acl_association_action =
       option_of_yojson
         (value_for_key replace_network_acl_association_action_of_yojson
            "ReplaceNetworkAclAssociationAction")
         _list path;
     create_network_acl_action =
       option_of_yojson
         (value_for_key create_network_acl_action_of_yojson "CreateNetworkAclAction")
         _list path;
     fms_policy_update_firewall_creation_config_action =
       option_of_yojson
         (value_for_key fms_policy_update_firewall_creation_config_action_of_yojson
            "FMSPolicyUpdateFirewallCreationConfigAction")
         _list path;
     ec2_create_route_table_action =
       option_of_yojson
         (value_for_key ec2_create_route_table_action_of_yojson "EC2CreateRouteTableAction")
         _list path;
     ec2_associate_route_table_action =
       option_of_yojson
         (value_for_key ec2_associate_route_table_action_of_yojson "EC2AssociateRouteTableAction")
         _list path;
     ec2_replace_route_table_association_action =
       option_of_yojson
         (value_for_key ec2_replace_route_table_association_action_of_yojson
            "EC2ReplaceRouteTableAssociationAction")
         _list path;
     ec2_copy_route_table_action =
       option_of_yojson
         (value_for_key ec2_copy_route_table_action_of_yojson "EC2CopyRouteTableAction")
         _list path;
     ec2_delete_route_action =
       option_of_yojson
         (value_for_key ec2_delete_route_action_of_yojson "EC2DeleteRouteAction")
         _list path;
     ec2_replace_route_action =
       option_of_yojson
         (value_for_key ec2_replace_route_action_of_yojson "EC2ReplaceRouteAction")
         _list path;
     ec2_create_route_action =
       option_of_yojson
         (value_for_key ec2_create_route_action_of_yojson "EC2CreateRouteAction")
         _list path;
     description =
       option_of_yojson (value_for_key length_bounded_string_of_yojson "Description") _list path;
   }
    : remediation_action)

let remediation_action_with_order_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     order = option_of_yojson (value_for_key basic_integer_of_yojson "Order") _list path;
     remediation_action =
       option_of_yojson (value_for_key remediation_action_of_yojson "RemediationAction") _list path;
   }
    : remediation_action_with_order)

let ordered_remediation_actions_of_yojson tree path =
  list_of_yojson remediation_action_with_order_of_yojson tree path

let possible_remediation_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_default_action =
       option_of_yojson (value_for_key boolean__of_yojson "IsDefaultAction") _list path;
     ordered_remediation_actions =
       value_for_key ordered_remediation_actions_of_yojson "OrderedRemediationActions" _list path;
     description =
       option_of_yojson (value_for_key length_bounded_string_of_yojson "Description") _list path;
   }
    : possible_remediation_action)

let possible_remediation_action_list_of_yojson tree path =
  list_of_yojson possible_remediation_action_of_yojson tree path

let possible_remediation_actions_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     actions =
       option_of_yojson
         (value_for_key possible_remediation_action_list_of_yojson "Actions")
         _list path;
     description =
       option_of_yojson (value_for_key length_bounded_string_of_yojson "Description") _list path;
   }
    : possible_remediation_actions)

let resource_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_acl_has_out_of_scope_resources_violation =
       option_of_yojson
         (value_for_key web_acl_has_out_of_scope_resources_violation_of_yojson
            "WebACLHasOutOfScopeResourcesViolation")
         _list path;
     web_acl_has_incompatible_configuration_violation =
       option_of_yojson
         (value_for_key web_acl_has_incompatible_configuration_violation_of_yojson
            "WebACLHasIncompatibleConfigurationViolation")
         _list path;
     possible_remediation_actions =
       option_of_yojson
         (value_for_key possible_remediation_actions_of_yojson "PossibleRemediationActions")
         _list path;
     invalid_network_acl_entries_violation =
       option_of_yojson
         (value_for_key invalid_network_acl_entries_violation_of_yojson
            "InvalidNetworkAclEntriesViolation")
         _list path;
     firewall_subnet_missing_vpc_endpoint_violation =
       option_of_yojson
         (value_for_key firewall_subnet_missing_vpc_endpoint_violation_of_yojson
            "FirewallSubnetMissingVPCEndpointViolation")
         _list path;
     third_party_firewall_missing_expected_route_table_violation =
       option_of_yojson
         (value_for_key third_party_firewall_missing_expected_route_table_violation_of_yojson
            "ThirdPartyFirewallMissingExpectedRouteTableViolation")
         _list path;
     third_party_firewall_missing_subnet_violation =
       option_of_yojson
         (value_for_key third_party_firewall_missing_subnet_violation_of_yojson
            "ThirdPartyFirewallMissingSubnetViolation")
         _list path;
     third_party_firewall_missing_firewall_violation =
       option_of_yojson
         (value_for_key third_party_firewall_missing_firewall_violation_of_yojson
            "ThirdPartyFirewallMissingFirewallViolation")
         _list path;
     route_has_out_of_scope_endpoint_violation =
       option_of_yojson
         (value_for_key route_has_out_of_scope_endpoint_violation_of_yojson
            "RouteHasOutOfScopeEndpointViolation")
         _list path;
     firewall_subnet_is_out_of_scope_violation =
       option_of_yojson
         (value_for_key firewall_subnet_is_out_of_scope_violation_of_yojson
            "FirewallSubnetIsOutOfScopeViolation")
         _list path;
     dns_rule_group_limit_exceeded_violation =
       option_of_yojson
         (value_for_key dns_rule_group_limit_exceeded_violation_of_yojson
            "DnsRuleGroupLimitExceededViolation")
         _list path;
     dns_duplicate_rule_group_violation =
       option_of_yojson
         (value_for_key dns_duplicate_rule_group_violation_of_yojson
            "DnsDuplicateRuleGroupViolation")
         _list path;
     dns_rule_group_priority_conflict_violation =
       option_of_yojson
         (value_for_key dns_rule_group_priority_conflict_violation_of_yojson
            "DnsRuleGroupPriorityConflictViolation")
         _list path;
     network_firewall_missing_expected_routes_violation =
       option_of_yojson
         (value_for_key network_firewall_missing_expected_routes_violation_of_yojson
            "NetworkFirewallMissingExpectedRoutesViolation")
         _list path;
     network_firewall_unexpected_gateway_routes_violation =
       option_of_yojson
         (value_for_key network_firewall_unexpected_gateway_routes_violation_of_yojson
            "NetworkFirewallUnexpectedGatewayRoutesViolation")
         _list path;
     network_firewall_unexpected_firewall_routes_violation =
       option_of_yojson
         (value_for_key network_firewall_unexpected_firewall_routes_violation_of_yojson
            "NetworkFirewallUnexpectedFirewallRoutesViolation")
         _list path;
     network_firewall_black_hole_route_detected_violation =
       option_of_yojson
         (value_for_key network_firewall_black_hole_route_detected_violation_of_yojson
            "NetworkFirewallBlackHoleRouteDetectedViolation")
         _list path;
     network_firewall_invalid_route_configuration_violation =
       option_of_yojson
         (value_for_key network_firewall_invalid_route_configuration_violation_of_yojson
            "NetworkFirewallInvalidRouteConfigurationViolation")
         _list path;
     network_firewall_internet_traffic_not_inspected_violation =
       option_of_yojson
         (value_for_key network_firewall_internet_traffic_not_inspected_violation_of_yojson
            "NetworkFirewallInternetTrafficNotInspectedViolation")
         _list path;
     network_firewall_policy_modified_violation =
       option_of_yojson
         (value_for_key network_firewall_policy_modified_violation_of_yojson
            "NetworkFirewallPolicyModifiedViolation")
         _list path;
     network_firewall_missing_expected_rt_violation =
       option_of_yojson
         (value_for_key network_firewall_missing_expected_rt_violation_of_yojson
            "NetworkFirewallMissingExpectedRTViolation")
         _list path;
     network_firewall_missing_subnet_violation =
       option_of_yojson
         (value_for_key network_firewall_missing_subnet_violation_of_yojson
            "NetworkFirewallMissingSubnetViolation")
         _list path;
     network_firewall_missing_firewall_violation =
       option_of_yojson
         (value_for_key network_firewall_missing_firewall_violation_of_yojson
            "NetworkFirewallMissingFirewallViolation")
         _list path;
     aws_ec2_instance_violation =
       option_of_yojson
         (value_for_key aws_ec2_instance_violation_of_yojson "AwsEc2InstanceViolation")
         _list path;
     aws_ec2_network_interface_violation =
       option_of_yojson
         (value_for_key aws_ec2_network_interface_violation_of_yojson
            "AwsEc2NetworkInterfaceViolation")
         _list path;
     aws_vpc_security_group_violation =
       option_of_yojson
         (value_for_key aws_vpc_security_group_violation_of_yojson "AwsVPCSecurityGroupViolation")
         _list path;
   }
    : resource_violation)

let resource_violations_of_yojson tree path = list_of_yojson resource_violation_of_yojson tree path
let tag_key_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "Value" _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let violation_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_description =
       option_of_yojson
         (value_for_key length_bounded_string_of_yojson "ResourceDescription")
         _list path;
     resource_tags = option_of_yojson (value_for_key tag_list_of_yojson "ResourceTags") _list path;
     resource_violations =
       value_for_key resource_violations_of_yojson "ResourceViolations" _list path;
     resource_type = value_for_key resource_type_of_yojson "ResourceType" _list path;
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
     member_account = value_for_key aws_account_id_of_yojson "MemberAccount" _list path;
     policy_id = value_for_key policy_id_of_yojson "PolicyId" _list path;
   }
    : violation_detail)

let update_token_of_yojson = string_of_yojson

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : untag_resource_request)

let error_message_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_not_found_exception)

let invalid_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_operation_exception)

let invalid_input_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_input_exception)

let internal_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : internal_error_exception)

let time_stamp_of_yojson = timestamp_epoch_seconds_of_yojson

let firewall_deployment_model_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DISTRIBUTED" -> DISTRIBUTED
    | `String "CENTRALIZED" -> CENTRALIZED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FirewallDeploymentModel" value)
    | _ -> raise (deserialize_wrong_type_error path "FirewallDeploymentModel")
     : firewall_deployment_model)
    : firewall_deployment_model)

let third_party_firewall_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_deployment_model =
       option_of_yojson
         (value_for_key firewall_deployment_model_of_yojson "FirewallDeploymentModel")
         _list path;
   }
    : third_party_firewall_policy)

let firewall_policy_id_of_yojson = string_of_yojson
let firewall_policy_name_of_yojson = string_of_yojson

let third_party_firewall_firewall_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_policy_name =
       option_of_yojson
         (value_for_key firewall_policy_name_of_yojson "FirewallPolicyName")
         _list path;
     firewall_policy_id =
       option_of_yojson (value_for_key firewall_policy_id_of_yojson "FirewallPolicyId") _list path;
   }
    : third_party_firewall_firewall_policy)

let third_party_firewall_firewall_policies_of_yojson tree path =
  list_of_yojson third_party_firewall_firewall_policy_of_yojson tree path

let third_party_firewall_association_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "NOT_EXIST" -> NOT_EXIST
    | `String "OFFBOARD_COMPLETE" -> OFFBOARD_COMPLETE
    | `String "OFFBOARDING" -> OFFBOARDING
    | `String "ONBOARD_COMPLETE" -> ONBOARD_COMPLETE
    | `String "ONBOARDING" -> ONBOARDING
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ThirdPartyFirewallAssociationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ThirdPartyFirewallAssociationStatus")
     : third_party_firewall_association_status)
    : third_party_firewall_association_status)

let third_party_firewall_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "FORTIGATE_CLOUD_NATIVE_FIREWALL" -> FORTIGATE_CLOUD_NATIVE_FIREWALL
    | `String "PALO_ALTO_NETWORKS_CLOUD_NGFW" -> PALO_ALTO_NETWORKS_CLOUD_NGFW
    | `String value -> raise (deserialize_unknown_enum_value_error path "ThirdPartyFirewall" value)
    | _ -> raise (deserialize_wrong_type_error path "ThirdPartyFirewall")
     : third_party_firewall)
    : third_party_firewall)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_list = value_for_key tag_list_of_yojson "TagList" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : tag_resource_request)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : limit_exceeded_exception)

let security_service_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "NETWORK_ACL_COMMON" -> NETWORK_ACL_COMMON
    | `String "IMPORT_NETWORK_FIREWALL" -> IMPORT_NETWORK_FIREWALL
    | `String "THIRD_PARTY_FIREWALL" -> THIRD_PARTY_FIREWALL
    | `String "DNS_FIREWALL" -> DNS_FIREWALL
    | `String "NETWORK_FIREWALL" -> NETWORK_FIREWALL
    | `String "SECURITY_GROUPS_USAGE_AUDIT" -> SECURITY_GROUPS_USAGE_AUDIT
    | `String "SECURITY_GROUPS_CONTENT_AUDIT" -> SECURITY_GROUPS_CONTENT_AUDIT
    | `String "SECURITY_GROUPS_COMMON" -> SECURITY_GROUPS_COMMON
    | `String "SHIELD_ADVANCED" -> SHIELD_ADVANCED
    | `String "WAFV2" -> WAFV2
    | `String "WAF" -> WAF
    | `String value -> raise (deserialize_unknown_enum_value_error path "SecurityServiceType" value)
    | _ -> raise (deserialize_wrong_type_error path "SecurityServiceType")
     : security_service_type)
    : security_service_type)

let security_service_type_list_of_yojson tree path =
  list_of_yojson security_service_type_of_yojson tree path

let network_firewall_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_deployment_model =
       option_of_yojson
         (value_for_key firewall_deployment_model_of_yojson "FirewallDeploymentModel")
         _list path;
   }
    : network_firewall_policy)

let network_acl_entries_of_yojson tree path = list_of_yojson network_acl_entry_of_yojson tree path

let network_acl_entry_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     force_remediate_for_last_entries =
       value_for_key boolean_object_of_yojson "ForceRemediateForLastEntries" _list path;
     last_entries =
       option_of_yojson (value_for_key network_acl_entries_of_yojson "LastEntries") _list path;
     force_remediate_for_first_entries =
       value_for_key boolean_object_of_yojson "ForceRemediateForFirstEntries" _list path;
     first_entries =
       option_of_yojson (value_for_key network_acl_entries_of_yojson "FirstEntries") _list path;
   }
    : network_acl_entry_set)

let network_acl_common_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     network_acl_entry_set =
       value_for_key network_acl_entry_set_of_yojson "NetworkAclEntrySet" _list path;
   }
    : network_acl_common_policy)

let policy_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     network_acl_common_policy =
       option_of_yojson
         (value_for_key network_acl_common_policy_of_yojson "NetworkAclCommonPolicy")
         _list path;
     third_party_firewall_policy =
       option_of_yojson
         (value_for_key third_party_firewall_policy_of_yojson "ThirdPartyFirewallPolicy")
         _list path;
     network_firewall_policy =
       option_of_yojson
         (value_for_key network_firewall_policy_of_yojson "NetworkFirewallPolicy")
         _list path;
   }
    : policy_option)

let security_service_policy_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_option =
       option_of_yojson (value_for_key policy_option_of_yojson "PolicyOption") _list path;
     managed_service_data =
       option_of_yojson
         (value_for_key managed_service_data_of_yojson "ManagedServiceData")
         _list path;
     type_ = value_for_key security_service_type_of_yojson "Type" _list path;
   }
    : security_service_policy_data)

let resource_type_list_of_yojson tree path = list_of_yojson resource_type_of_yojson tree path
let resource_tag_key_of_yojson = string_of_yojson
let resource_tag_value_of_yojson = string_of_yojson

let resource_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key resource_tag_value_of_yojson "Value") _list path;
     key = value_for_key resource_tag_key_of_yojson "Key" _list path;
   }
    : resource_tag)

let resource_tags_of_yojson tree path = list_of_yojson resource_tag_of_yojson tree path

let resource_tag_logical_operator_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "OR" -> OR
    | `String "AND" -> AND
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResourceTagLogicalOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceTagLogicalOperator")
     : resource_tag_logical_operator)
    : resource_tag_logical_operator)

let base62_id_of_yojson = string_of_yojson
let name_of_yojson = string_of_yojson
let description_of_yojson = string_of_yojson

let resource_set_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "OUT_OF_ADMIN_SCOPE" -> OUT_OF_ADMIN_SCOPE
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceSetStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceSetStatus")
     : resource_set_status)
    : resource_set_status)

let resource_set_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_set_status =
       option_of_yojson (value_for_key resource_set_status_of_yojson "ResourceSetStatus") _list path;
     last_update_time =
       option_of_yojson (value_for_key time_stamp_of_yojson "LastUpdateTime") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key base62_id_of_yojson "Id") _list path;
   }
    : resource_set_summary)

let resource_set_summary_list_of_yojson tree path =
  list_of_yojson resource_set_summary_of_yojson tree path

let resource_set_ids_of_yojson tree path = list_of_yojson base62_id_of_yojson tree path

let resource_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_set_status =
       option_of_yojson (value_for_key resource_set_status_of_yojson "ResourceSetStatus") _list path;
     last_update_time =
       option_of_yojson (value_for_key time_stamp_of_yojson "LastUpdateTime") _list path;
     resource_type_list = value_for_key resource_type_list_of_yojson "ResourceTypeList" _list path;
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     name = value_for_key name_of_yojson "Name" _list path;
     id = option_of_yojson (value_for_key base62_id_of_yojson "Id") _list path;
   }
    : resource_set)

let resource_name_of_yojson = string_of_yojson
let identifier_of_yojson = string_of_yojson

let resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key aws_account_id_of_yojson "AccountId") _list path;
     ur_i = value_for_key identifier_of_yojson "URI" _list path;
   }
    : resource)

let resource_list_of_yojson tree path = list_of_yojson resource_of_yojson tree path
let resource_description_of_yojson = string_of_yojson
let resource_count_of_yojson = long_of_yojson
let aws_region_of_yojson = string_of_yojson
let aws_region_list_of_yojson tree path = list_of_yojson aws_region_of_yojson tree path

let region_scope_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     all_regions_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "AllRegionsEnabled") _list path;
     regions = option_of_yojson (value_for_key aws_region_list_of_yojson "Regions") _list path;
   }
    : region_scope)

let put_resource_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_set_arn = value_for_key resource_arn_of_yojson "ResourceSetArn" _list path;
     resource_set = value_for_key resource_set_of_yojson "ResourceSet" _list path;
   }
    : put_resource_set_response)

let put_resource_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_list = option_of_yojson (value_for_key tag_list_of_yojson "TagList") _list path;
     resource_set = value_for_key resource_set_of_yojson "ResourceSet" _list path;
   }
    : put_resource_set_request)

let list_id_of_yojson = string_of_yojson
let protocol_of_yojson = string_of_yojson
let protocols_list_of_yojson tree path = list_of_yojson protocol_of_yojson tree path
let previous_list_version_of_yojson = string_of_yojson

let previous_protocols_list_of_yojson tree path =
  map_of_yojson previous_list_version_of_yojson protocols_list_of_yojson tree path

let protocols_list_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     previous_protocols_list =
       option_of_yojson
         (value_for_key previous_protocols_list_of_yojson "PreviousProtocolsList")
         _list path;
     protocols_list = value_for_key protocols_list_of_yojson "ProtocolsList" _list path;
     last_update_time =
       option_of_yojson (value_for_key time_stamp_of_yojson "LastUpdateTime") _list path;
     create_time = option_of_yojson (value_for_key time_stamp_of_yojson "CreateTime") _list path;
     list_update_token =
       option_of_yojson (value_for_key update_token_of_yojson "ListUpdateToken") _list path;
     list_name = value_for_key resource_name_of_yojson "ListName" _list path;
     list_id = option_of_yojson (value_for_key list_id_of_yojson "ListId") _list path;
   }
    : protocols_list_data)

let put_protocols_list_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protocols_list_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProtocolsListArn") _list path;
     protocols_list =
       option_of_yojson (value_for_key protocols_list_data_of_yojson "ProtocolsList") _list path;
   }
    : put_protocols_list_response)

let put_protocols_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_list = option_of_yojson (value_for_key tag_list_of_yojson "TagList") _list path;
     protocols_list = value_for_key protocols_list_data_of_yojson "ProtocolsList" _list path;
   }
    : put_protocols_list_request)

let policy_update_token_of_yojson = string_of_yojson
let customer_policy_scope_id_of_yojson = string_of_yojson

let customer_policy_scope_id_list_of_yojson tree path =
  list_of_yojson customer_policy_scope_id_of_yojson tree path

let customer_policy_scope_id_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "ORG_UNIT" -> ORG_UNIT
    | `String "ACCOUNT" -> ACCOUNT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CustomerPolicyScopeIdType" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomerPolicyScopeIdType")
     : customer_policy_scope_id_type)
    : customer_policy_scope_id_type)

let customer_policy_scope_map_of_yojson tree path =
  map_of_yojson customer_policy_scope_id_type_of_yojson customer_policy_scope_id_list_of_yojson tree
    path

let customer_policy_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "OUT_OF_ADMIN_SCOPE" -> OUT_OF_ADMIN_SCOPE
    | `String "ACTIVE" -> ACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CustomerPolicyStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomerPolicyStatus")
     : customer_policy_status)
    : customer_policy_status)

let policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_tag_logical_operator =
       option_of_yojson
         (value_for_key resource_tag_logical_operator_of_yojson "ResourceTagLogicalOperator")
         _list path;
     policy_status =
       option_of_yojson (value_for_key customer_policy_status_of_yojson "PolicyStatus") _list path;
     policy_description =
       option_of_yojson
         (value_for_key resource_description_of_yojson "PolicyDescription")
         _list path;
     resource_set_ids =
       option_of_yojson (value_for_key resource_set_ids_of_yojson "ResourceSetIds") _list path;
     exclude_map =
       option_of_yojson (value_for_key customer_policy_scope_map_of_yojson "ExcludeMap") _list path;
     include_map =
       option_of_yojson (value_for_key customer_policy_scope_map_of_yojson "IncludeMap") _list path;
     delete_unused_fm_managed_resources =
       option_of_yojson
         (value_for_key boolean__of_yojson "DeleteUnusedFMManagedResources")
         _list path;
     remediation_enabled = value_for_key boolean__of_yojson "RemediationEnabled" _list path;
     exclude_resource_tags = value_for_key boolean__of_yojson "ExcludeResourceTags" _list path;
     resource_tags =
       option_of_yojson (value_for_key resource_tags_of_yojson "ResourceTags") _list path;
     resource_type_list =
       option_of_yojson (value_for_key resource_type_list_of_yojson "ResourceTypeList") _list path;
     resource_type = value_for_key resource_type_of_yojson "ResourceType" _list path;
     security_service_policy_data =
       value_for_key security_service_policy_data_of_yojson "SecurityServicePolicyData" _list path;
     policy_update_token =
       option_of_yojson (value_for_key policy_update_token_of_yojson "PolicyUpdateToken") _list path;
     policy_name = value_for_key resource_name_of_yojson "PolicyName" _list path;
     policy_id = option_of_yojson (value_for_key policy_id_of_yojson "PolicyId") _list path;
   }
    : policy)

let put_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_arn = option_of_yojson (value_for_key resource_arn_of_yojson "PolicyArn") _list path;
     policy = option_of_yojson (value_for_key policy_of_yojson "Policy") _list path;
   }
    : put_policy_response)

let put_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_list = option_of_yojson (value_for_key tag_list_of_yojson "TagList") _list path;
     policy = value_for_key policy_of_yojson "Policy" _list path;
   }
    : put_policy_request)

let invalid_type_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_type_exception)

let put_notification_channel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sns_role_name = value_for_key resource_arn_of_yojson "SnsRoleName" _list path;
     sns_topic_arn = value_for_key resource_arn_of_yojson "SnsTopicArn" _list path;
   }
    : put_notification_channel_request)

let app_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     port = value_for_key ip_port_number_of_yojson "Port" _list path;
     protocol = value_for_key protocol_of_yojson "Protocol" _list path;
     app_name = value_for_key resource_name_of_yojson "AppName" _list path;
   }
    : app)

let apps_list_of_yojson tree path = list_of_yojson app_of_yojson tree path

let previous_apps_list_of_yojson tree path =
  map_of_yojson previous_list_version_of_yojson apps_list_of_yojson tree path

let apps_list_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     previous_apps_list =
       option_of_yojson (value_for_key previous_apps_list_of_yojson "PreviousAppsList") _list path;
     apps_list = value_for_key apps_list_of_yojson "AppsList" _list path;
     last_update_time =
       option_of_yojson (value_for_key time_stamp_of_yojson "LastUpdateTime") _list path;
     create_time = option_of_yojson (value_for_key time_stamp_of_yojson "CreateTime") _list path;
     list_update_token =
       option_of_yojson (value_for_key update_token_of_yojson "ListUpdateToken") _list path;
     list_name = value_for_key resource_name_of_yojson "ListName" _list path;
     list_id = option_of_yojson (value_for_key list_id_of_yojson "ListId") _list path;
   }
    : apps_list_data)

let put_apps_list_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     apps_list_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "AppsListArn") _list path;
     apps_list = option_of_yojson (value_for_key apps_list_data_of_yojson "AppsList") _list path;
   }
    : put_apps_list_response)

let put_apps_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_list = option_of_yojson (value_for_key tag_list_of_yojson "TagList") _list path;
     apps_list = value_for_key apps_list_data_of_yojson "AppsList" _list path;
   }
    : put_apps_list_request)

let account_id_list_of_yojson tree path = list_of_yojson aws_account_id_of_yojson tree path

let account_scope_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exclude_specified_accounts =
       option_of_yojson (value_for_key boolean__of_yojson "ExcludeSpecifiedAccounts") _list path;
     all_accounts_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "AllAccountsEnabled") _list path;
     accounts = option_of_yojson (value_for_key account_id_list_of_yojson "Accounts") _list path;
   }
    : account_scope)

let organizational_unit_id_of_yojson = string_of_yojson

let organizational_unit_id_list_of_yojson tree path =
  list_of_yojson organizational_unit_id_of_yojson tree path

let organizational_unit_scope_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exclude_specified_organizational_units =
       option_of_yojson
         (value_for_key boolean__of_yojson "ExcludeSpecifiedOrganizationalUnits")
         _list path;
     all_organizational_units_enabled =
       option_of_yojson
         (value_for_key boolean__of_yojson "AllOrganizationalUnitsEnabled")
         _list path;
     organizational_units =
       option_of_yojson
         (value_for_key organizational_unit_id_list_of_yojson "OrganizationalUnits")
         _list path;
   }
    : organizational_unit_scope)

let policy_type_scope_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     all_policy_types_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "AllPolicyTypesEnabled") _list path;
     policy_types =
       option_of_yojson
         (value_for_key security_service_type_list_of_yojson "PolicyTypes")
         _list path;
   }
    : policy_type_scope)

let admin_scope_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_type_scope =
       option_of_yojson (value_for_key policy_type_scope_of_yojson "PolicyTypeScope") _list path;
     region_scope = option_of_yojson (value_for_key region_scope_of_yojson "RegionScope") _list path;
     organizational_unit_scope =
       option_of_yojson
         (value_for_key organizational_unit_scope_of_yojson "OrganizationalUnitScope")
         _list path;
     account_scope =
       option_of_yojson (value_for_key account_scope_of_yojson "AccountScope") _list path;
   }
    : admin_scope)

let put_admin_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     admin_scope = option_of_yojson (value_for_key admin_scope_of_yojson "AdminScope") _list path;
     admin_account = value_for_key aws_account_id_of_yojson "AdminAccount" _list path;
   }
    : put_admin_account_request)

let protocols_list_data_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protocols_list =
       option_of_yojson (value_for_key protocols_list_of_yojson "ProtocolsList") _list path;
     list_name = option_of_yojson (value_for_key resource_name_of_yojson "ListName") _list path;
     list_id = option_of_yojson (value_for_key list_id_of_yojson "ListId") _list path;
     list_arn = option_of_yojson (value_for_key resource_arn_of_yojson "ListArn") _list path;
   }
    : protocols_list_data_summary)

let protocols_lists_data_of_yojson tree path =
  list_of_yojson protocols_list_data_summary_of_yojson tree path

let protection_data_of_yojson = string_of_yojson

let policy_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_status =
       option_of_yojson (value_for_key customer_policy_status_of_yojson "PolicyStatus") _list path;
     delete_unused_fm_managed_resources =
       option_of_yojson
         (value_for_key boolean__of_yojson "DeleteUnusedFMManagedResources")
         _list path;
     remediation_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "RemediationEnabled") _list path;
     security_service_type =
       option_of_yojson
         (value_for_key security_service_type_of_yojson "SecurityServiceType")
         _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     policy_name = option_of_yojson (value_for_key resource_name_of_yojson "PolicyName") _list path;
     policy_id = option_of_yojson (value_for_key policy_id_of_yojson "PolicyId") _list path;
     policy_arn = option_of_yojson (value_for_key resource_arn_of_yojson "PolicyArn") _list path;
   }
    : policy_summary)

let policy_summary_list_of_yojson tree path = list_of_yojson policy_summary_of_yojson tree path

let policy_compliance_status_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "NON_COMPLIANT" -> NonCompliant
    | `String "COMPLIANT" -> Compliant
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PolicyComplianceStatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "PolicyComplianceStatusType")
     : policy_compliance_status_type)
    : policy_compliance_status_type)

let evaluation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_limit_exceeded =
       option_of_yojson (value_for_key boolean__of_yojson "EvaluationLimitExceeded") _list path;
     violator_count =
       option_of_yojson (value_for_key resource_count_of_yojson "ViolatorCount") _list path;
     compliance_status =
       option_of_yojson
         (value_for_key policy_compliance_status_type_of_yojson "ComplianceStatus")
         _list path;
   }
    : evaluation_result)

let evaluation_results_of_yojson tree path = list_of_yojson evaluation_result_of_yojson tree path
let detailed_info_of_yojson = string_of_yojson

let dependent_service_name_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "AWSVPC" -> AWSVirtualPrivateCloud
    | `String "AWSSHIELD_ADVANCED" -> AWSShieldAdvanced
    | `String "AWSWAF" -> AWSWAF
    | `String "AWSCONFIG" -> AWSConfig
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DependentServiceName" value)
    | _ -> raise (deserialize_wrong_type_error path "DependentServiceName")
     : dependent_service_name)
    : dependent_service_name)

let issue_info_map_of_yojson tree path =
  map_of_yojson dependent_service_name_of_yojson detailed_info_of_yojson tree path

let policy_compliance_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     issue_info_map =
       option_of_yojson (value_for_key issue_info_map_of_yojson "IssueInfoMap") _list path;
     last_updated = option_of_yojson (value_for_key time_stamp_of_yojson "LastUpdated") _list path;
     evaluation_results =
       option_of_yojson (value_for_key evaluation_results_of_yojson "EvaluationResults") _list path;
     member_account =
       option_of_yojson (value_for_key aws_account_id_of_yojson "MemberAccount") _list path;
     policy_name = option_of_yojson (value_for_key resource_name_of_yojson "PolicyName") _list path;
     policy_id = option_of_yojson (value_for_key policy_id_of_yojson "PolicyId") _list path;
     policy_owner =
       option_of_yojson (value_for_key aws_account_id_of_yojson "PolicyOwner") _list path;
   }
    : policy_compliance_status)

let policy_compliance_status_list_of_yojson tree path =
  list_of_yojson policy_compliance_status_of_yojson tree path

let compliance_violator_metadata_of_yojson tree path =
  map_of_yojson length_bounded_string_of_yojson length_bounded_string_of_yojson tree path

let compliance_violator_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metadata =
       option_of_yojson (value_for_key compliance_violator_metadata_of_yojson "Metadata") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     violation_reason =
       option_of_yojson (value_for_key violation_reason_of_yojson "ViolationReason") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "ResourceId") _list path;
   }
    : compliance_violator)

let compliance_violators_of_yojson tree path =
  list_of_yojson compliance_violator_of_yojson tree path

let policy_compliance_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     issue_info_map =
       option_of_yojson (value_for_key issue_info_map_of_yojson "IssueInfoMap") _list path;
     expired_at = option_of_yojson (value_for_key time_stamp_of_yojson "ExpiredAt") _list path;
     evaluation_limit_exceeded =
       option_of_yojson (value_for_key boolean__of_yojson "EvaluationLimitExceeded") _list path;
     violators =
       option_of_yojson (value_for_key compliance_violators_of_yojson "Violators") _list path;
     member_account =
       option_of_yojson (value_for_key aws_account_id_of_yojson "MemberAccount") _list path;
     policy_id = option_of_yojson (value_for_key policy_id_of_yojson "PolicyId") _list path;
     policy_owner =
       option_of_yojson (value_for_key aws_account_id_of_yojson "PolicyOwner") _list path;
   }
    : policy_compliance_detail)

let pagination_token_of_yojson = string_of_yojson
let pagination_max_results_of_yojson = int_of_yojson

let organization_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "OFFBOARDING_COMPLETE" -> OffboardingComplete
    | `String "OFFBOARDING" -> Offboarding
    | `String "ONBOARDING_COMPLETE" -> OnboardingComplete
    | `String "ONBOARDING" -> Onboarding
    | `String value -> raise (deserialize_unknown_enum_value_error path "OrganizationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OrganizationStatus")
     : organization_status)
    : organization_status)

let member_accounts_of_yojson tree path = list_of_yojson aws_account_id_of_yojson tree path

let marketplace_subscription_onboarding_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "COMPLETE" -> COMPLETE
    | `String "NOT_COMPLETE" -> NOT_COMPLETE
    | `String "NO_SUBSCRIPTION" -> NO_SUBSCRIPTION
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "MarketplaceSubscriptionOnboardingStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "MarketplaceSubscriptionOnboardingStatus")
     : marketplace_subscription_onboarding_status)
    : marketplace_subscription_onboarding_status)

let list_third_party_firewall_firewall_policies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     third_party_firewall_firewall_policies =
       option_of_yojson
         (value_for_key third_party_firewall_firewall_policies_of_yojson
            "ThirdPartyFirewallFirewallPolicies")
         _list path;
   }
    : list_third_party_firewall_firewall_policies_response)

let list_third_party_firewall_firewall_policies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = value_for_key pagination_max_results_of_yojson "MaxResults" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     third_party_firewall =
       value_for_key third_party_firewall_of_yojson "ThirdPartyFirewall" _list path;
   }
    : list_third_party_firewall_firewall_policies_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tag_list = option_of_yojson (value_for_key tag_list_of_yojson "TagList") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let list_resource_sets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     resource_sets =
       option_of_yojson
         (value_for_key resource_set_summary_list_of_yojson "ResourceSets")
         _list path;
   }
    : list_resource_sets_response)

let list_resource_sets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_resource_sets_request)

let list_resource_set_resources_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     items = value_for_key resource_list_of_yojson "Items" _list path;
   }
    : list_resource_set_resources_response)

let list_resource_set_resources_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     identifier = value_for_key resource_id_of_yojson "Identifier" _list path;
   }
    : list_resource_set_resources_request)

let list_protocols_lists_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     protocols_lists =
       option_of_yojson (value_for_key protocols_lists_data_of_yojson "ProtocolsLists") _list path;
   }
    : list_protocols_lists_response)

let list_protocols_lists_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = value_for_key pagination_max_results_of_yojson "MaxResults" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     default_lists = option_of_yojson (value_for_key boolean__of_yojson "DefaultLists") _list path;
   }
    : list_protocols_lists_request)

let list_policies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     policy_list =
       option_of_yojson (value_for_key policy_summary_list_of_yojson "PolicyList") _list path;
   }
    : list_policies_response)

let list_policies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_policies_request)

let list_member_accounts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     member_accounts =
       option_of_yojson (value_for_key member_accounts_of_yojson "MemberAccounts") _list path;
   }
    : list_member_accounts_response)

let list_member_accounts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_member_accounts_request)

let discovered_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     type_ = option_of_yojson (value_for_key resource_type_of_yojson "Type") _list path;
     account_id = option_of_yojson (value_for_key aws_account_id_of_yojson "AccountId") _list path;
     ur_i = option_of_yojson (value_for_key identifier_of_yojson "URI") _list path;
   }
    : discovered_resource)

let discovered_resource_list_of_yojson tree path =
  list_of_yojson discovered_resource_of_yojson tree path

let list_discovered_resources_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     items = option_of_yojson (value_for_key discovered_resource_list_of_yojson "Items") _list path;
   }
    : list_discovered_resources_response)

let aws_account_id_list_of_yojson tree path = list_of_yojson aws_account_id_of_yojson tree path

let list_discovered_resources_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     resource_type = value_for_key resource_type_of_yojson "ResourceType" _list path;
     member_account_ids = value_for_key aws_account_id_list_of_yojson "MemberAccountIds" _list path;
   }
    : list_discovered_resources_request)

let list_compliance_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     policy_compliance_status_list =
       option_of_yojson
         (value_for_key policy_compliance_status_list_of_yojson "PolicyComplianceStatusList")
         _list path;
   }
    : list_compliance_status_response)

let list_compliance_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     policy_id = value_for_key policy_id_of_yojson "PolicyId" _list path;
   }
    : list_compliance_status_request)

let apps_list_data_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     apps_list = option_of_yojson (value_for_key apps_list_of_yojson "AppsList") _list path;
     list_name = option_of_yojson (value_for_key resource_name_of_yojson "ListName") _list path;
     list_id = option_of_yojson (value_for_key list_id_of_yojson "ListId") _list path;
     list_arn = option_of_yojson (value_for_key resource_arn_of_yojson "ListArn") _list path;
   }
    : apps_list_data_summary)

let apps_lists_data_of_yojson tree path = list_of_yojson apps_list_data_summary_of_yojson tree path

let list_apps_lists_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     apps_lists = option_of_yojson (value_for_key apps_lists_data_of_yojson "AppsLists") _list path;
   }
    : list_apps_lists_response)

let list_apps_lists_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = value_for_key pagination_max_results_of_yojson "MaxResults" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     default_lists = option_of_yojson (value_for_key boolean__of_yojson "DefaultLists") _list path;
   }
    : list_apps_lists_request)

let list_admins_managing_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     admin_accounts =
       option_of_yojson (value_for_key account_id_list_of_yojson "AdminAccounts") _list path;
   }
    : list_admins_managing_account_response)

let list_admins_managing_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_admins_managing_account_request)

let admin_account_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key organization_status_of_yojson "Status") _list path;
     default_admin = option_of_yojson (value_for_key boolean__of_yojson "DefaultAdmin") _list path;
     admin_account =
       option_of_yojson (value_for_key aws_account_id_of_yojson "AdminAccount") _list path;
   }
    : admin_account_summary)

let admin_account_summary_list_of_yojson tree path =
  list_of_yojson admin_account_summary_of_yojson tree path

let list_admin_accounts_for_organization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     admin_accounts =
       option_of_yojson
         (value_for_key admin_account_summary_list_of_yojson "AdminAccounts")
         _list path;
   }
    : list_admin_accounts_for_organization_response)

let list_admin_accounts_for_organization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_admin_accounts_for_organization_request)

let identifier_list_of_yojson tree path = list_of_yojson identifier_of_yojson tree path

let get_violation_details_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     violation_detail =
       option_of_yojson (value_for_key violation_detail_of_yojson "ViolationDetail") _list path;
   }
    : get_violation_details_response)

let get_violation_details_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key resource_type_of_yojson "ResourceType" _list path;
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
     member_account = value_for_key aws_account_id_of_yojson "MemberAccount" _list path;
     policy_id = value_for_key policy_id_of_yojson "PolicyId" _list path;
   }
    : get_violation_details_request)

let get_third_party_firewall_association_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marketplace_onboarding_status =
       option_of_yojson
         (value_for_key marketplace_subscription_onboarding_status_of_yojson
            "MarketplaceOnboardingStatus")
         _list path;
     third_party_firewall_status =
       option_of_yojson
         (value_for_key third_party_firewall_association_status_of_yojson "ThirdPartyFirewallStatus")
         _list path;
   }
    : get_third_party_firewall_association_status_response)

let get_third_party_firewall_association_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     third_party_firewall =
       value_for_key third_party_firewall_of_yojson "ThirdPartyFirewall" _list path;
   }
    : get_third_party_firewall_association_status_request)

let get_resource_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_set_arn = value_for_key resource_arn_of_yojson "ResourceSetArn" _list path;
     resource_set = value_for_key resource_set_of_yojson "ResourceSet" _list path;
   }
    : get_resource_set_response)

let get_resource_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key base62_id_of_yojson "Identifier" _list path }
    : get_resource_set_request)

let get_protocols_list_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protocols_list_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProtocolsListArn") _list path;
     protocols_list =
       option_of_yojson (value_for_key protocols_list_data_of_yojson "ProtocolsList") _list path;
   }
    : get_protocols_list_response)

let get_protocols_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_list = option_of_yojson (value_for_key boolean__of_yojson "DefaultList") _list path;
     list_id = value_for_key list_id_of_yojson "ListId" _list path;
   }
    : get_protocols_list_request)

let get_protection_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     data = option_of_yojson (value_for_key protection_data_of_yojson "Data") _list path;
     service_type =
       option_of_yojson (value_for_key security_service_type_of_yojson "ServiceType") _list path;
     admin_account_id =
       option_of_yojson (value_for_key aws_account_id_of_yojson "AdminAccountId") _list path;
   }
    : get_protection_status_response)

let get_protection_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     end_time = option_of_yojson (value_for_key time_stamp_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key time_stamp_of_yojson "StartTime") _list path;
     member_account_id =
       option_of_yojson (value_for_key aws_account_id_of_yojson "MemberAccountId") _list path;
     policy_id = value_for_key policy_id_of_yojson "PolicyId" _list path;
   }
    : get_protection_status_request)

let get_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_arn = option_of_yojson (value_for_key resource_arn_of_yojson "PolicyArn") _list path;
     policy = option_of_yojson (value_for_key policy_of_yojson "Policy") _list path;
   }
    : get_policy_response)

let get_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy_id = value_for_key policy_id_of_yojson "PolicyId" _list path } : get_policy_request)

let get_notification_channel_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sns_role_name =
       option_of_yojson (value_for_key resource_arn_of_yojson "SnsRoleName") _list path;
     sns_topic_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "SnsTopicArn") _list path;
   }
    : get_notification_channel_response)

let get_notification_channel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let get_compliance_detail_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_compliance_detail =
       option_of_yojson
         (value_for_key policy_compliance_detail_of_yojson "PolicyComplianceDetail")
         _list path;
   }
    : get_compliance_detail_response)

let get_compliance_detail_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     member_account = value_for_key aws_account_id_of_yojson "MemberAccount" _list path;
     policy_id = value_for_key policy_id_of_yojson "PolicyId" _list path;
   }
    : get_compliance_detail_request)

let get_apps_list_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     apps_list_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "AppsListArn") _list path;
     apps_list = option_of_yojson (value_for_key apps_list_data_of_yojson "AppsList") _list path;
   }
    : get_apps_list_response)

let get_apps_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_list = option_of_yojson (value_for_key boolean__of_yojson "DefaultList") _list path;
     list_id = value_for_key list_id_of_yojson "ListId" _list path;
   }
    : get_apps_list_request)

let get_admin_scope_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key organization_status_of_yojson "Status") _list path;
     admin_scope = option_of_yojson (value_for_key admin_scope_of_yojson "AdminScope") _list path;
   }
    : get_admin_scope_response)

let get_admin_scope_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ admin_account = value_for_key aws_account_id_of_yojson "AdminAccount" _list path }
    : get_admin_scope_request)

let account_role_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DELETED" -> Deleted
    | `String "DELETING" -> Deleting
    | `String "PENDING_DELETION" -> PendingDeletion
    | `String "CREATING" -> Creating
    | `String "READY" -> Ready
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccountRoleStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AccountRoleStatus")
     : account_role_status)
    : account_role_status)

let get_admin_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_status =
       option_of_yojson (value_for_key account_role_status_of_yojson "RoleStatus") _list path;
     admin_account =
       option_of_yojson (value_for_key aws_account_id_of_yojson "AdminAccount") _list path;
   }
    : get_admin_account_response)

let get_admin_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let failed_item_reason_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "NOT_VALID_ACCOUNT_ID" -> NotValidAccountId
    | `String "NOT_VALID_RESOURCE_TYPE" -> NotValidResourceType
    | `String "NOT_VALID_SERVICE" -> NotValidService
    | `String "NOT_VALID_REGION" -> NotValidRegion
    | `String "NOT_VALID_PARTITION" -> NotValidPartition
    | `String "NOT_VALID_ARN" -> NotValidArn
    | `String value -> raise (deserialize_unknown_enum_value_error path "FailedItemReason" value)
    | _ -> raise (deserialize_wrong_type_error path "FailedItemReason")
     : failed_item_reason)
    : failed_item_reason)

let failed_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = option_of_yojson (value_for_key failed_item_reason_of_yojson "Reason") _list path;
     ur_i = option_of_yojson (value_for_key identifier_of_yojson "URI") _list path;
   }
    : failed_item)

let failed_item_list_of_yojson tree path = list_of_yojson failed_item_of_yojson tree path

let disassociate_third_party_firewall_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     third_party_firewall_status =
       option_of_yojson
         (value_for_key third_party_firewall_association_status_of_yojson "ThirdPartyFirewallStatus")
         _list path;
   }
    : disassociate_third_party_firewall_response)

let disassociate_third_party_firewall_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     third_party_firewall =
       value_for_key third_party_firewall_of_yojson "ThirdPartyFirewall" _list path;
   }
    : disassociate_third_party_firewall_request)

let disassociate_admin_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_resource_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key base62_id_of_yojson "Identifier" _list path }
    : delete_resource_set_request)

let delete_protocols_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ list_id = value_for_key list_id_of_yojson "ListId" _list path }
    : delete_protocols_list_request)

let delete_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete_all_policy_resources =
       option_of_yojson (value_for_key boolean__of_yojson "DeleteAllPolicyResources") _list path;
     policy_id = value_for_key policy_id_of_yojson "PolicyId" _list path;
   }
    : delete_policy_request)

let delete_notification_channel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_apps_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ list_id = value_for_key list_id_of_yojson "ListId" _list path } : delete_apps_list_request)

let batch_disassociate_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_items = value_for_key failed_item_list_of_yojson "FailedItems" _list path;
     resource_set_identifier = value_for_key identifier_of_yojson "ResourceSetIdentifier" _list path;
   }
    : batch_disassociate_resource_response)

let batch_disassociate_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     items = value_for_key identifier_list_of_yojson "Items" _list path;
     resource_set_identifier = value_for_key identifier_of_yojson "ResourceSetIdentifier" _list path;
   }
    : batch_disassociate_resource_request)

let batch_associate_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_items = value_for_key failed_item_list_of_yojson "FailedItems" _list path;
     resource_set_identifier = value_for_key identifier_of_yojson "ResourceSetIdentifier" _list path;
   }
    : batch_associate_resource_response)

let batch_associate_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     items = value_for_key identifier_list_of_yojson "Items" _list path;
     resource_set_identifier = value_for_key identifier_of_yojson "ResourceSetIdentifier" _list path;
   }
    : batch_associate_resource_request)

let associate_third_party_firewall_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     third_party_firewall_status =
       option_of_yojson
         (value_for_key third_party_firewall_association_status_of_yojson "ThirdPartyFirewallStatus")
         _list path;
   }
    : associate_third_party_firewall_response)

let associate_third_party_firewall_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     third_party_firewall =
       value_for_key third_party_firewall_of_yojson "ThirdPartyFirewall" _list path;
   }
    : associate_third_party_firewall_request)

let associate_admin_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ admin_account = value_for_key aws_account_id_of_yojson "AdminAccount" _list path }
    : associate_admin_account_request)
