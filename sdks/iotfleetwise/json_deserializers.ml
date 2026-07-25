open Smaws_Lib.Json.DeserializeHelpers
open Types

let string__of_yojson = string_of_yojson

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key string__of_yojson "message" _list path } : access_denied_exception)

let node_path_of_yojson = string_of_yojson
let message_of_yojson = string_of_yojson
let double_of_yojson = double_of_yojson
let list_of_strings_of_yojson tree path = list_of_yojson string__of_yojson tree path
let description_of_yojson = string_of_yojson

let node_data_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INT8" -> INT8
    | `String "UINT8" -> UINT8
    | `String "INT16" -> INT16
    | `String "UINT16" -> UINT16
    | `String "INT32" -> INT32
    | `String "UINT32" -> UINT32
    | `String "INT64" -> INT64
    | `String "UINT64" -> UINT64
    | `String "BOOLEAN" -> BOOLEAN
    | `String "FLOAT" -> FLOAT
    | `String "DOUBLE" -> DOUBLE
    | `String "STRING" -> STRING
    | `String "UNIX_TIMESTAMP" -> UNIX_TIMESTAMP
    | `String "INT8_ARRAY" -> INT8_ARRAY
    | `String "UINT8_ARRAY" -> UINT8_ARRAY
    | `String "INT16_ARRAY" -> INT16_ARRAY
    | `String "UINT16_ARRAY" -> UINT16_ARRAY
    | `String "INT32_ARRAY" -> INT32_ARRAY
    | `String "UINT32_ARRAY" -> UINT32_ARRAY
    | `String "INT64_ARRAY" -> INT64_ARRAY
    | `String "UINT64_ARRAY" -> UINT64_ARRAY
    | `String "BOOLEAN_ARRAY" -> BOOLEAN_ARRAY
    | `String "FLOAT_ARRAY" -> FLOAT_ARRAY
    | `String "DOUBLE_ARRAY" -> DOUBLE_ARRAY
    | `String "STRING_ARRAY" -> STRING_ARRAY
    | `String "UNIX_TIMESTAMP_ARRAY" -> UNIX_TIMESTAMP_ARRAY
    | `String "UNKNOWN" -> UNKNOWN
    | `String "STRUCT" -> STRUCT
    | `String "STRUCT_ARRAY" -> STRUCT_ARRAY
    | `String value -> raise (deserialize_unknown_enum_value_error path "NodeDataType" value)
    | _ -> raise (deserialize_wrong_type_error path "NodeDataType")
     : node_data_type)
    : node_data_type)

let actuator_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fully_qualified_name = value_for_key string__of_yojson "fullyQualifiedName" _list path;
     data_type = value_for_key node_data_type_of_yojson "dataType" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     unit_ = option_of_yojson (value_for_key string__of_yojson "unit") _list path;
     allowed_values =
       option_of_yojson (value_for_key list_of_strings_of_yojson "allowedValues") _list path;
     min = option_of_yojson (value_for_key double_of_yojson "min") _list path;
     max = option_of_yojson (value_for_key double_of_yojson "max") _list path;
     assigned_value = option_of_yojson (value_for_key string__of_yojson "assignedValue") _list path;
     deprecation_message =
       option_of_yojson (value_for_key message_of_yojson "deprecationMessage") _list path;
     comment = option_of_yojson (value_for_key message_of_yojson "comment") _list path;
     struct_fully_qualified_name =
       option_of_yojson (value_for_key node_path_of_yojson "structFullyQualifiedName") _list path;
   }
    : actuator)

let amazon_resource_name_of_yojson = string_of_yojson

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "name" _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : validation_exception_field)

let validation_exception_field_list_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "unknownOperation" -> UNKNOWN_OPERATION
    | `String "cannotParse" -> CANNOT_PARSE
    | `String "fieldValidationFailed" -> FIELD_VALIDATION_FAILED
    | `String "other" -> OTHER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key string__of_yojson "message" _list path;
     reason =
       option_of_yojson (value_for_key validation_exception_reason_of_yojson "reason") _list path;
     field_list =
       option_of_yojson
         (value_for_key validation_exception_field_list_of_yojson "fieldList")
         _list path;
   }
    : validation_exception)

let retry_after_seconds_of_yojson = int_of_yojson

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key string__of_yojson "message" _list path;
     quota_code = option_of_yojson (value_for_key string__of_yojson "quotaCode") _list path;
     service_code = option_of_yojson (value_for_key string__of_yojson "serviceCode") _list path;
     retry_after_seconds =
       option_of_yojson (value_for_key retry_after_seconds_of_yojson "retryAfterSeconds") _list path;
   }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key string__of_yojson "message" _list path;
     resource_id = value_for_key string__of_yojson "resourceId" _list path;
     resource_type = value_for_key string__of_yojson "resourceType" _list path;
   }
    : resource_not_found_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key string__of_yojson "message" _list path;
     resource_id = value_for_key string__of_yojson "resourceId" _list path;
     resource_type = value_for_key string__of_yojson "resourceType" _list path;
   }
    : limit_exceeded_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key string__of_yojson "message" _list path;
     retry_after_seconds =
       option_of_yojson (value_for_key retry_after_seconds_of_yojson "retryAfterSeconds") _list path;
   }
    : internal_server_exception)

let associate_vehicle_fleet_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let fleet_id_of_yojson = string_of_yojson
let vehicle_name_of_yojson = string_of_yojson

let associate_vehicle_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
     fleet_id = value_for_key fleet_id_of_yojson "fleetId" _list path;
   }
    : associate_vehicle_fleet_request)

let attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fully_qualified_name = value_for_key string__of_yojson "fullyQualifiedName" _list path;
     data_type = value_for_key node_data_type_of_yojson "dataType" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     unit_ = option_of_yojson (value_for_key string__of_yojson "unit") _list path;
     allowed_values =
       option_of_yojson (value_for_key list_of_strings_of_yojson "allowedValues") _list path;
     min = option_of_yojson (value_for_key double_of_yojson "min") _list path;
     max = option_of_yojson (value_for_key double_of_yojson "max") _list path;
     assigned_value = option_of_yojson (value_for_key string__of_yojson "assignedValue") _list path;
     default_value = option_of_yojson (value_for_key string__of_yojson "defaultValue") _list path;
     deprecation_message =
       option_of_yojson (value_for_key message_of_yojson "deprecationMessage") _list path;
     comment = option_of_yojson (value_for_key message_of_yojson "comment") _list path;
   }
    : attribute)

let create_vehicle_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicle_name = option_of_yojson (value_for_key vehicle_name_of_yojson "vehicleName") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "code") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : create_vehicle_error)

let create_vehicle_errors_of_yojson tree path =
  list_of_yojson create_vehicle_error_of_yojson tree path

let arn_of_yojson = string_of_yojson

let create_vehicle_response_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicle_name = option_of_yojson (value_for_key vehicle_name_of_yojson "vehicleName") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     thing_arn = option_of_yojson (value_for_key arn_of_yojson "thingArn") _list path;
   }
    : create_vehicle_response_item)

let create_vehicle_responses_of_yojson tree path =
  list_of_yojson create_vehicle_response_item_of_yojson tree path

let batch_create_vehicle_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicles =
       option_of_yojson (value_for_key create_vehicle_responses_of_yojson "vehicles") _list path;
     errors = option_of_yojson (value_for_key create_vehicle_errors_of_yojson "errors") _list path;
   }
    : batch_create_vehicle_response)

let on_change_state_template_update_strategy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let positive_integer_of_yojson = int_of_yojson

let time_unit_of_yojson (tree : t) path =
  ((match tree with
    | `String "MILLISECOND" -> MILLISECOND
    | `String "SECOND" -> SECOND
    | `String "MINUTE" -> MINUTE
    | `String "HOUR" -> HOUR
    | `String value -> raise (deserialize_unknown_enum_value_error path "TimeUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "TimeUnit")
     : time_unit)
    : time_unit)

let time_period_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unit_ = value_for_key time_unit_of_yojson "unit" _list path;
     value = value_for_key positive_integer_of_yojson "value" _list path;
   }
    : time_period)

let periodic_state_template_update_strategy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_template_update_rate =
       value_for_key time_period_of_yojson "stateTemplateUpdateRate" _list path;
   }
    : periodic_state_template_update_strategy)

let state_template_update_strategy_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "periodic" -> Periodic (periodic_state_template_update_strategy_of_yojson value_ path)
   | "onChange" -> OnChange (on_change_state_template_update_strategy_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "StateTemplateUpdateStrategy" unknown)
    : state_template_update_strategy)

let resource_identifier_of_yojson = string_of_yojson

let state_template_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identifier = value_for_key resource_identifier_of_yojson "identifier" _list path;
     state_template_update_strategy =
       value_for_key state_template_update_strategy_of_yojson "stateTemplateUpdateStrategy" _list
         path;
   }
    : state_template_association)

let state_template_associations_of_yojson tree path =
  list_of_yojson state_template_association_of_yojson tree path

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let vehicle_association_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "CreateIotThing" -> CREATE_IOT_THING
    | `String "ValidateIotThingExists" -> VALIDATE_IOT_THING_EXISTS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "VehicleAssociationBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "VehicleAssociationBehavior")
     : vehicle_association_behavior)
    : vehicle_association_behavior)

let attribute_value_of_yojson = string_of_yojson
let attribute_name_of_yojson = string_of_yojson

let attributes_map_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

let create_vehicle_request_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
     model_manifest_arn = value_for_key arn_of_yojson "modelManifestArn" _list path;
     decoder_manifest_arn = value_for_key arn_of_yojson "decoderManifestArn" _list path;
     attributes = option_of_yojson (value_for_key attributes_map_of_yojson "attributes") _list path;
     association_behavior =
       option_of_yojson
         (value_for_key vehicle_association_behavior_of_yojson "associationBehavior")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     state_templates =
       option_of_yojson
         (value_for_key state_template_associations_of_yojson "stateTemplates")
         _list path;
   }
    : create_vehicle_request_item)

