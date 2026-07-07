open Types

let make_capacity_reservation_status ?reason:(reason_ : state_reason option)
    ?code:(code_ : capacity_reservation_state_enum option) () =
  ({ reason = reason_; code = code_ } : capacity_reservation_status)

let make_zonal_capacity_reservation_state
    ?effective_capacity_units:(effective_capacity_units_ : capacity_units_double option)
    ?availability_zone:(availability_zone_ : zone_name option)
    ?state:(state_ : capacity_reservation_status option) () =
  ({
     effective_capacity_units = effective_capacity_units_;
     availability_zone = availability_zone_;
     state = state_;
   }
    : zonal_capacity_reservation_state)

let make_rewrite_config ~replace:(replace_ : string_value) ~regex:(regex_ : string_value) () =
  ({ replace = replace_; regex = regex_ } : rewrite_config)

let make_url_rewrite_config ?rewrites:(rewrites_ : rewrite_config_list option) () =
  ({ rewrites = rewrites_ } : url_rewrite_config)

let make_trust_store ?total_revoked_entries:(total_revoked_entries_ : total_revoked_entries option)
    ?number_of_ca_certificates:(number_of_ca_certificates_ : number_of_ca_certificates option)
    ?status:(status_ : trust_store_status option)
    ?trust_store_arn:(trust_store_arn_ : trust_store_arn option)
    ?name:(name_ : trust_store_name option) () =
  ({
     total_revoked_entries = total_revoked_entries_;
     number_of_ca_certificates = number_of_ca_certificates_;
     status = status_;
     trust_store_arn = trust_store_arn_;
     name = name_;
   }
    : trust_store)

let make_trust_store_revocation
    ?number_of_revoked_entries:(number_of_revoked_entries_ : number_of_revoked_entries option)
    ?revocation_type:(revocation_type_ : revocation_type option)
    ?revocation_id:(revocation_id_ : revocation_id option)
    ?trust_store_arn:(trust_store_arn_ : trust_store_arn option) () =
  ({
     number_of_revoked_entries = number_of_revoked_entries_;
     revocation_type = revocation_type_;
     revocation_id = revocation_id_;
     trust_store_arn = trust_store_arn_;
   }
    : trust_store_revocation)

let make_trust_store_association
    ?resource_arn:(resource_arn_ : trust_store_association_resource_arn option) () =
  ({ resource_arn = resource_arn_ } : trust_store_association)

let make_target_description ?quic_server_id:(quic_server_id_ : quic_server_id option)
    ?availability_zone:(availability_zone_ : zone_name option) ?port:(port_ : port option)
    ~id:(id_ : target_id) () =
  ({
     quic_server_id = quic_server_id_;
     availability_zone = availability_zone_;
     port = port_;
     id = id_;
   }
    : target_description)

let make_target_health ?description:(description_ : description option)
    ?reason:(reason_ : target_health_reason_enum option)
    ?state:(state_ : target_health_state_enum option) () =
  ({ description = description_; reason = reason_; state = state_ } : target_health)

let make_anomaly_detection
    ?mitigation_in_effect:(mitigation_in_effect_ : mitigation_in_effect_enum option)
    ?result_:(result__ : anomaly_result_enum option) () =
  ({ mitigation_in_effect = mitigation_in_effect_; result_ = result__ } : anomaly_detection)

let make_administrative_override ?description:(description_ : description option)
    ?reason:(reason_ : target_administrative_override_reason_enum option)
    ?state:(state_ : target_administrative_override_state_enum option) () =
  ({ description = description_; reason = reason_; state = state_ } : administrative_override)

let make_target_health_description
    ?administrative_override:(administrative_override_ : administrative_override option)
    ?anomaly_detection:(anomaly_detection_ : anomaly_detection option)
    ?target_health:(target_health_ : target_health option)
    ?health_check_port:(health_check_port_ : health_check_port option)
    ?target:(target_ : target_description option) () =
  ({
     administrative_override = administrative_override_;
     anomaly_detection = anomaly_detection_;
     target_health = target_health_;
     health_check_port = health_check_port_;
     target = target_;
   }
    : target_health_description)

let make_matcher ?grpc_code:(grpc_code_ : grpc_code option)
    ?http_code:(http_code_ : http_code option) () =
  ({ grpc_code = grpc_code_; http_code = http_code_ } : matcher)

let make_target_group ?target_control_port:(target_control_port_ : target_control_port option)
    ?ip_address_type:(ip_address_type_ : target_group_ip_address_type_enum option)
    ?protocol_version:(protocol_version_ : protocol_version option)
    ?target_type:(target_type_ : target_type_enum option)
    ?load_balancer_arns:(load_balancer_arns_ : load_balancer_arns option)
    ?matcher:(matcher_ : matcher option) ?health_check_path:(health_check_path_ : path option)
    ?unhealthy_threshold_count:(unhealthy_threshold_count_ : health_check_threshold_count option)
    ?healthy_threshold_count:(healthy_threshold_count_ : health_check_threshold_count option)
    ?health_check_timeout_seconds:
      (health_check_timeout_seconds_ : health_check_timeout_seconds option)
    ?health_check_interval_seconds:
      (health_check_interval_seconds_ : health_check_interval_seconds option)
    ?health_check_enabled:(health_check_enabled_ : health_check_enabled option)
    ?health_check_port:(health_check_port_ : health_check_port option)
    ?health_check_protocol:(health_check_protocol_ : protocol_enum option)
    ?vpc_id:(vpc_id_ : vpc_id option) ?port:(port_ : port option)
    ?protocol:(protocol_ : protocol_enum option)
    ?target_group_name:(target_group_name_ : target_group_name option)
    ?target_group_arn:(target_group_arn_ : target_group_arn option) () =
  ({
     target_control_port = target_control_port_;
     ip_address_type = ip_address_type_;
     protocol_version = protocol_version_;
     target_type = target_type_;
     load_balancer_arns = load_balancer_arns_;
     matcher = matcher_;
     health_check_path = health_check_path_;
     unhealthy_threshold_count = unhealthy_threshold_count_;
     healthy_threshold_count = healthy_threshold_count_;
     health_check_timeout_seconds = health_check_timeout_seconds_;
     health_check_interval_seconds = health_check_interval_seconds_;
     health_check_enabled = health_check_enabled_;
     health_check_port = health_check_port_;
     health_check_protocol = health_check_protocol_;
     vpc_id = vpc_id_;
     port = port_;
     protocol = protocol_;
     target_group_name = target_group_name_;
     target_group_arn = target_group_arn_;
   }
    : target_group)

let make_target_group_tuple ?weight:(weight_ : target_group_weight option)
    ?target_group_arn:(target_group_arn_ : target_group_arn option) () =
  ({ weight = weight_; target_group_arn = target_group_arn_ } : target_group_tuple)

let make_target_group_stickiness_config
    ?duration_seconds:(duration_seconds_ : target_group_stickiness_duration_seconds option)
    ?enabled:(enabled_ : target_group_stickiness_enabled option) () =
  ({ duration_seconds = duration_seconds_; enabled = enabled_ } : target_group_stickiness_config)

let make_target_group_attribute ?value:(value_ : target_group_attribute_value option)
    ?key:(key_ : target_group_attribute_key option) () =
  ({ value = value_; key = key_ } : target_group_attribute)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_description ?tags:(tags_ : tag_list option)
    ?resource_arn:(resource_arn_ : resource_arn option) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_description)

