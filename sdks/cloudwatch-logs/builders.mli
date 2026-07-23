open Types

val make_account_policy :
  ?policy_name:policy_name ->
  ?policy_document:account_policy_document ->
  ?last_updated_time:timestamp ->
  ?policy_type:policy_type ->
  ?scope:scope ->
  ?selection_criteria:selection_criteria ->
  ?account_id:account_id ->
  unit ->
  account_policy

val make_add_key_entry :
  ?overwrite_if_exists:overwrite_if_exists ->
  key:key ->
  value:add_key_value ->
  unit ->
  add_key_entry

val make_add_keys : entries:add_key_entries -> unit -> add_keys

val make_grouping_identifier :
  ?key:grouping_identifier_key -> ?value:grouping_identifier_value -> unit -> grouping_identifier

val make_aggregate_log_group_summary :
  ?log_group_count:log_group_count ->
  ?grouping_identifiers:grouping_identifiers ->
  unit ->
  aggregate_log_group_summary

val make_record_field : ?name:field_header -> ?mandatory:boolean_ -> unit -> record_field

val make_pattern_token :
  ?dynamic_token_position:dynamic_token_position ->
  ?is_dynamic:boolean_ ->
  ?token_string:token_string ->
  ?enumerations:enumerations ->
  ?inferred_token_name:inferred_token_name ->
  unit ->
  pattern_token

val make_log_event : ?timestamp:timestamp -> ?message:event_message -> unit -> log_event

val make_anomaly :
  ?pattern_regex:pattern_regex ->
  ?priority:priority ->
  ?suppressed:boolean_ ->
  ?suppressed_date:epoch_millis ->
  ?suppressed_until:epoch_millis ->
  ?is_pattern_level_suppression:boolean_ ->
  anomaly_id:anomaly_id ->
  pattern_id:pattern_id ->
  anomaly_detector_arn:anomaly_detector_arn ->
  pattern_string:pattern_string ->
  first_seen:epoch_millis ->
  last_seen:epoch_millis ->
  description:description ->
  active:boolean_ ->
  state:state ->
  histogram:histogram ->
  log_samples:log_samples ->
  pattern_tokens:pattern_tokens ->
  log_group_arn_list:log_group_arn_list ->
  unit ->
  anomaly

val make_anomaly_detector :
  ?anomaly_detector_arn:anomaly_detector_arn ->
  ?detector_name:detector_name ->
  ?log_group_arn_list:log_group_arn_list ->
  ?evaluation_frequency:evaluation_frequency ->
  ?filter_pattern:filter_pattern ->
  ?anomaly_detector_status:anomaly_detector_status ->
  ?kms_key_id:kms_key_id ->
  ?creation_time_stamp:epoch_millis ->
  ?last_modified_time_stamp:epoch_millis ->
  ?anomaly_visibility_time:anomaly_visibility_time ->
  unit ->
  anomaly_detector

val make_associate_kms_key_request :
  ?log_group_name:log_group_name ->
  ?resource_identifier:resource_identifier ->
  kms_key_id:kms_key_id ->
  unit ->
  associate_kms_key_request

val make_associate_source_to_s3_table_integration_response :
  ?identifier:s3_table_integration_source_identifier ->
  unit ->
  associate_source_to_s3_table_integration_response

val make_data_source : ?type_:data_source_type -> name:data_source_name -> unit -> data_source

val make_associate_source_to_s3_table_integration_request :
  integration_arn:arn ->
  data_source:data_source ->
  unit ->
  associate_source_to_s3_table_integration_request

val make_cs_v :
  ?quote_character:quote_character ->
  ?delimiter:delimiter ->
  ?columns:columns ->
  ?source:source ->
  ?destination:destination_field ->
  unit ->
  cs_v

val make_cancel_export_task_request : task_id:export_task_id -> unit -> cancel_export_task_request
val make_import_statistics : ?bytes_imported:stored_bytes -> unit -> import_statistics

val make_cancel_import_task_response :
  ?import_id:import_id ->
  ?import_statistics:import_statistics ->
  ?import_status:import_status ->
  ?creation_time:timestamp ->
  ?last_updated_time:timestamp ->
  unit ->
  cancel_import_task_response

val make_cancel_import_task_request : import_id:import_id -> unit -> cancel_import_task_request

val make_s3_tables_integration :
  ?datasource_name:s3_tables_datasource_name ->
  ?datasource_type:s3_tables_datasource_type ->
  unit ->
  s3_tables_integration

val make_delivery_source_configuration_schema :
  ?supported_values:delivery_source_configuration_supported_values ->
  ?min_value:delivery_source_configuration_numeric_value ->
  ?max_value:delivery_source_configuration_numeric_value ->
  key_name:delivery_source_configuration_schema_field ->
  value_type:delivery_source_configuration_schema_value_type ->
  default_value:delivery_source_configuration_schema_field ->
  unit ->
  delivery_source_configuration_schema

val make_s3_delivery_configuration :
  ?suffix_path:delivery_suffix_path ->
  ?enable_hive_compatible_path:boolean_ ->
  unit ->
  s3_delivery_configuration

val make_configuration_template_delivery_config_values :
  ?record_fields:record_fields ->
  ?field_delimiter:field_delimiter ->
  ?s3_delivery_configuration:s3_delivery_configuration ->
  unit ->
  configuration_template_delivery_config_values

val make_configuration_template :
  ?service:service ->
  ?log_type:log_type ->
  ?resource_type:resource_type ->
  ?delivery_destination_type:delivery_destination_type ->
  ?default_delivery_config_values:configuration_template_delivery_config_values ->
  ?allowed_fields:allowed_fields ->
  ?allowed_output_formats:output_formats ->
  ?allowed_action_for_allow_vended_logs_delivery_for_resource:
    allowed_action_for_allow_vended_logs_delivery_for_resource ->
  ?allowed_field_delimiters:allowed_field_delimiters ->
  ?allowed_suffix_path_fields:record_fields ->
  ?delivery_source_configuration:delivery_source_configuration_schemas ->
  ?s3_tables_integration:s3_tables_integration ->
  unit ->
  configuration_template

val make_copy_value_entry :
  ?overwrite_if_exists:overwrite_if_exists ->
  source:source ->
  target:target ->
  unit ->
  copy_value_entry

val make_copy_value : entries:copy_value_entries -> unit -> copy_value

val make_delivery :
  ?id:delivery_id ->
  ?arn:arn ->
  ?delivery_source_name:delivery_source_name ->
  ?delivery_destination_arn:arn ->
  ?delivery_destination_type:delivery_destination_type ->
  ?record_fields:record_fields ->
  ?field_delimiter:field_delimiter ->
  ?s3_delivery_configuration:s3_delivery_configuration ->
  ?tags:tags ->
  unit ->
  delivery

val make_create_delivery_response : ?delivery:delivery -> unit -> create_delivery_response

val make_create_delivery_request :
  ?record_fields:record_fields ->
  ?field_delimiter:field_delimiter ->
  ?s3_delivery_configuration:s3_delivery_configuration ->
  ?tags:tags ->
  delivery_source_name:delivery_source_name ->
  delivery_destination_arn:arn ->
  unit ->
  create_delivery_request

val make_create_export_task_response :
  ?task_id:export_task_id -> unit -> create_export_task_response

val make_create_export_task_request :
  ?task_name:export_task_name ->
  ?log_stream_name_prefix:log_stream_name ->
  ?destination_prefix:export_destination_prefix ->
  log_group_name:log_group_name ->
  from_:timestamp ->
  to_:timestamp ->
  destination:export_destination_bucket ->
  unit ->
  create_export_task_request

val make_create_import_task_response :
  ?import_id:import_id ->
  ?import_destination_arn:arn ->
  ?creation_time:timestamp ->
  unit ->
  create_import_task_response

val make_import_filter :
  ?start_event_time:timestamp -> ?end_event_time:timestamp -> unit -> import_filter