let create_vehicle_request_items_of_yojson tree path =
  list_of_yojson create_vehicle_request_item_of_yojson tree path

let batch_create_vehicle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vehicles = value_for_key create_vehicle_request_items_of_yojson "vehicles" _list path }
    : batch_create_vehicle_request)

let number_of_yojson = int_of_yojson

let update_vehicle_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicle_name = option_of_yojson (value_for_key vehicle_name_of_yojson "vehicleName") _list path;
     code = option_of_yojson (value_for_key number_of_yojson "code") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : update_vehicle_error)

let update_vehicle_errors_of_yojson tree path =
  list_of_yojson update_vehicle_error_of_yojson tree path

let update_vehicle_response_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicle_name = option_of_yojson (value_for_key vehicle_name_of_yojson "vehicleName") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
   }
    : update_vehicle_response_item)

let update_vehicle_response_items_of_yojson tree path =
  list_of_yojson update_vehicle_response_item_of_yojson tree path

let batch_update_vehicle_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicles =
       option_of_yojson
         (value_for_key update_vehicle_response_items_of_yojson "vehicles")
         _list path;
     errors = option_of_yojson (value_for_key update_vehicle_errors_of_yojson "errors") _list path;
   }
    : batch_update_vehicle_response)

let state_template_association_identifiers_of_yojson tree path =
  list_of_yojson resource_identifier_of_yojson tree path

let update_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "Overwrite" -> OVERWRITE
    | `String "Merge" -> MERGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "UpdateMode" value)
    | _ -> raise (deserialize_wrong_type_error path "UpdateMode")
     : update_mode)
    : update_mode)

let update_vehicle_request_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
     model_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "modelManifestArn") _list path;
     decoder_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "decoderManifestArn") _list path;
     attributes = option_of_yojson (value_for_key attributes_map_of_yojson "attributes") _list path;
     attribute_update_mode =
       option_of_yojson (value_for_key update_mode_of_yojson "attributeUpdateMode") _list path;
     state_templates_to_add =
       option_of_yojson
         (value_for_key state_template_associations_of_yojson "stateTemplatesToAdd")
         _list path;
     state_templates_to_remove =
       option_of_yojson
         (value_for_key state_template_association_identifiers_of_yojson "stateTemplatesToRemove")
         _list path;
     state_templates_to_update =
       option_of_yojson
         (value_for_key state_template_associations_of_yojson "stateTemplatesToUpdate")
         _list path;
   }
    : update_vehicle_request_item)

let update_vehicle_request_items_of_yojson tree path =
  list_of_yojson update_vehicle_request_item_of_yojson tree path

let batch_update_vehicle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vehicles = value_for_key update_vehicle_request_items_of_yojson "vehicles" _list path }
    : batch_update_vehicle_request)

let branch_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fully_qualified_name = value_for_key string__of_yojson "fullyQualifiedName" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     deprecation_message =
       option_of_yojson (value_for_key message_of_yojson "deprecationMessage") _list path;
     comment = option_of_yojson (value_for_key message_of_yojson "comment") _list path;
   }
    : branch)

let campaign_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "WAITING_FOR_APPROVAL" -> WAITING_FOR_APPROVAL
    | `String "RUNNING" -> RUNNING
    | `String "SUSPENDED" -> SUSPENDED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CampaignStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CampaignStatus")
     : campaign_status)
    : campaign_status)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let campaign_name_of_yojson = string_of_yojson
let campaign_arn_of_yojson = string_of_yojson

let campaign_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key campaign_arn_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key campaign_name_of_yojson "name") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     signal_catalog_arn =
       option_of_yojson (value_for_key arn_of_yojson "signalCatalogArn") _list path;
     target_arn = option_of_yojson (value_for_key arn_of_yojson "targetArn") _list path;
     status = option_of_yojson (value_for_key campaign_status_of_yojson "status") _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
   }
    : campaign_summary)

let model_signals_map_of_yojson tree path =
  map_of_yojson string__of_yojson string__of_yojson tree path

let network_file_blob_of_yojson = blob_of_yojson
let network_files_list_of_yojson tree path = list_of_yojson network_file_blob_of_yojson tree path
let interface_id_of_yojson = string_of_yojson

let can_dbc_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     network_interface = value_for_key interface_id_of_yojson "networkInterface" _list path;
     can_dbc_files = value_for_key network_files_list_of_yojson "canDbcFiles" _list path;
     signals_map =
       option_of_yojson (value_for_key model_signals_map_of_yojson "signalsMap") _list path;
   }
    : can_dbc_definition)

let protocol_version_of_yojson = string_of_yojson
let protocol_name_of_yojson = string_of_yojson
let can_interface_name_of_yojson = string_of_yojson

let can_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key can_interface_name_of_yojson "name" _list path;
     protocol_name =
       option_of_yojson (value_for_key protocol_name_of_yojson "protocolName") _list path;
     protocol_version =
       option_of_yojson (value_for_key protocol_version_of_yojson "protocolVersion") _list path;
   }
    : can_interface)

let signal_value_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTEGER" -> INTEGER
    | `String "FLOATING_POINT" -> FLOATING_POINT
    | `String value -> raise (deserialize_unknown_enum_value_error path "SignalValueType" value)
    | _ -> raise (deserialize_wrong_type_error path "SignalValueType")
     : signal_value_type)
    : signal_value_type)

let can_signal_name_of_yojson = string_of_yojson
let non_negative_integer_of_yojson = int_of_yojson

let can_signal_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message_id = value_for_key non_negative_integer_of_yojson "messageId" _list path;
     is_big_endian =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "isBigEndian" _list path;
     is_signed =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson "isSigned"
         _list path;
     start_bit = value_for_key non_negative_integer_of_yojson "startBit" _list path;
     offset = value_for_key double_of_yojson "offset" _list path;
     factor = value_for_key double_of_yojson "factor" _list path;
     length = value_for_key non_negative_integer_of_yojson "length" _list path;
     name = option_of_yojson (value_for_key can_signal_name_of_yojson "name") _list path;
     signal_value_type =
       option_of_yojson (value_for_key signal_value_type_of_yojson "signalValueType") _list path;
   }
    : can_signal)

let cloud_watch_log_group_name_of_yojson = string_of_yojson

let log_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "OFF" -> OFF
    | `String "ERROR" -> ERROR
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogType" value)
    | _ -> raise (deserialize_wrong_type_error path "LogType")
     : log_type)
    : log_type)

let cloud_watch_log_delivery_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_type = value_for_key log_type_of_yojson "logType" _list path;
     log_group_name =
       option_of_yojson
         (value_for_key cloud_watch_log_group_name_of_yojson "logGroupName")
         _list path;
   }
    : cloud_watch_log_delivery_options)

let language_version_of_yojson = int_of_yojson

let trigger_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALWAYS" -> ALWAYS
    | `String "RISING_EDGE" -> RISING_EDGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "TriggerMode" value)
    | _ -> raise (deserialize_wrong_type_error path "TriggerMode")
     : trigger_mode)
    : trigger_mode)

let uint32_of_yojson = long_of_yojson
let event_expression_of_yojson = string_of_yojson

let condition_based_collection_scheme_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expression = value_for_key event_expression_of_yojson "expression" _list path;
     minimum_trigger_interval_ms =
       option_of_yojson (value_for_key uint32_of_yojson "minimumTriggerIntervalMs") _list path;
     trigger_mode = option_of_yojson (value_for_key trigger_mode_of_yojson "triggerMode") _list path;
     condition_language_version =
       option_of_yojson
         (value_for_key language_version_of_yojson "conditionLanguageVersion")
         _list path;
   }
    : condition_based_collection_scheme)

let collection_period_ms_of_yojson = long_of_yojson

let time_based_collection_scheme_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ period_ms = value_for_key collection_period_ms_of_yojson "periodMs" _list path }
    : time_based_collection_scheme)

let collection_scheme_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "timeBasedCollectionScheme" ->
       TimeBasedCollectionScheme (time_based_collection_scheme_of_yojson value_ path)
   | "conditionBasedCollectionScheme" ->
       ConditionBasedCollectionScheme (condition_based_collection_scheme_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "CollectionScheme" unknown)
    : collection_scheme)

let compression_of_yojson (tree : t) path =
  ((match tree with
    | `String "OFF" -> OFF
    | `String "SNAPPY" -> SNAPPY
    | `String value -> raise (deserialize_unknown_enum_value_error path "Compression" value)
    | _ -> raise (deserialize_wrong_type_error path "Compression")
     : compression)
    : compression)

let fetch_config_event_expression_of_yojson = string_of_yojson

let condition_based_signal_fetch_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     condition_expression =
       value_for_key fetch_config_event_expression_of_yojson "conditionExpression" _list path;
     trigger_mode = value_for_key trigger_mode_of_yojson "triggerMode" _list path;
   }
    : condition_based_signal_fetch_config)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key string__of_yojson "message" _list path;
     resource = value_for_key string__of_yojson "resource" _list path;
     resource_type = value_for_key string__of_yojson "resourceType" _list path;
   }
    : conflict_exception)

let create_campaign_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key campaign_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key campaign_arn_of_yojson "arn") _list path;
   }
    : create_campaign_response)

let action_event_expression_of_yojson = string_of_yojson

let event_expression_list_of_yojson tree path =
  list_of_yojson action_event_expression_of_yojson tree path

let positive_long_of_yojson = long_of_yojson