let make_subnet_mapping
    ?source_nat_ipv6_prefix:(source_nat_ipv6_prefix_ : source_nat_ipv6_prefix option)
    ?i_pv6_address:(i_pv6_address_ : i_pv6_address option)
    ?private_i_pv4_address:(private_i_pv4_address_ : private_i_pv4_address option)
    ?allocation_id:(allocation_id_ : allocation_id option)
    ?subnet_id:(subnet_id_ : subnet_id option) () =
  ({
     source_nat_ipv6_prefix = source_nat_ipv6_prefix_;
     i_pv6_address = i_pv6_address_;
     private_i_pv4_address = private_i_pv4_address_;
     allocation_id = allocation_id_;
     subnet_id = subnet_id_;
   }
    : subnet_mapping)

let make_cipher ?priority:(priority_ : cipher_priority option) ?name:(name_ : cipher_name option) ()
    =
  ({ priority = priority_; name = name_ } : cipher)

let make_ssl_policy
    ?supported_load_balancer_types:(supported_load_balancer_types_ : list_of_string option)
    ?name:(name_ : ssl_policy_name option) ?ciphers:(ciphers_ : ciphers option)
    ?ssl_protocols:(ssl_protocols_ : ssl_protocols option) () =
  ({
     supported_load_balancer_types = supported_load_balancer_types_;
     name = name_;
     ciphers = ciphers_;
     ssl_protocols = ssl_protocols_;
   }
    : ssl_policy)

let make_source_ip_condition_config ?values:(values_ : list_of_string option) () =
  ({ values = values_ } : source_ip_condition_config)

let make_load_balancer_address ?i_pv6_address:(i_pv6_address_ : i_pv6_address option)
    ?private_i_pv4_address:(private_i_pv4_address_ : private_i_pv4_address option)
    ?allocation_id:(allocation_id_ : allocation_id option)
    ?ip_address:(ip_address_ : ip_address option) () =
  ({
     i_pv6_address = i_pv6_address_;
     private_i_pv4_address = private_i_pv4_address_;
     allocation_id = allocation_id_;
     ip_address = ip_address_;
   }
    : load_balancer_address)

let make_availability_zone
    ?source_nat_ipv6_prefixes:(source_nat_ipv6_prefixes_ : source_nat_ipv6_prefixes option)
    ?load_balancer_addresses:(load_balancer_addresses_ : load_balancer_addresses option)
    ?outpost_id:(outpost_id_ : outpost_id option) ?subnet_id:(subnet_id_ : subnet_id option)
    ?zone_name:(zone_name_ : zone_name option) () =
  ({
     source_nat_ipv6_prefixes = source_nat_ipv6_prefixes_;
     load_balancer_addresses = load_balancer_addresses_;
     outpost_id = outpost_id_;
     subnet_id = subnet_id_;
     zone_name = zone_name_;
   }
    : availability_zone)

let make_set_subnets_output
    ?enable_prefix_for_ipv6_source_nat:
      (enable_prefix_for_ipv6_source_nat_ : enable_prefix_for_ipv6_source_nat_enum option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?availability_zones:(availability_zones_ : availability_zones option) () =
  ({
     enable_prefix_for_ipv6_source_nat = enable_prefix_for_ipv6_source_nat_;
     ip_address_type = ip_address_type_;
     availability_zones = availability_zones_;
   }
    : set_subnets_output)

let make_set_subnets_input
    ?enable_prefix_for_ipv6_source_nat:
      (enable_prefix_for_ipv6_source_nat_ : enable_prefix_for_ipv6_source_nat_enum option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?subnet_mappings:(subnet_mappings_ : subnet_mappings option)
    ?subnets:(subnets_ : subnets option) ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn)
    () =
  ({
     enable_prefix_for_ipv6_source_nat = enable_prefix_for_ipv6_source_nat_;
     ip_address_type = ip_address_type_;
     subnet_mappings = subnet_mappings_;
     subnets = subnets_;
     load_balancer_arn = load_balancer_arn_;
   }
    : set_subnets_input)

let make_set_security_groups_output
    ?enforce_security_group_inbound_rules_on_private_link_traffic:
      (enforce_security_group_inbound_rules_on_private_link_traffic_ :
         enforce_security_group_inbound_rules_on_private_link_traffic_enum option)
    ?security_group_ids:(security_group_ids_ : security_groups option) () =
  ({
     enforce_security_group_inbound_rules_on_private_link_traffic =
       enforce_security_group_inbound_rules_on_private_link_traffic_;
     security_group_ids = security_group_ids_;
   }
    : set_security_groups_output)

let make_set_security_groups_input
    ?enforce_security_group_inbound_rules_on_private_link_traffic:
      (enforce_security_group_inbound_rules_on_private_link_traffic_ :
         enforce_security_group_inbound_rules_on_private_link_traffic_enum option)
    ~security_groups:(security_groups_ : security_groups)
    ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn) () =
  ({
     enforce_security_group_inbound_rules_on_private_link_traffic =
       enforce_security_group_inbound_rules_on_private_link_traffic_;
     security_groups = security_groups_;
     load_balancer_arn = load_balancer_arn_;
   }
    : set_security_groups_input)

let make_host_header_condition_config ?regex_values:(regex_values_ : list_of_string option)
    ?values:(values_ : list_of_string option) () =
  ({ regex_values = regex_values_; values = values_ } : host_header_condition_config)

let make_path_pattern_condition_config ?regex_values:(regex_values_ : list_of_string option)
    ?values:(values_ : list_of_string option) () =
  ({ regex_values = regex_values_; values = values_ } : path_pattern_condition_config)

let make_http_header_condition_config ?regex_values:(regex_values_ : list_of_string option)
    ?values:(values_ : list_of_string option)
    ?http_header_name:(http_header_name_ : http_header_condition_name option) () =
  ({ regex_values = regex_values_; values = values_; http_header_name = http_header_name_ }
    : http_header_condition_config)

let make_query_string_key_value_pair ?value:(value_ : string_value option)
    ?key:(key_ : string_value option) () =
  ({ value = value_; key = key_ } : query_string_key_value_pair)

let make_query_string_condition_config ?values:(values_ : query_string_key_value_pair_list option)
    () =
  ({ values = values_ } : query_string_condition_config)

let make_http_request_method_condition_config ?values:(values_ : list_of_string option) () =
  ({ values = values_ } : http_request_method_condition_config)

let make_rule_condition ?regex_values:(regex_values_ : list_of_string option)
    ?source_ip_config:(source_ip_config_ : source_ip_condition_config option)
    ?http_request_method_config:
      (http_request_method_config_ : http_request_method_condition_config option)
    ?query_string_config:(query_string_config_ : query_string_condition_config option)
    ?http_header_config:(http_header_config_ : http_header_condition_config option)
    ?path_pattern_config:(path_pattern_config_ : path_pattern_condition_config option)
    ?host_header_config:(host_header_config_ : host_header_condition_config option)
    ?values:(values_ : list_of_string option) ?field:(field_ : condition_field_name option) () =
  ({
     regex_values = regex_values_;
     source_ip_config = source_ip_config_;
     http_request_method_config = http_request_method_config_;
     query_string_config = query_string_config_;
     http_header_config = http_header_config_;
     path_pattern_config = path_pattern_config_;
     host_header_config = host_header_config_;
     values = values_;
     field = field_;
   }
    : rule_condition)

