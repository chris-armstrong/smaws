open Smaws_Lib.Json.DeserializeHelpers
open Types

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quota_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "quotaCode")
         _list path;
     service_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "serviceCode")
         _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : throttling_exception)

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "POLICY_STORE_ALIAS" -> POLICY_STORE_ALIAS
    | `String "SCHEMA" -> SCHEMA
    | `String "POLICY_TEMPLATE" -> POLICY_TEMPLATE
    | `String "POLICY" -> POLICY
    | `String "POLICY_STORE" -> POLICY_STORE
    | `String "IDENTITY_SOURCE" -> IDENTITY_SOURCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key resource_type_of_yojson "resourceType" _list path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId" _list
         path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : internal_server_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : access_denied_exception)

let untag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let amazon_resource_name_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "tagKeys" _list path;
     resource_arn = value_for_key amazon_resource_name_of_yojson "resourceArn" _list path;
   }
    : untag_resource_input)

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "resourceName") _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : too_many_tags_exception)

let tag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_value_of_yojson = string_of_yojson
let tag_map_of_yojson tree path = map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path

let tag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_map_of_yojson "tags" _list path;
     resource_arn = value_for_key amazon_resource_name_of_yojson "resourceArn" _list path;
   }
    : tag_resource_input)

let list_tags_for_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_map_of_yojson "tags") _list path }
    : list_tags_for_resource_output)

let list_tags_for_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key amazon_resource_name_of_yojson "resourceArn" _list path }
    : list_tags_for_resource_input)

let validation_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "STRICT" -> STRICT
    | `String "OFF" -> OFF
    | `String value -> raise (deserialize_unknown_enum_value_error path "ValidationMode" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationMode")
     : validation_mode)
    : validation_mode)

let validation_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ mode = value_for_key validation_mode_of_yojson "mode" _list path } : validation_settings)

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     path =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "path" _list path;
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
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : validation_exception)

let user_pool_arn_of_yojson = string_of_yojson
let static_policy_description_of_yojson = string_of_yojson
let policy_statement_of_yojson = string_of_yojson

let update_static_policy_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     statement = value_for_key policy_statement_of_yojson "statement" _list path;
     description =
       option_of_yojson (value_for_key static_policy_description_of_yojson "description") _list path;
   }
    : update_static_policy_definition)

let policy_store_id_of_yojson = string_of_yojson
let policy_template_id_of_yojson = string_of_yojson
let timestamp_format_of_yojson = timestamp_iso_8601_of_yojson

let update_policy_template_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_date = value_for_key timestamp_format_of_yojson "lastUpdatedDate" _list path;
     created_date = value_for_key timestamp_format_of_yojson "createdDate" _list path;
     policy_template_id = value_for_key policy_template_id_of_yojson "policyTemplateId" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : update_policy_template_output)

let policy_template_description_of_yojson = string_of_yojson
let policy_template_name_of_yojson = string_of_yojson

let update_policy_template_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key policy_template_name_of_yojson "name") _list path;
     statement = value_for_key policy_statement_of_yojson "statement" _list path;
     description =
       option_of_yojson
         (value_for_key policy_template_description_of_yojson "description")
         _list path;
     policy_template_id = value_for_key policy_template_id_of_yojson "policyTemplateId" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : update_policy_template_input)

let resource_conflict_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key resource_type_of_yojson "resourceType" _list path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId" _list
         path;
   }
    : resource_conflict)

let resource_conflict_list_of_yojson tree path =
  list_of_yojson resource_conflict_of_yojson tree path

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resources = value_for_key resource_conflict_list_of_yojson "resources" _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : conflict_exception)

let resource_arn_of_yojson = string_of_yojson

let update_policy_store_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_date = value_for_key timestamp_format_of_yojson "lastUpdatedDate" _list path;
     created_date = value_for_key timestamp_format_of_yojson "createdDate" _list path;
     arn = value_for_key resource_arn_of_yojson "arn" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : update_policy_store_output)

let deletion_protection_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeletionProtection" value)
    | _ -> raise (deserialize_wrong_type_error path "DeletionProtection")
     : deletion_protection)
    : deletion_protection)

let policy_store_description_of_yojson = string_of_yojson

let update_policy_store_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key policy_store_description_of_yojson "description") _list path;
     deletion_protection =
       option_of_yojson
         (value_for_key deletion_protection_of_yojson "deletionProtection")
         _list path;
     validation_settings =
       value_for_key validation_settings_of_yojson "validationSettings" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : update_policy_store_input)

let policy_id_of_yojson = string_of_yojson

let policy_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TEMPLATE_LINKED" -> TEMPLATE_LINKED
    | `String "STATIC" -> STATIC
    | `String value -> raise (deserialize_unknown_enum_value_error path "PolicyType" value)
    | _ -> raise (deserialize_wrong_type_error path "PolicyType")
     : policy_type)
    : policy_type)

let entity_type_of_yojson = string_of_yojson
let entity_id_of_yojson = string_of_yojson

let entity_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_id = value_for_key entity_id_of_yojson "entityId" _list path;
     entity_type = value_for_key entity_type_of_yojson "entityType" _list path;
   }
    : entity_identifier)

let action_type_of_yojson = string_of_yojson
let action_id_of_yojson = string_of_yojson

let action_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_id = value_for_key action_id_of_yojson "actionId" _list path;
     action_type = value_for_key action_type_of_yojson "actionType" _list path;
   }
    : action_identifier)

let action_identifier_list_of_yojson tree path =
  list_of_yojson action_identifier_of_yojson tree path

let policy_effect_of_yojson (tree : t) path =
  ((match tree with
    | `String "Forbid" -> FORBID
    | `String "Permit" -> PERMIT
    | `String value -> raise (deserialize_unknown_enum_value_error path "PolicyEffect" value)
    | _ -> raise (deserialize_wrong_type_error path "PolicyEffect")
     : policy_effect)
    : policy_effect)

let update_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     effect_ = option_of_yojson (value_for_key policy_effect_of_yojson "effect") _list path;
     last_updated_date = value_for_key timestamp_format_of_yojson "lastUpdatedDate" _list path;
     created_date = value_for_key timestamp_format_of_yojson "createdDate" _list path;
     actions =
       option_of_yojson (value_for_key action_identifier_list_of_yojson "actions") _list path;
     resource = option_of_yojson (value_for_key entity_identifier_of_yojson "resource") _list path;
     principal = option_of_yojson (value_for_key entity_identifier_of_yojson "principal") _list path;
     policy_type = value_for_key policy_type_of_yojson "policyType" _list path;
     policy_id = value_for_key policy_id_of_yojson "policyId" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : update_policy_output)