val make_create_import_task_request :
  ?import_filter:import_filter ->
  import_source_arn:arn ->
  import_role_arn:role_arn ->
  unit ->
  create_import_task_request

val make_create_log_anomaly_detector_response :
  ?anomaly_detector_arn:anomaly_detector_arn -> unit -> create_log_anomaly_detector_response

val make_create_log_anomaly_detector_request :
  ?detector_name:detector_name ->
  ?evaluation_frequency:evaluation_frequency ->
  ?filter_pattern:filter_pattern ->
  ?kms_key_id:detector_kms_key_arn ->
  ?anomaly_visibility_time:anomaly_visibility_time ->
  ?tags:tags ->
  log_group_arn_list:log_group_arn_list ->
  unit ->
  create_log_anomaly_detector_request

val make_create_log_group_request :
  ?kms_key_id:kms_key_id ->
  ?tags:tags ->
  ?log_group_class:log_group_class ->
  ?deletion_protection_enabled:deletion_protection_enabled ->
  log_group_name:log_group_name ->
  unit ->
  create_log_group_request

val make_create_log_stream_request :
  log_group_name:log_group_name ->
  log_stream_name:log_stream_name ->
  unit ->
  create_log_stream_request

val make_create_lookup_table_response :
  ?lookup_table_arn:arn -> ?created_at:timestamp -> unit -> create_lookup_table_response

val make_create_lookup_table_request :
  ?description:lookup_table_description ->
  ?kms_key_id:kms_key_id ->
  ?tags:tags ->
  lookup_table_name:lookup_table_name ->
  table_body:table_body ->
  unit ->
  create_lookup_table_request

val make_create_scheduled_query_response :
  ?scheduled_query_arn:arn ->
  ?state:scheduled_query_state ->
  unit ->
  create_scheduled_query_response

val make_s3_configuration :
  ?owner_account_id:account_id ->
  ?kms_key_id:kms_key_id ->
  destination_identifier:s3_uri ->
  role_arn:role_arn ->
  unit ->
  s3_configuration

val make_destination_configuration :
  s3_configuration:s3_configuration -> unit -> destination_configuration

val make_create_scheduled_query_request :
  ?description:scheduled_query_description ->
  ?log_group_identifiers:scheduled_query_log_group_identifiers ->
  ?timezone:schedule_timezone ->
  ?start_time_offset:start_time_offset ->
  ?end_time_offset:end_time_offset ->
  ?destination_configuration:destination_configuration ->
  ?schedule_start_time:timestamp ->
  ?schedule_end_time:timestamp ->
  ?state:scheduled_query_state ->
  ?tags:tags ->
  name:scheduled_query_name ->
  query_language:query_language ->
  query_string:query_string ->
  schedule_expression:schedule_expression ->
  execution_role_arn:role_arn ->
  unit ->
  create_scheduled_query_request

val make_data_source_filter :
  ?type_:data_source_type -> name:data_source_name -> unit -> data_source_filter

val make_date_time_converter :
  ?target_format:target_format ->
  ?source_timezone:source_timezone ->
  ?target_timezone:target_timezone ->
  ?locale:locale ->
  source:source ->
  target:target ->
  match_patterns:match_patterns ->
  unit ->
  date_time_converter

val make_delete_account_policy_request :
  policy_name:policy_name -> policy_type:policy_type -> unit -> delete_account_policy_request

val make_delete_data_protection_policy_request :
  log_group_identifier:log_group_identifier -> unit -> delete_data_protection_policy_request

val make_delete_delivery_request : id:delivery_id -> unit -> delete_delivery_request

val make_delete_delivery_destination_request :
  name:delivery_destination_name -> unit -> delete_delivery_destination_request

val make_delete_delivery_destination_policy_request :
  delivery_destination_name:delivery_destination_name ->
  unit ->
  delete_delivery_destination_policy_request

val make_delete_delivery_source_request :
  name:delivery_source_name -> unit -> delete_delivery_source_request

val make_delete_destination_request :
  destination_name:destination_name -> unit -> delete_destination_request

val make_delete_index_policy_response : unit -> unit

val make_delete_index_policy_request :
  log_group_identifier:log_group_identifier -> unit -> delete_index_policy_request

val make_delete_integration_response : unit -> unit

val make_delete_integration_request :
  ?force:force -> integration_name:integration_name -> unit -> delete_integration_request

val make_delete_keys : with_keys:delete_with_keys -> unit -> delete_keys

val make_delete_log_anomaly_detector_request :
  anomaly_detector_arn:anomaly_detector_arn -> unit -> delete_log_anomaly_detector_request

val make_delete_log_group_request :
  log_group_name:log_group_name -> unit -> delete_log_group_request

val make_delete_log_stream_request :
  log_group_name:log_group_name ->
  log_stream_name:log_stream_name ->
  unit ->
  delete_log_stream_request

val make_delete_lookup_table_request : lookup_table_arn:arn -> unit -> delete_lookup_table_request

val make_delete_metric_filter_request :
  log_group_name:log_group_name -> filter_name:filter_name -> unit -> delete_metric_filter_request

val make_delete_query_definition_response :
  ?success:success -> unit -> delete_query_definition_response

val make_delete_query_definition_request :
  query_definition_id:query_id -> unit -> delete_query_definition_request

val make_delete_resource_policy_request :
  ?policy_name:policy_name ->
  ?resource_arn:arn ->
  ?expected_revision_id:expected_revision_id ->
  unit ->
  delete_resource_policy_request

val make_delete_retention_policy_request :
  log_group_name:log_group_name -> unit -> delete_retention_policy_request

val make_delete_scheduled_query_response : unit -> unit

val make_delete_scheduled_query_request :
  identifier:scheduled_query_identifier -> unit -> delete_scheduled_query_request

val make_delete_subscription_filter_request :
  log_group_name:log_group_name ->
  filter_name:filter_name ->
  unit ->
  delete_subscription_filter_request

val make_delete_syslog_configuration_request :
  ?vpc_endpoint_id:vpc_endpoint_id ->
  log_group_identifier:log_group_identifier ->
  unit ->
  delete_syslog_configuration_request

val make_delete_transformer_request :
  log_group_identifier:log_group_identifier -> unit -> delete_transformer_request

val make_delivery_destination_configuration :
  destination_resource_arn:arn -> unit -> delivery_destination_configuration

val make_delivery_destination :
  ?name:delivery_destination_name ->
  ?arn:arn ->
  ?delivery_destination_type:delivery_destination_type ->
  ?output_format:output_format ->
  ?delivery_destination_configuration:delivery_destination_configuration ->
  ?tags:tags ->
  unit ->
  delivery_destination

val make_delivery_source :
  ?name:delivery_source_name ->
  ?arn:arn ->
  ?resource_arns:resource_arns ->
  ?service:service ->
  ?log_type:log_type ->
  ?tags:tags ->
  ?delivery_source_configuration:delivery_source_configuration ->
  ?status:delivery_source_status ->
  ?status_reason:delivery_source_status_reason ->
  unit ->
  delivery_source

val make_describe_account_policies_response :
  ?account_policies:account_policies ->
  ?next_token:next_token ->
  unit ->
  describe_account_policies_response

val make_describe_account_policies_request :
  ?policy_name:policy_name ->
  ?account_identifiers:account_ids ->
  ?next_token:next_token ->
  policy_type:policy_type ->
  unit ->
  describe_account_policies_request

val make_describe_configuration_templates_response :
  ?configuration_templates:configuration_templates ->
  ?next_token:next_token ->
  unit ->
  describe_configuration_templates_response

val make_describe_configuration_templates_request :
  ?service:service ->
  ?log_types:log_types ->
  ?resource_types:resource_types ->
  ?delivery_destination_types:delivery_destination_types ->
  ?next_token:next_token ->
  ?limit:describe_limit ->
  unit ->
  describe_configuration_templates_request

