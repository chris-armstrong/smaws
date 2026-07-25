open Smaws_Lib.Json.DeserializeHelpers
open Types

let accept_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALLOW" -> ALLOW
    | `String "DENY" -> DENY
    | `String value -> raise (deserialize_unknown_enum_value_error path "AcceptAction" value)
    | _ -> raise (deserialize_wrong_type_error path "AcceptAction")
     : accept_action)
    : accept_action)

let error_message_of_yojson = string_of_yojson

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : access_denied_exception)

let action_failure_policy_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONTINUE" -> CONTINUE
    | `String "DROP" -> DROP
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActionFailurePolicy" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionFailurePolicy")
     : action_failure_policy)
    : action_failure_policy)

let header_value_of_yojson = string_of_yojson
let header_name_of_yojson = string_of_yojson

let add_header_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     header_name = value_for_key header_name_of_yojson "HeaderName" _list path;
     header_value = value_for_key header_value_of_yojson "HeaderValue" _list path;
   }
    : add_header_action)

let addon_instance_arn_of_yojson = string_of_yojson
let addon_name_of_yojson = string_of_yojson
let addon_subscription_id_of_yojson = string_of_yojson
let addon_instance_id_of_yojson = string_of_yojson

let addon_instance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     addon_instance_id =
       option_of_yojson (value_for_key addon_instance_id_of_yojson "AddonInstanceId") _list path;
     addon_subscription_id =
       option_of_yojson
         (value_for_key addon_subscription_id_of_yojson "AddonSubscriptionId")
         _list path;
     addon_name = option_of_yojson (value_for_key addon_name_of_yojson "AddonName") _list path;
     addon_instance_arn =
       option_of_yojson (value_for_key addon_instance_arn_of_yojson "AddonInstanceArn") _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
   }
    : addon_instance)

let addon_instances_of_yojson tree path = list_of_yojson addon_instance_of_yojson tree path
let addon_subscription_arn_of_yojson = string_of_yojson

let addon_subscription_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     addon_subscription_id =
       option_of_yojson
         (value_for_key addon_subscription_id_of_yojson "AddonSubscriptionId")
         _list path;
     addon_name = option_of_yojson (value_for_key addon_name_of_yojson "AddonName") _list path;
     addon_subscription_arn =
       option_of_yojson
         (value_for_key addon_subscription_arn_of_yojson "AddonSubscriptionArn")
         _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
   }
    : addon_subscription)

let addon_subscriptions_of_yojson tree path = list_of_yojson addon_subscription_of_yojson tree path
let address_of_yojson = string_of_yojson
let address_prefix_of_yojson = string_of_yojson

let address_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address_prefix =
       option_of_yojson (value_for_key address_prefix_of_yojson "AddressPrefix") _list path;
   }
    : address_filter)

let address_list_name_of_yojson = string_of_yojson
let address_list_arn_of_yojson = string_of_yojson
let address_list_id_of_yojson = string_of_yojson

let address_list_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address_list_id = value_for_key address_list_id_of_yojson "AddressListId" _list path;
     address_list_arn = value_for_key address_list_arn_of_yojson "AddressListArn" _list path;
     address_list_name = value_for_key address_list_name_of_yojson "AddressListName" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
     last_updated_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "LastUpdatedTimestamp" _list path;
   }
    : address_list)

let address_lists_of_yojson tree path = list_of_yojson address_list_of_yojson tree path
let address_page_size_of_yojson = int_of_yojson
let result_field_of_yojson = string_of_yojson
let analyzer_arn_of_yojson = string_of_yojson

let analysis_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     analyzer = value_for_key analyzer_arn_of_yojson "Analyzer" _list path;
     result_field = value_for_key result_field_of_yojson "ResultField" _list path;
   }
    : analysis)

let archive_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "PENDING_DELETION" -> PENDING_DELETION
    | `String value -> raise (deserialize_unknown_enum_value_error path "ArchiveState" value)
    | _ -> raise (deserialize_wrong_type_error path "ArchiveState")
     : archive_state)
    : archive_state)

let archive_name_string_of_yojson = string_of_yojson
let archive_id_string_of_yojson = string_of_yojson

let archive_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     archive_id = value_for_key archive_id_string_of_yojson "ArchiveId" _list path;
     archive_name =
       option_of_yojson (value_for_key archive_name_string_of_yojson "ArchiveName") _list path;
     archive_state =
       option_of_yojson (value_for_key archive_state_of_yojson "ArchiveState") _list path;
     last_updated_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "LastUpdatedTimestamp")
         _list path;
   }
    : archive)

let name_or_arn_of_yojson = string_of_yojson

let archive_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_failure_policy =
       option_of_yojson
         (value_for_key action_failure_policy_of_yojson "ActionFailurePolicy")
         _list path;
     target_archive = value_for_key name_or_arn_of_yojson "TargetArchive" _list path;
   }
    : archive_action)

let archive_arn_of_yojson = string_of_yojson

let archive_boolean_email_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "HAS_ATTACHMENTS" -> HAS_ATTACHMENTS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ArchiveBooleanEmailAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "ArchiveBooleanEmailAttribute")
     : archive_boolean_email_attribute)
    : archive_boolean_email_attribute)

let archive_boolean_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "IS_TRUE" -> IS_TRUE
    | `String "IS_FALSE" -> IS_FALSE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ArchiveBooleanOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "ArchiveBooleanOperator")
     : archive_boolean_operator)
    : archive_boolean_operator)

let archive_boolean_to_evaluate_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Attribute" -> Attribute (archive_boolean_email_attribute_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "ArchiveBooleanToEvaluate" unknown)
    : archive_boolean_to_evaluate)

let archive_boolean_expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluate = value_for_key archive_boolean_to_evaluate_of_yojson "Evaluate" _list path;
     operator = value_for_key archive_boolean_operator_of_yojson "Operator" _list path;
   }
    : archive_boolean_expression)

let string_value_of_yojson = string_of_yojson
let string_value_list_of_yojson tree path = list_of_yojson string_value_of_yojson tree path

let archive_string_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONTAINS" -> CONTAINS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ArchiveStringOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "ArchiveStringOperator")
     : archive_string_operator)
    : archive_string_operator)

let archive_string_email_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "TO" -> TO
    | `String "FROM" -> FROM
    | `String "CC" -> CC
    | `String "SUBJECT" -> SUBJECT
    | `String "ENVELOPE_TO" -> ENVELOPE_TO
    | `String "ENVELOPE_FROM" -> ENVELOPE_FROM
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ArchiveStringEmailAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "ArchiveStringEmailAttribute")
     : archive_string_email_attribute)
    : archive_string_email_attribute)

let archive_string_to_evaluate_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Attribute" -> Attribute (archive_string_email_attribute_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "ArchiveStringToEvaluate" unknown)
    : archive_string_to_evaluate)

let archive_string_expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluate = value_for_key archive_string_to_evaluate_of_yojson "Evaluate" _list path;
     operator = value_for_key archive_string_operator_of_yojson "Operator" _list path;
     values = value_for_key string_value_list_of_yojson "Values" _list path;
   }
    : archive_string_expression)

let archive_filter_condition_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "StringExpression" -> StringExpression (archive_string_expression_of_yojson value_ path)
   | "BooleanExpression" -> BooleanExpression (archive_boolean_expression_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "ArchiveFilterCondition" unknown)
    : archive_filter_condition)

let archive_filter_conditions_of_yojson tree path =
  list_of_yojson archive_filter_condition_of_yojson tree path

let archive_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_ =
       option_of_yojson (value_for_key archive_filter_conditions_of_yojson "Include") _list path;
     unless =
       option_of_yojson (value_for_key archive_filter_conditions_of_yojson "Unless") _list path;
   }
    : archive_filters)

let archive_id_of_yojson = string_of_yojson

let retention_period_of_yojson (tree : t) path =
  ((match tree with
    | `String "THREE_MONTHS" -> THREE_MONTHS
    | `String "SIX_MONTHS" -> SIX_MONTHS
    | `String "NINE_MONTHS" -> NINE_MONTHS
    | `String "ONE_YEAR" -> ONE_YEAR
    | `String "EIGHTEEN_MONTHS" -> EIGHTEEN_MONTHS
    | `String "TWO_YEARS" -> TWO_YEARS
    | `String "THIRTY_MONTHS" -> THIRTY_MONTHS
    | `String "THREE_YEARS" -> THREE_YEARS
    | `String "FOUR_YEARS" -> FOUR_YEARS
    | `String "FIVE_YEARS" -> FIVE_YEARS
    | `String "SIX_YEARS" -> SIX_YEARS
    | `String "SEVEN_YEARS" -> SEVEN_YEARS
    | `String "EIGHT_YEARS" -> EIGHT_YEARS
    | `String "NINE_YEARS" -> NINE_YEARS
    | `String "TEN_YEARS" -> TEN_YEARS
    | `String "PERMANENT" -> PERMANENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "RetentionPeriod" value)
    | _ -> raise (deserialize_wrong_type_error path "RetentionPeriod")
     : retention_period)
    : retention_period)

let archive_retention_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "RetentionPeriod" -> RetentionPeriod (retention_period_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "ArchiveRetention" unknown)
    : archive_retention)

