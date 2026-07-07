open Types

val make_target_address :
  ?server_name_indication:server_name_indication ->
  ?protocol:protocol ->
  ?ipv6:ipv6 ->
  ?port:port ->
  ?ip:ip ->
  unit ->
  target_address

val make_resolver_rule :
  ?delegation_record:delegation_record ->
  ?modification_time:rfc3339_time_string ->
  ?creation_time:rfc3339_time_string ->
  ?share_status:share_status ->
  ?owner_id:account_id ->
  ?resolver_endpoint_id:resource_id ->
  ?target_ips:target_list ->
  ?name:name ->
  ?rule_type:rule_type_option ->
  ?status_message:status_message ->
  ?status:resolver_rule_status ->
  ?domain_name:domain_name ->
  ?arn:arn ->
  ?creator_request_id:creator_request_id ->
  ?id:resource_id ->
  unit ->
  resolver_rule

val make_update_resolver_rule_response :
  ?resolver_rule:resolver_rule -> unit -> update_resolver_rule_response

val make_resolver_rule_config :
  ?resolver_endpoint_id:resource_id ->
  ?target_ips:target_list ->
  ?name:name ->
  unit ->
  resolver_rule_config

val make_update_resolver_rule_request :
  config:resolver_rule_config ->
  resolver_rule_id:resource_id ->
  unit ->
  update_resolver_rule_request

val make_resolver_endpoint :
  ?ipv6_internet_access_enabled:ipv6_internet_access_enabled ->
  ?dns64_enabled:dns64_enabled ->
  ?target_name_server_metrics_enabled:target_name_server_metrics_enabled ->
  ?rni_enhanced_metrics_enabled:rni_enhanced_metrics_enabled ->
  ?protocols:protocol_list ->
  ?resolver_endpoint_type:resolver_endpoint_type ->
  ?preferred_instance_type:outpost_instance_type ->
  ?outpost_arn:outpost_arn ->
  ?modification_time:rfc3339_time_string ->
  ?creation_time:rfc3339_time_string ->
  ?status_message:status_message ->
  ?status:resolver_endpoint_status ->
  ?host_vpc_id:resource_id ->
  ?ip_address_count:ip_address_count ->
  ?direction:resolver_endpoint_direction ->
  ?security_group_ids:security_group_ids ->
  ?name:name ->
  ?arn:arn ->
  ?creator_request_id:creator_request_id ->
  ?id:resource_id ->
  unit ->
  resolver_endpoint

val make_update_resolver_endpoint_response :
  ?resolver_endpoint:resolver_endpoint -> unit -> update_resolver_endpoint_response

val make_update_ip_address : ipv6:ipv6 -> ip_id:resource_id -> unit -> update_ip_address

val make_update_resolver_endpoint_request :
  ?ipv6_internet_access_enabled:ipv6_internet_access_enabled ->
  ?dns64_enabled:dns64_enabled ->
  ?target_name_server_metrics_enabled:target_name_server_metrics_enabled ->
  ?rni_enhanced_metrics_enabled:rni_enhanced_metrics_enabled ->
  ?protocols:protocol_list ->
  ?update_ip_addresses:update_ip_addresses ->
  ?resolver_endpoint_type:resolver_endpoint_type ->
  ?name:name ->
  resolver_endpoint_id:resource_id ->
  unit ->
  update_resolver_endpoint_request

val make_resolver_dnssec_config :
  ?validation_status:resolver_dnssec_validation_status ->
  ?resource_id:resource_id ->
  ?owner_id:account_id ->
  ?id:resource_id ->
  unit ->
  resolver_dnssec_config

val make_update_resolver_dnssec_config_response :
  ?resolver_dnssec_config:resolver_dnssec_config -> unit -> update_resolver_dnssec_config_response

val make_update_resolver_dnssec_config_request :
  validation:validation -> resource_id:resource_id -> unit -> update_resolver_dnssec_config_request

val make_resolver_config :
  ?autodefined_reverse:resolver_autodefined_reverse_status ->
  ?owner_id:account_id ->
  ?resource_id:resource_id ->
  ?id:resource_id ->
  unit ->
  resolver_config

val make_update_resolver_config_response :
  ?resolver_config:resolver_config -> unit -> update_resolver_config_response

val make_update_resolver_config_request :
  autodefined_reverse_flag:autodefined_reverse_flag ->
  resource_id:resource_id ->
  unit ->
  update_resolver_config_request

val make_outpost_resolver :
  ?outpost_arn:outpost_arn ->
  ?status_message:outpost_resolver_status_message ->
  ?status:outpost_resolver_status ->
  ?name:outpost_resolver_name ->
  ?preferred_instance_type:outpost_instance_type ->
  ?instance_count:instance_count ->
  ?id:resource_id ->
  ?creator_request_id:creator_request_id ->
  ?modification_time:rfc3339_time_string ->
  ?creation_time:rfc3339_time_string ->
  ?arn:arn ->
  unit ->
  outpost_resolver

