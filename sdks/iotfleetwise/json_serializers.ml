open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", Some (string__to_yojson x.message)) ]

let node_path_to_yojson = string_to_yojson
let message_to_yojson = string_to_yojson
let double_to_yojson = double_to_yojson
let list_of_strings_to_yojson tree = list_to_yojson string__to_yojson tree
let description_to_yojson = string_to_yojson

let node_data_type_to_yojson (x : node_data_type) =
  match x with
  | INT8 -> `String "INT8"
  | UINT8 -> `String "UINT8"
  | INT16 -> `String "INT16"
  | UINT16 -> `String "UINT16"
  | INT32 -> `String "INT32"
  | UINT32 -> `String "UINT32"
  | INT64 -> `String "INT64"
  | UINT64 -> `String "UINT64"
  | BOOLEAN -> `String "BOOLEAN"
  | FLOAT -> `String "FLOAT"
  | DOUBLE -> `String "DOUBLE"
  | STRING -> `String "STRING"
  | UNIX_TIMESTAMP -> `String "UNIX_TIMESTAMP"
  | INT8_ARRAY -> `String "INT8_ARRAY"
  | UINT8_ARRAY -> `String "UINT8_ARRAY"
  | INT16_ARRAY -> `String "INT16_ARRAY"
  | UINT16_ARRAY -> `String "UINT16_ARRAY"
  | INT32_ARRAY -> `String "INT32_ARRAY"
  | UINT32_ARRAY -> `String "UINT32_ARRAY"
  | INT64_ARRAY -> `String "INT64_ARRAY"
  | UINT64_ARRAY -> `String "UINT64_ARRAY"
  | BOOLEAN_ARRAY -> `String "BOOLEAN_ARRAY"
  | FLOAT_ARRAY -> `String "FLOAT_ARRAY"
  | DOUBLE_ARRAY -> `String "DOUBLE_ARRAY"
  | STRING_ARRAY -> `String "STRING_ARRAY"
  | UNIX_TIMESTAMP_ARRAY -> `String "UNIX_TIMESTAMP_ARRAY"
  | UNKNOWN -> `String "UNKNOWN"
  | STRUCT -> `String "STRUCT"
  | STRUCT_ARRAY -> `String "STRUCT_ARRAY"

let actuator_to_yojson (x : actuator) =
  assoc_to_yojson
    [
      ("fullyQualifiedName", Some (string__to_yojson x.fully_qualified_name));
      ("dataType", Some (node_data_type_to_yojson x.data_type));
      ("description", option_to_yojson description_to_yojson x.description);
      ("unit", option_to_yojson string__to_yojson x.unit_);
      ("allowedValues", option_to_yojson list_of_strings_to_yojson x.allowed_values);
      ("min", option_to_yojson double_to_yojson x.min);
      ("max", option_to_yojson double_to_yojson x.max);
      ("assignedValue", option_to_yojson string__to_yojson x.assigned_value);
      ("deprecationMessage", option_to_yojson message_to_yojson x.deprecation_message);
      ("comment", option_to_yojson message_to_yojson x.comment);
      ( "structFullyQualifiedName",
        option_to_yojson node_path_to_yojson x.struct_fully_qualified_name );
    ]

let amazon_resource_name_to_yojson = string_to_yojson

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | UNKNOWN_OPERATION -> `String "unknownOperation"
  | CANNOT_PARSE -> `String "cannotParse"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | OTHER -> `String "other"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("message", Some (string__to_yojson x.message));
      ("reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("fieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
    ]

let retry_after_seconds_to_yojson = int_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("message", Some (string__to_yojson x.message));
      ("quotaCode", option_to_yojson string__to_yojson x.quota_code);
      ("serviceCode", option_to_yojson string__to_yojson x.service_code);
      ("retryAfterSeconds", option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds);
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", Some (string__to_yojson x.message));
      ("resourceId", Some (string__to_yojson x.resource_id));
      ("resourceType", Some (string__to_yojson x.resource_type));
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("message", Some (string__to_yojson x.message));
      ("resourceId", Some (string__to_yojson x.resource_id));
      ("resourceType", Some (string__to_yojson x.resource_type));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("message", Some (string__to_yojson x.message));
      ("retryAfterSeconds", option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds);
    ]

let associate_vehicle_fleet_response_to_yojson = unit_to_yojson
let fleet_id_to_yojson = string_to_yojson
let vehicle_name_to_yojson = string_to_yojson

let associate_vehicle_fleet_request_to_yojson (x : associate_vehicle_fleet_request) =
  assoc_to_yojson
    [
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
      ("fleetId", Some (fleet_id_to_yojson x.fleet_id));
    ]

let attribute_to_yojson (x : attribute) =
  assoc_to_yojson
    [
      ("fullyQualifiedName", Some (string__to_yojson x.fully_qualified_name));
      ("dataType", Some (node_data_type_to_yojson x.data_type));
      ("description", option_to_yojson description_to_yojson x.description);
      ("unit", option_to_yojson string__to_yojson x.unit_);
      ("allowedValues", option_to_yojson list_of_strings_to_yojson x.allowed_values);
      ("min", option_to_yojson double_to_yojson x.min);
      ("max", option_to_yojson double_to_yojson x.max);
      ("assignedValue", option_to_yojson string__to_yojson x.assigned_value);
      ("defaultValue", option_to_yojson string__to_yojson x.default_value);
      ("deprecationMessage", option_to_yojson message_to_yojson x.deprecation_message);
      ("comment", option_to_yojson message_to_yojson x.comment);
    ]

