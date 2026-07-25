open Smaws_Lib.Json.SerializeHelpers
open Types

let access_control_attribute_value_source_to_yojson = string_to_yojson

let access_control_attribute_value_source_list_to_yojson tree =
  list_to_yojson access_control_attribute_value_source_to_yojson tree

let access_control_attribute_value_to_yojson (x : access_control_attribute_value) =
  assoc_to_yojson
    [ ("Source", Some (access_control_attribute_value_source_list_to_yojson x.source)) ]

let access_control_attribute_key_to_yojson = string_to_yojson

let access_control_attribute_to_yojson (x : access_control_attribute) =
  assoc_to_yojson
    [
      ("Key", Some (access_control_attribute_key_to_yojson x.key));
      ("Value", Some (access_control_attribute_value_to_yojson x.value));
    ]

let access_control_attribute_list_to_yojson tree =
  list_to_yojson access_control_attribute_to_yojson tree

let access_denied_exception_reason_to_yojson (x : access_denied_exception_reason) =
  match x with KMS_ACCESS_DENIED_EXCEPTION -> `String "KMS_AccessDeniedException"

let access_denied_exception_message_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson access_denied_exception_message_to_yojson x.message);
      ("Reason", option_to_yojson access_denied_exception_reason_to_yojson x.reason);
    ]

let principal_id_to_yojson = string_to_yojson

let principal_type_to_yojson (x : principal_type) =
  match x with USER -> `String "USER" | GROUP -> `String "GROUP"

let permission_set_arn_to_yojson = string_to_yojson
let account_id_to_yojson = string_to_yojson

let account_assignment_to_yojson (x : account_assignment) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("PermissionSetArn", option_to_yojson permission_set_arn_to_yojson x.permission_set_arn);
      ("PrincipalType", option_to_yojson principal_type_to_yojson x.principal_type);
      ("PrincipalId", option_to_yojson principal_id_to_yojson x.principal_id);
    ]

let account_assignment_for_principal_to_yojson (x : account_assignment_for_principal) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("PermissionSetArn", option_to_yojson permission_set_arn_to_yojson x.permission_set_arn);
      ("PrincipalId", option_to_yojson principal_id_to_yojson x.principal_id);
      ("PrincipalType", option_to_yojson principal_type_to_yojson x.principal_type);
    ]

let account_assignment_list_to_yojson tree = list_to_yojson account_assignment_to_yojson tree

let account_assignment_list_for_principal_to_yojson tree =
  list_to_yojson account_assignment_for_principal_to_yojson tree

let date_to_yojson = timestamp_epoch_seconds_to_yojson
let target_type_to_yojson (x : target_type) = match x with AWS_ACCOUNT -> `String "AWS_ACCOUNT"
let target_id_to_yojson = string_to_yojson
let reason_to_yojson = string_to_yojson
let uu_id_to_yojson = string_to_yojson

let status_values_to_yojson (x : status_values) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"

let account_assignment_operation_status_to_yojson (x : account_assignment_operation_status) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson status_values_to_yojson x.status);
      ("RequestId", option_to_yojson uu_id_to_yojson x.request_id);
      ("FailureReason", option_to_yojson reason_to_yojson x.failure_reason);
      ("TargetId", option_to_yojson target_id_to_yojson x.target_id);
      ("TargetType", option_to_yojson target_type_to_yojson x.target_type);
      ("PermissionSetArn", option_to_yojson permission_set_arn_to_yojson x.permission_set_arn);
      ("PrincipalType", option_to_yojson principal_type_to_yojson x.principal_type);
      ("PrincipalId", option_to_yojson principal_id_to_yojson x.principal_id);
      ("CreatedDate", option_to_yojson date_to_yojson x.created_date);
    ]

let account_assignment_operation_status_metadata_to_yojson
    (x : account_assignment_operation_status_metadata) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson status_values_to_yojson x.status);
      ("RequestId", option_to_yojson uu_id_to_yojson x.request_id);
      ("CreatedDate", option_to_yojson date_to_yojson x.created_date);
    ]

let account_assignment_operation_status_list_to_yojson tree =
  list_to_yojson account_assignment_operation_status_metadata_to_yojson tree

let account_list_to_yojson tree = list_to_yojson account_id_to_yojson tree
let actor_policy_document_to_yojson = json_to_yojson

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | KMS_INVALID_KEY_USAGE_EXCEPTION -> `String "KMS_InvalidKeyUsageException"
  | KMS_INVALID_STATE_EXCEPTION -> `String "KMS_InvalidStateException"
  | KMS_DISABLED_EXCEPTION -> `String "KMS_DisabledException"

let validation_exception_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson validation_exception_message_to_yojson x.message);
      ("Reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
    ]

let throttling_exception_reason_to_yojson (x : throttling_exception_reason) =
  match x with KMS_THROTTLING_EXCEPTION -> `String "KMS_ThrottlingException"

let throttling_exception_message_to_yojson = string_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson throttling_exception_message_to_yojson x.message);
      ("Reason", option_to_yojson throttling_exception_reason_to_yojson x.reason);
    ]

let service_quota_exceeded_message_to_yojson = string_to_yojson

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [ ("Message", option_to_yojson service_quota_exceeded_message_to_yojson x.message) ]

let internal_failure_message_to_yojson = string_to_yojson

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson internal_failure_message_to_yojson x.message) ]

let conflict_exception_message_to_yojson = string_to_yojson

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson conflict_exception_message_to_yojson x.message) ]

