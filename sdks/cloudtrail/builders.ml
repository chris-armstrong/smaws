open Smaws_Lib
open Types
let make_widget
  ?view_properties:(view_properties_ : view_properties_map option)
  ?query_parameters:(query_parameters_ : string list option)
  ?query_statement:(query_statement_ : string option)
  ?query_alias:(query_alias_ : string option) () =
  ({
     view_properties = view_properties_;
     query_parameters = query_parameters_;
     query_statement = query_statement_;
     query_alias = query_alias_
   } : widget)
let make_update_trail_response
  ?is_organization_trail:(is_organization_trail_ : bool option)
  ?kms_key_id:(kms_key_id_ : string option)
  ?cloud_watch_logs_role_arn:(cloud_watch_logs_role_arn_ : string option)
  ?cloud_watch_logs_log_group_arn:(cloud_watch_logs_log_group_arn_ :
                                    string option)
  ?log_file_validation_enabled:(log_file_validation_enabled_ : bool option)
  ?trail_ar_n:(trail_ar_n_ : string option)
  ?is_multi_region_trail:(is_multi_region_trail_ : bool option)
  ?include_global_service_events:(include_global_service_events_ :
                                   bool option)
  ?sns_topic_ar_n:(sns_topic_ar_n_ : string option)
  ?sns_topic_name:(sns_topic_name_ : string option)
  ?s3_key_prefix:(s3_key_prefix_ : string option)
  ?s3_bucket_name:(s3_bucket_name_ : string option)
  ?name:(name_ : string option) () =
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
     name = name_
   } : update_trail_response)
let make_update_trail_request
  ?is_organization_trail:(is_organization_trail_ : bool option)
  ?kms_key_id:(kms_key_id_ : string option)
  ?cloud_watch_logs_role_arn:(cloud_watch_logs_role_arn_ : string option)
  ?cloud_watch_logs_log_group_arn:(cloud_watch_logs_log_group_arn_ :
                                    string option)
  ?enable_log_file_validation:(enable_log_file_validation_ : bool option)
  ?is_multi_region_trail:(is_multi_region_trail_ : bool option)
  ?include_global_service_events:(include_global_service_events_ :
                                   bool option)
  ?sns_topic_name:(sns_topic_name_ : string option)
  ?s3_key_prefix:(s3_key_prefix_ : string option)
  ?s3_bucket_name:(s3_bucket_name_ : string option) ~name:(name_ : string) ()
  =
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
     name = name_
   } : update_trail_request)
let make_advanced_field_selector
  ?not_ends_with:(not_ends_with_ : string list option)
  ?not_starts_with:(not_starts_with_ : string list option)
  ?not_equals:(not_equals_ : string list option)
  ?ends_with:(ends_with_ : string list option)
  ?starts_with:(starts_with_ : string list option)
  ?equals:(equals_ : string list option) ~field:(field_ : string) () =
  ({
     not_ends_with = not_ends_with_;
     not_starts_with = not_starts_with_;
     not_equals = not_equals_;
     ends_with = ends_with_;
     starts_with = starts_with_;
     equals = equals_;
     field = field_
   } : advanced_field_selector)
let make_advanced_event_selector ?name:(name_ : string option)
  ~field_selectors:(field_selectors_ : advanced_field_selector list) () =
  ({ field_selectors = field_selectors_; name = name_ } : advanced_event_selector)
let make_update_event_data_store_response
  ?federation_role_arn:(federation_role_arn_ : string option)
  ?federation_status:(federation_status_ : federation_status option)
  ?billing_mode:(billing_mode_ : billing_mode option)
  ?kms_key_id:(kms_key_id_ : string option)
  ?updated_timestamp:(updated_timestamp_ : CoreTypes.Timestamp.t option)
  ?created_timestamp:(created_timestamp_ : CoreTypes.Timestamp.t option)
  ?termination_protection_enabled:(termination_protection_enabled_ :
                                    bool option)
  ?retention_period:(retention_period_ : int option)
  ?organization_enabled:(organization_enabled_ : bool option)
  ?multi_region_enabled:(multi_region_enabled_ : bool option)
  ?advanced_event_selectors:(advanced_event_selectors_ :
                              advanced_event_selector list option)
  ?status:(status_ : event_data_store_status option)
  ?name:(name_ : string option)
  ?event_data_store_arn:(event_data_store_arn_ : string option) () =
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
     event_data_store_arn = event_data_store_arn_
   } : update_event_data_store_response)
let make_update_event_data_store_request
  ?billing_mode:(billing_mode_ : billing_mode option)
  ?kms_key_id:(kms_key_id_ : string option)
  ?termination_protection_enabled:(termination_protection_enabled_ :
                                    bool option)
  ?retention_period:(retention_period_ : int option)
  ?organization_enabled:(organization_enabled_ : bool option)
  ?multi_region_enabled:(multi_region_enabled_ : bool option)
  ?advanced_event_selectors:(advanced_event_selectors_ :
                              advanced_event_selector list option)
  ?name:(name_ : string option)
  ~event_data_store:(event_data_store_ : string) () =
  ({
     billing_mode = billing_mode_;
     kms_key_id = kms_key_id_;
     termination_protection_enabled = termination_protection_enabled_;
     retention_period = retention_period_;
     organization_enabled = organization_enabled_;
     multi_region_enabled = multi_region_enabled_;
     advanced_event_selectors = advanced_event_selectors_;
     name = name_;
     event_data_store = event_data_store_
   } : update_event_data_store_request)
let make_refresh_schedule_frequency ?value:(value_ : int option)
  ?unit_:(unit__ : refresh_schedule_frequency_unit option) () =
  ({ value = value_; unit_ = unit__ } : refresh_schedule_frequency)
let make_refresh_schedule ?time_of_day:(time_of_day_ : string option)
  ?status:(status_ : refresh_schedule_status option)
  ?frequency:(frequency_ : refresh_schedule_frequency option) () =
  ({ time_of_day = time_of_day_; status = status_; frequency = frequency_ } : 
  refresh_schedule)
let make_update_dashboard_response
  ?updated_timestamp:(updated_timestamp_ : CoreTypes.Timestamp.t option)
  ?created_timestamp:(created_timestamp_ : CoreTypes.Timestamp.t option)
  ?termination_protection_enabled:(termination_protection_enabled_ :
                                    bool option)
  ?refresh_schedule:(refresh_schedule_ : refresh_schedule option)
  ?widgets:(widgets_ : widget list option)
  ?type_:(type__ : dashboard_type option) ?name:(name_ : string option)
  ?dashboard_arn:(dashboard_arn_ : string option) () =
  ({
     updated_timestamp = updated_timestamp_;
     created_timestamp = created_timestamp_;
     termination_protection_enabled = termination_protection_enabled_;
     refresh_schedule = refresh_schedule_;
     widgets = widgets_;
     type_ = type__;
     name = name_;
     dashboard_arn = dashboard_arn_
   } : update_dashboard_response)
