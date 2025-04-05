open Smaws_Lib
open Types
let make_single_header ~name:(name_ : string)  () =
  ({ name = name_ } : single_header)
let make_single_query_argument ~name:(name_ : string)  () =
  ({ name = name_ } : single_query_argument)
let make_all_query_arguments () = (() : all_query_arguments)
let make_uri_path () = (() : uri_path)
let make_query_string () = (() : query_string)
let make_body
  ?oversize_handling:(oversize_handling_ : oversize_handling option)  () =
  ({ oversize_handling = oversize_handling_ } : body)
let make_method_ () = (() : method_)
let make_all () = (() : all)
let make_json_match_pattern
  ?included_paths:(included_paths_ : string list option) 
  ?all:(all_ : all option)  () =
  ({ included_paths = included_paths_; all = all_ } : json_match_pattern)
let make_json_body
  ?oversize_handling:(oversize_handling_ : oversize_handling option) 
  ?invalid_fallback_behavior:(invalid_fallback_behavior_ :
                               body_parsing_fallback_behavior option)
   ~match_scope:(match_scope_ : json_match_scope) 
  ~match_pattern:(match_pattern_ : json_match_pattern)  () =
  ({
     oversize_handling = oversize_handling_;
     invalid_fallback_behavior = invalid_fallback_behavior_;
     match_scope = match_scope_;
     match_pattern = match_pattern_
   } : json_body)
let make_header_match_pattern
  ?excluded_headers:(excluded_headers_ : string list option) 
  ?included_headers:(included_headers_ : string list option) 
  ?all:(all_ : all option)  () =
  ({
     excluded_headers = excluded_headers_;
     included_headers = included_headers_;
     all = all_
   } : header_match_pattern)
let make_headers ~oversize_handling:(oversize_handling_ : oversize_handling) 
  ~match_scope:(match_scope_ : map_match_scope) 
  ~match_pattern:(match_pattern_ : header_match_pattern)  () =
  ({
     oversize_handling = oversize_handling_;
     match_scope = match_scope_;
     match_pattern = match_pattern_
   } : headers)
let make_cookie_match_pattern
  ?excluded_cookies:(excluded_cookies_ : string list option) 
  ?included_cookies:(included_cookies_ : string list option) 
  ?all:(all_ : all option)  () =
  ({
     excluded_cookies = excluded_cookies_;
     included_cookies = included_cookies_;
     all = all_
   } : cookie_match_pattern)
let make_cookies ~oversize_handling:(oversize_handling_ : oversize_handling) 
  ~match_scope:(match_scope_ : map_match_scope) 
  ~match_pattern:(match_pattern_ : cookie_match_pattern)  () =
  ({
     oversize_handling = oversize_handling_;
     match_scope = match_scope_;
     match_pattern = match_pattern_
   } : cookies)
let make_header_order
  ~oversize_handling:(oversize_handling_ : oversize_handling)  () =
  ({ oversize_handling = oversize_handling_ } : header_order)
let make_ja3_fingerprint
  ~fallback_behavior:(fallback_behavior_ : fallback_behavior)  () =
  ({ fallback_behavior = fallback_behavior_ } : ja3_fingerprint)
let make_field_to_match
  ?ja3_fingerprint:(ja3_fingerprint_ : ja3_fingerprint option) 
  ?header_order:(header_order_ : header_order option) 
  ?cookies:(cookies_ : cookies option)  ?headers:(headers_ : headers option) 
  ?json_body:(json_body_ : json_body option) 
  ?method_:(method__ : method_ option)  ?body:(body_ : body option) 
  ?query_string:(query_string_ : query_string option) 
  ?uri_path:(uri_path_ : uri_path option) 
  ?all_query_arguments:(all_query_arguments_ : all_query_arguments option) 
  ?single_query_argument:(single_query_argument_ :
                           single_query_argument option)
   ?single_header:(single_header_ : single_header option)  () =
  ({
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
     single_header = single_header_
   } : field_to_match)
let make_text_transformation ~type_:(type__ : text_transformation_type) 
  ~priority:(priority_ : int)  () =
  ({ type_ = type__; priority = priority_ } : text_transformation)
let make_xss_match_statement
  ~text_transformations:(text_transformations_ : text_transformation list) 
  ~field_to_match:(field_to_match_ : field_to_match)  () =
  ({
     text_transformations = text_transformations_;
     field_to_match = field_to_match_
   } : xss_match_statement)
let make_web_acl_summary ?ar_n:(ar_n_ : string option) 
  ?lock_token:(lock_token_ : string option) 
  ?description:(description_ : string option)  ?id:(id_ : string option) 
  ?name:(name_ : string option)  () =
  ({
     ar_n = ar_n_;
     lock_token = lock_token_;
     description = description_;
     id = id_;
     name = name_
   } : web_acl_summary)
let make_custom_http_header ~value:(value_ : string)  ~name:(name_ : string) 
  () = ({ value = value_; name = name_ } : custom_http_header)
let make_custom_response
  ?response_headers:(response_headers_ : custom_http_header list option) 
  ?custom_response_body_key:(custom_response_body_key_ : string option) 
  ~response_code:(response_code_ : int)  () =
  ({
     response_headers = response_headers_;
     custom_response_body_key = custom_response_body_key_;
     response_code = response_code_
   } : custom_response)
let make_block_action
  ?custom_response:(custom_response_ : custom_response option)  () =
  ({ custom_response = custom_response_ } : block_action)
let make_custom_request_handling
  ~insert_headers:(insert_headers_ : custom_http_header list)  () =
  ({ insert_headers = insert_headers_ } : custom_request_handling)
let make_allow_action
  ?custom_request_handling:(custom_request_handling_ :
                             custom_request_handling option)
   () =
  ({ custom_request_handling = custom_request_handling_ } : allow_action)
let make_default_action ?allow:(allow_ : allow_action option) 
  ?block:(block_ : block_action option)  () =
  ({ allow = allow_; block = block_ } : default_action)
let make_byte_match_statement
  ~positional_constraint:(positional_constraint_ : positional_constraint) 
  ~text_transformations:(text_transformations_ : text_transformation list) 
  ~field_to_match:(field_to_match_ : field_to_match) 
  ~search_string:(search_string_ : bytes)  () =
  ({
     positional_constraint = positional_constraint_;
     text_transformations = text_transformations_;
     field_to_match = field_to_match_;
     search_string = search_string_
   } : byte_match_statement)
let make_sqli_match_statement
  ?sensitivity_level:(sensitivity_level_ : sensitivity_level option) 
  ~text_transformations:(text_transformations_ : text_transformation list) 
  ~field_to_match:(field_to_match_ : field_to_match)  () =
  ({
     sensitivity_level = sensitivity_level_;
     text_transformations = text_transformations_;
     field_to_match = field_to_match_
   } : sqli_match_statement)
let make_size_constraint_statement
  ~text_transformations:(text_transformations_ : text_transformation list) 
  ~size:(size_ : int) 
  ~comparison_operator:(comparison_operator_ : comparison_operator) 
  ~field_to_match:(field_to_match_ : field_to_match)  () =
  ({
     text_transformations = text_transformations_;
     size = size_;
     comparison_operator = comparison_operator_;
     field_to_match = field_to_match_
   } : size_constraint_statement)
let make_forwarded_ip_config
  ~fallback_behavior:(fallback_behavior_ : fallback_behavior) 
  ~header_name:(header_name_ : string)  () =
  ({ fallback_behavior = fallback_behavior_; header_name = header_name_ } : 
  forwarded_ip_config)
let make_geo_match_statement
  ?forwarded_ip_config:(forwarded_ip_config_ : forwarded_ip_config option) 
  ?country_codes:(country_codes_ : country_code list option)  () =
  ({
     forwarded_ip_config = forwarded_ip_config_;
     country_codes = country_codes_
   } : geo_match_statement)
let make_excluded_rule ~name:(name_ : string)  () =
  ({ name = name_ } : excluded_rule)
let make_count_action
  ?custom_request_handling:(custom_request_handling_ :
                             custom_request_handling option)
   () =
  ({ custom_request_handling = custom_request_handling_ } : count_action)
let make_captcha_action
  ?custom_request_handling:(custom_request_handling_ :
                             custom_request_handling option)
   () =
  ({ custom_request_handling = custom_request_handling_ } : captcha_action)
let make_challenge_action
  ?custom_request_handling:(custom_request_handling_ :
                             custom_request_handling option)
   () =
  ({ custom_request_handling = custom_request_handling_ } : challenge_action)
let make_rule_action ?challenge:(challenge_ : challenge_action option) 
  ?captcha:(captcha_ : captcha_action option) 
  ?count:(count_ : count_action option) 
  ?allow:(allow_ : allow_action option) 
  ?block:(block_ : block_action option)  () =
  ({
     challenge = challenge_;
     captcha = captcha_;
     count = count_;
     allow = allow_;
     block = block_
   } : rule_action)
let make_rule_action_override ~action_to_use:(action_to_use_ : rule_action) 
  ~name:(name_ : string)  () =
  ({ action_to_use = action_to_use_; name = name_ } : rule_action_override)