let update_policy_definition_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "static" -> Static (update_static_policy_definition_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "UpdatePolicyDefinition" unknown)
    : update_policy_definition)

let policy_name_of_yojson = string_of_yojson

let update_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key policy_name_of_yojson "name") _list path;
     definition =
       option_of_yojson (value_for_key update_policy_definition_of_yojson "definition") _list path;
     policy_id = value_for_key policy_id_of_yojson "policyId" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : update_policy_input)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quota_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "quotaCode")
         _list path;
     service_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "serviceCode")
         _list path;
     resource_type = value_for_key resource_type_of_yojson "resourceType" _list path;
     resource_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId")
         _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : service_quota_exceeded_exception)

let claim_of_yojson = string_of_yojson
let audience_of_yojson = string_of_yojson
let audiences_of_yojson tree path = list_of_yojson audience_of_yojson tree path

let update_open_id_connect_access_token_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     audiences = option_of_yojson (value_for_key audiences_of_yojson "audiences") _list path;
     principal_id_claim =
       option_of_yojson (value_for_key claim_of_yojson "principalIdClaim") _list path;
   }
    : update_open_id_connect_access_token_configuration)

let client_id_of_yojson = string_of_yojson
let client_ids_of_yojson tree path = list_of_yojson client_id_of_yojson tree path

let update_open_id_connect_identity_token_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_ids = option_of_yojson (value_for_key client_ids_of_yojson "clientIds") _list path;
     principal_id_claim =
       option_of_yojson (value_for_key claim_of_yojson "principalIdClaim") _list path;
   }
    : update_open_id_connect_identity_token_configuration)

let update_open_id_connect_token_selection_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "identityTokenOnly" ->
       IdentityTokenOnly (update_open_id_connect_identity_token_configuration_of_yojson value_ path)
   | "accessTokenOnly" ->
       AccessTokenOnly (update_open_id_connect_access_token_configuration_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "UpdateOpenIdConnectTokenSelection" unknown)
    : update_open_id_connect_token_selection)

let group_entity_type_of_yojson = string_of_yojson

let update_open_id_connect_group_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_entity_type = value_for_key group_entity_type_of_yojson "groupEntityType" _list path;
     group_claim = value_for_key claim_of_yojson "groupClaim" _list path;
   }
    : update_open_id_connect_group_configuration)

let issuer_of_yojson = string_of_yojson
let entity_id_prefix_of_yojson = string_of_yojson

let update_open_id_connect_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token_selection =
       value_for_key update_open_id_connect_token_selection_of_yojson "tokenSelection" _list path;
     group_configuration =
       option_of_yojson
         (value_for_key update_open_id_connect_group_configuration_of_yojson "groupConfiguration")
         _list path;
     entity_id_prefix =
       option_of_yojson (value_for_key entity_id_prefix_of_yojson "entityIdPrefix") _list path;
     issuer = value_for_key issuer_of_yojson "issuer" _list path;
   }
    : update_open_id_connect_configuration)

let identity_source_id_of_yojson = string_of_yojson

let update_identity_source_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
     last_updated_date = value_for_key timestamp_format_of_yojson "lastUpdatedDate" _list path;
     identity_source_id = value_for_key identity_source_id_of_yojson "identitySourceId" _list path;
     created_date = value_for_key timestamp_format_of_yojson "createdDate" _list path;
   }
    : update_identity_source_output)

let update_cognito_group_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ group_entity_type = value_for_key group_entity_type_of_yojson "groupEntityType" _list path }
    : update_cognito_group_configuration)

let update_cognito_user_pool_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_configuration =
       option_of_yojson
         (value_for_key update_cognito_group_configuration_of_yojson "groupConfiguration")
         _list path;
     client_ids = option_of_yojson (value_for_key client_ids_of_yojson "clientIds") _list path;
     user_pool_arn = value_for_key user_pool_arn_of_yojson "userPoolArn" _list path;
   }
    : update_cognito_user_pool_configuration)

let update_configuration_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "openIdConnectConfiguration" ->
       OpenIdConnectConfiguration (update_open_id_connect_configuration_of_yojson value_ path)
   | "cognitoUserPoolConfiguration" ->
       CognitoUserPoolConfiguration (update_cognito_user_pool_configuration_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "UpdateConfiguration" unknown)
    : update_configuration)

let principal_entity_type_of_yojson = string_of_yojson

let update_identity_source_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_entity_type =
       option_of_yojson
         (value_for_key principal_entity_type_of_yojson "principalEntityType")
         _list path;
     update_configuration =
       value_for_key update_configuration_of_yojson "updateConfiguration" _list path;
     identity_source_id = value_for_key identity_source_id_of_yojson "identitySourceId" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : update_identity_source_input)

let token_of_yojson = string_of_yojson

let template_linked_policy_definition_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource = option_of_yojson (value_for_key entity_identifier_of_yojson "resource") _list path;
     principal = option_of_yojson (value_for_key entity_identifier_of_yojson "principal") _list path;
     policy_template_id = value_for_key policy_template_id_of_yojson "policyTemplateId" _list path;
   }
    : template_linked_policy_definition_item)

let template_linked_policy_definition_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource = option_of_yojson (value_for_key entity_identifier_of_yojson "resource") _list path;
     principal = option_of_yojson (value_for_key entity_identifier_of_yojson "principal") _list path;
     policy_template_id = value_for_key policy_template_id_of_yojson "policyTemplateId" _list path;
   }
    : template_linked_policy_definition_detail)

let template_linked_policy_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource = option_of_yojson (value_for_key entity_identifier_of_yojson "resource") _list path;
     principal = option_of_yojson (value_for_key entity_identifier_of_yojson "principal") _list path;
     policy_template_id = value_for_key policy_template_id_of_yojson "policyTemplateId" _list path;
   }
    : template_linked_policy_definition)

let string_attribute_of_yojson = string_of_yojson

let static_policy_definition_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key static_policy_description_of_yojson "description") _list path;
   }
    : static_policy_definition_item)

let static_policy_definition_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     statement = value_for_key policy_statement_of_yojson "statement" _list path;
     description =
       option_of_yojson (value_for_key static_policy_description_of_yojson "description") _list path;
   }
    : static_policy_definition_detail)

let static_policy_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     statement = value_for_key policy_statement_of_yojson "statement" _list path;
     description =
       option_of_yojson (value_for_key static_policy_description_of_yojson "description") _list path;
   }
    : static_policy_definition)

