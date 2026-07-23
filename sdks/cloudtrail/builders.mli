open Types

val make_add_tags_response : unit -> unit
val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag
val make_add_tags_request : resource_id:string_ -> tags_list:tags_list -> unit -> add_tags_request

val make_advanced_field_selector :
  ?equals:operator ->
  ?starts_with:operator ->
  ?ends_with:operator ->
  ?not_equals:operator ->
  ?not_starts_with:operator ->
  ?not_ends_with:operator ->
  field:selector_field ->
  unit ->
  advanced_field_selector

val make_advanced_event_selector :
  ?name:selector_name -> field_selectors:advanced_field_selectors -> unit -> advanced_event_selector

val make_aggregation_configuration :
  templates:templates ->
  event_category:event_category_aggregation ->
  unit ->
  aggregation_configuration

val make_cancel_query_response :
  ?event_data_store_owner_account_id:account_id ->
  query_id:uui_d ->
  query_status:query_status ->
  unit ->
  cancel_query_response

val make_cancel_query_request :
  ?event_data_store:event_data_store_arn ->
  ?event_data_store_owner_account_id:account_id ->
  query_id:uui_d ->
  unit ->
  cancel_query_request

val make_channel : ?channel_arn:channel_arn -> ?name:channel_name -> unit -> channel

val make_update_trail_response :
  ?name:string_ ->
  ?s3_bucket_name:string_ ->
  ?s3_key_prefix:string_ ->
  ?sns_topic_name:string_ ->
  ?sns_topic_ar_n:string_ ->
  ?include_global_service_events:boolean_ ->
  ?is_multi_region_trail:boolean_ ->
  ?trail_ar_n:string_ ->
  ?log_file_validation_enabled:boolean_ ->
  ?cloud_watch_logs_log_group_arn:string_ ->
  ?cloud_watch_logs_role_arn:string_ ->
  ?kms_key_id:string_ ->
  ?is_organization_trail:boolean_ ->
  unit ->
  update_trail_response

val make_update_trail_request :
  ?s3_bucket_name:string_ ->
  ?s3_key_prefix:string_ ->
  ?sns_topic_name:string_ ->
  ?include_global_service_events:boolean_ ->
  ?is_multi_region_trail:boolean_ ->
  ?enable_log_file_validation:boolean_ ->
  ?cloud_watch_logs_log_group_arn:string_ ->
  ?cloud_watch_logs_role_arn:string_ ->
  ?kms_key_id:string_ ->
  ?is_organization_trail:boolean_ ->
  name:string_ ->
  unit ->
  update_trail_request

val make_update_event_data_store_response :
  ?event_data_store_arn:event_data_store_arn ->
  ?name:event_data_store_name ->
  ?status:event_data_store_status ->
  ?advanced_event_selectors:advanced_event_selectors ->
  ?multi_region_enabled:boolean_ ->
  ?organization_enabled:boolean_ ->
  ?retention_period:retention_period ->
  ?termination_protection_enabled:termination_protection_enabled ->
  ?created_timestamp:date ->
  ?updated_timestamp:date ->
  ?kms_key_id:event_data_store_kms_key_id ->
  ?billing_mode:billing_mode ->
  ?federation_status:federation_status ->
  ?federation_role_arn:federation_role_arn ->
  unit ->
  update_event_data_store_response

val make_update_event_data_store_request :
  ?name:event_data_store_name ->
  ?advanced_event_selectors:advanced_event_selectors ->
  ?multi_region_enabled:boolean_ ->
  ?organization_enabled:boolean_ ->
  ?retention_period:retention_period ->
  ?termination_protection_enabled:termination_protection_enabled ->
  ?kms_key_id:event_data_store_kms_key_id ->
  ?billing_mode:billing_mode ->
  event_data_store:event_data_store_arn ->
  unit ->
  update_event_data_store_request

val make_refresh_schedule_frequency :
  ?unit_:refresh_schedule_frequency_unit ->
  ?value:refresh_schedule_frequency_value ->
  unit ->
  refresh_schedule_frequency

