open Types

val make_firewall_rule_group_association :
  ?id:resource_id ->
  ?arn:arn ->
  ?firewall_rule_group_id:resource_id ->
  ?vpc_id:resource_id ->
  ?name:name ->
  ?priority:priority ->
  ?mutation_protection:mutation_protection_status ->
  ?managed_owner_name:service_principle ->
  ?status:firewall_rule_group_association_status ->
  ?status_message:status_message ->
  ?creator_request_id:creator_request_id ->
  ?creation_time:rfc3339_time_string ->
  ?modification_time:rfc3339_time_string ->
  unit ->
  firewall_rule_group_association

val make_associate_firewall_rule_group_response :
  ?firewall_rule_group_association:firewall_rule_group_association ->
  unit ->
  associate_firewall_rule_group_response

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_associate_firewall_rule_group_request :
  ?mutation_protection:mutation_protection_status ->
  ?tags:tag_list ->
  creator_request_id:creator_request_id ->
  firewall_rule_group_id:resource_id ->
  vpc_id:resource_id ->
  priority:priority ->
  name:name ->
  unit ->
  associate_firewall_rule_group_request

val make_resolver_endpoint :
  ?id:resource_id ->
  ?creator_request_id:creator_request_id ->
  ?arn:arn ->
  ?name:name ->
  ?security_group_ids:security_group_ids ->
  ?direction:resolver_endpoint_direction ->
  ?ip_address_count:ip_address_count ->
  ?host_vpc_id:resource_id ->
  ?status:resolver_endpoint_status ->
  ?status_message:status_message ->
  ?creation_time:rfc3339_time_string ->
  ?modification_time:rfc3339_time_string ->
  ?outpost_arn:outpost_arn ->
  ?preferred_instance_type:outpost_instance_type ->
  ?resolver_endpoint_type:resolver_endpoint_type ->
  ?protocols:protocol_list ->
  ?rni_enhanced_metrics_enabled:rni_enhanced_metrics_enabled ->
  ?target_name_server_metrics_enabled:target_name_server_metrics_enabled ->
  ?dns64_enabled:dns64_enabled ->
  ?ipv6_internet_access_enabled:ipv6_internet_access_enabled ->
  unit ->
  resolver_endpoint

val make_associate_resolver_endpoint_ip_address_response :
  ?resolver_endpoint:resolver_endpoint -> unit -> associate_resolver_endpoint_ip_address_response

val make_ip_address_update :
  ?ip_id:resource_id -> ?subnet_id:subnet_id -> ?ip:ip -> ?ipv6:ipv6 -> unit -> ip_address_update

val make_associate_resolver_endpoint_ip_address_request :
  resolver_endpoint_id:resource_id ->
  ip_address:ip_address_update ->
  unit ->
  associate_resolver_endpoint_ip_address_request

val make_resolver_query_log_config_association :
  ?id:resource_id ->
  ?resolver_query_log_config_id:resource_id ->
  ?resource_id:resource_id ->
  ?status:resolver_query_log_config_association_status ->
  ?error:resolver_query_log_config_association_error ->
  ?error_message:resolver_query_log_config_association_error_message ->
  ?creation_time:rfc3339_time_string ->
  unit ->
  resolver_query_log_config_association

val make_associate_resolver_query_log_config_response :
  ?resolver_query_log_config_association:resolver_query_log_config_association ->
  unit ->
  associate_resolver_query_log_config_response

val make_associate_resolver_query_log_config_request :
  resolver_query_log_config_id:resource_id ->
  resource_id:resource_id ->
  unit ->
  associate_resolver_query_log_config_request

val make_resolver_rule_association :
  ?id:resource_id ->
  ?resolver_rule_id:resource_id ->
  ?name:name ->
  ?vpc_id:resource_id ->
  ?status:resolver_rule_association_status ->
  ?status_message:status_message ->
  unit ->
  resolver_rule_association

val make_associate_resolver_rule_response :
  ?resolver_rule_association:resolver_rule_association -> unit -> associate_resolver_rule_response

val make_associate_resolver_rule_request :
  ?name:name ->
  resolver_rule_id:resource_id ->
  vpc_id:resource_id ->
  unit ->
  associate_resolver_rule_request

val make_dns_threat_protection_rule_type_config :
  value:dns_threat_protection_rule_type_value ->
  confidence_threshold:confidence_threshold ->
  unit ->
  dns_threat_protection_rule_type_config

val make_firewall_advanced_threat_category_config :
  category:firewall_advanced_threat_category_value ->
  unit ->
  firewall_advanced_threat_category_config

val make_firewall_advanced_content_category_config :
  category:firewall_advanced_content_category_value ->
  unit ->
  firewall_advanced_content_category_config

