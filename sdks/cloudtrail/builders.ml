open Types

let make_add_tags_response () = (() : unit)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ key = key_; value = value_ } : tag)

let make_add_tags_request ~resource_id:(resource_id_ : string_) ~tags_list:(tags_list_ : tags_list)
    () =
  ({ resource_id = resource_id_; tags_list = tags_list_ } : add_tags_request)

let make_advanced_field_selector ?equals:(equals_ : operator option)
    ?starts_with:(starts_with_ : operator option) ?ends_with:(ends_with_ : operator option)
    ?not_equals:(not_equals_ : operator option)
    ?not_starts_with:(not_starts_with_ : operator option)
    ?not_ends_with:(not_ends_with_ : operator option) ~field:(field_ : selector_field) () =
  ({
     field = field_;
     equals = equals_;
     starts_with = starts_with_;
     ends_with = ends_with_;
     not_equals = not_equals_;
     not_starts_with = not_starts_with_;
     not_ends_with = not_ends_with_;
   }
    : advanced_field_selector)

let make_advanced_event_selector ?name:(name_ : selector_name option)
    ~field_selectors:(field_selectors_ : advanced_field_selectors) () =
  ({ name = name_; field_selectors = field_selectors_ } : advanced_event_selector)

let make_aggregation_configuration ~templates:(templates_ : templates)
    ~event_category:(event_category_ : event_category_aggregation) () =
  ({ templates = templates_; event_category = event_category_ } : aggregation_configuration)

let make_cancel_query_response
    ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ : account_id option)
    ~query_id:(query_id_ : uui_d) ~query_status:(query_status_ : query_status) () =
  ({
     query_id = query_id_;
     query_status = query_status_;
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
   }
    : cancel_query_response)

let make_cancel_query_request ?event_data_store:(event_data_store_ : event_data_store_arn option)
    ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ : account_id option)
    ~query_id:(query_id_ : uui_d) () =
  ({
     event_data_store = event_data_store_;
     query_id = query_id_;
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
   }
    : cancel_query_request)

let make_channel ?channel_arn:(channel_arn_ : channel_arn option)
    ?name:(name_ : channel_name option) () =
  ({ channel_arn = channel_arn_; name = name_ } : channel)

