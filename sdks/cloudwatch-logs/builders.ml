open Types

let make_account_policy ?policy_name:(policy_name_ : policy_name option)
    ?policy_document:(policy_document_ : account_policy_document option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?policy_type:(policy_type_ : policy_type option) ?scope:(scope_ : scope option)
    ?selection_criteria:(selection_criteria_ : selection_criteria option)
    ?account_id:(account_id_ : account_id option) () =
  ({
     policy_name = policy_name_;
     policy_document = policy_document_;
     last_updated_time = last_updated_time_;
     policy_type = policy_type_;
     scope = scope_;
     selection_criteria = selection_criteria_;
     account_id = account_id_;
   }
    : account_policy)

let make_add_key_entry ?overwrite_if_exists:(overwrite_if_exists_ : overwrite_if_exists option)
    ~key:(key_ : key) ~value:(value_ : add_key_value) () =
  ({ key = key_; value = value_; overwrite_if_exists = overwrite_if_exists_ } : add_key_entry)

let make_add_keys ~entries:(entries_ : add_key_entries) () = ({ entries = entries_ } : add_keys)

let make_grouping_identifier ?key:(key_ : grouping_identifier_key option)
    ?value:(value_ : grouping_identifier_value option) () =
  ({ key = key_; value = value_ } : grouping_identifier)

let make_aggregate_log_group_summary ?log_group_count:(log_group_count_ : log_group_count option)
    ?grouping_identifiers:(grouping_identifiers_ : grouping_identifiers option) () =
  ({ log_group_count = log_group_count_; grouping_identifiers = grouping_identifiers_ }
    : aggregate_log_group_summary)

let make_record_field ?name:(name_ : field_header option) ?mandatory:(mandatory_ : boolean_ option)
    () =
  ({ name = name_; mandatory = mandatory_ } : record_field)

let make_pattern_token
    ?dynamic_token_position:(dynamic_token_position_ : dynamic_token_position option)
    ?is_dynamic:(is_dynamic_ : boolean_ option) ?token_string:(token_string_ : token_string option)
    ?enumerations:(enumerations_ : enumerations option)
    ?inferred_token_name:(inferred_token_name_ : inferred_token_name option) () =
  ({
     dynamic_token_position = dynamic_token_position_;
     is_dynamic = is_dynamic_;
     token_string = token_string_;
     enumerations = enumerations_;
     inferred_token_name = inferred_token_name_;
   }
    : pattern_token)

let make_log_event ?timestamp:(timestamp_ : timestamp option)
    ?message:(message_ : event_message option) () =
  ({ timestamp = timestamp_; message = message_ } : log_event)

let make_anomaly ?pattern_regex:(pattern_regex_ : pattern_regex option)
    ?priority:(priority_ : priority option) ?suppressed:(suppressed_ : boolean_ option)
    ?suppressed_date:(suppressed_date_ : epoch_millis option)
    ?suppressed_until:(suppressed_until_ : epoch_millis option)
    ?is_pattern_level_suppression:(is_pattern_level_suppression_ : boolean_ option)
    ~anomaly_id:(anomaly_id_ : anomaly_id) ~pattern_id:(pattern_id_ : pattern_id)
    ~anomaly_detector_arn:(anomaly_detector_arn_ : anomaly_detector_arn)
    ~pattern_string:(pattern_string_ : pattern_string) ~first_seen:(first_seen_ : epoch_millis)
    ~last_seen:(last_seen_ : epoch_millis) ~description:(description_ : description)
    ~active:(active_ : boolean_) ~state:(state_ : state) ~histogram:(histogram_ : histogram)
    ~log_samples:(log_samples_ : log_samples) ~pattern_tokens:(pattern_tokens_ : pattern_tokens)
    ~log_group_arn_list:(log_group_arn_list_ : log_group_arn_list) () =
  ({
     anomaly_id = anomaly_id_;
     pattern_id = pattern_id_;
     anomaly_detector_arn = anomaly_detector_arn_;
     pattern_string = pattern_string_;
     pattern_regex = pattern_regex_;
     priority = priority_;
     first_seen = first_seen_;
     last_seen = last_seen_;
     description = description_;
     active = active_;
     state = state_;
     histogram = histogram_;
     log_samples = log_samples_;
     pattern_tokens = pattern_tokens_;
     log_group_arn_list = log_group_arn_list_;
     suppressed = suppressed_;
     suppressed_date = suppressed_date_;
     suppressed_until = suppressed_until_;
     is_pattern_level_suppression = is_pattern_level_suppression_;
   }
    : anomaly)

let make_anomaly_detector
    ?anomaly_detector_arn:(anomaly_detector_arn_ : anomaly_detector_arn option)
    ?detector_name:(detector_name_ : detector_name option)
    ?log_group_arn_list:(log_group_arn_list_ : log_group_arn_list option)
    ?evaluation_frequency:(evaluation_frequency_ : evaluation_frequency option)
    ?filter_pattern:(filter_pattern_ : filter_pattern option)
    ?anomaly_detector_status:(anomaly_detector_status_ : anomaly_detector_status option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?creation_time_stamp:(creation_time_stamp_ : epoch_millis option)
    ?last_modified_time_stamp:(last_modified_time_stamp_ : epoch_millis option)
    ?anomaly_visibility_time:(anomaly_visibility_time_ : anomaly_visibility_time option) () =
  ({
     anomaly_detector_arn = anomaly_detector_arn_;
     detector_name = detector_name_;
     log_group_arn_list = log_group_arn_list_;
     evaluation_frequency = evaluation_frequency_;
     filter_pattern = filter_pattern_;
     anomaly_detector_status = anomaly_detector_status_;
     kms_key_id = kms_key_id_;
     creation_time_stamp = creation_time_stamp_;
     last_modified_time_stamp = last_modified_time_stamp_;
     anomaly_visibility_time = anomaly_visibility_time_;
   }
    : anomaly_detector)

let make_associate_kms_key_request ?log_group_name:(log_group_name_ : log_group_name option)
    ?resource_identifier:(resource_identifier_ : resource_identifier option)
    ~kms_key_id:(kms_key_id_ : kms_key_id) () =
  ({
     log_group_name = log_group_name_;
     kms_key_id = kms_key_id_;
     resource_identifier = resource_identifier_;
   }
    : associate_kms_key_request)

let make_associate_source_to_s3_table_integration_response
    ?identifier:(identifier_ : s3_table_integration_source_identifier option) () =
  ({ identifier = identifier_ } : associate_source_to_s3_table_integration_response)

let make_data_source ?type_:(type__ : data_source_type option) ~name:(name_ : data_source_name) () =
  ({ name = name_; type_ = type__ } : data_source)

let make_associate_source_to_s3_table_integration_request ~integration_arn:(integration_arn_ : arn)
    ~data_source:(data_source_ : data_source) () =
  ({ integration_arn = integration_arn_; data_source = data_source_ }
    : associate_source_to_s3_table_integration_request)

let make_cs_v ?quote_character:(quote_character_ : quote_character option)
    ?delimiter:(delimiter_ : delimiter option) ?columns:(columns_ : columns option)
    ?source:(source_ : source option) ?destination:(destination_ : destination_field option) () =
  ({
     quote_character = quote_character_;
     delimiter = delimiter_;
     columns = columns_;
     source = source_;
     destination = destination_;
   }
    : cs_v)

let make_cancel_export_task_request ~task_id:(task_id_ : export_task_id) () =
  ({ task_id = task_id_ } : cancel_export_task_request)

let make_import_statistics ?bytes_imported:(bytes_imported_ : stored_bytes option) () =
  ({ bytes_imported = bytes_imported_ } : import_statistics)

let make_cancel_import_task_response ?import_id:(import_id_ : import_id option)
    ?import_statistics:(import_statistics_ : import_statistics option)
    ?import_status:(import_status_ : import_status option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_updated_time:(last_updated_time_ : timestamp option) () =
  ({
     import_id = import_id_;
     import_statistics = import_statistics_;
     import_status = import_status_;
     creation_time = creation_time_;
     last_updated_time = last_updated_time_;
   }
    : cancel_import_task_response)

let make_cancel_import_task_request ~import_id:(import_id_ : import_id) () =
  ({ import_id = import_id_ } : cancel_import_task_request)

let make_s3_tables_integration
    ?datasource_name:(datasource_name_ : s3_tables_datasource_name option)
    ?datasource_type:(datasource_type_ : s3_tables_datasource_type option) () =
  ({ datasource_name = datasource_name_; datasource_type = datasource_type_ }
    : s3_tables_integration)

let make_delivery_source_configuration_schema
    ?supported_values:(supported_values_ : delivery_source_configuration_supported_values option)
    ?min_value:(min_value_ : delivery_source_configuration_numeric_value option)
    ?max_value:(max_value_ : delivery_source_configuration_numeric_value option)
    ~key_name:(key_name_ : delivery_source_configuration_schema_field)
    ~value_type:(value_type_ : delivery_source_configuration_schema_value_type)
    ~default_value:(default_value_ : delivery_source_configuration_schema_field) () =
  ({
     key_name = key_name_;
     value_type = value_type_;
     default_value = default_value_;
     supported_values = supported_values_;
     min_value = min_value_;
     max_value = max_value_;
   }
    : delivery_source_configuration_schema)

let make_s3_delivery_configuration ?suffix_path:(suffix_path_ : delivery_suffix_path option)
    ?enable_hive_compatible_path:(enable_hive_compatible_path_ : boolean_ option) () =
  ({ suffix_path = suffix_path_; enable_hive_compatible_path = enable_hive_compatible_path_ }
    : s3_delivery_configuration)

let make_configuration_template_delivery_config_values
    ?record_fields:(record_fields_ : record_fields option)
    ?field_delimiter:(field_delimiter_ : field_delimiter option)
    ?s3_delivery_configuration:(s3_delivery_configuration_ : s3_delivery_configuration option) () =
  ({
     record_fields = record_fields_;
     field_delimiter = field_delimiter_;
     s3_delivery_configuration = s3_delivery_configuration_;
   }
    : configuration_template_delivery_config_values)

let make_configuration_template ?service:(service_ : service option)
    ?log_type:(log_type_ : log_type option) ?resource_type:(resource_type_ : resource_type option)
    ?delivery_destination_type:(delivery_destination_type_ : delivery_destination_type option)
    ?default_delivery_config_values:
      (default_delivery_config_values_ : configuration_template_delivery_config_values option)
    ?allowed_fields:(allowed_fields_ : allowed_fields option)
    ?allowed_output_formats:(allowed_output_formats_ : output_formats option)
    ?allowed_action_for_allow_vended_logs_delivery_for_resource:
      (allowed_action_for_allow_vended_logs_delivery_for_resource_ :
         allowed_action_for_allow_vended_logs_delivery_for_resource option)
    ?allowed_field_delimiters:(allowed_field_delimiters_ : allowed_field_delimiters option)
    ?allowed_suffix_path_fields:(allowed_suffix_path_fields_ : record_fields option)
    ?delivery_source_configuration:
      (delivery_source_configuration_ : delivery_source_configuration_schemas option)
    ?s3_tables_integration:(s3_tables_integration_ : s3_tables_integration option) () =
  ({
     service = service_;
     log_type = log_type_;
     resource_type = resource_type_;
     delivery_destination_type = delivery_destination_type_;
     default_delivery_config_values = default_delivery_config_values_;
     allowed_fields = allowed_fields_;
     allowed_output_formats = allowed_output_formats_;
     allowed_action_for_allow_vended_logs_delivery_for_resource =
       allowed_action_for_allow_vended_logs_delivery_for_resource_;
     allowed_field_delimiters = allowed_field_delimiters_;
     allowed_suffix_path_fields = allowed_suffix_path_fields_;
     delivery_source_configuration = delivery_source_configuration_;
     s3_tables_integration = s3_tables_integration_;
   }
    : configuration_template)

let make_copy_value_entry ?overwrite_if_exists:(overwrite_if_exists_ : overwrite_if_exists option)
    ~source:(source_ : source) ~target:(target_ : target) () =
  ({ source = source_; target = target_; overwrite_if_exists = overwrite_if_exists_ }
    : copy_value_entry)

let make_copy_value ~entries:(entries_ : copy_value_entries) () =
  ({ entries = entries_ } : copy_value)

let make_delivery ?id:(id_ : delivery_id option) ?arn:(arn_ : arn option)
    ?delivery_source_name:(delivery_source_name_ : delivery_source_name option)
    ?delivery_destination_arn:(delivery_destination_arn_ : arn option)
    ?delivery_destination_type:(delivery_destination_type_ : delivery_destination_type option)
    ?record_fields:(record_fields_ : record_fields option)
    ?field_delimiter:(field_delimiter_ : field_delimiter option)
    ?s3_delivery_configuration:(s3_delivery_configuration_ : s3_delivery_configuration option)
    ?tags:(tags_ : tags option) () =
  ({
     id = id_;
     arn = arn_;
     delivery_source_name = delivery_source_name_;
     delivery_destination_arn = delivery_destination_arn_;
     delivery_destination_type = delivery_destination_type_;
     record_fields = record_fields_;
     field_delimiter = field_delimiter_;
     s3_delivery_configuration = s3_delivery_configuration_;
     tags = tags_;
   }
    : delivery)

let make_create_delivery_response ?delivery:(delivery_ : delivery option) () =
  ({ delivery = delivery_ } : create_delivery_response)

let make_create_delivery_request ?record_fields:(record_fields_ : record_fields option)
    ?field_delimiter:(field_delimiter_ : field_delimiter option)
    ?s3_delivery_configuration:(s3_delivery_configuration_ : s3_delivery_configuration option)
    ?tags:(tags_ : tags option) ~delivery_source_name:(delivery_source_name_ : delivery_source_name)
    ~delivery_destination_arn:(delivery_destination_arn_ : arn) () =
  ({
     delivery_source_name = delivery_source_name_;
     delivery_destination_arn = delivery_destination_arn_;
     record_fields = record_fields_;
     field_delimiter = field_delimiter_;
     s3_delivery_configuration = s3_delivery_configuration_;
     tags = tags_;
   }
    : create_delivery_request)

let make_create_export_task_response ?task_id:(task_id_ : export_task_id option) () =
  ({ task_id = task_id_ } : create_export_task_response)

let make_create_export_task_request ?task_name:(task_name_ : export_task_name option)
    ?log_stream_name_prefix:(log_stream_name_prefix_ : log_stream_name option)
    ?destination_prefix:(destination_prefix_ : export_destination_prefix option)
    ~log_group_name:(log_group_name_ : log_group_name) ~from_:(from__ : timestamp)
    ~to_:(to__ : timestamp) ~destination:(destination_ : export_destination_bucket) () =
  ({
     task_name = task_name_;
     log_group_name = log_group_name_;
     log_stream_name_prefix = log_stream_name_prefix_;
     from_ = from__;
     to_ = to__;
     destination = destination_;
     destination_prefix = destination_prefix_;
   }
    : create_export_task_request)

let make_create_import_task_response ?import_id:(import_id_ : import_id option)
    ?import_destination_arn:(import_destination_arn_ : arn option)
    ?creation_time:(creation_time_ : timestamp option) () =
  ({
     import_id = import_id_;
     import_destination_arn = import_destination_arn_;
     creation_time = creation_time_;
   }
    : create_import_task_response)

let make_import_filter ?start_event_time:(start_event_time_ : timestamp option)
    ?end_event_time:(end_event_time_ : timestamp option) () =
  ({ start_event_time = start_event_time_; end_event_time = end_event_time_ } : import_filter)

let make_create_import_task_request ?import_filter:(import_filter_ : import_filter option)
    ~import_source_arn:(import_source_arn_ : arn) ~import_role_arn:(import_role_arn_ : role_arn) ()
    =
  ({
     import_source_arn = import_source_arn_;
     import_role_arn = import_role_arn_;
     import_filter = import_filter_;
   }
    : create_import_task_request)

let make_create_log_anomaly_detector_response
    ?anomaly_detector_arn:(anomaly_detector_arn_ : anomaly_detector_arn option) () =
  ({ anomaly_detector_arn = anomaly_detector_arn_ } : create_log_anomaly_detector_response)

let make_create_log_anomaly_detector_request ?detector_name:(detector_name_ : detector_name option)
    ?evaluation_frequency:(evaluation_frequency_ : evaluation_frequency option)
    ?filter_pattern:(filter_pattern_ : filter_pattern option)
    ?kms_key_id:(kms_key_id_ : detector_kms_key_arn option)
    ?anomaly_visibility_time:(anomaly_visibility_time_ : anomaly_visibility_time option)
    ?tags:(tags_ : tags option) ~log_group_arn_list:(log_group_arn_list_ : log_group_arn_list) () =
  ({
     log_group_arn_list = log_group_arn_list_;
     detector_name = detector_name_;
     evaluation_frequency = evaluation_frequency_;
     filter_pattern = filter_pattern_;
     kms_key_id = kms_key_id_;
     anomaly_visibility_time = anomaly_visibility_time_;
     tags = tags_;
   }
    : create_log_anomaly_detector_request)

let make_create_log_group_request ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?tags:(tags_ : tags option) ?log_group_class:(log_group_class_ : log_group_class option)
    ?deletion_protection_enabled:(deletion_protection_enabled_ : deletion_protection_enabled option)
    ~log_group_name:(log_group_name_ : log_group_name) () =
  ({
     log_group_name = log_group_name_;
     kms_key_id = kms_key_id_;
     tags = tags_;
     log_group_class = log_group_class_;
     deletion_protection_enabled = deletion_protection_enabled_;
   }
    : create_log_group_request)

let make_create_log_stream_request ~log_group_name:(log_group_name_ : log_group_name)
    ~log_stream_name:(log_stream_name_ : log_stream_name) () =
  ({ log_group_name = log_group_name_; log_stream_name = log_stream_name_ }
    : create_log_stream_request)

let make_create_lookup_table_response ?lookup_table_arn:(lookup_table_arn_ : arn option)
    ?created_at:(created_at_ : timestamp option) () =
  ({ lookup_table_arn = lookup_table_arn_; created_at = created_at_ }
    : create_lookup_table_response)

let make_create_lookup_table_request ?description:(description_ : lookup_table_description option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ?tags:(tags_ : tags option)
    ~lookup_table_name:(lookup_table_name_ : lookup_table_name)
    ~table_body:(table_body_ : table_body) () =
  ({
     lookup_table_name = lookup_table_name_;
     description = description_;
     table_body = table_body_;
     kms_key_id = kms_key_id_;
     tags = tags_;
   }
    : create_lookup_table_request)

let make_create_scheduled_query_response ?scheduled_query_arn:(scheduled_query_arn_ : arn option)
    ?state:(state_ : scheduled_query_state option) () =
  ({ scheduled_query_arn = scheduled_query_arn_; state = state_ } : create_scheduled_query_response)

let make_s3_configuration ?owner_account_id:(owner_account_id_ : account_id option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ~destination_identifier:(destination_identifier_ : s3_uri) ~role_arn:(role_arn_ : role_arn) () =
  ({
     destination_identifier = destination_identifier_;
     role_arn = role_arn_;
     owner_account_id = owner_account_id_;
     kms_key_id = kms_key_id_;
   }
    : s3_configuration)

let make_destination_configuration ~s3_configuration:(s3_configuration_ : s3_configuration) () =
  ({ s3_configuration = s3_configuration_ } : destination_configuration)

let make_create_scheduled_query_request
    ?description:(description_ : scheduled_query_description option)
    ?log_group_identifiers:(log_group_identifiers_ : scheduled_query_log_group_identifiers option)
    ?timezone:(timezone_ : schedule_timezone option)
    ?start_time_offset:(start_time_offset_ : start_time_offset option)
    ?end_time_offset:(end_time_offset_ : end_time_offset option)
    ?destination_configuration:(destination_configuration_ : destination_configuration option)
    ?schedule_start_time:(schedule_start_time_ : timestamp option)
    ?schedule_end_time:(schedule_end_time_ : timestamp option)
    ?state:(state_ : scheduled_query_state option) ?tags:(tags_ : tags option)
    ~name:(name_ : scheduled_query_name) ~query_language:(query_language_ : query_language)
    ~query_string:(query_string_ : query_string)
    ~schedule_expression:(schedule_expression_ : schedule_expression)
    ~execution_role_arn:(execution_role_arn_ : role_arn) () =
  ({
     name = name_;
     description = description_;
     query_language = query_language_;
     query_string = query_string_;
     log_group_identifiers = log_group_identifiers_;
     schedule_expression = schedule_expression_;
     timezone = timezone_;
     start_time_offset = start_time_offset_;
     end_time_offset = end_time_offset_;
     destination_configuration = destination_configuration_;
     schedule_start_time = schedule_start_time_;
     schedule_end_time = schedule_end_time_;
     execution_role_arn = execution_role_arn_;
     state = state_;
     tags = tags_;
   }
    : create_scheduled_query_request)

let make_data_source_filter ?type_:(type__ : data_source_type option)
    ~name:(name_ : data_source_name) () =
  ({ name = name_; type_ = type__ } : data_source_filter)

let make_date_time_converter ?target_format:(target_format_ : target_format option)
    ?source_timezone:(source_timezone_ : source_timezone option)
    ?target_timezone:(target_timezone_ : target_timezone option) ?locale:(locale_ : locale option)
    ~source:(source_ : source) ~target:(target_ : target)
    ~match_patterns:(match_patterns_ : match_patterns) () =
  ({
     source = source_;
     target = target_;
     target_format = target_format_;
     match_patterns = match_patterns_;
     source_timezone = source_timezone_;
     target_timezone = target_timezone_;
     locale = locale_;
   }
    : date_time_converter)

let make_delete_account_policy_request ~policy_name:(policy_name_ : policy_name)
    ~policy_type:(policy_type_ : policy_type) () =
  ({ policy_name = policy_name_; policy_type = policy_type_ } : delete_account_policy_request)

let make_delete_data_protection_policy_request
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier) () =
  ({ log_group_identifier = log_group_identifier_ } : delete_data_protection_policy_request)

let make_delete_delivery_request ~id:(id_ : delivery_id) () =
  ({ id = id_ } : delete_delivery_request)

let make_delete_delivery_destination_request ~name:(name_ : delivery_destination_name) () =
  ({ name = name_ } : delete_delivery_destination_request)

let make_delete_delivery_destination_policy_request
    ~delivery_destination_name:(delivery_destination_name_ : delivery_destination_name) () =
  ({ delivery_destination_name = delivery_destination_name_ }
    : delete_delivery_destination_policy_request)

let make_delete_delivery_source_request ~name:(name_ : delivery_source_name) () =
  ({ name = name_ } : delete_delivery_source_request)

let make_delete_destination_request ~destination_name:(destination_name_ : destination_name) () =
  ({ destination_name = destination_name_ } : delete_destination_request)

let make_delete_index_policy_response () = (() : unit)

let make_delete_index_policy_request
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier) () =
  ({ log_group_identifier = log_group_identifier_ } : delete_index_policy_request)

let make_delete_integration_response () = (() : unit)

let make_delete_integration_request ?force:(force_ : force option)
    ~integration_name:(integration_name_ : integration_name) () =
  ({ integration_name = integration_name_; force = force_ } : delete_integration_request)

let make_delete_keys ~with_keys:(with_keys_ : delete_with_keys) () =
  ({ with_keys = with_keys_ } : delete_keys)

let make_delete_log_anomaly_detector_request
    ~anomaly_detector_arn:(anomaly_detector_arn_ : anomaly_detector_arn) () =
  ({ anomaly_detector_arn = anomaly_detector_arn_ } : delete_log_anomaly_detector_request)

let make_delete_log_group_request ~log_group_name:(log_group_name_ : log_group_name) () =
  ({ log_group_name = log_group_name_ } : delete_log_group_request)

let make_delete_log_stream_request ~log_group_name:(log_group_name_ : log_group_name)
    ~log_stream_name:(log_stream_name_ : log_stream_name) () =
  ({ log_group_name = log_group_name_; log_stream_name = log_stream_name_ }
    : delete_log_stream_request)

let make_delete_lookup_table_request ~lookup_table_arn:(lookup_table_arn_ : arn) () =
  ({ lookup_table_arn = lookup_table_arn_ } : delete_lookup_table_request)

let make_delete_metric_filter_request ~log_group_name:(log_group_name_ : log_group_name)
    ~filter_name:(filter_name_ : filter_name) () =
  ({ log_group_name = log_group_name_; filter_name = filter_name_ } : delete_metric_filter_request)

let make_delete_query_definition_response ?success:(success_ : success option) () =
  ({ success = success_ } : delete_query_definition_response)

let make_delete_query_definition_request ~query_definition_id:(query_definition_id_ : query_id) () =
  ({ query_definition_id = query_definition_id_ } : delete_query_definition_request)

let make_delete_resource_policy_request ?policy_name:(policy_name_ : policy_name option)
    ?resource_arn:(resource_arn_ : arn option)
    ?expected_revision_id:(expected_revision_id_ : expected_revision_id option) () =
  ({
     policy_name = policy_name_;
     resource_arn = resource_arn_;
     expected_revision_id = expected_revision_id_;
   }
    : delete_resource_policy_request)

let make_delete_retention_policy_request ~log_group_name:(log_group_name_ : log_group_name) () =
  ({ log_group_name = log_group_name_ } : delete_retention_policy_request)

let make_delete_scheduled_query_response () = (() : unit)

let make_delete_scheduled_query_request ~identifier:(identifier_ : scheduled_query_identifier) () =
  ({ identifier = identifier_ } : delete_scheduled_query_request)

let make_delete_subscription_filter_request ~log_group_name:(log_group_name_ : log_group_name)
    ~filter_name:(filter_name_ : filter_name) () =
  ({ log_group_name = log_group_name_; filter_name = filter_name_ }
    : delete_subscription_filter_request)

let make_delete_syslog_configuration_request
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier) () =
  ({ log_group_identifier = log_group_identifier_; vpc_endpoint_id = vpc_endpoint_id_ }
    : delete_syslog_configuration_request)

let make_delete_transformer_request
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier) () =
  ({ log_group_identifier = log_group_identifier_ } : delete_transformer_request)

let make_delivery_destination_configuration
    ~destination_resource_arn:(destination_resource_arn_ : arn) () =
  ({ destination_resource_arn = destination_resource_arn_ } : delivery_destination_configuration)

let make_delivery_destination ?name:(name_ : delivery_destination_name option)
    ?arn:(arn_ : arn option)
    ?delivery_destination_type:(delivery_destination_type_ : delivery_destination_type option)
    ?output_format:(output_format_ : output_format option)
    ?delivery_destination_configuration:
      (delivery_destination_configuration_ : delivery_destination_configuration option)
    ?tags:(tags_ : tags option) () =
  ({
     name = name_;
     arn = arn_;
     delivery_destination_type = delivery_destination_type_;
     output_format = output_format_;
     delivery_destination_configuration = delivery_destination_configuration_;
     tags = tags_;
   }
    : delivery_destination)

let make_delivery_source ?name:(name_ : delivery_source_name option) ?arn:(arn_ : arn option)
    ?resource_arns:(resource_arns_ : resource_arns option) ?service:(service_ : service option)
    ?log_type:(log_type_ : log_type option) ?tags:(tags_ : tags option)
    ?delivery_source_configuration:
      (delivery_source_configuration_ : delivery_source_configuration option)
    ?status:(status_ : delivery_source_status option)
    ?status_reason:(status_reason_ : delivery_source_status_reason option) () =
  ({
     name = name_;
     arn = arn_;
     resource_arns = resource_arns_;
     service = service_;
     log_type = log_type_;
     tags = tags_;
     delivery_source_configuration = delivery_source_configuration_;
     status = status_;
     status_reason = status_reason_;
   }
    : delivery_source)

let make_describe_account_policies_response
    ?account_policies:(account_policies_ : account_policies option)
    ?next_token:(next_token_ : next_token option) () =
  ({ account_policies = account_policies_; next_token = next_token_ }
    : describe_account_policies_response)

let make_describe_account_policies_request ?policy_name:(policy_name_ : policy_name option)
    ?account_identifiers:(account_identifiers_ : account_ids option)
    ?next_token:(next_token_ : next_token option) ~policy_type:(policy_type_ : policy_type) () =
  ({
     policy_type = policy_type_;
     policy_name = policy_name_;
     account_identifiers = account_identifiers_;
     next_token = next_token_;
   }
    : describe_account_policies_request)

let make_describe_configuration_templates_response
    ?configuration_templates:(configuration_templates_ : configuration_templates option)
    ?next_token:(next_token_ : next_token option) () =
  ({ configuration_templates = configuration_templates_; next_token = next_token_ }
    : describe_configuration_templates_response)

let make_describe_configuration_templates_request ?service:(service_ : service option)
    ?log_types:(log_types_ : log_types option)
    ?resource_types:(resource_types_ : resource_types option)
    ?delivery_destination_types:(delivery_destination_types_ : delivery_destination_types option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : describe_limit option) () =
  ({
     service = service_;
     log_types = log_types_;
     resource_types = resource_types_;
     delivery_destination_types = delivery_destination_types_;
     next_token = next_token_;
     limit = limit_;
   }
    : describe_configuration_templates_request)

let make_describe_deliveries_response ?deliveries:(deliveries_ : deliveries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ deliveries = deliveries_; next_token = next_token_ } : describe_deliveries_response)

