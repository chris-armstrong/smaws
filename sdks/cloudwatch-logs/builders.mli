open Types

val make_upper_case_string : with_keys:upper_case_string_with_keys -> unit -> upper_case_string

val make_s3_configuration :
  ?kms_key_id:kms_key_id ->
  ?owner_account_id:account_id ->
  role_arn:role_arn ->
  destination_identifier:s3_uri ->
  unit ->
  s3_configuration

val make_destination_configuration :
  s3_configuration:s3_configuration -> unit -> destination_configuration

val make_update_scheduled_query_response :
  ?last_updated_time:timestamp ->
  ?creation_time:timestamp ->
  ?execution_role_arn:role_arn ->
  ?schedule_end_time:timestamp ->
  ?schedule_start_time:timestamp ->
  ?last_execution_status:execution_status ->
  ?last_triggered_time:timestamp ->
  ?schedule_type:schedule_type ->
  ?state:scheduled_query_state ->
  ?destination_configuration:destination_configuration ->
  ?end_time_offset:end_time_offset ->
  ?start_time_offset:start_time_offset ->
  ?timezone:schedule_timezone ->
  ?schedule_expression:schedule_expression ->
  ?log_group_identifiers:scheduled_query_log_group_identifiers ->
  ?query_string:query_string ->
  ?query_language:query_language ->
  ?description:scheduled_query_description ->
  ?name:scheduled_query_name ->
  ?scheduled_query_arn:arn ->
  unit ->
  update_scheduled_query_response

val make_update_scheduled_query_request :
  ?state:scheduled_query_state ->
  ?schedule_end_time:timestamp ->
  ?schedule_start_time:timestamp ->
  ?destination_configuration:destination_configuration ->
  ?end_time_offset:end_time_offset ->
  ?start_time_offset:start_time_offset ->
  ?timezone:schedule_timezone ->
  ?log_group_identifiers:scheduled_query_log_group_identifiers ->
  ?description:scheduled_query_description ->
  execution_role_arn:role_arn ->
  schedule_expression:schedule_expression ->
  query_string:query_string ->
  query_language:query_language ->
  identifier:scheduled_query_identifier ->
  unit ->
  update_scheduled_query_request

val make_update_lookup_table_response :
  ?last_updated_time:timestamp -> ?lookup_table_arn:arn -> unit -> update_lookup_table_response

val make_update_lookup_table_request :
  ?kms_key_id:kms_key_id ->
  ?description:lookup_table_description ->
  table_body:table_body ->
  lookup_table_arn:arn ->
  unit ->
  update_lookup_table_request

val make_update_log_anomaly_detector_request :
  ?anomaly_visibility_time:anomaly_visibility_time ->
  ?filter_pattern:filter_pattern ->
  ?evaluation_frequency:evaluation_frequency ->
  enabled:boolean_ ->
  anomaly_detector_arn:anomaly_detector_arn ->
  unit ->
  update_log_anomaly_detector_request

val make_update_delivery_configuration_response : unit -> unit

val make_s3_delivery_configuration :
  ?enable_hive_compatible_path:boolean_ ->
  ?suffix_path:delivery_suffix_path ->
  unit ->
  s3_delivery_configuration

val make_update_delivery_configuration_request :
  ?s3_delivery_configuration:s3_delivery_configuration ->
  ?field_delimiter:field_delimiter ->
  ?record_fields:record_fields ->
  id:delivery_id ->
  unit ->
  update_delivery_configuration_request

val make_suppression_period :
  ?suppression_unit:suppression_unit -> ?value:integer -> unit -> suppression_period

val make_update_anomaly_request :
  ?baseline:baseline ->
  ?suppression_period:suppression_period ->
  ?suppression_type:suppression_type ->
  ?pattern_id:pattern_id ->
  ?anomaly_id:anomaly_id ->
  anomaly_detector_arn:anomaly_detector_arn ->
  unit ->
  update_anomaly_request

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:amazon_resource_name -> unit -> untag_resource_request

val make_untag_log_group_request :
  tags:tag_list -> log_group_name:log_group_name -> unit -> untag_log_group_request

val make_type_converter_entry : type_:type_ -> key:key -> unit -> type_converter_entry
val make_type_converter : entries:type_converter_entries -> unit -> type_converter
val make_trim_string : with_keys:trim_string_with_keys -> unit -> trim_string

val make_scheduled_query_destination :
  ?error_message:string_ ->
  ?processed_identifier:string_ ->
  ?status:action_status ->
  ?destination_identifier:string_ ->
  ?destination_type:scheduled_query_destination_type ->
  unit ->
  scheduled_query_destination

val make_trigger_history_record :
  ?destinations:scheduled_query_destination_list ->
  ?error_message:string_ ->
  ?triggered_timestamp:timestamp ->
  ?execution_status:execution_status ->
  ?query_id:query_id ->
  unit ->
  trigger_history_record

val make_transformed_log_record :
  ?transformed_event_message:transformed_event_message ->
  ?event_message:event_message ->
  ?event_number:event_number ->
  unit ->
  transformed_log_record

val make_test_transformer_response :
  ?transformed_logs:transformed_logs -> unit -> test_transformer_response

val make_add_key_entry :
  ?overwrite_if_exists:overwrite_if_exists ->
  value:add_key_value ->
  key:key ->
  unit ->
  add_key_entry

val make_add_keys : entries:add_key_entries -> unit -> add_keys

val make_copy_value_entry :
  ?overwrite_if_exists:overwrite_if_exists ->
  target:target ->
  source:source ->
  unit ->
  copy_value_entry

val make_copy_value : entries:copy_value_entries -> unit -> copy_value

val make_cs_v :
  ?destination:destination_field ->
  ?source:source ->
  ?columns:columns ->
  ?delimiter:delimiter ->
  ?quote_character:quote_character ->
  unit ->
  cs_v

val make_date_time_converter :
  ?locale:locale ->
  ?target_timezone:target_timezone ->
  ?source_timezone:source_timezone ->
  ?target_format:target_format ->
  match_patterns:match_patterns ->
  target:target ->
  source:source ->
  unit ->
  date_time_converter

val make_delete_keys : with_keys:delete_with_keys -> unit -> delete_keys
val make_grok : ?source:source -> match_:grok_match -> unit -> grok

val make_list_to_map :
  ?flattened_element:flattened_element ->
  ?flatten:flatten ->
  ?target:target ->
  ?value_key:value_key ->
  key:key ->
  source:source ->
  unit ->
  list_to_map

val make_lower_case_string : with_keys:lower_case_string_with_keys -> unit -> lower_case_string

val make_move_key_entry :
  ?overwrite_if_exists:overwrite_if_exists ->
  target:target ->
  source:source ->
  unit ->
  move_key_entry

val make_move_keys : entries:move_key_entries -> unit -> move_keys
val make_parse_cloudfront : ?source:source -> unit -> parse_cloudfront
val make_parse_jso_n : ?destination:destination_field -> ?source:source -> unit -> parse_jso_n

val make_parse_key_value :
  ?overwrite_if_exists:overwrite_if_exists ->
  ?non_match_value:non_match_value ->
  ?key_prefix:key_prefix ->
  ?key_value_delimiter:key_value_delimiter ->
  ?field_delimiter:parser_field_delimiter ->
  ?destination:destination_field ->
  ?source:source ->
  unit ->
  parse_key_value

val make_parse_route53 : ?source:source -> unit -> parse_route53

val make_parse_to_ocs_f :
  ?mapping_version:mapping_version ->
  ?source:source ->
  ocsf_version:ocsf_version ->
  event_source:event_source ->
  unit ->
  parse_to_ocs_f

val make_parse_postgres : ?source:source -> unit -> parse_postgres
val make_parse_vp_c : ?source:source -> unit -> parse_vp_c
val make_parse_wa_f : ?source:source -> unit -> parse_wa_f

