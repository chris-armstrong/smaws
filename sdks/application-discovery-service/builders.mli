open Types

val make_update_application_response : unit -> unit

val make_update_application_request :
  ?name:application_name ->
  ?description:application_description ->
  ?wave:application_wave ->
  configuration_id:application_id ->
  unit ->
  update_application_request

val make_agent_configuration_status :
  ?agent_id:string_ ->
  ?operation_succeeded:boolean_ ->
  ?description:string_ ->
  unit ->
  agent_configuration_status

val make_stop_data_collection_by_agent_ids_response :
  ?agents_configuration_status:agent_configuration_status_list ->
  unit ->
  stop_data_collection_by_agent_ids_response

val make_stop_data_collection_by_agent_ids_request :
  agent_ids:agent_ids -> unit -> stop_data_collection_by_agent_ids_request

val make_stop_continuous_export_response :
  ?start_time:time_stamp -> ?stop_time:time_stamp -> unit -> stop_continuous_export_response

val make_stop_continuous_export_request :
  export_id:configurations_export_id -> unit -> stop_continuous_export_request

val make_import_task :
  ?import_task_id:import_task_identifier ->
  ?client_request_token:client_request_token ->
  ?name:import_task_name ->
  ?import_url:import_ur_l ->
  ?status:import_status ->
  ?import_request_time:time_stamp ->
  ?import_completion_time:time_stamp ->
  ?import_deleted_time:time_stamp ->
  ?file_classification:file_classification ->
  ?server_import_success:integer ->
  ?server_import_failure:integer ->
  ?application_import_success:integer ->
  ?application_import_failure:integer ->
  ?errors_and_failed_entries_zip:s3_presigned_url ->
  unit ->
  import_task

val make_start_import_task_response : ?task:import_task -> unit -> start_import_task_response

val make_start_import_task_request :
  ?client_request_token:client_request_token ->
  name:import_task_name ->
  import_url:import_ur_l ->
  unit ->
  start_import_task_request

val make_start_export_task_response :
  ?export_id:configurations_export_id -> unit -> start_export_task_response

val make_reserved_instance_options :
  purchasing_option:purchasing_option ->
  offering_class:offering_class ->
  term_length:term_length ->
  unit ->
  reserved_instance_options

val make_usage_metric_basis :
  ?name:usage_metric_basis_name ->
  ?percentage_adjust:usage_metric_percentage_adjust ->
  unit ->
  usage_metric_basis

val make_ec2_recommendations_export_preferences :
  ?enabled:export_enabled ->
  ?cpu_performance_metric_basis:usage_metric_basis ->
  ?ram_performance_metric_basis:usage_metric_basis ->
  ?tenancy:tenancy ->
  ?excluded_instance_types:excluded_instance_types ->
  ?preferred_region:user_preferred_region ->
  ?reserved_instance_options:reserved_instance_options ->
  unit ->
  ec2_recommendations_export_preferences

val make_export_filter :
  name:filter_name -> values:filter_values -> condition:condition -> unit -> export_filter

val make_start_export_task_request :
  ?export_data_format:export_data_formats ->
  ?filters:export_filters ->
  ?start_time:time_stamp ->
  ?end_time:time_stamp ->
  ?preferences:export_preferences ->
  unit ->
  start_export_task_request

val make_start_data_collection_by_agent_ids_response :
  ?agents_configuration_status:agent_configuration_status_list ->
  unit ->
  start_data_collection_by_agent_ids_response

val make_start_data_collection_by_agent_ids_request :
  agent_ids:agent_ids -> unit -> start_data_collection_by_agent_ids_request

val make_start_continuous_export_response :
  ?export_id:configurations_export_id ->
  ?s3_bucket:s3_bucket ->
  ?start_time:time_stamp ->
  ?data_source:data_source ->
  ?schema_storage_config:schema_storage_config ->
  unit ->
  start_continuous_export_response

val make_start_continuous_export_request : unit -> unit

val make_start_batch_delete_configuration_task_response :
  ?task_id:uui_d -> unit -> start_batch_delete_configuration_task_response

val make_start_batch_delete_configuration_task_request :
  configuration_type:deletion_configuration_item_type ->
  configuration_ids:configuration_id_list ->
  unit ->
  start_batch_delete_configuration_task_request

val make_neighbor_connection_detail :
  ?destination_port:boxed_integer ->
  ?transport_protocol:string_ ->
  source_server_id:configuration_id ->
  destination_server_id:configuration_id ->
  connections_count:long ->
  unit ->
  neighbor_connection_detail

val make_list_server_neighbors_response :
  ?next_token:string_ ->
  ?known_dependency_count:long ->
  neighbors:neighbor_details_list ->
  unit ->
  list_server_neighbors_response

val make_list_server_neighbors_request :
  ?port_information_needed:boolean_ ->
  ?neighbor_configuration_ids:configuration_id_list ->
  ?max_results:integer ->
  ?next_token:string_ ->
  configuration_id:configuration_id ->
  unit ->
  list_server_neighbors_request

