open Types
val make_single_header : name:field_to_match_data -> unit -> single_header
val make_single_query_argument :
  name:field_to_match_data -> unit -> single_query_argument
val make_all_query_arguments : unit -> unit
val make_uri_path : unit -> unit
val make_query_string : unit -> unit
val make_body : ?oversize_handling:oversize_handling -> unit -> body
val make_method_ : unit -> unit
val make_all : unit -> unit
val make_json_match_pattern :
  ?included_paths:json_pointer_paths ->
    ?all:all -> unit -> json_match_pattern
val make_json_body :
  ?oversize_handling:oversize_handling ->
    ?invalid_fallback_behavior:body_parsing_fallback_behavior ->
      match_scope:json_match_scope ->
        match_pattern:json_match_pattern -> unit -> json_body
val make_header_match_pattern :
  ?excluded_headers:header_names ->
    ?included_headers:header_names ->
      ?all:all -> unit -> header_match_pattern
val make_headers :
  oversize_handling:oversize_handling ->
    match_scope:map_match_scope ->
      match_pattern:header_match_pattern -> unit -> headers
val make_cookie_match_pattern :
  ?excluded_cookies:cookie_names ->
    ?included_cookies:cookie_names ->
      ?all:all -> unit -> cookie_match_pattern
val make_cookies :
  oversize_handling:oversize_handling ->
    match_scope:map_match_scope ->
      match_pattern:cookie_match_pattern -> unit -> cookies
val make_header_order :
  oversize_handling:oversize_handling -> unit -> header_order
val make_ja3_fingerprint :
  fallback_behavior:fallback_behavior -> unit -> ja3_fingerprint
val make_ja4_fingerprint :
  fallback_behavior:fallback_behavior -> unit -> ja4_fingerprint
val make_uri_fragment :
  ?fallback_behavior:fallback_behavior -> unit -> uri_fragment
val make_field_to_match :
  ?uri_fragment:uri_fragment ->
    ?ja4_fingerprint:ja4_fingerprint ->
      ?ja3_fingerprint:ja3_fingerprint ->
        ?header_order:header_order ->
          ?cookies:cookies ->
            ?headers:headers ->
              ?json_body:json_body ->
                ?method_:method_ ->
                  ?body:body ->
                    ?query_string:query_string ->
                      ?uri_path:uri_path ->
                        ?all_query_arguments:all_query_arguments ->
                          ?single_query_argument:single_query_argument ->
                            ?single_header:single_header ->
                              unit -> field_to_match
val make_text_transformation :
  type_:text_transformation_type ->
    priority:text_transformation_priority -> unit -> text_transformation
val make_xss_match_statement :
  text_transformations:text_transformations ->
    field_to_match:field_to_match -> unit -> xss_match_statement
val make_web_acl_summary :
  ?ar_n:resource_arn ->
    ?lock_token:lock_token ->
      ?description:entity_description ->
        ?id:entity_id -> ?name:entity_name -> unit -> web_acl_summary
val make_custom_http_header :
  value:custom_http_header_value ->
    name:custom_http_header_name -> unit -> custom_http_header
val make_custom_response :
  ?response_headers:custom_http_headers ->
    ?custom_response_body_key:entity_name ->
      response_code:response_status_code -> unit -> custom_response
val make_block_action :
  ?custom_response:custom_response -> unit -> block_action
val make_custom_request_handling :
  insert_headers:custom_http_headers -> unit -> custom_request_handling
val make_allow_action :
  ?custom_request_handling:custom_request_handling -> unit -> allow_action
val make_default_action :
  ?allow:allow_action -> ?block:block_action -> unit -> default_action
val make_byte_match_statement :
  positional_constraint:positional_constraint ->
    text_transformations:text_transformations ->
      field_to_match:field_to_match ->
        search_string:search_string -> unit -> byte_match_statement
val make_sqli_match_statement :
  ?sensitivity_level:sensitivity_level ->
    text_transformations:text_transformations ->
      field_to_match:field_to_match -> unit -> sqli_match_statement
val make_size_constraint_statement :
  text_transformations:text_transformations ->
    size:size ->
      comparison_operator:comparison_operator ->
        field_to_match:field_to_match -> unit -> size_constraint_statement
val make_forwarded_ip_config :
  fallback_behavior:fallback_behavior ->
    header_name:forwarded_ip_header_name -> unit -> forwarded_ip_config
val make_geo_match_statement :
  ?forwarded_ip_config:forwarded_ip_config ->
    ?country_codes:country_codes -> unit -> geo_match_statement
val make_excluded_rule : name:entity_name -> unit -> excluded_rule
val make_count_action :
  ?custom_request_handling:custom_request_handling -> unit -> count_action
val make_captcha_action :
  ?custom_request_handling:custom_request_handling -> unit -> captcha_action
val make_challenge_action :
  ?custom_request_handling:custom_request_handling ->
    unit -> challenge_action
val make_rule_action :
  ?challenge:challenge_action ->
    ?captcha:captcha_action ->
      ?count:count_action ->
        ?allow:allow_action -> ?block:block_action -> unit -> rule_action
val make_rule_action_override :
  action_to_use:rule_action ->
    name:entity_name -> unit -> rule_action_override
