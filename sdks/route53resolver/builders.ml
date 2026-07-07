open Types

let make_target_address
    ?server_name_indication:(server_name_indication_ : server_name_indication option)
    ?protocol:(protocol_ : protocol option) ?ipv6:(ipv6_ : ipv6 option) ?port:(port_ : port option)
    ?ip:(ip_ : ip option) () =
  ({
     server_name_indication = server_name_indication_;
     protocol = protocol_;
     ipv6 = ipv6_;
     port = port_;
     ip = ip_;
   }
    : target_address)

let make_resolver_rule ?delegation_record:(delegation_record_ : delegation_record option)
    ?modification_time:(modification_time_ : rfc3339_time_string option)
    ?creation_time:(creation_time_ : rfc3339_time_string option)
    ?share_status:(share_status_ : share_status option) ?owner_id:(owner_id_ : account_id option)
    ?resolver_endpoint_id:(resolver_endpoint_id_ : resource_id option)
    ?target_ips:(target_ips_ : target_list option) ?name:(name_ : name option)
    ?rule_type:(rule_type_ : rule_type_option option)
    ?status_message:(status_message_ : status_message option)
    ?status:(status_ : resolver_rule_status option) ?domain_name:(domain_name_ : domain_name option)
    ?arn:(arn_ : arn option) ?creator_request_id:(creator_request_id_ : creator_request_id option)
    ?id:(id_ : resource_id option) () =
  ({
     delegation_record = delegation_record_;
     modification_time = modification_time_;
     creation_time = creation_time_;
     share_status = share_status_;
     owner_id = owner_id_;
     resolver_endpoint_id = resolver_endpoint_id_;
     target_ips = target_ips_;
     name = name_;
     rule_type = rule_type_;
     status_message = status_message_;
     status = status_;
     domain_name = domain_name_;
     arn = arn_;
     creator_request_id = creator_request_id_;
     id = id_;
   }
    : resolver_rule)

let make_update_resolver_rule_response ?resolver_rule:(resolver_rule_ : resolver_rule option) () =
  ({ resolver_rule = resolver_rule_ } : update_resolver_rule_response)

let make_resolver_rule_config ?resolver_endpoint_id:(resolver_endpoint_id_ : resource_id option)
    ?target_ips:(target_ips_ : target_list option) ?name:(name_ : name option) () =
  ({ resolver_endpoint_id = resolver_endpoint_id_; target_ips = target_ips_; name = name_ }
    : resolver_rule_config)

let make_update_resolver_rule_request ~config:(config_ : resolver_rule_config)
    ~resolver_rule_id:(resolver_rule_id_ : resource_id) () =
  ({ config = config_; resolver_rule_id = resolver_rule_id_ } : update_resolver_rule_request)