val make_list_configurations_response :
  ?configurations:configurations -> ?next_token:next_token -> unit -> list_configurations_response

val make_order_by_element :
  ?sort_order:order_string -> field_name:order_by_element_field_name -> unit -> order_by_element

val make_filter : name:string_ -> values:filter_values -> condition:condition -> unit -> filter

val make_list_configurations_request :
  ?filters:filters ->
  ?max_results:integer ->
  ?next_token:next_token ->
  ?order_by:order_by_list ->
  configuration_type:configuration_item_type ->
  unit ->
  list_configurations_request

val make_customer_agentless_collector_info :
  active_agentless_collectors:integer ->
  healthy_agentless_collectors:integer ->
  deny_listed_agentless_collectors:integer ->
  shutdown_agentless_collectors:integer ->
  unhealthy_agentless_collectors:integer ->
  total_agentless_collectors:integer ->
  unknown_agentless_collectors:integer ->
  unit ->
  customer_agentless_collector_info

val make_customer_me_collector_info :
  active_me_collectors:integer ->
  healthy_me_collectors:integer ->
  deny_listed_me_collectors:integer ->
  shutdown_me_collectors:integer ->
  unhealthy_me_collectors:integer ->
  total_me_collectors:integer ->
  unknown_me_collectors:integer ->
  unit ->
  customer_me_collector_info

val make_customer_connector_info :
  active_connectors:integer ->
  healthy_connectors:integer ->
  black_listed_connectors:integer ->
  shutdown_connectors:integer ->
  unhealthy_connectors:integer ->
  total_connectors:integer ->
  unknown_connectors:integer ->
  unit ->
  customer_connector_info

val make_customer_agent_info :
  active_agents:integer ->
  healthy_agents:integer ->
  black_listed_agents:integer ->
  shutdown_agents:integer ->
  unhealthy_agents:integer ->
  total_agents:integer ->
  unknown_agents:integer ->
  unit ->
  customer_agent_info

val make_get_discovery_summary_response :
  ?servers:long ->
  ?applications:long ->
  ?servers_mapped_to_applications:long ->
  ?servers_mappedto_tags:long ->
  ?agent_summary:customer_agent_info ->
  ?connector_summary:customer_connector_info ->
  ?me_collector_summary:customer_me_collector_info ->
  ?agentless_collector_summary:customer_agentless_collector_info ->
  unit ->
  get_discovery_summary_response

val make_get_discovery_summary_request : unit -> unit

val make_export_configurations_response :
  ?export_id:configurations_export_id -> unit -> export_configurations_response

val make_disassociate_configuration_items_from_application_response : unit -> unit

val make_disassociate_configuration_items_from_application_request :
  application_configuration_id:application_id ->
  configuration_ids:configuration_id_list ->
  unit ->
  disassociate_configuration_items_from_application_request

val make_configuration_tag :
  ?configuration_type:configuration_item_type ->
  ?configuration_id:configuration_id ->
  ?key:tag_key ->
  ?value:tag_value ->
  ?time_of_creation:time_stamp ->
  unit ->
  configuration_tag

val make_describe_tags_response :
  ?tags:configuration_tag_set -> ?next_token:next_token -> unit -> describe_tags_response

val make_tag_filter : name:filter_name -> values:filter_values -> unit -> tag_filter

val make_describe_tags_request :
  ?filters:tag_filters ->
  ?max_results:integer ->
  ?next_token:next_token ->
  unit ->
  describe_tags_request

val make_describe_import_tasks_response :
  ?next_token:next_token -> ?tasks:import_task_list -> unit -> describe_import_tasks_response

val make_import_task_filter :
  ?name:import_task_filter_name ->
  ?values:import_task_filter_value_list ->
  unit ->
  import_task_filter

val make_describe_import_tasks_request :
  ?filters:describe_import_tasks_filter_list ->
  ?max_results:describe_import_tasks_max_results ->
  ?next_token:next_token ->
  unit ->
  describe_import_tasks_request

val make_export_info :
  ?configurations_download_url:configurations_download_url ->
  ?is_truncated:boolean_ ->
  ?requested_start_time:time_stamp ->
  ?requested_end_time:time_stamp ->
  export_id:configurations_export_id ->
  export_status:export_status ->
  status_message:export_status_message ->
  export_request_time:export_request_time ->
  unit ->
  export_info

val make_describe_export_tasks_response :
  ?exports_info:exports_info -> ?next_token:next_token -> unit -> describe_export_tasks_response

val make_describe_export_tasks_request :
  ?export_ids:export_ids ->
  ?filters:export_filters ->
  ?max_results:integer ->
  ?next_token:next_token ->
  unit ->
  describe_export_tasks_request

val make_describe_export_configurations_response :
  ?exports_info:exports_info ->
  ?next_token:next_token ->
  unit ->
  describe_export_configurations_response