let make_rule_group_reference_statement
  ?rule_action_overrides:(rule_action_overrides_ :
                           rule_action_override list option)
   ?excluded_rules:(excluded_rules_ : excluded_rule list option) 
  ~ar_n:(ar_n_ : string)  () =
  ({
     rule_action_overrides = rule_action_overrides_;
     excluded_rules = excluded_rules_;
     ar_n = ar_n_
   } : rule_group_reference_statement)
let make_ip_set_forwarded_ip_config
  ~position:(position_ : forwarded_ip_position) 
  ~fallback_behavior:(fallback_behavior_ : fallback_behavior) 
  ~header_name:(header_name_ : string)  () =
  ({
     position = position_;
     fallback_behavior = fallback_behavior_;
     header_name = header_name_
   } : ip_set_forwarded_ip_config)
let make_ip_set_reference_statement
  ?ip_set_forwarded_ip_config:(ip_set_forwarded_ip_config_ :
                                ip_set_forwarded_ip_config option)
   ~ar_n:(ar_n_ : string)  () =
  ({ ip_set_forwarded_ip_config = ip_set_forwarded_ip_config_; ar_n = ar_n_ } : 
  ip_set_reference_statement)
let make_regex_pattern_set_reference_statement
  ~text_transformations:(text_transformations_ : text_transformation list) 
  ~field_to_match:(field_to_match_ : field_to_match)  ~ar_n:(ar_n_ : string) 
  () =
  ({
     text_transformations = text_transformations_;
     field_to_match = field_to_match_;
     ar_n = ar_n_
   } : regex_pattern_set_reference_statement)
let make_rate_limit_header
  ~text_transformations:(text_transformations_ : text_transformation list) 
  ~name:(name_ : string)  () =
  ({ text_transformations = text_transformations_; name = name_ } : rate_limit_header)
let make_rate_limit_cookie
  ~text_transformations:(text_transformations_ : text_transformation list) 
  ~name:(name_ : string)  () =
  ({ text_transformations = text_transformations_; name = name_ } : rate_limit_cookie)
let make_rate_limit_query_argument
  ~text_transformations:(text_transformations_ : text_transformation list) 
  ~name:(name_ : string)  () =
  ({ text_transformations = text_transformations_; name = name_ } : rate_limit_query_argument)
let make_rate_limit_query_string
  ~text_transformations:(text_transformations_ : text_transformation list) 
  () =
  ({ text_transformations = text_transformations_ } : rate_limit_query_string)
let make_rate_limit_http_method () = (() : rate_limit_http_method)
let make_rate_limit_forwarded_i_p () = (() : rate_limit_forwarded_i_p)
let make_rate_limit_i_p () = (() : rate_limit_i_p)
let make_rate_limit_label_namespace ~namespace:(namespace_ : string)  () =
  ({ namespace = namespace_ } : rate_limit_label_namespace)
let make_rate_limit_uri_path
  ~text_transformations:(text_transformations_ : text_transformation list) 
  () =
  ({ text_transformations = text_transformations_ } : rate_limit_uri_path)
let make_rate_based_statement_custom_key
  ?uri_path:(uri_path_ : rate_limit_uri_path option) 
  ?label_namespace:(label_namespace_ : rate_limit_label_namespace option) 
  ?i_p:(i_p_ : rate_limit_i_p option) 
  ?forwarded_i_p:(forwarded_i_p_ : rate_limit_forwarded_i_p option) 
  ?http_method:(http_method_ : rate_limit_http_method option) 
  ?query_string:(query_string_ : rate_limit_query_string option) 
  ?query_argument:(query_argument_ : rate_limit_query_argument option) 
  ?cookie:(cookie_ : rate_limit_cookie option) 
  ?header:(header_ : rate_limit_header option)  () =
  ({
     uri_path = uri_path_;
     label_namespace = label_namespace_;
     i_p = i_p_;
     forwarded_i_p = forwarded_i_p_;
     http_method = http_method_;
     query_string = query_string_;
     query_argument = query_argument_;
     cookie = cookie_;
     header = header_
   } : rate_based_statement_custom_key)
let make_username_field ~identifier:(identifier_ : string)  () =
  ({ identifier = identifier_ } : username_field)
let make_password_field ~identifier:(identifier_ : string)  () =
  ({ identifier = identifier_ } : password_field)
let make_aws_managed_rules_bot_control_rule_set
  ?enable_machine_learning:(enable_machine_learning_ : bool option) 
  ~inspection_level:(inspection_level_ : inspection_level)  () =
  ({
     enable_machine_learning = enable_machine_learning_;
     inspection_level = inspection_level_
   } : aws_managed_rules_bot_control_rule_set)
let make_request_inspection
  ~password_field:(password_field_ : password_field) 
  ~username_field:(username_field_ : username_field) 
  ~payload_type:(payload_type_ : payload_type)  () =
  ({
     password_field = password_field_;
     username_field = username_field_;
     payload_type = payload_type_
   } : request_inspection)
let make_response_inspection_status_code
  ~failure_codes:(failure_codes_ : int list) 
  ~success_codes:(success_codes_ : int list)  () =
  ({ failure_codes = failure_codes_; success_codes = success_codes_ } : 
  response_inspection_status_code)
let make_response_inspection_header
  ~failure_values:(failure_values_ : string list) 
  ~success_values:(success_values_ : string list)  ~name:(name_ : string)  ()
  =
  ({
     failure_values = failure_values_;
     success_values = success_values_;
     name = name_
   } : response_inspection_header)
let make_response_inspection_body_contains
  ~failure_strings:(failure_strings_ : string list) 
  ~success_strings:(success_strings_ : string list)  () =
  ({ failure_strings = failure_strings_; success_strings = success_strings_ } : 
  response_inspection_body_contains)
let make_response_inspection_json
  ~failure_values:(failure_values_ : string list) 
  ~success_values:(success_values_ : string list) 
  ~identifier:(identifier_ : string)  () =
  ({
     failure_values = failure_values_;
     success_values = success_values_;
     identifier = identifier_
   } : response_inspection_json)
let make_response_inspection ?json:(json_ : response_inspection_json option) 
  ?body_contains:(body_contains_ : response_inspection_body_contains option) 
  ?header:(header_ : response_inspection_header option) 
  ?status_code:(status_code_ : response_inspection_status_code option)  () =
  ({
     json = json_;
     body_contains = body_contains_;
     header = header_;
     status_code = status_code_
   } : response_inspection)
let make_aws_managed_rules_atp_rule_set
  ?enable_regex_in_path:(enable_regex_in_path_ : bool option) 
  ?response_inspection:(response_inspection_ : response_inspection option) 
  ?request_inspection:(request_inspection_ : request_inspection option) 
  ~login_path:(login_path_ : string)  () =
  ({
     enable_regex_in_path = enable_regex_in_path_;
     response_inspection = response_inspection_;
     request_inspection = request_inspection_;
     login_path = login_path_
   } : aws_managed_rules_atp_rule_set)
let make_email_field ~identifier:(identifier_ : string)  () =
  ({ identifier = identifier_ } : email_field)
let make_phone_number_field ~identifier:(identifier_ : string)  () =
  ({ identifier = identifier_ } : phone_number_field)
let make_address_field ~identifier:(identifier_ : string)  () =
  ({ identifier = identifier_ } : address_field)
let make_request_inspection_acf_p
  ?address_fields:(address_fields_ : address_field list option) 
  ?phone_number_fields:(phone_number_fields_ :
                         phone_number_field list option)
   ?email_field:(email_field_ : email_field option) 
  ?password_field:(password_field_ : password_field option) 
  ?username_field:(username_field_ : username_field option) 
  ~payload_type:(payload_type_ : payload_type)  () =
  ({
     address_fields = address_fields_;
     phone_number_fields = phone_number_fields_;
     email_field = email_field_;
     password_field = password_field_;
     username_field = username_field_;
     payload_type = payload_type_
   } : request_inspection_acf_p)
let make_aws_managed_rules_acfp_rule_set
  ?enable_regex_in_path:(enable_regex_in_path_ : bool option) 
  ?response_inspection:(response_inspection_ : response_inspection option) 
  ~request_inspection:(request_inspection_ : request_inspection_acf_p) 
  ~registration_page_path:(registration_page_path_ : string) 
  ~creation_path:(creation_path_ : string)  () =
  ({
     enable_regex_in_path = enable_regex_in_path_;
     response_inspection = response_inspection_;
     request_inspection = request_inspection_;
     registration_page_path = registration_page_path_;
     creation_path = creation_path_
   } : aws_managed_rules_acfp_rule_set)
let make_managed_rule_group_config
  ?aws_managed_rules_acfp_rule_set:(aws_managed_rules_acfp_rule_set_ :
                                     aws_managed_rules_acfp_rule_set option)
   ?aws_managed_rules_atp_rule_set:(aws_managed_rules_atp_rule_set_ :
                                     aws_managed_rules_atp_rule_set option)
   ?aws_managed_rules_bot_control_rule_set:(aws_managed_rules_bot_control_rule_set_
                                             :
                                             aws_managed_rules_bot_control_rule_set
                                               option)
   ?password_field:(password_field_ : password_field option) 
  ?username_field:(username_field_ : username_field option) 
  ?payload_type:(payload_type_ : payload_type option) 
  ?login_path:(login_path_ : string option)  () =
  ({
     aws_managed_rules_acfp_rule_set = aws_managed_rules_acfp_rule_set_;
     aws_managed_rules_atp_rule_set = aws_managed_rules_atp_rule_set_;
     aws_managed_rules_bot_control_rule_set =
       aws_managed_rules_bot_control_rule_set_;
     password_field = password_field_;
     username_field = username_field_;
     payload_type = payload_type_;
     login_path = login_path_
   } : managed_rule_group_config)
