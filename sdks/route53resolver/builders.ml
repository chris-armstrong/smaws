open Types

let make_firewall_rule_group_association ?id:(id_ : resource_id option) ?arn:(arn_ : arn option)
    ?firewall_rule_group_id:(firewall_rule_group_id_ : resource_id option)
    ?vpc_id:(vpc_id_ : resource_id option) ?name:(name_ : name option)
    ?priority:(priority_ : priority option)
    ?mutation_protection:(mutation_protection_ : mutation_protection_status option)
    ?managed_owner_name:(managed_owner_name_ : service_principle option)
    ?status:(status_ : firewall_rule_group_association_status option)
    ?status_message:(status_message_ : status_message option)
    ?creator_request_id:(creator_request_id_ : creator_request_id option)
    ?creation_time:(creation_time_ : rfc3339_time_string option)
    ?modification_time:(modification_time_ : rfc3339_time_string option) () =
  ({
     id = id_;
     arn = arn_;
     firewall_rule_group_id = firewall_rule_group_id_;
     vpc_id = vpc_id_;
     name = name_;
     priority = priority_;
     mutation_protection = mutation_protection_;
     managed_owner_name = managed_owner_name_;
     status = status_;
     status_message = status_message_;
     creator_request_id = creator_request_id_;
     creation_time = creation_time_;
     modification_time = modification_time_;
   }
    : firewall_rule_group_association)

let make_associate_firewall_rule_group_response
    ?firewall_rule_group_association:
      (firewall_rule_group_association_ : firewall_rule_group_association option) () =
  ({ firewall_rule_group_association = firewall_rule_group_association_ }
    : associate_firewall_rule_group_response)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_associate_firewall_rule_group_request
    ?mutation_protection:(mutation_protection_ : mutation_protection_status option)
    ?tags:(tags_ : tag_list option) ~creator_request_id:(creator_request_id_ : creator_request_id)
    ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id) ~vpc_id:(vpc_id_ : resource_id)
    ~priority:(priority_ : priority) ~name:(name_ : name) () =
  ({
     creator_request_id = creator_request_id_;
     firewall_rule_group_id = firewall_rule_group_id_;
     vpc_id = vpc_id_;
     priority = priority_;
     name = name_;
     mutation_protection = mutation_protection_;
     tags = tags_;
   }
    : associate_firewall_rule_group_request)

let make_resolver_endpoint ?id:(id_ : resource_id option)
    ?creator_request_id:(creator_request_id_ : creator_request_id option) ?arn:(arn_ : arn option)
    ?name:(name_ : name option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?direction:(direction_ : resolver_endpoint_direction option)
    ?ip_address_count:(ip_address_count_ : ip_address_count option)
    ?host_vpc_id:(host_vpc_id_ : resource_id option)
    ?status:(status_ : resolver_endpoint_status option)
    ?status_message:(status_message_ : status_message option)
    ?creation_time:(creation_time_ : rfc3339_time_string option)
    ?modification_time:(modification_time_ : rfc3339_time_string option)
    ?outpost_arn:(outpost_arn_ : outpost_arn option)
    ?preferred_instance_type:(preferred_instance_type_ : outpost_instance_type option)
    ?resolver_endpoint_type:(resolver_endpoint_type_ : resolver_endpoint_type option)
    ?protocols:(protocols_ : protocol_list option)
    ?rni_enhanced_metrics_enabled:
      (rni_enhanced_metrics_enabled_ : rni_enhanced_metrics_enabled option)
    ?target_name_server_metrics_enabled:
      (target_name_server_metrics_enabled_ : target_name_server_metrics_enabled option)
    ?dns64_enabled:(dns64_enabled_ : dns64_enabled option)
    ?ipv6_internet_access_enabled:
      (ipv6_internet_access_enabled_ : ipv6_internet_access_enabled option) () =
  ({
     id = id_;
     creator_request_id = creator_request_id_;
     arn = arn_;
     name = name_;
     security_group_ids = security_group_ids_;
     direction = direction_;
     ip_address_count = ip_address_count_;
     host_vpc_id = host_vpc_id_;
     status = status_;
     status_message = status_message_;
     creation_time = creation_time_;
     modification_time = modification_time_;
     outpost_arn = outpost_arn_;
     preferred_instance_type = preferred_instance_type_;
     resolver_endpoint_type = resolver_endpoint_type_;
     protocols = protocols_;
     rni_enhanced_metrics_enabled = rni_enhanced_metrics_enabled_;
     target_name_server_metrics_enabled = target_name_server_metrics_enabled_;
     dns64_enabled = dns64_enabled_;
     ipv6_internet_access_enabled = ipv6_internet_access_enabled_;
   }
    : resolver_endpoint)

let make_associate_resolver_endpoint_ip_address_response
    ?resolver_endpoint:(resolver_endpoint_ : resolver_endpoint option) () =
  ({ resolver_endpoint = resolver_endpoint_ } : associate_resolver_endpoint_ip_address_response)

let make_ip_address_update ?ip_id:(ip_id_ : resource_id option)
    ?subnet_id:(subnet_id_ : subnet_id option) ?ip:(ip_ : ip option) ?ipv6:(ipv6_ : ipv6 option) ()
    =
  ({ ip_id = ip_id_; subnet_id = subnet_id_; ip = ip_; ipv6 = ipv6_ } : ip_address_update)

let make_associate_resolver_endpoint_ip_address_request
    ~resolver_endpoint_id:(resolver_endpoint_id_ : resource_id)
    ~ip_address:(ip_address_ : ip_address_update) () =
  ({ resolver_endpoint_id = resolver_endpoint_id_; ip_address = ip_address_ }
    : associate_resolver_endpoint_ip_address_request)

let make_resolver_query_log_config_association ?id:(id_ : resource_id option)
    ?resolver_query_log_config_id:(resolver_query_log_config_id_ : resource_id option)
    ?resource_id:(resource_id_ : resource_id option)
    ?status:(status_ : resolver_query_log_config_association_status option)
    ?error:(error_ : resolver_query_log_config_association_error option)
    ?error_message:(error_message_ : resolver_query_log_config_association_error_message option)
    ?creation_time:(creation_time_ : rfc3339_time_string option) () =
  ({
     id = id_;
     resolver_query_log_config_id = resolver_query_log_config_id_;
     resource_id = resource_id_;
     status = status_;
     error = error_;
     error_message = error_message_;
     creation_time = creation_time_;
   }
    : resolver_query_log_config_association)

let make_associate_resolver_query_log_config_response
    ?resolver_query_log_config_association:
      (resolver_query_log_config_association_ : resolver_query_log_config_association option) () =
  ({ resolver_query_log_config_association = resolver_query_log_config_association_ }
    : associate_resolver_query_log_config_response)

let make_associate_resolver_query_log_config_request
    ~resolver_query_log_config_id:(resolver_query_log_config_id_ : resource_id)
    ~resource_id:(resource_id_ : resource_id) () =
  ({ resolver_query_log_config_id = resolver_query_log_config_id_; resource_id = resource_id_ }
    : associate_resolver_query_log_config_request)

let make_resolver_rule_association ?id:(id_ : resource_id option)
    ?resolver_rule_id:(resolver_rule_id_ : resource_id option) ?name:(name_ : name option)
    ?vpc_id:(vpc_id_ : resource_id option)
    ?status:(status_ : resolver_rule_association_status option)
    ?status_message:(status_message_ : status_message option) () =
  ({
     id = id_;
     resolver_rule_id = resolver_rule_id_;
     name = name_;
     vpc_id = vpc_id_;
     status = status_;
     status_message = status_message_;
   }
    : resolver_rule_association)

let make_associate_resolver_rule_response
    ?resolver_rule_association:(resolver_rule_association_ : resolver_rule_association option) () =
  ({ resolver_rule_association = resolver_rule_association_ } : associate_resolver_rule_response)

let make_associate_resolver_rule_request ?name:(name_ : name option)
    ~resolver_rule_id:(resolver_rule_id_ : resource_id) ~vpc_id:(vpc_id_ : resource_id) () =
  ({ resolver_rule_id = resolver_rule_id_; name = name_; vpc_id = vpc_id_ }
    : associate_resolver_rule_request)

let make_dns_threat_protection_rule_type_config
    ~value:(value_ : dns_threat_protection_rule_type_value)
    ~confidence_threshold:(confidence_threshold_ : confidence_threshold) () =
  ({ value = value_; confidence_threshold = confidence_threshold_ }
    : dns_threat_protection_rule_type_config)

let make_firewall_advanced_threat_category_config
    ~category:(category_ : firewall_advanced_threat_category_value) () =
  ({ category = category_ } : firewall_advanced_threat_category_config)

let make_firewall_advanced_content_category_config
    ~category:(category_ : firewall_advanced_content_category_value) () =
  ({ category = category_ } : firewall_advanced_content_category_config)

let make_partner_threat_protection_config ~partner:(partner_ : partner_value) () =
  ({ partner = partner_ } : partner_threat_protection_config)

let make_firewall_rule_type
    ?partner_threat_protection:
      (partner_threat_protection_ : partner_threat_protection_config option)
    ?firewall_advanced_content_category:
      (firewall_advanced_content_category_ : firewall_advanced_content_category_config option)
    ?firewall_advanced_threat_category:
      (firewall_advanced_threat_category_ : firewall_advanced_threat_category_config option)
    ?dns_threat_protection:(dns_threat_protection_ : dns_threat_protection_rule_type_config option)
    () =
  ({
     partner_threat_protection = partner_threat_protection_;
     firewall_advanced_content_category = firewall_advanced_content_category_;
     firewall_advanced_threat_category = firewall_advanced_threat_category_;
     dns_threat_protection = dns_threat_protection_;
   }
    : firewall_rule_type)

let make_create_firewall_rule_entry
    ?firewall_domain_list_id:(firewall_domain_list_id_ : resource_id option)
    ?block_response:(block_response_ : block_response option)
    ?block_override_domain:(block_override_domain_ : block_override_domain option)
    ?block_override_dns_type:(block_override_dns_type_ : block_override_dns_type option)
    ?block_override_ttl:(block_override_ttl_ : block_override_ttl option)
    ?firewall_domain_redirection_action:
      (firewall_domain_redirection_action_ : firewall_domain_redirection_action option)
    ?qtype:(qtype_ : qtype option)
    ?dns_threat_protection:(dns_threat_protection_ : dns_threat_protection option)
    ?confidence_threshold:(confidence_threshold_ : confidence_threshold option)
    ?firewall_rule_type:(firewall_rule_type_ : firewall_rule_type option)
    ~creator_request_id:(creator_request_id_ : creator_request_id)
    ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id) ~priority:(priority_ : priority)
    ~action:(action_ : action) ~name:(name_ : name) () =
  ({
     creator_request_id = creator_request_id_;
     firewall_rule_group_id = firewall_rule_group_id_;
     firewall_domain_list_id = firewall_domain_list_id_;
     priority = priority_;
     action = action_;
     block_response = block_response_;
     block_override_domain = block_override_domain_;
     block_override_dns_type = block_override_dns_type_;
     block_override_ttl = block_override_ttl_;
     name = name_;
     firewall_domain_redirection_action = firewall_domain_redirection_action_;
     qtype = qtype_;
     dns_threat_protection = dns_threat_protection_;
     confidence_threshold = confidence_threshold_;
     firewall_rule_type = firewall_rule_type_;
   }
    : create_firewall_rule_entry)