let boolean_attribute_of_yojson = bool_of_yojson
let long_attribute_of_yojson = long_of_yojson
let ip_addr_of_yojson = string_of_yojson
let decimal_of_yojson = string_of_yojson
let datetime_attribute_of_yojson = string_of_yojson
let duration_of_yojson = string_of_yojson

let rec attribute_value_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "duration" -> Duration (duration_of_yojson value_ path)
   | "datetime" -> Datetime (datetime_attribute_of_yojson value_ path)
   | "decimal" -> Decimal (decimal_of_yojson value_ path)
   | "ipaddr" -> Ipaddr (ip_addr_of_yojson value_ path)
   | "record" -> Record (record_attribute_of_yojson value_ path)
   | "set" -> Set (set_attribute_of_yojson value_ path)
   | "string" -> String (string_attribute_of_yojson value_ path)
   | "long" -> Long (long_attribute_of_yojson value_ path)
   | "entityIdentifier" -> EntityIdentifier (entity_identifier_of_yojson value_ path)
   | "boolean" -> Boolean (boolean_attribute_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "AttributeValue" unknown)
    : attribute_value)

and record_attribute_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson attribute_value_of_yojson
    tree path

and set_attribute_of_yojson tree path = list_of_yojson attribute_value_of_yojson tree path

let schema_json_of_yojson = string_of_yojson

let schema_definition_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "cedarJson" -> CedarJson (schema_json_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "SchemaDefinition" unknown)
    : schema_definition)

let namespace_of_yojson = string_of_yojson
let namespace_list_of_yojson tree path = list_of_yojson namespace_of_yojson tree path

let put_schema_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_date = value_for_key timestamp_format_of_yojson "lastUpdatedDate" _list path;
     created_date = value_for_key timestamp_format_of_yojson "createdDate" _list path;
     namespaces = value_for_key namespace_list_of_yojson "namespaces" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : put_schema_output)

let put_schema_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     definition = value_for_key schema_definition_of_yojson "definition" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : put_schema_input)

let policy_template_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key policy_template_name_of_yojson "name") _list path;
     last_updated_date = value_for_key timestamp_format_of_yojson "lastUpdatedDate" _list path;
     created_date = value_for_key timestamp_format_of_yojson "createdDate" _list path;
     description =
       option_of_yojson
         (value_for_key policy_template_description_of_yojson "description")
         _list path;
     policy_template_id = value_for_key policy_template_id_of_yojson "policyTemplateId" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : policy_template_item)

let policy_templates_list_of_yojson tree path =
  list_of_yojson policy_template_item_of_yojson tree path

let policy_store_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key policy_store_description_of_yojson "description") _list path;
     last_updated_date =
       option_of_yojson (value_for_key timestamp_format_of_yojson "lastUpdatedDate") _list path;
     created_date = value_for_key timestamp_format_of_yojson "createdDate" _list path;
     arn = value_for_key resource_arn_of_yojson "arn" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : policy_store_item)

let policy_store_list_of_yojson tree path = list_of_yojson policy_store_item_of_yojson tree path
let alias_of_yojson = string_of_yojson

let alias_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "PendingDeletion" -> PENDING_DELETION
    | `String "Active" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AliasState" value)
    | _ -> raise (deserialize_wrong_type_error path "AliasState")
     : alias_state)
    : alias_state)

let policy_store_alias_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = value_for_key alias_state_of_yojson "state" _list path;
     created_at = value_for_key timestamp_format_of_yojson "createdAt" _list path;
     alias_arn = value_for_key resource_arn_of_yojson "aliasArn" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
     alias_name = value_for_key alias_of_yojson "aliasName" _list path;
   }
    : policy_store_alias_item)

let policy_store_alias_list_of_yojson tree path =
  list_of_yojson policy_store_alias_item_of_yojson tree path

let policy_store_alias_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_store_id =
       option_of_yojson (value_for_key policy_store_id_of_yojson "policyStoreId") _list path;
   }
    : policy_store_alias_filter)

let policy_definition_item_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "templateLinked" ->
       TemplateLinked (template_linked_policy_definition_item_of_yojson value_ path)
   | "static" -> Static (static_policy_definition_item_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "PolicyDefinitionItem" unknown)
    : policy_definition_item)

let policy_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key policy_name_of_yojson "name") _list path;
     effect_ = option_of_yojson (value_for_key policy_effect_of_yojson "effect") _list path;
     last_updated_date = value_for_key timestamp_format_of_yojson "lastUpdatedDate" _list path;
     created_date = value_for_key timestamp_format_of_yojson "createdDate" _list path;
     definition = value_for_key policy_definition_item_of_yojson "definition" _list path;
     actions =
       option_of_yojson (value_for_key action_identifier_list_of_yojson "actions") _list path;
     resource = option_of_yojson (value_for_key entity_identifier_of_yojson "resource") _list path;
     principal = option_of_yojson (value_for_key entity_identifier_of_yojson "principal") _list path;
     policy_type = value_for_key policy_type_of_yojson "policyType" _list path;
     policy_id = value_for_key policy_id_of_yojson "policyId" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : policy_item)

let policy_list_of_yojson tree path = list_of_yojson policy_item_of_yojson tree path

let entity_reference_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "identifier" -> Identifier (entity_identifier_of_yojson value_ path)
   | "unspecified" ->
       Unspecified (Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "EntityReference" unknown)
    : entity_reference)

let policy_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_template_id =
       option_of_yojson (value_for_key policy_template_id_of_yojson "policyTemplateId") _list path;
     policy_type = option_of_yojson (value_for_key policy_type_of_yojson "policyType") _list path;
     resource = option_of_yojson (value_for_key entity_reference_of_yojson "resource") _list path;
     principal = option_of_yojson (value_for_key entity_reference_of_yojson "principal") _list path;
   }
    : policy_filter)

let policy_definition_detail_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "templateLinked" ->
       TemplateLinked (template_linked_policy_definition_detail_of_yojson value_ path)
   | "static" -> Static (static_policy_definition_detail_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "PolicyDefinitionDetail" unknown)
    : policy_definition_detail)

let policy_definition_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "templateLinked" -> TemplateLinked (template_linked_policy_definition_of_yojson value_ path)
   | "static" -> Static (static_policy_definition_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "PolicyDefinition" unknown)
    : policy_definition)

let parent_list_of_yojson tree path = list_of_yojson entity_identifier_of_yojson tree path

let open_id_issuer_of_yojson (tree : t) path =
  ((match tree with
    | `String "COGNITO" -> COGNITO
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpenIdIssuer" value)
    | _ -> raise (deserialize_wrong_type_error path "OpenIdIssuer")
     : open_id_issuer)
    : open_id_issuer)

