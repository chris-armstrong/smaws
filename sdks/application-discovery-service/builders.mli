open Types

val make_usage_metric_basis :
  ?percentage_adjust:usage_metric_percentage_adjust ->
  ?name:usage_metric_basis_name ->
  unit ->
  usage_metric_basis

val make_update_application_response : unit -> unit

val make_update_application_request :
  ?wave:application_wave ->
  ?description:application_description ->
  ?name:application_name ->
  configuration_id:application_id ->
  unit ->
  update_application_request

val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_filter : values:filter_values -> name:filter_name -> unit -> tag_filter

val make_agent_configuration_status :
  ?description:string_ ->
  ?operation_succeeded:boolean_ ->
  ?agent_id:string_ ->
  unit ->
  agent_configuration_status

val make_stop_data_collection_by_agent_ids_response :
  ?agents_configuration_status:agent_configuration_status_list ->
  unit ->
  stop_data_collection_by_agent_ids_response

val make_stop_data_collection_by_agent_ids_request :
  agent_ids:agent_ids -> unit -> stop_data_collection_by_agent_ids_request

val make_stop_continuous_export_response :
  ?stop_time:time_stamp -> ?start_time:time_stamp -> unit -> stop_continuous_export_response

val make_stop_continuous_export_request :
  export_id:configurations_export_id -> unit -> stop_continuous_export_request

val make_import_task :
  ?errors_and_failed_entries_zip:s3_presigned_url ->
  ?application_import_failure:integer ->
  ?application_import_success:integer ->
  ?server_import_failure:integer ->
  ?server_import_success:integer ->
  ?file_classification:file_classification ->
  ?import_deleted_time:time_stamp ->
  ?import_completion_time:time_stamp ->
  ?import_request_time:time_stamp ->
  ?status:import_status ->
  ?import_url:import_ur_l ->
  ?name:import_task_name ->
  ?client_request_token:client_request_token ->
  ?import_task_id:import_task_identifier ->
  unit ->
  import_task

val make_start_import_task_response : ?task:import_task -> unit -> start_import_task_response

val make_start_import_task_request :
  ?client_request_token:client_request_token ->
  import_url:import_ur_l ->
  name:import_task_name ->
  unit ->
  start_import_task_request

val make_start_export_task_response :
  ?export_id:configurations_export_id -> unit -> start_export_task_response

val make_export_filter :
  condition:condition -> values:filter_values -> name:filter_name -> unit -> export_filter

val make_reserved_instance_options :
  term_length:term_length ->
  offering_class:offering_class ->
  purchasing_option:purchasing_option ->
  unit ->
  reserved_instance_options

val make_ec2_recommendations_export_preferences :
  ?reserved_instance_options:reserved_instance_options ->
  ?preferred_region:user_preferred_region ->
  ?excluded_instance_types:excluded_instance_types ->
  ?tenancy:tenancy ->
  ?ram_performance_metric_basis:usage_metric_basis ->
  ?cpu_performance_metric_basis:usage_metric_basis ->
  ?enabled:export_enabled ->
  unit ->
  ec2_recommendations_export_preferences

val make_start_export_task_request :
  ?preferences:export_preferences ->
  ?end_time:time_stamp ->
  ?start_time:time_stamp ->
  ?filters:export_filters ->
  ?export_data_format:export_data_formats ->
  unit ->
  start_export_task_request

val make_start_data_collection_by_agent_ids_response :
  ?agents_configuration_status:agent_configuration_status_list ->
  unit ->
  start_data_collection_by_agent_ids_response

val make_start_data_collection_by_agent_ids_request :
  agent_ids:agent_ids -> unit -> start_data_collection_by_agent_ids_request

val make_start_continuous_export_response :
  ?schema_storage_config:schema_storage_config ->
  ?data_source:data_source ->
  ?start_time:time_stamp ->
  ?s3_bucket:s3_bucket ->
  ?export_id:configurations_export_id ->
  unit ->
  start_continuous_export_response

val make_start_continuous_export_request : unit -> unit

val make_start_batch_delete_configuration_task_response :
  ?task_id:uui_d -> unit -> start_batch_delete_configuration_task_response

val make_start_batch_delete_configuration_task_request :
  configuration_ids:configuration_id_list ->
  configuration_type:deletion_configuration_item_type ->
  unit ->
  start_batch_delete_configuration_task_request

val make_order_by_element :
  ?sort_order:order_string -> field_name:order_by_element_field_name -> unit -> order_by_element

val make_neighbor_connection_detail :
  ?transport_protocol:string_ ->
  ?destination_port:boxed_integer ->
  connections_count:long ->
  destination_server_id:configuration_id ->
  source_server_id:configuration_id ->
  unit ->
  neighbor_connection_detail

val make_list_server_neighbors_response :
  ?known_dependency_count:long ->
  ?next_token:string_ ->
  neighbors:neighbor_details_list ->
  unit ->
  list_server_neighbors_response

