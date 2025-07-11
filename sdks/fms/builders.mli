open Smaws_Lib
open Types
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
val make_untag_resource_response : unit -> unit
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
val make_tag_resource_response : unit -> unit
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
val make_get_notification_channel_request : unit -> unit
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
val make_get_admin_account_request : unit -> unit
val make_failed_item :
  ?reason:failed_item_reason -> ?ur_i:string -> unit -> failed_item
val make_disassociate_third_party_firewall_response :
  ?third_party_firewall_status:third_party_firewall_association_status ->
    unit -> disassociate_third_party_firewall_response
val make_disassociate_third_party_firewall_request :
  third_party_firewall:third_party_firewall ->
    unit -> disassociate_third_party_firewall_request
val make_disassociate_admin_account_request : unit -> unit
val make_delete_resource_set_request :
  identifier:string -> unit -> delete_resource_set_request
val make_delete_protocols_list_request :
  list_id:string -> unit -> delete_protocols_list_request
val make_delete_policy_request :
  ?delete_all_policy_resources:bool ->
    policy_id:string -> unit -> delete_policy_request
val make_delete_notification_channel_request : unit -> unit
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
  admin_account:string -> unit -> associate_admin_account_request