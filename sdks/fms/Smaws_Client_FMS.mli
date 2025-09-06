(** 
    FMS client library built on EIO.
    
*)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_web_acl_has_out_of_scope_resources_violation :
  ?out_of_scope_resource_list:resource_arn_list ->
    ?web_acl_arn:resource_arn ->
      unit -> web_acl_has_out_of_scope_resources_violation
val make_web_acl_has_incompatible_configuration_violation :
  ?description:length_bounded_string ->
    ?web_acl_arn:resource_arn ->
      unit -> web_acl_has_incompatible_configuration_violation
val make_partial_match :
  ?target_violation_reasons:target_violation_reasons ->
    ?reference:reference_rule -> unit -> partial_match
val make_security_group_rule_description :
  ?to_port:ip_port_number ->
    ?from_port:ip_port_number ->
      ?protocol:length_bounded_string ->
        ?prefix_list_id:resource_id ->
          ?ipv6_range:cid_r ->
            ?ipv4_range:cid_r -> unit -> security_group_rule_description
val make_security_group_remediation_action :
  ?is_default_action:boolean_ ->
    ?remediation_result:security_group_rule_description ->
      ?description:remediation_action_description ->
        ?remediation_action_type:remediation_action_type ->
          unit -> security_group_remediation_action
val make_aws_vpc_security_group_violation :
  ?possible_security_group_remediation_actions:security_group_remediation_actions
    ->
    ?partial_matches:partial_matches ->
      ?violation_target_description:length_bounded_string ->
        ?violation_target:violation_target ->
          unit -> aws_vpc_security_group_violation
val make_aws_ec2_network_interface_violation :
  ?violating_security_groups:resource_id_list ->
    ?violation_target:violation_target ->
      unit -> aws_ec2_network_interface_violation
val make_aws_ec2_instance_violation :
  ?aws_ec2_network_interface_violations:aws_ec2_network_interface_violations
    ->
    ?violation_target:violation_target -> unit -> aws_ec2_instance_violation
val make_network_firewall_missing_firewall_violation :
  ?target_violation_reason:target_violation_reason ->
    ?availability_zone:length_bounded_string ->
      ?vp_c:resource_id ->
        ?violation_target:violation_target ->
          unit -> network_firewall_missing_firewall_violation
val make_network_firewall_missing_subnet_violation :
  ?target_violation_reason:target_violation_reason ->
    ?availability_zone:length_bounded_string ->
      ?vp_c:resource_id ->
        ?violation_target:violation_target ->
          unit -> network_firewall_missing_subnet_violation
val make_network_firewall_missing_expected_rt_violation :
  ?expected_route_table:resource_id ->
    ?current_route_table:resource_id ->
      ?availability_zone:length_bounded_string ->
        ?vp_c:resource_id ->
          ?violation_target:violation_target ->
            unit -> network_firewall_missing_expected_rt_violation
val make_stateless_rule_group :
  ?priority:stateless_rule_group_priority ->
    ?resource_id:resource_id ->
      ?rule_group_name:network_firewall_resource_name ->
        unit -> stateless_rule_group
val make_network_firewall_stateful_rule_group_override :
  ?action:network_firewall_override_action ->
    unit -> network_firewall_stateful_rule_group_override
val make_stateful_rule_group :
  ?override:network_firewall_stateful_rule_group_override ->
    ?priority:priority_number ->
      ?resource_id:resource_id ->
        ?rule_group_name:network_firewall_resource_name ->
          unit -> stateful_rule_group
val make_stateful_engine_options :
  ?stream_exception_policy:stream_exception_policy ->
    ?rule_order:rule_order -> unit -> stateful_engine_options
val make_network_firewall_policy_description :
  ?stateful_engine_options:stateful_engine_options ->
    ?stateful_default_actions:network_firewall_action_list ->
      ?stateful_rule_groups:stateful_rule_group_list ->
        ?stateless_custom_actions:network_firewall_action_list ->
          ?stateless_fragment_default_actions:network_firewall_action_list ->
            ?stateless_default_actions:network_firewall_action_list ->
              ?stateless_rule_groups:stateless_rule_group_list ->
                unit -> network_firewall_policy_description
val make_network_firewall_policy_modified_violation :
  ?expected_policy_description:network_firewall_policy_description ->
    ?current_policy_description:network_firewall_policy_description ->
      ?violation_target:violation_target ->
        unit -> network_firewall_policy_modified_violation
val make_route :
  ?target:length_bounded_string ->
    ?destination:length_bounded_string ->
      ?target_type:target_type ->
        ?destination_type:destination_type -> unit -> route
val make_expected_route :
  ?route_table_id:resource_id ->
    ?allowed_targets:length_bounded_string_list ->
      ?contributing_subnets:resource_id_list ->
        ?ip_v6_cidr:cid_r ->
          ?prefix_list_id:cid_r ->
            ?ip_v4_cidr:cid_r -> unit -> expected_route
val make_network_firewall_internet_traffic_not_inspected_violation :
  ?vpc_id:resource_id ->
    ?actual_internet_gateway_routes:routes ->
      ?expected_internet_gateway_routes:expected_routes ->
        ?current_internet_gateway_route_table:resource_id ->
          ?internet_gateway_id:resource_id ->
            ?actual_firewall_subnet_routes:routes ->
              ?expected_firewall_subnet_routes:expected_routes ->
                ?firewall_subnet_id:resource_id ->
                  ?expected_firewall_endpoint:resource_id ->
                    ?current_firewall_subnet_route_table:resource_id ->
                      ?is_route_table_used_in_different_a_z:boolean_ ->
                        ?violating_routes:routes ->
                          ?route_table_id:resource_id ->
                            ?subnet_availability_zone:length_bounded_string
                              ->
                              ?subnet_id:resource_id ->
                                unit ->
                                  network_firewall_internet_traffic_not_inspected_violation
