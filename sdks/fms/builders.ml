open Types

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : resource_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_arn:(resource_arn_ : resource_arn)
    ~tag_list:(tag_list_ : tag_list) () =
  ({ resource_arn = resource_arn_; tag_list = tag_list_ } : tag_resource_request)

let make_resource_set ?id:(id_ : base62_id option) ?description:(description_ : description option)
    ?update_token:(update_token_ : update_token option)
    ?last_update_time:(last_update_time_ : time_stamp option)
    ?resource_set_status:(resource_set_status_ : resource_set_status option) ~name:(name_ : name)
    ~resource_type_list:(resource_type_list_ : resource_type_list) () =
  ({
     id = id_;
     name = name_;
     description = description_;
     update_token = update_token_;
     resource_type_list = resource_type_list_;
     last_update_time = last_update_time_;
     resource_set_status = resource_set_status_;
   }
    : resource_set)

let make_put_resource_set_response ~resource_set:(resource_set_ : resource_set)
    ~resource_set_arn:(resource_set_arn_ : resource_arn) () =
  ({ resource_set = resource_set_; resource_set_arn = resource_set_arn_ }
    : put_resource_set_response)

let make_put_resource_set_request ?tag_list:(tag_list_ : tag_list option)
    ~resource_set:(resource_set_ : resource_set) () =
  ({ resource_set = resource_set_; tag_list = tag_list_ } : put_resource_set_request)

let make_protocols_list_data ?list_id:(list_id_ : list_id option)
    ?list_update_token:(list_update_token_ : update_token option)
    ?create_time:(create_time_ : time_stamp option)
    ?last_update_time:(last_update_time_ : time_stamp option)
    ?previous_protocols_list:(previous_protocols_list_ : previous_protocols_list option)
    ~list_name:(list_name_ : resource_name) ~protocols_list:(protocols_list_ : protocols_list) () =
  ({
     list_id = list_id_;
     list_name = list_name_;
     list_update_token = list_update_token_;
     create_time = create_time_;
     last_update_time = last_update_time_;
     protocols_list = protocols_list_;
     previous_protocols_list = previous_protocols_list_;
   }
    : protocols_list_data)

let make_put_protocols_list_response ?protocols_list:(protocols_list_ : protocols_list_data option)
    ?protocols_list_arn:(protocols_list_arn_ : resource_arn option) () =
  ({ protocols_list = protocols_list_; protocols_list_arn = protocols_list_arn_ }
    : put_protocols_list_response)

let make_put_protocols_list_request ?tag_list:(tag_list_ : tag_list option)
    ~protocols_list:(protocols_list_ : protocols_list_data) () =
  ({ protocols_list = protocols_list_; tag_list = tag_list_ } : put_protocols_list_request)

let make_resource_tag ?value:(value_ : resource_tag_value option) ~key:(key_ : resource_tag_key) ()
    =
  ({ key = key_; value = value_ } : resource_tag)

let make_network_acl_port_range ?from_:(from__ : ip_port_number_integer option)
    ?to_:(to__ : ip_port_number_integer option) () =
  ({ from_ = from__; to_ = to__ } : network_acl_port_range)

let make_network_acl_icmp_type_code ?code:(code_ : integer_object option)
    ?type_:(type__ : integer_object option) () =
  ({ code = code_; type_ = type__ } : network_acl_icmp_type_code)

let make_network_acl_entry ?icmp_type_code:(icmp_type_code_ : network_acl_icmp_type_code option)
    ?port_range:(port_range_ : network_acl_port_range option)
    ?cidr_block:(cidr_block_ : length_bounded_non_empty_string option)
    ?ipv6_cidr_block:(ipv6_cidr_block_ : length_bounded_non_empty_string option)
    ~protocol:(protocol_ : length_bounded_string)
    ~rule_action:(rule_action_ : network_acl_rule_action) ~egress:(egress_ : boolean_object) () =
  ({
     icmp_type_code = icmp_type_code_;
     protocol = protocol_;
     port_range = port_range_;
     cidr_block = cidr_block_;
     ipv6_cidr_block = ipv6_cidr_block_;
     rule_action = rule_action_;
     egress = egress_;
   }
    : network_acl_entry)

let make_network_acl_entry_set ?first_entries:(first_entries_ : network_acl_entries option)
    ?last_entries:(last_entries_ : network_acl_entries option)
    ~force_remediate_for_first_entries:(force_remediate_for_first_entries_ : boolean_object)
    ~force_remediate_for_last_entries:(force_remediate_for_last_entries_ : boolean_object) () =
  ({
     first_entries = first_entries_;
     force_remediate_for_first_entries = force_remediate_for_first_entries_;
     last_entries = last_entries_;
     force_remediate_for_last_entries = force_remediate_for_last_entries_;
   }
    : network_acl_entry_set)

let make_network_acl_common_policy
    ~network_acl_entry_set:(network_acl_entry_set_ : network_acl_entry_set) () =
  ({ network_acl_entry_set = network_acl_entry_set_ } : network_acl_common_policy)

let make_third_party_firewall_policy
    ?firewall_deployment_model:(firewall_deployment_model_ : firewall_deployment_model option) () =
  ({ firewall_deployment_model = firewall_deployment_model_ } : third_party_firewall_policy)

let make_network_firewall_policy
    ?firewall_deployment_model:(firewall_deployment_model_ : firewall_deployment_model option) () =
  ({ firewall_deployment_model = firewall_deployment_model_ } : network_firewall_policy)

let make_policy_option
    ?network_firewall_policy:(network_firewall_policy_ : network_firewall_policy option)
    ?third_party_firewall_policy:(third_party_firewall_policy_ : third_party_firewall_policy option)
    ?network_acl_common_policy:(network_acl_common_policy_ : network_acl_common_policy option) () =
  ({
     network_firewall_policy = network_firewall_policy_;
     third_party_firewall_policy = third_party_firewall_policy_;
     network_acl_common_policy = network_acl_common_policy_;
   }
    : policy_option)

let make_security_service_policy_data
    ?managed_service_data:(managed_service_data_ : managed_service_data option)
    ?policy_option:(policy_option_ : policy_option option) ~type_:(type__ : security_service_type)
    () =
  ({ type_ = type__; managed_service_data = managed_service_data_; policy_option = policy_option_ }
    : security_service_policy_data)

let make_policy ?policy_id:(policy_id_ : policy_id option)
    ?policy_update_token:(policy_update_token_ : policy_update_token option)
    ?resource_type_list:(resource_type_list_ : resource_type_list option)
    ?resource_tags:(resource_tags_ : resource_tags option)
    ?delete_unused_fm_managed_resources:(delete_unused_fm_managed_resources_ : boolean_ option)
    ?include_map:(include_map_ : customer_policy_scope_map option)
    ?exclude_map:(exclude_map_ : customer_policy_scope_map option)
    ?resource_set_ids:(resource_set_ids_ : resource_set_ids option)
    ?policy_description:(policy_description_ : resource_description option)
    ?policy_status:(policy_status_ : customer_policy_status option)
    ?resource_tag_logical_operator:
      (resource_tag_logical_operator_ : resource_tag_logical_operator option)
    ~policy_name:(policy_name_ : resource_name)
    ~security_service_policy_data:(security_service_policy_data_ : security_service_policy_data)
    ~resource_type:(resource_type_ : resource_type)
    ~exclude_resource_tags:(exclude_resource_tags_ : boolean_)
    ~remediation_enabled:(remediation_enabled_ : boolean_) () =
  ({
     policy_id = policy_id_;
     policy_name = policy_name_;
     policy_update_token = policy_update_token_;
     security_service_policy_data = security_service_policy_data_;
     resource_type = resource_type_;
     resource_type_list = resource_type_list_;
     resource_tags = resource_tags_;
     exclude_resource_tags = exclude_resource_tags_;
     remediation_enabled = remediation_enabled_;
     delete_unused_fm_managed_resources = delete_unused_fm_managed_resources_;
     include_map = include_map_;
     exclude_map = exclude_map_;
     resource_set_ids = resource_set_ids_;
     policy_description = policy_description_;
     policy_status = policy_status_;
     resource_tag_logical_operator = resource_tag_logical_operator_;
   }
    : policy)

let make_put_policy_response ?policy:(policy_ : policy option)
    ?policy_arn:(policy_arn_ : resource_arn option) () =
  ({ policy = policy_; policy_arn = policy_arn_ } : put_policy_response)

let make_put_policy_request ?tag_list:(tag_list_ : tag_list option) ~policy:(policy_ : policy) () =
  ({ policy = policy_; tag_list = tag_list_ } : put_policy_request)

let make_put_notification_channel_request ~sns_topic_arn:(sns_topic_arn_ : resource_arn)
    ~sns_role_name:(sns_role_name_ : resource_arn) () =
  ({ sns_topic_arn = sns_topic_arn_; sns_role_name = sns_role_name_ }
    : put_notification_channel_request)

let make_app ~app_name:(app_name_ : resource_name) ~protocol:(protocol_ : protocol)
    ~port:(port_ : ip_port_number) () =
  ({ app_name = app_name_; protocol = protocol_; port = port_ } : app)

