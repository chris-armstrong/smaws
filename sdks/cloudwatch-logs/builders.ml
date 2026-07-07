open Types

let make_upper_case_string ~with_keys:(with_keys_ : upper_case_string_with_keys) () =
  ({ with_keys = with_keys_ } : upper_case_string)

let make_s3_configuration ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?owner_account_id:(owner_account_id_ : account_id option) ~role_arn:(role_arn_ : role_arn)
    ~destination_identifier:(destination_identifier_ : s3_uri) () =
  ({
     kms_key_id = kms_key_id_;
     owner_account_id = owner_account_id_;
     role_arn = role_arn_;
     destination_identifier = destination_identifier_;
   }
    : s3_configuration)

let make_destination_configuration ~s3_configuration:(s3_configuration_ : s3_configuration) () =
  ({ s3_configuration = s3_configuration_ } : destination_configuration)

let make_update_scheduled_query_response ?last_updated_time:(last_updated_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?execution_role_arn:(execution_role_arn_ : role_arn option)
    ?schedule_end_time:(schedule_end_time_ : timestamp option)
    ?schedule_start_time:(schedule_start_time_ : timestamp option)
    ?last_execution_status:(last_execution_status_ : execution_status option)
    ?last_triggered_time:(last_triggered_time_ : timestamp option)
    ?schedule_type:(schedule_type_ : schedule_type option)
    ?state:(state_ : scheduled_query_state option)
    ?destination_configuration:(destination_configuration_ : destination_configuration option)
    ?end_time_offset:(end_time_offset_ : end_time_offset option)
    ?start_time_offset:(start_time_offset_ : start_time_offset option)
    ?timezone:(timezone_ : schedule_timezone option)
    ?schedule_expression:(schedule_expression_ : schedule_expression option)
    ?log_group_identifiers:(log_group_identifiers_ : scheduled_query_log_group_identifiers option)
    ?query_string:(query_string_ : query_string option)
    ?query_language:(query_language_ : query_language option)
    ?description:(description_ : scheduled_query_description option)
    ?name:(name_ : scheduled_query_name option)
    ?scheduled_query_arn:(scheduled_query_arn_ : arn option) () =
  ({
     last_updated_time = last_updated_time_;
     creation_time = creation_time_;
     execution_role_arn = execution_role_arn_;
     schedule_end_time = schedule_end_time_;
     schedule_start_time = schedule_start_time_;
     last_execution_status = last_execution_status_;
     last_triggered_time = last_triggered_time_;
     schedule_type = schedule_type_;
     state = state_;
     destination_configuration = destination_configuration_;
     end_time_offset = end_time_offset_;
     start_time_offset = start_time_offset_;
     timezone = timezone_;
     schedule_expression = schedule_expression_;
     log_group_identifiers = log_group_identifiers_;
     query_string = query_string_;
     query_language = query_language_;
     description = description_;
     name = name_;
     scheduled_query_arn = scheduled_query_arn_;
   }
    : update_scheduled_query_response)

let make_update_scheduled_query_request ?state:(state_ : scheduled_query_state option)
    ?schedule_end_time:(schedule_end_time_ : timestamp option)
    ?schedule_start_time:(schedule_start_time_ : timestamp option)
    ?destination_configuration:(destination_configuration_ : destination_configuration option)
    ?end_time_offset:(end_time_offset_ : end_time_offset option)
    ?start_time_offset:(start_time_offset_ : start_time_offset option)
    ?timezone:(timezone_ : schedule_timezone option)
    ?log_group_identifiers:(log_group_identifiers_ : scheduled_query_log_group_identifiers option)
    ?description:(description_ : scheduled_query_description option)
    ~execution_role_arn:(execution_role_arn_ : role_arn)
    ~schedule_expression:(schedule_expression_ : schedule_expression)
    ~query_string:(query_string_ : query_string) ~query_language:(query_language_ : query_language)
    ~identifier:(identifier_ : scheduled_query_identifier) () =
  ({
     state = state_;
     execution_role_arn = execution_role_arn_;
     schedule_end_time = schedule_end_time_;
     schedule_start_time = schedule_start_time_;
     destination_configuration = destination_configuration_;
     end_time_offset = end_time_offset_;
     start_time_offset = start_time_offset_;
     timezone = timezone_;
     schedule_expression = schedule_expression_;
     log_group_identifiers = log_group_identifiers_;
     query_string = query_string_;
     query_language = query_language_;
     description = description_;
     identifier = identifier_;
   }
    : update_scheduled_query_request)

let make_update_lookup_table_response ?last_updated_time:(last_updated_time_ : timestamp option)
    ?lookup_table_arn:(lookup_table_arn_ : arn option) () =
  ({ last_updated_time = last_updated_time_; lookup_table_arn = lookup_table_arn_ }
    : update_lookup_table_response)

let make_update_lookup_table_request ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?description:(description_ : lookup_table_description option)
    ~table_body:(table_body_ : table_body) ~lookup_table_arn:(lookup_table_arn_ : arn) () =
  ({
     kms_key_id = kms_key_id_;
     table_body = table_body_;
     description = description_;
     lookup_table_arn = lookup_table_arn_;
   }
    : update_lookup_table_request)

let make_update_log_anomaly_detector_request
    ?anomaly_visibility_time:(anomaly_visibility_time_ : anomaly_visibility_time option)
    ?filter_pattern:(filter_pattern_ : filter_pattern option)
    ?evaluation_frequency:(evaluation_frequency_ : evaluation_frequency option)
    ~enabled:(enabled_ : boolean_)
    ~anomaly_detector_arn:(anomaly_detector_arn_ : anomaly_detector_arn) () =
  ({
     enabled = enabled_;
     anomaly_visibility_time = anomaly_visibility_time_;
     filter_pattern = filter_pattern_;
     evaluation_frequency = evaluation_frequency_;
     anomaly_detector_arn = anomaly_detector_arn_;
   }
    : update_log_anomaly_detector_request)

let make_update_delivery_configuration_response () = (() : unit)

let make_s3_delivery_configuration
    ?enable_hive_compatible_path:(enable_hive_compatible_path_ : boolean_ option)
    ?suffix_path:(suffix_path_ : delivery_suffix_path option) () =
  ({ enable_hive_compatible_path = enable_hive_compatible_path_; suffix_path = suffix_path_ }
    : s3_delivery_configuration)

let make_update_delivery_configuration_request
    ?s3_delivery_configuration:(s3_delivery_configuration_ : s3_delivery_configuration option)
    ?field_delimiter:(field_delimiter_ : field_delimiter option)
    ?record_fields:(record_fields_ : record_fields option) ~id:(id_ : delivery_id) () =
  ({
     s3_delivery_configuration = s3_delivery_configuration_;
     field_delimiter = field_delimiter_;
     record_fields = record_fields_;
     id = id_;
   }
    : update_delivery_configuration_request)

let make_suppression_period ?suppression_unit:(suppression_unit_ : suppression_unit option)
    ?value:(value_ : integer option) () =
  ({ suppression_unit = suppression_unit_; value = value_ } : suppression_period)

let make_update_anomaly_request ?baseline:(baseline_ : baseline option)
    ?suppression_period:(suppression_period_ : suppression_period option)
    ?suppression_type:(suppression_type_ : suppression_type option)
    ?pattern_id:(pattern_id_ : pattern_id option) ?anomaly_id:(anomaly_id_ : anomaly_id option)
    ~anomaly_detector_arn:(anomaly_detector_arn_ : anomaly_detector_arn) () =
  ({
     baseline = baseline_;
     suppression_period = suppression_period_;
     suppression_type = suppression_type_;
     anomaly_detector_arn = anomaly_detector_arn_;
     pattern_id = pattern_id_;
     anomaly_id = anomaly_id_;
   }
    : update_anomaly_request)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_untag_log_group_request ~tags:(tags_ : tag_list)
    ~log_group_name:(log_group_name_ : log_group_name) () =
  ({ tags = tags_; log_group_name = log_group_name_ } : untag_log_group_request)

let make_type_converter_entry ~type_:(type__ : type_) ~key:(key_ : key) () =
  ({ type_ = type__; key = key_ } : type_converter_entry)

let make_type_converter ~entries:(entries_ : type_converter_entries) () =
  ({ entries = entries_ } : type_converter)

let make_trim_string ~with_keys:(with_keys_ : trim_string_with_keys) () =
  ({ with_keys = with_keys_ } : trim_string)

let make_scheduled_query_destination ?error_message:(error_message_ : string_ option)
    ?processed_identifier:(processed_identifier_ : string_ option)
    ?status:(status_ : action_status option)
    ?destination_identifier:(destination_identifier_ : string_ option)
    ?destination_type:(destination_type_ : scheduled_query_destination_type option) () =
  ({
     error_message = error_message_;
     processed_identifier = processed_identifier_;
     status = status_;
     destination_identifier = destination_identifier_;
     destination_type = destination_type_;
   }
    : scheduled_query_destination)

let make_trigger_history_record
    ?destinations:(destinations_ : scheduled_query_destination_list option)
    ?error_message:(error_message_ : string_ option)
    ?triggered_timestamp:(triggered_timestamp_ : timestamp option)
    ?execution_status:(execution_status_ : execution_status option)
    ?query_id:(query_id_ : query_id option) () =
  ({
     destinations = destinations_;
     error_message = error_message_;
     triggered_timestamp = triggered_timestamp_;
     execution_status = execution_status_;
     query_id = query_id_;
   }
    : trigger_history_record)

let make_transformed_log_record
    ?transformed_event_message:(transformed_event_message_ : transformed_event_message option)
    ?event_message:(event_message_ : event_message option)
    ?event_number:(event_number_ : event_number option) () =
  ({
     transformed_event_message = transformed_event_message_;
     event_message = event_message_;
     event_number = event_number_;
   }
    : transformed_log_record)

let make_test_transformer_response ?transformed_logs:(transformed_logs_ : transformed_logs option)
    () =
  ({ transformed_logs = transformed_logs_ } : test_transformer_response)

let make_add_key_entry ?overwrite_if_exists:(overwrite_if_exists_ : overwrite_if_exists option)
    ~value:(value_ : add_key_value) ~key:(key_ : key) () =
  ({ overwrite_if_exists = overwrite_if_exists_; value = value_; key = key_ } : add_key_entry)

let make_add_keys ~entries:(entries_ : add_key_entries) () = ({ entries = entries_ } : add_keys)

let make_copy_value_entry ?overwrite_if_exists:(overwrite_if_exists_ : overwrite_if_exists option)
    ~target:(target_ : target) ~source:(source_ : source) () =
  ({ overwrite_if_exists = overwrite_if_exists_; target = target_; source = source_ }
    : copy_value_entry)

let make_copy_value ~entries:(entries_ : copy_value_entries) () =
  ({ entries = entries_ } : copy_value)

let make_cs_v ?destination:(destination_ : destination_field option)
    ?source:(source_ : source option) ?columns:(columns_ : columns option)
    ?delimiter:(delimiter_ : delimiter option)
    ?quote_character:(quote_character_ : quote_character option) () =
  ({
     destination = destination_;
     source = source_;
     columns = columns_;
     delimiter = delimiter_;
     quote_character = quote_character_;
   }
    : cs_v)

let make_date_time_converter ?locale:(locale_ : locale option)
    ?target_timezone:(target_timezone_ : target_timezone option)
    ?source_timezone:(source_timezone_ : source_timezone option)
    ?target_format:(target_format_ : target_format option)
    ~match_patterns:(match_patterns_ : match_patterns) ~target:(target_ : target)
    ~source:(source_ : source) () =
  ({
     locale = locale_;
     target_timezone = target_timezone_;
     source_timezone = source_timezone_;
     match_patterns = match_patterns_;
     target_format = target_format_;
     target = target_;
     source = source_;
   }
    : date_time_converter)

let make_delete_keys ~with_keys:(with_keys_ : delete_with_keys) () =
  ({ with_keys = with_keys_ } : delete_keys)

let make_grok ?source:(source_ : source option) ~match_:(match__ : grok_match) () =
  ({ match_ = match__; source = source_ } : grok)

let make_list_to_map ?flattened_element:(flattened_element_ : flattened_element option)
    ?flatten:(flatten_ : flatten option) ?target:(target_ : target option)
    ?value_key:(value_key_ : value_key option) ~key:(key_ : key) ~source:(source_ : source) () =
  ({
     flattened_element = flattened_element_;
     flatten = flatten_;
     target = target_;
     value_key = value_key_;
     key = key_;
     source = source_;
   }
    : list_to_map)

let make_lower_case_string ~with_keys:(with_keys_ : lower_case_string_with_keys) () =
  ({ with_keys = with_keys_ } : lower_case_string)

let make_move_key_entry ?overwrite_if_exists:(overwrite_if_exists_ : overwrite_if_exists option)
    ~target:(target_ : target) ~source:(source_ : source) () =
  ({ overwrite_if_exists = overwrite_if_exists_; target = target_; source = source_ }
    : move_key_entry)

let make_move_keys ~entries:(entries_ : move_key_entries) () = ({ entries = entries_ } : move_keys)

let make_parse_cloudfront ?source:(source_ : source option) () =
  ({ source = source_ } : parse_cloudfront)

let make_parse_jso_n ?destination:(destination_ : destination_field option)
    ?source:(source_ : source option) () =
  ({ destination = destination_; source = source_ } : parse_jso_n)

let make_parse_key_value ?overwrite_if_exists:(overwrite_if_exists_ : overwrite_if_exists option)
    ?non_match_value:(non_match_value_ : non_match_value option)
    ?key_prefix:(key_prefix_ : key_prefix option)
    ?key_value_delimiter:(key_value_delimiter_ : key_value_delimiter option)
    ?field_delimiter:(field_delimiter_ : parser_field_delimiter option)
    ?destination:(destination_ : destination_field option) ?source:(source_ : source option) () =
  ({
     overwrite_if_exists = overwrite_if_exists_;
     non_match_value = non_match_value_;
     key_prefix = key_prefix_;
     key_value_delimiter = key_value_delimiter_;
     field_delimiter = field_delimiter_;
     destination = destination_;
     source = source_;
   }
    : parse_key_value)

let make_parse_route53 ?source:(source_ : source option) () = ({ source = source_ } : parse_route53)

let make_parse_to_ocs_f ?mapping_version:(mapping_version_ : mapping_version option)
    ?source:(source_ : source option) ~ocsf_version:(ocsf_version_ : ocsf_version)
    ~event_source:(event_source_ : event_source) () =
  ({
     mapping_version = mapping_version_;
     ocsf_version = ocsf_version_;
     event_source = event_source_;
     source = source_;
   }
    : parse_to_ocs_f)

let make_parse_postgres ?source:(source_ : source option) () =
  ({ source = source_ } : parse_postgres)

let make_parse_vp_c ?source:(source_ : source option) () = ({ source = source_ } : parse_vp_c)
let make_parse_wa_f ?source:(source_ : source option) () = ({ source = source_ } : parse_wa_f)

let make_rename_key_entry ?overwrite_if_exists:(overwrite_if_exists_ : overwrite_if_exists option)
    ~rename_to:(rename_to_ : rename_to) ~key:(key_ : key) () =
  ({ overwrite_if_exists = overwrite_if_exists_; rename_to = rename_to_; key = key_ }
    : rename_key_entry)

let make_rename_keys ~entries:(entries_ : rename_key_entries) () =
  ({ entries = entries_ } : rename_keys)

let make_split_string_entry ~delimiter:(delimiter_ : split_string_delimiter)
    ~source:(source_ : source) () =
  ({ delimiter = delimiter_; source = source_ } : split_string_entry)

let make_split_string ~entries:(entries_ : split_string_entries) () =
  ({ entries = entries_ } : split_string)

let make_substitute_string_entry ~to_:(to__ : to_key) ~from_:(from__ : from_key)
    ~source:(source_ : source) () =
  ({ to_ = to__; from_ = from__; source = source_ } : substitute_string_entry)

let make_substitute_string ~entries:(entries_ : substitute_string_entries) () =
  ({ entries = entries_ } : substitute_string)

let make_processor ?upper_case_string:(upper_case_string_ : upper_case_string option)
    ?type_converter:(type_converter_ : type_converter option)
    ?trim_string:(trim_string_ : trim_string option)
    ?substitute_string:(substitute_string_ : substitute_string option)
    ?split_string:(split_string_ : split_string option)
    ?rename_keys:(rename_keys_ : rename_keys option) ?parse_wa_f:(parse_wa_f_ : parse_wa_f option)
    ?parse_vp_c:(parse_vp_c_ : parse_vp_c option)
    ?parse_postgres:(parse_postgres_ : parse_postgres option)
    ?parse_to_ocs_f:(parse_to_ocs_f_ : parse_to_ocs_f option)
    ?parse_route53:(parse_route53_ : parse_route53 option)
    ?parse_key_value:(parse_key_value_ : parse_key_value option)
    ?parse_jso_n:(parse_jso_n_ : parse_jso_n option)
    ?parse_cloudfront:(parse_cloudfront_ : parse_cloudfront option)
    ?move_keys:(move_keys_ : move_keys option)
    ?lower_case_string:(lower_case_string_ : lower_case_string option)
    ?list_to_map:(list_to_map_ : list_to_map option) ?grok:(grok_ : grok option)
    ?delete_keys:(delete_keys_ : delete_keys option)
    ?date_time_converter:(date_time_converter_ : date_time_converter option)
    ?csv:(csv_ : cs_v option) ?copy_value:(copy_value_ : copy_value option)
    ?add_keys:(add_keys_ : add_keys option) () =
  ({
     upper_case_string = upper_case_string_;
     type_converter = type_converter_;
     trim_string = trim_string_;
     substitute_string = substitute_string_;
     split_string = split_string_;
     rename_keys = rename_keys_;
     parse_wa_f = parse_wa_f_;
     parse_vp_c = parse_vp_c_;
     parse_postgres = parse_postgres_;
     parse_to_ocs_f = parse_to_ocs_f_;
     parse_route53 = parse_route53_;
     parse_key_value = parse_key_value_;
     parse_jso_n = parse_jso_n_;
     parse_cloudfront = parse_cloudfront_;
     move_keys = move_keys_;
     lower_case_string = lower_case_string_;
     list_to_map = list_to_map_;
     grok = grok_;
     delete_keys = delete_keys_;
     date_time_converter = date_time_converter_;
     csv = csv_;
     copy_value = copy_value_;
     add_keys = add_keys_;
   }
    : processor)

let make_test_transformer_request ~log_event_messages:(log_event_messages_ : test_event_messages)
    ~transformer_config:(transformer_config_ : processors) () =
  ({ log_event_messages = log_event_messages_; transformer_config = transformer_config_ }
    : test_transformer_request)

let make_metric_filter_match_record ?extracted_values:(extracted_values_ : extracted_values option)
    ?event_message:(event_message_ : event_message option)
    ?event_number:(event_number_ : event_number option) () =
  ({
     extracted_values = extracted_values_;
     event_message = event_message_;
     event_number = event_number_;
   }
    : metric_filter_match_record)

let make_test_metric_filter_response ?matches:(matches_ : metric_filter_matches option) () =
  ({ matches = matches_ } : test_metric_filter_response)

let make_test_metric_filter_request ~log_event_messages:(log_event_messages_ : test_event_messages)
    ~filter_pattern:(filter_pattern_ : filter_pattern) () =
  ({ log_event_messages = log_event_messages_; filter_pattern = filter_pattern_ }
    : test_metric_filter_request)

let make_tag_resource_request ~tags:(tags_ : tags)
    ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_tag_log_group_request ~tags:(tags_ : tags)
    ~log_group_name:(log_group_name_ : log_group_name) () =
  ({ tags = tags_; log_group_name = log_group_name_ } : tag_log_group_request)

let make_tag_filter ?values:(values_ : tag_filter_values option) ~key:(key_ : tag_filter_key) () =
  ({ values = values_; key = key_ } : tag_filter)

let make_syslog_configuration ?created_at:(created_at_ : timestamp option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?source_type:(source_type_ : syslog_source_type option)
    ?log_group_arn:(log_group_arn_ : log_group_arn option) () =
  ({
     created_at = created_at_;
     vpc_endpoint_id = vpc_endpoint_id_;
     source_type = source_type_;
     log_group_arn = log_group_arn_;
   }
    : syslog_configuration)

let make_subscription_filter ?emit_system_fields:(emit_system_fields_ : emit_system_fields option)
    ?field_selection_criteria:(field_selection_criteria_ : field_selection_criteria option)
    ?creation_time:(creation_time_ : timestamp option)
    ?apply_on_transformed_logs:(apply_on_transformed_logs_ : apply_on_transformed_logs option)
    ?distribution:(distribution_ : distribution option) ?role_arn:(role_arn_ : role_arn option)
    ?destination_arn:(destination_arn_ : destination_arn option)
    ?filter_pattern:(filter_pattern_ : filter_pattern option)
    ?log_group_name:(log_group_name_ : log_group_name option)
    ?filter_name:(filter_name_ : filter_name option) () =
  ({
     emit_system_fields = emit_system_fields_;
     field_selection_criteria = field_selection_criteria_;
     creation_time = creation_time_;
     apply_on_transformed_logs = apply_on_transformed_logs_;
     distribution = distribution_;
     role_arn = role_arn_;
     destination_arn = destination_arn_;
     filter_pattern = filter_pattern_;
     log_group_name = log_group_name_;
     filter_name = filter_name_;
   }
    : subscription_filter)

let make_stop_query_response ?success:(success_ : success option) () =
  ({ success = success_ } : stop_query_response)

let make_stop_query_request ~query_id:(query_id_ : query_id) () =
  ({ query_id = query_id_ } : stop_query_request)

let make_start_query_response ?query_id:(query_id_ : query_id option) () =
  ({ query_id = query_id_ } : start_query_response)

let make_start_query_request ?limit:(limit_ : events_limit_start_query option)
    ?log_group_identifiers:(log_group_identifiers_ : log_group_identifiers option)
    ?log_group_names:(log_group_names_ : log_group_names option)
    ?log_group_name:(log_group_name_ : log_group_name option)
    ?query_language:(query_language_ : query_language option)
    ~query_string:(query_string_ : query_string) ~end_time:(end_time_ : timestamp)
    ~start_time:(start_time_ : timestamp) () =
  ({
     limit = limit_;
     query_string = query_string_;
     end_time = end_time_;
     start_time = start_time_;
     log_group_identifiers = log_group_identifiers_;
     log_group_names = log_group_names_;
     log_group_name = log_group_name_;
     query_language = query_language_;
   }
    : start_query_request)

let make_query_compile_error_location ?end_char_offset:(end_char_offset_ : query_char_offset option)
    ?start_char_offset:(start_char_offset_ : query_char_offset option) () =
  ({ end_char_offset = end_char_offset_; start_char_offset = start_char_offset_ }
    : query_compile_error_location)

let make_query_compile_error ?message:(message_ : message option)
    ?location:(location_ : query_compile_error_location option) () =
  ({ message = message_; location = location_ } : query_compile_error)

let make_live_tail_session_start
    ?log_event_filter_pattern:(log_event_filter_pattern_ : filter_pattern option)
    ?log_stream_name_prefixes:(log_stream_name_prefixes_ : input_log_stream_names option)
    ?log_stream_names:(log_stream_names_ : input_log_stream_names option)
    ?log_group_identifiers:(log_group_identifiers_ : start_live_tail_log_group_identifiers option)
    ?session_id:(session_id_ : session_id option) ?request_id:(request_id_ : request_id option) () =
  ({
     log_event_filter_pattern = log_event_filter_pattern_;
     log_stream_name_prefixes = log_stream_name_prefixes_;
     log_stream_names = log_stream_names_;
     log_group_identifiers = log_group_identifiers_;
     session_id = session_id_;
     request_id = request_id_;
   }
    : live_tail_session_start)

let make_live_tail_session_metadata ?sampled:(sampled_ : is_sampled option) () =
  ({ sampled = sampled_ } : live_tail_session_metadata)

let make_live_tail_session_log_event ?ingestion_time:(ingestion_time_ : timestamp option)
    ?timestamp:(timestamp_ : timestamp option) ?message:(message_ : event_message option)
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option)
    ?log_stream_name:(log_stream_name_ : log_stream_name option) () =
  ({
     ingestion_time = ingestion_time_;
     timestamp = timestamp_;
     message = message_;
     log_group_identifier = log_group_identifier_;
     log_stream_name = log_stream_name_;
   }
    : live_tail_session_log_event)

let make_live_tail_session_update
    ?session_results:(session_results_ : live_tail_session_results option)
    ?session_metadata:(session_metadata_ : live_tail_session_metadata option) () =
  ({ session_results = session_results_; session_metadata = session_metadata_ }
    : live_tail_session_update)

let make_start_live_tail_response
    ?response_stream:(response_stream_ : start_live_tail_response_stream option) () =
  ({ response_stream = response_stream_ } : start_live_tail_response)

let make_start_live_tail_request
    ?log_event_filter_pattern:(log_event_filter_pattern_ : filter_pattern option)
    ?log_stream_name_prefixes:(log_stream_name_prefixes_ : input_log_stream_names option)
    ?log_stream_names:(log_stream_names_ : input_log_stream_names option)
    ~log_group_identifiers:(log_group_identifiers_ : start_live_tail_log_group_identifiers) () =
  ({
     log_event_filter_pattern = log_event_filter_pattern_;
     log_stream_name_prefixes = log_stream_name_prefixes_;
     log_stream_names = log_stream_names_;
     log_group_identifiers = log_group_identifiers_;
   }
    : start_live_tail_request)

let make_searched_log_stream
    ?searched_completely:(searched_completely_ : log_stream_searched_completely option)
    ?log_stream_name:(log_stream_name_ : log_stream_name option) () =
  ({ searched_completely = searched_completely_; log_stream_name = log_stream_name_ }
    : searched_log_stream)

let make_scheduled_query_summary ?last_updated_time:(last_updated_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?destination_configuration:(destination_configuration_ : destination_configuration option)
    ?timezone:(timezone_ : schedule_timezone option)
    ?schedule_expression:(schedule_expression_ : schedule_expression option)
    ?last_execution_status:(last_execution_status_ : execution_status option)
    ?last_triggered_time:(last_triggered_time_ : timestamp option)
    ?schedule_type:(schedule_type_ : schedule_type option)
    ?state:(state_ : scheduled_query_state option) ?name:(name_ : scheduled_query_name option)
    ?scheduled_query_arn:(scheduled_query_arn_ : arn option) () =
  ({
     last_updated_time = last_updated_time_;
     creation_time = creation_time_;
     destination_configuration = destination_configuration_;
     timezone = timezone_;
     schedule_expression = schedule_expression_;
     last_execution_status = last_execution_status_;
     last_triggered_time = last_triggered_time_;
     schedule_type = schedule_type_;
     state = state_;
     name = name_;
     scheduled_query_arn = scheduled_query_arn_;
   }
    : scheduled_query_summary)

let make_s3_tables_integration
    ?datasource_type:(datasource_type_ : s3_tables_datasource_type option)
    ?datasource_name:(datasource_name_ : s3_tables_datasource_name option) () =
  ({ datasource_type = datasource_type_; datasource_name = datasource_name_ }
    : s3_tables_integration)

let make_data_source ?type_:(type__ : data_source_type option) ~name:(name_ : data_source_name) () =
  ({ type_ = type__; name = name_ } : data_source)

let make_s3_table_integration_source
    ?parent_source_identifier:
      (parent_source_identifier_ : s3_table_integration_source_identifier option)
    ?created_time_stamp:(created_time_stamp_ : timestamp option)
    ?status_reason:(status_reason_ : s3_table_integration_source_status_reason option)
    ?status:(status_ : s3_table_integration_source_status option)
    ?data_source:(data_source_ : data_source option)
    ?identifier:(identifier_ : s3_table_integration_source_identifier option) () =
  ({
     parent_source_identifier = parent_source_identifier_;
     created_time_stamp = created_time_stamp_;
     status_reason = status_reason_;
     status = status_;
     data_source = data_source_;
     identifier = identifier_;
   }
    : s3_table_integration_source)

let make_result_field ?value:(value_ : value option) ?field:(field_ : field option) () =
  ({ value = value_; field = field_ } : result_field)

let make_resource_policy ?revision_id:(revision_id_ : expected_revision_id option)
    ?resource_arn:(resource_arn_ : arn option) ?policy_scope:(policy_scope_ : policy_scope option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?policy_document:(policy_document_ : policy_document option)
    ?policy_name:(policy_name_ : policy_name option) () =
  ({
     revision_id = revision_id_;
     resource_arn = resource_arn_;
     policy_scope = policy_scope_;
     last_updated_time = last_updated_time_;
     policy_document = policy_document_;
     policy_name = policy_name_;
   }
    : resource_policy)

let make_open_search_resource_config ?application_arn:(application_arn_ : arn option)
    ?kms_key_arn:(kms_key_arn_ : arn option)
    ~retention_days:(retention_days_ : collection_retention_days)
    ~dashboard_viewer_principals:(dashboard_viewer_principals_ : dashboard_viewer_principals)
    ~data_source_role_arn:(data_source_role_arn_ : arn) () =
  ({
     retention_days = retention_days_;
     application_arn = application_arn_;
     dashboard_viewer_principals = dashboard_viewer_principals_;
     data_source_role_arn = data_source_role_arn_;
     kms_key_arn = kms_key_arn_;
   }
    : open_search_resource_config)

let make_rejected_log_events_info
    ?expired_log_event_end_index:(expired_log_event_end_index_ : log_event_index option)
    ?too_old_log_event_end_index:(too_old_log_event_end_index_ : log_event_index option)
    ?too_new_log_event_start_index:(too_new_log_event_start_index_ : log_event_index option) () =
  ({
     expired_log_event_end_index = expired_log_event_end_index_;
     too_old_log_event_end_index = too_old_log_event_end_index_;
     too_new_log_event_start_index = too_new_log_event_start_index_;
   }
    : rejected_log_events_info)

let make_rejected_entity_info ~error_type:(error_type_ : entity_rejection_error_type) () =
  ({ error_type = error_type_ } : rejected_entity_info)

let make_record_field ?mandatory:(mandatory_ : boolean_ option) ?name:(name_ : field_header option)
    () =
  ({ mandatory = mandatory_; name = name_ } : record_field)

let make_query_statistics ?log_groups_scanned:(log_groups_scanned_ : stats_value option)
    ?estimated_bytes_skipped:(estimated_bytes_skipped_ : stats_value option)
    ?bytes_scanned:(bytes_scanned_ : stats_value option)
    ?estimated_records_skipped:(estimated_records_skipped_ : stats_value option)
    ?records_scanned:(records_scanned_ : stats_value option)
    ?records_matched:(records_matched_ : stats_value option) () =
  ({
     log_groups_scanned = log_groups_scanned_;
     estimated_bytes_skipped = estimated_bytes_skipped_;
     bytes_scanned = bytes_scanned_;
     estimated_records_skipped = estimated_records_skipped_;
     records_scanned = records_scanned_;
     records_matched = records_matched_;
   }
    : query_statistics)

let make_query_parameter ?description:(description_ : query_parameter_description option)
    ?default_value:(default_value_ : query_parameter_default_value option)
    ~name:(name_ : query_parameter_name) () =
  ({ description = description_; default_value = default_value_; name = name_ } : query_parameter)

let make_query_info ?user_identity:(user_identity_ : user_identity option)
    ?bytes_scanned:(bytes_scanned_ : bytes_scanned_value option)
    ?query_duration:(query_duration_ : query_duration option)
    ?log_group_name:(log_group_name_ : log_group_name option)
    ?create_time:(create_time_ : timestamp option) ?status:(status_ : query_status option)
    ?query_string:(query_string_ : query_string option) ?query_id:(query_id_ : query_id option)
    ?query_language:(query_language_ : query_language option) () =
  ({
     user_identity = user_identity_;
     bytes_scanned = bytes_scanned_;
     query_duration = query_duration_;
     log_group_name = log_group_name_;
     create_time = create_time_;
     status = status_;
     query_string = query_string_;
     query_id = query_id_;
     query_language = query_language_;
   }
    : query_info)

let make_query_definition ?parameters:(parameters_ : query_parameter_list option)
    ?log_group_names:(log_group_names_ : log_group_names option)
    ?last_modified:(last_modified_ : timestamp option)
    ?query_string:(query_string_ : query_definition_string option)
    ?name:(name_ : query_definition_name option)
    ?query_definition_id:(query_definition_id_ : query_id option)
    ?query_language:(query_language_ : query_language option) () =
  ({
     parameters = parameters_;
     log_group_names = log_group_names_;
     last_modified = last_modified_;
     query_string = query_string_;
     name = name_;
     query_definition_id = query_definition_id_;
     query_language = query_language_;
   }
    : query_definition)

let make_put_transformer_request ~transformer_config:(transformer_config_ : processors)
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier) () =
  ({ transformer_config = transformer_config_; log_group_identifier = log_group_identifier_ }
    : put_transformer_request)

let make_put_syslog_configuration_request
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier) () =
  ({ vpc_endpoint_id = vpc_endpoint_id_; log_group_identifier = log_group_identifier_ }
    : put_syslog_configuration_request)

let make_put_subscription_filter_request
    ?emit_system_fields:(emit_system_fields_ : emit_system_fields option)
    ?field_selection_criteria:(field_selection_criteria_ : field_selection_criteria option)
    ?apply_on_transformed_logs:(apply_on_transformed_logs_ : apply_on_transformed_logs option)
    ?distribution:(distribution_ : distribution option) ?role_arn:(role_arn_ : role_arn option)
    ~destination_arn:(destination_arn_ : destination_arn)
    ~filter_pattern:(filter_pattern_ : filter_pattern) ~filter_name:(filter_name_ : filter_name)
    ~log_group_name:(log_group_name_ : log_group_name) () =
  ({
     emit_system_fields = emit_system_fields_;
     field_selection_criteria = field_selection_criteria_;
     apply_on_transformed_logs = apply_on_transformed_logs_;
     distribution = distribution_;
     role_arn = role_arn_;
     destination_arn = destination_arn_;
     filter_pattern = filter_pattern_;
     filter_name = filter_name_;
     log_group_name = log_group_name_;
   }
    : put_subscription_filter_request)

let make_put_retention_policy_request ~retention_in_days:(retention_in_days_ : days)
    ~log_group_name:(log_group_name_ : log_group_name) () =
  ({ retention_in_days = retention_in_days_; log_group_name = log_group_name_ }
    : put_retention_policy_request)

let make_put_resource_policy_response ?revision_id:(revision_id_ : expected_revision_id option)
    ?resource_policy:(resource_policy_ : resource_policy option) () =
  ({ revision_id = revision_id_; resource_policy = resource_policy_ }
    : put_resource_policy_response)

let make_put_resource_policy_request
    ?expected_revision_id:(expected_revision_id_ : expected_revision_id option)
    ?resource_arn:(resource_arn_ : arn option)
    ?policy_document:(policy_document_ : policy_document option)
    ?policy_name:(policy_name_ : policy_name option) () =
  ({
     expected_revision_id = expected_revision_id_;
     resource_arn = resource_arn_;
     policy_document = policy_document_;
     policy_name = policy_name_;
   }
    : put_resource_policy_request)

let make_put_query_definition_response ?query_definition_id:(query_definition_id_ : query_id option)
    () =
  ({ query_definition_id = query_definition_id_ } : put_query_definition_response)

let make_put_query_definition_request ?parameters:(parameters_ : query_parameter_list option)
    ?client_token:(client_token_ : client_token option)
    ?log_group_names:(log_group_names_ : log_group_names option)
    ?query_definition_id:(query_definition_id_ : query_id option)
    ?query_language:(query_language_ : query_language option)
    ~query_string:(query_string_ : query_definition_string) ~name:(name_ : query_definition_name) ()
    =
  ({
     parameters = parameters_;
     client_token = client_token_;
     query_string = query_string_;
     log_group_names = log_group_names_;
     query_definition_id = query_definition_id_;
     name = name_;
     query_language = query_language_;
   }
    : put_query_definition_request)

let make_metric_transformation ?unit_:(unit__ : standard_unit option)
    ?dimensions:(dimensions_ : dimensions option)
    ?default_value:(default_value_ : default_value option)
    ~metric_value:(metric_value_ : metric_value)
    ~metric_namespace:(metric_namespace_ : metric_namespace)
    ~metric_name:(metric_name_ : metric_name) () =
  ({
     unit_ = unit__;
     dimensions = dimensions_;
     default_value = default_value_;
     metric_value = metric_value_;
     metric_namespace = metric_namespace_;
     metric_name = metric_name_;
   }
    : metric_transformation)

let make_put_metric_filter_request
    ?emit_system_field_dimensions:(emit_system_field_dimensions_ : emit_system_fields option)
    ?field_selection_criteria:(field_selection_criteria_ : field_selection_criteria option)
    ?apply_on_transformed_logs:(apply_on_transformed_logs_ : apply_on_transformed_logs option)
    ~metric_transformations:(metric_transformations_ : metric_transformations)
    ~filter_pattern:(filter_pattern_ : filter_pattern) ~filter_name:(filter_name_ : filter_name)
    ~log_group_name:(log_group_name_ : log_group_name) () =
  ({
     emit_system_field_dimensions = emit_system_field_dimensions_;
     field_selection_criteria = field_selection_criteria_;
     apply_on_transformed_logs = apply_on_transformed_logs_;
     metric_transformations = metric_transformations_;
     filter_pattern = filter_pattern_;
     filter_name = filter_name_;
     log_group_name = log_group_name_;
   }
    : put_metric_filter_request)

let make_put_log_group_deletion_protection_request
    ~deletion_protection_enabled:(deletion_protection_enabled_ : deletion_protection_enabled)
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier) () =
  ({
     deletion_protection_enabled = deletion_protection_enabled_;
     log_group_identifier = log_group_identifier_;
   }
    : put_log_group_deletion_protection_request)

