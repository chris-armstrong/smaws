open Types

let make_sns_configuration ~topic_arn:(topic_arn_ : amazon_resource_name) () =
  ({ topic_arn = topic_arn_ } : sns_configuration)

let make_account_settings_notification_configuration
    ?sns_configuration:(sns_configuration_ : sns_configuration option)
    ~role_arn:(role_arn_ : amazon_resource_name) () =
  ({ sns_configuration = sns_configuration_; role_arn = role_arn_ }
    : account_settings_notification_configuration)

let make_cancel_query_response ?cancellation_message:(cancellation_message_ : string_ option) () =
  ({ cancellation_message = cancellation_message_ } : cancel_query_response)

let make_cancel_query_request ~query_id:(query_id_ : query_id) () =
  ({ query_id = query_id_ } : cancel_query_request)

let make_type_ ?scalar_type:(scalar_type_ : scalar_type option)
    ?array_column_info:(array_column_info_ : column_info option)
    ?time_series_measure_value_column_info:
      (time_series_measure_value_column_info_ : column_info option)
    ?row_column_info:(row_column_info_ : column_info_list option) () =
  ({
     scalar_type = scalar_type_;
     array_column_info = array_column_info_;
     time_series_measure_value_column_info = time_series_measure_value_column_info_;
     row_column_info = row_column_info_;
   }
    : type_)

let make_column_info ?name:(name_ : string_ option) ~type_:(type__ : type_) () =
  ({ name = name_; type_ = type__ } : column_info)

let make_create_scheduled_query_response ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : create_scheduled_query_response)

let make_s3_configuration ?object_key_prefix:(object_key_prefix_ : s3_object_key_prefix option)
    ?encryption_option:(encryption_option_ : s3_encryption_option option)
    ~bucket_name:(bucket_name_ : s3_bucket_name) () =
  ({
     bucket_name = bucket_name_;
     object_key_prefix = object_key_prefix_;
     encryption_option = encryption_option_;
   }
    : s3_configuration)

let make_error_report_configuration ~s3_configuration:(s3_configuration_ : s3_configuration) () =
  ({ s3_configuration = s3_configuration_ } : error_report_configuration)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_multi_measure_attribute_mapping
    ?target_multi_measure_attribute_name:(target_multi_measure_attribute_name_ : schema_name option)
    ~source_column:(source_column_ : schema_name)
    ~measure_value_type:(measure_value_type_ : scalar_measure_value_type) () =
  ({
     source_column = source_column_;
     target_multi_measure_attribute_name = target_multi_measure_attribute_name_;
     measure_value_type = measure_value_type_;
   }
    : multi_measure_attribute_mapping)

let make_mixed_measure_mapping ?measure_name:(measure_name_ : schema_name option)
    ?source_column:(source_column_ : schema_name option)
    ?target_measure_name:(target_measure_name_ : schema_name option)
    ?multi_measure_attribute_mappings:
      (multi_measure_attribute_mappings_ : multi_measure_attribute_mapping_list option)
    ~measure_value_type:(measure_value_type_ : measure_value_type) () =
  ({
     measure_name = measure_name_;
     source_column = source_column_;
     target_measure_name = target_measure_name_;
     measure_value_type = measure_value_type_;
     multi_measure_attribute_mappings = multi_measure_attribute_mappings_;
   }
    : mixed_measure_mapping)

let make_multi_measure_mappings
    ?target_multi_measure_name:(target_multi_measure_name_ : schema_name option)
    ~multi_measure_attribute_mappings:
      (multi_measure_attribute_mappings_ : multi_measure_attribute_mapping_list) () =
  ({
     target_multi_measure_name = target_multi_measure_name_;
     multi_measure_attribute_mappings = multi_measure_attribute_mappings_;
   }
    : multi_measure_mappings)

let make_dimension_mapping ~name:(name_ : schema_name)
    ~dimension_value_type:(dimension_value_type_ : dimension_value_type) () =
  ({ name = name_; dimension_value_type = dimension_value_type_ } : dimension_mapping)