let make_apps_list_data ?list_id:(list_id_ : list_id option)
    ?list_update_token:(list_update_token_ : update_token option)
    ?create_time:(create_time_ : time_stamp option)
    ?last_update_time:(last_update_time_ : time_stamp option)
    ?previous_apps_list:(previous_apps_list_ : previous_apps_list option)
    ~list_name:(list_name_ : resource_name) ~apps_list:(apps_list_ : apps_list) () =
  ({
     list_id = list_id_;
     list_name = list_name_;
     list_update_token = list_update_token_;
     create_time = create_time_;
     last_update_time = last_update_time_;
     apps_list = apps_list_;
     previous_apps_list = previous_apps_list_;
   }
    : apps_list_data)

let make_put_apps_list_response ?apps_list:(apps_list_ : apps_list_data option)
    ?apps_list_arn:(apps_list_arn_ : resource_arn option) () =
  ({ apps_list = apps_list_; apps_list_arn = apps_list_arn_ } : put_apps_list_response)

let make_put_apps_list_request ?tag_list:(tag_list_ : tag_list option)
    ~apps_list:(apps_list_ : apps_list_data) () =
  ({ apps_list = apps_list_; tag_list = tag_list_ } : put_apps_list_request)

let make_policy_type_scope ?policy_types:(policy_types_ : security_service_type_list option)
    ?all_policy_types_enabled:(all_policy_types_enabled_ : boolean_ option) () =
  ({ policy_types = policy_types_; all_policy_types_enabled = all_policy_types_enabled_ }
    : policy_type_scope)

let make_region_scope ?regions:(regions_ : aws_region_list option)
    ?all_regions_enabled:(all_regions_enabled_ : boolean_ option) () =
  ({ regions = regions_; all_regions_enabled = all_regions_enabled_ } : region_scope)

let make_organizational_unit_scope
    ?organizational_units:(organizational_units_ : organizational_unit_id_list option)
    ?all_organizational_units_enabled:(all_organizational_units_enabled_ : boolean_ option)
    ?exclude_specified_organizational_units:
      (exclude_specified_organizational_units_ : boolean_ option) () =
  ({
     organizational_units = organizational_units_;
     all_organizational_units_enabled = all_organizational_units_enabled_;
     exclude_specified_organizational_units = exclude_specified_organizational_units_;
   }
    : organizational_unit_scope)

let make_account_scope ?accounts:(accounts_ : account_id_list option)
    ?all_accounts_enabled:(all_accounts_enabled_ : boolean_ option)
    ?exclude_specified_accounts:(exclude_specified_accounts_ : boolean_ option) () =
  ({
     accounts = accounts_;
     all_accounts_enabled = all_accounts_enabled_;
     exclude_specified_accounts = exclude_specified_accounts_;
   }
    : account_scope)

let make_admin_scope ?account_scope:(account_scope_ : account_scope option)
    ?organizational_unit_scope:(organizational_unit_scope_ : organizational_unit_scope option)
    ?region_scope:(region_scope_ : region_scope option)
    ?policy_type_scope:(policy_type_scope_ : policy_type_scope option) () =
  ({
     account_scope = account_scope_;
     organizational_unit_scope = organizational_unit_scope_;
     region_scope = region_scope_;
     policy_type_scope = policy_type_scope_;
   }
    : admin_scope)

let make_put_admin_account_request ?admin_scope:(admin_scope_ : admin_scope option)
    ~admin_account:(admin_account_ : aws_account_id) () =
  ({ admin_account = admin_account_; admin_scope = admin_scope_ } : put_admin_account_request)

let make_third_party_firewall_firewall_policy
    ?firewall_policy_id:(firewall_policy_id_ : firewall_policy_id option)
    ?firewall_policy_name:(firewall_policy_name_ : firewall_policy_name option) () =
  ({ firewall_policy_id = firewall_policy_id_; firewall_policy_name = firewall_policy_name_ }
    : third_party_firewall_firewall_policy)

let make_list_third_party_firewall_firewall_policies_response
    ?third_party_firewall_firewall_policies:
      (third_party_firewall_firewall_policies_ : third_party_firewall_firewall_policies option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({
     third_party_firewall_firewall_policies = third_party_firewall_firewall_policies_;
     next_token = next_token_;
   }
    : list_third_party_firewall_firewall_policies_response)

let make_list_third_party_firewall_firewall_policies_request
    ?next_token:(next_token_ : pagination_token option)
    ~third_party_firewall:(third_party_firewall_ : third_party_firewall)
    ~max_results:(max_results_ : pagination_max_results) () =
  ({
     third_party_firewall = third_party_firewall_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_third_party_firewall_firewall_policies_request)

let make_list_tags_for_resource_response ?tag_list:(tag_list_ : tag_list option) () =
  ({ tag_list = tag_list_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_resource_set_summary ?id:(id_ : base62_id option) ?name:(name_ : name option)
    ?description:(description_ : description option)
    ?last_update_time:(last_update_time_ : time_stamp option)
    ?resource_set_status:(resource_set_status_ : resource_set_status option) () =
  ({
     id = id_;
     name = name_;
     description = description_;
     last_update_time = last_update_time_;
     resource_set_status = resource_set_status_;
   }
    : resource_set_summary)

let make_list_resource_sets_response
    ?resource_sets:(resource_sets_ : resource_set_summary_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ resource_sets = resource_sets_; next_token = next_token_ } : list_resource_sets_response)

let make_list_resource_sets_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : pagination_max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_resource_sets_request)

let make_resource ?account_id:(account_id_ : aws_account_id option) ~ur_i:(ur_i_ : identifier) () =
  ({ ur_i = ur_i_; account_id = account_id_ } : resource)

let make_list_resource_set_resources_response ?next_token:(next_token_ : pagination_token option)
    ~items:(items_ : resource_list) () =
  ({ items = items_; next_token = next_token_ } : list_resource_set_resources_response)

let make_list_resource_set_resources_request
    ?max_results:(max_results_ : pagination_max_results option)
    ?next_token:(next_token_ : pagination_token option) ~identifier:(identifier_ : resource_id) () =
  ({ identifier = identifier_; max_results = max_results_; next_token = next_token_ }
    : list_resource_set_resources_request)

let make_protocols_list_data_summary ?list_arn:(list_arn_ : resource_arn option)
    ?list_id:(list_id_ : list_id option) ?list_name:(list_name_ : resource_name option)
    ?protocols_list:(protocols_list_ : protocols_list option) () =
  ({
     list_arn = list_arn_;
     list_id = list_id_;
     list_name = list_name_;
     protocols_list = protocols_list_;
   }
    : protocols_list_data_summary)

let make_list_protocols_lists_response
    ?protocols_lists:(protocols_lists_ : protocols_lists_data option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ protocols_lists = protocols_lists_; next_token = next_token_ } : list_protocols_lists_response)

let make_list_protocols_lists_request ?default_lists:(default_lists_ : boolean_ option)
    ?next_token:(next_token_ : pagination_token option)
    ~max_results:(max_results_ : pagination_max_results) () =
  ({ default_lists = default_lists_; next_token = next_token_; max_results = max_results_ }
    : list_protocols_lists_request)

let make_policy_summary ?policy_arn:(policy_arn_ : resource_arn option)
    ?policy_id:(policy_id_ : policy_id option) ?policy_name:(policy_name_ : resource_name option)
    ?resource_type:(resource_type_ : resource_type option)
    ?security_service_type:(security_service_type_ : security_service_type option)
    ?remediation_enabled:(remediation_enabled_ : boolean_ option)
    ?delete_unused_fm_managed_resources:(delete_unused_fm_managed_resources_ : boolean_ option)
    ?policy_status:(policy_status_ : customer_policy_status option) () =
  ({
     policy_arn = policy_arn_;
     policy_id = policy_id_;
     policy_name = policy_name_;
     resource_type = resource_type_;
     security_service_type = security_service_type_;
     remediation_enabled = remediation_enabled_;
     delete_unused_fm_managed_resources = delete_unused_fm_managed_resources_;
     policy_status = policy_status_;
   }
    : policy_summary)

let make_list_policies_response ?policy_list:(policy_list_ : policy_summary_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ policy_list = policy_list_; next_token = next_token_ } : list_policies_response)

let make_list_policies_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : pagination_max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_policies_request)

let make_list_member_accounts_response ?member_accounts:(member_accounts_ : member_accounts option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ member_accounts = member_accounts_; next_token = next_token_ } : list_member_accounts_response)

let make_list_member_accounts_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : pagination_max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_member_accounts_request)

let make_discovered_resource ?ur_i:(ur_i_ : identifier option)
    ?account_id:(account_id_ : aws_account_id option) ?type_:(type__ : resource_type option)
    ?name:(name_ : resource_name option) () =
  ({ ur_i = ur_i_; account_id = account_id_; type_ = type__; name = name_ } : discovered_resource)

let make_list_discovered_resources_response ?items:(items_ : discovered_resource_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ items = items_; next_token = next_token_ } : list_discovered_resources_response)