let make_authenticate_oidc_action_config
    ?use_existing_client_secret:
      (use_existing_client_secret_ : authenticate_oidc_action_use_existing_client_secret option)
    ?on_unauthenticated_request:
      (on_unauthenticated_request_ : authenticate_oidc_action_conditional_behavior_enum option)
    ?authentication_request_extra_params:
      (authentication_request_extra_params_ :
         authenticate_oidc_action_authentication_request_extra_params option)
    ?session_timeout:(session_timeout_ : authenticate_oidc_action_session_timeout option)
    ?scope:(scope_ : authenticate_oidc_action_scope option)
    ?session_cookie_name:
      (session_cookie_name_ : authenticate_oidc_action_session_cookie_name option)
    ?client_secret:(client_secret_ : authenticate_oidc_action_client_secret option)
    ~client_id:(client_id_ : authenticate_oidc_action_client_id)
    ~user_info_endpoint:(user_info_endpoint_ : authenticate_oidc_action_user_info_endpoint)
    ~token_endpoint:(token_endpoint_ : authenticate_oidc_action_token_endpoint)
    ~authorization_endpoint:
      (authorization_endpoint_ : authenticate_oidc_action_authorization_endpoint)
    ~issuer:(issuer_ : authenticate_oidc_action_issuer) () =
  ({
     use_existing_client_secret = use_existing_client_secret_;
     on_unauthenticated_request = on_unauthenticated_request_;
     authentication_request_extra_params = authentication_request_extra_params_;
     session_timeout = session_timeout_;
     scope = scope_;
     session_cookie_name = session_cookie_name_;
     client_secret = client_secret_;
     client_id = client_id_;
     user_info_endpoint = user_info_endpoint_;
     token_endpoint = token_endpoint_;
     authorization_endpoint = authorization_endpoint_;
     issuer = issuer_;
   }
    : authenticate_oidc_action_config)

let make_authenticate_cognito_action_config
    ?on_unauthenticated_request:
      (on_unauthenticated_request_ : authenticate_cognito_action_conditional_behavior_enum option)
    ?authentication_request_extra_params:
      (authentication_request_extra_params_ :
         authenticate_cognito_action_authentication_request_extra_params option)
    ?session_timeout:(session_timeout_ : authenticate_cognito_action_session_timeout option)
    ?scope:(scope_ : authenticate_cognito_action_scope option)
    ?session_cookie_name:
      (session_cookie_name_ : authenticate_cognito_action_session_cookie_name option)
    ~user_pool_domain:(user_pool_domain_ : authenticate_cognito_action_user_pool_domain)
    ~user_pool_client_id:(user_pool_client_id_ : authenticate_cognito_action_user_pool_client_id)
    ~user_pool_arn:(user_pool_arn_ : authenticate_cognito_action_user_pool_arn) () =
  ({
     on_unauthenticated_request = on_unauthenticated_request_;
     authentication_request_extra_params = authentication_request_extra_params_;
     session_timeout = session_timeout_;
     scope = scope_;
     session_cookie_name = session_cookie_name_;
     user_pool_domain = user_pool_domain_;
     user_pool_client_id = user_pool_client_id_;
     user_pool_arn = user_pool_arn_;
   }
    : authenticate_cognito_action_config)

let make_redirect_action_config ?query:(query_ : redirect_action_query option)
    ?path:(path_ : redirect_action_path option) ?host:(host_ : redirect_action_host option)
    ?port:(port_ : redirect_action_port option)
    ?protocol:(protocol_ : redirect_action_protocol option)
    ~status_code:(status_code_ : redirect_action_status_code_enum) () =
  ({
     status_code = status_code_;
     query = query_;
     path = path_;
     host = host_;
     port = port_;
     protocol = protocol_;
   }
    : redirect_action_config)

let make_fixed_response_action_config
    ?content_type:(content_type_ : fixed_response_action_content_type option)
    ?message_body:(message_body_ : fixed_response_action_message option)
    ~status_code:(status_code_ : fixed_response_action_status_code) () =
  ({ content_type = content_type_; status_code = status_code_; message_body = message_body_ }
    : fixed_response_action_config)

let make_forward_action_config
    ?target_group_stickiness_config:
      (target_group_stickiness_config_ : target_group_stickiness_config option)
    ?target_groups:(target_groups_ : target_group_list option) () =
  ({
     target_group_stickiness_config = target_group_stickiness_config_;
     target_groups = target_groups_;
   }
    : forward_action_config)

let make_jwt_validation_action_additional_claim
    ~values:(values_ : jwt_validation_action_additional_claim_values)
    ~name:(name_ : jwt_validation_action_additional_claim_name)
    ~format:(format_ : jwt_validation_action_additional_claim_format_enum) () =
  ({ values = values_; name = name_; format = format_ } : jwt_validation_action_additional_claim)

let make_jwt_validation_action_config
    ?additional_claims:(additional_claims_ : jwt_validation_action_additional_claims option)
    ~issuer:(issuer_ : jwt_validation_action_issuer)
    ~jwks_endpoint:(jwks_endpoint_ : jwt_validation_action_jwks_endpoint) () =
  ({ additional_claims = additional_claims_; issuer = issuer_; jwks_endpoint = jwks_endpoint_ }
    : jwt_validation_action_config)

let make_action
    ?jwt_validation_config:(jwt_validation_config_ : jwt_validation_action_config option)
    ?forward_config:(forward_config_ : forward_action_config option)
    ?fixed_response_config:(fixed_response_config_ : fixed_response_action_config option)
    ?redirect_config:(redirect_config_ : redirect_action_config option)
    ?order:(order_ : action_order option)
    ?authenticate_cognito_config:
      (authenticate_cognito_config_ : authenticate_cognito_action_config option)
    ?authenticate_oidc_config:(authenticate_oidc_config_ : authenticate_oidc_action_config option)
    ?target_group_arn:(target_group_arn_ : target_group_arn option)
    ~type_:(type__ : action_type_enum) () =
  ({
     jwt_validation_config = jwt_validation_config_;
     forward_config = forward_config_;
     fixed_response_config = fixed_response_config_;
     redirect_config = redirect_config_;
     order = order_;
     authenticate_cognito_config = authenticate_cognito_config_;
     authenticate_oidc_config = authenticate_oidc_config_;
     target_group_arn = target_group_arn_;
     type_ = type__;
   }
    : action)

let make_host_header_rewrite_config ?rewrites:(rewrites_ : rewrite_config_list option) () =
  ({ rewrites = rewrites_ } : host_header_rewrite_config)

let make_rule_transform ?url_rewrite_config:(url_rewrite_config_ : url_rewrite_config option)
    ?host_header_rewrite_config:(host_header_rewrite_config_ : host_header_rewrite_config option)
    ~type_:(type__ : transform_type_enum) () =
  ({
     url_rewrite_config = url_rewrite_config_;
     host_header_rewrite_config = host_header_rewrite_config_;
     type_ = type__;
   }
    : rule_transform)

