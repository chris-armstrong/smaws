open Smaws_Lib.Json.DeserializeHelpers
open Types

let wildcard_signal_name_of_yojson = string_of_yojson
let vehicle_name_of_yojson = string_of_yojson
let vehicles_of_yojson tree path = list_of_yojson vehicle_name_of_yojson tree path
let arn_of_yojson = string_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let attribute_value_of_yojson = string_of_yojson
let attribute_name_of_yojson = string_of_yojson

let attributes_map_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

let vehicle_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes = option_of_yojson (value_for_key attributes_map_of_yojson "attributes") _list path;
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     decoder_manifest_arn = value_for_key arn_of_yojson "decoderManifestArn" _list path;
     model_manifest_arn = value_for_key arn_of_yojson "modelManifestArn" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
   }
    : vehicle_summary)

let vehicle_summaries_of_yojson tree path = list_of_yojson vehicle_summary_of_yojson tree path

let update_vehicle_response_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     vehicle_name = option_of_yojson (value_for_key vehicle_name_of_yojson "vehicleName") _list path;
   }
    : update_vehicle_response_item)

let update_vehicle_response_items_of_yojson tree path =
  list_of_yojson update_vehicle_response_item_of_yojson tree path

let update_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "Merge" -> MERGE
    | `String "Overwrite" -> OVERWRITE
    | `String value -> raise (deserialize_unknown_enum_value_error path "UpdateMode" value)
    | _ -> raise (deserialize_wrong_type_error path "UpdateMode")
     : update_mode)
    : update_mode)

let resource_identifier_of_yojson = string_of_yojson

let time_unit_of_yojson (tree : t) path =
  ((match tree with
    | `String "HOUR" -> HOUR
    | `String "MINUTE" -> MINUTE
    | `String "SECOND" -> SECOND
    | `String "MILLISECOND" -> MILLISECOND
    | `String value -> raise (deserialize_unknown_enum_value_error path "TimeUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "TimeUnit")
     : time_unit)
    : time_unit)

let positive_integer_of_yojson = int_of_yojson

let time_period_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key positive_integer_of_yojson "value" _list path;
     unit_ = value_for_key time_unit_of_yojson "unit" _list path;
   }
    : time_period)

let periodic_state_template_update_strategy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_template_update_rate =
       value_for_key time_period_of_yojson "stateTemplateUpdateRate" _list path;
   }
    : periodic_state_template_update_strategy)

let on_change_state_template_update_strategy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let state_template_update_strategy_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "onChange" -> OnChange (on_change_state_template_update_strategy_of_yojson value_ path)
   | "periodic" -> Periodic (periodic_state_template_update_strategy_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "StateTemplateUpdateStrategy" unknown)
    : state_template_update_strategy)

let state_template_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_template_update_strategy =
       value_for_key state_template_update_strategy_of_yojson "stateTemplateUpdateStrategy" _list
         path;
     identifier = value_for_key resource_identifier_of_yojson "identifier" _list path;
   }
    : state_template_association)

let state_template_associations_of_yojson tree path =
  list_of_yojson state_template_association_of_yojson tree path

let state_template_association_identifiers_of_yojson tree path =
  list_of_yojson resource_identifier_of_yojson tree path

let update_vehicle_request_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_templates_to_update =
       option_of_yojson
         (value_for_key state_template_associations_of_yojson "stateTemplatesToUpdate")
         _list path;
     state_templates_to_remove =
       option_of_yojson
         (value_for_key state_template_association_identifiers_of_yojson "stateTemplatesToRemove")
         _list path;
     state_templates_to_add =
       option_of_yojson
         (value_for_key state_template_associations_of_yojson "stateTemplatesToAdd")
         _list path;
     attribute_update_mode =
       option_of_yojson (value_for_key update_mode_of_yojson "attributeUpdateMode") _list path;
     attributes = option_of_yojson (value_for_key attributes_map_of_yojson "attributes") _list path;
     decoder_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "decoderManifestArn") _list path;
     model_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "modelManifestArn") _list path;
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
   }
    : update_vehicle_request_item)

let update_vehicle_request_items_of_yojson tree path =
  list_of_yojson update_vehicle_request_item_of_yojson tree path

let number_of_yojson = int_of_yojson
let string__of_yojson = string_of_yojson

let update_vehicle_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     code = option_of_yojson (value_for_key number_of_yojson "code") _list path;
     vehicle_name = option_of_yojson (value_for_key vehicle_name_of_yojson "vehicleName") _list path;
   }
    : update_vehicle_error)

let update_vehicle_errors_of_yojson tree path =
  list_of_yojson update_vehicle_error_of_yojson tree path

let uint32_of_yojson = long_of_yojson
let status_str_of_yojson = string_of_yojson

let signal_catalog_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastModificationTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
   }
    : signal_catalog_summary)

let signal_catalog_summaries_of_yojson tree path =
  list_of_yojson signal_catalog_summary_of_yojson tree path

let resource_name_of_yojson = string_of_yojson
let priority_of_yojson = int_of_yojson
let positive_long_of_yojson = long_of_yojson
let non_negative_integer_of_yojson = int_of_yojson
let next_token_of_yojson = string_of_yojson
let description_of_yojson = string_of_yojson

let manifest_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "VALIDATING" -> VALIDATING
    | `String "INVALID" -> INVALID
    | `String "DRAFT" -> DRAFT
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ManifestStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ManifestStatus")
     : manifest_status)
    : manifest_status)

let model_manifest_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     status = option_of_yojson (value_for_key manifest_status_of_yojson "status") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     signal_catalog_arn =
       option_of_yojson (value_for_key arn_of_yojson "signalCatalogArn") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
   }
    : model_manifest_summary)

let model_manifest_summaries_of_yojson tree path =
  list_of_yojson model_manifest_summary_of_yojson tree path

let message_of_yojson = string_of_yojson
let max_string_size_of_yojson = long_of_yojson
let max_sample_count_of_yojson = long_of_yojson
let max_results_of_yojson = int_of_yojson
let list_vehicles_max_results_of_yojson = int_of_yojson
let list_of_strings_of_yojson tree path = list_of_yojson string__of_yojson tree path
let language_version_of_yojson = int_of_yojson
let fleet_id_of_yojson = string_of_yojson
let fleets_of_yojson tree path = list_of_yojson fleet_id_of_yojson tree path

let fleet_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastModificationTime") _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     signal_catalog_arn = value_for_key arn_of_yojson "signalCatalogArn" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     id = value_for_key fleet_id_of_yojson "id" _list path;
   }
    : fleet_summary)

let fleet_summaries_of_yojson tree path = list_of_yojson fleet_summary_of_yojson tree path
let fetch_config_event_expression_of_yojson = string_of_yojson
let event_expression_of_yojson = string_of_yojson
let error_message_of_yojson = string_of_yojson
let double_of_yojson = double_of_yojson

let decoder_manifest_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     status = option_of_yojson (value_for_key manifest_status_of_yojson "status") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     model_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "modelManifestArn") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
   }
    : decoder_manifest_summary)

let decoder_manifest_summaries_of_yojson tree path =
  list_of_yojson decoder_manifest_summary_of_yojson tree path

let customer_account_id_of_yojson = string_of_yojson

let create_vehicle_response_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     thing_arn = option_of_yojson (value_for_key arn_of_yojson "thingArn") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     vehicle_name = option_of_yojson (value_for_key vehicle_name_of_yojson "vehicleName") _list path;
   }
    : create_vehicle_response_item)

let create_vehicle_responses_of_yojson tree path =
  list_of_yojson create_vehicle_response_item_of_yojson tree path

let vehicle_association_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "ValidateIotThingExists" -> VALIDATE_IOT_THING_EXISTS
    | `String "CreateIotThing" -> CREATE_IOT_THING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "VehicleAssociationBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "VehicleAssociationBehavior")
     : vehicle_association_behavior)
    : vehicle_association_behavior)

let tag_key_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "Value" _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let create_vehicle_request_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_templates =
       option_of_yojson
         (value_for_key state_template_associations_of_yojson "stateTemplates")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     association_behavior =
       option_of_yojson
         (value_for_key vehicle_association_behavior_of_yojson "associationBehavior")
         _list path;
     attributes = option_of_yojson (value_for_key attributes_map_of_yojson "attributes") _list path;
     decoder_manifest_arn = value_for_key arn_of_yojson "decoderManifestArn" _list path;
     model_manifest_arn = value_for_key arn_of_yojson "modelManifestArn" _list path;
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
   }
    : create_vehicle_request_item)

let create_vehicle_request_items_of_yojson tree path =
  list_of_yojson create_vehicle_request_item_of_yojson tree path

let create_vehicle_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "code") _list path;
     vehicle_name = option_of_yojson (value_for_key vehicle_name_of_yojson "vehicleName") _list path;
   }
    : create_vehicle_error)

let create_vehicle_errors_of_yojson tree path =
  list_of_yojson create_vehicle_error_of_yojson tree path

let collection_period_ms_of_yojson = long_of_yojson
let campaign_arn_of_yojson = string_of_yojson
let campaign_name_of_yojson = string_of_yojson

let campaign_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUSPENDED" -> SUSPENDED
    | `String "RUNNING" -> RUNNING
    | `String "WAITING_FOR_APPROVAL" -> WAITING_FOR_APPROVAL
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "CampaignStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CampaignStatus")
     : campaign_status)
    : campaign_status)

let campaign_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     status = option_of_yojson (value_for_key campaign_status_of_yojson "status") _list path;
     target_arn = option_of_yojson (value_for_key arn_of_yojson "targetArn") _list path;
     signal_catalog_arn =
       option_of_yojson (value_for_key arn_of_yojson "signalCatalogArn") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = option_of_yojson (value_for_key campaign_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key campaign_arn_of_yojson "arn") _list path;
   }
    : campaign_summary)

