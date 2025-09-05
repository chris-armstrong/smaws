open Types
let make_field_to_match ?data:(data_ : match_field_data option)
  ~type_:(type__ : match_field_type) () =
  ({ data = data_; type_ = type__ } : field_to_match)
let make_xss_match_tuple
  ~text_transformation:(text_transformation_ : text_transformation)
  ~field_to_match:(field_to_match_ : field_to_match) () =
  ({
     text_transformation = text_transformation_;
     field_to_match = field_to_match_
   } : xss_match_tuple)
let make_xss_match_set_update
  ~xss_match_tuple:(xss_match_tuple_ : xss_match_tuple)
  ~action:(action_ : change_action) () =
  ({ xss_match_tuple = xss_match_tuple_; action = action_ } : xss_match_set_update)
let make_xss_match_set_summary ~name:(name_ : resource_name)
  ~xss_match_set_id:(xss_match_set_id_ : resource_id) () =
  ({ name = name_; xss_match_set_id = xss_match_set_id_ } : xss_match_set_summary)
let make_xss_match_set ?name:(name_ : resource_name option)
  ~xss_match_tuples:(xss_match_tuples_ : xss_match_tuples)
  ~xss_match_set_id:(xss_match_set_id_ : resource_id) () =
  ({
     xss_match_tuples = xss_match_tuples_;
     name = name_;
     xss_match_set_id = xss_match_set_id_
   } : xss_match_set)
let make_waf_action ~type_:(type__ : waf_action_type) () =
  ({ type_ = type__ } : waf_action)
let make_waf_override_action ~type_:(type__ : waf_override_action_type) () =
  ({ type_ = type__ } : waf_override_action)
let make_excluded_rule ~rule_id:(rule_id_ : resource_id) () =
  ({ rule_id = rule_id_ } : excluded_rule)
let make_activated_rule
  ?excluded_rules:(excluded_rules_ : excluded_rules option)
  ?type_:(type__ : waf_rule_type option)
  ?override_action:(override_action_ : waf_override_action option)
  ?action:(action_ : waf_action option) ~rule_id:(rule_id_ : resource_id)
  ~priority:(priority_ : rule_priority) () =
  ({
     excluded_rules = excluded_rules_;
     type_ = type__;
     override_action = override_action_;
     action = action_;
     rule_id = rule_id_;
     priority = priority_
   } : activated_rule)
let make_web_acl_update ~activated_rule:(activated_rule_ : activated_rule)
  ~action:(action_ : change_action) () =
  ({ activated_rule = activated_rule_; action = action_ } : web_acl_update)
let make_web_acl_summary ~name:(name_ : resource_name)
  ~web_acl_id:(web_acl_id_ : resource_id) () =
  ({ name = name_; web_acl_id = web_acl_id_ } : web_acl_summary)
let make_web_ac_l ?web_acl_arn:(web_acl_arn_ : resource_arn option)
  ?metric_name:(metric_name_ : metric_name option)
  ?name:(name_ : resource_name option) ~rules:(rules_ : activated_rules)
  ~default_action:(default_action_ : waf_action)
  ~web_acl_id:(web_acl_id_ : resource_id) () =
  ({
     web_acl_arn = web_acl_arn_;
     rules = rules_;
     default_action = default_action_;
     metric_name = metric_name_;
     name = name_;
     web_acl_id = web_acl_id_
   } : web_ac_l)
let make_update_xss_match_set_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_xss_match_set_response)
let make_update_xss_match_set_request
  ~updates:(updates_ : xss_match_set_updates)
  ~change_token:(change_token_ : change_token)
  ~xss_match_set_id:(xss_match_set_id_ : resource_id) () =
  ({
     updates = updates_;
     change_token = change_token_;
     xss_match_set_id = xss_match_set_id_
   } : update_xss_match_set_request)
let make_update_web_acl_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_web_acl_response)
let make_update_web_acl_request
  ?default_action:(default_action_ : waf_action option)
  ?updates:(updates_ : web_acl_updates option)
  ~change_token:(change_token_ : change_token)
  ~web_acl_id:(web_acl_id_ : resource_id) () =
  ({
     default_action = default_action_;
     updates = updates_;
     change_token = change_token_;
     web_acl_id = web_acl_id_
   } : update_web_acl_request)
let make_update_sql_injection_match_set_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_sql_injection_match_set_response)
let make_sql_injection_match_tuple
  ~text_transformation:(text_transformation_ : text_transformation)
  ~field_to_match:(field_to_match_ : field_to_match) () =
  ({
     text_transformation = text_transformation_;
     field_to_match = field_to_match_
   } : sql_injection_match_tuple)
let make_sql_injection_match_set_update
  ~sql_injection_match_tuple:(sql_injection_match_tuple_ :
                               sql_injection_match_tuple)
  ~action:(action_ : change_action) () =
  ({ sql_injection_match_tuple = sql_injection_match_tuple_; action = action_
   } : sql_injection_match_set_update)
let make_update_sql_injection_match_set_request
  ~updates:(updates_ : sql_injection_match_set_updates)
  ~change_token:(change_token_ : change_token)
  ~sql_injection_match_set_id:(sql_injection_match_set_id_ : resource_id) ()
  =
  ({
     updates = updates_;
     change_token = change_token_;
     sql_injection_match_set_id = sql_injection_match_set_id_
   } : update_sql_injection_match_set_request)
let make_update_size_constraint_set_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_size_constraint_set_response)
let make_size_constraint ~size:(size_ : size)
  ~comparison_operator:(comparison_operator_ : comparison_operator)
  ~text_transformation:(text_transformation_ : text_transformation)
  ~field_to_match:(field_to_match_ : field_to_match) () =
  ({
     size = size_;
     comparison_operator = comparison_operator_;
     text_transformation = text_transformation_;
     field_to_match = field_to_match_
   } : size_constraint)
