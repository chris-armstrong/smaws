open Types

let make_usage_metric_basis
    ?percentage_adjust:(percentage_adjust_ : usage_metric_percentage_adjust option)
    ?name:(name_ : usage_metric_basis_name option) () =
  ({ percentage_adjust = percentage_adjust_; name = name_ } : usage_metric_basis)

let make_update_application_response () = (() : unit)

let make_update_application_request ?wave:(wave_ : application_wave option)
    ?description:(description_ : application_description option)
    ?name:(name_ : application_name option) ~configuration_id:(configuration_id_ : application_id)
    () =
  ({ wave = wave_; description = description_; name = name_; configuration_id = configuration_id_ }
    : update_application_request)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_filter ~values:(values_ : filter_values) ~name:(name_ : filter_name) () =
  ({ values = values_; name = name_ } : tag_filter)

let make_agent_configuration_status ?description:(description_ : string_ option)
    ?operation_succeeded:(operation_succeeded_ : boolean_ option)
    ?agent_id:(agent_id_ : string_ option) () =
  ({ description = description_; operation_succeeded = operation_succeeded_; agent_id = agent_id_ }
    : agent_configuration_status)

let make_stop_data_collection_by_agent_ids_response
    ?agents_configuration_status:
      (agents_configuration_status_ : agent_configuration_status_list option) () =
  ({ agents_configuration_status = agents_configuration_status_ }
    : stop_data_collection_by_agent_ids_response)

let make_stop_data_collection_by_agent_ids_request ~agent_ids:(agent_ids_ : agent_ids) () =
  ({ agent_ids = agent_ids_ } : stop_data_collection_by_agent_ids_request)

let make_stop_continuous_export_response ?stop_time:(stop_time_ : time_stamp option)
    ?start_time:(start_time_ : time_stamp option) () =
  ({ stop_time = stop_time_; start_time = start_time_ } : stop_continuous_export_response)

let make_stop_continuous_export_request ~export_id:(export_id_ : configurations_export_id) () =
  ({ export_id = export_id_ } : stop_continuous_export_request)

