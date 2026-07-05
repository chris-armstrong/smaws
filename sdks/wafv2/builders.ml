open Types

let make_single_header ~name:(name_ : field_to_match_data) () = ({ name = name_ } : single_header)

let make_single_query_argument ~name:(name_ : field_to_match_data) () =
  ({ name = name_ } : single_query_argument)

let make_all_query_arguments () = (() : unit)
let make_uri_path () = (() : unit)
let make_query_string () = (() : unit)

let make_body ?oversize_handling:(oversize_handling_ : oversize_handling option) () =
  ({ oversize_handling = oversize_handling_ } : body)

let make_method_ () = (() : unit)
let make_all () = (() : unit)

let make_json_match_pattern ?included_paths:(included_paths_ : json_pointer_paths option)
    ?all:(all_ : all option) () =
  ({ included_paths = included_paths_; all = all_ } : json_match_pattern)

let make_json_body ?oversize_handling:(oversize_handling_ : oversize_handling option)
    ?invalid_fallback_behavior:(invalid_fallback_behavior_ : body_parsing_fallback_behavior option)
    ~match_scope:(match_scope_ : json_match_scope)
    ~match_pattern:(match_pattern_ : json_match_pattern) () =
  ({
     oversize_handling = oversize_handling_;
     invalid_fallback_behavior = invalid_fallback_behavior_;
     match_scope = match_scope_;
     match_pattern = match_pattern_;
   }
    : json_body)

let make_header_match_pattern ?excluded_headers:(excluded_headers_ : header_names option)
    ?included_headers:(included_headers_ : header_names option) ?all:(all_ : all option) () =
  ({ excluded_headers = excluded_headers_; included_headers = included_headers_; all = all_ }
    : header_match_pattern)

let make_headers ~oversize_handling:(oversize_handling_ : oversize_handling)
    ~match_scope:(match_scope_ : map_match_scope)
    ~match_pattern:(match_pattern_ : header_match_pattern) () =
  ({
     oversize_handling = oversize_handling_;
     match_scope = match_scope_;
     match_pattern = match_pattern_;
   }
    : headers)

let make_cookie_match_pattern ?excluded_cookies:(excluded_cookies_ : cookie_names option)
    ?included_cookies:(included_cookies_ : cookie_names option) ?all:(all_ : all option) () =
  ({ excluded_cookies = excluded_cookies_; included_cookies = included_cookies_; all = all_ }
    : cookie_match_pattern)

let make_cookies ~oversize_handling:(oversize_handling_ : oversize_handling)
    ~match_scope:(match_scope_ : map_match_scope)
    ~match_pattern:(match_pattern_ : cookie_match_pattern) () =
  ({
     oversize_handling = oversize_handling_;
     match_scope = match_scope_;
     match_pattern = match_pattern_;
   }
    : cookies)

let make_header_order ~oversize_handling:(oversize_handling_ : oversize_handling) () =
  ({ oversize_handling = oversize_handling_ } : header_order)

let make_ja3_fingerprint ~fallback_behavior:(fallback_behavior_ : fallback_behavior) () =
  ({ fallback_behavior = fallback_behavior_ } : ja3_fingerprint)

let make_ja4_fingerprint ~fallback_behavior:(fallback_behavior_ : fallback_behavior) () =
  ({ fallback_behavior = fallback_behavior_ } : ja4_fingerprint)

let make_uri_fragment ?fallback_behavior:(fallback_behavior_ : fallback_behavior option) () =
  ({ fallback_behavior = fallback_behavior_ } : uri_fragment)

let make_field_to_match ?uri_fragment:(uri_fragment_ : uri_fragment option)
    ?ja4_fingerprint:(ja4_fingerprint_ : ja4_fingerprint option)
    ?ja3_fingerprint:(ja3_fingerprint_ : ja3_fingerprint option)
    ?header_order:(header_order_ : header_order option) ?cookies:(cookies_ : cookies option)
    ?headers:(headers_ : headers option) ?json_body:(json_body_ : json_body option)
    ?method_:(method__ : method_ option) ?body:(body_ : body option)
    ?query_string:(query_string_ : query_string option) ?uri_path:(uri_path_ : uri_path option)
    ?all_query_arguments:(all_query_arguments_ : all_query_arguments option)
    ?single_query_argument:(single_query_argument_ : single_query_argument option)
    ?single_header:(single_header_ : single_header option) () =
  ({
     uri_fragment = uri_fragment_;
     ja4_fingerprint = ja4_fingerprint_;
     ja3_fingerprint = ja3_fingerprint_;
     header_order = header_order_;
     cookies = cookies_;
     headers = headers_;
     json_body = json_body_;
     method_ = method__;
     body = body_;
     query_string = query_string_;
     uri_path = uri_path_;
     all_query_arguments = all_query_arguments_;
     single_query_argument = single_query_argument_;
     single_header = single_header_;
   }
    : field_to_match)

let make_text_transformation ~type_:(type__ : text_transformation_type)
    ~priority:(priority_ : text_transformation_priority) () =
  ({ type_ = type__; priority = priority_ } : text_transformation)

let make_xss_match_statement ~text_transformations:(text_transformations_ : text_transformations)
    ~field_to_match:(field_to_match_ : field_to_match) () =
  ({ text_transformations = text_transformations_; field_to_match = field_to_match_ }
    : xss_match_statement)

let make_web_acl_summary ?ar_n:(ar_n_ : resource_arn option)
    ?lock_token:(lock_token_ : lock_token option)
    ?description:(description_ : entity_description option) ?id:(id_ : entity_id option)
    ?name:(name_ : entity_name option) () =
  ({ ar_n = ar_n_; lock_token = lock_token_; description = description_; id = id_; name = name_ }
    : web_acl_summary)

let make_custom_http_header ~value:(value_ : custom_http_header_value)
    ~name:(name_ : custom_http_header_name) () =
  ({ value = value_; name = name_ } : custom_http_header)

let make_custom_response ?response_headers:(response_headers_ : custom_http_headers option)
    ?custom_response_body_key:(custom_response_body_key_ : entity_name option)
    ~response_code:(response_code_ : response_status_code) () =
  ({
     response_headers = response_headers_;
     custom_response_body_key = custom_response_body_key_;
     response_code = response_code_;
   }
    : custom_response)

let make_block_action ?custom_response:(custom_response_ : custom_response option) () =
  ({ custom_response = custom_response_ } : block_action)

let make_custom_request_handling ~insert_headers:(insert_headers_ : custom_http_headers) () =
  ({ insert_headers = insert_headers_ } : custom_request_handling)

let make_allow_action
    ?custom_request_handling:(custom_request_handling_ : custom_request_handling option) () =
  ({ custom_request_handling = custom_request_handling_ } : allow_action)

let make_default_action ?allow:(allow_ : allow_action option) ?block:(block_ : block_action option)
    () =
  ({ allow = allow_; block = block_ } : default_action)

let make_byte_match_statement
    ~positional_constraint:(positional_constraint_ : positional_constraint)
    ~text_transformations:(text_transformations_ : text_transformations)
    ~field_to_match:(field_to_match_ : field_to_match)
    ~search_string:(search_string_ : search_string) () =
  ({
     positional_constraint = positional_constraint_;
     text_transformations = text_transformations_;
     field_to_match = field_to_match_;
     search_string = search_string_;
   }
    : byte_match_statement)

let make_sqli_match_statement ?sensitivity_level:(sensitivity_level_ : sensitivity_level option)
    ~text_transformations:(text_transformations_ : text_transformations)
    ~field_to_match:(field_to_match_ : field_to_match) () =
  ({
     sensitivity_level = sensitivity_level_;
     text_transformations = text_transformations_;
     field_to_match = field_to_match_;
   }
    : sqli_match_statement)

let make_size_constraint_statement
    ~text_transformations:(text_transformations_ : text_transformations) ~size:(size_ : size)
    ~comparison_operator:(comparison_operator_ : comparison_operator)
    ~field_to_match:(field_to_match_ : field_to_match) () =
  ({
     text_transformations = text_transformations_;
     size = size_;
     comparison_operator = comparison_operator_;
     field_to_match = field_to_match_;
   }
    : size_constraint_statement)

let make_forwarded_ip_config ~fallback_behavior:(fallback_behavior_ : fallback_behavior)
    ~header_name:(header_name_ : forwarded_ip_header_name) () =
  ({ fallback_behavior = fallback_behavior_; header_name = header_name_ } : forwarded_ip_config)

let make_geo_match_statement
    ?forwarded_ip_config:(forwarded_ip_config_ : forwarded_ip_config option)
    ?country_codes:(country_codes_ : country_codes option) () =
  ({ forwarded_ip_config = forwarded_ip_config_; country_codes = country_codes_ }
    : geo_match_statement)

let make_excluded_rule ~name:(name_ : entity_name) () = ({ name = name_ } : excluded_rule)

let make_count_action
    ?custom_request_handling:(custom_request_handling_ : custom_request_handling option) () =
  ({ custom_request_handling = custom_request_handling_ } : count_action)

let make_captcha_action
    ?custom_request_handling:(custom_request_handling_ : custom_request_handling option) () =
  ({ custom_request_handling = custom_request_handling_ } : captcha_action)

let make_challenge_action
    ?custom_request_handling:(custom_request_handling_ : custom_request_handling option) () =
  ({ custom_request_handling = custom_request_handling_ } : challenge_action)

let make_rule_action ?challenge:(challenge_ : challenge_action option)
    ?captcha:(captcha_ : captcha_action option) ?count:(count_ : count_action option)
    ?allow:(allow_ : allow_action option) ?block:(block_ : block_action option) () =
  ({ challenge = challenge_; captcha = captcha_; count = count_; allow = allow_; block = block_ }
    : rule_action)

