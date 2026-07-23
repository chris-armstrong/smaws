open Types

let make_jwt_validation_action_additional_claim
    ~format:(format_ : jwt_validation_action_additional_claim_format_enum)
    ~name:(name_ : jwt_validation_action_additional_claim_name)
    ~values:(values_ : jwt_validation_action_additional_claim_values) () =
  ({ format = format_; name = name_; values = values_ } : jwt_validation_action_additional_claim)

let make_jwt_validation_action_config
    ?additional_claims:(additional_claims_ : jwt_validation_action_additional_claims option)
    ~jwks_endpoint:(jwks_endpoint_ : jwt_validation_action_jwks_endpoint)
    ~issuer:(issuer_ : jwt_validation_action_issuer) () =
  ({ jwks_endpoint = jwks_endpoint_; issuer = issuer_; additional_claims = additional_claims_ }
    : jwt_validation_action_config)

let make_target_group_stickiness_config ?enabled:(enabled_ : target_group_stickiness_enabled option)
    ?duration_seconds:(duration_seconds_ : target_group_stickiness_duration_seconds option) () =
  ({ enabled = enabled_; duration_seconds = duration_seconds_ } : target_group_stickiness_config)

let make_target_group_tuple ?target_group_arn:(target_group_arn_ : target_group_arn option)
    ?weight:(weight_ : target_group_weight option) () =
  ({ target_group_arn = target_group_arn_; weight = weight_ } : target_group_tuple)

let make_forward_action_config ?target_groups:(target_groups_ : target_group_list option)
    ?target_group_stickiness_config:
      (target_group_stickiness_config_ : target_group_stickiness_config option) () =
  ({
     target_groups = target_groups_;
     target_group_stickiness_config = target_group_stickiness_config_;
   }
    : forward_action_config)

let make_fixed_response_action_config
    ?message_body:(message_body_ : fixed_response_action_message option)
    ?content_type:(content_type_ : fixed_response_action_content_type option)
    ~status_code:(status_code_ : fixed_response_action_status_code) () =
  ({ message_body = message_body_; status_code = status_code_; content_type = content_type_ }
    : fixed_response_action_config)

let make_redirect_action_config ?protocol:(protocol_ : redirect_action_protocol option)
    ?port:(port_ : redirect_action_port option) ?host:(host_ : redirect_action_host option)
    ?path:(path_ : redirect_action_path option) ?query:(query_ : redirect_action_query option)
    ~status_code:(status_code_ : redirect_action_status_code_enum) () =
  ({
     protocol = protocol_;
     port = port_;
     host = host_;
     path = path_;
     query = query_;
     status_code = status_code_;
   }
    : redirect_action_config)

let make_authenticate_cognito_action_config
    ?session_cookie_name:
      (session_cookie_name_ : authenticate_cognito_action_session_cookie_name option)
    ?scope:(scope_ : authenticate_cognito_action_scope option)
    ?session_timeout:(session_timeout_ : authenticate_cognito_action_session_timeout option)
    ?authentication_request_extra_params:
      (authentication_request_extra_params_ :
         authenticate_cognito_action_authentication_request_extra_params option)
    ?on_unauthenticated_request:
      (on_unauthenticated_request_ : authenticate_cognito_action_conditional_behavior_enum option)
    ~user_pool_arn:(user_pool_arn_ : authenticate_cognito_action_user_pool_arn)
    ~user_pool_client_id:(user_pool_client_id_ : authenticate_cognito_action_user_pool_client_id)
    ~user_pool_domain:(user_pool_domain_ : authenticate_cognito_action_user_pool_domain) () =
  ({
     user_pool_arn = user_pool_arn_;
     user_pool_client_id = user_pool_client_id_;
     user_pool_domain = user_pool_domain_;
     session_cookie_name = session_cookie_name_;
     scope = scope_;
     session_timeout = session_timeout_;
     authentication_request_extra_params = authentication_request_extra_params_;
     on_unauthenticated_request = on_unauthenticated_request_;
   }
    : authenticate_cognito_action_config)

let make_authenticate_oidc_action_config
    ?client_secret:(client_secret_ : authenticate_oidc_action_client_secret option)
    ?session_cookie_name:
      (session_cookie_name_ : authenticate_oidc_action_session_cookie_name option)
    ?scope:(scope_ : authenticate_oidc_action_scope option)
    ?session_timeout:(session_timeout_ : authenticate_oidc_action_session_timeout option)
    ?authentication_request_extra_params:
      (authentication_request_extra_params_ :
         authenticate_oidc_action_authentication_request_extra_params option)
    ?on_unauthenticated_request:
      (on_unauthenticated_request_ : authenticate_oidc_action_conditional_behavior_enum option)
    ?use_existing_client_secret:
      (use_existing_client_secret_ : authenticate_oidc_action_use_existing_client_secret option)
    ~issuer:(issuer_ : authenticate_oidc_action_issuer)
    ~authorization_endpoint:
      (authorization_endpoint_ : authenticate_oidc_action_authorization_endpoint)
    ~token_endpoint:(token_endpoint_ : authenticate_oidc_action_token_endpoint)
    ~user_info_endpoint:(user_info_endpoint_ : authenticate_oidc_action_user_info_endpoint)
    ~client_id:(client_id_ : authenticate_oidc_action_client_id) () =
  ({
     issuer = issuer_;
     authorization_endpoint = authorization_endpoint_;
     token_endpoint = token_endpoint_;
     user_info_endpoint = user_info_endpoint_;
     client_id = client_id_;
     client_secret = client_secret_;
     session_cookie_name = session_cookie_name_;
     scope = scope_;
     session_timeout = session_timeout_;
     authentication_request_extra_params = authentication_request_extra_params_;
     on_unauthenticated_request = on_unauthenticated_request_;
     use_existing_client_secret = use_existing_client_secret_;
   }
    : authenticate_oidc_action_config)

let make_action ?target_group_arn:(target_group_arn_ : target_group_arn option)
    ?authenticate_oidc_config:(authenticate_oidc_config_ : authenticate_oidc_action_config option)
    ?authenticate_cognito_config:
      (authenticate_cognito_config_ : authenticate_cognito_action_config option)
    ?order:(order_ : action_order option)
    ?redirect_config:(redirect_config_ : redirect_action_config option)
    ?fixed_response_config:(fixed_response_config_ : fixed_response_action_config option)
    ?forward_config:(forward_config_ : forward_action_config option)
    ?jwt_validation_config:(jwt_validation_config_ : jwt_validation_action_config option)
    ~type_:(type__ : action_type_enum) () =
  ({
     type_ = type__;
     target_group_arn = target_group_arn_;
     authenticate_oidc_config = authenticate_oidc_config_;
     authenticate_cognito_config = authenticate_cognito_config_;
     order = order_;
     redirect_config = redirect_config_;
     fixed_response_config = fixed_response_config_;
     forward_config = forward_config_;
     jwt_validation_config = jwt_validation_config_;
   }
    : action)

let make_certificate ?certificate_arn:(certificate_arn_ : certificate_arn option)
    ?is_default:(is_default_ : default option) () =
  ({ certificate_arn = certificate_arn_; is_default = is_default_ } : certificate)

