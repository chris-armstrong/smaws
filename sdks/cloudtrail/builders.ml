open Types

let make_widget ?view_properties:(view_properties_ : view_properties_map option)
    ?query_parameters:(query_parameters_ : query_parameters option)
    ?query_statement:(query_statement_ : query_statement option)
    ?query_alias:(query_alias_ : query_alias option) () =
  ({
     view_properties = view_properties_;
     query_parameters = query_parameters_;
     query_statement = query_statement_;
     query_alias = query_alias_;
   }
    : widget)

let make_update_trail_response ?is_organization_trail:(is_organization_trail_ : boolean_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?cloud_watch_logs_role_arn:(cloud_watch_logs_role_arn_ : string_ option)
    ?cloud_watch_logs_log_group_arn:(cloud_watch_logs_log_group_arn_ : string_ option)
    ?log_file_validation_enabled:(log_file_validation_enabled_ : boolean_ option)
    ?trail_ar_n:(trail_ar_n_ : string_ option)
    ?is_multi_region_trail:(is_multi_region_trail_ : boolean_ option)
    ?include_global_service_events:(include_global_service_events_ : boolean_ option)
    ?sns_topic_ar_n:(sns_topic_ar_n_ : string_ option)
    ?sns_topic_name:(sns_topic_name_ : string_ option)
    ?s3_key_prefix:(s3_key_prefix_ : string_ option)
    ?s3_bucket_name:(s3_bucket_name_ : string_ option) ?name:(name_ : string_ option) () =
  ({
     is_organization_trail = is_organization_trail_;
     kms_key_id = kms_key_id_;
     cloud_watch_logs_role_arn = cloud_watch_logs_role_arn_;
     cloud_watch_logs_log_group_arn = cloud_watch_logs_log_group_arn_;
     log_file_validation_enabled = log_file_validation_enabled_;
     trail_ar_n = trail_ar_n_;
     is_multi_region_trail = is_multi_region_trail_;
     include_global_service_events = include_global_service_events_;
     sns_topic_ar_n = sns_topic_ar_n_;
     sns_topic_name = sns_topic_name_;
     s3_key_prefix = s3_key_prefix_;
     s3_bucket_name = s3_bucket_name_;
     name = name_;
   }
    : update_trail_response)

let make_update_trail_request ?is_organization_trail:(is_organization_trail_ : boolean_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?cloud_watch_logs_role_arn:(cloud_watch_logs_role_arn_ : string_ option)
    ?cloud_watch_logs_log_group_arn:(cloud_watch_logs_log_group_arn_ : string_ option)
    ?enable_log_file_validation:(enable_log_file_validation_ : boolean_ option)
    ?is_multi_region_trail:(is_multi_region_trail_ : boolean_ option)
    ?include_global_service_events:(include_global_service_events_ : boolean_ option)
    ?sns_topic_name:(sns_topic_name_ : string_ option)
    ?s3_key_prefix:(s3_key_prefix_ : string_ option)
    ?s3_bucket_name:(s3_bucket_name_ : string_ option) ~name:(name_ : string_) () =
  ({
     is_organization_trail = is_organization_trail_;
     kms_key_id = kms_key_id_;
     cloud_watch_logs_role_arn = cloud_watch_logs_role_arn_;
     cloud_watch_logs_log_group_arn = cloud_watch_logs_log_group_arn_;
     enable_log_file_validation = enable_log_file_validation_;
     is_multi_region_trail = is_multi_region_trail_;
     include_global_service_events = include_global_service_events_;
     sns_topic_name = sns_topic_name_;
     s3_key_prefix = s3_key_prefix_;
     s3_bucket_name = s3_bucket_name_;
     name = name_;
   }
    : update_trail_request)

let make_advanced_field_selector ?not_ends_with:(not_ends_with_ : operator option)
    ?not_starts_with:(not_starts_with_ : operator option)
    ?not_equals:(not_equals_ : operator option) ?ends_with:(ends_with_ : operator option)
    ?starts_with:(starts_with_ : operator option) ?equals:(equals_ : operator option)
    ~field:(field_ : selector_field) () =
  ({
     not_ends_with = not_ends_with_;
     not_starts_with = not_starts_with_;
     not_equals = not_equals_;
     ends_with = ends_with_;
     starts_with = starts_with_;
     equals = equals_;
     field = field_;
   }
    : advanced_field_selector)

let make_advanced_event_selector ?name:(name_ : selector_name option)
    ~field_selectors:(field_selectors_ : advanced_field_selectors) () =
  ({ field_selectors = field_selectors_; name = name_ } : advanced_event_selector)

let make_update_event_data_store_response
    ?federation_role_arn:(federation_role_arn_ : federation_role_arn option)
    ?federation_status:(federation_status_ : federation_status option)
    ?billing_mode:(billing_mode_ : billing_mode option)
    ?kms_key_id:(kms_key_id_ : event_data_store_kms_key_id option)
    ?updated_timestamp:(updated_timestamp_ : date option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?retention_period:(retention_period_ : retention_period option)
    ?organization_enabled:(organization_enabled_ : boolean_ option)
    ?multi_region_enabled:(multi_region_enabled_ : boolean_ option)
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option)
    ?status:(status_ : event_data_store_status option) ?name:(name_ : event_data_store_name option)
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option) () =
  ({
     federation_role_arn = federation_role_arn_;
     federation_status = federation_status_;
     billing_mode = billing_mode_;
     kms_key_id = kms_key_id_;
     updated_timestamp = updated_timestamp_;
     created_timestamp = created_timestamp_;
     termination_protection_enabled = termination_protection_enabled_;
     retention_period = retention_period_;
     organization_enabled = organization_enabled_;
     multi_region_enabled = multi_region_enabled_;
     advanced_event_selectors = advanced_event_selectors_;
     status = status_;
     name = name_;
     event_data_store_arn = event_data_store_arn_;
   }
    : update_event_data_store_response)

let make_update_event_data_store_request ?billing_mode:(billing_mode_ : billing_mode option)
    ?kms_key_id:(kms_key_id_ : event_data_store_kms_key_id option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?retention_period:(retention_period_ : retention_period option)
    ?organization_enabled:(organization_enabled_ : boolean_ option)
    ?multi_region_enabled:(multi_region_enabled_ : boolean_ option)
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option)
    ?name:(name_ : event_data_store_name option)
    ~event_data_store:(event_data_store_ : event_data_store_arn) () =
  ({
     billing_mode = billing_mode_;
     kms_key_id = kms_key_id_;
     termination_protection_enabled = termination_protection_enabled_;
     retention_period = retention_period_;
     organization_enabled = organization_enabled_;
     multi_region_enabled = multi_region_enabled_;
     advanced_event_selectors = advanced_event_selectors_;
     name = name_;
     event_data_store = event_data_store_;
   }
    : update_event_data_store_request)

let make_refresh_schedule_frequency ?value:(value_ : refresh_schedule_frequency_value option)
    ?unit_:(unit__ : refresh_schedule_frequency_unit option) () =
  ({ value = value_; unit_ = unit__ } : refresh_schedule_frequency)

let make_refresh_schedule ?time_of_day:(time_of_day_ : time_of_day option)
    ?status:(status_ : refresh_schedule_status option)
    ?frequency:(frequency_ : refresh_schedule_frequency option) () =
  ({ time_of_day = time_of_day_; status = status_; frequency = frequency_ } : refresh_schedule)

let make_update_dashboard_response ?updated_timestamp:(updated_timestamp_ : date option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?refresh_schedule:(refresh_schedule_ : refresh_schedule option)
    ?widgets:(widgets_ : widget_list option) ?type_:(type__ : dashboard_type option)
    ?name:(name_ : dashboard_name option) ?dashboard_arn:(dashboard_arn_ : dashboard_arn option) ()
    =
  ({
     updated_timestamp = updated_timestamp_;
     created_timestamp = created_timestamp_;
     termination_protection_enabled = termination_protection_enabled_;
     refresh_schedule = refresh_schedule_;
     widgets = widgets_;
     type_ = type__;
     name = name_;
     dashboard_arn = dashboard_arn_;
   }
    : update_dashboard_response)

let make_request_widget ?query_parameters:(query_parameters_ : query_parameters option)
    ~view_properties:(view_properties_ : view_properties_map)
    ~query_statement:(query_statement_ : query_statement) () =
  ({
     view_properties = view_properties_;
     query_parameters = query_parameters_;
     query_statement = query_statement_;
   }
    : request_widget)

let make_update_dashboard_request
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?refresh_schedule:(refresh_schedule_ : refresh_schedule option)
    ?widgets:(widgets_ : request_widget_list option) ~dashboard_id:(dashboard_id_ : dashboard_arn)
    () =
  ({
     termination_protection_enabled = termination_protection_enabled_;
     refresh_schedule = refresh_schedule_;
     widgets = widgets_;
     dashboard_id = dashboard_id_;
   }
    : update_dashboard_request)

let make_destination ~location:(location_ : location) ~type_:(type__ : destination_type) () =
  ({ location = location_; type_ = type__ } : destination)

let make_update_channel_response ?destinations:(destinations_ : destinations option)
    ?source:(source_ : source option) ?name:(name_ : channel_name option)
    ?channel_arn:(channel_arn_ : channel_arn option) () =
  ({ destinations = destinations_; source = source_; name = name_; channel_arn = channel_arn_ }
    : update_channel_response)

let make_update_channel_request ?name:(name_ : channel_name option)
    ?destinations:(destinations_ : destinations option) ~channel:(channel_ : channel_arn) () =
  ({ name = name_; destinations = destinations_; channel = channel_ } : update_channel_request)

let make_trail_info ?home_region:(home_region_ : string_ option) ?name:(name_ : string_ option)
    ?trail_ar_n:(trail_ar_n_ : string_ option) () =
  ({ home_region = home_region_; name = name_; trail_ar_n = trail_ar_n_ } : trail_info)

let make_trail ?is_organization_trail:(is_organization_trail_ : boolean_ option)
    ?has_insight_selectors:(has_insight_selectors_ : boolean_ option)
    ?has_custom_event_selectors:(has_custom_event_selectors_ : boolean_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?cloud_watch_logs_role_arn:(cloud_watch_logs_role_arn_ : string_ option)
    ?cloud_watch_logs_log_group_arn:(cloud_watch_logs_log_group_arn_ : string_ option)
    ?log_file_validation_enabled:(log_file_validation_enabled_ : boolean_ option)
    ?trail_ar_n:(trail_ar_n_ : string_ option) ?home_region:(home_region_ : string_ option)
    ?is_multi_region_trail:(is_multi_region_trail_ : boolean_ option)
    ?include_global_service_events:(include_global_service_events_ : boolean_ option)
    ?sns_topic_ar_n:(sns_topic_ar_n_ : string_ option)
    ?sns_topic_name:(sns_topic_name_ : string_ option)
    ?s3_key_prefix:(s3_key_prefix_ : string_ option)
    ?s3_bucket_name:(s3_bucket_name_ : string_ option) ?name:(name_ : string_ option) () =
  ({
     is_organization_trail = is_organization_trail_;
     has_insight_selectors = has_insight_selectors_;
     has_custom_event_selectors = has_custom_event_selectors_;
     kms_key_id = kms_key_id_;
     cloud_watch_logs_role_arn = cloud_watch_logs_role_arn_;
     cloud_watch_logs_log_group_arn = cloud_watch_logs_log_group_arn_;
     log_file_validation_enabled = log_file_validation_enabled_;
     trail_ar_n = trail_ar_n_;
     home_region = home_region_;
     is_multi_region_trail = is_multi_region_trail_;
     include_global_service_events = include_global_service_events_;
     sns_topic_ar_n = sns_topic_ar_n_;
     sns_topic_name = sns_topic_name_;
     s3_key_prefix = s3_key_prefix_;
     s3_bucket_name = s3_bucket_name_;
     name = name_;
   }
    : trail)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_stop_logging_response () = (() : unit)
let make_stop_logging_request ~name:(name_ : string_) () = ({ name = name_ } : stop_logging_request)

let make_s3_import_source ~s3_bucket_access_role_arn:(s3_bucket_access_role_arn_ : string_)
    ~s3_bucket_region:(s3_bucket_region_ : string_) ~s3_location_uri:(s3_location_uri_ : string_) ()
    =
  ({
     s3_bucket_access_role_arn = s3_bucket_access_role_arn_;
     s3_bucket_region = s3_bucket_region_;
     s3_location_uri = s3_location_uri_;
   }
    : s3_import_source)

let make_import_source ~s3:(s3_ : s3_import_source) () = ({ s3 = s3_ } : import_source)

let make_import_statistics ?failed_entries:(failed_entries_ : long option)
    ?events_completed:(events_completed_ : long option)
    ?files_completed:(files_completed_ : long option)
    ?prefixes_completed:(prefixes_completed_ : long option)
    ?prefixes_found:(prefixes_found_ : long option) () =
  ({
     failed_entries = failed_entries_;
     events_completed = events_completed_;
     files_completed = files_completed_;
     prefixes_completed = prefixes_completed_;
     prefixes_found = prefixes_found_;
   }
    : import_statistics)

let make_stop_import_response ?import_statistics:(import_statistics_ : import_statistics option)
    ?end_event_time:(end_event_time_ : date option)
    ?start_event_time:(start_event_time_ : date option)
    ?updated_timestamp:(updated_timestamp_ : date option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?import_status:(import_status_ : import_status option)
    ?destinations:(destinations_ : import_destinations option)
    ?import_source:(import_source_ : import_source option) ?import_id:(import_id_ : uui_d option) ()
    =
  ({
     import_statistics = import_statistics_;
     end_event_time = end_event_time_;
     start_event_time = start_event_time_;
     updated_timestamp = updated_timestamp_;
     created_timestamp = created_timestamp_;
     import_status = import_status_;
     destinations = destinations_;
     import_source = import_source_;
     import_id = import_id_;
   }
    : stop_import_response)

let make_stop_import_request ~import_id:(import_id_ : uui_d) () =
  ({ import_id = import_id_ } : stop_import_request)

let make_stop_event_data_store_ingestion_response () = (() : unit)

let make_stop_event_data_store_ingestion_request
    ~event_data_store:(event_data_store_ : event_data_store_arn) () =
  ({ event_data_store = event_data_store_ } : stop_event_data_store_ingestion_request)

let make_start_query_response
    ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ : account_id option)
    ?query_id:(query_id_ : uui_d option) () =
  ({ event_data_store_owner_account_id = event_data_store_owner_account_id_; query_id = query_id_ }
    : start_query_response)

let make_start_query_request
    ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ : account_id option)
    ?query_parameters:(query_parameters_ : query_parameters option)
    ?query_alias:(query_alias_ : query_alias option)
    ?delivery_s3_uri:(delivery_s3_uri_ : delivery_s3_uri option)
    ?query_statement:(query_statement_ : query_statement option) () =
  ({
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
     query_parameters = query_parameters_;
     query_alias = query_alias_;
     delivery_s3_uri = delivery_s3_uri_;
     query_statement = query_statement_;
   }
    : start_query_request)

let make_start_logging_response () = (() : unit)

let make_start_logging_request ~name:(name_ : string_) () =
  ({ name = name_ } : start_logging_request)

let make_start_import_response ?updated_timestamp:(updated_timestamp_ : date option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?import_status:(import_status_ : import_status option)
    ?end_event_time:(end_event_time_ : date option)
    ?start_event_time:(start_event_time_ : date option)
    ?import_source:(import_source_ : import_source option)
    ?destinations:(destinations_ : import_destinations option)
    ?import_id:(import_id_ : uui_d option) () =
  ({
     updated_timestamp = updated_timestamp_;
     created_timestamp = created_timestamp_;
     import_status = import_status_;
     end_event_time = end_event_time_;
     start_event_time = start_event_time_;
     import_source = import_source_;
     destinations = destinations_;
     import_id = import_id_;
   }
    : start_import_response)

let make_start_import_request ?import_id:(import_id_ : uui_d option)
    ?end_event_time:(end_event_time_ : date option)
    ?start_event_time:(start_event_time_ : date option)
    ?import_source:(import_source_ : import_source option)
    ?destinations:(destinations_ : import_destinations option) () =
  ({
     import_id = import_id_;
     end_event_time = end_event_time_;
     start_event_time = start_event_time_;
     import_source = import_source_;
     destinations = destinations_;
   }
    : start_import_request)

let make_start_event_data_store_ingestion_response () = (() : unit)

let make_start_event_data_store_ingestion_request
    ~event_data_store:(event_data_store_ : event_data_store_arn) () =
  ({ event_data_store = event_data_store_ } : start_event_data_store_ingestion_request)

let make_start_dashboard_refresh_response ?refresh_id:(refresh_id_ : refresh_id option) () =
  ({ refresh_id = refresh_id_ } : start_dashboard_refresh_response)

let make_start_dashboard_refresh_request
    ?query_parameter_values:(query_parameter_values_ : query_parameter_values option)
    ~dashboard_id:(dashboard_id_ : dashboard_arn) () =
  ({ query_parameter_values = query_parameter_values_; dashboard_id = dashboard_id_ }
    : start_dashboard_refresh_request)

let make_source_config
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option)
    ?apply_to_all_regions:(apply_to_all_regions_ : boolean_ option) () =
  ({
     advanced_event_selectors = advanced_event_selectors_;
     apply_to_all_regions = apply_to_all_regions_;
   }
    : source_config)

let make_search_sample_queries_response ?next_token:(next_token_ : pagination_token option)
    ?search_results:(search_results_ : search_sample_queries_search_results option) () =
  ({ next_token = next_token_; search_results = search_results_ } : search_sample_queries_response)

let make_search_sample_queries_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : search_sample_queries_max_results option)
    ~search_phrase:(search_phrase_ : search_sample_queries_search_phrase) () =
  ({ next_token = next_token_; max_results = max_results_; search_phrase = search_phrase_ }
    : search_sample_queries_request)

let make_restore_event_data_store_response ?billing_mode:(billing_mode_ : billing_mode option)
    ?kms_key_id:(kms_key_id_ : event_data_store_kms_key_id option)
    ?updated_timestamp:(updated_timestamp_ : date option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?retention_period:(retention_period_ : retention_period option)
    ?organization_enabled:(organization_enabled_ : boolean_ option)
    ?multi_region_enabled:(multi_region_enabled_ : boolean_ option)
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option)
    ?status:(status_ : event_data_store_status option) ?name:(name_ : event_data_store_name option)
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option) () =
  ({
     billing_mode = billing_mode_;
     kms_key_id = kms_key_id_;
     updated_timestamp = updated_timestamp_;
     created_timestamp = created_timestamp_;
     termination_protection_enabled = termination_protection_enabled_;
     retention_period = retention_period_;
     organization_enabled = organization_enabled_;
     multi_region_enabled = multi_region_enabled_;
     advanced_event_selectors = advanced_event_selectors_;
     status = status_;
     name = name_;
     event_data_store_arn = event_data_store_arn_;
   }
    : restore_event_data_store_response)

