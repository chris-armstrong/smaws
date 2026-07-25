open Smaws_Lib.Json.SerializeHelpers
open Types

let exception_message_to_yojson = string_to_yojson

let aws_organizations_not_in_use_exception_to_yojson (x : aws_organizations_not_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let unsupported_api_endpoint_exception_to_yojson (x : unsupported_api_endpoint_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let exception_type_to_yojson = string_to_yojson

let too_many_requests_exception_to_yojson (x : too_many_requests_exception) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson exception_type_to_yojson x.type_);
      ("Message", option_to_yojson exception_message_to_yojson x.message);
    ]

let service_exception_to_yojson (x : service_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let responsibility_transfer_not_found_exception_to_yojson
    (x : responsibility_transfer_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_input_exception_reason_to_yojson (x : invalid_input_exception_reason) =
  match x with
  | INVALID_PARTY_TYPE_TARGET -> `String "INVALID_PARTY_TYPE_TARGET"
  | INVALID_SYNTAX_ORGANIZATION -> `String "INVALID_SYNTAX_ORGANIZATION_ARN"
  | INVALID_SYNTAX_POLICY -> `String "INVALID_SYNTAX_POLICY_ID"
  | INVALID_ENUM -> `String "INVALID_ENUM"
  | INVALID_ENUM_POLICY_TYPE -> `String "INVALID_ENUM_POLICY_TYPE"
  | INVALID_LIST_MEMBER -> `String "INVALID_LIST_MEMBER"
  | MAX_LENGTH_EXCEEDED -> `String "MAX_LENGTH_EXCEEDED"
  | MAX_VALUE_EXCEEDED -> `String "MAX_VALUE_EXCEEDED"
  | MIN_LENGTH_EXCEEDED -> `String "MIN_LENGTH_EXCEEDED"
  | MIN_VALUE_EXCEEDED -> `String "MIN_VALUE_EXCEEDED"
  | IMMUTABLE_POLICY -> `String "IMMUTABLE_POLICY"
  | INVALID_PATTERN -> `String "INVALID_PATTERN"
  | INVALID_PATTERN_TARGET_ID -> `String "INVALID_PATTERN_TARGET_ID"
  | INPUT_REQUIRED -> `String "INPUT_REQUIRED"
  | INVALID_PAGINATION_TOKEN -> `String "INVALID_NEXT_TOKEN"
  | MAX_FILTER_LIMIT_EXCEEDED -> `String "MAX_LIMIT_EXCEEDED_FILTER"
  | MOVING_ACCOUNT_BETWEEN_DIFFERENT_ROOTS -> `String "MOVING_ACCOUNT_BETWEEN_DIFFERENT_ROOTS"
  | INVALID_FULL_NAME_TARGET -> `String "INVALID_FULL_NAME_TARGET"
  | UNRECOGNIZED_SERVICE_PRINCIPAL -> `String "UNRECOGNIZED_SERVICE_PRINCIPAL"
  | INVALID_ROLE_NAME -> `String "INVALID_ROLE_NAME"
  | INVALID_SYSTEM_TAGS_PARAMETER -> `String "INVALID_SYSTEM_TAGS_PARAMETER"
  | DUPLICATE_TAG_KEY -> `String "DUPLICATE_TAG_KEY"
  | TARGET_NOT_SUPPORTED -> `String "TARGET_NOT_SUPPORTED"
  | INVALID_EMAIL_ADDRESS_TARGET -> `String "INVALID_EMAIL_ADDRESS_TARGET"
  | INVALID_RESOURCE_POLICY_JSON -> `String "INVALID_RESOURCE_POLICY_JSON"
  | INVALID_PRINCIPAL -> `String "INVALID_PRINCIPAL"
  | UNSUPPORTED_ACTION_IN_RESOURCE_POLICY -> `String "UNSUPPORTED_ACTION_IN_RESOURCE_POLICY"
  | UNSUPPORTED_POLICY_TYPE_IN_RESOURCE_POLICY ->
      `String "UNSUPPORTED_POLICY_TYPE_IN_RESOURCE_POLICY"
  | UNSUPPORTED_RESOURCE_IN_RESOURCE_POLICY -> `String "UNSUPPORTED_RESOURCE_IN_RESOURCE_POLICY"
  | NON_DETACHABLE_POLICY -> `String "NON_DETACHABLE_POLICY"
  | CALLER_REQUIRED_FIELD_MISSING -> `String "CALLER_REQUIRED_FIELD_MISSING"
  | UNSUPPORTED_ACTION_IN_RESPONSIBILITY_TRANSFER ->
      `String "UNSUPPORTED_ACTION_IN_RESPONSIBILITY_TRANSFER"
  | START_DATE_NOT_BEGINNING_OF_MONTH -> `String "START_DATE_NOT_BEGINNING_OF_MONTH"
  | START_DATE_NOT_BEGINNING_OF_DAY -> `String "START_DATE_NOT_BEGINNING_OF_DAY"
  | START_DATE_TOO_EARLY -> `String "START_DATE_TOO_EARLY"
  | START_DATE_TOO_LATE -> `String "START_DATE_TOO_LATE"
  | INVALID_START_DATE -> `String "INVALID_START_DATE"
  | END_DATE_NOT_END_OF_MONTH -> `String "END_DATE_NOT_END_OF_MONTH"
  | END_DATE_TOO_EARLY -> `String "END_DATE_TOO_EARLY"
  | INVALID_END_DATE -> `String "INVALID_END_DATE"

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("Reason", option_to_yojson invalid_input_exception_reason_to_yojson x.reason);
    ]

let constraint_violation_exception_reason_to_yojson (x : constraint_violation_exception_reason) =
  match x with
  | ACCOUNT_NUMBER_LIMIT_EXCEEDED -> `String "ACCOUNT_NUMBER_LIMIT_EXCEEDED"
  | HANDSHAKE_RATE_LIMIT_EXCEEDED -> `String "HANDSHAKE_RATE_LIMIT_EXCEEDED"
  | OU_NUMBER_LIMIT_EXCEEDED -> `String "OU_NUMBER_LIMIT_EXCEEDED"
  | OU_DEPTH_LIMIT_EXCEEDED -> `String "OU_DEPTH_LIMIT_EXCEEDED"
  | POLICY_NUMBER_LIMIT_EXCEEDED -> `String "POLICY_NUMBER_LIMIT_EXCEEDED"
  | POLICY_CONTENT_LIMIT_EXCEEDED -> `String "POLICY_CONTENT_LIMIT_EXCEEDED"
  | MAX_POLICY_TYPE_ATTACHMENT_LIMIT_EXCEEDED -> `String "MAX_POLICY_TYPE_ATTACHMENT_LIMIT_EXCEEDED"
  | MIN_POLICY_TYPE_ATTACHMENT_LIMIT_EXCEEDED -> `String "MIN_POLICY_TYPE_ATTACHMENT_LIMIT_EXCEEDED"
  | ACCOUNT_CANNOT_LEAVE_ORGANIZATION -> `String "ACCOUNT_CANNOT_LEAVE_ORGANIZATION"
  | ACCOUNT_CANNOT_LEAVE_WITHOUT_EULA -> `String "ACCOUNT_CANNOT_LEAVE_WITHOUT_EULA"
  | ACCOUNT_CANNOT_LEAVE_WITHOUT_PHONE_VERIFICATION ->
      `String "ACCOUNT_CANNOT_LEAVE_WITHOUT_PHONE_VERIFICATION"
  | MASTER_ACCOUNT_PAYMENT_INSTRUMENT_REQUIRED ->
      `String "MASTER_ACCOUNT_PAYMENT_INSTRUMENT_REQUIRED"
  | MEMBER_ACCOUNT_PAYMENT_INSTRUMENT_REQUIRED ->
      `String "MEMBER_ACCOUNT_PAYMENT_INSTRUMENT_REQUIRED"
  | ACCOUNT_CREATION_RATE_LIMIT_EXCEEDED -> `String "ACCOUNT_CREATION_RATE_LIMIT_EXCEEDED"
  | MASTER_ACCOUNT_ADDRESS_DOES_NOT_MATCH_MARKETPLACE ->
      `String "MASTER_ACCOUNT_ADDRESS_DOES_NOT_MATCH_MARKETPLACE"
  | MASTER_ACCOUNT_MISSING_CONTACT_INFO -> `String "MASTER_ACCOUNT_MISSING_CONTACT_INFO"
  | MASTER_ACCOUNT_NOT_GOVCLOUD_ENABLED -> `String "MASTER_ACCOUNT_NOT_GOVCLOUD_ENABLED"
  | ORGANIZATION_NOT_IN_ALL_FEATURES_MODE -> `String "ORGANIZATION_NOT_IN_ALL_FEATURES_MODE"
  | CREATE_ORGANIZATION_IN_BILLING_MODE_UNSUPPORTED_REGION ->
      `String "CREATE_ORGANIZATION_IN_BILLING_MODE_UNSUPPORTED_REGION"
  | EMAIL_VERIFICATION_CODE_EXPIRED -> `String "EMAIL_VERIFICATION_CODE_EXPIRED"
  | WAIT_PERIOD_ACTIVE -> `String "WAIT_PERIOD_ACTIVE"
  | MAX_TAG_LIMIT_EXCEEDED -> `String "MAX_TAG_LIMIT_EXCEEDED"
  | TAG_POLICY_VIOLATION -> `String "TAG_POLICY_VIOLATION"
  | MAX_DELEGATED_ADMINISTRATORS_FOR_SERVICE_LIMIT_EXCEEDED ->
      `String "MAX_DELEGATED_ADMINISTRATORS_FOR_SERVICE_LIMIT_EXCEEDED"
  | CANNOT_REGISTER_MASTER_AS_DELEGATED_ADMINISTRATOR ->
      `String "CANNOT_REGISTER_MASTER_AS_DELEGATED_ADMINISTRATOR"
  | CANNOT_REMOVE_DELEGATED_ADMINISTRATOR_FROM_ORG ->
      `String "CANNOT_REMOVE_DELEGATED_ADMINISTRATOR_FROM_ORG"
  | DELEGATED_ADMINISTRATOR_EXISTS_FOR_THIS_SERVICE ->
      `String "DELEGATED_ADMINISTRATOR_EXISTS_FOR_THIS_SERVICE"
  | POLICY_TYPE_ENABLED_FOR_THIS_SERVICE -> `String "POLICY_TYPE_ENABLED_FOR_THIS_SERVICE"
  | MASTER_ACCOUNT_MISSING_BUSINESS_LICENSE -> `String "MASTER_ACCOUNT_MISSING_BUSINESS_LICENSE"
  | CANNOT_CLOSE_MANAGEMENT_ACCOUNT -> `String "CANNOT_CLOSE_MANAGEMENT_ACCOUNT"
  | CLOSE_ACCOUNT_QUOTA_EXCEEDED -> `String "CLOSE_ACCOUNT_QUOTA_EXCEEDED"
  | CLOSE_ACCOUNT_REQUESTS_LIMIT_EXCEEDED -> `String "CLOSE_ACCOUNT_REQUESTS_LIMIT_EXCEEDED"
  | SERVICE_ACCESS_NOT_ENABLED -> `String "SERVICE_ACCESS_NOT_ENABLED"
  | INVALID_PAYMENT_INSTRUMENT -> `String "INVALID_PAYMENT_INSTRUMENT"
  | ACCOUNT_CREATION_NOT_COMPLETE -> `String "ACCOUNT_CREATION_NOT_COMPLETE"
  | CANNOT_REGISTER_SUSPENDED_ACCOUNT_AS_DELEGATED_ADMINISTRATOR ->
      `String "CANNOT_REGISTER_SUSPENDED_ACCOUNT_AS_DELEGATED_ADMINISTRATOR"
  | ALL_FEATURES_MIGRATION_ORGANIZATION_SIZE_LIMIT_EXCEEDED ->
      `String "ALL_FEATURES_MIGRATION_ORGANIZATION_SIZE_LIMIT_EXCEEDED"
  | RESPONSIBILITY_TRANSFER_MAX_LEVEL_VIOLATION ->
      `String "RESPONSIBILITY_TRANSFER_MAX_LEVEL_VIOLATION"
  | RESPONSIBILITY_TRANSFER_MAX_INBOUND_QUOTA_VIOLATION ->
      `String "RESPONSIBILITY_TRANSFER_MAX_INBOUND_QUOTA_VIOLATION"
  | RESPONSIBILITY_TRANSFER_MAX_OUTBOUND_QUOTA_VIOLATION ->
      `String "RESPONSIBILITY_TRANSFER_MAX_OUTBOUND_QUOTA_VIOLATION"
  | RESPONSIBILITY_TRANSFER_MAX_TRANSFERS_QUOTA_VIOLATION ->
      `String "RESPONSIBILITY_TRANSFER_MAX_TRANSFERS_QUOTA_VIOLATION"
  | ACTIVE_RESPONSIBILITY_TRANSFER_PROCESS -> `String "ACTIVE_RESPONSIBILITY_TRANSFER_PROCESS"
  | TRANSFER_RESPONSIBILITY_TARGET_DELETION_IN_PROGRESS ->
      `String "TRANSFER_RESPONSIBILITY_TARGET_DELETION_IN_PROGRESS"
  | TRANSFER_RESPONSIBILITY_SOURCE_DELETION_IN_PROGRESS ->
      `String "TRANSFER_RESPONSIBILITY_SOURCE_DELETION_IN_PROGRESS"
  | UNSUPPORTED_PRICING -> `String "UNSUPPORTED_PRICING"

let constraint_violation_exception_to_yojson (x : constraint_violation_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("Reason", option_to_yojson constraint_violation_exception_reason_to_yojson x.reason);
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let handshake_id_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let email_to_yojson = string_to_yojson
let account_id_to_yojson = string_to_yojson

let transfer_participant_to_yojson (x : transfer_participant) =
  assoc_to_yojson
    [
      ("ManagementAccountId", option_to_yojson account_id_to_yojson x.management_account_id);
      ("ManagementAccountEmail", option_to_yojson email_to_yojson x.management_account_email);
    ]

let responsibility_transfer_status_to_yojson (x : responsibility_transfer_status) =
  match x with
  | REQUESTED -> `String "REQUESTED"
  | DECLINED -> `String "DECLINED"
  | CANCELED -> `String "CANCELED"
  | EXPIRED -> `String "EXPIRED"
  | ACCEPTED -> `String "ACCEPTED"
  | WITHDRAWN -> `String "WITHDRAWN"

let responsibility_transfer_type_to_yojson (x : responsibility_transfer_type) =
  match x with BILLING -> `String "BILLING"

let responsibility_transfer_id_to_yojson = string_to_yojson
let responsibility_transfer_name_to_yojson = string_to_yojson
let responsibility_transfer_arn_to_yojson = string_to_yojson

let responsibility_transfer_to_yojson (x : responsibility_transfer) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson responsibility_transfer_arn_to_yojson x.arn);
      ("Name", option_to_yojson responsibility_transfer_name_to_yojson x.name);
      ("Id", option_to_yojson responsibility_transfer_id_to_yojson x.id);
      ("Type", option_to_yojson responsibility_transfer_type_to_yojson x.type_);
      ("Status", option_to_yojson responsibility_transfer_status_to_yojson x.status);
      ("Source", option_to_yojson transfer_participant_to_yojson x.source);
      ("Target", option_to_yojson transfer_participant_to_yojson x.target);
      ("StartTimestamp", option_to_yojson timestamp_to_yojson x.start_timestamp);
      ("EndTimestamp", option_to_yojson timestamp_to_yojson x.end_timestamp);
      ("ActiveHandshakeId", option_to_yojson handshake_id_to_yojson x.active_handshake_id);
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
      ("Id", Some (responsibility_transfer_id_to_yojson x.id));
      ("Name", Some (responsibility_transfer_name_to_yojson x.name));
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