let make_put_log_events_response
    ?rejected_entity_info:(rejected_entity_info_ : rejected_entity_info option)
    ?rejected_log_events_info:(rejected_log_events_info_ : rejected_log_events_info option)
    ?next_sequence_token:(next_sequence_token_ : sequence_token option) () =
  ({
     rejected_entity_info = rejected_entity_info_;
     rejected_log_events_info = rejected_log_events_info_;
     next_sequence_token = next_sequence_token_;
   }
    : put_log_events_response)

let make_input_log_event ~message:(message_ : event_message) ~timestamp:(timestamp_ : timestamp) ()
    =
  ({ message = message_; timestamp = timestamp_ } : input_log_event)

let make_entity ?attributes:(attributes_ : entity_attributes option)
    ?key_attributes:(key_attributes_ : entity_key_attributes option) () =
  ({ attributes = attributes_; key_attributes = key_attributes_ } : entity)

let make_put_log_events_request ?entity:(entity_ : entity option)
    ?sequence_token:(sequence_token_ : sequence_token option)
    ~log_events:(log_events_ : input_log_events)
    ~log_stream_name:(log_stream_name_ : log_stream_name)
    ~log_group_name:(log_group_name_ : log_group_name) () =
  ({
     entity = entity_;
     sequence_token = sequence_token_;
     log_events = log_events_;
     log_stream_name = log_stream_name_;
     log_group_name = log_group_name_;
   }
    : put_log_events_request)