val make_refresh_schedule :
  ?frequency:refresh_schedule_frequency ->
  ?status:refresh_schedule_status ->
  ?time_of_day:time_of_day ->
  unit ->
  refresh_schedule

val make_widget :
  ?query_alias:query_alias ->
  ?query_statement:query_statement ->
  ?query_parameters:query_parameters ->
  ?view_properties:view_properties_map ->
  unit ->
  widget

val make_update_dashboard_response :
  ?dashboard_arn:dashboard_arn ->
  ?name:dashboard_name ->
  ?type_:dashboard_type ->
  ?widgets:widget_list ->
  ?refresh_schedule:refresh_schedule ->
  ?termination_protection_enabled:termination_protection_enabled ->
  ?created_timestamp:date ->
  ?updated_timestamp:date ->
  unit ->
  update_dashboard_response

val make_request_widget :
  ?query_parameters:query_parameters ->
  query_statement:query_statement ->
  view_properties:view_properties_map ->
  unit ->
  request_widget

val make_update_dashboard_request :
  ?widgets:request_widget_list ->
  ?refresh_schedule:refresh_schedule ->
  ?termination_protection_enabled:termination_protection_enabled ->
  dashboard_id:dashboard_arn ->
  unit ->
  update_dashboard_request

val make_destination : type_:destination_type -> location:location -> unit -> destination

val make_update_channel_response :
  ?channel_arn:channel_arn ->
  ?name:channel_name ->
  ?source:source ->
  ?destinations:destinations ->
  unit ->
  update_channel_response

val make_update_channel_request :
  ?destinations:destinations ->
  ?name:channel_name ->
  channel:channel_arn ->
  unit ->
  update_channel_request

val make_stop_logging_response : unit -> unit
val make_stop_logging_request : name:string_ -> unit -> stop_logging_request

val make_import_statistics :
  ?prefixes_found:long ->
  ?prefixes_completed:long ->
  ?files_completed:long ->
  ?events_completed:long ->
  ?failed_entries:long ->
  unit ->
  import_statistics

val make_s3_import_source :
  s3_location_uri:string_ ->
  s3_bucket_region:string_ ->
  s3_bucket_access_role_arn:string_ ->
  unit ->
  s3_import_source

val make_import_source : s3:s3_import_source -> unit -> import_source

val make_stop_import_response :
  ?import_id:uui_d ->
  ?import_source:import_source ->
  ?destinations:import_destinations ->
  ?import_status:import_status ->
  ?created_timestamp:date ->
  ?updated_timestamp:date ->
  ?start_event_time:date ->
  ?end_event_time:date ->
  ?import_statistics:import_statistics ->
  unit ->
  stop_import_response

val make_stop_import_request : import_id:uui_d -> unit -> stop_import_request
val make_stop_event_data_store_ingestion_response : unit -> unit

val make_stop_event_data_store_ingestion_request :
  event_data_store:event_data_store_arn -> unit -> stop_event_data_store_ingestion_request

val make_start_query_response :
  ?query_id:uui_d -> ?event_data_store_owner_account_id:account_id -> unit -> start_query_response

val make_start_query_request :
  ?query_statement:query_statement ->
  ?delivery_s3_uri:delivery_s3_uri ->
  ?query_alias:query_alias ->
  ?query_parameters:query_parameters ->
  ?event_data_store_owner_account_id:account_id ->
  unit ->
  start_query_request

val make_start_logging_response : unit -> unit
val make_start_logging_request : name:string_ -> unit -> start_logging_request

val make_start_import_response :
  ?import_id:uui_d ->
  ?destinations:import_destinations ->
  ?import_source:import_source ->
  ?start_event_time:date ->
  ?end_event_time:date ->
  ?import_status:import_status ->
  ?created_timestamp:date ->
  ?updated_timestamp:date ->
  unit ->
  start_import_response