val make_rename_key_entry :
  ?overwrite_if_exists:overwrite_if_exists ->
  rename_to:rename_to ->
  key:key ->
  unit ->
  rename_key_entry

val make_rename_keys : entries:rename_key_entries -> unit -> rename_keys

val make_split_string_entry :
  delimiter:split_string_delimiter -> source:source -> unit -> split_string_entry

val make_split_string : entries:split_string_entries -> unit -> split_string

val make_substitute_string_entry :
  to_:to_key -> from_:from_key -> source:source -> unit -> substitute_string_entry

val make_substitute_string : entries:substitute_string_entries -> unit -> substitute_string

val make_processor :
  ?upper_case_string:upper_case_string ->
  ?type_converter:type_converter ->
  ?trim_string:trim_string ->
  ?substitute_string:substitute_string ->
  ?split_string:split_string ->
  ?rename_keys:rename_keys ->
  ?parse_wa_f:parse_wa_f ->
  ?parse_vp_c:parse_vp_c ->
  ?parse_postgres:parse_postgres ->
  ?parse_to_ocs_f:parse_to_ocs_f ->
  ?parse_route53:parse_route53 ->
  ?parse_key_value:parse_key_value ->
  ?parse_jso_n:parse_jso_n ->
  ?parse_cloudfront:parse_cloudfront ->
  ?move_keys:move_keys ->
  ?lower_case_string:lower_case_string ->
  ?list_to_map:list_to_map ->
  ?grok:grok ->
  ?delete_keys:delete_keys ->
  ?date_time_converter:date_time_converter ->
  ?csv:cs_v ->
  ?copy_value:copy_value ->
  ?add_keys:add_keys ->
  unit ->
  processor

val make_test_transformer_request :
  log_event_messages:test_event_messages ->
  transformer_config:processors ->
  unit ->
  test_transformer_request

val make_metric_filter_match_record :
  ?extracted_values:extracted_values ->
  ?event_message:event_message ->
  ?event_number:event_number ->
  unit ->
  metric_filter_match_record

val make_test_metric_filter_response :
  ?matches:metric_filter_matches -> unit -> test_metric_filter_response

val make_test_metric_filter_request :
  log_event_messages:test_event_messages ->
  filter_pattern:filter_pattern ->
  unit ->
  test_metric_filter_request

val make_tag_resource_request :
  tags:tags -> resource_arn:amazon_resource_name -> unit -> tag_resource_request

val make_tag_log_group_request :
  tags:tags -> log_group_name:log_group_name -> unit -> tag_log_group_request

val make_tag_filter : ?values:tag_filter_values -> key:tag_filter_key -> unit -> tag_filter

val make_syslog_configuration :
  ?created_at:timestamp ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?source_type:syslog_source_type ->
  ?log_group_arn:log_group_arn ->
  unit ->
  syslog_configuration

val make_subscription_filter :
  ?emit_system_fields:emit_system_fields ->
  ?field_selection_criteria:field_selection_criteria ->
  ?creation_time:timestamp ->
  ?apply_on_transformed_logs:apply_on_transformed_logs ->
  ?distribution:distribution ->
  ?role_arn:role_arn ->
  ?destination_arn:destination_arn ->
  ?filter_pattern:filter_pattern ->
  ?log_group_name:log_group_name ->
  ?filter_name:filter_name ->
  unit ->
  subscription_filter

val make_stop_query_response : ?success:success -> unit -> stop_query_response
val make_stop_query_request : query_id:query_id -> unit -> stop_query_request
val make_start_query_response : ?query_id:query_id -> unit -> start_query_response

val make_start_query_request :
  ?limit:events_limit_start_query ->
  ?log_group_identifiers:log_group_identifiers ->
  ?log_group_names:log_group_names ->
  ?log_group_name:log_group_name ->
  ?query_language:query_language ->
  query_string:query_string ->
  end_time:timestamp ->
  start_time:timestamp ->
  unit ->
  start_query_request

val make_query_compile_error_location :
  ?end_char_offset:query_char_offset ->
  ?start_char_offset:query_char_offset ->
  unit ->
  query_compile_error_location

val make_query_compile_error :
  ?message:message -> ?location:query_compile_error_location -> unit -> query_compile_error

val make_live_tail_session_start :
  ?log_event_filter_pattern:filter_pattern ->
  ?log_stream_name_prefixes:input_log_stream_names ->
  ?log_stream_names:input_log_stream_names ->
  ?log_group_identifiers:start_live_tail_log_group_identifiers ->
  ?session_id:session_id ->
  ?request_id:request_id ->
  unit ->
  live_tail_session_start

val make_live_tail_session_metadata : ?sampled:is_sampled -> unit -> live_tail_session_metadata

val make_live_tail_session_log_event :
  ?ingestion_time:timestamp ->
  ?timestamp:timestamp ->
  ?message:event_message ->
  ?log_group_identifier:log_group_identifier ->
  ?log_stream_name:log_stream_name ->
  unit ->
  live_tail_session_log_event

val make_live_tail_session_update :
  ?session_results:live_tail_session_results ->
  ?session_metadata:live_tail_session_metadata ->
  unit ->
  live_tail_session_update

val make_start_live_tail_response :
  ?response_stream:start_live_tail_response_stream -> unit -> start_live_tail_response

val make_start_live_tail_request :
  ?log_event_filter_pattern:filter_pattern ->
  ?log_stream_name_prefixes:input_log_stream_names ->
  ?log_stream_names:input_log_stream_names ->
  log_group_identifiers:start_live_tail_log_group_identifiers ->
  unit ->
  start_live_tail_request

val make_searched_log_stream :
  ?searched_completely:log_stream_searched_completely ->
  ?log_stream_name:log_stream_name ->
  unit ->
  searched_log_stream

val make_scheduled_query_summary :
  ?last_updated_time:timestamp ->
  ?creation_time:timestamp ->
  ?destination_configuration:destination_configuration ->
  ?timezone:schedule_timezone ->
  ?schedule_expression:schedule_expression ->
  ?last_execution_status:execution_status ->
  ?last_triggered_time:timestamp ->
  ?schedule_type:schedule_type ->
  ?state:scheduled_query_state ->
  ?name:scheduled_query_name ->
  ?scheduled_query_arn:arn ->
  unit ->
  scheduled_query_summary

val make_s3_tables_integration :
  ?datasource_type:s3_tables_datasource_type ->
  ?datasource_name:s3_tables_datasource_name ->
  unit ->
  s3_tables_integration

val make_data_source : ?type_:data_source_type -> name:data_source_name -> unit -> data_source

val make_s3_table_integration_source :
  ?parent_source_identifier:s3_table_integration_source_identifier ->
  ?created_time_stamp:timestamp ->
  ?status_reason:s3_table_integration_source_status_reason ->
  ?status:s3_table_integration_source_status ->
  ?data_source:data_source ->
  ?identifier:s3_table_integration_source_identifier ->
  unit ->
  s3_table_integration_source

val make_result_field : ?value:value -> ?field:field -> unit -> result_field

val make_resource_policy :
  ?revision_id:expected_revision_id ->
  ?resource_arn:arn ->
  ?policy_scope:policy_scope ->
  ?last_updated_time:timestamp ->
  ?policy_document:policy_document ->
  ?policy_name:policy_name ->
  unit ->
  resource_policy

val make_open_search_resource_config :
  ?application_arn:arn ->
  ?kms_key_arn:arn ->
  retention_days:collection_retention_days ->
  dashboard_viewer_principals:dashboard_viewer_principals ->
  data_source_role_arn:arn ->
  unit ->
  open_search_resource_config

val make_rejected_log_events_info :
  ?expired_log_event_end_index:log_event_index ->
  ?too_old_log_event_end_index:log_event_index ->
  ?too_new_log_event_start_index:log_event_index ->
  unit ->
  rejected_log_events_info

val make_rejected_entity_info :
  error_type:entity_rejection_error_type -> unit -> rejected_entity_info