val make_partner_threat_protection_config :
  partner:partner_value -> unit -> partner_threat_protection_config

val make_firewall_rule_type :
  ?partner_threat_protection:partner_threat_protection_config ->
  ?firewall_advanced_content_category:firewall_advanced_content_category_config ->
  ?firewall_advanced_threat_category:firewall_advanced_threat_category_config ->
  ?dns_threat_protection:dns_threat_protection_rule_type_config ->
  unit ->
  firewall_rule_type

val make_create_firewall_rule_entry :
  ?firewall_domain_list_id:resource_id ->
  ?block_response:block_response ->
  ?block_override_domain:block_override_domain ->
  ?block_override_dns_type:block_override_dns_type ->
  ?block_override_ttl:block_override_ttl ->
  ?firewall_domain_redirection_action:firewall_domain_redirection_action ->
  ?qtype:qtype ->
  ?dns_threat_protection:dns_threat_protection ->
  ?confidence_threshold:confidence_threshold ->
  ?firewall_rule_type:firewall_rule_type ->
  creator_request_id:creator_request_id ->
  firewall_rule_group_id:resource_id ->
  priority:priority ->
  action:action ->
  name:name ->
  unit ->
  create_firewall_rule_entry

val make_batch_create_firewall_rule_error :
  ?firewall_rule:create_firewall_rule_entry ->
  ?code:string_ ->
  ?message:string_ ->
  unit ->
  batch_create_firewall_rule_error

val make_firewall_rule :
  ?firewall_rule_group_id:resource_id ->
  ?firewall_domain_list_id:resource_id ->
  ?firewall_threat_protection_id:resource_id ->
  ?name:name ->
  ?priority:priority ->
  ?action:action ->
  ?block_response:block_response ->
  ?block_override_domain:block_override_domain ->
  ?block_override_dns_type:block_override_dns_type ->
  ?block_override_ttl:unsigned ->
  ?creator_request_id:creator_request_id ->
  ?creation_time:rfc3339_time_string ->
  ?modification_time:rfc3339_time_string ->
  ?firewall_domain_redirection_action:firewall_domain_redirection_action ->
  ?qtype:qtype ->
  ?dns_threat_protection:dns_threat_protection ->
  ?confidence_threshold:confidence_threshold ->
  ?firewall_rule_type:firewall_rule_type ->
  ?status:firewall_rule_status ->
  ?status_message:firewall_rule_status_message ->
  unit ->
  firewall_rule

val make_batch_create_firewall_rule_response :
  ?created_firewall_rules:firewall_rules ->
  ?create_errors:batch_create_firewall_rule_errors ->
  unit ->
  batch_create_firewall_rule_response

val make_batch_create_firewall_rule_request :
  create_firewall_rule_entries:create_firewall_rule_entries ->
  unit ->
  batch_create_firewall_rule_request

val make_delete_firewall_rule_entry :
  ?firewall_domain_list_id:resource_id ->
  ?firewall_threat_protection_id:resource_id ->
  ?qtype:qtype ->
  firewall_rule_group_id:resource_id ->
  unit ->
  delete_firewall_rule_entry

val make_batch_delete_firewall_rule_error :
  ?firewall_rule:delete_firewall_rule_entry ->
  ?code:string_ ->
  ?message:string_ ->
  unit ->
  batch_delete_firewall_rule_error

val make_batch_delete_firewall_rule_response :
  ?deleted_firewall_rules:firewall_rules ->
  ?delete_errors:batch_delete_firewall_rule_errors ->
  unit ->
  batch_delete_firewall_rule_response

val make_batch_delete_firewall_rule_request :
  delete_firewall_rule_entries:delete_firewall_rule_entries ->
  unit ->
  batch_delete_firewall_rule_request

val make_update_firewall_rule_entry :
  ?firewall_domain_list_id:resource_id ->
  ?firewall_threat_protection_id:resource_id ->
  ?priority:priority ->
  ?action:action ->
  ?block_response:block_response ->
  ?block_override_domain:block_override_domain ->
  ?block_override_dns_type:block_override_dns_type ->
  ?block_override_ttl:block_override_ttl ->
  ?name:name ->
  ?firewall_domain_redirection_action:firewall_domain_redirection_action ->
  ?qtype:qtype ->
  ?dns_threat_protection:dns_threat_protection ->
  ?confidence_threshold:confidence_threshold ->
  ?firewall_rule_type:firewall_rule_type ->
  firewall_rule_group_id:resource_id ->
  unit ->
  update_firewall_rule_entry

val make_batch_update_firewall_rule_error :
  ?firewall_rule:update_firewall_rule_entry ->
  ?code:string_ ->
  ?message:string_ ->
  unit ->
  batch_update_firewall_rule_error