let make_update_trail_response ?name:(name_ : string_ option)
    ?s3_bucket_name:(s3_bucket_name_ : string_ option)
    ?s3_key_prefix:(s3_key_prefix_ : string_ option)
    ?sns_topic_name:(sns_topic_name_ : string_ option)
    ?sns_topic_ar_n:(sns_topic_ar_n_ : string_ option)
    ?include_global_service_events:(include_global_service_events_ : boolean_ option)
    ?is_multi_region_trail:(is_multi_region_trail_ : boolean_ option)
    ?trail_ar_n:(trail_ar_n_ : string_ option)
    ?log_file_validation_enabled:(log_file_validation_enabled_ : boolean_ option)
    ?cloud_watch_logs_log_group_arn:(cloud_watch_logs_log_group_arn_ : string_ option)
    ?cloud_watch_logs_role_arn:(cloud_watch_logs_role_arn_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?is_organization_trail:(is_organization_trail_ : boolean_ option) () =
  ({
     name = name_;
     s3_bucket_name = s3_bucket_name_;
     s3_key_prefix = s3_key_prefix_;
     sns_topic_name = sns_topic_name_;
     sns_topic_ar_n = sns_topic_ar_n_;
     include_global_service_events = include_global_service_events_;
     is_multi_region_trail = is_multi_region_trail_;
     trail_ar_n = trail_ar_n_;
     log_file_validation_enabled = log_file_validation_enabled_;
     cloud_watch_logs_log_group_arn = cloud_watch_logs_log_group_arn_;
     cloud_watch_logs_role_arn = cloud_watch_logs_role_arn_;
     kms_key_id = kms_key_id_;
     is_organization_trail = is_organization_trail_;
   }
    : update_trail_response)

let make_update_trail_request ?s3_bucket_name:(s3_bucket_name_ : string_ option)
    ?s3_key_prefix:(s3_key_prefix_ : string_ option)
    ?sns_topic_name:(sns_topic_name_ : string_ option)
    ?include_global_service_events:(include_global_service_events_ : boolean_ option)
    ?is_multi_region_trail:(is_multi_region_trail_ : boolean_ option)
    ?enable_log_file_validation:(enable_log_file_validation_ : boolean_ option)
    ?cloud_watch_logs_log_group_arn:(cloud_watch_logs_log_group_arn_ : string_ option)
    ?cloud_watch_logs_role_arn:(cloud_watch_logs_role_arn_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?is_organization_trail:(is_organization_trail_ : boolean_ option) ~name:(name_ : string_) () =
  ({
     name = name_;
     s3_bucket_name = s3_bucket_name_;
     s3_key_prefix = s3_key_prefix_;
     sns_topic_name = sns_topic_name_;
     include_global_service_events = include_global_service_events_;
     is_multi_region_trail = is_multi_region_trail_;
     enable_log_file_validation = enable_log_file_validation_;
     cloud_watch_logs_log_group_arn = cloud_watch_logs_log_group_arn_;
     cloud_watch_logs_role_arn = cloud_watch_logs_role_arn_;
     kms_key_id = kms_key_id_;
     is_organization_trail = is_organization_trail_;
   }
    : update_trail_request)

let make_update_event_data_store_response
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option)
    ?name:(name_ : event_data_store_name option) ?status:(status_ : event_data_store_status option)
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option)
    ?multi_region_enabled:(multi_region_enabled_ : boolean_ option)
    ?organization_enabled:(organization_enabled_ : boolean_ option)
    ?retention_period:(retention_period_ : retention_period option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?updated_timestamp:(updated_timestamp_ : date option)
    ?kms_key_id:(kms_key_id_ : event_data_store_kms_key_id option)
    ?billing_mode:(billing_mode_ : billing_mode option)
    ?federation_status:(federation_status_ : federation_status option)
    ?federation_role_arn:(federation_role_arn_ : federation_role_arn option) () =
  ({
     event_data_store_arn = event_data_store_arn_;
     name = name_;
     status = status_;
     advanced_event_selectors = advanced_event_selectors_;
     multi_region_enabled = multi_region_enabled_;
     organization_enabled = organization_enabled_;
     retention_period = retention_period_;
     termination_protection_enabled = termination_protection_enabled_;
     created_timestamp = created_timestamp_;
     updated_timestamp = updated_timestamp_;
     kms_key_id = kms_key_id_;
     billing_mode = billing_mode_;
     federation_status = federation_status_;
     federation_role_arn = federation_role_arn_;
   }
    : update_event_data_store_response)

let make_update_event_data_store_request ?name:(name_ : event_data_store_name option)
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option)
    ?multi_region_enabled:(multi_region_enabled_ : boolean_ option)
    ?organization_enabled:(organization_enabled_ : boolean_ option)
    ?retention_period:(retention_period_ : retention_period option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?kms_key_id:(kms_key_id_ : event_data_store_kms_key_id option)
    ?billing_mode:(billing_mode_ : billing_mode option)
    ~event_data_store:(event_data_store_ : event_data_store_arn) () =
  ({
     event_data_store = event_data_store_;
     name = name_;
     advanced_event_selectors = advanced_event_selectors_;
     multi_region_enabled = multi_region_enabled_;
     organization_enabled = organization_enabled_;
     retention_period = retention_period_;
     termination_protection_enabled = termination_protection_enabled_;
     kms_key_id = kms_key_id_;
     billing_mode = billing_mode_;
   }
    : update_event_data_store_request)

let make_refresh_schedule_frequency ?unit_:(unit__ : refresh_schedule_frequency_unit option)
    ?value:(value_ : refresh_schedule_frequency_value option) () =
  ({ unit_ = unit__; value = value_ } : refresh_schedule_frequency)

let make_refresh_schedule ?frequency:(frequency_ : refresh_schedule_frequency option)
    ?status:(status_ : refresh_schedule_status option)
    ?time_of_day:(time_of_day_ : time_of_day option) () =
  ({ frequency = frequency_; status = status_; time_of_day = time_of_day_ } : refresh_schedule)

let make_widget ?query_alias:(query_alias_ : query_alias option)
    ?query_statement:(query_statement_ : query_statement option)
    ?query_parameters:(query_parameters_ : query_parameters option)
    ?view_properties:(view_properties_ : view_properties_map option) () =
  ({
     query_alias = query_alias_;
     query_statement = query_statement_;
     query_parameters = query_parameters_;
     view_properties = view_properties_;
   }
    : widget)

let make_update_dashboard_response ?dashboard_arn:(dashboard_arn_ : dashboard_arn option)
    ?name:(name_ : dashboard_name option) ?type_:(type__ : dashboard_type option)
    ?widgets:(widgets_ : widget_list option)
    ?refresh_schedule:(refresh_schedule_ : refresh_schedule option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?updated_timestamp:(updated_timestamp_ : date option) () =
  ({
     dashboard_arn = dashboard_arn_;
     name = name_;
     type_ = type__;
     widgets = widgets_;
     refresh_schedule = refresh_schedule_;
     termination_protection_enabled = termination_protection_enabled_;
     created_timestamp = created_timestamp_;
     updated_timestamp = updated_timestamp_;
   }
    : update_dashboard_response)

let make_request_widget ?query_parameters:(query_parameters_ : query_parameters option)
    ~query_statement:(query_statement_ : query_statement)
    ~view_properties:(view_properties_ : view_properties_map) () =
  ({
     query_statement = query_statement_;
     query_parameters = query_parameters_;
     view_properties = view_properties_;
   }
    : request_widget)

let make_update_dashboard_request ?widgets:(widgets_ : request_widget_list option)
    ?refresh_schedule:(refresh_schedule_ : refresh_schedule option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ~dashboard_id:(dashboard_id_ : dashboard_arn) () =
  ({
     dashboard_id = dashboard_id_;
     widgets = widgets_;
     refresh_schedule = refresh_schedule_;
     termination_protection_enabled = termination_protection_enabled_;
   }
    : update_dashboard_request)

let make_destination ~type_:(type__ : destination_type) ~location:(location_ : location) () =
  ({ type_ = type__; location = location_ } : destination)

let make_update_channel_response ?channel_arn:(channel_arn_ : channel_arn option)
    ?name:(name_ : channel_name option) ?source:(source_ : source option)
    ?destinations:(destinations_ : destinations option) () =
  ({ channel_arn = channel_arn_; name = name_; source = source_; destinations = destinations_ }
    : update_channel_response)

let make_update_channel_request ?destinations:(destinations_ : destinations option)
    ?name:(name_ : channel_name option) ~channel:(channel_ : channel_arn) () =
  ({ channel = channel_; destinations = destinations_; name = name_ } : update_channel_request)

let make_stop_logging_response () = (() : unit)
let make_stop_logging_request ~name:(name_ : string_) () = ({ name = name_ } : stop_logging_request)

let make_import_statistics ?prefixes_found:(prefixes_found_ : long option)
    ?prefixes_completed:(prefixes_completed_ : long option)
    ?files_completed:(files_completed_ : long option)
    ?events_completed:(events_completed_ : long option)
    ?failed_entries:(failed_entries_ : long option) () =
  ({
     prefixes_found = prefixes_found_;
     prefixes_completed = prefixes_completed_;
     files_completed = files_completed_;
     events_completed = events_completed_;
     failed_entries = failed_entries_;
   }
    : import_statistics)

let make_s3_import_source ~s3_location_uri:(s3_location_uri_ : string_)
    ~s3_bucket_region:(s3_bucket_region_ : string_)
    ~s3_bucket_access_role_arn:(s3_bucket_access_role_arn_ : string_) () =
  ({
     s3_location_uri = s3_location_uri_;
     s3_bucket_region = s3_bucket_region_;
     s3_bucket_access_role_arn = s3_bucket_access_role_arn_;
   }
    : s3_import_source)

let make_import_source ~s3:(s3_ : s3_import_source) () = ({ s3 = s3_ } : import_source)

let make_stop_import_response ?import_id:(import_id_ : uui_d option)
    ?import_source:(import_source_ : import_source option)
    ?destinations:(destinations_ : import_destinations option)
    ?import_status:(import_status_ : import_status option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?updated_timestamp:(updated_timestamp_ : date option)
    ?start_event_time:(start_event_time_ : date option)
    ?end_event_time:(end_event_time_ : date option)
    ?import_statistics:(import_statistics_ : import_statistics option) () =
  ({
     import_id = import_id_;
     import_source = import_source_;
     destinations = destinations_;
     import_status = import_status_;
     created_timestamp = created_timestamp_;
     updated_timestamp = updated_timestamp_;
     start_event_time = start_event_time_;
     end_event_time = end_event_time_;
     import_statistics = import_statistics_;
   }
    : stop_import_response)

let make_stop_import_request ~import_id:(import_id_ : uui_d) () =
  ({ import_id = import_id_ } : stop_import_request)

let make_stop_event_data_store_ingestion_response () = (() : unit)

let make_stop_event_data_store_ingestion_request
    ~event_data_store:(event_data_store_ : event_data_store_arn) () =
  ({ event_data_store = event_data_store_ } : stop_event_data_store_ingestion_request)

let make_start_query_response ?query_id:(query_id_ : uui_d option)
    ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ : account_id option) () =
  ({ query_id = query_id_; event_data_store_owner_account_id = event_data_store_owner_account_id_ }
    : start_query_response)

let make_start_query_request ?query_statement:(query_statement_ : query_statement option)
    ?delivery_s3_uri:(delivery_s3_uri_ : delivery_s3_uri option)
    ?query_alias:(query_alias_ : query_alias option)
    ?query_parameters:(query_parameters_ : query_parameters option)
    ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ : account_id option) () =
  ({
     query_statement = query_statement_;
     delivery_s3_uri = delivery_s3_uri_;
     query_alias = query_alias_;
     query_parameters = query_parameters_;
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
   }
    : start_query_request)

let make_start_logging_response () = (() : unit)

let make_start_logging_request ~name:(name_ : string_) () =
  ({ name = name_ } : start_logging_request)

let make_start_import_response ?import_id:(import_id_ : uui_d option)
    ?destinations:(destinations_ : import_destinations option)
    ?import_source:(import_source_ : import_source option)
    ?start_event_time:(start_event_time_ : date option)
    ?end_event_time:(end_event_time_ : date option)
    ?import_status:(import_status_ : import_status option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?updated_timestamp:(updated_timestamp_ : date option) () =
  ({
     import_id = import_id_;
     destinations = destinations_;
     import_source = import_source_;
     start_event_time = start_event_time_;
     end_event_time = end_event_time_;
     import_status = import_status_;
     created_timestamp = created_timestamp_;
     updated_timestamp = updated_timestamp_;
   }
    : start_import_response)

let make_start_import_request ?destinations:(destinations_ : import_destinations option)
    ?import_source:(import_source_ : import_source option)
    ?start_event_time:(start_event_time_ : date option)
    ?end_event_time:(end_event_time_ : date option) ?import_id:(import_id_ : uui_d option) () =
  ({
     destinations = destinations_;
     import_source = import_source_;
     start_event_time = start_event_time_;
     end_event_time = end_event_time_;
     import_id = import_id_;
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
  ({ dashboard_id = dashboard_id_; query_parameter_values = query_parameter_values_ }
    : start_dashboard_refresh_request)

let make_search_sample_queries_response
    ?search_results:(search_results_ : search_sample_queries_search_results option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ search_results = search_results_; next_token = next_token_ } : search_sample_queries_response)

let make_search_sample_queries_request
    ?max_results:(max_results_ : search_sample_queries_max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ~search_phrase:(search_phrase_ : search_sample_queries_search_phrase) () =
  ({ search_phrase = search_phrase_; max_results = max_results_; next_token = next_token_ }
    : search_sample_queries_request)

let make_restore_event_data_store_response
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option)
    ?name:(name_ : event_data_store_name option) ?status:(status_ : event_data_store_status option)
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option)
    ?multi_region_enabled:(multi_region_enabled_ : boolean_ option)
    ?organization_enabled:(organization_enabled_ : boolean_ option)
    ?retention_period:(retention_period_ : retention_period option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?updated_timestamp:(updated_timestamp_ : date option)
    ?kms_key_id:(kms_key_id_ : event_data_store_kms_key_id option)
    ?billing_mode:(billing_mode_ : billing_mode option) () =
  ({
     event_data_store_arn = event_data_store_arn_;
     name = name_;
     status = status_;
     advanced_event_selectors = advanced_event_selectors_;
     multi_region_enabled = multi_region_enabled_;
     organization_enabled = organization_enabled_;
     retention_period = retention_period_;
     termination_protection_enabled = termination_protection_enabled_;
     created_timestamp = created_timestamp_;
     updated_timestamp = updated_timestamp_;
     kms_key_id = kms_key_id_;
     billing_mode = billing_mode_;
   }
    : restore_event_data_store_response)

let make_restore_event_data_store_request
    ~event_data_store:(event_data_store_ : event_data_store_arn) () =
  ({ event_data_store = event_data_store_ } : restore_event_data_store_request)

let make_remove_tags_response () = (() : unit)

let make_remove_tags_request ~resource_id:(resource_id_ : string_)
    ~tags_list:(tags_list_ : tags_list) () =
  ({ resource_id = resource_id_; tags_list = tags_list_ } : remove_tags_request)

let make_register_organization_delegated_admin_response () = (() : unit)

let make_register_organization_delegated_admin_request
    ~member_account_id:(member_account_id_ : account_id) () =
  ({ member_account_id = member_account_id_ } : register_organization_delegated_admin_request)

let make_put_resource_policy_response ?resource_arn:(resource_arn_ : resource_arn option)
    ?resource_policy:(resource_policy_ : resource_policy option)
    ?delegated_admin_resource_policy:(delegated_admin_resource_policy_ : resource_policy option) ()
    =
  ({
     resource_arn = resource_arn_;
     resource_policy = resource_policy_;
     delegated_admin_resource_policy = delegated_admin_resource_policy_;
   }
    : put_resource_policy_response)

let make_put_resource_policy_request ~resource_arn:(resource_arn_ : resource_arn)
    ~resource_policy:(resource_policy_ : resource_policy) () =
  ({ resource_arn = resource_arn_; resource_policy = resource_policy_ }
    : put_resource_policy_request)

let make_insight_selector ?insight_type:(insight_type_ : insight_type option)
    ?event_categories:(event_categories_ : source_event_categories option) () =
  ({ insight_type = insight_type_; event_categories = event_categories_ } : insight_selector)

let make_put_insight_selectors_response ?trail_ar_n:(trail_ar_n_ : string_ option)
    ?insight_selectors:(insight_selectors_ : insight_selectors option)
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option)
    ?insights_destination:(insights_destination_ : event_data_store_arn option) () =
  ({
     trail_ar_n = trail_ar_n_;
     insight_selectors = insight_selectors_;
     event_data_store_arn = event_data_store_arn_;
     insights_destination = insights_destination_;
   }
    : put_insight_selectors_response)

let make_put_insight_selectors_request ?trail_name:(trail_name_ : string_ option)
    ?event_data_store:(event_data_store_ : event_data_store_arn option)
    ?insights_destination:(insights_destination_ : event_data_store_arn option)
    ~insight_selectors:(insight_selectors_ : insight_selectors) () =
  ({
     trail_name = trail_name_;
     insight_selectors = insight_selectors_;
     event_data_store = event_data_store_;
     insights_destination = insights_destination_;
   }
    : put_insight_selectors_request)

let make_data_resource ?type_:(type__ : string_ option)
    ?values:(values_ : data_resource_values option) () =
  ({ type_ = type__; values = values_ } : data_resource)

let make_event_selector ?read_write_type:(read_write_type_ : read_write_type option)
    ?include_management_events:(include_management_events_ : boolean_ option)
    ?data_resources:(data_resources_ : data_resources option)
    ?exclude_management_event_sources:
      (exclude_management_event_sources_ : exclude_management_event_sources option) () =
  ({
     read_write_type = read_write_type_;
     include_management_events = include_management_events_;
     data_resources = data_resources_;
     exclude_management_event_sources = exclude_management_event_sources_;
   }
    : event_selector)

let make_put_event_selectors_response ?trail_ar_n:(trail_ar_n_ : string_ option)
    ?event_selectors:(event_selectors_ : event_selectors option)
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option) () =
  ({
     trail_ar_n = trail_ar_n_;
     event_selectors = event_selectors_;
     advanced_event_selectors = advanced_event_selectors_;
   }
    : put_event_selectors_response)

let make_put_event_selectors_request ?event_selectors:(event_selectors_ : event_selectors option)
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option)
    ~trail_name:(trail_name_ : string_) () =
  ({
     trail_name = trail_name_;
     event_selectors = event_selectors_;
     advanced_event_selectors = advanced_event_selectors_;
   }
    : put_event_selectors_request)

let make_context_key_selector ~type_:(type__ : type_) ~equals:(equals_ : operator_target_list) () =
  ({ type_ = type__; equals = equals_ } : context_key_selector)

let make_put_event_configuration_response ?trail_ar_n:(trail_ar_n_ : string_ option)
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option)
    ?max_event_size:(max_event_size_ : max_event_size option)
    ?context_key_selectors:(context_key_selectors_ : context_key_selectors option)
    ?aggregation_configurations:(aggregation_configurations_ : aggregation_configurations option) ()
    =
  ({
     trail_ar_n = trail_ar_n_;
     event_data_store_arn = event_data_store_arn_;
     max_event_size = max_event_size_;
     context_key_selectors = context_key_selectors_;
     aggregation_configurations = aggregation_configurations_;
   }
    : put_event_configuration_response)