let campaign_summaries_of_yojson tree path = list_of_yojson campaign_summary_of_yojson tree path
let attribute_values_list_of_yojson tree path = list_of_yojson attribute_value_of_yojson tree path
let attribute_names_list_of_yojson tree path = list_of_yojson attribute_name_of_yojson tree path
let action_event_expression_of_yojson = string_of_yojson

let vehicle_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "READY_FOR_CHECKIN" -> READY_FOR_CHECKIN
    | `String "DELETING" -> DELETING
    | `String "SUSPENDED" -> SUSPENDED
    | `String "HEALTHY" -> HEALTHY
    | `String "READY" -> READY
    | `String "CREATED" -> CREATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "VehicleState" value)
    | _ -> raise (deserialize_wrong_type_error path "VehicleState")
     : vehicle_state)
    : vehicle_state)

let vehicle_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key vehicle_state_of_yojson "status") _list path;
     vehicle_name = option_of_yojson (value_for_key vehicle_name_of_yojson "vehicleName") _list path;
     campaign_name =
       option_of_yojson (value_for_key campaign_name_of_yojson "campaignName") _list path;
   }
    : vehicle_status)

let vehicle_status_list_of_yojson tree path = list_of_yojson vehicle_status_of_yojson tree path

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
     protocol_name = value_for_key vehicle_middleware_protocol_of_yojson "protocolName" _list path;
     name = value_for_key vehicle_middleware_name_of_yojson "name" _list path;
   }
    : vehicle_middleware)

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "other" -> OTHER
    | `String "fieldValidationFailed" -> FIELD_VALIDATION_FAILED
    | `String "cannotParse" -> CANNOT_PARSE
    | `String "unknownOperation" -> UNKNOWN_OPERATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "name" _list path;
   }
    : validation_exception_field)

let validation_exception_field_list_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_list =
       option_of_yojson
         (value_for_key validation_exception_field_list_of_yojson "fieldList")
         _list path;
     reason =
       option_of_yojson (value_for_key validation_exception_reason_of_yojson "reason") _list path;
     message = value_for_key string__of_yojson "message" _list path;
   }
    : validation_exception)

let update_vehicle_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     vehicle_name = option_of_yojson (value_for_key vehicle_name_of_yojson "vehicleName") _list path;
   }
    : update_vehicle_response)

let update_vehicle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_templates_to_update =
       option_of_yojson
         (value_for_key state_template_associations_of_yojson "stateTemplatesToUpdate")
         _list path;
     state_templates_to_remove =
       option_of_yojson
         (value_for_key state_template_association_identifiers_of_yojson "stateTemplatesToRemove")
         _list path;
     state_templates_to_add =
       option_of_yojson
         (value_for_key state_template_associations_of_yojson "stateTemplatesToAdd")
         _list path;
     attribute_update_mode =
       option_of_yojson (value_for_key update_mode_of_yojson "attributeUpdateMode") _list path;
     attributes = option_of_yojson (value_for_key attributes_map_of_yojson "attributes") _list path;
     decoder_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "decoderManifestArn") _list path;
     model_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "modelManifestArn") _list path;
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
   }
    : update_vehicle_request)

let retry_after_seconds_of_yojson = int_of_yojson

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_after_seconds =
       option_of_yojson (value_for_key retry_after_seconds_of_yojson "retryAfterSeconds") _list path;
     service_code = option_of_yojson (value_for_key string__of_yojson "serviceCode") _list path;
     quota_code = option_of_yojson (value_for_key string__of_yojson "quotaCode") _list path;
     message = value_for_key string__of_yojson "message" _list path;
   }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key string__of_yojson "resourceType" _list path;
     resource_id = value_for_key string__of_yojson "resourceId" _list path;
     message = value_for_key string__of_yojson "message" _list path;
   }
    : resource_not_found_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key string__of_yojson "resourceType" _list path;
     resource_id = value_for_key string__of_yojson "resourceId" _list path;
     message = value_for_key string__of_yojson "message" _list path;
   }
    : limit_exceeded_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_after_seconds =
       option_of_yojson (value_for_key retry_after_seconds_of_yojson "retryAfterSeconds") _list path;
     message = value_for_key string__of_yojson "message" _list path;
   }
    : internal_server_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key string__of_yojson "resourceType" _list path;
     resource = value_for_key string__of_yojson "resource" _list path;
     message = value_for_key string__of_yojson "message" _list path;
   }
    : conflict_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key string__of_yojson "message" _list path } : access_denied_exception)

let resource_unique_id_of_yojson = string_of_yojson

let update_state_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_unique_id_of_yojson "id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
   }
    : update_state_template_response)

let node_path_of_yojson = string_of_yojson
let state_template_properties_of_yojson tree path = list_of_yojson node_path_of_yojson tree path

let state_template_data_extra_dimension_node_path_list_of_yojson tree path =
  list_of_yojson node_path_of_yojson tree path

let state_template_metadata_extra_dimension_node_path_list_of_yojson tree path =
  list_of_yojson node_path_of_yojson tree path

let update_state_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metadata_extra_dimensions =
       option_of_yojson
         (value_for_key state_template_metadata_extra_dimension_node_path_list_of_yojson
            "metadataExtraDimensions")
         _list path;
     data_extra_dimensions =
       option_of_yojson
         (value_for_key state_template_data_extra_dimension_node_path_list_of_yojson
            "dataExtraDimensions")
         _list path;
     state_template_properties_to_remove =
       option_of_yojson
         (value_for_key state_template_properties_of_yojson "stateTemplatePropertiesToRemove")
         _list path;
     state_template_properties_to_add =
       option_of_yojson
         (value_for_key state_template_properties_of_yojson "stateTemplatePropertiesToAdd")
         _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     identifier = value_for_key resource_identifier_of_yojson "identifier" _list path;
   }
    : update_state_template_request)

let fully_qualified_name_of_yojson = string_of_yojson

let invalid_signal_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = option_of_yojson (value_for_key string__of_yojson "reason") _list path;
     name = option_of_yojson (value_for_key fully_qualified_name_of_yojson "name") _list path;
   }
    : invalid_signal)

let invalid_signals_of_yojson tree path = list_of_yojson invalid_signal_of_yojson tree path

let invalid_signals_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invalid_signals =
       option_of_yojson (value_for_key invalid_signals_of_yojson "invalidSignals") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : invalid_signals_exception)

let update_signal_catalog_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : update_signal_catalog_response)

let branch_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comment = option_of_yojson (value_for_key message_of_yojson "comment") _list path;
     deprecation_message =
       option_of_yojson (value_for_key message_of_yojson "deprecationMessage") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     fully_qualified_name = value_for_key string__of_yojson "fullyQualifiedName" _list path;
   }
    : branch)

let node_data_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "STRUCT_ARRAY" -> STRUCT_ARRAY
    | `String "STRUCT" -> STRUCT
    | `String "UNKNOWN" -> UNKNOWN
    | `String "UNIX_TIMESTAMP_ARRAY" -> UNIX_TIMESTAMP_ARRAY
    | `String "STRING_ARRAY" -> STRING_ARRAY
    | `String "DOUBLE_ARRAY" -> DOUBLE_ARRAY
    | `String "FLOAT_ARRAY" -> FLOAT_ARRAY
    | `String "BOOLEAN_ARRAY" -> BOOLEAN_ARRAY
    | `String "UINT64_ARRAY" -> UINT64_ARRAY
    | `String "INT64_ARRAY" -> INT64_ARRAY
    | `String "UINT32_ARRAY" -> UINT32_ARRAY
    | `String "INT32_ARRAY" -> INT32_ARRAY
    | `String "UINT16_ARRAY" -> UINT16_ARRAY
    | `String "INT16_ARRAY" -> INT16_ARRAY
    | `String "UINT8_ARRAY" -> UINT8_ARRAY
    | `String "INT8_ARRAY" -> INT8_ARRAY
    | `String "UNIX_TIMESTAMP" -> UNIX_TIMESTAMP
    | `String "STRING" -> STRING
    | `String "DOUBLE" -> DOUBLE
    | `String "FLOAT" -> FLOAT
    | `String "BOOLEAN" -> BOOLEAN
    | `String "UINT64" -> UINT64
    | `String "INT64" -> INT64
    | `String "UINT32" -> UINT32
    | `String "INT32" -> INT32
    | `String "UINT16" -> UINT16
    | `String "INT16" -> INT16
    | `String "UINT8" -> UINT8
    | `String "INT8" -> INT8
    | `String value -> raise (deserialize_unknown_enum_value_error path "NodeDataType" value)
    | _ -> raise (deserialize_wrong_type_error path "NodeDataType")
     : node_data_type)
    : node_data_type)

let sensor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     struct_fully_qualified_name =
       option_of_yojson (value_for_key node_path_of_yojson "structFullyQualifiedName") _list path;
     comment = option_of_yojson (value_for_key message_of_yojson "comment") _list path;
     deprecation_message =
       option_of_yojson (value_for_key message_of_yojson "deprecationMessage") _list path;
     max = option_of_yojson (value_for_key double_of_yojson "max") _list path;
     min = option_of_yojson (value_for_key double_of_yojson "min") _list path;
     allowed_values =
       option_of_yojson (value_for_key list_of_strings_of_yojson "allowedValues") _list path;
     unit_ = option_of_yojson (value_for_key string__of_yojson "unit") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     data_type = value_for_key node_data_type_of_yojson "dataType" _list path;
     fully_qualified_name = value_for_key string__of_yojson "fullyQualifiedName" _list path;
   }
    : sensor)

let actuator_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     struct_fully_qualified_name =
       option_of_yojson (value_for_key node_path_of_yojson "structFullyQualifiedName") _list path;
     comment = option_of_yojson (value_for_key message_of_yojson "comment") _list path;
     deprecation_message =
       option_of_yojson (value_for_key message_of_yojson "deprecationMessage") _list path;
     assigned_value = option_of_yojson (value_for_key string__of_yojson "assignedValue") _list path;
     max = option_of_yojson (value_for_key double_of_yojson "max") _list path;
     min = option_of_yojson (value_for_key double_of_yojson "min") _list path;
     allowed_values =
       option_of_yojson (value_for_key list_of_strings_of_yojson "allowedValues") _list path;
     unit_ = option_of_yojson (value_for_key string__of_yojson "unit") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     data_type = value_for_key node_data_type_of_yojson "dataType" _list path;
     fully_qualified_name = value_for_key string__of_yojson "fullyQualifiedName" _list path;
   }
    : actuator)

let attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comment = option_of_yojson (value_for_key message_of_yojson "comment") _list path;
     deprecation_message =
       option_of_yojson (value_for_key message_of_yojson "deprecationMessage") _list path;
     default_value = option_of_yojson (value_for_key string__of_yojson "defaultValue") _list path;
     assigned_value = option_of_yojson (value_for_key string__of_yojson "assignedValue") _list path;
     max = option_of_yojson (value_for_key double_of_yojson "max") _list path;
     min = option_of_yojson (value_for_key double_of_yojson "min") _list path;
     allowed_values =
       option_of_yojson (value_for_key list_of_strings_of_yojson "allowedValues") _list path;
     unit_ = option_of_yojson (value_for_key string__of_yojson "unit") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     data_type = value_for_key node_data_type_of_yojson "dataType" _list path;
     fully_qualified_name = value_for_key string__of_yojson "fullyQualifiedName" _list path;
   }
    : attribute)

let custom_struct_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comment = option_of_yojson (value_for_key message_of_yojson "comment") _list path;
     deprecation_message =
       option_of_yojson (value_for_key message_of_yojson "deprecationMessage") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     fully_qualified_name = value_for_key string__of_yojson "fullyQualifiedName" _list path;
   }
    : custom_struct)

let node_data_encoding_of_yojson (tree : t) path =
  ((match tree with
    | `String "TYPED" -> TYPED
    | `String "BINARY" -> BINARY
    | `String value -> raise (deserialize_unknown_enum_value_error path "NodeDataEncoding" value)
    | _ -> raise (deserialize_wrong_type_error path "NodeDataEncoding")
     : node_data_encoding)
    : node_data_encoding)