val make_rule_group_reference_statement :
  ?rule_action_overrides:rule_action_overrides ->
    ?excluded_rules:excluded_rules ->
      ar_n:resource_arn -> unit -> rule_group_reference_statement
val make_ip_set_forwarded_ip_config :
  position:forwarded_ip_position ->
    fallback_behavior:fallback_behavior ->
      header_name:forwarded_ip_header_name ->
        unit -> ip_set_forwarded_ip_config
val make_ip_set_reference_statement :
  ?ip_set_forwarded_ip_config:ip_set_forwarded_ip_config ->
    ar_n:resource_arn -> unit -> ip_set_reference_statement
val make_regex_pattern_set_reference_statement :
  text_transformations:text_transformations ->
    field_to_match:field_to_match ->
      ar_n:resource_arn -> unit -> regex_pattern_set_reference_statement
val make_rate_limit_header :
  text_transformations:text_transformations ->
    name:field_to_match_data -> unit -> rate_limit_header
val make_rate_limit_cookie :
  text_transformations:text_transformations ->
    name:field_to_match_data -> unit -> rate_limit_cookie
val make_rate_limit_query_argument :
  text_transformations:text_transformations ->
    name:field_to_match_data -> unit -> rate_limit_query_argument
val make_rate_limit_query_string :
  text_transformations:text_transformations ->
    unit -> rate_limit_query_string
val make_rate_limit_http_method : unit -> unit
val make_rate_limit_forwarded_i_p : unit -> unit
val make_rate_limit_i_p : unit -> unit
val make_rate_limit_label_namespace :
  namespace:label_namespace -> unit -> rate_limit_label_namespace
val make_rate_limit_uri_path :
  text_transformations:text_transformations -> unit -> rate_limit_uri_path
val make_rate_limit_ja3_fingerprint :
  fallback_behavior:fallback_behavior -> unit -> rate_limit_ja3_fingerprint
val make_rate_limit_ja4_fingerprint :
  fallback_behavior:fallback_behavior -> unit -> rate_limit_ja4_fingerprint
val make_rate_limit_asn : unit -> unit
val make_rate_based_statement_custom_key :
  ?as_n:rate_limit_asn ->
    ?ja4_fingerprint:rate_limit_ja4_fingerprint ->
      ?ja3_fingerprint:rate_limit_ja3_fingerprint ->
        ?uri_path:rate_limit_uri_path ->
          ?label_namespace:rate_limit_label_namespace ->
            ?i_p:rate_limit_i_p ->
              ?forwarded_i_p:rate_limit_forwarded_i_p ->
                ?http_method:rate_limit_http_method ->
                  ?query_string:rate_limit_query_string ->
                    ?query_argument:rate_limit_query_argument ->
                      ?cookie:rate_limit_cookie ->
                        ?header:rate_limit_header ->
                          unit -> rate_based_statement_custom_key
val make_username_field :
  identifier:field_identifier -> unit -> username_field
val make_password_field :
  identifier:field_identifier -> unit -> password_field
val make_aws_managed_rules_bot_control_rule_set :
  ?enable_machine_learning:enable_machine_learning ->
    inspection_level:inspection_level ->
      unit -> aws_managed_rules_bot_control_rule_set
val make_request_inspection :
  password_field:password_field ->
    username_field:username_field ->
      payload_type:payload_type -> unit -> request_inspection
val make_response_inspection_status_code :
  failure_codes:response_inspection_status_code_failure_codes ->
    success_codes:response_inspection_status_code_success_codes ->
      unit -> response_inspection_status_code
val make_response_inspection_header :
  failure_values:response_inspection_header_failure_values ->
    success_values:response_inspection_header_success_values ->
      name:response_inspection_header_name ->
        unit -> response_inspection_header
val make_response_inspection_body_contains :
  failure_strings:response_inspection_body_contains_failure_strings ->
    success_strings:response_inspection_body_contains_success_strings ->
      unit -> response_inspection_body_contains
val make_response_inspection_json :
  failure_values:response_inspection_json_failure_values ->
    success_values:response_inspection_json_success_values ->
      identifier:field_identifier -> unit -> response_inspection_json
val make_response_inspection :
  ?json:response_inspection_json ->
    ?body_contains:response_inspection_body_contains ->
      ?header:response_inspection_header ->
        ?status_code:response_inspection_status_code ->
          unit -> response_inspection
val make_aws_managed_rules_atp_rule_set :
  ?enable_regex_in_path:boolean_ ->
    ?response_inspection:response_inspection ->
      ?request_inspection:request_inspection ->
        login_path:string_ -> unit -> aws_managed_rules_atp_rule_set
val make_email_field : identifier:field_identifier -> unit -> email_field
val make_phone_number_field :
  identifier:field_identifier -> unit -> phone_number_field
val make_address_field : identifier:field_identifier -> unit -> address_field
val make_request_inspection_acf_p :
  ?address_fields:address_fields ->
    ?phone_number_fields:phone_number_fields ->
      ?email_field:email_field ->
        ?password_field:password_field ->
          ?username_field:username_field ->
            payload_type:payload_type -> unit -> request_inspection_acf_p