val make_network_firewall_invalid_route_configuration_violation :
  ?vpc_id:resource_id ->
    ?actual_internet_gateway_routes:routes ->
      ?expected_internet_gateway_routes:expected_routes ->
        ?current_internet_gateway_route_table:resource_id ->
          ?internet_gateway_id:resource_id ->
            ?actual_firewall_subnet_routes:routes ->
              ?expected_firewall_subnet_routes:expected_routes ->
                ?actual_firewall_subnet_id:resource_id ->
                  ?expected_firewall_subnet_id:resource_id ->
                    ?actual_firewall_endpoint:resource_id ->
                      ?expected_firewall_endpoint:resource_id ->
                        ?current_firewall_subnet_route_table:resource_id ->
                          ?violating_route:route ->
                            ?is_route_table_used_in_different_a_z:boolean_ ->
                              ?route_table_id:resource_id ->
                                ?affected_subnets:resource_id_list ->
                                  unit ->
                                    network_firewall_invalid_route_configuration_violation
val make_network_firewall_black_hole_route_detected_violation :
  ?violating_routes:routes ->
    ?vpc_id:resource_id ->
      ?route_table_id:resource_id ->
        ?violation_target:violation_target ->
          unit -> network_firewall_black_hole_route_detected_violation
val make_network_firewall_unexpected_firewall_routes_violation :
  ?vpc_id:resource_id ->
    ?firewall_endpoint:resource_id ->
      ?route_table_id:resource_id ->
        ?violating_routes:routes ->
          ?firewall_subnet_id:resource_id ->
            unit -> network_firewall_unexpected_firewall_routes_violation
val make_network_firewall_unexpected_gateway_routes_violation :
  ?vpc_id:resource_id ->
    ?route_table_id:resource_id ->
      ?violating_routes:routes ->
        ?gateway_id:resource_id ->
          unit -> network_firewall_unexpected_gateway_routes_violation
val make_network_firewall_missing_expected_routes_violation :
  ?vpc_id:resource_id ->
    ?expected_routes:expected_routes ->
      ?violation_target:violation_target ->
        unit -> network_firewall_missing_expected_routes_violation
val make_dns_rule_group_priority_conflict_violation :
  ?unavailable_priorities:dns_rule_group_priorities ->
    ?conflicting_policy_id:policy_id ->
      ?conflicting_priority:dns_rule_group_priority ->
        ?violation_target_description:length_bounded_string ->
          ?violation_target:violation_target ->
            unit -> dns_rule_group_priority_conflict_violation
val make_dns_duplicate_rule_group_violation :
  ?violation_target_description:length_bounded_string ->
    ?violation_target:violation_target ->
      unit -> dns_duplicate_rule_group_violation
val make_dns_rule_group_limit_exceeded_violation :
  ?number_of_rule_groups_already_associated:basic_integer ->
    ?violation_target_description:length_bounded_string ->
      ?violation_target:violation_target ->
        unit -> dns_rule_group_limit_exceeded_violation
val make_firewall_subnet_is_out_of_scope_violation :
  ?vpc_endpoint_id:resource_id ->
    ?subnet_availability_zone_id:length_bounded_string ->
      ?subnet_availability_zone:length_bounded_string ->
        ?vpc_id:resource_id ->
          ?firewall_subnet_id:resource_id ->
            unit -> firewall_subnet_is_out_of_scope_violation
val make_route_has_out_of_scope_endpoint_violation :
  ?internet_gateway_routes:routes ->
    ?current_internet_gateway_route_table:resource_id ->
      ?internet_gateway_id:resource_id ->
        ?firewall_subnet_routes:routes ->
          ?firewall_subnet_id:resource_id ->
            ?current_firewall_subnet_route_table:resource_id ->
              ?subnet_availability_zone_id:length_bounded_string ->
                ?subnet_availability_zone:length_bounded_string ->
                  ?violating_routes:routes ->
                    ?route_table_id:resource_id ->
                      ?vpc_id:resource_id ->
                        ?subnet_id:resource_id ->
                          unit -> route_has_out_of_scope_endpoint_violation
val make_third_party_firewall_missing_firewall_violation :
  ?target_violation_reason:target_violation_reason ->
    ?availability_zone:length_bounded_string ->
      ?vp_c:resource_id ->
        ?violation_target:violation_target ->
          unit -> third_party_firewall_missing_firewall_violation
val make_third_party_firewall_missing_subnet_violation :
  ?target_violation_reason:target_violation_reason ->
    ?availability_zone:length_bounded_string ->
      ?vp_c:resource_id ->
        ?violation_target:violation_target ->
          unit -> third_party_firewall_missing_subnet_violation
val make_third_party_firewall_missing_expected_route_table_violation :
  ?expected_route_table:resource_id ->
    ?current_route_table:resource_id ->
      ?availability_zone:length_bounded_string ->
        ?vp_c:resource_id ->
          ?violation_target:violation_target ->
            unit ->
              third_party_firewall_missing_expected_route_table_violation
val make_firewall_subnet_missing_vpc_endpoint_violation :
  ?subnet_availability_zone_id:length_bounded_string ->
    ?subnet_availability_zone:length_bounded_string ->
      ?vpc_id:resource_id ->
        ?firewall_subnet_id:resource_id ->
          unit -> firewall_subnet_missing_vpc_endpoint_violation
val make_network_acl_icmp_type_code :
  ?type_:integer_object ->
    ?code:integer_object -> unit -> network_acl_icmp_type_code