let make_add_listener_certificates_output ?certificates:(certificates_ : certificate_list option) ()
    =
  ({ certificates = certificates_ } : add_listener_certificates_output)

let make_add_listener_certificates_input ~listener_arn:(listener_arn_ : listener_arn)
    ~certificates:(certificates_ : certificate_list) () =
  ({ listener_arn = listener_arn_; certificates = certificates_ } : add_listener_certificates_input)

let make_add_tags_output () = (() : unit)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ key = key_; value = value_ } : tag)

let make_add_tags_input ~resource_arns:(resource_arns_ : resource_arns) ~tags:(tags_ : tag_list) ()
    =
  ({ resource_arns = resource_arns_; tags = tags_ } : add_tags_input)

let make_trust_store_revocation ?trust_store_arn:(trust_store_arn_ : trust_store_arn option)
    ?revocation_id:(revocation_id_ : revocation_id option)
    ?revocation_type:(revocation_type_ : revocation_type option)
    ?number_of_revoked_entries:(number_of_revoked_entries_ : number_of_revoked_entries option) () =
  ({
     trust_store_arn = trust_store_arn_;
     revocation_id = revocation_id_;
     revocation_type = revocation_type_;
     number_of_revoked_entries = number_of_revoked_entries_;
   }
    : trust_store_revocation)

let make_add_trust_store_revocations_output
    ?trust_store_revocations:(trust_store_revocations_ : trust_store_revocations option) () =
  ({ trust_store_revocations = trust_store_revocations_ } : add_trust_store_revocations_output)

let make_revocation_content ?s3_bucket:(s3_bucket_ : s3_bucket option)
    ?s3_key:(s3_key_ : s3_key option)
    ?s3_object_version:(s3_object_version_ : s3_object_version option)
    ?revocation_type:(revocation_type_ : revocation_type option) () =
  ({
     s3_bucket = s3_bucket_;
     s3_key = s3_key_;
     s3_object_version = s3_object_version_;
     revocation_type = revocation_type_;
   }
    : revocation_content)

let make_add_trust_store_revocations_input
    ?revocation_contents:(revocation_contents_ : revocation_contents option)
    ~trust_store_arn:(trust_store_arn_ : trust_store_arn) () =
  ({ trust_store_arn = trust_store_arn_; revocation_contents = revocation_contents_ }
    : add_trust_store_revocations_input)

let make_administrative_override ?state:(state_ : target_administrative_override_state_enum option)
    ?reason:(reason_ : target_administrative_override_reason_enum option)
    ?description:(description_ : description option) () =
  ({ state = state_; reason = reason_; description = description_ } : administrative_override)

let make_anomaly_detection ?result_:(result__ : anomaly_result_enum option)
    ?mitigation_in_effect:(mitigation_in_effect_ : mitigation_in_effect_enum option) () =
  ({ result_ = result__; mitigation_in_effect = mitigation_in_effect_ } : anomaly_detection)

let make_load_balancer_address ?ip_address:(ip_address_ : ip_address option)
    ?allocation_id:(allocation_id_ : allocation_id option)
    ?private_i_pv4_address:(private_i_pv4_address_ : private_i_pv4_address option)
    ?i_pv6_address:(i_pv6_address_ : i_pv6_address option) () =
  ({
     ip_address = ip_address_;
     allocation_id = allocation_id_;
     private_i_pv4_address = private_i_pv4_address_;
     i_pv6_address = i_pv6_address_;
   }
    : load_balancer_address)

let make_availability_zone ?zone_name:(zone_name_ : zone_name option)
    ?subnet_id:(subnet_id_ : subnet_id option) ?outpost_id:(outpost_id_ : outpost_id option)
    ?load_balancer_addresses:(load_balancer_addresses_ : load_balancer_addresses option)
    ?source_nat_ipv6_prefixes:(source_nat_ipv6_prefixes_ : source_nat_ipv6_prefixes option) () =
  ({
     zone_name = zone_name_;
     subnet_id = subnet_id_;
     outpost_id = outpost_id_;
     load_balancer_addresses = load_balancer_addresses_;
     source_nat_ipv6_prefixes = source_nat_ipv6_prefixes_;
   }
    : availability_zone)

let make_capacity_reservation_status ?code:(code_ : capacity_reservation_state_enum option)
    ?reason:(reason_ : state_reason option) () =
  ({ code = code_; reason = reason_ } : capacity_reservation_status)

let make_cipher ?name:(name_ : cipher_name option) ?priority:(priority_ : cipher_priority option) ()
    =
  ({ name = name_; priority = priority_ } : cipher)

let make_mutual_authentication_attributes ?mode:(mode_ : mode option)
    ?trust_store_arn:(trust_store_arn_ : trust_store_arn option)
    ?ignore_client_certificate_expiry:
      (ignore_client_certificate_expiry_ : ignore_client_certificate_expiry option)
    ?trust_store_association_status:
      (trust_store_association_status_ : trust_store_association_status_enum option)
    ?advertise_trust_store_ca_names:
      (advertise_trust_store_ca_names_ : advertise_trust_store_ca_names_enum option) () =
  ({
     mode = mode_;
     trust_store_arn = trust_store_arn_;
     ignore_client_certificate_expiry = ignore_client_certificate_expiry_;
     trust_store_association_status = trust_store_association_status_;
     advertise_trust_store_ca_names = advertise_trust_store_ca_names_;
   }
    : mutual_authentication_attributes)

let make_listener ?listener_arn:(listener_arn_ : listener_arn option)
    ?load_balancer_arn:(load_balancer_arn_ : load_balancer_arn option) ?port:(port_ : port option)
    ?protocol:(protocol_ : protocol_enum option)
    ?certificates:(certificates_ : certificate_list option)
    ?ssl_policy:(ssl_policy_ : ssl_policy_name option)
    ?default_actions:(default_actions_ : actions option)
    ?alpn_policy:(alpn_policy_ : alpn_policy_name option)
    ?mutual_authentication:(mutual_authentication_ : mutual_authentication_attributes option) () =
  ({
     listener_arn = listener_arn_;
     load_balancer_arn = load_balancer_arn_;
     port = port_;
     protocol = protocol_;
     certificates = certificates_;
     ssl_policy = ssl_policy_;
     default_actions = default_actions_;
     alpn_policy = alpn_policy_;
     mutual_authentication = mutual_authentication_;
   }
    : listener)

let make_create_listener_output ?listeners:(listeners_ : listeners option) () =
  ({ listeners = listeners_ } : create_listener_output)

let make_create_listener_input ?protocol:(protocol_ : protocol_enum option)
    ?port:(port_ : port option) ?ssl_policy:(ssl_policy_ : ssl_policy_name option)
    ?certificates:(certificates_ : certificate_list option)
    ?alpn_policy:(alpn_policy_ : alpn_policy_name option) ?tags:(tags_ : tag_list option)
    ?mutual_authentication:(mutual_authentication_ : mutual_authentication_attributes option)
    ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn)
    ~default_actions:(default_actions_ : actions) () =
  ({
     load_balancer_arn = load_balancer_arn_;
     protocol = protocol_;
     port = port_;
     ssl_policy = ssl_policy_;
     certificates = certificates_;
     default_actions = default_actions_;
     alpn_policy = alpn_policy_;
     tags = tags_;
     mutual_authentication = mutual_authentication_;
   }
    : create_listener_input)