let open_id_connect_access_token_configuration_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     audiences = option_of_yojson (value_for_key audiences_of_yojson "audiences") _list path;
     principal_id_claim =
       option_of_yojson (value_for_key claim_of_yojson "principalIdClaim") _list path;
   }
    : open_id_connect_access_token_configuration_item)

let open_id_connect_identity_token_configuration_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_ids = option_of_yojson (value_for_key client_ids_of_yojson "clientIds") _list path;
     principal_id_claim =
       option_of_yojson (value_for_key claim_of_yojson "principalIdClaim") _list path;
   }
    : open_id_connect_identity_token_configuration_item)

let open_id_connect_token_selection_item_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "identityTokenOnly" ->
       IdentityTokenOnly (open_id_connect_identity_token_configuration_item_of_yojson value_ path)
   | "accessTokenOnly" ->
       AccessTokenOnly (open_id_connect_access_token_configuration_item_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "OpenIdConnectTokenSelectionItem" unknown)
    : open_id_connect_token_selection_item)

let open_id_connect_access_token_configuration_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     audiences = option_of_yojson (value_for_key audiences_of_yojson "audiences") _list path;
     principal_id_claim =
       option_of_yojson (value_for_key claim_of_yojson "principalIdClaim") _list path;
   }
    : open_id_connect_access_token_configuration_detail)

let open_id_connect_identity_token_configuration_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_ids = option_of_yojson (value_for_key client_ids_of_yojson "clientIds") _list path;
     principal_id_claim =
       option_of_yojson (value_for_key claim_of_yojson "principalIdClaim") _list path;
   }
    : open_id_connect_identity_token_configuration_detail)

let open_id_connect_token_selection_detail_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "identityTokenOnly" ->
       IdentityTokenOnly (open_id_connect_identity_token_configuration_detail_of_yojson value_ path)
   | "accessTokenOnly" ->
       AccessTokenOnly (open_id_connect_access_token_configuration_detail_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "OpenIdConnectTokenSelectionDetail" unknown)
    : open_id_connect_token_selection_detail)

let open_id_connect_access_token_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     audiences = option_of_yojson (value_for_key audiences_of_yojson "audiences") _list path;
     principal_id_claim =
       option_of_yojson (value_for_key claim_of_yojson "principalIdClaim") _list path;
   }
    : open_id_connect_access_token_configuration)

let open_id_connect_identity_token_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_ids = option_of_yojson (value_for_key client_ids_of_yojson "clientIds") _list path;
     principal_id_claim =
       option_of_yojson (value_for_key claim_of_yojson "principalIdClaim") _list path;
   }
    : open_id_connect_identity_token_configuration)

let open_id_connect_token_selection_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "identityTokenOnly" ->
       IdentityTokenOnly (open_id_connect_identity_token_configuration_of_yojson value_ path)
   | "accessTokenOnly" ->
       AccessTokenOnly (open_id_connect_access_token_configuration_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "OpenIdConnectTokenSelection" unknown)
    : open_id_connect_token_selection)

let open_id_connect_group_configuration_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_entity_type = value_for_key group_entity_type_of_yojson "groupEntityType" _list path;
     group_claim = value_for_key claim_of_yojson "groupClaim" _list path;
   }
    : open_id_connect_group_configuration_item)

let open_id_connect_group_configuration_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_entity_type = value_for_key group_entity_type_of_yojson "groupEntityType" _list path;
     group_claim = value_for_key claim_of_yojson "groupClaim" _list path;
   }
    : open_id_connect_group_configuration_detail)

let open_id_connect_group_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_entity_type = value_for_key group_entity_type_of_yojson "groupEntityType" _list path;
     group_claim = value_for_key claim_of_yojson "groupClaim" _list path;
   }
    : open_id_connect_group_configuration)

let open_id_connect_configuration_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token_selection =
       value_for_key open_id_connect_token_selection_item_of_yojson "tokenSelection" _list path;
     group_configuration =
       option_of_yojson
         (value_for_key open_id_connect_group_configuration_item_of_yojson "groupConfiguration")
         _list path;
     entity_id_prefix =
       option_of_yojson (value_for_key entity_id_prefix_of_yojson "entityIdPrefix") _list path;
     issuer = value_for_key issuer_of_yojson "issuer" _list path;
   }
    : open_id_connect_configuration_item)

let open_id_connect_configuration_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token_selection =
       value_for_key open_id_connect_token_selection_detail_of_yojson "tokenSelection" _list path;
     group_configuration =
       option_of_yojson
         (value_for_key open_id_connect_group_configuration_detail_of_yojson "groupConfiguration")
         _list path;
     entity_id_prefix =
       option_of_yojson (value_for_key entity_id_prefix_of_yojson "entityIdPrefix") _list path;
     issuer = value_for_key issuer_of_yojson "issuer" _list path;
   }
    : open_id_connect_configuration_detail)

let open_id_connect_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token_selection =
       value_for_key open_id_connect_token_selection_of_yojson "tokenSelection" _list path;
     group_configuration =
       option_of_yojson
         (value_for_key open_id_connect_group_configuration_of_yojson "groupConfiguration")
         _list path;
     entity_id_prefix =
       option_of_yojson (value_for_key entity_id_prefix_of_yojson "entityIdPrefix") _list path;
     issuer = value_for_key issuer_of_yojson "issuer" _list path;
   }
    : open_id_connect_configuration)

let next_token_of_yojson = string_of_yojson
let max_results_of_yojson = int_of_yojson

let list_policy_templates_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_templates = value_for_key policy_templates_list_of_yojson "policyTemplates" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_policy_templates_output)

let list_policy_templates_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : list_policy_templates_input)

let list_policy_stores_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_stores = value_for_key policy_store_list_of_yojson "policyStores" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_policy_stores_output)

let list_policy_stores_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_policy_stores_input)

let list_policy_store_aliases_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_store_aliases =
       value_for_key policy_store_alias_list_of_yojson "policyStoreAliases" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_policy_store_aliases_output)

let list_policy_store_aliases_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson (value_for_key policy_store_alias_filter_of_yojson "filter") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_policy_store_aliases_input)

let list_policies_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policies = value_for_key policy_list_of_yojson "policies" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_policies_output)

let list_policies_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key policy_filter_of_yojson "filter") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : list_policies_input)

let discovery_url_of_yojson = string_of_yojson