let make_import_task
    ?errors_and_failed_entries_zip:(errors_and_failed_entries_zip_ : s3_presigned_url option)
    ?application_import_failure:(application_import_failure_ : integer option)
    ?application_import_success:(application_import_success_ : integer option)
    ?server_import_failure:(server_import_failure_ : integer option)
    ?server_import_success:(server_import_success_ : integer option)
    ?file_classification:(file_classification_ : file_classification option)
    ?import_deleted_time:(import_deleted_time_ : time_stamp option)
    ?import_completion_time:(import_completion_time_ : time_stamp option)
    ?import_request_time:(import_request_time_ : time_stamp option)
    ?status:(status_ : import_status option) ?import_url:(import_url_ : import_ur_l option)
    ?name:(name_ : import_task_name option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?import_task_id:(import_task_id_ : import_task_identifier option) () =
  ({
     errors_and_failed_entries_zip = errors_and_failed_entries_zip_;
     application_import_failure = application_import_failure_;
     application_import_success = application_import_success_;
     server_import_failure = server_import_failure_;
     server_import_success = server_import_success_;
     file_classification = file_classification_;
     import_deleted_time = import_deleted_time_;
     import_completion_time = import_completion_time_;
     import_request_time = import_request_time_;
     status = status_;
     import_url = import_url_;
     name = name_;
     client_request_token = client_request_token_;
     import_task_id = import_task_id_;
   }
    : import_task)

let make_start_import_task_response ?task:(task_ : import_task option) () =
  ({ task = task_ } : start_import_task_response)

let make_start_import_task_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~import_url:(import_url_ : import_ur_l) ~name:(name_ : import_task_name) () =
  ({ import_url = import_url_; name = name_; client_request_token = client_request_token_ }
    : start_import_task_request)

let make_start_export_task_response ?export_id:(export_id_ : configurations_export_id option) () =
  ({ export_id = export_id_ } : start_export_task_response)

let make_export_filter ~condition:(condition_ : condition) ~values:(values_ : filter_values)
    ~name:(name_ : filter_name) () =
  ({ condition = condition_; values = values_; name = name_ } : export_filter)

let make_reserved_instance_options ~term_length:(term_length_ : term_length)
    ~offering_class:(offering_class_ : offering_class)
    ~purchasing_option:(purchasing_option_ : purchasing_option) () =
  ({
     term_length = term_length_;
     offering_class = offering_class_;
     purchasing_option = purchasing_option_;
   }
    : reserved_instance_options)

let make_ec2_recommendations_export_preferences
    ?reserved_instance_options:(reserved_instance_options_ : reserved_instance_options option)
    ?preferred_region:(preferred_region_ : user_preferred_region option)
    ?excluded_instance_types:(excluded_instance_types_ : excluded_instance_types option)
    ?tenancy:(tenancy_ : tenancy option)
    ?ram_performance_metric_basis:(ram_performance_metric_basis_ : usage_metric_basis option)
    ?cpu_performance_metric_basis:(cpu_performance_metric_basis_ : usage_metric_basis option)
    ?enabled:(enabled_ : export_enabled option) () =
  ({
     reserved_instance_options = reserved_instance_options_;
     preferred_region = preferred_region_;
     excluded_instance_types = excluded_instance_types_;
     tenancy = tenancy_;
     ram_performance_metric_basis = ram_performance_metric_basis_;
     cpu_performance_metric_basis = cpu_performance_metric_basis_;
     enabled = enabled_;
   }
    : ec2_recommendations_export_preferences)

let make_start_export_task_request ?preferences:(preferences_ : export_preferences option)
    ?end_time:(end_time_ : time_stamp option) ?start_time:(start_time_ : time_stamp option)
    ?filters:(filters_ : export_filters option)
    ?export_data_format:(export_data_format_ : export_data_formats option) () =
  ({
     preferences = preferences_;
     end_time = end_time_;
     start_time = start_time_;
     filters = filters_;
     export_data_format = export_data_format_;
   }
    : start_export_task_request)

let make_start_data_collection_by_agent_ids_response
    ?agents_configuration_status:
      (agents_configuration_status_ : agent_configuration_status_list option) () =
  ({ agents_configuration_status = agents_configuration_status_ }
    : start_data_collection_by_agent_ids_response)

let make_start_data_collection_by_agent_ids_request ~agent_ids:(agent_ids_ : agent_ids) () =
  ({ agent_ids = agent_ids_ } : start_data_collection_by_agent_ids_request)

let make_start_continuous_export_response
    ?schema_storage_config:(schema_storage_config_ : schema_storage_config option)
    ?data_source:(data_source_ : data_source option) ?start_time:(start_time_ : time_stamp option)
    ?s3_bucket:(s3_bucket_ : s3_bucket option)
    ?export_id:(export_id_ : configurations_export_id option) () =
  ({
     schema_storage_config = schema_storage_config_;
     data_source = data_source_;
     start_time = start_time_;
     s3_bucket = s3_bucket_;
     export_id = export_id_;
   }
    : start_continuous_export_response)

let make_start_continuous_export_request () = (() : unit)

let make_start_batch_delete_configuration_task_response ?task_id:(task_id_ : uui_d option) () =
  ({ task_id = task_id_ } : start_batch_delete_configuration_task_response)

let make_start_batch_delete_configuration_task_request
    ~configuration_ids:(configuration_ids_ : configuration_id_list)
    ~configuration_type:(configuration_type_ : deletion_configuration_item_type) () =
  ({ configuration_ids = configuration_ids_; configuration_type = configuration_type_ }
    : start_batch_delete_configuration_task_request)

let make_order_by_element ?sort_order:(sort_order_ : order_string option)
    ~field_name:(field_name_ : order_by_element_field_name) () =
  ({ sort_order = sort_order_; field_name = field_name_ } : order_by_element)

let make_neighbor_connection_detail ?transport_protocol:(transport_protocol_ : string_ option)
    ?destination_port:(destination_port_ : boxed_integer option)
    ~connections_count:(connections_count_ : long)
    ~destination_server_id:(destination_server_id_ : configuration_id)
    ~source_server_id:(source_server_id_ : configuration_id) () =
  ({
     connections_count = connections_count_;
     transport_protocol = transport_protocol_;
     destination_port = destination_port_;
     destination_server_id = destination_server_id_;
     source_server_id = source_server_id_;
   }
    : neighbor_connection_detail)

let make_list_server_neighbors_response
    ?known_dependency_count:(known_dependency_count_ : long option)
    ?next_token:(next_token_ : string_ option) ~neighbors:(neighbors_ : neighbor_details_list) () =
  ({
     known_dependency_count = known_dependency_count_;
     next_token = next_token_;
     neighbors = neighbors_;
   }
    : list_server_neighbors_response)

let make_list_server_neighbors_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer option)
    ?neighbor_configuration_ids:(neighbor_configuration_ids_ : configuration_id_list option)
    ?port_information_needed:(port_information_needed_ : boolean_ option)
    ~configuration_id:(configuration_id_ : configuration_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     neighbor_configuration_ids = neighbor_configuration_ids_;
     port_information_needed = port_information_needed_;
     configuration_id = configuration_id_;
   }
    : list_server_neighbors_request)

