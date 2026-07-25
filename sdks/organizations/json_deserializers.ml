open Smaws_Lib.Json.DeserializeHelpers
open Types

let exception_message_of_yojson = string_of_yojson

let aws_organizations_not_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : aws_organizations_not_in_use_exception)

let unsupported_api_endpoint_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : unsupported_api_endpoint_exception)

let exception_type_of_yojson = string_of_yojson

let too_many_requests_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key exception_type_of_yojson "Type") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
   }
    : too_many_requests_exception)

let service_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : service_exception)

let responsibility_transfer_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : responsibility_transfer_not_found_exception)

let invalid_input_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "INVALID_PARTY_TYPE_TARGET" -> INVALID_PARTY_TYPE_TARGET
    | `String "INVALID_SYNTAX_ORGANIZATION_ARN" -> INVALID_SYNTAX_ORGANIZATION
    | `String "INVALID_SYNTAX_POLICY_ID" -> INVALID_SYNTAX_POLICY
    | `String "INVALID_ENUM" -> INVALID_ENUM
    | `String "INVALID_ENUM_POLICY_TYPE" -> INVALID_ENUM_POLICY_TYPE
    | `String "INVALID_LIST_MEMBER" -> INVALID_LIST_MEMBER
    | `String "MAX_LENGTH_EXCEEDED" -> MAX_LENGTH_EXCEEDED
    | `String "MAX_VALUE_EXCEEDED" -> MAX_VALUE_EXCEEDED
    | `String "MIN_LENGTH_EXCEEDED" -> MIN_LENGTH_EXCEEDED
    | `String "MIN_VALUE_EXCEEDED" -> MIN_VALUE_EXCEEDED
    | `String "IMMUTABLE_POLICY" -> IMMUTABLE_POLICY
    | `String "INVALID_PATTERN" -> INVALID_PATTERN
    | `String "INVALID_PATTERN_TARGET_ID" -> INVALID_PATTERN_TARGET_ID
    | `String "INPUT_REQUIRED" -> INPUT_REQUIRED
    | `String "INVALID_NEXT_TOKEN" -> INVALID_PAGINATION_TOKEN
    | `String "MAX_LIMIT_EXCEEDED_FILTER" -> MAX_FILTER_LIMIT_EXCEEDED
    | `String "MOVING_ACCOUNT_BETWEEN_DIFFERENT_ROOTS" -> MOVING_ACCOUNT_BETWEEN_DIFFERENT_ROOTS
    | `String "INVALID_FULL_NAME_TARGET" -> INVALID_FULL_NAME_TARGET
    | `String "UNRECOGNIZED_SERVICE_PRINCIPAL" -> UNRECOGNIZED_SERVICE_PRINCIPAL
    | `String "INVALID_ROLE_NAME" -> INVALID_ROLE_NAME
    | `String "INVALID_SYSTEM_TAGS_PARAMETER" -> INVALID_SYSTEM_TAGS_PARAMETER
    | `String "DUPLICATE_TAG_KEY" -> DUPLICATE_TAG_KEY
    | `String "TARGET_NOT_SUPPORTED" -> TARGET_NOT_SUPPORTED
    | `String "INVALID_EMAIL_ADDRESS_TARGET" -> INVALID_EMAIL_ADDRESS_TARGET
    | `String "INVALID_RESOURCE_POLICY_JSON" -> INVALID_RESOURCE_POLICY_JSON
    | `String "INVALID_PRINCIPAL" -> INVALID_PRINCIPAL
    | `String "UNSUPPORTED_ACTION_IN_RESOURCE_POLICY" -> UNSUPPORTED_ACTION_IN_RESOURCE_POLICY
    | `String "UNSUPPORTED_POLICY_TYPE_IN_RESOURCE_POLICY" ->
        UNSUPPORTED_POLICY_TYPE_IN_RESOURCE_POLICY
    | `String "UNSUPPORTED_RESOURCE_IN_RESOURCE_POLICY" -> UNSUPPORTED_RESOURCE_IN_RESOURCE_POLICY
    | `String "NON_DETACHABLE_POLICY" -> NON_DETACHABLE_POLICY
    | `String "CALLER_REQUIRED_FIELD_MISSING" -> CALLER_REQUIRED_FIELD_MISSING
    | `String "UNSUPPORTED_ACTION_IN_RESPONSIBILITY_TRANSFER" ->
        UNSUPPORTED_ACTION_IN_RESPONSIBILITY_TRANSFER
    | `String "START_DATE_NOT_BEGINNING_OF_MONTH" -> START_DATE_NOT_BEGINNING_OF_MONTH
    | `String "START_DATE_NOT_BEGINNING_OF_DAY" -> START_DATE_NOT_BEGINNING_OF_DAY
    | `String "START_DATE_TOO_EARLY" -> START_DATE_TOO_EARLY
    | `String "START_DATE_TOO_LATE" -> START_DATE_TOO_LATE
    | `String "INVALID_START_DATE" -> INVALID_START_DATE
    | `String "END_DATE_NOT_END_OF_MONTH" -> END_DATE_NOT_END_OF_MONTH
    | `String "END_DATE_TOO_EARLY" -> END_DATE_TOO_EARLY
    | `String "INVALID_END_DATE" -> INVALID_END_DATE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InvalidInputExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "InvalidInputExceptionReason")
     : invalid_input_exception_reason)
    : invalid_input_exception_reason)

let invalid_input_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     reason =
       option_of_yojson (value_for_key invalid_input_exception_reason_of_yojson "Reason") _list path;
   }
    : invalid_input_exception)

let constraint_violation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT_NUMBER_LIMIT_EXCEEDED" -> ACCOUNT_NUMBER_LIMIT_EXCEEDED
    | `String "HANDSHAKE_RATE_LIMIT_EXCEEDED" -> HANDSHAKE_RATE_LIMIT_EXCEEDED
    | `String "OU_NUMBER_LIMIT_EXCEEDED" -> OU_NUMBER_LIMIT_EXCEEDED
    | `String "OU_DEPTH_LIMIT_EXCEEDED" -> OU_DEPTH_LIMIT_EXCEEDED
    | `String "POLICY_NUMBER_LIMIT_EXCEEDED" -> POLICY_NUMBER_LIMIT_EXCEEDED
    | `String "POLICY_CONTENT_LIMIT_EXCEEDED" -> POLICY_CONTENT_LIMIT_EXCEEDED
    | `String "MAX_POLICY_TYPE_ATTACHMENT_LIMIT_EXCEEDED" ->
        MAX_POLICY_TYPE_ATTACHMENT_LIMIT_EXCEEDED
    | `String "MIN_POLICY_TYPE_ATTACHMENT_LIMIT_EXCEEDED" ->
        MIN_POLICY_TYPE_ATTACHMENT_LIMIT_EXCEEDED
    | `String "ACCOUNT_CANNOT_LEAVE_ORGANIZATION" -> ACCOUNT_CANNOT_LEAVE_ORGANIZATION
    | `String "ACCOUNT_CANNOT_LEAVE_WITHOUT_EULA" -> ACCOUNT_CANNOT_LEAVE_WITHOUT_EULA
    | `String "ACCOUNT_CANNOT_LEAVE_WITHOUT_PHONE_VERIFICATION" ->
        ACCOUNT_CANNOT_LEAVE_WITHOUT_PHONE_VERIFICATION
    | `String "MASTER_ACCOUNT_PAYMENT_INSTRUMENT_REQUIRED" ->
        MASTER_ACCOUNT_PAYMENT_INSTRUMENT_REQUIRED
    | `String "MEMBER_ACCOUNT_PAYMENT_INSTRUMENT_REQUIRED" ->
        MEMBER_ACCOUNT_PAYMENT_INSTRUMENT_REQUIRED
    | `String "ACCOUNT_CREATION_RATE_LIMIT_EXCEEDED" -> ACCOUNT_CREATION_RATE_LIMIT_EXCEEDED
    | `String "MASTER_ACCOUNT_ADDRESS_DOES_NOT_MATCH_MARKETPLACE" ->
        MASTER_ACCOUNT_ADDRESS_DOES_NOT_MATCH_MARKETPLACE
    | `String "MASTER_ACCOUNT_MISSING_CONTACT_INFO" -> MASTER_ACCOUNT_MISSING_CONTACT_INFO
    | `String "MASTER_ACCOUNT_NOT_GOVCLOUD_ENABLED" -> MASTER_ACCOUNT_NOT_GOVCLOUD_ENABLED
    | `String "ORGANIZATION_NOT_IN_ALL_FEATURES_MODE" -> ORGANIZATION_NOT_IN_ALL_FEATURES_MODE
    | `String "CREATE_ORGANIZATION_IN_BILLING_MODE_UNSUPPORTED_REGION" ->
        CREATE_ORGANIZATION_IN_BILLING_MODE_UNSUPPORTED_REGION
    | `String "EMAIL_VERIFICATION_CODE_EXPIRED" -> EMAIL_VERIFICATION_CODE_EXPIRED
    | `String "WAIT_PERIOD_ACTIVE" -> WAIT_PERIOD_ACTIVE
    | `String "MAX_TAG_LIMIT_EXCEEDED" -> MAX_TAG_LIMIT_EXCEEDED
    | `String "TAG_POLICY_VIOLATION" -> TAG_POLICY_VIOLATION
    | `String "MAX_DELEGATED_ADMINISTRATORS_FOR_SERVICE_LIMIT_EXCEEDED" ->
        MAX_DELEGATED_ADMINISTRATORS_FOR_SERVICE_LIMIT_EXCEEDED
    | `String "CANNOT_REGISTER_MASTER_AS_DELEGATED_ADMINISTRATOR" ->
        CANNOT_REGISTER_MASTER_AS_DELEGATED_ADMINISTRATOR
    | `String "CANNOT_REMOVE_DELEGATED_ADMINISTRATOR_FROM_ORG" ->
        CANNOT_REMOVE_DELEGATED_ADMINISTRATOR_FROM_ORG
    | `String "DELEGATED_ADMINISTRATOR_EXISTS_FOR_THIS_SERVICE" ->
        DELEGATED_ADMINISTRATOR_EXISTS_FOR_THIS_SERVICE
    | `String "POLICY_TYPE_ENABLED_FOR_THIS_SERVICE" -> POLICY_TYPE_ENABLED_FOR_THIS_SERVICE
    | `String "MASTER_ACCOUNT_MISSING_BUSINESS_LICENSE" -> MASTER_ACCOUNT_MISSING_BUSINESS_LICENSE
    | `String "CANNOT_CLOSE_MANAGEMENT_ACCOUNT" -> CANNOT_CLOSE_MANAGEMENT_ACCOUNT
    | `String "CLOSE_ACCOUNT_QUOTA_EXCEEDED" -> CLOSE_ACCOUNT_QUOTA_EXCEEDED
    | `String "CLOSE_ACCOUNT_REQUESTS_LIMIT_EXCEEDED" -> CLOSE_ACCOUNT_REQUESTS_LIMIT_EXCEEDED
    | `String "SERVICE_ACCESS_NOT_ENABLED" -> SERVICE_ACCESS_NOT_ENABLED
    | `String "INVALID_PAYMENT_INSTRUMENT" -> INVALID_PAYMENT_INSTRUMENT
    | `String "ACCOUNT_CREATION_NOT_COMPLETE" -> ACCOUNT_CREATION_NOT_COMPLETE
    | `String "CANNOT_REGISTER_SUSPENDED_ACCOUNT_AS_DELEGATED_ADMINISTRATOR" ->
        CANNOT_REGISTER_SUSPENDED_ACCOUNT_AS_DELEGATED_ADMINISTRATOR
    | `String "ALL_FEATURES_MIGRATION_ORGANIZATION_SIZE_LIMIT_EXCEEDED" ->
        ALL_FEATURES_MIGRATION_ORGANIZATION_SIZE_LIMIT_EXCEEDED
    | `String "RESPONSIBILITY_TRANSFER_MAX_LEVEL_VIOLATION" ->
        RESPONSIBILITY_TRANSFER_MAX_LEVEL_VIOLATION
    | `String "RESPONSIBILITY_TRANSFER_MAX_INBOUND_QUOTA_VIOLATION" ->
        RESPONSIBILITY_TRANSFER_MAX_INBOUND_QUOTA_VIOLATION
    | `String "RESPONSIBILITY_TRANSFER_MAX_OUTBOUND_QUOTA_VIOLATION" ->
        RESPONSIBILITY_TRANSFER_MAX_OUTBOUND_QUOTA_VIOLATION
    | `String "RESPONSIBILITY_TRANSFER_MAX_TRANSFERS_QUOTA_VIOLATION" ->
        RESPONSIBILITY_TRANSFER_MAX_TRANSFERS_QUOTA_VIOLATION
    | `String "ACTIVE_RESPONSIBILITY_TRANSFER_PROCESS" -> ACTIVE_RESPONSIBILITY_TRANSFER_PROCESS
    | `String "TRANSFER_RESPONSIBILITY_TARGET_DELETION_IN_PROGRESS" ->
        TRANSFER_RESPONSIBILITY_TARGET_DELETION_IN_PROGRESS
    | `String "TRANSFER_RESPONSIBILITY_SOURCE_DELETION_IN_PROGRESS" ->
        TRANSFER_RESPONSIBILITY_SOURCE_DELETION_IN_PROGRESS
    | `String "UNSUPPORTED_PRICING" -> UNSUPPORTED_PRICING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConstraintViolationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ConstraintViolationExceptionReason")
     : constraint_violation_exception_reason)
    : constraint_violation_exception_reason)

let constraint_violation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     reason =
       option_of_yojson
         (value_for_key constraint_violation_exception_reason_of_yojson "Reason")
         _list path;
   }
    : constraint_violation_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : access_denied_exception)

let handshake_id_of_yojson = string_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let email_of_yojson = string_of_yojson
let account_id_of_yojson = string_of_yojson

let transfer_participant_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     management_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "ManagementAccountId") _list path;
     management_account_email =
       option_of_yojson (value_for_key email_of_yojson "ManagementAccountEmail") _list path;
   }
    : transfer_participant)

let responsibility_transfer_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "REQUESTED" -> REQUESTED
    | `String "DECLINED" -> DECLINED
    | `String "CANCELED" -> CANCELED
    | `String "EXPIRED" -> EXPIRED
    | `String "ACCEPTED" -> ACCEPTED
    | `String "WITHDRAWN" -> WITHDRAWN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResponsibilityTransferStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResponsibilityTransferStatus")
     : responsibility_transfer_status)
    : responsibility_transfer_status)