let make_resolver_endpoint
    ?ipv6_internet_access_enabled:
      (ipv6_internet_access_enabled_ : ipv6_internet_access_enabled option)
    ?dns64_enabled:(dns64_enabled_ : dns64_enabled option)
    ?target_name_server_metrics_enabled:
      (target_name_server_metrics_enabled_ : target_name_server_metrics_enabled option)
    ?rni_enhanced_metrics_enabled:
      (rni_enhanced_metrics_enabled_ : rni_enhanced_metrics_enabled option)
    ?protocols:(protocols_ : protocol_list option)
    ?resolver_endpoint_type:(resolver_endpoint_type_ : resolver_endpoint_type option)
    ?preferred_instance_type:(preferred_instance_type_ : outpost_instance_type option)
    ?outpost_arn:(outpost_arn_ : outpost_arn option)
    ?modification_time:(modification_time_ : rfc3339_time_string option)
    ?creation_time:(creation_time_ : rfc3339_time_string option)
    ?status_message:(status_message_ : status_message option)
    ?status:(status_ : resolver_endpoint_status option)
    ?host_vpc_id:(host_vpc_id_ : resource_id option)
    ?ip_address_count:(ip_address_count_ : ip_address_count option)
    ?direction:(direction_ : resolver_endpoint_direction option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?name:(name_ : name option) ?arn:(arn_ : arn option)
    ?creator_request_id:(creator_request_id_ : creator_request_id option)
    ?id:(id_ : resource_id option) () =
  ({
     ipv6_internet_access_enabled = ipv6_internet_access_enabled_;
     dns64_enabled = dns64_enabled_;
     target_name_server_metrics_enabled = target_name_server_metrics_enabled_;
     rni_enhanced_metrics_enabled = rni_enhanced_metrics_enabled_;
     protocols = protocols_;
     resolver_endpoint_type = resolver_endpoint_type_;
     preferred_instance_type = preferred_instance_type_;
     outpost_arn = outpost_arn_;
     modification_time = modification_time_;
     creation_time = creation_time_;
     status_message = status_message_;
     status = status_;
     host_vpc_id = host_vpc_id_;
     ip_address_count = ip_address_count_;
     direction = direction_;
     security_group_ids = security_group_ids_;
     name = name_;
     arn = arn_;
     creator_request_id = creator_request_id_;
     id = id_;
   }
    : resolver_endpoint)

let make_update_resolver_endpoint_response
    ?resolver_endpoint:(resolver_endpoint_ : resolver_endpoint option) () =
  ({ resolver_endpoint = resolver_endpoint_ } : update_resolver_endpoint_response)

let make_update_ip_address ~ipv6:(ipv6_ : ipv6) ~ip_id:(ip_id_ : resource_id) () =
  ({ ipv6 = ipv6_; ip_id = ip_id_ } : update_ip_address)

let make_update_resolver_endpoint_request
    ?ipv6_internet_access_enabled:
      (ipv6_internet_access_enabled_ : ipv6_internet_access_enabled option)
    ?dns64_enabled:(dns64_enabled_ : dns64_enabled option)
    ?target_name_server_metrics_enabled:
      (target_name_server_metrics_enabled_ : target_name_server_metrics_enabled option)
    ?rni_enhanced_metrics_enabled:
      (rni_enhanced_metrics_enabled_ : rni_enhanced_metrics_enabled option)
    ?protocols:(protocols_ : protocol_list option)
    ?update_ip_addresses:(update_ip_addresses_ : update_ip_addresses option)
    ?resolver_endpoint_type:(resolver_endpoint_type_ : resolver_endpoint_type option)
    ?name:(name_ : name option) ~resolver_endpoint_id:(resolver_endpoint_id_ : resource_id) () =
  ({
     ipv6_internet_access_enabled = ipv6_internet_access_enabled_;
     dns64_enabled = dns64_enabled_;
     target_name_server_metrics_enabled = target_name_server_metrics_enabled_;
     rni_enhanced_metrics_enabled = rni_enhanced_metrics_enabled_;
     protocols = protocols_;
     update_ip_addresses = update_ip_addresses_;
     resolver_endpoint_type = resolver_endpoint_type_;
     name = name_;
     resolver_endpoint_id = resolver_endpoint_id_;
   }
    : update_resolver_endpoint_request)

let make_resolver_dnssec_config
    ?validation_status:(validation_status_ : resolver_dnssec_validation_status option)
    ?resource_id:(resource_id_ : resource_id option) ?owner_id:(owner_id_ : account_id option)
    ?id:(id_ : resource_id option) () =
  ({
     validation_status = validation_status_;
     resource_id = resource_id_;
     owner_id = owner_id_;
     id = id_;
   }
    : resolver_dnssec_config)

let make_update_resolver_dnssec_config_response
    ?resolver_dnssec_config:(resolver_dnssec_config_ : resolver_dnssec_config option) () =
  ({ resolver_dnssec_config = resolver_dnssec_config_ } : update_resolver_dnssec_config_response)

let make_update_resolver_dnssec_config_request ~validation:(validation_ : validation)
    ~resource_id:(resource_id_ : resource_id) () =
  ({ validation = validation_; resource_id = resource_id_ } : update_resolver_dnssec_config_request)

let make_resolver_config
    ?autodefined_reverse:(autodefined_reverse_ : resolver_autodefined_reverse_status option)
    ?owner_id:(owner_id_ : account_id option) ?resource_id:(resource_id_ : resource_id option)
    ?id:(id_ : resource_id option) () =
  ({
     autodefined_reverse = autodefined_reverse_;
     owner_id = owner_id_;
     resource_id = resource_id_;
     id = id_;
   }
    : resolver_config)

let make_update_resolver_config_response
    ?resolver_config:(resolver_config_ : resolver_config option) () =
  ({ resolver_config = resolver_config_ } : update_resolver_config_response)

let make_update_resolver_config_request
    ~autodefined_reverse_flag:(autodefined_reverse_flag_ : autodefined_reverse_flag)
    ~resource_id:(resource_id_ : resource_id) () =
  ({ autodefined_reverse_flag = autodefined_reverse_flag_; resource_id = resource_id_ }
    : update_resolver_config_request)

let make_outpost_resolver ?outpost_arn:(outpost_arn_ : outpost_arn option)
    ?status_message:(status_message_ : outpost_resolver_status_message option)
    ?status:(status_ : outpost_resolver_status option) ?name:(name_ : outpost_resolver_name option)
    ?preferred_instance_type:(preferred_instance_type_ : outpost_instance_type option)
    ?instance_count:(instance_count_ : instance_count option) ?id:(id_ : resource_id option)
    ?creator_request_id:(creator_request_id_ : creator_request_id option)
    ?modification_time:(modification_time_ : rfc3339_time_string option)
    ?creation_time:(creation_time_ : rfc3339_time_string option) ?arn:(arn_ : arn option) () =
  ({
     outpost_arn = outpost_arn_;
     status_message = status_message_;
     status = status_;
     name = name_;
     preferred_instance_type = preferred_instance_type_;
     instance_count = instance_count_;
     id = id_;
     creator_request_id = creator_request_id_;
     modification_time = modification_time_;
     creation_time = creation_time_;
     arn = arn_;
   }
    : outpost_resolver)

let make_update_outpost_resolver_response
    ?outpost_resolver:(outpost_resolver_ : outpost_resolver option) () =
  ({ outpost_resolver = outpost_resolver_ } : update_outpost_resolver_response)

let make_update_outpost_resolver_request
    ?preferred_instance_type:(preferred_instance_type_ : outpost_instance_type option)
    ?instance_count:(instance_count_ : instance_count option)
    ?name:(name_ : outpost_resolver_name option) ~id:(id_ : resource_id) () =
  ({
     preferred_instance_type = preferred_instance_type_;
     instance_count = instance_count_;
     name = name_;
     id = id_;
   }
    : update_outpost_resolver_request)

let make_partner_threat_protection_config ~partner:(partner_ : partner_value) () =
  ({ partner = partner_ } : partner_threat_protection_config)

let make_firewall_advanced_content_category_config
    ~category:(category_ : firewall_advanced_content_category_value) () =
  ({ category = category_ } : firewall_advanced_content_category_config)

let make_firewall_advanced_threat_category_config
    ~category:(category_ : firewall_advanced_threat_category_value) () =
  ({ category = category_ } : firewall_advanced_threat_category_config)

let make_dns_threat_protection_rule_type_config
    ~confidence_threshold:(confidence_threshold_ : confidence_threshold)
    ~value:(value_ : dns_threat_protection_rule_type_value) () =
  ({ confidence_threshold = confidence_threshold_; value = value_ }
    : dns_threat_protection_rule_type_config)

let make_firewall_rule_type
    ?dns_threat_protection:(dns_threat_protection_ : dns_threat_protection_rule_type_config option)
    ?firewall_advanced_threat_category:
      (firewall_advanced_threat_category_ : firewall_advanced_threat_category_config option)
    ?firewall_advanced_content_category:
      (firewall_advanced_content_category_ : firewall_advanced_content_category_config option)
    ?partner_threat_protection:
      (partner_threat_protection_ : partner_threat_protection_config option) () =
  ({
     dns_threat_protection = dns_threat_protection_;
     firewall_advanced_threat_category = firewall_advanced_threat_category_;
     firewall_advanced_content_category = firewall_advanced_content_category_;
     partner_threat_protection = partner_threat_protection_;
   }
    : firewall_rule_type)

let make_firewall_rule ?status_message:(status_message_ : firewall_rule_status_message option)
    ?status:(status_ : firewall_rule_status option)
    ?firewall_rule_type:(firewall_rule_type_ : firewall_rule_type option)
    ?confidence_threshold:(confidence_threshold_ : confidence_threshold option)
    ?dns_threat_protection:(dns_threat_protection_ : dns_threat_protection option)
    ?qtype:(qtype_ : qtype option)
    ?firewall_domain_redirection_action:
      (firewall_domain_redirection_action_ : firewall_domain_redirection_action option)
    ?modification_time:(modification_time_ : rfc3339_time_string option)
    ?creation_time:(creation_time_ : rfc3339_time_string option)
    ?creator_request_id:(creator_request_id_ : creator_request_id option)
    ?block_override_ttl:(block_override_ttl_ : unsigned option)
    ?block_override_dns_type:(block_override_dns_type_ : block_override_dns_type option)
    ?block_override_domain:(block_override_domain_ : block_override_domain option)
    ?block_response:(block_response_ : block_response option) ?action:(action_ : action option)
    ?priority:(priority_ : priority option) ?name:(name_ : name option)
    ?firewall_threat_protection_id:(firewall_threat_protection_id_ : resource_id option)
    ?firewall_domain_list_id:(firewall_domain_list_id_ : resource_id option)
    ?firewall_rule_group_id:(firewall_rule_group_id_ : resource_id option) () =
  ({
     status_message = status_message_;
     status = status_;
     firewall_rule_type = firewall_rule_type_;
     confidence_threshold = confidence_threshold_;
     dns_threat_protection = dns_threat_protection_;
     qtype = qtype_;
     firewall_domain_redirection_action = firewall_domain_redirection_action_;
     modification_time = modification_time_;
     creation_time = creation_time_;
     creator_request_id = creator_request_id_;
     block_override_ttl = block_override_ttl_;
     block_override_dns_type = block_override_dns_type_;
     block_override_domain = block_override_domain_;
     block_response = block_response_;
     action = action_;
     priority = priority_;
     name = name_;
     firewall_threat_protection_id = firewall_threat_protection_id_;
     firewall_domain_list_id = firewall_domain_list_id_;
     firewall_rule_group_id = firewall_rule_group_id_;
   }
    : firewall_rule)

let make_update_firewall_rule_response ?firewall_rule:(firewall_rule_ : firewall_rule option) () =
  ({ firewall_rule = firewall_rule_ } : update_firewall_rule_response)

let make_update_firewall_rule_request
    ?firewall_rule_type:(firewall_rule_type_ : firewall_rule_type option)
    ?confidence_threshold:(confidence_threshold_ : confidence_threshold option)
    ?dns_threat_protection:(dns_threat_protection_ : dns_threat_protection option)
    ?qtype:(qtype_ : qtype option)
    ?firewall_domain_redirection_action:
      (firewall_domain_redirection_action_ : firewall_domain_redirection_action option)
    ?name:(name_ : name option)
    ?block_override_ttl:(block_override_ttl_ : block_override_ttl option)
    ?block_override_dns_type:(block_override_dns_type_ : block_override_dns_type option)
    ?block_override_domain:(block_override_domain_ : block_override_domain option)
    ?block_response:(block_response_ : block_response option) ?action:(action_ : action option)
    ?priority:(priority_ : priority option)
    ?firewall_threat_protection_id:(firewall_threat_protection_id_ : resource_id option)
    ?firewall_domain_list_id:(firewall_domain_list_id_ : resource_id option)
    ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id) () =
  ({
     firewall_rule_type = firewall_rule_type_;
     confidence_threshold = confidence_threshold_;
     dns_threat_protection = dns_threat_protection_;
     qtype = qtype_;
     firewall_domain_redirection_action = firewall_domain_redirection_action_;
     name = name_;
     block_override_ttl = block_override_ttl_;
     block_override_dns_type = block_override_dns_type_;
     block_override_domain = block_override_domain_;
     block_response = block_response_;
     action = action_;
     priority = priority_;
     firewall_threat_protection_id = firewall_threat_protection_id_;
     firewall_domain_list_id = firewall_domain_list_id_;
     firewall_rule_group_id = firewall_rule_group_id_;
   }
    : update_firewall_rule_request)

let make_firewall_rule_group_association
    ?modification_time:(modification_time_ : rfc3339_time_string option)
    ?creation_time:(creation_time_ : rfc3339_time_string option)
    ?creator_request_id:(creator_request_id_ : creator_request_id option)
    ?status_message:(status_message_ : status_message option)
    ?status:(status_ : firewall_rule_group_association_status option)
    ?managed_owner_name:(managed_owner_name_ : service_principle option)
    ?mutation_protection:(mutation_protection_ : mutation_protection_status option)
    ?priority:(priority_ : priority option) ?name:(name_ : name option)
    ?vpc_id:(vpc_id_ : resource_id option)
    ?firewall_rule_group_id:(firewall_rule_group_id_ : resource_id option) ?arn:(arn_ : arn option)
    ?id:(id_ : resource_id option) () =
  ({
     modification_time = modification_time_;
     creation_time = creation_time_;
     creator_request_id = creator_request_id_;
     status_message = status_message_;
     status = status_;
     managed_owner_name = managed_owner_name_;
     mutation_protection = mutation_protection_;
     priority = priority_;
     name = name_;
     vpc_id = vpc_id_;
     firewall_rule_group_id = firewall_rule_group_id_;
     arn = arn_;
     id = id_;
   }
    : firewall_rule_group_association)