val make_update_outpost_resolver_response :
  ?outpost_resolver:outpost_resolver -> unit -> update_outpost_resolver_response

val make_update_outpost_resolver_request :
  ?preferred_instance_type:outpost_instance_type ->
  ?instance_count:instance_count ->
  ?name:outpost_resolver_name ->
  id:resource_id ->
  unit ->
  update_outpost_resolver_request

val make_partner_threat_protection_config :
  partner:partner_value -> unit -> partner_threat_protection_config

val make_firewall_advanced_content_category_config :
  category:firewall_advanced_content_category_value ->
  unit ->
  firewall_advanced_content_category_config

val make_firewall_advanced_threat_category_config :
  category:firewall_advanced_threat_category_value ->
  unit ->
  firewall_advanced_threat_category_config

val make_dns_threat_protection_rule_type_config :
  confidence_threshold:confidence_threshold ->
  value:dns_threat_protection_rule_type_value ->
  unit ->
  dns_threat_protection_rule_type_config

val make_firewall_rule_type :
  ?dns_threat_protection:dns_threat_protection_rule_type_config ->
  ?firewall_advanced_threat_category:firewall_advanced_threat_category_config ->
  ?firewall_advanced_content_category:firewall_advanced_content_category_config ->
  ?partner_threat_protection:partner_threat_protection_config ->
  unit ->
  firewall_rule_type

val make_firewall_rule :
  ?status_message:firewall_rule_status_message ->
  ?status:firewall_rule_status ->
  ?firewall_rule_type:firewall_rule_type ->
  ?confidence_threshold:confidence_threshold ->
  ?dns_threat_protection:dns_threat_protection ->
  ?qtype:qtype ->
  ?firewall_domain_redirection_action:firewall_domain_redirection_action ->
  ?modification_time:rfc3339_time_string ->
  ?creation_time:rfc3339_time_string ->
  ?creator_request_id:creator_request_id ->
  ?block_override_ttl:unsigned ->
  ?block_override_dns_type:block_override_dns_type ->
  ?block_override_domain:block_override_domain ->
  ?block_response:block_response ->
  ?action:action ->
  ?priority:priority ->
  ?name:name ->
  ?firewall_threat_protection_id:resource_id ->
  ?firewall_domain_list_id:resource_id ->
  ?firewall_rule_group_id:resource_id ->
  unit ->
  firewall_rule

val make_update_firewall_rule_response :
  ?firewall_rule:firewall_rule -> unit -> update_firewall_rule_response

val make_update_firewall_rule_request :
  ?firewall_rule_type:firewall_rule_type ->
  ?confidence_threshold:confidence_threshold ->
  ?dns_threat_protection:dns_threat_protection ->
  ?qtype:qtype ->
  ?firewall_domain_redirection_action:firewall_domain_redirection_action ->
  ?name:name ->
  ?block_override_ttl:block_override_ttl ->
  ?block_override_dns_type:block_override_dns_type ->
  ?block_override_domain:block_override_domain ->
  ?block_response:block_response ->
  ?action:action ->
  ?priority:priority ->
  ?firewall_threat_protection_id:resource_id ->
  ?firewall_domain_list_id:resource_id ->
  firewall_rule_group_id:resource_id ->
  unit ->
  update_firewall_rule_request

val make_firewall_rule_group_association :
  ?modification_time:rfc3339_time_string ->
  ?creation_time:rfc3339_time_string ->
  ?creator_request_id:creator_request_id ->
  ?status_message:status_message ->
  ?status:firewall_rule_group_association_status ->
  ?managed_owner_name:service_principle ->
  ?mutation_protection:mutation_protection_status ->
  ?priority:priority ->
  ?name:name ->
  ?vpc_id:resource_id ->
  ?firewall_rule_group_id:resource_id ->
  ?arn:arn ->
  ?id:resource_id ->
  unit ->
  firewall_rule_group_association

val make_update_firewall_rule_group_association_response :
  ?firewall_rule_group_association:firewall_rule_group_association ->
  unit ->
  update_firewall_rule_group_association_response

val make_update_firewall_rule_group_association_request :
  ?name:name ->
  ?mutation_protection:mutation_protection_status ->
  ?priority:priority ->
  firewall_rule_group_association_id:resource_id ->
  unit ->
  update_firewall_rule_group_association_request

