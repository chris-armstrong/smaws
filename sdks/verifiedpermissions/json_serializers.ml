open Smaws_Lib.Json.SerializeHelpers
open Types

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let action_id_to_yojson = string_to_yojson
let action_type_to_yojson = string_to_yojson

let action_identifier_to_yojson (x : action_identifier) =
  assoc_to_yojson
    [
      ("actionType", Some (action_type_to_yojson x.action_type));
      ("actionId", Some (action_id_to_yojson x.action_id));
    ]

let action_identifier_list_to_yojson tree = list_to_yojson action_identifier_to_yojson tree
let alias_to_yojson = string_to_yojson

let alias_state_to_yojson (x : alias_state) =
  match x with ACTIVE -> `String "Active" | PENDING_DELETION -> `String "PendingDeletion"

let amazon_resource_name_to_yojson = string_to_yojson
let duration_to_yojson = string_to_yojson
let datetime_attribute_to_yojson = string_to_yojson
let decimal_to_yojson = string_to_yojson
let ip_addr_to_yojson = string_to_yojson
let string_attribute_to_yojson = string_to_yojson
let long_attribute_to_yojson = long_to_yojson
let entity_id_to_yojson = string_to_yojson
let entity_type_to_yojson = string_to_yojson

let entity_identifier_to_yojson (x : entity_identifier) =
  assoc_to_yojson
    [
      ("entityType", Some (entity_type_to_yojson x.entity_type));
      ("entityId", Some (entity_id_to_yojson x.entity_id));
    ]

let boolean_attribute_to_yojson = bool_to_yojson

let rec set_attribute_to_yojson tree = list_to_yojson attribute_value_to_yojson tree

and record_attribute_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson attribute_value_to_yojson
    tree

and attribute_value_to_yojson (x : attribute_value) =
  match x with
  | Boolean arg -> assoc_to_yojson [ ("boolean", Some (boolean_attribute_to_yojson arg)) ]
  | EntityIdentifier arg ->
      assoc_to_yojson [ ("entityIdentifier", Some (entity_identifier_to_yojson arg)) ]
  | Long arg -> assoc_to_yojson [ ("long", Some (long_attribute_to_yojson arg)) ]
  | String arg -> assoc_to_yojson [ ("string", Some (string_attribute_to_yojson arg)) ]
  | Set arg -> assoc_to_yojson [ ("set", Some (set_attribute_to_yojson arg)) ]
  | Record arg -> assoc_to_yojson [ ("record", Some (record_attribute_to_yojson arg)) ]
  | Ipaddr arg -> assoc_to_yojson [ ("ipaddr", Some (ip_addr_to_yojson arg)) ]
  | Decimal arg -> assoc_to_yojson [ ("decimal", Some (decimal_to_yojson arg)) ]
  | Datetime arg -> assoc_to_yojson [ ("datetime", Some (datetime_attribute_to_yojson arg)) ]
  | Duration arg -> assoc_to_yojson [ ("duration", Some (duration_to_yojson arg)) ]

let audience_to_yojson = string_to_yojson
let audiences_to_yojson tree = list_to_yojson audience_to_yojson tree