let make_list_configurations_response ?next_token:(next_token_ : next_token option)
    ?configurations:(configurations_ : configurations option) () =
  ({ next_token = next_token_; configurations = configurations_ } : list_configurations_response)

let make_filter ~condition:(condition_ : condition) ~values:(values_ : filter_values)
    ~name:(name_ : string_) () =
  ({ condition = condition_; values = values_; name = name_ } : filter)

let make_list_configurations_request ?order_by:(order_by_ : order_by_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : integer option)
    ?filters:(filters_ : filters option)
    ~configuration_type:(configuration_type_ : configuration_item_type) () =
  ({
     order_by = order_by_;
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     configuration_type = configuration_type_;
   }
    : list_configurations_request)

let make_import_task_filter ?values:(values_ : import_task_filter_value_list option)
    ?name:(name_ : import_task_filter_name option) () =
  ({ values = values_; name = name_ } : import_task_filter)

let make_customer_agent_info ~unknown_agents:(unknown_agents_ : integer)
    ~total_agents:(total_agents_ : integer) ~unhealthy_agents:(unhealthy_agents_ : integer)
    ~shutdown_agents:(shutdown_agents_ : integer)
    ~black_listed_agents:(black_listed_agents_ : integer)
    ~healthy_agents:(healthy_agents_ : integer) ~active_agents:(active_agents_ : integer) () =
  ({
     unknown_agents = unknown_agents_;
     total_agents = total_agents_;
     unhealthy_agents = unhealthy_agents_;
     shutdown_agents = shutdown_agents_;
     black_listed_agents = black_listed_agents_;
     healthy_agents = healthy_agents_;
     active_agents = active_agents_;
   }
    : customer_agent_info)

let make_customer_connector_info ~unknown_connectors:(unknown_connectors_ : integer)
    ~total_connectors:(total_connectors_ : integer)
    ~unhealthy_connectors:(unhealthy_connectors_ : integer)
    ~shutdown_connectors:(shutdown_connectors_ : integer)
    ~black_listed_connectors:(black_listed_connectors_ : integer)
    ~healthy_connectors:(healthy_connectors_ : integer)
    ~active_connectors:(active_connectors_ : integer) () =
  ({
     unknown_connectors = unknown_connectors_;
     total_connectors = total_connectors_;
     unhealthy_connectors = unhealthy_connectors_;
     shutdown_connectors = shutdown_connectors_;
     black_listed_connectors = black_listed_connectors_;
     healthy_connectors = healthy_connectors_;
     active_connectors = active_connectors_;
   }
    : customer_connector_info)