let archived_message_id_of_yojson = string_of_yojson
let archives_list_of_yojson tree path = list_of_yojson archive_of_yojson tree path
let bounce_message_of_yojson = string_of_yojson
let diagnostic_message_of_yojson = string_of_yojson
let smtp_reply_code_of_yojson = string_of_yojson
let status_code_of_yojson = string_of_yojson
let email_address_of_yojson = string_of_yojson
let iam_role_arn_of_yojson = string_of_yojson

let bounce_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_failure_policy =
       option_of_yojson
         (value_for_key action_failure_policy_of_yojson "ActionFailurePolicy")
         _list path;
     role_arn = value_for_key iam_role_arn_of_yojson "RoleArn" _list path;
     sender = value_for_key email_address_of_yojson "Sender" _list path;
     status_code = value_for_key status_code_of_yojson "StatusCode" _list path;
     smtp_reply_code = value_for_key smtp_reply_code_of_yojson "SmtpReplyCode" _list path;
     diagnostic_message = value_for_key diagnostic_message_of_yojson "DiagnosticMessage" _list path;
     message = option_of_yojson (value_for_key bounce_message_of_yojson "Message") _list path;
   }
    : bounce_action)

let ca_content_of_yojson = string_of_yojson

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : conflict_exception)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : validation_exception)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : service_quota_exceeded_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_not_found_exception)

let create_addon_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ addon_instance_id = value_for_key addon_instance_id_of_yojson "AddonInstanceId" _list path }
    : create_addon_instance_response)

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let idempotency_token_of_yojson = string_of_yojson

let create_addon_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "ClientToken") _list path;
     addon_subscription_id =
       value_for_key addon_subscription_id_of_yojson "AddonSubscriptionId" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_addon_instance_request)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : throttling_exception)

let create_addon_subscription_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     addon_subscription_id =
       value_for_key addon_subscription_id_of_yojson "AddonSubscriptionId" _list path;
   }
    : create_addon_subscription_response)

let create_addon_subscription_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "ClientToken") _list path;
     addon_name = value_for_key addon_name_of_yojson "AddonName" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_addon_subscription_request)

let create_address_list_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ address_list_id = value_for_key address_list_id_of_yojson "AddressListId" _list path }
    : create_address_list_response)

let create_address_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "ClientToken") _list path;
     address_list_name = value_for_key address_list_name_of_yojson "AddressListName" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_address_list_request)

let pre_signed_url_of_yojson = string_of_yojson
let job_id_of_yojson = string_of_yojson

let create_address_list_import_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     pre_signed_url = value_for_key pre_signed_url_of_yojson "PreSignedUrl" _list path;
   }
    : create_address_list_import_job_response)

let import_data_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CSV" -> CSV
    | `String "JSON" -> JSON
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImportDataType" value)
    | _ -> raise (deserialize_wrong_type_error path "ImportDataType")
     : import_data_type)
    : import_data_type)

let import_data_format_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ import_data_type = value_for_key import_data_type_of_yojson "ImportDataType" _list path }
    : import_data_format)

let job_name_of_yojson = string_of_yojson

let create_address_list_import_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "ClientToken") _list path;
     address_list_id = value_for_key address_list_id_of_yojson "AddressListId" _list path;
     name = value_for_key job_name_of_yojson "Name" _list path;
     import_data_format = value_for_key import_data_format_of_yojson "ImportDataFormat" _list path;
   }
    : create_address_list_import_job_request)

let create_archive_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ archive_id = value_for_key archive_id_string_of_yojson "ArchiveId" _list path }
    : create_archive_response)

let kms_key_arn_of_yojson = string_of_yojson

let create_archive_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "ClientToken") _list path;
     archive_name = value_for_key archive_name_string_of_yojson "ArchiveName" _list path;
     retention = option_of_yojson (value_for_key archive_retention_of_yojson "Retention") _list path;
     kms_key_arn = option_of_yojson (value_for_key kms_key_arn_of_yojson "KmsKeyArn") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_archive_request)

let ingress_point_id_of_yojson = string_of_yojson

let create_ingress_point_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ingress_point_id = value_for_key ingress_point_id_of_yojson "IngressPointId" _list path }
    : create_ingress_point_response)

let tls_policy_of_yojson (tree : t) path =
  ((match tree with
    | `String "REQUIRED" -> REQUIRED
    | `String "OPTIONAL" -> OPTIONAL
    | `String "FIPS" -> FIPS
    | `String value -> raise (deserialize_unknown_enum_value_error path "TlsPolicy" value)
    | _ -> raise (deserialize_wrong_type_error path "TlsPolicy")
     : tls_policy)
    : tls_policy)

let vpc_endpoint_id_of_yojson = string_of_yojson

let private_network_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vpc_endpoint_id = value_for_key vpc_endpoint_id_of_yojson "VpcEndpointId" _list path }
    : private_network_configuration)

let ip_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IPV4" -> IPV4
    | `String "DUAL_STACK" -> DUAL_STACK
    | `String value -> raise (deserialize_unknown_enum_value_error path "IpType" value)
    | _ -> raise (deserialize_wrong_type_error path "IpType")
     : ip_type)
    : ip_type)

let public_network_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ip_type = value_for_key ip_type_of_yojson "IpType" _list path } : public_network_configuration)

let network_configuration_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "PublicNetworkConfiguration" ->
       PublicNetworkConfiguration (public_network_configuration_of_yojson value_ path)
   | "PrivateNetworkConfiguration" ->
       PrivateNetworkConfiguration (private_network_configuration_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "NetworkConfiguration" unknown)
    : network_configuration)

let crl_content_of_yojson = string_of_yojson

let trust_store_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ca_content = value_for_key ca_content_of_yojson "CAContent" _list path;
     crl_content = option_of_yojson (value_for_key crl_content_of_yojson "CrlContent") _list path;
     kms_key_arn = option_of_yojson (value_for_key kms_key_arn_of_yojson "KmsKeyArn") _list path;
   }
    : trust_store)

let tls_auth_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ trust_store = option_of_yojson (value_for_key trust_store_of_yojson "TrustStore") _list path }
    : tls_auth_configuration)

let secret_arn_of_yojson = string_of_yojson
let smtp_password_of_yojson = string_of_yojson

let ingress_point_configuration_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "SmtpPassword" -> SmtpPassword (smtp_password_of_yojson value_ path)
   | "SecretArn" -> SecretArn (secret_arn_of_yojson value_ path)
   | "TlsAuthConfiguration" -> TlsAuthConfiguration (tls_auth_configuration_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "IngressPointConfiguration" unknown)
    : ingress_point_configuration)

let traffic_policy_id_of_yojson = string_of_yojson
let rule_set_id_of_yojson = string_of_yojson

let ingress_point_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "OPEN" -> OPEN
    | `String "AUTH" -> AUTH
    | `String "MTLS" -> MTLS
    | `String value -> raise (deserialize_unknown_enum_value_error path "IngressPointType" value)
    | _ -> raise (deserialize_wrong_type_error path "IngressPointType")
     : ingress_point_type)
    : ingress_point_type)

let ingress_point_name_of_yojson = string_of_yojson

let create_ingress_point_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "ClientToken") _list path;
     ingress_point_name = value_for_key ingress_point_name_of_yojson "IngressPointName" _list path;
     type_ = value_for_key ingress_point_type_of_yojson "Type" _list path;
     rule_set_id = value_for_key rule_set_id_of_yojson "RuleSetId" _list path;
     traffic_policy_id = value_for_key traffic_policy_id_of_yojson "TrafficPolicyId" _list path;
     ingress_point_configuration =
       option_of_yojson
         (value_for_key ingress_point_configuration_of_yojson "IngressPointConfiguration")
         _list path;
     network_configuration =
       option_of_yojson
         (value_for_key network_configuration_of_yojson "NetworkConfiguration")
         _list path;
     tls_policy = option_of_yojson (value_for_key tls_policy_of_yojson "TlsPolicy") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_ingress_point_request)

let relay_id_of_yojson = string_of_yojson

let create_relay_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ relay_id = value_for_key relay_id_of_yojson "RelayId" _list path } : create_relay_response)

let no_authentication_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let relay_authentication_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "SecretArn" -> SecretArn (secret_arn_of_yojson value_ path)
   | "NoAuthentication" -> NoAuthentication (no_authentication_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "RelayAuthentication" unknown)
    : relay_authentication)

let relay_server_port_of_yojson = int_of_yojson
let relay_server_name_of_yojson = string_of_yojson
let relay_name_of_yojson = string_of_yojson

let create_relay_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "ClientToken") _list path;
     relay_name = value_for_key relay_name_of_yojson "RelayName" _list path;
     server_name = value_for_key relay_server_name_of_yojson "ServerName" _list path;
     server_port = value_for_key relay_server_port_of_yojson "ServerPort" _list path;
     authentication = value_for_key relay_authentication_of_yojson "Authentication" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_relay_request)

let create_rule_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule_set_id = value_for_key rule_set_id_of_yojson "RuleSetId" _list path }
    : create_rule_set_response)

let lambda_retry_time_minutes_of_yojson = int_of_yojson