let make_restore_event_data_store_request
    ~event_data_store:(event_data_store_ : event_data_store_arn) () =
  ({ event_data_store = event_data_store_ } : restore_event_data_store_request)

let make_resource_tag ?tags_list:(tags_list_ : tags_list option)
    ?resource_id:(resource_id_ : string_ option) () =
  ({ tags_list = tags_list_; resource_id = resource_id_ } : resource_tag)

let make_resource ?resource_name:(resource_name_ : string_ option)
    ?resource_type:(resource_type_ : string_ option) () =
  ({ resource_name = resource_name_; resource_type = resource_type_ } : resource)

let make_remove_tags_response () = (() : unit)

let make_remove_tags_request ~tags_list:(tags_list_ : tags_list)
    ~resource_id:(resource_id_ : string_) () =
  ({ tags_list = tags_list_; resource_id = resource_id_ } : remove_tags_request)

let make_register_organization_delegated_admin_response () = (() : unit)

let make_register_organization_delegated_admin_request
    ~member_account_id:(member_account_id_ : account_id) () =
  ({ member_account_id = member_account_id_ } : register_organization_delegated_admin_request)

let make_query_statistics_for_describe_query ?creation_time:(creation_time_ : date option)
    ?execution_time_in_millis:(execution_time_in_millis_ : integer option)
    ?bytes_scanned:(bytes_scanned_ : long option) ?events_scanned:(events_scanned_ : long option)
    ?events_matched:(events_matched_ : long option) () =
  ({
     creation_time = creation_time_;
     execution_time_in_millis = execution_time_in_millis_;
     bytes_scanned = bytes_scanned_;
     events_scanned = events_scanned_;
     events_matched = events_matched_;
   }
    : query_statistics_for_describe_query)

