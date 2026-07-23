open Types

let make_update_application_response () = (() : unit)

let make_update_application_request ?name:(name_ : application_name option)
    ?description:(description_ : application_description option)
    ?wave:(wave_ : application_wave option) ~configuration_id:(configuration_id_ : application_id)
    () =
  ({ configuration_id = configuration_id_; name = name_; description = description_; wave = wave_ }
    : update_application_request)

let make_agent_configuration_status ?agent_id:(agent_id_ : string_ option)
    ?operation_succeeded:(operation_succeeded_ : boolean_ option)
    ?description:(description_ : string_ option) () =
  ({ agent_id = agent_id_; operation_succeeded = operation_succeeded_; description = description_ }
    : agent_configuration_status)

let make_stop_data_collection_by_agent_ids_response
    ?agents_configuration_status:
      (agents_configuration_status_ : agent_configuration_status_list option) () =
  ({ agents_configuration_status = agents_configuration_status_ }
    : stop_data_collection_by_agent_ids_response)

let make_stop_data_collection_by_agent_ids_request ~agent_ids:(agent_ids_ : agent_ids) () =
  ({ agent_ids = agent_ids_ } : stop_data_collection_by_agent_ids_request)

let make_stop_continuous_export_response ?start_time:(start_time_ : time_stamp option)
    ?stop_time:(stop_time_ : time_stamp option) () =
  ({ start_time = start_time_; stop_time = stop_time_ } : stop_continuous_export_response)

let make_stop_continuous_export_request ~export_id:(export_id_ : configurations_export_id) () =
  ({ export_id = export_id_ } : stop_continuous_export_request)