let make_label_match_statement ~key:(key_ : string) 
  ~scope:(scope_ : label_match_scope)  () =
  ({ key = key_; scope = scope_ } : label_match_statement)
let make_regex_match_statement
  ~text_transformations:(text_transformations_ : text_transformation list) 
  ~field_to_match:(field_to_match_ : field_to_match) 
  ~regex_string:(regex_string_ : string)  () =
  ({
     text_transformations = text_transformations_;
     field_to_match = field_to_match_;
     regex_string = regex_string_
   } : regex_match_statement)
let rec make_and_statement ~statements:(statements_ : statement list)  () =
  ({ statements = statements_ } : and_statement)
and make_managed_rule_group_statement
  ?rule_action_overrides:(rule_action_overrides_ :
                           rule_action_override list option)
   ?managed_rule_group_configs:(managed_rule_group_configs_ :
                                 managed_rule_group_config list option)
   ?scope_down_statement:(scope_down_statement_ : statement option) 
  ?excluded_rules:(excluded_rules_ : excluded_rule list option) 
  ?version:(version_ : string option)  ~name:(name_ : string) 
  ~vendor_name:(vendor_name_ : string)  () =
  ({
     rule_action_overrides = rule_action_overrides_;
     managed_rule_group_configs = managed_rule_group_configs_;
     scope_down_statement = scope_down_statement_;
     excluded_rules = excluded_rules_;
     version = version_;
     name = name_;
     vendor_name = vendor_name_
   } : managed_rule_group_statement)
and make_not_statement ~statement:(statement_ : statement)  () =
  ({ statement = statement_ } : not_statement)
and make_or_statement ~statements:(statements_ : statement list)  () =
  ({ statements = statements_ } : or_statement)
and make_rate_based_statement
  ?custom_keys:(custom_keys_ : rate_based_statement_custom_key list option) 
  ?forwarded_ip_config:(forwarded_ip_config_ : forwarded_ip_config option) 
  ?scope_down_statement:(scope_down_statement_ : statement option) 
  ?evaluation_window_sec:(evaluation_window_sec_ : int option) 
  ~aggregate_key_type:(aggregate_key_type_ :
                        rate_based_statement_aggregate_key_type)
   ~limit:(limit_ : int)  () =
  ({
     custom_keys = custom_keys_;
     forwarded_ip_config = forwarded_ip_config_;
     scope_down_statement = scope_down_statement_;
     aggregate_key_type = aggregate_key_type_;
     evaluation_window_sec = evaluation_window_sec_;
     limit = limit_
   } : rate_based_statement)
and make_statement
  ?regex_match_statement:(regex_match_statement_ :
                           regex_match_statement option)
   ?label_match_statement:(label_match_statement_ :
                            label_match_statement option)
   ?managed_rule_group_statement:(managed_rule_group_statement_ :
                                   managed_rule_group_statement option)
   ?not_statement:(not_statement_ : not_statement option) 
  ?or_statement:(or_statement_ : or_statement option) 
  ?and_statement:(and_statement_ : and_statement option) 
  ?rate_based_statement:(rate_based_statement_ : rate_based_statement option)
   ?regex_pattern_set_reference_statement:(regex_pattern_set_reference_statement_
                                            :
                                            regex_pattern_set_reference_statement
                                              option)
   ?ip_set_reference_statement:(ip_set_reference_statement_ :
                                 ip_set_reference_statement option)
   ?rule_group_reference_statement:(rule_group_reference_statement_ :
                                     rule_group_reference_statement option)
   ?geo_match_statement:(geo_match_statement_ : geo_match_statement option) 
  ?size_constraint_statement:(size_constraint_statement_ :
                               size_constraint_statement option)
   ?xss_match_statement:(xss_match_statement_ : xss_match_statement option) 
  ?sqli_match_statement:(sqli_match_statement_ : sqli_match_statement option)
   ?byte_match_statement:(byte_match_statement_ :
                           byte_match_statement option)
   () =
  ({
     regex_match_statement = regex_match_statement_;
     label_match_statement = label_match_statement_;
     managed_rule_group_statement = managed_rule_group_statement_;
     not_statement = not_statement_;
     or_statement = or_statement_;
     and_statement = and_statement_;
     rate_based_statement = rate_based_statement_;
     regex_pattern_set_reference_statement =
       regex_pattern_set_reference_statement_;
     ip_set_reference_statement = ip_set_reference_statement_;
     rule_group_reference_statement = rule_group_reference_statement_;
     geo_match_statement = geo_match_statement_;
     size_constraint_statement = size_constraint_statement_;
     xss_match_statement = xss_match_statement_;
     sqli_match_statement = sqli_match_statement_;
     byte_match_statement = byte_match_statement_
   } : statement)
let make_none_action () = (() : none_action)
let make_override_action ?none:(none_ : none_action option) 
  ?count:(count_ : count_action option)  () =
  ({ none = none_; count = count_ } : override_action)
let make_label ~name:(name_ : string)  () = ({ name = name_ } : label)
let make_visibility_config ~metric_name:(metric_name_ : string) 
  ~cloud_watch_metrics_enabled:(cloud_watch_metrics_enabled_ : bool) 
  ~sampled_requests_enabled:(sampled_requests_enabled_ : bool)  () =
  ({
     metric_name = metric_name_;
     cloud_watch_metrics_enabled = cloud_watch_metrics_enabled_;
     sampled_requests_enabled = sampled_requests_enabled_
   } : visibility_config)
let make_immunity_time_property ~immunity_time:(immunity_time_ : int)  () =
  ({ immunity_time = immunity_time_ } : immunity_time_property)
let make_captcha_config
  ?immunity_time_property:(immunity_time_property_ :
                            immunity_time_property option)
   () =
  ({ immunity_time_property = immunity_time_property_ } : captcha_config)
let make_challenge_config
  ?immunity_time_property:(immunity_time_property_ :
                            immunity_time_property option)
   () =
  ({ immunity_time_property = immunity_time_property_ } : challenge_config)
let make_rule ?challenge_config:(challenge_config_ : challenge_config option)
   ?captcha_config:(captcha_config_ : captcha_config option) 
  ?rule_labels:(rule_labels_ : label list option) 
  ?override_action:(override_action_ : override_action option) 
  ?action:(action_ : rule_action option) 
  ~visibility_config:(visibility_config_ : visibility_config) 
  ~statement:(statement_ : statement)  ~priority:(priority_ : int) 
  ~name:(name_ : string)  () =
  ({
     challenge_config = challenge_config_;
     captcha_config = captcha_config_;
     visibility_config = visibility_config_;
     rule_labels = rule_labels_;
     override_action = override_action_;
     action = action_;
     statement = statement_;
     priority = priority_;
     name = name_
   } : rule)
let make_firewall_manager_statement
  ?rule_group_reference_statement:(rule_group_reference_statement_ :
                                    rule_group_reference_statement option)
   ?managed_rule_group_statement:(managed_rule_group_statement_ :
                                   managed_rule_group_statement option)
   () =
  ({
     rule_group_reference_statement = rule_group_reference_statement_;
     managed_rule_group_statement = managed_rule_group_statement_
   } : firewall_manager_statement)
let make_firewall_manager_rule_group
  ~visibility_config:(visibility_config_ : visibility_config) 
  ~override_action:(override_action_ : override_action) 
  ~firewall_manager_statement:(firewall_manager_statement_ :
                                firewall_manager_statement)
   ~priority:(priority_ : int)  ~name:(name_ : string)  () =
  ({
     visibility_config = visibility_config_;
     override_action = override_action_;
     firewall_manager_statement = firewall_manager_statement_;
     priority = priority_;
     name = name_
   } : firewall_manager_rule_group)
let make_custom_response_body ~content:(content_ : string) 
  ~content_type:(content_type_ : response_content_type)  () =
  ({ content = content_; content_type = content_type_ } : custom_response_body)
let make_request_body_associated_resource_type_config
  ~default_size_inspection_limit:(default_size_inspection_limit_ :
                                   size_inspection_limit)
   () =
  ({ default_size_inspection_limit = default_size_inspection_limit_ } : 
  request_body_associated_resource_type_config)
let make_association_config
  ?request_body:(request_body_ : request_body option)  () =
  ({ request_body = request_body_ } : association_config)