let responsibility_transfer_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BILLING" -> BILLING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResponsibilityTransferType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResponsibilityTransferType")
     : responsibility_transfer_type)
    : responsibility_transfer_type)

let responsibility_transfer_id_of_yojson = string_of_yojson
let responsibility_transfer_name_of_yojson = string_of_yojson
let responsibility_transfer_arn_of_yojson = string_of_yojson

let responsibility_transfer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key responsibility_transfer_arn_of_yojson "Arn") _list path;
     name =
       option_of_yojson (value_for_key responsibility_transfer_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key responsibility_transfer_id_of_yojson "Id") _list path;
     type_ =
       option_of_yojson (value_for_key responsibility_transfer_type_of_yojson "Type") _list path;
     status =
       option_of_yojson (value_for_key responsibility_transfer_status_of_yojson "Status") _list path;
     source = option_of_yojson (value_for_key transfer_participant_of_yojson "Source") _list path;
     target = option_of_yojson (value_for_key transfer_participant_of_yojson "Target") _list path;
     start_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "StartTimestamp") _list path;
     end_timestamp = option_of_yojson (value_for_key timestamp_of_yojson "EndTimestamp") _list path;
     active_handshake_id =
       option_of_yojson (value_for_key handshake_id_of_yojson "ActiveHandshakeId") _list path;
   }
    : responsibility_transfer)