let make_list_discovered_resources_request
    ?max_results:(max_results_ : pagination_max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ~member_account_ids:(member_account_ids_ : aws_account_id_list)
    ~resource_type:(resource_type_ : resource_type) () =
  ({
     member_account_ids = member_account_ids_;
     resource_type = resource_type_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_discovered_resources_request)

let make_policy_compliance_status ?policy_owner:(policy_owner_ : aws_account_id option)
    ?policy_id:(policy_id_ : policy_id option) ?policy_name:(policy_name_ : resource_name option)
    ?member_account:(member_account_ : aws_account_id option)
    ?evaluation_results:(evaluation_results_ : evaluation_results option)
    ?last_updated:(last_updated_ : time_stamp option)
    ?issue_info_map:(issue_info_map_ : issue_info_map option) () =
  ({
     policy_owner = policy_owner_;
     policy_id = policy_id_;
     policy_name = policy_name_;
     member_account = member_account_;
     evaluation_results = evaluation_results_;
     last_updated = last_updated_;
     issue_info_map = issue_info_map_;
   }
    : policy_compliance_status)

let make_list_compliance_status_response
    ?policy_compliance_status_list:
      (policy_compliance_status_list_ : policy_compliance_status_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ policy_compliance_status_list = policy_compliance_status_list_; next_token = next_token_ }
    : list_compliance_status_response)

let make_list_compliance_status_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : pagination_max_results option) ~policy_id:(policy_id_ : policy_id)
    () =
  ({ policy_id = policy_id_; next_token = next_token_; max_results = max_results_ }
    : list_compliance_status_request)

let make_apps_list_data_summary ?list_arn:(list_arn_ : resource_arn option)
    ?list_id:(list_id_ : list_id option) ?list_name:(list_name_ : resource_name option)
    ?apps_list:(apps_list_ : apps_list option) () =
  ({ list_arn = list_arn_; list_id = list_id_; list_name = list_name_; apps_list = apps_list_ }
    : apps_list_data_summary)

let make_list_apps_lists_response ?apps_lists:(apps_lists_ : apps_lists_data option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ apps_lists = apps_lists_; next_token = next_token_ } : list_apps_lists_response)

let make_list_apps_lists_request ?default_lists:(default_lists_ : boolean_ option)
    ?next_token:(next_token_ : pagination_token option)
    ~max_results:(max_results_ : pagination_max_results) () =
  ({ default_lists = default_lists_; next_token = next_token_; max_results = max_results_ }
    : list_apps_lists_request)

let make_list_admins_managing_account_response
    ?admin_accounts:(admin_accounts_ : account_id_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ admin_accounts = admin_accounts_; next_token = next_token_ }
    : list_admins_managing_account_response)

let make_list_admins_managing_account_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : pagination_max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_admins_managing_account_request)

let make_admin_account_summary ?admin_account:(admin_account_ : aws_account_id option)
    ?default_admin:(default_admin_ : boolean_ option) ?status:(status_ : organization_status option)
    () =
  ({ admin_account = admin_account_; default_admin = default_admin_; status = status_ }
    : admin_account_summary)

let make_list_admin_accounts_for_organization_response
    ?admin_accounts:(admin_accounts_ : admin_account_summary_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ admin_accounts = admin_accounts_; next_token = next_token_ }
    : list_admin_accounts_for_organization_response)

let make_list_admin_accounts_for_organization_request
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : pagination_max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ }
    : list_admin_accounts_for_organization_request)

let make_web_acl_has_out_of_scope_resources_violation
    ?web_acl_arn:(web_acl_arn_ : resource_arn option)
    ?out_of_scope_resource_list:(out_of_scope_resource_list_ : resource_arn_list option) () =
  ({ web_acl_arn = web_acl_arn_; out_of_scope_resource_list = out_of_scope_resource_list_ }
    : web_acl_has_out_of_scope_resources_violation)

let make_web_acl_has_incompatible_configuration_violation
    ?web_acl_arn:(web_acl_arn_ : resource_arn option)
    ?description:(description_ : length_bounded_string option) () =
  ({ web_acl_arn = web_acl_arn_; description = description_ }
    : web_acl_has_incompatible_configuration_violation)

let make_entry_description ?entry_detail:(entry_detail_ : network_acl_entry option)
    ?entry_rule_number:(entry_rule_number_ : integer_object_minimum0 option)
    ?entry_type:(entry_type_ : entry_type option) () =
  ({
     entry_detail = entry_detail_;
     entry_rule_number = entry_rule_number_;
     entry_type = entry_type_;
   }
    : entry_description)

let make_action_target ?resource_id:(resource_id_ : resource_id option)
    ?description:(description_ : length_bounded_string option) () =
  ({ resource_id = resource_id_; description = description_ } : action_target)

let make_delete_network_acl_entries_action
    ?description:(description_ : length_bounded_string option)
    ?network_acl_id:(network_acl_id_ : action_target option)
    ?network_acl_entries_to_be_deleted:
      (network_acl_entries_to_be_deleted_ : entries_description option)
    ?fms_can_remediate:(fms_can_remediate_ : boolean_ option) () =
  ({
     description = description_;
     network_acl_id = network_acl_id_;
     network_acl_entries_to_be_deleted = network_acl_entries_to_be_deleted_;
     fms_can_remediate = fms_can_remediate_;
   }
    : delete_network_acl_entries_action)

let make_create_network_acl_entries_action
    ?description:(description_ : length_bounded_string option)
    ?network_acl_id:(network_acl_id_ : action_target option)
    ?network_acl_entries_to_be_created:
      (network_acl_entries_to_be_created_ : entries_description option)
    ?fms_can_remediate:(fms_can_remediate_ : boolean_ option) () =
  ({
     description = description_;
     network_acl_id = network_acl_id_;
     network_acl_entries_to_be_created = network_acl_entries_to_be_created_;
     fms_can_remediate = fms_can_remediate_;
   }
    : create_network_acl_entries_action)

let make_replace_network_acl_association_action
    ?description:(description_ : length_bounded_string option)
    ?association_id:(association_id_ : action_target option)
    ?network_acl_id:(network_acl_id_ : action_target option)
    ?fms_can_remediate:(fms_can_remediate_ : boolean_ option) () =
  ({
     description = description_;
     association_id = association_id_;
     network_acl_id = network_acl_id_;
     fms_can_remediate = fms_can_remediate_;
   }
    : replace_network_acl_association_action)

let make_create_network_acl_action ?description:(description_ : length_bounded_string option)
    ?vpc:(vpc_ : action_target option) ?fms_can_remediate:(fms_can_remediate_ : boolean_ option) ()
    =
  ({ description = description_; vpc = vpc_; fms_can_remediate = fms_can_remediate_ }
    : create_network_acl_action)

let make_fms_policy_update_firewall_creation_config_action
    ?description:(description_ : length_bounded_string option)
    ?firewall_creation_config:(firewall_creation_config_ : managed_service_data option) () =
  ({ description = description_; firewall_creation_config = firewall_creation_config_ }
    : fms_policy_update_firewall_creation_config_action)

let make_ec2_create_route_table_action ?description:(description_ : length_bounded_string option)
    ~vpc_id:(vpc_id_ : action_target) () =
  ({ description = description_; vpc_id = vpc_id_ } : ec2_create_route_table_action)

let make_ec2_associate_route_table_action ?description:(description_ : length_bounded_string option)
    ?subnet_id:(subnet_id_ : action_target option) ?gateway_id:(gateway_id_ : action_target option)
    ~route_table_id:(route_table_id_ : action_target) () =
  ({
     description = description_;
     route_table_id = route_table_id_;
     subnet_id = subnet_id_;
     gateway_id = gateway_id_;
   }
    : ec2_associate_route_table_action)

let make_ec2_replace_route_table_association_action
    ?description:(description_ : length_bounded_string option)
    ~association_id:(association_id_ : action_target)
    ~route_table_id:(route_table_id_ : action_target) () =
  ({
     description = description_;
     association_id = association_id_;
     route_table_id = route_table_id_;
   }
    : ec2_replace_route_table_association_action)

let make_ec2_copy_route_table_action ?description:(description_ : length_bounded_string option)
    ~vpc_id:(vpc_id_ : action_target) ~route_table_id:(route_table_id_ : action_target) () =
  ({ description = description_; vpc_id = vpc_id_; route_table_id = route_table_id_ }
    : ec2_copy_route_table_action)

let make_ec2_delete_route_action ?description:(description_ : length_bounded_string option)
    ?destination_cidr_block:(destination_cidr_block_ : cid_r option)
    ?destination_prefix_list_id:(destination_prefix_list_id_ : resource_id option)
    ?destination_ipv6_cidr_block:(destination_ipv6_cidr_block_ : cid_r option)
    ~route_table_id:(route_table_id_ : action_target) () =
  ({
     description = description_;
     destination_cidr_block = destination_cidr_block_;
     destination_prefix_list_id = destination_prefix_list_id_;
     destination_ipv6_cidr_block = destination_ipv6_cidr_block_;
     route_table_id = route_table_id_;
   }
    : ec2_delete_route_action)