let region_status_to_yojson (x : region_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | ADDING -> `String "ADDING"
  | REMOVING -> `String "REMOVING"

let add_region_response_to_yojson (x : add_region_response) =
  assoc_to_yojson [ ("Status", option_to_yojson region_status_to_yojson x.status) ]

let region_name_to_yojson = string_to_yojson
let instance_arn_to_yojson = string_to_yojson

let add_region_request_to_yojson (x : add_region_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("RegionName", Some (region_name_to_yojson x.region_name));
    ]

let description_to_yojson = string_to_yojson

let application_visibility_to_yojson (x : application_visibility) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let application_url_to_yojson = string_to_yojson

let sign_in_origin_to_yojson (x : sign_in_origin) =
  match x with IDENTITY_CENTER -> `String "IDENTITY_CENTER" | APPLICATION -> `String "APPLICATION"

let sign_in_options_to_yojson (x : sign_in_options) =
  assoc_to_yojson
    [
      ("Origin", Some (sign_in_origin_to_yojson x.origin));
      ("ApplicationUrl", option_to_yojson application_url_to_yojson x.application_url);
    ]

let portal_options_to_yojson (x : portal_options) =
  assoc_to_yojson
    [
      ("SignInOptions", option_to_yojson sign_in_options_to_yojson x.sign_in_options);
      ("Visibility", option_to_yojson application_visibility_to_yojson x.visibility);
    ]

let application_status_to_yojson (x : application_status) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let identity_store_arn_to_yojson = string_to_yojson
let application_name_type_to_yojson = string_to_yojson
let application_provider_arn_to_yojson = string_to_yojson
let application_arn_to_yojson = string_to_yojson

let application_to_yojson (x : application) =
  assoc_to_yojson
    [
      ("ApplicationArn", option_to_yojson application_arn_to_yojson x.application_arn);
      ( "ApplicationProviderArn",
        option_to_yojson application_provider_arn_to_yojson x.application_provider_arn );
      ("Name", option_to_yojson application_name_type_to_yojson x.name);
      ("ApplicationAccount", option_to_yojson account_id_to_yojson x.application_account);
      ("InstanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
      ("IdentityStoreArn", option_to_yojson identity_store_arn_to_yojson x.identity_store_arn);
      ("Status", option_to_yojson application_status_to_yojson x.status);
      ("PortalOptions", option_to_yojson portal_options_to_yojson x.portal_options);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("CreatedDate", option_to_yojson date_to_yojson x.created_date);
      ("CreatedFrom", option_to_yojson region_name_to_yojson x.created_from);
    ]

let application_assignment_to_yojson (x : application_assignment) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ("PrincipalId", Some (principal_id_to_yojson x.principal_id));
      ("PrincipalType", Some (principal_type_to_yojson x.principal_type));
    ]

let application_assignment_for_principal_to_yojson (x : application_assignment_for_principal) =
  assoc_to_yojson
    [
      ("ApplicationArn", option_to_yojson application_arn_to_yojson x.application_arn);
      ("PrincipalId", option_to_yojson principal_id_to_yojson x.principal_id);
      ("PrincipalType", option_to_yojson principal_type_to_yojson x.principal_type);
    ]

let application_assignment_list_for_principal_to_yojson tree =
  list_to_yojson application_assignment_for_principal_to_yojson tree

let application_assignments_list_to_yojson tree =
  list_to_yojson application_assignment_to_yojson tree

let application_list_to_yojson tree = list_to_yojson application_to_yojson tree

let resource_server_scope_details_to_yojson (x : resource_server_scope_details) =
  assoc_to_yojson
    [
      ("LongDescription", option_to_yojson description_to_yojson x.long_description);
      ("DetailedTitle", option_to_yojson description_to_yojson x.detailed_title);
    ]

let resource_server_scope_to_yojson = string_to_yojson

let resource_server_scopes_to_yojson tree =
  map_to_yojson resource_server_scope_to_yojson resource_server_scope_details_to_yojson tree

let resource_server_config_to_yojson (x : resource_server_config) =
  assoc_to_yojson [ ("Scopes", option_to_yojson resource_server_scopes_to_yojson x.scopes) ]

let icon_url_to_yojson = string_to_yojson
let name_to_yojson = string_to_yojson

let display_data_to_yojson (x : display_data) =
  assoc_to_yojson
    [
      ("DisplayName", option_to_yojson name_to_yojson x.display_name);
      ("IconUrl", option_to_yojson icon_url_to_yojson x.icon_url);
      ("Description", option_to_yojson description_to_yojson x.description);
    ]

let federation_protocol_to_yojson (x : federation_protocol) =
  match x with SAML -> `String "SAML" | OAUTH -> `String "OAUTH"

let application_provider_to_yojson (x : application_provider) =
  assoc_to_yojson
    [
      ( "ApplicationProviderArn",
        Some (application_provider_arn_to_yojson x.application_provider_arn) );
      ("FederationProtocol", option_to_yojson federation_protocol_to_yojson x.federation_protocol);
      ("DisplayData", option_to_yojson display_data_to_yojson x.display_data);
      ( "ResourceServerConfig",
        option_to_yojson resource_server_config_to_yojson x.resource_server_config );
    ]

let application_provider_list_to_yojson tree = list_to_yojson application_provider_to_yojson tree
let assignment_required_to_yojson = bool_to_yojson

let resource_not_found_exception_reason_to_yojson (x : resource_not_found_exception_reason) =
  match x with KMS_NOT_FOUND_EXCEPTION -> `String "KMS_NotFoundException"

let resource_not_found_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson resource_not_found_message_to_yojson x.message);
      ("Reason", option_to_yojson resource_not_found_exception_reason_to_yojson x.reason);
    ]

let attach_customer_managed_policy_reference_to_permission_set_response_to_yojson = unit_to_yojson
let managed_policy_path_to_yojson = string_to_yojson
let managed_policy_name_to_yojson = string_to_yojson

let customer_managed_policy_reference_to_yojson (x : customer_managed_policy_reference) =
  assoc_to_yojson
    [
      ("Name", Some (managed_policy_name_to_yojson x.name));
      ("Path", option_to_yojson managed_policy_path_to_yojson x.path);
    ]

let attach_customer_managed_policy_reference_to_permission_set_request_to_yojson
    (x : attach_customer_managed_policy_reference_to_permission_set_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ( "CustomerManagedPolicyReference",
        Some (customer_managed_policy_reference_to_yojson x.customer_managed_policy_reference) );
    ]

let attach_managed_policy_to_permission_set_response_to_yojson = unit_to_yojson
let managed_policy_arn_to_yojson = string_to_yojson

let attach_managed_policy_to_permission_set_request_to_yojson
    (x : attach_managed_policy_to_permission_set_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("ManagedPolicyArn", Some (managed_policy_arn_to_yojson x.managed_policy_arn));
    ]

let attached_managed_policy_to_yojson (x : attached_managed_policy) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_to_yojson x.name);
      ("Arn", option_to_yojson managed_policy_arn_to_yojson x.arn);
    ]

let attached_managed_policy_list_to_yojson tree =
  list_to_yojson attached_managed_policy_to_yojson tree

let iam_authentication_method_to_yojson (x : iam_authentication_method) =
  assoc_to_yojson [ ("ActorPolicy", Some (actor_policy_document_to_yojson x.actor_policy)) ]

let authentication_method_to_yojson (x : authentication_method) =
  match x with
  | Iam arg -> assoc_to_yojson [ ("Iam", Some (iam_authentication_method_to_yojson arg)) ]

let authentication_method_type_to_yojson (x : authentication_method_type) =
  match x with IAM -> `String "IAM"

let authentication_method_item_to_yojson (x : authentication_method_item) =
  assoc_to_yojson
    [
      ( "AuthenticationMethodType",
        option_to_yojson authentication_method_type_to_yojson x.authentication_method_type );
      ( "AuthenticationMethod",
        option_to_yojson authentication_method_to_yojson x.authentication_method );
    ]

let authentication_methods_to_yojson tree = list_to_yojson authentication_method_item_to_yojson tree
let ur_i_to_yojson = string_to_yojson
let redirect_uris_to_yojson tree = list_to_yojson ur_i_to_yojson tree

let authorization_code_grant_to_yojson (x : authorization_code_grant) =
  assoc_to_yojson [ ("RedirectUris", option_to_yojson redirect_uris_to_yojson x.redirect_uris) ]

let token_issuer_audience_to_yojson = string_to_yojson
let token_issuer_audiences_to_yojson tree = list_to_yojson token_issuer_audience_to_yojson tree
let trusted_token_issuer_arn_to_yojson = string_to_yojson

let authorized_token_issuer_to_yojson (x : authorized_token_issuer) =
  assoc_to_yojson
    [
      ( "TrustedTokenIssuerArn",
        option_to_yojson trusted_token_issuer_arn_to_yojson x.trusted_token_issuer_arn );
      ( "AuthorizedAudiences",
        option_to_yojson token_issuer_audiences_to_yojson x.authorized_audiences );
    ]

let authorized_token_issuers_to_yojson tree = list_to_yojson authorized_token_issuer_to_yojson tree
let claim_attribute_path_to_yojson = string_to_yojson
let client_token_to_yojson = string_to_yojson

let create_account_assignment_response_to_yojson (x : create_account_assignment_response) =
  assoc_to_yojson
    [
      ( "AccountAssignmentCreationStatus",
        option_to_yojson account_assignment_operation_status_to_yojson
          x.account_assignment_creation_status );
    ]

let create_account_assignment_request_to_yojson (x : create_account_assignment_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("TargetId", Some (target_id_to_yojson x.target_id));
      ("TargetType", Some (target_type_to_yojson x.target_type));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("PrincipalType", Some (principal_type_to_yojson x.principal_type));
      ("PrincipalId", Some (principal_id_to_yojson x.principal_id));
    ]

let create_application_response_to_yojson (x : create_application_response) =
  assoc_to_yojson
    [
      ("ApplicationArn", option_to_yojson application_arn_to_yojson x.application_arn);
      ("InstanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
      ("IdentityStoreArn", option_to_yojson identity_store_arn_to_yojson x.identity_store_arn);
    ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let create_application_request_to_yojson (x : create_application_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ( "ApplicationProviderArn",
        Some (application_provider_arn_to_yojson x.application_provider_arn) );
      ("Name", Some (application_name_type_to_yojson x.name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("PortalOptions", option_to_yojson portal_options_to_yojson x.portal_options);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Status", option_to_yojson application_status_to_yojson x.status);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_application_assignment_response_to_yojson = unit_to_yojson

let create_application_assignment_request_to_yojson (x : create_application_assignment_request) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ("PrincipalId", Some (principal_id_to_yojson x.principal_id));
      ("PrincipalType", Some (principal_type_to_yojson x.principal_type));
    ]

let create_instance_response_to_yojson (x : create_instance_response) =
  assoc_to_yojson [ ("InstanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn) ]

let name_type_to_yojson = string_to_yojson

let create_instance_request_to_yojson (x : create_instance_request) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_type_to_yojson x.name);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_instance_access_control_attribute_configuration_response_to_yojson = unit_to_yojson

let instance_access_control_attribute_configuration_to_yojson
    (x : instance_access_control_attribute_configuration) =
  assoc_to_yojson
    [
      ( "AccessControlAttributes",
        Some (access_control_attribute_list_to_yojson x.access_control_attributes) );
    ]

let create_instance_access_control_attribute_configuration_request_to_yojson
    (x : create_instance_access_control_attribute_configuration_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ( "InstanceAccessControlAttributeConfiguration",
        Some
          (instance_access_control_attribute_configuration_to_yojson
             x.instance_access_control_attribute_configuration) );
    ]

let relay_state_to_yojson = string_to_yojson
let duration_to_yojson = string_to_yojson
let permission_set_description_to_yojson = string_to_yojson
let permission_set_name_to_yojson = string_to_yojson

let permission_set_to_yojson (x : permission_set) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson permission_set_name_to_yojson x.name);
      ("PermissionSetArn", option_to_yojson permission_set_arn_to_yojson x.permission_set_arn);
      ("Description", option_to_yojson permission_set_description_to_yojson x.description);
      ("CreatedDate", option_to_yojson date_to_yojson x.created_date);
      ("SessionDuration", option_to_yojson duration_to_yojson x.session_duration);
      ("RelayState", option_to_yojson relay_state_to_yojson x.relay_state);
    ]

let create_permission_set_response_to_yojson (x : create_permission_set_response) =
  assoc_to_yojson [ ("PermissionSet", option_to_yojson permission_set_to_yojson x.permission_set) ]

let create_permission_set_request_to_yojson (x : create_permission_set_request) =
  assoc_to_yojson
    [
      ("Name", Some (permission_set_name_to_yojson x.name));
      ("Description", option_to_yojson permission_set_description_to_yojson x.description);
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("SessionDuration", option_to_yojson duration_to_yojson x.session_duration);
      ("RelayState", option_to_yojson relay_state_to_yojson x.relay_state);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_trusted_token_issuer_response_to_yojson (x : create_trusted_token_issuer_response) =
  assoc_to_yojson
    [
      ( "TrustedTokenIssuerArn",
        option_to_yojson trusted_token_issuer_arn_to_yojson x.trusted_token_issuer_arn );
    ]

let jwks_retrieval_option_to_yojson (x : jwks_retrieval_option) =
  match x with OPEN_ID_DISCOVERY -> `String "OPEN_ID_DISCOVERY"

let jmes_path_to_yojson = string_to_yojson
let trusted_token_issuer_url_to_yojson = string_to_yojson

let oidc_jwt_configuration_to_yojson (x : oidc_jwt_configuration) =
  assoc_to_yojson
    [
      ("IssuerUrl", Some (trusted_token_issuer_url_to_yojson x.issuer_url));
      ("ClaimAttributePath", Some (claim_attribute_path_to_yojson x.claim_attribute_path));
      ("IdentityStoreAttributePath", Some (jmes_path_to_yojson x.identity_store_attribute_path));
      ("JwksRetrievalOption", Some (jwks_retrieval_option_to_yojson x.jwks_retrieval_option));
    ]

let trusted_token_issuer_configuration_to_yojson (x : trusted_token_issuer_configuration) =
  match x with
  | OidcJwtConfiguration arg ->
      assoc_to_yojson [ ("OidcJwtConfiguration", Some (oidc_jwt_configuration_to_yojson arg)) ]

let trusted_token_issuer_type_to_yojson (x : trusted_token_issuer_type) =
  match x with OIDC_JWT -> `String "OIDC_JWT"

let trusted_token_issuer_name_to_yojson = string_to_yojson

let create_trusted_token_issuer_request_to_yojson (x : create_trusted_token_issuer_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("Name", Some (trusted_token_issuer_name_to_yojson x.name));
      ( "TrustedTokenIssuerType",
        Some (trusted_token_issuer_type_to_yojson x.trusted_token_issuer_type) );
      ( "TrustedTokenIssuerConfiguration",
        Some (trusted_token_issuer_configuration_to_yojson x.trusted_token_issuer_configuration) );
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let customer_managed_policy_reference_list_to_yojson tree =
  list_to_yojson customer_managed_policy_reference_to_yojson tree

let delete_account_assignment_response_to_yojson (x : delete_account_assignment_response) =
  assoc_to_yojson
    [
      ( "AccountAssignmentDeletionStatus",
        option_to_yojson account_assignment_operation_status_to_yojson
          x.account_assignment_deletion_status );
    ]

let delete_account_assignment_request_to_yojson (x : delete_account_assignment_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("TargetId", Some (target_id_to_yojson x.target_id));
      ("TargetType", Some (target_type_to_yojson x.target_type));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("PrincipalType", Some (principal_type_to_yojson x.principal_type));
      ("PrincipalId", Some (principal_id_to_yojson x.principal_id));
    ]

let delete_application_response_to_yojson = unit_to_yojson

let delete_application_request_to_yojson (x : delete_application_request) =
  assoc_to_yojson [ ("ApplicationArn", Some (application_arn_to_yojson x.application_arn)) ]

let scope_to_yojson = string_to_yojson

let delete_application_access_scope_request_to_yojson (x : delete_application_access_scope_request)
    =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ("Scope", Some (scope_to_yojson x.scope));
    ]

let delete_application_assignment_response_to_yojson = unit_to_yojson

let delete_application_assignment_request_to_yojson (x : delete_application_assignment_request) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ("PrincipalId", Some (principal_id_to_yojson x.principal_id));
      ("PrincipalType", Some (principal_type_to_yojson x.principal_type));
    ]

let delete_application_authentication_method_request_to_yojson
    (x : delete_application_authentication_method_request) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ( "AuthenticationMethodType",
        Some (authentication_method_type_to_yojson x.authentication_method_type) );
    ]

let grant_type_to_yojson (x : grant_type) =
  match x with
  | AUTHORIZATION_CODE -> `String "authorization_code"
  | REFRESH_TOKEN -> `String "refresh_token"
  | JWT_BEARER -> `String "urn:ietf:params:oauth:grant-type:jwt-bearer"
  | TOKEN_EXCHANGE -> `String "urn:ietf:params:oauth:grant-type:token-exchange"

let delete_application_grant_request_to_yojson (x : delete_application_grant_request) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ("GrantType", Some (grant_type_to_yojson x.grant_type));
    ]

let delete_inline_policy_from_permission_set_response_to_yojson = unit_to_yojson

let delete_inline_policy_from_permission_set_request_to_yojson
    (x : delete_inline_policy_from_permission_set_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
    ]

let delete_instance_response_to_yojson = unit_to_yojson

let delete_instance_request_to_yojson (x : delete_instance_request) =
  assoc_to_yojson [ ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn)) ]