let update_responsibility_transfer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     responsibility_transfer =
       option_of_yojson
         (value_for_key responsibility_transfer_of_yojson "ResponsibilityTransfer")
         _list path;
   }
    : update_responsibility_transfer_response)

let update_responsibility_transfer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key responsibility_transfer_id_of_yojson "Id" _list path;
     name = value_for_key responsibility_transfer_name_of_yojson "Name" _list path;
   }
    : update_responsibility_transfer_request)

let policy_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : policy_not_found_exception)

let policy_changes_in_progress_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : policy_changes_in_progress_exception)

let malformed_policy_document_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : malformed_policy_document_exception)

let duplicate_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : duplicate_policy_exception)

let concurrent_modification_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : concurrent_modification_exception)

let policy_content_of_yojson = string_of_yojson
let aws_managed_policy_of_yojson = bool_of_yojson

let policy_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SERVICE_CONTROL_POLICY" -> SERVICE_CONTROL_POLICY
    | `String "RESOURCE_CONTROL_POLICY" -> RESOURCE_CONTROL_POLICY
    | `String "TAG_POLICY" -> TAG_POLICY
    | `String "BACKUP_POLICY" -> BACKUP_POLICY
    | `String "AISERVICES_OPT_OUT_POLICY" -> AISERVICES_OPT_OUT_POLICY
    | `String "CHATBOT_POLICY" -> CHATBOT_POLICY
    | `String "DECLARATIVE_POLICY_EC2" -> DECLARATIVE_POLICY_EC2
    | `String "SECURITYHUB_POLICY" -> SECURITYHUB_POLICY
    | `String "INSPECTOR_POLICY" -> INSPECTOR_POLICY
    | `String "UPGRADE_ROLLOUT_POLICY" -> UPGRADE_ROLLOUT_POLICY
    | `String "BEDROCK_POLICY" -> BEDROCK_POLICY
    | `String "S3_POLICY" -> S3_POLICY
    | `String "NETWORK_SECURITY_DIRECTOR_POLICY" -> NETWORK_SECURITY_DIRECTOR_POLICY
    | `String value -> raise (deserialize_unknown_enum_value_error path "PolicyType" value)
    | _ -> raise (deserialize_wrong_type_error path "PolicyType")
     : policy_type)
    : policy_type)

let policy_description_of_yojson = string_of_yojson
let policy_name_of_yojson = string_of_yojson
let policy_arn_of_yojson = string_of_yojson
let policy_id_of_yojson = string_of_yojson

let policy_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key policy_id_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key policy_arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key policy_name_of_yojson "Name") _list path;
     description =
       option_of_yojson (value_for_key policy_description_of_yojson "Description") _list path;
     type_ = option_of_yojson (value_for_key policy_type_of_yojson "Type") _list path;
     aws_managed =
       option_of_yojson (value_for_key aws_managed_policy_of_yojson "AwsManaged") _list path;
   }
    : policy_summary)

let policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_summary =
       option_of_yojson (value_for_key policy_summary_of_yojson "PolicySummary") _list path;
     content = option_of_yojson (value_for_key policy_content_of_yojson "Content") _list path;
   }
    : policy)

let update_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy = option_of_yojson (value_for_key policy_of_yojson "Policy") _list path }
    : update_policy_response)

let update_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_id = value_for_key policy_id_of_yojson "PolicyId" _list path;
     name = option_of_yojson (value_for_key policy_name_of_yojson "Name") _list path;
     description =
       option_of_yojson (value_for_key policy_description_of_yojson "Description") _list path;
     content = option_of_yojson (value_for_key policy_content_of_yojson "Content") _list path;
   }
    : update_policy_request)

let organizational_unit_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : organizational_unit_not_found_exception)

let duplicate_organizational_unit_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : duplicate_organizational_unit_exception)

let path_of_yojson = string_of_yojson
let organizational_unit_name_of_yojson = string_of_yojson
let organizational_unit_arn_of_yojson = string_of_yojson
let organizational_unit_id_of_yojson = string_of_yojson

let organizational_unit_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key organizational_unit_id_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key organizational_unit_arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key organizational_unit_name_of_yojson "Name") _list path;
     path = option_of_yojson (value_for_key path_of_yojson "Path") _list path;
   }
    : organizational_unit)

let update_organizational_unit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organizational_unit =
       option_of_yojson
         (value_for_key organizational_unit_of_yojson "OrganizationalUnit")
         _list path;
   }
    : update_organizational_unit_response)

let update_organizational_unit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organizational_unit_id =
       value_for_key organizational_unit_id_of_yojson "OrganizationalUnitId" _list path;
     name = option_of_yojson (value_for_key organizational_unit_name_of_yojson "Name") _list path;
   }
    : update_organizational_unit_request)

let target_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : target_not_found_exception)

let tag_key_of_yojson = string_of_yojson
let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path
let taggable_resource_id_of_yojson = string_of_yojson

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key taggable_resource_id_of_yojson "ResourceId" _list path;
     tag_keys = value_for_key tag_keys_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let responsibility_transfer_already_in_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : responsibility_transfer_already_in_status_exception)

let invalid_responsibility_transfer_transition_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : invalid_responsibility_transfer_transition_exception)

let terminate_responsibility_transfer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     responsibility_transfer =
       option_of_yojson
         (value_for_key responsibility_transfer_of_yojson "ResponsibilityTransfer")
         _list path;
   }
    : terminate_responsibility_transfer_response)

let terminate_responsibility_transfer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key responsibility_transfer_id_of_yojson "Id" _list path;
     end_timestamp = option_of_yojson (value_for_key timestamp_of_yojson "EndTimestamp") _list path;
   }
    : terminate_responsibility_transfer_request)

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key taggable_resource_id_of_yojson "ResourceId" _list path;
     tags = value_for_key tags_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let master_cannot_leave_organization_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : master_cannot_leave_organization_exception)

let account_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : account_not_found_exception)

let remove_account_from_organization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ account_id = value_for_key account_id_of_yojson "AccountId" _list path }
    : remove_account_from_organization_request)

let account_already_registered_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : account_already_registered_exception)

let service_principal_of_yojson = string_of_yojson

let register_delegated_administrator_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     service_principal = value_for_key service_principal_of_yojson "ServicePrincipal" _list path;
   }
    : register_delegated_administrator_request)

let resource_policy_content_of_yojson = string_of_yojson
let resource_policy_arn_of_yojson = string_of_yojson
let resource_policy_id_of_yojson = string_of_yojson

let resource_policy_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_policy_id_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key resource_policy_arn_of_yojson "Arn") _list path;
   }
    : resource_policy_summary)

let resource_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_policy_summary =
       option_of_yojson
         (value_for_key resource_policy_summary_of_yojson "ResourcePolicySummary")
         _list path;
     content =
       option_of_yojson (value_for_key resource_policy_content_of_yojson "Content") _list path;
   }
    : resource_policy)

let put_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_policy =
       option_of_yojson (value_for_key resource_policy_of_yojson "ResourcePolicy") _list path;
   }
    : put_resource_policy_response)

let put_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     content = value_for_key resource_policy_content_of_yojson "Content" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : put_resource_policy_request)

let source_parent_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : source_parent_not_found_exception)

let duplicate_account_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : duplicate_account_exception)

let destination_parent_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : destination_parent_not_found_exception)

let parent_id_of_yojson = string_of_yojson

let move_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     source_parent_id = value_for_key parent_id_of_yojson "SourceParentId" _list path;
     destination_parent_id = value_for_key parent_id_of_yojson "DestinationParentId" _list path;
   }
    : move_account_request)

let next_token_of_yojson = string_of_yojson

let target_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT" -> ACCOUNT
    | `String "ORGANIZATIONAL_UNIT" -> ORGANIZATIONAL_UNIT
    | `String "ROOT" -> ROOT
    | `String value -> raise (deserialize_unknown_enum_value_error path "TargetType" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetType")
     : target_type)
    : target_type)

