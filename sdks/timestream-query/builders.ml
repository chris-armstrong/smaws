open Types

let make_update_scheduled_query_request ~state:(state_ : scheduled_query_state)
    ~scheduled_query_arn:(scheduled_query_arn_ : amazon_resource_name) () =
  ({ state = state_; scheduled_query_arn = scheduled_query_arn_ } : update_scheduled_query_request)

let make_sns_configuration ~topic_arn:(topic_arn_ : amazon_resource_name) () =
  ({ topic_arn = topic_arn_ } : sns_configuration)

let make_account_settings_notification_configuration
    ?sns_configuration:(sns_configuration_ : sns_configuration option)
    ~role_arn:(role_arn_ : amazon_resource_name) () =
  ({ role_arn = role_arn_; sns_configuration = sns_configuration_ }
    : account_settings_notification_configuration)

let make_last_update ?status_message:(status_message_ : string_ option)
    ?status:(status_ : last_update_status option)
    ?target_query_tc_u:(target_query_tc_u_ : query_tc_u option) () =
  ({ status_message = status_message_; status = status_; target_query_tc_u = target_query_tc_u_ }
    : last_update)

let make_provisioned_capacity_response ?last_update:(last_update_ : last_update option)
    ?notification_configuration:
      (notification_configuration_ : account_settings_notification_configuration option)
    ?active_query_tc_u:(active_query_tc_u_ : query_tc_u option) () =
  ({
     last_update = last_update_;
     notification_configuration = notification_configuration_;
     active_query_tc_u = active_query_tc_u_;
   }
    : provisioned_capacity_response)

let make_query_compute_response
    ?provisioned_capacity:(provisioned_capacity_ : provisioned_capacity_response option)
    ?compute_mode:(compute_mode_ : compute_mode option) () =
  ({ provisioned_capacity = provisioned_capacity_; compute_mode = compute_mode_ }
    : query_compute_response)

let make_update_account_settings_response
    ?query_compute:(query_compute_ : query_compute_response option)
    ?query_pricing_model:(query_pricing_model_ : query_pricing_model option)
    ?max_query_tc_u:(max_query_tc_u_ : max_query_capacity option) () =
  ({
     query_compute = query_compute_;
     query_pricing_model = query_pricing_model_;
     max_query_tc_u = max_query_tc_u_;
   }
    : update_account_settings_response)

let make_provisioned_capacity_request
    ?notification_configuration:
      (notification_configuration_ : account_settings_notification_configuration option)
    ~target_query_tc_u:(target_query_tc_u_ : query_tc_u) () =
  ({
     notification_configuration = notification_configuration_;
     target_query_tc_u = target_query_tc_u_;
   }
    : provisioned_capacity_request)

let make_query_compute_request
    ?provisioned_capacity:(provisioned_capacity_ : provisioned_capacity_request option)
    ?compute_mode:(compute_mode_ : compute_mode option) () =
  ({ provisioned_capacity = provisioned_capacity_; compute_mode = compute_mode_ }
    : query_compute_request)