let make_size_constraint_set_update
  ~size_constraint:(size_constraint_ : size_constraint)
  ~action:(action_ : change_action) () =
  ({ size_constraint = size_constraint_; action = action_ } : size_constraint_set_update)
let make_update_size_constraint_set_request
  ~updates:(updates_ : size_constraint_set_updates)
  ~change_token:(change_token_ : change_token)
  ~size_constraint_set_id:(size_constraint_set_id_ : resource_id) () =
  ({
     updates = updates_;
     change_token = change_token_;
     size_constraint_set_id = size_constraint_set_id_
   } : update_size_constraint_set_request)
let make_update_rule_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_rule_response)
let make_predicate ~data_id:(data_id_ : resource_id)
  ~type_:(type__ : predicate_type) ~negated:(negated_ : negated) () =
  ({ data_id = data_id_; type_ = type__; negated = negated_ } : predicate)
let make_rule_update ~predicate:(predicate_ : predicate)
  ~action:(action_ : change_action) () =
  ({ predicate = predicate_; action = action_ } : rule_update)
let make_update_rule_request ~updates:(updates_ : rule_updates)
  ~change_token:(change_token_ : change_token)
  ~rule_id:(rule_id_ : resource_id) () =
  ({ updates = updates_; change_token = change_token_; rule_id = rule_id_ } : 
  update_rule_request)
let make_update_rule_group_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_rule_group_response)
let make_rule_group_update ~activated_rule:(activated_rule_ : activated_rule)
  ~action:(action_ : change_action) () =
  ({ activated_rule = activated_rule_; action = action_ } : rule_group_update)
let make_update_rule_group_request
  ~change_token:(change_token_ : change_token)
  ~updates:(updates_ : rule_group_updates)
  ~rule_group_id:(rule_group_id_ : resource_id) () =
  ({
     change_token = change_token_;
     updates = updates_;
     rule_group_id = rule_group_id_
   } : update_rule_group_request)
let make_update_regex_pattern_set_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_regex_pattern_set_response)
let make_regex_pattern_set_update
  ~regex_pattern_string:(regex_pattern_string_ : regex_pattern_string)
  ~action:(action_ : change_action) () =
  ({ regex_pattern_string = regex_pattern_string_; action = action_ } : 
  regex_pattern_set_update)
let make_update_regex_pattern_set_request
  ~change_token:(change_token_ : change_token)
  ~updates:(updates_ : regex_pattern_set_updates)
  ~regex_pattern_set_id:(regex_pattern_set_id_ : resource_id) () =
  ({
     change_token = change_token_;
     updates = updates_;
     regex_pattern_set_id = regex_pattern_set_id_
   } : update_regex_pattern_set_request)
let make_update_regex_match_set_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_regex_match_set_response)
let make_regex_match_tuple
  ~regex_pattern_set_id:(regex_pattern_set_id_ : resource_id)
  ~text_transformation:(text_transformation_ : text_transformation)
  ~field_to_match:(field_to_match_ : field_to_match) () =
  ({
     regex_pattern_set_id = regex_pattern_set_id_;
     text_transformation = text_transformation_;
     field_to_match = field_to_match_
   } : regex_match_tuple)
let make_regex_match_set_update
  ~regex_match_tuple:(regex_match_tuple_ : regex_match_tuple)
  ~action:(action_ : change_action) () =
  ({ regex_match_tuple = regex_match_tuple_; action = action_ } : regex_match_set_update)
let make_update_regex_match_set_request
  ~change_token:(change_token_ : change_token)
  ~updates:(updates_ : regex_match_set_updates)
  ~regex_match_set_id:(regex_match_set_id_ : resource_id) () =
  ({
     change_token = change_token_;
     updates = updates_;
     regex_match_set_id = regex_match_set_id_
   } : update_regex_match_set_request)
let make_update_rate_based_rule_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_rate_based_rule_response)
let make_update_rate_based_rule_request
  ~rate_limit:(rate_limit_ : rate_limit) ~updates:(updates_ : rule_updates)
  ~change_token:(change_token_ : change_token)
  ~rule_id:(rule_id_ : resource_id) () =
  ({
     rate_limit = rate_limit_;
     updates = updates_;
     change_token = change_token_;
     rule_id = rule_id_
   } : update_rate_based_rule_request)
let make_update_ip_set_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_ip_set_response)
let make_ip_set_descriptor ~value:(value_ : ip_set_descriptor_value)
  ~type_:(type__ : ip_set_descriptor_type) () =
  ({ value = value_; type_ = type__ } : ip_set_descriptor)
let make_ip_set_update
  ~ip_set_descriptor:(ip_set_descriptor_ : ip_set_descriptor)
  ~action:(action_ : change_action) () =
  ({ ip_set_descriptor = ip_set_descriptor_; action = action_ } : ip_set_update)
let make_update_ip_set_request ~updates:(updates_ : ip_set_updates)
  ~change_token:(change_token_ : change_token)
  ~ip_set_id:(ip_set_id_ : resource_id) () =
  ({ updates = updates_; change_token = change_token_; ip_set_id = ip_set_id_
   } : update_ip_set_request)
let make_update_geo_match_set_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_geo_match_set_response)
let make_geo_match_constraint ~value:(value_ : geo_match_constraint_value)
  ~type_:(type__ : geo_match_constraint_type) () =
  ({ value = value_; type_ = type__ } : geo_match_constraint)
let make_geo_match_set_update
  ~geo_match_constraint:(geo_match_constraint_ : geo_match_constraint)
  ~action:(action_ : change_action) () =
  ({ geo_match_constraint = geo_match_constraint_; action = action_ } : 
  geo_match_set_update)
let make_update_geo_match_set_request
  ~updates:(updates_ : geo_match_set_updates)
  ~change_token:(change_token_ : change_token)
  ~geo_match_set_id:(geo_match_set_id_ : resource_id) () =
  ({
     updates = updates_;
     change_token = change_token_;
     geo_match_set_id = geo_match_set_id_
   } : update_geo_match_set_request)