let make_put_event_configuration_request ?trail_name:(trail_name_ : string_ option)
    ?event_data_store:(event_data_store_ : string_ option)
    ?max_event_size:(max_event_size_ : max_event_size option)
    ?context_key_selectors:(context_key_selectors_ : context_key_selectors option)
    ?aggregation_configurations:(aggregation_configurations_ : aggregation_configurations option) ()
    =
  ({
     trail_name = trail_name_;
     event_data_store = event_data_store_;
     max_event_size = max_event_size_;
     context_key_selectors = context_key_selectors_;
     aggregation_configurations = aggregation_configurations_;
   }
    : put_event_configuration_request)

let make_resource ?resource_type:(resource_type_ : string_ option)
    ?resource_name:(resource_name_ : string_ option) () =
  ({ resource_type = resource_type_; resource_name = resource_name_ } : resource)

let make_event ?event_id:(event_id_ : string_ option) ?event_name:(event_name_ : string_ option)
    ?read_only:(read_only_ : string_ option) ?access_key_id:(access_key_id_ : string_ option)
    ?event_time:(event_time_ : date option) ?event_source:(event_source_ : string_ option)
    ?username:(username_ : string_ option) ?resources:(resources_ : resource_list option)
    ?cloud_trail_event:(cloud_trail_event_ : string_ option) () =
  ({
     event_id = event_id_;
     event_name = event_name_;
     read_only = read_only_;
     access_key_id = access_key_id_;
     event_time = event_time_;
     event_source = event_source_;
     username = username_;
     resources = resources_;
     cloud_trail_event = cloud_trail_event_;
   }
    : event)