val make_start_import_request :
  ?destinations:import_destinations ->
  ?import_source:import_source ->
  ?start_event_time:date ->
  ?end_event_time:date ->
  ?import_id:uui_d ->
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

val make_search_sample_queries_response :
  ?search_results:search_sample_queries_search_results ->
  ?next_token:pagination_token ->
  unit ->
  search_sample_queries_response

val make_search_sample_queries_request :
  ?max_results:search_sample_queries_max_results ->
  ?next_token:pagination_token ->
  search_phrase:search_sample_queries_search_phrase ->
  unit ->
  search_sample_queries_request

val make_restore_event_data_store_response :
  ?event_data_store_arn:event_data_store_arn ->
  ?name:event_data_store_name ->
  ?status:event_data_store_status ->
  ?advanced_event_selectors:advanced_event_selectors ->
  ?multi_region_enabled:boolean_ ->
  ?organization_enabled:boolean_ ->
  ?retention_period:retention_period ->
  ?termination_protection_enabled:termination_protection_enabled ->
  ?created_timestamp:date ->
  ?updated_timestamp:date ->
  ?kms_key_id:event_data_store_kms_key_id ->
  ?billing_mode:billing_mode ->
  unit ->
  restore_event_data_store_response

val make_restore_event_data_store_request :
  event_data_store:event_data_store_arn -> unit -> restore_event_data_store_request

val make_remove_tags_response : unit -> unit

val make_remove_tags_request :
  resource_id:string_ -> tags_list:tags_list -> unit -> remove_tags_request

val make_register_organization_delegated_admin_response : unit -> unit

val make_register_organization_delegated_admin_request :
  member_account_id:account_id -> unit -> register_organization_delegated_admin_request

val make_put_resource_policy_response :
  ?resource_arn:resource_arn ->
  ?resource_policy:resource_policy ->
  ?delegated_admin_resource_policy:resource_policy ->
  unit ->
  put_resource_policy_response

val make_put_resource_policy_request :
  resource_arn:resource_arn ->
  resource_policy:resource_policy ->
  unit ->
  put_resource_policy_request

val make_insight_selector :
  ?insight_type:insight_type ->
  ?event_categories:source_event_categories ->
  unit ->
  insight_selector

val make_put_insight_selectors_response :
  ?trail_ar_n:string_ ->
  ?insight_selectors:insight_selectors ->
  ?event_data_store_arn:event_data_store_arn ->
  ?insights_destination:event_data_store_arn ->
  unit ->
  put_insight_selectors_response

val make_put_insight_selectors_request :
  ?trail_name:string_ ->
  ?event_data_store:event_data_store_arn ->
  ?insights_destination:event_data_store_arn ->
  insight_selectors:insight_selectors ->
  unit ->
  put_insight_selectors_request

val make_data_resource : ?type_:string_ -> ?values:data_resource_values -> unit -> data_resource

val make_event_selector :
  ?read_write_type:read_write_type ->
  ?include_management_events:boolean_ ->
  ?data_resources:data_resources ->
  ?exclude_management_event_sources:exclude_management_event_sources ->
  unit ->
  event_selector

val make_put_event_selectors_response :
  ?trail_ar_n:string_ ->
  ?event_selectors:event_selectors ->
  ?advanced_event_selectors:advanced_event_selectors ->
  unit ->
  put_event_selectors_response

val make_put_event_selectors_request :
  ?event_selectors:event_selectors ->
  ?advanced_event_selectors:advanced_event_selectors ->
  trail_name:string_ ->
  unit ->
  put_event_selectors_request

val make_context_key_selector :
  type_:type_ -> equals:operator_target_list -> unit -> context_key_selector

val make_put_event_configuration_response :
  ?trail_ar_n:string_ ->
  ?event_data_store_arn:event_data_store_arn ->
  ?max_event_size:max_event_size ->
  ?context_key_selectors:context_key_selectors ->
  ?aggregation_configurations:aggregation_configurations ->
  unit ->
  put_event_configuration_response