let make_ec2_replace_route_action ?description:(description_ : length_bounded_string option)
    ?destination_cidr_block:(destination_cidr_block_ : cid_r option)
    ?destination_prefix_list_id:(destination_prefix_list_id_ : resource_id option)
    ?destination_ipv6_cidr_block:(destination_ipv6_cidr_block_ : cid_r option)
    ?gateway_id:(gateway_id_ : action_target option)
    ~route_table_id:(route_table_id_ : action_target) () =
  ({
     description = description_;
     destination_cidr_block = destination_cidr_block_;
     destination_prefix_list_id = destination_prefix_list_id_;
     destination_ipv6_cidr_block = destination_ipv6_cidr_block_;
     gateway_id = gateway_id_;
     route_table_id = route_table_id_;
   }
    : ec2_replace_route_action)

let make_ec2_create_route_action ?description:(description_ : length_bounded_string option)
    ?destination_cidr_block:(destination_cidr_block_ : cid_r option)
    ?destination_prefix_list_id:(destination_prefix_list_id_ : resource_id option)
    ?destination_ipv6_cidr_block:(destination_ipv6_cidr_block_ : cid_r option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : action_target option)
    ?gateway_id:(gateway_id_ : action_target option)
    ~route_table_id:(route_table_id_ : action_target) () =
  ({
     description = description_;
     destination_cidr_block = destination_cidr_block_;
     destination_prefix_list_id = destination_prefix_list_id_;
     destination_ipv6_cidr_block = destination_ipv6_cidr_block_;
     vpc_endpoint_id = vpc_endpoint_id_;
     gateway_id = gateway_id_;
     route_table_id = route_table_id_;
   }
    : ec2_create_route_action)

let make_remediation_action ?description:(description_ : length_bounded_string option)
    ?ec2_create_route_action:(ec2_create_route_action_ : ec2_create_route_action option)
    ?ec2_replace_route_action:(ec2_replace_route_action_ : ec2_replace_route_action option)
    ?ec2_delete_route_action:(ec2_delete_route_action_ : ec2_delete_route_action option)
    ?ec2_copy_route_table_action:(ec2_copy_route_table_action_ : ec2_copy_route_table_action option)
    ?ec2_replace_route_table_association_action:
      (ec2_replace_route_table_association_action_ :
         ec2_replace_route_table_association_action option)
    ?ec2_associate_route_table_action:
      (ec2_associate_route_table_action_ : ec2_associate_route_table_action option)
    ?ec2_create_route_table_action:
      (ec2_create_route_table_action_ : ec2_create_route_table_action option)
    ?fms_policy_update_firewall_creation_config_action:
      (fms_policy_update_firewall_creation_config_action_ :
         fms_policy_update_firewall_creation_config_action option)
    ?create_network_acl_action:(create_network_acl_action_ : create_network_acl_action option)
    ?replace_network_acl_association_action:
      (replace_network_acl_association_action_ : replace_network_acl_association_action option)
    ?create_network_acl_entries_action:
      (create_network_acl_entries_action_ : create_network_acl_entries_action option)
    ?delete_network_acl_entries_action:
      (delete_network_acl_entries_action_ : delete_network_acl_entries_action option) () =
  ({
     description = description_;
     ec2_create_route_action = ec2_create_route_action_;
     ec2_replace_route_action = ec2_replace_route_action_;
     ec2_delete_route_action = ec2_delete_route_action_;
     ec2_copy_route_table_action = ec2_copy_route_table_action_;
     ec2_replace_route_table_association_action = ec2_replace_route_table_association_action_;
     ec2_associate_route_table_action = ec2_associate_route_table_action_;
     ec2_create_route_table_action = ec2_create_route_table_action_;
     fms_policy_update_firewall_creation_config_action =
       fms_policy_update_firewall_creation_config_action_;
     create_network_acl_action = create_network_acl_action_;
     replace_network_acl_association_action = replace_network_acl_association_action_;
     create_network_acl_entries_action = create_network_acl_entries_action_;
     delete_network_acl_entries_action = delete_network_acl_entries_action_;
   }
    : remediation_action)

let make_remediation_action_with_order
    ?remediation_action:(remediation_action_ : remediation_action option)
    ?order:(order_ : basic_integer option) () =
  ({ remediation_action = remediation_action_; order = order_ } : remediation_action_with_order)

let make_possible_remediation_action ?description:(description_ : length_bounded_string option)
    ?is_default_action:(is_default_action_ : boolean_ option)
    ~ordered_remediation_actions:(ordered_remediation_actions_ : ordered_remediation_actions) () =
  ({
     description = description_;
     ordered_remediation_actions = ordered_remediation_actions_;
     is_default_action = is_default_action_;
   }
    : possible_remediation_action)

let make_possible_remediation_actions ?description:(description_ : length_bounded_string option)
    ?actions:(actions_ : possible_remediation_action_list option) () =
  ({ description = description_; actions = actions_ } : possible_remediation_actions)

let make_entry_violation ?expected_entry:(expected_entry_ : entry_description option)
    ?expected_evaluation_order:(expected_evaluation_order_ : length_bounded_string option)
    ?actual_evaluation_order:(actual_evaluation_order_ : length_bounded_string option)
    ?entry_at_expected_evaluation_order:
      (entry_at_expected_evaluation_order_ : entry_description option)
    ?entries_with_conflicts:(entries_with_conflicts_ : entries_with_conflicts option)
    ?entry_violation_reasons:(entry_violation_reasons_ : entry_violation_reasons option) () =
  ({
     expected_entry = expected_entry_;
     expected_evaluation_order = expected_evaluation_order_;
     actual_evaluation_order = actual_evaluation_order_;
     entry_at_expected_evaluation_order = entry_at_expected_evaluation_order_;
     entries_with_conflicts = entries_with_conflicts_;
     entry_violation_reasons = entry_violation_reasons_;
   }
    : entry_violation)

let make_invalid_network_acl_entries_violation ?vpc:(vpc_ : resource_id option)
    ?subnet:(subnet_ : resource_id option)
    ?subnet_availability_zone:(subnet_availability_zone_ : length_bounded_string option)
    ?current_associated_network_acl:(current_associated_network_acl_ : resource_id option)
    ?entry_violations:(entry_violations_ : entry_violations option) () =
  ({
     vpc = vpc_;
     subnet = subnet_;
     subnet_availability_zone = subnet_availability_zone_;
     current_associated_network_acl = current_associated_network_acl_;
     entry_violations = entry_violations_;
   }
    : invalid_network_acl_entries_violation)

let make_firewall_subnet_missing_vpc_endpoint_violation
    ?firewall_subnet_id:(firewall_subnet_id_ : resource_id option)
    ?vpc_id:(vpc_id_ : resource_id option)
    ?subnet_availability_zone:(subnet_availability_zone_ : length_bounded_string option)
    ?subnet_availability_zone_id:(subnet_availability_zone_id_ : length_bounded_string option) () =
  ({
     firewall_subnet_id = firewall_subnet_id_;
     vpc_id = vpc_id_;
     subnet_availability_zone = subnet_availability_zone_;
     subnet_availability_zone_id = subnet_availability_zone_id_;
   }
    : firewall_subnet_missing_vpc_endpoint_violation)

let make_third_party_firewall_missing_expected_route_table_violation
    ?violation_target:(violation_target_ : violation_target option)
    ?vp_c:(vp_c_ : resource_id option)
    ?availability_zone:(availability_zone_ : length_bounded_string option)
    ?current_route_table:(current_route_table_ : resource_id option)
    ?expected_route_table:(expected_route_table_ : resource_id option) () =
  ({
     violation_target = violation_target_;
     vp_c = vp_c_;
     availability_zone = availability_zone_;
     current_route_table = current_route_table_;
     expected_route_table = expected_route_table_;
   }
    : third_party_firewall_missing_expected_route_table_violation)

let make_third_party_firewall_missing_subnet_violation
    ?violation_target:(violation_target_ : violation_target option)
    ?vp_c:(vp_c_ : resource_id option)
    ?availability_zone:(availability_zone_ : length_bounded_string option)
    ?target_violation_reason:(target_violation_reason_ : target_violation_reason option) () =
  ({
     violation_target = violation_target_;
     vp_c = vp_c_;
     availability_zone = availability_zone_;
     target_violation_reason = target_violation_reason_;
   }
    : third_party_firewall_missing_subnet_violation)

let make_third_party_firewall_missing_firewall_violation
    ?violation_target:(violation_target_ : violation_target option)
    ?vp_c:(vp_c_ : resource_id option)
    ?availability_zone:(availability_zone_ : length_bounded_string option)
    ?target_violation_reason:(target_violation_reason_ : target_violation_reason option) () =
  ({
     violation_target = violation_target_;
     vp_c = vp_c_;
     availability_zone = availability_zone_;
     target_violation_reason = target_violation_reason_;
   }
    : third_party_firewall_missing_firewall_violation)

let make_route ?destination_type:(destination_type_ : destination_type option)
    ?target_type:(target_type_ : target_type option)
    ?destination:(destination_ : length_bounded_string option)
    ?target:(target_ : length_bounded_string option) () =
  ({
     destination_type = destination_type_;
     target_type = target_type_;
     destination = destination_;
     target = target_;
   }
    : route)