let make_ipam_pools ?ipv4_ipam_pool_id:(ipv4_ipam_pool_id_ : ipam_pool_id option) () =
  ({ ipv4_ipam_pool_id = ipv4_ipam_pool_id_ } : ipam_pools)

let make_load_balancer_state ?code:(code_ : load_balancer_state_enum option)
    ?reason:(reason_ : state_reason option) () =
  ({ code = code_; reason = reason_ } : load_balancer_state)

let make_load_balancer ?load_balancer_arn:(load_balancer_arn_ : load_balancer_arn option)
    ?dns_name:(dns_name_ : dns_name option)
    ?canonical_hosted_zone_id:(canonical_hosted_zone_id_ : canonical_hosted_zone_id option)
    ?created_time:(created_time_ : created_time option)
    ?load_balancer_name:(load_balancer_name_ : load_balancer_name option)
    ?scheme:(scheme_ : load_balancer_scheme_enum option) ?vpc_id:(vpc_id_ : vpc_id option)
    ?state:(state_ : load_balancer_state option) ?type_:(type__ : load_balancer_type_enum option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?security_groups:(security_groups_ : security_groups option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?customer_owned_ipv4_pool:(customer_owned_ipv4_pool_ : customer_owned_ipv4_pool option)
    ?enforce_security_group_inbound_rules_on_private_link_traffic:
      (enforce_security_group_inbound_rules_on_private_link_traffic_ :
         enforce_security_group_inbound_rules_on_private_link_traffic option)
    ?enable_prefix_for_ipv6_source_nat:
      (enable_prefix_for_ipv6_source_nat_ : enable_prefix_for_ipv6_source_nat_enum option)
    ?ipam_pools:(ipam_pools_ : ipam_pools option) () =
  ({
     load_balancer_arn = load_balancer_arn_;
     dns_name = dns_name_;
     canonical_hosted_zone_id = canonical_hosted_zone_id_;
     created_time = created_time_;
     load_balancer_name = load_balancer_name_;
     scheme = scheme_;
     vpc_id = vpc_id_;
     state = state_;
     type_ = type__;
     availability_zones = availability_zones_;
     security_groups = security_groups_;
     ip_address_type = ip_address_type_;
     customer_owned_ipv4_pool = customer_owned_ipv4_pool_;
     enforce_security_group_inbound_rules_on_private_link_traffic =
       enforce_security_group_inbound_rules_on_private_link_traffic_;
     enable_prefix_for_ipv6_source_nat = enable_prefix_for_ipv6_source_nat_;
     ipam_pools = ipam_pools_;
   }
    : load_balancer)

let make_create_load_balancer_output ?load_balancers:(load_balancers_ : load_balancers option) () =
  ({ load_balancers = load_balancers_ } : create_load_balancer_output)

let make_subnet_mapping ?subnet_id:(subnet_id_ : subnet_id option)
    ?allocation_id:(allocation_id_ : allocation_id option)
    ?private_i_pv4_address:(private_i_pv4_address_ : private_i_pv4_address option)
    ?i_pv6_address:(i_pv6_address_ : i_pv6_address option)
    ?source_nat_ipv6_prefix:(source_nat_ipv6_prefix_ : source_nat_ipv6_prefix option) () =
  ({
     subnet_id = subnet_id_;
     allocation_id = allocation_id_;
     private_i_pv4_address = private_i_pv4_address_;
     i_pv6_address = i_pv6_address_;
     source_nat_ipv6_prefix = source_nat_ipv6_prefix_;
   }
    : subnet_mapping)

let make_create_load_balancer_input ?subnets:(subnets_ : subnets option)
    ?subnet_mappings:(subnet_mappings_ : subnet_mappings option)
    ?security_groups:(security_groups_ : security_groups option)
    ?scheme:(scheme_ : load_balancer_scheme_enum option) ?tags:(tags_ : tag_list option)
    ?type_:(type__ : load_balancer_type_enum option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?customer_owned_ipv4_pool:(customer_owned_ipv4_pool_ : customer_owned_ipv4_pool option)
    ?enable_prefix_for_ipv6_source_nat:
      (enable_prefix_for_ipv6_source_nat_ : enable_prefix_for_ipv6_source_nat_enum option)
    ?ipam_pools:(ipam_pools_ : ipam_pools option) ~name:(name_ : load_balancer_name) () =
  ({
     name = name_;
     subnets = subnets_;
     subnet_mappings = subnet_mappings_;
     security_groups = security_groups_;
     scheme = scheme_;
     tags = tags_;
     type_ = type__;
     ip_address_type = ip_address_type_;
     customer_owned_ipv4_pool = customer_owned_ipv4_pool_;
     enable_prefix_for_ipv6_source_nat = enable_prefix_for_ipv6_source_nat_;
     ipam_pools = ipam_pools_;
   }
    : create_load_balancer_input)

let make_rewrite_config ~regex:(regex_ : string_value) ~replace:(replace_ : string_value) () =
  ({ regex = regex_; replace = replace_ } : rewrite_config)

let make_url_rewrite_config ?rewrites:(rewrites_ : rewrite_config_list option) () =
  ({ rewrites = rewrites_ } : url_rewrite_config)

let make_host_header_rewrite_config ?rewrites:(rewrites_ : rewrite_config_list option) () =
  ({ rewrites = rewrites_ } : host_header_rewrite_config)

let make_rule_transform
    ?host_header_rewrite_config:(host_header_rewrite_config_ : host_header_rewrite_config option)
    ?url_rewrite_config:(url_rewrite_config_ : url_rewrite_config option)
    ~type_:(type__ : transform_type_enum) () =
  ({
     type_ = type__;
     host_header_rewrite_config = host_header_rewrite_config_;
     url_rewrite_config = url_rewrite_config_;
   }
    : rule_transform)

let make_source_ip_condition_config ?values:(values_ : list_of_string option) () =
  ({ values = values_ } : source_ip_condition_config)

let make_http_request_method_condition_config ?values:(values_ : list_of_string option) () =
  ({ values = values_ } : http_request_method_condition_config)

let make_query_string_key_value_pair ?key:(key_ : string_value option)
    ?value:(value_ : string_value option) () =
  ({ key = key_; value = value_ } : query_string_key_value_pair)

let make_query_string_condition_config ?values:(values_ : query_string_key_value_pair_list option)
    () =
  ({ values = values_ } : query_string_condition_config)

let make_http_header_condition_config
    ?http_header_name:(http_header_name_ : http_header_condition_name option)
    ?values:(values_ : list_of_string option) ?regex_values:(regex_values_ : list_of_string option)
    () =
  ({ http_header_name = http_header_name_; values = values_; regex_values = regex_values_ }
    : http_header_condition_config)

let make_path_pattern_condition_config ?values:(values_ : list_of_string option)
    ?regex_values:(regex_values_ : list_of_string option) () =
  ({ values = values_; regex_values = regex_values_ } : path_pattern_condition_config)

let make_host_header_condition_config ?values:(values_ : list_of_string option)
    ?regex_values:(regex_values_ : list_of_string option) () =
  ({ values = values_; regex_values = regex_values_ } : host_header_condition_config)

let make_rule_condition ?field:(field_ : condition_field_name option)
    ?values:(values_ : list_of_string option)
    ?host_header_config:(host_header_config_ : host_header_condition_config option)
    ?path_pattern_config:(path_pattern_config_ : path_pattern_condition_config option)
    ?http_header_config:(http_header_config_ : http_header_condition_config option)
    ?query_string_config:(query_string_config_ : query_string_condition_config option)
    ?http_request_method_config:
      (http_request_method_config_ : http_request_method_condition_config option)
    ?source_ip_config:(source_ip_config_ : source_ip_condition_config option)
    ?regex_values:(regex_values_ : list_of_string option) () =
  ({
     field = field_;
     values = values_;
     host_header_config = host_header_config_;
     path_pattern_config = path_pattern_config_;
     http_header_config = http_header_config_;
     query_string_config = query_string_config_;
     http_request_method_config = http_request_method_config_;
     source_ip_config = source_ip_config_;
     regex_values = regex_values_;
   }
    : rule_condition)

let make_rule ?rule_arn:(rule_arn_ : rule_arn option) ?priority:(priority_ : string_ option)
    ?conditions:(conditions_ : rule_condition_list option) ?actions:(actions_ : actions option)
    ?is_default:(is_default_ : is_default option)
    ?transforms:(transforms_ : rule_transform_list option) () =
  ({
     rule_arn = rule_arn_;
     priority = priority_;
     conditions = conditions_;
     actions = actions_;
     is_default = is_default_;
     transforms = transforms_;
   }
    : rule)

let make_create_rule_output ?rules:(rules_ : rules option) () =
  ({ rules = rules_ } : create_rule_output)

let make_create_rule_input ?tags:(tags_ : tag_list option)
    ?transforms:(transforms_ : rule_transform_list option)
    ~listener_arn:(listener_arn_ : listener_arn) ~conditions:(conditions_ : rule_condition_list)
    ~priority:(priority_ : rule_priority) ~actions:(actions_ : actions) () =
  ({
     listener_arn = listener_arn_;
     conditions = conditions_;
     priority = priority_;
     actions = actions_;
     tags = tags_;
     transforms = transforms_;
   }
    : create_rule_input)

let make_matcher ?http_code:(http_code_ : http_code option)
    ?grpc_code:(grpc_code_ : grpc_code option) () =
  ({ http_code = http_code_; grpc_code = grpc_code_ } : matcher)

let make_target_group ?target_group_arn:(target_group_arn_ : target_group_arn option)
    ?target_group_name:(target_group_name_ : target_group_name option)
    ?protocol:(protocol_ : protocol_enum option) ?port:(port_ : port option)
    ?vpc_id:(vpc_id_ : vpc_id option)
    ?health_check_protocol:(health_check_protocol_ : protocol_enum option)
    ?health_check_port:(health_check_port_ : health_check_port option)
    ?health_check_enabled:(health_check_enabled_ : health_check_enabled option)
    ?health_check_interval_seconds:
      (health_check_interval_seconds_ : health_check_interval_seconds option)
    ?health_check_timeout_seconds:
      (health_check_timeout_seconds_ : health_check_timeout_seconds option)
    ?healthy_threshold_count:(healthy_threshold_count_ : health_check_threshold_count option)
    ?unhealthy_threshold_count:(unhealthy_threshold_count_ : health_check_threshold_count option)
    ?health_check_path:(health_check_path_ : path option) ?matcher:(matcher_ : matcher option)
    ?load_balancer_arns:(load_balancer_arns_ : load_balancer_arns option)
    ?target_type:(target_type_ : target_type_enum option)
    ?protocol_version:(protocol_version_ : protocol_version option)
    ?ip_address_type:(ip_address_type_ : target_group_ip_address_type_enum option)
    ?target_control_port:(target_control_port_ : target_control_port option) () =
  ({
     target_group_arn = target_group_arn_;
     target_group_name = target_group_name_;
     protocol = protocol_;
     port = port_;
     vpc_id = vpc_id_;
     health_check_protocol = health_check_protocol_;
     health_check_port = health_check_port_;
     health_check_enabled = health_check_enabled_;
     health_check_interval_seconds = health_check_interval_seconds_;
     health_check_timeout_seconds = health_check_timeout_seconds_;
     healthy_threshold_count = healthy_threshold_count_;
     unhealthy_threshold_count = unhealthy_threshold_count_;
     health_check_path = health_check_path_;
     matcher = matcher_;
     load_balancer_arns = load_balancer_arns_;
     target_type = target_type_;
     protocol_version = protocol_version_;
     ip_address_type = ip_address_type_;
     target_control_port = target_control_port_;
   }
    : target_group)

let make_create_target_group_output ?target_groups:(target_groups_ : target_groups option) () =
  ({ target_groups = target_groups_ } : create_target_group_output)

let make_create_target_group_input ?protocol:(protocol_ : protocol_enum option)
    ?protocol_version:(protocol_version_ : protocol_version option) ?port:(port_ : port option)
    ?vpc_id:(vpc_id_ : vpc_id option)
    ?health_check_protocol:(health_check_protocol_ : protocol_enum option)
    ?health_check_port:(health_check_port_ : health_check_port option)
    ?health_check_enabled:(health_check_enabled_ : health_check_enabled option)
    ?health_check_path:(health_check_path_ : path option)
    ?health_check_interval_seconds:
      (health_check_interval_seconds_ : health_check_interval_seconds option)
    ?health_check_timeout_seconds:
      (health_check_timeout_seconds_ : health_check_timeout_seconds option)
    ?healthy_threshold_count:(healthy_threshold_count_ : health_check_threshold_count option)
    ?unhealthy_threshold_count:(unhealthy_threshold_count_ : health_check_threshold_count option)
    ?matcher:(matcher_ : matcher option) ?target_type:(target_type_ : target_type_enum option)
    ?tags:(tags_ : tag_list option)
    ?ip_address_type:(ip_address_type_ : target_group_ip_address_type_enum option)
    ?target_control_port:(target_control_port_ : target_control_port option)
    ~name:(name_ : target_group_name) () =
  ({
     name = name_;
     protocol = protocol_;
     protocol_version = protocol_version_;
     port = port_;
     vpc_id = vpc_id_;
     health_check_protocol = health_check_protocol_;
     health_check_port = health_check_port_;
     health_check_enabled = health_check_enabled_;
     health_check_path = health_check_path_;
     health_check_interval_seconds = health_check_interval_seconds_;
     health_check_timeout_seconds = health_check_timeout_seconds_;
     healthy_threshold_count = healthy_threshold_count_;
     unhealthy_threshold_count = unhealthy_threshold_count_;
     matcher = matcher_;
     target_type = target_type_;
     tags = tags_;
     ip_address_type = ip_address_type_;
     target_control_port = target_control_port_;
   }
    : create_target_group_input)

let make_trust_store ?name:(name_ : trust_store_name option)
    ?trust_store_arn:(trust_store_arn_ : trust_store_arn option)
    ?status:(status_ : trust_store_status option)
    ?number_of_ca_certificates:(number_of_ca_certificates_ : number_of_ca_certificates option)
    ?total_revoked_entries:(total_revoked_entries_ : total_revoked_entries option) () =
  ({
     name = name_;
     trust_store_arn = trust_store_arn_;
     status = status_;
     number_of_ca_certificates = number_of_ca_certificates_;
     total_revoked_entries = total_revoked_entries_;
   }
    : trust_store)

let make_create_trust_store_output ?trust_stores:(trust_stores_ : trust_stores option) () =
  ({ trust_stores = trust_stores_ } : create_trust_store_output)

let make_create_trust_store_input
    ?ca_certificates_bundle_s3_object_version:
      (ca_certificates_bundle_s3_object_version_ : s3_object_version option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : trust_store_name)
    ~ca_certificates_bundle_s3_bucket:(ca_certificates_bundle_s3_bucket_ : s3_bucket)
    ~ca_certificates_bundle_s3_key:(ca_certificates_bundle_s3_key_ : s3_key) () =
  ({
     name = name_;
     ca_certificates_bundle_s3_bucket = ca_certificates_bundle_s3_bucket_;
     ca_certificates_bundle_s3_key = ca_certificates_bundle_s3_key_;
     ca_certificates_bundle_s3_object_version = ca_certificates_bundle_s3_object_version_;
     tags = tags_;
   }
    : create_trust_store_input)

let make_delete_listener_output () = (() : unit)

let make_delete_listener_input ~listener_arn:(listener_arn_ : listener_arn) () =
  ({ listener_arn = listener_arn_ } : delete_listener_input)

let make_delete_load_balancer_output () = (() : unit)

let make_delete_load_balancer_input ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn) () =
  ({ load_balancer_arn = load_balancer_arn_ } : delete_load_balancer_input)

let make_delete_rule_output () = (() : unit)

let make_delete_rule_input ~rule_arn:(rule_arn_ : rule_arn) () =
  ({ rule_arn = rule_arn_ } : delete_rule_input)

let make_delete_shared_trust_store_association_output () = (() : unit)

let make_delete_shared_trust_store_association_input
    ~trust_store_arn:(trust_store_arn_ : trust_store_arn)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ trust_store_arn = trust_store_arn_; resource_arn = resource_arn_ }
    : delete_shared_trust_store_association_input)

