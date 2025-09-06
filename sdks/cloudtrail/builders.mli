open Types

val make_widget :
  ?view_properties:view_properties_map ->
  ?query_parameters:query_parameters ->
  ?query_statement:query_statement ->
  ?query_alias:query_alias ->
  unit ->
  widget

val make_update_trail_response :
  ?is_organization_trail:boolean_ ->
  ?kms_key_id:string_ ->
  ?cloud_watch_logs_role_arn:string_ ->
  ?cloud_watch_logs_log_group_arn:string_ ->
  ?log_file_validation_enabled:boolean_ ->
  ?trail_ar_n:string_ ->
  ?is_multi_region_trail:boolean_ ->
  ?include_global_service_events:boolean_ ->
  ?sns_topic_ar_n:string_ ->
  ?sns_topic_name:string_ ->
  ?s3_key_prefix:string_ ->
  ?s3_bucket_name:string_ ->
  ?name:string_ ->
  unit ->
  update_trail_response

val make_update_trail_request :
  ?is_organization_trail:boolean_ ->
  ?kms_key_id:string_ ->
  ?cloud_watch_logs_role_arn:string_ ->
  ?cloud_watch_logs_log_group_arn:string_ ->
  ?enable_log_file_validation:boolean_ ->
  ?is_multi_region_trail:boolean_ ->
  ?include_global_service_events:boolean_ ->
  ?sns_topic_name:string_ ->
  ?s3_key_prefix:string_ ->
  ?s3_bucket_name:string_ ->
  name:string_ ->
  unit ->
  update_trail_request

val make_advanced_field_selector :
  ?not_ends_with:operator ->
  ?not_starts_with:operator ->
  ?not_equals:operator ->
  ?ends_with:operator ->
  ?starts_with:operator ->
  ?equals:operator ->
  field:selector_field ->
  unit ->
  advanced_field_selector

val make_advanced_event_selector :
  ?name:selector_name -> field_selectors:advanced_field_selectors -> unit -> advanced_event_selector

val make_update_event_data_store_response :
  ?federation_role_arn:federation_role_arn ->
  ?federation_status:federation_status ->
  ?billing_mode:billing_mode ->
  ?kms_key_id:event_data_store_kms_key_id ->
  ?updated_timestamp:date ->
  ?created_timestamp:date ->
  ?termination_protection_enabled:termination_protection_enabled ->
  ?retention_period:retention_period ->
  ?organization_enabled:boolean_ ->
  ?multi_region_enabled:boolean_ ->
  ?advanced_event_selectors:advanced_event_selectors ->
  ?status:event_data_store_status ->
  ?name:event_data_store_name ->
  ?event_data_store_arn:event_data_store_arn ->
  unit ->
  update_event_data_store_response

val make_update_event_data_store_request :
  ?billing_mode:billing_mode ->
  ?kms_key_id:event_data_store_kms_key_id ->
  ?termination_protection_enabled:termination_protection_enabled ->
  ?retention_period:retention_period ->
  ?organization_enabled:boolean_ ->
  ?multi_region_enabled:boolean_ ->
  ?advanced_event_selectors:advanced_event_selectors ->
  ?name:event_data_store_name ->
  event_data_store:event_data_store_arn ->
  unit ->
  update_event_data_store_request

val make_refresh_schedule_frequency :
  ?value:refresh_schedule_frequency_value ->
  ?unit_:refresh_schedule_frequency_unit ->
  unit ->
  refresh_schedule_frequency

val make_refresh_schedule :
  ?time_of_day:time_of_day ->
  ?status:refresh_schedule_status ->
  ?frequency:refresh_schedule_frequency ->
  unit ->
  refresh_schedule

val make_update_dashboard_response :
  ?updated_timestamp:date ->
  ?created_timestamp:date ->
  ?termination_protection_enabled:termination_protection_enabled ->
  ?refresh_schedule:refresh_schedule ->
  ?widgets:widget_list ->
  ?type_:dashboard_type ->
  ?name:dashboard_name ->
  ?dashboard_arn:dashboard_arn ->
  unit ->
  update_dashboard_response

