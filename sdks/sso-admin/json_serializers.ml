open Smaws_Lib.Json.SerializeHelpers
open Types

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | KMS_DISABLED_EXCEPTION -> `String "KMS_DisabledException"
  | KMS_INVALID_STATE_EXCEPTION -> `String "KMS_InvalidStateException"
  | KMS_INVALID_KEY_USAGE_EXCEPTION -> `String "KMS_InvalidKeyUsageException"

let validation_exception_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("Message", option_to_yojson validation_exception_message_to_yojson x.message);
    ]

let user_background_session_application_status_to_yojson
    (x : user_background_session_application_status) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let update_trusted_token_issuer_response_to_yojson = unit_to_yojson
let trusted_token_issuer_arn_to_yojson = string_to_yojson
let trusted_token_issuer_name_to_yojson = string_to_yojson
let claim_attribute_path_to_yojson = string_to_yojson
let jmes_path_to_yojson = string_to_yojson

let jwks_retrieval_option_to_yojson (x : jwks_retrieval_option) =
  match x with OPEN_ID_DISCOVERY -> `String "OPEN_ID_DISCOVERY"

let oidc_jwt_update_configuration_to_yojson (x : oidc_jwt_update_configuration) =
  assoc_to_yojson
    [
      ( "JwksRetrievalOption",
        option_to_yojson jwks_retrieval_option_to_yojson x.jwks_retrieval_option );
      ( "IdentityStoreAttributePath",
        option_to_yojson jmes_path_to_yojson x.identity_store_attribute_path );
      ("ClaimAttributePath", option_to_yojson claim_attribute_path_to_yojson x.claim_attribute_path);
    ]

let trusted_token_issuer_update_configuration_to_yojson
    (x : trusted_token_issuer_update_configuration) =
  match x with
  | OidcJwtConfiguration arg ->
      assoc_to_yojson
        [ ("OidcJwtConfiguration", Some (oidc_jwt_update_configuration_to_yojson arg)) ]

let update_trusted_token_issuer_request_to_yojson (x : update_trusted_token_issuer_request) =
  assoc_to_yojson
    [
      ( "TrustedTokenIssuerConfiguration",
        option_to_yojson trusted_token_issuer_update_configuration_to_yojson
          x.trusted_token_issuer_configuration );
      ("Name", option_to_yojson trusted_token_issuer_name_to_yojson x.name);
      ("TrustedTokenIssuerArn", Some (trusted_token_issuer_arn_to_yojson x.trusted_token_issuer_arn));
    ]

let throttling_exception_message_to_yojson = string_to_yojson

let throttling_exception_reason_to_yojson (x : throttling_exception_reason) =
  match x with KMS_THROTTLING_EXCEPTION -> `String "KMS_ThrottlingException"

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson throttling_exception_reason_to_yojson x.reason);
      ("Message", option_to_yojson throttling_exception_message_to_yojson x.message);
    ]

let resource_not_found_message_to_yojson = string_to_yojson

let resource_not_found_exception_reason_to_yojson (x : resource_not_found_exception_reason) =
  match x with KMS_NOT_FOUND_EXCEPTION -> `String "KMS_NotFoundException"

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson resource_not_found_exception_reason_to_yojson x.reason);
      ("Message", option_to_yojson resource_not_found_message_to_yojson x.message);
    ]

let internal_failure_message_to_yojson = string_to_yojson

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson internal_failure_message_to_yojson x.message) ]

let conflict_exception_message_to_yojson = string_to_yojson

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson conflict_exception_message_to_yojson x.message) ]

let access_denied_exception_message_to_yojson = string_to_yojson

let access_denied_exception_reason_to_yojson (x : access_denied_exception_reason) =
  match x with KMS_ACCESS_DENIED_EXCEPTION -> `String "KMS_AccessDeniedException"

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson access_denied_exception_reason_to_yojson x.reason);
      ("Message", option_to_yojson access_denied_exception_message_to_yojson x.message);
    ]

let update_permission_set_response_to_yojson = unit_to_yojson
let instance_arn_to_yojson = string_to_yojson
let permission_set_arn_to_yojson = string_to_yojson
let permission_set_description_to_yojson = string_to_yojson
let duration_to_yojson = string_to_yojson
let relay_state_to_yojson = string_to_yojson

let update_permission_set_request_to_yojson (x : update_permission_set_request) =
  assoc_to_yojson
    [
      ("RelayState", option_to_yojson relay_state_to_yojson x.relay_state);
      ("SessionDuration", option_to_yojson duration_to_yojson x.session_duration);
      ("Description", option_to_yojson permission_set_description_to_yojson x.description);
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let update_instance_response_to_yojson = unit_to_yojson
let name_type_to_yojson = string_to_yojson

let kms_key_type_to_yojson (x : kms_key_type) =
  match x with
  | CUSTOMER_MANAGED_KEY -> `String "CUSTOMER_MANAGED_KEY"
  | AWS_OWNED_KMS_KEY -> `String "AWS_OWNED_KMS_KEY"

let kms_key_arn_to_yojson = string_to_yojson

let encryption_configuration_to_yojson (x : encryption_configuration) =
  assoc_to_yojson
    [
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("KeyType", Some (kms_key_type_to_yojson x.key_type));
    ]

let update_instance_request_to_yojson (x : update_instance_request) =
  assoc_to_yojson
    [
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("Name", option_to_yojson name_type_to_yojson x.name);
    ]

let update_instance_access_control_attribute_configuration_response_to_yojson = unit_to_yojson
let access_control_attribute_key_to_yojson = string_to_yojson
let access_control_attribute_value_source_to_yojson = string_to_yojson

let access_control_attribute_value_source_list_to_yojson tree =
  list_to_yojson access_control_attribute_value_source_to_yojson tree

let access_control_attribute_value_to_yojson (x : access_control_attribute_value) =
  assoc_to_yojson
    [ ("Source", Some (access_control_attribute_value_source_list_to_yojson x.source)) ]

let access_control_attribute_to_yojson (x : access_control_attribute) =
  assoc_to_yojson
    [
      ("Value", Some (access_control_attribute_value_to_yojson x.value));
      ("Key", Some (access_control_attribute_key_to_yojson x.key));
    ]

let access_control_attribute_list_to_yojson tree =
  list_to_yojson access_control_attribute_to_yojson tree

let instance_access_control_attribute_configuration_to_yojson
    (x : instance_access_control_attribute_configuration) =
  assoc_to_yojson
    [
      ( "AccessControlAttributes",
        Some (access_control_attribute_list_to_yojson x.access_control_attributes) );
    ]

let update_instance_access_control_attribute_configuration_request_to_yojson
    (x : update_instance_access_control_attribute_configuration_request) =
  assoc_to_yojson
    [
      ( "InstanceAccessControlAttributeConfiguration",
        Some
          (instance_access_control_attribute_configuration_to_yojson
             x.instance_access_control_attribute_configuration) );
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let update_application_response_to_yojson = unit_to_yojson
let application_arn_to_yojson = string_to_yojson
let application_name_type_to_yojson = string_to_yojson
let description_to_yojson = string_to_yojson

let application_status_to_yojson (x : application_status) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let sign_in_origin_to_yojson (x : sign_in_origin) =
  match x with APPLICATION -> `String "APPLICATION" | IDENTITY_CENTER -> `String "IDENTITY_CENTER"

let application_url_to_yojson = string_to_yojson

let sign_in_options_to_yojson (x : sign_in_options) =
  assoc_to_yojson
    [
      ("ApplicationUrl", option_to_yojson application_url_to_yojson x.application_url);
      ("Origin", Some (sign_in_origin_to_yojson x.origin));
    ]

let update_application_portal_options_to_yojson (x : update_application_portal_options) =
  assoc_to_yojson
    [ ("SignInOptions", option_to_yojson sign_in_options_to_yojson x.sign_in_options) ]

let update_application_request_to_yojson (x : update_application_request) =
  assoc_to_yojson
    [
      ( "PortalOptions",
        option_to_yojson update_application_portal_options_to_yojson x.portal_options );
      ("Status", option_to_yojson application_status_to_yojson x.status);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Name", option_to_yojson application_name_type_to_yojson x.name);
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let taggable_resource_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("InstanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
    ]

let uu_id_to_yojson = string_to_yojson
let ur_i_to_yojson = string_to_yojson
let trusted_token_issuer_url_to_yojson = string_to_yojson

let trusted_token_issuer_type_to_yojson (x : trusted_token_issuer_type) =
  match x with OIDC_JWT -> `String "OIDC_JWT"