let make_query_statistics ?bytes_scanned:(bytes_scanned_ : long option)
    ?total_results_count:(total_results_count_ : integer option)
    ?results_count:(results_count_ : integer option) () =
  ({
     bytes_scanned = bytes_scanned_;
     total_results_count = total_results_count_;
     results_count = results_count_;
   }
    : query_statistics)

let make_query ?creation_time:(creation_time_ : date option)
    ?query_status:(query_status_ : query_status option) ?query_id:(query_id_ : uui_d option) () =
  ({ creation_time = creation_time_; query_status = query_status_; query_id = query_id_ } : query)

let make_put_resource_policy_response
    ?delegated_admin_resource_policy:(delegated_admin_resource_policy_ : resource_policy option)
    ?resource_policy:(resource_policy_ : resource_policy option)
    ?resource_arn:(resource_arn_ : resource_arn option) () =
  ({
     delegated_admin_resource_policy = delegated_admin_resource_policy_;
     resource_policy = resource_policy_;
     resource_arn = resource_arn_;
   }
    : put_resource_policy_response)

let make_put_resource_policy_request ~resource_policy:(resource_policy_ : resource_policy)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_policy = resource_policy_; resource_arn = resource_arn_ }
    : put_resource_policy_request)

let make_insight_selector ?insight_type:(insight_type_ : insight_type option) () =
  ({ insight_type = insight_type_ } : insight_selector)

let make_put_insight_selectors_response
    ?insights_destination:(insights_destination_ : event_data_store_arn option)
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option)
    ?insight_selectors:(insight_selectors_ : insight_selectors option)
    ?trail_ar_n:(trail_ar_n_ : string_ option) () =
  ({
     insights_destination = insights_destination_;
     event_data_store_arn = event_data_store_arn_;
     insight_selectors = insight_selectors_;
     trail_ar_n = trail_ar_n_;
   }
    : put_insight_selectors_response)