let delete_instance_access_control_attribute_configuration_response_to_yojson = unit_to_yojson

let delete_instance_access_control_attribute_configuration_request_to_yojson
    (x : delete_instance_access_control_attribute_configuration_request) =
  assoc_to_yojson [ ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn)) ]

let delete_permission_set_response_to_yojson = unit_to_yojson

let delete_permission_set_request_to_yojson (x : delete_permission_set_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
    ]

let delete_permissions_boundary_from_permission_set_response_to_yojson = unit_to_yojson

let delete_permissions_boundary_from_permission_set_request_to_yojson
    (x : delete_permissions_boundary_from_permission_set_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
    ]

let delete_trusted_token_issuer_response_to_yojson = unit_to_yojson

let delete_trusted_token_issuer_request_to_yojson (x : delete_trusted_token_issuer_request) =
  assoc_to_yojson
    [
      ("TrustedTokenIssuerArn", Some (trusted_token_issuer_arn_to_yojson x.trusted_token_issuer_arn));
    ]

let describe_account_assignment_creation_status_response_to_yojson
    (x : describe_account_assignment_creation_status_response) =
  assoc_to_yojson
    [
      ( "AccountAssignmentCreationStatus",
        option_to_yojson account_assignment_operation_status_to_yojson
          x.account_assignment_creation_status );
    ]