let make_describe_deliveries_request ?next_token:(next_token_ : next_token option)
    ?limit:(limit_ : describe_limit option) () =
  ({ next_token = next_token_; limit = limit_ } : describe_deliveries_request)

let make_describe_delivery_destinations_response
    ?delivery_destinations:(delivery_destinations_ : delivery_destinations option)
    ?next_token:(next_token_ : next_token option) () =
  ({ delivery_destinations = delivery_destinations_; next_token = next_token_ }
    : describe_delivery_destinations_response)

let make_describe_delivery_destinations_request ?next_token:(next_token_ : next_token option)
    ?limit:(limit_ : describe_limit option) () =
  ({ next_token = next_token_; limit = limit_ } : describe_delivery_destinations_request)

let make_describe_delivery_sources_response
    ?delivery_sources:(delivery_sources_ : delivery_sources option)
    ?next_token:(next_token_ : next_token option) () =
  ({ delivery_sources = delivery_sources_; next_token = next_token_ }
    : describe_delivery_sources_response)

let make_describe_delivery_sources_request ?next_token:(next_token_ : next_token option)
    ?limit:(limit_ : describe_limit option) () =
  ({ next_token = next_token_; limit = limit_ } : describe_delivery_sources_request)

let make_destination ?destination_name:(destination_name_ : destination_name option)
    ?target_arn:(target_arn_ : target_arn option) ?role_arn:(role_arn_ : role_arn option)
    ?access_policy:(access_policy_ : access_policy option) ?arn:(arn_ : arn option)
    ?creation_time:(creation_time_ : timestamp option) () =
  ({
     destination_name = destination_name_;
     target_arn = target_arn_;
     role_arn = role_arn_;
     access_policy = access_policy_;
     arn = arn_;
     creation_time = creation_time_;
   }
    : destination)