let make_rule_action_override ~action_to_use:(action_to_use_ : rule_action)
    ~name:(name_ : entity_name) () =
  ({ action_to_use = action_to_use_; name = name_ } : rule_action_override)

let make_rule_group_reference_statement
    ?rule_action_overrides:(rule_action_overrides_ : rule_action_overrides option)
    ?excluded_rules:(excluded_rules_ : excluded_rules option) ~ar_n:(ar_n_ : resource_arn) () =
  ({
     rule_action_overrides = rule_action_overrides_;
     excluded_rules = excluded_rules_;
     ar_n = ar_n_;
   }
    : rule_group_reference_statement)

let make_ip_set_forwarded_ip_config ~position:(position_ : forwarded_ip_position)
    ~fallback_behavior:(fallback_behavior_ : fallback_behavior)
    ~header_name:(header_name_ : forwarded_ip_header_name) () =
  ({ position = position_; fallback_behavior = fallback_behavior_; header_name = header_name_ }
    : ip_set_forwarded_ip_config)

let make_ip_set_reference_statement
    ?ip_set_forwarded_ip_config:(ip_set_forwarded_ip_config_ : ip_set_forwarded_ip_config option)
    ~ar_n:(ar_n_ : resource_arn) () =
  ({ ip_set_forwarded_ip_config = ip_set_forwarded_ip_config_; ar_n = ar_n_ }
    : ip_set_reference_statement)

let make_regex_pattern_set_reference_statement
    ~text_transformations:(text_transformations_ : text_transformations)
    ~field_to_match:(field_to_match_ : field_to_match) ~ar_n:(ar_n_ : resource_arn) () =
  ({ text_transformations = text_transformations_; field_to_match = field_to_match_; ar_n = ar_n_ }
    : regex_pattern_set_reference_statement)

let make_rate_limit_header ~text_transformations:(text_transformations_ : text_transformations)
    ~name:(name_ : field_to_match_data) () =
  ({ text_transformations = text_transformations_; name = name_ } : rate_limit_header)

let make_rate_limit_cookie ~text_transformations:(text_transformations_ : text_transformations)
    ~name:(name_ : field_to_match_data) () =
  ({ text_transformations = text_transformations_; name = name_ } : rate_limit_cookie)

let make_rate_limit_query_argument
    ~text_transformations:(text_transformations_ : text_transformations)
    ~name:(name_ : field_to_match_data) () =
  ({ text_transformations = text_transformations_; name = name_ } : rate_limit_query_argument)

let make_rate_limit_query_string
    ~text_transformations:(text_transformations_ : text_transformations) () =
  ({ text_transformations = text_transformations_ } : rate_limit_query_string)

let make_rate_limit_http_method () = (() : unit)
let make_rate_limit_forwarded_i_p () = (() : unit)
let make_rate_limit_i_p () = (() : unit)

let make_rate_limit_label_namespace ~namespace:(namespace_ : label_namespace) () =
  ({ namespace = namespace_ } : rate_limit_label_namespace)

let make_rate_limit_uri_path ~text_transformations:(text_transformations_ : text_transformations) ()
    =
  ({ text_transformations = text_transformations_ } : rate_limit_uri_path)

let make_rate_limit_ja3_fingerprint ~fallback_behavior:(fallback_behavior_ : fallback_behavior) () =
  ({ fallback_behavior = fallback_behavior_ } : rate_limit_ja3_fingerprint)

let make_rate_limit_ja4_fingerprint ~fallback_behavior:(fallback_behavior_ : fallback_behavior) () =
  ({ fallback_behavior = fallback_behavior_ } : rate_limit_ja4_fingerprint)

let make_rate_limit_asn () = (() : unit)

let make_rate_based_statement_custom_key ?as_n:(as_n_ : rate_limit_asn option)
    ?ja4_fingerprint:(ja4_fingerprint_ : rate_limit_ja4_fingerprint option)
    ?ja3_fingerprint:(ja3_fingerprint_ : rate_limit_ja3_fingerprint option)
    ?uri_path:(uri_path_ : rate_limit_uri_path option)
    ?label_namespace:(label_namespace_ : rate_limit_label_namespace option)
    ?i_p:(i_p_ : rate_limit_i_p option)
    ?forwarded_i_p:(forwarded_i_p_ : rate_limit_forwarded_i_p option)
    ?http_method:(http_method_ : rate_limit_http_method option)
    ?query_string:(query_string_ : rate_limit_query_string option)
    ?query_argument:(query_argument_ : rate_limit_query_argument option)
    ?cookie:(cookie_ : rate_limit_cookie option) ?header:(header_ : rate_limit_header option) () =
  ({
     as_n = as_n_;
     ja4_fingerprint = ja4_fingerprint_;
     ja3_fingerprint = ja3_fingerprint_;
     uri_path = uri_path_;
     label_namespace = label_namespace_;
     i_p = i_p_;
     forwarded_i_p = forwarded_i_p_;
     http_method = http_method_;
     query_string = query_string_;
     query_argument = query_argument_;
     cookie = cookie_;
     header = header_;
   }
    : rate_based_statement_custom_key)

let make_username_field ~identifier:(identifier_ : field_identifier) () =
  ({ identifier = identifier_ } : username_field)

let make_password_field ~identifier:(identifier_ : field_identifier) () =
  ({ identifier = identifier_ } : password_field)

let make_aws_managed_rules_bot_control_rule_set
    ?enable_machine_learning:(enable_machine_learning_ : enable_machine_learning option)
    ~inspection_level:(inspection_level_ : inspection_level) () =
  ({ enable_machine_learning = enable_machine_learning_; inspection_level = inspection_level_ }
    : aws_managed_rules_bot_control_rule_set)

let make_request_inspection ~password_field:(password_field_ : password_field)
    ~username_field:(username_field_ : username_field) ~payload_type:(payload_type_ : payload_type)
    () =
  ({
     password_field = password_field_;
     username_field = username_field_;
     payload_type = payload_type_;
   }
    : request_inspection)

let make_response_inspection_status_code
    ~failure_codes:(failure_codes_ : response_inspection_status_code_failure_codes)
    ~success_codes:(success_codes_ : response_inspection_status_code_success_codes) () =
  ({ failure_codes = failure_codes_; success_codes = success_codes_ }
    : response_inspection_status_code)

let make_response_inspection_header
    ~failure_values:(failure_values_ : response_inspection_header_failure_values)
    ~success_values:(success_values_ : response_inspection_header_success_values)
    ~name:(name_ : response_inspection_header_name) () =
  ({ failure_values = failure_values_; success_values = success_values_; name = name_ }
    : response_inspection_header)

let make_response_inspection_body_contains
    ~failure_strings:(failure_strings_ : response_inspection_body_contains_failure_strings)
    ~success_strings:(success_strings_ : response_inspection_body_contains_success_strings) () =
  ({ failure_strings = failure_strings_; success_strings = success_strings_ }
    : response_inspection_body_contains)

let make_response_inspection_json
    ~failure_values:(failure_values_ : response_inspection_json_failure_values)
    ~success_values:(success_values_ : response_inspection_json_success_values)
    ~identifier:(identifier_ : field_identifier) () =
  ({ failure_values = failure_values_; success_values = success_values_; identifier = identifier_ }
    : response_inspection_json)

let make_response_inspection ?json:(json_ : response_inspection_json option)
    ?body_contains:(body_contains_ : response_inspection_body_contains option)
    ?header:(header_ : response_inspection_header option)
    ?status_code:(status_code_ : response_inspection_status_code option) () =
  ({ json = json_; body_contains = body_contains_; header = header_; status_code = status_code_ }
    : response_inspection)

let make_aws_managed_rules_atp_rule_set
    ?enable_regex_in_path:(enable_regex_in_path_ : boolean_ option)
    ?response_inspection:(response_inspection_ : response_inspection option)
    ?request_inspection:(request_inspection_ : request_inspection option)
    ~login_path:(login_path_ : string_) () =
  ({
     enable_regex_in_path = enable_regex_in_path_;
     response_inspection = response_inspection_;
     request_inspection = request_inspection_;
     login_path = login_path_;
   }
    : aws_managed_rules_atp_rule_set)

let make_email_field ~identifier:(identifier_ : field_identifier) () =
  ({ identifier = identifier_ } : email_field)

let make_phone_number_field ~identifier:(identifier_ : field_identifier) () =
  ({ identifier = identifier_ } : phone_number_field)

let make_address_field ~identifier:(identifier_ : field_identifier) () =
  ({ identifier = identifier_ } : address_field)

let make_request_inspection_acf_p ?address_fields:(address_fields_ : address_fields option)
    ?phone_number_fields:(phone_number_fields_ : phone_number_fields option)
    ?email_field:(email_field_ : email_field option)
    ?password_field:(password_field_ : password_field option)
    ?username_field:(username_field_ : username_field option)
    ~payload_type:(payload_type_ : payload_type) () =
  ({
     address_fields = address_fields_;
     phone_number_fields = phone_number_fields_;
     email_field = email_field_;
     password_field = password_field_;
     username_field = username_field_;
     payload_type = payload_type_;
   }
    : request_inspection_acf_p)

let make_aws_managed_rules_acfp_rule_set
    ?enable_regex_in_path:(enable_regex_in_path_ : boolean_ option)
    ?response_inspection:(response_inspection_ : response_inspection option)
    ~request_inspection:(request_inspection_ : request_inspection_acf_p)
    ~registration_page_path:(registration_page_path_ : registration_page_path_string)
    ~creation_path:(creation_path_ : creation_path_string) () =
  ({
     enable_regex_in_path = enable_regex_in_path_;
     response_inspection = response_inspection_;
     request_inspection = request_inspection_;
     registration_page_path = registration_page_path_;
     creation_path = creation_path_;
   }
    : aws_managed_rules_acfp_rule_set)

let make_regex ?regex_string:(regex_string_ : regex_pattern_string option) () =
  ({ regex_string = regex_string_ } : regex)