let make_delete_target_group_output () = (() : unit)

let make_delete_target_group_input ~target_group_arn:(target_group_arn_ : target_group_arn) () =
  ({ target_group_arn = target_group_arn_ } : delete_target_group_input)

let make_delete_trust_store_output () = (() : unit)

let make_delete_trust_store_input ~trust_store_arn:(trust_store_arn_ : trust_store_arn) () =
  ({ trust_store_arn = trust_store_arn_ } : delete_trust_store_input)

let make_deregister_targets_output () = (() : unit)

let make_target_description ?port:(port_ : port option)
    ?availability_zone:(availability_zone_ : zone_name option)
    ?quic_server_id:(quic_server_id_ : quic_server_id option) ~id:(id_ : target_id) () =
  ({
     id = id_;
     port = port_;
     availability_zone = availability_zone_;
     quic_server_id = quic_server_id_;
   }
    : target_description)

let make_deregister_targets_input ~target_group_arn:(target_group_arn_ : target_group_arn)
    ~targets:(targets_ : target_descriptions) () =
  ({ target_group_arn = target_group_arn_; targets = targets_ } : deregister_targets_input)

let make_limit ?name:(name_ : name option) ?max:(max_ : max option) () =
  ({ name = name_; max = max_ } : limit)

let make_describe_account_limits_output ?limits:(limits_ : limits option)
    ?next_marker:(next_marker_ : marker option) () =
  ({ limits = limits_; next_marker = next_marker_ } : describe_account_limits_output)