let policy_content_to_yojson = string_to_yojson
let aws_managed_policy_to_yojson = bool_to_yojson

let policy_type_to_yojson (x : policy_type) =
  match x with
  | SERVICE_CONTROL_POLICY -> `String "SERVICE_CONTROL_POLICY"
  | RESOURCE_CONTROL_POLICY -> `String "RESOURCE_CONTROL_POLICY"
  | TAG_POLICY -> `String "TAG_POLICY"
  | BACKUP_POLICY -> `String "BACKUP_POLICY"
  | AISERVICES_OPT_OUT_POLICY -> `String "AISERVICES_OPT_OUT_POLICY"
  | CHATBOT_POLICY -> `String "CHATBOT_POLICY"
  | DECLARATIVE_POLICY_EC2 -> `String "DECLARATIVE_POLICY_EC2"
  | SECURITYHUB_POLICY -> `String "SECURITYHUB_POLICY"
  | INSPECTOR_POLICY -> `String "INSPECTOR_POLICY"
  | UPGRADE_ROLLOUT_POLICY -> `String "UPGRADE_ROLLOUT_POLICY"
  | BEDROCK_POLICY -> `String "BEDROCK_POLICY"
  | S3_POLICY -> `String "S3_POLICY"
  | NETWORK_SECURITY_DIRECTOR_POLICY -> `String "NETWORK_SECURITY_DIRECTOR_POLICY"

let policy_description_to_yojson = string_to_yojson
let policy_name_to_yojson = string_to_yojson
let policy_arn_to_yojson = string_to_yojson
let policy_id_to_yojson = string_to_yojson

let policy_summary_to_yojson (x : policy_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson policy_id_to_yojson x.id);
      ("Arn", option_to_yojson policy_arn_to_yojson x.arn);
      ("Name", option_to_yojson policy_name_to_yojson x.name);
      ("Description", option_to_yojson policy_description_to_yojson x.description);
      ("Type", option_to_yojson policy_type_to_yojson x.type_);
      ("AwsManaged", option_to_yojson aws_managed_policy_to_yojson x.aws_managed);
    ]

let policy_to_yojson (x : policy) =
  assoc_to_yojson
    [
      ("PolicySummary", option_to_yojson policy_summary_to_yojson x.policy_summary);
      ("Content", option_to_yojson policy_content_to_yojson x.content);
    ]

let update_policy_response_to_yojson (x : update_policy_response) =
  assoc_to_yojson [ ("Policy", option_to_yojson policy_to_yojson x.policy) ]

let update_policy_request_to_yojson (x : update_policy_request) =
  assoc_to_yojson
    [
      ("PolicyId", Some (policy_id_to_yojson x.policy_id));
      ("Name", option_to_yojson policy_name_to_yojson x.name);
      ("Description", option_to_yojson policy_description_to_yojson x.description);
      ("Content", option_to_yojson policy_content_to_yojson x.content);
    ]

let organizational_unit_not_found_exception_to_yojson (x : organizational_unit_not_found_exception)
    =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let duplicate_organizational_unit_exception_to_yojson (x : duplicate_organizational_unit_exception)
    =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let path_to_yojson = string_to_yojson
let organizational_unit_name_to_yojson = string_to_yojson
let organizational_unit_arn_to_yojson = string_to_yojson
let organizational_unit_id_to_yojson = string_to_yojson

let organizational_unit_to_yojson (x : organizational_unit) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson organizational_unit_id_to_yojson x.id);
      ("Arn", option_to_yojson organizational_unit_arn_to_yojson x.arn);
      ("Name", option_to_yojson organizational_unit_name_to_yojson x.name);
      ("Path", option_to_yojson path_to_yojson x.path);
    ]

let update_organizational_unit_response_to_yojson (x : update_organizational_unit_response) =
  assoc_to_yojson
    [ ("OrganizationalUnit", option_to_yojson organizational_unit_to_yojson x.organizational_unit) ]

let update_organizational_unit_request_to_yojson (x : update_organizational_unit_request) =
  assoc_to_yojson
    [
      ("OrganizationalUnitId", Some (organizational_unit_id_to_yojson x.organizational_unit_id));
      ("Name", option_to_yojson organizational_unit_name_to_yojson x.name);
    ]

let target_not_found_exception_to_yojson (x : target_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let taggable_resource_id_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (taggable_resource_id_to_yojson x.resource_id));
      ("TagKeys", Some (tag_keys_to_yojson x.tag_keys));
    ]

let responsibility_transfer_already_in_status_exception_to_yojson
    (x : responsibility_transfer_already_in_status_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_responsibility_transfer_transition_exception_to_yojson
    (x : invalid_responsibility_transfer_transition_exception) =
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
      ("Id", Some (responsibility_transfer_id_to_yojson x.id));
      ("EndTimestamp", option_to_yojson timestamp_to_yojson x.end_timestamp);
    ]

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (taggable_resource_id_to_yojson x.resource_id));
      ("Tags", Some (tags_to_yojson x.tags));
    ]

let master_cannot_leave_organization_exception_to_yojson
    (x : master_cannot_leave_organization_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let account_not_found_exception_to_yojson (x : account_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let remove_account_from_organization_request_to_yojson
    (x : remove_account_from_organization_request) =
  assoc_to_yojson [ ("AccountId", Some (account_id_to_yojson x.account_id)) ]

let account_already_registered_exception_to_yojson (x : account_already_registered_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let service_principal_to_yojson = string_to_yojson

let register_delegated_administrator_request_to_yojson
    (x : register_delegated_administrator_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("ServicePrincipal", Some (service_principal_to_yojson x.service_principal));
    ]

let resource_policy_content_to_yojson = string_to_yojson
let resource_policy_arn_to_yojson = string_to_yojson
let resource_policy_id_to_yojson = string_to_yojson

let resource_policy_summary_to_yojson (x : resource_policy_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_policy_id_to_yojson x.id);
      ("Arn", option_to_yojson resource_policy_arn_to_yojson x.arn);
    ]

let resource_policy_to_yojson (x : resource_policy) =
  assoc_to_yojson
    [
      ( "ResourcePolicySummary",
        option_to_yojson resource_policy_summary_to_yojson x.resource_policy_summary );
      ("Content", option_to_yojson resource_policy_content_to_yojson x.content);
    ]

let put_resource_policy_response_to_yojson (x : put_resource_policy_response) =
  assoc_to_yojson
    [ ("ResourcePolicy", option_to_yojson resource_policy_to_yojson x.resource_policy) ]

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("Content", Some (resource_policy_content_to_yojson x.content));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let source_parent_not_found_exception_to_yojson (x : source_parent_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let duplicate_account_exception_to_yojson (x : duplicate_account_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let destination_parent_not_found_exception_to_yojson (x : destination_parent_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let parent_id_to_yojson = string_to_yojson

let move_account_request_to_yojson (x : move_account_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("SourceParentId", Some (parent_id_to_yojson x.source_parent_id));
      ("DestinationParentId", Some (parent_id_to_yojson x.destination_parent_id));
    ]

let next_token_to_yojson = string_to_yojson

let target_type_to_yojson (x : target_type) =
  match x with
  | ACCOUNT -> `String "ACCOUNT"
  | ORGANIZATIONAL_UNIT -> `String "ORGANIZATIONAL_UNIT"
  | ROOT -> `String "ROOT"