val make_request_widget :
  ?query_parameters:query_parameters ->
  view_properties:view_properties_map ->
  query_statement:query_statement ->
  unit ->
  request_widget

val make_update_dashboard_request :
  ?termination_protection_enabled:termination_protection_enabled ->
  ?refresh_schedule:refresh_schedule ->
  ?widgets:request_widget_list ->
  dashboard_id:dashboard_arn ->
  unit ->
  update_dashboard_request

val make_destination : location:location -> type_:destination_type -> unit -> destination

val make_update_channel_response :
  ?destinations:destinations ->
  ?source:source ->
  ?name:channel_name ->
  ?channel_arn:channel_arn ->
  unit ->
  update_channel_response

val make_update_channel_request :
  ?name:channel_name ->
  ?destinations:destinations ->
  channel:channel_arn ->
  unit ->
  update_channel_request

val make_trail_info :
  ?home_region:string_ -> ?name:string_ -> ?trail_ar_n:string_ -> unit -> trail_info

val make_trail :
  ?is_organization_trail:boolean_ ->
  ?has_insight_selectors:boolean_ ->
  ?has_custom_event_selectors:boolean_ ->
  ?kms_key_id:string_ ->
  ?cloud_watch_logs_role_arn:string_ ->
  ?cloud_watch_logs_log_group_arn:string_ ->
  ?log_file_validation_enabled:boolean_ ->
  ?trail_ar_n:string_ ->
  ?home_region:string_ ->
  ?is_multi_region_trail:boolean_ ->
  ?include_global_service_events:boolean_ ->
  ?sns_topic_ar_n:string_ ->
  ?sns_topic_name:string_ ->
  ?s3_key_prefix:string_ ->
  ?s3_bucket_name:string_ ->
  ?name:string_ ->
  unit ->
  trail

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag
val make_stop_logging_response : unit -> unit
val make_stop_logging_request : name:string_ -> unit -> stop_logging_request

val make_s3_import_source :
  s3_bucket_access_role_arn:string_ ->
  s3_bucket_region:string_ ->
  s3_location_uri:string_ ->
  unit ->
  s3_import_source

val make_import_source : s3:s3_import_source -> unit -> import_source

val make_import_statistics :
  ?failed_entries:long ->
  ?events_completed:long ->
  ?files_completed:long ->
  ?prefixes_completed:long ->
  ?prefixes_found:long ->
  unit ->
  import_statistics

val make_stop_import_response :
  ?import_statistics:import_statistics ->
  ?end_event_time:date ->
  ?start_event_time:date ->
  ?updated_timestamp:date ->
  ?created_timestamp:date ->
  ?import_status:import_status ->
  ?destinations:import_destinations ->
  ?import_source:import_source ->
  ?import_id:uui_d ->
  unit ->
  stop_import_response

val make_stop_import_request : import_id:uui_d -> unit -> stop_import_request
val make_stop_event_data_store_ingestion_response : unit -> unit

val make_stop_event_data_store_ingestion_request :
  event_data_store:event_data_store_arn -> unit -> stop_event_data_store_ingestion_request

val make_start_query_response :
  ?event_data_store_owner_account_id:account_id -> ?query_id:uui_d -> unit -> start_query_response

val make_start_query_request :
  ?event_data_store_owner_account_id:account_id ->
  ?query_parameters:query_parameters ->
  ?query_alias:query_alias ->
  ?delivery_s3_uri:delivery_s3_uri ->
  ?query_statement:query_statement ->
  unit ->
  start_query_request

val make_start_logging_response : unit -> unit
val make_start_logging_request : name:string_ -> unit -> start_logging_request

val make_start_import_response :
  ?updated_timestamp:date ->
  ?created_timestamp:date ->
  ?import_status:import_status ->
  ?end_event_time:date ->
  ?start_event_time:date ->
  ?import_source:import_source ->
  ?destinations:import_destinations ->
  ?import_id:uui_d ->
  unit ->
  start_import_response