let custom_property_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     struct_fully_qualified_name =
       option_of_yojson (value_for_key node_path_of_yojson "structFullyQualifiedName") _list path;
     comment = option_of_yojson (value_for_key message_of_yojson "comment") _list path;
     deprecation_message =
       option_of_yojson (value_for_key message_of_yojson "deprecationMessage") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     data_encoding =
       option_of_yojson (value_for_key node_data_encoding_of_yojson "dataEncoding") _list path;
     data_type = value_for_key node_data_type_of_yojson "dataType" _list path;
     fully_qualified_name = value_for_key string__of_yojson "fullyQualifiedName" _list path;
   }
    : custom_property)

let node_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "property" -> Property (custom_property_of_yojson value_ path)
   | "struct" -> Struct (custom_struct_of_yojson value_ path)
   | "attribute" -> Attribute (attribute_of_yojson value_ path)
   | "actuator" -> Actuator (actuator_of_yojson value_ path)
   | "sensor" -> Sensor (sensor_of_yojson value_ path)
   | "branch" -> Branch (branch_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "Node" unknown)
    : node)

let nodes_of_yojson tree path = list_of_yojson node_of_yojson tree path
let node_paths_of_yojson tree path = list_of_yojson node_path_of_yojson tree path

let update_signal_catalog_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nodes_to_remove =
       option_of_yojson (value_for_key node_paths_of_yojson "nodesToRemove") _list path;
     nodes_to_update = option_of_yojson (value_for_key nodes_of_yojson "nodesToUpdate") _list path;
     nodes_to_add = option_of_yojson (value_for_key nodes_of_yojson "nodesToAdd") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : update_signal_catalog_request)

let invalid_node_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     reason = option_of_yojson (value_for_key string__of_yojson "reason") _list path;
     invalid_nodes = option_of_yojson (value_for_key nodes_of_yojson "invalidNodes") _list path;
   }
    : invalid_node_exception)

let update_model_manifest_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : update_model_manifest_response)

let update_model_manifest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key manifest_status_of_yojson "status") _list path;
     nodes_to_remove =
       option_of_yojson (value_for_key node_paths_of_yojson "nodesToRemove") _list path;
     nodes_to_add = option_of_yojson (value_for_key node_paths_of_yojson "nodesToAdd") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : update_model_manifest_request)

let update_fleet_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     id = option_of_yojson (value_for_key fleet_id_of_yojson "id") _list path;
   }
    : update_fleet_response)

let update_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     fleet_id = value_for_key fleet_id_of_yojson "fleetId" _list path;
   }
    : update_fleet_request)

let update_decoder_manifest_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : update_decoder_manifest_response)

let signal_decoder_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUSTOM_DECODING_SIGNAL" -> CUSTOM_DECODING_SIGNAL
    | `String "MESSAGE_SIGNAL" -> MESSAGE_SIGNAL
    | `String "OBD_SIGNAL" -> OBD_SIGNAL
    | `String "CAN_SIGNAL" -> CAN_SIGNAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "SignalDecoderType" value)
    | _ -> raise (deserialize_wrong_type_error path "SignalDecoderType")
     : signal_decoder_type)
    : signal_decoder_type)

let interface_id_of_yojson = string_of_yojson
let can_signal_name_of_yojson = string_of_yojson

let signal_value_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FLOATING_POINT" -> FLOATING_POINT
    | `String "INTEGER" -> INTEGER
    | `String value -> raise (deserialize_unknown_enum_value_error path "SignalValueType" value)
    | _ -> raise (deserialize_wrong_type_error path "SignalValueType")
     : signal_value_type)
    : signal_value_type)

let can_signal_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     signal_value_type =
       option_of_yojson (value_for_key signal_value_type_of_yojson "signalValueType") _list path;
     name = option_of_yojson (value_for_key can_signal_name_of_yojson "name") _list path;
     length = value_for_key non_negative_integer_of_yojson "length" _list path;
     factor = value_for_key double_of_yojson "factor" _list path;
     offset = value_for_key double_of_yojson "offset" _list path;
     start_bit = value_for_key non_negative_integer_of_yojson "startBit" _list path;
     is_signed =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson "isSigned"
         _list path;
     is_big_endian =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "isBigEndian" _list path;
     message_id = value_for_key non_negative_integer_of_yojson "messageId" _list path;
   }
    : can_signal)

let obd_byte_length_of_yojson = int_of_yojson
let obd_bitmask_length_of_yojson = int_of_yojson

let obd_signal_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     signal_value_type =
       option_of_yojson (value_for_key signal_value_type_of_yojson "signalValueType") _list path;
     is_signed =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "isSigned")
         _list path;
     bit_mask_length =
       option_of_yojson (value_for_key obd_bitmask_length_of_yojson "bitMaskLength") _list path;
     bit_right_shift =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "bitRightShift") _list path;
     byte_length = value_for_key obd_byte_length_of_yojson "byteLength" _list path;
     start_byte = value_for_key non_negative_integer_of_yojson "startByte" _list path;
     offset = value_for_key double_of_yojson "offset" _list path;
     scaling = value_for_key double_of_yojson "scaling" _list path;
     pid = value_for_key non_negative_integer_of_yojson "pid" _list path;
     service_mode = value_for_key non_negative_integer_of_yojson "serviceMode" _list path;
     pid_response_length = value_for_key positive_integer_of_yojson "pidResponseLength" _list path;
   }
    : obd_signal)

let topic_name_of_yojson = string_of_yojson

let ros2_primitive_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "WSTRING" -> WSTRING
    | `String "STRING" -> STRING
    | `String "UINT64" -> UINT64
    | `String "INT64" -> INT64
    | `String "UINT32" -> UINT32
    | `String "INT32" -> INT32
    | `String "UINT16" -> UINT16
    | `String "INT16" -> INT16
    | `String "UINT8" -> UINT8
    | `String "INT8" -> INT8
    | `String "FLOAT64" -> FLOAT64
    | `String "FLOAT32" -> FLOAT32
    | `String "CHAR" -> CHAR
    | `String "BYTE" -> BYTE
    | `String "BOOL" -> BOOL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ROS2PrimitiveType" value)
    | _ -> raise (deserialize_wrong_type_error path "ROS2PrimitiveType")
     : ros2_primitive_type)
    : ros2_primitive_type)

let ros2_primitive_message_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     upper_bound =
       option_of_yojson (value_for_key max_string_size_of_yojson "upperBound") _list path;
     scaling = option_of_yojson (value_for_key double_of_yojson "scaling") _list path;
     offset = option_of_yojson (value_for_key double_of_yojson "offset") _list path;
     primitive_type = value_for_key ros2_primitive_type_of_yojson "primitiveType" _list path;
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

let structure_message_name_of_yojson = string_of_yojson

let structured_message_list_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DYNAMIC_BOUNDED_CAPACITY" -> DYNAMIC_BOUNDED_CAPACITY
    | `String "DYNAMIC_UNBOUNDED_CAPACITY" -> DYNAMIC_UNBOUNDED_CAPACITY
    | `String "FIXED_CAPACITY" -> FIXED_CAPACITY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StructuredMessageListType" value)
    | _ -> raise (deserialize_wrong_type_error path "StructuredMessageListType")
     : structured_message_list_type)
    : structured_message_list_type)

let rec structured_message_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "structuredMessageDefinition" ->
       StructuredMessageDefinition (structured_message_definition_of_yojson value_ path)
   | "structuredMessageListDefinition" ->
       StructuredMessageListDefinition (structured_message_list_definition_of_yojson value_ path)
   | "primitiveMessageDefinition" ->
       PrimitiveMessageDefinition (primitive_message_definition_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "StructuredMessage" unknown)
    : structured_message)

and structured_message_definition_of_yojson tree path =
  list_of_yojson structured_message_field_name_and_data_type_pair_of_yojson tree path

and structured_message_field_name_and_data_type_pair_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_type = value_for_key structured_message_of_yojson "dataType" _list path;
     field_name = value_for_key structure_message_name_of_yojson "fieldName" _list path;
   }
    : structured_message_field_name_and_data_type_pair)

and structured_message_list_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "capacity") _list path;
     list_type = value_for_key structured_message_list_type_of_yojson "listType" _list path;
     member_type = value_for_key structured_message_of_yojson "memberType" _list path;
     name = value_for_key structure_message_name_of_yojson "name" _list path;
   }
    : structured_message_list_definition)

let message_signal_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     structured_message = value_for_key structured_message_of_yojson "structuredMessage" _list path;
     topic_name = value_for_key topic_name_of_yojson "topicName" _list path;
   }
    : message_signal)

let custom_decoding_id_of_yojson = string_of_yojson

let custom_decoding_signal_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key custom_decoding_id_of_yojson "id" _list path } : custom_decoding_signal)

let signal_decoder_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_decoding_signal =
       option_of_yojson
         (value_for_key custom_decoding_signal_of_yojson "customDecodingSignal")
         _list path;
     message_signal =
       option_of_yojson (value_for_key message_signal_of_yojson "messageSignal") _list path;
     obd_signal = option_of_yojson (value_for_key obd_signal_of_yojson "obdSignal") _list path;
     can_signal = option_of_yojson (value_for_key can_signal_of_yojson "canSignal") _list path;
     interface_id = value_for_key interface_id_of_yojson "interfaceId" _list path;
     type_ = value_for_key signal_decoder_type_of_yojson "type" _list path;
     fully_qualified_name =
       value_for_key fully_qualified_name_of_yojson "fullyQualifiedName" _list path;
   }
    : signal_decoder)

let signal_decoders_of_yojson tree path = list_of_yojson signal_decoder_of_yojson tree path
let fqns_of_yojson tree path = list_of_yojson fully_qualified_name_of_yojson tree path

let network_interface_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUSTOM_DECODING_INTERFACE" -> CUSTOM_DECODING_INTERFACE
    | `String "VEHICLE_MIDDLEWARE" -> VEHICLE_MIDDLEWARE
    | `String "OBD_INTERFACE" -> OBD_INTERFACE
    | `String "CAN_INTERFACE" -> CAN_INTERFACE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NetworkInterfaceType" value)
    | _ -> raise (deserialize_wrong_type_error path "NetworkInterfaceType")
     : network_interface_type)
    : network_interface_type)

