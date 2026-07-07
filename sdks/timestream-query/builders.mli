open Types

val make_update_scheduled_query_request :
  state:scheduled_query_state ->
  scheduled_query_arn:amazon_resource_name ->
  unit ->
  update_scheduled_query_request

val make_sns_configuration : topic_arn:amazon_resource_name -> unit -> sns_configuration

val make_account_settings_notification_configuration :
  ?sns_configuration:sns_configuration ->
  role_arn:amazon_resource_name ->
  unit ->
  account_settings_notification_configuration

val make_last_update :
  ?status_message:string_ ->
  ?status:last_update_status ->
  ?target_query_tc_u:query_tc_u ->
  unit ->
  last_update

val make_provisioned_capacity_response :
  ?last_update:last_update ->
  ?notification_configuration:account_settings_notification_configuration ->
  ?active_query_tc_u:query_tc_u ->
  unit ->
  provisioned_capacity_response

val make_query_compute_response :
  ?provisioned_capacity:provisioned_capacity_response ->
  ?compute_mode:compute_mode ->
  unit ->
  query_compute_response

val make_update_account_settings_response :
  ?query_compute:query_compute_response ->
  ?query_pricing_model:query_pricing_model ->
  ?max_query_tc_u:max_query_capacity ->
  unit ->
  update_account_settings_response

val make_provisioned_capacity_request :
  ?notification_configuration:account_settings_notification_configuration ->
  target_query_tc_u:query_tc_u ->
  unit ->
  provisioned_capacity_request

val make_query_compute_request :
  ?provisioned_capacity:provisioned_capacity_request ->
  ?compute_mode:compute_mode ->
  unit ->
  query_compute_request

val make_update_account_settings_request :
  ?query_compute:query_compute_request ->
  ?query_pricing_model:query_pricing_model ->
  ?max_query_tc_u:max_query_capacity ->
  unit ->
  update_account_settings_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:amazon_resource_name -> unit -> untag_resource_request

val make_column_info : ?name:string_ -> type_:type_ -> unit -> column_info

val make_type_ :
  ?row_column_info:column_info_list ->
  ?time_series_measure_value_column_info:column_info ->
  ?array_column_info:column_info ->
  ?scalar_type:scalar_type ->
  unit ->
  type_

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_ar_n:amazon_resource_name -> unit -> tag_resource_request

val make_datum :
  ?null_value:nullable_boolean ->
  ?row_value:row ->
  ?array_value:datum_list ->
  ?time_series_value:time_series_data_point_list ->
  ?scalar_value:scalar_value ->
  unit ->
  datum

val make_row : data:datum_list -> unit -> row
val make_time_series_data_point : value:datum -> time:timestamp -> unit -> time_series_data_point

val make_query_status :
  ?cumulative_bytes_metered:long ->
  ?cumulative_bytes_scanned:long ->
  ?progress_percentage:double ->
  unit ->
  query_status

val make_query_spatial_coverage_max :
  ?partition_key:partition_key_list ->
  ?table_arn:amazon_resource_name ->
  ?value:double ->
  unit ->
  query_spatial_coverage_max

val make_query_spatial_coverage : ?max:query_spatial_coverage_max -> unit -> query_spatial_coverage

val make_query_temporal_range_max :
  ?table_arn:amazon_resource_name -> ?value:long -> unit -> query_temporal_range_max

val make_query_temporal_range : ?max:query_temporal_range_max -> unit -> query_temporal_range

val make_query_insights_response :
  ?unload_written_bytes:long ->
  ?unload_written_rows:long ->
  ?unload_partition_count:long ->
  ?output_bytes:long ->
  ?output_rows:long ->
  ?query_table_count:long ->
  ?query_temporal_range:query_temporal_range ->
  ?query_spatial_coverage:query_spatial_coverage ->
  unit ->
  query_insights_response

val make_query_response :
  ?query_insights_response:query_insights_response ->
  ?query_status:query_status ->
  ?next_token:pagination_token ->
  column_info:column_info_list ->
  rows:row_list ->
  query_id:query_id ->
  unit ->
  query_response