let time_based_signal_fetch_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_frequency_ms =
       value_for_key positive_long_of_yojson "executionFrequencyMs" _list path;
   }
    : time_based_signal_fetch_config)

let signal_fetch_config_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "timeBased" -> TimeBased (time_based_signal_fetch_config_of_yojson value_ path)
   | "conditionBased" -> ConditionBased (condition_based_signal_fetch_config_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "SignalFetchConfig" unknown)
    : signal_fetch_config)

let signal_fetch_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fully_qualified_name = value_for_key node_path_of_yojson "fullyQualifiedName" _list path;
     signal_fetch_config =
       value_for_key signal_fetch_config_of_yojson "signalFetchConfig" _list path;
     condition_language_version =
       option_of_yojson
         (value_for_key language_version_of_yojson "conditionLanguageVersion")
         _list path;
     actions = value_for_key event_expression_list_of_yojson "actions" _list path;
   }
    : signal_fetch_information)

let signal_fetch_information_list_of_yojson tree path =
  list_of_yojson signal_fetch_information_of_yojson tree path

let data_partition_upload_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expression = value_for_key event_expression_of_yojson "expression" _list path;
     condition_language_version =
       option_of_yojson
         (value_for_key language_version_of_yojson "conditionLanguageVersion")
         _list path;
   }
    : data_partition_upload_options)

let storage_minimum_time_to_live_value_of_yojson = int_of_yojson

let storage_minimum_time_to_live_unit_of_yojson (tree : t) path =
  ((match tree with
    | `String "HOURS" -> HOURS
    | `String "DAYS" -> DAYS
    | `String "WEEKS" -> WEEKS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StorageMinimumTimeToLiveUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "StorageMinimumTimeToLiveUnit")
     : storage_minimum_time_to_live_unit)
    : storage_minimum_time_to_live_unit)

let storage_minimum_time_to_live_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unit_ = value_for_key storage_minimum_time_to_live_unit_of_yojson "unit" _list path;
     value = value_for_key storage_minimum_time_to_live_value_of_yojson "value" _list path;
   }
    : storage_minimum_time_to_live)

let storage_location_of_yojson = string_of_yojson
let storage_maximum_size_value_of_yojson = int_of_yojson

let storage_maximum_size_unit_of_yojson (tree : t) path =
  ((match tree with
    | `String "MB" -> MB
    | `String "GB" -> GB
    | `String "TB" -> TB
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StorageMaximumSizeUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "StorageMaximumSizeUnit")
     : storage_maximum_size_unit)
    : storage_maximum_size_unit)

let storage_maximum_size_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unit_ = value_for_key storage_maximum_size_unit_of_yojson "unit" _list path;
     value = value_for_key storage_maximum_size_value_of_yojson "value" _list path;
   }
    : storage_maximum_size)

let data_partition_storage_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     maximum_size = value_for_key storage_maximum_size_of_yojson "maximumSize" _list path;
     storage_location = value_for_key storage_location_of_yojson "storageLocation" _list path;
     minimum_time_to_live =
       value_for_key storage_minimum_time_to_live_of_yojson "minimumTimeToLive" _list path;
   }
    : data_partition_storage_options)

let data_partition_id_of_yojson = string_of_yojson

let data_partition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key data_partition_id_of_yojson "id" _list path;
     storage_options =
       value_for_key data_partition_storage_options_of_yojson "storageOptions" _list path;
     upload_options =
       option_of_yojson
         (value_for_key data_partition_upload_options_of_yojson "uploadOptions")
         _list path;
   }
    : data_partition)

let data_partitions_of_yojson tree path = list_of_yojson data_partition_of_yojson tree path
let iam_role_arn_of_yojson = string_of_yojson
let mqtt_topic_arn_of_yojson = string_of_yojson

let mqtt_topic_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mqtt_topic_arn = value_for_key mqtt_topic_arn_of_yojson "mqttTopicArn" _list path;
     execution_role_arn = value_for_key iam_role_arn_of_yojson "executionRoleArn" _list path;
   }
    : mqtt_topic_config)

let timestream_table_arn_of_yojson = string_of_yojson

let timestream_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestream_table_arn =
       value_for_key timestream_table_arn_of_yojson "timestreamTableArn" _list path;
     execution_role_arn = value_for_key iam_role_arn_of_yojson "executionRoleArn" _list path;
   }
    : timestream_config)

let prefix_of_yojson = string_of_yojson

let storage_compression_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "GZIP" -> GZIP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StorageCompressionFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "StorageCompressionFormat")
     : storage_compression_format)
    : storage_compression_format)

let data_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "JSON" -> JSON
    | `String "PARQUET" -> PARQUET
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "DataFormat")
     : data_format)
    : data_format)

let s3_bucket_arn_of_yojson = string_of_yojson

let s3_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket_arn = value_for_key s3_bucket_arn_of_yojson "bucketArn" _list path;
     data_format = option_of_yojson (value_for_key data_format_of_yojson "dataFormat") _list path;
     storage_compression_format =
       option_of_yojson
         (value_for_key storage_compression_format_of_yojson "storageCompressionFormat")
         _list path;
     prefix = option_of_yojson (value_for_key prefix_of_yojson "prefix") _list path;
   }
    : s3_config)

let data_destination_config_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "s3Config" -> S3Config (s3_config_of_yojson value_ path)
   | "timestreamConfig" -> TimestreamConfig (timestream_config_of_yojson value_ path)
   | "mqttTopicConfig" -> MqttTopicConfig (mqtt_topic_config_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "DataDestinationConfig" unknown)
    : data_destination_config)

let data_destination_configs_of_yojson tree path =
  list_of_yojson data_destination_config_of_yojson tree path

let data_extra_dimension_node_path_list_of_yojson tree path =
  list_of_yojson node_path_of_yojson tree path

let max_sample_count_of_yojson = long_of_yojson
let wildcard_signal_name_of_yojson = string_of_yojson

let signal_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key wildcard_signal_name_of_yojson "name" _list path;
     max_sample_count =
       option_of_yojson (value_for_key max_sample_count_of_yojson "maxSampleCount") _list path;
     minimum_sampling_interval_ms =
       option_of_yojson (value_for_key uint32_of_yojson "minimumSamplingIntervalMs") _list path;
     data_partition_id =
       option_of_yojson (value_for_key data_partition_id_of_yojson "dataPartitionId") _list path;
   }
    : signal_information)

let signal_information_list_of_yojson tree path =
  list_of_yojson signal_information_of_yojson tree path

let priority_of_yojson = int_of_yojson

let spooling_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "OFF" -> OFF
    | `String "TO_DISK" -> TO_DISK
    | `String value -> raise (deserialize_unknown_enum_value_error path "SpoolingMode" value)
    | _ -> raise (deserialize_wrong_type_error path "SpoolingMode")
     : spooling_mode)
    : spooling_mode)

let diagnostics_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "OFF" -> OFF
    | `String "SEND_ACTIVE_DTCS" -> SEND_ACTIVE_DTCS
    | `String value -> raise (deserialize_unknown_enum_value_error path "DiagnosticsMode" value)
    | _ -> raise (deserialize_wrong_type_error path "DiagnosticsMode")
     : diagnostics_mode)
    : diagnostics_mode)

let create_campaign_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key campaign_name_of_yojson "name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     signal_catalog_arn = value_for_key arn_of_yojson "signalCatalogArn" _list path;
     target_arn = value_for_key arn_of_yojson "targetArn" _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     expiry_time = option_of_yojson (value_for_key timestamp_of_yojson "expiryTime") _list path;
     post_trigger_collection_duration =
       option_of_yojson (value_for_key uint32_of_yojson "postTriggerCollectionDuration") _list path;
     diagnostics_mode =
       option_of_yojson (value_for_key diagnostics_mode_of_yojson "diagnosticsMode") _list path;
     spooling_mode =
       option_of_yojson (value_for_key spooling_mode_of_yojson "spoolingMode") _list path;
     compression = option_of_yojson (value_for_key compression_of_yojson "compression") _list path;
     priority = option_of_yojson (value_for_key priority_of_yojson "priority") _list path;
     signals_to_collect =
       option_of_yojson
         (value_for_key signal_information_list_of_yojson "signalsToCollect")
         _list path;
     collection_scheme = value_for_key collection_scheme_of_yojson "collectionScheme" _list path;
     data_extra_dimensions =
       option_of_yojson
         (value_for_key data_extra_dimension_node_path_list_of_yojson "dataExtraDimensions")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     data_destination_configs =
       option_of_yojson
         (value_for_key data_destination_configs_of_yojson "dataDestinationConfigs")
         _list path;
     data_partitions =
       option_of_yojson (value_for_key data_partitions_of_yojson "dataPartitions") _list path;
     signals_to_fetch =
       option_of_yojson
         (value_for_key signal_fetch_information_list_of_yojson "signalsToFetch")
         _list path;
   }
    : create_campaign_request)

let network_interface_failure_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "DUPLICATE_NETWORK_INTERFACE" -> DUPLICATE_INTERFACE
    | `String "CONFLICTING_NETWORK_INTERFACE" -> CONFLICTING_NETWORK_INTERFACE
    | `String "NETWORK_INTERFACE_TO_ADD_ALREADY_EXISTS" -> NETWORK_INTERFACE_TO_ADD_ALREADY_EXISTS
    | `String "CAN_NETWORK_INTERFACE_INFO_IS_NULL" -> CAN_NETWORK_INTERFACE_INFO_IS_NULL
    | `String "OBD_NETWORK_INTERFACE_INFO_IS_NULL" -> OBD_NETWORK_INTERFACE_INFO_IS_NULL
    | `String "NETWORK_INTERFACE_TO_REMOVE_ASSOCIATED_WITH_SIGNALS" ->
        NETWORK_INTERFACE_TO_REMOVE_ASSOCIATED_WITH_SIGNALS
    | `String "VEHICLE_MIDDLEWARE_NETWORK_INTERFACE_INFO_IS_NULL" ->
        VEHICLE_MIDDLEWARE_NETWORK_INTERFACE_INFO_IS_NULL
    | `String "CUSTOM_DECODING_SIGNAL_NETWORK_INTERFACE_INFO_IS_NULL" ->
        CUSTOM_DECODING_SIGNAL_NETWORK_INTERFACE_INFO_IS_NULL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NetworkInterfaceFailureReason" value)
    | _ -> raise (deserialize_wrong_type_error path "NetworkInterfaceFailureReason")
     : network_interface_failure_reason)
    : network_interface_failure_reason)