let make_route_has_out_of_scope_endpoint_violation ?subnet_id:(subnet_id_ : resource_id option)
    ?vpc_id:(vpc_id_ : resource_id option) ?route_table_id:(route_table_id_ : resource_id option)
    ?violating_routes:(violating_routes_ : routes option)
    ?subnet_availability_zone:(subnet_availability_zone_ : length_bounded_string option)
    ?subnet_availability_zone_id:(subnet_availability_zone_id_ : length_bounded_string option)
    ?current_firewall_subnet_route_table:(current_firewall_subnet_route_table_ : resource_id option)
    ?firewall_subnet_id:(firewall_subnet_id_ : resource_id option)
    ?firewall_subnet_routes:(firewall_subnet_routes_ : routes option)
    ?internet_gateway_id:(internet_gateway_id_ : resource_id option)
    ?current_internet_gateway_route_table:
      (current_internet_gateway_route_table_ : resource_id option)
    ?internet_gateway_routes:(internet_gateway_routes_ : routes option) () =
  ({
     subnet_id = subnet_id_;
     vpc_id = vpc_id_;
     route_table_id = route_table_id_;
     violating_routes = violating_routes_;
     subnet_availability_zone = subnet_availability_zone_;
     subnet_availability_zone_id = subnet_availability_zone_id_;
     current_firewall_subnet_route_table = current_firewall_subnet_route_table_;
     firewall_subnet_id = firewall_subnet_id_;
     firewall_subnet_routes = firewall_subnet_routes_;
     internet_gateway_id = internet_gateway_id_;
     current_internet_gateway_route_table = current_internet_gateway_route_table_;
     internet_gateway_routes = internet_gateway_routes_;
   }
    : route_has_out_of_scope_endpoint_violation)

let make_firewall_subnet_is_out_of_scope_violation
    ?firewall_subnet_id:(firewall_subnet_id_ : resource_id option)
    ?vpc_id:(vpc_id_ : resource_id option)
    ?subnet_availability_zone:(subnet_availability_zone_ : length_bounded_string option)
    ?subnet_availability_zone_id:(subnet_availability_zone_id_ : length_bounded_string option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : resource_id option) () =
  ({
     firewall_subnet_id = firewall_subnet_id_;
     vpc_id = vpc_id_;
     subnet_availability_zone = subnet_availability_zone_;
     subnet_availability_zone_id = subnet_availability_zone_id_;
     vpc_endpoint_id = vpc_endpoint_id_;
   }
    : firewall_subnet_is_out_of_scope_violation)

let make_dns_rule_group_limit_exceeded_violation
    ?violation_target:(violation_target_ : violation_target option)
    ?violation_target_description:(violation_target_description_ : length_bounded_string option)
    ?number_of_rule_groups_already_associated:
      (number_of_rule_groups_already_associated_ : basic_integer option) () =
  ({
     violation_target = violation_target_;
     violation_target_description = violation_target_description_;
     number_of_rule_groups_already_associated = number_of_rule_groups_already_associated_;
   }
    : dns_rule_group_limit_exceeded_violation)

let make_dns_duplicate_rule_group_violation
    ?violation_target:(violation_target_ : violation_target option)
    ?violation_target_description:(violation_target_description_ : length_bounded_string option) ()
    =
  ({
     violation_target = violation_target_;
     violation_target_description = violation_target_description_;
   }
    : dns_duplicate_rule_group_violation)

let make_dns_rule_group_priority_conflict_violation
    ?violation_target:(violation_target_ : violation_target option)
    ?violation_target_description:(violation_target_description_ : length_bounded_string option)
    ?conflicting_priority:(conflicting_priority_ : dns_rule_group_priority option)
    ?conflicting_policy_id:(conflicting_policy_id_ : policy_id option)
    ?unavailable_priorities:(unavailable_priorities_ : dns_rule_group_priorities option) () =
  ({
     violation_target = violation_target_;
     violation_target_description = violation_target_description_;
     conflicting_priority = conflicting_priority_;
     conflicting_policy_id = conflicting_policy_id_;
     unavailable_priorities = unavailable_priorities_;
   }
    : dns_rule_group_priority_conflict_violation)

let make_expected_route ?ip_v4_cidr:(ip_v4_cidr_ : cid_r option)
    ?prefix_list_id:(prefix_list_id_ : cid_r option) ?ip_v6_cidr:(ip_v6_cidr_ : cid_r option)
    ?contributing_subnets:(contributing_subnets_ : resource_id_list option)
    ?allowed_targets:(allowed_targets_ : length_bounded_string_list option)
    ?route_table_id:(route_table_id_ : resource_id option) () =
  ({
     ip_v4_cidr = ip_v4_cidr_;
     prefix_list_id = prefix_list_id_;
     ip_v6_cidr = ip_v6_cidr_;
     contributing_subnets = contributing_subnets_;
     allowed_targets = allowed_targets_;
     route_table_id = route_table_id_;
   }
    : expected_route)

let make_network_firewall_missing_expected_routes_violation
    ?violation_target:(violation_target_ : violation_target option)
    ?expected_routes:(expected_routes_ : expected_routes option)
    ?vpc_id:(vpc_id_ : resource_id option) () =
  ({ violation_target = violation_target_; expected_routes = expected_routes_; vpc_id = vpc_id_ }
    : network_firewall_missing_expected_routes_violation)

let make_network_firewall_unexpected_gateway_routes_violation
    ?gateway_id:(gateway_id_ : resource_id option)
    ?violating_routes:(violating_routes_ : routes option)
    ?route_table_id:(route_table_id_ : resource_id option) ?vpc_id:(vpc_id_ : resource_id option) ()
    =
  ({
     gateway_id = gateway_id_;
     violating_routes = violating_routes_;
     route_table_id = route_table_id_;
     vpc_id = vpc_id_;
   }
    : network_firewall_unexpected_gateway_routes_violation)

let make_network_firewall_unexpected_firewall_routes_violation
    ?firewall_subnet_id:(firewall_subnet_id_ : resource_id option)
    ?violating_routes:(violating_routes_ : routes option)
    ?route_table_id:(route_table_id_ : resource_id option)
    ?firewall_endpoint:(firewall_endpoint_ : resource_id option)
    ?vpc_id:(vpc_id_ : resource_id option) () =
  ({
     firewall_subnet_id = firewall_subnet_id_;
     violating_routes = violating_routes_;
     route_table_id = route_table_id_;
     firewall_endpoint = firewall_endpoint_;
     vpc_id = vpc_id_;
   }
    : network_firewall_unexpected_firewall_routes_violation)

let make_network_firewall_black_hole_route_detected_violation
    ?violation_target:(violation_target_ : violation_target option)
    ?route_table_id:(route_table_id_ : resource_id option) ?vpc_id:(vpc_id_ : resource_id option)
    ?violating_routes:(violating_routes_ : routes option) () =
  ({
     violation_target = violation_target_;
     route_table_id = route_table_id_;
     vpc_id = vpc_id_;
     violating_routes = violating_routes_;
   }
    : network_firewall_black_hole_route_detected_violation)

let make_network_firewall_invalid_route_configuration_violation
    ?affected_subnets:(affected_subnets_ : resource_id_list option)
    ?route_table_id:(route_table_id_ : resource_id option)
    ?is_route_table_used_in_different_a_z:(is_route_table_used_in_different_a_z_ : boolean_ option)
    ?violating_route:(violating_route_ : route option)
    ?current_firewall_subnet_route_table:(current_firewall_subnet_route_table_ : resource_id option)
    ?expected_firewall_endpoint:(expected_firewall_endpoint_ : resource_id option)
    ?actual_firewall_endpoint:(actual_firewall_endpoint_ : resource_id option)
    ?expected_firewall_subnet_id:(expected_firewall_subnet_id_ : resource_id option)
    ?actual_firewall_subnet_id:(actual_firewall_subnet_id_ : resource_id option)
    ?expected_firewall_subnet_routes:(expected_firewall_subnet_routes_ : expected_routes option)
    ?actual_firewall_subnet_routes:(actual_firewall_subnet_routes_ : routes option)
    ?internet_gateway_id:(internet_gateway_id_ : resource_id option)
    ?current_internet_gateway_route_table:
      (current_internet_gateway_route_table_ : resource_id option)
    ?expected_internet_gateway_routes:(expected_internet_gateway_routes_ : expected_routes option)
    ?actual_internet_gateway_routes:(actual_internet_gateway_routes_ : routes option)
    ?vpc_id:(vpc_id_ : resource_id option) () =
  ({
     affected_subnets = affected_subnets_;
     route_table_id = route_table_id_;
     is_route_table_used_in_different_a_z = is_route_table_used_in_different_a_z_;
     violating_route = violating_route_;
     current_firewall_subnet_route_table = current_firewall_subnet_route_table_;
     expected_firewall_endpoint = expected_firewall_endpoint_;
     actual_firewall_endpoint = actual_firewall_endpoint_;
     expected_firewall_subnet_id = expected_firewall_subnet_id_;
     actual_firewall_subnet_id = actual_firewall_subnet_id_;
     expected_firewall_subnet_routes = expected_firewall_subnet_routes_;
     actual_firewall_subnet_routes = actual_firewall_subnet_routes_;
     internet_gateway_id = internet_gateway_id_;
     current_internet_gateway_route_table = current_internet_gateway_route_table_;
     expected_internet_gateway_routes = expected_internet_gateway_routes_;
     actual_internet_gateway_routes = actual_internet_gateway_routes_;
     vpc_id = vpc_id_;
   }
    : network_firewall_invalid_route_configuration_violation)