let make_lookup_events_response ?events:(events_ : events_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ events = events_; next_token = next_token_ } : lookup_events_response)

let make_lookup_attribute ~attribute_key:(attribute_key_ : lookup_attribute_key)
    ~attribute_value:(attribute_value_ : lookup_attribute_value) () =
  ({ attribute_key = attribute_key_; attribute_value = attribute_value_ } : lookup_attribute)

let make_lookup_events_request
    ?lookup_attributes:(lookup_attributes_ : lookup_attributes_list option)
    ?start_time:(start_time_ : date option) ?end_time:(end_time_ : date option)
    ?event_category:(event_category_ : event_category option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     lookup_attributes = lookup_attributes_;
     start_time = start_time_;
     end_time = end_time_;
     event_category = event_category_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : lookup_events_request)

let make_trail_info ?trail_ar_n:(trail_ar_n_ : string_ option) ?name:(name_ : string_ option)
    ?home_region:(home_region_ : string_ option) () =
  ({ trail_ar_n = trail_ar_n_; name = name_; home_region = home_region_ } : trail_info)

let make_list_trails_response ?trails:(trails_ : trails option)
    ?next_token:(next_token_ : string_ option) () =
  ({ trails = trails_; next_token = next_token_ } : list_trails_response)

let make_list_trails_request ?next_token:(next_token_ : string_ option) () =
  ({ next_token = next_token_ } : list_trails_request)

let make_resource_tag ?resource_id:(resource_id_ : string_ option)
    ?tags_list:(tags_list_ : tags_list option) () =
  ({ resource_id = resource_id_; tags_list = tags_list_ } : resource_tag)

let make_list_tags_response ?resource_tag_list:(resource_tag_list_ : resource_tag_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ resource_tag_list = resource_tag_list_; next_token = next_token_ } : list_tags_response)

let make_list_tags_request ?next_token:(next_token_ : string_ option)
    ~resource_id_list:(resource_id_list_ : resource_id_list) () =
  ({ resource_id_list = resource_id_list_; next_token = next_token_ } : list_tags_request)

let make_query ?query_id:(query_id_ : uui_d option)
    ?query_status:(query_status_ : query_status option)
    ?creation_time:(creation_time_ : date option) () =
  ({ query_id = query_id_; query_status = query_status_; creation_time = creation_time_ } : query)

let make_list_queries_response ?queries:(queries_ : queries option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ queries = queries_; next_token = next_token_ } : list_queries_response)

let make_list_queries_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : list_queries_max_results_count option)
    ?start_time:(start_time_ : date option) ?end_time:(end_time_ : date option)
    ?query_status:(query_status_ : query_status option)
    ~event_data_store:(event_data_store_ : event_data_store_arn) () =
  ({
     event_data_store = event_data_store_;
     next_token = next_token_;
     max_results = max_results_;
     start_time = start_time_;
     end_time = end_time_;
     query_status = query_status_;
   }
    : list_queries_request)

let make_public_key ?value:(value_ : byte_buffer option)
    ?validity_start_time:(validity_start_time_ : date option)
    ?validity_end_time:(validity_end_time_ : date option)
    ?fingerprint:(fingerprint_ : string_ option) () =
  ({
     value = value_;
     validity_start_time = validity_start_time_;
     validity_end_time = validity_end_time_;
     fingerprint = fingerprint_;
   }
    : public_key)

let make_list_public_keys_response ?public_key_list:(public_key_list_ : public_key_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ public_key_list = public_key_list_; next_token = next_token_ } : list_public_keys_response)

let make_list_public_keys_request ?start_time:(start_time_ : date option)
    ?end_time:(end_time_ : date option) ?next_token:(next_token_ : string_ option) () =
  ({ start_time = start_time_; end_time = end_time_; next_token = next_token_ }
    : list_public_keys_request)

let make_list_insights_metric_data_response ?trail_ar_n:(trail_ar_n_ : string_ option)
    ?event_source:(event_source_ : event_source option)
    ?event_name:(event_name_ : event_name option)
    ?insight_type:(insight_type_ : insight_type option)
    ?error_code:(error_code_ : error_code option) ?timestamps:(timestamps_ : timestamps option)
    ?values:(values_ : insights_metric_values option)
    ?next_token:(next_token_ : insights_metric_next_token option) () =
  ({
     trail_ar_n = trail_ar_n_;
     event_source = event_source_;
     event_name = event_name_;
     insight_type = insight_type_;
     error_code = error_code_;
     timestamps = timestamps_;
     values = values_;
     next_token = next_token_;
   }
    : list_insights_metric_data_response)

let make_list_insights_metric_data_request ?trail_name:(trail_name_ : string_ option)
    ?error_code:(error_code_ : error_code option) ?start_time:(start_time_ : date option)
    ?end_time:(end_time_ : date option) ?period:(period_ : insights_metric_period option)
    ?data_type:(data_type_ : insights_metric_data_type option)
    ?max_results:(max_results_ : insights_metric_max_results option)
    ?next_token:(next_token_ : insights_metric_next_token option)
    ~event_source:(event_source_ : event_source) ~event_name:(event_name_ : event_name)
    ~insight_type:(insight_type_ : insight_type) () =
  ({
     trail_name = trail_name_;
     event_source = event_source_;
     event_name = event_name_;
     insight_type = insight_type_;
     error_code = error_code_;
     start_time = start_time_;
     end_time = end_time_;
     period = period_;
     data_type = data_type_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_insights_metric_data_request)

let make_list_insights_data_response ?events:(events_ : events_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ events = events_; next_token = next_token_ } : list_insights_data_response)