let create_vehicle_error_to_yojson (x : create_vehicle_error) =
  assoc_to_yojson
    [
      ("vehicleName", option_to_yojson vehicle_name_to_yojson x.vehicle_name);
      ("code", option_to_yojson string__to_yojson x.code);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let create_vehicle_errors_to_yojson tree = list_to_yojson create_vehicle_error_to_yojson tree
let arn_to_yojson = string_to_yojson

let create_vehicle_response_item_to_yojson (x : create_vehicle_response_item) =
  assoc_to_yojson
    [
      ("vehicleName", option_to_yojson vehicle_name_to_yojson x.vehicle_name);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("thingArn", option_to_yojson arn_to_yojson x.thing_arn);
    ]

let create_vehicle_responses_to_yojson tree =
  list_to_yojson create_vehicle_response_item_to_yojson tree

let batch_create_vehicle_response_to_yojson (x : batch_create_vehicle_response) =
  assoc_to_yojson
    [
      ("vehicles", option_to_yojson create_vehicle_responses_to_yojson x.vehicles);
      ("errors", option_to_yojson create_vehicle_errors_to_yojson x.errors);
    ]

let on_change_state_template_update_strategy_to_yojson = unit_to_yojson
let positive_integer_to_yojson = int_to_yojson

let time_unit_to_yojson (x : time_unit) =
  match x with
  | MILLISECOND -> `String "MILLISECOND"
  | SECOND -> `String "SECOND"
  | MINUTE -> `String "MINUTE"
  | HOUR -> `String "HOUR"

let time_period_to_yojson (x : time_period) =
  assoc_to_yojson
    [
      ("unit", Some (time_unit_to_yojson x.unit_));
      ("value", Some (positive_integer_to_yojson x.value));
    ]

let periodic_state_template_update_strategy_to_yojson (x : periodic_state_template_update_strategy)
    =
  assoc_to_yojson
    [ ("stateTemplateUpdateRate", Some (time_period_to_yojson x.state_template_update_rate)) ]

let state_template_update_strategy_to_yojson (x : state_template_update_strategy) =
  match x with
  | Periodic arg ->
      assoc_to_yojson [ ("periodic", Some (periodic_state_template_update_strategy_to_yojson arg)) ]
  | OnChange arg ->
      assoc_to_yojson
        [ ("onChange", Some (on_change_state_template_update_strategy_to_yojson arg)) ]

let resource_identifier_to_yojson = string_to_yojson

let state_template_association_to_yojson (x : state_template_association) =
  assoc_to_yojson
    [
      ("identifier", Some (resource_identifier_to_yojson x.identifier));
      ( "stateTemplateUpdateStrategy",
        Some (state_template_update_strategy_to_yojson x.state_template_update_strategy) );
    ]

let state_template_associations_to_yojson tree =
  list_to_yojson state_template_association_to_yojson tree

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let vehicle_association_behavior_to_yojson (x : vehicle_association_behavior) =
  match x with
  | CREATE_IOT_THING -> `String "CreateIotThing"
  | VALIDATE_IOT_THING_EXISTS -> `String "ValidateIotThingExists"

let attribute_value_to_yojson = string_to_yojson
let attribute_name_to_yojson = string_to_yojson

let attributes_map_to_yojson tree =
  map_to_yojson attribute_name_to_yojson attribute_value_to_yojson tree

let create_vehicle_request_item_to_yojson (x : create_vehicle_request_item) =
  assoc_to_yojson
    [
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
      ("modelManifestArn", Some (arn_to_yojson x.model_manifest_arn));
      ("decoderManifestArn", Some (arn_to_yojson x.decoder_manifest_arn));
      ("attributes", option_to_yojson attributes_map_to_yojson x.attributes);
      ( "associationBehavior",
        option_to_yojson vehicle_association_behavior_to_yojson x.association_behavior );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("stateTemplates", option_to_yojson state_template_associations_to_yojson x.state_templates);
    ]

let create_vehicle_request_items_to_yojson tree =
  list_to_yojson create_vehicle_request_item_to_yojson tree

let batch_create_vehicle_request_to_yojson (x : batch_create_vehicle_request) =
  assoc_to_yojson [ ("vehicles", Some (create_vehicle_request_items_to_yojson x.vehicles)) ]

let number_to_yojson = int_to_yojson

let update_vehicle_error_to_yojson (x : update_vehicle_error) =
  assoc_to_yojson
    [
      ("vehicleName", option_to_yojson vehicle_name_to_yojson x.vehicle_name);
      ("code", option_to_yojson number_to_yojson x.code);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let update_vehicle_errors_to_yojson tree = list_to_yojson update_vehicle_error_to_yojson tree

let update_vehicle_response_item_to_yojson (x : update_vehicle_response_item) =
  assoc_to_yojson
    [
      ("vehicleName", option_to_yojson vehicle_name_to_yojson x.vehicle_name);
      ("arn", option_to_yojson arn_to_yojson x.arn);
    ]

let update_vehicle_response_items_to_yojson tree =
  list_to_yojson update_vehicle_response_item_to_yojson tree

let batch_update_vehicle_response_to_yojson (x : batch_update_vehicle_response) =
  assoc_to_yojson
    [
      ("vehicles", option_to_yojson update_vehicle_response_items_to_yojson x.vehicles);
      ("errors", option_to_yojson update_vehicle_errors_to_yojson x.errors);
    ]

let state_template_association_identifiers_to_yojson tree =
  list_to_yojson resource_identifier_to_yojson tree

let update_mode_to_yojson (x : update_mode) =
  match x with OVERWRITE -> `String "Overwrite" | MERGE -> `String "Merge"

let update_vehicle_request_item_to_yojson (x : update_vehicle_request_item) =
  assoc_to_yojson
    [
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
      ("modelManifestArn", option_to_yojson arn_to_yojson x.model_manifest_arn);
      ("decoderManifestArn", option_to_yojson arn_to_yojson x.decoder_manifest_arn);
      ("attributes", option_to_yojson attributes_map_to_yojson x.attributes);
      ("attributeUpdateMode", option_to_yojson update_mode_to_yojson x.attribute_update_mode);
      ( "stateTemplatesToAdd",
        option_to_yojson state_template_associations_to_yojson x.state_templates_to_add );
      ( "stateTemplatesToRemove",
        option_to_yojson state_template_association_identifiers_to_yojson
          x.state_templates_to_remove );
      ( "stateTemplatesToUpdate",
        option_to_yojson state_template_associations_to_yojson x.state_templates_to_update );
    ]

let update_vehicle_request_items_to_yojson tree =
  list_to_yojson update_vehicle_request_item_to_yojson tree

let batch_update_vehicle_request_to_yojson (x : batch_update_vehicle_request) =
  assoc_to_yojson [ ("vehicles", Some (update_vehicle_request_items_to_yojson x.vehicles)) ]

let branch_to_yojson (x : branch) =
  assoc_to_yojson
    [
      ("fullyQualifiedName", Some (string__to_yojson x.fully_qualified_name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("deprecationMessage", option_to_yojson message_to_yojson x.deprecation_message);
      ("comment", option_to_yojson message_to_yojson x.comment);
    ]

let campaign_status_to_yojson (x : campaign_status) =
  match x with
  | CREATING -> `String "CREATING"
  | WAITING_FOR_APPROVAL -> `String "WAITING_FOR_APPROVAL"
  | RUNNING -> `String "RUNNING"
  | SUSPENDED -> `String "SUSPENDED"

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let campaign_name_to_yojson = string_to_yojson
let campaign_arn_to_yojson = string_to_yojson

let campaign_summary_to_yojson (x : campaign_summary) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson campaign_arn_to_yojson x.arn);
      ("name", option_to_yojson campaign_name_to_yojson x.name);
      ("description", option_to_yojson description_to_yojson x.description);
      ("signalCatalogArn", option_to_yojson arn_to_yojson x.signal_catalog_arn);
      ("targetArn", option_to_yojson arn_to_yojson x.target_arn);
      ("status", option_to_yojson campaign_status_to_yojson x.status);
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
    ]

let model_signals_map_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree
let network_file_blob_to_yojson = blob_to_yojson
let network_files_list_to_yojson tree = list_to_yojson network_file_blob_to_yojson tree
let interface_id_to_yojson = string_to_yojson

let can_dbc_definition_to_yojson (x : can_dbc_definition) =
  assoc_to_yojson
    [
      ("networkInterface", Some (interface_id_to_yojson x.network_interface));
      ("canDbcFiles", Some (network_files_list_to_yojson x.can_dbc_files));
      ("signalsMap", option_to_yojson model_signals_map_to_yojson x.signals_map);
    ]

let protocol_version_to_yojson = string_to_yojson
let protocol_name_to_yojson = string_to_yojson
let can_interface_name_to_yojson = string_to_yojson

let can_interface_to_yojson (x : can_interface) =
  assoc_to_yojson
    [
      ("name", Some (can_interface_name_to_yojson x.name));
      ("protocolName", option_to_yojson protocol_name_to_yojson x.protocol_name);
      ("protocolVersion", option_to_yojson protocol_version_to_yojson x.protocol_version);
    ]

let signal_value_type_to_yojson (x : signal_value_type) =
  match x with INTEGER -> `String "INTEGER" | FLOATING_POINT -> `String "FLOATING_POINT"

let can_signal_name_to_yojson = string_to_yojson
let non_negative_integer_to_yojson = int_to_yojson

let can_signal_to_yojson (x : can_signal) =
  assoc_to_yojson
    [
      ("messageId", Some (non_negative_integer_to_yojson x.message_id));
      ( "isBigEndian",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.is_big_endian) );
      ( "isSigned",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.is_signed) );
      ("startBit", Some (non_negative_integer_to_yojson x.start_bit));
      ("offset", Some (double_to_yojson x.offset));
      ("factor", Some (double_to_yojson x.factor));
      ("length", Some (non_negative_integer_to_yojson x.length));
      ("name", option_to_yojson can_signal_name_to_yojson x.name);
      ("signalValueType", option_to_yojson signal_value_type_to_yojson x.signal_value_type);
    ]

let cloud_watch_log_group_name_to_yojson = string_to_yojson

let log_type_to_yojson (x : log_type) =
  match x with OFF -> `String "OFF" | ERROR -> `String "ERROR"

let cloud_watch_log_delivery_options_to_yojson (x : cloud_watch_log_delivery_options) =
  assoc_to_yojson
    [
      ("logType", Some (log_type_to_yojson x.log_type));
      ("logGroupName", option_to_yojson cloud_watch_log_group_name_to_yojson x.log_group_name);
    ]

let language_version_to_yojson = int_to_yojson

let trigger_mode_to_yojson (x : trigger_mode) =
  match x with ALWAYS -> `String "ALWAYS" | RISING_EDGE -> `String "RISING_EDGE"

let uint32_to_yojson = long_to_yojson
let event_expression_to_yojson = string_to_yojson

let condition_based_collection_scheme_to_yojson (x : condition_based_collection_scheme) =
  assoc_to_yojson
    [
      ("expression", Some (event_expression_to_yojson x.expression));
      ("minimumTriggerIntervalMs", option_to_yojson uint32_to_yojson x.minimum_trigger_interval_ms);
      ("triggerMode", option_to_yojson trigger_mode_to_yojson x.trigger_mode);
      ( "conditionLanguageVersion",
        option_to_yojson language_version_to_yojson x.condition_language_version );
    ]

let collection_period_ms_to_yojson = long_to_yojson

let time_based_collection_scheme_to_yojson (x : time_based_collection_scheme) =
  assoc_to_yojson [ ("periodMs", Some (collection_period_ms_to_yojson x.period_ms)) ]

let collection_scheme_to_yojson (x : collection_scheme) =
  match x with
  | TimeBasedCollectionScheme arg ->
      assoc_to_yojson
        [ ("timeBasedCollectionScheme", Some (time_based_collection_scheme_to_yojson arg)) ]
  | ConditionBasedCollectionScheme arg ->
      assoc_to_yojson
        [
          ("conditionBasedCollectionScheme", Some (condition_based_collection_scheme_to_yojson arg));
        ]

let compression_to_yojson (x : compression) =
  match x with OFF -> `String "OFF" | SNAPPY -> `String "SNAPPY"

let fetch_config_event_expression_to_yojson = string_to_yojson

let condition_based_signal_fetch_config_to_yojson (x : condition_based_signal_fetch_config) =
  assoc_to_yojson
    [
      ("conditionExpression", Some (fetch_config_event_expression_to_yojson x.condition_expression));
      ("triggerMode", Some (trigger_mode_to_yojson x.trigger_mode));
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("message", Some (string__to_yojson x.message));
      ("resource", Some (string__to_yojson x.resource));
      ("resourceType", Some (string__to_yojson x.resource_type));
    ]

let create_campaign_response_to_yojson (x : create_campaign_response) =
  assoc_to_yojson
    [
      ("name", option_to_yojson campaign_name_to_yojson x.name);
      ("arn", option_to_yojson campaign_arn_to_yojson x.arn);
    ]

let action_event_expression_to_yojson = string_to_yojson
let event_expression_list_to_yojson tree = list_to_yojson action_event_expression_to_yojson tree
let positive_long_to_yojson = long_to_yojson

let time_based_signal_fetch_config_to_yojson (x : time_based_signal_fetch_config) =
  assoc_to_yojson
    [ ("executionFrequencyMs", Some (positive_long_to_yojson x.execution_frequency_ms)) ]

let signal_fetch_config_to_yojson (x : signal_fetch_config) =
  match x with
  | TimeBased arg ->
      assoc_to_yojson [ ("timeBased", Some (time_based_signal_fetch_config_to_yojson arg)) ]
  | ConditionBased arg ->
      assoc_to_yojson
        [ ("conditionBased", Some (condition_based_signal_fetch_config_to_yojson arg)) ]

let signal_fetch_information_to_yojson (x : signal_fetch_information) =
  assoc_to_yojson
    [
      ("fullyQualifiedName", Some (node_path_to_yojson x.fully_qualified_name));
      ("signalFetchConfig", Some (signal_fetch_config_to_yojson x.signal_fetch_config));
      ( "conditionLanguageVersion",
        option_to_yojson language_version_to_yojson x.condition_language_version );
      ("actions", Some (event_expression_list_to_yojson x.actions));
    ]

let signal_fetch_information_list_to_yojson tree =
  list_to_yojson signal_fetch_information_to_yojson tree

let data_partition_upload_options_to_yojson (x : data_partition_upload_options) =
  assoc_to_yojson
    [
      ("expression", Some (event_expression_to_yojson x.expression));
      ( "conditionLanguageVersion",
        option_to_yojson language_version_to_yojson x.condition_language_version );
    ]

let storage_minimum_time_to_live_value_to_yojson = int_to_yojson