let make_put_integration_response
    ?integration_status:(integration_status_ : integration_status option)
    ?integration_name:(integration_name_ : integration_name option) () =
  ({ integration_status = integration_status_; integration_name = integration_name_ }
    : put_integration_response)

let make_put_integration_request ~integration_type:(integration_type_ : integration_type)
    ~resource_config:(resource_config_ : resource_config)
    ~integration_name:(integration_name_ : integration_name) () =
  ({
     integration_type = integration_type_;
     resource_config = resource_config_;
     integration_name = integration_name_;
   }
    : put_integration_request)

let make_index_policy ?source:(source_ : index_source option)
    ?policy_name:(policy_name_ : policy_name option)
    ?policy_document:(policy_document_ : policy_document option)
    ?last_update_time:(last_update_time_ : timestamp option)
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option) () =
  ({
     source = source_;
     policy_name = policy_name_;
     policy_document = policy_document_;
     last_update_time = last_update_time_;
     log_group_identifier = log_group_identifier_;
   }
    : index_policy)

let make_put_index_policy_response ?index_policy:(index_policy_ : index_policy option) () =
  ({ index_policy = index_policy_ } : put_index_policy_response)

let make_put_index_policy_request ~policy_document:(policy_document_ : policy_document)
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier) () =
  ({ policy_document = policy_document_; log_group_identifier = log_group_identifier_ }
    : put_index_policy_request)

let make_destination ?creation_time:(creation_time_ : timestamp option) ?arn:(arn_ : arn option)
    ?access_policy:(access_policy_ : access_policy option) ?role_arn:(role_arn_ : role_arn option)
    ?target_arn:(target_arn_ : target_arn option)
    ?destination_name:(destination_name_ : destination_name option) () =
  ({
     creation_time = creation_time_;
     arn = arn_;
     access_policy = access_policy_;
     role_arn = role_arn_;
     target_arn = target_arn_;
     destination_name = destination_name_;
   }
    : destination)

let make_put_destination_response ?destination:(destination_ : destination option) () =
  ({ destination = destination_ } : put_destination_response)

let make_put_destination_request ?tags:(tags_ : tags option) ~role_arn:(role_arn_ : role_arn)
    ~target_arn:(target_arn_ : target_arn) ~destination_name:(destination_name_ : destination_name)
    () =
  ({
     tags = tags_;
     role_arn = role_arn_;
     target_arn = target_arn_;
     destination_name = destination_name_;
   }
    : put_destination_request)

let make_put_destination_policy_request ?force_update:(force_update_ : force_update option)
    ~access_policy:(access_policy_ : access_policy)
    ~destination_name:(destination_name_ : destination_name) () =
  ({
     force_update = force_update_;
     access_policy = access_policy_;
     destination_name = destination_name_;
   }
    : put_destination_policy_request)

let make_delivery_source ?status_reason:(status_reason_ : delivery_source_status_reason option)
    ?status:(status_ : delivery_source_status option)
    ?delivery_source_configuration:
      (delivery_source_configuration_ : delivery_source_configuration option)
    ?tags:(tags_ : tags option) ?log_type:(log_type_ : log_type option)
    ?service:(service_ : service option) ?resource_arns:(resource_arns_ : resource_arns option)
    ?arn:(arn_ : arn option) ?name:(name_ : delivery_source_name option) () =
  ({
     status_reason = status_reason_;
     status = status_;
     delivery_source_configuration = delivery_source_configuration_;
     tags = tags_;
     log_type = log_type_;
     service = service_;
     resource_arns = resource_arns_;
     arn = arn_;
     name = name_;
   }
    : delivery_source)

let make_put_delivery_source_response ?delivery_source:(delivery_source_ : delivery_source option)
    () =
  ({ delivery_source = delivery_source_ } : put_delivery_source_response)

let make_put_delivery_source_request
    ?delivery_source_configuration:
      (delivery_source_configuration_ : delivery_source_configuration option)
    ?tags:(tags_ : tags option) ~log_type:(log_type_ : log_type) ~resource_arn:(resource_arn_ : arn)
    ~name:(name_ : delivery_source_name) () =
  ({
     delivery_source_configuration = delivery_source_configuration_;
     tags = tags_;
     log_type = log_type_;
     resource_arn = resource_arn_;
     name = name_;
   }
    : put_delivery_source_request)