let invalid_network_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     interface_id = option_of_yojson (value_for_key interface_id_of_yojson "interfaceId") _list path;
     reason =
       option_of_yojson
         (value_for_key network_interface_failure_reason_of_yojson "reason")
         _list path;
   }
    : invalid_network_interface)

let invalid_network_interfaces_of_yojson tree path =
  list_of_yojson invalid_network_interface_of_yojson tree path

let signal_decoder_failure_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "DUPLICATE_SIGNAL" -> DUPLICATE_SIGNAL
    | `String "CONFLICTING_SIGNAL" -> CONFLICTING_SIGNAL
    | `String "SIGNAL_TO_ADD_ALREADY_EXISTS" -> SIGNAL_TO_ADD_ALREADY_EXISTS
    | `String "SIGNAL_NOT_ASSOCIATED_WITH_NETWORK_INTERFACE" ->
        SIGNAL_NOT_ASSOCIATED_WITH_NETWORK_INTERFACE
    | `String "NETWORK_INTERFACE_TYPE_INCOMPATIBLE_WITH_SIGNAL_DECODER_TYPE" ->
        NETWORK_INTERFACE_TYPE_INCOMPATIBLE_WITH_SIGNAL_DECODER_TYPE
    | `String "SIGNAL_NOT_IN_MODEL" -> SIGNAL_NOT_IN_MODEL
    | `String "CAN_SIGNAL_INFO_IS_NULL" -> CAN_SIGNAL_INFO_IS_NULL
    | `String "OBD_SIGNAL_INFO_IS_NULL" -> OBD_SIGNAL_INFO_IS_NULL
    | `String "NO_DECODER_INFO_FOR_SIGNAL_IN_MODEL" -> NO_DECODER_INFO_FOR_SIGNAL_IN_MODEL
    | `String "MESSAGE_SIGNAL_INFO_IS_NULL" -> MESSAGE_SIGNAL_INFO_IS_NULL
    | `String "SIGNAL_DECODER_TYPE_INCOMPATIBLE_WITH_MESSAGE_SIGNAL_TYPE" ->
        SIGNAL_DECODER_TYPE_INCOMPATIBLE_WITH_MESSAGE_SIGNAL_TYPE
    | `String "STRUCT_SIZE_MISMATCH" -> STRUCT_SIZE_MISMATCH
    | `String "NO_SIGNAL_IN_CATALOG_FOR_DECODER_SIGNAL" -> NO_SIGNAL_IN_CATALOG_FOR_DECODER_SIGNAL
    | `String "SIGNAL_DECODER_INCOMPATIBLE_WITH_SIGNAL_CATALOG" ->
        SIGNAL_DECODER_INCOMPATIBLE_WITH_SIGNAL_CATALOG
    | `String "EMPTY_MESSAGE_SIGNAL" -> EMPTY_MESSAGE_SIGNAL
    | `String "CUSTOM_DECODING_SIGNAL_INFO_IS_NULL" -> CUSTOM_DECODING_SIGNAL_INFO_IS_NULL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SignalDecoderFailureReason" value)
    | _ -> raise (deserialize_wrong_type_error path "SignalDecoderFailureReason")
     : signal_decoder_failure_reason)
    : signal_decoder_failure_reason)

let fully_qualified_name_of_yojson = string_of_yojson

let invalid_signal_decoder_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key fully_qualified_name_of_yojson "name") _list path;
     reason =
       option_of_yojson (value_for_key signal_decoder_failure_reason_of_yojson "reason") _list path;
     hint = option_of_yojson (value_for_key message_of_yojson "hint") _list path;
   }
    : invalid_signal_decoder)

let invalid_signal_decoders_of_yojson tree path =
  list_of_yojson invalid_signal_decoder_of_yojson tree path

let decoder_manifest_validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invalid_signals =
       option_of_yojson
         (value_for_key invalid_signal_decoders_of_yojson "invalidSignals")
         _list path;
     invalid_network_interfaces =
       option_of_yojson
         (value_for_key invalid_network_interfaces_of_yojson "invalidNetworkInterfaces")
         _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : decoder_manifest_validation_exception)

let resource_name_of_yojson = string_of_yojson

let create_decoder_manifest_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : create_decoder_manifest_response)

let default_for_unmapped_signals_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUSTOM_DECODING" -> CUSTOM_DECODING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DefaultForUnmappedSignalsType" value)
    | _ -> raise (deserialize_wrong_type_error path "DefaultForUnmappedSignalsType")
     : default_for_unmapped_signals_type)
    : default_for_unmapped_signals_type)

let custom_decoding_signal_interface_name_of_yojson = string_of_yojson

let custom_decoding_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key custom_decoding_signal_interface_name_of_yojson "name" _list path }
    : custom_decoding_interface)

let vehicle_middleware_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "ROS_2" -> ROS_2
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "VehicleMiddlewareProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "VehicleMiddlewareProtocol")
     : vehicle_middleware_protocol)
    : vehicle_middleware_protocol)

let vehicle_middleware_name_of_yojson = string_of_yojson

let vehicle_middleware_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key vehicle_middleware_name_of_yojson "name" _list path;
     protocol_name = value_for_key vehicle_middleware_protocol_of_yojson "protocolName" _list path;
   }
    : vehicle_middleware)

let obd_standard_of_yojson = string_of_yojson
let obd_interface_name_of_yojson = string_of_yojson

let obd_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key obd_interface_name_of_yojson "name" _list path;
     request_message_id = value_for_key non_negative_integer_of_yojson "requestMessageId" _list path;
     obd_standard = option_of_yojson (value_for_key obd_standard_of_yojson "obdStandard") _list path;
     pid_request_interval_seconds =
       option_of_yojson
         (value_for_key non_negative_integer_of_yojson "pidRequestIntervalSeconds")
         _list path;
     dtc_request_interval_seconds =
       option_of_yojson
         (value_for_key non_negative_integer_of_yojson "dtcRequestIntervalSeconds")
         _list path;
     use_extended_ids =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "useExtendedIds")
         _list path;
     has_transmission_ecu =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "hasTransmissionEcu")
         _list path;
   }
    : obd_interface)

let network_interface_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CAN_INTERFACE" -> CAN_INTERFACE
    | `String "OBD_INTERFACE" -> OBD_INTERFACE
    | `String "VEHICLE_MIDDLEWARE" -> VEHICLE_MIDDLEWARE
    | `String "CUSTOM_DECODING_INTERFACE" -> CUSTOM_DECODING_INTERFACE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NetworkInterfaceType" value)
    | _ -> raise (deserialize_wrong_type_error path "NetworkInterfaceType")
     : network_interface_type)
    : network_interface_type)

let network_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     interface_id = value_for_key interface_id_of_yojson "interfaceId" _list path;
     type_ = value_for_key network_interface_type_of_yojson "type" _list path;
     can_interface =
       option_of_yojson (value_for_key can_interface_of_yojson "canInterface") _list path;
     obd_interface =
       option_of_yojson (value_for_key obd_interface_of_yojson "obdInterface") _list path;
     vehicle_middleware =
       option_of_yojson (value_for_key vehicle_middleware_of_yojson "vehicleMiddleware") _list path;
     custom_decoding_interface =
       option_of_yojson
         (value_for_key custom_decoding_interface_of_yojson "customDecodingInterface")
         _list path;
   }
    : network_interface)

let network_interfaces_of_yojson tree path = list_of_yojson network_interface_of_yojson tree path
let custom_decoding_id_of_yojson = string_of_yojson

let custom_decoding_signal_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key custom_decoding_id_of_yojson "id" _list path } : custom_decoding_signal)

let structure_message_name_of_yojson = string_of_yojson

let structured_message_list_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FIXED_CAPACITY" -> FIXED_CAPACITY
    | `String "DYNAMIC_UNBOUNDED_CAPACITY" -> DYNAMIC_UNBOUNDED_CAPACITY
    | `String "DYNAMIC_BOUNDED_CAPACITY" -> DYNAMIC_BOUNDED_CAPACITY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StructuredMessageListType" value)
    | _ -> raise (deserialize_wrong_type_error path "StructuredMessageListType")
     : structured_message_list_type)
    : structured_message_list_type)

let max_string_size_of_yojson = long_of_yojson

let ros2_primitive_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BOOL" -> BOOL
    | `String "BYTE" -> BYTE
    | `String "CHAR" -> CHAR
    | `String "FLOAT32" -> FLOAT32
    | `String "FLOAT64" -> FLOAT64
    | `String "INT8" -> INT8
    | `String "UINT8" -> UINT8
    | `String "INT16" -> INT16
    | `String "UINT16" -> UINT16
    | `String "INT32" -> INT32
    | `String "UINT32" -> UINT32
    | `String "INT64" -> INT64
    | `String "UINT64" -> UINT64
    | `String "STRING" -> STRING
    | `String "WSTRING" -> WSTRING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ROS2PrimitiveType" value)
    | _ -> raise (deserialize_wrong_type_error path "ROS2PrimitiveType")
     : ros2_primitive_type)
    : ros2_primitive_type)