val make_update_firewall_rule_entry :
  ?firewall_rule_type:firewall_rule_type ->
  ?confidence_threshold:confidence_threshold ->
  ?dns_threat_protection:dns_threat_protection ->
  ?qtype:qtype ->
  ?firewall_domain_redirection_action:firewall_domain_redirection_action ->
  ?name:name ->
  ?block_override_ttl:block_override_ttl ->
  ?block_override_dns_type:block_override_dns_type ->
  ?block_override_domain:block_override_domain ->
  ?block_response:block_response ->
  ?action:action ->
  ?priority:priority ->
  ?firewall_threat_protection_id:resource_id ->
  ?firewall_domain_list_id:resource_id ->
  firewall_rule_group_id:resource_id ->
  unit ->
  update_firewall_rule_entry

val make_update_firewall_domains_response :
  ?status_message:status_message ->
  ?status:firewall_domain_list_status ->
  ?name:name ->
  ?id:resource_id ->
  unit ->
  update_firewall_domains_response

val make_update_firewall_domains_request :
  domains:firewall_domains ->
  operation:firewall_domain_update_operation ->
  firewall_domain_list_id:resource_id ->
  unit ->
  update_firewall_domains_request

val make_firewall_config :
  ?firewall_fail_open:firewall_fail_open_status ->
  ?owner_id:account_id ->
  ?resource_id:resource_id ->
  ?id:resource_id ->
  unit ->
  firewall_config

val make_update_firewall_config_response :
  ?firewall_config:firewall_config -> unit -> update_firewall_config_response

val make_update_firewall_config_request :
  firewall_fail_open:firewall_fail_open_status ->
  resource_id:resource_id ->
  unit ->
  update_firewall_config_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:arn -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_request : tags:tag_list -> resource_arn:arn -> unit -> tag_resource_request

val make_subscription_info :
  ?product_id:product_id -> ?vendor_name:vendor_name -> unit -> subscription_info

val make_put_resolver_rule_policy_response :
  ?return_value:boolean_ -> unit -> put_resolver_rule_policy_response

val make_put_resolver_rule_policy_request :
  resolver_rule_policy:resolver_rule_policy -> arn:arn -> unit -> put_resolver_rule_policy_request

val make_put_resolver_query_log_config_policy_response :
  ?return_value:boolean_ -> unit -> put_resolver_query_log_config_policy_response

val make_put_resolver_query_log_config_policy_request :
  resolver_query_log_config_policy:resolver_query_log_config_policy ->
  arn:arn ->
  unit ->
  put_resolver_query_log_config_policy_request

val make_put_firewall_rule_group_policy_response :
  ?return_value:boolean_ -> unit -> put_firewall_rule_group_policy_response

val make_put_firewall_rule_group_policy_request :
  firewall_rule_group_policy:firewall_rule_group_policy ->
  arn:arn ->
  unit ->
  put_firewall_rule_group_policy_request

val make_list_tags_for_resource_response :
  ?next_token:next_token -> ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  resource_arn:arn ->
  unit ->
  list_tags_for_resource_request

val make_list_resolver_rules_response :
  ?resolver_rules:resolver_rules ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_resolver_rules_response

val make_filter : ?values:filter_values -> ?name:filter_name -> unit -> filter

val make_list_resolver_rules_request :
  ?filters:filters ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_resolver_rules_request

val make_resolver_rule_association :
  ?status_message:status_message ->
  ?status:resolver_rule_association_status ->
  ?vpc_id:resource_id ->
  ?name:name ->
  ?resolver_rule_id:resource_id ->
  ?id:resource_id ->
  unit ->
  resolver_rule_association

val make_list_resolver_rule_associations_response :
  ?resolver_rule_associations:resolver_rule_associations ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_resolver_rule_associations_response

val make_list_resolver_rule_associations_request :
  ?filters:filters ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_resolver_rule_associations_request

val make_resolver_query_log_config :
  ?creation_time:rfc3339_time_string ->
  ?creator_request_id:creator_request_id ->
  ?destination_arn:destination_arn ->
  ?name:resolver_query_log_config_name ->
  ?arn:arn ->
  ?association_count:count ->
  ?share_status:share_status ->
  ?status:resolver_query_log_config_status ->
  ?owner_id:account_id ->
  ?id:resource_id ->
  unit ->
  resolver_query_log_config

val make_list_resolver_query_log_configs_response :
  ?resolver_query_log_configs:resolver_query_log_config_list ->
  ?total_filtered_count:count ->
  ?total_count:count ->
  ?next_token:next_token ->
  unit ->
  list_resolver_query_log_configs_response

val make_list_resolver_query_log_configs_request :
  ?sort_order:sort_order ->
  ?sort_by:sort_by_key ->
  ?filters:filters ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_resolver_query_log_configs_request