val make_start_import_request :
  ?import_id:uui_d ->
  ?end_event_time:date ->
  ?start_event_time:date ->
  ?import_source:import_source ->
  ?destinations:import_destinations ->
  unit ->
  start_import_request

val make_start_event_data_store_ingestion_response : unit -> unit

val make_start_event_data_store_ingestion_request :
  event_data_store:event_data_store_arn -> unit -> start_event_data_store_ingestion_request

val make_start_dashboard_refresh_response :
  ?refresh_id:refresh_id -> unit -> start_dashboard_refresh_response

val make_start_dashboard_refresh_request :
  ?query_parameter_values:query_parameter_values ->
  dashboard_id:dashboard_arn ->
  unit ->
  start_dashboard_refresh_request

val make_source_config :
  ?advanced_event_selectors:advanced_event_selectors ->
  ?apply_to_all_regions:boolean_ ->
  unit ->
  source_config

val make_search_sample_queries_response :
  ?next_token:pagination_token ->
  ?search_results:search_sample_queries_search_results ->
  unit ->
  search_sample_queries_response

val make_search_sample_queries_request :
  ?next_token:pagination_token ->
  ?max_results:search_sample_queries_max_results ->
  search_phrase:search_sample_queries_search_phrase ->
  unit ->
  search_sample_queries_request

val make_restore_event_data_store_response :
  ?billing_mode:billing_mode ->
  ?kms_key_id:event_data_store_kms_key_id ->
  ?updated_timestamp:date ->
  ?created_timestamp:date ->
  ?termination_protection_enabled:termination_protection_enabled ->
  ?retention_period:retention_period ->
  ?organization_enabled:boolean_ ->
  ?multi_region_enabled:boolean_ ->
  ?advanced_event_selectors:advanced_event_selectors ->
  ?status:event_data_store_status ->
  ?name:event_data_store_name ->
  ?event_data_store_arn:event_data_store_arn ->
  unit ->
  restore_event_data_store_response

val make_restore_event_data_store_request :
  event_data_store:event_data_store_arn -> unit -> restore_event_data_store_request

val make_resource_tag : ?tags_list:tags_list -> ?resource_id:string_ -> unit -> resource_tag
val make_resource : ?resource_name:string_ -> ?resource_type:string_ -> unit -> resource
val make_remove_tags_response : unit -> unit

val make_remove_tags_request :
  tags_list:tags_list -> resource_id:string_ -> unit -> remove_tags_request

val make_register_organization_delegated_admin_response : unit -> unit

val make_register_organization_delegated_admin_request :
  member_account_id:account_id -> unit -> register_organization_delegated_admin_request

val make_query_statistics_for_describe_query :
  ?creation_time:date ->
  ?execution_time_in_millis:integer ->
  ?bytes_scanned:long ->
  ?events_scanned:long ->
  ?events_matched:long ->
  unit ->
  query_statistics_for_describe_query

val make_query_statistics :
  ?bytes_scanned:long ->
  ?total_results_count:integer ->
  ?results_count:integer ->
  unit ->
  query_statistics

val make_query :
  ?creation_time:date -> ?query_status:query_status -> ?query_id:uui_d -> unit -> query

val make_put_resource_policy_response :
  ?delegated_admin_resource_policy:resource_policy ->
  ?resource_policy:resource_policy ->
  ?resource_arn:resource_arn ->
  unit ->
  put_resource_policy_response

val make_put_resource_policy_request :
  resource_policy:resource_policy ->
  resource_arn:resource_arn ->
  unit ->
  put_resource_policy_request

val make_insight_selector : ?insight_type:insight_type -> unit -> insight_selector

val make_put_insight_selectors_response :
  ?insights_destination:event_data_store_arn ->
  ?event_data_store_arn:event_data_store_arn ->
  ?insight_selectors:insight_selectors ->
  ?trail_ar_n:string_ ->
  unit ->
  put_insight_selectors_response

val make_put_insight_selectors_request :
  ?insights_destination:event_data_store_arn ->
  ?event_data_store:event_data_store_arn ->
  ?trail_name:string_ ->
  insight_selectors:insight_selectors ->
  unit ->
  put_insight_selectors_request

