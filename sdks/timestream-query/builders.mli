open Types

val make_sns_configuration : topic_arn:amazon_resource_name -> unit -> sns_configuration

val make_account_settings_notification_configuration :
  ?sns_configuration:sns_configuration ->
  role_arn:amazon_resource_name ->
  unit ->
  account_settings_notification_configuration

val make_cancel_query_response : ?cancellation_message:string_ -> unit -> cancel_query_response
val make_cancel_query_request : query_id:query_id -> unit -> cancel_query_request

val make_type_ :
  ?scalar_type:scalar_type ->
  ?array_column_info:column_info ->
  ?time_series_measure_value_column_info:column_info ->
  ?row_column_info:column_info_list ->
  unit ->
  type_

val make_column_info : ?name:string_ -> type_:type_ -> unit -> column_info

val make_create_scheduled_query_response :
  arn:amazon_resource_name -> unit -> create_scheduled_query_response

val make_s3_configuration :
  ?object_key_prefix:s3_object_key_prefix ->
  ?encryption_option:s3_encryption_option ->
  bucket_name:s3_bucket_name ->
  unit ->
  s3_configuration

val make_error_report_configuration :
  s3_configuration:s3_configuration -> unit -> error_report_configuration

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_multi_measure_attribute_mapping :
  ?target_multi_measure_attribute_name:schema_name ->
  source_column:schema_name ->
  measure_value_type:scalar_measure_value_type ->
  unit ->
  multi_measure_attribute_mapping

val make_mixed_measure_mapping :
  ?measure_name:schema_name ->
  ?source_column:schema_name ->
  ?target_measure_name:schema_name ->
  ?multi_measure_attribute_mappings:multi_measure_attribute_mapping_list ->
  measure_value_type:measure_value_type ->
  unit ->
  mixed_measure_mapping

val make_multi_measure_mappings :
  ?target_multi_measure_name:schema_name ->
  multi_measure_attribute_mappings:multi_measure_attribute_mapping_list ->
  unit ->
  multi_measure_mappings

val make_dimension_mapping :
  name:schema_name -> dimension_value_type:dimension_value_type -> unit -> dimension_mapping

val make_timestream_configuration :
  ?multi_measure_mappings:multi_measure_mappings ->
  ?mixed_measure_mappings:mixed_measure_mapping_list ->
  ?measure_name_column:schema_name ->
  database_name:resource_name ->
  table_name:resource_name ->
  time_column:schema_name ->
  dimension_mappings:dimension_mapping_list ->
  unit ->
  timestream_configuration

val make_target_configuration :
  timestream_configuration:timestream_configuration -> unit -> target_configuration

val make_notification_configuration :
  sns_configuration:sns_configuration -> unit -> notification_configuration

val make_schedule_configuration :
  schedule_expression:schedule_expression -> unit -> schedule_configuration

val make_create_scheduled_query_request :
  ?target_configuration:target_configuration ->
  ?client_token:client_token ->
  ?tags:tag_list ->
  ?kms_key_id:string_value2048 ->
  name:scheduled_query_name ->
  query_string:query_string ->
  schedule_configuration:schedule_configuration ->
  notification_configuration:notification_configuration ->
  scheduled_query_execution_role_arn:amazon_resource_name ->
  error_report_configuration:error_report_configuration ->
  unit ->
  create_scheduled_query_request

val make_time_series_data_point : time:timestamp -> value:datum -> unit -> time_series_data_point
val make_row : data:datum_list -> unit -> row

val make_datum :
  ?scalar_value:scalar_value ->
  ?time_series_value:time_series_data_point_list ->
  ?array_value:datum_list ->
  ?row_value:row ->
  ?null_value:nullable_boolean ->
  unit ->
  datum

val make_delete_scheduled_query_request :
  scheduled_query_arn:amazon_resource_name -> unit -> delete_scheduled_query_request

val make_last_update :
  ?target_query_tc_u:query_tc_u ->
  ?status:last_update_status ->
  ?status_message:string_ ->
  unit ->
  last_update