let make_describe_destinations_response ?destinations:(destinations_ : destinations option)
    ?next_token:(next_token_ : next_token option) () =
  ({ destinations = destinations_; next_token = next_token_ } : describe_destinations_response)

let make_describe_destinations_request
    ?destination_name_prefix:(destination_name_prefix_ : destination_name option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : describe_limit option) () =
  ({ destination_name_prefix = destination_name_prefix_; next_token = next_token_; limit = limit_ }
    : describe_destinations_request)

let make_export_task_execution_info ?creation_time:(creation_time_ : timestamp option)
    ?completion_time:(completion_time_ : timestamp option) () =
  ({ creation_time = creation_time_; completion_time = completion_time_ }
    : export_task_execution_info)

let make_export_task_status ?code:(code_ : export_task_status_code option)
    ?message:(message_ : export_task_status_message option) () =
  ({ code = code_; message = message_ } : export_task_status)

let make_export_task ?task_id:(task_id_ : export_task_id option)
    ?task_name:(task_name_ : export_task_name option)
    ?log_group_name:(log_group_name_ : log_group_name option) ?from_:(from__ : timestamp option)
    ?to_:(to__ : timestamp option) ?destination:(destination_ : export_destination_bucket option)
    ?destination_prefix:(destination_prefix_ : export_destination_prefix option)
    ?status:(status_ : export_task_status option)
    ?execution_info:(execution_info_ : export_task_execution_info option) () =
  ({
     task_id = task_id_;
     task_name = task_name_;
     log_group_name = log_group_name_;
     from_ = from__;
     to_ = to__;
     destination = destination_;
     destination_prefix = destination_prefix_;
     status = status_;
     execution_info = execution_info_;
   }
    : export_task)

let make_describe_export_tasks_response ?export_tasks:(export_tasks_ : export_tasks option)
    ?next_token:(next_token_ : next_token option) () =
  ({ export_tasks = export_tasks_; next_token = next_token_ } : describe_export_tasks_response)

let make_describe_export_tasks_request ?task_id:(task_id_ : export_task_id option)
    ?status_code:(status_code_ : export_task_status_code option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : describe_limit option) () =
  ({ task_id = task_id_; status_code = status_code_; next_token = next_token_; limit = limit_ }
    : describe_export_tasks_request)

let make_field_index ?log_group_identifier:(log_group_identifier_ : log_group_identifier option)
    ?field_index_name:(field_index_name_ : field_index_name option)
    ?last_scan_time:(last_scan_time_ : timestamp option)
    ?first_event_time:(first_event_time_ : timestamp option)
    ?last_event_time:(last_event_time_ : timestamp option) ?type_:(type__ : index_type option) () =
  ({
     log_group_identifier = log_group_identifier_;
     field_index_name = field_index_name_;
     last_scan_time = last_scan_time_;
     first_event_time = first_event_time_;
     last_event_time = last_event_time_;
     type_ = type__;
   }
    : field_index)

let make_describe_field_indexes_response ?field_indexes:(field_indexes_ : field_indexes option)
    ?next_token:(next_token_ : next_token option) () =
  ({ field_indexes = field_indexes_; next_token = next_token_ } : describe_field_indexes_response)

let make_describe_field_indexes_request ?next_token:(next_token_ : next_token option)
    ~log_group_identifiers:(log_group_identifiers_ : describe_field_indexes_log_group_identifiers)
    () =
  ({ log_group_identifiers = log_group_identifiers_; next_token = next_token_ }
    : describe_field_indexes_request)

let make_import_batch ?error_message:(error_message_ : error_message option)
    ~batch_id:(batch_id_ : batch_id) ~status:(status_ : import_status) () =
  ({ batch_id = batch_id_; status = status_; error_message = error_message_ } : import_batch)

let make_describe_import_task_batches_response ?import_source_arn:(import_source_arn_ : arn option)
    ?import_id:(import_id_ : import_id option)
    ?import_batches:(import_batches_ : import_batch_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     import_source_arn = import_source_arn_;
     import_id = import_id_;
     import_batches = import_batches_;
     next_token = next_token_;
   }
    : describe_import_task_batches_response)

let make_describe_import_task_batches_request
    ?batch_import_status:(batch_import_status_ : import_status_list option)
    ?limit:(limit_ : describe_limit option) ?next_token:(next_token_ : next_token option)
    ~import_id:(import_id_ : import_id) () =
  ({
     import_id = import_id_;
     batch_import_status = batch_import_status_;
     limit = limit_;
     next_token = next_token_;
   }
    : describe_import_task_batches_request)

let make_import ?import_id:(import_id_ : import_id option)
    ?import_source_arn:(import_source_arn_ : arn option)
    ?import_status:(import_status_ : import_status option)
    ?import_destination_arn:(import_destination_arn_ : arn option)
    ?import_statistics:(import_statistics_ : import_statistics option)
    ?import_filter:(import_filter_ : import_filter option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?error_message:(error_message_ : error_message option) () =
  ({
     import_id = import_id_;
     import_source_arn = import_source_arn_;
     import_status = import_status_;
     import_destination_arn = import_destination_arn_;
     import_statistics = import_statistics_;
     import_filter = import_filter_;
     creation_time = creation_time_;
     last_updated_time = last_updated_time_;
     error_message = error_message_;
   }
    : import)

let make_describe_import_tasks_response ?imports:(imports_ : import_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ imports = imports_; next_token = next_token_ } : describe_import_tasks_response)

let make_describe_import_tasks_request ?import_id:(import_id_ : import_id option)
    ?import_status:(import_status_ : import_status option)
    ?import_source_arn:(import_source_arn_ : arn option) ?limit:(limit_ : describe_limit option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     import_id = import_id_;
     import_status = import_status_;
     import_source_arn = import_source_arn_;
     limit = limit_;
     next_token = next_token_;
   }
    : describe_import_tasks_request)

let make_index_policy ?log_group_identifier:(log_group_identifier_ : log_group_identifier option)
    ?last_update_time:(last_update_time_ : timestamp option)
    ?policy_document:(policy_document_ : policy_document option)
    ?policy_name:(policy_name_ : policy_name option) ?source:(source_ : index_source option) () =
  ({
     log_group_identifier = log_group_identifier_;
     last_update_time = last_update_time_;
     policy_document = policy_document_;
     policy_name = policy_name_;
     source = source_;
   }
    : index_policy)

let make_describe_index_policies_response ?index_policies:(index_policies_ : index_policies option)
    ?next_token:(next_token_ : next_token option) () =
  ({ index_policies = index_policies_; next_token = next_token_ }
    : describe_index_policies_response)

let make_describe_index_policies_request ?next_token:(next_token_ : next_token option)
    ~log_group_identifiers:(log_group_identifiers_ : describe_index_policies_log_group_identifiers)
    () =
  ({ log_group_identifiers = log_group_identifiers_; next_token = next_token_ }
    : describe_index_policies_request)

let make_log_group ?log_group_name:(log_group_name_ : log_group_name option)
    ?creation_time:(creation_time_ : timestamp option)
    ?retention_in_days:(retention_in_days_ : days option)
    ?metric_filter_count:(metric_filter_count_ : filter_count option) ?arn:(arn_ : arn option)
    ?stored_bytes:(stored_bytes_ : stored_bytes option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?data_protection_status:(data_protection_status_ : data_protection_status option)
    ?inherited_properties:(inherited_properties_ : inherited_properties option)
    ?log_group_class:(log_group_class_ : log_group_class option)
    ?log_group_arn:(log_group_arn_ : arn option)
    ?deletion_protection_enabled:(deletion_protection_enabled_ : deletion_protection_enabled option)
    ?bearer_token_authentication_enabled:
      (bearer_token_authentication_enabled_ : bearer_token_authentication_enabled option) () =
  ({
     log_group_name = log_group_name_;
     creation_time = creation_time_;
     retention_in_days = retention_in_days_;
     metric_filter_count = metric_filter_count_;
     arn = arn_;
     stored_bytes = stored_bytes_;
     kms_key_id = kms_key_id_;
     data_protection_status = data_protection_status_;
     inherited_properties = inherited_properties_;
     log_group_class = log_group_class_;
     log_group_arn = log_group_arn_;
     deletion_protection_enabled = deletion_protection_enabled_;
     bearer_token_authentication_enabled = bearer_token_authentication_enabled_;
   }
    : log_group)

let make_describe_log_groups_response ?log_groups:(log_groups_ : log_groups option)
    ?next_token:(next_token_ : next_token option) () =
  ({ log_groups = log_groups_; next_token = next_token_ } : describe_log_groups_response)

let make_describe_log_groups_request
    ?account_identifiers:(account_identifiers_ : account_ids option)
    ?log_group_name_prefix:(log_group_name_prefix_ : log_group_name option)
    ?log_group_name_pattern:(log_group_name_pattern_ : log_group_name_pattern option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : describe_limit option)
    ?include_linked_accounts:(include_linked_accounts_ : include_linked_accounts option)
    ?log_group_class:(log_group_class_ : log_group_class option)
    ?log_group_identifiers:
      (log_group_identifiers_ : describe_log_groups_log_group_identifiers option) () =
  ({
     account_identifiers = account_identifiers_;
     log_group_name_prefix = log_group_name_prefix_;
     log_group_name_pattern = log_group_name_pattern_;
     next_token = next_token_;
     limit = limit_;
     include_linked_accounts = include_linked_accounts_;
     log_group_class = log_group_class_;
     log_group_identifiers = log_group_identifiers_;
   }
    : describe_log_groups_request)

let make_log_stream ?log_stream_name:(log_stream_name_ : log_stream_name option)
    ?creation_time:(creation_time_ : timestamp option)
    ?first_event_timestamp:(first_event_timestamp_ : timestamp option)
    ?last_event_timestamp:(last_event_timestamp_ : timestamp option)
    ?last_ingestion_time:(last_ingestion_time_ : timestamp option)
    ?upload_sequence_token:(upload_sequence_token_ : sequence_token option) ?arn:(arn_ : arn option)
    ?stored_bytes:(stored_bytes_ : stored_bytes option) () =
  ({
     log_stream_name = log_stream_name_;
     creation_time = creation_time_;
     first_event_timestamp = first_event_timestamp_;
     last_event_timestamp = last_event_timestamp_;
     last_ingestion_time = last_ingestion_time_;
     upload_sequence_token = upload_sequence_token_;
     arn = arn_;
     stored_bytes = stored_bytes_;
   }
    : log_stream)

let make_describe_log_streams_response ?log_streams:(log_streams_ : log_streams option)
    ?next_token:(next_token_ : next_token option) () =
  ({ log_streams = log_streams_; next_token = next_token_ } : describe_log_streams_response)

let make_describe_log_streams_request ?log_group_name:(log_group_name_ : log_group_name option)
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option)
    ?log_stream_name_prefix:(log_stream_name_prefix_ : log_stream_name option)
    ?order_by:(order_by_ : order_by option) ?descending:(descending_ : descending option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : describe_limit option) () =
  ({
     log_group_name = log_group_name_;
     log_group_identifier = log_group_identifier_;
     log_stream_name_prefix = log_stream_name_prefix_;
     order_by = order_by_;
     descending = descending_;
     next_token = next_token_;
     limit = limit_;
   }
    : describe_log_streams_request)

let make_lookup_table ?lookup_table_arn:(lookup_table_arn_ : arn option)
    ?lookup_table_name:(lookup_table_name_ : lookup_table_name option)
    ?description:(description_ : lookup_table_description option)
    ?table_fields:(table_fields_ : table_fields option)
    ?records_count:(records_count_ : records_count option)
    ?size_bytes:(size_bytes_ : stored_bytes option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) () =
  ({
     lookup_table_arn = lookup_table_arn_;
     lookup_table_name = lookup_table_name_;
     description = description_;
     table_fields = table_fields_;
     records_count = records_count_;
     size_bytes = size_bytes_;
     last_updated_time = last_updated_time_;
     kms_key_id = kms_key_id_;
   }
    : lookup_table)

let make_describe_lookup_tables_response ?lookup_tables:(lookup_tables_ : lookup_tables option)
    ?next_token:(next_token_ : next_token option) () =
  ({ lookup_tables = lookup_tables_; next_token = next_token_ } : describe_lookup_tables_response)

