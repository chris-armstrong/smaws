open Smaws_Lib.Json.SerializeHelpers
open Types

let impersonation_role_id_to_yojson = string_to_yojson
let impersonation_role_id_list_to_yojson tree = list_to_yojson impersonation_role_id_to_yojson tree
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let work_mail_identifier_to_yojson = string_to_yojson
let user_id_list_to_yojson tree = list_to_yojson work_mail_identifier_to_yojson tree
let access_control_rule_action_to_yojson = string_to_yojson
let actions_list_to_yojson tree = list_to_yojson access_control_rule_action_to_yojson tree
let ip_range_to_yojson = string_to_yojson
let ip_range_list_to_yojson tree = list_to_yojson ip_range_to_yojson tree
let access_control_rule_description_to_yojson = string_to_yojson

let access_control_rule_effect_to_yojson (x : access_control_rule_effect) =
  match x with ALLOW -> `String "ALLOW" | DENY -> `String "DENY"

let access_control_rule_name_to_yojson = string_to_yojson

let access_control_rule_to_yojson (x : access_control_rule) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson access_control_rule_name_to_yojson x.name);
      ("Effect", option_to_yojson access_control_rule_effect_to_yojson x.effect_);
      ("Description", option_to_yojson access_control_rule_description_to_yojson x.description);
      ("IpRanges", option_to_yojson ip_range_list_to_yojson x.ip_ranges);
      ("NotIpRanges", option_to_yojson ip_range_list_to_yojson x.not_ip_ranges);
      ("Actions", option_to_yojson actions_list_to_yojson x.actions);
      ("NotActions", option_to_yojson actions_list_to_yojson x.not_actions);
      ("UserIds", option_to_yojson user_id_list_to_yojson x.user_ids);
      ("NotUserIds", option_to_yojson user_id_list_to_yojson x.not_user_ids);
      ("DateCreated", option_to_yojson timestamp_to_yojson x.date_created);
      ("DateModified", option_to_yojson timestamp_to_yojson x.date_modified);
      ( "ImpersonationRoleIds",
        option_to_yojson impersonation_role_id_list_to_yojson x.impersonation_role_ids );
      ( "NotImpersonationRoleIds",
        option_to_yojson impersonation_role_id_list_to_yojson x.not_impersonation_role_ids );
    ]

let access_control_rule_name_list_to_yojson tree =
  list_to_yojson access_control_rule_name_to_yojson tree

let access_control_rules_list_to_yojson tree = list_to_yojson access_control_rule_to_yojson tree

let access_effect_to_yojson (x : access_effect) =
  match x with ALLOW -> `String "ALLOW" | DENY -> `String "DENY"

let email_address_to_yojson = string_to_yojson
let aliases_to_yojson tree = list_to_yojson email_address_to_yojson tree
let amazon_resource_name_to_yojson = string_to_yojson
let application_arn_to_yojson = string_to_yojson
let string__to_yojson = string_to_yojson