val make_network_acl_port_range :
  ?to_:ip_port_number_integer ->
    ?from_:ip_port_number_integer -> unit -> network_acl_port_range
val make_network_acl_entry :
  ?ipv6_cidr_block:length_bounded_non_empty_string ->
    ?cidr_block:length_bounded_non_empty_string ->
      ?port_range:network_acl_port_range ->
        ?icmp_type_code:network_acl_icmp_type_code ->
          egress:boolean_object ->
            rule_action:network_acl_rule_action ->
              protocol:length_bounded_string -> unit -> network_acl_entry
val make_entry_description :
  ?entry_type:entry_type ->
    ?entry_rule_number:integer_object_minimum0 ->
      ?entry_detail:network_acl_entry -> unit -> entry_description
val make_entry_violation :
  ?entry_violation_reasons:entry_violation_reasons ->
    ?entries_with_conflicts:entries_with_conflicts ->
      ?entry_at_expected_evaluation_order:entry_description ->
        ?actual_evaluation_order:length_bounded_string ->
          ?expected_evaluation_order:length_bounded_string ->
            ?expected_entry:entry_description -> unit -> entry_violation
val make_invalid_network_acl_entries_violation :
  ?entry_violations:entry_violations ->
    ?current_associated_network_acl:resource_id ->
      ?subnet_availability_zone:length_bounded_string ->
        ?subnet:resource_id ->
          ?vpc:resource_id -> unit -> invalid_network_acl_entries_violation
val make_action_target :
  ?description:length_bounded_string ->
    ?resource_id:resource_id -> unit -> action_target
val make_ec2_create_route_action :
  ?gateway_id:action_target ->
    ?vpc_endpoint_id:action_target ->
      ?destination_ipv6_cidr_block:cid_r ->
        ?destination_prefix_list_id:resource_id ->
          ?destination_cidr_block:cid_r ->
            ?description:length_bounded_string ->
              route_table_id:action_target -> unit -> ec2_create_route_action
val make_ec2_replace_route_action :
  ?gateway_id:action_target ->
    ?destination_ipv6_cidr_block:cid_r ->
      ?destination_prefix_list_id:resource_id ->
        ?destination_cidr_block:cid_r ->
          ?description:length_bounded_string ->
            route_table_id:action_target -> unit -> ec2_replace_route_action
val make_ec2_delete_route_action :
  ?destination_ipv6_cidr_block:cid_r ->
    ?destination_prefix_list_id:resource_id ->
      ?destination_cidr_block:cid_r ->
        ?description:length_bounded_string ->
          route_table_id:action_target -> unit -> ec2_delete_route_action
val make_ec2_copy_route_table_action :
  ?description:length_bounded_string ->
    route_table_id:action_target ->
      vpc_id:action_target -> unit -> ec2_copy_route_table_action
val make_ec2_replace_route_table_association_action :
  ?description:length_bounded_string ->
    route_table_id:action_target ->
      association_id:action_target ->
        unit -> ec2_replace_route_table_association_action
val make_ec2_associate_route_table_action :
  ?gateway_id:action_target ->
    ?subnet_id:action_target ->
      ?description:length_bounded_string ->
        route_table_id:action_target ->
          unit -> ec2_associate_route_table_action
val make_ec2_create_route_table_action :
  ?description:length_bounded_string ->
    vpc_id:action_target -> unit -> ec2_create_route_table_action
val make_fms_policy_update_firewall_creation_config_action :
  ?firewall_creation_config:managed_service_data ->
    ?description:length_bounded_string ->
      unit -> fms_policy_update_firewall_creation_config_action
val make_create_network_acl_action :
  ?fms_can_remediate:boolean_ ->
    ?vpc:action_target ->
      ?description:length_bounded_string -> unit -> create_network_acl_action
val make_replace_network_acl_association_action :
  ?fms_can_remediate:boolean_ ->
    ?network_acl_id:action_target ->
      ?association_id:action_target ->
        ?description:length_bounded_string ->
          unit -> replace_network_acl_association_action
val make_create_network_acl_entries_action :
  ?fms_can_remediate:boolean_ ->
    ?network_acl_entries_to_be_created:entries_description ->
      ?network_acl_id:action_target ->
        ?description:length_bounded_string ->
          unit -> create_network_acl_entries_action
val make_delete_network_acl_entries_action :
  ?fms_can_remediate:boolean_ ->
    ?network_acl_entries_to_be_deleted:entries_description ->
      ?network_acl_id:action_target ->
        ?description:length_bounded_string ->
          unit -> delete_network_acl_entries_action
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
                          ?description:length_bounded_string ->
                            unit -> remediation_action
val make_remediation_action_with_order :
  ?order:basic_integer ->
    ?remediation_action:remediation_action ->
      unit -> remediation_action_with_order
val make_possible_remediation_action :
  ?is_default_action:boolean_ ->
    ?description:length_bounded_string ->
      ordered_remediation_actions:ordered_remediation_actions ->
        unit -> possible_remediation_action
val make_possible_remediation_actions :
  ?actions:possible_remediation_action_list ->
    ?description:length_bounded_string ->
      unit -> possible_remediation_actions
val make_resource_violation :
  ?web_acl_has_out_of_scope_resources_violation:web_acl_has_out_of_scope_resources_violation
    ->
    ?web_acl_has_incompatible_configuration_violation:web_acl_has_incompatible_configuration_violation
      ->
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
                                                      unit ->
                                                        resource_violation
val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_violation_detail :
  ?resource_description:length_bounded_string ->
    ?resource_tags:tag_list ->
      resource_violations:resource_violations ->
        resource_type:resource_type ->
          resource_id:resource_id ->
            member_account:aws_account_id ->
              policy_id:policy_id -> unit -> violation_detail