let make_timestream_configuration
    ?multi_measure_mappings:(multi_measure_mappings_ : multi_measure_mappings option)
    ?mixed_measure_mappings:(mixed_measure_mappings_ : mixed_measure_mapping_list option)
    ?measure_name_column:(measure_name_column_ : schema_name option)
    ~database_name:(database_name_ : resource_name) ~table_name:(table_name_ : resource_name)
    ~time_column:(time_column_ : schema_name)
    ~dimension_mappings:(dimension_mappings_ : dimension_mapping_list) () =
  ({
     database_name = database_name_;
     table_name = table_name_;
     time_column = time_column_;
     dimension_mappings = dimension_mappings_;
     multi_measure_mappings = multi_measure_mappings_;
     mixed_measure_mappings = mixed_measure_mappings_;
     measure_name_column = measure_name_column_;
   }
    : timestream_configuration)

let make_target_configuration
    ~timestream_configuration:(timestream_configuration_ : timestream_configuration) () =
  ({ timestream_configuration = timestream_configuration_ } : target_configuration)

let make_notification_configuration ~sns_configuration:(sns_configuration_ : sns_configuration) () =
  ({ sns_configuration = sns_configuration_ } : notification_configuration)

let make_schedule_configuration ~schedule_expression:(schedule_expression_ : schedule_expression) ()
    =
  ({ schedule_expression = schedule_expression_ } : schedule_configuration)

let make_create_scheduled_query_request
    ?target_configuration:(target_configuration_ : target_configuration option)
    ?client_token:(client_token_ : client_token option) ?tags:(tags_ : tag_list option)
    ?kms_key_id:(kms_key_id_ : string_value2048 option) ~name:(name_ : scheduled_query_name)
    ~query_string:(query_string_ : query_string)
    ~schedule_configuration:(schedule_configuration_ : schedule_configuration)
    ~notification_configuration:(notification_configuration_ : notification_configuration)
    ~scheduled_query_execution_role_arn:(scheduled_query_execution_role_arn_ : amazon_resource_name)
    ~error_report_configuration:(error_report_configuration_ : error_report_configuration) () =
  ({
     name = name_;
     query_string = query_string_;
     schedule_configuration = schedule_configuration_;
     notification_configuration = notification_configuration_;
     target_configuration = target_configuration_;
     client_token = client_token_;
     scheduled_query_execution_role_arn = scheduled_query_execution_role_arn_;
     tags = tags_;
     kms_key_id = kms_key_id_;
     error_report_configuration = error_report_configuration_;
   }
    : create_scheduled_query_request)

let make_time_series_data_point ~time:(time_ : timestamp) ~value:(value_ : datum) () =
  ({ time = time_; value = value_ } : time_series_data_point)

let make_row ~data:(data_ : datum_list) () = ({ data = data_ } : row)

let make_datum ?scalar_value:(scalar_value_ : scalar_value option)
    ?time_series_value:(time_series_value_ : time_series_data_point_list option)
    ?array_value:(array_value_ : datum_list option) ?row_value:(row_value_ : row option)
    ?null_value:(null_value_ : nullable_boolean option) () =
  ({
     scalar_value = scalar_value_;
     time_series_value = time_series_value_;
     array_value = array_value_;
     row_value = row_value_;
     null_value = null_value_;
   }
    : datum)

let make_delete_scheduled_query_request
    ~scheduled_query_arn:(scheduled_query_arn_ : amazon_resource_name) () =
  ({ scheduled_query_arn = scheduled_query_arn_ } : delete_scheduled_query_request)

let make_last_update ?target_query_tc_u:(target_query_tc_u_ : query_tc_u option)
    ?status:(status_ : last_update_status option) ?status_message:(status_message_ : string_ option)
    () =
  ({ target_query_tc_u = target_query_tc_u_; status = status_; status_message = status_message_ }
    : last_update)