val make_batch_update_firewall_rule_response :
  ?updated_firewall_rules:firewall_rules ->
  ?update_errors:batch_update_firewall_rule_errors ->
  unit ->
  batch_update_firewall_rule_response

val make_batch_update_firewall_rule_request :
  update_firewall_rule_entries:update_firewall_rule_entries ->
  unit ->
  batch_update_firewall_rule_request

val make_firewall_domain_list :
  ?id:resource_id ->
  ?arn:arn ->
  ?name:name ->
  ?domain_count:unsigned ->
  ?status:firewall_domain_list_status ->
  ?status_message:status_message ->
  ?managed_owner_name:service_principle ->
  ?creator_request_id:creator_request_id ->
  ?creation_time:rfc3339_time_string ->
  ?modification_time:rfc3339_time_string ->
  ?category:category ->
  ?managed_list_type:domain_list_type ->
  unit ->
  firewall_domain_list

val make_create_firewall_domain_list_response :
  ?firewall_domain_list:firewall_domain_list -> unit -> create_firewall_domain_list_response

val make_create_firewall_domain_list_request :
  ?tags:tag_list ->
  creator_request_id:creator_request_id ->
  name:name ->
  unit ->
  create_firewall_domain_list_request

val make_create_firewall_rule_response :
  ?firewall_rule:firewall_rule -> unit -> create_firewall_rule_response

val make_create_firewall_rule_request :
  ?firewall_domain_list_id:resource_id ->
  ?block_response:block_response ->
  ?block_override_domain:block_override_domain ->
  ?block_override_dns_type:block_override_dns_type ->
  ?block_override_ttl:block_override_ttl ->
  ?firewall_domain_redirection_action:firewall_domain_redirection_action ->
  ?qtype:qtype ->
  ?dns_threat_protection:dns_threat_protection ->
  ?confidence_threshold:confidence_threshold ->
  ?firewall_rule_type:firewall_rule_type ->
  creator_request_id:creator_request_id ->
  firewall_rule_group_id:resource_id ->
  priority:priority ->
  action:action ->
  name:name ->
  unit ->
  create_firewall_rule_request

val make_firewall_rule_group :
  ?id:resource_id ->
  ?arn:arn ->
  ?name:name ->
  ?rule_count:unsigned ->
  ?status:firewall_rule_group_status ->
  ?status_message:status_message ->
  ?owner_id:account_id ->
  ?creator_request_id:creator_request_id ->
  ?share_status:share_status ->
  ?creation_time:rfc3339_time_string ->
  ?modification_time:rfc3339_time_string ->
  unit ->
  firewall_rule_group

val make_create_firewall_rule_group_response :
  ?firewall_rule_group:firewall_rule_group -> unit -> create_firewall_rule_group_response

val make_create_firewall_rule_group_request :
  ?tags:tag_list ->
  creator_request_id:creator_request_id ->
  name:name ->
  unit ->
  create_firewall_rule_group_request

val make_outpost_resolver :
  ?arn:arn ->
  ?creation_time:rfc3339_time_string ->
  ?modification_time:rfc3339_time_string ->
  ?creator_request_id:creator_request_id ->
  ?id:resource_id ->
  ?instance_count:instance_count ->
  ?preferred_instance_type:outpost_instance_type ->
  ?name:outpost_resolver_name ->
  ?status:outpost_resolver_status ->
  ?status_message:outpost_resolver_status_message ->
  ?outpost_arn:outpost_arn ->
  unit ->
  outpost_resolver

val make_create_outpost_resolver_response :
  ?outpost_resolver:outpost_resolver -> unit -> create_outpost_resolver_response

val make_create_outpost_resolver_request :
  ?instance_count:instance_count ->
  ?tags:tag_list ->
  creator_request_id:creator_request_id ->
  name:outpost_resolver_name ->
  preferred_instance_type:outpost_instance_type ->
  outpost_arn:outpost_arn ->
  unit ->
  create_outpost_resolver_request

val make_create_resolver_endpoint_response :
  ?resolver_endpoint:resolver_endpoint -> unit -> create_resolver_endpoint_response

val make_ip_address_request :
  ?ip:ip -> ?ipv6:ipv6 -> subnet_id:subnet_id -> unit -> ip_address_request

val make_create_resolver_endpoint_request :
  ?name:name ->
  ?outpost_arn:outpost_arn ->
  ?preferred_instance_type:outpost_instance_type ->
  ?tags:tag_list ->
  ?resolver_endpoint_type:resolver_endpoint_type ->
  ?protocols:protocol_list ->
  ?rni_enhanced_metrics_enabled:rni_enhanced_metrics_enabled ->
  ?target_name_server_metrics_enabled:target_name_server_metrics_enabled ->
  ?dns64_enabled:dns64_enabled ->
  ?ipv6_internet_access_enabled:ipv6_internet_access_enabled ->
  creator_request_id:creator_request_id ->
  security_group_ids:security_group_ids ->
  direction:resolver_endpoint_direction ->
  ip_addresses:ip_addresses_request ->
  unit ->
  create_resolver_endpoint_request

