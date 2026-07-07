open Smaws_Lib.Json.SerializeHelpers
open Types

let responsibility_transfer_arn_to_yojson = string_to_yojson
let responsibility_transfer_name_to_yojson = string_to_yojson
let responsibility_transfer_id_to_yojson = string_to_yojson

let responsibility_transfer_type_to_yojson (x : responsibility_transfer_type) =
  match x with BILLING -> `String "BILLING"

let responsibility_transfer_status_to_yojson (x : responsibility_transfer_status) =
  match x with
  | WITHDRAWN -> `String "WITHDRAWN"
  | ACCEPTED -> `String "ACCEPTED"
  | EXPIRED -> `String "EXPIRED"
  | CANCELED -> `String "CANCELED"
  | DECLINED -> `String "DECLINED"
  | REQUESTED -> `String "REQUESTED"

let account_id_to_yojson = string_to_yojson
let email_to_yojson = string_to_yojson

let transfer_participant_to_yojson (x : transfer_participant) =
  assoc_to_yojson
    [
      ("ManagementAccountEmail", option_to_yojson email_to_yojson x.management_account_email);
      ("ManagementAccountId", option_to_yojson account_id_to_yojson x.management_account_id);
    ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let handshake_id_to_yojson = string_to_yojson

let responsibility_transfer_to_yojson (x : responsibility_transfer) =
  assoc_to_yojson
    [
      ("ActiveHandshakeId", option_to_yojson handshake_id_to_yojson x.active_handshake_id);
      ("EndTimestamp", option_to_yojson timestamp_to_yojson x.end_timestamp);
      ("StartTimestamp", option_to_yojson timestamp_to_yojson x.start_timestamp);
      ("Target", option_to_yojson transfer_participant_to_yojson x.target);
      ("Source", option_to_yojson transfer_participant_to_yojson x.source);
      ("Status", option_to_yojson responsibility_transfer_status_to_yojson x.status);
      ("Type", option_to_yojson responsibility_transfer_type_to_yojson x.type_);
      ("Id", option_to_yojson responsibility_transfer_id_to_yojson x.id);
      ("Name", option_to_yojson responsibility_transfer_name_to_yojson x.name);
      ("Arn", option_to_yojson responsibility_transfer_arn_to_yojson x.arn);
    ]

let update_responsibility_transfer_response_to_yojson (x : update_responsibility_transfer_response)
    =
  assoc_to_yojson
    [
      ( "ResponsibilityTransfer",
        option_to_yojson responsibility_transfer_to_yojson x.responsibility_transfer );
    ]

let update_responsibility_transfer_request_to_yojson (x : update_responsibility_transfer_request) =
  assoc_to_yojson
    [
      ("Name", Some (responsibility_transfer_name_to_yojson x.name));
      ("Id", Some (responsibility_transfer_id_to_yojson x.id));
    ]

let exception_message_to_yojson = string_to_yojson

let unsupported_api_endpoint_exception_to_yojson (x : unsupported_api_endpoint_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let exception_type_to_yojson = string_to_yojson

let too_many_requests_exception_to_yojson (x : too_many_requests_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("Type", option_to_yojson exception_type_to_yojson x.type_);
    ]

let service_exception_to_yojson (x : service_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let responsibility_transfer_not_found_exception_to_yojson
    (x : responsibility_transfer_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_input_exception_reason_to_yojson (x : invalid_input_exception_reason) =
  match x with
  | INVALID_END_DATE -> `String "INVALID_END_DATE"
  | END_DATE_TOO_EARLY -> `String "END_DATE_TOO_EARLY"
  | END_DATE_NOT_END_OF_MONTH -> `String "END_DATE_NOT_END_OF_MONTH"
  | INVALID_START_DATE -> `String "INVALID_START_DATE"
  | START_DATE_TOO_LATE -> `String "START_DATE_TOO_LATE"
  | START_DATE_TOO_EARLY -> `String "START_DATE_TOO_EARLY"
  | START_DATE_NOT_BEGINNING_OF_DAY -> `String "START_DATE_NOT_BEGINNING_OF_DAY"
  | START_DATE_NOT_BEGINNING_OF_MONTH -> `String "START_DATE_NOT_BEGINNING_OF_MONTH"
  | UNSUPPORTED_ACTION_IN_RESPONSIBILITY_TRANSFER ->
      `String "UNSUPPORTED_ACTION_IN_RESPONSIBILITY_TRANSFER"
  | CALLER_REQUIRED_FIELD_MISSING -> `String "CALLER_REQUIRED_FIELD_MISSING"
  | NON_DETACHABLE_POLICY -> `String "NON_DETACHABLE_POLICY"
  | UNSUPPORTED_RESOURCE_IN_RESOURCE_POLICY -> `String "UNSUPPORTED_RESOURCE_IN_RESOURCE_POLICY"
  | UNSUPPORTED_POLICY_TYPE_IN_RESOURCE_POLICY ->
      `String "UNSUPPORTED_POLICY_TYPE_IN_RESOURCE_POLICY"
  | UNSUPPORTED_ACTION_IN_RESOURCE_POLICY -> `String "UNSUPPORTED_ACTION_IN_RESOURCE_POLICY"
  | INVALID_PRINCIPAL -> `String "INVALID_PRINCIPAL"
  | INVALID_RESOURCE_POLICY_JSON -> `String "INVALID_RESOURCE_POLICY_JSON"
  | INVALID_EMAIL_ADDRESS_TARGET -> `String "INVALID_EMAIL_ADDRESS_TARGET"
  | TARGET_NOT_SUPPORTED -> `String "TARGET_NOT_SUPPORTED"
  | DUPLICATE_TAG_KEY -> `String "DUPLICATE_TAG_KEY"
  | INVALID_SYSTEM_TAGS_PARAMETER -> `String "INVALID_SYSTEM_TAGS_PARAMETER"
  | INVALID_ROLE_NAME -> `String "INVALID_ROLE_NAME"
  | UNRECOGNIZED_SERVICE_PRINCIPAL -> `String "UNRECOGNIZED_SERVICE_PRINCIPAL"
  | INVALID_FULL_NAME_TARGET -> `String "INVALID_FULL_NAME_TARGET"
  | MOVING_ACCOUNT_BETWEEN_DIFFERENT_ROOTS -> `String "MOVING_ACCOUNT_BETWEEN_DIFFERENT_ROOTS"
  | MAX_FILTER_LIMIT_EXCEEDED -> `String "MAX_LIMIT_EXCEEDED_FILTER"
  | INVALID_PAGINATION_TOKEN -> `String "INVALID_NEXT_TOKEN"
  | INPUT_REQUIRED -> `String "INPUT_REQUIRED"
  | INVALID_PATTERN_TARGET_ID -> `String "INVALID_PATTERN_TARGET_ID"
  | INVALID_PATTERN -> `String "INVALID_PATTERN"
  | IMMUTABLE_POLICY -> `String "IMMUTABLE_POLICY"
  | MIN_VALUE_EXCEEDED -> `String "MIN_VALUE_EXCEEDED"
  | MIN_LENGTH_EXCEEDED -> `String "MIN_LENGTH_EXCEEDED"
  | MAX_VALUE_EXCEEDED -> `String "MAX_VALUE_EXCEEDED"
  | MAX_LENGTH_EXCEEDED -> `String "MAX_LENGTH_EXCEEDED"
  | INVALID_LIST_MEMBER -> `String "INVALID_LIST_MEMBER"
  | INVALID_ENUM_POLICY_TYPE -> `String "INVALID_ENUM_POLICY_TYPE"
  | INVALID_ENUM -> `String "INVALID_ENUM"
  | INVALID_SYNTAX_POLICY -> `String "INVALID_SYNTAX_POLICY_ID"
  | INVALID_SYNTAX_ORGANIZATION -> `String "INVALID_SYNTAX_ORGANIZATION_ARN"
  | INVALID_PARTY_TYPE_TARGET -> `String "INVALID_PARTY_TYPE_TARGET"

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson invalid_input_exception_reason_to_yojson x.reason);
      ("Message", option_to_yojson exception_message_to_yojson x.message);
    ]

let constraint_violation_exception_reason_to_yojson (x : constraint_violation_exception_reason) =
  match x with
  | UNSUPPORTED_PRICING -> `String "UNSUPPORTED_PRICING"
  | TRANSFER_RESPONSIBILITY_SOURCE_DELETION_IN_PROGRESS ->
      `String "TRANSFER_RESPONSIBILITY_SOURCE_DELETION_IN_PROGRESS"
  | TRANSFER_RESPONSIBILITY_TARGET_DELETION_IN_PROGRESS ->
      `String "TRANSFER_RESPONSIBILITY_TARGET_DELETION_IN_PROGRESS"
  | ACTIVE_RESPONSIBILITY_TRANSFER_PROCESS -> `String "ACTIVE_RESPONSIBILITY_TRANSFER_PROCESS"
  | RESPONSIBILITY_TRANSFER_MAX_TRANSFERS_QUOTA_VIOLATION ->
      `String "RESPONSIBILITY_TRANSFER_MAX_TRANSFERS_QUOTA_VIOLATION"
  | RESPONSIBILITY_TRANSFER_MAX_OUTBOUND_QUOTA_VIOLATION ->
      `String "RESPONSIBILITY_TRANSFER_MAX_OUTBOUND_QUOTA_VIOLATION"
  | RESPONSIBILITY_TRANSFER_MAX_INBOUND_QUOTA_VIOLATION ->
      `String "RESPONSIBILITY_TRANSFER_MAX_INBOUND_QUOTA_VIOLATION"
  | RESPONSIBILITY_TRANSFER_MAX_LEVEL_VIOLATION ->
      `String "RESPONSIBILITY_TRANSFER_MAX_LEVEL_VIOLATION"
  | ALL_FEATURES_MIGRATION_ORGANIZATION_SIZE_LIMIT_EXCEEDED ->
      `String "ALL_FEATURES_MIGRATION_ORGANIZATION_SIZE_LIMIT_EXCEEDED"
  | CANNOT_REGISTER_SUSPENDED_ACCOUNT_AS_DELEGATED_ADMINISTRATOR ->
      `String "CANNOT_REGISTER_SUSPENDED_ACCOUNT_AS_DELEGATED_ADMINISTRATOR"
  | ACCOUNT_CREATION_NOT_COMPLETE -> `String "ACCOUNT_CREATION_NOT_COMPLETE"
  | INVALID_PAYMENT_INSTRUMENT -> `String "INVALID_PAYMENT_INSTRUMENT"
  | SERVICE_ACCESS_NOT_ENABLED -> `String "SERVICE_ACCESS_NOT_ENABLED"
  | CLOSE_ACCOUNT_REQUESTS_LIMIT_EXCEEDED -> `String "CLOSE_ACCOUNT_REQUESTS_LIMIT_EXCEEDED"
  | CLOSE_ACCOUNT_QUOTA_EXCEEDED -> `String "CLOSE_ACCOUNT_QUOTA_EXCEEDED"
  | CANNOT_CLOSE_MANAGEMENT_ACCOUNT -> `String "CANNOT_CLOSE_MANAGEMENT_ACCOUNT"
  | MASTER_ACCOUNT_MISSING_BUSINESS_LICENSE -> `String "MASTER_ACCOUNT_MISSING_BUSINESS_LICENSE"
  | POLICY_TYPE_ENABLED_FOR_THIS_SERVICE -> `String "POLICY_TYPE_ENABLED_FOR_THIS_SERVICE"
  | DELEGATED_ADMINISTRATOR_EXISTS_FOR_THIS_SERVICE ->
      `String "DELEGATED_ADMINISTRATOR_EXISTS_FOR_THIS_SERVICE"
  | CANNOT_REMOVE_DELEGATED_ADMINISTRATOR_FROM_ORG ->
      `String "CANNOT_REMOVE_DELEGATED_ADMINISTRATOR_FROM_ORG"
  | CANNOT_REGISTER_MASTER_AS_DELEGATED_ADMINISTRATOR ->
      `String "CANNOT_REGISTER_MASTER_AS_DELEGATED_ADMINISTRATOR"
  | MAX_DELEGATED_ADMINISTRATORS_FOR_SERVICE_LIMIT_EXCEEDED ->
      `String "MAX_DELEGATED_ADMINISTRATORS_FOR_SERVICE_LIMIT_EXCEEDED"
  | TAG_POLICY_VIOLATION -> `String "TAG_POLICY_VIOLATION"
  | MAX_TAG_LIMIT_EXCEEDED -> `String "MAX_TAG_LIMIT_EXCEEDED"
  | WAIT_PERIOD_ACTIVE -> `String "WAIT_PERIOD_ACTIVE"
  | EMAIL_VERIFICATION_CODE_EXPIRED -> `String "EMAIL_VERIFICATION_CODE_EXPIRED"
  | CREATE_ORGANIZATION_IN_BILLING_MODE_UNSUPPORTED_REGION ->
      `String "CREATE_ORGANIZATION_IN_BILLING_MODE_UNSUPPORTED_REGION"
  | ORGANIZATION_NOT_IN_ALL_FEATURES_MODE -> `String "ORGANIZATION_NOT_IN_ALL_FEATURES_MODE"
  | MASTER_ACCOUNT_NOT_GOVCLOUD_ENABLED -> `String "MASTER_ACCOUNT_NOT_GOVCLOUD_ENABLED"
  | MASTER_ACCOUNT_MISSING_CONTACT_INFO -> `String "MASTER_ACCOUNT_MISSING_CONTACT_INFO"
  | MASTER_ACCOUNT_ADDRESS_DOES_NOT_MATCH_MARKETPLACE ->
      `String "MASTER_ACCOUNT_ADDRESS_DOES_NOT_MATCH_MARKETPLACE"
  | ACCOUNT_CREATION_RATE_LIMIT_EXCEEDED -> `String "ACCOUNT_CREATION_RATE_LIMIT_EXCEEDED"
  | MEMBER_ACCOUNT_PAYMENT_INSTRUMENT_REQUIRED ->
      `String "MEMBER_ACCOUNT_PAYMENT_INSTRUMENT_REQUIRED"
  | MASTER_ACCOUNT_PAYMENT_INSTRUMENT_REQUIRED ->
      `String "MASTER_ACCOUNT_PAYMENT_INSTRUMENT_REQUIRED"
  | ACCOUNT_CANNOT_LEAVE_WITHOUT_PHONE_VERIFICATION ->
      `String "ACCOUNT_CANNOT_LEAVE_WITHOUT_PHONE_VERIFICATION"
  | ACCOUNT_CANNOT_LEAVE_WITHOUT_EULA -> `String "ACCOUNT_CANNOT_LEAVE_WITHOUT_EULA"
  | ACCOUNT_CANNOT_LEAVE_ORGANIZATION -> `String "ACCOUNT_CANNOT_LEAVE_ORGANIZATION"
  | MIN_POLICY_TYPE_ATTACHMENT_LIMIT_EXCEEDED -> `String "MIN_POLICY_TYPE_ATTACHMENT_LIMIT_EXCEEDED"
  | MAX_POLICY_TYPE_ATTACHMENT_LIMIT_EXCEEDED -> `String "MAX_POLICY_TYPE_ATTACHMENT_LIMIT_EXCEEDED"
  | POLICY_CONTENT_LIMIT_EXCEEDED -> `String "POLICY_CONTENT_LIMIT_EXCEEDED"
  | POLICY_NUMBER_LIMIT_EXCEEDED -> `String "POLICY_NUMBER_LIMIT_EXCEEDED"
  | OU_DEPTH_LIMIT_EXCEEDED -> `String "OU_DEPTH_LIMIT_EXCEEDED"
  | OU_NUMBER_LIMIT_EXCEEDED -> `String "OU_NUMBER_LIMIT_EXCEEDED"
  | HANDSHAKE_RATE_LIMIT_EXCEEDED -> `String "HANDSHAKE_RATE_LIMIT_EXCEEDED"
  | ACCOUNT_NUMBER_LIMIT_EXCEEDED -> `String "ACCOUNT_NUMBER_LIMIT_EXCEEDED"

