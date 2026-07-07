open Smaws_Lib.Json.SerializeHelpers
open Types

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ( "quotaCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code );
      ( "serviceCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code );
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let resource_type_to_yojson (x : resource_type) =
  match x with
  | POLICY_STORE_ALIAS -> `String "POLICY_STORE_ALIAS"
  | SCHEMA -> `String "SCHEMA"
  | POLICY_TEMPLATE -> `String "POLICY_TEMPLATE"
  | POLICY -> `String "POLICY"
  | POLICY_STORE -> `String "POLICY_STORE"
  | IDENTITY_SOURCE -> `String "IDENTITY_SOURCE"

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let untag_resource_output_to_yojson = unit_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_input_to_yojson (x : untag_resource_input) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson
    [
      ("resourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let tag_resource_output_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let tag_resource_input_to_yojson (x : tag_resource_input) =
  assoc_to_yojson
    [
      ("tags", Some (tag_map_to_yojson x.tags));
      ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
    ]

let list_tags_for_resource_output_to_yojson (x : list_tags_for_resource_output) =
  assoc_to_yojson [ ("tags", option_to_yojson tag_map_to_yojson x.tags) ]

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson [ ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn)) ]

let validation_mode_to_yojson (x : validation_mode) =
  match x with STRICT -> `String "STRICT" | OFF -> `String "OFF"

let validation_settings_to_yojson (x : validation_settings) =
  assoc_to_yojson [ ("mode", Some (validation_mode_to_yojson x.mode)) ]

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("path", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.path));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("fieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let user_pool_arn_to_yojson = string_to_yojson
let static_policy_description_to_yojson = string_to_yojson
let policy_statement_to_yojson = string_to_yojson

let update_static_policy_definition_to_yojson (x : update_static_policy_definition) =
  assoc_to_yojson
    [
      ("statement", Some (policy_statement_to_yojson x.statement));
      ("description", option_to_yojson static_policy_description_to_yojson x.description);
    ]

let policy_store_id_to_yojson = string_to_yojson
let policy_template_id_to_yojson = string_to_yojson
let timestamp_format_to_yojson = timestamp_iso_8601_to_yojson

let update_policy_template_output_to_yojson (x : update_policy_template_output) =
  assoc_to_yojson
    [
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let policy_template_description_to_yojson = string_to_yojson
let policy_template_name_to_yojson = string_to_yojson

let update_policy_template_input_to_yojson (x : update_policy_template_input) =
  assoc_to_yojson
    [
      ("name", option_to_yojson policy_template_name_to_yojson x.name);
      ("statement", Some (policy_statement_to_yojson x.statement));
      ("description", option_to_yojson policy_template_description_to_yojson x.description);
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let resource_conflict_to_yojson (x : resource_conflict) =
  assoc_to_yojson
    [
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
    ]

let resource_conflict_list_to_yojson tree = list_to_yojson resource_conflict_to_yojson tree

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("resources", Some (resource_conflict_list_to_yojson x.resources));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let resource_arn_to_yojson = string_to_yojson

let update_policy_store_output_to_yojson (x : update_policy_store_output) =
  assoc_to_yojson
    [
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("arn", Some (resource_arn_to_yojson x.arn));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let deletion_protection_to_yojson (x : deletion_protection) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let policy_store_description_to_yojson = string_to_yojson

let update_policy_store_input_to_yojson (x : update_policy_store_input) =
  assoc_to_yojson
    [
      ("description", option_to_yojson policy_store_description_to_yojson x.description);
      ("deletionProtection", option_to_yojson deletion_protection_to_yojson x.deletion_protection);
      ("validationSettings", Some (validation_settings_to_yojson x.validation_settings));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let policy_id_to_yojson = string_to_yojson

let policy_type_to_yojson (x : policy_type) =
  match x with TEMPLATE_LINKED -> `String "TEMPLATE_LINKED" | STATIC -> `String "STATIC"

let entity_type_to_yojson = string_to_yojson
let entity_id_to_yojson = string_to_yojson

let entity_identifier_to_yojson (x : entity_identifier) =
  assoc_to_yojson
    [
      ("entityId", Some (entity_id_to_yojson x.entity_id));
      ("entityType", Some (entity_type_to_yojson x.entity_type));
    ]

let action_type_to_yojson = string_to_yojson
let action_id_to_yojson = string_to_yojson

let action_identifier_to_yojson (x : action_identifier) =
  assoc_to_yojson
    [
      ("actionId", Some (action_id_to_yojson x.action_id));
      ("actionType", Some (action_type_to_yojson x.action_type));
    ]

let action_identifier_list_to_yojson tree = list_to_yojson action_identifier_to_yojson tree

let policy_effect_to_yojson (x : policy_effect) =
  match x with FORBID -> `String "Forbid" | PERMIT -> `String "Permit"

let update_policy_output_to_yojson (x : update_policy_output) =
  assoc_to_yojson
    [
      ("effect", option_to_yojson policy_effect_to_yojson x.effect_);
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("actions", option_to_yojson action_identifier_list_to_yojson x.actions);
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
      ("policyType", Some (policy_type_to_yojson x.policy_type));
      ("policyId", Some (policy_id_to_yojson x.policy_id));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let update_policy_definition_to_yojson (x : update_policy_definition) =
  match x with
  | Static arg ->
      assoc_to_yojson [ ("static", Some (update_static_policy_definition_to_yojson arg)) ]

let policy_name_to_yojson = string_to_yojson

let update_policy_input_to_yojson (x : update_policy_input) =
  assoc_to_yojson
    [
      ("name", option_to_yojson policy_name_to_yojson x.name);
      ("definition", option_to_yojson update_policy_definition_to_yojson x.definition);
      ("policyId", Some (policy_id_to_yojson x.policy_id));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ( "quotaCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code );
      ( "serviceCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code );
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
      ( "resourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id );
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let claim_to_yojson = string_to_yojson
let audience_to_yojson = string_to_yojson
let audiences_to_yojson tree = list_to_yojson audience_to_yojson tree

let update_open_id_connect_access_token_configuration_to_yojson
    (x : update_open_id_connect_access_token_configuration) =
  assoc_to_yojson
    [
      ("audiences", option_to_yojson audiences_to_yojson x.audiences);
      ("principalIdClaim", option_to_yojson claim_to_yojson x.principal_id_claim);
    ]

let client_id_to_yojson = string_to_yojson
let client_ids_to_yojson tree = list_to_yojson client_id_to_yojson tree

let update_open_id_connect_identity_token_configuration_to_yojson
    (x : update_open_id_connect_identity_token_configuration) =
  assoc_to_yojson
    [
      ("clientIds", option_to_yojson client_ids_to_yojson x.client_ids);
      ("principalIdClaim", option_to_yojson claim_to_yojson x.principal_id_claim);
    ]

let update_open_id_connect_token_selection_to_yojson (x : update_open_id_connect_token_selection) =
  match x with
  | IdentityTokenOnly arg ->
      assoc_to_yojson
        [
          ( "identityTokenOnly",
            Some (update_open_id_connect_identity_token_configuration_to_yojson arg) );
        ]
  | AccessTokenOnly arg ->
      assoc_to_yojson
        [
          ("accessTokenOnly", Some (update_open_id_connect_access_token_configuration_to_yojson arg));
        ]

let group_entity_type_to_yojson = string_to_yojson

let update_open_id_connect_group_configuration_to_yojson
    (x : update_open_id_connect_group_configuration) =
  assoc_to_yojson
    [
      ("groupEntityType", Some (group_entity_type_to_yojson x.group_entity_type));
      ("groupClaim", Some (claim_to_yojson x.group_claim));
    ]

let issuer_to_yojson = string_to_yojson
let entity_id_prefix_to_yojson = string_to_yojson

let update_open_id_connect_configuration_to_yojson (x : update_open_id_connect_configuration) =
  assoc_to_yojson
    [
      ("tokenSelection", Some (update_open_id_connect_token_selection_to_yojson x.token_selection));
      ( "groupConfiguration",
        option_to_yojson update_open_id_connect_group_configuration_to_yojson x.group_configuration
      );
      ("entityIdPrefix", option_to_yojson entity_id_prefix_to_yojson x.entity_id_prefix);
      ("issuer", Some (issuer_to_yojson x.issuer));
    ]

let identity_source_id_to_yojson = string_to_yojson

let update_identity_source_output_to_yojson (x : update_identity_source_output) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("identitySourceId", Some (identity_source_id_to_yojson x.identity_source_id));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
    ]

let update_cognito_group_configuration_to_yojson (x : update_cognito_group_configuration) =
  assoc_to_yojson [ ("groupEntityType", Some (group_entity_type_to_yojson x.group_entity_type)) ]

let update_cognito_user_pool_configuration_to_yojson (x : update_cognito_user_pool_configuration) =
  assoc_to_yojson
    [
      ( "groupConfiguration",
        option_to_yojson update_cognito_group_configuration_to_yojson x.group_configuration );
      ("clientIds", option_to_yojson client_ids_to_yojson x.client_ids);
      ("userPoolArn", Some (user_pool_arn_to_yojson x.user_pool_arn));
    ]

let update_configuration_to_yojson (x : update_configuration) =
  match x with
  | OpenIdConnectConfiguration arg ->
      assoc_to_yojson
        [
          ("openIdConnectConfiguration", Some (update_open_id_connect_configuration_to_yojson arg));
        ]
  | CognitoUserPoolConfiguration arg ->
      assoc_to_yojson
        [
          ( "cognitoUserPoolConfiguration",
            Some (update_cognito_user_pool_configuration_to_yojson arg) );
        ]

let principal_entity_type_to_yojson = string_to_yojson

let update_identity_source_input_to_yojson (x : update_identity_source_input) =
  assoc_to_yojson
    [
      ( "principalEntityType",
        option_to_yojson principal_entity_type_to_yojson x.principal_entity_type );
      ("updateConfiguration", Some (update_configuration_to_yojson x.update_configuration));
      ("identitySourceId", Some (identity_source_id_to_yojson x.identity_source_id));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let token_to_yojson = string_to_yojson

let template_linked_policy_definition_item_to_yojson (x : template_linked_policy_definition_item) =
  assoc_to_yojson
    [
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
    ]

let template_linked_policy_definition_detail_to_yojson
    (x : template_linked_policy_definition_detail) =
  assoc_to_yojson
    [
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
    ]

let template_linked_policy_definition_to_yojson (x : template_linked_policy_definition) =
  assoc_to_yojson
    [
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
    ]

let string_attribute_to_yojson = string_to_yojson

let static_policy_definition_item_to_yojson (x : static_policy_definition_item) =
  assoc_to_yojson
    [ ("description", option_to_yojson static_policy_description_to_yojson x.description) ]

let static_policy_definition_detail_to_yojson (x : static_policy_definition_detail) =
  assoc_to_yojson
    [
      ("statement", Some (policy_statement_to_yojson x.statement));
      ("description", option_to_yojson static_policy_description_to_yojson x.description);
    ]

let static_policy_definition_to_yojson (x : static_policy_definition) =
  assoc_to_yojson
    [
      ("statement", Some (policy_statement_to_yojson x.statement));
      ("description", option_to_yojson static_policy_description_to_yojson x.description);
    ]

let boolean_attribute_to_yojson = bool_to_yojson
let long_attribute_to_yojson = long_to_yojson
let ip_addr_to_yojson = string_to_yojson
let decimal_to_yojson = string_to_yojson
let datetime_attribute_to_yojson = string_to_yojson
let duration_to_yojson = string_to_yojson

let rec attribute_value_to_yojson (x : attribute_value) =
  match x with
  | Duration arg -> assoc_to_yojson [ ("duration", Some (duration_to_yojson arg)) ]
  | Datetime arg -> assoc_to_yojson [ ("datetime", Some (datetime_attribute_to_yojson arg)) ]
  | Decimal arg -> assoc_to_yojson [ ("decimal", Some (decimal_to_yojson arg)) ]
  | Ipaddr arg -> assoc_to_yojson [ ("ipaddr", Some (ip_addr_to_yojson arg)) ]
  | Record arg -> assoc_to_yojson [ ("record", Some (record_attribute_to_yojson arg)) ]
  | Set arg -> assoc_to_yojson [ ("set", Some (set_attribute_to_yojson arg)) ]
  | String arg -> assoc_to_yojson [ ("string", Some (string_attribute_to_yojson arg)) ]
  | Long arg -> assoc_to_yojson [ ("long", Some (long_attribute_to_yojson arg)) ]
  | EntityIdentifier arg ->
      assoc_to_yojson [ ("entityIdentifier", Some (entity_identifier_to_yojson arg)) ]
  | Boolean arg -> assoc_to_yojson [ ("boolean", Some (boolean_attribute_to_yojson arg)) ]

and record_attribute_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson attribute_value_to_yojson
    tree

and set_attribute_to_yojson tree = list_to_yojson attribute_value_to_yojson tree

let schema_json_to_yojson = string_to_yojson

let schema_definition_to_yojson (x : schema_definition) =
  match x with
  | CedarJson arg -> assoc_to_yojson [ ("cedarJson", Some (schema_json_to_yojson arg)) ]

let namespace_to_yojson = string_to_yojson
let namespace_list_to_yojson tree = list_to_yojson namespace_to_yojson tree

let put_schema_output_to_yojson (x : put_schema_output) =
  assoc_to_yojson
    [
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("namespaces", Some (namespace_list_to_yojson x.namespaces));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let put_schema_input_to_yojson (x : put_schema_input) =
  assoc_to_yojson
    [
      ("definition", Some (schema_definition_to_yojson x.definition));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let policy_template_item_to_yojson (x : policy_template_item) =
  assoc_to_yojson
    [
      ("name", option_to_yojson policy_template_name_to_yojson x.name);
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("description", option_to_yojson policy_template_description_to_yojson x.description);
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let policy_templates_list_to_yojson tree = list_to_yojson policy_template_item_to_yojson tree

let policy_store_item_to_yojson (x : policy_store_item) =
  assoc_to_yojson
    [
      ("description", option_to_yojson policy_store_description_to_yojson x.description);
      ("lastUpdatedDate", option_to_yojson timestamp_format_to_yojson x.last_updated_date);
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("arn", Some (resource_arn_to_yojson x.arn));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let policy_store_list_to_yojson tree = list_to_yojson policy_store_item_to_yojson tree
let alias_to_yojson = string_to_yojson

let alias_state_to_yojson (x : alias_state) =
  match x with PENDING_DELETION -> `String "PendingDeletion" | ACTIVE -> `String "Active"

let policy_store_alias_item_to_yojson (x : policy_store_alias_item) =
  assoc_to_yojson
    [
      ("state", Some (alias_state_to_yojson x.state));
      ("createdAt", Some (timestamp_format_to_yojson x.created_at));
      ("aliasArn", Some (resource_arn_to_yojson x.alias_arn));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("aliasName", Some (alias_to_yojson x.alias_name));
    ]

let policy_store_alias_list_to_yojson tree = list_to_yojson policy_store_alias_item_to_yojson tree

let policy_store_alias_filter_to_yojson (x : policy_store_alias_filter) =
  assoc_to_yojson
    [ ("policyStoreId", option_to_yojson policy_store_id_to_yojson x.policy_store_id) ]

let policy_definition_item_to_yojson (x : policy_definition_item) =
  match x with
  | TemplateLinked arg ->
      assoc_to_yojson
        [ ("templateLinked", Some (template_linked_policy_definition_item_to_yojson arg)) ]
  | Static arg -> assoc_to_yojson [ ("static", Some (static_policy_definition_item_to_yojson arg)) ]

let policy_item_to_yojson (x : policy_item) =
  assoc_to_yojson
    [
      ("name", option_to_yojson policy_name_to_yojson x.name);
      ("effect", option_to_yojson policy_effect_to_yojson x.effect_);
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("definition", Some (policy_definition_item_to_yojson x.definition));
      ("actions", option_to_yojson action_identifier_list_to_yojson x.actions);
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
      ("policyType", Some (policy_type_to_yojson x.policy_type));
      ("policyId", Some (policy_id_to_yojson x.policy_id));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let policy_list_to_yojson tree = list_to_yojson policy_item_to_yojson tree

let entity_reference_to_yojson (x : entity_reference) =
  match x with
  | Identifier arg -> assoc_to_yojson [ ("identifier", Some (entity_identifier_to_yojson arg)) ]
  | Unspecified arg ->
      assoc_to_yojson
        [ ("unspecified", Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson arg)) ]

let policy_filter_to_yojson (x : policy_filter) =
  assoc_to_yojson
    [
      ("policyTemplateId", option_to_yojson policy_template_id_to_yojson x.policy_template_id);
      ("policyType", option_to_yojson policy_type_to_yojson x.policy_type);
      ("resource", option_to_yojson entity_reference_to_yojson x.resource);
      ("principal", option_to_yojson entity_reference_to_yojson x.principal);
    ]

let policy_definition_detail_to_yojson (x : policy_definition_detail) =
  match x with
  | TemplateLinked arg ->
      assoc_to_yojson
        [ ("templateLinked", Some (template_linked_policy_definition_detail_to_yojson arg)) ]
  | Static arg ->
      assoc_to_yojson [ ("static", Some (static_policy_definition_detail_to_yojson arg)) ]

let policy_definition_to_yojson (x : policy_definition) =
  match x with
  | TemplateLinked arg ->
      assoc_to_yojson [ ("templateLinked", Some (template_linked_policy_definition_to_yojson arg)) ]
  | Static arg -> assoc_to_yojson [ ("static", Some (static_policy_definition_to_yojson arg)) ]

let parent_list_to_yojson tree = list_to_yojson entity_identifier_to_yojson tree
let open_id_issuer_to_yojson (x : open_id_issuer) = match x with COGNITO -> `String "COGNITO"

let open_id_connect_access_token_configuration_item_to_yojson
    (x : open_id_connect_access_token_configuration_item) =
  assoc_to_yojson
    [
      ("audiences", option_to_yojson audiences_to_yojson x.audiences);
      ("principalIdClaim", option_to_yojson claim_to_yojson x.principal_id_claim);
    ]

let open_id_connect_identity_token_configuration_item_to_yojson
    (x : open_id_connect_identity_token_configuration_item) =
  assoc_to_yojson
    [
      ("clientIds", option_to_yojson client_ids_to_yojson x.client_ids);
      ("principalIdClaim", option_to_yojson claim_to_yojson x.principal_id_claim);
    ]

let open_id_connect_token_selection_item_to_yojson (x : open_id_connect_token_selection_item) =
  match x with
  | IdentityTokenOnly arg ->
      assoc_to_yojson
        [
          ( "identityTokenOnly",
            Some (open_id_connect_identity_token_configuration_item_to_yojson arg) );
        ]
  | AccessTokenOnly arg ->
      assoc_to_yojson
        [
          ("accessTokenOnly", Some (open_id_connect_access_token_configuration_item_to_yojson arg));
        ]

let open_id_connect_access_token_configuration_detail_to_yojson
    (x : open_id_connect_access_token_configuration_detail) =
  assoc_to_yojson
    [
      ("audiences", option_to_yojson audiences_to_yojson x.audiences);
      ("principalIdClaim", option_to_yojson claim_to_yojson x.principal_id_claim);
    ]

let open_id_connect_identity_token_configuration_detail_to_yojson
    (x : open_id_connect_identity_token_configuration_detail) =
  assoc_to_yojson
    [
      ("clientIds", option_to_yojson client_ids_to_yojson x.client_ids);
      ("principalIdClaim", option_to_yojson claim_to_yojson x.principal_id_claim);
    ]

let open_id_connect_token_selection_detail_to_yojson (x : open_id_connect_token_selection_detail) =
  match x with
  | IdentityTokenOnly arg ->
      assoc_to_yojson
        [
          ( "identityTokenOnly",
            Some (open_id_connect_identity_token_configuration_detail_to_yojson arg) );
        ]
  | AccessTokenOnly arg ->
      assoc_to_yojson
        [
          ("accessTokenOnly", Some (open_id_connect_access_token_configuration_detail_to_yojson arg));
        ]

let open_id_connect_access_token_configuration_to_yojson
    (x : open_id_connect_access_token_configuration) =
  assoc_to_yojson
    [
      ("audiences", option_to_yojson audiences_to_yojson x.audiences);
      ("principalIdClaim", option_to_yojson claim_to_yojson x.principal_id_claim);
    ]

let open_id_connect_identity_token_configuration_to_yojson
    (x : open_id_connect_identity_token_configuration) =
  assoc_to_yojson
    [
      ("clientIds", option_to_yojson client_ids_to_yojson x.client_ids);
      ("principalIdClaim", option_to_yojson claim_to_yojson x.principal_id_claim);
    ]

let open_id_connect_token_selection_to_yojson (x : open_id_connect_token_selection) =
  match x with
  | IdentityTokenOnly arg ->
      assoc_to_yojson
        [ ("identityTokenOnly", Some (open_id_connect_identity_token_configuration_to_yojson arg)) ]
  | AccessTokenOnly arg ->
      assoc_to_yojson
        [ ("accessTokenOnly", Some (open_id_connect_access_token_configuration_to_yojson arg)) ]

let open_id_connect_group_configuration_item_to_yojson
    (x : open_id_connect_group_configuration_item) =
  assoc_to_yojson
    [
      ("groupEntityType", Some (group_entity_type_to_yojson x.group_entity_type));
      ("groupClaim", Some (claim_to_yojson x.group_claim));
    ]

let open_id_connect_group_configuration_detail_to_yojson
    (x : open_id_connect_group_configuration_detail) =
  assoc_to_yojson
    [
      ("groupEntityType", Some (group_entity_type_to_yojson x.group_entity_type));
      ("groupClaim", Some (claim_to_yojson x.group_claim));
    ]

let open_id_connect_group_configuration_to_yojson (x : open_id_connect_group_configuration) =
  assoc_to_yojson
    [
      ("groupEntityType", Some (group_entity_type_to_yojson x.group_entity_type));
      ("groupClaim", Some (claim_to_yojson x.group_claim));
    ]

let open_id_connect_configuration_item_to_yojson (x : open_id_connect_configuration_item) =
  assoc_to_yojson
    [
      ("tokenSelection", Some (open_id_connect_token_selection_item_to_yojson x.token_selection));
      ( "groupConfiguration",
        option_to_yojson open_id_connect_group_configuration_item_to_yojson x.group_configuration );
      ("entityIdPrefix", option_to_yojson entity_id_prefix_to_yojson x.entity_id_prefix);
      ("issuer", Some (issuer_to_yojson x.issuer));
    ]

let open_id_connect_configuration_detail_to_yojson (x : open_id_connect_configuration_detail) =
  assoc_to_yojson
    [
      ("tokenSelection", Some (open_id_connect_token_selection_detail_to_yojson x.token_selection));
      ( "groupConfiguration",
        option_to_yojson open_id_connect_group_configuration_detail_to_yojson x.group_configuration
      );
      ("entityIdPrefix", option_to_yojson entity_id_prefix_to_yojson x.entity_id_prefix);
      ("issuer", Some (issuer_to_yojson x.issuer));
    ]

let open_id_connect_configuration_to_yojson (x : open_id_connect_configuration) =
  assoc_to_yojson
    [
      ("tokenSelection", Some (open_id_connect_token_selection_to_yojson x.token_selection));
      ( "groupConfiguration",
        option_to_yojson open_id_connect_group_configuration_to_yojson x.group_configuration );
      ("entityIdPrefix", option_to_yojson entity_id_prefix_to_yojson x.entity_id_prefix);
      ("issuer", Some (issuer_to_yojson x.issuer));
    ]

let next_token_to_yojson = string_to_yojson
let max_results_to_yojson = int_to_yojson

let list_policy_templates_output_to_yojson (x : list_policy_templates_output) =
  assoc_to_yojson
    [
      ("policyTemplates", Some (policy_templates_list_to_yojson x.policy_templates));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_policy_templates_input_to_yojson (x : list_policy_templates_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let list_policy_stores_output_to_yojson (x : list_policy_stores_output) =
  assoc_to_yojson
    [
      ("policyStores", Some (policy_store_list_to_yojson x.policy_stores));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_policy_stores_input_to_yojson (x : list_policy_stores_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_policy_store_aliases_output_to_yojson (x : list_policy_store_aliases_output) =
  assoc_to_yojson
    [
      ("policyStoreAliases", Some (policy_store_alias_list_to_yojson x.policy_store_aliases));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_policy_store_aliases_input_to_yojson (x : list_policy_store_aliases_input) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson policy_store_alias_filter_to_yojson x.filter);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_policies_output_to_yojson (x : list_policies_output) =
  assoc_to_yojson
    [
      ("policies", Some (policy_list_to_yojson x.policies));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_policies_input_to_yojson (x : list_policies_input) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson policy_filter_to_yojson x.filter);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let discovery_url_to_yojson = string_to_yojson

let identity_source_item_details_to_yojson (x : identity_source_item_details) =
  assoc_to_yojson
    [
      ("openIdIssuer", option_to_yojson open_id_issuer_to_yojson x.open_id_issuer);
      ("discoveryUrl", option_to_yojson discovery_url_to_yojson x.discovery_url);
      ("userPoolArn", option_to_yojson user_pool_arn_to_yojson x.user_pool_arn);
      ("clientIds", option_to_yojson client_ids_to_yojson x.client_ids);
    ]

let cognito_group_configuration_item_to_yojson (x : cognito_group_configuration_item) =
  assoc_to_yojson
    [ ("groupEntityType", option_to_yojson group_entity_type_to_yojson x.group_entity_type) ]

let cognito_user_pool_configuration_item_to_yojson (x : cognito_user_pool_configuration_item) =
  assoc_to_yojson
    [
      ( "groupConfiguration",
        option_to_yojson cognito_group_configuration_item_to_yojson x.group_configuration );
      ("issuer", Some (issuer_to_yojson x.issuer));
      ("clientIds", Some (client_ids_to_yojson x.client_ids));
      ("userPoolArn", Some (user_pool_arn_to_yojson x.user_pool_arn));
    ]

let configuration_item_to_yojson (x : configuration_item) =
  match x with
  | OpenIdConnectConfiguration arg ->
      assoc_to_yojson
        [ ("openIdConnectConfiguration", Some (open_id_connect_configuration_item_to_yojson arg)) ]
  | CognitoUserPoolConfiguration arg ->
      assoc_to_yojson
        [
          ("cognitoUserPoolConfiguration", Some (cognito_user_pool_configuration_item_to_yojson arg));
        ]

let identity_source_item_to_yojson (x : identity_source_item) =
  assoc_to_yojson
    [
      ("configuration", option_to_yojson configuration_item_to_yojson x.configuration);
      ("principalEntityType", Some (principal_entity_type_to_yojson x.principal_entity_type));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("identitySourceId", Some (identity_source_id_to_yojson x.identity_source_id));
      ("details", option_to_yojson identity_source_item_details_to_yojson x.details);
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
    ]

let identity_sources_to_yojson tree = list_to_yojson identity_source_item_to_yojson tree

let list_identity_sources_output_to_yojson (x : list_identity_sources_output) =
  assoc_to_yojson
    [
      ("identitySources", Some (identity_sources_to_yojson x.identity_sources));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_identity_sources_max_results_to_yojson = int_to_yojson

let identity_source_filter_to_yojson (x : identity_source_filter) =
  assoc_to_yojson
    [
      ( "principalEntityType",
        option_to_yojson principal_entity_type_to_yojson x.principal_entity_type );
    ]

let identity_source_filters_to_yojson tree = list_to_yojson identity_source_filter_to_yojson tree

let list_identity_sources_input_to_yojson (x : list_identity_sources_input) =
  assoc_to_yojson
    [
      ("filters", option_to_yojson identity_source_filters_to_yojson x.filters);
      ("maxResults", option_to_yojson list_identity_sources_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let kms_key_to_yojson = string_to_yojson
let encryption_context_value_to_yojson = string_to_yojson
let encryption_context_key_to_yojson = string_to_yojson

let encryption_context_to_yojson tree =
  map_to_yojson encryption_context_key_to_yojson encryption_context_value_to_yojson tree

let kms_encryption_state_to_yojson (x : kms_encryption_state) =
  assoc_to_yojson
    [
      ("encryptionContext", Some (encryption_context_to_yojson x.encryption_context));
      ("key", Some (kms_key_to_yojson x.key));
    ]

let kms_encryption_settings_to_yojson (x : kms_encryption_settings) =
  assoc_to_yojson
    [
      ("encryptionContext", option_to_yojson encryption_context_to_yojson x.encryption_context);
      ("key", Some (kms_key_to_yojson x.key));
    ]

let decision_to_yojson (x : decision) =
  match x with DENY -> `String "DENY" | ALLOW -> `String "ALLOW"

let determining_policy_item_to_yojson (x : determining_policy_item) =
  assoc_to_yojson [ ("policyId", Some (policy_id_to_yojson x.policy_id)) ]

let determining_policy_list_to_yojson tree = list_to_yojson determining_policy_item_to_yojson tree

let evaluation_error_item_to_yojson (x : evaluation_error_item) =
  assoc_to_yojson
    [
      ( "errorDescription",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_description) );
    ]

let evaluation_error_list_to_yojson tree = list_to_yojson evaluation_error_item_to_yojson tree

let is_authorized_with_token_output_to_yojson (x : is_authorized_with_token_output) =
  assoc_to_yojson
    [
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
      ("errors", Some (evaluation_error_list_to_yojson x.errors));
      ("determiningPolicies", Some (determining_policy_list_to_yojson x.determining_policies));
      ("decision", Some (decision_to_yojson x.decision));
    ]

let context_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson attribute_value_to_yojson
    tree

let cedar_json_to_yojson = string_to_yojson

let context_definition_to_yojson (x : context_definition) =
  match x with
  | CedarJson arg -> assoc_to_yojson [ ("cedarJson", Some (cedar_json_to_yojson arg)) ]
  | ContextMap arg -> assoc_to_yojson [ ("contextMap", Some (context_map_to_yojson arg)) ]

let entity_attributes_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson attribute_value_to_yojson
    tree

let rec cedar_tag_record_attribute_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson cedar_tag_value_to_yojson
    tree

and cedar_tag_set_attribute_to_yojson tree = list_to_yojson cedar_tag_value_to_yojson tree

and cedar_tag_value_to_yojson (x : cedar_tag_value) =
  match x with
  | Duration arg -> assoc_to_yojson [ ("duration", Some (duration_to_yojson arg)) ]
  | Datetime arg -> assoc_to_yojson [ ("datetime", Some (datetime_attribute_to_yojson arg)) ]
  | Decimal arg -> assoc_to_yojson [ ("decimal", Some (decimal_to_yojson arg)) ]
  | Ipaddr arg -> assoc_to_yojson [ ("ipaddr", Some (ip_addr_to_yojson arg)) ]
  | Record arg -> assoc_to_yojson [ ("record", Some (cedar_tag_record_attribute_to_yojson arg)) ]
  | Set arg -> assoc_to_yojson [ ("set", Some (cedar_tag_set_attribute_to_yojson arg)) ]
  | String arg -> assoc_to_yojson [ ("string", Some (string_attribute_to_yojson arg)) ]
  | Long arg -> assoc_to_yojson [ ("long", Some (long_attribute_to_yojson arg)) ]
  | EntityIdentifier arg ->
      assoc_to_yojson [ ("entityIdentifier", Some (entity_identifier_to_yojson arg)) ]
  | Boolean arg -> assoc_to_yojson [ ("boolean", Some (boolean_attribute_to_yojson arg)) ]

let entity_cedar_tags_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson cedar_tag_value_to_yojson
    tree

let entity_item_to_yojson (x : entity_item) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson entity_cedar_tags_to_yojson x.tags);
      ("parents", option_to_yojson parent_list_to_yojson x.parents);
      ("attributes", option_to_yojson entity_attributes_to_yojson x.attributes);
      ("identifier", Some (entity_identifier_to_yojson x.identifier));
    ]

let entity_list_to_yojson tree = list_to_yojson entity_item_to_yojson tree

let entities_definition_to_yojson (x : entities_definition) =
  match x with
  | CedarJson arg -> assoc_to_yojson [ ("cedarJson", Some (cedar_json_to_yojson arg)) ]
  | EntityList arg -> assoc_to_yojson [ ("entityList", Some (entity_list_to_yojson arg)) ]

let is_authorized_with_token_input_to_yojson (x : is_authorized_with_token_input) =
  assoc_to_yojson
    [
      ("entities", option_to_yojson entities_definition_to_yojson x.entities);
      ("context", option_to_yojson context_definition_to_yojson x.context);
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
      ("action", option_to_yojson action_identifier_to_yojson x.action);
      ("accessToken", option_to_yojson token_to_yojson x.access_token);
      ("identityToken", option_to_yojson token_to_yojson x.identity_token);
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let is_authorized_output_to_yojson (x : is_authorized_output) =
  assoc_to_yojson
    [
      ("errors", Some (evaluation_error_list_to_yojson x.errors));
      ("determiningPolicies", Some (determining_policy_list_to_yojson x.determining_policies));
      ("decision", Some (decision_to_yojson x.decision));
    ]

let is_authorized_input_to_yojson (x : is_authorized_input) =
  assoc_to_yojson
    [
      ("entities", option_to_yojson entities_definition_to_yojson x.entities);
      ("context", option_to_yojson context_definition_to_yojson x.context);
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
      ("action", option_to_yojson action_identifier_to_yojson x.action);
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let invalid_state_exception_to_yojson (x : invalid_state_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let identity_source_details_to_yojson (x : identity_source_details) =
  assoc_to_yojson
    [
      ("openIdIssuer", option_to_yojson open_id_issuer_to_yojson x.open_id_issuer);
      ("discoveryUrl", option_to_yojson discovery_url_to_yojson x.discovery_url);
      ("userPoolArn", option_to_yojson user_pool_arn_to_yojson x.user_pool_arn);
      ("clientIds", option_to_yojson client_ids_to_yojson x.client_ids);
    ]

let idempotency_token_to_yojson = string_to_yojson

let get_schema_output_to_yojson (x : get_schema_output) =
  assoc_to_yojson
    [
      ("namespaces", option_to_yojson namespace_list_to_yojson x.namespaces);
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("schema", Some (schema_json_to_yojson x.schema));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let get_schema_input_to_yojson (x : get_schema_input) =
  assoc_to_yojson [ ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id)) ]

let get_policy_template_output_to_yojson (x : get_policy_template_output) =
  assoc_to_yojson
    [
      ("name", option_to_yojson policy_template_name_to_yojson x.name);
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("statement", Some (policy_statement_to_yojson x.statement));
      ("description", option_to_yojson policy_template_description_to_yojson x.description);
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let get_policy_template_input_to_yojson (x : get_policy_template_input) =
  assoc_to_yojson
    [
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let encryption_state_to_yojson (x : encryption_state) =
  match x with
  | Default arg ->
      assoc_to_yojson
        [ ("default", Some (Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson arg)) ]
  | KmsEncryptionState arg ->
      assoc_to_yojson [ ("kmsEncryptionState", Some (kms_encryption_state_to_yojson arg)) ]

let cedar_version_to_yojson (x : cedar_version) =
  match x with CEDAR_4 -> `String "CEDAR_4" | CEDAR_2 -> `String "CEDAR_2"

let get_policy_store_output_to_yojson (x : get_policy_store_output) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_map_to_yojson x.tags);
      ("cedarVersion", option_to_yojson cedar_version_to_yojson x.cedar_version);
      ("encryptionState", option_to_yojson encryption_state_to_yojson x.encryption_state);
      ("deletionProtection", option_to_yojson deletion_protection_to_yojson x.deletion_protection);
      ("description", option_to_yojson policy_store_description_to_yojson x.description);
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("validationSettings", Some (validation_settings_to_yojson x.validation_settings));
      ("arn", Some (resource_arn_to_yojson x.arn));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let get_policy_store_input_to_yojson (x : get_policy_store_input) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.tags);
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let get_policy_store_alias_output_to_yojson (x : get_policy_store_alias_output) =
  assoc_to_yojson
    [
      ("state", Some (alias_state_to_yojson x.state));
      ("createdAt", Some (timestamp_format_to_yojson x.created_at));
      ("aliasArn", Some (resource_arn_to_yojson x.alias_arn));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("aliasName", Some (alias_to_yojson x.alias_name));
    ]

let get_policy_store_alias_input_to_yojson (x : get_policy_store_alias_input) =
  assoc_to_yojson [ ("aliasName", Some (alias_to_yojson x.alias_name)) ]

let get_policy_output_to_yojson (x : get_policy_output) =
  assoc_to_yojson
    [
      ("name", option_to_yojson policy_name_to_yojson x.name);
      ("effect", option_to_yojson policy_effect_to_yojson x.effect_);
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("definition", Some (policy_definition_detail_to_yojson x.definition));
      ("actions", option_to_yojson action_identifier_list_to_yojson x.actions);
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
      ("policyType", Some (policy_type_to_yojson x.policy_type));
      ("policyId", Some (policy_id_to_yojson x.policy_id));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let get_policy_input_to_yojson (x : get_policy_input) =
  assoc_to_yojson
    [
      ("policyId", Some (policy_id_to_yojson x.policy_id));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let cognito_group_configuration_detail_to_yojson (x : cognito_group_configuration_detail) =
  assoc_to_yojson
    [ ("groupEntityType", option_to_yojson group_entity_type_to_yojson x.group_entity_type) ]

let cognito_user_pool_configuration_detail_to_yojson (x : cognito_user_pool_configuration_detail) =
  assoc_to_yojson
    [
      ( "groupConfiguration",
        option_to_yojson cognito_group_configuration_detail_to_yojson x.group_configuration );
      ("issuer", Some (issuer_to_yojson x.issuer));
      ("clientIds", Some (client_ids_to_yojson x.client_ids));
      ("userPoolArn", Some (user_pool_arn_to_yojson x.user_pool_arn));
    ]

let configuration_detail_to_yojson (x : configuration_detail) =
  match x with
  | OpenIdConnectConfiguration arg ->
      assoc_to_yojson
        [
          ("openIdConnectConfiguration", Some (open_id_connect_configuration_detail_to_yojson arg));
        ]
  | CognitoUserPoolConfiguration arg ->
      assoc_to_yojson
        [
          ( "cognitoUserPoolConfiguration",
            Some (cognito_user_pool_configuration_detail_to_yojson arg) );
        ]

let get_identity_source_output_to_yojson (x : get_identity_source_output) =
  assoc_to_yojson
    [
      ("configuration", option_to_yojson configuration_detail_to_yojson x.configuration);
      ("principalEntityType", Some (principal_entity_type_to_yojson x.principal_entity_type));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("identitySourceId", Some (identity_source_id_to_yojson x.identity_source_id));
      ("details", option_to_yojson identity_source_details_to_yojson x.details);
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
    ]

let get_identity_source_input_to_yojson (x : get_identity_source_input) =
  assoc_to_yojson
    [
      ("identitySourceId", Some (identity_source_id_to_yojson x.identity_source_id));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let encryption_settings_to_yojson (x : encryption_settings) =
  match x with
  | Default arg ->
      assoc_to_yojson
        [ ("default", Some (Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson arg)) ]
  | KmsEncryptionSettings arg ->
      assoc_to_yojson [ ("kmsEncryptionSettings", Some (kms_encryption_settings_to_yojson arg)) ]

let deletion_mode_to_yojson (x : deletion_mode) =
  match x with HARD_DELETE -> `String "HardDelete" | SOFT_DELETE -> `String "SoftDelete"

let delete_policy_template_output_to_yojson = unit_to_yojson

let delete_policy_template_input_to_yojson (x : delete_policy_template_input) =
  assoc_to_yojson
    [
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let delete_policy_store_output_to_yojson = unit_to_yojson

let delete_policy_store_input_to_yojson (x : delete_policy_store_input) =
  assoc_to_yojson [ ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id)) ]

let delete_policy_store_alias_output_to_yojson = unit_to_yojson

let delete_policy_store_alias_input_to_yojson (x : delete_policy_store_alias_input) =
  assoc_to_yojson
    [
      ("deletionMode", option_to_yojson deletion_mode_to_yojson x.deletion_mode);
      ("aliasName", Some (alias_to_yojson x.alias_name));
    ]

let delete_policy_output_to_yojson = unit_to_yojson

let delete_policy_input_to_yojson (x : delete_policy_input) =
  assoc_to_yojson
    [
      ("policyId", Some (policy_id_to_yojson x.policy_id));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let delete_identity_source_output_to_yojson = unit_to_yojson

let delete_identity_source_input_to_yojson (x : delete_identity_source_input) =
  assoc_to_yojson
    [
      ("identitySourceId", Some (identity_source_id_to_yojson x.identity_source_id));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let create_policy_template_output_to_yojson (x : create_policy_template_output) =
  assoc_to_yojson
    [
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let create_policy_template_input_to_yojson (x : create_policy_template_input) =
  assoc_to_yojson
    [
      ("name", option_to_yojson policy_template_name_to_yojson x.name);
      ("statement", Some (policy_statement_to_yojson x.statement));
      ("description", option_to_yojson policy_template_description_to_yojson x.description);
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ( "clientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_policy_store_output_to_yojson (x : create_policy_store_output) =
  assoc_to_yojson
    [
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("arn", Some (resource_arn_to_yojson x.arn));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let create_policy_store_input_to_yojson (x : create_policy_store_input) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_map_to_yojson x.tags);
      ("encryptionSettings", option_to_yojson encryption_settings_to_yojson x.encryption_settings);
      ("deletionProtection", option_to_yojson deletion_protection_to_yojson x.deletion_protection);
      ("description", option_to_yojson policy_store_description_to_yojson x.description);
      ("validationSettings", Some (validation_settings_to_yojson x.validation_settings));
      ( "clientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_policy_store_alias_output_to_yojson (x : create_policy_store_alias_output) =
  assoc_to_yojson
    [
      ("createdAt", Some (timestamp_format_to_yojson x.created_at));
      ("aliasArn", Some (resource_arn_to_yojson x.alias_arn));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("aliasName", Some (alias_to_yojson x.alias_name));
    ]

let create_policy_store_alias_input_to_yojson (x : create_policy_store_alias_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("aliasName", Some (alias_to_yojson x.alias_name));
    ]

let create_policy_output_to_yojson (x : create_policy_output) =
  assoc_to_yojson
    [
      ("effect", option_to_yojson policy_effect_to_yojson x.effect_);
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("actions", option_to_yojson action_identifier_list_to_yojson x.actions);
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
      ("policyType", Some (policy_type_to_yojson x.policy_type));
      ("policyId", Some (policy_id_to_yojson x.policy_id));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let create_policy_input_to_yojson (x : create_policy_input) =
  assoc_to_yojson
    [
      ("name", option_to_yojson policy_name_to_yojson x.name);
      ("definition", Some (policy_definition_to_yojson x.definition));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ( "clientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_identity_source_output_to_yojson (x : create_identity_source_output) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("identitySourceId", Some (identity_source_id_to_yojson x.identity_source_id));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
    ]

let cognito_group_configuration_to_yojson (x : cognito_group_configuration) =
  assoc_to_yojson [ ("groupEntityType", Some (group_entity_type_to_yojson x.group_entity_type)) ]

let cognito_user_pool_configuration_to_yojson (x : cognito_user_pool_configuration) =
  assoc_to_yojson
    [
      ( "groupConfiguration",
        option_to_yojson cognito_group_configuration_to_yojson x.group_configuration );
      ("clientIds", option_to_yojson client_ids_to_yojson x.client_ids);
      ("userPoolArn", Some (user_pool_arn_to_yojson x.user_pool_arn));
    ]

let configuration_to_yojson (x : configuration) =
  match x with
  | OpenIdConnectConfiguration arg ->
      assoc_to_yojson
        [ ("openIdConnectConfiguration", Some (open_id_connect_configuration_to_yojson arg)) ]
  | CognitoUserPoolConfiguration arg ->
      assoc_to_yojson
        [ ("cognitoUserPoolConfiguration", Some (cognito_user_pool_configuration_to_yojson arg)) ]

let create_identity_source_input_to_yojson (x : create_identity_source_input) =
  assoc_to_yojson
    [
      ( "principalEntityType",
        option_to_yojson principal_entity_type_to_yojson x.principal_entity_type );
      ("configuration", Some (configuration_to_yojson x.configuration));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ( "clientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let batch_is_authorized_with_token_input_item_to_yojson
    (x : batch_is_authorized_with_token_input_item) =
  assoc_to_yojson
    [
      ("context", option_to_yojson context_definition_to_yojson x.context);
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
      ("action", option_to_yojson action_identifier_to_yojson x.action);
    ]

let batch_is_authorized_with_token_output_item_to_yojson
    (x : batch_is_authorized_with_token_output_item) =
  assoc_to_yojson
    [
      ("errors", Some (evaluation_error_list_to_yojson x.errors));
      ("determiningPolicies", Some (determining_policy_list_to_yojson x.determining_policies));
      ("decision", Some (decision_to_yojson x.decision));
      ("request", Some (batch_is_authorized_with_token_input_item_to_yojson x.request));
    ]

let batch_is_authorized_with_token_output_list_to_yojson tree =
  list_to_yojson batch_is_authorized_with_token_output_item_to_yojson tree

let batch_is_authorized_with_token_output_to_yojson (x : batch_is_authorized_with_token_output) =
  assoc_to_yojson
    [
      ("results", Some (batch_is_authorized_with_token_output_list_to_yojson x.results));
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
    ]

let batch_is_authorized_with_token_input_list_to_yojson tree =
  list_to_yojson batch_is_authorized_with_token_input_item_to_yojson tree

let batch_is_authorized_with_token_input_to_yojson (x : batch_is_authorized_with_token_input) =
  assoc_to_yojson
    [
      ("requests", Some (batch_is_authorized_with_token_input_list_to_yojson x.requests));
      ("entities", option_to_yojson entities_definition_to_yojson x.entities);
      ("accessToken", option_to_yojson token_to_yojson x.access_token);
      ("identityToken", option_to_yojson token_to_yojson x.identity_token);
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let batch_is_authorized_input_item_to_yojson (x : batch_is_authorized_input_item) =
  assoc_to_yojson
    [
      ("context", option_to_yojson context_definition_to_yojson x.context);
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
      ("action", option_to_yojson action_identifier_to_yojson x.action);
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
    ]

let batch_is_authorized_output_item_to_yojson (x : batch_is_authorized_output_item) =
  assoc_to_yojson
    [
      ("errors", Some (evaluation_error_list_to_yojson x.errors));
      ("determiningPolicies", Some (determining_policy_list_to_yojson x.determining_policies));
      ("decision", Some (decision_to_yojson x.decision));
      ("request", Some (batch_is_authorized_input_item_to_yojson x.request));
    ]

let batch_is_authorized_output_list_to_yojson tree =
  list_to_yojson batch_is_authorized_output_item_to_yojson tree

let batch_is_authorized_output_to_yojson (x : batch_is_authorized_output) =
  assoc_to_yojson [ ("results", Some (batch_is_authorized_output_list_to_yojson x.results)) ]

let batch_is_authorized_input_list_to_yojson tree =
  list_to_yojson batch_is_authorized_input_item_to_yojson tree

let batch_is_authorized_input_to_yojson (x : batch_is_authorized_input) =
  assoc_to_yojson
    [
      ("requests", Some (batch_is_authorized_input_list_to_yojson x.requests));
      ("entities", option_to_yojson entities_definition_to_yojson x.entities);
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let batch_get_policy_output_item_to_yojson (x : batch_get_policy_output_item) =
  assoc_to_yojson
    [
      ("name", option_to_yojson policy_name_to_yojson x.name);
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("definition", Some (policy_definition_detail_to_yojson x.definition));
      ("policyType", Some (policy_type_to_yojson x.policy_type));
      ("policyId", Some (policy_id_to_yojson x.policy_id));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let batch_get_policy_output_list_to_yojson tree =
  list_to_yojson batch_get_policy_output_item_to_yojson tree

let batch_get_policy_error_code_to_yojson (x : batch_get_policy_error_code) =
  match x with
  | POLICY_STORE_ALIAS_NOT_FOUND -> `String "POLICY_STORE_ALIAS_NOT_FOUND"
  | POLICY_NOT_FOUND -> `String "POLICY_NOT_FOUND"
  | POLICY_STORE_NOT_FOUND -> `String "POLICY_STORE_NOT_FOUND"

let batch_get_policy_error_item_to_yojson (x : batch_get_policy_error_item) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("policyId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.policy_id));
      ( "policyStoreId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.policy_store_id) );
      ("code", Some (batch_get_policy_error_code_to_yojson x.code));
    ]

let batch_get_policy_error_list_to_yojson tree =
  list_to_yojson batch_get_policy_error_item_to_yojson tree

let batch_get_policy_output_to_yojson (x : batch_get_policy_output) =
  assoc_to_yojson
    [
      ("errors", Some (batch_get_policy_error_list_to_yojson x.errors));
      ("results", Some (batch_get_policy_output_list_to_yojson x.results));
    ]

let batch_get_policy_input_item_to_yojson (x : batch_get_policy_input_item) =
  assoc_to_yojson
    [
      ("policyId", Some (policy_id_to_yojson x.policy_id));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let batch_get_policy_input_list_to_yojson tree =
  list_to_yojson batch_get_policy_input_item_to_yojson tree

let batch_get_policy_input_to_yojson (x : batch_get_policy_input) =
  assoc_to_yojson [ ("requests", Some (batch_get_policy_input_list_to_yojson x.requests)) ]