let make_batch_create_firewall_rule_error
    ?firewall_rule:(firewall_rule_ : create_firewall_rule_entry option)
    ?code:(code_ : string_ option) ?message:(message_ : string_ option) () =
  ({ firewall_rule = firewall_rule_; code = code_; message = message_ }
    : batch_create_firewall_rule_error)

let make_firewall_rule ?firewall_rule_group_id:(firewall_rule_group_id_ : resource_id option)
    ?firewall_domain_list_id:(firewall_domain_list_id_ : resource_id option)
    ?firewall_threat_protection_id:(firewall_threat_protection_id_ : resource_id option)
    ?name:(name_ : name option) ?priority:(priority_ : priority option)
    ?action:(action_ : action option) ?block_response:(block_response_ : block_response option)
    ?block_override_domain:(block_override_domain_ : block_override_domain option)
    ?block_override_dns_type:(block_override_dns_type_ : block_override_dns_type option)
    ?block_override_ttl:(block_override_ttl_ : unsigned option)
    ?creator_request_id:(creator_request_id_ : creator_request_id option)
    ?creation_time:(creation_time_ : rfc3339_time_string option)
    ?modification_time:(modification_time_ : rfc3339_time_string option)
    ?firewall_domain_redirection_action:
      (firewall_domain_redirection_action_ : firewall_domain_redirection_action option)
    ?qtype:(qtype_ : qtype option)
    ?dns_threat_protection:(dns_threat_protection_ : dns_threat_protection option)
    ?confidence_threshold:(confidence_threshold_ : confidence_threshold option)
    ?firewall_rule_type:(firewall_rule_type_ : firewall_rule_type option)
    ?status:(status_ : firewall_rule_status option)
    ?status_message:(status_message_ : firewall_rule_status_message option) () =
  ({
     firewall_rule_group_id = firewall_rule_group_id_;
     firewall_domain_list_id = firewall_domain_list_id_;
     firewall_threat_protection_id = firewall_threat_protection_id_;
     name = name_;
     priority = priority_;
     action = action_;
     block_response = block_response_;
     block_override_domain = block_override_domain_;
     block_override_dns_type = block_override_dns_type_;
     block_override_ttl = block_override_ttl_;
     creator_request_id = creator_request_id_;
     creation_time = creation_time_;
     modification_time = modification_time_;
     firewall_domain_redirection_action = firewall_domain_redirection_action_;
     qtype = qtype_;
     dns_threat_protection = dns_threat_protection_;
     confidence_threshold = confidence_threshold_;
     firewall_rule_type = firewall_rule_type_;
     status = status_;
     status_message = status_message_;
   }
    : firewall_rule)

let make_batch_create_firewall_rule_response
    ?created_firewall_rules:(created_firewall_rules_ : firewall_rules option)
    ?create_errors:(create_errors_ : batch_create_firewall_rule_errors option) () =
  ({ created_firewall_rules = created_firewall_rules_; create_errors = create_errors_ }
    : batch_create_firewall_rule_response)

let make_batch_create_firewall_rule_request
    ~create_firewall_rule_entries:(create_firewall_rule_entries_ : create_firewall_rule_entries) ()
    =
  ({ create_firewall_rule_entries = create_firewall_rule_entries_ }
    : batch_create_firewall_rule_request)

let make_delete_firewall_rule_entry
    ?firewall_domain_list_id:(firewall_domain_list_id_ : resource_id option)
    ?firewall_threat_protection_id:(firewall_threat_protection_id_ : resource_id option)
    ?qtype:(qtype_ : qtype option) ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id)
    () =
  ({
     firewall_rule_group_id = firewall_rule_group_id_;
     firewall_domain_list_id = firewall_domain_list_id_;
     firewall_threat_protection_id = firewall_threat_protection_id_;
     qtype = qtype_;
   }
    : delete_firewall_rule_entry)

let make_batch_delete_firewall_rule_error
    ?firewall_rule:(firewall_rule_ : delete_firewall_rule_entry option)
    ?code:(code_ : string_ option) ?message:(message_ : string_ option) () =
  ({ firewall_rule = firewall_rule_; code = code_; message = message_ }
    : batch_delete_firewall_rule_error)

let make_batch_delete_firewall_rule_response
    ?deleted_firewall_rules:(deleted_firewall_rules_ : firewall_rules option)
    ?delete_errors:(delete_errors_ : batch_delete_firewall_rule_errors option) () =
  ({ deleted_firewall_rules = deleted_firewall_rules_; delete_errors = delete_errors_ }
    : batch_delete_firewall_rule_response)

let make_batch_delete_firewall_rule_request
    ~delete_firewall_rule_entries:(delete_firewall_rule_entries_ : delete_firewall_rule_entries) ()
    =
  ({ delete_firewall_rule_entries = delete_firewall_rule_entries_ }
    : batch_delete_firewall_rule_request)