let target_name_of_yojson = string_of_yojson
let generic_arn_of_yojson = string_of_yojson
let policy_target_id_of_yojson = string_of_yojson

let policy_target_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_id = option_of_yojson (value_for_key policy_target_id_of_yojson "TargetId") _list path;
     arn = option_of_yojson (value_for_key generic_arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key target_name_of_yojson "Name") _list path;
     type_ = option_of_yojson (value_for_key target_type_of_yojson "Type") _list path;
   }
    : policy_target_summary)

let policy_targets_of_yojson tree path = list_of_yojson policy_target_summary_of_yojson tree path

let list_targets_for_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     targets = option_of_yojson (value_for_key policy_targets_of_yojson "Targets") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_targets_for_policy_response)

let max_results_of_yojson = int_of_yojson

let list_targets_for_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_id = value_for_key policy_id_of_yojson "PolicyId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_targets_for_policy_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key taggable_resource_id_of_yojson "ResourceId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_tags_for_resource_request)

let policy_type_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "PENDING_ENABLE" -> PENDING_ENABLE
    | `String "PENDING_DISABLE" -> PENDING_DISABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "PolicyTypeStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PolicyTypeStatus")
     : policy_type_status)
    : policy_type_status)

let policy_type_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key policy_type_of_yojson "Type") _list path;
     status = option_of_yojson (value_for_key policy_type_status_of_yojson "Status") _list path;
   }
    : policy_type_summary)

let policy_types_of_yojson tree path = list_of_yojson policy_type_summary_of_yojson tree path
let root_name_of_yojson = string_of_yojson
let root_arn_of_yojson = string_of_yojson
let root_id_of_yojson = string_of_yojson

let root_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key root_id_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key root_arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key root_name_of_yojson "Name") _list path;
     policy_types = option_of_yojson (value_for_key policy_types_of_yojson "PolicyTypes") _list path;
   }
    : root)

let roots_of_yojson tree path = list_of_yojson root_of_yojson tree path

let list_roots_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     roots = option_of_yojson (value_for_key roots_of_yojson "Roots") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_roots_response)

let list_roots_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_roots_request)

let policies_of_yojson tree path = list_of_yojson policy_summary_of_yojson tree path

let list_policies_for_target_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policies = option_of_yojson (value_for_key policies_of_yojson "Policies") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_policies_for_target_response)

let list_policies_for_target_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_id = value_for_key policy_target_id_of_yojson "TargetId" _list path;
     filter = value_for_key policy_type_of_yojson "Filter" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_policies_for_target_request)

let list_policies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policies = option_of_yojson (value_for_key policies_of_yojson "Policies") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_policies_response)

let list_policies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = value_for_key policy_type_of_yojson "Filter" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_policies_request)

let child_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : child_not_found_exception)

let parent_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ROOT" -> ROOT
    | `String "ORGANIZATIONAL_UNIT" -> ORGANIZATIONAL_UNIT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParentType" value)
    | _ -> raise (deserialize_wrong_type_error path "ParentType")
     : parent_type)
    : parent_type)

let parent_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key parent_id_of_yojson "Id") _list path;
     type_ = option_of_yojson (value_for_key parent_type_of_yojson "Type") _list path;
   }
    : parent)

let parents_of_yojson tree path = list_of_yojson parent_of_yojson tree path

let list_parents_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parents = option_of_yojson (value_for_key parents_of_yojson "Parents") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_parents_response)

let child_id_of_yojson = string_of_yojson

let list_parents_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     child_id = value_for_key child_id_of_yojson "ChildId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_parents_request)

let responsibility_transfers_of_yojson tree path =
  list_of_yojson responsibility_transfer_of_yojson tree path

let list_outbound_responsibility_transfers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     responsibility_transfers =
       option_of_yojson
         (value_for_key responsibility_transfers_of_yojson "ResponsibilityTransfers")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_outbound_responsibility_transfers_response)

let list_outbound_responsibility_transfers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key responsibility_transfer_type_of_yojson "Type" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_outbound_responsibility_transfers_request)

let parent_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : parent_not_found_exception)

let organizational_units_of_yojson tree path =
  list_of_yojson organizational_unit_of_yojson tree path

let list_organizational_units_for_parent_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organizational_units =
       option_of_yojson
         (value_for_key organizational_units_of_yojson "OrganizationalUnits")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_organizational_units_for_parent_response)

let list_organizational_units_for_parent_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parent_id = value_for_key parent_id_of_yojson "ParentId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_organizational_units_for_parent_request)

let list_inbound_responsibility_transfers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     responsibility_transfers =
       option_of_yojson
         (value_for_key responsibility_transfers_of_yojson "ResponsibilityTransfers")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_inbound_responsibility_transfers_response)

let list_inbound_responsibility_transfers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key responsibility_transfer_type_of_yojson "Type" _list path;
     id = option_of_yojson (value_for_key responsibility_transfer_id_of_yojson "Id") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_inbound_responsibility_transfers_request)

let handshake_resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT" -> ACCOUNT
    | `String "ORGANIZATION" -> ORGANIZATION
    | `String "ORGANIZATION_FEATURE_SET" -> ORGANIZATION_FEATURE_SET
    | `String "EMAIL" -> EMAIL
    | `String "MASTER_EMAIL" -> MASTER_EMAIL
    | `String "MASTER_NAME" -> MASTER_NAME
    | `String "NOTES" -> NOTES
    | `String "PARENT_HANDSHAKE" -> PARENT_HANDSHAKE
    | `String "RESPONSIBILITY_TRANSFER" -> RESPONSIBILITY_TRANSFER
    | `String "TRANSFER_START_TIMESTAMP" -> TRANSFER_START_TIMESTAMP
    | `String "TRANSFER_TYPE" -> TRANSFER_TYPE
    | `String "MANAGEMENT_ACCOUNT" -> MANAGEMENT_ACCOUNT
    | `String "MANAGEMENT_EMAIL" -> MANAGEMENT_EMAIL
    | `String "MANAGEMENT_NAME" -> MANAGEMENT_NAME
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "HandshakeResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "HandshakeResourceType")
     : handshake_resource_type)
    : handshake_resource_type)

let handshake_resource_value_of_yojson = string_of_yojson

let rec handshake_resources_of_yojson tree path =
  list_of_yojson handshake_resource_of_yojson tree path

and handshake_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key handshake_resource_value_of_yojson "Value") _list path;
     type_ = option_of_yojson (value_for_key handshake_resource_type_of_yojson "Type") _list path;
     resources =
       option_of_yojson (value_for_key handshake_resources_of_yojson "Resources") _list path;
   }
    : handshake_resource)

let action_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INVITE" -> INVITE_ACCOUNT_TO_ORGANIZATION
    | `String "ENABLE_ALL_FEATURES" -> ENABLE_ALL_FEATURES
    | `String "APPROVE_ALL_FEATURES" -> APPROVE_ALL_FEATURES
    | `String "ADD_ORGANIZATIONS_SERVICE_LINKED_ROLE" -> ADD_ORGANIZATIONS_SERVICE_LINKED_ROLE
    | `String "TRANSFER_RESPONSIBILITY" -> TRANSFER_RESPONSIBILITY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionType")
     : action_type)
    : action_type)

let handshake_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "REQUESTED" -> REQUESTED
    | `String "OPEN" -> OPEN
    | `String "CANCELED" -> CANCELED
    | `String "ACCEPTED" -> ACCEPTED
    | `String "DECLINED" -> DECLINED
    | `String "EXPIRED" -> EXPIRED
    | `String value -> raise (deserialize_unknown_enum_value_error path "HandshakeState" value)
    | _ -> raise (deserialize_wrong_type_error path "HandshakeState")
     : handshake_state)
    : handshake_state)

let handshake_party_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT" -> ACCOUNT
    | `String "ORGANIZATION" -> ORGANIZATION
    | `String "EMAIL" -> EMAIL
    | `String value -> raise (deserialize_unknown_enum_value_error path "HandshakePartyType" value)
    | _ -> raise (deserialize_wrong_type_error path "HandshakePartyType")
     : handshake_party_type)
    : handshake_party_type)