let describe_account_assignment_creation_status_request_to_yojson
    (x : describe_account_assignment_creation_status_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ( "AccountAssignmentCreationRequestId",
        Some (uu_id_to_yojson x.account_assignment_creation_request_id) );
    ]

let describe_account_assignment_deletion_status_response_to_yojson
    (x : describe_account_assignment_deletion_status_response) =
  assoc_to_yojson
    [
      ( "AccountAssignmentDeletionStatus",
        option_to_yojson account_assignment_operation_status_to_yojson
          x.account_assignment_deletion_status );
    ]

let describe_account_assignment_deletion_status_request_to_yojson
    (x : describe_account_assignment_deletion_status_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ( "AccountAssignmentDeletionRequestId",
        Some (uu_id_to_yojson x.account_assignment_deletion_request_id) );
    ]

let describe_application_response_to_yojson (x : describe_application_response) =
  assoc_to_yojson
    [
      ("ApplicationArn", option_to_yojson application_arn_to_yojson x.application_arn);
      ( "ApplicationProviderArn",
        option_to_yojson application_provider_arn_to_yojson x.application_provider_arn );
      ("Name", option_to_yojson application_name_type_to_yojson x.name);
      ("ApplicationAccount", option_to_yojson account_id_to_yojson x.application_account);
      ("InstanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
      ("IdentityStoreArn", option_to_yojson identity_store_arn_to_yojson x.identity_store_arn);
      ("Status", option_to_yojson application_status_to_yojson x.status);
      ("PortalOptions", option_to_yojson portal_options_to_yojson x.portal_options);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("CreatedDate", option_to_yojson date_to_yojson x.created_date);
      ("CreatedFrom", option_to_yojson region_name_to_yojson x.created_from);
    ]

let describe_application_request_to_yojson (x : describe_application_request) =
  assoc_to_yojson [ ("ApplicationArn", Some (application_arn_to_yojson x.application_arn)) ]

let describe_application_assignment_response_to_yojson
    (x : describe_application_assignment_response) =
  assoc_to_yojson
    [
      ("PrincipalType", option_to_yojson principal_type_to_yojson x.principal_type);
      ("PrincipalId", option_to_yojson principal_id_to_yojson x.principal_id);
      ("ApplicationArn", option_to_yojson application_arn_to_yojson x.application_arn);
    ]

let describe_application_assignment_request_to_yojson (x : describe_application_assignment_request)
    =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ("PrincipalId", Some (principal_id_to_yojson x.principal_id));
      ("PrincipalType", Some (principal_type_to_yojson x.principal_type));
    ]

let describe_application_provider_response_to_yojson (x : describe_application_provider_response) =
  assoc_to_yojson
    [
      ( "ApplicationProviderArn",
        Some (application_provider_arn_to_yojson x.application_provider_arn) );
      ("FederationProtocol", option_to_yojson federation_protocol_to_yojson x.federation_protocol);
      ("DisplayData", option_to_yojson display_data_to_yojson x.display_data);
      ( "ResourceServerConfig",
        option_to_yojson resource_server_config_to_yojson x.resource_server_config );
    ]

let describe_application_provider_request_to_yojson (x : describe_application_provider_request) =
  assoc_to_yojson
    [
      ( "ApplicationProviderArn",
        Some (application_provider_arn_to_yojson x.application_provider_arn) );
    ]

let kms_key_status_to_yojson (x : kms_key_status) =
  match x with
  | UPDATING -> `String "UPDATING"
  | ENABLED -> `String "ENABLED"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"

let kms_key_arn_to_yojson = string_to_yojson

let kms_key_type_to_yojson (x : kms_key_type) =
  match x with
  | AWS_OWNED_KMS_KEY -> `String "AWS_OWNED_KMS_KEY"
  | CUSTOMER_MANAGED_KEY -> `String "CUSTOMER_MANAGED_KEY"

let encryption_configuration_details_to_yojson (x : encryption_configuration_details) =
  assoc_to_yojson
    [
      ("KeyType", option_to_yojson kms_key_type_to_yojson x.key_type);
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("EncryptionStatus", option_to_yojson kms_key_status_to_yojson x.encryption_status);
      ("EncryptionStatusReason", option_to_yojson reason_to_yojson x.encryption_status_reason);
    ]