let make_request_widget
  ?query_parameters:(query_parameters_ : string list option)
  ~view_properties:(view_properties_ : view_properties_map)
  ~query_statement:(query_statement_ : string) () =
  ({
     view_properties = view_properties_;
     query_parameters = query_parameters_;
     query_statement = query_statement_
   } : request_widget)
let make_update_dashboard_request
  ?termination_protection_enabled:(termination_protection_enabled_ :
                                    bool option)
  ?refresh_schedule:(refresh_schedule_ : refresh_schedule option)
  ?widgets:(widgets_ : request_widget list option)
  ~dashboard_id:(dashboard_id_ : string) () =
  ({
     termination_protection_enabled = termination_protection_enabled_;
     refresh_schedule = refresh_schedule_;
     widgets = widgets_;
     dashboard_id = dashboard_id_
   } : update_dashboard_request)
let make_destination ~location:(location_ : string)
  ~type_:(type__ : destination_type) () =
  ({ location = location_; type_ = type__ } : destination)
let make_update_channel_response
  ?destinations:(destinations_ : destination list option)
  ?source:(source_ : string option) ?name:(name_ : string option)
  ?channel_arn:(channel_arn_ : string option) () =
  ({
     destinations = destinations_;
     source = source_;
     name = name_;
     channel_arn = channel_arn_
   } : update_channel_response)
let make_update_channel_request ?name:(name_ : string option)
  ?destinations:(destinations_ : destination list option)
  ~channel:(channel_ : string) () =
  ({ name = name_; destinations = destinations_; channel = channel_ } : 
  update_channel_request)
let make_trail_info ?home_region:(home_region_ : string option)
  ?name:(name_ : string option) ?trail_ar_n:(trail_ar_n_ : string option) ()
  =
  ({ home_region = home_region_; name = name_; trail_ar_n = trail_ar_n_ } : 
  trail_info)
let make_trail ?is_organization_trail:(is_organization_trail_ : bool option)
  ?has_insight_selectors:(has_insight_selectors_ : bool option)
  ?has_custom_event_selectors:(has_custom_event_selectors_ : bool option)
  ?kms_key_id:(kms_key_id_ : string option)
  ?cloud_watch_logs_role_arn:(cloud_watch_logs_role_arn_ : string option)
  ?cloud_watch_logs_log_group_arn:(cloud_watch_logs_log_group_arn_ :
                                    string option)
  ?log_file_validation_enabled:(log_file_validation_enabled_ : bool option)
  ?trail_ar_n:(trail_ar_n_ : string option)
  ?home_region:(home_region_ : string option)
  ?is_multi_region_trail:(is_multi_region_trail_ : bool option)
  ?include_global_service_events:(include_global_service_events_ :
                                   bool option)
  ?sns_topic_ar_n:(sns_topic_ar_n_ : string option)
  ?sns_topic_name:(sns_topic_name_ : string option)
  ?s3_key_prefix:(s3_key_prefix_ : string option)
  ?s3_bucket_name:(s3_bucket_name_ : string option)
  ?name:(name_ : string option) () =
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
     name = name_
   } : trail)
let make_tag ?value:(value_ : string option) ~key:(key_ : string) () =
  ({ value = value_; key = key_ } : tag)
let make_stop_logging_response () = (() : unit)
let make_stop_logging_request ~name:(name_ : string) () =
  ({ name = name_ } : stop_logging_request)
let make_s3_import_source
  ~s3_bucket_access_role_arn:(s3_bucket_access_role_arn_ : string)
  ~s3_bucket_region:(s3_bucket_region_ : string)
  ~s3_location_uri:(s3_location_uri_ : string) () =
  ({
     s3_bucket_access_role_arn = s3_bucket_access_role_arn_;
     s3_bucket_region = s3_bucket_region_;
     s3_location_uri = s3_location_uri_
   } : s3_import_source)
let make_import_source ~s3:(s3_ : s3_import_source) () =
  ({ s3 = s3_ } : import_source)
let make_import_statistics ?failed_entries:(failed_entries_ : int option)
  ?events_completed:(events_completed_ : int option)
  ?files_completed:(files_completed_ : int option)
  ?prefixes_completed:(prefixes_completed_ : int option)
  ?prefixes_found:(prefixes_found_ : int option) () =
  ({
     failed_entries = failed_entries_;
     events_completed = events_completed_;
     files_completed = files_completed_;
     prefixes_completed = prefixes_completed_;
     prefixes_found = prefixes_found_
   } : import_statistics)
let make_stop_import_response
  ?import_statistics:(import_statistics_ : import_statistics option)
  ?end_event_time:(end_event_time_ : CoreTypes.Timestamp.t option)
  ?start_event_time:(start_event_time_ : CoreTypes.Timestamp.t option)
  ?updated_timestamp:(updated_timestamp_ : CoreTypes.Timestamp.t option)
  ?created_timestamp:(created_timestamp_ : CoreTypes.Timestamp.t option)
  ?import_status:(import_status_ : import_status option)
  ?destinations:(destinations_ : string list option)
  ?import_source:(import_source_ : import_source option)
  ?import_id:(import_id_ : string option) () =
  ({
     import_statistics = import_statistics_;
     end_event_time = end_event_time_;
     start_event_time = start_event_time_;
     updated_timestamp = updated_timestamp_;
     created_timestamp = created_timestamp_;
     import_status = import_status_;
     destinations = destinations_;
     import_source = import_source_;
     import_id = import_id_
   } : stop_import_response)
let make_stop_import_request ~import_id:(import_id_ : string) () =
  ({ import_id = import_id_ } : stop_import_request)
let make_stop_event_data_store_ingestion_response () = (() : unit)
let make_stop_event_data_store_ingestion_request
  ~event_data_store:(event_data_store_ : string) () =
  ({ event_data_store = event_data_store_ } : stop_event_data_store_ingestion_request)
let make_start_query_response
  ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ :
                                       string option)
  ?query_id:(query_id_ : string option) () =
  ({
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
     query_id = query_id_
   } : start_query_response)
let make_start_query_request
  ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ :
                                       string option)
  ?query_parameters:(query_parameters_ : string list option)
  ?query_alias:(query_alias_ : string option)
  ?delivery_s3_uri:(delivery_s3_uri_ : string option)
  ?query_statement:(query_statement_ : string option) () =
  ({
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
     query_parameters = query_parameters_;
     query_alias = query_alias_;
     delivery_s3_uri = delivery_s3_uri_;
     query_statement = query_statement_
   } : start_query_request)
let make_start_logging_response () = (() : unit)
let make_start_logging_request ~name:(name_ : string) () =
  ({ name = name_ } : start_logging_request)
let make_start_import_response
  ?updated_timestamp:(updated_timestamp_ : CoreTypes.Timestamp.t option)
  ?created_timestamp:(created_timestamp_ : CoreTypes.Timestamp.t option)
  ?import_status:(import_status_ : import_status option)
  ?end_event_time:(end_event_time_ : CoreTypes.Timestamp.t option)
  ?start_event_time:(start_event_time_ : CoreTypes.Timestamp.t option)
  ?import_source:(import_source_ : import_source option)
  ?destinations:(destinations_ : string list option)
  ?import_id:(import_id_ : string option) () =
  ({
     updated_timestamp = updated_timestamp_;
     created_timestamp = created_timestamp_;
     import_status = import_status_;
     end_event_time = end_event_time_;
     start_event_time = start_event_time_;
     import_source = import_source_;
     destinations = destinations_;
     import_id = import_id_
   } : start_import_response)