let handshake_party_id_of_yojson = string_of_yojson

let handshake_party_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key handshake_party_id_of_yojson "Id" _list path;
     type_ = value_for_key handshake_party_type_of_yojson "Type" _list path;
   }
    : handshake_party)

let handshake_parties_of_yojson tree path = list_of_yojson handshake_party_of_yojson tree path
let handshake_arn_of_yojson = string_of_yojson

let handshake_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key handshake_id_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key handshake_arn_of_yojson "Arn") _list path;
     parties = option_of_yojson (value_for_key handshake_parties_of_yojson "Parties") _list path;
     state = option_of_yojson (value_for_key handshake_state_of_yojson "State") _list path;
     requested_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "RequestedTimestamp") _list path;
     expiration_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "ExpirationTimestamp") _list path;
     action = option_of_yojson (value_for_key action_type_of_yojson "Action") _list path;
     resources =
       option_of_yojson (value_for_key handshake_resources_of_yojson "Resources") _list path;
   }
    : handshake)

let handshakes_of_yojson tree path = list_of_yojson handshake_of_yojson tree path

let list_handshakes_for_organization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     handshakes = option_of_yojson (value_for_key handshakes_of_yojson "Handshakes") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_handshakes_for_organization_response)

let handshake_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_type = option_of_yojson (value_for_key action_type_of_yojson "ActionType") _list path;
     parent_handshake_id =
       option_of_yojson (value_for_key handshake_id_of_yojson "ParentHandshakeId") _list path;
   }
    : handshake_filter)

let list_handshakes_for_organization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key handshake_filter_of_yojson "Filter") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_handshakes_for_organization_request)

let list_handshakes_for_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     handshakes = option_of_yojson (value_for_key handshakes_of_yojson "Handshakes") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_handshakes_for_account_response)

let list_handshakes_for_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key handshake_filter_of_yojson "Filter") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_handshakes_for_account_request)

let effective_policy_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : effective_policy_not_found_exception)

let policy_ids_of_yojson tree path = list_of_yojson policy_id_of_yojson tree path
let path_to_error_of_yojson = string_of_yojson
let error_message_of_yojson = string_of_yojson
let error_code_of_yojson = string_of_yojson

let effective_policy_validation_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "ErrorMessage") _list path;
     path_to_error =
       option_of_yojson (value_for_key path_to_error_of_yojson "PathToError") _list path;
     contributing_policies =
       option_of_yojson (value_for_key policy_ids_of_yojson "ContributingPolicies") _list path;
   }
    : effective_policy_validation_error)

let effective_policy_validation_errors_of_yojson tree path =
  list_of_yojson effective_policy_validation_error_of_yojson tree path

let effective_policy_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TAG_POLICY" -> TAG_POLICY
    | `String "BACKUP_POLICY" -> BACKUP_POLICY
    | `String "AISERVICES_OPT_OUT_POLICY" -> AISERVICES_OPT_OUT_POLICY
    | `String "CHATBOT_POLICY" -> CHATBOT_POLICY
    | `String "DECLARATIVE_POLICY_EC2" -> DECLARATIVE_POLICY_EC2
    | `String "SECURITYHUB_POLICY" -> SECURITYHUB_POLICY
    | `String "INSPECTOR_POLICY" -> INSPECTOR_POLICY
    | `String "UPGRADE_ROLLOUT_POLICY" -> UPGRADE_ROLLOUT_POLICY
    | `String "BEDROCK_POLICY" -> BEDROCK_POLICY
    | `String "S3_POLICY" -> S3_POLICY
    | `String "NETWORK_SECURITY_DIRECTOR_POLICY" -> NETWORK_SECURITY_DIRECTOR_POLICY
    | `String value -> raise (deserialize_unknown_enum_value_error path "EffectivePolicyType" value)
    | _ -> raise (deserialize_wrong_type_error path "EffectivePolicyType")
     : effective_policy_type)
    : effective_policy_type)

let list_effective_policy_validation_errors_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     policy_type =
       option_of_yojson (value_for_key effective_policy_type_of_yojson "PolicyType") _list path;
     path = option_of_yojson (value_for_key path_of_yojson "Path") _list path;
     evaluation_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "EvaluationTimestamp") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     effective_policy_validation_errors =
       option_of_yojson
         (value_for_key effective_policy_validation_errors_of_yojson
            "EffectivePolicyValidationErrors")
         _list path;
   }
    : list_effective_policy_validation_errors_response)

let list_effective_policy_validation_errors_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     policy_type = value_for_key effective_policy_type_of_yojson "PolicyType" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_effective_policy_validation_errors_request)

let account_not_registered_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : account_not_registered_exception)

let delegated_service_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_principal =
       option_of_yojson (value_for_key service_principal_of_yojson "ServicePrincipal") _list path;
     delegation_enabled_date =
       option_of_yojson (value_for_key timestamp_of_yojson "DelegationEnabledDate") _list path;
   }
    : delegated_service)

let delegated_services_of_yojson tree path = list_of_yojson delegated_service_of_yojson tree path

let list_delegated_services_for_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delegated_services =
       option_of_yojson (value_for_key delegated_services_of_yojson "DelegatedServices") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_delegated_services_for_account_response)

let list_delegated_services_for_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_delegated_services_for_account_request)

let account_joined_method_of_yojson (tree : t) path =
  ((match tree with
    | `String "INVITED" -> INVITED
    | `String "CREATED" -> CREATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccountJoinedMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "AccountJoinedMethod")
     : account_joined_method)
    : account_joined_method)

let account_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_ACTIVATION" -> PENDING_ACTIVATION
    | `String "ACTIVE" -> ACTIVE
    | `String "SUSPENDED" -> SUSPENDED
    | `String "PENDING_CLOSURE" -> PENDING_CLOSURE
    | `String "CLOSED" -> CLOSED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccountState" value)
    | _ -> raise (deserialize_wrong_type_error path "AccountState")
     : account_state)
    : account_state)

let account_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "SUSPENDED" -> SUSPENDED
    | `String "PENDING_CLOSURE" -> PENDING_CLOSURE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccountStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AccountStatus")
     : account_status)
    : account_status)

let account_name_of_yojson = string_of_yojson
let account_arn_of_yojson = string_of_yojson