let make_delivery_destination_configuration
    ~destination_resource_arn:(destination_resource_arn_ : arn) () =
  ({ destination_resource_arn = destination_resource_arn_ } : delivery_destination_configuration)

let make_delivery_destination ?tags:(tags_ : tags option)
    ?delivery_destination_configuration:
      (delivery_destination_configuration_ : delivery_destination_configuration option)
    ?output_format:(output_format_ : output_format option)
    ?delivery_destination_type:(delivery_destination_type_ : delivery_destination_type option)
    ?arn:(arn_ : arn option) ?name:(name_ : delivery_destination_name option) () =
  ({
     tags = tags_;
     delivery_destination_configuration = delivery_destination_configuration_;
     output_format = output_format_;
     delivery_destination_type = delivery_destination_type_;
     arn = arn_;
     name = name_;
   }
    : delivery_destination)

let make_put_delivery_destination_response
    ?delivery_destination:(delivery_destination_ : delivery_destination option) () =
  ({ delivery_destination = delivery_destination_ } : put_delivery_destination_response)

let make_put_delivery_destination_request ?tags:(tags_ : tags option)
    ?delivery_destination_type:(delivery_destination_type_ : delivery_destination_type option)
    ?delivery_destination_configuration:
      (delivery_destination_configuration_ : delivery_destination_configuration option)
    ?output_format:(output_format_ : output_format option) ~name:(name_ : delivery_destination_name)
    () =
  ({
     tags = tags_;
     delivery_destination_type = delivery_destination_type_;
     delivery_destination_configuration = delivery_destination_configuration_;
     output_format = output_format_;
     name = name_;
   }
    : put_delivery_destination_request)

let make_policy
    ?delivery_destination_policy:(delivery_destination_policy_ : delivery_destination_policy option)
    () =
  ({ delivery_destination_policy = delivery_destination_policy_ } : policy)

let make_put_delivery_destination_policy_response ?policy:(policy_ : policy option) () =
  ({ policy = policy_ } : put_delivery_destination_policy_response)

let make_put_delivery_destination_policy_request
    ~delivery_destination_policy:(delivery_destination_policy_ : delivery_destination_policy)
    ~delivery_destination_name:(delivery_destination_name_ : delivery_destination_name) () =
  ({
     delivery_destination_policy = delivery_destination_policy_;
     delivery_destination_name = delivery_destination_name_;
   }
    : put_delivery_destination_policy_request)

let make_put_data_protection_policy_response
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?policy_document:(policy_document_ : data_protection_policy_document option)
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option) () =
  ({
     last_updated_time = last_updated_time_;
     policy_document = policy_document_;
     log_group_identifier = log_group_identifier_;
   }
    : put_data_protection_policy_response)

let make_put_data_protection_policy_request
    ~policy_document:(policy_document_ : data_protection_policy_document)
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier) () =
  ({ policy_document = policy_document_; log_group_identifier = log_group_identifier_ }
    : put_data_protection_policy_request)

let make_put_bearer_token_authentication_request
    ~bearer_token_authentication_enabled:
      (bearer_token_authentication_enabled_ : bearer_token_authentication_enabled)
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier) () =
  ({
     bearer_token_authentication_enabled = bearer_token_authentication_enabled_;
     log_group_identifier = log_group_identifier_;
   }
    : put_bearer_token_authentication_request)

let make_account_policy ?account_id:(account_id_ : account_id option)
    ?selection_criteria:(selection_criteria_ : selection_criteria option)
    ?scope:(scope_ : scope option) ?policy_type:(policy_type_ : policy_type option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?policy_document:(policy_document_ : account_policy_document option)
    ?policy_name:(policy_name_ : policy_name option) () =
  ({
     account_id = account_id_;
     selection_criteria = selection_criteria_;
     scope = scope_;
     policy_type = policy_type_;
     last_updated_time = last_updated_time_;
     policy_document = policy_document_;
     policy_name = policy_name_;
   }
    : account_policy)

let make_put_account_policy_response ?account_policy:(account_policy_ : account_policy option) () =
  ({ account_policy = account_policy_ } : put_account_policy_response)

let make_put_account_policy_request
    ?selection_criteria:(selection_criteria_ : selection_criteria option)
    ?scope:(scope_ : scope option) ~policy_type:(policy_type_ : policy_type)
    ~policy_document:(policy_document_ : account_policy_document)
    ~policy_name:(policy_name_ : policy_name) () =
  ({
     selection_criteria = selection_criteria_;
     scope = scope_;
     policy_type = policy_type_;
     policy_document = policy_document_;
     policy_name = policy_name_;
   }
    : put_account_policy_request)

let make_pattern_token ?inferred_token_name:(inferred_token_name_ : inferred_token_name option)
    ?enumerations:(enumerations_ : enumerations option)
    ?token_string:(token_string_ : token_string option) ?is_dynamic:(is_dynamic_ : boolean_ option)
    ?dynamic_token_position:(dynamic_token_position_ : dynamic_token_position option) () =
  ({
     inferred_token_name = inferred_token_name_;
     enumerations = enumerations_;
     token_string = token_string_;
     is_dynamic = is_dynamic_;
     dynamic_token_position = dynamic_token_position_;
   }
    : pattern_token)

let make_output_log_event ?ingestion_time:(ingestion_time_ : timestamp option)
    ?message:(message_ : event_message option) ?timestamp:(timestamp_ : timestamp option) () =
  ({ ingestion_time = ingestion_time_; message = message_; timestamp = timestamp_ }
    : output_log_event)

let make_open_search_resource_status
    ?status_message:(status_message_ : integration_status_message option)
    ?status:(status_ : open_search_resource_status_type option) () =
  ({ status_message = status_message_; status = status_ } : open_search_resource_status)

let make_open_search_workspace ?status:(status_ : open_search_resource_status option)
    ?workspace_id:(workspace_id_ : open_search_workspace_id option) () =
  ({ status = status_; workspace_id = workspace_id_ } : open_search_workspace)

let make_open_search_network_policy ?status:(status_ : open_search_resource_status option)
    ?policy_name:(policy_name_ : open_search_policy_name option) () =
  ({ status = status_; policy_name = policy_name_ } : open_search_network_policy)

let make_open_search_lifecycle_policy ?status:(status_ : open_search_resource_status option)
    ?policy_name:(policy_name_ : open_search_policy_name option) () =
  ({ status = status_; policy_name = policy_name_ } : open_search_lifecycle_policy)

let make_open_search_data_source ?status:(status_ : open_search_resource_status option)
    ?data_source_name:(data_source_name_ : open_search_data_source_name option) () =
  ({ status = status_; data_source_name = data_source_name_ } : open_search_data_source)

let make_open_search_application ?status:(status_ : open_search_resource_status option)
    ?application_id:(application_id_ : open_search_application_id option)
    ?application_arn:(application_arn_ : arn option)
    ?application_endpoint:(application_endpoint_ : open_search_application_endpoint option) () =
  ({
     status = status_;
     application_id = application_id_;
     application_arn = application_arn_;
     application_endpoint = application_endpoint_;
   }
    : open_search_application)

let make_open_search_collection ?status:(status_ : open_search_resource_status option)
    ?collection_arn:(collection_arn_ : arn option)
    ?collection_endpoint:(collection_endpoint_ : open_search_collection_endpoint option) () =
  ({
     status = status_;
     collection_arn = collection_arn_;
     collection_endpoint = collection_endpoint_;
   }
    : open_search_collection)

let make_open_search_encryption_policy ?status:(status_ : open_search_resource_status option)
    ?policy_name:(policy_name_ : open_search_policy_name option) () =
  ({ status = status_; policy_name = policy_name_ } : open_search_encryption_policy)

let make_open_search_data_access_policy ?status:(status_ : open_search_resource_status option)
    ?policy_name:(policy_name_ : open_search_policy_name option) () =
  ({ status = status_; policy_name = policy_name_ } : open_search_data_access_policy)

let make_open_search_integration_details
    ?lifecycle_policy:(lifecycle_policy_ : open_search_lifecycle_policy option)
    ?access_policy:(access_policy_ : open_search_data_access_policy option)
    ?network_policy:(network_policy_ : open_search_network_policy option)
    ?encryption_policy:(encryption_policy_ : open_search_encryption_policy option)
    ?workspace:(workspace_ : open_search_workspace option)
    ?collection:(collection_ : open_search_collection option)
    ?application:(application_ : open_search_application option)
    ?data_source:(data_source_ : open_search_data_source option) () =
  ({
     lifecycle_policy = lifecycle_policy_;
     access_policy = access_policy_;
     network_policy = network_policy_;
     encryption_policy = encryption_policy_;
     workspace = workspace_;
     collection = collection_;
     application = application_;
     data_source = data_source_;
   }
    : open_search_integration_details)

let make_metric_filter
    ?emit_system_field_dimensions:(emit_system_field_dimensions_ : emit_system_fields option)
    ?field_selection_criteria:(field_selection_criteria_ : field_selection_criteria option)
    ?apply_on_transformed_logs:(apply_on_transformed_logs_ : apply_on_transformed_logs option)
    ?log_group_name:(log_group_name_ : log_group_name option)
    ?creation_time:(creation_time_ : timestamp option)
    ?metric_transformations:(metric_transformations_ : metric_transformations option)
    ?filter_pattern:(filter_pattern_ : filter_pattern option)
    ?filter_name:(filter_name_ : filter_name option) () =
  ({
     emit_system_field_dimensions = emit_system_field_dimensions_;
     field_selection_criteria = field_selection_criteria_;
     apply_on_transformed_logs = apply_on_transformed_logs_;
     log_group_name = log_group_name_;
     creation_time = creation_time_;
     metric_transformations = metric_transformations_;
     filter_pattern = filter_pattern_;
     filter_name = filter_name_;
   }
    : metric_filter)

let make_lookup_table ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?size_bytes:(size_bytes_ : stored_bytes option)
    ?records_count:(records_count_ : records_count option)
    ?table_fields:(table_fields_ : table_fields option)
    ?description:(description_ : lookup_table_description option)
    ?lookup_table_name:(lookup_table_name_ : lookup_table_name option)
    ?lookup_table_arn:(lookup_table_arn_ : arn option) () =
  ({
     kms_key_id = kms_key_id_;
     last_updated_time = last_updated_time_;
     size_bytes = size_bytes_;
     records_count = records_count_;
     table_fields = table_fields_;
     description = description_;
     lookup_table_name = lookup_table_name_;
     lookup_table_arn = lookup_table_arn_;
   }
    : lookup_table)

let make_list_tags_log_group_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_log_group_response)

let make_list_tags_log_group_request ~log_group_name:(log_group_name_ : log_group_name) () =
  ({ log_group_name = log_group_name_ } : list_tags_log_group_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_syslog_configurations_response ?next_token:(next_token_ : next_token option)
    ?syslog_configurations:(syslog_configurations_ : syslog_configurations option) () =
  ({ next_token = next_token_; syslog_configurations = syslog_configurations_ }
    : list_syslog_configurations_response)

let make_list_syslog_configurations_request
    ?max_results:(max_results_ : list_syslog_configurations_max_results option)
    ?next_token:(next_token_ : next_token option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     vpc_endpoint_id = vpc_endpoint_id_;
     log_group_identifier = log_group_identifier_;
   }
    : list_syslog_configurations_request)

let make_list_sources_for_s3_table_integration_response
    ?next_token:(next_token_ : next_token option)
    ?sources:(sources_ : s3_table_integration_sources option) () =
  ({ next_token = next_token_; sources = sources_ }
    : list_sources_for_s3_table_integration_response)

let make_list_sources_for_s3_table_integration_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : list_sources_for_s3_table_integration_max_results option)
    ~integration_arn:(integration_arn_ : arn) () =
  ({ next_token = next_token_; max_results = max_results_; integration_arn = integration_arn_ }
    : list_sources_for_s3_table_integration_request)

let make_list_scheduled_queries_response
    ?scheduled_queries:(scheduled_queries_ : scheduled_query_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ scheduled_queries = scheduled_queries_; next_token = next_token_ }
    : list_scheduled_queries_response)

