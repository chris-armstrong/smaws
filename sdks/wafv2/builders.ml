open Types

let make_api_key_summary ?token_domains:(token_domains_ : token_domains option)
    ?api_key:(api_key_ : api_key option)
    ?creation_timestamp:(creation_timestamp_ : timestamp option)
    ?version:(version_ : api_key_version option) () =
  ({
     token_domains = token_domains_;
     api_key = api_key_;
     creation_timestamp = creation_timestamp_;
     version = version_;
   }
    : api_key_summary)

let make_response_inspection_json ~identifier:(identifier_ : field_identifier)
    ~success_values:(success_values_ : response_inspection_json_success_values)
    ~failure_values:(failure_values_ : response_inspection_json_failure_values) () =
  ({ identifier = identifier_; success_values = success_values_; failure_values = failure_values_ }
    : response_inspection_json)

let make_response_inspection_body_contains
    ~success_strings:(success_strings_ : response_inspection_body_contains_success_strings)
    ~failure_strings:(failure_strings_ : response_inspection_body_contains_failure_strings) () =
  ({ success_strings = success_strings_; failure_strings = failure_strings_ }
    : response_inspection_body_contains)

let make_response_inspection_header ~name:(name_ : response_inspection_header_name)
    ~success_values:(success_values_ : response_inspection_header_success_values)
    ~failure_values:(failure_values_ : response_inspection_header_failure_values) () =
  ({ name = name_; success_values = success_values_; failure_values = failure_values_ }
    : response_inspection_header)

let make_response_inspection_status_code
    ~success_codes:(success_codes_ : response_inspection_status_code_success_codes)
    ~failure_codes:(failure_codes_ : response_inspection_status_code_failure_codes) () =
  ({ success_codes = success_codes_; failure_codes = failure_codes_ }
    : response_inspection_status_code)

let make_response_inspection ?status_code:(status_code_ : response_inspection_status_code option)
    ?header:(header_ : response_inspection_header option)
    ?body_contains:(body_contains_ : response_inspection_body_contains option)
    ?json:(json_ : response_inspection_json option) () =
  ({ status_code = status_code_; header = header_; body_contains = body_contains_; json = json_ }
    : response_inspection)

let make_address_field ~identifier:(identifier_ : field_identifier) () =
  ({ identifier = identifier_ } : address_field)

let make_phone_number_field ~identifier:(identifier_ : field_identifier) () =
  ({ identifier = identifier_ } : phone_number_field)

let make_email_field ~identifier:(identifier_ : field_identifier) () =
  ({ identifier = identifier_ } : email_field)

let make_password_field ~identifier:(identifier_ : field_identifier) () =
  ({ identifier = identifier_ } : password_field)

let make_username_field ~identifier:(identifier_ : field_identifier) () =
  ({ identifier = identifier_ } : username_field)

let make_request_inspection_acf_p ?username_field:(username_field_ : username_field option)
    ?password_field:(password_field_ : password_field option)
    ?email_field:(email_field_ : email_field option)
    ?phone_number_fields:(phone_number_fields_ : phone_number_fields option)
    ?address_fields:(address_fields_ : address_fields option)
    ~payload_type:(payload_type_ : payload_type) () =
  ({
     payload_type = payload_type_;
     username_field = username_field_;
     password_field = password_field_;
     email_field = email_field_;
     phone_number_fields = phone_number_fields_;
     address_fields = address_fields_;
   }
    : request_inspection_acf_p)

let make_aws_managed_rules_acfp_rule_set
    ?response_inspection:(response_inspection_ : response_inspection option)
    ?enable_regex_in_path:(enable_regex_in_path_ : boolean_ option)
    ~creation_path:(creation_path_ : creation_path_string)
    ~registration_page_path:(registration_page_path_ : registration_page_path_string)
    ~request_inspection:(request_inspection_ : request_inspection_acf_p) () =
  ({
     creation_path = creation_path_;
     registration_page_path = registration_page_path_;
     request_inspection = request_inspection_;
     response_inspection = response_inspection_;
     enable_regex_in_path = enable_regex_in_path_;
   }
    : aws_managed_rules_acfp_rule_set)

let make_request_inspection ~payload_type:(payload_type_ : payload_type)
    ~username_field:(username_field_ : username_field)
    ~password_field:(password_field_ : password_field) () =
  ({
     payload_type = payload_type_;
     username_field = username_field_;
     password_field = password_field_;
   }
    : request_inspection)

let make_aws_managed_rules_atp_rule_set
    ?request_inspection:(request_inspection_ : request_inspection option)
    ?response_inspection:(response_inspection_ : response_inspection option)
    ?enable_regex_in_path:(enable_regex_in_path_ : boolean_ option)
    ~login_path:(login_path_ : string_) () =
  ({
     login_path = login_path_;
     request_inspection = request_inspection_;
     response_inspection = response_inspection_;
     enable_regex_in_path = enable_regex_in_path_;
   }
    : aws_managed_rules_atp_rule_set)

let make_regex ?regex_string:(regex_string_ : regex_pattern_string option) () =
  ({ regex_string = regex_string_ } : regex)

let make_client_side_action ?sensitivity:(sensitivity_ : sensitivity_to_act option)
    ?exempt_uri_regular_expressions:
      (exempt_uri_regular_expressions_ : regular_expression_list option)
    ~usage_of_action:(usage_of_action_ : usage_of_action) () =
  ({
     usage_of_action = usage_of_action_;
     sensitivity = sensitivity_;
     exempt_uri_regular_expressions = exempt_uri_regular_expressions_;
   }
    : client_side_action)

let make_client_side_action_config ~challenge:(challenge_ : client_side_action) () =
  ({ challenge = challenge_ } : client_side_action_config)

let make_aws_managed_rules_anti_d_do_s_rule_set
    ?sensitivity_to_block:(sensitivity_to_block_ : sensitivity_to_act option)
    ~client_side_action_config:(client_side_action_config_ : client_side_action_config) () =
  ({
     client_side_action_config = client_side_action_config_;
     sensitivity_to_block = sensitivity_to_block_;
   }
    : aws_managed_rules_anti_d_do_s_rule_set)

let make_aws_managed_rules_bot_control_rule_set
    ?enable_machine_learning:(enable_machine_learning_ : enable_machine_learning option)
    ~inspection_level:(inspection_level_ : inspection_level) () =
  ({ inspection_level = inspection_level_; enable_machine_learning = enable_machine_learning_ }
    : aws_managed_rules_bot_control_rule_set)

let make_disallowed_feature ?feature:(feature_ : pricing_plan_feature_name option)
    ?required_pricing_plan:(required_pricing_plan_ : required_pricing_plan_name option) () =
  ({ feature = feature_; required_pricing_plan = required_pricing_plan_ } : disallowed_feature)

let make_update_web_acl_response ?next_lock_token:(next_lock_token_ : lock_token option) () =
  ({ next_lock_token = next_lock_token_ } : update_web_acl_response)

let make_price ~amount:(amount_ : price_amount) ~currency:(currency_ : crypto_currency) () =
  ({ amount = amount_; currency = currency_ } : price)

let make_payment_network ~chain:(chain_ : blockchain_chain)
    ~wallet_address:(wallet_address_ : wallet_address) ~prices:(prices_ : prices) () =
  ({ chain = chain_; wallet_address = wallet_address_; prices = prices_ } : payment_network)

let make_crypto_config ~payment_networks:(payment_networks_ : payment_networks) () =
  ({ payment_networks = payment_networks_ } : crypto_config)

let make_monetization_config ?crypto_config:(crypto_config_ : crypto_config option)
    ?currency_mode:(currency_mode_ : currency_mode option) () =
  ({ crypto_config = crypto_config_; currency_mode = currency_mode_ } : monetization_config)

let make_application_attribute ?name:(name_ : attribute_name option)
    ?values:(values_ : attribute_values option) () =
  ({ name = name_; values = values_ } : application_attribute)

let make_application_config ?attributes:(attributes_ : application_attributes option) () =
  ({ attributes = attributes_ } : application_config)

let make_on_source_d_do_s_protection_config
    ~alb_low_reputation_mode:(alb_low_reputation_mode_ : low_reputation_mode) () =
  ({ alb_low_reputation_mode = alb_low_reputation_mode_ } : on_source_d_do_s_protection_config)

let make_request_body_associated_resource_type_config
    ~default_size_inspection_limit:(default_size_inspection_limit_ : size_inspection_limit) () =
  ({ default_size_inspection_limit = default_size_inspection_limit_ }
    : request_body_associated_resource_type_config)

let make_association_config ?request_body:(request_body_ : request_body option) () =
  ({ request_body = request_body_ } : association_config)

let make_immunity_time_property ~immunity_time:(immunity_time_ : time_window_second) () =
  ({ immunity_time = immunity_time_ } : immunity_time_property)

let make_challenge_config
    ?immunity_time_property:(immunity_time_property_ : immunity_time_property option) () =
  ({ immunity_time_property = immunity_time_property_ } : challenge_config)

let make_captcha_config
    ?immunity_time_property:(immunity_time_property_ : immunity_time_property option) () =
  ({ immunity_time_property = immunity_time_property_ } : captcha_config)

let make_custom_response_body ~content_type:(content_type_ : response_content_type)
    ~content:(content_ : response_content) () =
  ({ content_type = content_type_; content = content_ } : custom_response_body)

let make_field_to_protect ?field_keys:(field_keys_ : field_to_protect_keys option)
    ~field_type:(field_type_ : field_to_protect_type) () =
  ({ field_type = field_type_; field_keys = field_keys_ } : field_to_protect)

let make_data_protection ?exclude_rule_match_details:(exclude_rule_match_details_ : boolean_ option)
    ?exclude_rate_based_details:(exclude_rate_based_details_ : boolean_ option)
    ~field:(field_ : field_to_protect) ~action:(action_ : data_protection_action) () =
  ({
     field = field_;
     action = action_;
     exclude_rule_match_details = exclude_rule_match_details_;
     exclude_rate_based_details = exclude_rate_based_details_;
   }
    : data_protection)

let make_data_protection_config ~data_protections:(data_protections_ : data_protections) () =
  ({ data_protections = data_protections_ } : data_protection_config)

let make_visibility_config ~sampled_requests_enabled:(sampled_requests_enabled_ : boolean_)
    ~cloud_watch_metrics_enabled:(cloud_watch_metrics_enabled_ : boolean_)
    ~metric_name:(metric_name_ : metric_name) () =
  ({
     sampled_requests_enabled = sampled_requests_enabled_;
     cloud_watch_metrics_enabled = cloud_watch_metrics_enabled_;
     metric_name = metric_name_;
   }
    : visibility_config)

let make_label ~name:(name_ : label_name) () = ({ name = name_ } : label)
let make_none_action () = (() : unit)

let make_custom_http_header ~name:(name_ : custom_http_header_name)
    ~value:(value_ : custom_http_header_value) () =
  ({ name = name_; value = value_ } : custom_http_header)

let make_custom_request_handling ~insert_headers:(insert_headers_ : custom_http_headers) () =
  ({ insert_headers = insert_headers_ } : custom_request_handling)

let make_count_action
    ?custom_request_handling:(custom_request_handling_ : custom_request_handling option) () =
  ({ custom_request_handling = custom_request_handling_ } : count_action)