let make_put_insight_selectors_request
    ?insights_destination:(insights_destination_ : event_data_store_arn option)
    ?event_data_store:(event_data_store_ : event_data_store_arn option)
    ?trail_name:(trail_name_ : string_ option)
    ~insight_selectors:(insight_selectors_ : insight_selectors) () =
  ({
     insights_destination = insights_destination_;
     event_data_store = event_data_store_;
     insight_selectors = insight_selectors_;
     trail_name = trail_name_;
   }
    : put_insight_selectors_request)

let make_data_resource ?values:(values_ : data_resource_values option)
    ?type_:(type__ : string_ option) () =
  ({ values = values_; type_ = type__ } : data_resource)

let make_event_selector
    ?exclude_management_event_sources:
      (exclude_management_event_sources_ : exclude_management_event_sources option)
    ?data_resources:(data_resources_ : data_resources option)
    ?include_management_events:(include_management_events_ : boolean_ option)
    ?read_write_type:(read_write_type_ : read_write_type option) () =
  ({
     exclude_management_event_sources = exclude_management_event_sources_;
     data_resources = data_resources_;
     include_management_events = include_management_events_;
     read_write_type = read_write_type_;
   }
    : event_selector)

let make_put_event_selectors_response
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option)
    ?event_selectors:(event_selectors_ : event_selectors option)
    ?trail_ar_n:(trail_ar_n_ : string_ option) () =
  ({
     advanced_event_selectors = advanced_event_selectors_;
     event_selectors = event_selectors_;
     trail_ar_n = trail_ar_n_;
   }
    : put_event_selectors_response)

let make_put_event_selectors_request
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option)
    ?event_selectors:(event_selectors_ : event_selectors option) ~trail_name:(trail_name_ : string_)
    () =
  ({
     advanced_event_selectors = advanced_event_selectors_;
     event_selectors = event_selectors_;
     trail_name = trail_name_;
   }
    : put_event_selectors_request)

let make_context_key_selector ~equals:(equals_ : operator_target_list) ~type_:(type__ : type_) () =
  ({ equals = equals_; type_ = type__ } : context_key_selector)

let make_put_event_configuration_response
    ?context_key_selectors:(context_key_selectors_ : context_key_selectors option)
    ?max_event_size:(max_event_size_ : max_event_size option)
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option) () =
  ({
     context_key_selectors = context_key_selectors_;
     max_event_size = max_event_size_;
     event_data_store_arn = event_data_store_arn_;
   }
    : put_event_configuration_response)

let make_put_event_configuration_request ?event_data_store:(event_data_store_ : string_ option)
    ~context_key_selectors:(context_key_selectors_ : context_key_selectors)
    ~max_event_size:(max_event_size_ : max_event_size) () =
  ({
     context_key_selectors = context_key_selectors_;
     max_event_size = max_event_size_;
     event_data_store = event_data_store_;
   }
    : put_event_configuration_request)

let make_public_key ?fingerprint:(fingerprint_ : string_ option)
    ?validity_end_time:(validity_end_time_ : date option)
    ?validity_start_time:(validity_start_time_ : date option) ?value:(value_ : byte_buffer option)
    () =
  ({
     fingerprint = fingerprint_;
     validity_end_time = validity_end_time_;
     validity_start_time = validity_start_time_;
     value = value_;
   }
    : public_key)

let make_partition_key ~type_:(type__ : partition_key_type) ~name:(name_ : partition_key_name) () =
  ({ type_ = type__; name = name_ } : partition_key)

let make_event ?cloud_trail_event:(cloud_trail_event_ : string_ option)
    ?resources:(resources_ : resource_list option) ?username:(username_ : string_ option)
    ?event_source:(event_source_ : string_ option) ?event_time:(event_time_ : date option)
    ?access_key_id:(access_key_id_ : string_ option) ?read_only:(read_only_ : string_ option)
    ?event_name:(event_name_ : string_ option) ?event_id:(event_id_ : string_ option) () =
  ({
     cloud_trail_event = cloud_trail_event_;
     resources = resources_;
     username = username_;
     event_source = event_source_;
     event_time = event_time_;
     access_key_id = access_key_id_;
     read_only = read_only_;
     event_name = event_name_;
     event_id = event_id_;
   }
    : event)

let make_lookup_events_response ?next_token:(next_token_ : next_token option)
    ?events:(events_ : events_list option) () =
  ({ next_token = next_token_; events = events_ } : lookup_events_response)

let make_lookup_attribute ~attribute_value:(attribute_value_ : lookup_attribute_value)
    ~attribute_key:(attribute_key_ : lookup_attribute_key) () =
  ({ attribute_value = attribute_value_; attribute_key = attribute_key_ } : lookup_attribute)

let make_lookup_events_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?event_category:(event_category_ : event_category option) ?end_time:(end_time_ : date option)
    ?start_time:(start_time_ : date option)
    ?lookup_attributes:(lookup_attributes_ : lookup_attributes_list option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     event_category = event_category_;
     end_time = end_time_;
     start_time = start_time_;
     lookup_attributes = lookup_attributes_;
   }
    : lookup_events_request)

let make_list_trails_response ?next_token:(next_token_ : string_ option)
    ?trails:(trails_ : trails option) () =
  ({ next_token = next_token_; trails = trails_ } : list_trails_response)

let make_list_trails_request ?next_token:(next_token_ : string_ option) () =
  ({ next_token = next_token_ } : list_trails_request)

let make_list_tags_response ?next_token:(next_token_ : string_ option)
    ?resource_tag_list:(resource_tag_list_ : resource_tag_list option) () =
  ({ next_token = next_token_; resource_tag_list = resource_tag_list_ } : list_tags_response)

let make_list_tags_request ?next_token:(next_token_ : string_ option)
    ~resource_id_list:(resource_id_list_ : resource_id_list) () =
  ({ next_token = next_token_; resource_id_list = resource_id_list_ } : list_tags_request)

let make_list_queries_response ?next_token:(next_token_ : pagination_token option)
    ?queries:(queries_ : queries option) () =
  ({ next_token = next_token_; queries = queries_ } : list_queries_response)

let make_list_queries_request ?query_status:(query_status_ : query_status option)
    ?end_time:(end_time_ : date option) ?start_time:(start_time_ : date option)
    ?max_results:(max_results_ : list_queries_max_results_count option)
    ?next_token:(next_token_ : pagination_token option)
    ~event_data_store:(event_data_store_ : event_data_store_arn) () =
  ({
     query_status = query_status_;
     end_time = end_time_;
     start_time = start_time_;
     max_results = max_results_;
     next_token = next_token_;
     event_data_store = event_data_store_;
   }
    : list_queries_request)

let make_list_public_keys_response ?next_token:(next_token_ : string_ option)
    ?public_key_list:(public_key_list_ : public_key_list option) () =
  ({ next_token = next_token_; public_key_list = public_key_list_ } : list_public_keys_response)

let make_list_public_keys_request ?next_token:(next_token_ : string_ option)
    ?end_time:(end_time_ : date option) ?start_time:(start_time_ : date option) () =
  ({ next_token = next_token_; end_time = end_time_; start_time = start_time_ }
    : list_public_keys_request)