let make_rule ?transforms:(transforms_ : rule_transform_list option)
    ?is_default:(is_default_ : is_default option) ?actions:(actions_ : actions option)
    ?conditions:(conditions_ : rule_condition_list option) ?priority:(priority_ : string_ option)
    ?rule_arn:(rule_arn_ : rule_arn option) () =
  ({
     transforms = transforms_;
     is_default = is_default_;
     actions = actions_;
     conditions = conditions_;
     priority = priority_;
     rule_arn = rule_arn_;
   }
    : rule)

let make_set_rule_priorities_output ?rules:(rules_ : rules option) () =
  ({ rules = rules_ } : set_rule_priorities_output)

let make_rule_priority_pair ?priority:(priority_ : rule_priority option)
    ?rule_arn:(rule_arn_ : rule_arn option) () =
  ({ priority = priority_; rule_arn = rule_arn_ } : rule_priority_pair)

let make_set_rule_priorities_input ~rule_priorities:(rule_priorities_ : rule_priority_list) () =
  ({ rule_priorities = rule_priorities_ } : set_rule_priorities_input)

let make_set_ip_address_type_output ?ip_address_type:(ip_address_type_ : ip_address_type option) ()
    =
  ({ ip_address_type = ip_address_type_ } : set_ip_address_type_output)

let make_set_ip_address_type_input ~ip_address_type:(ip_address_type_ : ip_address_type)
    ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn) () =
  ({ ip_address_type = ip_address_type_; load_balancer_arn = load_balancer_arn_ }
    : set_ip_address_type_input)

let make_revocation_content ?revocation_type:(revocation_type_ : revocation_type option)
    ?s3_object_version:(s3_object_version_ : s3_object_version option)
    ?s3_key:(s3_key_ : s3_key option) ?s3_bucket:(s3_bucket_ : s3_bucket option) () =
  ({
     revocation_type = revocation_type_;
     s3_object_version = s3_object_version_;
     s3_key = s3_key_;
     s3_bucket = s3_bucket_;
   }
    : revocation_content)

let make_remove_trust_store_revocations_output () = (() : unit)

let make_remove_trust_store_revocations_input ~revocation_ids:(revocation_ids_ : revocation_ids)
    ~trust_store_arn:(trust_store_arn_ : trust_store_arn) () =
  ({ revocation_ids = revocation_ids_; trust_store_arn = trust_store_arn_ }
    : remove_trust_store_revocations_input)

let make_remove_tags_output () = (() : unit)

let make_remove_tags_input ~tag_keys:(tag_keys_ : tag_keys)
    ~resource_arns:(resource_arns_ : resource_arns) () =
  ({ tag_keys = tag_keys_; resource_arns = resource_arns_ } : remove_tags_input)

let make_remove_listener_certificates_output () = (() : unit)

let make_certificate ?is_default:(is_default_ : default option)
    ?certificate_arn:(certificate_arn_ : certificate_arn option) () =
  ({ is_default = is_default_; certificate_arn = certificate_arn_ } : certificate)

let make_remove_listener_certificates_input ~certificates:(certificates_ : certificate_list)
    ~listener_arn:(listener_arn_ : listener_arn) () =
  ({ certificates = certificates_; listener_arn = listener_arn_ }
    : remove_listener_certificates_input)

let make_register_targets_output () = (() : unit)

let make_register_targets_input ~targets:(targets_ : target_descriptions)
    ~target_group_arn:(target_group_arn_ : target_group_arn) () =
  ({ targets = targets_; target_group_arn = target_group_arn_ } : register_targets_input)

let make_mutual_authentication_attributes
    ?advertise_trust_store_ca_names:
      (advertise_trust_store_ca_names_ : advertise_trust_store_ca_names_enum option)
    ?trust_store_association_status:
      (trust_store_association_status_ : trust_store_association_status_enum option)
    ?ignore_client_certificate_expiry:
      (ignore_client_certificate_expiry_ : ignore_client_certificate_expiry option)
    ?trust_store_arn:(trust_store_arn_ : trust_store_arn option) ?mode:(mode_ : mode option) () =
  ({
     advertise_trust_store_ca_names = advertise_trust_store_ca_names_;
     trust_store_association_status = trust_store_association_status_;
     ignore_client_certificate_expiry = ignore_client_certificate_expiry_;
     trust_store_arn = trust_store_arn_;
     mode = mode_;
   }
    : mutual_authentication_attributes)

let make_modify_trust_store_output ?trust_stores:(trust_stores_ : trust_stores option) () =
  ({ trust_stores = trust_stores_ } : modify_trust_store_output)

let make_modify_trust_store_input
    ?ca_certificates_bundle_s3_object_version:
      (ca_certificates_bundle_s3_object_version_ : s3_object_version option)
    ~ca_certificates_bundle_s3_key:(ca_certificates_bundle_s3_key_ : s3_key)
    ~ca_certificates_bundle_s3_bucket:(ca_certificates_bundle_s3_bucket_ : s3_bucket)
    ~trust_store_arn:(trust_store_arn_ : trust_store_arn) () =
  ({
     ca_certificates_bundle_s3_object_version = ca_certificates_bundle_s3_object_version_;
     ca_certificates_bundle_s3_key = ca_certificates_bundle_s3_key_;
     ca_certificates_bundle_s3_bucket = ca_certificates_bundle_s3_bucket_;
     trust_store_arn = trust_store_arn_;
   }
    : modify_trust_store_input)

let make_modify_target_group_output ?target_groups:(target_groups_ : target_groups option) () =
  ({ target_groups = target_groups_ } : modify_target_group_output)

let make_modify_target_group_input ?matcher:(matcher_ : matcher option)
    ?unhealthy_threshold_count:(unhealthy_threshold_count_ : health_check_threshold_count option)
    ?healthy_threshold_count:(healthy_threshold_count_ : health_check_threshold_count option)
    ?health_check_timeout_seconds:
      (health_check_timeout_seconds_ : health_check_timeout_seconds option)
    ?health_check_interval_seconds:
      (health_check_interval_seconds_ : health_check_interval_seconds option)
    ?health_check_enabled:(health_check_enabled_ : health_check_enabled option)
    ?health_check_path:(health_check_path_ : path option)
    ?health_check_port:(health_check_port_ : health_check_port option)
    ?health_check_protocol:(health_check_protocol_ : protocol_enum option)
    ~target_group_arn:(target_group_arn_ : target_group_arn) () =
  ({
     matcher = matcher_;
     unhealthy_threshold_count = unhealthy_threshold_count_;
     healthy_threshold_count = healthy_threshold_count_;
     health_check_timeout_seconds = health_check_timeout_seconds_;
     health_check_interval_seconds = health_check_interval_seconds_;
     health_check_enabled = health_check_enabled_;
     health_check_path = health_check_path_;
     health_check_port = health_check_port_;
     health_check_protocol = health_check_protocol_;
     target_group_arn = target_group_arn_;
   }
    : modify_target_group_input)

let make_modify_target_group_attributes_output
    ?attributes:(attributes_ : target_group_attributes option) () =
  ({ attributes = attributes_ } : modify_target_group_attributes_output)

let make_modify_target_group_attributes_input ~attributes:(attributes_ : target_group_attributes)
    ~target_group_arn:(target_group_arn_ : target_group_arn) () =
  ({ attributes = attributes_; target_group_arn = target_group_arn_ }
    : modify_target_group_attributes_input)