let make_describe_lookup_tables_request
    ?lookup_table_name_prefix:(lookup_table_name_prefix_ : lookup_table_name option)
    ?max_results:(max_results_ : describe_lookup_tables_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     lookup_table_name_prefix = lookup_table_name_prefix_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_lookup_tables_request)

let make_metric_transformation ?default_value:(default_value_ : default_value option)
    ?dimensions:(dimensions_ : dimensions option) ?unit_:(unit__ : standard_unit option)
    ~metric_name:(metric_name_ : metric_name)
    ~metric_namespace:(metric_namespace_ : metric_namespace)
    ~metric_value:(metric_value_ : metric_value) () =
  ({
     metric_name = metric_name_;
     metric_namespace = metric_namespace_;
     metric_value = metric_value_;
     default_value = default_value_;
     dimensions = dimensions_;
     unit_ = unit__;
   }
    : metric_transformation)

let make_metric_filter ?filter_name:(filter_name_ : filter_name option)
    ?filter_pattern:(filter_pattern_ : filter_pattern option)
    ?metric_transformations:(metric_transformations_ : metric_transformations option)
    ?creation_time:(creation_time_ : timestamp option)
    ?log_group_name:(log_group_name_ : log_group_name option)
    ?apply_on_transformed_logs:(apply_on_transformed_logs_ : apply_on_transformed_logs option)
    ?field_selection_criteria:(field_selection_criteria_ : field_selection_criteria option)
    ?emit_system_field_dimensions:(emit_system_field_dimensions_ : emit_system_fields option) () =
  ({
     filter_name = filter_name_;
     filter_pattern = filter_pattern_;
     metric_transformations = metric_transformations_;
     creation_time = creation_time_;
     log_group_name = log_group_name_;
     apply_on_transformed_logs = apply_on_transformed_logs_;
     field_selection_criteria = field_selection_criteria_;
     emit_system_field_dimensions = emit_system_field_dimensions_;
   }
    : metric_filter)

let make_describe_metric_filters_response ?metric_filters:(metric_filters_ : metric_filters option)
    ?next_token:(next_token_ : next_token option) () =
  ({ metric_filters = metric_filters_; next_token = next_token_ }
    : describe_metric_filters_response)

let make_describe_metric_filters_request ?log_group_name:(log_group_name_ : log_group_name option)
    ?filter_name_prefix:(filter_name_prefix_ : filter_name option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : describe_limit option)
    ?metric_name:(metric_name_ : metric_name option)
    ?metric_namespace:(metric_namespace_ : metric_namespace option) () =
  ({
     log_group_name = log_group_name_;
     filter_name_prefix = filter_name_prefix_;
     next_token = next_token_;
     limit = limit_;
     metric_name = metric_name_;
     metric_namespace = metric_namespace_;
   }
    : describe_metric_filters_request)

let make_query_info ?query_language:(query_language_ : query_language option)
    ?query_id:(query_id_ : query_id option) ?query_string:(query_string_ : query_string option)
    ?status:(status_ : query_status option) ?create_time:(create_time_ : timestamp option)
    ?log_group_name:(log_group_name_ : log_group_name option)
    ?query_duration:(query_duration_ : query_duration option)
    ?bytes_scanned:(bytes_scanned_ : bytes_scanned_value option)
    ?user_identity:(user_identity_ : user_identity option) () =
  ({
     query_language = query_language_;
     query_id = query_id_;
     query_string = query_string_;
     status = status_;
     create_time = create_time_;
     log_group_name = log_group_name_;
     query_duration = query_duration_;
     bytes_scanned = bytes_scanned_;
     user_identity = user_identity_;
   }
    : query_info)

let make_describe_queries_response ?queries:(queries_ : query_info_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ queries = queries_; next_token = next_token_ } : describe_queries_response)

let make_describe_queries_request ?log_group_name:(log_group_name_ : log_group_name option)
    ?status:(status_ : query_status option)
    ?max_results:(max_results_ : describe_queries_max_results option)
    ?next_token:(next_token_ : next_token option)
    ?query_language:(query_language_ : query_language option) () =
  ({
     log_group_name = log_group_name_;
     status = status_;
     max_results = max_results_;
     next_token = next_token_;
     query_language = query_language_;
   }
    : describe_queries_request)

let make_query_parameter ?default_value:(default_value_ : query_parameter_default_value option)
    ?description:(description_ : query_parameter_description option)
    ~name:(name_ : query_parameter_name) () =
  ({ name = name_; default_value = default_value_; description = description_ } : query_parameter)

let make_query_definition ?query_language:(query_language_ : query_language option)
    ?query_definition_id:(query_definition_id_ : query_id option)
    ?name:(name_ : query_definition_name option)
    ?query_string:(query_string_ : query_definition_string option)
    ?last_modified:(last_modified_ : timestamp option)
    ?log_group_names:(log_group_names_ : log_group_names option)
    ?parameters:(parameters_ : query_parameter_list option) () =
  ({
     query_language = query_language_;
     query_definition_id = query_definition_id_;
     name = name_;
     query_string = query_string_;
     last_modified = last_modified_;
     log_group_names = log_group_names_;
     parameters = parameters_;
   }
    : query_definition)

let make_describe_query_definitions_response
    ?query_definitions:(query_definitions_ : query_definition_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ query_definitions = query_definitions_; next_token = next_token_ }
    : describe_query_definitions_response)

let make_describe_query_definitions_request
    ?query_language:(query_language_ : query_language option)
    ?query_definition_name_prefix:(query_definition_name_prefix_ : query_definition_name option)
    ?max_results:(max_results_ : query_list_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     query_language = query_language_;
     query_definition_name_prefix = query_definition_name_prefix_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_query_definitions_request)

let make_resource_policy ?policy_name:(policy_name_ : policy_name option)
    ?policy_document:(policy_document_ : policy_document option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?policy_scope:(policy_scope_ : policy_scope option) ?resource_arn:(resource_arn_ : arn option)
    ?revision_id:(revision_id_ : expected_revision_id option) () =
  ({
     policy_name = policy_name_;
     policy_document = policy_document_;
     last_updated_time = last_updated_time_;
     policy_scope = policy_scope_;
     resource_arn = resource_arn_;
     revision_id = revision_id_;
   }
    : resource_policy)

let make_describe_resource_policies_response
    ?resource_policies:(resource_policies_ : resource_policies option)
    ?next_token:(next_token_ : next_token option) () =
  ({ resource_policies = resource_policies_; next_token = next_token_ }
    : describe_resource_policies_response)

let make_describe_resource_policies_request ?next_token:(next_token_ : next_token option)
    ?limit:(limit_ : describe_limit option) ?resource_arn:(resource_arn_ : arn option)
    ?policy_scope:(policy_scope_ : policy_scope option) () =
  ({
     next_token = next_token_;
     limit = limit_;
     resource_arn = resource_arn_;
     policy_scope = policy_scope_;
   }
    : describe_resource_policies_request)

let make_subscription_filter ?filter_name:(filter_name_ : filter_name option)
    ?log_group_name:(log_group_name_ : log_group_name option)
    ?filter_pattern:(filter_pattern_ : filter_pattern option)
    ?destination_arn:(destination_arn_ : destination_arn option)
    ?role_arn:(role_arn_ : role_arn option) ?distribution:(distribution_ : distribution option)
    ?apply_on_transformed_logs:(apply_on_transformed_logs_ : apply_on_transformed_logs option)
    ?creation_time:(creation_time_ : timestamp option)
    ?field_selection_criteria:(field_selection_criteria_ : field_selection_criteria option)
    ?emit_system_fields:(emit_system_fields_ : emit_system_fields option) () =
  ({
     filter_name = filter_name_;
     log_group_name = log_group_name_;
     filter_pattern = filter_pattern_;
     destination_arn = destination_arn_;
     role_arn = role_arn_;
     distribution = distribution_;
     apply_on_transformed_logs = apply_on_transformed_logs_;
     creation_time = creation_time_;
     field_selection_criteria = field_selection_criteria_;
     emit_system_fields = emit_system_fields_;
   }
    : subscription_filter)

let make_describe_subscription_filters_response
    ?subscription_filters:(subscription_filters_ : subscription_filters option)
    ?next_token:(next_token_ : next_token option) () =
  ({ subscription_filters = subscription_filters_; next_token = next_token_ }
    : describe_subscription_filters_response)

let make_describe_subscription_filters_request
    ?filter_name_prefix:(filter_name_prefix_ : filter_name option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : describe_limit option)
    ~log_group_name:(log_group_name_ : log_group_name) () =
  ({
     log_group_name = log_group_name_;
     filter_name_prefix = filter_name_prefix_;
     next_token = next_token_;
     limit = limit_;
   }
    : describe_subscription_filters_request)

let make_disassociate_kms_key_request ?log_group_name:(log_group_name_ : log_group_name option)
    ?resource_identifier:(resource_identifier_ : resource_identifier option) () =
  ({ log_group_name = log_group_name_; resource_identifier = resource_identifier_ }
    : disassociate_kms_key_request)

let make_disassociate_source_from_s3_table_integration_response
    ?identifier:(identifier_ : s3_table_integration_source_identifier option) () =
  ({ identifier = identifier_ } : disassociate_source_from_s3_table_integration_response)

let make_disassociate_source_from_s3_table_integration_request
    ~identifier:(identifier_ : s3_table_integration_source_identifier) () =
  ({ identifier = identifier_ } : disassociate_source_from_s3_table_integration_request)

let make_entity ?key_attributes:(key_attributes_ : entity_key_attributes option)
    ?attributes:(attributes_ : entity_attributes option) () =
  ({ key_attributes = key_attributes_; attributes = attributes_ } : entity)

let make_fields_data ?data:(data_ : data option) () = ({ data = data_ } : fields_data)

let make_searched_log_stream ?log_stream_name:(log_stream_name_ : log_stream_name option)
    ?searched_completely:(searched_completely_ : log_stream_searched_completely option) () =
  ({ log_stream_name = log_stream_name_; searched_completely = searched_completely_ }
    : searched_log_stream)

let make_filtered_log_event ?log_stream_name:(log_stream_name_ : log_stream_name option)
    ?timestamp:(timestamp_ : timestamp option) ?message:(message_ : event_message option)
    ?ingestion_time:(ingestion_time_ : timestamp option) ?event_id:(event_id_ : event_id option) ()
    =
  ({
     log_stream_name = log_stream_name_;
     timestamp = timestamp_;
     message = message_;
     ingestion_time = ingestion_time_;
     event_id = event_id_;
   }
    : filtered_log_event)

let make_filter_log_events_response ?events:(events_ : filtered_log_events option)
    ?searched_log_streams:(searched_log_streams_ : searched_log_streams option)
    ?next_token:(next_token_ : next_token option) () =
  ({ events = events_; searched_log_streams = searched_log_streams_; next_token = next_token_ }
    : filter_log_events_response)

let make_filter_log_events_request ?log_group_name:(log_group_name_ : log_group_name option)
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option)
    ?log_stream_names:(log_stream_names_ : input_log_stream_names option)
    ?log_stream_name_prefix:(log_stream_name_prefix_ : log_stream_name option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?filter_pattern:(filter_pattern_ : filter_pattern option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : events_limit option)
    ?start_from_head:(start_from_head_ : start_from_head option)
    ?interleaved:(interleaved_ : interleaved option) ?unmask:(unmask_ : unmask option) () =
  ({
     log_group_name = log_group_name_;
     log_group_identifier = log_group_identifier_;
     log_stream_names = log_stream_names_;
     log_stream_name_prefix = log_stream_name_prefix_;
     start_time = start_time_;
     end_time = end_time_;
     filter_pattern = filter_pattern_;
     next_token = next_token_;
     limit = limit_;
     start_from_head = start_from_head_;
     interleaved = interleaved_;
     unmask = unmask_;
   }
    : filter_log_events_request)

let make_get_data_protection_policy_response
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option)
    ?policy_document:(policy_document_ : data_protection_policy_document option)
    ?last_updated_time:(last_updated_time_ : timestamp option) () =
  ({
     log_group_identifier = log_group_identifier_;
     policy_document = policy_document_;
     last_updated_time = last_updated_time_;
   }
    : get_data_protection_policy_response)

let make_get_data_protection_policy_request
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier) () =
  ({ log_group_identifier = log_group_identifier_ } : get_data_protection_policy_request)

let make_get_delivery_response ?delivery:(delivery_ : delivery option) () =
  ({ delivery = delivery_ } : get_delivery_response)

let make_get_delivery_request ~id:(id_ : delivery_id) () = ({ id = id_ } : get_delivery_request)

let make_get_delivery_destination_response
    ?delivery_destination:(delivery_destination_ : delivery_destination option) () =
  ({ delivery_destination = delivery_destination_ } : get_delivery_destination_response)

let make_get_delivery_destination_request ~name:(name_ : delivery_destination_name) () =
  ({ name = name_ } : get_delivery_destination_request)

let make_policy
    ?delivery_destination_policy:(delivery_destination_policy_ : delivery_destination_policy option)
    () =
  ({ delivery_destination_policy = delivery_destination_policy_ } : policy)

let make_get_delivery_destination_policy_response ?policy:(policy_ : policy option) () =
  ({ policy = policy_ } : get_delivery_destination_policy_response)

let make_get_delivery_destination_policy_request
    ~delivery_destination_name:(delivery_destination_name_ : delivery_destination_name) () =
  ({ delivery_destination_name = delivery_destination_name_ }
    : get_delivery_destination_policy_request)

let make_get_delivery_source_response ?delivery_source:(delivery_source_ : delivery_source option)
    () =
  ({ delivery_source = delivery_source_ } : get_delivery_source_response)

let make_get_delivery_source_request ~name:(name_ : delivery_source_name) () =
  ({ name = name_ } : get_delivery_source_request)

let make_open_search_resource_status ?status:(status_ : open_search_resource_status_type option)
    ?status_message:(status_message_ : integration_status_message option) () =
  ({ status = status_; status_message = status_message_ } : open_search_resource_status)

let make_open_search_lifecycle_policy ?policy_name:(policy_name_ : open_search_policy_name option)
    ?status:(status_ : open_search_resource_status option) () =
  ({ policy_name = policy_name_; status = status_ } : open_search_lifecycle_policy)

let make_open_search_data_access_policy ?policy_name:(policy_name_ : open_search_policy_name option)
    ?status:(status_ : open_search_resource_status option) () =
  ({ policy_name = policy_name_; status = status_ } : open_search_data_access_policy)