let make_import_task ?import_task_id:(import_task_id_ : import_task_identifier option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?name:(name_ : import_task_name option) ?import_url:(import_url_ : import_ur_l option)
    ?status:(status_ : import_status option)
    ?import_request_time:(import_request_time_ : time_stamp option)
    ?import_completion_time:(import_completion_time_ : time_stamp option)
    ?import_deleted_time:(import_deleted_time_ : time_stamp option)
    ?file_classification:(file_classification_ : file_classification option)
    ?server_import_success:(server_import_success_ : integer option)
    ?server_import_failure:(server_import_failure_ : integer option)
    ?application_import_success:(application_import_success_ : integer option)
    ?application_import_failure:(application_import_failure_ : integer option)
    ?errors_and_failed_entries_zip:(errors_and_failed_entries_zip_ : s3_presigned_url option) () =
  ({
     import_task_id = import_task_id_;
     client_request_token = client_request_token_;
     name = name_;
     import_url = import_url_;
     status = status_;
     import_request_time = import_request_time_;
     import_completion_time = import_completion_time_;
     import_deleted_time = import_deleted_time_;
     file_classification = file_classification_;
     server_import_success = server_import_success_;
     server_import_failure = server_import_failure_;
     application_import_success = application_import_success_;
     application_import_failure = application_import_failure_;
     errors_and_failed_entries_zip = errors_and_failed_entries_zip_;
   }
    : import_task)

let make_start_import_task_response ?task:(task_ : import_task option) () =
  ({ task = task_ } : start_import_task_response)

let make_start_import_task_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~name:(name_ : import_task_name) ~import_url:(import_url_ : import_ur_l) () =
  ({ client_request_token = client_request_token_; name = name_; import_url = import_url_ }
    : start_import_task_request)

let make_start_export_task_response ?export_id:(export_id_ : configurations_export_id option) () =
  ({ export_id = export_id_ } : start_export_task_response)

let make_reserved_instance_options ~purchasing_option:(purchasing_option_ : purchasing_option)
    ~offering_class:(offering_class_ : offering_class) ~term_length:(term_length_ : term_length) ()
    =
  ({
     purchasing_option = purchasing_option_;
     offering_class = offering_class_;
     term_length = term_length_;
   }
    : reserved_instance_options)

let make_usage_metric_basis ?name:(name_ : usage_metric_basis_name option)
    ?percentage_adjust:(percentage_adjust_ : usage_metric_percentage_adjust option) () =
  ({ name = name_; percentage_adjust = percentage_adjust_ } : usage_metric_basis)

let make_ec2_recommendations_export_preferences ?enabled:(enabled_ : export_enabled option)
    ?cpu_performance_metric_basis:(cpu_performance_metric_basis_ : usage_metric_basis option)
    ?ram_performance_metric_basis:(ram_performance_metric_basis_ : usage_metric_basis option)
    ?tenancy:(tenancy_ : tenancy option)
    ?excluded_instance_types:(excluded_instance_types_ : excluded_instance_types option)
    ?preferred_region:(preferred_region_ : user_preferred_region option)
    ?reserved_instance_options:(reserved_instance_options_ : reserved_instance_options option) () =
  ({
     enabled = enabled_;
     cpu_performance_metric_basis = cpu_performance_metric_basis_;
     ram_performance_metric_basis = ram_performance_metric_basis_;
     tenancy = tenancy_;
     excluded_instance_types = excluded_instance_types_;
     preferred_region = preferred_region_;
     reserved_instance_options = reserved_instance_options_;
   }
    : ec2_recommendations_export_preferences)

let make_export_filter ~name:(name_ : filter_name) ~values:(values_ : filter_values)
    ~condition:(condition_ : condition) () =
  ({ name = name_; values = values_; condition = condition_ } : export_filter)

let make_start_export_task_request
    ?export_data_format:(export_data_format_ : export_data_formats option)
    ?filters:(filters_ : export_filters option) ?start_time:(start_time_ : time_stamp option)
    ?end_time:(end_time_ : time_stamp option)
    ?preferences:(preferences_ : export_preferences option) () =
  ({
     export_data_format = export_data_format_;
     filters = filters_;
     start_time = start_time_;
     end_time = end_time_;
     preferences = preferences_;
   }
    : start_export_task_request)

let make_start_data_collection_by_agent_ids_response
    ?agents_configuration_status:
      (agents_configuration_status_ : agent_configuration_status_list option) () =
  ({ agents_configuration_status = agents_configuration_status_ }
    : start_data_collection_by_agent_ids_response)

let make_start_data_collection_by_agent_ids_request ~agent_ids:(agent_ids_ : agent_ids) () =
  ({ agent_ids = agent_ids_ } : start_data_collection_by_agent_ids_request)

let make_start_continuous_export_response ?export_id:(export_id_ : configurations_export_id option)
    ?s3_bucket:(s3_bucket_ : s3_bucket option) ?start_time:(start_time_ : time_stamp option)
    ?data_source:(data_source_ : data_source option)
    ?schema_storage_config:(schema_storage_config_ : schema_storage_config option) () =
  ({
     export_id = export_id_;
     s3_bucket = s3_bucket_;
     start_time = start_time_;
     data_source = data_source_;
     schema_storage_config = schema_storage_config_;
   }
    : start_continuous_export_response)

let make_start_continuous_export_request () = (() : unit)

let make_start_batch_delete_configuration_task_response ?task_id:(task_id_ : uui_d option) () =
  ({ task_id = task_id_ } : start_batch_delete_configuration_task_response)

let make_start_batch_delete_configuration_task_request
    ~configuration_type:(configuration_type_ : deletion_configuration_item_type)
    ~configuration_ids:(configuration_ids_ : configuration_id_list) () =
  ({ configuration_type = configuration_type_; configuration_ids = configuration_ids_ }
    : start_batch_delete_configuration_task_request)

let make_neighbor_connection_detail ?destination_port:(destination_port_ : boxed_integer option)
    ?transport_protocol:(transport_protocol_ : string_ option)
    ~source_server_id:(source_server_id_ : configuration_id)
    ~destination_server_id:(destination_server_id_ : configuration_id)
    ~connections_count:(connections_count_ : long) () =
  ({
     source_server_id = source_server_id_;
     destination_server_id = destination_server_id_;
     destination_port = destination_port_;
     transport_protocol = transport_protocol_;
     connections_count = connections_count_;
   }
    : neighbor_connection_detail)

let make_list_server_neighbors_response ?next_token:(next_token_ : string_ option)
    ?known_dependency_count:(known_dependency_count_ : long option)
    ~neighbors:(neighbors_ : neighbor_details_list) () =
  ({
     neighbors = neighbors_;
     next_token = next_token_;
     known_dependency_count = known_dependency_count_;
   }
    : list_server_neighbors_response)

let make_list_server_neighbors_request
    ?port_information_needed:(port_information_needed_ : boolean_ option)
    ?neighbor_configuration_ids:(neighbor_configuration_ids_ : configuration_id_list option)
    ?max_results:(max_results_ : integer option) ?next_token:(next_token_ : string_ option)
    ~configuration_id:(configuration_id_ : configuration_id) () =
  ({
     configuration_id = configuration_id_;
     port_information_needed = port_information_needed_;
     neighbor_configuration_ids = neighbor_configuration_ids_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_server_neighbors_request)

let make_list_configurations_response ?configurations:(configurations_ : configurations option)
    ?next_token:(next_token_ : next_token option) () =
  ({ configurations = configurations_; next_token = next_token_ } : list_configurations_response)

let make_order_by_element ?sort_order:(sort_order_ : order_string option)
    ~field_name:(field_name_ : order_by_element_field_name) () =
  ({ field_name = field_name_; sort_order = sort_order_ } : order_by_element)

let make_filter ~name:(name_ : string_) ~values:(values_ : filter_values)
    ~condition:(condition_ : condition) () =
  ({ name = name_; values = values_; condition = condition_ } : filter)

let make_list_configurations_request ?filters:(filters_ : filters option)
    ?max_results:(max_results_ : integer option) ?next_token:(next_token_ : next_token option)
    ?order_by:(order_by_ : order_by_list option)
    ~configuration_type:(configuration_type_ : configuration_item_type) () =
  ({
     configuration_type = configuration_type_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
     order_by = order_by_;
   }
    : list_configurations_request)

let make_customer_agentless_collector_info
    ~active_agentless_collectors:(active_agentless_collectors_ : integer)
    ~healthy_agentless_collectors:(healthy_agentless_collectors_ : integer)
    ~deny_listed_agentless_collectors:(deny_listed_agentless_collectors_ : integer)
    ~shutdown_agentless_collectors:(shutdown_agentless_collectors_ : integer)
    ~unhealthy_agentless_collectors:(unhealthy_agentless_collectors_ : integer)
    ~total_agentless_collectors:(total_agentless_collectors_ : integer)
    ~unknown_agentless_collectors:(unknown_agentless_collectors_ : integer) () =
  ({
     active_agentless_collectors = active_agentless_collectors_;
     healthy_agentless_collectors = healthy_agentless_collectors_;
     deny_listed_agentless_collectors = deny_listed_agentless_collectors_;
     shutdown_agentless_collectors = shutdown_agentless_collectors_;
     unhealthy_agentless_collectors = unhealthy_agentless_collectors_;
     total_agentless_collectors = total_agentless_collectors_;
     unknown_agentless_collectors = unknown_agentless_collectors_;
   }
    : customer_agentless_collector_info)

let make_customer_me_collector_info ~active_me_collectors:(active_me_collectors_ : integer)
    ~healthy_me_collectors:(healthy_me_collectors_ : integer)
    ~deny_listed_me_collectors:(deny_listed_me_collectors_ : integer)
    ~shutdown_me_collectors:(shutdown_me_collectors_ : integer)
    ~unhealthy_me_collectors:(unhealthy_me_collectors_ : integer)
    ~total_me_collectors:(total_me_collectors_ : integer)
    ~unknown_me_collectors:(unknown_me_collectors_ : integer) () =
  ({
     active_me_collectors = active_me_collectors_;
     healthy_me_collectors = healthy_me_collectors_;
     deny_listed_me_collectors = deny_listed_me_collectors_;
     shutdown_me_collectors = shutdown_me_collectors_;
     unhealthy_me_collectors = unhealthy_me_collectors_;
     total_me_collectors = total_me_collectors_;
     unknown_me_collectors = unknown_me_collectors_;
   }
    : customer_me_collector_info)

let make_customer_connector_info ~active_connectors:(active_connectors_ : integer)
    ~healthy_connectors:(healthy_connectors_ : integer)
    ~black_listed_connectors:(black_listed_connectors_ : integer)
    ~shutdown_connectors:(shutdown_connectors_ : integer)
    ~unhealthy_connectors:(unhealthy_connectors_ : integer)
    ~total_connectors:(total_connectors_ : integer)
    ~unknown_connectors:(unknown_connectors_ : integer) () =
  ({
     active_connectors = active_connectors_;
     healthy_connectors = healthy_connectors_;
     black_listed_connectors = black_listed_connectors_;
     shutdown_connectors = shutdown_connectors_;
     unhealthy_connectors = unhealthy_connectors_;
     total_connectors = total_connectors_;
     unknown_connectors = unknown_connectors_;
   }
    : customer_connector_info)

let make_customer_agent_info ~active_agents:(active_agents_ : integer)
    ~healthy_agents:(healthy_agents_ : integer)
    ~black_listed_agents:(black_listed_agents_ : integer)
    ~shutdown_agents:(shutdown_agents_ : integer) ~unhealthy_agents:(unhealthy_agents_ : integer)
    ~total_agents:(total_agents_ : integer) ~unknown_agents:(unknown_agents_ : integer) () =
  ({
     active_agents = active_agents_;
     healthy_agents = healthy_agents_;
     black_listed_agents = black_listed_agents_;
     shutdown_agents = shutdown_agents_;
     unhealthy_agents = unhealthy_agents_;
     total_agents = total_agents_;
     unknown_agents = unknown_agents_;
   }
    : customer_agent_info)

let make_get_discovery_summary_response ?servers:(servers_ : long option)
    ?applications:(applications_ : long option)
    ?servers_mapped_to_applications:(servers_mapped_to_applications_ : long option)
    ?servers_mappedto_tags:(servers_mappedto_tags_ : long option)
    ?agent_summary:(agent_summary_ : customer_agent_info option)
    ?connector_summary:(connector_summary_ : customer_connector_info option)
    ?me_collector_summary:(me_collector_summary_ : customer_me_collector_info option)
    ?agentless_collector_summary:
      (agentless_collector_summary_ : customer_agentless_collector_info option) () =
  ({
     servers = servers_;
     applications = applications_;
     servers_mapped_to_applications = servers_mapped_to_applications_;
     servers_mappedto_tags = servers_mappedto_tags_;
     agent_summary = agent_summary_;
     connector_summary = connector_summary_;
     me_collector_summary = me_collector_summary_;
     agentless_collector_summary = agentless_collector_summary_;
   }
    : get_discovery_summary_response)

let make_get_discovery_summary_request () = (() : unit)

let make_export_configurations_response ?export_id:(export_id_ : configurations_export_id option) ()
    =
  ({ export_id = export_id_ } : export_configurations_response)

let make_disassociate_configuration_items_from_application_response () = (() : unit)

let make_disassociate_configuration_items_from_application_request
    ~application_configuration_id:(application_configuration_id_ : application_id)
    ~configuration_ids:(configuration_ids_ : configuration_id_list) () =
  ({
     application_configuration_id = application_configuration_id_;
     configuration_ids = configuration_ids_;
   }
    : disassociate_configuration_items_from_application_request)

let make_configuration_tag
    ?configuration_type:(configuration_type_ : configuration_item_type option)
    ?configuration_id:(configuration_id_ : configuration_id option) ?key:(key_ : tag_key option)
    ?value:(value_ : tag_value option) ?time_of_creation:(time_of_creation_ : time_stamp option) ()
    =
  ({
     configuration_type = configuration_type_;
     configuration_id = configuration_id_;
     key = key_;
     value = value_;
     time_of_creation = time_of_creation_;
   }
    : configuration_tag)

let make_describe_tags_response ?tags:(tags_ : configuration_tag_set option)
    ?next_token:(next_token_ : next_token option) () =
  ({ tags = tags_; next_token = next_token_ } : describe_tags_response)

let make_tag_filter ~name:(name_ : filter_name) ~values:(values_ : filter_values) () =
  ({ name = name_; values = values_ } : tag_filter)

let make_describe_tags_request ?filters:(filters_ : tag_filters option)
    ?max_results:(max_results_ : integer option) ?next_token:(next_token_ : next_token option) () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : describe_tags_request)

let make_describe_import_tasks_response ?next_token:(next_token_ : next_token option)
    ?tasks:(tasks_ : import_task_list option) () =
  ({ next_token = next_token_; tasks = tasks_ } : describe_import_tasks_response)

let make_import_task_filter ?name:(name_ : import_task_filter_name option)
    ?values:(values_ : import_task_filter_value_list option) () =
  ({ name = name_; values = values_ } : import_task_filter)

let make_describe_import_tasks_request
    ?filters:(filters_ : describe_import_tasks_filter_list option)
    ?max_results:(max_results_ : describe_import_tasks_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : describe_import_tasks_request)

let make_export_info
    ?configurations_download_url:(configurations_download_url_ : configurations_download_url option)
    ?is_truncated:(is_truncated_ : boolean_ option)
    ?requested_start_time:(requested_start_time_ : time_stamp option)
    ?requested_end_time:(requested_end_time_ : time_stamp option)
    ~export_id:(export_id_ : configurations_export_id)
    ~export_status:(export_status_ : export_status)
    ~status_message:(status_message_ : export_status_message)
    ~export_request_time:(export_request_time_ : export_request_time) () =
  ({
     export_id = export_id_;
     export_status = export_status_;
     status_message = status_message_;
     configurations_download_url = configurations_download_url_;
     export_request_time = export_request_time_;
     is_truncated = is_truncated_;
     requested_start_time = requested_start_time_;
     requested_end_time = requested_end_time_;
   }
    : export_info)

let make_describe_export_tasks_response ?exports_info:(exports_info_ : exports_info option)
    ?next_token:(next_token_ : next_token option) () =
  ({ exports_info = exports_info_; next_token = next_token_ } : describe_export_tasks_response)

let make_describe_export_tasks_request ?export_ids:(export_ids_ : export_ids option)
    ?filters:(filters_ : export_filters option) ?max_results:(max_results_ : integer option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     export_ids = export_ids_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_export_tasks_request)

let make_describe_export_configurations_response ?exports_info:(exports_info_ : exports_info option)
    ?next_token:(next_token_ : next_token option) () =
  ({ exports_info = exports_info_; next_token = next_token_ }
    : describe_export_configurations_response)

let make_describe_export_configurations_request ?export_ids:(export_ids_ : export_ids option)
    ?max_results:(max_results_ : integer option) ?next_token:(next_token_ : next_token option) () =
  ({ export_ids = export_ids_; max_results = max_results_; next_token = next_token_ }
    : describe_export_configurations_request)

let make_continuous_export_description ?export_id:(export_id_ : configurations_export_id option)
    ?status:(status_ : continuous_export_status option)
    ?status_detail:(status_detail_ : string_max255 option)
    ?s3_bucket:(s3_bucket_ : s3_bucket option) ?start_time:(start_time_ : time_stamp option)
    ?stop_time:(stop_time_ : time_stamp option) ?data_source:(data_source_ : data_source option)
    ?schema_storage_config:(schema_storage_config_ : schema_storage_config option) () =
  ({
     export_id = export_id_;
     status = status_;
     status_detail = status_detail_;
     s3_bucket = s3_bucket_;
     start_time = start_time_;
     stop_time = stop_time_;
     data_source = data_source_;
     schema_storage_config = schema_storage_config_;
   }
    : continuous_export_description)

let make_describe_continuous_exports_response
    ?descriptions:(descriptions_ : continuous_export_descriptions option)
    ?next_token:(next_token_ : next_token option) () =
  ({ descriptions = descriptions_; next_token = next_token_ }
    : describe_continuous_exports_response)

let make_describe_continuous_exports_request
    ?export_ids:(export_ids_ : continuous_export_ids option)
    ?max_results:(max_results_ : describe_continuous_exports_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ export_ids = export_ids_; max_results = max_results_; next_token = next_token_ }
    : describe_continuous_exports_request)