let make_update_firewall_rule_entry
    ?firewall_domain_list_id:(firewall_domain_list_id_ : resource_id option)
    ?firewall_threat_protection_id:(firewall_threat_protection_id_ : resource_id option)
    ?priority:(priority_ : priority option) ?action:(action_ : action option)
    ?block_response:(block_response_ : block_response option)
    ?block_override_domain:(block_override_domain_ : block_override_domain option)
    ?block_override_dns_type:(block_override_dns_type_ : block_override_dns_type option)
    ?block_override_ttl:(block_override_ttl_ : block_override_ttl option)
    ?name:(name_ : name option)
    ?firewall_domain_redirection_action:
      (firewall_domain_redirection_action_ : firewall_domain_redirection_action option)
    ?qtype:(qtype_ : qtype option)
    ?dns_threat_protection:(dns_threat_protection_ : dns_threat_protection option)
    ?confidence_threshold:(confidence_threshold_ : confidence_threshold option)
    ?firewall_rule_type:(firewall_rule_type_ : firewall_rule_type option)
    ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id) () =
  ({
     firewall_rule_group_id = firewall_rule_group_id_;
     firewall_domain_list_id = firewall_domain_list_id_;
     firewall_threat_protection_id = firewall_threat_protection_id_;
     priority = priority_;
     action = action_;
     block_response = block_response_;
     block_override_domain = block_override_domain_;
     block_override_dns_type = block_override_dns_type_;
     block_override_ttl = block_override_ttl_;
     name = name_;
     firewall_domain_redirection_action = firewall_domain_redirection_action_;
     qtype = qtype_;
     dns_threat_protection = dns_threat_protection_;
     confidence_threshold = confidence_threshold_;
     firewall_rule_type = firewall_rule_type_;
   }
    : update_firewall_rule_entry)

let make_batch_update_firewall_rule_error
    ?firewall_rule:(firewall_rule_ : update_firewall_rule_entry option)
    ?code:(code_ : string_ option) ?message:(message_ : string_ option) () =
  ({ firewall_rule = firewall_rule_; code = code_; message = message_ }
    : batch_update_firewall_rule_error)

let make_batch_update_firewall_rule_response
    ?updated_firewall_rules:(updated_firewall_rules_ : firewall_rules option)
    ?update_errors:(update_errors_ : batch_update_firewall_rule_errors option) () =
  ({ updated_firewall_rules = updated_firewall_rules_; update_errors = update_errors_ }
    : batch_update_firewall_rule_response)

let make_batch_update_firewall_rule_request
    ~update_firewall_rule_entries:(update_firewall_rule_entries_ : update_firewall_rule_entries) ()
    =
  ({ update_firewall_rule_entries = update_firewall_rule_entries_ }
    : batch_update_firewall_rule_request)

let make_firewall_domain_list ?id:(id_ : resource_id option) ?arn:(arn_ : arn option)
    ?name:(name_ : name option) ?domain_count:(domain_count_ : unsigned option)
    ?status:(status_ : firewall_domain_list_status option)
    ?status_message:(status_message_ : status_message option)
    ?managed_owner_name:(managed_owner_name_ : service_principle option)
    ?creator_request_id:(creator_request_id_ : creator_request_id option)
    ?creation_time:(creation_time_ : rfc3339_time_string option)
    ?modification_time:(modification_time_ : rfc3339_time_string option)
    ?category:(category_ : category option)
    ?managed_list_type:(managed_list_type_ : domain_list_type option) () =
  ({
     id = id_;
     arn = arn_;
     name = name_;
     domain_count = domain_count_;
     status = status_;
     status_message = status_message_;
     managed_owner_name = managed_owner_name_;
     creator_request_id = creator_request_id_;
     creation_time = creation_time_;
     modification_time = modification_time_;
     category = category_;
     managed_list_type = managed_list_type_;
   }
    : firewall_domain_list)

let make_create_firewall_domain_list_response
    ?firewall_domain_list:(firewall_domain_list_ : firewall_domain_list option) () =
  ({ firewall_domain_list = firewall_domain_list_ } : create_firewall_domain_list_response)

let make_create_firewall_domain_list_request ?tags:(tags_ : tag_list option)
    ~creator_request_id:(creator_request_id_ : creator_request_id) ~name:(name_ : name) () =
  ({ creator_request_id = creator_request_id_; name = name_; tags = tags_ }
    : create_firewall_domain_list_request)

let make_create_firewall_rule_response ?firewall_rule:(firewall_rule_ : firewall_rule option) () =
  ({ firewall_rule = firewall_rule_ } : create_firewall_rule_response)

let make_create_firewall_rule_request
    ?firewall_domain_list_id:(firewall_domain_list_id_ : resource_id option)
    ?block_response:(block_response_ : block_response option)
    ?block_override_domain:(block_override_domain_ : block_override_domain option)
    ?block_override_dns_type:(block_override_dns_type_ : block_override_dns_type option)
    ?block_override_ttl:(block_override_ttl_ : block_override_ttl option)
    ?firewall_domain_redirection_action:
      (firewall_domain_redirection_action_ : firewall_domain_redirection_action option)
    ?qtype:(qtype_ : qtype option)
    ?dns_threat_protection:(dns_threat_protection_ : dns_threat_protection option)
    ?confidence_threshold:(confidence_threshold_ : confidence_threshold option)
    ?firewall_rule_type:(firewall_rule_type_ : firewall_rule_type option)
    ~creator_request_id:(creator_request_id_ : creator_request_id)
    ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id) ~priority:(priority_ : priority)
    ~action:(action_ : action) ~name:(name_ : name) () =
  ({
     creator_request_id = creator_request_id_;
     firewall_rule_group_id = firewall_rule_group_id_;
     firewall_domain_list_id = firewall_domain_list_id_;
     priority = priority_;
     action = action_;
     block_response = block_response_;
     block_override_domain = block_override_domain_;
     block_override_dns_type = block_override_dns_type_;
     block_override_ttl = block_override_ttl_;
     name = name_;
     firewall_domain_redirection_action = firewall_domain_redirection_action_;
     qtype = qtype_;
     dns_threat_protection = dns_threat_protection_;
     confidence_threshold = confidence_threshold_;
     firewall_rule_type = firewall_rule_type_;
   }
    : create_firewall_rule_request)

let make_firewall_rule_group ?id:(id_ : resource_id option) ?arn:(arn_ : arn option)
    ?name:(name_ : name option) ?rule_count:(rule_count_ : unsigned option)
    ?status:(status_ : firewall_rule_group_status option)
    ?status_message:(status_message_ : status_message option)
    ?owner_id:(owner_id_ : account_id option)
    ?creator_request_id:(creator_request_id_ : creator_request_id option)
    ?share_status:(share_status_ : share_status option)
    ?creation_time:(creation_time_ : rfc3339_time_string option)
    ?modification_time:(modification_time_ : rfc3339_time_string option) () =
  ({
     id = id_;
     arn = arn_;
     name = name_;
     rule_count = rule_count_;
     status = status_;
     status_message = status_message_;
     owner_id = owner_id_;
     creator_request_id = creator_request_id_;
     share_status = share_status_;
     creation_time = creation_time_;
     modification_time = modification_time_;
   }
    : firewall_rule_group)

let make_create_firewall_rule_group_response
    ?firewall_rule_group:(firewall_rule_group_ : firewall_rule_group option) () =
  ({ firewall_rule_group = firewall_rule_group_ } : create_firewall_rule_group_response)

let make_create_firewall_rule_group_request ?tags:(tags_ : tag_list option)
    ~creator_request_id:(creator_request_id_ : creator_request_id) ~name:(name_ : name) () =
  ({ creator_request_id = creator_request_id_; name = name_; tags = tags_ }
    : create_firewall_rule_group_request)

let make_outpost_resolver ?arn:(arn_ : arn option)
    ?creation_time:(creation_time_ : rfc3339_time_string option)
    ?modification_time:(modification_time_ : rfc3339_time_string option)
    ?creator_request_id:(creator_request_id_ : creator_request_id option)
    ?id:(id_ : resource_id option) ?instance_count:(instance_count_ : instance_count option)
    ?preferred_instance_type:(preferred_instance_type_ : outpost_instance_type option)
    ?name:(name_ : outpost_resolver_name option) ?status:(status_ : outpost_resolver_status option)
    ?status_message:(status_message_ : outpost_resolver_status_message option)
    ?outpost_arn:(outpost_arn_ : outpost_arn option) () =
  ({
     arn = arn_;
     creation_time = creation_time_;
     modification_time = modification_time_;
     creator_request_id = creator_request_id_;
     id = id_;
     instance_count = instance_count_;
     preferred_instance_type = preferred_instance_type_;
     name = name_;
     status = status_;
     status_message = status_message_;
     outpost_arn = outpost_arn_;
   }
    : outpost_resolver)

let make_create_outpost_resolver_response
    ?outpost_resolver:(outpost_resolver_ : outpost_resolver option) () =
  ({ outpost_resolver = outpost_resolver_ } : create_outpost_resolver_response)