val make_resolver_query_log_config :
  ?id:resource_id ->
  ?owner_id:account_id ->
  ?status:resolver_query_log_config_status ->
  ?share_status:share_status ->
  ?association_count:count ->
  ?arn:arn ->
  ?name:resolver_query_log_config_name ->
  ?destination_arn:destination_arn ->
  ?creator_request_id:creator_request_id ->
  ?creation_time:rfc3339_time_string ->
  unit ->
  resolver_query_log_config

val make_create_resolver_query_log_config_response :
  ?resolver_query_log_config:resolver_query_log_config ->
  unit ->
  create_resolver_query_log_config_response

val make_create_resolver_query_log_config_request :
  ?tags:tag_list ->
  name:resolver_query_log_config_name ->
  destination_arn:destination_arn ->
  creator_request_id:creator_request_id ->
  unit ->
  create_resolver_query_log_config_request

val make_target_address :
  ?ip:ip ->
  ?port:port ->
  ?ipv6:ipv6 ->
  ?protocol:protocol ->
  ?server_name_indication:server_name_indication ->
  unit ->
  target_address

val make_resolver_rule :
  ?id:resource_id ->
  ?creator_request_id:creator_request_id ->
  ?arn:arn ->
  ?domain_name:domain_name ->
  ?status:resolver_rule_status ->
  ?status_message:status_message ->
  ?rule_type:rule_type_option ->
  ?name:name ->
  ?target_ips:target_list ->
  ?resolver_endpoint_id:resource_id ->
  ?owner_id:account_id ->
  ?share_status:share_status ->
  ?creation_time:rfc3339_time_string ->
  ?modification_time:rfc3339_time_string ->
  ?delegation_record:delegation_record ->
  unit ->
  resolver_rule

val make_create_resolver_rule_response :
  ?resolver_rule:resolver_rule -> unit -> create_resolver_rule_response

val make_create_resolver_rule_request :
  ?name:name ->
  ?domain_name:domain_name ->
  ?target_ips:target_list ->
  ?resolver_endpoint_id:resource_id ->
  ?tags:tag_list ->
  ?delegation_record:delegation_record ->
  creator_request_id:creator_request_id ->
  rule_type:rule_type_option ->
  unit ->
  create_resolver_rule_request

val make_delete_firewall_domain_list_response :
  ?firewall_domain_list:firewall_domain_list -> unit -> delete_firewall_domain_list_response

val make_delete_firewall_domain_list_request :
  firewall_domain_list_id:resource_id -> unit -> delete_firewall_domain_list_request

val make_delete_firewall_rule_response :
  ?firewall_rule:firewall_rule -> unit -> delete_firewall_rule_response

val make_delete_firewall_rule_request :
  ?firewall_domain_list_id:resource_id ->
  ?firewall_threat_protection_id:resource_id ->
  ?qtype:qtype ->
  firewall_rule_group_id:resource_id ->
  unit ->
  delete_firewall_rule_request

val make_delete_firewall_rule_group_response :
  ?firewall_rule_group:firewall_rule_group -> unit -> delete_firewall_rule_group_response

val make_delete_firewall_rule_group_request :
  firewall_rule_group_id:resource_id -> unit -> delete_firewall_rule_group_request

val make_delete_outpost_resolver_response :
  ?outpost_resolver:outpost_resolver -> unit -> delete_outpost_resolver_response

val make_delete_outpost_resolver_request : id:resource_id -> unit -> delete_outpost_resolver_request

val make_delete_resolver_endpoint_response :
  ?resolver_endpoint:resolver_endpoint -> unit -> delete_resolver_endpoint_response

val make_delete_resolver_endpoint_request :
  resolver_endpoint_id:resource_id -> unit -> delete_resolver_endpoint_request

val make_delete_resolver_query_log_config_response :
  ?resolver_query_log_config:resolver_query_log_config ->
  unit ->
  delete_resolver_query_log_config_response

val make_delete_resolver_query_log_config_request :
  resolver_query_log_config_id:resource_id -> unit -> delete_resolver_query_log_config_request

val make_delete_resolver_rule_response :
  ?resolver_rule:resolver_rule -> unit -> delete_resolver_rule_response

val make_delete_resolver_rule_request :
  resolver_rule_id:resource_id -> unit -> delete_resolver_rule_request

val make_disassociate_firewall_rule_group_response :
  ?firewall_rule_group_association:firewall_rule_group_association ->
  unit ->
  disassociate_firewall_rule_group_response