val make_describe_deliveries_response :
  ?deliveries:deliveries -> ?next_token:next_token -> unit -> describe_deliveries_response

val make_describe_deliveries_request :
  ?next_token:next_token -> ?limit:describe_limit -> unit -> describe_deliveries_request

val make_describe_delivery_destinations_response :
  ?delivery_destinations:delivery_destinations ->
  ?next_token:next_token ->
  unit ->
  describe_delivery_destinations_response

val make_describe_delivery_destinations_request :
  ?next_token:next_token -> ?limit:describe_limit -> unit -> describe_delivery_destinations_request

val make_describe_delivery_sources_response :
  ?delivery_sources:delivery_sources ->
  ?next_token:next_token ->
  unit ->
  describe_delivery_sources_response

val make_describe_delivery_sources_request :
  ?next_token:next_token -> ?limit:describe_limit -> unit -> describe_delivery_sources_request

val make_destination :
  ?destination_name:destination_name ->
  ?target_arn:target_arn ->
  ?role_arn:role_arn ->
  ?access_policy:access_policy ->
  ?arn:arn ->
  ?creation_time:timestamp ->
  unit ->
  destination

val make_describe_destinations_response :
  ?destinations:destinations -> ?next_token:next_token -> unit -> describe_destinations_response

val make_describe_destinations_request :
  ?destination_name_prefix:destination_name ->
  ?next_token:next_token ->
  ?limit:describe_limit ->
  unit ->
  describe_destinations_request

val make_export_task_execution_info :
  ?creation_time:timestamp -> ?completion_time:timestamp -> unit -> export_task_execution_info

val make_export_task_status :
  ?code:export_task_status_code -> ?message:export_task_status_message -> unit -> export_task_status

val make_export_task :
  ?task_id:export_task_id ->
  ?task_name:export_task_name ->
  ?log_group_name:log_group_name ->
  ?from_:timestamp ->
  ?to_:timestamp ->
  ?destination:export_destination_bucket ->
  ?destination_prefix:export_destination_prefix ->
  ?status:export_task_status ->
  ?execution_info:export_task_execution_info ->
  unit ->
  export_task

val make_describe_export_tasks_response :
  ?export_tasks:export_tasks -> ?next_token:next_token -> unit -> describe_export_tasks_response

val make_describe_export_tasks_request :
  ?task_id:export_task_id ->
  ?status_code:export_task_status_code ->
  ?next_token:next_token ->
  ?limit:describe_limit ->
  unit ->
  describe_export_tasks_request

val make_field_index :
  ?log_group_identifier:log_group_identifier ->
  ?field_index_name:field_index_name ->
  ?last_scan_time:timestamp ->
  ?first_event_time:timestamp ->
  ?last_event_time:timestamp ->
  ?type_:index_type ->
  unit ->
  field_index

val make_describe_field_indexes_response :
  ?field_indexes:field_indexes -> ?next_token:next_token -> unit -> describe_field_indexes_response

val make_describe_field_indexes_request :
  ?next_token:next_token ->
  log_group_identifiers:describe_field_indexes_log_group_identifiers ->
  unit ->
  describe_field_indexes_request

val make_import_batch :
  ?error_message:error_message -> batch_id:batch_id -> status:import_status -> unit -> import_batch

val make_describe_import_task_batches_response :
  ?import_source_arn:arn ->
  ?import_id:import_id ->
  ?import_batches:import_batch_list ->
  ?next_token:next_token ->
  unit ->
  describe_import_task_batches_response

val make_describe_import_task_batches_request :
  ?batch_import_status:import_status_list ->
  ?limit:describe_limit ->
  ?next_token:next_token ->
  import_id:import_id ->
  unit ->
  describe_import_task_batches_request

val make_import :
  ?import_id:import_id ->
  ?import_source_arn:arn ->
  ?import_status:import_status ->
  ?import_destination_arn:arn ->
  ?import_statistics:import_statistics ->
  ?import_filter:import_filter ->
  ?creation_time:timestamp ->
  ?last_updated_time:timestamp ->
  ?error_message:error_message ->
  unit ->
  import

val make_describe_import_tasks_response :
  ?imports:import_list -> ?next_token:next_token -> unit -> describe_import_tasks_response

val make_describe_import_tasks_request :
  ?import_id:import_id ->
  ?import_status:import_status ->
  ?import_source_arn:arn ->
  ?limit:describe_limit ->
  ?next_token:next_token ->
  unit ->
  describe_import_tasks_request

val make_index_policy :
  ?log_group_identifier:log_group_identifier ->
  ?last_update_time:timestamp ->
  ?policy_document:policy_document ->
  ?policy_name:policy_name ->
  ?source:index_source ->
  unit ->
  index_policy

val make_describe_index_policies_response :
  ?index_policies:index_policies ->
  ?next_token:next_token ->
  unit ->
  describe_index_policies_response

val make_describe_index_policies_request :
  ?next_token:next_token ->
  log_group_identifiers:describe_index_policies_log_group_identifiers ->
  unit ->
  describe_index_policies_request

val make_log_group :
  ?log_group_name:log_group_name ->
  ?creation_time:timestamp ->
  ?retention_in_days:days ->
  ?metric_filter_count:filter_count ->
  ?arn:arn ->
  ?stored_bytes:stored_bytes ->
  ?kms_key_id:kms_key_id ->
  ?data_protection_status:data_protection_status ->
  ?inherited_properties:inherited_properties ->
  ?log_group_class:log_group_class ->
  ?log_group_arn:arn ->
  ?deletion_protection_enabled:deletion_protection_enabled ->
  ?bearer_token_authentication_enabled:bearer_token_authentication_enabled ->
  unit ->
  log_group

val make_describe_log_groups_response :
  ?log_groups:log_groups -> ?next_token:next_token -> unit -> describe_log_groups_response

val make_describe_log_groups_request :
  ?account_identifiers:account_ids ->
  ?log_group_name_prefix:log_group_name ->
  ?log_group_name_pattern:log_group_name_pattern ->
  ?next_token:next_token ->
  ?limit:describe_limit ->
  ?include_linked_accounts:include_linked_accounts ->
  ?log_group_class:log_group_class ->
  ?log_group_identifiers:describe_log_groups_log_group_identifiers ->
  unit ->
  describe_log_groups_request

val make_log_stream :
  ?log_stream_name:log_stream_name ->
  ?creation_time:timestamp ->
  ?first_event_timestamp:timestamp ->
  ?last_event_timestamp:timestamp ->
  ?last_ingestion_time:timestamp ->
  ?upload_sequence_token:sequence_token ->
  ?arn:arn ->
  ?stored_bytes:stored_bytes ->
  unit ->
  log_stream

val make_describe_log_streams_response :
  ?log_streams:log_streams -> ?next_token:next_token -> unit -> describe_log_streams_response

val make_describe_log_streams_request :
  ?log_group_name:log_group_name ->
  ?log_group_identifier:log_group_identifier ->
  ?log_stream_name_prefix:log_stream_name ->
  ?order_by:order_by ->
  ?descending:descending ->
  ?next_token:next_token ->
  ?limit:describe_limit ->
  unit ->
  describe_log_streams_request

val make_lookup_table :
  ?lookup_table_arn:arn ->
  ?lookup_table_name:lookup_table_name ->
  ?description:lookup_table_description ->
  ?table_fields:table_fields ->
  ?records_count:records_count ->
  ?size_bytes:stored_bytes ->
  ?last_updated_time:timestamp ->
  ?kms_key_id:kms_key_id ->
  unit ->
  lookup_table

val make_describe_lookup_tables_response :
  ?lookup_tables:lookup_tables -> ?next_token:next_token -> unit -> describe_lookup_tables_response

val make_describe_lookup_tables_request :
  ?lookup_table_name_prefix:lookup_table_name ->
  ?max_results:describe_lookup_tables_max_results ->
  ?next_token:next_token ->
  unit ->
  describe_lookup_tables_request