let trusted_token_issuer_metadata_to_yojson (x : trusted_token_issuer_metadata) =
  assoc_to_yojson
    [
      ( "TrustedTokenIssuerType",
        option_to_yojson trusted_token_issuer_type_to_yojson x.trusted_token_issuer_type );
      ("Name", option_to_yojson trusted_token_issuer_name_to_yojson x.name);
      ( "TrustedTokenIssuerArn",
        option_to_yojson trusted_token_issuer_arn_to_yojson x.trusted_token_issuer_arn );
    ]

let trusted_token_issuer_list_to_yojson tree =
  list_to_yojson trusted_token_issuer_metadata_to_yojson tree

let oidc_jwt_configuration_to_yojson (x : oidc_jwt_configuration) =
  assoc_to_yojson
    [
      ("JwksRetrievalOption", Some (jwks_retrieval_option_to_yojson x.jwks_retrieval_option));
      ("IdentityStoreAttributePath", Some (jmes_path_to_yojson x.identity_store_attribute_path));
      ("ClaimAttributePath", Some (claim_attribute_path_to_yojson x.claim_attribute_path));
      ("IssuerUrl", Some (trusted_token_issuer_url_to_yojson x.issuer_url));
    ]

let trusted_token_issuer_configuration_to_yojson (x : trusted_token_issuer_configuration) =
  match x with
  | OidcJwtConfiguration arg ->
      assoc_to_yojson [ ("OidcJwtConfiguration", Some (oidc_jwt_configuration_to_yojson arg)) ]

let token_issuer_audience_to_yojson = string_to_yojson
let token_issuer_audiences_to_yojson tree = list_to_yojson token_issuer_audience_to_yojson tree
let token_exchange_grant_to_yojson = unit_to_yojson
let token_to_yojson = string_to_yojson
let target_type_to_yojson (x : target_type) = match x with AWS_ACCOUNT -> `String "AWS_ACCOUNT"
let target_id_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("InstanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
    ]

let service_quota_exceeded_message_to_yojson = string_to_yojson

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [ ("Message", option_to_yojson service_quota_exceeded_message_to_yojson x.message) ]

let status_values_to_yojson (x : status_values) =
  match x with
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let scope_to_yojson = string_to_yojson
let scope_target_to_yojson = string_to_yojson
let scope_targets_to_yojson tree = list_to_yojson scope_target_to_yojson tree

let scope_details_to_yojson (x : scope_details) =
  assoc_to_yojson
    [
      ("AuthorizedTargets", option_to_yojson scope_targets_to_yojson x.authorized_targets);
      ("Scope", Some (scope_to_yojson x.scope));
    ]

let scopes_to_yojson tree = list_to_yojson scope_details_to_yojson tree

let region_status_to_yojson (x : region_status) =
  match x with
  | REMOVING -> `String "REMOVING"
  | ADDING -> `String "ADDING"
  | ACTIVE -> `String "ACTIVE"

let remove_region_response_to_yojson (x : remove_region_response) =
  assoc_to_yojson [ ("Status", option_to_yojson region_status_to_yojson x.status) ]

let region_name_to_yojson = string_to_yojson