let make_start_import_request ?import_id:(import_id_ : string option)
  ?end_event_time:(end_event_time_ : CoreTypes.Timestamp.t option)
  ?start_event_time:(start_event_time_ : CoreTypes.Timestamp.t option)
  ?import_source:(import_source_ : import_source option)
  ?destinations:(destinations_ : string list option) () =
  ({
     import_id = import_id_;
     end_event_time = end_event_time_;
     start_event_time = start_event_time_;
     import_source = import_source_;
     destinations = destinations_
   } : start_import_request)
let make_start_event_data_store_ingestion_response () = (() : unit)
let make_start_event_data_store_ingestion_request
  ~event_data_store:(event_data_store_ : string) () =
  ({ event_data_store = event_data_store_ } : start_event_data_store_ingestion_request)
let make_start_dashboard_refresh_response
  ?refresh_id:(refresh_id_ : string option) () =
  ({ refresh_id = refresh_id_ } : start_dashboard_refresh_response)
let make_start_dashboard_refresh_request
  ?query_parameter_values:(query_parameter_values_ :
                            query_parameter_values option)
  ~dashboard_id:(dashboard_id_ : string) () =
  ({
     query_parameter_values = query_parameter_values_;
     dashboard_id = dashboard_id_
   } : start_dashboard_refresh_request)
let make_source_config
  ?advanced_event_selectors:(advanced_event_selectors_ :
                              advanced_event_selector list option)
  ?apply_to_all_regions:(apply_to_all_regions_ : bool option) () =
  ({
     advanced_event_selectors = advanced_event_selectors_;
     apply_to_all_regions = apply_to_all_regions_
   } : source_config)
let make_search_sample_queries_response
  ?next_token:(next_token_ : string option)
  ?search_results:(search_results_ :
                    search_sample_queries_search_result list option)
  () =
  ({ next_token = next_token_; search_results = search_results_ } : search_sample_queries_response)
let make_search_sample_queries_request
  ?next_token:(next_token_ : string option)
  ?max_results:(max_results_ : int option)
  ~search_phrase:(search_phrase_ : string) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     search_phrase = search_phrase_
   } : search_sample_queries_request)
let make_restore_event_data_store_response
  ?billing_mode:(billing_mode_ : billing_mode option)
  ?kms_key_id:(kms_key_id_ : string option)
  ?updated_timestamp:(updated_timestamp_ : CoreTypes.Timestamp.t option)
  ?created_timestamp:(created_timestamp_ : CoreTypes.Timestamp.t option)
  ?termination_protection_enabled:(termination_protection_enabled_ :
                                    bool option)
  ?retention_period:(retention_period_ : int option)
  ?organization_enabled:(organization_enabled_ : bool option)
  ?multi_region_enabled:(multi_region_enabled_ : bool option)
  ?advanced_event_selectors:(advanced_event_selectors_ :
                              advanced_event_selector list option)
  ?status:(status_ : event_data_store_status option)
  ?name:(name_ : string option)
  ?event_data_store_arn:(event_data_store_arn_ : string option) () =
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
     event_data_store_arn = event_data_store_arn_
   } : restore_event_data_store_response)
let make_restore_event_data_store_request
  ~event_data_store:(event_data_store_ : string) () =
  ({ event_data_store = event_data_store_ } : restore_event_data_store_request)
let make_resource_tag ?tags_list:(tags_list_ : tag list option)
  ?resource_id:(resource_id_ : string option) () =
  ({ tags_list = tags_list_; resource_id = resource_id_ } : resource_tag)
let make_resource ?resource_name:(resource_name_ : string option)
  ?resource_type:(resource_type_ : string option) () =
  ({ resource_name = resource_name_; resource_type = resource_type_ } : 
  resource)
let make_remove_tags_response () = (() : unit)
let make_remove_tags_request ~tags_list:(tags_list_ : tag list)
  ~resource_id:(resource_id_ : string) () =
  ({ tags_list = tags_list_; resource_id = resource_id_ } : remove_tags_request)
let make_register_organization_delegated_admin_response () = (() : unit)
let make_register_organization_delegated_admin_request
  ~member_account_id:(member_account_id_ : string) () =
  ({ member_account_id = member_account_id_ } : register_organization_delegated_admin_request)
let make_query_statistics_for_describe_query
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option)
  ?execution_time_in_millis:(execution_time_in_millis_ : int option)
  ?bytes_scanned:(bytes_scanned_ : int option)
  ?events_scanned:(events_scanned_ : int option)
  ?events_matched:(events_matched_ : int option) () =
  ({
     creation_time = creation_time_;
     execution_time_in_millis = execution_time_in_millis_;
     bytes_scanned = bytes_scanned_;
     events_scanned = events_scanned_;
     events_matched = events_matched_
   } : query_statistics_for_describe_query)
let make_query_statistics ?bytes_scanned:(bytes_scanned_ : int option)
  ?total_results_count:(total_results_count_ : int option)
  ?results_count:(results_count_ : int option) () =
  ({
     bytes_scanned = bytes_scanned_;
     total_results_count = total_results_count_;
     results_count = results_count_
   } : query_statistics)
let make_query ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option)
  ?query_status:(query_status_ : query_status option)
  ?query_id:(query_id_ : string option) () =
  ({
     creation_time = creation_time_;
     query_status = query_status_;
     query_id = query_id_
   } : query)
let make_put_resource_policy_response
  ?delegated_admin_resource_policy:(delegated_admin_resource_policy_ :
                                     string option)
  ?resource_policy:(resource_policy_ : string option)
  ?resource_arn:(resource_arn_ : string option) () =
  ({
     delegated_admin_resource_policy = delegated_admin_resource_policy_;
     resource_policy = resource_policy_;
     resource_arn = resource_arn_
   } : put_resource_policy_response)
let make_put_resource_policy_request
  ~resource_policy:(resource_policy_ : string)
  ~resource_arn:(resource_arn_ : string) () =
  ({ resource_policy = resource_policy_; resource_arn = resource_arn_ } : 
  put_resource_policy_request)
let make_insight_selector ?insight_type:(insight_type_ : insight_type option)
  () = ({ insight_type = insight_type_ } : insight_selector)
let make_put_insight_selectors_response
  ?insights_destination:(insights_destination_ : string option)
  ?event_data_store_arn:(event_data_store_arn_ : string option)
  ?insight_selectors:(insight_selectors_ : insight_selector list option)
  ?trail_ar_n:(trail_ar_n_ : string option) () =
  ({
     insights_destination = insights_destination_;
     event_data_store_arn = event_data_store_arn_;
     insight_selectors = insight_selectors_;
     trail_ar_n = trail_ar_n_
   } : put_insight_selectors_response)