val make_data_resource : ?values:data_resource_values -> ?type_:string_ -> unit -> data_resource

val make_event_selector :
  ?exclude_management_event_sources:exclude_management_event_sources ->
  ?data_resources:data_resources ->
  ?include_management_events:boolean_ ->
  ?read_write_type:read_write_type ->
  unit ->
  event_selector

val make_put_event_selectors_response :
  ?advanced_event_selectors:advanced_event_selectors ->
  ?event_selectors:event_selectors ->
  ?trail_ar_n:string_ ->
  unit ->
  put_event_selectors_response

val make_put_event_selectors_request :
  ?advanced_event_selectors:advanced_event_selectors ->
  ?event_selectors:event_selectors ->
  trail_name:string_ ->
  unit ->
  put_event_selectors_request

val make_context_key_selector :
  equals:operator_target_list -> type_:type_ -> unit -> context_key_selector

val make_put_event_configuration_response :
  ?context_key_selectors:context_key_selectors ->
  ?max_event_size:max_event_size ->
  ?event_data_store_arn:event_data_store_arn ->
  unit ->
  put_event_configuration_response

val make_put_event_configuration_request :
  ?event_data_store:string_ ->
  context_key_selectors:context_key_selectors ->
  max_event_size:max_event_size ->
  unit ->
  put_event_configuration_request

val make_public_key :
  ?fingerprint:string_ ->
  ?validity_end_time:date ->
  ?validity_start_time:date ->
  ?value:byte_buffer ->
  unit ->
  public_key

val make_partition_key :
  type_:partition_key_type -> name:partition_key_name -> unit -> partition_key

val make_event :
  ?cloud_trail_event:string_ ->
  ?resources:resource_list ->
  ?username:string_ ->
  ?event_source:string_ ->
  ?event_time:date ->
  ?access_key_id:string_ ->
  ?read_only:string_ ->
  ?event_name:string_ ->
  ?event_id:string_ ->
  unit ->
  event

val make_lookup_events_response :
  ?next_token:next_token -> ?events:events_list -> unit -> lookup_events_response

val make_lookup_attribute :
  attribute_value:lookup_attribute_value ->
  attribute_key:lookup_attribute_key ->
  unit ->
  lookup_attribute

val make_lookup_events_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?event_category:event_category ->
  ?end_time:date ->
  ?start_time:date ->
  ?lookup_attributes:lookup_attributes_list ->
  unit ->
  lookup_events_request

val make_list_trails_response :
  ?next_token:string_ -> ?trails:trails -> unit -> list_trails_response

val make_list_trails_request : ?next_token:string_ -> unit -> list_trails_request

val make_list_tags_response :
  ?next_token:string_ -> ?resource_tag_list:resource_tag_list -> unit -> list_tags_response

val make_list_tags_request :
  ?next_token:string_ -> resource_id_list:resource_id_list -> unit -> list_tags_request

val make_list_queries_response :
  ?next_token:pagination_token -> ?queries:queries -> unit -> list_queries_response

val make_list_queries_request :
  ?query_status:query_status ->
  ?end_time:date ->
  ?start_time:date ->
  ?max_results:list_queries_max_results_count ->
  ?next_token:pagination_token ->
  event_data_store:event_data_store_arn ->
  unit ->
  list_queries_request

val make_list_public_keys_response :
  ?next_token:string_ -> ?public_key_list:public_key_list -> unit -> list_public_keys_response

val make_list_public_keys_request :
  ?next_token:string_ -> ?end_time:date -> ?start_time:date -> unit -> list_public_keys_request

val make_list_insights_metric_data_response :
  ?next_token:insights_metric_next_token ->
  ?values:insights_metric_values ->
  ?timestamps:timestamps ->
  ?error_code:error_code ->
  ?insight_type:insight_type ->
  ?event_name:event_name ->
  ?event_source:event_source ->
  unit ->
  list_insights_metric_data_response