let make_override_action ?count:(count_ : count_action option) ?none:(none_ : none_action option) ()
    =
  ({ count = count_; none = none_ } : override_action)

let make_monetize_action ?price_multiplier:(price_multiplier_ : price_multiplier option) () =
  ({ price_multiplier = price_multiplier_ } : monetize_action)

let make_challenge_action
    ?custom_request_handling:(custom_request_handling_ : custom_request_handling option) () =
  ({ custom_request_handling = custom_request_handling_ } : challenge_action)

let make_captcha_action
    ?custom_request_handling:(custom_request_handling_ : custom_request_handling option) () =
  ({ custom_request_handling = custom_request_handling_ } : captcha_action)

let make_allow_action
    ?custom_request_handling:(custom_request_handling_ : custom_request_handling option) () =
  ({ custom_request_handling = custom_request_handling_ } : allow_action)

let make_custom_response ?custom_response_body_key:(custom_response_body_key_ : entity_name option)
    ?response_headers:(response_headers_ : custom_http_headers option)
    ~response_code:(response_code_ : response_status_code) () =
  ({
     response_code = response_code_;
     custom_response_body_key = custom_response_body_key_;
     response_headers = response_headers_;
   }
    : custom_response)

let make_block_action ?custom_response:(custom_response_ : custom_response option) () =
  ({ custom_response = custom_response_ } : block_action)

let make_rule_action ?block:(block_ : block_action option) ?allow:(allow_ : allow_action option)
    ?count:(count_ : count_action option) ?captcha:(captcha_ : captcha_action option)
    ?challenge:(challenge_ : challenge_action option) ?monetize:(monetize_ : monetize_action option)
    () =
  ({
     block = block_;
     allow = allow_;
     count = count_;
     captcha = captcha_;
     challenge = challenge_;
     monetize = monetize_;
   }
    : rule_action)

let make_forwarded_ip_config ~header_name:(header_name_ : forwarded_ip_header_name)
    ~fallback_behavior:(fallback_behavior_ : fallback_behavior) () =
  ({ header_name = header_name_; fallback_behavior = fallback_behavior_ } : forwarded_ip_config)

let make_asn_match_statement
    ?forwarded_ip_config:(forwarded_ip_config_ : forwarded_ip_config option)
    ~asn_list:(asn_list_ : asn_list) () =
  ({ asn_list = asn_list_; forwarded_ip_config = forwarded_ip_config_ } : asn_match_statement)

let make_text_transformation ~priority:(priority_ : text_transformation_priority)
    ~type_:(type__ : text_transformation_type) () =
  ({ priority = priority_; type_ = type__ } : text_transformation)

let make_uri_fragment ?fallback_behavior:(fallback_behavior_ : fallback_behavior option) () =
  ({ fallback_behavior = fallback_behavior_ } : uri_fragment)

let make_ja4_fingerprint ~fallback_behavior:(fallback_behavior_ : fallback_behavior) () =
  ({ fallback_behavior = fallback_behavior_ } : ja4_fingerprint)

let make_ja3_fingerprint ~fallback_behavior:(fallback_behavior_ : fallback_behavior) () =
  ({ fallback_behavior = fallback_behavior_ } : ja3_fingerprint)

let make_header_order ~oversize_handling:(oversize_handling_ : oversize_handling) () =
  ({ oversize_handling = oversize_handling_ } : header_order)

let make_all () = (() : unit)

let make_cookie_match_pattern ?all:(all_ : all option)
    ?included_cookies:(included_cookies_ : cookie_names option)
    ?excluded_cookies:(excluded_cookies_ : cookie_names option) () =
  ({ all = all_; included_cookies = included_cookies_; excluded_cookies = excluded_cookies_ }
    : cookie_match_pattern)

let make_cookies ~match_pattern:(match_pattern_ : cookie_match_pattern)
    ~match_scope:(match_scope_ : map_match_scope)
    ~oversize_handling:(oversize_handling_ : oversize_handling) () =
  ({
     match_pattern = match_pattern_;
     match_scope = match_scope_;
     oversize_handling = oversize_handling_;
   }
    : cookies)

let make_header_match_pattern ?all:(all_ : all option)
    ?included_headers:(included_headers_ : header_names option)
    ?excluded_headers:(excluded_headers_ : header_names option) () =
  ({ all = all_; included_headers = included_headers_; excluded_headers = excluded_headers_ }
    : header_match_pattern)

let make_headers ~match_pattern:(match_pattern_ : header_match_pattern)
    ~match_scope:(match_scope_ : map_match_scope)
    ~oversize_handling:(oversize_handling_ : oversize_handling) () =
  ({
     match_pattern = match_pattern_;
     match_scope = match_scope_;
     oversize_handling = oversize_handling_;
   }
    : headers)

let make_json_match_pattern ?all:(all_ : all option)
    ?included_paths:(included_paths_ : json_pointer_paths option) () =
  ({ all = all_; included_paths = included_paths_ } : json_match_pattern)

let make_json_body
    ?invalid_fallback_behavior:(invalid_fallback_behavior_ : body_parsing_fallback_behavior option)
    ?oversize_handling:(oversize_handling_ : oversize_handling option)
    ~match_pattern:(match_pattern_ : json_match_pattern)
    ~match_scope:(match_scope_ : json_match_scope) () =
  ({
     match_pattern = match_pattern_;
     match_scope = match_scope_;
     invalid_fallback_behavior = invalid_fallback_behavior_;
     oversize_handling = oversize_handling_;
   }
    : json_body)

let make_method_ () = (() : unit)

let make_body ?oversize_handling:(oversize_handling_ : oversize_handling option) () =
  ({ oversize_handling = oversize_handling_ } : body)

let make_query_string () = (() : unit)
let make_uri_path () = (() : unit)
let make_all_query_arguments () = (() : unit)

let make_single_query_argument ~name:(name_ : field_to_match_data) () =
  ({ name = name_ } : single_query_argument)

let make_single_header ~name:(name_ : field_to_match_data) () = ({ name = name_ } : single_header)

let make_field_to_match ?single_header:(single_header_ : single_header option)
    ?single_query_argument:(single_query_argument_ : single_query_argument option)
    ?all_query_arguments:(all_query_arguments_ : all_query_arguments option)
    ?uri_path:(uri_path_ : uri_path option) ?query_string:(query_string_ : query_string option)
    ?body:(body_ : body option) ?method_:(method__ : method_ option)
    ?json_body:(json_body_ : json_body option) ?headers:(headers_ : headers option)
    ?cookies:(cookies_ : cookies option) ?header_order:(header_order_ : header_order option)
    ?ja3_fingerprint:(ja3_fingerprint_ : ja3_fingerprint option)
    ?ja4_fingerprint:(ja4_fingerprint_ : ja4_fingerprint option)
    ?uri_fragment:(uri_fragment_ : uri_fragment option) () =
  ({
     single_header = single_header_;
     single_query_argument = single_query_argument_;
     all_query_arguments = all_query_arguments_;
     uri_path = uri_path_;
     query_string = query_string_;
     body = body_;
     method_ = method__;
     json_body = json_body_;
     headers = headers_;
     cookies = cookies_;
     header_order = header_order_;
     ja3_fingerprint = ja3_fingerprint_;
     ja4_fingerprint = ja4_fingerprint_;
     uri_fragment = uri_fragment_;
   }
    : field_to_match)

let make_regex_match_statement ~regex_string:(regex_string_ : regex_pattern_string)
    ~field_to_match:(field_to_match_ : field_to_match)
    ~text_transformations:(text_transformations_ : text_transformations) () =
  ({
     regex_string = regex_string_;
     field_to_match = field_to_match_;
     text_transformations = text_transformations_;
   }
    : regex_match_statement)

let make_label_match_statement ~scope:(scope_ : label_match_scope) ~key:(key_ : label_match_key) ()
    =
  ({ scope = scope_; key = key_ } : label_match_statement)

let make_rule_action_override ~name:(name_ : entity_name)
    ~action_to_use:(action_to_use_ : rule_action) () =
  ({ name = name_; action_to_use = action_to_use_ } : rule_action_override)

let make_managed_rule_group_config ?login_path:(login_path_ : login_path_string option)
    ?payload_type:(payload_type_ : payload_type option)
    ?username_field:(username_field_ : username_field option)
    ?password_field:(password_field_ : password_field option)
    ?aws_managed_rules_bot_control_rule_set:
      (aws_managed_rules_bot_control_rule_set_ : aws_managed_rules_bot_control_rule_set option)
    ?aws_managed_rules_atp_rule_set:
      (aws_managed_rules_atp_rule_set_ : aws_managed_rules_atp_rule_set option)
    ?aws_managed_rules_acfp_rule_set:
      (aws_managed_rules_acfp_rule_set_ : aws_managed_rules_acfp_rule_set option)
    ?aws_managed_rules_anti_d_do_s_rule_set:
      (aws_managed_rules_anti_d_do_s_rule_set_ : aws_managed_rules_anti_d_do_s_rule_set option) () =
  ({
     login_path = login_path_;
     payload_type = payload_type_;
     username_field = username_field_;
     password_field = password_field_;
     aws_managed_rules_bot_control_rule_set = aws_managed_rules_bot_control_rule_set_;
     aws_managed_rules_atp_rule_set = aws_managed_rules_atp_rule_set_;
     aws_managed_rules_acfp_rule_set = aws_managed_rules_acfp_rule_set_;
     aws_managed_rules_anti_d_do_s_rule_set = aws_managed_rules_anti_d_do_s_rule_set_;
   }
    : managed_rule_group_config)

let make_excluded_rule ~name:(name_ : entity_name) () = ({ name = name_ } : excluded_rule)
let make_rate_limit_asn () = (() : unit)

let make_rate_limit_ja4_fingerprint ~fallback_behavior:(fallback_behavior_ : fallback_behavior) () =
  ({ fallback_behavior = fallback_behavior_ } : rate_limit_ja4_fingerprint)

let make_rate_limit_ja3_fingerprint ~fallback_behavior:(fallback_behavior_ : fallback_behavior) () =
  ({ fallback_behavior = fallback_behavior_ } : rate_limit_ja3_fingerprint)

let make_rate_limit_uri_path ~text_transformations:(text_transformations_ : text_transformations) ()
    =
  ({ text_transformations = text_transformations_ } : rate_limit_uri_path)

let make_rate_limit_label_namespace ~namespace:(namespace_ : label_namespace) () =
  ({ namespace = namespace_ } : rate_limit_label_namespace)

let make_rate_limit_i_p () = (() : unit)
let make_rate_limit_forwarded_i_p () = (() : unit)
let make_rate_limit_http_method () = (() : unit)

let make_rate_limit_query_string
    ~text_transformations:(text_transformations_ : text_transformations) () =
  ({ text_transformations = text_transformations_ } : rate_limit_query_string)

let make_rate_limit_query_argument ~name:(name_ : field_to_match_data)
    ~text_transformations:(text_transformations_ : text_transformations) () =
  ({ name = name_; text_transformations = text_transformations_ } : rate_limit_query_argument)

let make_rate_limit_cookie ~name:(name_ : field_to_match_data)
    ~text_transformations:(text_transformations_ : text_transformations) () =
  ({ name = name_; text_transformations = text_transformations_ } : rate_limit_cookie)