let ros2_primitive_message_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     primitive_type = value_for_key ros2_primitive_type_of_yojson "primitiveType" _list path;
     offset = option_of_yojson (value_for_key double_of_yojson "offset") _list path;
     scaling = option_of_yojson (value_for_key double_of_yojson "scaling") _list path;
     upper_bound =
       option_of_yojson (value_for_key max_string_size_of_yojson "upperBound") _list path;
   }
    : ros2_primitive_message_definition)

let primitive_message_definition_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "ros2PrimitiveMessageDefinition" ->
       Ros2PrimitiveMessageDefinition (ros2_primitive_message_definition_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "PrimitiveMessageDefinition" unknown)
    : primitive_message_definition)

let rec structured_message_list_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key structure_message_name_of_yojson "name" _list path;
     member_type = value_for_key structured_message_of_yojson "memberType" _list path;
     list_type = value_for_key structured_message_list_type_of_yojson "listType" _list path;
     capacity =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "capacity") _list path;
   }
    : structured_message_list_definition)

and structured_message_field_name_and_data_type_pair_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_name = value_for_key structure_message_name_of_yojson "fieldName" _list path;
     data_type = value_for_key structured_message_of_yojson "dataType" _list path;
   }
    : structured_message_field_name_and_data_type_pair)

and structured_message_definition_of_yojson tree path =
  list_of_yojson structured_message_field_name_and_data_type_pair_of_yojson tree path

and structured_message_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "primitiveMessageDefinition" ->
       PrimitiveMessageDefinition (primitive_message_definition_of_yojson value_ path)
   | "structuredMessageListDefinition" ->
       StructuredMessageListDefinition (structured_message_list_definition_of_yojson value_ path)
   | "structuredMessageDefinition" ->
       StructuredMessageDefinition (structured_message_definition_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "StructuredMessage" unknown)
    : structured_message)

let topic_name_of_yojson = string_of_yojson

let message_signal_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     topic_name = value_for_key topic_name_of_yojson "topicName" _list path;
     structured_message = value_for_key structured_message_of_yojson "structuredMessage" _list path;
   }
    : message_signal)

let obd_bitmask_length_of_yojson = int_of_yojson
let obd_byte_length_of_yojson = int_of_yojson

let obd_signal_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pid_response_length = value_for_key positive_integer_of_yojson "pidResponseLength" _list path;
     service_mode = value_for_key non_negative_integer_of_yojson "serviceMode" _list path;
     pid = value_for_key non_negative_integer_of_yojson "pid" _list path;
     scaling = value_for_key double_of_yojson "scaling" _list path;
     offset = value_for_key double_of_yojson "offset" _list path;
     start_byte = value_for_key non_negative_integer_of_yojson "startByte" _list path;
     byte_length = value_for_key obd_byte_length_of_yojson "byteLength" _list path;
     bit_right_shift =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "bitRightShift") _list path;
     bit_mask_length =
       option_of_yojson (value_for_key obd_bitmask_length_of_yojson "bitMaskLength") _list path;
     is_signed =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "isSigned")
         _list path;
     signal_value_type =
       option_of_yojson (value_for_key signal_value_type_of_yojson "signalValueType") _list path;
   }
    : obd_signal)

let signal_decoder_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CAN_SIGNAL" -> CAN_SIGNAL
    | `String "OBD_SIGNAL" -> OBD_SIGNAL
    | `String "MESSAGE_SIGNAL" -> MESSAGE_SIGNAL
    | `String "CUSTOM_DECODING_SIGNAL" -> CUSTOM_DECODING_SIGNAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "SignalDecoderType" value)
    | _ -> raise (deserialize_wrong_type_error path "SignalDecoderType")
     : signal_decoder_type)
    : signal_decoder_type)

let signal_decoder_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fully_qualified_name =
       value_for_key fully_qualified_name_of_yojson "fullyQualifiedName" _list path;
     type_ = value_for_key signal_decoder_type_of_yojson "type" _list path;
     interface_id = value_for_key interface_id_of_yojson "interfaceId" _list path;
     can_signal = option_of_yojson (value_for_key can_signal_of_yojson "canSignal") _list path;
     obd_signal = option_of_yojson (value_for_key obd_signal_of_yojson "obdSignal") _list path;
     message_signal =
       option_of_yojson (value_for_key message_signal_of_yojson "messageSignal") _list path;
     custom_decoding_signal =
       option_of_yojson
         (value_for_key custom_decoding_signal_of_yojson "customDecodingSignal")
         _list path;
   }
    : signal_decoder)

let signal_decoders_of_yojson tree path = list_of_yojson signal_decoder_of_yojson tree path

let create_decoder_manifest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     model_manifest_arn = value_for_key arn_of_yojson "modelManifestArn" _list path;
     signal_decoders =
       option_of_yojson (value_for_key signal_decoders_of_yojson "signalDecoders") _list path;
     network_interfaces =
       option_of_yojson (value_for_key network_interfaces_of_yojson "networkInterfaces") _list path;
     default_for_unmapped_signals =
       option_of_yojson
         (value_for_key default_for_unmapped_signals_type_of_yojson "defaultForUnmappedSignals")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_decoder_manifest_request)

let create_fleet_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key fleet_id_of_yojson "id" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : create_fleet_response)

let create_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_of_yojson "fleetId" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     signal_catalog_arn = value_for_key arn_of_yojson "signalCatalogArn" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_fleet_request)

let invalid_signal_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key fully_qualified_name_of_yojson "name") _list path;
     reason = option_of_yojson (value_for_key string__of_yojson "reason") _list path;
   }
    : invalid_signal)

let invalid_signals_of_yojson tree path = list_of_yojson invalid_signal_of_yojson tree path

let invalid_signals_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     invalid_signals =
       option_of_yojson (value_for_key invalid_signals_of_yojson "invalidSignals") _list path;
   }
    : invalid_signals_exception)

let create_model_manifest_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : create_model_manifest_response)

let create_model_manifest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     nodes = value_for_key list_of_strings_of_yojson "nodes" _list path;
     signal_catalog_arn = value_for_key arn_of_yojson "signalCatalogArn" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_model_manifest_request)

let node_data_encoding_of_yojson (tree : t) path =
  ((match tree with
    | `String "BINARY" -> BINARY
    | `String "TYPED" -> TYPED
    | `String value -> raise (deserialize_unknown_enum_value_error path "NodeDataEncoding" value)
    | _ -> raise (deserialize_wrong_type_error path "NodeDataEncoding")
     : node_data_encoding)
    : node_data_encoding)

let custom_property_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fully_qualified_name = value_for_key string__of_yojson "fullyQualifiedName" _list path;
     data_type = value_for_key node_data_type_of_yojson "dataType" _list path;
     data_encoding =
       option_of_yojson (value_for_key node_data_encoding_of_yojson "dataEncoding") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     deprecation_message =
       option_of_yojson (value_for_key message_of_yojson "deprecationMessage") _list path;
     comment = option_of_yojson (value_for_key message_of_yojson "comment") _list path;
     struct_fully_qualified_name =
       option_of_yojson (value_for_key node_path_of_yojson "structFullyQualifiedName") _list path;
   }
    : custom_property)

let custom_struct_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fully_qualified_name = value_for_key string__of_yojson "fullyQualifiedName" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     deprecation_message =
       option_of_yojson (value_for_key message_of_yojson "deprecationMessage") _list path;
     comment = option_of_yojson (value_for_key message_of_yojson "comment") _list path;
   }
    : custom_struct)

let sensor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fully_qualified_name = value_for_key string__of_yojson "fullyQualifiedName" _list path;
     data_type = value_for_key node_data_type_of_yojson "dataType" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     unit_ = option_of_yojson (value_for_key string__of_yojson "unit") _list path;
     allowed_values =
       option_of_yojson (value_for_key list_of_strings_of_yojson "allowedValues") _list path;
     min = option_of_yojson (value_for_key double_of_yojson "min") _list path;
     max = option_of_yojson (value_for_key double_of_yojson "max") _list path;
     deprecation_message =
       option_of_yojson (value_for_key message_of_yojson "deprecationMessage") _list path;
     comment = option_of_yojson (value_for_key message_of_yojson "comment") _list path;
     struct_fully_qualified_name =
       option_of_yojson (value_for_key node_path_of_yojson "structFullyQualifiedName") _list path;
   }
    : sensor)

let node_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "branch" -> Branch (branch_of_yojson value_ path)
   | "sensor" -> Sensor (sensor_of_yojson value_ path)
   | "actuator" -> Actuator (actuator_of_yojson value_ path)
   | "attribute" -> Attribute (attribute_of_yojson value_ path)
   | "struct" -> Struct (custom_struct_of_yojson value_ path)
   | "property" -> Property (custom_property_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "Node" unknown)
    : node)

let nodes_of_yojson tree path = list_of_yojson node_of_yojson tree path

let invalid_node_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invalid_nodes = option_of_yojson (value_for_key nodes_of_yojson "invalidNodes") _list path;
     reason = option_of_yojson (value_for_key string__of_yojson "reason") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : invalid_node_exception)

let create_signal_catalog_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : create_signal_catalog_response)

let create_signal_catalog_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     nodes = option_of_yojson (value_for_key nodes_of_yojson "nodes") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_signal_catalog_request)

let resource_unique_id_of_yojson = string_of_yojson

let create_state_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     id = option_of_yojson (value_for_key resource_unique_id_of_yojson "id") _list path;
   }
    : create_state_template_response)

let state_template_metadata_extra_dimension_node_path_list_of_yojson tree path =
  list_of_yojson node_path_of_yojson tree path