let make_put_insight_selectors_request
  ?insights_destination:(insights_destination_ : string option)
  ?event_data_store:(event_data_store_ : string option)
  ?trail_name:(trail_name_ : string option)
  ~insight_selectors:(insight_selectors_ : insight_selector list) () =
  ({
     insights_destination = insights_destination_;
     event_data_store = event_data_store_;
     insight_selectors = insight_selectors_;
     trail_name = trail_name_
   } : put_insight_selectors_request)
let make_data_resource ?values:(values_ : string list option)
  ?type_:(type__ : string option) () =
  ({ values = values_; type_ = type__ } : data_resource)
let make_event_selector
  ?exclude_management_event_sources:(exclude_management_event_sources_ :
                                      string list option)
  ?data_resources:(data_resources_ : data_resource list option)
  ?include_management_events:(include_management_events_ : bool option)
  ?read_write_type:(read_write_type_ : read_write_type option) () =
  ({
     exclude_management_event_sources = exclude_management_event_sources_;
     data_resources = data_resources_;
     include_management_events = include_management_events_;
     read_write_type = read_write_type_
   } : event_selector)
let make_put_event_selectors_response
  ?advanced_event_selectors:(advanced_event_selectors_ :
                              advanced_event_selector list option)
  ?event_selectors:(event_selectors_ : event_selector list option)
  ?trail_ar_n:(trail_ar_n_ : string option) () =
  ({
     advanced_event_selectors = advanced_event_selectors_;
     event_selectors = event_selectors_;
     trail_ar_n = trail_ar_n_
   } : put_event_selectors_response)
let make_put_event_selectors_request
  ?advanced_event_selectors:(advanced_event_selectors_ :
                              advanced_event_selector list option)
  ?event_selectors:(event_selectors_ : event_selector list option)
  ~trail_name:(trail_name_ : string) () =
  ({
     advanced_event_selectors = advanced_event_selectors_;
     event_selectors = event_selectors_;
     trail_name = trail_name_
   } : put_event_selectors_request)
let make_context_key_selector ~equals:(equals_ : string list)
  ~type_:(type__ : type_) () =
  ({ equals = equals_; type_ = type__ } : context_key_selector)
let make_put_event_configuration_response
  ?context_key_selectors:(context_key_selectors_ :
                           context_key_selector list option)
  ?max_event_size:(max_event_size_ : max_event_size option)
  ?event_data_store_arn:(event_data_store_arn_ : string option) () =
  ({
     context_key_selectors = context_key_selectors_;
     max_event_size = max_event_size_;
     event_data_store_arn = event_data_store_arn_
   } : put_event_configuration_response)
let make_put_event_configuration_request
  ?event_data_store:(event_data_store_ : string option)
  ~context_key_selectors:(context_key_selectors_ : context_key_selector list)
  ~max_event_size:(max_event_size_ : max_event_size) () =
  ({
     context_key_selectors = context_key_selectors_;
     max_event_size = max_event_size_;
     event_data_store = event_data_store_
   } : put_event_configuration_request)
let make_public_key ?fingerprint:(fingerprint_ : string option)
  ?validity_end_time:(validity_end_time_ : CoreTypes.Timestamp.t option)
  ?validity_start_time:(validity_start_time_ : CoreTypes.Timestamp.t option)
  ?value:(value_ : bytes option) () =
  ({
     fingerprint = fingerprint_;
     validity_end_time = validity_end_time_;
     validity_start_time = validity_start_time_;
     value = value_
   } : public_key)
let make_partition_key ~type_:(type__ : string) ~name:(name_ : string) () =
  ({ type_ = type__; name = name_ } : partition_key)
let make_event ?cloud_trail_event:(cloud_trail_event_ : string option)
  ?resources:(resources_ : resource list option)
  ?username:(username_ : string option)
  ?event_source:(event_source_ : string option)
  ?event_time:(event_time_ : CoreTypes.Timestamp.t option)
  ?access_key_id:(access_key_id_ : string option)
  ?read_only:(read_only_ : string option)
  ?event_name:(event_name_ : string option)
  ?event_id:(event_id_ : string option) () =
  ({
     cloud_trail_event = cloud_trail_event_;
     resources = resources_;
     username = username_;
     event_source = event_source_;
     event_time = event_time_;
     access_key_id = access_key_id_;
     read_only = read_only_;
     event_name = event_name_;
     event_id = event_id_
   } : event)
let make_lookup_events_response ?next_token:(next_token_ : string option)
  ?events:(events_ : event list option) () =
  ({ next_token = next_token_; events = events_ } : lookup_events_response)
let make_lookup_attribute ~attribute_value:(attribute_value_ : string)
  ~attribute_key:(attribute_key_ : lookup_attribute_key) () =
  ({ attribute_value = attribute_value_; attribute_key = attribute_key_ } : 
  lookup_attribute)
let make_lookup_events_request ?next_token:(next_token_ : string option)
  ?max_results:(max_results_ : int option)
  ?event_category:(event_category_ : event_category option)
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option)
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option)
  ?lookup_attributes:(lookup_attributes_ : lookup_attribute list option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     event_category = event_category_;
     end_time = end_time_;
     start_time = start_time_;
     lookup_attributes = lookup_attributes_
   } : lookup_events_request)
let make_list_trails_response ?next_token:(next_token_ : string option)
  ?trails:(trails_ : trail_info list option) () =
  ({ next_token = next_token_; trails = trails_ } : list_trails_response)
let make_list_trails_request ?next_token:(next_token_ : string option) () =
  ({ next_token = next_token_ } : list_trails_request)
let make_list_tags_response ?next_token:(next_token_ : string option)
  ?resource_tag_list:(resource_tag_list_ : resource_tag list option) () =
  ({ next_token = next_token_; resource_tag_list = resource_tag_list_ } : 
  list_tags_response)
let make_list_tags_request ?next_token:(next_token_ : string option)
  ~resource_id_list:(resource_id_list_ : string list) () =
  ({ next_token = next_token_; resource_id_list = resource_id_list_ } : 
  list_tags_request)
let make_list_queries_response ?next_token:(next_token_ : string option)
  ?queries:(queries_ : query list option) () =
  ({ next_token = next_token_; queries = queries_ } : list_queries_response)
let make_list_queries_request
  ?query_status:(query_status_ : query_status option)
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option)
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option)
  ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option)
  ~event_data_store:(event_data_store_ : string) () =
  ({
     query_status = query_status_;
     end_time = end_time_;
     start_time = start_time_;
     max_results = max_results_;
     next_token = next_token_;
     event_data_store = event_data_store_
   } : list_queries_request)
let make_list_public_keys_response ?next_token:(next_token_ : string option)
  ?public_key_list:(public_key_list_ : public_key list option) () =
  ({ next_token = next_token_; public_key_list = public_key_list_ } : 
  list_public_keys_response)
let make_list_public_keys_request ?next_token:(next_token_ : string option)
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option)
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option) () =
  ({ next_token = next_token_; end_time = end_time_; start_time = start_time_
   } : list_public_keys_request)