val make_resolver_query_log_config_association :
  ?creation_time:rfc3339_time_string ->
  ?error_message:resolver_query_log_config_association_error_message ->
  ?error:resolver_query_log_config_association_error ->
  ?status:resolver_query_log_config_association_status ->
  ?resource_id:resource_id ->
  ?resolver_query_log_config_id:resource_id ->
  ?id:resource_id ->
  unit ->
  resolver_query_log_config_association

val make_list_resolver_query_log_config_associations_response :
  ?resolver_query_log_config_associations:resolver_query_log_config_association_list ->
  ?total_filtered_count:count ->
  ?total_count:count ->
  ?next_token:next_token ->
  unit ->
  list_resolver_query_log_config_associations_response

val make_list_resolver_query_log_config_associations_request :
  ?sort_order:sort_order ->
  ?sort_by:sort_by_key ->
  ?filters:filters ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_resolver_query_log_config_associations_request

val make_list_resolver_endpoints_response :
  ?resolver_endpoints:resolver_endpoints ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_resolver_endpoints_response

val make_list_resolver_endpoints_request :
  ?filters:filters ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_resolver_endpoints_request

val make_ip_address_response :
  ?modification_time:rfc3339_time_string ->
  ?creation_time:rfc3339_time_string ->
  ?status_message:status_message ->
  ?status:ip_address_status ->
  ?ipv6:ipv6 ->
  ?ip:ip ->
  ?subnet_id:subnet_id ->
  ?ip_id:resource_id ->
  unit ->
  ip_address_response

val make_list_resolver_endpoint_ip_addresses_response :
  ?ip_addresses:ip_addresses_response ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_resolver_endpoint_ip_addresses_response

val make_list_resolver_endpoint_ip_addresses_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  resolver_endpoint_id:resource_id ->
  unit ->
  list_resolver_endpoint_ip_addresses_request

val make_list_resolver_dnssec_configs_response :
  ?resolver_dnssec_configs:resolver_dnssec_config_list ->
  ?next_token:next_token ->
  unit ->
  list_resolver_dnssec_configs_response

val make_list_resolver_dnssec_configs_request :
  ?filters:filters ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_resolver_dnssec_configs_request

val make_list_resolver_configs_response :
  ?resolver_configs:resolver_config_list ->
  ?next_token:next_token ->
  unit ->
  list_resolver_configs_response

val make_list_resolver_configs_request :
  ?next_token:next_token ->
  ?max_results:list_resolver_configs_max_result ->
  unit ->
  list_resolver_configs_request

val make_list_outpost_resolvers_response :
  ?next_token:next_token ->
  ?outpost_resolvers:outpost_resolver_list ->
  unit ->
  list_outpost_resolvers_response

val make_list_outpost_resolvers_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?outpost_arn:outpost_arn ->
  unit ->
  list_outpost_resolvers_request

val make_firewall_rule_type_definition :
  ?subscription_info:subscription_info ->
  ?description:rule_type_description ->
  ?display_name:display_name ->
  ?value:rule_type_value ->
  ?rule_type:rule_type_name ->
  unit ->
  firewall_rule_type_definition

val make_list_firewall_rule_types_response :
  ?next_token:next_token ->
  ?firewall_rule_types:firewall_rule_type_definitions ->
  unit ->
  list_firewall_rule_types_response

val make_list_firewall_rule_types_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?rule_type:rule_type_name ->
  unit ->
  list_firewall_rule_types_request

val make_list_firewall_rules_response :
  ?firewall_rules:firewall_rules -> ?next_token:next_token -> unit -> list_firewall_rules_response

val make_list_firewall_rules_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?action:action ->
  ?priority:priority ->
  firewall_rule_group_id:resource_id ->
  unit ->
  list_firewall_rules_request

val make_firewall_rule_group_metadata :
  ?share_status:share_status ->
  ?creator_request_id:creator_request_id ->
  ?owner_id:account_id ->
  ?name:name ->
  ?arn:arn ->
  ?id:resource_id ->
  unit ->
  firewall_rule_group_metadata

val make_list_firewall_rule_groups_response :
  ?firewall_rule_groups:firewall_rule_group_metadata_list ->
  ?next_token:next_token ->
  unit ->
  list_firewall_rule_groups_response

val make_list_firewall_rule_groups_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_firewall_rule_groups_request

val make_list_firewall_rule_group_associations_response :
  ?firewall_rule_group_associations:firewall_rule_group_associations ->
  ?next_token:next_token ->
  unit ->
  list_firewall_rule_group_associations_response

val make_list_firewall_rule_group_associations_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?status:firewall_rule_group_association_status ->
  ?priority:priority ->
  ?vpc_id:resource_id ->
  ?firewall_rule_group_id:resource_id ->
  unit ->
  list_firewall_rule_group_associations_request