let make_provisioned_capacity_response ?active_query_tc_u:(active_query_tc_u_ : query_tc_u option)
    ?notification_configuration:
      (notification_configuration_ : account_settings_notification_configuration option)
    ?last_update:(last_update_ : last_update option) () =
  ({
     active_query_tc_u = active_query_tc_u_;
     notification_configuration = notification_configuration_;
     last_update = last_update_;
   }
    : provisioned_capacity_response)

let make_query_compute_response ?compute_mode:(compute_mode_ : compute_mode option)
    ?provisioned_capacity:(provisioned_capacity_ : provisioned_capacity_response option) () =
  ({ compute_mode = compute_mode_; provisioned_capacity = provisioned_capacity_ }
    : query_compute_response)

let make_describe_account_settings_response
    ?max_query_tc_u:(max_query_tc_u_ : max_query_capacity option)
    ?query_pricing_model:(query_pricing_model_ : query_pricing_model option)
    ?query_compute:(query_compute_ : query_compute_response option) () =
  ({
     max_query_tc_u = max_query_tc_u_;
     query_pricing_model = query_pricing_model_;
     query_compute = query_compute_;
   }
    : describe_account_settings_response)

let make_describe_account_settings_request () = (() : unit)

let make_endpoint ~address:(address_ : string_)
    ~cache_period_in_minutes:(cache_period_in_minutes_ : long) () =
  ({ address = address_; cache_period_in_minutes = cache_period_in_minutes_ } : endpoint)

let make_describe_endpoints_response ~endpoints:(endpoints_ : endpoints) () =
  ({ endpoints = endpoints_ } : describe_endpoints_response)

let make_describe_endpoints_request () = (() : unit)

let make_s3_report_location ?bucket_name:(bucket_name_ : s3_bucket_name option)
    ?object_key:(object_key_ : s3_object_key option) () =
  ({ bucket_name = bucket_name_; object_key = object_key_ } : s3_report_location)

let make_error_report_location ?s3_report_location:(s3_report_location_ : s3_report_location option)
    () =
  ({ s3_report_location = s3_report_location_ } : error_report_location)

let make_query_temporal_range_max ?value:(value_ : long option)
    ?table_arn:(table_arn_ : amazon_resource_name option) () =
  ({ value = value_; table_arn = table_arn_ } : query_temporal_range_max)

let make_query_temporal_range ?max:(max_ : query_temporal_range_max option) () =
  ({ max = max_ } : query_temporal_range)

let make_query_spatial_coverage_max ?value:(value_ : double option)
    ?table_arn:(table_arn_ : amazon_resource_name option)
    ?partition_key:(partition_key_ : partition_key_list option) () =
  ({ value = value_; table_arn = table_arn_; partition_key = partition_key_ }
    : query_spatial_coverage_max)

let make_query_spatial_coverage ?max:(max_ : query_spatial_coverage_max option) () =
  ({ max = max_ } : query_spatial_coverage)

let make_scheduled_query_insights_response
    ?query_spatial_coverage:(query_spatial_coverage_ : query_spatial_coverage option)
    ?query_temporal_range:(query_temporal_range_ : query_temporal_range option)
    ?query_table_count:(query_table_count_ : long option) ?output_rows:(output_rows_ : long option)
    ?output_bytes:(output_bytes_ : long option) () =
  ({
     query_spatial_coverage = query_spatial_coverage_;
     query_temporal_range = query_temporal_range_;
     query_table_count = query_table_count_;
     output_rows = output_rows_;
     output_bytes = output_bytes_;
   }
    : scheduled_query_insights_response)