let make_update_firewall_rule_group_association_response
    ?firewall_rule_group_association:
      (firewall_rule_group_association_ : firewall_rule_group_association option) () =
  ({ firewall_rule_group_association = firewall_rule_group_association_ }
    : update_firewall_rule_group_association_response)

let make_update_firewall_rule_group_association_request ?name:(name_ : name option)
    ?mutation_protection:(mutation_protection_ : mutation_protection_status option)
    ?priority:(priority_ : priority option)
    ~firewall_rule_group_association_id:(firewall_rule_group_association_id_ : resource_id) () =
  ({
     name = name_;
     mutation_protection = mutation_protection_;
     priority = priority_;
     firewall_rule_group_association_id = firewall_rule_group_association_id_;
   }
    : update_firewall_rule_group_association_request)

let make_update_firewall_rule_entry
    ?firewall_rule_type:(firewall_rule_type_ : firewall_rule_type option)
    ?confidence_threshold:(confidence_threshold_ : confidence_threshold option)
    ?dns_threat_protection:(dns_threat_protection_ : dns_threat_protection option)
    ?qtype:(qtype_ : qtype option)
    ?firewall_domain_redirection_action:
      (firewall_domain_redirection_action_ : firewall_domain_redirection_action option)
    ?name:(name_ : name option)
    ?block_override_ttl:(block_override_ttl_ : block_override_ttl option)
    ?block_override_dns_type:(block_override_dns_type_ : block_override_dns_type option)
    ?block_override_domain:(block_override_domain_ : block_override_domain option)
    ?block_response:(block_response_ : block_response option) ?action:(action_ : action option)
    ?priority:(priority_ : priority option)
    ?firewall_threat_protection_id:(firewall_threat_protection_id_ : resource_id option)
    ?firewall_domain_list_id:(firewall_domain_list_id_ : resource_id option)
    ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id) () =
  ({
     firewall_rule_type = firewall_rule_type_;
     confidence_threshold = confidence_threshold_;
     dns_threat_protection = dns_threat_protection_;
     qtype = qtype_;
     firewall_domain_redirection_action = firewall_domain_redirection_action_;
     name = name_;
     block_override_ttl = block_override_ttl_;
     block_override_dns_type = block_override_dns_type_;
     block_override_domain = block_override_domain_;
     block_response = block_response_;
     action = action_;
     priority = priority_;
     firewall_threat_protection_id = firewall_threat_protection_id_;
     firewall_domain_list_id = firewall_domain_list_id_;
     firewall_rule_group_id = firewall_rule_group_id_;
   }
    : update_firewall_rule_entry)

let make_update_firewall_domains_response ?status_message:(status_message_ : status_message option)
    ?status:(status_ : firewall_domain_list_status option) ?name:(name_ : name option)
    ?id:(id_ : resource_id option) () =
  ({ status_message = status_message_; status = status_; name = name_; id = id_ }
    : update_firewall_domains_response)

let make_update_firewall_domains_request ~domains:(domains_ : firewall_domains)
    ~operation:(operation_ : firewall_domain_update_operation)
    ~firewall_domain_list_id:(firewall_domain_list_id_ : resource_id) () =
  ({
     domains = domains_;
     operation = operation_;
     firewall_domain_list_id = firewall_domain_list_id_;
   }
    : update_firewall_domains_request)

let make_firewall_config
    ?firewall_fail_open:(firewall_fail_open_ : firewall_fail_open_status option)
    ?owner_id:(owner_id_ : account_id option) ?resource_id:(resource_id_ : resource_id option)
    ?id:(id_ : resource_id option) () =
  ({
     firewall_fail_open = firewall_fail_open_;
     owner_id = owner_id_;
     resource_id = resource_id_;
     id = id_;
   }
    : firewall_config)

let make_update_firewall_config_response
    ?firewall_config:(firewall_config_ : firewall_config option) () =
  ({ firewall_config = firewall_config_ } : update_firewall_config_response)

let make_update_firewall_config_request
    ~firewall_fail_open:(firewall_fail_open_ : firewall_fail_open_status)
    ~resource_id:(resource_id_ : resource_id) () =
  ({ firewall_fail_open = firewall_fail_open_; resource_id = resource_id_ }
    : update_firewall_config_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list) ~resource_arn:(resource_arn_ : arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_subscription_info ?product_id:(product_id_ : product_id option)
    ?vendor_name:(vendor_name_ : vendor_name option) () =
  ({ product_id = product_id_; vendor_name = vendor_name_ } : subscription_info)

let make_put_resolver_rule_policy_response ?return_value:(return_value_ : boolean_ option) () =
  ({ return_value = return_value_ } : put_resolver_rule_policy_response)

let make_put_resolver_rule_policy_request
    ~resolver_rule_policy:(resolver_rule_policy_ : resolver_rule_policy) ~arn:(arn_ : arn) () =
  ({ resolver_rule_policy = resolver_rule_policy_; arn = arn_ } : put_resolver_rule_policy_request)

let make_put_resolver_query_log_config_policy_response
    ?return_value:(return_value_ : boolean_ option) () =
  ({ return_value = return_value_ } : put_resolver_query_log_config_policy_response)

let make_put_resolver_query_log_config_policy_request
    ~resolver_query_log_config_policy:
      (resolver_query_log_config_policy_ : resolver_query_log_config_policy) ~arn:(arn_ : arn) () =
  ({ resolver_query_log_config_policy = resolver_query_log_config_policy_; arn = arn_ }
    : put_resolver_query_log_config_policy_request)

let make_put_firewall_rule_group_policy_response ?return_value:(return_value_ : boolean_ option) ()
    =
  ({ return_value = return_value_ } : put_firewall_rule_group_policy_response)

let make_put_firewall_rule_group_policy_request
    ~firewall_rule_group_policy:(firewall_rule_group_policy_ : firewall_rule_group_policy)
    ~arn:(arn_ : arn) () =
  ({ firewall_rule_group_policy = firewall_rule_group_policy_; arn = arn_ }
    : put_firewall_rule_group_policy_request)

let make_list_tags_for_resource_response ?next_token:(next_token_ : next_token option)
    ?tags:(tags_ : tag_list option) () =
  ({ next_token = next_token_; tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~resource_arn:(resource_arn_ : arn) () =
  ({ next_token = next_token_; max_results = max_results_; resource_arn = resource_arn_ }
    : list_tags_for_resource_request)

let make_list_resolver_rules_response ?resolver_rules:(resolver_rules_ : resolver_rules option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ resolver_rules = resolver_rules_; max_results = max_results_; next_token = next_token_ }
    : list_resolver_rules_response)

let make_filter ?values:(values_ : filter_values option) ?name:(name_ : filter_name option) () =
  ({ values = values_; name = name_ } : filter)

let make_list_resolver_rules_request ?filters:(filters_ : filters option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ filters = filters_; next_token = next_token_; max_results = max_results_ }
    : list_resolver_rules_request)

let make_resolver_rule_association ?status_message:(status_message_ : status_message option)
    ?status:(status_ : resolver_rule_association_status option)
    ?vpc_id:(vpc_id_ : resource_id option) ?name:(name_ : name option)
    ?resolver_rule_id:(resolver_rule_id_ : resource_id option) ?id:(id_ : resource_id option) () =
  ({
     status_message = status_message_;
     status = status_;
     vpc_id = vpc_id_;
     name = name_;
     resolver_rule_id = resolver_rule_id_;
     id = id_;
   }
    : resolver_rule_association)

let make_list_resolver_rule_associations_response
    ?resolver_rule_associations:(resolver_rule_associations_ : resolver_rule_associations option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     resolver_rule_associations = resolver_rule_associations_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_resolver_rule_associations_response)

let make_list_resolver_rule_associations_request ?filters:(filters_ : filters option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ filters = filters_; next_token = next_token_; max_results = max_results_ }
    : list_resolver_rule_associations_request)