let make_list_insights_data_request ?dimensions:(dimensions_ : list_insights_data_dimensions option)
    ?start_time:(start_time_ : date option) ?end_time:(end_time_ : date option)
    ?max_results:(max_results_ : list_insights_data_max_results_count option)
    ?next_token:(next_token_ : pagination_token option)
    ~insight_source:(insight_source_ : resource_arn)
    ~data_type:(data_type_ : list_insights_data_type) () =
  ({
     insight_source = insight_source_;
     data_type = data_type_;
     dimensions = dimensions_;
     start_time = start_time_;
     end_time = end_time_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_insights_data_request)

let make_imports_list_item ?import_id:(import_id_ : uui_d option)
    ?import_status:(import_status_ : import_status option)
    ?destinations:(destinations_ : import_destinations option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?updated_timestamp:(updated_timestamp_ : date option) () =
  ({
     import_id = import_id_;
     import_status = import_status_;
     destinations = destinations_;
     created_timestamp = created_timestamp_;
     updated_timestamp = updated_timestamp_;
   }
    : imports_list_item)

let make_list_imports_response ?imports:(imports_ : imports_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ imports = imports_; next_token = next_token_ } : list_imports_response)

let make_list_imports_request ?max_results:(max_results_ : list_imports_max_results_count option)
    ?destination:(destination_ : event_data_store_arn option)
    ?import_status:(import_status_ : import_status option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({
     max_results = max_results_;
     destination = destination_;
     import_status = import_status_;
     next_token = next_token_;
   }
    : list_imports_request)

let make_import_failure_list_item ?location:(location_ : string_ option)
    ?status:(status_ : import_failure_status option) ?error_type:(error_type_ : string_ option)
    ?error_message:(error_message_ : string_ option)
    ?last_updated_time:(last_updated_time_ : date option) () =
  ({
     location = location_;
     status = status_;
     error_type = error_type_;
     error_message = error_message_;
     last_updated_time = last_updated_time_;
   }
    : import_failure_list_item)

let make_list_import_failures_response ?failures:(failures_ : import_failure_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ failures = failures_; next_token = next_token_ } : list_import_failures_response)

let make_list_import_failures_request
    ?max_results:(max_results_ : list_import_failures_max_results_count option)
    ?next_token:(next_token_ : pagination_token option) ~import_id:(import_id_ : uui_d) () =
  ({ import_id = import_id_; max_results = max_results_; next_token = next_token_ }
    : list_import_failures_request)

let make_event_data_store
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option)
    ?name:(name_ : event_data_store_name option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?status:(status_ : event_data_store_status option)
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option)
    ?multi_region_enabled:(multi_region_enabled_ : boolean_ option)
    ?organization_enabled:(organization_enabled_ : boolean_ option)
    ?retention_period:(retention_period_ : retention_period option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?updated_timestamp:(updated_timestamp_ : date option) () =
  ({
     event_data_store_arn = event_data_store_arn_;
     name = name_;
     termination_protection_enabled = termination_protection_enabled_;
     status = status_;
     advanced_event_selectors = advanced_event_selectors_;
     multi_region_enabled = multi_region_enabled_;
     organization_enabled = organization_enabled_;
     retention_period = retention_period_;
     created_timestamp = created_timestamp_;
     updated_timestamp = updated_timestamp_;
   }
    : event_data_store)

let make_list_event_data_stores_response
    ?event_data_stores:(event_data_stores_ : event_data_stores option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ event_data_stores = event_data_stores_; next_token = next_token_ }
    : list_event_data_stores_response)

let make_list_event_data_stores_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : list_event_data_stores_max_results_count option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_event_data_stores_request)

let make_dashboard_detail ?dashboard_arn:(dashboard_arn_ : dashboard_arn option)
    ?type_:(type__ : dashboard_type option) () =
  ({ dashboard_arn = dashboard_arn_; type_ = type__ } : dashboard_detail)

let make_list_dashboards_response ?dashboards:(dashboards_ : dashboards option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ dashboards = dashboards_; next_token = next_token_ } : list_dashboards_response)

let make_list_dashboards_request ?name_prefix:(name_prefix_ : dashboard_name option)
    ?type_:(type__ : dashboard_type option) ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : list_dashboards_max_results_count option) () =
  ({
     name_prefix = name_prefix_;
     type_ = type__;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_dashboards_request)

let make_list_channels_response ?channels:(channels_ : channels option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ channels = channels_; next_token = next_token_ } : list_channels_response)

let make_list_channels_request ?max_results:(max_results_ : list_channels_max_results_count option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_channels_request)

let make_get_trail_status_response ?is_logging:(is_logging_ : boolean_ option)
    ?latest_delivery_error:(latest_delivery_error_ : string_ option)
    ?latest_notification_error:(latest_notification_error_ : string_ option)
    ?latest_delivery_time:(latest_delivery_time_ : date option)
    ?latest_notification_time:(latest_notification_time_ : date option)
    ?start_logging_time:(start_logging_time_ : date option)
    ?stop_logging_time:(stop_logging_time_ : date option)
    ?latest_cloud_watch_logs_delivery_error:
      (latest_cloud_watch_logs_delivery_error_ : string_ option)
    ?latest_cloud_watch_logs_delivery_time:(latest_cloud_watch_logs_delivery_time_ : date option)
    ?latest_digest_delivery_time:(latest_digest_delivery_time_ : date option)
    ?latest_digest_delivery_error:(latest_digest_delivery_error_ : string_ option)
    ?latest_delivery_attempt_time:(latest_delivery_attempt_time_ : string_ option)
    ?latest_notification_attempt_time:(latest_notification_attempt_time_ : string_ option)
    ?latest_notification_attempt_succeeded:(latest_notification_attempt_succeeded_ : string_ option)
    ?latest_delivery_attempt_succeeded:(latest_delivery_attempt_succeeded_ : string_ option)
    ?time_logging_started:(time_logging_started_ : string_ option)
    ?time_logging_stopped:(time_logging_stopped_ : string_ option) () =
  ({
     is_logging = is_logging_;
     latest_delivery_error = latest_delivery_error_;
     latest_notification_error = latest_notification_error_;
     latest_delivery_time = latest_delivery_time_;
     latest_notification_time = latest_notification_time_;
     start_logging_time = start_logging_time_;
     stop_logging_time = stop_logging_time_;
     latest_cloud_watch_logs_delivery_error = latest_cloud_watch_logs_delivery_error_;
     latest_cloud_watch_logs_delivery_time = latest_cloud_watch_logs_delivery_time_;
     latest_digest_delivery_time = latest_digest_delivery_time_;
     latest_digest_delivery_error = latest_digest_delivery_error_;
     latest_delivery_attempt_time = latest_delivery_attempt_time_;
     latest_notification_attempt_time = latest_notification_attempt_time_;
     latest_notification_attempt_succeeded = latest_notification_attempt_succeeded_;
     latest_delivery_attempt_succeeded = latest_delivery_attempt_succeeded_;
     time_logging_started = time_logging_started_;
     time_logging_stopped = time_logging_stopped_;
   }
    : get_trail_status_response)

let make_get_trail_status_request ~name:(name_ : string_) () =
  ({ name = name_ } : get_trail_status_request)