val make_put_event_configuration_request :
  ?trail_name:string_ ->
  ?event_data_store:string_ ->
  ?max_event_size:max_event_size ->
  ?context_key_selectors:context_key_selectors ->
  ?aggregation_configurations:aggregation_configurations ->
  unit ->
  put_event_configuration_request

val make_resource : ?resource_type:string_ -> ?resource_name:string_ -> unit -> resource

val make_event :
  ?event_id:string_ ->
  ?event_name:string_ ->
  ?read_only:string_ ->
  ?access_key_id:string_ ->
  ?event_time:date ->
  ?event_source:string_ ->
  ?username:string_ ->
  ?resources:resource_list ->
  ?cloud_trail_event:string_ ->
  unit ->
  event

val make_lookup_events_response :
  ?events:events_list -> ?next_token:next_token -> unit -> lookup_events_response

val make_lookup_attribute :
  attribute_key:lookup_attribute_key ->
  attribute_value:lookup_attribute_value ->
  unit ->
  lookup_attribute

val make_lookup_events_request :
  ?lookup_attributes:lookup_attributes_list ->
  ?start_time:date ->
  ?end_time:date ->
  ?event_category:event_category ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  lookup_events_request

val make_trail_info :
  ?trail_ar_n:string_ -> ?name:string_ -> ?home_region:string_ -> unit -> trail_info

val make_list_trails_response :
  ?trails:trails -> ?next_token:string_ -> unit -> list_trails_response

val make_list_trails_request : ?next_token:string_ -> unit -> list_trails_request
val make_resource_tag : ?resource_id:string_ -> ?tags_list:tags_list -> unit -> resource_tag

val make_list_tags_response :
  ?resource_tag_list:resource_tag_list -> ?next_token:string_ -> unit -> list_tags_response

val make_list_tags_request :
  ?next_token:string_ -> resource_id_list:resource_id_list -> unit -> list_tags_request

val make_query :
  ?query_id:uui_d -> ?query_status:query_status -> ?creation_time:date -> unit -> query

val make_list_queries_response :
  ?queries:queries -> ?next_token:pagination_token -> unit -> list_queries_response

val make_list_queries_request :
  ?next_token:pagination_token ->
  ?max_results:list_queries_max_results_count ->
  ?start_time:date ->
  ?end_time:date ->
  ?query_status:query_status ->
  event_data_store:event_data_store_arn ->
  unit ->
  list_queries_request

val make_public_key :
  ?value:byte_buffer ->
  ?validity_start_time:date ->
  ?validity_end_time:date ->
  ?fingerprint:string_ ->
  unit ->
  public_key

val make_list_public_keys_response :
  ?public_key_list:public_key_list -> ?next_token:string_ -> unit -> list_public_keys_response

val make_list_public_keys_request :
  ?start_time:date -> ?end_time:date -> ?next_token:string_ -> unit -> list_public_keys_request

val make_list_insights_metric_data_response :
  ?trail_ar_n:string_ ->
  ?event_source:event_source ->
  ?event_name:event_name ->
  ?insight_type:insight_type ->
  ?error_code:error_code ->
  ?timestamps:timestamps ->
  ?values:insights_metric_values ->
  ?next_token:insights_metric_next_token ->
  unit ->
  list_insights_metric_data_response

val make_list_insights_metric_data_request :
  ?trail_name:string_ ->
  ?error_code:error_code ->
  ?start_time:date ->
  ?end_time:date ->
  ?period:insights_metric_period ->
  ?data_type:insights_metric_data_type ->
  ?max_results:insights_metric_max_results ->
  ?next_token:insights_metric_next_token ->
  event_source:event_source ->
  event_name:event_name ->
  insight_type:insight_type ->
  unit ->
  list_insights_metric_data_request

val make_list_insights_data_response :
  ?events:events_list -> ?next_token:pagination_token -> unit -> list_insights_data_response

val make_list_insights_data_request :
  ?dimensions:list_insights_data_dimensions ->
  ?start_time:date ->
  ?end_time:date ->
  ?max_results:list_insights_data_max_results_count ->
  ?next_token:pagination_token ->
  insight_source:resource_arn ->
  data_type:list_insights_data_type ->
  unit ->
  list_insights_data_request