val make_list_insights_metric_data_request :
  ?next_token:insights_metric_next_token ->
  ?max_results:insights_metric_max_results ->
  ?data_type:insights_metric_data_type ->
  ?period:insights_metric_period ->
  ?end_time:date ->
  ?start_time:date ->
  ?error_code:error_code ->
  insight_type:insight_type ->
  event_name:event_name ->
  event_source:event_source ->
  unit ->
  list_insights_metric_data_request

val make_imports_list_item :
  ?updated_timestamp:date ->
  ?created_timestamp:date ->
  ?destinations:import_destinations ->
  ?import_status:import_status ->
  ?import_id:uui_d ->
  unit ->
  imports_list_item

val make_list_imports_response :
  ?next_token:pagination_token -> ?imports:imports_list -> unit -> list_imports_response

val make_list_imports_request :
  ?next_token:pagination_token ->
  ?import_status:import_status ->
  ?destination:event_data_store_arn ->
  ?max_results:list_imports_max_results_count ->
  unit ->
  list_imports_request

val make_import_failure_list_item :
  ?last_updated_time:date ->
  ?error_message:string_ ->
  ?error_type:string_ ->
  ?status:import_failure_status ->
  ?location:string_ ->
  unit ->
  import_failure_list_item

val make_list_import_failures_response :
  ?next_token:pagination_token ->
  ?failures:import_failure_list ->
  unit ->
  list_import_failures_response

val make_list_import_failures_request :
  ?next_token:pagination_token ->
  ?max_results:list_import_failures_max_results_count ->
  import_id:uui_d ->
  unit ->
  list_import_failures_request

val make_event_data_store :
  ?updated_timestamp:date ->
  ?created_timestamp:date ->
  ?retention_period:retention_period ->
  ?organization_enabled:boolean_ ->
  ?multi_region_enabled:boolean_ ->
  ?advanced_event_selectors:advanced_event_selectors ->
  ?status:event_data_store_status ->
  ?termination_protection_enabled:termination_protection_enabled ->
  ?name:event_data_store_name ->
  ?event_data_store_arn:event_data_store_arn ->
  unit ->
  event_data_store

val make_list_event_data_stores_response :
  ?next_token:pagination_token ->
  ?event_data_stores:event_data_stores ->
  unit ->
  list_event_data_stores_response

val make_list_event_data_stores_request :
  ?max_results:list_event_data_stores_max_results_count ->
  ?next_token:pagination_token ->
  unit ->
  list_event_data_stores_request

val make_dashboard_detail :
  ?type_:dashboard_type -> ?dashboard_arn:dashboard_arn -> unit -> dashboard_detail

val make_list_dashboards_response :
  ?next_token:pagination_token -> ?dashboards:dashboards -> unit -> list_dashboards_response

val make_list_dashboards_request :
  ?max_results:list_dashboards_max_results_count ->
  ?next_token:pagination_token ->
  ?type_:dashboard_type ->
  ?name_prefix:dashboard_name ->
  unit ->
  list_dashboards_request

val make_channel : ?name:channel_name -> ?channel_arn:channel_arn -> unit -> channel

val make_list_channels_response :
  ?next_token:pagination_token -> ?channels:channels -> unit -> list_channels_response

val make_list_channels_request :
  ?next_token:pagination_token ->
  ?max_results:list_channels_max_results_count ->
  unit ->
  list_channels_request

val make_ingestion_status :
  ?latest_ingestion_attempt_event_i_d:uui_d ->
  ?latest_ingestion_attempt_time:date ->
  ?latest_ingestion_error_code:error_message ->
  ?latest_ingestion_success_event_i_d:uui_d ->
  ?latest_ingestion_success_time:date ->
  unit ->
  ingestion_status