let make_modify_rule_output ?rules:(rules_ : rules option) () =
  ({ rules = rules_ } : modify_rule_output)

let make_modify_rule_input ?reset_transforms:(reset_transforms_ : reset_transforms option)
    ?transforms:(transforms_ : rule_transform_list option) ?actions:(actions_ : actions option)
    ?conditions:(conditions_ : rule_condition_list option) ~rule_arn:(rule_arn_ : rule_arn) () =
  ({
     reset_transforms = reset_transforms_;
     transforms = transforms_;
     actions = actions_;
     conditions = conditions_;
     rule_arn = rule_arn_;
   }
    : modify_rule_input)

let make_load_balancer_attribute ?value:(value_ : load_balancer_attribute_value option)
    ?key:(key_ : load_balancer_attribute_key option) () =
  ({ value = value_; key = key_ } : load_balancer_attribute)

let make_modify_load_balancer_attributes_output
    ?attributes:(attributes_ : load_balancer_attributes option) () =
  ({ attributes = attributes_ } : modify_load_balancer_attributes_output)

let make_modify_load_balancer_attributes_input ~attributes:(attributes_ : load_balancer_attributes)
    ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn) () =
  ({ attributes = attributes_; load_balancer_arn = load_balancer_arn_ }
    : modify_load_balancer_attributes_input)

let make_listener
    ?mutual_authentication:(mutual_authentication_ : mutual_authentication_attributes option)
    ?alpn_policy:(alpn_policy_ : alpn_policy_name option)
    ?default_actions:(default_actions_ : actions option)
    ?ssl_policy:(ssl_policy_ : ssl_policy_name option)
    ?certificates:(certificates_ : certificate_list option)
    ?protocol:(protocol_ : protocol_enum option) ?port:(port_ : port option)
    ?load_balancer_arn:(load_balancer_arn_ : load_balancer_arn option)
    ?listener_arn:(listener_arn_ : listener_arn option) () =
  ({
     mutual_authentication = mutual_authentication_;
     alpn_policy = alpn_policy_;
     default_actions = default_actions_;
     ssl_policy = ssl_policy_;
     certificates = certificates_;
     protocol = protocol_;
     port = port_;
     load_balancer_arn = load_balancer_arn_;
     listener_arn = listener_arn_;
   }
    : listener)

let make_modify_listener_output ?listeners:(listeners_ : listeners option) () =
  ({ listeners = listeners_ } : modify_listener_output)

let make_modify_listener_input
    ?mutual_authentication:(mutual_authentication_ : mutual_authentication_attributes option)
    ?alpn_policy:(alpn_policy_ : alpn_policy_name option)
    ?default_actions:(default_actions_ : actions option)
    ?certificates:(certificates_ : certificate_list option)
    ?ssl_policy:(ssl_policy_ : ssl_policy_name option) ?protocol:(protocol_ : protocol_enum option)
    ?port:(port_ : port option) ~listener_arn:(listener_arn_ : listener_arn) () =
  ({
     mutual_authentication = mutual_authentication_;
     alpn_policy = alpn_policy_;
     default_actions = default_actions_;
     certificates = certificates_;
     ssl_policy = ssl_policy_;
     protocol = protocol_;
     port = port_;
     listener_arn = listener_arn_;
   }
    : modify_listener_input)

let make_listener_attribute ?value:(value_ : listener_attribute_value option)
    ?key:(key_ : listener_attribute_key option) () =
  ({ value = value_; key = key_ } : listener_attribute)

let make_modify_listener_attributes_output ?attributes:(attributes_ : listener_attributes option) ()
    =
  ({ attributes = attributes_ } : modify_listener_attributes_output)

let make_modify_listener_attributes_input ~attributes:(attributes_ : listener_attributes)
    ~listener_arn:(listener_arn_ : listener_arn) () =
  ({ attributes = attributes_; listener_arn = listener_arn_ } : modify_listener_attributes_input)

let make_ipam_pools ?ipv4_ipam_pool_id:(ipv4_ipam_pool_id_ : ipam_pool_id option) () =
  ({ ipv4_ipam_pool_id = ipv4_ipam_pool_id_ } : ipam_pools)

let make_modify_ip_pools_output ?ipam_pools:(ipam_pools_ : ipam_pools option) () =
  ({ ipam_pools = ipam_pools_ } : modify_ip_pools_output)

let make_modify_ip_pools_input ?remove_ipam_pools:(remove_ipam_pools_ : remove_ipam_pools option)
    ?ipam_pools:(ipam_pools_ : ipam_pools option)
    ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn) () =
  ({
     remove_ipam_pools = remove_ipam_pools_;
     ipam_pools = ipam_pools_;
     load_balancer_arn = load_balancer_arn_;
   }
    : modify_ip_pools_input)

let make_minimum_load_balancer_capacity ?capacity_units:(capacity_units_ : capacity_units option) ()
    =
  ({ capacity_units = capacity_units_ } : minimum_load_balancer_capacity)

let make_modify_capacity_reservation_output
    ?capacity_reservation_state:
      (capacity_reservation_state_ : zonal_capacity_reservation_states option)
    ?minimum_load_balancer_capacity:
      (minimum_load_balancer_capacity_ : minimum_load_balancer_capacity option)
    ?decrease_requests_remaining:(decrease_requests_remaining_ : decrease_requests_remaining option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option) () =
  ({
     capacity_reservation_state = capacity_reservation_state_;
     minimum_load_balancer_capacity = minimum_load_balancer_capacity_;
     decrease_requests_remaining = decrease_requests_remaining_;
     last_modified_time = last_modified_time_;
   }
    : modify_capacity_reservation_output)

let make_modify_capacity_reservation_input
    ?reset_capacity_reservation:(reset_capacity_reservation_ : reset_capacity_reservation option)
    ?minimum_load_balancer_capacity:
      (minimum_load_balancer_capacity_ : minimum_load_balancer_capacity option)
    ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn) () =
  ({
     reset_capacity_reservation = reset_capacity_reservation_;
     minimum_load_balancer_capacity = minimum_load_balancer_capacity_;
     load_balancer_arn = load_balancer_arn_;
   }
    : modify_capacity_reservation_input)

let make_load_balancer_state ?reason:(reason_ : state_reason option)
    ?code:(code_ : load_balancer_state_enum option) () =
  ({ reason = reason_; code = code_ } : load_balancer_state)