let batch_get_policy_error_code_to_yojson (x : batch_get_policy_error_code) =
  match x with
  | POLICY_STORE_NOT_FOUND -> `String "POLICY_STORE_NOT_FOUND"
  | POLICY_NOT_FOUND -> `String "POLICY_NOT_FOUND"
  | POLICY_STORE_ALIAS_NOT_FOUND -> `String "POLICY_STORE_ALIAS_NOT_FOUND"

let batch_get_policy_error_item_to_yojson (x : batch_get_policy_error_item) =
  assoc_to_yojson
    [
      ("code", Some (batch_get_policy_error_code_to_yojson x.code));
      ( "policyStoreId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.policy_store_id) );
      ("policyId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.policy_id));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let batch_get_policy_error_list_to_yojson tree =
  list_to_yojson batch_get_policy_error_item_to_yojson tree

let policy_name_to_yojson = string_to_yojson
let timestamp_format_to_yojson = timestamp_iso_8601_to_yojson
let policy_template_id_to_yojson = string_to_yojson

let template_linked_policy_definition_detail_to_yojson
    (x : template_linked_policy_definition_detail) =
  assoc_to_yojson
    [
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
    ]

let policy_statement_to_yojson = string_to_yojson
let static_policy_description_to_yojson = string_to_yojson

let static_policy_definition_detail_to_yojson (x : static_policy_definition_detail) =
  assoc_to_yojson
    [
      ("description", option_to_yojson static_policy_description_to_yojson x.description);
      ("statement", Some (policy_statement_to_yojson x.statement));
    ]

let policy_definition_detail_to_yojson (x : policy_definition_detail) =
  match x with
  | Static arg ->
      assoc_to_yojson [ ("static", Some (static_policy_definition_detail_to_yojson arg)) ]
  | TemplateLinked arg ->
      assoc_to_yojson
        [ ("templateLinked", Some (template_linked_policy_definition_detail_to_yojson arg)) ]

let policy_type_to_yojson (x : policy_type) =
  match x with STATIC -> `String "STATIC" | TEMPLATE_LINKED -> `String "TEMPLATE_LINKED"

let policy_id_to_yojson = string_to_yojson
let policy_store_id_to_yojson = string_to_yojson

let batch_get_policy_output_item_to_yojson (x : batch_get_policy_output_item) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("policyId", Some (policy_id_to_yojson x.policy_id));
      ("policyType", Some (policy_type_to_yojson x.policy_type));
      ("definition", Some (policy_definition_detail_to_yojson x.definition));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("name", option_to_yojson policy_name_to_yojson x.name);
    ]

let batch_get_policy_output_list_to_yojson tree =
  list_to_yojson batch_get_policy_output_item_to_yojson tree

let batch_get_policy_output_to_yojson (x : batch_get_policy_output) =
  assoc_to_yojson
    [
      ("results", Some (batch_get_policy_output_list_to_yojson x.results));
      ("errors", Some (batch_get_policy_error_list_to_yojson x.errors));
    ]

let batch_get_policy_input_item_to_yojson (x : batch_get_policy_input_item) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("policyId", Some (policy_id_to_yojson x.policy_id));
    ]

let batch_get_policy_input_list_to_yojson tree =
  list_to_yojson batch_get_policy_input_item_to_yojson tree

let batch_get_policy_input_to_yojson (x : batch_get_policy_input) =
  assoc_to_yojson [ ("requests", Some (batch_get_policy_input_list_to_yojson x.requests)) ]

let resource_type_to_yojson (x : resource_type) =
  match x with
  | IDENTITY_SOURCE -> `String "IDENTITY_SOURCE"
  | POLICY_STORE -> `String "POLICY_STORE"
  | POLICY -> `String "POLICY"
  | POLICY_TEMPLATE -> `String "POLICY_TEMPLATE"
  | SCHEMA -> `String "SCHEMA"
  | POLICY_STORE_ALIAS -> `String "POLICY_STORE_ALIAS"

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
    ]

let evaluation_error_item_to_yojson (x : evaluation_error_item) =
  assoc_to_yojson
    [
      ( "errorDescription",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_description) );
    ]

let evaluation_error_list_to_yojson tree = list_to_yojson evaluation_error_item_to_yojson tree

let determining_policy_item_to_yojson (x : determining_policy_item) =
  assoc_to_yojson [ ("policyId", Some (policy_id_to_yojson x.policy_id)) ]

let determining_policy_list_to_yojson tree = list_to_yojson determining_policy_item_to_yojson tree

let decision_to_yojson (x : decision) =
  match x with ALLOW -> `String "ALLOW" | DENY -> `String "DENY"

let cedar_json_to_yojson = string_to_yojson

let context_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson attribute_value_to_yojson
    tree

let context_definition_to_yojson (x : context_definition) =
  match x with
  | ContextMap arg -> assoc_to_yojson [ ("contextMap", Some (context_map_to_yojson arg)) ]
  | CedarJson arg -> assoc_to_yojson [ ("cedarJson", Some (cedar_json_to_yojson arg)) ]

let batch_is_authorized_input_item_to_yojson (x : batch_is_authorized_input_item) =
  assoc_to_yojson
    [
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
      ("action", option_to_yojson action_identifier_to_yojson x.action);
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
      ("context", option_to_yojson context_definition_to_yojson x.context);
    ]

let batch_is_authorized_output_item_to_yojson (x : batch_is_authorized_output_item) =
  assoc_to_yojson
    [
      ("request", Some (batch_is_authorized_input_item_to_yojson x.request));
      ("decision", Some (decision_to_yojson x.decision));
      ("determiningPolicies", Some (determining_policy_list_to_yojson x.determining_policies));
      ("errors", Some (evaluation_error_list_to_yojson x.errors));
    ]

let batch_is_authorized_output_list_to_yojson tree =
  list_to_yojson batch_is_authorized_output_item_to_yojson tree

let batch_is_authorized_output_to_yojson (x : batch_is_authorized_output) =
  assoc_to_yojson [ ("results", Some (batch_is_authorized_output_list_to_yojson x.results)) ]

let batch_is_authorized_input_list_to_yojson tree =
  list_to_yojson batch_is_authorized_input_item_to_yojson tree

let rec cedar_tag_value_to_yojson (x : cedar_tag_value) =
  match x with
  | Boolean arg -> assoc_to_yojson [ ("boolean", Some (boolean_attribute_to_yojson arg)) ]
  | EntityIdentifier arg ->
      assoc_to_yojson [ ("entityIdentifier", Some (entity_identifier_to_yojson arg)) ]
  | Long arg -> assoc_to_yojson [ ("long", Some (long_attribute_to_yojson arg)) ]
  | String arg -> assoc_to_yojson [ ("string", Some (string_attribute_to_yojson arg)) ]
  | Set arg -> assoc_to_yojson [ ("set", Some (cedar_tag_set_attribute_to_yojson arg)) ]
  | Record arg -> assoc_to_yojson [ ("record", Some (cedar_tag_record_attribute_to_yojson arg)) ]
  | Ipaddr arg -> assoc_to_yojson [ ("ipaddr", Some (ip_addr_to_yojson arg)) ]
  | Decimal arg -> assoc_to_yojson [ ("decimal", Some (decimal_to_yojson arg)) ]
  | Datetime arg -> assoc_to_yojson [ ("datetime", Some (datetime_attribute_to_yojson arg)) ]
  | Duration arg -> assoc_to_yojson [ ("duration", Some (duration_to_yojson arg)) ]

and cedar_tag_set_attribute_to_yojson tree = list_to_yojson cedar_tag_value_to_yojson tree

and cedar_tag_record_attribute_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson cedar_tag_value_to_yojson
    tree

let entity_cedar_tags_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson cedar_tag_value_to_yojson
    tree

let parent_list_to_yojson tree = list_to_yojson entity_identifier_to_yojson tree

let entity_attributes_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson attribute_value_to_yojson
    tree

let entity_item_to_yojson (x : entity_item) =
  assoc_to_yojson
    [
      ("identifier", Some (entity_identifier_to_yojson x.identifier));
      ("attributes", option_to_yojson entity_attributes_to_yojson x.attributes);
      ("parents", option_to_yojson parent_list_to_yojson x.parents);
      ("tags", option_to_yojson entity_cedar_tags_to_yojson x.tags);
    ]

let entity_list_to_yojson tree = list_to_yojson entity_item_to_yojson tree

let entities_definition_to_yojson (x : entities_definition) =
  match x with
  | EntityList arg -> assoc_to_yojson [ ("entityList", Some (entity_list_to_yojson arg)) ]
  | CedarJson arg -> assoc_to_yojson [ ("cedarJson", Some (cedar_json_to_yojson arg)) ]

let batch_is_authorized_input_to_yojson (x : batch_is_authorized_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("entities", option_to_yojson entities_definition_to_yojson x.entities);
      ("requests", Some (batch_is_authorized_input_list_to_yojson x.requests));
    ]

let batch_is_authorized_with_token_input_item_to_yojson
    (x : batch_is_authorized_with_token_input_item) =
  assoc_to_yojson
    [
      ("action", option_to_yojson action_identifier_to_yojson x.action);
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
      ("context", option_to_yojson context_definition_to_yojson x.context);
    ]

let batch_is_authorized_with_token_output_item_to_yojson
    (x : batch_is_authorized_with_token_output_item) =
  assoc_to_yojson
    [
      ("request", Some (batch_is_authorized_with_token_input_item_to_yojson x.request));
      ("decision", Some (decision_to_yojson x.decision));
      ("determiningPolicies", Some (determining_policy_list_to_yojson x.determining_policies));
      ("errors", Some (evaluation_error_list_to_yojson x.errors));
    ]

let batch_is_authorized_with_token_output_list_to_yojson tree =
  list_to_yojson batch_is_authorized_with_token_output_item_to_yojson tree

let batch_is_authorized_with_token_output_to_yojson (x : batch_is_authorized_with_token_output) =
  assoc_to_yojson
    [
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
      ("results", Some (batch_is_authorized_with_token_output_list_to_yojson x.results));
    ]

let batch_is_authorized_with_token_input_list_to_yojson tree =
  list_to_yojson batch_is_authorized_with_token_input_item_to_yojson tree

let token_to_yojson = string_to_yojson

let batch_is_authorized_with_token_input_to_yojson (x : batch_is_authorized_with_token_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("identityToken", option_to_yojson token_to_yojson x.identity_token);
      ("accessToken", option_to_yojson token_to_yojson x.access_token);
      ("entities", option_to_yojson entities_definition_to_yojson x.entities);
      ("requests", Some (batch_is_authorized_with_token_input_list_to_yojson x.requests));
    ]

let cedar_version_to_yojson (x : cedar_version) =
  match x with CEDAR_2 -> `String "CEDAR_2" | CEDAR_4 -> `String "CEDAR_4"

let claim_to_yojson = string_to_yojson
let client_id_to_yojson = string_to_yojson
let client_ids_to_yojson tree = list_to_yojson client_id_to_yojson tree
let group_entity_type_to_yojson = string_to_yojson

let cognito_group_configuration_to_yojson (x : cognito_group_configuration) =
  assoc_to_yojson [ ("groupEntityType", Some (group_entity_type_to_yojson x.group_entity_type)) ]

let cognito_group_configuration_detail_to_yojson (x : cognito_group_configuration_detail) =
  assoc_to_yojson
    [ ("groupEntityType", option_to_yojson group_entity_type_to_yojson x.group_entity_type) ]

let cognito_group_configuration_item_to_yojson (x : cognito_group_configuration_item) =
  assoc_to_yojson
    [ ("groupEntityType", option_to_yojson group_entity_type_to_yojson x.group_entity_type) ]

let user_pool_arn_to_yojson = string_to_yojson

let cognito_user_pool_configuration_to_yojson (x : cognito_user_pool_configuration) =
  assoc_to_yojson
    [
      ("userPoolArn", Some (user_pool_arn_to_yojson x.user_pool_arn));
      ("clientIds", option_to_yojson client_ids_to_yojson x.client_ids);
      ( "groupConfiguration",
        option_to_yojson cognito_group_configuration_to_yojson x.group_configuration );
    ]

let issuer_to_yojson = string_to_yojson

let cognito_user_pool_configuration_detail_to_yojson (x : cognito_user_pool_configuration_detail) =
  assoc_to_yojson
    [
      ("userPoolArn", Some (user_pool_arn_to_yojson x.user_pool_arn));
      ("clientIds", Some (client_ids_to_yojson x.client_ids));
      ("issuer", Some (issuer_to_yojson x.issuer));
      ( "groupConfiguration",
        option_to_yojson cognito_group_configuration_detail_to_yojson x.group_configuration );
    ]

let cognito_user_pool_configuration_item_to_yojson (x : cognito_user_pool_configuration_item) =
  assoc_to_yojson
    [
      ("userPoolArn", Some (user_pool_arn_to_yojson x.user_pool_arn));
      ("clientIds", Some (client_ids_to_yojson x.client_ids));
      ("issuer", Some (issuer_to_yojson x.issuer));
      ( "groupConfiguration",
        option_to_yojson cognito_group_configuration_item_to_yojson x.group_configuration );
    ]

let open_id_connect_identity_token_configuration_to_yojson
    (x : open_id_connect_identity_token_configuration) =
  assoc_to_yojson
    [
      ("principalIdClaim", option_to_yojson claim_to_yojson x.principal_id_claim);
      ("clientIds", option_to_yojson client_ids_to_yojson x.client_ids);
    ]

let open_id_connect_access_token_configuration_to_yojson
    (x : open_id_connect_access_token_configuration) =
  assoc_to_yojson
    [
      ("principalIdClaim", option_to_yojson claim_to_yojson x.principal_id_claim);
      ("audiences", option_to_yojson audiences_to_yojson x.audiences);
    ]

let open_id_connect_token_selection_to_yojson (x : open_id_connect_token_selection) =
  match x with
  | AccessTokenOnly arg ->
      assoc_to_yojson
        [ ("accessTokenOnly", Some (open_id_connect_access_token_configuration_to_yojson arg)) ]
  | IdentityTokenOnly arg ->
      assoc_to_yojson
        [ ("identityTokenOnly", Some (open_id_connect_identity_token_configuration_to_yojson arg)) ]

let open_id_connect_group_configuration_to_yojson (x : open_id_connect_group_configuration) =
  assoc_to_yojson
    [
      ("groupClaim", Some (claim_to_yojson x.group_claim));
      ("groupEntityType", Some (group_entity_type_to_yojson x.group_entity_type));
    ]

let entity_id_prefix_to_yojson = string_to_yojson

let open_id_connect_configuration_to_yojson (x : open_id_connect_configuration) =
  assoc_to_yojson
    [
      ("issuer", Some (issuer_to_yojson x.issuer));
      ("entityIdPrefix", option_to_yojson entity_id_prefix_to_yojson x.entity_id_prefix);
      ( "groupConfiguration",
        option_to_yojson open_id_connect_group_configuration_to_yojson x.group_configuration );
      ("tokenSelection", Some (open_id_connect_token_selection_to_yojson x.token_selection));
    ]

let configuration_to_yojson (x : configuration) =
  match x with
  | CognitoUserPoolConfiguration arg ->
      assoc_to_yojson
        [ ("cognitoUserPoolConfiguration", Some (cognito_user_pool_configuration_to_yojson arg)) ]
  | OpenIdConnectConfiguration arg ->
      assoc_to_yojson
        [ ("openIdConnectConfiguration", Some (open_id_connect_configuration_to_yojson arg)) ]

let open_id_connect_identity_token_configuration_detail_to_yojson
    (x : open_id_connect_identity_token_configuration_detail) =
  assoc_to_yojson
    [
      ("principalIdClaim", option_to_yojson claim_to_yojson x.principal_id_claim);
      ("clientIds", option_to_yojson client_ids_to_yojson x.client_ids);
    ]

let open_id_connect_access_token_configuration_detail_to_yojson
    (x : open_id_connect_access_token_configuration_detail) =
  assoc_to_yojson
    [
      ("principalIdClaim", option_to_yojson claim_to_yojson x.principal_id_claim);
      ("audiences", option_to_yojson audiences_to_yojson x.audiences);
    ]

let open_id_connect_token_selection_detail_to_yojson (x : open_id_connect_token_selection_detail) =
  match x with
  | AccessTokenOnly arg ->
      assoc_to_yojson
        [
          ("accessTokenOnly", Some (open_id_connect_access_token_configuration_detail_to_yojson arg));
        ]
  | IdentityTokenOnly arg ->
      assoc_to_yojson
        [
          ( "identityTokenOnly",
            Some (open_id_connect_identity_token_configuration_detail_to_yojson arg) );
        ]

let open_id_connect_group_configuration_detail_to_yojson
    (x : open_id_connect_group_configuration_detail) =
  assoc_to_yojson
    [
      ("groupClaim", Some (claim_to_yojson x.group_claim));
      ("groupEntityType", Some (group_entity_type_to_yojson x.group_entity_type));
    ]

let open_id_connect_configuration_detail_to_yojson (x : open_id_connect_configuration_detail) =
  assoc_to_yojson
    [
      ("issuer", Some (issuer_to_yojson x.issuer));
      ("entityIdPrefix", option_to_yojson entity_id_prefix_to_yojson x.entity_id_prefix);
      ( "groupConfiguration",
        option_to_yojson open_id_connect_group_configuration_detail_to_yojson x.group_configuration
      );
      ("tokenSelection", Some (open_id_connect_token_selection_detail_to_yojson x.token_selection));
    ]

let configuration_detail_to_yojson (x : configuration_detail) =
  match x with
  | CognitoUserPoolConfiguration arg ->
      assoc_to_yojson
        [
          ( "cognitoUserPoolConfiguration",
            Some (cognito_user_pool_configuration_detail_to_yojson arg) );
        ]
  | OpenIdConnectConfiguration arg ->
      assoc_to_yojson
        [
          ("openIdConnectConfiguration", Some (open_id_connect_configuration_detail_to_yojson arg));
        ]

let open_id_connect_identity_token_configuration_item_to_yojson
    (x : open_id_connect_identity_token_configuration_item) =
  assoc_to_yojson
    [
      ("principalIdClaim", option_to_yojson claim_to_yojson x.principal_id_claim);
      ("clientIds", option_to_yojson client_ids_to_yojson x.client_ids);
    ]

let open_id_connect_access_token_configuration_item_to_yojson
    (x : open_id_connect_access_token_configuration_item) =
  assoc_to_yojson
    [
      ("principalIdClaim", option_to_yojson claim_to_yojson x.principal_id_claim);
      ("audiences", option_to_yojson audiences_to_yojson x.audiences);
    ]

let open_id_connect_token_selection_item_to_yojson (x : open_id_connect_token_selection_item) =
  match x with
  | AccessTokenOnly arg ->
      assoc_to_yojson
        [
          ("accessTokenOnly", Some (open_id_connect_access_token_configuration_item_to_yojson arg));
        ]
  | IdentityTokenOnly arg ->
      assoc_to_yojson
        [
          ( "identityTokenOnly",
            Some (open_id_connect_identity_token_configuration_item_to_yojson arg) );
        ]

let open_id_connect_group_configuration_item_to_yojson
    (x : open_id_connect_group_configuration_item) =
  assoc_to_yojson
    [
      ("groupClaim", Some (claim_to_yojson x.group_claim));
      ("groupEntityType", Some (group_entity_type_to_yojson x.group_entity_type));
    ]

let open_id_connect_configuration_item_to_yojson (x : open_id_connect_configuration_item) =
  assoc_to_yojson
    [
      ("issuer", Some (issuer_to_yojson x.issuer));
      ("entityIdPrefix", option_to_yojson entity_id_prefix_to_yojson x.entity_id_prefix);
      ( "groupConfiguration",
        option_to_yojson open_id_connect_group_configuration_item_to_yojson x.group_configuration );
      ("tokenSelection", Some (open_id_connect_token_selection_item_to_yojson x.token_selection));
    ]

let configuration_item_to_yojson (x : configuration_item) =
  match x with
  | CognitoUserPoolConfiguration arg ->
      assoc_to_yojson
        [
          ("cognitoUserPoolConfiguration", Some (cognito_user_pool_configuration_item_to_yojson arg));
        ]
  | OpenIdConnectConfiguration arg ->
      assoc_to_yojson
        [ ("openIdConnectConfiguration", Some (open_id_connect_configuration_item_to_yojson arg)) ]

let resource_conflict_to_yojson (x : resource_conflict) =
  assoc_to_yojson
    [
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
    ]

let resource_conflict_list_to_yojson tree = list_to_yojson resource_conflict_to_yojson tree

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("resources", Some (resource_conflict_list_to_yojson x.resources));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ( "resourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id );
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
      ( "serviceCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code );
      ( "quotaCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code );
    ]

let identity_source_id_to_yojson = string_to_yojson

let create_identity_source_output_to_yojson (x : create_identity_source_output) =
  assoc_to_yojson
    [
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("identitySourceId", Some (identity_source_id_to_yojson x.identity_source_id));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let principal_entity_type_to_yojson = string_to_yojson
let idempotency_token_to_yojson = string_to_yojson

let create_identity_source_input_to_yojson (x : create_identity_source_input) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("configuration", Some (configuration_to_yojson x.configuration));
      ( "principalEntityType",
        option_to_yojson principal_entity_type_to_yojson x.principal_entity_type );
    ]

let policy_effect_to_yojson (x : policy_effect) =
  match x with PERMIT -> `String "Permit" | FORBID -> `String "Forbid"

let create_policy_output_to_yojson (x : create_policy_output) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("policyId", Some (policy_id_to_yojson x.policy_id));
      ("policyType", Some (policy_type_to_yojson x.policy_type));
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
      ("actions", option_to_yojson action_identifier_list_to_yojson x.actions);
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("effect", option_to_yojson policy_effect_to_yojson x.effect_);
    ]

let template_linked_policy_definition_to_yojson (x : template_linked_policy_definition) =
  assoc_to_yojson
    [
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
    ]

let static_policy_definition_to_yojson (x : static_policy_definition) =
  assoc_to_yojson
    [
      ("description", option_to_yojson static_policy_description_to_yojson x.description);
      ("statement", Some (policy_statement_to_yojson x.statement));
    ]

let policy_definition_to_yojson (x : policy_definition) =
  match x with
  | Static arg -> assoc_to_yojson [ ("static", Some (static_policy_definition_to_yojson arg)) ]
  | TemplateLinked arg ->
      assoc_to_yojson [ ("templateLinked", Some (template_linked_policy_definition_to_yojson arg)) ]

let create_policy_input_to_yojson (x : create_policy_input) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("definition", Some (policy_definition_to_yojson x.definition));
      ("name", option_to_yojson policy_name_to_yojson x.name);
    ]

let resource_arn_to_yojson = string_to_yojson

let create_policy_store_output_to_yojson (x : create_policy_store_output) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("arn", Some (resource_arn_to_yojson x.arn));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
    ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree
let encryption_context_value_to_yojson = string_to_yojson
let encryption_context_key_to_yojson = string_to_yojson

let encryption_context_to_yojson tree =
  map_to_yojson encryption_context_key_to_yojson encryption_context_value_to_yojson tree

let kms_key_to_yojson = string_to_yojson

let kms_encryption_settings_to_yojson (x : kms_encryption_settings) =
  assoc_to_yojson
    [
      ("key", Some (kms_key_to_yojson x.key));
      ("encryptionContext", option_to_yojson encryption_context_to_yojson x.encryption_context);
    ]

let encryption_settings_to_yojson (x : encryption_settings) =
  match x with
  | KmsEncryptionSettings arg ->
      assoc_to_yojson [ ("kmsEncryptionSettings", Some (kms_encryption_settings_to_yojson arg)) ]
  | Default arg ->
      assoc_to_yojson
        [ ("default", Some (Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson arg)) ]

let deletion_protection_to_yojson (x : deletion_protection) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let policy_store_description_to_yojson = string_to_yojson

let validation_mode_to_yojson (x : validation_mode) =
  match x with OFF -> `String "OFF" | STRICT -> `String "STRICT"

let validation_settings_to_yojson (x : validation_settings) =
  assoc_to_yojson [ ("mode", Some (validation_mode_to_yojson x.mode)) ]

let create_policy_store_input_to_yojson (x : create_policy_store_input) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("validationSettings", Some (validation_settings_to_yojson x.validation_settings));
      ("description", option_to_yojson policy_store_description_to_yojson x.description);
      ("deletionProtection", option_to_yojson deletion_protection_to_yojson x.deletion_protection);
      ("encryptionSettings", option_to_yojson encryption_settings_to_yojson x.encryption_settings);
      ("tags", option_to_yojson tag_map_to_yojson x.tags);
    ]

let create_policy_store_alias_output_to_yojson (x : create_policy_store_alias_output) =
  assoc_to_yojson
    [
      ("aliasName", Some (alias_to_yojson x.alias_name));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("aliasArn", Some (resource_arn_to_yojson x.alias_arn));
      ("createdAt", Some (timestamp_format_to_yojson x.created_at));
    ]

let create_policy_store_alias_input_to_yojson (x : create_policy_store_alias_input) =
  assoc_to_yojson
    [
      ("aliasName", Some (alias_to_yojson x.alias_name));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let create_policy_template_output_to_yojson (x : create_policy_template_output) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
    ]

let policy_template_name_to_yojson = string_to_yojson
let policy_template_description_to_yojson = string_to_yojson

let create_policy_template_input_to_yojson (x : create_policy_template_input) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("description", option_to_yojson policy_template_description_to_yojson x.description);
      ("statement", Some (policy_statement_to_yojson x.statement));
      ("name", option_to_yojson policy_template_name_to_yojson x.name);
    ]

let delete_identity_source_output_to_yojson = unit_to_yojson

let delete_identity_source_input_to_yojson (x : delete_identity_source_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("identitySourceId", Some (identity_source_id_to_yojson x.identity_source_id));
    ]

let delete_policy_output_to_yojson = unit_to_yojson

let delete_policy_input_to_yojson (x : delete_policy_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("policyId", Some (policy_id_to_yojson x.policy_id));
    ]

let invalid_state_exception_to_yojson (x : invalid_state_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let delete_policy_store_output_to_yojson = unit_to_yojson

let delete_policy_store_input_to_yojson (x : delete_policy_store_input) =
  assoc_to_yojson [ ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id)) ]

let delete_policy_store_alias_output_to_yojson = unit_to_yojson

let deletion_mode_to_yojson (x : deletion_mode) =
  match x with SOFT_DELETE -> `String "SoftDelete" | HARD_DELETE -> `String "HardDelete"

let delete_policy_store_alias_input_to_yojson (x : delete_policy_store_alias_input) =
  assoc_to_yojson
    [
      ("aliasName", Some (alias_to_yojson x.alias_name));
      ("deletionMode", option_to_yojson deletion_mode_to_yojson x.deletion_mode);
    ]

let delete_policy_template_output_to_yojson = unit_to_yojson

let delete_policy_template_input_to_yojson (x : delete_policy_template_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
    ]

let discovery_url_to_yojson = string_to_yojson

let kms_encryption_state_to_yojson (x : kms_encryption_state) =
  assoc_to_yojson
    [
      ("key", Some (kms_key_to_yojson x.key));
      ("encryptionContext", Some (encryption_context_to_yojson x.encryption_context));
    ]

let encryption_state_to_yojson (x : encryption_state) =
  match x with
  | KmsEncryptionState arg ->
      assoc_to_yojson [ ("kmsEncryptionState", Some (kms_encryption_state_to_yojson arg)) ]
  | Default arg ->
      assoc_to_yojson
        [ ("default", Some (Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson arg)) ]

let entity_reference_to_yojson (x : entity_reference) =
  match x with
  | Unspecified arg ->
      assoc_to_yojson
        [ ("unspecified", Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson arg)) ]
  | Identifier arg -> assoc_to_yojson [ ("identifier", Some (entity_identifier_to_yojson arg)) ]

let open_id_issuer_to_yojson (x : open_id_issuer) = match x with COGNITO -> `String "COGNITO"