let make_rate_limit_header ~name:(name_ : field_to_match_data)
    ~text_transformations:(text_transformations_ : text_transformations) () =
  ({ name = name_; text_transformations = text_transformations_ } : rate_limit_header)

let make_rate_based_statement_custom_key ?header:(header_ : rate_limit_header option)
    ?cookie:(cookie_ : rate_limit_cookie option)
    ?query_argument:(query_argument_ : rate_limit_query_argument option)
    ?query_string:(query_string_ : rate_limit_query_string option)
    ?http_method:(http_method_ : rate_limit_http_method option)
    ?forwarded_i_p:(forwarded_i_p_ : rate_limit_forwarded_i_p option)
    ?i_p:(i_p_ : rate_limit_i_p option)
    ?label_namespace:(label_namespace_ : rate_limit_label_namespace option)
    ?uri_path:(uri_path_ : rate_limit_uri_path option)
    ?ja3_fingerprint:(ja3_fingerprint_ : rate_limit_ja3_fingerprint option)
    ?ja4_fingerprint:(ja4_fingerprint_ : rate_limit_ja4_fingerprint option)
    ?as_n:(as_n_ : rate_limit_asn option) () =
  ({
     header = header_;
     cookie = cookie_;
     query_argument = query_argument_;
     query_string = query_string_;
     http_method = http_method_;
     forwarded_i_p = forwarded_i_p_;
     i_p = i_p_;
     label_namespace = label_namespace_;
     uri_path = uri_path_;
     ja3_fingerprint = ja3_fingerprint_;
     ja4_fingerprint = ja4_fingerprint_;
     as_n = as_n_;
   }
    : rate_based_statement_custom_key)

let make_regex_pattern_set_reference_statement ~ar_n:(ar_n_ : resource_arn)
    ~field_to_match:(field_to_match_ : field_to_match)
    ~text_transformations:(text_transformations_ : text_transformations) () =
  ({ ar_n = ar_n_; field_to_match = field_to_match_; text_transformations = text_transformations_ }
    : regex_pattern_set_reference_statement)

let make_ip_set_forwarded_ip_config ~header_name:(header_name_ : forwarded_ip_header_name)
    ~fallback_behavior:(fallback_behavior_ : fallback_behavior)
    ~position:(position_ : forwarded_ip_position) () =
  ({ header_name = header_name_; fallback_behavior = fallback_behavior_; position = position_ }
    : ip_set_forwarded_ip_config)

let make_ip_set_reference_statement
    ?ip_set_forwarded_ip_config:(ip_set_forwarded_ip_config_ : ip_set_forwarded_ip_config option)
    ~ar_n:(ar_n_ : resource_arn) () =
  ({ ar_n = ar_n_; ip_set_forwarded_ip_config = ip_set_forwarded_ip_config_ }
    : ip_set_reference_statement)

let make_rule_group_reference_statement ?excluded_rules:(excluded_rules_ : excluded_rules option)
    ?rule_action_overrides:(rule_action_overrides_ : rule_action_overrides option)
    ~ar_n:(ar_n_ : resource_arn) () =
  ({
     ar_n = ar_n_;
     excluded_rules = excluded_rules_;
     rule_action_overrides = rule_action_overrides_;
   }
    : rule_group_reference_statement)

let make_geo_match_statement ?country_codes:(country_codes_ : country_codes option)
    ?forwarded_ip_config:(forwarded_ip_config_ : forwarded_ip_config option) () =
  ({ country_codes = country_codes_; forwarded_ip_config = forwarded_ip_config_ }
    : geo_match_statement)

let make_size_constraint_statement ~field_to_match:(field_to_match_ : field_to_match)
    ~comparison_operator:(comparison_operator_ : comparison_operator) ~size:(size_ : size)
    ~text_transformations:(text_transformations_ : text_transformations) () =
  ({
     field_to_match = field_to_match_;
     comparison_operator = comparison_operator_;
     size = size_;
     text_transformations = text_transformations_;
   }
    : size_constraint_statement)

let make_xss_match_statement ~field_to_match:(field_to_match_ : field_to_match)
    ~text_transformations:(text_transformations_ : text_transformations) () =
  ({ field_to_match = field_to_match_; text_transformations = text_transformations_ }
    : xss_match_statement)

let make_sqli_match_statement ?sensitivity_level:(sensitivity_level_ : sensitivity_level option)
    ~field_to_match:(field_to_match_ : field_to_match)
    ~text_transformations:(text_transformations_ : text_transformations) () =
  ({
     field_to_match = field_to_match_;
     text_transformations = text_transformations_;
     sensitivity_level = sensitivity_level_;
   }
    : sqli_match_statement)

let make_byte_match_statement ~search_string:(search_string_ : search_string)
    ~field_to_match:(field_to_match_ : field_to_match)
    ~text_transformations:(text_transformations_ : text_transformations)
    ~positional_constraint:(positional_constraint_ : positional_constraint) () =
  ({
     search_string = search_string_;
     field_to_match = field_to_match_;
     text_transformations = text_transformations_;
     positional_constraint = positional_constraint_;
   }
    : byte_match_statement)

let make_statement ?byte_match_statement:(byte_match_statement_ : byte_match_statement option)
    ?sqli_match_statement:(sqli_match_statement_ : sqli_match_statement option)
    ?xss_match_statement:(xss_match_statement_ : xss_match_statement option)
    ?size_constraint_statement:(size_constraint_statement_ : size_constraint_statement option)
    ?geo_match_statement:(geo_match_statement_ : geo_match_statement option)
    ?rule_group_reference_statement:
      (rule_group_reference_statement_ : rule_group_reference_statement option)
    ?ip_set_reference_statement:(ip_set_reference_statement_ : ip_set_reference_statement option)
    ?regex_pattern_set_reference_statement:
      (regex_pattern_set_reference_statement_ : regex_pattern_set_reference_statement option)
    ?rate_based_statement:(rate_based_statement_ : rate_based_statement option)
    ?and_statement:(and_statement_ : and_statement option)
    ?or_statement:(or_statement_ : or_statement option)
    ?not_statement:(not_statement_ : not_statement option)
    ?managed_rule_group_statement:
      (managed_rule_group_statement_ : managed_rule_group_statement option)
    ?label_match_statement:(label_match_statement_ : label_match_statement option)
    ?regex_match_statement:(regex_match_statement_ : regex_match_statement option)
    ?asn_match_statement:(asn_match_statement_ : asn_match_statement option) () =
  ({
     byte_match_statement = byte_match_statement_;
     sqli_match_statement = sqli_match_statement_;
     xss_match_statement = xss_match_statement_;
     size_constraint_statement = size_constraint_statement_;
     geo_match_statement = geo_match_statement_;
     rule_group_reference_statement = rule_group_reference_statement_;
     ip_set_reference_statement = ip_set_reference_statement_;
     regex_pattern_set_reference_statement = regex_pattern_set_reference_statement_;
     rate_based_statement = rate_based_statement_;
     and_statement = and_statement_;
     or_statement = or_statement_;
     not_statement = not_statement_;
     managed_rule_group_statement = managed_rule_group_statement_;
     label_match_statement = label_match_statement_;
     regex_match_statement = regex_match_statement_;
     asn_match_statement = asn_match_statement_;
   }
    : statement)

let make_rate_based_statement
    ?evaluation_window_sec:(evaluation_window_sec_ : evaluation_window_sec option)
    ?scope_down_statement:(scope_down_statement_ : statement option)
    ?forwarded_ip_config:(forwarded_ip_config_ : forwarded_ip_config option)
    ?custom_keys:(custom_keys_ : rate_based_statement_custom_keys option)
    ~limit:(limit_ : rate_limit)
    ~aggregate_key_type:(aggregate_key_type_ : rate_based_statement_aggregate_key_type) () =
  ({
     limit = limit_;
     evaluation_window_sec = evaluation_window_sec_;
     aggregate_key_type = aggregate_key_type_;
     scope_down_statement = scope_down_statement_;
     forwarded_ip_config = forwarded_ip_config_;
     custom_keys = custom_keys_;
   }
    : rate_based_statement)

let make_or_statement ~statements:(statements_ : statements) () =
  ({ statements = statements_ } : or_statement)

let make_not_statement ~statement:(statement_ : statement) () =
  ({ statement = statement_ } : not_statement)

let make_managed_rule_group_statement ?version:(version_ : version_key_string option)
    ?excluded_rules:(excluded_rules_ : excluded_rules option)
    ?scope_down_statement:(scope_down_statement_ : statement option)
    ?managed_rule_group_configs:(managed_rule_group_configs_ : managed_rule_group_configs option)
    ?rule_action_overrides:(rule_action_overrides_ : rule_action_overrides option)
    ~vendor_name:(vendor_name_ : vendor_name) ~name:(name_ : entity_name) () =
  ({
     vendor_name = vendor_name_;
     name = name_;
     version = version_;
     excluded_rules = excluded_rules_;
     scope_down_statement = scope_down_statement_;
     managed_rule_group_configs = managed_rule_group_configs_;
     rule_action_overrides = rule_action_overrides_;
   }
    : managed_rule_group_statement)

let make_and_statement ~statements:(statements_ : statements) () =
  ({ statements = statements_ } : and_statement)

let make_rule ?action:(action_ : rule_action option)
    ?override_action:(override_action_ : override_action option)
    ?rule_labels:(rule_labels_ : labels option)
    ?captcha_config:(captcha_config_ : captcha_config option)
    ?challenge_config:(challenge_config_ : challenge_config option) ~name:(name_ : entity_name)
    ~priority:(priority_ : rule_priority) ~statement:(statement_ : statement)
    ~visibility_config:(visibility_config_ : visibility_config) () =
  ({
     name = name_;
     priority = priority_;
     statement = statement_;
     action = action_;
     override_action = override_action_;
     rule_labels = rule_labels_;
     visibility_config = visibility_config_;
     captcha_config = captcha_config_;
     challenge_config = challenge_config_;
   }
    : rule)

let make_default_action ?block:(block_ : block_action option) ?allow:(allow_ : allow_action option)
    () =
  ({ block = block_; allow = allow_ } : default_action)

let make_update_web_acl_request ?description:(description_ : entity_description option)
    ?rules:(rules_ : rules option)
    ?data_protection_config:(data_protection_config_ : data_protection_config option)
    ?custom_response_bodies:(custom_response_bodies_ : custom_response_bodies option)
    ?captcha_config:(captcha_config_ : captcha_config option)
    ?challenge_config:(challenge_config_ : challenge_config option)
    ?token_domains:(token_domains_ : token_domains option)
    ?association_config:(association_config_ : association_config option)
    ?on_source_d_do_s_protection_config:
      (on_source_d_do_s_protection_config_ : on_source_d_do_s_protection_config option)
    ?application_config:(application_config_ : application_config option)
    ?monetization_config:(monetization_config_ : monetization_config option)
    ~name:(name_ : entity_name) ~scope:(scope_ : scope) ~id:(id_ : entity_id)
    ~default_action:(default_action_ : default_action)
    ~visibility_config:(visibility_config_ : visibility_config)
    ~lock_token:(lock_token_ : lock_token) () =
  ({
     name = name_;
     scope = scope_;
     id = id_;
     default_action = default_action_;
     description = description_;
     rules = rules_;
     visibility_config = visibility_config_;
     data_protection_config = data_protection_config_;
     lock_token = lock_token_;
     custom_response_bodies = custom_response_bodies_;
     captcha_config = captcha_config_;
     challenge_config = challenge_config_;
     token_domains = token_domains_;
     association_config = association_config_;
     on_source_d_do_s_protection_config = on_source_d_do_s_protection_config_;
     application_config = application_config_;
     monetization_config = monetization_config_;
   }
    : update_web_acl_request)