let make_trail ?name:(name_ : string_ option) ?s3_bucket_name:(s3_bucket_name_ : string_ option)
    ?s3_key_prefix:(s3_key_prefix_ : string_ option)
    ?sns_topic_name:(sns_topic_name_ : string_ option)
    ?sns_topic_ar_n:(sns_topic_ar_n_ : string_ option)
    ?include_global_service_events:(include_global_service_events_ : boolean_ option)
    ?is_multi_region_trail:(is_multi_region_trail_ : boolean_ option)
    ?home_region:(home_region_ : string_ option) ?trail_ar_n:(trail_ar_n_ : string_ option)
    ?log_file_validation_enabled:(log_file_validation_enabled_ : boolean_ option)
    ?cloud_watch_logs_log_group_arn:(cloud_watch_logs_log_group_arn_ : string_ option)
    ?cloud_watch_logs_role_arn:(cloud_watch_logs_role_arn_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?has_custom_event_selectors:(has_custom_event_selectors_ : boolean_ option)
    ?has_insight_selectors:(has_insight_selectors_ : boolean_ option)
    ?is_organization_trail:(is_organization_trail_ : boolean_ option) () =
  ({
     name = name_;
     s3_bucket_name = s3_bucket_name_;
     s3_key_prefix = s3_key_prefix_;
     sns_topic_name = sns_topic_name_;
     sns_topic_ar_n = sns_topic_ar_n_;
     include_global_service_events = include_global_service_events_;
     is_multi_region_trail = is_multi_region_trail_;
     home_region = home_region_;
     trail_ar_n = trail_ar_n_;
     log_file_validation_enabled = log_file_validation_enabled_;
     cloud_watch_logs_log_group_arn = cloud_watch_logs_log_group_arn_;
     cloud_watch_logs_role_arn = cloud_watch_logs_role_arn_;
     kms_key_id = kms_key_id_;
     has_custom_event_selectors = has_custom_event_selectors_;
     has_insight_selectors = has_insight_selectors_;
     is_organization_trail = is_organization_trail_;
   }
    : trail)

let make_get_trail_response ?trail:(trail_ : trail option) () =
  ({ trail = trail_ } : get_trail_response)

let make_get_trail_request ~name:(name_ : string_) () = ({ name = name_ } : get_trail_request)

let make_get_resource_policy_response ?resource_arn:(resource_arn_ : resource_arn option)
    ?resource_policy:(resource_policy_ : resource_policy option)
    ?delegated_admin_resource_policy:(delegated_admin_resource_policy_ : resource_policy option) ()
    =
  ({
     resource_arn = resource_arn_;
     resource_policy = resource_policy_;
     delegated_admin_resource_policy = delegated_admin_resource_policy_;
   }
    : get_resource_policy_response)

let make_get_resource_policy_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_request)

let make_query_statistics ?results_count:(results_count_ : integer option)
    ?total_results_count:(total_results_count_ : integer option)
    ?bytes_scanned:(bytes_scanned_ : long option) () =
  ({
     results_count = results_count_;
     total_results_count = total_results_count_;
     bytes_scanned = bytes_scanned_;
   }
    : query_statistics)

let make_get_query_results_response ?query_status:(query_status_ : query_status option)
    ?query_statistics:(query_statistics_ : query_statistics option)
    ?query_result_rows:(query_result_rows_ : query_result_rows option)
    ?next_token:(next_token_ : pagination_token option)
    ?error_message:(error_message_ : error_message option) () =
  ({
     query_status = query_status_;
     query_statistics = query_statistics_;
     query_result_rows = query_result_rows_;
     next_token = next_token_;
     error_message = error_message_;
   }
    : get_query_results_response)

let make_get_query_results_request
    ?event_data_store:(event_data_store_ : event_data_store_arn option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_query_results:(max_query_results_ : max_query_results option)
    ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ : account_id option)
    ~query_id:(query_id_ : uui_d) () =
  ({
     event_data_store = event_data_store_;
     query_id = query_id_;
     next_token = next_token_;
     max_query_results = max_query_results_;
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
   }
    : get_query_results_request)

let make_get_insight_selectors_response ?trail_ar_n:(trail_ar_n_ : string_ option)
    ?insight_selectors:(insight_selectors_ : insight_selectors option)
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option)
    ?insights_destination:(insights_destination_ : event_data_store_arn option) () =
  ({
     trail_ar_n = trail_ar_n_;
     insight_selectors = insight_selectors_;
     event_data_store_arn = event_data_store_arn_;
     insights_destination = insights_destination_;
   }
    : get_insight_selectors_response)

let make_get_insight_selectors_request ?trail_name:(trail_name_ : string_ option)
    ?event_data_store:(event_data_store_ : event_data_store_arn option) () =
  ({ trail_name = trail_name_; event_data_store = event_data_store_ }
    : get_insight_selectors_request)

let make_get_import_response ?import_id:(import_id_ : uui_d option)
    ?destinations:(destinations_ : import_destinations option)
    ?import_source:(import_source_ : import_source option)
    ?start_event_time:(start_event_time_ : date option)
    ?end_event_time:(end_event_time_ : date option)
    ?import_status:(import_status_ : import_status option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?updated_timestamp:(updated_timestamp_ : date option)
    ?import_statistics:(import_statistics_ : import_statistics option) () =
  ({
     import_id = import_id_;
     destinations = destinations_;
     import_source = import_source_;
     start_event_time = start_event_time_;
     end_event_time = end_event_time_;
     import_status = import_status_;
     created_timestamp = created_timestamp_;
     updated_timestamp = updated_timestamp_;
     import_statistics = import_statistics_;
   }
    : get_import_response)

let make_get_import_request ~import_id:(import_id_ : uui_d) () =
  ({ import_id = import_id_ } : get_import_request)

let make_get_event_selectors_response ?trail_ar_n:(trail_ar_n_ : string_ option)
    ?event_selectors:(event_selectors_ : event_selectors option)
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option) () =
  ({
     trail_ar_n = trail_ar_n_;
     event_selectors = event_selectors_;
     advanced_event_selectors = advanced_event_selectors_;
   }
    : get_event_selectors_response)

let make_get_event_selectors_request ~trail_name:(trail_name_ : string_) () =
  ({ trail_name = trail_name_ } : get_event_selectors_request)

let make_partition_key ~name:(name_ : partition_key_name) ~type_:(type__ : partition_key_type) () =
  ({ name = name_; type_ = type__ } : partition_key)

let make_get_event_data_store_response
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option)
    ?name:(name_ : event_data_store_name option) ?status:(status_ : event_data_store_status option)
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option)
    ?multi_region_enabled:(multi_region_enabled_ : boolean_ option)
    ?organization_enabled:(organization_enabled_ : boolean_ option)
    ?retention_period:(retention_period_ : retention_period option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?updated_timestamp:(updated_timestamp_ : date option)
    ?kms_key_id:(kms_key_id_ : event_data_store_kms_key_id option)
    ?billing_mode:(billing_mode_ : billing_mode option)
    ?federation_status:(federation_status_ : federation_status option)
    ?federation_role_arn:(federation_role_arn_ : federation_role_arn option)
    ?partition_keys:(partition_keys_ : partition_key_list option) () =
  ({
     event_data_store_arn = event_data_store_arn_;
     name = name_;
     status = status_;
     advanced_event_selectors = advanced_event_selectors_;
     multi_region_enabled = multi_region_enabled_;
     organization_enabled = organization_enabled_;
     retention_period = retention_period_;
     termination_protection_enabled = termination_protection_enabled_;
     created_timestamp = created_timestamp_;
     updated_timestamp = updated_timestamp_;
     kms_key_id = kms_key_id_;
     billing_mode = billing_mode_;
     federation_status = federation_status_;
     federation_role_arn = federation_role_arn_;
     partition_keys = partition_keys_;
   }
    : get_event_data_store_response)

let make_get_event_data_store_request ~event_data_store:(event_data_store_ : event_data_store_arn)
    () =
  ({ event_data_store = event_data_store_ } : get_event_data_store_request)

let make_get_event_configuration_response ?trail_ar_n:(trail_ar_n_ : string_ option)
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option)
    ?max_event_size:(max_event_size_ : max_event_size option)
    ?context_key_selectors:(context_key_selectors_ : context_key_selectors option)
    ?aggregation_configurations:(aggregation_configurations_ : aggregation_configurations option) ()
    =
  ({
     trail_ar_n = trail_ar_n_;
     event_data_store_arn = event_data_store_arn_;
     max_event_size = max_event_size_;
     context_key_selectors = context_key_selectors_;
     aggregation_configurations = aggregation_configurations_;
   }
    : get_event_configuration_response)