let unsupported_operation_exception_to_yojson (x : unsupported_operation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let organization_state_exception_to_yojson (x : organization_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let organization_not_found_exception_to_yojson (x : organization_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let entity_state_exception_to_yojson (x : entity_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let entity_not_found_exception_to_yojson (x : entity_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let associate_delegate_to_resource_response_to_yojson = unit_to_yojson
let entity_identifier_to_yojson = string_to_yojson
let organization_id_to_yojson = string_to_yojson

let associate_delegate_to_resource_request_to_yojson (x : associate_delegate_to_resource_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("ResourceId", Some (entity_identifier_to_yojson x.resource_id));
      ("EntityId", Some (entity_identifier_to_yojson x.entity_id));
    ]

let directory_unavailable_exception_to_yojson (x : directory_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let directory_service_authentication_failed_exception_to_yojson
    (x : directory_service_authentication_failed_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let associate_member_to_group_response_to_yojson = unit_to_yojson

let associate_member_to_group_request_to_yojson (x : associate_member_to_group_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("GroupId", Some (entity_identifier_to_yojson x.group_id));
      ("MemberId", Some (entity_identifier_to_yojson x.member_id));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let expires_in_to_yojson = long_to_yojson
let impersonation_token_to_yojson = string_to_yojson

let assume_impersonation_role_response_to_yojson (x : assume_impersonation_role_response) =
  assoc_to_yojson
    [
      ("Token", option_to_yojson impersonation_token_to_yojson x.token);
      ("ExpiresIn", option_to_yojson expires_in_to_yojson x.expires_in);
    ]

let assume_impersonation_role_request_to_yojson (x : assume_impersonation_role_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("ImpersonationRoleId", Some (impersonation_role_id_to_yojson x.impersonation_role_id));
    ]

let lambda_arn_to_yojson = string_to_yojson

let lambda_availability_provider_to_yojson (x : lambda_availability_provider) =
  assoc_to_yojson [ ("LambdaArn", Some (lambda_arn_to_yojson x.lambda_arn)) ]

let external_user_name_to_yojson = string_to_yojson
let url_to_yojson = string_to_yojson

let redacted_ews_availability_provider_to_yojson (x : redacted_ews_availability_provider) =
  assoc_to_yojson
    [
      ("EwsEndpoint", option_to_yojson url_to_yojson x.ews_endpoint);
      ("EwsUsername", option_to_yojson external_user_name_to_yojson x.ews_username);
    ]

let availability_provider_type_to_yojson (x : availability_provider_type) =
  match x with EWS -> `String "EWS" | LAMBDA -> `String "LAMBDA"

let domain_name_to_yojson = string_to_yojson

let availability_configuration_to_yojson (x : availability_configuration) =
  assoc_to_yojson
    [
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("ProviderType", option_to_yojson availability_provider_type_to_yojson x.provider_type);
      ("EwsProvider", option_to_yojson redacted_ews_availability_provider_to_yojson x.ews_provider);
      ("LambdaProvider", option_to_yojson lambda_availability_provider_to_yojson x.lambda_provider);
      ("DateCreated", option_to_yojson timestamp_to_yojson x.date_created);
      ("DateModified", option_to_yojson timestamp_to_yojson x.date_modified);
    ]

let availability_configuration_list_to_yojson tree =
  list_to_yojson availability_configuration_to_yojson tree

let boolean__to_yojson = bool_to_yojson

let booking_options_to_yojson (x : booking_options) =
  assoc_to_yojson
    [
      ("AutoAcceptRequests", option_to_yojson boolean__to_yojson x.auto_accept_requests);
      ( "AutoDeclineRecurringRequests",
        option_to_yojson boolean__to_yojson x.auto_decline_recurring_requests );
      ( "AutoDeclineConflictingRequests",
        option_to_yojson boolean__to_yojson x.auto_decline_conflicting_requests );
    ]

let boolean_object_to_yojson = bool_to_yojson
let cancel_mailbox_export_job_response_to_yojson = unit_to_yojson
let mailbox_export_job_id_to_yojson = string_to_yojson
let idempotency_client_token_to_yojson = string_to_yojson

let cancel_mailbox_export_job_request_to_yojson (x : cancel_mailbox_export_job_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (idempotency_client_token_to_yojson x.client_token));
      ("JobId", Some (mailbox_export_job_id_to_yojson x.job_id));
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
    ]

let mail_domain_state_exception_to_yojson (x : mail_domain_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let mail_domain_not_found_exception_to_yojson (x : mail_domain_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let email_address_in_use_exception_to_yojson (x : email_address_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let create_alias_response_to_yojson = unit_to_yojson

let create_alias_request_to_yojson (x : create_alias_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("EntityId", Some (work_mail_identifier_to_yojson x.entity_id));
      ("Alias", Some (email_address_to_yojson x.alias));
    ]

let name_availability_exception_to_yojson (x : name_availability_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let create_availability_configuration_response_to_yojson = unit_to_yojson
let password_to_yojson = string_to_yojson

let ews_availability_provider_to_yojson (x : ews_availability_provider) =
  assoc_to_yojson
    [
      ("EwsEndpoint", Some (url_to_yojson x.ews_endpoint));
      ("EwsUsername", Some (external_user_name_to_yojson x.ews_username));
      ("EwsPassword", Some (password_to_yojson x.ews_password));
    ]

let create_availability_configuration_request_to_yojson
    (x : create_availability_configuration_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (idempotency_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("EwsProvider", option_to_yojson ews_availability_provider_to_yojson x.ews_provider);
      ("LambdaProvider", option_to_yojson lambda_availability_provider_to_yojson x.lambda_provider);
    ]

let reserved_name_exception_to_yojson (x : reserved_name_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let create_group_response_to_yojson (x : create_group_response) =
  assoc_to_yojson [ ("GroupId", option_to_yojson work_mail_identifier_to_yojson x.group_id) ]

let group_name_to_yojson = string_to_yojson

let create_group_request_to_yojson (x : create_group_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("Name", Some (group_name_to_yojson x.name));
      ( "HiddenFromGlobalAddressList",
        option_to_yojson boolean__to_yojson x.hidden_from_global_address_list );
    ]

let create_identity_center_application_response_to_yojson
    (x : create_identity_center_application_response) =
  assoc_to_yojson
    [ ("ApplicationArn", option_to_yojson application_arn_to_yojson x.application_arn) ]

let instance_arn_to_yojson = string_to_yojson
let identity_center_application_name_to_yojson = string_to_yojson

let create_identity_center_application_request_to_yojson
    (x : create_identity_center_application_request) =
  assoc_to_yojson
    [
      ("Name", Some (identity_center_application_name_to_yojson x.name));
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ( "ClientToken",
        Some
          (idempotency_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_impersonation_role_response_to_yojson (x : create_impersonation_role_response) =
  assoc_to_yojson
    [
      ( "ImpersonationRoleId",
        option_to_yojson impersonation_role_id_to_yojson x.impersonation_role_id );
    ]

let target_users_to_yojson tree = list_to_yojson entity_identifier_to_yojson tree
let impersonation_rule_description_to_yojson = string_to_yojson
let impersonation_rule_name_to_yojson = string_to_yojson
let impersonation_rule_id_to_yojson = string_to_yojson

let impersonation_rule_to_yojson (x : impersonation_rule) =
  assoc_to_yojson
    [
      ("ImpersonationRuleId", Some (impersonation_rule_id_to_yojson x.impersonation_rule_id));
      ("Name", option_to_yojson impersonation_rule_name_to_yojson x.name);
      ("Description", option_to_yojson impersonation_rule_description_to_yojson x.description);
      ("Effect", Some (access_effect_to_yojson x.effect_));
      ("TargetUsers", option_to_yojson target_users_to_yojson x.target_users);
      ("NotTargetUsers", option_to_yojson target_users_to_yojson x.not_target_users);
    ]

let impersonation_rule_list_to_yojson tree = list_to_yojson impersonation_rule_to_yojson tree
let impersonation_role_description_to_yojson = string_to_yojson

let impersonation_role_type_to_yojson (x : impersonation_role_type) =
  match x with FULL_ACCESS -> `String "FULL_ACCESS" | READ_ONLY -> `String "READ_ONLY"

let impersonation_role_name_to_yojson = string_to_yojson

let create_impersonation_role_request_to_yojson (x : create_impersonation_role_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (idempotency_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("Name", Some (impersonation_role_name_to_yojson x.name));
      ("Type", Some (impersonation_role_type_to_yojson x.type_));
      ("Description", option_to_yojson impersonation_role_description_to_yojson x.description);
      ("Rules", Some (impersonation_rule_list_to_yojson x.rules));
    ]

let mobile_device_access_rule_id_to_yojson = string_to_yojson

let create_mobile_device_access_rule_response_to_yojson
    (x : create_mobile_device_access_rule_response) =
  assoc_to_yojson
    [
      ( "MobileDeviceAccessRuleId",
        option_to_yojson mobile_device_access_rule_id_to_yojson x.mobile_device_access_rule_id );
    ]

let device_user_agent_to_yojson = string_to_yojson
let device_user_agent_list_to_yojson tree = list_to_yojson device_user_agent_to_yojson tree
let device_operating_system_to_yojson = string_to_yojson

let device_operating_system_list_to_yojson tree =
  list_to_yojson device_operating_system_to_yojson tree

let device_model_to_yojson = string_to_yojson
let device_model_list_to_yojson tree = list_to_yojson device_model_to_yojson tree
let device_type_to_yojson = string_to_yojson
let device_type_list_to_yojson tree = list_to_yojson device_type_to_yojson tree

let mobile_device_access_rule_effect_to_yojson (x : mobile_device_access_rule_effect) =
  match x with ALLOW -> `String "ALLOW" | DENY -> `String "DENY"

let mobile_device_access_rule_description_to_yojson = string_to_yojson
let mobile_device_access_rule_name_to_yojson = string_to_yojson

let create_mobile_device_access_rule_request_to_yojson
    (x : create_mobile_device_access_rule_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ( "ClientToken",
        Some
          (idempotency_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Name", Some (mobile_device_access_rule_name_to_yojson x.name));
      ("Description", option_to_yojson mobile_device_access_rule_description_to_yojson x.description);
      ("Effect", Some (mobile_device_access_rule_effect_to_yojson x.effect_));
      ("DeviceTypes", option_to_yojson device_type_list_to_yojson x.device_types);
      ("NotDeviceTypes", option_to_yojson device_type_list_to_yojson x.not_device_types);
      ("DeviceModels", option_to_yojson device_model_list_to_yojson x.device_models);
      ("NotDeviceModels", option_to_yojson device_model_list_to_yojson x.not_device_models);
      ( "DeviceOperatingSystems",
        option_to_yojson device_operating_system_list_to_yojson x.device_operating_systems );
      ( "NotDeviceOperatingSystems",
        option_to_yojson device_operating_system_list_to_yojson x.not_device_operating_systems );
      ("DeviceUserAgents", option_to_yojson device_user_agent_list_to_yojson x.device_user_agents);
      ( "NotDeviceUserAgents",
        option_to_yojson device_user_agent_list_to_yojson x.not_device_user_agents );
    ]

let directory_in_use_exception_to_yojson (x : directory_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let create_organization_response_to_yojson (x : create_organization_response) =
  assoc_to_yojson
    [ ("OrganizationId", option_to_yojson organization_id_to_yojson x.organization_id) ]

let kms_key_arn_to_yojson = string_to_yojson
let hosted_zone_id_to_yojson = string_to_yojson

let domain_to_yojson (x : domain) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("HostedZoneId", option_to_yojson hosted_zone_id_to_yojson x.hosted_zone_id);
    ]

let domains_to_yojson tree = list_to_yojson domain_to_yojson tree
let organization_name_to_yojson = string_to_yojson
let directory_id_to_yojson = string_to_yojson

let create_organization_request_to_yojson (x : create_organization_request) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("Alias", Some (organization_name_to_yojson x.alias));
      ( "ClientToken",
        Some
          (idempotency_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Domains", option_to_yojson domains_to_yojson x.domains);
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("EnableInteroperability", option_to_yojson boolean__to_yojson x.enable_interoperability);
    ]

let resource_id_to_yojson = string_to_yojson

let create_resource_response_to_yojson (x : create_resource_response) =
  assoc_to_yojson [ ("ResourceId", option_to_yojson resource_id_to_yojson x.resource_id) ]

let resource_description_to_yojson = string_to_yojson

let resource_type_to_yojson (x : resource_type) =
  match x with ROOM -> `String "ROOM" | EQUIPMENT -> `String "EQUIPMENT"

let resource_name_to_yojson = string_to_yojson

let create_resource_request_to_yojson (x : create_resource_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("Name", Some (resource_name_to_yojson x.name));
      ("Type", Some (resource_type_to_yojson x.type_));
      ("Description", option_to_yojson resource_description_to_yojson x.description);
      ( "HiddenFromGlobalAddressList",
        option_to_yojson boolean__to_yojson x.hidden_from_global_address_list );
    ]

let invalid_password_exception_to_yojson (x : invalid_password_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let create_user_response_to_yojson (x : create_user_response) =
  assoc_to_yojson [ ("UserId", option_to_yojson work_mail_identifier_to_yojson x.user_id) ]

let identity_provider_user_id_to_yojson = string_to_yojson
let user_attribute_to_yojson = string_to_yojson

let user_role_to_yojson (x : user_role) =
  match x with
  | USER -> `String "USER"
  | RESOURCE -> `String "RESOURCE"
  | SYSTEM_USER -> `String "SYSTEM_USER"
  | REMOTE_USER -> `String "REMOTE_USER"

let user_name_to_yojson = string_to_yojson

let create_user_request_to_yojson (x : create_user_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("Name", Some (user_name_to_yojson x.name));
      ("DisplayName", Some (user_attribute_to_yojson x.display_name));
      ("Password", option_to_yojson password_to_yojson x.password);
      ("Role", option_to_yojson user_role_to_yojson x.role);
      ("FirstName", option_to_yojson user_attribute_to_yojson x.first_name);
      ("LastName", option_to_yojson user_attribute_to_yojson x.last_name);
      ( "HiddenFromGlobalAddressList",
        option_to_yojson boolean__to_yojson x.hidden_from_global_address_list );
      ( "IdentityProviderUserId",
        option_to_yojson identity_provider_user_id_to_yojson x.identity_provider_user_id );
    ]

let member_type_to_yojson (x : member_type) =
  match x with GROUP -> `String "GROUP" | USER -> `String "USER"

let delegate_to_yojson (x : delegate) =
  assoc_to_yojson
    [ ("Id", Some (string__to_yojson x.id)); ("Type", Some (member_type_to_yojson x.type_)) ]

let delete_access_control_rule_response_to_yojson = unit_to_yojson

let delete_access_control_rule_request_to_yojson (x : delete_access_control_rule_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("Name", Some (access_control_rule_name_to_yojson x.name));
    ]

let delete_alias_response_to_yojson = unit_to_yojson

let delete_alias_request_to_yojson (x : delete_alias_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("EntityId", Some (work_mail_identifier_to_yojson x.entity_id));
      ("Alias", Some (email_address_to_yojson x.alias));
    ]

let delete_availability_configuration_response_to_yojson = unit_to_yojson

let delete_availability_configuration_request_to_yojson
    (x : delete_availability_configuration_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let delete_email_monitoring_configuration_response_to_yojson = unit_to_yojson

let delete_email_monitoring_configuration_request_to_yojson
    (x : delete_email_monitoring_configuration_request) =
  assoc_to_yojson [ ("OrganizationId", Some (organization_id_to_yojson x.organization_id)) ]

let delete_group_response_to_yojson = unit_to_yojson

let delete_group_request_to_yojson (x : delete_group_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("GroupId", Some (entity_identifier_to_yojson x.group_id));
    ]

let delete_identity_center_application_response_to_yojson = unit_to_yojson

let delete_identity_center_application_request_to_yojson
    (x : delete_identity_center_application_request) =
  assoc_to_yojson [ ("ApplicationArn", Some (application_arn_to_yojson x.application_arn)) ]

let delete_identity_provider_configuration_response_to_yojson = unit_to_yojson

let delete_identity_provider_configuration_request_to_yojson
    (x : delete_identity_provider_configuration_request) =
  assoc_to_yojson [ ("OrganizationId", Some (organization_id_to_yojson x.organization_id)) ]

let delete_impersonation_role_response_to_yojson = unit_to_yojson

let delete_impersonation_role_request_to_yojson (x : delete_impersonation_role_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("ImpersonationRoleId", Some (impersonation_role_id_to_yojson x.impersonation_role_id));
    ]

let delete_mailbox_permissions_response_to_yojson = unit_to_yojson

let delete_mailbox_permissions_request_to_yojson (x : delete_mailbox_permissions_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("EntityId", Some (entity_identifier_to_yojson x.entity_id));
      ("GranteeId", Some (entity_identifier_to_yojson x.grantee_id));
    ]

let delete_mobile_device_access_override_response_to_yojson = unit_to_yojson
let device_id_to_yojson = string_to_yojson

let delete_mobile_device_access_override_request_to_yojson
    (x : delete_mobile_device_access_override_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("UserId", Some (entity_identifier_to_yojson x.user_id));
      ("DeviceId", Some (device_id_to_yojson x.device_id));
    ]

let delete_mobile_device_access_rule_response_to_yojson = unit_to_yojson

let delete_mobile_device_access_rule_request_to_yojson
    (x : delete_mobile_device_access_rule_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ( "MobileDeviceAccessRuleId",
        Some (mobile_device_access_rule_id_to_yojson x.mobile_device_access_rule_id) );
    ]

let delete_organization_response_to_yojson (x : delete_organization_response) =
  assoc_to_yojson
    [
      ("OrganizationId", option_to_yojson organization_id_to_yojson x.organization_id);
      ("State", option_to_yojson string__to_yojson x.state);
    ]

let delete_organization_request_to_yojson (x : delete_organization_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (idempotency_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("DeleteDirectory", Some (boolean__to_yojson x.delete_directory));
      ("ForceDelete", option_to_yojson boolean__to_yojson x.force_delete);
      ( "DeleteIdentityCenterApplication",
        option_to_yojson boolean__to_yojson x.delete_identity_center_application );
    ]

let delete_personal_access_token_response_to_yojson = unit_to_yojson
let personal_access_token_id_to_yojson = string_to_yojson

let delete_personal_access_token_request_to_yojson (x : delete_personal_access_token_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("PersonalAccessTokenId", Some (personal_access_token_id_to_yojson x.personal_access_token_id));
    ]

let delete_resource_response_to_yojson = unit_to_yojson

let delete_resource_request_to_yojson (x : delete_resource_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("ResourceId", Some (entity_identifier_to_yojson x.resource_id));
    ]

let delete_retention_policy_response_to_yojson = unit_to_yojson
let short_string_to_yojson = string_to_yojson

let delete_retention_policy_request_to_yojson (x : delete_retention_policy_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("Id", Some (short_string_to_yojson x.id));
    ]

let delete_user_response_to_yojson = unit_to_yojson

let delete_user_request_to_yojson (x : delete_user_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("UserId", Some (entity_identifier_to_yojson x.user_id));
    ]

let deregister_from_work_mail_response_to_yojson = unit_to_yojson

let deregister_from_work_mail_request_to_yojson (x : deregister_from_work_mail_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("EntityId", Some (entity_identifier_to_yojson x.entity_id));
    ]

let mail_domain_in_use_exception_to_yojson (x : mail_domain_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_custom_ses_configuration_exception_to_yojson
    (x : invalid_custom_ses_configuration_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let deregister_mail_domain_response_to_yojson = unit_to_yojson
let work_mail_domain_name_to_yojson = string_to_yojson

let deregister_mail_domain_request_to_yojson (x : deregister_mail_domain_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("DomainName", Some (work_mail_domain_name_to_yojson x.domain_name));
    ]

let log_group_arn_to_yojson = string_to_yojson
let role_arn_to_yojson = string_to_yojson

let describe_email_monitoring_configuration_response_to_yojson
    (x : describe_email_monitoring_configuration_response) =
  assoc_to_yojson
    [
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("LogGroupArn", option_to_yojson log_group_arn_to_yojson x.log_group_arn);
    ]

let describe_email_monitoring_configuration_request_to_yojson
    (x : describe_email_monitoring_configuration_request) =
  assoc_to_yojson [ ("OrganizationId", Some (organization_id_to_yojson x.organization_id)) ]

let entity_type_to_yojson (x : entity_type) =
  match x with GROUP -> `String "GROUP" | USER -> `String "USER" | RESOURCE -> `String "RESOURCE"

let describe_entity_response_to_yojson (x : describe_entity_response) =
  assoc_to_yojson
    [
      ("EntityId", option_to_yojson work_mail_identifier_to_yojson x.entity_id);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Type", option_to_yojson entity_type_to_yojson x.type_);
    ]

let describe_entity_request_to_yojson (x : describe_entity_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("Email", Some (email_address_to_yojson x.email));
    ]

let entity_state_to_yojson (x : entity_state) =
  match x with
  | ENABLED -> `String "ENABLED"
  | DISABLED -> `String "DISABLED"
  | DELETED -> `String "DELETED"

let describe_group_response_to_yojson (x : describe_group_response) =
  assoc_to_yojson
    [
      ("GroupId", option_to_yojson work_mail_identifier_to_yojson x.group_id);
      ("Name", option_to_yojson group_name_to_yojson x.name);
      ("Email", option_to_yojson email_address_to_yojson x.email);
      ("State", option_to_yojson entity_state_to_yojson x.state);
      ("EnabledDate", option_to_yojson timestamp_to_yojson x.enabled_date);
      ("DisabledDate", option_to_yojson timestamp_to_yojson x.disabled_date);
      ( "HiddenFromGlobalAddressList",
        option_to_yojson boolean__to_yojson x.hidden_from_global_address_list );
    ]

let describe_group_request_to_yojson (x : describe_group_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("GroupId", Some (entity_identifier_to_yojson x.group_id));
    ]

let personal_access_token_lifetime_in_days_to_yojson = int_to_yojson

let personal_access_token_configuration_status_to_yojson
    (x : personal_access_token_configuration_status) =
  match x with ACTIVE -> `String "ACTIVE" | INACTIVE -> `String "INACTIVE"

let personal_access_token_configuration_to_yojson (x : personal_access_token_configuration) =
  assoc_to_yojson
    [
      ("Status", Some (personal_access_token_configuration_status_to_yojson x.status));
      ( "LifetimeInDays",
        option_to_yojson personal_access_token_lifetime_in_days_to_yojson x.lifetime_in_days );
    ]

let identity_center_configuration_to_yojson (x : identity_center_configuration) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (instance_arn_to_yojson x.instance_arn));
      ("ApplicationArn", Some (application_arn_to_yojson x.application_arn));
    ]

let identity_provider_authentication_mode_to_yojson (x : identity_provider_authentication_mode) =
  match x with
  | IDENTITY_PROVIDER_ONLY -> `String "IDENTITY_PROVIDER_ONLY"
  | IDENTITY_PROVIDER_AND_DIRECTORY -> `String "IDENTITY_PROVIDER_AND_DIRECTORY"

let describe_identity_provider_configuration_response_to_yojson
    (x : describe_identity_provider_configuration_response) =
  assoc_to_yojson
    [
      ( "AuthenticationMode",
        option_to_yojson identity_provider_authentication_mode_to_yojson x.authentication_mode );
      ( "IdentityCenterConfiguration",
        option_to_yojson identity_center_configuration_to_yojson x.identity_center_configuration );
      ( "PersonalAccessTokenConfiguration",
        option_to_yojson personal_access_token_configuration_to_yojson
          x.personal_access_token_configuration );
    ]

let describe_identity_provider_configuration_request_to_yojson
    (x : describe_identity_provider_configuration_request) =
  assoc_to_yojson [ ("OrganizationId", Some (organization_id_to_yojson x.organization_id)) ]

let describe_inbound_dmarc_settings_response_to_yojson
    (x : describe_inbound_dmarc_settings_response) =
  assoc_to_yojson [ ("Enforced", option_to_yojson boolean__to_yojson x.enforced) ]

let describe_inbound_dmarc_settings_request_to_yojson (x : describe_inbound_dmarc_settings_request)
    =
  assoc_to_yojson [ ("OrganizationId", Some (organization_id_to_yojson x.organization_id)) ]

let mailbox_export_error_info_to_yojson = string_to_yojson

let mailbox_export_job_state_to_yojson (x : mailbox_export_job_state) =
  match x with
  | RUNNING -> `String "RUNNING"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | CANCELLED -> `String "CANCELLED"

let percentage_to_yojson = int_to_yojson
let s3_object_key_to_yojson = string_to_yojson
let s3_bucket_name_to_yojson = string_to_yojson
let description_to_yojson = string_to_yojson

let describe_mailbox_export_job_response_to_yojson (x : describe_mailbox_export_job_response) =
  assoc_to_yojson
    [
      ("EntityId", option_to_yojson work_mail_identifier_to_yojson x.entity_id);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("S3BucketName", option_to_yojson s3_bucket_name_to_yojson x.s3_bucket_name);
      ("S3Prefix", option_to_yojson s3_object_key_to_yojson x.s3_prefix);
      ("S3Path", option_to_yojson s3_object_key_to_yojson x.s3_path);
      ("EstimatedProgress", option_to_yojson percentage_to_yojson x.estimated_progress);
      ("State", option_to_yojson mailbox_export_job_state_to_yojson x.state);
      ("ErrorInfo", option_to_yojson mailbox_export_error_info_to_yojson x.error_info);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
    ]

let describe_mailbox_export_job_request_to_yojson (x : describe_mailbox_export_job_request) =
  assoc_to_yojson
    [
      ("JobId", Some (mailbox_export_job_id_to_yojson x.job_id));
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
    ]

let describe_organization_response_to_yojson (x : describe_organization_response) =
  assoc_to_yojson
    [
      ("OrganizationId", option_to_yojson organization_id_to_yojson x.organization_id);
      ("Alias", option_to_yojson organization_name_to_yojson x.alias);
      ("State", option_to_yojson string__to_yojson x.state);
      ("DirectoryId", option_to_yojson string__to_yojson x.directory_id);
      ("DirectoryType", option_to_yojson string__to_yojson x.directory_type);
      ("DefaultMailDomain", option_to_yojson string__to_yojson x.default_mail_domain);
      ("CompletedDate", option_to_yojson timestamp_to_yojson x.completed_date);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("ARN", option_to_yojson amazon_resource_name_to_yojson x.ar_n);
      ("MigrationAdmin", option_to_yojson work_mail_identifier_to_yojson x.migration_admin);
      ("InteroperabilityEnabled", option_to_yojson boolean__to_yojson x.interoperability_enabled);
    ]

let describe_organization_request_to_yojson (x : describe_organization_request) =
  assoc_to_yojson [ ("OrganizationId", Some (organization_id_to_yojson x.organization_id)) ]

let describe_resource_response_to_yojson (x : describe_resource_response) =
  assoc_to_yojson
    [
      ("ResourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("Email", option_to_yojson email_address_to_yojson x.email);
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("Type", option_to_yojson resource_type_to_yojson x.type_);
      ("BookingOptions", option_to_yojson booking_options_to_yojson x.booking_options);
      ("State", option_to_yojson entity_state_to_yojson x.state);
      ("EnabledDate", option_to_yojson timestamp_to_yojson x.enabled_date);
      ("DisabledDate", option_to_yojson timestamp_to_yojson x.disabled_date);
      ("Description", option_to_yojson resource_description_to_yojson x.description);
      ( "HiddenFromGlobalAddressList",
        option_to_yojson boolean__to_yojson x.hidden_from_global_address_list );
    ]

let describe_resource_request_to_yojson (x : describe_resource_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("ResourceId", Some (entity_identifier_to_yojson x.resource_id));
    ]

let identity_provider_identity_store_id_to_yojson = string_to_yojson

let describe_user_response_to_yojson (x : describe_user_response) =
  assoc_to_yojson
    [
      ("UserId", option_to_yojson work_mail_identifier_to_yojson x.user_id);
      ("Name", option_to_yojson user_name_to_yojson x.name);
      ("Email", option_to_yojson email_address_to_yojson x.email);
      ("DisplayName", option_to_yojson user_attribute_to_yojson x.display_name);
      ("State", option_to_yojson entity_state_to_yojson x.state);
      ("UserRole", option_to_yojson user_role_to_yojson x.user_role);
      ("EnabledDate", option_to_yojson timestamp_to_yojson x.enabled_date);
      ("DisabledDate", option_to_yojson timestamp_to_yojson x.disabled_date);
      ("MailboxProvisionedDate", option_to_yojson timestamp_to_yojson x.mailbox_provisioned_date);
      ("MailboxDeprovisionedDate", option_to_yojson timestamp_to_yojson x.mailbox_deprovisioned_date);
      ("FirstName", option_to_yojson user_attribute_to_yojson x.first_name);
      ("LastName", option_to_yojson user_attribute_to_yojson x.last_name);
      ( "HiddenFromGlobalAddressList",
        option_to_yojson boolean__to_yojson x.hidden_from_global_address_list );
      ("Initials", option_to_yojson user_attribute_to_yojson x.initials);
      ("Telephone", option_to_yojson user_attribute_to_yojson x.telephone);
      ("Street", option_to_yojson user_attribute_to_yojson x.street);
      ("JobTitle", option_to_yojson user_attribute_to_yojson x.job_title);
      ("City", option_to_yojson user_attribute_to_yojson x.city);
      ("Company", option_to_yojson user_attribute_to_yojson x.company);
      ("ZipCode", option_to_yojson user_attribute_to_yojson x.zip_code);
      ("Department", option_to_yojson user_attribute_to_yojson x.department);
      ("Country", option_to_yojson user_attribute_to_yojson x.country);
      ("Office", option_to_yojson user_attribute_to_yojson x.office);
      ( "IdentityProviderUserId",
        option_to_yojson identity_provider_user_id_to_yojson x.identity_provider_user_id );
      ( "IdentityProviderIdentityStoreId",
        option_to_yojson identity_provider_identity_store_id_to_yojson
          x.identity_provider_identity_store_id );
    ]

let describe_user_request_to_yojson (x : describe_user_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("UserId", Some (entity_identifier_to_yojson x.user_id));
    ]

let disassociate_delegate_from_resource_response_to_yojson = unit_to_yojson

let disassociate_delegate_from_resource_request_to_yojson
    (x : disassociate_delegate_from_resource_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("ResourceId", Some (entity_identifier_to_yojson x.resource_id));
      ("EntityId", Some (entity_identifier_to_yojson x.entity_id));
    ]

let disassociate_member_from_group_response_to_yojson = unit_to_yojson

let disassociate_member_from_group_request_to_yojson (x : disassociate_member_from_group_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("GroupId", Some (entity_identifier_to_yojson x.group_id));
      ("MemberId", Some (entity_identifier_to_yojson x.member_id));
    ]

let dns_record_to_yojson (x : dns_record) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson string__to_yojson x.type_);
      ("Hostname", option_to_yojson string__to_yojson x.hostname);
      ("Value", option_to_yojson string__to_yojson x.value);
    ]

let dns_record_verification_status_to_yojson (x : dns_record_verification_status) =
  match x with
  | PENDING -> `String "PENDING"
  | VERIFIED -> `String "VERIFIED"
  | FAILED -> `String "FAILED"

let dns_records_to_yojson tree = list_to_yojson dns_record_to_yojson tree

let entity_already_registered_exception_to_yojson (x : entity_already_registered_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let retention_period_to_yojson = int_to_yojson

let retention_action_to_yojson (x : retention_action) =
  match x with
  | NONE -> `String "NONE"
  | DELETE -> `String "DELETE"
  | PERMANENTLY_DELETE -> `String "PERMANENTLY_DELETE"

let folder_name_to_yojson (x : folder_name) =
  match x with
  | INBOX -> `String "INBOX"
  | DELETED_ITEMS -> `String "DELETED_ITEMS"
  | SENT_ITEMS -> `String "SENT_ITEMS"
  | DRAFTS -> `String "DRAFTS"
  | JUNK_EMAIL -> `String "JUNK_EMAIL"

let folder_configuration_to_yojson (x : folder_configuration) =
  assoc_to_yojson
    [
      ("Name", Some (folder_name_to_yojson x.name));
      ("Action", Some (retention_action_to_yojson x.action));
      ("Period", option_to_yojson retention_period_to_yojson x.period);
    ]

let folder_configurations_to_yojson tree = list_to_yojson folder_configuration_to_yojson tree

let get_access_control_effect_response_to_yojson (x : get_access_control_effect_response) =
  assoc_to_yojson
    [
      ("Effect", option_to_yojson access_control_rule_effect_to_yojson x.effect_);
      ("MatchedRules", option_to_yojson access_control_rule_name_list_to_yojson x.matched_rules);
    ]

let ip_address_to_yojson = string_to_yojson

let get_access_control_effect_request_to_yojson (x : get_access_control_effect_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("IpAddress", Some (ip_address_to_yojson x.ip_address));
      ("Action", Some (access_control_rule_action_to_yojson x.action));
      ("UserId", option_to_yojson work_mail_identifier_to_yojson x.user_id);
      ( "ImpersonationRoleId",
        option_to_yojson impersonation_role_id_to_yojson x.impersonation_role_id );
    ]

let get_default_retention_policy_response_to_yojson (x : get_default_retention_policy_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson short_string_to_yojson x.id);
      ("Name", option_to_yojson short_string_to_yojson x.name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ( "FolderConfigurations",
        option_to_yojson folder_configurations_to_yojson x.folder_configurations );
    ]

let get_default_retention_policy_request_to_yojson (x : get_default_retention_policy_request) =
  assoc_to_yojson [ ("OrganizationId", Some (organization_id_to_yojson x.organization_id)) ]

let get_impersonation_role_response_to_yojson (x : get_impersonation_role_response) =
  assoc_to_yojson
    [
      ( "ImpersonationRoleId",
        option_to_yojson impersonation_role_id_to_yojson x.impersonation_role_id );
      ("Name", option_to_yojson impersonation_role_name_to_yojson x.name);
      ("Type", option_to_yojson impersonation_role_type_to_yojson x.type_);
      ("Description", option_to_yojson impersonation_role_description_to_yojson x.description);
      ("Rules", option_to_yojson impersonation_rule_list_to_yojson x.rules);
      ("DateCreated", option_to_yojson timestamp_to_yojson x.date_created);
      ("DateModified", option_to_yojson timestamp_to_yojson x.date_modified);
    ]

let get_impersonation_role_request_to_yojson (x : get_impersonation_role_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("ImpersonationRoleId", Some (impersonation_role_id_to_yojson x.impersonation_role_id));
    ]

let impersonation_matched_rule_to_yojson (x : impersonation_matched_rule) =
  assoc_to_yojson
    [
      ( "ImpersonationRuleId",
        option_to_yojson impersonation_rule_id_to_yojson x.impersonation_rule_id );
      ("Name", option_to_yojson impersonation_rule_name_to_yojson x.name);
    ]

let impersonation_matched_rule_list_to_yojson tree =
  list_to_yojson impersonation_matched_rule_to_yojson tree

let get_impersonation_role_effect_response_to_yojson (x : get_impersonation_role_effect_response) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson impersonation_role_type_to_yojson x.type_);
      ("Effect", option_to_yojson access_effect_to_yojson x.effect_);
      ("MatchedRules", option_to_yojson impersonation_matched_rule_list_to_yojson x.matched_rules);
    ]

let get_impersonation_role_effect_request_to_yojson (x : get_impersonation_role_effect_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("ImpersonationRoleId", Some (impersonation_role_id_to_yojson x.impersonation_role_id));
      ("TargetUser", Some (entity_identifier_to_yojson x.target_user));
    ]

let get_mail_domain_response_to_yojson (x : get_mail_domain_response) =
  assoc_to_yojson
    [
      ("Records", option_to_yojson dns_records_to_yojson x.records);
      ("IsTestDomain", option_to_yojson boolean__to_yojson x.is_test_domain);
      ("IsDefault", option_to_yojson boolean__to_yojson x.is_default);
      ( "OwnershipVerificationStatus",
        option_to_yojson dns_record_verification_status_to_yojson x.ownership_verification_status );
      ( "DkimVerificationStatus",
        option_to_yojson dns_record_verification_status_to_yojson x.dkim_verification_status );
    ]

let get_mail_domain_request_to_yojson (x : get_mail_domain_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("DomainName", Some (work_mail_domain_name_to_yojson x.domain_name));
    ]

let mailbox_size_to_yojson = double_to_yojson
let mailbox_quota_to_yojson = int_to_yojson

let get_mailbox_details_response_to_yojson (x : get_mailbox_details_response) =
  assoc_to_yojson
    [
      ("MailboxQuota", option_to_yojson mailbox_quota_to_yojson x.mailbox_quota);
      ("MailboxSize", option_to_yojson mailbox_size_to_yojson x.mailbox_size);
    ]

let get_mailbox_details_request_to_yojson (x : get_mailbox_details_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("UserId", Some (entity_identifier_to_yojson x.user_id));
    ]

let mobile_device_access_matched_rule_to_yojson (x : mobile_device_access_matched_rule) =
  assoc_to_yojson
    [
      ( "MobileDeviceAccessRuleId",
        option_to_yojson mobile_device_access_rule_id_to_yojson x.mobile_device_access_rule_id );
      ("Name", option_to_yojson mobile_device_access_rule_name_to_yojson x.name);
    ]

let mobile_device_access_matched_rule_list_to_yojson tree =
  list_to_yojson mobile_device_access_matched_rule_to_yojson tree

let get_mobile_device_access_effect_response_to_yojson
    (x : get_mobile_device_access_effect_response) =
  assoc_to_yojson
    [
      ("Effect", option_to_yojson mobile_device_access_rule_effect_to_yojson x.effect_);
      ( "MatchedRules",
        option_to_yojson mobile_device_access_matched_rule_list_to_yojson x.matched_rules );
    ]

let get_mobile_device_access_effect_request_to_yojson (x : get_mobile_device_access_effect_request)
    =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("DeviceType", option_to_yojson device_type_to_yojson x.device_type);
      ("DeviceModel", option_to_yojson device_model_to_yojson x.device_model);
      ( "DeviceOperatingSystem",
        option_to_yojson device_operating_system_to_yojson x.device_operating_system );
      ("DeviceUserAgent", option_to_yojson device_user_agent_to_yojson x.device_user_agent);
    ]

let get_mobile_device_access_override_response_to_yojson
    (x : get_mobile_device_access_override_response) =
  assoc_to_yojson
    [
      ("UserId", option_to_yojson work_mail_identifier_to_yojson x.user_id);
      ("DeviceId", option_to_yojson device_id_to_yojson x.device_id);
      ("Effect", option_to_yojson mobile_device_access_rule_effect_to_yojson x.effect_);
      ("Description", option_to_yojson mobile_device_access_rule_description_to_yojson x.description);
      ("DateCreated", option_to_yojson timestamp_to_yojson x.date_created);
      ("DateModified", option_to_yojson timestamp_to_yojson x.date_modified);
    ]

let get_mobile_device_access_override_request_to_yojson
    (x : get_mobile_device_access_override_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("UserId", Some (entity_identifier_to_yojson x.user_id));
      ("DeviceId", Some (device_id_to_yojson x.device_id));
    ]

let personal_access_token_scope_to_yojson = string_to_yojson

let personal_access_token_scope_list_to_yojson tree =
  list_to_yojson personal_access_token_scope_to_yojson tree

let personal_access_token_name_to_yojson = string_to_yojson

let get_personal_access_token_metadata_response_to_yojson
    (x : get_personal_access_token_metadata_response) =
  assoc_to_yojson
    [
      ( "PersonalAccessTokenId",
        option_to_yojson personal_access_token_id_to_yojson x.personal_access_token_id );
      ("UserId", option_to_yojson work_mail_identifier_to_yojson x.user_id);
      ("Name", option_to_yojson personal_access_token_name_to_yojson x.name);
      ("DateCreated", option_to_yojson timestamp_to_yojson x.date_created);
      ("DateLastUsed", option_to_yojson timestamp_to_yojson x.date_last_used);
      ("ExpiresTime", option_to_yojson timestamp_to_yojson x.expires_time);
      ("Scopes", option_to_yojson personal_access_token_scope_list_to_yojson x.scopes);
    ]

let get_personal_access_token_metadata_request_to_yojson
    (x : get_personal_access_token_metadata_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("PersonalAccessTokenId", Some (personal_access_token_id_to_yojson x.personal_access_token_id));
    ]

let group_to_yojson (x : group) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson work_mail_identifier_to_yojson x.id);
      ("Email", option_to_yojson email_address_to_yojson x.email);
      ("Name", option_to_yojson group_name_to_yojson x.name);
      ("State", option_to_yojson entity_state_to_yojson x.state);
      ("EnabledDate", option_to_yojson timestamp_to_yojson x.enabled_date);
      ("DisabledDate", option_to_yojson timestamp_to_yojson x.disabled_date);
    ]

let group_identifier_to_yojson (x : group_identifier) =
  assoc_to_yojson
    [
      ("GroupId", option_to_yojson work_mail_identifier_to_yojson x.group_id);
      ("GroupName", option_to_yojson group_name_to_yojson x.group_name);
    ]

let group_identifiers_to_yojson tree = list_to_yojson group_identifier_to_yojson tree
let groups_to_yojson tree = list_to_yojson group_to_yojson tree
let identity_provider_user_id_for_update_to_yojson = string_to_yojson
let identity_provider_user_id_prefix_to_yojson = string_to_yojson

let impersonation_role_to_yojson (x : impersonation_role) =
  assoc_to_yojson
    [
      ( "ImpersonationRoleId",
        option_to_yojson impersonation_role_id_to_yojson x.impersonation_role_id );
      ("Name", option_to_yojson impersonation_role_name_to_yojson x.name);
      ("Type", option_to_yojson impersonation_role_type_to_yojson x.type_);
      ("DateCreated", option_to_yojson timestamp_to_yojson x.date_created);
      ("DateModified", option_to_yojson timestamp_to_yojson x.date_modified);
    ]

let impersonation_role_list_to_yojson tree = list_to_yojson impersonation_role_to_yojson tree

let invalid_configuration_exception_to_yojson (x : invalid_configuration_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let mailbox_export_job_to_yojson (x : mailbox_export_job) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson mailbox_export_job_id_to_yojson x.job_id);
      ("EntityId", option_to_yojson work_mail_identifier_to_yojson x.entity_id);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("S3BucketName", option_to_yojson s3_bucket_name_to_yojson x.s3_bucket_name);
      ("S3Path", option_to_yojson s3_object_key_to_yojson x.s3_path);
      ("EstimatedProgress", option_to_yojson percentage_to_yojson x.estimated_progress);
      ("State", option_to_yojson mailbox_export_job_state_to_yojson x.state);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
    ]

let jobs_to_yojson tree = list_to_yojson mailbox_export_job_to_yojson tree

let list_access_control_rules_response_to_yojson (x : list_access_control_rules_response) =
  assoc_to_yojson [ ("Rules", option_to_yojson access_control_rules_list_to_yojson x.rules) ]

let list_access_control_rules_request_to_yojson (x : list_access_control_rules_request) =
  assoc_to_yojson [ ("OrganizationId", Some (organization_id_to_yojson x.organization_id)) ]

let next_token_to_yojson = string_to_yojson

let list_aliases_response_to_yojson (x : list_aliases_response) =
  assoc_to_yojson
    [
      ("Aliases", option_to_yojson aliases_to_yojson x.aliases);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_aliases_request_to_yojson (x : list_aliases_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("EntityId", Some (work_mail_identifier_to_yojson x.entity_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_availability_configurations_response_to_yojson
    (x : list_availability_configurations_response) =
  assoc_to_yojson
    [
      ( "AvailabilityConfigurations",
        option_to_yojson availability_configuration_list_to_yojson x.availability_configurations );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_availability_configurations_request_to_yojson
    (x : list_availability_configurations_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let member_to_yojson (x : member) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson string__to_yojson x.id);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Type", option_to_yojson member_type_to_yojson x.type_);
      ("State", option_to_yojson entity_state_to_yojson x.state);
      ("EnabledDate", option_to_yojson timestamp_to_yojson x.enabled_date);
      ("DisabledDate", option_to_yojson timestamp_to_yojson x.disabled_date);
    ]

let members_to_yojson tree = list_to_yojson member_to_yojson tree

let list_group_members_response_to_yojson (x : list_group_members_response) =
  assoc_to_yojson
    [
      ("Members", option_to_yojson members_to_yojson x.members);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_group_members_request_to_yojson (x : list_group_members_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("GroupId", Some (entity_identifier_to_yojson x.group_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_groups_response_to_yojson (x : list_groups_response) =
  assoc_to_yojson
    [
      ("Groups", option_to_yojson groups_to_yojson x.groups);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_groups_filters_to_yojson (x : list_groups_filters) =
  assoc_to_yojson
    [
      ("NamePrefix", option_to_yojson string__to_yojson x.name_prefix);
      ("PrimaryEmailPrefix", option_to_yojson string__to_yojson x.primary_email_prefix);
      ("State", option_to_yojson entity_state_to_yojson x.state);
    ]

let list_groups_request_to_yojson (x : list_groups_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Filters", option_to_yojson list_groups_filters_to_yojson x.filters);
    ]

let list_groups_for_entity_response_to_yojson (x : list_groups_for_entity_response) =
  assoc_to_yojson
    [
      ("Groups", option_to_yojson group_identifiers_to_yojson x.groups);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_groups_for_entity_filters_to_yojson (x : list_groups_for_entity_filters) =
  assoc_to_yojson [ ("GroupNamePrefix", option_to_yojson string__to_yojson x.group_name_prefix) ]

let list_groups_for_entity_request_to_yojson (x : list_groups_for_entity_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("EntityId", Some (entity_identifier_to_yojson x.entity_id));
      ("Filters", option_to_yojson list_groups_for_entity_filters_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_impersonation_roles_response_to_yojson (x : list_impersonation_roles_response) =
  assoc_to_yojson
    [
      ("Roles", option_to_yojson impersonation_role_list_to_yojson x.roles);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_impersonation_roles_request_to_yojson (x : list_impersonation_roles_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let mail_domain_summary_to_yojson (x : mail_domain_summary) =
  assoc_to_yojson
    [
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("DefaultDomain", option_to_yojson boolean__to_yojson x.default_domain);
    ]

let mail_domains_to_yojson tree = list_to_yojson mail_domain_summary_to_yojson tree

let list_mail_domains_response_to_yojson (x : list_mail_domains_response) =
  assoc_to_yojson
    [
      ("MailDomains", option_to_yojson mail_domains_to_yojson x.mail_domains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_mail_domains_request_to_yojson (x : list_mail_domains_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_mailbox_export_jobs_response_to_yojson (x : list_mailbox_export_jobs_response) =
  assoc_to_yojson
    [
      ("Jobs", option_to_yojson jobs_to_yojson x.jobs);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_mailbox_export_jobs_request_to_yojson (x : list_mailbox_export_jobs_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let permission_type_to_yojson (x : permission_type) =
  match x with
  | FULL_ACCESS -> `String "FULL_ACCESS"
  | SEND_AS -> `String "SEND_AS"
  | SEND_ON_BEHALF -> `String "SEND_ON_BEHALF"

let permission_values_to_yojson tree = list_to_yojson permission_type_to_yojson tree

let permission_to_yojson (x : permission) =
  assoc_to_yojson
    [
      ("GranteeId", Some (work_mail_identifier_to_yojson x.grantee_id));
      ("GranteeType", Some (member_type_to_yojson x.grantee_type));
      ("PermissionValues", Some (permission_values_to_yojson x.permission_values));
    ]

let permissions_to_yojson tree = list_to_yojson permission_to_yojson tree

let list_mailbox_permissions_response_to_yojson (x : list_mailbox_permissions_response) =
  assoc_to_yojson
    [
      ("Permissions", option_to_yojson permissions_to_yojson x.permissions);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_mailbox_permissions_request_to_yojson (x : list_mailbox_permissions_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("EntityId", Some (entity_identifier_to_yojson x.entity_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let mobile_device_access_override_to_yojson (x : mobile_device_access_override) =
  assoc_to_yojson
    [
      ("UserId", option_to_yojson work_mail_identifier_to_yojson x.user_id);
      ("DeviceId", option_to_yojson device_id_to_yojson x.device_id);
      ("Effect", option_to_yojson mobile_device_access_rule_effect_to_yojson x.effect_);
      ("Description", option_to_yojson mobile_device_access_rule_description_to_yojson x.description);
      ("DateCreated", option_to_yojson timestamp_to_yojson x.date_created);
      ("DateModified", option_to_yojson timestamp_to_yojson x.date_modified);
    ]

let mobile_device_access_overrides_list_to_yojson tree =
  list_to_yojson mobile_device_access_override_to_yojson tree

let list_mobile_device_access_overrides_response_to_yojson
    (x : list_mobile_device_access_overrides_response) =
  assoc_to_yojson
    [
      ("Overrides", option_to_yojson mobile_device_access_overrides_list_to_yojson x.overrides);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_mobile_device_access_overrides_request_to_yojson
    (x : list_mobile_device_access_overrides_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("UserId", option_to_yojson entity_identifier_to_yojson x.user_id);
      ("DeviceId", option_to_yojson device_id_to_yojson x.device_id);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let mobile_device_access_rule_to_yojson (x : mobile_device_access_rule) =
  assoc_to_yojson
    [
      ( "MobileDeviceAccessRuleId",
        option_to_yojson mobile_device_access_rule_id_to_yojson x.mobile_device_access_rule_id );
      ("Name", option_to_yojson mobile_device_access_rule_name_to_yojson x.name);
      ("Description", option_to_yojson mobile_device_access_rule_description_to_yojson x.description);
      ("Effect", option_to_yojson mobile_device_access_rule_effect_to_yojson x.effect_);
      ("DeviceTypes", option_to_yojson device_type_list_to_yojson x.device_types);
      ("NotDeviceTypes", option_to_yojson device_type_list_to_yojson x.not_device_types);
      ("DeviceModels", option_to_yojson device_model_list_to_yojson x.device_models);
      ("NotDeviceModels", option_to_yojson device_model_list_to_yojson x.not_device_models);
      ( "DeviceOperatingSystems",
        option_to_yojson device_operating_system_list_to_yojson x.device_operating_systems );
      ( "NotDeviceOperatingSystems",
        option_to_yojson device_operating_system_list_to_yojson x.not_device_operating_systems );
      ("DeviceUserAgents", option_to_yojson device_user_agent_list_to_yojson x.device_user_agents);
      ( "NotDeviceUserAgents",
        option_to_yojson device_user_agent_list_to_yojson x.not_device_user_agents );
      ("DateCreated", option_to_yojson timestamp_to_yojson x.date_created);
      ("DateModified", option_to_yojson timestamp_to_yojson x.date_modified);
    ]

let mobile_device_access_rules_list_to_yojson tree =
  list_to_yojson mobile_device_access_rule_to_yojson tree

let list_mobile_device_access_rules_response_to_yojson
    (x : list_mobile_device_access_rules_response) =
  assoc_to_yojson [ ("Rules", option_to_yojson mobile_device_access_rules_list_to_yojson x.rules) ]

let list_mobile_device_access_rules_request_to_yojson (x : list_mobile_device_access_rules_request)
    =
  assoc_to_yojson [ ("OrganizationId", Some (organization_id_to_yojson x.organization_id)) ]

let organization_summary_to_yojson (x : organization_summary) =
  assoc_to_yojson
    [
      ("OrganizationId", option_to_yojson organization_id_to_yojson x.organization_id);
      ("Alias", option_to_yojson organization_name_to_yojson x.alias);
      ("DefaultMailDomain", option_to_yojson domain_name_to_yojson x.default_mail_domain);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("State", option_to_yojson string__to_yojson x.state);
    ]

let organization_summaries_to_yojson tree = list_to_yojson organization_summary_to_yojson tree

let list_organizations_response_to_yojson (x : list_organizations_response) =
  assoc_to_yojson
    [
      ( "OrganizationSummaries",
        option_to_yojson organization_summaries_to_yojson x.organization_summaries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_organizations_request_to_yojson (x : list_organizations_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let personal_access_token_summary_to_yojson (x : personal_access_token_summary) =
  assoc_to_yojson
    [
      ( "PersonalAccessTokenId",
        option_to_yojson personal_access_token_id_to_yojson x.personal_access_token_id );
      ("UserId", option_to_yojson work_mail_identifier_to_yojson x.user_id);
      ("Name", option_to_yojson personal_access_token_name_to_yojson x.name);
      ("DateCreated", option_to_yojson timestamp_to_yojson x.date_created);
      ("DateLastUsed", option_to_yojson timestamp_to_yojson x.date_last_used);
      ("ExpiresTime", option_to_yojson timestamp_to_yojson x.expires_time);
      ("Scopes", option_to_yojson personal_access_token_scope_list_to_yojson x.scopes);
    ]

let personal_access_token_summary_list_to_yojson tree =
  list_to_yojson personal_access_token_summary_to_yojson tree

let list_personal_access_tokens_response_to_yojson (x : list_personal_access_tokens_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "PersonalAccessTokenSummaries",
        option_to_yojson personal_access_token_summary_list_to_yojson
          x.personal_access_token_summaries );
    ]

let list_personal_access_tokens_request_to_yojson (x : list_personal_access_tokens_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("UserId", option_to_yojson entity_identifier_to_yojson x.user_id);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let resource_delegates_to_yojson tree = list_to_yojson delegate_to_yojson tree

let list_resource_delegates_response_to_yojson (x : list_resource_delegates_response) =
  assoc_to_yojson
    [
      ("Delegates", option_to_yojson resource_delegates_to_yojson x.delegates);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_resource_delegates_request_to_yojson (x : list_resource_delegates_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("ResourceId", Some (entity_identifier_to_yojson x.resource_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let resource_to_yojson (x : resource) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson work_mail_identifier_to_yojson x.id);
      ("Email", option_to_yojson email_address_to_yojson x.email);
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("Type", option_to_yojson resource_type_to_yojson x.type_);
      ("State", option_to_yojson entity_state_to_yojson x.state);
      ("EnabledDate", option_to_yojson timestamp_to_yojson x.enabled_date);
      ("DisabledDate", option_to_yojson timestamp_to_yojson x.disabled_date);
      ("Description", option_to_yojson resource_description_to_yojson x.description);
    ]

let resources_to_yojson tree = list_to_yojson resource_to_yojson tree

let list_resources_response_to_yojson (x : list_resources_response) =
  assoc_to_yojson
    [
      ("Resources", option_to_yojson resources_to_yojson x.resources);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_resources_filters_to_yojson (x : list_resources_filters) =
  assoc_to_yojson
    [
      ("NamePrefix", option_to_yojson string__to_yojson x.name_prefix);
      ("PrimaryEmailPrefix", option_to_yojson string__to_yojson x.primary_email_prefix);
      ("State", option_to_yojson entity_state_to_yojson x.state);
    ]

let list_resources_request_to_yojson (x : list_resources_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Filters", option_to_yojson list_resources_filters_to_yojson x.filters);
    ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let user_to_yojson (x : user) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson work_mail_identifier_to_yojson x.id);
      ("Email", option_to_yojson email_address_to_yojson x.email);
      ("Name", option_to_yojson user_name_to_yojson x.name);
      ("DisplayName", option_to_yojson string__to_yojson x.display_name);
      ("State", option_to_yojson entity_state_to_yojson x.state);
      ("UserRole", option_to_yojson user_role_to_yojson x.user_role);
      ("EnabledDate", option_to_yojson timestamp_to_yojson x.enabled_date);
      ("DisabledDate", option_to_yojson timestamp_to_yojson x.disabled_date);
      ( "IdentityProviderUserId",
        option_to_yojson identity_provider_user_id_to_yojson x.identity_provider_user_id );
      ( "IdentityProviderIdentityStoreId",
        option_to_yojson identity_provider_identity_store_id_to_yojson
          x.identity_provider_identity_store_id );
    ]

let users_to_yojson tree = list_to_yojson user_to_yojson tree

let list_users_response_to_yojson (x : list_users_response) =
  assoc_to_yojson
    [
      ("Users", option_to_yojson users_to_yojson x.users);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_users_filters_to_yojson (x : list_users_filters) =
  assoc_to_yojson
    [
      ("UsernamePrefix", option_to_yojson string__to_yojson x.username_prefix);
      ("DisplayNamePrefix", option_to_yojson user_attribute_to_yojson x.display_name_prefix);
      ("PrimaryEmailPrefix", option_to_yojson string__to_yojson x.primary_email_prefix);
      ("State", option_to_yojson entity_state_to_yojson x.state);
      ( "IdentityProviderUserIdPrefix",
        option_to_yojson identity_provider_user_id_prefix_to_yojson
          x.identity_provider_user_id_prefix );
    ]

let list_users_request_to_yojson (x : list_users_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Filters", option_to_yojson list_users_filters_to_yojson x.filters);
    ]

let new_resource_description_to_yojson = string_to_yojson
let policy_description_to_yojson = string_to_yojson
let put_access_control_rule_response_to_yojson = unit_to_yojson

let put_access_control_rule_request_to_yojson (x : put_access_control_rule_request) =
  assoc_to_yojson
    [
      ("Name", Some (access_control_rule_name_to_yojson x.name));
      ("Effect", Some (access_control_rule_effect_to_yojson x.effect_));
      ("Description", Some (access_control_rule_description_to_yojson x.description));
      ("IpRanges", option_to_yojson ip_range_list_to_yojson x.ip_ranges);
      ("NotIpRanges", option_to_yojson ip_range_list_to_yojson x.not_ip_ranges);
      ("Actions", option_to_yojson actions_list_to_yojson x.actions);
      ("NotActions", option_to_yojson actions_list_to_yojson x.not_actions);
      ("UserIds", option_to_yojson user_id_list_to_yojson x.user_ids);
      ("NotUserIds", option_to_yojson user_id_list_to_yojson x.not_user_ids);
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ( "ImpersonationRoleIds",
        option_to_yojson impersonation_role_id_list_to_yojson x.impersonation_role_ids );
      ( "NotImpersonationRoleIds",
        option_to_yojson impersonation_role_id_list_to_yojson x.not_impersonation_role_ids );
    ]

let put_email_monitoring_configuration_response_to_yojson = unit_to_yojson

let put_email_monitoring_configuration_request_to_yojson
    (x : put_email_monitoring_configuration_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("LogGroupArn", Some (log_group_arn_to_yojson x.log_group_arn));
    ]

let put_identity_provider_configuration_response_to_yojson = unit_to_yojson

let put_identity_provider_configuration_request_to_yojson
    (x : put_identity_provider_configuration_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ( "AuthenticationMode",
        Some (identity_provider_authentication_mode_to_yojson x.authentication_mode) );
      ( "IdentityCenterConfiguration",
        Some (identity_center_configuration_to_yojson x.identity_center_configuration) );
      ( "PersonalAccessTokenConfiguration",
        Some (personal_access_token_configuration_to_yojson x.personal_access_token_configuration)
      );
    ]

let put_inbound_dmarc_settings_response_to_yojson = unit_to_yojson

let put_inbound_dmarc_settings_request_to_yojson (x : put_inbound_dmarc_settings_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("Enforced", Some (boolean_object_to_yojson x.enforced));
    ]

let put_mailbox_permissions_response_to_yojson = unit_to_yojson

let put_mailbox_permissions_request_to_yojson (x : put_mailbox_permissions_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("EntityId", Some (entity_identifier_to_yojson x.entity_id));
      ("GranteeId", Some (entity_identifier_to_yojson x.grantee_id));
      ("PermissionValues", Some (permission_values_to_yojson x.permission_values));
    ]

let put_mobile_device_access_override_response_to_yojson = unit_to_yojson

let put_mobile_device_access_override_request_to_yojson
    (x : put_mobile_device_access_override_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("UserId", Some (entity_identifier_to_yojson x.user_id));
      ("DeviceId", Some (device_id_to_yojson x.device_id));
      ("Effect", Some (mobile_device_access_rule_effect_to_yojson x.effect_));
      ("Description", option_to_yojson mobile_device_access_rule_description_to_yojson x.description);
    ]

let put_retention_policy_response_to_yojson = unit_to_yojson

let put_retention_policy_request_to_yojson (x : put_retention_policy_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("Id", option_to_yojson short_string_to_yojson x.id);
      ("Name", Some (short_string_to_yojson x.name));
      ("Description", option_to_yojson policy_description_to_yojson x.description);
      ("FolderConfigurations", Some (folder_configurations_to_yojson x.folder_configurations));
    ]

let register_mail_domain_response_to_yojson = unit_to_yojson

let register_mail_domain_request_to_yojson (x : register_mail_domain_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (idempotency_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("DomainName", Some (work_mail_domain_name_to_yojson x.domain_name));
    ]

let register_to_work_mail_response_to_yojson = unit_to_yojson

let register_to_work_mail_request_to_yojson (x : register_to_work_mail_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("EntityId", Some (entity_identifier_to_yojson x.entity_id));
      ("Email", Some (email_address_to_yojson x.email));
    ]

let reset_password_response_to_yojson = unit_to_yojson

let reset_password_request_to_yojson (x : reset_password_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("UserId", Some (work_mail_identifier_to_yojson x.user_id));
      ("Password", Some (password_to_yojson x.password));
    ]

let start_mailbox_export_job_response_to_yojson (x : start_mailbox_export_job_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson mailbox_export_job_id_to_yojson x.job_id) ]

let start_mailbox_export_job_request_to_yojson (x : start_mailbox_export_job_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (idempotency_client_token_to_yojson x.client_token));
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("EntityId", Some (entity_identifier_to_yojson x.entity_id));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("KmsKeyArn", Some (kms_key_arn_to_yojson x.kms_key_arn));
      ("S3BucketName", Some (s3_bucket_name_to_yojson x.s3_bucket_name));
      ("S3Prefix", Some (s3_object_key_to_yojson x.s3_prefix));
    ]

let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let test_availability_configuration_response_to_yojson
    (x : test_availability_configuration_response) =
  assoc_to_yojson
    [
      ("TestPassed", option_to_yojson boolean__to_yojson x.test_passed);
      ("FailureReason", option_to_yojson string__to_yojson x.failure_reason);
    ]

let test_availability_configuration_request_to_yojson (x : test_availability_configuration_request)
    =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("EwsProvider", option_to_yojson ews_availability_provider_to_yojson x.ews_provider);
      ("LambdaProvider", option_to_yojson lambda_availability_provider_to_yojson x.lambda_provider);
    ]

let untag_resource_response_to_yojson = unit_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let update_availability_configuration_response_to_yojson = unit_to_yojson

let update_availability_configuration_request_to_yojson
    (x : update_availability_configuration_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("EwsProvider", option_to_yojson ews_availability_provider_to_yojson x.ews_provider);
      ("LambdaProvider", option_to_yojson lambda_availability_provider_to_yojson x.lambda_provider);
    ]

let update_default_mail_domain_response_to_yojson = unit_to_yojson

let update_default_mail_domain_request_to_yojson (x : update_default_mail_domain_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("DomainName", Some (work_mail_domain_name_to_yojson x.domain_name));
    ]

let update_group_response_to_yojson = unit_to_yojson

let update_group_request_to_yojson (x : update_group_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("GroupId", Some (entity_identifier_to_yojson x.group_id));
      ( "HiddenFromGlobalAddressList",
        option_to_yojson boolean_object_to_yojson x.hidden_from_global_address_list );
    ]

let update_impersonation_role_response_to_yojson = unit_to_yojson

let update_impersonation_role_request_to_yojson (x : update_impersonation_role_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("ImpersonationRoleId", Some (impersonation_role_id_to_yojson x.impersonation_role_id));
      ("Name", Some (impersonation_role_name_to_yojson x.name));
      ("Type", Some (impersonation_role_type_to_yojson x.type_));
      ("Description", option_to_yojson impersonation_role_description_to_yojson x.description);
      ("Rules", Some (impersonation_rule_list_to_yojson x.rules));
    ]

let update_mailbox_quota_response_to_yojson = unit_to_yojson

let update_mailbox_quota_request_to_yojson (x : update_mailbox_quota_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("UserId", Some (entity_identifier_to_yojson x.user_id));
      ("MailboxQuota", Some (mailbox_quota_to_yojson x.mailbox_quota));
    ]

let update_mobile_device_access_rule_response_to_yojson = unit_to_yojson

let update_mobile_device_access_rule_request_to_yojson
    (x : update_mobile_device_access_rule_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ( "MobileDeviceAccessRuleId",
        Some (mobile_device_access_rule_id_to_yojson x.mobile_device_access_rule_id) );
      ("Name", Some (mobile_device_access_rule_name_to_yojson x.name));
      ("Description", option_to_yojson mobile_device_access_rule_description_to_yojson x.description);
      ("Effect", Some (mobile_device_access_rule_effect_to_yojson x.effect_));
      ("DeviceTypes", option_to_yojson device_type_list_to_yojson x.device_types);
      ("NotDeviceTypes", option_to_yojson device_type_list_to_yojson x.not_device_types);
      ("DeviceModels", option_to_yojson device_model_list_to_yojson x.device_models);
      ("NotDeviceModels", option_to_yojson device_model_list_to_yojson x.not_device_models);
      ( "DeviceOperatingSystems",
        option_to_yojson device_operating_system_list_to_yojson x.device_operating_systems );
      ( "NotDeviceOperatingSystems",
        option_to_yojson device_operating_system_list_to_yojson x.not_device_operating_systems );
      ("DeviceUserAgents", option_to_yojson device_user_agent_list_to_yojson x.device_user_agents);
      ( "NotDeviceUserAgents",
        option_to_yojson device_user_agent_list_to_yojson x.not_device_user_agents );
    ]

let update_primary_email_address_response_to_yojson = unit_to_yojson

let update_primary_email_address_request_to_yojson (x : update_primary_email_address_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("EntityId", Some (entity_identifier_to_yojson x.entity_id));
      ("Email", Some (email_address_to_yojson x.email));
    ]

let update_resource_response_to_yojson = unit_to_yojson

let update_resource_request_to_yojson (x : update_resource_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("ResourceId", Some (entity_identifier_to_yojson x.resource_id));
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("BookingOptions", option_to_yojson booking_options_to_yojson x.booking_options);
      ("Description", option_to_yojson new_resource_description_to_yojson x.description);
      ("Type", option_to_yojson resource_type_to_yojson x.type_);
      ( "HiddenFromGlobalAddressList",
        option_to_yojson boolean_object_to_yojson x.hidden_from_global_address_list );
    ]

let update_user_response_to_yojson = unit_to_yojson

let update_user_request_to_yojson (x : update_user_request) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("UserId", Some (entity_identifier_to_yojson x.user_id));
      ("Role", option_to_yojson user_role_to_yojson x.role);
      ("DisplayName", option_to_yojson user_attribute_to_yojson x.display_name);
      ("FirstName", option_to_yojson user_attribute_to_yojson x.first_name);
      ("LastName", option_to_yojson user_attribute_to_yojson x.last_name);
      ( "HiddenFromGlobalAddressList",
        option_to_yojson boolean_object_to_yojson x.hidden_from_global_address_list );
      ("Initials", option_to_yojson user_attribute_to_yojson x.initials);
      ("Telephone", option_to_yojson user_attribute_to_yojson x.telephone);
      ("Street", option_to_yojson user_attribute_to_yojson x.street);
      ("JobTitle", option_to_yojson user_attribute_to_yojson x.job_title);
      ("City", option_to_yojson user_attribute_to_yojson x.city);
      ("Company", option_to_yojson user_attribute_to_yojson x.company);
      ("ZipCode", option_to_yojson user_attribute_to_yojson x.zip_code);
      ("Department", option_to_yojson user_attribute_to_yojson x.department);
      ("Country", option_to_yojson user_attribute_to_yojson x.country);
      ("Office", option_to_yojson user_attribute_to_yojson x.office);
      ( "IdentityProviderUserId",
        option_to_yojson identity_provider_user_id_for_update_to_yojson x.identity_provider_user_id
      );
    ]