let instance_status_to_yojson (x : instance_status) =
  match x with
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | ACTIVE -> `String "ACTIVE"

let id_to_yojson = string_to_yojson

let describe_instance_response_to_yojson (x : describe_instance_response) =
  assoc_to_yojson
    [
      ("InstanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
      ("IdentityStoreId", option_to_yojson id_to_yojson x.identity_store_id);
      ("OwnerAccountId", option_to_yojson account_id_to_yojson x.owner_account_id);
      ("Name", option_to_yojson name_type_to_yojson x.name);
      ("CreatedDate", option_to_yojson date_to_yojson x.created_date);
      ("Status", option_to_yojson instance_status_to_yojson x.status);
      ("StatusReason", option_to_yojson reason_to_yojson x.status_reason);
      ( "EncryptionConfigurationDetails",
        option_to_yojson encryption_configuration_details_to_yojson
          x.encryption_configuration_details );
    ]

let describe_instance_request_to_yojson (x : describe_instance_request) =
  assoc_to_yojson [ ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn)) ]

let instance_access_control_attribute_configuration_status_reason_to_yojson = string_to_yojson

let instance_access_control_attribute_configuration_status_to_yojson
    (x : instance_access_control_attribute_configuration_status) =
  match x with
  | ENABLED -> `String "ENABLED"
  | CREATION_IN_PROGRESS -> `String "CREATION_IN_PROGRESS"
  | CREATION_FAILED -> `String "CREATION_FAILED"

let describe_instance_access_control_attribute_configuration_response_to_yojson
    (x : describe_instance_access_control_attribute_configuration_response) =
  assoc_to_yojson
    [
      ( "Status",
        option_to_yojson instance_access_control_attribute_configuration_status_to_yojson x.status
      );
      ( "StatusReason",
        option_to_yojson instance_access_control_attribute_configuration_status_reason_to_yojson
          x.status_reason );
      ( "InstanceAccessControlAttributeConfiguration",
        option_to_yojson instance_access_control_attribute_configuration_to_yojson
          x.instance_access_control_attribute_configuration );
    ]

let describe_instance_access_control_attribute_configuration_request_to_yojson
    (x : describe_instance_access_control_attribute_configuration_request) =
  assoc_to_yojson [ ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn)) ]

let describe_permission_set_response_to_yojson (x : describe_permission_set_response) =
  assoc_to_yojson [ ("PermissionSet", option_to_yojson permission_set_to_yojson x.permission_set) ]

let describe_permission_set_request_to_yojson (x : describe_permission_set_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
    ]

let permission_set_provisioning_status_to_yojson (x : permission_set_provisioning_status) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson status_values_to_yojson x.status);
      ("RequestId", option_to_yojson uu_id_to_yojson x.request_id);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("PermissionSetArn", option_to_yojson permission_set_arn_to_yojson x.permission_set_arn);
      ("FailureReason", option_to_yojson reason_to_yojson x.failure_reason);
      ("CreatedDate", option_to_yojson date_to_yojson x.created_date);
    ]

let describe_permission_set_provisioning_status_response_to_yojson
    (x : describe_permission_set_provisioning_status_response) =
  assoc_to_yojson
    [
      ( "PermissionSetProvisioningStatus",
        option_to_yojson permission_set_provisioning_status_to_yojson
          x.permission_set_provisioning_status );
    ]

let describe_permission_set_provisioning_status_request_to_yojson
    (x : describe_permission_set_provisioning_status_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ( "ProvisionPermissionSetRequestId",
        Some (uu_id_to_yojson x.provision_permission_set_request_id) );
    ]

let is_primary_region_to_yojson = bool_to_yojson

let describe_region_response_to_yojson (x : describe_region_response) =
  assoc_to_yojson
    [
      ("RegionName", option_to_yojson region_name_to_yojson x.region_name);
      ("Status", option_to_yojson region_status_to_yojson x.status);
      ("AddedDate", option_to_yojson date_to_yojson x.added_date);
      ("IsPrimaryRegion", option_to_yojson is_primary_region_to_yojson x.is_primary_region);
    ]

let describe_region_request_to_yojson (x : describe_region_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("RegionName", Some (region_name_to_yojson x.region_name));
    ]

let describe_trusted_token_issuer_response_to_yojson (x : describe_trusted_token_issuer_response) =
  assoc_to_yojson
    [
      ( "TrustedTokenIssuerArn",
        option_to_yojson trusted_token_issuer_arn_to_yojson x.trusted_token_issuer_arn );
      ("Name", option_to_yojson trusted_token_issuer_name_to_yojson x.name);
      ( "TrustedTokenIssuerType",
        option_to_yojson trusted_token_issuer_type_to_yojson x.trusted_token_issuer_type );
      ( "TrustedTokenIssuerConfiguration",
        option_to_yojson trusted_token_issuer_configuration_to_yojson
          x.trusted_token_issuer_configuration );
    ]

let describe_trusted_token_issuer_request_to_yojson (x : describe_trusted_token_issuer_request) =
  assoc_to_yojson
    [
      ("TrustedTokenIssuerArn", Some (trusted_token_issuer_arn_to_yojson x.trusted_token_issuer_arn));
    ]

let detach_customer_managed_policy_reference_from_permission_set_response_to_yojson = unit_to_yojson

let detach_customer_managed_policy_reference_from_permission_set_request_to_yojson
    (x : detach_customer_managed_policy_reference_from_permission_set_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ( "CustomerManagedPolicyReference",
        Some (customer_managed_policy_reference_to_yojson x.customer_managed_policy_reference) );
    ]

let detach_managed_policy_from_permission_set_response_to_yojson = unit_to_yojson

let detach_managed_policy_from_permission_set_request_to_yojson
    (x : detach_managed_policy_from_permission_set_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("ManagedPolicyArn", Some (managed_policy_arn_to_yojson x.managed_policy_arn));
    ]

let encryption_configuration_to_yojson (x : encryption_configuration) =
  assoc_to_yojson
    [
      ("KeyType", Some (kms_key_type_to_yojson x.key_type));
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
    ]

let scope_target_to_yojson = string_to_yojson
let scope_targets_to_yojson tree = list_to_yojson scope_target_to_yojson tree

let get_application_access_scope_response_to_yojson (x : get_application_access_scope_response) =
  assoc_to_yojson
    [
      ("Scope", Some (scope_to_yojson x.scope));
      ("AuthorizedTargets", option_to_yojson scope_targets_to_yojson x.authorized_targets);
    ]

let get_application_access_scope_request_to_yojson (x : get_application_access_scope_request) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ("Scope", Some (scope_to_yojson x.scope));
    ]

let get_application_assignment_configuration_response_to_yojson
    (x : get_application_assignment_configuration_response) =
  assoc_to_yojson
    [ ("AssignmentRequired", Some (assignment_required_to_yojson x.assignment_required)) ]

let get_application_assignment_configuration_request_to_yojson
    (x : get_application_assignment_configuration_request) =
  assoc_to_yojson [ ("ApplicationArn", Some (application_arn_to_yojson x.application_arn)) ]