let make_customer_me_collector_info ~unknown_me_collectors:(unknown_me_collectors_ : integer)
    ~total_me_collectors:(total_me_collectors_ : integer)
    ~unhealthy_me_collectors:(unhealthy_me_collectors_ : integer)
    ~shutdown_me_collectors:(shutdown_me_collectors_ : integer)
    ~deny_listed_me_collectors:(deny_listed_me_collectors_ : integer)
    ~healthy_me_collectors:(healthy_me_collectors_ : integer)
    ~active_me_collectors:(active_me_collectors_ : integer) () =
  ({
     unknown_me_collectors = unknown_me_collectors_;
     total_me_collectors = total_me_collectors_;
     unhealthy_me_collectors = unhealthy_me_collectors_;
     shutdown_me_collectors = shutdown_me_collectors_;
     deny_listed_me_collectors = deny_listed_me_collectors_;
     healthy_me_collectors = healthy_me_collectors_;
     active_me_collectors = active_me_collectors_;
   }
    : customer_me_collector_info)

let make_customer_agentless_collector_info
    ~unknown_agentless_collectors:(unknown_agentless_collectors_ : integer)
    ~total_agentless_collectors:(total_agentless_collectors_ : integer)
    ~unhealthy_agentless_collectors:(unhealthy_agentless_collectors_ : integer)
    ~shutdown_agentless_collectors:(shutdown_agentless_collectors_ : integer)
    ~deny_listed_agentless_collectors:(deny_listed_agentless_collectors_ : integer)
    ~healthy_agentless_collectors:(healthy_agentless_collectors_ : integer)
    ~active_agentless_collectors:(active_agentless_collectors_ : integer) () =
  ({
     unknown_agentless_collectors = unknown_agentless_collectors_;
     total_agentless_collectors = total_agentless_collectors_;
     unhealthy_agentless_collectors = unhealthy_agentless_collectors_;
     shutdown_agentless_collectors = shutdown_agentless_collectors_;
     deny_listed_agentless_collectors = deny_listed_agentless_collectors_;
     healthy_agentless_collectors = healthy_agentless_collectors_;
     active_agentless_collectors = active_agentless_collectors_;
   }
    : customer_agentless_collector_info)

let make_get_discovery_summary_response
    ?agentless_collector_summary:
      (agentless_collector_summary_ : customer_agentless_collector_info option)
    ?me_collector_summary:(me_collector_summary_ : customer_me_collector_info option)
    ?connector_summary:(connector_summary_ : customer_connector_info option)
    ?agent_summary:(agent_summary_ : customer_agent_info option)
    ?servers_mappedto_tags:(servers_mappedto_tags_ : long option)
    ?servers_mapped_to_applications:(servers_mapped_to_applications_ : long option)
    ?applications:(applications_ : long option) ?servers:(servers_ : long option) () =
  ({
     agentless_collector_summary = agentless_collector_summary_;
     me_collector_summary = me_collector_summary_;
     connector_summary = connector_summary_;
     agent_summary = agent_summary_;
     servers_mappedto_tags = servers_mappedto_tags_;
     servers_mapped_to_applications = servers_mapped_to_applications_;
     applications = applications_;
     servers = servers_;
   }
    : get_discovery_summary_response)

let make_get_discovery_summary_request () = (() : unit)

let make_failed_configuration ?error_message:(error_message_ : error_message option)
    ?error_status_code:(error_status_code_ : error_status_code option)
    ?configuration_id:(configuration_id_ : configuration_id option) () =
  ({
     error_message = error_message_;
     error_status_code = error_status_code_;
     configuration_id = configuration_id_;
   }
    : failed_configuration)