val make_query_insights : mode:query_insights_mode -> unit -> query_insights

val make_query_request :
  ?query_insights:query_insights ->
  ?max_rows:max_query_results ->
  ?next_token:pagination_token ->
  ?client_token:client_request_token ->
  query_string:query_string ->
  unit ->
  query_request

val make_select_column :
  ?aliased:nullable_boolean ->
  ?table_name:resource_name ->
  ?database_name:resource_name ->
  ?type_:type_ ->
  ?name:string_ ->
  unit ->
  select_column

val make_parameter_mapping : type_:type_ -> name:string_ -> unit -> parameter_mapping

val make_prepare_query_response :
  parameters:parameter_mapping_list ->
  columns:select_column_list ->
  query_string:query_string ->
  unit ->
  prepare_query_response

val make_prepare_query_request :
  ?validate_only:nullable_boolean -> query_string:query_string -> unit -> prepare_query_request

val make_list_tags_for_resource_response :
  ?next_token:next_tags_for_resource_results_token ->
  tags:tag_list ->
  unit ->
  list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?next_token:next_tags_for_resource_results_token ->
  ?max_results:max_tags_for_resource_result ->
  resource_ar_n:amazon_resource_name ->
  unit ->
  list_tags_for_resource_request

val make_s3_configuration :
  ?encryption_option:s3_encryption_option ->
  ?object_key_prefix:s3_object_key_prefix ->
  bucket_name:s3_bucket_name ->
  unit ->
  s3_configuration

val make_error_report_configuration :
  s3_configuration:s3_configuration -> unit -> error_report_configuration

val make_timestream_destination :
  ?table_name:resource_name -> ?database_name:resource_name -> unit -> timestream_destination

val make_target_destination :
  ?timestream_destination:timestream_destination -> unit -> target_destination

val make_scheduled_query :
  ?last_run_status:scheduled_query_run_status ->
  ?target_destination:target_destination ->
  ?error_report_configuration:error_report_configuration ->
  ?next_invocation_time:time ->
  ?previous_invocation_time:time ->
  ?creation_time:time ->
  state:scheduled_query_state ->
  name:scheduled_query_name ->
  arn:amazon_resource_name ->
  unit ->
  scheduled_query

val make_list_scheduled_queries_response :
  ?next_token:next_scheduled_queries_results_token ->
  scheduled_queries:scheduled_query_list ->
  unit ->
  list_scheduled_queries_response

val make_list_scheduled_queries_request :
  ?next_token:next_scheduled_queries_results_token ->
  ?max_results:max_scheduled_queries_results ->
  unit ->
  list_scheduled_queries_request

val make_scheduled_query_insights :
  mode:scheduled_query_insights_mode -> unit -> scheduled_query_insights

val make_execute_scheduled_query_request :
  ?query_insights:scheduled_query_insights ->
  ?client_token:client_token ->
  invocation_time:time ->
  scheduled_query_arn:amazon_resource_name ->
  unit ->
  execute_scheduled_query_request

val make_schedule_configuration :
  schedule_expression:schedule_expression -> unit -> schedule_configuration

val make_notification_configuration :
  sns_configuration:sns_configuration -> unit -> notification_configuration

val make_dimension_mapping :
  dimension_value_type:dimension_value_type -> name:schema_name -> unit -> dimension_mapping

val make_multi_measure_attribute_mapping :
  ?target_multi_measure_attribute_name:schema_name ->
  measure_value_type:scalar_measure_value_type ->
  source_column:schema_name ->
  unit ->
  multi_measure_attribute_mapping

val make_multi_measure_mappings :
  ?target_multi_measure_name:schema_name ->
  multi_measure_attribute_mappings:multi_measure_attribute_mapping_list ->
  unit ->
  multi_measure_mappings

val make_mixed_measure_mapping :
  ?multi_measure_attribute_mappings:multi_measure_attribute_mapping_list ->
  ?target_measure_name:schema_name ->
  ?source_column:schema_name ->
  ?measure_name:schema_name ->
  measure_value_type:measure_value_type ->
  unit ->
  mixed_measure_mapping