let make_web_ac_l
  ?association_config:(association_config_ : association_config option) 
  ?token_domains:(token_domains_ : string list option) 
  ?challenge_config:(challenge_config_ : challenge_config option) 
  ?captcha_config:(captcha_config_ : captcha_config option) 
  ?custom_response_bodies:(custom_response_bodies_ :
                            custom_response_bodies option)
   ?label_namespace:(label_namespace_ : string option) 
  ?managed_by_firewall_manager:(managed_by_firewall_manager_ : bool option) 
  ?post_process_firewall_manager_rule_groups:(post_process_firewall_manager_rule_groups_
                                               :
                                               firewall_manager_rule_group
                                                 list option)
   ?pre_process_firewall_manager_rule_groups:(pre_process_firewall_manager_rule_groups_
                                               :
                                               firewall_manager_rule_group
                                                 list option)
   ?capacity:(capacity_ : int option)  ?rules:(rules_ : rule list option) 
  ?description:(description_ : string option) 
  ~visibility_config:(visibility_config_ : visibility_config) 
  ~default_action:(default_action_ : default_action)  ~ar_n:(ar_n_ : string) 
  ~id:(id_ : string)  ~name:(name_ : string)  () =
  ({
     association_config = association_config_;
     token_domains = token_domains_;
     challenge_config = challenge_config_;
     captcha_config = captcha_config_;
     custom_response_bodies = custom_response_bodies_;
     label_namespace = label_namespace_;
     managed_by_firewall_manager = managed_by_firewall_manager_;
     post_process_firewall_manager_rule_groups =
       post_process_firewall_manager_rule_groups_;
     pre_process_firewall_manager_rule_groups =
       pre_process_firewall_manager_rule_groups_;
     capacity = capacity_;
     visibility_config = visibility_config_;
     rules = rules_;
     description = description_;
     default_action = default_action_;
     ar_n = ar_n_;
     id = id_;
     name = name_
   } : web_ac_l)
let make_version_to_publish
  ?forecasted_lifetime:(forecasted_lifetime_ : int option) 
  ?associated_rule_group_arn:(associated_rule_group_arn_ : string option)  ()
  =
  ({
     forecasted_lifetime = forecasted_lifetime_;
     associated_rule_group_arn = associated_rule_group_arn_
   } : version_to_publish)
let make_update_web_acl_response
  ?next_lock_token:(next_lock_token_ : string option)  () =
  ({ next_lock_token = next_lock_token_ } : update_web_acl_response)
let make_update_web_acl_request
  ?association_config:(association_config_ : association_config option) 
  ?token_domains:(token_domains_ : string list option) 
  ?challenge_config:(challenge_config_ : challenge_config option) 
  ?captcha_config:(captcha_config_ : captcha_config option) 
  ?custom_response_bodies:(custom_response_bodies_ :
                            custom_response_bodies option)
   ?rules:(rules_ : rule list option) 
  ?description:(description_ : string option) 
  ~lock_token:(lock_token_ : string) 
  ~visibility_config:(visibility_config_ : visibility_config) 
  ~default_action:(default_action_ : default_action)  ~id:(id_ : string) 
  ~scope:(scope_ : scope)  ~name:(name_ : string)  () =
  ({
     association_config = association_config_;
     token_domains = token_domains_;
     challenge_config = challenge_config_;
     captcha_config = captcha_config_;
     custom_response_bodies = custom_response_bodies_;
     lock_token = lock_token_;
     visibility_config = visibility_config_;
     rules = rules_;
     description = description_;
     default_action = default_action_;
     id = id_;
     scope = scope_;
     name = name_
   } : update_web_acl_request)
let make_update_rule_group_response
  ?next_lock_token:(next_lock_token_ : string option)  () =
  ({ next_lock_token = next_lock_token_ } : update_rule_group_response)
let make_update_rule_group_request
  ?custom_response_bodies:(custom_response_bodies_ :
                            custom_response_bodies option)
   ?rules:(rules_ : rule list option) 
  ?description:(description_ : string option) 
  ~lock_token:(lock_token_ : string) 
  ~visibility_config:(visibility_config_ : visibility_config) 
  ~id:(id_ : string)  ~scope:(scope_ : scope)  ~name:(name_ : string)  () =
  ({
     custom_response_bodies = custom_response_bodies_;
     lock_token = lock_token_;
     visibility_config = visibility_config_;
     rules = rules_;
     description = description_;
     id = id_;
     scope = scope_;
     name = name_
   } : update_rule_group_request)
let make_update_regex_pattern_set_response
  ?next_lock_token:(next_lock_token_ : string option)  () =
  ({ next_lock_token = next_lock_token_ } : update_regex_pattern_set_response)
let make_regex ?regex_string:(regex_string_ : string option)  () =
  ({ regex_string = regex_string_ } : regex)
let make_update_regex_pattern_set_request
  ?description:(description_ : string option) 
  ~lock_token:(lock_token_ : string) 
  ~regular_expression_list:(regular_expression_list_ : regex list) 
  ~id:(id_ : string)  ~scope:(scope_ : scope)  ~name:(name_ : string)  () =
  ({
     lock_token = lock_token_;
     regular_expression_list = regular_expression_list_;
     description = description_;
     id = id_;
     scope = scope_;
     name = name_
   } : update_regex_pattern_set_request)
let make_update_managed_rule_set_version_expiry_date_response
  ?next_lock_token:(next_lock_token_ : string option) 
  ?expiry_timestamp:(expiry_timestamp_ : CoreTypes.Timestamp.t option) 
  ?expiring_version:(expiring_version_ : string option)  () =
  ({
     next_lock_token = next_lock_token_;
     expiry_timestamp = expiry_timestamp_;
     expiring_version = expiring_version_
   } : update_managed_rule_set_version_expiry_date_response)
let make_update_managed_rule_set_version_expiry_date_request
  ~expiry_timestamp:(expiry_timestamp_ : CoreTypes.Timestamp.t) 
  ~version_to_expire:(version_to_expire_ : string) 
  ~lock_token:(lock_token_ : string)  ~id:(id_ : string) 
  ~scope:(scope_ : scope)  ~name:(name_ : string)  () =
  ({
     expiry_timestamp = expiry_timestamp_;
     version_to_expire = version_to_expire_;
     lock_token = lock_token_;
     id = id_;
     scope = scope_;
     name = name_
   } : update_managed_rule_set_version_expiry_date_request)
let make_update_ip_set_response
  ?next_lock_token:(next_lock_token_ : string option)  () =
  ({ next_lock_token = next_lock_token_ } : update_ip_set_response)
let make_update_ip_set_request ?description:(description_ : string option) 
  ~lock_token:(lock_token_ : string)  ~addresses:(addresses_ : string list) 
  ~id:(id_ : string)  ~scope:(scope_ : scope)  ~name:(name_ : string)  () =
  ({
     lock_token = lock_token_;
     addresses = addresses_;
     description = description_;
     id = id_;
     scope = scope_;
     name = name_
   } : update_ip_set_request)
let make_untag_resource_response () = (() : untag_resource_response)
let make_untag_resource_request ~tag_keys:(tag_keys_ : string list) 
  ~resource_ar_n:(resource_ar_n_ : string)  () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)
let make_time_window ~end_time:(end_time_ : CoreTypes.Timestamp.t) 
  ~start_time:(start_time_ : CoreTypes.Timestamp.t)  () =
  ({ end_time = end_time_; start_time = start_time_ } : time_window)
let make_tag_resource_response () = (() : tag_resource_response)
let make_tag ~value:(value_ : string)  ~key:(key_ : string)  () =
  ({ value = value_; key = key_ } : tag)
let make_tag_resource_request ~tags:(tags_ : tag list) 
  ~resource_ar_n:(resource_ar_n_ : string)  () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)
let make_tag_info_for_resource ?tag_list:(tag_list_ : tag list option) 
  ?resource_ar_n:(resource_ar_n_ : string option)  () =
  ({ tag_list = tag_list_; resource_ar_n = resource_ar_n_ } : tag_info_for_resource)
let make_http_header ?value:(value_ : string option) 
  ?name:(name_ : string option)  () =
  ({ value = value_; name = name_ } : http_header)
let make_http_request ?headers:(headers_ : http_header list option) 
  ?http_version:(http_version_ : string option) 
  ?method_:(method__ : string option)  ?ur_i:(ur_i_ : string option) 
  ?country:(country_ : string option) 
  ?client_i_p:(client_i_p_ : string option)  () =
  ({
     headers = headers_;
     http_version = http_version_;
     method_ = method__;
     ur_i = ur_i_;
     country = country_;
     client_i_p = client_i_p_
   } : http_request)
let make_captcha_response
  ?failure_reason:(failure_reason_ : failure_reason option) 
  ?solve_timestamp:(solve_timestamp_ : int option) 
  ?response_code:(response_code_ : int option)  () =
  ({
     failure_reason = failure_reason_;
     solve_timestamp = solve_timestamp_;
     response_code = response_code_
   } : captcha_response)
let make_challenge_response
  ?failure_reason:(failure_reason_ : failure_reason option) 
  ?solve_timestamp:(solve_timestamp_ : int option) 
  ?response_code:(response_code_ : int option)  () =
  ({
     failure_reason = failure_reason_;
     solve_timestamp = solve_timestamp_;
     response_code = response_code_
   } : challenge_response)