let make_list_insights_metric_data_response
    ?next_token:(next_token_ : insights_metric_next_token option)
    ?values:(values_ : insights_metric_values option) ?timestamps:(timestamps_ : timestamps option)
    ?error_code:(error_code_ : error_code option)
    ?insight_type:(insight_type_ : insight_type option)
    ?event_name:(event_name_ : event_name option)
    ?event_source:(event_source_ : event_source option) () =
  ({
     next_token = next_token_;
     values = values_;
     timestamps = timestamps_;
     error_code = error_code_;
     insight_type = insight_type_;
     event_name = event_name_;
     event_source = event_source_;
   }
    : list_insights_metric_data_response)

let make_list_insights_metric_data_request
    ?next_token:(next_token_ : insights_metric_next_token option)
    ?max_results:(max_results_ : insights_metric_max_results option)
    ?data_type:(data_type_ : insights_metric_data_type option)
    ?period:(period_ : insights_metric_period option) ?end_time:(end_time_ : date option)
    ?start_time:(start_time_ : date option) ?error_code:(error_code_ : error_code option)
    ~insight_type:(insight_type_ : insight_type) ~event_name:(event_name_ : event_name)
    ~event_source:(event_source_ : event_source) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     data_type = data_type_;
     period = period_;
     end_time = end_time_;
     start_time = start_time_;
     error_code = error_code_;
     insight_type = insight_type_;
     event_name = event_name_;
     event_source = event_source_;
   }
    : list_insights_metric_data_request)

let make_imports_list_item ?updated_timestamp:(updated_timestamp_ : date option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?destinations:(destinations_ : import_destinations option)
    ?import_status:(import_status_ : import_status option) ?import_id:(import_id_ : uui_d option) ()
    =
  ({
     updated_timestamp = updated_timestamp_;
     created_timestamp = created_timestamp_;
     destinations = destinations_;
     import_status = import_status_;
     import_id = import_id_;
   }
    : imports_list_item)

let make_list_imports_response ?next_token:(next_token_ : pagination_token option)
    ?imports:(imports_ : imports_list option) () =
  ({ next_token = next_token_; imports = imports_ } : list_imports_response)

let make_list_imports_request ?next_token:(next_token_ : pagination_token option)
    ?import_status:(import_status_ : import_status option)
    ?destination:(destination_ : event_data_store_arn option)
    ?max_results:(max_results_ : list_imports_max_results_count option) () =
  ({
     next_token = next_token_;
     import_status = import_status_;
     destination = destination_;
     max_results = max_results_;
   }
    : list_imports_request)

let make_import_failure_list_item ?last_updated_time:(last_updated_time_ : date option)
    ?error_message:(error_message_ : string_ option) ?error_type:(error_type_ : string_ option)
    ?status:(status_ : import_failure_status option) ?location:(location_ : string_ option) () =
  ({
     last_updated_time = last_updated_time_;
     error_message = error_message_;
     error_type = error_type_;
     status = status_;
     location = location_;
   }
    : import_failure_list_item)

let make_list_import_failures_response ?next_token:(next_token_ : pagination_token option)
    ?failures:(failures_ : import_failure_list option) () =
  ({ next_token = next_token_; failures = failures_ } : list_import_failures_response)

let make_list_import_failures_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : list_import_failures_max_results_count option)
    ~import_id:(import_id_ : uui_d) () =
  ({ next_token = next_token_; max_results = max_results_; import_id = import_id_ }
    : list_import_failures_request)

let make_event_data_store ?updated_timestamp:(updated_timestamp_ : date option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?retention_period:(retention_period_ : retention_period option)
    ?organization_enabled:(organization_enabled_ : boolean_ option)
    ?multi_region_enabled:(multi_region_enabled_ : boolean_ option)
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option)
    ?status:(status_ : event_data_store_status option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?name:(name_ : event_data_store_name option)
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option) () =
  ({
     updated_timestamp = updated_timestamp_;
     created_timestamp = created_timestamp_;
     retention_period = retention_period_;
     organization_enabled = organization_enabled_;
     multi_region_enabled = multi_region_enabled_;
     advanced_event_selectors = advanced_event_selectors_;
     status = status_;
     termination_protection_enabled = termination_protection_enabled_;
     name = name_;
     event_data_store_arn = event_data_store_arn_;
   }
    : event_data_store)

let make_list_event_data_stores_response ?next_token:(next_token_ : pagination_token option)
    ?event_data_stores:(event_data_stores_ : event_data_stores option) () =
  ({ next_token = next_token_; event_data_stores = event_data_stores_ }
    : list_event_data_stores_response)

let make_list_event_data_stores_request
    ?max_results:(max_results_ : list_event_data_stores_max_results_count option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_event_data_stores_request)

let make_dashboard_detail ?type_:(type__ : dashboard_type option)
    ?dashboard_arn:(dashboard_arn_ : dashboard_arn option) () =
  ({ type_ = type__; dashboard_arn = dashboard_arn_ } : dashboard_detail)

let make_list_dashboards_response ?next_token:(next_token_ : pagination_token option)
    ?dashboards:(dashboards_ : dashboards option) () =
  ({ next_token = next_token_; dashboards = dashboards_ } : list_dashboards_response)

let make_list_dashboards_request
    ?max_results:(max_results_ : list_dashboards_max_results_count option)
    ?next_token:(next_token_ : pagination_token option) ?type_:(type__ : dashboard_type option)
    ?name_prefix:(name_prefix_ : dashboard_name option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     type_ = type__;
     name_prefix = name_prefix_;
   }
    : list_dashboards_request)

let make_channel ?name:(name_ : channel_name option)
    ?channel_arn:(channel_arn_ : channel_arn option) () =
  ({ name = name_; channel_arn = channel_arn_ } : channel)

let make_list_channels_response ?next_token:(next_token_ : pagination_token option)
    ?channels:(channels_ : channels option) () =
  ({ next_token = next_token_; channels = channels_ } : list_channels_response)

let make_list_channels_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : list_channels_max_results_count option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_channels_request)

let make_ingestion_status
    ?latest_ingestion_attempt_event_i_d:(latest_ingestion_attempt_event_i_d_ : uui_d option)
    ?latest_ingestion_attempt_time:(latest_ingestion_attempt_time_ : date option)
    ?latest_ingestion_error_code:(latest_ingestion_error_code_ : error_message option)
    ?latest_ingestion_success_event_i_d:(latest_ingestion_success_event_i_d_ : uui_d option)
    ?latest_ingestion_success_time:(latest_ingestion_success_time_ : date option) () =
  ({
     latest_ingestion_attempt_event_i_d = latest_ingestion_attempt_event_i_d_;
     latest_ingestion_attempt_time = latest_ingestion_attempt_time_;
     latest_ingestion_error_code = latest_ingestion_error_code_;
     latest_ingestion_success_event_i_d = latest_ingestion_success_event_i_d_;
     latest_ingestion_success_time = latest_ingestion_success_time_;
   }
    : ingestion_status)