val make_get_trail_status_response :
  ?time_logging_stopped:string_ ->
  ?time_logging_started:string_ ->
  ?latest_delivery_attempt_succeeded:string_ ->
  ?latest_notification_attempt_succeeded:string_ ->
  ?latest_notification_attempt_time:string_ ->
  ?latest_delivery_attempt_time:string_ ->
  ?latest_digest_delivery_error:string_ ->
  ?latest_digest_delivery_time:date ->
  ?latest_cloud_watch_logs_delivery_time:date ->
  ?latest_cloud_watch_logs_delivery_error:string_ ->
  ?stop_logging_time:date ->
  ?start_logging_time:date ->
  ?latest_notification_time:date ->
  ?latest_delivery_time:date ->
  ?latest_notification_error:string_ ->
  ?latest_delivery_error:string_ ->
  ?is_logging:boolean_ ->
  unit ->
  get_trail_status_response

val make_get_trail_status_request : name:string_ -> unit -> get_trail_status_request
val make_get_trail_response : ?trail:trail -> unit -> get_trail_response
val make_get_trail_request : name:string_ -> unit -> get_trail_request

val make_get_resource_policy_response :
  ?delegated_admin_resource_policy:resource_policy ->
  ?resource_policy:resource_policy ->
  ?resource_arn:resource_arn ->
  unit ->
  get_resource_policy_response

val make_get_resource_policy_request :
  resource_arn:resource_arn -> unit -> get_resource_policy_request

val make_get_query_results_response :
  ?error_message:error_message ->
  ?next_token:pagination_token ->
  ?query_result_rows:query_result_rows ->
  ?query_statistics:query_statistics ->
  ?query_status:query_status ->
  unit ->
  get_query_results_response

val make_get_query_results_request :
  ?event_data_store_owner_account_id:account_id ->
  ?max_query_results:max_query_results ->
  ?next_token:pagination_token ->
  ?event_data_store:event_data_store_arn ->
  query_id:uui_d ->
  unit ->
  get_query_results_request

val make_get_insight_selectors_response :
  ?insights_destination:event_data_store_arn ->
  ?event_data_store_arn:event_data_store_arn ->
  ?insight_selectors:insight_selectors ->
  ?trail_ar_n:string_ ->
  unit ->
  get_insight_selectors_response

val make_get_insight_selectors_request :
  ?event_data_store:event_data_store_arn ->
  ?trail_name:string_ ->
  unit ->
  get_insight_selectors_request

val make_get_import_response :
  ?import_statistics:import_statistics ->
  ?updated_timestamp:date ->
  ?created_timestamp:date ->
  ?import_status:import_status ->
  ?end_event_time:date ->
  ?start_event_time:date ->
  ?import_source:import_source ->
  ?destinations:import_destinations ->
  ?import_id:uui_d ->
  unit ->
  get_import_response

val make_get_import_request : import_id:uui_d -> unit -> get_import_request

val make_get_event_selectors_response :
  ?advanced_event_selectors:advanced_event_selectors ->
  ?event_selectors:event_selectors ->
  ?trail_ar_n:string_ ->
  unit ->
  get_event_selectors_response

val make_get_event_selectors_request : trail_name:string_ -> unit -> get_event_selectors_request

val make_get_event_data_store_response :
  ?partition_keys:partition_key_list ->
  ?federation_role_arn:federation_role_arn ->
  ?federation_status:federation_status ->
  ?billing_mode:billing_mode ->
  ?kms_key_id:event_data_store_kms_key_id ->
  ?updated_timestamp:date ->
  ?created_timestamp:date ->
  ?termination_protection_enabled:termination_protection_enabled ->
  ?retention_period:retention_period ->
  ?organization_enabled:boolean_ ->
  ?multi_region_enabled:boolean_ ->
  ?advanced_event_selectors:advanced_event_selectors ->
  ?status:event_data_store_status ->
  ?name:event_data_store_name ->
  ?event_data_store_arn:event_data_store_arn ->
  unit ->
  get_event_data_store_response

val make_get_event_data_store_request :
  event_data_store:event_data_store_arn -> unit -> get_event_data_store_request

val make_get_event_configuration_response :
  ?context_key_selectors:context_key_selectors ->
  ?max_event_size:max_event_size ->
  ?event_data_store_arn:event_data_store_arn ->
  unit ->
  get_event_configuration_response

val make_get_event_configuration_request :
  ?event_data_store:string_ -> unit -> get_event_configuration_request