let state_template_data_extra_dimension_node_path_list_of_yojson tree path =
  list_of_yojson node_path_of_yojson tree path

let state_template_properties_of_yojson tree path = list_of_yojson node_path_of_yojson tree path

let create_state_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     signal_catalog_arn = value_for_key arn_of_yojson "signalCatalogArn" _list path;
     state_template_properties =
       value_for_key state_template_properties_of_yojson "stateTemplateProperties" _list path;
     data_extra_dimensions =
       option_of_yojson
         (value_for_key state_template_data_extra_dimension_node_path_list_of_yojson
            "dataExtraDimensions")
         _list path;
     metadata_extra_dimensions =
       option_of_yojson
         (value_for_key state_template_metadata_extra_dimension_node_path_list_of_yojson
            "metadataExtraDimensions")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_state_template_request)

let create_vehicle_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicle_name = option_of_yojson (value_for_key vehicle_name_of_yojson "vehicleName") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     thing_arn = option_of_yojson (value_for_key arn_of_yojson "thingArn") _list path;
   }
    : create_vehicle_response)

let create_vehicle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
     model_manifest_arn = value_for_key arn_of_yojson "modelManifestArn" _list path;
     decoder_manifest_arn = value_for_key arn_of_yojson "decoderManifestArn" _list path;
     attributes = option_of_yojson (value_for_key attributes_map_of_yojson "attributes") _list path;
     association_behavior =
       option_of_yojson
         (value_for_key vehicle_association_behavior_of_yojson "associationBehavior")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     state_templates =
       option_of_yojson
         (value_for_key state_template_associations_of_yojson "stateTemplates")
         _list path;
   }
    : create_vehicle_request)

let manifest_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "DRAFT" -> DRAFT
    | `String "INVALID" -> INVALID
    | `String "VALIDATING" -> VALIDATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ManifestStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ManifestStatus")
     : manifest_status)
    : manifest_status)

let decoder_manifest_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     model_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "modelManifestArn") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     status = option_of_yojson (value_for_key manifest_status_of_yojson "status") _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
   }
    : decoder_manifest_summary)

let delete_campaign_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key campaign_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key campaign_arn_of_yojson "arn") _list path;
   }
    : delete_campaign_response)

let delete_campaign_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key campaign_name_of_yojson "name" _list path } : delete_campaign_request)

let delete_decoder_manifest_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : delete_decoder_manifest_response)

let delete_decoder_manifest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path }
    : delete_decoder_manifest_request)

let delete_fleet_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key fleet_id_of_yojson "id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
   }
    : delete_fleet_response)

let delete_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fleet_id = value_for_key fleet_id_of_yojson "fleetId" _list path } : delete_fleet_request)

let delete_model_manifest_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : delete_model_manifest_response)

let delete_model_manifest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path }
    : delete_model_manifest_request)

let delete_signal_catalog_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : delete_signal_catalog_response)

let delete_signal_catalog_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path }
    : delete_signal_catalog_request)

let delete_state_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     id = option_of_yojson (value_for_key resource_unique_id_of_yojson "id") _list path;
   }
    : delete_state_template_response)

let delete_state_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key resource_identifier_of_yojson "identifier" _list path }
    : delete_state_template_request)

let delete_vehicle_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : delete_vehicle_response)

let delete_vehicle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path }
    : delete_vehicle_request)

let disassociate_vehicle_fleet_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_vehicle_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
     fleet_id = value_for_key fleet_id_of_yojson "fleetId" _list path;
   }
    : disassociate_vehicle_fleet_request)

let encryption_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "SUCCESS" -> SUCCESS
    | `String "FAILURE" -> FAILURE
    | `String value -> raise (deserialize_unknown_enum_value_error path "EncryptionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionStatus")
     : encryption_status)
    : encryption_status)

let encryption_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "KMS_BASED_ENCRYPTION" -> KMS_BASED_ENCRYPTION
    | `String "FLEETWISE_DEFAULT_ENCRYPTION" -> FLEETWISE_DEFAULT_ENCRYPTION
    | `String value -> raise (deserialize_unknown_enum_value_error path "EncryptionType" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionType")
     : encryption_type)
    : encryption_type)

let fleet_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key fleet_id_of_yojson "id" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     signal_catalog_arn = value_for_key arn_of_yojson "signalCatalogArn" _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastModificationTime") _list path;
   }
    : fleet_summary)

let formatted_vss_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "vssJson" -> VssJson (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "FormattedVss" unknown)
    : formatted_vss)

let fqns_of_yojson tree path = list_of_yojson fully_qualified_name_of_yojson tree path

let get_campaign_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key campaign_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key campaign_arn_of_yojson "arn") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     signal_catalog_arn =
       option_of_yojson (value_for_key arn_of_yojson "signalCatalogArn") _list path;
     target_arn = option_of_yojson (value_for_key arn_of_yojson "targetArn") _list path;
     status = option_of_yojson (value_for_key campaign_status_of_yojson "status") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     expiry_time = option_of_yojson (value_for_key timestamp_of_yojson "expiryTime") _list path;
     post_trigger_collection_duration =
       option_of_yojson (value_for_key uint32_of_yojson "postTriggerCollectionDuration") _list path;
     diagnostics_mode =
       option_of_yojson (value_for_key diagnostics_mode_of_yojson "diagnosticsMode") _list path;
     spooling_mode =
       option_of_yojson (value_for_key spooling_mode_of_yojson "spoolingMode") _list path;
     compression = option_of_yojson (value_for_key compression_of_yojson "compression") _list path;
     priority = option_of_yojson (value_for_key priority_of_yojson "priority") _list path;
     signals_to_collect =
       option_of_yojson
         (value_for_key signal_information_list_of_yojson "signalsToCollect")
         _list path;
     collection_scheme =
       option_of_yojson (value_for_key collection_scheme_of_yojson "collectionScheme") _list path;
     data_extra_dimensions =
       option_of_yojson
         (value_for_key data_extra_dimension_node_path_list_of_yojson "dataExtraDimensions")
         _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastModificationTime") _list path;
     data_destination_configs =
       option_of_yojson
         (value_for_key data_destination_configs_of_yojson "dataDestinationConfigs")
         _list path;
     data_partitions =
       option_of_yojson (value_for_key data_partitions_of_yojson "dataPartitions") _list path;
     signals_to_fetch =
       option_of_yojson
         (value_for_key signal_fetch_information_list_of_yojson "signalsToFetch")
         _list path;
   }
    : get_campaign_response)

let get_campaign_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key campaign_name_of_yojson "name" _list path } : get_campaign_request)

let get_decoder_manifest_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key string__of_yojson "name" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     model_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "modelManifestArn") _list path;
     status = option_of_yojson (value_for_key manifest_status_of_yojson "status") _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
   }
    : get_decoder_manifest_response)

let get_decoder_manifest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path }
    : get_decoder_manifest_request)

let error_message_of_yojson = string_of_yojson

let get_encryption_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "kmsKeyId")
         _list path;
     encryption_status = value_for_key encryption_status_of_yojson "encryptionStatus" _list path;
     encryption_type = value_for_key encryption_type_of_yojson "encryptionType" _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "errorMessage") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastModificationTime") _list path;
   }
    : get_encryption_configuration_response)

let get_encryption_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let get_fleet_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key fleet_id_of_yojson "id" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     signal_catalog_arn = value_for_key arn_of_yojson "signalCatalogArn" _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
   }
    : get_fleet_response)

let get_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fleet_id = value_for_key fleet_id_of_yojson "fleetId" _list path } : get_fleet_request)

let get_logging_options_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_watch_log_delivery =
       value_for_key cloud_watch_log_delivery_options_of_yojson "cloudWatchLogDelivery" _list path;
   }
    : get_logging_options_response)

let get_logging_options_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let get_model_manifest_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     signal_catalog_arn =
       option_of_yojson (value_for_key arn_of_yojson "signalCatalogArn") _list path;
     status = option_of_yojson (value_for_key manifest_status_of_yojson "status") _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
   }
    : get_model_manifest_response)

let get_model_manifest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path } : get_model_manifest_request)