let can_interface_name_of_yojson = string_of_yojson
let protocol_name_of_yojson = string_of_yojson
let protocol_version_of_yojson = string_of_yojson

let can_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protocol_version =
       option_of_yojson (value_for_key protocol_version_of_yojson "protocolVersion") _list path;
     protocol_name =
       option_of_yojson (value_for_key protocol_name_of_yojson "protocolName") _list path;
     name = value_for_key can_interface_name_of_yojson "name" _list path;
   }
    : can_interface)

let obd_interface_name_of_yojson = string_of_yojson
let obd_standard_of_yojson = string_of_yojson

let obd_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     has_transmission_ecu =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "hasTransmissionEcu")
         _list path;
     use_extended_ids =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "useExtendedIds")
         _list path;
     dtc_request_interval_seconds =
       option_of_yojson
         (value_for_key non_negative_integer_of_yojson "dtcRequestIntervalSeconds")
         _list path;
     pid_request_interval_seconds =
       option_of_yojson
         (value_for_key non_negative_integer_of_yojson "pidRequestIntervalSeconds")
         _list path;
     obd_standard = option_of_yojson (value_for_key obd_standard_of_yojson "obdStandard") _list path;
     request_message_id = value_for_key non_negative_integer_of_yojson "requestMessageId" _list path;
     name = value_for_key obd_interface_name_of_yojson "name" _list path;
   }
    : obd_interface)

let custom_decoding_signal_interface_name_of_yojson = string_of_yojson

let custom_decoding_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key custom_decoding_signal_interface_name_of_yojson "name" _list path }
    : custom_decoding_interface)

let network_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_decoding_interface =
       option_of_yojson
         (value_for_key custom_decoding_interface_of_yojson "customDecodingInterface")
         _list path;
     vehicle_middleware =
       option_of_yojson (value_for_key vehicle_middleware_of_yojson "vehicleMiddleware") _list path;
     obd_interface =
       option_of_yojson (value_for_key obd_interface_of_yojson "obdInterface") _list path;
     can_interface =
       option_of_yojson (value_for_key can_interface_of_yojson "canInterface") _list path;
     type_ = value_for_key network_interface_type_of_yojson "type" _list path;
     interface_id = value_for_key interface_id_of_yojson "interfaceId" _list path;
   }
    : network_interface)

let network_interfaces_of_yojson tree path = list_of_yojson network_interface_of_yojson tree path
let interface_ids_of_yojson tree path = list_of_yojson interface_id_of_yojson tree path

let default_for_unmapped_signals_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUSTOM_DECODING" -> CUSTOM_DECODING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DefaultForUnmappedSignalsType" value)
    | _ -> raise (deserialize_wrong_type_error path "DefaultForUnmappedSignalsType")
     : default_for_unmapped_signals_type)
    : default_for_unmapped_signals_type)

let update_decoder_manifest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_for_unmapped_signals =
       option_of_yojson
         (value_for_key default_for_unmapped_signals_type_of_yojson "defaultForUnmappedSignals")
         _list path;
     status = option_of_yojson (value_for_key manifest_status_of_yojson "status") _list path;
     network_interfaces_to_remove =
       option_of_yojson
         (value_for_key interface_ids_of_yojson "networkInterfacesToRemove")
         _list path;
     network_interfaces_to_update =
       option_of_yojson
         (value_for_key network_interfaces_of_yojson "networkInterfacesToUpdate")
         _list path;
     network_interfaces_to_add =
       option_of_yojson
         (value_for_key network_interfaces_of_yojson "networkInterfacesToAdd")
         _list path;
     signal_decoders_to_remove =
       option_of_yojson (value_for_key fqns_of_yojson "signalDecodersToRemove") _list path;
     signal_decoders_to_update =
       option_of_yojson
         (value_for_key signal_decoders_of_yojson "signalDecodersToUpdate")
         _list path;
     signal_decoders_to_add =
       option_of_yojson (value_for_key signal_decoders_of_yojson "signalDecodersToAdd") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : update_decoder_manifest_request)

let signal_decoder_failure_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUSTOM_DECODING_SIGNAL_INFO_IS_NULL" -> CUSTOM_DECODING_SIGNAL_INFO_IS_NULL
    | `String "EMPTY_MESSAGE_SIGNAL" -> EMPTY_MESSAGE_SIGNAL
    | `String "SIGNAL_DECODER_INCOMPATIBLE_WITH_SIGNAL_CATALOG" ->
        SIGNAL_DECODER_INCOMPATIBLE_WITH_SIGNAL_CATALOG
    | `String "NO_SIGNAL_IN_CATALOG_FOR_DECODER_SIGNAL" -> NO_SIGNAL_IN_CATALOG_FOR_DECODER_SIGNAL
    | `String "STRUCT_SIZE_MISMATCH" -> STRUCT_SIZE_MISMATCH
    | `String "SIGNAL_DECODER_TYPE_INCOMPATIBLE_WITH_MESSAGE_SIGNAL_TYPE" ->
        SIGNAL_DECODER_TYPE_INCOMPATIBLE_WITH_MESSAGE_SIGNAL_TYPE
    | `String "MESSAGE_SIGNAL_INFO_IS_NULL" -> MESSAGE_SIGNAL_INFO_IS_NULL
    | `String "NO_DECODER_INFO_FOR_SIGNAL_IN_MODEL" -> NO_DECODER_INFO_FOR_SIGNAL_IN_MODEL
    | `String "OBD_SIGNAL_INFO_IS_NULL" -> OBD_SIGNAL_INFO_IS_NULL
    | `String "CAN_SIGNAL_INFO_IS_NULL" -> CAN_SIGNAL_INFO_IS_NULL
    | `String "SIGNAL_NOT_IN_MODEL" -> SIGNAL_NOT_IN_MODEL
    | `String "NETWORK_INTERFACE_TYPE_INCOMPATIBLE_WITH_SIGNAL_DECODER_TYPE" ->
        NETWORK_INTERFACE_TYPE_INCOMPATIBLE_WITH_SIGNAL_DECODER_TYPE
    | `String "SIGNAL_NOT_ASSOCIATED_WITH_NETWORK_INTERFACE" ->
        SIGNAL_NOT_ASSOCIATED_WITH_NETWORK_INTERFACE
    | `String "SIGNAL_TO_ADD_ALREADY_EXISTS" -> SIGNAL_TO_ADD_ALREADY_EXISTS
    | `String "CONFLICTING_SIGNAL" -> CONFLICTING_SIGNAL
    | `String "DUPLICATE_SIGNAL" -> DUPLICATE_SIGNAL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SignalDecoderFailureReason" value)
    | _ -> raise (deserialize_wrong_type_error path "SignalDecoderFailureReason")
     : signal_decoder_failure_reason)
    : signal_decoder_failure_reason)

let invalid_signal_decoder_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hint = option_of_yojson (value_for_key message_of_yojson "hint") _list path;
     reason =
       option_of_yojson (value_for_key signal_decoder_failure_reason_of_yojson "reason") _list path;
     name = option_of_yojson (value_for_key fully_qualified_name_of_yojson "name") _list path;
   }
    : invalid_signal_decoder)

let invalid_signal_decoders_of_yojson tree path =
  list_of_yojson invalid_signal_decoder_of_yojson tree path

let network_interface_failure_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUSTOM_DECODING_SIGNAL_NETWORK_INTERFACE_INFO_IS_NULL" ->
        CUSTOM_DECODING_SIGNAL_NETWORK_INTERFACE_INFO_IS_NULL
    | `String "VEHICLE_MIDDLEWARE_NETWORK_INTERFACE_INFO_IS_NULL" ->
        VEHICLE_MIDDLEWARE_NETWORK_INTERFACE_INFO_IS_NULL
    | `String "NETWORK_INTERFACE_TO_REMOVE_ASSOCIATED_WITH_SIGNALS" ->
        NETWORK_INTERFACE_TO_REMOVE_ASSOCIATED_WITH_SIGNALS
    | `String "OBD_NETWORK_INTERFACE_INFO_IS_NULL" -> OBD_NETWORK_INTERFACE_INFO_IS_NULL
    | `String "CAN_NETWORK_INTERFACE_INFO_IS_NULL" -> CAN_NETWORK_INTERFACE_INFO_IS_NULL
    | `String "NETWORK_INTERFACE_TO_ADD_ALREADY_EXISTS" -> NETWORK_INTERFACE_TO_ADD_ALREADY_EXISTS
    | `String "CONFLICTING_NETWORK_INTERFACE" -> CONFLICTING_NETWORK_INTERFACE
    | `String "DUPLICATE_NETWORK_INTERFACE" -> DUPLICATE_INTERFACE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NetworkInterfaceFailureReason" value)
    | _ -> raise (deserialize_wrong_type_error path "NetworkInterfaceFailureReason")
     : network_interface_failure_reason)
    : network_interface_failure_reason)