let lambda_invocation_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EVENT" -> EVENT
    | `String "REQUEST_RESPONSE" -> REQUEST_RESPONSE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LambdaInvocationType" value)
    | _ -> raise (deserialize_wrong_type_error path "LambdaInvocationType")
     : lambda_invocation_type)
    : lambda_invocation_type)

let lambda_function_arn_of_yojson = string_of_yojson

let invoke_lambda_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_failure_policy =
       option_of_yojson
         (value_for_key action_failure_policy_of_yojson "ActionFailurePolicy")
         _list path;
     function_arn = value_for_key lambda_function_arn_of_yojson "FunctionArn" _list path;
     invocation_type = value_for_key lambda_invocation_type_of_yojson "InvocationType" _list path;
     role_arn = value_for_key iam_role_arn_of_yojson "RoleArn" _list path;
     retry_time_minutes =
       option_of_yojson
         (value_for_key lambda_retry_time_minutes_of_yojson "RetryTimeMinutes")
         _list path;
   }
    : invoke_lambda_action)

let sns_notification_payload_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "HEADERS" -> HEADERS
    | `String "CONTENT" -> CONTENT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SnsNotificationPayloadType" value)
    | _ -> raise (deserialize_wrong_type_error path "SnsNotificationPayloadType")
     : sns_notification_payload_type)
    : sns_notification_payload_type)

let sns_notification_encoding_of_yojson (tree : t) path =
  ((match tree with
    | `String "UTF-8" -> UTF_8
    | `String "BASE64" -> BASE64
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SnsNotificationEncoding" value)
    | _ -> raise (deserialize_wrong_type_error path "SnsNotificationEncoding")
     : sns_notification_encoding)
    : sns_notification_encoding)

let sns_topic_arn_of_yojson = string_of_yojson

let sns_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_failure_policy =
       option_of_yojson
         (value_for_key action_failure_policy_of_yojson "ActionFailurePolicy")
         _list path;
     topic_arn = value_for_key sns_topic_arn_of_yojson "TopicArn" _list path;
     role_arn = value_for_key iam_role_arn_of_yojson "RoleArn" _list path;
     encoding =
       option_of_yojson (value_for_key sns_notification_encoding_of_yojson "Encoding") _list path;
     payload_type =
       option_of_yojson
         (value_for_key sns_notification_payload_type_of_yojson "PayloadType")
         _list path;
   }
    : sns_action)

let q_business_index_id_of_yojson = string_of_yojson
let q_business_application_id_of_yojson = string_of_yojson

let deliver_to_q_business_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_failure_policy =
       option_of_yojson
         (value_for_key action_failure_policy_of_yojson "ActionFailurePolicy")
         _list path;
     application_id = value_for_key q_business_application_id_of_yojson "ApplicationId" _list path;
     index_id = value_for_key q_business_index_id_of_yojson "IndexId" _list path;
     role_arn = value_for_key iam_role_arn_of_yojson "RoleArn" _list path;
   }
    : deliver_to_q_business_action)

let deliver_to_mailbox_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_failure_policy =
       option_of_yojson
         (value_for_key action_failure_policy_of_yojson "ActionFailurePolicy")
         _list path;
     mailbox_arn = value_for_key name_or_arn_of_yojson "MailboxArn" _list path;
     role_arn = value_for_key iam_role_arn_of_yojson "RoleArn" _list path;
   }
    : deliver_to_mailbox_action)

let recipients_of_yojson tree path = list_of_yojson email_address_of_yojson tree path

let replace_recipient_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ replace_with = option_of_yojson (value_for_key recipients_of_yojson "ReplaceWith") _list path }
    : replace_recipient_action)

let send_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_failure_policy =
       option_of_yojson
         (value_for_key action_failure_policy_of_yojson "ActionFailurePolicy")
         _list path;
     role_arn = value_for_key iam_role_arn_of_yojson "RoleArn" _list path;
   }
    : send_action)

let kms_key_id_of_yojson = string_of_yojson
let s3_prefix_of_yojson = string_of_yojson
let s3_bucket_of_yojson = string_of_yojson

let s3_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_failure_policy =
       option_of_yojson
         (value_for_key action_failure_policy_of_yojson "ActionFailurePolicy")
         _list path;
     role_arn = value_for_key iam_role_arn_of_yojson "RoleArn" _list path;
     s3_bucket = value_for_key s3_bucket_of_yojson "S3Bucket" _list path;
     s3_prefix = option_of_yojson (value_for_key s3_prefix_of_yojson "S3Prefix") _list path;
     s3_sse_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "S3SseKmsKeyId") _list path;
   }
    : s3_action)

let mail_from_of_yojson (tree : t) path =
  ((match tree with
    | `String "REPLACE" -> REPLACE
    | `String "PRESERVE" -> PRESERVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "MailFrom" value)
    | _ -> raise (deserialize_wrong_type_error path "MailFrom")
     : mail_from)
    : mail_from)

let id_or_arn_of_yojson = string_of_yojson

let relay_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_failure_policy =
       option_of_yojson
         (value_for_key action_failure_policy_of_yojson "ActionFailurePolicy")
         _list path;
     relay = value_for_key id_or_arn_of_yojson "Relay" _list path;
     mail_from = option_of_yojson (value_for_key mail_from_of_yojson "MailFrom") _list path;
   }
    : relay_action)

let drop_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let rule_action_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Drop" -> Drop (drop_action_of_yojson value_ path)
   | "Relay" -> Relay (relay_action_of_yojson value_ path)
   | "Archive" -> Archive (archive_action_of_yojson value_ path)
   | "WriteToS3" -> WriteToS3 (s3_action_of_yojson value_ path)
   | "Send" -> Send (send_action_of_yojson value_ path)
   | "AddHeader" -> AddHeader (add_header_action_of_yojson value_ path)
   | "ReplaceRecipient" -> ReplaceRecipient (replace_recipient_action_of_yojson value_ path)
   | "DeliverToMailbox" -> DeliverToMailbox (deliver_to_mailbox_action_of_yojson value_ path)
   | "DeliverToQBusiness" -> DeliverToQBusiness (deliver_to_q_business_action_of_yojson value_ path)
   | "PublishToSns" -> PublishToSns (sns_action_of_yojson value_ path)
   | "Bounce" -> Bounce (bounce_action_of_yojson value_ path)
   | "InvokeLambda" -> InvokeLambda (invoke_lambda_action_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "RuleAction" unknown)
    : rule_action)

let rule_actions_of_yojson tree path = list_of_yojson rule_action_of_yojson tree path

let rule_dmarc_policy_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "QUARANTINE" -> QUARANTINE
    | `String "REJECT" -> REJECT
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleDmarcPolicy" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleDmarcPolicy")
     : rule_dmarc_policy)
    : rule_dmarc_policy)

let rule_dmarc_value_list_of_yojson tree path = list_of_yojson rule_dmarc_policy_of_yojson tree path

let rule_dmarc_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "EQUALS" -> EQUALS
    | `String "NOT_EQUALS" -> NOT_EQUALS
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleDmarcOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleDmarcOperator")
     : rule_dmarc_operator)
    : rule_dmarc_operator)

let rule_dmarc_expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operator = value_for_key rule_dmarc_operator_of_yojson "Operator" _list path;
     values = value_for_key rule_dmarc_value_list_of_yojson "Values" _list path;
   }
    : rule_dmarc_expression)

let rule_verdict_of_yojson (tree : t) path =
  ((match tree with
    | `String "PASS" -> PASS
    | `String "FAIL" -> FAIL
    | `String "GRAY" -> GRAY
    | `String "PROCESSING_FAILED" -> PROCESSING_FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleVerdict" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleVerdict")
     : rule_verdict)
    : rule_verdict)

let rule_verdict_value_list_of_yojson tree path = list_of_yojson rule_verdict_of_yojson tree path

let rule_verdict_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "EQUALS" -> EQUALS
    | `String "NOT_EQUALS" -> NOT_EQUALS
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleVerdictOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleVerdictOperator")
     : rule_verdict_operator)
    : rule_verdict_operator)

let rule_verdict_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "SPF" -> SPF
    | `String "DKIM" -> DKIM
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RuleVerdictAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleVerdictAttribute")
     : rule_verdict_attribute)
    : rule_verdict_attribute)

let rule_verdict_to_evaluate_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Attribute" -> Attribute (rule_verdict_attribute_of_yojson value_ path)
   | "Analysis" -> Analysis (analysis_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "RuleVerdictToEvaluate" unknown)
    : rule_verdict_to_evaluate)

let rule_verdict_expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluate = value_for_key rule_verdict_to_evaluate_of_yojson "Evaluate" _list path;
     operator = value_for_key rule_verdict_operator_of_yojson "Operator" _list path;
     values = value_for_key rule_verdict_value_list_of_yojson "Values" _list path;
   }
    : rule_verdict_expression)

let rule_ip_string_value_of_yojson = string_of_yojson
let rule_ip_value_list_of_yojson tree path = list_of_yojson rule_ip_string_value_of_yojson tree path

let rule_ip_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "CIDR_MATCHES" -> CIDR_MATCHES
    | `String "NOT_CIDR_MATCHES" -> NOT_CIDR_MATCHES
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleIpOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleIpOperator")
     : rule_ip_operator)
    : rule_ip_operator)

let rule_ip_email_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "SOURCE_IP" -> SOURCE_IP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RuleIpEmailAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleIpEmailAttribute")
     : rule_ip_email_attribute)
    : rule_ip_email_attribute)

let rule_ip_to_evaluate_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Attribute" -> Attribute (rule_ip_email_attribute_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "RuleIpToEvaluate" unknown)
    : rule_ip_to_evaluate)

let rule_ip_expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluate = value_for_key rule_ip_to_evaluate_of_yojson "Evaluate" _list path;
     operator = value_for_key rule_ip_operator_of_yojson "Operator" _list path;
     values = value_for_key rule_ip_value_list_of_yojson "Values" _list path;
   }
    : rule_ip_expression)

let rule_number_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "EQUALS" -> EQUALS
    | `String "NOT_EQUALS" -> NOT_EQUALS
    | `String "LESS_THAN" -> LESS_THAN
    | `String "GREATER_THAN" -> GREATER_THAN
    | `String "LESS_THAN_OR_EQUAL" -> LESS_THAN_OR_EQUAL
    | `String "GREATER_THAN_OR_EQUAL" -> GREATER_THAN_OR_EQUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleNumberOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleNumberOperator")
     : rule_number_operator)
    : rule_number_operator)

