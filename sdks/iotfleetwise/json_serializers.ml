open Smaws_Lib.Json.SerializeHelpers
open Types

let wildcard_signal_name_to_yojson = string_to_yojson
let vehicle_name_to_yojson = string_to_yojson
let vehicles_to_yojson tree = list_to_yojson vehicle_name_to_yojson tree
let arn_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let attribute_value_to_yojson = string_to_yojson
let attribute_name_to_yojson = string_to_yojson

let attributes_map_to_yojson tree =
  map_to_yojson attribute_name_to_yojson attribute_value_to_yojson tree

let vehicle_summary_to_yojson (x : vehicle_summary) =
  assoc_to_yojson
    [
      ("attributes", option_to_yojson attributes_map_to_yojson x.attributes);
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("decoderManifestArn", Some (arn_to_yojson x.decoder_manifest_arn));
      ("modelManifestArn", Some (arn_to_yojson x.model_manifest_arn));
      ("arn", Some (arn_to_yojson x.arn));
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
    ]

let vehicle_summaries_to_yojson tree = list_to_yojson vehicle_summary_to_yojson tree

let update_vehicle_response_item_to_yojson (x : update_vehicle_response_item) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("vehicleName", option_to_yojson vehicle_name_to_yojson x.vehicle_name);
    ]

let update_vehicle_response_items_to_yojson tree =
  list_to_yojson update_vehicle_response_item_to_yojson tree

let update_mode_to_yojson (x : update_mode) =
  match x with MERGE -> `String "Merge" | OVERWRITE -> `String "Overwrite"

let resource_identifier_to_yojson = string_to_yojson

let time_unit_to_yojson (x : time_unit) =
  match x with
  | HOUR -> `String "HOUR"
  | MINUTE -> `String "MINUTE"
  | SECOND -> `String "SECOND"
  | MILLISECOND -> `String "MILLISECOND"

let positive_integer_to_yojson = int_to_yojson

let time_period_to_yojson (x : time_period) =
  assoc_to_yojson
    [
      ("value", Some (positive_integer_to_yojson x.value));
      ("unit", Some (time_unit_to_yojson x.unit_));
    ]

let periodic_state_template_update_strategy_to_yojson (x : periodic_state_template_update_strategy)
    =
  assoc_to_yojson
    [ ("stateTemplateUpdateRate", Some (time_period_to_yojson x.state_template_update_rate)) ]

let on_change_state_template_update_strategy_to_yojson = unit_to_yojson

let state_template_update_strategy_to_yojson (x : state_template_update_strategy) =
  match x with
  | OnChange arg ->
      assoc_to_yojson
        [ ("onChange", Some (on_change_state_template_update_strategy_to_yojson arg)) ]
  | Periodic arg ->
      assoc_to_yojson [ ("periodic", Some (periodic_state_template_update_strategy_to_yojson arg)) ]

let state_template_association_to_yojson (x : state_template_association) =
  assoc_to_yojson
    [
      ( "stateTemplateUpdateStrategy",
        Some (state_template_update_strategy_to_yojson x.state_template_update_strategy) );
      ("identifier", Some (resource_identifier_to_yojson x.identifier));
    ]

let state_template_associations_to_yojson tree =
  list_to_yojson state_template_association_to_yojson tree

let state_template_association_identifiers_to_yojson tree =
  list_to_yojson resource_identifier_to_yojson tree

let update_vehicle_request_item_to_yojson (x : update_vehicle_request_item) =
  assoc_to_yojson
    [
      ( "stateTemplatesToUpdate",
        option_to_yojson state_template_associations_to_yojson x.state_templates_to_update );
      ( "stateTemplatesToRemove",
        option_to_yojson state_template_association_identifiers_to_yojson
          x.state_templates_to_remove );
      ( "stateTemplatesToAdd",
        option_to_yojson state_template_associations_to_yojson x.state_templates_to_add );
      ("attributeUpdateMode", option_to_yojson update_mode_to_yojson x.attribute_update_mode);
      ("attributes", option_to_yojson attributes_map_to_yojson x.attributes);
      ("decoderManifestArn", option_to_yojson arn_to_yojson x.decoder_manifest_arn);
      ("modelManifestArn", option_to_yojson arn_to_yojson x.model_manifest_arn);
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
    ]

let update_vehicle_request_items_to_yojson tree =
  list_to_yojson update_vehicle_request_item_to_yojson tree

let number_to_yojson = int_to_yojson
let string__to_yojson = string_to_yojson

let update_vehicle_error_to_yojson (x : update_vehicle_error) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("code", option_to_yojson number_to_yojson x.code);
      ("vehicleName", option_to_yojson vehicle_name_to_yojson x.vehicle_name);
    ]

let update_vehicle_errors_to_yojson tree = list_to_yojson update_vehicle_error_to_yojson tree
let uint32_to_yojson = long_to_yojson
let status_str_to_yojson = string_to_yojson