let invalid_network_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason =
       option_of_yojson
         (value_for_key network_interface_failure_reason_of_yojson "reason")
         _list path;
     interface_id = option_of_yojson (value_for_key interface_id_of_yojson "interfaceId") _list path;
   }
    : invalid_network_interface)

let invalid_network_interfaces_of_yojson tree path =
  list_of_yojson invalid_network_interface_of_yojson tree path

let decoder_manifest_validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     invalid_network_interfaces =
       option_of_yojson
         (value_for_key invalid_network_interfaces_of_yojson "invalidNetworkInterfaces")
         _list path;
     invalid_signals =
       option_of_yojson
         (value_for_key invalid_signal_decoders_of_yojson "invalidSignals")
         _list path;
   }
    : decoder_manifest_validation_exception)

let update_campaign_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key campaign_status_of_yojson "status") _list path;
     name = option_of_yojson (value_for_key campaign_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key campaign_arn_of_yojson "arn") _list path;
   }
    : update_campaign_response)

let data_extra_dimension_node_path_list_of_yojson tree path =
  list_of_yojson node_path_of_yojson tree path

let update_campaign_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATE" -> UPDATE
    | `String "RESUME" -> RESUME
    | `String "SUSPEND" -> SUSPEND
    | `String "APPROVE" -> APPROVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UpdateCampaignAction" value)
    | _ -> raise (deserialize_wrong_type_error path "UpdateCampaignAction")
     : update_campaign_action)
    : update_campaign_action)

let update_campaign_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = value_for_key update_campaign_action_of_yojson "action" _list path;
     data_extra_dimensions =
       option_of_yojson
         (value_for_key data_extra_dimension_node_path_list_of_yojson "dataExtraDimensions")
         _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key campaign_name_of_yojson "name" _list path;
   }
    : update_campaign_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let amazon_resource_name_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : untag_resource_request)

let trigger_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "RISING_EDGE" -> RISING_EDGE
    | `String "ALWAYS" -> ALWAYS
    | `String value -> raise (deserialize_unknown_enum_value_error path "TriggerMode" value)
    | _ -> raise (deserialize_wrong_type_error path "TriggerMode")
     : trigger_mode)
    : trigger_mode)

let timestream_table_name_of_yojson = string_of_yojson
let timestream_table_arn_of_yojson = string_of_yojson
let timestream_database_name_of_yojson = string_of_yojson

let timestream_resources_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestream_table_name =
       value_for_key timestream_table_name_of_yojson "timestreamTableName" _list path;
     timestream_database_name =
       value_for_key timestream_database_name_of_yojson "timestreamDatabaseName" _list path;
   }
    : timestream_resources)

let registration_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "REGISTRATION_FAILURE" -> REGISTRATION_FAILURE
    | `String "REGISTRATION_SUCCESS" -> REGISTRATION_SUCCESS
    | `String "REGISTRATION_PENDING" -> REGISTRATION_PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "RegistrationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RegistrationStatus")
     : registration_status)
    : registration_status)

let timestream_registration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "errorMessage") _list path;
     registration_status =
       value_for_key registration_status_of_yojson "registrationStatus" _list path;
     timestream_table_arn =
       option_of_yojson (value_for_key arn_of_yojson "timestreamTableArn") _list path;
     timestream_database_arn =
       option_of_yojson (value_for_key arn_of_yojson "timestreamDatabaseArn") _list path;
     timestream_table_name =
       value_for_key timestream_table_name_of_yojson "timestreamTableName" _list path;
     timestream_database_name =
       value_for_key timestream_database_name_of_yojson "timestreamDatabaseName" _list path;
   }
    : timestream_registration_response)

let iam_role_arn_of_yojson = string_of_yojson

let timestream_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_role_arn = value_for_key iam_role_arn_of_yojson "executionRoleArn" _list path;
     timestream_table_arn =
       value_for_key timestream_table_arn_of_yojson "timestreamTableArn" _list path;
   }
    : timestream_config)

let time_based_signal_fetch_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_frequency_ms =
       value_for_key positive_long_of_yojson "executionFrequencyMs" _list path;
   }
    : time_based_signal_fetch_config)

let time_based_collection_scheme_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ period_ms = value_for_key collection_period_ms_of_yojson "periodMs" _list path }
    : time_based_collection_scheme)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : tag_resource_request)

let storage_minimum_time_to_live_value_of_yojson = int_of_yojson

let storage_minimum_time_to_live_unit_of_yojson (tree : t) path =
  ((match tree with
    | `String "WEEKS" -> WEEKS
    | `String "DAYS" -> DAYS
    | `String "HOURS" -> HOURS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StorageMinimumTimeToLiveUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "StorageMinimumTimeToLiveUnit")
     : storage_minimum_time_to_live_unit)
    : storage_minimum_time_to_live_unit)

let storage_minimum_time_to_live_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key storage_minimum_time_to_live_value_of_yojson "value" _list path;
     unit_ = value_for_key storage_minimum_time_to_live_unit_of_yojson "unit" _list path;
   }
    : storage_minimum_time_to_live)

let storage_maximum_size_value_of_yojson = int_of_yojson

let storage_maximum_size_unit_of_yojson (tree : t) path =
  ((match tree with
    | `String "TB" -> TB
    | `String "GB" -> GB
    | `String "MB" -> MB
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StorageMaximumSizeUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "StorageMaximumSizeUnit")
     : storage_maximum_size_unit)
    : storage_maximum_size_unit)

let storage_maximum_size_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key storage_maximum_size_value_of_yojson "value" _list path;
     unit_ = value_for_key storage_maximum_size_unit_of_yojson "unit" _list path;
   }
    : storage_maximum_size)

let storage_location_of_yojson = string_of_yojson

let storage_compression_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "GZIP" -> GZIP
    | `String "NONE" -> NONE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StorageCompressionFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "StorageCompressionFormat")
     : storage_compression_format)
    : storage_compression_format)

let state_template_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_unique_id_of_yojson "id") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastModificationTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     signal_catalog_arn =
       option_of_yojson (value_for_key arn_of_yojson "signalCatalogArn") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
   }
    : state_template_summary)

let state_template_summaries_of_yojson tree path =
  list_of_yojson state_template_summary_of_yojson tree path

let spooling_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "TO_DISK" -> TO_DISK
    | `String "OFF" -> OFF
    | `String value -> raise (deserialize_unknown_enum_value_error path "SpoolingMode" value)
    | _ -> raise (deserialize_wrong_type_error path "SpoolingMode")
     : spooling_mode)
    : spooling_mode)

let signal_node_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUSTOM_PROPERTY" -> CUSTOM_PROPERTY
    | `String "CUSTOM_STRUCT" -> CUSTOM_STRUCT
    | `String "BRANCH" -> BRANCH
    | `String "ATTRIBUTE" -> ATTRIBUTE
    | `String "ACTUATOR" -> ACTUATOR
    | `String "SENSOR" -> SENSOR
    | `String value -> raise (deserialize_unknown_enum_value_error path "SignalNodeType" value)
    | _ -> raise (deserialize_wrong_type_error path "SignalNodeType")
     : signal_node_type)
    : signal_node_type)

let data_partition_id_of_yojson = string_of_yojson