let identity_source_details_to_yojson (x : identity_source_details) =
  assoc_to_yojson
    [
      ("clientIds", option_to_yojson client_ids_to_yojson x.client_ids);
      ("userPoolArn", option_to_yojson user_pool_arn_to_yojson x.user_pool_arn);
      ("discoveryUrl", option_to_yojson discovery_url_to_yojson x.discovery_url);
      ("openIdIssuer", option_to_yojson open_id_issuer_to_yojson x.open_id_issuer);
    ]

let get_identity_source_output_to_yojson (x : get_identity_source_output) =
  assoc_to_yojson
    [
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("details", option_to_yojson identity_source_details_to_yojson x.details);
      ("identitySourceId", Some (identity_source_id_to_yojson x.identity_source_id));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("principalEntityType", Some (principal_entity_type_to_yojson x.principal_entity_type));
      ("configuration", option_to_yojson configuration_detail_to_yojson x.configuration);
    ]

let get_identity_source_input_to_yojson (x : get_identity_source_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("identitySourceId", Some (identity_source_id_to_yojson x.identity_source_id));
    ]

let get_policy_output_to_yojson (x : get_policy_output) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("policyId", Some (policy_id_to_yojson x.policy_id));
      ("policyType", Some (policy_type_to_yojson x.policy_type));
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
      ("actions", option_to_yojson action_identifier_list_to_yojson x.actions);
      ("definition", Some (policy_definition_detail_to_yojson x.definition));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("effect", option_to_yojson policy_effect_to_yojson x.effect_);
      ("name", option_to_yojson policy_name_to_yojson x.name);
    ]