val make_record_field : ?mandatory:boolean_ -> ?name:field_header -> unit -> record_field

val make_query_statistics :
  ?log_groups_scanned:stats_value ->
  ?estimated_bytes_skipped:stats_value ->
  ?bytes_scanned:stats_value ->
  ?estimated_records_skipped:stats_value ->
  ?records_scanned:stats_value ->
  ?records_matched:stats_value ->
  unit ->
  query_statistics

val make_query_parameter :
  ?description:query_parameter_description ->
  ?default_value:query_parameter_default_value ->
  name:query_parameter_name ->
  unit ->
  query_parameter

val make_query_info :
  ?user_identity:user_identity ->
  ?bytes_scanned:bytes_scanned_value ->
  ?query_duration:query_duration ->
  ?log_group_name:log_group_name ->
  ?create_time:timestamp ->
  ?status:query_status ->
  ?query_string:query_string ->
  ?query_id:query_id ->
  ?query_language:query_language ->
  unit ->
  query_info

val make_query_definition :
  ?parameters:query_parameter_list ->
  ?log_group_names:log_group_names ->
  ?last_modified:timestamp ->
  ?query_string:query_definition_string ->
  ?name:query_definition_name ->
  ?query_definition_id:query_id ->
  ?query_language:query_language ->
  unit ->
  query_definition

val make_put_transformer_request :
  transformer_config:processors ->
  log_group_identifier:log_group_identifier ->
  unit ->
  put_transformer_request

val make_put_syslog_configuration_request :
  ?vpc_endpoint_id:vpc_endpoint_id ->
  log_group_identifier:log_group_identifier ->
  unit ->
  put_syslog_configuration_request

val make_put_subscription_filter_request :
  ?emit_system_fields:emit_system_fields ->
  ?field_selection_criteria:field_selection_criteria ->
  ?apply_on_transformed_logs:apply_on_transformed_logs ->
  ?distribution:distribution ->
  ?role_arn:role_arn ->
  destination_arn:destination_arn ->
  filter_pattern:filter_pattern ->
  filter_name:filter_name ->
  log_group_name:log_group_name ->
  unit ->
  put_subscription_filter_request

val make_put_retention_policy_request :
  retention_in_days:days -> log_group_name:log_group_name -> unit -> put_retention_policy_request

val make_put_resource_policy_response :
  ?revision_id:expected_revision_id ->
  ?resource_policy:resource_policy ->
  unit ->
  put_resource_policy_response

val make_put_resource_policy_request :
  ?expected_revision_id:expected_revision_id ->
  ?resource_arn:arn ->
  ?policy_document:policy_document ->
  ?policy_name:policy_name ->
  unit ->
  put_resource_policy_request

val make_put_query_definition_response :
  ?query_definition_id:query_id -> unit -> put_query_definition_response

val make_put_query_definition_request :
  ?parameters:query_parameter_list ->
  ?client_token:client_token ->
  ?log_group_names:log_group_names ->
  ?query_definition_id:query_id ->
  ?query_language:query_language ->
  query_string:query_definition_string ->
  name:query_definition_name ->
  unit ->
  put_query_definition_request

val make_metric_transformation :
  ?unit_:standard_unit ->
  ?dimensions:dimensions ->
  ?default_value:default_value ->
  metric_value:metric_value ->
  metric_namespace:metric_namespace ->
  metric_name:metric_name ->
  unit ->
  metric_transformation

val make_put_metric_filter_request :
  ?emit_system_field_dimensions:emit_system_fields ->
  ?field_selection_criteria:field_selection_criteria ->
  ?apply_on_transformed_logs:apply_on_transformed_logs ->
  metric_transformations:metric_transformations ->
  filter_pattern:filter_pattern ->
  filter_name:filter_name ->
  log_group_name:log_group_name ->
  unit ->
  put_metric_filter_request

val make_put_log_group_deletion_protection_request :
  deletion_protection_enabled:deletion_protection_enabled ->
  log_group_identifier:log_group_identifier ->
  unit ->
  put_log_group_deletion_protection_request

val make_put_log_events_response :
  ?rejected_entity_info:rejected_entity_info ->
  ?rejected_log_events_info:rejected_log_events_info ->
  ?next_sequence_token:sequence_token ->
  unit ->
  put_log_events_response

val make_input_log_event : message:event_message -> timestamp:timestamp -> unit -> input_log_event

val make_entity :
  ?attributes:entity_attributes -> ?key_attributes:entity_key_attributes -> unit -> entity

val make_put_log_events_request :
  ?entity:entity ->
  ?sequence_token:sequence_token ->
  log_events:input_log_events ->
  log_stream_name:log_stream_name ->
  log_group_name:log_group_name ->
  unit ->
  put_log_events_request

val make_put_integration_response :
  ?integration_status:integration_status ->
  ?integration_name:integration_name ->
  unit ->
  put_integration_response

val make_put_integration_request :
  integration_type:integration_type ->
  resource_config:resource_config ->
  integration_name:integration_name ->
  unit ->
  put_integration_request

val make_index_policy :
  ?source:index_source ->
  ?policy_name:policy_name ->
  ?policy_document:policy_document ->
  ?last_update_time:timestamp ->
  ?log_group_identifier:log_group_identifier ->
  unit ->
  index_policy

val make_put_index_policy_response : ?index_policy:index_policy -> unit -> put_index_policy_response

val make_put_index_policy_request :
  policy_document:policy_document ->
  log_group_identifier:log_group_identifier ->
  unit ->
  put_index_policy_request

val make_destination :
  ?creation_time:timestamp ->
  ?arn:arn ->
  ?access_policy:access_policy ->
  ?role_arn:role_arn ->
  ?target_arn:target_arn ->
  ?destination_name:destination_name ->
  unit ->
  destination

val make_put_destination_response : ?destination:destination -> unit -> put_destination_response

val make_put_destination_request :
  ?tags:tags ->
  role_arn:role_arn ->
  target_arn:target_arn ->
  destination_name:destination_name ->
  unit ->
  put_destination_request

val make_put_destination_policy_request :
  ?force_update:force_update ->
  access_policy:access_policy ->
  destination_name:destination_name ->
  unit ->
  put_destination_policy_request

val make_delivery_source :
  ?status_reason:delivery_source_status_reason ->
  ?status:delivery_source_status ->
  ?delivery_source_configuration:delivery_source_configuration ->
  ?tags:tags ->
  ?log_type:log_type ->
  ?service:service ->
  ?resource_arns:resource_arns ->
  ?arn:arn ->
  ?name:delivery_source_name ->
  unit ->
  delivery_source

val make_put_delivery_source_response :
  ?delivery_source:delivery_source -> unit -> put_delivery_source_response

val make_put_delivery_source_request :
  ?delivery_source_configuration:delivery_source_configuration ->
  ?tags:tags ->
  log_type:log_type ->
  resource_arn:arn ->
  name:delivery_source_name ->
  unit ->
  put_delivery_source_request

val make_delivery_destination_configuration :
  destination_resource_arn:arn -> unit -> delivery_destination_configuration

val make_delivery_destination :
  ?tags:tags ->
  ?delivery_destination_configuration:delivery_destination_configuration ->
  ?output_format:output_format ->
  ?delivery_destination_type:delivery_destination_type ->
  ?arn:arn ->
  ?name:delivery_destination_name ->
  unit ->
  delivery_destination

val make_put_delivery_destination_response :
  ?delivery_destination:delivery_destination -> unit -> put_delivery_destination_response

val make_put_delivery_destination_request :
  ?tags:tags ->
  ?delivery_destination_type:delivery_destination_type ->
  ?delivery_destination_configuration:delivery_destination_configuration ->
  ?output_format:output_format ->
  name:delivery_destination_name ->
  unit ->
  put_delivery_destination_request

val make_policy : ?delivery_destination_policy:delivery_destination_policy -> unit -> policy