val make_list_firewall_domains_response :
  ?domains:firewall_domains -> ?next_token:next_token -> unit -> list_firewall_domains_response

val make_list_firewall_domains_request :
  ?next_token:next_token ->
  ?max_results:list_domain_max_results ->
  firewall_domain_list_id:resource_id ->
  unit ->
  list_firewall_domains_request

val make_firewall_domain_list_metadata :
  ?category:category ->
  ?managed_list_type:domain_list_type ->
  ?managed_owner_name:service_principle ->
  ?creator_request_id:creator_request_id ->
  ?name:name ->
  ?arn:arn ->
  ?id:resource_id ->
  unit ->
  firewall_domain_list_metadata

val make_list_firewall_domain_lists_response :
  ?firewall_domain_lists:firewall_domain_list_metadata_list ->
  ?next_token:next_token ->
  unit ->
  list_firewall_domain_lists_response

val make_list_firewall_domain_lists_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_firewall_domain_lists_request

val make_list_firewall_configs_response :
  ?firewall_configs:firewall_config_list ->
  ?next_token:next_token ->
  unit ->
  list_firewall_configs_response

val make_list_firewall_configs_request :
  ?next_token:next_token ->
  ?max_results:list_firewall_configs_max_result ->
  unit ->
  list_firewall_configs_request

val make_import_firewall_domains_response :
  ?status_message:status_message ->
  ?status:firewall_domain_list_status ->
  ?name:name ->
  ?id:resource_id ->
  unit ->
  import_firewall_domains_response

val make_import_firewall_domains_request :
  domain_file_url:domain_list_file_url ->
  operation:firewall_domain_import_operation ->
  firewall_domain_list_id:resource_id ->
  unit ->
  import_firewall_domains_request

val make_get_resolver_rule_policy_response :
  ?resolver_rule_policy:resolver_rule_policy -> unit -> get_resolver_rule_policy_response

val make_get_resolver_rule_policy_request : arn:arn -> unit -> get_resolver_rule_policy_request

val make_get_resolver_rule_association_response :
  ?resolver_rule_association:resolver_rule_association ->
  unit ->
  get_resolver_rule_association_response

val make_get_resolver_rule_association_request :
  resolver_rule_association_id:resource_id -> unit -> get_resolver_rule_association_request

val make_get_resolver_rule_response :
  ?resolver_rule:resolver_rule -> unit -> get_resolver_rule_response

val make_get_resolver_rule_request :
  resolver_rule_id:resource_id -> unit -> get_resolver_rule_request

val make_get_resolver_query_log_config_policy_response :
  ?resolver_query_log_config_policy:resolver_query_log_config_policy ->
  unit ->
  get_resolver_query_log_config_policy_response

val make_get_resolver_query_log_config_policy_request :
  arn:arn -> unit -> get_resolver_query_log_config_policy_request

val make_get_resolver_query_log_config_association_response :
  ?resolver_query_log_config_association:resolver_query_log_config_association ->
  unit ->
  get_resolver_query_log_config_association_response

val make_get_resolver_query_log_config_association_request :
  resolver_query_log_config_association_id:resource_id ->
  unit ->
  get_resolver_query_log_config_association_request

val make_get_resolver_query_log_config_response :
  ?resolver_query_log_config:resolver_query_log_config ->
  unit ->
  get_resolver_query_log_config_response

val make_get_resolver_query_log_config_request :
  resolver_query_log_config_id:resource_id -> unit -> get_resolver_query_log_config_request

val make_get_resolver_endpoint_response :
  ?resolver_endpoint:resolver_endpoint -> unit -> get_resolver_endpoint_response

val make_get_resolver_endpoint_request :
  resolver_endpoint_id:resource_id -> unit -> get_resolver_endpoint_request

val make_get_resolver_dnssec_config_response :
  ?resolver_dnssec_config:resolver_dnssec_config -> unit -> get_resolver_dnssec_config_response

val make_get_resolver_dnssec_config_request :
  resource_id:resource_id -> unit -> get_resolver_dnssec_config_request

val make_get_resolver_config_response :
  ?resolver_config:resolver_config -> unit -> get_resolver_config_response

val make_get_resolver_config_request :
  resource_id:resource_id -> unit -> get_resolver_config_request

val make_get_outpost_resolver_response :
  ?outpost_resolver:outpost_resolver -> unit -> get_outpost_resolver_response

val make_get_outpost_resolver_request : id:resource_id -> unit -> get_outpost_resolver_request

val make_get_firewall_rule_group_policy_response :
  ?firewall_rule_group_policy:firewall_rule_group_policy ->
  unit ->
  get_firewall_rule_group_policy_response

val make_get_firewall_rule_group_policy_request :
  arn:arn -> unit -> get_firewall_rule_group_policy_request