let make_update_byte_match_set_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_byte_match_set_response)
let make_byte_match_tuple
  ~positional_constraint:(positional_constraint_ : positional_constraint)
  ~text_transformation:(text_transformation_ : text_transformation)
  ~target_string:(target_string_ : byte_match_target_string)
  ~field_to_match:(field_to_match_ : field_to_match) () =
  ({
     positional_constraint = positional_constraint_;
     text_transformation = text_transformation_;
     target_string = target_string_;
     field_to_match = field_to_match_
   } : byte_match_tuple)
let make_byte_match_set_update
  ~byte_match_tuple:(byte_match_tuple_ : byte_match_tuple)
  ~action:(action_ : change_action) () =
  ({ byte_match_tuple = byte_match_tuple_; action = action_ } : byte_match_set_update)
let make_update_byte_match_set_request
  ~updates:(updates_ : byte_match_set_updates)
  ~change_token:(change_token_ : change_token)
  ~byte_match_set_id:(byte_match_set_id_ : resource_id) () =
  ({
     updates = updates_;
     change_token = change_token_;
     byte_match_set_id = byte_match_set_id_
   } : update_byte_match_set_request)
let make_untag_resource_response () = (() : unit)
let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
  ~resource_ar_n:(resource_ar_n_ : resource_arn) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)
let make_time_window ~end_time:(end_time_ : timestamp)
  ~start_time:(start_time_ : timestamp) () =
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
let make_subscribed_rule_group_summary
  ~metric_name:(metric_name_ : metric_name) ~name:(name_ : resource_name)
  ~rule_group_id:(rule_group_id_ : resource_id) () =
  ({ metric_name = metric_name_; name = name_; rule_group_id = rule_group_id_
   } : subscribed_rule_group_summary)
let make_sql_injection_match_set_summary ~name:(name_ : resource_name)
  ~sql_injection_match_set_id:(sql_injection_match_set_id_ : resource_id) ()
  =
  ({ name = name_; sql_injection_match_set_id = sql_injection_match_set_id_ } : 
  sql_injection_match_set_summary)
let make_sql_injection_match_set ?name:(name_ : resource_name option)
  ~sql_injection_match_tuples:(sql_injection_match_tuples_ :
                                sql_injection_match_tuples)
  ~sql_injection_match_set_id:(sql_injection_match_set_id_ : resource_id) ()
  =
  ({
     sql_injection_match_tuples = sql_injection_match_tuples_;
     name = name_;
     sql_injection_match_set_id = sql_injection_match_set_id_
   } : sql_injection_match_set)
let make_size_constraint_set_summary ~name:(name_ : resource_name)
  ~size_constraint_set_id:(size_constraint_set_id_ : resource_id) () =
  ({ name = name_; size_constraint_set_id = size_constraint_set_id_ } : 
  size_constraint_set_summary)
let make_size_constraint_set ?name:(name_ : resource_name option)
  ~size_constraints:(size_constraints_ : size_constraints)
  ~size_constraint_set_id:(size_constraint_set_id_ : resource_id) () =
  ({
     size_constraints = size_constraints_;
     name = name_;
     size_constraint_set_id = size_constraint_set_id_
   } : size_constraint_set)
let make_http_header ?value:(value_ : header_value option)
  ?name:(name_ : header_name option) () =
  ({ value = value_; name = name_ } : http_header)
let make_http_request ?headers:(headers_ : http_headers option)
  ?http_version:(http_version_ : http_version option)
  ?method_:(method__ : http_method option) ?ur_i:(ur_i_ : uri_string option)
  ?country:(country_ : country option)
  ?client_i_p:(client_i_p_ : ip_string option) () =
  ({
     headers = headers_;
     http_version = http_version_;
     method_ = method__;
     ur_i = ur_i_;
     country = country_;
     client_i_p = client_i_p_
   } : http_request)
let make_sampled_http_request
  ?rule_within_rule_group:(rule_within_rule_group_ : resource_id option)
  ?action:(action_ : action option)
  ?timestamp:(timestamp_ : timestamp option)
  ~weight:(weight_ : sample_weight) ~request:(request_ : http_request) () =
  ({
     rule_within_rule_group = rule_within_rule_group_;
     action = action_;
     timestamp = timestamp_;
     weight = weight_;
     request = request_
   } : sampled_http_request)
let make_rule_summary ~name:(name_ : resource_name)
  ~rule_id:(rule_id_ : resource_id) () =
  ({ name = name_; rule_id = rule_id_ } : rule_summary)
let make_rule_group_summary ~name:(name_ : resource_name)
  ~rule_group_id:(rule_group_id_ : resource_id) () =
  ({ name = name_; rule_group_id = rule_group_id_ } : rule_group_summary)
let make_rule_group ?metric_name:(metric_name_ : metric_name option)
  ?name:(name_ : resource_name option)
  ~rule_group_id:(rule_group_id_ : resource_id) () =
  ({ metric_name = metric_name_; name = name_; rule_group_id = rule_group_id_
   } : rule_group)
let make_rule ?metric_name:(metric_name_ : metric_name option)
  ?name:(name_ : resource_name option) ~predicates:(predicates_ : predicates)
  ~rule_id:(rule_id_ : resource_id) () =
  ({
     predicates = predicates_;
     metric_name = metric_name_;
     name = name_;
     rule_id = rule_id_
   } : rule)
let make_regex_pattern_set_summary ~name:(name_ : resource_name)
  ~regex_pattern_set_id:(regex_pattern_set_id_ : resource_id) () =
  ({ name = name_; regex_pattern_set_id = regex_pattern_set_id_ } : regex_pattern_set_summary)
let make_regex_pattern_set ?name:(name_ : resource_name option)
  ~regex_pattern_strings:(regex_pattern_strings_ : regex_pattern_strings)
  ~regex_pattern_set_id:(regex_pattern_set_id_ : resource_id) () =
  ({
     regex_pattern_strings = regex_pattern_strings_;
     name = name_;
     regex_pattern_set_id = regex_pattern_set_id_
   } : regex_pattern_set)