let make_client_side_action
    ?exempt_uri_regular_expressions:
      (exempt_uri_regular_expressions_ : regular_expression_list option)
    ?sensitivity:(sensitivity_ : sensitivity_to_act option)
    ~usage_of_action:(usage_of_action_ : usage_of_action) () =
  ({
     exempt_uri_regular_expressions = exempt_uri_regular_expressions_;
     sensitivity = sensitivity_;
     usage_of_action = usage_of_action_;
   }
    : client_side_action)

let make_client_side_action_config ~challenge:(challenge_ : client_side_action) () =
  ({ challenge = challenge_ } : client_side_action_config)

let make_aws_managed_rules_anti_d_do_s_rule_set
    ?sensitivity_to_block:(sensitivity_to_block_ : sensitivity_to_act option)
    ~client_side_action_config:(client_side_action_config_ : client_side_action_config) () =
  ({
     sensitivity_to_block = sensitivity_to_block_;
     client_side_action_config = client_side_action_config_;
   }
    : aws_managed_rules_anti_d_do_s_rule_set)

let make_managed_rule_group_config
    ?aws_managed_rules_anti_d_do_s_rule_set:
      (aws_managed_rules_anti_d_do_s_rule_set_ : aws_managed_rules_anti_d_do_s_rule_set option)
    ?aws_managed_rules_acfp_rule_set:
      (aws_managed_rules_acfp_rule_set_ : aws_managed_rules_acfp_rule_set option)
    ?aws_managed_rules_atp_rule_set:
      (aws_managed_rules_atp_rule_set_ : aws_managed_rules_atp_rule_set option)
    ?aws_managed_rules_bot_control_rule_set:
      (aws_managed_rules_bot_control_rule_set_ : aws_managed_rules_bot_control_rule_set option)
    ?password_field:(password_field_ : password_field option)
    ?username_field:(username_field_ : username_field option)
    ?payload_type:(payload_type_ : payload_type option)
    ?login_path:(login_path_ : login_path_string option) () =
  ({
     aws_managed_rules_anti_d_do_s_rule_set = aws_managed_rules_anti_d_do_s_rule_set_;
     aws_managed_rules_acfp_rule_set = aws_managed_rules_acfp_rule_set_;
     aws_managed_rules_atp_rule_set = aws_managed_rules_atp_rule_set_;
     aws_managed_rules_bot_control_rule_set = aws_managed_rules_bot_control_rule_set_;
     password_field = password_field_;
     username_field = username_field_;
     payload_type = payload_type_;
     login_path = login_path_;
   }
    : managed_rule_group_config)

let make_label_match_statement ~key:(key_ : label_match_key) ~scope:(scope_ : label_match_scope) ()
    =
  ({ key = key_; scope = scope_ } : label_match_statement)

let make_regex_match_statement ~text_transformations:(text_transformations_ : text_transformations)
    ~field_to_match:(field_to_match_ : field_to_match)
    ~regex_string:(regex_string_ : regex_pattern_string) () =
  ({
     text_transformations = text_transformations_;
     field_to_match = field_to_match_;
     regex_string = regex_string_;
   }
    : regex_match_statement)

let make_asn_match_statement
    ?forwarded_ip_config:(forwarded_ip_config_ : forwarded_ip_config option)
    ~asn_list:(asn_list_ : asn_list) () =
  ({ forwarded_ip_config = forwarded_ip_config_; asn_list = asn_list_ } : asn_match_statement)

let make_and_statement ~statements:(statements_ : statements) () =
  ({ statements = statements_ } : and_statement)

let make_managed_rule_group_statement
    ?rule_action_overrides:(rule_action_overrides_ : rule_action_overrides option)
    ?managed_rule_group_configs:(managed_rule_group_configs_ : managed_rule_group_configs option)
    ?scope_down_statement:(scope_down_statement_ : statement option)
    ?excluded_rules:(excluded_rules_ : excluded_rules option)
    ?version:(version_ : version_key_string option) ~name:(name_ : entity_name)
    ~vendor_name:(vendor_name_ : vendor_name) () =
  ({
     rule_action_overrides = rule_action_overrides_;
     managed_rule_group_configs = managed_rule_group_configs_;
     scope_down_statement = scope_down_statement_;
     excluded_rules = excluded_rules_;
     version = version_;
     name = name_;
     vendor_name = vendor_name_;
   }
    : managed_rule_group_statement)

let make_not_statement ~statement:(statement_ : statement) () =
  ({ statement = statement_ } : not_statement)

let make_or_statement ~statements:(statements_ : statements) () =
  ({ statements = statements_ } : or_statement)

let make_rate_based_statement ?custom_keys:(custom_keys_ : rate_based_statement_custom_keys option)
    ?forwarded_ip_config:(forwarded_ip_config_ : forwarded_ip_config option)
    ?scope_down_statement:(scope_down_statement_ : statement option)
    ?evaluation_window_sec:(evaluation_window_sec_ : evaluation_window_sec option)
    ~aggregate_key_type:(aggregate_key_type_ : rate_based_statement_aggregate_key_type)
    ~limit:(limit_ : rate_limit) () =
  ({
     custom_keys = custom_keys_;
     forwarded_ip_config = forwarded_ip_config_;
     scope_down_statement = scope_down_statement_;
     aggregate_key_type = aggregate_key_type_;
     evaluation_window_sec = evaluation_window_sec_;
     limit = limit_;
   }
    : rate_based_statement)

let make_statement ?asn_match_statement:(asn_match_statement_ : asn_match_statement option)
    ?regex_match_statement:(regex_match_statement_ : regex_match_statement option)
    ?label_match_statement:(label_match_statement_ : label_match_statement option)
    ?managed_rule_group_statement:
      (managed_rule_group_statement_ : managed_rule_group_statement option)
    ?not_statement:(not_statement_ : not_statement option)
    ?or_statement:(or_statement_ : or_statement option)
    ?and_statement:(and_statement_ : and_statement option)
    ?rate_based_statement:(rate_based_statement_ : rate_based_statement option)
    ?regex_pattern_set_reference_statement:
      (regex_pattern_set_reference_statement_ : regex_pattern_set_reference_statement option)
    ?ip_set_reference_statement:(ip_set_reference_statement_ : ip_set_reference_statement option)
    ?rule_group_reference_statement:
      (rule_group_reference_statement_ : rule_group_reference_statement option)
    ?geo_match_statement:(geo_match_statement_ : geo_match_statement option)
    ?size_constraint_statement:(size_constraint_statement_ : size_constraint_statement option)
    ?xss_match_statement:(xss_match_statement_ : xss_match_statement option)
    ?sqli_match_statement:(sqli_match_statement_ : sqli_match_statement option)
    ?byte_match_statement:(byte_match_statement_ : byte_match_statement option) () =
  ({
     asn_match_statement = asn_match_statement_;
     regex_match_statement = regex_match_statement_;
     label_match_statement = label_match_statement_;
     managed_rule_group_statement = managed_rule_group_statement_;
     not_statement = not_statement_;
     or_statement = or_statement_;
     and_statement = and_statement_;
     rate_based_statement = rate_based_statement_;
     regex_pattern_set_reference_statement = regex_pattern_set_reference_statement_;
     ip_set_reference_statement = ip_set_reference_statement_;
     rule_group_reference_statement = rule_group_reference_statement_;
     geo_match_statement = geo_match_statement_;
     size_constraint_statement = size_constraint_statement_;
     xss_match_statement = xss_match_statement_;
     sqli_match_statement = sqli_match_statement_;
     byte_match_statement = byte_match_statement_;
   }
    : statement)

let make_none_action () = (() : unit)

let make_override_action ?none:(none_ : none_action option) ?count:(count_ : count_action option) ()
    =
  ({ none = none_; count = count_ } : override_action)

let make_label ~name:(name_ : label_name) () = ({ name = name_ } : label)

let make_visibility_config ~metric_name:(metric_name_ : metric_name)
    ~cloud_watch_metrics_enabled:(cloud_watch_metrics_enabled_ : boolean_)
    ~sampled_requests_enabled:(sampled_requests_enabled_ : boolean_) () =
  ({
     metric_name = metric_name_;
     cloud_watch_metrics_enabled = cloud_watch_metrics_enabled_;
     sampled_requests_enabled = sampled_requests_enabled_;
   }
    : visibility_config)

let make_immunity_time_property ~immunity_time:(immunity_time_ : time_window_second) () =
  ({ immunity_time = immunity_time_ } : immunity_time_property)

let make_captcha_config
    ?immunity_time_property:(immunity_time_property_ : immunity_time_property option) () =
  ({ immunity_time_property = immunity_time_property_ } : captcha_config)

let make_challenge_config
    ?immunity_time_property:(immunity_time_property_ : immunity_time_property option) () =
  ({ immunity_time_property = immunity_time_property_ } : challenge_config)

let make_rule ?challenge_config:(challenge_config_ : challenge_config option)
    ?captcha_config:(captcha_config_ : captcha_config option)
    ?rule_labels:(rule_labels_ : labels option)
    ?override_action:(override_action_ : override_action option)
    ?action:(action_ : rule_action option)
    ~visibility_config:(visibility_config_ : visibility_config) ~statement:(statement_ : statement)
    ~priority:(priority_ : rule_priority) ~name:(name_ : entity_name) () =
  ({
     challenge_config = challenge_config_;
     captcha_config = captcha_config_;
     visibility_config = visibility_config_;
     rule_labels = rule_labels_;
     override_action = override_action_;
     action = action_;
     statement = statement_;
     priority = priority_;
     name = name_;
   }
    : rule)

let make_field_to_protect ?field_keys:(field_keys_ : field_to_protect_keys option)
    ~field_type:(field_type_ : field_to_protect_type) () =
  ({ field_keys = field_keys_; field_type = field_type_ } : field_to_protect)