val make_disassociate_firewall_rule_group_request :
  firewall_rule_group_association_id:resource_id -> unit -> disassociate_firewall_rule_group_request

val make_disassociate_resolver_endpoint_ip_address_response :
  ?resolver_endpoint:resolver_endpoint -> unit -> disassociate_resolver_endpoint_ip_address_response

val make_disassociate_resolver_endpoint_ip_address_request :
  resolver_endpoint_id:resource_id ->
  ip_address:ip_address_update ->
  unit ->
  disassociate_resolver_endpoint_ip_address_request

val make_disassociate_resolver_query_log_config_response :
  ?resolver_query_log_config_association:resolver_query_log_config_association ->
  unit ->
  disassociate_resolver_query_log_config_response

val make_disassociate_resolver_query_log_config_request :
  resolver_query_log_config_id:resource_id ->
  resource_id:resource_id ->
  unit ->
  disassociate_resolver_query_log_config_request

val make_disassociate_resolver_rule_response :
  ?resolver_rule_association:resolver_rule_association ->
  unit ->
  disassociate_resolver_rule_response

val make_disassociate_resolver_rule_request :
  vpc_id:resource_id -> resolver_rule_id:resource_id -> unit -> disassociate_resolver_rule_request

val make_filter : ?name:filter_name -> ?values:filter_values -> unit -> filter

val make_firewall_config :
  ?id:resource_id ->
  ?resource_id:resource_id ->
  ?owner_id:account_id ->
  ?firewall_fail_open:firewall_fail_open_status ->
  unit ->
  firewall_config

val make_firewall_domain_list_metadata :
  ?id:resource_id ->
  ?arn:arn ->
  ?name:name ->
  ?creator_request_id:creator_request_id ->
  ?managed_owner_name:service_principle ->
  ?managed_list_type:domain_list_type ->
  ?category:category ->
  unit ->
  firewall_domain_list_metadata

val make_firewall_rule_group_metadata :
  ?id:resource_id ->
  ?arn:arn ->
  ?name:name ->
  ?owner_id:account_id ->
  ?creator_request_id:creator_request_id ->
  ?share_status:share_status ->
  unit ->
  firewall_rule_group_metadata

val make_subscription_info :
  ?vendor_name:vendor_name -> ?product_id:product_id -> unit -> subscription_info

val make_firewall_rule_type_definition :
  ?rule_type:rule_type_name ->
  ?value:rule_type_value ->
  ?display_name:display_name ->
  ?description:rule_type_description ->
  ?subscription_info:subscription_info ->
  unit ->
  firewall_rule_type_definition

val make_get_firewall_config_response :
  ?firewall_config:firewall_config -> unit -> get_firewall_config_response

val make_get_firewall_config_request :
  resource_id:resource_id -> unit -> get_firewall_config_request

val make_get_firewall_domain_list_response :
  ?firewall_domain_list:firewall_domain_list -> unit -> get_firewall_domain_list_response

val make_get_firewall_domain_list_request :
  firewall_domain_list_id:resource_id -> unit -> get_firewall_domain_list_request

val make_get_firewall_rule_group_response :
  ?firewall_rule_group:firewall_rule_group -> unit -> get_firewall_rule_group_response

val make_get_firewall_rule_group_request :
  firewall_rule_group_id:resource_id -> unit -> get_firewall_rule_group_request

val make_get_firewall_rule_group_association_response :
  ?firewall_rule_group_association:firewall_rule_group_association ->
  unit ->
  get_firewall_rule_group_association_response

val make_get_firewall_rule_group_association_request :
  firewall_rule_group_association_id:resource_id ->
  unit ->
  get_firewall_rule_group_association_request

val make_get_firewall_rule_group_policy_response :
  ?firewall_rule_group_policy:firewall_rule_group_policy ->
  unit ->
  get_firewall_rule_group_policy_response

val make_get_firewall_rule_group_policy_request :
  arn:arn -> unit -> get_firewall_rule_group_policy_request

val make_get_outpost_resolver_response :
  ?outpost_resolver:outpost_resolver -> unit -> get_outpost_resolver_response

val make_get_outpost_resolver_request : id:resource_id -> unit -> get_outpost_resolver_request

val make_resolver_config :
  ?id:resource_id ->
  ?resource_id:resource_id ->
  ?owner_id:account_id ->
  ?autodefined_reverse:resolver_autodefined_reverse_status ->
  unit ->
  resolver_config

val make_get_resolver_config_response :
  ?resolver_config:resolver_config -> unit -> get_resolver_config_response

val make_get_resolver_config_request :
  resource_id:resource_id -> unit -> get_resolver_config_request