let identity_source_item_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     open_id_issuer =
       option_of_yojson (value_for_key open_id_issuer_of_yojson "openIdIssuer") _list path;
     discovery_url =
       option_of_yojson (value_for_key discovery_url_of_yojson "discoveryUrl") _list path;
     user_pool_arn =
       option_of_yojson (value_for_key user_pool_arn_of_yojson "userPoolArn") _list path;
     client_ids = option_of_yojson (value_for_key client_ids_of_yojson "clientIds") _list path;
   }
    : identity_source_item_details)

let cognito_group_configuration_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_entity_type =
       option_of_yojson (value_for_key group_entity_type_of_yojson "groupEntityType") _list path;
   }
    : cognito_group_configuration_item)

let cognito_user_pool_configuration_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_configuration =
       option_of_yojson
         (value_for_key cognito_group_configuration_item_of_yojson "groupConfiguration")
         _list path;
     issuer = value_for_key issuer_of_yojson "issuer" _list path;
     client_ids = value_for_key client_ids_of_yojson "clientIds" _list path;
     user_pool_arn = value_for_key user_pool_arn_of_yojson "userPoolArn" _list path;
   }
    : cognito_user_pool_configuration_item)

let configuration_item_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "openIdConnectConfiguration" ->
       OpenIdConnectConfiguration (open_id_connect_configuration_item_of_yojson value_ path)
   | "cognitoUserPoolConfiguration" ->
       CognitoUserPoolConfiguration (cognito_user_pool_configuration_item_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "ConfigurationItem" unknown)
    : configuration_item)

let identity_source_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson (value_for_key configuration_item_of_yojson "configuration") _list path;
     principal_entity_type =
       value_for_key principal_entity_type_of_yojson "principalEntityType" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
     last_updated_date = value_for_key timestamp_format_of_yojson "lastUpdatedDate" _list path;
     identity_source_id = value_for_key identity_source_id_of_yojson "identitySourceId" _list path;
     details =
       option_of_yojson (value_for_key identity_source_item_details_of_yojson "details") _list path;
     created_date = value_for_key timestamp_format_of_yojson "createdDate" _list path;
   }
    : identity_source_item)

let identity_sources_of_yojson tree path = list_of_yojson identity_source_item_of_yojson tree path

let list_identity_sources_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_sources = value_for_key identity_sources_of_yojson "identitySources" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_identity_sources_output)

let list_identity_sources_max_results_of_yojson = int_of_yojson

let identity_source_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_entity_type =
       option_of_yojson
         (value_for_key principal_entity_type_of_yojson "principalEntityType")
         _list path;
   }
    : identity_source_filter)

let identity_source_filters_of_yojson tree path =
  list_of_yojson identity_source_filter_of_yojson tree path

let list_identity_sources_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson (value_for_key identity_source_filters_of_yojson "filters") _list path;
     max_results =
       option_of_yojson
         (value_for_key list_identity_sources_max_results_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : list_identity_sources_input)

let kms_key_of_yojson = string_of_yojson
let encryption_context_value_of_yojson = string_of_yojson
let encryption_context_key_of_yojson = string_of_yojson

let encryption_context_of_yojson tree path =
  map_of_yojson encryption_context_key_of_yojson encryption_context_value_of_yojson tree path

let kms_encryption_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_context = value_for_key encryption_context_of_yojson "encryptionContext" _list path;
     key = value_for_key kms_key_of_yojson "key" _list path;
   }
    : kms_encryption_state)

let kms_encryption_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_context =
       option_of_yojson (value_for_key encryption_context_of_yojson "encryptionContext") _list path;
     key = value_for_key kms_key_of_yojson "key" _list path;
   }
    : kms_encryption_settings)