let make_export_info ?requested_end_time:(requested_end_time_ : time_stamp option)
    ?requested_start_time:(requested_start_time_ : time_stamp option)
    ?is_truncated:(is_truncated_ : boolean_ option)
    ?configurations_download_url:(configurations_download_url_ : configurations_download_url option)
    ~export_request_time:(export_request_time_ : export_request_time)
    ~status_message:(status_message_ : export_status_message)
    ~export_status:(export_status_ : export_status)
    ~export_id:(export_id_ : configurations_export_id) () =
  ({
     requested_end_time = requested_end_time_;
     requested_start_time = requested_start_time_;
     is_truncated = is_truncated_;
     export_request_time = export_request_time_;
     configurations_download_url = configurations_download_url_;
     status_message = status_message_;
     export_status = export_status_;
     export_id = export_id_;
   }
    : export_info)

let make_export_configurations_response ?export_id:(export_id_ : configurations_export_id option) ()
    =
  ({ export_id = export_id_ } : export_configurations_response)

let make_disassociate_configuration_items_from_application_response () = (() : unit)

let make_disassociate_configuration_items_from_application_request
    ~configuration_ids:(configuration_ids_ : configuration_id_list)
    ~application_configuration_id:(application_configuration_id_ : application_id) () =
  ({
     configuration_ids = configuration_ids_;
     application_configuration_id = application_configuration_id_;
   }
    : disassociate_configuration_items_from_application_request)

let make_configuration_tag ?time_of_creation:(time_of_creation_ : time_stamp option)
    ?value:(value_ : tag_value option) ?key:(key_ : tag_key option)
    ?configuration_id:(configuration_id_ : configuration_id option)
    ?configuration_type:(configuration_type_ : configuration_item_type option) () =
  ({
     time_of_creation = time_of_creation_;
     value = value_;
     key = key_;
     configuration_id = configuration_id_;
     configuration_type = configuration_type_;
   }
    : configuration_tag)

let make_describe_tags_response ?next_token:(next_token_ : next_token option)
    ?tags:(tags_ : configuration_tag_set option) () =
  ({ next_token = next_token_; tags = tags_ } : describe_tags_response)

let make_describe_tags_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : integer option) ?filters:(filters_ : tag_filters option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : describe_tags_request)

let make_describe_import_tasks_response ?tasks:(tasks_ : import_task_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ tasks = tasks_; next_token = next_token_ } : describe_import_tasks_response)

let make_describe_import_tasks_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : describe_import_tasks_max_results option)
    ?filters:(filters_ : describe_import_tasks_filter_list option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : describe_import_tasks_request)

let make_describe_export_tasks_response ?next_token:(next_token_ : next_token option)
    ?exports_info:(exports_info_ : exports_info option) () =
  ({ next_token = next_token_; exports_info = exports_info_ } : describe_export_tasks_response)

let make_describe_export_tasks_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : integer option) ?filters:(filters_ : export_filters option)
    ?export_ids:(export_ids_ : export_ids option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     export_ids = export_ids_;
   }
    : describe_export_tasks_request)

let make_describe_export_configurations_response ?next_token:(next_token_ : next_token option)
    ?exports_info:(exports_info_ : exports_info option) () =
  ({ next_token = next_token_; exports_info = exports_info_ }
    : describe_export_configurations_response)

let make_describe_export_configurations_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : integer option) ?export_ids:(export_ids_ : export_ids option) () =
  ({ next_token = next_token_; max_results = max_results_; export_ids = export_ids_ }
    : describe_export_configurations_request)

let make_continuous_export_description
    ?schema_storage_config:(schema_storage_config_ : schema_storage_config option)
    ?data_source:(data_source_ : data_source option) ?stop_time:(stop_time_ : time_stamp option)
    ?start_time:(start_time_ : time_stamp option) ?s3_bucket:(s3_bucket_ : s3_bucket option)
    ?status_detail:(status_detail_ : string_max255 option)
    ?status:(status_ : continuous_export_status option)
    ?export_id:(export_id_ : configurations_export_id option) () =
  ({
     schema_storage_config = schema_storage_config_;
     data_source = data_source_;
     stop_time = stop_time_;
     start_time = start_time_;
     s3_bucket = s3_bucket_;
     status_detail = status_detail_;
     status = status_;
     export_id = export_id_;
   }
    : continuous_export_description)