let make_update_account_settings_request
    ?query_compute:(query_compute_ : query_compute_request option)
    ?query_pricing_model:(query_pricing_model_ : query_pricing_model option)
    ?max_query_tc_u:(max_query_tc_u_ : max_query_capacity option) () =
  ({
     query_compute = query_compute_;
     query_pricing_model = query_pricing_model_;
     max_query_tc_u = max_query_tc_u_;
   }
    : update_account_settings_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_column_info ?name:(name_ : string_ option) ~type_:(type__ : type_) () =
  ({ type_ = type__; name = name_ } : column_info)

let make_type_ ?row_column_info:(row_column_info_ : column_info_list option)
    ?time_series_measure_value_column_info:
      (time_series_measure_value_column_info_ : column_info option)
    ?array_column_info:(array_column_info_ : column_info option)
    ?scalar_type:(scalar_type_ : scalar_type option) () =
  ({
     row_column_info = row_column_info_;
     time_series_measure_value_column_info = time_series_measure_value_column_info_;
     array_column_info = array_column_info_;
     scalar_type = scalar_type_;
   }
    : type_)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_datum ?null_value:(null_value_ : nullable_boolean option)
    ?row_value:(row_value_ : row option) ?array_value:(array_value_ : datum_list option)
    ?time_series_value:(time_series_value_ : time_series_data_point_list option)
    ?scalar_value:(scalar_value_ : scalar_value option) () =
  ({
     null_value = null_value_;
     row_value = row_value_;
     array_value = array_value_;
     time_series_value = time_series_value_;
     scalar_value = scalar_value_;
   }
    : datum)

let make_row ~data:(data_ : datum_list) () = ({ data = data_ } : row)

let make_time_series_data_point ~value:(value_ : datum) ~time:(time_ : timestamp) () =
  ({ value = value_; time = time_ } : time_series_data_point)

let make_query_status ?cumulative_bytes_metered:(cumulative_bytes_metered_ : long option)
    ?cumulative_bytes_scanned:(cumulative_bytes_scanned_ : long option)
    ?progress_percentage:(progress_percentage_ : double option) () =
  ({
     cumulative_bytes_metered = cumulative_bytes_metered_;
     cumulative_bytes_scanned = cumulative_bytes_scanned_;
     progress_percentage = progress_percentage_;
   }
    : query_status)

let make_query_spatial_coverage_max ?partition_key:(partition_key_ : partition_key_list option)
    ?table_arn:(table_arn_ : amazon_resource_name option) ?value:(value_ : double option) () =
  ({ partition_key = partition_key_; table_arn = table_arn_; value = value_ }
    : query_spatial_coverage_max)

let make_query_spatial_coverage ?max:(max_ : query_spatial_coverage_max option) () =
  ({ max = max_ } : query_spatial_coverage)

let make_query_temporal_range_max ?table_arn:(table_arn_ : amazon_resource_name option)
    ?value:(value_ : long option) () =
  ({ table_arn = table_arn_; value = value_ } : query_temporal_range_max)

let make_query_temporal_range ?max:(max_ : query_temporal_range_max option) () =
  ({ max = max_ } : query_temporal_range)

let make_query_insights_response ?unload_written_bytes:(unload_written_bytes_ : long option)
    ?unload_written_rows:(unload_written_rows_ : long option)
    ?unload_partition_count:(unload_partition_count_ : long option)
    ?output_bytes:(output_bytes_ : long option) ?output_rows:(output_rows_ : long option)
    ?query_table_count:(query_table_count_ : long option)
    ?query_temporal_range:(query_temporal_range_ : query_temporal_range option)
    ?query_spatial_coverage:(query_spatial_coverage_ : query_spatial_coverage option) () =
  ({
     unload_written_bytes = unload_written_bytes_;
     unload_written_rows = unload_written_rows_;
     unload_partition_count = unload_partition_count_;
     output_bytes = output_bytes_;
     output_rows = output_rows_;
     query_table_count = query_table_count_;
     query_temporal_range = query_temporal_range_;
     query_spatial_coverage = query_spatial_coverage_;
   }
    : query_insights_response)

let make_query_response
    ?query_insights_response:(query_insights_response_ : query_insights_response option)
    ?query_status:(query_status_ : query_status option)
    ?next_token:(next_token_ : pagination_token option)
    ~column_info:(column_info_ : column_info_list) ~rows:(rows_ : row_list)
    ~query_id:(query_id_ : query_id) () =
  ({
     query_insights_response = query_insights_response_;
     query_status = query_status_;
     column_info = column_info_;
     rows = rows_;
     next_token = next_token_;
     query_id = query_id_;
   }
    : query_response)

let make_query_insights ~mode:(mode_ : query_insights_mode) () = ({ mode = mode_ } : query_insights)

let make_query_request ?query_insights:(query_insights_ : query_insights option)
    ?max_rows:(max_rows_ : max_query_results option)
    ?next_token:(next_token_ : pagination_token option)
    ?client_token:(client_token_ : client_request_token option)
    ~query_string:(query_string_ : query_string) () =
  ({
     query_insights = query_insights_;
     max_rows = max_rows_;
     next_token = next_token_;
     client_token = client_token_;
     query_string = query_string_;
   }
    : query_request)

let make_select_column ?aliased:(aliased_ : nullable_boolean option)
    ?table_name:(table_name_ : resource_name option)
    ?database_name:(database_name_ : resource_name option) ?type_:(type__ : type_ option)
    ?name:(name_ : string_ option) () =
  ({
     aliased = aliased_;
     table_name = table_name_;
     database_name = database_name_;
     type_ = type__;
     name = name_;
   }
    : select_column)

let make_parameter_mapping ~type_:(type__ : type_) ~name:(name_ : string_) () =
  ({ type_ = type__; name = name_ } : parameter_mapping)

let make_prepare_query_response ~parameters:(parameters_ : parameter_mapping_list)
    ~columns:(columns_ : select_column_list) ~query_string:(query_string_ : query_string) () =
  ({ parameters = parameters_; columns = columns_; query_string = query_string_ }
    : prepare_query_response)

let make_prepare_query_request ?validate_only:(validate_only_ : nullable_boolean option)
    ~query_string:(query_string_ : query_string) () =
  ({ validate_only = validate_only_; query_string = query_string_ } : prepare_query_request)

let make_list_tags_for_resource_response
    ?next_token:(next_token_ : next_tags_for_resource_results_token option) ~tags:(tags_ : tag_list)
    () =
  ({ next_token = next_token_; tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request
    ?next_token:(next_token_ : next_tags_for_resource_results_token option)
    ?max_results:(max_results_ : max_tags_for_resource_result option)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ next_token = next_token_; max_results = max_results_; resource_ar_n = resource_ar_n_ }
    : list_tags_for_resource_request)

let make_s3_configuration ?encryption_option:(encryption_option_ : s3_encryption_option option)
    ?object_key_prefix:(object_key_prefix_ : s3_object_key_prefix option)
    ~bucket_name:(bucket_name_ : s3_bucket_name) () =
  ({
     encryption_option = encryption_option_;
     object_key_prefix = object_key_prefix_;
     bucket_name = bucket_name_;
   }
    : s3_configuration)

let make_error_report_configuration ~s3_configuration:(s3_configuration_ : s3_configuration) () =
  ({ s3_configuration = s3_configuration_ } : error_report_configuration)

let make_timestream_destination ?table_name:(table_name_ : resource_name option)
    ?database_name:(database_name_ : resource_name option) () =
  ({ table_name = table_name_; database_name = database_name_ } : timestream_destination)

let make_target_destination
    ?timestream_destination:(timestream_destination_ : timestream_destination option) () =
  ({ timestream_destination = timestream_destination_ } : target_destination)

let make_scheduled_query ?last_run_status:(last_run_status_ : scheduled_query_run_status option)
    ?target_destination:(target_destination_ : target_destination option)
    ?error_report_configuration:(error_report_configuration_ : error_report_configuration option)
    ?next_invocation_time:(next_invocation_time_ : time option)
    ?previous_invocation_time:(previous_invocation_time_ : time option)
    ?creation_time:(creation_time_ : time option) ~state:(state_ : scheduled_query_state)
    ~name:(name_ : scheduled_query_name) ~arn:(arn_ : amazon_resource_name) () =
  ({
     last_run_status = last_run_status_;
     target_destination = target_destination_;
     error_report_configuration = error_report_configuration_;
     next_invocation_time = next_invocation_time_;
     previous_invocation_time = previous_invocation_time_;
     state = state_;
     creation_time = creation_time_;
     name = name_;
     arn = arn_;
   }
    : scheduled_query)

let make_list_scheduled_queries_response
    ?next_token:(next_token_ : next_scheduled_queries_results_token option)
    ~scheduled_queries:(scheduled_queries_ : scheduled_query_list) () =
  ({ next_token = next_token_; scheduled_queries = scheduled_queries_ }
    : list_scheduled_queries_response)

let make_list_scheduled_queries_request
    ?next_token:(next_token_ : next_scheduled_queries_results_token option)
    ?max_results:(max_results_ : max_scheduled_queries_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_scheduled_queries_request)

let make_scheduled_query_insights ~mode:(mode_ : scheduled_query_insights_mode) () =
  ({ mode = mode_ } : scheduled_query_insights)

let make_execute_scheduled_query_request
    ?query_insights:(query_insights_ : scheduled_query_insights option)
    ?client_token:(client_token_ : client_token option) ~invocation_time:(invocation_time_ : time)
    ~scheduled_query_arn:(scheduled_query_arn_ : amazon_resource_name) () =
  ({
     query_insights = query_insights_;
     client_token = client_token_;
     invocation_time = invocation_time_;
     scheduled_query_arn = scheduled_query_arn_;
   }
    : execute_scheduled_query_request)

let make_schedule_configuration ~schedule_expression:(schedule_expression_ : schedule_expression) ()
    =
  ({ schedule_expression = schedule_expression_ } : schedule_configuration)

let make_notification_configuration ~sns_configuration:(sns_configuration_ : sns_configuration) () =
  ({ sns_configuration = sns_configuration_ } : notification_configuration)

let make_dimension_mapping ~dimension_value_type:(dimension_value_type_ : dimension_value_type)
    ~name:(name_ : schema_name) () =
  ({ dimension_value_type = dimension_value_type_; name = name_ } : dimension_mapping)

let make_multi_measure_attribute_mapping
    ?target_multi_measure_attribute_name:(target_multi_measure_attribute_name_ : schema_name option)
    ~measure_value_type:(measure_value_type_ : scalar_measure_value_type)
    ~source_column:(source_column_ : schema_name) () =
  ({
     measure_value_type = measure_value_type_;
     target_multi_measure_attribute_name = target_multi_measure_attribute_name_;
     source_column = source_column_;
   }
    : multi_measure_attribute_mapping)

let make_multi_measure_mappings
    ?target_multi_measure_name:(target_multi_measure_name_ : schema_name option)
    ~multi_measure_attribute_mappings:
      (multi_measure_attribute_mappings_ : multi_measure_attribute_mapping_list) () =
  ({
     multi_measure_attribute_mappings = multi_measure_attribute_mappings_;
     target_multi_measure_name = target_multi_measure_name_;
   }
    : multi_measure_mappings)

let make_mixed_measure_mapping
    ?multi_measure_attribute_mappings:
      (multi_measure_attribute_mappings_ : multi_measure_attribute_mapping_list option)
    ?target_measure_name:(target_measure_name_ : schema_name option)
    ?source_column:(source_column_ : schema_name option)
    ?measure_name:(measure_name_ : schema_name option)
    ~measure_value_type:(measure_value_type_ : measure_value_type) () =
  ({
     multi_measure_attribute_mappings = multi_measure_attribute_mappings_;
     measure_value_type = measure_value_type_;
     target_measure_name = target_measure_name_;
     source_column = source_column_;
     measure_name = measure_name_;
   }
    : mixed_measure_mapping)

let make_timestream_configuration ?measure_name_column:(measure_name_column_ : schema_name option)
    ?mixed_measure_mappings:(mixed_measure_mappings_ : mixed_measure_mapping_list option)
    ?multi_measure_mappings:(multi_measure_mappings_ : multi_measure_mappings option)
    ~dimension_mappings:(dimension_mappings_ : dimension_mapping_list)
    ~time_column:(time_column_ : schema_name) ~table_name:(table_name_ : resource_name)
    ~database_name:(database_name_ : resource_name) () =
  ({
     measure_name_column = measure_name_column_;
     mixed_measure_mappings = mixed_measure_mappings_;
     multi_measure_mappings = multi_measure_mappings_;
     dimension_mappings = dimension_mappings_;
     time_column = time_column_;
     table_name = table_name_;
     database_name = database_name_;
   }
    : timestream_configuration)

let make_target_configuration
    ~timestream_configuration:(timestream_configuration_ : timestream_configuration) () =
  ({ timestream_configuration = timestream_configuration_ } : target_configuration)

let make_execution_stats ?query_result_rows:(query_result_rows_ : long option)
    ?records_ingested:(records_ingested_ : long option)
    ?cumulative_bytes_scanned:(cumulative_bytes_scanned_ : long option)
    ?bytes_metered:(bytes_metered_ : long option) ?data_writes:(data_writes_ : long option)
    ?execution_time_in_millis:(execution_time_in_millis_ : long option) () =
  ({
     query_result_rows = query_result_rows_;
     records_ingested = records_ingested_;
     cumulative_bytes_scanned = cumulative_bytes_scanned_;
     bytes_metered = bytes_metered_;
     data_writes = data_writes_;
     execution_time_in_millis = execution_time_in_millis_;
   }
    : execution_stats)

let make_scheduled_query_insights_response ?output_bytes:(output_bytes_ : long option)
    ?output_rows:(output_rows_ : long option) ?query_table_count:(query_table_count_ : long option)
    ?query_temporal_range:(query_temporal_range_ : query_temporal_range option)
    ?query_spatial_coverage:(query_spatial_coverage_ : query_spatial_coverage option) () =
  ({
     output_bytes = output_bytes_;
     output_rows = output_rows_;
     query_table_count = query_table_count_;
     query_temporal_range = query_temporal_range_;
     query_spatial_coverage = query_spatial_coverage_;
   }
    : scheduled_query_insights_response)

let make_s3_report_location ?object_key:(object_key_ : s3_object_key option)
    ?bucket_name:(bucket_name_ : s3_bucket_name option) () =
  ({ object_key = object_key_; bucket_name = bucket_name_ } : s3_report_location)

let make_error_report_location ?s3_report_location:(s3_report_location_ : s3_report_location option)
    () =
  ({ s3_report_location = s3_report_location_ } : error_report_location)

let make_scheduled_query_run_summary ?failure_reason:(failure_reason_ : error_message option)
    ?error_report_location:(error_report_location_ : error_report_location option)
    ?query_insights_response:(query_insights_response_ : scheduled_query_insights_response option)
    ?execution_stats:(execution_stats_ : execution_stats option)
    ?run_status:(run_status_ : scheduled_query_run_status option)
    ?trigger_time:(trigger_time_ : time option) ?invocation_time:(invocation_time_ : time option) ()
    =
  ({
     failure_reason = failure_reason_;
     error_report_location = error_report_location_;
     query_insights_response = query_insights_response_;
     execution_stats = execution_stats_;
     run_status = run_status_;
     trigger_time = trigger_time_;
     invocation_time = invocation_time_;
   }
    : scheduled_query_run_summary)

let make_scheduled_query_description
    ?recently_failed_runs:(recently_failed_runs_ : scheduled_query_run_summary_list option)
    ?last_run_summary:(last_run_summary_ : scheduled_query_run_summary option)
    ?error_report_configuration:(error_report_configuration_ : error_report_configuration option)
    ?kms_key_id:(kms_key_id_ : string_value2048 option)
    ?scheduled_query_execution_role_arn:
      (scheduled_query_execution_role_arn_ : amazon_resource_name option)
    ?target_configuration:(target_configuration_ : target_configuration option)
    ?next_invocation_time:(next_invocation_time_ : time option)
    ?previous_invocation_time:(previous_invocation_time_ : time option)
    ?creation_time:(creation_time_ : time option)
    ~notification_configuration:(notification_configuration_ : notification_configuration)
    ~schedule_configuration:(schedule_configuration_ : schedule_configuration)
    ~state:(state_ : scheduled_query_state) ~query_string:(query_string_ : query_string)
    ~name:(name_ : scheduled_query_name) ~arn:(arn_ : amazon_resource_name) () =
  ({
     recently_failed_runs = recently_failed_runs_;
     last_run_summary = last_run_summary_;
     error_report_configuration = error_report_configuration_;
     kms_key_id = kms_key_id_;
     scheduled_query_execution_role_arn = scheduled_query_execution_role_arn_;
     target_configuration = target_configuration_;
     notification_configuration = notification_configuration_;
     schedule_configuration = schedule_configuration_;
     next_invocation_time = next_invocation_time_;
     previous_invocation_time = previous_invocation_time_;
     state = state_;
     creation_time = creation_time_;
     query_string = query_string_;
     name = name_;
     arn = arn_;
   }
    : scheduled_query_description)

let make_describe_scheduled_query_response
    ~scheduled_query:(scheduled_query_ : scheduled_query_description) () =
  ({ scheduled_query = scheduled_query_ } : describe_scheduled_query_response)

let make_describe_scheduled_query_request
    ~scheduled_query_arn:(scheduled_query_arn_ : amazon_resource_name) () =
  ({ scheduled_query_arn = scheduled_query_arn_ } : describe_scheduled_query_request)

let make_endpoint ~cache_period_in_minutes:(cache_period_in_minutes_ : long)
    ~address:(address_ : string_) () =
  ({ cache_period_in_minutes = cache_period_in_minutes_; address = address_ } : endpoint)

let make_describe_endpoints_response ~endpoints:(endpoints_ : endpoints) () =
  ({ endpoints = endpoints_ } : describe_endpoints_response)

let make_describe_endpoints_request () = (() : unit)

let make_describe_account_settings_response
    ?query_compute:(query_compute_ : query_compute_response option)
    ?query_pricing_model:(query_pricing_model_ : query_pricing_model option)
    ?max_query_tc_u:(max_query_tc_u_ : max_query_capacity option) () =
  ({
     query_compute = query_compute_;
     query_pricing_model = query_pricing_model_;
     max_query_tc_u = max_query_tc_u_;
   }
    : describe_account_settings_response)

let make_describe_account_settings_request () = (() : unit)

let make_delete_scheduled_query_request
    ~scheduled_query_arn:(scheduled_query_arn_ : amazon_resource_name) () =
  ({ scheduled_query_arn = scheduled_query_arn_ } : delete_scheduled_query_request)

let make_create_scheduled_query_response ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : create_scheduled_query_response)