let make_execution_stats ?execution_time_in_millis:(execution_time_in_millis_ : long option)
    ?data_writes:(data_writes_ : long option) ?bytes_metered:(bytes_metered_ : long option)
    ?cumulative_bytes_scanned:(cumulative_bytes_scanned_ : long option)
    ?records_ingested:(records_ingested_ : long option)
    ?query_result_rows:(query_result_rows_ : long option) () =
  ({
     execution_time_in_millis = execution_time_in_millis_;
     data_writes = data_writes_;
     bytes_metered = bytes_metered_;
     cumulative_bytes_scanned = cumulative_bytes_scanned_;
     records_ingested = records_ingested_;
     query_result_rows = query_result_rows_;
   }
    : execution_stats)

let make_scheduled_query_run_summary ?invocation_time:(invocation_time_ : time option)
    ?trigger_time:(trigger_time_ : time option)
    ?run_status:(run_status_ : scheduled_query_run_status option)
    ?execution_stats:(execution_stats_ : execution_stats option)
    ?query_insights_response:(query_insights_response_ : scheduled_query_insights_response option)
    ?error_report_location:(error_report_location_ : error_report_location option)
    ?failure_reason:(failure_reason_ : error_message option) () =
  ({
     invocation_time = invocation_time_;
     trigger_time = trigger_time_;
     run_status = run_status_;
     execution_stats = execution_stats_;
     query_insights_response = query_insights_response_;
     error_report_location = error_report_location_;
     failure_reason = failure_reason_;
   }
    : scheduled_query_run_summary)

let make_scheduled_query_description ?creation_time:(creation_time_ : time option)
    ?previous_invocation_time:(previous_invocation_time_ : time option)
    ?next_invocation_time:(next_invocation_time_ : time option)
    ?target_configuration:(target_configuration_ : target_configuration option)
    ?scheduled_query_execution_role_arn:
      (scheduled_query_execution_role_arn_ : amazon_resource_name option)
    ?kms_key_id:(kms_key_id_ : string_value2048 option)
    ?error_report_configuration:(error_report_configuration_ : error_report_configuration option)
    ?last_run_summary:(last_run_summary_ : scheduled_query_run_summary option)
    ?recently_failed_runs:(recently_failed_runs_ : scheduled_query_run_summary_list option)
    ~arn:(arn_ : amazon_resource_name) ~name:(name_ : scheduled_query_name)
    ~query_string:(query_string_ : query_string) ~state:(state_ : scheduled_query_state)
    ~schedule_configuration:(schedule_configuration_ : schedule_configuration)
    ~notification_configuration:(notification_configuration_ : notification_configuration) () =
  ({
     arn = arn_;
     name = name_;
     query_string = query_string_;
     creation_time = creation_time_;
     state = state_;
     previous_invocation_time = previous_invocation_time_;
     next_invocation_time = next_invocation_time_;
     schedule_configuration = schedule_configuration_;
     notification_configuration = notification_configuration_;
     target_configuration = target_configuration_;
     scheduled_query_execution_role_arn = scheduled_query_execution_role_arn_;
     kms_key_id = kms_key_id_;
     error_report_configuration = error_report_configuration_;
     last_run_summary = last_run_summary_;
     recently_failed_runs = recently_failed_runs_;
   }
    : scheduled_query_description)

let make_describe_scheduled_query_response
    ~scheduled_query:(scheduled_query_ : scheduled_query_description) () =
  ({ scheduled_query = scheduled_query_ } : describe_scheduled_query_response)

let make_describe_scheduled_query_request
    ~scheduled_query_arn:(scheduled_query_arn_ : amazon_resource_name) () =
  ({ scheduled_query_arn = scheduled_query_arn_ } : describe_scheduled_query_request)

let make_scheduled_query_insights ~mode:(mode_ : scheduled_query_insights_mode) () =
  ({ mode = mode_ } : scheduled_query_insights)

let make_execute_scheduled_query_request ?client_token:(client_token_ : client_token option)
    ?query_insights:(query_insights_ : scheduled_query_insights option)
    ~scheduled_query_arn:(scheduled_query_arn_ : amazon_resource_name)
    ~invocation_time:(invocation_time_ : time) () =
  ({
     scheduled_query_arn = scheduled_query_arn_;
     invocation_time = invocation_time_;
     client_token = client_token_;
     query_insights = query_insights_;
   }
    : execute_scheduled_query_request)