val make_untag_resource_response : unit -> unit
val make_untag_resource_request :
  tag_keys:tag_key_list ->
    resource_arn:resource_arn -> unit -> untag_resource_request
val make_third_party_firewall_policy :
  ?firewall_deployment_model:firewall_deployment_model ->
    unit -> third_party_firewall_policy
val make_third_party_firewall_firewall_policy :
  ?firewall_policy_name:firewall_policy_name ->
    ?firewall_policy_id:firewall_policy_id ->
      unit -> third_party_firewall_firewall_policy
val make_tag_resource_response : unit -> unit
val make_tag_resource_request :
  tag_list:tag_list ->
    resource_arn:resource_arn -> unit -> tag_resource_request
val make_network_firewall_policy :
  ?firewall_deployment_model:firewall_deployment_model ->
    unit -> network_firewall_policy
val make_network_acl_entry_set :
  ?last_entries:network_acl_entries ->
    ?first_entries:network_acl_entries ->
      force_remediate_for_last_entries:boolean_object ->
        force_remediate_for_first_entries:boolean_object ->
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
    ?managed_service_data:managed_service_data ->
      type_:security_service_type -> unit -> security_service_policy_data
val make_resource_tag :
  ?value:resource_tag_value -> key:resource_tag_key -> unit -> resource_tag
val make_resource_set_summary :
  ?resource_set_status:resource_set_status ->
    ?last_update_time:time_stamp ->
      ?description:description ->
        ?name:name -> ?id:base62_id -> unit -> resource_set_summary
val make_resource_set :
  ?resource_set_status:resource_set_status ->
    ?last_update_time:time_stamp ->
      ?update_token:update_token ->
        ?description:description ->
          ?id:base62_id ->
            resource_type_list:resource_type_list ->
              name:name -> unit -> resource_set
val make_resource :
  ?account_id:aws_account_id -> ur_i:identifier -> unit -> resource
val make_region_scope :
  ?all_regions_enabled:boolean_ ->
    ?regions:aws_region_list -> unit -> region_scope
val make_put_resource_set_response :
  resource_set_arn:resource_arn ->
    resource_set:resource_set -> unit -> put_resource_set_response
val make_put_resource_set_request :
  ?tag_list:tag_list ->
    resource_set:resource_set -> unit -> put_resource_set_request
val make_protocols_list_data :
  ?previous_protocols_list:previous_protocols_list ->
    ?last_update_time:time_stamp ->
      ?create_time:time_stamp ->
        ?list_update_token:update_token ->
          ?list_id:list_id ->
            protocols_list:protocols_list ->
              list_name:resource_name -> unit -> protocols_list_data
val make_put_protocols_list_response :
  ?protocols_list_arn:resource_arn ->
    ?protocols_list:protocols_list_data ->
      unit -> put_protocols_list_response
val make_put_protocols_list_request :
  ?tag_list:tag_list ->
    protocols_list:protocols_list_data -> unit -> put_protocols_list_request
val make_policy :
  ?resource_tag_logical_operator:resource_tag_logical_operator ->
    ?policy_status:customer_policy_status ->
      ?policy_description:resource_description ->
        ?resource_set_ids:resource_set_ids ->
          ?exclude_map:customer_policy_scope_map ->
            ?include_map:customer_policy_scope_map ->
              ?delete_unused_fm_managed_resources:boolean_ ->
                ?resource_tags:resource_tags ->
                  ?resource_type_list:resource_type_list ->
                    ?policy_update_token:policy_update_token ->
                      ?policy_id:policy_id ->
                        remediation_enabled:boolean_ ->
                          exclude_resource_tags:boolean_ ->
                            resource_type:resource_type ->
                              security_service_policy_data:security_service_policy_data
                                ->
                                policy_name:resource_name -> unit -> policy
val make_put_policy_response :
  ?policy_arn:resource_arn -> ?policy:policy -> unit -> put_policy_response
val make_put_policy_request :
  ?tag_list:tag_list -> policy:policy -> unit -> put_policy_request
val make_put_notification_channel_request :
  sns_role_name:resource_arn ->
    sns_topic_arn:resource_arn -> unit -> put_notification_channel_request
val make_app :
  port:ip_port_number ->
    protocol:protocol -> app_name:resource_name -> unit -> app
val make_apps_list_data :
  ?previous_apps_list:previous_apps_list ->
    ?last_update_time:time_stamp ->
      ?create_time:time_stamp ->
        ?list_update_token:update_token ->
          ?list_id:list_id ->
            apps_list:apps_list ->
              list_name:resource_name -> unit -> apps_list_data
val make_put_apps_list_response :
  ?apps_list_arn:resource_arn ->
    ?apps_list:apps_list_data -> unit -> put_apps_list_response
val make_put_apps_list_request :
  ?tag_list:tag_list ->
    apps_list:apps_list_data -> unit -> put_apps_list_request
val make_account_scope :
  ?exclude_specified_accounts:boolean_ ->
    ?all_accounts_enabled:boolean_ ->
      ?accounts:account_id_list -> unit -> account_scope
val make_organizational_unit_scope :
  ?exclude_specified_organizational_units:boolean_ ->
    ?all_organizational_units_enabled:boolean_ ->
      ?organizational_units:organizational_unit_id_list ->
        unit -> organizational_unit_scope
val make_policy_type_scope :
  ?all_policy_types_enabled:boolean_ ->
    ?policy_types:security_service_type_list -> unit -> policy_type_scope
val make_admin_scope :
  ?policy_type_scope:policy_type_scope ->
    ?region_scope:region_scope ->
      ?organizational_unit_scope:organizational_unit_scope ->
        ?account_scope:account_scope -> unit -> admin_scope