let make_data_protection ?exclude_rate_based_details:(exclude_rate_based_details_ : boolean_ option)
    ?exclude_rule_match_details:(exclude_rule_match_details_ : boolean_ option)
    ~action:(action_ : data_protection_action) ~field:(field_ : field_to_protect) () =
  ({
     exclude_rate_based_details = exclude_rate_based_details_;
     exclude_rule_match_details = exclude_rule_match_details_;
     action = action_;
     field = field_;
   }
    : data_protection)

let make_data_protection_config ~data_protections:(data_protections_ : data_protections) () =
  ({ data_protections = data_protections_ } : data_protection_config)

let make_firewall_manager_statement
    ?rule_group_reference_statement:
      (rule_group_reference_statement_ : rule_group_reference_statement option)
    ?managed_rule_group_statement:
      (managed_rule_group_statement_ : managed_rule_group_statement option) () =
  ({
     rule_group_reference_statement = rule_group_reference_statement_;
     managed_rule_group_statement = managed_rule_group_statement_;
   }
    : firewall_manager_statement)

let make_firewall_manager_rule_group ~visibility_config:(visibility_config_ : visibility_config)
    ~override_action:(override_action_ : override_action)
    ~firewall_manager_statement:(firewall_manager_statement_ : firewall_manager_statement)
    ~priority:(priority_ : rule_priority) ~name:(name_ : entity_name) () =
  ({
     visibility_config = visibility_config_;
     override_action = override_action_;
     firewall_manager_statement = firewall_manager_statement_;
     priority = priority_;
     name = name_;
   }
    : firewall_manager_rule_group)

let make_custom_response_body ~content:(content_ : response_content)
    ~content_type:(content_type_ : response_content_type) () =
  ({ content = content_; content_type = content_type_ } : custom_response_body)

let make_request_body_associated_resource_type_config
    ~default_size_inspection_limit:(default_size_inspection_limit_ : size_inspection_limit) () =
  ({ default_size_inspection_limit = default_size_inspection_limit_ }
    : request_body_associated_resource_type_config)

let make_association_config ?request_body:(request_body_ : request_body option) () =
  ({ request_body = request_body_ } : association_config)

let make_on_source_d_do_s_protection_config
    ~alb_low_reputation_mode:(alb_low_reputation_mode_ : low_reputation_mode) () =
  ({ alb_low_reputation_mode = alb_low_reputation_mode_ } : on_source_d_do_s_protection_config)

let make_application_attribute ?values:(values_ : attribute_values option)
    ?name:(name_ : attribute_name option) () =
  ({ values = values_; name = name_ } : application_attribute)

let make_application_config ?attributes:(attributes_ : application_attributes option) () =
  ({ attributes = attributes_ } : application_config)

let make_web_ac_l ?application_config:(application_config_ : application_config option)
    ?on_source_d_do_s_protection_config:
      (on_source_d_do_s_protection_config_ : on_source_d_do_s_protection_config option)
    ?retrofitted_by_firewall_manager:(retrofitted_by_firewall_manager_ : boolean_ option)
    ?association_config:(association_config_ : association_config option)
    ?token_domains:(token_domains_ : token_domains option)
    ?challenge_config:(challenge_config_ : challenge_config option)
    ?captcha_config:(captcha_config_ : captcha_config option)
    ?custom_response_bodies:(custom_response_bodies_ : custom_response_bodies option)
    ?label_namespace:(label_namespace_ : label_name option)
    ?managed_by_firewall_manager:(managed_by_firewall_manager_ : boolean_ option)
    ?post_process_firewall_manager_rule_groups:
      (post_process_firewall_manager_rule_groups_ : firewall_manager_rule_groups option)
    ?pre_process_firewall_manager_rule_groups:
      (pre_process_firewall_manager_rule_groups_ : firewall_manager_rule_groups option)
    ?capacity:(capacity_ : consumed_capacity option)
    ?data_protection_config:(data_protection_config_ : data_protection_config option)
    ?rules:(rules_ : rules option) ?description:(description_ : entity_description option)
    ~visibility_config:(visibility_config_ : visibility_config)
    ~default_action:(default_action_ : default_action) ~ar_n:(ar_n_ : resource_arn)
    ~id:(id_ : entity_id) ~name:(name_ : entity_name) () =
  ({
     application_config = application_config_;
     on_source_d_do_s_protection_config = on_source_d_do_s_protection_config_;
     retrofitted_by_firewall_manager = retrofitted_by_firewall_manager_;
     association_config = association_config_;
     token_domains = token_domains_;
     challenge_config = challenge_config_;
     captcha_config = captcha_config_;
     custom_response_bodies = custom_response_bodies_;
     label_namespace = label_namespace_;
     managed_by_firewall_manager = managed_by_firewall_manager_;
     post_process_firewall_manager_rule_groups = post_process_firewall_manager_rule_groups_;
     pre_process_firewall_manager_rule_groups = pre_process_firewall_manager_rule_groups_;
     capacity = capacity_;
     data_protection_config = data_protection_config_;
     visibility_config = visibility_config_;
     rules = rules_;
     description = description_;
     default_action = default_action_;
     ar_n = ar_n_;
     id = id_;
     name = name_;
   }
    : web_ac_l)

let make_version_to_publish ?forecasted_lifetime:(forecasted_lifetime_ : time_window_day option)
    ?associated_rule_group_arn:(associated_rule_group_arn_ : resource_arn option) () =
  ({
     forecasted_lifetime = forecasted_lifetime_;
     associated_rule_group_arn = associated_rule_group_arn_;
   }
    : version_to_publish)

let make_update_web_acl_response ?next_lock_token:(next_lock_token_ : lock_token option) () =
  ({ next_lock_token = next_lock_token_ } : update_web_acl_response)

let make_update_web_acl_request
    ?on_source_d_do_s_protection_config:
      (on_source_d_do_s_protection_config_ : on_source_d_do_s_protection_config option)
    ?association_config:(association_config_ : association_config option)
    ?token_domains:(token_domains_ : token_domains option)
    ?challenge_config:(challenge_config_ : challenge_config option)
    ?captcha_config:(captcha_config_ : captcha_config option)
    ?custom_response_bodies:(custom_response_bodies_ : custom_response_bodies option)
    ?data_protection_config:(data_protection_config_ : data_protection_config option)
    ?rules:(rules_ : rules option) ?description:(description_ : entity_description option)
    ~lock_token:(lock_token_ : lock_token)
    ~visibility_config:(visibility_config_ : visibility_config)
    ~default_action:(default_action_ : default_action) ~id:(id_ : entity_id) ~scope:(scope_ : scope)
    ~name:(name_ : entity_name) () =
  ({
     on_source_d_do_s_protection_config = on_source_d_do_s_protection_config_;
     association_config = association_config_;
     token_domains = token_domains_;
     challenge_config = challenge_config_;
     captcha_config = captcha_config_;
     custom_response_bodies = custom_response_bodies_;
     lock_token = lock_token_;
     data_protection_config = data_protection_config_;
     visibility_config = visibility_config_;
     rules = rules_;
     description = description_;
     default_action = default_action_;
     id = id_;
     scope = scope_;
     name = name_;
   }
    : update_web_acl_request)

let make_update_rule_group_response ?next_lock_token:(next_lock_token_ : lock_token option) () =
  ({ next_lock_token = next_lock_token_ } : update_rule_group_response)

let make_update_rule_group_request
    ?custom_response_bodies:(custom_response_bodies_ : custom_response_bodies option)
    ?rules:(rules_ : rules option) ?description:(description_ : entity_description option)
    ~lock_token:(lock_token_ : lock_token)
    ~visibility_config:(visibility_config_ : visibility_config) ~id:(id_ : entity_id)
    ~scope:(scope_ : scope) ~name:(name_ : entity_name) () =
  ({
     custom_response_bodies = custom_response_bodies_;
     lock_token = lock_token_;
     visibility_config = visibility_config_;
     rules = rules_;
     description = description_;
     id = id_;
     scope = scope_;
     name = name_;
   }
    : update_rule_group_request)

let make_update_regex_pattern_set_response ?next_lock_token:(next_lock_token_ : lock_token option)
    () =
  ({ next_lock_token = next_lock_token_ } : update_regex_pattern_set_response)

let make_update_regex_pattern_set_request ?description:(description_ : entity_description option)
    ~lock_token:(lock_token_ : lock_token)
    ~regular_expression_list:(regular_expression_list_ : regular_expression_list)
    ~id:(id_ : entity_id) ~scope:(scope_ : scope) ~name:(name_ : entity_name) () =
  ({
     lock_token = lock_token_;
     regular_expression_list = regular_expression_list_;
     description = description_;
     id = id_;
     scope = scope_;
     name = name_;
   }
    : update_regex_pattern_set_request)

let make_update_managed_rule_set_version_expiry_date_response
    ?next_lock_token:(next_lock_token_ : lock_token option)
    ?expiry_timestamp:(expiry_timestamp_ : timestamp option)
    ?expiring_version:(expiring_version_ : version_key_string option) () =
  ({
     next_lock_token = next_lock_token_;
     expiry_timestamp = expiry_timestamp_;
     expiring_version = expiring_version_;
   }
    : update_managed_rule_set_version_expiry_date_response)

let make_update_managed_rule_set_version_expiry_date_request
    ~expiry_timestamp:(expiry_timestamp_ : timestamp)
    ~version_to_expire:(version_to_expire_ : version_key_string)
    ~lock_token:(lock_token_ : lock_token) ~id:(id_ : entity_id) ~scope:(scope_ : scope)
    ~name:(name_ : entity_name) () =
  ({
     expiry_timestamp = expiry_timestamp_;
     version_to_expire = version_to_expire_;
     lock_token = lock_token_;
     id = id_;
     scope = scope_;
     name = name_;
   }
    : update_managed_rule_set_version_expiry_date_request)