let make_open_search_network_policy ?policy_name:(policy_name_ : open_search_policy_name option)
    ?status:(status_ : open_search_resource_status option) () =
  ({ policy_name = policy_name_; status = status_ } : open_search_network_policy)

let make_open_search_encryption_policy ?policy_name:(policy_name_ : open_search_policy_name option)
    ?status:(status_ : open_search_resource_status option) () =
  ({ policy_name = policy_name_; status = status_ } : open_search_encryption_policy)

let make_open_search_workspace ?workspace_id:(workspace_id_ : open_search_workspace_id option)
    ?status:(status_ : open_search_resource_status option) () =
  ({ workspace_id = workspace_id_; status = status_ } : open_search_workspace)

let make_open_search_collection
    ?collection_endpoint:(collection_endpoint_ : open_search_collection_endpoint option)
    ?collection_arn:(collection_arn_ : arn option)
    ?status:(status_ : open_search_resource_status option) () =
  ({
     collection_endpoint = collection_endpoint_;
     collection_arn = collection_arn_;
     status = status_;
   }
    : open_search_collection)

let make_open_search_application
    ?application_endpoint:(application_endpoint_ : open_search_application_endpoint option)
    ?application_arn:(application_arn_ : arn option)
    ?application_id:(application_id_ : open_search_application_id option)
    ?status:(status_ : open_search_resource_status option) () =
  ({
     application_endpoint = application_endpoint_;
     application_arn = application_arn_;
     application_id = application_id_;
     status = status_;
   }
    : open_search_application)

let make_open_search_data_source
    ?data_source_name:(data_source_name_ : open_search_data_source_name option)
    ?status:(status_ : open_search_resource_status option) () =
  ({ data_source_name = data_source_name_; status = status_ } : open_search_data_source)

let make_open_search_integration_details
    ?data_source:(data_source_ : open_search_data_source option)
    ?application:(application_ : open_search_application option)
    ?collection:(collection_ : open_search_collection option)
    ?workspace:(workspace_ : open_search_workspace option)
    ?encryption_policy:(encryption_policy_ : open_search_encryption_policy option)
    ?network_policy:(network_policy_ : open_search_network_policy option)
    ?access_policy:(access_policy_ : open_search_data_access_policy option)
    ?lifecycle_policy:(lifecycle_policy_ : open_search_lifecycle_policy option) () =
  ({
     data_source = data_source_;
     application = application_;
     collection = collection_;
     workspace = workspace_;
     encryption_policy = encryption_policy_;
     network_policy = network_policy_;
     access_policy = access_policy_;
     lifecycle_policy = lifecycle_policy_;
   }
    : open_search_integration_details)

let make_get_integration_response ?integration_name:(integration_name_ : integration_name option)
    ?integration_type:(integration_type_ : integration_type option)
    ?integration_status:(integration_status_ : integration_status option)
    ?integration_details:(integration_details_ : integration_details option) () =
  ({
     integration_name = integration_name_;
     integration_type = integration_type_;
     integration_status = integration_status_;
     integration_details = integration_details_;
   }
    : get_integration_response)

let make_get_integration_request ~integration_name:(integration_name_ : integration_name) () =
  ({ integration_name = integration_name_ } : get_integration_request)

let make_get_log_anomaly_detector_response ?detector_name:(detector_name_ : detector_name option)
    ?log_group_arn_list:(log_group_arn_list_ : log_group_arn_list option)
    ?evaluation_frequency:(evaluation_frequency_ : evaluation_frequency option)
    ?filter_pattern:(filter_pattern_ : filter_pattern option)
    ?anomaly_detector_status:(anomaly_detector_status_ : anomaly_detector_status option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?creation_time_stamp:(creation_time_stamp_ : epoch_millis option)
    ?last_modified_time_stamp:(last_modified_time_stamp_ : epoch_millis option)
    ?anomaly_visibility_time:(anomaly_visibility_time_ : anomaly_visibility_time option) () =
  ({
     detector_name = detector_name_;
     log_group_arn_list = log_group_arn_list_;
     evaluation_frequency = evaluation_frequency_;
     filter_pattern = filter_pattern_;
     anomaly_detector_status = anomaly_detector_status_;
     kms_key_id = kms_key_id_;
     creation_time_stamp = creation_time_stamp_;
     last_modified_time_stamp = last_modified_time_stamp_;
     anomaly_visibility_time = anomaly_visibility_time_;
   }
    : get_log_anomaly_detector_response)

let make_get_log_anomaly_detector_request
    ~anomaly_detector_arn:(anomaly_detector_arn_ : anomaly_detector_arn) () =
  ({ anomaly_detector_arn = anomaly_detector_arn_ } : get_log_anomaly_detector_request)

let make_output_log_event ?timestamp:(timestamp_ : timestamp option)
    ?message:(message_ : event_message option) ?ingestion_time:(ingestion_time_ : timestamp option)
    () =
  ({ timestamp = timestamp_; message = message_; ingestion_time = ingestion_time_ }
    : output_log_event)

let make_get_log_events_response ?events:(events_ : output_log_events option)
    ?next_forward_token:(next_forward_token_ : next_token option)
    ?next_backward_token:(next_backward_token_ : next_token option) () =
  ({
     events = events_;
     next_forward_token = next_forward_token_;
     next_backward_token = next_backward_token_;
   }
    : get_log_events_response)

let make_get_log_events_request ?log_group_name:(log_group_name_ : log_group_name option)
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : events_limit option)
    ?start_from_head:(start_from_head_ : start_from_head option) ?unmask:(unmask_ : unmask option)
    ~log_stream_name:(log_stream_name_ : log_stream_name) () =
  ({
     log_group_name = log_group_name_;
     log_group_identifier = log_group_identifier_;
     log_stream_name = log_stream_name_;
     start_time = start_time_;
     end_time = end_time_;
     next_token = next_token_;
     limit = limit_;
     start_from_head = start_from_head_;
     unmask = unmask_;
   }
    : get_log_events_request)

let make_log_fields_list_item ?log_field_name:(log_field_name_ : log_field_name option)
    ?log_field_type:(log_field_type_ : log_field_type option) () =
  ({ log_field_name = log_field_name_; log_field_type = log_field_type_ } : log_fields_list_item)

let make_log_field_type ?type_:(type__ : data_type option)
    ?element:(element_ : log_field_type option) ?fields:(fields_ : log_fields_list option) () =
  ({ type_ = type__; element = element_; fields = fields_ } : log_field_type)

let make_get_log_fields_response ?log_fields:(log_fields_ : log_fields_list option) () =
  ({ log_fields = log_fields_ } : get_log_fields_response)

let make_get_log_fields_request ~data_source_name:(data_source_name_ : data_source_name)
    ~data_source_type:(data_source_type_ : data_source_type) () =
  ({ data_source_name = data_source_name_; data_source_type = data_source_type_ }
    : get_log_fields_request)

let make_log_group_field ?name:(name_ : field option) ?percent:(percent_ : percentage option) () =
  ({ name = name_; percent = percent_ } : log_group_field)

let make_get_log_group_fields_response
    ?log_group_fields:(log_group_fields_ : log_group_field_list option) () =
  ({ log_group_fields = log_group_fields_ } : get_log_group_fields_response)

let make_get_log_group_fields_request ?log_group_name:(log_group_name_ : log_group_name option)
    ?time:(time_ : timestamp option)
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option) () =
  ({ log_group_name = log_group_name_; time = time_; log_group_identifier = log_group_identifier_ }
    : get_log_group_fields_request)

let make_get_log_object_response
    ?field_stream:(field_stream_ : get_log_object_response_stream option) () =
  ({ field_stream = field_stream_ } : get_log_object_response)

let make_get_log_object_request ?unmask:(unmask_ : unmask option)
    ~log_object_pointer:(log_object_pointer_ : log_object_pointer) () =
  ({ unmask = unmask_; log_object_pointer = log_object_pointer_ } : get_log_object_request)

let make_get_log_record_response ?log_record:(log_record_ : log_record option) () =
  ({ log_record = log_record_ } : get_log_record_response)

let make_get_log_record_request ?unmask:(unmask_ : unmask option)
    ~log_record_pointer:(log_record_pointer_ : log_record_pointer) () =
  ({ log_record_pointer = log_record_pointer_; unmask = unmask_ } : get_log_record_request)

let make_get_lookup_table_response ?lookup_table_arn:(lookup_table_arn_ : arn option)
    ?lookup_table_name:(lookup_table_name_ : lookup_table_name option)
    ?description:(description_ : lookup_table_description option)
    ?table_body:(table_body_ : table_body option) ?size_bytes:(size_bytes_ : stored_bytes option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) () =
  ({
     lookup_table_arn = lookup_table_arn_;
     lookup_table_name = lookup_table_name_;
     description = description_;
     table_body = table_body_;
     size_bytes = size_bytes_;
     last_updated_time = last_updated_time_;
     kms_key_id = kms_key_id_;
   }
    : get_lookup_table_response)

let make_get_lookup_table_request ~lookup_table_arn:(lookup_table_arn_ : arn) () =
  ({ lookup_table_arn = lookup_table_arn_ } : get_lookup_table_request)

let make_query_statistics ?records_matched:(records_matched_ : stats_value option)
    ?records_scanned:(records_scanned_ : stats_value option)
    ?estimated_records_skipped:(estimated_records_skipped_ : stats_value option)
    ?bytes_scanned:(bytes_scanned_ : stats_value option)
    ?estimated_bytes_skipped:(estimated_bytes_skipped_ : stats_value option)
    ?log_groups_scanned:(log_groups_scanned_ : stats_value option) () =
  ({
     records_matched = records_matched_;
     records_scanned = records_scanned_;
     estimated_records_skipped = estimated_records_skipped_;
     bytes_scanned = bytes_scanned_;
     estimated_bytes_skipped = estimated_bytes_skipped_;
     log_groups_scanned = log_groups_scanned_;
   }
    : query_statistics)

let make_result_field ?field:(field_ : field option) ?value:(value_ : value option) () =
  ({ field = field_; value = value_ } : result_field)

let make_get_query_results_response ?query_language:(query_language_ : query_language option)
    ?results:(results_ : query_results option) ?statistics:(statistics_ : query_statistics option)
    ?status:(status_ : query_status option)
    ?encryption_key:(encryption_key_ : encryption_key option)
    ?next_token:(next_token_ : get_query_results_next_token option) () =
  ({
     query_language = query_language_;
     results = results_;
     statistics = statistics_;
     status = status_;
     encryption_key = encryption_key_;
     next_token = next_token_;
   }
    : get_query_results_response)

let make_get_query_results_request ?next_token:(next_token_ : get_query_results_next_token option)
    ?max_items:(max_items_ : get_query_results_max_items option) ~query_id:(query_id_ : query_id) ()
    =
  ({ query_id = query_id_; next_token = next_token_; max_items = max_items_ }
    : get_query_results_request)

let make_get_scheduled_query_response ?scheduled_query_arn:(scheduled_query_arn_ : arn option)
    ?name:(name_ : scheduled_query_name option)
    ?description:(description_ : scheduled_query_description option)
    ?query_language:(query_language_ : query_language option)
    ?query_string:(query_string_ : query_string option)
    ?log_group_identifiers:(log_group_identifiers_ : scheduled_query_log_group_identifiers option)
    ?schedule_expression:(schedule_expression_ : schedule_expression option)
    ?timezone:(timezone_ : schedule_timezone option)
    ?start_time_offset:(start_time_offset_ : start_time_offset option)
    ?end_time_offset:(end_time_offset_ : end_time_offset option)
    ?destination_configuration:(destination_configuration_ : destination_configuration option)
    ?state:(state_ : scheduled_query_state option)
    ?schedule_type:(schedule_type_ : schedule_type option)
    ?last_triggered_time:(last_triggered_time_ : timestamp option)
    ?last_execution_status:(last_execution_status_ : execution_status option)
    ?schedule_start_time:(schedule_start_time_ : timestamp option)
    ?schedule_end_time:(schedule_end_time_ : timestamp option)
    ?execution_role_arn:(execution_role_arn_ : role_arn option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_updated_time:(last_updated_time_ : timestamp option) () =
  ({
     scheduled_query_arn = scheduled_query_arn_;
     name = name_;
     description = description_;
     query_language = query_language_;
     query_string = query_string_;
     log_group_identifiers = log_group_identifiers_;
     schedule_expression = schedule_expression_;
     timezone = timezone_;
     start_time_offset = start_time_offset_;
     end_time_offset = end_time_offset_;
     destination_configuration = destination_configuration_;
     state = state_;
     schedule_type = schedule_type_;
     last_triggered_time = last_triggered_time_;
     last_execution_status = last_execution_status_;
     schedule_start_time = schedule_start_time_;
     schedule_end_time = schedule_end_time_;
     execution_role_arn = execution_role_arn_;
     creation_time = creation_time_;
     last_updated_time = last_updated_time_;
   }
    : get_scheduled_query_response)

let make_get_scheduled_query_request ~identifier:(identifier_ : scheduled_query_identifier) () =
  ({ identifier = identifier_ } : get_scheduled_query_request)

let make_scheduled_query_destination
    ?destination_type:(destination_type_ : scheduled_query_destination_type option)
    ?destination_identifier:(destination_identifier_ : string_ option)
    ?status:(status_ : action_status option)
    ?processed_identifier:(processed_identifier_ : string_ option)
    ?error_message:(error_message_ : string_ option) () =
  ({
     destination_type = destination_type_;
     destination_identifier = destination_identifier_;
     status = status_;
     processed_identifier = processed_identifier_;
     error_message = error_message_;
   }
    : scheduled_query_destination)

let make_trigger_history_record ?query_id:(query_id_ : query_id option)
    ?execution_status:(execution_status_ : execution_status option)
    ?triggered_timestamp:(triggered_timestamp_ : timestamp option)
    ?error_message:(error_message_ : string_ option)
    ?destinations:(destinations_ : scheduled_query_destination_list option) () =
  ({
     query_id = query_id_;
     execution_status = execution_status_;
     triggered_timestamp = triggered_timestamp_;
     error_message = error_message_;
     destinations = destinations_;
   }
    : trigger_history_record)

let make_get_scheduled_query_history_response ?name:(name_ : scheduled_query_name option)
    ?scheduled_query_arn:(scheduled_query_arn_ : arn option)
    ?trigger_history:(trigger_history_ : trigger_history_record_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     name = name_;
     scheduled_query_arn = scheduled_query_arn_;
     trigger_history = trigger_history_;
     next_token = next_token_;
   }
    : get_scheduled_query_history_response)