let make_create_outpost_resolver_request ?instance_count:(instance_count_ : instance_count option)
    ?tags:(tags_ : tag_list option) ~creator_request_id:(creator_request_id_ : creator_request_id)
    ~name:(name_ : outpost_resolver_name)
    ~preferred_instance_type:(preferred_instance_type_ : outpost_instance_type)
    ~outpost_arn:(outpost_arn_ : outpost_arn) () =
  ({
     creator_request_id = creator_request_id_;
     name = name_;
     instance_count = instance_count_;
     preferred_instance_type = preferred_instance_type_;
     outpost_arn = outpost_arn_;
     tags = tags_;
   }
    : create_outpost_resolver_request)

let make_create_resolver_endpoint_response
    ?resolver_endpoint:(resolver_endpoint_ : resolver_endpoint option) () =
  ({ resolver_endpoint = resolver_endpoint_ } : create_resolver_endpoint_response)

let make_ip_address_request ?ip:(ip_ : ip option) ?ipv6:(ipv6_ : ipv6 option)
    ~subnet_id:(subnet_id_ : subnet_id) () =
  ({ subnet_id = subnet_id_; ip = ip_; ipv6 = ipv6_ } : ip_address_request)

let make_create_resolver_endpoint_request ?name:(name_ : name option)
    ?outpost_arn:(outpost_arn_ : outpost_arn option)
    ?preferred_instance_type:(preferred_instance_type_ : outpost_instance_type option)
    ?tags:(tags_ : tag_list option)
    ?resolver_endpoint_type:(resolver_endpoint_type_ : resolver_endpoint_type option)
    ?protocols:(protocols_ : protocol_list option)
    ?rni_enhanced_metrics_enabled:
      (rni_enhanced_metrics_enabled_ : rni_enhanced_metrics_enabled option)
    ?target_name_server_metrics_enabled:
      (target_name_server_metrics_enabled_ : target_name_server_metrics_enabled option)
    ?dns64_enabled:(dns64_enabled_ : dns64_enabled option)
    ?ipv6_internet_access_enabled:
      (ipv6_internet_access_enabled_ : ipv6_internet_access_enabled option)
    ~creator_request_id:(creator_request_id_ : creator_request_id)
    ~security_group_ids:(security_group_ids_ : security_group_ids)
    ~direction:(direction_ : resolver_endpoint_direction)
    ~ip_addresses:(ip_addresses_ : ip_addresses_request) () =
  ({
     creator_request_id = creator_request_id_;
     name = name_;
     security_group_ids = security_group_ids_;
     direction = direction_;
     ip_addresses = ip_addresses_;
     outpost_arn = outpost_arn_;
     preferred_instance_type = preferred_instance_type_;
     tags = tags_;
     resolver_endpoint_type = resolver_endpoint_type_;
     protocols = protocols_;
     rni_enhanced_metrics_enabled = rni_enhanced_metrics_enabled_;
     target_name_server_metrics_enabled = target_name_server_metrics_enabled_;
     dns64_enabled = dns64_enabled_;
     ipv6_internet_access_enabled = ipv6_internet_access_enabled_;
   }
    : create_resolver_endpoint_request)

let make_resolver_query_log_config ?id:(id_ : resource_id option)
    ?owner_id:(owner_id_ : account_id option)
    ?status:(status_ : resolver_query_log_config_status option)
    ?share_status:(share_status_ : share_status option)
    ?association_count:(association_count_ : count option) ?arn:(arn_ : arn option)
    ?name:(name_ : resolver_query_log_config_name option)
    ?destination_arn:(destination_arn_ : destination_arn option)
    ?creator_request_id:(creator_request_id_ : creator_request_id option)
    ?creation_time:(creation_time_ : rfc3339_time_string option) () =
  ({
     id = id_;
     owner_id = owner_id_;
     status = status_;
     share_status = share_status_;
     association_count = association_count_;
     arn = arn_;
     name = name_;
     destination_arn = destination_arn_;
     creator_request_id = creator_request_id_;
     creation_time = creation_time_;
   }
    : resolver_query_log_config)

let make_create_resolver_query_log_config_response
    ?resolver_query_log_config:(resolver_query_log_config_ : resolver_query_log_config option) () =
  ({ resolver_query_log_config = resolver_query_log_config_ }
    : create_resolver_query_log_config_response)

let make_create_resolver_query_log_config_request ?tags:(tags_ : tag_list option)
    ~name:(name_ : resolver_query_log_config_name)
    ~destination_arn:(destination_arn_ : destination_arn)
    ~creator_request_id:(creator_request_id_ : creator_request_id) () =
  ({
     name = name_;
     destination_arn = destination_arn_;
     creator_request_id = creator_request_id_;
     tags = tags_;
   }
    : create_resolver_query_log_config_request)

let make_target_address ?ip:(ip_ : ip option) ?port:(port_ : port option)
    ?ipv6:(ipv6_ : ipv6 option) ?protocol:(protocol_ : protocol option)
    ?server_name_indication:(server_name_indication_ : server_name_indication option) () =
  ({
     ip = ip_;
     port = port_;
     ipv6 = ipv6_;
     protocol = protocol_;
     server_name_indication = server_name_indication_;
   }
    : target_address)

let make_resolver_rule ?id:(id_ : resource_id option)
    ?creator_request_id:(creator_request_id_ : creator_request_id option) ?arn:(arn_ : arn option)
    ?domain_name:(domain_name_ : domain_name option) ?status:(status_ : resolver_rule_status option)
    ?status_message:(status_message_ : status_message option)
    ?rule_type:(rule_type_ : rule_type_option option) ?name:(name_ : name option)
    ?target_ips:(target_ips_ : target_list option)
    ?resolver_endpoint_id:(resolver_endpoint_id_ : resource_id option)
    ?owner_id:(owner_id_ : account_id option) ?share_status:(share_status_ : share_status option)
    ?creation_time:(creation_time_ : rfc3339_time_string option)
    ?modification_time:(modification_time_ : rfc3339_time_string option)
    ?delegation_record:(delegation_record_ : delegation_record option) () =
  ({
     id = id_;
     creator_request_id = creator_request_id_;
     arn = arn_;
     domain_name = domain_name_;
     status = status_;
     status_message = status_message_;
     rule_type = rule_type_;
     name = name_;
     target_ips = target_ips_;
     resolver_endpoint_id = resolver_endpoint_id_;
     owner_id = owner_id_;
     share_status = share_status_;
     creation_time = creation_time_;
     modification_time = modification_time_;
     delegation_record = delegation_record_;
   }
    : resolver_rule)

let make_create_resolver_rule_response ?resolver_rule:(resolver_rule_ : resolver_rule option) () =
  ({ resolver_rule = resolver_rule_ } : create_resolver_rule_response)

let make_create_resolver_rule_request ?name:(name_ : name option)
    ?domain_name:(domain_name_ : domain_name option) ?target_ips:(target_ips_ : target_list option)
    ?resolver_endpoint_id:(resolver_endpoint_id_ : resource_id option)
    ?tags:(tags_ : tag_list option)
    ?delegation_record:(delegation_record_ : delegation_record option)
    ~creator_request_id:(creator_request_id_ : creator_request_id)
    ~rule_type:(rule_type_ : rule_type_option) () =
  ({
     creator_request_id = creator_request_id_;
     name = name_;
     rule_type = rule_type_;
     domain_name = domain_name_;
     target_ips = target_ips_;
     resolver_endpoint_id = resolver_endpoint_id_;
     tags = tags_;
     delegation_record = delegation_record_;
   }
    : create_resolver_rule_request)

let make_delete_firewall_domain_list_response
    ?firewall_domain_list:(firewall_domain_list_ : firewall_domain_list option) () =
  ({ firewall_domain_list = firewall_domain_list_ } : delete_firewall_domain_list_response)

let make_delete_firewall_domain_list_request
    ~firewall_domain_list_id:(firewall_domain_list_id_ : resource_id) () =
  ({ firewall_domain_list_id = firewall_domain_list_id_ } : delete_firewall_domain_list_request)

let make_delete_firewall_rule_response ?firewall_rule:(firewall_rule_ : firewall_rule option) () =
  ({ firewall_rule = firewall_rule_ } : delete_firewall_rule_response)

let make_delete_firewall_rule_request
    ?firewall_domain_list_id:(firewall_domain_list_id_ : resource_id option)
    ?firewall_threat_protection_id:(firewall_threat_protection_id_ : resource_id option)
    ?qtype:(qtype_ : qtype option) ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id)
    () =
  ({
     firewall_rule_group_id = firewall_rule_group_id_;
     firewall_domain_list_id = firewall_domain_list_id_;
     firewall_threat_protection_id = firewall_threat_protection_id_;
     qtype = qtype_;
   }
    : delete_firewall_rule_request)