let make_list_scheduled_queries_request ?schedule_type:(schedule_type_ : schedule_type option)
    ?state:(state_ : scheduled_query_state option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : list_scheduled_queries_max_results option) () =
  ({
     schedule_type = schedule_type_;
     state = state_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_scheduled_queries_request)

let make_list_log_groups_for_query_response ?next_token:(next_token_ : next_token option)
    ?log_group_identifiers:(log_group_identifiers_ : log_group_identifiers option) () =
  ({ next_token = next_token_; log_group_identifiers = log_group_identifiers_ }
    : list_log_groups_for_query_response)

let make_list_log_groups_for_query_request
    ?max_results:(max_results_ : list_log_groups_for_query_max_results option)
    ?next_token:(next_token_ : next_token option) ~query_id:(query_id_ : query_id) () =
  ({ max_results = max_results_; next_token = next_token_; query_id = query_id_ }
    : list_log_groups_for_query_request)

let make_log_group_summary ?log_group_class:(log_group_class_ : log_group_class option)
    ?log_group_arn:(log_group_arn_ : arn option)
    ?log_group_name:(log_group_name_ : log_group_name option) () =
  ({
     log_group_class = log_group_class_;
     log_group_arn = log_group_arn_;
     log_group_name = log_group_name_;
   }
    : log_group_summary)

let make_list_log_groups_response ?next_token:(next_token_ : next_token option)
    ?log_groups:(log_groups_ : log_group_summaries option) () =
  ({ next_token = next_token_; log_groups = log_groups_ } : list_log_groups_response)

let make_data_source_filter ?type_:(type__ : data_source_type option)
    ~name:(name_ : data_source_name) () =
  ({ type_ = type__; name = name_ } : data_source_filter)

let make_list_log_groups_request ?log_group_tags:(log_group_tags_ : tag_filters option)
    ?field_index_names:(field_index_names_ : field_index_names option)
    ?data_sources:(data_sources_ : data_source_filters option) ?limit:(limit_ : list_limit option)
    ?next_token:(next_token_ : next_token option)
    ?account_identifiers:(account_identifiers_ : account_ids option)
    ?include_linked_accounts:(include_linked_accounts_ : include_linked_accounts option)
    ?log_group_class:(log_group_class_ : log_group_class option)
    ?log_group_name_pattern:(log_group_name_pattern_ : log_group_name_regex_pattern option) () =
  ({
     log_group_tags = log_group_tags_;
     field_index_names = field_index_names_;
     data_sources = data_sources_;
     limit = limit_;
     next_token = next_token_;
     account_identifiers = account_identifiers_;
     include_linked_accounts = include_linked_accounts_;
     log_group_class = log_group_class_;
     log_group_name_pattern = log_group_name_pattern_;
   }
    : list_log_groups_request)

let make_anomaly_detector
    ?anomaly_visibility_time:(anomaly_visibility_time_ : anomaly_visibility_time option)
    ?last_modified_time_stamp:(last_modified_time_stamp_ : epoch_millis option)
    ?creation_time_stamp:(creation_time_stamp_ : epoch_millis option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?anomaly_detector_status:(anomaly_detector_status_ : anomaly_detector_status option)
    ?filter_pattern:(filter_pattern_ : filter_pattern option)
    ?evaluation_frequency:(evaluation_frequency_ : evaluation_frequency option)
    ?log_group_arn_list:(log_group_arn_list_ : log_group_arn_list option)
    ?detector_name:(detector_name_ : detector_name option)
    ?anomaly_detector_arn:(anomaly_detector_arn_ : anomaly_detector_arn option) () =
  ({
     anomaly_visibility_time = anomaly_visibility_time_;
     last_modified_time_stamp = last_modified_time_stamp_;
     creation_time_stamp = creation_time_stamp_;
     kms_key_id = kms_key_id_;
     anomaly_detector_status = anomaly_detector_status_;
     filter_pattern = filter_pattern_;
     evaluation_frequency = evaluation_frequency_;
     log_group_arn_list = log_group_arn_list_;
     detector_name = detector_name_;
     anomaly_detector_arn = anomaly_detector_arn_;
   }
    : anomaly_detector)

let make_list_log_anomaly_detectors_response ?next_token:(next_token_ : next_token option)
    ?anomaly_detectors:(anomaly_detectors_ : anomaly_detectors option) () =
  ({ next_token = next_token_; anomaly_detectors = anomaly_detectors_ }
    : list_log_anomaly_detectors_response)

let make_list_log_anomaly_detectors_request ?next_token:(next_token_ : next_token option)
    ?limit:(limit_ : list_log_anomaly_detectors_limit option)
    ?filter_log_group_arn:(filter_log_group_arn_ : log_group_arn option) () =
  ({ next_token = next_token_; limit = limit_; filter_log_group_arn = filter_log_group_arn_ }
    : list_log_anomaly_detectors_request)

let make_integration_summary ?integration_status:(integration_status_ : integration_status option)
    ?integration_type:(integration_type_ : integration_type option)
    ?integration_name:(integration_name_ : integration_name option) () =
  ({
     integration_status = integration_status_;
     integration_type = integration_type_;
     integration_name = integration_name_;
   }
    : integration_summary)

let make_list_integrations_response
    ?integration_summaries:(integration_summaries_ : integration_summaries option) () =
  ({ integration_summaries = integration_summaries_ } : list_integrations_response)

let make_list_integrations_request
    ?integration_status:(integration_status_ : integration_status option)
    ?integration_type:(integration_type_ : integration_type option)
    ?integration_name_prefix:(integration_name_prefix_ : integration_name_prefix option) () =
  ({
     integration_status = integration_status_;
     integration_type = integration_type_;
     integration_name_prefix = integration_name_prefix_;
   }
    : list_integrations_request)

let make_log_event ?message:(message_ : event_message option)
    ?timestamp:(timestamp_ : timestamp option) () =
  ({ message = message_; timestamp = timestamp_ } : log_event)

let make_anomaly ?is_pattern_level_suppression:(is_pattern_level_suppression_ : boolean_ option)
    ?suppressed_until:(suppressed_until_ : epoch_millis option)
    ?suppressed_date:(suppressed_date_ : epoch_millis option)
    ?suppressed:(suppressed_ : boolean_ option) ?priority:(priority_ : priority option)
    ?pattern_regex:(pattern_regex_ : pattern_regex option)
    ~log_group_arn_list:(log_group_arn_list_ : log_group_arn_list)
    ~pattern_tokens:(pattern_tokens_ : pattern_tokens) ~log_samples:(log_samples_ : log_samples)
    ~histogram:(histogram_ : histogram) ~state:(state_ : state) ~active:(active_ : boolean_)
    ~description:(description_ : description) ~last_seen:(last_seen_ : epoch_millis)
    ~first_seen:(first_seen_ : epoch_millis) ~pattern_string:(pattern_string_ : pattern_string)
    ~anomaly_detector_arn:(anomaly_detector_arn_ : anomaly_detector_arn)
    ~pattern_id:(pattern_id_ : pattern_id) ~anomaly_id:(anomaly_id_ : anomaly_id) () =
  ({
     is_pattern_level_suppression = is_pattern_level_suppression_;
     suppressed_until = suppressed_until_;
     suppressed_date = suppressed_date_;
     suppressed = suppressed_;
     log_group_arn_list = log_group_arn_list_;
     pattern_tokens = pattern_tokens_;
     log_samples = log_samples_;
     histogram = histogram_;
     state = state_;
     active = active_;
     description = description_;
     last_seen = last_seen_;
     first_seen = first_seen_;
     priority = priority_;
     pattern_regex = pattern_regex_;
     pattern_string = pattern_string_;
     anomaly_detector_arn = anomaly_detector_arn_;
     pattern_id = pattern_id_;
     anomaly_id = anomaly_id_;
   }
    : anomaly)

let make_list_anomalies_response ?next_token:(next_token_ : next_token option)
    ?anomalies:(anomalies_ : anomalies option) () =
  ({ next_token = next_token_; anomalies = anomalies_ } : list_anomalies_response)

let make_list_anomalies_request ?next_token:(next_token_ : next_token option)
    ?limit:(limit_ : list_anomalies_limit option)
    ?suppression_state:(suppression_state_ : suppression_state option)
    ?anomaly_detector_arn:(anomaly_detector_arn_ : anomaly_detector_arn option) () =
  ({
     next_token = next_token_;
     limit = limit_;
     suppression_state = suppression_state_;
     anomaly_detector_arn = anomaly_detector_arn_;
   }
    : list_anomalies_request)

let make_grouping_identifier ?value:(value_ : grouping_identifier_value option)
    ?key:(key_ : grouping_identifier_key option) () =
  ({ value = value_; key = key_ } : grouping_identifier)

let make_aggregate_log_group_summary
    ?grouping_identifiers:(grouping_identifiers_ : grouping_identifiers option)
    ?log_group_count:(log_group_count_ : log_group_count option) () =
  ({ grouping_identifiers = grouping_identifiers_; log_group_count = log_group_count_ }
    : aggregate_log_group_summary)

let make_list_aggregate_log_group_summaries_response ?next_token:(next_token_ : next_token option)
    ?aggregate_log_group_summaries:
      (aggregate_log_group_summaries_ : aggregate_log_group_summaries option) () =
  ({ next_token = next_token_; aggregate_log_group_summaries = aggregate_log_group_summaries_ }
    : list_aggregate_log_group_summaries_response)

let make_list_aggregate_log_group_summaries_request
    ?limit:(limit_ : list_log_groups_request_limit option)
    ?next_token:(next_token_ : next_token option)
    ?data_sources:(data_sources_ : data_source_filters option)
    ?log_group_name_pattern:(log_group_name_pattern_ : log_group_name_regex_pattern option)
    ?log_group_class:(log_group_class_ : log_group_class option)
    ?include_linked_accounts:(include_linked_accounts_ : include_linked_accounts option)
    ?account_identifiers:(account_identifiers_ : account_ids option)
    ~group_by:(group_by_ : list_aggregate_log_group_summaries_group_by) () =
  ({
     limit = limit_;
     next_token = next_token_;
     group_by = group_by_;
     data_sources = data_sources_;
     log_group_name_pattern = log_group_name_pattern_;
     log_group_class = log_group_class_;
     include_linked_accounts = include_linked_accounts_;
     account_identifiers = account_identifiers_;
   }
    : list_aggregate_log_group_summaries_request)

let make_get_transformer_response ?transformer_config:(transformer_config_ : processors option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option) () =
  ({
     transformer_config = transformer_config_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     log_group_identifier = log_group_identifier_;
   }
    : get_transformer_response)

let make_get_transformer_request
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier) () =
  ({ log_group_identifier = log_group_identifier_ } : get_transformer_request)

let make_get_scheduled_query_history_response ?next_token:(next_token_ : next_token option)
    ?trigger_history:(trigger_history_ : trigger_history_record_list option)
    ?scheduled_query_arn:(scheduled_query_arn_ : arn option)
    ?name:(name_ : scheduled_query_name option) () =
  ({
     next_token = next_token_;
     trigger_history = trigger_history_;
     scheduled_query_arn = scheduled_query_arn_;
     name = name_;
   }
    : get_scheduled_query_history_response)

let make_get_scheduled_query_history_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : get_scheduled_query_history_max_results option)
    ?execution_statuses:(execution_statuses_ : execution_status_list option)
    ~end_time:(end_time_ : timestamp) ~start_time:(start_time_ : timestamp)
    ~identifier:(identifier_ : scheduled_query_identifier) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     execution_statuses = execution_statuses_;
     end_time = end_time_;
     start_time = start_time_;
     identifier = identifier_;
   }
    : get_scheduled_query_history_request)

let make_get_scheduled_query_response ?last_updated_time:(last_updated_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?execution_role_arn:(execution_role_arn_ : role_arn option)
    ?schedule_end_time:(schedule_end_time_ : timestamp option)
    ?schedule_start_time:(schedule_start_time_ : timestamp option)
    ?last_execution_status:(last_execution_status_ : execution_status option)
    ?last_triggered_time:(last_triggered_time_ : timestamp option)
    ?schedule_type:(schedule_type_ : schedule_type option)
    ?state:(state_ : scheduled_query_state option)
    ?destination_configuration:(destination_configuration_ : destination_configuration option)
    ?end_time_offset:(end_time_offset_ : end_time_offset option)
    ?start_time_offset:(start_time_offset_ : start_time_offset option)
    ?timezone:(timezone_ : schedule_timezone option)
    ?schedule_expression:(schedule_expression_ : schedule_expression option)
    ?log_group_identifiers:(log_group_identifiers_ : scheduled_query_log_group_identifiers option)
    ?query_string:(query_string_ : query_string option)
    ?query_language:(query_language_ : query_language option)
    ?description:(description_ : scheduled_query_description option)
    ?name:(name_ : scheduled_query_name option)
    ?scheduled_query_arn:(scheduled_query_arn_ : arn option) () =
  ({
     last_updated_time = last_updated_time_;
     creation_time = creation_time_;
     execution_role_arn = execution_role_arn_;
     schedule_end_time = schedule_end_time_;
     schedule_start_time = schedule_start_time_;
     last_execution_status = last_execution_status_;
     last_triggered_time = last_triggered_time_;
     schedule_type = schedule_type_;
     state = state_;
     destination_configuration = destination_configuration_;
     end_time_offset = end_time_offset_;
     start_time_offset = start_time_offset_;
     timezone = timezone_;
     schedule_expression = schedule_expression_;
     log_group_identifiers = log_group_identifiers_;
     query_string = query_string_;
     query_language = query_language_;
     description = description_;
     name = name_;
     scheduled_query_arn = scheduled_query_arn_;
   }
    : get_scheduled_query_response)

let make_get_scheduled_query_request ~identifier:(identifier_ : scheduled_query_identifier) () =
  ({ identifier = identifier_ } : get_scheduled_query_request)

let make_get_query_results_response ?next_token:(next_token_ : get_query_results_next_token option)
    ?encryption_key:(encryption_key_ : encryption_key option)
    ?status:(status_ : query_status option) ?statistics:(statistics_ : query_statistics option)
    ?results:(results_ : query_results option)
    ?query_language:(query_language_ : query_language option) () =
  ({
     next_token = next_token_;
     encryption_key = encryption_key_;
     status = status_;
     statistics = statistics_;
     results = results_;
     query_language = query_language_;
   }
    : get_query_results_response)

let make_get_query_results_request ?max_items:(max_items_ : get_query_results_max_items option)
    ?next_token:(next_token_ : get_query_results_next_token option) ~query_id:(query_id_ : query_id)
    () =
  ({ max_items = max_items_; next_token = next_token_; query_id = query_id_ }
    : get_query_results_request)

let make_get_lookup_table_response ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?size_bytes:(size_bytes_ : stored_bytes option) ?table_body:(table_body_ : table_body option)
    ?description:(description_ : lookup_table_description option)
    ?lookup_table_name:(lookup_table_name_ : lookup_table_name option)
    ?lookup_table_arn:(lookup_table_arn_ : arn option) () =
  ({
     kms_key_id = kms_key_id_;
     last_updated_time = last_updated_time_;
     size_bytes = size_bytes_;
     table_body = table_body_;
     description = description_;
     lookup_table_name = lookup_table_name_;
     lookup_table_arn = lookup_table_arn_;
   }
    : get_lookup_table_response)

let make_get_lookup_table_request ~lookup_table_arn:(lookup_table_arn_ : arn) () =
  ({ lookup_table_arn = lookup_table_arn_ } : get_lookup_table_request)

let make_get_log_record_response ?log_record:(log_record_ : log_record option) () =
  ({ log_record = log_record_ } : get_log_record_response)

let make_get_log_record_request ?unmask:(unmask_ : unmask option)
    ~log_record_pointer:(log_record_pointer_ : log_record_pointer) () =
  ({ unmask = unmask_; log_record_pointer = log_record_pointer_ } : get_log_record_request)

let make_fields_data ?data:(data_ : data option) () = ({ data = data_ } : fields_data)

let make_get_log_object_response
    ?field_stream:(field_stream_ : get_log_object_response_stream option) () =
  ({ field_stream = field_stream_ } : get_log_object_response)

let make_get_log_object_request ?unmask:(unmask_ : unmask option)
    ~log_object_pointer:(log_object_pointer_ : log_object_pointer) () =
  ({ log_object_pointer = log_object_pointer_; unmask = unmask_ } : get_log_object_request)

let make_log_group_field ?percent:(percent_ : percentage option) ?name:(name_ : field option) () =
  ({ percent = percent_; name = name_ } : log_group_field)

let make_get_log_group_fields_response
    ?log_group_fields:(log_group_fields_ : log_group_field_list option) () =
  ({ log_group_fields = log_group_fields_ } : get_log_group_fields_response)

let make_get_log_group_fields_request
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option)
    ?time:(time_ : timestamp option) ?log_group_name:(log_group_name_ : log_group_name option) () =
  ({ log_group_identifier = log_group_identifier_; time = time_; log_group_name = log_group_name_ }
    : get_log_group_fields_request)