let constraint_violation_exception_to_yojson (x : constraint_violation_exception) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson constraint_violation_exception_reason_to_yojson x.reason);
      ("Message", option_to_yojson exception_message_to_yojson x.message);
    ]

let aws_organizations_not_in_use_exception_to_yojson (x : aws_organizations_not_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let policy_id_to_yojson = string_to_yojson
let policy_arn_to_yojson = string_to_yojson
let policy_name_to_yojson = string_to_yojson
let policy_description_to_yojson = string_to_yojson

let policy_type_to_yojson (x : policy_type) =
  match x with
  | NETWORK_SECURITY_DIRECTOR_POLICY -> `String "NETWORK_SECURITY_DIRECTOR_POLICY"
  | S3_POLICY -> `String "S3_POLICY"
  | BEDROCK_POLICY -> `String "BEDROCK_POLICY"
  | UPGRADE_ROLLOUT_POLICY -> `String "UPGRADE_ROLLOUT_POLICY"
  | INSPECTOR_POLICY -> `String "INSPECTOR_POLICY"
  | SECURITYHUB_POLICY -> `String "SECURITYHUB_POLICY"
  | DECLARATIVE_POLICY_EC2 -> `String "DECLARATIVE_POLICY_EC2"
  | CHATBOT_POLICY -> `String "CHATBOT_POLICY"
  | AISERVICES_OPT_OUT_POLICY -> `String "AISERVICES_OPT_OUT_POLICY"
  | BACKUP_POLICY -> `String "BACKUP_POLICY"
  | TAG_POLICY -> `String "TAG_POLICY"
  | RESOURCE_CONTROL_POLICY -> `String "RESOURCE_CONTROL_POLICY"
  | SERVICE_CONTROL_POLICY -> `String "SERVICE_CONTROL_POLICY"

let aws_managed_policy_to_yojson = bool_to_yojson

let policy_summary_to_yojson (x : policy_summary) =
  assoc_to_yojson
    [
      ("AwsManaged", option_to_yojson aws_managed_policy_to_yojson x.aws_managed);
      ("Type", option_to_yojson policy_type_to_yojson x.type_);
      ("Description", option_to_yojson policy_description_to_yojson x.description);
      ("Name", option_to_yojson policy_name_to_yojson x.name);
      ("Arn", option_to_yojson policy_arn_to_yojson x.arn);
      ("Id", option_to_yojson policy_id_to_yojson x.id);
    ]

let policy_content_to_yojson = string_to_yojson

let policy_to_yojson (x : policy) =
  assoc_to_yojson
    [
      ("Content", option_to_yojson policy_content_to_yojson x.content);
      ("PolicySummary", option_to_yojson policy_summary_to_yojson x.policy_summary);
    ]

let update_policy_response_to_yojson (x : update_policy_response) =
  assoc_to_yojson [ ("Policy", option_to_yojson policy_to_yojson x.policy) ]

let update_policy_request_to_yojson (x : update_policy_request) =
  assoc_to_yojson
    [
      ("Content", option_to_yojson policy_content_to_yojson x.content);
      ("Description", option_to_yojson policy_description_to_yojson x.description);
      ("Name", option_to_yojson policy_name_to_yojson x.name);
      ("PolicyId", Some (policy_id_to_yojson x.policy_id));
    ]

let policy_not_found_exception_to_yojson (x : policy_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let policy_changes_in_progress_exception_to_yojson (x : policy_changes_in_progress_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let malformed_policy_document_exception_to_yojson (x : malformed_policy_document_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let duplicate_policy_exception_to_yojson (x : duplicate_policy_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let organizational_unit_id_to_yojson = string_to_yojson
let organizational_unit_arn_to_yojson = string_to_yojson
let organizational_unit_name_to_yojson = string_to_yojson
let path_to_yojson = string_to_yojson

let organizational_unit_to_yojson (x : organizational_unit) =
  assoc_to_yojson
    [
      ("Path", option_to_yojson path_to_yojson x.path);
      ("Name", option_to_yojson organizational_unit_name_to_yojson x.name);
      ("Arn", option_to_yojson organizational_unit_arn_to_yojson x.arn);
      ("Id", option_to_yojson organizational_unit_id_to_yojson x.id);
    ]

let update_organizational_unit_response_to_yojson (x : update_organizational_unit_response) =
  assoc_to_yojson
    [ ("OrganizationalUnit", option_to_yojson organizational_unit_to_yojson x.organizational_unit) ]

let update_organizational_unit_request_to_yojson (x : update_organizational_unit_request) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson organizational_unit_name_to_yojson x.name);
      ("OrganizationalUnitId", Some (organizational_unit_id_to_yojson x.organizational_unit_id));
    ]

let organizational_unit_not_found_exception_to_yojson (x : organizational_unit_not_found_exception)
    =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let duplicate_organizational_unit_exception_to_yojson (x : duplicate_organizational_unit_exception)
    =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let taggable_resource_id_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_keys_to_yojson x.tag_keys));
      ("ResourceId", Some (taggable_resource_id_to_yojson x.resource_id));
    ]

let target_not_found_exception_to_yojson (x : target_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let terminate_responsibility_transfer_response_to_yojson
    (x : terminate_responsibility_transfer_response) =
  assoc_to_yojson
    [
      ( "ResponsibilityTransfer",
        option_to_yojson responsibility_transfer_to_yojson x.responsibility_transfer );
    ]

let terminate_responsibility_transfer_request_to_yojson
    (x : terminate_responsibility_transfer_request) =
  assoc_to_yojson
    [
      ("EndTimestamp", option_to_yojson timestamp_to_yojson x.end_timestamp);
      ("Id", Some (responsibility_transfer_id_to_yojson x.id));
    ]

let responsibility_transfer_already_in_status_exception_to_yojson
    (x : responsibility_transfer_already_in_status_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_responsibility_transfer_transition_exception_to_yojson
    (x : invalid_responsibility_transfer_transition_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let target_type_to_yojson (x : target_type) =
  match x with
  | ROOT -> `String "ROOT"
  | ORGANIZATIONAL_UNIT -> `String "ORGANIZATIONAL_UNIT"
  | ACCOUNT -> `String "ACCOUNT"

let target_name_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tags_to_yojson x.tags));
      ("ResourceId", Some (taggable_resource_id_to_yojson x.resource_id));
    ]