let make_regex_match_set_summary ~name:(name_ : resource_name)
  ~regex_match_set_id:(regex_match_set_id_ : resource_id) () =
  ({ name = name_; regex_match_set_id = regex_match_set_id_ } : regex_match_set_summary)
let make_regex_match_set
  ?regex_match_tuples:(regex_match_tuples_ : regex_match_tuples option)
  ?name:(name_ : resource_name option)
  ?regex_match_set_id:(regex_match_set_id_ : resource_id option) () =
  ({
     regex_match_tuples = regex_match_tuples_;
     name = name_;
     regex_match_set_id = regex_match_set_id_
   } : regex_match_set)
let make_rate_based_rule ?metric_name:(metric_name_ : metric_name option)
  ?name:(name_ : resource_name option) ~rate_limit:(rate_limit_ : rate_limit)
  ~rate_key:(rate_key_ : rate_key)
  ~match_predicates:(match_predicates_ : predicates)
  ~rule_id:(rule_id_ : resource_id) () =
  ({
     rate_limit = rate_limit_;
     rate_key = rate_key_;
     match_predicates = match_predicates_;
     metric_name = metric_name_;
     name = name_;
     rule_id = rule_id_
   } : rate_based_rule)
let make_put_permission_policy_response () = (() : unit)
let make_put_permission_policy_request ~policy:(policy_ : policy_string)
  ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ policy = policy_; resource_arn = resource_arn_ } : put_permission_policy_request)
let make_logging_configuration
  ?redacted_fields:(redacted_fields_ : redacted_fields option)
  ~log_destination_configs:(log_destination_configs_ :
                             log_destination_configs)
  ~resource_arn:(resource_arn_ : resource_arn) () =
  ({
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
  ~logging_configuration:(logging_configuration_ : logging_configuration) ()
  =
  ({ logging_configuration = logging_configuration_ } : put_logging_configuration_request)
let make_list_xss_match_sets_response
  ?xss_match_sets:(xss_match_sets_ : xss_match_set_summaries option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ xss_match_sets = xss_match_sets_; next_marker = next_marker_ } : 
  list_xss_match_sets_response)
let make_list_xss_match_sets_request
  ?limit:(limit_ : pagination_limit option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ limit = limit_; next_marker = next_marker_ } : list_xss_match_sets_request)
let make_list_web_ac_ls_response
  ?web_ac_ls:(web_ac_ls_ : web_acl_summaries option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ web_ac_ls = web_ac_ls_; next_marker = next_marker_ } : list_web_ac_ls_response)
let make_list_web_ac_ls_request ?limit:(limit_ : pagination_limit option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ limit = limit_; next_marker = next_marker_ } : list_web_ac_ls_request)
let make_list_tags_for_resource_response
  ?tag_info_for_resource:(tag_info_for_resource_ :
                           tag_info_for_resource option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({
     tag_info_for_resource = tag_info_for_resource_;
     next_marker = next_marker_
   } : list_tags_for_resource_response)
let make_list_tags_for_resource_request
  ?limit:(limit_ : pagination_limit option)
  ?next_marker:(next_marker_ : next_marker option)
  ~resource_ar_n:(resource_ar_n_ : resource_arn) () =
  ({
     resource_ar_n = resource_ar_n_;
     limit = limit_;
     next_marker = next_marker_
   } : list_tags_for_resource_request)
let make_list_subscribed_rule_groups_response
  ?rule_groups:(rule_groups_ : subscribed_rule_group_summaries option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ rule_groups = rule_groups_; next_marker = next_marker_ } : list_subscribed_rule_groups_response)
let make_list_subscribed_rule_groups_request
  ?limit:(limit_ : pagination_limit option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ limit = limit_; next_marker = next_marker_ } : list_subscribed_rule_groups_request)
let make_list_sql_injection_match_sets_response
  ?sql_injection_match_sets:(sql_injection_match_sets_ :
                              sql_injection_match_set_summaries option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({
     sql_injection_match_sets = sql_injection_match_sets_;
     next_marker = next_marker_
   } : list_sql_injection_match_sets_response)
let make_list_sql_injection_match_sets_request
  ?limit:(limit_ : pagination_limit option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ limit = limit_; next_marker = next_marker_ } : list_sql_injection_match_sets_request)
let make_list_size_constraint_sets_response
  ?size_constraint_sets:(size_constraint_sets_ :
                          size_constraint_set_summaries option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ size_constraint_sets = size_constraint_sets_; next_marker = next_marker_
   } : list_size_constraint_sets_response)
let make_list_size_constraint_sets_request
  ?limit:(limit_ : pagination_limit option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ limit = limit_; next_marker = next_marker_ } : list_size_constraint_sets_request)
let make_list_rules_response ?rules:(rules_ : rule_summaries option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ rules = rules_; next_marker = next_marker_ } : list_rules_response)
let make_list_rules_request ?limit:(limit_ : pagination_limit option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ limit = limit_; next_marker = next_marker_ } : list_rules_request)
let make_list_rule_groups_response
  ?rule_groups:(rule_groups_ : rule_group_summaries option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ rule_groups = rule_groups_; next_marker = next_marker_ } : list_rule_groups_response)
let make_list_rule_groups_request ?limit:(limit_ : pagination_limit option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ limit = limit_; next_marker = next_marker_ } : list_rule_groups_request)
let make_list_regex_pattern_sets_response
  ?regex_pattern_sets:(regex_pattern_sets_ :
                        regex_pattern_set_summaries option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ regex_pattern_sets = regex_pattern_sets_; next_marker = next_marker_ } : 
  list_regex_pattern_sets_response)
let make_list_regex_pattern_sets_request
  ?limit:(limit_ : pagination_limit option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ limit = limit_; next_marker = next_marker_ } : list_regex_pattern_sets_request)