let delegated_administrator_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key account_id_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key account_arn_of_yojson "Arn") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "Email") _list path;
     name = option_of_yojson (value_for_key account_name_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key account_status_of_yojson "Status") _list path;
     state = option_of_yojson (value_for_key account_state_of_yojson "State") _list path;
     joined_method =
       option_of_yojson (value_for_key account_joined_method_of_yojson "JoinedMethod") _list path;
     joined_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "JoinedTimestamp") _list path;
     delegation_enabled_date =
       option_of_yojson (value_for_key timestamp_of_yojson "DelegationEnabledDate") _list path;
   }
    : delegated_administrator)

let delegated_administrators_of_yojson tree path =
  list_of_yojson delegated_administrator_of_yojson tree path

let list_delegated_administrators_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delegated_administrators =
       option_of_yojson
         (value_for_key delegated_administrators_of_yojson "DelegatedAdministrators")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_delegated_administrators_response)

let list_delegated_administrators_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_principal =
       option_of_yojson (value_for_key service_principal_of_yojson "ServicePrincipal") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_delegated_administrators_request)

let create_account_failure_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT_LIMIT_EXCEEDED" -> ACCOUNT_LIMIT_EXCEEDED
    | `String "EMAIL_ALREADY_EXISTS" -> EMAIL_ALREADY_EXISTS
    | `String "INVALID_ADDRESS" -> INVALID_ADDRESS
    | `String "INVALID_EMAIL" -> INVALID_EMAIL
    | `String "CONCURRENT_ACCOUNT_MODIFICATION" -> CONCURRENT_ACCOUNT_MODIFICATION
    | `String "INTERNAL_FAILURE" -> INTERNAL_FAILURE
    | `String "GOVCLOUD_ACCOUNT_ALREADY_EXISTS" -> GOVCLOUD_ACCOUNT_ALREADY_EXISTS
    | `String "MISSING_BUSINESS_VALIDATION" -> MISSING_BUSINESS_VALIDATION
    | `String "FAILED_BUSINESS_VALIDATION" -> FAILED_BUSINESS_VALIDATION
    | `String "PENDING_BUSINESS_VALIDATION" -> PENDING_BUSINESS_VALIDATIONv
    | `String "INVALID_IDENTITY_FOR_BUSINESS_VALIDATION" -> INVALID_IDENTITY_FOR_BUSINESS_VALIDATION
    | `String "UNKNOWN_BUSINESS_VALIDATION" -> UNKNOWN_BUSINESS_VALIDATION
    | `String "MISSING_PAYMENT_INSTRUMENT" -> MISSING_PAYMENT_INSTRUMENT
    | `String "INVALID_PAYMENT_INSTRUMENT" -> INVALID_PAYMENT_INSTRUMENT
    | `String "UPDATE_EXISTING_RESOURCE_POLICY_WITH_TAGS_NOT_SUPPORTED" ->
        UPDATE_EXISTING_RESOURCE_POLICY_WITH_TAGS_NOT_SUPPORTED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CreateAccountFailureReason" value)
    | _ -> raise (deserialize_wrong_type_error path "CreateAccountFailureReason")
     : create_account_failure_reason)
    : create_account_failure_reason)

let create_account_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CreateAccountState" value)
    | _ -> raise (deserialize_wrong_type_error path "CreateAccountState")
     : create_account_state)
    : create_account_state)

let create_account_name_of_yojson = string_of_yojson
let create_account_request_id_of_yojson = string_of_yojson

let create_account_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key create_account_request_id_of_yojson "Id") _list path;
     account_name =
       option_of_yojson (value_for_key create_account_name_of_yojson "AccountName") _list path;
     state = option_of_yojson (value_for_key create_account_state_of_yojson "State") _list path;
     requested_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "RequestedTimestamp") _list path;
     completed_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "CompletedTimestamp") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     gov_cloud_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "GovCloudAccountId") _list path;
     failure_reason =
       option_of_yojson
         (value_for_key create_account_failure_reason_of_yojson "FailureReason")
         _list path;
   }
    : create_account_status)

let create_account_statuses_of_yojson tree path =
  list_of_yojson create_account_status_of_yojson tree path

let list_create_account_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create_account_statuses =
       option_of_yojson
         (value_for_key create_account_statuses_of_yojson "CreateAccountStatuses")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_create_account_status_response)

let create_account_states_of_yojson tree path =
  list_of_yojson create_account_state_of_yojson tree path

let list_create_account_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     states = option_of_yojson (value_for_key create_account_states_of_yojson "States") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_create_account_status_request)

let child_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT" -> ACCOUNT
    | `String "ORGANIZATIONAL_UNIT" -> ORGANIZATIONAL_UNIT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ChildType" value)
    | _ -> raise (deserialize_wrong_type_error path "ChildType")
     : child_type)
    : child_type)

let child_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key child_id_of_yojson "Id") _list path;
     type_ = option_of_yojson (value_for_key child_type_of_yojson "Type") _list path;
   }
    : child)

let children_of_yojson tree path = list_of_yojson child_of_yojson tree path

let list_children_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     children = option_of_yojson (value_for_key children_of_yojson "Children") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_children_response)

let list_children_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parent_id = value_for_key parent_id_of_yojson "ParentId" _list path;
     child_type = value_for_key child_type_of_yojson "ChildType" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_children_request)

let enabled_service_principal_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_principal =
       option_of_yojson (value_for_key service_principal_of_yojson "ServicePrincipal") _list path;
     date_enabled = option_of_yojson (value_for_key timestamp_of_yojson "DateEnabled") _list path;
   }
    : enabled_service_principal)

let enabled_service_principals_of_yojson tree path =
  list_of_yojson enabled_service_principal_of_yojson tree path

let list_aws_service_access_for_organization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled_service_principals =
       option_of_yojson
         (value_for_key enabled_service_principals_of_yojson "EnabledServicePrincipals")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_aws_service_access_for_organization_response)

let list_aws_service_access_for_organization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_aws_service_access_for_organization_request)

let paths_of_yojson tree path = list_of_yojson path_of_yojson tree path

let account_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key account_id_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key account_arn_of_yojson "Arn") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "Email") _list path;
     name = option_of_yojson (value_for_key account_name_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key account_status_of_yojson "Status") _list path;
     state = option_of_yojson (value_for_key account_state_of_yojson "State") _list path;
     paths = option_of_yojson (value_for_key paths_of_yojson "Paths") _list path;
     joined_method =
       option_of_yojson (value_for_key account_joined_method_of_yojson "JoinedMethod") _list path;
     joined_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "JoinedTimestamp") _list path;
   }
    : account)

let accounts_of_yojson tree path = list_of_yojson account_of_yojson tree path

let list_accounts_with_invalid_effective_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accounts = option_of_yojson (value_for_key accounts_of_yojson "Accounts") _list path;
     policy_type =
       option_of_yojson (value_for_key effective_policy_type_of_yojson "PolicyType") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_accounts_with_invalid_effective_policy_response)

let list_accounts_with_invalid_effective_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_type = value_for_key effective_policy_type_of_yojson "PolicyType" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_accounts_with_invalid_effective_policy_request)

let list_accounts_for_parent_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accounts = option_of_yojson (value_for_key accounts_of_yojson "Accounts") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_accounts_for_parent_response)

let list_accounts_for_parent_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parent_id = value_for_key parent_id_of_yojson "ParentId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_accounts_for_parent_request)

let list_accounts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accounts = option_of_yojson (value_for_key accounts_of_yojson "Accounts") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_accounts_response)

let list_accounts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_accounts_request)

let handshake_constraint_violation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT_NUMBER_LIMIT_EXCEEDED" -> ACCOUNT_NUMBER_LIMIT_EXCEEDED
    | `String "HANDSHAKE_RATE_LIMIT_EXCEEDED" -> HANDSHAKE_RATE_LIMIT_EXCEEDED
    | `String "ALREADY_IN_AN_ORGANIZATION" -> ALREADY_IN_AN_ORGANIZATION
    | `String "ORGANIZATION_ALREADY_HAS_ALL_FEATURES" -> ORGANIZATION_ALREADY_HAS_ALL_FEATURES
    | `String "ORGANIZATION_IS_ALREADY_PENDING_ALL_FEATURES_MIGRATION" ->
        ORGANIZATION_IS_ALREADY_PENDING_ALL_FEATURES_MIGRATION
    | `String "INVITE_DISABLED_DURING_ENABLE_ALL_FEATURES" ->
        INVITE_DISABLED_DURING_ENABLE_ALL_FEATURES
    | `String "PAYMENT_INSTRUMENT_REQUIRED" -> PAYMENT_INSTRUMENT_REQUIRED
    | `String "ORGANIZATION_FROM_DIFFERENT_SELLER_OF_RECORD" ->
        ORGANIZATION_FROM_DIFFERENT_SELLER_OF_RECORD
    | `String "ORGANIZATION_MEMBERSHIP_CHANGE_RATE_LIMIT_EXCEEDED" ->
        ORGANIZATION_MEMBERSHIP_CHANGE_RATE_LIMIT_EXCEEDED
    | `String "MANAGEMENT_ACCOUNT_EMAIL_NOT_VERIFIED" -> MANAGEMENT_ACCOUNT_EMAIL_NOT_VERIFIED
    | `String "RESPONSIBILITY_TRANSFER_ALREADY_EXISTS" -> RESPONSIBILITY_TRANSFER_ALREADY_EXISTS
    | `String "SOURCE_AND_TARGET_CANNOT_MATCH" -> SOURCE_AND_TARGET_CANNOT_MATCH
    | `String "UNUSED_PREPAYMENT_BALANCE" -> UNUSED_PREPAYMENT_BALANCE
    | `String "LEGACY_PERMISSIONS_STILL_IN_USE" -> LEGACY_PERMISSIONS_STILL_IN_USE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "HandshakeConstraintViolationExceptionReason"
             value)
    | _ -> raise (deserialize_wrong_type_error path "HandshakeConstraintViolationExceptionReason")
     : handshake_constraint_violation_exception_reason)
    : handshake_constraint_violation_exception_reason)