let source_parent_not_found_exception_to_yojson (x : source_parent_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let service_principal_to_yojson = string_to_yojson
let root_id_to_yojson = string_to_yojson
let root_arn_to_yojson = string_to_yojson
let root_name_to_yojson = string_to_yojson

let policy_type_status_to_yojson (x : policy_type_status) =
  match x with
  | PENDING_DISABLE -> `String "PENDING_DISABLE"
  | PENDING_ENABLE -> `String "PENDING_ENABLE"
  | ENABLED -> `String "ENABLED"

let policy_type_summary_to_yojson (x : policy_type_summary) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson policy_type_status_to_yojson x.status);
      ("Type", option_to_yojson policy_type_to_yojson x.type_);
    ]

let policy_types_to_yojson tree = list_to_yojson policy_type_summary_to_yojson tree

let root_to_yojson (x : root) =
  assoc_to_yojson
    [
      ("PolicyTypes", option_to_yojson policy_types_to_yojson x.policy_types);
      ("Name", option_to_yojson root_name_to_yojson x.name);
      ("Arn", option_to_yojson root_arn_to_yojson x.arn);
      ("Id", option_to_yojson root_id_to_yojson x.id);
    ]

let roots_to_yojson tree = list_to_yojson root_to_yojson tree

let root_not_found_exception_to_yojson (x : root_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let role_name_to_yojson = string_to_yojson
let responsibility_transfers_to_yojson tree = list_to_yojson responsibility_transfer_to_yojson tree
let resource_policy_id_to_yojson = string_to_yojson
let resource_policy_arn_to_yojson = string_to_yojson

let resource_policy_summary_to_yojson (x : resource_policy_summary) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson resource_policy_arn_to_yojson x.arn);
      ("Id", option_to_yojson resource_policy_id_to_yojson x.id);
    ]

let resource_policy_not_found_exception_to_yojson (x : resource_policy_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let resource_policy_content_to_yojson = string_to_yojson

let resource_policy_to_yojson (x : resource_policy) =
  assoc_to_yojson
    [
      ("Content", option_to_yojson resource_policy_content_to_yojson x.content);
      ( "ResourcePolicySummary",
        option_to_yojson resource_policy_summary_to_yojson x.resource_policy_summary );
    ]

let remove_account_from_organization_request_to_yojson
    (x : remove_account_from_organization_request) =
  assoc_to_yojson [ ("AccountId", Some (account_id_to_yojson x.account_id)) ]

let master_cannot_leave_organization_exception_to_yojson
    (x : master_cannot_leave_organization_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let account_not_found_exception_to_yojson (x : account_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let register_delegated_administrator_request_to_yojson
    (x : register_delegated_administrator_request) =
  assoc_to_yojson
    [
      ("ServicePrincipal", Some (service_principal_to_yojson x.service_principal));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let account_already_registered_exception_to_yojson (x : account_already_registered_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let put_resource_policy_response_to_yojson (x : put_resource_policy_response) =
  assoc_to_yojson
    [ ("ResourcePolicy", option_to_yojson resource_policy_to_yojson x.resource_policy) ]

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Content", Some (resource_policy_content_to_yojson x.content));
    ]

let policy_type_not_enabled_exception_to_yojson (x : policy_type_not_enabled_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let policy_type_not_available_for_organization_exception_to_yojson
    (x : policy_type_not_available_for_organization_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let policy_type_already_enabled_exception_to_yojson (x : policy_type_already_enabled_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let policy_target_id_to_yojson = string_to_yojson
let generic_arn_to_yojson = string_to_yojson

let policy_target_summary_to_yojson (x : policy_target_summary) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson target_type_to_yojson x.type_);
      ("Name", option_to_yojson target_name_to_yojson x.name);
      ("Arn", option_to_yojson generic_arn_to_yojson x.arn);
      ("TargetId", option_to_yojson policy_target_id_to_yojson x.target_id);
    ]

let policy_targets_to_yojson tree = list_to_yojson policy_target_summary_to_yojson tree

let policy_not_attached_exception_to_yojson (x : policy_not_attached_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let policy_in_use_exception_to_yojson (x : policy_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let policy_ids_to_yojson tree = list_to_yojson policy_id_to_yojson tree
let policies_to_yojson tree = list_to_yojson policy_summary_to_yojson tree
let paths_to_yojson tree = list_to_yojson path_to_yojson tree
let path_to_error_to_yojson = string_to_yojson
let parent_id_to_yojson = string_to_yojson

let parent_type_to_yojson (x : parent_type) =
  match x with ORGANIZATIONAL_UNIT -> `String "ORGANIZATIONAL_UNIT" | ROOT -> `String "ROOT"

let parent_to_yojson (x : parent) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson parent_type_to_yojson x.type_);
      ("Id", option_to_yojson parent_id_to_yojson x.id);
    ]

let parents_to_yojson tree = list_to_yojson parent_to_yojson tree

let parent_not_found_exception_to_yojson (x : parent_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let organizational_units_to_yojson tree = list_to_yojson organizational_unit_to_yojson tree

let organizational_unit_not_empty_exception_to_yojson (x : organizational_unit_not_empty_exception)
    =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let organization_not_empty_exception_to_yojson (x : organization_not_empty_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let organization_id_to_yojson = string_to_yojson

let organization_feature_set_to_yojson (x : organization_feature_set) =
  match x with CONSOLIDATED_BILLING -> `String "CONSOLIDATED_BILLING" | ALL -> `String "ALL"

let organization_arn_to_yojson = string_to_yojson
let account_arn_to_yojson = string_to_yojson

let organization_to_yojson (x : organization) =
  assoc_to_yojson
    [
      ("AvailablePolicyTypes", option_to_yojson policy_types_to_yojson x.available_policy_types);
      ("MasterAccountEmail", option_to_yojson email_to_yojson x.master_account_email);
      ("MasterAccountId", option_to_yojson account_id_to_yojson x.master_account_id);
      ("MasterAccountArn", option_to_yojson account_arn_to_yojson x.master_account_arn);
      ("FeatureSet", option_to_yojson organization_feature_set_to_yojson x.feature_set);
      ("Arn", option_to_yojson organization_arn_to_yojson x.arn);
      ("Id", option_to_yojson organization_id_to_yojson x.id);
    ]

let next_token_to_yojson = string_to_yojson

let move_account_request_to_yojson (x : move_account_request) =
  assoc_to_yojson
    [
      ("DestinationParentId", Some (parent_id_to_yojson x.destination_parent_id));
      ("SourceParentId", Some (parent_id_to_yojson x.source_parent_id));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let duplicate_account_exception_to_yojson (x : duplicate_account_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let destination_parent_not_found_exception_to_yojson (x : destination_parent_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let max_results_to_yojson = int_to_yojson

let list_targets_for_policy_response_to_yojson (x : list_targets_for_policy_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Targets", option_to_yojson policy_targets_to_yojson x.targets);
    ]

let list_targets_for_policy_request_to_yojson (x : list_targets_for_policy_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("PolicyId", Some (policy_id_to_yojson x.policy_id));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ResourceId", Some (taggable_resource_id_to_yojson x.resource_id));
    ]

let list_roots_response_to_yojson (x : list_roots_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Roots", option_to_yojson roots_to_yojson x.roots);
    ]

let list_roots_request_to_yojson (x : list_roots_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_policies_response_to_yojson (x : list_policies_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Policies", option_to_yojson policies_to_yojson x.policies);
    ]

let list_policies_request_to_yojson (x : list_policies_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filter", Some (policy_type_to_yojson x.filter));
    ]

let list_policies_for_target_response_to_yojson (x : list_policies_for_target_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Policies", option_to_yojson policies_to_yojson x.policies);
    ]

let list_policies_for_target_request_to_yojson (x : list_policies_for_target_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filter", Some (policy_type_to_yojson x.filter));
      ("TargetId", Some (policy_target_id_to_yojson x.target_id));
    ]

let list_parents_response_to_yojson (x : list_parents_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Parents", option_to_yojson parents_to_yojson x.parents);
    ]

let child_id_to_yojson = string_to_yojson

let list_parents_request_to_yojson (x : list_parents_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ChildId", Some (child_id_to_yojson x.child_id));
    ]

let child_not_found_exception_to_yojson (x : child_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let list_outbound_responsibility_transfers_response_to_yojson
    (x : list_outbound_responsibility_transfers_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ResponsibilityTransfers",
        option_to_yojson responsibility_transfers_to_yojson x.responsibility_transfers );
    ]

let list_outbound_responsibility_transfers_request_to_yojson
    (x : list_outbound_responsibility_transfers_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Type", Some (responsibility_transfer_type_to_yojson x.type_));
    ]

let list_organizational_units_for_parent_response_to_yojson
    (x : list_organizational_units_for_parent_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("OrganizationalUnits", option_to_yojson organizational_units_to_yojson x.organizational_units);
    ]

let list_organizational_units_for_parent_request_to_yojson
    (x : list_organizational_units_for_parent_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ParentId", Some (parent_id_to_yojson x.parent_id));
    ]

let list_inbound_responsibility_transfers_response_to_yojson
    (x : list_inbound_responsibility_transfers_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ResponsibilityTransfers",
        option_to_yojson responsibility_transfers_to_yojson x.responsibility_transfers );
    ]

let list_inbound_responsibility_transfers_request_to_yojson
    (x : list_inbound_responsibility_transfers_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Id", option_to_yojson responsibility_transfer_id_to_yojson x.id);
      ("Type", Some (responsibility_transfer_type_to_yojson x.type_));
    ]

let handshake_arn_to_yojson = string_to_yojson
let handshake_party_id_to_yojson = string_to_yojson

let handshake_party_type_to_yojson (x : handshake_party_type) =
  match x with
  | EMAIL -> `String "EMAIL"
  | ORGANIZATION -> `String "ORGANIZATION"
  | ACCOUNT -> `String "ACCOUNT"

let handshake_party_to_yojson (x : handshake_party) =
  assoc_to_yojson
    [
      ("Type", Some (handshake_party_type_to_yojson x.type_));
      ("Id", Some (handshake_party_id_to_yojson x.id));
    ]

let handshake_parties_to_yojson tree = list_to_yojson handshake_party_to_yojson tree

let handshake_state_to_yojson (x : handshake_state) =
  match x with
  | EXPIRED -> `String "EXPIRED"
  | DECLINED -> `String "DECLINED"
  | ACCEPTED -> `String "ACCEPTED"
  | CANCELED -> `String "CANCELED"
  | OPEN -> `String "OPEN"
  | REQUESTED -> `String "REQUESTED"

let action_type_to_yojson (x : action_type) =
  match x with
  | TRANSFER_RESPONSIBILITY -> `String "TRANSFER_RESPONSIBILITY"
  | ADD_ORGANIZATIONS_SERVICE_LINKED_ROLE -> `String "ADD_ORGANIZATIONS_SERVICE_LINKED_ROLE"
  | APPROVE_ALL_FEATURES -> `String "APPROVE_ALL_FEATURES"
  | ENABLE_ALL_FEATURES -> `String "ENABLE_ALL_FEATURES"
  | INVITE_ACCOUNT_TO_ORGANIZATION -> `String "INVITE"

let handshake_resource_value_to_yojson = string_to_yojson

let handshake_resource_type_to_yojson (x : handshake_resource_type) =
  match x with
  | MANAGEMENT_NAME -> `String "MANAGEMENT_NAME"
  | MANAGEMENT_EMAIL -> `String "MANAGEMENT_EMAIL"
  | MANAGEMENT_ACCOUNT -> `String "MANAGEMENT_ACCOUNT"
  | TRANSFER_TYPE -> `String "TRANSFER_TYPE"
  | TRANSFER_START_TIMESTAMP -> `String "TRANSFER_START_TIMESTAMP"
  | RESPONSIBILITY_TRANSFER -> `String "RESPONSIBILITY_TRANSFER"
  | PARENT_HANDSHAKE -> `String "PARENT_HANDSHAKE"
  | NOTES -> `String "NOTES"
  | MASTER_NAME -> `String "MASTER_NAME"
  | MASTER_EMAIL -> `String "MASTER_EMAIL"
  | EMAIL -> `String "EMAIL"
  | ORGANIZATION_FEATURE_SET -> `String "ORGANIZATION_FEATURE_SET"
  | ORGANIZATION -> `String "ORGANIZATION"
  | ACCOUNT -> `String "ACCOUNT"

let rec handshake_resource_to_yojson (x : handshake_resource) =
  assoc_to_yojson
    [
      ("Resources", option_to_yojson handshake_resources_to_yojson x.resources);
      ("Type", option_to_yojson handshake_resource_type_to_yojson x.type_);
      ("Value", option_to_yojson handshake_resource_value_to_yojson x.value);
    ]

and handshake_resources_to_yojson tree = list_to_yojson handshake_resource_to_yojson tree

let handshake_to_yojson (x : handshake) =
  assoc_to_yojson
    [
      ("Resources", option_to_yojson handshake_resources_to_yojson x.resources);
      ("Action", option_to_yojson action_type_to_yojson x.action);
      ("ExpirationTimestamp", option_to_yojson timestamp_to_yojson x.expiration_timestamp);
      ("RequestedTimestamp", option_to_yojson timestamp_to_yojson x.requested_timestamp);
      ("State", option_to_yojson handshake_state_to_yojson x.state);
      ("Parties", option_to_yojson handshake_parties_to_yojson x.parties);
      ("Arn", option_to_yojson handshake_arn_to_yojson x.arn);
      ("Id", option_to_yojson handshake_id_to_yojson x.id);
    ]

let handshakes_to_yojson tree = list_to_yojson handshake_to_yojson tree

let list_handshakes_for_organization_response_to_yojson
    (x : list_handshakes_for_organization_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Handshakes", option_to_yojson handshakes_to_yojson x.handshakes);
    ]

let handshake_filter_to_yojson (x : handshake_filter) =
  assoc_to_yojson
    [
      ("ParentHandshakeId", option_to_yojson handshake_id_to_yojson x.parent_handshake_id);
      ("ActionType", option_to_yojson action_type_to_yojson x.action_type);
    ]

let list_handshakes_for_organization_request_to_yojson
    (x : list_handshakes_for_organization_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filter", option_to_yojson handshake_filter_to_yojson x.filter);
    ]

let list_handshakes_for_account_response_to_yojson (x : list_handshakes_for_account_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Handshakes", option_to_yojson handshakes_to_yojson x.handshakes);
    ]

let list_handshakes_for_account_request_to_yojson (x : list_handshakes_for_account_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filter", option_to_yojson handshake_filter_to_yojson x.filter);
    ]

let effective_policy_type_to_yojson (x : effective_policy_type) =
  match x with
  | NETWORK_SECURITY_DIRECTOR_POLICY -> `String "NETWORK_SECURITY_DIRECTOR_POLICY"
  | S3_POLICY -> `String "S3_POLICY"
  | BEDROCK_POLICY -> `String "BEDROCK_POLICY"
  | UPGRADE_ROLLOUT_POLICY -> `String "UPGRADE_ROLLOUT_POLICY"
  | INSPECTOR_POLICY -> `String "INSPECTOR_POLICY"
  | SECURITYHUB_POLICY -> `String "SECURITYHUB_POLICY"
  | DECLARATIVE_POLICY_EC2 -> `String "DECLARATIVE_POLICY_EC2"
  | CHATBOT_POLICY -> `String "CHATBOT_POLICY"
  | AISERVICES_OPT_OUT_POLICY -> `String "AISERVICES_OPT_OUT_POLICY"
  | BACKUP_POLICY -> `String "BACKUP_POLICY"
  | TAG_POLICY -> `String "TAG_POLICY"

let error_code_to_yojson = string_to_yojson
let error_message_to_yojson = string_to_yojson

let effective_policy_validation_error_to_yojson (x : effective_policy_validation_error) =
  assoc_to_yojson
    [
      ("ContributingPolicies", option_to_yojson policy_ids_to_yojson x.contributing_policies);
      ("PathToError", option_to_yojson path_to_error_to_yojson x.path_to_error);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
    ]

let effective_policy_validation_errors_to_yojson tree =
  list_to_yojson effective_policy_validation_error_to_yojson tree

let list_effective_policy_validation_errors_response_to_yojson
    (x : list_effective_policy_validation_errors_response) =
  assoc_to_yojson
    [
      ( "EffectivePolicyValidationErrors",
        option_to_yojson effective_policy_validation_errors_to_yojson
          x.effective_policy_validation_errors );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("EvaluationTimestamp", option_to_yojson timestamp_to_yojson x.evaluation_timestamp);
      ("Path", option_to_yojson path_to_yojson x.path);
      ("PolicyType", option_to_yojson effective_policy_type_to_yojson x.policy_type);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let list_effective_policy_validation_errors_request_to_yojson
    (x : list_effective_policy_validation_errors_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("PolicyType", Some (effective_policy_type_to_yojson x.policy_type));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let effective_policy_not_found_exception_to_yojson (x : effective_policy_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let delegated_service_to_yojson (x : delegated_service) =
  assoc_to_yojson
    [
      ("DelegationEnabledDate", option_to_yojson timestamp_to_yojson x.delegation_enabled_date);
      ("ServicePrincipal", option_to_yojson service_principal_to_yojson x.service_principal);
    ]

let delegated_services_to_yojson tree = list_to_yojson delegated_service_to_yojson tree

let list_delegated_services_for_account_response_to_yojson
    (x : list_delegated_services_for_account_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("DelegatedServices", option_to_yojson delegated_services_to_yojson x.delegated_services);
    ]

let list_delegated_services_for_account_request_to_yojson
    (x : list_delegated_services_for_account_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let account_not_registered_exception_to_yojson (x : account_not_registered_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let account_name_to_yojson = string_to_yojson

let account_status_to_yojson (x : account_status) =
  match x with
  | PENDING_CLOSURE -> `String "PENDING_CLOSURE"
  | SUSPENDED -> `String "SUSPENDED"
  | ACTIVE -> `String "ACTIVE"

let account_state_to_yojson (x : account_state) =
  match x with
  | CLOSED -> `String "CLOSED"
  | PENDING_CLOSURE -> `String "PENDING_CLOSURE"
  | SUSPENDED -> `String "SUSPENDED"
  | ACTIVE -> `String "ACTIVE"
  | PENDING_ACTIVATION -> `String "PENDING_ACTIVATION"

let account_joined_method_to_yojson (x : account_joined_method) =
  match x with CREATED -> `String "CREATED" | INVITED -> `String "INVITED"

let delegated_administrator_to_yojson (x : delegated_administrator) =
  assoc_to_yojson
    [
      ("DelegationEnabledDate", option_to_yojson timestamp_to_yojson x.delegation_enabled_date);
      ("JoinedTimestamp", option_to_yojson timestamp_to_yojson x.joined_timestamp);
      ("JoinedMethod", option_to_yojson account_joined_method_to_yojson x.joined_method);
      ("State", option_to_yojson account_state_to_yojson x.state);
      ("Status", option_to_yojson account_status_to_yojson x.status);
      ("Name", option_to_yojson account_name_to_yojson x.name);
      ("Email", option_to_yojson email_to_yojson x.email);
      ("Arn", option_to_yojson account_arn_to_yojson x.arn);
      ("Id", option_to_yojson account_id_to_yojson x.id);
    ]

let delegated_administrators_to_yojson tree = list_to_yojson delegated_administrator_to_yojson tree

let list_delegated_administrators_response_to_yojson (x : list_delegated_administrators_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "DelegatedAdministrators",
        option_to_yojson delegated_administrators_to_yojson x.delegated_administrators );
    ]

let list_delegated_administrators_request_to_yojson (x : list_delegated_administrators_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ServicePrincipal", option_to_yojson service_principal_to_yojson x.service_principal);
    ]

let create_account_request_id_to_yojson = string_to_yojson
let create_account_name_to_yojson = string_to_yojson

let create_account_state_to_yojson (x : create_account_state) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let create_account_failure_reason_to_yojson (x : create_account_failure_reason) =
  match x with
  | UPDATE_EXISTING_RESOURCE_POLICY_WITH_TAGS_NOT_SUPPORTED ->
      `String "UPDATE_EXISTING_RESOURCE_POLICY_WITH_TAGS_NOT_SUPPORTED"
  | INVALID_PAYMENT_INSTRUMENT -> `String "INVALID_PAYMENT_INSTRUMENT"
  | MISSING_PAYMENT_INSTRUMENT -> `String "MISSING_PAYMENT_INSTRUMENT"
  | UNKNOWN_BUSINESS_VALIDATION -> `String "UNKNOWN_BUSINESS_VALIDATION"
  | INVALID_IDENTITY_FOR_BUSINESS_VALIDATION -> `String "INVALID_IDENTITY_FOR_BUSINESS_VALIDATION"
  | PENDING_BUSINESS_VALIDATIONv -> `String "PENDING_BUSINESS_VALIDATION"
  | FAILED_BUSINESS_VALIDATION -> `String "FAILED_BUSINESS_VALIDATION"
  | MISSING_BUSINESS_VALIDATION -> `String "MISSING_BUSINESS_VALIDATION"
  | GOVCLOUD_ACCOUNT_ALREADY_EXISTS -> `String "GOVCLOUD_ACCOUNT_ALREADY_EXISTS"
  | INTERNAL_FAILURE -> `String "INTERNAL_FAILURE"
  | CONCURRENT_ACCOUNT_MODIFICATION -> `String "CONCURRENT_ACCOUNT_MODIFICATION"
  | INVALID_EMAIL -> `String "INVALID_EMAIL"
  | INVALID_ADDRESS -> `String "INVALID_ADDRESS"
  | EMAIL_ALREADY_EXISTS -> `String "EMAIL_ALREADY_EXISTS"
  | ACCOUNT_LIMIT_EXCEEDED -> `String "ACCOUNT_LIMIT_EXCEEDED"

let create_account_status_to_yojson (x : create_account_status) =
  assoc_to_yojson
    [
      ("FailureReason", option_to_yojson create_account_failure_reason_to_yojson x.failure_reason);
      ("GovCloudAccountId", option_to_yojson account_id_to_yojson x.gov_cloud_account_id);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("CompletedTimestamp", option_to_yojson timestamp_to_yojson x.completed_timestamp);
      ("RequestedTimestamp", option_to_yojson timestamp_to_yojson x.requested_timestamp);
      ("State", option_to_yojson create_account_state_to_yojson x.state);
      ("AccountName", option_to_yojson create_account_name_to_yojson x.account_name);
      ("Id", option_to_yojson create_account_request_id_to_yojson x.id);
    ]

let create_account_statuses_to_yojson tree = list_to_yojson create_account_status_to_yojson tree

let list_create_account_status_response_to_yojson (x : list_create_account_status_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "CreateAccountStatuses",
        option_to_yojson create_account_statuses_to_yojson x.create_account_statuses );
    ]

let create_account_states_to_yojson tree = list_to_yojson create_account_state_to_yojson tree

let list_create_account_status_request_to_yojson (x : list_create_account_status_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("States", option_to_yojson create_account_states_to_yojson x.states);
    ]

let child_type_to_yojson (x : child_type) =
  match x with ORGANIZATIONAL_UNIT -> `String "ORGANIZATIONAL_UNIT" | ACCOUNT -> `String "ACCOUNT"

let child_to_yojson (x : child) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson child_type_to_yojson x.type_);
      ("Id", option_to_yojson child_id_to_yojson x.id);
    ]

let children_to_yojson tree = list_to_yojson child_to_yojson tree

let list_children_response_to_yojson (x : list_children_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Children", option_to_yojson children_to_yojson x.children);
    ]

let list_children_request_to_yojson (x : list_children_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ChildType", Some (child_type_to_yojson x.child_type));
      ("ParentId", Some (parent_id_to_yojson x.parent_id));
    ]

let account_to_yojson (x : account) =
  assoc_to_yojson
    [
      ("JoinedTimestamp", option_to_yojson timestamp_to_yojson x.joined_timestamp);
      ("JoinedMethod", option_to_yojson account_joined_method_to_yojson x.joined_method);
      ("Paths", option_to_yojson paths_to_yojson x.paths);
      ("State", option_to_yojson account_state_to_yojson x.state);
      ("Status", option_to_yojson account_status_to_yojson x.status);
      ("Name", option_to_yojson account_name_to_yojson x.name);
      ("Email", option_to_yojson email_to_yojson x.email);
      ("Arn", option_to_yojson account_arn_to_yojson x.arn);
      ("Id", option_to_yojson account_id_to_yojson x.id);
    ]

let accounts_to_yojson tree = list_to_yojson account_to_yojson tree

let list_accounts_with_invalid_effective_policy_response_to_yojson
    (x : list_accounts_with_invalid_effective_policy_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("PolicyType", option_to_yojson effective_policy_type_to_yojson x.policy_type);
      ("Accounts", option_to_yojson accounts_to_yojson x.accounts);
    ]

let list_accounts_with_invalid_effective_policy_request_to_yojson
    (x : list_accounts_with_invalid_effective_policy_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("PolicyType", Some (effective_policy_type_to_yojson x.policy_type));
    ]

let list_accounts_response_to_yojson (x : list_accounts_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Accounts", option_to_yojson accounts_to_yojson x.accounts);
    ]

let list_accounts_request_to_yojson (x : list_accounts_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_accounts_for_parent_response_to_yojson (x : list_accounts_for_parent_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Accounts", option_to_yojson accounts_to_yojson x.accounts);
    ]

let list_accounts_for_parent_request_to_yojson (x : list_accounts_for_parent_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ParentId", Some (parent_id_to_yojson x.parent_id));
    ]

let enabled_service_principal_to_yojson (x : enabled_service_principal) =
  assoc_to_yojson
    [
      ("DateEnabled", option_to_yojson timestamp_to_yojson x.date_enabled);
      ("ServicePrincipal", option_to_yojson service_principal_to_yojson x.service_principal);
    ]

let enabled_service_principals_to_yojson tree =
  list_to_yojson enabled_service_principal_to_yojson tree

let list_aws_service_access_for_organization_response_to_yojson
    (x : list_aws_service_access_for_organization_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "EnabledServicePrincipals",
        option_to_yojson enabled_service_principals_to_yojson x.enabled_service_principals );
    ]

let list_aws_service_access_for_organization_request_to_yojson
    (x : list_aws_service_access_for_organization_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let invite_organization_to_transfer_responsibility_response_to_yojson
    (x : invite_organization_to_transfer_responsibility_response) =
  assoc_to_yojson [ ("Handshake", option_to_yojson handshake_to_yojson x.handshake) ]

let handshake_notes_to_yojson = string_to_yojson

let invite_organization_to_transfer_responsibility_request_to_yojson
    (x : invite_organization_to_transfer_responsibility_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("SourceName", Some (responsibility_transfer_name_to_yojson x.source_name));
      ("StartTimestamp", Some (timestamp_to_yojson x.start_timestamp));
      ("Notes", option_to_yojson handshake_notes_to_yojson x.notes);
      ("Target", Some (handshake_party_to_yojson x.target));
      ("Type", Some (responsibility_transfer_type_to_yojson x.type_));
    ]

let handshake_constraint_violation_exception_reason_to_yojson
    (x : handshake_constraint_violation_exception_reason) =
  match x with
  | LEGACY_PERMISSIONS_STILL_IN_USE -> `String "LEGACY_PERMISSIONS_STILL_IN_USE"
  | UNUSED_PREPAYMENT_BALANCE -> `String "UNUSED_PREPAYMENT_BALANCE"
  | SOURCE_AND_TARGET_CANNOT_MATCH -> `String "SOURCE_AND_TARGET_CANNOT_MATCH"
  | RESPONSIBILITY_TRANSFER_ALREADY_EXISTS -> `String "RESPONSIBILITY_TRANSFER_ALREADY_EXISTS"
  | MANAGEMENT_ACCOUNT_EMAIL_NOT_VERIFIED -> `String "MANAGEMENT_ACCOUNT_EMAIL_NOT_VERIFIED"
  | ORGANIZATION_MEMBERSHIP_CHANGE_RATE_LIMIT_EXCEEDED ->
      `String "ORGANIZATION_MEMBERSHIP_CHANGE_RATE_LIMIT_EXCEEDED"
  | ORGANIZATION_FROM_DIFFERENT_SELLER_OF_RECORD ->
      `String "ORGANIZATION_FROM_DIFFERENT_SELLER_OF_RECORD"
  | PAYMENT_INSTRUMENT_REQUIRED -> `String "PAYMENT_INSTRUMENT_REQUIRED"
  | INVITE_DISABLED_DURING_ENABLE_ALL_FEATURES ->
      `String "INVITE_DISABLED_DURING_ENABLE_ALL_FEATURES"
  | ORGANIZATION_IS_ALREADY_PENDING_ALL_FEATURES_MIGRATION ->
      `String "ORGANIZATION_IS_ALREADY_PENDING_ALL_FEATURES_MIGRATION"
  | ORGANIZATION_ALREADY_HAS_ALL_FEATURES -> `String "ORGANIZATION_ALREADY_HAS_ALL_FEATURES"
  | ALREADY_IN_AN_ORGANIZATION -> `String "ALREADY_IN_AN_ORGANIZATION"
  | HANDSHAKE_RATE_LIMIT_EXCEEDED -> `String "HANDSHAKE_RATE_LIMIT_EXCEEDED"
  | ACCOUNT_NUMBER_LIMIT_EXCEEDED -> `String "ACCOUNT_NUMBER_LIMIT_EXCEEDED"

let handshake_constraint_violation_exception_to_yojson
    (x : handshake_constraint_violation_exception) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson handshake_constraint_violation_exception_reason_to_yojson x.reason);
      ("Message", option_to_yojson exception_message_to_yojson x.message);
    ]

let duplicate_handshake_exception_to_yojson (x : duplicate_handshake_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let invite_account_to_organization_response_to_yojson (x : invite_account_to_organization_response)
    =
  assoc_to_yojson [ ("Handshake", option_to_yojson handshake_to_yojson x.handshake) ]

let invite_account_to_organization_request_to_yojson (x : invite_account_to_organization_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Notes", option_to_yojson handshake_notes_to_yojson x.notes);
      ("Target", Some (handshake_party_to_yojson x.target));
    ]

let finalizing_organization_exception_to_yojson (x : finalizing_organization_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let account_owner_not_verified_exception_to_yojson (x : account_owner_not_verified_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_handshake_transition_exception_to_yojson (x : invalid_handshake_transition_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let iam_user_access_to_billing_to_yojson (x : iam_user_access_to_billing) =
  match x with DENY -> `String "DENY" | ALLOW -> `String "ALLOW"

let handshake_not_found_exception_to_yojson (x : handshake_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let handshake_already_in_state_exception_to_yojson (x : handshake_already_in_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let enable_policy_type_response_to_yojson (x : enable_policy_type_response) =
  assoc_to_yojson [ ("Root", option_to_yojson root_to_yojson x.root) ]

let enable_policy_type_request_to_yojson (x : enable_policy_type_request) =
  assoc_to_yojson
    [
      ("PolicyType", Some (policy_type_to_yojson x.policy_type));
      ("RootId", Some (root_id_to_yojson x.root_id));
    ]

let enable_all_features_response_to_yojson (x : enable_all_features_response) =
  assoc_to_yojson [ ("Handshake", option_to_yojson handshake_to_yojson x.handshake) ]

let enable_all_features_request_to_yojson = unit_to_yojson

let enable_aws_service_access_request_to_yojson (x : enable_aws_service_access_request) =
  assoc_to_yojson [ ("ServicePrincipal", Some (service_principal_to_yojson x.service_principal)) ]

let effective_policy_to_yojson (x : effective_policy) =
  assoc_to_yojson
    [
      ("PolicyType", option_to_yojson effective_policy_type_to_yojson x.policy_type);
      ("TargetId", option_to_yojson policy_target_id_to_yojson x.target_id);
      ("LastUpdatedTimestamp", option_to_yojson timestamp_to_yojson x.last_updated_timestamp);
      ("PolicyContent", option_to_yojson policy_content_to_yojson x.policy_content);
    ]

let duplicate_policy_attachment_exception_to_yojson (x : duplicate_policy_attachment_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let disable_policy_type_response_to_yojson (x : disable_policy_type_response) =
  assoc_to_yojson [ ("Root", option_to_yojson root_to_yojson x.root) ]

let disable_policy_type_request_to_yojson (x : disable_policy_type_request) =
  assoc_to_yojson
    [
      ("PolicyType", Some (policy_type_to_yojson x.policy_type));
      ("RootId", Some (root_id_to_yojson x.root_id));
    ]

let disable_aws_service_access_request_to_yojson (x : disable_aws_service_access_request) =
  assoc_to_yojson [ ("ServicePrincipal", Some (service_principal_to_yojson x.service_principal)) ]

let detach_policy_request_to_yojson (x : detach_policy_request) =
  assoc_to_yojson
    [
      ("TargetId", Some (policy_target_id_to_yojson x.target_id));
      ("PolicyId", Some (policy_id_to_yojson x.policy_id));
    ]

let describe_responsibility_transfer_response_to_yojson
    (x : describe_responsibility_transfer_response) =
  assoc_to_yojson
    [
      ( "ResponsibilityTransfer",
        option_to_yojson responsibility_transfer_to_yojson x.responsibility_transfer );
    ]

let describe_responsibility_transfer_request_to_yojson
    (x : describe_responsibility_transfer_request) =
  assoc_to_yojson [ ("Id", Some (responsibility_transfer_id_to_yojson x.id)) ]

let describe_resource_policy_response_to_yojson (x : describe_resource_policy_response) =
  assoc_to_yojson
    [ ("ResourcePolicy", option_to_yojson resource_policy_to_yojson x.resource_policy) ]

let describe_policy_response_to_yojson (x : describe_policy_response) =
  assoc_to_yojson [ ("Policy", option_to_yojson policy_to_yojson x.policy) ]

let describe_policy_request_to_yojson (x : describe_policy_request) =
  assoc_to_yojson [ ("PolicyId", Some (policy_id_to_yojson x.policy_id)) ]

let describe_organizational_unit_response_to_yojson (x : describe_organizational_unit_response) =
  assoc_to_yojson
    [ ("OrganizationalUnit", option_to_yojson organizational_unit_to_yojson x.organizational_unit) ]

let describe_organizational_unit_request_to_yojson (x : describe_organizational_unit_request) =
  assoc_to_yojson
    [ ("OrganizationalUnitId", Some (organizational_unit_id_to_yojson x.organizational_unit_id)) ]

let describe_organization_response_to_yojson (x : describe_organization_response) =
  assoc_to_yojson [ ("Organization", option_to_yojson organization_to_yojson x.organization) ]

let describe_handshake_response_to_yojson (x : describe_handshake_response) =
  assoc_to_yojson [ ("Handshake", option_to_yojson handshake_to_yojson x.handshake) ]

let describe_handshake_request_to_yojson (x : describe_handshake_request) =
  assoc_to_yojson [ ("HandshakeId", Some (handshake_id_to_yojson x.handshake_id)) ]

let describe_effective_policy_response_to_yojson (x : describe_effective_policy_response) =
  assoc_to_yojson
    [ ("EffectivePolicy", option_to_yojson effective_policy_to_yojson x.effective_policy) ]

let describe_effective_policy_request_to_yojson (x : describe_effective_policy_request) =
  assoc_to_yojson
    [
      ("TargetId", option_to_yojson policy_target_id_to_yojson x.target_id);
      ("PolicyType", Some (effective_policy_type_to_yojson x.policy_type));
    ]

let describe_create_account_status_response_to_yojson (x : describe_create_account_status_response)
    =
  assoc_to_yojson
    [
      ( "CreateAccountStatus",
        option_to_yojson create_account_status_to_yojson x.create_account_status );
    ]

let describe_create_account_status_request_to_yojson (x : describe_create_account_status_request) =
  assoc_to_yojson
    [
      ( "CreateAccountRequestId",
        Some (create_account_request_id_to_yojson x.create_account_request_id) );
    ]

let create_account_status_not_found_exception_to_yojson
    (x : create_account_status_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let describe_account_response_to_yojson (x : describe_account_response) =
  assoc_to_yojson [ ("Account", option_to_yojson account_to_yojson x.account) ]

let describe_account_request_to_yojson (x : describe_account_request) =
  assoc_to_yojson [ ("AccountId", Some (account_id_to_yojson x.account_id)) ]

let deregister_delegated_administrator_request_to_yojson
    (x : deregister_delegated_administrator_request) =
  assoc_to_yojson
    [
      ("ServicePrincipal", Some (service_principal_to_yojson x.service_principal));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let delete_policy_request_to_yojson (x : delete_policy_request) =
  assoc_to_yojson [ ("PolicyId", Some (policy_id_to_yojson x.policy_id)) ]

let delete_organizational_unit_request_to_yojson (x : delete_organizational_unit_request) =
  assoc_to_yojson
    [ ("OrganizationalUnitId", Some (organizational_unit_id_to_yojson x.organizational_unit_id)) ]

let decline_handshake_response_to_yojson (x : decline_handshake_response) =
  assoc_to_yojson [ ("Handshake", option_to_yojson handshake_to_yojson x.handshake) ]

let decline_handshake_request_to_yojson (x : decline_handshake_request) =
  assoc_to_yojson [ ("HandshakeId", Some (handshake_id_to_yojson x.handshake_id)) ]

let create_policy_response_to_yojson (x : create_policy_response) =
  assoc_to_yojson [ ("Policy", option_to_yojson policy_to_yojson x.policy) ]

let create_policy_request_to_yojson (x : create_policy_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Type", Some (policy_type_to_yojson x.type_));
      ("Name", Some (policy_name_to_yojson x.name));
      ("Description", Some (policy_description_to_yojson x.description));
      ("Content", Some (policy_content_to_yojson x.content));
    ]

let create_organizational_unit_response_to_yojson (x : create_organizational_unit_response) =
  assoc_to_yojson
    [ ("OrganizationalUnit", option_to_yojson organizational_unit_to_yojson x.organizational_unit) ]

let create_organizational_unit_request_to_yojson (x : create_organizational_unit_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Name", Some (organizational_unit_name_to_yojson x.name));
      ("ParentId", Some (parent_id_to_yojson x.parent_id));
    ]

let create_organization_response_to_yojson (x : create_organization_response) =
  assoc_to_yojson [ ("Organization", option_to_yojson organization_to_yojson x.organization) ]

let create_organization_request_to_yojson (x : create_organization_request) =
  assoc_to_yojson
    [ ("FeatureSet", option_to_yojson organization_feature_set_to_yojson x.feature_set) ]

let already_in_organization_exception_to_yojson (x : already_in_organization_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let access_denied_for_dependency_exception_reason_to_yojson
    (x : access_denied_for_dependency_exception_reason) =
  match x with
  | ACCESS_DENIED_DURING_CREATE_SERVICE_LINKED_ROLE ->
      `String "ACCESS_DENIED_DURING_CREATE_SERVICE_LINKED_ROLE"

let access_denied_for_dependency_exception_to_yojson (x : access_denied_for_dependency_exception) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson access_denied_for_dependency_exception_reason_to_yojson x.reason);
      ("Message", option_to_yojson exception_message_to_yojson x.message);
    ]

let create_gov_cloud_account_response_to_yojson (x : create_gov_cloud_account_response) =
  assoc_to_yojson
    [
      ( "CreateAccountStatus",
        option_to_yojson create_account_status_to_yojson x.create_account_status );
    ]

let create_gov_cloud_account_request_to_yojson (x : create_gov_cloud_account_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "IamUserAccessToBilling",
        option_to_yojson iam_user_access_to_billing_to_yojson x.iam_user_access_to_billing );
      ("RoleName", option_to_yojson role_name_to_yojson x.role_name);
      ("AccountName", Some (create_account_name_to_yojson x.account_name));
      ("Email", Some (email_to_yojson x.email));
    ]

let create_account_response_to_yojson (x : create_account_response) =
  assoc_to_yojson
    [
      ( "CreateAccountStatus",
        option_to_yojson create_account_status_to_yojson x.create_account_status );
    ]

let create_account_request_to_yojson (x : create_account_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "IamUserAccessToBilling",
        option_to_yojson iam_user_access_to_billing_to_yojson x.iam_user_access_to_billing );
      ("RoleName", option_to_yojson role_name_to_yojson x.role_name);
      ("AccountName", Some (create_account_name_to_yojson x.account_name));
      ("Email", Some (email_to_yojson x.email));
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let close_account_request_to_yojson (x : close_account_request) =
  assoc_to_yojson [ ("AccountId", Some (account_id_to_yojson x.account_id)) ]

let account_already_closed_exception_to_yojson (x : account_already_closed_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let cancel_handshake_response_to_yojson (x : cancel_handshake_response) =
  assoc_to_yojson [ ("Handshake", option_to_yojson handshake_to_yojson x.handshake) ]

let cancel_handshake_request_to_yojson (x : cancel_handshake_request) =
  assoc_to_yojson [ ("HandshakeId", Some (handshake_id_to_yojson x.handshake_id)) ]

let attach_policy_request_to_yojson (x : attach_policy_request) =
  assoc_to_yojson
    [
      ("TargetId", Some (policy_target_id_to_yojson x.target_id));
      ("PolicyId", Some (policy_id_to_yojson x.policy_id));
    ]

let accept_handshake_response_to_yojson (x : accept_handshake_response) =
  assoc_to_yojson [ ("Handshake", option_to_yojson handshake_to_yojson x.handshake) ]

let accept_handshake_request_to_yojson (x : accept_handshake_request) =
  assoc_to_yojson [ ("HandshakeId", Some (handshake_id_to_yojson x.handshake_id)) ]