val make_metric_transformation :
  ?default_value:default_value ->
  ?dimensions:dimensions ->
  ?unit_:standard_unit ->
  metric_name:metric_name ->
  metric_namespace:metric_namespace ->
  metric_value:metric_value ->
  unit ->
  metric_transformation

val make_metric_filter :
  ?filter_name:filter_name ->
  ?filter_pattern:filter_pattern ->
  ?metric_transformations:metric_transformations ->
  ?creation_time:timestamp ->
  ?log_group_name:log_group_name ->
  ?apply_on_transformed_logs:apply_on_transformed_logs ->
  ?field_selection_criteria:field_selection_criteria ->
  ?emit_system_field_dimensions:emit_system_fields ->
  unit ->
  metric_filter

val make_describe_metric_filters_response :
  ?metric_filters:metric_filters ->
  ?next_token:next_token ->
  unit ->
  describe_metric_filters_response

val make_describe_metric_filters_request :
  ?log_group_name:log_group_name ->
  ?filter_name_prefix:filter_name ->
  ?next_token:next_token ->
  ?limit:describe_limit ->
  ?metric_name:metric_name ->
  ?metric_namespace:metric_namespace ->
  unit ->
  describe_metric_filters_request

val make_query_info :
  ?query_language:query_language ->
  ?query_id:query_id ->
  ?query_string:query_string ->
  ?status:query_status ->
  ?create_time:timestamp ->
  ?log_group_name:log_group_name ->
  ?query_duration:query_duration ->
  ?bytes_scanned:bytes_scanned_value ->
  ?user_identity:user_identity ->
  unit ->
  query_info

val make_describe_queries_response :
  ?queries:query_info_list -> ?next_token:next_token -> unit -> describe_queries_response

val make_describe_queries_request :
  ?log_group_name:log_group_name ->
  ?status:query_status ->
  ?max_results:describe_queries_max_results ->
  ?next_token:next_token ->
  ?query_language:query_language ->
  unit ->
  describe_queries_request

val make_query_parameter :
  ?default_value:query_parameter_default_value ->
  ?description:query_parameter_description ->
  name:query_parameter_name ->
  unit ->
  query_parameter

val make_query_definition :
  ?query_language:query_language ->
  ?query_definition_id:query_id ->
  ?name:query_definition_name ->
  ?query_string:query_definition_string ->
  ?last_modified:timestamp ->
  ?log_group_names:log_group_names ->
  ?parameters:query_parameter_list ->
  unit ->
  query_definition

val make_describe_query_definitions_response :
  ?query_definitions:query_definition_list ->
  ?next_token:next_token ->
  unit ->
  describe_query_definitions_response

val make_describe_query_definitions_request :
  ?query_language:query_language ->
  ?query_definition_name_prefix:query_definition_name ->
  ?max_results:query_list_max_results ->
  ?next_token:next_token ->
  unit ->
  describe_query_definitions_request

val make_resource_policy :
  ?policy_name:policy_name ->
  ?policy_document:policy_document ->
  ?last_updated_time:timestamp ->
  ?policy_scope:policy_scope ->
  ?resource_arn:arn ->
  ?revision_id:expected_revision_id ->
  unit ->
  resource_policy

val make_describe_resource_policies_response :
  ?resource_policies:resource_policies ->
  ?next_token:next_token ->
  unit ->
  describe_resource_policies_response

val make_describe_resource_policies_request :
  ?next_token:next_token ->
  ?limit:describe_limit ->
  ?resource_arn:arn ->
  ?policy_scope:policy_scope ->
  unit ->
  describe_resource_policies_request

val make_subscription_filter :
  ?filter_name:filter_name ->
  ?log_group_name:log_group_name ->
  ?filter_pattern:filter_pattern ->
  ?destination_arn:destination_arn ->
  ?role_arn:role_arn ->
  ?distribution:distribution ->
  ?apply_on_transformed_logs:apply_on_transformed_logs ->
  ?creation_time:timestamp ->
  ?field_selection_criteria:field_selection_criteria ->
  ?emit_system_fields:emit_system_fields ->
  unit ->
  subscription_filter

val make_describe_subscription_filters_response :
  ?subscription_filters:subscription_filters ->
  ?next_token:next_token ->
  unit ->
  describe_subscription_filters_response

val make_describe_subscription_filters_request :
  ?filter_name_prefix:filter_name ->
  ?next_token:next_token ->
  ?limit:describe_limit ->
  log_group_name:log_group_name ->
  unit ->
  describe_subscription_filters_request

val make_disassociate_kms_key_request :
  ?log_group_name:log_group_name ->
  ?resource_identifier:resource_identifier ->
  unit ->
  disassociate_kms_key_request

val make_disassociate_source_from_s3_table_integration_response :
  ?identifier:s3_table_integration_source_identifier ->
  unit ->
  disassociate_source_from_s3_table_integration_response

val make_disassociate_source_from_s3_table_integration_request :
  identifier:s3_table_integration_source_identifier ->
  unit ->
  disassociate_source_from_s3_table_integration_request

val make_entity :
  ?key_attributes:entity_key_attributes -> ?attributes:entity_attributes -> unit -> entity

val make_fields_data : ?data:data -> unit -> fields_data

val make_searched_log_stream :
  ?log_stream_name:log_stream_name ->
  ?searched_completely:log_stream_searched_completely ->
  unit ->
  searched_log_stream

val make_filtered_log_event :
  ?log_stream_name:log_stream_name ->
  ?timestamp:timestamp ->
  ?message:event_message ->
  ?ingestion_time:timestamp ->
  ?event_id:event_id ->
  unit ->
  filtered_log_event

val make_filter_log_events_response :
  ?events:filtered_log_events ->
  ?searched_log_streams:searched_log_streams ->
  ?next_token:next_token ->
  unit ->
  filter_log_events_response

val make_filter_log_events_request :
  ?log_group_name:log_group_name ->
  ?log_group_identifier:log_group_identifier ->
  ?log_stream_names:input_log_stream_names ->
  ?log_stream_name_prefix:log_stream_name ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?filter_pattern:filter_pattern ->
  ?next_token:next_token ->
  ?limit:events_limit ->
  ?start_from_head:start_from_head ->
  ?interleaved:interleaved ->
  ?unmask:unmask ->
  unit ->
  filter_log_events_request

val make_get_data_protection_policy_response :
  ?log_group_identifier:log_group_identifier ->
  ?policy_document:data_protection_policy_document ->
  ?last_updated_time:timestamp ->
  unit ->
  get_data_protection_policy_response

val make_get_data_protection_policy_request :
  log_group_identifier:log_group_identifier -> unit -> get_data_protection_policy_request

val make_get_delivery_response : ?delivery:delivery -> unit -> get_delivery_response
val make_get_delivery_request : id:delivery_id -> unit -> get_delivery_request

val make_get_delivery_destination_response :
  ?delivery_destination:delivery_destination -> unit -> get_delivery_destination_response

val make_get_delivery_destination_request :
  name:delivery_destination_name -> unit -> get_delivery_destination_request

val make_policy : ?delivery_destination_policy:delivery_destination_policy -> unit -> policy

val make_get_delivery_destination_policy_response :
  ?policy:policy -> unit -> get_delivery_destination_policy_response

val make_get_delivery_destination_policy_request :
  delivery_destination_name:delivery_destination_name ->
  unit ->
  get_delivery_destination_policy_request

val make_get_delivery_source_response :
  ?delivery_source:delivery_source -> unit -> get_delivery_source_response

val make_get_delivery_source_request :
  name:delivery_source_name -> unit -> get_delivery_source_request

val make_open_search_resource_status :
  ?status:open_search_resource_status_type ->
  ?status_message:integration_status_message ->
  unit ->
  open_search_resource_status

val make_open_search_lifecycle_policy :
  ?policy_name:open_search_policy_name ->
  ?status:open_search_resource_status ->
  unit ->
  open_search_lifecycle_policy