val make_get_firewall_rule_group_association_response :
  ?firewall_rule_group_association:firewall_rule_group_association ->
  unit ->
  get_firewall_rule_group_association_response

val make_get_firewall_rule_group_association_request :
  firewall_rule_group_association_id:resource_id ->
  unit ->
  get_firewall_rule_group_association_request

val make_firewall_rule_group :
  ?modification_time:rfc3339_time_string ->
  ?creation_time:rfc3339_time_string ->
  ?share_status:share_status ->
  ?creator_request_id:creator_request_id ->
  ?owner_id:account_id ->
  ?status_message:status_message ->
  ?status:firewall_rule_group_status ->
  ?rule_count:unsigned ->
  ?name:name ->
  ?arn:arn ->
  ?id:resource_id ->
  unit ->
  firewall_rule_group

val make_get_firewall_rule_group_response :
  ?firewall_rule_group:firewall_rule_group -> unit -> get_firewall_rule_group_response

val make_get_firewall_rule_group_request :
  firewall_rule_group_id:resource_id -> unit -> get_firewall_rule_group_request

val make_firewall_domain_list :
  ?managed_list_type:domain_list_type ->
  ?category:category ->
  ?modification_time:rfc3339_time_string ->
  ?creation_time:rfc3339_time_string ->
  ?creator_request_id:creator_request_id ->
  ?managed_owner_name:service_principle ->
  ?status_message:status_message ->
  ?status:firewall_domain_list_status ->
  ?domain_count:unsigned ->
  ?name:name ->
  ?arn:arn ->
  ?id:resource_id ->
  unit ->
  firewall_domain_list

val make_get_firewall_domain_list_response :
  ?firewall_domain_list:firewall_domain_list -> unit -> get_firewall_domain_list_response

val make_get_firewall_domain_list_request :
  firewall_domain_list_id:resource_id -> unit -> get_firewall_domain_list_request

val make_get_firewall_config_response :
  ?firewall_config:firewall_config -> unit -> get_firewall_config_response

val make_get_firewall_config_request :
  resource_id:resource_id -> unit -> get_firewall_config_request

val make_disassociate_resolver_rule_response :
  ?resolver_rule_association:resolver_rule_association ->
  unit ->
  disassociate_resolver_rule_response

val make_disassociate_resolver_rule_request :
  resolver_rule_id:resource_id -> vpc_id:resource_id -> unit -> disassociate_resolver_rule_request

val make_disassociate_resolver_query_log_config_response :
  ?resolver_query_log_config_association:resolver_query_log_config_association ->
  unit ->
  disassociate_resolver_query_log_config_response

val make_disassociate_resolver_query_log_config_request :
  resource_id:resource_id ->
  resolver_query_log_config_id:resource_id ->
  unit ->
  disassociate_resolver_query_log_config_request

val make_disassociate_resolver_endpoint_ip_address_response :
  ?resolver_endpoint:resolver_endpoint -> unit -> disassociate_resolver_endpoint_ip_address_response

val make_ip_address_update :
  ?ipv6:ipv6 -> ?ip:ip -> ?subnet_id:subnet_id -> ?ip_id:resource_id -> unit -> ip_address_update

val make_disassociate_resolver_endpoint_ip_address_request :
  ip_address:ip_address_update ->
  resolver_endpoint_id:resource_id ->
  unit ->
  disassociate_resolver_endpoint_ip_address_request

val make_disassociate_firewall_rule_group_response :
  ?firewall_rule_group_association:firewall_rule_group_association ->
  unit ->
  disassociate_firewall_rule_group_response

val make_disassociate_firewall_rule_group_request :
  firewall_rule_group_association_id:resource_id -> unit -> disassociate_firewall_rule_group_request

val make_delete_resolver_rule_response :
  ?resolver_rule:resolver_rule -> unit -> delete_resolver_rule_response

val make_delete_resolver_rule_request :
  resolver_rule_id:resource_id -> unit -> delete_resolver_rule_request

val make_delete_resolver_query_log_config_response :
  ?resolver_query_log_config:resolver_query_log_config ->
  unit ->
  delete_resolver_query_log_config_response

val make_delete_resolver_query_log_config_request :
  resolver_query_log_config_id:resource_id -> unit -> delete_resolver_query_log_config_request

val make_delete_resolver_endpoint_response :
  ?resolver_endpoint:resolver_endpoint -> unit -> delete_resolver_endpoint_response

val make_delete_resolver_endpoint_request :
  resolver_endpoint_id:resource_id -> unit -> delete_resolver_endpoint_request

val make_delete_outpost_resolver_response :
  ?outpost_resolver:outpost_resolver -> unit -> delete_outpost_resolver_response

val make_delete_outpost_resolver_request : id:resource_id -> unit -> delete_outpost_resolver_request