let signal_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_partition_id =
       option_of_yojson (value_for_key data_partition_id_of_yojson "dataPartitionId") _list path;
     minimum_sampling_interval_ms =
       option_of_yojson (value_for_key uint32_of_yojson "minimumSamplingIntervalMs") _list path;
     max_sample_count =
       option_of_yojson (value_for_key max_sample_count_of_yojson "maxSampleCount") _list path;
     name = value_for_key wildcard_signal_name_of_yojson "name" _list path;
   }
    : signal_information)

let signal_information_list_of_yojson tree path =
  list_of_yojson signal_information_of_yojson tree path

let condition_based_signal_fetch_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trigger_mode = value_for_key trigger_mode_of_yojson "triggerMode" _list path;
     condition_expression =
       value_for_key fetch_config_event_expression_of_yojson "conditionExpression" _list path;
   }
    : condition_based_signal_fetch_config)

let signal_fetch_config_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "conditionBased" -> ConditionBased (condition_based_signal_fetch_config_of_yojson value_ path)
   | "timeBased" -> TimeBased (time_based_signal_fetch_config_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "SignalFetchConfig" unknown)
    : signal_fetch_config)

let event_expression_list_of_yojson tree path =
  list_of_yojson action_event_expression_of_yojson tree path

let signal_fetch_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     actions = value_for_key event_expression_list_of_yojson "actions" _list path;
     condition_language_version =
       option_of_yojson
         (value_for_key language_version_of_yojson "conditionLanguageVersion")
         _list path;
     signal_fetch_config =
       value_for_key signal_fetch_config_of_yojson "signalFetchConfig" _list path;
     fully_qualified_name = value_for_key node_path_of_yojson "fullyQualifiedName" _list path;
   }
    : signal_fetch_information)

let signal_fetch_information_list_of_yojson tree path =
  list_of_yojson signal_fetch_information_of_yojson tree path

let s3_bucket_arn_of_yojson = string_of_yojson

let data_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "PARQUET" -> PARQUET
    | `String "JSON" -> JSON
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "DataFormat")
     : data_format)
    : data_format)

let prefix_of_yojson = string_of_yojson

let s3_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     prefix = option_of_yojson (value_for_key prefix_of_yojson "prefix") _list path;
     storage_compression_format =
       option_of_yojson
         (value_for_key storage_compression_format_of_yojson "storageCompressionFormat")
         _list path;
     data_format = option_of_yojson (value_for_key data_format_of_yojson "dataFormat") _list path;
     bucket_arn = value_for_key s3_bucket_arn_of_yojson "bucketArn" _list path;
   }
    : s3_config)

let iam_resources_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ role_arn = value_for_key iam_role_arn_of_yojson "roleArn" _list path } : iam_resources)

let register_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     iam_resources = value_for_key iam_resources_of_yojson "iamResources" _list path;
     timestream_resources =
       option_of_yojson
         (value_for_key timestream_resources_of_yojson "timestreamResources")
         _list path;
     register_account_status =
       value_for_key registration_status_of_yojson "registerAccountStatus" _list path;
   }
    : register_account_response)

let register_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iam_resources =
       option_of_yojson (value_for_key iam_resources_of_yojson "iamResources") _list path;
     timestream_resources =
       option_of_yojson
         (value_for_key timestream_resources_of_yojson "timestreamResources")
         _list path;
   }
    : register_account_request)

let put_logging_options_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let log_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR" -> ERROR
    | `String "OFF" -> OFF
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogType" value)
    | _ -> raise (deserialize_wrong_type_error path "LogType")
     : log_type)
    : log_type)

let cloud_watch_log_group_name_of_yojson = string_of_yojson

let cloud_watch_log_delivery_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_group_name =
       option_of_yojson
         (value_for_key cloud_watch_log_group_name_of_yojson "logGroupName")
         _list path;
     log_type = value_for_key log_type_of_yojson "logType" _list path;
   }
    : cloud_watch_log_delivery_options)

let put_logging_options_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_watch_log_delivery =
       value_for_key cloud_watch_log_delivery_options_of_yojson "cloudWatchLogDelivery" _list path;
   }
    : put_logging_options_request)

let encryption_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILURE" -> FAILURE
    | `String "SUCCESS" -> SUCCESS
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "EncryptionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionStatus")
     : encryption_status)
    : encryption_status)

let encryption_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FLEETWISE_DEFAULT_ENCRYPTION" -> FLEETWISE_DEFAULT_ENCRYPTION
    | `String "KMS_BASED_ENCRYPTION" -> KMS_BASED_ENCRYPTION
    | `String value -> raise (deserialize_unknown_enum_value_error path "EncryptionType" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionType")
     : encryption_type)
    : encryption_type)

let put_encryption_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_type = value_for_key encryption_type_of_yojson "encryptionType" _list path;
     encryption_status = value_for_key encryption_status_of_yojson "encryptionStatus" _list path;
     kms_key_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "kmsKeyId")
         _list path;
   }
    : put_encryption_configuration_response)

let put_encryption_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_type = value_for_key encryption_type_of_yojson "encryptionType" _list path;
     kms_key_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "kmsKeyId")
         _list path;
   }
    : put_encryption_configuration_request)

let node_counts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_properties =
       option_of_yojson (value_for_key number_of_yojson "totalProperties") _list path;
     total_structs = option_of_yojson (value_for_key number_of_yojson "totalStructs") _list path;
     total_actuators = option_of_yojson (value_for_key number_of_yojson "totalActuators") _list path;
     total_attributes =
       option_of_yojson (value_for_key number_of_yojson "totalAttributes") _list path;
     total_sensors = option_of_yojson (value_for_key number_of_yojson "totalSensors") _list path;
     total_branches = option_of_yojson (value_for_key number_of_yojson "totalBranches") _list path;
     total_nodes = option_of_yojson (value_for_key number_of_yojson "totalNodes") _list path;
   }
    : node_counts)

let network_file_blob_of_yojson = blob_of_yojson
let network_files_list_of_yojson tree path = list_of_yojson network_file_blob_of_yojson tree path

let model_signals_map_of_yojson tree path =
  map_of_yojson string__of_yojson string__of_yojson tree path

let can_dbc_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     signals_map =
       option_of_yojson (value_for_key model_signals_map_of_yojson "signalsMap") _list path;
     can_dbc_files = value_for_key network_files_list_of_yojson "canDbcFiles" _list path;
     network_interface = value_for_key interface_id_of_yojson "networkInterface" _list path;
   }
    : can_dbc_definition)

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

let mqtt_topic_arn_of_yojson = string_of_yojson

let mqtt_topic_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_role_arn = value_for_key iam_role_arn_of_yojson "executionRoleArn" _list path;
     mqtt_topic_arn = value_for_key mqtt_topic_arn_of_yojson "mqttTopicArn" _list path;
   }
    : mqtt_topic_config)

let list_vehicles_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     vehicle_summaries =
       option_of_yojson (value_for_key vehicle_summaries_of_yojson "vehicleSummaries") _list path;
   }
    : list_vehicles_response)

let list_response_scope_of_yojson (tree : t) path =
  ((match tree with
    | `String "METADATA_ONLY" -> METADATA_ONLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ListResponseScope" value)
    | _ -> raise (deserialize_wrong_type_error path "ListResponseScope")
     : list_response_scope)
    : list_response_scope)

let list_vehicles_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     list_response_scope =
       option_of_yojson (value_for_key list_response_scope_of_yojson "listResponseScope") _list path;
     max_results =
       option_of_yojson (value_for_key list_vehicles_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     attribute_values =
       option_of_yojson (value_for_key attribute_values_list_of_yojson "attributeValues") _list path;
     attribute_names =
       option_of_yojson (value_for_key attribute_names_list_of_yojson "attributeNames") _list path;
     model_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "modelManifestArn") _list path;
   }
    : list_vehicles_request)

let list_vehicles_in_fleet_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     vehicles = option_of_yojson (value_for_key vehicles_of_yojson "vehicles") _list path;
   }
    : list_vehicles_in_fleet_response)

let list_vehicles_in_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     fleet_id = value_for_key fleet_id_of_yojson "fleetId" _list path;
   }
    : list_vehicles_in_fleet_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path }
    : list_tags_for_resource_request)

let list_state_templates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     summaries =
       option_of_yojson (value_for_key state_template_summaries_of_yojson "summaries") _list path;
   }
    : list_state_templates_response)

let list_state_templates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     list_response_scope =
       option_of_yojson (value_for_key list_response_scope_of_yojson "listResponseScope") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_state_templates_request)

let list_signal_catalogs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     summaries =
       option_of_yojson (value_for_key signal_catalog_summaries_of_yojson "summaries") _list path;
   }
    : list_signal_catalogs_response)

let list_signal_catalogs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_signal_catalogs_request)

let list_signal_catalog_nodes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     nodes = option_of_yojson (value_for_key nodes_of_yojson "nodes") _list path;
   }
    : list_signal_catalog_nodes_response)

let list_signal_catalog_nodes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     signal_node_type =
       option_of_yojson (value_for_key signal_node_type_of_yojson "signalNodeType") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : list_signal_catalog_nodes_request)

let list_model_manifests_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     summaries =
       option_of_yojson (value_for_key model_manifest_summaries_of_yojson "summaries") _list path;
   }
    : list_model_manifests_response)

let list_model_manifests_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     list_response_scope =
       option_of_yojson (value_for_key list_response_scope_of_yojson "listResponseScope") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     signal_catalog_arn =
       option_of_yojson (value_for_key arn_of_yojson "signalCatalogArn") _list path;
   }
    : list_model_manifests_request)

let list_model_manifest_nodes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     nodes = option_of_yojson (value_for_key nodes_of_yojson "nodes") _list path;
   }
    : list_model_manifest_nodes_response)