let make_log_field_type ?fields:(fields_ : log_fields_list option)
    ?element:(element_ : log_field_type option) ?type_:(type__ : data_type option) () =
  ({ fields = fields_; element = element_; type_ = type__ } : log_field_type)

let make_log_fields_list_item ?log_field_type:(log_field_type_ : log_field_type option)
    ?log_field_name:(log_field_name_ : log_field_name option) () =
  ({ log_field_type = log_field_type_; log_field_name = log_field_name_ } : log_fields_list_item)

let make_get_log_fields_response ?log_fields:(log_fields_ : log_fields_list option) () =
  ({ log_fields = log_fields_ } : get_log_fields_response)

let make_get_log_fields_request ~data_source_type:(data_source_type_ : data_source_type)
    ~data_source_name:(data_source_name_ : data_source_name) () =
  ({ data_source_type = data_source_type_; data_source_name = data_source_name_ }
    : get_log_fields_request)

let make_get_log_events_response ?next_backward_token:(next_backward_token_ : next_token option)
    ?next_forward_token:(next_forward_token_ : next_token option)
    ?events:(events_ : output_log_events option) () =
  ({
     next_backward_token = next_backward_token_;
     next_forward_token = next_forward_token_;
     events = events_;
   }
    : get_log_events_response)

let make_get_log_events_request ?unmask:(unmask_ : unmask option)
    ?start_from_head:(start_from_head_ : start_from_head option)
    ?limit:(limit_ : events_limit option) ?next_token:(next_token_ : next_token option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option)
    ?log_group_name:(log_group_name_ : log_group_name option)
    ~log_stream_name:(log_stream_name_ : log_stream_name) () =
  ({
     unmask = unmask_;
     start_from_head = start_from_head_;
     limit = limit_;
     next_token = next_token_;
     end_time = end_time_;
     start_time = start_time_;
     log_stream_name = log_stream_name_;
     log_group_identifier = log_group_identifier_;
     log_group_name = log_group_name_;
   }
    : get_log_events_request)

let make_get_log_anomaly_detector_response
    ?anomaly_visibility_time:(anomaly_visibility_time_ : anomaly_visibility_time option)
    ?last_modified_time_stamp:(last_modified_time_stamp_ : epoch_millis option)
    ?creation_time_stamp:(creation_time_stamp_ : epoch_millis option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?anomaly_detector_status:(anomaly_detector_status_ : anomaly_detector_status option)
    ?filter_pattern:(filter_pattern_ : filter_pattern option)
    ?evaluation_frequency:(evaluation_frequency_ : evaluation_frequency option)
    ?log_group_arn_list:(log_group_arn_list_ : log_group_arn_list option)
    ?detector_name:(detector_name_ : detector_name option) () =
  ({
     anomaly_visibility_time = anomaly_visibility_time_;
     last_modified_time_stamp = last_modified_time_stamp_;
     creation_time_stamp = creation_time_stamp_;
     kms_key_id = kms_key_id_;
     anomaly_detector_status = anomaly_detector_status_;
     filter_pattern = filter_pattern_;
     evaluation_frequency = evaluation_frequency_;
     log_group_arn_list = log_group_arn_list_;
     detector_name = detector_name_;
   }
    : get_log_anomaly_detector_response)

let make_get_log_anomaly_detector_request
    ~anomaly_detector_arn:(anomaly_detector_arn_ : anomaly_detector_arn) () =
  ({ anomaly_detector_arn = anomaly_detector_arn_ } : get_log_anomaly_detector_request)

let make_get_integration_response
    ?integration_details:(integration_details_ : integration_details option)
    ?integration_status:(integration_status_ : integration_status option)
    ?integration_type:(integration_type_ : integration_type option)
    ?integration_name:(integration_name_ : integration_name option) () =
  ({
     integration_details = integration_details_;
     integration_status = integration_status_;
     integration_type = integration_type_;
     integration_name = integration_name_;
   }
    : get_integration_response)

let make_get_integration_request ~integration_name:(integration_name_ : integration_name) () =
  ({ integration_name = integration_name_ } : get_integration_request)

let make_get_delivery_source_response ?delivery_source:(delivery_source_ : delivery_source option)
    () =
  ({ delivery_source = delivery_source_ } : get_delivery_source_response)

let make_get_delivery_source_request ~name:(name_ : delivery_source_name) () =
  ({ name = name_ } : get_delivery_source_request)

let make_get_delivery_destination_policy_response ?policy:(policy_ : policy option) () =
  ({ policy = policy_ } : get_delivery_destination_policy_response)

let make_get_delivery_destination_policy_request
    ~delivery_destination_name:(delivery_destination_name_ : delivery_destination_name) () =
  ({ delivery_destination_name = delivery_destination_name_ }
    : get_delivery_destination_policy_request)

let make_get_delivery_destination_response
    ?delivery_destination:(delivery_destination_ : delivery_destination option) () =
  ({ delivery_destination = delivery_destination_ } : get_delivery_destination_response)

let make_get_delivery_destination_request ~name:(name_ : delivery_destination_name) () =
  ({ name = name_ } : get_delivery_destination_request)

let make_delivery ?tags:(tags_ : tags option)
    ?s3_delivery_configuration:(s3_delivery_configuration_ : s3_delivery_configuration option)
    ?field_delimiter:(field_delimiter_ : field_delimiter option)
    ?record_fields:(record_fields_ : record_fields option)
    ?delivery_destination_type:(delivery_destination_type_ : delivery_destination_type option)
    ?delivery_destination_arn:(delivery_destination_arn_ : arn option)
    ?delivery_source_name:(delivery_source_name_ : delivery_source_name option)
    ?arn:(arn_ : arn option) ?id:(id_ : delivery_id option) () =
  ({
     tags = tags_;
     s3_delivery_configuration = s3_delivery_configuration_;
     field_delimiter = field_delimiter_;
     record_fields = record_fields_;
     delivery_destination_type = delivery_destination_type_;
     delivery_destination_arn = delivery_destination_arn_;
     delivery_source_name = delivery_source_name_;
     arn = arn_;
     id = id_;
   }
    : delivery)

let make_get_delivery_response ?delivery:(delivery_ : delivery option) () =
  ({ delivery = delivery_ } : get_delivery_response)

let make_get_delivery_request ~id:(id_ : delivery_id) () = ({ id = id_ } : get_delivery_request)

let make_get_data_protection_policy_response
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?policy_document:(policy_document_ : data_protection_policy_document option)
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option) () =
  ({
     last_updated_time = last_updated_time_;
     policy_document = policy_document_;
     log_group_identifier = log_group_identifier_;
   }
    : get_data_protection_policy_response)

let make_get_data_protection_policy_request
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier) () =
  ({ log_group_identifier = log_group_identifier_ } : get_data_protection_policy_request)

let make_filtered_log_event ?event_id:(event_id_ : event_id option)
    ?ingestion_time:(ingestion_time_ : timestamp option) ?message:(message_ : event_message option)
    ?timestamp:(timestamp_ : timestamp option)
    ?log_stream_name:(log_stream_name_ : log_stream_name option) () =
  ({
     event_id = event_id_;
     ingestion_time = ingestion_time_;
     message = message_;
     timestamp = timestamp_;
     log_stream_name = log_stream_name_;
   }
    : filtered_log_event)

let make_filter_log_events_response ?next_token:(next_token_ : next_token option)
    ?searched_log_streams:(searched_log_streams_ : searched_log_streams option)
    ?events:(events_ : filtered_log_events option) () =
  ({ next_token = next_token_; searched_log_streams = searched_log_streams_; events = events_ }
    : filter_log_events_response)

let make_filter_log_events_request ?unmask:(unmask_ : unmask option)
    ?interleaved:(interleaved_ : interleaved option)
    ?start_from_head:(start_from_head_ : start_from_head option)
    ?limit:(limit_ : events_limit option) ?next_token:(next_token_ : next_token option)
    ?filter_pattern:(filter_pattern_ : filter_pattern option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?log_stream_name_prefix:(log_stream_name_prefix_ : log_stream_name option)
    ?log_stream_names:(log_stream_names_ : input_log_stream_names option)
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option)
    ?log_group_name:(log_group_name_ : log_group_name option) () =
  ({
     unmask = unmask_;
     interleaved = interleaved_;
     start_from_head = start_from_head_;
     limit = limit_;
     next_token = next_token_;
     filter_pattern = filter_pattern_;
     end_time = end_time_;
     start_time = start_time_;
     log_stream_name_prefix = log_stream_name_prefix_;
     log_stream_names = log_stream_names_;
     log_group_identifier = log_group_identifier_;
     log_group_name = log_group_name_;
   }
    : filter_log_events_request)

let make_disassociate_source_from_s3_table_integration_response
    ?identifier:(identifier_ : s3_table_integration_source_identifier option) () =
  ({ identifier = identifier_ } : disassociate_source_from_s3_table_integration_response)

let make_disassociate_source_from_s3_table_integration_request
    ~identifier:(identifier_ : s3_table_integration_source_identifier) () =
  ({ identifier = identifier_ } : disassociate_source_from_s3_table_integration_request)

let make_disassociate_kms_key_request
    ?resource_identifier:(resource_identifier_ : resource_identifier option)
    ?log_group_name:(log_group_name_ : log_group_name option) () =
  ({ resource_identifier = resource_identifier_; log_group_name = log_group_name_ }
    : disassociate_kms_key_request)

let make_describe_subscription_filters_response ?next_token:(next_token_ : next_token option)
    ?subscription_filters:(subscription_filters_ : subscription_filters option) () =
  ({ next_token = next_token_; subscription_filters = subscription_filters_ }
    : describe_subscription_filters_response)

let make_describe_subscription_filters_request ?limit:(limit_ : describe_limit option)
    ?next_token:(next_token_ : next_token option)
    ?filter_name_prefix:(filter_name_prefix_ : filter_name option)
    ~log_group_name:(log_group_name_ : log_group_name) () =
  ({
     limit = limit_;
     next_token = next_token_;
     filter_name_prefix = filter_name_prefix_;
     log_group_name = log_group_name_;
   }
    : describe_subscription_filters_request)

let make_describe_resource_policies_response ?next_token:(next_token_ : next_token option)
    ?resource_policies:(resource_policies_ : resource_policies option) () =
  ({ next_token = next_token_; resource_policies = resource_policies_ }
    : describe_resource_policies_response)

let make_describe_resource_policies_request ?policy_scope:(policy_scope_ : policy_scope option)
    ?resource_arn:(resource_arn_ : arn option) ?limit:(limit_ : describe_limit option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     policy_scope = policy_scope_;
     resource_arn = resource_arn_;
     limit = limit_;
     next_token = next_token_;
   }
    : describe_resource_policies_request)

let make_describe_query_definitions_response ?next_token:(next_token_ : next_token option)
    ?query_definitions:(query_definitions_ : query_definition_list option) () =
  ({ next_token = next_token_; query_definitions = query_definitions_ }
    : describe_query_definitions_response)

let make_describe_query_definitions_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : query_list_max_results option)
    ?query_definition_name_prefix:(query_definition_name_prefix_ : query_definition_name option)
    ?query_language:(query_language_ : query_language option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     query_definition_name_prefix = query_definition_name_prefix_;
     query_language = query_language_;
   }
    : describe_query_definitions_request)

let make_describe_queries_response ?next_token:(next_token_ : next_token option)
    ?queries:(queries_ : query_info_list option) () =
  ({ next_token = next_token_; queries = queries_ } : describe_queries_response)

let make_describe_queries_request ?query_language:(query_language_ : query_language option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : describe_queries_max_results option)
    ?status:(status_ : query_status option)
    ?log_group_name:(log_group_name_ : log_group_name option) () =
  ({
     query_language = query_language_;
     next_token = next_token_;
     max_results = max_results_;
     status = status_;
     log_group_name = log_group_name_;
   }
    : describe_queries_request)

let make_describe_metric_filters_response ?next_token:(next_token_ : next_token option)
    ?metric_filters:(metric_filters_ : metric_filters option) () =
  ({ next_token = next_token_; metric_filters = metric_filters_ }
    : describe_metric_filters_response)

let make_describe_metric_filters_request
    ?metric_namespace:(metric_namespace_ : metric_namespace option)
    ?metric_name:(metric_name_ : metric_name option) ?limit:(limit_ : describe_limit option)
    ?next_token:(next_token_ : next_token option)
    ?filter_name_prefix:(filter_name_prefix_ : filter_name option)
    ?log_group_name:(log_group_name_ : log_group_name option) () =
  ({
     metric_namespace = metric_namespace_;
     metric_name = metric_name_;
     limit = limit_;
     next_token = next_token_;
     filter_name_prefix = filter_name_prefix_;
     log_group_name = log_group_name_;
   }
    : describe_metric_filters_request)

let make_describe_lookup_tables_response ?next_token:(next_token_ : next_token option)
    ?lookup_tables:(lookup_tables_ : lookup_tables option) () =
  ({ next_token = next_token_; lookup_tables = lookup_tables_ } : describe_lookup_tables_response)

let make_describe_lookup_tables_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : describe_lookup_tables_max_results option)
    ?lookup_table_name_prefix:(lookup_table_name_prefix_ : lookup_table_name option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     lookup_table_name_prefix = lookup_table_name_prefix_;
   }
    : describe_lookup_tables_request)

let make_log_stream ?stored_bytes:(stored_bytes_ : stored_bytes option) ?arn:(arn_ : arn option)
    ?upload_sequence_token:(upload_sequence_token_ : sequence_token option)
    ?last_ingestion_time:(last_ingestion_time_ : timestamp option)
    ?last_event_timestamp:(last_event_timestamp_ : timestamp option)
    ?first_event_timestamp:(first_event_timestamp_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?log_stream_name:(log_stream_name_ : log_stream_name option) () =
  ({
     stored_bytes = stored_bytes_;
     arn = arn_;
     upload_sequence_token = upload_sequence_token_;
     last_ingestion_time = last_ingestion_time_;
     last_event_timestamp = last_event_timestamp_;
     first_event_timestamp = first_event_timestamp_;
     creation_time = creation_time_;
     log_stream_name = log_stream_name_;
   }
    : log_stream)

let make_describe_log_streams_response ?next_token:(next_token_ : next_token option)
    ?log_streams:(log_streams_ : log_streams option) () =
  ({ next_token = next_token_; log_streams = log_streams_ } : describe_log_streams_response)

let make_describe_log_streams_request ?limit:(limit_ : describe_limit option)
    ?next_token:(next_token_ : next_token option) ?descending:(descending_ : descending option)
    ?order_by:(order_by_ : order_by option)
    ?log_stream_name_prefix:(log_stream_name_prefix_ : log_stream_name option)
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option)
    ?log_group_name:(log_group_name_ : log_group_name option) () =
  ({
     limit = limit_;
     next_token = next_token_;
     descending = descending_;
     order_by = order_by_;
     log_stream_name_prefix = log_stream_name_prefix_;
     log_group_identifier = log_group_identifier_;
     log_group_name = log_group_name_;
   }
    : describe_log_streams_request)