val make_list_server_neighbors_request :
  ?next_token:string_ ->
  ?max_results:integer ->
  ?neighbor_configuration_ids:configuration_id_list ->
  ?port_information_needed:boolean_ ->
  configuration_id:configuration_id ->
  unit ->
  list_server_neighbors_request

val make_list_configurations_response :
  ?next_token:next_token -> ?configurations:configurations -> unit -> list_configurations_response

val make_filter : condition:condition -> values:filter_values -> name:string_ -> unit -> filter

val make_list_configurations_request :
  ?order_by:order_by_list ->
  ?next_token:next_token ->
  ?max_results:integer ->
  ?filters:filters ->
  configuration_type:configuration_item_type ->
  unit ->
  list_configurations_request

val make_import_task_filter :
  ?values:import_task_filter_value_list ->
  ?name:import_task_filter_name ->
  unit ->
  import_task_filter

val make_customer_agent_info :
  unknown_agents:integer ->
  total_agents:integer ->
  unhealthy_agents:integer ->
  shutdown_agents:integer ->
  black_listed_agents:integer ->
  healthy_agents:integer ->
  active_agents:integer ->
  unit ->
  customer_agent_info

val make_customer_connector_info :
  unknown_connectors:integer ->
  total_connectors:integer ->
  unhealthy_connectors:integer ->
  shutdown_connectors:integer ->
  black_listed_connectors:integer ->
  healthy_connectors:integer ->
  active_connectors:integer ->
  unit ->
  customer_connector_info

val make_customer_me_collector_info :
  unknown_me_collectors:integer ->
  total_me_collectors:integer ->
  unhealthy_me_collectors:integer ->
  shutdown_me_collectors:integer ->
  deny_listed_me_collectors:integer ->
  healthy_me_collectors:integer ->
  active_me_collectors:integer ->
  unit ->
  customer_me_collector_info

val make_customer_agentless_collector_info :
  unknown_agentless_collectors:integer ->
  total_agentless_collectors:integer ->
  unhealthy_agentless_collectors:integer ->
  shutdown_agentless_collectors:integer ->
  deny_listed_agentless_collectors:integer ->
  healthy_agentless_collectors:integer ->
  active_agentless_collectors:integer ->
  unit ->
  customer_agentless_collector_info

val make_get_discovery_summary_response :
  ?agentless_collector_summary:customer_agentless_collector_info ->
  ?me_collector_summary:customer_me_collector_info ->
  ?connector_summary:customer_connector_info ->
  ?agent_summary:customer_agent_info ->
  ?servers_mappedto_tags:long ->
  ?servers_mapped_to_applications:long ->
  ?applications:long ->
  ?servers:long ->
  unit ->
  get_discovery_summary_response

val make_get_discovery_summary_request : unit -> unit

val make_failed_configuration :
  ?error_message:error_message ->
  ?error_status_code:error_status_code ->
  ?configuration_id:configuration_id ->
  unit ->
  failed_configuration

val make_export_info :
  ?requested_end_time:time_stamp ->
  ?requested_start_time:time_stamp ->
  ?is_truncated:boolean_ ->
  ?configurations_download_url:configurations_download_url ->
  export_request_time:export_request_time ->
  status_message:export_status_message ->
  export_status:export_status ->
  export_id:configurations_export_id ->
  unit ->
  export_info

val make_export_configurations_response :
  ?export_id:configurations_export_id -> unit -> export_configurations_response

val make_disassociate_configuration_items_from_application_response : unit -> unit

val make_disassociate_configuration_items_from_application_request :
  configuration_ids:configuration_id_list ->
  application_configuration_id:application_id ->
  unit ->
  disassociate_configuration_items_from_application_request

val make_configuration_tag :
  ?time_of_creation:time_stamp ->
  ?value:tag_value ->
  ?key:tag_key ->
  ?configuration_id:configuration_id ->
  ?configuration_type:configuration_item_type ->
  unit ->
  configuration_tag

val make_describe_tags_response :
  ?next_token:next_token -> ?tags:configuration_tag_set -> unit -> describe_tags_response

val make_describe_tags_request :
  ?next_token:next_token ->
  ?max_results:integer ->
  ?filters:tag_filters ->
  unit ->
  describe_tags_request

val make_describe_import_tasks_response :
  ?tasks:import_task_list -> ?next_token:next_token -> unit -> describe_import_tasks_response

val make_describe_import_tasks_request :
  ?next_token:next_token ->
  ?max_results:describe_import_tasks_max_results ->
  ?filters:describe_import_tasks_filter_list ->
  unit ->
  describe_import_tasks_request

val make_describe_export_tasks_response :
  ?next_token:next_token -> ?exports_info:exports_info -> unit -> describe_export_tasks_response

val make_describe_export_tasks_request :
  ?next_token:next_token ->
  ?max_results:integer ->
  ?filters:export_filters ->
  ?export_ids:export_ids ->
  unit ->
  describe_export_tasks_request

val make_describe_export_configurations_response :
  ?next_token:next_token ->
  ?exports_info:exports_info ->
  unit ->
  describe_export_configurations_response

