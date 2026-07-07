open Smaws_Lib.Json.SerializeHelpers
open Types

let order_string_to_yojson (x : order_string) =
  match x with DESC -> `String "DESC" | ASC -> `String "ASC"

let warning_text_to_yojson = string_to_yojson
let warning_code_to_yojson = int_to_yojson
let user_preferred_region_to_yojson = string_to_yojson
let usage_metric_percentage_adjust_to_yojson = double_to_yojson
let usage_metric_basis_name_to_yojson = string_to_yojson

let usage_metric_basis_to_yojson (x : usage_metric_basis) =
  assoc_to_yojson
    [
      ( "percentageAdjust",
        option_to_yojson usage_metric_percentage_adjust_to_yojson x.percentage_adjust );
      ("name", option_to_yojson usage_metric_basis_name_to_yojson x.name);
    ]

let update_application_response_to_yojson = unit_to_yojson
let application_id_to_yojson = string_to_yojson
let application_name_to_yojson = string_to_yojson
let application_description_to_yojson = string_to_yojson
let application_wave_to_yojson = string_to_yojson

let update_application_request_to_yojson (x : update_application_request) =
  assoc_to_yojson
    [
      ("wave", option_to_yojson application_wave_to_yojson x.wave);
      ("description", option_to_yojson application_description_to_yojson x.description);
      ("name", option_to_yojson application_name_to_yojson x.name);
      ("configurationId", Some (application_id_to_yojson x.configuration_id));
    ]

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

let uui_d_to_yojson = string_to_yojson
let import_task_identifier_to_yojson = string_to_yojson
let to_delete_identifier_list_to_yojson tree = list_to_yojson import_task_identifier_to_yojson tree
let time_stamp_to_yojson = timestamp_epoch_seconds_to_yojson

let term_length_to_yojson (x : term_length) =
  match x with THREE_YEAR -> `String "THREE_YEAR" | ONE_YEAR -> `String "ONE_YEAR"

let tenancy_to_yojson (x : tenancy) =
  match x with SHARED -> `String "SHARED" | DEDICATED -> `String "DEDICATED"

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("value", Some (tag_value_to_yojson x.value)); ("key", Some (tag_key_to_yojson x.key)) ]

let tag_set_to_yojson tree = list_to_yojson tag_to_yojson tree
let filter_name_to_yojson = string_to_yojson
let filter_value_to_yojson = string_to_yojson
let filter_values_to_yojson tree = list_to_yojson filter_value_to_yojson tree

let tag_filter_to_yojson (x : tag_filter) =
  assoc_to_yojson
    [
      ("values", Some (filter_values_to_yojson x.values));
      ("name", Some (filter_name_to_yojson x.name));
    ]

let tag_filters_to_yojson tree = list_to_yojson tag_filter_to_yojson tree
let string_max255_to_yojson = string_to_yojson
let string__to_yojson = string_to_yojson
let boolean__to_yojson = bool_to_yojson