let make_update_rule_group_response ?next_lock_token:(next_lock_token_ : lock_token option) () =
  ({ next_lock_token = next_lock_token_ } : update_rule_group_response)

let make_update_rule_group_request ?description:(description_ : entity_description option)
    ?rules:(rules_ : rules option)
    ?custom_response_bodies:(custom_response_bodies_ : custom_response_bodies option)
    ?monetization_config:(monetization_config_ : monetization_config option)
    ~name:(name_ : entity_name) ~scope:(scope_ : scope) ~id:(id_ : entity_id)
    ~visibility_config:(visibility_config_ : visibility_config)
    ~lock_token:(lock_token_ : lock_token) () =
  ({
     name = name_;
     scope = scope_;
     id = id_;
     description = description_;
     rules = rules_;
     visibility_config = visibility_config_;
     lock_token = lock_token_;
     custom_response_bodies = custom_response_bodies_;
     monetization_config = monetization_config_;
   }
    : update_rule_group_request)

let make_update_regex_pattern_set_response ?next_lock_token:(next_lock_token_ : lock_token option)
    () =
  ({ next_lock_token = next_lock_token_ } : update_regex_pattern_set_response)

let make_update_regex_pattern_set_request ?description:(description_ : entity_description option)
    ~name:(name_ : entity_name) ~scope:(scope_ : scope) ~id:(id_ : entity_id)
    ~regular_expression_list:(regular_expression_list_ : regular_expression_list)
    ~lock_token:(lock_token_ : lock_token) () =
  ({
     name = name_;
     scope = scope_;
     id = id_;
     description = description_;
     regular_expression_list = regular_expression_list_;
     lock_token = lock_token_;
   }
    : update_regex_pattern_set_request)

let make_update_managed_rule_set_version_expiry_date_response
    ?expiring_version:(expiring_version_ : version_key_string option)
    ?expiry_timestamp:(expiry_timestamp_ : timestamp option)
    ?next_lock_token:(next_lock_token_ : lock_token option) () =
  ({
     expiring_version = expiring_version_;
     expiry_timestamp = expiry_timestamp_;
     next_lock_token = next_lock_token_;
   }
    : update_managed_rule_set_version_expiry_date_response)

let make_update_managed_rule_set_version_expiry_date_request ~name:(name_ : entity_name)
    ~scope:(scope_ : scope) ~id:(id_ : entity_id) ~lock_token:(lock_token_ : lock_token)
    ~version_to_expire:(version_to_expire_ : version_key_string)
    ~expiry_timestamp:(expiry_timestamp_ : timestamp) () =
  ({
     name = name_;
     scope = scope_;
     id = id_;
     lock_token = lock_token_;
     version_to_expire = version_to_expire_;
     expiry_timestamp = expiry_timestamp_;
   }
    : update_managed_rule_set_version_expiry_date_request)

let make_update_ip_set_response ?next_lock_token:(next_lock_token_ : lock_token option) () =
  ({ next_lock_token = next_lock_token_ } : update_ip_set_response)

let make_update_ip_set_request ?description:(description_ : entity_description option)
    ~name:(name_ : entity_name) ~scope:(scope_ : scope) ~id:(id_ : entity_id)
    ~addresses:(addresses_ : ip_addresses) ~lock_token:(lock_token_ : lock_token) () =
  ({
     name = name_;
     scope = scope_;
     id = id_;
     description = description_;
     addresses = addresses_;
     lock_token = lock_token_;
   }
    : update_ip_set_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : resource_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : resource_arn)
    ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_put_permission_policy_response () = (() : unit)

let make_put_permission_policy_request ~resource_arn:(resource_arn_ : resource_arn)
    ~policy:(policy_ : policy_string) () =
  ({ resource_arn = resource_arn_; policy = policy_ } : put_permission_policy_request)

let make_put_managed_rule_set_versions_response
    ?next_lock_token:(next_lock_token_ : lock_token option) () =
  ({ next_lock_token = next_lock_token_ } : put_managed_rule_set_versions_response)

let make_version_to_publish
    ?associated_rule_group_arn:(associated_rule_group_arn_ : resource_arn option)
    ?forecasted_lifetime:(forecasted_lifetime_ : time_window_day option) () =
  ({
     associated_rule_group_arn = associated_rule_group_arn_;
     forecasted_lifetime = forecasted_lifetime_;
   }
    : version_to_publish)

let make_put_managed_rule_set_versions_request
    ?recommended_version:(recommended_version_ : version_key_string option)
    ?versions_to_publish:(versions_to_publish_ : versions_to_publish option)
    ~name:(name_ : entity_name) ~scope:(scope_ : scope) ~id:(id_ : entity_id)
    ~lock_token:(lock_token_ : lock_token) () =
  ({
     name = name_;
     scope = scope_;
     id = id_;
     lock_token = lock_token_;
     recommended_version = recommended_version_;
     versions_to_publish = versions_to_publish_;
   }
    : put_managed_rule_set_versions_request)

let make_label_name_condition ~label_name:(label_name_ : label_name) () =
  ({ label_name = label_name_ } : label_name_condition)

let make_action_condition ~action:(action_ : action_value) () =
  ({ action = action_ } : action_condition)

let make_condition ?action_condition:(action_condition_ : action_condition option)
    ?label_name_condition:(label_name_condition_ : label_name_condition option) () =
  ({ action_condition = action_condition_; label_name_condition = label_name_condition_ }
    : condition)

let make_filter ~behavior:(behavior_ : filter_behavior)
    ~requirement:(requirement_ : filter_requirement) ~conditions:(conditions_ : conditions) () =
  ({ behavior = behavior_; requirement = requirement_; conditions = conditions_ } : filter)

let make_logging_filter ~filters:(filters_ : filters)
    ~default_behavior:(default_behavior_ : filter_behavior) () =
  ({ filters = filters_; default_behavior = default_behavior_ } : logging_filter)

let make_logging_configuration ?redacted_fields:(redacted_fields_ : redacted_fields option)
    ?managed_by_firewall_manager:(managed_by_firewall_manager_ : boolean_ option)
    ?logging_filter:(logging_filter_ : logging_filter option)
    ?log_type:(log_type_ : log_type option) ?log_scope:(log_scope_ : log_scope option)
    ~resource_arn:(resource_arn_ : resource_arn)
    ~log_destination_configs:(log_destination_configs_ : log_destination_configs) () =
  ({
     resource_arn = resource_arn_;
     log_destination_configs = log_destination_configs_;
     redacted_fields = redacted_fields_;
     managed_by_firewall_manager = managed_by_firewall_manager_;
     logging_filter = logging_filter_;
     log_type = log_type_;
     log_scope = log_scope_;
   }
    : logging_configuration)

let make_put_logging_configuration_response
    ?logging_configuration:(logging_configuration_ : logging_configuration option) () =
  ({ logging_configuration = logging_configuration_ } : put_logging_configuration_response)

let make_put_logging_configuration_request
    ~logging_configuration:(logging_configuration_ : logging_configuration) () =
  ({ logging_configuration = logging_configuration_ } : put_logging_configuration_request)

let make_web_acl_summary ?name:(name_ : entity_name option) ?id:(id_ : entity_id option)
    ?description:(description_ : entity_description option)
    ?lock_token:(lock_token_ : lock_token option) ?ar_n:(ar_n_ : resource_arn option) () =
  ({ name = name_; id = id_; description = description_; lock_token = lock_token_; ar_n = ar_n_ }
    : web_acl_summary)

let make_list_web_ac_ls_response ?next_marker:(next_marker_ : next_marker option)
    ?web_ac_ls:(web_ac_ls_ : web_acl_summaries option) () =
  ({ next_marker = next_marker_; web_ac_ls = web_ac_ls_ } : list_web_ac_ls_response)

let make_list_web_ac_ls_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) ~scope:(scope_ : scope) () =
  ({ scope = scope_; next_marker = next_marker_; limit = limit_ } : list_web_ac_ls_request)

let make_tag_info_for_resource ?resource_ar_n:(resource_ar_n_ : resource_arn option)
    ?tag_list:(tag_list_ : tag_list option) () =
  ({ resource_ar_n = resource_ar_n_; tag_list = tag_list_ } : tag_info_for_resource)

let make_list_tags_for_resource_response ?next_marker:(next_marker_ : next_marker option)
    ?tag_info_for_resource:(tag_info_for_resource_ : tag_info_for_resource option) () =
  ({ next_marker = next_marker_; tag_info_for_resource = tag_info_for_resource_ }
    : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) ~resource_ar_n:(resource_ar_n_ : resource_arn) () =
  ({ next_marker = next_marker_; limit = limit_; resource_ar_n = resource_ar_n_ }
    : list_tags_for_resource_request)

let make_settlement_record ?payer_address:(payer_address_ : settlement_filter_string option)
    ?wallet_address:(wallet_address_ : settlement_filter_string option)
    ?currency:(currency_ : currency option) ?network:(network_ : settlement_filter_string option)
    ?transaction_id:(transaction_id_ : settlement_id_string option)
    ?request_id:(request_id_ : settlement_filter_string option)
    ?source_name:(source_name_ : filter_string option)
    ?organization:(organization_ : filter_string option)
    ?source_category:(source_category_ : filter_string option)
    ?intent:(intent_ : filter_string option) ?verified:(verified_ : verified_status option)
    ?content_path:(content_path_ : filter_string option)
    ?web_acl_arn:(web_acl_arn_ : resource_arn option)
    ?request_timestamp:(request_timestamp_ : timestamp option) ~timestamp:(timestamp_ : timestamp)
    ~status:(status_ : settlement_status) ~amount:(amount_ : monetization_amount_value) () =
  ({
     timestamp = timestamp_;
     payer_address = payer_address_;
     wallet_address = wallet_address_;
     status = status_;
     amount = amount_;
     currency = currency_;
     network = network_;
     transaction_id = transaction_id_;
     request_id = request_id_;
     source_name = source_name_;
     organization = organization_;
     source_category = source_category_;
     intent = intent_;
     verified = verified_;
     content_path = content_path_;
     web_acl_arn = web_acl_arn_;
     request_timestamp = request_timestamp_;
   }
    : settlement_record)

let make_list_settlement_records_response
    ?settlements:(settlements_ : settlement_record_list option)
    ?next_marker:(next_marker_ : next_marker option) () =
  ({ settlements = settlements_; next_marker = next_marker_ } : list_settlement_records_response)

let make_monetization_filter ~name:(name_ : monetization_filter_name)
    ~values:(values_ : monetization_filter_value_list) () =
  ({ name = name_; values = values_ } : monetization_filter)

let make_time_window ~start_time:(start_time_ : timestamp) ~end_time:(end_time_ : timestamp) () =
  ({ start_time = start_time_; end_time = end_time_ } : time_window)