let registration_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "REGISTRATION_PENDING" -> REGISTRATION_PENDING
    | `String "REGISTRATION_SUCCESS" -> REGISTRATION_SUCCESS
    | `String "REGISTRATION_FAILURE" -> REGISTRATION_FAILURE
    | `String value -> raise (deserialize_unknown_enum_value_error path "RegistrationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RegistrationStatus")
     : registration_status)
    : registration_status)

let iam_registration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn = value_for_key arn_of_yojson "roleArn" _list path;
     registration_status =
       value_for_key registration_status_of_yojson "registrationStatus" _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "errorMessage") _list path;
   }
    : iam_registration_response)

let timestream_table_name_of_yojson = string_of_yojson
let timestream_database_name_of_yojson = string_of_yojson

let timestream_registration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestream_database_name =
       value_for_key timestream_database_name_of_yojson "timestreamDatabaseName" _list path;
     timestream_table_name =
       value_for_key timestream_table_name_of_yojson "timestreamTableName" _list path;
     timestream_database_arn =
       option_of_yojson (value_for_key arn_of_yojson "timestreamDatabaseArn") _list path;
     timestream_table_arn =
       option_of_yojson (value_for_key arn_of_yojson "timestreamTableArn") _list path;
     registration_status =
       value_for_key registration_status_of_yojson "registrationStatus" _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "errorMessage") _list path;
   }
    : timestream_registration_response)

let customer_account_id_of_yojson = string_of_yojson

let get_register_account_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     customer_account_id =
       value_for_key customer_account_id_of_yojson "customerAccountId" _list path;
     account_status = value_for_key registration_status_of_yojson "accountStatus" _list path;
     timestream_registration_response =
       option_of_yojson
         (value_for_key timestream_registration_response_of_yojson "timestreamRegistrationResponse")
         _list path;
     iam_registration_response =
       value_for_key iam_registration_response_of_yojson "iamRegistrationResponse" _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
   }
    : get_register_account_status_response)

let get_register_account_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let node_counts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_nodes = option_of_yojson (value_for_key number_of_yojson "totalNodes") _list path;
     total_branches = option_of_yojson (value_for_key number_of_yojson "totalBranches") _list path;
     total_sensors = option_of_yojson (value_for_key number_of_yojson "totalSensors") _list path;
     total_attributes =
       option_of_yojson (value_for_key number_of_yojson "totalAttributes") _list path;
     total_actuators = option_of_yojson (value_for_key number_of_yojson "totalActuators") _list path;
     total_structs = option_of_yojson (value_for_key number_of_yojson "totalStructs") _list path;
     total_properties =
       option_of_yojson (value_for_key number_of_yojson "totalProperties") _list path;
   }
    : node_counts)

let get_signal_catalog_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     node_counts = option_of_yojson (value_for_key node_counts_of_yojson "nodeCounts") _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
   }
    : get_signal_catalog_response)

let get_signal_catalog_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path } : get_signal_catalog_request)

let get_state_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     signal_catalog_arn =
       option_of_yojson (value_for_key arn_of_yojson "signalCatalogArn") _list path;
     state_template_properties =
       option_of_yojson
         (value_for_key state_template_properties_of_yojson "stateTemplateProperties")
         _list path;
     data_extra_dimensions =
       option_of_yojson
         (value_for_key state_template_data_extra_dimension_node_path_list_of_yojson
            "dataExtraDimensions")
         _list path;
     metadata_extra_dimensions =
       option_of_yojson
         (value_for_key state_template_metadata_extra_dimension_node_path_list_of_yojson
            "metadataExtraDimensions")
         _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastModificationTime") _list path;
     id = option_of_yojson (value_for_key resource_unique_id_of_yojson "id") _list path;
   }
    : get_state_template_response)

let get_state_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key resource_identifier_of_yojson "identifier" _list path }
    : get_state_template_request)

let get_vehicle_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicle_name = option_of_yojson (value_for_key vehicle_name_of_yojson "vehicleName") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     model_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "modelManifestArn") _list path;
     decoder_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "decoderManifestArn") _list path;
     attributes = option_of_yojson (value_for_key attributes_map_of_yojson "attributes") _list path;
     state_templates =
       option_of_yojson
         (value_for_key state_template_associations_of_yojson "stateTemplates")
         _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastModificationTime") _list path;
   }
    : get_vehicle_response)

let get_vehicle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path }
    : get_vehicle_request)

let next_token_of_yojson = string_of_yojson

let vehicle_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATED" -> CREATED
    | `String "READY" -> READY
    | `String "HEALTHY" -> HEALTHY
    | `String "SUSPENDED" -> SUSPENDED
    | `String "DELETING" -> DELETING
    | `String "READY_FOR_CHECKIN" -> READY_FOR_CHECKIN
    | `String value -> raise (deserialize_unknown_enum_value_error path "VehicleState" value)
    | _ -> raise (deserialize_wrong_type_error path "VehicleState")
     : vehicle_state)
    : vehicle_state)

let vehicle_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     campaign_name =
       option_of_yojson (value_for_key campaign_name_of_yojson "campaignName") _list path;
     vehicle_name = option_of_yojson (value_for_key vehicle_name_of_yojson "vehicleName") _list path;
     status = option_of_yojson (value_for_key vehicle_state_of_yojson "status") _list path;
   }
    : vehicle_status)

let vehicle_status_list_of_yojson tree path = list_of_yojson vehicle_status_of_yojson tree path

let get_vehicle_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     campaigns =
       option_of_yojson (value_for_key vehicle_status_list_of_yojson "campaigns") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_vehicle_status_response)

let max_results_of_yojson = int_of_yojson

let get_vehicle_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
   }
    : get_vehicle_status_request)

let iam_resources_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ role_arn = value_for_key iam_role_arn_of_yojson "roleArn" _list path } : iam_resources)

let import_decoder_manifest_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : import_decoder_manifest_response)

let network_file_definition_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "canDbc" -> CanDbc (can_dbc_definition_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "NetworkFileDefinition" unknown)
    : network_file_definition)

let network_file_definitions_of_yojson tree path =
  list_of_yojson network_file_definition_of_yojson tree path

let import_decoder_manifest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     network_file_definitions =
       value_for_key network_file_definitions_of_yojson "networkFileDefinitions" _list path;
   }
    : import_decoder_manifest_request)

let import_signal_catalog_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : import_signal_catalog_response)

let import_signal_catalog_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     vss = option_of_yojson (value_for_key formatted_vss_of_yojson "vss") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : import_signal_catalog_request)

let interface_ids_of_yojson tree path = list_of_yojson interface_id_of_yojson tree path

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let timestream_resources_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestream_database_name =
       value_for_key timestream_database_name_of_yojson "timestreamDatabaseName" _list path;
     timestream_table_name =
       value_for_key timestream_table_name_of_yojson "timestreamTableName" _list path;
   }
    : timestream_resources)

let register_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     register_account_status =
       value_for_key registration_status_of_yojson "registerAccountStatus" _list path;
     timestream_resources =
       option_of_yojson
         (value_for_key timestream_resources_of_yojson "timestreamResources")
         _list path;
     iam_resources = value_for_key iam_resources_of_yojson "iamResources" _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
   }
    : register_account_response)

let register_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestream_resources =
       option_of_yojson
         (value_for_key timestream_resources_of_yojson "timestreamResources")
         _list path;
     iam_resources =
       option_of_yojson (value_for_key iam_resources_of_yojson "iamResources") _list path;
   }
    : register_account_request)

let put_logging_options_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let put_logging_options_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_watch_log_delivery =
       value_for_key cloud_watch_log_delivery_options_of_yojson "cloudWatchLogDelivery" _list path;
   }
    : put_logging_options_request)

let put_encryption_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "kmsKeyId")
         _list path;
     encryption_status = value_for_key encryption_status_of_yojson "encryptionStatus" _list path;
     encryption_type = value_for_key encryption_type_of_yojson "encryptionType" _list path;
   }
    : put_encryption_configuration_response)

let put_encryption_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "kmsKeyId")
         _list path;
     encryption_type = value_for_key encryption_type_of_yojson "encryptionType" _list path;
   }
    : put_encryption_configuration_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path }
    : list_tags_for_resource_request)

let campaign_summaries_of_yojson tree path = list_of_yojson campaign_summary_of_yojson tree path

let list_campaigns_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     campaign_summaries =
       option_of_yojson (value_for_key campaign_summaries_of_yojson "campaignSummaries") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_campaigns_response)

let list_response_scope_of_yojson (tree : t) path =
  ((match tree with
    | `String "METADATA_ONLY" -> METADATA_ONLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ListResponseScope" value)
    | _ -> raise (deserialize_wrong_type_error path "ListResponseScope")
     : list_response_scope)
    : list_response_scope)

let status_str_of_yojson = string_of_yojson

let list_campaigns_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     status = option_of_yojson (value_for_key status_str_of_yojson "status") _list path;
     list_response_scope =
       option_of_yojson (value_for_key list_response_scope_of_yojson "listResponseScope") _list path;
   }
    : list_campaigns_request)

let list_decoder_manifest_network_interfaces_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     network_interfaces =
       option_of_yojson (value_for_key network_interfaces_of_yojson "networkInterfaces") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_decoder_manifest_network_interfaces_response)

let list_decoder_manifest_network_interfaces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_decoder_manifest_network_interfaces_request)

let list_decoder_manifest_signals_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     signal_decoders =
       option_of_yojson (value_for_key signal_decoders_of_yojson "signalDecoders") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_decoder_manifest_signals_response)

let list_decoder_manifest_signals_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_decoder_manifest_signals_request)

let decoder_manifest_summaries_of_yojson tree path =
  list_of_yojson decoder_manifest_summary_of_yojson tree path

let list_decoder_manifests_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summaries =
       option_of_yojson (value_for_key decoder_manifest_summaries_of_yojson "summaries") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_decoder_manifests_response)

let list_decoder_manifests_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "modelManifestArn") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     list_response_scope =
       option_of_yojson (value_for_key list_response_scope_of_yojson "listResponseScope") _list path;
   }
    : list_decoder_manifests_request)

let fleet_summaries_of_yojson tree path = list_of_yojson fleet_summary_of_yojson tree path

let list_fleets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_summaries =
       option_of_yojson (value_for_key fleet_summaries_of_yojson "fleetSummaries") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_fleets_response)

let list_fleets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     list_response_scope =
       option_of_yojson (value_for_key list_response_scope_of_yojson "listResponseScope") _list path;
   }
    : list_fleets_request)

let fleets_of_yojson tree path = list_of_yojson fleet_id_of_yojson tree path

let list_fleets_for_vehicle_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleets = option_of_yojson (value_for_key fleets_of_yojson "fleets") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_fleets_for_vehicle_response)

let list_fleets_for_vehicle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_fleets_for_vehicle_request)

let list_model_manifest_nodes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nodes = option_of_yojson (value_for_key nodes_of_yojson "nodes") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_model_manifest_nodes_response)

let list_model_manifest_nodes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_model_manifest_nodes_request)

let model_manifest_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     signal_catalog_arn =
       option_of_yojson (value_for_key arn_of_yojson "signalCatalogArn") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     status = option_of_yojson (value_for_key manifest_status_of_yojson "status") _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
   }
    : model_manifest_summary)