let get_policy_input_to_yojson (x : get_policy_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("policyId", Some (policy_id_to_yojson x.policy_id));
    ]

let get_policy_store_output_to_yojson (x : get_policy_store_output) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("arn", Some (resource_arn_to_yojson x.arn));
      ("validationSettings", Some (validation_settings_to_yojson x.validation_settings));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("description", option_to_yojson policy_store_description_to_yojson x.description);
      ("deletionProtection", option_to_yojson deletion_protection_to_yojson x.deletion_protection);
      ("encryptionState", option_to_yojson encryption_state_to_yojson x.encryption_state);
      ("cedarVersion", option_to_yojson cedar_version_to_yojson x.cedar_version);
      ("tags", option_to_yojson tag_map_to_yojson x.tags);
    ]

let get_policy_store_input_to_yojson (x : get_policy_store_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("tags", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.tags);
    ]

let get_policy_store_alias_output_to_yojson (x : get_policy_store_alias_output) =
  assoc_to_yojson
    [
      ("aliasName", Some (alias_to_yojson x.alias_name));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("aliasArn", Some (resource_arn_to_yojson x.alias_arn));
      ("createdAt", Some (timestamp_format_to_yojson x.created_at));
      ("state", Some (alias_state_to_yojson x.state));
    ]

let get_policy_store_alias_input_to_yojson (x : get_policy_store_alias_input) =
  assoc_to_yojson [ ("aliasName", Some (alias_to_yojson x.alias_name)) ]