let make_get_scheduled_query_history_request
    ?execution_statuses:(execution_statuses_ : execution_status_list option)
    ?max_results:(max_results_ : get_scheduled_query_history_max_results option)
    ?next_token:(next_token_ : next_token option)
    ~identifier:(identifier_ : scheduled_query_identifier) ~start_time:(start_time_ : timestamp)
    ~end_time:(end_time_ : timestamp) () =
  ({
     identifier = identifier_;
     start_time = start_time_;
     end_time = end_time_;
     execution_statuses = execution_statuses_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : get_scheduled_query_history_request)

let make_upper_case_string ~with_keys:(with_keys_ : upper_case_string_with_keys) () =
  ({ with_keys = with_keys_ } : upper_case_string)

let make_type_converter_entry ~key:(key_ : key) ~type_:(type__ : type_) () =
  ({ key = key_; type_ = type__ } : type_converter_entry)

let make_type_converter ~entries:(entries_ : type_converter_entries) () =
  ({ entries = entries_ } : type_converter)

let make_trim_string ~with_keys:(with_keys_ : trim_string_with_keys) () =
  ({ with_keys = with_keys_ } : trim_string)

let make_substitute_string_entry ~source:(source_ : source) ~from_:(from__ : from_key)
    ~to_:(to__ : to_key) () =
  ({ source = source_; from_ = from__; to_ = to__ } : substitute_string_entry)

let make_substitute_string ~entries:(entries_ : substitute_string_entries) () =
  ({ entries = entries_ } : substitute_string)

let make_split_string_entry ~source:(source_ : source)
    ~delimiter:(delimiter_ : split_string_delimiter) () =
  ({ source = source_; delimiter = delimiter_ } : split_string_entry)

let make_split_string ~entries:(entries_ : split_string_entries) () =
  ({ entries = entries_ } : split_string)

let make_rename_key_entry ?overwrite_if_exists:(overwrite_if_exists_ : overwrite_if_exists option)
    ~key:(key_ : key) ~rename_to:(rename_to_ : rename_to) () =
  ({ key = key_; rename_to = rename_to_; overwrite_if_exists = overwrite_if_exists_ }
    : rename_key_entry)

let make_rename_keys ~entries:(entries_ : rename_key_entries) () =
  ({ entries = entries_ } : rename_keys)

let make_parse_wa_f ?source:(source_ : source option) () = ({ source = source_ } : parse_wa_f)
let make_parse_vp_c ?source:(source_ : source option) () = ({ source = source_ } : parse_vp_c)

let make_parse_postgres ?source:(source_ : source option) () =
  ({ source = source_ } : parse_postgres)

let make_parse_to_ocs_f ?source:(source_ : source option)
    ?mapping_version:(mapping_version_ : mapping_version option)
    ~event_source:(event_source_ : event_source) ~ocsf_version:(ocsf_version_ : ocsf_version) () =
  ({
     source = source_;
     event_source = event_source_;
     ocsf_version = ocsf_version_;
     mapping_version = mapping_version_;
   }
    : parse_to_ocs_f)

let make_parse_route53 ?source:(source_ : source option) () = ({ source = source_ } : parse_route53)

let make_parse_key_value ?source:(source_ : source option)
    ?destination:(destination_ : destination_field option)
    ?field_delimiter:(field_delimiter_ : parser_field_delimiter option)
    ?key_value_delimiter:(key_value_delimiter_ : key_value_delimiter option)
    ?key_prefix:(key_prefix_ : key_prefix option)
    ?non_match_value:(non_match_value_ : non_match_value option)
    ?overwrite_if_exists:(overwrite_if_exists_ : overwrite_if_exists option) () =
  ({
     source = source_;
     destination = destination_;
     field_delimiter = field_delimiter_;
     key_value_delimiter = key_value_delimiter_;
     key_prefix = key_prefix_;
     non_match_value = non_match_value_;
     overwrite_if_exists = overwrite_if_exists_;
   }
    : parse_key_value)

let make_parse_jso_n ?source:(source_ : source option)
    ?destination:(destination_ : destination_field option) () =
  ({ source = source_; destination = destination_ } : parse_jso_n)

let make_parse_cloudfront ?source:(source_ : source option) () =
  ({ source = source_ } : parse_cloudfront)

let make_move_key_entry ?overwrite_if_exists:(overwrite_if_exists_ : overwrite_if_exists option)
    ~source:(source_ : source) ~target:(target_ : target) () =
  ({ source = source_; target = target_; overwrite_if_exists = overwrite_if_exists_ }
    : move_key_entry)

let make_move_keys ~entries:(entries_ : move_key_entries) () = ({ entries = entries_ } : move_keys)

let make_lower_case_string ~with_keys:(with_keys_ : lower_case_string_with_keys) () =
  ({ with_keys = with_keys_ } : lower_case_string)

let make_list_to_map ?value_key:(value_key_ : value_key option) ?target:(target_ : target option)
    ?flatten:(flatten_ : flatten option)
    ?flattened_element:(flattened_element_ : flattened_element option) ~source:(source_ : source)
    ~key:(key_ : key) () =
  ({
     source = source_;
     key = key_;
     value_key = value_key_;
     target = target_;
     flatten = flatten_;
     flattened_element = flattened_element_;
   }
    : list_to_map)

let make_grok ?source:(source_ : source option) ~match_:(match__ : grok_match) () =
  ({ source = source_; match_ = match__ } : grok)

let make_processor ?add_keys:(add_keys_ : add_keys option)
    ?copy_value:(copy_value_ : copy_value option) ?csv:(csv_ : cs_v option)
    ?date_time_converter:(date_time_converter_ : date_time_converter option)
    ?delete_keys:(delete_keys_ : delete_keys option) ?grok:(grok_ : grok option)
    ?list_to_map:(list_to_map_ : list_to_map option)
    ?lower_case_string:(lower_case_string_ : lower_case_string option)
    ?move_keys:(move_keys_ : move_keys option)
    ?parse_cloudfront:(parse_cloudfront_ : parse_cloudfront option)
    ?parse_jso_n:(parse_jso_n_ : parse_jso_n option)
    ?parse_key_value:(parse_key_value_ : parse_key_value option)
    ?parse_route53:(parse_route53_ : parse_route53 option)
    ?parse_to_ocs_f:(parse_to_ocs_f_ : parse_to_ocs_f option)
    ?parse_postgres:(parse_postgres_ : parse_postgres option)
    ?parse_vp_c:(parse_vp_c_ : parse_vp_c option) ?parse_wa_f:(parse_wa_f_ : parse_wa_f option)
    ?rename_keys:(rename_keys_ : rename_keys option)
    ?split_string:(split_string_ : split_string option)
    ?substitute_string:(substitute_string_ : substitute_string option)
    ?trim_string:(trim_string_ : trim_string option)
    ?type_converter:(type_converter_ : type_converter option)
    ?upper_case_string:(upper_case_string_ : upper_case_string option) () =
  ({
     add_keys = add_keys_;
     copy_value = copy_value_;
     csv = csv_;
     date_time_converter = date_time_converter_;
     delete_keys = delete_keys_;
     grok = grok_;
     list_to_map = list_to_map_;
     lower_case_string = lower_case_string_;
     move_keys = move_keys_;
     parse_cloudfront = parse_cloudfront_;
     parse_jso_n = parse_jso_n_;
     parse_key_value = parse_key_value_;
     parse_route53 = parse_route53_;
     parse_to_ocs_f = parse_to_ocs_f_;
     parse_postgres = parse_postgres_;
     parse_vp_c = parse_vp_c_;
     parse_wa_f = parse_wa_f_;
     rename_keys = rename_keys_;
     split_string = split_string_;
     substitute_string = substitute_string_;
     trim_string = trim_string_;
     type_converter = type_converter_;
     upper_case_string = upper_case_string_;
   }
    : processor)

let make_get_transformer_response
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?transformer_config:(transformer_config_ : processors option) () =
  ({
     log_group_identifier = log_group_identifier_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     transformer_config = transformer_config_;
   }
    : get_transformer_response)

let make_get_transformer_request
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier) () =
  ({ log_group_identifier = log_group_identifier_ } : get_transformer_request)

let make_input_log_event ~timestamp:(timestamp_ : timestamp) ~message:(message_ : event_message) ()
    =
  ({ timestamp = timestamp_; message = message_ } : input_log_event)

let make_integration_summary ?integration_name:(integration_name_ : integration_name option)
    ?integration_type:(integration_type_ : integration_type option)
    ?integration_status:(integration_status_ : integration_status option) () =
  ({
     integration_name = integration_name_;
     integration_type = integration_type_;
     integration_status = integration_status_;
   }
    : integration_summary)

let make_list_aggregate_log_group_summaries_response
    ?aggregate_log_group_summaries:
      (aggregate_log_group_summaries_ : aggregate_log_group_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ aggregate_log_group_summaries = aggregate_log_group_summaries_; next_token = next_token_ }
    : list_aggregate_log_group_summaries_response)

let make_list_aggregate_log_group_summaries_request
    ?account_identifiers:(account_identifiers_ : account_ids option)
    ?include_linked_accounts:(include_linked_accounts_ : include_linked_accounts option)
    ?log_group_class:(log_group_class_ : log_group_class option)
    ?log_group_name_pattern:(log_group_name_pattern_ : log_group_name_regex_pattern option)
    ?data_sources:(data_sources_ : data_source_filters option)
    ?next_token:(next_token_ : next_token option)
    ?limit:(limit_ : list_log_groups_request_limit option)
    ~group_by:(group_by_ : list_aggregate_log_group_summaries_group_by) () =
  ({
     account_identifiers = account_identifiers_;
     include_linked_accounts = include_linked_accounts_;
     log_group_class = log_group_class_;
     log_group_name_pattern = log_group_name_pattern_;
     data_sources = data_sources_;
     group_by = group_by_;
     next_token = next_token_;
     limit = limit_;
   }
    : list_aggregate_log_group_summaries_request)

let make_list_anomalies_response ?anomalies:(anomalies_ : anomalies option)
    ?next_token:(next_token_ : next_token option) () =
  ({ anomalies = anomalies_; next_token = next_token_ } : list_anomalies_response)

let make_list_anomalies_request
    ?anomaly_detector_arn:(anomaly_detector_arn_ : anomaly_detector_arn option)
    ?suppression_state:(suppression_state_ : suppression_state option)
    ?limit:(limit_ : list_anomalies_limit option) ?next_token:(next_token_ : next_token option) () =
  ({
     anomaly_detector_arn = anomaly_detector_arn_;
     suppression_state = suppression_state_;
     limit = limit_;
     next_token = next_token_;
   }
    : list_anomalies_request)

let make_list_integrations_response
    ?integration_summaries:(integration_summaries_ : integration_summaries option) () =
  ({ integration_summaries = integration_summaries_ } : list_integrations_response)

let make_list_integrations_request
    ?integration_name_prefix:(integration_name_prefix_ : integration_name_prefix option)
    ?integration_type:(integration_type_ : integration_type option)
    ?integration_status:(integration_status_ : integration_status option) () =
  ({
     integration_name_prefix = integration_name_prefix_;
     integration_type = integration_type_;
     integration_status = integration_status_;
   }
    : list_integrations_request)

let make_list_log_anomaly_detectors_response
    ?anomaly_detectors:(anomaly_detectors_ : anomaly_detectors option)
    ?next_token:(next_token_ : next_token option) () =
  ({ anomaly_detectors = anomaly_detectors_; next_token = next_token_ }
    : list_log_anomaly_detectors_response)

let make_list_log_anomaly_detectors_request
    ?filter_log_group_arn:(filter_log_group_arn_ : log_group_arn option)
    ?limit:(limit_ : list_log_anomaly_detectors_limit option)
    ?next_token:(next_token_ : next_token option) () =
  ({ filter_log_group_arn = filter_log_group_arn_; limit = limit_; next_token = next_token_ }
    : list_log_anomaly_detectors_request)

let make_log_group_summary ?log_group_name:(log_group_name_ : log_group_name option)
    ?log_group_arn:(log_group_arn_ : arn option)
    ?log_group_class:(log_group_class_ : log_group_class option) () =
  ({
     log_group_name = log_group_name_;
     log_group_arn = log_group_arn_;
     log_group_class = log_group_class_;
   }
    : log_group_summary)

let make_list_log_groups_response ?log_groups:(log_groups_ : log_group_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ log_groups = log_groups_; next_token = next_token_ } : list_log_groups_response)

let make_tag_filter ?values:(values_ : tag_filter_values option) ~key:(key_ : tag_filter_key) () =
  ({ key = key_; values = values_ } : tag_filter)

let make_list_log_groups_request
    ?log_group_name_pattern:(log_group_name_pattern_ : log_group_name_regex_pattern option)
    ?log_group_class:(log_group_class_ : log_group_class option)
    ?include_linked_accounts:(include_linked_accounts_ : include_linked_accounts option)
    ?account_identifiers:(account_identifiers_ : account_ids option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : list_limit option)
    ?data_sources:(data_sources_ : data_source_filters option)
    ?field_index_names:(field_index_names_ : field_index_names option)
    ?log_group_tags:(log_group_tags_ : tag_filters option) () =
  ({
     log_group_name_pattern = log_group_name_pattern_;
     log_group_class = log_group_class_;
     include_linked_accounts = include_linked_accounts_;
     account_identifiers = account_identifiers_;
     next_token = next_token_;
     limit = limit_;
     data_sources = data_sources_;
     field_index_names = field_index_names_;
     log_group_tags = log_group_tags_;
   }
    : list_log_groups_request)

let make_list_log_groups_for_query_response
    ?log_group_identifiers:(log_group_identifiers_ : log_group_identifiers option)
    ?next_token:(next_token_ : next_token option) () =
  ({ log_group_identifiers = log_group_identifiers_; next_token = next_token_ }
    : list_log_groups_for_query_response)

let make_list_log_groups_for_query_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : list_log_groups_for_query_max_results option)
    ~query_id:(query_id_ : query_id) () =
  ({ query_id = query_id_; next_token = next_token_; max_results = max_results_ }
    : list_log_groups_for_query_request)