let make_list_insights_metric_data_response
  ?next_token:(next_token_ : string option)
  ?values:(values_ : float list option)
  ?timestamps:(timestamps_ : CoreTypes.Timestamp.t list option)
  ?error_code:(error_code_ : string option)
  ?insight_type:(insight_type_ : insight_type option)
  ?event_name:(event_name_ : string option)
  ?event_source:(event_source_ : string option) () =
  ({
     next_token = next_token_;
     values = values_;
     timestamps = timestamps_;
     error_code = error_code_;
     insight_type = insight_type_;
     event_name = event_name_;
     event_source = event_source_
   } : list_insights_metric_data_response)
let make_list_insights_metric_data_request
  ?next_token:(next_token_ : string option)
  ?max_results:(max_results_ : int option)
  ?data_type:(data_type_ : insights_metric_data_type option)
  ?period:(period_ : int option)
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option)
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option)
  ?error_code:(error_code_ : string option)
  ~insight_type:(insight_type_ : insight_type)
  ~event_name:(event_name_ : string) ~event_source:(event_source_ : string)
  () =
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
     event_source = event_source_
   } : list_insights_metric_data_request)
let make_imports_list_item
  ?updated_timestamp:(updated_timestamp_ : CoreTypes.Timestamp.t option)
  ?created_timestamp:(created_timestamp_ : CoreTypes.Timestamp.t option)
  ?destinations:(destinations_ : string list option)
  ?import_status:(import_status_ : import_status option)
  ?import_id:(import_id_ : string option) () =
  ({
     updated_timestamp = updated_timestamp_;
     created_timestamp = created_timestamp_;
     destinations = destinations_;
     import_status = import_status_;
     import_id = import_id_
   } : imports_list_item)
let make_list_imports_response ?next_token:(next_token_ : string option)
  ?imports:(imports_ : imports_list_item list option) () =
  ({ next_token = next_token_; imports = imports_ } : list_imports_response)
let make_list_imports_request ?next_token:(next_token_ : string option)
  ?import_status:(import_status_ : import_status option)
  ?destination:(destination_ : string option)
  ?max_results:(max_results_ : int option) () =
  ({
     next_token = next_token_;
     import_status = import_status_;
     destination = destination_;
     max_results = max_results_
   } : list_imports_request)
let make_import_failure_list_item
  ?last_updated_time:(last_updated_time_ : CoreTypes.Timestamp.t option)
  ?error_message:(error_message_ : string option)
  ?error_type:(error_type_ : string option)
  ?status:(status_ : import_failure_status option)
  ?location:(location_ : string option) () =
  ({
     last_updated_time = last_updated_time_;
     error_message = error_message_;
     error_type = error_type_;
     status = status_;
     location = location_
   } : import_failure_list_item)
let make_list_import_failures_response
  ?next_token:(next_token_ : string option)
  ?failures:(failures_ : import_failure_list_item list option) () =
  ({ next_token = next_token_; failures = failures_ } : list_import_failures_response)
let make_list_import_failures_request
  ?next_token:(next_token_ : string option)
  ?max_results:(max_results_ : int option) ~import_id:(import_id_ : string)
  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     import_id = import_id_
   } : list_import_failures_request)
let make_event_data_store
  ?updated_timestamp:(updated_timestamp_ : CoreTypes.Timestamp.t option)
  ?created_timestamp:(created_timestamp_ : CoreTypes.Timestamp.t option)
  ?retention_period:(retention_period_ : int option)
  ?organization_enabled:(organization_enabled_ : bool option)
  ?multi_region_enabled:(multi_region_enabled_ : bool option)
  ?advanced_event_selectors:(advanced_event_selectors_ :
                              advanced_event_selector list option)
  ?status:(status_ : event_data_store_status option)
  ?termination_protection_enabled:(termination_protection_enabled_ :
                                    bool option)
  ?name:(name_ : string option)
  ?event_data_store_arn:(event_data_store_arn_ : string option) () =
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
     event_data_store_arn = event_data_store_arn_
   } : event_data_store)
let make_list_event_data_stores_response
  ?next_token:(next_token_ : string option)
  ?event_data_stores:(event_data_stores_ : event_data_store list option) () =
  ({ next_token = next_token_; event_data_stores = event_data_stores_ } : 
  list_event_data_stores_response)
let make_list_event_data_stores_request
  ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_event_data_stores_request)
let make_dashboard_detail ?type_:(type__ : dashboard_type option)
  ?dashboard_arn:(dashboard_arn_ : string option) () =
  ({ type_ = type__; dashboard_arn = dashboard_arn_ } : dashboard_detail)
let make_list_dashboards_response ?next_token:(next_token_ : string option)
  ?dashboards:(dashboards_ : dashboard_detail list option) () =
  ({ next_token = next_token_; dashboards = dashboards_ } : list_dashboards_response)
let make_list_dashboards_request ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option)
  ?type_:(type__ : dashboard_type option)
  ?name_prefix:(name_prefix_ : string option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     type_ = type__;
     name_prefix = name_prefix_
   } : list_dashboards_request)
let make_channel ?name:(name_ : string option)
  ?channel_arn:(channel_arn_ : string option) () =
  ({ name = name_; channel_arn = channel_arn_ } : channel)
let make_list_channels_response ?next_token:(next_token_ : string option)
  ?channels:(channels_ : channel list option) () =
  ({ next_token = next_token_; channels = channels_ } : list_channels_response)
let make_list_channels_request ?next_token:(next_token_ : string option)
  ?max_results:(max_results_ : int option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_channels_request)
let make_ingestion_status
  ?latest_ingestion_attempt_event_i_d:(latest_ingestion_attempt_event_i_d_ :
                                        string option)
  ?latest_ingestion_attempt_time:(latest_ingestion_attempt_time_ :
                                   CoreTypes.Timestamp.t option)
  ?latest_ingestion_error_code:(latest_ingestion_error_code_ : string option)
  ?latest_ingestion_success_event_i_d:(latest_ingestion_success_event_i_d_ :
                                        string option)
  ?latest_ingestion_success_time:(latest_ingestion_success_time_ :
                                   CoreTypes.Timestamp.t option)
  () =
  ({
     latest_ingestion_attempt_event_i_d = latest_ingestion_attempt_event_i_d_;
     latest_ingestion_attempt_time = latest_ingestion_attempt_time_;
     latest_ingestion_error_code = latest_ingestion_error_code_;
     latest_ingestion_success_event_i_d = latest_ingestion_success_event_i_d_;
     latest_ingestion_success_time = latest_ingestion_success_time_
   } : ingestion_status)