val make_resolver_dnssec_config :
  ?id:resource_id ->
  ?owner_id:account_id ->
  ?resource_id:resource_id ->
  ?validation_status:resolver_dnssec_validation_status ->
  unit ->
  resolver_dnssec_config

val make_get_resolver_dnssec_config_response :
  ?resolver_dnssec_config:resolver_dnssec_config -> unit -> get_resolver_dnssec_config_response

val make_get_resolver_dnssec_config_request :
  resource_id:resource_id -> unit -> get_resolver_dnssec_config_request

val make_get_resolver_endpoint_response :
  ?resolver_endpoint:resolver_endpoint -> unit -> get_resolver_endpoint_response

val make_get_resolver_endpoint_request :
  resolver_endpoint_id:resource_id -> unit -> get_resolver_endpoint_request

val make_get_resolver_query_log_config_response :
  ?resolver_query_log_config:resolver_query_log_config ->
  unit ->
  get_resolver_query_log_config_response

val make_get_resolver_query_log_config_request :
  resolver_query_log_config_id:resource_id -> unit -> get_resolver_query_log_config_request

val make_get_resolver_query_log_config_association_response :
  ?resolver_query_log_config_association:resolver_query_log_config_association ->
  unit ->
  get_resolver_query_log_config_association_response

val make_get_resolver_query_log_config_association_request :
  resolver_query_log_config_association_id:resource_id ->
  unit ->
  get_resolver_query_log_config_association_request

val make_get_resolver_query_log_config_policy_response :
  ?resolver_query_log_config_policy:resolver_query_log_config_policy ->
  unit ->
  get_resolver_query_log_config_policy_response

val make_get_resolver_query_log_config_policy_request :
  arn:arn -> unit -> get_resolver_query_log_config_policy_request

val make_get_resolver_rule_response :
  ?resolver_rule:resolver_rule -> unit -> get_resolver_rule_response

val make_get_resolver_rule_request :
  resolver_rule_id:resource_id -> unit -> get_resolver_rule_request

val make_get_resolver_rule_association_response :
  ?resolver_rule_association:resolver_rule_association ->
  unit ->
  get_resolver_rule_association_response

val make_get_resolver_rule_association_request :
  resolver_rule_association_id:resource_id -> unit -> get_resolver_rule_association_request

val make_get_resolver_rule_policy_response :
  ?resolver_rule_policy:resolver_rule_policy -> unit -> get_resolver_rule_policy_response

val make_get_resolver_rule_policy_request : arn:arn -> unit -> get_resolver_rule_policy_request

val make_import_firewall_domains_response :
  ?id:resource_id ->
  ?name:name ->
  ?status:firewall_domain_list_status ->
  ?status_message:status_message ->
  unit ->
  import_firewall_domains_response

val make_import_firewall_domains_request :
  firewall_domain_list_id:resource_id ->
  operation:firewall_domain_import_operation ->
  domain_file_url:domain_list_file_url ->
  unit ->
  import_firewall_domains_request

val make_ip_address_response :
  ?ip_id:resource_id ->
  ?subnet_id:subnet_id ->
  ?ip:ip ->
  ?ipv6:ipv6 ->
  ?status:ip_address_status ->
  ?status_message:status_message ->
  ?creation_time:rfc3339_time_string ->
  ?modification_time:rfc3339_time_string ->
  unit ->
  ip_address_response

val make_list_firewall_configs_response :
  ?next_token:next_token ->
  ?firewall_configs:firewall_config_list ->
  unit ->
  list_firewall_configs_response

val make_list_firewall_configs_request :
  ?max_results:list_firewall_configs_max_result ->
  ?next_token:next_token ->
  unit ->
  list_firewall_configs_request

val make_list_firewall_domain_lists_response :
  ?next_token:next_token ->
  ?firewall_domain_lists:firewall_domain_list_metadata_list ->
  unit ->
  list_firewall_domain_lists_response

val make_list_firewall_domain_lists_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_firewall_domain_lists_request

val make_list_firewall_domains_response :
  ?next_token:next_token -> ?domains:firewall_domains -> unit -> list_firewall_domains_response

val make_list_firewall_domains_request :
  ?max_results:list_domain_max_results ->
  ?next_token:next_token ->
  firewall_domain_list_id:resource_id ->
  unit ->
  list_firewall_domains_request

val make_list_firewall_rule_group_associations_response :
  ?next_token:next_token ->
  ?firewall_rule_group_associations:firewall_rule_group_associations ->
  unit ->
  list_firewall_rule_group_associations_response

val make_list_firewall_rule_group_associations_request :
  ?firewall_rule_group_id:resource_id ->
  ?vpc_id:resource_id ->
  ?priority:priority ->
  ?status:firewall_rule_group_association_status ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_firewall_rule_group_associations_request