let make_update_ip_set_response ?next_lock_token:(next_lock_token_ : lock_token option) () =
  ({ next_lock_token = next_lock_token_ } : update_ip_set_response)

let make_update_ip_set_request ?description:(description_ : entity_description option)
    ~lock_token:(lock_token_ : lock_token) ~addresses:(addresses_ : ip_addresses)
    ~id:(id_ : entity_id) ~scope:(scope_ : scope) ~name:(name_ : entity_name) () =
  ({
     lock_token = lock_token_;
     addresses = addresses_;
     description = description_;
     id = id_;
     scope = scope_;
     name = name_;
   }
    : update_ip_set_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : resource_arn) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_time_window ~end_time:(end_time_ : timestamp) ~start_time:(start_time_ : timestamp) () =
  ({ end_time = end_time_; start_time = start_time_ } : time_window)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_ar_n:(resource_ar_n_ : resource_arn) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_tag_info_for_resource ?tag_list:(tag_list_ : tag_list option)
    ?resource_ar_n:(resource_ar_n_ : resource_arn option) () =
  ({ tag_list = tag_list_; resource_ar_n = resource_ar_n_ } : tag_info_for_resource)

let make_http_header ?value:(value_ : header_value option) ?name:(name_ : header_name option) () =
  ({ value = value_; name = name_ } : http_header)

let make_http_request ?headers:(headers_ : http_headers option)
    ?http_version:(http_version_ : http_version option) ?method_:(method__ : http_method option)
    ?ur_i:(ur_i_ : uri_string option) ?country:(country_ : country option)
    ?client_i_p:(client_i_p_ : ip_string option) () =
  ({
     headers = headers_;
     http_version = http_version_;
     method_ = method__;
     ur_i = ur_i_;
     country = country_;
     client_i_p = client_i_p_;
   }
    : http_request)

let make_captcha_response ?failure_reason:(failure_reason_ : failure_reason option)
    ?solve_timestamp:(solve_timestamp_ : solve_timestamp option)
    ?response_code:(response_code_ : response_code option) () =
  ({
     failure_reason = failure_reason_;
     solve_timestamp = solve_timestamp_;
     response_code = response_code_;
   }
    : captcha_response)

let make_challenge_response ?failure_reason:(failure_reason_ : failure_reason option)
    ?solve_timestamp:(solve_timestamp_ : solve_timestamp option)
    ?response_code:(response_code_ : response_code option) () =
  ({
     failure_reason = failure_reason_;
     solve_timestamp = solve_timestamp_;
     response_code = response_code_;
   }
    : challenge_response)

let make_sampled_http_request ?overridden_action:(overridden_action_ : action option)
    ?challenge_response:(challenge_response_ : challenge_response option)
    ?captcha_response:(captcha_response_ : captcha_response option)
    ?labels:(labels_ : labels option)
    ?response_code_sent:(response_code_sent_ : response_status_code option)
    ?request_headers_inserted:(request_headers_inserted_ : http_headers option)
    ?rule_name_within_rule_group:(rule_name_within_rule_group_ : entity_name option)
    ?action:(action_ : action option) ?timestamp:(timestamp_ : timestamp option)
    ~weight:(weight_ : sample_weight) ~request:(request_ : http_request) () =
  ({
     overridden_action = overridden_action_;
     challenge_response = challenge_response_;
     captcha_response = captcha_response_;
     labels = labels_;
     response_code_sent = response_code_sent_;
     request_headers_inserted = request_headers_inserted_;
     rule_name_within_rule_group = rule_name_within_rule_group_;
     action = action_;
     timestamp = timestamp_;
     weight = weight_;
     request = request_;
   }
    : sampled_http_request)

let make_rule_summary ?action:(action_ : rule_action option) ?name:(name_ : entity_name option) () =
  ({ action = action_; name = name_ } : rule_summary)

let make_rule_group_summary ?ar_n:(ar_n_ : resource_arn option)
    ?lock_token:(lock_token_ : lock_token option)
    ?description:(description_ : entity_description option) ?id:(id_ : entity_id option)
    ?name:(name_ : entity_name option) () =
  ({ ar_n = ar_n_; lock_token = lock_token_; description = description_; id = id_; name = name_ }
    : rule_group_summary)

let make_label_summary ?name:(name_ : label_name option) () = ({ name = name_ } : label_summary)

let make_rule_group ?consumed_labels:(consumed_labels_ : label_summaries option)
    ?available_labels:(available_labels_ : label_summaries option)
    ?custom_response_bodies:(custom_response_bodies_ : custom_response_bodies option)
    ?label_namespace:(label_namespace_ : label_name option) ?rules:(rules_ : rules option)
    ?description:(description_ : entity_description option)
    ~visibility_config:(visibility_config_ : visibility_config) ~ar_n:(ar_n_ : resource_arn)
    ~capacity:(capacity_ : capacity_unit) ~id:(id_ : entity_id) ~name:(name_ : entity_name) () =
  ({
     consumed_labels = consumed_labels_;
     available_labels = available_labels_;
     custom_response_bodies = custom_response_bodies_;
     label_namespace = label_namespace_;
     visibility_config = visibility_config_;
     rules = rules_;
     description = description_;
     ar_n = ar_n_;
     capacity = capacity_;
     id = id_;
     name = name_;
   }
    : rule_group)

let make_release_summary ?timestamp:(timestamp_ : timestamp option)
    ?release_version:(release_version_ : version_key_string option) () =
  ({ timestamp = timestamp_; release_version = release_version_ } : release_summary)

let make_regex_pattern_set_summary ?ar_n:(ar_n_ : resource_arn option)
    ?lock_token:(lock_token_ : lock_token option)
    ?description:(description_ : entity_description option) ?id:(id_ : entity_id option)
    ?name:(name_ : entity_name option) () =
  ({ ar_n = ar_n_; lock_token = lock_token_; description = description_; id = id_; name = name_ }
    : regex_pattern_set_summary)

let make_regex_pattern_set
    ?regular_expression_list:(regular_expression_list_ : regular_expression_list option)
    ?description:(description_ : entity_description option) ?ar_n:(ar_n_ : resource_arn option)
    ?id:(id_ : entity_id option) ?name:(name_ : entity_name option) () =
  ({
     regular_expression_list = regular_expression_list_;
     description = description_;
     ar_n = ar_n_;
     id = id_;
     name = name_;
   }
    : regex_pattern_set)

let make_rate_based_statement_managed_keys_ip_set ?addresses:(addresses_ : ip_addresses option)
    ?ip_address_version:(ip_address_version_ : ip_address_version option) () =
  ({ addresses = addresses_; ip_address_version = ip_address_version_ }
    : rate_based_statement_managed_keys_ip_set)

let make_put_permission_policy_response () = (() : unit)

let make_put_permission_policy_request ~policy:(policy_ : policy_string)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ policy = policy_; resource_arn = resource_arn_ } : put_permission_policy_request)

let make_put_managed_rule_set_versions_response
    ?next_lock_token:(next_lock_token_ : lock_token option) () =
  ({ next_lock_token = next_lock_token_ } : put_managed_rule_set_versions_response)

let make_put_managed_rule_set_versions_request
    ?versions_to_publish:(versions_to_publish_ : versions_to_publish option)
    ?recommended_version:(recommended_version_ : version_key_string option)
    ~lock_token:(lock_token_ : lock_token) ~id:(id_ : entity_id) ~scope:(scope_ : scope)
    ~name:(name_ : entity_name) () =
  ({
     versions_to_publish = versions_to_publish_;
     recommended_version = recommended_version_;
     lock_token = lock_token_;
     id = id_;
     scope = scope_;
     name = name_;
   }
    : put_managed_rule_set_versions_request)

let make_action_condition ~action:(action_ : action_value) () =
  ({ action = action_ } : action_condition)

let make_label_name_condition ~label_name:(label_name_ : label_name) () =
  ({ label_name = label_name_ } : label_name_condition)

let make_condition ?label_name_condition:(label_name_condition_ : label_name_condition option)
    ?action_condition:(action_condition_ : action_condition option) () =
  ({ label_name_condition = label_name_condition_; action_condition = action_condition_ }
    : condition)

let make_filter ~conditions:(conditions_ : conditions)
    ~requirement:(requirement_ : filter_requirement) ~behavior:(behavior_ : filter_behavior) () =
  ({ conditions = conditions_; requirement = requirement_; behavior = behavior_ } : filter)

let make_logging_filter ~default_behavior:(default_behavior_ : filter_behavior)
    ~filters:(filters_ : filters) () =
  ({ default_behavior = default_behavior_; filters = filters_ } : logging_filter)

let make_logging_configuration ?log_scope:(log_scope_ : log_scope option)
    ?log_type:(log_type_ : log_type option)
    ?logging_filter:(logging_filter_ : logging_filter option)
    ?managed_by_firewall_manager:(managed_by_firewall_manager_ : boolean_ option)
    ?redacted_fields:(redacted_fields_ : redacted_fields option)
    ~log_destination_configs:(log_destination_configs_ : log_destination_configs)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({
     log_scope = log_scope_;
     log_type = log_type_;
     logging_filter = logging_filter_;
     managed_by_firewall_manager = managed_by_firewall_manager_;
     redacted_fields = redacted_fields_;
     log_destination_configs = log_destination_configs_;
     resource_arn = resource_arn_;
   }
    : logging_configuration)

let make_put_logging_configuration_response
    ?logging_configuration:(logging_configuration_ : logging_configuration option) () =
  ({ logging_configuration = logging_configuration_ } : put_logging_configuration_response)

let make_put_logging_configuration_request
    ~logging_configuration:(logging_configuration_ : logging_configuration) () =
  ({ logging_configuration = logging_configuration_ } : put_logging_configuration_request)