let make_create_scheduled_query_request ?kms_key_id:(kms_key_id_ : string_value2048 option)
    ?tags:(tags_ : tag_list option) ?client_token:(client_token_ : client_token option)
    ?target_configuration:(target_configuration_ : target_configuration option)
    ~error_report_configuration:(error_report_configuration_ : error_report_configuration)
    ~scheduled_query_execution_role_arn:(scheduled_query_execution_role_arn_ : amazon_resource_name)
    ~notification_configuration:(notification_configuration_ : notification_configuration)
    ~schedule_configuration:(schedule_configuration_ : schedule_configuration)
    ~query_string:(query_string_ : query_string) ~name:(name_ : scheduled_query_name) () =
  ({
     error_report_configuration = error_report_configuration_;
     kms_key_id = kms_key_id_;
     tags = tags_;
     scheduled_query_execution_role_arn = scheduled_query_execution_role_arn_;
     client_token = client_token_;
     target_configuration = target_configuration_;
     notification_configuration = notification_configuration_;
     schedule_configuration = schedule_configuration_;
     query_string = query_string_;
     name = name_;
   }
    : create_scheduled_query_request)

let make_cancel_query_response ?cancellation_message:(cancellation_message_ : string_ option) () =
  ({ cancellation_message = cancellation_message_ } : cancel_query_response)

let make_cancel_query_request ~query_id:(query_id_ : query_id) () =
  ({ query_id = query_id_ } : cancel_query_request)