let make_timestream_destination ?database_name:(database_name_ : resource_name option)
    ?table_name:(table_name_ : resource_name option) () =
  ({ database_name = database_name_; table_name = table_name_ } : timestream_destination)

let make_target_destination
    ?timestream_destination:(timestream_destination_ : timestream_destination option) () =
  ({ timestream_destination = timestream_destination_ } : target_destination)

let make_scheduled_query ?creation_time:(creation_time_ : time option)
    ?previous_invocation_time:(previous_invocation_time_ : time option)
    ?next_invocation_time:(next_invocation_time_ : time option)
    ?error_report_configuration:(error_report_configuration_ : error_report_configuration option)
    ?target_destination:(target_destination_ : target_destination option)
    ?last_run_status:(last_run_status_ : scheduled_query_run_status option)
    ~arn:(arn_ : amazon_resource_name) ~name:(name_ : scheduled_query_name)
    ~state:(state_ : scheduled_query_state) () =
  ({
     arn = arn_;
     name = name_;
     creation_time = creation_time_;
     state = state_;
     previous_invocation_time = previous_invocation_time_;
     next_invocation_time = next_invocation_time_;
     error_report_configuration = error_report_configuration_;
     target_destination = target_destination_;
     last_run_status = last_run_status_;
   }
    : scheduled_query)

let make_list_scheduled_queries_response
    ?next_token:(next_token_ : next_scheduled_queries_results_token option)
    ~scheduled_queries:(scheduled_queries_ : scheduled_query_list) () =
  ({ scheduled_queries = scheduled_queries_; next_token = next_token_ }
    : list_scheduled_queries_response)

let make_list_scheduled_queries_request
    ?max_results:(max_results_ : max_scheduled_queries_results option)
    ?next_token:(next_token_ : next_scheduled_queries_results_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_scheduled_queries_request)

let make_list_tags_for_resource_response
    ?next_token:(next_token_ : next_tags_for_resource_results_token option) ~tags:(tags_ : tag_list)
    () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request
    ?max_results:(max_results_ : max_tags_for_resource_result option)
    ?next_token:(next_token_ : next_tags_for_resource_results_token option)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_; max_results = max_results_; next_token = next_token_ }
    : list_tags_for_resource_request)

let make_parameter_mapping ~name:(name_ : string_) ~type_:(type__ : type_) () =
  ({ name = name_; type_ = type__ } : parameter_mapping)

let make_select_column ?name:(name_ : string_ option) ?type_:(type__ : type_ option)
    ?database_name:(database_name_ : resource_name option)
    ?table_name:(table_name_ : resource_name option) ?aliased:(aliased_ : nullable_boolean option)
    () =
  ({
     name = name_;
     type_ = type__;
     database_name = database_name_;
     table_name = table_name_;
     aliased = aliased_;
   }
    : select_column)

let make_prepare_query_response ~query_string:(query_string_ : query_string)
    ~columns:(columns_ : select_column_list) ~parameters:(parameters_ : parameter_mapping_list) () =
  ({ query_string = query_string_; columns = columns_; parameters = parameters_ }
    : prepare_query_response)

let make_prepare_query_request ?validate_only:(validate_only_ : nullable_boolean option)
    ~query_string:(query_string_ : query_string) () =
  ({ query_string = query_string_; validate_only = validate_only_ } : prepare_query_request)

let make_provisioned_capacity_request
    ?notification_configuration:
      (notification_configuration_ : account_settings_notification_configuration option)
    ~target_query_tc_u:(target_query_tc_u_ : query_tc_u) () =
  ({
     target_query_tc_u = target_query_tc_u_;
     notification_configuration = notification_configuration_;
   }
    : provisioned_capacity_request)