let rule_number_email_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "MESSAGE_SIZE" -> MESSAGE_SIZE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RuleNumberEmailAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleNumberEmailAttribute")
     : rule_number_email_attribute)
    : rule_number_email_attribute)

let rule_number_to_evaluate_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Attribute" -> Attribute (rule_number_email_attribute_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "RuleNumberToEvaluate" unknown)
    : rule_number_to_evaluate)

let rule_number_expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluate = value_for_key rule_number_to_evaluate_of_yojson "Evaluate" _list path;
     operator = value_for_key rule_number_operator_of_yojson "Operator" _list path;
     value =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "Value" _list path;
   }
    : rule_number_expression)

let rule_string_value_of_yojson = string_of_yojson
let rule_string_list_of_yojson tree path = list_of_yojson rule_string_value_of_yojson tree path

let rule_string_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "EQUALS" -> EQUALS
    | `String "NOT_EQUALS" -> NOT_EQUALS
    | `String "STARTS_WITH" -> STARTS_WITH
    | `String "ENDS_WITH" -> ENDS_WITH
    | `String "CONTAINS" -> CONTAINS
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleStringOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleStringOperator")
     : rule_string_operator)
    : rule_string_operator)

let rule_client_certificate_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "CN" -> CN
    | `String "SAN_RFC822_NAME" -> SAN_RFC822_NAME
    | `String "SAN_DNS_NAME" -> SAN_DNS_NAME
    | `String "SAN_DIRECTORY_NAME" -> SAN_DIRECTORY_NAME
    | `String "SAN_UNIFORM_RESOURCE_IDENTIFIER" -> SAN_UNIFORM_RESOURCE_IDENTIFIER
    | `String "SAN_IP_ADDRESS" -> SAN_IP_ADDRESS
    | `String "SAN_REGISTERED_ID" -> SAN_REGISTERED_ID
    | `String "SERIAL_NUMBER" -> SERIAL_NUMBER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RuleClientCertificateAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleClientCertificateAttribute")
     : rule_client_certificate_attribute)
    : rule_client_certificate_attribute)

let mime_header_attribute_of_yojson = string_of_yojson

let rule_string_email_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "MAIL_FROM" -> MAIL_FROM
    | `String "HELO" -> HELO
    | `String "RECIPIENT" -> RECIPIENT
    | `String "SENDER" -> SENDER
    | `String "FROM" -> FROM
    | `String "SUBJECT" -> SUBJECT
    | `String "TO" -> TO
    | `String "CC" -> CC
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RuleStringEmailAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleStringEmailAttribute")
     : rule_string_email_attribute)
    : rule_string_email_attribute)

let rule_string_to_evaluate_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Attribute" -> Attribute (rule_string_email_attribute_of_yojson value_ path)
   | "MimeHeaderAttribute" -> MimeHeaderAttribute (mime_header_attribute_of_yojson value_ path)
   | "Analysis" -> Analysis (analysis_of_yojson value_ path)
   | "ClientCertificateAttribute" ->
       ClientCertificateAttribute (rule_client_certificate_attribute_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "RuleStringToEvaluate" unknown)
    : rule_string_to_evaluate)

let rule_string_expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluate = value_for_key rule_string_to_evaluate_of_yojson "Evaluate" _list path;
     operator = value_for_key rule_string_operator_of_yojson "Operator" _list path;
     values = value_for_key rule_string_list_of_yojson "Values" _list path;
   }
    : rule_string_expression)

let rule_boolean_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "IS_TRUE" -> IS_TRUE
    | `String "IS_FALSE" -> IS_FALSE
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleBooleanOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleBooleanOperator")
     : rule_boolean_operator)
    : rule_boolean_operator)

let rule_address_list_arn_list_of_yojson tree path =
  list_of_yojson address_list_arn_of_yojson tree path

let rule_address_list_email_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "RECIPIENT" -> RECIPIENT
    | `String "MAIL_FROM" -> MAIL_FROM
    | `String "SENDER" -> SENDER
    | `String "FROM" -> FROM
    | `String "TO" -> TO
    | `String "CC" -> CC
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RuleAddressListEmailAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleAddressListEmailAttribute")
     : rule_address_list_email_attribute)
    : rule_address_list_email_attribute)

let rule_is_in_address_list_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute = value_for_key rule_address_list_email_attribute_of_yojson "Attribute" _list path;
     address_lists = value_for_key rule_address_list_arn_list_of_yojson "AddressLists" _list path;
   }
    : rule_is_in_address_list)

let rule_boolean_email_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "READ_RECEIPT_REQUESTED" -> READ_RECEIPT_REQUESTED
    | `String "TLS" -> TLS
    | `String "TLS_WRAPPED" -> TLS_WRAPPED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RuleBooleanEmailAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleBooleanEmailAttribute")
     : rule_boolean_email_attribute)
    : rule_boolean_email_attribute)

let rule_boolean_to_evaluate_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Attribute" -> Attribute (rule_boolean_email_attribute_of_yojson value_ path)
   | "Analysis" -> Analysis (analysis_of_yojson value_ path)
   | "IsInAddressList" -> IsInAddressList (rule_is_in_address_list_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "RuleBooleanToEvaluate" unknown)
    : rule_boolean_to_evaluate)

let rule_boolean_expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluate = value_for_key rule_boolean_to_evaluate_of_yojson "Evaluate" _list path;
     operator = value_for_key rule_boolean_operator_of_yojson "Operator" _list path;
   }
    : rule_boolean_expression)

let rule_condition_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "BooleanExpression" -> BooleanExpression (rule_boolean_expression_of_yojson value_ path)
   | "StringExpression" -> StringExpression (rule_string_expression_of_yojson value_ path)
   | "NumberExpression" -> NumberExpression (rule_number_expression_of_yojson value_ path)
   | "IpExpression" -> IpExpression (rule_ip_expression_of_yojson value_ path)
   | "VerdictExpression" -> VerdictExpression (rule_verdict_expression_of_yojson value_ path)
   | "DmarcExpression" -> DmarcExpression (rule_dmarc_expression_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "RuleCondition" unknown)
    : rule_condition)

let rule_conditions_of_yojson tree path = list_of_yojson rule_condition_of_yojson tree path
let rule_name_of_yojson = string_of_yojson

let rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key rule_name_of_yojson "Name") _list path;
     conditions = option_of_yojson (value_for_key rule_conditions_of_yojson "Conditions") _list path;
     unless = option_of_yojson (value_for_key rule_conditions_of_yojson "Unless") _list path;
     actions = value_for_key rule_actions_of_yojson "Actions" _list path;
   }
    : rule)

let rules_of_yojson tree path = list_of_yojson rule_of_yojson tree path
let rule_set_name_of_yojson = string_of_yojson

let create_rule_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "ClientToken") _list path;
     rule_set_name = value_for_key rule_set_name_of_yojson "RuleSetName" _list path;
     rules = value_for_key rules_of_yojson "Rules" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_rule_set_request)

let create_traffic_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ traffic_policy_id = value_for_key traffic_policy_id_of_yojson "TrafficPolicyId" _list path }
    : create_traffic_policy_response)

let max_message_size_bytes_of_yojson = int_of_yojson

let ingress_boolean_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "IS_TRUE" -> IS_TRUE
    | `String "IS_FALSE" -> IS_FALSE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "IngressBooleanOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "IngressBooleanOperator")
     : ingress_boolean_operator)
    : ingress_boolean_operator)

let ingress_address_list_arn_list_of_yojson tree path =
  list_of_yojson address_list_arn_of_yojson tree path

let ingress_address_list_email_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "RECIPIENT" -> RECIPIENT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "IngressAddressListEmailAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "IngressAddressListEmailAttribute")
     : ingress_address_list_email_attribute)
    : ingress_address_list_email_attribute)

let ingress_is_in_address_list_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute = value_for_key ingress_address_list_email_attribute_of_yojson "Attribute" _list path;
     address_lists = value_for_key ingress_address_list_arn_list_of_yojson "AddressLists" _list path;
   }
    : ingress_is_in_address_list)

let ingress_analysis_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     analyzer = value_for_key analyzer_arn_of_yojson "Analyzer" _list path;
     result_field = value_for_key result_field_of_yojson "ResultField" _list path;
   }
    : ingress_analysis)

let ingress_boolean_to_evaluate_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Analysis" -> Analysis (ingress_analysis_of_yojson value_ path)
   | "IsInAddressList" -> IsInAddressList (ingress_is_in_address_list_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "IngressBooleanToEvaluate" unknown)
    : ingress_boolean_to_evaluate)

let ingress_boolean_expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluate = value_for_key ingress_boolean_to_evaluate_of_yojson "Evaluate" _list path;
     operator = value_for_key ingress_boolean_operator_of_yojson "Operator" _list path;
   }
    : ingress_boolean_expression)

let ingress_tls_protocol_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "TLS1_2" -> TLS1_2
    | `String "TLS1_3" -> TLS1_3
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "IngressTlsProtocolAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "IngressTlsProtocolAttribute")
     : ingress_tls_protocol_attribute)
    : ingress_tls_protocol_attribute)