let signal_catalog_summary_to_yojson (x : signal_catalog_summary) =
  assoc_to_yojson
    [
      ("lastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let signal_catalog_summaries_to_yojson tree = list_to_yojson signal_catalog_summary_to_yojson tree
let resource_name_to_yojson = string_to_yojson
let priority_to_yojson = int_to_yojson
let positive_long_to_yojson = long_to_yojson
let non_negative_integer_to_yojson = int_to_yojson
let next_token_to_yojson = string_to_yojson
let description_to_yojson = string_to_yojson

let manifest_status_to_yojson (x : manifest_status) =
  match x with
  | VALIDATING -> `String "VALIDATING"
  | INVALID -> `String "INVALID"
  | DRAFT -> `String "DRAFT"
  | ACTIVE -> `String "ACTIVE"

let model_manifest_summary_to_yojson (x : model_manifest_summary) =
  assoc_to_yojson
    [
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("status", option_to_yojson manifest_status_to_yojson x.status);
      ("description", option_to_yojson description_to_yojson x.description);
      ("signalCatalogArn", option_to_yojson arn_to_yojson x.signal_catalog_arn);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let model_manifest_summaries_to_yojson tree = list_to_yojson model_manifest_summary_to_yojson tree
let message_to_yojson = string_to_yojson
let max_string_size_to_yojson = long_to_yojson
let max_sample_count_to_yojson = long_to_yojson
let max_results_to_yojson = int_to_yojson
let list_vehicles_max_results_to_yojson = int_to_yojson
let list_of_strings_to_yojson tree = list_to_yojson string__to_yojson tree
let language_version_to_yojson = int_to_yojson
let fleet_id_to_yojson = string_to_yojson
let fleets_to_yojson tree = list_to_yojson fleet_id_to_yojson tree

let fleet_summary_to_yojson (x : fleet_summary) =
  assoc_to_yojson
    [
      ("lastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("signalCatalogArn", Some (arn_to_yojson x.signal_catalog_arn));
      ("description", option_to_yojson description_to_yojson x.description);
      ("arn", Some (arn_to_yojson x.arn));
      ("id", Some (fleet_id_to_yojson x.id));
    ]

let fleet_summaries_to_yojson tree = list_to_yojson fleet_summary_to_yojson tree
let fetch_config_event_expression_to_yojson = string_to_yojson
let event_expression_to_yojson = string_to_yojson
let error_message_to_yojson = string_to_yojson
let double_to_yojson = double_to_yojson

let decoder_manifest_summary_to_yojson (x : decoder_manifest_summary) =
  assoc_to_yojson
    [
      ("message", option_to_yojson message_to_yojson x.message);
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("status", option_to_yojson manifest_status_to_yojson x.status);
      ("description", option_to_yojson description_to_yojson x.description);
      ("modelManifestArn", option_to_yojson arn_to_yojson x.model_manifest_arn);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let decoder_manifest_summaries_to_yojson tree =
  list_to_yojson decoder_manifest_summary_to_yojson tree

let customer_account_id_to_yojson = string_to_yojson

let create_vehicle_response_item_to_yojson (x : create_vehicle_response_item) =
  assoc_to_yojson
    [
      ("thingArn", option_to_yojson arn_to_yojson x.thing_arn);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("vehicleName", option_to_yojson vehicle_name_to_yojson x.vehicle_name);
    ]

let create_vehicle_responses_to_yojson tree =
  list_to_yojson create_vehicle_response_item_to_yojson tree

let vehicle_association_behavior_to_yojson (x : vehicle_association_behavior) =
  match x with
  | VALIDATE_IOT_THING_EXISTS -> `String "ValidateIotThingExists"
  | CREATE_IOT_THING -> `String "CreateIotThing"

let tag_key_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let create_vehicle_request_item_to_yojson (x : create_vehicle_request_item) =
  assoc_to_yojson
    [
      ("stateTemplates", option_to_yojson state_template_associations_to_yojson x.state_templates);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "associationBehavior",
        option_to_yojson vehicle_association_behavior_to_yojson x.association_behavior );
      ("attributes", option_to_yojson attributes_map_to_yojson x.attributes);
      ("decoderManifestArn", Some (arn_to_yojson x.decoder_manifest_arn));
      ("modelManifestArn", Some (arn_to_yojson x.model_manifest_arn));
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
    ]

let create_vehicle_request_items_to_yojson tree =
  list_to_yojson create_vehicle_request_item_to_yojson tree

let create_vehicle_error_to_yojson (x : create_vehicle_error) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("code", option_to_yojson string__to_yojson x.code);
      ("vehicleName", option_to_yojson vehicle_name_to_yojson x.vehicle_name);
    ]

let create_vehicle_errors_to_yojson tree = list_to_yojson create_vehicle_error_to_yojson tree
let collection_period_ms_to_yojson = long_to_yojson
let campaign_arn_to_yojson = string_to_yojson
let campaign_name_to_yojson = string_to_yojson

let campaign_status_to_yojson (x : campaign_status) =
  match x with
  | SUSPENDED -> `String "SUSPENDED"
  | RUNNING -> `String "RUNNING"
  | WAITING_FOR_APPROVAL -> `String "WAITING_FOR_APPROVAL"
  | CREATING -> `String "CREATING"

let campaign_summary_to_yojson (x : campaign_summary) =
  assoc_to_yojson
    [
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("status", option_to_yojson campaign_status_to_yojson x.status);
      ("targetArn", option_to_yojson arn_to_yojson x.target_arn);
      ("signalCatalogArn", option_to_yojson arn_to_yojson x.signal_catalog_arn);
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", option_to_yojson campaign_name_to_yojson x.name);
      ("arn", option_to_yojson campaign_arn_to_yojson x.arn);
    ]

let campaign_summaries_to_yojson tree = list_to_yojson campaign_summary_to_yojson tree
let attribute_values_list_to_yojson tree = list_to_yojson attribute_value_to_yojson tree
let attribute_names_list_to_yojson tree = list_to_yojson attribute_name_to_yojson tree
let action_event_expression_to_yojson = string_to_yojson

let vehicle_state_to_yojson (x : vehicle_state) =
  match x with
  | READY_FOR_CHECKIN -> `String "READY_FOR_CHECKIN"
  | DELETING -> `String "DELETING"
  | SUSPENDED -> `String "SUSPENDED"
  | HEALTHY -> `String "HEALTHY"
  | READY -> `String "READY"
  | CREATED -> `String "CREATED"

let vehicle_status_to_yojson (x : vehicle_status) =
  assoc_to_yojson
    [
      ("status", option_to_yojson vehicle_state_to_yojson x.status);
      ("vehicleName", option_to_yojson vehicle_name_to_yojson x.vehicle_name);
      ("campaignName", option_to_yojson campaign_name_to_yojson x.campaign_name);
    ]

let vehicle_status_list_to_yojson tree = list_to_yojson vehicle_status_to_yojson tree

let vehicle_middleware_protocol_to_yojson (x : vehicle_middleware_protocol) =
  match x with ROS_2 -> `String "ROS_2"

let vehicle_middleware_name_to_yojson = string_to_yojson

let vehicle_middleware_to_yojson (x : vehicle_middleware) =
  assoc_to_yojson
    [
      ("protocolName", Some (vehicle_middleware_protocol_to_yojson x.protocol_name));
      ("name", Some (vehicle_middleware_name_to_yojson x.name));
    ]

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | OTHER -> `String "other"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | CANNOT_PARSE -> `String "cannotParse"
  | UNKNOWN_OPERATION -> `String "unknownOperation"

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("fieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
      ("reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("message", Some (string__to_yojson x.message));
    ]

let update_vehicle_response_to_yojson (x : update_vehicle_response) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("vehicleName", option_to_yojson vehicle_name_to_yojson x.vehicle_name);
    ]

let update_vehicle_request_to_yojson (x : update_vehicle_request) =
  assoc_to_yojson
    [
      ( "stateTemplatesToUpdate",
        option_to_yojson state_template_associations_to_yojson x.state_templates_to_update );
      ( "stateTemplatesToRemove",
        option_to_yojson state_template_association_identifiers_to_yojson
          x.state_templates_to_remove );
      ( "stateTemplatesToAdd",
        option_to_yojson state_template_associations_to_yojson x.state_templates_to_add );
      ("attributeUpdateMode", option_to_yojson update_mode_to_yojson x.attribute_update_mode);
      ("attributes", option_to_yojson attributes_map_to_yojson x.attributes);
      ("decoderManifestArn", option_to_yojson arn_to_yojson x.decoder_manifest_arn);
      ("modelManifestArn", option_to_yojson arn_to_yojson x.model_manifest_arn);
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
    ]

let retry_after_seconds_to_yojson = int_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("retryAfterSeconds", option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds);
      ("serviceCode", option_to_yojson string__to_yojson x.service_code);
      ("quotaCode", option_to_yojson string__to_yojson x.quota_code);
      ("message", Some (string__to_yojson x.message));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("resourceType", Some (string__to_yojson x.resource_type));
      ("resourceId", Some (string__to_yojson x.resource_id));
      ("message", Some (string__to_yojson x.message));
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("resourceType", Some (string__to_yojson x.resource_type));
      ("resourceId", Some (string__to_yojson x.resource_id));
      ("message", Some (string__to_yojson x.message));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("retryAfterSeconds", option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds);
      ("message", Some (string__to_yojson x.message));
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("resourceType", Some (string__to_yojson x.resource_type));
      ("resource", Some (string__to_yojson x.resource));
      ("message", Some (string__to_yojson x.message));
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", Some (string__to_yojson x.message)) ]

let resource_unique_id_to_yojson = string_to_yojson

let update_state_template_response_to_yojson (x : update_state_template_response) =
  assoc_to_yojson
    [
      ("id", option_to_yojson resource_unique_id_to_yojson x.id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("name", option_to_yojson resource_name_to_yojson x.name);
    ]

let node_path_to_yojson = string_to_yojson
let state_template_properties_to_yojson tree = list_to_yojson node_path_to_yojson tree

let state_template_data_extra_dimension_node_path_list_to_yojson tree =
  list_to_yojson node_path_to_yojson tree

let state_template_metadata_extra_dimension_node_path_list_to_yojson tree =
  list_to_yojson node_path_to_yojson tree

let update_state_template_request_to_yojson (x : update_state_template_request) =
  assoc_to_yojson
    [
      ( "metadataExtraDimensions",
        option_to_yojson state_template_metadata_extra_dimension_node_path_list_to_yojson
          x.metadata_extra_dimensions );
      ( "dataExtraDimensions",
        option_to_yojson state_template_data_extra_dimension_node_path_list_to_yojson
          x.data_extra_dimensions );
      ( "stateTemplatePropertiesToRemove",
        option_to_yojson state_template_properties_to_yojson x.state_template_properties_to_remove
      );
      ( "stateTemplatePropertiesToAdd",
        option_to_yojson state_template_properties_to_yojson x.state_template_properties_to_add );
      ("description", option_to_yojson description_to_yojson x.description);
      ("identifier", Some (resource_identifier_to_yojson x.identifier));
    ]

let fully_qualified_name_to_yojson = string_to_yojson

let invalid_signal_to_yojson (x : invalid_signal) =
  assoc_to_yojson
    [
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("name", option_to_yojson fully_qualified_name_to_yojson x.name);
    ]

let invalid_signals_to_yojson tree = list_to_yojson invalid_signal_to_yojson tree

let invalid_signals_exception_to_yojson (x : invalid_signals_exception) =
  assoc_to_yojson
    [
      ("invalidSignals", option_to_yojson invalid_signals_to_yojson x.invalid_signals);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let update_signal_catalog_response_to_yojson (x : update_signal_catalog_response) =
  assoc_to_yojson
    [ ("arn", Some (arn_to_yojson x.arn)); ("name", Some (resource_name_to_yojson x.name)) ]

let branch_to_yojson (x : branch) =
  assoc_to_yojson
    [
      ("comment", option_to_yojson message_to_yojson x.comment);
      ("deprecationMessage", option_to_yojson message_to_yojson x.deprecation_message);
      ("description", option_to_yojson description_to_yojson x.description);
      ("fullyQualifiedName", Some (string__to_yojson x.fully_qualified_name));
    ]

let node_data_type_to_yojson (x : node_data_type) =
  match x with
  | STRUCT_ARRAY -> `String "STRUCT_ARRAY"
  | STRUCT -> `String "STRUCT"
  | UNKNOWN -> `String "UNKNOWN"
  | UNIX_TIMESTAMP_ARRAY -> `String "UNIX_TIMESTAMP_ARRAY"
  | STRING_ARRAY -> `String "STRING_ARRAY"
  | DOUBLE_ARRAY -> `String "DOUBLE_ARRAY"
  | FLOAT_ARRAY -> `String "FLOAT_ARRAY"
  | BOOLEAN_ARRAY -> `String "BOOLEAN_ARRAY"
  | UINT64_ARRAY -> `String "UINT64_ARRAY"
  | INT64_ARRAY -> `String "INT64_ARRAY"
  | UINT32_ARRAY -> `String "UINT32_ARRAY"
  | INT32_ARRAY -> `String "INT32_ARRAY"
  | UINT16_ARRAY -> `String "UINT16_ARRAY"
  | INT16_ARRAY -> `String "INT16_ARRAY"
  | UINT8_ARRAY -> `String "UINT8_ARRAY"
  | INT8_ARRAY -> `String "INT8_ARRAY"
  | UNIX_TIMESTAMP -> `String "UNIX_TIMESTAMP"
  | STRING -> `String "STRING"
  | DOUBLE -> `String "DOUBLE"
  | FLOAT -> `String "FLOAT"
  | BOOLEAN -> `String "BOOLEAN"
  | UINT64 -> `String "UINT64"
  | INT64 -> `String "INT64"
  | UINT32 -> `String "UINT32"
  | INT32 -> `String "INT32"
  | UINT16 -> `String "UINT16"
  | INT16 -> `String "INT16"
  | UINT8 -> `String "UINT8"
  | INT8 -> `String "INT8"

let sensor_to_yojson (x : sensor) =
  assoc_to_yojson
    [
      ( "structFullyQualifiedName",
        option_to_yojson node_path_to_yojson x.struct_fully_qualified_name );
      ("comment", option_to_yojson message_to_yojson x.comment);
      ("deprecationMessage", option_to_yojson message_to_yojson x.deprecation_message);
      ("max", option_to_yojson double_to_yojson x.max);
      ("min", option_to_yojson double_to_yojson x.min);
      ("allowedValues", option_to_yojson list_of_strings_to_yojson x.allowed_values);
      ("unit", option_to_yojson string__to_yojson x.unit_);
      ("description", option_to_yojson description_to_yojson x.description);
      ("dataType", Some (node_data_type_to_yojson x.data_type));
      ("fullyQualifiedName", Some (string__to_yojson x.fully_qualified_name));
    ]

let actuator_to_yojson (x : actuator) =
  assoc_to_yojson
    [
      ( "structFullyQualifiedName",
        option_to_yojson node_path_to_yojson x.struct_fully_qualified_name );
      ("comment", option_to_yojson message_to_yojson x.comment);
      ("deprecationMessage", option_to_yojson message_to_yojson x.deprecation_message);
      ("assignedValue", option_to_yojson string__to_yojson x.assigned_value);
      ("max", option_to_yojson double_to_yojson x.max);
      ("min", option_to_yojson double_to_yojson x.min);
      ("allowedValues", option_to_yojson list_of_strings_to_yojson x.allowed_values);
      ("unit", option_to_yojson string__to_yojson x.unit_);
      ("description", option_to_yojson description_to_yojson x.description);
      ("dataType", Some (node_data_type_to_yojson x.data_type));
      ("fullyQualifiedName", Some (string__to_yojson x.fully_qualified_name));
    ]

let attribute_to_yojson (x : attribute) =
  assoc_to_yojson
    [
      ("comment", option_to_yojson message_to_yojson x.comment);
      ("deprecationMessage", option_to_yojson message_to_yojson x.deprecation_message);
      ("defaultValue", option_to_yojson string__to_yojson x.default_value);
      ("assignedValue", option_to_yojson string__to_yojson x.assigned_value);
      ("max", option_to_yojson double_to_yojson x.max);
      ("min", option_to_yojson double_to_yojson x.min);
      ("allowedValues", option_to_yojson list_of_strings_to_yojson x.allowed_values);
      ("unit", option_to_yojson string__to_yojson x.unit_);
      ("description", option_to_yojson description_to_yojson x.description);
      ("dataType", Some (node_data_type_to_yojson x.data_type));
      ("fullyQualifiedName", Some (string__to_yojson x.fully_qualified_name));
    ]

let custom_struct_to_yojson (x : custom_struct) =
  assoc_to_yojson
    [
      ("comment", option_to_yojson message_to_yojson x.comment);
      ("deprecationMessage", option_to_yojson message_to_yojson x.deprecation_message);
      ("description", option_to_yojson description_to_yojson x.description);
      ("fullyQualifiedName", Some (string__to_yojson x.fully_qualified_name));
    ]

let node_data_encoding_to_yojson (x : node_data_encoding) =
  match x with TYPED -> `String "TYPED" | BINARY -> `String "BINARY"

let custom_property_to_yojson (x : custom_property) =
  assoc_to_yojson
    [
      ( "structFullyQualifiedName",
        option_to_yojson node_path_to_yojson x.struct_fully_qualified_name );
      ("comment", option_to_yojson message_to_yojson x.comment);
      ("deprecationMessage", option_to_yojson message_to_yojson x.deprecation_message);
      ("description", option_to_yojson description_to_yojson x.description);
      ("dataEncoding", option_to_yojson node_data_encoding_to_yojson x.data_encoding);
      ("dataType", Some (node_data_type_to_yojson x.data_type));
      ("fullyQualifiedName", Some (string__to_yojson x.fully_qualified_name));
    ]

let node_to_yojson (x : node) =
  match x with
  | Property arg -> assoc_to_yojson [ ("property", Some (custom_property_to_yojson arg)) ]
  | Struct arg -> assoc_to_yojson [ ("struct", Some (custom_struct_to_yojson arg)) ]
  | Attribute arg -> assoc_to_yojson [ ("attribute", Some (attribute_to_yojson arg)) ]
  | Actuator arg -> assoc_to_yojson [ ("actuator", Some (actuator_to_yojson arg)) ]
  | Sensor arg -> assoc_to_yojson [ ("sensor", Some (sensor_to_yojson arg)) ]
  | Branch arg -> assoc_to_yojson [ ("branch", Some (branch_to_yojson arg)) ]

let nodes_to_yojson tree = list_to_yojson node_to_yojson tree
let node_paths_to_yojson tree = list_to_yojson node_path_to_yojson tree

let update_signal_catalog_request_to_yojson (x : update_signal_catalog_request) =
  assoc_to_yojson
    [
      ("nodesToRemove", option_to_yojson node_paths_to_yojson x.nodes_to_remove);
      ("nodesToUpdate", option_to_yojson nodes_to_yojson x.nodes_to_update);
      ("nodesToAdd", option_to_yojson nodes_to_yojson x.nodes_to_add);
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", Some (resource_name_to_yojson x.name));
    ]

let invalid_node_exception_to_yojson (x : invalid_node_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("invalidNodes", option_to_yojson nodes_to_yojson x.invalid_nodes);
    ]

let update_model_manifest_response_to_yojson (x : update_model_manifest_response) =
  assoc_to_yojson
    [ ("arn", Some (arn_to_yojson x.arn)); ("name", Some (resource_name_to_yojson x.name)) ]

let update_model_manifest_request_to_yojson (x : update_model_manifest_request) =
  assoc_to_yojson
    [
      ("status", option_to_yojson manifest_status_to_yojson x.status);
      ("nodesToRemove", option_to_yojson node_paths_to_yojson x.nodes_to_remove);
      ("nodesToAdd", option_to_yojson node_paths_to_yojson x.nodes_to_add);
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", Some (resource_name_to_yojson x.name));
    ]

let update_fleet_response_to_yojson (x : update_fleet_response) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson arn_to_yojson x.arn); ("id", option_to_yojson fleet_id_to_yojson x.id);
    ]

let update_fleet_request_to_yojson (x : update_fleet_request) =
  assoc_to_yojson
    [
      ("description", option_to_yojson description_to_yojson x.description);
      ("fleetId", Some (fleet_id_to_yojson x.fleet_id));
    ]

let update_decoder_manifest_response_to_yojson (x : update_decoder_manifest_response) =
  assoc_to_yojson
    [ ("arn", Some (arn_to_yojson x.arn)); ("name", Some (resource_name_to_yojson x.name)) ]

let signal_decoder_type_to_yojson (x : signal_decoder_type) =
  match x with
  | CUSTOM_DECODING_SIGNAL -> `String "CUSTOM_DECODING_SIGNAL"
  | MESSAGE_SIGNAL -> `String "MESSAGE_SIGNAL"
  | OBD_SIGNAL -> `String "OBD_SIGNAL"
  | CAN_SIGNAL -> `String "CAN_SIGNAL"

let interface_id_to_yojson = string_to_yojson
let can_signal_name_to_yojson = string_to_yojson

let signal_value_type_to_yojson (x : signal_value_type) =
  match x with FLOATING_POINT -> `String "FLOATING_POINT" | INTEGER -> `String "INTEGER"

let can_signal_to_yojson (x : can_signal) =
  assoc_to_yojson
    [
      ("signalValueType", option_to_yojson signal_value_type_to_yojson x.signal_value_type);
      ("name", option_to_yojson can_signal_name_to_yojson x.name);
      ("length", Some (non_negative_integer_to_yojson x.length));
      ("factor", Some (double_to_yojson x.factor));
      ("offset", Some (double_to_yojson x.offset));
      ("startBit", Some (non_negative_integer_to_yojson x.start_bit));
      ( "isSigned",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.is_signed) );
      ( "isBigEndian",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.is_big_endian) );
      ("messageId", Some (non_negative_integer_to_yojson x.message_id));
    ]

let obd_byte_length_to_yojson = int_to_yojson
let obd_bitmask_length_to_yojson = int_to_yojson

let obd_signal_to_yojson (x : obd_signal) =
  assoc_to_yojson
    [
      ("signalValueType", option_to_yojson signal_value_type_to_yojson x.signal_value_type);
      ( "isSigned",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.is_signed );
      ("bitMaskLength", option_to_yojson obd_bitmask_length_to_yojson x.bit_mask_length);
      ("bitRightShift", option_to_yojson non_negative_integer_to_yojson x.bit_right_shift);
      ("byteLength", Some (obd_byte_length_to_yojson x.byte_length));
      ("startByte", Some (non_negative_integer_to_yojson x.start_byte));
      ("offset", Some (double_to_yojson x.offset));
      ("scaling", Some (double_to_yojson x.scaling));
      ("pid", Some (non_negative_integer_to_yojson x.pid));
      ("serviceMode", Some (non_negative_integer_to_yojson x.service_mode));
      ("pidResponseLength", Some (positive_integer_to_yojson x.pid_response_length));
    ]

let topic_name_to_yojson = string_to_yojson

let ros2_primitive_type_to_yojson (x : ros2_primitive_type) =
  match x with
  | WSTRING -> `String "WSTRING"
  | STRING -> `String "STRING"
  | UINT64 -> `String "UINT64"
  | INT64 -> `String "INT64"
  | UINT32 -> `String "UINT32"
  | INT32 -> `String "INT32"
  | UINT16 -> `String "UINT16"
  | INT16 -> `String "INT16"
  | UINT8 -> `String "UINT8"
  | INT8 -> `String "INT8"
  | FLOAT64 -> `String "FLOAT64"
  | FLOAT32 -> `String "FLOAT32"
  | CHAR -> `String "CHAR"
  | BYTE -> `String "BYTE"
  | BOOL -> `String "BOOL"

let ros2_primitive_message_definition_to_yojson (x : ros2_primitive_message_definition) =
  assoc_to_yojson
    [
      ("upperBound", option_to_yojson max_string_size_to_yojson x.upper_bound);
      ("scaling", option_to_yojson double_to_yojson x.scaling);
      ("offset", option_to_yojson double_to_yojson x.offset);
      ("primitiveType", Some (ros2_primitive_type_to_yojson x.primitive_type));
    ]

let primitive_message_definition_to_yojson (x : primitive_message_definition) =
  match x with
  | Ros2PrimitiveMessageDefinition arg ->
      assoc_to_yojson
        [
          ("ros2PrimitiveMessageDefinition", Some (ros2_primitive_message_definition_to_yojson arg));
        ]

let structure_message_name_to_yojson = string_to_yojson

let structured_message_list_type_to_yojson (x : structured_message_list_type) =
  match x with
  | DYNAMIC_BOUNDED_CAPACITY -> `String "DYNAMIC_BOUNDED_CAPACITY"
  | DYNAMIC_UNBOUNDED_CAPACITY -> `String "DYNAMIC_UNBOUNDED_CAPACITY"
  | FIXED_CAPACITY -> `String "FIXED_CAPACITY"

let rec structured_message_to_yojson (x : structured_message) =
  match x with
  | StructuredMessageDefinition arg ->
      assoc_to_yojson
        [ ("structuredMessageDefinition", Some (structured_message_definition_to_yojson arg)) ]
  | StructuredMessageListDefinition arg ->
      assoc_to_yojson
        [
          ( "structuredMessageListDefinition",
            Some (structured_message_list_definition_to_yojson arg) );
        ]
  | PrimitiveMessageDefinition arg ->
      assoc_to_yojson
        [ ("primitiveMessageDefinition", Some (primitive_message_definition_to_yojson arg)) ]

and structured_message_definition_to_yojson tree =
  list_to_yojson structured_message_field_name_and_data_type_pair_to_yojson tree

and structured_message_field_name_and_data_type_pair_to_yojson
    (x : structured_message_field_name_and_data_type_pair) =
  assoc_to_yojson
    [
      ("dataType", Some (structured_message_to_yojson x.data_type));
      ("fieldName", Some (structure_message_name_to_yojson x.field_name));
    ]

and structured_message_list_definition_to_yojson (x : structured_message_list_definition) =
  assoc_to_yojson
    [
      ("capacity", option_to_yojson non_negative_integer_to_yojson x.capacity);
      ("listType", Some (structured_message_list_type_to_yojson x.list_type));
      ("memberType", Some (structured_message_to_yojson x.member_type));
      ("name", Some (structure_message_name_to_yojson x.name));
    ]

let message_signal_to_yojson (x : message_signal) =
  assoc_to_yojson
    [
      ("structuredMessage", Some (structured_message_to_yojson x.structured_message));
      ("topicName", Some (topic_name_to_yojson x.topic_name));
    ]

let custom_decoding_id_to_yojson = string_to_yojson

let custom_decoding_signal_to_yojson (x : custom_decoding_signal) =
  assoc_to_yojson [ ("id", Some (custom_decoding_id_to_yojson x.id)) ]

let signal_decoder_to_yojson (x : signal_decoder) =
  assoc_to_yojson
    [
      ( "customDecodingSignal",
        option_to_yojson custom_decoding_signal_to_yojson x.custom_decoding_signal );
      ("messageSignal", option_to_yojson message_signal_to_yojson x.message_signal);
      ("obdSignal", option_to_yojson obd_signal_to_yojson x.obd_signal);
      ("canSignal", option_to_yojson can_signal_to_yojson x.can_signal);
      ("interfaceId", Some (interface_id_to_yojson x.interface_id));
      ("type", Some (signal_decoder_type_to_yojson x.type_));
      ("fullyQualifiedName", Some (fully_qualified_name_to_yojson x.fully_qualified_name));
    ]

let signal_decoders_to_yojson tree = list_to_yojson signal_decoder_to_yojson tree
let fqns_to_yojson tree = list_to_yojson fully_qualified_name_to_yojson tree

let network_interface_type_to_yojson (x : network_interface_type) =
  match x with
  | CUSTOM_DECODING_INTERFACE -> `String "CUSTOM_DECODING_INTERFACE"
  | VEHICLE_MIDDLEWARE -> `String "VEHICLE_MIDDLEWARE"
  | OBD_INTERFACE -> `String "OBD_INTERFACE"
  | CAN_INTERFACE -> `String "CAN_INTERFACE"

let can_interface_name_to_yojson = string_to_yojson
let protocol_name_to_yojson = string_to_yojson
let protocol_version_to_yojson = string_to_yojson

let can_interface_to_yojson (x : can_interface) =
  assoc_to_yojson
    [
      ("protocolVersion", option_to_yojson protocol_version_to_yojson x.protocol_version);
      ("protocolName", option_to_yojson protocol_name_to_yojson x.protocol_name);
      ("name", Some (can_interface_name_to_yojson x.name));
    ]

let obd_interface_name_to_yojson = string_to_yojson
let obd_standard_to_yojson = string_to_yojson

let obd_interface_to_yojson (x : obd_interface) =
  assoc_to_yojson
    [
      ( "hasTransmissionEcu",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.has_transmission_ecu );
      ( "useExtendedIds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.use_extended_ids );
      ( "dtcRequestIntervalSeconds",
        option_to_yojson non_negative_integer_to_yojson x.dtc_request_interval_seconds );
      ( "pidRequestIntervalSeconds",
        option_to_yojson non_negative_integer_to_yojson x.pid_request_interval_seconds );
      ("obdStandard", option_to_yojson obd_standard_to_yojson x.obd_standard);
      ("requestMessageId", Some (non_negative_integer_to_yojson x.request_message_id));
      ("name", Some (obd_interface_name_to_yojson x.name));
    ]

let custom_decoding_signal_interface_name_to_yojson = string_to_yojson

let custom_decoding_interface_to_yojson (x : custom_decoding_interface) =
  assoc_to_yojson [ ("name", Some (custom_decoding_signal_interface_name_to_yojson x.name)) ]

let network_interface_to_yojson (x : network_interface) =
  assoc_to_yojson
    [
      ( "customDecodingInterface",
        option_to_yojson custom_decoding_interface_to_yojson x.custom_decoding_interface );
      ("vehicleMiddleware", option_to_yojson vehicle_middleware_to_yojson x.vehicle_middleware);
      ("obdInterface", option_to_yojson obd_interface_to_yojson x.obd_interface);
      ("canInterface", option_to_yojson can_interface_to_yojson x.can_interface);
      ("type", Some (network_interface_type_to_yojson x.type_));
      ("interfaceId", Some (interface_id_to_yojson x.interface_id));
    ]

let network_interfaces_to_yojson tree = list_to_yojson network_interface_to_yojson tree
let interface_ids_to_yojson tree = list_to_yojson interface_id_to_yojson tree

let default_for_unmapped_signals_type_to_yojson (x : default_for_unmapped_signals_type) =
  match x with CUSTOM_DECODING -> `String "CUSTOM_DECODING"

let update_decoder_manifest_request_to_yojson (x : update_decoder_manifest_request) =
  assoc_to_yojson
    [
      ( "defaultForUnmappedSignals",
        option_to_yojson default_for_unmapped_signals_type_to_yojson x.default_for_unmapped_signals
      );
      ("status", option_to_yojson manifest_status_to_yojson x.status);
      ( "networkInterfacesToRemove",
        option_to_yojson interface_ids_to_yojson x.network_interfaces_to_remove );
      ( "networkInterfacesToUpdate",
        option_to_yojson network_interfaces_to_yojson x.network_interfaces_to_update );
      ( "networkInterfacesToAdd",
        option_to_yojson network_interfaces_to_yojson x.network_interfaces_to_add );
      ("signalDecodersToRemove", option_to_yojson fqns_to_yojson x.signal_decoders_to_remove);
      ( "signalDecodersToUpdate",
        option_to_yojson signal_decoders_to_yojson x.signal_decoders_to_update );
      ("signalDecodersToAdd", option_to_yojson signal_decoders_to_yojson x.signal_decoders_to_add);
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", Some (resource_name_to_yojson x.name));
    ]

let signal_decoder_failure_reason_to_yojson (x : signal_decoder_failure_reason) =
  match x with
  | CUSTOM_DECODING_SIGNAL_INFO_IS_NULL -> `String "CUSTOM_DECODING_SIGNAL_INFO_IS_NULL"
  | EMPTY_MESSAGE_SIGNAL -> `String "EMPTY_MESSAGE_SIGNAL"
  | SIGNAL_DECODER_INCOMPATIBLE_WITH_SIGNAL_CATALOG ->
      `String "SIGNAL_DECODER_INCOMPATIBLE_WITH_SIGNAL_CATALOG"
  | NO_SIGNAL_IN_CATALOG_FOR_DECODER_SIGNAL -> `String "NO_SIGNAL_IN_CATALOG_FOR_DECODER_SIGNAL"
  | STRUCT_SIZE_MISMATCH -> `String "STRUCT_SIZE_MISMATCH"
  | SIGNAL_DECODER_TYPE_INCOMPATIBLE_WITH_MESSAGE_SIGNAL_TYPE ->
      `String "SIGNAL_DECODER_TYPE_INCOMPATIBLE_WITH_MESSAGE_SIGNAL_TYPE"
  | MESSAGE_SIGNAL_INFO_IS_NULL -> `String "MESSAGE_SIGNAL_INFO_IS_NULL"
  | NO_DECODER_INFO_FOR_SIGNAL_IN_MODEL -> `String "NO_DECODER_INFO_FOR_SIGNAL_IN_MODEL"
  | OBD_SIGNAL_INFO_IS_NULL -> `String "OBD_SIGNAL_INFO_IS_NULL"
  | CAN_SIGNAL_INFO_IS_NULL -> `String "CAN_SIGNAL_INFO_IS_NULL"
  | SIGNAL_NOT_IN_MODEL -> `String "SIGNAL_NOT_IN_MODEL"
  | NETWORK_INTERFACE_TYPE_INCOMPATIBLE_WITH_SIGNAL_DECODER_TYPE ->
      `String "NETWORK_INTERFACE_TYPE_INCOMPATIBLE_WITH_SIGNAL_DECODER_TYPE"
  | SIGNAL_NOT_ASSOCIATED_WITH_NETWORK_INTERFACE ->
      `String "SIGNAL_NOT_ASSOCIATED_WITH_NETWORK_INTERFACE"
  | SIGNAL_TO_ADD_ALREADY_EXISTS -> `String "SIGNAL_TO_ADD_ALREADY_EXISTS"
  | CONFLICTING_SIGNAL -> `String "CONFLICTING_SIGNAL"
  | DUPLICATE_SIGNAL -> `String "DUPLICATE_SIGNAL"

let invalid_signal_decoder_to_yojson (x : invalid_signal_decoder) =
  assoc_to_yojson
    [
      ("hint", option_to_yojson message_to_yojson x.hint);
      ("reason", option_to_yojson signal_decoder_failure_reason_to_yojson x.reason);
      ("name", option_to_yojson fully_qualified_name_to_yojson x.name);
    ]

let invalid_signal_decoders_to_yojson tree = list_to_yojson invalid_signal_decoder_to_yojson tree

let network_interface_failure_reason_to_yojson (x : network_interface_failure_reason) =
  match x with
  | CUSTOM_DECODING_SIGNAL_NETWORK_INTERFACE_INFO_IS_NULL ->
      `String "CUSTOM_DECODING_SIGNAL_NETWORK_INTERFACE_INFO_IS_NULL"
  | VEHICLE_MIDDLEWARE_NETWORK_INTERFACE_INFO_IS_NULL ->
      `String "VEHICLE_MIDDLEWARE_NETWORK_INTERFACE_INFO_IS_NULL"
  | NETWORK_INTERFACE_TO_REMOVE_ASSOCIATED_WITH_SIGNALS ->
      `String "NETWORK_INTERFACE_TO_REMOVE_ASSOCIATED_WITH_SIGNALS"
  | OBD_NETWORK_INTERFACE_INFO_IS_NULL -> `String "OBD_NETWORK_INTERFACE_INFO_IS_NULL"
  | CAN_NETWORK_INTERFACE_INFO_IS_NULL -> `String "CAN_NETWORK_INTERFACE_INFO_IS_NULL"
  | NETWORK_INTERFACE_TO_ADD_ALREADY_EXISTS -> `String "NETWORK_INTERFACE_TO_ADD_ALREADY_EXISTS"
  | CONFLICTING_NETWORK_INTERFACE -> `String "CONFLICTING_NETWORK_INTERFACE"
  | DUPLICATE_INTERFACE -> `String "DUPLICATE_NETWORK_INTERFACE"

let invalid_network_interface_to_yojson (x : invalid_network_interface) =
  assoc_to_yojson
    [
      ("reason", option_to_yojson network_interface_failure_reason_to_yojson x.reason);
      ("interfaceId", option_to_yojson interface_id_to_yojson x.interface_id);
    ]

let invalid_network_interfaces_to_yojson tree =
  list_to_yojson invalid_network_interface_to_yojson tree

let decoder_manifest_validation_exception_to_yojson (x : decoder_manifest_validation_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ( "invalidNetworkInterfaces",
        option_to_yojson invalid_network_interfaces_to_yojson x.invalid_network_interfaces );
      ("invalidSignals", option_to_yojson invalid_signal_decoders_to_yojson x.invalid_signals);
    ]

let update_campaign_response_to_yojson (x : update_campaign_response) =
  assoc_to_yojson
    [
      ("status", option_to_yojson campaign_status_to_yojson x.status);
      ("name", option_to_yojson campaign_name_to_yojson x.name);
      ("arn", option_to_yojson campaign_arn_to_yojson x.arn);
    ]

let data_extra_dimension_node_path_list_to_yojson tree = list_to_yojson node_path_to_yojson tree

let update_campaign_action_to_yojson (x : update_campaign_action) =
  match x with
  | UPDATE -> `String "UPDATE"
  | RESUME -> `String "RESUME"
  | SUSPEND -> `String "SUSPEND"
  | APPROVE -> `String "APPROVE"

let update_campaign_request_to_yojson (x : update_campaign_request) =
  assoc_to_yojson
    [
      ("action", Some (update_campaign_action_to_yojson x.action));
      ( "dataExtraDimensions",
        option_to_yojson data_extra_dimension_node_path_list_to_yojson x.data_extra_dimensions );
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", Some (campaign_name_to_yojson x.name));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let trigger_mode_to_yojson (x : trigger_mode) =
  match x with RISING_EDGE -> `String "RISING_EDGE" | ALWAYS -> `String "ALWAYS"

let timestream_table_name_to_yojson = string_to_yojson
let timestream_table_arn_to_yojson = string_to_yojson
let timestream_database_name_to_yojson = string_to_yojson

let timestream_resources_to_yojson (x : timestream_resources) =
  assoc_to_yojson
    [
      ("timestreamTableName", Some (timestream_table_name_to_yojson x.timestream_table_name));
      ( "timestreamDatabaseName",
        Some (timestream_database_name_to_yojson x.timestream_database_name) );
    ]

let registration_status_to_yojson (x : registration_status) =
  match x with
  | REGISTRATION_FAILURE -> `String "REGISTRATION_FAILURE"
  | REGISTRATION_SUCCESS -> `String "REGISTRATION_SUCCESS"
  | REGISTRATION_PENDING -> `String "REGISTRATION_PENDING"

let timestream_registration_response_to_yojson (x : timestream_registration_response) =
  assoc_to_yojson
    [
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("registrationStatus", Some (registration_status_to_yojson x.registration_status));
      ("timestreamTableArn", option_to_yojson arn_to_yojson x.timestream_table_arn);
      ("timestreamDatabaseArn", option_to_yojson arn_to_yojson x.timestream_database_arn);
      ("timestreamTableName", Some (timestream_table_name_to_yojson x.timestream_table_name));
      ( "timestreamDatabaseName",
        Some (timestream_database_name_to_yojson x.timestream_database_name) );
    ]

let iam_role_arn_to_yojson = string_to_yojson

let timestream_config_to_yojson (x : timestream_config) =
  assoc_to_yojson
    [
      ("executionRoleArn", Some (iam_role_arn_to_yojson x.execution_role_arn));
      ("timestreamTableArn", Some (timestream_table_arn_to_yojson x.timestream_table_arn));
    ]

let time_based_signal_fetch_config_to_yojson (x : time_based_signal_fetch_config) =
  assoc_to_yojson
    [ ("executionFrequencyMs", Some (positive_long_to_yojson x.execution_frequency_ms)) ]

let time_based_collection_scheme_to_yojson (x : time_based_collection_scheme) =
  assoc_to_yojson [ ("periodMs", Some (collection_period_ms_to_yojson x.period_ms)) ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let storage_minimum_time_to_live_value_to_yojson = int_to_yojson

let storage_minimum_time_to_live_unit_to_yojson (x : storage_minimum_time_to_live_unit) =
  match x with WEEKS -> `String "WEEKS" | DAYS -> `String "DAYS" | HOURS -> `String "HOURS"

let storage_minimum_time_to_live_to_yojson (x : storage_minimum_time_to_live) =
  assoc_to_yojson
    [
      ("value", Some (storage_minimum_time_to_live_value_to_yojson x.value));
      ("unit", Some (storage_minimum_time_to_live_unit_to_yojson x.unit_));
    ]

let storage_maximum_size_value_to_yojson = int_to_yojson

let storage_maximum_size_unit_to_yojson (x : storage_maximum_size_unit) =
  match x with TB -> `String "TB" | GB -> `String "GB" | MB -> `String "MB"

let storage_maximum_size_to_yojson (x : storage_maximum_size) =
  assoc_to_yojson
    [
      ("value", Some (storage_maximum_size_value_to_yojson x.value));
      ("unit", Some (storage_maximum_size_unit_to_yojson x.unit_));
    ]

let storage_location_to_yojson = string_to_yojson

let storage_compression_format_to_yojson (x : storage_compression_format) =
  match x with GZIP -> `String "GZIP" | NONE -> `String "NONE"

let state_template_summary_to_yojson (x : state_template_summary) =
  assoc_to_yojson
    [
      ("id", option_to_yojson resource_unique_id_to_yojson x.id);
      ("lastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("description", option_to_yojson description_to_yojson x.description);
      ("signalCatalogArn", option_to_yojson arn_to_yojson x.signal_catalog_arn);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("name", option_to_yojson resource_name_to_yojson x.name);
    ]

let state_template_summaries_to_yojson tree = list_to_yojson state_template_summary_to_yojson tree

let spooling_mode_to_yojson (x : spooling_mode) =
  match x with TO_DISK -> `String "TO_DISK" | OFF -> `String "OFF"

let signal_node_type_to_yojson (x : signal_node_type) =
  match x with
  | CUSTOM_PROPERTY -> `String "CUSTOM_PROPERTY"
  | CUSTOM_STRUCT -> `String "CUSTOM_STRUCT"
  | BRANCH -> `String "BRANCH"
  | ATTRIBUTE -> `String "ATTRIBUTE"
  | ACTUATOR -> `String "ACTUATOR"
  | SENSOR -> `String "SENSOR"

let data_partition_id_to_yojson = string_to_yojson

let signal_information_to_yojson (x : signal_information) =
  assoc_to_yojson
    [
      ("dataPartitionId", option_to_yojson data_partition_id_to_yojson x.data_partition_id);
      ("minimumSamplingIntervalMs", option_to_yojson uint32_to_yojson x.minimum_sampling_interval_ms);
      ("maxSampleCount", option_to_yojson max_sample_count_to_yojson x.max_sample_count);
      ("name", Some (wildcard_signal_name_to_yojson x.name));
    ]

let signal_information_list_to_yojson tree = list_to_yojson signal_information_to_yojson tree

let condition_based_signal_fetch_config_to_yojson (x : condition_based_signal_fetch_config) =
  assoc_to_yojson
    [
      ("triggerMode", Some (trigger_mode_to_yojson x.trigger_mode));
      ("conditionExpression", Some (fetch_config_event_expression_to_yojson x.condition_expression));
    ]

let signal_fetch_config_to_yojson (x : signal_fetch_config) =
  match x with
  | ConditionBased arg ->
      assoc_to_yojson
        [ ("conditionBased", Some (condition_based_signal_fetch_config_to_yojson arg)) ]
  | TimeBased arg ->
      assoc_to_yojson [ ("timeBased", Some (time_based_signal_fetch_config_to_yojson arg)) ]

let event_expression_list_to_yojson tree = list_to_yojson action_event_expression_to_yojson tree

let signal_fetch_information_to_yojson (x : signal_fetch_information) =
  assoc_to_yojson
    [
      ("actions", Some (event_expression_list_to_yojson x.actions));
      ( "conditionLanguageVersion",
        option_to_yojson language_version_to_yojson x.condition_language_version );
      ("signalFetchConfig", Some (signal_fetch_config_to_yojson x.signal_fetch_config));
      ("fullyQualifiedName", Some (node_path_to_yojson x.fully_qualified_name));
    ]

let signal_fetch_information_list_to_yojson tree =
  list_to_yojson signal_fetch_information_to_yojson tree

let s3_bucket_arn_to_yojson = string_to_yojson

let data_format_to_yojson (x : data_format) =
  match x with PARQUET -> `String "PARQUET" | JSON -> `String "JSON"

let prefix_to_yojson = string_to_yojson

let s3_config_to_yojson (x : s3_config) =
  assoc_to_yojson
    [
      ("prefix", option_to_yojson prefix_to_yojson x.prefix);
      ( "storageCompressionFormat",
        option_to_yojson storage_compression_format_to_yojson x.storage_compression_format );
      ("dataFormat", option_to_yojson data_format_to_yojson x.data_format);
      ("bucketArn", Some (s3_bucket_arn_to_yojson x.bucket_arn));
    ]

let iam_resources_to_yojson (x : iam_resources) =
  assoc_to_yojson [ ("roleArn", Some (iam_role_arn_to_yojson x.role_arn)) ]

let register_account_response_to_yojson (x : register_account_response) =
  assoc_to_yojson
    [
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("iamResources", Some (iam_resources_to_yojson x.iam_resources));
      ("timestreamResources", option_to_yojson timestream_resources_to_yojson x.timestream_resources);
      ("registerAccountStatus", Some (registration_status_to_yojson x.register_account_status));
    ]

let register_account_request_to_yojson (x : register_account_request) =
  assoc_to_yojson
    [
      ("iamResources", option_to_yojson iam_resources_to_yojson x.iam_resources);
      ("timestreamResources", option_to_yojson timestream_resources_to_yojson x.timestream_resources);
    ]

let put_logging_options_response_to_yojson = unit_to_yojson

let log_type_to_yojson (x : log_type) =
  match x with ERROR -> `String "ERROR" | OFF -> `String "OFF"

let cloud_watch_log_group_name_to_yojson = string_to_yojson

let cloud_watch_log_delivery_options_to_yojson (x : cloud_watch_log_delivery_options) =
  assoc_to_yojson
    [
      ("logGroupName", option_to_yojson cloud_watch_log_group_name_to_yojson x.log_group_name);
      ("logType", Some (log_type_to_yojson x.log_type));
    ]

let put_logging_options_request_to_yojson (x : put_logging_options_request) =
  assoc_to_yojson
    [
      ( "cloudWatchLogDelivery",
        Some (cloud_watch_log_delivery_options_to_yojson x.cloud_watch_log_delivery) );
    ]

let encryption_status_to_yojson (x : encryption_status) =
  match x with
  | FAILURE -> `String "FAILURE"
  | SUCCESS -> `String "SUCCESS"
  | PENDING -> `String "PENDING"

let encryption_type_to_yojson (x : encryption_type) =
  match x with
  | FLEETWISE_DEFAULT_ENCRYPTION -> `String "FLEETWISE_DEFAULT_ENCRYPTION"
  | KMS_BASED_ENCRYPTION -> `String "KMS_BASED_ENCRYPTION"

let put_encryption_configuration_response_to_yojson (x : put_encryption_configuration_response) =
  assoc_to_yojson
    [
      ("encryptionType", Some (encryption_type_to_yojson x.encryption_type));
      ("encryptionStatus", Some (encryption_status_to_yojson x.encryption_status));
      ( "kmsKeyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id );
    ]

let put_encryption_configuration_request_to_yojson (x : put_encryption_configuration_request) =
  assoc_to_yojson
    [
      ("encryptionType", Some (encryption_type_to_yojson x.encryption_type));
      ( "kmsKeyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id );
    ]

let node_counts_to_yojson (x : node_counts) =
  assoc_to_yojson
    [
      ("totalProperties", option_to_yojson number_to_yojson x.total_properties);
      ("totalStructs", option_to_yojson number_to_yojson x.total_structs);
      ("totalActuators", option_to_yojson number_to_yojson x.total_actuators);
      ("totalAttributes", option_to_yojson number_to_yojson x.total_attributes);
      ("totalSensors", option_to_yojson number_to_yojson x.total_sensors);
      ("totalBranches", option_to_yojson number_to_yojson x.total_branches);
      ("totalNodes", option_to_yojson number_to_yojson x.total_nodes);
    ]

let network_file_blob_to_yojson = blob_to_yojson
let network_files_list_to_yojson tree = list_to_yojson network_file_blob_to_yojson tree
let model_signals_map_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree

let can_dbc_definition_to_yojson (x : can_dbc_definition) =
  assoc_to_yojson
    [
      ("signalsMap", option_to_yojson model_signals_map_to_yojson x.signals_map);
      ("canDbcFiles", Some (network_files_list_to_yojson x.can_dbc_files));
      ("networkInterface", Some (interface_id_to_yojson x.network_interface));
    ]

let network_file_definition_to_yojson (x : network_file_definition) =
  match x with
  | CanDbc arg -> assoc_to_yojson [ ("canDbc", Some (can_dbc_definition_to_yojson arg)) ]

let network_file_definitions_to_yojson tree = list_to_yojson network_file_definition_to_yojson tree
let mqtt_topic_arn_to_yojson = string_to_yojson

let mqtt_topic_config_to_yojson (x : mqtt_topic_config) =
  assoc_to_yojson
    [
      ("executionRoleArn", Some (iam_role_arn_to_yojson x.execution_role_arn));
      ("mqttTopicArn", Some (mqtt_topic_arn_to_yojson x.mqtt_topic_arn));
    ]

let list_vehicles_response_to_yojson (x : list_vehicles_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("vehicleSummaries", option_to_yojson vehicle_summaries_to_yojson x.vehicle_summaries);
    ]

let list_response_scope_to_yojson (x : list_response_scope) =
  match x with METADATA_ONLY -> `String "METADATA_ONLY"

let list_vehicles_request_to_yojson (x : list_vehicles_request) =
  assoc_to_yojson
    [
      ("listResponseScope", option_to_yojson list_response_scope_to_yojson x.list_response_scope);
      ("maxResults", option_to_yojson list_vehicles_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("attributeValues", option_to_yojson attribute_values_list_to_yojson x.attribute_values);
      ("attributeNames", option_to_yojson attribute_names_list_to_yojson x.attribute_names);
      ("modelManifestArn", option_to_yojson arn_to_yojson x.model_manifest_arn);
    ]

let list_vehicles_in_fleet_response_to_yojson (x : list_vehicles_in_fleet_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("vehicles", option_to_yojson vehicles_to_yojson x.vehicles);
    ]

let list_vehicles_in_fleet_request_to_yojson (x : list_vehicles_in_fleet_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("fleetId", Some (fleet_id_to_yojson x.fleet_id));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let list_state_templates_response_to_yojson (x : list_state_templates_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("summaries", option_to_yojson state_template_summaries_to_yojson x.summaries);
    ]

let list_state_templates_request_to_yojson (x : list_state_templates_request) =
  assoc_to_yojson
    [
      ("listResponseScope", option_to_yojson list_response_scope_to_yojson x.list_response_scope);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_signal_catalogs_response_to_yojson (x : list_signal_catalogs_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("summaries", option_to_yojson signal_catalog_summaries_to_yojson x.summaries);
    ]

let list_signal_catalogs_request_to_yojson (x : list_signal_catalogs_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_signal_catalog_nodes_response_to_yojson (x : list_signal_catalog_nodes_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("nodes", option_to_yojson nodes_to_yojson x.nodes);
    ]

let list_signal_catalog_nodes_request_to_yojson (x : list_signal_catalog_nodes_request) =
  assoc_to_yojson
    [
      ("signalNodeType", option_to_yojson signal_node_type_to_yojson x.signal_node_type);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("name", Some (resource_name_to_yojson x.name));
    ]

let list_model_manifests_response_to_yojson (x : list_model_manifests_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("summaries", option_to_yojson model_manifest_summaries_to_yojson x.summaries);
    ]

let list_model_manifests_request_to_yojson (x : list_model_manifests_request) =
  assoc_to_yojson
    [
      ("listResponseScope", option_to_yojson list_response_scope_to_yojson x.list_response_scope);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("signalCatalogArn", option_to_yojson arn_to_yojson x.signal_catalog_arn);
    ]

let list_model_manifest_nodes_response_to_yojson (x : list_model_manifest_nodes_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("nodes", option_to_yojson nodes_to_yojson x.nodes);
    ]

let list_model_manifest_nodes_request_to_yojson (x : list_model_manifest_nodes_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("name", Some (resource_name_to_yojson x.name));
    ]

let list_fleets_response_to_yojson (x : list_fleets_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("fleetSummaries", option_to_yojson fleet_summaries_to_yojson x.fleet_summaries);
    ]

let list_fleets_request_to_yojson (x : list_fleets_request) =
  assoc_to_yojson
    [
      ("listResponseScope", option_to_yojson list_response_scope_to_yojson x.list_response_scope);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_fleets_for_vehicle_response_to_yojson (x : list_fleets_for_vehicle_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("fleets", option_to_yojson fleets_to_yojson x.fleets);
    ]

let list_fleets_for_vehicle_request_to_yojson (x : list_fleets_for_vehicle_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
    ]

let list_decoder_manifests_response_to_yojson (x : list_decoder_manifests_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("summaries", option_to_yojson decoder_manifest_summaries_to_yojson x.summaries);
    ]

let list_decoder_manifests_request_to_yojson (x : list_decoder_manifests_request) =
  assoc_to_yojson
    [
      ("listResponseScope", option_to_yojson list_response_scope_to_yojson x.list_response_scope);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("modelManifestArn", option_to_yojson arn_to_yojson x.model_manifest_arn);
    ]

let list_decoder_manifest_signals_response_to_yojson (x : list_decoder_manifest_signals_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("signalDecoders", option_to_yojson signal_decoders_to_yojson x.signal_decoders);
    ]

let list_decoder_manifest_signals_request_to_yojson (x : list_decoder_manifest_signals_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("name", Some (resource_name_to_yojson x.name));
    ]

let list_decoder_manifest_network_interfaces_response_to_yojson
    (x : list_decoder_manifest_network_interfaces_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("networkInterfaces", option_to_yojson network_interfaces_to_yojson x.network_interfaces);
    ]

let list_decoder_manifest_network_interfaces_request_to_yojson
    (x : list_decoder_manifest_network_interfaces_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("name", Some (resource_name_to_yojson x.name));
    ]

let list_campaigns_response_to_yojson (x : list_campaigns_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("campaignSummaries", option_to_yojson campaign_summaries_to_yojson x.campaign_summaries);
    ]

let list_campaigns_request_to_yojson (x : list_campaigns_request) =
  assoc_to_yojson
    [
      ("listResponseScope", option_to_yojson list_response_scope_to_yojson x.list_response_scope);
      ("status", option_to_yojson status_str_to_yojson x.status);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_vehicle_status_response_to_yojson (x : get_vehicle_status_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("campaigns", option_to_yojson vehicle_status_list_to_yojson x.campaigns);
    ]

let get_vehicle_status_request_to_yojson (x : get_vehicle_status_request) =
  assoc_to_yojson
    [
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let iam_registration_response_to_yojson (x : iam_registration_response) =
  assoc_to_yojson
    [
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("registrationStatus", Some (registration_status_to_yojson x.registration_status));
      ("roleArn", Some (arn_to_yojson x.role_arn));
    ]

let get_register_account_status_response_to_yojson (x : get_register_account_status_response) =
  assoc_to_yojson
    [
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ( "iamRegistrationResponse",
        Some (iam_registration_response_to_yojson x.iam_registration_response) );
      ( "timestreamRegistrationResponse",
        option_to_yojson timestream_registration_response_to_yojson
          x.timestream_registration_response );
      ("accountStatus", Some (registration_status_to_yojson x.account_status));
      ("customerAccountId", Some (customer_account_id_to_yojson x.customer_account_id));
    ]

let get_register_account_status_request_to_yojson = unit_to_yojson

let get_logging_options_response_to_yojson (x : get_logging_options_response) =
  assoc_to_yojson
    [
      ( "cloudWatchLogDelivery",
        Some (cloud_watch_log_delivery_options_to_yojson x.cloud_watch_log_delivery) );
    ]

let get_logging_options_request_to_yojson = unit_to_yojson

let get_encryption_configuration_response_to_yojson (x : get_encryption_configuration_response) =
  assoc_to_yojson
    [
      ("lastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("encryptionType", Some (encryption_type_to_yojson x.encryption_type));
      ("encryptionStatus", Some (encryption_status_to_yojson x.encryption_status));
      ( "kmsKeyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id );
    ]

let get_encryption_configuration_request_to_yojson = unit_to_yojson

let batch_update_vehicle_response_to_yojson (x : batch_update_vehicle_response) =
  assoc_to_yojson
    [
      ("errors", option_to_yojson update_vehicle_errors_to_yojson x.errors);
      ("vehicles", option_to_yojson update_vehicle_response_items_to_yojson x.vehicles);
    ]

let batch_update_vehicle_request_to_yojson (x : batch_update_vehicle_request) =
  assoc_to_yojson [ ("vehicles", Some (update_vehicle_request_items_to_yojson x.vehicles)) ]

let batch_create_vehicle_response_to_yojson (x : batch_create_vehicle_response) =
  assoc_to_yojson
    [
      ("errors", option_to_yojson create_vehicle_errors_to_yojson x.errors);
      ("vehicles", option_to_yojson create_vehicle_responses_to_yojson x.vehicles);
    ]

let batch_create_vehicle_request_to_yojson (x : batch_create_vehicle_request) =
  assoc_to_yojson [ ("vehicles", Some (create_vehicle_request_items_to_yojson x.vehicles)) ]

let import_signal_catalog_response_to_yojson (x : import_signal_catalog_response) =
  assoc_to_yojson
    [ ("arn", Some (arn_to_yojson x.arn)); ("name", Some (resource_name_to_yojson x.name)) ]

let formatted_vss_to_yojson (x : formatted_vss) =
  match x with
  | VssJson arg ->
      assoc_to_yojson
        [ ("vssJson", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]

let import_signal_catalog_request_to_yojson (x : import_signal_catalog_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("vss", option_to_yojson formatted_vss_to_yojson x.vss);
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", Some (resource_name_to_yojson x.name));
    ]

let import_decoder_manifest_response_to_yojson (x : import_decoder_manifest_response) =
  assoc_to_yojson
    [ ("arn", Some (arn_to_yojson x.arn)); ("name", Some (resource_name_to_yojson x.name)) ]

let import_decoder_manifest_request_to_yojson (x : import_decoder_manifest_request) =
  assoc_to_yojson
    [
      ( "networkFileDefinitions",
        Some (network_file_definitions_to_yojson x.network_file_definitions) );
      ("name", Some (resource_name_to_yojson x.name));
    ]

let get_vehicle_response_to_yojson (x : get_vehicle_response) =
  assoc_to_yojson
    [
      ("lastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("stateTemplates", option_to_yojson state_template_associations_to_yojson x.state_templates);
      ("attributes", option_to_yojson attributes_map_to_yojson x.attributes);
      ("decoderManifestArn", option_to_yojson arn_to_yojson x.decoder_manifest_arn);
      ("modelManifestArn", option_to_yojson arn_to_yojson x.model_manifest_arn);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("vehicleName", option_to_yojson vehicle_name_to_yojson x.vehicle_name);
    ]

let get_vehicle_request_to_yojson (x : get_vehicle_request) =
  assoc_to_yojson [ ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name)) ]

let get_state_template_response_to_yojson (x : get_state_template_response) =
  assoc_to_yojson
    [
      ("id", option_to_yojson resource_unique_id_to_yojson x.id);
      ("lastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "metadataExtraDimensions",
        option_to_yojson state_template_metadata_extra_dimension_node_path_list_to_yojson
          x.metadata_extra_dimensions );
      ( "dataExtraDimensions",
        option_to_yojson state_template_data_extra_dimension_node_path_list_to_yojson
          x.data_extra_dimensions );
      ( "stateTemplateProperties",
        option_to_yojson state_template_properties_to_yojson x.state_template_properties );
      ("signalCatalogArn", option_to_yojson arn_to_yojson x.signal_catalog_arn);
      ("description", option_to_yojson description_to_yojson x.description);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("name", option_to_yojson resource_name_to_yojson x.name);
    ]

let get_state_template_request_to_yojson (x : get_state_template_request) =
  assoc_to_yojson [ ("identifier", Some (resource_identifier_to_yojson x.identifier)) ]

let get_signal_catalog_response_to_yojson (x : get_signal_catalog_response) =
  assoc_to_yojson
    [
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("nodeCounts", option_to_yojson node_counts_to_yojson x.node_counts);
      ("description", option_to_yojson description_to_yojson x.description);
      ("arn", Some (arn_to_yojson x.arn));
      ("name", Some (resource_name_to_yojson x.name));
    ]

let get_signal_catalog_request_to_yojson (x : get_signal_catalog_request) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let get_model_manifest_response_to_yojson (x : get_model_manifest_response) =
  assoc_to_yojson
    [
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("status", option_to_yojson manifest_status_to_yojson x.status);
      ("signalCatalogArn", option_to_yojson arn_to_yojson x.signal_catalog_arn);
      ("description", option_to_yojson description_to_yojson x.description);
      ("arn", Some (arn_to_yojson x.arn));
      ("name", Some (resource_name_to_yojson x.name));
    ]

let get_model_manifest_request_to_yojson (x : get_model_manifest_request) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let get_fleet_response_to_yojson (x : get_fleet_response) =
  assoc_to_yojson
    [
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("signalCatalogArn", Some (arn_to_yojson x.signal_catalog_arn));
      ("description", option_to_yojson description_to_yojson x.description);
      ("arn", Some (arn_to_yojson x.arn));
      ("id", Some (fleet_id_to_yojson x.id));
    ]

let get_fleet_request_to_yojson (x : get_fleet_request) =
  assoc_to_yojson [ ("fleetId", Some (fleet_id_to_yojson x.fleet_id)) ]

let get_decoder_manifest_response_to_yojson (x : get_decoder_manifest_response) =
  assoc_to_yojson
    [
      ("message", option_to_yojson message_to_yojson x.message);
      ("lastModificationTime", Some (timestamp_to_yojson x.last_modification_time));
      ("creationTime", Some (timestamp_to_yojson x.creation_time));
      ("status", option_to_yojson manifest_status_to_yojson x.status);
      ("modelManifestArn", option_to_yojson arn_to_yojson x.model_manifest_arn);
      ("description", option_to_yojson description_to_yojson x.description);
      ("arn", Some (arn_to_yojson x.arn));
      ("name", Some (string__to_yojson x.name));
    ]

let get_decoder_manifest_request_to_yojson (x : get_decoder_manifest_request) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let diagnostics_mode_to_yojson (x : diagnostics_mode) =
  match x with SEND_ACTIVE_DTCS -> `String "SEND_ACTIVE_DTCS" | OFF -> `String "OFF"

let compression_to_yojson (x : compression) =
  match x with SNAPPY -> `String "SNAPPY" | OFF -> `String "OFF"

let condition_based_collection_scheme_to_yojson (x : condition_based_collection_scheme) =
  assoc_to_yojson
    [
      ( "conditionLanguageVersion",
        option_to_yojson language_version_to_yojson x.condition_language_version );
      ("triggerMode", option_to_yojson trigger_mode_to_yojson x.trigger_mode);
      ("minimumTriggerIntervalMs", option_to_yojson uint32_to_yojson x.minimum_trigger_interval_ms);
      ("expression", Some (event_expression_to_yojson x.expression));
    ]

let collection_scheme_to_yojson (x : collection_scheme) =
  match x with
  | ConditionBasedCollectionScheme arg ->
      assoc_to_yojson
        [
          ("conditionBasedCollectionScheme", Some (condition_based_collection_scheme_to_yojson arg));
        ]
  | TimeBasedCollectionScheme arg ->
      assoc_to_yojson
        [ ("timeBasedCollectionScheme", Some (time_based_collection_scheme_to_yojson arg)) ]

let data_destination_config_to_yojson (x : data_destination_config) =
  match x with
  | MqttTopicConfig arg ->
      assoc_to_yojson [ ("mqttTopicConfig", Some (mqtt_topic_config_to_yojson arg)) ]
  | TimestreamConfig arg ->
      assoc_to_yojson [ ("timestreamConfig", Some (timestream_config_to_yojson arg)) ]
  | S3Config arg -> assoc_to_yojson [ ("s3Config", Some (s3_config_to_yojson arg)) ]

let data_destination_configs_to_yojson tree = list_to_yojson data_destination_config_to_yojson tree

let data_partition_storage_options_to_yojson (x : data_partition_storage_options) =
  assoc_to_yojson
    [
      ("minimumTimeToLive", Some (storage_minimum_time_to_live_to_yojson x.minimum_time_to_live));
      ("storageLocation", Some (storage_location_to_yojson x.storage_location));
      ("maximumSize", Some (storage_maximum_size_to_yojson x.maximum_size));
    ]

let data_partition_upload_options_to_yojson (x : data_partition_upload_options) =
  assoc_to_yojson
    [
      ( "conditionLanguageVersion",
        option_to_yojson language_version_to_yojson x.condition_language_version );
      ("expression", Some (event_expression_to_yojson x.expression));
    ]

let data_partition_to_yojson (x : data_partition) =
  assoc_to_yojson
    [
      ("uploadOptions", option_to_yojson data_partition_upload_options_to_yojson x.upload_options);
      ("storageOptions", Some (data_partition_storage_options_to_yojson x.storage_options));
      ("id", Some (data_partition_id_to_yojson x.id));
    ]

let data_partitions_to_yojson tree = list_to_yojson data_partition_to_yojson tree

let get_campaign_response_to_yojson (x : get_campaign_response) =
  assoc_to_yojson
    [
      ("signalsToFetch", option_to_yojson signal_fetch_information_list_to_yojson x.signals_to_fetch);
      ("dataPartitions", option_to_yojson data_partitions_to_yojson x.data_partitions);
      ( "dataDestinationConfigs",
        option_to_yojson data_destination_configs_to_yojson x.data_destination_configs );
      ("lastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "dataExtraDimensions",
        option_to_yojson data_extra_dimension_node_path_list_to_yojson x.data_extra_dimensions );
      ("collectionScheme", option_to_yojson collection_scheme_to_yojson x.collection_scheme);
      ("signalsToCollect", option_to_yojson signal_information_list_to_yojson x.signals_to_collect);
      ("priority", option_to_yojson priority_to_yojson x.priority);
      ("compression", option_to_yojson compression_to_yojson x.compression);
      ("spoolingMode", option_to_yojson spooling_mode_to_yojson x.spooling_mode);
      ("diagnosticsMode", option_to_yojson diagnostics_mode_to_yojson x.diagnostics_mode);
      ( "postTriggerCollectionDuration",
        option_to_yojson uint32_to_yojson x.post_trigger_collection_duration );
      ("expiryTime", option_to_yojson timestamp_to_yojson x.expiry_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("status", option_to_yojson campaign_status_to_yojson x.status);
      ("targetArn", option_to_yojson arn_to_yojson x.target_arn);
      ("signalCatalogArn", option_to_yojson arn_to_yojson x.signal_catalog_arn);
      ("description", option_to_yojson description_to_yojson x.description);
      ("arn", option_to_yojson campaign_arn_to_yojson x.arn);
      ("name", option_to_yojson campaign_name_to_yojson x.name);
    ]

let get_campaign_request_to_yojson (x : get_campaign_request) =
  assoc_to_yojson [ ("name", Some (campaign_name_to_yojson x.name)) ]

let disassociate_vehicle_fleet_response_to_yojson = unit_to_yojson

let disassociate_vehicle_fleet_request_to_yojson (x : disassociate_vehicle_fleet_request) =
  assoc_to_yojson
    [
      ("fleetId", Some (fleet_id_to_yojson x.fleet_id));
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
    ]

let delete_vehicle_response_to_yojson (x : delete_vehicle_response) =
  assoc_to_yojson
    [
      ("arn", Some (arn_to_yojson x.arn));
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
    ]

let delete_vehicle_request_to_yojson (x : delete_vehicle_request) =
  assoc_to_yojson [ ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name)) ]

let delete_state_template_response_to_yojson (x : delete_state_template_response) =
  assoc_to_yojson
    [
      ("id", option_to_yojson resource_unique_id_to_yojson x.id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("name", option_to_yojson resource_name_to_yojson x.name);
    ]

let delete_state_template_request_to_yojson (x : delete_state_template_request) =
  assoc_to_yojson [ ("identifier", Some (resource_identifier_to_yojson x.identifier)) ]

let delete_signal_catalog_response_to_yojson (x : delete_signal_catalog_response) =
  assoc_to_yojson
    [ ("arn", Some (arn_to_yojson x.arn)); ("name", Some (resource_name_to_yojson x.name)) ]

let delete_signal_catalog_request_to_yojson (x : delete_signal_catalog_request) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let delete_model_manifest_response_to_yojson (x : delete_model_manifest_response) =
  assoc_to_yojson
    [ ("arn", Some (arn_to_yojson x.arn)); ("name", Some (resource_name_to_yojson x.name)) ]

let delete_model_manifest_request_to_yojson (x : delete_model_manifest_request) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let delete_fleet_response_to_yojson (x : delete_fleet_response) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson arn_to_yojson x.arn); ("id", option_to_yojson fleet_id_to_yojson x.id);
    ]

let delete_fleet_request_to_yojson (x : delete_fleet_request) =
  assoc_to_yojson [ ("fleetId", Some (fleet_id_to_yojson x.fleet_id)) ]

let delete_decoder_manifest_response_to_yojson (x : delete_decoder_manifest_response) =
  assoc_to_yojson
    [ ("arn", Some (arn_to_yojson x.arn)); ("name", Some (resource_name_to_yojson x.name)) ]

let delete_decoder_manifest_request_to_yojson (x : delete_decoder_manifest_request) =
  assoc_to_yojson [ ("name", Some (resource_name_to_yojson x.name)) ]

let delete_campaign_response_to_yojson (x : delete_campaign_response) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson campaign_arn_to_yojson x.arn);
      ("name", option_to_yojson campaign_name_to_yojson x.name);
    ]

let delete_campaign_request_to_yojson (x : delete_campaign_request) =
  assoc_to_yojson [ ("name", Some (campaign_name_to_yojson x.name)) ]

let create_vehicle_response_to_yojson (x : create_vehicle_response) =
  assoc_to_yojson
    [
      ("thingArn", option_to_yojson arn_to_yojson x.thing_arn);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("vehicleName", option_to_yojson vehicle_name_to_yojson x.vehicle_name);
    ]

let create_vehicle_request_to_yojson (x : create_vehicle_request) =
  assoc_to_yojson
    [
      ("stateTemplates", option_to_yojson state_template_associations_to_yojson x.state_templates);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "associationBehavior",
        option_to_yojson vehicle_association_behavior_to_yojson x.association_behavior );
      ("attributes", option_to_yojson attributes_map_to_yojson x.attributes);
      ("decoderManifestArn", Some (arn_to_yojson x.decoder_manifest_arn));
      ("modelManifestArn", Some (arn_to_yojson x.model_manifest_arn));
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
    ]

let create_state_template_response_to_yojson (x : create_state_template_response) =
  assoc_to_yojson
    [
      ("id", option_to_yojson resource_unique_id_to_yojson x.id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("name", option_to_yojson resource_name_to_yojson x.name);
    ]

let create_state_template_request_to_yojson (x : create_state_template_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "metadataExtraDimensions",
        option_to_yojson state_template_metadata_extra_dimension_node_path_list_to_yojson
          x.metadata_extra_dimensions );
      ( "dataExtraDimensions",
        option_to_yojson state_template_data_extra_dimension_node_path_list_to_yojson
          x.data_extra_dimensions );
      ( "stateTemplateProperties",
        Some (state_template_properties_to_yojson x.state_template_properties) );
      ("signalCatalogArn", Some (arn_to_yojson x.signal_catalog_arn));
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", Some (resource_name_to_yojson x.name));
    ]

let create_signal_catalog_response_to_yojson (x : create_signal_catalog_response) =
  assoc_to_yojson
    [ ("arn", Some (arn_to_yojson x.arn)); ("name", Some (resource_name_to_yojson x.name)) ]

let create_signal_catalog_request_to_yojson (x : create_signal_catalog_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("nodes", option_to_yojson nodes_to_yojson x.nodes);
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", Some (resource_name_to_yojson x.name));
    ]

let create_model_manifest_response_to_yojson (x : create_model_manifest_response) =
  assoc_to_yojson
    [ ("arn", Some (arn_to_yojson x.arn)); ("name", Some (resource_name_to_yojson x.name)) ]

let create_model_manifest_request_to_yojson (x : create_model_manifest_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("signalCatalogArn", Some (arn_to_yojson x.signal_catalog_arn));
      ("nodes", Some (list_of_strings_to_yojson x.nodes));
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", Some (resource_name_to_yojson x.name));
    ]

let create_fleet_response_to_yojson (x : create_fleet_response) =
  assoc_to_yojson [ ("arn", Some (arn_to_yojson x.arn)); ("id", Some (fleet_id_to_yojson x.id)) ]

let create_fleet_request_to_yojson (x : create_fleet_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("signalCatalogArn", Some (arn_to_yojson x.signal_catalog_arn));
      ("description", option_to_yojson description_to_yojson x.description);
      ("fleetId", Some (fleet_id_to_yojson x.fleet_id));
    ]

let create_decoder_manifest_response_to_yojson (x : create_decoder_manifest_response) =
  assoc_to_yojson
    [ ("arn", Some (arn_to_yojson x.arn)); ("name", Some (resource_name_to_yojson x.name)) ]

let create_decoder_manifest_request_to_yojson (x : create_decoder_manifest_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "defaultForUnmappedSignals",
        option_to_yojson default_for_unmapped_signals_type_to_yojson x.default_for_unmapped_signals
      );
      ("networkInterfaces", option_to_yojson network_interfaces_to_yojson x.network_interfaces);
      ("signalDecoders", option_to_yojson signal_decoders_to_yojson x.signal_decoders);
      ("modelManifestArn", Some (arn_to_yojson x.model_manifest_arn));
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", Some (resource_name_to_yojson x.name));
    ]

let create_campaign_response_to_yojson (x : create_campaign_response) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson campaign_arn_to_yojson x.arn);
      ("name", option_to_yojson campaign_name_to_yojson x.name);
    ]

let create_campaign_request_to_yojson (x : create_campaign_request) =
  assoc_to_yojson
    [
      ("signalsToFetch", option_to_yojson signal_fetch_information_list_to_yojson x.signals_to_fetch);
      ("dataPartitions", option_to_yojson data_partitions_to_yojson x.data_partitions);
      ( "dataDestinationConfigs",
        option_to_yojson data_destination_configs_to_yojson x.data_destination_configs );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "dataExtraDimensions",
        option_to_yojson data_extra_dimension_node_path_list_to_yojson x.data_extra_dimensions );
      ("collectionScheme", Some (collection_scheme_to_yojson x.collection_scheme));
      ("signalsToCollect", option_to_yojson signal_information_list_to_yojson x.signals_to_collect);
      ("priority", option_to_yojson priority_to_yojson x.priority);
      ("compression", option_to_yojson compression_to_yojson x.compression);
      ("spoolingMode", option_to_yojson spooling_mode_to_yojson x.spooling_mode);
      ("diagnosticsMode", option_to_yojson diagnostics_mode_to_yojson x.diagnostics_mode);
      ( "postTriggerCollectionDuration",
        option_to_yojson uint32_to_yojson x.post_trigger_collection_duration );
      ("expiryTime", option_to_yojson timestamp_to_yojson x.expiry_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("targetArn", Some (arn_to_yojson x.target_arn));
      ("signalCatalogArn", Some (arn_to_yojson x.signal_catalog_arn));
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", Some (campaign_name_to_yojson x.name));
    ]

let associate_vehicle_fleet_response_to_yojson = unit_to_yojson

let associate_vehicle_fleet_request_to_yojson (x : associate_vehicle_fleet_request) =
  assoc_to_yojson
    [
      ("fleetId", Some (fleet_id_to_yojson x.fleet_id));
      ("vehicleName", Some (vehicle_name_to_yojson x.vehicle_name));
    ]