let make_query_insights_response
    ?query_spatial_coverage:(query_spatial_coverage_ : query_spatial_coverage option)
    ?query_temporal_range:(query_temporal_range_ : query_temporal_range option)
    ?query_table_count:(query_table_count_ : long option) ?output_rows:(output_rows_ : long option)
    ?output_bytes:(output_bytes_ : long option)
    ?unload_partition_count:(unload_partition_count_ : long option)
    ?unload_written_rows:(unload_written_rows_ : long option)
    ?unload_written_bytes:(unload_written_bytes_ : long option) () =
  ({
     query_spatial_coverage = query_spatial_coverage_;
     query_temporal_range = query_temporal_range_;
     query_table_count = query_table_count_;
     output_rows = output_rows_;
     output_bytes = output_bytes_;
     unload_partition_count = unload_partition_count_;
     unload_written_rows = unload_written_rows_;
     unload_written_bytes = unload_written_bytes_;
   }
    : query_insights_response)

let make_query_status ?progress_percentage:(progress_percentage_ : double option)
    ?cumulative_bytes_scanned:(cumulative_bytes_scanned_ : long option)
    ?cumulative_bytes_metered:(cumulative_bytes_metered_ : long option) () =
  ({
     progress_percentage = progress_percentage_;
     cumulative_bytes_scanned = cumulative_bytes_scanned_;
     cumulative_bytes_metered = cumulative_bytes_metered_;
   }
    : query_status)

let make_query_response ?next_token:(next_token_ : pagination_token option)
    ?query_status:(query_status_ : query_status option)
    ?query_insights_response:(query_insights_response_ : query_insights_response option)
    ~query_id:(query_id_ : query_id) ~rows:(rows_ : row_list)
    ~column_info:(column_info_ : column_info_list) () =
  ({
     query_id = query_id_;
     next_token = next_token_;
     rows = rows_;
     column_info = column_info_;
     query_status = query_status_;
     query_insights_response = query_insights_response_;
   }
    : query_response)

let make_query_insights ~mode:(mode_ : query_insights_mode) () = ({ mode = mode_ } : query_insights)

let make_query_request ?client_token:(client_token_ : client_request_token option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_rows:(max_rows_ : max_query_results option)
    ?query_insights:(query_insights_ : query_insights option)
    ~query_string:(query_string_ : query_string) () =
  ({
     query_string = query_string_;
     client_token = client_token_;
     next_token = next_token_;
     max_rows = max_rows_;
     query_insights = query_insights_;
   }
    : query_request)

let make_query_compute_request ?compute_mode:(compute_mode_ : compute_mode option)
    ?provisioned_capacity:(provisioned_capacity_ : provisioned_capacity_request option) () =
  ({ compute_mode = compute_mode_; provisioned_capacity = provisioned_capacity_ }
    : query_compute_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_update_scheduled_query_request
    ~scheduled_query_arn:(scheduled_query_arn_ : amazon_resource_name)
    ~state:(state_ : scheduled_query_state) () =
  ({ scheduled_query_arn = scheduled_query_arn_; state = state_ } : update_scheduled_query_request)

let make_update_account_settings_response
    ?max_query_tc_u:(max_query_tc_u_ : max_query_capacity option)
    ?query_pricing_model:(query_pricing_model_ : query_pricing_model option)
    ?query_compute:(query_compute_ : query_compute_response option) () =
  ({
     max_query_tc_u = max_query_tc_u_;
     query_pricing_model = query_pricing_model_;
     query_compute = query_compute_;
   }
    : update_account_settings_response)

let make_update_account_settings_request
    ?max_query_tc_u:(max_query_tc_u_ : max_query_capacity option)
    ?query_pricing_model:(query_pricing_model_ : query_pricing_model option)
    ?query_compute:(query_compute_ : query_compute_request option) () =
  ({
     max_query_tc_u = max_query_tc_u_;
     query_pricing_model = query_pricing_model_;
     query_compute = query_compute_;
   }
    : update_account_settings_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)