val make_aws_managed_rules_acfp_rule_set :
  ?enable_regex_in_path:boolean_ ->
    ?response_inspection:response_inspection ->
      request_inspection:request_inspection_acf_p ->
        registration_page_path:registration_page_path_string ->
          creation_path:creation_path_string ->
            unit -> aws_managed_rules_acfp_rule_set
val make_regex : ?regex_string:regex_pattern_string -> unit -> regex
val make_client_side_action :
  ?exempt_uri_regular_expressions:regular_expression_list ->
    ?sensitivity:sensitivity_to_act ->
      usage_of_action:usage_of_action -> unit -> client_side_action
val make_client_side_action_config :
  challenge:client_side_action -> unit -> client_side_action_config
val make_aws_managed_rules_anti_d_do_s_rule_set :
  ?sensitivity_to_block:sensitivity_to_act ->
    client_side_action_config:client_side_action_config ->
      unit -> aws_managed_rules_anti_d_do_s_rule_set
val make_managed_rule_group_config :
  ?aws_managed_rules_anti_d_do_s_rule_set:aws_managed_rules_anti_d_do_s_rule_set
    ->
    ?aws_managed_rules_acfp_rule_set:aws_managed_rules_acfp_rule_set ->
      ?aws_managed_rules_atp_rule_set:aws_managed_rules_atp_rule_set ->
        ?aws_managed_rules_bot_control_rule_set:aws_managed_rules_bot_control_rule_set
          ->
          ?password_field:password_field ->
            ?username_field:username_field ->
              ?payload_type:payload_type ->
                ?login_path:login_path_string ->
                  unit -> managed_rule_group_config
val make_label_match_statement :
  key:label_match_key ->
    scope:label_match_scope -> unit -> label_match_statement
val make_regex_match_statement :
  text_transformations:text_transformations ->
    field_to_match:field_to_match ->
      regex_string:regex_pattern_string -> unit -> regex_match_statement
val make_asn_match_statement :
  ?forwarded_ip_config:forwarded_ip_config ->
    asn_list:asn_list -> unit -> asn_match_statement
val make_and_statement : statements:statements -> unit -> and_statement
val make_managed_rule_group_statement :
  ?rule_action_overrides:rule_action_overrides ->
    ?managed_rule_group_configs:managed_rule_group_configs ->
      ?scope_down_statement:statement ->
        ?excluded_rules:excluded_rules ->
          ?version:version_key_string ->
            name:entity_name ->
              vendor_name:vendor_name -> unit -> managed_rule_group_statement
val make_not_statement : statement:statement -> unit -> not_statement
val make_or_statement : statements:statements -> unit -> or_statement
val make_rate_based_statement :
  ?custom_keys:rate_based_statement_custom_keys ->
    ?forwarded_ip_config:forwarded_ip_config ->
      ?scope_down_statement:statement ->
        ?evaluation_window_sec:evaluation_window_sec ->
          aggregate_key_type:rate_based_statement_aggregate_key_type ->
            limit:rate_limit -> unit -> rate_based_statement
val make_statement :
  ?asn_match_statement:asn_match_statement ->
    ?regex_match_statement:regex_match_statement ->
      ?label_match_statement:label_match_statement ->
        ?managed_rule_group_statement:managed_rule_group_statement ->
          ?not_statement:not_statement ->
            ?or_statement:or_statement ->
              ?and_statement:and_statement ->
                ?rate_based_statement:rate_based_statement ->
                  ?regex_pattern_set_reference_statement:regex_pattern_set_reference_statement
                    ->
                    ?ip_set_reference_statement:ip_set_reference_statement ->
                      ?rule_group_reference_statement:rule_group_reference_statement
                        ->
                        ?geo_match_statement:geo_match_statement ->
                          ?size_constraint_statement:size_constraint_statement
                            ->
                            ?xss_match_statement:xss_match_statement ->
                              ?sqli_match_statement:sqli_match_statement ->
                                ?byte_match_statement:byte_match_statement ->
                                  unit -> statement
val make_none_action : unit -> unit
val make_override_action :
  ?none:none_action -> ?count:count_action -> unit -> override_action
val make_label : name:label_name -> unit -> label
val make_visibility_config :
  metric_name:metric_name ->
    cloud_watch_metrics_enabled:boolean_ ->
      sampled_requests_enabled:boolean_ -> unit -> visibility_config
val make_immunity_time_property :
  immunity_time:time_window_second -> unit -> immunity_time_property
val make_captcha_config :
  ?immunity_time_property:immunity_time_property -> unit -> captcha_config
val make_challenge_config :
  ?immunity_time_property:immunity_time_property -> unit -> challenge_config
val make_rule :
  ?challenge_config:challenge_config ->
    ?captcha_config:captcha_config ->
      ?rule_labels:labels ->
        ?override_action:override_action ->
          ?action:rule_action ->
            visibility_config:visibility_config ->
              statement:statement ->
                priority:rule_priority -> name:entity_name -> unit -> rule
val make_field_to_protect :
  ?field_keys:field_to_protect_keys ->
    field_type:field_to_protect_type -> unit -> field_to_protect
val make_data_protection :
  ?exclude_rate_based_details:boolean_ ->
    ?exclude_rule_match_details:boolean_ ->
      action:data_protection_action ->
        field:field_to_protect -> unit -> data_protection
val make_data_protection_config :
  data_protections:data_protections -> unit -> data_protection_config