let make_delete_firewall_rule_group_response
    ?firewall_rule_group:(firewall_rule_group_ : firewall_rule_group option) () =
  ({ firewall_rule_group = firewall_rule_group_ } : delete_firewall_rule_group_response)

let make_delete_firewall_rule_group_request
    ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id) () =
  ({ firewall_rule_group_id = firewall_rule_group_id_ } : delete_firewall_rule_group_request)

let make_delete_outpost_resolver_response
    ?outpost_resolver:(outpost_resolver_ : outpost_resolver option) () =
  ({ outpost_resolver = outpost_resolver_ } : delete_outpost_resolver_response)

let make_delete_outpost_resolver_request ~id:(id_ : resource_id) () =
  ({ id = id_ } : delete_outpost_resolver_request)

let make_delete_resolver_endpoint_response
    ?resolver_endpoint:(resolver_endpoint_ : resolver_endpoint option) () =
  ({ resolver_endpoint = resolver_endpoint_ } : delete_resolver_endpoint_response)

let make_delete_resolver_endpoint_request
    ~resolver_endpoint_id:(resolver_endpoint_id_ : resource_id) () =
  ({ resolver_endpoint_id = resolver_endpoint_id_ } : delete_resolver_endpoint_request)

let make_delete_resolver_query_log_config_response
    ?resolver_query_log_config:(resolver_query_log_config_ : resolver_query_log_config option) () =
  ({ resolver_query_log_config = resolver_query_log_config_ }
    : delete_resolver_query_log_config_response)

let make_delete_resolver_query_log_config_request
    ~resolver_query_log_config_id:(resolver_query_log_config_id_ : resource_id) () =
  ({ resolver_query_log_config_id = resolver_query_log_config_id_ }
    : delete_resolver_query_log_config_request)

let make_delete_resolver_rule_response ?resolver_rule:(resolver_rule_ : resolver_rule option) () =
  ({ resolver_rule = resolver_rule_ } : delete_resolver_rule_response)

let make_delete_resolver_rule_request ~resolver_rule_id:(resolver_rule_id_ : resource_id) () =
  ({ resolver_rule_id = resolver_rule_id_ } : delete_resolver_rule_request)

let make_disassociate_firewall_rule_group_response
    ?firewall_rule_group_association:
      (firewall_rule_group_association_ : firewall_rule_group_association option) () =
  ({ firewall_rule_group_association = firewall_rule_group_association_ }
    : disassociate_firewall_rule_group_response)

let make_disassociate_firewall_rule_group_request
    ~firewall_rule_group_association_id:(firewall_rule_group_association_id_ : resource_id) () =
  ({ firewall_rule_group_association_id = firewall_rule_group_association_id_ }
    : disassociate_firewall_rule_group_request)

let make_disassociate_resolver_endpoint_ip_address_response
    ?resolver_endpoint:(resolver_endpoint_ : resolver_endpoint option) () =
  ({ resolver_endpoint = resolver_endpoint_ } : disassociate_resolver_endpoint_ip_address_response)

let make_disassociate_resolver_endpoint_ip_address_request
    ~resolver_endpoint_id:(resolver_endpoint_id_ : resource_id)
    ~ip_address:(ip_address_ : ip_address_update) () =
  ({ resolver_endpoint_id = resolver_endpoint_id_; ip_address = ip_address_ }
    : disassociate_resolver_endpoint_ip_address_request)

let make_disassociate_resolver_query_log_config_response
    ?resolver_query_log_config_association:
      (resolver_query_log_config_association_ : resolver_query_log_config_association option) () =
  ({ resolver_query_log_config_association = resolver_query_log_config_association_ }
    : disassociate_resolver_query_log_config_response)

let make_disassociate_resolver_query_log_config_request
    ~resolver_query_log_config_id:(resolver_query_log_config_id_ : resource_id)
    ~resource_id:(resource_id_ : resource_id) () =
  ({ resolver_query_log_config_id = resolver_query_log_config_id_; resource_id = resource_id_ }
    : disassociate_resolver_query_log_config_request)

let make_disassociate_resolver_rule_response
    ?resolver_rule_association:(resolver_rule_association_ : resolver_rule_association option) () =
  ({ resolver_rule_association = resolver_rule_association_ } : disassociate_resolver_rule_response)

let make_disassociate_resolver_rule_request ~vpc_id:(vpc_id_ : resource_id)
    ~resolver_rule_id:(resolver_rule_id_ : resource_id) () =
  ({ vpc_id = vpc_id_; resolver_rule_id = resolver_rule_id_ } : disassociate_resolver_rule_request)

let make_filter ?name:(name_ : filter_name option) ?values:(values_ : filter_values option) () =
  ({ name = name_; values = values_ } : filter)

let make_firewall_config ?id:(id_ : resource_id option)
    ?resource_id:(resource_id_ : resource_id option) ?owner_id:(owner_id_ : account_id option)
    ?firewall_fail_open:(firewall_fail_open_ : firewall_fail_open_status option) () =
  ({
     id = id_;
     resource_id = resource_id_;
     owner_id = owner_id_;
     firewall_fail_open = firewall_fail_open_;
   }
    : firewall_config)

let make_firewall_domain_list_metadata ?id:(id_ : resource_id option) ?arn:(arn_ : arn option)
    ?name:(name_ : name option)
    ?creator_request_id:(creator_request_id_ : creator_request_id option)
    ?managed_owner_name:(managed_owner_name_ : service_principle option)
    ?managed_list_type:(managed_list_type_ : domain_list_type option)
    ?category:(category_ : category option) () =
  ({
     id = id_;
     arn = arn_;
     name = name_;
     creator_request_id = creator_request_id_;
     managed_owner_name = managed_owner_name_;
     managed_list_type = managed_list_type_;
     category = category_;
   }
    : firewall_domain_list_metadata)

let make_firewall_rule_group_metadata ?id:(id_ : resource_id option) ?arn:(arn_ : arn option)
    ?name:(name_ : name option) ?owner_id:(owner_id_ : account_id option)
    ?creator_request_id:(creator_request_id_ : creator_request_id option)
    ?share_status:(share_status_ : share_status option) () =
  ({
     id = id_;
     arn = arn_;
     name = name_;
     owner_id = owner_id_;
     creator_request_id = creator_request_id_;
     share_status = share_status_;
   }
    : firewall_rule_group_metadata)

let make_subscription_info ?vendor_name:(vendor_name_ : vendor_name option)
    ?product_id:(product_id_ : product_id option) () =
  ({ vendor_name = vendor_name_; product_id = product_id_ } : subscription_info)

let make_firewall_rule_type_definition ?rule_type:(rule_type_ : rule_type_name option)
    ?value:(value_ : rule_type_value option) ?display_name:(display_name_ : display_name option)
    ?description:(description_ : rule_type_description option)
    ?subscription_info:(subscription_info_ : subscription_info option) () =
  ({
     rule_type = rule_type_;
     value = value_;
     display_name = display_name_;
     description = description_;
     subscription_info = subscription_info_;
   }
    : firewall_rule_type_definition)

let make_get_firewall_config_response ?firewall_config:(firewall_config_ : firewall_config option)
    () =
  ({ firewall_config = firewall_config_ } : get_firewall_config_response)

let make_get_firewall_config_request ~resource_id:(resource_id_ : resource_id) () =
  ({ resource_id = resource_id_ } : get_firewall_config_request)

let make_get_firewall_domain_list_response
    ?firewall_domain_list:(firewall_domain_list_ : firewall_domain_list option) () =
  ({ firewall_domain_list = firewall_domain_list_ } : get_firewall_domain_list_response)

let make_get_firewall_domain_list_request
    ~firewall_domain_list_id:(firewall_domain_list_id_ : resource_id) () =
  ({ firewall_domain_list_id = firewall_domain_list_id_ } : get_firewall_domain_list_request)

let make_get_firewall_rule_group_response
    ?firewall_rule_group:(firewall_rule_group_ : firewall_rule_group option) () =
  ({ firewall_rule_group = firewall_rule_group_ } : get_firewall_rule_group_response)

let make_get_firewall_rule_group_request
    ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id) () =
  ({ firewall_rule_group_id = firewall_rule_group_id_ } : get_firewall_rule_group_request)

let make_get_firewall_rule_group_association_response
    ?firewall_rule_group_association:
      (firewall_rule_group_association_ : firewall_rule_group_association option) () =
  ({ firewall_rule_group_association = firewall_rule_group_association_ }
    : get_firewall_rule_group_association_response)