val make_provisioned_capacity_response :
  ?active_query_tc_u:query_tc_u ->
  ?notification_configuration:account_settings_notification_configuration ->
  ?last_update:last_update ->
  unit ->
  provisioned_capacity_response

val make_query_compute_response :
  ?compute_mode:compute_mode ->
  ?provisioned_capacity:provisioned_capacity_response ->
  unit ->
  query_compute_response

val make_describe_account_settings_response :
  ?max_query_tc_u:max_query_capacity ->
  ?query_pricing_model:query_pricing_model ->
  ?query_compute:query_compute_response ->
  unit ->
  describe_account_settings_response

val make_describe_account_settings_request : unit -> unit
val make_endpoint : address:string_ -> cache_period_in_minutes:long -> unit -> endpoint
val make_describe_endpoints_response : endpoints:endpoints -> unit -> describe_endpoints_response
val make_describe_endpoints_request : unit -> unit

val make_s3_report_location :
  ?bucket_name:s3_bucket_name -> ?object_key:s3_object_key -> unit -> s3_report_location

val make_error_report_location :
  ?s3_report_location:s3_report_location -> unit -> error_report_location

val make_query_temporal_range_max :
  ?value:long -> ?table_arn:amazon_resource_name -> unit -> query_temporal_range_max

val make_query_temporal_range : ?max:query_temporal_range_max -> unit -> query_temporal_range

val make_query_spatial_coverage_max :
  ?value:double ->
  ?table_arn:amazon_resource_name ->
  ?partition_key:partition_key_list ->
  unit ->
  query_spatial_coverage_max

val make_query_spatial_coverage : ?max:query_spatial_coverage_max -> unit -> query_spatial_coverage

val make_scheduled_query_insights_response :
  ?query_spatial_coverage:query_spatial_coverage ->
  ?query_temporal_range:query_temporal_range ->
  ?query_table_count:long ->
  ?output_rows:long ->
  ?output_bytes:long ->
  unit ->
  scheduled_query_insights_response

val make_execution_stats :
  ?execution_time_in_millis:long ->
  ?data_writes:long ->
  ?bytes_metered:long ->
  ?cumulative_bytes_scanned:long ->
  ?records_ingested:long ->
  ?query_result_rows:long ->
  unit ->
  execution_stats

val make_scheduled_query_run_summary :
  ?invocation_time:time ->
  ?trigger_time:time ->
  ?run_status:scheduled_query_run_status ->
  ?execution_stats:execution_stats ->
  ?query_insights_response:scheduled_query_insights_response ->
  ?error_report_location:error_report_location ->
  ?failure_reason:error_message ->
  unit ->
  scheduled_query_run_summary

val make_scheduled_query_description :
  ?creation_time:time ->
  ?previous_invocation_time:time ->
  ?next_invocation_time:time ->
  ?target_configuration:target_configuration ->
  ?scheduled_query_execution_role_arn:amazon_resource_name ->
  ?kms_key_id:string_value2048 ->
  ?error_report_configuration:error_report_configuration ->
  ?last_run_summary:scheduled_query_run_summary ->
  ?recently_failed_runs:scheduled_query_run_summary_list ->
  arn:amazon_resource_name ->
  name:scheduled_query_name ->
  query_string:query_string ->
  state:scheduled_query_state ->
  schedule_configuration:schedule_configuration ->
  notification_configuration:notification_configuration ->
  unit ->
  scheduled_query_description

val make_describe_scheduled_query_response :
  scheduled_query:scheduled_query_description -> unit -> describe_scheduled_query_response

val make_describe_scheduled_query_request :
  scheduled_query_arn:amazon_resource_name -> unit -> describe_scheduled_query_request

val make_scheduled_query_insights :
  mode:scheduled_query_insights_mode -> unit -> scheduled_query_insights

val make_execute_scheduled_query_request :
  ?client_token:client_token ->
  ?query_insights:scheduled_query_insights ->
  scheduled_query_arn:amazon_resource_name ->
  invocation_time:time ->
  unit ->
  execute_scheduled_query_request