let make_list_regex_match_sets_response
  ?regex_match_sets:(regex_match_sets_ : regex_match_set_summaries option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ regex_match_sets = regex_match_sets_; next_marker = next_marker_ } : 
  list_regex_match_sets_response)
let make_list_regex_match_sets_request
  ?limit:(limit_ : pagination_limit option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ limit = limit_; next_marker = next_marker_ } : list_regex_match_sets_request)
let make_list_rate_based_rules_response
  ?rules:(rules_ : rule_summaries option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ rules = rules_; next_marker = next_marker_ } : list_rate_based_rules_response)
let make_list_rate_based_rules_request
  ?limit:(limit_ : pagination_limit option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ limit = limit_; next_marker = next_marker_ } : list_rate_based_rules_request)
let make_list_logging_configurations_response
  ?next_marker:(next_marker_ : next_marker option)
  ?logging_configurations:(logging_configurations_ :
                            logging_configurations option)
  () =
  ({
     next_marker = next_marker_;
     logging_configurations = logging_configurations_
   } : list_logging_configurations_response)
let make_list_logging_configurations_request
  ?limit:(limit_ : pagination_limit option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ limit = limit_; next_marker = next_marker_ } : list_logging_configurations_request)
let make_ip_set_summary ~name:(name_ : resource_name)
  ~ip_set_id:(ip_set_id_ : resource_id) () =
  ({ name = name_; ip_set_id = ip_set_id_ } : ip_set_summary)
let make_list_ip_sets_response ?ip_sets:(ip_sets_ : ip_set_summaries option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ ip_sets = ip_sets_; next_marker = next_marker_ } : list_ip_sets_response)
let make_list_ip_sets_request ?limit:(limit_ : pagination_limit option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ limit = limit_; next_marker = next_marker_ } : list_ip_sets_request)
let make_geo_match_set_summary ~name:(name_ : resource_name)
  ~geo_match_set_id:(geo_match_set_id_ : resource_id) () =
  ({ name = name_; geo_match_set_id = geo_match_set_id_ } : geo_match_set_summary)
let make_list_geo_match_sets_response
  ?geo_match_sets:(geo_match_sets_ : geo_match_set_summaries option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ geo_match_sets = geo_match_sets_; next_marker = next_marker_ } : 
  list_geo_match_sets_response)
let make_list_geo_match_sets_request
  ?limit:(limit_ : pagination_limit option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ limit = limit_; next_marker = next_marker_ } : list_geo_match_sets_request)
let make_byte_match_set_summary ~name:(name_ : resource_name)
  ~byte_match_set_id:(byte_match_set_id_ : resource_id) () =
  ({ name = name_; byte_match_set_id = byte_match_set_id_ } : byte_match_set_summary)
let make_list_byte_match_sets_response
  ?byte_match_sets:(byte_match_sets_ : byte_match_set_summaries option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ byte_match_sets = byte_match_sets_; next_marker = next_marker_ } : 
  list_byte_match_sets_response)
let make_list_byte_match_sets_request
  ?limit:(limit_ : pagination_limit option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ limit = limit_; next_marker = next_marker_ } : list_byte_match_sets_request)
let make_list_activated_rules_in_rule_group_response
  ?activated_rules:(activated_rules_ : activated_rules option)
  ?next_marker:(next_marker_ : next_marker option) () =
  ({ activated_rules = activated_rules_; next_marker = next_marker_ } : 
  list_activated_rules_in_rule_group_response)
let make_list_activated_rules_in_rule_group_request
  ?limit:(limit_ : pagination_limit option)
  ?next_marker:(next_marker_ : next_marker option)
  ?rule_group_id:(rule_group_id_ : resource_id option) () =
  ({
     limit = limit_;
     next_marker = next_marker_;
     rule_group_id = rule_group_id_
   } : list_activated_rules_in_rule_group_request)
let make_ip_set ?name:(name_ : resource_name option)
  ~ip_set_descriptors:(ip_set_descriptors_ : ip_set_descriptors)
  ~ip_set_id:(ip_set_id_ : resource_id) () =
  ({
     ip_set_descriptors = ip_set_descriptors_;
     name = name_;
     ip_set_id = ip_set_id_
   } : ip_set)
let make_get_xss_match_set_response
  ?xss_match_set:(xss_match_set_ : xss_match_set option) () =
  ({ xss_match_set = xss_match_set_ } : get_xss_match_set_response)
let make_get_xss_match_set_request
  ~xss_match_set_id:(xss_match_set_id_ : resource_id) () =
  ({ xss_match_set_id = xss_match_set_id_ } : get_xss_match_set_request)
let make_get_web_acl_response ?web_ac_l:(web_ac_l_ : web_ac_l option) () =
  ({ web_ac_l = web_ac_l_ } : get_web_acl_response)
let make_get_web_acl_request ~web_acl_id:(web_acl_id_ : resource_id) () =
  ({ web_acl_id = web_acl_id_ } : get_web_acl_request)
let make_get_sql_injection_match_set_response
  ?sql_injection_match_set:(sql_injection_match_set_ :
                             sql_injection_match_set option)
  () =
  ({ sql_injection_match_set = sql_injection_match_set_ } : get_sql_injection_match_set_response)
let make_get_sql_injection_match_set_request
  ~sql_injection_match_set_id:(sql_injection_match_set_id_ : resource_id) ()
  =
  ({ sql_injection_match_set_id = sql_injection_match_set_id_ } : get_sql_injection_match_set_request)
let make_get_size_constraint_set_response
  ?size_constraint_set:(size_constraint_set_ : size_constraint_set option) ()
  =
  ({ size_constraint_set = size_constraint_set_ } : get_size_constraint_set_response)
let make_get_size_constraint_set_request
  ~size_constraint_set_id:(size_constraint_set_id_ : resource_id) () =
  ({ size_constraint_set_id = size_constraint_set_id_ } : get_size_constraint_set_request)