let make_get_event_configuration_request ?trail_name:(trail_name_ : string_ option)
    ?event_data_store:(event_data_store_ : string_ option) () =
  ({ trail_name = trail_name_; event_data_store = event_data_store_ }
    : get_event_configuration_request)

let make_get_dashboard_response ?dashboard_arn:(dashboard_arn_ : dashboard_arn option)
    ?type_:(type__ : dashboard_type option) ?status:(status_ : dashboard_status option)
    ?widgets:(widgets_ : widget_list option)
    ?refresh_schedule:(refresh_schedule_ : refresh_schedule option)
    ?created_timestamp:(created_timestamp_ : date option)
    ?updated_timestamp:(updated_timestamp_ : date option)
    ?last_refresh_id:(last_refresh_id_ : refresh_id option)
    ?last_refresh_failure_reason:(last_refresh_failure_reason_ : error_message option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option) () =
  ({
     dashboard_arn = dashboard_arn_;
     type_ = type__;
     status = status_;
     widgets = widgets_;
     refresh_schedule = refresh_schedule_;
     created_timestamp = created_timestamp_;
     updated_timestamp = updated_timestamp_;
     last_refresh_id = last_refresh_id_;
     last_refresh_failure_reason = last_refresh_failure_reason_;
     termination_protection_enabled = termination_protection_enabled_;
   }
    : get_dashboard_response)

let make_get_dashboard_request ~dashboard_id:(dashboard_id_ : dashboard_arn) () =
  ({ dashboard_id = dashboard_id_ } : get_dashboard_request)

let make_ingestion_status
    ?latest_ingestion_success_time:(latest_ingestion_success_time_ : date option)
    ?latest_ingestion_success_event_i_d:(latest_ingestion_success_event_i_d_ : uui_d option)
    ?latest_ingestion_error_code:(latest_ingestion_error_code_ : error_message option)
    ?latest_ingestion_attempt_time:(latest_ingestion_attempt_time_ : date option)
    ?latest_ingestion_attempt_event_i_d:(latest_ingestion_attempt_event_i_d_ : uui_d option) () =
  ({
     latest_ingestion_success_time = latest_ingestion_success_time_;
     latest_ingestion_success_event_i_d = latest_ingestion_success_event_i_d_;
     latest_ingestion_error_code = latest_ingestion_error_code_;
     latest_ingestion_attempt_time = latest_ingestion_attempt_time_;
     latest_ingestion_attempt_event_i_d = latest_ingestion_attempt_event_i_d_;
   }
    : ingestion_status)

let make_source_config ?apply_to_all_regions:(apply_to_all_regions_ : boolean_ option)
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option) () =
  ({
     apply_to_all_regions = apply_to_all_regions_;
     advanced_event_selectors = advanced_event_selectors_;
   }
    : source_config)

let make_get_channel_response ?channel_arn:(channel_arn_ : channel_arn option)
    ?name:(name_ : channel_name option) ?source:(source_ : source option)
    ?source_config:(source_config_ : source_config option)
    ?destinations:(destinations_ : destinations option)
    ?ingestion_status:(ingestion_status_ : ingestion_status option) () =
  ({
     channel_arn = channel_arn_;
     name = name_;
     source = source_;
     source_config = source_config_;
     destinations = destinations_;
     ingestion_status = ingestion_status_;
   }
    : get_channel_response)

let make_get_channel_request ~channel:(channel_ : channel_arn) () =
  ({ channel = channel_ } : get_channel_request)

let make_generate_query_response ?query_statement:(query_statement_ : query_statement option)
    ?query_alias:(query_alias_ : query_alias option)
    ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ : account_id option) () =
  ({
     query_statement = query_statement_;
     query_alias = query_alias_;
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
   }
    : generate_query_response)

let make_generate_query_request ~event_data_stores:(event_data_stores_ : event_data_store_list)
    ~prompt:(prompt_ : prompt) () =
  ({ event_data_stores = event_data_stores_; prompt = prompt_ } : generate_query_request)

let make_enable_federation_response
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option)
    ?federation_status:(federation_status_ : federation_status option)
    ?federation_role_arn:(federation_role_arn_ : federation_role_arn option) () =
  ({
     event_data_store_arn = event_data_store_arn_;
     federation_status = federation_status_;
     federation_role_arn = federation_role_arn_;
   }
    : enable_federation_response)

let make_enable_federation_request ~event_data_store:(event_data_store_ : event_data_store_arn)
    ~federation_role_arn:(federation_role_arn_ : federation_role_arn) () =
  ({ event_data_store = event_data_store_; federation_role_arn = federation_role_arn_ }
    : enable_federation_request)

let make_disable_federation_response
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option)
    ?federation_status:(federation_status_ : federation_status option) () =
  ({ event_data_store_arn = event_data_store_arn_; federation_status = federation_status_ }
    : disable_federation_response)

let make_disable_federation_request ~event_data_store:(event_data_store_ : event_data_store_arn) ()
    =
  ({ event_data_store = event_data_store_ } : disable_federation_request)

let make_describe_trails_response ?trail_list:(trail_list_ : trail_list option) () =
  ({ trail_list = trail_list_ } : describe_trails_response)

let make_describe_trails_request ?trail_name_list:(trail_name_list_ : trail_name_list option)
    ?include_shadow_trails:(include_shadow_trails_ : boolean_ option) () =
  ({ trail_name_list = trail_name_list_; include_shadow_trails = include_shadow_trails_ }
    : describe_trails_request)

let make_query_statistics_for_describe_query ?events_matched:(events_matched_ : long option)
    ?events_scanned:(events_scanned_ : long option) ?bytes_scanned:(bytes_scanned_ : long option)
    ?execution_time_in_millis:(execution_time_in_millis_ : integer option)
    ?creation_time:(creation_time_ : date option) () =
  ({
     events_matched = events_matched_;
     events_scanned = events_scanned_;
     bytes_scanned = bytes_scanned_;
     execution_time_in_millis = execution_time_in_millis_;
     creation_time = creation_time_;
   }
    : query_statistics_for_describe_query)

let make_describe_query_response ?query_id:(query_id_ : uui_d option)
    ?query_string:(query_string_ : query_statement option)
    ?query_status:(query_status_ : query_status option)
    ?query_statistics:(query_statistics_ : query_statistics_for_describe_query option)
    ?error_message:(error_message_ : error_message option)
    ?delivery_s3_uri:(delivery_s3_uri_ : delivery_s3_uri option)
    ?delivery_status:(delivery_status_ : delivery_status option) ?prompt:(prompt_ : prompt option)
    ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ : account_id option) () =
  ({
     query_id = query_id_;
     query_string = query_string_;
     query_status = query_status_;
     query_statistics = query_statistics_;
     error_message = error_message_;
     delivery_s3_uri = delivery_s3_uri_;
     delivery_status = delivery_status_;
     prompt = prompt_;
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
   }
    : describe_query_response)