val make_get_dashboard_response :
  ?termination_protection_enabled:termination_protection_enabled ->
  ?last_refresh_failure_reason:error_message ->
  ?last_refresh_id:refresh_id ->
  ?updated_timestamp:date ->
  ?created_timestamp:date ->
  ?refresh_schedule:refresh_schedule ->
  ?widgets:widget_list ->
  ?status:dashboard_status ->
  ?type_:dashboard_type ->
  ?dashboard_arn:dashboard_arn ->
  unit ->
  get_dashboard_response

val make_get_dashboard_request : dashboard_id:dashboard_arn -> unit -> get_dashboard_request

val make_get_channel_response :
  ?ingestion_status:ingestion_status ->
  ?destinations:destinations ->
  ?source_config:source_config ->
  ?source:source ->
  ?name:channel_name ->
  ?channel_arn:channel_arn ->
  unit ->
  get_channel_response

val make_get_channel_request : channel:channel_arn -> unit -> get_channel_request

val make_generate_query_response :
  ?event_data_store_owner_account_id:account_id ->
  ?query_alias:query_alias ->
  ?query_statement:query_statement ->
  unit ->
  generate_query_response

val make_generate_query_request :
  prompt:prompt -> event_data_stores:event_data_store_list -> unit -> generate_query_request

val make_enable_federation_response :
  ?federation_role_arn:federation_role_arn ->
  ?federation_status:federation_status ->
  ?event_data_store_arn:event_data_store_arn ->
  unit ->
  enable_federation_response

val make_enable_federation_request :
  federation_role_arn:federation_role_arn ->
  event_data_store:event_data_store_arn ->
  unit ->
  enable_federation_request

val make_disable_federation_response :
  ?federation_status:federation_status ->
  ?event_data_store_arn:event_data_store_arn ->
  unit ->
  disable_federation_response

val make_disable_federation_request :
  event_data_store:event_data_store_arn -> unit -> disable_federation_request

val make_describe_trails_response : ?trail_list:trail_list -> unit -> describe_trails_response

val make_describe_trails_request :
  ?include_shadow_trails:boolean_ ->
  ?trail_name_list:trail_name_list ->
  unit ->
  describe_trails_request

val make_describe_query_response :
  ?event_data_store_owner_account_id:account_id ->
  ?prompt:prompt ->
  ?delivery_status:delivery_status ->
  ?delivery_s3_uri:delivery_s3_uri ->
  ?error_message:error_message ->
  ?query_statistics:query_statistics_for_describe_query ->
  ?query_status:query_status ->
  ?query_string:query_statement ->
  ?query_id:uui_d ->
  unit ->
  describe_query_response

val make_describe_query_request :
  ?event_data_store_owner_account_id:account_id ->
  ?refresh_id:refresh_id ->
  ?query_alias:query_alias ->
  ?query_id:uui_d ->
  ?event_data_store:event_data_store_arn ->
  unit ->
  describe_query_request

val make_deregister_organization_delegated_admin_response : unit -> unit

val make_deregister_organization_delegated_admin_request :
  delegated_admin_account_id:account_id -> unit -> deregister_organization_delegated_admin_request

val make_delete_trail_response : unit -> unit
val make_delete_trail_request : name:string_ -> unit -> delete_trail_request
val make_delete_resource_policy_response : unit -> unit

val make_delete_resource_policy_request :
  resource_arn:resource_arn -> unit -> delete_resource_policy_request

val make_delete_event_data_store_response : unit -> unit

val make_delete_event_data_store_request :
  event_data_store:event_data_store_arn -> unit -> delete_event_data_store_request

val make_delete_dashboard_response : unit -> unit
val make_delete_dashboard_request : dashboard_id:dashboard_arn -> unit -> delete_dashboard_request
val make_delete_channel_response : unit -> unit
val make_delete_channel_request : channel:channel_arn -> unit -> delete_channel_request