let make_get_sampled_requests_response
  ?time_window:(time_window_ : time_window option)
  ?population_size:(population_size_ : population_size option)
  ?sampled_requests:(sampled_requests_ : sampled_http_requests option) () =
  ({
     time_window = time_window_;
     population_size = population_size_;
     sampled_requests = sampled_requests_
   } : get_sampled_requests_response)
let make_get_sampled_requests_request
  ~max_items:(max_items_ : get_sampled_requests_max_items)
  ~time_window:(time_window_ : time_window) ~rule_id:(rule_id_ : resource_id)
  ~web_acl_id:(web_acl_id_ : resource_id) () =
  ({
     max_items = max_items_;
     time_window = time_window_;
     rule_id = rule_id_;
     web_acl_id = web_acl_id_
   } : get_sampled_requests_request)
let make_get_rule_response ?rule:(rule_ : rule option) () =
  ({ rule = rule_ } : get_rule_response)
let make_get_rule_request ~rule_id:(rule_id_ : resource_id) () =
  ({ rule_id = rule_id_ } : get_rule_request)
let make_get_rule_group_response
  ?rule_group:(rule_group_ : rule_group option) () =
  ({ rule_group = rule_group_ } : get_rule_group_response)
let make_get_rule_group_request ~rule_group_id:(rule_group_id_ : resource_id)
  () = ({ rule_group_id = rule_group_id_ } : get_rule_group_request)
let make_get_regex_pattern_set_response
  ?regex_pattern_set:(regex_pattern_set_ : regex_pattern_set option) () =
  ({ regex_pattern_set = regex_pattern_set_ } : get_regex_pattern_set_response)
let make_get_regex_pattern_set_request
  ~regex_pattern_set_id:(regex_pattern_set_id_ : resource_id) () =
  ({ regex_pattern_set_id = regex_pattern_set_id_ } : get_regex_pattern_set_request)
let make_get_regex_match_set_response
  ?regex_match_set:(regex_match_set_ : regex_match_set option) () =
  ({ regex_match_set = regex_match_set_ } : get_regex_match_set_response)
let make_get_regex_match_set_request
  ~regex_match_set_id:(regex_match_set_id_ : resource_id) () =
  ({ regex_match_set_id = regex_match_set_id_ } : get_regex_match_set_request)
let make_get_rate_based_rule_response ?rule:(rule_ : rate_based_rule option)
  () = ({ rule = rule_ } : get_rate_based_rule_response)
let make_get_rate_based_rule_request ~rule_id:(rule_id_ : resource_id) () =
  ({ rule_id = rule_id_ } : get_rate_based_rule_request)
let make_get_rate_based_rule_managed_keys_response
  ?next_marker:(next_marker_ : next_marker option)
  ?managed_keys:(managed_keys_ : managed_keys option) () =
  ({ next_marker = next_marker_; managed_keys = managed_keys_ } : get_rate_based_rule_managed_keys_response)
let make_get_rate_based_rule_managed_keys_request
  ?next_marker:(next_marker_ : next_marker option)
  ~rule_id:(rule_id_ : resource_id) () =
  ({ next_marker = next_marker_; rule_id = rule_id_ } : get_rate_based_rule_managed_keys_request)
let make_get_permission_policy_response
  ?policy:(policy_ : policy_string option) () =
  ({ policy = policy_ } : get_permission_policy_response)
let make_get_permission_policy_request
  ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_permission_policy_request)
let make_get_logging_configuration_response
  ?logging_configuration:(logging_configuration_ :
                           logging_configuration option)
  () =
  ({ logging_configuration = logging_configuration_ } : get_logging_configuration_response)
let make_get_logging_configuration_request
  ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_logging_configuration_request)
let make_get_ip_set_response ?ip_set:(ip_set_ : ip_set option) () =
  ({ ip_set = ip_set_ } : get_ip_set_response)
let make_get_ip_set_request ~ip_set_id:(ip_set_id_ : resource_id) () =
  ({ ip_set_id = ip_set_id_ } : get_ip_set_request)
let make_geo_match_set ?name:(name_ : resource_name option)
  ~geo_match_constraints:(geo_match_constraints_ : geo_match_constraints)
  ~geo_match_set_id:(geo_match_set_id_ : resource_id) () =
  ({
     geo_match_constraints = geo_match_constraints_;
     name = name_;
     geo_match_set_id = geo_match_set_id_
   } : geo_match_set)
let make_get_geo_match_set_response
  ?geo_match_set:(geo_match_set_ : geo_match_set option) () =
  ({ geo_match_set = geo_match_set_ } : get_geo_match_set_response)
let make_get_geo_match_set_request
  ~geo_match_set_id:(geo_match_set_id_ : resource_id) () =
  ({ geo_match_set_id = geo_match_set_id_ } : get_geo_match_set_request)
let make_get_change_token_status_response
  ?change_token_status:(change_token_status_ : change_token_status option) ()
  =
  ({ change_token_status = change_token_status_ } : get_change_token_status_response)
let make_get_change_token_status_request
  ~change_token:(change_token_ : change_token) () =
  ({ change_token = change_token_ } : get_change_token_status_request)
let make_get_change_token_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : get_change_token_response)
let make_get_change_token_request () = (() : unit)
let make_byte_match_set ?name:(name_ : resource_name option)
  ~byte_match_tuples:(byte_match_tuples_ : byte_match_tuples)
  ~byte_match_set_id:(byte_match_set_id_ : resource_id) () =
  ({
     byte_match_tuples = byte_match_tuples_;
     name = name_;
     byte_match_set_id = byte_match_set_id_
   } : byte_match_set)
let make_get_byte_match_set_response
  ?byte_match_set:(byte_match_set_ : byte_match_set option) () =
  ({ byte_match_set = byte_match_set_ } : get_byte_match_set_response)