val make_put_delivery_destination_policy_response :
  ?policy:policy -> unit -> put_delivery_destination_policy_response

val make_put_delivery_destination_policy_request :
  delivery_destination_policy:delivery_destination_policy ->
  delivery_destination_name:delivery_destination_name ->
  unit ->
  put_delivery_destination_policy_request

val make_put_data_protection_policy_response :
  ?last_updated_time:timestamp ->
  ?policy_document:data_protection_policy_document ->
  ?log_group_identifier:log_group_identifier ->
  unit ->
  put_data_protection_policy_response

val make_put_data_protection_policy_request :
  policy_document:data_protection_policy_document ->
  log_group_identifier:log_group_identifier ->
  unit ->
  put_data_protection_policy_request

val make_put_bearer_token_authentication_request :
  bearer_token_authentication_enabled:bearer_token_authentication_enabled ->
  log_group_identifier:log_group_identifier ->
  unit ->
  put_bearer_token_authentication_request

val make_account_policy :
  ?account_id:account_id ->
  ?selection_criteria:selection_criteria ->
  ?scope:scope ->
  ?policy_type:policy_type ->
  ?last_updated_time:timestamp ->
  ?policy_document:account_policy_document ->
  ?policy_name:policy_name ->
  unit ->
  account_policy

val make_put_account_policy_response :
  ?account_policy:account_policy -> unit -> put_account_policy_response

val make_put_account_policy_request :
  ?selection_criteria:selection_criteria ->
  ?scope:scope ->
  policy_type:policy_type ->
  policy_document:account_policy_document ->
  policy_name:policy_name ->
  unit ->
  put_account_policy_request

val make_pattern_token :
  ?inferred_token_name:inferred_token_name ->
  ?enumerations:enumerations ->
  ?token_string:token_string ->
  ?is_dynamic:boolean_ ->
  ?dynamic_token_position:dynamic_token_position ->
  unit ->
  pattern_token

val make_output_log_event :
  ?ingestion_time:timestamp ->
  ?message:event_message ->
  ?timestamp:timestamp ->
  unit ->
  output_log_event

val make_open_search_resource_status :
  ?status_message:integration_status_message ->
  ?status:open_search_resource_status_type ->
  unit ->
  open_search_resource_status

val make_open_search_workspace :
  ?status:open_search_resource_status ->
  ?workspace_id:open_search_workspace_id ->
  unit ->
  open_search_workspace

val make_open_search_network_policy :
  ?status:open_search_resource_status ->
  ?policy_name:open_search_policy_name ->
  unit ->
  open_search_network_policy

val make_open_search_lifecycle_policy :
  ?status:open_search_resource_status ->
  ?policy_name:open_search_policy_name ->
  unit ->
  open_search_lifecycle_policy

val make_open_search_data_source :
  ?status:open_search_resource_status ->
  ?data_source_name:open_search_data_source_name ->
  unit ->
  open_search_data_source

val make_open_search_application :
  ?status:open_search_resource_status ->
  ?application_id:open_search_application_id ->
  ?application_arn:arn ->
  ?application_endpoint:open_search_application_endpoint ->
  unit ->
  open_search_application

val make_open_search_collection :
  ?status:open_search_resource_status ->
  ?collection_arn:arn ->
  ?collection_endpoint:open_search_collection_endpoint ->
  unit ->
  open_search_collection

val make_open_search_encryption_policy :
  ?status:open_search_resource_status ->
  ?policy_name:open_search_policy_name ->
  unit ->
  open_search_encryption_policy

val make_open_search_data_access_policy :
  ?status:open_search_resource_status ->
  ?policy_name:open_search_policy_name ->
  unit ->
  open_search_data_access_policy

val make_open_search_integration_details :
  ?lifecycle_policy:open_search_lifecycle_policy ->
  ?access_policy:open_search_data_access_policy ->
  ?network_policy:open_search_network_policy ->
  ?encryption_policy:open_search_encryption_policy ->
  ?workspace:open_search_workspace ->
  ?collection:open_search_collection ->
  ?application:open_search_application ->
  ?data_source:open_search_data_source ->
  unit ->
  open_search_integration_details

val make_metric_filter :
  ?emit_system_field_dimensions:emit_system_fields ->
  ?field_selection_criteria:field_selection_criteria ->
  ?apply_on_transformed_logs:apply_on_transformed_logs ->
  ?log_group_name:log_group_name ->
  ?creation_time:timestamp ->
  ?metric_transformations:metric_transformations ->
  ?filter_pattern:filter_pattern ->
  ?filter_name:filter_name ->
  unit ->
  metric_filter

val make_lookup_table :
  ?kms_key_id:kms_key_id ->
  ?last_updated_time:timestamp ->
  ?size_bytes:stored_bytes ->
  ?records_count:records_count ->
  ?table_fields:table_fields ->
  ?description:lookup_table_description ->
  ?lookup_table_name:lookup_table_name ->
  ?lookup_table_arn:arn ->
  unit ->
  lookup_table

val make_list_tags_log_group_response : ?tags:tags -> unit -> list_tags_log_group_response

val make_list_tags_log_group_request :
  log_group_name:log_group_name -> unit -> list_tags_log_group_request

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_list_syslog_configurations_response :
  ?next_token:next_token ->
  ?syslog_configurations:syslog_configurations ->
  unit ->
  list_syslog_configurations_response

val make_list_syslog_configurations_request :
  ?max_results:list_syslog_configurations_max_results ->
  ?next_token:next_token ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?log_group_identifier:log_group_identifier ->
  unit ->
  list_syslog_configurations_request

val make_list_sources_for_s3_table_integration_response :
  ?next_token:next_token ->
  ?sources:s3_table_integration_sources ->
  unit ->
  list_sources_for_s3_table_integration_response

val make_list_sources_for_s3_table_integration_request :
  ?next_token:next_token ->
  ?max_results:list_sources_for_s3_table_integration_max_results ->
  integration_arn:arn ->
  unit ->
  list_sources_for_s3_table_integration_request

val make_list_scheduled_queries_response :
  ?scheduled_queries:scheduled_query_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_scheduled_queries_response

val make_list_scheduled_queries_request :
  ?schedule_type:schedule_type ->
  ?state:scheduled_query_state ->
  ?next_token:next_token ->
  ?max_results:list_scheduled_queries_max_results ->
  unit ->
  list_scheduled_queries_request

val make_list_log_groups_for_query_response :
  ?next_token:next_token ->
  ?log_group_identifiers:log_group_identifiers ->
  unit ->
  list_log_groups_for_query_response

val make_list_log_groups_for_query_request :
  ?max_results:list_log_groups_for_query_max_results ->
  ?next_token:next_token ->
  query_id:query_id ->
  unit ->
  list_log_groups_for_query_request

val make_log_group_summary :
  ?log_group_class:log_group_class ->
  ?log_group_arn:arn ->
  ?log_group_name:log_group_name ->
  unit ->
  log_group_summary

val make_list_log_groups_response :
  ?next_token:next_token -> ?log_groups:log_group_summaries -> unit -> list_log_groups_response

val make_data_source_filter :
  ?type_:data_source_type -> name:data_source_name -> unit -> data_source_filter

val make_list_log_groups_request :
  ?log_group_tags:tag_filters ->
  ?field_index_names:field_index_names ->
  ?data_sources:data_source_filters ->
  ?limit:list_limit ->
  ?next_token:next_token ->
  ?account_identifiers:account_ids ->
  ?include_linked_accounts:include_linked_accounts ->
  ?log_group_class:log_group_class ->
  ?log_group_name_pattern:log_group_name_regex_pattern ->
  unit ->
  list_log_groups_request