let make_managed_rule_set_version ?expiry_timestamp:(expiry_timestamp_ : timestamp option)
    ?last_update_timestamp:(last_update_timestamp_ : timestamp option)
    ?publish_timestamp:(publish_timestamp_ : timestamp option)
    ?forecasted_lifetime:(forecasted_lifetime_ : time_window_day option)
    ?capacity:(capacity_ : capacity_unit option)
    ?associated_rule_group_arn:(associated_rule_group_arn_ : resource_arn option) () =
  ({
     expiry_timestamp = expiry_timestamp_;
     last_update_timestamp = last_update_timestamp_;
     publish_timestamp = publish_timestamp_;
     forecasted_lifetime = forecasted_lifetime_;
     capacity = capacity_;
     associated_rule_group_arn = associated_rule_group_arn_;
   }
    : managed_rule_set_version)

let make_mobile_sdk_release ?tags:(tags_ : tag_list option)
    ?release_notes:(release_notes_ : release_notes option)
    ?timestamp:(timestamp_ : timestamp option)
    ?release_version:(release_version_ : version_key_string option) () =
  ({
     tags = tags_;
     release_notes = release_notes_;
     timestamp = timestamp_;
     release_version = release_version_;
   }
    : mobile_sdk_release)

let make_managed_rule_set_summary ?label_namespace:(label_namespace_ : label_name option)
    ?ar_n:(ar_n_ : resource_arn option) ?lock_token:(lock_token_ : lock_token option)
    ?description:(description_ : entity_description option) ?id:(id_ : entity_id option)
    ?name:(name_ : entity_name option) () =
  ({
     label_namespace = label_namespace_;
     ar_n = ar_n_;
     lock_token = lock_token_;
     description = description_;
     id = id_;
     name = name_;
   }
    : managed_rule_set_summary)

let make_managed_rule_set ?label_namespace:(label_namespace_ : label_name option)
    ?recommended_version:(recommended_version_ : version_key_string option)
    ?published_versions:(published_versions_ : published_versions option)
    ?description:(description_ : entity_description option) ~ar_n:(ar_n_ : resource_arn)
    ~id:(id_ : entity_id) ~name:(name_ : entity_name) () =
  ({
     label_namespace = label_namespace_;
     recommended_version = recommended_version_;
     published_versions = published_versions_;
     description = description_;
     ar_n = ar_n_;
     id = id_;
     name = name_;
   }
    : managed_rule_set)

let make_managed_rule_group_version
    ?last_update_timestamp:(last_update_timestamp_ : timestamp option)
    ?name:(name_ : version_key_string option) () =
  ({ last_update_timestamp = last_update_timestamp_; name = name_ } : managed_rule_group_version)

let make_managed_rule_group_summary ?description:(description_ : entity_description option)
    ?versioning_supported:(versioning_supported_ : boolean_ option)
    ?name:(name_ : entity_name option) ?vendor_name:(vendor_name_ : vendor_name option) () =
  ({
     description = description_;
     versioning_supported = versioning_supported_;
     name = name_;
     vendor_name = vendor_name_;
   }
    : managed_rule_group_summary)

let make_managed_product_descriptor
    ?is_advanced_managed_rule_set:(is_advanced_managed_rule_set_ : boolean_ option)
    ?is_versioning_supported:(is_versioning_supported_ : boolean_ option)
    ?sns_topic_arn:(sns_topic_arn_ : resource_arn option)
    ?product_description:(product_description_ : product_description option)
    ?product_title:(product_title_ : product_title option)
    ?product_link:(product_link_ : product_link option)
    ?product_id:(product_id_ : product_id option)
    ?managed_rule_set_name:(managed_rule_set_name_ : entity_name option)
    ?vendor_name:(vendor_name_ : vendor_name option) () =
  ({
     is_advanced_managed_rule_set = is_advanced_managed_rule_set_;
     is_versioning_supported = is_versioning_supported_;
     sns_topic_arn = sns_topic_arn_;
     product_description = product_description_;
     product_title = product_title_;
     product_link = product_link_;
     product_id = product_id_;
     managed_rule_set_name = managed_rule_set_name_;
     vendor_name = vendor_name_;
   }
    : managed_product_descriptor)

let make_list_web_ac_ls_response ?web_ac_ls:(web_ac_ls_ : web_acl_summaries option)
    ?next_marker:(next_marker_ : next_marker option) () =
  ({ web_ac_ls = web_ac_ls_; next_marker = next_marker_ } : list_web_ac_ls_response)

let make_list_web_ac_ls_request ?limit:(limit_ : pagination_limit option)
    ?next_marker:(next_marker_ : next_marker option) ~scope:(scope_ : scope) () =
  ({ limit = limit_; next_marker = next_marker_; scope = scope_ } : list_web_ac_ls_request)

let make_list_tags_for_resource_response
    ?tag_info_for_resource:(tag_info_for_resource_ : tag_info_for_resource option)
    ?next_marker:(next_marker_ : next_marker option) () =
  ({ tag_info_for_resource = tag_info_for_resource_; next_marker = next_marker_ }
    : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?limit:(limit_ : pagination_limit option)
    ?next_marker:(next_marker_ : next_marker option) ~resource_ar_n:(resource_ar_n_ : resource_arn)
    () =
  ({ resource_ar_n = resource_ar_n_; limit = limit_; next_marker = next_marker_ }
    : list_tags_for_resource_request)

let make_list_rule_groups_response ?rule_groups:(rule_groups_ : rule_group_summaries option)
    ?next_marker:(next_marker_ : next_marker option) () =
  ({ rule_groups = rule_groups_; next_marker = next_marker_ } : list_rule_groups_response)

let make_list_rule_groups_request ?limit:(limit_ : pagination_limit option)
    ?next_marker:(next_marker_ : next_marker option) ~scope:(scope_ : scope) () =
  ({ limit = limit_; next_marker = next_marker_; scope = scope_ } : list_rule_groups_request)

let make_list_resources_for_web_acl_response ?resource_arns:(resource_arns_ : resource_arns option)
    () =
  ({ resource_arns = resource_arns_ } : list_resources_for_web_acl_response)

let make_list_resources_for_web_acl_request ?resource_type:(resource_type_ : resource_type option)
    ~web_acl_arn:(web_acl_arn_ : resource_arn) () =
  ({ resource_type = resource_type_; web_acl_arn = web_acl_arn_ }
    : list_resources_for_web_acl_request)

let make_list_regex_pattern_sets_response
    ?regex_pattern_sets:(regex_pattern_sets_ : regex_pattern_set_summaries option)
    ?next_marker:(next_marker_ : next_marker option) () =
  ({ regex_pattern_sets = regex_pattern_sets_; next_marker = next_marker_ }
    : list_regex_pattern_sets_response)

let make_list_regex_pattern_sets_request ?limit:(limit_ : pagination_limit option)
    ?next_marker:(next_marker_ : next_marker option) ~scope:(scope_ : scope) () =
  ({ limit = limit_; next_marker = next_marker_; scope = scope_ } : list_regex_pattern_sets_request)

let make_list_mobile_sdk_releases_response ?next_marker:(next_marker_ : next_marker option)
    ?release_summaries:(release_summaries_ : release_summaries option) () =
  ({ next_marker = next_marker_; release_summaries = release_summaries_ }
    : list_mobile_sdk_releases_response)

let make_list_mobile_sdk_releases_request ?limit:(limit_ : pagination_limit option)
    ?next_marker:(next_marker_ : next_marker option) ~platform:(platform_ : platform) () =
  ({ limit = limit_; next_marker = next_marker_; platform = platform_ }
    : list_mobile_sdk_releases_request)

let make_list_managed_rule_sets_response
    ?managed_rule_sets:(managed_rule_sets_ : managed_rule_set_summaries option)
    ?next_marker:(next_marker_ : next_marker option) () =
  ({ managed_rule_sets = managed_rule_sets_; next_marker = next_marker_ }
    : list_managed_rule_sets_response)

let make_list_managed_rule_sets_request ?limit:(limit_ : pagination_limit option)
    ?next_marker:(next_marker_ : next_marker option) ~scope:(scope_ : scope) () =
  ({ limit = limit_; next_marker = next_marker_; scope = scope_ } : list_managed_rule_sets_request)

let make_list_logging_configurations_response ?next_marker:(next_marker_ : next_marker option)
    ?logging_configurations:(logging_configurations_ : logging_configurations option) () =
  ({ next_marker = next_marker_; logging_configurations = logging_configurations_ }
    : list_logging_configurations_response)

let make_list_logging_configurations_request ?log_scope:(log_scope_ : log_scope option)
    ?limit:(limit_ : pagination_limit option) ?next_marker:(next_marker_ : next_marker option)
    ~scope:(scope_ : scope) () =
  ({ log_scope = log_scope_; limit = limit_; next_marker = next_marker_; scope = scope_ }
    : list_logging_configurations_request)

let make_ip_set_summary ?ar_n:(ar_n_ : resource_arn option)
    ?lock_token:(lock_token_ : lock_token option)
    ?description:(description_ : entity_description option) ?id:(id_ : entity_id option)
    ?name:(name_ : entity_name option) () =
  ({ ar_n = ar_n_; lock_token = lock_token_; description = description_; id = id_; name = name_ }
    : ip_set_summary)

let make_list_ip_sets_response ?ip_sets:(ip_sets_ : ip_set_summaries option)
    ?next_marker:(next_marker_ : next_marker option) () =
  ({ ip_sets = ip_sets_; next_marker = next_marker_ } : list_ip_sets_response)

let make_list_ip_sets_request ?limit:(limit_ : pagination_limit option)
    ?next_marker:(next_marker_ : next_marker option) ~scope:(scope_ : scope) () =
  ({ limit = limit_; next_marker = next_marker_; scope = scope_ } : list_ip_sets_request)

let make_list_available_managed_rule_groups_response
    ?managed_rule_groups:(managed_rule_groups_ : managed_rule_group_summaries option)
    ?next_marker:(next_marker_ : next_marker option) () =
  ({ managed_rule_groups = managed_rule_groups_; next_marker = next_marker_ }
    : list_available_managed_rule_groups_response)

let make_list_available_managed_rule_groups_request ?limit:(limit_ : pagination_limit option)
    ?next_marker:(next_marker_ : next_marker option) ~scope:(scope_ : scope) () =
  ({ limit = limit_; next_marker = next_marker_; scope = scope_ }
    : list_available_managed_rule_groups_request)

let make_list_available_managed_rule_group_versions_response
    ?current_default_version:(current_default_version_ : version_key_string option)
    ?versions:(versions_ : managed_rule_group_versions option)
    ?next_marker:(next_marker_ : next_marker option) () =
  ({
     current_default_version = current_default_version_;
     versions = versions_;
     next_marker = next_marker_;
   }
    : list_available_managed_rule_group_versions_response)

let make_list_available_managed_rule_group_versions_request
    ?limit:(limit_ : pagination_limit option) ?next_marker:(next_marker_ : next_marker option)
    ~scope:(scope_ : scope) ~name:(name_ : entity_name) ~vendor_name:(vendor_name_ : vendor_name) ()
    =
  ({
     limit = limit_;
     next_marker = next_marker_;
     scope = scope_;
     name = name_;
     vendor_name = vendor_name_;
   }
    : list_available_managed_rule_group_versions_request)

let make_api_key_summary ?version:(version_ : api_key_version option)
    ?creation_timestamp:(creation_timestamp_ : timestamp option)
    ?api_key:(api_key_ : api_key option) ?token_domains:(token_domains_ : token_domains option) () =
  ({
     version = version_;
     creation_timestamp = creation_timestamp_;
     api_key = api_key_;
     token_domains = token_domains_;
   }
    : api_key_summary)

let make_list_api_keys_response
    ?application_integration_ur_l:(application_integration_ur_l_ : output_url option)
    ?api_key_summaries:(api_key_summaries_ : api_key_summaries option)
    ?next_marker:(next_marker_ : next_marker option) () =
  ({
     application_integration_ur_l = application_integration_ur_l_;
     api_key_summaries = api_key_summaries_;
     next_marker = next_marker_;
   }
    : list_api_keys_response)

let make_list_api_keys_request ?limit:(limit_ : pagination_limit option)
    ?next_marker:(next_marker_ : next_marker option) ~scope:(scope_ : scope) () =
  ({ limit = limit_; next_marker = next_marker_; scope = scope_ } : list_api_keys_request)

let make_ip_set ?description:(description_ : entity_description option)
    ~addresses:(addresses_ : ip_addresses)
    ~ip_address_version:(ip_address_version_ : ip_address_version) ~ar_n:(ar_n_ : resource_arn)
    ~id:(id_ : entity_id) ~name:(name_ : entity_name) () =
  ({
     addresses = addresses_;
     ip_address_version = ip_address_version_;
     description = description_;
     ar_n = ar_n_;
     id = id_;
     name = name_;
   }
    : ip_set)

let make_get_web_acl_response
    ?application_integration_ur_l:(application_integration_ur_l_ : output_url option)
    ?lock_token:(lock_token_ : lock_token option) ?web_ac_l:(web_ac_l_ : web_ac_l option) () =
  ({
     application_integration_ur_l = application_integration_ur_l_;
     lock_token = lock_token_;
     web_ac_l = web_ac_l_;
   }
    : get_web_acl_response)

let make_get_web_acl_request ?ar_n:(ar_n_ : resource_arn option) ?id:(id_ : entity_id option)
    ?scope:(scope_ : scope option) ?name:(name_ : entity_name option) () =
  ({ ar_n = ar_n_; id = id_; scope = scope_; name = name_ } : get_web_acl_request)

let make_get_web_acl_for_resource_response ?web_ac_l:(web_ac_l_ : web_ac_l option) () =
  ({ web_ac_l = web_ac_l_ } : get_web_acl_for_resource_response)

let make_get_web_acl_for_resource_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_web_acl_for_resource_request)