val make_create_trail_response :
  ?is_organization_trail:boolean_ ->
  ?kms_key_id:string_ ->
  ?cloud_watch_logs_role_arn:string_ ->
  ?cloud_watch_logs_log_group_arn:string_ ->
  ?log_file_validation_enabled:boolean_ ->
  ?trail_ar_n:string_ ->
  ?is_multi_region_trail:boolean_ ->
  ?include_global_service_events:boolean_ ->
  ?sns_topic_ar_n:string_ ->
  ?sns_topic_name:string_ ->
  ?s3_key_prefix:string_ ->
  ?s3_bucket_name:string_ ->
  ?name:string_ ->
  unit ->
  create_trail_response

val make_create_trail_request :
  ?tags_list:tags_list ->
  ?is_organization_trail:boolean_ ->
  ?kms_key_id:string_ ->
  ?cloud_watch_logs_role_arn:string_ ->
  ?cloud_watch_logs_log_group_arn:string_ ->
  ?enable_log_file_validation:boolean_ ->
  ?is_multi_region_trail:boolean_ ->
  ?include_global_service_events:boolean_ ->
  ?sns_topic_name:string_ ->
  ?s3_key_prefix:string_ ->
  s3_bucket_name:string_ ->
  name:string_ ->
  unit ->
  create_trail_request

val make_create_event_data_store_response :
  ?billing_mode:billing_mode ->
  ?kms_key_id:event_data_store_kms_key_id ->
  ?updated_timestamp:date ->
  ?created_timestamp:date ->
  ?tags_list:tags_list ->
  ?termination_protection_enabled:termination_protection_enabled ->
  ?retention_period:retention_period ->
  ?organization_enabled:boolean_ ->
  ?multi_region_enabled:boolean_ ->
  ?advanced_event_selectors:advanced_event_selectors ->
  ?status:event_data_store_status ->
  ?name:event_data_store_name ->
  ?event_data_store_arn:event_data_store_arn ->
  unit ->
  create_event_data_store_response

val make_create_event_data_store_request :
  ?billing_mode:billing_mode ->
  ?start_ingestion:boolean_ ->
  ?kms_key_id:event_data_store_kms_key_id ->
  ?tags_list:tags_list ->
  ?termination_protection_enabled:termination_protection_enabled ->
  ?retention_period:retention_period ->
  ?organization_enabled:boolean_ ->
  ?multi_region_enabled:boolean_ ->
  ?advanced_event_selectors:advanced_event_selectors ->
  name:event_data_store_name ->
  unit ->
  create_event_data_store_request

val make_create_dashboard_response :
  ?termination_protection_enabled:termination_protection_enabled ->
  ?refresh_schedule:refresh_schedule ->
  ?tags_list:tags_list ->
  ?widgets:widget_list ->
  ?type_:dashboard_type ->
  ?name:dashboard_name ->
  ?dashboard_arn:dashboard_arn ->
  unit ->
  create_dashboard_response

val make_create_dashboard_request :
  ?widgets:request_widget_list ->
  ?termination_protection_enabled:termination_protection_enabled ->
  ?tags_list:tags_list ->
  ?refresh_schedule:refresh_schedule ->
  name:dashboard_name ->
  unit ->
  create_dashboard_request

val make_create_channel_response :
  ?tags:tags_list ->
  ?destinations:destinations ->
  ?source:source ->
  ?name:channel_name ->
  ?channel_arn:channel_arn ->
  unit ->
  create_channel_response

val make_create_channel_request :
  ?tags:tags_list ->
  destinations:destinations ->
  source:source ->
  name:channel_name ->
  unit ->
  create_channel_request

val make_cancel_query_response :
  ?event_data_store_owner_account_id:account_id ->
  query_status:query_status ->
  query_id:uui_d ->
  unit ->
  cancel_query_response

val make_cancel_query_request :
  ?event_data_store_owner_account_id:account_id ->
  ?event_data_store:event_data_store_arn ->
  query_id:uui_d ->
  unit ->
  cancel_query_request

val make_add_tags_response : unit -> unit
val make_add_tags_request : tags_list:tags_list -> resource_id:string_ -> unit -> add_tags_request