let make_load_balancer ?ipam_pools:(ipam_pools_ : ipam_pools option)
    ?enable_prefix_for_ipv6_source_nat:
      (enable_prefix_for_ipv6_source_nat_ : enable_prefix_for_ipv6_source_nat_enum option)
    ?enforce_security_group_inbound_rules_on_private_link_traffic:
      (enforce_security_group_inbound_rules_on_private_link_traffic_ :
         enforce_security_group_inbound_rules_on_private_link_traffic option)
    ?customer_owned_ipv4_pool:(customer_owned_ipv4_pool_ : customer_owned_ipv4_pool option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?security_groups:(security_groups_ : security_groups option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?type_:(type__ : load_balancer_type_enum option) ?state:(state_ : load_balancer_state option)
    ?vpc_id:(vpc_id_ : vpc_id option) ?scheme:(scheme_ : load_balancer_scheme_enum option)
    ?load_balancer_name:(load_balancer_name_ : load_balancer_name option)
    ?created_time:(created_time_ : created_time option)
    ?canonical_hosted_zone_id:(canonical_hosted_zone_id_ : canonical_hosted_zone_id option)
    ?dns_name:(dns_name_ : dns_name option)
    ?load_balancer_arn:(load_balancer_arn_ : load_balancer_arn option) () =
  ({
     ipam_pools = ipam_pools_;
     enable_prefix_for_ipv6_source_nat = enable_prefix_for_ipv6_source_nat_;
     enforce_security_group_inbound_rules_on_private_link_traffic =
       enforce_security_group_inbound_rules_on_private_link_traffic_;
     customer_owned_ipv4_pool = customer_owned_ipv4_pool_;
     ip_address_type = ip_address_type_;
     security_groups = security_groups_;
     availability_zones = availability_zones_;
     type_ = type__;
     state = state_;
     vpc_id = vpc_id_;
     scheme = scheme_;
     load_balancer_name = load_balancer_name_;
     created_time = created_time_;
     canonical_hosted_zone_id = canonical_hosted_zone_id_;
     dns_name = dns_name_;
     load_balancer_arn = load_balancer_arn_;
   }
    : load_balancer)

let make_limit ?max:(max_ : max option) ?name:(name_ : name option) () =
  ({ max = max_; name = name_ } : limit)

let make_get_trust_store_revocation_content_output ?location:(location_ : location option) () =
  ({ location = location_ } : get_trust_store_revocation_content_output)

let make_get_trust_store_revocation_content_input ~revocation_id:(revocation_id_ : revocation_id)
    ~trust_store_arn:(trust_store_arn_ : trust_store_arn) () =
  ({ revocation_id = revocation_id_; trust_store_arn = trust_store_arn_ }
    : get_trust_store_revocation_content_input)

let make_get_trust_store_ca_certificates_bundle_output ?location:(location_ : location option) () =
  ({ location = location_ } : get_trust_store_ca_certificates_bundle_output)

let make_get_trust_store_ca_certificates_bundle_input
    ~trust_store_arn:(trust_store_arn_ : trust_store_arn) () =
  ({ trust_store_arn = trust_store_arn_ } : get_trust_store_ca_certificates_bundle_input)

let make_get_resource_policy_output ?policy:(policy_ : policy option) () =
  ({ policy = policy_ } : get_resource_policy_output)

let make_get_resource_policy_input ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_input)

let make_describe_trust_stores_output ?next_marker:(next_marker_ : marker option)
    ?trust_stores:(trust_stores_ : trust_stores option) () =
  ({ next_marker = next_marker_; trust_stores = trust_stores_ } : describe_trust_stores_output)

let make_describe_trust_stores_input ?page_size:(page_size_ : page_size option)
    ?marker:(marker_ : marker option) ?names:(names_ : trust_store_names option)
    ?trust_store_arns:(trust_store_arns_ : trust_store_arns option) () =
  ({
     page_size = page_size_;
     marker = marker_;
     names = names_;
     trust_store_arns = trust_store_arns_;
   }
    : describe_trust_stores_input)

let make_describe_trust_store_revocation
    ?number_of_revoked_entries:(number_of_revoked_entries_ : number_of_revoked_entries option)
    ?revocation_type:(revocation_type_ : revocation_type option)
    ?revocation_id:(revocation_id_ : revocation_id option)
    ?trust_store_arn:(trust_store_arn_ : trust_store_arn option) () =
  ({
     number_of_revoked_entries = number_of_revoked_entries_;
     revocation_type = revocation_type_;
     revocation_id = revocation_id_;
     trust_store_arn = trust_store_arn_;
   }
    : describe_trust_store_revocation)

let make_describe_trust_store_revocations_output ?next_marker:(next_marker_ : marker option)
    ?trust_store_revocations:
      (trust_store_revocations_ : describe_trust_store_revocation_response option) () =
  ({ next_marker = next_marker_; trust_store_revocations = trust_store_revocations_ }
    : describe_trust_store_revocations_output)

let make_describe_trust_store_revocations_input ?page_size:(page_size_ : page_size option)
    ?marker:(marker_ : marker option) ?revocation_ids:(revocation_ids_ : revocation_ids option)
    ~trust_store_arn:(trust_store_arn_ : trust_store_arn) () =
  ({
     page_size = page_size_;
     marker = marker_;
     revocation_ids = revocation_ids_;
     trust_store_arn = trust_store_arn_;
   }
    : describe_trust_store_revocations_input)

let make_describe_trust_store_associations_output ?next_marker:(next_marker_ : marker option)
    ?trust_store_associations:(trust_store_associations_ : trust_store_associations option) () =
  ({ next_marker = next_marker_; trust_store_associations = trust_store_associations_ }
    : describe_trust_store_associations_output)

let make_describe_trust_store_associations_input ?page_size:(page_size_ : page_size option)
    ?marker:(marker_ : marker option) ~trust_store_arn:(trust_store_arn_ : trust_store_arn) () =
  ({ page_size = page_size_; marker = marker_; trust_store_arn = trust_store_arn_ }
    : describe_trust_store_associations_input)

let make_describe_target_health_output
    ?target_health_descriptions:(target_health_descriptions_ : target_health_descriptions option) ()
    =
  ({ target_health_descriptions = target_health_descriptions_ } : describe_target_health_output)

let make_describe_target_health_input
    ?include_:(include__ : list_of_describe_target_health_include_options option)
    ?targets:(targets_ : target_descriptions option)
    ~target_group_arn:(target_group_arn_ : target_group_arn) () =
  ({ include_ = include__; targets = targets_; target_group_arn = target_group_arn_ }
    : describe_target_health_input)

let make_describe_target_groups_output ?next_marker:(next_marker_ : marker option)
    ?target_groups:(target_groups_ : target_groups option) () =
  ({ next_marker = next_marker_; target_groups = target_groups_ } : describe_target_groups_output)

let make_describe_target_groups_input ?page_size:(page_size_ : page_size option)
    ?marker:(marker_ : marker option) ?names:(names_ : target_group_names option)
    ?target_group_arns:(target_group_arns_ : target_group_arns option)
    ?load_balancer_arn:(load_balancer_arn_ : load_balancer_arn option) () =
  ({
     page_size = page_size_;
     marker = marker_;
     names = names_;
     target_group_arns = target_group_arns_;
     load_balancer_arn = load_balancer_arn_;
   }
    : describe_target_groups_input)

let make_describe_target_group_attributes_output
    ?attributes:(attributes_ : target_group_attributes option) () =
  ({ attributes = attributes_ } : describe_target_group_attributes_output)

let make_describe_target_group_attributes_input
    ~target_group_arn:(target_group_arn_ : target_group_arn) () =
  ({ target_group_arn = target_group_arn_ } : describe_target_group_attributes_input)

let make_describe_tags_output ?tag_descriptions:(tag_descriptions_ : tag_descriptions option) () =
  ({ tag_descriptions = tag_descriptions_ } : describe_tags_output)

let make_describe_tags_input ~resource_arns:(resource_arns_ : resource_arns) () =
  ({ resource_arns = resource_arns_ } : describe_tags_input)

let make_describe_ssl_policies_output ?next_marker:(next_marker_ : marker option)
    ?ssl_policies:(ssl_policies_ : ssl_policies option) () =
  ({ next_marker = next_marker_; ssl_policies = ssl_policies_ } : describe_ssl_policies_output)

let make_describe_ssl_policies_input
    ?load_balancer_type:(load_balancer_type_ : load_balancer_type_enum option)
    ?page_size:(page_size_ : page_size option) ?marker:(marker_ : marker option)
    ?names:(names_ : ssl_policy_names option) () =
  ({
     load_balancer_type = load_balancer_type_;
     page_size = page_size_;
     marker = marker_;
     names = names_;
   }
    : describe_ssl_policies_input)

let make_describe_rules_output ?next_marker:(next_marker_ : marker option)
    ?rules:(rules_ : rules option) () =
  ({ next_marker = next_marker_; rules = rules_ } : describe_rules_output)

let make_describe_rules_input ?page_size:(page_size_ : page_size option)
    ?marker:(marker_ : marker option) ?rule_arns:(rule_arns_ : rule_arns option)
    ?listener_arn:(listener_arn_ : listener_arn option) () =
  ({
     page_size = page_size_;
     marker = marker_;
     rule_arns = rule_arns_;
     listener_arn = listener_arn_;
   }
    : describe_rules_input)

let make_describe_load_balancers_output ?next_marker:(next_marker_ : marker option)
    ?load_balancers:(load_balancers_ : load_balancers option) () =
  ({ next_marker = next_marker_; load_balancers = load_balancers_ }
    : describe_load_balancers_output)

let make_describe_load_balancers_input ?page_size:(page_size_ : page_size option)
    ?marker:(marker_ : marker option) ?names:(names_ : load_balancer_names option)
    ?load_balancer_arns:(load_balancer_arns_ : load_balancer_arns option) () =
  ({
     page_size = page_size_;
     marker = marker_;
     names = names_;
     load_balancer_arns = load_balancer_arns_;
   }
    : describe_load_balancers_input)

let make_describe_load_balancer_attributes_output
    ?attributes:(attributes_ : load_balancer_attributes option) () =
  ({ attributes = attributes_ } : describe_load_balancer_attributes_output)

let make_describe_load_balancer_attributes_input
    ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn) () =
  ({ load_balancer_arn = load_balancer_arn_ } : describe_load_balancer_attributes_input)