val make_imports_list_item :
  ?import_id:uui_d ->
  ?import_status:import_status ->
  ?destinations:import_destinations ->
  ?created_timestamp:date ->
  ?updated_timestamp:date ->
  unit ->
  imports_list_item

val make_list_imports_response :
  ?imports:imports_list -> ?next_token:pagination_token -> unit -> list_imports_response

val make_list_imports_request :
  ?max_results:list_imports_max_results_count ->
  ?destination:event_data_store_arn ->
  ?import_status:import_status ->
  ?next_token:pagination_token ->
  unit ->
  list_imports_request

val make_import_failure_list_item :
  ?location:string_ ->
  ?status:import_failure_status ->
  ?error_type:string_ ->
  ?error_message:string_ ->
  ?last_updated_time:date ->
  unit ->
  import_failure_list_item

val make_list_import_failures_response :
  ?failures:import_failure_list ->
  ?next_token:pagination_token ->
  unit ->
  list_import_failures_response

val make_list_import_failures_request :
  ?max_results:list_import_failures_max_results_count ->
  ?next_token:pagination_token ->
  import_id:uui_d ->
  unit ->
  list_import_failures_request

val make_event_data_store :
  ?event_data_store_arn:event_data_store_arn ->
  ?name:event_data_store_name ->
  ?termination_protection_enabled:termination_protection_enabled ->
  ?status:event_data_store_status ->
  ?advanced_event_selectors:advanced_event_selectors ->
  ?multi_region_enabled:boolean_ ->
  ?organization_enabled:boolean_ ->
  ?retention_period:retention_period ->
  ?created_timestamp:date ->
  ?updated_timestamp:date ->
  unit ->
  event_data_store

val make_list_event_data_stores_response :
  ?event_data_stores:event_data_stores ->
  ?next_token:pagination_token ->
  unit ->
  list_event_data_stores_response

val make_list_event_data_stores_request :
  ?next_token:pagination_token ->
  ?max_results:list_event_data_stores_max_results_count ->
  unit ->
  list_event_data_stores_request

val make_dashboard_detail :
  ?dashboard_arn:dashboard_arn -> ?type_:dashboard_type -> unit -> dashboard_detail

val make_list_dashboards_response :
  ?dashboards:dashboards -> ?next_token:pagination_token -> unit -> list_dashboards_response

val make_list_dashboards_request :
  ?name_prefix:dashboard_name ->
  ?type_:dashboard_type ->
  ?next_token:pagination_token ->
  ?max_results:list_dashboards_max_results_count ->
  unit ->
  list_dashboards_request

val make_list_channels_response :
  ?channels:channels -> ?next_token:pagination_token -> unit -> list_channels_response

val make_list_channels_request :
  ?max_results:list_channels_max_results_count ->
  ?next_token:pagination_token ->
  unit ->
  list_channels_request

val make_get_trail_status_response :
  ?is_logging:boolean_ ->
  ?latest_delivery_error:string_ ->
  ?latest_notification_error:string_ ->
  ?latest_delivery_time:date ->
  ?latest_notification_time:date ->
  ?start_logging_time:date ->
  ?stop_logging_time:date ->
  ?latest_cloud_watch_logs_delivery_error:string_ ->
  ?latest_cloud_watch_logs_delivery_time:date ->
  ?latest_digest_delivery_time:date ->
  ?latest_digest_delivery_error:string_ ->
  ?latest_delivery_attempt_time:string_ ->
  ?latest_notification_attempt_time:string_ ->
  ?latest_notification_attempt_succeeded:string_ ->
  ?latest_delivery_attempt_succeeded:string_ ->
  ?time_logging_started:string_ ->
  ?time_logging_stopped:string_ ->
  unit ->
  get_trail_status_response

val make_get_trail_status_request : name:string_ -> unit -> get_trail_status_request