let make_get_trail_status_response ?time_logging_stopped:(time_logging_stopped_ : string_ option)
    ?time_logging_started:(time_logging_started_ : string_ option)
    ?latest_delivery_attempt_succeeded:(latest_delivery_attempt_succeeded_ : string_ option)
    ?latest_notification_attempt_succeeded:(latest_notification_attempt_succeeded_ : string_ option)
    ?latest_notification_attempt_time:(latest_notification_attempt_time_ : string_ option)
    ?latest_delivery_attempt_time:(latest_delivery_attempt_time_ : string_ option)
    ?latest_digest_delivery_error:(latest_digest_delivery_error_ : string_ option)
    ?latest_digest_delivery_time:(latest_digest_delivery_time_ : date option)
    ?latest_cloud_watch_logs_delivery_time:(latest_cloud_watch_logs_delivery_time_ : date option)
    ?latest_cloud_watch_logs_delivery_error:
      (latest_cloud_watch_logs_delivery_error_ : string_ option)
    ?stop_logging_time:(stop_logging_time_ : date option)
    ?start_logging_time:(start_logging_time_ : date option)
    ?latest_notification_time:(latest_notification_time_ : date option)
    ?latest_delivery_time:(latest_delivery_time_ : date option)
    ?latest_notification_error:(latest_notification_error_ : string_ option)
    ?latest_delivery_error:(latest_delivery_error_ : string_ option)
    ?is_logging:(is_logging_ : boolean_ option) () =
  ({
     time_logging_stopped = time_logging_stopped_;
     time_logging_started = time_logging_started_;
     latest_delivery_attempt_succeeded = latest_delivery_attempt_succeeded_;
     latest_notification_attempt_succeeded = latest_notification_attempt_succeeded_;
     latest_notification_attempt_time = latest_notification_attempt_time_;
     latest_delivery_attempt_time = latest_delivery_attempt_time_;
     latest_digest_delivery_error = latest_digest_delivery_error_;
     latest_digest_delivery_time = latest_digest_delivery_time_;
     latest_cloud_watch_logs_delivery_time = latest_cloud_watch_logs_delivery_time_;
     latest_cloud_watch_logs_delivery_error = latest_cloud_watch_logs_delivery_error_;
     stop_logging_time = stop_logging_time_;
     start_logging_time = start_logging_time_;
     latest_notification_time = latest_notification_time_;
     latest_delivery_time = latest_delivery_time_;
     latest_notification_error = latest_notification_error_;
     latest_delivery_error = latest_delivery_error_;
     is_logging = is_logging_;
   }
    : get_trail_status_response)

let make_get_trail_status_request ~name:(name_ : string_) () =
  ({ name = name_ } : get_trail_status_request)

let make_get_trail_response ?trail:(trail_ : trail option) () =
  ({ trail = trail_ } : get_trail_response)

let make_get_trail_request ~name:(name_ : string_) () = ({ name = name_ } : get_trail_request)

let make_get_resource_policy_response
    ?delegated_admin_resource_policy:(delegated_admin_resource_policy_ : resource_policy option)
    ?resource_policy:(resource_policy_ : resource_policy option)
    ?resource_arn:(resource_arn_ : resource_arn option) () =
  ({
     delegated_admin_resource_policy = delegated_admin_resource_policy_;
     resource_policy = resource_policy_;
     resource_arn = resource_arn_;
   }
    : get_resource_policy_response)

let make_get_resource_policy_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_request)

let make_get_query_results_response ?error_message:(error_message_ : error_message option)
    ?next_token:(next_token_ : pagination_token option)
    ?query_result_rows:(query_result_rows_ : query_result_rows option)
    ?query_statistics:(query_statistics_ : query_statistics option)
    ?query_status:(query_status_ : query_status option) () =
  ({
     error_message = error_message_;
     next_token = next_token_;
     query_result_rows = query_result_rows_;
     query_statistics = query_statistics_;
     query_status = query_status_;
   }
    : get_query_results_response)

let make_get_query_results_request
    ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ : account_id option)
    ?max_query_results:(max_query_results_ : max_query_results option)
    ?next_token:(next_token_ : pagination_token option)
    ?event_data_store:(event_data_store_ : event_data_store_arn option)
    ~query_id:(query_id_ : uui_d) () =
  ({
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
     max_query_results = max_query_results_;
     next_token = next_token_;
     query_id = query_id_;
     event_data_store = event_data_store_;
   }
    : get_query_results_request)

let make_get_insight_selectors_response
    ?insights_destination:(insights_destination_ : event_data_store_arn option)
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option)
    ?insight_selectors:(insight_selectors_ : insight_selectors option)
    ?trail_ar_n:(trail_ar_n_ : string_ option) () =
  ({
     insights_destination = insights_destination_;
     event_data_store_arn = event_data_store_arn_;
     insight_selectors = insight_selectors_;
     trail_ar_n = trail_ar_n_;
   }
    : get_insight_selectors_response)

let make_get_insight_selectors_request
    ?event_data_store:(event_data_store_ : event_data_store_arn option)
    ?trail_name:(trail_name_ : string_ option) () =
  ({ event_data_store = event_data_store_; trail_name = trail_name_ }
    : get_insight_selectors_request)

let make_get_import_response ?import_statistics:(import_statistics_ : import_statistics option)
    ?updated_timestamp:(updated_timestamp_ : date option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?import_status:(import_status_ : import_status option)
    ?end_event_time:(end_event_time_ : date option)
    ?start_event_time:(start_event_time_ : date option)
    ?import_source:(import_source_ : import_source option)
    ?destinations:(destinations_ : import_destinations option)
    ?import_id:(import_id_ : uui_d option) () =
  ({
     import_statistics = import_statistics_;
     updated_timestamp = updated_timestamp_;
     created_timestamp = created_timestamp_;
     import_status = import_status_;
     end_event_time = end_event_time_;
     start_event_time = start_event_time_;
     import_source = import_source_;
     destinations = destinations_;
     import_id = import_id_;
   }
    : get_import_response)

let make_get_import_request ~import_id:(import_id_ : uui_d) () =
  ({ import_id = import_id_ } : get_import_request)

let make_get_event_selectors_response
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option)
    ?event_selectors:(event_selectors_ : event_selectors option)
    ?trail_ar_n:(trail_ar_n_ : string_ option) () =
  ({
     advanced_event_selectors = advanced_event_selectors_;
     event_selectors = event_selectors_;
     trail_ar_n = trail_ar_n_;
   }
    : get_event_selectors_response)

let make_get_event_selectors_request ~trail_name:(trail_name_ : string_) () =
  ({ trail_name = trail_name_ } : get_event_selectors_request)

let make_get_event_data_store_response ?partition_keys:(partition_keys_ : partition_key_list option)
    ?federation_role_arn:(federation_role_arn_ : federation_role_arn option)
    ?federation_status:(federation_status_ : federation_status option)
    ?billing_mode:(billing_mode_ : billing_mode option)
    ?kms_key_id:(kms_key_id_ : event_data_store_kms_key_id option)
    ?updated_timestamp:(updated_timestamp_ : date option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?retention_period:(retention_period_ : retention_period option)
    ?organization_enabled:(organization_enabled_ : boolean_ option)
    ?multi_region_enabled:(multi_region_enabled_ : boolean_ option)
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option)
    ?status:(status_ : event_data_store_status option) ?name:(name_ : event_data_store_name option)
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option) () =
  ({
     partition_keys = partition_keys_;
     federation_role_arn = federation_role_arn_;
     federation_status = federation_status_;
     billing_mode = billing_mode_;
     kms_key_id = kms_key_id_;
     updated_timestamp = updated_timestamp_;
     created_timestamp = created_timestamp_;
     termination_protection_enabled = termination_protection_enabled_;
     retention_period = retention_period_;
     organization_enabled = organization_enabled_;
     multi_region_enabled = multi_region_enabled_;
     advanced_event_selectors = advanced_event_selectors_;
     status = status_;
     name = name_;
     event_data_store_arn = event_data_store_arn_;
   }
    : get_event_data_store_response)

let make_get_event_data_store_request ~event_data_store:(event_data_store_ : event_data_store_arn)
    () =
  ({ event_data_store = event_data_store_ } : get_event_data_store_request)