let make_get_trail_status_response
  ?time_logging_stopped:(time_logging_stopped_ : string option)
  ?time_logging_started:(time_logging_started_ : string option)
  ?latest_delivery_attempt_succeeded:(latest_delivery_attempt_succeeded_ :
                                       string option)
  ?latest_notification_attempt_succeeded:(latest_notification_attempt_succeeded_
                                           : string option)
  ?latest_notification_attempt_time:(latest_notification_attempt_time_ :
                                      string option)
  ?latest_delivery_attempt_time:(latest_delivery_attempt_time_ :
                                  string option)
  ?latest_digest_delivery_error:(latest_digest_delivery_error_ :
                                  string option)
  ?latest_digest_delivery_time:(latest_digest_delivery_time_ :
                                 CoreTypes.Timestamp.t option)
  ?latest_cloud_watch_logs_delivery_time:(latest_cloud_watch_logs_delivery_time_
                                           : CoreTypes.Timestamp.t option)
  ?latest_cloud_watch_logs_delivery_error:(latest_cloud_watch_logs_delivery_error_
                                            : string option)
  ?stop_logging_time:(stop_logging_time_ : CoreTypes.Timestamp.t option)
  ?start_logging_time:(start_logging_time_ : CoreTypes.Timestamp.t option)
  ?latest_notification_time:(latest_notification_time_ :
                              CoreTypes.Timestamp.t option)
  ?latest_delivery_time:(latest_delivery_time_ :
                          CoreTypes.Timestamp.t option)
  ?latest_notification_error:(latest_notification_error_ : string option)
  ?latest_delivery_error:(latest_delivery_error_ : string option)
  ?is_logging:(is_logging_ : bool option) () =
  ({
     time_logging_stopped = time_logging_stopped_;
     time_logging_started = time_logging_started_;
     latest_delivery_attempt_succeeded = latest_delivery_attempt_succeeded_;
     latest_notification_attempt_succeeded =
       latest_notification_attempt_succeeded_;
     latest_notification_attempt_time = latest_notification_attempt_time_;
     latest_delivery_attempt_time = latest_delivery_attempt_time_;
     latest_digest_delivery_error = latest_digest_delivery_error_;
     latest_digest_delivery_time = latest_digest_delivery_time_;
     latest_cloud_watch_logs_delivery_time =
       latest_cloud_watch_logs_delivery_time_;
     latest_cloud_watch_logs_delivery_error =
       latest_cloud_watch_logs_delivery_error_;
     stop_logging_time = stop_logging_time_;
     start_logging_time = start_logging_time_;
     latest_notification_time = latest_notification_time_;
     latest_delivery_time = latest_delivery_time_;
     latest_notification_error = latest_notification_error_;
     latest_delivery_error = latest_delivery_error_;
     is_logging = is_logging_
   } : get_trail_status_response)
let make_get_trail_status_request ~name:(name_ : string) () =
  ({ name = name_ } : get_trail_status_request)
let make_get_trail_response ?trail:(trail_ : trail option) () =
  ({ trail = trail_ } : get_trail_response)
let make_get_trail_request ~name:(name_ : string) () =
  ({ name = name_ } : get_trail_request)
let make_get_resource_policy_response
  ?delegated_admin_resource_policy:(delegated_admin_resource_policy_ :
                                     string option)
  ?resource_policy:(resource_policy_ : string option)
  ?resource_arn:(resource_arn_ : string option) () =
  ({
     delegated_admin_resource_policy = delegated_admin_resource_policy_;
     resource_policy = resource_policy_;
     resource_arn = resource_arn_
   } : get_resource_policy_response)
let make_get_resource_policy_request ~resource_arn:(resource_arn_ : string)
  () = ({ resource_arn = resource_arn_ } : get_resource_policy_request)
let make_get_query_results_response
  ?error_message:(error_message_ : string option)
  ?next_token:(next_token_ : string option)
  ?query_result_rows:(query_result_rows_ :
                       query_result_column list list option)
  ?query_statistics:(query_statistics_ : query_statistics option)
  ?query_status:(query_status_ : query_status option) () =
  ({
     error_message = error_message_;
     next_token = next_token_;
     query_result_rows = query_result_rows_;
     query_statistics = query_statistics_;
     query_status = query_status_
   } : get_query_results_response)
let make_get_query_results_request
  ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ :
                                       string option)
  ?max_query_results:(max_query_results_ : int option)
  ?next_token:(next_token_ : string option)
  ?event_data_store:(event_data_store_ : string option)
  ~query_id:(query_id_ : string) () =
  ({
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
     max_query_results = max_query_results_;
     next_token = next_token_;
     query_id = query_id_;
     event_data_store = event_data_store_
   } : get_query_results_request)
let make_get_insight_selectors_response
  ?insights_destination:(insights_destination_ : string option)
  ?event_data_store_arn:(event_data_store_arn_ : string option)
  ?insight_selectors:(insight_selectors_ : insight_selector list option)
  ?trail_ar_n:(trail_ar_n_ : string option) () =
  ({
     insights_destination = insights_destination_;
     event_data_store_arn = event_data_store_arn_;
     insight_selectors = insight_selectors_;
     trail_ar_n = trail_ar_n_
   } : get_insight_selectors_response)
let make_get_insight_selectors_request
  ?event_data_store:(event_data_store_ : string option)
  ?trail_name:(trail_name_ : string option) () =
  ({ event_data_store = event_data_store_; trail_name = trail_name_ } : 
  get_insight_selectors_request)
let make_get_import_response
  ?import_statistics:(import_statistics_ : import_statistics option)
  ?updated_timestamp:(updated_timestamp_ : CoreTypes.Timestamp.t option)
  ?created_timestamp:(created_timestamp_ : CoreTypes.Timestamp.t option)
  ?import_status:(import_status_ : import_status option)
  ?end_event_time:(end_event_time_ : CoreTypes.Timestamp.t option)
  ?start_event_time:(start_event_time_ : CoreTypes.Timestamp.t option)
  ?import_source:(import_source_ : import_source option)
  ?destinations:(destinations_ : string list option)
  ?import_id:(import_id_ : string option) () =
  ({
     import_statistics = import_statistics_;
     updated_timestamp = updated_timestamp_;
     created_timestamp = created_timestamp_;
     import_status = import_status_;
     end_event_time = end_event_time_;
     start_event_time = start_event_time_;
     import_source = import_source_;
     destinations = destinations_;
     import_id = import_id_
   } : get_import_response)
let make_get_import_request ~import_id:(import_id_ : string) () =
  ({ import_id = import_id_ } : get_import_request)
let make_get_event_selectors_response
  ?advanced_event_selectors:(advanced_event_selectors_ :
                              advanced_event_selector list option)
  ?event_selectors:(event_selectors_ : event_selector list option)
  ?trail_ar_n:(trail_ar_n_ : string option) () =
  ({
     advanced_event_selectors = advanced_event_selectors_;
     event_selectors = event_selectors_;
     trail_ar_n = trail_ar_n_
   } : get_event_selectors_response)
let make_get_event_selectors_request ~trail_name:(trail_name_ : string) () =
  ({ trail_name = trail_name_ } : get_event_selectors_request)
let make_get_event_data_store_response
  ?partition_keys:(partition_keys_ : partition_key list option)
  ?federation_role_arn:(federation_role_arn_ : string option)
  ?federation_status:(federation_status_ : federation_status option)
  ?billing_mode:(billing_mode_ : billing_mode option)
  ?kms_key_id:(kms_key_id_ : string option)
  ?updated_timestamp:(updated_timestamp_ : CoreTypes.Timestamp.t option)
  ?created_timestamp:(created_timestamp_ : CoreTypes.Timestamp.t option)
  ?termination_protection_enabled:(termination_protection_enabled_ :
                                    bool option)
  ?retention_period:(retention_period_ : int option)
  ?organization_enabled:(organization_enabled_ : bool option)
  ?multi_region_enabled:(multi_region_enabled_ : bool option)
  ?advanced_event_selectors:(advanced_event_selectors_ :
                              advanced_event_selector list option)
  ?status:(status_ : event_data_store_status option)
  ?name:(name_ : string option)
  ?event_data_store_arn:(event_data_store_arn_ : string option) () =
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
     event_data_store_arn = event_data_store_arn_
   } : get_event_data_store_response)