let agent_configuration_status_to_yojson (x : agent_configuration_status) =
  assoc_to_yojson
    [
      ("description", option_to_yojson string__to_yojson x.description);
      ("operationSucceeded", option_to_yojson boolean__to_yojson x.operation_succeeded);
      ("agentId", option_to_yojson string__to_yojson x.agent_id);
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

let stop_continuous_export_response_to_yojson (x : stop_continuous_export_response) =
  assoc_to_yojson
    [
      ("stopTime", option_to_yojson time_stamp_to_yojson x.stop_time);
      ("startTime", option_to_yojson time_stamp_to_yojson x.start_time);
    ]

let configurations_export_id_to_yojson = string_to_yojson

let stop_continuous_export_request_to_yojson (x : stop_continuous_export_request) =
  assoc_to_yojson [ ("exportId", Some (configurations_export_id_to_yojson x.export_id)) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let operation_not_permitted_exception_to_yojson (x : operation_not_permitted_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let client_request_token_to_yojson = string_to_yojson
let import_task_name_to_yojson = string_to_yojson
let import_ur_l_to_yojson = string_to_yojson

let import_status_to_yojson (x : import_status) =
  match x with
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"
  | DELETE_FAILED_LIMIT_EXCEEDED -> `String "DELETE_FAILED_LIMIT_EXCEEDED"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETE_COMPLETE -> `String "DELETE_COMPLETE"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | IMPORT_FAILED_UNSUPPORTED_FILE_TYPE -> `String "IMPORT_FAILED_UNSUPPORTED_FILE_TYPE"
  | IMPORT_FAILED_RECORD_LIMIT_EXCEEDED -> `String "IMPORT_FAILED_RECORD_LIMIT_EXCEEDED"
  | IMPORT_FAILED_SERVER_LIMIT_EXCEEDED -> `String "IMPORT_FAILED_SERVER_LIMIT_EXCEEDED"
  | IMPORT_FAILED -> `String "IMPORT_FAILED"
  | IMPORT_COMPLETE_WITH_ERRORS -> `String "IMPORT_COMPLETE_WITH_ERRORS"
  | IMPORT_COMPLETE -> `String "IMPORT_COMPLETE"
  | IMPORT_IN_PROGRESS -> `String "IMPORT_IN_PROGRESS"

let file_classification_to_yojson (x : file_classification) =
  match x with
  | IMPORT_TEMPLATE -> `String "IMPORT_TEMPLATE"
  | VMWARE_NSX_EXPORT -> `String "VMWARE_NSX_EXPORT"
  | RVTOOLS_EXPORT -> `String "RVTOOLS_EXPORT"
  | MODELIZEIT_EXPORT -> `String "MODELIZEIT_EXPORT"

let integer_to_yojson = int_to_yojson
let s3_presigned_url_to_yojson = string_to_yojson

let import_task_to_yojson (x : import_task) =
  assoc_to_yojson
    [
      ( "errorsAndFailedEntriesZip",
        option_to_yojson s3_presigned_url_to_yojson x.errors_and_failed_entries_zip );
      ("applicationImportFailure", option_to_yojson integer_to_yojson x.application_import_failure);
      ("applicationImportSuccess", option_to_yojson integer_to_yojson x.application_import_success);
      ("serverImportFailure", option_to_yojson integer_to_yojson x.server_import_failure);
      ("serverImportSuccess", option_to_yojson integer_to_yojson x.server_import_success);
      ("fileClassification", option_to_yojson file_classification_to_yojson x.file_classification);
      ("importDeletedTime", option_to_yojson time_stamp_to_yojson x.import_deleted_time);
      ("importCompletionTime", option_to_yojson time_stamp_to_yojson x.import_completion_time);
      ("importRequestTime", option_to_yojson time_stamp_to_yojson x.import_request_time);
      ("status", option_to_yojson import_status_to_yojson x.status);
      ("importUrl", option_to_yojson import_ur_l_to_yojson x.import_url);
      ("name", option_to_yojson import_task_name_to_yojson x.name);
      ("clientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("importTaskId", option_to_yojson import_task_identifier_to_yojson x.import_task_id);
    ]

let start_import_task_response_to_yojson (x : start_import_task_response) =
  assoc_to_yojson [ ("task", option_to_yojson import_task_to_yojson x.task) ]

let start_import_task_request_to_yojson (x : start_import_task_request) =
  assoc_to_yojson
    [
      ("importUrl", Some (import_ur_l_to_yojson x.import_url));
      ("name", Some (import_task_name_to_yojson x.name));
      ( "clientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let start_export_task_response_to_yojson (x : start_export_task_response) =
  assoc_to_yojson [ ("exportId", option_to_yojson configurations_export_id_to_yojson x.export_id) ]

let export_data_format_to_yojson (x : export_data_format) = match x with CSV -> `String "CSV"
let export_data_formats_to_yojson tree = list_to_yojson export_data_format_to_yojson tree
let condition_to_yojson = string_to_yojson

let export_filter_to_yojson (x : export_filter) =
  assoc_to_yojson
    [
      ("condition", Some (condition_to_yojson x.condition));
      ("values", Some (filter_values_to_yojson x.values));
      ("name", Some (filter_name_to_yojson x.name));
    ]

let export_filters_to_yojson tree = list_to_yojson export_filter_to_yojson tree
let export_enabled_to_yojson = bool_to_yojson
let ec2_instance_type_to_yojson = string_to_yojson
let excluded_instance_types_to_yojson tree = list_to_yojson ec2_instance_type_to_yojson tree

let purchasing_option_to_yojson (x : purchasing_option) =
  match x with
  | NO_UPFRONT -> `String "NO_UPFRONT"
  | PARTIAL_UPFRONT -> `String "PARTIAL_UPFRONT"
  | ALL_UPFRONT -> `String "ALL_UPFRONT"

let offering_class_to_yojson (x : offering_class) =
  match x with CONVERTIBLE -> `String "CONVERTIBLE" | STANDARD -> `String "STANDARD"

let reserved_instance_options_to_yojson (x : reserved_instance_options) =
  assoc_to_yojson
    [
      ("termLength", Some (term_length_to_yojson x.term_length));
      ("offeringClass", Some (offering_class_to_yojson x.offering_class));
      ("purchasingOption", Some (purchasing_option_to_yojson x.purchasing_option));
    ]

let ec2_recommendations_export_preferences_to_yojson (x : ec2_recommendations_export_preferences) =
  assoc_to_yojson
    [
      ( "reservedInstanceOptions",
        option_to_yojson reserved_instance_options_to_yojson x.reserved_instance_options );
      ("preferredRegion", option_to_yojson user_preferred_region_to_yojson x.preferred_region);
      ( "excludedInstanceTypes",
        option_to_yojson excluded_instance_types_to_yojson x.excluded_instance_types );
      ("tenancy", option_to_yojson tenancy_to_yojson x.tenancy);
      ( "ramPerformanceMetricBasis",
        option_to_yojson usage_metric_basis_to_yojson x.ram_performance_metric_basis );
      ( "cpuPerformanceMetricBasis",
        option_to_yojson usage_metric_basis_to_yojson x.cpu_performance_metric_basis );
      ("enabled", option_to_yojson export_enabled_to_yojson x.enabled);
    ]

let export_preferences_to_yojson (x : export_preferences) =
  match x with
  | Ec2RecommendationsPreferences arg ->
      assoc_to_yojson
        [
          ( "ec2RecommendationsPreferences",
            Some (ec2_recommendations_export_preferences_to_yojson arg) );
        ]

let start_export_task_request_to_yojson (x : start_export_task_request) =
  assoc_to_yojson
    [
      ("preferences", option_to_yojson export_preferences_to_yojson x.preferences);
      ("endTime", option_to_yojson time_stamp_to_yojson x.end_time);
      ("startTime", option_to_yojson time_stamp_to_yojson x.start_time);
      ("filters", option_to_yojson export_filters_to_yojson x.filters);
      ("exportDataFormat", option_to_yojson export_data_formats_to_yojson x.export_data_format);
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

let s3_bucket_to_yojson = string_to_yojson
let data_source_to_yojson (x : data_source) = match x with AGENT -> `String "AGENT"
let database_name_to_yojson = string_to_yojson

let schema_storage_config_to_yojson tree =
  map_to_yojson database_name_to_yojson string__to_yojson tree

let start_continuous_export_response_to_yojson (x : start_continuous_export_response) =
  assoc_to_yojson
    [
      ( "schemaStorageConfig",
        option_to_yojson schema_storage_config_to_yojson x.schema_storage_config );
      ("dataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("startTime", option_to_yojson time_stamp_to_yojson x.start_time);
      ("s3Bucket", option_to_yojson s3_bucket_to_yojson x.s3_bucket);
      ("exportId", option_to_yojson configurations_export_id_to_yojson x.export_id);
    ]

let start_continuous_export_request_to_yojson = unit_to_yojson

let conflict_error_exception_to_yojson (x : conflict_error_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let start_batch_delete_configuration_task_response_to_yojson
    (x : start_batch_delete_configuration_task_response) =
  assoc_to_yojson [ ("taskId", option_to_yojson uui_d_to_yojson x.task_id) ]

let deletion_configuration_item_type_to_yojson (x : deletion_configuration_item_type) =
  match x with SERVER -> `String "SERVER"

let configuration_id_to_yojson = string_to_yojson
let configuration_id_list_to_yojson tree = list_to_yojson configuration_id_to_yojson tree

let start_batch_delete_configuration_task_request_to_yojson
    (x : start_batch_delete_configuration_task_request) =
  assoc_to_yojson
    [
      ("configurationIds", Some (configuration_id_list_to_yojson x.configuration_ids));
      ("configurationType", Some (deletion_configuration_item_type_to_yojson x.configuration_type));
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let order_by_element_field_name_to_yojson = string_to_yojson

let order_by_element_to_yojson (x : order_by_element) =
  assoc_to_yojson
    [
      ("sortOrder", option_to_yojson order_string_to_yojson x.sort_order);
      ("fieldName", Some (order_by_element_field_name_to_yojson x.field_name));
    ]

let order_by_list_to_yojson tree = list_to_yojson order_by_element_to_yojson tree
let next_token_to_yojson = string_to_yojson
let boxed_integer_to_yojson = int_to_yojson
let long_to_yojson = long_to_yojson

let neighbor_connection_detail_to_yojson (x : neighbor_connection_detail) =
  assoc_to_yojson
    [
      ("connectionsCount", Some (long_to_yojson x.connections_count));
      ("transportProtocol", option_to_yojson string__to_yojson x.transport_protocol);
      ("destinationPort", option_to_yojson boxed_integer_to_yojson x.destination_port);
      ("destinationServerId", Some (configuration_id_to_yojson x.destination_server_id));
      ("sourceServerId", Some (configuration_id_to_yojson x.source_server_id));
    ]

let neighbor_details_list_to_yojson tree = list_to_yojson neighbor_connection_detail_to_yojson tree

let list_server_neighbors_response_to_yojson (x : list_server_neighbors_response) =
  assoc_to_yojson
    [
      ("knownDependencyCount", option_to_yojson long_to_yojson x.known_dependency_count);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("neighbors", Some (neighbor_details_list_to_yojson x.neighbors));
    ]

let list_server_neighbors_request_to_yojson (x : list_server_neighbors_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
      ( "neighborConfigurationIds",
        option_to_yojson configuration_id_list_to_yojson x.neighbor_configuration_ids );
      ("portInformationNeeded", option_to_yojson boolean__to_yojson x.port_information_needed);
      ("configurationId", Some (configuration_id_to_yojson x.configuration_id));
    ]

let configuration_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree
let configurations_to_yojson tree = list_to_yojson configuration_to_yojson tree

let list_configurations_response_to_yojson (x : list_configurations_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("configurations", option_to_yojson configurations_to_yojson x.configurations);
    ]

let configuration_item_type_to_yojson (x : configuration_item_type) =
  match x with
  | APPLICATION -> `String "APPLICATION"
  | CONNECTIONS -> `String "CONNECTION"
  | PROCESS -> `String "PROCESS"
  | SERVER -> `String "SERVER"

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("condition", Some (condition_to_yojson x.condition));
      ("values", Some (filter_values_to_yojson x.values));
      ("name", Some (string__to_yojson x.name));
    ]

let filters_to_yojson tree = list_to_yojson filter_to_yojson tree

let list_configurations_request_to_yojson (x : list_configurations_request) =
  assoc_to_yojson
    [
      ("orderBy", option_to_yojson order_by_list_to_yojson x.order_by);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
      ("filters", option_to_yojson filters_to_yojson x.filters);
      ("configurationType", Some (configuration_item_type_to_yojson x.configuration_type));
    ]

let import_task_list_to_yojson tree = list_to_yojson import_task_to_yojson tree
let import_task_filter_value_to_yojson = string_to_yojson

let import_task_filter_value_list_to_yojson tree =
  list_to_yojson import_task_filter_value_to_yojson tree

let import_task_filter_name_to_yojson (x : import_task_filter_name) =
  match x with
  | FILE_CLASSIFICATION -> `String "FILE_CLASSIFICATION"
  | NAME -> `String "NAME"
  | STATUS -> `String "STATUS"
  | IMPORT_TASK_ID -> `String "IMPORT_TASK_ID"

let import_task_filter_to_yojson (x : import_task_filter) =
  assoc_to_yojson
    [
      ("values", option_to_yojson import_task_filter_value_list_to_yojson x.values);
      ("name", option_to_yojson import_task_filter_name_to_yojson x.name);
    ]

let customer_agent_info_to_yojson (x : customer_agent_info) =
  assoc_to_yojson
    [
      ("unknownAgents", Some (integer_to_yojson x.unknown_agents));
      ("totalAgents", Some (integer_to_yojson x.total_agents));
      ("unhealthyAgents", Some (integer_to_yojson x.unhealthy_agents));
      ("shutdownAgents", Some (integer_to_yojson x.shutdown_agents));
      ("blackListedAgents", Some (integer_to_yojson x.black_listed_agents));
      ("healthyAgents", Some (integer_to_yojson x.healthy_agents));
      ("activeAgents", Some (integer_to_yojson x.active_agents));
    ]

let customer_connector_info_to_yojson (x : customer_connector_info) =
  assoc_to_yojson
    [
      ("unknownConnectors", Some (integer_to_yojson x.unknown_connectors));
      ("totalConnectors", Some (integer_to_yojson x.total_connectors));
      ("unhealthyConnectors", Some (integer_to_yojson x.unhealthy_connectors));
      ("shutdownConnectors", Some (integer_to_yojson x.shutdown_connectors));
      ("blackListedConnectors", Some (integer_to_yojson x.black_listed_connectors));
      ("healthyConnectors", Some (integer_to_yojson x.healthy_connectors));
      ("activeConnectors", Some (integer_to_yojson x.active_connectors));
    ]

let customer_me_collector_info_to_yojson (x : customer_me_collector_info) =
  assoc_to_yojson
    [
      ("unknownMeCollectors", Some (integer_to_yojson x.unknown_me_collectors));
      ("totalMeCollectors", Some (integer_to_yojson x.total_me_collectors));
      ("unhealthyMeCollectors", Some (integer_to_yojson x.unhealthy_me_collectors));
      ("shutdownMeCollectors", Some (integer_to_yojson x.shutdown_me_collectors));
      ("denyListedMeCollectors", Some (integer_to_yojson x.deny_listed_me_collectors));
      ("healthyMeCollectors", Some (integer_to_yojson x.healthy_me_collectors));
      ("activeMeCollectors", Some (integer_to_yojson x.active_me_collectors));
    ]

let customer_agentless_collector_info_to_yojson (x : customer_agentless_collector_info) =
  assoc_to_yojson
    [
      ("unknownAgentlessCollectors", Some (integer_to_yojson x.unknown_agentless_collectors));
      ("totalAgentlessCollectors", Some (integer_to_yojson x.total_agentless_collectors));
      ("unhealthyAgentlessCollectors", Some (integer_to_yojson x.unhealthy_agentless_collectors));
      ("shutdownAgentlessCollectors", Some (integer_to_yojson x.shutdown_agentless_collectors));
      ("denyListedAgentlessCollectors", Some (integer_to_yojson x.deny_listed_agentless_collectors));
      ("healthyAgentlessCollectors", Some (integer_to_yojson x.healthy_agentless_collectors));
      ("activeAgentlessCollectors", Some (integer_to_yojson x.active_agentless_collectors));
    ]

let get_discovery_summary_response_to_yojson (x : get_discovery_summary_response) =
  assoc_to_yojson
    [
      ( "agentlessCollectorSummary",
        option_to_yojson customer_agentless_collector_info_to_yojson x.agentless_collector_summary
      );
      ( "meCollectorSummary",
        option_to_yojson customer_me_collector_info_to_yojson x.me_collector_summary );
      ("connectorSummary", option_to_yojson customer_connector_info_to_yojson x.connector_summary);
      ("agentSummary", option_to_yojson customer_agent_info_to_yojson x.agent_summary);
      ("serversMappedtoTags", option_to_yojson long_to_yojson x.servers_mappedto_tags);
      ( "serversMappedToApplications",
        option_to_yojson long_to_yojson x.servers_mapped_to_applications );
      ("applications", option_to_yojson long_to_yojson x.applications);
      ("servers", option_to_yojson long_to_yojson x.servers);
    ]

let get_discovery_summary_request_to_yojson = unit_to_yojson
let error_status_code_to_yojson = int_to_yojson
let error_message_to_yojson = string_to_yojson

let failed_configuration_to_yojson (x : failed_configuration) =
  assoc_to_yojson
    [
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("errorStatusCode", option_to_yojson error_status_code_to_yojson x.error_status_code);
      ("configurationId", option_to_yojson configuration_id_to_yojson x.configuration_id);
    ]

let failed_configuration_list_to_yojson tree = list_to_yojson failed_configuration_to_yojson tree

let export_status_to_yojson (x : export_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"

let export_status_message_to_yojson = string_to_yojson
let configurations_download_url_to_yojson = string_to_yojson
let export_request_time_to_yojson = timestamp_epoch_seconds_to_yojson

let export_info_to_yojson (x : export_info) =
  assoc_to_yojson
    [
      ("requestedEndTime", option_to_yojson time_stamp_to_yojson x.requested_end_time);
      ("requestedStartTime", option_to_yojson time_stamp_to_yojson x.requested_start_time);
      ("isTruncated", option_to_yojson boolean__to_yojson x.is_truncated);
      ("exportRequestTime", Some (export_request_time_to_yojson x.export_request_time));
      ( "configurationsDownloadUrl",
        option_to_yojson configurations_download_url_to_yojson x.configurations_download_url );
      ("statusMessage", Some (export_status_message_to_yojson x.status_message));
      ("exportStatus", Some (export_status_to_yojson x.export_status));
      ("exportId", Some (configurations_export_id_to_yojson x.export_id));
    ]

let exports_info_to_yojson tree = list_to_yojson export_info_to_yojson tree
let export_ids_to_yojson tree = list_to_yojson configurations_export_id_to_yojson tree

let export_configurations_response_to_yojson (x : export_configurations_response) =
  assoc_to_yojson [ ("exportId", option_to_yojson configurations_export_id_to_yojson x.export_id) ]

let disassociate_configuration_items_from_application_response_to_yojson = unit_to_yojson

let disassociate_configuration_items_from_application_request_to_yojson
    (x : disassociate_configuration_items_from_application_request) =
  assoc_to_yojson
    [
      ("configurationIds", Some (configuration_id_list_to_yojson x.configuration_ids));
      ("applicationConfigurationId", Some (application_id_to_yojson x.application_configuration_id));
    ]

let configuration_tag_to_yojson (x : configuration_tag) =
  assoc_to_yojson
    [
      ("timeOfCreation", option_to_yojson time_stamp_to_yojson x.time_of_creation);
      ("value", option_to_yojson tag_value_to_yojson x.value);
      ("key", option_to_yojson tag_key_to_yojson x.key);
      ("configurationId", option_to_yojson configuration_id_to_yojson x.configuration_id);
      ("configurationType", option_to_yojson configuration_item_type_to_yojson x.configuration_type);
    ]

let configuration_tag_set_to_yojson tree = list_to_yojson configuration_tag_to_yojson tree

let describe_tags_response_to_yojson (x : describe_tags_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("tags", option_to_yojson configuration_tag_set_to_yojson x.tags);
    ]

let describe_tags_request_to_yojson (x : describe_tags_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
      ("filters", option_to_yojson tag_filters_to_yojson x.filters);
    ]

let describe_import_tasks_response_to_yojson (x : describe_import_tasks_response) =
  assoc_to_yojson
    [
      ("tasks", option_to_yojson import_task_list_to_yojson x.tasks);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_import_tasks_filter_list_to_yojson tree =
  list_to_yojson import_task_filter_to_yojson tree

let describe_import_tasks_max_results_to_yojson = int_to_yojson

let describe_import_tasks_request_to_yojson (x : describe_import_tasks_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson describe_import_tasks_max_results_to_yojson x.max_results);
      ("filters", option_to_yojson describe_import_tasks_filter_list_to_yojson x.filters);
    ]

let describe_export_tasks_response_to_yojson (x : describe_export_tasks_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("exportsInfo", option_to_yojson exports_info_to_yojson x.exports_info);
    ]

let describe_export_tasks_request_to_yojson (x : describe_export_tasks_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
      ("filters", option_to_yojson export_filters_to_yojson x.filters);
      ("exportIds", option_to_yojson export_ids_to_yojson x.export_ids);
    ]

let describe_export_configurations_response_to_yojson (x : describe_export_configurations_response)
    =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("exportsInfo", option_to_yojson exports_info_to_yojson x.exports_info);
    ]

let describe_export_configurations_request_to_yojson (x : describe_export_configurations_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
      ("exportIds", option_to_yojson export_ids_to_yojson x.export_ids);
    ]

let continuous_export_status_to_yojson (x : continuous_export_status) =
  match x with
  | INACTIVE -> `String "INACTIVE"
  | STOP_FAILED -> `String "STOP_FAILED"
  | STOP_IN_PROGRESS -> `String "STOP_IN_PROGRESS"
  | ERROR -> `String "ERROR"
  | ACTIVE -> `String "ACTIVE"
  | START_FAILED -> `String "START_FAILED"
  | START_IN_PROGRESS -> `String "START_IN_PROGRESS"

let continuous_export_description_to_yojson (x : continuous_export_description) =
  assoc_to_yojson
    [
      ( "schemaStorageConfig",
        option_to_yojson schema_storage_config_to_yojson x.schema_storage_config );
      ("dataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("stopTime", option_to_yojson time_stamp_to_yojson x.stop_time);
      ("startTime", option_to_yojson time_stamp_to_yojson x.start_time);
      ("s3Bucket", option_to_yojson s3_bucket_to_yojson x.s3_bucket);
      ("statusDetail", option_to_yojson string_max255_to_yojson x.status_detail);
      ("status", option_to_yojson continuous_export_status_to_yojson x.status);
      ("exportId", option_to_yojson configurations_export_id_to_yojson x.export_id);
    ]

let continuous_export_descriptions_to_yojson tree =
  list_to_yojson continuous_export_description_to_yojson tree

let describe_continuous_exports_response_to_yojson (x : describe_continuous_exports_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("descriptions", option_to_yojson continuous_export_descriptions_to_yojson x.descriptions);
    ]

let continuous_export_ids_to_yojson tree = list_to_yojson configurations_export_id_to_yojson tree
let describe_continuous_exports_max_results_to_yojson = int_to_yojson

let describe_continuous_exports_request_to_yojson (x : describe_continuous_exports_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson describe_continuous_exports_max_results_to_yojson x.max_results );
      ("exportIds", option_to_yojson continuous_export_ids_to_yojson x.export_ids);
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

let batch_delete_configuration_task_status_to_yojson (x : batch_delete_configuration_task_status) =
  match x with
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | DELETING -> `String "DELETING"
  | VALIDATING -> `String "VALIDATING"
  | INITIALIZING -> `String "INITIALIZING"

let deletion_warning_to_yojson (x : deletion_warning) =
  assoc_to_yojson
    [
      ("warningText", option_to_yojson warning_text_to_yojson x.warning_text);
      ("warningCode", option_to_yojson warning_code_to_yojson x.warning_code);
      ("configurationId", option_to_yojson configuration_id_to_yojson x.configuration_id);
    ]

let deletion_warnings_list_to_yojson tree = list_to_yojson deletion_warning_to_yojson tree

let batch_delete_configuration_task_to_yojson (x : batch_delete_configuration_task) =
  assoc_to_yojson
    [
      ("deletionWarnings", option_to_yojson deletion_warnings_list_to_yojson x.deletion_warnings);
      ( "failedConfigurations",
        option_to_yojson failed_configuration_list_to_yojson x.failed_configurations );
      ( "deletedConfigurations",
        option_to_yojson configuration_id_list_to_yojson x.deleted_configurations );
      ( "requestedConfigurations",
        option_to_yojson configuration_id_list_to_yojson x.requested_configurations );
      ( "configurationType",
        option_to_yojson deletion_configuration_item_type_to_yojson x.configuration_type );
      ("endTime", option_to_yojson time_stamp_to_yojson x.end_time);
      ("startTime", option_to_yojson time_stamp_to_yojson x.start_time);
      ("status", option_to_yojson batch_delete_configuration_task_status_to_yojson x.status);
      ("taskId", option_to_yojson uui_d_to_yojson x.task_id);
    ]

let describe_batch_delete_configuration_task_response_to_yojson
    (x : describe_batch_delete_configuration_task_response) =
  assoc_to_yojson [ ("task", option_to_yojson batch_delete_configuration_task_to_yojson x.task) ]

let describe_batch_delete_configuration_task_request_to_yojson
    (x : describe_batch_delete_configuration_task_request) =
  assoc_to_yojson [ ("taskId", Some (uui_d_to_yojson x.task_id)) ]

let agent_network_info_to_yojson (x : agent_network_info) =
  assoc_to_yojson
    [
      ("macAddress", option_to_yojson string__to_yojson x.mac_address);
      ("ipAddress", option_to_yojson string__to_yojson x.ip_address);
    ]

let agent_network_info_list_to_yojson tree = list_to_yojson agent_network_info_to_yojson tree

let agent_status_to_yojson (x : agent_status) =
  match x with
  | SHUTDOWN -> `String "SHUTDOWN"
  | BLACKLISTED -> `String "BLACKLISTED"
  | UNKNOWN -> `String "UNKNOWN"
  | RUNNING -> `String "RUNNING"
  | UNHEALTHY -> `String "UNHEALTHY"
  | HEALTHY -> `String "HEALTHY"

let agent_info_to_yojson (x : agent_info) =
  assoc_to_yojson
    [
      ("registeredTime", option_to_yojson string__to_yojson x.registered_time);
      ("agentType", option_to_yojson string__to_yojson x.agent_type);
      ("collectionStatus", option_to_yojson string__to_yojson x.collection_status);
      ("lastHealthPingTime", option_to_yojson string__to_yojson x.last_health_ping_time);
      ("health", option_to_yojson agent_status_to_yojson x.health);
      ("version", option_to_yojson string__to_yojson x.version);
      ("connectorId", option_to_yojson string__to_yojson x.connector_id);
      ( "agentNetworkInfoList",
        option_to_yojson agent_network_info_list_to_yojson x.agent_network_info_list );
      ("hostName", option_to_yojson string__to_yojson x.host_name);
      ("agentId", option_to_yojson agent_id_to_yojson x.agent_id);
    ]

let agents_info_to_yojson tree = list_to_yojson agent_info_to_yojson tree

let describe_agents_response_to_yojson (x : describe_agents_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("agentsInfo", option_to_yojson agents_info_to_yojson x.agents_info);
    ]

let describe_agents_request_to_yojson (x : describe_agents_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
      ("filters", option_to_yojson filters_to_yojson x.filters);
      ("agentIds", option_to_yojson agent_ids_to_yojson x.agent_ids);
    ]

let delete_tags_response_to_yojson = unit_to_yojson

let delete_tags_request_to_yojson (x : delete_tags_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_set_to_yojson x.tags);
      ("configurationIds", Some (configuration_id_list_to_yojson x.configuration_ids));
    ]

let delete_applications_response_to_yojson = unit_to_yojson
let application_ids_list_to_yojson tree = list_to_yojson application_id_to_yojson tree

let delete_applications_request_to_yojson (x : delete_applications_request) =
  assoc_to_yojson
    [ ("configurationIds", Some (application_ids_list_to_yojson x.configuration_ids)) ]

let delete_agent_to_yojson (x : delete_agent) =
  assoc_to_yojson
    [
      ("force", option_to_yojson boolean__to_yojson x.force);
      ("agentId", Some (agent_id_to_yojson x.agent_id));
    ]

let delete_agents_to_yojson tree = list_to_yojson delete_agent_to_yojson tree

let delete_agent_error_code_to_yojson (x : delete_agent_error_code) =
  match x with
  | AGENT_IN_USE -> `String "AGENT_IN_USE"
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"
  | NOT_FOUND -> `String "NOT_FOUND"

let create_tags_response_to_yojson = unit_to_yojson

let create_tags_request_to_yojson (x : create_tags_request) =
  assoc_to_yojson
    [
      ("tags", Some (tag_set_to_yojson x.tags));
      ("configurationIds", Some (configuration_id_list_to_yojson x.configuration_ids));
    ]

let create_application_response_to_yojson (x : create_application_response) =
  assoc_to_yojson [ ("configurationId", option_to_yojson string__to_yojson x.configuration_id) ]

let create_application_request_to_yojson (x : create_application_request) =
  assoc_to_yojson
    [
      ("wave", option_to_yojson application_wave_to_yojson x.wave);
      ("description", option_to_yojson application_description_to_yojson x.description);
      ("name", Some (application_name_to_yojson x.name));
    ]

let batch_delete_import_data_error_code_to_yojson (x : batch_delete_import_data_error_code) =
  match x with
  | OVER_LIMIT -> `String "OVER_LIMIT"
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"
  | NOT_FOUND -> `String "NOT_FOUND"

let batch_delete_import_data_error_description_to_yojson = string_to_yojson

let batch_delete_import_data_error_to_yojson (x : batch_delete_import_data_error) =
  assoc_to_yojson
    [
      ( "errorDescription",
        option_to_yojson batch_delete_import_data_error_description_to_yojson x.error_description );
      ("errorCode", option_to_yojson batch_delete_import_data_error_code_to_yojson x.error_code);
      ("importTaskId", option_to_yojson import_task_identifier_to_yojson x.import_task_id);
    ]

let batch_delete_import_data_error_list_to_yojson tree =
  list_to_yojson batch_delete_import_data_error_to_yojson tree

let batch_delete_import_data_response_to_yojson (x : batch_delete_import_data_response) =
  assoc_to_yojson
    [ ("errors", option_to_yojson batch_delete_import_data_error_list_to_yojson x.errors) ]

let batch_delete_import_data_request_to_yojson (x : batch_delete_import_data_request) =
  assoc_to_yojson
    [
      ("deleteHistory", option_to_yojson boolean__to_yojson x.delete_history);
      ("importTaskIds", Some (to_delete_identifier_list_to_yojson x.import_task_ids));
    ]

let batch_delete_agent_error_to_yojson (x : batch_delete_agent_error) =
  assoc_to_yojson
    [
      ("errorCode", Some (delete_agent_error_code_to_yojson x.error_code));
      ("errorMessage", Some (string__to_yojson x.error_message));
      ("agentId", Some (agent_id_to_yojson x.agent_id));
    ]

let batch_delete_agent_errors_to_yojson tree =
  list_to_yojson batch_delete_agent_error_to_yojson tree

let batch_delete_agents_response_to_yojson (x : batch_delete_agents_response) =
  assoc_to_yojson [ ("errors", option_to_yojson batch_delete_agent_errors_to_yojson x.errors) ]

let batch_delete_agents_request_to_yojson (x : batch_delete_agents_request) =
  assoc_to_yojson [ ("deleteAgents", Some (delete_agents_to_yojson x.delete_agents)) ]

let associate_configuration_items_to_application_response_to_yojson = unit_to_yojson

let associate_configuration_items_to_application_request_to_yojson
    (x : associate_configuration_items_to_application_request) =
  assoc_to_yojson
    [
      ("configurationIds", Some (configuration_id_list_to_yojson x.configuration_ids));
      ("applicationConfigurationId", Some (application_id_to_yojson x.application_configuration_id));
    ]