let make_network_firewall_internet_traffic_not_inspected_violation
    ?subnet_id:(subnet_id_ : resource_id option)
    ?subnet_availability_zone:(subnet_availability_zone_ : length_bounded_string option)
    ?route_table_id:(route_table_id_ : resource_id option)
    ?violating_routes:(violating_routes_ : routes option)
    ?is_route_table_used_in_different_a_z:(is_route_table_used_in_different_a_z_ : boolean_ option)
    ?current_firewall_subnet_route_table:(current_firewall_subnet_route_table_ : resource_id option)
    ?expected_firewall_endpoint:(expected_firewall_endpoint_ : resource_id option)
    ?firewall_subnet_id:(firewall_subnet_id_ : resource_id option)
    ?expected_firewall_subnet_routes:(expected_firewall_subnet_routes_ : expected_routes option)
    ?actual_firewall_subnet_routes:(actual_firewall_subnet_routes_ : routes option)
    ?internet_gateway_id:(internet_gateway_id_ : resource_id option)
    ?current_internet_gateway_route_table:
      (current_internet_gateway_route_table_ : resource_id option)
    ?expected_internet_gateway_routes:(expected_internet_gateway_routes_ : expected_routes option)
    ?actual_internet_gateway_routes:(actual_internet_gateway_routes_ : routes option)
    ?vpc_id:(vpc_id_ : resource_id option) () =
  ({
     subnet_id = subnet_id_;
     subnet_availability_zone = subnet_availability_zone_;
     route_table_id = route_table_id_;
     violating_routes = violating_routes_;
     is_route_table_used_in_different_a_z = is_route_table_used_in_different_a_z_;
     current_firewall_subnet_route_table = current_firewall_subnet_route_table_;
     expected_firewall_endpoint = expected_firewall_endpoint_;
     firewall_subnet_id = firewall_subnet_id_;
     expected_firewall_subnet_routes = expected_firewall_subnet_routes_;
     actual_firewall_subnet_routes = actual_firewall_subnet_routes_;
     internet_gateway_id = internet_gateway_id_;
     current_internet_gateway_route_table = current_internet_gateway_route_table_;
     expected_internet_gateway_routes = expected_internet_gateway_routes_;
     actual_internet_gateway_routes = actual_internet_gateway_routes_;
     vpc_id = vpc_id_;
   }
    : network_firewall_internet_traffic_not_inspected_violation)

let make_stateful_engine_options ?rule_order:(rule_order_ : rule_order option)
    ?stream_exception_policy:(stream_exception_policy_ : stream_exception_policy option) () =
  ({ rule_order = rule_order_; stream_exception_policy = stream_exception_policy_ }
    : stateful_engine_options)

let make_network_firewall_stateful_rule_group_override
    ?action:(action_ : network_firewall_override_action option) () =
  ({ action = action_ } : network_firewall_stateful_rule_group_override)

let make_stateful_rule_group
    ?rule_group_name:(rule_group_name_ : network_firewall_resource_name option)
    ?resource_id:(resource_id_ : resource_id option) ?priority:(priority_ : priority_number option)
    ?override:(override_ : network_firewall_stateful_rule_group_override option) () =
  ({
     rule_group_name = rule_group_name_;
     resource_id = resource_id_;
     priority = priority_;
     override = override_;
   }
    : stateful_rule_group)

let make_stateless_rule_group
    ?rule_group_name:(rule_group_name_ : network_firewall_resource_name option)
    ?resource_id:(resource_id_ : resource_id option)
    ?priority:(priority_ : stateless_rule_group_priority option) () =
  ({ rule_group_name = rule_group_name_; resource_id = resource_id_; priority = priority_ }
    : stateless_rule_group)

let make_network_firewall_policy_description
    ?stateless_rule_groups:(stateless_rule_groups_ : stateless_rule_group_list option)
    ?stateless_default_actions:(stateless_default_actions_ : network_firewall_action_list option)
    ?stateless_fragment_default_actions:
      (stateless_fragment_default_actions_ : network_firewall_action_list option)
    ?stateless_custom_actions:(stateless_custom_actions_ : network_firewall_action_list option)
    ?stateful_rule_groups:(stateful_rule_groups_ : stateful_rule_group_list option)
    ?stateful_default_actions:(stateful_default_actions_ : network_firewall_action_list option)
    ?stateful_engine_options:(stateful_engine_options_ : stateful_engine_options option) () =
  ({
     stateless_rule_groups = stateless_rule_groups_;
     stateless_default_actions = stateless_default_actions_;
     stateless_fragment_default_actions = stateless_fragment_default_actions_;
     stateless_custom_actions = stateless_custom_actions_;
     stateful_rule_groups = stateful_rule_groups_;
     stateful_default_actions = stateful_default_actions_;
     stateful_engine_options = stateful_engine_options_;
   }
    : network_firewall_policy_description)

let make_network_firewall_policy_modified_violation
    ?violation_target:(violation_target_ : violation_target option)
    ?current_policy_description:
      (current_policy_description_ : network_firewall_policy_description option)
    ?expected_policy_description:
      (expected_policy_description_ : network_firewall_policy_description option) () =
  ({
     violation_target = violation_target_;
     current_policy_description = current_policy_description_;
     expected_policy_description = expected_policy_description_;
   }
    : network_firewall_policy_modified_violation)

let make_network_firewall_missing_expected_rt_violation
    ?violation_target:(violation_target_ : violation_target option)
    ?vp_c:(vp_c_ : resource_id option)
    ?availability_zone:(availability_zone_ : length_bounded_string option)
    ?current_route_table:(current_route_table_ : resource_id option)
    ?expected_route_table:(expected_route_table_ : resource_id option) () =
  ({
     violation_target = violation_target_;
     vp_c = vp_c_;
     availability_zone = availability_zone_;
     current_route_table = current_route_table_;
     expected_route_table = expected_route_table_;
   }
    : network_firewall_missing_expected_rt_violation)

let make_network_firewall_missing_subnet_violation
    ?violation_target:(violation_target_ : violation_target option)
    ?vp_c:(vp_c_ : resource_id option)
    ?availability_zone:(availability_zone_ : length_bounded_string option)
    ?target_violation_reason:(target_violation_reason_ : target_violation_reason option) () =
  ({
     violation_target = violation_target_;
     vp_c = vp_c_;
     availability_zone = availability_zone_;
     target_violation_reason = target_violation_reason_;
   }
    : network_firewall_missing_subnet_violation)

let make_network_firewall_missing_firewall_violation
    ?violation_target:(violation_target_ : violation_target option)
    ?vp_c:(vp_c_ : resource_id option)
    ?availability_zone:(availability_zone_ : length_bounded_string option)
    ?target_violation_reason:(target_violation_reason_ : target_violation_reason option) () =
  ({
     violation_target = violation_target_;
     vp_c = vp_c_;
     availability_zone = availability_zone_;
     target_violation_reason = target_violation_reason_;
   }
    : network_firewall_missing_firewall_violation)

let make_aws_ec2_network_interface_violation
    ?violation_target:(violation_target_ : violation_target option)
    ?violating_security_groups:(violating_security_groups_ : resource_id_list option) () =
  ({ violation_target = violation_target_; violating_security_groups = violating_security_groups_ }
    : aws_ec2_network_interface_violation)

let make_aws_ec2_instance_violation ?violation_target:(violation_target_ : violation_target option)
    ?aws_ec2_network_interface_violations:
      (aws_ec2_network_interface_violations_ : aws_ec2_network_interface_violations option) () =
  ({
     violation_target = violation_target_;
     aws_ec2_network_interface_violations = aws_ec2_network_interface_violations_;
   }
    : aws_ec2_instance_violation)

let make_security_group_rule_description ?ipv4_range:(ipv4_range_ : cid_r option)
    ?ipv6_range:(ipv6_range_ : cid_r option) ?prefix_list_id:(prefix_list_id_ : resource_id option)
    ?protocol:(protocol_ : length_bounded_string option)
    ?from_port:(from_port_ : ip_port_number option) ?to_port:(to_port_ : ip_port_number option) () =
  ({
     ipv4_range = ipv4_range_;
     ipv6_range = ipv6_range_;
     prefix_list_id = prefix_list_id_;
     protocol = protocol_;
     from_port = from_port_;
     to_port = to_port_;
   }
    : security_group_rule_description)

let make_security_group_remediation_action
    ?remediation_action_type:(remediation_action_type_ : remediation_action_type option)
    ?description:(description_ : remediation_action_description option)
    ?remediation_result:(remediation_result_ : security_group_rule_description option)
    ?is_default_action:(is_default_action_ : boolean_ option) () =
  ({
     remediation_action_type = remediation_action_type_;
     description = description_;
     remediation_result = remediation_result_;
     is_default_action = is_default_action_;
   }
    : security_group_remediation_action)