let target_name_to_yojson = string_to_yojson
let generic_arn_to_yojson = string_to_yojson
let policy_target_id_to_yojson = string_to_yojson

let policy_target_summary_to_yojson (x : policy_target_summary) =
  assoc_to_yojson
    [
      ("TargetId", option_to_yojson policy_target_id_to_yojson x.target_id);
      ("Arn", option_to_yojson generic_arn_to_yojson x.arn);
      ("Name", option_to_yojson target_name_to_yojson x.name);
      ("Type", option_to_yojson target_type_to_yojson x.type_);
    ]

let policy_targets_to_yojson tree = list_to_yojson policy_target_summary_to_yojson tree

let list_targets_for_policy_response_to_yojson (x : list_targets_for_policy_response) =
  assoc_to_yojson
    [
      ("Targets", option_to_yojson policy_targets_to_yojson x.targets);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_targets_for_policy_request_to_yojson (x : list_targets_for_policy_request) =
  assoc_to_yojson
    [
      ("PolicyId", Some (policy_id_to_yojson x.policy_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (taggable_resource_id_to_yojson x.resource_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let policy_type_status_to_yojson (x : policy_type_status) =
  match x with
  | ENABLED -> `String "ENABLED"
  | PENDING_ENABLE -> `String "PENDING_ENABLE"
  | PENDING_DISABLE -> `String "PENDING_DISABLE"

let policy_type_summary_to_yojson (x : policy_type_summary) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson policy_type_to_yojson x.type_);
      ("Status", option_to_yojson policy_type_status_to_yojson x.status);
    ]

let policy_types_to_yojson tree = list_to_yojson policy_type_summary_to_yojson tree
let root_name_to_yojson = string_to_yojson
let root_arn_to_yojson = string_to_yojson
let root_id_to_yojson = string_to_yojson

let root_to_yojson (x : root) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson root_id_to_yojson x.id);
      ("Arn", option_to_yojson root_arn_to_yojson x.arn);
      ("Name", option_to_yojson root_name_to_yojson x.name);
      ("PolicyTypes", option_to_yojson policy_types_to_yojson x.policy_types);
    ]

let roots_to_yojson tree = list_to_yojson root_to_yojson tree

let list_roots_response_to_yojson (x : list_roots_response) =
  assoc_to_yojson
    [
      ("Roots", option_to_yojson roots_to_yojson x.roots);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_roots_request_to_yojson (x : list_roots_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let policies_to_yojson tree = list_to_yojson policy_summary_to_yojson tree

let list_policies_for_target_response_to_yojson (x : list_policies_for_target_response) =
  assoc_to_yojson
    [
      ("Policies", option_to_yojson policies_to_yojson x.policies);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_policies_for_target_request_to_yojson (x : list_policies_for_target_request) =
  assoc_to_yojson
    [
      ("TargetId", Some (policy_target_id_to_yojson x.target_id));
      ("Filter", Some (policy_type_to_yojson x.filter));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_policies_response_to_yojson (x : list_policies_response) =
  assoc_to_yojson
    [
      ("Policies", option_to_yojson policies_to_yojson x.policies);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_policies_request_to_yojson (x : list_policies_request) =
  assoc_to_yojson
    [
      ("Filter", Some (policy_type_to_yojson x.filter));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let child_not_found_exception_to_yojson (x : child_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let parent_type_to_yojson (x : parent_type) =
  match x with ROOT -> `String "ROOT" | ORGANIZATIONAL_UNIT -> `String "ORGANIZATIONAL_UNIT"

let parent_to_yojson (x : parent) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson parent_id_to_yojson x.id);
      ("Type", option_to_yojson parent_type_to_yojson x.type_);
    ]

let parents_to_yojson tree = list_to_yojson parent_to_yojson tree

let list_parents_response_to_yojson (x : list_parents_response) =
  assoc_to_yojson
    [
      ("Parents", option_to_yojson parents_to_yojson x.parents);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let child_id_to_yojson = string_to_yojson

let list_parents_request_to_yojson (x : list_parents_request) =
  assoc_to_yojson
    [
      ("ChildId", Some (child_id_to_yojson x.child_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let responsibility_transfers_to_yojson tree = list_to_yojson responsibility_transfer_to_yojson tree

let list_outbound_responsibility_transfers_response_to_yojson
    (x : list_outbound_responsibility_transfers_response) =
  assoc_to_yojson
    [
      ( "ResponsibilityTransfers",
        option_to_yojson responsibility_transfers_to_yojson x.responsibility_transfers );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_outbound_responsibility_transfers_request_to_yojson
    (x : list_outbound_responsibility_transfers_request) =
  assoc_to_yojson
    [
      ("Type", Some (responsibility_transfer_type_to_yojson x.type_));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let parent_not_found_exception_to_yojson (x : parent_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let organizational_units_to_yojson tree = list_to_yojson organizational_unit_to_yojson tree

let list_organizational_units_for_parent_response_to_yojson
    (x : list_organizational_units_for_parent_response) =
  assoc_to_yojson
    [
      ("OrganizationalUnits", option_to_yojson organizational_units_to_yojson x.organizational_units);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_organizational_units_for_parent_request_to_yojson
    (x : list_organizational_units_for_parent_request) =
  assoc_to_yojson
    [
      ("ParentId", Some (parent_id_to_yojson x.parent_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_inbound_responsibility_transfers_response_to_yojson
    (x : list_inbound_responsibility_transfers_response) =
  assoc_to_yojson
    [
      ( "ResponsibilityTransfers",
        option_to_yojson responsibility_transfers_to_yojson x.responsibility_transfers );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_inbound_responsibility_transfers_request_to_yojson
    (x : list_inbound_responsibility_transfers_request) =
  assoc_to_yojson
    [
      ("Type", Some (responsibility_transfer_type_to_yojson x.type_));
      ("Id", option_to_yojson responsibility_transfer_id_to_yojson x.id);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let handshake_resource_type_to_yojson (x : handshake_resource_type) =
  match x with
  | ACCOUNT -> `String "ACCOUNT"
  | ORGANIZATION -> `String "ORGANIZATION"
  | ORGANIZATION_FEATURE_SET -> `String "ORGANIZATION_FEATURE_SET"
  | EMAIL -> `String "EMAIL"
  | MASTER_EMAIL -> `String "MASTER_EMAIL"
  | MASTER_NAME -> `String "MASTER_NAME"
  | NOTES -> `String "NOTES"
  | PARENT_HANDSHAKE -> `String "PARENT_HANDSHAKE"
  | RESPONSIBILITY_TRANSFER -> `String "RESPONSIBILITY_TRANSFER"
  | TRANSFER_START_TIMESTAMP -> `String "TRANSFER_START_TIMESTAMP"
  | TRANSFER_TYPE -> `String "TRANSFER_TYPE"
  | MANAGEMENT_ACCOUNT -> `String "MANAGEMENT_ACCOUNT"
  | MANAGEMENT_EMAIL -> `String "MANAGEMENT_EMAIL"
  | MANAGEMENT_NAME -> `String "MANAGEMENT_NAME"

let handshake_resource_value_to_yojson = string_to_yojson

let rec handshake_resources_to_yojson tree = list_to_yojson handshake_resource_to_yojson tree

and handshake_resource_to_yojson (x : handshake_resource) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson handshake_resource_value_to_yojson x.value);
      ("Type", option_to_yojson handshake_resource_type_to_yojson x.type_);
      ("Resources", option_to_yojson handshake_resources_to_yojson x.resources);
    ]

let action_type_to_yojson (x : action_type) =
  match x with
  | INVITE_ACCOUNT_TO_ORGANIZATION -> `String "INVITE"
  | ENABLE_ALL_FEATURES -> `String "ENABLE_ALL_FEATURES"
  | APPROVE_ALL_FEATURES -> `String "APPROVE_ALL_FEATURES"
  | ADD_ORGANIZATIONS_SERVICE_LINKED_ROLE -> `String "ADD_ORGANIZATIONS_SERVICE_LINKED_ROLE"
  | TRANSFER_RESPONSIBILITY -> `String "TRANSFER_RESPONSIBILITY"

let handshake_state_to_yojson (x : handshake_state) =
  match x with
  | REQUESTED -> `String "REQUESTED"
  | OPEN -> `String "OPEN"
  | CANCELED -> `String "CANCELED"
  | ACCEPTED -> `String "ACCEPTED"
  | DECLINED -> `String "DECLINED"
  | EXPIRED -> `String "EXPIRED"

let handshake_party_type_to_yojson (x : handshake_party_type) =
  match x with
  | ACCOUNT -> `String "ACCOUNT"
  | ORGANIZATION -> `String "ORGANIZATION"
  | EMAIL -> `String "EMAIL"

let handshake_party_id_to_yojson = string_to_yojson

let handshake_party_to_yojson (x : handshake_party) =
  assoc_to_yojson
    [
      ("Id", Some (handshake_party_id_to_yojson x.id));
      ("Type", Some (handshake_party_type_to_yojson x.type_));
    ]

let handshake_parties_to_yojson tree = list_to_yojson handshake_party_to_yojson tree
let handshake_arn_to_yojson = string_to_yojson

let handshake_to_yojson (x : handshake) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson handshake_id_to_yojson x.id);
      ("Arn", option_to_yojson handshake_arn_to_yojson x.arn);
      ("Parties", option_to_yojson handshake_parties_to_yojson x.parties);
      ("State", option_to_yojson handshake_state_to_yojson x.state);
      ("RequestedTimestamp", option_to_yojson timestamp_to_yojson x.requested_timestamp);
      ("ExpirationTimestamp", option_to_yojson timestamp_to_yojson x.expiration_timestamp);
      ("Action", option_to_yojson action_type_to_yojson x.action);
      ("Resources", option_to_yojson handshake_resources_to_yojson x.resources);
    ]

let handshakes_to_yojson tree = list_to_yojson handshake_to_yojson tree

let list_handshakes_for_organization_response_to_yojson
    (x : list_handshakes_for_organization_response) =
  assoc_to_yojson
    [
      ("Handshakes", option_to_yojson handshakes_to_yojson x.handshakes);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let handshake_filter_to_yojson (x : handshake_filter) =
  assoc_to_yojson
    [
      ("ActionType", option_to_yojson action_type_to_yojson x.action_type);
      ("ParentHandshakeId", option_to_yojson handshake_id_to_yojson x.parent_handshake_id);
    ]

let list_handshakes_for_organization_request_to_yojson
    (x : list_handshakes_for_organization_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson handshake_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_handshakes_for_account_response_to_yojson (x : list_handshakes_for_account_response) =
  assoc_to_yojson
    [
      ("Handshakes", option_to_yojson handshakes_to_yojson x.handshakes);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_handshakes_for_account_request_to_yojson (x : list_handshakes_for_account_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson handshake_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let effective_policy_not_found_exception_to_yojson (x : effective_policy_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let policy_ids_to_yojson tree = list_to_yojson policy_id_to_yojson tree
let path_to_error_to_yojson = string_to_yojson
let error_message_to_yojson = string_to_yojson
let error_code_to_yojson = string_to_yojson

let effective_policy_validation_error_to_yojson (x : effective_policy_validation_error) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("PathToError", option_to_yojson path_to_error_to_yojson x.path_to_error);
      ("ContributingPolicies", option_to_yojson policy_ids_to_yojson x.contributing_policies);
    ]

let effective_policy_validation_errors_to_yojson tree =
  list_to_yojson effective_policy_validation_error_to_yojson tree

let effective_policy_type_to_yojson (x : effective_policy_type) =
  match x with
  | TAG_POLICY -> `String "TAG_POLICY"
  | BACKUP_POLICY -> `String "BACKUP_POLICY"
  | AISERVICES_OPT_OUT_POLICY -> `String "AISERVICES_OPT_OUT_POLICY"
  | CHATBOT_POLICY -> `String "CHATBOT_POLICY"
  | DECLARATIVE_POLICY_EC2 -> `String "DECLARATIVE_POLICY_EC2"
  | SECURITYHUB_POLICY -> `String "SECURITYHUB_POLICY"
  | INSPECTOR_POLICY -> `String "INSPECTOR_POLICY"
  | UPGRADE_ROLLOUT_POLICY -> `String "UPGRADE_ROLLOUT_POLICY"
  | BEDROCK_POLICY -> `String "BEDROCK_POLICY"
  | S3_POLICY -> `String "S3_POLICY"
  | NETWORK_SECURITY_DIRECTOR_POLICY -> `String "NETWORK_SECURITY_DIRECTOR_POLICY"

let list_effective_policy_validation_errors_response_to_yojson
    (x : list_effective_policy_validation_errors_response) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("PolicyType", option_to_yojson effective_policy_type_to_yojson x.policy_type);
      ("Path", option_to_yojson path_to_yojson x.path);
      ("EvaluationTimestamp", option_to_yojson timestamp_to_yojson x.evaluation_timestamp);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "EffectivePolicyValidationErrors",
        option_to_yojson effective_policy_validation_errors_to_yojson
          x.effective_policy_validation_errors );
    ]

let list_effective_policy_validation_errors_request_to_yojson
    (x : list_effective_policy_validation_errors_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("PolicyType", Some (effective_policy_type_to_yojson x.policy_type));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let account_not_registered_exception_to_yojson (x : account_not_registered_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let delegated_service_to_yojson (x : delegated_service) =
  assoc_to_yojson
    [
      ("ServicePrincipal", option_to_yojson service_principal_to_yojson x.service_principal);
      ("DelegationEnabledDate", option_to_yojson timestamp_to_yojson x.delegation_enabled_date);
    ]

let delegated_services_to_yojson tree = list_to_yojson delegated_service_to_yojson tree

let list_delegated_services_for_account_response_to_yojson
    (x : list_delegated_services_for_account_response) =
  assoc_to_yojson
    [
      ("DelegatedServices", option_to_yojson delegated_services_to_yojson x.delegated_services);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_delegated_services_for_account_request_to_yojson
    (x : list_delegated_services_for_account_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let account_joined_method_to_yojson (x : account_joined_method) =
  match x with INVITED -> `String "INVITED" | CREATED -> `String "CREATED"

let account_state_to_yojson (x : account_state) =
  match x with
  | PENDING_ACTIVATION -> `String "PENDING_ACTIVATION"
  | ACTIVE -> `String "ACTIVE"
  | SUSPENDED -> `String "SUSPENDED"
  | PENDING_CLOSURE -> `String "PENDING_CLOSURE"
  | CLOSED -> `String "CLOSED"

let account_status_to_yojson (x : account_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | SUSPENDED -> `String "SUSPENDED"
  | PENDING_CLOSURE -> `String "PENDING_CLOSURE"

let account_name_to_yojson = string_to_yojson
let account_arn_to_yojson = string_to_yojson

let delegated_administrator_to_yojson (x : delegated_administrator) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson account_id_to_yojson x.id);
      ("Arn", option_to_yojson account_arn_to_yojson x.arn);
      ("Email", option_to_yojson email_to_yojson x.email);
      ("Name", option_to_yojson account_name_to_yojson x.name);
      ("Status", option_to_yojson account_status_to_yojson x.status);
      ("State", option_to_yojson account_state_to_yojson x.state);
      ("JoinedMethod", option_to_yojson account_joined_method_to_yojson x.joined_method);
      ("JoinedTimestamp", option_to_yojson timestamp_to_yojson x.joined_timestamp);
      ("DelegationEnabledDate", option_to_yojson timestamp_to_yojson x.delegation_enabled_date);
    ]

let delegated_administrators_to_yojson tree = list_to_yojson delegated_administrator_to_yojson tree

let list_delegated_administrators_response_to_yojson (x : list_delegated_administrators_response) =
  assoc_to_yojson
    [
      ( "DelegatedAdministrators",
        option_to_yojson delegated_administrators_to_yojson x.delegated_administrators );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_delegated_administrators_request_to_yojson (x : list_delegated_administrators_request) =
  assoc_to_yojson
    [
      ("ServicePrincipal", option_to_yojson service_principal_to_yojson x.service_principal);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let create_account_failure_reason_to_yojson (x : create_account_failure_reason) =
  match x with
  | ACCOUNT_LIMIT_EXCEEDED -> `String "ACCOUNT_LIMIT_EXCEEDED"
  | EMAIL_ALREADY_EXISTS -> `String "EMAIL_ALREADY_EXISTS"
  | INVALID_ADDRESS -> `String "INVALID_ADDRESS"
  | INVALID_EMAIL -> `String "INVALID_EMAIL"
  | CONCURRENT_ACCOUNT_MODIFICATION -> `String "CONCURRENT_ACCOUNT_MODIFICATION"
  | INTERNAL_FAILURE -> `String "INTERNAL_FAILURE"
  | GOVCLOUD_ACCOUNT_ALREADY_EXISTS -> `String "GOVCLOUD_ACCOUNT_ALREADY_EXISTS"
  | MISSING_BUSINESS_VALIDATION -> `String "MISSING_BUSINESS_VALIDATION"
  | FAILED_BUSINESS_VALIDATION -> `String "FAILED_BUSINESS_VALIDATION"
  | PENDING_BUSINESS_VALIDATIONv -> `String "PENDING_BUSINESS_VALIDATION"
  | INVALID_IDENTITY_FOR_BUSINESS_VALIDATION -> `String "INVALID_IDENTITY_FOR_BUSINESS_VALIDATION"
  | UNKNOWN_BUSINESS_VALIDATION -> `String "UNKNOWN_BUSINESS_VALIDATION"
  | MISSING_PAYMENT_INSTRUMENT -> `String "MISSING_PAYMENT_INSTRUMENT"
  | INVALID_PAYMENT_INSTRUMENT -> `String "INVALID_PAYMENT_INSTRUMENT"
  | UPDATE_EXISTING_RESOURCE_POLICY_WITH_TAGS_NOT_SUPPORTED ->
      `String "UPDATE_EXISTING_RESOURCE_POLICY_WITH_TAGS_NOT_SUPPORTED"

let create_account_state_to_yojson (x : create_account_state) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"

let create_account_name_to_yojson = string_to_yojson
let create_account_request_id_to_yojson = string_to_yojson

let create_account_status_to_yojson (x : create_account_status) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson create_account_request_id_to_yojson x.id);
      ("AccountName", option_to_yojson create_account_name_to_yojson x.account_name);
      ("State", option_to_yojson create_account_state_to_yojson x.state);
      ("RequestedTimestamp", option_to_yojson timestamp_to_yojson x.requested_timestamp);
      ("CompletedTimestamp", option_to_yojson timestamp_to_yojson x.completed_timestamp);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("GovCloudAccountId", option_to_yojson account_id_to_yojson x.gov_cloud_account_id);
      ("FailureReason", option_to_yojson create_account_failure_reason_to_yojson x.failure_reason);
    ]

let create_account_statuses_to_yojson tree = list_to_yojson create_account_status_to_yojson tree

let list_create_account_status_response_to_yojson (x : list_create_account_status_response) =
  assoc_to_yojson
    [
      ( "CreateAccountStatuses",
        option_to_yojson create_account_statuses_to_yojson x.create_account_statuses );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let create_account_states_to_yojson tree = list_to_yojson create_account_state_to_yojson tree

let list_create_account_status_request_to_yojson (x : list_create_account_status_request) =
  assoc_to_yojson
    [
      ("States", option_to_yojson create_account_states_to_yojson x.states);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let child_type_to_yojson (x : child_type) =
  match x with ACCOUNT -> `String "ACCOUNT" | ORGANIZATIONAL_UNIT -> `String "ORGANIZATIONAL_UNIT"

let child_to_yojson (x : child) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson child_id_to_yojson x.id);
      ("Type", option_to_yojson child_type_to_yojson x.type_);
    ]

let children_to_yojson tree = list_to_yojson child_to_yojson tree

let list_children_response_to_yojson (x : list_children_response) =
  assoc_to_yojson
    [
      ("Children", option_to_yojson children_to_yojson x.children);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_children_request_to_yojson (x : list_children_request) =
  assoc_to_yojson
    [
      ("ParentId", Some (parent_id_to_yojson x.parent_id));
      ("ChildType", Some (child_type_to_yojson x.child_type));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let enabled_service_principal_to_yojson (x : enabled_service_principal) =
  assoc_to_yojson
    [
      ("ServicePrincipal", option_to_yojson service_principal_to_yojson x.service_principal);
      ("DateEnabled", option_to_yojson timestamp_to_yojson x.date_enabled);
    ]

let enabled_service_principals_to_yojson tree =
  list_to_yojson enabled_service_principal_to_yojson tree

let list_aws_service_access_for_organization_response_to_yojson
    (x : list_aws_service_access_for_organization_response) =
  assoc_to_yojson
    [
      ( "EnabledServicePrincipals",
        option_to_yojson enabled_service_principals_to_yojson x.enabled_service_principals );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_aws_service_access_for_organization_request_to_yojson
    (x : list_aws_service_access_for_organization_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let paths_to_yojson tree = list_to_yojson path_to_yojson tree

let account_to_yojson (x : account) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson account_id_to_yojson x.id);
      ("Arn", option_to_yojson account_arn_to_yojson x.arn);
      ("Email", option_to_yojson email_to_yojson x.email);
      ("Name", option_to_yojson account_name_to_yojson x.name);
      ("Status", option_to_yojson account_status_to_yojson x.status);
      ("State", option_to_yojson account_state_to_yojson x.state);
      ("Paths", option_to_yojson paths_to_yojson x.paths);
      ("JoinedMethod", option_to_yojson account_joined_method_to_yojson x.joined_method);
      ("JoinedTimestamp", option_to_yojson timestamp_to_yojson x.joined_timestamp);
    ]

let accounts_to_yojson tree = list_to_yojson account_to_yojson tree

let list_accounts_with_invalid_effective_policy_response_to_yojson
    (x : list_accounts_with_invalid_effective_policy_response) =
  assoc_to_yojson
    [
      ("Accounts", option_to_yojson accounts_to_yojson x.accounts);
      ("PolicyType", option_to_yojson effective_policy_type_to_yojson x.policy_type);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_accounts_with_invalid_effective_policy_request_to_yojson
    (x : list_accounts_with_invalid_effective_policy_request) =
  assoc_to_yojson
    [
      ("PolicyType", Some (effective_policy_type_to_yojson x.policy_type));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_accounts_for_parent_response_to_yojson (x : list_accounts_for_parent_response) =
  assoc_to_yojson
    [
      ("Accounts", option_to_yojson accounts_to_yojson x.accounts);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_accounts_for_parent_request_to_yojson (x : list_accounts_for_parent_request) =
  assoc_to_yojson
    [
      ("ParentId", Some (parent_id_to_yojson x.parent_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_accounts_response_to_yojson (x : list_accounts_response) =
  assoc_to_yojson
    [
      ("Accounts", option_to_yojson accounts_to_yojson x.accounts);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_accounts_request_to_yojson (x : list_accounts_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let handshake_constraint_violation_exception_reason_to_yojson
    (x : handshake_constraint_violation_exception_reason) =
  match x with
  | ACCOUNT_NUMBER_LIMIT_EXCEEDED -> `String "ACCOUNT_NUMBER_LIMIT_EXCEEDED"
  | HANDSHAKE_RATE_LIMIT_EXCEEDED -> `String "HANDSHAKE_RATE_LIMIT_EXCEEDED"
  | ALREADY_IN_AN_ORGANIZATION -> `String "ALREADY_IN_AN_ORGANIZATION"
  | ORGANIZATION_ALREADY_HAS_ALL_FEATURES -> `String "ORGANIZATION_ALREADY_HAS_ALL_FEATURES"
  | ORGANIZATION_IS_ALREADY_PENDING_ALL_FEATURES_MIGRATION ->
      `String "ORGANIZATION_IS_ALREADY_PENDING_ALL_FEATURES_MIGRATION"
  | INVITE_DISABLED_DURING_ENABLE_ALL_FEATURES ->
      `String "INVITE_DISABLED_DURING_ENABLE_ALL_FEATURES"
  | PAYMENT_INSTRUMENT_REQUIRED -> `String "PAYMENT_INSTRUMENT_REQUIRED"
  | ORGANIZATION_FROM_DIFFERENT_SELLER_OF_RECORD ->
      `String "ORGANIZATION_FROM_DIFFERENT_SELLER_OF_RECORD"
  | ORGANIZATION_MEMBERSHIP_CHANGE_RATE_LIMIT_EXCEEDED ->
      `String "ORGANIZATION_MEMBERSHIP_CHANGE_RATE_LIMIT_EXCEEDED"
  | MANAGEMENT_ACCOUNT_EMAIL_NOT_VERIFIED -> `String "MANAGEMENT_ACCOUNT_EMAIL_NOT_VERIFIED"
  | RESPONSIBILITY_TRANSFER_ALREADY_EXISTS -> `String "RESPONSIBILITY_TRANSFER_ALREADY_EXISTS"
  | SOURCE_AND_TARGET_CANNOT_MATCH -> `String "SOURCE_AND_TARGET_CANNOT_MATCH"
  | UNUSED_PREPAYMENT_BALANCE -> `String "UNUSED_PREPAYMENT_BALANCE"
  | LEGACY_PERMISSIONS_STILL_IN_USE -> `String "LEGACY_PERMISSIONS_STILL_IN_USE"

let handshake_constraint_violation_exception_to_yojson
    (x : handshake_constraint_violation_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("Reason", option_to_yojson handshake_constraint_violation_exception_reason_to_yojson x.reason);
    ]

let duplicate_handshake_exception_to_yojson (x : duplicate_handshake_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let invite_organization_to_transfer_responsibility_response_to_yojson
    (x : invite_organization_to_transfer_responsibility_response) =
  assoc_to_yojson [ ("Handshake", option_to_yojson handshake_to_yojson x.handshake) ]

let handshake_notes_to_yojson = string_to_yojson

let invite_organization_to_transfer_responsibility_request_to_yojson
    (x : invite_organization_to_transfer_responsibility_request) =
  assoc_to_yojson
    [
      ("Type", Some (responsibility_transfer_type_to_yojson x.type_));
      ("Target", Some (handshake_party_to_yojson x.target));
      ("Notes", option_to_yojson handshake_notes_to_yojson x.notes);
      ("StartTimestamp", Some (timestamp_to_yojson x.start_timestamp));
      ("SourceName", Some (responsibility_transfer_name_to_yojson x.source_name));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let finalizing_organization_exception_to_yojson (x : finalizing_organization_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let account_owner_not_verified_exception_to_yojson (x : account_owner_not_verified_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let invite_account_to_organization_response_to_yojson (x : invite_account_to_organization_response)
    =
  assoc_to_yojson [ ("Handshake", option_to_yojson handshake_to_yojson x.handshake) ]

let invite_account_to_organization_request_to_yojson (x : invite_account_to_organization_request) =
  assoc_to_yojson
    [
      ("Target", Some (handshake_party_to_yojson x.target));
      ("Notes", option_to_yojson handshake_notes_to_yojson x.notes);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let root_not_found_exception_to_yojson (x : root_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let policy_type_not_available_for_organization_exception_to_yojson
    (x : policy_type_not_available_for_organization_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let policy_type_already_enabled_exception_to_yojson (x : policy_type_already_enabled_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let enable_policy_type_response_to_yojson (x : enable_policy_type_response) =
  assoc_to_yojson [ ("Root", option_to_yojson root_to_yojson x.root) ]

let enable_policy_type_request_to_yojson (x : enable_policy_type_request) =
  assoc_to_yojson
    [
      ("RootId", Some (root_id_to_yojson x.root_id));
      ("PolicyType", Some (policy_type_to_yojson x.policy_type));
    ]

let enable_aws_service_access_request_to_yojson (x : enable_aws_service_access_request) =
  assoc_to_yojson [ ("ServicePrincipal", Some (service_principal_to_yojson x.service_principal)) ]

let enable_all_features_response_to_yojson (x : enable_all_features_response) =
  assoc_to_yojson [ ("Handshake", option_to_yojson handshake_to_yojson x.handshake) ]

let enable_all_features_request_to_yojson = unit_to_yojson

let policy_type_not_enabled_exception_to_yojson (x : policy_type_not_enabled_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let disable_policy_type_response_to_yojson (x : disable_policy_type_response) =
  assoc_to_yojson [ ("Root", option_to_yojson root_to_yojson x.root) ]

let disable_policy_type_request_to_yojson (x : disable_policy_type_request) =
  assoc_to_yojson
    [
      ("RootId", Some (root_id_to_yojson x.root_id));
      ("PolicyType", Some (policy_type_to_yojson x.policy_type));
    ]

let disable_aws_service_access_request_to_yojson (x : disable_aws_service_access_request) =
  assoc_to_yojson [ ("ServicePrincipal", Some (service_principal_to_yojson x.service_principal)) ]

let policy_not_attached_exception_to_yojson (x : policy_not_attached_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let detach_policy_request_to_yojson (x : detach_policy_request) =
  assoc_to_yojson
    [
      ("PolicyId", Some (policy_id_to_yojson x.policy_id));
      ("TargetId", Some (policy_target_id_to_yojson x.target_id));
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

let resource_policy_not_found_exception_to_yojson (x : resource_policy_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

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

let organization_feature_set_to_yojson (x : organization_feature_set) =
  match x with ALL -> `String "ALL" | CONSOLIDATED_BILLING -> `String "CONSOLIDATED_BILLING"

let organization_arn_to_yojson = string_to_yojson
let organization_id_to_yojson = string_to_yojson

let organization_to_yojson (x : organization) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson organization_id_to_yojson x.id);
      ("Arn", option_to_yojson organization_arn_to_yojson x.arn);
      ("FeatureSet", option_to_yojson organization_feature_set_to_yojson x.feature_set);
      ("MasterAccountArn", option_to_yojson account_arn_to_yojson x.master_account_arn);
      ("MasterAccountId", option_to_yojson account_id_to_yojson x.master_account_id);
      ("MasterAccountEmail", option_to_yojson email_to_yojson x.master_account_email);
      ("AvailablePolicyTypes", option_to_yojson policy_types_to_yojson x.available_policy_types);
    ]

let describe_organization_response_to_yojson (x : describe_organization_response) =
  assoc_to_yojson [ ("Organization", option_to_yojson organization_to_yojson x.organization) ]

let handshake_not_found_exception_to_yojson (x : handshake_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let describe_handshake_response_to_yojson (x : describe_handshake_response) =
  assoc_to_yojson [ ("Handshake", option_to_yojson handshake_to_yojson x.handshake) ]

let describe_handshake_request_to_yojson (x : describe_handshake_request) =
  assoc_to_yojson [ ("HandshakeId", Some (handshake_id_to_yojson x.handshake_id)) ]

let effective_policy_to_yojson (x : effective_policy) =
  assoc_to_yojson
    [
      ("PolicyContent", option_to_yojson policy_content_to_yojson x.policy_content);
      ("LastUpdatedTimestamp", option_to_yojson timestamp_to_yojson x.last_updated_timestamp);
      ("TargetId", option_to_yojson policy_target_id_to_yojson x.target_id);
      ("PolicyType", option_to_yojson effective_policy_type_to_yojson x.policy_type);
    ]

let describe_effective_policy_response_to_yojson (x : describe_effective_policy_response) =
  assoc_to_yojson
    [ ("EffectivePolicy", option_to_yojson effective_policy_to_yojson x.effective_policy) ]

let describe_effective_policy_request_to_yojson (x : describe_effective_policy_request) =
  assoc_to_yojson
    [
      ("PolicyType", Some (effective_policy_type_to_yojson x.policy_type));
      ("TargetId", option_to_yojson policy_target_id_to_yojson x.target_id);
    ]

let create_account_status_not_found_exception_to_yojson
    (x : create_account_status_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

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

let describe_account_response_to_yojson (x : describe_account_response) =
  assoc_to_yojson [ ("Account", option_to_yojson account_to_yojson x.account) ]

let describe_account_request_to_yojson (x : describe_account_request) =
  assoc_to_yojson [ ("AccountId", Some (account_id_to_yojson x.account_id)) ]

let deregister_delegated_administrator_request_to_yojson
    (x : deregister_delegated_administrator_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("ServicePrincipal", Some (service_principal_to_yojson x.service_principal));
    ]

let policy_in_use_exception_to_yojson (x : policy_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let delete_policy_request_to_yojson (x : delete_policy_request) =
  assoc_to_yojson [ ("PolicyId", Some (policy_id_to_yojson x.policy_id)) ]

let organizational_unit_not_empty_exception_to_yojson (x : organizational_unit_not_empty_exception)
    =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let delete_organizational_unit_request_to_yojson (x : delete_organizational_unit_request) =
  assoc_to_yojson
    [ ("OrganizationalUnitId", Some (organizational_unit_id_to_yojson x.organizational_unit_id)) ]

let organization_not_empty_exception_to_yojson (x : organization_not_empty_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_handshake_transition_exception_to_yojson (x : invalid_handshake_transition_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let handshake_already_in_state_exception_to_yojson (x : handshake_already_in_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let decline_handshake_response_to_yojson (x : decline_handshake_response) =
  assoc_to_yojson [ ("Handshake", option_to_yojson handshake_to_yojson x.handshake) ]

let decline_handshake_request_to_yojson (x : decline_handshake_request) =
  assoc_to_yojson [ ("HandshakeId", Some (handshake_id_to_yojson x.handshake_id)) ]

let create_policy_response_to_yojson (x : create_policy_response) =
  assoc_to_yojson [ ("Policy", option_to_yojson policy_to_yojson x.policy) ]

let create_policy_request_to_yojson (x : create_policy_request) =
  assoc_to_yojson
    [
      ("Content", Some (policy_content_to_yojson x.content));
      ("Description", Some (policy_description_to_yojson x.description));
      ("Name", Some (policy_name_to_yojson x.name));
      ("Type", Some (policy_type_to_yojson x.type_));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_organizational_unit_response_to_yojson (x : create_organizational_unit_response) =
  assoc_to_yojson
    [ ("OrganizationalUnit", option_to_yojson organizational_unit_to_yojson x.organizational_unit) ]

let create_organizational_unit_request_to_yojson (x : create_organizational_unit_request) =
  assoc_to_yojson
    [
      ("ParentId", Some (parent_id_to_yojson x.parent_id));
      ("Name", Some (organizational_unit_name_to_yojson x.name));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

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
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("Reason", option_to_yojson access_denied_for_dependency_exception_reason_to_yojson x.reason);
    ]

let create_organization_response_to_yojson (x : create_organization_response) =
  assoc_to_yojson [ ("Organization", option_to_yojson organization_to_yojson x.organization) ]

let create_organization_request_to_yojson (x : create_organization_request) =
  assoc_to_yojson
    [ ("FeatureSet", option_to_yojson organization_feature_set_to_yojson x.feature_set) ]

let create_gov_cloud_account_response_to_yojson (x : create_gov_cloud_account_response) =
  assoc_to_yojson
    [
      ( "CreateAccountStatus",
        option_to_yojson create_account_status_to_yojson x.create_account_status );
    ]

let iam_user_access_to_billing_to_yojson (x : iam_user_access_to_billing) =
  match x with ALLOW -> `String "ALLOW" | DENY -> `String "DENY"

let role_name_to_yojson = string_to_yojson

let create_gov_cloud_account_request_to_yojson (x : create_gov_cloud_account_request) =
  assoc_to_yojson
    [
      ("Email", Some (email_to_yojson x.email));
      ("AccountName", Some (create_account_name_to_yojson x.account_name));
      ("RoleName", option_to_yojson role_name_to_yojson x.role_name);
      ( "IamUserAccessToBilling",
        option_to_yojson iam_user_access_to_billing_to_yojson x.iam_user_access_to_billing );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
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
      ("Email", Some (email_to_yojson x.email));
      ("AccountName", Some (create_account_name_to_yojson x.account_name));
      ("RoleName", option_to_yojson role_name_to_yojson x.role_name);
      ( "IamUserAccessToBilling",
        option_to_yojson iam_user_access_to_billing_to_yojson x.iam_user_access_to_billing );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let account_already_closed_exception_to_yojson (x : account_already_closed_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let close_account_request_to_yojson (x : close_account_request) =
  assoc_to_yojson [ ("AccountId", Some (account_id_to_yojson x.account_id)) ]

let cancel_handshake_response_to_yojson (x : cancel_handshake_response) =
  assoc_to_yojson [ ("Handshake", option_to_yojson handshake_to_yojson x.handshake) ]

let cancel_handshake_request_to_yojson (x : cancel_handshake_request) =
  assoc_to_yojson [ ("HandshakeId", Some (handshake_id_to_yojson x.handshake_id)) ]

let duplicate_policy_attachment_exception_to_yojson (x : duplicate_policy_attachment_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let attach_policy_request_to_yojson (x : attach_policy_request) =
  assoc_to_yojson
    [
      ("PolicyId", Some (policy_id_to_yojson x.policy_id));
      ("TargetId", Some (policy_target_id_to_yojson x.target_id));
    ]

let accept_handshake_response_to_yojson (x : accept_handshake_response) =
  assoc_to_yojson [ ("Handshake", option_to_yojson handshake_to_yojson x.handshake) ]

let accept_handshake_request_to_yojson (x : accept_handshake_request) =
  assoc_to_yojson [ ("HandshakeId", Some (handshake_id_to_yojson x.handshake_id)) ]