let make_sampled_http_request
  ?overridden_action:(overridden_action_ : string option) 
  ?challenge_response:(challenge_response_ : challenge_response option) 
  ?captcha_response:(captcha_response_ : captcha_response option) 
  ?labels:(labels_ : label list option) 
  ?response_code_sent:(response_code_sent_ : int option) 
  ?request_headers_inserted:(request_headers_inserted_ :
                              http_header list option)
   ?rule_name_within_rule_group:(rule_name_within_rule_group_ :
                                  string option)
   ?action:(action_ : string option) 
  ?timestamp_:(timestamp__ : CoreTypes.Timestamp.t option) 
  ~weight:(weight_ : int)  ~request:(request_ : http_request)  () =
  ({
     overridden_action = overridden_action_;
     challenge_response = challenge_response_;
     captcha_response = captcha_response_;
     labels = labels_;
     response_code_sent = response_code_sent_;
     request_headers_inserted = request_headers_inserted_;
     rule_name_within_rule_group = rule_name_within_rule_group_;
     action = action_;
     timestamp_ = timestamp__;
     weight = weight_;
     request = request_
   } : sampled_http_request)
let make_rule_summary ?action:(action_ : rule_action option) 
  ?name:(name_ : string option)  () =
  ({ action = action_; name = name_ } : rule_summary)
let make_rule_group_summary ?ar_n:(ar_n_ : string option) 
  ?lock_token:(lock_token_ : string option) 
  ?description:(description_ : string option)  ?id:(id_ : string option) 
  ?name:(name_ : string option)  () =
  ({
     ar_n = ar_n_;
     lock_token = lock_token_;
     description = description_;
     id = id_;
     name = name_
   } : rule_group_summary)
let make_label_summary ?name:(name_ : string option)  () =
  ({ name = name_ } : label_summary)
let make_rule_group
  ?consumed_labels:(consumed_labels_ : label_summary list option) 
  ?available_labels:(available_labels_ : label_summary list option) 
  ?custom_response_bodies:(custom_response_bodies_ :
                            custom_response_bodies option)
   ?label_namespace:(label_namespace_ : string option) 
  ?rules:(rules_ : rule list option) 
  ?description:(description_ : string option) 
  ~visibility_config:(visibility_config_ : visibility_config) 
  ~ar_n:(ar_n_ : string)  ~capacity:(capacity_ : int)  ~id:(id_ : string) 
  ~name:(name_ : string)  () =
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
     name = name_
   } : rule_group)
let make_release_summary
  ?timestamp_:(timestamp__ : CoreTypes.Timestamp.t option) 
  ?release_version:(release_version_ : string option)  () =
  ({ timestamp_ = timestamp__; release_version = release_version_ } : 
  release_summary)
let make_regex_pattern_set_summary ?ar_n:(ar_n_ : string option) 
  ?lock_token:(lock_token_ : string option) 
  ?description:(description_ : string option)  ?id:(id_ : string option) 
  ?name:(name_ : string option)  () =
  ({
     ar_n = ar_n_;
     lock_token = lock_token_;
     description = description_;
     id = id_;
     name = name_
   } : regex_pattern_set_summary)
let make_regex_pattern_set
  ?regular_expression_list:(regular_expression_list_ : regex list option) 
  ?description:(description_ : string option)  ?ar_n:(ar_n_ : string option) 
  ?id:(id_ : string option)  ?name:(name_ : string option)  () =
  ({
     regular_expression_list = regular_expression_list_;
     description = description_;
     ar_n = ar_n_;
     id = id_;
     name = name_
   } : regex_pattern_set)
let make_rate_based_statement_managed_keys_ip_set
  ?addresses:(addresses_ : string list option) 
  ?ip_address_version:(ip_address_version_ : ip_address_version option)  () =
  ({ addresses = addresses_; ip_address_version = ip_address_version_ } : 
  rate_based_statement_managed_keys_ip_set)
let make_put_permission_policy_response () =
  (() : put_permission_policy_response)
let make_put_permission_policy_request ~policy:(policy_ : string) 
  ~resource_arn:(resource_arn_ : string)  () =
  ({ policy = policy_; resource_arn = resource_arn_ } : put_permission_policy_request)
let make_put_managed_rule_set_versions_response
  ?next_lock_token:(next_lock_token_ : string option)  () =
  ({ next_lock_token = next_lock_token_ } : put_managed_rule_set_versions_response)
let make_put_managed_rule_set_versions_request
  ?versions_to_publish:(versions_to_publish_ : versions_to_publish option) 
  ?recommended_version:(recommended_version_ : string option) 
  ~lock_token:(lock_token_ : string)  ~id:(id_ : string) 
  ~scope:(scope_ : scope)  ~name:(name_ : string)  () =
  ({
     versions_to_publish = versions_to_publish_;
     recommended_version = recommended_version_;
     lock_token = lock_token_;
     id = id_;
     scope = scope_;
     name = name_
   } : put_managed_rule_set_versions_request)
let make_action_condition ~action:(action_ : action_value)  () =
  ({ action = action_ } : action_condition)
let make_label_name_condition ~label_name:(label_name_ : string)  () =
  ({ label_name = label_name_ } : label_name_condition)
let make_condition
  ?label_name_condition:(label_name_condition_ : label_name_condition option)
   ?action_condition:(action_condition_ : action_condition option)  () =
  ({
     label_name_condition = label_name_condition_;
     action_condition = action_condition_
   } : condition)
let make_filter ~conditions:(conditions_ : condition list) 
  ~requirement:(requirement_ : filter_requirement) 
  ~behavior:(behavior_ : filter_behavior)  () =
  ({
     conditions = conditions_;
     requirement = requirement_;
     behavior = behavior_
   } : filter)
let make_logging_filter
  ~default_behavior:(default_behavior_ : filter_behavior) 
  ~filters:(filters_ : filter list)  () =
  ({ default_behavior = default_behavior_; filters = filters_ } : logging_filter)
let make_logging_configuration ?log_scope:(log_scope_ : log_scope option) 
  ?log_type:(log_type_ : log_type option) 
  ?logging_filter:(logging_filter_ : logging_filter option) 
  ?managed_by_firewall_manager:(managed_by_firewall_manager_ : bool option) 
  ?redacted_fields:(redacted_fields_ : field_to_match list option) 
  ~log_destination_configs:(log_destination_configs_ : string list) 
  ~resource_arn:(resource_arn_ : string)  () =
  ({
     log_scope = log_scope_;
     log_type = log_type_;
     logging_filter = logging_filter_;
     managed_by_firewall_manager = managed_by_firewall_manager_;
     redacted_fields = redacted_fields_;
     log_destination_configs = log_destination_configs_;
     resource_arn = resource_arn_
   } : logging_configuration)
let make_put_logging_configuration_response
  ?logging_configuration:(logging_configuration_ :
                           logging_configuration option)
   () =
  ({ logging_configuration = logging_configuration_ } : put_logging_configuration_response)
let make_put_logging_configuration_request
  ~logging_configuration:(logging_configuration_ : logging_configuration)  ()
  =
  ({ logging_configuration = logging_configuration_ } : put_logging_configuration_request)
let make_managed_rule_set_version
  ?expiry_timestamp:(expiry_timestamp_ : CoreTypes.Timestamp.t option) 
  ?last_update_timestamp:(last_update_timestamp_ :
                           CoreTypes.Timestamp.t option)
   ?publish_timestamp:(publish_timestamp_ : CoreTypes.Timestamp.t option) 
  ?forecasted_lifetime:(forecasted_lifetime_ : int option) 
  ?capacity:(capacity_ : int option) 
  ?associated_rule_group_arn:(associated_rule_group_arn_ : string option)  ()
  =
  ({
     expiry_timestamp = expiry_timestamp_;
     last_update_timestamp = last_update_timestamp_;
     publish_timestamp = publish_timestamp_;
     forecasted_lifetime = forecasted_lifetime_;
     capacity = capacity_;
     associated_rule_group_arn = associated_rule_group_arn_
   } : managed_rule_set_version)
let make_mobile_sdk_release ?tags:(tags_ : tag list option) 
  ?release_notes:(release_notes_ : string option) 
  ?timestamp_:(timestamp__ : CoreTypes.Timestamp.t option) 
  ?release_version:(release_version_ : string option)  () =
  ({
     tags = tags_;
     release_notes = release_notes_;
     timestamp_ = timestamp__;
     release_version = release_version_
   } : mobile_sdk_release)
let make_managed_rule_set_summary
  ?label_namespace:(label_namespace_ : string option) 
  ?ar_n:(ar_n_ : string option)  ?lock_token:(lock_token_ : string option) 
  ?description:(description_ : string option)  ?id:(id_ : string option) 
  ?name:(name_ : string option)  () =
  ({
     label_namespace = label_namespace_;
     ar_n = ar_n_;
     lock_token = lock_token_;
     description = description_;
     id = id_;
     name = name_
   } : managed_rule_set_summary)
let make_managed_rule_set ?label_namespace:(label_namespace_ : string option)
   ?recommended_version:(recommended_version_ : string option) 
  ?published_versions:(published_versions_ : published_versions option) 
  ?description:(description_ : string option)  ~ar_n:(ar_n_ : string) 
  ~id:(id_ : string)  ~name:(name_ : string)  () =
  ({
     label_namespace = label_namespace_;
     recommended_version = recommended_version_;
     published_versions = published_versions_;
     description = description_;
     ar_n = ar_n_;
     id = id_;
     name = name_
   } : managed_rule_set)