let make_resolver_query_log_config ?creation_time:(creation_time_ : rfc3339_time_string option)
    ?creator_request_id:(creator_request_id_ : creator_request_id option)
    ?destination_arn:(destination_arn_ : destination_arn option)
    ?name:(name_ : resolver_query_log_config_name option) ?arn:(arn_ : arn option)
    ?association_count:(association_count_ : count option)
    ?share_status:(share_status_ : share_status option)
    ?status:(status_ : resolver_query_log_config_status option)
    ?owner_id:(owner_id_ : account_id option) ?id:(id_ : resource_id option) () =
  ({
     creation_time = creation_time_;
     creator_request_id = creator_request_id_;
     destination_arn = destination_arn_;
     name = name_;
     arn = arn_;
     association_count = association_count_;
     share_status = share_status_;
     status = status_;
     owner_id = owner_id_;
     id = id_;
   }
    : resolver_query_log_config)

let make_list_resolver_query_log_configs_response
    ?resolver_query_log_configs:
      (resolver_query_log_configs_ : resolver_query_log_config_list option)
    ?total_filtered_count:(total_filtered_count_ : count option)
    ?total_count:(total_count_ : count option) ?next_token:(next_token_ : next_token option) () =
  ({
     resolver_query_log_configs = resolver_query_log_configs_;
     total_filtered_count = total_filtered_count_;
     total_count = total_count_;
     next_token = next_token_;
   }
    : list_resolver_query_log_configs_response)

let make_list_resolver_query_log_configs_request ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_by_key option) ?filters:(filters_ : filters option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_resolver_query_log_configs_request)

let make_resolver_query_log_config_association
    ?creation_time:(creation_time_ : rfc3339_time_string option)
    ?error_message:(error_message_ : resolver_query_log_config_association_error_message option)
    ?error:(error_ : resolver_query_log_config_association_error option)
    ?status:(status_ : resolver_query_log_config_association_status option)
    ?resource_id:(resource_id_ : resource_id option)
    ?resolver_query_log_config_id:(resolver_query_log_config_id_ : resource_id option)
    ?id:(id_ : resource_id option) () =
  ({
     creation_time = creation_time_;
     error_message = error_message_;
     error = error_;
     status = status_;
     resource_id = resource_id_;
     resolver_query_log_config_id = resolver_query_log_config_id_;
     id = id_;
   }
    : resolver_query_log_config_association)

let make_list_resolver_query_log_config_associations_response
    ?resolver_query_log_config_associations:
      (resolver_query_log_config_associations_ : resolver_query_log_config_association_list option)
    ?total_filtered_count:(total_filtered_count_ : count option)
    ?total_count:(total_count_ : count option) ?next_token:(next_token_ : next_token option) () =
  ({
     resolver_query_log_config_associations = resolver_query_log_config_associations_;
     total_filtered_count = total_filtered_count_;
     total_count = total_count_;
     next_token = next_token_;
   }
    : list_resolver_query_log_config_associations_response)

let make_list_resolver_query_log_config_associations_request
    ?sort_order:(sort_order_ : sort_order option) ?sort_by:(sort_by_ : sort_by_key option)
    ?filters:(filters_ : filters option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_resolver_query_log_config_associations_request)

let make_list_resolver_endpoints_response
    ?resolver_endpoints:(resolver_endpoints_ : resolver_endpoints option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     resolver_endpoints = resolver_endpoints_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_resolver_endpoints_response)

let make_list_resolver_endpoints_request ?filters:(filters_ : filters option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ filters = filters_; next_token = next_token_; max_results = max_results_ }
    : list_resolver_endpoints_request)

let make_ip_address_response ?modification_time:(modification_time_ : rfc3339_time_string option)
    ?creation_time:(creation_time_ : rfc3339_time_string option)
    ?status_message:(status_message_ : status_message option)
    ?status:(status_ : ip_address_status option) ?ipv6:(ipv6_ : ipv6 option) ?ip:(ip_ : ip option)
    ?subnet_id:(subnet_id_ : subnet_id option) ?ip_id:(ip_id_ : resource_id option) () =
  ({
     modification_time = modification_time_;
     creation_time = creation_time_;
     status_message = status_message_;
     status = status_;
     ipv6 = ipv6_;
     ip = ip_;
     subnet_id = subnet_id_;
     ip_id = ip_id_;
   }
    : ip_address_response)

let make_list_resolver_endpoint_ip_addresses_response
    ?ip_addresses:(ip_addresses_ : ip_addresses_response option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ ip_addresses = ip_addresses_; max_results = max_results_; next_token = next_token_ }
    : list_resolver_endpoint_ip_addresses_response)

let make_list_resolver_endpoint_ip_addresses_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~resolver_endpoint_id:(resolver_endpoint_id_ : resource_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     resolver_endpoint_id = resolver_endpoint_id_;
   }
    : list_resolver_endpoint_ip_addresses_request)

let make_list_resolver_dnssec_configs_response
    ?resolver_dnssec_configs:(resolver_dnssec_configs_ : resolver_dnssec_config_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ resolver_dnssec_configs = resolver_dnssec_configs_; next_token = next_token_ }
    : list_resolver_dnssec_configs_response)

let make_list_resolver_dnssec_configs_request ?filters:(filters_ : filters option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ filters = filters_; next_token = next_token_; max_results = max_results_ }
    : list_resolver_dnssec_configs_request)

let make_list_resolver_configs_response
    ?resolver_configs:(resolver_configs_ : resolver_config_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ resolver_configs = resolver_configs_; next_token = next_token_ }
    : list_resolver_configs_response)

let make_list_resolver_configs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : list_resolver_configs_max_result option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_resolver_configs_request)

let make_list_outpost_resolvers_response ?next_token:(next_token_ : next_token option)
    ?outpost_resolvers:(outpost_resolvers_ : outpost_resolver_list option) () =
  ({ next_token = next_token_; outpost_resolvers = outpost_resolvers_ }
    : list_outpost_resolvers_response)

let make_list_outpost_resolvers_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?outpost_arn:(outpost_arn_ : outpost_arn option) () =
  ({ next_token = next_token_; max_results = max_results_; outpost_arn = outpost_arn_ }
    : list_outpost_resolvers_request)

let make_firewall_rule_type_definition
    ?subscription_info:(subscription_info_ : subscription_info option)
    ?description:(description_ : rule_type_description option)
    ?display_name:(display_name_ : display_name option) ?value:(value_ : rule_type_value option)
    ?rule_type:(rule_type_ : rule_type_name option) () =
  ({
     subscription_info = subscription_info_;
     description = description_;
     display_name = display_name_;
     value = value_;
     rule_type = rule_type_;
   }
    : firewall_rule_type_definition)

let make_list_firewall_rule_types_response ?next_token:(next_token_ : next_token option)
    ?firewall_rule_types:(firewall_rule_types_ : firewall_rule_type_definitions option) () =
  ({ next_token = next_token_; firewall_rule_types = firewall_rule_types_ }
    : list_firewall_rule_types_response)

let make_list_firewall_rule_types_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?rule_type:(rule_type_ : rule_type_name option)
    () =
  ({ next_token = next_token_; max_results = max_results_; rule_type = rule_type_ }
    : list_firewall_rule_types_request)

let make_list_firewall_rules_response ?firewall_rules:(firewall_rules_ : firewall_rules option)
    ?next_token:(next_token_ : next_token option) () =
  ({ firewall_rules = firewall_rules_; next_token = next_token_ } : list_firewall_rules_response)

let make_list_firewall_rules_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?action:(action_ : action option)
    ?priority:(priority_ : priority option)
    ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     action = action_;
     priority = priority_;
     firewall_rule_group_id = firewall_rule_group_id_;
   }
    : list_firewall_rules_request)

let make_firewall_rule_group_metadata ?share_status:(share_status_ : share_status option)
    ?creator_request_id:(creator_request_id_ : creator_request_id option)
    ?owner_id:(owner_id_ : account_id option) ?name:(name_ : name option) ?arn:(arn_ : arn option)
    ?id:(id_ : resource_id option) () =
  ({
     share_status = share_status_;
     creator_request_id = creator_request_id_;
     owner_id = owner_id_;
     name = name_;
     arn = arn_;
     id = id_;
   }
    : firewall_rule_group_metadata)

let make_list_firewall_rule_groups_response
    ?firewall_rule_groups:(firewall_rule_groups_ : firewall_rule_group_metadata_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ firewall_rule_groups = firewall_rule_groups_; next_token = next_token_ }
    : list_firewall_rule_groups_response)

