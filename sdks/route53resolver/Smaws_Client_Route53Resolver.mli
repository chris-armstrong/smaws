(** Route53Resolver client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidTagException of invalid_tag_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTagException of invalid_tag_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidTagException of invalid_tag_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds one or more tags to a specified resource.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes one or more tags from a specified resource.\n"]

module UpdateFirewallConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_config_request ->
    ( update_firewall_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_config_request ->
    ( update_firewall_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the configuration of the firewall behavior provided by DNS Firewall for a single VPC \
   from Amazon Virtual Private Cloud (Amazon VPC). \n"]

module UpdateFirewallDomains : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_domains_request ->
    ( update_firewall_domains_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_domains_request ->
    ( update_firewall_domains_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the firewall domain list from an array of domain specifications. \n"]

module UpdateFirewallRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_rule_request ->
    ( update_firewall_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_rule_request ->
    ( update_firewall_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified firewall rule. The rule's [FirewallRuleType], [FirewallDomainListId], and \
   top-level [DnsThreatProtection] match source cannot be changed after creation. Rules whose \
   [Status] is [CREATING] or [CREATION_FAILED] cannot be updated; remove a failed rule with \
   [DeleteFirewallRule].\n"]

module UpdateFirewallRuleGroupAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_rule_group_association_request ->
    ( update_firewall_rule_group_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_firewall_rule_group_association_request ->
    ( update_firewall_rule_group_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Changes the association of a [FirewallRuleGroup] with a VPC. The association enables DNS \
   filtering for the VPC. \n"]

module UpdateOutpostResolver : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_outpost_resolver_request ->
    ( update_outpost_resolver_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_outpost_resolver_request ->
    ( update_outpost_resolver_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "You can use [UpdateOutpostResolver] to update the instance count, type, or name of a Resolver \
   on an Outpost.\n"]

module UpdateResolverConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_resolver_config_request ->
    ( update_resolver_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_resolver_config_request ->
    ( update_resolver_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the behavior configuration of Route\194\16053 Resolver behavior for a single VPC from \
   Amazon Virtual Private Cloud.\n"]

module UpdateResolverDnssecConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_resolver_dnssec_config_request ->
    ( update_resolver_dnssec_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_resolver_dnssec_config_request ->
    ( update_resolver_dnssec_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing DNSSEC validation configuration. If there is no existing DNSSEC validation \
   configuration, one is created.\n"]

module UpdateResolverEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_resolver_endpoint_request ->
    ( update_resolver_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_resolver_endpoint_request ->
    ( update_resolver_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the name, or endpoint type for an inbound or an outbound Resolver endpoint. You can \
   only update between IPV4 and DUALSTACK, IPV6 endpoint type can't be updated to other type. \n"]

module UpdateResolverRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_resolver_rule_request ->
    ( update_resolver_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_resolver_rule_request ->
    ( update_resolver_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates settings for a specified Resolver rule. [ResolverRuleId] is required, and all other \
   parameters are optional. If you don't specify a parameter, it retains its current value.\n"]

module PutResolverRulePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidPolicyDocument of invalid_policy_document
    | `UnknownResourceException of unknown_resource_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resolver_rule_policy_request ->
    ( put_resolver_rule_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPolicyDocument of invalid_policy_document
      | `UnknownResourceException of unknown_resource_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_resolver_rule_policy_request ->
    ( put_resolver_rule_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPolicyDocument of invalid_policy_document
      | `UnknownResourceException of unknown_resource_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Specifies an Amazon Web Services rule that you want to share with another account, the account \
   that you want to share the rule with, and the operations that you want the account to be able \
   to perform on the rule.\n"]

module PutResolverQueryLogConfigPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidPolicyDocument of invalid_policy_document
    | `InvalidRequestException of invalid_request_exception
    | `UnknownResourceException of unknown_resource_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resolver_query_log_config_policy_request ->
    ( put_resolver_query_log_config_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPolicyDocument of invalid_policy_document
      | `InvalidRequestException of invalid_request_exception
      | `UnknownResourceException of unknown_resource_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_resolver_query_log_config_policy_request ->
    ( put_resolver_query_log_config_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPolicyDocument of invalid_policy_document
      | `InvalidRequestException of invalid_request_exception
      | `UnknownResourceException of unknown_resource_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Specifies an Amazon Web Services account that you want to share a query logging configuration \
   with, the query logging configuration that you want to share, and the operations that you want \
   the account to be able to perform on the configuration.\n"]

module PutFirewallRuleGroupPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_firewall_rule_group_policy_request ->
    ( put_firewall_rule_group_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_firewall_rule_group_policy_request ->
    ( put_firewall_rule_group_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches an Identity and Access Management (Amazon Web Services IAM) policy for sharing the \
   rule group. You can use the policy to share the rule group using Resource Access Manager (RAM). \n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the tags that you associated with the specified resource.\n"]

module ListResolverRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resolver_rules_request ->
    ( list_resolver_rules_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resolver_rules_request ->
    ( list_resolver_rules_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the Resolver rules that were created using the current Amazon Web Services account.\n"]

module ListResolverRuleAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resolver_rule_associations_request ->
    ( list_resolver_rule_associations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resolver_rule_associations_request ->
    ( list_resolver_rule_associations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the associations that were created between Resolver rules and VPCs using the current \
   Amazon Web Services account.\n"]

module ListResolverQueryLogConfigs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resolver_query_log_configs_request ->
    ( list_resolver_query_log_configs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resolver_query_log_configs_request ->
    ( list_resolver_query_log_configs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists information about the specified query logging configurations. Each configuration defines \
   where you want Resolver to save DNS query logs and specifies the VPCs that you want to log \
   queries for.\n"]

module ListResolverQueryLogConfigAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resolver_query_log_config_associations_request ->
    ( list_resolver_query_log_config_associations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resolver_query_log_config_associations_request ->
    ( list_resolver_query_log_config_associations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists information about associations between Amazon VPCs and query logging configurations.\n"]

module ListResolverEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resolver_endpoints_request ->
    ( list_resolver_endpoints_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resolver_endpoints_request ->
    ( list_resolver_endpoints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the Resolver endpoints that were created using the current Amazon Web Services account.\n"]

module ListResolverEndpointIpAddresses : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resolver_endpoint_ip_addresses_request ->
    ( list_resolver_endpoint_ip_addresses_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resolver_endpoint_ip_addresses_request ->
    ( list_resolver_endpoint_ip_addresses_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the IP addresses for a specified Resolver endpoint.\n"]

module ListResolverDnssecConfigs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resolver_dnssec_configs_request ->
    ( list_resolver_dnssec_configs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resolver_dnssec_configs_request ->
    ( list_resolver_dnssec_configs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the configurations for DNSSEC validation that are associated with the current Amazon Web \
   Services account.\n"]

module ListResolverConfigs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resolver_configs_request ->
    ( list_resolver_configs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resolver_configs_request ->
    ( list_resolver_configs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the Resolver configurations that you have defined. Route\194\16053 Resolver uses the \
   configurations to manage DNS resolution behavior for your VPCs.\n"]

module ListOutpostResolvers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_outpost_resolvers_request ->
    ( list_outpost_resolvers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_outpost_resolvers_request ->
    ( list_outpost_resolvers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the Resolvers on Outposts that were created using the current Amazon Web Services \
   account.\n"]

module ListFirewallRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_firewall_rules_request ->
    ( list_firewall_rules_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_firewall_rules_request ->
    ( list_firewall_rules_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the firewall rules that you have defined for the specified firewall rule group. DNS \
   Firewall uses the rules in a rule group to filter DNS network traffic for a VPC.\n\n\
  \ A single call might return only a partial list of the rules. For information, see [MaxResults].\n\
  \ \n\
  \  For rules that require asynchronous provisioning, the response includes [Status] (see \
   [FirewallRuleStatus]) and, on failure, [StatusMessage] with the reason.\n\
  \  "]

module ListFirewallRuleTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_firewall_rule_types_request ->
    ( list_firewall_rule_types_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_firewall_rule_types_request ->
    ( list_firewall_rule_types_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the rule-type variants that can be used in the [FirewallRuleType] field of \
   [CreateFirewallRule] and [UpdateFirewallRule]. Each returned [FirewallRuleTypeDefinition] \
   identifies one variant + value combination \226\128\148 for example, \
   [FirewallAdvancedContentCategory] + [VIOLENCE_AND_HATE_SPEECH], or [PartnerThreatProtection] + \
   a partner-managed feed.\n\n\
  \ The supported [RuleType] filter values are [FirewallAdvancedContentCategory], \
   [FirewallAdvancedThreatCategory], [DnsThreatProtection], and [PartnerThreatProtection]. When a \
   returned definition's variant requires an external subscription (currently only \
   [PartnerThreatProtection]), the response also includes a [SubscriptionInfo] identifying the AWS \
   Marketplace product that backs it; absence of [SubscriptionInfo] means the variant is fully \
   managed by AWS and requires no separate subscription.\n\
  \ "]

module ListFirewallRuleGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_firewall_rule_groups_request ->
    ( list_firewall_rule_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_firewall_rule_groups_request ->
    ( list_firewall_rule_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the minimal high-level information for the rule groups that you have defined. \n\n\
  \ A single call might return only a partial list of the rule groups. For information, see \
   [MaxResults]. \n\
  \ "]

module ListFirewallRuleGroupAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_firewall_rule_group_associations_request ->
    ( list_firewall_rule_group_associations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_firewall_rule_group_associations_request ->
    ( list_firewall_rule_group_associations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the firewall rule group associations that you have defined. Each association enables \
   DNS filtering for a VPC with one rule group. \n\n\
  \ A single call might return only a partial list of the associations. For information, see \
   [MaxResults]. \n\
  \ "]

module ListFirewallDomains : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_firewall_domains_request ->
    ( list_firewall_domains_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_firewall_domains_request ->
    ( list_firewall_domains_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the domains that you have defined for the specified firewall domain list. \n\n\
  \ A single call might return only a partial list of the domains. For information, see \
   [MaxResults]. \n\
  \ "]

module ListFirewallDomainLists : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_firewall_domain_lists_request ->
    ( list_firewall_domain_lists_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_firewall_domain_lists_request ->
    ( list_firewall_domain_lists_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the firewall domain lists that you have defined. For each firewall domain list, you \
   can retrieve the domains that are defined for a list by calling [ListFirewallDomains]. \n\n\
  \ A single call to this list operation might return only a partial list of the domain lists. For \
   information, see [MaxResults]. \n\
  \ "]

module ListFirewallConfigs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_firewall_configs_request ->
    ( list_firewall_configs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_firewall_configs_request ->
    ( list_firewall_configs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the firewall configurations that you have defined. DNS Firewall uses the \
   configurations to manage firewall behavior for your VPCs. \n\n\
  \ A single call might return only a partial list of the configurations. For information, see \
   [MaxResults]. \n\
  \ "]

module ImportFirewallDomains : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_firewall_domains_request ->
    ( import_firewall_domains_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_firewall_domains_request ->
    ( import_firewall_domains_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Imports domain names from a file into a domain list, for use in a DNS firewall rule group. \n\n\
  \ Each domain specification in your domain list must satisfy the following requirements: \n\
  \ \n\
  \  {ul\n\
  \        {-  It can optionally start with [*] (asterisk).\n\
  \            \n\
  \             }\n\
  \        {-  With the exception of the optional starting asterisk, it must only contain the \
   following characters: [A-Z], [a-z], [0-9], [-] (hyphen).\n\
  \            \n\
  \             }\n\
  \        {-  It must be from 1-255 characters in length. \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module GetResolverRulePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `UnknownResourceException of unknown_resource_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resolver_rule_policy_request ->
    ( get_resolver_rule_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `UnknownResourceException of unknown_resource_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resolver_rule_policy_request ->
    ( get_resolver_rule_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `UnknownResourceException of unknown_resource_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the Resolver rule policy for a specified rule. A Resolver rule policy \
   includes the rule that you want to share with another account, the account that you want to \
   share the rule with, and the Resolver operations that you want to allow the account to use. \n"]

module GetResolverRuleAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resolver_rule_association_request ->
    ( get_resolver_rule_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resolver_rule_association_request ->
    ( get_resolver_rule_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about an association between a specified Resolver rule and a VPC. You \
   associate a Resolver rule and a VPC using \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_AssociateResolverRule.html}AssociateResolverRule}. \n"]

module GetResolverRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resolver_rule_request ->
    ( get_resolver_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resolver_rule_request ->
    ( get_resolver_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about a specified Resolver rule, such as the domain name that the rule \
   forwards DNS queries for and the ID of the outbound Resolver endpoint that the rule is \
   associated with.\n"]

module GetResolverQueryLogConfigPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `UnknownResourceException of unknown_resource_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resolver_query_log_config_policy_request ->
    ( get_resolver_query_log_config_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnknownResourceException of unknown_resource_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resolver_query_log_config_policy_request ->
    ( get_resolver_query_log_config_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `UnknownResourceException of unknown_resource_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about a query logging policy. A query logging policy specifies the Resolver \
   query logging operations and resources that you want to allow another Amazon Web Services \
   account to be able to use.\n"]

module GetResolverQueryLogConfigAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resolver_query_log_config_association_request ->
    ( get_resolver_query_log_config_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resolver_query_log_config_association_request ->
    ( get_resolver_query_log_config_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about a specified association between a Resolver query logging configuration \
   and an Amazon VPC. When you associate a VPC with a query logging configuration, Resolver logs \
   DNS queries that originate in that VPC.\n"]

module GetResolverQueryLogConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resolver_query_log_config_request ->
    ( get_resolver_query_log_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resolver_query_log_config_request ->
    ( get_resolver_query_log_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about a specified Resolver query logging configuration, such as the number of \
   VPCs that the configuration is logging queries for and the location that logs are sent to. \n"]

module GetResolverEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resolver_endpoint_request ->
    ( get_resolver_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resolver_endpoint_request ->
    ( get_resolver_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about a specified Resolver endpoint, such as whether it's an inbound or an \
   outbound Resolver endpoint, and the current status of the endpoint.\n"]

module GetResolverDnssecConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resolver_dnssec_config_request ->
    ( get_resolver_dnssec_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resolver_dnssec_config_request ->
    ( get_resolver_dnssec_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets DNSSEC validation information for a specified resource.\n"]

module GetResolverConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resolver_config_request ->
    ( get_resolver_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resolver_config_request ->
    ( get_resolver_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the behavior configuration of Route\194\16053 Resolver behavior for a single VPC from \
   Amazon Virtual Private Cloud.\n"]

module GetOutpostResolver : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_outpost_resolver_request ->
    ( get_outpost_resolver_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_outpost_resolver_request ->
    ( get_outpost_resolver_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about a specified Resolver on the Outpost, such as its instance count and \
   type, name, and the current status of the Resolver.\n"]

module GetFirewallRuleGroupPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_firewall_rule_group_policy_request ->
    ( get_firewall_rule_group_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_firewall_rule_group_policy_request ->
    ( get_firewall_rule_group_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the Identity and Access Management (Amazon Web Services IAM) policy for sharing the \
   specified rule group. You can use the policy to share the rule group using Resource Access \
   Manager (RAM). \n"]

module GetFirewallRuleGroupAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_firewall_rule_group_association_request ->
    ( get_firewall_rule_group_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_firewall_rule_group_association_request ->
    ( get_firewall_rule_group_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a firewall rule group association, which enables DNS filtering for a VPC with one \
   rule group. A VPC can have more than one firewall rule group association, and a rule group can \
   be associated with more than one VPC.\n"]

module GetFirewallRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_firewall_rule_group_request ->
    ( get_firewall_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_firewall_rule_group_request ->
    ( get_firewall_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the specified firewall rule group. \n"]

module GetFirewallDomainList : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_firewall_domain_list_request ->
    ( get_firewall_domain_list_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_firewall_domain_list_request ->
    ( get_firewall_domain_list_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the specified firewall domain list.\n"]

module GetFirewallConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_firewall_config_request ->
    ( get_firewall_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_firewall_config_request ->
    ( get_firewall_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the configuration of the firewall behavior provided by DNS Firewall for a single VPC \
   from Amazon Virtual Private Cloud (Amazon VPC). \n"]

module DisassociateResolverRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_resolver_rule_request ->
    ( disassociate_resolver_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_resolver_rule_request ->
    ( disassociate_resolver_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the association between a specified Resolver rule and a specified VPC.\n\n\
  \  If you disassociate a Resolver rule from a VPC, Resolver stops forwarding DNS queries for the \
   domain name that you specified in the Resolver rule. \n\
  \  \n\
  \   "]

module DisassociateResolverQueryLogConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_resolver_query_log_config_request ->
    ( disassociate_resolver_query_log_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_resolver_query_log_config_request ->
    ( disassociate_resolver_query_log_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates a VPC from a query logging configuration.\n\n\
  \  Before you can delete a query logging configuration, you must first disassociate all VPCs \
   from the configuration. If you used Resource Access Manager (RAM) to share a query logging \
   configuration with other accounts, VPCs can be disassociated from the configuration in the \
   following ways:\n\
  \  \n\
  \   {ul\n\
  \         {-  The accounts that you shared the configuration with can disassociate VPCs from the \
   configuration.\n\
  \             \n\
  \              }\n\
  \         {-  You can stop sharing the configuration.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   "]

module DisassociateResolverEndpointIpAddress : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_resolver_endpoint_ip_address_request ->
    ( disassociate_resolver_endpoint_ip_address_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_resolver_endpoint_ip_address_request ->
    ( disassociate_resolver_endpoint_ip_address_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes IP addresses from an inbound or an outbound Resolver endpoint. If you want to remove \
   more than one IP address, submit one [DisassociateResolverEndpointIpAddress] request for each \
   IP address.\n\n\
  \ To add an IP address to an endpoint, see \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_AssociateResolverEndpointIpAddress.html}AssociateResolverEndpointIpAddress}. \n\
  \ "]

module DisassociateFirewallRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_firewall_rule_group_request ->
    ( disassociate_firewall_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_firewall_rule_group_request ->
    ( disassociate_firewall_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates a [FirewallRuleGroup] from a VPC, to remove DNS filtering from the VPC. \n"]

module DeleteResolverRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resolver_rule_request ->
    ( delete_resolver_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resolver_rule_request ->
    ( delete_resolver_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a Resolver rule. Before you can delete a Resolver rule, you must disassociate it from \
   all the VPCs that you associated the Resolver rule with. For more information, see \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DisassociateResolverRule.html}DisassociateResolverRule}.\n"]

module DeleteResolverQueryLogConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resolver_query_log_config_request ->
    ( delete_resolver_query_log_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resolver_query_log_config_request ->
    ( delete_resolver_query_log_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a query logging configuration. When you delete a configuration, Resolver stops logging \
   DNS queries for all of the Amazon VPCs that are associated with the configuration. This also \
   applies if the query logging configuration is shared with other Amazon Web Services accounts, \
   and the other accounts have associated VPCs with the shared configuration.\n\n\
  \ Before you can delete a query logging configuration, you must first disassociate all VPCs from \
   the configuration. See \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DisassociateResolverQueryLogConfig.html}DisassociateResolverQueryLogConfig}.\n\
  \ \n\
  \  If you used Resource Access Manager (RAM) to share a query logging configuration with other \
   accounts, you must stop sharing the configuration before you can delete a configuration. The \
   accounts that you shared the configuration with can first disassociate VPCs that they \
   associated with the configuration, but that's not necessary. If you stop sharing the \
   configuration, those VPCs are automatically disassociated from the configuration.\n\
  \  "]

module DeleteResolverEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resolver_endpoint_request ->
    ( delete_resolver_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resolver_endpoint_request ->
    ( delete_resolver_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a Resolver endpoint. The effect of deleting a Resolver endpoint depends on whether it's \
   an inbound or an outbound Resolver endpoint:\n\n\
  \ {ul\n\
  \       {-   {b Inbound}: DNS queries from your network are no longer routed to the DNS service \
   for the specified VPC.\n\
  \           \n\
  \            }\n\
  \       {-   {b Outbound}: DNS queries from a VPC are no longer routed to your network.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module DeleteOutpostResolver : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_outpost_resolver_request ->
    ( delete_outpost_resolver_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_outpost_resolver_request ->
    ( delete_outpost_resolver_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a Resolver on the Outpost.\n"]

module DeleteFirewallRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_firewall_rule_group_request ->
    ( delete_firewall_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_firewall_rule_group_request ->
    ( delete_firewall_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified firewall rule group. \n"]

module DeleteFirewallRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_firewall_rule_request ->
    ( delete_firewall_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_firewall_rule_request ->
    ( delete_firewall_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified firewall rule. Identify the rule using either [FirewallDomainListId] (for \
   domain-list and DNS Firewall Advanced rules) or [FirewallThreatProtectionId] (for \
   partner-managed and DNS Firewall Advanced rules) \226\128\148 together with \
   [FirewallRuleGroupId].\n\n\
  \  [DeleteFirewallRule] is the only operation that succeeds against a rule whose [Status] is \
   [CREATION_FAILED].\n\
  \ "]

module DeleteFirewallDomainList : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_firewall_domain_list_request ->
    ( delete_firewall_domain_list_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_firewall_domain_list_request ->
    ( delete_firewall_domain_list_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified domain list. \n"]

module CreateResolverRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_resolver_rule_request ->
    ( create_resolver_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_resolver_rule_request ->
    ( create_resolver_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For DNS queries that originate in your VPCs, specifies which Resolver endpoint the queries pass \
   through, one domain name that you want to forward to your network, and the IP addresses of the \
   DNS resolvers in your network.\n"]

module CreateResolverQueryLogConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_resolver_query_log_config_request ->
    ( create_resolver_query_log_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_resolver_query_log_config_request ->
    ( create_resolver_query_log_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Resolver query logging configuration, which defines where you want Resolver to save \
   DNS query logs that originate in your VPCs. Resolver can log queries only for VPCs that are in \
   the same Region as the query logging configuration.\n\n\
  \ To specify which VPCs you want to log queries for, you use [AssociateResolverQueryLogConfig]. \
   For more information, see \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_AssociateResolverQueryLogConfig.html}AssociateResolverQueryLogConfig}. \n\
  \ \n\
  \  You can optionally use Resource Access Manager (RAM) to share a query logging configuration \
   with other Amazon Web Services accounts. The other accounts can then associate VPCs with the \
   configuration. The query logs that Resolver creates for a configuration include all DNS queries \
   that originate in all VPCs that are associated with the configuration.\n\
  \  "]

module CreateResolverEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_resolver_endpoint_request ->
    ( create_resolver_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_resolver_endpoint_request ->
    ( create_resolver_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Resolver endpoint. There are two types of Resolver endpoints, inbound and outbound:\n\n\
  \ {ul\n\
  \       {-  An {i inbound Resolver endpoint} forwards DNS queries to the DNS service for a VPC \
   from your network.\n\
  \           \n\
  \            }\n\
  \       {-  An {i outbound Resolver endpoint} forwards DNS queries from the DNS service for a \
   VPC to your network.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module CreateOutpostResolver : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_outpost_resolver_request ->
    ( create_outpost_resolver_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_outpost_resolver_request ->
    ( create_outpost_resolver_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a Route\194\16053 Resolver on an Outpost.\n"]

module CreateFirewallRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_firewall_rule_group_request ->
    ( create_firewall_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_firewall_rule_group_request ->
    ( create_firewall_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an empty DNS Firewall rule group for filtering DNS network traffic in a VPC. You can \
   add rules to the new rule group by calling [CreateFirewallRule]. \n"]

module CreateFirewallRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_firewall_rule_request ->
    ( create_firewall_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_firewall_rule_request ->
    ( create_firewall_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a single DNS Firewall rule in the specified rule group. The rule can use any one of the \
   following match sources, and the chosen source must be supplied through the matching request \
   field \226\128\148 they are mutually exclusive:\n\n\
  \ {ul\n\
  \       {-   [FirewallDomainListId] \226\128\148 match a customer-managed or AWS-managed domain \
   list.\n\
  \           \n\
  \            }\n\
  \       {-   [DnsThreatProtection] \226\128\148 match a built-in DNS Firewall Advanced threat \
   detector ([DGA], [DNS_TUNNELING], or [DICTIONARY_DGA]).\n\
  \           \n\
  \            }\n\
  \       {-   [FirewallRuleType] \226\128\148 match one of the rule-type variants returned by \
   [ListFirewallRuleTypes]: [FirewallAdvancedContentCategory], [FirewallAdvancedThreatCategory], \
   [DnsThreatProtection], or [PartnerThreatProtection]. The [PartnerThreatProtection] variant \
   requires an active AWS Marketplace subscription to the named partner product.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   For rules that require asynchronous provisioning (today, the [PartnerThreatProtection] rule \
   type), the rule's [Status] begins at [CREATING] and transitions to [COMPLETE] once the rule is \
   provisioned and the marketplace entitlement is verified. If provisioning fails, [Status] \
   becomes [CREATION_FAILED] and [StatusMessage] contains a human-readable reason; the rule is \
   then immutable and must be removed with [DeleteFirewallRule].\n\
  \   "]

module CreateFirewallDomainList : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_firewall_domain_list_request ->
    ( create_firewall_domain_list_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_firewall_domain_list_request ->
    ( create_firewall_domain_list_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an empty firewall domain list for use in DNS Firewall rules. You can populate the \
   domains for the new list with a file, using [ImportFirewallDomains], or with domain strings, \
   using [UpdateFirewallDomains]. \n"]

module BatchUpdateFirewallRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_update_firewall_rule_request ->
    ( batch_update_firewall_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_update_firewall_rule_request ->
    ( batch_update_firewall_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates multiple DNS Firewall rules in the specified rule group.\n"]

module BatchDeleteFirewallRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_firewall_rule_request ->
    ( batch_delete_firewall_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_firewall_rule_request ->
    ( batch_delete_firewall_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes multiple DNS Firewall rules from the specified rule group.\n"]

module BatchCreateFirewallRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_create_firewall_rule_request ->
    ( batch_create_firewall_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_create_firewall_rule_request ->
    ( batch_create_firewall_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates multiple DNS Firewall rules in the specified rule group.\n"]

module AssociateResolverRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_resolver_rule_request ->
    ( associate_resolver_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_resolver_rule_request ->
    ( associate_resolver_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a Resolver rule with a VPC. When you associate a rule with a VPC, Resolver forwards \
   all DNS queries for the domain name that is specified in the rule and that originate in the \
   VPC. The queries are forwarded to the IP addresses for the DNS resolvers that are specified in \
   the rule. For more information about rules, see \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverRule.html}CreateResolverRule}. \n"]

module AssociateResolverQueryLogConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_resolver_query_log_config_request ->
    ( associate_resolver_query_log_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_resolver_query_log_config_request ->
    ( associate_resolver_query_log_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates an Amazon VPC with a specified query logging configuration. Route 53 Resolver logs \
   DNS queries that originate in all of the Amazon VPCs that are associated with a specified query \
   logging configuration. To associate more than one VPC with a configuration, submit one \
   [AssociateResolverQueryLogConfig] request for each VPC.\n\n\
  \  The VPCs that you associate with a query logging configuration must be in the same Region as \
   the configuration.\n\
  \  \n\
  \    To remove a VPC from a query logging configuration, see \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DisassociateResolverQueryLogConfig.html}DisassociateResolverQueryLogConfig}. \n\
  \    "]

module AssociateResolverEndpointIpAddress : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_resolver_endpoint_ip_address_request ->
    ( associate_resolver_endpoint_ip_address_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_resolver_endpoint_ip_address_request ->
    ( associate_resolver_endpoint_ip_address_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds IP addresses to an inbound or an outbound Resolver endpoint. If you want to add more than \
   one IP address, submit one [AssociateResolverEndpointIpAddress] request for each IP address.\n\n\
  \ To remove an IP address from an endpoint, see \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DisassociateResolverEndpointIpAddress.html}DisassociateResolverEndpointIpAddress}. \n\
  \ "]

(** {1:Serialization and Deserialization} *)
module AssociateFirewallRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_firewall_rule_group_request ->
    ( associate_firewall_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_firewall_rule_group_request ->
    ( associate_firewall_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a [FirewallRuleGroup] with a VPC, to provide DNS filtering for the VPC.\n\n\
  \ If the rule group contains any rule configured with the [PartnerThreatProtection] rule type, \
   the calling account must hold an active AWS Marketplace subscription to the named partner. If \
   the subscription is missing, the association request is rejected.\n\
  \ "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