let list_model_manifest_nodes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : list_model_manifest_nodes_request)

let list_fleets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     fleet_summaries =
       option_of_yojson (value_for_key fleet_summaries_of_yojson "fleetSummaries") _list path;
   }
    : list_fleets_response)

let list_fleets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     list_response_scope =
       option_of_yojson (value_for_key list_response_scope_of_yojson "listResponseScope") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_fleets_request)

let list_fleets_for_vehicle_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     fleets = option_of_yojson (value_for_key fleets_of_yojson "fleets") _list path;
   }
    : list_fleets_for_vehicle_response)

let list_fleets_for_vehicle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
   }
    : list_fleets_for_vehicle_request)

let list_decoder_manifests_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     summaries =
       option_of_yojson (value_for_key decoder_manifest_summaries_of_yojson "summaries") _list path;
   }
    : list_decoder_manifests_response)

let list_decoder_manifests_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     list_response_scope =
       option_of_yojson (value_for_key list_response_scope_of_yojson "listResponseScope") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     model_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "modelManifestArn") _list path;
   }
    : list_decoder_manifests_request)

let list_decoder_manifest_signals_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     signal_decoders =
       option_of_yojson (value_for_key signal_decoders_of_yojson "signalDecoders") _list path;
   }
    : list_decoder_manifest_signals_response)

let list_decoder_manifest_signals_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : list_decoder_manifest_signals_request)

let list_decoder_manifest_network_interfaces_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     network_interfaces =
       option_of_yojson (value_for_key network_interfaces_of_yojson "networkInterfaces") _list path;
   }
    : list_decoder_manifest_network_interfaces_response)

let list_decoder_manifest_network_interfaces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : list_decoder_manifest_network_interfaces_request)

let list_campaigns_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     campaign_summaries =
       option_of_yojson (value_for_key campaign_summaries_of_yojson "campaignSummaries") _list path;
   }
    : list_campaigns_response)

let list_campaigns_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     list_response_scope =
       option_of_yojson (value_for_key list_response_scope_of_yojson "listResponseScope") _list path;
     status = option_of_yojson (value_for_key status_str_of_yojson "status") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_campaigns_request)

let get_vehicle_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     campaigns =
       option_of_yojson (value_for_key vehicle_status_list_of_yojson "campaigns") _list path;
   }
    : get_vehicle_status_response)

let get_vehicle_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_vehicle_status_request)

let iam_registration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "errorMessage") _list path;
     registration_status =
       value_for_key registration_status_of_yojson "registrationStatus" _list path;
     role_arn = value_for_key arn_of_yojson "roleArn" _list path;
   }
    : iam_registration_response)

let get_register_account_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     iam_registration_response =
       value_for_key iam_registration_response_of_yojson "iamRegistrationResponse" _list path;
     timestream_registration_response =
       option_of_yojson
         (value_for_key timestream_registration_response_of_yojson "timestreamRegistrationResponse")
         _list path;
     account_status = value_for_key registration_status_of_yojson "accountStatus" _list path;
     customer_account_id =
       value_for_key customer_account_id_of_yojson "customerAccountId" _list path;
   }
    : get_register_account_status_response)

let get_register_account_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

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

let get_encryption_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastModificationTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "errorMessage") _list path;
     encryption_type = value_for_key encryption_type_of_yojson "encryptionType" _list path;
     encryption_status = value_for_key encryption_status_of_yojson "encryptionStatus" _list path;
     kms_key_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "kmsKeyId")
         _list path;
   }
    : get_encryption_configuration_response)

let get_encryption_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let batch_update_vehicle_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors = option_of_yojson (value_for_key update_vehicle_errors_of_yojson "errors") _list path;
     vehicles =
       option_of_yojson
         (value_for_key update_vehicle_response_items_of_yojson "vehicles")
         _list path;
   }
    : batch_update_vehicle_response)

let batch_update_vehicle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vehicles = value_for_key update_vehicle_request_items_of_yojson "vehicles" _list path }
    : batch_update_vehicle_request)

let batch_create_vehicle_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors = option_of_yojson (value_for_key create_vehicle_errors_of_yojson "errors") _list path;
     vehicles =
       option_of_yojson (value_for_key create_vehicle_responses_of_yojson "vehicles") _list path;
   }
    : batch_create_vehicle_response)

let batch_create_vehicle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vehicles = value_for_key create_vehicle_request_items_of_yojson "vehicles" _list path }
    : batch_create_vehicle_request)

let import_signal_catalog_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : import_signal_catalog_response)

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

let import_signal_catalog_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     vss = option_of_yojson (value_for_key formatted_vss_of_yojson "vss") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : import_signal_catalog_request)

let import_decoder_manifest_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : import_decoder_manifest_response)

let import_decoder_manifest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     network_file_definitions =
       value_for_key network_file_definitions_of_yojson "networkFileDefinitions" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : import_decoder_manifest_request)

let get_vehicle_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastModificationTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     state_templates =
       option_of_yojson
         (value_for_key state_template_associations_of_yojson "stateTemplates")
         _list path;
     attributes = option_of_yojson (value_for_key attributes_map_of_yojson "attributes") _list path;
     decoder_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "decoderManifestArn") _list path;
     model_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "modelManifestArn") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     vehicle_name = option_of_yojson (value_for_key vehicle_name_of_yojson "vehicleName") _list path;
   }
    : get_vehicle_response)

let get_vehicle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path }
    : get_vehicle_request)

let get_state_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_unique_id_of_yojson "id") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastModificationTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     metadata_extra_dimensions =
       option_of_yojson
         (value_for_key state_template_metadata_extra_dimension_node_path_list_of_yojson
            "metadataExtraDimensions")
         _list path;
     data_extra_dimensions =
       option_of_yojson
         (value_for_key state_template_data_extra_dimension_node_path_list_of_yojson
            "dataExtraDimensions")
         _list path;
     state_template_properties =
       option_of_yojson
         (value_for_key state_template_properties_of_yojson "stateTemplateProperties")
         _list path;
     signal_catalog_arn =
       option_of_yojson (value_for_key arn_of_yojson "signalCatalogArn") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
   }
    : get_state_template_response)

let get_state_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key resource_identifier_of_yojson "identifier" _list path }
    : get_state_template_request)

let get_signal_catalog_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     node_counts = option_of_yojson (value_for_key node_counts_of_yojson "nodeCounts") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : get_signal_catalog_response)

let get_signal_catalog_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path } : get_signal_catalog_request)

let get_model_manifest_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     status = option_of_yojson (value_for_key manifest_status_of_yojson "status") _list path;
     signal_catalog_arn =
       option_of_yojson (value_for_key arn_of_yojson "signalCatalogArn") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : get_model_manifest_response)

let get_model_manifest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path } : get_model_manifest_request)

let get_fleet_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     signal_catalog_arn = value_for_key arn_of_yojson "signalCatalogArn" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     id = value_for_key fleet_id_of_yojson "id" _list path;
   }
    : get_fleet_response)

let get_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fleet_id = value_for_key fleet_id_of_yojson "fleetId" _list path } : get_fleet_request)

let get_decoder_manifest_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
     last_modification_time = value_for_key timestamp_of_yojson "lastModificationTime" _list path;
     creation_time = value_for_key timestamp_of_yojson "creationTime" _list path;
     status = option_of_yojson (value_for_key manifest_status_of_yojson "status") _list path;
     model_manifest_arn =
       option_of_yojson (value_for_key arn_of_yojson "modelManifestArn") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key string__of_yojson "name" _list path;
   }
    : get_decoder_manifest_response)

let get_decoder_manifest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path }
    : get_decoder_manifest_request)

let diagnostics_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "SEND_ACTIVE_DTCS" -> SEND_ACTIVE_DTCS
    | `String "OFF" -> OFF
    | `String value -> raise (deserialize_unknown_enum_value_error path "DiagnosticsMode" value)
    | _ -> raise (deserialize_wrong_type_error path "DiagnosticsMode")
     : diagnostics_mode)
    : diagnostics_mode)