let make_get_firewall_rule_group_association_request
    ~firewall_rule_group_association_id:(firewall_rule_group_association_id_ : resource_id) () =
  ({ firewall_rule_group_association_id = firewall_rule_group_association_id_ }
    : get_firewall_rule_group_association_request)

let make_get_firewall_rule_group_policy_response
    ?firewall_rule_group_policy:(firewall_rule_group_policy_ : firewall_rule_group_policy option) ()
    =
  ({ firewall_rule_group_policy = firewall_rule_group_policy_ }
    : get_firewall_rule_group_policy_response)

let make_get_firewall_rule_group_policy_request ~arn:(arn_ : arn) () =
  ({ arn = arn_ } : get_firewall_rule_group_policy_request)

let make_get_outpost_resolver_response
    ?outpost_resolver:(outpost_resolver_ : outpost_resolver option) () =
  ({ outpost_resolver = outpost_resolver_ } : get_outpost_resolver_response)

let make_get_outpost_resolver_request ~id:(id_ : resource_id) () =
  ({ id = id_ } : get_outpost_resolver_request)

let make_resolver_config ?id:(id_ : resource_id option)
    ?resource_id:(resource_id_ : resource_id option) ?owner_id:(owner_id_ : account_id option)
    ?autodefined_reverse:(autodefined_reverse_ : resolver_autodefined_reverse_status option) () =
  ({
     id = id_;
     resource_id = resource_id_;
     owner_id = owner_id_;
     autodefined_reverse = autodefined_reverse_;
   }
    : resolver_config)

let make_get_resolver_config_response ?resolver_config:(resolver_config_ : resolver_config option)
    () =
  ({ resolver_config = resolver_config_ } : get_resolver_config_response)

let make_get_resolver_config_request ~resource_id:(resource_id_ : resource_id) () =
  ({ resource_id = resource_id_ } : get_resolver_config_request)

let make_resolver_dnssec_config ?id:(id_ : resource_id option)
    ?owner_id:(owner_id_ : account_id option) ?resource_id:(resource_id_ : resource_id option)
    ?validation_status:(validation_status_ : resolver_dnssec_validation_status option) () =
  ({
     id = id_;
     owner_id = owner_id_;
     resource_id = resource_id_;
     validation_status = validation_status_;
   }
    : resolver_dnssec_config)

let make_get_resolver_dnssec_config_response
    ?resolver_dnssec_config:(resolver_dnssec_config_ : resolver_dnssec_config option) () =
  ({ resolver_dnssec_config = resolver_dnssec_config_ } : get_resolver_dnssec_config_response)

let make_get_resolver_dnssec_config_request ~resource_id:(resource_id_ : resource_id) () =
  ({ resource_id = resource_id_ } : get_resolver_dnssec_config_request)

let make_get_resolver_endpoint_response
    ?resolver_endpoint:(resolver_endpoint_ : resolver_endpoint option) () =
  ({ resolver_endpoint = resolver_endpoint_ } : get_resolver_endpoint_response)

let make_get_resolver_endpoint_request ~resolver_endpoint_id:(resolver_endpoint_id_ : resource_id)
    () =
  ({ resolver_endpoint_id = resolver_endpoint_id_ } : get_resolver_endpoint_request)

let make_get_resolver_query_log_config_response
    ?resolver_query_log_config:(resolver_query_log_config_ : resolver_query_log_config option) () =
  ({ resolver_query_log_config = resolver_query_log_config_ }
    : get_resolver_query_log_config_response)

let make_get_resolver_query_log_config_request
    ~resolver_query_log_config_id:(resolver_query_log_config_id_ : resource_id) () =
  ({ resolver_query_log_config_id = resolver_query_log_config_id_ }
    : get_resolver_query_log_config_request)

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

let make_get_resolver_query_log_config_policy_response
    ?resolver_query_log_config_policy:
      (resolver_query_log_config_policy_ : resolver_query_log_config_policy option) () =
  ({ resolver_query_log_config_policy = resolver_query_log_config_policy_ }
    : get_resolver_query_log_config_policy_response)

let make_get_resolver_query_log_config_policy_request ~arn:(arn_ : arn) () =
  ({ arn = arn_ } : get_resolver_query_log_config_policy_request)

let make_get_resolver_rule_response ?resolver_rule:(resolver_rule_ : resolver_rule option) () =
  ({ resolver_rule = resolver_rule_ } : get_resolver_rule_response)

let make_get_resolver_rule_request ~resolver_rule_id:(resolver_rule_id_ : resource_id) () =
  ({ resolver_rule_id = resolver_rule_id_ } : get_resolver_rule_request)

let make_get_resolver_rule_association_response
    ?resolver_rule_association:(resolver_rule_association_ : resolver_rule_association option) () =
  ({ resolver_rule_association = resolver_rule_association_ }
    : get_resolver_rule_association_response)

let make_get_resolver_rule_association_request
    ~resolver_rule_association_id:(resolver_rule_association_id_ : resource_id) () =
  ({ resolver_rule_association_id = resolver_rule_association_id_ }
    : get_resolver_rule_association_request)

let make_get_resolver_rule_policy_response
    ?resolver_rule_policy:(resolver_rule_policy_ : resolver_rule_policy option) () =
  ({ resolver_rule_policy = resolver_rule_policy_ } : get_resolver_rule_policy_response)

let make_get_resolver_rule_policy_request ~arn:(arn_ : arn) () =
  ({ arn = arn_ } : get_resolver_rule_policy_request)

let make_import_firewall_domains_response ?id:(id_ : resource_id option) ?name:(name_ : name option)
    ?status:(status_ : firewall_domain_list_status option)
    ?status_message:(status_message_ : status_message option) () =
  ({ id = id_; name = name_; status = status_; status_message = status_message_ }
    : import_firewall_domains_response)

let make_import_firewall_domains_request
    ~firewall_domain_list_id:(firewall_domain_list_id_ : resource_id)
    ~operation:(operation_ : firewall_domain_import_operation)
    ~domain_file_url:(domain_file_url_ : domain_list_file_url) () =
  ({
     firewall_domain_list_id = firewall_domain_list_id_;
     operation = operation_;
     domain_file_url = domain_file_url_;
   }
    : import_firewall_domains_request)

let make_ip_address_response ?ip_id:(ip_id_ : resource_id option)
    ?subnet_id:(subnet_id_ : subnet_id option) ?ip:(ip_ : ip option) ?ipv6:(ipv6_ : ipv6 option)
    ?status:(status_ : ip_address_status option)
    ?status_message:(status_message_ : status_message option)
    ?creation_time:(creation_time_ : rfc3339_time_string option)
    ?modification_time:(modification_time_ : rfc3339_time_string option) () =
  ({
     ip_id = ip_id_;
     subnet_id = subnet_id_;
     ip = ip_;
     ipv6 = ipv6_;
     status = status_;
     status_message = status_message_;
     creation_time = creation_time_;
     modification_time = modification_time_;
   }
    : ip_address_response)

let make_list_firewall_configs_response ?next_token:(next_token_ : next_token option)
    ?firewall_configs:(firewall_configs_ : firewall_config_list option) () =
  ({ next_token = next_token_; firewall_configs = firewall_configs_ }
    : list_firewall_configs_response)

let make_list_firewall_configs_request
    ?max_results:(max_results_ : list_firewall_configs_max_result option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_firewall_configs_request)

let make_list_firewall_domain_lists_response ?next_token:(next_token_ : next_token option)
    ?firewall_domain_lists:(firewall_domain_lists_ : firewall_domain_list_metadata_list option) () =
  ({ next_token = next_token_; firewall_domain_lists = firewall_domain_lists_ }
    : list_firewall_domain_lists_response)

let make_list_firewall_domain_lists_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_firewall_domain_lists_request)

let make_list_firewall_domains_response ?next_token:(next_token_ : next_token option)
    ?domains:(domains_ : firewall_domains option) () =
  ({ next_token = next_token_; domains = domains_ } : list_firewall_domains_response)