val make_put_admin_account_request :
  ?admin_scope:admin_scope ->
    admin_account:aws_account_id -> unit -> put_admin_account_request
val make_protocols_list_data_summary :
  ?protocols_list:protocols_list ->
    ?list_name:resource_name ->
      ?list_id:list_id ->
        ?list_arn:resource_arn -> unit -> protocols_list_data_summary
val make_policy_summary :
  ?policy_status:customer_policy_status ->
    ?delete_unused_fm_managed_resources:boolean_ ->
      ?remediation_enabled:boolean_ ->
        ?security_service_type:security_service_type ->
          ?resource_type:resource_type ->
            ?policy_name:resource_name ->
              ?policy_id:policy_id ->
                ?policy_arn:resource_arn -> unit -> policy_summary
val make_policy_compliance_status :
  ?issue_info_map:issue_info_map ->
    ?last_updated:time_stamp ->
      ?evaluation_results:evaluation_results ->
        ?member_account:aws_account_id ->
          ?policy_name:resource_name ->
            ?policy_id:policy_id ->
              ?policy_owner:aws_account_id ->
                unit -> policy_compliance_status
val make_compliance_violator :
  ?metadata:compliance_violator_metadata ->
    ?resource_type:resource_type ->
      ?violation_reason:violation_reason ->
        ?resource_id:resource_id -> unit -> compliance_violator
val make_policy_compliance_detail :
  ?issue_info_map:issue_info_map ->
    ?expired_at:time_stamp ->
      ?evaluation_limit_exceeded:boolean_ ->
        ?violators:compliance_violators ->
          ?member_account:aws_account_id ->
            ?policy_id:policy_id ->
              ?policy_owner:aws_account_id ->
                unit -> policy_compliance_detail
val make_list_third_party_firewall_firewall_policies_response :
  ?next_token:pagination_token ->
    ?third_party_firewall_firewall_policies:third_party_firewall_firewall_policies
      -> unit -> list_third_party_firewall_firewall_policies_response
val make_list_third_party_firewall_firewall_policies_request :
  ?next_token:pagination_token ->
    max_results:pagination_max_results ->
      third_party_firewall:third_party_firewall ->
        unit -> list_third_party_firewall_firewall_policies_request
val make_list_tags_for_resource_response :
  ?tag_list:tag_list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_arn:resource_arn -> unit -> list_tags_for_resource_request
val make_list_resource_sets_response :
  ?next_token:pagination_token ->
    ?resource_sets:resource_set_summary_list ->
      unit -> list_resource_sets_response
val make_list_resource_sets_request :
  ?max_results:pagination_max_results ->
    ?next_token:pagination_token -> unit -> list_resource_sets_request
val make_list_resource_set_resources_response :
  ?next_token:pagination_token ->
    items:resource_list -> unit -> list_resource_set_resources_response
val make_list_resource_set_resources_request :
  ?next_token:pagination_token ->
    ?max_results:pagination_max_results ->
      identifier:resource_id -> unit -> list_resource_set_resources_request
val make_list_protocols_lists_response :
  ?next_token:pagination_token ->
    ?protocols_lists:protocols_lists_data ->
      unit -> list_protocols_lists_response
val make_list_protocols_lists_request :
  ?next_token:pagination_token ->
    ?default_lists:boolean_ ->
      max_results:pagination_max_results ->
        unit -> list_protocols_lists_request
val make_list_policies_response :
  ?next_token:pagination_token ->
    ?policy_list:policy_summary_list -> unit -> list_policies_response
val make_list_policies_request :
  ?max_results:pagination_max_results ->
    ?next_token:pagination_token -> unit -> list_policies_request
val make_list_member_accounts_response :
  ?next_token:pagination_token ->
    ?member_accounts:member_accounts -> unit -> list_member_accounts_response
val make_list_member_accounts_request :
  ?max_results:pagination_max_results ->
    ?next_token:pagination_token -> unit -> list_member_accounts_request
val make_discovered_resource :
  ?name:resource_name ->
    ?type_:resource_type ->
      ?account_id:aws_account_id ->
        ?ur_i:identifier -> unit -> discovered_resource
val make_list_discovered_resources_response :
  ?next_token:pagination_token ->
    ?items:discovered_resource_list ->
      unit -> list_discovered_resources_response
val make_list_discovered_resources_request :
  ?next_token:pagination_token ->
    ?max_results:pagination_max_results ->
      resource_type:resource_type ->
        member_account_ids:aws_account_id_list ->
          unit -> list_discovered_resources_request
val make_list_compliance_status_response :
  ?next_token:pagination_token ->
    ?policy_compliance_status_list:policy_compliance_status_list ->
      unit -> list_compliance_status_response
val make_list_compliance_status_request :
  ?max_results:pagination_max_results ->
    ?next_token:pagination_token ->
      policy_id:policy_id -> unit -> list_compliance_status_request
val make_apps_list_data_summary :
  ?apps_list:apps_list ->
    ?list_name:resource_name ->
      ?list_id:list_id ->
        ?list_arn:resource_arn -> unit -> apps_list_data_summary
val make_list_apps_lists_response :
  ?next_token:pagination_token ->
    ?apps_lists:apps_lists_data -> unit -> list_apps_lists_response
val make_list_apps_lists_request :
  ?next_token:pagination_token ->
    ?default_lists:boolean_ ->
      max_results:pagination_max_results -> unit -> list_apps_lists_request
val make_list_admins_managing_account_response :
  ?next_token:pagination_token ->
    ?admin_accounts:account_id_list ->
      unit -> list_admins_managing_account_response