val make_list_firewall_rule_groups_response :
  ?next_token:next_token ->
  ?firewall_rule_groups:firewall_rule_group_metadata_list ->
  unit ->
  list_firewall_rule_groups_response

val make_list_firewall_rule_groups_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_firewall_rule_groups_request

val make_list_firewall_rule_types_response :
  ?firewall_rule_types:firewall_rule_type_definitions ->
  ?next_token:next_token ->
  unit ->
  list_firewall_rule_types_response

val make_list_firewall_rule_types_request :
  ?rule_type:rule_type_name ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_firewall_rule_types_request

val make_list_firewall_rules_response :
  ?next_token:next_token -> ?firewall_rules:firewall_rules -> unit -> list_firewall_rules_response

val make_list_firewall_rules_request :
  ?priority:priority ->
  ?action:action ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  firewall_rule_group_id:resource_id ->
  unit ->
  list_firewall_rules_request

val make_list_outpost_resolvers_response :
  ?outpost_resolvers:outpost_resolver_list ->
  ?next_token:next_token ->
  unit ->
  list_outpost_resolvers_response

val make_list_outpost_resolvers_request :
  ?outpost_arn:outpost_arn ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_outpost_resolvers_request

val make_list_resolver_configs_response :
  ?next_token:next_token ->
  ?resolver_configs:resolver_config_list ->
  unit ->
  list_resolver_configs_response

val make_list_resolver_configs_request :
  ?max_results:list_resolver_configs_max_result ->
  ?next_token:next_token ->
  unit ->
  list_resolver_configs_request

val make_list_resolver_dnssec_configs_response :
  ?next_token:next_token ->
  ?resolver_dnssec_configs:resolver_dnssec_config_list ->
  unit ->
  list_resolver_dnssec_configs_response

val make_list_resolver_dnssec_configs_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:filters ->
  unit ->
  list_resolver_dnssec_configs_request

val make_list_resolver_endpoint_ip_addresses_response :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?ip_addresses:ip_addresses_response ->
  unit ->
  list_resolver_endpoint_ip_addresses_response

val make_list_resolver_endpoint_ip_addresses_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  resolver_endpoint_id:resource_id ->
  unit ->
  list_resolver_endpoint_ip_addresses_request

val make_list_resolver_endpoints_response :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?resolver_endpoints:resolver_endpoints ->
  unit ->
  list_resolver_endpoints_response

val make_list_resolver_endpoints_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:filters ->
  unit ->
  list_resolver_endpoints_request

val make_list_resolver_query_log_config_associations_response :
  ?next_token:next_token ->
  ?total_count:count ->
  ?total_filtered_count:count ->
  ?resolver_query_log_config_associations:resolver_query_log_config_association_list ->
  unit ->
  list_resolver_query_log_config_associations_response

val make_list_resolver_query_log_config_associations_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:filters ->
  ?sort_by:sort_by_key ->
  ?sort_order:sort_order ->
  unit ->
  list_resolver_query_log_config_associations_request

val make_list_resolver_query_log_configs_response :
  ?next_token:next_token ->
  ?total_count:count ->
  ?total_filtered_count:count ->
  ?resolver_query_log_configs:resolver_query_log_config_list ->
  unit ->
  list_resolver_query_log_configs_response

val make_list_resolver_query_log_configs_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:filters ->
  ?sort_by:sort_by_key ->
  ?sort_order:sort_order ->
  unit ->
  list_resolver_query_log_configs_request

val make_list_resolver_rule_associations_response :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?resolver_rule_associations:resolver_rule_associations ->
  unit ->
  list_resolver_rule_associations_response

val make_list_resolver_rule_associations_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:filters ->
  unit ->
  list_resolver_rule_associations_request

val make_list_resolver_rules_response :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?resolver_rules:resolver_rules ->
  unit ->
  list_resolver_rules_response

val make_list_resolver_rules_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:filters ->
  unit ->
  list_resolver_rules_request

val make_list_tags_for_resource_response :
  ?tags:tag_list -> ?next_token:next_token -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  resource_arn:arn ->
  unit ->
  list_tags_for_resource_request

val make_put_firewall_rule_group_policy_response :
  ?return_value:boolean_ -> unit -> put_firewall_rule_group_policy_response

val make_put_firewall_rule_group_policy_request :
  arn:arn ->
  firewall_rule_group_policy:firewall_rule_group_policy ->
  unit ->
  put_firewall_rule_group_policy_request

val make_put_resolver_query_log_config_policy_response :
  ?return_value:boolean_ -> unit -> put_resolver_query_log_config_policy_response

val make_put_resolver_query_log_config_policy_request :
  arn:arn ->
  resolver_query_log_config_policy:resolver_query_log_config_policy ->
  unit ->
  put_resolver_query_log_config_policy_request