let model_manifest_summaries_of_yojson tree path =
  list_of_yojson model_manifest_summary_of_yojson tree path

let list_model_manifests_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summaries =
       option_of_yojson (value_for_key model_manifest_summaries_of_yojson "summaries") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_model_manifests_response)

let list_model_manifests_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     signal_catalog_arn =
       option_of_yojson (value_for_key arn_of_yojson "signalCatalogArn") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     list_response_scope =
       option_of_yojson (value_for_key list_response_scope_of_yojson "listResponseScope") _list path;
   }
    : list_model_manifests_request)

let list_signal_catalog_nodes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nodes = option_of_yojson (value_for_key nodes_of_yojson "nodes") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_signal_catalog_nodes_response)

let signal_node_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SENSOR" -> SENSOR
    | `String "ACTUATOR" -> ACTUATOR
    | `String "ATTRIBUTE" -> ATTRIBUTE
    | `String "BRANCH" -> BRANCH
    | `String "CUSTOM_STRUCT" -> CUSTOM_STRUCT
    | `String "CUSTOM_PROPERTY" -> CUSTOM_PROPERTY
    | `String value -> raise (deserialize_unknown_enum_value_error path "SignalNodeType" value)
    | _ -> raise (deserialize_wrong_type_error path "SignalNodeType")
     : signal_node_type)
    : signal_node_type)

let list_signal_catalog_nodes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     signal_node_type =
       option_of_yojson (value_for_key signal_node_type_of_yojson "signalNodeType") _list path;
   }
    : list_signal_catalog_nodes_request)

let signal_catalog_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastModificationTime") _list path;
   }
    : signal_catalog_summary)

let signal_catalog_summaries_of_yojson tree path =
  list_of_yojson signal_catalog_summary_of_yojson tree path

let list_signal_catalogs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summaries =
       option_of_yojson (value_for_key signal_catalog_summaries_of_yojson "summaries") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_signal_catalogs_response)

let list_signal_catalogs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_signal_catalogs_request)

let state_template_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     signal_catalog_arn =
       option_of_yojson (value_for_key arn_of_yojson "signalCatalogArn") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastModificationTime") _list path;
     id = option_of_yojson (value_for_key resource_unique_id_of_yojson "id") _list path;
   }
    : state_template_summary)

let state_template_summaries_of_yojson tree path =
  list_of_yojson state_template_summary_of_yojson tree path

let list_state_templates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summaries =
       option_of_yojson (value_for_key state_template_summaries_of_yojson "summaries") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_state_templates_response)

let list_state_templates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     list_response_scope =
       option_of_yojson (value_for_key list_response_scope_of_yojson "listResponseScope") _list path;
   }
    : list_state_templates_request)

let vehicle_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     model_manifest_arn = value_for_key arn_of_yojson "modelManifestArn" _list path;
     decoder_manifest_arn = value_for_key arn_of_yojson "decoderManifestArn" _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
     attributes = option_of_yojson (value_for_key attributes_map_of_yojson "attributes") _list path;
   }
    : vehicle_summary)

let vehicle_summaries_of_yojson tree path = list_of_yojson vehicle_summary_of_yojson tree path

let list_vehicles_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicle_summaries =
       option_of_yojson (value_for_key vehicle_summaries_of_yojson "vehicleSummaries") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_vehicles_response)

let list_vehicles_max_results_of_yojson = int_of_yojson
let attribute_values_list_of_yojson tree path = list_of_yojson attribute_value_of_yojson tree path
let attribute_names_list_of_yojson tree path = list_of_yojson attribute_name_of_yojson tree path

let list_vehicles_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "modelManifestArn") _list path;
     attribute_names =
       option_of_yojson (value_for_key attribute_names_list_of_yojson "attributeNames") _list path;
     attribute_values =
       option_of_yojson (value_for_key attribute_values_list_of_yojson "attributeValues") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results =
       option_of_yojson (value_for_key list_vehicles_max_results_of_yojson "maxResults") _list path;
     list_response_scope =
       option_of_yojson (value_for_key list_response_scope_of_yojson "listResponseScope") _list path;
   }
    : list_vehicles_request)

let vehicles_of_yojson tree path = list_of_yojson vehicle_name_of_yojson tree path

let list_vehicles_in_fleet_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicles = option_of_yojson (value_for_key vehicles_of_yojson "vehicles") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_vehicles_in_fleet_response)

let list_vehicles_in_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_of_yojson "fleetId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_vehicles_in_fleet_request)

let node_paths_of_yojson tree path = list_of_yojson node_path_of_yojson tree path

let update_campaign_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key campaign_arn_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key campaign_name_of_yojson "name") _list path;
     status = option_of_yojson (value_for_key campaign_status_of_yojson "status") _list path;
   }
    : update_campaign_response)

let update_campaign_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "APPROVE" -> APPROVE
    | `String "SUSPEND" -> SUSPEND
    | `String "RESUME" -> RESUME
    | `String "UPDATE" -> UPDATE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UpdateCampaignAction" value)
    | _ -> raise (deserialize_wrong_type_error path "UpdateCampaignAction")
     : update_campaign_action)
    : update_campaign_action)

let update_campaign_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key campaign_name_of_yojson "name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     data_extra_dimensions =
       option_of_yojson
         (value_for_key data_extra_dimension_node_path_list_of_yojson "dataExtraDimensions")
         _list path;
     action = value_for_key update_campaign_action_of_yojson "action" _list path;
   }
    : update_campaign_request)

let update_decoder_manifest_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : update_decoder_manifest_response)

let update_decoder_manifest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     signal_decoders_to_add =
       option_of_yojson (value_for_key signal_decoders_of_yojson "signalDecodersToAdd") _list path;
     signal_decoders_to_update =
       option_of_yojson
         (value_for_key signal_decoders_of_yojson "signalDecodersToUpdate")
         _list path;
     signal_decoders_to_remove =
       option_of_yojson (value_for_key fqns_of_yojson "signalDecodersToRemove") _list path;
     network_interfaces_to_add =
       option_of_yojson
         (value_for_key network_interfaces_of_yojson "networkInterfacesToAdd")
         _list path;
     network_interfaces_to_update =
       option_of_yojson
         (value_for_key network_interfaces_of_yojson "networkInterfacesToUpdate")
         _list path;
     network_interfaces_to_remove =
       option_of_yojson
         (value_for_key interface_ids_of_yojson "networkInterfacesToRemove")
         _list path;
     status = option_of_yojson (value_for_key manifest_status_of_yojson "status") _list path;
     default_for_unmapped_signals =
       option_of_yojson
         (value_for_key default_for_unmapped_signals_type_of_yojson "defaultForUnmappedSignals")
         _list path;
   }
    : update_decoder_manifest_request)

let update_fleet_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key fleet_id_of_yojson "id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
   }
    : update_fleet_response)

let update_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_of_yojson "fleetId" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
   }
    : update_fleet_request)

let update_model_manifest_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : update_model_manifest_response)

let update_model_manifest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     nodes_to_add = option_of_yojson (value_for_key node_paths_of_yojson "nodesToAdd") _list path;
     nodes_to_remove =
       option_of_yojson (value_for_key node_paths_of_yojson "nodesToRemove") _list path;
     status = option_of_yojson (value_for_key manifest_status_of_yojson "status") _list path;
   }
    : update_model_manifest_request)

let update_signal_catalog_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : update_signal_catalog_response)

let update_signal_catalog_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     nodes_to_add = option_of_yojson (value_for_key nodes_of_yojson "nodesToAdd") _list path;
     nodes_to_update = option_of_yojson (value_for_key nodes_of_yojson "nodesToUpdate") _list path;
     nodes_to_remove =
       option_of_yojson (value_for_key node_paths_of_yojson "nodesToRemove") _list path;
   }
    : update_signal_catalog_request)

let update_state_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     id = option_of_yojson (value_for_key resource_unique_id_of_yojson "id") _list path;
   }
    : update_state_template_response)

let update_state_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identifier = value_for_key resource_identifier_of_yojson "identifier" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     state_template_properties_to_add =
       option_of_yojson
         (value_for_key state_template_properties_of_yojson "stateTemplatePropertiesToAdd")
         _list path;
     state_template_properties_to_remove =
       option_of_yojson
         (value_for_key state_template_properties_of_yojson "stateTemplatePropertiesToRemove")
         _list path;
     data_extra_dimensions =
       option_of_yojson
         (value_for_key state_template_data_extra_dimension_node_path_list_of_yojson
            "dataExtraDimensions")
         _list path;
     metadata_extra_dimensions =
       option_of_yojson
         (value_for_key state_template_metadata_extra_dimension_node_path_list_of_yojson
            "metadataExtraDimensions")
         _list path;
   }
    : update_state_template_request)

let update_vehicle_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicle_name = option_of_yojson (value_for_key vehicle_name_of_yojson "vehicleName") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
   }
    : update_vehicle_response)

let update_vehicle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
     model_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "modelManifestArn") _list path;
     decoder_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "decoderManifestArn") _list path;
     attributes = option_of_yojson (value_for_key attributes_map_of_yojson "attributes") _list path;
     attribute_update_mode =
       option_of_yojson (value_for_key update_mode_of_yojson "attributeUpdateMode") _list path;
     state_templates_to_add =
       option_of_yojson
         (value_for_key state_template_associations_of_yojson "stateTemplatesToAdd")
         _list path;
     state_templates_to_remove =
       option_of_yojson
         (value_for_key state_template_association_identifiers_of_yojson "stateTemplatesToRemove")
         _list path;
     state_templates_to_update =
       option_of_yojson
         (value_for_key state_template_associations_of_yojson "stateTemplatesToUpdate")
         _list path;
   }
    : update_vehicle_request)