val make_anomaly_detector :
  ?anomaly_visibility_time:anomaly_visibility_time ->
  ?last_modified_time_stamp:epoch_millis ->
  ?creation_time_stamp:epoch_millis ->
  ?kms_key_id:kms_key_id ->
  ?anomaly_detector_status:anomaly_detector_status ->
  ?filter_pattern:filter_pattern ->
  ?evaluation_frequency:evaluation_frequency ->
  ?log_group_arn_list:log_group_arn_list ->
  ?detector_name:detector_name ->
  ?anomaly_detector_arn:anomaly_detector_arn ->
  unit ->
  anomaly_detector

val make_list_log_anomaly_detectors_response :
  ?next_token:next_token ->
  ?anomaly_detectors:anomaly_detectors ->
  unit ->
  list_log_anomaly_detectors_response

val make_list_log_anomaly_detectors_request :
  ?next_token:next_token ->
  ?limit:list_log_anomaly_detectors_limit ->
  ?filter_log_group_arn:log_group_arn ->
  unit ->
  list_log_anomaly_detectors_request

val make_integration_summary :
  ?integration_status:integration_status ->
  ?integration_type:integration_type ->
  ?integration_name:integration_name ->
  unit ->
  integration_summary

val make_list_integrations_response :
  ?integration_summaries:integration_summaries -> unit -> list_integrations_response

val make_list_integrations_request :
  ?integration_status:integration_status ->
  ?integration_type:integration_type ->
  ?integration_name_prefix:integration_name_prefix ->
  unit ->
  list_integrations_request

val make_log_event : ?message:event_message -> ?timestamp:timestamp -> unit -> log_event

val make_anomaly :
  ?is_pattern_level_suppression:boolean_ ->
  ?suppressed_until:epoch_millis ->
  ?suppressed_date:epoch_millis ->
  ?suppressed:boolean_ ->
  ?priority:priority ->
  ?pattern_regex:pattern_regex ->
  log_group_arn_list:log_group_arn_list ->
  pattern_tokens:pattern_tokens ->
  log_samples:log_samples ->
  histogram:histogram ->
  state:state ->
  active:boolean_ ->
  description:description ->
  last_seen:epoch_millis ->
  first_seen:epoch_millis ->
  pattern_string:pattern_string ->
  anomaly_detector_arn:anomaly_detector_arn ->
  pattern_id:pattern_id ->
  anomaly_id:anomaly_id ->
  unit ->
  anomaly

val make_list_anomalies_response :
  ?next_token:next_token -> ?anomalies:anomalies -> unit -> list_anomalies_response

val make_list_anomalies_request :
  ?next_token:next_token ->
  ?limit:list_anomalies_limit ->
  ?suppression_state:suppression_state ->
  ?anomaly_detector_arn:anomaly_detector_arn ->
  unit ->
  list_anomalies_request

val make_grouping_identifier :
  ?value:grouping_identifier_value -> ?key:grouping_identifier_key -> unit -> grouping_identifier

val make_aggregate_log_group_summary :
  ?grouping_identifiers:grouping_identifiers ->
  ?log_group_count:log_group_count ->
  unit ->
  aggregate_log_group_summary

val make_list_aggregate_log_group_summaries_response :
  ?next_token:next_token ->
  ?aggregate_log_group_summaries:aggregate_log_group_summaries ->
  unit ->
  list_aggregate_log_group_summaries_response

val make_list_aggregate_log_group_summaries_request :
  ?limit:list_log_groups_request_limit ->
  ?next_token:next_token ->
  ?data_sources:data_source_filters ->
  ?log_group_name_pattern:log_group_name_regex_pattern ->
  ?log_group_class:log_group_class ->
  ?include_linked_accounts:include_linked_accounts ->
  ?account_identifiers:account_ids ->
  group_by:list_aggregate_log_group_summaries_group_by ->
  unit ->
  list_aggregate_log_group_summaries_request

val make_get_transformer_response :
  ?transformer_config:processors ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?log_group_identifier:log_group_identifier ->
  unit ->
  get_transformer_response

val make_get_transformer_request :
  log_group_identifier:log_group_identifier -> unit -> get_transformer_request

val make_get_scheduled_query_history_response :
  ?next_token:next_token ->
  ?trigger_history:trigger_history_record_list ->
  ?scheduled_query_arn:arn ->
  ?name:scheduled_query_name ->
  unit ->
  get_scheduled_query_history_response

val make_get_scheduled_query_history_request :
  ?next_token:next_token ->
  ?max_results:get_scheduled_query_history_max_results ->
  ?execution_statuses:execution_status_list ->
  end_time:timestamp ->
  start_time:timestamp ->
  identifier:scheduled_query_identifier ->
  unit ->
  get_scheduled_query_history_request

val make_get_scheduled_query_response :
  ?last_updated_time:timestamp ->
  ?creation_time:timestamp ->
  ?execution_role_arn:role_arn ->
  ?schedule_end_time:timestamp ->
  ?schedule_start_time:timestamp ->
  ?last_execution_status:execution_status ->
  ?last_triggered_time:timestamp ->
  ?schedule_type:schedule_type ->
  ?state:scheduled_query_state ->
  ?destination_configuration:destination_configuration ->
  ?end_time_offset:end_time_offset ->
  ?start_time_offset:start_time_offset ->
  ?timezone:schedule_timezone ->
  ?schedule_expression:schedule_expression ->
  ?log_group_identifiers:scheduled_query_log_group_identifiers ->
  ?query_string:query_string ->
  ?query_language:query_language ->
  ?description:scheduled_query_description ->
  ?name:scheduled_query_name ->
  ?scheduled_query_arn:arn ->
  unit ->
  get_scheduled_query_response

val make_get_scheduled_query_request :
  identifier:scheduled_query_identifier -> unit -> get_scheduled_query_request

val make_get_query_results_response :
  ?next_token:get_query_results_next_token ->
  ?encryption_key:encryption_key ->
  ?status:query_status ->
  ?statistics:query_statistics ->
  ?results:query_results ->
  ?query_language:query_language ->
  unit ->
  get_query_results_response

val make_get_query_results_request :
  ?max_items:get_query_results_max_items ->
  ?next_token:get_query_results_next_token ->
  query_id:query_id ->
  unit ->
  get_query_results_request

val make_get_lookup_table_response :
  ?kms_key_id:kms_key_id ->
  ?last_updated_time:timestamp ->
  ?size_bytes:stored_bytes ->
  ?table_body:table_body ->
  ?description:lookup_table_description ->
  ?lookup_table_name:lookup_table_name ->
  ?lookup_table_arn:arn ->
  unit ->
  get_lookup_table_response

val make_get_lookup_table_request : lookup_table_arn:arn -> unit -> get_lookup_table_request
val make_get_log_record_response : ?log_record:log_record -> unit -> get_log_record_response

val make_get_log_record_request :
  ?unmask:unmask -> log_record_pointer:log_record_pointer -> unit -> get_log_record_request

val make_fields_data : ?data:data -> unit -> fields_data

val make_get_log_object_response :
  ?field_stream:get_log_object_response_stream -> unit -> get_log_object_response

val make_get_log_object_request :
  ?unmask:unmask -> log_object_pointer:log_object_pointer -> unit -> get_log_object_request

val make_log_group_field : ?percent:percentage -> ?name:field -> unit -> log_group_field

val make_get_log_group_fields_response :
  ?log_group_fields:log_group_field_list -> unit -> get_log_group_fields_response

val make_get_log_group_fields_request :
  ?log_group_identifier:log_group_identifier ->
  ?time:timestamp ->
  ?log_group_name:log_group_name ->
  unit ->
  get_log_group_fields_request

val make_log_field_type :
  ?fields:log_fields_list -> ?element:log_field_type -> ?type_:data_type -> unit -> log_field_type

val make_log_fields_list_item :
  ?log_field_type:log_field_type -> ?log_field_name:log_field_name -> unit -> log_fields_list_item

val make_get_log_fields_response : ?log_fields:log_fields_list -> unit -> get_log_fields_response

val make_get_log_fields_request :
  data_source_type:data_source_type ->
  data_source_name:data_source_name ->
  unit ->
  get_log_fields_request