val make_firewall_manager_statement :
  ?rule_group_reference_statement:rule_group_reference_statement ->
    ?managed_rule_group_statement:managed_rule_group_statement ->
      unit -> firewall_manager_statement
val make_firewall_manager_rule_group :
  visibility_config:visibility_config ->
    override_action:override_action ->
      firewall_manager_statement:firewall_manager_statement ->
        priority:rule_priority ->
          name:entity_name -> unit -> firewall_manager_rule_group
val make_custom_response_body :
  content:response_content ->
    content_type:response_content_type -> unit -> custom_response_body
val make_request_body_associated_resource_type_config :
  default_size_inspection_limit:size_inspection_limit ->
    unit -> request_body_associated_resource_type_config
val make_association_config :
  ?request_body:request_body -> unit -> association_config
val make_on_source_d_do_s_protection_config :
  alb_low_reputation_mode:low_reputation_mode ->
    unit -> on_source_d_do_s_protection_config
val make_application_attribute :
  ?values:attribute_values ->
    ?name:attribute_name -> unit -> application_attribute
val make_application_config :
  ?attributes:application_attributes -> unit -> application_config
val make_web_ac_l :
  ?application_config:application_config ->
    ?on_source_d_do_s_protection_config:on_source_d_do_s_protection_config ->
      ?retrofitted_by_firewall_manager:boolean_ ->
        ?association_config:association_config ->
          ?token_domains:token_domains ->
            ?challenge_config:challenge_config ->
              ?captcha_config:captcha_config ->
                ?custom_response_bodies:custom_response_bodies ->
                  ?label_namespace:label_name ->
                    ?managed_by_firewall_manager:boolean_ ->
                      ?post_process_firewall_manager_rule_groups:firewall_manager_rule_groups
                        ->
                        ?pre_process_firewall_manager_rule_groups:firewall_manager_rule_groups
                          ->
                          ?capacity:consumed_capacity ->
                            ?data_protection_config:data_protection_config ->
                              ?rules:rules ->
                                ?description:entity_description ->
                                  visibility_config:visibility_config ->
                                    default_action:default_action ->
                                      ar_n:resource_arn ->
                                        id:entity_id ->
                                          name:entity_name ->
                                            unit -> web_ac_l
val make_version_to_publish :
  ?forecasted_lifetime:time_window_day ->
    ?associated_rule_group_arn:resource_arn -> unit -> version_to_publish
val make_update_web_acl_response :
  ?next_lock_token:lock_token -> unit -> update_web_acl_response
val make_update_web_acl_request :
  ?on_source_d_do_s_protection_config:on_source_d_do_s_protection_config ->
    ?association_config:association_config ->
      ?token_domains:token_domains ->
        ?challenge_config:challenge_config ->
          ?captcha_config:captcha_config ->
            ?custom_response_bodies:custom_response_bodies ->
              ?data_protection_config:data_protection_config ->
                ?rules:rules ->
                  ?description:entity_description ->
                    lock_token:lock_token ->
                      visibility_config:visibility_config ->
                        default_action:default_action ->
                          id:entity_id ->
                            scope:scope ->
                              name:entity_name ->
                                unit -> update_web_acl_request
val make_update_rule_group_response :
  ?next_lock_token:lock_token -> unit -> update_rule_group_response
val make_update_rule_group_request :
  ?custom_response_bodies:custom_response_bodies ->
    ?rules:rules ->
      ?description:entity_description ->
        lock_token:lock_token ->
          visibility_config:visibility_config ->
            id:entity_id ->
              scope:scope ->
                name:entity_name -> unit -> update_rule_group_request
val make_update_regex_pattern_set_response :
  ?next_lock_token:lock_token -> unit -> update_regex_pattern_set_response
val make_update_regex_pattern_set_request :
  ?description:entity_description ->
    lock_token:lock_token ->
      regular_expression_list:regular_expression_list ->
        id:entity_id ->
          scope:scope ->
            name:entity_name -> unit -> update_regex_pattern_set_request
val make_update_managed_rule_set_version_expiry_date_response :
  ?next_lock_token:lock_token ->
    ?expiry_timestamp:timestamp ->
      ?expiring_version:version_key_string ->
        unit -> update_managed_rule_set_version_expiry_date_response
val make_update_managed_rule_set_version_expiry_date_request :
  expiry_timestamp:timestamp ->
    version_to_expire:version_key_string ->
      lock_token:lock_token ->
        id:entity_id ->
          scope:scope ->
            name:entity_name ->
              unit -> update_managed_rule_set_version_expiry_date_request
val make_update_ip_set_response :
  ?next_lock_token:lock_token -> unit -> update_ip_set_response
val make_update_ip_set_request :
  ?description:entity_description ->
    lock_token:lock_token ->
      addresses:ip_addresses ->
        id:entity_id ->
          scope:scope -> name:entity_name -> unit -> update_ip_set_request
val make_untag_resource_response : unit -> unit
val make_untag_resource_request :
  tag_keys:tag_key_list ->
    resource_ar_n:resource_arn -> unit -> untag_resource_request
val make_time_window :
  end_time:timestamp -> start_time:timestamp -> unit -> time_window