let get_application_authentication_method_response_to_yojson
    (x : get_application_authentication_method_response) =
  assoc_to_yojson
    [
      ( "AuthenticationMethod",
        option_to_yojson authentication_method_to_yojson x.authentication_method );
    ]

let get_application_authentication_method_request_to_yojson
    (x : get_application_authentication_method_request) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ( "AuthenticationMethodType",
        Some (authentication_method_type_to_yojson x.authentication_method_type) );
    ]

let token_exchange_grant_to_yojson = unit_to_yojson
let refresh_token_grant_to_yojson = unit_to_yojson

let jwt_bearer_grant_to_yojson (x : jwt_bearer_grant) =
  assoc_to_yojson
    [
      ( "AuthorizedTokenIssuers",
        option_to_yojson authorized_token_issuers_to_yojson x.authorized_token_issuers );
    ]

let grant_to_yojson (x : grant) =
  match x with
  | AuthorizationCode arg ->
      assoc_to_yojson [ ("AuthorizationCode", Some (authorization_code_grant_to_yojson arg)) ]
  | JwtBearer arg -> assoc_to_yojson [ ("JwtBearer", Some (jwt_bearer_grant_to_yojson arg)) ]
  | RefreshToken arg ->
      assoc_to_yojson [ ("RefreshToken", Some (refresh_token_grant_to_yojson arg)) ]
  | TokenExchange arg ->
      assoc_to_yojson [ ("TokenExchange", Some (token_exchange_grant_to_yojson arg)) ]

let get_application_grant_response_to_yojson (x : get_application_grant_response) =
  assoc_to_yojson [ ("Grant", Some (grant_to_yojson x.grant)) ]

let get_application_grant_request_to_yojson (x : get_application_grant_request) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ("GrantType", Some (grant_type_to_yojson x.grant_type));
    ]

let user_background_session_application_status_to_yojson
    (x : user_background_session_application_status) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let get_application_session_configuration_response_to_yojson
    (x : get_application_session_configuration_response) =
  assoc_to_yojson
    [
      ( "UserBackgroundSessionApplicationStatus",
        option_to_yojson user_background_session_application_status_to_yojson
          x.user_background_session_application_status );
    ]

let get_application_session_configuration_request_to_yojson
    (x : get_application_session_configuration_request) =
  assoc_to_yojson [ ("ApplicationArn", Some (application_arn_to_yojson x.application_arn)) ]

let permission_set_policy_document_to_yojson = string_to_yojson

let get_inline_policy_for_permission_set_response_to_yojson
    (x : get_inline_policy_for_permission_set_response) =
  assoc_to_yojson
    [ ("InlinePolicy", option_to_yojson permission_set_policy_document_to_yojson x.inline_policy) ]

let get_inline_policy_for_permission_set_request_to_yojson
    (x : get_inline_policy_for_permission_set_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
    ]

let permissions_boundary_to_yojson (x : permissions_boundary) =
  assoc_to_yojson
    [
      ( "CustomerManagedPolicyReference",
        option_to_yojson customer_managed_policy_reference_to_yojson
          x.customer_managed_policy_reference );
      ("ManagedPolicyArn", option_to_yojson managed_policy_arn_to_yojson x.managed_policy_arn);
    ]

let get_permissions_boundary_for_permission_set_response_to_yojson
    (x : get_permissions_boundary_for_permission_set_response) =
  assoc_to_yojson
    [
      ("PermissionsBoundary", option_to_yojson permissions_boundary_to_yojson x.permissions_boundary);
    ]

let get_permissions_boundary_for_permission_set_request_to_yojson
    (x : get_permissions_boundary_for_permission_set_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
    ]

let grant_item_to_yojson (x : grant_item) =
  assoc_to_yojson
    [
      ("GrantType", Some (grant_type_to_yojson x.grant_type));
      ("Grant", Some (grant_to_yojson x.grant));
    ]

let grants_to_yojson tree = list_to_yojson grant_item_to_yojson tree

let region_metadata_to_yojson (x : region_metadata) =
  assoc_to_yojson
    [
      ("RegionName", option_to_yojson region_name_to_yojson x.region_name);
      ("Status", option_to_yojson region_status_to_yojson x.status);
      ("AddedDate", option_to_yojson date_to_yojson x.added_date);
      ("IsPrimaryRegion", option_to_yojson is_primary_region_to_yojson x.is_primary_region);
    ]

let region_metadata_list_to_yojson tree = list_to_yojson region_metadata_to_yojson tree