let make_list_settlement_records_request ?filters:(filters_ : monetization_filter_list option)
    ?sort_by:(sort_by_ : settlement_sort_by option) ?sort_order:(sort_order_ : sort_order option)
    ?limit:(limit_ : settlement_record_limit option)
    ?next_marker:(next_marker_ : next_marker option) ~time_window:(time_window_ : time_window)
    ~scope:(scope_ : scope) ~currency:(currency_ : currency) () =
  ({
     time_window = time_window_;
     scope = scope_;
     currency = currency_;
     filters = filters_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     limit = limit_;
     next_marker = next_marker_;
   }
    : list_settlement_records_request)

let make_rule_group_summary ?name:(name_ : entity_name option) ?id:(id_ : entity_id option)
    ?description:(description_ : entity_description option)
    ?lock_token:(lock_token_ : lock_token option) ?ar_n:(ar_n_ : resource_arn option) () =
  ({ name = name_; id = id_; description = description_; lock_token = lock_token_; ar_n = ar_n_ }
    : rule_group_summary)

let make_list_rule_groups_response ?next_marker:(next_marker_ : next_marker option)
    ?rule_groups:(rule_groups_ : rule_group_summaries option) () =
  ({ next_marker = next_marker_; rule_groups = rule_groups_ } : list_rule_groups_response)

let make_list_rule_groups_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) ~scope:(scope_ : scope) () =
  ({ scope = scope_; next_marker = next_marker_; limit = limit_ } : list_rule_groups_request)

let make_list_resources_for_web_acl_response ?resource_arns:(resource_arns_ : resource_arns option)
    () =
  ({ resource_arns = resource_arns_ } : list_resources_for_web_acl_response)

let make_list_resources_for_web_acl_request ?resource_type:(resource_type_ : resource_type option)
    ~web_acl_arn:(web_acl_arn_ : resource_arn) () =
  ({ web_acl_arn = web_acl_arn_; resource_type = resource_type_ }
    : list_resources_for_web_acl_request)

let make_regex_pattern_set_summary ?name:(name_ : entity_name option) ?id:(id_ : entity_id option)
    ?description:(description_ : entity_description option)
    ?lock_token:(lock_token_ : lock_token option) ?ar_n:(ar_n_ : resource_arn option) () =
  ({ name = name_; id = id_; description = description_; lock_token = lock_token_; ar_n = ar_n_ }
    : regex_pattern_set_summary)

let make_list_regex_pattern_sets_response ?next_marker:(next_marker_ : next_marker option)
    ?regex_pattern_sets:(regex_pattern_sets_ : regex_pattern_set_summaries option) () =
  ({ next_marker = next_marker_; regex_pattern_sets = regex_pattern_sets_ }
    : list_regex_pattern_sets_response)

let make_list_regex_pattern_sets_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) ~scope:(scope_ : scope) () =
  ({ scope = scope_; next_marker = next_marker_; limit = limit_ } : list_regex_pattern_sets_request)

let make_release_summary ?release_version:(release_version_ : version_key_string option)
    ?timestamp:(timestamp_ : timestamp option) () =
  ({ release_version = release_version_; timestamp = timestamp_ } : release_summary)

let make_list_mobile_sdk_releases_response
    ?release_summaries:(release_summaries_ : release_summaries option)
    ?next_marker:(next_marker_ : next_marker option) () =
  ({ release_summaries = release_summaries_; next_marker = next_marker_ }
    : list_mobile_sdk_releases_response)

let make_list_mobile_sdk_releases_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) ~platform:(platform_ : platform) () =
  ({ platform = platform_; next_marker = next_marker_; limit = limit_ }
    : list_mobile_sdk_releases_request)

let make_managed_rule_set_summary ?name:(name_ : entity_name option) ?id:(id_ : entity_id option)
    ?description:(description_ : entity_description option)
    ?lock_token:(lock_token_ : lock_token option) ?ar_n:(ar_n_ : resource_arn option)
    ?label_namespace:(label_namespace_ : label_name option) () =
  ({
     name = name_;
     id = id_;
     description = description_;
     lock_token = lock_token_;
     ar_n = ar_n_;
     label_namespace = label_namespace_;
   }
    : managed_rule_set_summary)

let make_list_managed_rule_sets_response ?next_marker:(next_marker_ : next_marker option)
    ?managed_rule_sets:(managed_rule_sets_ : managed_rule_set_summaries option) () =
  ({ next_marker = next_marker_; managed_rule_sets = managed_rule_sets_ }
    : list_managed_rule_sets_response)

let make_list_managed_rule_sets_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) ~scope:(scope_ : scope) () =
  ({ scope = scope_; next_marker = next_marker_; limit = limit_ } : list_managed_rule_sets_request)

let make_list_logging_configurations_response
    ?logging_configurations:(logging_configurations_ : logging_configurations option)
    ?next_marker:(next_marker_ : next_marker option) () =
  ({ logging_configurations = logging_configurations_; next_marker = next_marker_ }
    : list_logging_configurations_response)

let make_list_logging_configurations_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) ?log_scope:(log_scope_ : log_scope option)
    ~scope:(scope_ : scope) () =
  ({ scope = scope_; next_marker = next_marker_; limit = limit_; log_scope = log_scope_ }
    : list_logging_configurations_request)

let make_ip_set_summary ?name:(name_ : entity_name option) ?id:(id_ : entity_id option)
    ?description:(description_ : entity_description option)
    ?lock_token:(lock_token_ : lock_token option) ?ar_n:(ar_n_ : resource_arn option) () =
  ({ name = name_; id = id_; description = description_; lock_token = lock_token_; ar_n = ar_n_ }
    : ip_set_summary)

let make_list_ip_sets_response ?next_marker:(next_marker_ : next_marker option)
    ?ip_sets:(ip_sets_ : ip_set_summaries option) () =
  ({ next_marker = next_marker_; ip_sets = ip_sets_ } : list_ip_sets_response)

let make_list_ip_sets_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) ~scope:(scope_ : scope) () =
  ({ scope = scope_; next_marker = next_marker_; limit = limit_ } : list_ip_sets_request)

let make_managed_rule_group_version ?name:(name_ : version_key_string option)
    ?last_update_timestamp:(last_update_timestamp_ : timestamp option) () =
  ({ name = name_; last_update_timestamp = last_update_timestamp_ } : managed_rule_group_version)

let make_list_available_managed_rule_group_versions_response
    ?next_marker:(next_marker_ : next_marker option)
    ?versions:(versions_ : managed_rule_group_versions option)
    ?current_default_version:(current_default_version_ : version_key_string option) () =
  ({
     next_marker = next_marker_;
     versions = versions_;
     current_default_version = current_default_version_;
   }
    : list_available_managed_rule_group_versions_response)

let make_list_available_managed_rule_group_versions_request
    ?next_marker:(next_marker_ : next_marker option) ?limit:(limit_ : pagination_limit option)
    ~vendor_name:(vendor_name_ : vendor_name) ~name:(name_ : entity_name) ~scope:(scope_ : scope) ()
    =
  ({
     vendor_name = vendor_name_;
     name = name_;
     scope = scope_;
     next_marker = next_marker_;
     limit = limit_;
   }
    : list_available_managed_rule_group_versions_request)

let make_managed_rule_group_summary ?vendor_name:(vendor_name_ : vendor_name option)
    ?name:(name_ : entity_name option)
    ?versioning_supported:(versioning_supported_ : boolean_ option)
    ?description:(description_ : entity_description option) () =
  ({
     vendor_name = vendor_name_;
     name = name_;
     versioning_supported = versioning_supported_;
     description = description_;
   }
    : managed_rule_group_summary)

let make_list_available_managed_rule_groups_response
    ?next_marker:(next_marker_ : next_marker option)
    ?managed_rule_groups:(managed_rule_groups_ : managed_rule_group_summaries option) () =
  ({ next_marker = next_marker_; managed_rule_groups = managed_rule_groups_ }
    : list_available_managed_rule_groups_response)

let make_list_available_managed_rule_groups_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) ~scope:(scope_ : scope) () =
  ({ scope = scope_; next_marker = next_marker_; limit = limit_ }
    : list_available_managed_rule_groups_request)

let make_list_api_keys_response ?next_marker:(next_marker_ : next_marker option)
    ?api_key_summaries:(api_key_summaries_ : api_key_summaries option)
    ?application_integration_ur_l:(application_integration_ur_l_ : output_url option) () =
  ({
     next_marker = next_marker_;
     api_key_summaries = api_key_summaries_;
     application_integration_ur_l = application_integration_ur_l_;
   }
    : list_api_keys_response)

let make_list_api_keys_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) ~scope:(scope_ : scope) () =
  ({ scope = scope_; next_marker = next_marker_; limit = limit_ } : list_api_keys_request)

let make_firewall_manager_statement
    ?managed_rule_group_statement:
      (managed_rule_group_statement_ : managed_rule_group_statement option)
    ?rule_group_reference_statement:
      (rule_group_reference_statement_ : rule_group_reference_statement option) () =
  ({
     managed_rule_group_statement = managed_rule_group_statement_;
     rule_group_reference_statement = rule_group_reference_statement_;
   }
    : firewall_manager_statement)

let make_firewall_manager_rule_group ~name:(name_ : entity_name)
    ~priority:(priority_ : rule_priority)
    ~firewall_manager_statement:(firewall_manager_statement_ : firewall_manager_statement)
    ~override_action:(override_action_ : override_action)
    ~visibility_config:(visibility_config_ : visibility_config) () =
  ({
     name = name_;
     priority = priority_;
     firewall_manager_statement = firewall_manager_statement_;
     override_action = override_action_;
     visibility_config = visibility_config_;
   }
    : firewall_manager_rule_group)

let make_web_ac_l ?description:(description_ : entity_description option)
    ?rules:(rules_ : rules option)
    ?data_protection_config:(data_protection_config_ : data_protection_config option)
    ?capacity:(capacity_ : consumed_capacity option)
    ?pre_process_firewall_manager_rule_groups:
      (pre_process_firewall_manager_rule_groups_ : firewall_manager_rule_groups option)
    ?post_process_firewall_manager_rule_groups:
      (post_process_firewall_manager_rule_groups_ : firewall_manager_rule_groups option)
    ?managed_by_firewall_manager:(managed_by_firewall_manager_ : boolean_ option)
    ?label_namespace:(label_namespace_ : label_name option)
    ?custom_response_bodies:(custom_response_bodies_ : custom_response_bodies option)
    ?captcha_config:(captcha_config_ : captcha_config option)
    ?challenge_config:(challenge_config_ : challenge_config option)
    ?token_domains:(token_domains_ : token_domains option)
    ?association_config:(association_config_ : association_config option)
    ?retrofitted_by_firewall_manager:(retrofitted_by_firewall_manager_ : boolean_ option)
    ?on_source_d_do_s_protection_config:
      (on_source_d_do_s_protection_config_ : on_source_d_do_s_protection_config option)
    ?application_config:(application_config_ : application_config option)
    ?monetization_config:(monetization_config_ : monetization_config option)
    ~name:(name_ : entity_name) ~id:(id_ : entity_id) ~ar_n:(ar_n_ : resource_arn)
    ~default_action:(default_action_ : default_action)
    ~visibility_config:(visibility_config_ : visibility_config) () =
  ({
     name = name_;
     id = id_;
     ar_n = ar_n_;
     default_action = default_action_;
     description = description_;
     rules = rules_;
     visibility_config = visibility_config_;
     data_protection_config = data_protection_config_;
     capacity = capacity_;
     pre_process_firewall_manager_rule_groups = pre_process_firewall_manager_rule_groups_;
     post_process_firewall_manager_rule_groups = post_process_firewall_manager_rule_groups_;
     managed_by_firewall_manager = managed_by_firewall_manager_;
     label_namespace = label_namespace_;
     custom_response_bodies = custom_response_bodies_;
     captcha_config = captcha_config_;
     challenge_config = challenge_config_;
     token_domains = token_domains_;
     association_config = association_config_;
     retrofitted_by_firewall_manager = retrofitted_by_firewall_manager_;
     on_source_d_do_s_protection_config = on_source_d_do_s_protection_config_;
     application_config = application_config_;
     monetization_config = monetization_config_;
   }
    : web_ac_l)

