(** Application Discovery Service client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module AssociateConfigurationItemsToApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_configuration_items_to_application_request ->
    ( associate_configuration_items_to_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_configuration_items_to_application_request ->
    ( associate_configuration_items_to_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates one or more configuration items with an application.\n"]

module BatchDeleteAgents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_agents_request ->
    ( batch_delete_agents_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_agents_request ->
    ( batch_delete_agents_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Deletes one or more agents or collectors as specified by ID. Deleting an agent or collector \
   does not delete the previously discovered data. To delete the data collected, use \
   [StartBatchDeleteConfigurationTask]. \n"]

module BatchDeleteImportData : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_import_data_request ->
    ( batch_delete_import_data_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_import_data_request ->
    ( batch_delete_import_data_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes one or more import tasks, each identified by their import ID. Each import task has a \
   number of records that can identify servers or applications. \n\n\
  \ Amazon Web Services Application Discovery Service has built-in matching logic that will \
   identify when discovered servers match existing entries that you've previously discovered, the \
   information for the already-existing discovered server is updated. When you delete an import \
   task that contains records that were used to match, the information in those matched records \
   that comes from the deleted records will also be deleted.\n\
  \ "]

module CreateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_application_request ->
    ( create_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_application_request ->
    ( create_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an application with the given name and description.\n"]

module CreateTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_tags_request ->
    ( create_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_tags_request ->
    ( create_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates one or more tags for configuration items. Tags are metadata that help you categorize IT \
   assets. This API accepts a list of multiple configuration items.\n\n\
  \  Do not store sensitive information (like personal data) in tags.\n\
  \  \n\
  \   "]

module DeleteApplications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_applications_request ->
    ( delete_applications_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_applications_request ->
    ( delete_applications_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a list of applications and their associations with configuration items.\n"]

module DeleteTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_tags_request ->
    ( delete_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_tags_request ->
    ( delete_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the association between configuration items and one or more tags. This API accepts a \
   list of multiple configuration items.\n"]

module DescribeAgents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_agents_request ->
    ( describe_agents_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_agents_request ->
    ( describe_agents_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists agents or collectors as specified by ID or other filters. All agents/collectors \
   associated with your user can be listed if you call [DescribeAgents] as is without passing any \
   parameters.\n"]

module DescribeBatchDeleteConfigurationTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_batch_delete_configuration_task_request ->
    ( describe_batch_delete_configuration_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_batch_delete_configuration_task_request ->
    ( describe_batch_delete_configuration_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Takes a unique deletion task identifier as input and returns metadata about a configuration \
   deletion task.\n"]

module DescribeConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_configurations_request ->
    ( describe_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_configurations_request ->
    ( describe_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves attributes for a list of configuration item IDs.\n\n\
  \  All of the supplied IDs must be for the same asset type from one of the following:\n\
  \  \n\
  \   {ul\n\
  \         {-  server\n\
  \             \n\
  \              }\n\
  \         {-  application\n\
  \             \n\
  \              }\n\
  \         {-  process\n\
  \             \n\
  \              }\n\
  \         {-  connection\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   Output fields are specific to the asset type specified. For example, the output for a {i \
   server} configuration item includes a list of attributes about the server, such as host name, \
   operating system, number of network cards, etc.\n\
  \   \n\
  \    For a complete list of outputs for each asset type, see \
   {{:https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-api-queries.html#DescribeConfigurations}Using \
   the DescribeConfigurations Action} in the {i Amazon Web Services Application Discovery Service \
   User Guide}.\n\
  \    \n\
  \     "]

module DescribeContinuousExports : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_continuous_exports_request ->
    ( describe_continuous_exports_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_continuous_exports_request ->
    ( describe_continuous_exports_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists exports as specified by ID. All continuous exports associated with your user can be \
   listed if you call [DescribeContinuousExports] as is without passing any parameters.\n"]

module DescribeExportConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_export_configurations_request ->
    ( describe_export_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_export_configurations_request ->
    ( describe_export_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " [DescribeExportConfigurations] is deprecated. Use \
   {{:https://docs.aws.amazon.com/application-discovery/latest/APIReference/API_DescribeExportTasks.html}DescribeExportTasks}, \
   instead.\n"]

module DescribeExportTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_export_tasks_request ->
    ( describe_export_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_export_tasks_request ->
    ( describe_export_tasks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieve status of one or more export tasks. You can retrieve the status of up to 100 export \
   tasks.\n"]

module DescribeImportTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_import_tasks_request ->
    ( describe_import_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_import_tasks_request ->
    ( describe_import_tasks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns an array of import tasks for your account, including status information, times, IDs, \
   the Amazon S3 Object URL for the import file, and more.\n"]

module DescribeTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_request ->
    ( describe_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_request ->
    ( describe_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of configuration items that have tags as specified by the key-value pairs, \
   name and value, passed to the optional parameter [filters].\n\n\
  \ There are three valid tag filter names:\n\
  \ \n\
  \  {ul\n\
  \        {-  tagKey\n\
  \            \n\
  \             }\n\
  \        {-  tagValue\n\
  \            \n\
  \             }\n\
  \        {-  configurationId\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   Also, all configuration items associated with your user that have tags can be listed if you \
   call [DescribeTags] as is without passing any parameters.\n\
  \   "]

module DisassociateConfigurationItemsFromApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_configuration_items_from_application_request ->
    ( disassociate_configuration_items_from_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_configuration_items_from_application_request ->
    ( disassociate_configuration_items_from_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disassociates one or more configuration items from an application.\n"]

module ExportConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( export_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( export_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deprecated. Use [StartExportTask] instead.\n\n\
  \ Exports all discovered configuration data to an Amazon S3 bucket or an application that \
   enables you to view and evaluate the data. Data includes tags and tag associations, processes, \
   connections, servers, and system performance. This API returns an export ID that you can query \
   using the {i DescribeExportConfigurations} API. The system imposes a limit of two configuration \
   exports in six hours.\n\
  \ "]

module GetDiscoverySummary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_discovery_summary_request ->
    ( get_discovery_summary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_discovery_summary_request ->
    ( get_discovery_summary_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a short summary of discovered assets.\n\n\
  \ This API operation takes no request parameters and is called as is at the command prompt as \
   shown in the example.\n\
  \ "]

module ListConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_configurations_request ->
    ( list_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_configurations_request ->
    ( list_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of configuration items as specified by the value passed to the required \
   parameter [configurationType]. Optional filtering may be applied to refine search results.\n"]

module ListServerNeighbors : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_server_neighbors_request ->
    ( list_server_neighbors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_server_neighbors_request ->
    ( list_server_neighbors_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of servers that are one network hop away from a specified server.\n"]

module StartBatchDeleteConfigurationTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_batch_delete_configuration_task_request ->
    ( start_batch_delete_configuration_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_batch_delete_configuration_task_request ->
    ( start_batch_delete_configuration_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Takes a list of configurationId as input and starts an asynchronous deletion task to remove \
   the configurationItems. Returns a unique deletion task identifier. \n"]

module StartContinuousExport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `ConflictErrorException of conflict_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_continuous_export_request ->
    ( start_continuous_export_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `ConflictErrorException of conflict_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_continuous_export_request ->
    ( start_continuous_export_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `ConflictErrorException of conflict_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Start the continuous flow of agent's discovered data into Amazon Athena.\n"]

module StartDataCollectionByAgentIds : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_data_collection_by_agent_ids_request ->
    ( start_data_collection_by_agent_ids_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_data_collection_by_agent_ids_request ->
    ( start_data_collection_by_agent_ids_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Instructs the specified agents to start collecting data.\n"]

module StartExportTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_export_task_request ->
    ( start_export_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_export_task_request ->
    ( start_export_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Begins the export of a discovered data report to an Amazon S3 bucket managed by Amazon Web \
   Services.\n\n\
  \  Exports might provide an estimate of fees and savings based on certain information that you \
   provide. Fee estimates do not include any taxes that might apply. Your actual fees and savings \
   depend on a variety of factors, including your actual usage of Amazon Web Services services, \
   which might vary from the estimates provided in this report.\n\
  \  \n\
  \    If you do not specify [preferences] or [agentIds] in the filter, a summary of all servers, \
   applications, tags, and performance is generated. This data is an aggregation of all server \
   data collected through on-premises tooling, file import, application grouping and applying tags.\n\
  \    \n\
  \     If you specify [agentIds] in a filter, the task exports up to 72 hours of detailed data \
   collected by the identified Application Discovery Agent, including network, process, and \
   performance details. A time range for exported agent data may be set by using [startTime] and \
   [endTime]. Export of detailed agent data is limited to five concurrently running exports. \
   Export of detailed agent data is limited to two exports per day.\n\
  \     \n\
  \      If you enable [ec2RecommendationsPreferences] in [preferences] , an Amazon EC2 instance \
   matching the characteristics of each server in Application Discovery Service is generated. \
   Changing the attributes of the [ec2RecommendationsPreferences] changes the criteria of the \
   recommendation.\n\
  \      "]

module StartImportTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_import_task_request ->
    ( start_import_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_import_task_request ->
    ( start_import_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an import task, which allows you to import details of your on-premises environment \
   directly into Amazon Web Services Migration Hub without having to use the Amazon Web Services \
   Application Discovery Service (Application Discovery Service) tools such as the Amazon Web \
   Services Application Discovery Service Agentless Collector or Application Discovery Agent. This \
   gives you the option to perform migration assessment and planning directly from your imported \
   data, including the ability to group your devices as applications and track their migration \
   status.\n\n\
  \ To start an import request, do this:\n\
  \ \n\
  \  {ol\n\
  \        {-  Download the specially formatted comma separated value (CSV) import template, which \
   you can find here: \
   {{:https://s3.us-west-2.amazonaws.com/templates-7cffcf56-bd96-4b1c-b45b-a5b42f282e46/import_template.csv}https://s3.us-west-2.amazonaws.com/templates-7cffcf56-bd96-4b1c-b45b-a5b42f282e46/import_template.csv}.\n\
  \            \n\
  \             }\n\
  \        {-  Fill out the template with your server and application data.\n\
  \            \n\
  \             }\n\
  \        {-  Upload your import file to an Amazon S3 bucket, and make a note of it's Object URL. \
   Your import file must be in the CSV format.\n\
  \            \n\
  \             }\n\
  \        {-  Use the console or the [StartImportTask] command with the Amazon Web Services CLI \
   or one of the Amazon Web Services SDKs to import the records from your file.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For more information, including step-by-step procedures, see \
   {{:https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-import.html}Migration \
   Hub Import} in the {i Amazon Web Services Application Discovery Service User Guide}.\n\
  \   \n\
  \     There are limits to the number of import tasks you can create (and delete) in an Amazon \
   Web Services account. For more information, see \
   {{:https://docs.aws.amazon.com/application-discovery/latest/userguide/ads_service_limits.html}Amazon \
   Web Services Application Discovery Service Limits} in the {i Amazon Web Services Application \
   Discovery Service User Guide}.\n\
  \     \n\
  \      "]

module StopContinuousExport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_continuous_export_request ->
    ( stop_continuous_export_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_continuous_export_request ->
    ( stop_continuous_export_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stop the continuous flow of agent's discovered data into Amazon Athena.\n"]

module StopDataCollectionByAgentIds : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_data_collection_by_agent_ids_request ->
    ( stop_data_collection_by_agent_ids_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_data_collection_by_agent_ids_request ->
    ( stop_data_collection_by_agent_ids_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Instructs the specified agents to stop collecting data.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_application_request ->
    ( update_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_application_request ->
    ( update_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates metadata about an application.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