let make_describe_account_limits_input ?marker:(marker_ : marker option)
    ?page_size:(page_size_ : page_size option) () =
  ({ marker = marker_; page_size = page_size_ } : describe_account_limits_input)

let make_zonal_capacity_reservation_state ?state:(state_ : capacity_reservation_status option)
    ?availability_zone:(availability_zone_ : zone_name option)
    ?effective_capacity_units:(effective_capacity_units_ : capacity_units_double option) () =
  ({
     state = state_;
     availability_zone = availability_zone_;
     effective_capacity_units = effective_capacity_units_;
   }
    : zonal_capacity_reservation_state)

let make_minimum_load_balancer_capacity ?capacity_units:(capacity_units_ : capacity_units option) ()
    =
  ({ capacity_units = capacity_units_ } : minimum_load_balancer_capacity)

let make_describe_capacity_reservation_output
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?decrease_requests_remaining:(decrease_requests_remaining_ : decrease_requests_remaining option)
    ?minimum_load_balancer_capacity:
      (minimum_load_balancer_capacity_ : minimum_load_balancer_capacity option)
    ?capacity_reservation_state:
      (capacity_reservation_state_ : zonal_capacity_reservation_states option) () =
  ({
     last_modified_time = last_modified_time_;
     decrease_requests_remaining = decrease_requests_remaining_;
     minimum_load_balancer_capacity = minimum_load_balancer_capacity_;
     capacity_reservation_state = capacity_reservation_state_;
   }
    : describe_capacity_reservation_output)

let make_describe_capacity_reservation_input
    ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn) () =
  ({ load_balancer_arn = load_balancer_arn_ } : describe_capacity_reservation_input)

let make_listener_attribute ?key:(key_ : listener_attribute_key option)
    ?value:(value_ : listener_attribute_value option) () =
  ({ key = key_; value = value_ } : listener_attribute)

let make_describe_listener_attributes_output ?attributes:(attributes_ : listener_attributes option)
    () =
  ({ attributes = attributes_ } : describe_listener_attributes_output)

let make_describe_listener_attributes_input ~listener_arn:(listener_arn_ : listener_arn) () =
  ({ listener_arn = listener_arn_ } : describe_listener_attributes_input)

let make_describe_listener_certificates_output
    ?certificates:(certificates_ : certificate_list option)
    ?next_marker:(next_marker_ : marker option) () =
  ({ certificates = certificates_; next_marker = next_marker_ }
    : describe_listener_certificates_output)

let make_describe_listener_certificates_input ?marker:(marker_ : marker option)
    ?page_size:(page_size_ : page_size option) ~listener_arn:(listener_arn_ : listener_arn) () =
  ({ listener_arn = listener_arn_; marker = marker_; page_size = page_size_ }
    : describe_listener_certificates_input)

let make_describe_listeners_output ?listeners:(listeners_ : listeners option)
    ?next_marker:(next_marker_ : marker option) () =
  ({ listeners = listeners_; next_marker = next_marker_ } : describe_listeners_output)

let make_describe_listeners_input ?load_balancer_arn:(load_balancer_arn_ : load_balancer_arn option)
    ?listener_arns:(listener_arns_ : listener_arns option) ?marker:(marker_ : marker option)
    ?page_size:(page_size_ : page_size option) () =
  ({
     load_balancer_arn = load_balancer_arn_;
     listener_arns = listener_arns_;
     marker = marker_;
     page_size = page_size_;
   }
    : describe_listeners_input)