let make_describe_listeners_output ?next_marker:(next_marker_ : marker option)
    ?listeners:(listeners_ : listeners option) () =
  ({ next_marker = next_marker_; listeners = listeners_ } : describe_listeners_output)

let make_describe_listeners_input ?page_size:(page_size_ : page_size option)
    ?marker:(marker_ : marker option) ?listener_arns:(listener_arns_ : listener_arns option)
    ?load_balancer_arn:(load_balancer_arn_ : load_balancer_arn option) () =
  ({
     page_size = page_size_;
     marker = marker_;
     listener_arns = listener_arns_;
     load_balancer_arn = load_balancer_arn_;
   }
    : describe_listeners_input)

let make_describe_listener_certificates_output ?next_marker:(next_marker_ : marker option)
    ?certificates:(certificates_ : certificate_list option) () =
  ({ next_marker = next_marker_; certificates = certificates_ }
    : describe_listener_certificates_output)

let make_describe_listener_certificates_input ?page_size:(page_size_ : page_size option)
    ?marker:(marker_ : marker option) ~listener_arn:(listener_arn_ : listener_arn) () =
  ({ page_size = page_size_; marker = marker_; listener_arn = listener_arn_ }
    : describe_listener_certificates_input)

let make_describe_listener_attributes_output ?attributes:(attributes_ : listener_attributes option)
    () =
  ({ attributes = attributes_ } : describe_listener_attributes_output)

let make_describe_listener_attributes_input ~listener_arn:(listener_arn_ : listener_arn) () =
  ({ listener_arn = listener_arn_ } : describe_listener_attributes_input)

let make_describe_capacity_reservation_output
    ?capacity_reservation_state:
      (capacity_reservation_state_ : zonal_capacity_reservation_states option)
    ?minimum_load_balancer_capacity:
      (minimum_load_balancer_capacity_ : minimum_load_balancer_capacity option)
    ?decrease_requests_remaining:(decrease_requests_remaining_ : decrease_requests_remaining option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option) () =
  ({
     capacity_reservation_state = capacity_reservation_state_;
     minimum_load_balancer_capacity = minimum_load_balancer_capacity_;
     decrease_requests_remaining = decrease_requests_remaining_;
     last_modified_time = last_modified_time_;
   }
    : describe_capacity_reservation_output)

let make_describe_capacity_reservation_input
    ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn) () =
  ({ load_balancer_arn = load_balancer_arn_ } : describe_capacity_reservation_input)

let make_describe_account_limits_output ?next_marker:(next_marker_ : marker option)
    ?limits:(limits_ : limits option) () =
  ({ next_marker = next_marker_; limits = limits_ } : describe_account_limits_output)

let make_describe_account_limits_input ?page_size:(page_size_ : page_size option)
    ?marker:(marker_ : marker option) () =
  ({ page_size = page_size_; marker = marker_ } : describe_account_limits_input)

let make_deregister_targets_output () = (() : unit)

let make_deregister_targets_input ~targets:(targets_ : target_descriptions)
    ~target_group_arn:(target_group_arn_ : target_group_arn) () =
  ({ targets = targets_; target_group_arn = target_group_arn_ } : deregister_targets_input)

let make_delete_trust_store_output () = (() : unit)

let make_delete_trust_store_input ~trust_store_arn:(trust_store_arn_ : trust_store_arn) () =
  ({ trust_store_arn = trust_store_arn_ } : delete_trust_store_input)

let make_delete_target_group_output () = (() : unit)

let make_delete_target_group_input ~target_group_arn:(target_group_arn_ : target_group_arn) () =
  ({ target_group_arn = target_group_arn_ } : delete_target_group_input)

let make_delete_shared_trust_store_association_output () = (() : unit)

let make_delete_shared_trust_store_association_input ~resource_arn:(resource_arn_ : resource_arn)
    ~trust_store_arn:(trust_store_arn_ : trust_store_arn) () =
  ({ resource_arn = resource_arn_; trust_store_arn = trust_store_arn_ }
    : delete_shared_trust_store_association_input)

let make_delete_rule_output () = (() : unit)

let make_delete_rule_input ~rule_arn:(rule_arn_ : rule_arn) () =
  ({ rule_arn = rule_arn_ } : delete_rule_input)

let make_delete_load_balancer_output () = (() : unit)

let make_delete_load_balancer_input ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn) () =
  ({ load_balancer_arn = load_balancer_arn_ } : delete_load_balancer_input)

let make_delete_listener_output () = (() : unit)

let make_delete_listener_input ~listener_arn:(listener_arn_ : listener_arn) () =
  ({ listener_arn = listener_arn_ } : delete_listener_input)

let make_create_trust_store_output ?trust_stores:(trust_stores_ : trust_stores option) () =
  ({ trust_stores = trust_stores_ } : create_trust_store_output)