let get_policy_template_output_to_yojson (x : get_policy_template_output) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
      ("description", option_to_yojson policy_template_description_to_yojson x.description);
      ("statement", Some (policy_statement_to_yojson x.statement));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("name", option_to_yojson policy_template_name_to_yojson x.name);
    ]

let get_policy_template_input_to_yojson (x : get_policy_template_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
    ]

let namespace_to_yojson = string_to_yojson
let namespace_list_to_yojson tree = list_to_yojson namespace_to_yojson tree
let schema_json_to_yojson = string_to_yojson

let get_schema_output_to_yojson (x : get_schema_output) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("schema", Some (schema_json_to_yojson x.schema));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("namespaces", option_to_yojson namespace_list_to_yojson x.namespaces);
    ]

let get_schema_input_to_yojson (x : get_schema_input) =
  assoc_to_yojson [ ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id)) ]

let identity_source_filter_to_yojson (x : identity_source_filter) =
  assoc_to_yojson
    [
      ( "principalEntityType",
        option_to_yojson principal_entity_type_to_yojson x.principal_entity_type );
    ]

let identity_source_filters_to_yojson tree = list_to_yojson identity_source_filter_to_yojson tree

let identity_source_item_details_to_yojson (x : identity_source_item_details) =
  assoc_to_yojson
    [
      ("clientIds", option_to_yojson client_ids_to_yojson x.client_ids);
      ("userPoolArn", option_to_yojson user_pool_arn_to_yojson x.user_pool_arn);
      ("discoveryUrl", option_to_yojson discovery_url_to_yojson x.discovery_url);
      ("openIdIssuer", option_to_yojson open_id_issuer_to_yojson x.open_id_issuer);
    ]