let make_load_balancer_attribute ?key:(key_ : load_balancer_attribute_key option)
    ?value:(value_ : load_balancer_attribute_value option) () =
  ({ key = key_; value = value_ } : load_balancer_attribute)

let make_describe_load_balancer_attributes_output
    ?attributes:(attributes_ : load_balancer_attributes option) () =
  ({ attributes = attributes_ } : describe_load_balancer_attributes_output)

let make_describe_load_balancer_attributes_input
    ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn) () =
  ({ load_balancer_arn = load_balancer_arn_ } : describe_load_balancer_attributes_input)

let make_describe_load_balancers_output ?load_balancers:(load_balancers_ : load_balancers option)
    ?next_marker:(next_marker_ : marker option) () =
  ({ load_balancers = load_balancers_; next_marker = next_marker_ }
    : describe_load_balancers_output)

let make_describe_load_balancers_input
    ?load_balancer_arns:(load_balancer_arns_ : load_balancer_arns option)
    ?names:(names_ : load_balancer_names option) ?marker:(marker_ : marker option)
    ?page_size:(page_size_ : page_size option) () =
  ({
     load_balancer_arns = load_balancer_arns_;
     names = names_;
     marker = marker_;
     page_size = page_size_;
   }
    : describe_load_balancers_input)

let make_describe_rules_output ?rules:(rules_ : rules option)
    ?next_marker:(next_marker_ : marker option) () =
  ({ rules = rules_; next_marker = next_marker_ } : describe_rules_output)

let make_describe_rules_input ?listener_arn:(listener_arn_ : listener_arn option)
    ?rule_arns:(rule_arns_ : rule_arns option) ?marker:(marker_ : marker option)
    ?page_size:(page_size_ : page_size option) () =
  ({
     listener_arn = listener_arn_;
     rule_arns = rule_arns_;
     marker = marker_;
     page_size = page_size_;
   }
    : describe_rules_input)

let make_ssl_policy ?ssl_protocols:(ssl_protocols_ : ssl_protocols option)
    ?ciphers:(ciphers_ : ciphers option) ?name:(name_ : ssl_policy_name option)
    ?supported_load_balancer_types:(supported_load_balancer_types_ : list_of_string option) () =
  ({
     ssl_protocols = ssl_protocols_;
     ciphers = ciphers_;
     name = name_;
     supported_load_balancer_types = supported_load_balancer_types_;
   }
    : ssl_policy)

let make_describe_ssl_policies_output ?ssl_policies:(ssl_policies_ : ssl_policies option)
    ?next_marker:(next_marker_ : marker option) () =
  ({ ssl_policies = ssl_policies_; next_marker = next_marker_ } : describe_ssl_policies_output)

let make_describe_ssl_policies_input ?names:(names_ : ssl_policy_names option)
    ?marker:(marker_ : marker option) ?page_size:(page_size_ : page_size option)
    ?load_balancer_type:(load_balancer_type_ : load_balancer_type_enum option) () =
  ({
     names = names_;
     marker = marker_;
     page_size = page_size_;
     load_balancer_type = load_balancer_type_;
   }
    : describe_ssl_policies_input)

let make_tag_description ?resource_arn:(resource_arn_ : resource_arn option)
    ?tags:(tags_ : tag_list option) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_description)

let make_describe_tags_output ?tag_descriptions:(tag_descriptions_ : tag_descriptions option) () =
  ({ tag_descriptions = tag_descriptions_ } : describe_tags_output)

let make_describe_tags_input ~resource_arns:(resource_arns_ : resource_arns) () =
  ({ resource_arns = resource_arns_ } : describe_tags_input)

let make_target_group_attribute ?key:(key_ : target_group_attribute_key option)
    ?value:(value_ : target_group_attribute_value option) () =
  ({ key = key_; value = value_ } : target_group_attribute)

let make_describe_target_group_attributes_output
    ?attributes:(attributes_ : target_group_attributes option) () =
  ({ attributes = attributes_ } : describe_target_group_attributes_output)

let make_describe_target_group_attributes_input
    ~target_group_arn:(target_group_arn_ : target_group_arn) () =
  ({ target_group_arn = target_group_arn_ } : describe_target_group_attributes_input)

let make_describe_target_groups_output ?target_groups:(target_groups_ : target_groups option)
    ?next_marker:(next_marker_ : marker option) () =
  ({ target_groups = target_groups_; next_marker = next_marker_ } : describe_target_groups_output)

let make_describe_target_groups_input
    ?load_balancer_arn:(load_balancer_arn_ : load_balancer_arn option)
    ?target_group_arns:(target_group_arns_ : target_group_arns option)
    ?names:(names_ : target_group_names option) ?marker:(marker_ : marker option)
    ?page_size:(page_size_ : page_size option) () =
  ({
     load_balancer_arn = load_balancer_arn_;
     target_group_arns = target_group_arns_;
     names = names_;
     marker = marker_;
     page_size = page_size_;
   }
    : describe_target_groups_input)

let make_target_health ?state:(state_ : target_health_state_enum option)
    ?reason:(reason_ : target_health_reason_enum option)
    ?description:(description_ : description option) () =
  ({ state = state_; reason = reason_; description = description_ } : target_health)

let make_target_health_description ?target:(target_ : target_description option)
    ?health_check_port:(health_check_port_ : health_check_port option)
    ?target_health:(target_health_ : target_health option)
    ?anomaly_detection:(anomaly_detection_ : anomaly_detection option)
    ?administrative_override:(administrative_override_ : administrative_override option) () =
  ({
     target = target_;
     health_check_port = health_check_port_;
     target_health = target_health_;
     anomaly_detection = anomaly_detection_;
     administrative_override = administrative_override_;
   }
    : target_health_description)

let make_describe_target_health_output
    ?target_health_descriptions:(target_health_descriptions_ : target_health_descriptions option) ()
    =
  ({ target_health_descriptions = target_health_descriptions_ } : describe_target_health_output)

let make_describe_target_health_input ?targets:(targets_ : target_descriptions option)
    ?include_:(include__ : list_of_describe_target_health_include_options option)
    ~target_group_arn:(target_group_arn_ : target_group_arn) () =
  ({ target_group_arn = target_group_arn_; targets = targets_; include_ = include__ }
    : describe_target_health_input)

let make_trust_store_association
    ?resource_arn:(resource_arn_ : trust_store_association_resource_arn option) () =
  ({ resource_arn = resource_arn_ } : trust_store_association)

let make_describe_trust_store_associations_output
    ?trust_store_associations:(trust_store_associations_ : trust_store_associations option)
    ?next_marker:(next_marker_ : marker option) () =
  ({ trust_store_associations = trust_store_associations_; next_marker = next_marker_ }
    : describe_trust_store_associations_output)

let make_describe_trust_store_associations_input ?marker:(marker_ : marker option)
    ?page_size:(page_size_ : page_size option) ~trust_store_arn:(trust_store_arn_ : trust_store_arn)
    () =
  ({ trust_store_arn = trust_store_arn_; marker = marker_; page_size = page_size_ }
    : describe_trust_store_associations_input)