let make_scheduled_query_summary ?scheduled_query_arn:(scheduled_query_arn_ : arn option)
    ?name:(name_ : scheduled_query_name option) ?state:(state_ : scheduled_query_state option)
    ?schedule_type:(schedule_type_ : schedule_type option)
    ?last_triggered_time:(last_triggered_time_ : timestamp option)
    ?last_execution_status:(last_execution_status_ : execution_status option)
    ?schedule_expression:(schedule_expression_ : schedule_expression option)
    ?timezone:(timezone_ : schedule_timezone option)
    ?destination_configuration:(destination_configuration_ : destination_configuration option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_updated_time:(last_updated_time_ : timestamp option) () =
  ({
     scheduled_query_arn = scheduled_query_arn_;
     name = name_;
     state = state_;
     schedule_type = schedule_type_;
     last_triggered_time = last_triggered_time_;
     last_execution_status = last_execution_status_;
     schedule_expression = schedule_expression_;
     timezone = timezone_;
     destination_configuration = destination_configuration_;
     creation_time = creation_time_;
     last_updated_time = last_updated_time_;
   }
    : scheduled_query_summary)

let make_list_scheduled_queries_response ?next_token:(next_token_ : next_token option)
    ?scheduled_queries:(scheduled_queries_ : scheduled_query_summary_list option) () =
  ({ next_token = next_token_; scheduled_queries = scheduled_queries_ }
    : list_scheduled_queries_response)

let make_list_scheduled_queries_request
    ?max_results:(max_results_ : list_scheduled_queries_max_results option)
    ?next_token:(next_token_ : next_token option) ?state:(state_ : scheduled_query_state option)
    ?schedule_type:(schedule_type_ : schedule_type option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     state = state_;
     schedule_type = schedule_type_;
   }
    : list_scheduled_queries_request)

let make_s3_table_integration_source
    ?identifier:(identifier_ : s3_table_integration_source_identifier option)
    ?data_source:(data_source_ : data_source option)
    ?status:(status_ : s3_table_integration_source_status option)
    ?status_reason:(status_reason_ : s3_table_integration_source_status_reason option)
    ?created_time_stamp:(created_time_stamp_ : timestamp option)
    ?parent_source_identifier:
      (parent_source_identifier_ : s3_table_integration_source_identifier option) () =
  ({
     identifier = identifier_;
     data_source = data_source_;
     status = status_;
     status_reason = status_reason_;
     created_time_stamp = created_time_stamp_;
     parent_source_identifier = parent_source_identifier_;
   }
    : s3_table_integration_source)

let make_list_sources_for_s3_table_integration_response
    ?sources:(sources_ : s3_table_integration_sources option)
    ?next_token:(next_token_ : next_token option) () =
  ({ sources = sources_; next_token = next_token_ }
    : list_sources_for_s3_table_integration_response)

let make_list_sources_for_s3_table_integration_request
    ?max_results:(max_results_ : list_sources_for_s3_table_integration_max_results option)
    ?next_token:(next_token_ : next_token option) ~integration_arn:(integration_arn_ : arn) () =
  ({ integration_arn = integration_arn_; max_results = max_results_; next_token = next_token_ }
    : list_sources_for_s3_table_integration_request)

let make_syslog_configuration ?log_group_arn:(log_group_arn_ : log_group_arn option)
    ?source_type:(source_type_ : syslog_source_type option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?created_at:(created_at_ : timestamp option) () =
  ({
     log_group_arn = log_group_arn_;
     source_type = source_type_;
     vpc_endpoint_id = vpc_endpoint_id_;
     created_at = created_at_;
   }
    : syslog_configuration)

let make_list_syslog_configurations_response
    ?syslog_configurations:(syslog_configurations_ : syslog_configurations option)
    ?next_token:(next_token_ : next_token option) () =
  ({ syslog_configurations = syslog_configurations_; next_token = next_token_ }
    : list_syslog_configurations_response)

let make_list_syslog_configurations_request
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : list_syslog_configurations_max_results option) () =
  ({
     log_group_identifier = log_group_identifier_;
     vpc_endpoint_id = vpc_endpoint_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_syslog_configurations_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_tags_log_group_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_log_group_response)

let make_list_tags_log_group_request ~log_group_name:(log_group_name_ : log_group_name) () =
  ({ log_group_name = log_group_name_ } : list_tags_log_group_request)

let make_live_tail_session_log_event ?log_stream_name:(log_stream_name_ : log_stream_name option)
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option)
    ?message:(message_ : event_message option) ?timestamp:(timestamp_ : timestamp option)
    ?ingestion_time:(ingestion_time_ : timestamp option) () =
  ({
     log_stream_name = log_stream_name_;
     log_group_identifier = log_group_identifier_;
     message = message_;
     timestamp = timestamp_;
     ingestion_time = ingestion_time_;
   }
    : live_tail_session_log_event)

let make_live_tail_session_metadata ?sampled:(sampled_ : is_sampled option) () =
  ({ sampled = sampled_ } : live_tail_session_metadata)

let make_live_tail_session_start ?request_id:(request_id_ : request_id option)
    ?session_id:(session_id_ : session_id option)
    ?log_group_identifiers:(log_group_identifiers_ : start_live_tail_log_group_identifiers option)
    ?log_stream_names:(log_stream_names_ : input_log_stream_names option)
    ?log_stream_name_prefixes:(log_stream_name_prefixes_ : input_log_stream_names option)
    ?log_event_filter_pattern:(log_event_filter_pattern_ : filter_pattern option) () =
  ({
     request_id = request_id_;
     session_id = session_id_;
     log_group_identifiers = log_group_identifiers_;
     log_stream_names = log_stream_names_;
     log_stream_name_prefixes = log_stream_name_prefixes_;
     log_event_filter_pattern = log_event_filter_pattern_;
   }
    : live_tail_session_start)

let make_live_tail_session_update
    ?session_metadata:(session_metadata_ : live_tail_session_metadata option)
    ?session_results:(session_results_ : live_tail_session_results option) () =
  ({ session_metadata = session_metadata_; session_results = session_results_ }
    : live_tail_session_update)

let make_update_scheduled_query_response ?scheduled_query_arn:(scheduled_query_arn_ : arn option)
    ?name:(name_ : scheduled_query_name option)
    ?description:(description_ : scheduled_query_description option)
    ?query_language:(query_language_ : query_language option)
    ?query_string:(query_string_ : query_string option)
    ?log_group_identifiers:(log_group_identifiers_ : scheduled_query_log_group_identifiers option)
    ?schedule_expression:(schedule_expression_ : schedule_expression option)
    ?timezone:(timezone_ : schedule_timezone option)
    ?start_time_offset:(start_time_offset_ : start_time_offset option)
    ?end_time_offset:(end_time_offset_ : end_time_offset option)
    ?destination_configuration:(destination_configuration_ : destination_configuration option)
    ?state:(state_ : scheduled_query_state option)
    ?schedule_type:(schedule_type_ : schedule_type option)
    ?last_triggered_time:(last_triggered_time_ : timestamp option)
    ?last_execution_status:(last_execution_status_ : execution_status option)
    ?schedule_start_time:(schedule_start_time_ : timestamp option)
    ?schedule_end_time:(schedule_end_time_ : timestamp option)
    ?execution_role_arn:(execution_role_arn_ : role_arn option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_updated_time:(last_updated_time_ : timestamp option) () =
  ({
     scheduled_query_arn = scheduled_query_arn_;
     name = name_;
     description = description_;
     query_language = query_language_;
     query_string = query_string_;
     log_group_identifiers = log_group_identifiers_;
     schedule_expression = schedule_expression_;
     timezone = timezone_;
     start_time_offset = start_time_offset_;
     end_time_offset = end_time_offset_;
     destination_configuration = destination_configuration_;
     state = state_;
     schedule_type = schedule_type_;
     last_triggered_time = last_triggered_time_;
     last_execution_status = last_execution_status_;
     schedule_start_time = schedule_start_time_;
     schedule_end_time = schedule_end_time_;
     execution_role_arn = execution_role_arn_;
     creation_time = creation_time_;
     last_updated_time = last_updated_time_;
   }
    : update_scheduled_query_response)

let make_update_scheduled_query_request
    ?description:(description_ : scheduled_query_description option)
    ?log_group_identifiers:(log_group_identifiers_ : scheduled_query_log_group_identifiers option)
    ?timezone:(timezone_ : schedule_timezone option)
    ?start_time_offset:(start_time_offset_ : start_time_offset option)
    ?end_time_offset:(end_time_offset_ : end_time_offset option)
    ?destination_configuration:(destination_configuration_ : destination_configuration option)
    ?schedule_start_time:(schedule_start_time_ : timestamp option)
    ?schedule_end_time:(schedule_end_time_ : timestamp option)
    ?state:(state_ : scheduled_query_state option)
    ~identifier:(identifier_ : scheduled_query_identifier)
    ~query_language:(query_language_ : query_language) ~query_string:(query_string_ : query_string)
    ~schedule_expression:(schedule_expression_ : schedule_expression)
    ~execution_role_arn:(execution_role_arn_ : role_arn) () =
  ({
     identifier = identifier_;
     description = description_;
     query_language = query_language_;
     query_string = query_string_;
     log_group_identifiers = log_group_identifiers_;
     schedule_expression = schedule_expression_;
     timezone = timezone_;
     start_time_offset = start_time_offset_;
     end_time_offset = end_time_offset_;
     destination_configuration = destination_configuration_;
     schedule_start_time = schedule_start_time_;
     schedule_end_time = schedule_end_time_;
     execution_role_arn = execution_role_arn_;
     state = state_;
   }
    : update_scheduled_query_request)

let make_update_lookup_table_response ?lookup_table_arn:(lookup_table_arn_ : arn option)
    ?last_updated_time:(last_updated_time_ : timestamp option) () =
  ({ lookup_table_arn = lookup_table_arn_; last_updated_time = last_updated_time_ }
    : update_lookup_table_response)

let make_update_lookup_table_request ?description:(description_ : lookup_table_description option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ~lookup_table_arn:(lookup_table_arn_ : arn)
    ~table_body:(table_body_ : table_body) () =
  ({
     lookup_table_arn = lookup_table_arn_;
     description = description_;
     table_body = table_body_;
     kms_key_id = kms_key_id_;
   }
    : update_lookup_table_request)

let make_update_log_anomaly_detector_request
    ?evaluation_frequency:(evaluation_frequency_ : evaluation_frequency option)
    ?filter_pattern:(filter_pattern_ : filter_pattern option)
    ?anomaly_visibility_time:(anomaly_visibility_time_ : anomaly_visibility_time option)
    ~anomaly_detector_arn:(anomaly_detector_arn_ : anomaly_detector_arn)
    ~enabled:(enabled_ : boolean_) () =
  ({
     anomaly_detector_arn = anomaly_detector_arn_;
     evaluation_frequency = evaluation_frequency_;
     filter_pattern = filter_pattern_;
     anomaly_visibility_time = anomaly_visibility_time_;
     enabled = enabled_;
   }
    : update_log_anomaly_detector_request)

let make_update_delivery_configuration_response () = (() : unit)

let make_update_delivery_configuration_request
    ?record_fields:(record_fields_ : record_fields option)
    ?field_delimiter:(field_delimiter_ : field_delimiter option)
    ?s3_delivery_configuration:(s3_delivery_configuration_ : s3_delivery_configuration option)
    ~id:(id_ : delivery_id) () =
  ({
     id = id_;
     record_fields = record_fields_;
     field_delimiter = field_delimiter_;
     s3_delivery_configuration = s3_delivery_configuration_;
   }
    : update_delivery_configuration_request)

let make_suppression_period ?value:(value_ : integer option)
    ?suppression_unit:(suppression_unit_ : suppression_unit option) () =
  ({ value = value_; suppression_unit = suppression_unit_ } : suppression_period)

let make_update_anomaly_request ?anomaly_id:(anomaly_id_ : anomaly_id option)
    ?pattern_id:(pattern_id_ : pattern_id option)
    ?suppression_type:(suppression_type_ : suppression_type option)
    ?suppression_period:(suppression_period_ : suppression_period option)
    ?baseline:(baseline_ : baseline option)
    ~anomaly_detector_arn:(anomaly_detector_arn_ : anomaly_detector_arn) () =
  ({
     anomaly_id = anomaly_id_;
     pattern_id = pattern_id_;
     anomaly_detector_arn = anomaly_detector_arn_;
     suppression_type = suppression_type_;
     suppression_period = suppression_period_;
     baseline = baseline_;
   }
    : update_anomaly_request)

let make_untag_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_untag_log_group_request ~log_group_name:(log_group_name_ : log_group_name)
    ~tags:(tags_ : tag_list) () =
  ({ log_group_name = log_group_name_; tags = tags_ } : untag_log_group_request)

let make_transformed_log_record ?event_number:(event_number_ : event_number option)
    ?event_message:(event_message_ : event_message option)
    ?transformed_event_message:(transformed_event_message_ : transformed_event_message option) () =
  ({
     event_number = event_number_;
     event_message = event_message_;
     transformed_event_message = transformed_event_message_;
   }
    : transformed_log_record)

let make_test_transformer_response ?transformed_logs:(transformed_logs_ : transformed_logs option)
    () =
  ({ transformed_logs = transformed_logs_ } : test_transformer_response)

let make_test_transformer_request ~transformer_config:(transformer_config_ : processors)
    ~log_event_messages:(log_event_messages_ : test_event_messages) () =
  ({ transformer_config = transformer_config_; log_event_messages = log_event_messages_ }
    : test_transformer_request)

let make_metric_filter_match_record ?event_number:(event_number_ : event_number option)
    ?event_message:(event_message_ : event_message option)
    ?extracted_values:(extracted_values_ : extracted_values option) () =
  ({
     event_number = event_number_;
     event_message = event_message_;
     extracted_values = extracted_values_;
   }
    : metric_filter_match_record)

let make_test_metric_filter_response ?matches:(matches_ : metric_filter_matches option) () =
  ({ matches = matches_ } : test_metric_filter_response)

let make_test_metric_filter_request ~filter_pattern:(filter_pattern_ : filter_pattern)
    ~log_event_messages:(log_event_messages_ : test_event_messages) () =
  ({ filter_pattern = filter_pattern_; log_event_messages = log_event_messages_ }
    : test_metric_filter_request)

let make_tag_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name)
    ~tags:(tags_ : tags) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_tag_log_group_request ~log_group_name:(log_group_name_ : log_group_name)
    ~tags:(tags_ : tags) () =
  ({ log_group_name = log_group_name_; tags = tags_ } : tag_log_group_request)

let make_stop_query_response ?success:(success_ : success option) () =
  ({ success = success_ } : stop_query_response)

let make_stop_query_request ~query_id:(query_id_ : query_id) () =
  ({ query_id = query_id_ } : stop_query_request)

let make_query_compile_error_location
    ?start_char_offset:(start_char_offset_ : query_char_offset option)
    ?end_char_offset:(end_char_offset_ : query_char_offset option) () =
  ({ start_char_offset = start_char_offset_; end_char_offset = end_char_offset_ }
    : query_compile_error_location)

let make_query_compile_error ?location:(location_ : query_compile_error_location option)
    ?message:(message_ : message option) () =
  ({ location = location_; message = message_ } : query_compile_error)

let make_start_query_response ?query_id:(query_id_ : query_id option) () =
  ({ query_id = query_id_ } : start_query_response)

let make_start_query_request ?query_language:(query_language_ : query_language option)
    ?log_group_name:(log_group_name_ : log_group_name option)
    ?log_group_names:(log_group_names_ : log_group_names option)
    ?log_group_identifiers:(log_group_identifiers_ : log_group_identifiers option)
    ?limit:(limit_ : events_limit_start_query option) ~start_time:(start_time_ : timestamp)
    ~end_time:(end_time_ : timestamp) ~query_string:(query_string_ : query_string) () =
  ({
     query_language = query_language_;
     log_group_name = log_group_name_;
     log_group_names = log_group_names_;
     log_group_identifiers = log_group_identifiers_;
     start_time = start_time_;
     end_time = end_time_;
     query_string = query_string_;
     limit = limit_;
   }
    : start_query_request)

let make_start_live_tail_response
    ?response_stream:(response_stream_ : start_live_tail_response_stream option) () =
  ({ response_stream = response_stream_ } : start_live_tail_response)

let make_start_live_tail_request
    ?log_stream_names:(log_stream_names_ : input_log_stream_names option)
    ?log_stream_name_prefixes:(log_stream_name_prefixes_ : input_log_stream_names option)
    ?log_event_filter_pattern:(log_event_filter_pattern_ : filter_pattern option)
    ~log_group_identifiers:(log_group_identifiers_ : start_live_tail_log_group_identifiers) () =
  ({
     log_group_identifiers = log_group_identifiers_;
     log_stream_names = log_stream_names_;
     log_stream_name_prefixes = log_stream_name_prefixes_;
     log_event_filter_pattern = log_event_filter_pattern_;
   }
    : start_live_tail_request)

let make_put_transformer_request
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier)
    ~transformer_config:(transformer_config_ : processors) () =
  ({ log_group_identifier = log_group_identifier_; transformer_config = transformer_config_ }
    : put_transformer_request)