let make_partial_match ?reference:(reference_ : reference_rule option)
    ?target_violation_reasons:(target_violation_reasons_ : target_violation_reasons option) () =
  ({ reference = reference_; target_violation_reasons = target_violation_reasons_ } : partial_match)

let make_aws_vpc_security_group_violation
    ?violation_target:(violation_target_ : violation_target option)
    ?violation_target_description:(violation_target_description_ : length_bounded_string option)
    ?partial_matches:(partial_matches_ : partial_matches option)
    ?possible_security_group_remediation_actions:
      (possible_security_group_remediation_actions_ : security_group_remediation_actions option) ()
    =
  ({
     violation_target = violation_target_;
     violation_target_description = violation_target_description_;
     partial_matches = partial_matches_;
     possible_security_group_remediation_actions = possible_security_group_remediation_actions_;
   }
    : aws_vpc_security_group_violation)

let make_resource_violation
    ?aws_vpc_security_group_violation:
      (aws_vpc_security_group_violation_ : aws_vpc_security_group_violation option)
    ?aws_ec2_network_interface_violation:
      (aws_ec2_network_interface_violation_ : aws_ec2_network_interface_violation option)
    ?aws_ec2_instance_violation:(aws_ec2_instance_violation_ : aws_ec2_instance_violation option)
    ?network_firewall_missing_firewall_violation:
      (network_firewall_missing_firewall_violation_ :
         network_firewall_missing_firewall_violation option)
    ?network_firewall_missing_subnet_violation:
      (network_firewall_missing_subnet_violation_ : network_firewall_missing_subnet_violation option)
    ?network_firewall_missing_expected_rt_violation:
      (network_firewall_missing_expected_rt_violation_ :
         network_firewall_missing_expected_rt_violation option)
    ?network_firewall_policy_modified_violation:
      (network_firewall_policy_modified_violation_ :
         network_firewall_policy_modified_violation option)
    ?network_firewall_internet_traffic_not_inspected_violation:
      (network_firewall_internet_traffic_not_inspected_violation_ :
         network_firewall_internet_traffic_not_inspected_violation option)
    ?network_firewall_invalid_route_configuration_violation:
      (network_firewall_invalid_route_configuration_violation_ :
         network_firewall_invalid_route_configuration_violation option)
    ?network_firewall_black_hole_route_detected_violation:
      (network_firewall_black_hole_route_detected_violation_ :
         network_firewall_black_hole_route_detected_violation option)
    ?network_firewall_unexpected_firewall_routes_violation:
      (network_firewall_unexpected_firewall_routes_violation_ :
         network_firewall_unexpected_firewall_routes_violation option)
    ?network_firewall_unexpected_gateway_routes_violation:
      (network_firewall_unexpected_gateway_routes_violation_ :
         network_firewall_unexpected_gateway_routes_violation option)
    ?network_firewall_missing_expected_routes_violation:
      (network_firewall_missing_expected_routes_violation_ :
         network_firewall_missing_expected_routes_violation option)
    ?dns_rule_group_priority_conflict_violation:
      (dns_rule_group_priority_conflict_violation_ :
         dns_rule_group_priority_conflict_violation option)
    ?dns_duplicate_rule_group_violation:
      (dns_duplicate_rule_group_violation_ : dns_duplicate_rule_group_violation option)
    ?dns_rule_group_limit_exceeded_violation:
      (dns_rule_group_limit_exceeded_violation_ : dns_rule_group_limit_exceeded_violation option)
    ?firewall_subnet_is_out_of_scope_violation:
      (firewall_subnet_is_out_of_scope_violation_ : firewall_subnet_is_out_of_scope_violation option)
    ?route_has_out_of_scope_endpoint_violation:
      (route_has_out_of_scope_endpoint_violation_ : route_has_out_of_scope_endpoint_violation option)
    ?third_party_firewall_missing_firewall_violation:
      (third_party_firewall_missing_firewall_violation_ :
         third_party_firewall_missing_firewall_violation option)
    ?third_party_firewall_missing_subnet_violation:
      (third_party_firewall_missing_subnet_violation_ :
         third_party_firewall_missing_subnet_violation option)
    ?third_party_firewall_missing_expected_route_table_violation:
      (third_party_firewall_missing_expected_route_table_violation_ :
         third_party_firewall_missing_expected_route_table_violation option)
    ?firewall_subnet_missing_vpc_endpoint_violation:
      (firewall_subnet_missing_vpc_endpoint_violation_ :
         firewall_subnet_missing_vpc_endpoint_violation option)
    ?invalid_network_acl_entries_violation:
      (invalid_network_acl_entries_violation_ : invalid_network_acl_entries_violation option)
    ?possible_remediation_actions:
      (possible_remediation_actions_ : possible_remediation_actions option)
    ?web_acl_has_incompatible_configuration_violation:
      (web_acl_has_incompatible_configuration_violation_ :
         web_acl_has_incompatible_configuration_violation option)
    ?web_acl_has_out_of_scope_resources_violation:
      (web_acl_has_out_of_scope_resources_violation_ :
         web_acl_has_out_of_scope_resources_violation option) () =
  ({
     aws_vpc_security_group_violation = aws_vpc_security_group_violation_;
     aws_ec2_network_interface_violation = aws_ec2_network_interface_violation_;
     aws_ec2_instance_violation = aws_ec2_instance_violation_;
     network_firewall_missing_firewall_violation = network_firewall_missing_firewall_violation_;
     network_firewall_missing_subnet_violation = network_firewall_missing_subnet_violation_;
     network_firewall_missing_expected_rt_violation =
       network_firewall_missing_expected_rt_violation_;
     network_firewall_policy_modified_violation = network_firewall_policy_modified_violation_;
     network_firewall_internet_traffic_not_inspected_violation =
       network_firewall_internet_traffic_not_inspected_violation_;
     network_firewall_invalid_route_configuration_violation =
       network_firewall_invalid_route_configuration_violation_;
     network_firewall_black_hole_route_detected_violation =
       network_firewall_black_hole_route_detected_violation_;
     network_firewall_unexpected_firewall_routes_violation =
       network_firewall_unexpected_firewall_routes_violation_;
     network_firewall_unexpected_gateway_routes_violation =
       network_firewall_unexpected_gateway_routes_violation_;
     network_firewall_missing_expected_routes_violation =
       network_firewall_missing_expected_routes_violation_;
     dns_rule_group_priority_conflict_violation = dns_rule_group_priority_conflict_violation_;
     dns_duplicate_rule_group_violation = dns_duplicate_rule_group_violation_;
     dns_rule_group_limit_exceeded_violation = dns_rule_group_limit_exceeded_violation_;
     firewall_subnet_is_out_of_scope_violation = firewall_subnet_is_out_of_scope_violation_;
     route_has_out_of_scope_endpoint_violation = route_has_out_of_scope_endpoint_violation_;
     third_party_firewall_missing_firewall_violation =
       third_party_firewall_missing_firewall_violation_;
     third_party_firewall_missing_subnet_violation = third_party_firewall_missing_subnet_violation_;
     third_party_firewall_missing_expected_route_table_violation =
       third_party_firewall_missing_expected_route_table_violation_;
     firewall_subnet_missing_vpc_endpoint_violation =
       firewall_subnet_missing_vpc_endpoint_violation_;
     invalid_network_acl_entries_violation = invalid_network_acl_entries_violation_;
     possible_remediation_actions = possible_remediation_actions_;
     web_acl_has_incompatible_configuration_violation =
       web_acl_has_incompatible_configuration_violation_;
     web_acl_has_out_of_scope_resources_violation = web_acl_has_out_of_scope_resources_violation_;
   }
    : resource_violation)

let make_violation_detail ?resource_tags:(resource_tags_ : tag_list option)
    ?resource_description:(resource_description_ : length_bounded_string option)
    ~policy_id:(policy_id_ : policy_id) ~member_account:(member_account_ : aws_account_id)
    ~resource_id:(resource_id_ : resource_id) ~resource_type:(resource_type_ : resource_type)
    ~resource_violations:(resource_violations_ : resource_violations) () =
  ({
     policy_id = policy_id_;
     member_account = member_account_;
     resource_id = resource_id_;
     resource_type = resource_type_;
     resource_violations = resource_violations_;
     resource_tags = resource_tags_;
     resource_description = resource_description_;
   }
    : violation_detail)

let make_get_violation_details_response
    ?violation_detail:(violation_detail_ : violation_detail option) () =
  ({ violation_detail = violation_detail_ } : get_violation_details_response)

let make_get_violation_details_request ~policy_id:(policy_id_ : policy_id)
    ~member_account:(member_account_ : aws_account_id) ~resource_id:(resource_id_ : resource_id)
    ~resource_type:(resource_type_ : resource_type) () =
  ({
     policy_id = policy_id_;
     member_account = member_account_;
     resource_id = resource_id_;
     resource_type = resource_type_;
   }
    : get_violation_details_request)

let make_get_third_party_firewall_association_status_response
    ?third_party_firewall_status:
      (third_party_firewall_status_ : third_party_firewall_association_status option)
    ?marketplace_onboarding_status:
      (marketplace_onboarding_status_ : marketplace_subscription_onboarding_status option) () =
  ({
     third_party_firewall_status = third_party_firewall_status_;
     marketplace_onboarding_status = marketplace_onboarding_status_;
   }
    : get_third_party_firewall_association_status_response)