let storage_minimum_time_to_live_unit_to_yojson (x : storage_minimum_time_to_live_unit) =
  match x with HOURS -> `String "HOURS" | DAYS -> `String "DAYS" | WEEKS -> `String "WEEKS"

let storage_minimum_time_to_live_to_yojson (x : storage_minimum_time_to_live) =
  assoc_to_yojson
    [
      ("unit", Some (storage_minimum_time_to_live_unit_to_yojson x.unit_));
      ("value", Some (storage_minimum_time_to_live_value_to_yojson x.value));
    ]

let storage_location_to_yojson = string_to_yojson
let storage_maximum_size_value_to_yojson = int_to_yojson

let storage_maximum_size_unit_to_yojson (x : storage_maximum_size_unit) =
  match x with MB -> `String "MB" | GB -> `String "GB" | TB -> `String "TB"

let storage_maximum_size_to_yojson (x : storage_maximum_size) =
  assoc_to_yojson
    [
      ("unit", Some (storage_maximum_size_unit_to_yojson x.unit_));
      ("value", Some (storage_maximum_size_value_to_yojson x.value));
    ]

let data_partition_storage_options_to_yojson (x : data_partition_storage_options) =
  assoc_to_yojson
    [
      ("maximumSize", Some (storage_maximum_size_to_yojson x.maximum_size));
      ("storageLocation", Some (storage_location_to_yojson x.storage_location));
      ("minimumTimeToLive", Some (storage_minimum_time_to_live_to_yojson x.minimum_time_to_live));
    ]

let data_partition_id_to_yojson = string_to_yojson

let data_partition_to_yojson (x : data_partition) =
  assoc_to_yojson
    [
      ("id", Some (data_partition_id_to_yojson x.id));
      ("storageOptions", Some (data_partition_storage_options_to_yojson x.storage_options));
      ("uploadOptions", option_to_yojson data_partition_upload_options_to_yojson x.upload_options);
    ]

let data_partitions_to_yojson tree = list_to_yojson data_partition_to_yojson tree
let iam_role_arn_to_yojson = string_to_yojson
let mqtt_topic_arn_to_yojson = string_to_yojson

let mqtt_topic_config_to_yojson (x : mqtt_topic_config) =
  assoc_to_yojson
    [
      ("mqttTopicArn", Some (mqtt_topic_arn_to_yojson x.mqtt_topic_arn));
      ("executionRoleArn", Some (iam_role_arn_to_yojson x.execution_role_arn));
    ]

let timestream_table_arn_to_yojson = string_to_yojson

let timestream_config_to_yojson (x : timestream_config) =
  assoc_to_yojson
    [
      ("timestreamTableArn", Some (timestream_table_arn_to_yojson x.timestream_table_arn));
      ("executionRoleArn", Some (iam_role_arn_to_yojson x.execution_role_arn));
    ]

let prefix_to_yojson = string_to_yojson

let storage_compression_format_to_yojson (x : storage_compression_format) =
  match x with NONE -> `String "NONE" | GZIP -> `String "GZIP"

let data_format_to_yojson (x : data_format) =
  match x with JSON -> `String "JSON" | PARQUET -> `String "PARQUET"

let s3_bucket_arn_to_yojson = string_to_yojson

let s3_config_to_yojson (x : s3_config) =
  assoc_to_yojson
    [
      ("bucketArn", Some (s3_bucket_arn_to_yojson x.bucket_arn));
      ("dataFormat", option_to_yojson data_format_to_yojson x.data_format);
      ( "storageCompressionFormat",
        option_to_yojson storage_compression_format_to_yojson x.storage_compression_format );
      ("prefix", option_to_yojson prefix_to_yojson x.prefix);
    ]

let data_destination_config_to_yojson (x : data_destination_config) =
  match x with
  | S3Config arg -> assoc_to_yojson [ ("s3Config", Some (s3_config_to_yojson arg)) ]
  | TimestreamConfig arg ->
      assoc_to_yojson [ ("timestreamConfig", Some (timestream_config_to_yojson arg)) ]
  | MqttTopicConfig arg ->
      assoc_to_yojson [ ("mqttTopicConfig", Some (mqtt_topic_config_to_yojson arg)) ]

let data_destination_configs_to_yojson tree = list_to_yojson data_destination_config_to_yojson tree
let data_extra_dimension_node_path_list_to_yojson tree = list_to_yojson node_path_to_yojson tree
let max_sample_count_to_yojson = long_to_yojson
let wildcard_signal_name_to_yojson = string_to_yojson

let signal_information_to_yojson (x : signal_information) =
  assoc_to_yojson
    [
      ("name", Some (wildcard_signal_name_to_yojson x.name));
      ("maxSampleCount", option_to_yojson max_sample_count_to_yojson x.max_sample_count);
      ("minimumSamplingIntervalMs", option_to_yojson uint32_to_yojson x.minimum_sampling_interval_ms);
      ("dataPartitionId", option_to_yojson data_partition_id_to_yojson x.data_partition_id);
    ]

let signal_information_list_to_yojson tree = list_to_yojson signal_information_to_yojson tree
let priority_to_yojson = int_to_yojson

let spooling_mode_to_yojson (x : spooling_mode) =
  match x with OFF -> `String "OFF" | TO_DISK -> `String "TO_DISK"

let diagnostics_mode_to_yojson (x : diagnostics_mode) =
  match x with OFF -> `String "OFF" | SEND_ACTIVE_DTCS -> `String "SEND_ACTIVE_DTCS"