let remove_region_request_to_yojson (x : remove_region_request) =
  assoc_to_yojson
    [
      ("RegionName", Some (region_name_to_yojson x.region_name));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let put_permissions_boundary_to_permission_set_response_to_yojson = unit_to_yojson
let managed_policy_name_to_yojson = string_to_yojson
let managed_policy_path_to_yojson = string_to_yojson

let customer_managed_policy_reference_to_yojson (x : customer_managed_policy_reference) =
  assoc_to_yojson
    [
      ("Path", option_to_yojson managed_policy_path_to_yojson x.path);
      ("Name", Some (managed_policy_name_to_yojson x.name));
    ]

let managed_policy_arn_to_yojson = string_to_yojson

let permissions_boundary_to_yojson (x : permissions_boundary) =
  assoc_to_yojson
    [
      ("ManagedPolicyArn", option_to_yojson managed_policy_arn_to_yojson x.managed_policy_arn);
      ( "CustomerManagedPolicyReference",
        option_to_yojson customer_managed_policy_reference_to_yojson
          x.customer_managed_policy_reference );
    ]

let put_permissions_boundary_to_permission_set_request_to_yojson
    (x : put_permissions_boundary_to_permission_set_request) =
  assoc_to_yojson
    [
      ("PermissionsBoundary", Some (permissions_boundary_to_yojson x.permissions_boundary));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let put_inline_policy_to_permission_set_response_to_yojson = unit_to_yojson
let permission_set_policy_document_to_yojson = string_to_yojson

let put_inline_policy_to_permission_set_request_to_yojson
    (x : put_inline_policy_to_permission_set_request) =
  assoc_to_yojson
    [
      ("InlinePolicy", Some (permission_set_policy_document_to_yojson x.inline_policy));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let put_application_session_configuration_response_to_yojson = unit_to_yojson

let put_application_session_configuration_request_to_yojson
    (x : put_application_session_configuration_request) =
  assoc_to_yojson
    [
      ( "UserBackgroundSessionApplicationStatus",
        option_to_yojson user_background_session_application_status_to_yojson
          x.user_background_session_application_status );
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

let put_application_assignment_configuration_response_to_yojson = unit_to_yojson
let assignment_required_to_yojson = bool_to_yojson

let put_application_assignment_configuration_request_to_yojson
    (x : put_application_assignment_configuration_request) =
  assoc_to_yojson
    [
      ("AssignmentRequired", Some (assignment_required_to_yojson x.assignment_required));
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

let account_id_to_yojson = string_to_yojson
let reason_to_yojson = string_to_yojson
let date_to_yojson = timestamp_epoch_seconds_to_yojson

let permission_set_provisioning_status_to_yojson (x : permission_set_provisioning_status) =
  assoc_to_yojson
    [
      ("CreatedDate", option_to_yojson date_to_yojson x.created_date);
      ("FailureReason", option_to_yojson reason_to_yojson x.failure_reason);
      ("PermissionSetArn", option_to_yojson permission_set_arn_to_yojson x.permission_set_arn);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("RequestId", option_to_yojson uu_id_to_yojson x.request_id);
      ("Status", option_to_yojson status_values_to_yojson x.status);
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
  | ALL_PROVISIONED_ACCOUNTS -> `String "ALL_PROVISIONED_ACCOUNTS"
  | AWS_ACCOUNT -> `String "AWS_ACCOUNT"

let provision_permission_set_request_to_yojson (x : provision_permission_set_request) =
  assoc_to_yojson
    [
      ("TargetType", Some (provision_target_type_to_yojson x.target_type));
      ("TargetId", option_to_yojson target_id_to_yojson x.target_id);
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let list_trusted_token_issuers_response_to_yojson (x : list_trusted_token_issuers_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "TrustedTokenIssuers",
        option_to_yojson trusted_token_issuer_list_to_yojson x.trusted_token_issuers );
    ]

let max_results_to_yojson = int_to_yojson

let list_trusted_token_issuers_request_to_yojson (x : list_trusted_token_issuers_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("InstanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
    ]

let is_primary_region_to_yojson = bool_to_yojson

let region_metadata_to_yojson (x : region_metadata) =
  assoc_to_yojson
    [
      ("IsPrimaryRegion", option_to_yojson is_primary_region_to_yojson x.is_primary_region);
      ("AddedDate", option_to_yojson date_to_yojson x.added_date);
      ("Status", option_to_yojson region_status_to_yojson x.status);
      ("RegionName", option_to_yojson region_name_to_yojson x.region_name);
    ]

let region_metadata_list_to_yojson tree = list_to_yojson region_metadata_to_yojson tree

let list_regions_response_to_yojson (x : list_regions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Regions", option_to_yojson region_metadata_list_to_yojson x.regions);
    ]

let list_regions_request_to_yojson (x : list_regions_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let permission_set_list_to_yojson tree = list_to_yojson permission_set_arn_to_yojson tree

let list_permission_sets_provisioned_to_account_response_to_yojson
    (x : list_permission_sets_provisioned_to_account_response) =
  assoc_to_yojson
    [
      ("PermissionSets", option_to_yojson permission_set_list_to_yojson x.permission_sets);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let provisioning_status_to_yojson (x : provisioning_status) =
  match x with
  | LATEST_PERMISSION_SET_NOT_PROVISIONED -> `String "LATEST_PERMISSION_SET_NOT_PROVISIONED"
  | LATEST_PERMISSION_SET_PROVISIONED -> `String "LATEST_PERMISSION_SET_PROVISIONED"

let list_permission_sets_provisioned_to_account_request_to_yojson
    (x : list_permission_sets_provisioned_to_account_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ProvisioningStatus", option_to_yojson provisioning_status_to_yojson x.provisioning_status);
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let list_permission_sets_response_to_yojson (x : list_permission_sets_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("PermissionSets", option_to_yojson permission_set_list_to_yojson x.permission_sets);
    ]

let list_permission_sets_request_to_yojson (x : list_permission_sets_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let permission_set_provisioning_status_metadata_to_yojson
    (x : permission_set_provisioning_status_metadata) =
  assoc_to_yojson
    [
      ("CreatedDate", option_to_yojson date_to_yojson x.created_date);
      ("RequestId", option_to_yojson uu_id_to_yojson x.request_id);
      ("Status", option_to_yojson status_values_to_yojson x.status);
    ]

let permission_set_provisioning_status_list_to_yojson tree =
  list_to_yojson permission_set_provisioning_status_metadata_to_yojson tree

let list_permission_set_provisioning_status_response_to_yojson
    (x : list_permission_set_provisioning_status_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "PermissionSetsProvisioningStatus",
        option_to_yojson permission_set_provisioning_status_list_to_yojson
          x.permission_sets_provisioning_status );
    ]

let operation_status_filter_to_yojson (x : operation_status_filter) =
  assoc_to_yojson [ ("Status", option_to_yojson status_values_to_yojson x.status) ]

let list_permission_set_provisioning_status_request_to_yojson
    (x : list_permission_set_provisioning_status_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson operation_status_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let name_to_yojson = string_to_yojson

let attached_managed_policy_to_yojson (x : attached_managed_policy) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson managed_policy_arn_to_yojson x.arn);
      ("Name", option_to_yojson name_to_yojson x.name);
    ]

let attached_managed_policy_list_to_yojson tree =
  list_to_yojson attached_managed_policy_to_yojson tree

let list_managed_policies_in_permission_set_response_to_yojson
    (x : list_managed_policies_in_permission_set_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "AttachedManagedPolicies",
        option_to_yojson attached_managed_policy_list_to_yojson x.attached_managed_policies );
    ]

let list_managed_policies_in_permission_set_request_to_yojson
    (x : list_managed_policies_in_permission_set_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let id_to_yojson = string_to_yojson

let instance_status_to_yojson (x : instance_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"

let instance_metadata_to_yojson (x : instance_metadata) =
  assoc_to_yojson
    [
      ("Regions", option_to_yojson region_metadata_list_to_yojson x.regions);
      ("PrimaryRegion", option_to_yojson region_name_to_yojson x.primary_region);
      ("StatusReason", option_to_yojson reason_to_yojson x.status_reason);
      ("Status", option_to_yojson instance_status_to_yojson x.status);
      ("CreatedDate", option_to_yojson date_to_yojson x.created_date);
      ("Name", option_to_yojson name_type_to_yojson x.name);
      ("OwnerAccountId", option_to_yojson account_id_to_yojson x.owner_account_id);
      ("IdentityStoreId", option_to_yojson id_to_yojson x.identity_store_id);
      ("InstanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
    ]

let instance_list_to_yojson tree = list_to_yojson instance_metadata_to_yojson tree

let list_instances_response_to_yojson (x : list_instances_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Instances", option_to_yojson instance_list_to_yojson x.instances);
    ]

let list_instances_request_to_yojson (x : list_instances_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let customer_managed_policy_reference_list_to_yojson tree =
  list_to_yojson customer_managed_policy_reference_to_yojson tree

let list_customer_managed_policy_references_in_permission_set_response_to_yojson
    (x : list_customer_managed_policy_references_in_permission_set_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "CustomerManagedPolicyReferences",
        option_to_yojson customer_managed_policy_reference_list_to_yojson
          x.customer_managed_policy_references );
    ]

let list_customer_managed_policy_references_in_permission_set_request_to_yojson
    (x : list_customer_managed_policy_references_in_permission_set_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let application_provider_arn_to_yojson = string_to_yojson
let identity_store_arn_to_yojson = string_to_yojson

let application_visibility_to_yojson (x : application_visibility) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let portal_options_to_yojson (x : portal_options) =
  assoc_to_yojson
    [
      ("Visibility", option_to_yojson application_visibility_to_yojson x.visibility);
      ("SignInOptions", option_to_yojson sign_in_options_to_yojson x.sign_in_options);
    ]

let application_to_yojson (x : application) =
  assoc_to_yojson
    [
      ("CreatedFrom", option_to_yojson region_name_to_yojson x.created_from);
      ("CreatedDate", option_to_yojson date_to_yojson x.created_date);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("PortalOptions", option_to_yojson portal_options_to_yojson x.portal_options);
      ("Status", option_to_yojson application_status_to_yojson x.status);
      ("IdentityStoreArn", option_to_yojson identity_store_arn_to_yojson x.identity_store_arn);
      ("InstanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
      ("ApplicationAccount", option_to_yojson account_id_to_yojson x.application_account);
      ("Name", option_to_yojson application_name_type_to_yojson x.name);
      ( "ApplicationProviderArn",
        option_to_yojson application_provider_arn_to_yojson x.application_provider_arn );
      ("ApplicationArn", option_to_yojson application_arn_to_yojson x.application_arn);
    ]

let application_list_to_yojson tree = list_to_yojson application_to_yojson tree

let list_applications_response_to_yojson (x : list_applications_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Applications", option_to_yojson application_list_to_yojson x.applications);
    ]

let list_applications_filter_to_yojson (x : list_applications_filter) =
  assoc_to_yojson
    [
      ( "ApplicationProvider",
        option_to_yojson application_provider_arn_to_yojson x.application_provider );
      ("ApplicationAccount", option_to_yojson account_id_to_yojson x.application_account);
    ]

let list_applications_request_to_yojson (x : list_applications_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson list_applications_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let federation_protocol_to_yojson (x : federation_protocol) =
  match x with OAUTH -> `String "OAUTH" | SAML -> `String "SAML"

let icon_url_to_yojson = string_to_yojson

let display_data_to_yojson (x : display_data) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson description_to_yojson x.description);
      ("IconUrl", option_to_yojson icon_url_to_yojson x.icon_url);
      ("DisplayName", option_to_yojson name_to_yojson x.display_name);
    ]

let resource_server_scope_details_to_yojson (x : resource_server_scope_details) =
  assoc_to_yojson
    [
      ("DetailedTitle", option_to_yojson description_to_yojson x.detailed_title);
      ("LongDescription", option_to_yojson description_to_yojson x.long_description);
    ]

let resource_server_scope_to_yojson = string_to_yojson

let resource_server_scopes_to_yojson tree =
  map_to_yojson resource_server_scope_to_yojson resource_server_scope_details_to_yojson tree

let resource_server_config_to_yojson (x : resource_server_config) =
  assoc_to_yojson [ ("Scopes", option_to_yojson resource_server_scopes_to_yojson x.scopes) ]

let application_provider_to_yojson (x : application_provider) =
  assoc_to_yojson
    [
      ( "ResourceServerConfig",
        option_to_yojson resource_server_config_to_yojson x.resource_server_config );
      ("DisplayData", option_to_yojson display_data_to_yojson x.display_data);
      ("FederationProtocol", option_to_yojson federation_protocol_to_yojson x.federation_protocol);
      ( "ApplicationProviderArn",
        Some (application_provider_arn_to_yojson x.application_provider_arn) );
    ]

let application_provider_list_to_yojson tree = list_to_yojson application_provider_to_yojson tree

let list_application_providers_response_to_yojson (x : list_application_providers_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "ApplicationProviders",
        option_to_yojson application_provider_list_to_yojson x.application_providers );
    ]

let list_application_providers_request_to_yojson (x : list_application_providers_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let principal_id_to_yojson = string_to_yojson

let principal_type_to_yojson (x : principal_type) =
  match x with GROUP -> `String "GROUP" | USER -> `String "USER"

let application_assignment_for_principal_to_yojson (x : application_assignment_for_principal) =
  assoc_to_yojson
    [
      ("PrincipalType", option_to_yojson principal_type_to_yojson x.principal_type);
      ("PrincipalId", option_to_yojson principal_id_to_yojson x.principal_id);
      ("ApplicationArn", option_to_yojson application_arn_to_yojson x.application_arn);
    ]

let application_assignment_list_for_principal_to_yojson tree =
  list_to_yojson application_assignment_for_principal_to_yojson tree

let list_application_assignments_for_principal_response_to_yojson
    (x : list_application_assignments_for_principal_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "ApplicationAssignments",
        option_to_yojson application_assignment_list_for_principal_to_yojson
          x.application_assignments );
    ]

let list_application_assignments_filter_to_yojson (x : list_application_assignments_filter) =
  assoc_to_yojson
    [ ("ApplicationArn", option_to_yojson application_arn_to_yojson x.application_arn) ]

let list_application_assignments_for_principal_request_to_yojson
    (x : list_application_assignments_for_principal_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Filter", option_to_yojson list_application_assignments_filter_to_yojson x.filter);
      ("PrincipalType", Some (principal_type_to_yojson x.principal_type));
      ("PrincipalId", Some (principal_id_to_yojson x.principal_id));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let application_assignment_to_yojson (x : application_assignment) =
  assoc_to_yojson
    [
      ("PrincipalType", Some (principal_type_to_yojson x.principal_type));
      ("PrincipalId", Some (principal_id_to_yojson x.principal_id));
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

let application_assignments_list_to_yojson tree =
  list_to_yojson application_assignment_to_yojson tree

let list_application_assignments_response_to_yojson (x : list_application_assignments_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "ApplicationAssignments",
        option_to_yojson application_assignments_list_to_yojson x.application_assignments );
    ]

let list_application_assignments_request_to_yojson (x : list_application_assignments_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

let account_list_to_yojson tree = list_to_yojson account_id_to_yojson tree

let list_accounts_for_provisioned_permission_set_response_to_yojson
    (x : list_accounts_for_provisioned_permission_set_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("AccountIds", option_to_yojson account_list_to_yojson x.account_ids);
    ]

let list_accounts_for_provisioned_permission_set_request_to_yojson
    (x : list_accounts_for_provisioned_permission_set_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ProvisioningStatus", option_to_yojson provisioning_status_to_yojson x.provisioning_status);
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let account_assignment_for_principal_to_yojson (x : account_assignment_for_principal) =
  assoc_to_yojson
    [
      ("PrincipalType", option_to_yojson principal_type_to_yojson x.principal_type);
      ("PrincipalId", option_to_yojson principal_id_to_yojson x.principal_id);
      ("PermissionSetArn", option_to_yojson permission_set_arn_to_yojson x.permission_set_arn);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let account_assignment_list_for_principal_to_yojson tree =
  list_to_yojson account_assignment_for_principal_to_yojson tree

let list_account_assignments_for_principal_response_to_yojson
    (x : list_account_assignments_for_principal_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "AccountAssignments",
        option_to_yojson account_assignment_list_for_principal_to_yojson x.account_assignments );
    ]

let list_account_assignments_filter_to_yojson (x : list_account_assignments_filter) =
  assoc_to_yojson [ ("AccountId", option_to_yojson account_id_to_yojson x.account_id) ]

let list_account_assignments_for_principal_request_to_yojson
    (x : list_account_assignments_for_principal_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Filter", option_to_yojson list_account_assignments_filter_to_yojson x.filter);
      ("PrincipalType", Some (principal_type_to_yojson x.principal_type));
      ("PrincipalId", Some (principal_id_to_yojson x.principal_id));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let account_assignment_to_yojson (x : account_assignment) =
  assoc_to_yojson
    [
      ("PrincipalId", option_to_yojson principal_id_to_yojson x.principal_id);
      ("PrincipalType", option_to_yojson principal_type_to_yojson x.principal_type);
      ("PermissionSetArn", option_to_yojson permission_set_arn_to_yojson x.permission_set_arn);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let account_assignment_list_to_yojson tree = list_to_yojson account_assignment_to_yojson tree

let list_account_assignments_response_to_yojson (x : list_account_assignments_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "AccountAssignments",
        option_to_yojson account_assignment_list_to_yojson x.account_assignments );
    ]

let list_account_assignments_request_to_yojson (x : list_account_assignments_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("AccountId", Some (target_id_to_yojson x.account_id));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let account_assignment_operation_status_metadata_to_yojson
    (x : account_assignment_operation_status_metadata) =
  assoc_to_yojson
    [
      ("CreatedDate", option_to_yojson date_to_yojson x.created_date);
      ("RequestId", option_to_yojson uu_id_to_yojson x.request_id);
      ("Status", option_to_yojson status_values_to_yojson x.status);
    ]

let account_assignment_operation_status_list_to_yojson tree =
  list_to_yojson account_assignment_operation_status_metadata_to_yojson tree

let list_account_assignment_deletion_status_response_to_yojson
    (x : list_account_assignment_deletion_status_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "AccountAssignmentsDeletionStatus",
        option_to_yojson account_assignment_operation_status_list_to_yojson
          x.account_assignments_deletion_status );
    ]

let list_account_assignment_deletion_status_request_to_yojson
    (x : list_account_assignment_deletion_status_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson operation_status_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let list_account_assignment_creation_status_response_to_yojson
    (x : list_account_assignment_creation_status_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "AccountAssignmentsCreationStatus",
        option_to_yojson account_assignment_operation_status_list_to_yojson
          x.account_assignments_creation_status );
    ]

let list_account_assignment_creation_status_request_to_yojson
    (x : list_account_assignment_creation_status_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson operation_status_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
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
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let get_inline_policy_for_permission_set_response_to_yojson
    (x : get_inline_policy_for_permission_set_response) =
  assoc_to_yojson
    [ ("InlinePolicy", option_to_yojson permission_set_policy_document_to_yojson x.inline_policy) ]

let get_inline_policy_for_permission_set_request_to_yojson
    (x : get_inline_policy_for_permission_set_request) =
  assoc_to_yojson
    [
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

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

let get_application_assignment_configuration_response_to_yojson
    (x : get_application_assignment_configuration_response) =
  assoc_to_yojson
    [ ("AssignmentRequired", Some (assignment_required_to_yojson x.assignment_required)) ]

let get_application_assignment_configuration_request_to_yojson
    (x : get_application_assignment_configuration_request) =
  assoc_to_yojson [ ("ApplicationArn", Some (application_arn_to_yojson x.application_arn)) ]

let detach_managed_policy_from_permission_set_response_to_yojson = unit_to_yojson

let detach_managed_policy_from_permission_set_request_to_yojson
    (x : detach_managed_policy_from_permission_set_request) =
  assoc_to_yojson
    [
      ("ManagedPolicyArn", Some (managed_policy_arn_to_yojson x.managed_policy_arn));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let detach_customer_managed_policy_reference_from_permission_set_response_to_yojson = unit_to_yojson

let detach_customer_managed_policy_reference_from_permission_set_request_to_yojson
    (x : detach_customer_managed_policy_reference_from_permission_set_request) =
  assoc_to_yojson
    [
      ( "CustomerManagedPolicyReference",
        Some (customer_managed_policy_reference_to_yojson x.customer_managed_policy_reference) );
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let describe_trusted_token_issuer_response_to_yojson (x : describe_trusted_token_issuer_response) =
  assoc_to_yojson
    [
      ( "TrustedTokenIssuerConfiguration",
        option_to_yojson trusted_token_issuer_configuration_to_yojson
          x.trusted_token_issuer_configuration );
      ( "TrustedTokenIssuerType",
        option_to_yojson trusted_token_issuer_type_to_yojson x.trusted_token_issuer_type );
      ("Name", option_to_yojson trusted_token_issuer_name_to_yojson x.name);
      ( "TrustedTokenIssuerArn",
        option_to_yojson trusted_token_issuer_arn_to_yojson x.trusted_token_issuer_arn );
    ]

let describe_trusted_token_issuer_request_to_yojson (x : describe_trusted_token_issuer_request) =
  assoc_to_yojson
    [
      ("TrustedTokenIssuerArn", Some (trusted_token_issuer_arn_to_yojson x.trusted_token_issuer_arn));
    ]

let describe_region_response_to_yojson (x : describe_region_response) =
  assoc_to_yojson
    [
      ("IsPrimaryRegion", option_to_yojson is_primary_region_to_yojson x.is_primary_region);
      ("AddedDate", option_to_yojson date_to_yojson x.added_date);
      ("Status", option_to_yojson region_status_to_yojson x.status);
      ("RegionName", option_to_yojson region_name_to_yojson x.region_name);
    ]

let describe_region_request_to_yojson (x : describe_region_request) =
  assoc_to_yojson
    [
      ("RegionName", Some (region_name_to_yojson x.region_name));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
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
      ( "ProvisionPermissionSetRequestId",
        Some (uu_id_to_yojson x.provision_permission_set_request_id) );
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let permission_set_name_to_yojson = string_to_yojson

let permission_set_to_yojson (x : permission_set) =
  assoc_to_yojson
    [
      ("RelayState", option_to_yojson relay_state_to_yojson x.relay_state);
      ("SessionDuration", option_to_yojson duration_to_yojson x.session_duration);
      ("CreatedDate", option_to_yojson date_to_yojson x.created_date);
      ("Description", option_to_yojson permission_set_description_to_yojson x.description);
      ("PermissionSetArn", option_to_yojson permission_set_arn_to_yojson x.permission_set_arn);
      ("Name", option_to_yojson permission_set_name_to_yojson x.name);
    ]

let describe_permission_set_response_to_yojson (x : describe_permission_set_response) =
  assoc_to_yojson [ ("PermissionSet", option_to_yojson permission_set_to_yojson x.permission_set) ]

let describe_permission_set_request_to_yojson (x : describe_permission_set_request) =
  assoc_to_yojson
    [
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let instance_access_control_attribute_configuration_status_to_yojson
    (x : instance_access_control_attribute_configuration_status) =
  match x with
  | CREATION_FAILED -> `String "CREATION_FAILED"
  | CREATION_IN_PROGRESS -> `String "CREATION_IN_PROGRESS"
  | ENABLED -> `String "ENABLED"

let instance_access_control_attribute_configuration_status_reason_to_yojson = string_to_yojson

let describe_instance_access_control_attribute_configuration_response_to_yojson
    (x : describe_instance_access_control_attribute_configuration_response) =
  assoc_to_yojson
    [
      ( "InstanceAccessControlAttributeConfiguration",
        option_to_yojson instance_access_control_attribute_configuration_to_yojson
          x.instance_access_control_attribute_configuration );
      ( "StatusReason",
        option_to_yojson instance_access_control_attribute_configuration_status_reason_to_yojson
          x.status_reason );
      ( "Status",
        option_to_yojson instance_access_control_attribute_configuration_status_to_yojson x.status
      );
    ]

let describe_instance_access_control_attribute_configuration_request_to_yojson
    (x : describe_instance_access_control_attribute_configuration_request) =
  assoc_to_yojson [ ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn)) ]

let kms_key_status_to_yojson (x : kms_key_status) =
  match x with
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | ENABLED -> `String "ENABLED"
  | UPDATING -> `String "UPDATING"

let encryption_configuration_details_to_yojson (x : encryption_configuration_details) =
  assoc_to_yojson
    [
      ("EncryptionStatusReason", option_to_yojson reason_to_yojson x.encryption_status_reason);
      ("EncryptionStatus", option_to_yojson kms_key_status_to_yojson x.encryption_status);
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("KeyType", option_to_yojson kms_key_type_to_yojson x.key_type);
    ]

let describe_instance_response_to_yojson (x : describe_instance_response) =
  assoc_to_yojson
    [
      ( "EncryptionConfigurationDetails",
        option_to_yojson encryption_configuration_details_to_yojson
          x.encryption_configuration_details );
      ("StatusReason", option_to_yojson reason_to_yojson x.status_reason);
      ("Status", option_to_yojson instance_status_to_yojson x.status);
      ("CreatedDate", option_to_yojson date_to_yojson x.created_date);
      ("Name", option_to_yojson name_type_to_yojson x.name);
      ("OwnerAccountId", option_to_yojson account_id_to_yojson x.owner_account_id);
      ("IdentityStoreId", option_to_yojson id_to_yojson x.identity_store_id);
      ("InstanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
    ]

let describe_instance_request_to_yojson (x : describe_instance_request) =
  assoc_to_yojson [ ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn)) ]

let describe_application_provider_response_to_yojson (x : describe_application_provider_response) =
  assoc_to_yojson
    [
      ( "ResourceServerConfig",
        option_to_yojson resource_server_config_to_yojson x.resource_server_config );
      ("DisplayData", option_to_yojson display_data_to_yojson x.display_data);
      ("FederationProtocol", option_to_yojson federation_protocol_to_yojson x.federation_protocol);
      ( "ApplicationProviderArn",
        Some (application_provider_arn_to_yojson x.application_provider_arn) );
    ]

let describe_application_provider_request_to_yojson (x : describe_application_provider_request) =
  assoc_to_yojson
    [
      ( "ApplicationProviderArn",
        Some (application_provider_arn_to_yojson x.application_provider_arn) );
    ]

let describe_application_assignment_response_to_yojson
    (x : describe_application_assignment_response) =
  assoc_to_yojson
    [
      ("ApplicationArn", option_to_yojson application_arn_to_yojson x.application_arn);
      ("PrincipalId", option_to_yojson principal_id_to_yojson x.principal_id);
      ("PrincipalType", option_to_yojson principal_type_to_yojson x.principal_type);
    ]

let describe_application_assignment_request_to_yojson (x : describe_application_assignment_request)
    =
  assoc_to_yojson
    [
      ("PrincipalType", Some (principal_type_to_yojson x.principal_type));
      ("PrincipalId", Some (principal_id_to_yojson x.principal_id));
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

let describe_application_response_to_yojson (x : describe_application_response) =
  assoc_to_yojson
    [
      ("CreatedFrom", option_to_yojson region_name_to_yojson x.created_from);
      ("CreatedDate", option_to_yojson date_to_yojson x.created_date);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("PortalOptions", option_to_yojson portal_options_to_yojson x.portal_options);
      ("Status", option_to_yojson application_status_to_yojson x.status);
      ("IdentityStoreArn", option_to_yojson identity_store_arn_to_yojson x.identity_store_arn);
      ("InstanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
      ("ApplicationAccount", option_to_yojson account_id_to_yojson x.application_account);
      ("Name", option_to_yojson application_name_type_to_yojson x.name);
      ( "ApplicationProviderArn",
        option_to_yojson application_provider_arn_to_yojson x.application_provider_arn );
      ("ApplicationArn", option_to_yojson application_arn_to_yojson x.application_arn);
    ]

let describe_application_request_to_yojson (x : describe_application_request) =
  assoc_to_yojson [ ("ApplicationArn", Some (application_arn_to_yojson x.application_arn)) ]

let account_assignment_operation_status_to_yojson (x : account_assignment_operation_status) =
  assoc_to_yojson
    [
      ("CreatedDate", option_to_yojson date_to_yojson x.created_date);
      ("PrincipalId", option_to_yojson principal_id_to_yojson x.principal_id);
      ("PrincipalType", option_to_yojson principal_type_to_yojson x.principal_type);
      ("PermissionSetArn", option_to_yojson permission_set_arn_to_yojson x.permission_set_arn);
      ("TargetType", option_to_yojson target_type_to_yojson x.target_type);
      ("TargetId", option_to_yojson target_id_to_yojson x.target_id);
      ("FailureReason", option_to_yojson reason_to_yojson x.failure_reason);
      ("RequestId", option_to_yojson uu_id_to_yojson x.request_id);
      ("Status", option_to_yojson status_values_to_yojson x.status);
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
      ( "AccountAssignmentDeletionRequestId",
        Some (uu_id_to_yojson x.account_assignment_deletion_request_id) );
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
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
      ( "AccountAssignmentCreationRequestId",
        Some (uu_id_to_yojson x.account_assignment_creation_request_id) );
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let delete_trusted_token_issuer_response_to_yojson = unit_to_yojson

let delete_trusted_token_issuer_request_to_yojson (x : delete_trusted_token_issuer_request) =
  assoc_to_yojson
    [
      ("TrustedTokenIssuerArn", Some (trusted_token_issuer_arn_to_yojson x.trusted_token_issuer_arn));
    ]

let delete_permission_set_response_to_yojson = unit_to_yojson

let delete_permission_set_request_to_yojson (x : delete_permission_set_request) =
  assoc_to_yojson
    [
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let delete_permissions_boundary_from_permission_set_response_to_yojson = unit_to_yojson

let delete_permissions_boundary_from_permission_set_request_to_yojson
    (x : delete_permissions_boundary_from_permission_set_request) =
  assoc_to_yojson
    [
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let delete_instance_access_control_attribute_configuration_response_to_yojson = unit_to_yojson

let delete_instance_access_control_attribute_configuration_request_to_yojson
    (x : delete_instance_access_control_attribute_configuration_request) =
  assoc_to_yojson [ ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn)) ]

let delete_instance_response_to_yojson = unit_to_yojson

let delete_instance_request_to_yojson (x : delete_instance_request) =
  assoc_to_yojson [ ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn)) ]

let delete_inline_policy_from_permission_set_response_to_yojson = unit_to_yojson

let delete_inline_policy_from_permission_set_request_to_yojson
    (x : delete_inline_policy_from_permission_set_request) =
  assoc_to_yojson
    [
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let delete_application_assignment_response_to_yojson = unit_to_yojson

let delete_application_assignment_request_to_yojson (x : delete_application_assignment_request) =
  assoc_to_yojson
    [
      ("PrincipalType", Some (principal_type_to_yojson x.principal_type));
      ("PrincipalId", Some (principal_id_to_yojson x.principal_id));
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

let delete_application_response_to_yojson = unit_to_yojson

let delete_application_request_to_yojson (x : delete_application_request) =
  assoc_to_yojson [ ("ApplicationArn", Some (application_arn_to_yojson x.application_arn)) ]

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
      ("PrincipalId", Some (principal_id_to_yojson x.principal_id));
      ("PrincipalType", Some (principal_type_to_yojson x.principal_type));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("TargetType", Some (target_type_to_yojson x.target_type));
      ("TargetId", Some (target_id_to_yojson x.target_id));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let create_trusted_token_issuer_response_to_yojson (x : create_trusted_token_issuer_response) =
  assoc_to_yojson
    [
      ( "TrustedTokenIssuerArn",
        option_to_yojson trusted_token_issuer_arn_to_yojson x.trusted_token_issuer_arn );
    ]

let client_token_to_yojson = string_to_yojson

let create_trusted_token_issuer_request_to_yojson (x : create_trusted_token_issuer_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "TrustedTokenIssuerConfiguration",
        Some (trusted_token_issuer_configuration_to_yojson x.trusted_token_issuer_configuration) );
      ( "TrustedTokenIssuerType",
        Some (trusted_token_issuer_type_to_yojson x.trusted_token_issuer_type) );
      ("Name", Some (trusted_token_issuer_name_to_yojson x.name));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let create_permission_set_response_to_yojson (x : create_permission_set_response) =
  assoc_to_yojson [ ("PermissionSet", option_to_yojson permission_set_to_yojson x.permission_set) ]

let create_permission_set_request_to_yojson (x : create_permission_set_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("RelayState", option_to_yojson relay_state_to_yojson x.relay_state);
      ("SessionDuration", option_to_yojson duration_to_yojson x.session_duration);
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("Description", option_to_yojson permission_set_description_to_yojson x.description);
      ("Name", Some (permission_set_name_to_yojson x.name));
    ]

let create_instance_access_control_attribute_configuration_response_to_yojson = unit_to_yojson

let create_instance_access_control_attribute_configuration_request_to_yojson
    (x : create_instance_access_control_attribute_configuration_request) =
  assoc_to_yojson
    [
      ( "InstanceAccessControlAttributeConfiguration",
        Some
          (instance_access_control_attribute_configuration_to_yojson
             x.instance_access_control_attribute_configuration) );
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let create_instance_response_to_yojson (x : create_instance_response) =
  assoc_to_yojson [ ("InstanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn) ]

let create_instance_request_to_yojson (x : create_instance_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Name", option_to_yojson name_type_to_yojson x.name);
    ]

let create_application_assignment_response_to_yojson = unit_to_yojson

let create_application_assignment_request_to_yojson (x : create_application_assignment_request) =
  assoc_to_yojson
    [
      ("PrincipalType", Some (principal_type_to_yojson x.principal_type));
      ("PrincipalId", Some (principal_id_to_yojson x.principal_id));
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

let create_application_response_to_yojson (x : create_application_response) =
  assoc_to_yojson
    [
      ("IdentityStoreArn", option_to_yojson identity_store_arn_to_yojson x.identity_store_arn);
      ("InstanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
      ("ApplicationArn", option_to_yojson application_arn_to_yojson x.application_arn);
    ]

let create_application_request_to_yojson (x : create_application_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Status", option_to_yojson application_status_to_yojson x.status);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("PortalOptions", option_to_yojson portal_options_to_yojson x.portal_options);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Name", Some (application_name_type_to_yojson x.name));
      ( "ApplicationProviderArn",
        Some (application_provider_arn_to_yojson x.application_provider_arn) );
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

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
      ("PrincipalId", Some (principal_id_to_yojson x.principal_id));
      ("PrincipalType", Some (principal_type_to_yojson x.principal_type));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("TargetType", Some (target_type_to_yojson x.target_type));
      ("TargetId", Some (target_id_to_yojson x.target_id));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let attach_managed_policy_to_permission_set_response_to_yojson = unit_to_yojson

let attach_managed_policy_to_permission_set_request_to_yojson
    (x : attach_managed_policy_to_permission_set_request) =
  assoc_to_yojson
    [
      ("ManagedPolicyArn", Some (managed_policy_arn_to_yojson x.managed_policy_arn));
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let attach_customer_managed_policy_reference_to_permission_set_response_to_yojson = unit_to_yojson

let attach_customer_managed_policy_reference_to_permission_set_request_to_yojson
    (x : attach_customer_managed_policy_reference_to_permission_set_request) =
  assoc_to_yojson
    [
      ( "CustomerManagedPolicyReference",
        Some (customer_managed_policy_reference_to_yojson x.customer_managed_policy_reference) );
      ("PermissionSetArn", Some (permission_set_arn_to_yojson x.permission_set_arn));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let add_region_response_to_yojson (x : add_region_response) =
  assoc_to_yojson [ ("Status", option_to_yojson region_status_to_yojson x.status) ]

let add_region_request_to_yojson (x : add_region_request) =
  assoc_to_yojson
    [
      ("RegionName", Some (region_name_to_yojson x.region_name));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
    ]

let refresh_token_grant_to_yojson = unit_to_yojson
let redirect_uris_to_yojson tree = list_to_yojson ur_i_to_yojson tree

let grant_type_to_yojson (x : grant_type) =
  match x with
  | TOKEN_EXCHANGE -> `String "urn:ietf:params:oauth:grant-type:token-exchange"
  | JWT_BEARER -> `String "urn:ietf:params:oauth:grant-type:jwt-bearer"
  | REFRESH_TOKEN -> `String "refresh_token"
  | AUTHORIZATION_CODE -> `String "authorization_code"

let authorization_code_grant_to_yojson (x : authorization_code_grant) =
  assoc_to_yojson [ ("RedirectUris", option_to_yojson redirect_uris_to_yojson x.redirect_uris) ]

let authorized_token_issuer_to_yojson (x : authorized_token_issuer) =
  assoc_to_yojson
    [
      ( "AuthorizedAudiences",
        option_to_yojson token_issuer_audiences_to_yojson x.authorized_audiences );
      ( "TrustedTokenIssuerArn",
        option_to_yojson trusted_token_issuer_arn_to_yojson x.trusted_token_issuer_arn );
    ]

let authorized_token_issuers_to_yojson tree = list_to_yojson authorized_token_issuer_to_yojson tree

let jwt_bearer_grant_to_yojson (x : jwt_bearer_grant) =
  assoc_to_yojson
    [
      ( "AuthorizedTokenIssuers",
        option_to_yojson authorized_token_issuers_to_yojson x.authorized_token_issuers );
    ]

let grant_to_yojson (x : grant) =
  match x with
  | TokenExchange arg ->
      assoc_to_yojson [ ("TokenExchange", Some (token_exchange_grant_to_yojson arg)) ]
  | RefreshToken arg ->
      assoc_to_yojson [ ("RefreshToken", Some (refresh_token_grant_to_yojson arg)) ]
  | JwtBearer arg -> assoc_to_yojson [ ("JwtBearer", Some (jwt_bearer_grant_to_yojson arg)) ]
  | AuthorizationCode arg ->
      assoc_to_yojson [ ("AuthorizationCode", Some (authorization_code_grant_to_yojson arg)) ]

let put_application_grant_request_to_yojson (x : put_application_grant_request) =
  assoc_to_yojson
    [
      ("Grant", Some (grant_to_yojson x.grant));
      ("GrantType", Some (grant_type_to_yojson x.grant_type));
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

let authentication_method_type_to_yojson (x : authentication_method_type) =
  match x with IAM -> `String "IAM"

let actor_policy_document_to_yojson = json_to_yojson

let iam_authentication_method_to_yojson (x : iam_authentication_method) =
  assoc_to_yojson [ ("ActorPolicy", Some (actor_policy_document_to_yojson x.actor_policy)) ]

let authentication_method_to_yojson (x : authentication_method) =
  match x with
  | Iam arg -> assoc_to_yojson [ ("Iam", Some (iam_authentication_method_to_yojson arg)) ]

let put_application_authentication_method_request_to_yojson
    (x : put_application_authentication_method_request) =
  assoc_to_yojson
    [
      ("AuthenticationMethod", Some (authentication_method_to_yojson x.authentication_method));
      ( "AuthenticationMethodType",
        Some (authentication_method_type_to_yojson x.authentication_method_type) );
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

let put_application_access_scope_request_to_yojson (x : put_application_access_scope_request) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
      ("AuthorizedTargets", option_to_yojson scope_targets_to_yojson x.authorized_targets);
      ("Scope", Some (scope_to_yojson x.scope));
    ]

let grant_item_to_yojson (x : grant_item) =
  assoc_to_yojson
    [
      ("Grant", Some (grant_to_yojson x.grant));
      ("GrantType", Some (grant_type_to_yojson x.grant_type));
    ]

let grants_to_yojson tree = list_to_yojson grant_item_to_yojson tree

let list_application_grants_response_to_yojson (x : list_application_grants_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Grants", Some (grants_to_yojson x.grants));
    ]

let list_application_grants_request_to_yojson (x : list_application_grants_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

let authentication_method_item_to_yojson (x : authentication_method_item) =
  assoc_to_yojson
    [
      ( "AuthenticationMethod",
        option_to_yojson authentication_method_to_yojson x.authentication_method );
      ( "AuthenticationMethodType",
        option_to_yojson authentication_method_type_to_yojson x.authentication_method_type );
    ]

let authentication_methods_to_yojson tree = list_to_yojson authentication_method_item_to_yojson tree

let list_application_authentication_methods_response_to_yojson
    (x : list_application_authentication_methods_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "AuthenticationMethods",
        option_to_yojson authentication_methods_to_yojson x.authentication_methods );
    ]

let list_application_authentication_methods_request_to_yojson
    (x : list_application_authentication_methods_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

let list_application_access_scopes_response_to_yojson (x : list_application_access_scopes_response)
    =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Scopes", Some (scopes_to_yojson x.scopes));
    ]

let list_application_access_scopes_request_to_yojson (x : list_application_access_scopes_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

let get_application_grant_response_to_yojson (x : get_application_grant_response) =
  assoc_to_yojson [ ("Grant", Some (grant_to_yojson x.grant)) ]

let get_application_grant_request_to_yojson (x : get_application_grant_request) =
  assoc_to_yojson
    [
      ("GrantType", Some (grant_type_to_yojson x.grant_type));
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

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
      ( "AuthenticationMethodType",
        Some (authentication_method_type_to_yojson x.authentication_method_type) );
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

let get_application_access_scope_response_to_yojson (x : get_application_access_scope_response) =
  assoc_to_yojson
    [
      ("AuthorizedTargets", option_to_yojson scope_targets_to_yojson x.authorized_targets);
      ("Scope", Some (scope_to_yojson x.scope));
    ]

let get_application_access_scope_request_to_yojson (x : get_application_access_scope_request) =
  assoc_to_yojson
    [
      ("Scope", Some (scope_to_yojson x.scope));
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

let delete_application_grant_request_to_yojson (x : delete_application_grant_request) =
  assoc_to_yojson
    [
      ("GrantType", Some (grant_type_to_yojson x.grant_type));
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

let delete_application_authentication_method_request_to_yojson
    (x : delete_application_authentication_method_request) =
  assoc_to_yojson
    [
      ( "AuthenticationMethodType",
        Some (authentication_method_type_to_yojson x.authentication_method_type) );
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

let delete_application_access_scope_request_to_yojson (x : delete_application_access_scope_request)
    =
  assoc_to_yojson
    [
      ("Scope", Some (scope_to_yojson x.scope));
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]