let make_list_firewall_rule_groups_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_firewall_rule_groups_request)

let make_list_firewall_rule_group_associations_response
    ?firewall_rule_group_associations:
      (firewall_rule_group_associations_ : firewall_rule_group_associations option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     firewall_rule_group_associations = firewall_rule_group_associations_;
     next_token = next_token_;
   }
    : list_firewall_rule_group_associations_response)

let make_list_firewall_rule_group_associations_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?status:(status_ : firewall_rule_group_association_status option)
    ?priority:(priority_ : priority option) ?vpc_id:(vpc_id_ : resource_id option)
    ?firewall_rule_group_id:(firewall_rule_group_id_ : resource_id option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     status = status_;
     priority = priority_;
     vpc_id = vpc_id_;
     firewall_rule_group_id = firewall_rule_group_id_;
   }
    : list_firewall_rule_group_associations_request)

let make_list_firewall_domains_response ?domains:(domains_ : firewall_domains option)
    ?next_token:(next_token_ : next_token option) () =
  ({ domains = domains_; next_token = next_token_ } : list_firewall_domains_response)

let make_list_firewall_domains_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : list_domain_max_results option)
    ~firewall_domain_list_id:(firewall_domain_list_id_ : resource_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     firewall_domain_list_id = firewall_domain_list_id_;
   }
    : list_firewall_domains_request)

let make_firewall_domain_list_metadata ?category:(category_ : category option)
    ?managed_list_type:(managed_list_type_ : domain_list_type option)
    ?managed_owner_name:(managed_owner_name_ : service_principle option)
    ?creator_request_id:(creator_request_id_ : creator_request_id option)
    ?name:(name_ : name option) ?arn:(arn_ : arn option) ?id:(id_ : resource_id option) () =
  ({
     category = category_;
     managed_list_type = managed_list_type_;
     managed_owner_name = managed_owner_name_;
     creator_request_id = creator_request_id_;
     name = name_;
     arn = arn_;
     id = id_;
   }
    : firewall_domain_list_metadata)

let make_list_firewall_domain_lists_response
    ?firewall_domain_lists:(firewall_domain_lists_ : firewall_domain_list_metadata_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ firewall_domain_lists = firewall_domain_lists_; next_token = next_token_ }
    : list_firewall_domain_lists_response)

let make_list_firewall_domain_lists_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_firewall_domain_lists_request)

let make_list_firewall_configs_response
    ?firewall_configs:(firewall_configs_ : firewall_config_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ firewall_configs = firewall_configs_; next_token = next_token_ }
    : list_firewall_configs_response)

let make_list_firewall_configs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : list_firewall_configs_max_result option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_firewall_configs_request)

let make_import_firewall_domains_response ?status_message:(status_message_ : status_message option)
    ?status:(status_ : firewall_domain_list_status option) ?name:(name_ : name option)
    ?id:(id_ : resource_id option) () =
  ({ status_message = status_message_; status = status_; name = name_; id = id_ }
    : import_firewall_domains_response)

let make_import_firewall_domains_request ~domain_file_url:(domain_file_url_ : domain_list_file_url)
    ~operation:(operation_ : firewall_domain_import_operation)
    ~firewall_domain_list_id:(firewall_domain_list_id_ : resource_id) () =
  ({
     domain_file_url = domain_file_url_;
     operation = operation_;
     firewall_domain_list_id = firewall_domain_list_id_;
   }
    : import_firewall_domains_request)

let make_get_resolver_rule_policy_response
    ?resolver_rule_policy:(resolver_rule_policy_ : resolver_rule_policy option) () =
  ({ resolver_rule_policy = resolver_rule_policy_ } : get_resolver_rule_policy_response)

let make_get_resolver_rule_policy_request ~arn:(arn_ : arn) () =
  ({ arn = arn_ } : get_resolver_rule_policy_request)

let make_get_resolver_rule_association_response
    ?resolver_rule_association:(resolver_rule_association_ : resolver_rule_association option) () =
  ({ resolver_rule_association = resolver_rule_association_ }
    : get_resolver_rule_association_response)

let make_get_resolver_rule_association_request
    ~resolver_rule_association_id:(resolver_rule_association_id_ : resource_id) () =
  ({ resolver_rule_association_id = resolver_rule_association_id_ }
    : get_resolver_rule_association_request)

let make_get_resolver_rule_response ?resolver_rule:(resolver_rule_ : resolver_rule option) () =
  ({ resolver_rule = resolver_rule_ } : get_resolver_rule_response)

let make_get_resolver_rule_request ~resolver_rule_id:(resolver_rule_id_ : resource_id) () =
  ({ resolver_rule_id = resolver_rule_id_ } : get_resolver_rule_request)

let make_get_resolver_query_log_config_policy_response
    ?resolver_query_log_config_policy:
      (resolver_query_log_config_policy_ : resolver_query_log_config_policy option) () =
  ({ resolver_query_log_config_policy = resolver_query_log_config_policy_ }
    : get_resolver_query_log_config_policy_response)

let make_get_resolver_query_log_config_policy_request ~arn:(arn_ : arn) () =
  ({ arn = arn_ } : get_resolver_query_log_config_policy_request)

let make_get_resolver_query_log_config_association_response
    ?resolver_query_log_config_association:
      (resolver_query_log_config_association_ : resolver_query_log_config_association option) () =
  ({ resolver_query_log_config_association = resolver_query_log_config_association_ }
    : get_resolver_query_log_config_association_response)

let make_get_resolver_query_log_config_association_request
    ~resolver_query_log_config_association_id:
      (resolver_query_log_config_association_id_ : resource_id) () =
  ({ resolver_query_log_config_association_id = resolver_query_log_config_association_id_ }
    : get_resolver_query_log_config_association_request)

let make_get_resolver_query_log_config_response
    ?resolver_query_log_config:(resolver_query_log_config_ : resolver_query_log_config option) () =
  ({ resolver_query_log_config = resolver_query_log_config_ }
    : get_resolver_query_log_config_response)

let make_get_resolver_query_log_config_request
    ~resolver_query_log_config_id:(resolver_query_log_config_id_ : resource_id) () =
  ({ resolver_query_log_config_id = resolver_query_log_config_id_ }
    : get_resolver_query_log_config_request)

let make_get_resolver_endpoint_response
    ?resolver_endpoint:(resolver_endpoint_ : resolver_endpoint option) () =
  ({ resolver_endpoint = resolver_endpoint_ } : get_resolver_endpoint_response)

let make_get_resolver_endpoint_request ~resolver_endpoint_id:(resolver_endpoint_id_ : resource_id)
    () =
  ({ resolver_endpoint_id = resolver_endpoint_id_ } : get_resolver_endpoint_request)

let make_get_resolver_dnssec_config_response
    ?resolver_dnssec_config:(resolver_dnssec_config_ : resolver_dnssec_config option) () =
  ({ resolver_dnssec_config = resolver_dnssec_config_ } : get_resolver_dnssec_config_response)

let make_get_resolver_dnssec_config_request ~resource_id:(resource_id_ : resource_id) () =
  ({ resource_id = resource_id_ } : get_resolver_dnssec_config_request)

let make_get_resolver_config_response ?resolver_config:(resolver_config_ : resolver_config option)
    () =
  ({ resolver_config = resolver_config_ } : get_resolver_config_response)

let make_get_resolver_config_request ~resource_id:(resource_id_ : resource_id) () =
  ({ resource_id = resource_id_ } : get_resolver_config_request)

let make_get_outpost_resolver_response
    ?outpost_resolver:(outpost_resolver_ : outpost_resolver option) () =
  ({ outpost_resolver = outpost_resolver_ } : get_outpost_resolver_response)

let make_get_outpost_resolver_request ~id:(id_ : resource_id) () =
  ({ id = id_ } : get_outpost_resolver_request)

let make_get_firewall_rule_group_policy_response
    ?firewall_rule_group_policy:(firewall_rule_group_policy_ : firewall_rule_group_policy option) ()
    =
  ({ firewall_rule_group_policy = firewall_rule_group_policy_ }
    : get_firewall_rule_group_policy_response)

let make_get_firewall_rule_group_policy_request ~arn:(arn_ : arn) () =
  ({ arn = arn_ } : get_firewall_rule_group_policy_request)

let make_get_firewall_rule_group_association_response
    ?firewall_rule_group_association:
      (firewall_rule_group_association_ : firewall_rule_group_association option) () =
  ({ firewall_rule_group_association = firewall_rule_group_association_ }
    : get_firewall_rule_group_association_response)