val make_list_admins_managing_account_request :
  ?max_results:pagination_max_results ->
    ?next_token:pagination_token ->
      unit -> list_admins_managing_account_request
val make_admin_account_summary :
  ?status:organization_status ->
    ?default_admin:boolean_ ->
      ?admin_account:aws_account_id -> unit -> admin_account_summary
val make_list_admin_accounts_for_organization_response :
  ?next_token:pagination_token ->
    ?admin_accounts:admin_account_summary_list ->
      unit -> list_admin_accounts_for_organization_response
val make_list_admin_accounts_for_organization_request :
  ?max_results:pagination_max_results ->
    ?next_token:pagination_token ->
      unit -> list_admin_accounts_for_organization_request
val make_get_violation_details_response :
  ?violation_detail:violation_detail ->
    unit -> get_violation_details_response
val make_get_violation_details_request :
  resource_type:resource_type ->
    resource_id:resource_id ->
      member_account:aws_account_id ->
        policy_id:policy_id -> unit -> get_violation_details_request
val make_get_third_party_firewall_association_status_response :
  ?marketplace_onboarding_status:marketplace_subscription_onboarding_status
    ->
    ?third_party_firewall_status:third_party_firewall_association_status ->
      unit -> get_third_party_firewall_association_status_response
val make_get_third_party_firewall_association_status_request :
  third_party_firewall:third_party_firewall ->
    unit -> get_third_party_firewall_association_status_request
val make_get_resource_set_response :
  resource_set_arn:resource_arn ->
    resource_set:resource_set -> unit -> get_resource_set_response
val make_get_resource_set_request :
  identifier:base62_id -> unit -> get_resource_set_request
val make_get_protocols_list_response :
  ?protocols_list_arn:resource_arn ->
    ?protocols_list:protocols_list_data ->
      unit -> get_protocols_list_response
val make_get_protocols_list_request :
  ?default_list:boolean_ ->
    list_id:list_id -> unit -> get_protocols_list_request
val make_get_protection_status_response :
  ?next_token:pagination_token ->
    ?data:protection_data ->
      ?service_type:security_service_type ->
        ?admin_account_id:aws_account_id ->
          unit -> get_protection_status_response
val make_get_protection_status_request :
  ?max_results:pagination_max_results ->
    ?next_token:pagination_token ->
      ?end_time:time_stamp ->
        ?start_time:time_stamp ->
          ?member_account_id:aws_account_id ->
            policy_id:policy_id -> unit -> get_protection_status_request
val make_get_policy_response :
  ?policy_arn:resource_arn -> ?policy:policy -> unit -> get_policy_response
val make_get_policy_request :
  policy_id:policy_id -> unit -> get_policy_request
val make_get_notification_channel_response :
  ?sns_role_name:resource_arn ->
    ?sns_topic_arn:resource_arn -> unit -> get_notification_channel_response
val make_get_notification_channel_request : unit -> unit
val make_get_compliance_detail_response :
  ?policy_compliance_detail:policy_compliance_detail ->
    unit -> get_compliance_detail_response
val make_get_compliance_detail_request :
  member_account:aws_account_id ->
    policy_id:policy_id -> unit -> get_compliance_detail_request
val make_get_apps_list_response :
  ?apps_list_arn:resource_arn ->
    ?apps_list:apps_list_data -> unit -> get_apps_list_response
val make_get_apps_list_request :
  ?default_list:boolean_ -> list_id:list_id -> unit -> get_apps_list_request
val make_get_admin_scope_response :
  ?status:organization_status ->
    ?admin_scope:admin_scope -> unit -> get_admin_scope_response
val make_get_admin_scope_request :
  admin_account:aws_account_id -> unit -> get_admin_scope_request
val make_get_admin_account_response :
  ?role_status:account_role_status ->
    ?admin_account:aws_account_id -> unit -> get_admin_account_response
val make_get_admin_account_request : unit -> unit
val make_failed_item :
  ?reason:failed_item_reason -> ?ur_i:identifier -> unit -> failed_item
val make_disassociate_third_party_firewall_response :
  ?third_party_firewall_status:third_party_firewall_association_status ->
    unit -> disassociate_third_party_firewall_response
val make_disassociate_third_party_firewall_request :
  third_party_firewall:third_party_firewall ->
    unit -> disassociate_third_party_firewall_request
val make_disassociate_admin_account_request : unit -> unit
val make_delete_resource_set_request :
  identifier:base62_id -> unit -> delete_resource_set_request
val make_delete_protocols_list_request :
  list_id:list_id -> unit -> delete_protocols_list_request
val make_delete_policy_request :
  ?delete_all_policy_resources:boolean_ ->
    policy_id:policy_id -> unit -> delete_policy_request
val make_delete_notification_channel_request : unit -> unit
val make_delete_apps_list_request :
  list_id:list_id -> unit -> delete_apps_list_request
val make_batch_disassociate_resource_response :
  failed_items:failed_item_list ->
    resource_set_identifier:identifier ->
      unit -> batch_disassociate_resource_response
val make_batch_disassociate_resource_request :
  items:identifier_list ->
    resource_set_identifier:identifier ->
      unit -> batch_disassociate_resource_request
val make_batch_associate_resource_response :
  failed_items:failed_item_list ->
    resource_set_identifier:identifier ->
      unit -> batch_associate_resource_response
val make_batch_associate_resource_request :
  items:identifier_list ->
    resource_set_identifier:identifier ->
      unit -> batch_associate_resource_request
val make_associate_third_party_firewall_response :
  ?third_party_firewall_status:third_party_firewall_association_status ->
    unit -> associate_third_party_firewall_response
val make_associate_third_party_firewall_request :
  third_party_firewall:third_party_firewall ->
    unit -> associate_third_party_firewall_request