let make_log_group
    ?bearer_token_authentication_enabled:
      (bearer_token_authentication_enabled_ : bearer_token_authentication_enabled option)
    ?deletion_protection_enabled:(deletion_protection_enabled_ : deletion_protection_enabled option)
    ?log_group_arn:(log_group_arn_ : arn option)
    ?log_group_class:(log_group_class_ : log_group_class option)
    ?inherited_properties:(inherited_properties_ : inherited_properties option)
    ?data_protection_status:(data_protection_status_ : data_protection_status option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?stored_bytes:(stored_bytes_ : stored_bytes option) ?arn:(arn_ : arn option)
    ?metric_filter_count:(metric_filter_count_ : filter_count option)
    ?retention_in_days:(retention_in_days_ : days option)
    ?creation_time:(creation_time_ : timestamp option)
    ?log_group_name:(log_group_name_ : log_group_name option) () =
  ({
     bearer_token_authentication_enabled = bearer_token_authentication_enabled_;
     deletion_protection_enabled = deletion_protection_enabled_;
     log_group_arn = log_group_arn_;
     log_group_class = log_group_class_;
     inherited_properties = inherited_properties_;
     data_protection_status = data_protection_status_;
     kms_key_id = kms_key_id_;
     stored_bytes = stored_bytes_;
     arn = arn_;
     metric_filter_count = metric_filter_count_;
     retention_in_days = retention_in_days_;
     creation_time = creation_time_;
     log_group_name = log_group_name_;
   }
    : log_group)

let make_describe_log_groups_response ?next_token:(next_token_ : next_token option)
    ?log_groups:(log_groups_ : log_groups option) () =
  ({ next_token = next_token_; log_groups = log_groups_ } : describe_log_groups_response)

let make_describe_log_groups_request
    ?log_group_identifiers:
      (log_group_identifiers_ : describe_log_groups_log_group_identifiers option)
    ?log_group_class:(log_group_class_ : log_group_class option)
    ?include_linked_accounts:(include_linked_accounts_ : include_linked_accounts option)
    ?limit:(limit_ : describe_limit option) ?next_token:(next_token_ : next_token option)
    ?log_group_name_pattern:(log_group_name_pattern_ : log_group_name_pattern option)
    ?log_group_name_prefix:(log_group_name_prefix_ : log_group_name option)
    ?account_identifiers:(account_identifiers_ : account_ids option) () =
  ({
     log_group_identifiers = log_group_identifiers_;
     log_group_class = log_group_class_;
     include_linked_accounts = include_linked_accounts_;
     limit = limit_;
     next_token = next_token_;
     log_group_name_pattern = log_group_name_pattern_;
     log_group_name_prefix = log_group_name_prefix_;
     account_identifiers = account_identifiers_;
   }
    : describe_log_groups_request)

let make_describe_index_policies_response ?next_token:(next_token_ : next_token option)
    ?index_policies:(index_policies_ : index_policies option) () =
  ({ next_token = next_token_; index_policies = index_policies_ }
    : describe_index_policies_response)

let make_describe_index_policies_request ?next_token:(next_token_ : next_token option)
    ~log_group_identifiers:(log_group_identifiers_ : describe_index_policies_log_group_identifiers)
    () =
  ({ next_token = next_token_; log_group_identifiers = log_group_identifiers_ }
    : describe_index_policies_request)

let make_import_statistics ?bytes_imported:(bytes_imported_ : stored_bytes option) () =
  ({ bytes_imported = bytes_imported_ } : import_statistics)

let make_import_filter ?end_event_time:(end_event_time_ : timestamp option)
    ?start_event_time:(start_event_time_ : timestamp option) () =
  ({ end_event_time = end_event_time_; start_event_time = start_event_time_ } : import_filter)

let make_import ?error_message:(error_message_ : error_message option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?import_filter:(import_filter_ : import_filter option)
    ?import_statistics:(import_statistics_ : import_statistics option)
    ?import_destination_arn:(import_destination_arn_ : arn option)
    ?import_status:(import_status_ : import_status option)
    ?import_source_arn:(import_source_arn_ : arn option) ?import_id:(import_id_ : import_id option)
    () =
  ({
     error_message = error_message_;
     last_updated_time = last_updated_time_;
     creation_time = creation_time_;
     import_filter = import_filter_;
     import_statistics = import_statistics_;
     import_destination_arn = import_destination_arn_;
     import_status = import_status_;
     import_source_arn = import_source_arn_;
     import_id = import_id_;
   }
    : import)

let make_describe_import_tasks_response ?next_token:(next_token_ : next_token option)
    ?imports:(imports_ : import_list option) () =
  ({ next_token = next_token_; imports = imports_ } : describe_import_tasks_response)

let make_describe_import_tasks_request ?next_token:(next_token_ : next_token option)
    ?limit:(limit_ : describe_limit option) ?import_source_arn:(import_source_arn_ : arn option)
    ?import_status:(import_status_ : import_status option)
    ?import_id:(import_id_ : import_id option) () =
  ({
     next_token = next_token_;
     limit = limit_;
     import_source_arn = import_source_arn_;
     import_status = import_status_;
     import_id = import_id_;
   }
    : describe_import_tasks_request)

let make_import_batch ?error_message:(error_message_ : error_message option)
    ~status:(status_ : import_status) ~batch_id:(batch_id_ : batch_id) () =
  ({ error_message = error_message_; status = status_; batch_id = batch_id_ } : import_batch)

let make_describe_import_task_batches_response ?next_token:(next_token_ : next_token option)
    ?import_batches:(import_batches_ : import_batch_list option)
    ?import_id:(import_id_ : import_id option) ?import_source_arn:(import_source_arn_ : arn option)
    () =
  ({
     next_token = next_token_;
     import_batches = import_batches_;
     import_id = import_id_;
     import_source_arn = import_source_arn_;
   }
    : describe_import_task_batches_response)

let make_describe_import_task_batches_request ?next_token:(next_token_ : next_token option)
    ?limit:(limit_ : describe_limit option)
    ?batch_import_status:(batch_import_status_ : import_status_list option)
    ~import_id:(import_id_ : import_id) () =
  ({
     next_token = next_token_;
     limit = limit_;
     batch_import_status = batch_import_status_;
     import_id = import_id_;
   }
    : describe_import_task_batches_request)

let make_field_index ?type_:(type__ : index_type option)
    ?last_event_time:(last_event_time_ : timestamp option)
    ?first_event_time:(first_event_time_ : timestamp option)
    ?last_scan_time:(last_scan_time_ : timestamp option)
    ?field_index_name:(field_index_name_ : field_index_name option)
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option) () =
  ({
     type_ = type__;
     last_event_time = last_event_time_;
     first_event_time = first_event_time_;
     last_scan_time = last_scan_time_;
     field_index_name = field_index_name_;
     log_group_identifier = log_group_identifier_;
   }
    : field_index)

let make_describe_field_indexes_response ?next_token:(next_token_ : next_token option)
    ?field_indexes:(field_indexes_ : field_indexes option) () =
  ({ next_token = next_token_; field_indexes = field_indexes_ } : describe_field_indexes_response)

let make_describe_field_indexes_request ?next_token:(next_token_ : next_token option)
    ~log_group_identifiers:(log_group_identifiers_ : describe_field_indexes_log_group_identifiers)
    () =
  ({ next_token = next_token_; log_group_identifiers = log_group_identifiers_ }
    : describe_field_indexes_request)

let make_export_task_status ?message:(message_ : export_task_status_message option)
    ?code:(code_ : export_task_status_code option) () =
  ({ message = message_; code = code_ } : export_task_status)

let make_export_task_execution_info ?completion_time:(completion_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) () =
  ({ completion_time = completion_time_; creation_time = creation_time_ }
    : export_task_execution_info)

let make_export_task ?execution_info:(execution_info_ : export_task_execution_info option)
    ?status:(status_ : export_task_status option)
    ?destination_prefix:(destination_prefix_ : export_destination_prefix option)
    ?destination:(destination_ : export_destination_bucket option) ?to_:(to__ : timestamp option)
    ?from_:(from__ : timestamp option) ?log_group_name:(log_group_name_ : log_group_name option)
    ?task_name:(task_name_ : export_task_name option) ?task_id:(task_id_ : export_task_id option) ()
    =
  ({
     execution_info = execution_info_;
     status = status_;
     destination_prefix = destination_prefix_;
     destination = destination_;
     to_ = to__;
     from_ = from__;
     log_group_name = log_group_name_;
     task_name = task_name_;
     task_id = task_id_;
   }
    : export_task)

let make_describe_export_tasks_response ?next_token:(next_token_ : next_token option)
    ?export_tasks:(export_tasks_ : export_tasks option) () =
  ({ next_token = next_token_; export_tasks = export_tasks_ } : describe_export_tasks_response)

let make_describe_export_tasks_request ?limit:(limit_ : describe_limit option)
    ?next_token:(next_token_ : next_token option)
    ?status_code:(status_code_ : export_task_status_code option)
    ?task_id:(task_id_ : export_task_id option) () =
  ({ limit = limit_; next_token = next_token_; status_code = status_code_; task_id = task_id_ }
    : describe_export_tasks_request)

let make_describe_destinations_response ?next_token:(next_token_ : next_token option)
    ?destinations:(destinations_ : destinations option) () =
  ({ next_token = next_token_; destinations = destinations_ } : describe_destinations_response)

let make_describe_destinations_request ?limit:(limit_ : describe_limit option)
    ?next_token:(next_token_ : next_token option)
    ?destination_name_prefix:(destination_name_prefix_ : destination_name option) () =
  ({ limit = limit_; next_token = next_token_; destination_name_prefix = destination_name_prefix_ }
    : describe_destinations_request)

let make_describe_delivery_sources_response ?next_token:(next_token_ : next_token option)
    ?delivery_sources:(delivery_sources_ : delivery_sources option) () =
  ({ next_token = next_token_; delivery_sources = delivery_sources_ }
    : describe_delivery_sources_response)

let make_describe_delivery_sources_request ?limit:(limit_ : describe_limit option)
    ?next_token:(next_token_ : next_token option) () =
  ({ limit = limit_; next_token = next_token_ } : describe_delivery_sources_request)

let make_describe_delivery_destinations_response ?next_token:(next_token_ : next_token option)
    ?delivery_destinations:(delivery_destinations_ : delivery_destinations option) () =
  ({ next_token = next_token_; delivery_destinations = delivery_destinations_ }
    : describe_delivery_destinations_response)

let make_describe_delivery_destinations_request ?limit:(limit_ : describe_limit option)
    ?next_token:(next_token_ : next_token option) () =
  ({ limit = limit_; next_token = next_token_ } : describe_delivery_destinations_request)

let make_describe_deliveries_response ?next_token:(next_token_ : next_token option)
    ?deliveries:(deliveries_ : deliveries option) () =
  ({ next_token = next_token_; deliveries = deliveries_ } : describe_deliveries_response)

let make_describe_deliveries_request ?limit:(limit_ : describe_limit option)
    ?next_token:(next_token_ : next_token option) () =
  ({ limit = limit_; next_token = next_token_ } : describe_deliveries_request)

let make_configuration_template_delivery_config_values
    ?s3_delivery_configuration:(s3_delivery_configuration_ : s3_delivery_configuration option)
    ?field_delimiter:(field_delimiter_ : field_delimiter option)
    ?record_fields:(record_fields_ : record_fields option) () =
  ({
     s3_delivery_configuration = s3_delivery_configuration_;
     field_delimiter = field_delimiter_;
     record_fields = record_fields_;
   }
    : configuration_template_delivery_config_values)

let make_delivery_source_configuration_schema
    ?max_value:(max_value_ : delivery_source_configuration_numeric_value option)
    ?min_value:(min_value_ : delivery_source_configuration_numeric_value option)
    ?supported_values:(supported_values_ : delivery_source_configuration_supported_values option)
    ~default_value:(default_value_ : delivery_source_configuration_schema_field)
    ~value_type:(value_type_ : delivery_source_configuration_schema_value_type)
    ~key_name:(key_name_ : delivery_source_configuration_schema_field) () =
  ({
     max_value = max_value_;
     min_value = min_value_;
     supported_values = supported_values_;
     default_value = default_value_;
     value_type = value_type_;
     key_name = key_name_;
   }
    : delivery_source_configuration_schema)

let make_configuration_template
    ?s3_tables_integration:(s3_tables_integration_ : s3_tables_integration option)
    ?delivery_source_configuration:
      (delivery_source_configuration_ : delivery_source_configuration_schemas option)
    ?allowed_suffix_path_fields:(allowed_suffix_path_fields_ : record_fields option)
    ?allowed_field_delimiters:(allowed_field_delimiters_ : allowed_field_delimiters option)
    ?allowed_action_for_allow_vended_logs_delivery_for_resource:
      (allowed_action_for_allow_vended_logs_delivery_for_resource_ :
         allowed_action_for_allow_vended_logs_delivery_for_resource option)
    ?allowed_output_formats:(allowed_output_formats_ : output_formats option)
    ?allowed_fields:(allowed_fields_ : allowed_fields option)
    ?default_delivery_config_values:
      (default_delivery_config_values_ : configuration_template_delivery_config_values option)
    ?delivery_destination_type:(delivery_destination_type_ : delivery_destination_type option)
    ?resource_type:(resource_type_ : resource_type option) ?log_type:(log_type_ : log_type option)
    ?service:(service_ : service option) () =
  ({
     s3_tables_integration = s3_tables_integration_;
     delivery_source_configuration = delivery_source_configuration_;
     allowed_suffix_path_fields = allowed_suffix_path_fields_;
     allowed_field_delimiters = allowed_field_delimiters_;
     allowed_action_for_allow_vended_logs_delivery_for_resource =
       allowed_action_for_allow_vended_logs_delivery_for_resource_;
     allowed_output_formats = allowed_output_formats_;
     allowed_fields = allowed_fields_;
     default_delivery_config_values = default_delivery_config_values_;
     delivery_destination_type = delivery_destination_type_;
     resource_type = resource_type_;
     log_type = log_type_;
     service = service_;
   }
    : configuration_template)

let make_describe_configuration_templates_response ?next_token:(next_token_ : next_token option)
    ?configuration_templates:(configuration_templates_ : configuration_templates option) () =
  ({ next_token = next_token_; configuration_templates = configuration_templates_ }
    : describe_configuration_templates_response)

let make_describe_configuration_templates_request ?limit:(limit_ : describe_limit option)
    ?next_token:(next_token_ : next_token option)
    ?delivery_destination_types:(delivery_destination_types_ : delivery_destination_types option)
    ?resource_types:(resource_types_ : resource_types option)
    ?log_types:(log_types_ : log_types option) ?service:(service_ : service option) () =
  ({
     limit = limit_;
     next_token = next_token_;
     delivery_destination_types = delivery_destination_types_;
     resource_types = resource_types_;
     log_types = log_types_;
     service = service_;
   }
    : describe_configuration_templates_request)

let make_describe_account_policies_response ?next_token:(next_token_ : next_token option)
    ?account_policies:(account_policies_ : account_policies option) () =
  ({ next_token = next_token_; account_policies = account_policies_ }
    : describe_account_policies_response)

let make_describe_account_policies_request ?next_token:(next_token_ : next_token option)
    ?account_identifiers:(account_identifiers_ : account_ids option)
    ?policy_name:(policy_name_ : policy_name option) ~policy_type:(policy_type_ : policy_type) () =
  ({
     next_token = next_token_;
     account_identifiers = account_identifiers_;
     policy_name = policy_name_;
     policy_type = policy_type_;
   }
    : describe_account_policies_request)

let make_delete_transformer_request
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier) () =
  ({ log_group_identifier = log_group_identifier_ } : delete_transformer_request)