val make_trail :
  ?name:string_ ->
  ?s3_bucket_name:string_ ->
  ?s3_key_prefix:string_ ->
  ?sns_topic_name:string_ ->
  ?sns_topic_ar_n:string_ ->
  ?include_global_service_events:boolean_ ->
  ?is_multi_region_trail:boolean_ ->
  ?home_region:string_ ->
  ?trail_ar_n:string_ ->
  ?log_file_validation_enabled:boolean_ ->
  ?cloud_watch_logs_log_group_arn:string_ ->
  ?cloud_watch_logs_role_arn:string_ ->
  ?kms_key_id:string_ ->
  ?has_custom_event_selectors:boolean_ ->
  ?has_insight_selectors:boolean_ ->
  ?is_organization_trail:boolean_ ->
  unit ->
  trail

val make_get_trail_response : ?trail:trail -> unit -> get_trail_response
val make_get_trail_request : name:string_ -> unit -> get_trail_request

val make_get_resource_policy_response :
  ?resource_arn:resource_arn ->
  ?resource_policy:resource_policy ->
  ?delegated_admin_resource_policy:resource_policy ->
  unit ->
  get_resource_policy_response

val make_get_resource_policy_request :
  resource_arn:resource_arn -> unit -> get_resource_policy_request

val make_query_statistics :
  ?results_count:integer ->
  ?total_results_count:integer ->
  ?bytes_scanned:long ->
  unit ->
  query_statistics

val make_get_query_results_response :
  ?query_status:query_status ->
  ?query_statistics:query_statistics ->
  ?query_result_rows:query_result_rows ->
  ?next_token:pagination_token ->
  ?error_message:error_message ->
  unit ->
  get_query_results_response

val make_get_query_results_request :
  ?event_data_store:event_data_store_arn ->
  ?next_token:pagination_token ->
  ?max_query_results:max_query_results ->
  ?event_data_store_owner_account_id:account_id ->
  query_id:uui_d ->
  unit ->
  get_query_results_request

val make_get_insight_selectors_response :
  ?trail_ar_n:string_ ->
  ?insight_selectors:insight_selectors ->
  ?event_data_store_arn:event_data_store_arn ->
  ?insights_destination:event_data_store_arn ->
  unit ->
  get_insight_selectors_response

val make_get_insight_selectors_request :
  ?trail_name:string_ ->
  ?event_data_store:event_data_store_arn ->
  unit ->
  get_insight_selectors_request

val make_get_import_response :
  ?import_id:uui_d ->
  ?destinations:import_destinations ->
  ?import_source:import_source ->
  ?start_event_time:date ->
  ?end_event_time:date ->
  ?import_status:import_status ->
  ?created_timestamp:date ->
  ?updated_timestamp:date ->
  ?import_statistics:import_statistics ->
  unit ->
  get_import_response

val make_get_import_request : import_id:uui_d -> unit -> get_import_request

val make_get_event_selectors_response :
  ?trail_ar_n:string_ ->
  ?event_selectors:event_selectors ->
  ?advanced_event_selectors:advanced_event_selectors ->
  unit ->
  get_event_selectors_response

val make_get_event_selectors_request : trail_name:string_ -> unit -> get_event_selectors_request

val make_partition_key :
  name:partition_key_name -> type_:partition_key_type -> unit -> partition_key

val make_get_event_data_store_response :
  ?event_data_store_arn:event_data_store_arn ->
  ?name:event_data_store_name ->
  ?status:event_data_store_status ->
  ?advanced_event_selectors:advanced_event_selectors ->
  ?multi_region_enabled:boolean_ ->
  ?organization_enabled:boolean_ ->
  ?retention_period:retention_period ->
  ?termination_protection_enabled:termination_protection_enabled ->
  ?created_timestamp:date ->
  ?updated_timestamp:date ->
  ?kms_key_id:event_data_store_kms_key_id ->
  ?billing_mode:billing_mode ->
  ?federation_status:federation_status ->
  ?federation_role_arn:federation_role_arn ->
  ?partition_keys:partition_key_list ->
  unit ->
  get_event_data_store_response