let decision_of_yojson (tree : t) path =
  ((match tree with
    | `String "DENY" -> DENY
    | `String "ALLOW" -> ALLOW
    | `String value -> raise (deserialize_unknown_enum_value_error path "Decision" value)
    | _ -> raise (deserialize_wrong_type_error path "Decision")
     : decision)
    : decision)

let determining_policy_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy_id = value_for_key policy_id_of_yojson "policyId" _list path }
    : determining_policy_item)

let determining_policy_list_of_yojson tree path =
  list_of_yojson determining_policy_item_of_yojson tree path

let evaluation_error_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_description =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorDescription"
         _list path;
   }
    : evaluation_error_item)

let evaluation_error_list_of_yojson tree path =
  list_of_yojson evaluation_error_item_of_yojson tree path

let is_authorized_with_token_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal = option_of_yojson (value_for_key entity_identifier_of_yojson "principal") _list path;
     errors = value_for_key evaluation_error_list_of_yojson "errors" _list path;
     determining_policies =
       value_for_key determining_policy_list_of_yojson "determiningPolicies" _list path;
     decision = value_for_key decision_of_yojson "decision" _list path;
   }
    : is_authorized_with_token_output)

let context_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson attribute_value_of_yojson
    tree path

let cedar_json_of_yojson = string_of_yojson

let context_definition_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "cedarJson" -> CedarJson (cedar_json_of_yojson value_ path)
   | "contextMap" -> ContextMap (context_map_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "ContextDefinition" unknown)
    : context_definition)

let entity_attributes_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson attribute_value_of_yojson
    tree path

let rec cedar_tag_record_attribute_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson cedar_tag_value_of_yojson
    tree path

and cedar_tag_set_attribute_of_yojson tree path = list_of_yojson cedar_tag_value_of_yojson tree path

and cedar_tag_value_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "duration" -> Duration (duration_of_yojson value_ path)
   | "datetime" -> Datetime (datetime_attribute_of_yojson value_ path)
   | "decimal" -> Decimal (decimal_of_yojson value_ path)
   | "ipaddr" -> Ipaddr (ip_addr_of_yojson value_ path)
   | "record" -> Record (cedar_tag_record_attribute_of_yojson value_ path)
   | "set" -> Set (cedar_tag_set_attribute_of_yojson value_ path)
   | "string" -> String (string_attribute_of_yojson value_ path)
   | "long" -> Long (long_attribute_of_yojson value_ path)
   | "entityIdentifier" -> EntityIdentifier (entity_identifier_of_yojson value_ path)
   | "boolean" -> Boolean (boolean_attribute_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "CedarTagValue" unknown)
    : cedar_tag_value)

let entity_cedar_tags_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson cedar_tag_value_of_yojson
    tree path

let entity_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key entity_cedar_tags_of_yojson "tags") _list path;
     parents = option_of_yojson (value_for_key parent_list_of_yojson "parents") _list path;
     attributes =
       option_of_yojson (value_for_key entity_attributes_of_yojson "attributes") _list path;
     identifier = value_for_key entity_identifier_of_yojson "identifier" _list path;
   }
    : entity_item)

let entity_list_of_yojson tree path = list_of_yojson entity_item_of_yojson tree path

let entities_definition_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "cedarJson" -> CedarJson (cedar_json_of_yojson value_ path)
   | "entityList" -> EntityList (entity_list_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "EntitiesDefinition" unknown)
    : entities_definition)

let is_authorized_with_token_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entities = option_of_yojson (value_for_key entities_definition_of_yojson "entities") _list path;
     context = option_of_yojson (value_for_key context_definition_of_yojson "context") _list path;
     resource = option_of_yojson (value_for_key entity_identifier_of_yojson "resource") _list path;
     action = option_of_yojson (value_for_key action_identifier_of_yojson "action") _list path;
     access_token = option_of_yojson (value_for_key token_of_yojson "accessToken") _list path;
     identity_token = option_of_yojson (value_for_key token_of_yojson "identityToken") _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : is_authorized_with_token_input)

let is_authorized_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors = value_for_key evaluation_error_list_of_yojson "errors" _list path;
     determining_policies =
       value_for_key determining_policy_list_of_yojson "determiningPolicies" _list path;
     decision = value_for_key decision_of_yojson "decision" _list path;
   }
    : is_authorized_output)

let is_authorized_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entities = option_of_yojson (value_for_key entities_definition_of_yojson "entities") _list path;
     context = option_of_yojson (value_for_key context_definition_of_yojson "context") _list path;
     resource = option_of_yojson (value_for_key entity_identifier_of_yojson "resource") _list path;
     action = option_of_yojson (value_for_key action_identifier_of_yojson "action") _list path;
     principal = option_of_yojson (value_for_key entity_identifier_of_yojson "principal") _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : is_authorized_input)

let invalid_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : invalid_state_exception)

let identity_source_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     open_id_issuer =
       option_of_yojson (value_for_key open_id_issuer_of_yojson "openIdIssuer") _list path;
     discovery_url =
       option_of_yojson (value_for_key discovery_url_of_yojson "discoveryUrl") _list path;
     user_pool_arn =
       option_of_yojson (value_for_key user_pool_arn_of_yojson "userPoolArn") _list path;
     client_ids = option_of_yojson (value_for_key client_ids_of_yojson "clientIds") _list path;
   }
    : identity_source_details)

let idempotency_token_of_yojson = string_of_yojson

let get_schema_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespaces = option_of_yojson (value_for_key namespace_list_of_yojson "namespaces") _list path;
     last_updated_date = value_for_key timestamp_format_of_yojson "lastUpdatedDate" _list path;
     created_date = value_for_key timestamp_format_of_yojson "createdDate" _list path;
     schema = value_for_key schema_json_of_yojson "schema" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : get_schema_output)

let get_schema_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path }
    : get_schema_input)

let get_policy_template_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key policy_template_name_of_yojson "name") _list path;
     last_updated_date = value_for_key timestamp_format_of_yojson "lastUpdatedDate" _list path;
     created_date = value_for_key timestamp_format_of_yojson "createdDate" _list path;
     statement = value_for_key policy_statement_of_yojson "statement" _list path;
     description =
       option_of_yojson
         (value_for_key policy_template_description_of_yojson "description")
         _list path;
     policy_template_id = value_for_key policy_template_id_of_yojson "policyTemplateId" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : get_policy_template_output)

let get_policy_template_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_template_id = value_for_key policy_template_id_of_yojson "policyTemplateId" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : get_policy_template_input)

let encryption_state_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "default" -> Default (Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson value_ path)
   | "kmsEncryptionState" -> KmsEncryptionState (kms_encryption_state_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "EncryptionState" unknown)
    : encryption_state)

let cedar_version_of_yojson (tree : t) path =
  ((match tree with
    | `String "CEDAR_4" -> CEDAR_4
    | `String "CEDAR_2" -> CEDAR_2
    | `String value -> raise (deserialize_unknown_enum_value_error path "CedarVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "CedarVersion")
     : cedar_version)
    : cedar_version)

let get_policy_store_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_map_of_yojson "tags") _list path;
     cedar_version =
       option_of_yojson (value_for_key cedar_version_of_yojson "cedarVersion") _list path;
     encryption_state =
       option_of_yojson (value_for_key encryption_state_of_yojson "encryptionState") _list path;
     deletion_protection =
       option_of_yojson
         (value_for_key deletion_protection_of_yojson "deletionProtection")
         _list path;
     description =
       option_of_yojson (value_for_key policy_store_description_of_yojson "description") _list path;
     last_updated_date = value_for_key timestamp_format_of_yojson "lastUpdatedDate" _list path;
     created_date = value_for_key timestamp_format_of_yojson "createdDate" _list path;
     validation_settings =
       value_for_key validation_settings_of_yojson "validationSettings" _list path;
     arn = value_for_key resource_arn_of_yojson "arn" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : get_policy_store_output)

let get_policy_store_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "tags")
         _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : get_policy_store_input)

let get_policy_store_alias_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = value_for_key alias_state_of_yojson "state" _list path;
     created_at = value_for_key timestamp_format_of_yojson "createdAt" _list path;
     alias_arn = value_for_key resource_arn_of_yojson "aliasArn" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
     alias_name = value_for_key alias_of_yojson "aliasName" _list path;
   }
    : get_policy_store_alias_output)

let get_policy_store_alias_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ alias_name = value_for_key alias_of_yojson "aliasName" _list path }
    : get_policy_store_alias_input)

let get_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key policy_name_of_yojson "name") _list path;
     effect_ = option_of_yojson (value_for_key policy_effect_of_yojson "effect") _list path;
     last_updated_date = value_for_key timestamp_format_of_yojson "lastUpdatedDate" _list path;
     created_date = value_for_key timestamp_format_of_yojson "createdDate" _list path;
     definition = value_for_key policy_definition_detail_of_yojson "definition" _list path;
     actions =
       option_of_yojson (value_for_key action_identifier_list_of_yojson "actions") _list path;
     resource = option_of_yojson (value_for_key entity_identifier_of_yojson "resource") _list path;
     principal = option_of_yojson (value_for_key entity_identifier_of_yojson "principal") _list path;
     policy_type = value_for_key policy_type_of_yojson "policyType" _list path;
     policy_id = value_for_key policy_id_of_yojson "policyId" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : get_policy_output)

let get_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_id = value_for_key policy_id_of_yojson "policyId" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : get_policy_input)