let make_get_firewall_rule_group_association_request
    ~firewall_rule_group_association_id:(firewall_rule_group_association_id_ : resource_id) () =
  ({ firewall_rule_group_association_id = firewall_rule_group_association_id_ }
    : get_firewall_rule_group_association_request)

let make_firewall_rule_group ?modification_time:(modification_time_ : rfc3339_time_string option)
    ?creation_time:(creation_time_ : rfc3339_time_string option)
    ?share_status:(share_status_ : share_status option)
    ?creator_request_id:(creator_request_id_ : creator_request_id option)
    ?owner_id:(owner_id_ : account_id option)
    ?status_message:(status_message_ : status_message option)
    ?status:(status_ : firewall_rule_group_status option)
    ?rule_count:(rule_count_ : unsigned option) ?name:(name_ : name option) ?arn:(arn_ : arn option)
    ?id:(id_ : resource_id option) () =
  ({
     modification_time = modification_time_;
     creation_time = creation_time_;
     share_status = share_status_;
     creator_request_id = creator_request_id_;
     owner_id = owner_id_;
     status_message = status_message_;
     status = status_;
     rule_count = rule_count_;
     name = name_;
     arn = arn_;
     id = id_;
   }
    : firewall_rule_group)

let make_get_firewall_rule_group_response
    ?firewall_rule_group:(firewall_rule_group_ : firewall_rule_group option) () =
  ({ firewall_rule_group = firewall_rule_group_ } : get_firewall_rule_group_response)

let make_get_firewall_rule_group_request
    ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id) () =
  ({ firewall_rule_group_id = firewall_rule_group_id_ } : get_firewall_rule_group_request)

let make_firewall_domain_list ?managed_list_type:(managed_list_type_ : domain_list_type option)
    ?category:(category_ : category option)
    ?modification_time:(modification_time_ : rfc3339_time_string option)
    ?creation_time:(creation_time_ : rfc3339_time_string option)
    ?creator_request_id:(creator_request_id_ : creator_request_id option)
    ?managed_owner_name:(managed_owner_name_ : service_principle option)
    ?status_message:(status_message_ : status_message option)
    ?status:(status_ : firewall_domain_list_status option)
    ?domain_count:(domain_count_ : unsigned option) ?name:(name_ : name option)
    ?arn:(arn_ : arn option) ?id:(id_ : resource_id option) () =
  ({
     managed_list_type = managed_list_type_;
     category = category_;
     modification_time = modification_time_;
     creation_time = creation_time_;
     creator_request_id = creator_request_id_;
     managed_owner_name = managed_owner_name_;
     status_message = status_message_;
     status = status_;
     domain_count = domain_count_;
     name = name_;
     arn = arn_;
     id = id_;
   }
    : firewall_domain_list)

let make_get_firewall_domain_list_response
    ?firewall_domain_list:(firewall_domain_list_ : firewall_domain_list option) () =
  ({ firewall_domain_list = firewall_domain_list_ } : get_firewall_domain_list_response)

let make_get_firewall_domain_list_request
    ~firewall_domain_list_id:(firewall_domain_list_id_ : resource_id) () =
  ({ firewall_domain_list_id = firewall_domain_list_id_ } : get_firewall_domain_list_request)

let make_get_firewall_config_response ?firewall_config:(firewall_config_ : firewall_config option)
    () =
  ({ firewall_config = firewall_config_ } : get_firewall_config_response)

let make_get_firewall_config_request ~resource_id:(resource_id_ : resource_id) () =
  ({ resource_id = resource_id_ } : get_firewall_config_request)

let make_disassociate_resolver_rule_response
    ?resolver_rule_association:(resolver_rule_association_ : resolver_rule_association option) () =
  ({ resolver_rule_association = resolver_rule_association_ } : disassociate_resolver_rule_response)

let make_disassociate_resolver_rule_request ~resolver_rule_id:(resolver_rule_id_ : resource_id)
    ~vpc_id:(vpc_id_ : resource_id) () =
  ({ resolver_rule_id = resolver_rule_id_; vpc_id = vpc_id_ } : disassociate_resolver_rule_request)

let make_disassociate_resolver_query_log_config_response
    ?resolver_query_log_config_association:
      (resolver_query_log_config_association_ : resolver_query_log_config_association option) () =
  ({ resolver_query_log_config_association = resolver_query_log_config_association_ }
    : disassociate_resolver_query_log_config_response)

let make_disassociate_resolver_query_log_config_request ~resource_id:(resource_id_ : resource_id)
    ~resolver_query_log_config_id:(resolver_query_log_config_id_ : resource_id) () =
  ({ resource_id = resource_id_; resolver_query_log_config_id = resolver_query_log_config_id_ }
    : disassociate_resolver_query_log_config_request)

let make_disassociate_resolver_endpoint_ip_address_response
    ?resolver_endpoint:(resolver_endpoint_ : resolver_endpoint option) () =
  ({ resolver_endpoint = resolver_endpoint_ } : disassociate_resolver_endpoint_ip_address_response)

let make_ip_address_update ?ipv6:(ipv6_ : ipv6 option) ?ip:(ip_ : ip option)
    ?subnet_id:(subnet_id_ : subnet_id option) ?ip_id:(ip_id_ : resource_id option) () =
  ({ ipv6 = ipv6_; ip = ip_; subnet_id = subnet_id_; ip_id = ip_id_ } : ip_address_update)

let make_disassociate_resolver_endpoint_ip_address_request
    ~ip_address:(ip_address_ : ip_address_update)
    ~resolver_endpoint_id:(resolver_endpoint_id_ : resource_id) () =
  ({ ip_address = ip_address_; resolver_endpoint_id = resolver_endpoint_id_ }
    : disassociate_resolver_endpoint_ip_address_request)

let make_disassociate_firewall_rule_group_response
    ?firewall_rule_group_association:
      (firewall_rule_group_association_ : firewall_rule_group_association option) () =
  ({ firewall_rule_group_association = firewall_rule_group_association_ }
    : disassociate_firewall_rule_group_response)

let make_disassociate_firewall_rule_group_request
    ~firewall_rule_group_association_id:(firewall_rule_group_association_id_ : resource_id) () =
  ({ firewall_rule_group_association_id = firewall_rule_group_association_id_ }
    : disassociate_firewall_rule_group_request)

let make_delete_resolver_rule_response ?resolver_rule:(resolver_rule_ : resolver_rule option) () =
  ({ resolver_rule = resolver_rule_ } : delete_resolver_rule_response)

let make_delete_resolver_rule_request ~resolver_rule_id:(resolver_rule_id_ : resource_id) () =
  ({ resolver_rule_id = resolver_rule_id_ } : delete_resolver_rule_request)

let make_delete_resolver_query_log_config_response
    ?resolver_query_log_config:(resolver_query_log_config_ : resolver_query_log_config option) () =
  ({ resolver_query_log_config = resolver_query_log_config_ }
    : delete_resolver_query_log_config_response)

let make_delete_resolver_query_log_config_request
    ~resolver_query_log_config_id:(resolver_query_log_config_id_ : resource_id) () =
  ({ resolver_query_log_config_id = resolver_query_log_config_id_ }
    : delete_resolver_query_log_config_request)

let make_delete_resolver_endpoint_response
    ?resolver_endpoint:(resolver_endpoint_ : resolver_endpoint option) () =
  ({ resolver_endpoint = resolver_endpoint_ } : delete_resolver_endpoint_response)

let make_delete_resolver_endpoint_request
    ~resolver_endpoint_id:(resolver_endpoint_id_ : resource_id) () =
  ({ resolver_endpoint_id = resolver_endpoint_id_ } : delete_resolver_endpoint_request)

let make_delete_outpost_resolver_response
    ?outpost_resolver:(outpost_resolver_ : outpost_resolver option) () =
  ({ outpost_resolver = outpost_resolver_ } : delete_outpost_resolver_response)

let make_delete_outpost_resolver_request ~id:(id_ : resource_id) () =
  ({ id = id_ } : delete_outpost_resolver_request)

let make_delete_firewall_rule_group_response
    ?firewall_rule_group:(firewall_rule_group_ : firewall_rule_group option) () =
  ({ firewall_rule_group = firewall_rule_group_ } : delete_firewall_rule_group_response)

let make_delete_firewall_rule_group_request
    ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id) () =
  ({ firewall_rule_group_id = firewall_rule_group_id_ } : delete_firewall_rule_group_request)

let make_delete_firewall_rule_response ?firewall_rule:(firewall_rule_ : firewall_rule option) () =
  ({ firewall_rule = firewall_rule_ } : delete_firewall_rule_response)