val make_get_event_data_store_request :
  event_data_store:event_data_store_arn -> unit -> get_event_data_store_request

val make_get_event_configuration_response :
  ?trail_ar_n:string_ ->
  ?event_data_store_arn:event_data_store_arn ->
  ?max_event_size:max_event_size ->
  ?context_key_selectors:context_key_selectors ->
  ?aggregation_configurations:aggregation_configurations ->
  unit ->
  get_event_configuration_response

val make_get_event_configuration_request :
  ?trail_name:string_ -> ?event_data_store:string_ -> unit -> get_event_configuration_request

val make_get_dashboard_response :
  ?dashboard_arn:dashboard_arn ->
  ?type_:dashboard_type ->
  ?status:dashboard_status ->
  ?widgets:widget_list ->
  ?refresh_schedule:refresh_schedule ->
  ?created_timestamp:date ->
  ?updated_timestamp:date ->
  ?last_refresh_id:refresh_id ->
  ?last_refresh_failure_reason:error_message ->
  ?termination_protection_enabled:termination_protection_enabled ->
  unit ->
  get_dashboard_response

val make_get_dashboard_request : dashboard_id:dashboard_arn -> unit -> get_dashboard_request

val make_ingestion_status :
  ?latest_ingestion_success_time:date ->
  ?latest_ingestion_success_event_i_d:uui_d ->
  ?latest_ingestion_error_code:error_message ->
  ?latest_ingestion_attempt_time:date ->
  ?latest_ingestion_attempt_event_i_d:uui_d ->
  unit ->
  ingestion_status

val make_source_config :
  ?apply_to_all_regions:boolean_ ->
  ?advanced_event_selectors:advanced_event_selectors ->
  unit ->
  source_config

val make_get_channel_response :
  ?channel_arn:channel_arn ->
  ?name:channel_name ->
  ?source:source ->
  ?source_config:source_config ->
  ?destinations:destinations ->
  ?ingestion_status:ingestion_status ->
  unit ->
  get_channel_response

val make_get_channel_request : channel:channel_arn -> unit -> get_channel_request

val make_generate_query_response :
  ?query_statement:query_statement ->
  ?query_alias:query_alias ->
  ?event_data_store_owner_account_id:account_id ->
  unit ->
  generate_query_response

val make_generate_query_request :
  event_data_stores:event_data_store_list -> prompt:prompt -> unit -> generate_query_request

val make_enable_federation_response :
  ?event_data_store_arn:event_data_store_arn ->
  ?federation_status:federation_status ->
  ?federation_role_arn:federation_role_arn ->
  unit ->
  enable_federation_response

val make_enable_federation_request :
  event_data_store:event_data_store_arn ->
  federation_role_arn:federation_role_arn ->
  unit ->
  enable_federation_request

val make_disable_federation_response :
  ?event_data_store_arn:event_data_store_arn ->
  ?federation_status:federation_status ->
  unit ->
  disable_federation_response

val make_disable_federation_request :
  event_data_store:event_data_store_arn -> unit -> disable_federation_request

val make_describe_trails_response : ?trail_list:trail_list -> unit -> describe_trails_response

val make_describe_trails_request :
  ?trail_name_list:trail_name_list ->
  ?include_shadow_trails:boolean_ ->
  unit ->
  describe_trails_request

val make_query_statistics_for_describe_query :
  ?events_matched:long ->
  ?events_scanned:long ->
  ?bytes_scanned:long ->
  ?execution_time_in_millis:integer ->
  ?creation_time:date ->
  unit ->
  query_statistics_for_describe_query

val make_describe_query_response :
  ?query_id:uui_d ->
  ?query_string:query_statement ->
  ?query_status:query_status ->
  ?query_statistics:query_statistics_for_describe_query ->
  ?error_message:error_message ->
  ?delivery_s3_uri:delivery_s3_uri ->
  ?delivery_status:delivery_status ->
  ?prompt:prompt ->
  ?event_data_store_owner_account_id:account_id ->
  unit ->
  describe_query_response