let make_list_firewall_domains_request ?max_results:(max_results_ : list_domain_max_results option)
    ?next_token:(next_token_ : next_token option)
    ~firewall_domain_list_id:(firewall_domain_list_id_ : resource_id) () =
  ({
     firewall_domain_list_id = firewall_domain_list_id_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_firewall_domains_request)

let make_list_firewall_rule_group_associations_response
    ?next_token:(next_token_ : next_token option)
    ?firewall_rule_group_associations:
      (firewall_rule_group_associations_ : firewall_rule_group_associations option) () =
  ({
     next_token = next_token_;
     firewall_rule_group_associations = firewall_rule_group_associations_;
   }
    : list_firewall_rule_group_associations_response)

let make_list_firewall_rule_group_associations_request
    ?firewall_rule_group_id:(firewall_rule_group_id_ : resource_id option)
    ?vpc_id:(vpc_id_ : resource_id option) ?priority:(priority_ : priority option)
    ?status:(status_ : firewall_rule_group_association_status option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     firewall_rule_group_id = firewall_rule_group_id_;
     vpc_id = vpc_id_;
     priority = priority_;
     status = status_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_firewall_rule_group_associations_request)

let make_list_firewall_rule_groups_response ?next_token:(next_token_ : next_token option)
    ?firewall_rule_groups:(firewall_rule_groups_ : firewall_rule_group_metadata_list option) () =
  ({ next_token = next_token_; firewall_rule_groups = firewall_rule_groups_ }
    : list_firewall_rule_groups_response)

let make_list_firewall_rule_groups_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_firewall_rule_groups_request)

let make_list_firewall_rule_types_response
    ?firewall_rule_types:(firewall_rule_types_ : firewall_rule_type_definitions option)
    ?next_token:(next_token_ : next_token option) () =
  ({ firewall_rule_types = firewall_rule_types_; next_token = next_token_ }
    : list_firewall_rule_types_response)

let make_list_firewall_rule_types_request ?rule_type:(rule_type_ : rule_type_name option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ rule_type = rule_type_; max_results = max_results_; next_token = next_token_ }
    : list_firewall_rule_types_request)

let make_list_firewall_rules_response ?next_token:(next_token_ : next_token option)
    ?firewall_rules:(firewall_rules_ : firewall_rules option) () =
  ({ next_token = next_token_; firewall_rules = firewall_rules_ } : list_firewall_rules_response)

let make_list_firewall_rules_request ?priority:(priority_ : priority option)
    ?action:(action_ : action option) ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id) () =
  ({
     firewall_rule_group_id = firewall_rule_group_id_;
     priority = priority_;
     action = action_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_firewall_rules_request)

let make_list_outpost_resolvers_response
    ?outpost_resolvers:(outpost_resolvers_ : outpost_resolver_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ outpost_resolvers = outpost_resolvers_; next_token = next_token_ }
    : list_outpost_resolvers_response)

let make_list_outpost_resolvers_request ?outpost_arn:(outpost_arn_ : outpost_arn option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ outpost_arn = outpost_arn_; max_results = max_results_; next_token = next_token_ }
    : list_outpost_resolvers_request)

let make_list_resolver_configs_response ?next_token:(next_token_ : next_token option)
    ?resolver_configs:(resolver_configs_ : resolver_config_list option) () =
  ({ next_token = next_token_; resolver_configs = resolver_configs_ }
    : list_resolver_configs_response)

let make_list_resolver_configs_request
    ?max_results:(max_results_ : list_resolver_configs_max_result option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_resolver_configs_request)

let make_list_resolver_dnssec_configs_response ?next_token:(next_token_ : next_token option)
    ?resolver_dnssec_configs:(resolver_dnssec_configs_ : resolver_dnssec_config_list option) () =
  ({ next_token = next_token_; resolver_dnssec_configs = resolver_dnssec_configs_ }
    : list_resolver_dnssec_configs_response)

let make_list_resolver_dnssec_configs_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?filters:(filters_ : filters option) () =
  ({ max_results = max_results_; next_token = next_token_; filters = filters_ }
    : list_resolver_dnssec_configs_request)

let make_list_resolver_endpoint_ip_addresses_response ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?ip_addresses:(ip_addresses_ : ip_addresses_response option) () =
  ({ next_token = next_token_; max_results = max_results_; ip_addresses = ip_addresses_ }
    : list_resolver_endpoint_ip_addresses_response)

let make_list_resolver_endpoint_ip_addresses_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~resolver_endpoint_id:(resolver_endpoint_id_ : resource_id) () =
  ({
     resolver_endpoint_id = resolver_endpoint_id_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_resolver_endpoint_ip_addresses_request)

let make_list_resolver_endpoints_response ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?resolver_endpoints:(resolver_endpoints_ : resolver_endpoints option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     resolver_endpoints = resolver_endpoints_;
   }
    : list_resolver_endpoints_response)

let make_list_resolver_endpoints_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?filters:(filters_ : filters option) () =
  ({ max_results = max_results_; next_token = next_token_; filters = filters_ }
    : list_resolver_endpoints_request)

let make_list_resolver_query_log_config_associations_response
    ?next_token:(next_token_ : next_token option) ?total_count:(total_count_ : count option)
    ?total_filtered_count:(total_filtered_count_ : count option)
    ?resolver_query_log_config_associations:
      (resolver_query_log_config_associations_ : resolver_query_log_config_association_list option)
    () =
  ({
     next_token = next_token_;
     total_count = total_count_;
     total_filtered_count = total_filtered_count_;
     resolver_query_log_config_associations = resolver_query_log_config_associations_;
   }
    : list_resolver_query_log_config_associations_response)

let make_list_resolver_query_log_config_associations_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : filters option) ?sort_by:(sort_by_ : sort_by_key option)
    ?sort_order:(sort_order_ : sort_order option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_resolver_query_log_config_associations_request)

let make_list_resolver_query_log_configs_response ?next_token:(next_token_ : next_token option)
    ?total_count:(total_count_ : count option)
    ?total_filtered_count:(total_filtered_count_ : count option)
    ?resolver_query_log_configs:
      (resolver_query_log_configs_ : resolver_query_log_config_list option) () =
  ({
     next_token = next_token_;
     total_count = total_count_;
     total_filtered_count = total_filtered_count_;
     resolver_query_log_configs = resolver_query_log_configs_;
   }
    : list_resolver_query_log_configs_response)

let make_list_resolver_query_log_configs_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?filters:(filters_ : filters option)
    ?sort_by:(sort_by_ : sort_by_key option) ?sort_order:(sort_order_ : sort_order option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_resolver_query_log_configs_request)

let make_list_resolver_rule_associations_response ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?resolver_rule_associations:(resolver_rule_associations_ : resolver_rule_associations option) ()
    =
  ({
     next_token = next_token_;
     max_results = max_results_;
     resolver_rule_associations = resolver_rule_associations_;
   }
    : list_resolver_rule_associations_response)

let make_list_resolver_rule_associations_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?filters:(filters_ : filters option) () =
  ({ max_results = max_results_; next_token = next_token_; filters = filters_ }
    : list_resolver_rule_associations_request)

let make_list_resolver_rules_response ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?resolver_rules:(resolver_rules_ : resolver_rules option) () =
  ({ next_token = next_token_; max_results = max_results_; resolver_rules = resolver_rules_ }
    : list_resolver_rules_response)

let make_list_resolver_rules_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?filters:(filters_ : filters option) () =
  ({ max_results = max_results_; next_token = next_token_; filters = filters_ }
    : list_resolver_rules_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_; max_results = max_results_; next_token = next_token_ }
    : list_tags_for_resource_request)

let make_put_firewall_rule_group_policy_response ?return_value:(return_value_ : boolean_ option) ()
    =
  ({ return_value = return_value_ } : put_firewall_rule_group_policy_response)

let make_put_firewall_rule_group_policy_request ~arn:(arn_ : arn)
    ~firewall_rule_group_policy:(firewall_rule_group_policy_ : firewall_rule_group_policy) () =
  ({ arn = arn_; firewall_rule_group_policy = firewall_rule_group_policy_ }
    : put_firewall_rule_group_policy_request)

let make_put_resolver_query_log_config_policy_response
    ?return_value:(return_value_ : boolean_ option) () =
  ({ return_value = return_value_ } : put_resolver_query_log_config_policy_response)

let make_put_resolver_query_log_config_policy_request ~arn:(arn_ : arn)
    ~resolver_query_log_config_policy:
      (resolver_query_log_config_policy_ : resolver_query_log_config_policy) () =
  ({ arn = arn_; resolver_query_log_config_policy = resolver_query_log_config_policy_ }
    : put_resolver_query_log_config_policy_request)

let make_put_resolver_rule_policy_response ?return_value:(return_value_ : boolean_ option) () =
  ({ return_value = return_value_ } : put_resolver_rule_policy_response)

let make_put_resolver_rule_policy_request ~arn:(arn_ : arn)
    ~resolver_rule_policy:(resolver_rule_policy_ : resolver_rule_policy) () =
  ({ arn = arn_; resolver_rule_policy = resolver_rule_policy_ } : put_resolver_rule_policy_request)