let cognito_group_configuration_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_entity_type =
       option_of_yojson (value_for_key group_entity_type_of_yojson "groupEntityType") _list path;
   }
    : cognito_group_configuration_detail)

let cognito_user_pool_configuration_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_configuration =
       option_of_yojson
         (value_for_key cognito_group_configuration_detail_of_yojson "groupConfiguration")
         _list path;
     issuer = value_for_key issuer_of_yojson "issuer" _list path;
     client_ids = value_for_key client_ids_of_yojson "clientIds" _list path;
     user_pool_arn = value_for_key user_pool_arn_of_yojson "userPoolArn" _list path;
   }
    : cognito_user_pool_configuration_detail)

let configuration_detail_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "openIdConnectConfiguration" ->
       OpenIdConnectConfiguration (open_id_connect_configuration_detail_of_yojson value_ path)
   | "cognitoUserPoolConfiguration" ->
       CognitoUserPoolConfiguration (cognito_user_pool_configuration_detail_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "ConfigurationDetail" unknown)
    : configuration_detail)

let get_identity_source_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson (value_for_key configuration_detail_of_yojson "configuration") _list path;
     principal_entity_type =
       value_for_key principal_entity_type_of_yojson "principalEntityType" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
     last_updated_date = value_for_key timestamp_format_of_yojson "lastUpdatedDate" _list path;
     identity_source_id = value_for_key identity_source_id_of_yojson "identitySourceId" _list path;
     details =
       option_of_yojson (value_for_key identity_source_details_of_yojson "details") _list path;
     created_date = value_for_key timestamp_format_of_yojson "createdDate" _list path;
   }
    : get_identity_source_output)

let get_identity_source_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_source_id = value_for_key identity_source_id_of_yojson "identitySourceId" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : get_identity_source_input)

let encryption_settings_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "default" -> Default (Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson value_ path)
   | "kmsEncryptionSettings" ->
       KmsEncryptionSettings (kms_encryption_settings_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "EncryptionSettings" unknown)
    : encryption_settings)