val make_get_log_events_response :
  ?next_backward_token:next_token ->
  ?next_forward_token:next_token ->
  ?events:output_log_events ->
  unit ->
  get_log_events_response

val make_get_log_events_request :
  ?unmask:unmask ->
  ?start_from_head:start_from_head ->
  ?limit:events_limit ->
  ?next_token:next_token ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?log_group_identifier:log_group_identifier ->
  ?log_group_name:log_group_name ->
  log_stream_name:log_stream_name ->
  unit ->
  get_log_events_request

val make_get_log_anomaly_detector_response :
  ?anomaly_visibility_time:anomaly_visibility_time ->
  ?last_modified_time_stamp:epoch_millis ->
  ?creation_time_stamp:epoch_millis ->
  ?kms_key_id:kms_key_id ->
  ?anomaly_detector_status:anomaly_detector_status ->
  ?filter_pattern:filter_pattern ->
  ?evaluation_frequency:evaluation_frequency ->
  ?log_group_arn_list:log_group_arn_list ->
  ?detector_name:detector_name ->
  unit ->
  get_log_anomaly_detector_response

val make_get_log_anomaly_detector_request :
  anomaly_detector_arn:anomaly_detector_arn -> unit -> get_log_anomaly_detector_request

val make_get_integration_response :
  ?integration_details:integration_details ->
  ?integration_status:integration_status ->
  ?integration_type:integration_type ->
  ?integration_name:integration_name ->
  unit ->
  get_integration_response

val make_get_integration_request :
  integration_name:integration_name -> unit -> get_integration_request

val make_get_delivery_source_response :
  ?delivery_source:delivery_source -> unit -> get_delivery_source_response

val make_get_delivery_source_request :
  name:delivery_source_name -> unit -> get_delivery_source_request

val make_get_delivery_destination_policy_response :
  ?policy:policy -> unit -> get_delivery_destination_policy_response

val make_get_delivery_destination_policy_request :
  delivery_destination_name:delivery_destination_name ->
  unit ->
  get_delivery_destination_policy_request

val make_get_delivery_destination_response :
  ?delivery_destination:delivery_destination -> unit -> get_delivery_destination_response

val make_get_delivery_destination_request :
  name:delivery_destination_name -> unit -> get_delivery_destination_request

val make_delivery :
  ?tags:tags ->
  ?s3_delivery_configuration:s3_delivery_configuration ->
  ?field_delimiter:field_delimiter ->
  ?record_fields:record_fields ->
  ?delivery_destination_type:delivery_destination_type ->
  ?delivery_destination_arn:arn ->
  ?delivery_source_name:delivery_source_name ->
  ?arn:arn ->
  ?id:delivery_id ->
  unit ->
  delivery

val make_get_delivery_response : ?delivery:delivery -> unit -> get_delivery_response
val make_get_delivery_request : id:delivery_id -> unit -> get_delivery_request

val make_get_data_protection_policy_response :
  ?last_updated_time:timestamp ->
  ?policy_document:data_protection_policy_document ->
  ?log_group_identifier:log_group_identifier ->
  unit ->
  get_data_protection_policy_response

val make_get_data_protection_policy_request :
  log_group_identifier:log_group_identifier -> unit -> get_data_protection_policy_request

val make_filtered_log_event :
  ?event_id:event_id ->
  ?ingestion_time:timestamp ->
  ?message:event_message ->
  ?timestamp:timestamp ->
  ?log_stream_name:log_stream_name ->
  unit ->
  filtered_log_event

val make_filter_log_events_response :
  ?next_token:next_token ->
  ?searched_log_streams:searched_log_streams ->
  ?events:filtered_log_events ->
  unit ->
  filter_log_events_response

val make_filter_log_events_request :
  ?unmask:unmask ->
  ?interleaved:interleaved ->
  ?start_from_head:start_from_head ->
  ?limit:events_limit ->
  ?next_token:next_token ->
  ?filter_pattern:filter_pattern ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?log_stream_name_prefix:log_stream_name ->
  ?log_stream_names:input_log_stream_names ->
  ?log_group_identifier:log_group_identifier ->
  ?log_group_name:log_group_name ->
  unit ->
  filter_log_events_request

val make_disassociate_source_from_s3_table_integration_response :
  ?identifier:s3_table_integration_source_identifier ->
  unit ->
  disassociate_source_from_s3_table_integration_response

val make_disassociate_source_from_s3_table_integration_request :
  identifier:s3_table_integration_source_identifier ->
  unit ->
  disassociate_source_from_s3_table_integration_request

val make_disassociate_kms_key_request :
  ?resource_identifier:resource_identifier ->
  ?log_group_name:log_group_name ->
  unit ->
  disassociate_kms_key_request

val make_describe_subscription_filters_response :
  ?next_token:next_token ->
  ?subscription_filters:subscription_filters ->
  unit ->
  describe_subscription_filters_response

val make_describe_subscription_filters_request :
  ?limit:describe_limit ->
  ?next_token:next_token ->
  ?filter_name_prefix:filter_name ->
  log_group_name:log_group_name ->
  unit ->
  describe_subscription_filters_request

val make_describe_resource_policies_response :
  ?next_token:next_token ->
  ?resource_policies:resource_policies ->
  unit ->
  describe_resource_policies_response

val make_describe_resource_policies_request :
  ?policy_scope:policy_scope ->
  ?resource_arn:arn ->
  ?limit:describe_limit ->
  ?next_token:next_token ->
  unit ->
  describe_resource_policies_request

val make_describe_query_definitions_response :
  ?next_token:next_token ->
  ?query_definitions:query_definition_list ->
  unit ->
  describe_query_definitions_response

val make_describe_query_definitions_request :
  ?next_token:next_token ->
  ?max_results:query_list_max_results ->
  ?query_definition_name_prefix:query_definition_name ->
  ?query_language:query_language ->
  unit ->
  describe_query_definitions_request

val make_describe_queries_response :
  ?next_token:next_token -> ?queries:query_info_list -> unit -> describe_queries_response

val make_describe_queries_request :
  ?query_language:query_language ->
  ?next_token:next_token ->
  ?max_results:describe_queries_max_results ->
  ?status:query_status ->
  ?log_group_name:log_group_name ->
  unit ->
  describe_queries_request

val make_describe_metric_filters_response :
  ?next_token:next_token ->
  ?metric_filters:metric_filters ->
  unit ->
  describe_metric_filters_response

val make_describe_metric_filters_request :
  ?metric_namespace:metric_namespace ->
  ?metric_name:metric_name ->
  ?limit:describe_limit ->
  ?next_token:next_token ->
  ?filter_name_prefix:filter_name ->
  ?log_group_name:log_group_name ->
  unit ->
  describe_metric_filters_request

val make_describe_lookup_tables_response :
  ?next_token:next_token -> ?lookup_tables:lookup_tables -> unit -> describe_lookup_tables_response

val make_describe_lookup_tables_request :
  ?next_token:next_token ->
  ?max_results:describe_lookup_tables_max_results ->
  ?lookup_table_name_prefix:lookup_table_name ->
  unit ->
  describe_lookup_tables_request

val make_log_stream :
  ?stored_bytes:stored_bytes ->
  ?arn:arn ->
  ?upload_sequence_token:sequence_token ->
  ?last_ingestion_time:timestamp ->
  ?last_event_timestamp:timestamp ->
  ?first_event_timestamp:timestamp ->
  ?creation_time:timestamp ->
  ?log_stream_name:log_stream_name ->
  unit ->
  log_stream

val make_describe_log_streams_response :
  ?next_token:next_token -> ?log_streams:log_streams -> unit -> describe_log_streams_response

val make_describe_log_streams_request :
  ?limit:describe_limit ->
  ?next_token:next_token ->
  ?descending:descending ->
  ?order_by:order_by ->
  ?log_stream_name_prefix:log_stream_name ->
  ?log_group_identifier:log_group_identifier ->
  ?log_group_name:log_group_name ->
  unit ->
  describe_log_streams_request