val make_describe_export_configurations_request :
  ?next_token:next_token ->
  ?max_results:integer ->
  ?export_ids:export_ids ->
  unit ->
  describe_export_configurations_request

val make_continuous_export_description :
  ?schema_storage_config:schema_storage_config ->
  ?data_source:data_source ->
  ?stop_time:time_stamp ->
  ?start_time:time_stamp ->
  ?s3_bucket:s3_bucket ->
  ?status_detail:string_max255 ->
  ?status:continuous_export_status ->
  ?export_id:configurations_export_id ->
  unit ->
  continuous_export_description

val make_describe_continuous_exports_response :
  ?next_token:next_token ->
  ?descriptions:continuous_export_descriptions ->
  unit ->
  describe_continuous_exports_response

val make_describe_continuous_exports_request :
  ?next_token:next_token ->
  ?max_results:describe_continuous_exports_max_results ->
  ?export_ids:continuous_export_ids ->
  unit ->
  describe_continuous_exports_request

val make_describe_configurations_response :
  ?configurations:describe_configurations_attributes -> unit -> describe_configurations_response

val make_describe_configurations_request :
  configuration_ids:configuration_id_list -> unit -> describe_configurations_request

val make_deletion_warning :
  ?warning_text:warning_text ->
  ?warning_code:warning_code ->
  ?configuration_id:configuration_id ->
  unit ->
  deletion_warning

val make_batch_delete_configuration_task :
  ?deletion_warnings:deletion_warnings_list ->
  ?failed_configurations:failed_configuration_list ->
  ?deleted_configurations:configuration_id_list ->
  ?requested_configurations:configuration_id_list ->
  ?configuration_type:deletion_configuration_item_type ->
  ?end_time:time_stamp ->
  ?start_time:time_stamp ->
  ?status:batch_delete_configuration_task_status ->
  ?task_id:uui_d ->
  unit ->
  batch_delete_configuration_task

val make_describe_batch_delete_configuration_task_response :
  ?task:batch_delete_configuration_task -> unit -> describe_batch_delete_configuration_task_response

val make_describe_batch_delete_configuration_task_request :
  task_id:uui_d -> unit -> describe_batch_delete_configuration_task_request

val make_agent_network_info :
  ?mac_address:string_ -> ?ip_address:string_ -> unit -> agent_network_info

val make_agent_info :
  ?registered_time:string_ ->
  ?agent_type:string_ ->
  ?collection_status:string_ ->
  ?last_health_ping_time:string_ ->
  ?health:agent_status ->
  ?version:string_ ->
  ?connector_id:string_ ->
  ?agent_network_info_list:agent_network_info_list ->
  ?host_name:string_ ->
  ?agent_id:agent_id ->
  unit ->
  agent_info

val make_describe_agents_response :
  ?next_token:next_token -> ?agents_info:agents_info -> unit -> describe_agents_response

val make_describe_agents_request :
  ?next_token:next_token ->
  ?max_results:integer ->
  ?filters:filters ->
  ?agent_ids:agent_ids ->
  unit ->
  describe_agents_request

val make_delete_tags_response : unit -> unit

val make_delete_tags_request :
  ?tags:tag_set -> configuration_ids:configuration_id_list -> unit -> delete_tags_request

val make_delete_applications_response : unit -> unit

val make_delete_applications_request :
  configuration_ids:application_ids_list -> unit -> delete_applications_request

val make_delete_agent : ?force:boolean_ -> agent_id:agent_id -> unit -> delete_agent
val make_create_tags_response : unit -> unit

val make_create_tags_request :
  tags:tag_set -> configuration_ids:configuration_id_list -> unit -> create_tags_request

val make_create_application_response :
  ?configuration_id:string_ -> unit -> create_application_response

val make_create_application_request :
  ?wave:application_wave ->
  ?description:application_description ->
  name:application_name ->
  unit ->
  create_application_request

val make_batch_delete_import_data_error :
  ?error_description:batch_delete_import_data_error_description ->
  ?error_code:batch_delete_import_data_error_code ->
  ?import_task_id:import_task_identifier ->
  unit ->
  batch_delete_import_data_error

val make_batch_delete_import_data_response :
  ?errors:batch_delete_import_data_error_list -> unit -> batch_delete_import_data_response

val make_batch_delete_import_data_request :
  ?delete_history:boolean_ ->
  import_task_ids:to_delete_identifier_list ->
  unit ->
  batch_delete_import_data_request

val make_batch_delete_agent_error :
  error_code:delete_agent_error_code ->
  error_message:string_ ->
  agent_id:agent_id ->
  unit ->
  batch_delete_agent_error

val make_batch_delete_agents_response :
  ?errors:batch_delete_agent_errors -> unit -> batch_delete_agents_response

val make_batch_delete_agents_request :
  delete_agents:delete_agents -> unit -> batch_delete_agents_request

val make_associate_configuration_items_to_application_response : unit -> unit

val make_associate_configuration_items_to_application_request :
  configuration_ids:configuration_id_list ->
  application_configuration_id:application_id ->
  unit ->
  associate_configuration_items_to_application_request