val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_request :
  tags:tag_list -> resource_ar_n:resource_arn -> unit -> tag_resource_request
val make_tag_info_for_resource :
  ?tag_list:tag_list ->
    ?resource_ar_n:resource_arn -> unit -> tag_info_for_resource
val make_http_header :
  ?value:header_value -> ?name:header_name -> unit -> http_header
val make_http_request :
  ?headers:http_headers ->
    ?http_version:http_version ->
      ?method_:http_method ->
        ?ur_i:uri_string ->
          ?country:country -> ?client_i_p:ip_string -> unit -> http_request
val make_captcha_response :
  ?failure_reason:failure_reason ->
    ?solve_timestamp:solve_timestamp ->
      ?response_code:response_code -> unit -> captcha_response
val make_challenge_response :
  ?failure_reason:failure_reason ->
    ?solve_timestamp:solve_timestamp ->
      ?response_code:response_code -> unit -> challenge_response
val make_sampled_http_request :
  ?overridden_action:action ->
    ?challenge_response:challenge_response ->
      ?captcha_response:captcha_response ->
        ?labels:labels ->
          ?response_code_sent:response_status_code ->
            ?request_headers_inserted:http_headers ->
              ?rule_name_within_rule_group:entity_name ->
                ?action:action ->
                  ?timestamp:timestamp ->
                    weight:sample_weight ->
                      request:http_request -> unit -> sampled_http_request
val make_rule_summary :
  ?action:rule_action -> ?name:entity_name -> unit -> rule_summary
val make_rule_group_summary :
  ?ar_n:resource_arn ->
    ?lock_token:lock_token ->
      ?description:entity_description ->
        ?id:entity_id -> ?name:entity_name -> unit -> rule_group_summary
val make_label_summary : ?name:label_name -> unit -> label_summary
val make_rule_group :
  ?consumed_labels:label_summaries ->
    ?available_labels:label_summaries ->
      ?custom_response_bodies:custom_response_bodies ->
        ?label_namespace:label_name ->
          ?rules:rules ->
            ?description:entity_description ->
              visibility_config:visibility_config ->
                ar_n:resource_arn ->
                  capacity:capacity_unit ->
                    id:entity_id -> name:entity_name -> unit -> rule_group
val make_release_summary :
  ?timestamp:timestamp ->
    ?release_version:version_key_string -> unit -> release_summary
val make_regex_pattern_set_summary :
  ?ar_n:resource_arn ->
    ?lock_token:lock_token ->
      ?description:entity_description ->
        ?id:entity_id ->
          ?name:entity_name -> unit -> regex_pattern_set_summary
val make_regex_pattern_set :
  ?regular_expression_list:regular_expression_list ->
    ?description:entity_description ->
      ?ar_n:resource_arn ->
        ?id:entity_id -> ?name:entity_name -> unit -> regex_pattern_set
val make_rate_based_statement_managed_keys_ip_set :
  ?addresses:ip_addresses ->
    ?ip_address_version:ip_address_version ->
      unit -> rate_based_statement_managed_keys_ip_set
val make_put_permission_policy_response : unit -> unit
val make_put_permission_policy_request :
  policy:policy_string ->
    resource_arn:resource_arn -> unit -> put_permission_policy_request
val make_put_managed_rule_set_versions_response :
  ?next_lock_token:lock_token ->
    unit -> put_managed_rule_set_versions_response
val make_put_managed_rule_set_versions_request :
  ?versions_to_publish:versions_to_publish ->
    ?recommended_version:version_key_string ->
      lock_token:lock_token ->
        id:entity_id ->
          scope:scope ->
            name:entity_name -> unit -> put_managed_rule_set_versions_request
val make_action_condition : action:action_value -> unit -> action_condition
val make_label_name_condition :
  label_name:label_name -> unit -> label_name_condition
val make_condition :
  ?label_name_condition:label_name_condition ->
    ?action_condition:action_condition -> unit -> condition
val make_filter :
  conditions:conditions ->
    requirement:filter_requirement ->
      behavior:filter_behavior -> unit -> filter
val make_logging_filter :
  default_behavior:filter_behavior ->
    filters:filters -> unit -> logging_filter
val make_logging_configuration :
  ?log_scope:log_scope ->
    ?log_type:log_type ->
      ?logging_filter:logging_filter ->
        ?managed_by_firewall_manager:boolean_ ->
          ?redacted_fields:redacted_fields ->
            log_destination_configs:log_destination_configs ->
              resource_arn:resource_arn -> unit -> logging_configuration
val make_put_logging_configuration_response :
  ?logging_configuration:logging_configuration ->
    unit -> put_logging_configuration_response
val make_put_logging_configuration_request :
  logging_configuration:logging_configuration ->
    unit -> put_logging_configuration_request
val make_managed_rule_set_version :
  ?expiry_timestamp:timestamp ->
    ?last_update_timestamp:timestamp ->
      ?publish_timestamp:timestamp ->
        ?forecasted_lifetime:time_window_day ->
          ?capacity:capacity_unit ->
            ?associated_rule_group_arn:resource_arn ->
              unit -> managed_rule_set_version
val make_mobile_sdk_release :
  ?tags:tag_list ->
    ?release_notes:release_notes ->
      ?timestamp:timestamp ->
        ?release_version:version_key_string -> unit -> mobile_sdk_release
