open Smaws_Lib.Json.SerializeHelpers
open Types

let message_to_yojson = string_to_yojson

let server_internal_error_exception_to_yojson (x : server_internal_error_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_parameter_value_exception_to_yojson (x : invalid_parameter_value_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let home_region_not_set_exception_to_yojson (x : home_region_not_set_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let authorization_error_exception_to_yojson (x : authorization_error_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let update_application_response_to_yojson = unit_to_yojson
let application_wave_to_yojson = string_to_yojson
let application_description_to_yojson = string_to_yojson
let application_name_to_yojson = string_to_yojson
let application_id_to_yojson = string_to_yojson

let update_application_request_to_yojson (x : update_application_request) =
  assoc_to_yojson
    [
      ("configurationId", Some (application_id_to_yojson x.configuration_id));
      ("name", option_to_yojson application_name_to_yojson x.name);
      ("description", option_to_yojson application_description_to_yojson x.description);
      ("wave", option_to_yojson application_wave_to_yojson x.wave);
    ]

let string__to_yojson = string_to_yojson
let boolean__to_yojson = bool_to_yojson

let agent_configuration_status_to_yojson (x : agent_configuration_status) =
  assoc_to_yojson
    [
      ("agentId", option_to_yojson string__to_yojson x.agent_id);
      ("operationSucceeded", option_to_yojson boolean__to_yojson x.operation_succeeded);
      ("description", option_to_yojson string__to_yojson x.description);
    ]

let agent_configuration_status_list_to_yojson tree =
  list_to_yojson agent_configuration_status_to_yojson tree

let stop_data_collection_by_agent_ids_response_to_yojson
    (x : stop_data_collection_by_agent_ids_response) =
  assoc_to_yojson
    [
      ( "agentsConfigurationStatus",
        option_to_yojson agent_configuration_status_list_to_yojson x.agents_configuration_status );
    ]

let agent_id_to_yojson = string_to_yojson
let agent_ids_to_yojson tree = list_to_yojson agent_id_to_yojson tree

let stop_data_collection_by_agent_ids_request_to_yojson
    (x : stop_data_collection_by_agent_ids_request) =
  assoc_to_yojson [ ("agentIds", Some (agent_ids_to_yojson x.agent_ids)) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let operation_not_permitted_exception_to_yojson (x : operation_not_permitted_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let time_stamp_to_yojson = timestamp_epoch_seconds_to_yojson

let stop_continuous_export_response_to_yojson (x : stop_continuous_export_response) =
  assoc_to_yojson
    [
      ("startTime", option_to_yojson time_stamp_to_yojson x.start_time);
      ("stopTime", option_to_yojson time_stamp_to_yojson x.stop_time);
    ]

let configurations_export_id_to_yojson = string_to_yojson

let stop_continuous_export_request_to_yojson (x : stop_continuous_export_request) =
  assoc_to_yojson [ ("exportId", Some (configurations_export_id_to_yojson x.export_id)) ]

let s3_presigned_url_to_yojson = string_to_yojson
let integer_to_yojson = int_to_yojson

let file_classification_to_yojson (x : file_classification) =
  match x with
  | MODELIZEIT_EXPORT -> `String "MODELIZEIT_EXPORT"
  | RVTOOLS_EXPORT -> `String "RVTOOLS_EXPORT"
  | VMWARE_NSX_EXPORT -> `String "VMWARE_NSX_EXPORT"
  | IMPORT_TEMPLATE -> `String "IMPORT_TEMPLATE"

let import_status_to_yojson (x : import_status) =
  match x with
  | IMPORT_IN_PROGRESS -> `String "IMPORT_IN_PROGRESS"
  | IMPORT_COMPLETE -> `String "IMPORT_COMPLETE"
  | IMPORT_COMPLETE_WITH_ERRORS -> `String "IMPORT_COMPLETE_WITH_ERRORS"
  | IMPORT_FAILED -> `String "IMPORT_FAILED"
  | IMPORT_FAILED_SERVER_LIMIT_EXCEEDED -> `String "IMPORT_FAILED_SERVER_LIMIT_EXCEEDED"
  | IMPORT_FAILED_RECORD_LIMIT_EXCEEDED -> `String "IMPORT_FAILED_RECORD_LIMIT_EXCEEDED"
  | IMPORT_FAILED_UNSUPPORTED_FILE_TYPE -> `String "IMPORT_FAILED_UNSUPPORTED_FILE_TYPE"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | DELETE_COMPLETE -> `String "DELETE_COMPLETE"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETE_FAILED_LIMIT_EXCEEDED -> `String "DELETE_FAILED_LIMIT_EXCEEDED"
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"

let import_ur_l_to_yojson = string_to_yojson
let import_task_name_to_yojson = string_to_yojson
let client_request_token_to_yojson = string_to_yojson
let import_task_identifier_to_yojson = string_to_yojson

let import_task_to_yojson (x : import_task) =
  assoc_to_yojson
    [
      ("importTaskId", option_to_yojson import_task_identifier_to_yojson x.import_task_id);
      ("clientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("name", option_to_yojson import_task_name_to_yojson x.name);
      ("importUrl", option_to_yojson import_ur_l_to_yojson x.import_url);
      ("status", option_to_yojson import_status_to_yojson x.status);
      ("importRequestTime", option_to_yojson time_stamp_to_yojson x.import_request_time);
      ("importCompletionTime", option_to_yojson time_stamp_to_yojson x.import_completion_time);
      ("importDeletedTime", option_to_yojson time_stamp_to_yojson x.import_deleted_time);
      ("fileClassification", option_to_yojson file_classification_to_yojson x.file_classification);
      ("serverImportSuccess", option_to_yojson integer_to_yojson x.server_import_success);
      ("serverImportFailure", option_to_yojson integer_to_yojson x.server_import_failure);
      ("applicationImportSuccess", option_to_yojson integer_to_yojson x.application_import_success);
      ("applicationImportFailure", option_to_yojson integer_to_yojson x.application_import_failure);
      ( "errorsAndFailedEntriesZip",
        option_to_yojson s3_presigned_url_to_yojson x.errors_and_failed_entries_zip );
    ]

let start_import_task_response_to_yojson (x : start_import_task_response) =
  assoc_to_yojson [ ("task", option_to_yojson import_task_to_yojson x.task) ]

let start_import_task_request_to_yojson (x : start_import_task_request) =
  assoc_to_yojson
    [
      ( "clientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("name", Some (import_task_name_to_yojson x.name));
      ("importUrl", Some (import_ur_l_to_yojson x.import_url));
    ]

let start_export_task_response_to_yojson (x : start_export_task_response) =
  assoc_to_yojson [ ("exportId", option_to_yojson configurations_export_id_to_yojson x.export_id) ]

let term_length_to_yojson (x : term_length) =
  match x with ONE_YEAR -> `String "ONE_YEAR" | THREE_YEAR -> `String "THREE_YEAR"

let offering_class_to_yojson (x : offering_class) =
  match x with STANDARD -> `String "STANDARD" | CONVERTIBLE -> `String "CONVERTIBLE"

let purchasing_option_to_yojson (x : purchasing_option) =
  match x with
  | ALL_UPFRONT -> `String "ALL_UPFRONT"
  | PARTIAL_UPFRONT -> `String "PARTIAL_UPFRONT"
  | NO_UPFRONT -> `String "NO_UPFRONT"

let reserved_instance_options_to_yojson (x : reserved_instance_options) =
  assoc_to_yojson
    [
      ("purchasingOption", Some (purchasing_option_to_yojson x.purchasing_option));
      ("offeringClass", Some (offering_class_to_yojson x.offering_class));
      ("termLength", Some (term_length_to_yojson x.term_length));
    ]

let user_preferred_region_to_yojson = string_to_yojson
let ec2_instance_type_to_yojson = string_to_yojson
let excluded_instance_types_to_yojson tree = list_to_yojson ec2_instance_type_to_yojson tree

let tenancy_to_yojson (x : tenancy) =
  match x with DEDICATED -> `String "DEDICATED" | SHARED -> `String "SHARED"

let usage_metric_percentage_adjust_to_yojson = double_to_yojson
let usage_metric_basis_name_to_yojson = string_to_yojson

let usage_metric_basis_to_yojson (x : usage_metric_basis) =
  assoc_to_yojson
    [
      ("name", option_to_yojson usage_metric_basis_name_to_yojson x.name);
      ( "percentageAdjust",
        option_to_yojson usage_metric_percentage_adjust_to_yojson x.percentage_adjust );
    ]

let export_enabled_to_yojson = bool_to_yojson

let ec2_recommendations_export_preferences_to_yojson (x : ec2_recommendations_export_preferences) =
  assoc_to_yojson
    [
      ("enabled", option_to_yojson export_enabled_to_yojson x.enabled);
      ( "cpuPerformanceMetricBasis",
        option_to_yojson usage_metric_basis_to_yojson x.cpu_performance_metric_basis );
      ( "ramPerformanceMetricBasis",
        option_to_yojson usage_metric_basis_to_yojson x.ram_performance_metric_basis );
      ("tenancy", option_to_yojson tenancy_to_yojson x.tenancy);
      ( "excludedInstanceTypes",
        option_to_yojson excluded_instance_types_to_yojson x.excluded_instance_types );
      ("preferredRegion", option_to_yojson user_preferred_region_to_yojson x.preferred_region);
      ( "reservedInstanceOptions",
        option_to_yojson reserved_instance_options_to_yojson x.reserved_instance_options );
    ]

let export_preferences_to_yojson (x : export_preferences) =
  match x with
  | Ec2RecommendationsPreferences arg ->
      assoc_to_yojson
        [
          ( "ec2RecommendationsPreferences",
            Some (ec2_recommendations_export_preferences_to_yojson arg) );
        ]

let condition_to_yojson = string_to_yojson
let filter_value_to_yojson = string_to_yojson
let filter_values_to_yojson tree = list_to_yojson filter_value_to_yojson tree
let filter_name_to_yojson = string_to_yojson

let export_filter_to_yojson (x : export_filter) =
  assoc_to_yojson
    [
      ("name", Some (filter_name_to_yojson x.name));
      ("values", Some (filter_values_to_yojson x.values));
      ("condition", Some (condition_to_yojson x.condition));
    ]

let export_filters_to_yojson tree = list_to_yojson export_filter_to_yojson tree
let export_data_format_to_yojson (x : export_data_format) = match x with CSV -> `String "CSV"
let export_data_formats_to_yojson tree = list_to_yojson export_data_format_to_yojson tree

let start_export_task_request_to_yojson (x : start_export_task_request) =
  assoc_to_yojson
    [
      ("exportDataFormat", option_to_yojson export_data_formats_to_yojson x.export_data_format);
      ("filters", option_to_yojson export_filters_to_yojson x.filters);
      ("startTime", option_to_yojson time_stamp_to_yojson x.start_time);
      ("endTime", option_to_yojson time_stamp_to_yojson x.end_time);
      ("preferences", option_to_yojson export_preferences_to_yojson x.preferences);
    ]

let start_data_collection_by_agent_ids_response_to_yojson
    (x : start_data_collection_by_agent_ids_response) =
  assoc_to_yojson
    [
      ( "agentsConfigurationStatus",
        option_to_yojson agent_configuration_status_list_to_yojson x.agents_configuration_status );
    ]

let start_data_collection_by_agent_ids_request_to_yojson
    (x : start_data_collection_by_agent_ids_request) =
  assoc_to_yojson [ ("agentIds", Some (agent_ids_to_yojson x.agent_ids)) ]

let conflict_error_exception_to_yojson (x : conflict_error_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let database_name_to_yojson = string_to_yojson

let schema_storage_config_to_yojson tree =
  map_to_yojson database_name_to_yojson string__to_yojson tree

let data_source_to_yojson (x : data_source) = match x with AGENT -> `String "AGENT"
let s3_bucket_to_yojson = string_to_yojson

let start_continuous_export_response_to_yojson (x : start_continuous_export_response) =
  assoc_to_yojson
    [
      ("exportId", option_to_yojson configurations_export_id_to_yojson x.export_id);
      ("s3Bucket", option_to_yojson s3_bucket_to_yojson x.s3_bucket);
      ("startTime", option_to_yojson time_stamp_to_yojson x.start_time);
      ("dataSource", option_to_yojson data_source_to_yojson x.data_source);
      ( "schemaStorageConfig",
        option_to_yojson schema_storage_config_to_yojson x.schema_storage_config );
    ]

let start_continuous_export_request_to_yojson = unit_to_yojson

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let uui_d_to_yojson = string_to_yojson

let start_batch_delete_configuration_task_response_to_yojson
    (x : start_batch_delete_configuration_task_response) =
  assoc_to_yojson [ ("taskId", option_to_yojson uui_d_to_yojson x.task_id) ]

let configuration_id_to_yojson = string_to_yojson
let configuration_id_list_to_yojson tree = list_to_yojson configuration_id_to_yojson tree

let deletion_configuration_item_type_to_yojson (x : deletion_configuration_item_type) =
  match x with SERVER -> `String "SERVER"

let start_batch_delete_configuration_task_request_to_yojson
    (x : start_batch_delete_configuration_task_request) =
  assoc_to_yojson
    [
      ("configurationType", Some (deletion_configuration_item_type_to_yojson x.configuration_type));
      ("configurationIds", Some (configuration_id_list_to_yojson x.configuration_ids));
    ]

let long_to_yojson = long_to_yojson
let boxed_integer_to_yojson = int_to_yojson

let neighbor_connection_detail_to_yojson (x : neighbor_connection_detail) =
  assoc_to_yojson
    [
      ("sourceServerId", Some (configuration_id_to_yojson x.source_server_id));
      ("destinationServerId", Some (configuration_id_to_yojson x.destination_server_id));
      ("destinationPort", option_to_yojson boxed_integer_to_yojson x.destination_port);
      ("transportProtocol", option_to_yojson string__to_yojson x.transport_protocol);
      ("connectionsCount", Some (long_to_yojson x.connections_count));
    ]

let neighbor_details_list_to_yojson tree = list_to_yojson neighbor_connection_detail_to_yojson tree

let list_server_neighbors_response_to_yojson (x : list_server_neighbors_response) =
  assoc_to_yojson
    [
      ("neighbors", Some (neighbor_details_list_to_yojson x.neighbors));
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("knownDependencyCount", option_to_yojson long_to_yojson x.known_dependency_count);
    ]

let list_server_neighbors_request_to_yojson (x : list_server_neighbors_request) =
  assoc_to_yojson
    [
      ("configurationId", Some (configuration_id_to_yojson x.configuration_id));
      ("portInformationNeeded", option_to_yojson boolean__to_yojson x.port_information_needed);
      ( "neighborConfigurationIds",
        option_to_yojson configuration_id_list_to_yojson x.neighbor_configuration_ids );
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let next_token_to_yojson = string_to_yojson
let configuration_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree
let configurations_to_yojson tree = list_to_yojson configuration_to_yojson tree

let list_configurations_response_to_yojson (x : list_configurations_response) =
  assoc_to_yojson
    [
      ("configurations", option_to_yojson configurations_to_yojson x.configurations);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let order_string_to_yojson (x : order_string) =
  match x with ASC -> `String "ASC" | DESC -> `String "DESC"

let order_by_element_field_name_to_yojson = string_to_yojson

let order_by_element_to_yojson (x : order_by_element) =
  assoc_to_yojson
    [
      ("fieldName", Some (order_by_element_field_name_to_yojson x.field_name));
      ("sortOrder", option_to_yojson order_string_to_yojson x.sort_order);
    ]

let order_by_list_to_yojson tree = list_to_yojson order_by_element_to_yojson tree

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("name", Some (string__to_yojson x.name));
      ("values", Some (filter_values_to_yojson x.values));
      ("condition", Some (condition_to_yojson x.condition));
    ]

let filters_to_yojson tree = list_to_yojson filter_to_yojson tree

let configuration_item_type_to_yojson (x : configuration_item_type) =
  match x with
  | SERVER -> `String "SERVER"
  | PROCESS -> `String "PROCESS"
  | CONNECTIONS -> `String "CONNECTION"
  | APPLICATION -> `String "APPLICATION"

let list_configurations_request_to_yojson (x : list_configurations_request) =
  assoc_to_yojson
    [
      ("configurationType", Some (configuration_item_type_to_yojson x.configuration_type));
      ("filters", option_to_yojson filters_to_yojson x.filters);
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("orderBy", option_to_yojson order_by_list_to_yojson x.order_by);
    ]

let customer_agentless_collector_info_to_yojson (x : customer_agentless_collector_info) =
  assoc_to_yojson
    [
      ("activeAgentlessCollectors", Some (integer_to_yojson x.active_agentless_collectors));
      ("healthyAgentlessCollectors", Some (integer_to_yojson x.healthy_agentless_collectors));
      ("denyListedAgentlessCollectors", Some (integer_to_yojson x.deny_listed_agentless_collectors));
      ("shutdownAgentlessCollectors", Some (integer_to_yojson x.shutdown_agentless_collectors));
      ("unhealthyAgentlessCollectors", Some (integer_to_yojson x.unhealthy_agentless_collectors));
      ("totalAgentlessCollectors", Some (integer_to_yojson x.total_agentless_collectors));
      ("unknownAgentlessCollectors", Some (integer_to_yojson x.unknown_agentless_collectors));
    ]

let customer_me_collector_info_to_yojson (x : customer_me_collector_info) =
  assoc_to_yojson
    [
      ("activeMeCollectors", Some (integer_to_yojson x.active_me_collectors));
      ("healthyMeCollectors", Some (integer_to_yojson x.healthy_me_collectors));
      ("denyListedMeCollectors", Some (integer_to_yojson x.deny_listed_me_collectors));
      ("shutdownMeCollectors", Some (integer_to_yojson x.shutdown_me_collectors));
      ("unhealthyMeCollectors", Some (integer_to_yojson x.unhealthy_me_collectors));
      ("totalMeCollectors", Some (integer_to_yojson x.total_me_collectors));
      ("unknownMeCollectors", Some (integer_to_yojson x.unknown_me_collectors));
    ]

let customer_connector_info_to_yojson (x : customer_connector_info) =
  assoc_to_yojson
    [
      ("activeConnectors", Some (integer_to_yojson x.active_connectors));
      ("healthyConnectors", Some (integer_to_yojson x.healthy_connectors));
      ("blackListedConnectors", Some (integer_to_yojson x.black_listed_connectors));
      ("shutdownConnectors", Some (integer_to_yojson x.shutdown_connectors));
      ("unhealthyConnectors", Some (integer_to_yojson x.unhealthy_connectors));
      ("totalConnectors", Some (integer_to_yojson x.total_connectors));
      ("unknownConnectors", Some (integer_to_yojson x.unknown_connectors));
    ]

let customer_agent_info_to_yojson (x : customer_agent_info) =
  assoc_to_yojson
    [
      ("activeAgents", Some (integer_to_yojson x.active_agents));
      ("healthyAgents", Some (integer_to_yojson x.healthy_agents));
      ("blackListedAgents", Some (integer_to_yojson x.black_listed_agents));
      ("shutdownAgents", Some (integer_to_yojson x.shutdown_agents));
      ("unhealthyAgents", Some (integer_to_yojson x.unhealthy_agents));
      ("totalAgents", Some (integer_to_yojson x.total_agents));
      ("unknownAgents", Some (integer_to_yojson x.unknown_agents));
    ]

let get_discovery_summary_response_to_yojson (x : get_discovery_summary_response) =
  assoc_to_yojson
    [
      ("servers", option_to_yojson long_to_yojson x.servers);
      ("applications", option_to_yojson long_to_yojson x.applications);
      ( "serversMappedToApplications",
        option_to_yojson long_to_yojson x.servers_mapped_to_applications );
      ("serversMappedtoTags", option_to_yojson long_to_yojson x.servers_mappedto_tags);
      ("agentSummary", option_to_yojson customer_agent_info_to_yojson x.agent_summary);
      ("connectorSummary", option_to_yojson customer_connector_info_to_yojson x.connector_summary);
      ( "meCollectorSummary",
        option_to_yojson customer_me_collector_info_to_yojson x.me_collector_summary );
      ( "agentlessCollectorSummary",
        option_to_yojson customer_agentless_collector_info_to_yojson x.agentless_collector_summary
      );
    ]

let get_discovery_summary_request_to_yojson = unit_to_yojson

let export_configurations_response_to_yojson (x : export_configurations_response) =
  assoc_to_yojson [ ("exportId", option_to_yojson configurations_export_id_to_yojson x.export_id) ]

let disassociate_configuration_items_from_application_response_to_yojson = unit_to_yojson

let disassociate_configuration_items_from_application_request_to_yojson
    (x : disassociate_configuration_items_from_application_request) =
  assoc_to_yojson
    [
      ("applicationConfigurationId", Some (application_id_to_yojson x.application_configuration_id));
      ("configurationIds", Some (configuration_id_list_to_yojson x.configuration_ids));
    ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let configuration_tag_to_yojson (x : configuration_tag) =
  assoc_to_yojson
    [
      ("configurationType", option_to_yojson configuration_item_type_to_yojson x.configuration_type);
      ("configurationId", option_to_yojson configuration_id_to_yojson x.configuration_id);
      ("key", option_to_yojson tag_key_to_yojson x.key);
      ("value", option_to_yojson tag_value_to_yojson x.value);
      ("timeOfCreation", option_to_yojson time_stamp_to_yojson x.time_of_creation);
    ]

let configuration_tag_set_to_yojson tree = list_to_yojson configuration_tag_to_yojson tree

let describe_tags_response_to_yojson (x : describe_tags_response) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson configuration_tag_set_to_yojson x.tags);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let tag_filter_to_yojson (x : tag_filter) =
  assoc_to_yojson
    [
      ("name", Some (filter_name_to_yojson x.name));
      ("values", Some (filter_values_to_yojson x.values));
    ]

let tag_filters_to_yojson tree = list_to_yojson tag_filter_to_yojson tree

let describe_tags_request_to_yojson (x : describe_tags_request) =
  assoc_to_yojson
    [
      ("filters", option_to_yojson tag_filters_to_yojson x.filters);
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let import_task_list_to_yojson tree = list_to_yojson import_task_to_yojson tree

let describe_import_tasks_response_to_yojson (x : describe_import_tasks_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("tasks", option_to_yojson import_task_list_to_yojson x.tasks);
    ]

let describe_import_tasks_max_results_to_yojson = int_to_yojson
let import_task_filter_value_to_yojson = string_to_yojson

let import_task_filter_value_list_to_yojson tree =
  list_to_yojson import_task_filter_value_to_yojson tree

let import_task_filter_name_to_yojson (x : import_task_filter_name) =
  match x with
  | IMPORT_TASK_ID -> `String "IMPORT_TASK_ID"
  | STATUS -> `String "STATUS"
  | NAME -> `String "NAME"
  | FILE_CLASSIFICATION -> `String "FILE_CLASSIFICATION"

let import_task_filter_to_yojson (x : import_task_filter) =
  assoc_to_yojson
    [
      ("name", option_to_yojson import_task_filter_name_to_yojson x.name);
      ("values", option_to_yojson import_task_filter_value_list_to_yojson x.values);
    ]

let describe_import_tasks_filter_list_to_yojson tree =
  list_to_yojson import_task_filter_to_yojson tree

let describe_import_tasks_request_to_yojson (x : describe_import_tasks_request) =
  assoc_to_yojson
    [
      ("filters", option_to_yojson describe_import_tasks_filter_list_to_yojson x.filters);
      ("maxResults", option_to_yojson describe_import_tasks_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let export_request_time_to_yojson = timestamp_epoch_seconds_to_yojson
let configurations_download_url_to_yojson = string_to_yojson
let export_status_message_to_yojson = string_to_yojson

let export_status_to_yojson (x : export_status) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let export_info_to_yojson (x : export_info) =
  assoc_to_yojson
    [
      ("exportId", Some (configurations_export_id_to_yojson x.export_id));
      ("exportStatus", Some (export_status_to_yojson x.export_status));
      ("statusMessage", Some (export_status_message_to_yojson x.status_message));
      ( "configurationsDownloadUrl",
        option_to_yojson configurations_download_url_to_yojson x.configurations_download_url );
      ("exportRequestTime", Some (export_request_time_to_yojson x.export_request_time));
      ("isTruncated", option_to_yojson boolean__to_yojson x.is_truncated);
      ("requestedStartTime", option_to_yojson time_stamp_to_yojson x.requested_start_time);
      ("requestedEndTime", option_to_yojson time_stamp_to_yojson x.requested_end_time);
    ]

let exports_info_to_yojson tree = list_to_yojson export_info_to_yojson tree

let describe_export_tasks_response_to_yojson (x : describe_export_tasks_response) =
  assoc_to_yojson
    [
      ("exportsInfo", option_to_yojson exports_info_to_yojson x.exports_info);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let export_ids_to_yojson tree = list_to_yojson configurations_export_id_to_yojson tree

let describe_export_tasks_request_to_yojson (x : describe_export_tasks_request) =
  assoc_to_yojson
    [
      ("exportIds", option_to_yojson export_ids_to_yojson x.export_ids);
      ("filters", option_to_yojson export_filters_to_yojson x.filters);
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_export_configurations_response_to_yojson (x : describe_export_configurations_response)
    =
  assoc_to_yojson
    [
      ("exportsInfo", option_to_yojson exports_info_to_yojson x.exports_info);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_export_configurations_request_to_yojson (x : describe_export_configurations_request) =
  assoc_to_yojson
    [
      ("exportIds", option_to_yojson export_ids_to_yojson x.export_ids);
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let string_max255_to_yojson = string_to_yojson

let continuous_export_status_to_yojson (x : continuous_export_status) =
  match x with
  | START_IN_PROGRESS -> `String "START_IN_PROGRESS"
  | START_FAILED -> `String "START_FAILED"
  | ACTIVE -> `String "ACTIVE"
  | ERROR -> `String "ERROR"
  | STOP_IN_PROGRESS -> `String "STOP_IN_PROGRESS"
  | STOP_FAILED -> `String "STOP_FAILED"
  | INACTIVE -> `String "INACTIVE"

let continuous_export_description_to_yojson (x : continuous_export_description) =
  assoc_to_yojson
    [
      ("exportId", option_to_yojson configurations_export_id_to_yojson x.export_id);
      ("status", option_to_yojson continuous_export_status_to_yojson x.status);
      ("statusDetail", option_to_yojson string_max255_to_yojson x.status_detail);
      ("s3Bucket", option_to_yojson s3_bucket_to_yojson x.s3_bucket);
      ("startTime", option_to_yojson time_stamp_to_yojson x.start_time);
      ("stopTime", option_to_yojson time_stamp_to_yojson x.stop_time);
      ("dataSource", option_to_yojson data_source_to_yojson x.data_source);
      ( "schemaStorageConfig",
        option_to_yojson schema_storage_config_to_yojson x.schema_storage_config );
    ]

let continuous_export_descriptions_to_yojson tree =
  list_to_yojson continuous_export_description_to_yojson tree

let describe_continuous_exports_response_to_yojson (x : describe_continuous_exports_response) =
  assoc_to_yojson
    [
      ("descriptions", option_to_yojson continuous_export_descriptions_to_yojson x.descriptions);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_continuous_exports_max_results_to_yojson = int_to_yojson
let continuous_export_ids_to_yojson tree = list_to_yojson configurations_export_id_to_yojson tree

let describe_continuous_exports_request_to_yojson (x : describe_continuous_exports_request) =
  assoc_to_yojson
    [
      ("exportIds", option_to_yojson continuous_export_ids_to_yojson x.export_ids);
      ( "maxResults",
        option_to_yojson describe_continuous_exports_max_results_to_yojson x.max_results );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_configurations_attribute_to_yojson tree =
  map_to_yojson string__to_yojson string__to_yojson tree

let describe_configurations_attributes_to_yojson tree =
  list_to_yojson describe_configurations_attribute_to_yojson tree

let describe_configurations_response_to_yojson (x : describe_configurations_response) =
  assoc_to_yojson
    [
      ( "configurations",
        option_to_yojson describe_configurations_attributes_to_yojson x.configurations );
    ]

let describe_configurations_request_to_yojson (x : describe_configurations_request) =
  assoc_to_yojson
    [ ("configurationIds", Some (configuration_id_list_to_yojson x.configuration_ids)) ]

let warning_text_to_yojson = string_to_yojson
let warning_code_to_yojson = int_to_yojson

let deletion_warning_to_yojson (x : deletion_warning) =
  assoc_to_yojson
    [
      ("configurationId", option_to_yojson configuration_id_to_yojson x.configuration_id);
      ("warningCode", option_to_yojson warning_code_to_yojson x.warning_code);
      ("warningText", option_to_yojson warning_text_to_yojson x.warning_text);
    ]

let deletion_warnings_list_to_yojson tree = list_to_yojson deletion_warning_to_yojson tree
let error_message_to_yojson = string_to_yojson
let error_status_code_to_yojson = int_to_yojson

let failed_configuration_to_yojson (x : failed_configuration) =
  assoc_to_yojson
    [
      ("configurationId", option_to_yojson configuration_id_to_yojson x.configuration_id);
      ("errorStatusCode", option_to_yojson error_status_code_to_yojson x.error_status_code);
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let failed_configuration_list_to_yojson tree = list_to_yojson failed_configuration_to_yojson tree

let batch_delete_configuration_task_status_to_yojson (x : batch_delete_configuration_task_status) =
  match x with
  | INITIALIZING -> `String "INITIALIZING"
  | VALIDATING -> `String "VALIDATING"
  | DELETING -> `String "DELETING"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"

let batch_delete_configuration_task_to_yojson (x : batch_delete_configuration_task) =
  assoc_to_yojson
    [
      ("taskId", option_to_yojson uui_d_to_yojson x.task_id);
      ("status", option_to_yojson batch_delete_configuration_task_status_to_yojson x.status);
      ("startTime", option_to_yojson time_stamp_to_yojson x.start_time);
      ("endTime", option_to_yojson time_stamp_to_yojson x.end_time);
      ( "configurationType",
        option_to_yojson deletion_configuration_item_type_to_yojson x.configuration_type );
      ( "requestedConfigurations",
        option_to_yojson configuration_id_list_to_yojson x.requested_configurations );
      ( "deletedConfigurations",
        option_to_yojson configuration_id_list_to_yojson x.deleted_configurations );
      ( "failedConfigurations",
        option_to_yojson failed_configuration_list_to_yojson x.failed_configurations );
      ("deletionWarnings", option_to_yojson deletion_warnings_list_to_yojson x.deletion_warnings);
    ]

let describe_batch_delete_configuration_task_response_to_yojson
    (x : describe_batch_delete_configuration_task_response) =
  assoc_to_yojson [ ("task", option_to_yojson batch_delete_configuration_task_to_yojson x.task) ]

let describe_batch_delete_configuration_task_request_to_yojson
    (x : describe_batch_delete_configuration_task_request) =
  assoc_to_yojson [ ("taskId", Some (uui_d_to_yojson x.task_id)) ]

let agent_status_to_yojson (x : agent_status) =
  match x with
  | HEALTHY -> `String "HEALTHY"
  | UNHEALTHY -> `String "UNHEALTHY"
  | RUNNING -> `String "RUNNING"
  | UNKNOWN -> `String "UNKNOWN"
  | BLACKLISTED -> `String "BLACKLISTED"
  | SHUTDOWN -> `String "SHUTDOWN"

let agent_network_info_to_yojson (x : agent_network_info) =
  assoc_to_yojson
    [
      ("ipAddress", option_to_yojson string__to_yojson x.ip_address);
      ("macAddress", option_to_yojson string__to_yojson x.mac_address);
    ]

let agent_network_info_list_to_yojson tree = list_to_yojson agent_network_info_to_yojson tree

let agent_info_to_yojson (x : agent_info) =
  assoc_to_yojson
    [
      ("agentId", option_to_yojson agent_id_to_yojson x.agent_id);
      ("hostName", option_to_yojson string__to_yojson x.host_name);
      ( "agentNetworkInfoList",
        option_to_yojson agent_network_info_list_to_yojson x.agent_network_info_list );
      ("connectorId", option_to_yojson string__to_yojson x.connector_id);
      ("version", option_to_yojson string__to_yojson x.version);
      ("health", option_to_yojson agent_status_to_yojson x.health);
      ("lastHealthPingTime", option_to_yojson string__to_yojson x.last_health_ping_time);
      ("collectionStatus", option_to_yojson string__to_yojson x.collection_status);
      ("agentType", option_to_yojson string__to_yojson x.agent_type);
      ("registeredTime", option_to_yojson string__to_yojson x.registered_time);
    ]

let agents_info_to_yojson tree = list_to_yojson agent_info_to_yojson tree

let describe_agents_response_to_yojson (x : describe_agents_response) =
  assoc_to_yojson
    [
      ("agentsInfo", option_to_yojson agents_info_to_yojson x.agents_info);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_agents_request_to_yojson (x : describe_agents_request) =
  assoc_to_yojson
    [
      ("agentIds", option_to_yojson agent_ids_to_yojson x.agent_ids);
      ("filters", option_to_yojson filters_to_yojson x.filters);
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let delete_tags_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("key", Some (tag_key_to_yojson x.key)); ("value", Some (tag_value_to_yojson x.value)) ]

let tag_set_to_yojson tree = list_to_yojson tag_to_yojson tree

let delete_tags_request_to_yojson (x : delete_tags_request) =
  assoc_to_yojson
    [
      ("configurationIds", Some (configuration_id_list_to_yojson x.configuration_ids));
      ("tags", option_to_yojson tag_set_to_yojson x.tags);
    ]

let delete_applications_response_to_yojson = unit_to_yojson
let application_ids_list_to_yojson tree = list_to_yojson application_id_to_yojson tree

let delete_applications_request_to_yojson (x : delete_applications_request) =
  assoc_to_yojson
    [ ("configurationIds", Some (application_ids_list_to_yojson x.configuration_ids)) ]

let create_tags_response_to_yojson = unit_to_yojson

let create_tags_request_to_yojson (x : create_tags_request) =
  assoc_to_yojson
    [
      ("configurationIds", Some (configuration_id_list_to_yojson x.configuration_ids));
      ("tags", Some (tag_set_to_yojson x.tags));
    ]

let create_application_response_to_yojson (x : create_application_response) =
  assoc_to_yojson [ ("configurationId", option_to_yojson string__to_yojson x.configuration_id) ]

let create_application_request_to_yojson (x : create_application_request) =
  assoc_to_yojson
    [
      ("name", Some (application_name_to_yojson x.name));
      ("description", option_to_yojson application_description_to_yojson x.description);
      ("wave", option_to_yojson application_wave_to_yojson x.wave);
    ]

let batch_delete_import_data_error_description_to_yojson = string_to_yojson

let batch_delete_import_data_error_code_to_yojson (x : batch_delete_import_data_error_code) =
  match x with
  | NOT_FOUND -> `String "NOT_FOUND"
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"
  | OVER_LIMIT -> `String "OVER_LIMIT"

let batch_delete_import_data_error_to_yojson (x : batch_delete_import_data_error) =
  assoc_to_yojson
    [
      ("importTaskId", option_to_yojson import_task_identifier_to_yojson x.import_task_id);
      ("errorCode", option_to_yojson batch_delete_import_data_error_code_to_yojson x.error_code);
      ( "errorDescription",
        option_to_yojson batch_delete_import_data_error_description_to_yojson x.error_description );
    ]

let batch_delete_import_data_error_list_to_yojson tree =
  list_to_yojson batch_delete_import_data_error_to_yojson tree

let batch_delete_import_data_response_to_yojson (x : batch_delete_import_data_response) =
  assoc_to_yojson
    [ ("errors", option_to_yojson batch_delete_import_data_error_list_to_yojson x.errors) ]

let to_delete_identifier_list_to_yojson tree = list_to_yojson import_task_identifier_to_yojson tree

let batch_delete_import_data_request_to_yojson (x : batch_delete_import_data_request) =
  assoc_to_yojson
    [
      ("importTaskIds", Some (to_delete_identifier_list_to_yojson x.import_task_ids));
      ("deleteHistory", option_to_yojson boolean__to_yojson x.delete_history);
    ]

let delete_agent_error_code_to_yojson (x : delete_agent_error_code) =
  match x with
  | NOT_FOUND -> `String "NOT_FOUND"
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"
  | AGENT_IN_USE -> `String "AGENT_IN_USE"

let batch_delete_agent_error_to_yojson (x : batch_delete_agent_error) =
  assoc_to_yojson
    [
      ("agentId", Some (agent_id_to_yojson x.agent_id));
      ("errorMessage", Some (string__to_yojson x.error_message));
      ("errorCode", Some (delete_agent_error_code_to_yojson x.error_code));
    ]

let batch_delete_agent_errors_to_yojson tree =
  list_to_yojson batch_delete_agent_error_to_yojson tree

let batch_delete_agents_response_to_yojson (x : batch_delete_agents_response) =
  assoc_to_yojson [ ("errors", option_to_yojson batch_delete_agent_errors_to_yojson x.errors) ]

let delete_agent_to_yojson (x : delete_agent) =
  assoc_to_yojson
    [
      ("agentId", Some (agent_id_to_yojson x.agent_id));
      ("force", option_to_yojson boolean__to_yojson x.force);
    ]

let delete_agents_to_yojson tree = list_to_yojson delete_agent_to_yojson tree

let batch_delete_agents_request_to_yojson (x : batch_delete_agents_request) =
  assoc_to_yojson [ ("deleteAgents", Some (delete_agents_to_yojson x.delete_agents)) ]

let associate_configuration_items_to_application_response_to_yojson = unit_to_yojson

let associate_configuration_items_to_application_request_to_yojson
    (x : associate_configuration_items_to_application_request) =
  assoc_to_yojson
    [
      ("applicationConfigurationId", Some (application_id_to_yojson x.application_configuration_id));
      ("configurationIds", Some (configuration_id_list_to_yojson x.configuration_ids));
    ]