let make_create_trust_store_input ?tags:(tags_ : tag_list option)
    ?ca_certificates_bundle_s3_object_version:
      (ca_certificates_bundle_s3_object_version_ : s3_object_version option)
    ~ca_certificates_bundle_s3_key:(ca_certificates_bundle_s3_key_ : s3_key)
    ~ca_certificates_bundle_s3_bucket:(ca_certificates_bundle_s3_bucket_ : s3_bucket)
    ~name:(name_ : trust_store_name) () =
  ({
     tags = tags_;
     ca_certificates_bundle_s3_object_version = ca_certificates_bundle_s3_object_version_;
     ca_certificates_bundle_s3_key = ca_certificates_bundle_s3_key_;
     ca_certificates_bundle_s3_bucket = ca_certificates_bundle_s3_bucket_;
     name = name_;
   }
    : create_trust_store_input)

let make_create_target_group_output ?target_groups:(target_groups_ : target_groups option) () =
  ({ target_groups = target_groups_ } : create_target_group_output)

let make_create_target_group_input
    ?target_control_port:(target_control_port_ : target_control_port option)
    ?ip_address_type:(ip_address_type_ : target_group_ip_address_type_enum option)
    ?tags:(tags_ : tag_list option) ?target_type:(target_type_ : target_type_enum option)
    ?matcher:(matcher_ : matcher option)
    ?unhealthy_threshold_count:(unhealthy_threshold_count_ : health_check_threshold_count option)
    ?healthy_threshold_count:(healthy_threshold_count_ : health_check_threshold_count option)
    ?health_check_timeout_seconds:
      (health_check_timeout_seconds_ : health_check_timeout_seconds option)
    ?health_check_interval_seconds:
      (health_check_interval_seconds_ : health_check_interval_seconds option)
    ?health_check_path:(health_check_path_ : path option)
    ?health_check_enabled:(health_check_enabled_ : health_check_enabled option)
    ?health_check_port:(health_check_port_ : health_check_port option)
    ?health_check_protocol:(health_check_protocol_ : protocol_enum option)
    ?vpc_id:(vpc_id_ : vpc_id option) ?port:(port_ : port option)
    ?protocol_version:(protocol_version_ : protocol_version option)
    ?protocol:(protocol_ : protocol_enum option) ~name:(name_ : target_group_name) () =
  ({
     target_control_port = target_control_port_;
     ip_address_type = ip_address_type_;
     tags = tags_;
     target_type = target_type_;
     matcher = matcher_;
     unhealthy_threshold_count = unhealthy_threshold_count_;
     healthy_threshold_count = healthy_threshold_count_;
     health_check_timeout_seconds = health_check_timeout_seconds_;
     health_check_interval_seconds = health_check_interval_seconds_;
     health_check_path = health_check_path_;
     health_check_enabled = health_check_enabled_;
     health_check_port = health_check_port_;
     health_check_protocol = health_check_protocol_;
     vpc_id = vpc_id_;
     port = port_;
     protocol_version = protocol_version_;
     protocol = protocol_;
     name = name_;
   }
    : create_target_group_input)

let make_create_rule_output ?rules:(rules_ : rules option) () =
  ({ rules = rules_ } : create_rule_output)

let make_create_rule_input ?transforms:(transforms_ : rule_transform_list option)
    ?tags:(tags_ : tag_list option) ~actions:(actions_ : actions)
    ~priority:(priority_ : rule_priority) ~conditions:(conditions_ : rule_condition_list)
    ~listener_arn:(listener_arn_ : listener_arn) () =
  ({
     transforms = transforms_;
     tags = tags_;
     actions = actions_;
     priority = priority_;
     conditions = conditions_;
     listener_arn = listener_arn_;
   }
    : create_rule_input)

let make_create_load_balancer_output ?load_balancers:(load_balancers_ : load_balancers option) () =
  ({ load_balancers = load_balancers_ } : create_load_balancer_output)

let make_create_load_balancer_input ?ipam_pools:(ipam_pools_ : ipam_pools option)
    ?enable_prefix_for_ipv6_source_nat:
      (enable_prefix_for_ipv6_source_nat_ : enable_prefix_for_ipv6_source_nat_enum option)
    ?customer_owned_ipv4_pool:(customer_owned_ipv4_pool_ : customer_owned_ipv4_pool option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?type_:(type__ : load_balancer_type_enum option) ?tags:(tags_ : tag_list option)
    ?scheme:(scheme_ : load_balancer_scheme_enum option)
    ?security_groups:(security_groups_ : security_groups option)
    ?subnet_mappings:(subnet_mappings_ : subnet_mappings option)
    ?subnets:(subnets_ : subnets option) ~name:(name_ : load_balancer_name) () =
  ({
     ipam_pools = ipam_pools_;
     enable_prefix_for_ipv6_source_nat = enable_prefix_for_ipv6_source_nat_;
     customer_owned_ipv4_pool = customer_owned_ipv4_pool_;
     ip_address_type = ip_address_type_;
     type_ = type__;
     tags = tags_;
     scheme = scheme_;
     security_groups = security_groups_;
     subnet_mappings = subnet_mappings_;
     subnets = subnets_;
     name = name_;
   }
    : create_load_balancer_input)

let make_create_listener_output ?listeners:(listeners_ : listeners option) () =
  ({ listeners = listeners_ } : create_listener_output)

let make_create_listener_input
    ?mutual_authentication:(mutual_authentication_ : mutual_authentication_attributes option)
    ?tags:(tags_ : tag_list option) ?alpn_policy:(alpn_policy_ : alpn_policy_name option)
    ?certificates:(certificates_ : certificate_list option)
    ?ssl_policy:(ssl_policy_ : ssl_policy_name option) ?port:(port_ : port option)
    ?protocol:(protocol_ : protocol_enum option) ~default_actions:(default_actions_ : actions)
    ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn) () =
  ({
     mutual_authentication = mutual_authentication_;
     tags = tags_;
     alpn_policy = alpn_policy_;
     default_actions = default_actions_;
     certificates = certificates_;
     ssl_policy = ssl_policy_;
     port = port_;
     protocol = protocol_;
     load_balancer_arn = load_balancer_arn_;
   }
    : create_listener_input)

let make_add_trust_store_revocations_output
    ?trust_store_revocations:(trust_store_revocations_ : trust_store_revocations option) () =
  ({ trust_store_revocations = trust_store_revocations_ } : add_trust_store_revocations_output)

let make_add_trust_store_revocations_input
    ?revocation_contents:(revocation_contents_ : revocation_contents option)
    ~trust_store_arn:(trust_store_arn_ : trust_store_arn) () =
  ({ revocation_contents = revocation_contents_; trust_store_arn = trust_store_arn_ }
    : add_trust_store_revocations_input)

let make_add_tags_output () = (() : unit)

let make_add_tags_input ~tags:(tags_ : tag_list) ~resource_arns:(resource_arns_ : resource_arns) ()
    =
  ({ tags = tags_; resource_arns = resource_arns_ } : add_tags_input)

let make_add_listener_certificates_output ?certificates:(certificates_ : certificate_list option) ()
    =
  ({ certificates = certificates_ } : add_listener_certificates_output)

let make_add_listener_certificates_input ~certificates:(certificates_ : certificate_list)
    ~listener_arn:(listener_arn_ : listener_arn) () =
  ({ certificates = certificates_; listener_arn = listener_arn_ } : add_listener_certificates_input)