let make_managed_rule_group_version
  ?last_update_timestamp:(last_update_timestamp_ :
                           CoreTypes.Timestamp.t option)
   ?name:(name_ : string option)  () =
  ({ last_update_timestamp = last_update_timestamp_; name = name_ } : 
  managed_rule_group_version)
let make_managed_rule_group_summary
  ?description:(description_ : string option) 
  ?versioning_supported:(versioning_supported_ : bool option) 
  ?name:(name_ : string option)  ?vendor_name:(vendor_name_ : string option) 
  () =
  ({
     description = description_;
     versioning_supported = versioning_supported_;
     name = name_;
     vendor_name = vendor_name_
   } : managed_rule_group_summary)
let make_managed_product_descriptor
  ?is_advanced_managed_rule_set:(is_advanced_managed_rule_set_ : bool option)
   ?is_versioning_supported:(is_versioning_supported_ : bool option) 
  ?sns_topic_arn:(sns_topic_arn_ : string option) 
  ?product_description:(product_description_ : string option) 
  ?product_title:(product_title_ : string option) 
  ?product_link:(product_link_ : string option) 
  ?product_id:(product_id_ : string option) 
  ?managed_rule_set_name:(managed_rule_set_name_ : string option) 
  ?vendor_name:(vendor_name_ : string option)  () =
  ({
     is_advanced_managed_rule_set = is_advanced_managed_rule_set_;
     is_versioning_supported = is_versioning_supported_;
     sns_topic_arn = sns_topic_arn_;
     product_description = product_description_;
     product_title = product_title_;
     product_link = product_link_;
     product_id = product_id_;
     managed_rule_set_name = managed_rule_set_name_;
     vendor_name = vendor_name_
   } : managed_product_descriptor)
let make_list_web_ac_ls_response
  ?web_ac_ls:(web_ac_ls_ : web_acl_summary list option) 
  ?next_marker:(next_marker_ : string option)  () =
  ({ web_ac_ls = web_ac_ls_; next_marker = next_marker_ } : list_web_ac_ls_response)
let make_list_web_ac_ls_request ?limit:(limit_ : int option) 
  ?next_marker:(next_marker_ : string option)  ~scope:(scope_ : scope)  () =
  ({ limit = limit_; next_marker = next_marker_; scope = scope_ } : list_web_ac_ls_request)
let make_list_tags_for_resource_response
  ?tag_info_for_resource:(tag_info_for_resource_ :
                           tag_info_for_resource option)
   ?next_marker:(next_marker_ : string option)  () =
  ({
     tag_info_for_resource = tag_info_for_resource_;
     next_marker = next_marker_
   } : list_tags_for_resource_response)
let make_list_tags_for_resource_request ?limit:(limit_ : int option) 
  ?next_marker:(next_marker_ : string option) 
  ~resource_ar_n:(resource_ar_n_ : string)  () =
  ({
     resource_ar_n = resource_ar_n_;
     limit = limit_;
     next_marker = next_marker_
   } : list_tags_for_resource_request)
let make_list_rule_groups_response
  ?rule_groups:(rule_groups_ : rule_group_summary list option) 
  ?next_marker:(next_marker_ : string option)  () =
  ({ rule_groups = rule_groups_; next_marker = next_marker_ } : list_rule_groups_response)
let make_list_rule_groups_request ?limit:(limit_ : int option) 
  ?next_marker:(next_marker_ : string option)  ~scope:(scope_ : scope)  () =
  ({ limit = limit_; next_marker = next_marker_; scope = scope_ } : list_rule_groups_request)
let make_list_resources_for_web_acl_response
  ?resource_arns:(resource_arns_ : string list option)  () =
  ({ resource_arns = resource_arns_ } : list_resources_for_web_acl_response)
let make_list_resources_for_web_acl_request
  ?resource_type:(resource_type_ : resource_type option) 
  ~web_acl_arn:(web_acl_arn_ : string)  () =
  ({ resource_type = resource_type_; web_acl_arn = web_acl_arn_ } : list_resources_for_web_acl_request)
let make_list_regex_pattern_sets_response
  ?regex_pattern_sets:(regex_pattern_sets_ :
                        regex_pattern_set_summary list option)
   ?next_marker:(next_marker_ : string option)  () =
  ({ regex_pattern_sets = regex_pattern_sets_; next_marker = next_marker_ } : 
  list_regex_pattern_sets_response)
let make_list_regex_pattern_sets_request ?limit:(limit_ : int option) 
  ?next_marker:(next_marker_ : string option)  ~scope:(scope_ : scope)  () =
  ({ limit = limit_; next_marker = next_marker_; scope = scope_ } : list_regex_pattern_sets_request)
let make_list_mobile_sdk_releases_response
  ?next_marker:(next_marker_ : string option) 
  ?release_summaries:(release_summaries_ : release_summary list option)  () =
  ({ next_marker = next_marker_; release_summaries = release_summaries_ } : 
  list_mobile_sdk_releases_response)
let make_list_mobile_sdk_releases_request ?limit:(limit_ : int option) 
  ?next_marker:(next_marker_ : string option) 
  ~platform:(platform_ : platform)  () =
  ({ limit = limit_; next_marker = next_marker_; platform = platform_ } : 
  list_mobile_sdk_releases_request)
let make_list_managed_rule_sets_response
  ?managed_rule_sets:(managed_rule_sets_ :
                       managed_rule_set_summary list option)
   ?next_marker:(next_marker_ : string option)  () =
  ({ managed_rule_sets = managed_rule_sets_; next_marker = next_marker_ } : 
  list_managed_rule_sets_response)
let make_list_managed_rule_sets_request ?limit:(limit_ : int option) 
  ?next_marker:(next_marker_ : string option)  ~scope:(scope_ : scope)  () =
  ({ limit = limit_; next_marker = next_marker_; scope = scope_ } : list_managed_rule_sets_request)
let make_list_logging_configurations_response
  ?next_marker:(next_marker_ : string option) 
  ?logging_configurations:(logging_configurations_ :
                            logging_configuration list option)
   () =
  ({
     next_marker = next_marker_;
     logging_configurations = logging_configurations_
   } : list_logging_configurations_response)
let make_list_logging_configurations_request
  ?log_scope:(log_scope_ : log_scope option)  ?limit:(limit_ : int option) 
  ?next_marker:(next_marker_ : string option)  ~scope:(scope_ : scope)  () =
  ({
     log_scope = log_scope_;
     limit = limit_;
     next_marker = next_marker_;
     scope = scope_
   } : list_logging_configurations_request)
let make_ip_set_summary ?ar_n:(ar_n_ : string option) 
  ?lock_token:(lock_token_ : string option) 
  ?description:(description_ : string option)  ?id:(id_ : string option) 
  ?name:(name_ : string option)  () =
  ({
     ar_n = ar_n_;
     lock_token = lock_token_;
     description = description_;
     id = id_;
     name = name_
   } : ip_set_summary)
let make_list_ip_sets_response
  ?ip_sets:(ip_sets_ : ip_set_summary list option) 
  ?next_marker:(next_marker_ : string option)  () =
  ({ ip_sets = ip_sets_; next_marker = next_marker_ } : list_ip_sets_response)
let make_list_ip_sets_request ?limit:(limit_ : int option) 
  ?next_marker:(next_marker_ : string option)  ~scope:(scope_ : scope)  () =
  ({ limit = limit_; next_marker = next_marker_; scope = scope_ } : list_ip_sets_request)
let make_list_available_managed_rule_groups_response
  ?managed_rule_groups:(managed_rule_groups_ :
                         managed_rule_group_summary list option)
   ?next_marker:(next_marker_ : string option)  () =
  ({ managed_rule_groups = managed_rule_groups_; next_marker = next_marker_ } : 
  list_available_managed_rule_groups_response)
let make_list_available_managed_rule_groups_request
  ?limit:(limit_ : int option)  ?next_marker:(next_marker_ : string option) 
  ~scope:(scope_ : scope)  () =
  ({ limit = limit_; next_marker = next_marker_; scope = scope_ } : list_available_managed_rule_groups_request)
let make_list_available_managed_rule_group_versions_response
  ?current_default_version:(current_default_version_ : string option) 
  ?versions:(versions_ : managed_rule_group_version list option) 
  ?next_marker:(next_marker_ : string option)  () =
  ({
     current_default_version = current_default_version_;
     versions = versions_;
     next_marker = next_marker_
   } : list_available_managed_rule_group_versions_response)
let make_list_available_managed_rule_group_versions_request
  ?limit:(limit_ : int option)  ?next_marker:(next_marker_ : string option) 
  ~scope:(scope_ : scope)  ~name:(name_ : string) 
  ~vendor_name:(vendor_name_ : string)  () =
  ({
     limit = limit_;
     next_marker = next_marker_;
     scope = scope_;
     name = name_;
     vendor_name = vendor_name_
   } : list_available_managed_rule_group_versions_request)