let make_get_event_configuration_response
    ?context_key_selectors:(context_key_selectors_ : context_key_selectors option)
    ?max_event_size:(max_event_size_ : max_event_size option)
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option) () =
  ({
     context_key_selectors = context_key_selectors_;
     max_event_size = max_event_size_;
     event_data_store_arn = event_data_store_arn_;
   }
    : get_event_configuration_response)

let make_get_event_configuration_request ?event_data_store:(event_data_store_ : string_ option) () =
  ({ event_data_store = event_data_store_ } : get_event_configuration_request)

let make_get_dashboard_response
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?last_refresh_failure_reason:(last_refresh_failure_reason_ : error_message option)
    ?last_refresh_id:(last_refresh_id_ : refresh_id option)
    ?updated_timestamp:(updated_timestamp_ : date option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?refresh_schedule:(refresh_schedule_ : refresh_schedule option)
    ?widgets:(widgets_ : widget_list option) ?status:(status_ : dashboard_status option)
    ?type_:(type__ : dashboard_type option) ?dashboard_arn:(dashboard_arn_ : dashboard_arn option)
    () =
  ({
     termination_protection_enabled = termination_protection_enabled_;
     last_refresh_failure_reason = last_refresh_failure_reason_;
     last_refresh_id = last_refresh_id_;
     updated_timestamp = updated_timestamp_;
     created_timestamp = created_timestamp_;
     refresh_schedule = refresh_schedule_;
     widgets = widgets_;
     status = status_;
     type_ = type__;
     dashboard_arn = dashboard_arn_;
   }
    : get_dashboard_response)

let make_get_dashboard_request ~dashboard_id:(dashboard_id_ : dashboard_arn) () =
  ({ dashboard_id = dashboard_id_ } : get_dashboard_request)

let make_get_channel_response ?ingestion_status:(ingestion_status_ : ingestion_status option)
    ?destinations:(destinations_ : destinations option)
    ?source_config:(source_config_ : source_config option) ?source:(source_ : source option)
    ?name:(name_ : channel_name option) ?channel_arn:(channel_arn_ : channel_arn option) () =
  ({
     ingestion_status = ingestion_status_;
     destinations = destinations_;
     source_config = source_config_;
     source = source_;
     name = name_;
     channel_arn = channel_arn_;
   }
    : get_channel_response)

let make_get_channel_request ~channel:(channel_ : channel_arn) () =
  ({ channel = channel_ } : get_channel_request)

let make_generate_query_response
    ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ : account_id option)
    ?query_alias:(query_alias_ : query_alias option)
    ?query_statement:(query_statement_ : query_statement option) () =
  ({
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
     query_alias = query_alias_;
     query_statement = query_statement_;
   }
    : generate_query_response)

let make_generate_query_request ~prompt:(prompt_ : prompt)
    ~event_data_stores:(event_data_stores_ : event_data_store_list) () =
  ({ prompt = prompt_; event_data_stores = event_data_stores_ } : generate_query_request)

let make_enable_federation_response
    ?federation_role_arn:(federation_role_arn_ : federation_role_arn option)
    ?federation_status:(federation_status_ : federation_status option)
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option) () =
  ({
     federation_role_arn = federation_role_arn_;
     federation_status = federation_status_;
     event_data_store_arn = event_data_store_arn_;
   }
    : enable_federation_response)

let make_enable_federation_request ~federation_role_arn:(federation_role_arn_ : federation_role_arn)
    ~event_data_store:(event_data_store_ : event_data_store_arn) () =
  ({ federation_role_arn = federation_role_arn_; event_data_store = event_data_store_ }
    : enable_federation_request)

let make_disable_federation_response
    ?federation_status:(federation_status_ : federation_status option)
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option) () =
  ({ federation_status = federation_status_; event_data_store_arn = event_data_store_arn_ }
    : disable_federation_response)

let make_disable_federation_request ~event_data_store:(event_data_store_ : event_data_store_arn) ()
    =
  ({ event_data_store = event_data_store_ } : disable_federation_request)

let make_describe_trails_response ?trail_list:(trail_list_ : trail_list option) () =
  ({ trail_list = trail_list_ } : describe_trails_response)

let make_describe_trails_request ?include_shadow_trails:(include_shadow_trails_ : boolean_ option)
    ?trail_name_list:(trail_name_list_ : trail_name_list option) () =
  ({ include_shadow_trails = include_shadow_trails_; trail_name_list = trail_name_list_ }
    : describe_trails_request)

let make_describe_query_response
    ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ : account_id option)
    ?prompt:(prompt_ : prompt option) ?delivery_status:(delivery_status_ : delivery_status option)
    ?delivery_s3_uri:(delivery_s3_uri_ : delivery_s3_uri option)
    ?error_message:(error_message_ : error_message option)
    ?query_statistics:(query_statistics_ : query_statistics_for_describe_query option)
    ?query_status:(query_status_ : query_status option)
    ?query_string:(query_string_ : query_statement option) ?query_id:(query_id_ : uui_d option) () =
  ({
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
     prompt = prompt_;
     delivery_status = delivery_status_;
     delivery_s3_uri = delivery_s3_uri_;
     error_message = error_message_;
     query_statistics = query_statistics_;
     query_status = query_status_;
     query_string = query_string_;
     query_id = query_id_;
   }
    : describe_query_response)

let make_describe_query_request
    ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ : account_id option)
    ?refresh_id:(refresh_id_ : refresh_id option) ?query_alias:(query_alias_ : query_alias option)
    ?query_id:(query_id_ : uui_d option)
    ?event_data_store:(event_data_store_ : event_data_store_arn option) () =
  ({
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
     refresh_id = refresh_id_;
     query_alias = query_alias_;
     query_id = query_id_;
     event_data_store = event_data_store_;
   }
    : describe_query_request)

let make_deregister_organization_delegated_admin_response () = (() : unit)

let make_deregister_organization_delegated_admin_request
    ~delegated_admin_account_id:(delegated_admin_account_id_ : account_id) () =
  ({ delegated_admin_account_id = delegated_admin_account_id_ }
    : deregister_organization_delegated_admin_request)

let make_delete_trail_response () = (() : unit)
let make_delete_trail_request ~name:(name_ : string_) () = ({ name = name_ } : delete_trail_request)
let make_delete_resource_policy_response () = (() : unit)

let make_delete_resource_policy_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : delete_resource_policy_request)

let make_delete_event_data_store_response () = (() : unit)

let make_delete_event_data_store_request
    ~event_data_store:(event_data_store_ : event_data_store_arn) () =
  ({ event_data_store = event_data_store_ } : delete_event_data_store_request)

let make_delete_dashboard_response () = (() : unit)

let make_delete_dashboard_request ~dashboard_id:(dashboard_id_ : dashboard_arn) () =
  ({ dashboard_id = dashboard_id_ } : delete_dashboard_request)

let make_delete_channel_response () = (() : unit)

let make_delete_channel_request ~channel:(channel_ : channel_arn) () =
  ({ channel = channel_ } : delete_channel_request)