let compression_of_yojson (tree : t) path =
  ((match tree with
    | `String "SNAPPY" -> SNAPPY
    | `String "OFF" -> OFF
    | `String value -> raise (deserialize_unknown_enum_value_error path "Compression" value)
    | _ -> raise (deserialize_wrong_type_error path "Compression")
     : compression)
    : compression)

let condition_based_collection_scheme_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     condition_language_version =
       option_of_yojson
         (value_for_key language_version_of_yojson "conditionLanguageVersion")
         _list path;
     trigger_mode = option_of_yojson (value_for_key trigger_mode_of_yojson "triggerMode") _list path;
     minimum_trigger_interval_ms =
       option_of_yojson (value_for_key uint32_of_yojson "minimumTriggerIntervalMs") _list path;
     expression = value_for_key event_expression_of_yojson "expression" _list path;
   }
    : condition_based_collection_scheme)

let collection_scheme_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "conditionBasedCollectionScheme" ->
       ConditionBasedCollectionScheme (condition_based_collection_scheme_of_yojson value_ path)
   | "timeBasedCollectionScheme" ->
       TimeBasedCollectionScheme (time_based_collection_scheme_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "CollectionScheme" unknown)
    : collection_scheme)

let data_destination_config_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "mqttTopicConfig" -> MqttTopicConfig (mqtt_topic_config_of_yojson value_ path)
   | "timestreamConfig" -> TimestreamConfig (timestream_config_of_yojson value_ path)
   | "s3Config" -> S3Config (s3_config_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "DataDestinationConfig" unknown)
    : data_destination_config)

let data_destination_configs_of_yojson tree path =
  list_of_yojson data_destination_config_of_yojson tree path

let data_partition_storage_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     minimum_time_to_live =
       value_for_key storage_minimum_time_to_live_of_yojson "minimumTimeToLive" _list path;
     storage_location = value_for_key storage_location_of_yojson "storageLocation" _list path;
     maximum_size = value_for_key storage_maximum_size_of_yojson "maximumSize" _list path;
   }
    : data_partition_storage_options)

let data_partition_upload_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     condition_language_version =
       option_of_yojson
         (value_for_key language_version_of_yojson "conditionLanguageVersion")
         _list path;
     expression = value_for_key event_expression_of_yojson "expression" _list path;
   }
    : data_partition_upload_options)

let data_partition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     upload_options =
       option_of_yojson
         (value_for_key data_partition_upload_options_of_yojson "uploadOptions")
         _list path;
     storage_options =
       value_for_key data_partition_storage_options_of_yojson "storageOptions" _list path;
     id = value_for_key data_partition_id_of_yojson "id" _list path;
   }
    : data_partition)

let data_partitions_of_yojson tree path = list_of_yojson data_partition_of_yojson tree path

let get_campaign_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     signals_to_fetch =
       option_of_yojson
         (value_for_key signal_fetch_information_list_of_yojson "signalsToFetch")
         _list path;
     data_partitions =
       option_of_yojson (value_for_key data_partitions_of_yojson "dataPartitions") _list path;
     data_destination_configs =
       option_of_yojson
         (value_for_key data_destination_configs_of_yojson "dataDestinationConfigs")
         _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastModificationTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     data_extra_dimensions =
       option_of_yojson
         (value_for_key data_extra_dimension_node_path_list_of_yojson "dataExtraDimensions")
         _list path;
     collection_scheme =
       option_of_yojson (value_for_key collection_scheme_of_yojson "collectionScheme") _list path;
     signals_to_collect =
       option_of_yojson
         (value_for_key signal_information_list_of_yojson "signalsToCollect")
         _list path;
     priority = option_of_yojson (value_for_key priority_of_yojson "priority") _list path;
     compression = option_of_yojson (value_for_key compression_of_yojson "compression") _list path;
     spooling_mode =
       option_of_yojson (value_for_key spooling_mode_of_yojson "spoolingMode") _list path;
     diagnostics_mode =
       option_of_yojson (value_for_key diagnostics_mode_of_yojson "diagnosticsMode") _list path;
     post_trigger_collection_duration =
       option_of_yojson (value_for_key uint32_of_yojson "postTriggerCollectionDuration") _list path;
     expiry_time = option_of_yojson (value_for_key timestamp_of_yojson "expiryTime") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     status = option_of_yojson (value_for_key campaign_status_of_yojson "status") _list path;
     target_arn = option_of_yojson (value_for_key arn_of_yojson "targetArn") _list path;
     signal_catalog_arn =
       option_of_yojson (value_for_key arn_of_yojson "signalCatalogArn") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     arn = option_of_yojson (value_for_key campaign_arn_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key campaign_name_of_yojson "name") _list path;
   }
    : get_campaign_response)

let get_campaign_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key campaign_name_of_yojson "name" _list path } : get_campaign_request)

let disassociate_vehicle_fleet_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_vehicle_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_of_yojson "fleetId" _list path;
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
   }
    : disassociate_vehicle_fleet_request)

let delete_vehicle_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key arn_of_yojson "arn" _list path;
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
   }
    : delete_vehicle_response)

let delete_vehicle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path }
    : delete_vehicle_request)

let delete_state_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_unique_id_of_yojson "id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
   }
    : delete_state_template_response)

let delete_state_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key resource_identifier_of_yojson "identifier" _list path }
    : delete_state_template_request)

let delete_signal_catalog_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : delete_signal_catalog_response)

let delete_signal_catalog_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path }
    : delete_signal_catalog_request)

let delete_model_manifest_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : delete_model_manifest_response)

let delete_model_manifest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path }
    : delete_model_manifest_request)

let delete_fleet_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     id = option_of_yojson (value_for_key fleet_id_of_yojson "id") _list path;
   }
    : delete_fleet_response)

let delete_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fleet_id = value_for_key fleet_id_of_yojson "fleetId" _list path } : delete_fleet_request)

let delete_decoder_manifest_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : delete_decoder_manifest_response)

let delete_decoder_manifest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key resource_name_of_yojson "name" _list path }
    : delete_decoder_manifest_request)

let delete_campaign_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key campaign_arn_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key campaign_name_of_yojson "name") _list path;
   }
    : delete_campaign_response)

let delete_campaign_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key campaign_name_of_yojson "name" _list path } : delete_campaign_request)

let create_vehicle_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     thing_arn = option_of_yojson (value_for_key arn_of_yojson "thingArn") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     vehicle_name = option_of_yojson (value_for_key vehicle_name_of_yojson "vehicleName") _list path;
   }
    : create_vehicle_response)

let create_vehicle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_templates =
       option_of_yojson
         (value_for_key state_template_associations_of_yojson "stateTemplates")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     association_behavior =
       option_of_yojson
         (value_for_key vehicle_association_behavior_of_yojson "associationBehavior")
         _list path;
     attributes = option_of_yojson (value_for_key attributes_map_of_yojson "attributes") _list path;
     decoder_manifest_arn = value_for_key arn_of_yojson "decoderManifestArn" _list path;
     model_manifest_arn = value_for_key arn_of_yojson "modelManifestArn" _list path;
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
   }
    : create_vehicle_request)

let create_state_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_unique_id_of_yojson "id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
   }
    : create_state_template_response)

let create_state_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     metadata_extra_dimensions =
       option_of_yojson
         (value_for_key state_template_metadata_extra_dimension_node_path_list_of_yojson
            "metadataExtraDimensions")
         _list path;
     data_extra_dimensions =
       option_of_yojson
         (value_for_key state_template_data_extra_dimension_node_path_list_of_yojson
            "dataExtraDimensions")
         _list path;
     state_template_properties =
       value_for_key state_template_properties_of_yojson "stateTemplateProperties" _list path;
     signal_catalog_arn = value_for_key arn_of_yojson "signalCatalogArn" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : create_state_template_request)

let create_signal_catalog_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : create_signal_catalog_response)

let create_signal_catalog_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     nodes = option_of_yojson (value_for_key nodes_of_yojson "nodes") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : create_signal_catalog_request)

let create_model_manifest_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : create_model_manifest_response)

let create_model_manifest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     signal_catalog_arn = value_for_key arn_of_yojson "signalCatalogArn" _list path;
     nodes = value_for_key list_of_strings_of_yojson "nodes" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : create_model_manifest_request)

let create_fleet_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key arn_of_yojson "arn" _list path;
     id = value_for_key fleet_id_of_yojson "id" _list path;
   }
    : create_fleet_response)

let create_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     signal_catalog_arn = value_for_key arn_of_yojson "signalCatalogArn" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     fleet_id = value_for_key fleet_id_of_yojson "fleetId" _list path;
   }
    : create_fleet_request)

let create_decoder_manifest_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : create_decoder_manifest_response)

let create_decoder_manifest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     default_for_unmapped_signals =
       option_of_yojson
         (value_for_key default_for_unmapped_signals_type_of_yojson "defaultForUnmappedSignals")
         _list path;
     network_interfaces =
       option_of_yojson (value_for_key network_interfaces_of_yojson "networkInterfaces") _list path;
     signal_decoders =
       option_of_yojson (value_for_key signal_decoders_of_yojson "signalDecoders") _list path;
     model_manifest_arn = value_for_key arn_of_yojson "modelManifestArn" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key resource_name_of_yojson "name" _list path;
   }
    : create_decoder_manifest_request)

let create_campaign_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key campaign_arn_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key campaign_name_of_yojson "name") _list path;
   }
    : create_campaign_response)

let create_campaign_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     signals_to_fetch =
       option_of_yojson
         (value_for_key signal_fetch_information_list_of_yojson "signalsToFetch")
         _list path;
     data_partitions =
       option_of_yojson (value_for_key data_partitions_of_yojson "dataPartitions") _list path;
     data_destination_configs =
       option_of_yojson
         (value_for_key data_destination_configs_of_yojson "dataDestinationConfigs")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     data_extra_dimensions =
       option_of_yojson
         (value_for_key data_extra_dimension_node_path_list_of_yojson "dataExtraDimensions")
         _list path;
     collection_scheme = value_for_key collection_scheme_of_yojson "collectionScheme" _list path;
     signals_to_collect =
       option_of_yojson
         (value_for_key signal_information_list_of_yojson "signalsToCollect")
         _list path;
     priority = option_of_yojson (value_for_key priority_of_yojson "priority") _list path;
     compression = option_of_yojson (value_for_key compression_of_yojson "compression") _list path;
     spooling_mode =
       option_of_yojson (value_for_key spooling_mode_of_yojson "spoolingMode") _list path;
     diagnostics_mode =
       option_of_yojson (value_for_key diagnostics_mode_of_yojson "diagnosticsMode") _list path;
     post_trigger_collection_duration =
       option_of_yojson (value_for_key uint32_of_yojson "postTriggerCollectionDuration") _list path;
     expiry_time = option_of_yojson (value_for_key timestamp_of_yojson "expiryTime") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     target_arn = value_for_key arn_of_yojson "targetArn" _list path;
     signal_catalog_arn = value_for_key arn_of_yojson "signalCatalogArn" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key campaign_name_of_yojson "name" _list path;
   }
    : create_campaign_request)

let associate_vehicle_fleet_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_vehicle_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_of_yojson "fleetId" _list path;
     vehicle_name = value_for_key vehicle_name_of_yojson "vehicleName" _list path;
   }
    : associate_vehicle_fleet_request)