let make_get_event_data_store_request
  ~event_data_store:(event_data_store_ : string) () =
  ({ event_data_store = event_data_store_ } : get_event_data_store_request)
let make_get_event_configuration_response
  ?context_key_selectors:(context_key_selectors_ :
                           context_key_selector list option)
  ?max_event_size:(max_event_size_ : max_event_size option)
  ?event_data_store_arn:(event_data_store_arn_ : string option) () =
  ({
     context_key_selectors = context_key_selectors_;
     max_event_size = max_event_size_;
     event_data_store_arn = event_data_store_arn_
   } : get_event_configuration_response)
let make_get_event_configuration_request
  ?event_data_store:(event_data_store_ : string option) () =
  ({ event_data_store = event_data_store_ } : get_event_configuration_request)
let make_get_dashboard_response
  ?termination_protection_enabled:(termination_protection_enabled_ :
                                    bool option)
  ?last_refresh_failure_reason:(last_refresh_failure_reason_ : string option)
  ?last_refresh_id:(last_refresh_id_ : string option)
  ?updated_timestamp:(updated_timestamp_ : CoreTypes.Timestamp.t option)
  ?created_timestamp:(created_timestamp_ : CoreTypes.Timestamp.t option)
  ?refresh_schedule:(refresh_schedule_ : refresh_schedule option)
  ?widgets:(widgets_ : widget list option)
  ?status:(status_ : dashboard_status option)
  ?type_:(type__ : dashboard_type option)
  ?dashboard_arn:(dashboard_arn_ : string option) () =
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
     dashboard_arn = dashboard_arn_
   } : get_dashboard_response)
let make_get_dashboard_request ~dashboard_id:(dashboard_id_ : string) () =
  ({ dashboard_id = dashboard_id_ } : get_dashboard_request)
let make_get_channel_response
  ?ingestion_status:(ingestion_status_ : ingestion_status option)
  ?destinations:(destinations_ : destination list option)
  ?source_config:(source_config_ : source_config option)
  ?source:(source_ : string option) ?name:(name_ : string option)
  ?channel_arn:(channel_arn_ : string option) () =
  ({
     ingestion_status = ingestion_status_;
     destinations = destinations_;
     source_config = source_config_;
     source = source_;
     name = name_;
     channel_arn = channel_arn_
   } : get_channel_response)
let make_get_channel_request ~channel:(channel_ : string) () =
  ({ channel = channel_ } : get_channel_request)
let make_generate_query_response
  ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ :
                                       string option)
  ?query_alias:(query_alias_ : string option)
  ?query_statement:(query_statement_ : string option) () =
  ({
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
     query_alias = query_alias_;
     query_statement = query_statement_
   } : generate_query_response)
let make_generate_query_request ~prompt:(prompt_ : string)
  ~event_data_stores:(event_data_stores_ : string list) () =
  ({ prompt = prompt_; event_data_stores = event_data_stores_ } : generate_query_request)
let make_enable_federation_response
  ?federation_role_arn:(federation_role_arn_ : string option)
  ?federation_status:(federation_status_ : federation_status option)
  ?event_data_store_arn:(event_data_store_arn_ : string option) () =
  ({
     federation_role_arn = federation_role_arn_;
     federation_status = federation_status_;
     event_data_store_arn = event_data_store_arn_
   } : enable_federation_response)
let make_enable_federation_request
  ~federation_role_arn:(federation_role_arn_ : string)
  ~event_data_store:(event_data_store_ : string) () =
  ({
     federation_role_arn = federation_role_arn_;
     event_data_store = event_data_store_
   } : enable_federation_request)
let make_disable_federation_response
  ?federation_status:(federation_status_ : federation_status option)
  ?event_data_store_arn:(event_data_store_arn_ : string option) () =
  ({
     federation_status = federation_status_;
     event_data_store_arn = event_data_store_arn_
   } : disable_federation_response)
let make_disable_federation_request
  ~event_data_store:(event_data_store_ : string) () =
  ({ event_data_store = event_data_store_ } : disable_federation_request)
let make_describe_trails_response
  ?trail_list:(trail_list_ : trail list option) () =
  ({ trail_list = trail_list_ } : describe_trails_response)
let make_describe_trails_request
  ?include_shadow_trails:(include_shadow_trails_ : bool option)
  ?trail_name_list:(trail_name_list_ : string list option) () =
  ({
     include_shadow_trails = include_shadow_trails_;
     trail_name_list = trail_name_list_
   } : describe_trails_request)
let make_describe_query_response
  ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ :
                                       string option)
  ?prompt:(prompt_ : string option)
  ?delivery_status:(delivery_status_ : delivery_status option)
  ?delivery_s3_uri:(delivery_s3_uri_ : string option)
  ?error_message:(error_message_ : string option)
  ?query_statistics:(query_statistics_ :
                      query_statistics_for_describe_query option)
  ?query_status:(query_status_ : query_status option)
  ?query_string:(query_string_ : string option)
  ?query_id:(query_id_ : string option) () =
  ({
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
     prompt = prompt_;
     delivery_status = delivery_status_;
     delivery_s3_uri = delivery_s3_uri_;
     error_message = error_message_;
     query_statistics = query_statistics_;
     query_status = query_status_;
     query_string = query_string_;
     query_id = query_id_
   } : describe_query_response)
let make_describe_query_request
  ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ :
                                       string option)
  ?refresh_id:(refresh_id_ : string option)
  ?query_alias:(query_alias_ : string option)
  ?query_id:(query_id_ : string option)
  ?event_data_store:(event_data_store_ : string option) () =
  ({
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
     refresh_id = refresh_id_;
     query_alias = query_alias_;
     query_id = query_id_;
     event_data_store = event_data_store_
   } : describe_query_request)
let make_deregister_organization_delegated_admin_response () = (() : unit)
let make_deregister_organization_delegated_admin_request
  ~delegated_admin_account_id:(delegated_admin_account_id_ : string) () =
  ({ delegated_admin_account_id = delegated_admin_account_id_ } : deregister_organization_delegated_admin_request)
let make_delete_trail_response () = (() : unit)
let make_delete_trail_request ~name:(name_ : string) () =
  ({ name = name_ } : delete_trail_request)
let make_delete_resource_policy_response () = (() : unit)
let make_delete_resource_policy_request
  ~resource_arn:(resource_arn_ : string) () =
  ({ resource_arn = resource_arn_ } : delete_resource_policy_request)
let make_delete_event_data_store_response () = (() : unit)
let make_delete_event_data_store_request
  ~event_data_store:(event_data_store_ : string) () =
  ({ event_data_store = event_data_store_ } : delete_event_data_store_request)