let make_get_sampled_requests_response ?time_window:(time_window_ : time_window option)
    ?population_size:(population_size_ : population_size option)
    ?sampled_requests:(sampled_requests_ : sampled_http_requests option) () =
  ({
     time_window = time_window_;
     population_size = population_size_;
     sampled_requests = sampled_requests_;
   }
    : get_sampled_requests_response)

let make_get_sampled_requests_request ~max_items:(max_items_ : list_max_items)
    ~time_window:(time_window_ : time_window) ~scope:(scope_ : scope)
    ~rule_metric_name:(rule_metric_name_ : metric_name) ~web_acl_arn:(web_acl_arn_ : resource_arn)
    () =
  ({
     max_items = max_items_;
     time_window = time_window_;
     scope = scope_;
     rule_metric_name = rule_metric_name_;
     web_acl_arn = web_acl_arn_;
   }
    : get_sampled_requests_request)

let make_get_rule_group_response ?lock_token:(lock_token_ : lock_token option)
    ?rule_group:(rule_group_ : rule_group option) () =
  ({ lock_token = lock_token_; rule_group = rule_group_ } : get_rule_group_response)

let make_get_rule_group_request ?ar_n:(ar_n_ : resource_arn option) ?id:(id_ : entity_id option)
    ?scope:(scope_ : scope option) ?name:(name_ : entity_name option) () =
  ({ ar_n = ar_n_; id = id_; scope = scope_; name = name_ } : get_rule_group_request)

let make_get_regex_pattern_set_response ?lock_token:(lock_token_ : lock_token option)
    ?regex_pattern_set:(regex_pattern_set_ : regex_pattern_set option) () =
  ({ lock_token = lock_token_; regex_pattern_set = regex_pattern_set_ }
    : get_regex_pattern_set_response)

let make_get_regex_pattern_set_request ~id:(id_ : entity_id) ~scope:(scope_ : scope)
    ~name:(name_ : entity_name) () =
  ({ id = id_; scope = scope_; name = name_ } : get_regex_pattern_set_request)

let make_get_rate_based_statement_managed_keys_response
    ?managed_keys_ip_v6:(managed_keys_ip_v6_ : rate_based_statement_managed_keys_ip_set option)
    ?managed_keys_ip_v4:(managed_keys_ip_v4_ : rate_based_statement_managed_keys_ip_set option) () =
  ({ managed_keys_ip_v6 = managed_keys_ip_v6_; managed_keys_ip_v4 = managed_keys_ip_v4_ }
    : get_rate_based_statement_managed_keys_response)

let make_get_rate_based_statement_managed_keys_request
    ?rule_group_rule_name:(rule_group_rule_name_ : entity_name option)
    ~rule_name:(rule_name_ : entity_name) ~web_acl_id:(web_acl_id_ : entity_id)
    ~web_acl_name:(web_acl_name_ : entity_name) ~scope:(scope_ : scope) () =
  ({
     rule_name = rule_name_;
     rule_group_rule_name = rule_group_rule_name_;
     web_acl_id = web_acl_id_;
     web_acl_name = web_acl_name_;
     scope = scope_;
   }
    : get_rate_based_statement_managed_keys_request)

let make_get_permission_policy_response ?policy:(policy_ : policy_string option) () =
  ({ policy = policy_ } : get_permission_policy_response)

let make_get_permission_policy_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_permission_policy_request)

let make_get_mobile_sdk_release_response
    ?mobile_sdk_release:(mobile_sdk_release_ : mobile_sdk_release option) () =
  ({ mobile_sdk_release = mobile_sdk_release_ } : get_mobile_sdk_release_response)

let make_get_mobile_sdk_release_request ~release_version:(release_version_ : version_key_string)
    ~platform:(platform_ : platform) () =
  ({ release_version = release_version_; platform = platform_ } : get_mobile_sdk_release_request)

let make_get_managed_rule_set_response ?lock_token:(lock_token_ : lock_token option)
    ?managed_rule_set:(managed_rule_set_ : managed_rule_set option) () =
  ({ lock_token = lock_token_; managed_rule_set = managed_rule_set_ }
    : get_managed_rule_set_response)

let make_get_managed_rule_set_request ~id:(id_ : entity_id) ~scope:(scope_ : scope)
    ~name:(name_ : entity_name) () =
  ({ id = id_; scope = scope_; name = name_ } : get_managed_rule_set_request)

let make_get_logging_configuration_response
    ?logging_configuration:(logging_configuration_ : logging_configuration option) () =
  ({ logging_configuration = logging_configuration_ } : get_logging_configuration_response)

let make_get_logging_configuration_request ?log_scope:(log_scope_ : log_scope option)
    ?log_type:(log_type_ : log_type option) ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ log_scope = log_scope_; log_type = log_type_; resource_arn = resource_arn_ }
    : get_logging_configuration_request)

let make_get_ip_set_response ?lock_token:(lock_token_ : lock_token option)
    ?ip_set:(ip_set_ : ip_set option) () =
  ({ lock_token = lock_token_; ip_set = ip_set_ } : get_ip_set_response)

let make_get_ip_set_request ~id:(id_ : entity_id) ~scope:(scope_ : scope)
    ~name:(name_ : entity_name) () =
  ({ id = id_; scope = scope_; name = name_ } : get_ip_set_request)

let make_get_decrypted_api_key_response ?creation_timestamp:(creation_timestamp_ : timestamp option)
    ?token_domains:(token_domains_ : token_domains option) () =
  ({ creation_timestamp = creation_timestamp_; token_domains = token_domains_ }
    : get_decrypted_api_key_response)

let make_get_decrypted_api_key_request ~api_key:(api_key_ : api_key) ~scope:(scope_ : scope) () =
  ({ api_key = api_key_; scope = scope_ } : get_decrypted_api_key_request)