let identity_source_item_to_yojson (x : identity_source_item) =
  assoc_to_yojson
    [
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("details", option_to_yojson identity_source_item_details_to_yojson x.details);
      ("identitySourceId", Some (identity_source_id_to_yojson x.identity_source_id));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("principalEntityType", Some (principal_entity_type_to_yojson x.principal_entity_type));
      ("configuration", option_to_yojson configuration_item_to_yojson x.configuration);
    ]

let identity_sources_to_yojson tree = list_to_yojson identity_source_item_to_yojson tree

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let is_authorized_output_to_yojson (x : is_authorized_output) =
  assoc_to_yojson
    [
      ("decision", Some (decision_to_yojson x.decision));
      ("determiningPolicies", Some (determining_policy_list_to_yojson x.determining_policies));
      ("errors", Some (evaluation_error_list_to_yojson x.errors));
    ]

let is_authorized_input_to_yojson (x : is_authorized_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
      ("action", option_to_yojson action_identifier_to_yojson x.action);
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
      ("context", option_to_yojson context_definition_to_yojson x.context);
      ("entities", option_to_yojson entities_definition_to_yojson x.entities);
    ]

let is_authorized_with_token_output_to_yojson (x : is_authorized_with_token_output) =
  assoc_to_yojson
    [
      ("decision", Some (decision_to_yojson x.decision));
      ("determiningPolicies", Some (determining_policy_list_to_yojson x.determining_policies));
      ("errors", Some (evaluation_error_list_to_yojson x.errors));
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
    ]