val make_timestream_destination :
  ?database_name:resource_name -> ?table_name:resource_name -> unit -> timestream_destination

val make_target_destination :
  ?timestream_destination:timestream_destination -> unit -> target_destination

val make_scheduled_query :
  ?creation_time:time ->
  ?previous_invocation_time:time ->
  ?next_invocation_time:time ->
  ?error_report_configuration:error_report_configuration ->
  ?target_destination:target_destination ->
  ?last_run_status:scheduled_query_run_status ->
  arn:amazon_resource_name ->
  name:scheduled_query_name ->
  state:scheduled_query_state ->
  unit ->
  scheduled_query

val make_list_scheduled_queries_response :
  ?next_token:next_scheduled_queries_results_token ->
  scheduled_queries:scheduled_query_list ->
  unit ->
  list_scheduled_queries_response

val make_list_scheduled_queries_request :
  ?max_results:max_scheduled_queries_results ->
  ?next_token:next_scheduled_queries_results_token ->
  unit ->
  list_scheduled_queries_request

val make_list_tags_for_resource_response :
  ?next_token:next_tags_for_resource_results_token ->
  tags:tag_list ->
  unit ->
  list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?max_results:max_tags_for_resource_result ->
  ?next_token:next_tags_for_resource_results_token ->
  resource_ar_n:amazon_resource_name ->
  unit ->
  list_tags_for_resource_request

val make_parameter_mapping : name:string_ -> type_:type_ -> unit -> parameter_mapping

val make_select_column :
  ?name:string_ ->
  ?type_:type_ ->
  ?database_name:resource_name ->
  ?table_name:resource_name ->
  ?aliased:nullable_boolean ->
  unit ->
  select_column

val make_prepare_query_response :
  query_string:query_string ->
  columns:select_column_list ->
  parameters:parameter_mapping_list ->
  unit ->
  prepare_query_response

val make_prepare_query_request :
  ?validate_only:nullable_boolean -> query_string:query_string -> unit -> prepare_query_request

val make_provisioned_capacity_request :
  ?notification_configuration:account_settings_notification_configuration ->
  target_query_tc_u:query_tc_u ->
  unit ->
  provisioned_capacity_request

val make_query_insights_response :
  ?query_spatial_coverage:query_spatial_coverage ->
  ?query_temporal_range:query_temporal_range ->
  ?query_table_count:long ->
  ?output_rows:long ->
  ?output_bytes:long ->
  ?unload_partition_count:long ->
  ?unload_written_rows:long ->
  ?unload_written_bytes:long ->
  unit ->
  query_insights_response

val make_query_status :
  ?progress_percentage:double ->
  ?cumulative_bytes_scanned:long ->
  ?cumulative_bytes_metered:long ->
  unit ->
  query_status

val make_query_response :
  ?next_token:pagination_token ->
  ?query_status:query_status ->
  ?query_insights_response:query_insights_response ->
  query_id:query_id ->
  rows:row_list ->
  column_info:column_info_list ->
  unit ->
  query_response

val make_query_insights : mode:query_insights_mode -> unit -> query_insights

val make_query_request :
  ?client_token:client_request_token ->
  ?next_token:pagination_token ->
  ?max_rows:max_query_results ->
  ?query_insights:query_insights ->
  query_string:query_string ->
  unit ->
  query_request

val make_query_compute_request :
  ?compute_mode:compute_mode ->
  ?provisioned_capacity:provisioned_capacity_request ->
  unit ->
  query_compute_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_ar_n:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_request

val make_update_scheduled_query_request :
  scheduled_query_arn:amazon_resource_name ->
  state:scheduled_query_state ->
  unit ->
  update_scheduled_query_request

val make_update_account_settings_response :
  ?max_query_tc_u:max_query_capacity ->
  ?query_pricing_model:query_pricing_model ->
  ?query_compute:query_compute_response ->
  unit ->
  update_account_settings_response

val make_update_account_settings_request :
  ?max_query_tc_u:max_query_capacity ->
  ?query_pricing_model:query_pricing_model ->
  ?query_compute:query_compute_request ->
  unit ->
  update_account_settings_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request