let make_describe_continuous_exports_response ?next_token:(next_token_ : next_token option)
    ?descriptions:(descriptions_ : continuous_export_descriptions option) () =
  ({ next_token = next_token_; descriptions = descriptions_ }
    : describe_continuous_exports_response)

let make_describe_continuous_exports_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : describe_continuous_exports_max_results option)
    ?export_ids:(export_ids_ : continuous_export_ids option) () =
  ({ next_token = next_token_; max_results = max_results_; export_ids = export_ids_ }
    : describe_continuous_exports_request)

let make_describe_configurations_response
    ?configurations:(configurations_ : describe_configurations_attributes option) () =
  ({ configurations = configurations_ } : describe_configurations_response)

let make_describe_configurations_request
    ~configuration_ids:(configuration_ids_ : configuration_id_list) () =
  ({ configuration_ids = configuration_ids_ } : describe_configurations_request)

let make_deletion_warning ?warning_text:(warning_text_ : warning_text option)
    ?warning_code:(warning_code_ : warning_code option)
    ?configuration_id:(configuration_id_ : configuration_id option) () =
  ({
     warning_text = warning_text_;
     warning_code = warning_code_;
     configuration_id = configuration_id_;
   }
    : deletion_warning)

let make_batch_delete_configuration_task
    ?deletion_warnings:(deletion_warnings_ : deletion_warnings_list option)
    ?failed_configurations:(failed_configurations_ : failed_configuration_list option)
    ?deleted_configurations:(deleted_configurations_ : configuration_id_list option)
    ?requested_configurations:(requested_configurations_ : configuration_id_list option)
    ?configuration_type:(configuration_type_ : deletion_configuration_item_type option)
    ?end_time:(end_time_ : time_stamp option) ?start_time:(start_time_ : time_stamp option)
    ?status:(status_ : batch_delete_configuration_task_status option)
    ?task_id:(task_id_ : uui_d option) () =
  ({
     deletion_warnings = deletion_warnings_;
     failed_configurations = failed_configurations_;
     deleted_configurations = deleted_configurations_;
     requested_configurations = requested_configurations_;
     configuration_type = configuration_type_;
     end_time = end_time_;
     start_time = start_time_;
     status = status_;
     task_id = task_id_;
   }
    : batch_delete_configuration_task)

let make_describe_batch_delete_configuration_task_response
    ?task:(task_ : batch_delete_configuration_task option) () =
  ({ task = task_ } : describe_batch_delete_configuration_task_response)

let make_describe_batch_delete_configuration_task_request ~task_id:(task_id_ : uui_d) () =
  ({ task_id = task_id_ } : describe_batch_delete_configuration_task_request)

let make_agent_network_info ?mac_address:(mac_address_ : string_ option)
    ?ip_address:(ip_address_ : string_ option) () =
  ({ mac_address = mac_address_; ip_address = ip_address_ } : agent_network_info)

let make_agent_info ?registered_time:(registered_time_ : string_ option)
    ?agent_type:(agent_type_ : string_ option)
    ?collection_status:(collection_status_ : string_ option)
    ?last_health_ping_time:(last_health_ping_time_ : string_ option)
    ?health:(health_ : agent_status option) ?version:(version_ : string_ option)
    ?connector_id:(connector_id_ : string_ option)
    ?agent_network_info_list:(agent_network_info_list_ : agent_network_info_list option)
    ?host_name:(host_name_ : string_ option) ?agent_id:(agent_id_ : agent_id option) () =
  ({
     registered_time = registered_time_;
     agent_type = agent_type_;
     collection_status = collection_status_;
     last_health_ping_time = last_health_ping_time_;
     health = health_;
     version = version_;
     connector_id = connector_id_;
     agent_network_info_list = agent_network_info_list_;
     host_name = host_name_;
     agent_id = agent_id_;
   }
    : agent_info)