let is_authorized_with_token_input_to_yojson (x : is_authorized_with_token_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("identityToken", option_to_yojson token_to_yojson x.identity_token);
      ("accessToken", option_to_yojson token_to_yojson x.access_token);
      ("action", option_to_yojson action_identifier_to_yojson x.action);
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
      ("context", option_to_yojson context_definition_to_yojson x.context);
      ("entities", option_to_yojson entities_definition_to_yojson x.entities);
    ]

let next_token_to_yojson = string_to_yojson

let list_identity_sources_output_to_yojson (x : list_identity_sources_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("identitySources", Some (identity_sources_to_yojson x.identity_sources));
    ]

let list_identity_sources_max_results_to_yojson = int_to_yojson

let list_identity_sources_input_to_yojson (x : list_identity_sources_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson list_identity_sources_max_results_to_yojson x.max_results);
      ("filters", option_to_yojson identity_source_filters_to_yojson x.filters);
    ]

let template_linked_policy_definition_item_to_yojson (x : template_linked_policy_definition_item) =
  assoc_to_yojson
    [
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
    ]

let static_policy_definition_item_to_yojson (x : static_policy_definition_item) =
  assoc_to_yojson
    [ ("description", option_to_yojson static_policy_description_to_yojson x.description) ]

let policy_definition_item_to_yojson (x : policy_definition_item) =
  match x with
  | Static arg -> assoc_to_yojson [ ("static", Some (static_policy_definition_item_to_yojson arg)) ]
  | TemplateLinked arg ->
      assoc_to_yojson
        [ ("templateLinked", Some (template_linked_policy_definition_item_to_yojson arg)) ]

let policy_item_to_yojson (x : policy_item) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("policyId", Some (policy_id_to_yojson x.policy_id));
      ("policyType", Some (policy_type_to_yojson x.policy_type));
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
      ("actions", option_to_yojson action_identifier_list_to_yojson x.actions);
      ("definition", Some (policy_definition_item_to_yojson x.definition));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("effect", option_to_yojson policy_effect_to_yojson x.effect_);
      ("name", option_to_yojson policy_name_to_yojson x.name);
    ]

let policy_list_to_yojson tree = list_to_yojson policy_item_to_yojson tree

let list_policies_output_to_yojson (x : list_policies_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("policies", Some (policy_list_to_yojson x.policies));
    ]

let policy_filter_to_yojson (x : policy_filter) =
  assoc_to_yojson
    [
      ("principal", option_to_yojson entity_reference_to_yojson x.principal);
      ("resource", option_to_yojson entity_reference_to_yojson x.resource);
      ("policyType", option_to_yojson policy_type_to_yojson x.policy_type);
      ("policyTemplateId", option_to_yojson policy_template_id_to_yojson x.policy_template_id);
    ]

let max_results_to_yojson = int_to_yojson

let list_policies_input_to_yojson (x : list_policies_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("filter", option_to_yojson policy_filter_to_yojson x.filter);
    ]

let policy_store_alias_item_to_yojson (x : policy_store_alias_item) =
  assoc_to_yojson
    [
      ("aliasName", Some (alias_to_yojson x.alias_name));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("aliasArn", Some (resource_arn_to_yojson x.alias_arn));
      ("createdAt", Some (timestamp_format_to_yojson x.created_at));
      ("state", Some (alias_state_to_yojson x.state));
    ]

let policy_store_alias_list_to_yojson tree = list_to_yojson policy_store_alias_item_to_yojson tree

let list_policy_store_aliases_output_to_yojson (x : list_policy_store_aliases_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("policyStoreAliases", Some (policy_store_alias_list_to_yojson x.policy_store_aliases));
    ]

let policy_store_alias_filter_to_yojson (x : policy_store_alias_filter) =
  assoc_to_yojson
    [ ("policyStoreId", option_to_yojson policy_store_id_to_yojson x.policy_store_id) ]

let list_policy_store_aliases_input_to_yojson (x : list_policy_store_aliases_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("filter", option_to_yojson policy_store_alias_filter_to_yojson x.filter);
    ]

let policy_store_item_to_yojson (x : policy_store_item) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("arn", Some (resource_arn_to_yojson x.arn));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("lastUpdatedDate", option_to_yojson timestamp_format_to_yojson x.last_updated_date);
      ("description", option_to_yojson policy_store_description_to_yojson x.description);
    ]

let policy_store_list_to_yojson tree = list_to_yojson policy_store_item_to_yojson tree

let list_policy_stores_output_to_yojson (x : list_policy_stores_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("policyStores", Some (policy_store_list_to_yojson x.policy_stores));
    ]

let list_policy_stores_input_to_yojson (x : list_policy_stores_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let policy_template_item_to_yojson (x : policy_template_item) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
      ("description", option_to_yojson policy_template_description_to_yojson x.description);
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("name", option_to_yojson policy_template_name_to_yojson x.name);
    ]

let policy_templates_list_to_yojson tree = list_to_yojson policy_template_item_to_yojson tree

let list_policy_templates_output_to_yojson (x : list_policy_templates_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("policyTemplates", Some (policy_templates_list_to_yojson x.policy_templates));
    ]

let list_policy_templates_input_to_yojson (x : list_policy_templates_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ( "serviceCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code );
      ( "quotaCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code );
    ]

let list_tags_for_resource_output_to_yojson (x : list_tags_for_resource_output) =
  assoc_to_yojson [ ("tags", option_to_yojson tag_map_to_yojson x.tags) ]

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson [ ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn)) ]

let put_schema_output_to_yojson (x : put_schema_output) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("namespaces", Some (namespace_list_to_yojson x.namespaces));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
    ]

let schema_definition_to_yojson (x : schema_definition) =
  match x with
  | CedarJson arg -> assoc_to_yojson [ ("cedarJson", Some (schema_json_to_yojson arg)) ]

let put_schema_input_to_yojson (x : put_schema_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("definition", Some (schema_definition_to_yojson x.definition));
    ]

let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("resourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
    ]

let tag_resource_output_to_yojson = unit_to_yojson

let tag_resource_input_to_yojson (x : tag_resource_input) =
  assoc_to_yojson
    [
      ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
      ("tags", Some (tag_map_to_yojson x.tags));
    ]

let untag_resource_output_to_yojson = unit_to_yojson