let make_describe_configurations_response
    ?configurations:(configurations_ : describe_configurations_attributes option) () =
  ({ configurations = configurations_ } : describe_configurations_response)

let make_describe_configurations_request
    ~configuration_ids:(configuration_ids_ : configuration_id_list) () =
  ({ configuration_ids = configuration_ids_ } : describe_configurations_request)

let make_deletion_warning ?configuration_id:(configuration_id_ : configuration_id option)
    ?warning_code:(warning_code_ : warning_code option)
    ?warning_text:(warning_text_ : warning_text option) () =
  ({
     configuration_id = configuration_id_;
     warning_code = warning_code_;
     warning_text = warning_text_;
   }
    : deletion_warning)

let make_failed_configuration ?configuration_id:(configuration_id_ : configuration_id option)
    ?error_status_code:(error_status_code_ : error_status_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({
     configuration_id = configuration_id_;
     error_status_code = error_status_code_;
     error_message = error_message_;
   }
    : failed_configuration)

let make_batch_delete_configuration_task ?task_id:(task_id_ : uui_d option)
    ?status:(status_ : batch_delete_configuration_task_status option)
    ?start_time:(start_time_ : time_stamp option) ?end_time:(end_time_ : time_stamp option)
    ?configuration_type:(configuration_type_ : deletion_configuration_item_type option)
    ?requested_configurations:(requested_configurations_ : configuration_id_list option)
    ?deleted_configurations:(deleted_configurations_ : configuration_id_list option)
    ?failed_configurations:(failed_configurations_ : failed_configuration_list option)
    ?deletion_warnings:(deletion_warnings_ : deletion_warnings_list option) () =
  ({
     task_id = task_id_;
     status = status_;
     start_time = start_time_;
     end_time = end_time_;
     configuration_type = configuration_type_;
     requested_configurations = requested_configurations_;
     deleted_configurations = deleted_configurations_;
     failed_configurations = failed_configurations_;
     deletion_warnings = deletion_warnings_;
   }
    : batch_delete_configuration_task)

let make_describe_batch_delete_configuration_task_response
    ?task:(task_ : batch_delete_configuration_task option) () =
  ({ task = task_ } : describe_batch_delete_configuration_task_response)

let make_describe_batch_delete_configuration_task_request ~task_id:(task_id_ : uui_d) () =
  ({ task_id = task_id_ } : describe_batch_delete_configuration_task_request)

let make_agent_network_info ?ip_address:(ip_address_ : string_ option)
    ?mac_address:(mac_address_ : string_ option) () =
  ({ ip_address = ip_address_; mac_address = mac_address_ } : agent_network_info)

let make_agent_info ?agent_id:(agent_id_ : agent_id option) ?host_name:(host_name_ : string_ option)
    ?agent_network_info_list:(agent_network_info_list_ : agent_network_info_list option)
    ?connector_id:(connector_id_ : string_ option) ?version:(version_ : string_ option)
    ?health:(health_ : agent_status option)
    ?last_health_ping_time:(last_health_ping_time_ : string_ option)
    ?collection_status:(collection_status_ : string_ option)
    ?agent_type:(agent_type_ : string_ option) ?registered_time:(registered_time_ : string_ option)
    () =
  ({
     agent_id = agent_id_;
     host_name = host_name_;
     agent_network_info_list = agent_network_info_list_;
     connector_id = connector_id_;
     version = version_;
     health = health_;
     last_health_ping_time = last_health_ping_time_;
     collection_status = collection_status_;
     agent_type = agent_type_;
     registered_time = registered_time_;
   }
    : agent_info)

let make_describe_agents_response ?agents_info:(agents_info_ : agents_info option)
    ?next_token:(next_token_ : next_token option) () =
  ({ agents_info = agents_info_; next_token = next_token_ } : describe_agents_response)

let make_describe_agents_request ?agent_ids:(agent_ids_ : agent_ids option)
    ?filters:(filters_ : filters option) ?max_results:(max_results_ : integer option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     agent_ids = agent_ids_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_agents_request)

let make_delete_tags_response () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_delete_tags_request ?tags:(tags_ : tag_set option)
    ~configuration_ids:(configuration_ids_ : configuration_id_list) () =
  ({ configuration_ids = configuration_ids_; tags = tags_ } : delete_tags_request)

let make_delete_applications_response () = (() : unit)

let make_delete_applications_request ~configuration_ids:(configuration_ids_ : application_ids_list)
    () =
  ({ configuration_ids = configuration_ids_ } : delete_applications_request)

let make_create_tags_response () = (() : unit)

let make_create_tags_request ~configuration_ids:(configuration_ids_ : configuration_id_list)
    ~tags:(tags_ : tag_set) () =
  ({ configuration_ids = configuration_ids_; tags = tags_ } : create_tags_request)

let make_create_application_response ?configuration_id:(configuration_id_ : string_ option) () =
  ({ configuration_id = configuration_id_ } : create_application_response)

let make_create_application_request ?description:(description_ : application_description option)
    ?wave:(wave_ : application_wave option) ~name:(name_ : application_name) () =
  ({ name = name_; description = description_; wave = wave_ } : create_application_request)

let make_batch_delete_import_data_error
    ?import_task_id:(import_task_id_ : import_task_identifier option)
    ?error_code:(error_code_ : batch_delete_import_data_error_code option)
    ?error_description:(error_description_ : batch_delete_import_data_error_description option) () =
  ({
     import_task_id = import_task_id_;
     error_code = error_code_;
     error_description = error_description_;
   }
    : batch_delete_import_data_error)

let make_batch_delete_import_data_response
    ?errors:(errors_ : batch_delete_import_data_error_list option) () =
  ({ errors = errors_ } : batch_delete_import_data_response)

let make_batch_delete_import_data_request ?delete_history:(delete_history_ : boolean_ option)
    ~import_task_ids:(import_task_ids_ : to_delete_identifier_list) () =
  ({ import_task_ids = import_task_ids_; delete_history = delete_history_ }
    : batch_delete_import_data_request)

let make_batch_delete_agent_error ~agent_id:(agent_id_ : agent_id)
    ~error_message:(error_message_ : string_) ~error_code:(error_code_ : delete_agent_error_code) ()
    =
  ({ agent_id = agent_id_; error_message = error_message_; error_code = error_code_ }
    : batch_delete_agent_error)

let make_batch_delete_agents_response ?errors:(errors_ : batch_delete_agent_errors option) () =
  ({ errors = errors_ } : batch_delete_agents_response)

let make_delete_agent ?force:(force_ : boolean_ option) ~agent_id:(agent_id_ : agent_id) () =
  ({ agent_id = agent_id_; force = force_ } : delete_agent)

let make_batch_delete_agents_request ~delete_agents:(delete_agents_ : delete_agents) () =
  ({ delete_agents = delete_agents_ } : batch_delete_agents_request)

let make_associate_configuration_items_to_application_response () = (() : unit)

let make_associate_configuration_items_to_application_request
    ~application_configuration_id:(application_configuration_id_ : application_id)
    ~configuration_ids:(configuration_ids_ : configuration_id_list) () =
  ({
     application_configuration_id = application_configuration_id_;
     configuration_ids = configuration_ids_;
   }
    : associate_configuration_items_to_application_request)