let make_delete_firewall_rule_request ?qtype:(qtype_ : qtype option)
    ?firewall_threat_protection_id:(firewall_threat_protection_id_ : resource_id option)
    ?firewall_domain_list_id:(firewall_domain_list_id_ : resource_id option)
    ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id) () =
  ({
     qtype = qtype_;
     firewall_threat_protection_id = firewall_threat_protection_id_;
     firewall_domain_list_id = firewall_domain_list_id_;
     firewall_rule_group_id = firewall_rule_group_id_;
   }
    : delete_firewall_rule_request)

let make_delete_firewall_domain_list_response
    ?firewall_domain_list:(firewall_domain_list_ : firewall_domain_list option) () =
  ({ firewall_domain_list = firewall_domain_list_ } : delete_firewall_domain_list_response)

let make_delete_firewall_domain_list_request
    ~firewall_domain_list_id:(firewall_domain_list_id_ : resource_id) () =
  ({ firewall_domain_list_id = firewall_domain_list_id_ } : delete_firewall_domain_list_request)

let make_create_resolver_rule_response ?resolver_rule:(resolver_rule_ : resolver_rule option) () =
  ({ resolver_rule = resolver_rule_ } : create_resolver_rule_response)

let make_create_resolver_rule_request
    ?delegation_record:(delegation_record_ : delegation_record option)
    ?tags:(tags_ : tag_list option)
    ?resolver_endpoint_id:(resolver_endpoint_id_ : resource_id option)
    ?target_ips:(target_ips_ : target_list option) ?domain_name:(domain_name_ : domain_name option)
    ?name:(name_ : name option) ~rule_type:(rule_type_ : rule_type_option)
    ~creator_request_id:(creator_request_id_ : creator_request_id) () =
  ({
     delegation_record = delegation_record_;
     tags = tags_;
     resolver_endpoint_id = resolver_endpoint_id_;
     target_ips = target_ips_;
     domain_name = domain_name_;
     rule_type = rule_type_;
     name = name_;
     creator_request_id = creator_request_id_;
   }
    : create_resolver_rule_request)

let make_create_resolver_query_log_config_response
    ?resolver_query_log_config:(resolver_query_log_config_ : resolver_query_log_config option) () =
  ({ resolver_query_log_config = resolver_query_log_config_ }
    : create_resolver_query_log_config_response)

let make_create_resolver_query_log_config_request ?tags:(tags_ : tag_list option)
    ~creator_request_id:(creator_request_id_ : creator_request_id)
    ~destination_arn:(destination_arn_ : destination_arn)
    ~name:(name_ : resolver_query_log_config_name) () =
  ({
     tags = tags_;
     creator_request_id = creator_request_id_;
     destination_arn = destination_arn_;
     name = name_;
   }
    : create_resolver_query_log_config_request)

let make_create_resolver_endpoint_response
    ?resolver_endpoint:(resolver_endpoint_ : resolver_endpoint option) () =
  ({ resolver_endpoint = resolver_endpoint_ } : create_resolver_endpoint_response)

let make_ip_address_request ?ipv6:(ipv6_ : ipv6 option) ?ip:(ip_ : ip option)
    ~subnet_id:(subnet_id_ : subnet_id) () =
  ({ ipv6 = ipv6_; ip = ip_; subnet_id = subnet_id_ } : ip_address_request)

let make_create_resolver_endpoint_request
    ?ipv6_internet_access_enabled:
      (ipv6_internet_access_enabled_ : ipv6_internet_access_enabled option)
    ?dns64_enabled:(dns64_enabled_ : dns64_enabled option)
    ?target_name_server_metrics_enabled:
      (target_name_server_metrics_enabled_ : target_name_server_metrics_enabled option)
    ?rni_enhanced_metrics_enabled:
      (rni_enhanced_metrics_enabled_ : rni_enhanced_metrics_enabled option)
    ?protocols:(protocols_ : protocol_list option)
    ?resolver_endpoint_type:(resolver_endpoint_type_ : resolver_endpoint_type option)
    ?tags:(tags_ : tag_list option)
    ?preferred_instance_type:(preferred_instance_type_ : outpost_instance_type option)
    ?outpost_arn:(outpost_arn_ : outpost_arn option) ?name:(name_ : name option)
    ~ip_addresses:(ip_addresses_ : ip_addresses_request)
    ~direction:(direction_ : resolver_endpoint_direction)
    ~security_group_ids:(security_group_ids_ : security_group_ids)
    ~creator_request_id:(creator_request_id_ : creator_request_id) () =
  ({
     ipv6_internet_access_enabled = ipv6_internet_access_enabled_;
     dns64_enabled = dns64_enabled_;
     target_name_server_metrics_enabled = target_name_server_metrics_enabled_;
     rni_enhanced_metrics_enabled = rni_enhanced_metrics_enabled_;
     protocols = protocols_;
     resolver_endpoint_type = resolver_endpoint_type_;
     tags = tags_;
     preferred_instance_type = preferred_instance_type_;
     outpost_arn = outpost_arn_;
     ip_addresses = ip_addresses_;
     direction = direction_;
     security_group_ids = security_group_ids_;
     name = name_;
     creator_request_id = creator_request_id_;
   }
    : create_resolver_endpoint_request)

let make_create_outpost_resolver_response
    ?outpost_resolver:(outpost_resolver_ : outpost_resolver option) () =
  ({ outpost_resolver = outpost_resolver_ } : create_outpost_resolver_response)

let make_create_outpost_resolver_request ?tags:(tags_ : tag_list option)
    ?instance_count:(instance_count_ : instance_count option)
    ~outpost_arn:(outpost_arn_ : outpost_arn)
    ~preferred_instance_type:(preferred_instance_type_ : outpost_instance_type)
    ~name:(name_ : outpost_resolver_name)
    ~creator_request_id:(creator_request_id_ : creator_request_id) () =
  ({
     tags = tags_;
     outpost_arn = outpost_arn_;
     preferred_instance_type = preferred_instance_type_;
     instance_count = instance_count_;
     name = name_;
     creator_request_id = creator_request_id_;
   }
    : create_outpost_resolver_request)

let make_create_firewall_rule_group_response
    ?firewall_rule_group:(firewall_rule_group_ : firewall_rule_group option) () =
  ({ firewall_rule_group = firewall_rule_group_ } : create_firewall_rule_group_response)

let make_create_firewall_rule_group_request ?tags:(tags_ : tag_list option) ~name:(name_ : name)
    ~creator_request_id:(creator_request_id_ : creator_request_id) () =
  ({ tags = tags_; name = name_; creator_request_id = creator_request_id_ }
    : create_firewall_rule_group_request)

let make_create_firewall_rule_response ?firewall_rule:(firewall_rule_ : firewall_rule option) () =
  ({ firewall_rule = firewall_rule_ } : create_firewall_rule_response)

let make_create_firewall_rule_request
    ?firewall_rule_type:(firewall_rule_type_ : firewall_rule_type option)
    ?confidence_threshold:(confidence_threshold_ : confidence_threshold option)
    ?dns_threat_protection:(dns_threat_protection_ : dns_threat_protection option)
    ?qtype:(qtype_ : qtype option)
    ?firewall_domain_redirection_action:
      (firewall_domain_redirection_action_ : firewall_domain_redirection_action option)
    ?block_override_ttl:(block_override_ttl_ : block_override_ttl option)
    ?block_override_dns_type:(block_override_dns_type_ : block_override_dns_type option)
    ?block_override_domain:(block_override_domain_ : block_override_domain option)
    ?block_response:(block_response_ : block_response option)
    ?firewall_domain_list_id:(firewall_domain_list_id_ : resource_id option) ~name:(name_ : name)
    ~action:(action_ : action) ~priority:(priority_ : priority)
    ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id)
    ~creator_request_id:(creator_request_id_ : creator_request_id) () =
  ({
     firewall_rule_type = firewall_rule_type_;
     confidence_threshold = confidence_threshold_;
     dns_threat_protection = dns_threat_protection_;
     qtype = qtype_;
     firewall_domain_redirection_action = firewall_domain_redirection_action_;
     name = name_;
     block_override_ttl = block_override_ttl_;
     block_override_dns_type = block_override_dns_type_;
     block_override_domain = block_override_domain_;
     block_response = block_response_;
     action = action_;
     priority = priority_;
     firewall_domain_list_id = firewall_domain_list_id_;
     firewall_rule_group_id = firewall_rule_group_id_;
     creator_request_id = creator_request_id_;
   }
    : create_firewall_rule_request)