let make_delete_dashboard_response () = (() : unit)
let make_delete_dashboard_request ~dashboard_id:(dashboard_id_ : string) () =
  ({ dashboard_id = dashboard_id_ } : delete_dashboard_request)
let make_delete_channel_response () = (() : unit)
let make_delete_channel_request ~channel:(channel_ : string) () =
  ({ channel = channel_ } : delete_channel_request)
let make_create_trail_response
  ?is_organization_trail:(is_organization_trail_ : bool option)
  ?kms_key_id:(kms_key_id_ : string option)
  ?cloud_watch_logs_role_arn:(cloud_watch_logs_role_arn_ : string option)
  ?cloud_watch_logs_log_group_arn:(cloud_watch_logs_log_group_arn_ :
                                    string option)
  ?log_file_validation_enabled:(log_file_validation_enabled_ : bool option)
  ?trail_ar_n:(trail_ar_n_ : string option)
  ?is_multi_region_trail:(is_multi_region_trail_ : bool option)
  ?include_global_service_events:(include_global_service_events_ :
                                   bool option)
  ?sns_topic_ar_n:(sns_topic_ar_n_ : string option)
  ?sns_topic_name:(sns_topic_name_ : string option)
  ?s3_key_prefix:(s3_key_prefix_ : string option)
  ?s3_bucket_name:(s3_bucket_name_ : string option)
  ?name:(name_ : string option) () =
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
     name = name_
   } : create_trail_response)
let make_create_trail_request ?tags_list:(tags_list_ : tag list option)
  ?is_organization_trail:(is_organization_trail_ : bool option)
  ?kms_key_id:(kms_key_id_ : string option)
  ?cloud_watch_logs_role_arn:(cloud_watch_logs_role_arn_ : string option)
  ?cloud_watch_logs_log_group_arn:(cloud_watch_logs_log_group_arn_ :
                                    string option)
  ?enable_log_file_validation:(enable_log_file_validation_ : bool option)
  ?is_multi_region_trail:(is_multi_region_trail_ : bool option)
  ?include_global_service_events:(include_global_service_events_ :
                                   bool option)
  ?sns_topic_name:(sns_topic_name_ : string option)
  ?s3_key_prefix:(s3_key_prefix_ : string option)
  ~s3_bucket_name:(s3_bucket_name_ : string) ~name:(name_ : string) () =
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
     name = name_
   } : create_trail_request)
let make_create_event_data_store_response
  ?billing_mode:(billing_mode_ : billing_mode option)
  ?kms_key_id:(kms_key_id_ : string option)
  ?updated_timestamp:(updated_timestamp_ : CoreTypes.Timestamp.t option)
  ?created_timestamp:(created_timestamp_ : CoreTypes.Timestamp.t option)
  ?tags_list:(tags_list_ : tag list option)
  ?termination_protection_enabled:(termination_protection_enabled_ :
                                    bool option)
  ?retention_period:(retention_period_ : int option)
  ?organization_enabled:(organization_enabled_ : bool option)
  ?multi_region_enabled:(multi_region_enabled_ : bool option)
  ?advanced_event_selectors:(advanced_event_selectors_ :
                              advanced_event_selector list option)
  ?status:(status_ : event_data_store_status option)
  ?name:(name_ : string option)
  ?event_data_store_arn:(event_data_store_arn_ : string option) () =
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
     event_data_store_arn = event_data_store_arn_
   } : create_event_data_store_response)
let make_create_event_data_store_request
  ?billing_mode:(billing_mode_ : billing_mode option)
  ?start_ingestion:(start_ingestion_ : bool option)
  ?kms_key_id:(kms_key_id_ : string option)
  ?tags_list:(tags_list_ : tag list option)
  ?termination_protection_enabled:(termination_protection_enabled_ :
                                    bool option)
  ?retention_period:(retention_period_ : int option)
  ?organization_enabled:(organization_enabled_ : bool option)
  ?multi_region_enabled:(multi_region_enabled_ : bool option)
  ?advanced_event_selectors:(advanced_event_selectors_ :
                              advanced_event_selector list option)
  ~name:(name_ : string) () =
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
     name = name_
   } : create_event_data_store_request)
let make_create_dashboard_response
  ?termination_protection_enabled:(termination_protection_enabled_ :
                                    bool option)
  ?refresh_schedule:(refresh_schedule_ : refresh_schedule option)
  ?tags_list:(tags_list_ : tag list option)
  ?widgets:(widgets_ : widget list option)
  ?type_:(type__ : dashboard_type option) ?name:(name_ : string option)
  ?dashboard_arn:(dashboard_arn_ : string option) () =
  ({
     termination_protection_enabled = termination_protection_enabled_;
     refresh_schedule = refresh_schedule_;
     tags_list = tags_list_;
     widgets = widgets_;
     type_ = type__;
     name = name_;
     dashboard_arn = dashboard_arn_
   } : create_dashboard_response)
let make_create_dashboard_request
  ?widgets:(widgets_ : request_widget list option)
  ?termination_protection_enabled:(termination_protection_enabled_ :
                                    bool option)
  ?tags_list:(tags_list_ : tag list option)
  ?refresh_schedule:(refresh_schedule_ : refresh_schedule option)
  ~name:(name_ : string) () =
  ({
     widgets = widgets_;
     termination_protection_enabled = termination_protection_enabled_;
     tags_list = tags_list_;
     refresh_schedule = refresh_schedule_;
     name = name_
   } : create_dashboard_request)
let make_create_channel_response ?tags:(tags_ : tag list option)
  ?destinations:(destinations_ : destination list option)
  ?source:(source_ : string option) ?name:(name_ : string option)
  ?channel_arn:(channel_arn_ : string option) () =
  ({
     tags = tags_;
     destinations = destinations_;
     source = source_;
     name = name_;
     channel_arn = channel_arn_
   } : create_channel_response)
let make_create_channel_request ?tags:(tags_ : tag list option)
  ~destinations:(destinations_ : destination list) ~source:(source_ : string)
  ~name:(name_ : string) () =
  ({
     tags = tags_;
     destinations = destinations_;
     source = source_;
     name = name_
   } : create_channel_request)
let make_cancel_query_response
  ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ :
                                       string option)
  ~query_status:(query_status_ : query_status) ~query_id:(query_id_ : string)
  () =
  ({
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
     query_status = query_status_;
     query_id = query_id_
   } : cancel_query_response)
let make_cancel_query_request
  ?event_data_store_owner_account_id:(event_data_store_owner_account_id_ :
                                       string option)
  ?event_data_store:(event_data_store_ : string option)
  ~query_id:(query_id_ : string) () =
  ({
     event_data_store_owner_account_id = event_data_store_owner_account_id_;
     query_id = query_id_;
     event_data_store = event_data_store_
   } : cancel_query_request)
let make_add_tags_response () = (() : unit)
let make_add_tags_request ~tags_list:(tags_list_ : tag list)
  ~resource_id:(resource_id_ : string) () =
  ({ tags_list = tags_list_; resource_id = resource_id_ } : add_tags_request)