let ingress_tls_protocol_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "MINIMUM_TLS_VERSION" -> MINIMUM_TLS_VERSION
    | `String "IS" -> IS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "IngressTlsProtocolOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "IngressTlsProtocolOperator")
     : ingress_tls_protocol_operator)
    : ingress_tls_protocol_operator)

let ingress_tls_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "TLS_PROTOCOL" -> TLS_PROTOCOL
    | `String value -> raise (deserialize_unknown_enum_value_error path "IngressTlsAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "IngressTlsAttribute")
     : ingress_tls_attribute)
    : ingress_tls_attribute)

let ingress_tls_protocol_to_evaluate_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Attribute" -> Attribute (ingress_tls_attribute_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "IngressTlsProtocolToEvaluate" unknown)
    : ingress_tls_protocol_to_evaluate)

let ingress_tls_protocol_expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluate = value_for_key ingress_tls_protocol_to_evaluate_of_yojson "Evaluate" _list path;
     operator = value_for_key ingress_tls_protocol_operator_of_yojson "Operator" _list path;
     value = value_for_key ingress_tls_protocol_attribute_of_yojson "Value" _list path;
   }
    : ingress_tls_protocol_expression)

let ipv6_cidr_of_yojson = string_of_yojson
let ipv6_cidrs_of_yojson tree path = list_of_yojson ipv6_cidr_of_yojson tree path

let ingress_ip_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "CIDR_MATCHES" -> CIDR_MATCHES
    | `String "NOT_CIDR_MATCHES" -> NOT_CIDR_MATCHES
    | `String value -> raise (deserialize_unknown_enum_value_error path "IngressIpOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "IngressIpOperator")
     : ingress_ip_operator)
    : ingress_ip_operator)

let ingress_ipv6_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "SENDER_IPV6" -> SENDER_IPV6
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "IngressIpv6Attribute" value)
    | _ -> raise (deserialize_wrong_type_error path "IngressIpv6Attribute")
     : ingress_ipv6_attribute)
    : ingress_ipv6_attribute)

let ingress_ipv6_to_evaluate_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Attribute" -> Attribute (ingress_ipv6_attribute_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "IngressIpv6ToEvaluate" unknown)
    : ingress_ipv6_to_evaluate)

let ingress_ipv6_expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluate = value_for_key ingress_ipv6_to_evaluate_of_yojson "Evaluate" _list path;
     operator = value_for_key ingress_ip_operator_of_yojson "Operator" _list path;
     values = value_for_key ipv6_cidrs_of_yojson "Values" _list path;
   }
    : ingress_ipv6_expression)

let ipv4_cidr_of_yojson = string_of_yojson
let ipv4_cidrs_of_yojson tree path = list_of_yojson ipv4_cidr_of_yojson tree path

let ingress_ipv4_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "SENDER_IP" -> SENDER_IP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "IngressIpv4Attribute" value)
    | _ -> raise (deserialize_wrong_type_error path "IngressIpv4Attribute")
     : ingress_ipv4_attribute)
    : ingress_ipv4_attribute)

let ingress_ip_to_evaluate_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Attribute" -> Attribute (ingress_ipv4_attribute_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "IngressIpToEvaluate" unknown)
    : ingress_ip_to_evaluate)

let ingress_ipv4_expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluate = value_for_key ingress_ip_to_evaluate_of_yojson "Evaluate" _list path;
     operator = value_for_key ingress_ip_operator_of_yojson "Operator" _list path;
     values = value_for_key ipv4_cidrs_of_yojson "Values" _list path;
   }
    : ingress_ipv4_expression)

let string_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let ingress_string_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "EQUALS" -> EQUALS
    | `String "NOT_EQUALS" -> NOT_EQUALS
    | `String "STARTS_WITH" -> STARTS_WITH
    | `String "ENDS_WITH" -> ENDS_WITH
    | `String "CONTAINS" -> CONTAINS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "IngressStringOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "IngressStringOperator")
     : ingress_string_operator)
    : ingress_string_operator)

let ingress_string_email_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "RECIPIENT" -> RECIPIENT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "IngressStringEmailAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "IngressStringEmailAttribute")
     : ingress_string_email_attribute)
    : ingress_string_email_attribute)

let ingress_string_to_evaluate_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Attribute" -> Attribute (ingress_string_email_attribute_of_yojson value_ path)
   | "Analysis" -> Analysis (ingress_analysis_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "IngressStringToEvaluate" unknown)
    : ingress_string_to_evaluate)

let ingress_string_expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluate = value_for_key ingress_string_to_evaluate_of_yojson "Evaluate" _list path;
     operator = value_for_key ingress_string_operator_of_yojson "Operator" _list path;
     values = value_for_key string_list_of_yojson "Values" _list path;
   }
    : ingress_string_expression)

let policy_condition_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "StringExpression" -> StringExpression (ingress_string_expression_of_yojson value_ path)
   | "IpExpression" -> IpExpression (ingress_ipv4_expression_of_yojson value_ path)
   | "Ipv6Expression" -> Ipv6Expression (ingress_ipv6_expression_of_yojson value_ path)
   | "TlsExpression" -> TlsExpression (ingress_tls_protocol_expression_of_yojson value_ path)
   | "BooleanExpression" -> BooleanExpression (ingress_boolean_expression_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "PolicyCondition" unknown)
    : policy_condition)

let policy_conditions_of_yojson tree path = list_of_yojson policy_condition_of_yojson tree path

let policy_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conditions = value_for_key policy_conditions_of_yojson "Conditions" _list path;
     action = value_for_key accept_action_of_yojson "Action" _list path;
   }
    : policy_statement)

let policy_statement_list_of_yojson tree path = list_of_yojson policy_statement_of_yojson tree path
let traffic_policy_name_of_yojson = string_of_yojson

let create_traffic_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "ClientToken") _list path;
     traffic_policy_name =
       value_for_key traffic_policy_name_of_yojson "TrafficPolicyName" _list path;
     policy_statements = value_for_key policy_statement_list_of_yojson "PolicyStatements" _list path;
     default_action = value_for_key accept_action_of_yojson "DefaultAction" _list path;
     max_message_size_bytes =
       option_of_yojson
         (value_for_key max_message_size_bytes_of_yojson "MaxMessageSizeBytes")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_traffic_policy_request)

let delete_addon_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_addon_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ addon_instance_id = value_for_key addon_instance_id_of_yojson "AddonInstanceId" _list path }
    : delete_addon_instance_request)

let delete_addon_subscription_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_addon_subscription_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     addon_subscription_id =
       value_for_key addon_subscription_id_of_yojson "AddonSubscriptionId" _list path;
   }
    : delete_addon_subscription_request)

let delete_address_list_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_address_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ address_list_id = value_for_key address_list_id_of_yojson "AddressListId" _list path }
    : delete_address_list_request)

let delete_archive_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_archive_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ archive_id = value_for_key archive_id_string_of_yojson "ArchiveId" _list path }
    : delete_archive_request)

let delete_ingress_point_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_ingress_point_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ingress_point_id = value_for_key ingress_point_id_of_yojson "IngressPointId" _list path }
    : delete_ingress_point_request)

let delete_relay_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_relay_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ relay_id = value_for_key relay_id_of_yojson "RelayId" _list path } : delete_relay_request)

let delete_rule_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_rule_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule_set_id = value_for_key rule_set_id_of_yojson "RuleSetId" _list path }
    : delete_rule_set_request)

let delete_traffic_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_traffic_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ traffic_policy_id = value_for_key traffic_policy_id_of_yojson "TrafficPolicyId" _list path }
    : delete_traffic_policy_request)

let deregister_member_from_address_list_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let deregister_member_from_address_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address_list_id = value_for_key address_list_id_of_yojson "AddressListId" _list path;
     address = value_for_key address_of_yojson "Address" _list path;
   }
    : deregister_member_from_address_list_request)

let email_received_headers_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let envelope_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     helo =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Helo")
         _list path;
     from_ =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "From")
         _list path;
     to_ = option_of_yojson (value_for_key string_list_of_yojson "To") _list path;
   }
    : envelope)

let s3_location_of_yojson = string_of_yojson

let s3_export_destination_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_location = option_of_yojson (value_for_key s3_location_of_yojson "S3Location") _list path }
    : s3_export_destination_configuration)

let export_destination_configuration_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "S3" -> S3 (s3_export_destination_configuration_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "ExportDestinationConfiguration" unknown)
    : export_destination_configuration)

let export_id_of_yojson = string_of_yojson
let export_max_results_of_yojson = int_of_yojson

let export_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "QUEUED" -> QUEUED
    | `String "PREPROCESSING" -> PREPROCESSING
    | `String "PROCESSING" -> PROCESSING
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String "CANCELLED" -> CANCELLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExportState" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportState")
     : export_state)
    : export_state)

let export_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     submission_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "SubmissionTimestamp")
         _list path;
     completion_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CompletionTimestamp")
         _list path;
     state = option_of_yojson (value_for_key export_state_of_yojson "State") _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "ErrorMessage") _list path;
   }
    : export_status)

let export_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_id = option_of_yojson (value_for_key export_id_of_yojson "ExportId") _list path;
     status = option_of_yojson (value_for_key export_status_of_yojson "Status") _list path;
   }
    : export_summary)