let make_create_trail_response ?is_organization_trail:(is_organization_trail_ : boolean_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?cloud_watch_logs_role_arn:(cloud_watch_logs_role_arn_ : string_ option)
    ?cloud_watch_logs_log_group_arn:(cloud_watch_logs_log_group_arn_ : string_ option)
    ?log_file_validation_enabled:(log_file_validation_enabled_ : boolean_ option)
    ?trail_ar_n:(trail_ar_n_ : string_ option)
    ?is_multi_region_trail:(is_multi_region_trail_ : boolean_ option)
    ?include_global_service_events:(include_global_service_events_ : boolean_ option)
    ?sns_topic_ar_n:(sns_topic_ar_n_ : string_ option)
    ?sns_topic_name:(sns_topic_name_ : string_ option)
    ?s3_key_prefix:(s3_key_prefix_ : string_ option)
    ?s3_bucket_name:(s3_bucket_name_ : string_ option) ?name:(name_ : string_ option) () =
  ({
     is_organization_trail = is_organization_trail_;
     kms_key_id = kms_key_id_;
     cloud_watch_logs_role_arn = cloud_watch_logs_role_arn_;
     cloud_watch_logs_log_group_arn = cloud_watch_logs_log_group_arn_;
     log_file_validation_enabled = log_file_validation_enabled_;
     trail_ar_n = trail_ar_n_;
     is_multi_region_trail = is_multi_region_trail_;
     include_global_service_events = include_global_service_events_;
     sns_topic_ar_n = sns_topic_ar_n_;
     sns_topic_name = sns_topic_name_;
     s3_key_prefix = s3_key_prefix_;
     s3_bucket_name = s3_bucket_name_;
     name = name_;
   }
    : create_trail_response)

let make_create_trail_request ?tags_list:(tags_list_ : tags_list option)
    ?is_organization_trail:(is_organization_trail_ : boolean_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?cloud_watch_logs_role_arn:(cloud_watch_logs_role_arn_ : string_ option)
    ?cloud_watch_logs_log_group_arn:(cloud_watch_logs_log_group_arn_ : string_ option)
    ?enable_log_file_validation:(enable_log_file_validation_ : boolean_ option)
    ?is_multi_region_trail:(is_multi_region_trail_ : boolean_ option)
    ?include_global_service_events:(include_global_service_events_ : boolean_ option)
    ?sns_topic_name:(sns_topic_name_ : string_ option)
    ?s3_key_prefix:(s3_key_prefix_ : string_ option) ~s3_bucket_name:(s3_bucket_name_ : string_)
    ~name:(name_ : string_) () =
  ({
     tags_list = tags_list_;
     is_organization_trail = is_organization_trail_;
     kms_key_id = kms_key_id_;
     cloud_watch_logs_role_arn = cloud_watch_logs_role_arn_;
     cloud_watch_logs_log_group_arn = cloud_watch_logs_log_group_arn_;
     enable_log_file_validation = enable_log_file_validation_;
     is_multi_region_trail = is_multi_region_trail_;
     include_global_service_events = include_global_service_events_;
     sns_topic_name = sns_topic_name_;
     s3_key_prefix = s3_key_prefix_;
     s3_bucket_name = s3_bucket_name_;
     name = name_;
   }
    : create_trail_request)

let make_create_event_data_store_response ?billing_mode:(billing_mode_ : billing_mode option)
    ?kms_key_id:(kms_key_id_ : event_data_store_kms_key_id option)
    ?updated_timestamp:(updated_timestamp_ : date option)
    ?created_timestamp:(created_timestamp_ : date option) ?tags_list:(tags_list_ : tags_list option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?retention_period:(retention_period_ : retention_period option)
    ?organization_enabled:(organization_enabled_ : boolean_ option)
    ?multi_region_enabled:(multi_region_enabled_ : boolean_ option)
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option)
    ?status:(status_ : event_data_store_status option) ?name:(name_ : event_data_store_name option)
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option) () =
  ({
     billing_mode = billing_mode_;
     kms_key_id = kms_key_id_;
     updated_timestamp = updated_timestamp_;
     created_timestamp = created_timestamp_;
     tags_list = tags_list_;
     termination_protection_enabled = termination_protection_enabled_;
     retention_period = retention_period_;
     organization_enabled = organization_enabled_;
     multi_region_enabled = multi_region_enabled_;
     advanced_event_selectors = advanced_event_selectors_;
     status = status_;
     name = name_;
     event_data_store_arn = event_data_store_arn_;
   }
    : create_event_data_store_response)

let make_create_event_data_store_request ?billing_mode:(billing_mode_ : billing_mode option)
    ?start_ingestion:(start_ingestion_ : boolean_ option)
    ?kms_key_id:(kms_key_id_ : event_data_store_kms_key_id option)
    ?tags_list:(tags_list_ : tags_list option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?retention_period:(retention_period_ : retention_period option)
    ?organization_enabled:(organization_enabled_ : boolean_ option)
    ?multi_region_enabled:(multi_region_enabled_ : boolean_ option)
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option)
    ~name:(name_ : event_data_store_name) () =
  ({
     billing_mode = billing_mode_;
     start_ingestion = start_ingestion_;
     kms_key_id = kms_key_id_;
     tags_list = tags_list_;
     termination_protection_enabled = termination_protection_enabled_;
     retention_period = retention_period_;
     organization_enabled = organization_enabled_;
     multi_region_enabled = multi_region_enabled_;
     advanced_event_selectors = advanced_event_selectors_;
     name = name_;
   }
    : create_event_data_store_request)

let make_create_dashboard_response
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?refresh_schedule:(refresh_schedule_ : refresh_schedule option)
    ?tags_list:(tags_list_ : tags_list option) ?widgets:(widgets_ : widget_list option)
    ?type_:(type__ : dashboard_type option) ?name:(name_ : dashboard_name option)
    ?dashboard_arn:(dashboard_arn_ : dashboard_arn option) () =
  ({
     termination_protection_enabled = termination_protection_enabled_;
     refresh_schedule = refresh_schedule_;
     tags_list = tags_list_;
     widgets = widgets_;
     type_ = type__;
     name = name_;
     dashboard_arn = dashboard_arn_;
   }
    : create_dashboard_response)

let make_create_dashboard_request ?widgets:(widgets_ : request_widget_list option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?tags_list:(tags_list_ : tags_list option)
    ?refresh_schedule:(refresh_schedule_ : refresh_schedule option) ~name:(name_ : dashboard_name)
    () =
  ({
     widgets = widgets_;
     termination_protection_enabled = termination_protection_enabled_;
     tags_list = tags_list_;
     refresh_schedule = refresh_schedule_;
     name = name_;
   }
    : create_dashboard_request)

let make_create_channel_response ?tags:(tags_ : tags_list option)
    ?destinations:(destinations_ : destinations option) ?source:(source_ : source option)
    ?name:(name_ : channel_name option) ?channel_arn:(channel_arn_ : channel_arn option) () =
  ({
     tags = tags_;
     destinations = destinations_;
     source = source_;
     name = name_;
     channel_arn = channel_arn_;
   }
    : create_channel_response)

let make_create_channel_request ?tags:(tags_ : tags_list option)
    ~destinations:(destinations_ : destinations) ~source:(source_ : source)
    ~name:(name_ : channel_name) () =
  ({ tags = tags_; destinations = destinations_; source = source_; name = name_ }
    : create_channel_request)

let make_cancel_query_response
    ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ : account_id option)
    ~query_status:(query_status_ : query_status) ~query_id:(query_id_ : uui_d) () =
  ({
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
     query_status = query_status_;
     query_id = query_id_;
   }
    : cancel_query_response)

let make_cancel_query_request
    ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ : account_id option)
    ?event_data_store:(event_data_store_ : event_data_store_arn option)
    ~query_id:(query_id_ : uui_d) () =
  ({
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
     query_id = query_id_;
     event_data_store = event_data_store_;
   }
    : cancel_query_request)

let make_add_tags_response () = (() : unit)

let make_add_tags_request ~tags_list:(tags_list_ : tags_list) ~resource_id:(resource_id_ : string_)
    () =
  ({ tags_list = tags_list_; resource_id = resource_id_ } : add_tags_request)