val make_log_group :
  ?bearer_token_authentication_enabled:bearer_token_authentication_enabled ->
  ?deletion_protection_enabled:deletion_protection_enabled ->
  ?log_group_arn:arn ->
  ?log_group_class:log_group_class ->
  ?inherited_properties:inherited_properties ->
  ?data_protection_status:data_protection_status ->
  ?kms_key_id:kms_key_id ->
  ?stored_bytes:stored_bytes ->
  ?arn:arn ->
  ?metric_filter_count:filter_count ->
  ?retention_in_days:days ->
  ?creation_time:timestamp ->
  ?log_group_name:log_group_name ->
  unit ->
  log_group

val make_describe_log_groups_response :
  ?next_token:next_token -> ?log_groups:log_groups -> unit -> describe_log_groups_response

val make_describe_log_groups_request :
  ?log_group_identifiers:describe_log_groups_log_group_identifiers ->
  ?log_group_class:log_group_class ->
  ?include_linked_accounts:include_linked_accounts ->
  ?limit:describe_limit ->
  ?next_token:next_token ->
  ?log_group_name_pattern:log_group_name_pattern ->
  ?log_group_name_prefix:log_group_name ->
  ?account_identifiers:account_ids ->
  unit ->
  describe_log_groups_request

val make_describe_index_policies_response :
  ?next_token:next_token ->
  ?index_policies:index_policies ->
  unit ->
  describe_index_policies_response

val make_describe_index_policies_request :
  ?next_token:next_token ->
  log_group_identifiers:describe_index_policies_log_group_identifiers ->
  unit ->
  describe_index_policies_request

val make_import_statistics : ?bytes_imported:stored_bytes -> unit -> import_statistics

val make_import_filter :
  ?end_event_time:timestamp -> ?start_event_time:timestamp -> unit -> import_filter

val make_import :
  ?error_message:error_message ->
  ?last_updated_time:timestamp ->
  ?creation_time:timestamp ->
  ?import_filter:import_filter ->
  ?import_statistics:import_statistics ->
  ?import_destination_arn:arn ->
  ?import_status:import_status ->
  ?import_source_arn:arn ->
  ?import_id:import_id ->
  unit ->
  import

val make_describe_import_tasks_response :
  ?next_token:next_token -> ?imports:import_list -> unit -> describe_import_tasks_response

val make_describe_import_tasks_request :
  ?next_token:next_token ->
  ?limit:describe_limit ->
  ?import_source_arn:arn ->
  ?import_status:import_status ->
  ?import_id:import_id ->
  unit ->
  describe_import_tasks_request

val make_import_batch :
  ?error_message:error_message -> status:import_status -> batch_id:batch_id -> unit -> import_batch

val make_describe_import_task_batches_response :
  ?next_token:next_token ->
  ?import_batches:import_batch_list ->
  ?import_id:import_id ->
  ?import_source_arn:arn ->
  unit ->
  describe_import_task_batches_response

val make_describe_import_task_batches_request :
  ?next_token:next_token ->
  ?limit:describe_limit ->
  ?batch_import_status:import_status_list ->
  import_id:import_id ->
  unit ->
  describe_import_task_batches_request

val make_field_index :
  ?type_:index_type ->
  ?last_event_time:timestamp ->
  ?first_event_time:timestamp ->
  ?last_scan_time:timestamp ->
  ?field_index_name:field_index_name ->
  ?log_group_identifier:log_group_identifier ->
  unit ->
  field_index

val make_describe_field_indexes_response :
  ?next_token:next_token -> ?field_indexes:field_indexes -> unit -> describe_field_indexes_response

val make_describe_field_indexes_request :
  ?next_token:next_token ->
  log_group_identifiers:describe_field_indexes_log_group_identifiers ->
  unit ->
  describe_field_indexes_request

val make_export_task_status :
  ?message:export_task_status_message -> ?code:export_task_status_code -> unit -> export_task_status

val make_export_task_execution_info :
  ?completion_time:timestamp -> ?creation_time:timestamp -> unit -> export_task_execution_info

val make_export_task :
  ?execution_info:export_task_execution_info ->
  ?status:export_task_status ->
  ?destination_prefix:export_destination_prefix ->
  ?destination:export_destination_bucket ->
  ?to_:timestamp ->
  ?from_:timestamp ->
  ?log_group_name:log_group_name ->
  ?task_name:export_task_name ->
  ?task_id:export_task_id ->
  unit ->
  export_task

val make_describe_export_tasks_response :
  ?next_token:next_token -> ?export_tasks:export_tasks -> unit -> describe_export_tasks_response

val make_describe_export_tasks_request :
  ?limit:describe_limit ->
  ?next_token:next_token ->
  ?status_code:export_task_status_code ->
  ?task_id:export_task_id ->
  unit ->
  describe_export_tasks_request

val make_describe_destinations_response :
  ?next_token:next_token -> ?destinations:destinations -> unit -> describe_destinations_response

val make_describe_destinations_request :
  ?limit:describe_limit ->
  ?next_token:next_token ->
  ?destination_name_prefix:destination_name ->
  unit ->
  describe_destinations_request

val make_describe_delivery_sources_response :
  ?next_token:next_token ->
  ?delivery_sources:delivery_sources ->
  unit ->
  describe_delivery_sources_response

val make_describe_delivery_sources_request :
  ?limit:describe_limit -> ?next_token:next_token -> unit -> describe_delivery_sources_request

val make_describe_delivery_destinations_response :
  ?next_token:next_token ->
  ?delivery_destinations:delivery_destinations ->
  unit ->
  describe_delivery_destinations_response

val make_describe_delivery_destinations_request :
  ?limit:describe_limit -> ?next_token:next_token -> unit -> describe_delivery_destinations_request

val make_describe_deliveries_response :
  ?next_token:next_token -> ?deliveries:deliveries -> unit -> describe_deliveries_response

val make_describe_deliveries_request :
  ?limit:describe_limit -> ?next_token:next_token -> unit -> describe_deliveries_request

val make_configuration_template_delivery_config_values :
  ?s3_delivery_configuration:s3_delivery_configuration ->
  ?field_delimiter:field_delimiter ->
  ?record_fields:record_fields ->
  unit ->
  configuration_template_delivery_config_values

val make_delivery_source_configuration_schema :
  ?max_value:delivery_source_configuration_numeric_value ->
  ?min_value:delivery_source_configuration_numeric_value ->
  ?supported_values:delivery_source_configuration_supported_values ->
  default_value:delivery_source_configuration_schema_field ->
  value_type:delivery_source_configuration_schema_value_type ->
  key_name:delivery_source_configuration_schema_field ->
  unit ->
  delivery_source_configuration_schema

val make_configuration_template :
  ?s3_tables_integration:s3_tables_integration ->
  ?delivery_source_configuration:delivery_source_configuration_schemas ->
  ?allowed_suffix_path_fields:record_fields ->
  ?allowed_field_delimiters:allowed_field_delimiters ->
  ?allowed_action_for_allow_vended_logs_delivery_for_resource:
    allowed_action_for_allow_vended_logs_delivery_for_resource ->
  ?allowed_output_formats:output_formats ->
  ?allowed_fields:allowed_fields ->
  ?default_delivery_config_values:configuration_template_delivery_config_values ->
  ?delivery_destination_type:delivery_destination_type ->
  ?resource_type:resource_type ->
  ?log_type:log_type ->
  ?service:service ->
  unit ->
  configuration_template

val make_describe_configuration_templates_response :
  ?next_token:next_token ->
  ?configuration_templates:configuration_templates ->
  unit ->
  describe_configuration_templates_response

val make_describe_configuration_templates_request :
  ?limit:describe_limit ->
  ?next_token:next_token ->
  ?delivery_destination_types:delivery_destination_types ->
  ?resource_types:resource_types ->
  ?log_types:log_types ->
  ?service:service ->
  unit ->
  describe_configuration_templates_request