let handshake_constraint_violation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     reason =
       option_of_yojson
         (value_for_key handshake_constraint_violation_exception_reason_of_yojson "Reason")
         _list path;
   }
    : handshake_constraint_violation_exception)

let duplicate_handshake_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : duplicate_handshake_exception)

let invite_organization_to_transfer_responsibility_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ handshake = option_of_yojson (value_for_key handshake_of_yojson "Handshake") _list path }
    : invite_organization_to_transfer_responsibility_response)

let handshake_notes_of_yojson = string_of_yojson

let invite_organization_to_transfer_responsibility_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key responsibility_transfer_type_of_yojson "Type" _list path;
     target = value_for_key handshake_party_of_yojson "Target" _list path;
     notes = option_of_yojson (value_for_key handshake_notes_of_yojson "Notes") _list path;
     start_timestamp = value_for_key timestamp_of_yojson "StartTimestamp" _list path;
     source_name = value_for_key responsibility_transfer_name_of_yojson "SourceName" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : invite_organization_to_transfer_responsibility_request)

let finalizing_organization_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : finalizing_organization_exception)

let account_owner_not_verified_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : account_owner_not_verified_exception)

let invite_account_to_organization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ handshake = option_of_yojson (value_for_key handshake_of_yojson "Handshake") _list path }
    : invite_account_to_organization_response)

let invite_account_to_organization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target = value_for_key handshake_party_of_yojson "Target" _list path;
     notes = option_of_yojson (value_for_key handshake_notes_of_yojson "Notes") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : invite_account_to_organization_request)

let root_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : root_not_found_exception)

let policy_type_not_available_for_organization_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : policy_type_not_available_for_organization_exception)

let policy_type_already_enabled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : policy_type_already_enabled_exception)

let enable_policy_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ root = option_of_yojson (value_for_key root_of_yojson "Root") _list path }
    : enable_policy_type_response)

let enable_policy_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     root_id = value_for_key root_id_of_yojson "RootId" _list path;
     policy_type = value_for_key policy_type_of_yojson "PolicyType" _list path;
   }
    : enable_policy_type_request)

let enable_aws_service_access_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_principal = value_for_key service_principal_of_yojson "ServicePrincipal" _list path }
    : enable_aws_service_access_request)

let enable_all_features_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ handshake = option_of_yojson (value_for_key handshake_of_yojson "Handshake") _list path }
    : enable_all_features_response)

let enable_all_features_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let policy_type_not_enabled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : policy_type_not_enabled_exception)

let disable_policy_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ root = option_of_yojson (value_for_key root_of_yojson "Root") _list path }
    : disable_policy_type_response)

let disable_policy_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     root_id = value_for_key root_id_of_yojson "RootId" _list path;
     policy_type = value_for_key policy_type_of_yojson "PolicyType" _list path;
   }
    : disable_policy_type_request)

let disable_aws_service_access_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_principal = value_for_key service_principal_of_yojson "ServicePrincipal" _list path }
    : disable_aws_service_access_request)

let policy_not_attached_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : policy_not_attached_exception)

let detach_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_id = value_for_key policy_id_of_yojson "PolicyId" _list path;
     target_id = value_for_key policy_target_id_of_yojson "TargetId" _list path;
   }
    : detach_policy_request)

let describe_responsibility_transfer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     responsibility_transfer =
       option_of_yojson
         (value_for_key responsibility_transfer_of_yojson "ResponsibilityTransfer")
         _list path;
   }
    : describe_responsibility_transfer_response)

let describe_responsibility_transfer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key responsibility_transfer_id_of_yojson "Id" _list path }
    : describe_responsibility_transfer_request)

let resource_policy_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : resource_policy_not_found_exception)

let describe_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_policy =
       option_of_yojson (value_for_key resource_policy_of_yojson "ResourcePolicy") _list path;
   }
    : describe_resource_policy_response)

let describe_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy = option_of_yojson (value_for_key policy_of_yojson "Policy") _list path }
    : describe_policy_response)

let describe_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy_id = value_for_key policy_id_of_yojson "PolicyId" _list path }
    : describe_policy_request)

let describe_organizational_unit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organizational_unit =
       option_of_yojson
         (value_for_key organizational_unit_of_yojson "OrganizationalUnit")
         _list path;
   }
    : describe_organizational_unit_response)

let describe_organizational_unit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organizational_unit_id =
       value_for_key organizational_unit_id_of_yojson "OrganizationalUnitId" _list path;
   }
    : describe_organizational_unit_request)