let make_resolver_rule_config ?name:(name_ : name option)
    ?target_ips:(target_ips_ : target_list option)
    ?resolver_endpoint_id:(resolver_endpoint_id_ : resource_id option) () =
  ({ name = name_; target_ips = target_ips_; resolver_endpoint_id = resolver_endpoint_id_ }
    : resolver_rule_config)

let make_update_resolver_rule_response ?resolver_rule:(resolver_rule_ : resolver_rule option) () =
  ({ resolver_rule = resolver_rule_ } : update_resolver_rule_response)

let make_update_resolver_rule_request ~resolver_rule_id:(resolver_rule_id_ : resource_id)
    ~config:(config_ : resolver_rule_config) () =
  ({ resolver_rule_id = resolver_rule_id_; config = config_ } : update_resolver_rule_request)

let make_update_resolver_endpoint_response
    ?resolver_endpoint:(resolver_endpoint_ : resolver_endpoint option) () =
  ({ resolver_endpoint = resolver_endpoint_ } : update_resolver_endpoint_response)

let make_update_ip_address ~ip_id:(ip_id_ : resource_id) ~ipv6:(ipv6_ : ipv6) () =
  ({ ip_id = ip_id_; ipv6 = ipv6_ } : update_ip_address)

let make_update_resolver_endpoint_request ?name:(name_ : name option)
    ?resolver_endpoint_type:(resolver_endpoint_type_ : resolver_endpoint_type option)
    ?update_ip_addresses:(update_ip_addresses_ : update_ip_addresses option)
    ?protocols:(protocols_ : protocol_list option)
    ?rni_enhanced_metrics_enabled:
      (rni_enhanced_metrics_enabled_ : rni_enhanced_metrics_enabled option)
    ?target_name_server_metrics_enabled:
      (target_name_server_metrics_enabled_ : target_name_server_metrics_enabled option)
    ?dns64_enabled:(dns64_enabled_ : dns64_enabled option)
    ?ipv6_internet_access_enabled:
      (ipv6_internet_access_enabled_ : ipv6_internet_access_enabled option)
    ~resolver_endpoint_id:(resolver_endpoint_id_ : resource_id) () =
  ({
     resolver_endpoint_id = resolver_endpoint_id_;
     name = name_;
     resolver_endpoint_type = resolver_endpoint_type_;
     update_ip_addresses = update_ip_addresses_;
     protocols = protocols_;
     rni_enhanced_metrics_enabled = rni_enhanced_metrics_enabled_;
     target_name_server_metrics_enabled = target_name_server_metrics_enabled_;
     dns64_enabled = dns64_enabled_;
     ipv6_internet_access_enabled = ipv6_internet_access_enabled_;
   }
    : update_resolver_endpoint_request)

let make_update_resolver_dnssec_config_response
    ?resolver_dnssec_config:(resolver_dnssec_config_ : resolver_dnssec_config option) () =
  ({ resolver_dnssec_config = resolver_dnssec_config_ } : update_resolver_dnssec_config_response)

let make_update_resolver_dnssec_config_request ~resource_id:(resource_id_ : resource_id)
    ~validation:(validation_ : validation) () =
  ({ resource_id = resource_id_; validation = validation_ } : update_resolver_dnssec_config_request)

let make_update_resolver_config_response
    ?resolver_config:(resolver_config_ : resolver_config option) () =
  ({ resolver_config = resolver_config_ } : update_resolver_config_response)

let make_update_resolver_config_request ~resource_id:(resource_id_ : resource_id)
    ~autodefined_reverse_flag:(autodefined_reverse_flag_ : autodefined_reverse_flag) () =
  ({ resource_id = resource_id_; autodefined_reverse_flag = autodefined_reverse_flag_ }
    : update_resolver_config_request)

let make_update_outpost_resolver_response
    ?outpost_resolver:(outpost_resolver_ : outpost_resolver option) () =
  ({ outpost_resolver = outpost_resolver_ } : update_outpost_resolver_response)

let make_update_outpost_resolver_request ?name:(name_ : outpost_resolver_name option)
    ?instance_count:(instance_count_ : instance_count option)
    ?preferred_instance_type:(preferred_instance_type_ : outpost_instance_type option)
    ~id:(id_ : resource_id) () =
  ({
     id = id_;
     name = name_;
     instance_count = instance_count_;
     preferred_instance_type = preferred_instance_type_;
   }
    : update_outpost_resolver_request)

let make_update_firewall_rule_group_association_response
    ?firewall_rule_group_association:
      (firewall_rule_group_association_ : firewall_rule_group_association option) () =
  ({ firewall_rule_group_association = firewall_rule_group_association_ }
    : update_firewall_rule_group_association_response)

let make_update_firewall_rule_group_association_request ?priority:(priority_ : priority option)
    ?mutation_protection:(mutation_protection_ : mutation_protection_status option)
    ?name:(name_ : name option)
    ~firewall_rule_group_association_id:(firewall_rule_group_association_id_ : resource_id) () =
  ({
     firewall_rule_group_association_id = firewall_rule_group_association_id_;
     priority = priority_;
     mutation_protection = mutation_protection_;
     name = name_;
   }
    : update_firewall_rule_group_association_request)

let make_update_firewall_rule_response ?firewall_rule:(firewall_rule_ : firewall_rule option) () =
  ({ firewall_rule = firewall_rule_ } : update_firewall_rule_response)

let make_update_firewall_rule_request
    ?firewall_domain_list_id:(firewall_domain_list_id_ : resource_id option)
    ?firewall_threat_protection_id:(firewall_threat_protection_id_ : resource_id option)
    ?priority:(priority_ : priority option) ?action:(action_ : action option)
    ?block_response:(block_response_ : block_response option)
    ?block_override_domain:(block_override_domain_ : block_override_domain option)
    ?block_override_dns_type:(block_override_dns_type_ : block_override_dns_type option)
    ?block_override_ttl:(block_override_ttl_ : block_override_ttl option)
    ?name:(name_ : name option)
    ?firewall_domain_redirection_action:
      (firewall_domain_redirection_action_ : firewall_domain_redirection_action option)
    ?qtype:(qtype_ : qtype option)
    ?dns_threat_protection:(dns_threat_protection_ : dns_threat_protection option)
    ?confidence_threshold:(confidence_threshold_ : confidence_threshold option)
    ?firewall_rule_type:(firewall_rule_type_ : firewall_rule_type option)
    ~firewall_rule_group_id:(firewall_rule_group_id_ : resource_id) () =
  ({
     firewall_rule_group_id = firewall_rule_group_id_;
     firewall_domain_list_id = firewall_domain_list_id_;
     firewall_threat_protection_id = firewall_threat_protection_id_;
     priority = priority_;
     action = action_;
     block_response = block_response_;
     block_override_domain = block_override_domain_;
     block_override_dns_type = block_override_dns_type_;
     block_override_ttl = block_override_ttl_;
     name = name_;
     firewall_domain_redirection_action = firewall_domain_redirection_action_;
     qtype = qtype_;
     dns_threat_protection = dns_threat_protection_;
     confidence_threshold = confidence_threshold_;
     firewall_rule_type = firewall_rule_type_;
   }
    : update_firewall_rule_request)

let make_update_firewall_domains_response ?id:(id_ : resource_id option) ?name:(name_ : name option)
    ?status:(status_ : firewall_domain_list_status option)
    ?status_message:(status_message_ : status_message option) () =
  ({ id = id_; name = name_; status = status_; status_message = status_message_ }
    : update_firewall_domains_response)

let make_update_firewall_domains_request
    ~firewall_domain_list_id:(firewall_domain_list_id_ : resource_id)
    ~operation:(operation_ : firewall_domain_update_operation)
    ~domains:(domains_ : firewall_domains) () =
  ({
     firewall_domain_list_id = firewall_domain_list_id_;
     operation = operation_;
     domains = domains_;
   }
    : update_firewall_domains_request)

let make_update_firewall_config_response
    ?firewall_config:(firewall_config_ : firewall_config option) () =
  ({ firewall_config = firewall_config_ } : update_firewall_config_response)

let make_update_firewall_config_request ~resource_id:(resource_id_ : resource_id)
    ~firewall_fail_open:(firewall_fail_open_ : firewall_fail_open_status) () =
  ({ resource_id = resource_id_; firewall_fail_open = firewall_fail_open_ }
    : update_firewall_config_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : arn) ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)