val make_describe_account_policies_response :
  ?next_token:next_token ->
  ?account_policies:account_policies ->
  unit ->
  describe_account_policies_response

val make_describe_account_policies_request :
  ?next_token:next_token ->
  ?account_identifiers:account_ids ->
  ?policy_name:policy_name ->
  policy_type:policy_type ->
  unit ->
  describe_account_policies_request

val make_delete_transformer_request :
  log_group_identifier:log_group_identifier -> unit -> delete_transformer_request

val make_delete_syslog_configuration_request :
  ?vpc_endpoint_id:vpc_endpoint_id ->
  log_group_identifier:log_group_identifier ->
  unit ->
  delete_syslog_configuration_request

val make_delete_subscription_filter_request :
  filter_name:filter_name ->
  log_group_name:log_group_name ->
  unit ->
  delete_subscription_filter_request

val make_delete_scheduled_query_response : unit -> unit

val make_delete_scheduled_query_request :
  identifier:scheduled_query_identifier -> unit -> delete_scheduled_query_request

val make_delete_retention_policy_request :
  log_group_name:log_group_name -> unit -> delete_retention_policy_request

val make_delete_resource_policy_request :
  ?expected_revision_id:expected_revision_id ->
  ?resource_arn:arn ->
  ?policy_name:policy_name ->
  unit ->
  delete_resource_policy_request

val make_delete_query_definition_response :
  ?success:success -> unit -> delete_query_definition_response

val make_delete_query_definition_request :
  query_definition_id:query_id -> unit -> delete_query_definition_request

val make_delete_metric_filter_request :
  filter_name:filter_name -> log_group_name:log_group_name -> unit -> delete_metric_filter_request

val make_delete_lookup_table_request : lookup_table_arn:arn -> unit -> delete_lookup_table_request

val make_delete_log_stream_request :
  log_stream_name:log_stream_name ->
  log_group_name:log_group_name ->
  unit ->
  delete_log_stream_request

val make_delete_log_group_request :
  log_group_name:log_group_name -> unit -> delete_log_group_request

val make_delete_log_anomaly_detector_request :
  anomaly_detector_arn:anomaly_detector_arn -> unit -> delete_log_anomaly_detector_request

val make_delete_integration_response : unit -> unit

val make_delete_integration_request :
  ?force:force -> integration_name:integration_name -> unit -> delete_integration_request

val make_delete_index_policy_response : unit -> unit

val make_delete_index_policy_request :
  log_group_identifier:log_group_identifier -> unit -> delete_index_policy_request

val make_delete_destination_request :
  destination_name:destination_name -> unit -> delete_destination_request

val make_delete_delivery_source_request :
  name:delivery_source_name -> unit -> delete_delivery_source_request

val make_delete_delivery_destination_policy_request :
  delivery_destination_name:delivery_destination_name ->
  unit ->
  delete_delivery_destination_policy_request

val make_delete_delivery_destination_request :
  name:delivery_destination_name -> unit -> delete_delivery_destination_request

val make_delete_delivery_request : id:delivery_id -> unit -> delete_delivery_request

val make_delete_data_protection_policy_request :
  log_group_identifier:log_group_identifier -> unit -> delete_data_protection_policy_request

val make_delete_account_policy_request :
  policy_type:policy_type -> policy_name:policy_name -> unit -> delete_account_policy_request

val make_create_scheduled_query_response :
  ?state:scheduled_query_state ->
  ?scheduled_query_arn:arn ->
  unit ->
  create_scheduled_query_response

val make_create_scheduled_query_request :
  ?tags:tags ->
  ?state:scheduled_query_state ->
  ?schedule_end_time:timestamp ->
  ?schedule_start_time:timestamp ->
  ?destination_configuration:destination_configuration ->
  ?end_time_offset:end_time_offset ->
  ?start_time_offset:start_time_offset ->
  ?timezone:schedule_timezone ->
  ?log_group_identifiers:scheduled_query_log_group_identifiers ->
  ?description:scheduled_query_description ->
  execution_role_arn:role_arn ->
  schedule_expression:schedule_expression ->
  query_string:query_string ->
  query_language:query_language ->
  name:scheduled_query_name ->
  unit ->
  create_scheduled_query_request

val make_create_lookup_table_response :
  ?created_at:timestamp -> ?lookup_table_arn:arn -> unit -> create_lookup_table_response

val make_create_lookup_table_request :
  ?tags:tags ->
  ?kms_key_id:kms_key_id ->
  ?description:lookup_table_description ->
  table_body:table_body ->
  lookup_table_name:lookup_table_name ->
  unit ->
  create_lookup_table_request

val make_create_log_stream_request :
  log_stream_name:log_stream_name ->
  log_group_name:log_group_name ->
  unit ->
  create_log_stream_request

val make_create_log_group_request :
  ?deletion_protection_enabled:deletion_protection_enabled ->
  ?log_group_class:log_group_class ->
  ?tags:tags ->
  ?kms_key_id:kms_key_id ->
  log_group_name:log_group_name ->
  unit ->
  create_log_group_request

val make_create_log_anomaly_detector_response :
  ?anomaly_detector_arn:anomaly_detector_arn -> unit -> create_log_anomaly_detector_response

val make_create_log_anomaly_detector_request :
  ?tags:tags ->
  ?anomaly_visibility_time:anomaly_visibility_time ->
  ?kms_key_id:detector_kms_key_arn ->
  ?filter_pattern:filter_pattern ->
  ?evaluation_frequency:evaluation_frequency ->
  ?detector_name:detector_name ->
  log_group_arn_list:log_group_arn_list ->
  unit ->
  create_log_anomaly_detector_request

val make_create_import_task_response :
  ?creation_time:timestamp ->
  ?import_destination_arn:arn ->
  ?import_id:import_id ->
  unit ->
  create_import_task_response

val make_create_import_task_request :
  ?import_filter:import_filter ->
  import_role_arn:role_arn ->
  import_source_arn:arn ->
  unit ->
  create_import_task_request

val make_create_export_task_response :
  ?task_id:export_task_id -> unit -> create_export_task_response

val make_create_export_task_request :
  ?destination_prefix:export_destination_prefix ->
  ?log_stream_name_prefix:log_stream_name ->
  ?task_name:export_task_name ->
  destination:export_destination_bucket ->
  to_:timestamp ->
  from_:timestamp ->
  log_group_name:log_group_name ->
  unit ->
  create_export_task_request

val make_create_delivery_response : ?delivery:delivery -> unit -> create_delivery_response

val make_create_delivery_request :
  ?tags:tags ->
  ?s3_delivery_configuration:s3_delivery_configuration ->
  ?field_delimiter:field_delimiter ->
  ?record_fields:record_fields ->
  delivery_destination_arn:arn ->
  delivery_source_name:delivery_source_name ->
  unit ->
  create_delivery_request

val make_cancel_import_task_response :
  ?last_updated_time:timestamp ->
  ?creation_time:timestamp ->
  ?import_status:import_status ->
  ?import_statistics:import_statistics ->
  ?import_id:import_id ->
  unit ->
  cancel_import_task_response

val make_cancel_import_task_request : import_id:import_id -> unit -> cancel_import_task_request
val make_cancel_export_task_request : task_id:export_task_id -> unit -> cancel_export_task_request

val make_associate_source_to_s3_table_integration_response :
  ?identifier:s3_table_integration_source_identifier ->
  unit ->
  associate_source_to_s3_table_integration_response

val make_associate_source_to_s3_table_integration_request :
  data_source:data_source ->
  integration_arn:arn ->
  unit ->
  associate_source_to_s3_table_integration_request

val make_associate_kms_key_request :
  ?resource_identifier:resource_identifier ->
  ?log_group_name:log_group_name ->
  kms_key_id:kms_key_id ->
  unit ->
  associate_kms_key_request