let make_describe_agents_response ?next_token:(next_token_ : next_token option)
    ?agents_info:(agents_info_ : agents_info option) () =
  ({ next_token = next_token_; agents_info = agents_info_ } : describe_agents_response)

let make_describe_agents_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : integer option) ?filters:(filters_ : filters option)
    ?agent_ids:(agent_ids_ : agent_ids option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     agent_ids = agent_ids_;
   }
    : describe_agents_request)

let make_delete_tags_response () = (() : unit)

let make_delete_tags_request ?tags:(tags_ : tag_set option)
    ~configuration_ids:(configuration_ids_ : configuration_id_list) () =
  ({ tags = tags_; configuration_ids = configuration_ids_ } : delete_tags_request)

let make_delete_applications_response () = (() : unit)

let make_delete_applications_request ~configuration_ids:(configuration_ids_ : application_ids_list)
    () =
  ({ configuration_ids = configuration_ids_ } : delete_applications_request)

let make_delete_agent ?force:(force_ : boolean_ option) ~agent_id:(agent_id_ : agent_id) () =
  ({ force = force_; agent_id = agent_id_ } : delete_agent)

let make_create_tags_response () = (() : unit)

let make_create_tags_request ~tags:(tags_ : tag_set)
    ~configuration_ids:(configuration_ids_ : configuration_id_list) () =
  ({ tags = tags_; configuration_ids = configuration_ids_ } : create_tags_request)

let make_create_application_response ?configuration_id:(configuration_id_ : string_ option) () =
  ({ configuration_id = configuration_id_ } : create_application_response)

let make_create_application_request ?wave:(wave_ : application_wave option)
    ?description:(description_ : application_description option) ~name:(name_ : application_name) ()
    =
  ({ wave = wave_; description = description_; name = name_ } : create_application_request)

let make_batch_delete_import_data_error
    ?error_description:(error_description_ : batch_delete_import_data_error_description option)
    ?error_code:(error_code_ : batch_delete_import_data_error_code option)
    ?import_task_id:(import_task_id_ : import_task_identifier option) () =
  ({
     error_description = error_description_;
     error_code = error_code_;
     import_task_id = import_task_id_;
   }
    : batch_delete_import_data_error)

let make_batch_delete_import_data_response
    ?errors:(errors_ : batch_delete_import_data_error_list option) () =
  ({ errors = errors_ } : batch_delete_import_data_response)

let make_batch_delete_import_data_request ?delete_history:(delete_history_ : boolean_ option)
    ~import_task_ids:(import_task_ids_ : to_delete_identifier_list) () =
  ({ delete_history = delete_history_; import_task_ids = import_task_ids_ }
    : batch_delete_import_data_request)

let make_batch_delete_agent_error ~error_code:(error_code_ : delete_agent_error_code)
    ~error_message:(error_message_ : string_) ~agent_id:(agent_id_ : agent_id) () =
  ({ error_code = error_code_; error_message = error_message_; agent_id = agent_id_ }
    : batch_delete_agent_error)

let make_batch_delete_agents_response ?errors:(errors_ : batch_delete_agent_errors option) () =
  ({ errors = errors_ } : batch_delete_agents_response)

let make_batch_delete_agents_request ~delete_agents:(delete_agents_ : delete_agents) () =
  ({ delete_agents = delete_agents_ } : batch_delete_agents_request)

let make_associate_configuration_items_to_application_response () = (() : unit)

let make_associate_configuration_items_to_application_request
    ~configuration_ids:(configuration_ids_ : configuration_id_list)
    ~application_configuration_id:(application_configuration_id_ : application_id) () =
  ({
     configuration_ids = configuration_ids_;
     application_configuration_id = application_configuration_id_;
   }
    : associate_configuration_items_to_application_request)