val make_put_resolver_rule_policy_response :
  ?return_value:boolean_ -> unit -> put_resolver_rule_policy_response

val make_put_resolver_rule_policy_request :
  arn:arn -> resolver_rule_policy:resolver_rule_policy -> unit -> put_resolver_rule_policy_request

val make_resolver_rule_config :
  ?name:name ->
  ?target_ips:target_list ->
  ?resolver_endpoint_id:resource_id ->
  unit ->
  resolver_rule_config

val make_update_resolver_rule_response :
  ?resolver_rule:resolver_rule -> unit -> update_resolver_rule_response

val make_update_resolver_rule_request :
  resolver_rule_id:resource_id ->
  config:resolver_rule_config ->
  unit ->
  update_resolver_rule_request

val make_update_resolver_endpoint_response :
  ?resolver_endpoint:resolver_endpoint -> unit -> update_resolver_endpoint_response

val make_update_ip_address : ip_id:resource_id -> ipv6:ipv6 -> unit -> update_ip_address

val make_update_resolver_endpoint_request :
  ?name:name ->
  ?resolver_endpoint_type:resolver_endpoint_type ->
  ?update_ip_addresses:update_ip_addresses ->
  ?protocols:protocol_list ->
  ?rni_enhanced_metrics_enabled:rni_enhanced_metrics_enabled ->
  ?target_name_server_metrics_enabled:target_name_server_metrics_enabled ->
  ?dns64_enabled:dns64_enabled ->
  ?ipv6_internet_access_enabled:ipv6_internet_access_enabled ->
  resolver_endpoint_id:resource_id ->
  unit ->
  update_resolver_endpoint_request

val make_update_resolver_dnssec_config_response :
  ?resolver_dnssec_config:resolver_dnssec_config -> unit -> update_resolver_dnssec_config_response

val make_update_resolver_dnssec_config_request :
  resource_id:resource_id -> validation:validation -> unit -> update_resolver_dnssec_config_request

val make_update_resolver_config_response :
  ?resolver_config:resolver_config -> unit -> update_resolver_config_response

val make_update_resolver_config_request :
  resource_id:resource_id ->
  autodefined_reverse_flag:autodefined_reverse_flag ->
  unit ->
  update_resolver_config_request

val make_update_outpost_resolver_response :
  ?outpost_resolver:outpost_resolver -> unit -> update_outpost_resolver_response

val make_update_outpost_resolver_request :
  ?name:outpost_resolver_name ->
  ?instance_count:instance_count ->
  ?preferred_instance_type:outpost_instance_type ->
  id:resource_id ->
  unit ->
  update_outpost_resolver_request

val make_update_firewall_rule_group_association_response :
  ?firewall_rule_group_association:firewall_rule_group_association ->
  unit ->
  update_firewall_rule_group_association_response

val make_update_firewall_rule_group_association_request :
  ?priority:priority ->
  ?mutation_protection:mutation_protection_status ->
  ?name:name ->
  firewall_rule_group_association_id:resource_id ->
  unit ->
  update_firewall_rule_group_association_request

val make_update_firewall_rule_response :
  ?firewall_rule:firewall_rule -> unit -> update_firewall_rule_response

val make_update_firewall_rule_request :
  ?firewall_domain_list_id:resource_id ->
  ?firewall_threat_protection_id:resource_id ->
  ?priority:priority ->
  ?action:action ->
  ?block_response:block_response ->
  ?block_override_domain:block_override_domain ->
  ?block_override_dns_type:block_override_dns_type ->
  ?block_override_ttl:block_override_ttl ->
  ?name:name ->
  ?firewall_domain_redirection_action:firewall_domain_redirection_action ->
  ?qtype:qtype ->
  ?dns_threat_protection:dns_threat_protection ->
  ?confidence_threshold:confidence_threshold ->
  ?firewall_rule_type:firewall_rule_type ->
  firewall_rule_group_id:resource_id ->
  unit ->
  update_firewall_rule_request

val make_update_firewall_domains_response :
  ?id:resource_id ->
  ?name:name ->
  ?status:firewall_domain_list_status ->
  ?status_message:status_message ->
  unit ->
  update_firewall_domains_response

val make_update_firewall_domains_request :
  firewall_domain_list_id:resource_id ->
  operation:firewall_domain_update_operation ->
  domains:firewall_domains ->
  unit ->
  update_firewall_domains_request

val make_update_firewall_config_response :
  ?firewall_config:firewall_config -> unit -> update_firewall_config_response

val make_update_firewall_config_request :
  resource_id:resource_id ->
  firewall_fail_open:firewall_fail_open_status ->
  unit ->
  update_firewall_config_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag_resource_request : resource_arn:arn -> tags:tag_list -> unit -> tag_resource_request