val make_open_search_data_access_policy :
  ?policy_name:open_search_policy_name ->
  ?status:open_search_resource_status ->
  unit ->
  open_search_data_access_policy

val make_open_search_network_policy :
  ?policy_name:open_search_policy_name ->
  ?status:open_search_resource_status ->
  unit ->
  open_search_network_policy

val make_open_search_encryption_policy :
  ?policy_name:open_search_policy_name ->
  ?status:open_search_resource_status ->
  unit ->
  open_search_encryption_policy

val make_open_search_workspace :
  ?workspace_id:open_search_workspace_id ->
  ?status:open_search_resource_status ->
  unit ->
  open_search_workspace

val make_open_search_collection :
  ?collection_endpoint:open_search_collection_endpoint ->
  ?collection_arn:arn ->
  ?status:open_search_resource_status ->
  unit ->
  open_search_collection

val make_open_search_application :
  ?application_endpoint:open_search_application_endpoint ->
  ?application_arn:arn ->
  ?application_id:open_search_application_id ->
  ?status:open_search_resource_status ->
  unit ->
  open_search_application

val make_open_search_data_source :
  ?data_source_name:open_search_data_source_name ->
  ?status:open_search_resource_status ->
  unit ->
  open_search_data_source

val make_open_search_integration_details :
  ?data_source:open_search_data_source ->
  ?application:open_search_application ->
  ?collection:open_search_collection ->
  ?workspace:open_search_workspace ->
  ?encryption_policy:open_search_encryption_policy ->
  ?network_policy:open_search_network_policy ->
  ?access_policy:open_search_data_access_policy ->
  ?lifecycle_policy:open_search_lifecycle_policy ->
  unit ->
  open_search_integration_details

val make_get_integration_response :
  ?integration_name:integration_name ->
  ?integration_type:integration_type ->
  ?integration_status:integration_status ->
  ?integration_details:integration_details ->
  unit ->
  get_integration_response

val make_get_integration_request :
  integration_name:integration_name -> unit -> get_integration_request

val make_get_log_anomaly_detector_response :
  ?detector_name:detector_name ->
  ?log_group_arn_list:log_group_arn_list ->
  ?evaluation_frequency:evaluation_frequency ->
  ?filter_pattern:filter_pattern ->
  ?anomaly_detector_status:anomaly_detector_status ->
  ?kms_key_id:kms_key_id ->
  ?creation_time_stamp:epoch_millis ->
  ?last_modified_time_stamp:epoch_millis ->
  ?anomaly_visibility_time:anomaly_visibility_time ->
  unit ->
  get_log_anomaly_detector_response

val make_get_log_anomaly_detector_request :
  anomaly_detector_arn:anomaly_detector_arn -> unit -> get_log_anomaly_detector_request

val make_output_log_event :
  ?timestamp:timestamp ->
  ?message:event_message ->
  ?ingestion_time:timestamp ->
  unit ->
  output_log_event

val make_get_log_events_response :
  ?events:output_log_events ->
  ?next_forward_token:next_token ->
  ?next_backward_token:next_token ->
  unit ->
  get_log_events_response

val make_get_log_events_request :
  ?log_group_name:log_group_name ->
  ?log_group_identifier:log_group_identifier ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?next_token:next_token ->
  ?limit:events_limit ->
  ?start_from_head:start_from_head ->
  ?unmask:unmask ->
  log_stream_name:log_stream_name ->
  unit ->
  get_log_events_request

val make_log_fields_list_item :
  ?log_field_name:log_field_name -> ?log_field_type:log_field_type -> unit -> log_fields_list_item

val make_log_field_type :
  ?type_:data_type -> ?element:log_field_type -> ?fields:log_fields_list -> unit -> log_field_type

val make_get_log_fields_response : ?log_fields:log_fields_list -> unit -> get_log_fields_response

val make_get_log_fields_request :
  data_source_name:data_source_name ->
  data_source_type:data_source_type ->
  unit ->
  get_log_fields_request

val make_log_group_field : ?name:field -> ?percent:percentage -> unit -> log_group_field

val make_get_log_group_fields_response :
  ?log_group_fields:log_group_field_list -> unit -> get_log_group_fields_response

val make_get_log_group_fields_request :
  ?log_group_name:log_group_name ->
  ?time:timestamp ->
  ?log_group_identifier:log_group_identifier ->
  unit ->
  get_log_group_fields_request

val make_get_log_object_response :
  ?field_stream:get_log_object_response_stream -> unit -> get_log_object_response

val make_get_log_object_request :
  ?unmask:unmask -> log_object_pointer:log_object_pointer -> unit -> get_log_object_request

val make_get_log_record_response : ?log_record:log_record -> unit -> get_log_record_response

val make_get_log_record_request :
  ?unmask:unmask -> log_record_pointer:log_record_pointer -> unit -> get_log_record_request

val make_get_lookup_table_response :
  ?lookup_table_arn:arn ->
  ?lookup_table_name:lookup_table_name ->
  ?description:lookup_table_description ->
  ?table_body:table_body ->
  ?size_bytes:stored_bytes ->
  ?last_updated_time:timestamp ->
  ?kms_key_id:kms_key_id ->
  unit ->
  get_lookup_table_response

val make_get_lookup_table_request : lookup_table_arn:arn -> unit -> get_lookup_table_request

val make_query_statistics :
  ?records_matched:stats_value ->
  ?records_scanned:stats_value ->
  ?estimated_records_skipped:stats_value ->
  ?bytes_scanned:stats_value ->
  ?estimated_bytes_skipped:stats_value ->
  ?log_groups_scanned:stats_value ->
  unit ->
  query_statistics

val make_result_field : ?field:field -> ?value:value -> unit -> result_field

val make_get_query_results_response :
  ?query_language:query_language ->
  ?results:query_results ->
  ?statistics:query_statistics ->
  ?status:query_status ->
  ?encryption_key:encryption_key ->
  ?next_token:get_query_results_next_token ->
  unit ->
  get_query_results_response

val make_get_query_results_request :
  ?next_token:get_query_results_next_token ->
  ?max_items:get_query_results_max_items ->
  query_id:query_id ->
  unit ->
  get_query_results_request

val make_get_scheduled_query_response :
  ?scheduled_query_arn:arn ->
  ?name:scheduled_query_name ->
  ?description:scheduled_query_description ->
  ?query_language:query_language ->
  ?query_string:query_string ->
  ?log_group_identifiers:scheduled_query_log_group_identifiers ->
  ?schedule_expression:schedule_expression ->
  ?timezone:schedule_timezone ->
  ?start_time_offset:start_time_offset ->
  ?end_time_offset:end_time_offset ->
  ?destination_configuration:destination_configuration ->
  ?state:scheduled_query_state ->
  ?schedule_type:schedule_type ->
  ?last_triggered_time:timestamp ->
  ?last_execution_status:execution_status ->
  ?schedule_start_time:timestamp ->
  ?schedule_end_time:timestamp ->
  ?execution_role_arn:role_arn ->
  ?creation_time:timestamp ->
  ?last_updated_time:timestamp ->
  unit ->
  get_scheduled_query_response

val make_get_scheduled_query_request :
  identifier:scheduled_query_identifier -> unit -> get_scheduled_query_request

val make_scheduled_query_destination :
  ?destination_type:scheduled_query_destination_type ->
  ?destination_identifier:string_ ->
  ?status:action_status ->
  ?processed_identifier:string_ ->
  ?error_message:string_ ->
  unit ->
  scheduled_query_destination

val make_trigger_history_record :
  ?query_id:query_id ->
  ?execution_status:execution_status ->
  ?triggered_timestamp:timestamp ->
  ?error_message:string_ ->
  ?destinations:scheduled_query_destination_list ->
  unit ->
  trigger_history_record

val make_get_scheduled_query_history_response :
  ?name:scheduled_query_name ->
  ?scheduled_query_arn:arn ->
  ?trigger_history:trigger_history_record_list ->
  ?next_token:next_token ->
  unit ->
  get_scheduled_query_history_response