val make_managed_rule_set_summary :
  ?label_namespace:label_name ->
    ?ar_n:resource_arn ->
      ?lock_token:lock_token ->
        ?description:entity_description ->
          ?id:entity_id ->
            ?name:entity_name -> unit -> managed_rule_set_summary
val make_managed_rule_set :
  ?label_namespace:label_name ->
    ?recommended_version:version_key_string ->
      ?published_versions:published_versions ->
        ?description:entity_description ->
          ar_n:resource_arn ->
            id:entity_id -> name:entity_name -> unit -> managed_rule_set
val make_managed_rule_group_version :
  ?last_update_timestamp:timestamp ->
    ?name:version_key_string -> unit -> managed_rule_group_version
val make_managed_rule_group_summary :
  ?description:entity_description ->
    ?versioning_supported:boolean_ ->
      ?name:entity_name ->
        ?vendor_name:vendor_name -> unit -> managed_rule_group_summary
val make_managed_product_descriptor :
  ?is_advanced_managed_rule_set:boolean_ ->
    ?is_versioning_supported:boolean_ ->
      ?sns_topic_arn:resource_arn ->
        ?product_description:product_description ->
          ?product_title:product_title ->
            ?product_link:product_link ->
              ?product_id:product_id ->
                ?managed_rule_set_name:entity_name ->
                  ?vendor_name:vendor_name ->
                    unit -> managed_product_descriptor
val make_list_web_ac_ls_response :
  ?web_ac_ls:web_acl_summaries ->
    ?next_marker:next_marker -> unit -> list_web_ac_ls_response
val make_list_web_ac_ls_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker -> scope:scope -> unit -> list_web_ac_ls_request
val make_list_tags_for_resource_response :
  ?tag_info_for_resource:tag_info_for_resource ->
    ?next_marker:next_marker -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker ->
      resource_ar_n:resource_arn -> unit -> list_tags_for_resource_request
val make_list_rule_groups_response :
  ?rule_groups:rule_group_summaries ->
    ?next_marker:next_marker -> unit -> list_rule_groups_response
val make_list_rule_groups_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker ->
      scope:scope -> unit -> list_rule_groups_request
val make_list_resources_for_web_acl_response :
  ?resource_arns:resource_arns -> unit -> list_resources_for_web_acl_response
val make_list_resources_for_web_acl_request :
  ?resource_type:resource_type ->
    web_acl_arn:resource_arn -> unit -> list_resources_for_web_acl_request
val make_list_regex_pattern_sets_response :
  ?regex_pattern_sets:regex_pattern_set_summaries ->
    ?next_marker:next_marker -> unit -> list_regex_pattern_sets_response
val make_list_regex_pattern_sets_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker ->
      scope:scope -> unit -> list_regex_pattern_sets_request
val make_list_mobile_sdk_releases_response :
  ?next_marker:next_marker ->
    ?release_summaries:release_summaries ->
      unit -> list_mobile_sdk_releases_response
val make_list_mobile_sdk_releases_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker ->
      platform:platform -> unit -> list_mobile_sdk_releases_request
val make_list_managed_rule_sets_response :
  ?managed_rule_sets:managed_rule_set_summaries ->
    ?next_marker:next_marker -> unit -> list_managed_rule_sets_response
val make_list_managed_rule_sets_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker ->
      scope:scope -> unit -> list_managed_rule_sets_request
val make_list_logging_configurations_response :
  ?next_marker:next_marker ->
    ?logging_configurations:logging_configurations ->
      unit -> list_logging_configurations_response
val make_list_logging_configurations_request :
  ?log_scope:log_scope ->
    ?limit:pagination_limit ->
      ?next_marker:next_marker ->
        scope:scope -> unit -> list_logging_configurations_request
val make_ip_set_summary :
  ?ar_n:resource_arn ->
    ?lock_token:lock_token ->
      ?description:entity_description ->
        ?id:entity_id -> ?name:entity_name -> unit -> ip_set_summary
val make_list_ip_sets_response :
  ?ip_sets:ip_set_summaries ->
    ?next_marker:next_marker -> unit -> list_ip_sets_response
val make_list_ip_sets_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker -> scope:scope -> unit -> list_ip_sets_request
val make_list_available_managed_rule_groups_response :
  ?managed_rule_groups:managed_rule_group_summaries ->
    ?next_marker:next_marker ->
      unit -> list_available_managed_rule_groups_response
val make_list_available_managed_rule_groups_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker ->
      scope:scope -> unit -> list_available_managed_rule_groups_request
val make_list_available_managed_rule_group_versions_response :
  ?current_default_version:version_key_string ->
    ?versions:managed_rule_group_versions ->
      ?next_marker:next_marker ->
        unit -> list_available_managed_rule_group_versions_response
val make_list_available_managed_rule_group_versions_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker ->
      scope:scope ->
        name:entity_name ->
          vendor_name:vendor_name ->
            unit -> list_available_managed_rule_group_versions_request
val make_api_key_summary :
  ?version:api_key_version ->
    ?creation_timestamp:timestamp ->
      ?api_key:api_key ->
        ?token_domains:token_domains -> unit -> api_key_summary