let make_generate_mobile_sdk_release_url_response ?url:(url_ : download_url option) () =
  ({ url = url_ } : generate_mobile_sdk_release_url_response)

let make_generate_mobile_sdk_release_url_request
    ~release_version:(release_version_ : version_key_string) ~platform:(platform_ : platform) () =
  ({ release_version = release_version_; platform = platform_ }
    : generate_mobile_sdk_release_url_request)

let make_disassociate_web_acl_response () = (() : unit)

let make_disassociate_web_acl_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : disassociate_web_acl_request)

let make_describe_managed_rule_group_response
    ?consumed_labels:(consumed_labels_ : label_summaries option)
    ?available_labels:(available_labels_ : label_summaries option)
    ?label_namespace:(label_namespace_ : label_name option) ?rules:(rules_ : rule_summaries option)
    ?capacity:(capacity_ : capacity_unit option)
    ?sns_topic_arn:(sns_topic_arn_ : resource_arn option)
    ?version_name:(version_name_ : version_key_string option) () =
  ({
     consumed_labels = consumed_labels_;
     available_labels = available_labels_;
     label_namespace = label_namespace_;
     rules = rules_;
     capacity = capacity_;
     sns_topic_arn = sns_topic_arn_;
     version_name = version_name_;
   }
    : describe_managed_rule_group_response)

let make_describe_managed_rule_group_request
    ?version_name:(version_name_ : version_key_string option) ~scope:(scope_ : scope)
    ~name:(name_ : entity_name) ~vendor_name:(vendor_name_ : vendor_name) () =
  ({ version_name = version_name_; scope = scope_; name = name_; vendor_name = vendor_name_ }
    : describe_managed_rule_group_request)

let make_describe_managed_products_by_vendor_response
    ?managed_products:(managed_products_ : managed_product_descriptors option) () =
  ({ managed_products = managed_products_ } : describe_managed_products_by_vendor_response)

let make_describe_managed_products_by_vendor_request ~scope:(scope_ : scope)
    ~vendor_name:(vendor_name_ : vendor_name) () =
  ({ scope = scope_; vendor_name = vendor_name_ } : describe_managed_products_by_vendor_request)

let make_describe_all_managed_products_response
    ?managed_products:(managed_products_ : managed_product_descriptors option) () =
  ({ managed_products = managed_products_ } : describe_all_managed_products_response)

let make_describe_all_managed_products_request ~scope:(scope_ : scope) () =
  ({ scope = scope_ } : describe_all_managed_products_request)

let make_delete_web_acl_response () = (() : unit)

let make_delete_web_acl_request ~lock_token:(lock_token_ : lock_token) ~id:(id_ : entity_id)
    ~scope:(scope_ : scope) ~name:(name_ : entity_name) () =
  ({ lock_token = lock_token_; id = id_; scope = scope_; name = name_ } : delete_web_acl_request)

let make_delete_rule_group_response () = (() : unit)

let make_delete_rule_group_request ~lock_token:(lock_token_ : lock_token) ~id:(id_ : entity_id)
    ~scope:(scope_ : scope) ~name:(name_ : entity_name) () =
  ({ lock_token = lock_token_; id = id_; scope = scope_; name = name_ } : delete_rule_group_request)

let make_delete_regex_pattern_set_response () = (() : unit)

let make_delete_regex_pattern_set_request ~lock_token:(lock_token_ : lock_token)
    ~id:(id_ : entity_id) ~scope:(scope_ : scope) ~name:(name_ : entity_name) () =
  ({ lock_token = lock_token_; id = id_; scope = scope_; name = name_ }
    : delete_regex_pattern_set_request)

let make_delete_permission_policy_response () = (() : unit)

let make_delete_permission_policy_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : delete_permission_policy_request)

let make_delete_logging_configuration_response () = (() : unit)

let make_delete_logging_configuration_request ?log_scope:(log_scope_ : log_scope option)
    ?log_type:(log_type_ : log_type option) ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ log_scope = log_scope_; log_type = log_type_; resource_arn = resource_arn_ }
    : delete_logging_configuration_request)

let make_delete_ip_set_response () = (() : unit)

let make_delete_ip_set_request ~lock_token:(lock_token_ : lock_token) ~id:(id_ : entity_id)
    ~scope:(scope_ : scope) ~name:(name_ : entity_name) () =
  ({ lock_token = lock_token_; id = id_; scope = scope_; name = name_ } : delete_ip_set_request)

let make_delete_firewall_manager_rule_groups_response
    ?next_web_acl_lock_token:(next_web_acl_lock_token_ : lock_token option) () =
  ({ next_web_acl_lock_token = next_web_acl_lock_token_ }
    : delete_firewall_manager_rule_groups_response)

let make_delete_firewall_manager_rule_groups_request
    ~web_acl_lock_token:(web_acl_lock_token_ : lock_token)
    ~web_acl_arn:(web_acl_arn_ : resource_arn) () =
  ({ web_acl_lock_token = web_acl_lock_token_; web_acl_arn = web_acl_arn_ }
    : delete_firewall_manager_rule_groups_request)

let make_delete_api_key_response () = (() : unit)

let make_delete_api_key_request ~api_key:(api_key_ : api_key) ~scope:(scope_ : scope) () =
  ({ api_key = api_key_; scope = scope_ } : delete_api_key_request)

let make_create_web_acl_response ?summary:(summary_ : web_acl_summary option) () =
  ({ summary = summary_ } : create_web_acl_response)

let make_create_web_acl_request
    ?application_config:(application_config_ : application_config option)
    ?on_source_d_do_s_protection_config:
      (on_source_d_do_s_protection_config_ : on_source_d_do_s_protection_config option)
    ?association_config:(association_config_ : association_config option)
    ?token_domains:(token_domains_ : token_domains option)
    ?challenge_config:(challenge_config_ : challenge_config option)
    ?captcha_config:(captcha_config_ : captcha_config option)
    ?custom_response_bodies:(custom_response_bodies_ : custom_response_bodies option)
    ?tags:(tags_ : tag_list option)
    ?data_protection_config:(data_protection_config_ : data_protection_config option)
    ?rules:(rules_ : rules option) ?description:(description_ : entity_description option)
    ~visibility_config:(visibility_config_ : visibility_config)
    ~default_action:(default_action_ : default_action) ~scope:(scope_ : scope)
    ~name:(name_ : entity_name) () =
  ({
     application_config = application_config_;
     on_source_d_do_s_protection_config = on_source_d_do_s_protection_config_;
     association_config = association_config_;
     token_domains = token_domains_;
     challenge_config = challenge_config_;
     captcha_config = captcha_config_;
     custom_response_bodies = custom_response_bodies_;
     tags = tags_;
     data_protection_config = data_protection_config_;
     visibility_config = visibility_config_;
     rules = rules_;
     description = description_;
     default_action = default_action_;
     scope = scope_;
     name = name_;
   }
    : create_web_acl_request)

let make_create_rule_group_response ?summary:(summary_ : rule_group_summary option) () =
  ({ summary = summary_ } : create_rule_group_response)

let make_create_rule_group_request
    ?custom_response_bodies:(custom_response_bodies_ : custom_response_bodies option)
    ?tags:(tags_ : tag_list option) ?rules:(rules_ : rules option)
    ?description:(description_ : entity_description option)
    ~visibility_config:(visibility_config_ : visibility_config)
    ~capacity:(capacity_ : capacity_unit) ~scope:(scope_ : scope) ~name:(name_ : entity_name) () =
  ({
     custom_response_bodies = custom_response_bodies_;
     tags = tags_;
     visibility_config = visibility_config_;
     rules = rules_;
     description = description_;
     capacity = capacity_;
     scope = scope_;
     name = name_;
   }
    : create_rule_group_request)

let make_create_regex_pattern_set_response ?summary:(summary_ : regex_pattern_set_summary option) ()
    =
  ({ summary = summary_ } : create_regex_pattern_set_response)

let make_create_regex_pattern_set_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : entity_description option)
    ~regular_expression_list:(regular_expression_list_ : regular_expression_list)
    ~scope:(scope_ : scope) ~name:(name_ : entity_name) () =
  ({
     tags = tags_;
     regular_expression_list = regular_expression_list_;
     description = description_;
     scope = scope_;
     name = name_;
   }
    : create_regex_pattern_set_request)

let make_create_ip_set_response ?summary:(summary_ : ip_set_summary option) () =
  ({ summary = summary_ } : create_ip_set_response)

let make_create_ip_set_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : entity_description option) ~addresses:(addresses_ : ip_addresses)
    ~ip_address_version:(ip_address_version_ : ip_address_version) ~scope:(scope_ : scope)
    ~name:(name_ : entity_name) () =
  ({
     tags = tags_;
     addresses = addresses_;
     ip_address_version = ip_address_version_;
     description = description_;
     scope = scope_;
     name = name_;
   }
    : create_ip_set_request)

let make_create_api_key_response ?api_key:(api_key_ : api_key option) () =
  ({ api_key = api_key_ } : create_api_key_response)

let make_create_api_key_request ~token_domains:(token_domains_ : api_key_token_domains)
    ~scope:(scope_ : scope) () =
  ({ token_domains = token_domains_; scope = scope_ } : create_api_key_request)

let make_check_capacity_response ?capacity:(capacity_ : consumed_capacity option) () =
  ({ capacity = capacity_ } : check_capacity_response)

let make_check_capacity_request ~rules:(rules_ : rules) ~scope:(scope_ : scope) () =
  ({ rules = rules_; scope = scope_ } : check_capacity_request)

let make_associate_web_acl_response () = (() : unit)

let make_associate_web_acl_request ~resource_arn:(resource_arn_ : resource_arn)
    ~web_acl_arn:(web_acl_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_; web_acl_arn = web_acl_arn_ } : associate_web_acl_request)