let make_api_key_summary ?version:(version_ : int option) 
  ?creation_timestamp:(creation_timestamp_ : CoreTypes.Timestamp.t option) 
  ?api_key:(api_key_ : string option) 
  ?token_domains:(token_domains_ : string list option)  () =
  ({
     version = version_;
     creation_timestamp = creation_timestamp_;
     api_key = api_key_;
     token_domains = token_domains_
   } : api_key_summary)
let make_list_api_keys_response
  ?application_integration_ur_l:(application_integration_ur_l_ :
                                  string option)
   ?api_key_summaries:(api_key_summaries_ : api_key_summary list option) 
  ?next_marker:(next_marker_ : string option)  () =
  ({
     application_integration_ur_l = application_integration_ur_l_;
     api_key_summaries = api_key_summaries_;
     next_marker = next_marker_
   } : list_api_keys_response)
let make_list_api_keys_request ?limit:(limit_ : int option) 
  ?next_marker:(next_marker_ : string option)  ~scope:(scope_ : scope)  () =
  ({ limit = limit_; next_marker = next_marker_; scope = scope_ } : list_api_keys_request)
let make_ip_set ?description:(description_ : string option) 
  ~addresses:(addresses_ : string list) 
  ~ip_address_version:(ip_address_version_ : ip_address_version) 
  ~ar_n:(ar_n_ : string)  ~id:(id_ : string)  ~name:(name_ : string)  () =
  ({
     addresses = addresses_;
     ip_address_version = ip_address_version_;
     description = description_;
     ar_n = ar_n_;
     id = id_;
     name = name_
   } : ip_set)
let make_get_web_acl_response
  ?application_integration_ur_l:(application_integration_ur_l_ :
                                  string option)
   ?lock_token:(lock_token_ : string option) 
  ?web_ac_l:(web_ac_l_ : web_ac_l option)  () =
  ({
     application_integration_ur_l = application_integration_ur_l_;
     lock_token = lock_token_;
     web_ac_l = web_ac_l_
   } : get_web_acl_response)
let make_get_web_acl_request ~id:(id_ : string)  ~scope:(scope_ : scope) 
  ~name:(name_ : string)  () =
  ({ id = id_; scope = scope_; name = name_ } : get_web_acl_request)
let make_get_web_acl_for_resource_response
  ?web_ac_l:(web_ac_l_ : web_ac_l option)  () =
  ({ web_ac_l = web_ac_l_ } : get_web_acl_for_resource_response)
let make_get_web_acl_for_resource_request
  ~resource_arn:(resource_arn_ : string)  () =
  ({ resource_arn = resource_arn_ } : get_web_acl_for_resource_request)
let make_get_sampled_requests_response
  ?time_window:(time_window_ : time_window option) 
  ?population_size:(population_size_ : int option) 
  ?sampled_requests:(sampled_requests_ : sampled_http_request list option) 
  () =
  ({
     time_window = time_window_;
     population_size = population_size_;
     sampled_requests = sampled_requests_
   } : get_sampled_requests_response)
let make_get_sampled_requests_request ~max_items:(max_items_ : int) 
  ~time_window:(time_window_ : time_window)  ~scope:(scope_ : scope) 
  ~rule_metric_name:(rule_metric_name_ : string) 
  ~web_acl_arn:(web_acl_arn_ : string)  () =
  ({
     max_items = max_items_;
     time_window = time_window_;
     scope = scope_;
     rule_metric_name = rule_metric_name_;
     web_acl_arn = web_acl_arn_
   } : get_sampled_requests_request)
let make_get_rule_group_response ?lock_token:(lock_token_ : string option) 
  ?rule_group:(rule_group_ : rule_group option)  () =
  ({ lock_token = lock_token_; rule_group = rule_group_ } : get_rule_group_response)
let make_get_rule_group_request ?ar_n:(ar_n_ : string option) 
  ?id:(id_ : string option)  ?scope:(scope_ : scope option) 
  ?name:(name_ : string option)  () =
  ({ ar_n = ar_n_; id = id_; scope = scope_; name = name_ } : get_rule_group_request)
let make_get_regex_pattern_set_response
  ?lock_token:(lock_token_ : string option) 
  ?regex_pattern_set:(regex_pattern_set_ : regex_pattern_set option)  () =
  ({ lock_token = lock_token_; regex_pattern_set = regex_pattern_set_ } : 
  get_regex_pattern_set_response)
let make_get_regex_pattern_set_request ~id:(id_ : string) 
  ~scope:(scope_ : scope)  ~name:(name_ : string)  () =
  ({ id = id_; scope = scope_; name = name_ } : get_regex_pattern_set_request)
let make_get_rate_based_statement_managed_keys_response
  ?managed_keys_ip_v6:(managed_keys_ip_v6_ :
                        rate_based_statement_managed_keys_ip_set option)
   ?managed_keys_ip_v4:(managed_keys_ip_v4_ :
                         rate_based_statement_managed_keys_ip_set option)
   () =
  ({
     managed_keys_ip_v6 = managed_keys_ip_v6_;
     managed_keys_ip_v4 = managed_keys_ip_v4_
   } : get_rate_based_statement_managed_keys_response)
let make_get_rate_based_statement_managed_keys_request
  ?rule_group_rule_name:(rule_group_rule_name_ : string option) 
  ~rule_name:(rule_name_ : string)  ~web_acl_id:(web_acl_id_ : string) 
  ~web_acl_name:(web_acl_name_ : string)  ~scope:(scope_ : scope)  () =
  ({
     rule_name = rule_name_;
     rule_group_rule_name = rule_group_rule_name_;
     web_acl_id = web_acl_id_;
     web_acl_name = web_acl_name_;
     scope = scope_
   } : get_rate_based_statement_managed_keys_request)
let make_get_permission_policy_response ?policy:(policy_ : string option)  ()
  = ({ policy = policy_ } : get_permission_policy_response)
let make_get_permission_policy_request ~resource_arn:(resource_arn_ : string)
   () = ({ resource_arn = resource_arn_ } : get_permission_policy_request)
let make_get_mobile_sdk_release_response
  ?mobile_sdk_release:(mobile_sdk_release_ : mobile_sdk_release option)  () =
  ({ mobile_sdk_release = mobile_sdk_release_ } : get_mobile_sdk_release_response)
let make_get_mobile_sdk_release_request
  ~release_version:(release_version_ : string) 
  ~platform:(platform_ : platform)  () =
  ({ release_version = release_version_; platform = platform_ } : get_mobile_sdk_release_request)
let make_get_managed_rule_set_response
  ?lock_token:(lock_token_ : string option) 
  ?managed_rule_set:(managed_rule_set_ : managed_rule_set option)  () =
  ({ lock_token = lock_token_; managed_rule_set = managed_rule_set_ } : 
  get_managed_rule_set_response)
let make_get_managed_rule_set_request ~id:(id_ : string) 
  ~scope:(scope_ : scope)  ~name:(name_ : string)  () =
  ({ id = id_; scope = scope_; name = name_ } : get_managed_rule_set_request)
let make_get_logging_configuration_response
  ?logging_configuration:(logging_configuration_ :
                           logging_configuration option)
   () =
  ({ logging_configuration = logging_configuration_ } : get_logging_configuration_response)
let make_get_logging_configuration_request
  ?log_scope:(log_scope_ : log_scope option) 
  ?log_type:(log_type_ : log_type option) 
  ~resource_arn:(resource_arn_ : string)  () =
  ({
     log_scope = log_scope_;
     log_type = log_type_;
     resource_arn = resource_arn_
   } : get_logging_configuration_request)
let make_get_ip_set_response ?lock_token:(lock_token_ : string option) 
  ?ip_set:(ip_set_ : ip_set option)  () =
  ({ lock_token = lock_token_; ip_set = ip_set_ } : get_ip_set_response)
let make_get_ip_set_request ~id:(id_ : string)  ~scope:(scope_ : scope) 
  ~name:(name_ : string)  () =
  ({ id = id_; scope = scope_; name = name_ } : get_ip_set_request)
let make_get_decrypted_api_key_response
  ?creation_timestamp:(creation_timestamp_ : CoreTypes.Timestamp.t option) 
  ?token_domains:(token_domains_ : string list option)  () =
  ({ creation_timestamp = creation_timestamp_; token_domains = token_domains_
   } : get_decrypted_api_key_response)
let make_get_decrypted_api_key_request ~api_key:(api_key_ : string) 
  ~scope:(scope_ : scope)  () =
  ({ api_key = api_key_; scope = scope_ } : get_decrypted_api_key_request)
let make_generate_mobile_sdk_release_url_response ?url:(url_ : string option)
   () = ({ url = url_ } : generate_mobile_sdk_release_url_response)
let make_generate_mobile_sdk_release_url_request
  ~release_version:(release_version_ : string) 
  ~platform:(platform_ : platform)  () =
  ({ release_version = release_version_; platform = platform_ } : generate_mobile_sdk_release_url_request)
let make_disassociate_web_acl_response () =
  (() : disassociate_web_acl_response)
let make_disassociate_web_acl_request ~resource_arn:(resource_arn_ : string) 
  () = ({ resource_arn = resource_arn_ } : disassociate_web_acl_request)