val make_describe_export_configurations_request :
  ?export_ids:export_ids ->
  ?max_results:integer ->
  ?next_token:next_token ->
  unit ->
  describe_export_configurations_request

val make_continuous_export_description :
  ?export_id:configurations_export_id ->
  ?status:continuous_export_status ->
  ?status_detail:string_max255 ->
  ?s3_bucket:s3_bucket ->
  ?start_time:time_stamp ->
  ?stop_time:time_stamp ->
  ?data_source:data_source ->
  ?schema_storage_config:schema_storage_config ->
  unit ->
  continuous_export_description

val make_describe_continuous_exports_response :
  ?descriptions:continuous_export_descriptions ->
  ?next_token:next_token ->
  unit ->
  describe_continuous_exports_response

val make_describe_continuous_exports_request :
  ?export_ids:continuous_export_ids ->
  ?max_results:describe_continuous_exports_max_results ->
  ?next_token:next_token ->
  unit ->
  describe_continuous_exports_request

val make_describe_configurations_response :
  ?configurations:describe_configurations_attributes -> unit -> describe_configurations_response

val make_describe_configurations_request :
  configuration_ids:configuration_id_list -> unit -> describe_configurations_request

val make_deletion_warning :
  ?configuration_id:configuration_id ->
  ?warning_code:warning_code ->
  ?warning_text:warning_text ->
  unit ->
  deletion_warning

val make_failed_configuration :
  ?configuration_id:configuration_id ->
  ?error_status_code:error_status_code ->
  ?error_message:error_message ->
  unit ->
  failed_configuration

val make_batch_delete_configuration_task :
  ?task_id:uui_d ->
  ?status:batch_delete_configuration_task_status ->
  ?start_time:time_stamp ->
  ?end_time:time_stamp ->
  ?configuration_type:deletion_configuration_item_type ->
  ?requested_configurations:configuration_id_list ->
  ?deleted_configurations:configuration_id_list ->
  ?failed_configurations:failed_configuration_list ->
  ?deletion_warnings:deletion_warnings_list ->
  unit ->
  batch_delete_configuration_task

val make_describe_batch_delete_configuration_task_response :
  ?task:batch_delete_configuration_task -> unit -> describe_batch_delete_configuration_task_response

val make_describe_batch_delete_configuration_task_request :
  task_id:uui_d -> unit -> describe_batch_delete_configuration_task_request

val make_agent_network_info :
  ?ip_address:string_ -> ?mac_address:string_ -> unit -> agent_network_info

val make_agent_info :
  ?agent_id:agent_id ->
  ?host_name:string_ ->
  ?agent_network_info_list:agent_network_info_list ->
  ?connector_id:string_ ->
  ?version:string_ ->
  ?health:agent_status ->
  ?last_health_ping_time:string_ ->
  ?collection_status:string_ ->
  ?agent_type:string_ ->
  ?registered_time:string_ ->
  unit ->
  agent_info

val make_describe_agents_response :
  ?agents_info:agents_info -> ?next_token:next_token -> unit -> describe_agents_response

val make_describe_agents_request :
  ?agent_ids:agent_ids ->
  ?filters:filters ->
  ?max_results:integer ->
  ?next_token:next_token ->
  unit ->
  describe_agents_request

val make_delete_tags_response : unit -> unit
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_delete_tags_request :
  ?tags:tag_set -> configuration_ids:configuration_id_list -> unit -> delete_tags_request

val make_delete_applications_response : unit -> unit

val make_delete_applications_request :
  configuration_ids:application_ids_list -> unit -> delete_applications_request

val make_create_tags_response : unit -> unit

val make_create_tags_request :
  configuration_ids:configuration_id_list -> tags:tag_set -> unit -> create_tags_request

val make_create_application_response :
  ?configuration_id:string_ -> unit -> create_application_response

val make_create_application_request :
  ?description:application_description ->
  ?wave:application_wave ->
  name:application_name ->
  unit ->
  create_application_request

val make_batch_delete_import_data_error :
  ?import_task_id:import_task_identifier ->
  ?error_code:batch_delete_import_data_error_code ->
  ?error_description:batch_delete_import_data_error_description ->
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
  agent_id:agent_id ->
  error_message:string_ ->
  error_code:delete_agent_error_code ->
  unit ->
  batch_delete_agent_error

val make_batch_delete_agents_response :
  ?errors:batch_delete_agent_errors -> unit -> batch_delete_agents_response

val make_delete_agent : ?force:boolean_ -> agent_id:agent_id -> unit -> delete_agent

val make_batch_delete_agents_request :
  delete_agents:delete_agents -> unit -> batch_delete_agents_request

val make_associate_configuration_items_to_application_response : unit -> unit

val make_associate_configuration_items_to_application_request :
  application_configuration_id:application_id ->
  configuration_ids:configuration_id_list ->
  unit ->
  associate_configuration_items_to_application_request