val make_list_api_keys_response :
  ?application_integration_ur_l:output_url ->
    ?api_key_summaries:api_key_summaries ->
      ?next_marker:next_marker -> unit -> list_api_keys_response
val make_list_api_keys_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker -> scope:scope -> unit -> list_api_keys_request
val make_ip_set :
  ?description:entity_description ->
    addresses:ip_addresses ->
      ip_address_version:ip_address_version ->
        ar_n:resource_arn ->
          id:entity_id -> name:entity_name -> unit -> ip_set
val make_get_web_acl_response :
  ?application_integration_ur_l:output_url ->
    ?lock_token:lock_token ->
      ?web_ac_l:web_ac_l -> unit -> get_web_acl_response
val make_get_web_acl_request :
  ?ar_n:resource_arn ->
    ?id:entity_id ->
      ?scope:scope -> ?name:entity_name -> unit -> get_web_acl_request
val make_get_web_acl_for_resource_response :
  ?web_ac_l:web_ac_l -> unit -> get_web_acl_for_resource_response
val make_get_web_acl_for_resource_request :
  resource_arn:resource_arn -> unit -> get_web_acl_for_resource_request
val make_get_sampled_requests_response :
  ?time_window:time_window ->
    ?population_size:population_size ->
      ?sampled_requests:sampled_http_requests ->
        unit -> get_sampled_requests_response
val make_get_sampled_requests_request :
  max_items:list_max_items ->
    time_window:time_window ->
      scope:scope ->
        rule_metric_name:metric_name ->
          web_acl_arn:resource_arn -> unit -> get_sampled_requests_request
val make_get_rule_group_response :
  ?lock_token:lock_token ->
    ?rule_group:rule_group -> unit -> get_rule_group_response
val make_get_rule_group_request :
  ?ar_n:resource_arn ->
    ?id:entity_id ->
      ?scope:scope -> ?name:entity_name -> unit -> get_rule_group_request
val make_get_regex_pattern_set_response :
  ?lock_token:lock_token ->
    ?regex_pattern_set:regex_pattern_set ->
      unit -> get_regex_pattern_set_response
val make_get_regex_pattern_set_request :
  id:entity_id ->
    scope:scope -> name:entity_name -> unit -> get_regex_pattern_set_request
val make_get_rate_based_statement_managed_keys_response :
  ?managed_keys_ip_v6:rate_based_statement_managed_keys_ip_set ->
    ?managed_keys_ip_v4:rate_based_statement_managed_keys_ip_set ->
      unit -> get_rate_based_statement_managed_keys_response
val make_get_rate_based_statement_managed_keys_request :
  ?rule_group_rule_name:entity_name ->
    rule_name:entity_name ->
      web_acl_id:entity_id ->
        web_acl_name:entity_name ->
          scope:scope ->
            unit -> get_rate_based_statement_managed_keys_request
val make_get_permission_policy_response :
  ?policy:policy_string -> unit -> get_permission_policy_response
val make_get_permission_policy_request :
  resource_arn:resource_arn -> unit -> get_permission_policy_request
val make_get_mobile_sdk_release_response :
  ?mobile_sdk_release:mobile_sdk_release ->
    unit -> get_mobile_sdk_release_response
val make_get_mobile_sdk_release_request :
  release_version:version_key_string ->
    platform:platform -> unit -> get_mobile_sdk_release_request
val make_get_managed_rule_set_response :
  ?lock_token:lock_token ->
    ?managed_rule_set:managed_rule_set ->
      unit -> get_managed_rule_set_response
val make_get_managed_rule_set_request :
  id:entity_id ->
    scope:scope -> name:entity_name -> unit -> get_managed_rule_set_request
val make_get_logging_configuration_response :
  ?logging_configuration:logging_configuration ->
    unit -> get_logging_configuration_response
val make_get_logging_configuration_request :
  ?log_scope:log_scope ->
    ?log_type:log_type ->
      resource_arn:resource_arn -> unit -> get_logging_configuration_request
val make_get_ip_set_response :
  ?lock_token:lock_token -> ?ip_set:ip_set -> unit -> get_ip_set_response
val make_get_ip_set_request :
  id:entity_id ->
    scope:scope -> name:entity_name -> unit -> get_ip_set_request
val make_get_decrypted_api_key_response :
  ?creation_timestamp:timestamp ->
    ?token_domains:token_domains -> unit -> get_decrypted_api_key_response
val make_get_decrypted_api_key_request :
  api_key:api_key -> scope:scope -> unit -> get_decrypted_api_key_request
val make_generate_mobile_sdk_release_url_response :
  ?url:download_url -> unit -> generate_mobile_sdk_release_url_response
val make_generate_mobile_sdk_release_url_request :
  release_version:version_key_string ->
    platform:platform -> unit -> generate_mobile_sdk_release_url_request
val make_disassociate_web_acl_response : unit -> unit
val make_disassociate_web_acl_request :
  resource_arn:resource_arn -> unit -> disassociate_web_acl_request
val make_describe_managed_rule_group_response :
  ?consumed_labels:label_summaries ->
    ?available_labels:label_summaries ->
      ?label_namespace:label_name ->
        ?rules:rule_summaries ->
          ?capacity:capacity_unit ->
            ?sns_topic_arn:resource_arn ->
              ?version_name:version_key_string ->
                unit -> describe_managed_rule_group_response