let organization_feature_set_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL" -> ALL
    | `String "CONSOLIDATED_BILLING" -> CONSOLIDATED_BILLING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OrganizationFeatureSet" value)
    | _ -> raise (deserialize_wrong_type_error path "OrganizationFeatureSet")
     : organization_feature_set)
    : organization_feature_set)

let organization_arn_of_yojson = string_of_yojson
let organization_id_of_yojson = string_of_yojson

let organization_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key organization_id_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key organization_arn_of_yojson "Arn") _list path;
     feature_set =
       option_of_yojson (value_for_key organization_feature_set_of_yojson "FeatureSet") _list path;
     master_account_arn =
       option_of_yojson (value_for_key account_arn_of_yojson "MasterAccountArn") _list path;
     master_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "MasterAccountId") _list path;
     master_account_email =
       option_of_yojson (value_for_key email_of_yojson "MasterAccountEmail") _list path;
     available_policy_types =
       option_of_yojson (value_for_key policy_types_of_yojson "AvailablePolicyTypes") _list path;
   }
    : organization)

let describe_organization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization =
       option_of_yojson (value_for_key organization_of_yojson "Organization") _list path;
   }
    : describe_organization_response)

let handshake_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : handshake_not_found_exception)

let describe_handshake_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ handshake = option_of_yojson (value_for_key handshake_of_yojson "Handshake") _list path }
    : describe_handshake_response)

let describe_handshake_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ handshake_id = value_for_key handshake_id_of_yojson "HandshakeId" _list path }
    : describe_handshake_request)

let effective_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_content =
       option_of_yojson (value_for_key policy_content_of_yojson "PolicyContent") _list path;
     last_updated_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedTimestamp") _list path;
     target_id = option_of_yojson (value_for_key policy_target_id_of_yojson "TargetId") _list path;
     policy_type =
       option_of_yojson (value_for_key effective_policy_type_of_yojson "PolicyType") _list path;
   }
    : effective_policy)

let describe_effective_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     effective_policy =
       option_of_yojson (value_for_key effective_policy_of_yojson "EffectivePolicy") _list path;
   }
    : describe_effective_policy_response)

let describe_effective_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_type = value_for_key effective_policy_type_of_yojson "PolicyType" _list path;
     target_id = option_of_yojson (value_for_key policy_target_id_of_yojson "TargetId") _list path;
   }
    : describe_effective_policy_request)

let create_account_status_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : create_account_status_not_found_exception)

let describe_create_account_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create_account_status =
       option_of_yojson
         (value_for_key create_account_status_of_yojson "CreateAccountStatus")
         _list path;
   }
    : describe_create_account_status_response)

let describe_create_account_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create_account_request_id =
       value_for_key create_account_request_id_of_yojson "CreateAccountRequestId" _list path;
   }
    : describe_create_account_status_request)

let describe_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ account = option_of_yojson (value_for_key account_of_yojson "Account") _list path }
    : describe_account_response)

let describe_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ account_id = value_for_key account_id_of_yojson "AccountId" _list path }
    : describe_account_request)

let deregister_delegated_administrator_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     service_principal = value_for_key service_principal_of_yojson "ServicePrincipal" _list path;
   }
    : deregister_delegated_administrator_request)

let policy_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : policy_in_use_exception)

let delete_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy_id = value_for_key policy_id_of_yojson "PolicyId" _list path } : delete_policy_request)

let organizational_unit_not_empty_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : organizational_unit_not_empty_exception)

let delete_organizational_unit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organizational_unit_id =
       value_for_key organizational_unit_id_of_yojson "OrganizationalUnitId" _list path;
   }
    : delete_organizational_unit_request)

let organization_not_empty_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : organization_not_empty_exception)

let invalid_handshake_transition_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : invalid_handshake_transition_exception)

let handshake_already_in_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : handshake_already_in_state_exception)

let decline_handshake_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ handshake = option_of_yojson (value_for_key handshake_of_yojson "Handshake") _list path }
    : decline_handshake_response)

let decline_handshake_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ handshake_id = value_for_key handshake_id_of_yojson "HandshakeId" _list path }
    : decline_handshake_request)

let create_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy = option_of_yojson (value_for_key policy_of_yojson "Policy") _list path }
    : create_policy_response)

let create_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     content = value_for_key policy_content_of_yojson "Content" _list path;
     description = value_for_key policy_description_of_yojson "Description" _list path;
     name = value_for_key policy_name_of_yojson "Name" _list path;
     type_ = value_for_key policy_type_of_yojson "Type" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : create_policy_request)

let create_organizational_unit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organizational_unit =
       option_of_yojson
         (value_for_key organizational_unit_of_yojson "OrganizationalUnit")
         _list path;
   }
    : create_organizational_unit_response)

let create_organizational_unit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parent_id = value_for_key parent_id_of_yojson "ParentId" _list path;
     name = value_for_key organizational_unit_name_of_yojson "Name" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : create_organizational_unit_request)

let already_in_organization_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : already_in_organization_exception)

let access_denied_for_dependency_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCESS_DENIED_DURING_CREATE_SERVICE_LINKED_ROLE" ->
        ACCESS_DENIED_DURING_CREATE_SERVICE_LINKED_ROLE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "AccessDeniedForDependencyExceptionReason"
             value)
    | _ -> raise (deserialize_wrong_type_error path "AccessDeniedForDependencyExceptionReason")
     : access_denied_for_dependency_exception_reason)
    : access_denied_for_dependency_exception_reason)

let access_denied_for_dependency_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     reason =
       option_of_yojson
         (value_for_key access_denied_for_dependency_exception_reason_of_yojson "Reason")
         _list path;
   }
    : access_denied_for_dependency_exception)

let create_organization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization =
       option_of_yojson (value_for_key organization_of_yojson "Organization") _list path;
   }
    : create_organization_response)

let create_organization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     feature_set =
       option_of_yojson (value_for_key organization_feature_set_of_yojson "FeatureSet") _list path;
   }
    : create_organization_request)

let create_gov_cloud_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create_account_status =
       option_of_yojson
         (value_for_key create_account_status_of_yojson "CreateAccountStatus")
         _list path;
   }
    : create_gov_cloud_account_response)

let iam_user_access_to_billing_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALLOW" -> ALLOW
    | `String "DENY" -> DENY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "IAMUserAccessToBilling" value)
    | _ -> raise (deserialize_wrong_type_error path "IAMUserAccessToBilling")
     : iam_user_access_to_billing)
    : iam_user_access_to_billing)

let role_name_of_yojson = string_of_yojson

let create_gov_cloud_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     email = value_for_key email_of_yojson "Email" _list path;
     account_name = value_for_key create_account_name_of_yojson "AccountName" _list path;
     role_name = option_of_yojson (value_for_key role_name_of_yojson "RoleName") _list path;
     iam_user_access_to_billing =
       option_of_yojson
         (value_for_key iam_user_access_to_billing_of_yojson "IamUserAccessToBilling")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : create_gov_cloud_account_request)

let create_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create_account_status =
       option_of_yojson
         (value_for_key create_account_status_of_yojson "CreateAccountStatus")
         _list path;
   }
    : create_account_response)

let create_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     email = value_for_key email_of_yojson "Email" _list path;
     account_name = value_for_key create_account_name_of_yojson "AccountName" _list path;
     role_name = option_of_yojson (value_for_key role_name_of_yojson "RoleName") _list path;
     iam_user_access_to_billing =
       option_of_yojson
         (value_for_key iam_user_access_to_billing_of_yojson "IamUserAccessToBilling")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : create_account_request)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : conflict_exception)

let account_already_closed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : account_already_closed_exception)

let close_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ account_id = value_for_key account_id_of_yojson "AccountId" _list path }
    : close_account_request)

let cancel_handshake_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ handshake = option_of_yojson (value_for_key handshake_of_yojson "Handshake") _list path }
    : cancel_handshake_response)

let cancel_handshake_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ handshake_id = value_for_key handshake_id_of_yojson "HandshakeId" _list path }
    : cancel_handshake_request)

let duplicate_policy_attachment_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : duplicate_policy_attachment_exception)

let attach_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_id = value_for_key policy_id_of_yojson "PolicyId" _list path;
     target_id = value_for_key policy_target_id_of_yojson "TargetId" _list path;
   }
    : attach_policy_request)

let accept_handshake_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ handshake = option_of_yojson (value_for_key handshake_of_yojson "Handshake") _list path }
    : accept_handshake_response)

let accept_handshake_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ handshake_id = value_for_key handshake_id_of_yojson "HandshakeId" _list path }
    : accept_handshake_request)