val make_describe_query_request :
  ?event_data_store:event_data_store_arn ->
  ?query_id:uui_d ->
  ?query_alias:query_alias ->
  ?refresh_id:refresh_id ->
  ?event_data_store_owner_account_id:account_id ->
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
  ?name:string_ ->
  ?s3_bucket_name:string_ ->
  ?s3_key_prefix:string_ ->
  ?sns_topic_name:string_ ->
  ?sns_topic_ar_n:string_ ->
  ?include_global_service_events:boolean_ ->
  ?is_multi_region_trail:boolean_ ->
  ?trail_ar_n:string_ ->
  ?log_file_validation_enabled:boolean_ ->
  ?cloud_watch_logs_log_group_arn:string_ ->
  ?cloud_watch_logs_role_arn:string_ ->
  ?kms_key_id:string_ ->
  ?is_organization_trail:boolean_ ->
  unit ->
  create_trail_response

val make_create_trail_request :
  ?s3_key_prefix:string_ ->
  ?sns_topic_name:string_ ->
  ?include_global_service_events:boolean_ ->
  ?is_multi_region_trail:boolean_ ->
  ?enable_log_file_validation:boolean_ ->
  ?cloud_watch_logs_log_group_arn:string_ ->
  ?cloud_watch_logs_role_arn:string_ ->
  ?kms_key_id:string_ ->
  ?is_organization_trail:boolean_ ->
  ?tags_list:tags_list ->
  name:string_ ->
  s3_bucket_name:string_ ->
  unit ->
  create_trail_request

val make_create_event_data_store_response :
  ?event_data_store_arn:event_data_store_arn ->
  ?name:event_data_store_name ->
  ?status:event_data_store_status ->
  ?advanced_event_selectors:advanced_event_selectors ->
  ?multi_region_enabled:boolean_ ->
  ?organization_enabled:boolean_ ->
  ?retention_period:retention_period ->
  ?termination_protection_enabled:termination_protection_enabled ->
  ?tags_list:tags_list ->
  ?created_timestamp:date ->
  ?updated_timestamp:date ->
  ?kms_key_id:event_data_store_kms_key_id ->
  ?billing_mode:billing_mode ->
  unit ->
  create_event_data_store_response

val make_create_event_data_store_request :
  ?advanced_event_selectors:advanced_event_selectors ->
  ?multi_region_enabled:boolean_ ->
  ?organization_enabled:boolean_ ->
  ?retention_period:retention_period ->
  ?termination_protection_enabled:termination_protection_enabled ->
  ?tags_list:tags_list ->
  ?kms_key_id:event_data_store_kms_key_id ->
  ?start_ingestion:boolean_ ->
  ?billing_mode:billing_mode ->
  name:event_data_store_name ->
  unit ->
  create_event_data_store_request

val make_create_dashboard_response :
  ?dashboard_arn:dashboard_arn ->
  ?name:dashboard_name ->
  ?type_:dashboard_type ->
  ?widgets:widget_list ->
  ?tags_list:tags_list ->
  ?refresh_schedule:refresh_schedule ->
  ?termination_protection_enabled:termination_protection_enabled ->
  unit ->
  create_dashboard_response

val make_create_dashboard_request :
  ?refresh_schedule:refresh_schedule ->
  ?tags_list:tags_list ->
  ?termination_protection_enabled:termination_protection_enabled ->
  ?widgets:request_widget_list ->
  name:dashboard_name ->
  unit ->
  create_dashboard_request

val make_create_channel_response :
  ?channel_arn:channel_arn ->
  ?name:channel_name ->
  ?source:source ->
  ?destinations:destinations ->
  ?tags:tags_list ->
  unit ->
  create_channel_response

val make_create_channel_request :
  ?tags:tags_list ->
  name:channel_name ->
  source:source ->
  destinations:destinations ->
  unit ->
  create_channel_request