val make_get_scheduled_query_history_request :
  ?execution_statuses:execution_status_list ->
  ?max_results:get_scheduled_query_history_max_results ->
  ?next_token:next_token ->
  identifier:scheduled_query_identifier ->
  start_time:timestamp ->
  end_time:timestamp ->
  unit ->
  get_scheduled_query_history_request

val make_upper_case_string : with_keys:upper_case_string_with_keys -> unit -> upper_case_string
val make_type_converter_entry : key:key -> type_:type_ -> unit -> type_converter_entry
val make_type_converter : entries:type_converter_entries -> unit -> type_converter
val make_trim_string : with_keys:trim_string_with_keys -> unit -> trim_string

val make_substitute_string_entry :
  source:source -> from_:from_key -> to_:to_key -> unit -> substitute_string_entry

val make_substitute_string : entries:substitute_string_entries -> unit -> substitute_string

val make_split_string_entry :
  source:source -> delimiter:split_string_delimiter -> unit -> split_string_entry

val make_split_string : entries:split_string_entries -> unit -> split_string

val make_rename_key_entry :
  ?overwrite_if_exists:overwrite_if_exists ->
  key:key ->
  rename_to:rename_to ->
  unit ->
  rename_key_entry

val make_rename_keys : entries:rename_key_entries -> unit -> rename_keys
val make_parse_wa_f : ?source:source -> unit -> parse_wa_f
val make_parse_vp_c : ?source:source -> unit -> parse_vp_c
val make_parse_postgres : ?source:source -> unit -> parse_postgres

val make_parse_to_ocs_f :
  ?source:source ->
  ?mapping_version:mapping_version ->
  event_source:event_source ->
  ocsf_version:ocsf_version ->
  unit ->
  parse_to_ocs_f

val make_parse_route53 : ?source:source -> unit -> parse_route53

val make_parse_key_value :
  ?source:source ->
  ?destination:destination_field ->
  ?field_delimiter:parser_field_delimiter ->
  ?key_value_delimiter:key_value_delimiter ->
  ?key_prefix:key_prefix ->
  ?non_match_value:non_match_value ->
  ?overwrite_if_exists:overwrite_if_exists ->
  unit ->
  parse_key_value

val make_parse_jso_n : ?source:source -> ?destination:destination_field -> unit -> parse_jso_n
val make_parse_cloudfront : ?source:source -> unit -> parse_cloudfront

val make_move_key_entry :
  ?overwrite_if_exists:overwrite_if_exists ->
  source:source ->
  target:target ->
  unit ->
  move_key_entry

val make_move_keys : entries:move_key_entries -> unit -> move_keys
val make_lower_case_string : with_keys:lower_case_string_with_keys -> unit -> lower_case_string

val make_list_to_map :
  ?value_key:value_key ->
  ?target:target ->
  ?flatten:flatten ->
  ?flattened_element:flattened_element ->
  source:source ->
  key:key ->
  unit ->
  list_to_map

val make_grok : ?source:source -> match_:grok_match -> unit -> grok

val make_processor :
  ?add_keys:add_keys ->
  ?copy_value:copy_value ->
  ?csv:cs_v ->
  ?date_time_converter:date_time_converter ->
  ?delete_keys:delete_keys ->
  ?grok:grok ->
  ?list_to_map:list_to_map ->
  ?lower_case_string:lower_case_string ->
  ?move_keys:move_keys ->
  ?parse_cloudfront:parse_cloudfront ->
  ?parse_jso_n:parse_jso_n ->
  ?parse_key_value:parse_key_value ->
  ?parse_route53:parse_route53 ->
  ?parse_to_ocs_f:parse_to_ocs_f ->
  ?parse_postgres:parse_postgres ->
  ?parse_vp_c:parse_vp_c ->
  ?parse_wa_f:parse_wa_f ->
  ?rename_keys:rename_keys ->
  ?split_string:split_string ->
  ?substitute_string:substitute_string ->
  ?trim_string:trim_string ->
  ?type_converter:type_converter ->
  ?upper_case_string:upper_case_string ->
  unit ->
  processor

val make_get_transformer_response :
  ?log_group_identifier:log_group_identifier ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?transformer_config:processors ->
  unit ->
  get_transformer_response

val make_get_transformer_request :
  log_group_identifier:log_group_identifier -> unit -> get_transformer_request

val make_input_log_event : timestamp:timestamp -> message:event_message -> unit -> input_log_event

val make_integration_summary :
  ?integration_name:integration_name ->
  ?integration_type:integration_type ->
  ?integration_status:integration_status ->
  unit ->
  integration_summary

val make_list_aggregate_log_group_summaries_response :
  ?aggregate_log_group_summaries:aggregate_log_group_summaries ->
  ?next_token:next_token ->
  unit ->
  list_aggregate_log_group_summaries_response

val make_list_aggregate_log_group_summaries_request :
  ?account_identifiers:account_ids ->
  ?include_linked_accounts:include_linked_accounts ->
  ?log_group_class:log_group_class ->
  ?log_group_name_pattern:log_group_name_regex_pattern ->
  ?data_sources:data_source_filters ->
  ?next_token:next_token ->
  ?limit:list_log_groups_request_limit ->
  group_by:list_aggregate_log_group_summaries_group_by ->
  unit ->
  list_aggregate_log_group_summaries_request

val make_list_anomalies_response :
  ?anomalies:anomalies -> ?next_token:next_token -> unit -> list_anomalies_response

val make_list_anomalies_request :
  ?anomaly_detector_arn:anomaly_detector_arn ->
  ?suppression_state:suppression_state ->
  ?limit:list_anomalies_limit ->
  ?next_token:next_token ->
  unit ->
  list_anomalies_request

val make_list_integrations_response :
  ?integration_summaries:integration_summaries -> unit -> list_integrations_response

val make_list_integrations_request :
  ?integration_name_prefix:integration_name_prefix ->
  ?integration_type:integration_type ->
  ?integration_status:integration_status ->
  unit ->
  list_integrations_request

val make_list_log_anomaly_detectors_response :
  ?anomaly_detectors:anomaly_detectors ->
  ?next_token:next_token ->
  unit ->
  list_log_anomaly_detectors_response

val make_list_log_anomaly_detectors_request :
  ?filter_log_group_arn:log_group_arn ->
  ?limit:list_log_anomaly_detectors_limit ->
  ?next_token:next_token ->
  unit ->
  list_log_anomaly_detectors_request

val make_log_group_summary :
  ?log_group_name:log_group_name ->
  ?log_group_arn:arn ->
  ?log_group_class:log_group_class ->
  unit ->
  log_group_summary

val make_list_log_groups_response :
  ?log_groups:log_group_summaries -> ?next_token:next_token -> unit -> list_log_groups_response

val make_tag_filter : ?values:tag_filter_values -> key:tag_filter_key -> unit -> tag_filter

val make_list_log_groups_request :
  ?log_group_name_pattern:log_group_name_regex_pattern ->
  ?log_group_class:log_group_class ->
  ?include_linked_accounts:include_linked_accounts ->
  ?account_identifiers:account_ids ->
  ?next_token:next_token ->
  ?limit:list_limit ->
  ?data_sources:data_source_filters ->
  ?field_index_names:field_index_names ->
  ?log_group_tags:tag_filters ->
  unit ->
  list_log_groups_request

val make_list_log_groups_for_query_response :
  ?log_group_identifiers:log_group_identifiers ->
  ?next_token:next_token ->
  unit ->
  list_log_groups_for_query_response

val make_list_log_groups_for_query_request :
  ?next_token:next_token ->
  ?max_results:list_log_groups_for_query_max_results ->
  query_id:query_id ->
  unit ->
  list_log_groups_for_query_request