let make_get_byte_match_set_request
  ~byte_match_set_id:(byte_match_set_id_ : resource_id) () =
  ({ byte_match_set_id = byte_match_set_id_ } : get_byte_match_set_request)
let make_delete_xss_match_set_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_xss_match_set_response)
let make_delete_xss_match_set_request
  ~change_token:(change_token_ : change_token)
  ~xss_match_set_id:(xss_match_set_id_ : resource_id) () =
  ({ change_token = change_token_; xss_match_set_id = xss_match_set_id_ } : 
  delete_xss_match_set_request)
let make_delete_web_acl_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_web_acl_response)
let make_delete_web_acl_request ~change_token:(change_token_ : change_token)
  ~web_acl_id:(web_acl_id_ : resource_id) () =
  ({ change_token = change_token_; web_acl_id = web_acl_id_ } : delete_web_acl_request)
let make_delete_sql_injection_match_set_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_sql_injection_match_set_response)
let make_delete_sql_injection_match_set_request
  ~change_token:(change_token_ : change_token)
  ~sql_injection_match_set_id:(sql_injection_match_set_id_ : resource_id) ()
  =
  ({
     change_token = change_token_;
     sql_injection_match_set_id = sql_injection_match_set_id_
   } : delete_sql_injection_match_set_request)
let make_delete_size_constraint_set_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_size_constraint_set_response)
let make_delete_size_constraint_set_request
  ~change_token:(change_token_ : change_token)
  ~size_constraint_set_id:(size_constraint_set_id_ : resource_id) () =
  ({
     change_token = change_token_;
     size_constraint_set_id = size_constraint_set_id_
   } : delete_size_constraint_set_request)
let make_delete_rule_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_rule_response)
let make_delete_rule_request ~change_token:(change_token_ : change_token)
  ~rule_id:(rule_id_ : resource_id) () =
  ({ change_token = change_token_; rule_id = rule_id_ } : delete_rule_request)
let make_delete_rule_group_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_rule_group_response)
let make_delete_rule_group_request
  ~change_token:(change_token_ : change_token)
  ~rule_group_id:(rule_group_id_ : resource_id) () =
  ({ change_token = change_token_; rule_group_id = rule_group_id_ } : 
  delete_rule_group_request)
let make_delete_regex_pattern_set_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_regex_pattern_set_response)
let make_delete_regex_pattern_set_request
  ~change_token:(change_token_ : change_token)
  ~regex_pattern_set_id:(regex_pattern_set_id_ : resource_id) () =
  ({
     change_token = change_token_;
     regex_pattern_set_id = regex_pattern_set_id_
   } : delete_regex_pattern_set_request)
let make_delete_regex_match_set_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_regex_match_set_response)
let make_delete_regex_match_set_request
  ~change_token:(change_token_ : change_token)
  ~regex_match_set_id:(regex_match_set_id_ : resource_id) () =
  ({ change_token = change_token_; regex_match_set_id = regex_match_set_id_ } : 
  delete_regex_match_set_request)
let make_delete_rate_based_rule_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_rate_based_rule_response)
let make_delete_rate_based_rule_request
  ~change_token:(change_token_ : change_token)
  ~rule_id:(rule_id_ : resource_id) () =
  ({ change_token = change_token_; rule_id = rule_id_ } : delete_rate_based_rule_request)
let make_delete_permission_policy_response () = (() : unit)
let make_delete_permission_policy_request
  ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : delete_permission_policy_request)
let make_delete_logging_configuration_response () = (() : unit)
let make_delete_logging_configuration_request
  ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : delete_logging_configuration_request)
let make_delete_ip_set_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_ip_set_response)
let make_delete_ip_set_request ~change_token:(change_token_ : change_token)
  ~ip_set_id:(ip_set_id_ : resource_id) () =
  ({ change_token = change_token_; ip_set_id = ip_set_id_ } : delete_ip_set_request)
let make_delete_geo_match_set_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_geo_match_set_response)
let make_delete_geo_match_set_request
  ~change_token:(change_token_ : change_token)
  ~geo_match_set_id:(geo_match_set_id_ : resource_id) () =
  ({ change_token = change_token_; geo_match_set_id = geo_match_set_id_ } : 
  delete_geo_match_set_request)
let make_delete_byte_match_set_response
  ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_byte_match_set_response)
let make_delete_byte_match_set_request
  ~change_token:(change_token_ : change_token)
  ~byte_match_set_id:(byte_match_set_id_ : resource_id) () =
  ({ change_token = change_token_; byte_match_set_id = byte_match_set_id_ } : 
  delete_byte_match_set_request)
let make_create_xss_match_set_response
  ?change_token:(change_token_ : change_token option)
  ?xss_match_set:(xss_match_set_ : xss_match_set option) () =
  ({ change_token = change_token_; xss_match_set = xss_match_set_ } : 
  create_xss_match_set_response)
let make_create_xss_match_set_request
  ~change_token:(change_token_ : change_token) ~name:(name_ : resource_name)
  () =
  ({ change_token = change_token_; name = name_ } : create_xss_match_set_request)
let make_create_web_acl_response
  ?change_token:(change_token_ : change_token option)
  ?web_ac_l:(web_ac_l_ : web_ac_l option) () =
  ({ change_token = change_token_; web_ac_l = web_ac_l_ } : create_web_acl_response)
let make_create_web_acl_request ?tags:(tags_ : tag_list option)
  ~change_token:(change_token_ : change_token)
  ~default_action:(default_action_ : waf_action)
  ~metric_name:(metric_name_ : metric_name) ~name:(name_ : resource_name) ()
  =
  ({
     tags = tags_;
     change_token = change_token_;
     default_action = default_action_;
     metric_name = metric_name_;
     name = name_
   } : create_web_acl_request)
let make_create_web_acl_migration_stack_response
  ~s3_object_url:(s3_object_url_ : s3_object_url) () =
  ({ s3_object_url = s3_object_url_ } : create_web_acl_migration_stack_response)