let make_delete_syslog_configuration_request
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier) () =
  ({ vpc_endpoint_id = vpc_endpoint_id_; log_group_identifier = log_group_identifier_ }
    : delete_syslog_configuration_request)

let make_delete_subscription_filter_request ~filter_name:(filter_name_ : filter_name)
    ~log_group_name:(log_group_name_ : log_group_name) () =
  ({ filter_name = filter_name_; log_group_name = log_group_name_ }
    : delete_subscription_filter_request)

let make_delete_scheduled_query_response () = (() : unit)

let make_delete_scheduled_query_request ~identifier:(identifier_ : scheduled_query_identifier) () =
  ({ identifier = identifier_ } : delete_scheduled_query_request)

let make_delete_retention_policy_request ~log_group_name:(log_group_name_ : log_group_name) () =
  ({ log_group_name = log_group_name_ } : delete_retention_policy_request)

let make_delete_resource_policy_request
    ?expected_revision_id:(expected_revision_id_ : expected_revision_id option)
    ?resource_arn:(resource_arn_ : arn option) ?policy_name:(policy_name_ : policy_name option) () =
  ({
     expected_revision_id = expected_revision_id_;
     resource_arn = resource_arn_;
     policy_name = policy_name_;
   }
    : delete_resource_policy_request)

let make_delete_query_definition_response ?success:(success_ : success option) () =
  ({ success = success_ } : delete_query_definition_response)

let make_delete_query_definition_request ~query_definition_id:(query_definition_id_ : query_id) () =
  ({ query_definition_id = query_definition_id_ } : delete_query_definition_request)

let make_delete_metric_filter_request ~filter_name:(filter_name_ : filter_name)
    ~log_group_name:(log_group_name_ : log_group_name) () =
  ({ filter_name = filter_name_; log_group_name = log_group_name_ } : delete_metric_filter_request)

let make_delete_lookup_table_request ~lookup_table_arn:(lookup_table_arn_ : arn) () =
  ({ lookup_table_arn = lookup_table_arn_ } : delete_lookup_table_request)

let make_delete_log_stream_request ~log_stream_name:(log_stream_name_ : log_stream_name)
    ~log_group_name:(log_group_name_ : log_group_name) () =
  ({ log_stream_name = log_stream_name_; log_group_name = log_group_name_ }
    : delete_log_stream_request)

let make_delete_log_group_request ~log_group_name:(log_group_name_ : log_group_name) () =
  ({ log_group_name = log_group_name_ } : delete_log_group_request)

let make_delete_log_anomaly_detector_request
    ~anomaly_detector_arn:(anomaly_detector_arn_ : anomaly_detector_arn) () =
  ({ anomaly_detector_arn = anomaly_detector_arn_ } : delete_log_anomaly_detector_request)

let make_delete_integration_response () = (() : unit)

let make_delete_integration_request ?force:(force_ : force option)
    ~integration_name:(integration_name_ : integration_name) () =
  ({ force = force_; integration_name = integration_name_ } : delete_integration_request)

let make_delete_index_policy_response () = (() : unit)

let make_delete_index_policy_request
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier) () =
  ({ log_group_identifier = log_group_identifier_ } : delete_index_policy_request)

let make_delete_destination_request ~destination_name:(destination_name_ : destination_name) () =
  ({ destination_name = destination_name_ } : delete_destination_request)

let make_delete_delivery_source_request ~name:(name_ : delivery_source_name) () =
  ({ name = name_ } : delete_delivery_source_request)

let make_delete_delivery_destination_policy_request
    ~delivery_destination_name:(delivery_destination_name_ : delivery_destination_name) () =
  ({ delivery_destination_name = delivery_destination_name_ }
    : delete_delivery_destination_policy_request)

let make_delete_delivery_destination_request ~name:(name_ : delivery_destination_name) () =
  ({ name = name_ } : delete_delivery_destination_request)

let make_delete_delivery_request ~id:(id_ : delivery_id) () =
  ({ id = id_ } : delete_delivery_request)

let make_delete_data_protection_policy_request
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier) () =
  ({ log_group_identifier = log_group_identifier_ } : delete_data_protection_policy_request)

let make_delete_account_policy_request ~policy_type:(policy_type_ : policy_type)
    ~policy_name:(policy_name_ : policy_name) () =
  ({ policy_type = policy_type_; policy_name = policy_name_ } : delete_account_policy_request)

let make_create_scheduled_query_response ?state:(state_ : scheduled_query_state option)
    ?scheduled_query_arn:(scheduled_query_arn_ : arn option) () =
  ({ state = state_; scheduled_query_arn = scheduled_query_arn_ } : create_scheduled_query_response)

let make_create_scheduled_query_request ?tags:(tags_ : tags option)
    ?state:(state_ : scheduled_query_state option)
    ?schedule_end_time:(schedule_end_time_ : timestamp option)
    ?schedule_start_time:(schedule_start_time_ : timestamp option)
    ?destination_configuration:(destination_configuration_ : destination_configuration option)
    ?end_time_offset:(end_time_offset_ : end_time_offset option)
    ?start_time_offset:(start_time_offset_ : start_time_offset option)
    ?timezone:(timezone_ : schedule_timezone option)
    ?log_group_identifiers:(log_group_identifiers_ : scheduled_query_log_group_identifiers option)
    ?description:(description_ : scheduled_query_description option)
    ~execution_role_arn:(execution_role_arn_ : role_arn)
    ~schedule_expression:(schedule_expression_ : schedule_expression)
    ~query_string:(query_string_ : query_string) ~query_language:(query_language_ : query_language)
    ~name:(name_ : scheduled_query_name) () =
  ({
     tags = tags_;
     state = state_;
     execution_role_arn = execution_role_arn_;
     schedule_end_time = schedule_end_time_;
     schedule_start_time = schedule_start_time_;
     destination_configuration = destination_configuration_;
     end_time_offset = end_time_offset_;
     start_time_offset = start_time_offset_;
     timezone = timezone_;
     schedule_expression = schedule_expression_;
     log_group_identifiers = log_group_identifiers_;
     query_string = query_string_;
     query_language = query_language_;
     description = description_;
     name = name_;
   }
    : create_scheduled_query_request)

let make_create_lookup_table_response ?created_at:(created_at_ : timestamp option)
    ?lookup_table_arn:(lookup_table_arn_ : arn option) () =
  ({ created_at = created_at_; lookup_table_arn = lookup_table_arn_ }
    : create_lookup_table_response)

let make_create_lookup_table_request ?tags:(tags_ : tags option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?description:(description_ : lookup_table_description option)
    ~table_body:(table_body_ : table_body)
    ~lookup_table_name:(lookup_table_name_ : lookup_table_name) () =
  ({
     tags = tags_;
     kms_key_id = kms_key_id_;
     table_body = table_body_;
     description = description_;
     lookup_table_name = lookup_table_name_;
   }
    : create_lookup_table_request)

let make_create_log_stream_request ~log_stream_name:(log_stream_name_ : log_stream_name)
    ~log_group_name:(log_group_name_ : log_group_name) () =
  ({ log_stream_name = log_stream_name_; log_group_name = log_group_name_ }
    : create_log_stream_request)

let make_create_log_group_request
    ?deletion_protection_enabled:(deletion_protection_enabled_ : deletion_protection_enabled option)
    ?log_group_class:(log_group_class_ : log_group_class option) ?tags:(tags_ : tags option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ~log_group_name:(log_group_name_ : log_group_name)
    () =
  ({
     deletion_protection_enabled = deletion_protection_enabled_;
     log_group_class = log_group_class_;
     tags = tags_;
     kms_key_id = kms_key_id_;
     log_group_name = log_group_name_;
   }
    : create_log_group_request)

let make_create_log_anomaly_detector_response
    ?anomaly_detector_arn:(anomaly_detector_arn_ : anomaly_detector_arn option) () =
  ({ anomaly_detector_arn = anomaly_detector_arn_ } : create_log_anomaly_detector_response)

let make_create_log_anomaly_detector_request ?tags:(tags_ : tags option)
    ?anomaly_visibility_time:(anomaly_visibility_time_ : anomaly_visibility_time option)
    ?kms_key_id:(kms_key_id_ : detector_kms_key_arn option)
    ?filter_pattern:(filter_pattern_ : filter_pattern option)
    ?evaluation_frequency:(evaluation_frequency_ : evaluation_frequency option)
    ?detector_name:(detector_name_ : detector_name option)
    ~log_group_arn_list:(log_group_arn_list_ : log_group_arn_list) () =
  ({
     tags = tags_;
     anomaly_visibility_time = anomaly_visibility_time_;
     kms_key_id = kms_key_id_;
     filter_pattern = filter_pattern_;
     evaluation_frequency = evaluation_frequency_;
     detector_name = detector_name_;
     log_group_arn_list = log_group_arn_list_;
   }
    : create_log_anomaly_detector_request)

let make_create_import_task_response ?creation_time:(creation_time_ : timestamp option)
    ?import_destination_arn:(import_destination_arn_ : arn option)
    ?import_id:(import_id_ : import_id option) () =
  ({
     creation_time = creation_time_;
     import_destination_arn = import_destination_arn_;
     import_id = import_id_;
   }
    : create_import_task_response)

let make_create_import_task_request ?import_filter:(import_filter_ : import_filter option)
    ~import_role_arn:(import_role_arn_ : role_arn) ~import_source_arn:(import_source_arn_ : arn) ()
    =
  ({
     import_filter = import_filter_;
     import_role_arn = import_role_arn_;
     import_source_arn = import_source_arn_;
   }
    : create_import_task_request)

let make_create_export_task_response ?task_id:(task_id_ : export_task_id option) () =
  ({ task_id = task_id_ } : create_export_task_response)

let make_create_export_task_request
    ?destination_prefix:(destination_prefix_ : export_destination_prefix option)
    ?log_stream_name_prefix:(log_stream_name_prefix_ : log_stream_name option)
    ?task_name:(task_name_ : export_task_name option)
    ~destination:(destination_ : export_destination_bucket) ~to_:(to__ : timestamp)
    ~from_:(from__ : timestamp) ~log_group_name:(log_group_name_ : log_group_name) () =
  ({
     destination_prefix = destination_prefix_;
     destination = destination_;
     to_ = to__;
     from_ = from__;
     log_stream_name_prefix = log_stream_name_prefix_;
     log_group_name = log_group_name_;
     task_name = task_name_;
   }
    : create_export_task_request)

let make_create_delivery_response ?delivery:(delivery_ : delivery option) () =
  ({ delivery = delivery_ } : create_delivery_response)

let make_create_delivery_request ?tags:(tags_ : tags option)
    ?s3_delivery_configuration:(s3_delivery_configuration_ : s3_delivery_configuration option)
    ?field_delimiter:(field_delimiter_ : field_delimiter option)
    ?record_fields:(record_fields_ : record_fields option)
    ~delivery_destination_arn:(delivery_destination_arn_ : arn)
    ~delivery_source_name:(delivery_source_name_ : delivery_source_name) () =
  ({
     tags = tags_;
     s3_delivery_configuration = s3_delivery_configuration_;
     field_delimiter = field_delimiter_;
     record_fields = record_fields_;
     delivery_destination_arn = delivery_destination_arn_;
     delivery_source_name = delivery_source_name_;
   }
    : create_delivery_request)

let make_cancel_import_task_response ?last_updated_time:(last_updated_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?import_status:(import_status_ : import_status option)
    ?import_statistics:(import_statistics_ : import_statistics option)
    ?import_id:(import_id_ : import_id option) () =
  ({
     last_updated_time = last_updated_time_;
     creation_time = creation_time_;
     import_status = import_status_;
     import_statistics = import_statistics_;
     import_id = import_id_;
   }
    : cancel_import_task_response)

let make_cancel_import_task_request ~import_id:(import_id_ : import_id) () =
  ({ import_id = import_id_ } : cancel_import_task_request)

let make_cancel_export_task_request ~task_id:(task_id_ : export_task_id) () =
  ({ task_id = task_id_ } : cancel_export_task_request)

let make_associate_source_to_s3_table_integration_response
    ?identifier:(identifier_ : s3_table_integration_source_identifier option) () =
  ({ identifier = identifier_ } : associate_source_to_s3_table_integration_response)

let make_associate_source_to_s3_table_integration_request ~data_source:(data_source_ : data_source)
    ~integration_arn:(integration_arn_ : arn) () =
  ({ data_source = data_source_; integration_arn = integration_arn_ }
    : associate_source_to_s3_table_integration_request)

let make_associate_kms_key_request
    ?resource_identifier:(resource_identifier_ : resource_identifier option)
    ?log_group_name:(log_group_name_ : log_group_name option) ~kms_key_id:(kms_key_id_ : kms_key_id)
    () =
  ({
     resource_identifier = resource_identifier_;
     kms_key_id = kms_key_id_;
     log_group_name = log_group_name_;
   }
    : associate_kms_key_request)