val make_timestream_configuration :
  ?measure_name_column:schema_name ->
  ?mixed_measure_mappings:mixed_measure_mapping_list ->
  ?multi_measure_mappings:multi_measure_mappings ->
  dimension_mappings:dimension_mapping_list ->
  time_column:schema_name ->
  table_name:resource_name ->
  database_name:resource_name ->
  unit ->
  timestream_configuration

val make_target_configuration :
  timestream_configuration:timestream_configuration -> unit -> target_configuration

val make_execution_stats :
  ?query_result_rows:long ->
  ?records_ingested:long ->
  ?cumulative_bytes_scanned:long ->
  ?bytes_metered:long ->
  ?data_writes:long ->
  ?execution_time_in_millis:long ->
  unit ->
  execution_stats

val make_scheduled_query_insights_response :
  ?output_bytes:long ->
  ?output_rows:long ->
  ?query_table_count:long ->
  ?query_temporal_range:query_temporal_range ->
  ?query_spatial_coverage:query_spatial_coverage ->
  unit ->
  scheduled_query_insights_response

val make_s3_report_location :
  ?object_key:s3_object_key -> ?bucket_name:s3_bucket_name -> unit -> s3_report_location

val make_error_report_location :
  ?s3_report_location:s3_report_location -> unit -> error_report_location

val make_scheduled_query_run_summary :
  ?failure_reason:error_message ->
  ?error_report_location:error_report_location ->
  ?query_insights_response:scheduled_query_insights_response ->
  ?execution_stats:execution_stats ->
  ?run_status:scheduled_query_run_status ->
  ?trigger_time:time ->
  ?invocation_time:time ->
  unit ->
  scheduled_query_run_summary

val make_scheduled_query_description :
  ?recently_failed_runs:scheduled_query_run_summary_list ->
  ?last_run_summary:scheduled_query_run_summary ->
  ?error_report_configuration:error_report_configuration ->
  ?kms_key_id:string_value2048 ->
  ?scheduled_query_execution_role_arn:amazon_resource_name ->
  ?target_configuration:target_configuration ->
  ?next_invocation_time:time ->
  ?previous_invocation_time:time ->
  ?creation_time:time ->
  notification_configuration:notification_configuration ->
  schedule_configuration:schedule_configuration ->
  state:scheduled_query_state ->
  query_string:query_string ->
  name:scheduled_query_name ->
  arn:amazon_resource_name ->
  unit ->
  scheduled_query_description

val make_describe_scheduled_query_response :
  scheduled_query:scheduled_query_description -> unit -> describe_scheduled_query_response

val make_describe_scheduled_query_request :
  scheduled_query_arn:amazon_resource_name -> unit -> describe_scheduled_query_request

val make_endpoint : cache_period_in_minutes:long -> address:string_ -> unit -> endpoint
val make_describe_endpoints_response : endpoints:endpoints -> unit -> describe_endpoints_response
val make_describe_endpoints_request : unit -> unit

val make_describe_account_settings_response :
  ?query_compute:query_compute_response ->
  ?query_pricing_model:query_pricing_model ->
  ?max_query_tc_u:max_query_capacity ->
  unit ->
  describe_account_settings_response

val make_describe_account_settings_request : unit -> unit

val make_delete_scheduled_query_request :
  scheduled_query_arn:amazon_resource_name -> unit -> delete_scheduled_query_request

val make_create_scheduled_query_response :
  arn:amazon_resource_name -> unit -> create_scheduled_query_response

val make_create_scheduled_query_request :
  ?kms_key_id:string_value2048 ->
  ?tags:tag_list ->
  ?client_token:client_token ->
  ?target_configuration:target_configuration ->
  error_report_configuration:error_report_configuration ->
  scheduled_query_execution_role_arn:amazon_resource_name ->
  notification_configuration:notification_configuration ->
  schedule_configuration:schedule_configuration ->
  query_string:query_string ->
  name:scheduled_query_name ->
  unit ->
  create_scheduled_query_request

val make_cancel_query_response : ?cancellation_message:string_ -> unit -> cancel_query_response
val make_cancel_query_request : query_id:query_id -> unit -> cancel_query_request