let export_summary_list_of_yojson tree path = list_of_yojson export_summary_of_yojson tree path

let get_addon_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     addon_subscription_id =
       option_of_yojson
         (value_for_key addon_subscription_id_of_yojson "AddonSubscriptionId")
         _list path;
     addon_name = option_of_yojson (value_for_key addon_name_of_yojson "AddonName") _list path;
     addon_instance_arn =
       option_of_yojson (value_for_key addon_instance_arn_of_yojson "AddonInstanceArn") _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
   }
    : get_addon_instance_response)

let get_addon_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ addon_instance_id = value_for_key addon_instance_id_of_yojson "AddonInstanceId" _list path }
    : get_addon_instance_request)

let get_addon_subscription_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     addon_name = option_of_yojson (value_for_key addon_name_of_yojson "AddonName") _list path;
     addon_subscription_arn =
       option_of_yojson
         (value_for_key addon_subscription_arn_of_yojson "AddonSubscriptionArn")
         _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
   }
    : get_addon_subscription_response)

let get_addon_subscription_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     addon_subscription_id =
       value_for_key addon_subscription_id_of_yojson "AddonSubscriptionId" _list path;
   }
    : get_addon_subscription_request)

let get_address_list_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address_list_id = value_for_key address_list_id_of_yojson "AddressListId" _list path;
     address_list_arn = value_for_key address_list_arn_of_yojson "AddressListArn" _list path;
     address_list_name = value_for_key address_list_name_of_yojson "AddressListName" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
     last_updated_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "LastUpdatedTimestamp" _list path;
   }
    : get_address_list_response)

let get_address_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ address_list_id = value_for_key address_list_id_of_yojson "AddressListId" _list path }
    : get_address_list_request)

let job_items_count_of_yojson = int_of_yojson

let import_job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATED" -> CREATED
    | `String "PROCESSING" -> PROCESSING
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String "STOPPED" -> STOPPED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImportJobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ImportJobStatus")
     : import_job_status)
    : import_job_status)

let get_address_list_import_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     name = value_for_key job_name_of_yojson "Name" _list path;
     status = value_for_key import_job_status_of_yojson "Status" _list path;
     pre_signed_url = value_for_key pre_signed_url_of_yojson "PreSignedUrl" _list path;
     imported_items_count =
       option_of_yojson (value_for_key job_items_count_of_yojson "ImportedItemsCount") _list path;
     failed_items_count =
       option_of_yojson (value_for_key job_items_count_of_yojson "FailedItemsCount") _list path;
     import_data_format = value_for_key import_data_format_of_yojson "ImportDataFormat" _list path;
     address_list_id = value_for_key address_list_id_of_yojson "AddressListId" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
     start_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "StartTimestamp")
         _list path;
     completed_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CompletedTimestamp")
         _list path;
     error = option_of_yojson (value_for_key error_message_of_yojson "Error") _list path;
   }
    : get_address_list_import_job_response)

let get_address_list_import_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : get_address_list_import_job_request)

let get_archive_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     archive_id = value_for_key archive_id_string_of_yojson "ArchiveId" _list path;
     archive_name = value_for_key archive_name_string_of_yojson "ArchiveName" _list path;
     archive_arn = value_for_key archive_arn_of_yojson "ArchiveArn" _list path;
     archive_state = value_for_key archive_state_of_yojson "ArchiveState" _list path;
     retention = value_for_key archive_retention_of_yojson "Retention" _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
     last_updated_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "LastUpdatedTimestamp")
         _list path;
     kms_key_arn = option_of_yojson (value_for_key kms_key_arn_of_yojson "KmsKeyArn") _list path;
   }
    : get_archive_response)

let get_archive_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ archive_id = value_for_key archive_id_string_of_yojson "ArchiveId" _list path }
    : get_archive_request)

let get_archive_export_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     archive_id = option_of_yojson (value_for_key archive_id_of_yojson "ArchiveId") _list path;
     filters = option_of_yojson (value_for_key archive_filters_of_yojson "Filters") _list path;
     from_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "FromTimestamp")
         _list path;
     to_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "ToTimestamp")
         _list path;
     max_results =
       option_of_yojson (value_for_key export_max_results_of_yojson "MaxResults") _list path;
     export_destination_configuration =
       option_of_yojson
         (value_for_key export_destination_configuration_of_yojson "ExportDestinationConfiguration")
         _list path;
     status = option_of_yojson (value_for_key export_status_of_yojson "Status") _list path;
   }
    : get_archive_export_response)

let get_archive_export_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ export_id = value_for_key export_id_of_yojson "ExportId" _list path }
    : get_archive_export_request)

let sender_ip_address_of_yojson = string_of_yojson

let metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "Timestamp")
         _list path;
     ingress_point_id =
       option_of_yojson (value_for_key ingress_point_id_of_yojson "IngressPointId") _list path;
     traffic_policy_id =
       option_of_yojson (value_for_key traffic_policy_id_of_yojson "TrafficPolicyId") _list path;
     rule_set_id = option_of_yojson (value_for_key rule_set_id_of_yojson "RuleSetId") _list path;
     sender_hostname =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "SenderHostname")
         _list path;
     sender_ip_address =
       option_of_yojson (value_for_key sender_ip_address_of_yojson "SenderIpAddress") _list path;
     tls_cipher_suite =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "TlsCipherSuite")
         _list path;
     tls_protocol =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "TlsProtocol")
         _list path;
     sending_method =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "SendingMethod")
         _list path;
     source_identity =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "SourceIdentity")
         _list path;
     sending_pool =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "SendingPool")
         _list path;
     configuration_set =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ConfigurationSet")
         _list path;
     source_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "SourceArn")
         _list path;
   }
    : metadata)

let s3_presigned_ur_l_of_yojson = string_of_yojson

let get_archive_message_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message_download_link =
       option_of_yojson (value_for_key s3_presigned_ur_l_of_yojson "MessageDownloadLink") _list path;
     metadata = option_of_yojson (value_for_key metadata_of_yojson "Metadata") _list path;
     envelope = option_of_yojson (value_for_key envelope_of_yojson "Envelope") _list path;
   }
    : get_archive_message_response)

let get_archive_message_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     archived_message_id =
       value_for_key archived_message_id_of_yojson "ArchivedMessageId" _list path;
   }
    : get_archive_message_request)

let message_body_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Text")
         _list path;
     html =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Html")
         _list path;
     message_malformed =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "MessageMalformed")
         _list path;
   }
    : message_body)

let get_archive_message_content_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ body = option_of_yojson (value_for_key message_body_of_yojson "Body") _list path }
    : get_archive_message_content_response)

let get_archive_message_content_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     archived_message_id =
       value_for_key archived_message_id_of_yojson "ArchivedMessageId" _list path;
   }
    : get_archive_message_content_request)

let search_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "QUEUED" -> QUEUED
    | `String "RUNNING" -> RUNNING
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String "CANCELLED" -> CANCELLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SearchState" value)
    | _ -> raise (deserialize_wrong_type_error path "SearchState")
     : search_state)
    : search_state)

let search_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     submission_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "SubmissionTimestamp")
         _list path;
     completion_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CompletionTimestamp")
         _list path;
     state = option_of_yojson (value_for_key search_state_of_yojson "State") _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "ErrorMessage") _list path;
   }
    : search_status)

let search_max_results_of_yojson = int_of_yojson

let get_archive_search_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     archive_id = option_of_yojson (value_for_key archive_id_of_yojson "ArchiveId") _list path;
     filters = option_of_yojson (value_for_key archive_filters_of_yojson "Filters") _list path;
     from_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "FromTimestamp")
         _list path;
     to_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "ToTimestamp")
         _list path;
     max_results =
       option_of_yojson (value_for_key search_max_results_of_yojson "MaxResults") _list path;
     status = option_of_yojson (value_for_key search_status_of_yojson "Status") _list path;
   }
    : get_archive_search_response)

let search_id_of_yojson = string_of_yojson

let get_archive_search_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ search_id = value_for_key search_id_of_yojson "SearchId" _list path }
    : get_archive_search_request)

let row_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     archived_message_id =
       option_of_yojson (value_for_key archived_message_id_of_yojson "ArchivedMessageId") _list path;
     received_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "ReceivedTimestamp")
         _list path;
     date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Date")
         _list path;
     to_ =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "To")
         _list path;
     from_ =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "From")
         _list path;
     cc =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Cc")
         _list path;
     subject =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Subject")
         _list path;
     message_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "MessageId")
         _list path;
     has_attachments =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "HasAttachments")
         _list path;
     received_headers =
       option_of_yojson
         (value_for_key email_received_headers_list_of_yojson "ReceivedHeaders")
         _list path;
     in_reply_to =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "InReplyTo")
         _list path;
     x_mailer =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "XMailer")
         _list path;
     x_original_mailer =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "XOriginalMailer")
         _list path;
     x_priority =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "XPriority")
         _list path;
     ingress_point_id =
       option_of_yojson (value_for_key ingress_point_id_of_yojson "IngressPointId") _list path;
     sender_hostname =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "SenderHostname")
         _list path;
     sender_ip_address =
       option_of_yojson (value_for_key sender_ip_address_of_yojson "SenderIpAddress") _list path;
     envelope = option_of_yojson (value_for_key envelope_of_yojson "Envelope") _list path;
     source_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "SourceArn")
         _list path;
   }
    : row)

