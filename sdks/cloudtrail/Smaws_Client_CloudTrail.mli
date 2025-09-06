(** CloudTrail client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module AddTags : sig
  val request :
    Smaws_Lib.Context.t ->
    add_tags_request ->
    ( add_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ChannelARNInvalidException of channel_arn_invalid_exception
      | `ChannelNotFoundException of channel_not_found_exception
      | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
      | `ConflictException of conflict_exception
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `InvalidTagParameterException of invalid_tag_parameter_exception
      | `InvalidTrailNameException of invalid_trail_name_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `NotOrganizationMasterAccountException of not_organization_master_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
      | `TagsLimitExceededException of tags_limit_exceeded_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Adds one or more tags to a trail, event data store, dashboard, or channel, up to a limit of 50. \
   Overwrites an existing tag's value when a new value is specified for an existing tag key. Tag \
   key names must be unique; you cannot have two keys with the same name but different values. If \
   you specify a key without a value, the tag will be created with the specified key and a value \
   of null. You can tag a trail or event data store that applies to all Amazon Web Services \
   Regions only from the Region in which the trail or event data store was created (also known as \
   its home Region).\n"]

module CancelQuery : sig
  val request :
    Smaws_Lib.Context.t ->
    cancel_query_request ->
    ( cancel_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `InactiveQueryException of inactive_query_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `QueryIdNotFoundException of query_id_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Cancels a query if the query is not in a terminated state, such as [CANCELLED], [FAILED], \
   [TIMED_OUT], or [FINISHED]. You must specify an ARN value for [EventDataStore]. The ID of the \
   query that you want to cancel is also required. When you run [CancelQuery], the query status \
   might show as [CANCELLED] even if the operation is not yet finished.\n"]

module CreateChannel : sig
  val request :
    Smaws_Lib.Context.t ->
    create_channel_request ->
    ( create_channel_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ChannelAlreadyExistsException of channel_already_exists_exception
      | `ChannelMaxLimitExceededException of channel_max_limit_exceeded_exception
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `InvalidEventDataStoreCategoryException of invalid_event_data_store_category_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSourceException of invalid_source_exception
      | `InvalidTagParameterException of invalid_tag_parameter_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `TagsLimitExceededException of tags_limit_exceeded_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Creates a channel for CloudTrail to ingest events from a partner or external source. After you \
   create a channel, a CloudTrail Lake event data store can log events from the partner or source \
   that you specify.\n"]

module CreateDashboard : sig
  val request :
    Smaws_Lib.Context.t ->
    create_dashboard_request ->
    ( create_dashboard_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
      | `InvalidQueryStatementException of invalid_query_statement_exception
      | `InvalidTagParameterException of invalid_tag_parameter_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  " Creates a custom dashboard or the Highlights dashboard. \n\n\
  \ {ul\n\
  \       {-   {b Custom dashboards} - Custom dashboards allow you to query events in any event \
   data store type. You can add up to 10 widgets to a custom dashboard. You can manually refresh a \
   custom dashboard, or you can set a refresh schedule.\n\
  \           \n\
  \            }\n\
  \       {-   {b Highlights dashboard} - You can create the Highlights dashboard to see a summary \
   of key user activities and API usage across all your event data stores. CloudTrail Lake manages \
   the Highlights dashboard and refreshes the dashboard every 6 hours. To create the Highlights \
   dashboard, you must set and enable a refresh schedule.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    CloudTrail runs queries to populate the dashboard's widgets during a manual or scheduled \
   refresh. CloudTrail must be granted permissions to run the [StartQuery] operation on your \
   behalf. To provide permissions, run the [PutResourcePolicy] operation to attach a \
   resource-based policy to each event data store. For more information, see \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/security_iam_resource-based-policy-examples.html#security_iam_resource-based-policy-examples-eds-dashboard}Example: \
   Allow CloudTrail to run queries to populate a dashboard} in the {i CloudTrail User Guide}. \n\
  \   \n\
  \     To set a refresh schedule, CloudTrail must be granted permissions to run the \
   [StartDashboardRefresh] operation to refresh the dashboard on your behalf. To provide \
   permissions, run the [PutResourcePolicy] operation to attach a resource-based policy to the \
   dashboard. For more information, see \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/security_iam_resource-based-policy-examples.html#security_iam_resource-based-policy-examples-dashboards} \
   Resource-based policy example for a dashboard} in the {i CloudTrail User Guide}. \n\
  \    \n\
  \     For more information about dashboards, see \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/lake-dashboard.html}CloudTrail \
   Lake dashboards} in the {i CloudTrail User Guide}.\n\
  \     "]

module CreateEventDataStore : sig
  val request :
    Smaws_Lib.Context.t ->
    create_event_data_store_request ->
    ( create_event_data_store_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
      | `ConflictException of conflict_exception
      | `EventDataStoreAlreadyExistsException of event_data_store_already_exists_exception
      | `EventDataStoreMaxLimitExceededException of event_data_store_max_limit_exceeded_exception
      | `InsufficientDependencyServiceAccessPermissionException of
        insufficient_dependency_service_access_permission_exception
      | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
      | `InvalidEventSelectorsException of invalid_event_selectors_exception
      | `InvalidKmsKeyIdException of invalid_kms_key_id_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagParameterException of invalid_tag_parameter_exception
      | `KmsException of kms_exception
      | `KmsKeyNotFoundException of kms_key_not_found_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `NotOrganizationMasterAccountException of not_organization_master_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `OrganizationsNotInUseException of organizations_not_in_use_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Creates a new event data store.\n"]

module CreateTrail : sig
  val request :
    Smaws_Lib.Context.t ->
    create_trail_request ->
    ( create_trail_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
      | `CloudTrailInvalidClientTokenIdException of cloud_trail_invalid_client_token_id_exception
      | `CloudWatchLogsDeliveryUnavailableException of
        cloud_watch_logs_delivery_unavailable_exception
      | `ConflictException of conflict_exception
      | `InsufficientDependencyServiceAccessPermissionException of
        insufficient_dependency_service_access_permission_exception
      | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
      | `InsufficientS3BucketPolicyException of insufficient_s3_bucket_policy_exception
      | `InsufficientSnsTopicPolicyException of insufficient_sns_topic_policy_exception
      | `InvalidCloudWatchLogsLogGroupArnException of
        invalid_cloud_watch_logs_log_group_arn_exception
      | `InvalidCloudWatchLogsRoleArnException of invalid_cloud_watch_logs_role_arn_exception
      | `InvalidKmsKeyIdException of invalid_kms_key_id_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3BucketNameException of invalid_s3_bucket_name_exception
      | `InvalidS3PrefixException of invalid_s3_prefix_exception
      | `InvalidSnsTopicNameException of invalid_sns_topic_name_exception
      | `InvalidTagParameterException of invalid_tag_parameter_exception
      | `InvalidTrailNameException of invalid_trail_name_exception
      | `KmsException of kms_exception
      | `KmsKeyDisabledException of kms_key_disabled_exception
      | `KmsKeyNotFoundException of kms_key_not_found_exception
      | `MaximumNumberOfTrailsExceededException of maximum_number_of_trails_exceeded_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `NotOrganizationMasterAccountException of not_organization_master_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `OrganizationsNotInUseException of organizations_not_in_use_exception
      | `S3BucketDoesNotExistException of s3_bucket_does_not_exist_exception
      | `TagsLimitExceededException of tags_limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `TrailAlreadyExistsException of trail_already_exists_exception
      | `TrailNotProvidedException of trail_not_provided_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Creates a trail that specifies the settings for delivery of log data to an Amazon S3 bucket. \n"]

module DeleteChannel : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_channel_request ->
    ( delete_channel_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ChannelARNInvalidException of channel_arn_invalid_exception
      | `ChannelNotFoundException of channel_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Deletes a channel.\n"]

module DeleteDashboard : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_dashboard_request ->
    ( delete_dashboard_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  " Deletes the specified dashboard. You cannot delete a dashboard that has termination protection \
   enabled. \n"]

module DeleteEventDataStore : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_event_data_store_request ->
    ( delete_event_data_store_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ChannelExistsForEDSException of channel_exists_for_eds_exception
      | `ConflictException of conflict_exception
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreFederationEnabledException of event_data_store_federation_enabled_exception
      | `EventDataStoreHasOngoingImportException of event_data_store_has_ongoing_import_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `EventDataStoreTerminationProtectedException of
        event_data_store_termination_protected_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `InsufficientDependencyServiceAccessPermissionException of
        insufficient_dependency_service_access_permission_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `NotOrganizationMasterAccountException of not_organization_master_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Disables the event data store specified by [EventDataStore], which accepts an event data store \
   ARN. After you run [DeleteEventDataStore], the event data store enters a [PENDING_DELETION] \
   state, and is automatically deleted after a wait period of seven days. \
   [TerminationProtectionEnabled] must be set to [False] on the event data store and the \
   [FederationStatus] must be [DISABLED]. You cannot delete an event data store if \
   [TerminationProtectionEnabled] is [True] or the [FederationStatus] is [ENABLED].\n\n\
  \ After you run [DeleteEventDataStore] on an event data store, you cannot run [ListQueries], \
   [DescribeQuery], or [GetQueryResults] on queries that are using an event data store in a \
   [PENDING_DELETION] state. An event data store in the [PENDING_DELETION] state does not incur \
   costs.\n\
  \ "]

module DeleteResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceARNNotValidException of resource_arn_not_valid_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourcePolicyNotFoundException of resource_policy_not_found_exception
      | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  " Deletes the resource-based policy attached to the CloudTrail event data store, dashboard, or \
   channel. \n"]

module DeleteTrail : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_trail_request ->
    ( delete_trail_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
      | `ConflictException of conflict_exception
      | `InsufficientDependencyServiceAccessPermissionException of
        insufficient_dependency_service_access_permission_exception
      | `InvalidHomeRegionException of invalid_home_region_exception
      | `InvalidTrailNameException of invalid_trail_name_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `NotOrganizationMasterAccountException of not_organization_master_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ThrottlingException of throttling_exception
      | `TrailNotFoundException of trail_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Deletes a trail. This operation must be called from the Region in which the trail was created. \
   [DeleteTrail] cannot be called on the shadow trails (replicated trails in other Regions) of a \
   trail that is enabled in all Regions.\n"]

module DeregisterOrganizationDelegatedAdmin : sig
  val request :
    Smaws_Lib.Context.t ->
    deregister_organization_delegated_admin_request ->
    ( deregister_organization_delegated_admin_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccountNotFoundException of account_not_found_exception
      | `AccountNotRegisteredException of account_not_registered_exception
      | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
      | `ConflictException of conflict_exception
      | `InsufficientDependencyServiceAccessPermissionException of
        insufficient_dependency_service_access_permission_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotOrganizationManagementAccountException of not_organization_management_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `OrganizationsNotInUseException of organizations_not_in_use_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Removes CloudTrail delegated administrator permissions from a member account in an organization.\n"]

module DescribeQuery : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_query_request ->
    ( describe_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `QueryIdNotFoundException of query_id_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Returns metadata about a query, including query run time in milliseconds, number of events \
   scanned and matched, and query status. If the query results were delivered to an S3 bucket, the \
   response also provides the S3 URI and the delivery status.\n\n\
  \ You must specify either [QueryId] or [QueryAlias]. Specifying the [QueryAlias] parameter \
   returns information about the last query run for the alias. You can provide [RefreshId] along \
   with [QueryAlias] to view the query results of a dashboard query for the specified [RefreshId].\n\
  \ "]

module DescribeTrails : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_trails_request ->
    ( describe_trails_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
      | `InvalidTrailNameException of invalid_trail_name_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Retrieves settings for one or more trails associated with the current Region for your account.\n"]

module DisableFederation : sig
  val request :
    Smaws_Lib.Context.t ->
    disable_federation_request ->
    ( disable_federation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `InsufficientDependencyServiceAccessPermissionException of
        insufficient_dependency_service_access_permission_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `NotOrganizationMasterAccountException of not_organization_master_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `OrganizationsNotInUseException of organizations_not_in_use_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  " Disables Lake query federation on the specified event data store. When you disable federation, \
   CloudTrail disables the integration with Glue, Lake Formation, and Amazon Athena. After \
   disabling Lake query federation, you can no longer query your event data in Amazon Athena.\n\n\
  \ No CloudTrail Lake data is deleted when you disable federation and you can continue to run \
   queries in CloudTrail Lake.\n\
  \ "]

module EnableFederation : sig
  val request :
    Smaws_Lib.Context.t ->
    enable_federation_request ->
    ( enable_federation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreFederationEnabledException of event_data_store_federation_enabled_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `InsufficientDependencyServiceAccessPermissionException of
        insufficient_dependency_service_access_permission_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `NotOrganizationMasterAccountException of not_organization_master_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `OrganizationsNotInUseException of organizations_not_in_use_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  " Enables Lake query federation on the specified event data store. Federating an event data \
   store lets you view the metadata associated with the event data store in the Glue \
   {{:https://docs.aws.amazon.com/glue/latest/dg/components-overview.html#data-catalog-intro}Data \
   Catalog} and run SQL queries against your event data using Amazon Athena. The table metadata \
   stored in the Glue Data Catalog lets the Athena query engine know how to find, read, and \
   process the data that you want to query.\n\n\
  \ When you enable Lake query federation, CloudTrail creates a managed database named \
   [aws:cloudtrail] (if the database doesn't already exist) and a managed federated table in the \
   Glue Data Catalog. The event data store ID is used for the table name. CloudTrail registers the \
   role ARN and event data store in \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-federation-lake-formation.html}Lake \
   Formation}, the service responsible for allowing fine-grained access control of the federated \
   resources in the Glue Data Catalog.\n\
  \ \n\
  \  For more information about Lake query federation, see \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-federation.html}Federate an \
   event data store}.\n\
  \  "]

module GenerateQuery : sig
  val request :
    Smaws_Lib.Context.t ->
    generate_query_request ->
    ( generate_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `GenerateResponseException of generate_response_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  " Generates a query from a natural language prompt. This operation uses generative artificial \
   intelligence (generative AI) to produce a ready-to-use SQL query from the prompt. \n\n\
  \ The prompt can be a question or a statement about the event data in your event data store. For \
   example, you can enter prompts like \"What are my top errors in the past month?\" and \
   \226\128\156Give me a list of users that used SNS.\226\128\157\n\
  \ \n\
  \  The prompt must be in English. For information about limitations, permissions, and supported \
   Regions, see \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/lake-query-generator.html}Create \
   CloudTrail Lake queries from natural language prompts} in the {i CloudTrail } user guide.\n\
  \  \n\
  \    Do not include any personally identifying, confidential, or sensitive information in your \
   prompts.\n\
  \    \n\
  \     This feature uses generative AI large language models (LLMs); we recommend double-checking \
   the LLM response.\n\
  \     \n\
  \      "]

module GetChannel : sig
  val request :
    Smaws_Lib.Context.t ->
    get_channel_request ->
    ( get_channel_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ChannelARNInvalidException of channel_arn_invalid_exception
      | `ChannelNotFoundException of channel_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc " Returns information about a specific channel. \n"]

module GetDashboard : sig
  val request :
    Smaws_Lib.Context.t ->
    get_dashboard_request ->
    ( get_dashboard_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc " Returns the specified dashboard. \n"]

module GetEventConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
    get_event_configuration_request ->
    ( get_event_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InvalidEventDataStoreCategoryException of invalid_event_data_store_category_exception
      | `InvalidEventDataStoreStatusException of invalid_event_data_store_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Retrieves the current event configuration settings for the specified event data store, \
   including details about maximum event size and context key selectors configured for the event \
   data store.\n"]

module GetEventDataStore : sig
  val request :
    Smaws_Lib.Context.t ->
    get_event_data_store_request ->
    ( get_event_data_store_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Returns information about an event data store specified as either an ARN or the ID portion of \
   the ARN.\n"]

module GetEventSelectors : sig
  val request :
    Smaws_Lib.Context.t ->
    get_event_selectors_request ->
    ( get_event_selectors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
      | `InvalidTrailNameException of invalid_trail_name_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `TrailNotFoundException of trail_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Describes the settings for the event selectors that you configured for your trail. The \
   information returned for your event selectors includes the following:\n\n\
  \ {ul\n\
  \       {-  If your event selector includes read-only events, write-only events, or all events. \
   This applies to management events, data events, and network activity events.\n\
  \           \n\
  \            }\n\
  \       {-  If your event selector includes management events.\n\
  \           \n\
  \            }\n\
  \       {-  If your event selector includes network activity events, the event sources for which \
   you are logging network activity events.\n\
  \           \n\
  \            }\n\
  \       {-  If your event selector includes data events, the resources on which you are logging \
   data events.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   For more information about logging management, data, and network activity events, see the \
   following topics in the {i CloudTrail User Guide}:\n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html}Logging \
   management events} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html}Logging \
   data events} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-network-events-with-cloudtrail.html}Logging \
   network activity events} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module GetImport : sig
  val request :
    Smaws_Lib.Context.t ->
    get_import_request ->
    ( get_import_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImportNotFoundException of import_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc " Returns information about a specific import. \n"]

module GetInsightSelectors : sig
  val request :
    Smaws_Lib.Context.t ->
    get_insight_selectors_request ->
    ( get_insight_selectors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
      | `InsightNotEnabledException of insight_not_enabled_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTrailNameException of invalid_trail_name_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ThrottlingException of throttling_exception
      | `TrailNotFoundException of trail_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Describes the settings for the Insights event selectors that you configured for your trail or \
   event data store. [GetInsightSelectors] shows if CloudTrail Insights event logging is enabled \
   on the trail or event data store, and if it is, which Insights types are enabled. If you run \
   [GetInsightSelectors] on a trail or event data store that does not have Insights events \
   enabled, the operation throws the exception [InsightNotEnabledException] \n\n\
  \ Specify either the [EventDataStore] parameter to get Insights event selectors for an event \
   data store, or the [TrailName] parameter to the get Insights event selectors for a trail. You \
   cannot specify these parameters together.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-insights-events-with-cloudtrail.html}Working \
   with CloudTrail Insights} in the {i CloudTrail User Guide}.\n\
  \  "]

module GetQueryResults : sig
  val request :
    Smaws_Lib.Context.t ->
    get_query_results_request ->
    ( get_query_results_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `QueryIdNotFoundException of query_id_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Gets event data results of a query. You must specify the [QueryID] value returned by the \
   [StartQuery] operation.\n"]

module GetResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
    get_resource_policy_request ->
    ( get_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceARNNotValidException of resource_arn_not_valid_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourcePolicyNotFoundException of resource_policy_not_found_exception
      | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  " Retrieves the JSON text of the resource-based policy document attached to the CloudTrail event \
   data store, dashboard, or channel. \n"]

module GetTrail : sig
  val request :
    Smaws_Lib.Context.t ->
    get_trail_request ->
    ( get_trail_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
      | `InvalidTrailNameException of invalid_trail_name_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `TrailNotFoundException of trail_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Returns settings information for a specified trail.\n"]

module GetTrailStatus : sig
  val request :
    Smaws_Lib.Context.t ->
    get_trail_status_request ->
    ( get_trail_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
      | `InvalidTrailNameException of invalid_trail_name_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `TrailNotFoundException of trail_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Returns a JSON-formatted list of information about the specified trail. Fields include \
   information on delivery errors, Amazon SNS and Amazon S3 errors, and start and stop logging \
   times for each trail. This operation returns trail status from a single Region. To return trail \
   status from all Regions, you must call the operation on each Region.\n"]

module ListChannels : sig
  val request :
    Smaws_Lib.Context.t ->
    list_channels_request ->
    ( list_channels_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc " Lists the channels in the current account, and their source names. \n"]

module ListDashboards : sig
  val request :
    Smaws_Lib.Context.t ->
    list_dashboards_request ->
    ( list_dashboards_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc " Returns information about all dashboards in the account, in the current Region. \n"]

module ListEventDataStores : sig
  val request :
    Smaws_Lib.Context.t ->
    list_event_data_stores_request ->
    ( list_event_data_stores_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Returns information about all event data stores in the account, in the current Region.\n"]

module ListImportFailures : sig
  val request :
    Smaws_Lib.Context.t ->
    list_import_failures_request ->
    ( list_import_failures_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc " Returns a list of failures for the specified import. \n"]

module ListImports : sig
  val request :
    Smaws_Lib.Context.t ->
    list_imports_request ->
    ( list_imports_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  " Returns information on all imports, or a select set of imports by [ImportStatus] or \
   [Destination]. \n"]

module ListInsightsMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
    list_insights_metric_data_request ->
    ( list_insights_metric_data_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Returns Insights metrics data for trails that have enabled Insights. The request must include \
   the [EventSource], [EventName], and [InsightType] parameters.\n\n\
  \ If the [InsightType] is set to [ApiErrorRateInsight], the request must also include the \
   [ErrorCode] parameter.\n\
  \ \n\
  \  The following are the available time periods for [ListInsightsMetricData]. Each cutoff is \
   inclusive.\n\
  \  \n\
  \   {ul\n\
  \         {-  Data points with a period of 60 seconds (1-minute) are available for 15 days.\n\
  \             \n\
  \              }\n\
  \         {-  Data points with a period of 300 seconds (5-minute) are available for 63 days.\n\
  \             \n\
  \              }\n\
  \         {-  Data points with a period of 3600 seconds (1 hour) are available for 90 days.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   Access to the [ListInsightsMetricData] API operation is linked to the \
   [cloudtrail:LookupEvents] action. To use this operation, you must have permissions to perform \
   the [cloudtrail:LookupEvents] action.\n\
  \   "]

module ListPublicKeys : sig
  val request :
    Smaws_Lib.Context.t ->
    list_public_keys_request ->
    ( list_public_keys_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidTimeRangeException of invalid_time_range_exception
      | `InvalidTokenException of invalid_token_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Returns all public keys whose private keys were used to sign the digest files within the \
   specified time range. The public key is needed to validate digest files that were signed with \
   its corresponding private key.\n\n\
  \  CloudTrail uses different private and public key pairs per Region. Each digest file is signed \
   with a private key unique to its Region. When you validate a digest file from a specific \
   Region, you must look in the same Region for its corresponding public key.\n\
  \  \n\
  \   "]

module ListQueries : sig
  val request :
    Smaws_Lib.Context.t ->
    list_queries_request ->
    ( list_queries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `InvalidDateRangeException of invalid_date_range_exception
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidQueryStatusException of invalid_query_status_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Returns a list of queries and query statuses for the past seven days. You must specify an ARN \
   value for [EventDataStore]. Optionally, to shorten the list of results, you can specify a time \
   range, formatted as timestamps, by adding [StartTime] and [EndTime] parameters, and a \
   [QueryStatus] value. Valid values for [QueryStatus] include [QUEUED], [RUNNING], [FINISHED], \
   [FAILED], [TIMED_OUT], or [CANCELLED].\n"]

module ListTags : sig
  val request :
    Smaws_Lib.Context.t ->
    list_tags_request ->
    ( list_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ChannelARNInvalidException of channel_arn_invalid_exception
      | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `InvalidTokenException of invalid_token_exception
      | `InvalidTrailNameException of invalid_trail_name_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Lists the tags for the specified trails, event data stores, dashboards, or channels in the \
   current Region.\n"]

module ListTrails : sig
  val request :
    Smaws_Lib.Context.t ->
    list_trails_request ->
    ( list_trails_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Lists trails that are in the current account.\n"]

module LookupEvents : sig
  val request :
    Smaws_Lib.Context.t ->
    lookup_events_request ->
    ( lookup_events_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidEventCategoryException of invalid_event_category_exception
      | `InvalidLookupAttributesException of invalid_lookup_attributes_exception
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidTimeRangeException of invalid_time_range_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Looks up \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-concepts.html#cloudtrail-concepts-management-events}management \
   events} or \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-concepts.html#cloudtrail-concepts-insights-events}CloudTrail \
   Insights events} that are captured by CloudTrail. You can look up events that occurred in a \
   Region within the last 90 days.\n\n\
  \   [LookupEvents] returns recent Insights events for trails that enable Insights. To view \
   Insights events for an event data store, you can run queries on your Insights event data store, \
   and you can also view the Lake dashboard for Insights.\n\
  \  \n\
  \    Lookup supports the following attributes for management events:\n\
  \    \n\
  \     {ul\n\
  \           {-  Amazon Web Services access key\n\
  \               \n\
  \                }\n\
  \           {-  Event ID\n\
  \               \n\
  \                }\n\
  \           {-  Event name\n\
  \               \n\
  \                }\n\
  \           {-  Event source\n\
  \               \n\
  \                }\n\
  \           {-  Read only\n\
  \               \n\
  \                }\n\
  \           {-  Resource name\n\
  \               \n\
  \                }\n\
  \           {-  Resource type\n\
  \               \n\
  \                }\n\
  \           {-  User name\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   Lookup supports the following attributes for Insights events:\n\
  \   \n\
  \    {ul\n\
  \          {-  Event ID\n\
  \              \n\
  \               }\n\
  \          {-  Event name\n\
  \              \n\
  \               }\n\
  \          {-  Event source\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   All attributes are optional. The default number of results returned is 50, with a maximum of \
   50 possible. The response includes a token that you can use to get the next page of results.\n\
  \   \n\
  \     The rate of lookup requests is limited to two per second, per account, per Region. If this \
   limit is exceeded, a throttling error occurs.\n\
  \     \n\
  \      "]

module PutEventConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
    put_event_configuration_request ->
    ( put_event_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
      | `ConflictException of conflict_exception
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `InsufficientDependencyServiceAccessPermissionException of
        insufficient_dependency_service_access_permission_exception
      | `InsufficientIAMAccessPermissionException of insufficient_iam_access_permission_exception
      | `InvalidEventDataStoreCategoryException of invalid_event_data_store_category_exception
      | `InvalidEventDataStoreStatusException of invalid_event_data_store_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `NotOrganizationMasterAccountException of not_organization_master_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Updates the event configuration settings for the specified event data store. You can update the \
   maximum event size and context key selectors.\n"]

module PutEventSelectors : sig
  val request :
    Smaws_Lib.Context.t ->
    put_event_selectors_request ->
    ( put_event_selectors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
      | `ConflictException of conflict_exception
      | `InsufficientDependencyServiceAccessPermissionException of
        insufficient_dependency_service_access_permission_exception
      | `InvalidEventSelectorsException of invalid_event_selectors_exception
      | `InvalidHomeRegionException of invalid_home_region_exception
      | `InvalidTrailNameException of invalid_trail_name_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `NotOrganizationMasterAccountException of not_organization_master_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ThrottlingException of throttling_exception
      | `TrailNotFoundException of trail_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Configures event selectors (also referred to as {i basic event selectors}) or advanced event \
   selectors for your trail. You can use either [AdvancedEventSelectors] or [EventSelectors], but \
   not both. If you apply [AdvancedEventSelectors] to a trail, any existing [EventSelectors] are \
   overwritten.\n\n\
  \ You can use [AdvancedEventSelectors] to log management events, data events for all resource \
   types, and network activity events.\n\
  \ \n\
  \  You can use [EventSelectors] to log management events and data events for the following \
   resource types:\n\
  \  \n\
  \   {ul\n\
  \         {-   [AWS::DynamoDB::Table] \n\
  \             \n\
  \              }\n\
  \         {-   [AWS::Lambda::Function] \n\
  \             \n\
  \              }\n\
  \         {-   [AWS::S3::Object] \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   You can't use [EventSelectors] to log network activity events.\n\
  \   \n\
  \    If you want your trail to log Insights events, be sure the event selector or advanced event \
   selector enables logging of the Insights event types you want configured for your trail. For \
   more information about logging Insights events, see \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-insights-events-with-cloudtrail.html}Working \
   with CloudTrail Insights} in the {i CloudTrail User Guide}. By default, trails created without \
   specific event selectors are configured to log all read and write management events, and no \
   data events or network activity events.\n\
  \    \n\
  \     When an event occurs in your account, CloudTrail evaluates the event selectors or advanced \
   event selectors in all trails. For each trail, if the event matches any event selector, the \
   trail processes and logs the event. If the event doesn't match any event selector, the trail \
   doesn't log the event.\n\
  \     \n\
  \      Example\n\
  \      \n\
  \       {ol\n\
  \             {-  You create an event selector for a trail and specify that you want to log \
   write-only events.\n\
  \                 \n\
  \                  }\n\
  \             {-  The EC2 [GetConsoleOutput] and [RunInstances] API operations occur in your \
   account.\n\
  \                 \n\
  \                  }\n\
  \             {-  CloudTrail evaluates whether the events match your event selectors.\n\
  \                 \n\
  \                  }\n\
  \             {-  The [RunInstances] is a write-only event and it matches your event selector. \
   The trail logs the event.\n\
  \                 \n\
  \                  }\n\
  \             {-  The [GetConsoleOutput] is a read-only event that doesn't match your event \
   selector. The trail doesn't log the event. \n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \   The [PutEventSelectors] operation must be called from the Region in which the trail was \
   created; otherwise, an [InvalidHomeRegionException] exception is thrown.\n\
  \   \n\
  \    You can configure up to five event selectors for each trail.\n\
  \    \n\
  \     You can add advanced event selectors, and conditions for your advanced event selectors, up \
   to a maximum of 500 values for all conditions and selectors on a trail. For more information, \
   see \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html}Logging \
   management events}, \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html}Logging \
   data events}, \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-network-events-with-cloudtrail.html}Logging \
   network activity events}, and \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/WhatIsCloudTrail-Limits.html}Quotas \
   in CloudTrail} in the {i CloudTrail User Guide}.\n\
  \     "]

module PutInsightSelectors : sig
  val request :
    Smaws_Lib.Context.t ->
    put_insight_selectors_request ->
    ( put_insight_selectors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
      | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
      | `InsufficientS3BucketPolicyException of insufficient_s3_bucket_policy_exception
      | `InvalidHomeRegionException of invalid_home_region_exception
      | `InvalidInsightSelectorsException of invalid_insight_selectors_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTrailNameException of invalid_trail_name_exception
      | `KmsException of kms_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `NotOrganizationMasterAccountException of not_organization_master_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `S3BucketDoesNotExistException of s3_bucket_does_not_exist_exception
      | `ThrottlingException of throttling_exception
      | `TrailNotFoundException of trail_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Lets you enable Insights event logging by specifying the Insights selectors that you want to \
   enable on an existing trail or event data store. You also use [PutInsightSelectors] to turn off \
   Insights event logging, by passing an empty list of Insights types. The valid Insights event \
   types are [ApiErrorRateInsight] and [ApiCallRateInsight].\n\n\
  \ To enable Insights on an event data store, you must specify the ARNs (or ID suffix of the \
   ARNs) for the source event data store ([EventDataStore]) and the destination event data store \
   ([InsightsDestination]). The source event data store logs management events and enables \
   Insights. The destination event data store logs Insights events based upon the management event \
   activity of the source event data store. The source and destination event data stores must \
   belong to the same Amazon Web Services account.\n\
  \ \n\
  \  To log Insights events for a trail, you must specify the name ([TrailName]) of the CloudTrail \
   trail for which you want to change or add Insights selectors.\n\
  \  \n\
  \   To log CloudTrail Insights events on API call volume, the trail or event data store must log \
   [write] management events. To log CloudTrail Insights events on API error rate, the trail or \
   event data store must log [read] or [write] management events. You can call [GetEventSelectors] \
   on a trail to check whether the trail logs management events. You can call [GetEventDataStore] \
   on an event data store to check whether the event data store logs management events.\n\
  \   \n\
  \    For more information, see \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-insights-events-with-cloudtrail.html}Working \
   with CloudTrail Insights} in the {i CloudTrail User Guide}.\n\
  \    "]

module PutResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceARNNotValidException of resource_arn_not_valid_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourcePolicyNotValidException of resource_policy_not_valid_exception
      | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  " Attaches a resource-based permission policy to a CloudTrail event data store, dashboard, or \
   channel. For more information about resource-based policies, see \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/security_iam_resource-based-policy-examples.html}CloudTrail \
   resource-based policy examples} in the {i CloudTrail User Guide}. \n"]

module RegisterOrganizationDelegatedAdmin : sig
  val request :
    Smaws_Lib.Context.t ->
    register_organization_delegated_admin_request ->
    ( register_organization_delegated_admin_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccountNotFoundException of account_not_found_exception
      | `AccountRegisteredException of account_registered_exception
      | `CannotDelegateManagementAccountException of cannot_delegate_management_account_exception
      | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
      | `ConflictException of conflict_exception
      | `DelegatedAdminAccountLimitExceededException of
        delegated_admin_account_limit_exceeded_exception
      | `InsufficientDependencyServiceAccessPermissionException of
        insufficient_dependency_service_access_permission_exception
      | `InsufficientIAMAccessPermissionException of insufficient_iam_access_permission_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotOrganizationManagementAccountException of not_organization_management_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `OrganizationsNotInUseException of organizations_not_in_use_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Registers an organization\226\128\153s member account as the CloudTrail \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-delegated-administrator.html}delegated \
   administrator}.\n"]

module RemoveTags : sig
  val request :
    Smaws_Lib.Context.t ->
    remove_tags_request ->
    ( remove_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ChannelARNInvalidException of channel_arn_invalid_exception
      | `ChannelNotFoundException of channel_not_found_exception
      | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
      | `ConflictException of conflict_exception
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `InvalidTagParameterException of invalid_tag_parameter_exception
      | `InvalidTrailNameException of invalid_trail_name_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `NotOrganizationMasterAccountException of not_organization_master_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Removes the specified tags from a trail, event data store, dashboard, or channel.\n"]

module RestoreEventDataStore : sig
  val request :
    Smaws_Lib.Context.t ->
    restore_event_data_store_request ->
    ( restore_event_data_store_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreMaxLimitExceededException of event_data_store_max_limit_exceeded_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InsufficientDependencyServiceAccessPermissionException of
        insufficient_dependency_service_access_permission_exception
      | `InvalidEventDataStoreStatusException of invalid_event_data_store_status_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `NotOrganizationMasterAccountException of not_organization_master_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `OrganizationsNotInUseException of organizations_not_in_use_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Restores a deleted event data store specified by [EventDataStore], which accepts an event data \
   store ARN. You can only restore a deleted event data store within the seven-day wait period \
   after deletion. Restoring an event data store can take several minutes, depending on the size \
   of the event data store.\n"]

module SearchSampleQueries : sig
  val request :
    Smaws_Lib.Context.t ->
    search_sample_queries_request ->
    ( search_sample_queries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  " Searches sample queries and returns a list of sample queries that are sorted by relevance. To \
   search for sample queries, provide a natural language [SearchPhrase] in English. \n"]

module StartDashboardRefresh : sig
  val request :
    Smaws_Lib.Context.t ->
    start_dashboard_refresh_request ->
    ( start_dashboard_refresh_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  " Starts a refresh of the specified dashboard. \n\n\
  \  Each time a dashboard is refreshed, CloudTrail runs queries to populate the dashboard's \
   widgets. CloudTrail must be granted permissions to run the [StartQuery] operation on your \
   behalf. To provide permissions, run the [PutResourcePolicy] operation to attach a \
   resource-based policy to each event data store. For more information, see \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/security_iam_resource-based-policy-examples.html#security_iam_resource-based-policy-examples-eds-dashboard}Example: \
   Allow CloudTrail to run queries to populate a dashboard} in the {i CloudTrail User Guide}. \n\
  \ "]

module StartEventDataStoreIngestion : sig
  val request :
    Smaws_Lib.Context.t ->
    start_event_data_store_ingestion_request ->
    ( start_event_data_store_ingestion_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InsufficientDependencyServiceAccessPermissionException of
        insufficient_dependency_service_access_permission_exception
      | `InvalidEventDataStoreCategoryException of invalid_event_data_store_category_exception
      | `InvalidEventDataStoreStatusException of invalid_event_data_store_status_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `NotOrganizationMasterAccountException of not_organization_master_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Starts the ingestion of live events on an event data store specified as either an ARN or the ID \
   portion of the ARN. To start ingestion, the event data store [Status] must be \
   [STOPPED_INGESTION] and the [eventCategory] must be [Management], [Data], [NetworkActivity], or \
   [ConfigurationItem].\n"]

module StartImport : sig
  val request :
    Smaws_Lib.Context.t ->
    start_import_request ->
    ( start_import_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccountHasOngoingImportException of account_has_ongoing_import_exception
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `ImportNotFoundException of import_not_found_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
      | `InvalidEventDataStoreCategoryException of invalid_event_data_store_category_exception
      | `InvalidEventDataStoreStatusException of invalid_event_data_store_status_exception
      | `InvalidImportSourceException of invalid_import_source_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  " Starts an import of logged trail events from a source S3 bucket to a destination event data \
   store. By default, CloudTrail only imports events contained in the S3 bucket's [CloudTrail] \
   prefix and the prefixes inside the [CloudTrail] prefix, and does not check prefixes for other \
   Amazon Web Services services. If you want to import CloudTrail events contained in another \
   prefix, you must include the prefix in the [S3LocationUri]. For more considerations about \
   importing trail events, see \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-copy-trail-to-lake.html#cloudtrail-trail-copy-considerations}Considerations \
   for copying trail events} in the {i CloudTrail User Guide}. \n\n\
  \  When you start a new import, the [Destinations] and [ImportSource] parameters are required. \
   Before starting a new import, disable any access control lists (ACLs) attached to the source S3 \
   bucket. For more information about disabling ACLs, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html}Controlling \
   ownership of objects and disabling ACLs for your bucket}. \n\
  \ \n\
  \   When you retry an import, the [ImportID] parameter is required. \n\
  \  \n\
  \     If the destination event data store is for an organization, you must use the management \
   account to import trail events. You cannot use the delegated administrator account for the \
   organization. \n\
  \    \n\
  \     "]

module StartLogging : sig
  val request :
    Smaws_Lib.Context.t ->
    start_logging_request ->
    ( start_logging_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
      | `ConflictException of conflict_exception
      | `InsufficientDependencyServiceAccessPermissionException of
        insufficient_dependency_service_access_permission_exception
      | `InvalidHomeRegionException of invalid_home_region_exception
      | `InvalidTrailNameException of invalid_trail_name_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `NotOrganizationMasterAccountException of not_organization_master_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ThrottlingException of throttling_exception
      | `TrailNotFoundException of trail_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Starts the recording of Amazon Web Services API calls and log file delivery for a trail. For a \
   trail that is enabled in all Regions, this operation must be called from the Region in which \
   the trail was created. This operation cannot be called on the shadow trails (replicated trails \
   in other Regions) of a trail that is enabled in all Regions.\n"]

module StartQuery : sig
  val request :
    Smaws_Lib.Context.t ->
    start_query_request ->
    ( start_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
      | `InsufficientS3BucketPolicyException of insufficient_s3_bucket_policy_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidQueryStatementException of invalid_query_statement_exception
      | `InvalidS3BucketNameException of invalid_s3_bucket_name_exception
      | `InvalidS3PrefixException of invalid_s3_prefix_exception
      | `MaxConcurrentQueriesException of max_concurrent_queries_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `S3BucketDoesNotExistException of s3_bucket_does_not_exist_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Starts a CloudTrail Lake query. Use the [QueryStatement] parameter to provide your SQL query, \
   enclosed in single quotation marks. Use the optional [DeliveryS3Uri] parameter to deliver the \
   query results to an S3 bucket.\n\n\
  \  [StartQuery] requires you specify either the [QueryStatement] parameter, or a [QueryAlias] \
   and any [QueryParameters]. In the current release, the [QueryAlias] and [QueryParameters] \
   parameters are used only for the queries that populate the CloudTrail Lake dashboards.\n\
  \ "]

module StopEventDataStoreIngestion : sig
  val request :
    Smaws_Lib.Context.t ->
    stop_event_data_store_ingestion_request ->
    ( stop_event_data_store_ingestion_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InsufficientDependencyServiceAccessPermissionException of
        insufficient_dependency_service_access_permission_exception
      | `InvalidEventDataStoreCategoryException of invalid_event_data_store_category_exception
      | `InvalidEventDataStoreStatusException of invalid_event_data_store_status_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `NotOrganizationMasterAccountException of not_organization_master_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Stops the ingestion of live events on an event data store specified as either an ARN or the ID \
   portion of the ARN. To stop ingestion, the event data store [Status] must be [ENABLED] and the \
   [eventCategory] must be [Management], [Data], [NetworkActivity], or [ConfigurationItem].\n"]

module StopImport : sig
  val request :
    Smaws_Lib.Context.t ->
    stop_import_request ->
    ( stop_import_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImportNotFoundException of import_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc " Stops a specified import. \n"]

module StopLogging : sig
  val request :
    Smaws_Lib.Context.t ->
    stop_logging_request ->
    ( stop_logging_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
      | `ConflictException of conflict_exception
      | `InsufficientDependencyServiceAccessPermissionException of
        insufficient_dependency_service_access_permission_exception
      | `InvalidHomeRegionException of invalid_home_region_exception
      | `InvalidTrailNameException of invalid_trail_name_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `NotOrganizationMasterAccountException of not_organization_master_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ThrottlingException of throttling_exception
      | `TrailNotFoundException of trail_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Suspends the recording of Amazon Web Services API calls and log file delivery for the specified \
   trail. Under most circumstances, there is no need to use this action. You can update a trail \
   without stopping it first. This action is the only way to stop recording. For a trail enabled \
   in all Regions, this operation must be called from the Region in which the trail was created, \
   or an [InvalidHomeRegionException] will occur. This operation cannot be called on the shadow \
   trails (replicated trails in other Regions) of a trail enabled in all Regions.\n"]

module UpdateChannel : sig
  val request :
    Smaws_Lib.Context.t ->
    update_channel_request ->
    ( update_channel_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ChannelAlreadyExistsException of channel_already_exists_exception
      | `ChannelARNInvalidException of channel_arn_invalid_exception
      | `ChannelNotFoundException of channel_not_found_exception
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `InvalidEventDataStoreCategoryException of invalid_event_data_store_category_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Updates a channel specified by a required channel ARN or UUID.\n"]

module UpdateDashboard : sig
  val request :
    Smaws_Lib.Context.t ->
    update_dashboard_request ->
    ( update_dashboard_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
      | `InvalidQueryStatementException of invalid_query_statement_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  " Updates the specified dashboard. \n\n\
  \  To set a refresh schedule, CloudTrail must be granted permissions to run the \
   [StartDashboardRefresh] operation to refresh the dashboard on your behalf. To provide \
   permissions, run the [PutResourcePolicy] operation to attach a resource-based policy to the \
   dashboard. For more information, see \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/security_iam_resource-based-policy-examples.html#security_iam_resource-based-policy-examples-dashboards} \
   Resource-based policy example for a dashboard} in the {i CloudTrail User Guide}. \n\
  \ \n\
  \   CloudTrail runs queries to populate the dashboard's widgets during a manual or scheduled \
   refresh. CloudTrail must be granted permissions to run the [StartQuery] operation on your \
   behalf. To provide permissions, run the [PutResourcePolicy] operation to attach a \
   resource-based policy to each event data store. For more information, see \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/security_iam_resource-based-policy-examples.html#security_iam_resource-based-policy-examples-eds-dashboard}Example: \
   Allow CloudTrail to run queries to populate a dashboard} in the {i CloudTrail User Guide}. \n\
  \  "]

module UpdateEventDataStore : sig
  val request :
    Smaws_Lib.Context.t ->
    update_event_data_store_request ->
    ( update_event_data_store_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
      | `EventDataStoreAlreadyExistsException of event_data_store_already_exists_exception
      | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
      | `EventDataStoreHasOngoingImportException of event_data_store_has_ongoing_import_exception
      | `EventDataStoreNotFoundException of event_data_store_not_found_exception
      | `InactiveEventDataStoreException of inactive_event_data_store_exception
      | `InsufficientDependencyServiceAccessPermissionException of
        insufficient_dependency_service_access_permission_exception
      | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
      | `InvalidEventSelectorsException of invalid_event_selectors_exception
      | `InvalidInsightSelectorsException of invalid_insight_selectors_exception
      | `InvalidKmsKeyIdException of invalid_kms_key_id_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `KmsException of kms_exception
      | `KmsKeyNotFoundException of kms_key_not_found_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `NotOrganizationMasterAccountException of not_organization_master_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `OrganizationsNotInUseException of organizations_not_in_use_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Updates an event data store. The required [EventDataStore] value is an ARN or the ID portion of \
   the ARN. Other parameters are optional, but at least one optional parameter must be specified, \
   or CloudTrail throws an error. [RetentionPeriod] is in days, and valid values are integers \
   between 7 and 3653 if the [BillingMode] is set to [EXTENDABLE_RETENTION_PRICING], or between 7 \
   and 2557 if [BillingMode] is set to [FIXED_RETENTION_PRICING]. By default, \
   [TerminationProtection] is enabled.\n\n\
  \ For event data stores for CloudTrail events, [AdvancedEventSelectors] includes or excludes \
   management, data, or network activity events in your event data store. For more information \
   about [AdvancedEventSelectors], see \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_AdvancedEventSelector.html}AdvancedEventSelectors}.\n\
  \ \n\
  \   For event data stores for CloudTrail Insights events, Config configuration items, Audit \
   Manager evidence, or non-Amazon Web Services events, [AdvancedEventSelectors] includes events \
   of that type in your event data store.\n\
  \  "]

(** {1:Serialization and Deserialization} *)
module UpdateTrail : sig
  val request :
    Smaws_Lib.Context.t ->
    update_trail_request ->
    ( update_trail_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
      | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
      | `CloudTrailInvalidClientTokenIdException of cloud_trail_invalid_client_token_id_exception
      | `CloudWatchLogsDeliveryUnavailableException of
        cloud_watch_logs_delivery_unavailable_exception
      | `ConflictException of conflict_exception
      | `InsufficientDependencyServiceAccessPermissionException of
        insufficient_dependency_service_access_permission_exception
      | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
      | `InsufficientS3BucketPolicyException of insufficient_s3_bucket_policy_exception
      | `InsufficientSnsTopicPolicyException of insufficient_sns_topic_policy_exception
      | `InvalidCloudWatchLogsLogGroupArnException of
        invalid_cloud_watch_logs_log_group_arn_exception
      | `InvalidCloudWatchLogsRoleArnException of invalid_cloud_watch_logs_role_arn_exception
      | `InvalidEventSelectorsException of invalid_event_selectors_exception
      | `InvalidHomeRegionException of invalid_home_region_exception
      | `InvalidKmsKeyIdException of invalid_kms_key_id_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3BucketNameException of invalid_s3_bucket_name_exception
      | `InvalidS3PrefixException of invalid_s3_prefix_exception
      | `InvalidSnsTopicNameException of invalid_sns_topic_name_exception
      | `InvalidTrailNameException of invalid_trail_name_exception
      | `KmsException of kms_exception
      | `KmsKeyDisabledException of kms_key_disabled_exception
      | `KmsKeyNotFoundException of kms_key_not_found_exception
      | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
      | `NotOrganizationMasterAccountException of not_organization_master_account_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `OrganizationsNotInUseException of organizations_not_in_use_exception
      | `S3BucketDoesNotExistException of s3_bucket_does_not_exist_exception
      | `ThrottlingException of throttling_exception
      | `TrailNotFoundException of trail_not_found_exception
      | `TrailNotProvidedException of trail_not_provided_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Updates trail settings that control what events you are logging, and how to handle log files. \
   Changes to a trail do not require stopping the CloudTrail service. Use this action to designate \
   an existing bucket for log delivery. If the existing bucket has previously been a target for \
   CloudTrail log files, an IAM policy exists for the bucket. [UpdateTrail] must be called from \
   the Region in which the trail was created; otherwise, an [InvalidHomeRegionException] is thrown.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