let make_describe_managed_rule_group_response
  ?consumed_labels:(consumed_labels_ : label_summary list option) 
  ?available_labels:(available_labels_ : label_summary list option) 
  ?label_namespace:(label_namespace_ : string option) 
  ?rules:(rules_ : rule_summary list option) 
  ?capacity:(capacity_ : int option) 
  ?sns_topic_arn:(sns_topic_arn_ : string option) 
  ?version_name:(version_name_ : string option)  () =
  ({
     consumed_labels = consumed_labels_;
     available_labels = available_labels_;
     label_namespace = label_namespace_;
     rules = rules_;
     capacity = capacity_;
     sns_topic_arn = sns_topic_arn_;
     version_name = version_name_
   } : describe_managed_rule_group_response)
let make_describe_managed_rule_group_request
  ?version_name:(version_name_ : string option)  ~scope:(scope_ : scope) 
  ~name:(name_ : string)  ~vendor_name:(vendor_name_ : string)  () =
  ({
     version_name = version_name_;
     scope = scope_;
     name = name_;
     vendor_name = vendor_name_
   } : describe_managed_rule_group_request)
let make_describe_managed_products_by_vendor_response
  ?managed_products:(managed_products_ :
                      managed_product_descriptor list option)
   () =
  ({ managed_products = managed_products_ } : describe_managed_products_by_vendor_response)
let make_describe_managed_products_by_vendor_request ~scope:(scope_ : scope) 
  ~vendor_name:(vendor_name_ : string)  () =
  ({ scope = scope_; vendor_name = vendor_name_ } : describe_managed_products_by_vendor_request)
let make_describe_all_managed_products_response
  ?managed_products:(managed_products_ :
                      managed_product_descriptor list option)
   () =
  ({ managed_products = managed_products_ } : describe_all_managed_products_response)
let make_describe_all_managed_products_request ~scope:(scope_ : scope)  () =
  ({ scope = scope_ } : describe_all_managed_products_request)
let make_delete_web_acl_response () = (() : delete_web_acl_response)
let make_delete_web_acl_request ~lock_token:(lock_token_ : string) 
  ~id:(id_ : string)  ~scope:(scope_ : scope)  ~name:(name_ : string)  () =
  ({ lock_token = lock_token_; id = id_; scope = scope_; name = name_ } : 
  delete_web_acl_request)
let make_delete_rule_group_response () = (() : delete_rule_group_response)
let make_delete_rule_group_request ~lock_token:(lock_token_ : string) 
  ~id:(id_ : string)  ~scope:(scope_ : scope)  ~name:(name_ : string)  () =
  ({ lock_token = lock_token_; id = id_; scope = scope_; name = name_ } : 
  delete_rule_group_request)
let make_delete_regex_pattern_set_response () =
  (() : delete_regex_pattern_set_response)
let make_delete_regex_pattern_set_request ~lock_token:(lock_token_ : string) 
  ~id:(id_ : string)  ~scope:(scope_ : scope)  ~name:(name_ : string)  () =
  ({ lock_token = lock_token_; id = id_; scope = scope_; name = name_ } : 
  delete_regex_pattern_set_request)
let make_delete_permission_policy_response () =
  (() : delete_permission_policy_response)
let make_delete_permission_policy_request
  ~resource_arn:(resource_arn_ : string)  () =
  ({ resource_arn = resource_arn_ } : delete_permission_policy_request)
let make_delete_logging_configuration_response () =
  (() : delete_logging_configuration_response)
let make_delete_logging_configuration_request
  ?log_scope:(log_scope_ : log_scope option) 
  ?log_type:(log_type_ : log_type option) 
  ~resource_arn:(resource_arn_ : string)  () =
  ({
     log_scope = log_scope_;
     log_type = log_type_;
     resource_arn = resource_arn_
   } : delete_logging_configuration_request)
let make_delete_ip_set_response () = (() : delete_ip_set_response)
let make_delete_ip_set_request ~lock_token:(lock_token_ : string) 
  ~id:(id_ : string)  ~scope:(scope_ : scope)  ~name:(name_ : string)  () =
  ({ lock_token = lock_token_; id = id_; scope = scope_; name = name_ } : 
  delete_ip_set_request)
let make_delete_firewall_manager_rule_groups_response
  ?next_web_acl_lock_token:(next_web_acl_lock_token_ : string option)  () =
  ({ next_web_acl_lock_token = next_web_acl_lock_token_ } : delete_firewall_manager_rule_groups_response)
let make_delete_firewall_manager_rule_groups_request
  ~web_acl_lock_token:(web_acl_lock_token_ : string) 
  ~web_acl_arn:(web_acl_arn_ : string)  () =
  ({ web_acl_lock_token = web_acl_lock_token_; web_acl_arn = web_acl_arn_ } : 
  delete_firewall_manager_rule_groups_request)
let make_delete_api_key_response () = (() : delete_api_key_response)
let make_delete_api_key_request ~api_key:(api_key_ : string) 
  ~scope:(scope_ : scope)  () =
  ({ api_key = api_key_; scope = scope_ } : delete_api_key_request)
let make_create_web_acl_response ?summary:(summary_ : web_acl_summary option)
   () = ({ summary = summary_ } : create_web_acl_response)
let make_create_web_acl_request
  ?association_config:(association_config_ : association_config option) 
  ?token_domains:(token_domains_ : string list option) 
  ?challenge_config:(challenge_config_ : challenge_config option) 
  ?captcha_config:(captcha_config_ : captcha_config option) 
  ?custom_response_bodies:(custom_response_bodies_ :
                            custom_response_bodies option)
   ?tags:(tags_ : tag list option)  ?rules:(rules_ : rule list option) 
  ?description:(description_ : string option) 
  ~visibility_config:(visibility_config_ : visibility_config) 
  ~default_action:(default_action_ : default_action)  ~scope:(scope_ : scope)
   ~name:(name_ : string)  () =
  ({
     association_config = association_config_;
     token_domains = token_domains_;
     challenge_config = challenge_config_;
     captcha_config = captcha_config_;
     custom_response_bodies = custom_response_bodies_;
     tags = tags_;
     visibility_config = visibility_config_;
     rules = rules_;
     description = description_;
     default_action = default_action_;
     scope = scope_;
     name = name_
   } : create_web_acl_request)
let make_create_rule_group_response
  ?summary:(summary_ : rule_group_summary option)  () =
  ({ summary = summary_ } : create_rule_group_response)
let make_create_rule_group_request
  ?custom_response_bodies:(custom_response_bodies_ :
                            custom_response_bodies option)
   ?tags:(tags_ : tag list option)  ?rules:(rules_ : rule list option) 
  ?description:(description_ : string option) 
  ~visibility_config:(visibility_config_ : visibility_config) 
  ~capacity:(capacity_ : int)  ~scope:(scope_ : scope) 
  ~name:(name_ : string)  () =
  ({
     custom_response_bodies = custom_response_bodies_;
     tags = tags_;
     visibility_config = visibility_config_;
     rules = rules_;
     description = description_;
     capacity = capacity_;
     scope = scope_;
     name = name_
   } : create_rule_group_request)
let make_create_regex_pattern_set_response
  ?summary:(summary_ : regex_pattern_set_summary option)  () =
  ({ summary = summary_ } : create_regex_pattern_set_response)
let make_create_regex_pattern_set_request ?tags:(tags_ : tag list option) 
  ?description:(description_ : string option) 
  ~regular_expression_list:(regular_expression_list_ : regex list) 
  ~scope:(scope_ : scope)  ~name:(name_ : string)  () =
  ({
     tags = tags_;
     regular_expression_list = regular_expression_list_;
     description = description_;
     scope = scope_;
     name = name_
   } : create_regex_pattern_set_request)
let make_create_ip_set_response ?summary:(summary_ : ip_set_summary option) 
  () = ({ summary = summary_ } : create_ip_set_response)
let make_create_ip_set_request ?tags:(tags_ : tag list option) 
  ?description:(description_ : string option) 
  ~addresses:(addresses_ : string list) 
  ~ip_address_version:(ip_address_version_ : ip_address_version) 
  ~scope:(scope_ : scope)  ~name:(name_ : string)  () =
  ({
     tags = tags_;
     addresses = addresses_;
     ip_address_version = ip_address_version_;
     description = description_;
     scope = scope_;
     name = name_
   } : create_ip_set_request)
let make_create_api_key_response ?api_key:(api_key_ : string option)  () =
  ({ api_key = api_key_ } : create_api_key_response)
let make_create_api_key_request ~token_domains:(token_domains_ : string list)
   ~scope:(scope_ : scope)  () =
  ({ token_domains = token_domains_; scope = scope_ } : create_api_key_request)
let make_check_capacity_response ?capacity:(capacity_ : int option)  () =
  ({ capacity = capacity_ } : check_capacity_response)
let make_check_capacity_request ~rules:(rules_ : rule list) 
  ~scope:(scope_ : scope)  () =
  ({ rules = rules_; scope = scope_ } : check_capacity_request)
let make_associate_web_acl_response () = (() : associate_web_acl_response)
let make_associate_web_acl_request ~resource_arn:(resource_arn_ : string) 
  ~web_acl_arn:(web_acl_arn_ : string)  () =
  ({ resource_arn = resource_arn_; web_acl_arn = web_acl_arn_ } : associate_web_acl_request)