let deletion_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "HardDelete" -> HARD_DELETE
    | `String "SoftDelete" -> SOFT_DELETE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeletionMode" value)
    | _ -> raise (deserialize_wrong_type_error path "DeletionMode")
     : deletion_mode)
    : deletion_mode)

let delete_policy_template_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_policy_template_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_template_id = value_for_key policy_template_id_of_yojson "policyTemplateId" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : delete_policy_template_input)

let delete_policy_store_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_policy_store_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path }
    : delete_policy_store_input)

let delete_policy_store_alias_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_policy_store_alias_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deletion_mode =
       option_of_yojson (value_for_key deletion_mode_of_yojson "deletionMode") _list path;
     alias_name = value_for_key alias_of_yojson "aliasName" _list path;
   }
    : delete_policy_store_alias_input)

let delete_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_id = value_for_key policy_id_of_yojson "policyId" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : delete_policy_input)

let delete_identity_source_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_identity_source_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_source_id = value_for_key identity_source_id_of_yojson "identitySourceId" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : delete_identity_source_input)

let create_policy_template_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_date = value_for_key timestamp_format_of_yojson "lastUpdatedDate" _list path;
     created_date = value_for_key timestamp_format_of_yojson "createdDate" _list path;
     policy_template_id = value_for_key policy_template_id_of_yojson "policyTemplateId" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : create_policy_template_output)

let create_policy_template_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key policy_template_name_of_yojson "name") _list path;
     statement = value_for_key policy_statement_of_yojson "statement" _list path;
     description =
       option_of_yojson
         (value_for_key policy_template_description_of_yojson "description")
         _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
     client_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "clientToken") _list path;
   }
    : create_policy_template_input)

let create_policy_store_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_date = value_for_key timestamp_format_of_yojson "lastUpdatedDate" _list path;
     created_date = value_for_key timestamp_format_of_yojson "createdDate" _list path;
     arn = value_for_key resource_arn_of_yojson "arn" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : create_policy_store_output)

let create_policy_store_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_map_of_yojson "tags") _list path;
     encryption_settings =
       option_of_yojson
         (value_for_key encryption_settings_of_yojson "encryptionSettings")
         _list path;
     deletion_protection =
       option_of_yojson
         (value_for_key deletion_protection_of_yojson "deletionProtection")
         _list path;
     description =
       option_of_yojson (value_for_key policy_store_description_of_yojson "description") _list path;
     validation_settings =
       value_for_key validation_settings_of_yojson "validationSettings" _list path;
     client_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "clientToken") _list path;
   }
    : create_policy_store_input)

let create_policy_store_alias_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at = value_for_key timestamp_format_of_yojson "createdAt" _list path;
     alias_arn = value_for_key resource_arn_of_yojson "aliasArn" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
     alias_name = value_for_key alias_of_yojson "aliasName" _list path;
   }
    : create_policy_store_alias_output)

let create_policy_store_alias_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
     alias_name = value_for_key alias_of_yojson "aliasName" _list path;
   }
    : create_policy_store_alias_input)

let create_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     effect_ = option_of_yojson (value_for_key policy_effect_of_yojson "effect") _list path;
     last_updated_date = value_for_key timestamp_format_of_yojson "lastUpdatedDate" _list path;
     created_date = value_for_key timestamp_format_of_yojson "createdDate" _list path;
     actions =
       option_of_yojson (value_for_key action_identifier_list_of_yojson "actions") _list path;
     resource = option_of_yojson (value_for_key entity_identifier_of_yojson "resource") _list path;
     principal = option_of_yojson (value_for_key entity_identifier_of_yojson "principal") _list path;
     policy_type = value_for_key policy_type_of_yojson "policyType" _list path;
     policy_id = value_for_key policy_id_of_yojson "policyId" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : create_policy_output)

let create_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key policy_name_of_yojson "name") _list path;
     definition = value_for_key policy_definition_of_yojson "definition" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
     client_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "clientToken") _list path;
   }
    : create_policy_input)

let create_identity_source_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
     last_updated_date = value_for_key timestamp_format_of_yojson "lastUpdatedDate" _list path;
     identity_source_id = value_for_key identity_source_id_of_yojson "identitySourceId" _list path;
     created_date = value_for_key timestamp_format_of_yojson "createdDate" _list path;
   }
    : create_identity_source_output)

let cognito_group_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ group_entity_type = value_for_key group_entity_type_of_yojson "groupEntityType" _list path }
    : cognito_group_configuration)

let cognito_user_pool_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_configuration =
       option_of_yojson
         (value_for_key cognito_group_configuration_of_yojson "groupConfiguration")
         _list path;
     client_ids = option_of_yojson (value_for_key client_ids_of_yojson "clientIds") _list path;
     user_pool_arn = value_for_key user_pool_arn_of_yojson "userPoolArn" _list path;
   }
    : cognito_user_pool_configuration)

let configuration_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "openIdConnectConfiguration" ->
       OpenIdConnectConfiguration (open_id_connect_configuration_of_yojson value_ path)
   | "cognitoUserPoolConfiguration" ->
       CognitoUserPoolConfiguration (cognito_user_pool_configuration_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "Configuration" unknown)
    : configuration)

let create_identity_source_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_entity_type =
       option_of_yojson
         (value_for_key principal_entity_type_of_yojson "principalEntityType")
         _list path;
     configuration = value_for_key configuration_of_yojson "configuration" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
     client_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "clientToken") _list path;
   }
    : create_identity_source_input)

let batch_is_authorized_with_token_input_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     context = option_of_yojson (value_for_key context_definition_of_yojson "context") _list path;
     resource = option_of_yojson (value_for_key entity_identifier_of_yojson "resource") _list path;
     action = option_of_yojson (value_for_key action_identifier_of_yojson "action") _list path;
   }
    : batch_is_authorized_with_token_input_item)

let batch_is_authorized_with_token_output_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors = value_for_key evaluation_error_list_of_yojson "errors" _list path;
     determining_policies =
       value_for_key determining_policy_list_of_yojson "determiningPolicies" _list path;
     decision = value_for_key decision_of_yojson "decision" _list path;
     request =
       value_for_key batch_is_authorized_with_token_input_item_of_yojson "request" _list path;
   }
    : batch_is_authorized_with_token_output_item)

let batch_is_authorized_with_token_output_list_of_yojson tree path =
  list_of_yojson batch_is_authorized_with_token_output_item_of_yojson tree path

let batch_is_authorized_with_token_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     results =
       value_for_key batch_is_authorized_with_token_output_list_of_yojson "results" _list path;
     principal = option_of_yojson (value_for_key entity_identifier_of_yojson "principal") _list path;
   }
    : batch_is_authorized_with_token_output)

let batch_is_authorized_with_token_input_list_of_yojson tree path =
  list_of_yojson batch_is_authorized_with_token_input_item_of_yojson tree path

let batch_is_authorized_with_token_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     requests =
       value_for_key batch_is_authorized_with_token_input_list_of_yojson "requests" _list path;
     entities = option_of_yojson (value_for_key entities_definition_of_yojson "entities") _list path;
     access_token = option_of_yojson (value_for_key token_of_yojson "accessToken") _list path;
     identity_token = option_of_yojson (value_for_key token_of_yojson "identityToken") _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : batch_is_authorized_with_token_input)

let batch_is_authorized_input_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     context = option_of_yojson (value_for_key context_definition_of_yojson "context") _list path;
     resource = option_of_yojson (value_for_key entity_identifier_of_yojson "resource") _list path;
     action = option_of_yojson (value_for_key action_identifier_of_yojson "action") _list path;
     principal = option_of_yojson (value_for_key entity_identifier_of_yojson "principal") _list path;
   }
    : batch_is_authorized_input_item)

let batch_is_authorized_output_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors = value_for_key evaluation_error_list_of_yojson "errors" _list path;
     determining_policies =
       value_for_key determining_policy_list_of_yojson "determiningPolicies" _list path;
     decision = value_for_key decision_of_yojson "decision" _list path;
     request = value_for_key batch_is_authorized_input_item_of_yojson "request" _list path;
   }
    : batch_is_authorized_output_item)

let batch_is_authorized_output_list_of_yojson tree path =
  list_of_yojson batch_is_authorized_output_item_of_yojson tree path

let batch_is_authorized_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ results = value_for_key batch_is_authorized_output_list_of_yojson "results" _list path }
    : batch_is_authorized_output)

let batch_is_authorized_input_list_of_yojson tree path =
  list_of_yojson batch_is_authorized_input_item_of_yojson tree path

let batch_is_authorized_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     requests = value_for_key batch_is_authorized_input_list_of_yojson "requests" _list path;
     entities = option_of_yojson (value_for_key entities_definition_of_yojson "entities") _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : batch_is_authorized_input)

let batch_get_policy_output_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key policy_name_of_yojson "name") _list path;
     last_updated_date = value_for_key timestamp_format_of_yojson "lastUpdatedDate" _list path;
     created_date = value_for_key timestamp_format_of_yojson "createdDate" _list path;
     definition = value_for_key policy_definition_detail_of_yojson "definition" _list path;
     policy_type = value_for_key policy_type_of_yojson "policyType" _list path;
     policy_id = value_for_key policy_id_of_yojson "policyId" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : batch_get_policy_output_item)

let batch_get_policy_output_list_of_yojson tree path =
  list_of_yojson batch_get_policy_output_item_of_yojson tree path

let batch_get_policy_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "POLICY_STORE_ALIAS_NOT_FOUND" -> POLICY_STORE_ALIAS_NOT_FOUND
    | `String "POLICY_NOT_FOUND" -> POLICY_NOT_FOUND
    | `String "POLICY_STORE_NOT_FOUND" -> POLICY_STORE_NOT_FOUND
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BatchGetPolicyErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "BatchGetPolicyErrorCode")
     : batch_get_policy_error_code)
    : batch_get_policy_error_code)

let batch_get_policy_error_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     policy_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "policyId" _list path;
     policy_store_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "policyStoreId" _list
         path;
     code = value_for_key batch_get_policy_error_code_of_yojson "code" _list path;
   }
    : batch_get_policy_error_item)

let batch_get_policy_error_list_of_yojson tree path =
  list_of_yojson batch_get_policy_error_item_of_yojson tree path

let batch_get_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors = value_for_key batch_get_policy_error_list_of_yojson "errors" _list path;
     results = value_for_key batch_get_policy_output_list_of_yojson "results" _list path;
   }
    : batch_get_policy_output)

let batch_get_policy_input_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_id = value_for_key policy_id_of_yojson "policyId" _list path;
     policy_store_id = value_for_key policy_store_id_of_yojson "policyStoreId" _list path;
   }
    : batch_get_policy_input_item)

let batch_get_policy_input_list_of_yojson tree path =
  list_of_yojson batch_get_policy_input_item_of_yojson tree path

let batch_get_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ requests = value_for_key batch_get_policy_input_list_of_yojson "requests" _list path }
    : batch_get_policy_input)