let instance_metadata_to_yojson (x : instance_metadata) =
  assoc_to_yojson
    [
      ("InstanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
      ("IdentityStoreId", option_to_yojson id_to_yojson x.identity_store_id);
      ("OwnerAccountId", option_to_yojson account_id_to_yojson x.owner_account_id);
      ("Name", option_to_yojson name_type_to_yojson x.name);
      ("CreatedDate", option_to_yojson date_to_yojson x.created_date);
      ("Status", option_to_yojson instance_status_to_yojson x.status);
      ("StatusReason", option_to_yojson reason_to_yojson x.status_reason);
      ("PrimaryRegion", option_to_yojson region_name_to_yojson x.primary_region);
      ("Regions", option_to_yojson region_metadata_list_to_yojson x.regions);
    ]

let instance_list_to_yojson tree = list_to_yojson instance_metadata_to_yojson tree
let token_to_yojson = string_to_yojson

let list_account_assignment_creation_status_response_to_yojson
    (x : list_account_assignment_creation_status_response) =
  assoc_to_yojson
    [
      ( "AccountAssignmentsCreationStatus",
        option_to_yojson account_assignment_operation_status_list_to_yojson
          x.account_assignments_creation_status );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let operation_status_filter_to_yojson (x : operation_status_filter) =
  assoc_to_yojson [ ("Status", option_to_yojson status_values_to_yojson x.status) ]

let max_results_to_yojson = int_to_yojson

let list_account_assignment_creation_status_request_to_yojson
    (x : list_account_assignment_creation_status_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Filter", option_to_yojson operation_status_filter_to_yojson x.filter);
    ]

let list_account_assignment_deletion_status_response_to_yojson
    (x : list_account_assignment_deletion_status_response) =
  assoc_to_yojson
    [
      ( "AccountAssignmentsDeletionStatus",
        option_to_yojson account_assignment_operation_status_list_to_yojson
          x.account_assignments_deletion_status );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_account_assignment_deletion_status_request_to_yojson
    (x : list_account_assignment_deletion_status_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Filter", option_to_yojson operation_status_filter_to_yojson x.filter);
    ]

let list_account_assignments_response_to_yojson (x : list_account_assignments_response) =
  assoc_to_yojson
    [
      ( "AccountAssignments",
        option_to_yojson account_assignment_list_to_yojson x.account_assignments );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_account_assignments_request_to_yojson (x : list_account_assignments_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("AccountId", Some (target_id_to_yojson x.account_id));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_account_assignments_filter_to_yojson (x : list_account_assignments_filter) =
  assoc_to_yojson [ ("AccountId", option_to_yojson account_id_to_yojson x.account_id) ]

let list_account_assignments_for_principal_response_to_yojson
    (x : list_account_assignments_for_principal_response) =
  assoc_to_yojson
    [
      ( "AccountAssignments",
        option_to_yojson account_assignment_list_for_principal_to_yojson x.account_assignments );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_account_assignments_for_principal_request_to_yojson
    (x : list_account_assignments_for_principal_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("PrincipalId", Some (principal_id_to_yojson x.principal_id));
      ("PrincipalType", Some (principal_type_to_yojson x.principal_type));
      ("Filter", option_to_yojson list_account_assignments_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_accounts_for_provisioned_permission_set_response_to_yojson
    (x : list_accounts_for_provisioned_permission_set_response) =
  assoc_to_yojson
    [
      ("AccountIds", option_to_yojson account_list_to_yojson x.account_ids);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let provisioning_status_to_yojson (x : provisioning_status) =
  match x with
  | LATEST_PERMISSION_SET_PROVISIONED -> `String "LATEST_PERMISSION_SET_PROVISIONED"
  | LATEST_PERMISSION_SET_NOT_PROVISIONED -> `String "LATEST_PERMISSION_SET_NOT_PROVISIONED"

let list_accounts_for_provisioned_permission_set_request_to_yojson
    (x : list_accounts_for_provisioned_permission_set_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("ProvisioningStatus", option_to_yojson provisioning_status_to_yojson x.provisioning_status);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let scope_details_to_yojson (x : scope_details) =
  assoc_to_yojson
    [
      ("Scope", Some (scope_to_yojson x.scope));
      ("AuthorizedTargets", option_to_yojson scope_targets_to_yojson x.authorized_targets);
    ]

let scopes_to_yojson tree = list_to_yojson scope_details_to_yojson tree

let list_application_access_scopes_response_to_yojson (x : list_application_access_scopes_response)
    =
  assoc_to_yojson
    [
      ("Scopes", Some (scopes_to_yojson x.scopes));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_application_access_scopes_request_to_yojson (x : list_application_access_scopes_request) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_application_assignments_response_to_yojson (x : list_application_assignments_response) =
  assoc_to_yojson
    [
      ( "ApplicationAssignments",
        option_to_yojson application_assignments_list_to_yojson x.application_assignments );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_application_assignments_request_to_yojson (x : list_application_assignments_request) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_application_assignments_filter_to_yojson (x : list_application_assignments_filter) =
  assoc_to_yojson
    [ ("ApplicationArn", option_to_yojson application_arn_to_yojson x.application_arn) ]

let list_application_assignments_for_principal_response_to_yojson
    (x : list_application_assignments_for_principal_response) =
  assoc_to_yojson
    [
      ( "ApplicationAssignments",
        option_to_yojson application_assignment_list_for_principal_to_yojson
          x.application_assignments );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_application_assignments_for_principal_request_to_yojson
    (x : list_application_assignments_for_principal_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("PrincipalId", Some (principal_id_to_yojson x.principal_id));
      ("PrincipalType", Some (principal_type_to_yojson x.principal_type));
      ("Filter", option_to_yojson list_application_assignments_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_application_authentication_methods_response_to_yojson
    (x : list_application_authentication_methods_response) =
  assoc_to_yojson
    [
      ( "AuthenticationMethods",
        option_to_yojson authentication_methods_to_yojson x.authentication_methods );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_application_authentication_methods_request_to_yojson
    (x : list_application_authentication_methods_request) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_application_grants_response_to_yojson (x : list_application_grants_response) =
  assoc_to_yojson
    [
      ("Grants", Some (grants_to_yojson x.grants));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_application_grants_request_to_yojson (x : list_application_grants_request) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_application_providers_response_to_yojson (x : list_application_providers_response) =
  assoc_to_yojson
    [
      ( "ApplicationProviders",
        option_to_yojson application_provider_list_to_yojson x.application_providers );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_application_providers_request_to_yojson (x : list_application_providers_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_applications_response_to_yojson (x : list_applications_response) =
  assoc_to_yojson
    [
      ("Applications", option_to_yojson application_list_to_yojson x.applications);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_applications_filter_to_yojson (x : list_applications_filter) =
  assoc_to_yojson
    [
      ("ApplicationAccount", option_to_yojson account_id_to_yojson x.application_account);
      ( "ApplicationProvider",
        option_to_yojson application_provider_arn_to_yojson x.application_provider );
    ]

let list_applications_request_to_yojson (x : list_applications_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Filter", option_to_yojson list_applications_filter_to_yojson x.filter);
    ]

let list_customer_managed_policy_references_in_permission_set_response_to_yojson
    (x : list_customer_managed_policy_references_in_permission_set_response) =
  assoc_to_yojson
    [
      ( "CustomerManagedPolicyReferences",
        option_to_yojson customer_managed_policy_reference_list_to_yojson
          x.customer_managed_policy_references );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_customer_managed_policy_references_in_permission_set_request_to_yojson
    (x : list_customer_managed_policy_references_in_permission_set_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_instances_response_to_yojson (x : list_instances_response) =
  assoc_to_yojson
    [
      ("Instances", option_to_yojson instance_list_to_yojson x.instances);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_instances_request_to_yojson (x : list_instances_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_managed_policies_in_permission_set_response_to_yojson
    (x : list_managed_policies_in_permission_set_response) =
  assoc_to_yojson
    [
      ( "AttachedManagedPolicies",
        option_to_yojson attached_managed_policy_list_to_yojson x.attached_managed_policies );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_managed_policies_in_permission_set_request_to_yojson
    (x : list_managed_policies_in_permission_set_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let permission_set_provisioning_status_metadata_to_yojson
    (x : permission_set_provisioning_status_metadata) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson status_values_to_yojson x.status);
      ("RequestId", option_to_yojson uu_id_to_yojson x.request_id);
      ("CreatedDate", option_to_yojson date_to_yojson x.created_date);
    ]

let permission_set_provisioning_status_list_to_yojson tree =
  list_to_yojson permission_set_provisioning_status_metadata_to_yojson tree

let list_permission_set_provisioning_status_response_to_yojson
    (x : list_permission_set_provisioning_status_response) =
  assoc_to_yojson
    [
      ( "PermissionSetsProvisioningStatus",
        option_to_yojson permission_set_provisioning_status_list_to_yojson
          x.permission_sets_provisioning_status );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_permission_set_provisioning_status_request_to_yojson
    (x : list_permission_set_provisioning_status_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Filter", option_to_yojson operation_status_filter_to_yojson x.filter);
    ]

let permission_set_list_to_yojson tree = list_to_yojson permission_set_arn_to_yojson tree

let list_permission_sets_response_to_yojson (x : list_permission_sets_response) =
  assoc_to_yojson
    [
      ("PermissionSets", option_to_yojson permission_set_list_to_yojson x.permission_sets);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_permission_sets_request_to_yojson (x : list_permission_sets_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_permission_sets_provisioned_to_account_response_to_yojson
    (x : list_permission_sets_provisioned_to_account_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("PermissionSets", option_to_yojson permission_set_list_to_yojson x.permission_sets);
    ]

let list_permission_sets_provisioned_to_account_request_to_yojson
    (x : list_permission_sets_provisioned_to_account_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("ProvisioningStatus", option_to_yojson provisioning_status_to_yojson x.provisioning_status);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_regions_response_to_yojson (x : list_regions_response) =
  assoc_to_yojson
    [
      ("Regions", option_to_yojson region_metadata_list_to_yojson x.regions);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_regions_request_to_yojson (x : list_regions_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let taggable_resource_arn_to_yojson = string_to_yojson

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("InstanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let trusted_token_issuer_metadata_to_yojson (x : trusted_token_issuer_metadata) =
  assoc_to_yojson
    [
      ( "TrustedTokenIssuerArn",
        option_to_yojson trusted_token_issuer_arn_to_yojson x.trusted_token_issuer_arn );
      ("Name", option_to_yojson trusted_token_issuer_name_to_yojson x.name);
      ( "TrustedTokenIssuerType",
        option_to_yojson trusted_token_issuer_type_to_yojson x.trusted_token_issuer_type );
    ]

let trusted_token_issuer_list_to_yojson tree =
  list_to_yojson trusted_token_issuer_metadata_to_yojson tree

let list_trusted_token_issuers_response_to_yojson (x : list_trusted_token_issuers_response) =
  assoc_to_yojson
    [
      ( "TrustedTokenIssuers",
        option_to_yojson trusted_token_issuer_list_to_yojson x.trusted_token_issuers );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_trusted_token_issuers_request_to_yojson (x : list_trusted_token_issuers_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let oidc_jwt_update_configuration_to_yojson (x : oidc_jwt_update_configuration) =
  assoc_to_yojson
    [
      ("ClaimAttributePath", option_to_yojson claim_attribute_path_to_yojson x.claim_attribute_path);
      ( "IdentityStoreAttributePath",
        option_to_yojson jmes_path_to_yojson x.identity_store_attribute_path );
      ( "JwksRetrievalOption",
        option_to_yojson jwks_retrieval_option_to_yojson x.jwks_retrieval_option );
    ]

let provision_permission_set_response_to_yojson (x : provision_permission_set_response) =
  assoc_to_yojson
    [
      ( "PermissionSetProvisioningStatus",
        option_to_yojson permission_set_provisioning_status_to_yojson
          x.permission_set_provisioning_status );
    ]

let provision_target_type_to_yojson (x : provision_target_type) =
  match x with
  | AWS_ACCOUNT -> `String "AWS_ACCOUNT"
  | ALL_PROVISIONED_ACCOUNTS -> `String "ALL_PROVISIONED_ACCOUNTS"

let provision_permission_set_request_to_yojson (x : provision_permission_set_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("TargetId", option_to_yojson target_id_to_yojson x.target_id);
      ("TargetType", Some (provision_target_type_to_yojson x.target_type));
    ]

let put_application_access_scope_request_to_yojson (x : put_application_access_scope_request) =
  assoc_to_yojson
    [
      ("Scope", Some (scope_to_yojson x.scope));
      ("AuthorizedTargets", option_to_yojson scope_targets_to_yojson x.authorized_targets);
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

let put_application_assignment_configuration_response_to_yojson = unit_to_yojson

let put_application_assignment_configuration_request_to_yojson
    (x : put_application_assignment_configuration_request) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ("AssignmentRequired", Some (assignment_required_to_yojson x.assignment_required));
    ]

let put_application_authentication_method_request_to_yojson
    (x : put_application_authentication_method_request) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ( "AuthenticationMethodType",
        Some (authentication_method_type_to_yojson x.authentication_method_type) );
      ("AuthenticationMethod", Some (authentication_method_to_yojson x.authentication_method));
    ]

let put_application_grant_request_to_yojson (x : put_application_grant_request) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ("GrantType", Some (grant_type_to_yojson x.grant_type));
      ("Grant", Some (grant_to_yojson x.grant));
    ]

let put_application_session_configuration_response_to_yojson = unit_to_yojson

let put_application_session_configuration_request_to_yojson
    (x : put_application_session_configuration_request) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ( "UserBackgroundSessionApplicationStatus",
        option_to_yojson user_background_session_application_status_to_yojson
          x.user_background_session_application_status );
    ]

let put_inline_policy_to_permission_set_response_to_yojson = unit_to_yojson

let put_inline_policy_to_permission_set_request_to_yojson
    (x : put_inline_policy_to_permission_set_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("InlinePolicy", Some (permission_set_policy_document_to_yojson x.inline_policy));
    ]

let put_permissions_boundary_to_permission_set_response_to_yojson = unit_to_yojson

let put_permissions_boundary_to_permission_set_request_to_yojson
    (x : put_permissions_boundary_to_permission_set_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("PermissionsBoundary", Some (permissions_boundary_to_yojson x.permissions_boundary));
    ]

let remove_region_response_to_yojson (x : remove_region_response) =
  assoc_to_yojson [ ("Status", option_to_yojson region_status_to_yojson x.status) ]

let remove_region_request_to_yojson (x : remove_region_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("RegionName", Some (region_name_to_yojson x.region_name));
    ]

let update_trusted_token_issuer_response_to_yojson = unit_to_yojson

let trusted_token_issuer_update_configuration_to_yojson
    (x : trusted_token_issuer_update_configuration) =
  match x with
  | OidcJwtConfiguration arg ->
      assoc_to_yojson
        [ ("OidcJwtConfiguration", Some (oidc_jwt_update_configuration_to_yojson arg)) ]

let update_trusted_token_issuer_request_to_yojson (x : update_trusted_token_issuer_request) =
  assoc_to_yojson
    [
      ("TrustedTokenIssuerArn", Some (trusted_token_issuer_arn_to_yojson x.trusted_token_issuer_arn));
      ("Name", option_to_yojson trusted_token_issuer_name_to_yojson x.name);
      ( "TrustedTokenIssuerConfiguration",
        option_to_yojson trusted_token_issuer_update_configuration_to_yojson
          x.trusted_token_issuer_configuration );
    ]

let update_permission_set_response_to_yojson = unit_to_yojson

let update_permission_set_request_to_yojson (x : update_permission_set_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("Description", option_to_yojson permission_set_description_to_yojson x.description);
      ("SessionDuration", option_to_yojson duration_to_yojson x.session_duration);
      ("RelayState", option_to_yojson relay_state_to_yojson x.relay_state);
    ]

let update_instance_access_control_attribute_configuration_response_to_yojson = unit_to_yojson

let update_instance_access_control_attribute_configuration_request_to_yojson
    (x : update_instance_access_control_attribute_configuration_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ( "InstanceAccessControlAttributeConfiguration",
        Some
          (instance_access_control_attribute_configuration_to_yojson
             x.instance_access_control_attribute_configuration) );
    ]

let update_instance_response_to_yojson = unit_to_yojson

let update_instance_request_to_yojson (x : update_instance_request) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_type_to_yojson x.name);
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
    ]

let update_application_response_to_yojson = unit_to_yojson

let update_application_portal_options_to_yojson (x : update_application_portal_options) =
  assoc_to_yojson
    [ ("SignInOptions", option_to_yojson sign_in_options_to_yojson x.sign_in_options) ]

let update_application_request_to_yojson (x : update_application_request) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ("Name", option_to_yojson application_name_type_to_yojson x.name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Status", option_to_yojson application_status_to_yojson x.status);
      ( "PortalOptions",
        option_to_yojson update_application_portal_options_to_yojson x.portal_options );
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("InstanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("InstanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]