let rows_list_of_yojson tree path = list_of_yojson row_of_yojson tree path

let get_archive_search_results_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rows = option_of_yojson (value_for_key rows_list_of_yojson "Rows") _list path }
    : get_archive_search_results_response)

let get_archive_search_results_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ search_id = value_for_key search_id_of_yojson "SearchId" _list path }
    : get_archive_search_results_request)

let ingress_point_password_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     smtp_password_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "SmtpPasswordVersion")
         _list path;
     previous_smtp_password_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "PreviousSmtpPasswordVersion")
         _list path;
     previous_smtp_password_expiry_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "PreviousSmtpPasswordExpiryTimestamp")
         _list path;
   }
    : ingress_point_password_configuration)

let ingress_point_auth_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ingress_point_password_configuration =
       option_of_yojson
         (value_for_key ingress_point_password_configuration_of_yojson
            "IngressPointPasswordConfiguration")
         _list path;
     secret_arn = option_of_yojson (value_for_key secret_arn_of_yojson "SecretArn") _list path;
     tls_auth_configuration =
       option_of_yojson
         (value_for_key tls_auth_configuration_of_yojson "TlsAuthConfiguration")
         _list path;
   }
    : ingress_point_auth_configuration)

let ingress_point_a_record_of_yojson = string_of_yojson

let ingress_point_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PROVISIONING" -> PROVISIONING
    | `String "DEPROVISIONING" -> DEPROVISIONING
    | `String "UPDATING" -> UPDATING
    | `String "ACTIVE" -> ACTIVE
    | `String "CLOSED" -> CLOSED
    | `String "FAILED" -> FAILED
    | `String "ASSOCIATED_VPC_ENDPOINT_DOES_NOT_EXIST" -> ASSOCIATED_VPC_ENDPOINT_DOES_NOT_EXIST
    | `String value -> raise (deserialize_unknown_enum_value_error path "IngressPointStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "IngressPointStatus")
     : ingress_point_status)
    : ingress_point_status)

let ingress_point_arn_of_yojson = string_of_yojson

let get_ingress_point_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ingress_point_id = value_for_key ingress_point_id_of_yojson "IngressPointId" _list path;
     ingress_point_name = value_for_key ingress_point_name_of_yojson "IngressPointName" _list path;
     ingress_point_arn =
       option_of_yojson (value_for_key ingress_point_arn_of_yojson "IngressPointArn") _list path;
     status = option_of_yojson (value_for_key ingress_point_status_of_yojson "Status") _list path;
     type_ = option_of_yojson (value_for_key ingress_point_type_of_yojson "Type") _list path;
     a_record =
       option_of_yojson (value_for_key ingress_point_a_record_of_yojson "ARecord") _list path;
     rule_set_id = option_of_yojson (value_for_key rule_set_id_of_yojson "RuleSetId") _list path;
     traffic_policy_id =
       option_of_yojson (value_for_key traffic_policy_id_of_yojson "TrafficPolicyId") _list path;
     ingress_point_auth_configuration =
       option_of_yojson
         (value_for_key ingress_point_auth_configuration_of_yojson "IngressPointAuthConfiguration")
         _list path;
     network_configuration =
       option_of_yojson
         (value_for_key network_configuration_of_yojson "NetworkConfiguration")
         _list path;
     tls_policy = option_of_yojson (value_for_key tls_policy_of_yojson "TlsPolicy") _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
     last_updated_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "LastUpdatedTimestamp")
         _list path;
   }
    : get_ingress_point_response)

let trust_store_response_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXCLUDE" -> EXCLUDE
    | `String "INCLUDE" -> INCLUDE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TrustStoreResponseOption" value)
    | _ -> raise (deserialize_wrong_type_error path "TrustStoreResponseOption")
     : trust_store_response_option)
    : trust_store_response_option)

let get_ingress_point_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ingress_point_id = value_for_key ingress_point_id_of_yojson "IngressPointId" _list path;
     include_trust_store_contents =
       option_of_yojson
         (value_for_key trust_store_response_option_of_yojson "IncludeTrustStoreContents")
         _list path;
   }
    : get_ingress_point_request)

let get_member_of_address_list_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address = value_for_key address_of_yojson "Address" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
   }
    : get_member_of_address_list_response)

let get_member_of_address_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address_list_id = value_for_key address_list_id_of_yojson "AddressListId" _list path;
     address = value_for_key address_of_yojson "Address" _list path;
   }
    : get_member_of_address_list_request)

let relay_arn_of_yojson = string_of_yojson

let get_relay_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relay_id = value_for_key relay_id_of_yojson "RelayId" _list path;
     relay_arn = option_of_yojson (value_for_key relay_arn_of_yojson "RelayArn") _list path;
     relay_name = option_of_yojson (value_for_key relay_name_of_yojson "RelayName") _list path;
     server_name =
       option_of_yojson (value_for_key relay_server_name_of_yojson "ServerName") _list path;
     server_port =
       option_of_yojson (value_for_key relay_server_port_of_yojson "ServerPort") _list path;
     authentication =
       option_of_yojson (value_for_key relay_authentication_of_yojson "Authentication") _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
     last_modified_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "LastModifiedTimestamp")
         _list path;
   }
    : get_relay_response)

let get_relay_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ relay_id = value_for_key relay_id_of_yojson "RelayId" _list path } : get_relay_request)

let rule_set_arn_of_yojson = string_of_yojson

let get_rule_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_set_id = value_for_key rule_set_id_of_yojson "RuleSetId" _list path;
     rule_set_arn = value_for_key rule_set_arn_of_yojson "RuleSetArn" _list path;
     rule_set_name = value_for_key rule_set_name_of_yojson "RuleSetName" _list path;
     created_date =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedDate" _list path;
     last_modification_date =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "LastModificationDate" _list path;
     rules = value_for_key rules_of_yojson "Rules" _list path;
   }
    : get_rule_set_response)

let get_rule_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule_set_id = value_for_key rule_set_id_of_yojson "RuleSetId" _list path }
    : get_rule_set_request)

let traffic_policy_arn_of_yojson = string_of_yojson

let get_traffic_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     traffic_policy_name =
       value_for_key traffic_policy_name_of_yojson "TrafficPolicyName" _list path;
     traffic_policy_id = value_for_key traffic_policy_id_of_yojson "TrafficPolicyId" _list path;
     traffic_policy_arn =
       option_of_yojson (value_for_key traffic_policy_arn_of_yojson "TrafficPolicyArn") _list path;
     policy_statements =
       option_of_yojson
         (value_for_key policy_statement_list_of_yojson "PolicyStatements")
         _list path;
     max_message_size_bytes =
       option_of_yojson
         (value_for_key max_message_size_bytes_of_yojson "MaxMessageSizeBytes")
         _list path;
     default_action =
       option_of_yojson (value_for_key accept_action_of_yojson "DefaultAction") _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
     last_updated_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "LastUpdatedTimestamp")
         _list path;
   }
    : get_traffic_policy_response)

let get_traffic_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ traffic_policy_id = value_for_key traffic_policy_id_of_yojson "TrafficPolicyId" _list path }
    : get_traffic_policy_request)

let import_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     name = value_for_key job_name_of_yojson "Name" _list path;
     status = value_for_key import_job_status_of_yojson "Status" _list path;
     pre_signed_url = value_for_key pre_signed_url_of_yojson "PreSignedUrl" _list path;
     imported_items_count =
       option_of_yojson (value_for_key job_items_count_of_yojson "ImportedItemsCount") _list path;
     failed_items_count =
       option_of_yojson (value_for_key job_items_count_of_yojson "FailedItemsCount") _list path;
     import_data_format = value_for_key import_data_format_of_yojson "ImportDataFormat" _list path;
     address_list_id = value_for_key address_list_id_of_yojson "AddressListId" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
     start_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "StartTimestamp")
         _list path;
     completed_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CompletedTimestamp")
         _list path;
     error = option_of_yojson (value_for_key error_message_of_yojson "Error") _list path;
   }
    : import_job)

let import_jobs_of_yojson tree path = list_of_yojson import_job_of_yojson tree path

let ingress_point_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ingress_point_name = value_for_key ingress_point_name_of_yojson "IngressPointName" _list path;
     ingress_point_id = value_for_key ingress_point_id_of_yojson "IngressPointId" _list path;
     status = value_for_key ingress_point_status_of_yojson "Status" _list path;
     type_ = value_for_key ingress_point_type_of_yojson "Type" _list path;
     a_record =
       option_of_yojson (value_for_key ingress_point_a_record_of_yojson "ARecord") _list path;
   }
    : ingress_point)

let ingress_point_status_to_update_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "CLOSED" -> CLOSED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "IngressPointStatusToUpdate" value)
    | _ -> raise (deserialize_wrong_type_error path "IngressPointStatusToUpdate")
     : ingress_point_status_to_update)
    : ingress_point_status_to_update)

let ingress_points_list_of_yojson tree path = list_of_yojson ingress_point_of_yojson tree path
let pagination_token_of_yojson = string_of_yojson

let list_addon_instances_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     addon_instances =
       option_of_yojson (value_for_key addon_instances_of_yojson "AddonInstances") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_addon_instances_response)

let page_size_of_yojson = int_of_yojson

let list_addon_instances_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
   }
    : list_addon_instances_request)

let list_addon_subscriptions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     addon_subscriptions =
       option_of_yojson
         (value_for_key addon_subscriptions_of_yojson "AddonSubscriptions")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_addon_subscriptions_response)