let make_get_web_acl_for_resource_response ?web_ac_l:(web_ac_l_ : web_ac_l option) () =
  ({ web_ac_l = web_ac_l_ } : get_web_acl_for_resource_response)

let make_get_web_acl_for_resource_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_web_acl_for_resource_request)

let make_get_web_acl_response ?web_ac_l:(web_ac_l_ : web_ac_l option)
    ?lock_token:(lock_token_ : lock_token option)
    ?application_integration_ur_l:(application_integration_ur_l_ : output_url option) () =
  ({
     web_ac_l = web_ac_l_;
     lock_token = lock_token_;
     application_integration_ur_l = application_integration_ur_l_;
   }
    : get_web_acl_response)

let make_get_web_acl_request ?name:(name_ : entity_name option) ?scope:(scope_ : scope option)
    ?id:(id_ : entity_id option) ?ar_n:(ar_n_ : resource_arn option) () =
  ({ name = name_; scope = scope_; id = id_; ar_n = ar_n_ } : get_web_acl_request)

let make_bot_statistics ~bot_name:(bot_name_ : filter_string)
    ~request_count:(request_count_ : request_count) ~percentage:(percentage_ : percentage_value) ()
    =
  ({ bot_name = bot_name_; request_count = request_count_; percentage = percentage_ }
    : bot_statistics)

let make_filter_source ?bot_category:(bot_category_ : filter_string option)
    ?bot_organization:(bot_organization_ : filter_string option)
    ?bot_name:(bot_name_ : filter_string option) () =
  ({ bot_category = bot_category_; bot_organization = bot_organization_; bot_name = bot_name_ }
    : filter_source)

let make_path_statistics ?source:(source_ : filter_source option)
    ?top_bots:(top_bots_ : bot_statistics_list option) ~path:(path_ : path_string)
    ~request_count:(request_count_ : request_count) ~percentage:(percentage_ : percentage_value) ()
    =
  ({
     source = source_;
     path = path_;
     request_count = request_count_;
     percentage = percentage_;
     top_bots = top_bots_;
   }
    : path_statistics)

let make_get_top_path_statistics_by_traffic_response
    ?next_marker:(next_marker_ : next_marker option)
    ?top_categories:(top_categories_ : path_statistics_list option)
    ~path_statistics:(path_statistics_ : path_statistics_list)
    ~total_request_count:(total_request_count_ : request_count) () =
  ({
     path_statistics = path_statistics_;
     total_request_count = total_request_count_;
     next_marker = next_marker_;
     top_categories = top_categories_;
   }
    : get_top_path_statistics_by_traffic_response)

let make_get_top_path_statistics_by_traffic_request
    ?uri_path_prefix:(uri_path_prefix_ : uri_path_prefix_string option)
    ?bot_category:(bot_category_ : filter_string option)
    ?bot_organization:(bot_organization_ : filter_string option)
    ?bot_name:(bot_name_ : filter_string option) ?next_marker:(next_marker_ : next_marker option)
    ~web_acl_arn:(web_acl_arn_ : resource_arn) ~scope:(scope_ : scope)
    ~time_window:(time_window_ : time_window) ~limit:(limit_ : path_statistics_limit)
    ~number_of_top_traffic_bots_per_path:
      (number_of_top_traffic_bots_per_path_ : number_of_top_traffic_bots_per_path) () =
  ({
     web_acl_arn = web_acl_arn_;
     scope = scope_;
     uri_path_prefix = uri_path_prefix_;
     time_window = time_window_;
     bot_category = bot_category_;
     bot_organization = bot_organization_;
     bot_name = bot_name_;
     limit = limit_;
     number_of_top_traffic_bots_per_path = number_of_top_traffic_bots_per_path_;
     next_marker = next_marker_;
   }
    : get_top_path_statistics_by_traffic_request)

let make_challenge_response ?response_code:(response_code_ : response_code option)
    ?solve_timestamp:(solve_timestamp_ : solve_timestamp option)
    ?failure_reason:(failure_reason_ : failure_reason option) () =
  ({
     response_code = response_code_;
     solve_timestamp = solve_timestamp_;
     failure_reason = failure_reason_;
   }
    : challenge_response)

let make_captcha_response ?response_code:(response_code_ : response_code option)
    ?solve_timestamp:(solve_timestamp_ : solve_timestamp option)
    ?failure_reason:(failure_reason_ : failure_reason option) () =
  ({
     response_code = response_code_;
     solve_timestamp = solve_timestamp_;
     failure_reason = failure_reason_;
   }
    : captcha_response)

let make_http_header ?name:(name_ : header_name option) ?value:(value_ : header_value option) () =
  ({ name = name_; value = value_ } : http_header)

let make_http_request ?client_i_p:(client_i_p_ : ip_string option)
    ?country:(country_ : country option) ?ur_i:(ur_i_ : uri_string option)
    ?method_:(method__ : http_method option) ?http_version:(http_version_ : http_version option)
    ?headers:(headers_ : http_headers option) () =
  ({
     client_i_p = client_i_p_;
     country = country_;
     ur_i = ur_i_;
     method_ = method__;
     http_version = http_version_;
     headers = headers_;
   }
    : http_request)

let make_sampled_http_request ?timestamp:(timestamp_ : timestamp option)
    ?action:(action_ : action option)
    ?rule_name_within_rule_group:(rule_name_within_rule_group_ : entity_name option)
    ?request_headers_inserted:(request_headers_inserted_ : http_headers option)
    ?response_code_sent:(response_code_sent_ : response_status_code option)
    ?labels:(labels_ : labels option)
    ?captcha_response:(captcha_response_ : captcha_response option)
    ?challenge_response:(challenge_response_ : challenge_response option)
    ?overridden_action:(overridden_action_ : action option) ~request:(request_ : http_request)
    ~weight:(weight_ : sample_weight) () =
  ({
     request = request_;
     weight = weight_;
     timestamp = timestamp_;
     action = action_;
     rule_name_within_rule_group = rule_name_within_rule_group_;
     request_headers_inserted = request_headers_inserted_;
     response_code_sent = response_code_sent_;
     labels = labels_;
     captcha_response = captcha_response_;
     challenge_response = challenge_response_;
     overridden_action = overridden_action_;
   }
    : sampled_http_request)

let make_get_sampled_requests_response
    ?sampled_requests:(sampled_requests_ : sampled_http_requests option)
    ?population_size:(population_size_ : population_size option)
    ?time_window:(time_window_ : time_window option) () =
  ({
     sampled_requests = sampled_requests_;
     population_size = population_size_;
     time_window = time_window_;
   }
    : get_sampled_requests_response)

let make_get_sampled_requests_request ~web_acl_arn:(web_acl_arn_ : resource_arn)
    ~rule_metric_name:(rule_metric_name_ : metric_name) ~scope:(scope_ : scope)
    ~time_window:(time_window_ : time_window) ~max_items:(max_items_ : list_max_items) () =
  ({
     web_acl_arn = web_acl_arn_;
     rule_metric_name = rule_metric_name_;
     scope = scope_;
     time_window = time_window_;
     max_items = max_items_;
   }
    : get_sampled_requests_request)

let make_label_summary ?name:(name_ : label_name option) () = ({ name = name_ } : label_summary)

let make_rule_group ?description:(description_ : entity_description option)
    ?rules:(rules_ : rules option) ?label_namespace:(label_namespace_ : label_name option)
    ?custom_response_bodies:(custom_response_bodies_ : custom_response_bodies option)
    ?available_labels:(available_labels_ : label_summaries option)
    ?consumed_labels:(consumed_labels_ : label_summaries option)
    ?monetization_config:(monetization_config_ : monetization_config option)
    ~name:(name_ : entity_name) ~id:(id_ : entity_id) ~capacity:(capacity_ : capacity_unit)
    ~ar_n:(ar_n_ : resource_arn) ~visibility_config:(visibility_config_ : visibility_config) () =
  ({
     name = name_;
     id = id_;
     capacity = capacity_;
     ar_n = ar_n_;
     description = description_;
     rules = rules_;
     visibility_config = visibility_config_;
     label_namespace = label_namespace_;
     custom_response_bodies = custom_response_bodies_;
     available_labels = available_labels_;
     consumed_labels = consumed_labels_;
     monetization_config = monetization_config_;
   }
    : rule_group)

let make_get_rule_group_response ?rule_group:(rule_group_ : rule_group option)
    ?lock_token:(lock_token_ : lock_token option) () =
  ({ rule_group = rule_group_; lock_token = lock_token_ } : get_rule_group_response)

let make_get_rule_group_request ?name:(name_ : entity_name option) ?scope:(scope_ : scope option)
    ?id:(id_ : entity_id option) ?ar_n:(ar_n_ : resource_arn option) () =
  ({ name = name_; scope = scope_; id = id_; ar_n = ar_n_ } : get_rule_group_request)

let make_data_point_entry ?date:(date_ : timestamp option)
    ?monetize_served_count:(monetize_served_count_ : request_count option)
    ?settled_count:(settled_count_ : request_count option)
    ?total_amount:(total_amount_ : monetization_amount_value option)
    ?category:(category_ : filter_string option) ?intent:(intent_ : filter_string option)
    ?group_by_value:(group_by_value_ : filter_string option) () =
  ({
     date = date_;
     monetize_served_count = monetize_served_count_;
     settled_count = settled_count_;
     total_amount = total_amount_;
     category = category_;
     intent = intent_;
     group_by_value = group_by_value_;
   }
    : data_point_entry)

let make_get_revenue_statistics_time_series_response
    ?data_points:(data_points_ : data_points_list option)
    ?next_marker:(next_marker_ : next_marker option) () =
  ({ data_points = data_points_; next_marker = next_marker_ }
    : get_revenue_statistics_time_series_response)

let make_get_revenue_statistics_time_series_request ?group_by:(group_by_ : group_by_type option)
    ?filters:(filters_ : monetization_filter_list option) ?limit:(limit_ : max_data_points option)
    ?next_marker:(next_marker_ : next_marker option)
    ~statistic_type:(statistic_type_ : time_series_statistic_type)
    ~time_window:(time_window_ : time_window) ~scope:(scope_ : scope)
    ~interval:(interval_ : interval_type) ~currency:(currency_ : currency) () =
  ({
     statistic_type = statistic_type_;
     time_window = time_window_;
     scope = scope_;
     interval = interval_;
     currency = currency_;
     group_by = group_by_;
     filters = filters_;
     limit = limit_;
     next_marker = next_marker_;
   }
    : get_revenue_statistics_time_series_request)