val make_delete_firewall_rule_group_response :
  ?firewall_rule_group:firewall_rule_group -> unit -> delete_firewall_rule_group_response

val make_delete_firewall_rule_group_request :
  firewall_rule_group_id:resource_id -> unit -> delete_firewall_rule_group_request

val make_delete_firewall_rule_response :
  ?firewall_rule:firewall_rule -> unit -> delete_firewall_rule_response

val make_delete_firewall_rule_request :
  ?qtype:qtype ->
  ?firewall_threat_protection_id:resource_id ->
  ?firewall_domain_list_id:resource_id ->
  firewall_rule_group_id:resource_id ->
  unit ->
  delete_firewall_rule_request

val make_delete_firewall_domain_list_response :
  ?firewall_domain_list:firewall_domain_list -> unit -> delete_firewall_domain_list_response

val make_delete_firewall_domain_list_request :
  firewall_domain_list_id:resource_id -> unit -> delete_firewall_domain_list_request

val make_create_resolver_rule_response :
  ?resolver_rule:resolver_rule -> unit -> create_resolver_rule_response

val make_create_resolver_rule_request :
  ?delegation_record:delegation_record ->
  ?tags:tag_list ->
  ?resolver_endpoint_id:resource_id ->
  ?target_ips:target_list ->
  ?domain_name:domain_name ->
  ?name:name ->
  rule_type:rule_type_option ->
  creator_request_id:creator_request_id ->
  unit ->
  create_resolver_rule_request

val make_create_resolver_query_log_config_response :
  ?resolver_query_log_config:resolver_query_log_config ->
  unit ->
  create_resolver_query_log_config_response

val make_create_resolver_query_log_config_request :
  ?tags:tag_list ->
  creator_request_id:creator_request_id ->
  destination_arn:destination_arn ->
  name:resolver_query_log_config_name ->
  unit ->
  create_resolver_query_log_config_request

val make_create_resolver_endpoint_response :
  ?resolver_endpoint:resolver_endpoint -> unit -> create_resolver_endpoint_response

val make_ip_address_request :
  ?ipv6:ipv6 -> ?ip:ip -> subnet_id:subnet_id -> unit -> ip_address_request

val make_create_resolver_endpoint_request :
  ?ipv6_internet_access_enabled:ipv6_internet_access_enabled ->
  ?dns64_enabled:dns64_enabled ->
  ?target_name_server_metrics_enabled:target_name_server_metrics_enabled ->
  ?rni_enhanced_metrics_enabled:rni_enhanced_metrics_enabled ->
  ?protocols:protocol_list ->
  ?resolver_endpoint_type:resolver_endpoint_type ->
  ?tags:tag_list ->
  ?preferred_instance_type:outpost_instance_type ->
  ?outpost_arn:outpost_arn ->
  ?name:name ->
  ip_addresses:ip_addresses_request ->
  direction:resolver_endpoint_direction ->
  security_group_ids:security_group_ids ->
  creator_request_id:creator_request_id ->
  unit ->
  create_resolver_endpoint_request

val make_create_outpost_resolver_response :
  ?outpost_resolver:outpost_resolver -> unit -> create_outpost_resolver_response

val make_create_outpost_resolver_request :
  ?tags:tag_list ->
  ?instance_count:instance_count ->
  outpost_arn:outpost_arn ->
  preferred_instance_type:outpost_instance_type ->
  name:outpost_resolver_name ->
  creator_request_id:creator_request_id ->
  unit ->
  create_outpost_resolver_request

val make_create_firewall_rule_group_response :
  ?firewall_rule_group:firewall_rule_group -> unit -> create_firewall_rule_group_response

val make_create_firewall_rule_group_request :
  ?tags:tag_list ->
  name:name ->
  creator_request_id:creator_request_id ->
  unit ->
  create_firewall_rule_group_request

val make_create_firewall_rule_response :
  ?firewall_rule:firewall_rule -> unit -> create_firewall_rule_response

val make_create_firewall_rule_request :
  ?firewall_rule_type:firewall_rule_type ->
  ?confidence_threshold:confidence_threshold ->
  ?dns_threat_protection:dns_threat_protection ->
  ?qtype:qtype ->
  ?firewall_domain_redirection_action:firewall_domain_redirection_action ->
  ?block_override_ttl:block_override_ttl ->
  ?block_override_dns_type:block_override_dns_type ->
  ?block_override_domain:block_override_domain ->
  ?block_response:block_response ->
  ?firewall_domain_list_id:resource_id ->
  name:name ->
  action:action ->
  priority:priority ->
  firewall_rule_group_id:resource_id ->
  creator_request_id:creator_request_id ->
  unit ->
  create_firewall_rule_request