let make_describe_trust_store_revocation
    ?trust_store_arn:(trust_store_arn_ : trust_store_arn option)
    ?revocation_id:(revocation_id_ : revocation_id option)
    ?revocation_type:(revocation_type_ : revocation_type option)
    ?number_of_revoked_entries:(number_of_revoked_entries_ : number_of_revoked_entries option) () =
  ({
     trust_store_arn = trust_store_arn_;
     revocation_id = revocation_id_;
     revocation_type = revocation_type_;
     number_of_revoked_entries = number_of_revoked_entries_;
   }
    : describe_trust_store_revocation)

let make_describe_trust_store_revocations_output
    ?trust_store_revocations:
      (trust_store_revocations_ : describe_trust_store_revocation_response option)
    ?next_marker:(next_marker_ : marker option) () =
  ({ trust_store_revocations = trust_store_revocations_; next_marker = next_marker_ }
    : describe_trust_store_revocations_output)

let make_describe_trust_store_revocations_input
    ?revocation_ids:(revocation_ids_ : revocation_ids option) ?marker:(marker_ : marker option)
    ?page_size:(page_size_ : page_size option) ~trust_store_arn:(trust_store_arn_ : trust_store_arn)
    () =
  ({
     trust_store_arn = trust_store_arn_;
     revocation_ids = revocation_ids_;
     marker = marker_;
     page_size = page_size_;
   }
    : describe_trust_store_revocations_input)

let make_describe_trust_stores_output ?trust_stores:(trust_stores_ : trust_stores option)
    ?next_marker:(next_marker_ : marker option) () =
  ({ trust_stores = trust_stores_; next_marker = next_marker_ } : describe_trust_stores_output)

let make_describe_trust_stores_input ?trust_store_arns:(trust_store_arns_ : trust_store_arns option)
    ?names:(names_ : trust_store_names option) ?marker:(marker_ : marker option)
    ?page_size:(page_size_ : page_size option) () =
  ({
     trust_store_arns = trust_store_arns_;
     names = names_;
     marker = marker_;
     page_size = page_size_;
   }
    : describe_trust_stores_input)

let make_set_subnets_output ?availability_zones:(availability_zones_ : availability_zones option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?enable_prefix_for_ipv6_source_nat:
      (enable_prefix_for_ipv6_source_nat_ : enable_prefix_for_ipv6_source_nat_enum option) () =
  ({
     availability_zones = availability_zones_;
     ip_address_type = ip_address_type_;
     enable_prefix_for_ipv6_source_nat = enable_prefix_for_ipv6_source_nat_;
   }
    : set_subnets_output)

let make_set_subnets_input ?subnets:(subnets_ : subnets option)
    ?subnet_mappings:(subnet_mappings_ : subnet_mappings option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?enable_prefix_for_ipv6_source_nat:
      (enable_prefix_for_ipv6_source_nat_ : enable_prefix_for_ipv6_source_nat_enum option)
    ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn) () =
  ({
     load_balancer_arn = load_balancer_arn_;
     subnets = subnets_;
     subnet_mappings = subnet_mappings_;
     ip_address_type = ip_address_type_;
     enable_prefix_for_ipv6_source_nat = enable_prefix_for_ipv6_source_nat_;
   }
    : set_subnets_input)

let make_set_security_groups_output
    ?security_group_ids:(security_group_ids_ : security_groups option)
    ?enforce_security_group_inbound_rules_on_private_link_traffic:
      (enforce_security_group_inbound_rules_on_private_link_traffic_ :
         enforce_security_group_inbound_rules_on_private_link_traffic_enum option) () =
  ({
     security_group_ids = security_group_ids_;
     enforce_security_group_inbound_rules_on_private_link_traffic =
       enforce_security_group_inbound_rules_on_private_link_traffic_;
   }
    : set_security_groups_output)

let make_set_security_groups_input
    ?enforce_security_group_inbound_rules_on_private_link_traffic:
      (enforce_security_group_inbound_rules_on_private_link_traffic_ :
         enforce_security_group_inbound_rules_on_private_link_traffic_enum option)
    ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn)
    ~security_groups:(security_groups_ : security_groups) () =
  ({
     load_balancer_arn = load_balancer_arn_;
     security_groups = security_groups_;
     enforce_security_group_inbound_rules_on_private_link_traffic =
       enforce_security_group_inbound_rules_on_private_link_traffic_;
   }
    : set_security_groups_input)

let make_set_rule_priorities_output ?rules:(rules_ : rules option) () =
  ({ rules = rules_ } : set_rule_priorities_output)

let make_rule_priority_pair ?rule_arn:(rule_arn_ : rule_arn option)
    ?priority:(priority_ : rule_priority option) () =
  ({ rule_arn = rule_arn_; priority = priority_ } : rule_priority_pair)

let make_set_rule_priorities_input ~rule_priorities:(rule_priorities_ : rule_priority_list) () =
  ({ rule_priorities = rule_priorities_ } : set_rule_priorities_input)

let make_set_ip_address_type_output ?ip_address_type:(ip_address_type_ : ip_address_type option) ()
    =
  ({ ip_address_type = ip_address_type_ } : set_ip_address_type_output)

let make_set_ip_address_type_input ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn)
    ~ip_address_type:(ip_address_type_ : ip_address_type) () =
  ({ load_balancer_arn = load_balancer_arn_; ip_address_type = ip_address_type_ }
    : set_ip_address_type_input)

let make_remove_trust_store_revocations_output () = (() : unit)

let make_remove_trust_store_revocations_input ~trust_store_arn:(trust_store_arn_ : trust_store_arn)
    ~revocation_ids:(revocation_ids_ : revocation_ids) () =
  ({ trust_store_arn = trust_store_arn_; revocation_ids = revocation_ids_ }
    : remove_trust_store_revocations_input)

let make_remove_tags_output () = (() : unit)

let make_remove_tags_input ~resource_arns:(resource_arns_ : resource_arns)
    ~tag_keys:(tag_keys_ : tag_keys) () =
  ({ resource_arns = resource_arns_; tag_keys = tag_keys_ } : remove_tags_input)

let make_remove_listener_certificates_output () = (() : unit)

let make_remove_listener_certificates_input ~listener_arn:(listener_arn_ : listener_arn)
    ~certificates:(certificates_ : certificate_list) () =
  ({ listener_arn = listener_arn_; certificates = certificates_ }
    : remove_listener_certificates_input)

let make_register_targets_output () = (() : unit)

let make_register_targets_input ~target_group_arn:(target_group_arn_ : target_group_arn)
    ~targets:(targets_ : target_descriptions) () =
  ({ target_group_arn = target_group_arn_; targets = targets_ } : register_targets_input)

let make_modify_trust_store_output ?trust_stores:(trust_stores_ : trust_stores option) () =
  ({ trust_stores = trust_stores_ } : modify_trust_store_output)

let make_modify_trust_store_input
    ?ca_certificates_bundle_s3_object_version:
      (ca_certificates_bundle_s3_object_version_ : s3_object_version option)
    ~trust_store_arn:(trust_store_arn_ : trust_store_arn)
    ~ca_certificates_bundle_s3_bucket:(ca_certificates_bundle_s3_bucket_ : s3_bucket)
    ~ca_certificates_bundle_s3_key:(ca_certificates_bundle_s3_key_ : s3_key) () =
  ({
     trust_store_arn = trust_store_arn_;
     ca_certificates_bundle_s3_bucket = ca_certificates_bundle_s3_bucket_;
     ca_certificates_bundle_s3_key = ca_certificates_bundle_s3_key_;
     ca_certificates_bundle_s3_object_version = ca_certificates_bundle_s3_object_version_;
   }
    : modify_trust_store_input)