val make_associate_admin_account_request :
  admin_account:aws_account_id -> unit -> associate_admin_account_request
(** {1:operations Operations} *)

module AssociateAdminAccount :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_admin_account_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Sets a Firewall Manager default administrator account. The Firewall Manager default administrator account can manage third-party firewalls and has full administrative scope that allows administration of all policy types, accounts, organizational units, and Regions. This account must be a member account of the organization in Organizations whose resources you want to protect.\n\n For information about working with Firewall Manager administrator accounts, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/fms-administrators.html}Managing Firewall Manager administrators} in the {i Firewall Manager Developer Guide}.\n "]
module AssociateThirdPartyFirewall :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_third_party_firewall_request ->
        (associate_third_party_firewall_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Sets the Firewall Manager policy administrator as a tenant administrator of a third-party firewall service. A tenant is an instance of the third-party firewall service that's associated with your Amazon Web Services customer account.\n"]
module BatchAssociateResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_associate_resource_request ->
        (batch_associate_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Associate resources to a Firewall Manager resource set.\n"]
module BatchDisassociateResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_disassociate_resource_request ->
        (batch_disassociate_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Disassociates resources from a Firewall Manager resource set.\n"]
module DeleteAppsList :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_apps_list_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Permanently deletes an Firewall Manager applications list.\n"]
module DeleteNotificationChannel :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_notification_channel_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Deletes an Firewall Manager association with the IAM role and the Amazon Simple Notification Service (SNS) topic that is used to record Firewall Manager SNS logs.\n"]
module DeletePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_policy_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Permanently deletes an Firewall Manager policy. \n"]
module DeleteProtocolsList :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_protocols_list_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Permanently deletes an Firewall Manager protocols list.\n"]
module DeleteResourceSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_set_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Deletes the specified [ResourceSet].\n"]
module DisassociateAdminAccount :
sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_admin_account_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Disassociates an Firewall Manager administrator account. To set a different account as an Firewall Manager administrator, submit a [PutAdminAccount] request. To set an account as a default administrator account, you must submit an [AssociateAdminAccount] request.\n\n Disassociation of the default administrator account follows the first in, last out principle. If you are the default administrator, all Firewall Manager administrators within the organization must first disassociate their accounts before you can disassociate your account.\n "]
module DisassociateThirdPartyFirewall :
sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_third_party_firewall_request ->
        (disassociate_third_party_firewall_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Disassociates a Firewall Manager policy administrator from a third-party firewall tenant. When you call [DisassociateThirdPartyFirewall], the third-party firewall vendor deletes all of the firewalls that are associated with the account.\n"]
module GetAdminAccount :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_admin_account_request ->
        (get_admin_account_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns the Organizations account that is associated with Firewall Manager as the Firewall Manager default administrator.\n"]
module GetAdminScope :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_admin_scope_request ->
        (get_admin_scope_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns information about the specified account's administrative scope. The administrative scope defines the resources that an Firewall Manager administrator can manage.\n"]
module GetAppsList :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_apps_list_request ->
        (get_apps_list_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns information about the specified Firewall Manager applications list.\n"]
module GetComplianceDetail :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_compliance_detail_request ->
        (get_compliance_detail_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns detailed compliance information about the specified member account. Details include resources that are in and out of compliance with the specified policy. \n\n The reasons for resources being considered compliant depend on the Firewall Manager policy type. \n "]
module GetNotificationChannel :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_notification_channel_request ->
        (get_notification_channel_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Information about the Amazon Simple Notification Service (SNS) topic that is used to record Firewall Manager SNS logs.\n"]
module GetPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_policy_request ->
        (get_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `InvalidTypeException of invalid_type_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns information about the specified Firewall Manager policy.\n"]
module GetProtectionStatus :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_protection_status_request ->
        (get_protection_status_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "If you created a Shield Advanced policy, returns policy-level attack summary information in the event of a potential DDoS attack. Other policy types are currently unsupported.\n"]
module GetProtocolsList :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_protocols_list_request ->
        (get_protocols_list_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns information about the specified Firewall Manager protocols list.\n"]
module GetResourceSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_set_request ->
        (get_resource_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Gets information about a specific resource set.\n"]
module GetThirdPartyFirewallAssociationStatus :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_third_party_firewall_association_status_request ->
        (get_third_party_firewall_association_status_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "The onboarding status of a Firewall Manager admin account to third-party firewall vendor tenant.\n"]
module GetViolationDetails :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_violation_details_request ->
        (get_violation_details_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Retrieves violations for a resource based on the specified Firewall Manager policy and Amazon Web Services account.\n"]
module ListAdminAccountsForOrganization :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_admin_accounts_for_organization_request ->
        (list_admin_accounts_for_organization_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns a [AdminAccounts] object that lists the Firewall Manager administrators within the organization that are onboarded to Firewall Manager by [AssociateAdminAccount].\n\n This operation can be called only from the organization's management account.\n "]
module ListAdminsManagingAccount :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_admins_managing_account_request ->
        (list_admins_managing_account_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Lists the accounts that are managing the specified Organizations member account. This is useful for any member account so that they can view the accounts who are managing their account. This operation only returns the managing administrators that have the requested account within their [AdminScope].\n"]
module ListAppsLists :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_apps_lists_request ->
        (list_apps_lists_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Returns an array of [AppsListDataSummary] objects.\n"]
module ListComplianceStatus :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_compliance_status_request ->
        (list_compliance_status_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns an array of [PolicyComplianceStatus] objects. Use [PolicyComplianceStatus] to get a summary of which member accounts are protected by the specified policy. \n"]
module ListDiscoveredResources :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_discovered_resources_request ->
        (list_discovered_resources_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception ])
          result
end[@@ocaml.doc
     "Returns an array of resources in the organization's accounts that are available to be associated with a resource set.\n"]
module ListMemberAccounts :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_member_accounts_request ->
        (list_member_accounts_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns a [MemberAccounts] object that lists the member accounts in the administrator's Amazon Web Services organization.\n\n Either an Firewall Manager administrator or the organization's management account can make this request.\n "]
module ListPolicies :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_policies_request ->
        (list_policies_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Returns an array of [PolicySummary] objects.\n"]
module ListProtocolsLists :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_protocols_lists_request ->
        (list_protocols_lists_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Returns an array of [ProtocolsListDataSummary] objects.\n"]
module ListResourceSetResources :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_set_resources_request ->
        (list_resource_set_resources_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns an array of resources that are currently associated to a resource set.\n"]
module ListResourceSets :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_sets_request ->
        (list_resource_sets_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception ])
          result
end[@@ocaml.doc "Returns an array of [ResourceSetSummary] objects.\n"]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Retrieves the list of tags for the specified Amazon Web Services resource. \n"]
module ListThirdPartyFirewallFirewallPolicies :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_third_party_firewall_firewall_policies_request ->
        (list_third_party_firewall_firewall_policies_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Retrieves a list of all of the third-party firewall policies that are associated with the third-party firewall administrator's account.\n"]
module PutAdminAccount :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_admin_account_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Creates or updates an Firewall Manager administrator account. The account must be a member of the organization that was onboarded to Firewall Manager by [AssociateAdminAccount]. Only the organization's management account can create an Firewall Manager administrator account. When you create an Firewall Manager administrator account, the service checks to see if the account is already a delegated administrator within Organizations. If the account isn't a delegated administrator, Firewall Manager calls Organizations to delegate the account within Organizations. For more information about administrator accounts within Organizations, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts.html}Managing the Amazon Web Services Accounts in Your Organization}.\n"]
module PutAppsList :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_apps_list_request ->
        (put_apps_list_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Creates an Firewall Manager applications list.\n"]
module PutNotificationChannel :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_notification_channel_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Designates the IAM role and Amazon Simple Notification Service (SNS) topic that Firewall Manager uses to record SNS logs.\n\n To perform this action outside of the console, you must first configure the SNS topic's access policy to allow the [SnsRoleName] to publish SNS logs. If the [SnsRoleName] provided is a role other than the [AWSServiceRoleForFMS] service-linked role, this role must have a trust relationship configured to allow the Firewall Manager service principal [fms.amazonaws.com] to assume this role. For information about configuring an SNS access policy, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/fms-security_iam_service-with-iam.html#fms-security_iam_service-with-iam-roles-service}Service roles for Firewall Manager} in the {i Firewall Manager Developer Guide}.\n "]
module PutPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_policy_request ->
        (put_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `InvalidTypeException of invalid_type_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Creates an Firewall Manager policy.\n\n A Firewall Manager policy is specific to the individual policy type. If you want to enforce multiple policy types across accounts, you can create multiple policies. You can create more than one policy for each type. \n \n  If you add a new account to an organization that you created with Organizations, Firewall Manager automatically applies the policy to the resources in that account that are within scope of the policy. \n  \n   Firewall Manager provides the following types of policies: \n   \n    {ul\n          {-   {b WAF policy} - This policy applies WAF web ACL protections to specified accounts and resources. \n              \n               }\n          {-   {b Shield Advanced policy} - This policy applies Shield Advanced protection to specified accounts and resources. \n              \n               }\n          {-   {b Security Groups policy} - This type of policy gives you control over security groups that are in use throughout your organization in Organizations and lets you enforce a baseline set of rules across your organization. \n              \n               }\n          {-   {b Network ACL policy} - This type of policy gives you control over the network ACLs that are in use throughout your organization in Organizations and lets you enforce a baseline set of first and last network ACL rules across your organization. \n              \n               }\n          {-   {b Network Firewall policy} - This policy applies Network Firewall protection to your organization's VPCs. \n              \n               }\n          {-   {b DNS Firewall policy} - This policy applies Amazon Route 53 Resolver DNS Firewall protections to your organization's VPCs. \n              \n               }\n          {-   {b Third-party firewall policy} - This policy applies third-party firewall protections. Third-party firewalls are available by subscription through the Amazon Web Services Marketplace console at {{:http://aws.amazon.com/marketplace}Amazon Web Services Marketplace}.\n              \n               {ul\n                     {-   {b Palo Alto Networks Cloud NGFW policy} - This policy applies Palo Alto Networks Cloud Next Generation Firewall (NGFW) protections and Palo Alto Networks Cloud NGFW rulestacks to your organization's VPCs.\n                         \n                          }\n                     {-   {b Fortigate CNF policy} - This policy applies Fortigate Cloud Native Firewall (CNF) protections. Fortigate CNF is a cloud-centered solution that blocks Zero-Day threats and secures cloud infrastructures with industry-leading advanced threat prevention, smart web application firewalls (WAF), and API protection.\n                         \n                          }\n                     \n           }\n            }\n          }\n  "]
module PutProtocolsList :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_protocols_list_request ->
        (put_protocols_list_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Creates an Firewall Manager protocols list.\n"]
module PutResourceSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_set_request ->
        (put_resource_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Creates the resource set.\n\n An Firewall Manager resource set defines the resources to import into an Firewall Manager policy from another Amazon Web Services service.\n "]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Adds one or more tags to an Amazon Web Services resource.\n"]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidInputException of invalid_input_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Removes one or more tags from an Amazon Web Services resource.\n"](** {1:Serialization and Deserialization} *)

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