let untag_resource_input_to_yojson (x : untag_resource_input) =
  assoc_to_yojson
    [
      ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let update_cognito_group_configuration_to_yojson (x : update_cognito_group_configuration) =
  assoc_to_yojson [ ("groupEntityType", Some (group_entity_type_to_yojson x.group_entity_type)) ]

let update_cognito_user_pool_configuration_to_yojson (x : update_cognito_user_pool_configuration) =
  assoc_to_yojson
    [
      ("userPoolArn", Some (user_pool_arn_to_yojson x.user_pool_arn));
      ("clientIds", option_to_yojson client_ids_to_yojson x.client_ids);
      ( "groupConfiguration",
        option_to_yojson update_cognito_group_configuration_to_yojson x.group_configuration );
    ]

let update_open_id_connect_identity_token_configuration_to_yojson
    (x : update_open_id_connect_identity_token_configuration) =
  assoc_to_yojson
    [
      ("principalIdClaim", option_to_yojson claim_to_yojson x.principal_id_claim);
      ("clientIds", option_to_yojson client_ids_to_yojson x.client_ids);
    ]

let update_open_id_connect_access_token_configuration_to_yojson
    (x : update_open_id_connect_access_token_configuration) =
  assoc_to_yojson
    [
      ("principalIdClaim", option_to_yojson claim_to_yojson x.principal_id_claim);
      ("audiences", option_to_yojson audiences_to_yojson x.audiences);
    ]

let update_open_id_connect_token_selection_to_yojson (x : update_open_id_connect_token_selection) =
  match x with
  | AccessTokenOnly arg ->
      assoc_to_yojson
        [
          ("accessTokenOnly", Some (update_open_id_connect_access_token_configuration_to_yojson arg));
        ]
  | IdentityTokenOnly arg ->
      assoc_to_yojson
        [
          ( "identityTokenOnly",
            Some (update_open_id_connect_identity_token_configuration_to_yojson arg) );
        ]

let update_open_id_connect_group_configuration_to_yojson
    (x : update_open_id_connect_group_configuration) =
  assoc_to_yojson
    [
      ("groupClaim", Some (claim_to_yojson x.group_claim));
      ("groupEntityType", Some (group_entity_type_to_yojson x.group_entity_type));
    ]

let update_open_id_connect_configuration_to_yojson (x : update_open_id_connect_configuration) =
  assoc_to_yojson
    [
      ("issuer", Some (issuer_to_yojson x.issuer));
      ("entityIdPrefix", option_to_yojson entity_id_prefix_to_yojson x.entity_id_prefix);
      ( "groupConfiguration",
        option_to_yojson update_open_id_connect_group_configuration_to_yojson x.group_configuration
      );
      ("tokenSelection", Some (update_open_id_connect_token_selection_to_yojson x.token_selection));
    ]

let update_configuration_to_yojson (x : update_configuration) =
  match x with
  | CognitoUserPoolConfiguration arg ->
      assoc_to_yojson
        [
          ( "cognitoUserPoolConfiguration",
            Some (update_cognito_user_pool_configuration_to_yojson arg) );
        ]
  | OpenIdConnectConfiguration arg ->
      assoc_to_yojson
        [
          ("openIdConnectConfiguration", Some (update_open_id_connect_configuration_to_yojson arg));
        ]

let update_identity_source_output_to_yojson (x : update_identity_source_output) =
  assoc_to_yojson
    [
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("identitySourceId", Some (identity_source_id_to_yojson x.identity_source_id));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
    ]

let update_identity_source_input_to_yojson (x : update_identity_source_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("identitySourceId", Some (identity_source_id_to_yojson x.identity_source_id));
      ("updateConfiguration", Some (update_configuration_to_yojson x.update_configuration));
      ( "principalEntityType",
        option_to_yojson principal_entity_type_to_yojson x.principal_entity_type );
    ]

let update_policy_output_to_yojson (x : update_policy_output) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("policyId", Some (policy_id_to_yojson x.policy_id));
      ("policyType", Some (policy_type_to_yojson x.policy_type));
      ("principal", option_to_yojson entity_identifier_to_yojson x.principal);
      ("resource", option_to_yojson entity_identifier_to_yojson x.resource);
      ("actions", option_to_yojson action_identifier_list_to_yojson x.actions);
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
      ("effect", option_to_yojson policy_effect_to_yojson x.effect_);
    ]

let update_static_policy_definition_to_yojson (x : update_static_policy_definition) =
  assoc_to_yojson
    [
      ("description", option_to_yojson static_policy_description_to_yojson x.description);
      ("statement", Some (policy_statement_to_yojson x.statement));
    ]

let update_policy_definition_to_yojson (x : update_policy_definition) =
  match x with
  | Static arg ->
      assoc_to_yojson [ ("static", Some (update_static_policy_definition_to_yojson arg)) ]

let update_policy_input_to_yojson (x : update_policy_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("policyId", Some (policy_id_to_yojson x.policy_id));
      ("definition", option_to_yojson update_policy_definition_to_yojson x.definition);
      ("name", option_to_yojson policy_name_to_yojson x.name);
    ]

let update_policy_store_output_to_yojson (x : update_policy_store_output) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("arn", Some (resource_arn_to_yojson x.arn));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
    ]

let update_policy_store_input_to_yojson (x : update_policy_store_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("validationSettings", Some (validation_settings_to_yojson x.validation_settings));
      ("deletionProtection", option_to_yojson deletion_protection_to_yojson x.deletion_protection);
      ("description", option_to_yojson policy_store_description_to_yojson x.description);
    ]

let update_policy_template_output_to_yojson (x : update_policy_template_output) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
      ("createdDate", Some (timestamp_format_to_yojson x.created_date));
      ("lastUpdatedDate", Some (timestamp_format_to_yojson x.last_updated_date));
    ]

let update_policy_template_input_to_yojson (x : update_policy_template_input) =
  assoc_to_yojson
    [
      ("policyStoreId", Some (policy_store_id_to_yojson x.policy_store_id));
      ("policyTemplateId", Some (policy_template_id_to_yojson x.policy_template_id));
      ("description", option_to_yojson policy_template_description_to_yojson x.description);
      ("statement", Some (policy_statement_to_yojson x.statement));
      ("name", option_to_yojson policy_template_name_to_yojson x.name);
    ]

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("path", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.path));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("fieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
    ]