let make_revenue_breakdown ?total_amount:(total_amount_ : monetization_amount_value option)
    ?verified_amount:(verified_amount_ : monetization_amount_value option)
    ?unverified_amount:(unverified_amount_ : monetization_amount_value option)
    ?currency:(currency_ : currency option) ?total_settled:(total_settled_ : request_count option)
    ?total_monetize_served:(total_monetize_served_ : request_count option) () =
  ({
     total_amount = total_amount_;
     verified_amount = verified_amount_;
     unverified_amount = unverified_amount_;
     currency = currency_;
     total_settled = total_settled_;
     total_monetize_served = total_monetize_served_;
   }
    : revenue_breakdown)

let make_get_revenue_statistics_summary_response
    ?revenue_breakdown:(revenue_breakdown_ : revenue_breakdown option) () =
  ({ revenue_breakdown = revenue_breakdown_ } : get_revenue_statistics_summary_response)

let make_get_revenue_statistics_summary_request
    ?filters:(filters_ : monetization_filter_list option) ~time_window:(time_window_ : time_window)
    ~scope:(scope_ : scope) ~currency:(currency_ : currency) () =
  ({ time_window = time_window_; scope = scope_; currency = currency_; filters = filters_ }
    : get_revenue_statistics_summary_request)

let make_revenue_path_statistics ~path:(path_ : path_string)
    ~percentage:(percentage_ : percentage_value) ~amount:(amount_ : monetization_amount_value)
    ~request_count:(request_count_ : request_count) () =
  ({ path = path_; percentage = percentage_; amount = amount_; request_count = request_count_ }
    : revenue_path_statistics)

let make_source_statistics ?source_category:(source_category_ : filter_string option)
    ?intent:(intent_ : filter_string option) ?organization:(organization_ : filter_string option)
    ?verified:(verified_ : verified_status option)
    ?group_by_value:(group_by_value_ : filter_string option)
    ~source_name:(source_name_ : filter_string) ~percentage:(percentage_ : percentage_value)
    ~amount:(amount_ : monetization_amount_value) ~request_count:(request_count_ : request_count) ()
    =
  ({
     source_name = source_name_;
     percentage = percentage_;
     amount = amount_;
     request_count = request_count_;
     source_category = source_category_;
     intent = intent_;
     organization = organization_;
     verified = verified_;
     group_by_value = group_by_value_;
   }
    : source_statistics)

let make_get_revenue_statistics_response
    ?source_statistics:(source_statistics_ : source_statistics_list option)
    ?revenue_path_statistics:(revenue_path_statistics_ : revenue_path_statistics_list option)
    ?next_marker:(next_marker_ : next_marker option) () =
  ({
     source_statistics = source_statistics_;
     revenue_path_statistics = revenue_path_statistics_;
     next_marker = next_marker_;
   }
    : get_revenue_statistics_response)

let make_get_revenue_statistics_request ?group_by:(group_by_ : group_by_type option)
    ?filters:(filters_ : monetization_filter_list option)
    ?next_marker:(next_marker_ : next_marker option) ?limit:(limit_ : path_statistics_limit option)
    ?sort_by:(sort_by_ : ranking_sort_by option) ?sort_order:(sort_order_ : sort_order option)
    ~statistic_type:(statistic_type_ : ranking_statistic_type)
    ~time_window:(time_window_ : time_window) ~scope:(scope_ : scope)
    ~currency:(currency_ : currency) () =
  ({
     statistic_type = statistic_type_;
     time_window = time_window_;
     scope = scope_;
     currency = currency_;
     group_by = group_by_;
     filters = filters_;
     next_marker = next_marker_;
     limit = limit_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : get_revenue_statistics_request)

let make_regex_pattern_set ?name:(name_ : entity_name option) ?id:(id_ : entity_id option)
    ?ar_n:(ar_n_ : resource_arn option) ?description:(description_ : entity_description option)
    ?regular_expression_list:(regular_expression_list_ : regular_expression_list option) () =
  ({
     name = name_;
     id = id_;
     ar_n = ar_n_;
     description = description_;
     regular_expression_list = regular_expression_list_;
   }
    : regex_pattern_set)

let make_get_regex_pattern_set_response
    ?regex_pattern_set:(regex_pattern_set_ : regex_pattern_set option)
    ?lock_token:(lock_token_ : lock_token option) () =
  ({ regex_pattern_set = regex_pattern_set_; lock_token = lock_token_ }
    : get_regex_pattern_set_response)

let make_get_regex_pattern_set_request ~name:(name_ : entity_name) ~scope:(scope_ : scope)
    ~id:(id_ : entity_id) () =
  ({ name = name_; scope = scope_; id = id_ } : get_regex_pattern_set_request)

let make_rate_based_statement_managed_keys_ip_set
    ?ip_address_version:(ip_address_version_ : ip_address_version option)
    ?addresses:(addresses_ : ip_addresses option) () =
  ({ ip_address_version = ip_address_version_; addresses = addresses_ }
    : rate_based_statement_managed_keys_ip_set)

let make_get_rate_based_statement_managed_keys_response
    ?managed_keys_ip_v4:(managed_keys_ip_v4_ : rate_based_statement_managed_keys_ip_set option)
    ?managed_keys_ip_v6:(managed_keys_ip_v6_ : rate_based_statement_managed_keys_ip_set option) () =
  ({ managed_keys_ip_v4 = managed_keys_ip_v4_; managed_keys_ip_v6 = managed_keys_ip_v6_ }
    : get_rate_based_statement_managed_keys_response)

let make_get_rate_based_statement_managed_keys_request
    ?rule_group_rule_name:(rule_group_rule_name_ : entity_name option) ~scope:(scope_ : scope)
    ~web_acl_name:(web_acl_name_ : entity_name) ~web_acl_id:(web_acl_id_ : entity_id)
    ~rule_name:(rule_name_ : entity_name) () =
  ({
     scope = scope_;
     web_acl_name = web_acl_name_;
     web_acl_id = web_acl_id_;
     rule_group_rule_name = rule_group_rule_name_;
     rule_name = rule_name_;
   }
    : get_rate_based_statement_managed_keys_request)

let make_get_permission_policy_response ?policy:(policy_ : policy_string option) () =
  ({ policy = policy_ } : get_permission_policy_response)

let make_get_permission_policy_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_permission_policy_request)

let make_mobile_sdk_release ?release_version:(release_version_ : version_key_string option)
    ?timestamp:(timestamp_ : timestamp option)
    ?release_notes:(release_notes_ : release_notes option) ?tags:(tags_ : tag_list option) () =
  ({
     release_version = release_version_;
     timestamp = timestamp_;
     release_notes = release_notes_;
     tags = tags_;
   }
    : mobile_sdk_release)

let make_get_mobile_sdk_release_response
    ?mobile_sdk_release:(mobile_sdk_release_ : mobile_sdk_release option) () =
  ({ mobile_sdk_release = mobile_sdk_release_ } : get_mobile_sdk_release_response)

let make_get_mobile_sdk_release_request ~platform:(platform_ : platform)
    ~release_version:(release_version_ : version_key_string) () =
  ({ platform = platform_; release_version = release_version_ } : get_mobile_sdk_release_request)

let make_managed_rule_set_version
    ?associated_rule_group_arn:(associated_rule_group_arn_ : resource_arn option)
    ?capacity:(capacity_ : capacity_unit option)
    ?forecasted_lifetime:(forecasted_lifetime_ : time_window_day option)
    ?publish_timestamp:(publish_timestamp_ : timestamp option)
    ?last_update_timestamp:(last_update_timestamp_ : timestamp option)
    ?expiry_timestamp:(expiry_timestamp_ : timestamp option) () =
  ({
     associated_rule_group_arn = associated_rule_group_arn_;
     capacity = capacity_;
     forecasted_lifetime = forecasted_lifetime_;
     publish_timestamp = publish_timestamp_;
     last_update_timestamp = last_update_timestamp_;
     expiry_timestamp = expiry_timestamp_;
   }
    : managed_rule_set_version)

let make_managed_rule_set ?description:(description_ : entity_description option)
    ?published_versions:(published_versions_ : published_versions option)
    ?recommended_version:(recommended_version_ : version_key_string option)
    ?label_namespace:(label_namespace_ : label_name option) ~name:(name_ : entity_name)
    ~id:(id_ : entity_id) ~ar_n:(ar_n_ : resource_arn) () =
  ({
     name = name_;
     id = id_;
     ar_n = ar_n_;
     description = description_;
     published_versions = published_versions_;
     recommended_version = recommended_version_;
     label_namespace = label_namespace_;
   }
    : managed_rule_set)

let make_get_managed_rule_set_response
    ?managed_rule_set:(managed_rule_set_ : managed_rule_set option)
    ?lock_token:(lock_token_ : lock_token option) () =
  ({ managed_rule_set = managed_rule_set_; lock_token = lock_token_ }
    : get_managed_rule_set_response)

let make_get_managed_rule_set_request ~name:(name_ : entity_name) ~scope:(scope_ : scope)
    ~id:(id_ : entity_id) () =
  ({ name = name_; scope = scope_; id = id_ } : get_managed_rule_set_request)

let make_get_logging_configuration_response
    ?logging_configuration:(logging_configuration_ : logging_configuration option) () =
  ({ logging_configuration = logging_configuration_ } : get_logging_configuration_response)

let make_get_logging_configuration_request ?log_type:(log_type_ : log_type option)
    ?log_scope:(log_scope_ : log_scope option) ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_; log_type = log_type_; log_scope = log_scope_ }
    : get_logging_configuration_request)

let make_ip_set ?description:(description_ : entity_description option) ~name:(name_ : entity_name)
    ~id:(id_ : entity_id) ~ar_n:(ar_n_ : resource_arn)
    ~ip_address_version:(ip_address_version_ : ip_address_version)
    ~addresses:(addresses_ : ip_addresses) () =
  ({
     name = name_;
     id = id_;
     ar_n = ar_n_;
     description = description_;
     ip_address_version = ip_address_version_;
     addresses = addresses_;
   }
    : ip_set)

let make_get_ip_set_response ?ip_set:(ip_set_ : ip_set option)
    ?lock_token:(lock_token_ : lock_token option) () =
  ({ ip_set = ip_set_; lock_token = lock_token_ } : get_ip_set_response)

let make_get_ip_set_request ~name:(name_ : entity_name) ~scope:(scope_ : scope)
    ~id:(id_ : entity_id) () =
  ({ name = name_; scope = scope_; id = id_ } : get_ip_set_request)

let make_get_decrypted_api_key_response ?token_domains:(token_domains_ : token_domains option)
    ?creation_timestamp:(creation_timestamp_ : timestamp option) () =
  ({ token_domains = token_domains_; creation_timestamp = creation_timestamp_ }
    : get_decrypted_api_key_response)

let make_get_decrypted_api_key_request ~scope:(scope_ : scope) ~api_key:(api_key_ : api_key) () =
  ({ scope = scope_; api_key = api_key_ } : get_decrypted_api_key_request)