val make_describe_managed_rule_group_request :
  ?version_name:version_key_string ->
    scope:scope ->
      name:entity_name ->
        vendor_name:vendor_name ->
          unit -> describe_managed_rule_group_request
val make_describe_managed_products_by_vendor_response :
  ?managed_products:managed_product_descriptors ->
    unit -> describe_managed_products_by_vendor_response
val make_describe_managed_products_by_vendor_request :
  scope:scope ->
    vendor_name:vendor_name ->
      unit -> describe_managed_products_by_vendor_request
val make_describe_all_managed_products_response :
  ?managed_products:managed_product_descriptors ->
    unit -> describe_all_managed_products_response
val make_describe_all_managed_products_request :
  scope:scope -> unit -> describe_all_managed_products_request
val make_delete_web_acl_response : unit -> unit
val make_delete_web_acl_request :
  lock_token:lock_token ->
    id:entity_id ->
      scope:scope -> name:entity_name -> unit -> delete_web_acl_request
val make_delete_rule_group_response : unit -> unit
val make_delete_rule_group_request :
  lock_token:lock_token ->
    id:entity_id ->
      scope:scope -> name:entity_name -> unit -> delete_rule_group_request
val make_delete_regex_pattern_set_response : unit -> unit
val make_delete_regex_pattern_set_request :
  lock_token:lock_token ->
    id:entity_id ->
      scope:scope ->
        name:entity_name -> unit -> delete_regex_pattern_set_request
val make_delete_permission_policy_response : unit -> unit
val make_delete_permission_policy_request :
  resource_arn:resource_arn -> unit -> delete_permission_policy_request
val make_delete_logging_configuration_response : unit -> unit
val make_delete_logging_configuration_request :
  ?log_scope:log_scope ->
    ?log_type:log_type ->
      resource_arn:resource_arn ->
        unit -> delete_logging_configuration_request
val make_delete_ip_set_response : unit -> unit
val make_delete_ip_set_request :
  lock_token:lock_token ->
    id:entity_id ->
      scope:scope -> name:entity_name -> unit -> delete_ip_set_request
val make_delete_firewall_manager_rule_groups_response :
  ?next_web_acl_lock_token:lock_token ->
    unit -> delete_firewall_manager_rule_groups_response
val make_delete_firewall_manager_rule_groups_request :
  web_acl_lock_token:lock_token ->
    web_acl_arn:resource_arn ->
      unit -> delete_firewall_manager_rule_groups_request
val make_delete_api_key_response : unit -> unit
val make_delete_api_key_request :
  api_key:api_key -> scope:scope -> unit -> delete_api_key_request
val make_create_web_acl_response :
  ?summary:web_acl_summary -> unit -> create_web_acl_response
val make_create_web_acl_request :
  ?application_config:application_config ->
    ?on_source_d_do_s_protection_config:on_source_d_do_s_protection_config ->
      ?association_config:association_config ->
        ?token_domains:token_domains ->
          ?challenge_config:challenge_config ->
            ?captcha_config:captcha_config ->
              ?custom_response_bodies:custom_response_bodies ->
                ?tags:tag_list ->
                  ?data_protection_config:data_protection_config ->
                    ?rules:rules ->
                      ?description:entity_description ->
                        visibility_config:visibility_config ->
                          default_action:default_action ->
                            scope:scope ->
                              name:entity_name ->
                                unit -> create_web_acl_request
val make_create_rule_group_response :
  ?summary:rule_group_summary -> unit -> create_rule_group_response
val make_create_rule_group_request :
  ?custom_response_bodies:custom_response_bodies ->
    ?tags:tag_list ->
      ?rules:rules ->
        ?description:entity_description ->
          visibility_config:visibility_config ->
            capacity:capacity_unit ->
              scope:scope ->
                name:entity_name -> unit -> create_rule_group_request
val make_create_regex_pattern_set_response :
  ?summary:regex_pattern_set_summary ->
    unit -> create_regex_pattern_set_response
val make_create_regex_pattern_set_request :
  ?tags:tag_list ->
    ?description:entity_description ->
      regular_expression_list:regular_expression_list ->
        scope:scope ->
          name:entity_name -> unit -> create_regex_pattern_set_request
val make_create_ip_set_response :
  ?summary:ip_set_summary -> unit -> create_ip_set_response
val make_create_ip_set_request :
  ?tags:tag_list ->
    ?description:entity_description ->
      addresses:ip_addresses ->
        ip_address_version:ip_address_version ->
          scope:scope -> name:entity_name -> unit -> create_ip_set_request
val make_create_api_key_response :
  ?api_key:api_key -> unit -> create_api_key_response
val make_create_api_key_request :
  token_domains:api_key_token_domains ->
    scope:scope -> unit -> create_api_key_request
val make_check_capacity_response :
  ?capacity:consumed_capacity -> unit -> check_capacity_response
val make_check_capacity_request :
  rules:rules -> scope:scope -> unit -> check_capacity_request
val make_associate_web_acl_response : unit -> unit
val make_associate_web_acl_request :
  resource_arn:resource_arn ->
    web_acl_arn:resource_arn -> unit -> associate_web_acl_request