val make_scheduled_query_summary :
  ?scheduled_query_arn:arn ->
  ?name:scheduled_query_name ->
  ?state:scheduled_query_state ->
  ?schedule_type:schedule_type ->
  ?last_triggered_time:timestamp ->
  ?last_execution_status:execution_status ->
  ?schedule_expression:schedule_expression ->
  ?timezone:schedule_timezone ->
  ?destination_configuration:destination_configuration ->
  ?creation_time:timestamp ->
  ?last_updated_time:timestamp ->
  unit ->
  scheduled_query_summary

val make_list_scheduled_queries_response :
  ?next_token:next_token ->
  ?scheduled_queries:scheduled_query_summary_list ->
  unit ->
  list_scheduled_queries_response

val make_list_scheduled_queries_request :
  ?max_results:list_scheduled_queries_max_results ->
  ?next_token:next_token ->
  ?state:scheduled_query_state ->
  ?schedule_type:schedule_type ->
  unit ->
  list_scheduled_queries_request

val make_s3_table_integration_source :
  ?identifier:s3_table_integration_source_identifier ->
  ?data_source:data_source ->
  ?status:s3_table_integration_source_status ->
  ?status_reason:s3_table_integration_source_status_reason ->
  ?created_time_stamp:timestamp ->
  ?parent_source_identifier:s3_table_integration_source_identifier ->
  unit ->
  s3_table_integration_source

val make_list_sources_for_s3_table_integration_response :
  ?sources:s3_table_integration_sources ->
  ?next_token:next_token ->
  unit ->
  list_sources_for_s3_table_integration_response

val make_list_sources_for_s3_table_integration_request :
  ?max_results:list_sources_for_s3_table_integration_max_results ->
  ?next_token:next_token ->
  integration_arn:arn ->
  unit ->
  list_sources_for_s3_table_integration_request

val make_syslog_configuration :
  ?log_group_arn:log_group_arn ->
  ?source_type:syslog_source_type ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?created_at:timestamp ->
  unit ->
  syslog_configuration

val make_list_syslog_configurations_response :
  ?syslog_configurations:syslog_configurations ->
  ?next_token:next_token ->
  unit ->
  list_syslog_configurations_response

val make_list_syslog_configurations_request :
  ?log_group_identifier:log_group_identifier ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?next_token:next_token ->
  ?max_results:list_syslog_configurations_max_results ->
  unit ->
  list_syslog_configurations_request

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_list_tags_log_group_response : ?tags:tags -> unit -> list_tags_log_group_response

val make_list_tags_log_group_request :
  log_group_name:log_group_name -> unit -> list_tags_log_group_request

val make_live_tail_session_log_event :
  ?log_stream_name:log_stream_name ->
  ?log_group_identifier:log_group_identifier ->
  ?message:event_message ->
  ?timestamp:timestamp ->
  ?ingestion_time:timestamp ->
  unit ->
  live_tail_session_log_event

val make_live_tail_session_metadata : ?sampled:is_sampled -> unit -> live_tail_session_metadata

val make_live_tail_session_start :
  ?request_id:request_id ->
  ?session_id:session_id ->
  ?log_group_identifiers:start_live_tail_log_group_identifiers ->
  ?log_stream_names:input_log_stream_names ->
  ?log_stream_name_prefixes:input_log_stream_names ->
  ?log_event_filter_pattern:filter_pattern ->
  unit ->
  live_tail_session_start

val make_live_tail_session_update :
  ?session_metadata:live_tail_session_metadata ->
  ?session_results:live_tail_session_results ->
  unit ->
  live_tail_session_update

val make_update_scheduled_query_response :
  ?scheduled_query_arn:arn ->
  ?name:scheduled_query_name ->
  ?description:scheduled_query_description ->
  ?query_language:query_language ->
  ?query_string:query_string ->
  ?log_group_identifiers:scheduled_query_log_group_identifiers ->
  ?schedule_expression:schedule_expression ->
  ?timezone:schedule_timezone ->
  ?start_time_offset:start_time_offset ->
  ?end_time_offset:end_time_offset ->
  ?destination_configuration:destination_configuration ->
  ?state:scheduled_query_state ->
  ?schedule_type:schedule_type ->
  ?last_triggered_time:timestamp ->
  ?last_execution_status:execution_status ->
  ?schedule_start_time:timestamp ->
  ?schedule_end_time:timestamp ->
  ?execution_role_arn:role_arn ->
  ?creation_time:timestamp ->
  ?last_updated_time:timestamp ->
  unit ->
  update_scheduled_query_response

val make_update_scheduled_query_request :
  ?description:scheduled_query_description ->
  ?log_group_identifiers:scheduled_query_log_group_identifiers ->
  ?timezone:schedule_timezone ->
  ?start_time_offset:start_time_offset ->
  ?end_time_offset:end_time_offset ->
  ?destination_configuration:destination_configuration ->
  ?schedule_start_time:timestamp ->
  ?schedule_end_time:timestamp ->
  ?state:scheduled_query_state ->
  identifier:scheduled_query_identifier ->
  query_language:query_language ->
  query_string:query_string ->
  schedule_expression:schedule_expression ->
  execution_role_arn:role_arn ->
  unit ->
  update_scheduled_query_request

val make_update_lookup_table_response :
  ?lookup_table_arn:arn -> ?last_updated_time:timestamp -> unit -> update_lookup_table_response

val make_update_lookup_table_request :
  ?description:lookup_table_description ->
  ?kms_key_id:kms_key_id ->
  lookup_table_arn:arn ->
  table_body:table_body ->
  unit ->
  update_lookup_table_request

val make_update_log_anomaly_detector_request :
  ?evaluation_frequency:evaluation_frequency ->
  ?filter_pattern:filter_pattern ->
  ?anomaly_visibility_time:anomaly_visibility_time ->
  anomaly_detector_arn:anomaly_detector_arn ->
  enabled:boolean_ ->
  unit ->
  update_log_anomaly_detector_request

val make_update_delivery_configuration_response : unit -> unit

val make_update_delivery_configuration_request :
  ?record_fields:record_fields ->
  ?field_delimiter:field_delimiter ->
  ?s3_delivery_configuration:s3_delivery_configuration ->
  id:delivery_id ->
  unit ->
  update_delivery_configuration_request

val make_suppression_period :
  ?value:integer -> ?suppression_unit:suppression_unit -> unit -> suppression_period

val make_update_anomaly_request :
  ?anomaly_id:anomaly_id ->
  ?pattern_id:pattern_id ->
  ?suppression_type:suppression_type ->
  ?suppression_period:suppression_period ->
  ?baseline:baseline ->
  anomaly_detector_arn:anomaly_detector_arn ->
  unit ->
  update_anomaly_request

val make_untag_resource_request :
  resource_arn:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_untag_log_group_request :
  log_group_name:log_group_name -> tags:tag_list -> unit -> untag_log_group_request

val make_transformed_log_record :
  ?event_number:event_number ->
  ?event_message:event_message ->
  ?transformed_event_message:transformed_event_message ->
  unit ->
  transformed_log_record

val make_test_transformer_response :
  ?transformed_logs:transformed_logs -> unit -> test_transformer_response

val make_test_transformer_request :
  transformer_config:processors ->
  log_event_messages:test_event_messages ->
  unit ->
  test_transformer_request

val make_metric_filter_match_record :
  ?event_number:event_number ->
  ?event_message:event_message ->
  ?extracted_values:extracted_values ->
  unit ->
  metric_filter_match_record

val make_test_metric_filter_response :
  ?matches:metric_filter_matches -> unit -> test_metric_filter_response

val make_test_metric_filter_request :
  filter_pattern:filter_pattern ->
  log_event_messages:test_event_messages ->
  unit ->
  test_metric_filter_request

val make_tag_resource_request :
  resource_arn:amazon_resource_name -> tags:tags -> unit -> tag_resource_request

val make_tag_log_group_request :
  log_group_name:log_group_name -> tags:tags -> unit -> tag_log_group_request