let make_describe_query_request ?event_data_store:(event_data_store_ : event_data_store_arn option)
    ?query_id:(query_id_ : uui_d option) ?query_alias:(query_alias_ : query_alias option)
    ?refresh_id:(refresh_id_ : refresh_id option)
    ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ : account_id option) () =
  ({
     event_data_store = event_data_store_;
     query_id = query_id_;
     query_alias = query_alias_;
     refresh_id = refresh_id_;
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
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

let make_create_trail_response ?name:(name_ : string_ option)
    ?s3_bucket_name:(s3_bucket_name_ : string_ option)
    ?s3_key_prefix:(s3_key_prefix_ : string_ option)
    ?sns_topic_name:(sns_topic_name_ : string_ option)
    ?sns_topic_ar_n:(sns_topic_ar_n_ : string_ option)
    ?include_global_service_events:(include_global_service_events_ : boolean_ option)
    ?is_multi_region_trail:(is_multi_region_trail_ : boolean_ option)
    ?trail_ar_n:(trail_ar_n_ : string_ option)
    ?log_file_validation_enabled:(log_file_validation_enabled_ : boolean_ option)
    ?cloud_watch_logs_log_group_arn:(cloud_watch_logs_log_group_arn_ : string_ option)
    ?cloud_watch_logs_role_arn:(cloud_watch_logs_role_arn_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?is_organization_trail:(is_organization_trail_ : boolean_ option) () =
  ({
     name = name_;
     s3_bucket_name = s3_bucket_name_;
     s3_key_prefix = s3_key_prefix_;
     sns_topic_name = sns_topic_name_;
     sns_topic_ar_n = sns_topic_ar_n_;
     include_global_service_events = include_global_service_events_;
     is_multi_region_trail = is_multi_region_trail_;
     trail_ar_n = trail_ar_n_;
     log_file_validation_enabled = log_file_validation_enabled_;
     cloud_watch_logs_log_group_arn = cloud_watch_logs_log_group_arn_;
     cloud_watch_logs_role_arn = cloud_watch_logs_role_arn_;
     kms_key_id = kms_key_id_;
     is_organization_trail = is_organization_trail_;
   }
    : create_trail_response)

let make_create_trail_request ?s3_key_prefix:(s3_key_prefix_ : string_ option)
    ?sns_topic_name:(sns_topic_name_ : string_ option)
    ?include_global_service_events:(include_global_service_events_ : boolean_ option)
    ?is_multi_region_trail:(is_multi_region_trail_ : boolean_ option)
    ?enable_log_file_validation:(enable_log_file_validation_ : boolean_ option)
    ?cloud_watch_logs_log_group_arn:(cloud_watch_logs_log_group_arn_ : string_ option)
    ?cloud_watch_logs_role_arn:(cloud_watch_logs_role_arn_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?is_organization_trail:(is_organization_trail_ : boolean_ option)
    ?tags_list:(tags_list_ : tags_list option) ~name:(name_ : string_)
    ~s3_bucket_name:(s3_bucket_name_ : string_) () =
  ({
     name = name_;
     s3_bucket_name = s3_bucket_name_;
     s3_key_prefix = s3_key_prefix_;
     sns_topic_name = sns_topic_name_;
     include_global_service_events = include_global_service_events_;
     is_multi_region_trail = is_multi_region_trail_;
     enable_log_file_validation = enable_log_file_validation_;
     cloud_watch_logs_log_group_arn = cloud_watch_logs_log_group_arn_;
     cloud_watch_logs_role_arn = cloud_watch_logs_role_arn_;
     kms_key_id = kms_key_id_;
     is_organization_trail = is_organization_trail_;
     tags_list = tags_list_;
   }
    : create_trail_request)

let make_create_event_data_store_response
    ?event_data_store_arn:(event_data_store_arn_ : event_data_store_arn option)
    ?name:(name_ : event_data_store_name option) ?status:(status_ : event_data_store_status option)
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option)
    ?multi_region_enabled:(multi_region_enabled_ : boolean_ option)
    ?organization_enabled:(organization_enabled_ : boolean_ option)
    ?retention_period:(retention_period_ : retention_period option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?tags_list:(tags_list_ : tags_list option) ?created_timestamp:(created_timestamp_ : date option)
    ?updated_timestamp:(updated_timestamp_ : date option)
    ?kms_key_id:(kms_key_id_ : event_data_store_kms_key_id option)
    ?billing_mode:(billing_mode_ : billing_mode option) () =
  ({
     event_data_store_arn = event_data_store_arn_;
     name = name_;
     status = status_;
     advanced_event_selectors = advanced_event_selectors_;
     multi_region_enabled = multi_region_enabled_;
     organization_enabled = organization_enabled_;
     retention_period = retention_period_;
     termination_protection_enabled = termination_protection_enabled_;
     tags_list = tags_list_;
     created_timestamp = created_timestamp_;
     updated_timestamp = updated_timestamp_;
     kms_key_id = kms_key_id_;
     billing_mode = billing_mode_;
   }
    : create_event_data_store_response)

let make_create_event_data_store_request
    ?advanced_event_selectors:(advanced_event_selectors_ : advanced_event_selectors option)
    ?multi_region_enabled:(multi_region_enabled_ : boolean_ option)
    ?organization_enabled:(organization_enabled_ : boolean_ option)
    ?retention_period:(retention_period_ : retention_period option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?tags_list:(tags_list_ : tags_list option)
    ?kms_key_id:(kms_key_id_ : event_data_store_kms_key_id option)
    ?start_ingestion:(start_ingestion_ : boolean_ option)
    ?billing_mode:(billing_mode_ : billing_mode option) ~name:(name_ : event_data_store_name) () =
  ({
     name = name_;
     advanced_event_selectors = advanced_event_selectors_;
     multi_region_enabled = multi_region_enabled_;
     organization_enabled = organization_enabled_;
     retention_period = retention_period_;
     termination_protection_enabled = termination_protection_enabled_;
     tags_list = tags_list_;
     kms_key_id = kms_key_id_;
     start_ingestion = start_ingestion_;
     billing_mode = billing_mode_;
   }
    : create_event_data_store_request)

let make_create_dashboard_response ?dashboard_arn:(dashboard_arn_ : dashboard_arn option)
    ?name:(name_ : dashboard_name option) ?type_:(type__ : dashboard_type option)
    ?widgets:(widgets_ : widget_list option) ?tags_list:(tags_list_ : tags_list option)
    ?refresh_schedule:(refresh_schedule_ : refresh_schedule option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option) () =
  ({
     dashboard_arn = dashboard_arn_;
     name = name_;
     type_ = type__;
     widgets = widgets_;
     tags_list = tags_list_;
     refresh_schedule = refresh_schedule_;
     termination_protection_enabled = termination_protection_enabled_;
   }
    : create_dashboard_response)

let make_create_dashboard_request ?refresh_schedule:(refresh_schedule_ : refresh_schedule option)
    ?tags_list:(tags_list_ : tags_list option)
    ?termination_protection_enabled:
      (termination_protection_enabled_ : termination_protection_enabled option)
    ?widgets:(widgets_ : request_widget_list option) ~name:(name_ : dashboard_name) () =
  ({
     name = name_;
     refresh_schedule = refresh_schedule_;
     tags_list = tags_list_;
     termination_protection_enabled = termination_protection_enabled_;
     widgets = widgets_;
   }
    : create_dashboard_request)

let make_create_channel_response ?channel_arn:(channel_arn_ : channel_arn option)
    ?name:(name_ : channel_name option) ?source:(source_ : source option)
    ?destinations:(destinations_ : destinations option) ?tags:(tags_ : tags_list option) () =
  ({
     channel_arn = channel_arn_;
     name = name_;
     source = source_;
     destinations = destinations_;
     tags = tags_;
   }
    : create_channel_response)

let make_create_channel_request ?tags:(tags_ : tags_list option) ~name:(name_ : channel_name)
    ~source:(source_ : source) ~destinations:(destinations_ : destinations) () =
  ({ name = name_; source = source_; destinations = destinations_; tags = tags_ }
    : create_channel_request)