let make_create_web_acl_migration_stack_request
  ~ignore_unsupported_type:(ignore_unsupported_type_ :
                             ignore_unsupported_type)
  ~s3_bucket_name:(s3_bucket_name_ : s3_bucket_name)
  ~web_acl_id:(web_acl_id_ : resource_id) () =
  ({
     ignore_unsupported_type = ignore_unsupported_type_;
     s3_bucket_name = s3_bucket_name_;
     web_acl_id = web_acl_id_
   } : create_web_acl_migration_stack_request)
let make_create_sql_injection_match_set_response
  ?change_token:(change_token_ : change_token option)
  ?sql_injection_match_set:(sql_injection_match_set_ :
                             sql_injection_match_set option)
  () =
  ({
     change_token = change_token_;
     sql_injection_match_set = sql_injection_match_set_
   } : create_sql_injection_match_set_response)
let make_create_sql_injection_match_set_request
  ~change_token:(change_token_ : change_token) ~name:(name_ : resource_name)
  () =
  ({ change_token = change_token_; name = name_ } : create_sql_injection_match_set_request)
let make_create_size_constraint_set_response
  ?change_token:(change_token_ : change_token option)
  ?size_constraint_set:(size_constraint_set_ : size_constraint_set option) ()
  =
  ({ change_token = change_token_; size_constraint_set = size_constraint_set_
   } : create_size_constraint_set_response)
let make_create_size_constraint_set_request
  ~change_token:(change_token_ : change_token) ~name:(name_ : resource_name)
  () =
  ({ change_token = change_token_; name = name_ } : create_size_constraint_set_request)
let make_create_rule_response
  ?change_token:(change_token_ : change_token option)
  ?rule:(rule_ : rule option) () =
  ({ change_token = change_token_; rule = rule_ } : create_rule_response)
let make_create_rule_request ?tags:(tags_ : tag_list option)
  ~change_token:(change_token_ : change_token)
  ~metric_name:(metric_name_ : metric_name) ~name:(name_ : resource_name) ()
  =
  ({
     tags = tags_;
     change_token = change_token_;
     metric_name = metric_name_;
     name = name_
   } : create_rule_request)
let make_create_rule_group_response
  ?change_token:(change_token_ : change_token option)
  ?rule_group:(rule_group_ : rule_group option) () =
  ({ change_token = change_token_; rule_group = rule_group_ } : create_rule_group_response)
let make_create_rule_group_request ?tags:(tags_ : tag_list option)
  ~change_token:(change_token_ : change_token)
  ~metric_name:(metric_name_ : metric_name) ~name:(name_ : resource_name) ()
  =
  ({
     tags = tags_;
     change_token = change_token_;
     metric_name = metric_name_;
     name = name_
   } : create_rule_group_request)
let make_create_regex_pattern_set_response
  ?change_token:(change_token_ : change_token option)
  ?regex_pattern_set:(regex_pattern_set_ : regex_pattern_set option) () =
  ({ change_token = change_token_; regex_pattern_set = regex_pattern_set_ } : 
  create_regex_pattern_set_response)
let make_create_regex_pattern_set_request
  ~change_token:(change_token_ : change_token) ~name:(name_ : resource_name)
  () =
  ({ change_token = change_token_; name = name_ } : create_regex_pattern_set_request)
let make_create_regex_match_set_response
  ?change_token:(change_token_ : change_token option)
  ?regex_match_set:(regex_match_set_ : regex_match_set option) () =
  ({ change_token = change_token_; regex_match_set = regex_match_set_ } : 
  create_regex_match_set_response)
let make_create_regex_match_set_request
  ~change_token:(change_token_ : change_token) ~name:(name_ : resource_name)
  () =
  ({ change_token = change_token_; name = name_ } : create_regex_match_set_request)
let make_create_rate_based_rule_response
  ?change_token:(change_token_ : change_token option)
  ?rule:(rule_ : rate_based_rule option) () =
  ({ change_token = change_token_; rule = rule_ } : create_rate_based_rule_response)
let make_create_rate_based_rule_request ?tags:(tags_ : tag_list option)
  ~change_token:(change_token_ : change_token)
  ~rate_limit:(rate_limit_ : rate_limit) ~rate_key:(rate_key_ : rate_key)
  ~metric_name:(metric_name_ : metric_name) ~name:(name_ : resource_name) ()
  =
  ({
     tags = tags_;
     change_token = change_token_;
     rate_limit = rate_limit_;
     rate_key = rate_key_;
     metric_name = metric_name_;
     name = name_
   } : create_rate_based_rule_request)
let make_create_ip_set_response
  ?change_token:(change_token_ : change_token option)
  ?ip_set:(ip_set_ : ip_set option) () =
  ({ change_token = change_token_; ip_set = ip_set_ } : create_ip_set_response)
let make_create_ip_set_request ~change_token:(change_token_ : change_token)
  ~name:(name_ : resource_name) () =
  ({ change_token = change_token_; name = name_ } : create_ip_set_request)
let make_create_geo_match_set_response
  ?change_token:(change_token_ : change_token option)
  ?geo_match_set:(geo_match_set_ : geo_match_set option) () =
  ({ change_token = change_token_; geo_match_set = geo_match_set_ } : 
  create_geo_match_set_response)
let make_create_geo_match_set_request
  ~change_token:(change_token_ : change_token) ~name:(name_ : resource_name)
  () =
  ({ change_token = change_token_; name = name_ } : create_geo_match_set_request)
let make_create_byte_match_set_response
  ?change_token:(change_token_ : change_token option)
  ?byte_match_set:(byte_match_set_ : byte_match_set option) () =
  ({ change_token = change_token_; byte_match_set = byte_match_set_ } : 
  create_byte_match_set_response)
let make_create_byte_match_set_request
  ~change_token:(change_token_ : change_token) ~name:(name_ : resource_name)
  () =
  ({ change_token = change_token_; name = name_ } : create_byte_match_set_request)