let make_put_syslog_configuration_request
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier) () =
  ({ log_group_identifier = log_group_identifier_; vpc_endpoint_id = vpc_endpoint_id_ }
    : put_syslog_configuration_request)

let make_put_subscription_filter_request ?role_arn:(role_arn_ : role_arn option)
    ?distribution:(distribution_ : distribution option)
    ?apply_on_transformed_logs:(apply_on_transformed_logs_ : apply_on_transformed_logs option)
    ?field_selection_criteria:(field_selection_criteria_ : field_selection_criteria option)
    ?emit_system_fields:(emit_system_fields_ : emit_system_fields option)
    ~log_group_name:(log_group_name_ : log_group_name) ~filter_name:(filter_name_ : filter_name)
    ~filter_pattern:(filter_pattern_ : filter_pattern)
    ~destination_arn:(destination_arn_ : destination_arn) () =
  ({
     log_group_name = log_group_name_;
     filter_name = filter_name_;
     filter_pattern = filter_pattern_;
     destination_arn = destination_arn_;
     role_arn = role_arn_;
     distribution = distribution_;
     apply_on_transformed_logs = apply_on_transformed_logs_;
     field_selection_criteria = field_selection_criteria_;
     emit_system_fields = emit_system_fields_;
   }
    : put_subscription_filter_request)

let make_put_retention_policy_request ~log_group_name:(log_group_name_ : log_group_name)
    ~retention_in_days:(retention_in_days_ : days) () =
  ({ log_group_name = log_group_name_; retention_in_days = retention_in_days_ }
    : put_retention_policy_request)

let make_put_resource_policy_response ?resource_policy:(resource_policy_ : resource_policy option)
    ?revision_id:(revision_id_ : expected_revision_id option) () =
  ({ resource_policy = resource_policy_; revision_id = revision_id_ }
    : put_resource_policy_response)

let make_put_resource_policy_request ?policy_name:(policy_name_ : policy_name option)
    ?policy_document:(policy_document_ : policy_document option)
    ?resource_arn:(resource_arn_ : arn option)
    ?expected_revision_id:(expected_revision_id_ : expected_revision_id option) () =
  ({
     policy_name = policy_name_;
     policy_document = policy_document_;
     resource_arn = resource_arn_;
     expected_revision_id = expected_revision_id_;
   }
    : put_resource_policy_request)

let make_put_query_definition_response ?query_definition_id:(query_definition_id_ : query_id option)
    () =
  ({ query_definition_id = query_definition_id_ } : put_query_definition_response)

let make_put_query_definition_request ?query_language:(query_language_ : query_language option)
    ?query_definition_id:(query_definition_id_ : query_id option)
    ?log_group_names:(log_group_names_ : log_group_names option)
    ?client_token:(client_token_ : client_token option)
    ?parameters:(parameters_ : query_parameter_list option) ~name:(name_ : query_definition_name)
    ~query_string:(query_string_ : query_definition_string) () =
  ({
     query_language = query_language_;
     name = name_;
     query_definition_id = query_definition_id_;
     log_group_names = log_group_names_;
     query_string = query_string_;
     client_token = client_token_;
     parameters = parameters_;
   }
    : put_query_definition_request)

let make_put_metric_filter_request
    ?apply_on_transformed_logs:(apply_on_transformed_logs_ : apply_on_transformed_logs option)
    ?field_selection_criteria:(field_selection_criteria_ : field_selection_criteria option)
    ?emit_system_field_dimensions:(emit_system_field_dimensions_ : emit_system_fields option)
    ~log_group_name:(log_group_name_ : log_group_name) ~filter_name:(filter_name_ : filter_name)
    ~filter_pattern:(filter_pattern_ : filter_pattern)
    ~metric_transformations:(metric_transformations_ : metric_transformations) () =
  ({
     log_group_name = log_group_name_;
     filter_name = filter_name_;
     filter_pattern = filter_pattern_;
     metric_transformations = metric_transformations_;
     apply_on_transformed_logs = apply_on_transformed_logs_;
     field_selection_criteria = field_selection_criteria_;
     emit_system_field_dimensions = emit_system_field_dimensions_;
   }
    : put_metric_filter_request)

let make_put_log_group_deletion_protection_request
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier)
    ~deletion_protection_enabled:(deletion_protection_enabled_ : deletion_protection_enabled) () =
  ({
     log_group_identifier = log_group_identifier_;
     deletion_protection_enabled = deletion_protection_enabled_;
   }
    : put_log_group_deletion_protection_request)

let make_rejected_entity_info ~error_type:(error_type_ : entity_rejection_error_type) () =
  ({ error_type = error_type_ } : rejected_entity_info)

let make_rejected_log_events_info
    ?too_new_log_event_start_index:(too_new_log_event_start_index_ : log_event_index option)
    ?too_old_log_event_end_index:(too_old_log_event_end_index_ : log_event_index option)
    ?expired_log_event_end_index:(expired_log_event_end_index_ : log_event_index option) () =
  ({
     too_new_log_event_start_index = too_new_log_event_start_index_;
     too_old_log_event_end_index = too_old_log_event_end_index_;
     expired_log_event_end_index = expired_log_event_end_index_;
   }
    : rejected_log_events_info)

let make_put_log_events_response ?next_sequence_token:(next_sequence_token_ : sequence_token option)
    ?rejected_log_events_info:(rejected_log_events_info_ : rejected_log_events_info option)
    ?rejected_entity_info:(rejected_entity_info_ : rejected_entity_info option) () =
  ({
     next_sequence_token = next_sequence_token_;
     rejected_log_events_info = rejected_log_events_info_;
     rejected_entity_info = rejected_entity_info_;
   }
    : put_log_events_response)

let make_put_log_events_request ?sequence_token:(sequence_token_ : sequence_token option)
    ?entity:(entity_ : entity option) ~log_group_name:(log_group_name_ : log_group_name)
    ~log_stream_name:(log_stream_name_ : log_stream_name)
    ~log_events:(log_events_ : input_log_events) () =
  ({
     log_group_name = log_group_name_;
     log_stream_name = log_stream_name_;
     log_events = log_events_;
     sequence_token = sequence_token_;
     entity = entity_;
   }
    : put_log_events_request)

let make_put_integration_response ?integration_name:(integration_name_ : integration_name option)
    ?integration_status:(integration_status_ : integration_status option) () =
  ({ integration_name = integration_name_; integration_status = integration_status_ }
    : put_integration_response)

let make_open_search_resource_config ?kms_key_arn:(kms_key_arn_ : arn option)
    ?application_arn:(application_arn_ : arn option)
    ~data_source_role_arn:(data_source_role_arn_ : arn)
    ~dashboard_viewer_principals:(dashboard_viewer_principals_ : dashboard_viewer_principals)
    ~retention_days:(retention_days_ : collection_retention_days) () =
  ({
     kms_key_arn = kms_key_arn_;
     data_source_role_arn = data_source_role_arn_;
     dashboard_viewer_principals = dashboard_viewer_principals_;
     application_arn = application_arn_;
     retention_days = retention_days_;
   }
    : open_search_resource_config)

let make_put_integration_request ~integration_name:(integration_name_ : integration_name)
    ~resource_config:(resource_config_ : resource_config)
    ~integration_type:(integration_type_ : integration_type) () =
  ({
     integration_name = integration_name_;
     resource_config = resource_config_;
     integration_type = integration_type_;
   }
    : put_integration_request)

let make_put_index_policy_response ?index_policy:(index_policy_ : index_policy option) () =
  ({ index_policy = index_policy_ } : put_index_policy_response)

let make_put_index_policy_request
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier)
    ~policy_document:(policy_document_ : policy_document) () =
  ({ log_group_identifier = log_group_identifier_; policy_document = policy_document_ }
    : put_index_policy_request)

let make_put_destination_policy_request ?force_update:(force_update_ : force_update option)
    ~destination_name:(destination_name_ : destination_name)
    ~access_policy:(access_policy_ : access_policy) () =
  ({
     destination_name = destination_name_;
     access_policy = access_policy_;
     force_update = force_update_;
   }
    : put_destination_policy_request)

let make_put_destination_response ?destination:(destination_ : destination option) () =
  ({ destination = destination_ } : put_destination_response)

let make_put_destination_request ?tags:(tags_ : tags option)
    ~destination_name:(destination_name_ : destination_name) ~target_arn:(target_arn_ : target_arn)
    ~role_arn:(role_arn_ : role_arn) () =
  ({
     destination_name = destination_name_;
     target_arn = target_arn_;
     role_arn = role_arn_;
     tags = tags_;
   }
    : put_destination_request)

let make_put_delivery_source_response ?delivery_source:(delivery_source_ : delivery_source option)
    () =
  ({ delivery_source = delivery_source_ } : put_delivery_source_response)

let make_put_delivery_source_request ?tags:(tags_ : tags option)
    ?delivery_source_configuration:
      (delivery_source_configuration_ : delivery_source_configuration option)
    ~name:(name_ : delivery_source_name) ~resource_arn:(resource_arn_ : arn)
    ~log_type:(log_type_ : log_type) () =
  ({
     name = name_;
     resource_arn = resource_arn_;
     log_type = log_type_;
     tags = tags_;
     delivery_source_configuration = delivery_source_configuration_;
   }
    : put_delivery_source_request)

let make_put_delivery_destination_policy_response ?policy:(policy_ : policy option) () =
  ({ policy = policy_ } : put_delivery_destination_policy_response)

let make_put_delivery_destination_policy_request
    ~delivery_destination_name:(delivery_destination_name_ : delivery_destination_name)
    ~delivery_destination_policy:(delivery_destination_policy_ : delivery_destination_policy) () =
  ({
     delivery_destination_name = delivery_destination_name_;
     delivery_destination_policy = delivery_destination_policy_;
   }
    : put_delivery_destination_policy_request)

let make_put_delivery_destination_response
    ?delivery_destination:(delivery_destination_ : delivery_destination option) () =
  ({ delivery_destination = delivery_destination_ } : put_delivery_destination_response)

let make_put_delivery_destination_request ?output_format:(output_format_ : output_format option)
    ?delivery_destination_configuration:
      (delivery_destination_configuration_ : delivery_destination_configuration option)
    ?delivery_destination_type:(delivery_destination_type_ : delivery_destination_type option)
    ?tags:(tags_ : tags option) ~name:(name_ : delivery_destination_name) () =
  ({
     name = name_;
     output_format = output_format_;
     delivery_destination_configuration = delivery_destination_configuration_;
     delivery_destination_type = delivery_destination_type_;
     tags = tags_;
   }
    : put_delivery_destination_request)

let make_put_data_protection_policy_response
    ?log_group_identifier:(log_group_identifier_ : log_group_identifier option)
    ?policy_document:(policy_document_ : data_protection_policy_document option)
    ?last_updated_time:(last_updated_time_ : timestamp option) () =
  ({
     log_group_identifier = log_group_identifier_;
     policy_document = policy_document_;
     last_updated_time = last_updated_time_;
   }
    : put_data_protection_policy_response)

let make_put_data_protection_policy_request
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier)
    ~policy_document:(policy_document_ : data_protection_policy_document) () =
  ({ log_group_identifier = log_group_identifier_; policy_document = policy_document_ }
    : put_data_protection_policy_request)

let make_put_bearer_token_authentication_request
    ~log_group_identifier:(log_group_identifier_ : log_group_identifier)
    ~bearer_token_authentication_enabled:
      (bearer_token_authentication_enabled_ : bearer_token_authentication_enabled) () =
  ({
     log_group_identifier = log_group_identifier_;
     bearer_token_authentication_enabled = bearer_token_authentication_enabled_;
   }
    : put_bearer_token_authentication_request)

let make_put_account_policy_response ?account_policy:(account_policy_ : account_policy option) () =
  ({ account_policy = account_policy_ } : put_account_policy_response)

let make_put_account_policy_request ?scope:(scope_ : scope option)
    ?selection_criteria:(selection_criteria_ : selection_criteria option)
    ~policy_name:(policy_name_ : policy_name)
    ~policy_document:(policy_document_ : account_policy_document)
    ~policy_type:(policy_type_ : policy_type) () =
  ({
     policy_name = policy_name_;
     policy_document = policy_document_;
     policy_type = policy_type_;
     scope = scope_;
     selection_criteria = selection_criteria_;
   }
    : put_account_policy_request)