val make_create_firewall_domain_list_response :
  ?firewall_domain_list:firewall_domain_list -> unit -> create_firewall_domain_list_response

val make_create_firewall_domain_list_request :
  ?tags:tag_list ->
  name:name ->
  creator_request_id:creator_request_id ->
  unit ->
  create_firewall_domain_list_request

val make_batch_update_firewall_rule_error :
  ?message:string_ ->
  ?code:string_ ->
  ?firewall_rule:update_firewall_rule_entry ->
  unit ->
  batch_update_firewall_rule_error

val make_batch_update_firewall_rule_response :
  ?update_errors:batch_update_firewall_rule_errors ->
  ?updated_firewall_rules:firewall_rules ->
  unit ->
  batch_update_firewall_rule_response

val make_batch_update_firewall_rule_request :
  update_firewall_rule_entries:update_firewall_rule_entries ->
  unit ->
  batch_update_firewall_rule_request

val make_delete_firewall_rule_entry :
  ?qtype:qtype ->
  ?firewall_threat_protection_id:resource_id ->
  ?firewall_domain_list_id:resource_id ->
  firewall_rule_group_id:resource_id ->
  unit ->
  delete_firewall_rule_entry

val make_batch_delete_firewall_rule_error :
  ?message:string_ ->
  ?code:string_ ->
  ?firewall_rule:delete_firewall_rule_entry ->
  unit ->
  batch_delete_firewall_rule_error

val make_batch_delete_firewall_rule_response :
  ?delete_errors:batch_delete_firewall_rule_errors ->
  ?deleted_firewall_rules:firewall_rules ->
  unit ->
  batch_delete_firewall_rule_response

val make_batch_delete_firewall_rule_request :
  delete_firewall_rule_entries:delete_firewall_rule_entries ->
  unit ->
  batch_delete_firewall_rule_request

val make_create_firewall_rule_entry :
  ?firewall_rule_type:firewall_rule_type ->
  ?confidence_threshold:confidence_threshold ->
  ?dns_threat_protection:dns_threat_protection ->
  ?qtype:qtype ->
  ?firewall_domain_redirection_action:firewall_domain_redirection_action ->
  ?block_override_ttl:block_override_ttl ->
  ?block_override_dns_type:block_override_dns_type ->
  ?block_override_domain:block_override_domain ->
  ?block_response:block_response ->
  ?firewall_domain_list_id:resource_id ->
  name:name ->
  action:action ->
  priority:priority ->
  firewall_rule_group_id:resource_id ->
  creator_request_id:creator_request_id ->
  unit ->
  create_firewall_rule_entry

val make_batch_create_firewall_rule_error :
  ?message:string_ ->
  ?code:string_ ->
  ?firewall_rule:create_firewall_rule_entry ->
  unit ->
  batch_create_firewall_rule_error

val make_batch_create_firewall_rule_response :
  ?create_errors:batch_create_firewall_rule_errors ->
  ?created_firewall_rules:firewall_rules ->
  unit ->
  batch_create_firewall_rule_response

val make_batch_create_firewall_rule_request :
  create_firewall_rule_entries:create_firewall_rule_entries ->
  unit ->
  batch_create_firewall_rule_request

val make_associate_resolver_rule_response :
  ?resolver_rule_association:resolver_rule_association -> unit -> associate_resolver_rule_response

val make_associate_resolver_rule_request :
  ?name:name ->
  vpc_id:resource_id ->
  resolver_rule_id:resource_id ->
  unit ->
  associate_resolver_rule_request

val make_associate_resolver_query_log_config_response :
  ?resolver_query_log_config_association:resolver_query_log_config_association ->
  unit ->
  associate_resolver_query_log_config_response

val make_associate_resolver_query_log_config_request :
  resource_id:resource_id ->
  resolver_query_log_config_id:resource_id ->
  unit ->
  associate_resolver_query_log_config_request

val make_associate_resolver_endpoint_ip_address_response :
  ?resolver_endpoint:resolver_endpoint -> unit -> associate_resolver_endpoint_ip_address_response

val make_associate_resolver_endpoint_ip_address_request :
  ip_address:ip_address_update ->
  resolver_endpoint_id:resource_id ->
  unit ->
  associate_resolver_endpoint_ip_address_request

val make_associate_firewall_rule_group_response :
  ?firewall_rule_group_association:firewall_rule_group_association ->
  unit ->
  associate_firewall_rule_group_response

val make_associate_firewall_rule_group_request :
  ?tags:tag_list ->
  ?mutation_protection:mutation_protection_status ->
  name:name ->
  priority:priority ->
  vpc_id:resource_id ->
  firewall_rule_group_id:resource_id ->
  creator_request_id:creator_request_id ->
  unit ->
  associate_firewall_rule_group_request