let make_get_third_party_firewall_association_status_request
    ~third_party_firewall:(third_party_firewall_ : third_party_firewall) () =
  ({ third_party_firewall = third_party_firewall_ }
    : get_third_party_firewall_association_status_request)

let make_get_resource_set_response ~resource_set:(resource_set_ : resource_set)
    ~resource_set_arn:(resource_set_arn_ : resource_arn) () =
  ({ resource_set = resource_set_; resource_set_arn = resource_set_arn_ }
    : get_resource_set_response)

let make_get_resource_set_request ~identifier:(identifier_ : base62_id) () =
  ({ identifier = identifier_ } : get_resource_set_request)

let make_get_protocols_list_response ?protocols_list:(protocols_list_ : protocols_list_data option)
    ?protocols_list_arn:(protocols_list_arn_ : resource_arn option) () =
  ({ protocols_list = protocols_list_; protocols_list_arn = protocols_list_arn_ }
    : get_protocols_list_response)

let make_get_protocols_list_request ?default_list:(default_list_ : boolean_ option)
    ~list_id:(list_id_ : list_id) () =
  ({ list_id = list_id_; default_list = default_list_ } : get_protocols_list_request)

let make_get_protection_status_response
    ?admin_account_id:(admin_account_id_ : aws_account_id option)
    ?service_type:(service_type_ : security_service_type option)
    ?data:(data_ : protection_data option) ?next_token:(next_token_ : pagination_token option) () =
  ({
     admin_account_id = admin_account_id_;
     service_type = service_type_;
     data = data_;
     next_token = next_token_;
   }
    : get_protection_status_response)

let make_get_protection_status_request
    ?member_account_id:(member_account_id_ : aws_account_id option)
    ?start_time:(start_time_ : time_stamp option) ?end_time:(end_time_ : time_stamp option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : pagination_max_results option) ~policy_id:(policy_id_ : policy_id)
    () =
  ({
     policy_id = policy_id_;
     member_account_id = member_account_id_;
     start_time = start_time_;
     end_time = end_time_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : get_protection_status_request)

let make_get_policy_response ?policy:(policy_ : policy option)
    ?policy_arn:(policy_arn_ : resource_arn option) () =
  ({ policy = policy_; policy_arn = policy_arn_ } : get_policy_response)

let make_get_policy_request ~policy_id:(policy_id_ : policy_id) () =
  ({ policy_id = policy_id_ } : get_policy_request)

let make_get_notification_channel_response ?sns_topic_arn:(sns_topic_arn_ : resource_arn option)
    ?sns_role_name:(sns_role_name_ : resource_arn option) () =
  ({ sns_topic_arn = sns_topic_arn_; sns_role_name = sns_role_name_ }
    : get_notification_channel_response)

let make_get_notification_channel_request () = (() : unit)

let make_compliance_violator ?resource_id:(resource_id_ : resource_id option)
    ?violation_reason:(violation_reason_ : violation_reason option)
    ?resource_type:(resource_type_ : resource_type option)
    ?metadata:(metadata_ : compliance_violator_metadata option) () =
  ({
     resource_id = resource_id_;
     violation_reason = violation_reason_;
     resource_type = resource_type_;
     metadata = metadata_;
   }
    : compliance_violator)

let make_policy_compliance_detail ?policy_owner:(policy_owner_ : aws_account_id option)
    ?policy_id:(policy_id_ : policy_id option)
    ?member_account:(member_account_ : aws_account_id option)
    ?violators:(violators_ : compliance_violators option)
    ?evaluation_limit_exceeded:(evaluation_limit_exceeded_ : boolean_ option)
    ?expired_at:(expired_at_ : time_stamp option)
    ?issue_info_map:(issue_info_map_ : issue_info_map option) () =
  ({
     policy_owner = policy_owner_;
     policy_id = policy_id_;
     member_account = member_account_;
     violators = violators_;
     evaluation_limit_exceeded = evaluation_limit_exceeded_;
     expired_at = expired_at_;
     issue_info_map = issue_info_map_;
   }
    : policy_compliance_detail)

let make_get_compliance_detail_response
    ?policy_compliance_detail:(policy_compliance_detail_ : policy_compliance_detail option) () =
  ({ policy_compliance_detail = policy_compliance_detail_ } : get_compliance_detail_response)

let make_get_compliance_detail_request ~policy_id:(policy_id_ : policy_id)
    ~member_account:(member_account_ : aws_account_id) () =
  ({ policy_id = policy_id_; member_account = member_account_ } : get_compliance_detail_request)

let make_get_apps_list_response ?apps_list:(apps_list_ : apps_list_data option)
    ?apps_list_arn:(apps_list_arn_ : resource_arn option) () =
  ({ apps_list = apps_list_; apps_list_arn = apps_list_arn_ } : get_apps_list_response)

let make_get_apps_list_request ?default_list:(default_list_ : boolean_ option)
    ~list_id:(list_id_ : list_id) () =
  ({ list_id = list_id_; default_list = default_list_ } : get_apps_list_request)

let make_get_admin_scope_response ?admin_scope:(admin_scope_ : admin_scope option)
    ?status:(status_ : organization_status option) () =
  ({ admin_scope = admin_scope_; status = status_ } : get_admin_scope_response)

let make_get_admin_scope_request ~admin_account:(admin_account_ : aws_account_id) () =
  ({ admin_account = admin_account_ } : get_admin_scope_request)

let make_get_admin_account_response ?admin_account:(admin_account_ : aws_account_id option)
    ?role_status:(role_status_ : account_role_status option) () =
  ({ admin_account = admin_account_; role_status = role_status_ } : get_admin_account_response)

let make_get_admin_account_request () = (() : unit)

let make_disassociate_third_party_firewall_response
    ?third_party_firewall_status:
      (third_party_firewall_status_ : third_party_firewall_association_status option) () =
  ({ third_party_firewall_status = third_party_firewall_status_ }
    : disassociate_third_party_firewall_response)

let make_disassociate_third_party_firewall_request
    ~third_party_firewall:(third_party_firewall_ : third_party_firewall) () =
  ({ third_party_firewall = third_party_firewall_ } : disassociate_third_party_firewall_request)

let make_disassociate_admin_account_request () = (() : unit)

let make_delete_resource_set_request ~identifier:(identifier_ : base62_id) () =
  ({ identifier = identifier_ } : delete_resource_set_request)

let make_delete_protocols_list_request ~list_id:(list_id_ : list_id) () =
  ({ list_id = list_id_ } : delete_protocols_list_request)

let make_delete_policy_request
    ?delete_all_policy_resources:(delete_all_policy_resources_ : boolean_ option)
    ~policy_id:(policy_id_ : policy_id) () =
  ({ policy_id = policy_id_; delete_all_policy_resources = delete_all_policy_resources_ }
    : delete_policy_request)

let make_delete_notification_channel_request () = (() : unit)

let make_delete_apps_list_request ~list_id:(list_id_ : list_id) () =
  ({ list_id = list_id_ } : delete_apps_list_request)

let make_failed_item ?ur_i:(ur_i_ : identifier option) ?reason:(reason_ : failed_item_reason option)
    () =
  ({ ur_i = ur_i_; reason = reason_ } : failed_item)

let make_batch_disassociate_resource_response
    ~resource_set_identifier:(resource_set_identifier_ : identifier)
    ~failed_items:(failed_items_ : failed_item_list) () =
  ({ resource_set_identifier = resource_set_identifier_; failed_items = failed_items_ }
    : batch_disassociate_resource_response)

let make_batch_disassociate_resource_request
    ~resource_set_identifier:(resource_set_identifier_ : identifier)
    ~items:(items_ : identifier_list) () =
  ({ resource_set_identifier = resource_set_identifier_; items = items_ }
    : batch_disassociate_resource_request)

let make_batch_associate_resource_response
    ~resource_set_identifier:(resource_set_identifier_ : identifier)
    ~failed_items:(failed_items_ : failed_item_list) () =
  ({ resource_set_identifier = resource_set_identifier_; failed_items = failed_items_ }
    : batch_associate_resource_response)

let make_batch_associate_resource_request
    ~resource_set_identifier:(resource_set_identifier_ : identifier)
    ~items:(items_ : identifier_list) () =
  ({ resource_set_identifier = resource_set_identifier_; items = items_ }
    : batch_associate_resource_request)

let make_associate_third_party_firewall_response
    ?third_party_firewall_status:
      (third_party_firewall_status_ : third_party_firewall_association_status option) () =
  ({ third_party_firewall_status = third_party_firewall_status_ }
    : associate_third_party_firewall_response)

let make_associate_third_party_firewall_request
    ~third_party_firewall:(third_party_firewall_ : third_party_firewall) () =
  ({ third_party_firewall = third_party_firewall_ } : associate_third_party_firewall_request)

let make_associate_admin_account_request ~admin_account:(admin_account_ : aws_account_id) () =
  ({ admin_account = admin_account_ } : associate_admin_account_request)