let list_addon_subscriptions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
   }
    : list_addon_subscriptions_request)

let list_address_list_import_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     import_jobs = value_for_key import_jobs_of_yojson "ImportJobs" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_address_list_import_jobs_response)

let list_address_list_import_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address_list_id = value_for_key address_list_id_of_yojson "AddressListId" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
   }
    : list_address_list_import_jobs_request)

let list_address_lists_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address_lists = value_for_key address_lists_of_yojson "AddressLists" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_address_lists_response)

let list_address_lists_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
   }
    : list_address_lists_request)

let list_archive_exports_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exports = option_of_yojson (value_for_key export_summary_list_of_yojson "Exports") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_archive_exports_response)

let list_archive_exports_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     archive_id = value_for_key archive_id_of_yojson "ArchiveId" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
   }
    : list_archive_exports_request)

let search_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     search_id = option_of_yojson (value_for_key search_id_of_yojson "SearchId") _list path;
     status = option_of_yojson (value_for_key search_status_of_yojson "Status") _list path;
   }
    : search_summary)

let search_summary_list_of_yojson tree path = list_of_yojson search_summary_of_yojson tree path

let list_archive_searches_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     searches = option_of_yojson (value_for_key search_summary_list_of_yojson "Searches") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_archive_searches_response)

let list_archive_searches_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     archive_id = value_for_key archive_id_of_yojson "ArchiveId" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
   }
    : list_archive_searches_request)

let list_archives_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     archives = value_for_key archives_list_of_yojson "Archives" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_archives_response)

let list_archives_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
   }
    : list_archives_request)

let list_ingress_points_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ingress_points =
       option_of_yojson (value_for_key ingress_points_list_of_yojson "IngressPoints") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_ingress_points_response)

let list_ingress_points_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_ingress_points_request)

let saved_address_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address = value_for_key address_of_yojson "Address" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
   }
    : saved_address)

let saved_addresses_of_yojson tree path = list_of_yojson saved_address_of_yojson tree path

let list_members_of_address_list_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     addresses = value_for_key saved_addresses_of_yojson "Addresses" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_members_of_address_list_response)

let list_members_of_address_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address_list_id = value_for_key address_list_id_of_yojson "AddressListId" _list path;
     filter = option_of_yojson (value_for_key address_filter_of_yojson "Filter") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     page_size = option_of_yojson (value_for_key address_page_size_of_yojson "PageSize") _list path;
   }
    : list_members_of_address_list_request)

let relay_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relay_id = option_of_yojson (value_for_key relay_id_of_yojson "RelayId") _list path;
     relay_name = option_of_yojson (value_for_key relay_name_of_yojson "RelayName") _list path;
     last_modified_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "LastModifiedTimestamp")
         _list path;
   }
    : relay)

let relays_of_yojson tree path = list_of_yojson relay_of_yojson tree path

let list_relays_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relays = value_for_key relays_of_yojson "Relays" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_relays_response)

let list_relays_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_size =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "PageSize")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_relays_request)

let rule_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_set_id = option_of_yojson (value_for_key rule_set_id_of_yojson "RuleSetId") _list path;
     rule_set_name =
       option_of_yojson (value_for_key rule_set_name_of_yojson "RuleSetName") _list path;
     last_modification_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "LastModificationDate")
         _list path;
   }
    : rule_set)

let rule_sets_of_yojson tree path = list_of_yojson rule_set_of_yojson tree path

let list_rule_sets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_sets = value_for_key rule_sets_of_yojson "RuleSets" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_rule_sets_response)

let list_rule_sets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
   }
    : list_rule_sets_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = value_for_key tag_list_of_yojson "Tags" _list path } : list_tags_for_resource_response)

let taggable_resource_arn_of_yojson = string_of_yojson

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let traffic_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     traffic_policy_name =
       value_for_key traffic_policy_name_of_yojson "TrafficPolicyName" _list path;
     traffic_policy_id = value_for_key traffic_policy_id_of_yojson "TrafficPolicyId" _list path;
     default_action = value_for_key accept_action_of_yojson "DefaultAction" _list path;
   }
    : traffic_policy)

let traffic_policy_list_of_yojson tree path = list_of_yojson traffic_policy_of_yojson tree path

let list_traffic_policies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     traffic_policies =
       option_of_yojson (value_for_key traffic_policy_list_of_yojson "TrafficPolicies") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_traffic_policies_response)

let list_traffic_policies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_traffic_policies_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let stop_archive_search_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_archive_search_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ search_id = value_for_key search_id_of_yojson "SearchId" _list path }
    : stop_archive_search_request)

let stop_archive_export_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_archive_export_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ export_id = value_for_key export_id_of_yojson "ExportId" _list path }
    : stop_archive_export_request)

let stop_address_list_import_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_address_list_import_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : stop_address_list_import_job_request)

let start_archive_search_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ search_id = option_of_yojson (value_for_key search_id_of_yojson "SearchId") _list path }
    : start_archive_search_response)

let start_archive_search_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     archive_id = value_for_key archive_id_of_yojson "ArchiveId" _list path;
     filters = option_of_yojson (value_for_key archive_filters_of_yojson "Filters") _list path;
     from_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "FromTimestamp" _list path;
     to_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "ToTimestamp" _list path;
     max_results = value_for_key search_max_results_of_yojson "MaxResults" _list path;
   }
    : start_archive_search_request)

let start_archive_export_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ export_id = option_of_yojson (value_for_key export_id_of_yojson "ExportId") _list path }
    : start_archive_export_response)

let start_archive_export_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     archive_id = value_for_key archive_id_of_yojson "ArchiveId" _list path;
     filters = option_of_yojson (value_for_key archive_filters_of_yojson "Filters") _list path;
     from_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "FromTimestamp" _list path;
     to_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "ToTimestamp" _list path;
     max_results =
       option_of_yojson (value_for_key export_max_results_of_yojson "MaxResults") _list path;
     export_destination_configuration =
       value_for_key export_destination_configuration_of_yojson "ExportDestinationConfiguration"
         _list path;
     include_metadata =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "IncludeMetadata")
         _list path;
   }
    : start_archive_export_request)

let start_address_list_import_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let start_address_list_import_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : start_address_list_import_job_request)

let register_member_to_address_list_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let register_member_to_address_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address_list_id = value_for_key address_list_id_of_yojson "AddressListId" _list path;
     address = value_for_key address_of_yojson "Address" _list path;
   }
    : register_member_to_address_list_request)

let update_archive_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_archive_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     archive_id = value_for_key archive_id_string_of_yojson "ArchiveId" _list path;
     archive_name =
       option_of_yojson (value_for_key archive_name_string_of_yojson "ArchiveName") _list path;
     retention = option_of_yojson (value_for_key archive_retention_of_yojson "Retention") _list path;
   }
    : update_archive_request)

let update_ingress_point_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_ingress_point_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ingress_point_id = value_for_key ingress_point_id_of_yojson "IngressPointId" _list path;
     ingress_point_name =
       option_of_yojson (value_for_key ingress_point_name_of_yojson "IngressPointName") _list path;
     status_to_update =
       option_of_yojson
         (value_for_key ingress_point_status_to_update_of_yojson "StatusToUpdate")
         _list path;
     rule_set_id = option_of_yojson (value_for_key rule_set_id_of_yojson "RuleSetId") _list path;
     traffic_policy_id =
       option_of_yojson (value_for_key traffic_policy_id_of_yojson "TrafficPolicyId") _list path;
     ingress_point_configuration =
       option_of_yojson
         (value_for_key ingress_point_configuration_of_yojson "IngressPointConfiguration")
         _list path;
     tls_policy = option_of_yojson (value_for_key tls_policy_of_yojson "TlsPolicy") _list path;
   }
    : update_ingress_point_request)

let update_relay_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_relay_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relay_id = value_for_key relay_id_of_yojson "RelayId" _list path;
     relay_name = option_of_yojson (value_for_key relay_name_of_yojson "RelayName") _list path;
     server_name =
       option_of_yojson (value_for_key relay_server_name_of_yojson "ServerName") _list path;
     server_port =
       option_of_yojson (value_for_key relay_server_port_of_yojson "ServerPort") _list path;
     authentication =
       option_of_yojson (value_for_key relay_authentication_of_yojson "Authentication") _list path;
   }
    : update_relay_request)

let update_rule_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_rule_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_set_id = value_for_key rule_set_id_of_yojson "RuleSetId" _list path;
     rule_set_name =
       option_of_yojson (value_for_key rule_set_name_of_yojson "RuleSetName") _list path;
     rules = option_of_yojson (value_for_key rules_of_yojson "Rules") _list path;
   }
    : update_rule_set_request)

let update_traffic_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_traffic_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     traffic_policy_id = value_for_key traffic_policy_id_of_yojson "TrafficPolicyId" _list path;
     traffic_policy_name =
       option_of_yojson (value_for_key traffic_policy_name_of_yojson "TrafficPolicyName") _list path;
     policy_statements =
       option_of_yojson
         (value_for_key policy_statement_list_of_yojson "PolicyStatements")
         _list path;
     default_action =
       option_of_yojson (value_for_key accept_action_of_yojson "DefaultAction") _list path;
     max_message_size_bytes =
       option_of_yojson
         (value_for_key max_message_size_bytes_of_yojson "MaxMessageSizeBytes")
         _list path;
   }
    : update_traffic_policy_request)