let make_modify_target_group_attributes_output
    ?attributes:(attributes_ : target_group_attributes option) () =
  ({ attributes = attributes_ } : modify_target_group_attributes_output)

let make_modify_target_group_attributes_input
    ~target_group_arn:(target_group_arn_ : target_group_arn)
    ~attributes:(attributes_ : target_group_attributes) () =
  ({ target_group_arn = target_group_arn_; attributes = attributes_ }
    : modify_target_group_attributes_input)

let make_modify_target_group_output ?target_groups:(target_groups_ : target_groups option) () =
  ({ target_groups = target_groups_ } : modify_target_group_output)

let make_modify_target_group_input
    ?health_check_protocol:(health_check_protocol_ : protocol_enum option)
    ?health_check_port:(health_check_port_ : health_check_port option)
    ?health_check_path:(health_check_path_ : path option)
    ?health_check_enabled:(health_check_enabled_ : health_check_enabled option)
    ?health_check_interval_seconds:
      (health_check_interval_seconds_ : health_check_interval_seconds option)
    ?health_check_timeout_seconds:
      (health_check_timeout_seconds_ : health_check_timeout_seconds option)
    ?healthy_threshold_count:(healthy_threshold_count_ : health_check_threshold_count option)
    ?unhealthy_threshold_count:(unhealthy_threshold_count_ : health_check_threshold_count option)
    ?matcher:(matcher_ : matcher option) ~target_group_arn:(target_group_arn_ : target_group_arn) ()
    =
  ({
     target_group_arn = target_group_arn_;
     health_check_protocol = health_check_protocol_;
     health_check_port = health_check_port_;
     health_check_path = health_check_path_;
     health_check_enabled = health_check_enabled_;
     health_check_interval_seconds = health_check_interval_seconds_;
     health_check_timeout_seconds = health_check_timeout_seconds_;
     healthy_threshold_count = healthy_threshold_count_;
     unhealthy_threshold_count = unhealthy_threshold_count_;
     matcher = matcher_;
   }
    : modify_target_group_input)

let make_modify_rule_output ?rules:(rules_ : rules option) () =
  ({ rules = rules_ } : modify_rule_output)

let make_modify_rule_input ?conditions:(conditions_ : rule_condition_list option)
    ?actions:(actions_ : actions option) ?transforms:(transforms_ : rule_transform_list option)
    ?reset_transforms:(reset_transforms_ : reset_transforms option) ~rule_arn:(rule_arn_ : rule_arn)
    () =
  ({
     rule_arn = rule_arn_;
     conditions = conditions_;
     actions = actions_;
     transforms = transforms_;
     reset_transforms = reset_transforms_;
   }
    : modify_rule_input)

let make_modify_load_balancer_attributes_output
    ?attributes:(attributes_ : load_balancer_attributes option) () =
  ({ attributes = attributes_ } : modify_load_balancer_attributes_output)

let make_modify_load_balancer_attributes_input
    ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn)
    ~attributes:(attributes_ : load_balancer_attributes) () =
  ({ load_balancer_arn = load_balancer_arn_; attributes = attributes_ }
    : modify_load_balancer_attributes_input)

let make_modify_listener_attributes_output ?attributes:(attributes_ : listener_attributes option) ()
    =
  ({ attributes = attributes_ } : modify_listener_attributes_output)

let make_modify_listener_attributes_input ~listener_arn:(listener_arn_ : listener_arn)
    ~attributes:(attributes_ : listener_attributes) () =
  ({ listener_arn = listener_arn_; attributes = attributes_ } : modify_listener_attributes_input)

let make_modify_listener_output ?listeners:(listeners_ : listeners option) () =
  ({ listeners = listeners_ } : modify_listener_output)

let make_modify_listener_input ?port:(port_ : port option)
    ?protocol:(protocol_ : protocol_enum option) ?ssl_policy:(ssl_policy_ : ssl_policy_name option)
    ?certificates:(certificates_ : certificate_list option)
    ?default_actions:(default_actions_ : actions option)
    ?alpn_policy:(alpn_policy_ : alpn_policy_name option)
    ?mutual_authentication:(mutual_authentication_ : mutual_authentication_attributes option)
    ~listener_arn:(listener_arn_ : listener_arn) () =
  ({
     listener_arn = listener_arn_;
     port = port_;
     protocol = protocol_;
     ssl_policy = ssl_policy_;
     certificates = certificates_;
     default_actions = default_actions_;
     alpn_policy = alpn_policy_;
     mutual_authentication = mutual_authentication_;
   }
    : modify_listener_input)

let make_modify_ip_pools_output ?ipam_pools:(ipam_pools_ : ipam_pools option) () =
  ({ ipam_pools = ipam_pools_ } : modify_ip_pools_output)

let make_modify_ip_pools_input ?ipam_pools:(ipam_pools_ : ipam_pools option)
    ?remove_ipam_pools:(remove_ipam_pools_ : remove_ipam_pools option)
    ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn) () =
  ({
     load_balancer_arn = load_balancer_arn_;
     ipam_pools = ipam_pools_;
     remove_ipam_pools = remove_ipam_pools_;
   }
    : modify_ip_pools_input)

let make_modify_capacity_reservation_output
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?decrease_requests_remaining:(decrease_requests_remaining_ : decrease_requests_remaining option)
    ?minimum_load_balancer_capacity:
      (minimum_load_balancer_capacity_ : minimum_load_balancer_capacity option)
    ?capacity_reservation_state:
      (capacity_reservation_state_ : zonal_capacity_reservation_states option) () =
  ({
     last_modified_time = last_modified_time_;
     decrease_requests_remaining = decrease_requests_remaining_;
     minimum_load_balancer_capacity = minimum_load_balancer_capacity_;
     capacity_reservation_state = capacity_reservation_state_;
   }
    : modify_capacity_reservation_output)

let make_modify_capacity_reservation_input
    ?minimum_load_balancer_capacity:
      (minimum_load_balancer_capacity_ : minimum_load_balancer_capacity option)
    ?reset_capacity_reservation:(reset_capacity_reservation_ : reset_capacity_reservation option)
    ~load_balancer_arn:(load_balancer_arn_ : load_balancer_arn) () =
  ({
     load_balancer_arn = load_balancer_arn_;
     minimum_load_balancer_capacity = minimum_load_balancer_capacity_;
     reset_capacity_reservation = reset_capacity_reservation_;
   }
    : modify_capacity_reservation_input)

let make_get_trust_store_revocation_content_output ?location:(location_ : location option) () =
  ({ location = location_ } : get_trust_store_revocation_content_output)

let make_get_trust_store_revocation_content_input
    ~trust_store_arn:(trust_store_arn_ : trust_store_arn)
    ~revocation_id:(revocation_id_ : revocation_id) () =
  ({ trust_store_arn = trust_store_arn_; revocation_id = revocation_id_ }
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