let make_generate_mobile_sdk_release_url_response ?url:(url_ : download_url option) () =
  ({ url = url_ } : generate_mobile_sdk_release_url_response)

let make_generate_mobile_sdk_release_url_request ~platform:(platform_ : platform)
    ~release_version:(release_version_ : version_key_string) () =
  ({ platform = platform_; release_version = release_version_ }
    : generate_mobile_sdk_release_url_request)

let make_disassociate_web_acl_response () = (() : unit)

let make_disassociate_web_acl_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : disassociate_web_acl_request)

let make_rule_summary ?name:(name_ : entity_name option) ?action:(action_ : rule_action option) () =
  ({ name = name_; action = action_ } : rule_summary)

let make_describe_managed_rule_group_response
    ?version_name:(version_name_ : version_key_string option)
    ?sns_topic_arn:(sns_topic_arn_ : resource_arn option)
    ?capacity:(capacity_ : capacity_unit option) ?rules:(rules_ : rule_summaries option)
    ?label_namespace:(label_namespace_ : label_name option)
    ?available_labels:(available_labels_ : label_summaries option)
    ?consumed_labels:(consumed_labels_ : label_summaries option) () =
  ({
     version_name = version_name_;
     sns_topic_arn = sns_topic_arn_;
     capacity = capacity_;
     rules = rules_;
     label_namespace = label_namespace_;
     available_labels = available_labels_;
     consumed_labels = consumed_labels_;
   }
    : describe_managed_rule_group_response)

let make_describe_managed_rule_group_request
    ?version_name:(version_name_ : version_key_string option)
    ~vendor_name:(vendor_name_ : vendor_name) ~name:(name_ : entity_name) ~scope:(scope_ : scope) ()
    =
  ({ vendor_name = vendor_name_; name = name_; scope = scope_; version_name = version_name_ }
    : describe_managed_rule_group_request)

let make_managed_product_descriptor ?vendor_name:(vendor_name_ : vendor_name option)
    ?managed_rule_set_name:(managed_rule_set_name_ : entity_name option)
    ?product_id:(product_id_ : product_id option)
    ?product_link:(product_link_ : product_link option)
    ?product_title:(product_title_ : product_title option)
    ?product_description:(product_description_ : product_description option)
    ?sns_topic_arn:(sns_topic_arn_ : resource_arn option)
    ?is_versioning_supported:(is_versioning_supported_ : boolean_ option)
    ?is_advanced_managed_rule_set:(is_advanced_managed_rule_set_ : boolean_ option) () =
  ({
     vendor_name = vendor_name_;
     managed_rule_set_name = managed_rule_set_name_;
     product_id = product_id_;
     product_link = product_link_;
     product_title = product_title_;
     product_description = product_description_;
     sns_topic_arn = sns_topic_arn_;
     is_versioning_supported = is_versioning_supported_;
     is_advanced_managed_rule_set = is_advanced_managed_rule_set_;
   }
    : managed_product_descriptor)

let make_describe_managed_products_by_vendor_response
    ?managed_products:(managed_products_ : managed_product_descriptors option) () =
  ({ managed_products = managed_products_ } : describe_managed_products_by_vendor_response)

let make_describe_managed_products_by_vendor_request ~vendor_name:(vendor_name_ : vendor_name)
    ~scope:(scope_ : scope) () =
  ({ vendor_name = vendor_name_; scope = scope_ } : describe_managed_products_by_vendor_request)

let make_describe_all_managed_products_response
    ?managed_products:(managed_products_ : managed_product_descriptors option) () =
  ({ managed_products = managed_products_ } : describe_all_managed_products_response)

let make_describe_all_managed_products_request ~scope:(scope_ : scope) () =
  ({ scope = scope_ } : describe_all_managed_products_request)

let make_delete_web_acl_response () = (() : unit)

let make_delete_web_acl_request ~name:(name_ : entity_name) ~scope:(scope_ : scope)
    ~id:(id_ : entity_id) ~lock_token:(lock_token_ : lock_token) () =
  ({ name = name_; scope = scope_; id = id_; lock_token = lock_token_ } : delete_web_acl_request)

let make_delete_rule_group_response () = (() : unit)

let make_delete_rule_group_request ~name:(name_ : entity_name) ~scope:(scope_ : scope)
    ~id:(id_ : entity_id) ~lock_token:(lock_token_ : lock_token) () =
  ({ name = name_; scope = scope_; id = id_; lock_token = lock_token_ } : delete_rule_group_request)

let make_delete_regex_pattern_set_response () = (() : unit)

let make_delete_regex_pattern_set_request ~name:(name_ : entity_name) ~scope:(scope_ : scope)
    ~id:(id_ : entity_id) ~lock_token:(lock_token_ : lock_token) () =
  ({ name = name_; scope = scope_; id = id_; lock_token = lock_token_ }
    : delete_regex_pattern_set_request)

let make_delete_permission_policy_response () = (() : unit)

let make_delete_permission_policy_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : delete_permission_policy_request)

let make_delete_logging_configuration_response () = (() : unit)

let make_delete_logging_configuration_request ?log_type:(log_type_ : log_type option)
    ?log_scope:(log_scope_ : log_scope option) ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_; log_type = log_type_; log_scope = log_scope_ }
    : delete_logging_configuration_request)

let make_delete_ip_set_response () = (() : unit)

let make_delete_ip_set_request ~name:(name_ : entity_name) ~scope:(scope_ : scope)
    ~id:(id_ : entity_id) ~lock_token:(lock_token_ : lock_token) () =
  ({ name = name_; scope = scope_; id = id_; lock_token = lock_token_ } : delete_ip_set_request)

let make_delete_firewall_manager_rule_groups_response
    ?next_web_acl_lock_token:(next_web_acl_lock_token_ : lock_token option) () =
  ({ next_web_acl_lock_token = next_web_acl_lock_token_ }
    : delete_firewall_manager_rule_groups_response)

let make_delete_firewall_manager_rule_groups_request ~web_acl_arn:(web_acl_arn_ : resource_arn)
    ~web_acl_lock_token:(web_acl_lock_token_ : lock_token) () =
  ({ web_acl_arn = web_acl_arn_; web_acl_lock_token = web_acl_lock_token_ }
    : delete_firewall_manager_rule_groups_request)

let make_delete_api_key_response () = (() : unit)

let make_delete_api_key_request ~scope:(scope_ : scope) ~api_key:(api_key_ : api_key) () =
  ({ scope = scope_; api_key = api_key_ } : delete_api_key_request)

let make_create_web_acl_response ?summary:(summary_ : web_acl_summary option) () =
  ({ summary = summary_ } : create_web_acl_response)

let make_create_web_acl_request ?description:(description_ : entity_description option)
    ?rules:(rules_ : rules option)
    ?data_protection_config:(data_protection_config_ : data_protection_config option)
    ?tags:(tags_ : tag_list option)
    ?custom_response_bodies:(custom_response_bodies_ : custom_response_bodies option)
    ?captcha_config:(captcha_config_ : captcha_config option)
    ?challenge_config:(challenge_config_ : challenge_config option)
    ?token_domains:(token_domains_ : token_domains option)
    ?association_config:(association_config_ : association_config option)
    ?on_source_d_do_s_protection_config:
      (on_source_d_do_s_protection_config_ : on_source_d_do_s_protection_config option)
    ?application_config:(application_config_ : application_config option)
    ?monetization_config:(monetization_config_ : monetization_config option)
    ~name:(name_ : entity_name) ~scope:(scope_ : scope)
    ~default_action:(default_action_ : default_action)
    ~visibility_config:(visibility_config_ : visibility_config) () =
  ({
     name = name_;
     scope = scope_;
     default_action = default_action_;
     description = description_;
     rules = rules_;
     visibility_config = visibility_config_;
     data_protection_config = data_protection_config_;
     tags = tags_;
     custom_response_bodies = custom_response_bodies_;
     captcha_config = captcha_config_;
     challenge_config = challenge_config_;
     token_domains = token_domains_;
     association_config = association_config_;
     on_source_d_do_s_protection_config = on_source_d_do_s_protection_config_;
     application_config = application_config_;
     monetization_config = monetization_config_;
   }
    : create_web_acl_request)

let make_create_rule_group_response ?summary:(summary_ : rule_group_summary option) () =
  ({ summary = summary_ } : create_rule_group_response)

let make_create_rule_group_request ?description:(description_ : entity_description option)
    ?rules:(rules_ : rules option) ?tags:(tags_ : tag_list option)
    ?custom_response_bodies:(custom_response_bodies_ : custom_response_bodies option)
    ?monetization_config:(monetization_config_ : monetization_config option)
    ~name:(name_ : entity_name) ~scope:(scope_ : scope) ~capacity:(capacity_ : capacity_unit)
    ~visibility_config:(visibility_config_ : visibility_config) () =
  ({
     name = name_;
     scope = scope_;
     capacity = capacity_;
     description = description_;
     rules = rules_;
     visibility_config = visibility_config_;
     tags = tags_;
     custom_response_bodies = custom_response_bodies_;
     monetization_config = monetization_config_;
   }
    : create_rule_group_request)

let make_create_regex_pattern_set_response ?summary:(summary_ : regex_pattern_set_summary option) ()
    =
  ({ summary = summary_ } : create_regex_pattern_set_response)

let make_create_regex_pattern_set_request ?description:(description_ : entity_description option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : entity_name) ~scope:(scope_ : scope)
    ~regular_expression_list:(regular_expression_list_ : regular_expression_list) () =
  ({
     name = name_;
     scope = scope_;
     description = description_;
     regular_expression_list = regular_expression_list_;
     tags = tags_;
   }
    : create_regex_pattern_set_request)

let make_create_ip_set_response ?summary:(summary_ : ip_set_summary option) () =
  ({ summary = summary_ } : create_ip_set_response)

let make_create_ip_set_request ?description:(description_ : entity_description option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : entity_name) ~scope:(scope_ : scope)
    ~ip_address_version:(ip_address_version_ : ip_address_version)
    ~addresses:(addresses_ : ip_addresses) () =
  ({
     name = name_;
     scope = scope_;
     description = description_;
     ip_address_version = ip_address_version_;
     addresses = addresses_;
     tags = tags_;
   }
    : create_ip_set_request)

let make_create_api_key_response ?api_key:(api_key_ : api_key option) () =
  ({ api_key = api_key_ } : create_api_key_response)

let make_create_api_key_request ~scope:(scope_ : scope)
    ~token_domains:(token_domains_ : api_key_token_domains) () =
  ({ scope = scope_; token_domains = token_domains_ } : create_api_key_request)

let make_check_capacity_response ?capacity:(capacity_ : consumed_capacity option) () =
  ({ capacity = capacity_ } : check_capacity_response)

let make_check_capacity_request ~scope:(scope_ : scope) ~rules:(rules_ : rules) () =
  ({ scope = scope_; rules = rules_ } : check_capacity_request)

let make_associate_web_acl_response () = (() : unit)

let make_associate_web_acl_request ~web_acl_arn:(web_acl_arn_ : resource_arn)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ web_acl_arn = web_acl_arn_; resource_arn = resource_arn_ } : associate_web_acl_request)