let make_create_firewall_domain_list_response
    ?firewall_domain_list:(firewall_domain_list_ : firewall_domain_list option) () =
  ({ firewall_domain_list = firewall_domain_list_ } : create_firewall_domain_list_response)

let make_create_firewall_domain_list_request ?tags:(tags_ : tag_list option) ~name:(name_ : name)
    ~creator_request_id:(creator_request_id_ : creator_request_id) () =
  ({ tags = tags_; name = name_; creator_request_id = creator_request_id_ }
    : create_firewall_domain_list_request)

let make_batch_update_firewall_rule_error ?message:(message_ : string_ option)
    ?code:(code_ : string_ option)
    ?firewall_rule:(firewall_rule_ : update_firewall_rule_entry option) () =
  ({ message = message_; code = code_; firewall_rule = firewall_rule_ }
    : batch_update_firewall_rule_error)

let make_batch_update_firewall_rule_response
    ?update_errors:(update_errors_ : batch_update_firewall_rule_errors option)
    ?updated_firewall_rules:(updated_firewall_rules_ : firewall_rules option) () =
  ({ update_errors = update_errors_; updated_firewall_rules = updated_firewall_rules_ }
    : batch_update_firewall_rule_response)

let make_batch_update_firewall_rule_request
    ~update_firewall_rule_entries:(update_firewall_rule_entries_ : update_firewall_rule_entries) ()
    =
  ({ update_firewall_rule_entries = update_firewall_rule_entries_ }
    : batch_update_firewall_rule_request)

let make_delete_firewall_rule_entry ?qtype:(qtype_ : qtype option)
    ?firewall_threat_protection_id:(firewall_threat_protection_id_ : resource_id option)
    ?firewall_domain_list_id:(firewall_domain_list_id_ : resource_id option)
    ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id) () =
  ({
     qtype = qtype_;
     firewall_threat_protection_id = firewall_threat_protection_id_;
     firewall_domain_list_id = firewall_domain_list_id_;
     firewall_rule_group_id = firewall_rule_group_id_;
   }
    : delete_firewall_rule_entry)

let make_batch_delete_firewall_rule_error ?message:(message_ : string_ option)
    ?code:(code_ : string_ option)
    ?firewall_rule:(firewall_rule_ : delete_firewall_rule_entry option) () =
  ({ message = message_; code = code_; firewall_rule = firewall_rule_ }
    : batch_delete_firewall_rule_error)

let make_batch_delete_firewall_rule_response
    ?delete_errors:(delete_errors_ : batch_delete_firewall_rule_errors option)
    ?deleted_firewall_rules:(deleted_firewall_rules_ : firewall_rules option) () =
  ({ delete_errors = delete_errors_; deleted_firewall_rules = deleted_firewall_rules_ }
    : batch_delete_firewall_rule_response)

let make_batch_delete_firewall_rule_request
    ~delete_firewall_rule_entries:(delete_firewall_rule_entries_ : delete_firewall_rule_entries) ()
    =
  ({ delete_firewall_rule_entries = delete_firewall_rule_entries_ }
    : batch_delete_firewall_rule_request)

let make_create_firewall_rule_entry
    ?firewall_rule_type:(firewall_rule_type_ : firewall_rule_type option)
    ?confidence_threshold:(confidence_threshold_ : confidence_threshold option)
    ?dns_threat_protection:(dns_threat_protection_ : dns_threat_protection option)
    ?qtype:(qtype_ : qtype option)
    ?firewall_domain_redirection_action:
      (firewall_domain_redirection_action_ : firewall_domain_redirection_action option)
    ?block_override_ttl:(block_override_ttl_ : block_override_ttl option)
    ?block_override_dns_type:(block_override_dns_type_ : block_override_dns_type option)
    ?block_override_domain:(block_override_domain_ : block_override_domain option)
    ?block_response:(block_response_ : block_response option)
    ?firewall_domain_list_id:(firewall_domain_list_id_ : resource_id option) ~name:(name_ : name)
    ~action:(action_ : action) ~priority:(priority_ : priority)
    ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id)
    ~creator_request_id:(creator_request_id_ : creator_request_id) () =
  ({
     firewall_rule_type = firewall_rule_type_;
     confidence_threshold = confidence_threshold_;
     dns_threat_protection = dns_threat_protection_;
     qtype = qtype_;
     firewall_domain_redirection_action = firewall_domain_redirection_action_;
     name = name_;
     block_override_ttl = block_override_ttl_;
     block_override_dns_type = block_override_dns_type_;
     block_override_domain = block_override_domain_;
     block_response = block_response_;
     action = action_;
     priority = priority_;
     firewall_domain_list_id = firewall_domain_list_id_;
     firewall_rule_group_id = firewall_rule_group_id_;
     creator_request_id = creator_request_id_;
   }
    : create_firewall_rule_entry)

let make_batch_create_firewall_rule_error ?message:(message_ : string_ option)
    ?code:(code_ : string_ option)
    ?firewall_rule:(firewall_rule_ : create_firewall_rule_entry option) () =
  ({ message = message_; code = code_; firewall_rule = firewall_rule_ }
    : batch_create_firewall_rule_error)

let make_batch_create_firewall_rule_response
    ?create_errors:(create_errors_ : batch_create_firewall_rule_errors option)
    ?created_firewall_rules:(created_firewall_rules_ : firewall_rules option) () =
  ({ create_errors = create_errors_; created_firewall_rules = created_firewall_rules_ }
    : batch_create_firewall_rule_response)

let make_batch_create_firewall_rule_request
    ~create_firewall_rule_entries:(create_firewall_rule_entries_ : create_firewall_rule_entries) ()
    =
  ({ create_firewall_rule_entries = create_firewall_rule_entries_ }
    : batch_create_firewall_rule_request)

let make_associate_resolver_rule_response
    ?resolver_rule_association:(resolver_rule_association_ : resolver_rule_association option) () =
  ({ resolver_rule_association = resolver_rule_association_ } : associate_resolver_rule_response)

let make_associate_resolver_rule_request ?name:(name_ : name option) ~vpc_id:(vpc_id_ : resource_id)
    ~resolver_rule_id:(resolver_rule_id_ : resource_id) () =
  ({ vpc_id = vpc_id_; name = name_; resolver_rule_id = resolver_rule_id_ }
    : associate_resolver_rule_request)

let make_associate_resolver_query_log_config_response
    ?resolver_query_log_config_association:
      (resolver_query_log_config_association_ : resolver_query_log_config_association option) () =
  ({ resolver_query_log_config_association = resolver_query_log_config_association_ }
    : associate_resolver_query_log_config_response)

let make_associate_resolver_query_log_config_request ~resource_id:(resource_id_ : resource_id)
    ~resolver_query_log_config_id:(resolver_query_log_config_id_ : resource_id) () =
  ({ resource_id = resource_id_; resolver_query_log_config_id = resolver_query_log_config_id_ }
    : associate_resolver_query_log_config_request)

let make_associate_resolver_endpoint_ip_address_response
    ?resolver_endpoint:(resolver_endpoint_ : resolver_endpoint option) () =
  ({ resolver_endpoint = resolver_endpoint_ } : associate_resolver_endpoint_ip_address_response)

let make_associate_resolver_endpoint_ip_address_request
    ~ip_address:(ip_address_ : ip_address_update)
    ~resolver_endpoint_id:(resolver_endpoint_id_ : resource_id) () =
  ({ ip_address = ip_address_; resolver_endpoint_id = resolver_endpoint_id_ }
    : associate_resolver_endpoint_ip_address_request)

let make_associate_firewall_rule_group_response
    ?firewall_rule_group_association:
      (firewall_rule_group_association_ : firewall_rule_group_association option) () =
  ({ firewall_rule_group_association = firewall_rule_group_association_ }
    : associate_firewall_rule_group_response)

let make_associate_firewall_rule_group_request ?tags:(tags_ : tag_list option)
    ?mutation_protection:(mutation_protection_ : mutation_protection_status option)
    ~name:(name_ : name) ~priority:(priority_ : priority) ~vpc_id:(vpc_id_ : resource_id)
    ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id)
    ~creator_request_id:(creator_request_id_ : creator_request_id) () =
  ({
     tags = tags_;
     mutation_protection = mutation_protection_;
     name = name_;
     priority = priority_;
     vpc_id = vpc_id_;
     firewall_rule_group_id = firewall_rule_group_id_;
     creator_request_id = creator_request_id_;
   }
    : associate_firewall_rule_group_request)