val make_stop_query_response : ?success:success -> unit -> stop_query_response
val make_stop_query_request : query_id:query_id -> unit -> stop_query_request

val make_query_compile_error_location :
  ?start_char_offset:query_char_offset ->
  ?end_char_offset:query_char_offset ->
  unit ->
  query_compile_error_location

val make_query_compile_error :
  ?location:query_compile_error_location -> ?message:message -> unit -> query_compile_error

val make_start_query_response : ?query_id:query_id -> unit -> start_query_response

val make_start_query_request :
  ?query_language:query_language ->
  ?log_group_name:log_group_name ->
  ?log_group_names:log_group_names ->
  ?log_group_identifiers:log_group_identifiers ->
  ?limit:events_limit_start_query ->
  start_time:timestamp ->
  end_time:timestamp ->
  query_string:query_string ->
  unit ->
  start_query_request

val make_start_live_tail_response :
  ?response_stream:start_live_tail_response_stream -> unit -> start_live_tail_response

val make_start_live_tail_request :
  ?log_stream_names:input_log_stream_names ->
  ?log_stream_name_prefixes:input_log_stream_names ->
  ?log_event_filter_pattern:filter_pattern ->
  log_group_identifiers:start_live_tail_log_group_identifiers ->
  unit ->
  start_live_tail_request

val make_put_transformer_request :
  log_group_identifier:log_group_identifier ->
  transformer_config:processors ->
  unit ->
  put_transformer_request

val make_put_syslog_configuration_request :
  ?vpc_endpoint_id:vpc_endpoint_id ->
  log_group_identifier:log_group_identifier ->
  unit ->
  put_syslog_configuration_request

val make_put_subscription_filter_request :
  ?role_arn:role_arn ->
  ?distribution:distribution ->
  ?apply_on_transformed_logs:apply_on_transformed_logs ->
  ?field_selection_criteria:field_selection_criteria ->
  ?emit_system_fields:emit_system_fields ->
  log_group_name:log_group_name ->
  filter_name:filter_name ->
  filter_pattern:filter_pattern ->
  destination_arn:destination_arn ->
  unit ->
  put_subscription_filter_request

val make_put_retention_policy_request :
  log_group_name:log_group_name -> retention_in_days:days -> unit -> put_retention_policy_request

val make_put_resource_policy_response :
  ?resource_policy:resource_policy ->
  ?revision_id:expected_revision_id ->
  unit ->
  put_resource_policy_response

val make_put_resource_policy_request :
  ?policy_name:policy_name ->
  ?policy_document:policy_document ->
  ?resource_arn:arn ->
  ?expected_revision_id:expected_revision_id ->
  unit ->
  put_resource_policy_request

val make_put_query_definition_response :
  ?query_definition_id:query_id -> unit -> put_query_definition_response

val make_put_query_definition_request :
  ?query_language:query_language ->
  ?query_definition_id:query_id ->
  ?log_group_names:log_group_names ->
  ?client_token:client_token ->
  ?parameters:query_parameter_list ->
  name:query_definition_name ->
  query_string:query_definition_string ->
  unit ->
  put_query_definition_request

val make_put_metric_filter_request :
  ?apply_on_transformed_logs:apply_on_transformed_logs ->
  ?field_selection_criteria:field_selection_criteria ->
  ?emit_system_field_dimensions:emit_system_fields ->
  log_group_name:log_group_name ->
  filter_name:filter_name ->
  filter_pattern:filter_pattern ->
  metric_transformations:metric_transformations ->
  unit ->
  put_metric_filter_request

val make_put_log_group_deletion_protection_request :
  log_group_identifier:log_group_identifier ->
  deletion_protection_enabled:deletion_protection_enabled ->
  unit ->
  put_log_group_deletion_protection_request

val make_rejected_entity_info :
  error_type:entity_rejection_error_type -> unit -> rejected_entity_info

val make_rejected_log_events_info :
  ?too_new_log_event_start_index:log_event_index ->
  ?too_old_log_event_end_index:log_event_index ->
  ?expired_log_event_end_index:log_event_index ->
  unit ->
  rejected_log_events_info

val make_put_log_events_response :
  ?next_sequence_token:sequence_token ->
  ?rejected_log_events_info:rejected_log_events_info ->
  ?rejected_entity_info:rejected_entity_info ->
  unit ->
  put_log_events_response

val make_put_log_events_request :
  ?sequence_token:sequence_token ->
  ?entity:entity ->
  log_group_name:log_group_name ->
  log_stream_name:log_stream_name ->
  log_events:input_log_events ->
  unit ->
  put_log_events_request

val make_put_integration_response :
  ?integration_name:integration_name ->
  ?integration_status:integration_status ->
  unit ->
  put_integration_response

val make_open_search_resource_config :
  ?kms_key_arn:arn ->
  ?application_arn:arn ->
  data_source_role_arn:arn ->
  dashboard_viewer_principals:dashboard_viewer_principals ->
  retention_days:collection_retention_days ->
  unit ->
  open_search_resource_config

val make_put_integration_request :
  integration_name:integration_name ->
  resource_config:resource_config ->
  integration_type:integration_type ->
  unit ->
  put_integration_request

val make_put_index_policy_response : ?index_policy:index_policy -> unit -> put_index_policy_response

val make_put_index_policy_request :
  log_group_identifier:log_group_identifier ->
  policy_document:policy_document ->
  unit ->
  put_index_policy_request

val make_put_destination_policy_request :
  ?force_update:force_update ->
  destination_name:destination_name ->
  access_policy:access_policy ->
  unit ->
  put_destination_policy_request

val make_put_destination_response : ?destination:destination -> unit -> put_destination_response

val make_put_destination_request :
  ?tags:tags ->
  destination_name:destination_name ->
  target_arn:target_arn ->
  role_arn:role_arn ->
  unit ->
  put_destination_request

val make_put_delivery_source_response :
  ?delivery_source:delivery_source -> unit -> put_delivery_source_response

val make_put_delivery_source_request :
  ?tags:tags ->
  ?delivery_source_configuration:delivery_source_configuration ->
  name:delivery_source_name ->
  resource_arn:arn ->
  log_type:log_type ->
  unit ->
  put_delivery_source_request

val make_put_delivery_destination_policy_response :
  ?policy:policy -> unit -> put_delivery_destination_policy_response

val make_put_delivery_destination_policy_request :
  delivery_destination_name:delivery_destination_name ->
  delivery_destination_policy:delivery_destination_policy ->
  unit ->
  put_delivery_destination_policy_request

val make_put_delivery_destination_response :
  ?delivery_destination:delivery_destination -> unit -> put_delivery_destination_response

val make_put_delivery_destination_request :
  ?output_format:output_format ->
  ?delivery_destination_configuration:delivery_destination_configuration ->
  ?delivery_destination_type:delivery_destination_type ->
  ?tags:tags ->
  name:delivery_destination_name ->
  unit ->
  put_delivery_destination_request

val make_put_data_protection_policy_response :
  ?log_group_identifier:log_group_identifier ->
  ?policy_document:data_protection_policy_document ->
  ?last_updated_time:timestamp ->
  unit ->
  put_data_protection_policy_response

val make_put_data_protection_policy_request :
  log_group_identifier:log_group_identifier ->
  policy_document:data_protection_policy_document ->
  unit ->
  put_data_protection_policy_request

val make_put_bearer_token_authentication_request :
  log_group_identifier:log_group_identifier ->
  bearer_token_authentication_enabled:bearer_token_authentication_enabled ->
  unit ->
  put_bearer_token_authentication_request

val make_put_account_policy_response :
  ?account_policy:account_policy -> unit -> put_account_policy_response

val make_put_account_policy_request :
  ?scope:scope ->
  ?selection_criteria:selection_criteria ->
  policy_name:policy_name ->
  policy_document:account_policy_document ->
  policy_type:policy_type ->
  unit ->
  put_account_policy_request