let create_campaign_request_to_yojson (x : create_campaign_request) =
  assoc_to_yojson
    [
      ("name", Some (campaign_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("signalCatalogArn", Some (arn_to_yojson x.signal_catalog_arn));
      ("targetArn", Some (arn_to_yojson x.target_arn));
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("expiryTime", option_to_yojson timestamp_to_yojson x.expiry_time);
      ( "postTriggerCollectionDuration",
        option_to_yojson uint32_to_yojson x.post_trigger_collection_duration );
      ("diagnosticsMode", option_to_yojson diagnostics_mode_to_yojson x.diagnostics_mode);
      ("spoolingMode", option_to_yojson spooling_mode_to_yojson x.spooling_mode);
      ("compression", option_to_yojson compression_to_yojson x.compression);
      ("priority", option_to_yojson priority_to_yojson x.priority);
      ("signalsToCollect", option_to_yojson signal_information_list_to_yojson x.signals_to_collect);
      ("collectionScheme", Some (collection_scheme_to_yojson x.collection_scheme));
      ( "dataExtraDimensions",
        option_to_yojson data_extra_dimension_node_path_list_to_yojson x.data_extra_dimensions );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "dataDestinationConfigs",
        option_to_yojson data_destination_configs_to_yojson x.data_destination_configs );
      ("dataPartitions", option_to_yojson data_partitions_to_yojson x.data_partitions);
      ("signalsToFetch", option_to_yojson signal_fetch_information_list_to_yojson x.signals_to_fetch);
    ]

let network_interface_failure_reason_to_yojson (x : network_interface_failure_reason) =
  match x with
  | DUPLICATE_INTERFACE -> `String "DUPLICATE_NETWORK_INTERFACE"
  | CONFLICTING_NETWORK_INTERFACE -> `String "CONFLICTING_NETWORK_INTERFACE"
  | NETWORK_INTERFACE_TO_ADD_ALREADY_EXISTS -> `String "NETWORK_INTERFACE_TO_ADD_ALREADY_EXISTS"
  | CAN_NETWORK_INTERFACE_INFO_IS_NULL -> `String "CAN_NETWORK_INTERFACE_INFO_IS_NULL"
  | OBD_NETWORK_INTERFACE_INFO_IS_NULL -> `String "OBD_NETWORK_INTERFACE_INFO_IS_NULL"
  | NETWORK_INTERFACE_TO_REMOVE_ASSOCIATED_WITH_SIGNALS ->
      `String "NETWORK_INTERFACE_TO_REMOVE_ASSOCIATED_WITH_SIGNALS"
  | VEHICLE_MIDDLEWARE_NETWORK_INTERFACE_INFO_IS_NULL ->
      `String "VEHICLE_MIDDLEWARE_NETWORK_INTERFACE_INFO_IS_NULL"
  | CUSTOM_DECODING_SIGNAL_NETWORK_INTERFACE_INFO_IS_NULL ->
      `String "CUSTOM_DECODING_SIGNAL_NETWORK_INTERFACE_INFO_IS_NULL"

let invalid_network_interface_to_yojson (x : invalid_network_interface) =
  assoc_to_yojson
    [
      ("interfaceId", option_to_yojson interface_id_to_yojson x.interface_id);
      ("reason", option_to_yojson network_interface_failure_reason_to_yojson x.reason);
    ]

let invalid_network_interfaces_to_yojson tree =
  list_to_yojson invalid_network_interface_to_yojson tree

let signal_decoder_failure_reason_to_yojson (x : signal_decoder_failure_reason) =
  match x with
  | DUPLICATE_SIGNAL -> `String "DUPLICATE_SIGNAL"
  | CONFLICTING_SIGNAL -> `String "CONFLICTING_SIGNAL"
  | SIGNAL_TO_ADD_ALREADY_EXISTS -> `String "SIGNAL_TO_ADD_ALREADY_EXISTS"
  | SIGNAL_NOT_ASSOCIATED_WITH_NETWORK_INTERFACE ->
      `String "SIGNAL_NOT_ASSOCIATED_WITH_NETWORK_INTERFACE"
  | NETWORK_INTERFACE_TYPE_INCOMPATIBLE_WITH_SIGNAL_DECODER_TYPE ->
      `String "NETWORK_INTERFACE_TYPE_INCOMPATIBLE_WITH_SIGNAL_DECODER_TYPE"
  | SIGNAL_NOT_IN_MODEL -> `String "SIGNAL_NOT_IN_MODEL"
  | CAN_SIGNAL_INFO_IS_NULL -> `String "CAN_SIGNAL_INFO_IS_NULL"
  | OBD_SIGNAL_INFO_IS_NULL -> `String "OBD_SIGNAL_INFO_IS_NULL"
  | NO_DECODER_INFO_FOR_SIGNAL_IN_MODEL -> `String "NO_DECODER_INFO_FOR_SIGNAL_IN_MODEL"
  | MESSAGE_SIGNAL_INFO_IS_NULL -> `String "MESSAGE_SIGNAL_INFO_IS_NULL"
  | SIGNAL_DECODER_TYPE_INCOMPATIBLE_WITH_MESSAGE_SIGNAL_TYPE ->
      `String "SIGNAL_DECODER_TYPE_INCOMPATIBLE_WITH_MESSAGE_SIGNAL_TYPE"
  | STRUCT_SIZE_MISMATCH -> `String "STRUCT_SIZE_MISMATCH"
  | NO_SIGNAL_IN_CATALOG_FOR_DECODER_SIGNAL -> `String "NO_SIGNAL_IN_CATALOG_FOR_DECODER_SIGNAL"
  | SIGNAL_DECODER_INCOMPATIBLE_WITH_SIGNAL_CATALOG ->
      `String "SIGNAL_DECODER_INCOMPATIBLE_WITH_SIGNAL_CATALOG"
  | EMPTY_MESSAGE_SIGNAL -> `String "EMPTY_MESSAGE_SIGNAL"
  | CUSTOM_DECODING_SIGNAL_INFO_IS_NULL -> `String "CUSTOM_DECODING_SIGNAL_INFO_IS_NULL"

let fully_qualified_name_to_yojson = string_to_yojson

let invalid_signal_decoder_to_yojson (x : invalid_signal_decoder) =
  assoc_to_yojson
    [
      ("name", option_to_yojson fully_qualified_name_to_yojson x.name);
      ("reason", option_to_yojson signal_decoder_failure_reason_to_yojson x.reason);
      ("hint", option_to_yojson message_to_yojson x.hint);
    ]

let invalid_signal_decoders_to_yojson tree = list_to_yojson invalid_signal_decoder_to_yojson tree

let decoder_manifest_validation_exception_to_yojson (x : decoder_manifest_validation_exception) =
  assoc_to_yojson
    [
      ("invalidSignals", option_to_yojson invalid_signal_decoders_to_yojson x.invalid_signals);
      ( "invalidNetworkInterfaces",
        option_to_yojson invalid_network_interfaces_to_yojson x.invalid_network_interfaces );
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let resource_name_to_yojson = string_to_yojson

let create_decoder_manifest_response_to_yojson (x : create_decoder_manifest_response) =
  assoc_to_yojson
    [ ("name", Some (resource_name_to_yojson x.name)); ("arn", Some (arn_to_yojson x.arn)) ]

let default_for_unmapped_signals_type_to_yojson (x : default_for_unmapped_signals_type) =
  match x with CUSTOM_DECODING -> `String "CUSTOM_DECODING"

let custom_decoding_signal_interface_name_to_yojson = string_to_yojson

let custom_decoding_interface_to_yojson (x : custom_decoding_interface) =
  assoc_to_yojson [ ("name", Some (custom_decoding_signal_interface_name_to_yojson x.name)) ]

let vehicle_middleware_protocol_to_yojson (x : vehicle_middleware_protocol) =
  match x with ROS_2 -> `String "ROS_2"

let vehicle_middleware_name_to_yojson = string_to_yojson

let vehicle_middleware_to_yojson (x : vehicle_middleware) =
  assoc_to_yojson
    [
      ("name", Some (vehicle_middleware_name_to_yojson x.name));
      ("protocolName", Some (vehicle_middleware_protocol_to_yojson x.protocol_name));
    ]

let obd_standard_to_yojson = string_to_yojson
let obd_interface_name_to_yojson = string_to_yojson

let obd_interface_to_yojson (x : obd_interface) =
  assoc_to_yojson
    [
      ("name", Some (obd_interface_name_to_yojson x.name));
      ("requestMessageId", Some (non_negative_integer_to_yojson x.request_message_id));
      ("obdStandard", option_to_yojson obd_standard_to_yojson x.obd_standard);
      ( "pidRequestIntervalSeconds",
        option_to_yojson non_negative_integer_to_yojson x.pid_request_interval_seconds );
      ( "dtcRequestIntervalSeconds",
        option_to_yojson non_negative_integer_to_yojson x.dtc_request_interval_seconds );
      ( "useExtendedIds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.use_extended_ids );
      ( "hasTransmissionEcu",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.has_transmission_ecu );
    ]

let network_interface_type_to_yojson (x : network_interface_type) =
  match x with
  | CAN_INTERFACE -> `String "CAN_INTERFACE"
  | OBD_INTERFACE -> `String "OBD_INTERFACE"
  | VEHICLE_MIDDLEWARE -> `String "VEHICLE_MIDDLEWARE"
  | CUSTOM_DECODING_INTERFACE -> `String "CUSTOM_DECODING_INTERFACE"

let network_interface_to_yojson (x : network_interface) =
  assoc_to_yojson
    [
      ("interfaceId", Some (interface_id_to_yojson x.interface_id));
      ("type", Some (network_interface_type_to_yojson x.type_));
      ("canInterface", option_to_yojson can_interface_to_yojson x.can_interface);
      ("obdInterface", option_to_yojson obd_interface_to_yojson x.obd_interface);
      ("vehicleMiddleware", option_to_yojson vehicle_middleware_to_yojson x.vehicle_middleware);
      ( "customDecodingInterface",
        option_to_yojson custom_decoding_interface_to_yojson x.custom_decoding_interface );
    ]

let network_interfaces_to_yojson tree = list_to_yojson network_interface_to_yojson tree
let custom_decoding_id_to_yojson = string_to_yojson

let custom_decoding_signal_to_yojson (x : custom_decoding_signal) =
  assoc_to_yojson [ ("id", Some (custom_decoding_id_to_yojson x.id)) ]

let structure_message_name_to_yojson = string_to_yojson

let structured_message_list_type_to_yojson (x : structured_message_list_type) =
  match x with
  | FIXED_CAPACITY -> `String "FIXED_CAPACITY"
  | DYNAMIC_UNBOUNDED_CAPACITY -> `String "DYNAMIC_UNBOUNDED_CAPACITY"
  | DYNAMIC_BOUNDED_CAPACITY -> `String "DYNAMIC_BOUNDED_CAPACITY"

let max_string_size_to_yojson = long_to_yojson

let ros2_primitive_type_to_yojson (x : ros2_primitive_type) =
  match x with
  | BOOL -> `String "BOOL"
  | BYTE -> `String "BYTE"
  | CHAR -> `String "CHAR"
  | FLOAT32 -> `String "FLOAT32"
  | FLOAT64 -> `String "FLOAT64"
  | INT8 -> `String "INT8"
  | UINT8 -> `String "UINT8"
  | INT16 -> `String "INT16"
  | UINT16 -> `String "UINT16"
  | INT32 -> `String "INT32"
  | UINT32 -> `String "UINT32"
  | INT64 -> `String "INT64"
  | UINT64 -> `String "UINT64"
  | STRING -> `String "STRING"
  | WSTRING -> `String "WSTRING"

let ros2_primitive_message_definition_to_yojson (x : ros2_primitive_message_definition) =
  assoc_to_yojson
    [
      ("primitiveType", Some (ros2_primitive_type_to_yojson x.primitive_type));
      ("offset", option_to_yojson double_to_yojson x.offset);
      ("scaling", option_to_yojson double_to_yojson x.scaling);
      ("upperBound", option_to_yojson max_string_size_to_yojson x.upper_bound);
    ]

let primitive_message_definition_to_yojson (x : primitive_message_definition) =
  match x with
  | Ros2PrimitiveMessageDefinition arg ->
      assoc_to_yojson
        [
          ("ros2PrimitiveMessageDefinition", Some (ros2_primitive_message_definition_to_yojson arg));
        ]

let rec structured_message_list_definition_to_yojson (x : structured_message_list_definition) =
  assoc_to_yojson
    [
      ("name", Some (structure_message_name_to_yojson x.name));
      ("memberType", Some (structured_message_to_yojson x.member_type));
      ("listType", Some (structured_message_list_type_to_yojson x.list_type));
      ("capacity", option_to_yojson non_negative_integer_to_yojson x.capacity);
    ]

and structured_message_field_name_and_data_type_pair_to_yojson
    (x : structured_message_field_name_and_data_type_pair) =
  assoc_to_yojson
    [
      ("fieldName", Some (structure_message_name_to_yojson x.field_name));
      ("dataType", Some (structured_message_to_yojson x.data_type));
    ]

and structured_message_definition_to_yojson tree =
  list_to_yojson structured_message_field_name_and_data_type_pair_to_yojson tree

and structured_message_to_yojson (x : structured_message) =
  match x with
  | PrimitiveMessageDefinition arg ->
      assoc_to_yojson
        [ ("primitiveMessageDefinition", Some (primitive_message_definition_to_yojson arg)) ]
  | StructuredMessageListDefinition arg ->
      assoc_to_yojson
        [
          ( "structuredMessageListDefinition",
            Some (structured_message_list_definition_to_yojson arg) );
        ]
  | StructuredMessageDefinition arg ->
      assoc_to_yojson
        [ ("structuredMessageDefinition", Some (structured_message_definition_to_yojson arg)) ]

let topic_name_to_yojson = string_to_yojson

let message_signal_to_yojson (x : message_signal) =
  assoc_to_yojson
    [
      ("topicName", Some (topic_name_to_yojson x.topic_name));
      ("structuredMessage", Some (structured_message_to_yojson x.structured_message));
    ]

let obd_bitmask_length_to_yojson = int_to_yojson
let obd_byte_length_to_yojson = int_to_yojson

let obd_signal_to_yojson (x : obd_signal) =
  assoc_to_yojson
    [
      ("pidResponseLength", Some (positive_integer_to_yojson x.pid_response_length));
      ("serviceMode", Some (non_negative_integer_to_yojson x.service_mode));
      ("pid", Some (non_negative_integer_to_yojson x.pid));
      ("scaling", Some (double_to_yojson x.scaling));
      ("offset", Some (double_to_yojson x.offset));
      ("startByte", Some (non_negative_integer_to_yojson x.start_byte));
      ("byteLength", Some (obd_byte_length_to_yojson x.byte_length));
      ("bitRightShift", option_to_yojson non_negative_integer_to_yojson x.bit_right_shift);
      ("bitMaskLength", option_to_yojson obd_bitmask_length_to_yojson x.bit_mask_length);
      ( "isSigned",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.is_signed );
      ("signalValueType", option_to_yojson signal_value_type_to_yojson x.signal_value_type);
    ]

let signal_decoder_type_to_yojson (x : signal_decoder_type) =
  match x with
  | CAN_SIGNAL -> `String "CAN_SIGNAL"
  | OBD_SIGNAL -> `String "OBD_SIGNAL"
  | MESSAGE_SIGNAL -> `String "MESSAGE_SIGNAL"
  | CUSTOM_DECODING_SIGNAL -> `String "CUSTOM_DECODING_SIGNAL"

let signal_decoder_to_yojson (x : signal_decoder) =
  assoc_to_yojson
    [
      ("fullyQualifiedName", Some (fully_qualified_name_to_yojson x.fully_qualified_name));
      ("type", Some (signal_decoder_type_to_yojson x.type_));
      ("interfaceId", Some (interface_id_to_yojson x.interface_id));
      ("canSignal", option_to_yojson can_signal_to_yojson x.can_signal);
      ("obdSignal", option_to_yojson obd_signal_to_yojson x.obd_signal);
      ("messageSignal", option_to_yojson message_signal_to_yojson x.message_signal);
      ( "customDecodingSignal",
        option_to_yojson custom_decoding_signal_to_yojson x.custom_decoding_signal );
    ]

let signal_decoders_to_yojson tree = list_to_yojson signal_decoder_to_yojson tree

let create_decoder_manifest_request_to_yojson (x : create_decoder_manifest_request) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("modelManifestArn", Some (arn_to_yojson x.model_manifest_arn));
      ("signalDecoders", option_to_yojson signal_decoders_to_yojson x.signal_decoders);
      ("networkInterfaces", option_to_yojson network_interfaces_to_yojson x.network_interfaces);
      ( "defaultForUnmappedSignals",
        option_to_yojson default_for_unmapped_signals_type_to_yojson x.default_for_unmapped_signals
      );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_fleet_response_to_yojson (x : create_fleet_response) =
  assoc_to_yojson [ ("id", Some (fleet_id_to_yojson x.id)); ("arn", Some (arn_to_yojson x.arn)) ]

let create_fleet_request_to_yojson (x : create_fleet_request) =
  assoc_to_yojson
    [
      ("fleetId", Some (fleet_id_to_yojson x.fleet_id));
      ("description", option_to_yojson description_to_yojson x.description);
      ("signalCatalogArn", Some (arn_to_yojson x.signal_catalog_arn));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let invalid_signal_to_yojson (x : invalid_signal) =
  assoc_to_yojson
    [
      ("name", option_to_yojson fully_qualified_name_to_yojson x.name);
      ("reason", option_to_yojson string__to_yojson x.reason);
    ]

let invalid_signals_to_yojson tree = list_to_yojson invalid_signal_to_yojson tree

let invalid_signals_exception_to_yojson (x : invalid_signals_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("invalidSignals", option_to_yojson invalid_signals_to_yojson x.invalid_signals);
    ]

let create_model_manifest_response_to_yojson (x : create_model_manifest_response) =
  assoc_to_yojson
    [ ("name", Some (resource_name_to_yojson x.name)); ("arn", Some (arn_to_yojson x.arn)) ]

let create_model_manifest_request_to_yojson (x : create_model_manifest_request) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("nodes", Some (list_of_strings_to_yojson x.nodes));
      ("signalCatalogArn", Some (arn_to_yojson x.signal_catalog_arn));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let node_data_encoding_to_yojson (x : node_data_encoding) =
  match x with BINARY -> `String "BINARY" | TYPED -> `String "TYPED"

let custom_property_to_yojson (x : custom_property) =
  assoc_to_yojson
    [
      ("fullyQualifiedName", Some (string__to_yojson x.fully_qualified_name));
      ("dataType", Some (node_data_type_to_yojson x.data_type));
      ("dataEncoding", option_to_yojson node_data_encoding_to_yojson x.data_encoding);
      ("description", option_to_yojson description_to_yojson x.description);
      ("deprecationMessage", option_to_yojson message_to_yojson x.deprecation_message);
      ("comment", option_to_yojson message_to_yojson x.comment);
      ( "structFullyQualifiedName",
        option_to_yojson node_path_to_yojson x.struct_fully_qualified_name );
    ]

let custom_struct_to_yojson (x : custom_struct) =
  assoc_to_yojson
    [
      ("fullyQualifiedName", Some (string__to_yojson x.fully_qualified_name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("deprecationMessage", option_to_yojson message_to_yojson x.deprecation_message);
      ("comment", option_to_yojson message_to_yojson x.comment);
    ]

let sensor_to_yojson (x : sensor) =
  assoc_to_yojson
    [
      ("fullyQualifiedName", Some (string__to_yojson x.fully_qualified_name));
      ("dataType", Some (node_data_type_to_yojson x.data_type));
      ("description", option_to_yojson description_to_yojson x.description);
      ("unit", option_to_yojson string__to_yojson x.unit_);
      ("allowedValues", option_to_yojson list_of_strings_to_yojson x.allowed_values);
      ("min", option_to_yojson double_to_yojson x.min);
      ("max", option_to_yojson double_to_yojson x.max);
      ("deprecationMessage", option_to_yojson message_to_yojson x.deprecation_message);
      ("comment", option_to_yojson message_to_yojson x.comment);
      ( "structFullyQualifiedName",
        option_to_yojson node_path_to_yojson x.struct_fully_qualified_name );
    ]

let node_to_yojson (x : node) =
  match x with
  | Branch arg -> assoc_to_yojson [ ("branch", Some (branch_to_yojson arg)) ]
  | Sensor arg -> assoc_to_yojson [ ("sensor", Some (sensor_to_yojson arg)) ]
  | Actuator arg -> assoc_to_yojson [ ("actuator", Some (actuator_to_yojson arg)) ]
  | Attribute arg -> assoc_to_yojson [ ("attribute", Some (attribute_to_yojson arg)) ]
  | Struct arg -> assoc_to_yojson [ ("struct", Some (custom_struct_to_yojson arg)) ]
  | Property arg -> assoc_to_yojson [ ("property", Some (custom_property_to_yojson arg)) ]

let nodes_to_yojson tree = list_to_yojson node_to_yojson tree

let invalid_node_exception_to_yojson (x : invalid_node_exception) =
  assoc_to_yojson
    [
      ("invalidNodes", option_to_yojson nodes_to_yojson x.invalid_nodes);
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let create_signal_catalog_response_to_yojson (x : create_signal_catalog_response) =
  assoc_to_yojson
    [ ("name", Some (resource_name_to_yojson x.name)); ("arn", Some (arn_to_yojson x.arn)) ]

let create_signal_catalog_request_to_yojson (x : create_signal_catalog_request) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("nodes", option_to_yojson nodes_to_yojson x.nodes);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let resource_unique_id_to_yojson = string_to_yojson

let create_state_template_response_to_yojson (x : create_state_template_response) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("id", option_to_yojson resource_unique_id_to_yojson x.id);
    ]

let state_template_metadata_extra_dimension_node_path_list_to_yojson tree =
  list_to_yojson node_path_to_yojson tree

let state_template_data_extra_dimension_node_path_list_to_yojson tree =
  list_to_yojson node_path_to_yojson tree

let state_template_properties_to_yojson tree = list_to_yojson node_path_to_yojson tree

let create_state_template_request_to_yojson (x : create_state_template_request) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("signalCatalogArn", Some (arn_to_yojson x.signal_catalog_arn));
      ( "stateTemplateProperties",
        Some (state_template_properties_to_yojson x.state_template_properties) );
      ( "dataExtraDimensions",
        option_to_yojson state_template_data_extra_dimension_node_path_list_to_yojson
          x.data_extra_dimensions );
      ( "metadataExtraDimensions",
        option_to_yojson state_template_metadata_extra_dimension_node_path_list_to_yojson
          x.metadata_extra_dimensions );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_vehicle_response_to_yojson (x : create_vehicle_response) =
  assoc_to_yojson
    [
      ("vehicleName", option_to_yojson vehicle_name_to_yojson x.vehicle_name);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("thingArn", option_to_yojson arn_to_yojson x.thing_arn);
    ]

let create_vehicle_request_to_yojson (x : create_vehicle_request) =
  assoc_to_yojson
    [
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
      ("modelManifestArn", Some (arn_to_yojson x.model_manifest_arn));
      ("decoderManifestArn", Some (arn_to_yojson x.decoder_manifest_arn));
      ("attributes", option_to_yojson attributes_map_to_yojson x.attributes);
      ( "associationBehavior",
        option_to_yojson vehicle_association_behavior_to_yojson x.association_behavior );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("stateTemplates", option_to_yojson state_template_associations_to_yojson x.state_templates);
    ]

let manifest_status_to_yojson (x : manifest_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | DRAFT -> `String "DRAFT"
  | INVALID -> `String "INVALID"
  | VALIDATING -> `String "VALIDATING"

let decoder_manifest_summary_to_yojson (x : decoder_manifest_summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("modelManifestArn", option_to_yojson arn_to_yojson x.model_manifest_arn);
      ("description", option_to_yojson description_to_yojson x.description);
      ("status", option_to_yojson manifest_status_to_yojson x.status);
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
      ("message", option_to_yojson message_to_yojson x.message);
    ]

let delete_campaign_response_to_yojson (x : delete_campaign_response) =
  assoc_to_yojson
    [
      ("name", option_to_yojson campaign_name_to_yojson x.name);
      ("arn", option_to_yojson campaign_arn_to_yojson x.arn);
    ]

let delete_campaign_request_to_yojson (x : delete_campaign_request) =
  assoc_to_yojson [ ("name", Some (campaign_name_to_yojson x.name)) ]

let delete_decoder_manifest_response_to_yojson (x : delete_decoder_manifest_response) =
  assoc_to_yojson
    [ ("name", Some (resource_name_to_yojson x.name)); ("arn", Some (arn_to_yojson x.arn)) ]

let delete_decoder_manifest_request_to_yojson (x : delete_decoder_manifest_request) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let delete_fleet_response_to_yojson (x : delete_fleet_response) =
  assoc_to_yojson
    [
      ("id", option_to_yojson fleet_id_to_yojson x.id); ("arn", option_to_yojson arn_to_yojson x.arn);
    ]

let delete_fleet_request_to_yojson (x : delete_fleet_request) =
  assoc_to_yojson [ ("fleetId", Some (fleet_id_to_yojson x.fleet_id)) ]

let delete_model_manifest_response_to_yojson (x : delete_model_manifest_response) =
  assoc_to_yojson
    [ ("name", Some (resource_name_to_yojson x.name)); ("arn", Some (arn_to_yojson x.arn)) ]

let delete_model_manifest_request_to_yojson (x : delete_model_manifest_request) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let delete_signal_catalog_response_to_yojson (x : delete_signal_catalog_response) =
  assoc_to_yojson
    [ ("name", Some (resource_name_to_yojson x.name)); ("arn", Some (arn_to_yojson x.arn)) ]

let delete_signal_catalog_request_to_yojson (x : delete_signal_catalog_request) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let delete_state_template_response_to_yojson (x : delete_state_template_response) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("id", option_to_yojson resource_unique_id_to_yojson x.id);
    ]

let delete_state_template_request_to_yojson (x : delete_state_template_request) =
  assoc_to_yojson [ ("identifier", Some (resource_identifier_to_yojson x.identifier)) ]

let delete_vehicle_response_to_yojson (x : delete_vehicle_response) =
  assoc_to_yojson
    [
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
      ("arn", Some (arn_to_yojson x.arn));
    ]

let delete_vehicle_request_to_yojson (x : delete_vehicle_request) =
  assoc_to_yojson [ ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name)) ]

let disassociate_vehicle_fleet_response_to_yojson = unit_to_yojson

let disassociate_vehicle_fleet_request_to_yojson (x : disassociate_vehicle_fleet_request) =
  assoc_to_yojson
    [
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
      ("fleetId", Some (fleet_id_to_yojson x.fleet_id));
    ]

let encryption_status_to_yojson (x : encryption_status) =
  match x with
  | PENDING -> `String "PENDING"
  | SUCCESS -> `String "SUCCESS"
  | FAILURE -> `String "FAILURE"

let encryption_type_to_yojson (x : encryption_type) =
  match x with
  | KMS_BASED_ENCRYPTION -> `String "KMS_BASED_ENCRYPTION"
  | FLEETWISE_DEFAULT_ENCRYPTION -> `String "FLEETWISE_DEFAULT_ENCRYPTION"

let fleet_summary_to_yojson (x : fleet_summary) =
  assoc_to_yojson
    [
      ("id", Some (fleet_id_to_yojson x.id));
      ("arn", Some (arn_to_yojson x.arn));
      ("description", option_to_yojson description_to_yojson x.description);
      ("signalCatalogArn", Some (arn_to_yojson x.signal_catalog_arn));
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("lastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
    ]

let formatted_vss_to_yojson (x : formatted_vss) =
  match x with
  | VssJson arg ->
      assoc_to_yojson
        [ ("vssJson", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]

let fqns_to_yojson tree = list_to_yojson fully_qualified_name_to_yojson tree

let get_campaign_response_to_yojson (x : get_campaign_response) =
  assoc_to_yojson
    [
      ("name", option_to_yojson campaign_name_to_yojson x.name);
      ("arn", option_to_yojson campaign_arn_to_yojson x.arn);
      ("description", option_to_yojson description_to_yojson x.description);
      ("signalCatalogArn", option_to_yojson arn_to_yojson x.signal_catalog_arn);
      ("targetArn", option_to_yojson arn_to_yojson x.target_arn);
      ("status", option_to_yojson campaign_status_to_yojson x.status);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("expiryTime", option_to_yojson timestamp_to_yojson x.expiry_time);
      ( "postTriggerCollectionDuration",
        option_to_yojson uint32_to_yojson x.post_trigger_collection_duration );
      ("diagnosticsMode", option_to_yojson diagnostics_mode_to_yojson x.diagnostics_mode);
      ("spoolingMode", option_to_yojson spooling_mode_to_yojson x.spooling_mode);
      ("compression", option_to_yojson compression_to_yojson x.compression);
      ("priority", option_to_yojson priority_to_yojson x.priority);
      ("signalsToCollect", option_to_yojson signal_information_list_to_yojson x.signals_to_collect);
      ("collectionScheme", option_to_yojson collection_scheme_to_yojson x.collection_scheme);
      ( "dataExtraDimensions",
        option_to_yojson data_extra_dimension_node_path_list_to_yojson x.data_extra_dimensions );
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("lastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ( "dataDestinationConfigs",
        option_to_yojson data_destination_configs_to_yojson x.data_destination_configs );
      ("dataPartitions", option_to_yojson data_partitions_to_yojson x.data_partitions);
      ("signalsToFetch", option_to_yojson signal_fetch_information_list_to_yojson x.signals_to_fetch);
    ]

let get_campaign_request_to_yojson (x : get_campaign_request) =
  assoc_to_yojson [ ("name", Some (campaign_name_to_yojson x.name)) ]

let get_decoder_manifest_response_to_yojson (x : get_decoder_manifest_response) =
  assoc_to_yojson
    [
      ("name", Some (string__to_yojson x.name));
      ("arn", Some (arn_to_yojson x.arn));
      ("description", option_to_yojson description_to_yojson x.description);
      ("modelManifestArn", option_to_yojson arn_to_yojson x.model_manifest_arn);
      ("status", option_to_yojson manifest_status_to_yojson x.status);
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
      ("message", option_to_yojson message_to_yojson x.message);
    ]

let get_decoder_manifest_request_to_yojson (x : get_decoder_manifest_request) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let error_message_to_yojson = string_to_yojson

let get_encryption_configuration_response_to_yojson (x : get_encryption_configuration_response) =
  assoc_to_yojson
    [
      ( "kmsKeyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id );
      ("encryptionStatus", Some (encryption_status_to_yojson x.encryption_status));
      ("encryptionType", Some (encryption_type_to_yojson x.encryption_type));
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("lastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
    ]

let get_encryption_configuration_request_to_yojson = unit_to_yojson

let get_fleet_response_to_yojson (x : get_fleet_response) =
  assoc_to_yojson
    [
      ("id", Some (fleet_id_to_yojson x.id));
      ("arn", Some (arn_to_yojson x.arn));
      ("description", option_to_yojson description_to_yojson x.description);
      ("signalCatalogArn", Some (arn_to_yojson x.signal_catalog_arn));
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
    ]

let get_fleet_request_to_yojson (x : get_fleet_request) =
  assoc_to_yojson [ ("fleetId", Some (fleet_id_to_yojson x.fleet_id)) ]

let get_logging_options_response_to_yojson (x : get_logging_options_response) =
  assoc_to_yojson
    [
      ( "cloudWatchLogDelivery",
        Some (cloud_watch_log_delivery_options_to_yojson x.cloud_watch_log_delivery) );
    ]

let get_logging_options_request_to_yojson = unit_to_yojson

let get_model_manifest_response_to_yojson (x : get_model_manifest_response) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("arn", Some (arn_to_yojson x.arn));
      ("description", option_to_yojson description_to_yojson x.description);
      ("signalCatalogArn", option_to_yojson arn_to_yojson x.signal_catalog_arn);
      ("status", option_to_yojson manifest_status_to_yojson x.status);
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
    ]

let get_model_manifest_request_to_yojson (x : get_model_manifest_request) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let registration_status_to_yojson (x : registration_status) =
  match x with
  | REGISTRATION_PENDING -> `String "REGISTRATION_PENDING"
  | REGISTRATION_SUCCESS -> `String "REGISTRATION_SUCCESS"
  | REGISTRATION_FAILURE -> `String "REGISTRATION_FAILURE"

let iam_registration_response_to_yojson (x : iam_registration_response) =
  assoc_to_yojson
    [
      ("roleArn", Some (arn_to_yojson x.role_arn));
      ("registrationStatus", Some (registration_status_to_yojson x.registration_status));
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let timestream_table_name_to_yojson = string_to_yojson
let timestream_database_name_to_yojson = string_to_yojson

let timestream_registration_response_to_yojson (x : timestream_registration_response) =
  assoc_to_yojson
    [
      ( "timestreamDatabaseName",
        Some (timestream_database_name_to_yojson x.timestream_database_name) );
      ("timestreamTableName", Some (timestream_table_name_to_yojson x.timestream_table_name));
      ("timestreamDatabaseArn", option_to_yojson arn_to_yojson x.timestream_database_arn);
      ("timestreamTableArn", option_to_yojson arn_to_yojson x.timestream_table_arn);
      ("registrationStatus", Some (registration_status_to_yojson x.registration_status));
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let customer_account_id_to_yojson = string_to_yojson

let get_register_account_status_response_to_yojson (x : get_register_account_status_response) =
  assoc_to_yojson
    [
      ("customerAccountId", Some (customer_account_id_to_yojson x.customer_account_id));
      ("accountStatus", Some (registration_status_to_yojson x.account_status));
      ( "timestreamRegistrationResponse",
        option_to_yojson timestream_registration_response_to_yojson
          x.timestream_registration_response );
      ( "iamRegistrationResponse",
        Some (iam_registration_response_to_yojson x.iam_registration_response) );
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
    ]

let get_register_account_status_request_to_yojson = unit_to_yojson

let node_counts_to_yojson (x : node_counts) =
  assoc_to_yojson
    [
      ("totalNodes", option_to_yojson number_to_yojson x.total_nodes);
      ("totalBranches", option_to_yojson number_to_yojson x.total_branches);
      ("totalSensors", option_to_yojson number_to_yojson x.total_sensors);
      ("totalAttributes", option_to_yojson number_to_yojson x.total_attributes);
      ("totalActuators", option_to_yojson number_to_yojson x.total_actuators);
      ("totalStructs", option_to_yojson number_to_yojson x.total_structs);
      ("totalProperties", option_to_yojson number_to_yojson x.total_properties);
    ]

let get_signal_catalog_response_to_yojson (x : get_signal_catalog_response) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("arn", Some (arn_to_yojson x.arn));
      ("description", option_to_yojson description_to_yojson x.description);
      ("nodeCounts", option_to_yojson node_counts_to_yojson x.node_counts);
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
    ]

let get_signal_catalog_request_to_yojson (x : get_signal_catalog_request) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let get_state_template_response_to_yojson (x : get_state_template_response) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("description", option_to_yojson description_to_yojson x.description);
      ("signalCatalogArn", option_to_yojson arn_to_yojson x.signal_catalog_arn);
      ( "stateTemplateProperties",
        option_to_yojson state_template_properties_to_yojson x.state_template_properties );
      ( "dataExtraDimensions",
        option_to_yojson state_template_data_extra_dimension_node_path_list_to_yojson
          x.data_extra_dimensions );
      ( "metadataExtraDimensions",
        option_to_yojson state_template_metadata_extra_dimension_node_path_list_to_yojson
          x.metadata_extra_dimensions );
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("lastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("id", option_to_yojson resource_unique_id_to_yojson x.id);
    ]

let get_state_template_request_to_yojson (x : get_state_template_request) =
  assoc_to_yojson [ ("identifier", Some (resource_identifier_to_yojson x.identifier)) ]

let get_vehicle_response_to_yojson (x : get_vehicle_response) =
  assoc_to_yojson
    [
      ("vehicleName", option_to_yojson vehicle_name_to_yojson x.vehicle_name);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("modelManifestArn", option_to_yojson arn_to_yojson x.model_manifest_arn);
      ("decoderManifestArn", option_to_yojson arn_to_yojson x.decoder_manifest_arn);
      ("attributes", option_to_yojson attributes_map_to_yojson x.attributes);
      ("stateTemplates", option_to_yojson state_template_associations_to_yojson x.state_templates);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("lastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
    ]

let get_vehicle_request_to_yojson (x : get_vehicle_request) =
  assoc_to_yojson [ ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name)) ]

let next_token_to_yojson = string_to_yojson

let vehicle_state_to_yojson (x : vehicle_state) =
  match x with
  | CREATED -> `String "CREATED"
  | READY -> `String "READY"
  | HEALTHY -> `String "HEALTHY"
  | SUSPENDED -> `String "SUSPENDED"
  | DELETING -> `String "DELETING"
  | READY_FOR_CHECKIN -> `String "READY_FOR_CHECKIN"

let vehicle_status_to_yojson (x : vehicle_status) =
  assoc_to_yojson
    [
      ("campaignName", option_to_yojson campaign_name_to_yojson x.campaign_name);
      ("vehicleName", option_to_yojson vehicle_name_to_yojson x.vehicle_name);
      ("status", option_to_yojson vehicle_state_to_yojson x.status);
    ]

let vehicle_status_list_to_yojson tree = list_to_yojson vehicle_status_to_yojson tree

let get_vehicle_status_response_to_yojson (x : get_vehicle_status_response) =
  assoc_to_yojson
    [
      ("campaigns", option_to_yojson vehicle_status_list_to_yojson x.campaigns);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let get_vehicle_status_request_to_yojson (x : get_vehicle_status_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
    ]

let iam_resources_to_yojson (x : iam_resources) =
  assoc_to_yojson [ ("roleArn", Some (iam_role_arn_to_yojson x.role_arn)) ]

let import_decoder_manifest_response_to_yojson (x : import_decoder_manifest_response) =
  assoc_to_yojson
    [ ("name", Some (resource_name_to_yojson x.name)); ("arn", Some (arn_to_yojson x.arn)) ]

let network_file_definition_to_yojson (x : network_file_definition) =
  match x with
  | CanDbc arg -> assoc_to_yojson [ ("canDbc", Some (can_dbc_definition_to_yojson arg)) ]

let network_file_definitions_to_yojson tree = list_to_yojson network_file_definition_to_yojson tree

let import_decoder_manifest_request_to_yojson (x : import_decoder_manifest_request) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ( "networkFileDefinitions",
        Some (network_file_definitions_to_yojson x.network_file_definitions) );
    ]

let import_signal_catalog_response_to_yojson (x : import_signal_catalog_response) =
  assoc_to_yojson
    [ ("name", Some (resource_name_to_yojson x.name)); ("arn", Some (arn_to_yojson x.arn)) ]

let import_signal_catalog_request_to_yojson (x : import_signal_catalog_request) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("vss", option_to_yojson formatted_vss_to_yojson x.vss);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let interface_ids_to_yojson tree = list_to_yojson interface_id_to_yojson tree
let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let timestream_resources_to_yojson (x : timestream_resources) =
  assoc_to_yojson
    [
      ( "timestreamDatabaseName",
        Some (timestream_database_name_to_yojson x.timestream_database_name) );
      ("timestreamTableName", Some (timestream_table_name_to_yojson x.timestream_table_name));
    ]

let register_account_response_to_yojson (x : register_account_response) =
  assoc_to_yojson
    [
      ("registerAccountStatus", Some (registration_status_to_yojson x.register_account_status));
      ("timestreamResources", option_to_yojson timestream_resources_to_yojson x.timestream_resources);
      ("iamResources", Some (iam_resources_to_yojson x.iam_resources));
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
    ]

let register_account_request_to_yojson (x : register_account_request) =
  assoc_to_yojson
    [
      ("timestreamResources", option_to_yojson timestream_resources_to_yojson x.timestream_resources);
      ("iamResources", option_to_yojson iam_resources_to_yojson x.iam_resources);
    ]

let put_logging_options_response_to_yojson = unit_to_yojson

let put_logging_options_request_to_yojson (x : put_logging_options_request) =
  assoc_to_yojson
    [
      ( "cloudWatchLogDelivery",
        Some (cloud_watch_log_delivery_options_to_yojson x.cloud_watch_log_delivery) );
    ]

let put_encryption_configuration_response_to_yojson (x : put_encryption_configuration_response) =
  assoc_to_yojson
    [
      ( "kmsKeyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id );
      ("encryptionStatus", Some (encryption_status_to_yojson x.encryption_status));
      ("encryptionType", Some (encryption_type_to_yojson x.encryption_type));
    ]

let put_encryption_configuration_request_to_yojson (x : put_encryption_configuration_request) =
  assoc_to_yojson
    [
      ( "kmsKeyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id );
      ("encryptionType", Some (encryption_type_to_yojson x.encryption_type));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let campaign_summaries_to_yojson tree = list_to_yojson campaign_summary_to_yojson tree

let list_campaigns_response_to_yojson (x : list_campaigns_response) =
  assoc_to_yojson
    [
      ("campaignSummaries", option_to_yojson campaign_summaries_to_yojson x.campaign_summaries);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_response_scope_to_yojson (x : list_response_scope) =
  match x with METADATA_ONLY -> `String "METADATA_ONLY"

let status_str_to_yojson = string_to_yojson

let list_campaigns_request_to_yojson (x : list_campaigns_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("status", option_to_yojson status_str_to_yojson x.status);
      ("listResponseScope", option_to_yojson list_response_scope_to_yojson x.list_response_scope);
    ]

let list_decoder_manifest_network_interfaces_response_to_yojson
    (x : list_decoder_manifest_network_interfaces_response) =
  assoc_to_yojson
    [
      ("networkInterfaces", option_to_yojson network_interfaces_to_yojson x.network_interfaces);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_decoder_manifest_network_interfaces_request_to_yojson
    (x : list_decoder_manifest_network_interfaces_request) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_decoder_manifest_signals_response_to_yojson (x : list_decoder_manifest_signals_response) =
  assoc_to_yojson
    [
      ("signalDecoders", option_to_yojson signal_decoders_to_yojson x.signal_decoders);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_decoder_manifest_signals_request_to_yojson (x : list_decoder_manifest_signals_request) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let decoder_manifest_summaries_to_yojson tree =
  list_to_yojson decoder_manifest_summary_to_yojson tree

let list_decoder_manifests_response_to_yojson (x : list_decoder_manifests_response) =
  assoc_to_yojson
    [
      ("summaries", option_to_yojson decoder_manifest_summaries_to_yojson x.summaries);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_decoder_manifests_request_to_yojson (x : list_decoder_manifests_request) =
  assoc_to_yojson
    [
      ("modelManifestArn", option_to_yojson arn_to_yojson x.model_manifest_arn);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("listResponseScope", option_to_yojson list_response_scope_to_yojson x.list_response_scope);
    ]

let fleet_summaries_to_yojson tree = list_to_yojson fleet_summary_to_yojson tree

let list_fleets_response_to_yojson (x : list_fleets_response) =
  assoc_to_yojson
    [
      ("fleetSummaries", option_to_yojson fleet_summaries_to_yojson x.fleet_summaries);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_fleets_request_to_yojson (x : list_fleets_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("listResponseScope", option_to_yojson list_response_scope_to_yojson x.list_response_scope);
    ]

let fleets_to_yojson tree = list_to_yojson fleet_id_to_yojson tree

let list_fleets_for_vehicle_response_to_yojson (x : list_fleets_for_vehicle_response) =
  assoc_to_yojson
    [
      ("fleets", option_to_yojson fleets_to_yojson x.fleets);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_fleets_for_vehicle_request_to_yojson (x : list_fleets_for_vehicle_request) =
  assoc_to_yojson
    [
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_model_manifest_nodes_response_to_yojson (x : list_model_manifest_nodes_response) =
  assoc_to_yojson
    [
      ("nodes", option_to_yojson nodes_to_yojson x.nodes);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_model_manifest_nodes_request_to_yojson (x : list_model_manifest_nodes_request) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let model_manifest_summary_to_yojson (x : model_manifest_summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("signalCatalogArn", option_to_yojson arn_to_yojson x.signal_catalog_arn);
      ("description", option_to_yojson description_to_yojson x.description);
      ("status", option_to_yojson manifest_status_to_yojson x.status);
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
    ]

let model_manifest_summaries_to_yojson tree = list_to_yojson model_manifest_summary_to_yojson tree

let list_model_manifests_response_to_yojson (x : list_model_manifests_response) =
  assoc_to_yojson
    [
      ("summaries", option_to_yojson model_manifest_summaries_to_yojson x.summaries);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_model_manifests_request_to_yojson (x : list_model_manifests_request) =
  assoc_to_yojson
    [
      ("signalCatalogArn", option_to_yojson arn_to_yojson x.signal_catalog_arn);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("listResponseScope", option_to_yojson list_response_scope_to_yojson x.list_response_scope);
    ]

let list_signal_catalog_nodes_response_to_yojson (x : list_signal_catalog_nodes_response) =
  assoc_to_yojson
    [
      ("nodes", option_to_yojson nodes_to_yojson x.nodes);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let signal_node_type_to_yojson (x : signal_node_type) =
  match x with
  | SENSOR -> `String "SENSOR"
  | ACTUATOR -> `String "ACTUATOR"
  | ATTRIBUTE -> `String "ATTRIBUTE"
  | BRANCH -> `String "BRANCH"
  | CUSTOM_STRUCT -> `String "CUSTOM_STRUCT"
  | CUSTOM_PROPERTY -> `String "CUSTOM_PROPERTY"

let list_signal_catalog_nodes_request_to_yojson (x : list_signal_catalog_nodes_request) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("signalNodeType", option_to_yojson signal_node_type_to_yojson x.signal_node_type);
    ]

let signal_catalog_summary_to_yojson (x : signal_catalog_summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("lastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
    ]

let signal_catalog_summaries_to_yojson tree = list_to_yojson signal_catalog_summary_to_yojson tree

let list_signal_catalogs_response_to_yojson (x : list_signal_catalogs_response) =
  assoc_to_yojson
    [
      ("summaries", option_to_yojson signal_catalog_summaries_to_yojson x.summaries);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_signal_catalogs_request_to_yojson (x : list_signal_catalogs_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let state_template_summary_to_yojson (x : state_template_summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("signalCatalogArn", option_to_yojson arn_to_yojson x.signal_catalog_arn);
      ("description", option_to_yojson description_to_yojson x.description);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("lastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("id", option_to_yojson resource_unique_id_to_yojson x.id);
    ]

let state_template_summaries_to_yojson tree = list_to_yojson state_template_summary_to_yojson tree

let list_state_templates_response_to_yojson (x : list_state_templates_response) =
  assoc_to_yojson
    [
      ("summaries", option_to_yojson state_template_summaries_to_yojson x.summaries);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_state_templates_request_to_yojson (x : list_state_templates_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("listResponseScope", option_to_yojson list_response_scope_to_yojson x.list_response_scope);
    ]

let vehicle_summary_to_yojson (x : vehicle_summary) =
  assoc_to_yojson
    [
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
      ("arn", Some (arn_to_yojson x.arn));
      ("modelManifestArn", Some (arn_to_yojson x.model_manifest_arn));
      ("decoderManifestArn", Some (arn_to_yojson x.decoder_manifest_arn));
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
      ("attributes", option_to_yojson attributes_map_to_yojson x.attributes);
    ]

let vehicle_summaries_to_yojson tree = list_to_yojson vehicle_summary_to_yojson tree

let list_vehicles_response_to_yojson (x : list_vehicles_response) =
  assoc_to_yojson
    [
      ("vehicleSummaries", option_to_yojson vehicle_summaries_to_yojson x.vehicle_summaries);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_vehicles_max_results_to_yojson = int_to_yojson
let attribute_values_list_to_yojson tree = list_to_yojson attribute_value_to_yojson tree
let attribute_names_list_to_yojson tree = list_to_yojson attribute_name_to_yojson tree

let list_vehicles_request_to_yojson (x : list_vehicles_request) =
  assoc_to_yojson
    [
      ("modelManifestArn", option_to_yojson arn_to_yojson x.model_manifest_arn);
      ("attributeNames", option_to_yojson attribute_names_list_to_yojson x.attribute_names);
      ("attributeValues", option_to_yojson attribute_values_list_to_yojson x.attribute_values);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson list_vehicles_max_results_to_yojson x.max_results);
      ("listResponseScope", option_to_yojson list_response_scope_to_yojson x.list_response_scope);
    ]

let vehicles_to_yojson tree = list_to_yojson vehicle_name_to_yojson tree

let list_vehicles_in_fleet_response_to_yojson (x : list_vehicles_in_fleet_response) =
  assoc_to_yojson
    [
      ("vehicles", option_to_yojson vehicles_to_yojson x.vehicles);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_vehicles_in_fleet_request_to_yojson (x : list_vehicles_in_fleet_request) =
  assoc_to_yojson
    [
      ("fleetId", Some (fleet_id_to_yojson x.fleet_id));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let node_paths_to_yojson tree = list_to_yojson node_path_to_yojson tree

let update_campaign_response_to_yojson (x : update_campaign_response) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson campaign_arn_to_yojson x.arn);
      ("name", option_to_yojson campaign_name_to_yojson x.name);
      ("status", option_to_yojson campaign_status_to_yojson x.status);
    ]

let update_campaign_action_to_yojson (x : update_campaign_action) =
  match x with
  | APPROVE -> `String "APPROVE"
  | SUSPEND -> `String "SUSPEND"
  | RESUME -> `String "RESUME"
  | UPDATE -> `String "UPDATE"

let update_campaign_request_to_yojson (x : update_campaign_request) =
  assoc_to_yojson
    [
      ("name", Some (campaign_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ( "dataExtraDimensions",
        option_to_yojson data_extra_dimension_node_path_list_to_yojson x.data_extra_dimensions );
      ("action", Some (update_campaign_action_to_yojson x.action));
    ]

let update_decoder_manifest_response_to_yojson (x : update_decoder_manifest_response) =
  assoc_to_yojson
    [ ("name", Some (resource_name_to_yojson x.name)); ("arn", Some (arn_to_yojson x.arn)) ]

let update_decoder_manifest_request_to_yojson (x : update_decoder_manifest_request) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("signalDecodersToAdd", option_to_yojson signal_decoders_to_yojson x.signal_decoders_to_add);
      ( "signalDecodersToUpdate",
        option_to_yojson signal_decoders_to_yojson x.signal_decoders_to_update );
      ("signalDecodersToRemove", option_to_yojson fqns_to_yojson x.signal_decoders_to_remove);
      ( "networkInterfacesToAdd",
        option_to_yojson network_interfaces_to_yojson x.network_interfaces_to_add );
      ( "networkInterfacesToUpdate",
        option_to_yojson network_interfaces_to_yojson x.network_interfaces_to_update );
      ( "networkInterfacesToRemove",
        option_to_yojson interface_ids_to_yojson x.network_interfaces_to_remove );
      ("status", option_to_yojson manifest_status_to_yojson x.status);
      ( "defaultForUnmappedSignals",
        option_to_yojson default_for_unmapped_signals_type_to_yojson x.default_for_unmapped_signals
      );
    ]

let update_fleet_response_to_yojson (x : update_fleet_response) =
  assoc_to_yojson
    [
      ("id", option_to_yojson fleet_id_to_yojson x.id); ("arn", option_to_yojson arn_to_yojson x.arn);
    ]

let update_fleet_request_to_yojson (x : update_fleet_request) =
  assoc_to_yojson
    [
      ("fleetId", Some (fleet_id_to_yojson x.fleet_id));
      ("description", option_to_yojson description_to_yojson x.description);
    ]

let update_model_manifest_response_to_yojson (x : update_model_manifest_response) =
  assoc_to_yojson
    [ ("name", Some (resource_name_to_yojson x.name)); ("arn", Some (arn_to_yojson x.arn)) ]

let update_model_manifest_request_to_yojson (x : update_model_manifest_request) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("nodesToAdd", option_to_yojson node_paths_to_yojson x.nodes_to_add);
      ("nodesToRemove", option_to_yojson node_paths_to_yojson x.nodes_to_remove);
      ("status", option_to_yojson manifest_status_to_yojson x.status);
    ]

let update_signal_catalog_response_to_yojson (x : update_signal_catalog_response) =
  assoc_to_yojson
    [ ("name", Some (resource_name_to_yojson x.name)); ("arn", Some (arn_to_yojson x.arn)) ]

let update_signal_catalog_request_to_yojson (x : update_signal_catalog_request) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("nodesToAdd", option_to_yojson nodes_to_yojson x.nodes_to_add);
      ("nodesToUpdate", option_to_yojson nodes_to_yojson x.nodes_to_update);
      ("nodesToRemove", option_to_yojson node_paths_to_yojson x.nodes_to_remove);
    ]

let update_state_template_response_to_yojson (x : update_state_template_response) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("id", option_to_yojson resource_unique_id_to_yojson x.id);
    ]

let update_state_template_request_to_yojson (x : update_state_template_request) =
  assoc_to_yojson
    [
      ("identifier", Some (resource_identifier_to_yojson x.identifier));
      ("description", option_to_yojson description_to_yojson x.description);
      ( "stateTemplatePropertiesToAdd",
        option_to_yojson state_template_properties_to_yojson x.state_template_properties_to_add );
      ( "stateTemplatePropertiesToRemove",
        option_to_yojson state_template_properties_to_yojson x.state_template_properties_to_remove
      );
      ( "dataExtraDimensions",
        option_to_yojson state_template_data_extra_dimension_node_path_list_to_yojson
          x.data_extra_dimensions );
      ( "metadataExtraDimensions",
        option_to_yojson state_template_metadata_extra_dimension_node_path_list_to_yojson
          x.metadata_extra_dimensions );
    ]

let update_vehicle_response_to_yojson (x : update_vehicle_response) =
  assoc_to_yojson
    [
      ("vehicleName", option_to_yojson vehicle_name_to_yojson x.vehicle_name);
      ("arn", option_to_yojson arn_to_yojson x.arn);
    ]

let update_vehicle_request_to_yojson (x : update_vehicle_request) =
  assoc_to_yojson
    [
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
      ("modelManifestArn", option_to_yojson arn_to_yojson x.model_manifest_arn);
      ("decoderManifestArn", option_to_yojson arn_to_yojson x.decoder_manifest_arn);
      ("attributes", option_to_yojson attributes_map_to_yojson x.attributes);
      ("attributeUpdateMode", option_to_yojson update_mode_to_yojson x.attribute_update_mode);
      ( "stateTemplatesToAdd",
        option_to_yojson state_template_associations_to_yojson x.state_templates_to_add );
      ( "stateTemplatesToRemove",
        option_to_yojson state_template_association_identifiers_to_yojson
          x.state_templates_to_remove );
      ( "stateTemplatesToUpdate",
        option_to_yojson state_template_associations_to_yojson x.state_templates_to_update );
    ]
